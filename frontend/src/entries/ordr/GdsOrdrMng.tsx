import React from 'react';
import ReactDOM from 'react-dom/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { MantineProvider, createTheme } from '@mantine/core';

import { ModuleRegistry } from 'ag-grid-community';
import { AllCommunityModule } from 'ag-grid-community';
ModuleRegistry.registerModules([AllCommunityModule]); // 렌더링 전에 실행

import App from '@apps/ordr/GdsOrdrMng';

import '@mantine/core/styles.css';
import 'keen-slider/keen-slider.min.css';
import '@shared/styles/tailwind.css';

const theme = createTheme({
  primaryColor: 'blue',
  defaultRadius: 'xl',
});

const queryClient = new QueryClient();
const container = document.getElementById('root');
const apcCd = container.dataset.apcCd;
const apcNm = container.dataset.apcNm;
const sysPrgrmId = container.dataset.sysPrgrmId;

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <MantineProvider theme={theme}>
      <QueryClientProvider client={queryClient}>
        <App apcCd={apcCd} apcNm={apcNm} sysPrgrmId={sysPrgrmId} />
      </QueryClientProvider>
    </MantineProvider>
  </React.StrictMode>,
);
