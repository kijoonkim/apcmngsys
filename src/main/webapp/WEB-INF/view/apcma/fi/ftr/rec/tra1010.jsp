<%
    /**
     * @Class Name 		: tra1010.jsp
     * @Description 	: 채권반제 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
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
    <title>title : 채권반제</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <style>
        #Sales > table > tbody > tr > td,#Purchase > table > tbody > tr > td{
            text-align: center;
            border: 1px solid #e8f1f9 !important;
        }
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
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
        
        	<!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            
            <table id="srchTable" class="table table-bordered tbl_fixed">
            
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
						<col style="width: 6%">
						<col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">기간</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	<sbux-datepicker 
                    		id="srch-dtp-ymd" 
                    		name="srch-dtp-ymd" 
                    		uitype="popup" 
                    		datepicker-mode="day"
                            date-format="yyyy-mm-dd"
                            class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                        ></sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">사업단위</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	  <div class="dropdown">
							<button 
								style="width:100%;text-align:left" 
								class="btn btn-sm btn-light dropdown-toggle" 
								type="button" 
								id="SRCH_FI_ORG_CODE" 
								data-toggle="dropdown" 
								aria-haspopup="true" 
								aria-expanded="false"
							>
								<font>선택</font>
								<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
							</button>
							<div 
								class="dropdown-menu" 
								aria-labelledby="SRCH_FI_ORG_CODE" 
								style="width:300px;height:150px;padding-top:0px;overflow:auto"
							></div>
						</div>  
					</td>
                    <td></td>
                    <th scope="row" class="th_bg">수금방법</th>		<!-- 지급방식 -->
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-select
                        	unselected-text="전체"
                            uitype="single"
                            id="srch-slt-payMethodDeposit"
                            name="srch-slt-payMethodDeposit"
                            class="form-control input-sm"
                            jsondata-ref="jsonPayMethodDeposit"
						/>
                    </td>
                    <td></td>
                    <td colspan="4">
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">입금통화</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">고객사</th>
                    <td colspan="2" class="td_input">
                        <sbux-input 
                        	id="SRCH_PAYER_CODE" 
                        	name="SRCH_PAYER_CODE" 
                        	uitype="hidden"
                        ></sbux-input>
                        <sbux-input 
                        	id="SRCH_PAYER_NAME" 
                        	class="form-control input-sm" 
                        	uitype="text" 
                        	style="width:100%"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findPayerName"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">원가중심점</th>
                    <td class="td_input" style="border-right: hidden;">
 						<sbux-input 
	 						uitype="text" 
	 						id="COST_CENTER_CODE" 
	 						class="form-control input-sm" 
 						></sbux-input>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input 
							uitype="text" 
							id="COST_CENTER_NAME" 
							class="form-control input-sm" 
						></sbux-input>
					</td>
                    <td class="td_input">
						<sbux-button 
							class="btn btn-xs btn-outline-dark" 
							text="찾기" 
							uitype="modal" 
							target-id="modal-compopup1" 
							onclick="fn_compopupCostCenter()"
						></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">처리자</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	<sbux-input 
                    		id="SRCH_EMP_CODE" 
                    		uitype="text" 
                    		placeholder="" 
                    		class="form-control input-sm"
                    	></sbux-input>
							 

                    </td>
                    <td></td>
                </tr>
                <tr>
                	<th scope="row" class="th_bg">입금통화</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    

                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">입금자</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    

                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">반제여부</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	<sbux-select 
                    		id="SRCH_USE_YN1" 
                    		uitype="single" 
                    		jsondata-ref="jsonUseYn" 
                    		unselected-text="선택" 
                    		class="form-control input-sm"
                    	></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">반제대상</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    

                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li>
						<span>수금 거래내역</span>
					</li>
				</ul>
				<div class="ad_tbl_toplist">
                	<sbux-button
                        id="btn-retra-batch-reg"
                        name="btn-retra-batch-reg"
                        uitype="normal"
                        text="일괄반제"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_retraBatchReg"
                        style="float: right;"
                   	></sbux-button>
                   	<sbux-button
                        id="btn-retra-batch-cncl"
                        name="btn-retra-batch-cncl"
                        uitype="normal"
                        text="일괄반제취소"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_retraBatchClcl"
                        style="float: right;"
                   	></sbux-button>
                   	<div>
                   		<span>분할금액</span>
                   	</div>
                   	<sbux-input 
                    	id="inp-prttn-amt"
                    	name="inp-prttn-amt"
                        class="form-control input-sm" 
                        uitype="text"
                        style="float: right;"
                   	></sbux-input>
                   	<sbux-button
                        id="btn-prttn-reg"
                        name="btn-prttn-reg"
                        uitype="normal"
                        text="분할"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_prttnReg"
                        style="float: right;"
                   	></sbux-button>
                   	<sbux-button
                        id="btn-prttn-cncl"
                        name="btn-prttn-cncl"
                        uitype="normal"
                        text="분할취소"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_prttnClcl"
                        style="float: right;"
                   	></sbux-button>
               </div>
			</div>
			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-grdClctmDlng" style="height:208px;"></div>
			</div>

			<br/>
			<!-- 
				ACNTG	회계
				FUND	자금
				RETRA	반제
				CLCTM	수금
				DLNG	거래
			 -->
            <sbux-tabs
				id="tab-clctm"
				name="tab-clctm"
				uitype="webacc"
				is-scrollable="false"
				wrap-style="height:100%"
			    title-target-id-array="tp-retra^tp-fund^tp-acntg"
			    title-text-array="반제실적^자금실적^회계처리"
			    onclick="fn_tabClick"
			    title-style-array="{
			    		margin-right: 5px;width: 8vw;
			        	text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
			        	text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
			            text-align: center;font-weight: bold;border-radius:0}">
			</sbux-tabs>
    		<div class="tab-content">
				<div id="tp-retra" class="tab-page">
          			<div class="ad_tbl_top">
           				<ul class="ad_tbl_count">
		        			<li>
		        				<span>채권반제항목</span>
		        			</li>
           				</ul>
        			</div>
         			<div id="sb-area-grdRetra" style="height: 300px"></div>
       			</div>
       			<div id="tp-fund" class="tab-page">
          			<div class="ad_tbl_top">
           				<ul class="ad_tbl_count">
		        			<li>
		        				<span>채권반제항목</span>
		        			</li>
           				</ul>
        			</div>
         			<div id="sb-area-grdFund" style="height: 300px"></div>
       			</div>
       			<div id="tp-acntg" class="tab-page">
          			<div class="ad_tbl_top">
           				<ul class="ad_tbl_count">
		        			<li>
		        				<span>채권반제항목</span>
		        			</li>
           				</ul>
        			</div>
         			<div id="sb-area-grdAcntg" style="height: 300px"></div>
       			</div>
            </div>
            
        </div>
    </div>
</section>


	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:800px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>
<script>

	let lv_prvTabId;
	let lv_prvClclnYr;
	let lv_prvClclnSn;
	
	lv_prvTabId = "tp-retra";

	// tp-retra^tp-fund^tp-acntg
	
	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	//-----------------------------------------------------------

	var jsonUseYn = [];
	var jsonCostCenterCode = []; // 원가중심점코드	
	
    let json사업장리스트 = [];
    let json매출 = [];
    let json매입 = [];

    let 사업장grid;
    let 매출grid;
    let 매입grid;

    var jsonPayMethodDeposit = []; // 지급방식 >> 수금방법

    window.addEventListener("DOMContentLoaded",function(){
        fn_createGrid();
        fn_create매출();
        fn_create매입();
    });

	/**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function() {
    	
    	SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
		SBUxMethod.set("SRCH_DATE_FR",gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("SRCH_DATE_TO", gfn_dateLastYmd(new Date()));
		SBUxMethod.set("SRCH_RIDGUBUN", "99");
		
		await fn_initSBSelect();
    	
		
    	
    }
	
	/**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
  		
		// 코드정보 설정
		let result = await Promise.all([
			gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode),
			// 지급방법
	        gfnma_setComSelect(
	        		['srch-slt-payMethodDeposit'], 
	        		jsonPayMethodDeposit, 
	        		'L_FIM073_DEPOSIT', 
	        		'', 
	        		gv_ma_selectedApcCd, 
	        		gv_ma_selectedClntCd, 
	        		'SUB_CODE', 
	        		'CODE_NAME', 
	        		'Y', 
	        		''
	        	),
	       
		]);
		
		
		
		 
		
 		await fn_setCodeJson();
 		
		SBUxMethod.refresh("srch-slt-clclnSeCd");
		SBUxMethod.refresh("srch-slt-clclnClsf");
	}
	
    
    
 	/**
     * @name fn_findAccountCodeForGvwList
     * @description 계정과목 정보 조회
     */
	const fn_findAccountCodeForGvwList = function(row, col) {
		SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
		SBUxMethod.openModal('modal-compopup1');

		var searchText 		= '';
		var addParams = ['NULL'];
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_FIM045'
			,popupType				: 'B'
			,whereClause			: addParams
			,searchCaptions			: ["코드", 		"코드명"]
			,searchInputFields		: ["V_P_ACCOUNT_CODE", 	"V_P_ACCOUNT_NAME"]
			,searchInputValues		: ["", 				searchText]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
			,height					: '400px'
			,tableHeader			: ["계정코드",		"계정명", 		"계정명(한글)"]
			,tableColumnNames		: ["ACCOUNT_CODE",	"ACCOUNT_NAME", 	"ACCOUNT_NAME_CHN"]
			,tableColumnWidths		: ["100px", 		"100px", 		"200px"]
			,itemSelectEvent		: function (data){
				gvwItem.setCellData(row, (col-1), data.ACCOUNT_CODE);
				gvwItem.setCellData(row, col, data.ACCOUNT_NAME);
			},
		});
	}    
    
 	/**
     * @name fn_findPayerName
     * @description 고객사 정보 조회 (팝업)
     */
    const fn_findPayerName = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_PAYER_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.CS_NAME LIKE '%" + replaceText1 + "%' AND A.BIZ_REGNO LIKE '%" + replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_SALE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["고객사코드",		"사업자번호", 		"고객사명"]
            ,searchInputFields		: ["CS_CODE",	"BIZ_REGNO", 	"CS_NAME"]
            ,searchInputValues		: ["", 			"",		searchText]
            ,searchInputTypes		: ["input", 	"input",		"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소"
                , "전화", "팩스", "채권계정", "채권계정명", "선수금계정", "선수금계정명", "수금기준", "수금기준명", "수금방법", "통화"]
            ,tableColumnNames		: ["CS_CODE", "CS_NAME",  "BIZ_REGNO", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS", "ADDRESS"
                , "TEL", "FAX", "AR_ACC_CODE", "AR_ACC_NAME", "ADVANCE_ACC_CODE", "ADVANCE_ACC_NAME", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_PAYER_CODE', data.CS_CODE);
                SBUxMethod.set('SRCH_PAYER_NAME', data.CS_NAME);
            },
        });
    }
 	
    /**
     * 공통팝업
     * 원가중심점
     */
    var fn_compopupCostCenter = function() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get("COST_CENTER_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND A.COST_CENTER_CODE  LIKE '%" + replaceText0 + "%' AND A.COST_CENTER_NAME  LIKE '%" + replaceText1 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 			"계정명"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭", 				"부서코드", 		"부서명", 			"원가유형", 		"사업장", 		"여신영역"]
   			,tableColumnNames		: ["COST_CENTER_CODE",	"COST_CENTER_NAME",	"DEPT_CODE",	"COST_CENTER_NAME",	"COST_CLASS",	"SITE_CODE",	"CREDIT_AREA"]
   			,tableColumnWidths		: ["80px", 				"80px", 			"80px", 		"80px", 			"80px", 		"80px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('COST_CENTER_CODE', data.COST_CENTER_CODE);
				SBUxMethod.set('COST_CENTER_NAME', data.COST_CENTER_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 사원조회
     */
	const fn_findEmpCode = function() {
		var searchCode 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
		var searchName 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
		var replaceText0 	= "_DEPT_NAME_";
		var replaceText1 	= "_EMP_CODE_";
		var replaceText2 	= "_EMP_NAME_";
		var replaceText3 	= "_EMP_STATE_";
		var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

		SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_HRI001'
			,popupType				: 'A'
			,whereClause			: strWhereClause
			,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
			,searchInputValues		: ["", 			searchCode, searchName,		""]
			,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
			,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
			,height					: '400px'
			,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
			,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('EMP_NAME', data.EMP_NAME);
				SBUxMethod.set('EMP_CODE', data.EMP_CODE);
			},
		});
	}
	
	
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '사업장리스트그리드';
        SBGridProperties.id = '사업장리스트그리드';
        SBGridProperties.jsonref = 'json사업장리스트';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['신고사업장명'],               ref : 'check',        width : '50%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '50%',   style : 'text-align:center',    type : 'input'},
        ];
        사업장grid = _SBGrid.create(SBGridProperties);
    }
    const fn_create매출 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '매출그리드';
        SBGridProperties.id = '매출그리드';
        SBGridProperties.jsonref = 'json매출';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['순번'],               ref : 'check',        width : '10%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '20%',   style : 'text-align:center',    type : 'input'},
            {caption : ['상호(법인명)'],          ref : 'academy',      width : '30%',   style : 'text-align:center',    type : 'input'},
            {caption : ['매수'],          ref : 'academy',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['공급가액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
            {caption : ['세액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
        ];
        매출grid = _SBGrid.create(SBGridProperties);
    }
    const fn_create매입 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '매입그리드';
        SBGridProperties.id = '매입그리드';
        SBGridProperties.jsonref = 'json매입';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['순번'],               ref : 'check',        width : '10%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '20%',   style : 'text-align:center',    type : 'input'},
            {caption : ['상호(법인명)'],          ref : 'academy',      width : '30%',   style : 'text-align:center',    type : 'input'},
            {caption : ['매수'],          ref : 'academy',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['공급가액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
            {caption : ['세액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
        ];
        매출grid = _SBGrid.create(SBGridProperties);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
