// src/pages/userDashboard/components/SummaryCards.tsx
import { Group, Card, Text, Stack } from '@mantine/core';
import { formatNumber } from '@shared/utils/formatters';

interface SummaryCardsProps {
  warehouse: number;
  sorting: number;
  shipment: number;
}

export const SummaryCards = ({ warehouse, sorting, shipment }: SummaryCardsProps) => {
  return (
    <Group grow gap="xs">
      <Card withBorder p="md" style={{ borderBottom: '10px solid #4073C0' }}>
        <Stack gap="xs" align="center">
          <Text size="sm" c="dimmed">
            입고
          </Text>
          <Text size="xl" fw={700} c="#4073C0">
            {formatNumber(warehouse)}
          </Text>
        </Stack>
      </Card>

      <Card withBorder p="md" style={{ borderBottom: '10px solid #1bb394' }}>
        <Stack gap="xs" align="center">
          <Text size="sm" c="dimmed">
            선별
          </Text>
          <Text size="xl" fw={700} c="#1bb394">
            {formatNumber(sorting)}
          </Text>
        </Stack>
      </Card>

      <Card withBorder p="md" style={{ borderBottom: '10px solid #eb5c87' }}>
        <Stack gap="xs" align="center">
          <Text size="sm" c="dimmed">
            출하
          </Text>
          <Text size="xl" fw={700} c="#eb5c87">
            {formatNumber(shipment)}
          </Text>
        </Stack>
      </Card>
    </Group>
  );
};
