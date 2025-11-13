/* eslint-env node */
/* eslint-disable @typescript-eslint/no-var-requires */
/* eslint-disable @typescript-eslint/no-require-imports */

const inquirer = require('inquirer').default;
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

/**
 * 특정 디렉토리의 직계 항목만 가져오기 (하위 디렉토리 + TSX 파일)
 * @param {string} dirPath
 * @returns {{ type: 'dir' | 'file', name: string, path: string }[]}
 */
function getDirectoryContents(dirPath) {
  const fullPath = path.join(__dirname, dirPath);

  if (!fs.existsSync(fullPath)) {
    return [];
  }

  const items = fs.readdirSync(fullPath, { withFileTypes: true });

  return items
      .filter(item => {
        // 디렉토리 또는 .tsx 파일만
        if (item.isDirectory()) return true;
        if (item.isFile() && item.name.endsWith('.tsx')) return true;
        return false;
      })
      .map(item => ({
        type: item.isDirectory() ? 'dir' : 'file',
        name: item.name,
        path: path.join(dirPath, item.name),
      }))
      .sort((a, b) => {
        // 디렉토리 먼저, 그 다음 파일
        if (a.type === 'dir' && b.type === 'file') return -1;
        if (a.type === 'file' && b.type === 'dir') return 1;
        return a.name.localeCompare(b.name);
      });
}

/**
 * 모든 TSX 파일 목록 가져오기 (재귀)
 */
function getAllTsxFiles(dirPath = 'src/entries') {
  const fullPath = path.join(__dirname, dirPath);

  if (!fs.existsSync(fullPath)) {
    return [];
  }

  let results = [];
  const items = fs.readdirSync(fullPath, { withFileTypes: true });

  for (const item of items) {
    const itemPath = path.join(dirPath, item.name);

    if (item.isDirectory()) {
      results = results.concat(getAllTsxFiles(itemPath));
    } else if (item.isFile() && item.name.endsWith('.tsx')) {
      results.push(itemPath);
    }
  }

  return results;
}

/**
 * 트리 네비게이션으로 엔트리 선택
 */
async function selectEntryInteractive(currentPath = 'src/entries') {
  const contents = getDirectoryContents(currentPath);

  if (contents.length === 0) {
    console.log('⚠️  이 디렉토리에는 빌드 가능한 파일이 없습니다.');
    return null;
  }

  // 상대 경로 표시 (src/entries 제거)
  const displayPath = currentPath.replace(/^src\/entries\/?/, '') || 'root';

  const choices = [];

  // 루트가 아니면 뒤로가기 추가
  if (currentPath !== 'src/entries') {
    choices.push(
        new inquirer.Separator('─────────────────'),
        { name: '⬆️  상위 디렉토리로', value: '__back__' },
        new inquirer.Separator('─────────────────'),
    );
  }

  // 디렉토리와 파일 추가
  choices.push(
      ...contents.map(item => ({
        name: item.type === 'dir'
            ? `📁 ${item.name}/`
            : `📄 ${item.name}`,
        value: item,
      }))
  );

  const { selected } = await inquirer.prompt([
    {
      type: 'list',
      name: 'selected',
      message: `📍 현재 위치: ${displayPath}`,
      choices,
      pageSize: 15,
    },
  ]);

  if (selected === '__back__') {
    // 상위 디렉토리로
    const parentPath = path.dirname(currentPath);
    return selectEntryInteractive(parentPath);
  }

  if (selected.type === 'dir') {
    // 하위 디렉토리로 들어감
    return selectEntryInteractive(selected.path);
  }

  // 파일 선택됨
  return selected.path;
}

/**
 * 메인 함수
 */
async function main() {
  console.log('🚀 APC 프론트엔드 빌드 도구\n');

  // 1. 빌드 모드 선택
  const { buildMode } = await inquirer.prompt([
    {
      type: 'list',
      name: 'buildMode',
      message: '빌드 모드를 선택하세요:',
      choices: [
        { name: '📦 전체 빌드 (all entries)', value: 'all' },
        { name: '🎯 단일 엔트리 빌드 (단일 파일 선택)', value: 'single' },
        { name: '📋 단일 엔트리 빌드 (패키지 하위 전체)', value: 'list' },
      ],
    },
  ]);

  let targetFile = null;

  if (buildMode === 'all') {
    console.log('\n📦 전체 엔트리 빌드 중...\n');
    execSync('npx vite build', { stdio: 'inherit', shell: true });
    return;
  }

  if (buildMode === 'single') {
    // 트리 네비게이션
    targetFile = await selectEntryInteractive();

    if (!targetFile) {
      console.log('❌ 선택이 취소되었습니다.');
      return;
    }
  } else if (buildMode === 'list') {
    // 기존 방식 (전체 목록)
    const allFiles = getAllTsxFiles();

    if (allFiles.length === 0) {
      console.log('⚠️  src/entries/**/*.tsx 엔트리가 없습니다.');
      return;
    }

    const entries = allFiles.map(f => ({
      name: f.replace('src/entries/', ''),
      value: f,
    }));

    const { selected } = await inquirer.prompt([
      {
        type: 'list',
        name: 'selected',
        message: '빌드할 엔트리를 선택하세요:',
        choices: entries,
        pageSize: 15,
      },
    ]);

    targetFile = selected;
  }

  // 2. 선택된 파일 빌드
  const entryName = path.basename(targetFile, '.tsx');
  const displayPath = targetFile.replace('src/entries/', '');

  console.log(`\n📦 "${displayPath}" 빌드 중...\n`);

  execSync(`npx cross-env BUILD_TARGET=${entryName} npx vite build`, {
    stdio: 'inherit',
    shell: true,
  });

  console.log(`\n✅ 빌드 완료: ${entryName}.js`);
  console.log(`📁 출력 위치: src/main/resources/static/bundles/`);
}

main().catch((err) => {
  console.error('❌ build-select 실행 중 오류:', err);
  process.exit(1);
});
