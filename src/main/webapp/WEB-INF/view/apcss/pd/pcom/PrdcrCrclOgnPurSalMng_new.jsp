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
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
					<sbux-button id="btnReport3" name="btnReport3" uitype="normal" class="btn btn-sm btn-primary" text="출력(출자출하조직 총 매입.매출 연계)" onclick="fn_report3"></sbux-button>
				</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
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
						<sbux-button id="btnReport3" name="btnReport3" uitype="normal" class="btn btn-sm btn-primary" text="출력(출자출하조직 총 매입.매출 연계)" onclick="fn_report3"></sbux-button>
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

				<!-- 통합조직 진척도 -->
				<c:if test="${loginVO.userType eq '21'}">
					<!--
					%@ include file="../prgrs/PrgrsUo.jsp" %>
					-->
				</c:if>

				<br>
				<div>
					<span>전체 취급실적 작성(전문/육성 품목 포함 주요품목 작성, 취급액 비중이 낮은 품목은 기타품목으로 통합작성 후 비고란에 기타품목 명 기재</span>
				</div>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">

							<c:if test="${loginVO.userType ne '02'}">
								<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="매입저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
							</c:if>

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

							<c:if test="${loginVO.userType ne '02'}">
								<sbux-button id="btnSaveFclt3" name="btnSaveFclt3" uitype="normal" text="매출저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
							</c:if>

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

							<c:if test="${loginVO.userType ne '02'}">
								<sbux-button id="btnSaveFclt4" name="btnSaveFclt4" uitype="normal" text="출하실적 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave03"></sbux-button>
							</c:if>

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
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
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

	var jsonGrdCtgryCd01 = [];//평가부류
	var jsonGrdCtgryCd02 = [];//평가부류
	var jsonGrdCtgryCd03 = [];//평가부류

	var jsonGrdClsfCd01 = [];//평가부류
	var jsonGrdClsfCd02 = [];//평가부류
	var jsonGrdClsfCd03 = [];//평가부류

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		//console.log("============fn_initSBSelect============");
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

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdCtgryCd01, 	'CTGRY_CD_1'), //평가부류
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonGrdCtgryCd02, 	'CTGRY_CD_1'), //평가부류
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng03', 	jsonGrdCtgryCd03, 	'CTGRY_CD_1'), //평가부류

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdClsfCd01, 	'CLSF_CD'), //부류
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonGrdClsfCd02, 	'CLSF_CD'), //부류
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng03', 	jsonGrdClsfCd03, 	'CLSF_CD'), //부류

		]);
		//console.log("============fn_initSBSelect=====1=======");
	}


	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		fn_fcltMngCreateGrid();
	</c:if>

		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();
		fn_fcltMngCreateGrid03();

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
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
			{caption: ["적합품목(전문품목)"], 		ref: 'stbltYnNmList1',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["적합품목(육성품목)"], 		ref: 'stbltYnNmList2',   	type:'output',  width:'200px',    style:'text-align:center'},
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
			{caption: ["구분","구분","구분"], 			ref: 'sttgUpbrItemNm',		type:'output',  width:'55px',    style:'text-align:center'},
			{caption: ["부류","부류","부류"], 			ref: 'clsfNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["품목","품목","품목"], 			ref: 'itemNm',		type:'output',  width:'80px',    style:'text-align:center'},

			/*수탁*/
			{caption: ["수탁","공동선별수탁","물량(톤)"], 	ref: 'prchsSortTrstVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동선별수탁","금액(천원)"], 	ref: 'prchsSortTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동출하수탁","물량(톤)"], 	ref: 'prchsSpmtTrstVlm',   type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동출하수탁","금액(천원)"], 	ref: 'prchsSpmtTrstAmt',   type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","단순수탁","물량(톤)"], 		ref: 'prchsSmplTrstVlm',   type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","단순수탁","금액(천원)"], 	ref: 'prchsSmplTrstAmt',   type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","수탁소계","물량(톤)"], 		ref: 'prchsTrstTotVlm',   type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsTrstVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","수탁소계","금액(천원)"], 	ref: 'prchsTrstTotAmt',   type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsTrstAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			/*매취*/
			{caption: ["매취","공동선별매취","물량(톤)"], 	ref: 'prchsSortEmspapVlm',   type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","공동선별매취","금액(천원)"], 	ref: 'prchsSortEmspapAmt',   type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","단순매취","물량(톤)"], 		ref: 'prchsSmplEmspapVlm',   type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","단순매취","금액(천원)"], 	ref: 'prchsSmplEmspapAmt',   type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","매취 소계","물량(톤)"], 		ref: 'prchsEmspapTotVlm',   type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsEmspapVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","매취 소계","금액(천원)"], 	ref: 'prchsEmspapTotAmt',   type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsEmspapAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			/*합계*/
			{caption: ["합계","합계","물량(톤)"], 		ref: 'prchsTotVlm',   		type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","차이"], 		ref: 'prchsTotVlmDiff',   		type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsVlmDiff'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","금액(천원)"], 		ref: 'prchsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","차이"], 		ref: 'prchsTotAmtDiff',   		type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_prchsAmtDiff'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'delYn',		hidden : true},
		];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
		//grdPrdcrOgnCurntMng01.bind('click','gridClick01');
		grdPrdcrOgnCurntMng01.bind('valuechanged','fn_AfterEdit01');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
			//'prchsTrstVlm', 'prchsTrstAmt',
			//'prchsEmspapVlm', 'prchsEmspapAmt',
			'prchsSortTrstVlm','prchsSortTrstAmt',
			'prchsSpmtTrstVlm','prchsSpmtTrstAmt',
			'prchsSmplTrstVlm','prchsSmplTrstAmt',
			'prchsSortEmspapVlm','prchsSortEmspapAmt',
			'prchsSmplEmspapVlm','prchsSmplEmspapAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(){
		//console.log('fn_AfterEdit01');
		let nCol = grdPrdcrOgnCurntMng01.getCol();
		let nRef = grdPrdcrOgnCurntMng01.getRefOfCol(nCol);
		if(columnsToRefresh01.includes(nRef)){
			grdPrdcrOgnCurntMng01.refresh();
			fn_grdTot01();
		}
	}

	//매입 합계 물량
	function fn_prchsVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(gfn_nvl(rowData.prchsSortTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSmplTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSortEmspapVlm))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapVlm));
			return sumVal;
		}else{
			sumVal = rowData.prchsTotVlm;
		}
		return sumVal;
	}

	//매입 물량 합계 차이
	function fn_prchsVlmDiff(objGrid, nRow, nCol){
		nRow = Number(nRow);
		nCol = Number(nCol);
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe != '3' && rowData.delYn == 'N'){
			sumVal = Number(gfn_nvl(rowData.prchsTotVlm)) -
					(
					Number(gfn_nvl(rowData.prchsSortTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSmplTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSortEmspapVlm))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapVlm))
					);
			if(sumVal === 0){
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			}else{
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'red');
			}
			return sumVal;
		}else{
			sumVal = '';
		}
		return sumVal;
	}
	//매입 합계 금액
	function fn_prchsAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(gfn_nvl(rowData.prchsSortTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSmplTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSortEmspapAmt))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapAmt));
			return sumVal;
		}else{
			sumVal = rowData.prchsTotAmt;
		}
		return sumVal;
	}

	//매입 금액 합계 차이
	function fn_prchsAmtDiff(objGrid, nRow, nCol){
		nRow = Number(nRow);
		nCol = Number(nCol);
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe != '3' && rowData.delYn == 'N'){
			sumVal = Number(gfn_nvl(rowData.prchsTotAmt)) -
					(
					Number(gfn_nvl(rowData.prchsSortTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSmplTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSortEmspapAmt))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapAmt))
					);
			if(sumVal === 0){
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			}else{
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'red');
			}
			return sumVal;
		}else{
			sumVal = '';
		}
		return sumVal;
	}

	//매입 수탁 합계 물량
	function fn_prchsTrstVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		sumVal = Number(gfn_nvl(rowData.prchsSortTrstVlm)) + Number(gfn_nvl(rowData.prchsSpmtTrstVlm)) + Number(gfn_nvl(rowData.prchsSmplTrstVlm));
		return sumVal;
	}
	//매입 수탁 합계 금액
	function fn_prchsTrstAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		sumVal = Number(gfn_nvl(rowData.prchsSortTrstAmt)) + Number(gfn_nvl(rowData.prchsSpmtTrstAmt)) + Number(gfn_nvl(rowData.prchsSmplTrstAmt));
		return sumVal;
	}

	//매입 매취 합계 물량
	function fn_prchsEmspapVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		sumVal = Number(gfn_nvl(rowData.prchsSortEmspapVlm)) + Number(gfn_nvl(rowData.prchsSmplEmspapVlm));
		return sumVal;
	}
	//매입 매취 합계 금액
	function fn_prchsEmspapAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		sumVal = Number(gfn_nvl(rowData.prchsSortEmspapAmt)) + Number(gfn_nvl(rowData.prchsSmplEmspapAmt));
		return sumVal;
	}

	//소계 계산
	function fn_grdTot01(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"prchsTrstVlm", "prchsTrstAmt", "prchsEmspapVlm", "prchsEmspapAmt","prchsTotAmt",
			"prchsSortTrstVlm","prchsSortTrstAmt",
			"prchsSpmtTrstVlm","prchsSpmtTrstAmt",
			"prchsSmplTrstVlm","prchsSmplTrstAmt",
			"prchsSortEmspapVlm","prchsSortEmspapAmt",
			"prchsSmplEmspapVlm","prchsSmplEmspapAmt"
		];

		let objGrid = grdPrdcrOgnCurntMng01;
		let grdJson = jsonPrdcrOgnCurntMng01;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 메인 길이
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
		  acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
		  return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});
		objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef("sttgUpbrItemNm"), "소계", true);
		objGrid.refresh();

		//fn_gridCustom();
		/*
		//비활성화 추가
		let ctgryCdCol = objGrid.getColRef("ctgryCd");//
		let prchsTotAmtCol = objGrid.getColRef("prchsTotAmt");//
		objGrid.setCellDisabled(grdJson.length - 1, ctgryCdCol, grdJson.length - 1, prchsTotAmtCol, false);
		objGrid.setCellDisabled(grdJson.length, ctgryCdCol, grdJson.length, prchsTotAmtCol, true);
		objGrid.setCellDisabled(grdJson.length + 1, ctgryCdCol, grdJson.length + 1, prchsTotAmtCol, true);
		*/
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
			{caption: ["구분","구분","구분"], 			ref: 'sttgUpbrItemNm',		type:'output',  width:'55px',    style:'text-align:center'},
			{caption: ["부류","부류","부류"], 			ref: 'clsfNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["품목","품목","품목"], 			ref: 'itemNm',		type:'output',  width:'80px',    style:'text-align:center'},

			/*수탁*/
			{caption: ["수탁","공동선별수탁","물량(톤)"], 	ref: 'slsCprtnSortTrstVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동선별수탁","금액(천원)"], 	ref: 'slsCprtnSortTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동출하수탁","물량(톤)"], 	ref: 'slsCprtnTrstVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동출하수탁","금액(천원)"], 	ref: 'slsCprtnTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","단순수탁","물량(톤)"], 		ref: 'slsSmplTrstVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","단순수탁","금액(천원)"], 	ref: 'slsSmplTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","수탁 소계","물량(톤)"], 		ref: 'slsTrstVlm',   	type:'input',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsTrstVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","수탁 소계","금액(천원)"], 	ref: 'slsTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsTrstAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			/*매취*/
			{caption: ["매취","공동선별매취","물량(톤)"], 	ref: 'slsCprtnSortEmspapVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","공동선별매취","금액(천원)"], 	ref: 'slsCprtnSortEmspapAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","단순매취","물량(톤)"], 		ref: 'slsSmplEmspapVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","단순매취","금액(천원)"], 	ref: 'slsSmplEmspapAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","매취 소계","물량(톤)"], 		ref: 'slsEmspapVlm',   	type:'input',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsEmspapVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","매취 소계","금액(천원)"], 	ref: 'slsEmspapAmt',   	type:'input',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsEmspapAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			//합계
			{caption: ["합계","합계","물량(톤)"], 	ref: 'slsTotVlm',   	type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","차이"], 	ref: 'slsTotVlmDiff',   	type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsVlmDiff'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","금액(천원)"], 	ref: 'slsTotAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","차이"], 	ref: 'slsTotAmtDiff',   	type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsAmtDiff'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			/*자체공판장 매출*/
			{caption: ["자체공판장 매출액","자체공판장 매출액","물량(톤)"], 	ref: 'ddcVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체공판장 매출액","자체공판장 매출액","금액(천원)"], 	ref: 'ddcAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},


			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'delYn',		hidden : true},
		];

		grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
		//grdPrdcrOgnCurntMng02.bind('click','gridClick02');
		grdPrdcrOgnCurntMng02.bind('valuechanged','fn_AfterEdit02');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh02 = [
			"slsCprtnSortTrstVlm",
			"slsCprtnSortTrstAmt",
			"slsCprtnTrstVlm",
			"slsCprtnTrstAmt",
			"slsSmplTrstVlm",
			"slsSmplTrstAmt",
			"slsCprtnSortEmspapVlm",
			"slsCprtnSortEmspapAmt",
			"slsSmplEmspapVlm",
			"slsSmplEmspapAmt",
			"ddcVlm",
			"ddcAmt"
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit02(){
		let objGrid = grdPrdcrOgnCurntMng02;
		let nCol = objGrid.getCol();
		let nRef = objGrid.getRefOfCol(nCol);
		if(columnsToRefresh02.includes(nRef)){
			objGrid.refresh();
			fn_grdTot02();
		}
	}


	//매출 물량 합계
	function fn_slsVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		console.log(rowData.sttgUpbrItemSe);
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(gfn_nvl(rowData.slsCprtnSortTrstVlm))
					+ Number(gfn_nvl(rowData.slsCprtnTrstVlm))
					+ Number(gfn_nvl(rowData.slsSmplTrstVlm))
					+ Number(gfn_nvl(rowData.slsCprtnSortEmspapVlm))
					+ Number(gfn_nvl(rowData.slsSmplEmspapVlm))
					+ Number(gfn_nvl(rowData.ddcVlm));
			return sumVal;
		}else{
			sumVal = rowData.slsTotVlm;
		}
		return sumVal;
	}

	//매출 물량 합계 차이
	function fn_slsVlmDiff(objGrid, nRow, nCol){
		nRow = Number(nRow);
		nCol = Number(nCol);
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe != '3' && rowData.delYn == 'N'){
			sumVal = Number(gfn_nvl(rowData.slsTotVlm)) -
					(
						Number(gfn_nvl(rowData.slsCprtnSortTrstVlm))
						+ Number(gfn_nvl(rowData.slsCprtnTrstVlm))
						+ Number(gfn_nvl(rowData.slsSmplTrstVlm))
						+ Number(gfn_nvl(rowData.slsCprtnSortEmspapVlm))
						+ Number(gfn_nvl(rowData.slsSmplEmspapVlm))
						+ Number(gfn_nvl(rowData.ddcVlm))
					);
			if(sumVal === 0){
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			}else{
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'red');
			}
			return sumVal;
		}else{
			sumVal = '';
		}
		return sumVal;
	}

	//매출 금액 합계
	function fn_slsAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(gfn_nvl(rowData.slsCprtnSortTrstAmt))
					+ Number(gfn_nvl(rowData.slsCprtnTrstAmt))
					+ Number(gfn_nvl(rowData.slsSmplTrstAmt))
					+ Number(gfn_nvl(rowData.slsCprtnSortEmspapAmt))
					+ Number(gfn_nvl(rowData.slsSmplEmspapAmt))
					+ Number(gfn_nvl(rowData.ddcAmt));
			return sumVal;
		}else{
			sumVal = rowData.slsTotVlm;
		}
		return sumVal;
	}

	//매출 금액 합계 차이
	function fn_slsAmtDiff(objGrid, nRow, nCol){
		nRow = Number(nRow);
		nCol = Number(nCol);
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe != '3' && rowData.delYn == 'N'){
			sumVal = Number(gfn_nvl(rowData.slsTotAmt)) -
					(
						Number(gfn_nvl(rowData.slsCprtnSortTrstAmt))
						+ Number(gfn_nvl(rowData.slsCprtnTrstAmt))
						+ Number(gfn_nvl(rowData.slsSmplTrstAmt))
						+ Number(gfn_nvl(rowData.slsCprtnSortEmspapAmt))
						+ Number(gfn_nvl(rowData.slsSmplEmspapAmt))
						+ Number(gfn_nvl(rowData.ddcAmt))
					);
			if(sumVal === 0){
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			}else{
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'red');
			}
			return sumVal;
		}else{
			sumVal = '';
		}
		return sumVal;
	}

	//매출 수탁 물량 소계
	function fn_slsTrstVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.slsCprtnSortTrstVlm))
				+ Number(gfn_nvl(rowData.slsCprtnTrstVlm))
				+ Number(gfn_nvl(rowData.slsSmplTrstVlm));
		return sumVal;
	}
	//매출 수탁 금액 소계
	function fn_slsTrstAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.slsCprtnSortTrstAmt))
				+ Number(gfn_nvl(rowData.slsCprtnTrstAmt))
				+ Number(gfn_nvl(rowData.slsSmplTrstAmt));
		return sumVal;
	}

	//매출 매취 물량 소계
	function fn_slsEmspapVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.slsCprtnSortEmspapVlm))
				+ Number(gfn_nvl(rowData.slsSmplEmspapVlm));
		return sumVal;
	}
	//매출 매취 금액 소계
	function fn_slsEmspapAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.slsCprtnSortEmspapAmt))
				+ Number(gfn_nvl(rowData.slsSmplEmspapAmt));
		return sumVal;
	}

	//소계 계산
	function fn_grdTot02(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"slsCprtnSortTrstVlm",
			"slsCprtnSortTrstAmt",
			"slsCprtnTrstVlm",
			"slsCprtnTrstAmt",
			"slsSmplTrstVlm",
			"slsSmplTrstAmt",
			//"slsTrstVlm",
			//"slsTrstAmt",
			"slsCprtnSortEmspapVlm",
			"slsCprtnSortEmspapAmt",
			"slsSmplEmspapVlm",
			"slsSmplEmspapAmt",
			//"slsEmspapVlm",
			//"slsEmspapAmt",
			"slsTotVlm",
			"slsTotAmt",
			"ddcVlm",
			"ddcAmt"
		];

		let objGrid = grdPrdcrOgnCurntMng02;
		let grdJson = jsonPrdcrOgnCurntMng02;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 메인 길이
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
			acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
			return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});
		objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef("sttgUpbrItemNm"), "소계", true);

		objGrid.refresh();

		//fn_gridCustom();
		/*
		//비활성화 추가
		let ctgryCdCol = objGrid.getColRef("ctgryCd");//
		let ddcAmtCol = objGrid.getColRef("ddcAmt");//
		objGrid.setCellDisabled(grdJson.length - 1, ctgryCdCol, grdJson.length - 1, ddcAmtCol, false);
		objGrid.setCellDisabled(grdJson.length, ctgryCdCol, grdJson.length, ddcAmtCol, true);
		objGrid.setCellDisabled(grdJson.length + 1, ctgryCdCol, grdJson.length + 1, ddcAmtCol, true);
		*/
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
			{caption: ["구분","구분"], 			ref: 'sttgUpbrItemNm',		type:'output',  width:'55px',    style:'text-align:center'},
			{caption: ["부류","부류"], 			ref: 'clsfNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["평가부류","평가부류"], 	ref: 'ctgryNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["품목","품목"], 			ref: 'itemNm',		type:'output',  width:'80px',    style:'text-align:center'},
			//합계는 고정에 기타 값을 조정 하는 방향으로 변경
			//구분 기타의 경우만 합산
			{caption: ["합계","물량(톤)"], 		ref: 'slsTotVlm',   	type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsTotVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","금액(천원)"], 		ref: 'slsTotAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
				, calc : 'fn_slsTotAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["공영\n도매시장","물량(톤)"], 		ref: 'pblcWhlslMrktVlm',   	type:'input',  width:'50px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["공영\n도매시장","금액(천원)"], 		ref: 'pblcWhlslMrktAmt',   	type:'input',  width:'100px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			/* 20241215 온라인 도매시장 제외 요청 */
			//{caption: ["온라인\n도매시장","물량(톤)"], 		ref: 'onlnWhlslMrktVlm',   	type:'input',  width:'50px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			//{caption: ["온라인\n도매시장","금액(천원)"], 		ref: 'onlnWhlslMrktAmt',   	type:'input',  width:'100px',    style:'text-align:center' 			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["대형\n유통업체","물량(톤)"], 		ref: 'lgszRtlVlm',   	type:'input',  width:'50px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["대형\n유통업체","금액(천원)"], 		ref: 'lgszRtlAmt',   	type:'input',  width:'100px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["군납","물량(톤)"], 		ref: 'armyDlvgdsVlm',   	type:'input',  width:'50px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["군납","금액(천원)"], 		ref: 'armyDlvgdsAmt',   	type:'input',  width:'100px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["외식, 식자재\n및 단체급식","물량(톤)"], 		ref: 'eatoutMtrlMlsrVlm',   	type:'input',  width:'50px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["외식, 식자재\n및 단체급식","금액(천원)"], 		ref: 'eatoutMtrlMlsrAmt',   	type:'input',  width:'100px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["가공업체","물량(톤)"], 		ref: 'mnfcRtlVlm',   	type:'input',  width:'50px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["가공업체","금액(천원)"], 		ref: 'mnfcRtlAmt',   	type:'input',  width:'100px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["수출","물량(톤)"], 		ref: 'exprtVlm',   	type:'input',  width:'50px',    style:'text-align:center' 								,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["수출","금액(천원)"], 		ref: 'exprtAmt',   	type:'input',  width:'100px',    style:'text-align:center' 							,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","물량(톤)"], 		ref: 'onlnDlngPrfmncVlm',   	type:'input',  width:'50px',    style:'text-align:center' 		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","금액(천원)"], 		ref: 'onlnDlngPrfmncAmt',   	type:'input',  width:'100px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			//기타값은 합계 - 기타를 제외 한 값의 합
			//구분 기타의 경우는 계산하지 않음
			{caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   	type:'input',  width:'50px',    style:'text-align:center'
				, calc : 'fn_etcVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["기타","금액(천원)"], 		ref: 'etcAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				, calc : 'fn_etcAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'delYn',		hidden : true},
		];

		grdPrdcrOgnCurntMng03 = _SBGrid.create(SBGridProperties);
		//줄 추가 삭제 와 품목 변경은 2.매출현황으로 할수 있게 변경
		//grdPrdcrOgnCurntMng03.bind('click','gridClick03');
		grdPrdcrOgnCurntMng03.bind('valuechanged','fn_AfterEdit03');
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
			sumVal = Number(gfn_nvl(rowData.pblcWhlslMrktVlm))
					//+ Number(gfn_nvl(rowData.onlnWhlslMrktVlm))
					+ Number(gfn_nvl(rowData.lgszRtlVlm))
					+ Number(gfn_nvl(rowData.armyDlvgdsVlm))
					+ Number(gfn_nvl(rowData.eatoutMtrlMlsrVlm))
					+ Number(gfn_nvl(rowData.mnfcRtlVlm))
					+ Number(gfn_nvl(rowData.exprtVlm))
					+ Number(gfn_nvl(rowData.onlnDlngPrfmncVlm))
					+ Number(gfn_nvl(rowData.etcVlm));
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
			sumVal = Number(gfn_nvl(rowData.pblcWhlslMrktAmt))
					//+ Number(gfn_nvl(rowData.onlnWhlslMrktAmt))
					+ Number(gfn_nvl(rowData.lgszRtlAmt))
					+ Number(gfn_nvl(rowData.armyDlvgdsAmt))
					+ Number(gfn_nvl(rowData.eatoutMtrlMlsrAmt))
					+ Number(gfn_nvl(rowData.mnfcRtlAmt))
					+ Number(gfn_nvl(rowData.exprtAmt))
					+ Number(gfn_nvl(rowData.onlnDlngPrfmncAmt))
					+ Number(gfn_nvl(rowData.etcAmt));
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
			let sumVal = Number(gfn_nvl(rowData.slsTotVlm))
			- Number(gfn_nvl(rowData.pblcWhlslMrktVlm))
			//- Number(gfn_nvl(rowData.onlnWhlslMrktVlm))
			- Number(gfn_nvl(rowData.lgszRtlVlm))
			- Number(gfn_nvl(rowData.armyDlvgdsVlm))
			- Number(gfn_nvl(rowData.eatoutMtrlMlsrVlm))
			- Number(gfn_nvl(rowData.mnfcRtlVlm))
			- Number(gfn_nvl(rowData.exprtVlm))
			- Number(gfn_nvl(rowData.onlnDlngPrfmncVlm));
			return sumVal;
		}
		return rowData.etcVlm;
	}

	//기타 금액
	function fn_etcAmt(objGrid, nRow, nCol){
		let rowData = grdPrdcrOgnCurntMng03.getRowData(Number(nRow));;
		if(rowData.prchsSlsSe == '2'){
			let sumVal = Number(gfn_nvl(rowData.slsTotAmt))
				- Number(gfn_nvl(rowData.pblcWhlslMrktAmt))
				//- Number(gfn_nvl(rowData.onlnWhlslMrktAmt))
				- Number(gfn_nvl(rowData.lgszRtlAmt))
				- Number(gfn_nvl(rowData.armyDlvgdsAmt))
				- Number(gfn_nvl(rowData.eatoutMtrlMlsrAmt))
				- Number(gfn_nvl(rowData.mnfcRtlAmt))
				- Number(gfn_nvl(rowData.exprtAmt))
				- Number(gfn_nvl(rowData.onlnDlngPrfmncAmt));
			return sumVal;
		}
		return rowData.etcAmt;
	}

	//소계 계산
	function fn_grdTot03(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"slsTotVlm",
			"slsTotAmt",
			"pblcWhlslMrktVlm",
			"pblcWhlslMrktAmt",
			//"onlnWhlslMrktVlm",
			//"onlnWhlslMrktAmt",
			"lgszRtlVlm",
			"lgszRtlAmt",
			"armyDlvgdsVlm",
			"armyDlvgdsAmt",
			"eatoutMtrlMlsrVlm",
			"eatoutMtrlMlsrAmt",
			"mnfcRtlVlm",
			"mnfcRtlAmt",
			"exprtVlm",
			"exprtAmt",
			"onlnDlngPrfmncVlm",
			"onlnDlngPrfmncAmt",
			"etcVlm",
			"etcAmt"
		];

		let objGrid = grdPrdcrOgnCurntMng03;
		let grdJson = jsonPrdcrOgnCurntMng03;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 메인 길이
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
			acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
			return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});
		objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef("sttgUpbrItemNm"), "소계", true);

		objGrid.refresh();

		//fn_gridCustom();
		/*
		//비활성화 추가
		//03 그리드의 경우 추가 하는 경우가 없기 떄문에 소계만 비활성화
		let ctgryCdCol = objGrid.getColRef("ctgryCd");//
		let etcAmtCol = objGrid.getColRef("etcAmt");//

		objGrid.setCellDisabled(grdJson.length + 1, ctgryCdCol, grdJson.length + 1, etcAmtCol, true);
		*/
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
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
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

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
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
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				//console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				<c:if test="${loginVO.userType eq '21'}">
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt2').hide();
					$('#btnSaveFclt3').hide();
					$('#btnSaveFclt4').hide();
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
						,stbltYnNmList: item.stbltYnNmList
						,stbltYnNmList1: item.stbltYnNmList1
						,stbltYnNmList2: item.stbltYnNmList2
				}
				//console.log(item.corpSeCd);
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
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//사업자등록번호
				SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//등록년도
				SBUxMethod.set('dtl-input-prfmncCorpDdlnYn',gfn_nvl(item.prfmncCorpDdlnYn))//실적 법인체 마감

				//console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt2').hide();
					$('#btnSaveFclt3').hide();
					$('#btnSaveFclt4').hide();
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

		//그리드 해더 row수
		let captionRow = grdPrdcrOgnCurntMng01.getFixedRows();
		for(var i = captionRow; i < gridData01.length + captionRow; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
			let delYn = rowData01.delYn;

			if(delYn == 'N'){
				/*
				let prchsTrstAmtVal = Number(gfn_nvl(rowData01.prchsTrstAmt));
				let prchsEmspapAmtVal = Number(gfn_nvl(rowData01.prchsEmspapAmt));
				let prchsTotAmtVal = Number(gfn_nvl(rowData01.prchsTotAmt));
				let chkVal = Number(prchsTrstAmtVal) + Number(prchsEmspapAmtVal) == Number(prchsTotAmtVal);

				if(!chkVal){
					alert('수탁+매취 의 합계가 합계 금액과 같아야 합니다.');
					grdPrdcrOgnCurntMng01.selectRow(i);
					return false;
				}
				*/

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

		//그리드 해더 row수
		let captionRow = grdPrdcrOgnCurntMng02.getFixedRows();
		for(var i = captionRow; i < gridData02.length + captionRow; i++ ){
			let rowData02 = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts02 = grdPrdcrOgnCurntMng02.getRowStatus(i);
			let delYn = rowData02.delYn;

			if(delYn == 'N'){
				/*
				let slsEmspapAmtVal = Number(gfn_nvl(rowData02.slsEmspapAmt));
				let slsTrstAmtVal = Number(gfn_nvl(rowData02.slsTrstAmt));
				let slsTotAmtVal = Number(gfn_nvl(rowData02.slsTotAmt));
				let chkVal = Number(slsEmspapAmtVal) + Number(slsTrstAmtVal) == Number(slsTotAmtVal);

				if(!chkVal){
					alert('수탁+매취 의 합계가 합계 금액과 같아야 합니다.');
					grdPrdcrOgnCurntMng02.selectRow(i);
					return false;
				}
				*/

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

		//그리드 해더 row수
		let captionRow = grdPrdcrOgnCurntMng03.getFixedRows();
		for(var i = captionRow; i < gridData03.length + captionRow; i++ ){
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
	/* 20240724 줄 변경 없음으로 주석 처리 */
	/*
	function fn_procRow(gubun, grid, nRow, nCol) {
		//console.log("==========fn_procRow=========");
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
	*/

	//품목 리스트 삭제
	/*
	async function fn_deleteRsrc(vo){

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
	*/

	//통합조직 리스트 그리드 클릭시  이벤트
	const fn_view = async function(){
		//console.log("******************fn_view**********************************");

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
		//console.log(rowData);

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

		gfn_popClipReport("통합조직 총 매입 매출 현황", "pd/totalDoc5.crf", {
			brno 		: gfn_nvl(brno)
			, yr 		: gfn_nvl(yr)
			, corpnm	: gfn_nvl(reqCorpNmT)
			, buisno	: gfn_nvl(reqBrnoT)
			, corpno	: gfn_nvl(reqCrnoT)
		});
	}

	//총괄표 출력
	const fn_report3 = async function() {

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
			, corpno	: gfn_nvl(reqCrnoT)
		});
	}

	//통합조직 매입 매출 리스트 조회
	async function fn_dtlGridSearch() {

		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){return;}
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		//그리드 초기화
		fn_clearGrid();

		let postJsonPromise01 = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnPurSalMngPrchsSlsList.do", {
			brno : brno
			,yr : yr
		});
		let data = await postJsonPromise01;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			jsonPrdcrOgnCurntMng02.length = 0;
			jsonPrdcrOgnCurntMng03.length = 0;
			//console.log("data==="+data);
			data.resultPrchsList.forEach((item, index) => {
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
						,ctgryNm: 		item.ctgryNm
						,clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm

						,prchsSlsSe: 	item.prchsSlsSe

						/* 매입 수탁 */
						,prchsSortTrstVlm: 		item.prchsSortTrstVlm
						,prchsSortTrstAmt: 		item.prchsSortTrstAmt
						,prchsSpmtTrstVlm: 		item.prchsSpmtTrstVlm
						,prchsSpmtTrstAmt: 		item.prchsSpmtTrstAmt
						,prchsSmplTrstVlm: 		item.prchsSmplTrstVlm
						,prchsSmplTrstAmt: 		item.prchsSmplTrstAmt
						/* 매입 수탁 소계 */
						,prchsTrstVlm: 			item.prchsTrstVlm
						,prchsTrstAmt: 			item.prchsTrstAmt
						/* 매입 매취 */
						,prchsSortEmspapVlm: 	item.prchsSortEmspapVlm
						,prchsSortEmspapAmt: 	item.prchsSortEmspapAmt
						,prchsSmplEmspapVlm: 	item.prchsSmplEmspapVlm
						,prchsSmplEmspapAmt: 	item.prchsSmplEmspapAmt
						/* 매입 매취 소계 */
						,prchsEmspapVlm: 		item.prchsEmspapVlm
						,prchsEmspapAmt: 		item.prchsEmspapAmt

						/* 매입 합계 */
						,prchsTotVlm: 	item.prchsTotVlm
						,prchsTotAmt: 	item.prchsTotAmt

					};
				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
			});
			data.resultSlsList.forEach((item, index) => {
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
						,ctgryNm: 		item.ctgryNm
						,clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm

						,prchsSlsSe: 		item.prchsSlsSe

						/* 매출 수탁 */
						,slsCprtnTrstVlm: 			item.slsCprtnTrstVlm
						,slsCprtnTrstAmt: 			item.slsCprtnTrstAmt
						,slsCprtnSortTrstVlm: 		item.slsCprtnSortTrstVlm
						,slsCprtnSortTrstAmt: 		item.slsCprtnSortTrstAmt
						,slsSmplTrstVlm: 			item.slsSmplTrstVlm
						,slsSmplTrstAmt: 			item.slsSmplTrstAmt
						/* 매출 수탁 합계 */
						,slsTrstVlm: 				item.slsTrstVlm
						,slsTrstAmt: 				item.slsTrstAmt
						/* 매출 매취 */
						,slsCprtnSortEmspapVlm: 	item.slsCprtnSortEmspapVlm
						,slsCprtnSortEmspapAmt: 	item.slsCprtnSortEmspapAmt
						,slsSmplEmspapVlm: 			item.slsSmplEmspapVlm
						,slsSmplEmspapAmt: 			item.slsSmplEmspapAmt
						/* 매출 매취 소계 */
						,slsEmspapVlm: 				item.slsEmspapVlm
						,slsEmspapAmt: 				item.slsEmspapAmt
						/* 매출 합계 */
						,slsTotVlm: 	item.slsTotVlm
						,slsTotAmt: 	item.slsTotAmt
						/* 20241215 기타 제외 요청 */
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
						,ctgryNm: 		item.ctgryNm
						,clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm

						,prchsSlsSe: 		item.prchsSlsSe

						,slsTotVlm: 	item.slsTotVlm
						,slsTotAmt: 	item.slsTotAmt

						,pblcWhlslMrktVlm: 	item.pblcWhlslMrktVlm
						,pblcWhlslMrktAmt: 	item.pblcWhlslMrktAmt
						/* 20241217 온라인도매시장 제외 요청 */
						/* 별도의 화면에서 받고 해당값은 기타에 들어가도 된다함 */
						//,onlnWhlslMrktVlm: 	item.onlnWhlslMrktVlm
						//,onlnWhlslMrktAmt: 	item.onlnWhlslMrktAmt

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
			});

			grdPrdcrOgnCurntMng01.rebuild();
			grdPrdcrOgnCurntMng02.rebuild();
			grdPrdcrOgnCurntMng03.rebuild();
			/* 하단 소계 추가 */
			grdPrdcrOgnCurntMng01.addRow();
			grdPrdcrOgnCurntMng02.addRow();
			grdPrdcrOgnCurntMng03.addRow();

			//그리드 커스텀 disabled 처리
			fn_gridCustom();

			fn_grdTot01();
			fn_grdTot02();
			fn_grdTot03();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//그리드 커스텀 배경 및 disabled 처리
	const fn_gridCustom = async function(){
		//console.log("=========fn_gridCustom================");
		/* 매입현황 */
		let objGrid01 = grdPrdcrOgnCurntMng01;
		let gridData01 = objGrid01.getGridDataAll();
		//let ctgryCd01 = objGrid01.getColRef("ctgryCd");//비고
		let captionRow01 = objGrid01.getFixedRows();
		/*
		for(var i=captionRow01; i < gridData01.length + captionRow01; i++ ){
			let rowData01 = objGrid01.getRowData(i);
			if (rowData01.sttgUpbrItemSe != '3') {
				objGrid01.setCellDisabled(i, ctgryCd01, i, ctgryCd01, true);
			}
		}
		*/
		//소계 줄 비활성화
		let sttgUpbrItemNm01 = objGrid01.getColRef("sttgUpbrItemNm");//
		let prchsTotAmt01 = objGrid01.getColRef("prchsTotAmt");//
		objGrid01.setCellDisabled(objGrid01.getRows()-1, sttgUpbrItemNm01, objGrid01.getRows()-1, prchsTotAmt01, true);
		objGrid01.setCellStyle('background-color', objGrid01.getRows()-1, sttgUpbrItemNm01, objGrid01.getRows()-1, prchsTotAmt01, 'lightgray');

		/* 매출현황 */
		let objGrid02 = grdPrdcrOgnCurntMng02;
		let gridData02 = objGrid02.getGridDataAll();
		//let ctgryCd02 = objGrid02.getColRef("ctgryCd");//비고
		let captionRow02 = objGrid02.getFixedRows();
		/*
		for(var i = captionRow02; i < gridData02.length + captionRow02; i++ ){
			let rowData02 = objGrid02.getRowData(i);
			if (rowData02.sttgUpbrItemSe != '3') {
				objGrid02.setCellDisabled(i, ctgryCd02, i, ctgryCd02, true);
			}
		}
		*/
		//소계 줄 비활성화
		let sttgUpbrItemNm02 = objGrid02.getColRef("sttgUpbrItemNm");//
		let ddcAmt02 = objGrid02.getColRef("ddcAmt");//
		objGrid02.setCellDisabled(objGrid02.getRows()-1, sttgUpbrItemNm02, objGrid02.getRows()-1, ddcAmt02, true);
		objGrid02.setCellStyle('background-color', objGrid02.getRows()-1, sttgUpbrItemNm02, objGrid02.getRows()-1, ddcAmt02, 'lightgray');

		/* 출하처별 출하실적 */
		let objGrid03 = grdPrdcrOgnCurntMng03;
		let gridData03 = objGrid03.getGridDataAll();
		let captionRow03 = objGrid03.getFixedRows();
		let sttgUpbrItemNm03 = objGrid03.getColRef("sttgUpbrItemNm");//
		let etcVlm03 = objGrid03.getColRef("etcVlm");//
		let etcAmt03 = objGrid03.getColRef("etcAmt");//
		for(var i = captionRow03; i < gridData03.length + captionRow03; i++ ){
			let rowData03 = objGrid03.getRowData(i);
			if (rowData03.sttgUpbrItemSe != '3') {
				objGrid03.setCellDisabled(i, etcVlm03, i, etcAmt03, true);
				objGrid03.setCellStyle('background-color', i, etcVlm03, i, etcAmt03, 'lightgray');
			}
		}
		//소계 줄 비활성화
		objGrid03.setCellDisabled(objGrid03.getRows()-1, sttgUpbrItemNm03, objGrid03.getRows()-1, etcAmt03, true);
		objGrid03.setCellStyle('background-color', objGrid03.getRows()-1, sttgUpbrItemNm03, objGrid03.getRows()-1, etcAmt03, 'lightgray');
	}

	/* 로우데이터 요청 */

	var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd';
		SBGridProperties.id = 'hiddenGrd';
		SBGridProperties.jsonref = 'jsonHiddenGrd';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["신청년도"],    ref: 'yr',                type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["사업자번호"],    ref: 'brno',              type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["법인명"],    ref: 'corpNm',            type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["통합조직 구분"],    ref: 'aprv',              type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매입/매출 구분"],    ref: 'prchsSlsSe',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매입/매출 구분"],    ref: 'prchsSlsSeNm',      type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["전문/육선/기타 구분"],    ref: 'sttgUpbrItemSe',    type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["전문/육선/기타 구분"],    ref: 'sttgUpbrItemNm',    type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["품목코드"],    ref: 'itemCd',            type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["품목명"],    ref: 'itemNm',            type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["분류코드"],    ref: 'ctgryCd',           type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["분류명"],    ref: 'ctgryNm',           type:'output',  width:'70px',    style:'text-align:center'},

			{caption: ["매입 수탁 물량(톤)"],    ref: 'prchsTrstVlm',      type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매입 수탁 금액(천원)"],    ref: 'prchsTrstAmt',      type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매입 매취 물량(톤)"],    ref: 'prchsEmspapVlm',    type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매입 매취 금액(천원)"],    ref: 'prchsEmspapAmt',    type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매입 합계 물량(톤)"],    ref: 'prchsTotVlm',       type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["(저장된)매입 합계 금액(천원)"],    ref: 'orgPrchsTotAmt',       type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["(불러온)매입 합계 금액(천원)"],    ref: 'prchsTotAmt',       type:'output',  width:'70px',    style:'text-align:center'},

			{caption: ["매출 수탁 물량(톤)"],    ref: 'slsEmspapVlm',      type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매출 수탁 금액(천원)"],    ref: 'slsEmspapAmt',      type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매출 매취 물량(톤)"],    ref: 'slsTrstVlm',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매출 매취 금액(천원)"],    ref: 'slsTrstAmt',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매출 합계 물량(톤)"],    ref: 'slsTotVlm',         type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["(저장된)매출 합계 금액(천원)"],    ref: 'orgSlsTotAmt',         type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["(불러온)매출 합계 금액(천원)"],    ref: 'slsTotAmt',         type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매출 자체공판장 매출액 물량(톤)"],    ref: 'ddcVlm',            type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["매출 자체공판장 매출액 금액(천원)"],    ref: 'ddcAmt',            type:'output',  width:'70px',    style:'text-align:center'},

			{caption: ["공영 도매시장 물량(톤)"],    ref: 'pblcWhlslMrktVlm',  type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["공영 도매시장 금액(천원)"],    ref: 'pblcWhlslMrktAmt',  type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["온라인 도매시장 물량(톤)"],    ref: 'onlnWhlslMrktVlm',  type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["온라인 도매시장 금액(천원)"],    ref: 'onlnWhlslMrktAmt',  type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["대형 유통업체 물량(톤)"],    ref: 'lgszRtlVlm',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["대형 유통업체 금액(천원)"],    ref: 'lgszRtlAmt',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["군납 물량(톤)"],    ref: 'armyDlvgdsVlm',     type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["군납 금액(천원)"],    ref: 'armyDlvgdsAmt',     type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["외식, 식자재 및 단체급식 물량(톤)"],    ref: 'eatoutMtrlMlsrVlm', type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["외식, 식자재 및 단체급식 금액(천원)"],    ref: 'eatoutMtrlMlsrAmt', type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["가공업체 물량(톤)"],    ref: 'mnfcRtlVlm',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["가공업체 금액(천원)"],    ref: 'mnfcRtlAmt',        type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["수출 물량(톤)"],    ref: 'exprtVlm',          type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["수출 금액(천원)"],    ref: 'exprtAmt',          type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["온라인 거래실적 (e커머스, TV홈쇼핑 등 포함) 물량(톤)"],    ref: 'onlnDlngPrfmncVlm', type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["온라인 거래실적 (e커머스, TV홈쇼핑 등 포함) 금액(천원)"],    ref: 'onlnDlngPrfmncAmt', type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["기타 물량(톤)"],    ref: 'etcVlm',            type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["기타 금액(천원)"],    ref: 'etcAmt',            type:'output',  width:'70px',    style:'text-align:center'},
		];

		hiddenGrd = _SBGrid.create(SBGridProperties);

	}
	const fn_hiddenGrdSelect = async function(){
		await fn_hiddenGrd();
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnPurSalMngRawDataList.do", {
		    yr : yr
			});

			let data = await postJsonPromise;
			try{
			jsonHiddenGrd.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
					yr                    : item.yr
					, brno                : item.brno
					, corpNm              : item.corpNm
					, aprv                : item.aprv
					, prchsSlsSe          : item.prchsSlsSe
					, prchsSlsSeNm        : item.prchsSlsSeNm
					, sttgUpbrItemSe      : item.sttgUpbrItemSe
					, sttgUpbrItemNm      : item.sttgUpbrItemNm
					, itemCd              : item.itemCd
					, itemNm              : item.itemNm
					, ctgryCd             : item.ctgryCd
					, ctgryNm             : item.ctgryNm
					, prchsTrstVlm        : Number(item.prchsTrstVlm)
					, prchsTrstAmt        : Number(item.prchsTrstAmt)
					, prchsEmspapVlm      : Number(item.prchsEmspapVlm)
					, prchsEmspapAmt      : Number(item.prchsEmspapAmt)
					, prchsTotVlm         : Number(item.prchsTotVlm)
					, prchsTotAmt         : Number(item.prchsTotAmt)
					, orgPrchsTotAmt         : Number(item.orgPrchsTotAmt) //기존값과 다른 경우를 위해 추가

					, slsEmspapVlm        : Number(item.slsEmspapVlm)
					, slsEmspapAmt        : Number(item.slsEmspapAmt)
					, slsTrstVlm          : Number(item.slsTrstVlm)
					, slsTrstAmt          : Number(item.slsTrstAmt)
					, slsTotVlm           : Number(item.slsTotVlm)
					, slsTotAmt           : Number(item.slsTotAmt)
					, orgSlsTotAmt           : Number(item.orgSlsTotAmt) //기존값과 다른 경우를 위해 추가


					, ddcVlm              : Number(item.ddcVlm)
					, ddcAmt              : Number(item.ddcAmt)
					, pblcWhlslMrktVlm    : Number(item.pblcWhlslMrktVlm)
					, pblcWhlslMrktAmt    : Number(item.pblcWhlslMrktAmt)
					, onlnWhlslMrktVlm    : Number(item.onlnWhlslMrktVlm)
					, onlnWhlslMrktAmt    : Number(item.onlnWhlslMrktAmt)
					, lgszRtlVlm          : Number(item.lgszRtlVlm)
					, lgszRtlAmt          : Number(item.lgszRtlAmt)
					, armyDlvgdsVlm       : Number(item.armyDlvgdsVlm)
					, armyDlvgdsAmt       : Number(item.armyDlvgdsAmt)
					, eatoutMtrlMlsrVlm   : Number(item.eatoutMtrlMlsrVlm)
					, eatoutMtrlMlsrAmt   : Number(item.eatoutMtrlMlsrAmt)
					, mnfcRtlVlm          : Number(item.mnfcRtlVlm)
					, mnfcRtlAmt          : Number(item.mnfcRtlAmt)
					, exprtVlm            : Number(item.exprtVlm)
					, exprtAmt            : Number(item.exprtAmt)
					, onlnDlngPrfmncVlm   : Number(item.onlnDlngPrfmncVlm)
					, onlnDlngPrfmncAmt   : Number(item.onlnDlngPrfmncAmt)
					, etcVlm              : Number(item.etcVlm)
					, etcAmt              : Number(item.etcAmt)
				}
				jsonHiddenGrd.push(hiddenGrdVO);
			});

			await hiddenGrd.rebuild();

			await fn_excelDown();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}
	//로우 데이터 엑셀 다운로드
	function fn_excelDown(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_총매입매출_통합조직_로우데이터";

		/*
		datagrid.exportData(param1, param2, param3, param4);
		param1(필수)[string]: 다운 받을 파일 형식
		param2(필수)[string]: 다운 받을 파일 제목
		param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
		→ false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
		param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
		→ combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
		→ true : label 값으로 저장
		→ false : value 값으로 저장
		→ sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
		 */
		//console.log(hiddenGrd.exportData);
		hiddenGrd.exportData("xlsx" , fileName , true , true);
	}

</script>
</html>

