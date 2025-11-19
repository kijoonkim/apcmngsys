// src/components/GradingTableBody.tsx
import React from 'react';

// 임시 타입
type Grade = { grdCd: string; grdNm: string };

// --- 임시 더미 데이터 ---
const ROW_COUNT = 25; // JSP의 고정 25개 행
const DUMMY_ROWS = Array.from({ length: ROW_COUNT }, (_, i) => `row-${i}`);
// -----------------------

const GradingTableBody = ({ grades }: { grades: Grade[] }) => {
  return (
    <tbody>
      {/* 25개 행 렌더링 */}
      {DUMMY_ROWS.map((rowId, rowIndex) => (
        <tr key={rowId}>
          {/* 1열: 생산자 (JSP: j === 0) */}
          <td className="border border-gray-400 p-1">
            <div className="flex">
              <input
                type="text"
                readOnly
                className="flex-[2] w-full bg-gray-50 border-none"
                placeholder={`생산자 ${rowIndex + 1}`} // 임시
              />
              <button className="flex-[1] w-full bg-gray-200 hover:bg-gray-300 px-2 py-1">
                조회
              </button>
            </div>
          </td>

          {/* N개 등급 열 (JSP: j > 0) */}
          {grades.map((grade) => (
            <td
              key={grade.grdCd}
              colSpan={2} // 각 등급이 2칸 차지
              className="border border-gray-400 p-1"
            >
              <input type="number" className="w-full text-center border-none" />
            </td>
          ))}
        </tr>
      ))}
    </tbody>
  );
};

export default GradingTableBody;
