// @lib/apis/dashboard.ts
import { getJSON } from "../http";
import { ApcItem, ApcStatusResp } from "../../types/dashboard";

// 변환 유틸: Raw → 정규화된 ApcItem
function normalizeApc(raw: any): ApcItem {
    const kinds = [];
    if (raw.WGH_AGT_INSTL_YN != null)
        kinds.push({ name: "계량", value: raw.WGH_AGT_INSTL_YN === "Y" ? "active" : "" });
    if (raw.SORT_AGT_INSTL_YN != null)
        kinds.push({ name: "선별", value: raw.SORT_AGT_INSTL_YN === "Y" ? "active" : "" });

    return {
        name: raw.APC_NM,
        value: raw.APC_CD,
        nh: raw.NH === "Y",
        cx: raw.XCRD,
        cy: raw.YCRD,
        kinds,
        status: [
            { name: "입고", value: raw.WRHS_ACTVTN_YN === "Y" ? "active" : "" },
            { name: "선별", value: raw.SORT_ACTVTN_YN === "Y" ? "active" : "" },
            { name: "출고", value: raw.SPMT_ACTVTN_YN === "Y" ? "active" : "" },
            { name: "재고", value: raw.INVNTR_ACTVTN_YN === "Y" ? "active" : "" },
            { name: "영농", value: raw.AGRC_ACTVTN_YN === "Y" ? "active" : "" },
            { name: "정산", value: raw.CLCLN_ACTVTN_YN === "Y" ? "active" : "" },
        ],
        delYn: raw.DEL_YN,
        rcntData: getLatestDate([
            raw.WGH_LAST_USE_DT,
            raw.WRHS_LAST_USE_DT,
            raw.SORT_LAST_USE_DT,
            raw.PCKG_LAST_USE_DT,
            raw.SPMT_LAST_USE_DT,
            raw.ORDR_LAST_USE_DT,
            raw.CLCLN_LAST_USE_DT,
            raw.AGRC_LAST_USE_DT,
            raw.INVNTR_LAST_USE_DT,
        ]),
        useData: [
            { name: "wgh", value: raw.WGH_LAST_USE_DT || "미사용" },
            { name: "wrhs", value: raw.WRHS_LAST_USE_DT || "미사용" },
            { name: "sort", value: raw.SORT_LAST_USE_DT || "미사용" },
            { name: "pckg", value: raw.PCKG_LAST_USE_DT || "미사용" },
            { name: "spmt", value: raw.SPMT_LAST_USE_DT || "미사용" },
            { name: "ordr", value: raw.ORDR_LAST_USE_DT || "미사용" },
            { name: "clcln", value: raw.CLCLN_LAST_USE_DT || "미사용" },
            { name: "agrc", value: raw.AGRC_LAST_USE_DT || "미사용" },
            { name: "invntr", value: raw.INVNTR_LAST_USE_DT || "미사용" },
        ],
    };
}

// 날짜 처리 (기존 getLatestDate 함수 이동)
function getLatestDate(dateList: (string | null | undefined)[]): string {
    const validDates = dateList.filter(Boolean) as string[];
    if (validDates.length === 0) return "미사용";
    return validDates
        .map((d) => new Date(d))
        .reduce((latest, cur) => (cur > latest ? cur : latest))
        .toISOString()
        .slice(0, 10);
}

export async function getApcAgtStatus(): Promise<ApcItem[]> {
    const res = await getJSON<ApcStatusResp>("/co/user/getApcAgtStats.do");
    if (res.result.resultStatus !== "S" || !res.result.resultLists) return [];
    return res.result.resultLists.map(normalizeApc);
}