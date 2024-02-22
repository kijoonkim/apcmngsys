<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<!-- 통합조직관리 총 매입·매출 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
				</c:if>
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
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
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
							<td class="td_input">
							</td>
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
						</tr>
						<tr>
							<th scope="row" class="th_bg">적합품목 보유 여부</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-stbltHldYn"
									name="srch-input-stbltHldYn"
									uitype="single"
									jsondata-ref="jsonComStbltHldYn"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td class="td_input"></td>
							<!--
							<th scope="row" class="th_bg"></th>
							<td colspan="3" class="td_input" style="border-right: hidden;">

							</td>
							<td class="td_input"></td>

							<th colspan="2" scope="row" class="th_bg">통합조직 사업자번호로 검색</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >

							</td>
							<td colspan="2" class="td_input">
							 -->
							 <td colspan="11" class="td_input" style="border-right: hidden;border-bottom: hidden;">
						</tr>
					</tbody>
				</table>

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
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
						<!--
						<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
						 -->
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-prfmncCorpDdlnYn" name="dtl-input-prfmncCorpDdlnYn"></sbux-input>
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
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
				<br>
				<div>
					<span>전체 취급실적 작성(전문/육성 품목 포함 주요품목 작성, 취급액 비중이 낮은 품목은 기타품목으로 통합작성 후 비고란에 기타품목 명 기재</span>
				</div>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="매입저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<b>&lt;통합조직 총 매입현황&gt;</b>
								<!--
								<span style="font-size:14px"></span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:300px; width: 100%;"></div>
				</div>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt3" name="btnSaveFclt3" uitype="normal" text="매출저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
						</div>
					</div>
					<div>
						<b>&lt;통합조직 총 매출현황&gt;</b>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">1.매출현황</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:300px; width: 100%;"></div>
				</div>
				<br>
				<!--[pp] 출하처별 출하실적 명세-->
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt4" name="btnSaveFclt4" uitype="normal" text="출하실적 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave03"></sbux-button>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">2.출하처별 출하실적 명세</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng03" style="height:300px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
    <!-- 품목 팝업 -->
    <div>
        <sbux-modal
        	id="modal-gpcList"
        	name="modal-gpcList"
        	uitype="middle"
        	header-title="품목 선택"
        	body-html-id="body-modal-gpcList"
        	footer-is-close-button="false"
        	style="width:800px"
       	></sbux-modal>
    </div>
    <div id="body-modal-gpcList">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/gpcSelectPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
//생산자조직 등록의 경우
//통합조직 직속 농가 출자출하조직 농가 두가지 경우가 있음
//첫리스트는 통합조직,출자출하조직 둘다 보여야함
//조직 선택후 품목 취급유형 선택후 다시 조회

	window.addEventListener('DOMContentLoaded', function(e) {
		var now = new Date();
		var year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

		fn_init();


		/**
		 * 엔터시 검색 이벤트
		 */
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

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분
	var jsonCtgryCd = [];//분류코드

	var jsonComGrdCtpv = [];//시도
	var jsonComGrdSgg = [];//시군
	var jsonComGrdCorpSeCd = [];//법인구분
	var jsonComGrdAprv = [];//신청구분

	var jsonGrdCtgryCd01 = [];//분류코드
	var jsonGrdCtgryCd02 = [];//분류코드
	var jsonGrdCtgryCd03 = [];//분류코드

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
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
			//gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 		'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 		'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 	'APRV_UPBR_SE_CD'), //신청구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdCtgryCd01, 	'CTGRY_CD_1'), //분류코드
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonGrdCtgryCd02, 	'CTGRY_CD_1'), //분류코드
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng03', 	jsonGrdCtgryCd03, 	'CTGRY_CD_1'), //분류코드

		]);
		console.log("============fn_initSBSelect=====1=======");
	}


	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		fn_fcltMngCreateGrid();
	</c:if>
		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();
		fn_fcltMngCreateGrid03();

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		await fn_dtlSearch();
	</c:if>
	}

	const objMenuList = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld,			//콜백함수명
	        }
	    };


	function fn_excelDwnld() {
		grdPrdcrOgnCurntMng.exportLocalExcel("통합조직관리(총매입.매출)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["적합품목"], 		ref: 'stbltYnNm',   	type:'output',  width:'200px',    style:'text-align:center'},
	    	{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComGrdCorpSeCd', label:'label', value:'value', displayui : false}},
	    	{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComGrdCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComGrdSgg', label:'label', value:'value', displayui : false}},
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직관리(총매입.매출)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
	    //SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.frozenbottomrows=1;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"], 		ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	    		//법인체 마감 추가
	        	let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
	        	if (prfmncCorpDdlnYn == 'Y') {
					return "";
				}
	    		if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else if(strValue == "소계"){
	    			return "소계";
	        	}else{
			        if(objRowData.sttgUpbrItemSe == '3'){
	        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
			        }else{
			        	return "";
			        }
	        	}
	        }},
	        {caption: ["품목","품목"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	//{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'combo',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목","품목"], 	ref: 'ctgryCd',   	type:'combo',  width:'80px',    style:'text-align:center'
	    		,typeinfo : {ref:'jsonGrdCtgryCd01', label:'label', value:'value', displayui : true}},
	    	{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

	        {caption: ["수탁","물량(톤)"], 		ref: 'prchsTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["수탁","금액(천원)"], 		ref: 'prchsTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","물량(톤)"], 		ref: 'prchsEmspapVlm',   type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","금액(천원)"], 		ref: 'prchsEmspapAmt',   type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","물량(톤)"], 		ref: 'prchsTotVlm',   		type:'output',  width:'90px',    style:'text-align:center; background-color: #92b2c5', calc : 'fn_prchsVlmSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","금액(천원)"], 		ref: 'prchsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center; background-color: #92b2c5', calc : 'fn_prchsAmtSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	//{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    grdPrdcrOgnCurntMng01.bind('click','gridClick01');
	    grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
		  'prchsTrstVlm', 'prchsTrstAmt', 'prchsEmspapVlm', 'prchsEmspapAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(){
		let prevCol = grdPrdcrOgnCurntMng01.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng01.getRefOfCol(prevCol);
	    if(columnsToRefresh01.includes(prevRef)){
	    	grdPrdcrOgnCurntMng01.refresh();
	    	fn_grdTot01("refresh");
	    }
	}

	//매입 합계 물량
	function fn_prchsVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.prchsTrstVlm) + Number(rowData.prchsEmspapVlm);

		return sumVal;
	}
	//매입 합계 금액
	function fn_prchsAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		//console.log(rowData.prchsTotAmt);
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe == '3'){

			sumVal = Number(rowData.prchsTrstAmt) + Number(rowData.prchsEmspapAmt);

			return sumVal;
		}else{
			sumVal = rowData.prchsTotAmt;
		}
		return sumVal;
	}

	//소계 추가를 위해 조정
	function fn_grdTot01(_gubun) {
	    console.log("===========fn_grdTot01==============");

	    let objGrid = grdPrdcrOgnCurntMng01;
	    let grdJson = jsonPrdcrOgnCurntMng01;

	    if (_gubun === "Search") {
	    	//조회의 경우 2줄 추가
			//그리드 추가 용 1줄 합계용 1줄
	    	objGrid.addRow();
	        objGrid.addRow();
	    } else if (_gubun === "ADD") {
	        //기타 입력줄 하나 추가
	    	let lastRowIndex = grdJson.length;

	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("delYn"), "N", true);
	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("sttgUpbrItemNm"), "기타", true);
	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("sttgUpbrItemSe"), "3", true);
	        objGrid.addRow(true);
	    }

	    let totalColumns = [
	        "prchsTrstVlm", "prchsTrstAmt", "prchsEmspapVlm", "prchsEmspapAmt","prchsTotAmt"
	    ];

	    let totals = totalColumns.reduce((acc, col) => {
	    	acc[col + "Tot"] = 0;
	        return acc;
	    }, {});

	  	//해더 줄수만큼 추가 필요함
		for (let i = 1 + 1; i <= grdJson.length - 1; i++) {
	        let rowData = objGrid.getRowData(i);
	        totalColumns.forEach((col) => {
	            totals[col + "Tot"] += Number(rowData[col]);
	        });
	    }

	    for (let col of totalColumns) {
	        let colRef = objGrid.getColRef(col);
	      	//추가 줄
	        objGrid.setCellData(grdJson.length, colRef, "");
	        //소계 줄
	      	objGrid.setCellData(grdJson.length + 1, colRef, totals[col + "Tot"]);
	    }

	    objGrid.setCellData(grdJson.length, objGrid.getColRef("delYn"), "", true);
	    objGrid.setCellData(grdJson.length + 1, objGrid.getColRef("delYn"), "소계", true);

	    objGrid.refresh();
	    //fn_gridCustom();
	    //비활성화 추가
        let ctgryCdCol = objGrid.getColRef("ctgryCd");//
        let prchsTotAmtCol = objGrid.getColRef("prchsTotAmt");//
        objGrid.setCellDisabled(grdJson.length - 1, ctgryCdCol, grdJson.length - 1, prchsTotAmtCol, false);
        objGrid.setCellDisabled(grdJson.length, ctgryCdCol, grdJson.length, prchsTotAmtCol, true);
        objGrid.setCellDisabled(grdJson.length + 1, ctgryCdCol, grdJson.length + 1, prchsTotAmtCol, true);
	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02;

	const objMenuList02 = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld02,			//콜백함수명
	        }
	    };


	function fn_excelDwnld02() {
		grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직관리(매출현황)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid02 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
	    //SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.frozenbottomrows=1;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"], 		ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	    		//법인체 마감 추가
	        	let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
	        	if (prfmncCorpDdlnYn == 'Y') {
					return "";
				}
	    		if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else if(strValue == "소계"){
	    			return "소계";
	        	}else{
			        if(objRowData.sttgUpbrItemSe == '3'){
	        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ")'>삭제</button>";
			        }else{
			        	return "";
			        }
	        	}
	        }},
	        {caption: ["품목","품목"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	//{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'combo',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목","품목"], 	ref: 'ctgryCd',   	type:'combo',  width:'80px',    style:'text-align:center'
	    		,typeinfo : {ref:'jsonGrdCtgryCd02', label:'label', value:'value', displayui : true}},
	    	{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

	        {caption: ["수탁","물량(톤)"], 		ref: 'slsEmspapVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["수탁","금액(천원)"], 		ref: 'slsEmspapAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","물량(톤)"], 		ref: 'slsTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","금액(천원)"], 		ref: 'slsTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","물량(톤)"], 		ref: 'slsTotVlm',   	type:'output',  width:'90px',    style:'text-align:center; background-color: #92b2c5' , calc : 'fn_slsVlmSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","금액(천원)"], 		ref: 'slsTotAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: #92b2c5', calc : 'fn_slsAmtSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	    	{caption: ["자체공판장 매출액","물량(톤)"], 	ref: 'ddcVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["자체공판장 매출액","금액(천원)"], 	ref: 'ddcAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},


	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	//{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
	    grdPrdcrOgnCurntMng02.bind('click','gridClick02');
	    grdPrdcrOgnCurntMng02.bind('afteredit','fn_AfterEdit02');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh02 = [
		  'slsEmspapVlm', 'slsEmspapAmt'
		  , 'slsTrstVlm', 'slsTrstAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit02(){
		let prevCol = grdPrdcrOgnCurntMng02.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng02.getRefOfCol(prevCol);
	    if(columnsToRefresh02.includes(prevRef)){
	    	grdPrdcrOgnCurntMng02.refresh();
	    }
	}


	//매출 합계 물량
	function fn_slsVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.slsTrstVlm) + Number(rowData.slsEmspapVlm);

		return sumVal;
	}
	//매출 합계 금액
	function fn_slsAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe == '3'){

			sumVal = Number(rowData.slsTrstAmt) + Number(rowData.slsEmspapAmt);

			return sumVal;
		}else{
			sumVal = rowData.slsTotAmt;
		}
		return sumVal;
	}

	//소계 추가를 위해 조정
	function fn_grdTot02(_gubun) {
	    console.log("===========fn_grdTot02==============");

	    let objGrid = grdPrdcrOgnCurntMng02;
	    let grdJson = jsonPrdcrOgnCurntMng02;

	    if (_gubun === "Search") {
	    	//조회의 경우 2줄 추가
			//그리드 추가 용 1줄 합계용 1줄
	    	objGrid.addRow();
	        objGrid.addRow();
	    } else if (_gubun === "ADD") {
	        //기타 입력줄 하나 추가
	    	let lastRowIndex = grdJson.length;

	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("delYn"), "N", true);
	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("sttgUpbrItemNm"), "기타", true);
	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("sttgUpbrItemSe"), "3", true);
	        objGrid.addRow(true);
	    }

	    let totalColumns = [
	    	"slsEmspapVlm", "slsEmspapAmt"
	    	, "slsTrstVlm", "slsTrstAmt"
	        , "ddcVlm", "ddcAmt"
	        , "slsTotAmt"
	    ];

	    let totals = totalColumns.reduce((acc, col) => {
	    	acc[col + "Tot"] = 0;
	        return acc;
	    }, {});

	  	//해더 줄수만큼 추가 필요함
		for (let i = 1 + 1; i <= grdJson.length - 1; i++) {
	        let rowData = objGrid.getRowData(i);
	        totalColumns.forEach((col) => {
	            totals[col + "Tot"] += Number(rowData[col]);
	        });
	    }

	    for (let col of totalColumns) {
	        let colRef = objGrid.getColRef(col);
	      	//추가 줄
	        objGrid.setCellData(grdJson.length, colRef, "");
	        //소계 줄
	      	objGrid.setCellData(grdJson.length + 1, colRef, totals[col + "Tot"]);
	    }

	    objGrid.setCellData(grdJson.length, objGrid.getColRef("delYn"), "", true);
	    objGrid.setCellData(grdJson.length + 1, objGrid.getColRef("delYn"), "소계", true);

	    objGrid.refresh();
	    //fn_gridCustom();
	  	//비활성화 추가
        let ctgryCdCol = objGrid.getColRef("ctgryCd");//
        let ddcAmtCol = objGrid.getColRef("ddcAmt");//
        objGrid.setCellDisabled(grdJson.length - 1, ctgryCdCol, grdJson.length - 1, ddcAmtCol, false);
        objGrid.setCellDisabled(grdJson.length, ctgryCdCol, grdJson.length, ddcAmtCol, true);
        objGrid.setCellDisabled(grdJson.length + 1, ctgryCdCol, grdJson.length + 1, ddcAmtCol, true);
	}


	var jsonPrdcrOgnCurntMng03 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng03;

	const objMenuList03 = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld03,			//콜백함수명
	        }
	    };


	function fn_excelDwnld03() {
		grdPrdcrOgnCurntMng03.exportLocalExcel("통합조직관리(총매입.매출)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid03 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng03';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng03';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng03';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList03;	// 우클릭 메뉴 리스트
	    //SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.fixedrowheight=35;
	    SBGridProperties.frozenbottomrows=1;
	    SBGridProperties.columns = [
	    	/*
	    	{caption: ["처리","처리"], 		ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng03\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else if(strValue == "소계"){
	    			return "소계";
	        	}else{
			        if(objRowData.sttgUpbrItemSe == '3'){
	        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng03\", " + nRow + ")'>삭제</button>";
			        }else{
			        	return "";
			        }
	        	}
	        }},
	        */
	        {caption: ["품목","품목"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	//{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'combo',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목","품목"], 	ref: 'ctgryCd',   	type:'combo',  width:'80px',    style:'text-align:center'
	    		,typeinfo : {ref:'jsonGrdCtgryCd03', label:'label', value:'value', displayui : true}},
	    	{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

	    	{caption: ["합계","물량(톤)"], 		ref: 'slsTotVlm',   	type:'output',  width:'90px',    style:'text-align:center; background-color: #92b2c5'
	    		//, calc : 'fn_slsTotVlmSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","금액(천원)"], 		ref: 'slsTotAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: #92b2c5'
	        	//, calc : 'fn_slsTotAmtSum'
	        	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	    	{caption: ["공영\n도매시장","물량(톤)"], 		ref: 'pblcWhlslMrktVlm',   	type:'input',  width:'90px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공영\n도매시장","금액(천원)"], 		ref: 'pblcWhlslMrktAmt',   	type:'input',  width:'100px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["온라인\n도매시장","물량(톤)"], 		ref: 'onlnWhlslMrktVlm',   	type:'input',  width:'90px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["온라인\n도매시장","금액(천원)"], 		ref: 'onlnWhlslMrktAmt',   	type:'input',  width:'100px',    style:'text-align:center' 			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["대형\n유통업체","물량(톤)"], 		ref: 'lgszRtlVlm',   	type:'input',  width:'90px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["대형\n유통업체","금액(천원)"], 		ref: 'lgszRtlAmt',   	type:'input',  width:'100px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["군납","물량(톤)"], 		ref: 'armyDlvgdsVlm',   	type:'input',  width:'90px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["군납","금액(천원)"], 		ref: 'armyDlvgdsAmt',   	type:'input',  width:'100px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["외식, 식자재\n및 단체급식","물량(톤)"], 		ref: 'eatoutMtrlMlsrVlm',   	type:'input',  width:'90px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["외식, 식자재\n및 단체급식","금액(천원)"], 		ref: 'eatoutMtrlMlsrAmt',   	type:'input',  width:'100px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["가공업체","물량(톤)"], 		ref: 'mnfcRtlVlm',   	type:'input',  width:'90px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["가공업체","금액(천원)"], 		ref: 'mnfcRtlAmt',   	type:'input',  width:'100px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["수출","물량(톤)"], 		ref: 'exprtVlm',   	type:'input',  width:'90px',    style:'text-align:center' 								,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["수출","금액(천원)"], 		ref: 'exprtAmt',   	type:'input',  width:'100px',    style:'text-align:center' 							,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","물량(톤)"], 		ref: 'onlnDlngPrfmncVlm',   	type:'input',  width:'90px',    style:'text-align:center' 		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","금액(천원)"], 		ref: 'onlnDlngPrfmncAmt',   	type:'input',  width:'100px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   	type:'input',  width:'90px',    style:'text-align:center' , calc : 'fn_etcVlm'
	        	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
	        {caption: ["기타","금액(천원)"], 		ref: 'etcAmt',   	type:'input',  width:'100px',    style:'text-align:center', calc : 'fn_etcAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	//{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng03 = _SBGrid.create(SBGridProperties);
	    //줄 추가 삭제 와 품목 변경은 2.매출현황으로 할수 있게 변경
	    //grdPrdcrOgnCurntMng03.bind('click','gridClick03');
	    grdPrdcrOgnCurntMng03.bind('afteredit','fn_AfterEdit03');
	}


	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh03 = [
		  'pblcWhlslMrktVlm'
		  , 'pblcWhlslMrktAmt'
		  , 'onlnWhlslMrktVlm'
		  , 'onlnWhlslMrktAmt'
		  , 'lgszRtlVlm'
		  , 'lgszRtlAmt'
		  , 'armyDlvgdsVlm'
		  , 'armyDlvgdsAmt'
		  , 'eatoutMtrlMlsrVlm'
		  , 'eatoutMtrlMlsrAmt'
		  , 'mnfcRtlVlm'
		  , 'mnfcRtlAmt'
		  , 'exprtVlm'
		  , 'exprtAmt'
		  , 'onlnDlngPrfmncVlm'
		  , 'onlnDlngPrfmncAmt'
		  //, 'etcVlm'
		  //, 'etcAmt'
		  //, 'slsTotVlm'
		  //, 'slsTotAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit03(){
		let prevCol = grdPrdcrOgnCurntMng03.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng03.getRefOfCol(prevCol);
		if(columnsToRefresh03.includes(prevRef)){
	    	grdPrdcrOgnCurntMng03.refresh();
	    }
	}

	//매출 합계 물량
	function fn_slsTotVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(rowData.pblcWhlslMrktVlm)
			+ Number(rowData.onlnWhlslMrktVlm)
			+ Number(rowData.lgszRtlVlm)
			+ Number(rowData.armyDlvgdsVlm)
			+ Number(rowData.eatoutMtrlMlsrVlm)
			+ Number(rowData.mnfcRtlVlm)
			+ Number(rowData.exprtVlm)
			+ Number(rowData.onlnDlngPrfmncVlm)
			+ Number(rowData.etcVlm);
		}else{
			sumVal = rowData.slsTotVlm;
		}
		return sumVal;
	}
	//매출 합계 금액
	function fn_slsTotAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(rowData.pblcWhlslMrktAmt)
					+ Number(rowData.onlnWhlslMrktAmt)
					+ Number(rowData.lgszRtlAmt)
					+ Number(rowData.armyDlvgdsAmt)
					+ Number(rowData.eatoutMtrlMlsrAmt)
					+ Number(rowData.mnfcRtlAmt)
					+ Number(rowData.exprtAmt)
					+ Number(rowData.onlnDlngPrfmncAmt)
					+ Number(rowData.etcAmt);
			return sumVal;
		}else{
			sumVal = rowData.slsTotAmt;
		}
		return sumVal;
	}
	//기타 물량
	function fn_etcVlm(objGrid, nRow, nCol){
		let rowData = grdPrdcrOgnCurntMng03.getRowData(Number(nRow));
		if(rowData.prchsSlsSe == '2'){
			let sumVal = Number(rowData.slsTotVlm)
			- Number(rowData.pblcWhlslMrktVlm)
			- Number(rowData.onlnWhlslMrktVlm)
			- Number(rowData.lgszRtlVlm)
			- Number(rowData.armyDlvgdsVlm)
			- Number(rowData.eatoutMtrlMlsrVlm)
			- Number(rowData.mnfcRtlVlm)
			- Number(rowData.exprtVlm)
			- Number(rowData.onlnDlngPrfmncVlm);
			return sumVal;
		}
		return rowData.etcVlm;
	}

	//기타 금액
	function fn_etcAmt(objGrid, nRow, nCol){
		let rowData = grdPrdcrOgnCurntMng03.getRowData(Number(nRow));;
		if(rowData.prchsSlsSe == '2'){
			let sumVal = Number(rowData.slsTotAmt)
				- Number(rowData.pblcWhlslMrktAmt)
				- Number(rowData.onlnWhlslMrktAmt)
				- Number(rowData.lgszRtlAmt)
				- Number(rowData.armyDlvgdsAmt)
				- Number(rowData.eatoutMtrlMlsrAmt)
				- Number(rowData.mnfcRtlAmt)
				- Number(rowData.exprtAmt)
				- Number(rowData.onlnDlngPrfmncAmt);
			return sumVal;
		}
		return rowData.etcAmt;
	}

	//소계 추가를 위해 조정
	//03 그리드는 줄 추가 기능이 없음 소계만 있으면됨
	function fn_grdTot03(_gubun) {
	    console.log("===========fn_grdTot03==============");

	    let objGrid = grdPrdcrOgnCurntMng03;
	    let grdJson = jsonPrdcrOgnCurntMng03;

	    if (_gubun === "Search") {
	    	//조회의 경우 2줄 추가
			//그리드 추가 용 1줄 합계용 1줄
	    	objGrid.addRow();
	        //objGrid.addRow();
	    } else if (_gubun === "ADD") {
	        //기타 입력줄 하나 추가
	    	let lastRowIndex = grdJson.length;

	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("delYn"), "N", true);
	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("sttgUpbrItemNm"), "기타", true);
	        objGrid.setCellData(lastRowIndex, objGrid.getColRef("sttgUpbrItemSe"), "3", true);
	        objGrid.addRow(true);
	    }

	    let totalColumns = [
	    	"pblcWhlslMrktVlm", "pblcWhlslMrktAmt"
			, "onlnWhlslMrktVlm", "onlnWhlslMrktAmt"
			, "lgszRtlVlm", "lgszRtlAmt"
			, "armyDlvgdsVlm", "armyDlvgdsAmt"
			, "eatoutMtrlMlsrVlm" , "eatoutMtrlMlsrAmt"
			, "mnfcRtlVlm", "mnfcRtlAmt"
			, "exprtVlm", "exprtAmt"
			, "onlnDlngPrfmncVlm", "onlnDlngPrfmncAmt"
			, "etcVlm", "etcAmt"
			, "slsTotVlm", "slsTotAmt"
	    ];

	    let totals = totalColumns.reduce((acc, col) => {
	    	acc[col + "Tot"] = 0;
	        return acc;
	    }, {});

	  	//해더 줄수만큼 추가 필요함
		for (let i = 1 + 1; i <= grdJson.length; i++) {
	        let rowData = objGrid.getRowData(i);
	        totalColumns.forEach((col) => {
	            totals[col + "Tot"] += Number(rowData[col]);
	        });
	    }

	    for (let col of totalColumns) {
	        let colRef = objGrid.getColRef(col);
	      	//추가 줄
	        //objGrid.setCellData(grdJson.length, colRef, "");
	        //소계 줄
	      	objGrid.setCellData(grdJson.length + 1, colRef, totals[col + "Tot"]);
	    }

	    //objGrid.setCellData(grdJson.length, objGrid.getColRef("delYn"), "", true);
	    objGrid.setCellData(grdJson.length + 1, objGrid.getColRef("sttgUpbrItemNm"), "소계", true);

	    objGrid.refresh();
	    //fn_gridCustom();

	  	//비활성화 추가
	  	//03 그리드의 경우 추가 하는 경우가 없기 떄문에 소계만 비활성화
        let ctgryCdCol = objGrid.getColRef("ctgryCd");//
        let etcAmtCol = objGrid.getColRef("etcAmt");//

        objGrid.setCellDisabled(grdJson.length + 1, ctgryCdCol, grdJson.length + 1, etcAmtCol, true);
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


	/* 출력물 */
	const fn_report = async function() {
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
		gfn_popClipReport("검색리스트", "pd/totalDoc3.crf", {
			brno			: gfn_nvl(brno)
			, yr			: gfn_nvl(yr)
			, frmhsHld 		: "Y"
			, cmptnInst 	: gfn_nvl(cmptnInst)
			, ctpv 			: gfn_nvl(ctpv)
			, corpSeCd 		: gfn_nvl(corpSeCd)
			, corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			, corpNm 		: gfn_nvl(corpNm)
			, aprv 			: gfn_nvl(aprv)
			, apoSe 		: gfn_nvl(apoSe)
			, frmhsHldYn 	: gfn_nvl(frmhsHldYn)
			, yrChk 		: gfn_nvl(yrChkVal)
			, uoBrno 		: gfn_nvl(uoBrno)
		});
		</c:if>
		<c:if test="${loginVO.userType eq '21'}">
		gfn_popClipReport("검색리스트", "pd/totalDoc3.crf", {
			brno		: gfn_nvl(brno)
			, yr		: gfn_nvl(yr)
			, frmhsHld 	: "Y"
			, userType 	: "21"
		});
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

		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		//sbgrid 체크박스 값 사용
		let yrChk = SBUxMethod.get("srch-input-yrChk");//
		let keys = Object.getOwnPropertyNames(yrChk);
		let yrChkVal = null;
		for(let i=0; i<keys.length; i++){
			if(yrChk[keys[i]]){
				yrChkVal = yrChk[keys[i]];
			}
		}
		let stbltHldYn = SBUxMethod.get("srch-input-stbltHldYn");//

		fn_clearForm();
		fn_clearGrid();

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,brno : brno
    		,corpNm : corpNm
    		,yr : yr

    		,apoSe : '1'

    		,stbltYnNm:'Y'
    	    ,yrChk : yrChkVal
    	    ,stbltHldYn : stbltHldYn //적합품목 보유 여부

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
        		console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				<c:if test="${loginVO.userType eq '21'}">
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt2').hide();
					$('#btnSaveFclt3').hide();
				}
				</c:if>

        		let PrdcrOgnCurntMngVO = {
						apoCd: item.apoCd
						,apoSe: item.apoSe
						,ctpv: item.ctpv
						,aprv: item.aprv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,crno: item.crno
						,brno: item.brno
						,yr: item.yr
						,corpSeCd: item.corpSeCd
						,stbltYnNm: item.stbltYnNm
						,
				}
				console.log(item.corpSeCd);
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

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		brno : brno
		});

        let data = await postJsonPromise ;
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//사업자등록번호
				SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//등록년도
				SBUxMethod.set('dtl-input-prfmncCorpDdlnYn',gfn_nvl(item.prfmncCorpDdlnYn))//실적 법인체 마감

				console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt2').hide();
					$('#btnSaveFclt3').hide();
				}
			});
        	fn_dtlGridSearch();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//매입 다중 세이브
	const fn_listSave01 = async function(){

		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=2; i<=gridData01.length + 1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
			let delYn = rowData01.delYn;

			if(delYn == 'N'){

				let prchsTrstAmtVal = Number(rowData01.prchsTrstAmt);
				let prchsEmspapAmtVal = Number(rowData01.prchsEmspapAmt);
				let prchsTotAmtVal = Number(rowData01.prchsTotAmt);
				let chkVal = Number(prchsTrstAmtVal) + Number(prchsEmspapAmtVal) == Number(prchsTotAmtVal);

				if(!chkVal){
					alert('수탁+매취 의 합계가 합계 금액과 같아야 합니다.');
					grdPrdcrOgnCurntMng01.selectRow(i);
					return false;
				}

				rowData01.apoCd = apoCd;
				rowData01.apoSe = apoSe;
				rowData01.crno = crno;
				rowData01.brno = brno;
				rowData01.yr = yr;

				rowData01.rowSts = "I";
				saveList.push(rowData01);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList01.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_dtlGridSearch();
	        		//fn_searchFcltList();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
		}
	}

	//매출 다중 세이브
	const fn_listSave02 = async function(){

		let gridData02 = grdPrdcrOgnCurntMng02.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=2; i<=gridData02.length + 1; i++ ){
			let rowData02 = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts02 = grdPrdcrOgnCurntMng02.getRowStatus(i);
			let delYn = rowData02.delYn;

			if(delYn == 'N'){
				let slsEmspapAmtVal = Number(rowData02.slsEmspapAmt);
				let slsTrstAmtVal = Number(rowData02.slsTrstAmt);
				let slsTotAmtVal = Number(rowData02.slsTotAmt);
				let chkVal = Number(slsEmspapAmtVal) + Number(slsTrstAmtVal) == Number(slsTotAmtVal);

				if(!chkVal){
					alert('수탁+매취 의 합계가 합계 금액과 같아야 합니다.');
					grdPrdcrOgnCurntMng02.selectRow(i);
					return false;
				}

				rowData02.apoCd = apoCd;
				rowData02.apoSe = apoSe;
				rowData02.crno = crno;
				rowData02.brno = brno;
				rowData02.yr = yr;

				rowData02.rowSts = "I";
				saveList.push(rowData02);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList02.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_dtlGridSearch();
	        		//fn_searchFcltList();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
		}
	}

	//매출 다중 세이브
	const fn_listSave03 = async function(){

		let gridData03 = grdPrdcrOgnCurntMng03.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=2; i<=gridData03.length ; i++ ){
			let rowData03 = grdPrdcrOgnCurntMng03.getRowData(i);
			let rowSts03 = grdPrdcrOgnCurntMng03.getRowStatus(i);
			let delYn = rowData03.delYn;

			if(delYn == 'N'){

				if(rowData03.etcVlm < 0){
					alert('기타 물량의 값은 음수일수 없습니다');
					grdPrdcrOgnCurntMng03.selectRow(i);
					return false;
				}
				if(rowData03.etcAmt < 0){
					alert('기타 금액의 값은 음수일수 없습니다');
					grdPrdcrOgnCurntMng03.selectRow(i);
					return false;
				}

				rowData03.apoCd = apoCd;
				rowData03.apoSe = apoSe;
				rowData03.crno = crno;
				rowData03.brno = brno;
				rowData03.yr = yr;

				rowData03.rowSts = "I";
				saveList.push(rowData03);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList03.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_dtlGridSearch();
	        		//fn_searchFcltList();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
		}
	}

	/* Grid Row 추가 및 삭제 기능*/
    function fn_procRow(gubun, grid, nRow, nCol) {
    	console.log("==========fn_procRow=========");
        if (gubun === "ADD") {
            if (grid === "grdPrdcrOgnCurntMng01") {
            	fn_grdTot01("ADD");
            }

            if (grid === "grdPrdcrOgnCurntMng02") {
            	fn_grdTot02("ADD");
            }
            if (grid === "grdPrdcrOgnCurntMng03") {
            	fn_grdTot03("ADD");
            }

        }
        else if (gubun === "DEL") {
            if (grid === "grdPrdcrOgnCurntMng01") {
            	if(grdPrdcrOgnCurntMng01.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng01.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng01.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			grdPrdcrOgnCurntMng01.deleteRow(nRow);
            			fn_grdTot01("DEL");
            		}
            	}else{
            		grdPrdcrOgnCurntMng01.deleteRow(nRow);
            		fn_grdTot01("DEL");
            	}
            }
            if (grid === "grdPrdcrOgnCurntMng02") {
            	if(grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng02.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			grdPrdcrOgnCurntMng02.deleteRow(nRow);
            			fn_grdTot02("DEL");
            		}
            	}else{
            		grdPrdcrOgnCurntMng02.deleteRow(nRow);
            		fn_grdTot02("DEL");
            	}
            }
            if (grid === "grdPrdcrOgnCurntMng03") {
            	if(grdPrdcrOgnCurntMng03.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng03.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng03.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			grdPrdcrOgnCurntMng03.deleteRow(nRow);
            			fn_grdTot03("DEL");
            		}
            	}else{
            		grdPrdcrOgnCurntMng03.deleteRow(nRow);
            		fn_grdTot03("DEL");
            	}
            }
        }
    }

	//품목 리스트 삭제
	async function fn_deleteRsrc(vo){

		/*
		if(true){
			alert("개발중");
			return;
		}
		*/

		let postJsonPromise = gfn_postJSON("/pd/pcom/deletePrdcrCrclOgnPurSalMng.do", vo);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        	}else{
        		alert("삭제 도중 오류가 발생 되었습니다.");
        	}
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
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdPrdcrOgnCurntMng.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}
		//초기화
		fn_clearGrid();
		fn_clearForm();

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		console.log(rowData);

		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도
    }

	//매입 매출 그리드 초기화
	async function fn_clearGrid() {
		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
		jsonPrdcrOgnCurntMng03.length= 0;
		grdPrdcrOgnCurntMng03.rebuild();
	}

	//폼 초기화
	async function fn_clearForm() {
		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-yr',null)//등록년도
	}


	//총괄표 출력
	const fn_report2 = async function() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){return;}
		let yr = SBUxMethod.get('dtl-input-yr');

		let reqCorpNmT = $('#dtl-input-corpNm').val();
		let reqBrnoT = $('#dtl-input-brno').val();
		let reqCrnoT = $('#dtl-input-crno').val();

		gfn_popClipReport("통합조직 총 매입 매출 현황", "pd/totalDoc4.crf", {
			brno 		: gfn_nvl(brno)
			, yr 		: gfn_nvl(yr)
			, corpnm	: gfn_nvl(reqCorpNmT)
			, buisno	: gfn_nvl(reqBrnoT)
			, corpnm	: gfn_nvl(reqCorpNmT)
		});
	}

	//통합조직 매입 매출 리스트 조회
	async function fn_dtlGridSearch() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){return;}
		let yr = SBUxMethod.get('dtl-input-yr');

		fn_clearGrid();

		let postJsonPromise01 = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnPurSalMngList.do", {
			brno : brno
    		,yr : yr
		});
        let data = await postJsonPromise01;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	jsonPrdcrOgnCurntMng02.length = 0;
        	jsonPrdcrOgnCurntMng03.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		if(item.prchsSlsSe == '1'){
        			let PrdcrOgnCurntMngVO01 = {
    						apoCd: 	item.apoCd
    						,apoSe: item.apoSe
    						,brno: 	item.brno
    						,crno: 	item.crno
    						,delYn: item.delYn
    						,yr: item.yr

    						,sttgUpbrItemSe: item.sttgUpbrItemSe
    						,sttgUpbrItemNm: item.sttgUpbrItemNm

    						,ctgryCd: 		item.ctgryCd
    						//,ctgryNm: 		item.ctgryNm
    						,itemCd: 		item.itemCd
    						,itemNm: 		item.itemNm

    						,prchsSlsSe: 	item.prchsSlsSe

    						,prchsTrstVlm: 		item.prchsTrstVlm
    						,prchsTrstAmt: 		item.prchsTrstAmt
    						,prchsEmspapVlm: 	item.prchsEmspapVlm
    						,prchsEmspapAmt: 	item.prchsEmspapAmt

    						,prchsTotVlm: 	item.prchsTotVlm
    						,prchsTotAmt: 	item.prchsTotAmt

    				};
        			jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
        		}else if(item.prchsSlsSe == '2'){
    				let PrdcrOgnCurntMngVO02 = {
    						apoCd: 	item.apoCd
    						,apoSe: item.apoSe
    						,brno: 	item.brno
    						,crno: 	item.crno
    						,delYn: item.delYn
    						,yr: item.yr

    						,sttgUpbrItemSe: item.sttgUpbrItemSe
    						,sttgUpbrItemNm: item.sttgUpbrItemNm

    						,ctgryCd: 		item.ctgryCd
    						//,ctgryNm: 		item.ctgryNm
    						,itemCd: 		item.itemCd
    						,itemNm: 		item.itemNm

    						,prchsSlsSe: 		item.prchsSlsSe

    						,slsEmspapVlm: 		item.slsEmspapVlm
    						,slsEmspapAmt: 		item.slsEmspapAmt
    						,slsTrstVlm: 		item.slsTrstVlm
    						,slsTrstAmt: 		item.slsTrstAmt

    						,slsTotVlm: 	item.slsTotVlm
    						,slsTotAmt: 	item.slsTotAmt

    						,ddcVlm: 		item.ddcVlm
    						,ddcAmt: 		item.ddcAmt

    				};

    				let PrdcrOgnCurntMngVO03 = {
    						apoCd: 	item.apoCd
    						,apoSe: item.apoSe
    						,brno: 	item.brno
    						,crno: 	item.crno
    						,delYn: item.delYn
    						,yr: item.yr

    						,sttgUpbrItemSe: item.sttgUpbrItemSe
    						,sttgUpbrItemNm: item.sttgUpbrItemNm

    						,ctgryCd: 		item.ctgryCd
    						//,ctgryNm: 		item.ctgryNm
    						,itemCd: 		item.itemCd
    						,itemNm: 		item.itemNm

    						,prchsSlsSe: 		item.prchsSlsSe

    						,slsTotVlm: 	item.slsTotVlm
    						,slsTotAmt: 	item.slsTotAmt

    						,pblcWhlslMrktVlm: 	item.pblcWhlslMrktVlm
    						,pblcWhlslMrktAmt: 	item.pblcWhlslMrktAmt
    						,onlnWhlslMrktVlm: 	item.onlnWhlslMrktVlm
    						,onlnWhlslMrktAmt: 	item.onlnWhlslMrktAmt

    						,lgszRtlVlm: 		item.lgszRtlVlm
    						,lgszRtlAmt: 		item.lgszRtlAmt
    						,armyDlvgdsVlm: 	item.armyDlvgdsVlm
    						,armyDlvgdsAmt: 	item.armyDlvgdsAmt

    						,eatoutMtrlMlsrVlm:	item.eatoutMtrlMlsrVlm
    						,eatoutMtrlMlsrAmt:	item.eatoutMtrlMlsrAmt
    						,mnfcRtlVlm: 		item.mnfcRtlVlm
    						,mnfcRtlAmt: 		item.mnfcRtlAmt

    						,exprtVlm: 			item.exprtVlm
    						,exprtAmt: 			item.exprtAmt
    						,onlnDlngPrfmncVlm:	item.onlnDlngPrfmncVlm
    						,onlnDlngPrfmncAmt:	item.onlnDlngPrfmncAmt

    						,etcVlm: 			item.etcVlm
    						,etcAmt: 			item.etcAmt
    				};
    				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO02);
    				jsonPrdcrOgnCurntMng03.push(PrdcrOgnCurntMngVO03);

        		}
			});

        	grdPrdcrOgnCurntMng01.rebuild();
        	grdPrdcrOgnCurntMng02.rebuild();
        	grdPrdcrOgnCurntMng03.rebuild();

        	//그리드 커스텀 disabled 처리
        	fn_gridCustom();

        	fn_grdTot01("Search");
        	fn_grdTot02("Search");
        	fn_grdTot03("Search");
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//그리드 커스텀 배경 및 disabled 처리
	const fn_gridCustom = async function(){
		console.log("=========fn_gridCustom================");
		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		let ctgryCd01 = grdPrdcrOgnCurntMng01.getColRef("ctgryCd");//비고

		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			if (rowData01.sttgUpbrItemSe != '3') {
				grdPrdcrOgnCurntMng01.setCellDisabled(i, ctgryCd01, i, ctgryCd01, true);
			}
		}

		let gridData02 = grdPrdcrOgnCurntMng02.getGridDataAll();
		let ctgryCd02 = grdPrdcrOgnCurntMng02.getColRef("ctgryCd");//비고

		for(var i=2; i <= gridData02.length+1; i++ ){
			let rowData02 = grdPrdcrOgnCurntMng02.getRowData(i);
			if (rowData02.sttgUpbrItemSe != '3') {
				grdPrdcrOgnCurntMng02.setCellDisabled(i, ctgryCd02, i, ctgryCd02, true);
			}
		}

		let gridData03 = grdPrdcrOgnCurntMng03.getGridDataAll();
		let ctgryCd03 = grdPrdcrOgnCurntMng03.getColRef("ctgryCd");//비고

		for(var i=2; i <= gridData03.length+1; i++ ){
			let rowData03 = grdPrdcrOgnCurntMng03.getRowData(i);
			if (rowData03.sttgUpbrItemSe != '3') {
				grdPrdcrOgnCurntMng03.setCellDisabled(i, ctgryCd03, i, ctgryCd03, true);
			}
		}
	}


	let selGridRow01;//선택한 행
	let selGridCol01;//선택한 열

    //그리드 클릭이벤트
    function gridClick01(){
		console.log("================gridClick01================");
		//grdGpcList 그리드 객체
        selGridRow01 = grdPrdcrOgnCurntMng01.getRow();
        selGridCol01 = grdPrdcrOgnCurntMng01.getCol();


        let sttgUpbrItemSeCol = grdPrdcrOgnCurntMng01.getColRef('sttgUpbrItemSe');
        let sttgUpbrItemSeValue = grdPrdcrOgnCurntMng01.getCellData(selGridRow01,sttgUpbrItemSeCol);

        //기타 인경우만 품목 선택가능
        if(sttgUpbrItemSeValue != '3'){
        	return;
        }

        //분류,품목,
        //let ctgryNmCol = grdPrdcrOgnCurntMng01.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng01.getColRef('itemNm');

        if(selGridRow01 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	//if (selGridCol01 == ctgryNmCol || selGridCol01 == itemNmCol){
        	if (selGridCol01 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		let brno = SBUxMethod.get('dtl-input-brno');
        		popGpcSelect.init(fn_setGridItem01);
        		//popGpcSelect.init(fn_setGridItem01);
        		SBUxMethod.openModal('modal-gpcList');
        	}
        }
    }


	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem01 = function(rowData) {
		console.log("================fn_setGridItem01================");
		//console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdPrdcrOgnCurntMng01.getRefOfCol(selGridCol01);

			let gridData = grdPrdcrOgnCurntMng01.getGridDataAll();
			for(var i=1+1; i<=gridData.length+1; i++ ){
				let uoData = grdPrdcrOgnCurntMng01.getRowData(i);
				if ($.trim(rowData.itemCd) == $.trim(uoData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}

			//그리드 값 세팅
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("itemNm"),rowData.itemNm,true);

			let grdStatus = grdPrdcrOgnCurntMng01.getRowStatus(selGridRow01);
		 	if(grdStatus != '1'){
		 		grdPrdcrOgnCurntMng01.setRowStatus(selGridRow01,'update');
		 	}
		}
	}

	let selGridRow02;//선택한 행
	let selGridCol02;//선택한 열

    //그리드 클릭이벤트
    function gridClick02(){
		console.log("================gridClick02================");
		//grdGpcList 그리드 객체
        selGridRow02 = grdPrdcrOgnCurntMng02.getRow();
        selGridCol02 = grdPrdcrOgnCurntMng02.getCol();


        let sttgUpbrItemSeCol = grdPrdcrOgnCurntMng02.getColRef('sttgUpbrItemSe');
        let sttgUpbrItemSeValue = grdPrdcrOgnCurntMng02.getCellData(selGridRow02,sttgUpbrItemSeCol);

        //기타 인경우만 품목 선택가능
        if(sttgUpbrItemSeValue != '3'){
        	return;
        }

        //분류,품목,
        //let ctgryNmCol = grdPrdcrOgnCurntMng02.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng02.getColRef('itemNm');

        if(selGridRow02 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	//if (selGridCol02 == ctgryNmCol || selGridCol02 == itemNmCol){
        	if (selGridCol02 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		let brno = SBUxMethod.get('dtl-input-brno');
        		popGpcSelect.init(fn_setGridItem02);
        		//popGpcSelect.init(fn_setGridItem02);
        		SBUxMethod.openModal('modal-gpcList');
        	}
        }
    }

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem02 = function(rowData) {
		console.log("================fn_setGridItem02================");
		//console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdPrdcrOgnCurntMng02.getRefOfCol(selGridCol02);

			let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();
			for(var i=1+1; i<=gridData.length+1; i++ ){
				let uoData = grdPrdcrOgnCurntMng02.getRowData(i);
				if ($.trim(rowData.itemCd) == $.trim(uoData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}

			//그리드 값 세팅
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("itemNm"),rowData.itemNm,true);

			let grdStatus = grdPrdcrOgnCurntMng02.getRowStatus(selGridRow02);
		 	if(grdStatus != '1'){
		 		grdPrdcrOgnCurntMng02.setRowStatus(selGridRow02,'update');
		 	}
		}
	}

	let selGridRow03;//선택한 행
	let selGridCol03;//선택한 열

	//그리드 클릭이벤트
    function gridClick03(){
		console.log("================gridClick03================");
		//grdGpcList 그리드 객체
        selGridRow03 = grdPrdcrOgnCurntMng03.getRow();
        selGridCol03 = grdPrdcrOgnCurntMng03.getCol();

        let sttgUpbrItemSeCol = grdPrdcrOgnCurntMng03.getColRef('sttgUpbrItemSe');
        let sttgUpbrItemSeValue = grdPrdcrOgnCurntMng03.getCellData(selGridRow03,sttgUpbrItemSeCol);

        //기타 인경우만 품목 선택가능
        if(sttgUpbrItemSeValue != '3'){
        	return;
        }

        //분류,품목,
        //let ctgryNmCol = grdPrdcrOgnCurntMng03.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng03.getColRef('itemNm');

        if(selGridRow03 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	//if (selGridCol03 == ctgryNmCol || selGridCol03 == itemNmCol){
        	if (selGridCol03 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		let brno = SBUxMethod.get('dtl-input-brno');
        		popGpcSelect.init(fn_setGridItem03);
        		//popGpcSelect.init(fn_setGridItem03);
        		SBUxMethod.openModal('modal-gpcList');
        	}
        }
    }

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem03 = function(rowData) {
		console.log("================fn_setGridItem03================");
		//console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdPrdcrOgnCurntMng03.getRefOfCol(selGridCol02);

			let gridData = grdPrdcrOgnCurntMng03.getGridDataAll();
			for(var i=1+1; i<=gridData.length+1; i++ ){
				let uoData = grdPrdcrOgnCurntMng03.getRowData(i);
				if ($.trim(rowData.itemCd) == $.trim(uoData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}

			//그리드 값 세팅
			grdPrdcrOgnCurntMng03.setCellData(selGridRow03,grdPrdcrOgnCurntMng03.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng03.setCellData(selGridRow03,grdPrdcrOgnCurntMng03.getColRef("itemNm"),rowData.itemNm,true);

			let grdStatus = grdPrdcrOgnCurntMng03.getRowStatus(selGridRow03);
		 	if(grdStatus != '1'){
		 		grdPrdcrOgnCurntMng03.setRowStatus(selGridRow03,'update');
		 	}
		}
	}

</script>
</html>

