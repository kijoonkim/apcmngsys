// src/pages/userDashboard/index.tsx
import { useState } from 'react';
import { MantineProvider, Stack, Grid } from '@mantine/core';
import { format } from 'date-fns';
import { ControlPanel } from './components/ControlPanel';
import { TrendSection } from './components/TrendSection';
import { useDashboardData, useMenuHistory } from './hooks/useDashboardData';
import { useChartData } from './hooks/useChartData';
import { useTrendData } from './hooks/useTrendData';
import AIAssistant from '@apps/agentDashboard/component/AiChat';
import '@mantine/core/styles.css';
import '@mantine/dates/styles.css';

export const Dashboard = ({ apcCd, apcNm, sysPrgrmId, userId }) => {
  const [selectedApc, setSelectedApc] = useState(apcCd);
  const [baseDate, setBaseDate] = useState(new Date());
  const [viewMode, setViewMode] = useState<'mm' | 'yy'>('mm');
  const [trendType, setTrendType] = useState<'01' | '02' | '03'>('01');

  const {
    data,
    loading: dashboardLoading,
    error: dashboardError,
  } = useDashboardData(selectedApc, format(baseDate, 'yyyyMMdd'));

  const currentData =
    viewMode === 'mm'
      ? { items: data?.itemMM, summary: data?.summaryMM }
      : { items: data?.itemYY, summary: data?.summaryYY };

  const chartData = useChartData(currentData.items, currentData.summary);
  const trendData = useTrendData(data?.trendData, trendType, baseDate);

  const { menuHistoryData, loading: menuLoading, error: menuError } = useMenuHistory(userId);

  return (
    <MantineProvider>
      <Stack gap="md" p="md" h="100vh" styles={{ root: { height: '100%' } }}>
        <Grid
          gutter="xs"
          h="100%"
          styles={{
            root: { height: '100%' },
            inner: { height: '100%' },
          }}
        >
          <Grid.Col
            span={6}
            style={{ display: 'flex', flexDirection: 'column', gap: '3vh', height: '100%' }}
          >
            <ControlPanel
              selectedApc={selectedApc}
              onApcChange={setSelectedApc}
              baseDate={baseDate}
              onDateChange={setBaseDate}
              viewMode={viewMode}
              onViewModeChange={setViewMode}
              summaryCards={chartData.cards}
              loading={dashboardLoading} // 👈 이름 바꿈
              menuHistory={menuHistoryData} // 👈 메뉴 히스토리 전달
              menuLoading={menuLoading} // 👈 메뉴 로딩 상태
            />
            <TrendSection
              trendType={trendType}
              onTrendTypeChange={setTrendType}
              chartData={trendData.chartData}
              labels={trendData.labels}
            />
          </Grid.Col>

          <Grid.Col span={6}>
            <AIAssistant apcCd={apcCd} apcNm={apcNm} />
          </Grid.Col>
        </Grid>
      </Stack>
    </MantineProvider>
  );
};

export default Dashboard;
