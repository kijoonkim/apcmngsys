// src/pages/userDashboard/components/DashboardHeader.tsx
import { Group, Stack, Text } from '@mantine/core';
import { DatePickerInput } from '@mantine/dates';

interface DashboardHeaderProps {
  selectedApc: string;
  onApcChange: (apc: string) => void;
  baseDate: Date;
  onDateChange: (date: Date) => void;
}

export const DashboardHeader = ({
  selectedApc,
  selectedApcNm,
  onApcChange,
  baseDate,
  onDateChange,
}: DashboardHeaderProps) => {
  return (
    <Group
      p="md"
      bg="rgba(128, 128, 128, 0.15)"
      style={{ borderRadius: 5 }}
      justify="flex-start"
      gap="lg"
    >
      <Text fw={500}>조회 APC</Text>
      <div style={{ width: 200 }}>
        {/* 기존 JSP의 APC Select 컴포넌트 그대로 사용 */}
        <div id="apc-select-wrapper">{selectedApcNm}</div>
      </div>

      <Text fw={500}>기준일자</Text>
      <DatePickerInput
        value={baseDate}
        onChange={(date) => date && onDateChange(date)}
        valueFormat="YYYY-MM-DD"
        style={{ width: 200 }}
      />
    </Group>
  );
};
