<%
    /**
     * @Class Name : regRawMtrWghWrhs.jsp
     * @Description : 원물계량 입고등록 화면
     * @author SI개발부
     * @since 2024.10.29
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.10.29   	손민성			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 원물계량등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>

    </style>
</head>
<body>
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; gap :10px;justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 -->
                <sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
                </sbux-label>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <jsp:include page="../../../frame/inc/apcSelectColSize.jsp">
                <jsp:param name="colgroupData" value="[{width:20%},{width:30%},{width:20%},{width:30%}]"/>
                <jsp:param name="addElements" value=""/>
            </jsp:include>
            <!--[APC] END -->
            <table id="searchTable" class="table table-bordered tbl_fixed" style="margin-bottom: 15px">
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 30%">
                    <col style="width: 20%">
                    <col style="width: 30%">
                </colgroup>
                <tboy>
                    <tr>
                        <th scope="row" class="th_bg">품목/품종</th>
                        <td class="td_input">
                            <div style="display: flex;gap: 5px">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm input-sm-ast"
                                        jsondata-ref="jsonApcItem"
                                        onchange="fn_onChangeSrchItemCd(this)"
                                ></sbux-select>
                                <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-vrtyCd"
                                        name="srch-slt-vrtyCd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        jsondata-ref="jsonApcVrty"
                                        onchange="fn_onChangeSrchVrtyCd(this)"
                                ></sbux-select>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">
                            생산자
                        </th>
                        <td class="td_input">
                            <div style="display: flex; gap: 5px">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrNm"
                                        name="srch-inp-prdcrNm"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        placeholder="초성검색 가능"
                                        wrap-style="flex-basis:50%"
                                        autocomplete-ref="jsonPrdcrAutocomplete"
                                        autocomplete-text="name"
                                        autocomplete-height="270px"
                                        oninput="fn_onInputPrdcrNm(event)"
                                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                                ></sbux-input>
                                <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
                                <sbux-button
                                        id="btn-srch-prdcr"
                                        name="btn-srch-prdcr"
                                        class="btn btn-sm btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-prdcr"
                                        onclick="fn_choicePrdcr"
                                ></sbux-button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">
                            팔레트번호
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-pltno"
                                    name="srch-inp-pltno"
                                    class="form-control input-sm"
                                    style="width: 50%"
                                    autocomplete="off"
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">
                            작업자
                        </th>
                        <td class="td_input">
                            <div style="display: flex; gap: 10px">
                                <sbux-input
                                        id="srch-inp-flnm"
                                        name="srch-inp-flnm"
                                        uitype="text"
                                        class="form-control input-sm"
                                        wrap-style="flex-basis:50%"
                                        autocomplete="off"
                                ></sbux-input>
                                <sbux-button
                                        id="dtl-btn-rawMtrInvntr"
                                        name="dtl-btn-rawMtrInvntr"
                                        class="btn btn-sm btn-outline-danger btn-mbl"
                                        text="찾기"
                                        uitype="modal"
                                        target-id="modal-oprtr"
                                        onclick="fn_modalOprtr"
                                ></sbux-button>
                            </div>
                        </td>
                    </tr>
                </tboy>
            </table>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>작업일지 상세</span>
                    </li>
                </ul>
            </div>
            <div id="sb-area-rawMtrList" style="width: 100%;height: 500px"></div>
        </div>
    </div>
</section>
<!-- 생산자 선택 Modal -->
<div>
    <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
<!-- 생산작업자 선택 Modal -->
<div>
    <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 선택" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-oprtr">
    <jsp:include page="../../am/popup/oprtrPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
    var jsonApcItem			= [];	// 품목 		itemCd		검색
    var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
    var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
    var jsonComWarehouse	= [];	// 창고 		warehouse	검색
    var jsonApcBx			= [];	// 팔레트/박스 	검색
    var jsonSpcfctCd        = [];   // 규격
    var jsonJobClsf         = [];   // 검수자

    var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
    var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
    var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

    /* 생산자 자동완성 */
    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

    /* SBGrid */
    var grdRawMtrWrhs;
    /* SBGrid Data (JSON) */
    var jsonRawMtrWrhs = [];

    /*최근조회 데이터List*/
    var RawMtrWrhsLatestInfoList = [];
    var PrdcrLatestInfo = [];
    var rawMtrWrhs = [];

    /** save Json **/
    var jsonSave = [];

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
        fn_createGrd();
    });
    const fn_init = async function(){
        let initTime = gfn_dateToYmd(new Date()) + ',' + gfn_dateToYmd(new Date());
        SBUxMethod.set('srch-dtp-wrhsYmd',initTime);
        await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd);		// 품목
    }
    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
            document.getElementById('btn-srch-prdcr').click();
        } else{
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

            fn_setPrdcrForm(prdcr);

        }
    }
    const fn_createGrd = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rawMtrList';
        SBGridProperties.id = 'grdRawMtrWrhs';
        SBGridProperties.jsonref = 'jsonRawMtrWrhs';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.mergecells = 'byrestriccol';
        SBGridProperties.columns = [
            {caption: [],ref: 'MERGE', type:'output',hidden: true},
            {caption: ["작업일자","작업일자"],		ref: 'INPT_YMD',      type:'output',  width:'13%',    style:'text-align:center',format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'}},
            {caption: ["품목","품목"],		ref: 'ITEM_NM',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["품종","품종"],		ref: 'VRTY_NM',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["원물입고","규격"],		ref: 'SPCFCT_NM',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["원물입고","생산자"],		ref: 'PRDCR_NM',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["원물입고","팔레트번호"],		ref: 'PLTNO',      type:'output',  width:'12%',    style:'text-align:center'},
            {caption: ["원물입고","수량"],		ref: 'WRHS_QNTT',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["생산작업","작업자"],		ref: 'FLNM',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["생산작업","작업시간"],		ref: 'JOB_FORMAT',      type:'output',  width:'12%',    style:'text-align:center',merge:false},
            {caption: ["재고","재고"],		ref: 'wrhsno',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["상품출고","함안"],		ref: 'wrhsno',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["상품출고","안성"],		ref: 'wrhsno',      type:'output',  width:'7%',    style:'text-align:center'},
        ];
        grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
    }
    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
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
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function(prdcr) {
        SBUxMethod.set("srch-inp-wrhsno", "");
        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            // SBUxMethod.set("srch-inp-bxQntt", "");
            $("#srch-inp-bxQntt").val("");
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

            fn_setPrdcrForm(prdcr);
        }
    }
    /**
     * @name fn_setPrdcrForm
     * @description 생산자 선택후 생산자 정보 셋팅s
     */
    const fn_setPrdcrForm = async function(prdcr) {

        if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
            const rprsVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
            await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
            SBUxMethod.set("srch-slt-vrtyCd", rprsVrtyCd);
            fn_onChangeSrchVrtyCd({value:rprsVrtyCd});
        } else {
            if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
                const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
                if (prvItemCd != prdcr.rprsItemCd) {
                    SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                    fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
                }
            }
        }

        if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
            SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
        }
        if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
            SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
        }
        if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
            SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
        }
        if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
            SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
        }

        if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
        } else {
            SBUxMethod.set("srch-inp-prdcrIdentno", "");
        }

    }
    /* 생산작업자 선택 호출 필수 function  */
    /* Start */
    /**
     * @name fn_modalOprtr
     * @description 생산작업자선택팝업 호출
     */
    const fn_modalOprtr = function() {
        popOprtr.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-flnm"), fn_setFlnm);
    }

    /**
     * @name fn_setFlnm
     * @description 생산작업자 선택 callback
     */
    const fn_setFlnm = function(oprtr) {
        if (!gfn_isEmpty(oprtr)) {
            SBUxMethod.set('srch-inp-flnm', oprtr.flnm);
        }
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
        ]);
    }
    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        let itemCd = "";
        const vrtyInfo = _.find(jsonApcVrty, {itemVrtyCd: vrtyCd});

        if (!gfn_isEmpty(vrtyCd)) {
            itemCd = vrtyInfo.mastervalue;
        } else {
            itemCd = SBUxMethod.get("srch-slt-itemCd");
            SBUxMethod.set("srch-inp-wghtAvg", "");
            fn_onChangeWghtAvg();
        }
        SBUxMethod.set("srch-slt-itemCd", itemCd);
        await fn_onChangeSrchItemCd({value: itemCd});
        SBUxMethod.set("srch-slt-vrtyCd", vrtyInfo.vrtyCd);
    }
    const fn_onChangeWghtAvg = function(obj) {

        // let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
        let bxQntt = parseInt($("#srch-inp-bxQntt").val()) || 0;
        let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

        if (wghtAvg > 0) {
            let wrhsWght = Math.round(bxQntt * wghtAvg);
            // SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
            $("#srch-inp-wrhsWght").val(wrhsWght);
        }
    }
    const fn_search = async function(){
        let check = gfn_getTableElement("searchTable","srch-",["pltno","flnm"]);
        /** datePicker range **/
        let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmd_from");
        let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmd_to");
        check.wrhsYmdFrom = wrhsYmdFrom;
        check.wrhsYmdTo = wrhsYmdTo;
        check.apcCd = gv_selectedApcCd;
        if(!check){
            return;
        }
        const postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrPrfmncListToPltno.do",check);
        const data = await postJsonPromise;
        console.log(data.resultList);
        if(data.resultStatus === 'S'){
            /** merge key **/
            let pltno = data.resultList[0].PLTNO;
            let merge = 1;
            data.resultList.forEach(function(item,idx){
               let JOB_FORMAT = item.JOB_BGNG_HR + '-' + item.JOB_END_HR;
               item.JOB_FORMAT = JOB_FORMAT;
               if(pltno === item.PLTNO){
                   item.MERGE = merge;
               }else{
                   pltno = item.PLTNO;
                   item.MERGE = ++merge;
               }
            });
            jsonRawMtrWrhs = data.resultList;
            grdRawMtrWrhs.rebuild();
        }
    }

    function apcSelectAdd(){
        $("#apcTable tbody tr").append(`
        <th scope="row" class="th_bg">입고일자</th>
        <td class="td_input">
        <div style="display:flex;gap: 10px">
			<sbux-datepicker uitype="range" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" wrap-style="border:0!important" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
        </div>
        </td>
        `);
    }
    apcSelectAdd();
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
