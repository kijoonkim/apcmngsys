// src/pages/userDashboard/components/APCInfoSection.tsx
import { Stack, Text } from '@mantine/core';
import { APCInfoTable } from './APCInfoTable';
import type { APCInfo, APCCounts } from '../types/dashboard';

interface APCInfoSectionProps {
  apcInfo: APCInfo | null;
  itemList: string[];
  counts: APCCounts;
}

export const APCInfoSection = ({ apcInfo, itemList, counts }: APCInfoSectionProps) => {
  return (
    <Stack gap="md">
      <Text size="xl" fw={700}>
        APC 요약정보
      </Text>
      <APCInfoTable apcInfo={apcInfo} itemList={itemList} counts={counts} />
    </Stack>
  );
};
