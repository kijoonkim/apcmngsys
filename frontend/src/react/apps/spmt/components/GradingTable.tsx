import React, { useContext } from 'react';
import CellContainer from './CellContainer';
import { Autocomplete } from '@mantine/core';
import { GridDataContext } from '@apps/spmt/contexts/GridDataContext';

// --- 1. Props 타입 정의 ---
// App.tsx에서 받아올 데이터 타입
// (나중에 @/types/grid.ts 같은 공용 파일로 분리)

/**
 * 등급 정보 (API: /selectStdGrdDtlList.do)
 */
export interface Grade {
  grdNm: string; // 등급명 (예: "특")
  grdCd: string; // 등급코드 (예: "01")
}

/**
 * 거래처 정보 (API: gfn_getCnpts)
 */
export interface Client {
  cnptCd: string; // 거래처 코드
  cnptNm: string; // 거래처명
  color: string; // (JSP에서 사용하던) 색상
}

/**
 * Lot 데이터 (나중에 CellContainer가 받을 데이터)
 */
export interface Lot {
  id: string; // Lot ID
  qty: number; // 수량
  shipmentId?: string; // (선택적) 출하 ID
}
export interface ProducerRow {
  id: string; // React key
  producer: { name: string; code: string } | null; // 선택된 생산자 정보
  // ... (나중에 등급별 수량 데이터도 추가)
}
/**
 * App.tsx에서 GradingTable로 내려줄 Props
 */
interface GradingTableProps {
  grades: Grade[];
  clients: Client[];
  rows: ProducerRow[]; // 👈 2. App에서 DUMMY_PRODUCERS 대신 '상태'를 받음
  onOpenModal: (rowIndex: number) => void; // 👈 3. App에서 '핸들러'를 받음
}

/**
 * <table> 태그 대신 CSS Grid를 사용한 메인 테이블 껍데기
 */
const GradingTable: React.FC<GradingTableProps> = ({
  clients, // App에서 받은 거래처 목록
  rows, // 👈 5. DUMMY_PRODUCERS 대신 'rows' 사용
  onOpenModal, // 👈 5. 'onOpenModal' 핸들러 사용
}) => {
  const contextValue = useContext(GridDataContext);
  const { grades, producers, mode, onLotClick, onEmptyCellClick } = contextValue;
  console.log(producers, '프로듀ㅜ셔');

  return (
    <div className="py-4 px-12">
      {/* 1. <table> 대신 CSS Grid 컨테이너 사용 */}
      <div
        id={'wrap'}
        className="grid border-t border-l border-gray-400"
        style={{
          // 2. 열(Column) 동적 생성
          // 1열(생산자)은 150px 고정, 나머지는 1fr(균등분배)
          gridTemplateColumns: `150px repeat(${grades.length}, 1fr)`,
          gridTemplateRows: 'auto',
        }}
      >
        {/* --- 3. 헤더 행 (thead 역할) --- */}
        <div
          style={{
            border: '1px solid black',
            gridColumn: `1 / -1`,
            letterSpacing: '2em',
            textAlign: 'center',
          }}
        >
          작업량
        </div>
        <div
          className="p-1 text-center border border-black border-solid"
          style={{ gridRow: '2/4', alignContent: 'center' }}
        >
          생산자
        </div>
        {grades.map((grade) => (
          <div key={grade.grdCd} className="p-1 text-center border border-black border-solid">
            {grade.grdNm}
          </div>
        ))}
        {grades.map((grade) => (
          <div key={grade.grdCd} className="p-1 text-center border border-black border-solid">
            0
          </div>
        ))}
        {/* (JSP의 3단 헤더는 일단 생략) */}

        {/* --- 4. 본문 영역 (tbody 역할) --- */}
        {/* 25개 행 렌더링 */}
        {/* 6. 👈 DUMMY_PRODUCERS -> rows.map (index 포함) */}
        {rows.map((row, index) => (
          // React.Fragment: Grid 레이아웃을 깨지 않기 위해 <React.Fragment> 사용
          <React.Fragment key={row.id}>
            {/* 1열: 생산자 셀 */}
            <div>
              <div className="flex h-full">
                <Autocomplete
                  type="text"
                  radius={0}
                  data={producers}
                  styles={{ input: { height: '100%' }, wrapper: { height: '100%' } }}
                  // value={row.pltno ? `${row.prdcrIdentno + ' ' + row.prdcrNm}` : ''}
                  className="flex-[2] w-full border border-solid border-black h-full"
                />
              </div>
            </div>

            {/* N열: 등급 셀 (CellContainer) */}
            {grades.map((grade) => {
              // 10. 👈 producer.id -> row.id
              const cellKey = `${row.id}_${grade.grdCd}`;

              return (
                <div key={grade.grdCd} className="p-0 border border-black border-solid">
                  {/* 이 자리에 자식 껍데기(CellContainer)가 들어감 */}
                  <CellContainer
                    cellKey={cellKey}
                    // (App에서 lotData, clients 등을 받아서 넘겨줘야 함)
                    // (지금은 껍데기이므로 CellContainer가 자체 더미 데이터를 사용)
                  />
                </div>
              );
            })}
          </React.Fragment>
        ))}
      </div>
    </div>
  );
};

export default GradingTable;
