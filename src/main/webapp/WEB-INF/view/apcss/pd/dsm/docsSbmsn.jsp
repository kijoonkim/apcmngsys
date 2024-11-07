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
<style>
	.th_bg {
		border-right: 1px solid #ffffff !important;
		border-bottom: 1px solid #ffffff !important;
	}
</style>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 증빙서류 업로드 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchUser"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>사용자 표기</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 10%">

						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >신청년도</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-input uitype="hidden" id="dtl-inp-apoCd" name="dtl-inp-apoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-apoSe" name="dtl-inp-apoSe"></sbux-input>
								<sbux-spinner
									id="dtl-inp-yr"
									name="dtl-inp-yr"
									uitype="normal"
									step-value="1"
									disabled
								></sbux-spinner>
							</td>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-corpNm"
									name="dtl-inp-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-brno"
									name="dtl-inp-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-crno"
									name="dtl-inp-crno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 기본서류 제출 리스트 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:20px">▶기본요건 서류</span>
							</li>
						</ul>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">-기본요건 제출 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCountBsc">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdBscDocUoIso" style="height:200px; width: 100%;"></div>
				</div>

				<!-- 기본요건 그리드 선택 조직정보 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">- 선택조직 정보</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>선택 조직 표기</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscCorpNm"
									name="dtl-inp-bscCorpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscBrno"
									name="dtl-inp-bscBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscCrno"
									name="dtl-inp-bscCrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 기본요건 제출 서류 리스트 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count" style="display:flex; justify-content: flex-start;">
						<li>
							<span style="font-size:14px">- 제출서류 리스트</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>제출 서류 리스트</caption>
						<col style="width: 20%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: 30%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: auto">
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center">제출서류</th>
							<th scope="row" colspan="2" class="th_bg text-center">제출서류</th>
							<th scope="row" class="th_bg text-center">승인여부</th>
							<th scope="row" class="th_bg text-center">제출서류에서 실적입력값 확인가능한 페이지 표시</th>
						</tr>
						<!-- 사업자등록증 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								사업자등록증
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscFileNm1"
									name="dtl-inp-bscFileNm1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscAprvYn1"
									name="dtl-inp-bscAprvYn1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-bscRmrk1"
									name="dtl-inp-bscRmrk1"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-bscFile1" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 정관 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								정관
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscFileNm2"
									name="dtl-inp-bscFileNm2"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscAprvYn2"
									name="dtl-inp-bscAprvYn2"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-bscRmrk2"
									name="dtl-inp-bscRmrk2"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-bscFile2" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 결산재무제표 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								결산재무제표
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscFileNm3"
									name="dtl-inp-bscFileNm3"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscAprvYn3"
									name="dtl-inp-bscAprvYn3"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-bscRmrk3"
									name="dtl-inp-bscRmrk3"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-bscFile3" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 등기사항전부증명서 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								등기사항전부증명서
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscFileNm4"
									name="dtl-inp-bscFileNm4"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscAprvYn4"
									name="dtl-inp-bscAprvYn4"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-bscRmrk4"
									name="dtl-inp-bscRmrk4"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-bscFile4" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 주식등변등상황명세서 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								주식등변등상황명세서
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscFileNm5"
									name="dtl-inp-bscFileNm5"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscAprvYn5"
									name="dtl-inp-bscAprvYn5"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-bscRmrk5"
									name="dtl-inp-bscRmrk5"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-bscFile5" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 출자자명부 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								출자자명부
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscFileNm6"
									name="dtl-inp-bscFileNm6"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bscAprvYn6"
									name="dtl-inp-bscAprvYn6"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-bscRmrk6"
									name="dtl-inp-bscRmrk6"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-bscFile6" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 기본요건 서류 제출 하단 버튼 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveBsc" name="btnSaveBsc" uitype="normal" text="기본요건 서류 제출" class="btn btn-sm btn-outline-danger" onclick="fn_save('BSC')"></sbux-button>
					</div>
				</div>
				<br><hr>

				<!-- 세부요건 서류 통합조직 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:20px">▶세부요건 서류 통합조직</span>
						</li>
					</ul>
				</div>
				<!-- 세부요건 통합조직 선택 조직정보 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">- 선택조직 정보</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>선택 조직 표기</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoCorpNm"
									name="dtl-inp-dtlUoCorpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoBrno"
									name="dtl-inp-dtlUoBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoCrno"
									name="dtl-inp-dtlUoCrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count" style="display:flex; justify-content: flex-start;">
						<li>
							<span style="font-size:14px">- 제출서류 리스트</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>제출 서류 리스트</caption>
						<col style="width: 20%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: 30%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: auto">
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center">제출서류</th>
							<th scope="row" colspan="2" class="th_bg text-center">제출서류</th>
							<th scope="row" class="th_bg text-center">승인여부</th>
							<th scope="row" class="th_bg text-center">제출서류에서 실적입력값 확인가능한 페이지 표시</th>
						</tr>
						<!-- 통합조직의 매입처별(출자출하조직)·품목별 매입집계표 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								통합조직의 매입처별(출자출하조직)·품목별 매입집계표
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm1"
									name="dtl-inp-dtlUoFileNm1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn1"
									name="dtl-inp-dtlUoAprvYn1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk1"
									name="dtl-inp-dtlUoRmrk1"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile1" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 매출처별 계산서 집계표 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								매출처별 계산서 집계표
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm2"
									name="dtl-inp-dtlUoFileNm2"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn2"
									name="dtl-inp-dtlUoAprvYn2"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk2"
									name="dtl-inp-dtlUoRmrk2"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile2" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 품목별 매출원장(집계표) 등 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								품목별 매출원장(집계표) 등
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm3"
									name="dtl-inp-dtlUoFileNm3"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn3"
									name="dtl-inp-dtlUoAprvYn3"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk3"
									name="dtl-inp-dtlUoRmrk3"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile3" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 매입처별 계산서 집계표 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								매입처별 계산서 집계표
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm4"
									name="dtl-inp-dtlUoFileNm4"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn4"
									name="dtl-inp-dtlUoAprvYn4"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk4"
									name="dtl-inp-dtlUoRmrk4"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile4" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 품목별 매입원장(집계표) 등 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								품목별 매입원장(집계표) 등
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm5"
									name="dtl-inp-dtlUoFileNm5"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn5"
									name="dtl-inp-dtlUoAprvYn5"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk5"
									name="dtl-inp-dtlUoRmrk5"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile5" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 통합조직 운영규칙 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								통합조직 운영규칙
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm6"
									name="dtl-inp-dtlUoFileNm6"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn6"
									name="dtl-inp-dtlUoAprvYn6"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk6"
									name="dtl-inp-dtlUoRmrk6"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile6" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 생산출하품질 관리규칙 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								생산출하품질 관리규칙
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm7"
									name="dtl-inp-dtlUoFileNm7"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn7"
									name="dtl-inp-dtlUoAprvYn7"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk7"
									name="dtl-inp-dtlUoRmrk7"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile7" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 생산자조직 회칙 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								생산자조직 회칙
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoFileNm8"
									name="dtl-inp-dtlUoFileNm8"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlUoAprvYn8"
									name="dtl-inp-dtlUoAprvYn8"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlUoRmrk8"
									name="dtl-inp-dtlUoRmrk8"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlUoFile8" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 세부요건 서류 통합조직 제출 하단 버튼 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveDtlUo" name="btnSaveDtlUo" uitype="normal" text="세부요건 서류 통합조직 제출" class="btn btn-sm btn-outline-danger" onclick="fn_save('DTLU')"></sbux-button>
					</div>
				</div>
				<br><hr>

				<!-- 세부요건 출자출하조직 리스트 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:20px">▶세부요건 서류 출자출하조직</span>
							</li>
						</ul>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">- 소속 출자출하조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCountDtlIso">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdDtlDocIso" style="height:200px; width: 100%;"></div>
				</div>
				<!-- 세부요건 출자출하조직 서류 리스트 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">- 선택조직 정보</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>선택 조직 표기</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoCorpNm"
									name="dtl-inp-dtlIsoCorpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoBrno"
									name="dtl-inp-dtlIsoBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoCrno"
									name="dtl-inp-dtlIsoCrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count" style="display:flex; justify-content: flex-start;">
						<li>
							<span style="font-size:14px">- 제출서류 리스트</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>제출 서류 리스트</caption>
						<col style="width: 20%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: 30%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: auto">
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center">제출서류</th>
							<th scope="row" colspan="2" class="th_bg text-center">제출서류</th>
							<th scope="row" class="th_bg text-center">승인여부</th>
							<th scope="row" class="th_bg text-center">제출서류에서 실적입력값 확인가능한 페이지 표시</th>
						</tr>
						<!-- 출자출하조직의 통합조직 출하내역서 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								출자출하조직의 통합조직 출하내역서
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoFileNm1"
									name="dtl-inp-dtlIsoFileNm1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoAprvYn1"
									name="dtl-inp-dtlIsoAprvYn1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlIsoRmrk1"
									name="dtl-inp-dtlIsoRmrk1"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlIsoFile1" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 매출처별 계산서 집계표 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								매출처별 계산서 집계표
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoFileNm2"
									name="dtl-inp-dtlIsoFileNm2"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoAprvYn2"
									name="dtl-inp-dtlIsoAprvYn2"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlIsoRmrk2"
									name="dtl-inp-dtlIsoRmrk2"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlIsoFile2" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 품목별 매출원장(집계표) 등 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								품목별 매출원장(집계표) 등
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoFileNm3"
									name="dtl-inp-dtlIsoFileNm3"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoAprvYn3"
									name="dtl-inp-dtlIsoAprvYn3"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlIsoRmrk3"
									name="dtl-inp-dtlIsoRmrk3"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlIsoFile3" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 매입처별 계산서 집계표 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								매입처별 계산서 집계표
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoFileNm4"
									name="dtl-inp-dtlIsoFileNm4"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoAprvYn4"
									name="dtl-inp-dtlIsoAprvYn4"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlIsoRmrk4"
									name="dtl-inp-dtlIsoRmrk4"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlIsoFile4" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
						<!-- 품목별 매입원장(집계표) 등 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								품목별 매입원장(집계표) 등
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoFileNm5"
									name="dtl-inp-dtlIsoFileNm5"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlIsoAprvYn5"
									name="dtl-inp-dtlIsoAprvYn5"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlIsoRmrk5"
									name="dtl-inp-dtlIsoRmrk5"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlIsoFile5" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 세부요건 서류 출자출하조직 제출 하단 버튼 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveDtlIso" name="btnSaveDtlIso" uitype="normal" text="세부요건 서류 출자출하조직 제출" class="btn btn-sm btn-outline-danger" onclick="fn_save('DTLI')"></sbux-button>
					</div>
				</div>
				<br><hr>

				<!-- 세부요건 서류 출하계약 서명부 (생산자조직) -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:20px">▶세부요건 서류 생산자조직</span>
							</li>
						</ul>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">- 소속 생산자조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCountDtlPo">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdDtlDocPo" style="height:200px; width: 100%;"></div>
				</div>
				<!-- 세부요건 출자출하조직 서류 리스트 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">- 선택조직 정보</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>선택 조직 표기</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%">
						<col style="width: 15%">

						<col style="width: 7%; min-width: 84px;">
						<col style="width: 15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">생산자조직명</th>
							<td class="td_input">
								<sbux-input uitype="hidden" id="dtl-inp-dtlPoPrdcrOgnzSn" name="dtl-inp-dtlPoPrdcrOgnzSn"></sbux-input>
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlPoPrdcrOgnzNm"
									name="dtl-inp-dtlPoPrdcrOgnzNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">소속법인명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlPoCorpNm"
									name="dtl-inp-dtlPoCorpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">소속사업자등록번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlPoBrno"
									name="dtl-inp-dtlPoBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count" style="display:flex; justify-content: flex-start;">
						<li>
							<span style="font-size:14px">- 제출서류 리스트</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>제출 서류 리스트</caption>
						<col style="width: 20%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: 30%">
						<col style="width: 5%; min-width: 76px;">
						<col style="width: auto">
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center">제출서류</th>
							<th scope="row" colspan="2" class="th_bg text-center">제출서류</th>
							<th scope="row" class="th_bg text-center">승인여부</th>
							<th scope="row" class="th_bg text-center">제출서류에서 실적입력값 확인가능한 페이지 표시</th>
						</tr>
						<!-- 전속(약정) 출하계약 서명부 -->
						<tr>
							<th scope="row" rowspan="2" class="th_bg text-center">
								전속(약정) 출하계약 서명부
							</th>
							<th class="th_bg text-center">기존</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlPoFileNm1"
									name="dtl-inp-dtlPoFileNm1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-dtlPoAprvYn1"
									name="dtl-inp-dtlPoAprvYn1"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td rowspan="2">
								<sbux-textarea
									id="dtl-inp-dtlPoRmrk1"
									name="dtl-inp-dtlPoRmrk1"
									uitype="normal"
									style="width: 100%; height: 43px;"
									auto-resize="true"
								></sbux-textarea>
							</td>
						</tr>
						<tr>
							<th class="th_bg text-center">신규(변경)</th>
							<td colspan="2" class="td_input">
								<input type="file" id="dtl-inp-dtlPoFile1" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .pdf">
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 세부요건 서류 생산자조직 제출 하단 버튼 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveDtlPo" name="btnSaveDtlPo" uitype="normal" text="세부요건 서류 생산자조직 제출" class="btn btn-sm btn-outline-danger" onclick="fn_save('DTLP')"></sbux-button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	// 문서 종류별 설정 객체 생성
	const documentSettings = {
		"BSC": { fileCnt: 6, seNm: "bsc" },
		"DTLU": { fileCnt: 8, seNm: "dtlUo" },
		"DTLI": { fileCnt: 5, seNm: "dtlIso" },
		"DTLP": { fileCnt: 1, seNm: "dtlPo" }
	};
	// 기본값 설정 (해당하는 문서 종류가 없을 경우)
	const defaultSettings = { fileCnt: 0, seNm: "" };

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		//올해년도 세팅
		var now = new Date();
		var year = now.getFullYear();
		SBUxMethod.set("dtl-inp-yr",year);

		await fn_createGridBscDocUoIso();
		await fn_createGridDtlDocIso();
		await fn_CreateGridDtlDocPo();

		await fn_searchUser();
	}

	/**
     * 기본요건 제출서류 리스트 그리드
     */
	var jsonBscDocUoIso = []; // 그리드의 참조 데이터 주소 선언
	var grdBscDocUoIso;

	/* Grid 화면 그리기 기능*/
	const fn_createGridBscDocUoIso = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdBscDocUoIso';
		SBGridProperties.id = 'grdBscDocUoIso';
		SBGridProperties.jsonref = 'jsonBscDocUoIso';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.useMixedWidth = true;//너비 px,% 혼용 설정
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["등록년도","등록년도"],		ref: 'yr',		type:'output',	width:'8%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["법인명","법인명"],		ref: 'corpNm',	type:'output',	width:'22%',	minwidth : '250px',	style:'text-align:center'},
			{caption: ["사업자번호","사업자번호"],	ref: 'brno',	type:'output',	width:'10%',	minwidth : '90px',	style:'text-align:center'},

			{caption: ["체출서류1","제출여부"],	ref: 'sbmsnYn1',type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류1","승인여부"],	ref: 'sttsNm1',	type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류2","제출여부"],	ref: 'sbmsnYn2',type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류2","승인여부"],	ref: 'sttsNm2',	type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류3","제출여부"],	ref: 'sbmsnYn3',type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류3","승인여부"],	ref: 'sttsNm3',	type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류4","제출여부"],	ref: 'sbmsnYn4',type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류4","승인여부"],	ref: 'sttsNm4',	type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류5","제출여부"],	ref: 'sbmsnYn5',type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류5","승인여부"],	ref: 'sttsNm5',	type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류6","제출여부"],	ref: 'sbmsnYn6',type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류6","승인여부"],	ref: 'sttsNm6',	type:'output',	width:'5%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["조직코드"],			ref: 'apoCd',	hidden : true},
			{caption: ["법인등록코드"],		ref: 'crno',	hidden : true},
			{caption: ["통합조직 사업자번호"],	ref: 'uoBrno',	hidden : true},
			{caption: ["등록년도"],			ref: 'yr',		hidden : true},
		];

		grdBscDocUoIso = _SBGrid.create(SBGridProperties);
		documentSettings["BSC"].objGrid = grdBscDocUoIso;
		//클릭 이벤트 바인드
		grdBscDocUoIso.bind('click','fn_viewBsc');
	}

	/**
     * 기본요건 리스트 클릭 이벤트
     */
	const fn_viewBsc = async function() {
		fn_view("BSC");
	}

	/**
     * 그리드 클릭 이벤트
     */
	const fn_view = async function(_dcmntKnd) {
		console.log('fn_view',_dcmntKnd);

		const {seNm , objGrid} = documentSettings[_dcmntKnd] || defaultSettings;
		console.log(objGrid);

		//데이터가 존재하는 그리드 범위 확인
		var nCol = objGrid.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = objGrid.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		fn_clearForm(_dcmntKnd);//기본요건 초기화

		//서치폼에서 클릭시 디테일폼에 데이터출력
		if(typeof objGrid === 'object'){
			let rowData = objGrid.getRowData(nRow);

			if(_dcmntKnd == "DTLP"){
				SBUxMethod.set('dtl-inp-'+seNm+'PrdcrOgnzNm',gfn_nvl(rowData.prdcrOgnzNm))//
				SBUxMethod.set('dtl-inp-'+seNm+'PrdcrOgnzSn',gfn_nvl(rowData.prdcrOgnzSn))//
				SBUxMethod.set('dtl-inp-'+seNm+'CorpNm',gfn_nvl(rowData.corpNm))//
				SBUxMethod.set('dtl-inp-'+seNm+'Brno',gfn_nvl(rowData.brno))//

				if(!gfn_isEmpty(rowData.brno) && !gfn_isEmpty(rowData.prdcrOgnzSn)){
					//서류 리스트 조회
					fn_searchFileList(_dcmntKnd , gfn_nvl(rowData.brno) , gfn_nvl(rowData.prdcrOgnzSn));
				}
			}else{
				SBUxMethod.set('dtl-inp-'+seNm+'CorpNm',gfn_nvl(rowData.corpNm))//
				SBUxMethod.set('dtl-inp-'+seNm+'Brno',gfn_nvl(rowData.brno))//
				SBUxMethod.set('dtl-inp-'+seNm+'Crno',gfn_nvl(rowData.crno))//

				if(!gfn_isEmpty(rowData.brno)){
					//서류 리스트 조회
					fn_searchFileList(_dcmntKnd , gfn_nvl(rowData.brno));
				}
			}
		}
	}

	/**
     * 세부요건 출자출하조직 리스트 상세 초기화
     */
	const fn_clearForm = async function(_dcmntKnd) {
		const { fileCnt, seNm } = documentSettings[_dcmntKnd] || defaultSettings;
		//선택 조직 초기화
		if(_dcmntKnd == "BSC" || _dcmntKnd == "DTLI"){
			SBUxMethod.set('dtl-inp-'+seNm+'CorpNm',null)//
			SBUxMethod.set('dtl-inp-'+seNm+'Brno',null)//
			SBUxMethod.set('dtl-inp-'+seNm+'Crno',null)//
		}else if(_dcmntKnd == "DTLP"){
			SBUxMethod.set('dtl-inp-'+seNm+'PrdcrOgnzNm',null)//
			SBUxMethod.set('dtl-inp-'+seNm+'PrdcrOgnzSn',null)//
			SBUxMethod.set('dtl-inp-'+seNm+'CorpNm',null)//
			SBUxMethod.set('dtl-inp-'+seNm+'Brno',null)//
		}

		//서류 리스트 초기화
		for (var sn = 1; sn <= fileCnt; sn++) {
			SBUxMethod.set('dtl-inp-'+seNm+'FileNm'+sn,null)//기존 파일명
			SBUxMethod.set('dtl-inp-'+seNm+'AprvYn'+sn,null)//파일 승인여부
			SBUxMethod.set('dtl-inp-'+seNm+'Rmrk'+sn,null)//비고
			$("#dtl\\-inp\\-"+seNm+"File"+sn).val("");
		}
	}
	//서류 리스트 그리드 초기화
	const fn_clearAllGrid = async function(_dcmntKnd) {
		//기본요건
		jsonBscDocUoIso.length = 0;
		//세부요건 출자출하조직
		jsonDtlDocIso.length = 0;
		//세부요건 생산자조직
		jsonDtlDocPo.length = 0;

		for (const key in documentSettings) {
			const {objGrid} = documentSettings[key];
			console.log(objGrid);
			console.log(typeof objGrid);
			if(typeof objGrid === 'object'){
				documentSettings[key].objGrid.rebuild();
			}
		}
	}

	/**
     * 세부요건 제출서류 리스트 그리드
     */
	var jsonDtlDocIso = []; // 그리드의 참조 데이터 주소 선언
	var grdDtlDocIso;

	/* Grid 화면 그리기 기능*/
	const fn_createGridDtlDocIso = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdDtlDocIso';
		SBGridProperties.id = 'grdDtlDocIso';
		SBGridProperties.jsonref = 'jsonDtlDocIso';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.useMixedWidth = true;//너비 px,% 혼용 설정
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["등록년도","등록년도"],		ref: 'yr',		type:'output',	width:'6%',		minwidth : '60px',	style:'text-align:center'},
			{caption: ["법인명","법인명"],		ref: 'corpNm',	type:'output',	width:'23%',	minwidth : '250px',	style:'text-align:center'},
			{caption: ["사업자번호","사업자번호"],	ref: 'brno',	type:'output',	width:'11%',	minwidth : '90px',	style:'text-align:center'},

			{caption: ["체출서류1","제출여부"],	ref: 'sbmsnYn1',type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류1","승인여부"],	ref: 'sttsNm1',	type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류2","제출여부"],	ref: 'sbmsnYn2',type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류2","승인여부"],	ref: 'sttsNm2',	type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류3","제출여부"],	ref: 'sbmsnYn3',type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류3","승인여부"],	ref: 'sttsNm3',	type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류4","제출여부"],	ref: 'sbmsnYn4',type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류4","승인여부"],	ref: 'sttsNm4',	type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["체출서류5","제출여부"],	ref: 'sbmsnYn5',type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},
			{caption: ["체출서류5","승인여부"],	ref: 'sttsNm5',	type:'output',	width:'6%',	minwidth : '60px',	style:'text-align:center'},

			{caption: ["조직코드"],			ref: 'apoCd',	hidden : true},
			{caption: ["조직구분"],			ref: 'apoSe',	hidden : true},
			{caption: ["법인등록코드"],		ref: 'crno',	hidden : true},
			{caption: ["통합조직 사업자번호"],	ref: 'uoBrno',	hidden : true},
			{caption: ["등록년도"],			ref: 'yr',		hidden : true},
		];

		grdDtlDocIso = _SBGrid.create(SBGridProperties);
		documentSettings["DTLI"].objGrid = grdDtlDocIso;

		//클릭 이벤트 바인드
		grdDtlDocIso.bind('click','fn_viewDtlIso');
	}

	/**
     * 세부요건 출자출하조직 리스트 클릭 이벤트
     */
	const fn_viewDtlIso = async function() {
		fn_view("DTLI");
	}

	/**
     * 세부요건 서류 출하계약 서명부 (생산자조직)
     */
	var jsonDtlDocPo = []; // 그리드의 참조 데이터 주소 선언
	var grdDtlDocPo;

	/* Grid 화면 그리기 기능*/
	const fn_CreateGridDtlDocPo = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdDtlDocPo';
		SBGridProperties.id = 'grdDtlDocPo';
		SBGridProperties.jsonref = 'jsonDtlDocPo';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["등록년도","등록년도"],			ref: 'yr',			type:'output',	width:'80px',	style:'text-align:center'},
			{caption: ["생산자조직명","생산자조직명"],	ref: 'prdcrOgnzNm',	type:'output',	width:'250px',	style:'text-align:center'},

			{caption: ["전속(약정) 출하계약 서명부","제출여부"],	ref: 'sbmsnYn1',type:'output',	width:'80px',	style:'text-align:center'},
			{caption: ["전속(약정) 출하계약 서명부","승인여부"],	ref: 'sttsNm1',	type:'output',	width:'80px',	style:'text-align:center'},

			{caption: ["조직코드"],			ref: 'apoCd',	hidden : true},
			{caption: ["조직구분"],			ref: 'apoSe',	hidden : true},
			{caption: ["사업자번호"],		ref: 'brno',	hidden : true},
			{caption: ["통합조직 사업자번호"],	ref: 'uoBrno',	hidden : true},
			{caption: ["생산자조직코드"],		ref: 'prdcrOgnzSn',	hidden : true},
			{caption: ["등록년도"],			ref: 'yr',		hidden : true},
		];

		grdDtlDocPo = _SBGrid.create(SBGridProperties);
		documentSettings["DTLP"].objGrid = grdDtlDocPo;

		//클릭 이벤트 바인드
		grdDtlDocPo.bind('click','fn_viewDtlPo');
	}

	/**
     * 세부요건 생산자조직 리스트 클릭 이벤트
     */
	const fn_viewDtlPo = async function() {
		fn_view("DTLP");
	}

	/**
     * 승인형 조직 유저 정보 조회
     */
	const fn_searchUser = async function() {
		let brno = '${loginVO.brno}';

		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-inp-yr');

		let postJsonPromise = gfn_postJSON("/pd/dsm/selectDocsSbmsnUoAprv.do", {
			brno : brno
			,yr : yr
		});

		let data = await postJsonPromise ;
		try{
			console.log(data.resultMap);
			let item = data.resultMap;
			if(item != null){
				SBUxMethod.set('dtl-inp-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-inp-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-inp-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-inp-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-inp-brno',gfn_nvl(item.brno))//사업자등록번호

				//세부요건 통합조직
				let dcmntKnd = 'DTLU';
				const {seNm} = documentSettings[dcmntKnd] || defaultSettings;

				fn_clearForm(dcmntKnd);

				SBUxMethod.set('dtl-inp-'+seNm+'CorpNm',gfn_nvl(item.corpNm))//
				SBUxMethod.set('dtl-inp-'+seNm+'Brno',gfn_nvl(item.brno))//
				SBUxMethod.set('dtl-inp-'+seNm+'Crno',gfn_nvl(item.crno))//
				if(!gfn_isEmpty(item.brno)){
					//서류 리스트 조회
					fn_searchFileList(dcmntKnd , gfn_nvl(item.brno));
					fn_search();
				}
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	/**
     * 증빙서류 조회
     */
	const fn_search = async function() {

		await fn_clearAllGrid();
		await fn_clearForm("BSC");//기본요건 초기화
		await fn_clearForm("DTLU");//세부요건 통합조직 초기화
		await fn_clearForm("DTLI");//세부요건 출자출하조직 초기화
		await fn_clearForm("DTLP");//세부요건 생산자조직 초기화


		let brno = SBUxMethod.get('dtl-inp-brno');

		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-inp-yr');

		let postJsonPromise = gfn_postJSON("/pd/dsm/selectDocsSbmsnBscList.do", {
			brno : brno
			,yr : yr
		});

		let data = await postJsonPromise ;
		try{
			//기본요건
			jsonBscDocUoIso.length = 0;
			let totalCnt1 = 0;
			data.resultBscList.forEach((item, index) => {
				let itemVO = {
						yr: 			item.yr
						,apoCd: 		item.apoCd
						,brno: 			item.brno
						,crno: 			item.crno
						,corpNm: 		item.corpNm
						,uoBrno: 		item.uoBrno
						,uoCorpNm: 		item.uoCorpNm

						,sbmsnYn1: 		item.sbmsnYn1
						,sttsNm1: 		item.sttsNm1
						,sbmsnYn2: 		item.sbmsnYn2
						,sttsNm2: 		item.sttsNm2
						,sbmsnYn3: 		item.sbmsnYn3
						,sttsNm3: 		item.sttsNm3
						,sbmsnYn4: 		item.sbmsnYn4
						,sttsNm4: 		item.sttsNm4
						,sbmsnYn5: 		item.sbmsnYn5
						,sttsNm5: 		item.sttsNm5
						,sbmsnYn6: 		item.sbmsnYn6
						,sttsNm6: 		item.sttsNm6
				}
				jsonBscDocUoIso.push(itemVO);
				if (index === 0) {
					totalCnt1 = item.totalRecordCount;
				}
			});
			if(totalCnt1 == 0){
				totalCnt1 = jsonBscDocUoIso.length;
			}

			if (jsonBscDocUoIso.length > 0) {
				if(grdBscDocUoIso.getPageTotalCount() != totalCnt1){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdBscDocUoIso.setPageTotalCount(totalCnt1);		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdBscDocUoIso.rebuild();
				}else{
					grdBscDocUoIso.refresh()
				}
			} else {
				grdBscDocUoIso.setPageTotalCount(totalCnt1);
				grdBscDocUoIso.rebuild();
			}
			document.querySelector('#listCountBsc').innerText = totalCnt1;

			//세부요건 출자출하조직 리스트
			jsonDtlDocIso.length = 0;
			let totalCnt2 = 0;
			data.resultDtlISoList.forEach((item, index) => {
				let itemVO = {
						yr: 			item.yr
						,apoCd: 		item.apoCd
						,brno: 			item.brno
						,crno: 			item.crno
						,corpNm: 		item.corpNm
						,uoBrno: 		item.uoBrno
						,uoCorpNm: 		item.uoCorpNm

						,sbmsnYn1: 		item.sbmsnYn1
						,sttsNm1: 		item.sttsNm1
						,sbmsnYn2: 		item.sbmsnYn2
						,sttsNm2: 		item.sttsNm2
						,sbmsnYn3: 		item.sbmsnYn3
						,sttsNm3: 		item.sttsNm3
						,sbmsnYn4: 		item.sbmsnYn4
						,sttsNm4: 		item.sttsNm4
						,sbmsnYn5: 		item.sbmsnYn5
						,sttsNm5: 		item.sttsNm5
				}
				jsonDtlDocIso.push(itemVO);
				if (index === 0) {
					totalCnt2 = item.totalRecordCount;
				}
			});
			if(totalCnt2 == 0){
				totalCnt2 = jsonDtlDocIso.length;
			}

			if (jsonDtlDocIso.length > 0) {

				if(grdDtlDocIso.getPageTotalCount() != totalCnt2){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdDtlDocIso.setPageTotalCount(totalCnt2);		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdDtlDocIso.rebuild();
				}else{
					grdDtlDocIso.refresh()
				}
			} else {
				grdDtlDocIso.setPageTotalCount(totalCnt2);
				grdDtlDocIso.rebuild();
			}
			document.querySelector('#listCountDtlIso').innerText = totalCnt2;

			//세부요건 생산자조직 리스트
			jsonDtlDocPo.length = 0;
			let totalCnt3 = 0;
			data.resultDtlPoList.forEach((item, index) => {
				let itemVO = {
						yr: 			item.yr
						,apoCd: 		item.apoCd
						,brno: 			item.brno
						,crno: 			item.crno
						,corpNm: 		item.corpNm
						,uoBrno: 		item.uoBrno
						,uoCorpNm: 		item.uoCorpNm
						,prdcrOgnzSn: 	item.prdcrOgnzSn
						,prdcrOgnzNm: 	item.prdcrOgnzNm

						,sbmsnYn1: 		item.sbmsnYn1
						,sttsNm1: 		item.sttsNm1
				}
				jsonDtlDocPo.push(itemVO);
				if (index === 0) {
					totalCnt3 = item.totalRecordCount;
				}
			});
			if(totalCnt3 == 0){
				totalCnt3 = jsonDtlDocPo.length;
			}

			if (jsonDtlDocPo.length > 0) {

				if(grdDtlDocPo.getPageTotalCount() != totalCnt3){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdDtlDocPo.setPageTotalCount(totalCnt3);		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdDtlDocPo.rebuild();
				}else{
					grdDtlDocPo.refresh()
				}
			} else {
				grdDtlDocPo.setPageTotalCount(totalCnt3);
				grdDtlDocPo.rebuild();
			}
			document.querySelector('#listCountDtlPo').innerText = totalCnt3;

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/**
     * 증빙서류 리스트 조회
     */
	const fn_searchFileList = async function(_dcmntKnd , _brno , _prdcrOgnzSn) {

		let yr = SBUxMethod.get('dtl-inp-yr');
		let uoBrno = SBUxMethod.get('dtl-inp-brno');
		if(gfn_isEmpty(_prdcrOgnzSn)){
			_prdcrOgnzSn = '0';
		}

		let postJsonPromise = gfn_postJSON("/pd/dsm/selectDocsSbmsnList.do", {
			yr : yr
			,uoBrno : uoBrno
			,dcmntKnd : _dcmntKnd
			,brno : _brno
			,prdcrOgnzSn : _prdcrOgnzSn
		});

		let data = await postJsonPromise ;
		try{
			// 문서 종류에 따른 설정 가져오기
			const { seNm } = documentSettings[_dcmntKnd] || defaultSettings;
			console.log(seNm);

			data.resultList.forEach((item, index) => {
				let sn = item.sn;

				SBUxMethod.set( 'dtl-inp-' + seNm + 'FileNm' + sn , gfn_nvl(item.orgFileNm) );
				SBUxMethod.set( 'dtl-inp-' + seNm + 'AprvYn' + sn , gfn_nvl(item.sttsNm) );
				SBUxMethod.set( 'dtl-inp-' + seNm + 'Rmrk' + sn , gfn_nvl(item.rmrk) );

				//승인되면 업로드 불가 처리
				if(item.stts == '2'){
					$("#dtl\\-inp\\-"+seNm+"File"+sn).hide();
					$("#dtl\\-inp\\-"+seNm+"File"+sn).val("");
					SBUxMethod.attr( 'dtl-inp-' + seNm + 'Rmrk' + sn , 'readonly', 'true');
				}else{
					$("#dtl\\-inp\\-"+seNm+"File"+sn).show();
					SBUxMethod.attr( 'dtl-inp-' + seNm + 'Rmrk' + sn , 'readonly', 'false');
				}
			});

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/**
     * 기본요건 저장
     */
	const fn_save = async function(_dcmntKnd) {
		console.log("===========fn_saveBsc");

		// 문서 종류에 따른 설정 가져오기
		const { fileCnt, seNm } = documentSettings[_dcmntKnd] || defaultSettings;

		if(_dcmntKnd == null){
			return;
		}

		let formData = new FormData();

		formData.append('dcmntKnd', _dcmntKnd);//문서구분
		formData.append('fileCnt', fileCnt);//파일 갯수

		//등록년도
		let yr = SBUxMethod.get('dtl-inp-yr');
		formData.append('yr', yr);//등록년도

		if(gfn_isEmpty(yr)){
			alert('등록년도 값이 없습니다');
			return;
		}

		//통합조직 사업자번호
		let uoBrno = SBUxMethod.get('dtl-inp-brno');
		formData.append('uoBrno', uoBrno);//통합조직 사업자번호

		if(gfn_isEmpty(uoBrno)){
			alert('통합조직 정보가 없습니다');
			return;
		}

		//선택조직 사업자번호
		let brno = SBUxMethod.get('dtl-inp-'+seNm+'Brno');
		formData.append('brno', brno);//선택조직 사업자번호

		if(gfn_isEmpty(brno)){
			alert('선택한 조직 정보가 없습니다');
			return;
		}

		//세부요건 생산자조직
		if(_dcmntKnd == "DTLP"){
			//선택 생산자조직코드
			let prdcrOgnzSn = SBUxMethod.get('dtl-inp-'+seNm+'PrdcrOgnzSn');//
			formData.append('prdcrOgnzSn', prdcrOgnzSn);//선택 생산자조직코드

			if(gfn_isEmpty(prdcrOgnzSn)){
				alert('선택한 생산자조직 정보가 없습니다');
				return;
			}
		}else{
			formData.append('prdcrOgnzSn', '0');//선택 생산자조직코드
		}

		//업로드 할 파일리스트
		let newFileList = new DataTransfer();
		//업로드 할 파일구분
		let newFileSeList = [];

		//서류 리스트 처리
		for (var sn = 1; sn <= fileCnt; sn++) {
			let rmrk = gfn_nvl(SBUxMethod.get('dtl-inp-'+seNm+'Rmrk'+sn));

			//null 이여도 담아서 순서 대로 업데이트
			formData.append('rmrkList', rmrk);

			//비어있는 문서파일 제외 하고 처리
			let newFile = $('#dtl\\-inp\\-'+seNm+'File'+sn)[0].files;
			if(newFile.length > 0){
				newFileList.items.add(newFile[0]);
				newFileSeList.push(sn.toString());
			}else{
				//필수 파일 확인
			}
		}

		console.log(newFileList.files);
		console.log(newFileSeList);

		if(newFileList.files.length == 0){
			//alert('저장할 파일이 없습니다');
			//return;
		}

		for (var i = 0; i < newFileList.files.length; i++) {
			formData.append('newFileList', newFileList.files[i]);
			formData.append('newFileSeList', newFileSeList[i]);
		}

		$.ajax({
			type: 'POST',
			url: '/pd/dsm/docsFileUpload.do',
			data: formData,
			processData: false,
			contentType: false,
			success: function (response) {
				console.log(response);
				alert("처리 되었습니다.");
				fn_searchUser();
			},
			error: function (error) {
				 console.log('Error:', error);
			}
		});
	}

	var jsonComBscUoIso = [];	//기본서류 리스트
	var jsonComDtlUo = [];		//세부서류 통합조직 리스트
	var jsonComDtlIso = [];		//세부서류 출자출하조직 리스트
	var jsonComDtlPo = [];		//세부서류 생산자조직 리스트

	/**
     * 제출 서류 리스트 세팅
     */
	const fn_setDocList = async function() {
		let result1 = gfn_getComCdDtls('');
		jsonComBscUoIso.length=0;
		await result1.then((arr) => {
			arr.forEach((item) => {
				const cdVl = {
					text: item.cdVlNm,
					label: item.cdVlNm,
					value: item.cdVl,
					mastervalue : item.upCdVl,
					useYn : item.useYn
				}
				jsonComBscUoIso.push(cdVl);
			})
		})
	}

</script>
</html>