// frontend/src/entries/agentDashboard.tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { createTheme, MantineProvider } from "@mantine/core";

// ✅ 기존 alias 사용
import App from '@apps/agentDashboard/App';
import { DashboardProvider } from '@apps/agentDashboard/state/DashboardContext';

// Styles
import '@apps/agentDashboard/styles/agentDashboard.css';
import '@shared/styles/tailwind.css';
import '@mantine/core/styles.css';
import 'keen-slider/keen-slider.min.css';

const theme = createTheme({
    primaryColor: 'blue',
    defaultRadius: 'xl',
    fontFamily:
        'Pretendard, Noto Sans KR, system-ui, -apple-system, Segoe UI, Roboto, Apple SD Gothic Neo, sans-serif',
    headings: { fontWeight: '700' },
});

const queryClient = new QueryClient({
    defaultOptions: {
        queries: {
            retry: 1,
            refetchOnWindowFocus: false,
        },
    },
});

type Boot = { apcCode?: string };

function readBoot(): Boot {
    const el = document.getElementById("react-dashboard-root");
    const s = el?.getAttribute("data-app-props");
    if (!s) return {};
    try {
        return s.trim().startsWith("{") || s.trim().startsWith("[")
            ? JSON.parse(s)
            : { apcCode: s };
    } catch {
        return { apcCode: s };
    }
}

// Mount
const rootElement = document.getElementById('react-dashboard-root');
if (rootElement) {
    const boot = readBoot();

    ReactDOM.createRoot(rootElement).render(
        <React.StrictMode>
            <MantineProvider theme={theme} defaultColorScheme="light">
                <QueryClientProvider client={queryClient}>
                    <DashboardProvider>
                        <App initialProps={boot} />
                    </DashboardProvider>
                </QueryClientProvider>
            </MantineProvider>
        </React.StrictMode>
    );
}