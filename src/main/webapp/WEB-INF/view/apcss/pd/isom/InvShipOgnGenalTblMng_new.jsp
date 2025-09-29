<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : 출자출하조직 - 총괄표</title>
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
					<!-- 출자출하조직 총괄표 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '91'}">
					<!-- userType 91 농협관계자 조회 -->
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.apoSe eq '1'}">
					<c:if test="${loginVO.apoSe ne '1'}">
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					</c:if>
					<sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" class="btn btn-sm btn-primary" text="과거실적 팝업" onclick="fn_openMaodal"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
					 -->
				</c:if>
				<c:if test="${loginVO.apoSe eq '2'}">
					<sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" class="btn btn-sm btn-primary" text="과거실적 팝업" onclick="fn_openMaodal"></sbux-button>
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>

					<!--
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
					-->
				</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
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

							<th colspan="2" scope="row" class="th_bg">통합조직 사업자번호로 검색</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-uoBrno"
									name="srch-input-uoBrno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
						</tr>
						<tr>
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
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">법인명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"></td>
							<!--
							<th colspan="2" scope="row" class="th_bg"></th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >

							</td>
							<td colspan="2" class="td_input">
							-->
							<td colspan="6" class="td_input" style="border-right: hidden;border-bottom: hidden;">
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91' || loginVO.apoSe eq '1'}">
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
				<!--[pp] 검색결과 -->

				<br>

				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
						<!--
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
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
							<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
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
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
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
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 상세보기-->
				<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
					<p>o 생산자조직 외 출하 : 요건미달 생산자조직 출하실적+단순 사입물량의 출하실적</p>
					<p>o "적합(Y)" 품목의 실적 → 통합조직관리-전문품목 매입매출 화면의 "출자출하조직-전속출하" 실적으로 연동</p>
					<p>　⇒ "적합(Y)" 품목의 실적만 최종 "통합조직 판매위임액(생산자조직 출하금액)"으로 인정</p>
					<p>o 부적합(N)" 품목의 실적 → 통합조직관리-전문품목 매입매출 화면의 "출자출하조직-(요건미달) 전속출하" 실적으로 연동</p>
					<p>　⇒ "부적합(Y)" 품목의 실적은 최종 "통합조직 판매위임액(생산자조직 출하금액)"으로 미인정</p>
				</div>
				<!-- 생산자조직 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶총괄표</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:380px; width: 100%;"></div>
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="updateStbltYn1" name="updateStbltYn1" uitype="normal" text="적합여부 Y으로 변경" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn(1)"></sbux-button>
							<sbux-button id="updateStbltYn2" name="updateStbltYn2" uitype="normal" text="적합여부 N으로 변경" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn(2)"></sbux-button>
							<sbux-button id="updateStbltYn3" name="updateStbltYn3" uitype="normal" text="적합여부 빈칸으로 초기화" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn"></sbux-button>
							<sbux-button id="btnSave01" name="btnSave01" uitype="normal" text="조치사항 저장" class="btn btn-sm btn-outline-danger" onclick="fn_updateActnMttr"></sbux-button>
						</div>
					</div>
					<div style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<p>원래의 적합여부로 적용 하려면 전문품목 매입매출에서 저장</p>
						</div>
					</div>
				</c:if>
				</div>
				<%--요약 - 부류별 합계 화면에서 안보이게 처리 2025.05.28 --%>
				<%--<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶요약 - 부류별 합계</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdClsfTot" style="height:300px; width: 100%;"></div>
				</div>--%>
			</div>
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
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
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅
		await fn_initSBSelect();
		await fn_fcltMngCreateGrid01();
		//fn_fcltMngCreateGrid02();
		// await fn_createGridClsfTot();//부류별 합계

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91' || loginVO.apoSe eq '1'}">
		await fn_fcltMngCreateGrid();
		await fn_search();
	</c:if>
	<c:if test="${loginVO.apoSe eq '2'}">
		await fn_dtlSearch();
	</c:if>
	}

	/* 기본 년도값 세팅 */
	const fn_setYear = async function() {
		let cdId = "SET_YEAR";
		//SET_YEAR 공통코드의 1첫번쨰 순서의 값 불러오기
		let postJsonPromise = gfn_postJSON("/pd/bsm/selectSetYear.do", {
			cdId : cdId
		});
		let data = await postJsonPromise;
		//현재 년도(세팅값이 없는경우 현재년도로)
		let now = new Date();
		let year = now.getFullYear();
		try{
			if(!gfn_isEmpty(data.setYear)){
				year = data.setYear;
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		//기본년도 세팅
		SBUxMethod.set("srch-input-yr",year);
		SBUxMethod.set("dtl-input-yr",year);
	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분

	var jsonGrdCtpv = [];//시도
	var jsonGrdSgg = [];//시군
	var jsonGrdCorpSeCd = [];//법인구분
	var jsonComGrdAprv = [];//승인형 육성형 구분

	var jsonComGrdAprv_1 = [];//통합조직 구분
	var jsonComGrdSttgUpbrItemSe_1 = [];//품목구분

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
			//gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'UNTY_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 		'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdCtpv, 		'UNTY_CTPV'), //시도
			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdSgg, 		'UNTY_SGG'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdCorpSeCd, 	'CORP_SE_CD'),//법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 	'APRV_UPBR_SE_CD'), //신청구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdAprv_1, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdSttgUpbrItemSe_1, 	'STTG_UPBR_ITEM_SE'), //품목구분
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
		grdPrdcrOgnCurntMng.exportLocalExcel("출자출하조직관리(조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
			{caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["통합조직명"], 		ref: 'uoCorpNm',   	type:'output',  width:'100px',    style:'text-align:left'},
			{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}},
			{caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:left'},
			{caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["적합품목(전문품목)"], 		ref: 'stbltYnNmList1',   	type:'output',  width:'200px',    style:'text-align:left'},
			{caption: ["적합품목(육성품목)"], 		ref: 'stbltYnNmList2',   	type:'output',  width:'200px',    style:'text-align:left'},
			{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdCorpSeCd', label:'label', value:'value', displayui : false}},
			{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdCtpv', label:'label', value:'value', displayui : false}},
			{caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdSgg', label:'label', value:'value', displayui : false}},
			//{caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
			{caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'}
		];

		grdPrdcrOgnCurntMng = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdPrdcrOgnCurntMng.bind('click','fn_view');
		grdPrdcrOgnCurntMng.bind('beforepagechanged', 'fn_pagingBbsList');

	}

	var jsonPrdcrOgnCurntMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng01

	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};


	function fn_excelDwnld01() {
		grdPrdcrOgnCurntMng01.exportLocalExcel("출자출하조직관리 (총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 72;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.explorerbar = 'sort'; // 정렬
		SBGridProperties.useinitsorting = true; // 3번 클릭시 정렬 상태 복원
		SBGridProperties.columns = [
			{caption: ["출자출하조직명","출자출하조직명","출자출하조직명"], 					ref: 'corpNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["통합조직\n구분","통합조직\n구분","통합조직\n구분"], 	ref: 'aprv',   	type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				,typeinfo : {ref:'jsonComGrdAprv_1', label:'label', value:'value', displayui : false}},
			{caption: ["품목","품목","품목명"], 								ref: 'itemNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["품목","품목","구분"], 		ref: 'sttgUpbrItemSe',   	type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_1', label:'label', value:'value', displayui : false}},

			{caption: ["통합조직 판매위임 실적","생산자조직\n출하","물량(톤)"], 	ref: 'uoSpmtVlm',   	type:'output',  width:'50px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},
			{caption: ["통합조직 판매위임 실적","생산자조직\n출하","금액(A)(천원)"], 	ref: 'uoSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},

			{caption: ["통합조직 판매위임 실적","생산자조직 외\n출하","물량(톤)"], 	ref: 'uoSpmtVlmOther',   	type:'output',  width:'50px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},
			{caption: ["통합조직 판매위임 실적","생산자조직 외\n출하","금액(B)(천원)"], 	ref: 'uoSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},

			{caption: ["자체판매 실적","생산자조직\n출하","물량(톤)"], 			ref: 'uoOtherSpmtVlm',   	type:'output',  width:'50px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},
			{caption: ["자체판매 실적","생산자조직\n출하","금액(C)(천원)"], 			ref: 'uoOtherSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},

			{caption: ["자체판매 실적","생산자조직 외\n출하","물량(톤)"], 		ref: 'uoOtherSpmtVlmOther',   	type:'output',  width:'50px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},
			{caption: ["자체판매 실적","생산자조직 외\n출하","금액(D)(천원)"], 		ref: 'uoOtherSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:right;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}, datatype : 'number'},

			{caption: ["출자출하조직\n총 판매 실적\n(E=A+B+C+D)\n","출자출하조직\n총 판매 실적\n(E=A+B+C+D)\n","물량(톤)"],typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}
				, ref: 'uoSpmtVlmTot',   	type:'output',  width:'50px',    style:'text-align:right;', datatype : 'number'},
			{caption: ["출자출하조직\n총 판매 실적\n(E=A+B+C+D)\n","출자출하조직\n총 판매 실적\n(E=A+B+C+D)\n","금액(천원)"],typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}
				, ref: 'uoSpmtAmtTot',   	type:'output',  width:'100px',    style:'text-align:right;', datatype : 'number'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","출자출하조직의\n통합조직 판매위임비율","생산자조직출하\n[A/(A+C)]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtRt',   	type:'output',  width:'100px',    style:'text-align:right;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","출자출하조직의\n통합조직 판매위임비율","전체출하\n[(A+B)/E]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtTotRt',   	type:'output',  width:'100px',    style:'text-align:right;'},
			{caption: ["적합여부","적합여부","적합여부"], 	ref: 'orgStbltYn',   	type:'output',  width:'70px',    style:'text-align:center;'},
			{caption: ["탈락사유","탈락사유","탈락사유"], 	ref: 'stbltYnNm',   	type:'textarea',  width:'150px',    style:'padding-left:10px'
				,typeinfo : {textareanewline : true},disabled:true },
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
			{caption: ["조치사항","조치사항","조치사항"], 		ref: 'actnMttr',   	type:'input',  width:'200px',	style:'text-align:center'},
		</c:if>
			{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			//{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
			//{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'stbltYn',   		hidden : true},
			// {caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
		];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
		/*
		let rst = await Promise.all([
			fn_initSBSelectFclt(),
			fn_searchFcltList()
		])
		*/
		//grdPrdcrOgnCurntMng.refresh({"combo":true});
		//클릭 이벤트 바인드
		//grdPrdcrOgnCurntMng.bind('click','gridClick');
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
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
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

		<c:if test="${loginVO.apoSe eq '1'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
		gfn_popClipReport("검색리스트", "pd/searchList2.crf", {
			brno			: gfn_nvl(brno)
			, yr			: gfn_nvl(yr)
			, frmhsHld 		: "Y"
			, cmptnInst 	: gfn_nvl(cmptnInst)
			,ctpv 			: gfn_nvl(ctpv)
			,corpSeCd 		: gfn_nvl(corpSeCd)
			,corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			,corpNm 		: gfn_nvl(corpNm)
			,aprv 			: gfn_nvl(aprv)
			,apoSe 			: gfn_nvl(apoSe)
			,frmhsHldYn 	: gfn_nvl(frmhsHldYn)
			,yrChk 			: gfn_nvl(yrChkVal)
			,uoBrno 		: gfn_nvl(uoBrno)
		});
		</c:if>
		<c:if test="${loginVO.apoSe eq '1'}">
		gfn_popClipReport("검색리스트", "pd/searchList2.crf", {
			brno		: gfn_nvl(brno)
			, yr		: gfn_nvl(yr)
			, frmhsHld 	: "Y"
			, userType 	: "21"
		});
		</c:if>
	}


	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		fn_clearForm();//초기화
		let yr = SBUxMethod.get("srch-input-yr");//
		//통합조직인 경우
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");//
		}
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		// 요약 - 부류별 합계
		// fn_createGridClsfTot();

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		//let apoSe = SBUxMethod.get("srch-input-apoSe");//
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
		let stbltHldYn = SBUxMethod.get("srch-input-stbltHldYn");//
		</c:if>
		<c:if test="${loginVO.apoSe eq '1'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		const url = "/pd/aom/selectUoIsoOgnzList.do";

		//let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
		let postJsonPromise = gfn_postJSON(url, {
				brno : brno
				,apoSe : '2'
				,yr : yr
				,stbltYnNm:'Y'

				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
				,cmptnInst : cmptnInst
				,ctpv : ctpv

				,corpSeCd : corpSeCd
				,corpDtlSeCd : corpDtlSeCd

				,corpNm : corpNm

				,aprv : aprv
				//,apoSe : apoSe
				,uoBrno : uoBrno
				,yrChk : yrChkVal
				,stbltHldYn : stbltHldYn //적합품목 보유 여부
				</c:if>

				<c:if test="${loginVO.apoSe eq '1'}">
				,userType : '21'
				,stbltYnBrno : brno
				</c:if>

				//페이징
				,pagingYn : 'Y'
				,currentPageNo : pageNo
				,recordCountPerPage : pageSize
			});

		let data = await postJsonPromise ;
		try {
			jsonPrdcrOgnCurntMng.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {

				jsonPrdcrOgnCurntMng.push({
					apoCd: item.apoCd,
					apoSe: item.apoSe,
					ctpv: item.ctpv,
					aprv: item.aprv,
					sgg: item.sgg,
					corpNm: item.corpNm,
					crno: item.crno,
					brno: item.brno,
					uoCrno: item.uoCrno,
					uoCorpNm: item.uoCorpNm,
					yr: item.yr,
					corpSeCd: item.corpSeCd,
					stbltYnNm: item.stbltYnNm,
					stbltYnNmList: item.stbltYnNmList,
					stbltYnNmList1: item.stbltYnNmList1,
					stbltYnNmList2: item.stbltYnNmList2,
				});

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonPrdcrOgnCurntMng.length > 0) {

				if (grdPrdcrOgnCurntMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdPrdcrOgnCurntMng.rebuild();
				} else {
					grdPrdcrOgnCurntMng.refresh()
				}
			} else {
				grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount);
				grdPrdcrOgnCurntMng.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdPrdcrOgnCurntMng.rebuild();

		} catch (e) {
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
		let yr = SBUxMethod.get("dtl-input-yr");//

		try {
			const postJsonPromise = gfn_postJSON("/pd/isom/selectInvShipOgnGenalTblMngIsoList.do", {
				brno : brno,
				yr : yr
			});

			const data = await postJsonPromise ;

			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//사업자등록번호
			});

			await fn_searchUoList(yr);

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	//총괄표 출력
	const fn_report2 = async function() {
		let reqBrno = SBUxMethod.get('dtl-input-brno');
		let reqYr = SBUxMethod.get('dtl-input-yr');
		let reqUoBrno = SBUxMethod.get('dtl-input-uoBrno');

		let reqCorpNmT = $('#dtl-input-corpNm').val();
		let reqBrnoT = $('#dtl-input-brno').val();
		let reqCrnoT = $('#dtl-input-crno').val();
		let reqUoBrnoT = $('#dtl-input-selUoBrno option:checked').text();

		if(!reqBrno){
			alert("법인체를 선택하세요");
			return false;
		}

		if(!reqUoBrno || reqUoBrno == "" || reqUoBrno == "null"){
			alert("통합조직을 선택하세요");
			return false;
		}
		gfn_popClipReport("출자출하 조직관리 총괄표", "pd/docAll2.crf", {
			brno 		: gfn_nvl(reqBrno)
			, yr 		: gfn_nvl(reqYr)
			, uobrno 	: gfn_nvl(reqUoBrno)
			, corpnm 	: gfn_nvl(reqCorpNmT)
			, buisno 	: gfn_nvl(reqBrnoT)
			, corpno 	: gfn_nvl(reqCrnoT)
			, allgroup 	: gfn_nvl(reqUoBrnoT)
		});
	}

	//총괄표 조회
	async function fn_dtlGridSearch() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let ctgryCd = SBUxMethod.get('dtl-input-ctgryCd');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		if(gfn_isEmpty(uoBrno)){
			alert("통합조직을 선택해 주세요");
			return;
		}

		try {
			const param = {
				apoCd: apoCd,
				apoSe: apoSe,
				itemCd: itemCd,
				ctgryCd: ctgryCd,
				uoBrno: uoBrno,
				brno: brno,
				yr : yr
			}
			//"/pd/isom/selectIsoPrchsSlsSummaryList.do";
			const postJsonPromise = gfn_postJSON("/pd/isom/selectInvShipOgnGenalTblMngListNew.do", param);
			//const postJsonPromise = gfn_postJSON("/pd/isom/selectIsoPrchsSlsSummaryList.do", param);
			const data = await postJsonPromise;

			jsonPrdcrOgnCurntMng01.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO01 = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno
						,corpNm: item.corpNm
						,delYn: item.delYn
						,yr: item.yr

						,aprv: item.aprv

						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm

						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm

						,ctgryCd: 		item.ctgryCd
						,ctgryNm: 		item.ctgryNm

						,uoSpmtAmt: 			item.uoSpmtAmt
						,uoSpmtAmtOther: 		item.uoSpmtAmtOther
						,uoOtherSpmtAmt: 		item.uoOtherSpmtAmt
						,uoOtherSpmtAmtOther: 	item.uoOtherSpmtAmtOther

						,uoSpmtVlm: 			item.uoSpmtVlm
						,uoSpmtVlmOther: 		item.uoSpmtVlmOther
						,uoOtherSpmtVlm: 		item.uoOtherSpmtVlm
						,uoOtherSpmtVlmOther: 	item.uoOtherSpmtVlmOther

						,uoSpmtAmtRt: 			item.uoSpmtAmtRt
						,uoSpmtAmtTotRt: 		item.uoSpmtAmtTotRt
						,uoSpmtVlmTot: 			item.uoSpmtVlmTot
						,uoSpmtAmtTot: 			item.uoSpmtAmtTot

						,stbltYn: item.stbltYn//적합여부 기준 적용 결과
						,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
						,stbltYnNm: fn_calStbltYn(item)
						,stbltYnNm: item.stbltYnNm
	   				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
						,actnMttr: 		item.actnMttr
					</c:if>
				};

				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
			});

			grdPrdcrOgnCurntMng01.rebuild();

			let rowData = grdPrdcrOgnCurntMng01.getRowData(2);

			// fn_dtlSearchClsfTot(); // 요약 - 부류별합계
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//탈락적합 사유
	function fn_calStbltYn(item) {
		let stbltYnNmMng = [];
		//console.log(item);
		//강제로 변경한 경우가 존재 함
		if(!gfn_isEmpty(item.orgStbltYn)){
			if (item.orgStbltYn == 'Y') {
				return "";
			}
		}

		if(item.aprv == '1'){
			if(item.sttgUpbrItemSe == '1'){
				if(item.chkAA != 'Y'){
					stbltYnNmMng.push('통합조직 판매위임 금액 미달');
				}
				if(item.chkAB != 'Y'){
					stbltYnNmMng.push('생산자조직 출하금액 중 통합조직 출하비율 미달');
				}
				if(item.chkAC != 'Y'){
					stbltYnNmMng.push('총취급액 중 통합조직 출하비율 미달');
				}
			}
		}else if(item.aprv == '2'){
			if(item.chkBA != 'Y'){
				stbltYnNmMng.push('통합조직 판매위임 금액 미달');
			}
			/*
			if(item.chkBB != 'Y'){
				stbltYnNmMng.push('생산자조직 출하금액 중 통합조직 출하비율 미달\n(육성형-전문품목의 경우 약정출하물량은 전량 통합조직으로만 판매)');
			}
			*/
			if(item.chkBC != 'Y'){
				stbltYnNmMng.push('총취급액 중 통합조직 출하비율 미달');
			}
		}
		return stbltYnNmMng.join(" \n");
	}

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

		if (nRow == null) {
			nRow = 1;
		}

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		//console.log(rowData);
		fn_clearForm();

		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도

		await fn_searchUoList(rowData.yr);
	}

	//총괄표 그리드 초기화
	function fn_clearForm() {
		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-yr',null)//등록년도
		SBUxMethod.set('dtl-input-uoBrno',null)//선택한 통합조직
		SBUxMethod.set('dtl-input-selUoBrno',null)//상위 통합조직 리스트

		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonClsfTot.length= 0;
		//grdClsfTot.rebuild();
	}

	var comUoBrno = [];//통합조직 선택

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(yr) {

		let brno;
		//출자출하조직이 아닌경우
		<c:if test="${loginVO.apoSe ne '2'}">
		brno = SBUxMethod.get('dtl-input-brno');
		</c:if>
		//출자출하조직인 경우
		<c:if test="${loginVO.apoSe eq '2'}">
		brno = '${loginVO.brno}';
		</c:if>


		try {
			// let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			// 	brno : brno
			// });
			// let data = await postJsonPromise;

			const postJsonPromise = gfn_postJSON("/pd/bsm/selectUoHstryList.do", {
				brno: brno,
				yr: yr
			});

			const data = await postJsonPromise;

			comUoBrno = [];
			let uoBrno;
			data.resultList.forEach((item, index) => {
				uoBrno = item.uoBrno;
				let uoListVO = {
						'text': item.uoCorpNm,
						'label': item.uoCorpNm,
						'value': item.uoBrno,
						'uoApoCd': item.uoApoCd
				}

				comUoBrno.push(uoListVO);
			});

			SBUxMethod.refresh('dtl-input-selUoBrno');
			//console.log(comUoBrno);
			if (comUoBrno.length == 1){
				await SBUxMethod.set('dtl-input-selUoBrno' , uoBrno);
				await SBUxMethod.set('dtl-input-uoBrno',uoBrno);
				await fn_dtlGridSearch();
			}
		} catch (e) {
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
		//console.log(selCombo);

		if (gfn_isEmpty(selCombo)) {
			SBUxMethod.set('dtl-input-uoBrno' , null);
		} else {
			SBUxMethod.set('dtl-input-uoBrno',selCombo.value);
		}
	}

	//적합여부 변경
	async function fn_updateStbltYn(_chk){
		//console.log("*************fn_updateStbltYn******************");
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
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let rowData = grdPrdcrOgnCurntMng01.getRowData(nRow);
		let itemCd = rowData.itemCd;

		let postJsonPromise = gfn_postJSON("/pd/isom/updateStbltYn.do", {
			brno : brno
			,stbltYn : stbltYn
			,uoBrno : uoBrnoVal
			,yr : yr
			,itemCd : itemCd
		});
		let data = await postJsonPromise;

		try{
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");// I0001	처리 되었습니다.
				fn_dtlGridSearch();
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

	//조치사항 저장
	const fn_updateActnMttr = async function(){
		let objGrid = grdPrdcrOgnCurntMng01;
		let gridData01 = objGrid.getGridDataAll();
		let saveList = [];

		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){
			return false;
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

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		for(var i = captionRow; i < gridData01.length + captionRow; i++ ){
			let rowData01 = objGrid.getRowData(i);
			let rowSts01 = objGrid.getRowStatus(i);
			//let delYn = rowData01.delYn;

			rowData01.rowSts = "I";
			rowData01.uoBrno = uoBrnoVal;
			rowData01.apoSe = "2";
			saveList.push(rowData01);
			/*
			if (rowSts01 === 3){
				rowData01.rowSts = "I";
				saveList.push(rowData01);
			} else if (rowSts01 === 2){
				rowData01.rowSts = "I";
				saveList.push(rowData01);
			} else if (rowSts01 === 1){
				rowData01.rowSts = "I";
				saveList.push(rowData01);
			} else {
				continue;
			}
			*/
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}
		// console.log(saveList);

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveItemIsoActnMttr.do", saveList);
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

	/* 매출현황 평가부류별 요약표 */
	var jsonClsfTot = []; // 그리드의 참조 데이터 주소 선언
	var grdClsfTot;

	const objMenuList04 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld04,			//콜백함수명
			}
		};

	function fn_excelDwnld04() {
		grdPrdcrOgnCurntMng04.exportLocalExcel("출자출하조직관리(총괄표 - 부류별 합계)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_createGridClsfTot = async function() {
		let yr = SBUxMethod.get("srch-input-yr");
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");
		}
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		let prvYr = Number(yr) - 1;
		let prvTotStr = prvYr + "년";
		let totStr = yr + "년";

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdClsfTot';
		SBGridProperties.id = 'grdClsfTot';
		SBGridProperties.jsonref = 'jsonClsfTot';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList04;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = true;
		SBGridProperties.mergecells = 'bycolrec';//병합 설정 bycol : 상하 , byrow : 좌우 , bycolrec : 상하 병합 후 좌우
		SBGridProperties.datamergefalseskip = true;//병합 제외 설정 merge : false
		SBGridProperties.explorerbar = 'sort'; // 정렬
		SBGridProperties.useinitsorting = true; // 3번 클릭시 정렬 상태 복원
		SBGridProperties.columns = [
			{caption: ["구분","구분"]
				,ref: 'clsfSeNm',		type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["부류","부류"]
				,ref: 'clsfNm',		type:'output',  width:'100px',    style:'text-align:center'},

			{caption: [prvTotStr,"취급 물량(톤)"]
				,ref: 'prvTotVlm',	type:'output',	width:'100px',    style:'text-align:right', merge : false
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}, datatype : 'number'},
			{caption: [prvTotStr,"취급액(천원)"]
				,ref: 'prvTotAmt',	type:'output',  width:'100px',    style:'text-align:right', merge : false
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}, datatype : 'number'},

			{caption: [totStr,"취급 물량(톤)"]
				,ref: 'totVlm',	type:'output',  width:'100px',    style:'text-align:right', merge : false
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}, datatype : 'number'},
			{caption: [totStr,"취급액(천원)"]
				,ref: 'totAmt',	type:'output',  width:'100px',    style:'text-align:right', merge : false
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}, datatype : 'number'},

			{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
		];
		grdClsfTot = _SBGrid.create(SBGridProperties);
	}

	//총괄표 조회
	async function fn_dtlSearchClsfTot() {

		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){return;}
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		let yr = SBUxMethod.get('dtl-input-yr');

		if(gfn_isEmpty(uoBrno)){
			alert("통합조직을 선택해 주세요");
			return;
		}

		let postJsonPromise01 = gfn_postJSON("/pd/isom/selectIsoClsfTot.do", {
			uoBrno : uoBrno
			,brno : brno
			,yr : yr
		});
		let data = await postJsonPromise01;
		try{
			jsonClsfTot.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let itemVO = {
						clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,clsfSeNm: 		item.clsfSeNm

						,totVlm: 		item.totVlm
						,totAmt: 		item.totAmt
						,prvTotVlm: 	item.prvTotVlm
						,prvTotAmt: 	item.prvTotAmt
				};

				jsonClsfTot.push(itemVO);
			});

			grdClsfTot.rebuild();

			fn_clsfTot();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 부류별 합계 그리드 합계 */
	function fn_clsfTot(){
		// 합계를 저장할 변수 초기화
		let totalSum = {
			clsfNm: '합계',
			clsfSeNm: '합계',
			totVlm: 0,
			totAmt: 0,
			prvTotVlm: 0,
			prvTotAmt: 0
		};

		let objGrid = grdClsfTot;

		let col1 = objGrid.getColRef("clsfSeNm");//
		let col2 = objGrid.getColRef("clsfNm");//
		let col3 = objGrid.getColRef("totAmt");//

		let gridData01 = objGrid.getGridDataAll();
		let captionRow = objGrid.getFixedRows();
		for (let i = captionRow; i < gridData01.length + captionRow; i++) {
			// 현재 행 데이터 가져오기
			let rowData01 = objGrid.getRowData(i);
			if(rowData01.clsfNm !== '소계'){
				totalSum.totVlm 	+= Number(rowData01.totVlm || 0);
				totalSum.totAmt 	+= Number(rowData01.totAmt || 0);
				totalSum.prvTotVlm 	+= Number(rowData01.prvTotVlm || 0);
				totalSum.prvTotAmt 	+= Number(rowData01.prvTotAmt || 0);
			}else if(rowData01.clsfNm === '소계'){
				objGrid.setCellStyle('background-color', i, col2, i, col3, 'lightgray');
			}
		}

		objGrid.addRow();
		let lastRow = gridData01.length + captionRow-1;
		objGrid.setCellStyle('background-color', lastRow , col1, lastRow, col3, 'lightgray');
		// 합계 데이터를 objGrid에 설정
		Object.keys(totalSum).forEach((key) => {
			objGrid.setCellData( lastRow, objGrid.getColRef(key), totalSum[key]);
		});
		//objGrid.rebuild();
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
			{caption: ["신청년도"],			ref:'yr',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["사업자번호"],		ref:'brno',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["법인명"],			ref:'corpNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["조직코드"],			ref:'apoCd',		type:'output',width:'60px',style:'text-align:center'},
			{caption: ["통합조직 사업자번호"],	ref:'uoBrno',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 법인명"],	ref:'uoCorpNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 구분"],		ref:'aprv',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 구분명"],	ref:'aprvNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 조직코드"],	ref:'uoApoCd',		type:'output',width:'60px',style:'text-align:center'},
			{caption: ["품목코드"],			ref:'itemCd',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["품목명"],			ref:'itemNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["분류코드"],			ref:'ctgryCd',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["분류명"],			ref:'ctgryNm',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["전문/육성 구분코드"],	ref:'sttgUpbrItemSe',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["전문/육성 구분"],	ref:'sttgUpbrItemSeNm',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 판매위임액 생산자조직 출하 물량(톤)"],			ref:'uoSpmtVlm',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["(A)통합조직 판매위임액 생산자조직 출하 금액(천원)"],	ref:'uoSpmtAmt',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 판매위임액 생산자조직 외 출하 물량(톤)"],		ref:'uoSpmtVlmOther',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["(B)통합조직 판매위임액 생산자조직 외 출하 금액(천원)"],	ref:'uoSpmtAmtOther',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["자체판매액 생산자조직 출하 물량(톤)"],				ref:'uoOtherSpmtVlm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["(C)자체판매액 생산자조직 출하 금액(천원)"],			ref:'uoOtherSpmtAmt',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["자체판매액 생산자조직 외 출하 물량(톤)"],			ref:'uoOtherSpmtVlmOther',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["(D)자체판매액 생산자조직 외 출하 금액(천원)"],		ref:'uoOtherSpmtAmtOther',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["(E=A+B+C+D)출자출하조직 총 물량(톤)"],			ref:'uoSpmtVlmTot',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["(E=A+B+C+D)출자출하조직 총 판매액(천원)"],		ref:'uoSpmtAmtTot',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["[A/(A+C)]출자출하조직의 통합조직 판매위임비율 생산자조직출하 "],	ref:'uoSpmtAmtRt',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["[(A+B)/E]출자출하조직의 통합조직 판매위임비율 전체출하 "],		ref:'uoSpmtAmtTotRt',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["적합여부(기준적용)"],	ref:'stbltYn',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["적합여부(실제)"],	ref:'orgStbltYn',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["선정여부"],			ref:'lastStbltYn',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["탈락사유"],			ref:'stbltYnNm',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["조치사항"],			ref:'actnMttr',		type:'output',width:'70px',style:'text-align:center'},
		];


		hiddenGrd = _SBGrid.create(SBGridProperties);

	}

	const fn_hiddenGrdSelect = async function(){

		if (!gfn_comConfirm("Q0001", "Rawdata 다운로드")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		await fn_hiddenGrd();
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}


		try {
			const postJsonPromise = gfn_postJSON("/pd/isom/selectInvShipOgnGenalTblMngSelectRawDataList2025.do", {
			//let postJsonPromise = gfn_postJSON("/pd/isom/selectIsoPrchsSlsRawdataList.do", {
				yr : yr
			});

			const data = await postJsonPromise;
			jsonHiddenGrd.length = 0;

			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
					yr						:item.yr,
					uoBrno					:item.uoBrno,
					uoCorpNm				:item.uoCorpNm,
					uoApoCd					:gfn_nvl(item.uoApoCd),
					brno					:item.brno,
					corpNm					:item.corpNm,
					apoCd					:gfn_nvl(item.apoCd),
					uoCrno					:item.uoCrno,
					uoCorpNm				:item.uoCorpNm,
					aprv					:item.aprv,
					aprvNm					:item.aprvNm,
					itemCd					:item.itemCd,
					itemNm					:item.itemNm,
					ctgryCd					:item.ctgryCd,
					ctgryNm					:item.ctgryNm,
					sttgUpbrItemSe			:item.sttgUpbrItemSe,
					sttgUpbrItemNm			:item.sttgUpbrItemNm,
					sttgUpbrItemSeNm		:item.sttgUpbrItemSeNm,

					uoSpmtAmt				:Number(item.uoSpmtAmt),
					uoSpmtAmtOther			:Number(item.uoSpmtAmtOther),
					uoOtherSpmtAmt			:Number(item.uoOtherSpmtAmt),
					uoOtherSpmtAmtOther		:Number(item.uoOtherSpmtAmtOther),

					uoSpmtVlm				:Number(item.uoSpmtVlm),
					uoSpmtVlmOther			:Number(item.uoSpmtVlmOther),
					uoOtherSpmtVlm			:Number(item.uoOtherSpmtVlm),
					uoOtherSpmtVlmOther		:Number(item.uoOtherSpmtVlmOther),

					uoSpmtVlmTot			:Number(item.uoSpmtVlmTot),
					uoSpmtAmtTot			:Number(item.uoSpmtAmtTot),
					uoSpmtAmtRt				:Number(item.uoSpmtAmtRt),
					uoSpmtAmtTotRt			:Number(item.uoSpmtAmtTotRt),

					stbltYn					:item.stbltYn,
					orgStbltYn				:item.orgStbltYn,
					lastStbltYn				:item.lastStbltYn,
					stbltYnNm				:fn_calStbltYn(item),
					//stbltYnNm				:item.stbltYnNm,
					actnMttr				:item.actnMttr,
				}
				jsonHiddenGrd.push(hiddenGrdVO);
			});

			await hiddenGrd.rebuild();

			await fn_excelDown(yr);

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	//로우 데이터 엑셀 다운로드
	/**
	 * @param yr
	 */
	function fn_excelDown(yr){
		const currentDate = new Date();


		// const year = currentDate.getFullYear().toString().padStart(4, '0');
		// const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		// const day = currentDate.getDate().toString().padStart(2, '0');
		// let formattedDate = year + month + day;

		// let fileName = formattedDate + "_총괄표_출자출하조직_로우데이터_" + yr + "년";
		const fileName = gfn_dateToYmd(currentDate) + "_총괄표_출자출하조직_로우데이터_" + yr + "년";

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

	/* 과거 실적 조회 팝업 추가 */

	//과거 조회 팝업
	const fn_openMaodal = function() {
		//사업자번호
		let brno = SBUxMethod.get("dtl-input-brno");

		if(gfn_isEmpty(brno)){
			alert("선택된 조직이 없습니다");
			return;
		}

		//popBizPlanPdfViewer.init(rowData , fn_setPdfViewer);
		//SBUxMethod.openModal('modal-bizPlanPdfViewer');

		var url = "/pd/hisPopup/IsoGenalTblHisPopup.do"
		var title = "제출실적 보기";
		//SBUxMethod.popupWindow(url, title, '600px','500px');

		window.open(url, title, "width=1000px,height=900px");
	}

	//팝업 새창에서 변수 확인
	function fn_getData() {
		let data = [];
		data.brno = SBUxMethod.get("dtl-input-brno");
		data.corpNm = SBUxMethod.get("dtl-input-corpNm");
		return data;
	}

</script>
</html>