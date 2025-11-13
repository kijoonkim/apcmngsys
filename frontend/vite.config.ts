import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';
import { readdirSync } from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

function getReactEntries() {
  const entriesDir = resolve(__dirname, 'src/entries');
  const files = readdirSync(entriesDir).filter((f) => f.endsWith('.tsx'));
  const entries = {};
  files.forEach((file) => {
    const name = file.replace('.tsx', '');
    entries[name] = resolve(entriesDir, file);
  });
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

export default defineConfig({
  plugins: [react()],
  base: './',
  publicDir: false,

  build: {
    outDir: resolve(__dirname, '../src/main/resources/static/bundles'),
    emptyOutDir: true,
    manifest: true,

    rollupOptions: {
      input: {
        ...getReactEntries(),
        ...getVanillaEntries(),
      },

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

  // ✅ PostCSS는 루트의 postcss.config.cjs가 자동으로 처리합니다
  // Vite가 자동으로 postcss.config.cjs를 찾아서 사용하므로
  // 여기서는 별도 설정이 필요 없습니다
});
