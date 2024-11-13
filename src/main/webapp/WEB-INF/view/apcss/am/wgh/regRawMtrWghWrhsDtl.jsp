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
                        <th scope="row" class="th_bg">품목</th>
                        <td class="td_input" style="border-top: hidden">
                            <div style="display: flex;gap: 5px">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        style="width: 50%"
                                        class="form-control input-sm input-sm-ast"
                                        jsondata-ref="jsonApcItem"
                                        onchange="fn_onChangeSrchItemCd(this)"
                                ></sbux-select>
                            </div>
                        </td>
                    <th scope="row" class="th_bg">생산자</th>
                    <td class="td_input" style="border-top: hidden">
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
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-prdcrCd"
                                    name="srch-inp-prdcrCd"
                                    style="display: none"
                            ></sbux-input>
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
                        <th scope="row" class="th_bg">차량번호</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-vhclno"
                                    name="srch-inp-vhclno"
                                    class="form-control input-sm"
                                    style="width: 50%"
                                    maxlength="2"
                                    autocomplete="off"
                                    onchange="fn_onChangeSrchPrdcrIdentno(this)"
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">산지</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-plorNm"
                                    name="srch-inp-plorNm"
                                    class="form-control input-sm"
                                    style="width: 50%"
                                    maxlength="2"
                                    autocomplete="off"
                                    onchange="fn_onChangeSrchPrdcrIdentno(this)"
                            ></sbux-input>
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-plorCd"
                                    name="srch-inp-plorCd"
                                    style="display: none"
                            ></sbux-input>
                        </td>
                    </tr>
                </tboy>
            </table>
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
</body>
<script type="text/javascript">
    var grdRawMtrWrhs;
    var jsonRawMtrWrhs = [];
    var jsonApcItem			= [];	// 품목 		itemCd		검색

    window.addEventListener('DOMContentLoaded',async function(e) {
        await fn_init();
        await fn_createGrd();

        let mainParam = localStorage.getItem("callMain");
        if(mainParam){
            mainParam = JSON.parse(mainParam);
            fn_formatJson(mainParam);
            grdRawMtrWrhs.rebuild();
        }
        localStorage.removeItem("callMain");
    });
    window.addEventListener("message",function(e){
        let obj = e.data;
        fn_formatJson(JSON.parse(obj));
        grdRawMtrWrhs.rebuild();
    });
    const fn_formatJson = function(_json){
        let grdCd = _json.grdCd.split(',');
        let bxQntt = _json.bxQntt.split(',');

        if(grdCd.length < 2)return;

        _json.grdQntt1 = bxQntt[0];
        _json.grdQntt2 = bxQntt[1];
        _json.bxQntt = parseInt(bxQntt[0]) + parseInt(bxQntt[1]);
        _json.clacWght = parseInt(_json.wrhsWght) / parseInt(_json.bxQntt);
        jsonRawMtrWrhs.push(_json);
    }
    const fn_init = async function(){
        let date = gfn_dateToYmd(new Date());
        SBUxMethod.set("srch-dtp-wrhsYmd", date+","+date);

        await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd);		// 품목
    }
    const fn_createGrd = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rawMtrList';
        SBGridProperties.id = 'grdRawMtrWrhs';
        SBGridProperties.jsonref = 'jsonRawMtrWrhs';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리","처리"],		ref: 'apcCd',      type:'output',  width:'4%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";}},
            {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["품목","품목"],		ref: 'itemNm',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["농가","농가"],		ref: 'prdcrNm',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["산지","산지"],		ref: 'plorNm',      type:'output',  width:'11%',    style:'text-align:center'},
            {caption: ["차량번호","차량번호"],		ref: 'vhclno',      type:'output',  width:'11%',    style:'text-align:center'},
            {caption: ["총중량","총중량"],		ref: 'wholWght',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["공차<br>중량","공차<br>중량"],		ref: 'emptVhclWght',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["실중량","실중량"],		ref: 'wrhsWght',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["콘티수","콘티수"],		ref: 'bxQntt',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["상품출고","정품"],		ref: 'grdQntt1',      type:'output',  width:'4%',    style:'text-align:center'},
            {caption: ["상품출고","비품"],		ref: 'grdQntt2',      type:'output',  width:'4%',    style:'text-align:center'},
            {caption: ["파렛트수","파렛트수"],		ref: 'pltQntt',      type:'output',  width:'6%',    style:'text-align:center'},
            {caption: ["실중량<br>콘티","실중량<br>콘티"],		ref: 'clacWght',      type:'output',  width:'5%',    style:'text-align:center'},
            {caption: ["비고","비고"],		ref: 'rmrk',      type:'output',  width:'12%',    style:'text-align:center'},
        ];
        grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
    }
    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function(prdcr) {
        SBUxMethod.set("srch-inp-wrhsno", "");

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
            SBUxMethod.set("srch-inp-plorNm",prdcr.plorNm);
            SBUxMethod.set("srch-inp-plorCd",prdcr.plorCd);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
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
            //gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd),	// 규격
            //gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd),
            stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
        ]);
    }
    const fn_search = async function(){
        let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmd_from");
        let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmd_to");

        let obj = gfn_getTableElement("searchTable","srch-",["itemCd","prdcrNm","prdcrCd","vhclno","plorCd","plorNm"]);
        obj.wghYmdFrom = wrhsYmdFrom;
        obj.wghYmdTo = wrhsYmdTo;
        obj.apcCd = gv_selectedApcCd;

        const postJsonPromise = gfn_postJSON("/am/wgh/selectMultiWghPrfmncList.do", obj);
        const data = await postJsonPromise;

        if(data.resultStatus === 'S'){
            jsonRawMtrWrhs.length = 0;
            data.resultList.forEach(function(item){
                let camel = Object.keys(item).reduce((acc,key) => {
                    acc[gfn_snakeToCamel(key)] = item[key];
                    return acc;
                },{});
               fn_formatJson(camel);
            });
            grdRawMtrWrhs.rebuild();
        }
    }
    const fn_reset = function(){
        jsonRawMtrWrhs.length = 0;
        grdRawMtrWrhs.rebuild();
        let table = document.getElementById("searchTable");
        let elements = Array.from(table.querySelectorAll('[id^="srch-"]'));
        for(let element of elements){
            SBUxMethod.set(element.id,"");
        }
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:#FFF8DC");

    }
    function apcSelectAdd(){
        $("#apcTable tbody tr").append(`
        <th scope="row" class="th_bg">입고일자</th>
        <td class="td_input">
        <div style="display:flex;gap: 10px">
			<sbux-datepicker uitype="range" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
        </div>
        </td>
        `);
    }
    apcSelectAdd();
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
