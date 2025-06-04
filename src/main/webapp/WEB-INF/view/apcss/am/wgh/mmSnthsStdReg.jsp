<%
    /**
     * @Class Name : mmSnthsStdReg.jsp
     * @Description : 월별종합표준등록 화면
     * @author SI개발부
     * @since 2023.08.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.04.24	김은총		입고등록/선별등록/포장등록/출하등록 탭 및 페이지 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 월별종합표준등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        .displayFlex {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 월별종합표준등록 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_save"
                        text="저장"
                ></sbux-button>
            </div>
        </div>

        <div class="box-body srch-keyup-area">
            <sbux-tabs id="tab_norm" name="tab_norm"
                       uitype="normal"
                       is-scrollable=:Q
                       title-target-id-array="tab_wrhsStdReg^tab_sortStdReg^tab_pckgStdReg^tab_spmtStdReg"
                       title-text-array="입고등록^선별등록^포장등록^출하등록" onclick="fn_changeTab(this)">
            </sbux-tabs>

            <div>
                <!--[APC] START -->
                <div style="display: none;">
                    <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                </div>
                <!--[APC] END -->
                <div class="tab-content" style="padding: 0px 0px;">
                    <!-- 입고등록 탭 화면 -->
                    <div id="tab_wrhsStdReg">
                        <jsp:include page="../../am/wgh/mmWrhsStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 선별등록 탭 화면 -->
                    <div id="tab_sortStdReg">
                        <jsp:include page="../../am/wgh/mmSortStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 포장등록 탭 화면 -->
                    <div id="tab_pckgStdReg">
                        <jsp:include page="../../am/wgh/mmPckgStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 출하등록 탭 화면 -->
                    <div id="tab_spmtStdReg">
                        <jsp:include page="../../am/wgh/mmSpmtStdReg.jsp"></jsp:include>
                    </div>
                </div>
            </div>
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


    /* SB Select */
    var jsonApcBx			= [];	// 팔레트/박스 	검색
    var jsonApcItem			= [];	// 품목 		itemCd		검색
    var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
    var jsonApcSpcfct		= [];	// 규격 		spcfctCd
    var jsonComWarehouse	= [];	// 창고 		warehouse	검색
    var jsonSpmtPckgUnit	= [];	// 출하포장단위
    var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
    var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
    var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD
    var jsonApcGrdDtl		= [];	// 등급 	grdCd			그리드헤더
    var jsonComPckgGrdSeCd  = [];   // 포장상품등급


    /* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    const fn_changeTab = function (obj) {
        let choiceTab = SBUxMethod.get("tab_norm");
        console.log(choiceTab)

        if (choiceTab == "tab_wrhsStdReg") {
            fn_init();
        }

        if (choiceTab == "tab_sortStdReg") {
            fn_initSortReg();
        }

        if (choiceTab == "tab_pckgStdReg") {
            fn_initPckgReg();
        }

        if (choiceTab == "tab_spmtStdReg") {
            fn_initSpmtReg();
        }
    }

    const fn_save = async function () {

        let choiceTab = SBUxMethod.get("tab_norm");

        if (choiceTab == "tab_wrhsStdReg") {
            fn_saveWrhsInfo();
        }

        if (choiceTab == "tab_sortStdReg") {
            console.log("fn_saveSortInfo")
            fn_saveSortInfo();
        }

        if (choiceTab == "tab_pckgStdReg") {
            fn_savePckgInfo();
        }

        if (choiceTab == "tab_spmtStdReg") {
            fn_saveSpmtInfo();
        }
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
     * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }

    /**
     * @name fn_getApcSpcfct
     * @description APC규격 JSON 설정
     * @function
     * @param {string} itemCd
     */
    const fn_getApcSpcfct = async function(itemCd) {

        jsonApcSpcfct.length = 0;

        if (gfn_isEmpty(itemCd)) {
            return;
        }

        jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd, itemCd);
    }

    /**
     * @name fn_getStdGrd
     * @description 표준등급 json set
     */
    const fn_getStdGrd = async function(_itemCd) {
        await gStdGrdObj.init(gv_selectedApcCd, _GRD_SE_CD_SORT, _itemCd);
    }

    /**
     * @name fn_getSpmtPckgUnit
     * @description APC출하포장단위 JSON 설정
     * @function
     * @param {string} itemCd
     * @param {string} vrtyCd
     */
    const fn_getSpmtPckgUnit = async function(itemCd, vrtyCd) {

        jsonSpmtPckgUnit.length = 0;

        if (gfn_isEmpty(itemCd)) {
            return;
        }

        jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, itemCd, vrtyCd);
        // grdSortPrfmnc.refresh({"combo":true, "focus":false});
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>