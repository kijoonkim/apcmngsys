// src/components/GradingTableHeader.tsx
import React from 'react';

// 임시 타입 (나중에 진짜 타입으로 교체)
type Grade = { grdCd: string; grdNm: string };

const GradingTableHeader = ({ grades }: { grades: Grade[] }) => {
  const gradeCount = grades.length;

  return (
    <thead className="bg-gray-100">
      {/* 1번째 행: "작업량" (JSP: thead.querySelectorAll("tr")[0]) */}
      <tr>
        {/* '생산자' + '총계' (JSP엔 총계가 없었지만 일단 1열) */}
        <th
          className="border border-gray-400 p-2 font-bold"
          // '생산자' 열 1개 + 등급 열 (N*2)
          colSpan={1 + gradeCount * 2}
        >
          작 업 량
        </th>
      </tr>

      {/* 2번째 행: 등급명 (JSP: thead.querySelectorAll("tr")[1]) */}
      <tr>
        <th rowSpan={2} className="border border-gray-400 p-2 font-bold">
          생산자
        </th>
        {grades.map((grade) => (
          <th
            key={grade.grdCd}
            colSpan={2} // 각 등급이 2칸 차지
            className="border border-gray-400 p-2 font-medium"
          >
            {grade.grdNm}
          </th>
        ))}
      </tr>

      {/* 3번째 행: 빈 input (JSP: thead.querySelectorAll("tr")[2]) */}
      <tr>
        {grades.map((grade) => (
          <th key={grade.grdCd} colSpan={2} className="border border-gray-400 p-1">
            <input type="text" readOnly className="w-full text-center bg-gray-50 border-none" />
          </th>
        ))}
      </tr>
    </thead>
  );
};

export default GradingTableHeader;
