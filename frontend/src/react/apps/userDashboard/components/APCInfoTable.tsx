// src/pages/userDashboard/components/APCInfoTable.tsx
import { Table, Text, Paper } from '@mantine/core';
import { formatPhoneNumber, formatBusinessNumber } from '@shared/utils/formatters';
import type { APCInfo, APCCounts } from '../types/dashboard';

interface APCInfoTableProps {
  apcInfo: APCInfo | null;
  itemList: string[];
  counts: APCCounts;
}

export const APCInfoTable = ({ apcInfo, itemList, counts }: APCInfoTableProps) => {
  if (!apcInfo) {
    return (
      <Paper withBorder p="md">
        <Text c="dimmed">APC 정보를 불러오는 중...</Text>
      </Paper>
    );
  }

  const rows = [
    { label: '법인명', value: apcInfo.corpNm, label2: 'APC명', value2: apcInfo.apcNm },
    { label: '업태', value: apcInfo.bzstat, label2: '종목', value2: apcInfo.cls },
    { label: '대표자명', value: apcInfo.apcRprsvNm, colspan: true },
    {
      label: '전화번호',
      value: formatPhoneNumber(apcInfo.telno),
      label2: '팩스번호',
      value2: formatPhoneNumber(apcInfo.fxno),
    },
    { label: '주소', value: apcInfo.addr, colspan: true },
    { label: '사업자번호', value: formatBusinessNumber(apcInfo.brno), colspan: true },
    { label: '품목', value: itemList.join(', '), colspan: true },
    {
      label: '생산자',
      value: `${counts.prdcr}명`,
      label2: '작업자',
      value2: `${counts.oprtr}명`,
    },
    {
      label: '사용자',
      value: `${counts.user}명`,
      label2: '거래처',
      value2: `${counts.cnpt}개`,
    },
  ];

  return (
    <Paper withBorder radius="xs">
      <Table striped highlightOnHover verticalSpacing="md">
        <Table.Tbody>
          {rows.map((row, idx) => (
            <Table.Tr key={idx}>
              <Table.Th w="20%" bg="gray.1" style={{ textAlign: 'center' }}>
                {row.label}
              </Table.Th>
              {row.colspan ? (
                <Table.Td
                  colSpan={3}
                  style={{
                    overflow: 'hidden',
                    textOverflow: 'ellipsis',
                    whiteSpace: 'nowrap',
                  }}
                >
                  {row.value}
                </Table.Td>
              ) : (
                <>
                  <Table.Td w="30%">{row.value}</Table.Td>
                  <Table.Th w="20%" bg="gray.1" style={{ textAlign: 'center' }}>
                    {row.label2}
                  </Table.Th>
                  <Table.Td w="30%">{row.value2}</Table.Td>
                </>
              )}
            </Table.Tr>
          ))}
        </Table.Tbody>
      </Table>
    </Paper>
  );
};
