<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 생산자조직 총괄표 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					 -->
				</c:if>
				<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType ne '21'}">
					<sbux-button id="btnSearchFclt2" name="btnSearchFclt2" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch01"></sbux-button>
					<!--
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="생산자조직 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch01"></sbux-button>
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="생산자조직 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList01"></sbux-button>
					 -->
				</c:if>
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
				</div>

			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">

						<col style="width: 11%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >신청년도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-spinner
									id="srch-input-yr"
									name="srch-input-yr"
									uitype="normal"
                					step-value="1"
                				></sbux-spinner>
                				<sbux-checkbox
                					id="srch-input-yrChk"
                					name="srch-input-yrChk"
                					uitype="normal"
									text="해당년도 신청사용자만 보기"
									text-left-padding="5px"
									text-right-padding="25px"
									true-value="Y"
									false-value="N"
									checked
									></sbux-checkbox>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg" >관할기관</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-cmptnInst"
									name="srch-input-cmptnInst"
									uitype="single"
									jsondata-ref="jsonComCmptnInst"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th colspan="2" scope="row" class="th_bg" >시도</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-ctpv"
									name="srch-input-ctpv"
									uitype="single"
									jsondata-ref="jsonComCtpv"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">법인구분</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-corpSeCd"
									name="srch-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpSeCd"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">법인형태</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select
									id="srch-input-corpDtlSeCd"
									name="srch-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpDtlSeCd"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th colspan="2" scope="row" class="th_bg">통합조직여부</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-aprv"
									name="srch-input-aprv"
									uitype="single"
									jsondata-ref="jsonComAprv"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">신청대상구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-aplyTrgtSe"
									name="srch-input-aplyTrgtSe"
									uitype="single"
									jsondata-ref="jsonComAplyTrgtSe"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">조직구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-apoSe"
									name="srch-input-apoSe"
									uitype="single"
									jsondata-ref="jsonComApoSe"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td class="td_input"></td>

							<th colspan="2" scope="row" class="th_bg">생산자조직 보유 여부</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-frmhsHldYn"
									name="srch-input-frmhsHldYn"
									uitype="single"
									jsondata-ref="jsonComFrmhsHldYnYn"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
						</tr>
						<tr>
							<th scope="row" class="th_bg">통합조직 사업자번호로 검색</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-uoBrno"
									name="srch-input-uoBrno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-brno"
									name="srch-input-brno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"></td>

							<th colspan="2" scope="row" class="th_bg">법인명</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
							<!--
							<td colspan="6" class="td_input" style="border-right: hidden;border-bottom: hidden;">
							-->
						</tr>
					</tbody>
				</table>

			</c:if>
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<!-- 조직 리스트 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶검색리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<!-- 생산자 조직 리스트 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch01"></sbux-button>
						<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">조직구분</th>
							<td colspan="2" class="td_input">
								<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-crno" name="dtl-input-crno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-uoCd" name="dtl-input-uoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
								<sbux-select
									id="dtl-input-apoSe"
									name="dtl-input-apoSe"
									uitype="single"
									jsondata-ref="jsonComApoSe"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<!--
							<td class="td_input">
							 -->
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">통합조직 선택</th>
							<td colspan="2" class="td_input">
								<sbux-select
									id="dtl-input-selUoBrno"
									name="dtl-input-selUoBrno"
									uitype="single"
									jsondata-ref="comUoBrno"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_changeSelUoBrno"
								></sbux-select>
							</td>
							<!--
							<td class="td_input"  style="border-left: hidden;">
							<td colspan="5" class="td_input"  style="border-left: hidden;">
							</td>
							 -->
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 상세보기-->
				<!-- 생산자조직 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶총괄표</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:350px; width: 100%;"></div>
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="updateStbltYn1" name="updateStbltYn1" uitype="normal" text="적합여부 Y으로 변경" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn(1)"></sbux-button>
							<sbux-button id="updateStbltYn2" name="updateStbltYn2" uitype="normal" text="적합여부 N으로 변경" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn(2)"></sbux-button>
							<sbux-button id="updateStbltYn3" name="updateStbltYn3" uitype="normal" text="적합여부 빈칸으로 초기화" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn"></sbux-button>
						</div>
					</div>
					<div style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<p>원래의 적합여부로 적용 하려면 생산자조직현황 에서 변경한 생산자조직의 농가리스트 저장</p>
						</div>
					</div>
				</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		var now = new Date();
		var year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

		fn_init();

		const elements = document.querySelectorAll(".srch-keyup-area");

		for (let i = 0; i < elements.length; i++) {
		  	const el = elements.item(i);
		  	el.addEventListener("keyup", (event) => {
		  		if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
		  			fn_search();
		  		}
		  		//key	Enter
		  		//keyCode
		  	});
		}

	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		fn_fcltMngCreateGrid();
	</c:if>
		fn_fcltMngCreateGrid01();
		//fn_fcltMngCreateGrid02();

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType ne '21'}">
		await fn_dtlSearch();
	</c:if>
	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분

	var jsonDtlComTrmtType = [];//취급유형

	var jsonGrdComAprv = [];//승인형/육성형 구분
	var jsonGrdComCorpSeCd = [];//시군
	var jsonGrdComCtpv = [];//시군
	var jsonGrdComSgg = [];//시군

	var jsonGrdComSttgUpbrItemSe = [];//품목구분
	var jsonGrdComCtgryCd = [];//분류코드


	//통합조직,출하조직
	var jsonComApoSe = [
		{'text': '통합조직','label': '통합조직', 'value': '1'},
		{'text': '출자출하조직','label': '출자출하조직', 'value': '2'}
	];
	//통합조직,출하조직
	var jsonGrdComApoSe = [
		{'text': '통합조직','label': '통합조직', 'value': '1'},
		{'text': '출자출하조직','label': '출자출하조직', 'value': '2'}
	];
	//생산자조직 보유 여부
	var jsonComFrmhsHldYnYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		console.log("============fn_initSBSelect============");
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 		'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('dtl-input-trmtType', 		jsonDtlComTrmtType, 	'TRMT_TYPE'), //취급유형

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComAprv, 		'APRV_UPBR_SE_CD'), //승인형/육성형 구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComSgg, 			'CMPTN_INST_SIGUN'),//시군

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdComSttgUpbrItemSe, 	'STTG_UPBR_ITEM_SE'), //품목구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdComCtgryCd, 	'CTGRY_CD'), //분류코드
		]);
	}

	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	const objMenuList = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld,			//콜백함수명
	        }
	    };


	function fn_excelDwnld() {
		grdPrdcrOgnCurntMng.exportLocalExcel("생산자조직 관리(총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.rowheader="seq";
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'60px',    style:'text-align:center'},
	    	{caption: ["조직구분"], 		ref: 'apoSe',   	type:'combo',  width:'90px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonGrdComApoSe', label:'label', value:'value', displayui : false}},
	    	{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonGrdComAprv', label:'label', value:'value', displayui : false}},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["생산자조직 보유"], 		ref: 'frmhsCnt',   	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonGrdComCorpSeCd', label:'label', value:'value', displayui : false}},
	    	{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonGrdComCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonGrdComSgg', label:'label', value:'value', displayui : false}},
	        //{caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'}
	    ];

	    grdPrdcrOgnCurntMng = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
	   	grdPrdcrOgnCurntMng.bind('click','fn_view');
	   	grdPrdcrOgnCurntMng.bind('beforepagechanged', 'fn_pagingBbsList');

	}


	var jsonPrdcrOgnCurntMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng01;

	const objMenuList01 = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld01,			//콜백함수명
	        }
	    };


	function fn_excelDwnld01() {
		grdPrdcrOgnCurntMng01.exportLocalExcel("생산자조직 (총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	//생산자조직 리스트
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = false;//입력 활성화 true 1번클릭 false 더블클릭
	    SBGridProperties.fixedrowheight=45;
	    SBGridProperties.rowheight = 57;
	    //SBGridProperties.rowheader="seq";
	    SBGridProperties.columns = [
	    	{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'output',  width:'180px',    style:'text-align:center'},
	        {caption: ["품목"], 			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["분류"], 			ref: 'ctgryNm',   	type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["취급유형"], 		ref: 'trmtTypeNm',   	type:'output',  width:'85px',    style:'text-align:center'},

			{caption: ["조직원수"], 					ref: 'cnt',   	type:'output',  width:'60px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["생산량\n(결과)(톤)[A]"], 	ref: 'prdctnVlmTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["전속(약정)\n출하계약량(톤)[B]"], 	ref: 'ecSpmtPlanVlmTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["전속(약정)출하량\n(결과)(톤)[C]"], 	ref: 'ecSpmtVlmTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하대금\n지급액(천원)"], 		ref: 'spmtPrcTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			//{caption: ["출하비율(%)"], 					ref: 'ecSpmtRate',   	type:'output',  width:'70px',    style:'text-align:center'
				//,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}},
				// ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하비율(%)\n(승인형)[C/A]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateA',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출하비율(%)\n(육성형)[C/B]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateB',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["적합여부"], 		ref: 'orgStbltYn',   	type:'output',  width:'50px',    style:'text-align:center'},
			{caption: ["탈락사유"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'150px',    style:'padding-left:10px'
				,typeinfo : {textareanewline : true},disabled:true },
	        //{caption: ["비고"], 			ref: 'rmrk',   		type:'input',  width:'220px',    style:'text-align:center'},

	        {caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',			hidden : true},
	    	{caption: ["상세내역"], 	ref: 'uoBrno',   		hidden : true},
	    	{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',		hidden : true},
	    	{caption: ["상세내역"], 	ref: 'stbltYn',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
	    	{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
	    	{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',	hidden : true},

	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);

	}
	/**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdPrdcrOgnCurntMng.getPageSize();
    	let pageNo = 1;

    	fn_setGrdFcltList(pageSize, pageNo);
    }

	const fn_pagingBbsList = async function() {
    	let recordCountPerPage = grdPrdcrOgnCurntMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPrdcrOgnCurntMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltList(recordCountPerPage, currentPageNo);
    }

	const fn_report2 = async function() {
		let yr = SBUxMethod.get("srch-input-yr");//
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		let apoSe = SBUxMethod.get("srch-input-apoSe");//
		let frmhsHldYn = SBUxMethod.get("srch-input-frmhsHldYn");//
		let aprv = SBUxMethod.get("srch-input-aprv");//

		//sbgrid 체크박스 값 사용
		let yrChk = SBUxMethod.get("srch-input-yrChk");//
		let keys = Object.getOwnPropertyNames(yrChk);
		let yrChkVal = null;
		for(let i=0; i<keys.length; i++){
			if(yrChk[keys[i]]){
				yrChkVal = yrChk[keys[i]];
			}
		}
		</c:if>

		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
 	 	gfn_popClipReport("검색리스트", "pd/searchList1.crf", {brno: brno, yr: yr, frmhsHld : "Y"
 	 		, cmptnInst : cmptnInst ,ctpv : ctpv ,corpSeCd : corpSeCd ,corpDtlSeCd : corpDtlSeCd ,corpNm : corpNm
 	 		,aprv : aprv ,apoSe : apoSe ,frmhsHldYn : frmhsHldYn ,yrChk : yrChkVal ,uoBrno : uoBrno
 	 	});
 	 	</c:if>
 	 	<c:if test="${loginVO.userType eq '21'}">
 	 	gfn_popClipReport("검색리스트", "pd/searchList1.crf", {brno: brno, yr: yr, frmhsHld : "Y" ,userType : '21'});
		</c:if>
    }

	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		let yr = SBUxMethod.get("srch-input-yr");//
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		let apoSe = SBUxMethod.get("srch-input-apoSe");//
		let frmhsHldYn = SBUxMethod.get("srch-input-frmhsHldYn");//
		let aprv = SBUxMethod.get("srch-input-aprv");//

		//sbgrid 체크박스 값 사용
		let yrChk = SBUxMethod.get("srch-input-yrChk");//
		let keys = Object.getOwnPropertyNames(yrChk);
		let yrChkVal = null;
		for(let i=0; i<keys.length; i++){
			if(yrChk[keys[i]]){
				yrChkVal = yrChk[keys[i]];
			}
		}
		</c:if>

		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>


    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		brno : brno
    		,yr : yr

    		,frmhsHld : 'Y'//생산자조직보유여부 조회 여부

    		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
    		,cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,corpNm : corpNm

    		,aprv : aprv
    		,apoSe : apoSe
    		,frmhsHldYn : frmhsHldYn
    		,yrChk : yrChkVal
    		,uoBrnoUo : uoBrno
    		</c:if>

    		<c:if test="${loginVO.userType eq '21'}">
			,userType : '21'
    		</c:if>

    		//페이징
    		,pagingYn : 'Y'
    		,currentPageNo : pageNo
     		,recordCountPerPage : pageSize
		});

        let data = await postJsonPromise ;
        try{
        	jsonPrdcrOgnCurntMng.length = 0;
        	let totalRecordCount = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						apoCd: item.apoCd
						,apoSe: item.apoSe
						,ctpv: item.ctpv
						,aprv: item.aprv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,crno: item.crno
						,brno: item.brno
						,corpSeCd: item.corpSeCd
						,yr: item.yr
						,frmhsCnt : item.frmhsCnt
				}
				jsonPrdcrOgnCurntMng.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonPrdcrOgnCurntMng.length > 0) {

        		if(grdPrdcrOgnCurntMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdPrdcrOgnCurntMng.rebuild();
				}else{
					grdPrdcrOgnCurntMng.refresh()
				}
        	} else {
        		grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount);
        		grdPrdcrOgnCurntMng.rebuild();
        	}
        	document.querySelector('#listCount').innerText = totalRecordCount;

        	//grdPrdcrOgnCurntMng.rebuild();

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//사용자 화면 조회
	const fn_dtlSearch = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let now = new Date();
		let year = now.getFullYear();
		let yr = year;

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			,yr : yr
		});

        let data = await postJsonPromise ;
        try{
        	jsonPrdcrOgnCurntMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//사업자등록번호
			});
			//생산자조직 리스트 조회
        	//fn_dtlGridSearch01();
			//출자출하조직이 속한 통합조직 리스트 콤보 생성
        	fn_searchUoList();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	//통합조직 리스트 그리드 클릭시  이벤트
	const fn_view = async function(){
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrOgnCurntMng.getCol();
	    if (nCol < 0) {
	        return;
	    }
	    var nRow = grdPrdcrOgnCurntMng.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		//console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//사업자등록번호
		//통합조직 일 때 통합조직 선택 콤보 초기화 및 비활성하
		//console.log(rowData.apoSe);
		SBUxMethod.set('dtl-input-selUoBrno' , null);
		SBUxMethod.set('dtl-input-uoBrno' , null);
		SBUxMethod.set('dtl-input-uoCd' , null);
		if(rowData.apoSe == '1'){
			SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);
		}else if(rowData.apoSe == '2'){
			SBUxMethod.attr('dtl-input-selUoBrno','readonly',false);
			fn_searchUoList();
		}

		fn_clearForm();
    }

	var comUoBrno = [];//통합조직 선택

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(){
		//출자출하조직이 아닌경우
		<c:if test="${loginVO.userType ne '22'}">
		let brno = SBUxMethod.get('dtl-input-brno');
		</c:if>
		//출자출하조직인 경우
		<c:if test="${loginVO.userType eq '22'}">
		let brno = '${loginVO.brno}';
		</c:if>
		SBUxMethod.openProgress("loadingOpen");
    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			brno : brno
		});
        let data = await postJsonPromise;
        try{
        	comUoBrno = [];
        	data.resultList.forEach((item, index) => {
        		let uoListVO = {
						'text'		: item.uoCorpNm
						, 'label'	: item.uoCorpNm
						, 'value'	: item.uoBrno
						, 'uoApoCd' : item.uoApoCd

				}
        		comUoBrno.push(uoListVO);
			});
        	SBUxMethod.refresh('dtl-input-selUoBrno');
        	//console.log(comUoBrno);
        	if(comUoBrno.length == 1){

        	}
        	SBUxMethod.closeProgress("loadingOpen");
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	//통합조직 콤보박스 선택시 값 변경
	//const fn_changeSelUoBrno = async function() {
	function fn_changeSelUoBrno(){
		let selVal = SBUxMethod.get('dtl-input-selUoBrno');
		let selCombo = _.find(comUoBrno, {value : selVal});
		console.log(selCombo);

		if( typeof selCombo == "undefined" || selCombo == null || selCombo == "" ){
			SBUxMethod.set('dtl-input-uoBrno' , null);
			SBUxMethod.set('dtl-input-uoCd' , null);
		}else{
			SBUxMethod.set('dtl-input-uoBrno',selCombo.value);
			SBUxMethod.set('dtl-input-uoCd',selCombo.uoApoCd);
		}
		fn_clearForm();
	}

	async function fn_clearForm() {
		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
	}


	//총괄표 출력
	const fn_report = async function() {


		let reqBrno = SBUxMethod.get('dtl-input-brno');
		let reqYr = SBUxMethod.get('dtl-input-yr');

		let reqApcGu = $('#dtl-input-apoSe option:checked').text();
		let reqCorpNm = $('#dtl-input-corpNm').val();
		let reqBuisNo = $('#dtl-input-brno').val();

		if(!reqBrno){

			alert("법인체를 선택하세요");
			return false;

		}

 		gfn_popClipReport("생산자 조직관리 총괄표", "pd/docAll1.crf", {brNo : reqBrno, yr : reqYr, apcgu : reqApcGu, corpnm : reqCorpNm, buisno : reqBuisNo});
    }



	//생산자조직 총괄표 조회
	async function fn_dtlGridSearch01() {
		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){return;}
		fn_clearForm();

		let apoSeVal = SBUxMethod.get('dtl-input-apoSe');
		let uoBrnoVal = SBUxMethod.get('dtl-input-uoBrno');
		if(apoSeVal == '2'){
			if(gfn_isEmpty(uoBrnoVal)){
				alert("통합조직을 선택해 주세요");
				return;
			}
		}else if(apoSeVal == '1'){
			uoBrnoVal = null;
		}

		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		console.log('yr = ' + yr +' brno = ' + brno + ' uoBrno = '+uoBrnoVal);

		//if(gfn_isEmpty(yr)){return;}

		let postJsonPromise01 = gfn_postJSON("/pd/pom/selectTbEvFrmhsApoStbltYnList.do", {
			brno : brno
			,uoBrno : uoBrnoVal
			,yr : yr
		});
        let data = await postJsonPromise01;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let itemVO = {
						brno: 	item.brno
						,uoBrno: item.uoBrno
						,yr: item.yr
						,aprv: item.aprv//승인형 육성형
						//,aprvNm: item.aprvNm
						,trmtType: item.trmtType
						,trmtTypeNm: item.trmtTypeNm
						,ctgryCd: item.ctgryCd
						,ctgryNm: item.ctgryNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm

						,prdcrOgnzSn: item.prdcrOgnzSn
						,prdcrOgnzNm: item.prdcrOgnzNm

						,ecSpmtPlanVlmTot: item.ecSpmtPlanVlmTot//전속(약정)출하계획량
						,ecSpmtVlmTot: item.ecSpmtVlmTot//전속(약정)출하량
						,ecSpmtRateA: parseFloat(item.ecSpmtRateA)//출하비율A
						,ecSpmtRateB: parseFloat(item.ecSpmtRateB)//출하비율B
						,spmtPrcTot: item.spmtPrcTot//출하대금지급액
						,prdctnVlmTot: 	item.prdctnVlmTot
						,cnt: item.cnt//조직원수
						,stbltYn: item.stbltYn//적합여부 기준 적용 결과
						,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
						,stbltYnNm: fn_calStbltYn(item)
				}
				jsonPrdcrOgnCurntMng01.push(itemVO);
			});

        	grdPrdcrOgnCurntMng01.rebuild();

        	//입력 그리드 인 경우 추가
        	//grdPrdcrOgnCurntMng01.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	function fn_calStbltYn(item) {
		let stbltYnNmMng = [];

		//강제로 변경한 경우가 존재 함
		if(!gfn_isEmpty(item.orgStbltYn)){
			if (item.orgStbltYn == 'Y') {
				return "";
			}
		}

		//aprv 1 승인 2 육성
		//trmtType 1 공동출하수탁  2 공동선별수탁  3 공동선별매취
		if(item.aprv == '1'){
			if(item.sttgUpbrItemSe == '1'){
				if(!(item.cnt >= 5)){
					stbltYnNmMng.push('조직원수 요건 미달');
				}
				if(!(item.spmtPrcTot >= 200000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
				if(!(item.ecSpmtRateA >= 80)){
					stbltYnNmMng.push('출하비율 요건 미달');
				}
			}
		}else if(item.aprv == '2'){
			if(item.trmtType == '1'){
				if(!(item.cnt >= 5)){
					stbltYnNmMng.push('조직원수 요건 미달');
				}
				if(!(item.spmtPrcTot >= 50000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
				if(!(item.ecSpmtRateB >= 80)){
					stbltYnNmMng.push('출하비율 요건 미달');
				}
			}
			if(item.trmtType == '2'){
				if(!(item.cnt >= 5)){
					stbltYnNmMng.push('조직원수 요건 미달');
				}
				if(!(item.spmtPrcTot >= 50000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
			}
			if(item.trmtType == '3'){
				if(!(item.spmtPrcTot >= 50000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
			}
		}
		//console.log(stbltYnNmMng.join("\n"));
		return stbltYnNmMng.join("\n");
	}

	//통합조직 출자출하조직으로 권한 변경
	async function fn_updateStbltYn(_chk){
		console.log("*************fn_updateStbltYn******************");
		let nRow = grdPrdcrOgnCurntMng01.getRow();

		if(nRow < 1){
			return false;
		}

		//사업자번호
		let brno = SBUxMethod.get("dtl-input-brno");
		if(gfn_isEmpty(brno)) return;

		let stbltYn = '';
		if (_chk == '1') {
			stbltYn = 'Y'
		}else if (_chk == '2') {
			stbltYn = 'N'
		}

		let apoSeVal = SBUxMethod.get('dtl-input-apoSe');
		let uoBrnoVal = SBUxMethod.get('dtl-input-uoBrno');
		if(apoSeVal == '2'){
			if(gfn_isEmpty(uoBrnoVal)){
				alert("통합조직을 선택해 주세요");
				return;
			}
		}else if(apoSeVal == '1'){
			uoBrnoVal = null;
		}

		let yr = SBUxMethod.get("dtl-input-yr");
		console.log("yr = "+yr);
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let rowData = grdPrdcrOgnCurntMng01.getRowData(nRow);

		let prdcrOgnzSn = rowData.prdcrOgnzSn;

		let postJsonPromise = gfn_postJSON("/pd/pom/updateStbltYn.do", {
			brno : brno
			,stbltYn : stbltYn
			,uoBrno : uoBrnoVal
			,yr : yr
			,prdcrOgnzSn : prdcrOgnzSn
		});
        let data = await postJsonPromise;

        try{
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");// I0001	처리 되었습니다.
        		fn_dtlGridSearch01();
        	}else{
        		gfn_comAlert("E0001");//E0001 오류가 발생하였습니다.
        	}
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

</script>
</html>