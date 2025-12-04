// src/components/GradingTableFooter.tsx
import React from 'react';

// (임시) 타입 정의
interface Grade {
  grdNm: string;
  grdCd: string;
}
interface Client {
  cnptCd: string;
  cnptNm: string;
  color: string;
}

// 1. props 타입을 정의
interface GradingTableFooterProps {
  grades: Grade[];
  clients: Client[];
}

const GradingTableFooter: React.FC<GradingTableFooterProps> = ({ grades, clients }) => {
  // 2. ❌ DUMMY_CLIENTS 삭제

  // select 변경 시 색상 박스 변경
  const handleSelectChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const selectedValue = e.target.value;
    const colorBox = e.target.parentElement?.querySelector('.color-box') as HTMLElement;
    if (!colorBox) return;

    if (!selectedValue) {
      colorBox.style.backgroundColor = 'transparent';
      return;
    }

    // 3. 👈 DUMMY_CLIENTS -> clients (props)
    const client = clients.find((c) => c.cnptCd === selectedValue);
    if (client) {
      colorBox.style.backgroundColor = client.color;
    }
  };

  return (
    <tfoot className="bg-gray-50">
      {/* 1번째 행: <select> */}
      <tr className="border-t-2 border-t-black">
        {/* 1열: 생산자 */}
        <td className="border border-gray-400 p-1 relative">
          <select
            className="w-full text-center border-none bg-transparent"
            onChange={handleSelectChange}
          >
            <option value="">-</option>
            {/* 4. 👈 DUMMY_CLIENTS -> clients (props) */}
            {clients.map((c) => (
              <option key={c.cnptCd} value={c.cnptCd}>
                {c.cnptNm}
              </option>
            ))}
          </select>
          <div className="color-box absolute top-1 right-1 w-3 h-3 border border-white rounded-sm" />
        </td>

        {/* N개 등급 열 */}
        {grades.map((grade) => (
          <td key={grade.grdCd} colSpan={2} className="border border-gray-400 p-1 relative">
            <select
              className="w-full text-center border-none bg-transparent"
              onChange={handleSelectChange}
            >
              <option value="">-</option>
              {/* 5. 👈 DUMMY_CLIENTS -> clients (props) */}
              {clients.map((c) => (
                <option key={c.cnptCd} value={c.cnptCd}>
                  {c.cnptNm}
                </option>
              ))}
            </select>
            <div className="color-box absolute top-1 right-1 w-3 h-3 border border-white rounded-sm" />
          </td>
        ))}
      </tr>

      {/* 2번째 행: <input> (이건 데이터 없음) */}
      <tr>{/* ... (생략) ... */}</tr>
    </tfoot>
  );
};

export default GradingTableFooter;
