
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 영농관리 -->
				</div>
				<div style="margin-left: auto;">
                    <sbux-button
						id="btnDdln"
						name="btnDdln"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_ddln"
						text="마감설정"
					></sbux-button>
                    <sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
					></sbux-button>
                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
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
							<th class="ta_r th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
    								autocomplete-height="270px"
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
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th class="ta_r th_bg">연도</th>
							<td colspan="3"  class="td_input">
								<sbux-datepicker
									id="srch-dtp-yr"
									name="srch-dtp-yr"
									uitype="popup"
									datepicker-mode="year"
									onchange="fn_yrChange(srch-dtp-yr)"
									class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
								></sbux-datepicker>
							</td>
							<th scope="row" class="th_bg" >확인일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-cfmtnYmdFrom"
									name="srch-dtp-cfmtnYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wghYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-cfmtnYmdTo"
									name="srch-dtp-cfmtnYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-cfmtnYmdTo)"
								></sbux-datepicker>
							</td>
							<td>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">
					<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal" is-scrollable="false" jsondata-ref="tabJsonData">
					</sbux-tabs>
					<div class="tab-content">
						<div id="cltvtnHstryTab" >
							<div id="sb-area-cltvtnHstry" style="height:500px;"></div>
						</div>
						<div id="frmhsQltTab" >
							<div id="sb-area-cltvtnFrmhsQlt" style="height:500px;"></div>
						</div>
						<div id="frmhsExpctWrhsTab" >
							<div id="sb-area-frmhsExpctWrhs" style="height:500px;"></div>
						</div>
						<div id="landInfoTab" >
							<div id="sb-area-landInfo" style="height:500px;"></div>
							<div class="exp-div-excel" style="display: none;width: 1000px;">
								<div id="sbexp-area-grdExpLandInfo" style="height:1px; width: 100%;"></div>
								<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
								<input type="file" id="btnFileUploadLandInfo" name="btnFileUploadLandInfo" style="visibility: hidden;" onchange="importExcelDataLandInfo(event)" />
								<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
							</div>
						</div>
						<div id="frmerInfoTab" >
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>농가 기본정보</span>
									</li>
								</ul>
							</div>
							<div>
								<table class="table table-bordered tbl_fixed">
									<caption>일반현황</caption>
									<colgroup>
										<col style="width:8%">
										<col style="width:6%">
										<col style="width:6%">
										<col style="width:8%">
										<col style="width:6%">
										<col style="width:6%">
										<col style="width:8%">
										<col style="width:6%">
										<col style="width:6%">
									</colgroup>
									<tbody>
										<tr>
											<th class="ta_r th_bg">농가명</th>
											<td class="td_input" style="border-right: hidden;">
												<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
												<sbux-input
													uitype="text"
													id="dtl-inp-prdcrNm"
													name="dtl-inp-prdcrNm"
													class="form-control input-sm"
													placeholder="초성검색 가능"
													autocomplete-ref="jsonPrdcrAutocompleteDtl"
													autocomplete-text="name"
				    								oninput="fn_onInputPrdcrNmDtl(event)"
				    								autocomplete-select-callback="fn_onSelectPrdcrNmDtl"
				    								autocomplete-height="270px"
				   								></sbux-input>
											</td>
											<td class="td_input" style="border-right: hidden;">
												<sbux-button
													id="btnDtlPrdcr"
													name="btnDtlPrdcr"
													class="btn btn-xs btn-outline-dark"
													text="찾기"
													uitype="modal"
													target-id="modal-prdcr"
													onclick="fn_choicePrdcrDtl"
												></sbux-button>
											</td>
											<th scope="row" class="th_bg" >농가번호</th>
											<td colspan="2">
												<sbux-input id="dtl-inp-frmerno" name="dtl-inp-frmerno" class="form-control input-sm" uitype="text" readonly></sbux-input>
												<sbux-input id="dtl-inp-prdcrLinkCd" name="dtl-inp-prdcrLinkCd" class="form-control input-sm" uitype="hidden"></sbux-input>
											</td>
											<th colspan="1" scope="row" class="th_bg" >연락처</th>
											<td colspan="2">
												<sbux-input
													id="dtl-inp-frmhsTelno"
													name="dtl-inp-frmhsTelno"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'mask': '999-9999-9999', 'clearIncomplete': true, 'autoUnmask': true }"
												></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg" >지역</th>
											<td colspan="2">
												<sbux-input
													uitype="text"
													id="dtl-inp-frmhsCtpv"
													name="dtl-inp-frmhsCtpv"
													class="form-control input-sm"
				   								></sbux-input>
											</td>
											<th scope="row" class="th_bg" >상세주소</th>
											<td colspan="2">
												<sbux-input id="dtl-inp-frmhsAddr" name="dtl-inp-frmhsAddr" class="form-control input-sm" uitype="text" ></sbux-input>
											</td>
											<th scope="row" class="th_bg" >계약면적(평)/(m2)</th>
											<td>
												<sbux-input
													id="dtl-inp-crtrPrcl"
													name="dtl-inp-crtrPrcl"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
											<td>
												<sbux-input
													id="dtl-inp-crtrPrclSquareFootage"
													name="dtl-inp-crtrPrclSquareFootage"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg" >정식면적(평)/(m2)</th>
											<td>
												<sbux-input
													id="dtl-inp-plntngPrcl"
													name="dtl-inp-plntngPrcl"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
											<td>
												<sbux-input
													id="dtl-inp-plntngPrclSquareFootage"
													name="dtl-inp-plntngPrclSquareFootage"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
											<th scope="row" class="th_bg" >농지면적(계약)/(정식)</th>
											<td>
												<sbux-input
													id="dtl-inp-landCrtrArea"
													name="dtl-inp-landCrtrArea"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
											<td>
												<sbux-input
													id="dtl-inp-landPlntngArea"
													name="dtl-inp-landPlntngArea"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
											<th scope="row" class="th_bg" >수매량(망)/금액(원)</th>
											<td>
												<sbux-input
													id="dtl-inp-prchsQntt"
													name="dtl-inp-prchsQntt"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
													readonly
												></sbux-input>
											</td>
											<td>
												<sbux-input
													id="dtl-inp-prchsAmt"
													name="dtl-inp-prchsAmt"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>재배 기본정보</span>
									</li>
								</ul>
							</div>
							<div id="sb-area-cltvtnFrmhsQltPrdcr" style="height:90px;"></div>
							<div class="row">
								<div class="col-sm-6">
									<div class="ad_tbl_top"  style="width: 98%;">
										<ul class="ad_tbl_count">
											<li>
												<span>농지정보</span>
												<span style="font-size:12px">(조회건수 <span id="cnt-prdcrLandInfo">0</span>건)</span>
											</li>
										</ul>
									</div>
									<div>
										<div id="sb-area-prdcrLandInfo" style="height:208px;"></div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="ad_tbl_top"  style="width: 98%;">
										<ul class="ad_tbl_count">
											<li>
												<span>재배 이력</span>
												<span style="font-size:12px">(조회건수 <span id="cnt-cltvtnHstryPrdcr">0</span>건)</span>
											</li>
										</ul>
									</div>
									<div>
										<div id="sb-area-cltvtnHstryPrdcr" style="height:208px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<div>
		<sbux-modal
			id="modal-framldMap"
			name="modal-framldMap"
			uitype="middle"
			header-title="팜맵 데이터"
			body-html-id="body-modal-framldMap"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1100px"
		></sbux-modal>
	</div>
	<!-- 팜맵 팝업 Modal -->
	<div id="body-modal-framldMap">
		<jsp:include page="../popup/framldMapPopup.jsp"/>
	</div>
	<div>
		<sbux-modal
			id="modal-image"
			name="modal-image"
			uitype="middle"
			header-title="사진"
			body-html-id="body-modal-image"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:620px"
		></sbux-modal>
	</div>
	<div id="body-modal-image">
    	<jsp:include page="../../am/popup/imagePopup.jsp"></jsp:include>
    </div>
    <!-- 마감 설정 Modal -->
    <div>
        <sbux-modal
        	id="modal-ddln"
        	name="modal-ddln"
        	uitype="middle"
        	header-title="마감 설정"
        	body-html-id="body-modal-ddln"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:640px"
       	></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/frmhsExpctWrhsDdlnPopup.jsp"></jsp:include>
    </div>

    <!-- 법정동 선택 Modal -->
    <div>
        <sbux-modal
            id="modal-stdgCd"
            name="modal-stdgCd"
            uitype="middle"
            header-title="법정동코드 조회"
            body-html-id="body-modal-stdgCd"
            footer-is-close-button="false"
            header-is-close-button="false"
            style="width: 900px;"
        ></sbux-modal>
    </div>
    <div id="body-modal-stdgCd">
        <jsp:include page="../../am/popup/stdgCdPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">


	var jsonPrdcr					= [];
	var jsonPrdcrDtl				= [];
	var jsonPrdcrAutocomplete 		= [];
	var jsonPrdcrAutocompleteDtl 	= [];
	var jsonApcItem					= [];
	var jsonCtpv					= [];
	var jsonGrdPrdcr				= [];
	var jsonGrdSdngStts				= [];
	var jsonGrdPlntngStts			= [];
	var jsonGrdMeshSe				= [];
	var jsonGrdHdofcExtrnlSe		= [];
	var jsonGrdExtrnlWarehouseSe	= [];
	var jsonGrdLastStrgSe			= [];
	var jsonGrdPrchsCmptnYn			= [];
	var jsonComYn 					= [];
	var jsonQltEvl					= [
		{value:"A", text:"A", label:"A"},
		{value:"B", text:"B", label:"B"},
		{value:"C", text:"C", label:"C"},
	];
	let choicePrdcrLandInfoNo = "";
	var excelYn = "N";
    var btnClick = "N";

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();

	})

	const fn_init = async function() {

    	fn_getPrdcrs();
    	fn_createCltvtnHstry();
    	fn_createCltvtnFrmhsQltPrdcr();
    	fn_createPrdcrLandInfo();
    	fn_createLandInfo();
    	fn_createCltvtnHstryPrdcr();
    	fn_createCltvtnFrmhsQlt();
    	fn_frmhsExpctWrhs();

		let rst = await Promise.all([
			gfn_setPrdcrSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdPrdcr, 				gv_selectedApcCd),		// Grid 생산자
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdSdngStts,  			'SDNG_STTS_CD'),		// 파종상태
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdPlntngStts, 			'PLNTNG_STTS_CD'),		// 정식상태
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdMeshSe, 				'MESH_SE_CD'),			// 망사구분
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdHdofcExtrnlSe, 		'HDOFC_EXTRNL_SE_CD'),	// 본사/외부구분코드
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdExtrnlWarehouseSe, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 외부창고코드
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdLastStrgSe, 			'LAST_STRG_SE_CD'),		// 최종저장구분
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdPrchsCmptnYn, 		'CLCTM_YN'),			// 수매완료여부
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonComYn, 					'GBN_YN'),				// YN
    	])

    	grdFrmhsExpctWrhs.refresh({"combo":true})

		SBUxMethod.set("srch-dtp-yr", gfn_dateToYear(new Date()));
	}

	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "재배농가품질", 	"targetid" : "frmhsQltTab", 		"targetvalue" : "재배농가품질" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "농가예상입고", 	"targetid" : "frmhsExpctWrhsTab", 	"targetvalue" : "농가예상입고" },
		{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "재배및수확후관리", "targetid" : "cltvtnHstryTab", 		"targetvalue" : "재배및수확후관리" },
		{ "id" : "3", "pid" : "-1", "order" : "4", "text" : "영농일지", 		"targetid" : "frmerInfoTab", 		"targetvalue" : "영농일지" },
		{ "id" : "4", "pid" : "-1", "order" : "5", "text" : "농지정보", 		"targetid" : "landInfoTab", 		"targetvalue" : "농지정보" },
	];

	var grdCltvtnFrmhsQltPrdcr;
	var grdCltvtnHstry;
	var grdCltvtnHstryPrdcr;
	var grdPrdcrLandInfo;
	var grdLandInfo;
	var grdCltvtnFrmhsQlt;
	var grdFrmhsExpctWrhs;
	var jsonCltvtnFrmhsQltPrdcr = [];
	var jsonCltvtnHstryPrdcr 	= [];
	var jsonCltvtnHstry 		= [];
	var jsonPrdcrLandInfo 		= [];
	var jsonLandInfo 			= [];
	var jsonCltvtnFrmhsQlt 		= [];
	var jsonFrmhsExpctWrhs 		= [];

	const fn_createCltvtnHstry = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnHstry";
	    SBGridProperties.id = "grdCltvtnHstry";
	    SBGridProperties.jsonref = "jsonCltvtnHstry";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
		SBGridProperties.contextmenu = true;						// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListCltvtnHstry;	// 우클릭 메뉴 리스트
	    SBGridProperties.columns = [
		    {caption : ['확인일자'], 		ref: 'cfmtnYmd', 	type : 'output', 	width: '100px', style:'text-align:center;',
			    format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption : ['농가'], 			ref: 'prdcrNm', 	type: 'output', 		width: '120px', style: 'text-align:center;'},
			{caption : ['지역'], 			ref: 'frmhsCtpv', 	type: 'output', 		width: '80px', style: 'text-align:center;'},
			{caption : ['위치'], 			ref: 'frlnAddr', 	type: 'output', 		width: '200px', style: 'text-align:left;'},
			{caption : ['계약(평)'], 		ref: 'crtrArea', 	type: 'output', 		width: '80px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
			{caption : ['정식(평)'], 		ref: 'plntngArea', 	type: 'output', 		width: '80px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
			{caption : ['사진'], 	ref: 'atchflNo',	type: 'button', 	width: '60px', style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if (strValue== null || strValue == "") {
			        return "";
	        	} else {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_imagePop("+ nRow +")'>사진</button>";
	        	}
        	}},
        	{caption : ['담당자'], 			ref: 'pic', 		type: 'output', 		width: '100px', style: 'text-align:center;'},
        	{caption : ['표시구분'], 		ref: 'rmrk', 		type: 'output', 		width: '200px', style: 'text-align:left;'},
        	{caption : ['수확 후 관리'], 	ref: 'cn', 			type: 'output', 		width: '400px', style: 'text-align:left;'},

	    ];
	    grdCltvtnHstry = _SBGrid.create(SBGridProperties);
	    grdCltvtnHstry.bind('click', 'fn_setFrmerInfo');
	}

	/**
	 * @description 메뉴트리그리드 컨텍스트메뉴 json 재배및수확후관리
	 * @type {object}
	 */
	const objMenuListCltvtnHstry = {
		"excelDwnld": {
			"name": "엑셀 다운로드",					//컨텍스트메뉴에 표시될 이름
			"accesskey": "e",						//단축키
			"callback": fn_excelDwnldCltvtnHstry,	//콜백함수명
		},
	};

	// 엑셀 다운로드 (재배및수확후관리)
	function fn_excelDwnldCltvtnHstry() {

		if (gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?\n (확인 클릭 시 xlsx, 취소 클릭 시 xls)")) {
			grdCltvtnHstry.exportData("xlsx","재배및수확후관리",true, {arrRemoveCols: [6]});
		} else {
			grdCltvtnHstry.exportLocalExcel("재배및수확후관리", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
		}
	}

	const fn_createCltvtnFrmhsQltPrdcr = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnFrmhsQltPrdcr";
	    SBGridProperties.id = "grdCltvtnFrmhsQltPrdcr";
	    SBGridProperties.jsonref = "jsonCltvtnFrmhsQltPrdcr";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    /*SBGridProperties.columns = [
		    {caption : ['품종(캔)', 	"뉴마르스"], 	ref: 'sdQntt1', 	type: 'input', 	width: '100px', style:'text-align: right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"카타마루"], 	ref: 'sdQntt2', 	type: 'input', 	width: '100px', style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"홈스타"], 		ref: 'sdQntt3', 	type: 'input', 	width: '100px', style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"페가수스"], 	ref: 'sdQntt4', 	type: 'input', 	width: '100px', style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"찬스볼"], 		ref: 'sdQntt5', 	type: 'input', 	width: '100px', style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['밑비료', 		"밑비료"], 		ref: 'cmpt', 		type: 'input', 	width: '100px', style: 'text-align:center; background:#FFF8DC;',hidden:true},
		    {caption : ['파종일자', 	"파종일자"], 	ref: 'sdngYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
		    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
		    {caption : ['정식일자', 	"정식일자"], 	ref: 'clclnYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
			    format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
		    {caption : ['추비일자', 	"1차"], 		ref: 'cmptYmdCycl1', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
		    {caption : ['추비일자', 	"2차"], 		ref: 'cmptYmdCycl2', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
		    {caption : ['저장결과<br>(부패율)', "저장결과<br>(부패율)"], 	ref: 'strgRslt', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###.###'}},
        	{caption : ['비고', '비고'], 			ref: 'rmrk', 			type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;'},
	    ];*/

		const col = [];
		fn_getApcSeedList().then( result => {
				result.forEach((item, index) => {
					col.push(item);
				});

				col.push(
						{caption : ['밑비료', 		"밑비료"], 		ref: 'cmpt', 		type: 'input', 	width: '100px', style: 'text-align:center; background:#FFF8DC;',hidden:true},
						{caption : ['파종일자', 	"파종일자"], 	ref: 'sdngYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
							format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
						{caption : ['정식일자', 	"정식일자"], 	ref: 'clclnYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
							format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
						{caption : ['추비일자', 	"1차"], 		ref: 'cmptYmdCycl1', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
							format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
						{caption : ['추비일자', 	"2차"], 		ref: 'cmptYmdCycl2', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
							format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true},hidden:true},
						{caption : ['저장결과<br>(부패율)', "저장결과<br>(부패율)"], 	ref: 'strgRslt', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
							typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###.###'}},
						{caption : ['비고', '비고'], 			ref: 'rmrk', 			type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;'},
				);

				SBGridProperties.columns = col;

				grdCltvtnFrmhsQltPrdcr = _SBGrid.create(SBGridProperties);
			}
		)
		.catch( e => {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		})
	}

	/**
	 * @name fn_createPrdcrLandInfo
	 * @description 영농일지 - 농지정보 grid
	 */
	const fn_createPrdcrLandInfo = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-prdcrLandInfo";
	    SBGridProperties.id = "grdPrdcrLandInfo";
	    SBGridProperties.jsonref = "jsonPrdcrLandInfo";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = false;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [

	    	{caption : ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if (gfn_isEmpty(strValue)) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procPrdcrLandInfo(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	} else {
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procPrdcrLandInfo(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	    	{caption : ['위치'], 		ref: 'frlnAddr', 	type: 'input', 	width: '220px', style: 'text-align:left; background:#FFF8DC;', typeinfo : {maxlength : 70, oneclickedit : false}},
	    	/*{caption : ["이력"], 		ref: 'prdcrLandInfoNo',  type:'button',  width:'55px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_setCltvtnHstryPrdcr(" + nRow + ")'>상세</button>";
	        	}
		    }},*/
	    	{caption : ['계약(평)'], 	ref: 'crtrArea', 	type: 'input', 	width: '70px', style: 'text-align: right',
                typeinfo : {mask : {alias : 'numeric'},  oneclickedit : false}, format : {type:'number', rule:'#,###'}, maxlength : 6},
	    	{caption : ['정식(평)'], 	ref: 'plntngArea', 	type: 'input', 	width: '70px', style: 'text-align: right',
                typeinfo : {mask : {alias : 'numeric'},  oneclickedit : false}, format : {type:'number', rule:'#,###'}, maxlength : 6},
	    	{caption : ['법정동'], 		ref: 'stdgCd', 		type: 'inputbutton', 	width: '120px', style: 'text-align:center',
                typeinfo : {callback: fn_modalStdgCd}},
	    	{caption : ['본번'], 		ref: 'frlnMno', 	type: 'input', 	width: '80px', style: 'text-align:center', typeinfo : {maxlength : 4, mask : {alias : 'numeric'}}},
	    	{caption : ['부번'], 		ref: 'frlnSno', 	type: 'input', 	width: '80px', style: 'text-align:center', typeinfo : {maxlength : 4, mask : {alias : 'numeric'}}},
        	{caption : ['지도'], 		ref: 'map', 		type: 'button', 	width: '55px', style: 'text-align:center',
        		typeinfo : {buttonvalue: '보기', buttonclass:'btn btn-xs btn-outline-danger'}},
	    ];
	    grdPrdcrLandInfo = _SBGrid.create(SBGridProperties);
        grdPrdcrLandInfo.bind('click', 'fn_setFrlnInput');
        grdPrdcrLandInfo.bind('rowchanged', 'fn_setCltvtnHstryPrdcr');
	}


	/**
	 * @name fn_createCltvtnHstryPrdcr
	 * @description 영농일지 - 재배이력grid
	 */
	const fn_createCltvtnHstryPrdcr = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnHstryPrdcr";
	    SBGridProperties.id = "grdCltvtnHstryPrdcr";
	    SBGridProperties.jsonref = "jsonCltvtnHstryPrdcr";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [

	    	{caption : ['처리', '처리'], 	ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowHstry(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowHstry(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption : ['확인일자', 	"확인일자"], 	ref: 'cfmtnYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
			    format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['밑비료일자', 	"밑비료일자"], 	ref: 'baseFrtlzrYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['파종일자', 	"파종일자"], 	ref: 'sdngYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['정식일자', 	"정식일자"], 	ref: 'plntngYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['추비일자', 	"1차"], 	ref: 'cmptYmdCycl1', 		type : 'datepicker', 	width: '100px', style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['추비일자', 	"2차"], 	ref: 'cmptYmdCycl2', 		type : 'datepicker', 	width: '100px', style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
        	{caption : ['내용', '내용'], 	ref: 'cn', 			type: 'input', 		width: '250px', style: 'text-align:left;', typeinfo : {maxlength : 300}},
        	{caption : ['표시구분', '표시구분'], 		ref: 'rmrk', 		type: 'input', 		width: '200px', style: 'text-align:left;', typeinfo : {maxlength : 300}},
        	{caption : ['사진', '보기'], 	ref: 'atchflNo',	type: 'button', 	width: '60px', style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if (strValue== null || strValue == "") {
			        return "";
	        	} else {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_imagePop("+ nRow +")'>사진</button>";
	        	}
        	}},
        	{caption : ['사진', '첨부'], ref: 'inputFlag',	type: 'button', 	width: '60px', style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
        		let rowData = grdCltvtnHstryPrdcr.getRowData(nRow);
        		let atchflNo = rowData.atchflNo;
        		let inputFlag = rowData.inputFlag
        		if (!gfn_isEmpty(atchflNo)) {
        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delFile("+ nRow +")'>삭제</button>";
        		}
        		if (inputFlag) {
        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_fileUpload("+ nRow +")'>등록</button>"
	        		+ "<input type='file' id='inp-file-" + nRow + "' style='display:none' onchange='fn_fileSelect(event)' accept='.jpg, .jpeg, .png'></input>";
        		} else {
        			"";
        		}
        	}},
        	{caption : ['사진', '명'], 		ref: 'atchflOrgnNm', 	type: 'output', width: '100px', style: 'text-align:left'},
        	{caption : ['쓰기여부'], 		ref: 'inputFlag', 		type: 'input', 	width: '0px', hidden : true},
        	{caption : ['사진', '명'], 		ref: 'fileName', 		type: 'output', width: '0px', hiiden : true},
	    ];
	    grdCltvtnHstryPrdcr = _SBGrid.create(SBGridProperties);
	}

	const fn_createCltvtnFrmhsQlt = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnFrmhsQlt";
	    SBGridProperties.id = "grdCltvtnFrmhsQlt";
	    SBGridProperties.jsonref = "jsonCltvtnFrmhsQlt";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.frozencols = 4;
	    SBGridProperties.contextmenu = true;					// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListFrmhsQlt;	// 우클릭 메뉴 리스트
	    SBGridProperties.columns = [

		    {caption : ['농가명', 	'농가명'], 		ref: 'prdcrNm', 	type: 'output', 	width: '120px', style: 'text-align:center'},
		    {caption : ['지역', 	'지역'], 		ref: 'frmhsCtpv', 	type: 'output', 	width: '80px', 	style: 'text-align:center'},
		    {caption : ['상세주소', '상세주소'], 	ref: 'frmhsAddr', 	type: 'output', 	width: '300px', style: 'text-align:rigth'},
		    {caption : ['연락처', 	'연락처'], 		ref: 'frmhsTelno', 	type: 'output', 	width: '100px', style: 'text-align:center',
		    	format : {type:'string', rule:'000-0000-0000'}},
		   /* {caption : ['품종(캔)', '뉴마르스'], 	ref: 'sdQntt1', 	type: 'input', 		width: '80px', 	style:'text-align: right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '카타마루'], 	ref: 'sdQntt2', 	type: 'input', 		width: '80px',  style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '홈스타'], 		ref: 'sdQntt3', 	type: 'input', 		width: '80px',  style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '페가수스'], 	ref: 'sdQntt4', 	type: 'input', 		width: '80px',  style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '찬스볼'], 		ref: 'sdQntt5', 	type: 'input', 		width: '80px',  style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['필지(평)', '계약'], 		ref: 'crtrPrcl', 	type: 'output', 	width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['필지(평)', '정식'], 		ref: 'plntngPrcl', 	type: 'output', 	width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['수매', '양(망)'], 			ref: 'prchsQntt', 	type: 'input', 		width: '100px', style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['수매', '금액'], 			ref: 'prchsAmt', 	type: 'input', 		width: '100px', style:'text-align: right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['파종', 	'일자'], 		ref: 'sdngYmd', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
		    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['파종', 	'상태'], 		ref: 'sdngSttsCd', 	type: 'combo', 	width: '100px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonGrdSdngStts', 	label:'label', value:'value', itemcount: 10}},
		    {caption : ['정식', 	'일자'], 		ref: 'plntngYmd', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
			    format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['정식', 	'상태'], 		ref: 'plntngSttsCd', 	type: 'combo', 	width: '100px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonGrdPlntngStts', label:'label', value:'value', itemcount: 10}},
			{caption : ['추비일자', '1차'], 		ref: 'cmptYmdCycl1', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['추비일자', '2차'], 		ref: 'cmptYmdCycl2', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['예상망', 	'예상망'], 		ref: 'expctQntt', 	type: 'output', 		width: '100px', style:'text-align: right',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['품질평가', '품질평가'], 	ref: 'qltEvl', 		type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonQltEvl', label:'label', value:'value', itemcount: 10}},
			{caption : ['올해<br>평균망', '올해<br>평균망'], ref: 'tyEvl', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#.###'}},
			{caption : ['작년<br>평균망', '작년<br>평균망'], ref: 'lastYrEvl', 	type: 'output', 	width: '80px', style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#.###'}},
            {caption : ['저장결과<br>(부패율)', "저장결과<br>(부패율)"], 	ref: 'strgRslt', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
    	        typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###.###'}},
			{caption : ['변동갭', '변동갭'], 		ref: 'flctnDfrnc', 	type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
			{caption : ['무선별', '무선별'], 		ref: 'emptSort', 	type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
			{caption : ['망사구분', '망사구분'], 	ref: 'meshSeCd', 	type: 'combo', 	width: '100px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonGrdMeshSe', 	label:'label', value:'value', itemcount: 10}},
			{caption : ['저장구분 예상망', '단가 C'], 	ref: 'strm', 	type: 'input', 		width: '80px', style:'text-align: right; background:#FFF8DC;',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['저장구분 예상망', '중기 B'], 	ref: 'tmidlTerm', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['저장구분 예상망', '장기 A'], 	ref: 'ltrm', 	type: 'input', 		width: '80px', style:'text-align: right; background:#FFF8DC;',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['저장구분 예상망', '차이'], 	ref: 'dfrnc', 	type: 'input', 		width: '80px', style:'text-align: right; background:#FFF8DC;',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['토양 및 퇴비', '토양'], 	ref: 'soil', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
			{caption : ['토양 및 퇴비', '퇴비'], 	ref: 'cmpt', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
			{caption : ['토양 및 퇴비', '기타'], 	ref: 'etc', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
			{caption : ['병충해', 	'노균병'], 		ref: 'pestYn1', 	type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonComYn', label:'label', value:'value', itemcount: 10}},
			{caption : ['병충해', 	'균핵병'], 		ref: 'pestYn2', 	type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonComYn', label:'label', value:'value', itemcount: 10}},
			{caption : ['병충해', 	'습해'], 		ref: 'pestYn3', 	type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonComYn', label:'label', value:'value', itemcount: 10}},
			{caption : ['담당자', 	'담당자'], 		ref: 'pic', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
        	{caption : ['생육 특이사항', '생육 특이사항'], 	ref: 'grdpExcptnMttr', 	type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;'},
        	{caption : ['저장 특이사항', '저장 특이사항'], 	ref: 'strgExcptnMttr', 	type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;'},
        	{caption : ['비고', '비고'], 	ref: 'rmrk', 	type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;', typeinfo : {maxlength : 300}},*/
	    ];

		fn_getApcSeedList().then( result => {
					result.forEach((item, index) => {
						SBGridProperties.columns.push(item);
					});

					SBGridProperties.columns.push(
							{caption : ['필지(평)', '계약'], 		ref: 'crtrPrcl', 	type: 'output', 	width: '100px', style:'text-align: right',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['필지(평)', '정식'], 		ref: 'plntngPrcl', 	type: 'output', 	width: '100px', style:'text-align: right',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['수매', '양(망)'], 			ref: 'prchsQntt', 	type: 'input', 		width: '100px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['수매', '금액'], 			ref: 'prchsAmt', 	type: 'input', 		width: '100px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['파종', 	'일자'], 		ref: 'sdngYmd', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
								format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
							{caption : ['파종', 	'상태'], 		ref: 'sdngSttsCd', 	type: 'combo', 	width: '100px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonGrdSdngStts', 	label:'label', value:'value', itemcount: 10}},
							{caption : ['정식', 	'일자'], 		ref: 'plntngYmd', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
								format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
							{caption : ['정식', 	'상태'], 		ref: 'plntngSttsCd', 	type: 'combo', 	width: '100px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonGrdPlntngStts', label:'label', value:'value', itemcount: 10}},
							{caption : ['추비일자', '1차'], 		ref: 'cmptYmdCycl1', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
								format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
							{caption : ['추비일자', '2차'], 		ref: 'cmptYmdCycl2', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
								format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
							{caption : ['예상망', 	'예상망'], 		ref: 'expctQntt', 	type: 'output', 		width: '100px', style:'text-align: right',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['품질평가', '품질평가'], 	ref: 'qltEvl', 		type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonQltEvl', label:'label', value:'value', itemcount: 10}},
							{caption : ['올해<br>평균망', '올해<br>평균망'], ref: 'tyEvl', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#.###'}},
							{caption : ['작년<br>평균망', '작년<br>평균망'], ref: 'lastYrEvl', 	type: 'output', 	width: '80px', style:'text-align: right',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#.###'}},
							{caption : ['저장결과<br>(부패율)', "저장결과<br>(부패율)"], 	ref: 'strgRslt', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###.###'}},
							{caption : ['변동갭', '변동갭'], 		ref: 'flctnDfrnc', 	type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
							{caption : ['무선별', '무선별'], 		ref: 'emptSort', 	type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
							{caption : ['망사구분', '망사구분'], 	ref: 'meshSeCd', 	type: 'combo', 	width: '100px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonGrdMeshSe', 	label:'label', value:'value', itemcount: 10}},
							{caption : ['저장구분 예상망', '단가 C'], 	ref: 'strm', 	type: 'input', 		width: '80px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['저장구분 예상망', '중기 B'], 	ref: 'tmidlTerm', 	type: 'input', 	width: '80px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['저장구분 예상망', '장기 A'], 	ref: 'ltrm', 	type: 'input', 		width: '80px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['저장구분 예상망', '차이'], 	ref: 'dfrnc', 	type: 'input', 		width: '80px', style:'text-align: right; background:#FFF8DC;',
								typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
							{caption : ['토양 및 퇴비', '토양'], 	ref: 'soil', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
							{caption : ['토양 및 퇴비', '퇴비'], 	ref: 'cmpt', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
							{caption : ['토양 및 퇴비', '기타'], 	ref: 'etc', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
							{caption : ['병충해', 	'노균병'], 		ref: 'pestYn1', 	type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonComYn', label:'label', value:'value', itemcount: 10}},
							{caption : ['병충해', 	'균핵병'], 		ref: 'pestYn2', 	type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonComYn', label:'label', value:'value', itemcount: 10}},
							{caption : ['병충해', 	'습해'], 		ref: 'pestYn3', 	type: 'combo', 	width: '80px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
								typeinfo: {ref:'jsonComYn', label:'label', value:'value', itemcount: 10}},
							{caption : ['담당자', 	'담당자'], 		ref: 'pic', 		type: 'input', 		width: '100px', style: 'text-align:center; background:#FFF8DC;'},
							{caption : ['생육 특이사항', '생육 특이사항'], 	ref: 'grdpExcptnMttr', 	type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;'},
							{caption : ['저장 특이사항', '저장 특이사항'], 	ref: 'strgExcptnMttr', 	type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;'},
							{caption : ['비고', '비고'], 	ref: 'rmrk', 	type: 'input', 	width: '200px', style: 'text-align:left; background:#FFF8DC;', typeinfo : {maxlength : 300}},
					);

					grdCltvtnFrmhsQlt = _SBGrid.create(SBGridProperties);
					grdCltvtnFrmhsQlt.bind('valuechanged', 'fn_setExpctQntt');
					grdCltvtnFrmhsQlt.bind('click', 'fn_setFrmerInfo');
				}
		)
		.catch( e => {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		})
	}

	const fn_frmhsExpctWrhs = function () {

		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-frmhsExpctWrhs";
	    SBGridProperties.id = "grdFrmhsExpctWrhs";
	    SBGridProperties.jsonref = "jsonFrmhsExpctWrhs";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.frozencols = 4;
		SBGridProperties.contextmenu = true;						// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListExpctWrhs;	// 우클릭 메뉴 리스트

	    const columns = [
		    {caption : ['농가명'], 			ref: 'prdcrNm', 	type: 'output', 	width: '120px', style: 'text-align:center'},
		    {caption : ['지역'], 			ref: 'frmhsCtpv', 	type: 'output', 	width: '80px', 	style: 'text-align:center'},
		    {caption : ['상세주소'], 		ref: 'frmhsAddr', 	type: 'output', 	width: '300px', style: 'text-align:rigth'},
		    {caption : ['연락처'], 			ref: 'frmhsTelno', 	type: 'output', 	width: '100px', style: 'text-align:center',
		    	format : {type:'string', rule:'000-0000-0000'}},
		    {caption : ['본사구분'], 	ref: 'hdofcExtrnlSeCd', 	type: 'combo', 	width: '00px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonGrdHdofcExtrnlSe', 	label:'label', value:'value', itemcount: 10}},
		    {caption : ['외부창고명'], 		ref: 'extrnlWarehouseCd', type: 'combo', 	width: '120px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
				typeinfo: {ref:'jsonGrdExtrnlWarehouseSe', 	label:'label', value:'value', itemcount: 10}},
			{caption : ['수확일자'], 		ref: 'hrvstYmd', 	type : 'input', 	width: '100px', style:'text-align:center; background:#FFF8DC;'},
			{caption : ['정식면적(평)'], 	ref: 'plntngPrcl', 	type: 'output', 	width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['예상량(망)'], 		ref: 'expctQntt', 	type: 'output', 		width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['일자합계'], 		ref: 'tot', 		type: 'output', 	width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['기준연월'], 		ref: 'crtrYm', 	type : 'datepicker', 	width: '100px', style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, typeinfo : {calendartype: 'yearmonth', gotoCurrentClick: true, clearbutton: true}},
	    ];
	    for (var i=1; i<=31; i++) {

	    	let caption = i+"";
	    	let ref = "ymd"+i+"Qntt";
			columns.push(
					{caption : [caption], 		ref: ref, 		type: 'input', 		width: '40px', style:'text-align: right; background:#FFF8DC;',
						typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}, callback : function (strValue) {
							if (strValue== null || strValue == "" || strValue == 0){
				        		return "";
				        	} else {
				        		return strValue;
				        	}
						}
					},
					)
	    }

	    columns.push(
	    		{caption : ['최종저장구분'], 	ref: 'qltEvl', type: 'output', 	width: '100px', style: 'text-align:center;'},
				{caption : ['담당자'], 			ref: 'pic', type: 'output', 	width: '100px', style: 'text-align:center;'},
				{caption : ['예상량대비'], 	ref: 'expctVlmVrss', 	type: 'output', 	width: '80px', style:'text-align: right;',
					typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
				{caption : ['수매완료여부'], 	ref: 'prchsCmptnYn', type: 'combo', 	width: '120px', style: 'text-align:center; background:#FFF8DC;', sortable: false,
					typeinfo: {ref:'jsonGrdPrchsCmptnYn', 	label:'label', value:'value', itemcount: 10}},
				{caption : ['비고'], 			ref: 'rmrk', type: 'input', 	width: '300px', style: 'text-align:left; background:#FFF8DC;'},
	    		)

	    SBGridProperties.columns = columns;
	    grdFrmhsExpctWrhs = _SBGrid.create(SBGridProperties);
	    grdFrmhsExpctWrhs.bind('click', 'fn_setFrmerInfo');
	    grdFrmhsExpctWrhs.bind('valuechanged', 'fn_setCrtrYm');

	}

	const fn_createLandInfo = async function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-landInfo";
	    SBGridProperties.id = "grdLandInfo";
	    SBGridProperties.jsonref = "jsonLandInfo";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.contextmenu = true;							// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListExpctLandInfo;	// 우클릭 메뉴 리스트
	    SBGridProperties.columns = [
	    	{caption : ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if (strValue== null || strValue == "") {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procLandInfo(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	} else {
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procLandInfo(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ['생산자'], 		ref: 'prdcrCd', 	width: '200px', type:'inputcombo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	    	{caption : ['위치'], 		ref: 'frlnAddr', 	type: 'input', 	width: '400px', style: 'text-align:left; background:#FFF8DC;', typeinfo : {maxlength : 70}},
	    	{caption : ['계약(평)'], 	ref: 'crtrArea', 	type: 'input', 	width: '100px', style: 'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}, maxlength : 6},
	    	{caption : ['정식(평)'], 	ref: 'plntngArea', 	type: 'input', 	width: '100px', style: 'text-align: right;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}, maxlength : 6},
	    	{caption : ['법정동'], 		ref: 'stdgCd', 		type: 'inputbutton', 	width: '120px', style: 'text-align:center',
                typeinfo : {callback: fn_modalStdgCd}},
	    	{caption : ['본번'], 		ref: 'frlnMno', 	type: 'input', 	width: '80px', style: 'text-align:center', typeinfo : {maxlength : 4, mask : {alias : 'numeric'}}},
	    	{caption : ['부번'], 		ref: 'frlnSno', 	type: 'input', 	width: '80px', style: 'text-align:center', typeinfo : {maxlength : 4, mask : {alias : 'numeric'}}},
	    	{caption : [''], 			ref: 'rmrk', 		type: 'output', width: '200px', },
	    ];
	    grdLandInfo = _SBGrid.create(SBGridProperties);
	    grdLandInfo.bind("afterimportexcel", setDataAfterImport);
	}

	const objMenuListExpctLandInfo = {
		"excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldLandInfo,	//콜백함수명
        },
        "dwnld": {
            "name": "서식받기",					//컨텍스트메뉴에 표시될 이름
            "accesskey": "d",					//단축키
            "callback": fn_dwnld,	//콜백함수명
        },
        "uld": {
            "name": "서식올리기",					//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_uld,	//콜백함수명
        },
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListFrmhsQlt = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldFrmhsQlt,	//콜백함수명
        },
    };

    // 엑셀 다운로드 (재배농가품질)
    function fn_excelDwnldFrmhsQlt() {

    	if (gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?\n (확인 클릭 시 xlsx, 취소 클릭 시 xls)")) {
    		grdCltvtnFrmhsQlt.exportData("xlsx","재배농가품질",true);
    	} else {
    		grdCltvtnFrmhsQlt.exportLocalExcel("재배농가품질", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    	}
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListExpctWrhs = {
        "excelDwnld": {
            "name": "엑셀 다운로드",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",						//단축키
            "callback": fn_excelDwnldExpctWrhs,		//콜백함수명
        },
    };

    // 엑셀 다운로드(농가예상입고)
    function fn_excelDwnldExpctWrhs() {

    	if (gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?\n (확인 클릭 시 xlsx, 취소 클릭 시 xls)")) {
    		grdFrmhsExpctWrhs.exportData("xlsx","농가예상입고",true);
    	} else {
    		grdFrmhsExpctWrhs.exportLocalExcel("농가예상입고", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    	}

    }


	/**
     * @name fn_setFrlnInput
     * @description 재배이력 지도(보기) 이벤트 팜맵 팝업 연결
     */
	const fn_setFrlnInput = function () {
		const item = grdPrdcrLandInfo.getRowData(grdPrdcrLandInfo.getRow());

     	let col = grdPrdcrLandInfo.getCol();

		var mapCol = grdPrdcrLandInfo.getColRef("map");
		if (mapCol === col) {
			frmidMapPopup(item);
		}
	}

	/**
     * @name fn_dtpChange
     * @description From ~ To 시작일보다 종료일보다 작을 수 없음
     */
	const fn_dtpChange = function () {

		let cfmtnYmdFrom = SBUxMethod.get("srch-dtp-cfmtnYmdFrom");
		let cfmtnYmdTo = SBUxMethod.get("srch-dtp-cfmtnYmdTo");
		var maxYmd = gfn_addDate(cfmtnYmdFrom, 90);

		if (maxYmd < cfmtnYmdTo) {
    		SBUxMethod.set("srch-dtp-cfmtnYmdTo", maxYmd);
	    }

		if (gfn_diffDate(cfmtnYmdFrom, cfmtnYmdTo) < 0) {
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-cfmtnYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-cfmtnYmdTo", gfn_dateToYmd(new Date()));
			return;
		}

		if (maxYmd < cfmtnYmdTo) {
    		SBUxMethod.set("srch-dtp-cfmtnYmdTo", maxYmd);
	    }
	}

	/**
     * @name fn_setExpctQntt
     * @description 재배농가품질 예상망 계산
     */
	const fn_setExpctQntt = function() {

		let nRow = grdCltvtnFrmhsQlt.getRow();
		let nCol = grdCltvtnFrmhsQlt.getCol();
		let tyEvlCol = grdCltvtnFrmhsQlt.getColRef("tyEvl")
		let plntngPrclCol = grdCltvtnFrmhsQlt.getColRef("plntngPrcl")

		if (nCol == tyEvlCol || nCol == plntngPrclCol) {
			let expctQnttCol = grdCltvtnFrmhsQlt.getColRef("expctQntt")
			let rowData = grdCltvtnFrmhsQlt.getRowData(nRow);
			let tyEvl = parseFloat(rowData.tyEvl);
			let plntngPrcl = parseInt(rowData.plntngPrcl);

			let expctQntt = Math.round(plntngPrcl * tyEvl * 1.2);
			grdCltvtnFrmhsQlt.setCellData(nRow, expctQnttCol, expctQntt, true);
		}
	}

	const fn_delFile = async function (nRow) {

		let rowData = grdCltvtnHstryPrdcr.getRowData(nRow);
		let atchflNo = rowData.atchflNo;
		let prntsTblNo =  'CQ' + rowData.apcCd + rowData.prdcrCd + rowData.prdcrLandInfoNo + rowData.cltvtnHstryNo;

		rowData.prntsTblNo = prntsTblNo;

		if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteFile.do", rowData);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
		    		fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

	}


	const fn_setCrtrYm = function () {
		let nRow = grdFrmhsExpctWrhs.getRow();
		let nCol = grdFrmhsExpctWrhs.getCol();
		let crtrYmCol = grdFrmhsExpctWrhs.getColRef("crtrYm");

		if (nCol == crtrYmCol) {

			let rowData = grdFrmhsExpctWrhs.getRowData(nRow);
			let crtrYr = rowData.crtrYm.substring(0, 4);
			let yr = SBUxMethod.get("srch-dtp-yr");

			if (crtrYr != yr) {
	  			gfn_comAlert("E0000", "조회연도와 입력연도가 다릅니다. 다른 연도 입력시 조회 후 입력 해주세요.");				//	E0000	{0}
	  			grdCltvtnFrmhsQlt.setCellData(nRow, crtrYmCol, "", true);
	            return;
	  		}

		}
	}


	/**
	 * @name fn_getApcSeedList
	 * @description 품목 / 품종 조회
	 */
	const fn_getApcSeedList = async function () {
		const colApcSeed = [];
		const postJsonPromise = gfn_postJSON(
				"/am/cmns/selectApcSeedList.do", {
					apcCd: gv_selectedApcCd
				}
		);
		const data = await postJsonPromise;

		try{
			if (_.isEqual("S", data.resultStatus)) {
				data.resultList.forEach((item, index) => {
					const apcSeedGrd = {
						caption : [item.itemNm, item.seedNm]
						, ref: 'sdQntt' + (index + 1).toString()
						, type: 'input'
						, width: '100px'
						, style:'text-align: right; background:#FFF8DC;'
						, typeinfo : {mask : {alias : 'numeric'}}
						, format : {type:'number', rule:'#,###'}
					}
					colApcSeed.push(apcSeedGrd);
				});
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
		return colApcSeed;
	}


	/**
     * @name fn_setFrmerInfo
     * @description 클릭 시 영농일지 생산자 정보 조회
     */
	const fn_setFrmerInfo = async function () {

		let choiceTab = SBUxMethod.get("idxTab_norm");
		let prdcrCd = "";
		let nRow = 0;
		let nCol = 0;

		if (choiceTab == "frmhsQltTab") {
			nRow = grdCltvtnFrmhsQlt.getRow();
			nCol = grdCltvtnFrmhsQlt.getCol();

			if (nRow <= 0) {
				return;
			}

			let prdcrNmCol = grdCltvtnFrmhsQlt.getColRef("prdcrNm");
			if (nCol == prdcrNmCol) {

				let rowData = grdCltvtnFrmhsQlt.getRowData(nRow);
				prdcrCd = rowData.prdcrCd;

				let prdcr = _.find(jsonPrdcr, {prdcrCd: prdcrCd});
				fn_setPrdcrFormDtl(prdcr);

				fn_setCltvtnFrmhsQltPrdcr(prdcrCd);
				fn_setPrdcrLandInfo(prdcrCd)

				if (!gfn_isEmpty(choicePrdcrLandInfoNo)) {
					await fn_setCltvtnHstryPrdcr();
				}
				SBUxMethod.set("idxTab_norm", "frmerInfoTab");
			}
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			nRow = grdFrmhsExpctWrhs.getRow();
			nCol = grdFrmhsExpctWrhs.getCol();

			if (nRow <= 0) {
				return;
			}

			let prdcrNmCol = grdFrmhsExpctWrhs.getColRef("prdcrNm");
			if (nCol == prdcrNmCol) {

				let rowData = grdFrmhsExpctWrhs.getRowData(nRow);
				prdcrCd = rowData.prdcrCd;

				let prdcr = _.find(jsonPrdcr, {prdcrCd: prdcrCd});
				fn_setPrdcrFormDtl(prdcr);

				fn_setCltvtnFrmhsQltPrdcr(prdcrCd);
				fn_setPrdcrLandInfo(prdcrCd)

				if (!gfn_isEmpty(choicePrdcrLandInfoNo)) {
					await fn_setCltvtnHstryPrdcr();
				}
				SBUxMethod.set("idxTab_norm", "frmerInfoTab");
			}
		}

		if (choiceTab == "cltvtnHstryTab") {
			nRow = grdCltvtnHstry.getRow();
			nCol = grdCltvtnHstry.getCol();

			if (nRow <= 0) {
				return;
			}

			let prdcrNmCol = grdCltvtnHstry.getColRef("prdcrNm");
			if (nCol == prdcrNmCol) {

				let rowData = grdCltvtnHstry.getRowData(nRow);
				prdcrCd = rowData.prdcrCd;

				let prdcr = _.find(jsonPrdcr, {prdcrCd: prdcrCd});
				fn_setPrdcrFormDtl(prdcr);

				fn_setCltvtnFrmhsQltPrdcr(prdcrCd);
				fn_setPrdcrLandInfo(prdcrCd)

				if (!gfn_isEmpty(choicePrdcrLandInfoNo)) {
					await fn_setCltvtnHstryPrdcr();
				}

				SBUxMethod.set("idxTab_norm", "frmerInfoTab");
			}
		}
	}

	/**
     * @name frmidMapPopup
     * @description 그리드 팝맵 팝업 띄우기
     * @param event
     * @return (String)
     */
	const frmidMapPopup = async function(item){
		if (gfn_isEmpty(item.delYn)) {
			gfn_comAlert("E0000", "추가 후 사용해 주세요." ) // E0000 {0}
			return;
		}
		SBUxMethod.openModal('modal-framldMap');
		popFramldMap.init(gv_selectedApcCd, item.stdgCd, item.frlnMno, item.frlnSno);
	}

	/**
     * @name fn_imagePop
     * @description 그리드 사진 팝업 띄우기
     * @param (String)
     * @return
     */
	const fn_imagePop = function (nRow) {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "cltvtnHstryTab") {
			let rowData = grdCltvtnHstry.getRowData(nRow);
			let atchflNo = rowData.atchflNo;
			let prntsTblNo = "CQ" + rowData.apcCd + rowData.prdcrCd + rowData.prdcrLandInfoNo + rowData.cltvtnHstryNo ;

			SBUxMethod.openModal('modal-image');
			popImage.init(atchflNo, prntsTblNo, '01');

		} else if (choiceTab == "frmerInfoTab") {
			let rowData = grdCltvtnHstryPrdcr.getRowData(nRow);
			let atchflNo = rowData.atchflNo;
			let prntsTblNo = "CQ" + rowData.apcCd + rowData.prdcrCd + rowData.prdcrLandInfoNo + rowData.cltvtnHstryNo ;

			SBUxMethod.openModal('modal-image');
			popImage.init(atchflNo, prntsTblNo, '01');
		} else {
			return;
		}
	}

	/**
     * @name fn_fileSelect
     * @description 그리드 파일 업로드 검사 및 정보 셋팅
     * @param event
     * @return
     */
	const fn_fileSelect = function (event) {

		// event.target을 사용하여 파일 선택 input 요소를 참조합니다.
	    const input = event.target;
		const fileId = input.id;

	    // 선택된 파일들이 저장된 FileList 객체를 가져옵니다.
	    const files = input.files;

	    // 선택된 파일의 수를 확인합니다.
	    if (files.length > 0) {
	        // 첫 번째 파일을 가져옵니다.
	        const file = files[0];


	        if (!gfn_isEmpty(fileId)) {

	        	const maxSize = 8 * 1024 * 1024;  // 8MB in bytes

	        	if (file.size > maxSize) {

	        		input.value = '';
		        	gfn_comAlert("E0000", "파일의 크기가 큽니다." ) // E0000 {0}
		        	return;
		        } else {

		        	// 문자열에서 마지막 하이픈의 위치를 찾습니다
		        	const lastHyphenIndex = fileId.lastIndexOf('-');

		        	// 하이픈 뒤의 부분을 가져오고, 숫자를 추출합니다
		        	const lastNumber = parseInt(fileId.substring(lastHyphenIndex + 1));

		        	let atchflOrgnNmCol = grdCltvtnHstryPrdcr.getColRef("atchflOrgnNm");
		        	let fileNameCol = grdCltvtnHstryPrdcr.getColRef("fileName");

		        	grdCltvtnHstryPrdcr.setCellData(lastNumber, atchflOrgnNmCol, file.name, true);
		        	grdCltvtnHstryPrdcr.setCellData(lastNumber, fileNameCol, file.name, true);
		        	grdCltvtnHstryPrdcr.setRowStatus(lastNumber, "update", true);
		        }


	        }


	    } else {
	        //console.log('No file selected.');
	    }

	}

	/**
     * @name fn_fileUpload
     * @description 그리드 파일 업로드 이벤트
     * @param {String}
     * @return (String)
     */
	const fn_fileUpload = function (nRow) {

		let fileId = 'inp-file-' + nRow;
    	let key = '#' + fileId; // fileId를 선택자로 변환 (템플릿 리터럴 사용 안 함)
        if ($(key).length) {  	// 요소 존재 여부 확인
            $(key).click();  	// 'file-2' 버튼 클릭 이벤트 트리거
        } else {
            //console.log(key + ' 요소가 존재하지 않습니다.');
        }
	}


	/**
     * @name fn_grdValueChanged
     * @description 그리드 combo change 이벤트
     * @param {String}
     * @return (String)
     */
	const fn_grdValueChanged = function () {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "frmhsQltTab") {
			let nRow = grdCltvtnFrmhsQlt.getRow();
			let nCol = grdCltvtnFrmhsQlt.getCol();
			let prdcrCol = grdCltvtnFrmhsQlt.getColRef("prdcrCd");
			let frmhsAddrCol = grdCltvtnFrmhsQlt.getColRef("frmhsAddr");
			let frmhsTelnoCol = grdCltvtnFrmhsQlt.getColRef("frmhsTelno");
			let frmhsCtpvCol = grdCltvtnFrmhsQlt.getColRef("frmhsCtpv");

			if (nCol == prdcrCol) {
				let rowData = grdCltvtnFrmhsQlt.getRowData(nRow);
				let prdcrCd = rowData.prdcrCd;
				let prdcrInfo = _.find(jsonGrdPrdcr, {value: prdcrCd});

				grdCltvtnFrmhsQlt.setCellData(nRow, frmhsAddrCol, prdcrInfo.frmhsAddr);
				grdCltvtnFrmhsQlt.setCellData(nRow, frmhsTelnoCol, prdcrInfo.frmhsTelno);
				grdCltvtnFrmhsQlt.setCellData(nRow, frmhsCtpvCol, prdcrInfo.frmhsCtpv);
			}
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			let nRow = grdFrmhsExpctWrhs.getRow();
			let nCol = grdFrmhsExpctWrhs.getCol();
			let prdcrCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
			let crtrYmCol = grdFrmhsExpctWrhs.getColRef("crtrYm");
			let frmhsAddrCol = grdFrmhsExpctWrhs.getColRef("frmhsAddr");
			let frmhsTelnoCol = grdFrmhsExpctWrhs.getColRef("frmhsTelno");
			let frmhsCtpvCol = grdFrmhsExpctWrhs.getColRef("frmhsCtpv");

			if (nCol == prdcrCol) {
				let rowData = grdFrmhsExpctWrhs.getRowData(nRow);
				let prdcrCd = rowData.prdcrCd;
				let crtrYm = rowData.crtrYm;

				if (!gfn_isEmpty(crtrYm)) {
					let grdData = grdFrmhsExpctWrhs.getGridDataAll();
					for (var i=1; i<=grdData.length; i++) {

						if (i == nRow) {
							continue;
						}

						let grdRowData = grdFrmhsExpctWrhs.getRowData(i);
						let grdCryrYm  = grdRowData.crtrYm;
						let grdPrdcrCd  = grdRowData.prdcrCd;

						if (prdcrCd == grdPrdcrCd && crtrYm == grdCryrYm) {
							grdFrmhsExpctWrhs.setCellData(nRow, prdcrCol, "");
							gfn_comAlert("W0009", "해당 농가에" + crtrYm) // W0009 {0}이/가 있습니다.
							return;
						}
					}
				}

				let prdcrInfo = _.find(jsonGrdPrdcr, {value: prdcrCd});

				grdFrmhsExpctWrhs.setCellData(nRow, frmhsAddrCol, prdcrInfo.frmhsAddr);
				grdFrmhsExpctWrhs.setCellData(nRow, frmhsTelnoCol, prdcrInfo.frmhsTelno);
				grdFrmhsExpctWrhs.setCellData(nRow, frmhsCtpvCol, prdcrInfo.frmhsCtpv);

			}

			if (nCol == crtrYmCol) {
				let rowData = grdFrmhsExpctWrhs.getRowData(nRow);
				let prdcrCd = rowData.prdcrCd;
				let crtrYm = rowData.crtrYm;

				if (!gfn_isEmpty(prdcrCd)) {
					let grdData = grdFrmhsExpctWrhs.getGridDataAll();
					for (var i=1; i<=grdData.length; i++) {

						if (i == nRow) {
							continue;
						}

						let grdRowData = grdFrmhsExpctWrhs.getRowData(i);
						let grdCryrYm  = grdRowData.crtrYm;
						let grdPrdcrCd  = grdRowData.prdcrCd;

						if (prdcrCd == grdPrdcrCd && crtrYm == grdCryrYm) {
							grdFrmhsExpctWrhs.setCellData(nRow, crtrYmCol, "");
							gfn_comAlert("W0009", "해당 농가에" + crtrYm) // W0009 {0}이/가 있습니다.
							return;
						}
					}

				}

				let lastDay = parseInt(fn_getLastDayOfMonth(crtrYm)) + 1 ;
				if (32 != lastDay) {

					let firstCol = grdFrmhsExpctWrhs.getColRef("ymd1Qntt");
					let lastCol = grdFrmhsExpctWrhs.getColRef("ymd31Qntt");

					grdFrmhsExpctWrhs.setCellDisabled(nRow, firstCol, nRow, lastCol, false);

					for (var i=lastDay; i<=31; i++) {
						let colKey =  "ymd"+i+"Qntt";
						let col = grdFrmhsExpctWrhs.getColRef(colKey);
						grdFrmhsExpctWrhs.setCellDisabled(nRow, col, nRow, col, true);
					}
				} else {

					let firstCol = grdFrmhsExpctWrhs.getColRef("ymd1Qntt");
					let lastCol = grdFrmhsExpctWrhs.getColRef("ymd31Qntt");

					grdFrmhsExpctWrhs.setCellDisabled(nRow, firstCol, nRow, lastCol, false);
				}
			}
		}
	}

	/**
     * @name fn_getLastDayOfMonth
     * @description 연월에 해당 되는 마지막 날 구하기
     * @param {String} yyyymm
     * @return (String) mm
     */
	const fn_getLastDayOfMonth = function (yyyymm) {

	    // 년도와 월 추출
	    var year = parseInt(yyyymm.substring(0, 4), 10);
	    var month = parseInt(yyyymm.substring(4, 6), 10);

	    // Date 객체 생성하여 해당 월의 다음 달의 첫 날을 구함
	    var nextMonthFirstDay = new Date(year, month, 1);

	    // 이전 월의 마지막 날을 구하기 위해 하루 전으로 설정
	    nextMonthFirstDay.setDate(nextMonthFirstDay.getDate() - 1);

	    // 이전 월의 마지막 날짜 반환
	    return nextMonthFirstDay.getDate();
	}

	const fn_search = async function() {
		let choiceTab = SBUxMethod.get("idxTab_norm");
		let prdcrCdDtl = SBUxMethod.get("dtl-inp-prdcrCd");

		choicePrdcrLandInfoNo = "";

        if(choiceTab == 'frmerInfoTab') {
            // 영농일지 재배 이력 grid clear
            jsonCltvtnHstryPrdcr.length = 0;
            grdCltvtnHstryPrdcr.refresh();

            if(!gfn_isEmpty(prdcrCdDtl)) {
                await Promise.all([
                    fn_setCltvtnFrmhsQltPrdcr(prdcrCdDtl),
                    fn_setPrdcrLandInfo(prdcrCdDtl)
                ]);

                if(!gfn_isEmpty(choicePrdcrLandInfoNo)) {
                    await fn_setCltvtnHstryPrdcr();
                }
            } else {
                gfn_comAlert("W0001", "농가");    // W0002    {0}을/를 선택하세요.
                return;
            }
        } else if(choiceTab == 'frmhsQltTab') {
            await Promise.all([
                fn_setCltvtnFrmhsQlt(prdcrCdDtl)
            ]);
        } else if(choiceTab == 'frmhsExpctWrhsTab') {
            await Promise.all([
                fn_setFrmhsExpctWrhs()
            ]);
        } else if(choiceTab == 'cltvtnHstryTab') {
            await Promise.all([
                fn_setCltvtnHstry()
            ]);
        } else if(choiceTab == 'landInfoTab') {
            await Promise.all([
                fn_setLandInfo()
            ]);
        }
	}

	/**
     * @name fn_setClvtnBsclnfo
     * @description 재배 기본정보 조회
     * @param {String} prdcrCdDtl
     */
	const fn_setCltvtnFrmhsQltPrdcr = async function(prdcrCdDtl) {

    	let yr = SBUxMethod.get("srch-dtp-yr");

    	if (gfn_isEmpty(yr)) {
  			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

		const param = {
			apcCd: gv_selectedApcCd,
			prdcrCd: prdcrCdDtl,
			yr : yr
		}
		jsonCltvtnFrmhsQltPrdcr.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectCltvtnFrmhsQltList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

	        data.resultList.forEach((item, index) => {

	        	const cltvtnFrmhsQltVO = {
	        			apcCd				: item.apcCd
	   	        	  , prdcrCd             : item.prdcrCd
	   	        	  , prdcrNm             : item.prdcrNm
	   	        	  , frmhsCtpv           : item.frmhsCtpv
	   	        	  , frmhsAddr           : item.frmhsAddr
	   	        	  , strgRslt            : item.strgRslt
	   	        	  , yr                  : item.yr
	   	        	  , frmhsTelno          : item.frmhsTelno
	   	        	  , cltvtnFrmhsQltNo    : item.cltvtnFrmhsQltNo
	   	        	  , sdQntt1             : fn_zero(item.sdQntt1)
	   	        	  , sdQntt2             : fn_zero(item.sdQntt2)
	   	        	  , sdQntt3             : fn_zero(item.sdQntt3)
	   	        	  , sdQntt4             : fn_zero(item.sdQntt4)
	   	        	  , sdQntt5             : fn_zero(item.sdQntt5)
	   	        	  , crtrPrcl            : fn_zero(item.crtrPrcl)
	   	        	  , plntngPrcl          : fn_zero(item.plntngPrcl)
	   	        	  , sdngYmd             : item.sdngYmd
	   	        	  , sdngSttsCd          : item.sdngSttsCd
	   	        	  , plntngYmd           : item.plntngYmd
	   	        	  , plntngSttsCd        : item.plntngSttsCd
	   	        	  , cmptYmdCycl1        : item.cmptYmdCycl1
	   	        	  , cmptYmdCycl2        : item.cmptYmdCycl2
	   	        	  , expctQntt           : fn_zero(item.expctQntt)
	   	        	  , qltEvl              : item.qltEvl
	   	        	  , lastYrEvl           : fn_zero(item.lastYrEvl)
	   	        	  , flctnDfrnc          : fn_zero(item.flctnDfrnc)
	   	        	  , emptSort            : item.emptSort
	   	        	  , meshSeCd            : item.meshSeCd
	   	        	  , strm                : fn_zero(item.strm)
	   	        	  , tmidlTerm           : fn_zero(item.tmidlTerm)
	   	        	  , ltrm                : fn_zero(item.ltrm)
	   	        	  , dfrnc               : fn_zero(item.dfrnc)
	   	        	  , soil                : item.soil
	   	        	  , cmpt                : item.cmpt
	   	        	  , etc                 : item.etc
	   	        	  , pestCd1             : item.pestCd1
	   	        	  , pestCd2             : item.pestCd2
	   	        	  , pestCd3             : item.pestCd3
	   	        	  , pestYn1             : item.pestYn1
	   	        	  , pestYn2             : item.pestYn2
	   	        	  , pestYn3             : item.pestYn3
	   	        	  , pic                 : item.pic
	   	        	  , grdpExcptnMttr      : item.grdpExcptnMttr
	   	        	  , strgExcptnMttr      : item.strgExcptnMttr
	   	        	  , delYn               : item.delYn
	   	        	  , rmrk                : item.rmrk
	   	        	  , strgRslt            : fn_zero(item.strgRslt)
	   	        	  , prchsQntt           : fn_zero(item.prchsQntt)
	   	        	  , prchsAmt            : fn_zero(item.prchsAmt)
	   	        	  , plntngSttsNm        : item.plntngSttsNm
	   	        	  , sdngSttsNm          : item.sdngSttsNm
	   	        	  , meshSeNm            : item.meshSeNm
	        	}
	        	jsonCltvtnFrmhsQltPrdcr.push(cltvtnFrmhsQltVO);
	        });

	        grdCltvtnFrmhsQltPrdcr.rebuild();
	        if (jsonCltvtnFrmhsQltPrdcr.length == 0) {
	        	grdCltvtnFrmhsQltPrdcr.addRow();
	        }

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

     /**
      * @name fn_setClvtnHstyr
      * @description 재배이력 목록 조회
      * @param {String} prdcrCdDtl
      */
	const fn_setCltvtnHstryPrdcr = async function() {
	    let rowData 		= grdPrdcrLandInfo.getRowData(grdPrdcrLandInfo.getRow());
		let prdcrCd 		= "";
    	let prdcrLandInfoNo = "";

    	if (gfn_isEmpty(rowData.apcCd)) {
    		//prdcrLandInfoNo = choicePrdcrLandInfoNo;
			//prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");
			/** 농지정보 클릭시 데이터 없을 때 **/
			jsonCltvtnHstryPrdcr.length = 0;
			grdCltvtnHstryPrdcr.refresh();
			return;
		} else {
    		prdcrLandInfoNo = rowData.prdcrLandInfoNo;
    		prdcrCd = rowData.prdcrCd;
    	}

    	choicePrdcrLandInfoNo = prdcrLandInfoNo;
		const param = {
			apcCd			: gv_selectedApcCd
		  , prdcrCd			: prdcrCd
		  , prdcrLandInfoNo : prdcrLandInfoNo
		}
		jsonCltvtnHstryPrdcr.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectCltvtnHstryList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
			let totalRecordCount = 0;
	        data.resultList.forEach((item, index) => {

	        	const cltvtnHstryVO = {
	        			apcCd 			: item.apcCd
	        		  , prdcrCd 		: item.prdcrCd
	        		  , prdcrNm			: item.prdcrNm
	        		  , prdcrLandInfoNo	: item.prdcrLandInfoNo
	        		  , cn				: item.cn
	        		  , cltvtnHstryNo	: item.cltvtnHstryNo
	        		  , rmrk 			: item.rmrk
	        		  , delYn			: item.delYn
	        		  , atchflNo		: item.atchflNo
	        		  , filePath		: item.filePath
	        		  , atchflOrgnNm	: item.atchflOrgnNm
	        		  , cfmtnYmd		: item.cfmtnYmd
	        		  , pic				: item.pic
	        		  , baseFrtlzrYmd	: item.baseFrtlzrYmd
	        		  , sdngYmd			: item.sdngYmd
	        		  , plntngYmd		: item.plntngYmd
	        		  , cmptYmdCycl1	: item.cmptYmdCycl1
	        		  , cmptYmdCycl2	: item.cmptYmdCycl2

	        	}

	        	if (!gfn_isEmpty(item.cltvtnHstryNo)) {
	        		cltvtnHstryVO.inputFlag = true;
	        	} else {
	        		cltvtnHstryVO.inputFlag = false;
	        	}
	        	jsonCltvtnHstryPrdcr.push(cltvtnHstryVO);
	        });
			totalRecordCount = jsonCltvtnHstryPrdcr.length;
			document.querySelector('#cnt-cltvtnHstryPrdcr').innerText = totalRecordCount;

	        grdCltvtnHstryPrdcr.rebuild();
	        grdCltvtnHstryPrdcr.addRow(true);

	        grdCltvtnHstryPrdcr.setCellDisabled(0, 0, grdCltvtnHstryPrdcr.getRows() -1, grdCltvtnHstryPrdcr.getCols() -1, false);
	        grdCltvtnHstryPrdcr.setCellDisabled(grdCltvtnHstryPrdcr.getRows() -1, 0, grdCltvtnHstryPrdcr.getRows() -1, grdCltvtnHstryPrdcr.getCols() -1, true);



		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

     /**
      * @name fn_setCltvtnHstry
      * @description 재배및수확후관리 조회
      * @param {String} prdcrCdDtl
      */
	const fn_setCltvtnHstry = async function() {

		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");

		let cfmtnYmdFrom = SBUxMethod.get("srch-dtp-cfmtnYmdFrom");
		let cfmtnYmdTo = SBUxMethod.get("srch-dtp-cfmtnYmdTo");

		const param = {
			apcCd			: gv_selectedApcCd
		  , prdcrCd			: prdcrCd
		  , cfmtnYmdTo 		: cfmtnYmdTo
		  , cfmtnYmdFrom	: cfmtnYmdFrom
		}
		jsonCltvtnHstry.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectCltvtnHstryList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {

	        	const cltvtnHstryVO = {
	        			apcCd 			: item.apcCd
	        		  , prdcrCd 		: item.prdcrCd
	        		  , prdcrNm			: item.prdcrNm
	        		  , prdcrLandInfoNo	: item.prdcrLandInfoNo
	        		  , cn				: item.cn
	        		  , cltvtnHstryNo	: item.cltvtnHstryNo
	        		  , rmrk 			: item.rmrk
	        		  , delYn			: item.delYn
	        		  , atchflNo		: item.atchflNo
	        		  , filePath		: item.filePath
	        		  , atchflOrgnNm	: item.atchflOrgnNm
	        		  , frmhsCtpv		: item.frmhsCtpv
	        		  , cfmtnYmd		: item.cfmtnYmd
	        		  , pic				: item.pic

					  , crtrArea		: item.crtrArea
					  , plntngArea		: item.plntngArea
					  , frlnAddr		: item.frlnAddr

	        	}
	        	jsonCltvtnHstry.push(cltvtnHstryVO);
	        });

	        grdCltvtnHstry.rebuild();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

     /**
      * @name fn_setPrdcrLandInfo
      * @description 생산 농지정보 목록 조회
      * @param {String} prdcrCdDtl
      */
	const fn_setPrdcrLandInfo = async function(prdcrCdDtl) {

		let yr = SBUxMethod.get("srch-dtp-yr")
		const param = {
			apcCd		: gv_selectedApcCd
		  , prdcrCd		: prdcrCdDtl
		  , yr 			: yr
		}
		jsonPrdcrLandInfo.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectPrdcrLandInfoList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

			let totalRecordCount = 0;
	        data.resultList.forEach((item, index) => {

	        	const prdcrLandInfoVO = item;

	        	jsonPrdcrLandInfo.push(prdcrLandInfoVO);
	        });

			totalRecordCount = jsonPrdcrLandInfo.length;
			document.querySelector('#cnt-prdcrLandInfo').innerText = totalRecordCount;

	        grdPrdcrLandInfo.rebuild();
	        grdPrdcrLandInfo.addRow(true);
	        grdPrdcrLandInfo.setCellDisabled(0, 0, grdPrdcrLandInfo.getRows() -1, grdPrdcrLandInfo.getCols() -1, false);
    		grdPrdcrLandInfo.setCellDisabled(grdPrdcrLandInfo.getRows() -1, 0, grdPrdcrLandInfo.getRows() -1, grdPrdcrLandInfo.getCols() -1, true);

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

      /**
       * @name fn_setClvtnHstyr
       * @description 재배이력 목록 조회
       * @param {String} prdcrCdDtl
       */
 	const fn_setCltvtnFrmhsQlt = async function() {
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let yr = SBUxMethod.get("srch-dtp-yr");

    	if (gfn_isEmpty(yr)) {
  			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

 		const param = {
 			apcCd		: gv_selectedApcCd
 		  , prdcrCd		: prdcrCd
 		  , itemCd 		: itemCd
 		  , yr			: yr
 		}
 		jsonCltvtnFrmhsQlt.length = 0;
 		try {
 			const postJsonPromise = gfn_postJSON(
 						"/am/wrhs/selectCltvtnFrmhsQltList.do",
 						param,
 						null,
 						false
 					);
 	        const data = await postJsonPromise;

 	        data.resultList.forEach((item, index) => {

 	        	const cltvtnFrmhsQltVO = {

 	        		apcCd				: item.apcCd
 	        	  , prdcrCd             : item.prdcrCd
 	        	  , prdcrNm             : item.prdcrNm
 	        	  , frmhsCtpv           : item.frmhsCtpv
 	        	  , frmhsAddr           : item.frmhsAddr
 	        	  , strgRslt            : item.strgRslt
 	        	  , yr                  : item.yr
 	        	  , frmhsTelno          : item.frmhsTelno
 	        	  , cltvtnFrmhsQltNo    : item.cltvtnFrmhsQltNo
 	        	  , sdQntt1             : fn_zero(item.sdQntt1)
 	        	  , sdQntt2             : fn_zero(item.sdQntt2)
 	        	  , sdQntt3             : fn_zero(item.sdQntt3)
 	        	  , sdQntt4             : fn_zero(item.sdQntt4)
 	        	  , sdQntt5             : fn_zero(item.sdQntt5)
 	        	  , crtrPrcl            : fn_zero(item.crtrPrcl)
 	        	  , plntngPrcl          : fn_zero(item.plntngPrcl)
 	        	  , sdngYmd             : item.sdngYmd
 	        	  , sdngSttsCd          : item.sdngSttsCd
 	        	  , plntngYmd           : item.plntngYmd
 	        	  , plntngSttsCd        : item.plntngSttsCd
 	        	  , cmptYmdCycl1        : item.cmptYmdCycl1
 	        	  , cmptYmdCycl2        : item.cmptYmdCycl2
 	        	  , expctQntt           : fn_zero(item.expctQntt)
 	        	  , qltEvl              : item.qltEvl
 	        	  , tyEvl           	: fn_zero(item.tyEvl)
 	        	  , lastYrEvl           : fn_zero(item.lastYrEvl)
 	        	  , flctnDfrnc          : fn_zero(item.flctnDfrnc)
 	        	  , emptSort            : item.emptSort
 	        	  , meshSeCd            : item.meshSeCd
 	        	  , strm                : fn_zero(item.strm)
 	        	  , tmidlTerm           : fn_zero(item.tmidlTerm)
 	        	  , ltrm                : fn_zero(item.ltrm)
 	        	  , dfrnc               : fn_zero(item.dfrnc)
 	        	  , soil                : item.soil
 	        	  , cmpt                : item.cmpt
 	        	  , etc                 : item.etc
 	        	  , pestCd1             : item.pestCd1
 	        	  , pestCd2             : item.pestCd2
 	        	  , pestCd3             : item.pestCd3
 	        	  , pestYn1             : item.pestYn1
 	        	  , pestYn2             : item.pestYn2
 	        	  , pestYn3             : item.pestYn3
 	        	  , pic                 : item.pic
 	        	  , grdpExcptnMttr      : item.grdpExcptnMttr
 	        	  , strgExcptnMttr      : item.strgExcptnMttr
 	        	  , delYn               : item.delYn
 	        	  , rmrk                : item.rmrk
 	        	  , strgRslt            : fn_zero(item.strgRslt)
 	        	  , prchsQntt           : fn_zero(item.prchsQntt)
 	        	  , prchsAmt            : fn_zero(item.prchsAmt)
 	        	  , plntngSttsNm        : item.plntngSttsNm
 	        	  , sdngSttsNm          : item.sdngSttsNm
 	        	  , meshSeNm            : item.meshSeNm

 	        	}
 	        	jsonCltvtnFrmhsQlt.push(cltvtnFrmhsQltVO);
 	        });

 	        grdCltvtnFrmhsQlt.rebuild();

 		} catch (e) {
 			if (!(e instanceof Error)) {
 				e = new Error(e);
 			}
 			console.error("failed", e.message);
 		}
 	}

    const fn_setFrmhsExpctWrhs = async function () {
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let yr = SBUxMethod.get("srch-dtp-yr");

    	if (gfn_isEmpty(yr)) {
  			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

 		const param = {
 			apcCd		: gv_selectedApcCd
 		  , prdcrCd		: prdcrCd
 		  , itemCd 		: itemCd
 		  , yr			: yr
 		}
 		jsonFrmhsExpctWrhs.length = 0;
 		try {
 			const postJsonPromise = gfn_postJSON(
 						"/am/wrhs/selectFrmhsExpctWrhsList.do",
 						param,
 						null,
 						false
 					);
 	        const data = await postJsonPromise;

 	        data.resultList.forEach((item, index) => {

 	        	const frmhsExpctWrhsVO = {
 	        			apcCd 				: item.apcCd
 	        		  , prdcrCd 			: item.prdcrCd
 	        		  , prdcrNm				: item.prdcrNm
 	        		  , crtrYm	            : item.crtrYm
 	        		  , rprsItemCd	        : item.rprsItemCd
 	        		  , rprsVrtyCd	        : item.rprsVrtyCd
 	        		  , frmhsAddr	        : item.frmhsAddr
 	        		  , frmhsCtpv	        : item.frmhsCtpv
 	        		  , frmhsTelno          : item.frmhsTelno
 	        		  , plntngPrcl          : fn_zero(item.plntngPrcl)
 	        		  , frmhsExpctWrhsNo    : item.frmhsExpctWrhsNo
 	        		  , hdofcExtrnlSeCd     : item.hdofcExtrnlSeCd
 	        		  , extrnlWarehouseCd   : item.extrnlWarehouseCd
 	        		  , hrvstYmd            : item.hrvstYmd
 	        		  , expctQntt           : fn_zero(item.expctQntt)
 	        		  , qltEvl        		: item.qltEvl
 	        		  , pic                 : item.pic
 	        		  , expctVlmVrss        : fn_zero(item.expctVlmVrss)
 	        		  , prchsCmptnYn        : item.prchsCmptnYn
 	        		  , rmrk                : item.rmrk
 	        		  , delYn               : item.delYn
 	        		  , ymd1Qntt            : fn_zero(item.ymd1Qntt)
 	        		  , ymd2Qntt            : fn_zero(item.ymd2Qntt)
 	        		  , ymd3Qntt            : fn_zero(item.ymd3Qntt)
 	        		  , ymd4Qntt            : fn_zero(item.ymd4Qntt)
 	        		  , ymd5Qntt            : fn_zero(item.ymd5Qntt)
 	        		  , ymd6Qntt            : fn_zero(item.ymd6Qntt)
 	        		  , ymd7Qntt            : fn_zero(item.ymd7Qntt)
 	        		  , ymd8Qntt            : fn_zero(item.ymd8Qntt)
 	        		  , ymd9Qntt            : fn_zero(item.ymd9Qntt)
 	        		  , ymd10Qntt           : fn_zero(item.ymd10Qntt)
 	        		  , ymd11Qntt           : fn_zero(item.ymd11Qntt)
 	        		  , ymd12Qntt           : fn_zero(item.ymd12Qntt)
 	        		  , ymd13Qntt           : fn_zero(item.ymd13Qntt)
 	        		  , ymd14Qntt           : fn_zero(item.ymd14Qntt)
 	        		  , ymd15Qntt           : fn_zero(item.ymd15Qntt)
 	        		  , ymd16Qntt           : fn_zero(item.ymd16Qntt)
 	        		  , ymd17Qntt           : fn_zero(item.ymd17Qntt)
 	        		  , ymd18Qntt           : fn_zero(item.ymd18Qntt)
 	        		  , ymd19Qntt           : fn_zero(item.ymd19Qntt)
 	        		  , ymd20Qntt           : fn_zero(item.ymd20Qntt)
 	        		  , ymd21Qntt           : fn_zero(item.ymd21Qntt)
 	        		  , ymd22Qntt           : fn_zero(item.ymd22Qntt)
 	        		  , ymd23Qntt           : fn_zero(item.ymd23Qntt)
 	        		  , ymd24Qntt           : fn_zero(item.ymd24Qntt)
 	        		  , ymd25Qntt           : fn_zero(item.ymd25Qntt)
 	        		  , ymd26Qntt           : fn_zero(item.ymd26Qntt)
 	        		  , ymd27Qntt           : fn_zero(item.ymd27Qntt)
 	        		  , ymd28Qntt           : fn_zero(item.ymd28Qntt)
 	        		  , ymd29Qntt           : fn_zero(item.ymd29Qntt)
 	        		  , ymd30Qntt           : fn_zero(item.ymd30Qntt)
 	        		  , ymd31Qntt           : fn_zero(item.ymd31Qntt)
 	        		  , tot                 : fn_zero(item.tot)
 	        	}
				jsonFrmhsExpctWrhs.push(frmhsExpctWrhsVO);
 	       });

 	       grdFrmhsExpctWrhs.rebuild();

 	       let useYn = data.resultList[0].useYn;
 	       let ddlnYmd = data.resultList[0].ddlnYmd;
 	       if (!gfn_isEmpty(useYn) && useYn == "Y") {

				let startDisabledYmdCol = grdFrmhsExpctWrhs.getColRef("ymd1Qntt");
				let endDisabledYmdCol = grdFrmhsExpctWrhs.getColRef("ymd"+ddlnYmd+"Qntt");
				grdFrmhsExpctWrhs.setCellDisabled(0, startDisabledYmdCol, grdFrmhsExpctWrhs.getRows() -1, endDisabledYmdCol, true);
				grdFrmhsExpctWrhs.setCellStyle('background-color', 0, startDisabledYmdCol, grdFrmhsExpctWrhs.getRows() -1, endDisabledYmdCol, '#ffffff');
 	       } else {
				grdFrmhsExpctWrhs.setCellDisabled(grdFrmhsExpctWrhs.getRows() -1, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, false);
 	       }

 		} catch (e) {
 			if (!(e instanceof Error)) {
 				e = new Error(e);
 			}
 			console.error("failed", e.message);
 		}
    }


    const fn_setLandInfo = async function () {
    	let prdcrCd  	= SBUxMethod.get("srch-inp-prdcrCd");
    	let yr		 	= SBUxMethod.get("srch-dtp-yr");
		const param = {
			apcCd		: gv_selectedApcCd
		  , prdcrCd		: prdcrCd
		  , yr 			: yr
		}
		jsonLandInfo.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectPrdcrLandInfoList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

	        data.resultList.forEach((item, index) => {

	        	const landInfoVO = item;

	        	jsonLandInfo.push(landInfoVO);
	        });

	        grdLandInfo.rebuild();
	        grdLandInfo.addRow(true);
	        grdLandInfo.setCellDisabled(0, 0, grdLandInfo.getRows() -1, grdLandInfo.getCols() -1, false);
	        grdLandInfo.setCellDisabled(grdLandInfo.getRows() -1, 0, grdLandInfo.getRows() -1, grdLandInfo.getCols() -1, true);

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
    }


    const fn_zero = function(val) {

    	if (gfn_isEmpty(val)) {
    		return "";
    	} else {
    		if (val == 0) {
    			return "";
    		} else {
    			return val;
    		}
    	}


    }

    const fn_ymdCellDisabled = function () {
    	let grdData = grdFrmhsExpctWrhs.getGridDataAll();

      	for (var i=1; i<=grdData.length; i++) {

      		let rowData = grdFrmhsExpctWrhs.getRowData(i);

      		let crtrYm = rowData.crtrYm;

      		if (!gfn_isEmpty(crtrYm)) {
      			let lastDay = parseInt(fn_getLastDayOfMonth(crtrYm)) + 1 ;

				if (32 != lastDay) {

					for (var j=lastDay; j<=31; j++) {
						let colKey =  "ymd"+j+"Qntt";
						let col = grdFrmhsExpctWrhs.getColRef(colKey);
						grdFrmhsExpctWrhs.setCellDisabled(j, col, j, col, true);
					}
				}
      		}
      	}
    }

    const fn_procLandInfo = function (gubun, nRow, nCol) {
    	if (gubun == "ADD") {
    		let rowData = grdLandInfo.getRowData(nRow);
    		grdLandInfo.setCellData(nRow, nCol, "N", true);

            btnClick = "Y";
    		grdLandInfo.addRow(true);
    		grdLandInfo.setCellDisabled(0, 0, grdLandInfo.getRows() -1, grdLandInfo.getCols() -1, false);
    		grdLandInfo.setCellDisabled(grdLandInfo.getRows() -1, 0, grdLandInfo.getRows() -1, grdLandInfo.getCols() -1, true);

    	} else if (gubun == "DEL") {

    		let rowData = grdLandInfo.getRowData(nRow);
    		let prdcrLandInfoNo = rowData.prdcrLandInfoNo ;
            btnClick = "N";

    		if (gfn_isEmpty(prdcrLandInfoNo)) {
    			grdLandInfo.deleteRow(nRow);
    		} else {
    			if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			fn_deletePrdcrLandInfo(rowData, nRow, "all")
        		}
    		}
    	}
    }


    const fn_procRowHstry = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		let rowData = grdCltvtnHstryPrdcr.getRowData(nRow);
    		grdCltvtnHstryPrdcr.setCellData(nRow, nCol, "N", true);
    		grdCltvtnHstryPrdcr.setCellData(nRow, grdCltvtnHstryPrdcr.getColRef("inputFlag"), true, true);
    		grdCltvtnHstryPrdcr.rebuild();
    		grdCltvtnHstryPrdcr.addRow(true);
    		grdCltvtnHstryPrdcr.setCellDisabled(0, 0, grdCltvtnHstryPrdcr.getRows() -1, grdCltvtnHstryPrdcr.getCols() -1, false);
    		grdCltvtnHstryPrdcr.setCellDisabled(grdCltvtnHstryPrdcr.getRows() -1, 0, grdCltvtnHstryPrdcr.getRows() -1, grdCltvtnHstryPrdcr.getCols() -1, true);

    	} else if (gubun == "DEL") {

    		let rowData = grdCltvtnHstryPrdcr.getRowData(nRow);
    		let cltvtnHstryNo = rowData.cltvtnHstryNo;

    		if (gfn_isEmpty(cltvtnHstryNo)) {
    			grdCltvtnHstryPrdcr.deleteRow(nRow);
    		} else {
    			if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			fn_del(rowData, nRow);
        		}
    		}
    	}
    }

    const fn_procPrdcrLandInfo = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		let rowData = grdPrdcrLandInfo.getRowData(nRow);
    		grdPrdcrLandInfo.setCellData(nRow, nCol, "N", true);

            btnClick = "Y";
    		grdPrdcrLandInfo.addRow(true);
    		grdPrdcrLandInfo.setCellDisabled(0, 0, grdPrdcrLandInfo.getRows() -1, grdPrdcrLandInfo.getCols() -1, false);
    		grdPrdcrLandInfo.setCellDisabled(grdPrdcrLandInfo.getRows() -1, 0, grdPrdcrLandInfo.getRows() -1, grdPrdcrLandInfo.getCols() -1, true);

    	} else if (gubun == "DEL") {

    		let rowData = grdPrdcrLandInfo.getRowData(nRow);
    		let prdcrLandInfoNo = rowData.prdcrLandInfoNo ;
            btnClick = "N";

    		if (gfn_isEmpty(prdcrLandInfoNo)) {
    			grdPrdcrLandInfo.deleteRow(nRow);
    		} else {
    			if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			fn_deletePrdcrLandInfo(rowData, nRow, "prdcr")
        		}
    		}
    	}
    }

    const fn_procRowExpct = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		grdFrmhsExpctWrhs.setCellData(nRow, nCol, "N", true);
    		grdFrmhsExpctWrhs.addRow(true);

    		grdFrmhsExpctWrhs.setCellDisabled(0, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, false);
    		grdFrmhsExpctWrhs.setCellDisabled(grdFrmhsExpctWrhs.getRows() -1, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, true);
    		let grdData = grdFrmhsExpctWrhs.getGridDataAll();
    		for (var i=0; i<grdData.length; i++) {

    			let rowData = grdData[i];
    			let frmhsExpctWrhsNo = rowData.frmhsExpctWrhsNo;

    			if (!gfn_isEmpty(frmhsExpctWrhsNo)) {

    				let prdcrCdCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
    				let crtrYmCol = grdFrmhsExpctWrhs.getColRef("crtrYm");

    				grdFrmhsExpctWrhs.setCellDisabled(0+1, prdcrCdCol, i+1, prdcrCdCol, true);
    				grdFrmhsExpctWrhs.setCellDisabled(0+1, crtrYmCol, i+1, crtrYmCol, true);

    				fn_ymdCellDisabled();
    			}
    		}

    	} else if (gubun == "DEL") {

    		if (grdFrmhsExpctWrhs.getRowStatus(nRow) == 0 || grdFrmhsExpctWrhs.getRowStatus(nRow) == 2){
        		if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			var frmhsExpctWrhsVO = grdFrmhsExpctWrhs.getRowData(nRow);
        			fn_del(frmhsExpctWrhsVO, nRow);
        		}
        	} else{
        		grdFrmhsExpctWrhs.deleteRow(nRow);
        	}

    	}
    }

    const fn_procRowQlt = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		grdCltvtnFrmhsQlt.setCellData(nRow, nCol, "N", true);
    		grdCltvtnFrmhsQlt.addRow(true);

    		grdCltvtnFrmhsQlt.setCellDisabled(0, 0, grdCltvtnFrmhsQlt.getRows() -1, grdCltvtnFrmhsQlt.getCols() -1, false);
    		grdCltvtnFrmhsQlt.setCellDisabled(grdCltvtnFrmhsQlt.getRows() -1, 0, grdCltvtnFrmhsQlt.getRows() -1, grdCltvtnFrmhsQlt.getCols() -1, true);

    		let grdData = grdCltvtnFrmhsQlt.getGridDataAll();
    		for (var i=0; i<grdData.length; i++) {

    			let rowData = grdData[i];
    			let cltvtnFrmhsQltNo = rowData.cltvtnFrmhsQltNo;

    			if (!gfn_isEmpty(cltvtnFrmhsQltNo)) {
    				let prdcrCdCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
    				grdCltvtnFrmhsQlt.setCellDisabled(0+2, prdcrCdCol, i+2, prdcrCdCol, true);
    			}
    		}

    	} else if (gubun == "DEL") {

    		if (grdCltvtnFrmhsQlt.getRowStatus(nRow) == 0 || grdCltvtnFrmhsQlt.getRowStatus(nRow) == 2) {
        		if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")) {
        			var cltvtnFrmhsQltVO = grdCltvtnFrmhsQlt.getRowData(nRow);
        			fn_del(cltvtnFrmhsQltVO, nRow);
        		}
        	} else {
        		grdCltvtnFrmhsQlt.deleteRow(nRow);
        	}

    	}

    }


	const fn_save = async function () {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "frmerInfoTab") {
			fn_saveFrmerInfo();
		}

		if (choiceTab == "frmhsQltTab") {
			fn_saveFrmhsQlt();
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			fn_saveFrmhsExpctWrhs();
		}

		if (choiceTab == "landInfoTab") {
			fn_saveLandInfo();
		}
	}

	const fn_saveLandInfo = async function () {

		let grdLandData = grdLandInfo.getGridDataAll();
		let yr = SBUxMethod.get("srch-dtp-yr");
		let landInfoList = [];

		if (gfn_isEmpty(yr)) {
			gfn_comAlert("W0001", "연도");		//	W0001	{0}을/를 선택하세요.
            return;
		}

		for (var i=1; i<=grdLandData.length; i++) {

			const rowData = grdLandInfo.getRowData(i);
			const rowSts = grdLandInfo.getRowStatus(i);

			if (rowData.delYn != "N") {
				continue;
			}

			if (gfn_isEmpty(rowData.prdcrCd)) {
				gfn_comAlert("W0001", "생산자");		//	W0001	{0}을/를 선택하세요.
	            return;
			}

			if (excelYn == "Y") {
				if (rowSts === 0 || rowSts === 2){
					rowData.apcCd = gv_selectedApcCd;
					rowData.yr = yr;
					rowData.rowSts = "I";
					landInfoList.push(rowData);
				}  else {
					continue;
				}
			} else {
				if (rowSts === 3){
					rowData.apcCd = gv_selectedApcCd;
					rowData.yr = yr;
					rowData.rowSts = "I";
					landInfoList.push(rowData);
				} else if (rowSts === 2) {
					rowData.rowSts = "U";
					rowData.yr = yr;
					landInfoList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (landInfoList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
            console.log("landInfoList: ", landInfoList);
    		return;
    	}

		const postJsonPromise = gfn_postJSON("/am/wrhs/multiPrdcrLandInfoList.do", landInfoList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
        excelYn = "N";


	}

	/**
	 * @name fn_saveFrmerInfo
	 * @description 영농일지 저장
	 */
	const fn_saveFrmerInfo = async function () {
		let yr = SBUxMethod.get("srch-dtp-yr");
		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");
		let prdcr = _.find(jsonPrdcrDtl, {prdcrCd: prdcrCd});
		let prdcrChgYn = false;

		let prdcrVO = null;
		let cltvtnFrmhsQltVO = null;

		let frmhsAddr = SBUxMethod.get("dtl-inp-frmhsAddr");
		let frmhsCtpv = SBUxMethod.get("dtl-inp-frmhsCtpv");
		let frmhsTelno = SBUxMethod.get("dtl-inp-frmhsTelno");
		let plntngPrcl = SBUxMethod.get("dtl-inp-plntngPrcl");
		let prchsQntt = SBUxMethod.get("dtl-inp-prchsQntt");
		let prchsAmt = SBUxMethod.get("dtl-inp-prchsAmt");
		let crtrPrcl = SBUxMethod.get("dtl-inp-crtrPrcl");
		let prdcrLinkCd = SBUxMethod.get("dtl-inp-prdcrLinkCd");
		let frmerno = SBUxMethod.get("dtl-inp-frmerno");

		if (prdcr.frmhsAddr 	!= 	frmhsAddr 	||
			prdcr.frmhsCtpv 	!=  frmhsCtpv	||
			prdcr.frmhsTelno 	!=  frmhsTelno
		   ) {

				prdcr.frmhsAddr 	= frmhsAddr;
				prdcr.frmhsCtpv 	= frmhsCtpv;
				prdcr.frmhsTelno 	= frmhsTelno;
				prdcr.apcCd			= gv_selectedApcCd;
				prdcrVO = prdcr;
			}
		let cltvtnListVO = null;

		if (prdcrVO != null) {
			cltvtnListVO = {'prdcrVO' : prdcrVO};
			prdcrChgYn = true;
		}

		/** 영농일지 - 재배 기본정보**/
		let rowSts = grdCltvtnFrmhsQltPrdcr.getRowStatus(2);
		if (rowSts == 2 || rowSts == 3) {
			cltvtnFrmhsQltVO = grdCltvtnFrmhsQltPrdcr.getRowData(2);
			if (gfn_isEmpty(cltvtnFrmhsQltVO.cltvtnFrmhsQltNo)) {
				cltvtnFrmhsQltVO.apcCd  = gv_selectedApcCd;
				cltvtnFrmhsQltVO.prdcrCd = prdcrCd;
				cltvtnFrmhsQltVO.rowSts = "I";
			} else {
				cltvtnFrmhsQltVO.rowSts = "U";
			}
		}



		if (cltvtnFrmhsQltVO != null) {

			if (cltvtnListVO == null) {
				cltvtnListVO = {'cltvtnFrmhsQltVO' : cltvtnFrmhsQltVO}
			} else {
				cltvtnListVO.cltvtnFrmhsQltVO = cltvtnFrmhsQltVO;
			}

		}

		/** 영농일지 - 농지정보**/
		let grdLandData = grdPrdcrLandInfo.getGridDataAll();

		let prdcrLandInfoList = [];

		for (var k=1; k<=grdLandData.length; k++) {
			let rowData = grdPrdcrLandInfo.getRowData(k);
			let rowSts = grdPrdcrLandInfo.getRowStatus(k);
			let prdcrLandInfoNo = rowData.prdcrLandInfoNo;
			let delYn = rowData.delYn;

			if (!gfn_isEmpty(delYn)) {
				if (rowSts === 3) {
					rowData.rowSts 		= "I";
					rowData.apcCd 		= gv_selectedApcCd;
					rowData.prdcrCd 	= prdcrCd;
					rowData.mngmstRegno = prdcrLinkCd;
					rowData.frmerno 	= frmerno;
					rowData.yr			= yr;
					prdcrLandInfoList.push(rowData)
				}

				if (rowSts === 2) {
					rowData.rowSts 		= "U";
					rowData.apcCd 		= gv_selectedApcCd;
					rowData.prdcrCd 	= prdcrCd;
					rowData.mngmstRegno = prdcrLinkCd;
					rowData.frmerno 	= frmerno;
					prdcrLandInfoList.push(rowData)
				}
			}
		}

		if (prdcrLandInfoList.length != 0) {
			if (cltvtnListVO == null) {
				cltvtnListVO = {'prdcrLandInfoList' : prdcrLandInfoList}
			} else {
				cltvtnListVO.prdcrLandInfoList = prdcrLandInfoList;
			}
		}

		/** 영농일지 - 재배 이력**/
		let grdCltvtnHstryData = grdCltvtnHstryPrdcr.getGridDataAll();
		console.log("griddataall",grdCltvtnHstryData);

		let cltvtnHstryList = [];

		for (var i=0; i<grdCltvtnHstryData.length; i++) {

			let rowData = grdCltvtnHstryPrdcr.getRowData(i+2);
			if (!gfn_isEmpty(rowData.delYn)) {
				if (gfn_isEmpty(rowData.cfmtnYmd)) {
					gfn_comAlert("W0002","확인일자"); 	//W0002 {0}을/를 입력하세요.
					return;
				}
			}

			let rowSts = grdCltvtnHstryPrdcr.getRowStatus(i+2);
			let fileName = rowData.fileName;
			let cltvtnHstryNo = rowData.cltvtnHstryNo;
			let delYn = rowData.delYn;

			if (!gfn_isEmpty(delYn)) {

				if (gfn_isEmpty(cltvtnHstryNo)) {

					if (rowSts === 2 ) {
						rowData.rowSts = "I";
						rowData.apcCd = gv_selectedApcCd;
						rowData.prdcrCd = prdcrCd;
						rowData.prdcrLandInfoNo = choicePrdcrLandInfoNo;

						if (!gfn_isEmpty(fileName)) {
							let fileId = 'inp-file-' + (i+2);
					    	let fileInput = document.getElementById(fileId);
							let file = fileInput.files[0];
							const base64File = await fileToBase64(file);

							const comAtchflVO = {
									prntsTblSeCd	: '01'
								  , atchflOrgnNm	: file.name
								  , atchflSz		: file.size
								  , atchflExtnType	: file.type
								  , base64File		: base64File
							};

					    	rowData.comAtchflVO = comAtchflVO;
						}

						cltvtnHstryList.push(rowData);
					}
				} else {

					if (rowSts === 2) {
						rowData.rowSts = "U";

						if (!gfn_isEmpty(fileName)) {
							let fileId = 'inp-file-' + (i+2);
					    	let fileInput = document.getElementById(fileId);
							let file = fileInput.files[0];
							const base64File = await fileToBase64(file);

							const comAtchflVO = {
									prntsTblSeCd	: '01'
								  , atchflOrgnNm	: file.name
								  , atchflSz		: file.size
								  , atchflExtnType	: file.type
								  , base64File		: base64File
							};

					    	rowData.comAtchflVO = comAtchflVO;
						}

						cltvtnHstryList.push(rowData);
					}
				}
			}

		}

		if (cltvtnHstryList.length != 0) {
			if (cltvtnListVO == null) {
				cltvtnListVO = {'cltvtnHstryList' : cltvtnHstryList}
			} else {
				cltvtnListVO.cltvtnHstryList = cltvtnHstryList;
			}
		}

		if (cltvtnListVO == null) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
			return;
		}

    	if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?

			const postJsonPromise = gfn_postJSON("/am/wrhs/multiFrmerInfoList.do", cltvtnListVO);
    		const data = await postJsonPromise;
    		try{
        		if (_.isEqual("S", data.resultStatus)) {
        			fn_search();
           			gfn_comAlert("I0001");					// I0001 처리 되었습니다.

           			if (prdcrChgYn) {
           				// 생산자 정보 업데이트
           				await gfn_setPrdcrSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdPrdcr, 				gv_selectedApcCd)		// Grid 생산자
           				prdcrChgYn = false;
           			}
            	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
            } catch (e) {
        		if (!(e instanceof Error)) {
        			e = new Error(e);
        		}
        		console.error("failed", e.message);
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    		}
    	}
	}

	 const fileToBase64 = (file) => new Promise((resolve, reject) => {
	        const reader = new FileReader();
	        reader.onload = () => resolve(reader.result.split(',')[1]);  // Base64 문자열만 추출
	        reader.onerror = reject;
	        reader.readAsDataURL(file);
	});


	const fn_del = async function (deleteVO, nRow) {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "frmerInfoTab") {
			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteCltvtnHstry.do", deleteVO);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			grdCltvtnHstryPrdcr.deleteRow(nRow);
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

		if (choiceTab == "frmhsQltTab") {

			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteCltvtnFrmhsQlt.do", deleteVO);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			grdCltvtnFrmhsQlt.deleteRow(nRow);
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteFrmhsExpctWrhs.do", deleteVO);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			grdFrmhsExpctWrhs.deleteRow(nRow);
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}
	}

	const fn_deletePrdcrLandInfo = async function(deleteVO, nRow, tab) {

		const postJsonPromise = gfn_postJSON("/am/wrhs/deletePrdcrLandInfo.do", deleteVO);
    	const data = await postJsonPromise;

    	try{
    		if (_.isEqual("S", data.resultStatus)) {

    			if (tab == "prdcr") {
	    			grdPrdcrLandInfo.deleteRow(nRow);
    			}

    			if (tab == "all") {
    				grdLandInfo.deleteRow(nRow);
    			}

        	} else {
	    		gfn_comAlert(data.resultCode, data.resultMessage);
	    	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	const fn_saveFrmhsQlt = async function () {

		let grdData = grdCltvtnFrmhsQlt.getGridDataAll();

		let cltvtnFrmhsQltList = [];

		for (var i=0; i<grdData.length; i++) {
			let rowData = grdCltvtnFrmhsQlt.getRowData(i+2);
			let rowSts = grdCltvtnFrmhsQlt.getRowStatus(i+2);
			let delYn = rowData.delYn;
			let cltvtnFrmhsQltNo = rowData.cltvtnFrmhsQltNo

			if (gfn_isEmpty(cltvtnFrmhsQltNo)) {
			 	if (rowSts === 2){
					rowData.rowSts = "I";
					cltvtnFrmhsQltList.push(rowData);
				} else {
					continue;
				}
			} else {
				if (rowSts === 2){
					rowData.rowSts = "U";
					cltvtnFrmhsQltList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (cltvtnFrmhsQltList.length == 0) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
			return;
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wrhs/multiCltvtnFrmhsQltList.do", cltvtnFrmhsQltList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
		    		fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

	}

	const fn_saveFrmhsExpctWrhs = async function () {

		let grdData = grdFrmhsExpctWrhs.getGridDataAll();

		let frmhsExpctWrhsList = [];

		for (var i=0; i<grdData.length; i++) {
			let rowData = grdFrmhsExpctWrhs.getRowData(i+1);
			let rowSts = grdFrmhsExpctWrhs.getRowStatus(i+1);
			let delYn = rowData.delYn;
			let frmhsExpctWrhsNo = rowData.frmhsExpctWrhsNo



			if (gfn_isEmpty(frmhsExpctWrhsNo)) {
			 	if (rowSts === 2){
					rowData.rowSts = "I";
					let frmhsExpctWrhsDtlList = [];

					for (var j=1; j<=31; j++) {

						let ymdKey = "ymd" + j + "Qntt";

						let qntt = rowData[ymdKey];

						if (!gfn_isEmpty(qntt) && qntt > 0) {
							if (gfn_isEmpty(rowData.crtrYm)) {
								gfn_comAlert("W0005", "기준연월");		//	W0005	{0}이/가 없습니다.
								return;
							}

							let frmhsExpctWrhsDtl = {
								apcCd 		: gv_selectedApcCd
							  , prdcrCd 	: rowData.prdcrCd
							  , crtrYr 		: rowData.crtrYm.substr(0, 4)
							  , crtrMm 		: rowData.crtrYm.substr(4, 2)
							  , ymd			: j
							  , qntt		: qntt
							}

							frmhsExpctWrhsDtlList.push(frmhsExpctWrhsDtl);
						}
					}

					if (frmhsExpctWrhsDtlList.length > 0) {
						rowData.frmhsExpctWrhsDtlList = frmhsExpctWrhsDtlList;
					}

					frmhsExpctWrhsList.push(rowData);
				} else {
					continue;
				}
			} else {
				if (rowSts === 2){
					rowData.rowSts = "U";
					let frmhsExpctWrhsDtlList = [];

					for (var j=1; j<=31; j++) {

						let ymdKey = "ymd" + j + "Qntt";

						let qntt = rowData[ymdKey];

						if (gfn_isEmpty(qntt)) {
							qntt = 0;
						}

						if (gfn_isEmpty(rowData.crtrYm)) {
							gfn_comAlert("W0005", "기준연월");		//	W0005	{0}이/가 없습니다.
							return;
						}

						let frmhsExpctWrhsDtl = {
							apcCd 				: gv_selectedApcCd
						  , prdcrCd 			: rowData.prdcrCd
						  , frmhsExpctWrhsNo 	: rowData.frmhsExpctWrhsNo
						  , crtrYr 				: rowData.crtrYm.substr(0, 4)
						  , crtrMm 				: rowData.crtrYm.substr(4, 2)
						  , ymd					: j
						  , qntt				: qntt
						}

						frmhsExpctWrhsDtlList.push(frmhsExpctWrhsDtl);
					}

					if (frmhsExpctWrhsDtlList.length > 0) {
						rowData.frmhsExpctWrhsDtlList = frmhsExpctWrhsDtlList;
					}

					frmhsExpctWrhsList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (frmhsExpctWrhsList.length == 0) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
			return;
		}
		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wrhs/multiFrmhsExpctWrhsList.do", frmhsExpctWrhsList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
		    		fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}


	}


    /* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	 const fn_getPrdcrs = async function() {
			jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
			jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
			jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
			jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
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
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){

		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
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
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

    /**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {
		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr)
		}
	}



	const fn_setPrdcrForm = async function(prdcr) {
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}

    /**
     * @name fn_modalStdgCd
     * @description 법정동코드선택팝업 호출
     */
    const fn_modalStdgCd = function() {
        let nRow = grdLandInfo.getRow();
        let stdgCd = nRow.stdgCd;

        SBUxMethod.openModal('modal-stdgCd');

        popStdgCd.init(gv_selectedApcCd, gv_selectedApcNm, stdgCd, fn_setStdg);
    }

    /**
     * @name fn_setStdg
     * @description 법정동코드선택 callback
     */
    const fn_setStdg = function(stdg) {
        let choiceTab = SBUxMethod.get("idxTab_norm");
        let nRow;
        let stdgCdCol;

        switch(choiceTab) {
            case "frmerInfoTab":
                nRow = grdPrdcrLandInfo.getRow();
                stdgCdCol = grdPrdcrLandInfo.getColRef("stdgCd");

                if(!gfn_isEmpty(stdg)) {
                    let gridData = grdPrdcrLandInfo.getGridDataAll();
                    if(gridData.length > 2) {
                        grdPrdcrLandInfo.setCellData(nRow, stdgCdCol, stdg.stdgCd);

                        if(btnClick == "Y") {
                            grdPrdcrLandInfo.setRowStatus(nRow, 3);
                        } else {
                            grdPrdcrLandInfo.setRowStatus(nRow, 2);
                        }
                    } else {
                        grdPrdcrLandInfo.setCellData(nRow, stdgCdCol, stdg.stdgCd);
                    }

                    btnClick = "N"
                    grdPrdcrLandInfo.refresh();
                }
                break;
            case "landInfoTab":
                nRow = grdLandInfo.getRow();
                stdgCdCol = grdLandInfo.getColRef("stdgCd");

                if(!gfn_isEmpty(stdg)) {
                    let gridData = grdLandInfo.getGridDataAll();
                    if(gridData.length > 2) {
                        grdLandInfo.setCellData(nRow, stdgCdCol, stdg.stdgCd);

                        if(btnClick == "Y") {
                            grdLandInfo.setRowStatus(nRow, 3);
                        } else {
                            grdLandInfo.setRowStatus(nRow, 2);
                        }
                    } else {
                        grdLandInfo.setCellData(nRow, stdgCdCol, stdg.stdgCd);
                    }

                    btnClick = "N"
                    grdLandInfo.refresh();
                }
                break;
            default:
                break;
        }
    }

	/*
	* 상세 정보 생산자 팝업 관련 function
	* Start
	*/
	/**
	 * @name fn_onInputPrdcrDtlNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNmDtl = function(prdcrNm){
		fn_clearPrdcrDtl();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("dtl-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocompleteDtl = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrDtlNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNmDtl(value, label, item) {

		SBUxMethod.set("dtl-inp-prdcrCd", value);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcrDtl, {prdcrCd: value});
		fn_setPrdcrFormDtl(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcrDtl
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcrDtl = function() {
 		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-frmerno", "");
		SBUxMethod.set("dtl-inp-prdcrLinkCd", "");
		SBUxMethod.set("dtl-inp-frmhsTelno", "");
		SBUxMethod.set("dtl-inp-frmhsCtpv", "");
		SBUxMethod.set("dtl-inp-frmhsAddr", "");
		SBUxMethod.set("dtl-inp-crtrPrcl", "");
		SBUxMethod.set("dtl-inp-plntngPrcl", "");
		SBUxMethod.set("dtl-inp-landCrtrArea", "");
		SBUxMethod.set("dtl-inp-landPlntngArea", "");
		SBUxMethod.set("dtl-inp-prchsQntt", "");
		SBUxMethod.set("dtl-inp-prchsAmt", "");
		SBUxMethod.set("dtl-inp-crtrPrclSquareFootage", "");
		SBUxMethod.set("dtl-inp-plntngPrclSquareFootage", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcrDtl
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcrDtl = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcrDtl, SBUxMethod.get("dtl-inp-prdcrNm"), false, SBUxMethod.get("srch-dtp-yr"));
	}

    /**
	 * @name fn_setPrdcrDtl
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcrDtl = function(jsonPrdcrDtl) {

		if (!gfn_isEmpty(jsonPrdcrDtl)) {

			SBUxMethod.set("dtl-inp-prdcrNm", jsonPrdcrDtl.prdcrNm);
			SBUxMethod.set("dtl-inp-prdcrCd", jsonPrdcrDtl.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrLinkCd", jsonPrdcrDtl.prdcrLinkCd);
			SBUxMethod.set("dtl-inp-frmhsTelno", jsonPrdcrDtl.frmhsTelno);
			SBUxMethod.set("dtl-inp-frmhsCtpv", jsonPrdcrDtl.frmhsCtpv);
			SBUxMethod.set("dtl-inp-frmhsAddr", jsonPrdcrDtl.frmhsAddr);
			SBUxMethod.set("dtl-inp-crtrPrcl", jsonPrdcrDtl.crtrPrcl);
			SBUxMethod.set("dtl-inp-plntngPrcl", jsonPrdcrDtl.plntngPrcl);
			SBUxMethod.set("dtl-inp-landCrtrArea", jsonPrdcrDtl.landCrtrArea);
			SBUxMethod.set("dtl-inp-landPlntngArea", jsonPrdcrDtl.landPlntngArea);
			SBUxMethod.set("dtl-inp-prchsQntt", jsonPrdcrDtl.prchsQntt);
			SBUxMethod.set("dtl-inp-prchsAmt", jsonPrdcrDtl.prchsAmt);
			SBUxMethod.set("dtl-inp-frmerno", jsonPrdcrDtl.frmerno);

			if (!gfn_isEmpty(jsonPrdcrDtl.crtrPrcl)) {
				SBUxMethod.set("dtl-inp-crtrPrclSquareFootage", Math.round(parseInt(jsonPrdcrDtl.crtrPrcl) * 3.3));
			} else {
				SBUxMethod.set("dtl-inp-crtrPrclSquareFootage", "");
			}
			if (!gfn_isEmpty(jsonPrdcrDtl.plntngPrcl)) {
				SBUxMethod.set("dtl-inp-plntngPrclSquareFootage", Math.round(parseInt(jsonPrdcrDtl.plntngPrcl) * 3.3));
			} else {
				SBUxMethod.set("dtl-inp-plntngPrclSquareFootage", "");
			}
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}

		if (!gfn_isEmpty(jsonPrdcrDtl.frmerno)) {

		}
	}

	const fn_setPrdcrFormDtl = async function(prdcrDtl) {
		if (!gfn_isEmpty(prdcrDtl)) {
			SBUxMethod.set("dtl-inp-prdcrNm", prdcrDtl.prdcrNm);
			SBUxMethod.set("dtl-inp-prdcrCd", prdcrDtl.prdcrCd);
			SBUxMethod.set("dtl-inp-frmhsTelno", prdcrDtl.frmhsTelno);
			SBUxMethod.set("dtl-inp-prdcrLinkCd", prdcrDtl.prdcrLinkCd);
			SBUxMethod.set("dtl-inp-frmhsCtpv", prdcrDtl.frmhsCtpv);
			SBUxMethod.set("dtl-inp-frmhsAddr", prdcrDtl.frmhsAddr);
			SBUxMethod.set("dtl-inp-crtrPrcl", prdcrDtl.crtrPrcl);
			SBUxMethod.set("dtl-inp-plntngPrcl", prdcrDtl.plntngPrcl);
			SBUxMethod.set("dtl-inp-landCrtrArea", prdcrDtl.landCrtrArea);
			SBUxMethod.set("dtl-inp-landPlntngArea", prdcrDtl.landPlntngArea);
			SBUxMethod.set("dtl-inp-prchsQntt", prdcrDtl.prchsQntt);
			SBUxMethod.set("dtl-inp-prchsAmt", prdcrDtl.prchsAmt);
			SBUxMethod.set("dtl-inp-frmerno", prdcrDtl.frmerno);
			if (!gfn_isEmpty(prdcrDtl.crtrPrcl)) {
				SBUxMethod.set("dtl-inp-crtrPrclSquareFootage", Math.round(parseInt(prdcrDtl.crtrPrcl) * 3.3));
			} else {
				SBUxMethod.set("dtl-inp-crtrPrclSquareFootage", "");
			}
			if (!gfn_isEmpty(prdcrDtl.plntngPrcl)) {
				SBUxMethod.set("dtl-inp-plntngPrclSquareFootage", Math.round(parseInt(prdcrDtl.plntngPrcl) * 3.3));
			} else {
				SBUxMethod.set("dtl-inp-plntngPrclSquareFootage", "");
			}
		} else {
			SBUxMethod.set("dtl-inp-frmerno", "");
			SBUxMethod.set("dtl-inp-prdcrLinkCd", "");
			SBUxMethod.set("dtl-inp-frmhsTelno", "");
			SBUxMethod.set("dtl-inp-frmhsCtpv", "");
			SBUxMethod.set("dtl-inp-frmhsAddr", "");
			SBUxMethod.set("dtl-inp-crtrPrcl", "");
			SBUxMethod.set("dtl-inp-plntngPrcl", "");
			SBUxMethod.set("dtl-inp-landCrtrArea", "");
			SBUxMethod.set("dtl-inp-landPlntngArea", "");
			SBUxMethod.set("dtl-inp-prchsQntt", "");
			SBUxMethod.set("dtl-inp-prchsAmt", "");
			SBUxMethod.set("dtl-inp-crtrPrclSquareFootage", "");
			SBUxMethod.set("dtl-inp-plntngPrclSquareFootage", "");
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
		}
	}

	/*
	* 상세 정보 생산자 팝업 관련 function
	* End
	*/


	const fn_ddln = async function () {

		let yr = SBUxMethod.get("srch-dtp-yr");
		SBUxMethod.openModal('modal-ddln');
		popDdln.init(gv_selectedApcCd, yr);
	}


	const fn_yrChange = async function (yr) {
		jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd, yr);
		jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
		jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd, yr);
		jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
	}

	var grdExpLandInfo;					// 그리드 농지정보(grid)
	var grdExpPrdcr;					// 그리드 생산자(grid)
	var jsonExpLandInfo 		= [];	// 그리드 농지정보
	var jsonExpPrdcr 			= [];	// 그리드 생산자
	var jsonExpSltPrdcr			= [];	// 엑셀 생산자
	var jsonLandInfoBackUp 		= [];

	const importExcelDataLandInfo = function (e){
		jsonExpLandInfo = 0;
		grdLandInfo.rebuild();
		jsonLandInfoBackUp = jsonLandInfo;
		grdLandInfo.importExcelData(e,1,1);
     }


	const fn_setSltJson = async function() {
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		jsonExpSltPrdcr 				= gfn_cloneJson(jsonGrdPrdcr);				// 생산자
	}

	const fn_setExpJson = async function() {
		// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// export grid data
		jsonExpLandInfo.length = 0;

		jsonExpPrdcr 			= gfn_cloneJson(jsonExpPrdcr);			// 엑셀 품목Json
	}

	function fn_excelDwnldLandInfo () {
		if (gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?\n (확인 클릭 시 xlsx, 취소 클릭 시 xls)")) {
    		grdLandInfo.exportData("xlsx","농지정보",true);
    	} else {
    		grdLandInfo.exportLocalExcel("농지정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    	}
	}

	function fn_dwnld () {

		fn_setSltJson();
		fn_setExpJson();

		/*
		jsonExpPrdcr.length = 0;
		jsonApcPrdcr.forEach((prdcr) => {
			jsonExpPrdcr.push(prdcr);
		});
		*/
		const expColumns = fn_getExpColumns();
		const expObjList = [
		{
			sbGrid: grdExpLandInfo,
	        parentid: "sbexp-area-grdExpLandInfo",
	        id: "grdExpLandInfo",
	        jsonref: "jsonExpLandInfo",
			columns: expColumns,
	        sheetName: "농지정보등록내역",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpPrdcr,
	        parentid: "sbexp-area-grdExpPrdcr",
	        id: "grdExpPrdcr",
	        jsonref: "jsonGrdPrdcr",
			columns: [
		    	{caption: ["생산자코드"],   ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
		        {caption: ["생산자명"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}
			],
	        sheetName: "생산자",
	        title: "",
	        unit: ""
		}];

		fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드

		let fileName = "농지정보등록(샘플).xlsx";
		gfn_exportExcelMulti(fileName, expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			exp.sbGrid.addRow(true);
		});
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		//	엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		//넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}

	const fn_getExpColumns = function() {
		let _columns = fn_getPrdcrColumns();

		return _columns;
	}

	const fn_getPrdcrColumns = function() {
		const _columns = [
			{caption: ['생산자'], 		ref: 'prdcrCd', 	width: '200px', type:'inputcombo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	    	{caption : ['위치'], 		ref: 'frlnAddr', 	type: 'input', 	width: '400px', style: 'text-align:left; background:#FFF8DC;', typeinfo : {maxlength : 70}},
	    	{caption : ['계약(평)'], 	ref: 'crtrArea', 	type: 'input', 	width: '100px', style: 'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}, maxlength : 6},
	    	{caption : ['정식(평)'], 	ref: 'plntngArea', 	type: 'input', 	width: '100px', style: 'text-align: right;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}, maxlength : 6},
	    	{caption : ['법정동'], 		ref: 'stdgCd', 		type: 'input', 	width: '120px', style: 'text-align:center', typeinfo : {minlength : 10, maxlength : 10, mask : {alias : 'numeric'}}},
	    	{caption : ['본번'], 		ref: 'frlnMno', 	type: 'input', 	width: '80px', style: 'text-align:center', typeinfo : {maxlength : 4, mask : {alias : 'numeric'}}},
	    	{caption : ['부번'], 		ref: 'frlnSno', 	type: 'input', 	width: '80px', style: 'text-align:center', typeinfo : {maxlength : 4, mask : {alias : 'numeric'}}},
		];
		return _columns;

	}
	function fn_uld () {
		document.querySelector("#btnFileUploadLandInfo").value = "";
		$("#btnFileUploadLandInfo").click();
	}

	const setDataAfterImport = function (e){
		let allData = grdLandInfo.getGridDataAll();
		for(var i=1; i<=allData.length; i++){
			let rowData = grdLandInfo.getRowData(i, false) // deep copy;

			let prdcrCd 		= $.trim(rowData.prdcrCd);

			// 상품구분 명 or 코드 일치 검사
			for(var j=0; j<jsonGrdPrdcr.length; j++){
				if(jsonGrdPrdcr[j].text == prdcrCd || jsonGrdPrdcr[j].value == prdcrCd){
					rowData.prdcrCd = jsonGrdPrdcr[j].value;
					break;
				}
			}

			rowData.delYn = "N";
			rowData.rowSts = "I";
			excelYn = "Y";
			grdLandInfo.rebuild();
		}
	}


</script>
</html>