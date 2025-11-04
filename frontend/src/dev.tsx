import React from 'react';
import ReactDOM from 'react-dom/client';
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { MantineProvider, createTheme } from "@mantine/core";

import App from '@apps/agentDashboard/App';

// Styles
import '@shared/styles/tailwind.css';
import '@mantine/core/styles.css';
import 'keen-slider/keen-slider.min.css';

const theme = createTheme({
    primaryColor: 'blue',
    defaultRadius: 'xl',
});

const queryClient = new QueryClient();

ReactDOM.createRoot(document.getElementById('root')!).render(
    <React.StrictMode>
        <MantineProvider theme={theme}>
            <QueryClientProvider client={queryClient}>
                <App initialProps={{ apcCode: 'DEV-001' }} />
            </QueryClientProvider>
        </MantineProvider>
    </React.StrictMode>
);
