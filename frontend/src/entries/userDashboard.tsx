import React from 'react';
import ReactDOM from 'react-dom/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { MantineProvider, createTheme } from '@mantine/core';

import App from '@apps/userDashboard/index';

import '@mantine/core/styles.css';
import 'keen-slider/keen-slider.min.css';
import '@shared/styles/tailwind.css';

const theme = createTheme({
  scale: 1.5,
  primaryColor: 'blue',
  defaultRadius: 'xl',
});

const queryClient = new QueryClient();
const container = document.getElementById('root');
const apcCd = container.dataset.apcCd;
const apcNm = container.dataset.apcNm;
const userId = container.dataset.userId;

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <MantineProvider theme={theme}>
      <QueryClientProvider client={queryClient}>
        <App apcCd={apcCd} apcNm={apcNm} userId={userId} />
      </QueryClientProvider>
    </MantineProvider>
  </React.StrictMode>,
);
