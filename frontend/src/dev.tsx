import React from 'react';
import ReactDOM from 'react-dom/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { MantineProvider, createTheme } from '@mantine/core';

import { ModuleRegistry } from 'ag-grid-community';
import { AllCommunityModule } from 'ag-grid-community';
ModuleRegistry.registerModules([AllCommunityModule]); // 렌더링 전에 실행

import App from '@apps/spmt/App';

import '@mantine/core/styles.css';
import 'keen-slider/keen-slider.min.css';
import '@shared/styles/tailwind.css';

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
  </React.StrictMode>,
);
