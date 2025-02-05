<%
    /**
     * @Class Name : shpgotPrfmncRawMtr.jsp
     * @Description : 반품실적조회(원물) 화면
     * @author SI개발부
     * @since 2024.11.25
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2024.11.25     손민성       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 계량현황 조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 반품실적조회(원물) -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btn-delete"
                        name="btn-delete"
                        uitype="normal"
                        text="반품취소"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_delete"
                ></sbux-button>
                <sbux-button
                        id="btn-search"
                        name="btn-search"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <table id="searchTable" class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 6%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg">반품일자</th>
                        <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                            <sbux-datepicker
                                    uitype="range"
                                    id="srch-dtp-shpgotYmd"
                                    name="srch-dtp-shpgotYmd"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                    wrap-class="displayFlex"
                                    wrap-style="border:0;padding:0;"
                            />
                        </td>
                        <th scope="row" class="th_bg">품목/품종</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-itemCd"
                                    name="srch-slt-itemCd"
                                    class="form-control input-sm input-sm-ast"
                                    jsondata-ref="jsonApcItem"
                                    onchange="fn_onChangeSrchItemCd(this)"
                            />
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-vrtyCd"
                                    name="srch-slt-vrtyCd"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcVrty"
                                    jsondata-value="itemVrtyCd"
                                    jsondata-text="vrtyNm"
                                    onchange="fn_onChangeSrchVrtyCd(this)"
                            />
                        </td>
                        <td></td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-prdcrNm"
                                    name="srch-inp-prdcrNm"
                                    class="form-control input-sm input-sm-ast"
                                    placeholder="초성검색 가능"
                                    autocomplete-ref="jsonPrdcrAutocomplete"
                                    autocomplete-text="name"
                                    autocomplete-height="270px"
                                    onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
                                    autocomplete-select-callback="fn_onSelectPrdcrNm"
                            ></sbux-input>
                            <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
                        <td class="td_input">
                            <sbux-button
                                    id="srch-btn-prdcrNm"
                                    name="srch-btn-prdcrNm"
                                    class="btn btn-xs btn-outline-dark"
                                    text="찾기"
                                    uitype="modal"
                                    target-id="modal-prdcr"
                                    onclick="fn_choicePrdcr"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">창고구분</th>
                        <td class="td_input" colspan="2" style="border-right: hidden">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-warehouseSeCd"
                                    name="srch-slt-warehouseSeCd"
                                    class="form-control input-sm"
                                    style="width: 80%"
                                    jsondata-ref="jsonComWarehouse">
                            </sbux-select>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg">컨테이너/팔레트</th>
                        <td colspan= "5" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-pltno"
                                    name="srch-inp-pltno"
                                    class="form-control input-sm"
                                    autocomplete="off"
                            />
                        </td>
                        <td colspan= "2">쉼표로 분리</td>
                    </tr>
                </tbody>
            </table>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>반품실적 목록</span>
                        <span style="font-size:12px">(조회건수 <span id="cnt-rslt">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-grdRslt" style="height:484px;"></div>
            </div>
        </div>
    </div>
</section>
<!-- 사용자 선택 Modal -->
<div>
    <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
</body>
<script type="application/javascript">

    /** select Json **/
    var jsonComWarehouse = [];
    var jsonApcItem = [];
    var jsonApcVrty = [];

    /** 생산자 자동완성 **/
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    var grdRslt;
    var jsonRslt = [];


    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });

    const fn_init = async function(){
        jsonRslt
        jsonRslt.length = 0;

        // 일자 설정
        const nowDate = new Date();

        let firstYmd = gfn_dateFirstYmd(nowDate);
        let lastYmd = gfn_dateToYmd(nowDate);

        SBUxMethod.set("srch-dtp-shpgotYmd", firstYmd + "," + lastYmd);

        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, 	gv_selectedApcCd),
            gfn_setApcVrtySBSelect("srch-slt-vrtyCd", jsonApcVrty, 	gv_selectedApcCd),
            fn_getPrdcrs(),
        ]);

        await fn_createGrid();
    }

    /**
     * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }

    /**
     * @name fn_createGrid
     * @description 반품대상 그리드 생성
     * @function
     */
    const fn_createGrid = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdRslt';
        SBGridProperties.id = 'grdRslt';
        SBGridProperties.jsonref = 'jsonRslt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.frozencols = 3;
        SBGridProperties.columns = [
            {
                caption : ["선택","선택"],
                ref: 'checkedYn', type: 'checkbox',  width:'50px',
                style: 'text-align:center',
                userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {   caption: ["반품정보","일자"],
                ref: 'shpgotYmd',
                type: 'output',
                width:'120px',
                style: 'text-align:center',
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {   caption: ["반품정보","순번"],
                ref: 'shpgotSn',
                type: 'output',
                width:'50px',
                style: 'text-align:right',
            },
            {
                caption: ["컨테이너<br>팔레트","컨테이너<br>팔레트"],
                ref: 'pltno',
                type: 'output',
                width:'120px',
                style: 'text-align:center'
            },
            {
                caption: ["생산자","생산자"],
                ref: 'prdcrNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["품목","품목"],
                ref: 'itemNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["품종","품종"],
                ref: 'vrtyNm',
                type: 'output',
                width:'100px',
                style: 'text-align:center'
            },
            {
                caption: ["등급","등급"],
                ref: 'grdNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["창고","창고"],
                ref: 'warehouseSeCd',
                type: 'combo',
                width:'120px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonComWarehouse',
                    label:'label',
                    value:'value',
                    displayui : false,
                },
                disabled: true,
            },
            {
                caption: ["반품실적","수량"],
                ref: 'shpgotQntt',
                type: 'output',
                width:'70px',
                style: 'text-align:right',
                userattr: {colNm: "shpgotQntt"},
                format : {type:'number', rule:'#,###'},
            },
            {
                caption: ["반품실적","중량 (Kg)"],
                ref: 'shpgotWght',
                type:'output',
                width:'70px',
                style: 'text-align:right',
                userattr: {colNm: "shpgotWght"},
                format : {type:'number', rule:'#,###'},
            },
            {
                caption: ["반품사유","원인코드"],
                ref: 'shpgotCsNm',
                type: 'output',
                width:'120px',
                style: 'text-align:center',
            },
            {
                caption: ["반품사유","불량코드"],
                ref: 'shpgotBadNm',
                type: 'output',
                width:'120px',
                style: 'text-align:center',
            },
            {
                caption: ["반품사유","비고"],
                ref: 'shpgotRmrk',
                type:'output',
                width:'200px',
                style: 'text-align:left',
                userattr: {colNm: "shpgotRmrk"},
            },
        ];

        grdRslt = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_search
     * @description 조회 버튼
     * @function
     */
    const fn_search = async function() {
        await fn_setGrdRslt();
    }


    /**
     * @name fn_setGrdRslt
     * @description 반품실적 조회
     * @function
     */
    const fn_setGrdRslt = async function() {

        jsonRslt.length = 0;

        // 재고 조회
        let shpgotYmdFrom = SBUxMethod.get('srch-dtp-shpgotYmd_from');    // 입고일자from
        let shpgotYmdTo = SBUxMethod.get('srch-dtp-shpgotYmd_to');        // 입고일자to
        let prdcrCd = gfn_nvl(SBUxMethod.get("srch-inp-prdcrCd"));		// 생산자
        let itemCd = SBUxMethod.get("srch-slt-itemCd");				    // 품목
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");                 // 품종
        let pltno = gfn_nvl(SBUxMethod.get("srch-inp-pltno"));
        if (!gfn_isEmpty(vrtyCd)) {
            vrtyCd = vrtyCd.substring(4);
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/shpgot/selectShpgotRsltRawMtrList.do", {
                apcCd: gv_selectedApcCd,
                shpgotYmdFrom: shpgotYmdFrom,
                shpgotYmdTo: shpgotYmdTo,
                prdcrCd: prdcrCd,
                itemCd: itemCd,
                vrtyCd: vrtyCd,
                pltno: pltno,
            });

            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                data.resultList.forEach((item, index) => {
                    jsonRslt.push(item);
                });

                grdRslt.rebuild();

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }

        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        document.querySelector('#cnt-rslt').innerText = jsonRslt.length;
    }


    /**
     * @name fn_choicePrdcr
     * @description 생산자 팝업 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 callback
     */
    const fn_setPrdcr = function(prdcr) {
        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
        } else {
            fn_clearPrdcr();
        }
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){
        fn_clearPrdcr();
        if (gfn_getByteLengthOfString(prdcrNm.target.value) > 100){
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrNm", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
    }

    /**
     * @name fn_onKeyUpPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onKeyUpPrdcrNm = function(prdcrNm){

        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");

        if (gfn_getByteLengthOfString(prdcrNm) > 100){
            SBUxMethod.set("srch-inp-prdcrNm", "");

            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if (jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
            document.getElementById('srch-btn-prdcrNm').click();
        } else{
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
        }
    }


    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),
        ]);
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        const itemCd = vrtyCd.substring(0,4);

        const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
        if(!gfn_isEmpty(vrtyCd)){
            if (itemCd != prvItemCd) {
                SBUxMethod.set("srch-slt-itemCd", itemCd);
                await fn_onChangeSrchItemCd({value: itemCd});
                SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
            } else{
                SBUxMethod.set("srch-slt-itemCd", itemCd);
                await fn_onChangeSrchItemCd({value: itemCd});
                SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
            }
        }
    }

    /**
     * @name fn_delete
     * @description 반품취소
     * @function
     */
    const fn_delete = async function(){


        const shpgotList = []

        // 반품 수량, 중량 확인
        const allData = grdRslt.getGridDataAll();

        for ( let i=0; i<allData.length; i++ ) {
            const shpgot = allData[i];

            if (_.isEqual("Y", shpgot.checkedYn)) {
                shpgotList.push(shpgot);
            }
        }

        if (shpgotList.length == 0) {
            gfn_comAlert("W0003", "반품취소");       // {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "반품취소")){
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            rsltList: shpgotList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/shpgot/deleteShpgotRsltRawMtr.do", param);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                await fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }
        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>