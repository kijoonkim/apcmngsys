// src/react/agentDashboard/main.tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './ApcDashboard';
import './styles/agentDashboard.css';
import 'keen-slider/keen-slider.min.css';
import {QueryClient, QueryClientProvider} from "@tanstack/react-query";
import {DashboardProvider} from "@apps/agentDashboard/state/DashboardContext";
import "@shared/styles/tailwind.css";
import {createTheme, MantineProvider} from "@mantine/core";
import '@mantine/core/styles.css';

const theme = createTheme({
    primaryColor: 'blue',
    defaultRadius: 'xl',
    fontFamily:
        'Pretendard, Noto Sans KR, system-ui, -apple-system, Segoe UI, Roboto, Apple SD Gothic Neo, sans-serif',
    headings: { fontWeight: '700' },
});

const qc = new QueryClient();

// ReactDOM.createRoot(document.getElementById('react-dashboard-root')!).render(
//     <React.StrictMode>
//         <QueryClientProvider client={qc}>
//             <DashboardProvider>
//                 <App />
//             </DashboardProvider>
//         </QueryClientProvider>
//     </React.StrictMode>
//     );
type Boot = { apcCode?: string; };

function readBoot(): Boot {
    const el = document.getElementById("react-dashboard-root");
    const s = el?.getAttribute("data-app-props");
    if (!s) return {};
    try {
        // JSON 형태면 파싱, 아니면 단일 문자열로 해석
        return s.trim().startsWith("{") || s.trim().startsWith("[")
            ? JSON.parse(s)
            : { apcCode: s };
    } catch {
        return { apcCode: s }; // 파싱 실패 시 폴백
    }
}
const boot = readBoot();

ReactDOM.createRoot(document.getElementById('react-dashboard-root')!).render(
    <MantineProvider theme={theme} defaultColorScheme="light">
        <App initialProps={boot} />
    </MantineProvider>
);