<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        /* CSS 스타일 */
        .custom-float-group {
            position: fixed;
            bottom: 50px; /* var(--ant-margin-xxl) */
            right: 50px;   /* inset-inline-end */
            display: flex;
            flex-direction: column;
            gap: 5px;
            z-index: 1000; /* var(--ant-z-index-popup-base) */
        }

        .custom-float-btn {
            min-width: 40px;
            min-height: 40px;
            width: 50px;
            height: 50px;
            background-color: #ffffff; /* var(--ant-blue) */
            color: rgba(0, 0, 0, 0.55); /* var(--ant-color-text-light-solid) */
            border: none;
            border-radius: 8px; /* var(--ant-border-radius-lg) */
            font-size: 20px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial,
            'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol',
            'Noto Color Emoji';
            cursor: pointer;
            box-shadow: 0 6px 16px 0 rgba(0, 0, 0, 0.08),
            0 3px 6px -4px rgba(0, 0, 0, 0.12),
            0 9px 28px 8px rgba(0, 0, 0, 0.05); /* var(--ant-box-shadow-secondary) */
            transition: transform 0.2s ease;
        }

        .custom-float-btn:hover {
            transform: scale(1.08);
        }
        .modal-body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        .sbux-pik-icon-span button.sbux-pik-icon-btn{
            height: 30px;
        }
    </style>
</head>
<body>
<%--<H1 id="mblTitle" ondblclick="fn_fullScreen();" style="text-align: center">--%>
<%--    <span id="yyyy"></span>년 공동선별작업일지(--%>
<%--    <select id="warehouse" onchange="fn_reset()"--%>
<%--            style="appearance: none; -webkit-appearance: none; -moz-appearance: none;border: none!important;">--%>
<%--    </select>--%>
<%--    )</H1>--%>
<%--<div style="display: flex; gap: 6px; align-items: center">--%>
<%--    <h5 style="margin-left: 1vw">일자 : </h5>--%>
<%--    <sbux-datepicker--%>
<%--            id="srch-dtp-ymd"--%>
<%--            name="srch-dtp-ymd"--%>
<%--            uitype="popup"--%>
<%--            wrap-style="border: hidden"--%>
<%--            input-mask="undefined"--%>
<%--            date-format="yyyy년 mm월 dd일"--%>
<%--            style="background-color: initial; color: black; border: none!important;font-size: 1.7rem"--%>
<%--            onchange="fn_reset()"--%>
<%--    ></sbux-datepicker>--%>
<%--    <sbux-button--%>
<%--            id="spmtMode"--%>
<%--            name="spmtMode"--%>
<%--            uitype="normal"--%>
<%--            text="엑셀저장"--%>
<%--            class="no-print"--%>
<%--            is-change-text="true"--%>
<%--            onclick="fn_downloadExcelWithStyleAndFormula_XPop()"--%>
<%--    >--%>
<%--    </sbux-button>--%>
<%--</div>--%>
<div id="luckysheet-wrapper" style="position: relative; width: 100%; height: 100vh;">
    <div id="luckysheet" style="width:100%; height:100%;"></div>

    <!-- 따라다니는 버튼 (absolute) -->
<%--    <div id="floating-btn" style="position: absolute; top: 50%; right: 20%; z-index: 9999;">--%>
    <!-- HTML 구조 -->
    <div class="custom-float-group">
        <sbux-button id="btn_norm" name="btn_norm" uitype="modal" text="📅"
                     class="custom-float-btn"
                     target-id="modal_small">
        </sbux-button>
        <button class="custom-float-btn" onclick="fn_downloadExcelWithStyleAndFormula_XPop()">
            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="35" height="35" viewBox="0 0 48 48">
            <path fill="#4CAF50" d="M41,10H25v28h16c0.553,0,1-0.447,1-1V11C42,10.447,41.553,10,41,10z"></path>
            <path fill="#FFF" d="M32 15H39V18H32zM32 25H39V28H32zM32 30H39V33H32zM32 20H39V23H32zM25 15H30V18H25zM25 25H30V28H25zM25 30H30V33H25zM25 20H30V23H25z"></path>
            <path fill="#2E7D32" d="M27 42L6 38 6 10 27 6z"></path>
            <path fill="#FFF" d="M19.129,31l-2.411-4.561c-0.092-0.171-0.186-0.483-0.284-0.938h-0.037c-0.046,0.215-0.154,0.541-0.324,0.979L13.652,31H9.895l4.462-7.001L10.274,17h3.837l2.001,4.196c0.156,0.331,0.296,0.725,0.42,1.179h0.04c0.078-0.271,0.224-0.68,0.439-1.22L19.237,17h3.515l-4.199,6.939l4.316,7.059h-3.74V31z"></path>
            </svg>
        </button>
        <button class="custom-float-btn" onclick="scrollToTop()">🔝</button>
    </div>
    >
<%--    </div>--%>
</div>
<sbux-modal id="modal_small" name="modal_small" uitype="small" header-title="서류출력 일자선택"
            body-html-id="modalBody" header-is-close-button="false">
</sbux-modal>

<div id="modalBody" class="modal-body">
    <sbux-datepicker
            id="srch-dtp-ymd"
            name="srch-dtp-ymd"
            uitype="popup"
            wrap-style="border: hidden"
            input-mask="undefined"
            date-format="yyyy년 mm월 dd일"
            style="background-color: initial; color: black;font-size: 1.7rem"
    ></sbux-datepicker>
    <div style="display: flex;gap: 5px;">
        <button class="custom-float-btn" onclick="fn_selecteDate()" style="background-color: #149fff;color: white">확인</button>
        <button class="custom-float-btn" onclick="SBUxMethod.closeModal('modal_small');">취소</button>
    </div>

</div>
</body>
<link rel="stylesheet" href="${ctx}/css/sheet.css">
<script src="${ctx}/js/out/sheet.bundle.js" type="module"></script>

<script type="text/javascript">

    window.addEventListener("DOMContentLoaded", async function () {
        // 1) 프로젝트 정적 경로에 /static/data.xlsx 가 있다고 가정
        fetch('/doc/test.xlsx')
            .then(res => res.blob())
            .then(blob => {
                // blob 을 File 객체로 래핑 (LuckyExcel.transformExcelToLucky은 File 인터페이스를 기대)
                const file = new File([blob], 'data.xlsx', {type: blob.type});

                LuckyExcel.transformExcelToLucky(
                    file,
                    (exportJson, luckysheetfile) => {
                        if (exportJson && exportJson.sheets && Array.isArray(exportJson.sheets)) {
                            exportJson.sheets.forEach(function(sheetData, index) {
                                // 시트에 id가 없거나 유효하지 않으면 새로운 ID를 할당합니다.
                                // 'sheet_0', 'sheet_1' 등으로 간단하게 할당합니다.
                                if (!sheetData.id || typeof sheetData.id !== 'string') {
                                    sheetData.id = 'sheet_' + index + '_' + Date.now(); // 고유성을 위해 타임스탬프 추가
                                }
                            });
                        }

                        /** 50줄 제한 **/
                        const maxRow = 50;
                        exportJson.sheets = exportJson.sheets.map(sheet => {
                            // celldata 줄이기
                            if (sheet.celldata) {
                                sheet.celldata = sheet.celldata.filter(cell => cell.r < maxRow);
                            }

                            // row 수 강제 고정
                            sheet.row = maxRow;

                            // config 안에 row 관련 옵션 줄이기
                            if (sheet.config) {
                                if (sheet.config.rowlen) {
                                    Object.keys(sheet.config.rowlen).forEach(k => {
                                        if (parseInt(k) >= maxRow) delete sheet.config.rowlen[k];
                                    });
                                }
                                if (sheet.config.customHeight) {
                                    Object.keys(sheet.config.customHeight).forEach(k => {
                                        if (parseInt(k) >= maxRow) delete sheet.config.customHeight[k];
                                    });
                                }
                                if (sheet.config.rowhidden) {
                                    Object.keys(sheet.config.rowhidden).forEach(k => {
                                        if (parseInt(k) >= maxRow) delete sheet.config.rowhidden[k];
                                    });
                                }
                            }

                            return sheet;
                        });

                        luckysheet.create({
                            container: 'luckysheet',
                            data: exportJson.sheets,
                            title: exportJson.info.name,
                            userInfo: exportJson.info.creator,
                            showinfobar: false,
                            showtoolbar: false,
                            showstatisticBar: false,
                            hook: {
                                // 워크북 전체(모든 시트)가 초기화된 직후에 호출됩니다
                                workbookCreateAfter: function () {
                                },
                                sheetActivate: function (sheetIndex) {
                                    // const sheetId = luckysheet.getAllSheets()[sheetIndex].id;
                                    console.log('시트 전환됨:');
                                    console.log(sheetIndex);
                                },
                            },
                        });
                    },
                    err => console.error(err)
                );
            });

        /** luckysheet 내 버튼 드래그 이벤트 **/
        const btn = document.getElementById("floating-btn");
        let isDragging = false;
        let offsetX = 0;
        let offsetY = 0;

        btn.addEventListener("mousedown", function (e) {
            isDragging = true;
            const rect = btn.getBoundingClientRect();
            offsetX = e.clientX - rect.left;
            offsetY = e.clientY - rect.top;
            btn.style.transition = "none"; // 부드럽게 움직이지 않도록
        });

        document.addEventListener("mousemove", function (e) {
            if (!isDragging) return;
            btn.style.left = `${'${e.clientX - offsetX}'}px`;
            btn.style.top = `${'${e.clientY - offsetY}'}px`;
        });

        document.addEventListener("mouseup", function () {
            isDragging = false;
        });
        luckysheet.on('sheetActivate', function(sheetIndex) {
            const sheet = luckysheet.getSheet(); // 현재 활성 시트 정보
            const sheetId = sheet.id;

            console.log('🌀 시트 이동됨:', sheet.name);

            // 예시: 시트 이름 기반으로 데이터 설정
            if (sheetDataMap[sheetId]) {
                luckysheet.setSheetData(sheetDataMap[sheetId]);
            }
        });
    });


    /** export excel **/
    async function fn_downloadExcelWithStyleAndFormula_XPop() {
        /** luckysheets data **/
        const initialSheets = luckysheet.getAllSheets();
        if (!initialSheets || initialSheets.length === 0) {
            alert("다운로드할 시트 데이터가 없습니다.");
            return;
        }

        /** xlsxpop workbook init **/
        const workbook = await XlsxPopulate.fromBlankAsync();
        /** 현재 선택된시트 id **/
        const currentActiveSheetId = luckysheet.getSheet().id;
        /** luckySheet.borderStyle <==> xlsx **/
        const styleMap = {
            1: "thin", 2: "hair", 3: "dotted", 4: "dashed",
            5: "dashDot", 6: "dashDotDot", 7: "double",
            8: "medium", 9: "mediumDashed", 10: "mediumDashDot",
            11: "mediumDashDotDot", 12: "slantDashDot", 13: "thick"
        };

        /** 정렬값 **/
        const horizontalMap = ['center', 'left', 'right'];
        const verticalMap = ['center', 'top', 'bottom'];

        /** sheet 이동시 로드 대기 시간 **/
        const waitForSheetData = async (sheetId, timeout = 5000) => {
            const start = Date.now();
            while (Date.now() - start < timeout) {
                const sheet = luckysheet.getluckysheetfile().find(s => s.id === sheetId);
                if (sheet && sheet.data && sheet.data.length > 0) return sheet;
                await new Promise(r => setTimeout(r, 100));
            }
            return null;
        };

        /** 화면상 sheets 순회 **/
        for (let sheetIndex = 0; sheetIndex < initialSheets.length; sheetIndex++) {
            /** sheet data **/
            const sheetInfo = initialSheets[sheetIndex];
            /** sheet focus load **/
            luckysheet.setSheetActive(sheetIndex);
            /** sheet id로 active 성공 대기**/
            const sheet = await waitForSheetData(sheetInfo.id);
            if (!sheet) continue;
            /** xlsxpop에 luckysheet 정보로 addSheet **/
            const xSheet = sheetIndex === 0 ? workbook.sheet(0).name(sheetInfo.name) : workbook.addSheet(sheetInfo.name);
            /** luckysheet.config에서 border 값 Map format **/
            const borders = createBorderInfoMap(sheet.config.borderInfo || {});
            /** luckysheet.config 병합정보 **/
            const mergeMap = sheet.config?.merge || {};

            /** luckysheet data 1. row >> 2. col 순회 **/
            for (let r = 0; r < sheet.data.length; r++) {
                const row = sheet.data[r];
                if (!row) continue;

                for (let c = 0; c < row.length; c++) {
                    const cell = row[c];
                    /** cell 생성 **/
                    const cellX = xSheet.cell(r + 1, c + 1);
                    if (!cell) continue;

                    /** 리치 텍스트 스타일 예외처리 **/
                    if (cell.v != null) {
                        cellX.value(cell.v);
                    } else if (cell.ct.t === 'inlineStr' && Array.isArray(cell.ct.s)) {
                        cellX.value(cell.ct.s.map(seg => seg.v).join(''));
                    }

                    /** cell 서식 지정 (백분율,일반,텍스트) **/
                    if (cell.f != null) cellX.formula(cell.f.startsWith('=') ? cell.f : '=' + cell.f);

                    /** cell style (font, align, background) **/
                    const style = {};

                    if (cell.bg && cell.bg !== '#FFFFFF') {
                        style.fill = {
                            type: "solid",
                            color: cell.bg.replace("#",""),
                        };
                    }
                    if (cell.ct?.fa) {
                        cellX.style("numberFormat", cell.ct.fa);
                    }
                    if (cell.fc) style.fontColor = cell.fc;
                    if (cell.fs) style.fontSize = cell.fs;
                    if (cell.bl === 1) style.bold = true;

                    if (cell.ht != null) style.horizontalAlignment = horizontalMap[cell.ht];
                    if (cell.vt != null) style.verticalAlignment = verticalMap[cell.vt];
                    if (cell.tb === 1 || cell.tb === 2) style.wrapText = true;

                    cellX.style(style);

                    /** border style **/
                    const borderCell = borders.get(r)?.get(c);
                    if (borderCell?.value) {
                        const b = borderCell.value;
                        const borderObj = {};
                        if (b.t) borderObj.top = { style: styleMap[b.t.style], color: (b.t.color || '#000000').replace('#', '') };
                        if (b.b) borderObj.bottom = { style: styleMap[b.b.style], color: (b.b.color || '#000000').replace('#', '') };
                        if (b.l) borderObj.left = { style: styleMap[b.l.style], color: (b.l.color || '#000000').replace('#', '') };
                        if (b.r) borderObj.right = { style: styleMap[b.r.style], color: (b.r.color || '#000000').replace('#', '') };
                        cellX.style("border", borderObj);
                    }
                }
            }

            // Merge 적용
            for (const key in mergeMap) {
                const m = mergeMap[key];
                xSheet.range(m.r + 1, m.c + 1, m.r + m.rs, m.c + m.cs).merged(true);
            }

            // 행 높이 설정
            if (sheet.config.rowlen) {
                for (const r in sheet.config.rowlen) {
                    xSheet.row(Number(r) + 1).height(sheet.config.rowlen[r]);
                }
            }

            // 열 너비 설정
            if (sheet.config.columnlen) {
                for (const c in sheet.config.columnlen) {
                    xSheet.column(Number(c) + 1).width(sheet.config.columnlen[c] / 7); // px → width 보정
                }
            }
        }

        const originalIdx = initialSheets.findIndex(s => s.id === currentActiveSheetId);
        if (originalIdx !== -1) {
            luckysheet.setSheetActive(originalIdx);
            await new Promise(r => setTimeout(r, 50));
        }

        const blob = await workbook.outputAsync();
        saveAs(blob, "exported_luckysheet_xpop.xlsx");
    }

    /** export excel util **/
    const toHex = (hex) => {
        if (!hex) return null;  // 또는 undefined
        if (hex.length === 4) {
            hex = "#" + hex[1] + hex[1] + hex[2] + hex[2] + hex[3] + hex[3];
        }
        return hex.toUpperCase();
    };
    function createBorderInfoMap(borderInfoArray) {
        const borderInfoMap = new Map();

        for (const item of borderInfoArray) {
            const row = item?.value?.row_index;
            const col = item?.value?.col_index;

            if (row == null || col == null) continue;

            if (!borderInfoMap.has(row)) {
                borderInfoMap.set(row, new Map());
            }

            borderInfoMap.get(row).set(col, item);
        }

        return borderInfoMap;
    }
    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    /** 서류 일자 선택 --S **/
    const fn_selecteDate = function (){

        console.log("여기서부터 진짜다");
        SBUxMethod.closeModal('modal_small');
    }
    /** 서류 일자 선택 --E **/


</script>
</html>
