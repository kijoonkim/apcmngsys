// src/pages/userDashboard/components/TrendBarChart.tsx
import { Paper, Text, Center } from '@mantine/core';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';

interface TrendBarChartProps {
  data: Array<{ name: string; data: number[] }>;
  labels: string[];
}

const COLORS = ['#f45d8b', '#19b394', '#1956b3', '#aeb0b3'];

export const TrendBarChart = ({ data, labels }: TrendBarChartProps) => {
  if (!data || data.length === 0) {
    return (
      <Paper withBorder p="md" h={400} radius="xs">
        <Center h="100%">
          <Text c="dimmed">데이터가 없습니다.</Text>
        </Center>
      </Paper>
    );
  }

  // Recharts 포맷으로 변환
  const chartData = labels.map((label, i) => {
    const dataPoint: any = { month: label };
    data.forEach((series) => {
      dataPoint[series.name] = series.data[i];
    });
    return dataPoint;
  });

  return (
    <Paper withBorder p="md" h={400} radius="xs">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="month" />
          <YAxis />
          <Tooltip />
          <Legend />
          {data.map((series, index) => (
            <Bar
              key={series.name}
              dataKey={series.name}
              fill={COLORS[index % COLORS.length]}
              radius={[8, 8, 0, 0]}
            />
          ))}
        </BarChart>
      </ResponsiveContainer>
    </Paper>
  );
};
