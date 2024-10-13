\<%
/**
 * @Class Name 		: hra8400.jsp
 * @Description 	: 간이지급명세서
 * @author 			:
 * @since 			: 2024.07.10
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.10   	장성주		최초 생성
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
	<title>title : 간이지급명세서</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 간이지급명세서-->
                </div>
                <div style="margin-left: auto;">
                	<sbux-button id="btnFileCrt" name="btnFileCrt" 	uitype="normal" text="파일생성" class="btn btn-sm btn-outline-danger" onclick="fn_btnFileCrt"></sbux-button>
                </div>
            </div>
            <div class="box-body">


                <table id="searchTable" class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
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
                            <th scope="row" class="th_bg">법인</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-compCode" name="srch-slt-compCode" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
                            </td>
							<td></td>
                            <th scope="row" class="th_bg">급여영역</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-payAreaType" name="srch-slt-payAreaType" class="form-control input-sm" uitype="single" jsondata-ref="jsonPayAreaType"></sbux-select>
                            </td>
							<td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">귀속연도</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-jobYyyy"
									name="srch-dtp-jobYyyy"
									uitype="popup"
									date-format="yyyy"
									datepicker-mode="year"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-clclnYr)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">근무시기</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select id="srch-slt-harfyearlyType" name="srch-slt-harfyearlyType" class="form-control input-sm" uitype="single" jsondata-ref="jsonWorkEr"></sbux-select>
                            </td>
							<td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">귀속연월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-jobYyyymmFr"
									name="srch-dtp-jobYyyymmFr"
									uitype="popup"
									date-format="yyyymm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-jobYyyy)"
								></sbux-datepicker>
							</td>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-jobYyyymmTo"
									name="srch-dtp-jobYyyymmTo"
									uitype="popup"
									date-format="yyyymm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-jobYyyymmTo)"
								></sbux-datepicker>
							</td>
                        </tr>
                        <tr>

                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="7" class="td_input" style="border-right:hidden;">
									<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm"></sbux-input>
                            </td>

                        </tr>
                    </tbody>
                </table>


				<div class="row">
					<div class="col-sm-3">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>신고리스트</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdDclrList" style="height:498px;width:100%"></div>
					</div>






					<div class="col-sm-9" style="height:100%">

								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li>
											<span>파일생성정보</span>
										</li>
									</ul>
								</div>
								<table class="table table-bordered tbl_fixed">
								<caption>검색 조건 설정</caption>
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
										<th scope="row" class="th_bg">홈택스ID</th>
										<td colspan="2" class="td_input" style="border-right: hidden;">
											<sbux-input uitype="text" id="srch-inp-homeTaxId" name="srch-inp-homeTaxId" class="form-control input-sm"></sbux-input>
										</td>
										<td style="border-right: hidden;"></td>
										<th scope="row" class="th_bg">제출일</th>
										<td colspan="2" class="td_input" style="border-right: hidden;">
											<sbux-datepicker
												id="srch-inp-submitDate"
												name="srch-inp-submitDate"
												uitype="popup"
												date-format="yyyy-mm-dd"
												class="form-control input-sm input-sm-ast inpt_data_reqed"
												onchange="fn_dtpChange(srch-inp-submitDate)"
											></sbux-datepicker>
										</td>
										<td style="border-right: hidden;"></td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">담당자 부서</th>
										<td colspan="2" class="td_input" style="border-right: hidden;">
											<sbux-input uitype="text" id="srch-inp-deptName" name="srch-inp-deptName" class="form-control input-sm"></sbux-input>
										</td>
										<td style="border-right: hidden;"></td>
										<th scope="row" class="th_bg">담당자 성명</th>
										<td colspan="2" class="td_input" style="border-right: hidden;">
											<sbux-input uitype="text" id="srch-inp-empName" name="srch-inp-empName" class="form-control input-sm"></sbux-input>
										</td>
										<td style="border-right: hidden;"></td>
										<th scope="row" class="th_bg">담당자 전화번호</th>
										<td colspan="2" class="td_input" style="border-right: hidden;">
											<sbux-input uitype="text" id="srch-inp-tel" name="srch-inp-tel" class="form-control input-sm"></sbux-input>
										</td>
										<td style="border-right: hidden;"></td>
									</tr>

									<tr>
										<th scope="row" class="th_bg">비고</th>
			                            <td colspan="9" style="border-right:hidden;">
											<sbux-input uitype="text" id="srch-inp-memomemo" name="srch-inp-memomemo" class="form-control input-sm" ></sbux-textarea>
			                            </td>
									</tr>
									  <tr>
			                        	<th scope="row" class="th_bg">파일생성경로</th>
			                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-filePath" name="srch-inp-filePath" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_fileCrtPathPopup" wrap-style="width:100%"></sbux-input>
			                            </td>
			                        </tr>

								</tbody>
								</table>




								<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
								</sbux-tabs>
								<div id="simpleTab">
									<div id="sb-area-grdSimpleGiveSpcfct" style="height:298px;width:100%"></div>
								</div>
								<div id="lbrTab">
									<div id="sb-area-grdEricmGiveSpcfct" style="height:298px;width:100%"></div>
								</div>


						</div>
					</div>
				</div>
				</div>



    </section>

	<!-- 팝업 Modal -->


</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">


	var gv_ma_selectedApcCd	= '${loginVO.apcCd}';
	var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId = '${loginVO.id}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역
	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "간이지급명세서", "targetid" : "simpleTab", "targetvalue" : "간이지급명세서" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "근로소득지급명세서", "targetid" : "lbrTab", "targetvalue" : "근로소득지급명세서" }
	];

	// 신규
	function cfn_add() {

	}

	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?

		}
    }


	// 마스터 그리드 삭제
	function cfn_del() {

	}

	// 조회
	function cfn_search() {
		fn_queryClick();
	}



	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-compCode'], jsonCorp, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 급여영역
            gfnma_setComSelect(['srch-slt-payAreaType'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);

		//SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateFirstYmd(new Date()));
		//SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateLastYmd(new Date()));
		//fnQRY_P_HRA8400_Q("INFO");
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();
    	fn_createGrid2();
    	fn_createGrid3();
    	//fn_search();

		//재직상태
		//gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
		//	function(list){
		//		$('#SRCH_EMP_BTN').click(function(){
		//			fn_compopup1(list);
		//		});
		//	}
		//)
    });

    //grid 초기화
    var grdDclrList;
    var jsonDclrList = [];

    var grdSimpleGiveSpcfct; 			// 그리드를 담기위한 객체 선언
    var jsonSimpleGiveSpcfct = []; 	// 그리드의 참조 데이터 주소 선언

    var grdEricmGiveSpcfct;
    var jsonEricmGiveSpcfct= [];



    //json
    var jsonCorp = []; //법인
    var jsonBizUnit = []; //사업단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준
	var jsonPayAreaType = []; //급여영역

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDclrList';
	    SBGridProperties.id 				= 'grdDclrList';
	    SBGridProperties.jsonref 			= 'jsonDclrList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: ["귀속연월"], ref: 'blnMm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["지급연월"], ref: 'giveMm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["제출연월"], ref: 'sbmsnMm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["일반직 확정"], ref: 'sbmsnMm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["기술직 확정"], ref: 'sbmsnMm', 				type:'output',		width:'80px',		style:'text-align:center'}

        ];

        grdDclrList = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }

    function fn_createGrid2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdSimpleGiveSpcfct';
	    SBGridProperties.id 				= 'grdSimpleGiveSpcfct';
	    SBGridProperties.jsonref 			= 'jsonSimpleGiveSpcfct';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: ["귀속년도"], ref: 'jobYyyy', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["근무시기"], ref: 'halfyearlyType', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["급여영역"], ref: 'payAreaType', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["근무지"], ref: 'taxSiteName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사번"], ref: 'empCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사원명"], ref: 'empName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민등록번호"], ref: 'socialNumReal', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["부서"], ref: 'deptName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["전화번호"], ref: 'telno', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["내/외국인"], ref: 'ctznFrgnr', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["거주지국코드"], ref: 'resdncNtnCd', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["원천신고대상"], ref: 'payTotAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사업소세과세대상"], ref: 'payTotAmt2', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사업소세비과세"], ref: 'taxFreeAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["급여지급액(세전)"], ref: 'payTotAmt3', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)인건비"], ref: 'payTotAmt4', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)인정상여"], ref: 'payTotAmt5', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)연차수당 "], ref: 'payTotAmt6', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)학자금 "], ref: 'payTotAmt7', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)휴일교통비"], ref: 'payTotAmt8', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)자가운전보조비"], ref: 'payTotAmt9', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)보육수당"], ref: 'payTotAmt10', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)야간근로수당"], ref: 'payTotAmt11', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)자가운전보조비"], ref: 'payTotAmt12', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)식대"], ref: 'payTotAmt13', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 징수액"], ref: 'whIncomeTax1', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 환급액"], ref: 'whIncomeTax2', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 조정액"], ref: 'whIncomeTax3', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 납부액"], ref: 'whIncomeTax4', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 징수액"], ref: 'whLocalTax1', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 환급액"], ref: 'whLocalTax2', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 조정액"], ref: 'whLocalTax3', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 납부액"], ref: 'whLocalTax4', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["총납부액"], ref: 'totTax', 				type:'output',		width:'80px',		style:'text-align:center'},

        ];

        grdSimpleGiveSpcfct = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }

    function fn_createGrid3() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdEricmGiveSpcfct';
	    SBGridProperties.id 				= 'grdEricmGiveSpcfct';
	    SBGridProperties.jsonref 			= 'jsonEricmGiveSpcfct';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: ["귀속월"], ref: 'jobYyyymm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["지급월"], ref: 'payYyyymm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["신고월"], ref: 'submitYyyymm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["근무지"], ref: 'workRegionName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사번"], ref: 'empCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사원명"], ref: 'empName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민등록번호"], ref: 'socialNumReal', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["부서"], ref: 'deptName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득구분코드"], ref: 'gubunCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득구분명"], ref: 'gubunName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사유코드"], ref: 'reasonCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사유명"], ref: 'reasonName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["전표번호"], ref: 'docName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["전표적요"], ref: 'docDesc', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["생년월일"], ref: 'socialNumDate', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["지급일"], ref: 'payDate', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["원천신고대상"], ref: 'payTotAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사업소세과세대상"], ref: 'payTotAmt2', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사업소세비과세"], ref: 'taxFreeAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["급여지급액(세전)"], ref: 'payTotAmt3', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)인건비"], ref: 'payTotAmt4', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)인정상여"], ref: 'payTotAmt5', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)연차수당 "], ref: 'payTotAmt6', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)학자금 "], ref: 'payTotAmt7', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)휴일교통비"], ref: 'payTotAmt8', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(과)자가운전보조비"], ref: 'payTotAmt9', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)보육수당"], ref: 'payTotAmt10', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)야간근로수당"], ref: 'payTotAmt11', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)자가운전보조비"], ref: 'payTotAmt12', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["(비)식대"], ref: 'payTotAmt13', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 징수액"], ref: 'whIncomeTax1', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 환급액"], ref: 'whIncomeTax2', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 조정액"], ref: 'whIncomeTax3', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득세 납부액"], ref: 'whIncomeTax4', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 징수액"], ref: 'whLocalTax1', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 환급액"], ref: 'whLocalTax2', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 조정액"], ref: 'whLocalTax3', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["주민세 납부액"], ref: 'whLocalTax4', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["총납부액"], ref: 'totTax', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["번호"], ref: 'txnId', 				type:'output',		width:'80px',		style:'text-align:center'},

        ];

        grdEricmGiveSpcfct = _SBGrid.create(SBGridProperties);
    }

    const fn_queryClick = function(){
        //InitControls(grdList);
        //InitControls(grdDetail);

        //let iBefore = gvwList.FocusedRowHandle;

        fnQRY_P_HRA8400_Q("LIST");


        //if (iBefore == 0 && gvwList.FocusedRowHandle == 0)
        //    FocusedRowChanged();

        //if (gvwList.RowCount < 1)
        //    NewClick();
    }




    /**
     * 목록 가져오기
     */
    const fnQRY_P_HRA8400_Q = async function(workType) {

		let dclrRow = grdDclrList.getRowData(grdDclrList.getRow());

	    var paramObj = {
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_EMP_CODE       : ''
			,V_P_JOB_YYYYMM_FR  : ''
			,V_P_JOB_YYYYMM_TO  : ''
			,V_P_SUBMIT_YYYYMM  : workType == "DETAIL" ? dclrRow.submitYyyymm : ""
			,V_P_JOB_YYYYMM     : workType == "DETAIL" ? dclrRow.jobYyyymm : ""
			,V_P_PAY_YYYYMM     : workType == "DETAIL" ? dclrRow.payYyyymm : ""
			,V_P_PAY_AREA_TYPE  : ''
			,V_P_JOB_YYYY        : ''
			,V_P_HALFYEARLY_TYPE : ''
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: ''
	    };

        const postJsonPromise = gfn_postJSON("/hr/hra/selectHra8400Q.do", {
        	getType				: 'json',
        	workType			: workType,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  				jsonDclrList.length = 0;
  				// 파일생성 정보 바인딩
  				if(workType === "INFO"){
  				 	let fileCreate = data.cv_1;

  				}else if(workType === "LIST"){
  					data.cv_2.forEach((item, index) => {
	        			   msg = {

		  	  					}
	        			   jsonSimpleGiveSpcfct.push(msg);
	        		   })

	        		   grdSimpleGiveSpcfct.rebuild();
  				}else if(workType === "DETAIL"){
  					data.cv_2.forEach((item, index) => {
	        			   msg = {

		  	  					}
	        			   jsonEricmGiveSpcfct.push(msg);
	        		   })

	        		   grdEricmGiveSpcfct.rebuild();

  				}


        	} else {
          		alert(data.resultMessage);
        	}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fnSET_P_HRA8400_S = async function(){
    	let ericmGiveSpcfctData = grdEricmGiveSpcfct.getGridDataAll();
    	ericmGiveSpcfctData.forEach(row => {
    		var paramObj = {
         			V_P_DEBUG_MODE_YN	: ''
         			,V_P_LANG_ID		: ''
         			,V_P_COMP_CODE		: gv_ma_selectedApcCd
         			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

         			,V_P_FORM_ID		: p_formId
         			,V_P_MENU_ID		: p_menuId
         			,V_P_PROC_ID		: ''
         			,V_P_USERID			: ''
         			,V_P_PC				: ''
         	    };
    	})
    	// txn_id는 감가상각리스트에서 우클릭 후 컬럼설정창에서 id  컬럼 누르면 조회된다

         const postJsonPromise = gfn_postJSON("/hr/hra/insertHra8400.do", {
          	getType				: 'json',
          	workType			:  strWorkType,
          	cv_count			: '0',
          	params				: gfnma_objectToString(paramObj)
  			});

       	const data = await postJsonPromise;
       	console.log('data:', data);
         // 비즈니스 로직 정보
          try {
	          if (_.isEqual("S", data.resultStatus)) {

	          } else {
	              alert(data.resultMessage);
	          }

	        } catch (e) {
	            if (!(e instanceof Error)) {
	                e = new Error(e);
	            }
	            console.error("failed", e.message);
	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
    }

	const fn_compopup1 = function(list) {

		var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_TXTEMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";

     	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_HRI001'
           	,popupType				: 'A'
     		,whereClause			: strWhereClause
   			,searchCaptions			: ["부서",		"사원", 		"재직상태"]
   			,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
   			,searchInputValues		: ["", 			searchText,		""]
   			,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 			"",				list]				//select 경우
     		,height					: '400px'
   			,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
   			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
   			,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
 			,itemSelectEvent		: function (data){
 				console.log('callback data:', data);
 				SBUxMethod.set('SRCH_TXTEMP_NAME', data.EMP_NAME);
 				SBUxMethod.set('SRCH_TXTEMP_CODE', data.EMP_CODE);
 			},
     	});
   	}

    //선택 삭제
    function fn_delete() {

        //fn_subDelete(gfn_comConfirm("Q0001", "삭제"), list);
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){

    }

    const fn_dtpChange = async function(){
    	let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
    	let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");

    	/* if(inptYmdFrom > inptYmdTo){
    		gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    		return;
    	} */
     }






</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>