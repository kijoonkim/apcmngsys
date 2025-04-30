<%
    /**
     * @Class Name 		: fit1100.jsp
     * @Description 	: 부가세집계조정 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.11.04
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	신정철		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 부가세집계조정</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type="number"] {
            border: hidden;
            box-sizing: border-box;
            text-align: right;
            width: 100%;
        }
        .tpgTd{
            background-color : white !important;
            border-radius: 0 !important;
            padding: 0px 12px !important;
            height: auto;
        }
        .box.box-solid{
            border-radius: 0 !important;
        }
        #panRightMiddle tbody td{
            border: 0 !important;
        }
        .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd .sbux-tabs-content{
            padding: 0!important;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
            <div style="margin-left: auto;">
				<sbux-button
                	id="btn-createExcl"
                    name="btn-payTermTest"
                    uitype="normal"
                    text="제외건 생성"
                    class="btn btn-sm btn-outline-danger"
                    onclick="fn_createExcl"
				></sbux-button>
			</div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <!--[APC] START -->
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <!--[APC] END -->
                <table id="srchTable" class="table table-bordered tbl_fixed table-search-ma">
                    <colgroup>
                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">
 
                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">
 
                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">
 
                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" >기준연도</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="srch-dtp-yyyy"
                                    name="srch-dtp-yyyy"
                                    uitype="popup"
                                    datepicker-mode="year"
                                    date-format="yyyy"
                                    class="table-datepicker-ma form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                                    onchange = "fn_changeYyyy(srch-dtp-yyyy)"
                            ></sbux-datepicker>
                        </td>
                        <td colspan="3" ></td>
                        <th scope="row" >신고구분명</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                                <div class="dropdown" style="width:100%;">
                                    <button
                                            style="width:100%;text-align:left"
                                            class="btn btn-sm btn-light dropdown-toggle"
                                            type="button"
                                            id="srch-ddm-seq"
                                            data-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false"
                                    >
                                        <span>선택</span>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div
                                            class="dropdown-menu"
                                            aria-labelledby="srch-ddm-seq"
                                            style="width:750px;height:150px;padding-top:0px;overflow:auto"
                                    ></div>
                                </div>
                        </td>
                        <td></td>
                        <td>
                            <sbux-input
                                    readonly
                                    id="srch-inp-termFr"
                                    name="srch-inp-termFr"
                                    uitype="text"
                                    class="form-control input-sm"
                                    style="text-align:center;"
                            ></sbux-input>
                        </td>
                        <td>
                            <sbux-input
                                    readonly
                                    id="srch-inp-termTo"
                                    name="srch-inp-termTo"
                                    uitype="text"
                                    class="form-control input-sm"
                                    style="text-align:center;"
                            ></sbux-input>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th scope="row" >신고사업장</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    id="srch-inp-taxSiteName"
                                    name="srch-inp-taxSiteName"
                                    uitype="text"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td></td>
                        <th scope="row" >사업자번호</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    id="srch-inp-bizRegno"
                                    name="srch-inp-bizRegno"
                                    uitype="text"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" >매입매출구분</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-arApType"
                                    name="srch-slt-arApType"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonArApType"
                            />
                        </td>
                        <td></td>
                        <th scope="row" >거래처</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
<%--                                    uitype="search"--%>
                                    id="srch-inp-csCode"
                                    name="srch-inp-csCode"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-csName"
                                    name="srch-inp-csName"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    uitype="modal"
                                    target-id="modal-compopupcs"
                                    onclick="fn_srchcompopupCsCode(srch-inp-csName)"
                            ></sbux-button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style=" height: 90vh; display: flex; gap: 10px">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdTaxSite" style="height: 528px;width: 100%"></div>
                </div>
                <div style="flex: 4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 부가세집계</span></li>
                        </ul>
                        <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                        <sbux-button
		                       	id="btn-grd-insertCfmtn"
		                           name="btn-grd-insertCfmtn"
		                           uitype="normal"
		                           text="확정"
		                           class="btn btn-sm btn-outline-danger"
		                           onclick="fn_insertCfmnt"
		                           style="margin-right:5px"
							></sbux-button>
							<sbux-button
		                       	id="btn-grd-deleteCfmtn"
		                           name="btn-grd-deleteCfmtn"
		                           uitype="normal"
		                           text="확정 취소"
		                           class="btn btn-sm btn-outline-danger"
		                           onclick="fn_deleteCfmnt"
		                           style="margin-right:25px"
							></sbux-button>
							<sbux-button 
								id="btn-grd-addRow"
								name="btn-grd-addRow" 
								uitype="normal" 
								text="행추가" 
								class='btn btn-sm btn-outline-danger' 
								onClick="fn_addRow"
								style="margin-right:5px"
								image-src="/static/resource/svg/grdPlus.svg"
		                           image-style="width:3rem;height:20px"
								image-placement="front"
							></sbux-button>
							<sbux-button 
								id="btn-grd-delRow"
								name="btn-grd-delRow" 
								uitype="normal" 
								text="행삭제" 
								class='btn btn-sm btn-outline-danger' 
								onClick="fn_delRow"
								style="margin-right:5px"
								image-src="/static/resource/svg/grdMinus.svg"
		                           image-style="width:3rem;height:20px"
								image-placement="front"
							></sbux-button>
                        </div>
                    </div>
                    <sbux-tabs
                    	id="tabTopJson" 
                    	name="tabTopJson" 
                    	uitype="normal"
                    	is-scrollable="false"
                    	jsondata-ref="tabJsonData"
<%--                        callback-after-select="fn_switchTab"--%>
                    ></sbux-tabs>
                    <div class="tab-content">
                        <div id="grdAR_AP">
                            <div id="sb-area-grdArAp" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR">
                            <div id="sb-area-grdAr" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP">
                            <div id="sb-area-grdAp" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_TAX_BILL">
                            <div id="sb-area-grdArTaxBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_BILL">
                            <div id="sb-area-grdArBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_ZERO_TAX">
                            <div id="sb-area-grdArZeroTax" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_CARD">
                            <div id="sb-area-grdArCard" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_EXPORT">
                            <div id="sb-area-grdArExport" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_CREDIT">
                            <div id="sb-area-grdArCredit" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_TAX_BILL">
                            <div id="sb-area-grdApTaxBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_BILL">
                            <div id="sb-area-grdApBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_DEEMED">
                            <div id="sb-area-grdApDeemed" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_ASSET">
                            <div id="sb-area-grdApAsset" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_NONDED">
                            <div id="sb-area-grdApNonded" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_CARD">
                            <div id="sb-area-grdApCard" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_ZERO_REPORT">
                            <div id="sb-area-grdArZeroReport" style="width: 100%; height: 500px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
 
<div>
    <sbux-modal
    	style="width:600px" 
    	id="modal-compopup1" 
    	name="modal-compopup1" 
    	uitype="middle" 
    	header-title="" 
    	body-html-id="body-modal-compopup1" 
    	header-is-close-button="true" 
    	footer-is-close-button="false" 
    ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

 	<!-- 팝업 Modal -->
	<div>
	    <sbux-modal id="modal-compopupcs" name="modal-compopupcs" uitype="middle" header-title="" body-html-id="body-modal-compopupcs" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
	</div>
	<div id="body-modal-compopupcs">
	    <jsp:include page="../../../com/popup/comPopupCs.jsp"></jsp:include>
	</div>

</body>
<script type="text/javascript">
 
 
	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	//-----------------------------------------------------------
    
    /** 공통버튼 **/
 
    function cfn_init() {
 
        if (!gfn_comConfirm("Q0001", "초기화")) {	// Q0001	{0} 하시겠습니까?
            return;
        }
 
        fn_init();
    }
 
    function cfn_search() {
        fn_search();
    }
    
    
    var tabJsonData = [
        { "styleKey": "font-size:11px;", "id" : "0", "pid" : "-1", "order" : "1", "text" : "전체", "targetid" : "grdAR_AP" , "targetvalue" : "grdAR_AP","cssstyleKey" : "width:100px;"  },
        { "styleKey": "font-size:11px;", "id" : "1", "pid" : "-1", "order" : "2", "text" : "매출전체","targetid" : "grdAR" , "targetvalue" : "grdAR" },
        { "styleKey": "font-size:11px;", "id" : "2", "pid" : "-1", "order" : "3", "text" : "매입전체","targetid" : "grdAP" , "targetvalue" : "grdAP" },
        { "styleKey": "font-size:11px;", "id" : "3", "pid" : "-1", "order" : "4", "text" : "매출세금계산서","targetid" : "grdAR_TAX_BILL" , "targetvalue" : "grdAR_TAX_BILL" },
        { "styleKey": "font-size:11px;", "id" : "4", "pid" : "-1", "order" : "5", "text" : "매출계산서","targetid" : "grdAR_BILL" , "targetvalue" : "grdAR_BILL" },
        { "styleKey": "font-size:11px;", "id" : "5", "pid" : "-1", "order" : "6", "text" : "영세율첨부서류","targetid" : "grdAR_ZERO_TAX" , "targetvalue" : "grdAR_ZERO_TAX" },
        { "styleKey": "font-size:11px;", "id" : "6", "pid" : "-1", "order" : "7", "text" : "신용카드매출","targetid" : "grdAR_CARD" , "targetvalue" : "grdAR_CARD" },
        { "styleKey": "font-size:11px;", "id" : "7", "pid" : "-1", "order" : "8", "text" : "수출실적" ,"targetid": "grdAR_EXPORT" , "targetvalue" : "grdAR_EXPORT" },
        { "styleKey": "font-size:11px;", "id" : "8", "pid" : "-1", "order" : "9", "text" : "내국신용장","targetid" : "grdAR_CREDIT" , "targetvalue" : "grdAR_CREDIT" },
        { "styleKey": "font-size:11px;", "id" : "9", "pid" : "-1", "order" : "10", "text" : "영세율매출명세서","targetid" : "grdAR_ZERO_REPORT" , "targetvalue" : "grdAR_ZERO_REPORT" },
        { "styleKey": "font-size:11px;", "id" : "10", "pid" : "-1", "order" : "11", "text" : "매입세금계산서","targetid" : "grdAP_TAX_BILL" , "targetvalue" : "grdAP_TAX_BILL" },
        { "styleKey": "font-size:11px;", "id" : "11", "pid" : "-1", "order" : "12", "text" : "매입계산서" ,"targetid": "grdAP_BILL" , "targetvalue" : "grdAP_BILL" },
        { "styleKey": "font-size:11px;", "id" : "12", "pid" : "-1", "order" : "13", "text" : "의제매입세액명세","targetid" : "grdAP_DEEMED" , "targetvalue" : "grdAP_DEEMED" },
        { "styleKey": "font-size:11px;", "id" : "13", "pid" : "-1", "order" : "14", "text" : "건물등감가상각" ,"targetid": "grdAP_ASSET" , "targetvalue" : "grdAP_ASSET" },
        { "styleKey": "font-size:11px;", "id" : "14", "pid" : "-1", "order" : "15", "text" : "공제받지못할매입세액명세","targetid" : "grdAP_NONDED" , "targetvalue" : "grdAP_NONDED" },
        { "styleKey": "font-size:11px;", "id" : "15", "pid" : "-1", "order" : "16", "text" : "신용카드수령금액명세","targetid" : "grdAP_CARD" , "targetvalue" : "grdAP_CARD" }
    ];
 
    // ==================================================
    // combo json
    
    // 부가세신고구분
	var jsonVatDclr = [];
    // 매입매출구분
	var jsonArApType = [];
    
    // 부가세유형
    var jsonVatType = [];
    var jsonVatTypeAr = [];		// 매출
    var jsonVatTypeAp = [];		// 매입
    
 	// 전자발행
    jsonEtaxType = [];
    // 카드용도
    jsonCardUseType = [];
    // 내국신용장구분
    jsonLocalCreditType = [];
    // 불공제유형
    jsonVatNotDedType = [];
    // 예정신고누락
    jsonReportOmitYn = [];
    // 중복발행
    jsonDupIssBillType = [];
    // 감가상각자산유형
    jsonVatAssetType = [];
    // 11일외전송
    jsonAfterDueDateYn = [];
    // 영세율첨부서류여부
    jsonZeroReportYn = [];
    // 수입금액제외
    jsonExcludeAmtYn = [];
    // 영세율구분
    jsonZeroType = [];
    // 의제매입구분
    jsonDeemedInputType = [];
 	// 수정신고구분
    jsonAmendedTaxType = [];
    // 통화
    jsonCurrencyCode = [];
 	
    // end of combo json
    // ==================================================
    
    
    /** 신고 사업장 그리드 **/
    var grdTaxSite;
    var jsonGrdTaxSite = [];
 
    /** 전체 그리드 **/
    var grdArAp;
    var jsonGrdArAp = [];
 
    /** 매출전체 **/
    var grdAr;
    var jsonGrdAr = [];
 
    /** 매입전체 **/
    var grdAp;
    var jsonGrdAp = [];
 
    /** 매출세금계산서 **/
    var grdArTaxBill;
    var jsonGrdArTaxBill = [];
 
    /** 매출계산서 **/
    var grdArBill;
    var jsonGrdArBill = [];
 
    /** 영세율 첨부서류제출명세 **/
    var grdArZeroTax;
    var jsonGrdArZeroTax = [];
 
    /** 신용카드매출전표발행집계표 **/
    var grdArCard;
    var jsonGrdArCard = [];
 
    /** 수출실적명세서 **/
    var grdArExport;
    var jsonGrdArExport = [];
 
    /** 내국신용장 **/
    var grdArCredit;
    var jsonGrdArCredit = [];
 
    /** 매입세금계산서 **/
    var grdApTaxBill;
    var jsonGrdApTaxBill = [];
 
    /** 매입계산서 **/
    var grdApBill;
    var jsonGrdApBill = [];
 
    /** 의제매입세액 **/
    var grdApDeemed;
    var jsonGrdApDeemed = [];
 
    /** 건물등감가상각자산취득명세 **/
    var grdApAsset;
    var jsonGrdApAsset = [];
 
    /** 공제받지못할매입세액명세 **/
    var grdApNonded;
    var jsonGrdApNonded = [];
 
    /** 신용카드수령금액명세서 **/
    var grdApCard;
    var jsonGrdApCard = [];
 
    /** 영세율매출명세서 **/
    var grdArZeroReport;
    var jsonGrdArZeroReport = [];
 
    window.addEventListener("DOMContentLoaded",function(){
    	
        fn_init();
 
    });
 
    /**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function(){
    	
		SBUxMethod.openProgress(gv_loadingOptions);
    	
        window.parent.document.getElementById("main-btn-save").style.display = "none";
        
        /** ul style 정리 **/
        $("#tabTopJson_ul").css({"display":"grid","grid-template-columns": "repeat(8, auto)"});
 
        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));
 
        await fn_initSBSelect();
 
        jsonGrdTaxSite.length = 0;
        fn_clearDetailData();
 
        /** tab 정렬 **/
        SBUxMethod.selectTab('tabTopJson', 'grdAR_AP');
        
        fn_createGridTaxSite();
        fn_createGridArAp();
        fn_createGridAr();
        fn_createGridAp();
        fn_createGridArTaxBill();
        fn_createGridArBill();
        fn_createGridArZeroTax();
        fn_createGridArCard();
        fn_createGridArExport();
        fn_createGridArCredit();
        fn_createGridApTaxBill();
        fn_createGridApBill();
        fn_createGridApDeemed();
        fn_createGridApAsset();
        fn_createGridApNonded();
        fn_createGridApCard();
        fn_createGridArZeroReport();
        
        SBUxMethod.closeProgress(gv_loadingOptions);
    }


    const fn_changeYyyy = function(yyyy){
        gfnma_multiSelectInit({
            target			: ['#srch-ddm-seq']
            ,compCode		: gv_ma_selectedCorpCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: "AND A.YR = '" + yyyy + "'"
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'right' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TMPLT_NM'
            ,columns		:[
                {caption: "부가세유형",			ref: 'VAT_TMPLT_NM', 		width:'180px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 	ref: 'STANDARD_TERM_FR',    width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 	ref: 'STANDARD_TERM_TO',    width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", ref: 'UNIT_NO',    			width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'OVS_BPLC_NO',   width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 			ref: 'CFMTN_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 				ref: 'SEQ',    				width:'150px',  	style:'text-align:left;display:none',}
            ]
            ,callback       : function(_seq) {
                fn_setSrchSeq(_seq);
            }
        });
    }
	/**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
		// 코드정보 설정
		let result = await Promise.all([
 
	    	gfnma_setComSelect(['_'], jsonVatDclr, 'L_FIT030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SEQ', 'VAT_TMPLT_NM', 'Y', ''),
	    	
			/** 신고구분명 select **/
			gfnma_multiSelectInit({
		            target			: ['#srch-ddm-seq']
		            ,compCode		: gv_ma_selectedCorpCd
		            ,clientCode		: gv_ma_selectedClntCd
		            ,bizcompId		: 'L_FIT030'
		            ,whereClause	: "AND A.YR = '" + gfn_dateToYear(new Date()) + "'"
		            ,formId			: p_formId
		            ,menuId			: p_menuId
		            ,selectValue	: ''
		            ,dropType		: 'down' 	// up, down
		            ,dropAlign		: 'right' 	// left, right
		            ,colValue		: 'SEQ'
		            ,colLabel		: 'VAT_TMPLT_NM'
		            ,columns		:[
		                {caption: "부가세유형",			ref: 'VAT_TMPLT_NM', 		width:'180px',  	style:'text-align:left'},
		                {caption: "신고기준시작월", 	ref: 'STANDARD_TERM_FR',    width:'150px',  	style:'text-align:left'},
		                {caption: "신고기준종료월", 	ref: 'STANDARD_TERM_TO',    width:'150px',  	style:'text-align:left'},
		                {caption: "총괄납부사업장번호", ref: 'UNIT_NO',    			width:'180px',  	style:'text-align:left'},
		                {caption: "단위과세번호", 		ref: 'OVS_BPLC_NO',   width:'150px',  	style:'text-align:left'},
		                {caption: "확정여부", 			ref: 'CFMTN_YN',    		width:'150px',  	style:'text-align:left'},
		                {caption: "SEQ", 				ref: 'SEQ',    				width:'150px',  	style:'text-align:left;display:none',}
		            ]
		            ,callback       : function(_seq) {
		            	fn_setSrchSeq(_seq);
		            }
		        }),
		        
		        // 매입매출구분
		        gfnma_setComSelect(['srch-slt-arApType'], jsonArApType, 'L_FIT003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
		        // 부가세유형
		        gfnma_setComSelect(['_'], jsonVatType, 'L_FIT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'VAT_TYPE_CD', 'VAT_TMPLT_NM', 'Y', ''),		        
		     	// 전자발행
	            gfnma_setComSelect(['_'], jsonEtaxType,			'L_FIT005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 카드용도
	            gfnma_setComSelect(['_'], jsonCardUseType, 		'L_FIT012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 내국신용장구분
	            gfnma_setComSelect(['_'], jsonLocalCreditType,	'L_FIT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 불공제유형
	            gfnma_setComSelect(['_'], jsonVatNotDedType,	'L_FIT013', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 예정신고누락
	            gfnma_setComSelect(['_'], jsonReportOmitYn,		'L_FIT009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 중복발행
	            gfnma_setComSelect(['_'], jsonDupIssBillType,	'L_FIT007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 감가상각자산유형
	            gfnma_setComSelect(['_'], jsonVatAssetType,		'L_FIT014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 11일외전송
	            gfnma_setComSelect(['_'], jsonAfterDueDateYn,	'L_FIT006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 영세율첨부서류여부
	            gfnma_setComSelect(['_'], jsonZeroReportYn,		'L_FIT019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 수입금액제외
	            gfnma_setComSelect(['_'], jsonExcludeAmtYn,		'L_FIT008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 영세율구분
	            gfnma_setComSelect(['_'], jsonZeroType,			'L_FIT010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 의제매입구분
	            gfnma_setComSelect(['_'], jsonDeemedInputType,	'L_FIT015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
				// 수정신고구분
				gfnma_setComSelect(['_'], jsonAmendedTaxType,	'L_FIT017', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            // 통화
				gfnma_setComSelect(['_'], jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
				
			]);
		
		jsonVatTypeAr.length = 0;
		jsonVatTypeAp.length = 0;
		
		jsonVatType.forEach((item) => {
			switch (gfn_nvl(item.VAT_TYPE_CD).substr(0, 1)) {
				case "P":
					jsonVatTypeAp.push(item);
					break;
				case "R":
					jsonVatTypeAr.push(item);
					break;
			}
		});
	}
    
	const fn_setSrchSeq = async function(_seq) {
		
		if (gfn_isEmpty(_seq)) {
			SBUxMethod.set('srch-inp-termFr', '');
			SBUxMethod.set('srch-inp-termTo', '');
		} else {
			const vatDclr = _.find(jsonVatDclr, {SEQ: _seq});
			
			if (!gfn_isEmpty(vatDclr)) {
				SBUxMethod.set('srch-inp-termFr', vatDclr['STANDARD_TERM_FR']);
				SBUxMethod.set('srch-inp-termTo', vatDclr['STANDARD_TERM_TO']);
 
                let year = SBUxMethod.get('srch-inp-termFr').substr(0, 4);
                SBUxMethod.set('srch-dtp-yyyy', year);
			}
			
			fn_search();	
		}
	} 
	
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function(){
        
		const isSuccess = await fn_setGrdTaxSite();
		
		if (!isSuccess) {
			return;
		}
		
		if (jsonGrdTaxSite.length > 0) {
			grdTaxSite.setRow(1);
			fn_setDetail(jsonGrdTaxSite[0]);	
		} else {
			fn_setDetail(null);
		}
    }
	
	/**
     * @name fn_setGrdTaxSite
     * @description 신고사업장 조회
     */
	const fn_setGrdTaxSite = async function() {
		
		let isSuccess = false;
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		const taxSiteName = gfn_nvl(SBUxMethod.get('srch-inp-taxSiteName'));
		const bizRegno = gfn_nvl(SBUxMethod.get('srch-inp-bizRegno'));
		const arApType = gfn_nvl(SBUxMethod.get('srch-slt-arApType'));
		const csCode = gfn_nvl(SBUxMethod.get('srch-inp-csCode'));
		
		if (gfn_isEmpty(yyyy)){
            gfn_comAlert("W0002", "기준연도");
            return isSuccess;
        }
		
        if (gfn_isEmpty(seq)){
            gfn_comAlert("W0002", "신고구분명");
            return isSuccess;
        }
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY			: yyyy,
                V_P_SEQ             : seq,
                V_P_AR_AP_TYPE      : arApType,
                V_P_CS_CODE         : csCode,
                V_P_BIZ_REGNO       : bizRegno,
                V_P_TAX_SITE_NAME   : taxSiteName,
                V_P_TAX_SITE_CODE   : '',
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        
        console.log("paramObj", paramObj);
 
        try {
        	
            const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit1100.do", {
                getType				: 'json',
                cv_count			: '17',
                workType            : 'LIST',
                params				: gfnma_objectToString(paramObj)
            });
            
            const listData = await postJsonPromiseForList;
        	
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonGrdTaxSite.length = 0;
 
                listData.cv_1.forEach((item, index) => {
                    /*
                	const obj = {
                		CHK_YN			: item.CHK_YN,
                    	TAX_SITE_CODE	: item.TX_SITE_CD,
                        TAX_SITE_NAME	: item.TX_SITE_NM,
                        BIZ_REGNO		: item.BRNO
                    }
                	
                	jsonGrdTaxSite.push(obj);

                     */
                	jsonGrdTaxSite.push(item);
                });
                
                grdTaxSite.rebuild();
 
                isSuccess = true;
                
            } else {
                alert(listData.resultMessage);
            }
            
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
        
        return isSuccess;
	}
	
	
	const fn_rebuildDetailGrid = function() {
		
		SBUxMethod.openProgress(gv_loadingOptions);
		
	    grdArAp.rebuild();          /** 전체 그리드 **/
	    grdAr.rebuild();            /** 매출전체 **/
	    grdAp.rebuild();            /** 매입전체 **/
	    grdArTaxBill.rebuild();     /** 매출세금계산서 **/
	    grdArBill.rebuild();        /** 매출계산서 **/
	    grdArZeroTax.rebuild();     /** 영세율 첨부서류제출명세 **/
	    grdArCard.rebuild();        /** 신용카드매출전표발행집계표 **/
	    grdArExport.rebuild();      /** 수출실적명세서 **/
	    grdArCredit.rebuild();      /** 내국신용장 **/
	    grdApTaxBill.rebuild();     /** 매입세금계산서 **/
	    grdApBill.rebuild();        /** 매입계산서 **/
	    grdApDeemed.rebuild();      /** 의제매입세액 **/
	    grdApAsset.rebuild();       /** 건물등감가상각자산취득명세 **/
	    grdApNonded.rebuild();      /** 공제받지못할매입세액명세 **/
	    grdApCard.rebuild();        /** 신용카드수령금액명세서 **/
	    grdArZeroReport.rebuild();  /** 영세율첨부서류 **/
	    
	    SBUxMethod.closeProgress(gv_loadingOptions);
	}
	
	const fn_clearDetailData = function() {
	    jsonGrdArAp.length = 0;   		/** 전체 그리드 **/
	    jsonGrdAr.length = 0;   		/** 매출전체 **/
	    jsonGrdAp.length = 0;   		/** 매입전체 **/
	    jsonGrdArTaxBill.length = 0;    /** 매출세금계산서 **/
	    jsonGrdArBill.length = 0;   	/** 매출계산서 **/
	    jsonGrdArZeroTax.length = 0;    /** 영세율 첨부서류제출명세 **/
	    jsonGrdArCard.length = 0;   	/** 신용카드매출전표발행집계표 **/
	    jsonGrdArExport.length = 0;   	/** 수출실적명세서 **/
	    jsonGrdArCredit.length = 0;   	/** 내국신용장 **/
	    jsonGrdApTaxBill.length = 0;    /** 매입세금계산서 **/
	    jsonGrdApBill.length = 0;   	/** 매입계산서 **/
	    jsonGrdApDeemed.length = 0;   	/** 의제매입세액 **/
	    jsonGrdApAsset.length = 0;    	/** 건물등감가상각자산취득명세 **/
	    jsonGrdApNonded.length = 0;   	/** 공제받지못할매입세액명세 **/
	    jsonGrdApCard.length = 0;   	/** 신용카드수령금액명세서 **/
	    jsonGrdArZeroReport.length = 0;	/** 영세율첨부서류 **/
	}
	
	const fn_pushCursorIntoJson = function(_curObj, _jsonObj) {
		
		if (gfn_isEmpty(_curObj)) {
			return;
		}
		
		if (Array.isArray(_curObj)) {
			_curObj.forEach((_obj) => {
				_jsonObj.push(_obj);
			});
		}
	}
	
	/**
     * @name fn_setDetail
     * @description 탭영역 그리드 조회
     */
	const fn_setDetail = async function(_site) {
		
		let isSuccess = false;
		
		fn_clearDetailData();
		
		if (gfn_isEmpty(_site)) {
			fn_rebuildDetailGrid();
			return false;
		}
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		const taxSiteName = gfn_nvl(SBUxMethod.get('srch-inp-taxSiteName'));
		const bizRegno = gfn_nvl(SBUxMethod.get('srch-inp-bizRegno'));
		const arApType = gfn_nvl(SBUxMethod.get('srch-slt-arApType'));
		const csCode = gfn_nvl(SBUxMethod.get('srch-inp-csCode'));
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY			: yyyy,
                V_P_SEQ             : seq,
                V_P_AR_AP_TYPE      : arApType,
                V_P_CS_CODE         : csCode,
                V_P_BIZ_REGNO       : '',
                V_P_TAX_SITE_NAME   : '',
                V_P_TAX_SITE_CODE   : _site.TX_SITE_CD,
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        
        console.log("paramObj", paramObj);
        
        try {
        
        	const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit1100.do", {
                getType				: 'json',
                cv_count			: '17',
                workType            : 'DETAIL',
                params				: gfnma_objectToString(paramObj)
            });
    		
        	const listData = await postJsonPromiseForList;
        	
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	SBUxMethod.openProgress(gv_loadingOptions);
            	
            	fn_pushCursorIntoJson(listData.cv_2, jsonGrdArAp);			/** 전체 그리드 **/
            	fn_pushCursorIntoJson(listData.cv_3, jsonGrdAr);			/** 매출전체 **/
            	fn_pushCursorIntoJson(listData.cv_4, jsonGrdAp);			/** 매입전체 **/
            	fn_pushCursorIntoJson(listData.cv_5, jsonGrdArTaxBill);		/** 매출세금계산서 **/
            	fn_pushCursorIntoJson(listData.cv_6, jsonGrdArBill);		/** 매출계산서 **/
            	fn_pushCursorIntoJson(listData.cv_7, jsonGrdArZeroTax);		/** 영세율 첨부서류제출명세 **/
            	fn_pushCursorIntoJson(listData.cv_8, jsonGrdArCard);		/** 신용카드매출전표발행집계표 **/
            	fn_pushCursorIntoJson(listData.cv_9, jsonGrdArExport);		/** 수출실적명세서 **/
            	fn_pushCursorIntoJson(listData.cv_10, jsonGrdArCredit);		/** 내국신용장 **/
            	fn_pushCursorIntoJson(listData.cv_11, jsonGrdApTaxBill);	/** 매입세금계산서 **/
            	fn_pushCursorIntoJson(listData.cv_12, jsonGrdApBill);		/** 매입계산서 **/
            	fn_pushCursorIntoJson(listData.cv_13, jsonGrdApDeemed);		/** 의제매입세액 **/
            	fn_pushCursorIntoJson(listData.cv_14, jsonGrdApAsset);		/** 건물등감가상각자산취득명세 **/
            	fn_pushCursorIntoJson(listData.cv_15, jsonGrdApNonded);		/** 공제받지못할매입세액명세 **/
            	fn_pushCursorIntoJson(listData.cv_16, jsonGrdApCard);		/** 신용카드수령금액명세서 **/
            	fn_pushCursorIntoJson(listData.cv_17, jsonGrdArZeroReport);	/** 영세율첨부서류 **/
            	
                isSuccess = true;
                
                SBUxMethod.closeProgress(gv_loadingOptions);
            } else {
                alert(listData.resultMessage);
            }
            
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            
            SBUxMethod.closeProgress(gv_loadingOptions);
            
        } finally {
        	
        }
        
        fn_rebuildDetailGrid();
        
        return isSuccess;
	}
    
	
	
    /** grid create  --S **/
    
	/**
     * @name fn_createGridTaxSite
     * @description 신고 사업장 그리드 생성
     * @function
     */
    const fn_createGridTaxSite = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdTaxSite';
        SBGridProperties.id = 'grdTaxSite';
        SBGridProperties.jsonref = 'jsonGrdTaxSite';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{
            	caption : ['chk'],               
            	ref : 'CHK_YN',
            	type : 'checkbox',
            	width : '30px',    
            	style : 'text-align:center',
                typeinfo : {
                	fixedcellcheckbox : {usemode : true, rowindex : 0},
                	ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                }, 
            },
            {
            	caption: ['신고사업장명'],               
            	ref: 'TX_SITE_NM',        
            	width: '120px',    
            	style: 'text-align:center',    
            	type: 'output'
            },
            {
            	caption: ['사업자번호'],          
            	ref: 'BRNO',      
            	width: '180px',   
            	style: 'text-align:center',    
            	type : 'output'
            },
        ];
        grdTaxSite = _SBGrid.create(SBGridProperties);
    }
    
    
    /** AR_AP 전체 **/
	/**
     * @name fn_createGridArAp 1
     * @description "전체" 그리드 생성
     * @function
     */
    const fn_createGridArAp = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArAp';
        SBGridProperties.id = 'grdArAp';
        SBGridProperties.jsonref = 'jsonGrdArAp';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{
            	caption : ['chk'],               
            	ref : 'CHK_YN',
            	type : 'checkbox',
            	width : '30px',    
            	style : 'text-align:center',
                typeinfo : {
                	fixedcellcheckbox : {usemode : true, rowindex : 0},
                	ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
                disabled: true,
            },
            {
            	caption: ['연번'],
            	ref : 'TXIV_SEQ', 
            	width : '60px',
            	style : 'text-align:right',
            	type : 'output'
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['회계전표번호'],
            	ref : 'SLIP_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래일자'],
            	ref : 'TXIV_YMD', 
            	width : '100px',
            	style : 'text-align:center',
            	type : 'output',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'
            	}
            },
            {
            	caption : ['신고기준일자'],
            	ref : 'DCLR_YMD', 
            	width : '100px',
            	style : 'text-align:center',
            	type : 'output',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'
            	}
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['종사업장번호'],
            	ref : 'SBSD_BPLC_BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['중복발행구분'],
            	ref : 'DPCN_ISSU_BILL_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDupIssBillType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['예정신고누락구분'],
            	ref : 'RPT_PRNMNT_YN', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonReportOmitYn',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['봉사료'],
            	ref : 'SRVC_CST_CARD_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['영세율첨부서류'],
            	ref : 'ZRT_DCMNT_YN', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroReportYn',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['내국신용장구분'],
            	ref : 'LCL_LC_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonLocalCreditType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['서류명'],
            	ref : 'DCNMT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['발급자'],
            	ref : 'ISSU_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['발급일자'],
            	ref : 'DCNMT_ISSU_YMD', 
            	width : '100px',
            	style : 'text-align:center',
            	type : 'output',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'
            	}
            },
            {
            	caption : ['수출신고번호'],
            	ref : 'EXPRT_LCNS_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['선적일자'],
            	ref : 'SHPG_YMD', 
            	width : '100px',
            	style : 'text-align:center',
            	type : 'output',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'
            	}
            },
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['당기제출 외화'],
            	ref : 'EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기제출 원화'],
            	ref : 'EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 외화'],
            	ref : 'VAT_THTM_EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 원화'],
            	ref : 'VAT_THTM_EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출외화 금액'],
            	ref : 'EXPRT_FRCNCY_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출원화 금액'],
            	ref : 'KRW_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['서류번호'],
            	ref : 'DCNMT_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['영세율적용구분'],
            	ref : 'ZRT_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['카드용도구분'],
            	ref : 'CARD_USG_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCardUseType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['카드번호'],
            	ref : 'CARD_NO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['불공제사유 유형'],
            	ref : 'VAT_NDDC_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatNotDedType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['감가상각자산유형'],
            	ref : 'VAT_AST_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatAssetType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['의제매입구분'],	
            	ref : 'DMINPT_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDeemedInputType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['의제품명'],
            	ref : 'GDS_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['의제수량'],
            	ref : 'PRCHS_QTY', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정신고구분'],
            	ref : 'MDFCN_TAX_DCLR_TYPE', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAmendedTaxType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['정기신고분연번'],
            	ref : 'RGSCHDL_DCLR_SEQ', 
            	width : '80px',
            	style : 'text-align:right',
            	type : 'output'
            },
            {
            	caption : ['수정여부'],
            	ref : 'MDFCN_YN', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'checkbox',
           		typeinfo: {
                       ignoreupdate : true,
                       checkedvalue : 'Y',
                       uncheckedvalue : 'N'
				},
				disabled: true
            },
            {
            	caption : ['매입자납부'],
            	ref : 'PRCHSPT_PAY_VAT_FLAG', 
            	width : '80px',
            	style : 'text-align:center',
            	type : 'checkbox',
             	typeinfo: {
                          ignoreupdate : true,
                          checkedvalue : 'Y',
                          uncheckedvalue : 'N'
   				},
   				disabled: true
            },
            {
            	caption : ['감가상각자산건수'],
            	ref : 'DPRC_AST_NOCS', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'output',
                format : {type:'number', rule:'#,##0'}
            },
        ];
        
        grdArAp = _SBGrid.create(SBGridProperties);
        
    }
    
    /** 매출 전체 AR **/
	/**
     * @name fn_createGridAr
     * @description "매출 전체" 그리드 생성
     * @function
     */
    const fn_createGridAr = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAr';
        SBGridProperties.id = 'grdAr';
        SBGridProperties.jsonref = 'jsonGrdAr';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{
            	caption : ['chk'],               
            	ref : 'CHK_YN',
            	type : 'checkbox',
            	width : '30px',    
            	style : 'text-align:center',
                typeinfo : {
                	fixedcellcheckbox : {usemode : true, rowindex : 0},
                	ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['전표부가세유형'],
            	ref : 'DOC_VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['회계전표번호'],
            	ref : 'SLIP_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },            
            {
            	caption : ['전표LINE ID'],
            	ref : 'ITEM_ID', 
            	width : '70px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
     	        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['작성자'],
            	ref : 'WRT_USER_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['계정과목'],
            	ref : 'ACNTL_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전표부가세액'],
            	ref : 'DOC_VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['매수'],
            	ref : 'TXIV_CNT', 
            	datatype: 'number',
            	width : '60px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['종사업장번호'],
            	ref : 'SBSD_BPLC_BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['중복발행구분'],
            	ref : 'DPCN_ISSU_BILL_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDupIssBillType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['내국신용장구분'],
            	ref : 'LCL_LC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonLocalCreditType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['영세율첨부서류'],
            	ref : 'ZRT_DCMNT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroReportYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['서류명'],
            	ref : 'DCNMT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['발급자'],
            	ref : 'ISSU_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['발급일자'], 
            	ref : 'DCNMT_ISSU_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['수출신고번호'],
            	ref : 'EXPRT_LCNS_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['선적일자'], 
            	ref : 'SHPG_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['당기제출 외화'],
            	ref : 'EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기제출 원화'],
            	ref : 'EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 외화'],
            	ref : 'VAT_THTM_EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 원화'],
            	ref : 'VAT_THTM_EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출외화 금액'],
            	ref : 'EXPRT_FRCNCY_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출원화 금액'],
            	ref : 'KRW_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
 
            {
            	caption : ['서류번호'],
            	ref : 'DCNMT_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['영세율적용구분'],
            	ref : 'ZRT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['매입자납부'],               
            	ref : 'PRCHSPT_PAY_VAT_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdAr = _SBGrid.create(SBGridProperties);
        
    }
    
    /** AP **/
	/**
     * @name fn_createGridAp
     * @description "매입 전체" 그리드 생성
     * @function
     */
    const fn_createGridAp = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAp';
        SBGridProperties.id = 'grdAp';
        SBGridProperties.jsonref = 'jsonGrdAp';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{
            	caption : ['chk'],               
            	ref : 'CHK_YN',
            	type : 'checkbox',
            	width : '30px',    
            	style : 'text-align:center',
                typeinfo : {
                	fixedcellcheckbox : {usemode : true, rowindex : 0},
                	ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['전표부가세유형'],
            	ref : 'DOC_VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['회계전표번호'],
            	ref : 'SLIP_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },            
            {
            	caption : ['전표LINE ID'],
            	ref : 'ITEM_ID', 
            	width : '70px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
     	        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['작성자'],
            	ref : 'WRT_USER_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['계정과목'],
            	ref : 'ACNTL_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전표부가세액'],
            	ref : 'DOC_VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['매수'],
            	ref : 'TXIV_CNT', 
            	datatype: 'number',
            	width : '60px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['종사업장번호'],
            	ref : 'SBSD_BPLC_BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['중복발행구분'],
            	ref : 'DPCN_ISSU_BILL_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDupIssBillType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['내국신용장구분'],
            	ref : 'LCL_LC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonLocalCreditType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['영세율첨부서류'],
            	ref : 'ZRT_DCMNT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroReportYn',
                    label : 'label',
                    value : 'value'
                },
            },
 
            {
            	caption : ['서류명'],
            	ref : 'DCNMT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['발급자'],
            	ref : 'ISSU_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['발급일자'], 
            	ref : 'DCNMT_ISSU_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['수출신고번호'],
            	ref : 'EXPRT_LCNS_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['선적일자'], 
            	ref : 'SHPG_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            },
 
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['당기제출 외화'],
            	ref : 'EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기제출 원화'],
            	ref : 'EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 외화'],
            	ref : 'VAT_THTM_EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 원화'],
            	ref : 'VAT_THTM_EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출외화 금액'],
            	ref : 'EXPRT_FRCNCY_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출원화 금액'],
            	ref : 'KRW_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
 
            {
            	caption : ['서류번호'],
            	ref : 'DCNMT_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['영세율적용구분'],
            	ref : 'ZRT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['매입자납부'],               
            	ref : 'PRCHSPT_PAY_VAT_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        grdAp = _SBGrid.create(SBGridProperties);
    }
    
    /** AR_TAX_BILL **/
    /** 매출 전체 AR **/
	/**
     * @name fn_createGridArTaxBill
     * @description "매출세금계산서" 그리드 생성
     * @function
     */
    const fn_createGridArTaxBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArTaxBill';
        SBGridProperties.id = 'grdArTaxBill';
        SBGridProperties.jsonref = 'jsonGrdArTaxBill';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             		
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['중복발행구분'],
            	ref : 'DPCN_ISSU_BILL_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDupIssBillType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['매입자납부'],               
            	ref : 'PRCHSPT_PAY_VAT_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        grdArTaxBill = _SBGrid.create(SBGridProperties);
    }
    
    /** AR_BILL **/
	/**
     * @name fn_createGridArBill
     * @description "매출계산서" 그리드 생성
     * @function
     */
    const fn_createGridArBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArBill';
        SBGridProperties.id = 'grdArBill';
        SBGridProperties.jsonref = 'jsonGrdArBill';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
                
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             		
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['중복발행구분'],
            	ref : 'DPCN_ISSU_BILL_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDupIssBillType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	 
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['매입자납부'],               
            	ref : 'PRCHSPT_PAY_VAT_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        grdArBill = _SBGrid.create(SBGridProperties);
    }
    
    
    /** AR_ZERO_TAX **/
	/**
     * @name fn_createGridArZeroTax
     * @description "영세율첨부서류제출명세" 그리드 생성
     * @function
     */
    const fn_createGridArZeroTax = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArZeroTax';
        SBGridProperties.id = 'grdArZeroTax';
        SBGridProperties.jsonref = 'jsonGrdArZeroTax';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
     	        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'input'
            },
            {
            	caption : ['당기제출 외화'],
            	ref : 'EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기제출 원화'],
            	ref : 'EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 외화'],
            	ref : 'VAT_THTM_EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 원화'],
            	ref : 'VAT_THTM_EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['영세율첨부서류'],
            	ref : 'ZRT_DCMNT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroReportYn',
                    label : 'label',
                    value : 'value'
                },
            },            
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['서류명'],
            	ref : 'DCNMT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'input'
            },
            {
            	caption : ['발급자'],
            	ref : 'ISSU_NM', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'input'
            },
            {
            	caption : ['발급일자'], 
            	ref : 'DCNMT_ISSU_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['선적일자'], 
            	ref : 'SHPG_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['수출신고번호'],
            	ref : 'EXPRT_LCNS_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'input'
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
        ];
        
        grdArZeroTax = _SBGrid.create(SBGridProperties);
        
    }
    
    /** AR_CARD **/
	/**
     * @name fn_createGridArCard
     * @description "신용카드매출" 그리드 생성
     * @function
     */
    const fn_createGridArCard = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArCard';
        SBGridProperties.id = 'grdArCard';
        SBGridProperties.jsonref = 'jsonGrdArCard';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            		
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
     	        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdArCard = _SBGrid.create(SBGridProperties);
    }
    
    /** AR_EXPORT **/
	/**
     * @name fn_createGridArExport
     * @description "수출실적명세서" 그리드 생성
     * @function
     */
    const fn_createGridArExport = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArExport';
        SBGridProperties.id = 'grdArExport';
        SBGridProperties.jsonref = 'jsonGrdArExport';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
     	        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['수출신고번호'],
            	ref : 'EXPRT_LCNS_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'input'
            },
            {
            	caption : ['선적일자'], 
            	ref : 'SHPG_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            },
 
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['수출외화 금액'],
            	ref : 'EXPRT_FRCNCY_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출원화 금액'],
            	ref : 'KRW_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['서류번호'],
            	ref : 'DCNMT_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	 
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdArExport = _SBGrid.create(SBGridProperties);
    }
    
    /** AR_CREDIT **/
	/**
     * @name fn_createGridArCredit
     * @description "내국신용장 구매확인서 전자발급명세서" 그리드 생성
     * @function
     */
    const fn_createGridArCredit = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArCredit';
        SBGridProperties.id = 'grdArCredit';
        SBGridProperties.jsonref = 'jsonGrdArCredit';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             	
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['내국신용장구분'],
            	ref : 'LCL_LC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonLocalCreditType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['발급일자'], 
            	ref : 'DCNMT_ISSU_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
                type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['서류번호'],
            	ref : 'DCNMT_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	 
            	type : 'input'
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['선적일자'], 
            	ref : 'SHPG_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['당기제출 외화'],
            	ref : 'EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기신고 외화'],
            	ref : 'VAT_THTM_EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출외화 금액'],
            	ref : 'EXPRT_FRCNCY_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수출원화 금액'],
            	ref : 'KRW_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
        ];
        
        grdArCredit = _SBGrid.create(SBGridProperties);
    }
    
 
    /** AP_TAX_BILL **/
	/**
     * @name fn_createGridApTaxBill
     * @description "매입세금계산서" 그리드 생성
     * @function
     */
    const fn_createGridApTaxBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApTaxBill';
        SBGridProperties.id = 'grdApTaxBill';
        SBGridProperties.jsonref = 'jsonGrdApTaxBill';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
                
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             		
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['중복발행구분'],
            	ref : 'DPCN_ISSU_BILL_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDupIssBillType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['매입자납부'],               
            	ref : 'PRCHSPT_PAY_VAT_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdApTaxBill = _SBGrid.create(SBGridProperties);
    }
    
    /** AP_BILL **/
	/**
     * @name fn_createGridApBill
     * @description "매입계산서" 그리드 생성
     * @function
     */
    const fn_createGridApBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApBill';
        SBGridProperties.id = 'grdApBill';
        SBGridProperties.jsonref = 'jsonGrdApBill';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
                
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             		
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['전자발행구분'],
            	ref : 'ELDOC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonEtaxType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['11일외전송구분'],
            	ref : 'AFTR_DUDT_SEND_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonAfterDueDateYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	 
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdApBill = _SBGrid.create(SBGridProperties);
    }
    
    
    /** AP_DEEMED **/
	/**
     * @name fn_createGridApDeemed
     * @description "의제매입세액 명세서" 그리드 생성
     * @function
     */
    const fn_createGridApDeemed = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApDeemed';
        SBGridProperties.id = 'grdApDeemed';
        SBGridProperties.jsonref = 'jsonGrdApDeemed';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
                
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             		
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            		
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['의제매입구분'],
            	ref : 'DMINPT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            		
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonDeemedInputType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['의제품명'],
            	ref : 'GDS_NM', 
            	width : '100px',
            	style : 'text-align:left',
            		
            	type : 'input'
            },
            {
            	caption : ['의제수량'],
            	ref : 'PRCHS_QTY', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	 
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        grdApDeemed = _SBGrid.create(SBGridProperties);
    }
    
    
    /** AP_ASSET **/
	/**
     * @name fn_createGridApAsset
     * @description "건물등감가상각자산취득명세" 그리드 생성
     * @function
     */
    const fn_createGridApAsset = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApAsset';
        SBGridProperties.id = 'grdApAsset';
        SBGridProperties.jsonref = 'jsonGrdApAsset';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['회계전표번호'],
            	ref : 'SLIP_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            }, 
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             	
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자(주민)번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['감가상각자산건수'],
            	ref : 'DPRC_AST_NOCS', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['감가상각자산유형'],
            	ref : 'VAT_AST_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatAssetType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdApAsset = _SBGrid.create(SBGridProperties);
    }
    
    
    /** AP_NONDED **/
	/**
     * @name fn_createGridApNonded
     * @description "공제받지못할매입세액명세" 그리드 생성
     * @function
     */
    const fn_createGridApNonded = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApNonded';
        SBGridProperties.id = 'grdApNonded';
        SBGridProperties.jsonref = 'jsonGrdApNonded';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            }, 
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             	
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['불공제사유유형'],
            	ref : 'VAT_NDDC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatNotDedType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        
        grdApNonded = _SBGrid.create(SBGridProperties);
        
    }
    
    
    /** AP_CARD **/
	/**
     * @name fn_createGridApCard
     * @description "신용카드수령금액명세" 그리드 생성
     * @function
     */
    const fn_createGridApCard = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApCard';
        SBGridProperties.id = 'grdApCard';
        SBGridProperties.jsonref = 'jsonGrdApCard';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAp',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',	
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['전표적요'],
            	ref : 'VAT_DESCRIPTION', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            }, 
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['카드용도구분'],
            	ref : 'CARD_USG_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCardUseType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['카드번호'],
            	ref : 'BRNO', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['가맹점명'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['가맹점사업자번호'],
            	ref : 'BRNO', 
            	width : '120px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['세액'],
            	ref : 'VAT_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
        ];
        grdApCard = _SBGrid.create(SBGridProperties);
    }
 
    
    /** 영세율매출명세서 AR_ZERO_REPORT **/
	/**
     * @name fn_createGridAr
     * @description "영세율매출명세서" 그리드 생성
     * @function
     */
    const fn_createGridArZeroReport = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArZeroReport';
        SBGridProperties.id = 'grdArZeroReport';
        SBGridProperties.jsonref = 'jsonGrdArZeroReport';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['확정'],               
            	ref : 'CFMTN_FLAG',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['부가세유형'],
            	ref : 'VAT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonVatTypeAr',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래일자'], 
            	ref : 'TXIV_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            		
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['전표명'],
            	ref : 'SLIP_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['신고기준일자'], 
            	ref : 'DCLR_YMD', 
            	width : '100px', 
            	style : 'text-align:center',
            	
            	type : 'inputdate',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', origin : 'yyyymmdd'
            	}, 
            	typeinfo : {
            		alias : "yyyy-mm-dd",
            		calendartype : "date", 
            		dateformat: 'yymmdd'
            	},
            	clearbutton: true
            },
            {
            	caption : ['영세율구분'],
            	ref : 'ZRT_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonZeroType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['거래처코드'],
            	ref : 'CNPT_CD', 
            	width : '80px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_NM', 
            	width : '100px',
            	style : 'text-align:left',
            	
            	type : 'output'
            },
            {
            	caption : ['거래처명'],
            	ref : 'CNPT_CD', 
            	width : '30px',
             	type:'button',
             	style: 'text-align:center',
             	
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
  					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_popGridCsCode(" + nRow + ")'>...</button>";
     	        }
            },
            {
            	caption : ['사업자번호'],
            	ref : 'BRNO', 
            	width : '100px',
            	style : 'text-align:left',
            	type : 'input'
            },
 
            {
            	caption : ['통화코드'],
            	ref : 'CRN_CD', 
            	width : '60px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
            {
            	caption : ['당기제출 외화'],
            	ref : 'EXPRT_AMT', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['당기제출 원화'],
            	ref : 'EXPRT_AMT_KRW', 
            	width : '80px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['수입금액제외구분'],
            	ref : 'INCM_EXCL_AMT_YN', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonExcludeAmtYn',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['공급가액'],
            	ref : 'SPLY_AMT', 
            	datatype: 'number',
            	width : '80px',
            	style : 'text-align:right',
            	type : 'input',
            	datatype: 'number',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
            	format : {type:'number', rule:'#,##0'}
            },
            {
            	caption : ['매입매출구분'],
            	ref : 'AR_AP_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	 
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonArApType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['수정여부'],               
            	ref : 'MDFCN_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                },
            },
            {
            	caption : ['내국신용장구분'],
            	ref : 'LCL_LC_TYPE', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'combo',
            	typeinfo : {
                    ref : 'jsonLocalCreditType',
                    label : 'label',
                    value : 'value'
                },
            },
            {
            	caption : ['수출신고번호'],
            	ref : 'EXPRT_LCNS_NO', 
            	width : '80px',
            	style : 'text-align:left',
            	type : 'input'
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT', 
            	width : '60px',
            	style : 'text-align:right',
            	datatype: 'number',
            	type : 'input',
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
				},
                format : {type:'number', rule:'#,##0.00'}
            },
        ];
        
        grdArZeroReport = _SBGrid.create(SBGridProperties);
        
    }
    
    
    /** grid create  --E **/
 
 
 
 
 
 
    /** tab Switch **/
    function fn_switchTab(selectId, selectJson){
        const li = document.querySelectorAll(".sbux-tabs-item");
        /** 해당 탭 줄 확인 **/
        li.forEach(function(item,idx){
            if($(item).data("sbuxId") === selectId){
                if(idx < 8){
                    fn_switchRows();
                }
            }
        });
    }
    
    /** li switch **/
    function fn_switchRows(){
        const ul = document.getElementById("tabTopJson_ul");
        const items = Array.from(ul.children);
 
        const firstRow = items.slice(0, 8);
        const secondRow = items.slice(8, 16);
 
        //ul.innerHTML = "";
        $('#tabTopJson_ul').html('');
        secondRow.forEach(item => ul.appendChild(item));
        firstRow.forEach(item => ul.appendChild(item));
    }
 
    /**
     * @name fn_addRow
     * @description 그리드 행추가
     */
    const fn_addRow = function() {
    	
    	const gridObj = fn_getCurrentGrid();
    	
    	if (gfn_isEmpty(gridObj)) {
    		return;
    	}
    	
        const rowIndex = gridObj.getRow();
 
        if (rowIndex < 0){ //데이터가 없고 행선택이 없을경우.
        	gridObj.addRow(true);
        } else {
        	gridObj.insertRow(rowIndex);
        }
    }
 
    /**
     * @name fn_delRow
     * @description 그리드 행삭제
     */
    const fn_delRow = async function() {
 
		const gridObj = fn_getCurrentGrid();
    	
    	if (gfn_isEmpty(gridObj)) {
    		return;
    	}
    	
    	const rowIndex = gridObj.getRow();
    	
    	if (rowIndex < 1) {
    		gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
    	}
    	
		const rowStatus = gridObj.getRowStatus(rowIndex);
		if (rowStatus == 0 || rowStatus == 2) {
			
			if (!gfn_comConfirm("Q0002", "등록정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}
			
			gridObj.setRowStatus(rowIndex, 'd');
			
    	} else {
    		gridObj.deleteRow(rowIndex);
    	}
    }
    
    /**
     * @name fn_getCurrentGrid
     * @description 현재 선택된 탭페이지의 그리드object를 반환
     */
    const fn_getCurrentGrid = function() {
    	
    	const tabPage = SBUxMethod.get('tabTopJson');
    	
    	let gridObj = null;
    	
    	switch (tabPage) {
    		case "grdAR_AP":			// 전체
    			gridObj = grdArAp;
    			break;
    		case "grdAR":				// 매출 전체
    			gridObj = grdAr;
    			break;
    		case "grdAP":				// 매입 전체
    			gridObj = grdAp;
    			break;
    		case "grdAR_TAX_BILL":		// 매출세금계산서
    			gridObj = grdArTaxBill;
    			break;
    		case "grdAR_BILL":			// 매출계산서
    			gridObj = grdArBill;
    			break;
    		case "grdAR_ZERO_TAX":		// 영세율 첨부서류제출명세
    			gridObj = grdArZeroTax;
    			break;
    		case "grdAR_CARD":			// 신용카드매출전표발행집계표
    			gridObj = grdArCard;
    			break;
    		case "grdAR_EXPORT":		// 수출실적명세서
    			gridObj = grdArExport;
    			break;
    		case "grdAR_CREDIT":		// 내국신용장 구매확인서 전자발급명세서
    			gridObj = grdArCredit;
    			break;
    		case "grdAP_TAX_BILL":		// 매입세금계산서
    			gridObj = grdApTaxBill;
    			break;
    		case "grdAP_BILL":			// 매입계산서
    			gridObj = grdApBill;
    			break;
    		case "grdAP_DEEMED":		// 의제매입세액 명세서
    			gridObj = grdApDeemed;
    			break;
    		case "grdAP_ASSET":			// 건물등감가상각자산취득명세
    			gridObj = grdApAsset;
    			break;
    		case "grdAP_NONDED":		// 공제받지못할매입세액명세
    			gridObj = grdApNonded;
    			break;    			
    		case "grdAP_CARD":			// 신용카드수령금액명세
    			gridObj = grdApCard;
    			break;
    		case "grdAR_ZERO_REPORT":			// 신용카드수령금액명세
    			gridObj = grdArZeroReport;
    			break;
    	}
    	
    	return gridObj;
    	
    }
    
    
    
    /** 공통팝업 */
    /**
     * @name fn_popGridCsCode
     * @description 거래처 팝업 (그리드)
     */
	const fn_popGridCsCode = function(_nRow) {
    	
		const _gridObj = fn_getCurrentGrid();
		
		if (gfn_isEmpty(_gridObj)) {
			return;
		}
    	
    	const rowData = _gridObj.getRowData(_nRow);
    	
    	fn_compopupCsCode(
    			rowData.CNPT_CD, 
    			rowData.CNPT_NM,
    			function(_code, _name) {
    				
    				console.log("_code", _code);
    				console.log("_name", _name);
    				console.log("_nRow", _nRow);
    				
    				let data = _gridObj.getRowData(_nRow, false);
    				console.log("data", data);
    				data.CNPT_CD = _code;
    				data.CNPT_NM = _name;
    				
    				let rowSts = _gridObj.getRowStatus(_nRow);
    				
    				if (rowSts === 0) {
    					_gridObj.setRowStatus(_nRow, 2);
    				}
    				
    				_gridObj.refresh();
	    		}
			);
    	
    	SBUxMethod.openModal("modal-compopup1");
    }
    /**
     * @name fn_popSrchCsCode
     * @description 거래처 팝업 (조회)
     */
    const fn_popSrchCsCode = function(csName) {
    	
    	const csCode = SBUxMethod.get('srch-inp-csCode');

    	fn_compopupCsCode(
    			csCode, 
    			csName,
    			function(_code, _name) {
		            SBUxMethod.set('srch-inp-csCode', _code);
		    		SBUxMethod.set('srch-inp-csName', _name);
	    		}
			);
    }
    
    const fn_clearSrchCsCode = function() {
    	SBUxMethod.set('srch-inp-csCode', "");
		SBUxMethod.set('srch-inp-csName', "");
    }
    
    /**
     * @name fn_compopupCsCode
     * @description 거래처 팝업
     */
    const fn_compopupCsCode = async function(_code, _name, _callbackFnc) {
 
        var searchCode 		= "";
        var searchName 		= gfn_nvl(_name);
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_CNPT_NM_";
        var replaceText2 	= "_BRNO_";
        var strWhereClause 	= "AND CNPT_CD LIKE '%" + replaceText0 + "%' AND CNPT_NM LIKE '%" + replaceText1 + "%' AND BRNO LIKE '%"+ replaceText2 + "%'";


        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_PURCHASE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명", "사업자번호" ]
            ,searchInputFields		: ["CNPT_CD", "CNPT_NM", "BRNO"]
            ,searchInputValues		: [searchCode, searchName, ""]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소", "전화", "팩스", "지급기준", "지급기준명", "지급방법", "통화"]
            ,tableColumnNames		: ["CNPT_CD" , "CNPT_NM", "BRNO", "CEO_NM", "BZSTAT", "TPBIZ", "ADDR", "TELNO", "FX_NO", "PAY_TERM_CD", "PAY_TERM_NM", "PAY_MTHD", "CRN_CD"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data) {
				if (typeof _callbackFnc === 'function') {
					_callbackFnc(data.CNPT_CD, data.CNPT_NM);
				}
			}
        });
    }

    const fn_srchcompopupCsCode = async function(_name){
        var searchCode 		= gfnma_nvl(SBUxMethod.get('srch-inp-csCode'));
        var searchName 		= gfnma_nvl(_name);
        var strWhereClause 	= "AND CNPT_CD LIKE '%" + searchCode + "%' AND CNPT_NM LIKE '%" + searchName + "%' ";

        SBUxMethod.attr('modal-compopupcs', 'header-title', '거래처정보');
        await comPopupCs({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,inputData: {
                "CS_CODE" : gfnma_nvl2(searchCode),
                "CS_NAME" : gfnma_nvl2(searchName),
                "BIZ_REGNO" : ''
            }
            ,bizcompId				: 'P_CS_PURCHASE'
            ,whereClause			: strWhereClause
            ,itemSelectEvent		: function (data){
                SBUxMethod.set("srch-inp-csCode", 		data.CNPT_CD);
                SBUxMethod.set("srch-inp-csName",		data.CNPT_NM);
            },
        });
        SBUxMethod.setModalCss('modal-compopupcs', {width:'800px'});
        SBUxMethod.openModal('modal-compopupcs');
    }
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
