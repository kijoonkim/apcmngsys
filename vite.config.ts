import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';
import tailwindcss from '@tailwindcss/vite';
import path, { dirname,resolve } from 'path';
import {fileURLToPath} from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

export default defineConfig({
    plugins: [react(), tailwindcss()],
    build: {
        outDir: 'src/main/resources/static',
        emptyOutDir: false,
        rollupOptions: {
            input: {
                // 기존 엔트리들 유지
                view:      resolve(__dirname, 'src/view/index.ts'),
                dashboard: resolve(__dirname, 'src/dashboard/index.ts'),
                sheet:     resolve(__dirname, 'src/sheet/index.ts'),
                // 신규 리액트 대시보드
                agentDashboard: resolve(__dirname, 'src/react/apps/agentDashboard/main.tsx'),
            },
            output: {
                entryFileNames: 'js/out/[name].bundle.js',
                chunkFileNames: 'js/out/[name].chunk.js',
                assetFileNames: (asset) =>
                    asset.name?.endsWith('.css') ? 'css/[name][extname]' : 'assets/[name][extname]',
            },
        },
    },
    resolve: {
        alias: {
            "@apps":   path.resolve(__dirname, "src/react/apps"),
            "@shared": path.resolve(__dirname, "src/react/shared"),
            "@ui":     path.resolve(__dirname, "src/react/shared/components/ui"),
            "@lib":    path.resolve(__dirname, "src/react/shared/lib"),
            "@hooks":  path.resolve(__dirname, "src/react/shared/hooks"),
            "@types":  path.resolve(__dirname, "src/react/shared/types"),
            "@assets": path.resolve(__dirname, "src/react/assets"),
        },
        extensions: ['.ts', '.tsx', '.js', '.jsx', '.json', '.css'],
    },
    // server:{
    //     proxy: {
    //         '/api': 'http://localhost:8080',
    //         '/openapi': 'https://api.public.go.kr',
    //     }
    // }
});