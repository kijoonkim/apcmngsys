// src/react/agentDashboard/main.tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './styles/agentDashboard.css';
import 'keen-slider/keen-slider.min.css';
import {QueryClient, QueryClientProvider} from "@tanstack/react-query";
import {DashboardProvider} from "@apps/agentDashboard/state/DashboardContext";
import "@shared/styles/tailwind.css";
const qc = new QueryClient();

ReactDOM.createRoot(document.getElementById('react-dashboard-root')!).render(
    <React.StrictMode>
        <QueryClientProvider client={qc}>
            <DashboardProvider>
                <App />
            </DashboardProvider>
        </QueryClientProvider>
    </React.StrictMode>
    );