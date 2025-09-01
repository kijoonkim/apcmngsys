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
<section class="content container-fluid">
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
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_search"
                        text="조회"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-primary"
                        onclick="fn_save"
                        text="저장"
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
                    <th class="th_bg">기준</th>
                    <td class="td_input" colspan="3" style="border-right: hidden">
                        <p class="ad_input_row">
                            <sbux-radio id="dtl-rdo-crtr_1" name="dtl-rdo-crtr" uitype="normal" class="radio_label" value="1"></sbux-radio>
                            <sbux-label class="radio_label bold" for-id="dtl-rdo-crtr_1" text="거래처"></sbux-label>
                        </p>
                        <p class="ad_input_row">
                            <sbux-radio id="dtl-rdo-crtr_2" name="dtl-rdo-crtr" uitype="normal" class="radio_label" value="2" checked></sbux-radio>
                            <sbux-label class="radio_label bold" for-id="dtl-rdo-crtr_2" text="상품"></sbux-label>
                        </p>
                    </td>
                    <td colspan="4"></td>
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
                                onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)">
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
    var jsonCnptCd                  = [];   // 거래처
    var jsonGdsCd                   = [];   // 상품

    const itemCd = '1702';                    // 품목코드 - 양송이

    window.addEventListener("DOMContentLoaded", function () {
        fn_init();
    });
    const fn_init = async function () {

        let result = await Promise.all([
            gfn_getApcVrty(gv_selectedApcCd),
            gfn_getSpmtPckgUnits(gv_selectedApcCd),

            getCnptList(),
        ])

        jsonApcVrty = result[0];
        jsonSpmtPckgUnit = result[1];

        /** sn 순서보장 **/
        jsonApcVrty = jsonApcVrty.sort((a, b) => a.sn - b.sn);
        jsonApcVrty = jsonApcVrty.filter(item => item.useYn === 'Y');

        fn_getPrdcrs();
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));

        await fn_createSmptPrfmncGrid();
    }

    const fn_createSmptPrfmncGrid = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-spmtPrfmnc';
        SBGridProperties.id = 'grdSpmtPrfmnc';
        SBGridProperties.jsonref = 'jsonSpmtPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        // SBGridProperties.mergecells = 'bycol';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.scrollbubbling = false;

        let columns = [
            {caption: ['거래처 / 품목', '거래처 / 품목'], ref: 'spmtPckgUnitNm', width: '120px', type: 'output', style: 'text-align:center', merge:false},
        ];

        jsonApcVrty.forEach((item, index) => {
            columns.push(
                {caption: [item.vrtyNm, '수량'], ref: 'qntt_' + item.vrtyCd, width: '80px', datatype : 'number', type: 'input', style: 'text-align:right', format : {type:'number', rule:'#,### '}, merge:false},
                {caption: [item.vrtyNm, '중량'], ref: 'wght_' + item.vrtyCd, width: '80px', datatype : 'number', type: 'input', style: 'text-align:right', format : {type:'number', rule:'#,###.## '}, merge:false},
                {caption: [item.vrtyNm, '포장일자'], ref: 'pckgYmd_' + item.vrtyCd, width:'100px', type: 'datepicker', style:'text-align:center; background-color:#FFF8DC;', format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'},
                    typeinfo : {onclickedit: true, hideeditesckey: true, displayui: false}, merge:false
                },
            );
        });

        columns.push(
            {caption: ['합계', '수량'], ref: 'totalQntt', width: '80px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,### '}, merge:false},
            {caption: ['합계', '중량'], ref: 'totalWght', width: '80px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###.## '}, merge:false},
            {caption: ['비고', '비고'], ref: 'rmrk', width: '80px', type: 'input', style: 'text-align:center', merge:false},

            {caption: ['상품(거래처)코드'], ref: 'spmtPckgUnitCd', type: 'output', hidden: true, merge:false},
        );

        /** total cnt **/
        let sumCol = [...Array(columns.length - 2).keys()].map(n => n + 1).filter(n => n % 3 !== 0);

        SBGridProperties.total = {
            type: 'grand',
            position: 'bottom',
            columns: {
                standard: [0],
                custom: sumCol,
                customFunc: function (ref, rowData) {
                    let gridData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
                    let sum = 0;

                    gridData.forEach(function(item,idx){
                       for(const [key,value] of Object.entries(item)) {
                           if (key === ref && item.spmtPckgUnitCd !== '') {
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
        grdSpmtPrfmnc = await _SBGrid.create(SBGridProperties);
        grdSpmtPrfmnc.bind('valuechanged', 'fn_grdValueChanged');

        await fn_addRow();
    }

    const fn_addRow = async function () {
        const columns = grdSpmtPrfmnc.getColumns();
        const columnRefs = columns.map(col => col.ref);

        const createRow = (spmtPckgUnitCd, spmtPckgUnitNm) => {
            const row = { spmtPckgUnitCd, spmtPckgUnitNm };
            columnRefs.forEach(ref => {
                if (ref !== 'spmtPckgUnitNm' && ref !== 'spmtPckgUnitCd') {
                    row[ref] = '';
                }
            });
            return row;
        };

        const initJson = [createRow('', '입고')];
        jsonSpmtPckgUnit.forEach(item => {
            initJson.push(createRow(item.spmtPckgUnitCd, item.spmtPckgUnitNm));
        });

        jsonSpmtPrfmnc = [...initJson];
        grdSpmtPrfmnc.rebuild();

        /** 입고 row 설정 */
        grdSpmtPrfmnc.setRowStyle(2, 'data', 'background', '#FFF8DC');
        for (let i = 0; i < columns.length - 2; i++) {
            /** 입고 포장일자 disabled */
            if (i % 3 === 0 && i > 0) {
                grdSpmtPrfmnc.setCellDisabled(2, i, 2, i, true);

                /** 포장일자 merge */
                grdSpmtPrfmnc.setMergeByFree(3, i, jsonSpmtPckgUnit.length + 2, i, true);
            }
            /** 파지(중량) - 0015 수량 disabled
             * 운영반영시 달라질수 있으므로 확인 필요
             * */
            if (i % 3 === 1) {
                let rowIndex = jsonSpmtPrfmnc.findIndex(item => item.spmtPckgUnitCd === '0015') + grdSpmtPrfmnc.getFixedRows();

                grdSpmtPrfmnc.setCellDisabled(rowIndex, i, rowIndex, i, true);
                grdSpmtPrfmnc.setCellStyle('background-color', rowIndex, i, rowIndex, i, '#D3D3D3');
            }
        }
    }

    /**
     * 추후 수정할것
     * 중량 = 수량 * 규격
     * */
    const fn_grdValueChanged = function () {
        let nRow = grdSpmtPrfmnc.getRow();
        let nCol = grdSpmtPrfmnc.getCol();
        let getRowData = grdSpmtPrfmnc.getRowData(nRow);
        let getCellData = grdSpmtPrfmnc.getCellData(nRow, nCol);

        let getTotQnttRow = grdSpmtPrfmnc.getColRef('totalQntt');
        let getTotWghtRow = grdSpmtPrfmnc.getColRef('totalWght');
        let getRefOfCol = grdSpmtPrfmnc.getRefOfCol(nCol);

        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");

        let totQntt = 0;
        let totWght = 0;

        /** 숫자 외의 값이 들어왔을때 */
        if (gfn_isEmpty(Number(getCellData))) {
            grdSpmtPrfmnc.setCellData(nRow, nCol, "", true);
            return;
        }

        jsonApcVrty.forEach(item => {
            let qntt = getRowData['qntt_' + item.vrtyCd] || 0;
            let wght = getRowData['wght_' + item.vrtyCd] || 0;

            totQntt += parseInt(qntt);
            totWght += parseFloat(wght);

            /** 입고일자, 포장일자 비교 */
            if (gfn_diffDate(getRowData['pckgYmd_' + item.vrtyCd], wrhsYmd) < 0) {
                gfn_comAlert("W0014", "포장일자", "입고일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
                grdSpmtPrfmnc.setCellData(nRow, nCol, "", true);
                return;
            }
        });

        if (getRefOfCol.includes('pckgYmd_')) {
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

    /* 생산자 팝업 호출 필수 function  */
    /* Start */
    /**
     * @name fn_getPrdcrs
     * @description 생산자 리스트 호출
     */
    const fn_getPrdcrs = async function () {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
        jsonPrdcrDtl = await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
        jsonPrdcrDtl = gfn_setFrst(jsonPrdcrDtl);
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function (s, b, i, c) {
        for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1) ;
        return b;
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function (prdcrNm) {

        fn_clearPrdcr();
        if (getByteLengthOfString(prdcrNm.target.value) > 100) {
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
    function fn_onSelectPrdcrNm(value, label, item) {

        SBUxMethod.set("srch-inp-prdcrCd", value);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

        let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
        fn_setPrdcrForm(prdcr);
        fn_setPrdcrFormDtl(prdcr);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function () {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrNm", "");
        SBUxMethod.set("srch-inp-prdcrIdentno", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function () {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function (prdcr) {
        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

            fn_setPrdcrForm(prdcr)
        }
    }


    const fn_setPrdcrForm = async function (prdcr) {
        if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
        } else {
            SBUxMethod.set("srch-inp-prdcrIdentno", "");
        }
    }

    const getCnptList = async function(){
        const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {apcCd: gv_selectedApcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        jsonCnptCd = data.resultList.map(item => {
            return {
                cnptCd: item.cnptCd,
                cnptNm: item.cnptNm,
                sn: item.sn
            };
        });
    }

    /**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function(){
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        fn_clearPrdcr();

        // grid 초기화
        fn_addRow();
    }

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");

        let vrtyCd = '';			// 품종코드

        let warehouseSeCd = "1";	// 창고구분 : 원물창고
        let wrhsSeCd = "2";			// 입고구분 : 수탁
        let gdsSeCd = "1";			// 상품구분
        let trsprtSeCd = "1";		// 운송구분

        const rawMtrWrhsList = [];
        const spmtPrfmncList = [];

        // if (gfn_isEmpty(prdcrCd)) {
        //     gfn_comAlert("W0002", "생산자");		//	W0002	{0}을/를 입력하세요.
        //     return;
        // }

        if (gfn_isEmpty(wrhsYmd)) {
            gfn_comAlert("W0001", "입고일자");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        let getGrdData = grdSpmtPrfmnc.getGridDataAllExceptTotal();
        let toTalRow = grdSpmtPrfmnc.getGridDataAll();
        toTalRow = toTalRow[toTalRow.length - 1];

        /** 저장대상 없음 **/
        const even = (el) => !!Number(el['totalWght']);

        // 입고데이터
        let wrhsList = getGrdData.filter(item => item.spmtPckgUnitCd === '');
        if (!wrhsList.some(even)) {
            gfn_comAlert("W0005", "입고정보");		//	W0005	{{0}이/가 없습니다.
            return;
        }
        // 출고데이터
        let spmtList = getGrdData.filter(item => item.spmtPckgUnitCd !== '');
        if (!spmtList.some(even)) {
            gfn_comAlert("W0003", "출고");		    //	W0003	{0}할 대상이 없습니다.
            return;
        }

        // 등급 설정
        const stdGrdList = [];
        let grdCd;

        await gStdGrdObj.init(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd);

        if (gjsonStdGrdObj_1.length > 0) {
            stdGrdList.push({
                grdSeCd: _GRD_SE_CD_WRHS,
                itemCd: itemCd,
                grdKnd: gjsonStdGrdObj_1[0].grdKnd,
                grdCd: gjsonStdGrdObj_1[0].grdCd,
            });

            grdCd = gjsonStdGrdObj_1[0].grdCd;
        }

        wrhsList.forEach(item => {
            for (let i = 0; i < jsonApcVrty.length; i++) {
                let vrtyCdKey = JSON.parse(JSON.stringify(jsonApcVrty[i])).vrtyCd;;
                let vrtyQntt = item['qntt_' + vrtyCdKey] || 0;
                let vrtyWght = item['wght_' + vrtyCdKey] || 0;

                const rawMtrWrhs = {
                    apcCd: gv_selectedApcCd,
                    wrhsYmd: wrhsYmd,
                    wrhsSeCd: wrhsSeCd,
                    gdsSeCd: gdsSeCd,
                    trsprtSeCd: trsprtSeCd,
                    itemCd: itemCd,
                    vrtyCd: vrtyCdKey,
                    prdcrCd: prdcrCd,
                    bxQntt: vrtyQntt,
                    wrhsWght: vrtyWght,
                    warehouseSeCd: warehouseSeCd,
                    grdCd: grdCd,
                    // prdctnYr: prdctnYr,
                    stdGrdList: stdGrdList
                };
                rawMtrWrhsList.push(rawMtrWrhs);
            }
        });

        console.log(rawMtrWrhsList, "rawMtrWrhsList");

        spmtList = spmtList.filter(item => item.totalQntt !=='' || item.totalWght !== '');
        spmtList.forEach(item => {
            // const entry = Object.entries(item).find(([key, value]) => {
            //     return key.startsWith('qntt_') && value;
            // });
            // console.log(entry, "entry");

            for (let i = 0; i < jsonApcVrty.length; i++) {
                let vrtyCdKey = JSON.parse(JSON.stringify(jsonApcVrty[i])).vrtyCd;;
                let vrtyQntt = item['qntt_' + vrtyCdKey] || 0;
                let vrtyWght = item['wght_' + vrtyCdKey] || 0;
                let spmtYmd = item['pckgYmd_' + vrtyCdKey];


                // 수량, 중량
                if (vrtyQntt !== 0 && spmtYmd === '') {
                    gfn_comAlert("W0001", "포장일자");		//	W0001	{0}을/를 선택하세요.
                    return;
                }

                const spmtPrfmnc = {
                    apcCd: gv_selectedApcCd,
                    spmtYmd: spmtYmd,
                    // cnptCd: cnptCd,
                    spmtPckgUnitCd: item.spmtPckgUnitCd,
                    itemCd: itemCd,
                    vrtyCd: vrtyCdKey,
                    // spcfctCd: spcfctCd,
                    // spcfctWght: crtrWght,
                    spmtQntt: vrtyQntt,
                    spmtWght : vrtyWght,
                    warehouseSeCd: warehouseSeCd,
                    // dudtYmd: dudtYmd,
                    // ntslAmt: ntslAmt,
                    // gdsGrd : gdsGrd,
                    // pckgno : pckgno
                }
                spmtPrfmncList.push(spmtPrfmnc);
            }
        });

        console.log(spmtPrfmncList, "spmtPrfmncList");

        // jsonApcVrty.forEach(item => {
        //     /** 수량, (중량) 유효성 검사 */
        //     if (!gfn_isEmpty(getGrdData['pckgYmd_' + item.vrtyCd]) && gfn_isEmpty(getGrdData['wght_' + item.vrtyCd])) {
        //         gfn_comAlert("W0003", "출고");		//	W0003	{0}할 대상이 없습니다.
        //         grdSpmtPrfmnc.setCellData(nRow, nCol, "", true);
        //         return;
        //     }
        // });


    }
</script>
</html>