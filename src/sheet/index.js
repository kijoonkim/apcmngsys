import $ from 'jquery';
window.$ = $;
window.jQuery = $;

document.addEventListener("DOMContentLoaded", () => {
    window.luckysheet.create({
        container: "luckysheet",
        lang: "en", // 공식적 ko 미지원 (수동 해킹해야 가능)
        showinfobar: false,
        showtoolbar: false,
        showsheetbar: false,
        showstatisticBar: false,
        data: [{
            name: "작업일지",
            config: {
                merge: {
                    "0": { r: 0, c: 0, rs: 1, cs: 18 }
                },
                rowlen: { 0: 40 },
                borderInfo: [{
                    rangeType: "range",
                    borderType: "all",
                    style: 1,
                    color: "#000000",
                    range: [{ row: 2, column: 0, rowIndex: 25, columnIndex: 17 }]
                }]
            },
            celldata: [
                { r: 0, c: 0, v: { v: "2025년 공동선별작업일지(A동)", fs: 16, bl: 1, ht: 1, vt: 1 } },
                { r: 1, c: 0, v: { v: "일자 :", bl: 1 } },
                { r: 1, c: 1, v: { v: "2025년 07월 03일" } },
                { r: 2, c: 0, v: { v: "생산자", bl: 1 } },
                { r: 2, c: 1, v: { v: "가로적", bl: 1 } },
                { r: 2, c: 2, v: { v: "적특상", bl: 1 } },
                { r: 2, c: 3, v: { v: "성특상", bl: 1 } },
                { r: 2, c: 4, v: { v: "특상", bl: 1 } },
                { r: 2, c: 5, v: { v: "정특", bl: 1 } },
                { r: 2, c: 6, v: { v: "검특", bl: 1 } },
                { r: 2, c: 7, v: { v: "청상", bl: 1 } },
                { r: 2, c: 8, v: { v: "검상", bl: 1 } },
                { r: 2, c: 9, v: { v: "상(곡과)", bl: 1 } },
                { r: 2, c:10, v: { v: "중", bl: 1 } },
                { r: 2, c:11, v: { v: "중(곡과)", bl: 1 } },
                { r: 2, c:12, v: { v: "하", bl: 1 } },
                { r: 2, c:13, v: { v: "하(곡과)", bl: 1 } },
                { r: 2, c:14, v: { v: "총계", bl: 1 } },
            ]
        }]
    });
});
