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

ReactDOM.createRoot(document.getElementById('react-dashboard-root')!).render(
    <MantineProvider theme={theme} defaultColorScheme="light">
        <App />
    </MantineProvider>
);