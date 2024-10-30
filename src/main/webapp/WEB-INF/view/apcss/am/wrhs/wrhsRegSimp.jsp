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
            <table class="table table-bordered tbl_fixed" style="margin-bottom: 15px">
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 30%">
                    <col style="width: 20%">
                    <col style="width: 30%">
                </colgroup>
                <tboy>
                    <tr>
                        <th scope="row" class="th_bg">
                            품목/품종
                        </th>
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
                                    id="srch-inp-plorCd"
                                    name="srch-inp-prdcrIdentno"
                                    class="form-control input-sm"
                                    style="width: 50%"
                                    maxlength="2"
                                    autocomplete="off"
                                    onchange="fn_onChangeSrchPrdcrIdentno(this)"
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">
                            작업자
                        </th>
                        <td class="td_input">
                            <div style="display: flex; gap: 10px">
                                <sbux-input
                                        id="dtl-inp-pltno"
                                        name="dtl-inp-pltno"
                                        uitype="text"
                                        class="form-control input-sm"
                                        autocomplete="off"
                                        onblur="fn_ipt_pltno"
                                        onclick="fn_ipt_init"
                                ></sbux-input>
                                <sbux-button
                                        id="dtl-btn-rawMtrInvntr"
                                        name="dtl-btn-rawMtrInvntr"
                                        class="btn btn-sm btn-outline-danger btn-mbl"
                                        text="찾기"
                                        uitype="normal"
                                        onclick="fn_searchInvntr"
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
</body>
<script type="text/javascript">
    var grdRawMtrWrhs;
    var jsonRawMtrWrhs = [];
    var jsonApcItem			= [];	// 품목 		itemCd		검색

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
        fn_createGrd();
        stdGrdSelect.init();
    });
    const fn_init = async function(){
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd);		// 품목
    }
    const fn_createGrd = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rawMtrList';
        SBGridProperties.id = 'grdRawMtrWrhs';
        SBGridProperties.jsonref = 'jsonRawMtrWrhs';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["작업일자","작업일자"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["품목","품목"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["품종","품종"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["원물입고","규격"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["원물입고","생산자"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["원물입고","팔레트번호"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["원물입고","수량"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["생산작업","작업자"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["생산작업","작업시간"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["재고","재고"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["상품출고","함안"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
            {caption: ["상품출고","안성"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
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
    function apcSelectAdd(){
        $("#apcTable tbody tr").append(`
        <th scope="row" class="th_bg">입고일자</th>
        <td class="td_input">
        <div style="display:flex;gap: 10px">
			<sbux-datepicker uitype="range" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmdFrom" wrap-style="border:0!important" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
        </div>
        </td>
        `);
    }
    apcSelectAdd();
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
