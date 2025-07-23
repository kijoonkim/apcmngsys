<%
    /**
     * @Class Name : outordrinfo.jsp
     * @Description : 발주정보등록 화면
     * @author SI개발부
     * @since 2023.10.23
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2023.10.23   	김호			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 발주정보조회 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-dark"
                        text="초기화"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-dark"
                        text="조회"
                        onclick="fn_search"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-dark"
                        text="저장"
                        onclick="fn_save"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 15%">
                    <col style="width: 50%">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="ta_r th_bg">APC명</th>
                        <td colspan="2" class="td_input" style="border-right: hidden">
                            <%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
                        </td>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <th class="ta_r th_bg">거래처</th>
                        <td class="td_input">
                            <sbux-select
                                    id="srch-slt-rcptYn"
                                    name="srch-slt-rcptYn"
                                    uitype="single"
                                    unselected-text="전체"
                                    jsondata-ref="jsonRcptYn"
                                    style="width: 80%"
                                    class="form-control input-sm"></sbux-select>
                        </td>
                        <th class="ta_r th_bg">상품명</th>
                        <td class="td_input" style="border-right: hidden">
                            <div style="display: flex;gap: 5px">
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
                                <sbux-button
                                        id="btn-srch-prdcr"
                                        name="btn-srch-prdcr"
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-gds"
                                        onclick="fn_modalGds"
                                ></sbux-button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div id="sb-area-grdOutordr" style="width:100%;height:433px;margin-top: 3vh"></div>
        </div>
    </div>
</section>
<!-- 상품 선택 Modal -->
<div>
    <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-gds">
    <jsp:include page="/WEB-INF/view/apcss/am/popup/gdsPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">

    /** grid **/
    var grdOutordr;
    var jsonGrdOutordr = [];

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function(){
        await fn_createGrid();
    }

    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdOutordr';
        SBGridProperties.id = 'grdOutordr';
        SBGridProperties.jsonref = 'jsonGrdOutordr';
        SBGridProperties.columns = [
            {caption : ['처리'],		ref : 'academy',		width : '5%',	style : 'text-align:center',	type : 'output'},
            {caption : ['거래처'],	ref : 'name',			width : '10%',	style : 'text-align:center',	type : 'input'},
            {caption : ['상품명'],		ref : 'phone',			width : '30%',	style : 'text-align:center',	type : 'input'},
            {caption : ['구분'],		ref : 'addr',			width : '10%',	style : 'text-align:center',	type : 'textarea'},
            {caption : ['기준수량'],		ref : 'addr',			width : '15%',	style : 'text-align:center',	type : 'textarea'},
            {caption : ['비고'],	ref : 'addr',			width : '30%',	style : 'text-align:center',	type : 'textarea'},
        ];
        grdOutordr = _SBGrid.create(SBGridProperties);
    }

    /** 상품 선택 팝업 호출 **/
    const fn_modalGds = function() {
        popGds.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-spmtPckgUnitNm"), fn_setGdsNm, SBUxMethod.get("srch-slt-itemCd"));
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
