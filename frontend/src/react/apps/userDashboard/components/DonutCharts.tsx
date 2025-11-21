// src/pages/userDashboard/components/DonutCharts.tsx
import { Paper, Text, Center } from '@mantine/core';
import {
  ComposedChart,
  Bar,
  Line,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';
import type { ItemData } from '../types/dashboard';

interface DonutChartsProps {
  warehouse: ItemData[];
  sorting: ItemData[];
  shipment: ItemData[];
}

export const DonutCharts = ({ warehouse, sorting, shipment }: DonutChartsProps) => {
  // 품목별로 데이터 매핑
  const itemNames = Array.from(
    new Set([
      ...warehouse.map((d) => d.ITEM_NM),
      ...sorting.map((d) => d.ITEM_NM),
      ...shipment.map((d) => d.ITEM_NM),
    ]),
  );

  const chartData = itemNames.map((itemName) => ({
    name: itemName,
    입고: warehouse.find((d) => d.ITEM_NM === itemName)?.WGHT || 0,
    선별: sorting.find((d) => d.ITEM_NM === itemName)?.WGHT || 0,
    출하: shipment.find((d) => d.ITEM_NM === itemName)?.WGHT || 0,
  }));

  if (chartData.length === 0) {
    return (
      <Paper withBorder p="md" h={400}>
        <Center h="100%">
          <Text c="dimmed">데이터가 없습니다.</Text>
        </Center>
      </Paper>
    );
  }

  return (
    <Paper withBorder p="md">
      <Text fw={700} size="lg" mb="md">
        품목별 입고/선별/출하 현황
      </Text>
      <ResponsiveContainer width="100%" height={400}>
        <ComposedChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
          <XAxis dataKey="name" tick={{ fontSize: 12 }} stroke="#888" />
          <YAxis
            tick={{ fontSize: 12 }}
            stroke="#888"
            label={{ value: '중량 (ton)', angle: -90, position: 'insideLeft' }}
          />
          <Tooltip
            formatter={(value: number) => `${value.toLocaleString()} ton`}
            contentStyle={{
              backgroundColor: 'rgba(255, 255, 255, 0.95)',
              border: '1px solid #ddd',
              borderRadius: '4px',
            }}
          />
          <Legend wrapperStyle={{ paddingTop: '20px' }} iconType="circle" />

          {/* 입고 - 막대 */}
          <Bar dataKey="입고" fill="#f45d8b" radius={[8, 8, 0, 0]} maxBarSize={60} />

          {/* 선별 - 선 */}
          <Line
            dataKey="선별"
            stroke="#19b394"
            strokeWidth={3}
            dot={{ r: 5, fill: '#19b394' }}
            activeDot={{ r: 7 }}
          />

          {/* 출하 - 영역 */}
          <Area dataKey="출하" fill="#1956b3" stroke="#1956b3" strokeWidth={2} fillOpacity={0.3} />
        </ComposedChart>
      </ResponsiveContainer>
    </Paper>
  );
};
