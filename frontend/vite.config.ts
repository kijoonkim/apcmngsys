import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';
import { resolve, dirname, join, relative } from 'path';
import { fileURLToPath } from 'url';
import { readdirSync, statSync } from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

function getReactEntries() {
  const entriesDir = resolve(__dirname, 'src/entries');
  const entries = {};

  function scanDirectory(dir) {
    const items = readdirSync(dir);

    items.forEach((item) => {
      const fullPath = join(dir, item);
      const stat = statSync(fullPath);

      if (stat.isDirectory()) {
        scanDirectory(fullPath); // ← 이게 핵심! 하위 폴더도 스캔
      } else if (item.endsWith('.tsx')) {
        const relativePath = relative(entriesDir, fullPath);
        const name = relativePath.replace(/\.tsx$/, '').replace(/\\/g, '/');
        entries[name] = fullPath;
      }
    });
  }

  scanDirectory(entriesDir);
  console.log('📦 Found React entries:', Object.keys(entries));
  return entries;
}

function getVanillaEntries() {
  const vanillaDir = resolve(__dirname, 'src/vanilla');
  const files = readdirSync(vanillaDir).filter((f) => f.endsWith('.ts') || f.endsWith('.js'));
  const entries = {};
  files.forEach((file) => {
    const name = file.replace(/\.(ts|js)$/, '');
    entries[name] = resolve(vanillaDir, file);
  });
  return entries;
}

// ✅ BUILD_TARGET 환경변수 확인
function getBuildInput() {
  const buildTarget = process.env.BUILD_TARGET;

  if (buildTarget) {
    // 단일 파일 빌드
    console.log(`🎯 단일 빌드 모드: ${buildTarget}`);

    const allEntries = {
      ...getReactEntries(),
      ...getVanillaEntries(),
    };

    if (!allEntries[buildTarget]) {
      console.error(`❌ 엔트리를 찾을 수 없습니다: ${buildTarget}`);
      console.log('사용 가능한 엔트리:', Object.keys(allEntries));
      process.exit(1);
    }

    return {
      [buildTarget]: allEntries[buildTarget],
    };
  }

  // 전체 빌드
  console.log('📦 전체 빌드 모드');
  return {
    ...getReactEntries(),
    ...getVanillaEntries(),
  };
}

export default defineConfig({
  plugins: [react()],
  base: './',
  publicDir: false,

  build: {
    outDir: resolve(__dirname, '../src/main/resources/static/bundles'),
    emptyOutDir: false,
    manifest: true,

    rollupOptions: {
      input: getBuildInput(), // ✅ 동적으로 input 결정

      output: {
        entryFileNames: '[name].js',
        chunkFileNames: '[name]-[hash].js',
        assetFileNames: (asset) => {
          if (asset.name?.endsWith('.css')) {
            return '[name].css';
          }
          return 'assets/[name]-[hash][extname]';
        },
      },
    },
  },

  resolve: {
    alias: {
      '@apps': resolve(__dirname, 'src/react/apps'),
      '@shared': resolve(__dirname, 'src/react/shared'),
      '@ui': resolve(__dirname, 'src/react/shared/components/ui'),
      '@lib': resolve(__dirname, 'src/react/shared/lib'),
      '@hooks': resolve(__dirname, 'src/react/shared/hooks'),
      '@types': resolve(__dirname, 'src/react/shared/types'),
      '@assets': resolve(__dirname, 'src/react/assets'),
      '@': resolve(__dirname, 'src'),
      '@components': resolve(__dirname, 'src/components'),
      '@common': resolve(__dirname, 'src/common'),
      '@entries': resolve(__dirname, 'src/entries'),
      '@vanilla': resolve(__dirname, 'src/vanilla'),
    },
    extensions: ['.tsx', '.ts', '.jsx', '.js', '.json', '.css'],
  },

  server: {
    proxy: {
      '^/(am|co)': {
        target: 'http://localhost:8080',
        changeOrigin: true,
      },
    },
  },
});
