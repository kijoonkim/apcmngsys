// src/pages/userDashboard/components/TrendSection.tsx
import { Stack, Group, Text, SegmentedControl } from '@mantine/core';
import { TrendBarChart } from './TrendBarChart';

interface TrendSectionProps {
  trendType: '01' | '02' | '03';
  onTrendTypeChange: (type: '01' | '02' | '03') => void;
  chartData: Array<{ name: string; data: number[] }>;
  labels: string[];
}

export const TrendSection = ({
  trendType,
  onTrendTypeChange,
  chartData,
  labels,
}: TrendSectionProps) => {
  return (
    <Stack gap="md">
      <Group justify="space-between">
        <Text size="xl" fw={700}>
          품목별 추이
        </Text>
        <SegmentedControl
          value={trendType}
          onChange={(val) => onTrendTypeChange(val as '01' | '02' | '03')}
          radius="xs"
          size="md"
          data={[
            { label: '입고', value: '01' },
            { label: '선별', value: '02' },
            { label: '출하', value: '03' },
          ]}
        />
      </Group>

      <TrendBarChart data={chartData} labels={labels} />
    </Stack>
  );
};
