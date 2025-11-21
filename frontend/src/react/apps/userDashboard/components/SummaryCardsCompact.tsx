// src/pages/userDashboard/components/SummaryCardsCompact.tsx
import { Stack, Group, Text } from '@mantine/core';
import { formatNumber } from '@shared/utils/formatters';

interface SummaryCardsCompactProps {
  warehouse: number;
  sorting: number;
  shipment: number;
}

export const SummaryCardsCompact = ({ warehouse, sorting, shipment }: SummaryCardsCompactProps) => {
  const items = [
    { label: '입고', value: warehouse, color: '#f45d8b' },
    { label: '선별', value: sorting, color: '#19b394' },
    { label: '출하', value: shipment, color: '#1956b3' },
  ];

  return (
    <Stack gap="xs">
      {items.map((item) => (
        <Group
          key={item.label}
          justify="space-between"
          p="xs"
          style={{
            backgroundColor: 'rgba(0, 0, 0, 0.02)',
            borderRadius: 4,
          }}
        >
          <Group gap="xs">
            <div
              style={{
                width: 10,
                height: 10,
                borderRadius: '50%',
                backgroundColor: item.color,
              }}
            />
            <Text size="sm" c="dimmed">
              {item.label}
            </Text>
          </Group>
          <Text size="sm" fw={700}>
            {formatNumber(item.value)} ton
          </Text>
        </Group>
      ))}
    </Stack>
  );
};
