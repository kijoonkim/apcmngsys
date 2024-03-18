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
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 등록결과확인 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnAllSave" name="btnAllSave" uitype="normal" text="선정여부 일괄 저장" class="btn btn-sm btn-outline-danger" onclick="fn_allSave()"></sbux-button>
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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

							<th colspan="2" scope="row" class="th_bg">출자출하조직 사업자번호로 검색</th>
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
				<!--[pp] 검색결과 -->
				<br>
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<table class="table table-bordered tbl_fixed">
					<caption>통합조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
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
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
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
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
						<!--
						<tr>
							<th scope="row" class="th_bg th_border_right">적합여부</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-stbltYn"
									name="dtl-input-stbltYn"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">자금신청액</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-fundAplyAmtTot"
									name="dtl-input-fundAplyAmtTot"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>(출자출하조직 자금신청액 포함)
							</td>
							<td class="td_input"  style="border-left: hidden;">
							</td>
							<th scope="row" class="th_bg th_border_right">금리</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-aa"
									name="dtl-input-aa"
									class="form-control input-sm"
									mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': false }"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
						-->
					</tbody>
				</table>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<!--
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶생산자조직 -적합조직</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdPrdcrOgnCurntMng03" style="height:200px; width: 100%;"></div>
				</div>
				 -->
				<!--
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶생산자조직 -부적합조직</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdPrdcrOgnCurntMng04" style="height:200px; width: 100%;"></div>
				</div>
				 -->
				<div class="ad_section_top" style="width: 98%;">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 -적합조직(품목별)</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:200px; width: 100%;"></div>
				</div>

				<div class="ad_section_top" style="width: 98%;">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 -부적합조직(품목별)</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng05" style="height:200px; width: 100%;"></div>
				</div>

				<div class="ad_section_top" style="width: 98%;">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">

							<c:if test="${loginVO.userType ne '02'}">
								<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="출자출하조직 선정여부 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
							</c:if>

						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 -선정여부</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng06" style="height:200px; width: 100%;"></div>
				</div>

				<div class="ad_section_top" style="width: 98%;">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶통합조직(품목별)</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:200px; width: 100%;"></div>
				</div>

				<div class="ad_section_top" style="width: 98%;">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">

							<c:if test="${loginVO.userType ne '02'}">
								<sbux-button id="btnSaveFclt2" name="btnSaveFclt2 uitype="normal" text="통합조직 선정여부 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
							</c:if>

						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶통합조직 -선정여부</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng07" style="height:200px; width: 100%;"></div>
				</div>
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
		var now = new Date();
		var year = now.getFullYear();//현재년도

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		SBUxMethod.set("srch-input-yr",year);//
		await fn_fcltMngCreateGrid();
	</c:if>
		await fn_fcltMngCreateGrid01();//통합조직
		await fn_fcltMngCreateGrid02();//출자출하조직 적합리스트
		await fn_fcltMngCreateGrid03();//생산자조직 적합리스트
		await fn_fcltMngCreateGrid04();//생산자조직 부적합리스트
		await fn_fcltMngCreateGrid05();//출자출하조직 부적합리스트
		await fn_fcltMngCreateGrid06();//출자출하조직 선정여부 리스트
		await fn_fcltMngCreateGrid07();//통합조직 선정여부

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
		SBUxMethod.set("dtl-input-yr",year);//
		//관리자만 사용 예정
		//await fn_dtlSearch();
	</c:if>
	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분

	var jsonComGrdCtpv = [];//시도
	var jsonComGrdSgg = [];//시군
	var jsonComGrdCorpSeCd = [];//법인구분
	var jsonComGrdAprv = [];//신청구분

	//var jsonComGrdAprv_1 = [];//통합조직 구분
	//var jsonComGrdSttgUpbrItemSe_1 = [];//품목구분

	//var jsonComGrdAprv_2 = [];//통합조직 구분
	//var jsonComGrdSttgUpbrItemSe_2 = [];//품목구분

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];

	//선정여부
	var comStbltYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];

	//탈락사유 구분
	var comIcptRsnCdIso01 = [
		{'text': '기본요건 미충족',	'label': '기본요건 미충족', 	'value': 'A'},
		{'text': '세부요건 미충족',	'label': '세부요건 미충족', 	'value': 'B'},
		{'text': '통합조직 탈락',	'label': '통합조직 탈락', 	'value': 'C'}
	];

	var comIcptRsnCdUo01 = [
		{'text': '기본요건 미충족',	'label': '기본요건 미충족', 	'value': 'A'},
		{'text': '세부요건 미충족',	'label': '세부요건 미충족', 	'value': 'B'}
	];

	//세부탈락사유 구분
	var comIcptRsnDtlCdIso01 = [
		{'text': '기본요건 미충족',	'label': '농업경영체 미등록', 				'value': 'A1', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '출자자본금 1억원 미달', 			'value': 'A2', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '설립 후 운영실적 1년 미만', 		'value': 'A3', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '농업인 주주 5명 미만', 			'value': 'A4', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '농업인 주주 지분 50% 미만', 		'value': 'A5', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '원예농산물 취급액 50% 미만', 		'value': 'A6', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '조공설립계획 미수립', 			'value': 'A7', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '현장실사 미참여', 				'value': 'A8', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '품목 부적합',		'label': '품목 부적합(농협조직)', 			'value': 'B1', 'icptRsnCd':'B', 'pnlty': '최고금리',		'itrRt': '3' },
		{'text': '품목 부적합',		'label': '품목 부적합(농업법인, 협동조합)', 	'value': 'B2', 'icptRsnCd':'B', 'pnlty': '최고금리',		'itrRt': '2.5' },
		{'text': '통합조직 탈락',	'label': '통합조직 탈락(농협조직)', 		'value': 'C1', 'icptRsnCd':'C', 'pnlty': '최고금리',		'itrRt': '3' },
		{'text': '통합조직 탈락',	'label': '통합조직 탈락(농업법인, 협동조합)', 	'value': 'C2', 'icptRsnCd':'C', 'pnlty': '최고금리',		'itrRt': '2.5' }
	];

	//세부탈락사유 구분
	var comIcptRsnDtlCdUo01 = [
		{'text': '기본요건 미충족',	'label': '농업경영체 미등록', 				'value': 'A1', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '출자자본금 1억원 미달', 			'value': 'A2', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '설립 후 운영실적 1년 미만', 		'value': 'A3', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '농업인 주주 5명 미만', 			'value': 'A4', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '농업인 주주 지분 50% 미만', 		'value': 'A5', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '원예농산물 취급액 50% 미만', 		'value': 'A6', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '조공설립계획 미수립', 			'value': 'A7', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '현장실사 미참여', 				'value': 'A8', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '품목 부적합',		'label': '품목 부적합(농협조직)', 			'value': 'B1', 'icptRsnCd':'B', 'pnlty': '최고금리',		'itrRt': '3' },
		{'text': '품목 부적합',		'label': '품목 부적합(농업법인, 협동조합)', 	'value': 'B2', 'icptRsnCd':'B', 'pnlty': '최고금리',		'itrRt': '2.5' }
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
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 	'CMPTN_INST_CTPV'), //시도
			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 	'APRV_UPBR_SE_CD'), //신청구분

			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdAprv_1, 	'APRV_UPBR_SE_CD'), //신청구분
			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdSttgUpbrItemSe_1, 	'STTG_UPBR_ITEM_SE'), //품목구분

			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonComGrdAprv_2, 	'APRV_UPBR_SE_CD'), //신청구분
			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonComGrdSttgUpbrItemSe_2, 	'STTG_UPBR_ITEM_SE'), //품목구분

		]);
		console.log("============fn_initSBSelect=====1=======");
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
		grdPrdcrOgnCurntMng.exportLocalExcel("통합조직관리(조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
		//SBGridProperties.extendlastcol = 'scroll';
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
			{caption: ["법인체마감"], 		ref: 'prfmncCorpDdlnYn',   	type:'output',  width:'100px',    style:'text-align:center'},
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직 결과 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//통합조직 리스트
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		//SBGridProperties.whitespacemerge = true;//빈칸 자동병합
		//SBGridProperties.mergecellsverticalalign = 'bottom';
		SBGridProperties.columns = [
				{caption: ["품목"], 			ref: 'itemNm',		type:'output',  width:'100px',    style:'text-align:center;'},
				{caption: ["통합조직\n구분"], 	ref: 'aprvNm',		type:'output',  width:'55px',    style:'text-align:center;'},
				{caption: ["구분"], 			ref: 'sttgUpbrItemNm',	type:'output',  width:'55px',    style:'text-align:center;'},
				{caption: ["부류"], 			ref: 'ctgryNm',		type:'output',  width:'100px',    style:'text-align:center;'},
				//{caption: ["통합조직\n구분"], 	ref: 'aprv',   	type:'combo',  width:'100px',    style:'text-align:center;', disabled:true
					//,typeinfo : {ref:'jsonComGrdAprv_1', label:'label', value:'value', displayui : false}},
				//{caption: ["구분"], 		ref: 'sttgUpbrItemSe',   	type:'combo',  width:'100px',    style:'text-align:center;', disabled:true
					//,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_1', label:'label', value:'value', displayui : false}},

				/*
				{caption: ["통합조직 총\n취급액(천원)(A)"], 		ref: 'slsCnsgnSlsAmtTot',   	type:'output',  width:'100px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				{caption: ["생산자조직\n전속출하액(천원)(B)"], 	ref: 'slsCnsgnSlsAmt',   	type:'output',  width:'120px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				{caption: ["전속취급률(%)\n(B/A)"], 			ref: 'slsCnsgnSlsAmtRt',   		type:'output',  width:'100px',    style:'text-align:center;'
					,format: {type: 'string', rule: '@" %"'}},
				*/

				{caption: ["상세내역"], 	ref: 'slsCnsgnSlsAmtTot',	hidden : true},
				{caption: ["상세내역"], 	ref: 'slsCnsgnSlsAmt',		hidden : true},
				{caption: ["상세내역"], 	ref: 'slsCnsgnSlsAmtRt',	hidden : true},

				{caption: ["품목 적합여부"], 	ref: 'orgStbltYn',   		type:'output',  width:'90px',    style:'text-align:center;'},
				{caption: ["품목 부적합 사유"], 	ref: 'stbltYnNm',   		type:'textarea',  width:'300px',    style:'padding-left:10px'
					,typeinfo : {textareanewline : true},disabled:true },
				{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
				{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'stbltYn',   		hidden : true},
			];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	}

	var jsonPrdcrOgnCurntMng07 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng07;

	const objMenuList07 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld07,			//콜백함수명
			}
		};


	function fn_excelDwnld07() {
		grdPrdcrOgnCurntMng07.exportLocalExcel("통합조직 선정여부", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//통합조직 선정여부
	const fn_fcltMngCreateGrid07 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng07';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng07';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng07';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheight = 57;
		SBGridProperties.columns = [
				{caption: ["통합조직명"],	ref: 'corpNm',		type:'output',  width:'160px',    style:'text-align:center;'},
				{caption: ["사업자번호"],	ref: 'brno',		type:'output',  width:'80px',    style:'text-align:center;'},
				{caption: ["선정여부"], 	ref: 'stbltYn',		type:'output',  width:'60px',    style:'text-align:center;'},
				{caption: ["적합품목"], 	ref: 'stbltItemList',	type:'output',  width:'160px',    style:'text-align:center;'},

				{caption: ["탈락사유구분"], 	ref: 'icptRsnCd',	type:'combo',  width:'120px',    style:'text-align:center;', disabled : true
					,typeinfo : {ref:'comIcptRsnCdUo01', label:'label', value:'value', displayui : true}
				},
				{caption: ["세부탈락사유"], 	ref: 'icptRsnDtlCd',	type:'combo',  width:'160px',    style:'text-align:center;', disabled : true
					,typeinfo : {ref:'comIcptRsnDtlCdUo01', label:'label', value:'value', displayui : true
						,filtering: { usemode: true, uppercol: 'icptRsnCd', attrname: 'icptRsnCd', listall: false}
					}
				},
				{caption: ["패널티"], 		ref: 'pnlty',	type:'output',  width:'110px',    style:'text-align:center;'},
				{caption: ["자금신청액(천원)\n(출자출하조직 신청액 포함)"], 	ref: 'fundAplyAmtTot',	type:'output',  width:'160px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				{caption: ["자금신청액(천원)\n(탈락 출자출하조직 신청액은 제외)"], 	ref: 'fundAplyAmtStbltTot',	type:'output',  width:'160px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}
					,columnhint : '<div style="width: auto;">출자출하조직 저장완료 후 정상적으로 보입니다</div>'
				},
				{caption: ["금리(%)"], 		ref: 'itrRt',			type:'output',  width:'80px',    style:'text-align:center;'
					,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}
				},
				{caption: ["선정여부\n(관리자입력)"], 	ref: 'mngrBscStbltYn',	type:'combo',  width:'90px',    style:'text-align:center;'
					,typeinfo : {ref:'comStbltYn', label:'label', value:'value', displayui : true}
				},
				{caption: ["탈락사유구분\n(관리자입력)"], 	ref: 'mngrIcptRsnCd',	type:'combo',  width:'160px',    style:'text-align:center;'
					,typeinfo : {ref:'comIcptRsnCdUo01', label:'label', value:'value', displayui : true}
				},
				{caption: ["세부탈락사유\n(관리자입력)"], 	ref: 'mngrIcptRsnDtlCd',	type:'combo',  width:'160px',    style:'text-align:center;'
					,typeinfo : {ref:'comIcptRsnDtlCdUo01', label:'label', value:'value', displayui : true
						,filtering: { usemode: true, uppercol: 'mngrIcptRsnCd', attrname: 'icptRsnCd', listall: false}
					}
				},
				{caption: ["패널티\n(관리자입력)"], 		ref: 'mngrPnlty',	type:'output',  width:'110px',    style:'text-align:center;'},
				{caption: ["금리(%)\n(관리자입력)"], 		ref: 'mngrItrRt',			type:'input',  width:'120px',    style:'text-align:center;'
					,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}
				},
				{caption: ["비고"], 		ref: 'rmrk', 	type:'input',  width:'200px',	style:'text-align:center'},
				{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
				//{caption: ["상세내역"], 	ref: 'stbltItemList',   hidden : true},
			];

		grdPrdcrOgnCurntMng07 = _SBGrid.create(SBGridProperties);
		grdPrdcrOgnCurntMng07.bind('valuechanged', fn_valueChangedUo);
	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02

	const objMenuList02 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld02,			//콜백함수명
			}
		};


	function fn_excelDwnld02() {
		grdPrdcrOgnCurntMng02.exportLocalExcel("출자출하조직 적합 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }


	/* Grid 화면 그리기 기능*/
	//출자출하조직 적합 리스트
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
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["품목"],			ref: 'itemNm',   		type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["통합조직\n구분"],	ref: 'aprvNm',   		type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["구분"],			ref: 'sttgUpbrItemNm',	type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["부류"],			ref: 'ctgryNm',   		type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직명"],		ref: 'corpNm',   		type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["사업자번호"],		ref: 'brno',   			type:'output',  width:'80px',    style:'text-align:center;'},
			//{caption: ["통합조직\n구분","통합조직\n구분"], 	ref: 'aprv',   	type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				//,typeinfo : {ref:'jsonComGrdAprv_2', label:'label', value:'value', displayui : false}},
			//{caption: ["품목","구분"], 		ref: 'sttgUpbrItemSe',		type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				//,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_2', label:'label', value:'value', displayui : false}},

			/*
			{caption: ["통합조직 판매위임액","생산자조직\n출하(A)(천원)"], 	ref: 'uoSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["통합조직 판매위임액","생산자조직 외\n출하(B)(천원)"], 	ref: 'uoSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체판매액","생산자조직\n출하(C)(천원)"], 			ref: 'uoOtherSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체판매액","생산자조직 외\n출하(D)(천원)"], 		ref: 'uoOtherSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직\n총 판매액\n(E=A+B+C+D)\n(천원)","출자출하조직\n총 판매액\n(E=A+B+C+D)\n(천원)"],typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}
				, ref: 'uoSpmtAmtTot',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","생산자조직출하\n[A/(A+C)]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtRt',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","전체출하\n[(A+B)/E]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtTotRt',   	type:'output',  width:'100px',    style:'text-align:center;'},
			*/

			{caption: ["상세내역"], 	ref: 'uoSpmtAmt',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtOther',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoOtherSpmtAmt',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoOtherSpmtAmtOther',	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtTot',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtRt',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtTotRt',   	hidden : true},

			{caption: ["품목 적합여부"], 	ref: 'orgStbltYn',   	type:'output',  width:'90px',    style:'text-align:center;'},
			//{caption: ["품목 부적합 사유"], 	ref: 'stbltYnNm',   	type:'textarea',  width:'300px',    style:'padding-left:10px'
				//,typeinfo : {textareanewline : true},disabled:true },
			{caption: ["상세내역"], 	ref: 'stbltYnNm',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
			//{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'stbltYn',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
		];

		grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
	}

	var jsonPrdcrOgnCurntMng05 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng05

	const objMenuList05 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld05,			//콜백함수명
			}
		};


	function fn_excelDwnld05() {
		grdPrdcrOgnCurntMng05.exportLocalExcel("출자출하조직 부적합 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}


	/* Grid 화면 그리기 기능*/
	//출자출하조직 부적합 리스트
	const fn_fcltMngCreateGrid05 = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng05';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng05';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng05';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList05;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["품목"],			ref: 'itemNm',   		type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["통합조직\n구분"],	ref: 'aprvNm',   		type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["구분"],			ref: 'sttgUpbrItemNm',	type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["부류"],			ref: 'ctgryCd',   		type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직명"],		ref: 'corpNm',   		type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["사업자번호"],		ref: 'brno',   			type:'output',  width:'80px',    style:'text-align:center;'},
			//{caption: ["통합조직\n구분","통합조직\n구분"], 	ref: 'aprv',   	type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				//,typeinfo : {ref:'jsonComGrdAprv_2', label:'label', value:'value', displayui : false}},
			//{caption: ["품목","구분"], 		ref: 'sttgUpbrItemSe',		type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				//,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_2', label:'label', value:'value', displayui : false}},

			/*
			{caption: ["통합조직 판매위임액","생산자조직\n출하(A)(천원)"], 	ref: 'uoSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["통합조직 판매위임액","생산자조직 외\n출하(B)(천원)"], 	ref: 'uoSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체판매액","생산자조직\n출하(C)(천원)"], 			ref: 'uoOtherSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체판매액","생산자조직 외\n출하(D)(천원)"], 		ref: 'uoOtherSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직\n총 판매액\n(E=A+B+C+D)\n(천원)","출자출하조직\n총 판매액\n(E=A+B+C+D)\n(천원)"],typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}
				, ref: 'uoSpmtAmtTot',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","생산자조직출하\n[A/(A+C)]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtRt',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","전체출하\n[(A+B)/E]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtTotRt',   	type:'output',  width:'100px',    style:'text-align:center;'},
			*/

			{caption: ["상세내역"], 	ref: 'uoSpmtAmt',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtOther',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoOtherSpmtAmt',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoOtherSpmtAmtOther',	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtTot',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtRt',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoSpmtAmtTotRt',   	hidden : true},

			{caption: ["품목 적합여부"], 	ref: 'orgStbltYn',   	type:'output',  width:'90px',    style:'text-align:center;'},
			{caption: ["품목 부적합 사유"], 	ref: 'stbltYnNm',   	type:'textarea',  width:'300px',    style:'padding-left:10px'
				,typeinfo : {textareanewline : true},disabled:true },
			{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
			//{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'stbltYn',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
		];

		grdPrdcrOgnCurntMng05 = _SBGrid.create(SBGridProperties);
	}

	var jsonPrdcrOgnCurntMng06 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng06

	const objMenuList06 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld05,			//콜백함수명
			}
		};


	function fn_excelDwnld06() {
		grdPrdcrOgnCurntMng06.exportLocalExcel("출자출하조직 선정여부 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}


	/* Grid 화면 그리기 기능*/
	//출자출하조직 선정여부 리스트
	const fn_fcltMngCreateGrid06 = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng06';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng06';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng06';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList05;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheight = 57;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["출자출하조직명"],	ref: 'corpNm',		type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["사업자번호"],	ref: 'brno',		type:'output',  width:'80px',    style:'text-align:center;'},
			{caption: ["출자출하조직\n선정여부"], 	ref: 'stbltYn',		type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["적합품목"], 	ref: 'stbltItemList',	type:'output',  width:'160px',    style:'text-align:center;'},

			{caption: ["탈락사유구분"], 	ref: 'icptRsnCd',	type:'combo',  width:'120px',    style:'text-align:center;', disabled : true
				,typeinfo : {ref:'comIcptRsnCdIso01', label:'label', value:'value', displayui : true}
			},
			{caption: ["세부탈락사유"], 	ref: 'icptRsnDtlCd',	type:'combo',  width:'160px',    style:'text-align:center;', disabled : true
				,typeinfo : {ref:'comIcptRsnDtlCdIso01', label:'label', value:'value', displayui : true
					,filtering: { usemode: true, uppercol: 'icptRsnCd', attrname: 'icptRsnCd', listall: false}
				}
			},
			{caption: ["패널티"], 		ref: 'pnlty',	type:'output',  width:'110px',    style:'text-align:center;'},
			{caption: ["자금신청액(천원)"], 	ref: 'isoFundAplyAmt',	type:'output',  width:'160px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}
			},
			{caption: ["금리(%)"], 		ref: 'itrRt',			type:'output',  width:'80px',    style:'text-align:center;'
				,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}
			},
			{caption: ["선정여부\n(관리자입력)"], 	ref: 'mngrBscStbltYn',	type:'combo',  width:'90px',    style:'text-align:center;'
				,typeinfo : {ref:'comStbltYn', label:'label', value:'value', displayui : true}
			},
			{caption: ["탈락사유구분\n(관리자입력)"], 	ref: 'mngrIcptRsnCd',	type:'combo',  width:'160px',    style:'text-align:center;'
				,typeinfo : {ref:'comIcptRsnCdIso01', label:'label', value:'value', displayui : true}
			},
			{caption: ["세부탈락사유\n(관리자입력)"], 	ref: 'mngrIcptRsnDtlCd',	type:'combo',  width:'160px',    style:'text-align:center;'
				,typeinfo : {ref:'comIcptRsnDtlCdIso01', label:'label', value:'value', displayui : true
					,filtering: { usemode: true, uppercol: 'mngrIcptRsnCd', attrname: 'icptRsnCd', listall: false}
				}
			},
			{caption: ["패널티\n(관리자입력)"], 		ref: 'mngrPnlty',	type:'output',  width:'110px',    style:'text-align:center;'},
			{caption: ["금리(%)\n(관리자입력)"], 		ref: 'mngrItrRt',			type:'input',  width:'110px',    style:'text-align:center;'
				,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}
			},
			{caption: ["비고"], 		ref: 'rmrk', 	type:'input',  width:'200px',	style:'text-align:center'},
			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoBrno',   	hidden : true},
		];

		grdPrdcrOgnCurntMng06 = _SBGrid.create(SBGridProperties);
		grdPrdcrOgnCurntMng06.bind('valuechanged', fn_valueChangedISo);
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
		grdPrdcrOgnCurntMng03.exportLocalExcel("생산자조직 적합 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//생산자조직 적합 리스트
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
		SBGridProperties.oneclickedit = false;//입력 활성화 true 1번클릭 false 더블클릭
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		//SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["품목"],			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["통합조직\n구분"], 	ref: 'aprvNm',   	type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["전문/육성\n구분"], 	ref: 'sttgUpbrItemNm',type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["분류"],			ref: 'ctgryNm',   	type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["법인명"], 			ref: 'corpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["통합조직 법인명"], 	ref: 'uoCorpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'output',  width:'180px',    style:'text-align:center'},
			{caption: ["취급유형"], 		ref: 'trmtTypeNm',   	type:'output',  width:'85px',    style:'text-align:center'},

			/*
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
			*/

			{caption: ["상세내역"], 	ref: 'cnt',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'prdctnVlmTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtPlanVlmTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtVlmTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'spmtPrcTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtRateA',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtRateB',   			hidden : true},

			{caption: ["품목 적합여부"], 		ref: 'orgStbltYn',   	type:'output',  width:'90px',    style:'text-align:center'},
			//{caption: ["품목 부적합 사유"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'300px',    style:'padding-left:10px'
				//,typeinfo : {textareanewline : true},disabled:true },
			{caption: ["상세내역"], 	ref: 'stbltYnNm',   			hidden : true},
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

		grdPrdcrOgnCurntMng03 = _SBGrid.create(SBGridProperties);

	}

	var jsonPrdcrOgnCurntMng04 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng04;

	const objMenuList04 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld04,			//콜백함수명
			}
		};


	function fn_excelDwnld04() {
		grdPrdcrOgnCurntMng04.exportLocalExcel("생산자조직 부적합 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//생산자조직 부적합 리스트
	const fn_fcltMngCreateGrid04 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng04';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng04';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng04';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList04;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = false;//입력 활성화 true 1번클릭 false 더블클릭
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		//SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["품목"],			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["통합조직\n구분"], 	ref: 'aprvNm',   	type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["전문/육성\n구분"], 	ref: 'sttgUpbrItemNm',type:'output',  width:'55px',    style:'text-align:center;'},
			{caption: ["분류"],			ref: 'ctgryNm',   	type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["법인명"], 			ref: 'corpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["통합조직 법인명"], 	ref: 'uoCorpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'output',  width:'180px',    style:'text-align:center'},
			{caption: ["취급유형"], 		ref: 'trmtTypeNm',   	type:'output',  width:'85px',    style:'text-align:center'},

			/*
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
			*/

			{caption: ["상세내역"], 	ref: 'cnt',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'prdctnVlmTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtPlanVlmTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtVlmTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'spmtPrcTot',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtRateA',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'ecSpmtRateB',   			hidden : true},

			{caption: ["품목 적합여부"], 		ref: 'orgStbltYn',   	type:'output',  width:'90px',    style:'text-align:center'},
			{caption: ["품목 부적합 사유"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'300px',    style:'padding-left:10px'
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

		grdPrdcrOgnCurntMng04 = _SBGrid.create(SBGridProperties);

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
						,prfmncCorpDdlnYn: item.prfmncCorpDdlnYn
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
	/*
	const fn_dtlSearch = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			,yr : yr
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
				//SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//사업자등록번호
			});
			fn_dtlGridSearch();
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
		console.log("******************fn_view**********************************");

		fn_clearForm();

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

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도

	}
	//그리드 초기화
	async function fn_clearForm() {
		if(jsonPrdcrOgnCurntMng01.length > 0){
			jsonPrdcrOgnCurntMng01.length= 0;
			grdPrdcrOgnCurntMng01.rebuild();
		}
		if(jsonPrdcrOgnCurntMng02.length > 0){
			jsonPrdcrOgnCurntMng02.length= 0;
			grdPrdcrOgnCurntMng02.rebuild();
		}
		if(jsonPrdcrOgnCurntMng03.length > 0){
			jsonPrdcrOgnCurntMng03.length= 0;
			grdPrdcrOgnCurntMng03.rebuild();
		}
		if(jsonPrdcrOgnCurntMng04.length > 0){
			jsonPrdcrOgnCurntMng04.length= 0;
			grdPrdcrOgnCurntMng04.rebuild();
		}
		if(jsonPrdcrOgnCurntMng05.length > 0){
			jsonPrdcrOgnCurntMng05.length= 0;
			grdPrdcrOgnCurntMng05.rebuild();
		}
		if(jsonPrdcrOgnCurntMng06.length > 0){
			jsonPrdcrOgnCurntMng06.length= 0;
			grdPrdcrOgnCurntMng06.rebuild();
		}
		if(jsonPrdcrOgnCurntMng07.length > 0){
			jsonPrdcrOgnCurntMng07.length= 0;
			grdPrdcrOgnCurntMng07.rebuild();
		}

		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-yr',null)//등록년도
	}

	const fn_dtlGridSearch = async function(){
		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){
			return false;
		}
		fn_dtlGridSearchUo();//통합조직
		fn_dtlGridSearchUoTot();//통합조직 선정여부
		fn_dtlGridSearchIso();//출자출하조직
		fn_dtlGridSearchIsoTot();//출자출하조직 선정여부
		//fn_dtlGridSearchFrmhs();//생산자조직
	}

	//통합조직 조회
	const fn_dtlGridSearchUo = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectUoList.do", {
			brno : brno
			, yr : yr
		});


		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm
						,ctgryCd: item.ctgryCd
						,ctgryNm: item.ctgryNm
						,aprv: item.aprv
						,aprvNm: item.aprvNm

						,slsCnsgnSlsAmt: item.slsCnsgnSlsAmt
						,slsCnsgnSlsAmtTot: item.slsCnsgnSlsAmtTot
						,slsCnsgnSlsAmtRt: item.slsCnsgnSlsAmtRt

						,stbltYn: item.stbltYn//적합여부 기준 적용 결과
						,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
						,stbltYnNm: fn_calUoStbltYn(item)
				}
				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});



			grdPrdcrOgnCurntMng01.rebuild();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//통합조직 선정여부
	const fn_dtlGridSearchUoTot = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectUoTotList.do", {
			brno : brno
			, yr : yr
		});


		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng07.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let pnltyVal = '';
				let itrRtVal = item.itrRt;
				if(!gfn_isEmpty(item.icptRsnCd) && item.icptRsnCd != ''){
					let chkInfo = _.find(comIcptRsnDtlCdUo01, {value: item.icptRsnDtlCd});
					pnltyVal = chkInfo.pnlty;
					itrRtVal = chkInfo.itrRt;
				}
				let mngrPnltyVal = '';
				let mngrItrRtVal = item.mngrItrRt;
				if(!gfn_isEmpty(item.mngrIcptRsnCd) && item.mngrIcptRsnCd != ''){
					let chkInfo = _.find(comIcptRsnDtlCdUo01, {value: item.mngrIcptRsnDtlCd});
					if(gfn_isEmpty(item.mngrItrRt)){
						mngrPnltyVal = chkInfo.pnlty;
					}
					mngrItrRtVal = chkInfo.itrRt;
				}
				let PrdcrOgnCurntMngVO = {
						brno				: item.brno
						,corpNm				: item.corpNm
						,yr					: item.yr
						,fundAplyAmtTot		: item.fundAplyAmtTot//자금신청액
						,fundAplyAmtStbltTot	: item.fundAplyAmtStbltTot//자금신청액
						,stbltItemList		: item.stbltItemList//적합픔목 리스트

						,stbltYn			: item.stbltYn//적합여부 기준 적용 결과
						,icptRsnCd			: item.icptRsnCd//탈락사유구분
						,icptRsnDtlCd		: item.icptRsnDtlCd //세부탈락사유
						,mngrStbltYn		: item.mngrStbltYn//적합여부 기준 적용 결과
						,mngrIcptRsnCd		: item.mngrIcptRsnCd//탈락사유구분
						,mngrIcptRsnDtlCd	: item.mngrIcptRsnDtlCd //세부탈락사유
						,pnlty				: pnltyVal//패널티
						,itrRt				: itrRtVal//금리
						,mngrPnlty			: mngrPnltyVal //패널티
						,mngrItrRt			: mngrItrRtVal //금리

						,rmrk				: item.rmrk//비고
				}
				jsonPrdcrOgnCurntMng07.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
			grdPrdcrOgnCurntMng07.rebuild();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출자출하조직 리스트 조회
	async function fn_dtlGridSearchIso() {

		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise02 = gfn_postJSON("/pd/pcorm/selectIsoList.do", {
			brno : brno
			, yr : yr
		});
		let data = await postJsonPromise02;
		try{
			jsonPrdcrOgnCurntMng02.length = 0;
			jsonPrdcrOgnCurntMng05.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let itemVO = {
					apoCd: 	item.apoCd
					,apoSe: item.apoSe
					,brno: 	item.brno
					,crno: 	item.crno
					,corpNm: item.corpNm
					,delYn: item.delYn
					,yr: item.yr

					,aprv	: item.aprv
					,aprvNm	: item.aprvNm

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

					,uoSpmtAmtRt: 			item.uoSpmtAmtRt
					,uoSpmtAmtTotRt: 		item.uoSpmtAmtTotRt
					,uoSpmtAmtTot: 			item.uoSpmtAmtTot

					,stbltYn: item.stbltYn//적합여부 기준 적용 결과
					,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
					,stbltYnNm: fn_calIsoStbltYn(item)
				};
				if(item.orgStbltYn == 'Y'){
					jsonPrdcrOgnCurntMng02.push(itemVO);
				}else{
					jsonPrdcrOgnCurntMng05.push(itemVO);
				}

			});

			grdPrdcrOgnCurntMng02.rebuild();
			grdPrdcrOgnCurntMng05.rebuild();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출자출하조직 선정여부 조회
	async function fn_dtlGridSearchIsoTot() {

		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise06 = gfn_postJSON("/pd/pcorm/selectIsoTotList.do", {
			brno : brno
			, yr : yr
		});
		let data = await postJsonPromise06;
		try{
			jsonPrdcrOgnCurntMng06.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let pnltyVal = '';
				let itrRtVal = item.itrRt;
				if(!gfn_isEmpty(item.icptRsnCd) && item.icptRsnCd != ''){
					let chkInfo = _.find(comIcptRsnDtlCdIso01, {value: item.icptRsnDtlCd});
					pnltyVal = chkInfo.pnlty;
					itrRtVal = chkInfo.itrRt;
				}
				let mngrPnltyVal = '';
				let mngrItrRtVal = item.mngrItrRt;
				if(!gfn_isEmpty(item.mngrIcptRsnCd) && item.mngrIcptRsnCd != ''){
					let chkInfo = _.find(comIcptRsnDtlCdIso01, {value: item.mngrIcptRsnDtlCd});
					if(gfn_isEmpty(item.mngrItrRt)){
						mngrPnltyVal = chkInfo.pnlty;
					}
					mngrItrRtVal = chkInfo.itrRt;
				}
				let itemVO = {
					brno: 	item.brno
					,uoBrno: item.uoBrno
					,corpNm: item.corpNm
					,yr: item.yr
					,apoSe: item.yr
					,stbltItemList: item.stbltItemList//적합픔목 리스트

					,stbltYn			: item.stbltYn//적합여부 기준 적용 결과
					,icptRsnCd			: item.icptRsnCd//탈락사유구분
					,icptRsnDtlCd		: item.icptRsnDtlCd //세부탈락사유
					,mngrStbltYn		: item.mngrStbltYn//적합여부 기준 적용 결과
					,mngrIcptRsnCd		: item.mngrIcptRsnCd//탈락사유구분
					,mngrIcptRsnDtlCd	: item.mngrIcptRsnDtlCd //세부탈락사유

					,isoFundAplyAmt		: item.isoFundAplyAmt//자금신청액
					,pnlty				: pnltyVal//패널티
					,itrRt				: itrRtVal//금리
					,mngrPnlty			: mngrPnltyVal //패널티
					,mngrItrRt			: mngrItrRtVal //금리

					,rmrk				: item.rmrk//비고
				};
				jsonPrdcrOgnCurntMng06.push(itemVO);
			});
			grdPrdcrOgnCurntMng06.rebuild();
			//적합한 경우 통합조직 금리와 동일하게 하고 수정불가 처리
			fn_disable06();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//적합한 경우 통합조직 금리와 동일하게 하고 수정불가 처리
	async function fn_disable06() {
		let gridData = grdPrdcrOgnCurntMng06.getGridDataAll();
		for(var i=1; i <= gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng06.getRowData(i);
			let itrRt = grdPrdcrOgnCurntMng06.getColRef("itrRt");//금리

			if (rowData.stbltYn == 'Y') {
				grdPrdcrOgnCurntMng06.setCellDisabled(i, itrRt, i, itrRt, true);
			}else{
				grdPrdcrOgnCurntMng06.setCellDisabled(i, itrRt, i, itrRt, false);
			}
		}
	}


	//생산자조직 총괄표 조회
	async function fn_dtlGridSearchFrmhs() {
		let brno = SBUxMethod.get('dtl-input-brno');

		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise03 = gfn_postJSON("/pd/pcorm/selectFrmhsList.do", {
			brno : brno
			,yr : yr
		});
		let data = await postJsonPromise03;
		try{
			jsonPrdcrOgnCurntMng03.length = 0;
			jsonPrdcrOgnCurntMng04.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let itemVO = {
					brno: 	item.brno
					,uoBrno: item.uoBrno
					,corpNm: item.corpNm
					,uoCorpNm: item.uoCorpNm
					,yr: item.yr

					,aprv: item.aprv//승인형 육성형
					,aprvNm: item.aprvNm

					,sttgUpbrItemSe: item.sttgUpbrItemSe
					,sttgUpbrItemNm: item.sttgUpbrItemNm

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
					,stbltYnNm: fn_calFrmhsStbltYn(item)
				}
				if(item.orgStbltYn == 'Y'){
					jsonPrdcrOgnCurntMng03.push(itemVO);
				}else{
					jsonPrdcrOgnCurntMng04.push(itemVO);
				}
			});

			grdPrdcrOgnCurntMng03.rebuild();
			grdPrdcrOgnCurntMng04.rebuild();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//통합조직 탈락적합 사유
	function fn_calUoStbltYn(item) {
		//console.log("fn_calUoStbltYn");
		let stbltYnNmMng = [];
		//console.log(item);
		//강제로 변경한 경우가 존재 함
		if(!gfn_isEmpty(item.orgStbltYn)){
			if (item.orgStbltYn == 'Y') {
				return "";
			}
		}

		console.log(item);
		//예외 품목인 경우
		if(item.chkItemA == 'Y'){
			item.ctgryCd = '2'
		}
		//예외 품목인 경우
		if(item.chkItemB == 'Y'){
			item.ctgryCd = '3'
		}

		if(item.aprv == '1' && item.sttgUpbrItemSe == '1'){
			if(item.ctgryCd == '1'){
				if(item.chkAmtTotAA != 'Y'){
					console.log("item.chkAmtTotAA = "+item.chkAmtTotAA);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkAA == 'A'){
					if(item.chkRtAA != 'Y'){
						console.log("item.chkAA = "+item.chkAA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAA == 'B'){
					if(item.chkRtAB != 'Y'){
						console.log("item.chkRtAB = "+item.chkRtAB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAA == 'C'){
					if(item.chkRtAC != 'Y'){
						console.log("item.chkRtAC = "+item.chkRtAC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '2'){
				if(item.chkAmtTotAB != 'Y'){
					console.log("item.chkAmtTotAB = "+item.chkAmtTotAB);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkAB == 'A'){
					if(item.chkRtAA != 'Y'){
						console.log("item.chkRtAA = "+item.chkRtAA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAB == 'B'){
					if(item.chkRtAB != 'Y'){
						console.log("item.chkRtAB = "+item.chkRtAB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAB == 'C'){
					if(item.chkRtAC != 'Y'){
						console.log("item.chkRtAC = "+item.chkRtAC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '3'){
				if(item.chkAmtTotAC != 'Y'){
					console.log("item.chkAmtTotAC = "+item.chkAmtTotAC);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkAC == 'A'){
					if(item.chkRtAA != 'Y'){
						console.log("item.chkRtAA = "+item.chkRtAA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAC == 'B'){
					if(item.chkRtAB != 'Y'){
						console.log("item.chkRtAB = "+item.chkRtAB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAC == 'C'){
					if(item.chkRtAC != 'Y'){
						console.log("item.chkRtAC = "+item.chkRtAC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}
		}else if(item.aprv == '1' && item.sttgUpbrItemSe == '2'){
			if(item.ctgryCd == '1'){
				if(item.chkAmtTotBA != 'Y'){
					console.log("item.chkAmtTotBA = "+item.chkAmtTotBA);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkBA == 'A'){
					if(item.chkRtBA != 'Y'){
						console.log("item.chkRtBA = "+item.chkRtBA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBA == 'B'){
					if(item.chkRtBB != 'Y'){
						console.log("item.chkRtBB = "+item.chkRtBB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBA == 'C'){
					if(item.chkRtBC != 'Y'){
						console.log("item.chkRtBC = "+item.chkRtBC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '2'){
				if(item.chkAmtTotBB != 'Y'){
					console.log("item.chkAmtTotBB = "+item.chkAmtTotBB);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkBB == 'A'){
					if(item.chkRtBA != 'Y'){
						console.log("item.chkRtBA = "+item.chkRtBA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBB == 'B'){
					if(item.chkRtBB != 'Y'){
						console.log("item.chkRtBB = "+item.chkRtBB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBB == 'C'){
					if(item.chkRtBC != 'Y'){
						console.log("item.chkRtBC = "+item.chkRtBC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '3'){
				if(item.chkAmtTotAC != 'Y'){
					console.log("item.chkAmtTotAC = "+item.chkAmtTotAC);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkBC == 'A'){
					if(item.chkRtBA != 'Y'){
						console.log("item.chkRtBA = "+item.chkRtBA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBC == 'B'){
					if(item.chkRtBB != 'Y'){
						console.log("item.chkRtBB = "+item.chkRtBB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBC == 'C'){
					if(item.chkRtBC != 'Y'){
						console.log("item.chkRtBC = "+item.chkRtBC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}
		}else if(item.aprv == '2'){
			if(item.ctgryCd == '1'){
				if(item.chkAmtTotCA != 'Y'){
					console.log("item.chkAmtTotCA = "+item.chkAmtTotCA);
					stbltYnNmMng.push('약정취급액 요건 미달');
				}
			}else if(item.ctgryCd == '2'){
				if(item.chkAmtTotCB != 'Y'){
					console.log("item.chkAmtTotCB = "+item.chkAmtTotCB);
					stbltYnNmMng.push('약정취급액 요건 미달');
				}
			}else if(item.ctgryCd == '3'){
				if(item.chkAmtTotCC != 'Y'){
					console.log("item.chkAmtTotCC = "+item.chkAmtTotCC);
					stbltYnNmMng.push('약정취급액 요건 미달');
				}
			}
			if(item.chkRtC != 'Y'){
				console.log("item.chkRtC = "+item.chkRtC);
				stbltYnNmMng.push('약정취급률 요건 미달');
			}
		}
		return stbltYnNmMng.join("\n");
	}

	//출자출하조직 탈락적합 사유
	function fn_calIsoStbltYn(item) {
		//console.log("fn_calIsoStbltYn");
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
		return stbltYnNmMng.join("\n");
	}

	function fn_calFrmhsStbltYn(item) {
		//console.log("fn_calFrmhsStbltYn");
		let stbltYnNmMng = [];
		//console.log(item);
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
		return stbltYnNmMng.join("\n");
	}

	//통합조직 선정여부 저장
	const fn_listSave01 = async function(){

		let gridData = grdPrdcrOgnCurntMng06.getGridDataAll();
		let saveList = [];

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng06.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng06.getRowStatus(i);
			let delYn = rowData.delYn;

			if(gfn_isEmpty(rowData.itrRt)){
				if(rowData.stbltYn == 'Y' ){
					alert("통합조직 금리 작성이 필요 합니다");
				}else{
					gfn_comAlert("W0002", "금리");		//	W0002	{0}을/를 입력하세요.
				}
				grdPrdcrOgnCurntMng06.selectRow(i);
				return false;
			}

			rowData.rowSts = "I";
			saveList.push(rowData);
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSaveIsoTotList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
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

	//통합조직 선정여부 저장
	const fn_listSave02 = async function(){

		let gridData = grdPrdcrOgnCurntMng07.getGridDataAll();
		let saveList = [];

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng07.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng07.getRowStatus(i);
			let delYn = rowData.delYn;

			if(gfn_isEmpty(rowData.itrRt) && gfn_isEmpty(rowData.mngrItrRt)){
				gfn_comAlert("W0002", "금리");		//	W0002	{0}을/를 입력하세요.
				grdPrdcrOgnCurntMng07.selectRow(i);
				return false;
			}

			rowData.rowSts = "I";
			saveList.push(rowData);
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSaveUoTotList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
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
	var comIcptRsnDtlCdUo01 = [
		{'text': '기본요건 미충족',	'label': '농업경영체 미등록', 				'value': 'A1', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '출자자본금 1억원 미달', 			'value': 'A2', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '설립 후 운영실적 1년 미만', 		'value': 'A3', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '농업인 주주 5명 미만', 			'value': 'A4', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '농업인 주주 지분 50% 미만', 		'value': 'A5', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '기본요건 미충족',	'label': '원예농산물 취급액 50% 미만', 		'value': 'A6', 'icptRsnCd':'A', 'pnlty': '기존자금 회수',	'itrRt': '-' },
		{'text': '품목 부적합',		'label': '품목 부적합(농협조직)', 			'value': 'B1', 'icptRsnCd':'B', 'pnlty': '최고금리',		'itrRt': '3' },
		{'text': '품목 부적합',		'label': '품목 부적합(농업법인, 협동조합)', 	'value': 'B2', 'icptRsnCd':'B', 'pnlty': '최고금리',		'itrRt': '2.5' }
	];
	//항목 값 변경 이벤트
	const fn_valueChangedUo = async function(){
		let datagrid = grdPrdcrOgnCurntMng07;
		let nRow = datagrid.getRow();
		let nCol = datagrid.getCol();

		let icptRsnCdIdx = datagrid.getColRef("icptRsnCd");
		let mngrIcptRsnCdIdx = datagrid.getColRef("mngrIcptRsnCd");
		let icptRsnDtlCdIdx = datagrid.getColRef("icptRsnDtlCd");
		let mngrIcptRsnDtlCdIdx = datagrid.getColRef("mngrIcptRsnDtlCd");
		let pnltyIdx = datagrid.getColRef("pnlty");
		let itrRtIdx = datagrid.getColRef("itrRt");
		let mngrPnltyIdx = datagrid.getColRef("mngrPnlty");
		let mngrItrRtIdx = datagrid.getColRef("mngrItrRt");

		if (!gfn_isEmpty(nCol) && nCol == icptRsnDtlCdIdx) {

			let selValue = datagrid.getCellData(nRow, nCol);
			let chkInfo = _.find(comIcptRsnDtlCdUo01, {value: selValue});
			console.log(chkInfo);
			let pnltyVal = chkInfo.pnlty;
			let itrRtVal = chkInfo.itrRt;
			datagrid.setCellData(nRow, pnltyIdx, pnltyVal, true);
			datagrid.setCellData(nRow, itrRtIdx, itrRtVal, true);

		}else if(!gfn_isEmpty(nCol) && nCol == mngrIcptRsnDtlCdIdx){

			let selValue = datagrid.getCellData(nRow, nCol);
			let chkInfo = _.find(comIcptRsnDtlCdUo01, {value: selValue});
			console.log(chkInfo);
			let pnltyVal = chkInfo.pnlty;
			let itrRtVal = chkInfo.itrRt;
			datagrid.setCellData(nRow, mngrPnltyIdx, pnltyVal, true);
			datagrid.setCellData(nRow, mngrItrRtIdx, itrRtVal, true);

		}else if(!gfn_isEmpty(nCol) && nCol == mngrIcptRsnCdIdx){
			datagrid.setCellData(nRow, mngrPnltyIdx, null, true);
			datagrid.setCellData(nRow, mngrItrRtIdx, null, true);
		}
	}
	//항목 값 변경 이벤트
	const fn_valueChangedISo = async function(){
		let datagrid = grdPrdcrOgnCurntMng06;
		let nRow = datagrid.getRow();
		let nCol = datagrid.getCol();

		let icptRsnCdIdx = datagrid.getColRef("icptRsnCd");
		let mngrIcptRsnCdIdx = datagrid.getColRef("mngrIcptRsnCd");
		let icptRsnDtlCdIdx = datagrid.getColRef("icptRsnDtlCd");
		let mngrIcptRsnDtlCdIdx = datagrid.getColRef("mngrIcptRsnDtlCd");
		let pnltyIdx = datagrid.getColRef("pnlty");
		let itrRtIdx = datagrid.getColRef("itrRt");
		let mngrPnltyIdx = datagrid.getColRef("mngrPnlty");
		let mngrItrRtIdx = datagrid.getColRef("mngrItrRt");

		if (!gfn_isEmpty(nCol) && nCol == icptRsnDtlCdIdx) {

			let selValue = datagrid.getCellData(nRow, nCol);
			let chkInfo = _.find(comIcptRsnDtlCdIso01, {value: selValue});
			console.log(chkInfo);
			let pnltyVal = chkInfo.pnlty;
			let itrRtVal = chkInfo.itrRt;
			datagrid.setCellData(nRow, pnltyIdx, pnltyVal, true);
			datagrid.setCellData(nRow, itrRtIdx, itrRtVal, true);

		}else if(!gfn_isEmpty(nCol) && nCol == mngrIcptRsnDtlCdIdx){

			let selValue = datagrid.getCellData(nRow, nCol);
			let chkInfo = _.find(comIcptRsnDtlCdIso01, {value: selValue});
			console.log(chkInfo);
			let pnltyVal = chkInfo.pnlty;
			let itrRtVal = chkInfo.itrRt;
			datagrid.setCellData(nRow, mngrPnltyIdx, pnltyVal, true);
			datagrid.setCellData(nRow, mngrItrRtIdx, itrRtVal, true);

		}else if(!gfn_isEmpty(nCol) && nCol == mngrIcptRsnCdIdx){
			datagrid.setCellData(nRow, mngrPnltyIdx, null, true);
			datagrid.setCellData(nRow, mngrItrRtIdx, null, true);
		}
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
		//SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["신청년도"],			ref:'yr',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["사업자번호"],		ref:'brno',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["법인명"],			ref:'corpNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["조직구분"],			ref:'apoSe',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 사업자번호"],		ref:'uoBrno',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 법인명"],		ref:'uoCorpNm',	type:'output',width:'70px',style:'text-align:center'},

			{caption: ["법인구분"],			ref:'corpSeNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["법인형태"],			ref:'corpDtlSeNm',	type:'output',width:'70px',style:'text-align:center'},

			{caption: ["적합품목 리스트"],			ref:'stbltItemList',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["출자출하조직 자금신청액"],		ref:'isoFundAplyAmt',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["자금신청액 합계"],			ref:'fundAplyAmtTot',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["자금신청액 합계(탈락 출자출하조직 신청액은 제외)"],	ref:'fundAplyAmtStbltTot',		type:'output',width:'70px',style:'text-align:center'},

			{caption: ["선정여부"],			ref:'stbltYn',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["탈락사유구분"],		ref:'icptRsnNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["세부탈락사유"],		ref:'icptRsnDtlNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["패널티"],			ref:'pnlty',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["금리"],			ref:'itrRt',			type:'output',width:'70px',style:'text-align:center'},

			{caption: ["선정여부(관리자입력)"],			ref:'mngrStbltYn',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["탈락사유구분(관리자입력)"],		ref:'mngrIcptRsnNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["세부탈락사유(관리자입력)"],		ref:'mngrIcptRsnDtlNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["패널티(관리자입력)"],			ref:'mngrPnlty',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["금리(관리자입력)"],			ref:'mngrItrRt',			type:'output',width:'70px',style:'text-align:center'},

			{caption: ["비고"],		ref:'rmrk',		type:'output',width:'70px',style:'text-align:center'},
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

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectRawDataList.do", {
			yr : yr
			});

			let data = await postJsonPromise;
			try{
			jsonHiddenGrd.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
					yr						:item.yr
					,brno					:item.brno
					,apoSe					:item.apoSe
					,corpNm					:item.corpNm
					,uoBrno					:item.uoBrno
					,uoCorpNm				:item.uoCorpNm

					,corpSeCd				:item.corpSeCd//법인구분 코드
					,corpSeNm				:item.corpSeNm//법인구분
					,corpDtlSeCd			:item.corpDtlSeCd//법인형태 코드
					,corpDtlSeNm			:item.corpDtlSeNm//법인형태

					,stbltItemList			:item.stbltItemList//적합품목 리스트

					,isoFundAplyAmt			:item.isoFundAplyAmt//부류명

					,fundAplyAmtTot			:item.fundAplyAmtTot//자금신청액
					,fundAplyAmtStbltTot	:item.fundAplyAmtStbltTot//자금신청액(탈락 출자출하조직 신청액은 제외)

					,stbltYn				:item.stbltYn//선정여부
					,itrRt					:item.itrRt//금리
					,icptRsnCd				:item.icptRsnCd//탈락사유구분
					,icptRsnNm				:item.icptRsnNm//탈락사유구분
					,icptRsnDtlCd			:item.icptRsnDtlCd//세부탈락사유
					,icptRsnDtlNm			:item.icptRsnDtlNm//세부탈락사유

					,mngrStbltYn			:item.mngrStbltYn//선정여부(관리자입력)
					,mngrIcptRsnCd			:item.mngrIcptRsnCd//탈락사유구분(관리자입력)
					,mngrIcptRsnNm			:item.mngrIcptRsnNm//탈락사유구분(관리자입력)
					,mngrIcptRsnDtlCd		:item.mngrIcptRsnDtlCd//세부탈락사유(관리자입력)
					,mngrIcptRsnDtlNm		:item.mngrIcptRsnDtlNm//세부탈락사유(관리자입력)
					,mngrItrRt				:item.mngrItrRt//금리(관리자입력)

					,pnlty					:item.pnlty//패널티
					,mngrPnlty				:item.mngrPnlty//패널티(관리자입력)

					,rmrk					:item.rmrk//비고

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

		let fileName = formattedDate + "_등록결과_확인_출자출하조직_로우데이터";

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

	/* 로우데이터 요청 */

	var jsonHiddenGrd01 = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd01;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd01 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd01';
		SBGridProperties.id = 'hiddenGrd01';
		SBGridProperties.jsonref = 'jsonHiddenGrd01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		//SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["신청년도"],			ref:'yr',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["사업자번호"],		ref:'brno',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["법인명"],			ref:'corpNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["조직구분"],			ref:'apoSe',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 사업자번호"],		ref:'uoBrno',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 법인명"],		ref:'uoCorpNm',	type:'output',width:'70px',style:'text-align:center'},

			{caption: ["법인구분"],			ref:'corpSeNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["법인형태"],			ref:'corpDtlSeNm',	type:'output',width:'70px',style:'text-align:center'},

			{caption: ["적합품목 리스트"],			ref:'stbltItemList',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["출자출하조직 자금신청액"],		ref:'isoFundAplyAmt',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["자금신청액 합계"],			ref:'fundAplyAmtTot',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["자금신청액 합계(탈락 출자출하조직 신청액은 제외)"],	ref:'fundAplyAmtStbltTot',		type:'output',width:'70px',style:'text-align:center'},

			{caption: ["선정여부"],			ref:'stbltYn',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["탈락사유구분"],		ref:'icptRsnNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["세부탈락사유"],		ref:'icptRsnDtlNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["패널티"],			ref:'pnlty',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["금리"],			ref:'itrRt',			type:'output',width:'70px',style:'text-align:center'},

			{caption: ["선정여부(관리자입력)"],			ref:'mngrStbltYn',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["탈락사유구분(관리자입력)"],		ref:'mngrIcptRsnNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["세부탈락사유(관리자입력)"],		ref:'mngrIcptRsnDtlNm',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["패널티(관리자입력)"],			ref:'mngrPnlty',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["금리(관리자입력)"],			ref:'mngrItrRt',			type:'output',width:'70px',style:'text-align:center'},

			{caption: ["비고"],		ref:'rmrk',		type:'output',width:'70px',style:'text-align:center'},
		];
		hiddenGrd01 = _SBGrid.create(SBGridProperties);

	}
	const fn_hiddenGrdSelect01 = async function(){
		await fn_hiddenGrd01();
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectRawDataIsoList.do", {
			yr : yr
			});

			let data = await postJsonPromise;
			try{
			jsonHiddenGrd01.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
					yr						:item.yr
					,brno					:item.brno
					,apoSe					:item.apoSe
					,corpNm					:item.corpNm
					,uoBrno					:item.uoBrno
					,uoCorpNm				:item.uoCorpNm

					,corpSeCd				:item.corpSeCd//법인구분 코드
					,corpSeNm				:item.corpSeNm//법인구분
					,corpDtlSeCd			:item.corpDtlSeCd//법인형태 코드
					,corpDtlSeNm			:item.corpDtlSeNm//법인형태

					,stbltItemList			:item.stbltItemList//적합품목 리스트

					,isoFundAplyAmt			:item.isoFundAplyAmt//부류명

					,fundAplyAmtTot			:item.fundAplyAmtTot//자금신청액
					,fundAplyAmtStbltTot	:item.fundAplyAmtStbltTot//자금신청액(탈락 출자출하조직 신청액은 제외)

					,stbltYn				:item.stbltYn//선정여부
					,itrRt					:item.itrRt//금리
					,icptRsnCd				:item.icptRsnCd//탈락사유구분
					,icptRsnNm				:item.icptRsnNm//탈락사유구분
					,icptRsnDtlCd			:item.icptRsnDtlCd//세부탈락사유
					,icptRsnDtlNm			:item.icptRsnDtlNm//세부탈락사유

					,mngrStbltYn			:item.mngrStbltYn//선정여부(관리자입력)
					,mngrIcptRsnCd			:item.mngrIcptRsnCd//탈락사유구분(관리자입력)
					,mngrIcptRsnNm			:item.mngrIcptRsnNm//탈락사유구분(관리자입력)
					,mngrIcptRsnDtlCd		:item.mngrIcptRsnDtlCd//세부탈락사유(관리자입력)
					,mngrIcptRsnDtlNm		:item.mngrIcptRsnDtlNm//세부탈락사유(관리자입력)
					,mngrItrRt				:item.mngrItrRt//금리(관리자입력)

					,pnlty					:item.pnlty//패널티
					,mngrPnlty				:item.mngrPnlty//패널티(관리자입력)

					,rmrk					:item.rmrk//비고

				}

				jsonHiddenGrd01.push(hiddenGrdVO);
			});

			await hiddenGrd01.rebuild();

			await fn_excelDown01();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//로우 데이터 엑셀 다운로드
	function fn_excelDown01(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_등록결과_확인_출자출하조직_로우데이터";

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
		hiddenGrd01.exportData("xlsx" , fileName , true , true);
	}

	//선정여부 일괄 저장
	async function fn_allSave(){
		console.log("fn_AllSave");
		if (!gfn_comConfirm("Q0001", "선정여부 일괄 저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		let yr = SBUxMethod.get("srch-input-yr");//
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcom/multiSaveIcptRsnList.do", {
			yr : yr
		});
		let data = await postJsonPromise;
		//console.log(data);
		console.log(data.savedCnt);
		try{
			if(_.isEqual("S", data.resultStatus)){
				alert("선정여부 일괄 저장 되었습니다.");
				fn_dtlGridSearch();
			}else{
				alert("선정여부 일괄 저장 도중 오류가 발생 되었습니다.");
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