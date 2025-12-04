// src/pages/userDashboard/components/ControlPanel.tsx
import {
  Paper,
  Stack,
  Text,
  SegmentedControl,
  Skeleton,
  Flex,
  UnstyledButton,
  Group,
  Badge,
} from '@mantine/core';
import { DatePickerInput } from '@mantine/dates';
import { SummaryCardsCompact } from './SummaryCardsCompact';
import { IconMenu2 } from '@tabler/icons-react';

interface MenuHistoryItem {
  menuId: string;
  menuNm: string;
  lastVisit: string;
}

interface ControlPanelProps {
  selectedApc: string;
  onApcChange: (apc: string) => void;
  baseDate: Date;
  onDateChange: (date: Date) => void;
  viewMode: 'mm' | 'yy';
  onViewModeChange: (mode: 'mm' | 'yy') => void;
  summaryCards: {
    warehouse: number;
    sorting: number;
    shipment: number;
  };
  loading?: boolean;
  menuHistory?: MenuHistoryItem[];
  menuLoading?: boolean;
}

export const ControlPanel = ({
  selectedApc,
  onApcChange,
  baseDate,
  onDateChange,
  viewMode,
  onViewModeChange,
  summaryCards,
  loading,
  menuHistory,
  menuLoading,
}: ControlPanelProps) => {
  const handleMenuClick = (menuId: string) => {
    // 기존 JSP 탭 시스템으로 메뉴 오픈
    if (window.parent && window.parent.cfn_openTabSearch) {
      window.parent.cfn_openTabSearch(JSON.stringify({ target: menuId }));
    } else {
      console.warn('fn_openMenu 함수를 찾을 수 없습니다.');
    }
  };

  const formatTimeAgo = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const minutes = Math.floor(diff / 60000);

    if (minutes < 1) return '방금 전';
    if (minutes < 60) return `${minutes}분 전`;
    const hours = Math.floor(minutes / 60);
    if (hours < 24) return `${hours}시간 전`;
    return `${Math.floor(hours / 24)}일 전`;
  };

  return (
    <Paper withBorder p="md" h="100%" radius="xs">
      <Flex gap="md" w="100%">
        <Stack gap="lg" style={{ flex: 2 }}>
          {/* 날짜 선택 */}
          <div>
            <Text size="sm" fw={500} mb="xs">
              기준일자
            </Text>
            <DatePickerInput
              value={baseDate}
              onChange={(date) => date && onDateChange(date)}
              valueFormat="YYYY-MM-DD"
            />
          </div>

          {/* 월별/연별 토글 */}
          <div>
            <Text size="sm" fw={500} mb="xs">
              조회 구분
            </Text>
            <SegmentedControl
              value={viewMode}
              onChange={(val) => onViewModeChange(val as 'mm' | 'yy')}
              fullWidth
              data={[
                { label: '월별', value: 'mm' },
                { label: '연별', value: 'yy' },
              ]}
            />
          </div>

          {/* 요약 카드 */}
          <div>
            <Text size="sm" fw={500} mb="xs">
              실적 요약
            </Text>
            {loading ? (
              <Stack gap="xs">
                <Skeleton height={30} />
                <Skeleton height={30} />
                <Skeleton height={30} />
              </Stack>
            ) : (
              <SummaryCardsCompact {...summaryCards} />
            )}
          </div>
        </Stack>

        {/* 최근 방문 메뉴 */}
        <Stack gap="xs" style={{ flex: 1 }}>
          <Text size="sm" fw={500}>
            최근 방문
          </Text>
          {menuLoading ? (
            <Stack gap="xs">
              <Skeleton height={40} />
              <Skeleton height={40} />
              <Skeleton height={40} />
              <Skeleton height={40} />
              <Skeleton height={40} />
            </Stack>
          ) : menuHistory && menuHistory.length > 0 ? (
            <Stack gap="xs">
              {menuHistory.map((menu, idx) => (
                <UnstyledButton
                  key={idx}
                  onClick={() => handleMenuClick(menu.menuId)}
                  p="xs"
                  style={{
                    borderRadius: 4,
                    border: '1px solid #e9ecef',
                    transition: 'all 0.2s',
                    cursor: 'pointer',
                  }}
                  styles={{
                    root: {
                      '&:hover': {
                        backgroundColor: '#f8f9fa',
                        borderColor: '#228be6',
                      },
                    },
                  }}
                >
                  <Group justify="space-between" wrap="nowrap">
                    <Group gap="xs">
                      <IconMenu2 size={16} color="#868e96" />
                      <div>
                        <Text size="xs" fw={500}>
                          {menu.menuNm}
                        </Text>
                        <Text size="xs" c="dimmed">
                          {menu.menuId}
                        </Text>
                      </div>
                    </Group>
                    <Text size="xs" c="dimmed">
                      {formatTimeAgo(menu.prslDt)}
                    </Text>
                  </Group>
                </UnstyledButton>
              ))}
            </Stack>
          ) : (
            <Text size="sm" c="dimmed" ta="center" mt="md">
              최근 방문 메뉴가 없습니다
            </Text>
          )}
        </Stack>
      </Flex>
    </Paper>
  );
};
