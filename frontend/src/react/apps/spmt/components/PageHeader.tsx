import React from 'react';
// 1. 👈 Select 컴포넌트 import 추가
import { Button, SegmentedControl, Text, Title, Select } from '@mantine/core';
// 👈 Mantine 날짜 컴포넌트를 사용하기 위해 import
import { DatePickerInput } from '@mantine/dates';
import 'dayjs/locale/ko'; // 👈 달력 한글화 (필요시)

// (임시) App에서 받아올 창고 옵션 타입
interface WarehouseOption {
  value: string; // 예: "W01"
  label: string; // 예: "A동"
}

// (임시) App에서 받아올 모드 타입
type AppMode = 'view' | 'split' | 'shipment';

interface PageHeaderProps {
  // --- 날짜 관련 ---
  selectedDate: Date | null;
  onDateChange: (date: Date | null) => void;

  // --- 창고 관련 ---
  warehouseOptions: WarehouseOption[]; // App의 warehouse 상태
  selectedWarehouse: string;
  onWarehouseChange: (value: string) => void;

  // --- 모드 관련 ---
  currentMode: AppMode;
  onModeChange: (mode: AppMode) => void;
}

const PageHeader: React.FC<PageHeaderProps> = ({
  selectedDate,
  onDateChange,
  warehouseOptions,
  selectedWarehouse,
  onWarehouseChange,
  currentMode,
  onModeChange,
}) => {
  // 2. ❌ 이 라인은 이제 Select 컴포넌트가 대체하므로 필요 없음
  // const selectedWarehouseLabel =
  //   warehouseOptions.find((w) => w.value === selectedWarehouse)?.label || '';
  console.log(warehouseOptions, 'warehouseOptions');

  return (
    <div className="p-4 px-12">
      {/* 1. 제목 (날짜와 창고명) */}
      {/* 3. 👈 Title의 ta="center"를 제거하고 flex로 중앙 정렬 */}
      <Title order={1} mb="sm">
        <div className="flex items-center justify-center gap-2">
          <span>{`${selectedDate ? selectedDate.getFullYear() + '년' : ''} 공동선별작업일지`}</span>

          {/* 4. 👈 괄호와 Select 컴포넌트 추가 */}
          <span>(</span>
          <Select
            data={warehouseOptions}
            value={selectedWarehouse}
            // 5. 👈 Select는 null을 반환할 수 있으므로 (value || '') 처리
            onChange={(value) => onWarehouseChange(value || '')}
            variant="unstyled" // 👈 제목과 어울리게 테두리 제거
            size="lg" // 👈 Title 크기(h2)와 맞춤
            style={{ width: '100px' }} // 👈 적절한 너비 지정
            rightSection={<></>}
            styles={{
              input: {
                fontSize: 'var(--mantine-font-size-h2)', // 👈 Title 폰트 크기 상속
                fontWeight: 700, // 👈 Title 폰트 굵기 상속
                paddingRight: 0,
                textAlign: 'center', // 👈 가운데 정렬
              },
            }}
          />
          <span>)</span>
        </div>
      </Title>

      {/* 2. 컨트롤 영역 (날짜, 버튼) */}
      <div className="flex items-center gap-2">
        {/* 왼쪽: 날짜 선택 */}
        <div className="flex items-center gap-2">
          <Text fw={500}>일자:</Text>
          <DatePickerInput
            value={selectedDate}
            onChange={onDateChange}
            placeholder="날짜 선택"
            locale="ko" // 👈 한글
            valueFormat="YYYY년 MM월 DD일" // 👈 표시 형식
            style={{ width: '180px' }}
          />
          {/* 6. ❌ 창고 선택기가 제목으로 이동했으므로 SegmentedControl 삭제 */}
          {/* <SegmentedControl
            value={selectedWarehouse}
            onChange={onWarehouseChange}
            data={warehouseOptions}
          /> */}
        </div>

        {/* 오른쪽: 버튼 그룹 */}
        <div className="flex items-center gap-2">
          {/* 4. 작업 모드 버튼 (SegmentedControl로 그룹화) */}
          <SegmentedControl
            value={currentMode}
            onChange={(value) => onModeChange(value as AppMode)}
            radius="xs"
            data={[
              { label: '조회', value: 'view' },
              { label: '출하등록', value: 'shipment' },
              { label: '재고분리', value: 'split' },
            ]}
          />
          <Button variant="default">프린트</Button>
          <Button variant="default">품종선택</Button>
          <Button variant="default">사판추가</Button>
        </div>
      </div>
    </div>
  );
};

export default PageHeader;
