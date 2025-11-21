// src/pages/userDashboard/components/ItemStatusSection.tsx
import { Stack, Group, Text, SegmentedControl } from '@mantine/core';
import { SummaryCards } from './SummaryCards';
import { DonutCharts } from './DonutCharts';
import type { ItemData } from '../types/dashboard';

interface ItemStatusSectionProps {
  viewMode: 'mm' | 'yy';
  onViewModeChange: (mode: 'mm' | 'yy') => void;
  warehouse: ItemData[];
  sorting: ItemData[];
  shipment: ItemData[];
  summaryCards: {
    warehouse: number;
    sorting: number;
    shipment: number;
  };
}

export const ItemStatusSection = ({
  viewMode,
  onViewModeChange,
  warehouse,
  sorting,
  shipment,
  summaryCards,
}: ItemStatusSectionProps) => {
  return (
    <Stack gap="md">
      <Group justify="space-between">
        <Text size="xl" fw={700}>
          품목별 현황
        </Text>
        <SegmentedControl
          value={viewMode}
          onChange={(val) => onViewModeChange(val as 'mm' | 'yy')}
          radius="xs"
          size="md"
          data={[
            { label: '월별', value: 'mm' },
            { label: '연별', value: 'yy' },
          ]}
        />
      </Group>

      <DonutCharts warehouse={warehouse} sorting={sorting} shipment={shipment} />
      <SummaryCards {...summaryCards} />
    </Stack>
  );
};
