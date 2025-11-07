export const APC_TOOLS = [
  {
    functionDeclarations: [
      {
        name: 'findApcByName',
        description:
          'APC 이름의 일부를 사용하여 해당하는 APC의 목록(이름과 코드 포함)을 검색합니다. 사용자가 어떤 APC를 원하는지 특정할 수 없을 때 사용합니다.',
        parameters: {
          type: 'OBJECT',
          properties: {
            apc_name: {
              type: 'STRING',
              description: "검색할 APC 이름의 일부 (예: '거산', '나주')",
            },
          },
          required: ['apc_name'],
        },
      },
      {
        name: 'getApcPerformance',
        description:
          '특정 APC의 주어진 기간 동안의 실적(입고, 선별, 포장, 출하량) 합계를 조회합니다.',
        parameters: {
          type: 'OBJECT',
          properties: {
            apc_code: {
              type: 'STRING',
              description: "정보를 조회할 APC의 고유 코드. (예: 'A001', '0669')",
            },
            apc_name: {
              type: 'STRING',
              description: "apc_code로 식별되는 명칭이름 (예: '영흥농산','거산')",
            },
            performance_types: {
              type: 'ARRAY', // [중요] String -> Array로 변경
              description:
                "조회할 실적의 종류 목록. 사용자가 '입고 실적'처럼 특정 유형을 찝어서 물어보면 해당 유형만 배열에 담습니다. (예: ['입고']). 만약 사용자가 '실적'처럼 모호하게 물어보면, ['입고', '선별', '포장', '출하'] 4가지 유형을 모두 배열에 담아서 반환해야 합니다.",
              items: { type: 'STRING' },
            },
            start_date: {
              type: 'STRING',
              description:
                "조회 시작일. [중요] 사용자가 '이번달', '오늘' 등으로 말해도, 현재 날짜(2025-10-23)를 기준으로 계산하여 반드시 'YYYYMMDD' 형식의 문자열로 변환해야 합니다. (예: '20251001')",
            },
            end_date: {
              type: 'STRING',
              description:
                "조회 종료일. [중요] 사용자가 '이번달', '오늘' 등으로 말해도, 현재 날짜(2025-10-23)를 기준으로 계산하여 반드시 'YYYYMMDD' 형식의 문자열로 변환해야 합니다. (예: '20251023')",
            },
          },
          required: ['apc_code', 'performance_types', 'start_date', 'end_date'],
        },
      },
    ],
  },
];
