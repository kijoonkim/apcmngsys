<%
    /**
     * @Class Name : regSpmtPrfmnc_0520.jsp
     * @Description : 출고등록(양송이) 화면
     * @author SI개발부
     * @since 2025.07.23
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.07.23   김은총		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출고등록(양송이)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출고등록(양송이) -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"Ï
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_reset"
                        text="초기화"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_save"
                        text="저장"
                ></sbux-button>
                <sbux-button
                        id="btnDelete"
                        name="btnDelete"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_del"
                        text="삭제"
                ></sbux-button>
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_search"
                        text="조회"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body" style="padding: 10px 30px 15px;">
            <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
            <table id="srchTable" class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 6%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th class="th_bg">APC명</th>
                    <!--[APC] START -->
                    <td colspan="2" class="td_input" style="border-right: hidden">
                        <%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
                    </td>
                    <!--[APC] END -->
                    <td colspan="1" style="border-right: hidden"></td>
                    <td colspan="8"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">생산자</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrNm"
                                name="srch-inp-prdcrNm"
                                class="form-control input-sm input-sm-ast inpt_data_reqed"
                                placeholder="초성검색 가능"
                                autocomplete-ref="jsonPrdcrAutocomplete"
                                autocomplete-text="name"
                                autocomplete-height="270px"
                                oninput="fn_onInputPrdcrNm(event)"
                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrIdentno"
                                name="srch-inp-prdcrIdentno"
                                class="form-control input-sm"
                                maxlength="2"
                                autocomplete="off"
                                onchange="fn_onChangeSrchPrdcrIdentno(this)"
                        />
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-button
                                id="btn-srch-prdcr"
                                name="btn-srch-prdcr"
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-prdcr"
                                onclick="fn_choicePrdcr"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;">
                        <sbux-datepicker
                                id="srch-dtp-wrhsYmd"
                                name="srch-dtp-wrhsYmd"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
                                onchange="fn_onChangeWrhsYmd()">
                        </sbux-datepicker>
                    </td>
                    <td colspan="4">
                    </td>
                </tr>

                </tbody>

            </table>
            <!--[pp] 검색 -->
            <!--[pp] 검색결과 -->
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span></span></li>
                </ul>
            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-spmtPrfmnc" style="height:508px;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>

<!-- 생산자 선택 Modal -->
<div>
    <sbux-modal
            id="modal-prdcr"
            name="modal-prdcr"
            uitype="middle"
            header-title="생산자 선택"
            body-html-id="body-modal-prdcr"
            footer-is-close-button="false"
            header-is-close-button="false"
            style="width:1000px"
    ></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">

    var grdSpmtPrfmnc;

    var jsonSpmtPrfmnc              = [];
    var jsonPrdcr                   = [];
    var jsonPrdcrDtl                = [];
    var jsonPrdcrAutocomplete       = [];
    var jsonPrdcrAutocompleteDtl    = [];
    var jsonApcItem                 = [];   // 품목
    var jsonApcVrty			        = [];   // 품종
    var jsonSpmtPckgUnit            = [];   // 포장단위
    var jsonCnptSpmtPckgUnitList    = [];   // 거래처 & 상품
    var jsonGdsCd                   = [];   // 상품

    const itemCd = '1702';                  // 품목코드 - 양송이
    let searchYn = 'N';

    window.addEventListener("DOMContentLoaded", function () {
        fn_init();
    });
    const fn_init = async function () {

        let result = await Promise.all([
            gfn_getApcVrty(gv_selectedApcCd, itemCd),
            gfn_getSpmtPckgUnits(gv_selectedApcCd),
        ])

        jsonApcVrty = result[0];
        jsonSpmtPckgUnit = result[1];

        /** sn 순서보장 **/
        jsonApcVrty = jsonApcVrty.sort((a, b) => a.sn - b.sn);
        jsonApcVrty = jsonApcVrty.filter(item => item.useYn === 'Y');

        fn_getPrdcrs();
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));

        await fn_createSmptPrfmncGrid();
        await fn_search();
    }

    const fn_createSmptPrfmncGrid = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-spmtPrfmnc';
        SBGridProperties.id = 'grdSpmtPrfmnc';
        SBGridProperties.jsonref = 'jsonSpmtPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.contextmenu = true;
        SBGridProperties.contextmenulist = objMenuListSpmtPrfmnc;
        SBGridProperties.oneclickedit = true;
        SBGridProperties.scrollbubbling = false;

        let columns = [
            {caption: ['거래처 / 품목', '거래처 / 품목'], ref: 'gdsNm', width: '8%', type: 'output', style: 'text-align:center', merge:false},
        ];

        jsonApcVrty.forEach((item, index) => {
            columns.push(
                {caption: [item.vrtyNm, '수량'], ref: 'vrtyQntt' + (index+1), width: '5%', datatype : 'number', type: 'input', style: 'text-align:right', format : {type:'number', rule:'#,### '}, merge:false},
                {caption: [item.vrtyNm, '중량'], ref: 'vrtyWght' + (index+1), width: '5%', datatype : 'number', type: 'input', style: 'text-align:right', format : {type:'number', rule:'#,###.## '}, merge:false},
                {caption: [item.vrtyNm, '입고/포장일자'], ref: 'spmtYmd' + (index+1), width:'6%', type: 'datepicker', style:'text-align:center; background-color:#FFF8DC;', format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'},
                    typeinfo : {onclickedit: true, hideeditesckey: true, position: 'right', displayui: false}, merge:false},
                {caption: [item.vrtyNm, '상품코드'], ref: 'vrtrCd' + (index+1), type: 'input', hidden: true, merge:false},
                {caption: ['입고번호'],     ref: 'wrhsno' + (index+1), type: 'output', hidden: true, merge:false},
                {caption: ['팔레트번호'],   ref: 'pltno' + (index+1), type: 'output', hidden: true, merge:false},
                {caption: ['선별번호'],     ref: 'sortno' + (index+1), type: 'output', hidden: true, merge:false},
                {caption: ['포장번호'],     ref: 'pckgno' + (index+1), type: 'output', hidden: true, merge:false},
                {caption: ['출하번호'],     ref: 'spmtno' + (index+1), type: 'output', hidden: true, merge:false},
                {caption: ['출하포장단위코드'], ref: 'spmtPckgUnitCd' + (index+1), type: 'output', hidden: true, merge:false},
            );
        });

        columns.push(
            {caption: ['합계', '수량'], ref: 'totQntt', width: '6%', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,### '}, merge:false},
            {caption: ['합계', '중량'], ref: 'totWght', width: '6%', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###.## '}, merge:false},
            {caption: ['비고', '비고'], ref: 'rmrk', width: '16%', type: 'input', style: 'text-align:center', merge:false},
            {caption: ['거래처코드'], ref: 'cnptCd', type: 'output', hidden: true, merge:false},
        );

        /**
         * total cnt
         * 수량/중량(qntt/wght) 합계 컬럼 index
         * **/
        let sumCol = columns.map((col, index) =>
                // 대소문자 구분 없이
                (col.ref.toLowerCase().includes('qntt') || col.ref.toLowerCase().includes('wght')) ? index : -1
            ).filter(index => index !== -1);

        SBGridProperties.total = {
            type: 'grand',
            position: 'bottom',
            columns: {
                standard: [0],
                custom: sumCol,
                customFunc: function (ref, rowData) {
                    let gridData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
                    let sum = 0;

                    /** 입고 제외 합계 */
                    gridData.forEach(function(item,idx){
                       for(const [key,value] of Object.entries(item)) {
                           if (key === ref && item.gdsNm !== '입고') {
                               sum += Number(value);
                           }
                       }
                    });

                    return sum;
                }
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
        };

        SBGridProperties.columns = columns;
        grdSpmtPrfmnc = _SBGrid.create(SBGridProperties);
        grdSpmtPrfmnc.bind('valuechanged', 'fn_grdValueChanged');
        grdSpmtPrfmnc.rebuild();

    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListSpmtPrfmnc = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldSpmtPrfmnc,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldSpmtPrfmnc() {

        let prdcrNmCol = grdSpmtPrfmnc.getColRef('prdcrNm');
        grdSpmtPrfmnc.setColHidden(prdcrNmCol, false);
        grdSpmtPrfmnc.exportData("xlsx", "양송이 출고 등록", true);
        grdSpmtPrfmnc.setColHidden(prdcrNmCol, true);
    }

    /**
     * @name fn_addRow
     * @description 그리드 행 추가
     * @function
     */
    const fn_gridSet = function () {

        let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');

        if (gfn_isEmpty(prdcrCd)) {
            grdSpmtPrfmnc.setCellDisabled(0, 0, grdSpmtPrfmnc.getRows() -1, grdSpmtPrfmnc.getCols() -1, true);

        } else {
            let gridData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
            let wrhsRowIndex = gridData.findIndex(item => item.gdsNm === '입고') + grdSpmtPrfmnc.getFixedRows(); // header row 포함
            grdSpmtPrfmnc.setRowStyle(wrhsRowIndex, 'data', 'background', '#FFF8DC');

            for(let i=1; i<=jsonApcVrty.length; i++) {
                let wrhsYmdColKey = 'spmtYmd' + i;
                let wrhsYmdCol = grdSpmtPrfmnc.getColRef(wrhsYmdColKey);
                /** 입고 포장일자 disabled */
                grdSpmtPrfmnc.setCellDisabled(wrhsRowIndex, wrhsYmdCol, wrhsRowIndex, wrhsYmdCol, true);
                /** 포장일자 merge */
                grdSpmtPrfmnc.setMergeByFree(wrhsRowIndex+1, wrhsYmdCol, gridData.length + 1, wrhsYmdCol, true);

                gridData.forEach((item, index) => {

                    let rowData = JSON.parse(JSON.stringify(item));
                    let cnptCd = rowData.cnptCd;

                    if (cnptCd == '0007') {
                        let vrtyQnttKey = 'vrtyQntt' + i;
                        let vrtyQnttCol = grdSpmtPrfmnc.getColRef(vrtyQnttKey);
                        grdSpmtPrfmnc.setCellDisabled(index+2, vrtyQnttCol, index+2, vrtyQnttCol, true);
                        grdSpmtPrfmnc.setCellStyle('background', index+2, vrtyQnttCol, index+2, vrtyQnttCol, '#bbc4d1');
                    }
                })
            }
        }



    }

    /**
     * @name fn_grdValueChanged
     * @description 그리드 값 변경 이벤트
     * @function
     */
    const fn_grdValueChanged = function () {
        let nRow = grdSpmtPrfmnc.getRow();
        let nCol = grdSpmtPrfmnc.getCol();
        let getRowData = grdSpmtPrfmnc.getRowData(nRow);
        let getCellData = grdSpmtPrfmnc.getCellData(nRow, nCol);

        let getTotQnttRow = grdSpmtPrfmnc.getColRef('totQntt');
        let getRmrkCol = grdSpmtPrfmnc.getColRef('rmrk');
        let getTotWghtRow = grdSpmtPrfmnc.getColRef('totWght');
        let getRefOfCol = grdSpmtPrfmnc.getRefOfCol(nCol);

        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");

        let totQntt = 0;
        let totWght = 0;
        
        // TODO: 중량 = 수량 * 규격

        if (nCol != getRmrkCol) {
            /** 숫자 외의 값이 들어왔을때 */
            if (gfn_isEmpty(Number(getCellData))) {
                grdSpmtPrfmnc.setCellData(nRow, nCol, "", true);
                // return;
            }

            for (let i = 0; i < jsonApcVrty.length; i++) {

                let qntt = getRowData['vrtyQntt' + (i+1)] || 0;
                let wght = getRowData['vrtyWght' + (i+1)] || 0;
                let pckgYmd = getRowData['spmtYmd' + (i+1)];

                totQntt += parseInt(qntt);
                totWght += parseFloat(wght);

                /** 입고일자, 포장일자 비교 */
                if (!gfn_isEmpty(pckgYmd) && gfn_diffDate(wrhsYmd, pckgYmd) < 0) {
                    gfn_comAlert("W0014", "입고일자", "포장일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
                    grdSpmtPrfmnc.setCellData(nRow, nCol, "", true);
                    return;
                }
            }

            /** 포장일자 입력시 동일 포장일자 merge */
            if (getRefOfCol.includes('pckgYmd')) {
                jsonSpmtPrfmnc.forEach((spmtUnit, index) => {
                    if (index > 0) {
                        spmtUnit[getRefOfCol] = getCellData;
                    }
                });
            }

            grdSpmtPrfmnc.refresh();
            grdSpmtPrfmnc.setCellData(nRow, getTotQnttRow, totQntt, true);
            grdSpmtPrfmnc.setCellData(nRow, getTotWghtRow, totWght, true);
        }


    }

    /**
     * @name fn_onChangeWrhsYmd
     * @description 입고일자 변경 이벤트
     * @function
     */
    const fn_onChangeWrhsYmd = async function() {
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");

        let gridData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
        let wrhsRowIndex = gridData.findIndex(item => item.gdsNm === '입고') + grdSpmtPrfmnc.getFixedRows(); // header row 포함

        jsonApcVrty.forEach((item, index) => {
            let pckgYmdCol = grdSpmtPrfmnc.getColRef('pckgYmd' + (index + 1));
            grdSpmtPrfmnc.setCellData(wrhsRowIndex, pckgYmdCol, wrhsYmd, true);
        });

    }


    /**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function(){

        let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');
        let wrhsYmd = SBUxMethod.get('srch-dtp-wrhsYmd');

        if (gfn_isEmpty(wrhsYmd)) {
            gfn_comAlert("W0001", "거래시작일자");				//	W0002	{0}을/를 선택하세요.
            return;
        }

        const param = {
              apcCd			: gv_selectedApcCd
            , prdcrCd	    : prdcrCd
            , wrhsYmd		: wrhsYmd
            , itemCd        : itemCd
        }
        jsonSpmtPrfmnc.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                "/am/unty/selectRegSpmtPrfmncList.do",
                param,
                null,
                false
            );
            const data = await postJsonPromise;
            data.resultList.forEach((item, index) => {

                const spmtPrfmncVO = {
                      apcCd				: item.apcCd
                    , gdsNm             : item.gdsNm
                    , itemCd            : item.itemCd
                    , wrhsno1			: item.wrhsno1
                    , wrhsno2			: item.wrhsno2
                    , wrhsno3			: item.wrhsno3
                    , wrhsno4			: item.wrhsno4
                    , pltno1            : item.pltno1
                    , pltno2            : item.pltno2
                    , pltno3            : item.pltno3
                    , pltno4            : item.pltno4
                    , wrhsYmd1 			: item.wrhsYmd1
                    , wrhsYmd2 			: item.wrhsYmd2
                    , wrhsYmd3 			: item.wrhsYmd3
                    , wrhsYmd4 			: item.wrhsYmd4
                    , sortno1			: item.sortno1
                    , sortno2			: item.sortno2
                    , sortno3			: item.sortno3
                    , sortno4			: item.sortno4
                    , pckgno1			: item.pckgno1
                    , pckgno2			: item.pckgno2
                    , pckgno3			: item.pckgno3
                    , pckgno4			: item.pckgno4
                    , spmtno1			: item.spmtno1
                    , spmtno2			: item.spmtno2
                    , spmtno3			: item.spmtno3
                    , spmtno4			: item.spmtno4
                    , prdcrCd           : item.prdcrCd
                    , cnptCd			: item.cnptCd
                    , vrtyCd1           : item.vrtyCd1
                    , vrtyCd2           : item.vrtyCd2
                    , vrtyCd3           : item.vrtyCd3
                    , vrtyCd4           : item.vrtyCd4
                    , vrtyQntt1         : item.vrtyQntt1
                    , vrtyQntt2         : item.vrtyQntt2
                    , vrtyQntt3         : item.vrtyQntt3
                    , vrtyQntt4         : item.vrtyQntt4
                    , vrtyWght1         : item.vrtyWght1
                    , vrtyWght2         : item.vrtyWght2
                    , vrtyWght3         : item.vrtyWght3
                    , vrtyWght4         : item.vrtyWght4
                    , spmtPckgUnitCd1   : item.spmtPckgUnitCd1
                    , spmtPckgUnitCd2   : item.spmtPckgUnitCd2
                    , spmtPckgUnitCd3   : item.spmtPckgUnitCd3
                    , spmtPckgUnitCd4   : item.spmtPckgUnitCd4
                    , spmtYmd1          : item.spmtYmd1
                    , spmtYmd2          : item.spmtYmd2
                    , spmtYmd3          : item.spmtYmd3
                    , spmtYmd4          : item.spmtYmd4
                    , totQntt           : item.totQntt
                    , totWght           : item.totWght
                    , rmrk              : item.rmrk
                }
                jsonSpmtPrfmnc.push(spmtPrfmncVO);
            });
            let wrhsPrfmncList = JSON.parse(JSON.stringify(jsonSpmtPrfmnc.filter(item => item.gdsNm === '입고')));
            let spmtPrfmncList = JSON.parse(JSON.stringify(jsonSpmtPrfmnc.filter(item => item.gdsNm !== '입고')));
            spmtPrfmncList = fn_normalizeYmdList(spmtPrfmncList);

            jsonSpmtPrfmnc = [...wrhsPrfmncList, ...spmtPrfmncList]
            grdSpmtPrfmnc.rebuild();
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }

        fn_gridSet();
    }

    /**
     * @name fn_normalizeYmdList
     * @description 포장일자 통일
     */
    const fn_normalizeYmdList = function (data) {
        const fields = [];

        for (let i=1; i<=jsonApcVrty.length; i++) {
            fields.push('spmtYmd' + i);
        }

        if (!Array.isArray(data) || data.length === 0) return data;

        /**
         * 각 필드별로 유효한 ymd 값 찾기
         */
        const fieldValues = {};

        fields.forEach(field => {
            const validItem = data.find(
                item => item[field] !== undefined && item[field] !== null && String(item[field]).trim() !== ''
            );
            fieldValues[field] = validItem ? String(validItem[field]).trim() : '';
        });

        /**
         * 각 row의 필드 값을 통일
         */
        return data.map(item => {
            const updated = { ...item };
            fields.forEach(field => {
                updated[field] = fieldValues[field];
            });
            return updated;
        });
    }

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");

        if (gfn_isEmpty(prdcrCd)) {
            gfn_comAlert("W0002", "생산자");		//	W0002	{0}을/를 입력하세요.
            return;
        }

        if (gfn_isEmpty(wrhsYmd)) {
            gfn_comAlert("W0001", "입고일자");		//	W0001	{0}을/를 선택하세요.
            return;
        }
        let gridData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
        let wrhsList = JSON.parse(JSON.stringify(gridData.filter(item => item.gdsNm === '입고')));
        let spmtList = JSON.parse(JSON.stringify(gridData.filter(item => item.gdsNm !== '입고')));
        spmtList = fn_normalizeYmdList(spmtList);
        /**
         * 통합으로 실적 담을 객체 선언
         * 통합실적타입별로 실적을 생성 여부 판단. (R : 입고, W : 계량, S : 선별, P : 포장, D : 출하, 투입 : I)
         * 각각의 실적별 모듈 번호로 타입 설정
         * 현재 논산배수출 화면 기준
         * 입고 (R0 : 실적 생성 없음, R1 : 입고 단일 실적, R2 : 입고 다중 실적, R3 : 실적 강제 생성)
         * 계량 (W1 : 상세 실적 다중, W2 : 상세 단일 실적
         * 선별 (S0 : 실적 생성 없음, S1 : 실적 단일 생성, S2 : 실적 다중 생성, S3 : 실적 상세 생성)
         * 포장 (P0 : 실적 생성 없음, P1 : 실적 단일 생성, P2 : 실적 다중 생성, P3 : 실적 상세 생성)
         * 출하 (D0 : 실적 생성 없음, D1 : 실적 다중 생성, D2 : 실적 단일 생성)
         * 투입 (I0 : 실적 생성 없음, I1 : 실적 단일 생성, I2 : 실적 다중 생성, I3 : 실적 상세 생성)
         * untyPrfmncType 에 값 설정
         * EX)논산배수출영농조합 원물거래명세서 -> R1S2I1P2I2D0 (입고단일 ->선별투입단일 ->선별다중->포장투입다중->포장다중->출하없음)
         * */
        /**
         * 입고실적단일 -> 선별투입단일 -> 선별실적단일 -> 선별투입단일 -> 포장실적다중 -> 출하실적다중
         * */

        let untyPrfmncList = [];

        /**
         * 품종 별로 입고실적->선별실적->포장실적->출하실적 으로 묶는다.
         * 시스템 상 품종을 묶어서 진행이 불가함.
         * 참사랑의 경우는 입고일자, 생산자 기준으로 진행을 한다.
         * 입고일자기준으로 폼중별 실적으로 처리 한다.
         * 출하실적은 입고 실적이 있을 경우만 처리를 한다.
         * 입고실적은 있으나 포장실적이 없는 경우. 원물재고로 남겨둔다.
         * */
        for (let i=0; i<jsonApcVrty.length; i++) {

            let vrtyKey = 'vrtyCd' + (i+1);
            let vrtyQnttKey = 'vrtyQntt' + (i+1);
            let vrtyWghtKey = 'vrtyWght' + (i+1);
            let spmtYmdKey = 'spmtYmd' + (i+1);
            let wrhsnoKey = 'wrhsno' + (i+1);
            let pltnoKey = 'pltno' + (i+1);
            let sortnoKey = 'sortno' + (i+1);
            let pckgnoKey = 'pckgno' + (i+1);
            let spmtnoKey = 'spmtno' + (i+1);
            let spmtPckgUnitCdKey = 'spmtPckgUnitCd' + (i+1);

            if (wrhsList[0][vrtyQnttKey] != 0 && wrhsList[0][vrtyWghtKey] != 0) {

                /**
                 * 통합실적생성
                 * */
                let untyPrfmncVO = {
                      apcCd             : gv_selectedApcCd
                    , prdcrCd           : prdcrCd
                    , wrhsYmd           : wrhsYmd
                    , untyPrfmncType    : 'R1S1I1P2I2D2'
                    , rowSts            : 'I'
                };

                if (gfn_isEmpty(wrhsList[0][wrhsnoKey])) {
                    untyPrfmncVO.rowSts = 'I'
                } else {
                    untyPrfmncVO.rowSts = 'U'
                    untyPrfmncVO.wrhsno = wrhsList[0][wrhsnoKey];
                    untyPrfmncVO.sortno = wrhsList[0][sortnoKey];
                    untyPrfmncVO.pckgno = wrhsList[0][pckgnoKey];
                    untyPrfmncVO.pltno  = wrhsList[0][pltnoKey];
                }

                /**
                 * 입고실적생성
                 * */
                let rawMtrWrhsVO = {
                      apcCd         : gv_selectedApcCd
                    , wrhsYmd       : wrhsList[0][spmtYmdKey]
                    , pltno         : wrhsList[0][pltnoKey]
                    , bxQntt        : wrhsList[0][vrtyQnttKey]
                    , wght          : wrhsList[0][vrtyWghtKey]
                    , wrhsQntt      : wrhsList[0][vrtyQnttKey]
                    , wrhsWght      : wrhsList[0][vrtyWghtKey]
                    , itemCd        : wrhsList[0].itemCd
                    , vrtyCd        : wrhsList[0][vrtyKey]
                    , prdcrCd       : prdcrCd
                    , rmrk          : wrhsList[0].rmrk
                    , inptPrfmncYn  : 'Y'
                }

                if (gfn_isEmpty(wrhsList[0][wrhsnoKey])) {
                    rawMtrWrhsVO.rowSts = 'I'
                } else {
                    rawMtrWrhsVO.rowSts = 'U'
                    rawMtrWrhsVO.wrhsno = wrhsList[0][wrhsnoKey];
                }

                /**
                 * 포장실적 및 출하실적 생성
                 * 포장실적과 동시에 출하실적을 생성 하는 CASE
                 * 실적 VO는 따로 만들지 않음. 포장실적 기준으로 출하실적생성
                 * 포장 및 출하 실적 기준으로 선별실적 및 투입실적 생성
                 * */
                let sortQntt = 0;
                let sortWght = 0;

                let pckgPrfmncList = [];
                for (let j=0; j<spmtList.length; j++) {

                    let rowData  = JSON.parse(JSON.stringify(spmtList[j]));
                    let pckgQntt = parseInt(rowData[vrtyQnttKey]) || 0;
                    let pckgWght = parseFloat(rowData[vrtyWghtKey]) || 0;

                    if (pckgQntt > 0 || pckgWght > 0) {

                        let pckgYmd = rowData[spmtYmdKey];

                        if (gfn_isEmpty(pckgYmd)) {
                            gfn_comAlert("W0001", "포장일자");		//	W0001	{0}을/를 선택하세요.
                            return;
                        }

                        let pckgPrfmncVO = {
                              apcCd             : gv_selectedApcCd
                            , pckgYmd           : rowData[spmtYmdKey]
                            , itemCd            : rowData.itemCd
                            , vrtyCd            : rowData[vrtyKey]
                            , pckgQntt          : pckgQntt
                            , pckgWght          : pckgWght
                            , spmtQntt          : pckgQntt
                            , spmtWght          : pckgWght
                            , spmtPckgUnitCd    : rowData[spmtPckgUnitCdKey]
                            , spmtPrfmncYn      : 'Y'
                            , cnptCd            : rowData.cnptCd
                            , rmrk              : rowData.rmrk
                        }

                        if (gfn_isEmpty(rowData[pckgnoKey])) {
                            pckgPrfmncVO.rowSts = 'I'
                        } else {
                            pckgPrfmncVO.rowSts = 'U'
                            pckgPrfmncVO.pckgno = rowData[pckgnoKey];
                            pckgPrfmncVO.spmtno = rowData[spmtnoKey];
                        }

                        sortQntt += pckgQntt;
                        sortWght += pckgWght;
                        pckgPrfmncList.push(pckgPrfmncVO);
                    }
                }

                /**
                 * 포장실적이 있을 경우만 선별실적 생성
                 * */
                if (sortQntt > 0 && sortWght > 0) {
                    let sortPrfmncVO = {
                          apcCd             : gv_selectedApcCd
                        , inptYmd           : spmtList[0][spmtYmdKey]
                        , itemCd            : spmtList[0].itemCd
                        , vrtyCd            : spmtList[0][vrtyKey]
                        , sortQntt          : sortQntt
                        , sortWght          : sortWght
                        , rprsPrdcrCd       : prdcrCd
                        , inptPrfmncYn      : 'Y'
                    }

                    if (gfn_isEmpty(wrhsList[0][sortnoKey])) {
                        sortPrfmncVO.rowSts = 'I'
                    } else {
                        sortPrfmncVO.rowSts = 'U'
                        sortPrfmncVO.sortno = wrhsList[0][sortnoKey];
                    }

                    untyPrfmncVO.sortPrfmncVO = sortPrfmncVO;
                    rawMtrWrhsVO.inptPrfmncYn = 'Y'
                }

                if (pckgPrfmncList.length != 0) {
                    untyPrfmncVO.pckgPrfmncList = pckgPrfmncList;
                }

                untyPrfmncVO.rawMtrWrhsVO = rawMtrWrhsVO;
                untyPrfmncList.push(untyPrfmncVO);
            } else {
                let sortQntt = 0;
                let sortWght = 0;
                for (let k=0; k<spmtList.length; k++) {

                    let rowData  = JSON.parse(JSON.stringify(spmtList[k]));
                    let pckgQntt = parseInt(rowData[vrtyQnttKey]) || 0;
                    let pckgWght = parseFloat(rowData[vrtyWghtKey]) || 0;
                    sortQntt += pckgQntt;
                    sortWght += pckgWght;
                }

                if (sortQntt > 0 || sortWght > 0) {
                    gfn_comAlert("W0002", "입고");		//	W0002	{0}을/를 입력하세요.
                    return;
                }
            }
        }

        if (untyPrfmncList.length == 0) {
            gfn_comAlert("W0003", "저장");		    //	W0003	{0}할 대상이 없습니다.
            return;
        }

        if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
            const postJsonPromise = gfn_postJSON("/am/unty/multiUntyPrfmncList.do", untyPrfmncList);
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {

                    gfn_comAlert("I0001");					// I0001 처리 되었습니다.
                    fn_search();

                } else {
                    gfn_comAlert(data.resultCode, data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }

    }


    const fn_del = async function () {

        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");

        if (gfn_isEmpty(prdcrCd)) {
            gfn_comAlert("W0002", "생산자");		//	W0002	{0}을/를 입력하세요.
            return;
        }

        if (gfn_isEmpty(wrhsYmd)) {
            gfn_comAlert("W0001", "입고일자");		//	W0001	{0}을/를 선택하세요.
            return;
        }
        let untyPrfmncList = [];

        let gridData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
        let wrhsList = JSON.parse(JSON.stringify(gridData.filter(item => item.gdsNm === '입고')));
        let spmtList = JSON.parse(JSON.stringify(gridData.filter(item => item.gdsNm !== '입고')));
        for (let i=0; i<jsonApcVrty.length; i++) {

            let wrhsnoKey = 'wrhsno' + (i+1);
            let sortnoKey = 'sortno' + (i+1);
            let pckgnoKey = 'pckgno' + (i+1);
            let spmtnoKey = 'spmtno' + (i+1);

            let wrhsno = wrhsList[0][wrhsnoKey];

            if (!gfn_isEmpty(wrhsno)) {
                /**
                 * 통합실적생성
                 * */
                let untyPrfmncVO = {
                    apcCd     : gv_selectedApcCd
                    , wrhsno    : wrhsno
                    , sortno    : wrhsList[0][sortnoKey]
                    , pckgno    : wrhsList[0][pckgnoKey]
                }
                let spmtPrfmncList = [];
                for (let i=0; i<spmtList.length; i++) {
                    let spmtno = spmtList[i][spmtnoKey];

                    if (!gfn_isEmpty(spmtno)) {
                        let spmtPrfmncVO = {
                            apcCd     : gv_selectedApcCd
                            , spmtno    : spmtno
                            , pckgno    : wrhsList[0][pckgnoKey]
                        }
                        spmtPrfmncList.push(spmtPrfmncVO);
                    }
                }

                if (spmtPrfmncList.length > 0) {
                    untyPrfmncVO.spmtPrfmncList = spmtPrfmncList;
                }
                untyPrfmncList.push(untyPrfmncVO);
            }
        }

        if (untyPrfmncList.length == 0) {
            gfn_comAlert("W0003", "삭제");		    //	W0003	{0}할 대상이 없습니다.
            return;
        }

        if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
            const postJsonPromise = gfn_postJSON("/am/unty/deleteUntyPrfmncList.do", untyPrfmncList);
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {

                    gfn_comAlert("I0001");					// I0001 처리 되었습니다.
                    fn_search();

                } else {
                    gfn_comAlert(data.resultCode, data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }




    /* 생산자 팝업 호출 필수 function  */
    /* Start */
    /**
     * @name fn_getPrdcrs
     * @description 생산자 리스트 호출
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
        jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
        jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
        jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function (s, b, i, c) {
        for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
        return b;
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){

        fn_clearPrdcr();
        if(getByteLengthOfString(prdcrNm.target.value) > 100){
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    async function fn_onSelectPrdcrNm(value, label, item) {

        SBUxMethod.set("srch-inp-prdcrCd", value);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

        let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
        fn_setPrdcrForm(prdcr);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrIdentno", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function(prdcr) {
        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            fn_setPrdcrForm(prdcr);
        }

    }



    const fn_setPrdcrForm = async function(prdcr) {
        if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
        } else {
            SBUxMethod.set("srch-inp-prdcrIdentno", "");
        }
    }

    const fn_getCnptList = async function(){

        let crtr = SBUxMethod.get("dtl-rdo-crtr");
        let url = '';

        if (crtr === 'CNPT') {
            url = '/am/cmns/selectCnptSpmtPckgUnitList.do';
        } else {
            url = '/am/cmns/selectSpmtPckgUnitCnptList.do';
        }

        const postJsonPromise = gfn_postJSON(url, {apcCd: gv_selectedApcCd, itemCd: itemCd});
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        jsonCnptSpmtPckgUnitList.length = 0;
        jsonCnptSpmtPckgUnitList = data.resultList.filter(item => item.useYn === 'Y');
    }

    /**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function(){
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-inp-prdcrNm", "");
        fn_clearPrdcr();
        fn_search();
    }

</script>
</html>