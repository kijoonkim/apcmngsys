// @types/dashboard.ts
export type ApcKind = {
    name: string;   // 계량, 선별 …
    value: string;  // "active" | ""
};

export type ApcStatus = {
    name: string;   // 입고, 선별 …
    value: string;  // "active" | ""
};

export type UseData = {
    name: string;   // wgh, wrhs …
    value: string;  // 날짜 | "미사용"
};

export type ApcItem = {
    name: string;       // APC_NM
    value: string;      // APC_CD
    nh: boolean;        // NH 여부
    cx: string;         // XCRD
    cy: string;         // YCRD
    kinds: ApcKind[];
    status: ApcStatus[];
    delYn: string;
    rcntData: string;   // 최근 사용일자
    useData: UseData[];
};

// 최종 응답 형태
export type ApcStatusResp = {
    result: {
        resultStatus: string;
        resultLists: any[];   // 원본 그대로 받는 Raw 데이터
    };
};