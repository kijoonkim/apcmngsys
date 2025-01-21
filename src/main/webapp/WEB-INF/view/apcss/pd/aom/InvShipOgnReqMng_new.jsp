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
					<!-- 출자출하조직 등록 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
					<!--
					<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
					 -->
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>

					<c:if test="${loginVO.userType ne '02'}">

						<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</c:if>

					<!--
					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					-->
				</c:if>
				<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
					<c:if test="${loginVO.apoSe eq '1'}">
						<sbux-button id="btnSearchFclt01" name="btnSearchFclt01" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlSearch01"></sbux-button>
						<!--
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
						-->
					</c:if>
					<c:if test="${loginVO.apoSe eq '2'}">
						<sbux-button id="btnSearchFclt02" name="btnSearchFclt02" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlSearch02"></sbux-button>
						<!--
						<sbux-button id="btnReport3" name="btnReport3" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report3"></sbux-button>
						-->
					</c:if>
					<sbux-button id="btnSaveFclt01" name="btnSaveFclt01" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
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
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true }"
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
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶통합조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdInvShipOgnReqMng" style="height:350px; width: 100%;"></div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->

			<!-- 통합조직 인경우 표기 -->
			<div id="uoInfo">
				<table class="table table-bordered tbl_fixed">
					<caption>사용자 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd01" name="dtl-input-apoCd01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe01" name="dtl-input-apoSe01"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm01"
									name="dtl-input-corpNm01"
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
									id="dtl-input-brno01"
									name="dtl-input-brno01"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999', 'autoUnmask': true }"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							</td>
							<td colspan="4" class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
			</div>
			<div id="isoListGrid">
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 리스트</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdInvShipOgnReqMng01" style="height:250px; width: 100%;"></div>
				</div>
			</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶출자출하조직 상세내역</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>출자출하조직 등록 및 신청</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="5" scope="row" class="th_bg th_border_right">법인형태</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">법인등록번호</th>
							<th colspan="4" scope="row" class="th_bg th_border_right">사업자번호</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">업체명</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">법인구분</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">법인형태</th>
							<th colspan="2" scope="row" class="th_bg">법인설립일</th>

						</tr>
						<tr>
							<!-- 법인등록번호 -->
							<td colspan="2" class="td_input">
								<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-uoCd" name="dtl-input-uoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-aprv" name="dtl-input-aprv"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-corpDdlnSeCd" name="dtl-input-corpDdlnSeCd"></sbux-input>
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
							<!-- 사업자번호 -->
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999', 'autoUnmask': true }"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 업체명 -->
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
							<!-- 법인구분 -->
							<td colspan="2" class="td_input">
								<sbux-select
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpSeCd"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<!-- 법인형태 -->
							<td colspan="2" class="td_input">
								<sbux-select
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpDtlSeCd"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<!-- 법인설립일 -->
							<td colspan="2" class="td_input">
								<sbux-datepicker
									uitype="popup"
									id="dtl-input-corpFndnDay"
									name="dtl-input-corpFndnDay"
									class="input-sm"
									style="width:100%;"
									autocomplete="off"
									readonly
								></sbux-datepicker>
							</td>
						</tr>
						<tr>
							<th colspan="2" rowspan="2" scope="row" class="th_bg th_border_right">출자자수</th>
							<th colspan="1" rowspan="2" scope="row" class="th_bg th_border_right">출자자중<br>농업인 수</th>
							<th colspan="2" rowspan="2" scope="row" class="th_bg th_border_right">출자금액<br>(천원)</th>
							<th colspan="8" scope="row" class="th_bg th_border_right">출자금액(천원)</th>
							<th rowspan="2" scope="row" class="th_bg th_border_left">농업인출<br>자지분율</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg th_border_right">농업인</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">생산자단체</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">지자체</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">기타</th>
						</tr>
						<tr>
							<!-- 출자자수 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-invstNope"
									name="dtl-input-invstNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '명' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 출자자중 농업인 수 -->
							<td colspan="1" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-invstExpndFrmerNope"
									name="dtl-input-invstExpndFrmerNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '명' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 출자금액 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-invstAmt"
									name="dtl-input-invstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 농업인 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-frmerInvstAmt"
									name="dtl-input-frmerInvstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 생산자단체 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-prdcrGrpInvstAmt"
									name="dtl-input-prdcrGrpInvstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 지자체 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-locgovInvstAmt"
									name="dtl-input-locgovInvstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 기타 -->
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-etcInvstAmt"
									name="dtl-input-etcInvstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 농업인출 자지분율 -->
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-frmerInvstAmtRt"
									name="dtl-input-frmerInvstAmtRt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="5" scope="row" class="th_bg th_border_right">대표자명</th>
							<th colspan="5" scope="row" class="th_bg th_border_right">전화번호</th>
							<th colspan="5" scope="row" class="th_bg">팩스번호</th>
						</tr>
						<tr>
							<!-- 대표자명 -->
							<td colspan="5" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-rprsvFlnm"
									name="dtl-input-rprsvFlnm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 전화번호 -->
							<td colspan="5" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-rprsvTelno"
									name="dtl-input-rprsvTelno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!-- 팩스번호 -->
							<td colspan="5" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-fxno"
									name="dtl-input-fxno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 출자출하조직이 속한 통합조직 리스트 그리드 -->
				<div class="uoList">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶ 출자출하조직이 속한 통합조직 리스트</span>
							</li>
						</ul>
					</div>
					<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
						<p>o 통합조직이 입력을 완료했어야 출자출하조직이 입력가능(입력이 안되면, 통합조직에게 작성완료 여부를 우선 확인 필요)</p>
						<p>o 출자출하조직이 속한 통합조직 리스트 : 전문품목에 대해 판매위임하고 있는 통합조직명을 검색하여 등록 필요(복수 통합조직에게 판매위임하는 경우, 2개 이상의 통합조직 등록 가능)</p>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdUoList" style="height:150px; width: 100%; overflow-x: hidden; margin-bottom: 5px;"></div>
					<!--
					<sbux-button id="btnSaveUoList" name="btnSaveUoList" uitype="normal" text="출자출하조직이 속한 통합조직 리스트 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveUoList"></sbux-button>
					-->
				</div>

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶품목 리스트</span>
						</li>
					</ul>
				</div>
				<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
					<p><b>o 품목리스트 : 통합조직에 판매위임하는 전문/육성 품목 뿐 아니라, 조직에서 취급하고 있는 기타품목까지 모두 등록</b></p>
					<p><b> - 여기에 등록해놓은 품목으로 조직의 2024년도 총 취급액을 확인할 수 있어야 함 (★총취급액 관련 서류도 통합조직에게 제출하여 실적 확인 필요)</b></p>
					<p> - 통합조직에 판매위임하는 전문/육성품목은 "전문/육성구분"를 우선 선택 후 "품목선택"을 통해서 통합조직이 기 등록한 해당품목을 선택하고, 그 외 자체사업하는 기타품목은 "전문/육성구분"에서 기타를 선택한 후 해당 품목 직접 입력하여 등록</p>
					<p> - 기본요건 확인 : 임산물류, 양곡류(미곡류 제외) 취급하는 조직의 경우, 원예농산물 대상품목(부류기준 : 청과부류, 화훼부류, 약용작물류) 취급액이 전체 취급액의 50% 이상 여부 확인</p>
					<p>　* 취급액이 너무 작은 품목(ex. 품목당 취급액 비중이 총취급액의 10% 미만 등)은 품목명을 "부류별 기타(ex.과실류기타, 과채류기타 등)"로 묶어서 작성 가능</p>
					<p>- 평가부류 : “전문/육성품목”은 통합조직이 기 등록한 내역에 따르며, “기타품목” 은 재배방식에 따라 선택가능</p>
				</div>
				<div class="sb-area-grdGpcList">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdGpcList" style="height:200px; width: 100%;"></div>
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶산지유통활성화 지원 자금 신청현황</span>
							<!--
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							 -->
						</li>
					</ul>
				</div>
				<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
					<p style="color: red;"> o 자금대환액 및 신규사용 수요를 감안하여 신청 </p>
					<p>o 산지유통활성화자금 : 자금을 신청하고 배정받을 통합조직을 선택(복수출자출하조직의 경우 1개 통합조직 선택 필요)</p>
					<p>o 자금신청액의 최소 단위는 100,000천원이고 이하 단위는 자동 절삭처리</p>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>산지유통활성화 지원 자금 신청현황</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="3" scope="row" class="th_bg th_border_right">연도</th>
							<th colspan="4" scope="row" class="th_bg">NH(농협) 자금 신청액</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span><span class="setYr">2024</span> 신규 자금 신청액(천원)</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-isoFundAplyAmt"
									name="dtl-input-isoFundAplyAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoUnmask': true , 'autoGroup': 3, 'groupSeparator': ','}"
									unmask-phone-dashes = "true"
									permit-keycodes-set = "num"
									onchange="fn_fundAplyAmt"
								></sbux-input>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>통합조직 선택</th>
							<td colspan="4" class="td_input">
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
							<td colspan="8" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<div style="margin-left: auto;">
					<br>
					<c:if test="${loginVO.userType ne '02'}">
						<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</c:if>
				</div>
				<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
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
		<jsp:include page="/WEB-INF/view/apcss/pd/popup/gpcSelectPopup.jsp"></jsp:include>
	</div>

	<!-- 통합조직 신청 리스트 조회 팝업 -->
	<div>
		<sbux-modal
			id="modal-aplyBrno"
			name="modal-aplyBrno"
			uitype="middle"
			header-title="사업자번호 선택"
			body-html-id="body-modal-aplyBrno"
			footer-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-aplyBrno">
		<jsp:include page="/WEB-INF/view/apcss/pd/popup/AplyBrnoPopup.jsp"></jsp:include>
	</div>

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

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분
	var jsonGrdCorpDtlSeCd = [];//법인형태

	var jsonGrdCtgryCd = [];//신규부류
	var jsonGrdClsfCd = [];//평가부류
	var jsonGrdSttgUpbrItemSe = [];//품목구분 전문/육성

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			//gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'UNTY_CTPV'), //시도
			//gfn_setComCdSBSelect('srch-input-sgg', 		jsonComSgg, 		'CMPTN_INST_SIGUN'), //시군
			gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 		'UNTY_SGG'), //시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('dtl-input-corpSeCd', 		jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('dtl-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 		'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 		'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE') //신청대상구분

			gfn_setComCdSBSelect('grdInvShipOgnReqMng01', 	jsonGrdCorpDtlSeCd, 'CORP_SHAP'), //법인형태

			gfn_setComCdSBSelect('grdGpcList', 				jsonGrdClsfCd, 		'CLSF_CD'), //신규부류
			gfn_setComCdSBSelect('grdGpcList', 				jsonGrdCtgryCd, 	'CTGRY_CD'), //평가부류
			gfn_setComCdSBSelect('grdGpcList', 				jsonGrdSttgUpbrItemSe, 	'STTG_UPBR_ITEM_SE_1'), //품목구분 _1 기타포함

		]);
	}


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅

		fn_gpcListGrid();
		fn_uoListGrid();
		fn_fcltMngCreateGrid01();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		$("#uoGrid").show();
		fn_fcltMngCreateGrid();
	</c:if>

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
		//$("#uoInfo").hide();
		$("#isoListGrid").hide();
		await fn_dtlSearch();
	</c:if>
	}

	/* 기본 년도값 세팅 */
	const fn_setYear = async function() {
		//console.log('fn_selectSetYear');
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
		$(".setYr").text(year);
	}

	var jsonInvShipOgnReqMng = []; // 그리드의 참조 데이터 주소 선언
	var grdInvShipOgnReqMng;

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdInvShipOgnReqMng';
		SBGridProperties.id = 'grdInvShipOgnReqMng';
		SBGridProperties.jsonref = 'jsonInvShipOgnReqMng';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.paging = {
				'type' : 'page',
				'count' : 5,
				'size' : 20,
				'sorttype' : 'page',
				'showgoalpageui' : true
			};
		SBGridProperties.columns = [
			//{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
			{caption: ["APO_CD"], 		ref: 'apoCd',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["신청년도"], 		ref: 'yr',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComAprv', label:'label', value:'value', displayui : false}},
			{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'150px',    style:'text-align:center', disabled:true
					,typeinfo : {ref:'jsonComCtpv', label:'label', value:'value', displayui : false}},
			{caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'150px',    style:'text-align:center', disabled:true
						,typeinfo : {ref:'jsonComSgg', label:'label', value:'value', displayui : false}},
			{caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["법인번호"], 		ref: 'crno',   	type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["법인체마감"], 		ref: 'corpDdlnSeCd',   	type:'output',  width:'90px',    style:'text-align:center'},
			{caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'220px',    style:'text-align:center'}
		];

		grdInvShipOgnReqMng = _SBGrid.create(SBGridProperties);

		//grdInvShipOgnReqMng.refresh({"combo":true});
		//클릭 이벤트 바인드
		grdInvShipOgnReqMng.bind('click','fn_view');
		//키보드 이동 이벤트
		grdInvShipOgnReqMng.bind('keyup','fn_keyupOgnz');
		grdInvShipOgnReqMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	//조직 그리드 키보드로 이동시 이벤트
	const fn_keyupOgnz = async function(event) {
		//console.log('dd');
		if(event.keyCode == 38 || event.keyCode == 40) {
			fn_view();
		}
	}

	var jsonInvShipOgnReqMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdInvShipOgnReqMng01;

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {
		let yr = SBUxMethod.get("srch-input-yr");
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");
		}
		let totStr = yr + "년";

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdInvShipOgnReqMng01';
		SBGridProperties.id = 'grdInvShipOgnReqMng01';
		SBGridProperties.jsonref = 'jsonInvShipOgnReqMng01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
			{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				<c:if test="${loginVO.userType ne '02'}">
				let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
				//console.log(corpDdlnSeCd);
				if(corpDdlnSeCd != 'Y'){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procUoRow(\"DEL\" , \"grdInvShipOgnReqMng01\", " + nRow + ")'>삭제</button>";
				}
				</c:if>
				return "";
			}},
			{caption: ["업체명"], 			ref: 'corpNm',   	type:'output',  width:'220px',    style:'text-align:center'},
			{caption: ["대표자명"], 			ref: 'rprsvFlnm',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["신청여부"], 			ref: 'aplyChk',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["계정권한"], 			ref: 'userType',   	type:'output',  width:'130px',    style:'text-align:center'},
			{caption: ["신청일"], 				ref: 'aplyDay',   	type:'output',  width:'85px',    style:'text-align:center'},
			{caption: ["사업자번호"], 			ref: 'brno',   	type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["법인번호"], 			ref: 'crno',   	type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["법인체마감여부"], 		ref: 'corpDdlnSeCd',   	type:'output',  width:'90px',    style:'text-align:center'},
			{caption: ["전화번호"], 			ref: 'rprsvTelno',   	type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["법인형태"], 			ref: 'corpDtlSeCd',  	type:'combo',  width:'120px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdCorpDtlSeCd', label:'label', value:'value', displayui : false}},
			//{caption: ["법인형태 코드"], 			ref: 'corpDtlSeCd',   	type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["출자자수"], 			ref: 'invstNope',   	type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["출자자 중 농업인수"], 	ref: 'invstExpndFrmerNope',   	type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["농업인 출자 지분율"], 	ref: 'frmerInvstAmtRt',   	type:'output',  width:'120px',    style:'text-align:center'},
			{caption: [totStr + "자금신청액(천원)"], 	ref: 'isoFundAplyAmt',   	type:'output',  width:'150px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["비고"], 				ref: 'rmrk',   	type:'output',  width:'120px',    style:'text-align:center'},

			//{caption: ["상세내역"], 	ref: 'isoFundAplyAmt',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'aplyTrgtSe',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   				hidden : true},
			{caption: ["상세내역"], 	ref: 'uoBrno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'uoBrnoDel',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoCd',   				hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',   				hidden : true},
			{caption: ["상세내역"], 	ref: 'corpSeCd',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'corpFndnDay',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'invstAmt',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'frmerInvstAmt',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrGrpInvstAmt',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'locgovInvstAmt',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'etcInvstAmt',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'aprv',   				hidden : true},
			{caption: ["상세내역"], 	ref: 'fxno',   				hidden : true}
		];

		grdInvShipOgnReqMng01 = _SBGrid.create(SBGridProperties);

		//grdInvShipOgnReqMng01.refresh({"combo":true});
		//클릭 이벤트 바인드
		grdInvShipOgnReqMng01.bind('click','fn_view01');
		//키보드 이동
		grdInvShipOgnReqMng01.bind('keyup','fn_keyupOgnz01');
	}


	//조직 그리드 키보드로 이동시 이벤트
	const fn_keyupOgnz01 = async function(event) {
		if(event.keyCode == 38 || event.keyCode == 40) {
			fn_view01();
		}
	}

	/**
     * 목록 조회
     */
	const fn_search = async function() {
		fn_clearForm();
		// set pagination
		let pageSize = grdInvShipOgnReqMng.getPageSize();
		let pageNo = 1;

		fn_setGrdFcltList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdInvShipOgnReqMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdInvShipOgnReqMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_setGrdFcltList(recordCountPerPage, currentPageNo);
	}

	const fn_report3 = async function() {
		let brno = '${loginVO.brno}';
		//현재년도
		let now = new Date();
		let year = now.getFullYear();

		if(gfn_isEmpty(brno)) return;

		gfn_popClipReport("출자출하조직 신청정보", "pd/insDoc4.crf", {
			brno : brno
			,yr : year
		});
	}

	const fn_report2 = async function() {

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		var nRow = grdInvShipOgnReqMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		let rowData = grdInvShipOgnReqMng.getRowData(nRow);

		let uoBrno = rowData.brno;
		</c:if>
		<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
		let uoBrno = '${loginVO.brno}';
		</c:if>

		let yr = SBUxMethod.get("dtl-input-yr");//

		gfn_popClipReport("출자출하조직 신청정보", "pd/insDoc2.crf", {
			uobrno	: gfn_nvl(uoBrno)
			, yr	: gfn_nvl(yr)
		});
	}


	const fn_report = async function() {
		let yr = SBUxMethod.get("srch-input-yr");//
		//통합조직인 경우
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");//
		}
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		let aprv = SBUxMethod.get("srch-input-aprv");//

		let corpDdlnSeCd = SBUxMethod.get("srch-input-corpDdlnSeCd");//

		//sbgrid 체크박스 값 사용
		let yrChk = SBUxMethod.get("srch-input-yrChk");//
		let keys = Object.getOwnPropertyNames(yrChk);
		let yrChkVal = null;
		for(let i=0; i<keys.length; i++){
			if(yrChk[keys[i]]){
				yrChkVal = yrChk[keys[i]];
			}
		}


		gfn_popClipReport("출자출하조직 등록", "pd/allGroupDoc2.crf", {
			yr 				: gfn_nvl(yr)
			, cmptnInst 	: gfn_nvl(cmptnInst)
			, ctpv 			: gfn_nvl(ctpv)
			, corpSeCd 		: gfn_nvl(corpSeCd)
			, corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			, brno 			: gfn_nvl(brno)
			, corpNm 		: gfn_nvl(corpNm)
			, corpDdlnSeCd 	: gfn_nvl(corpDdlnSeCd)
			, aprv 			: gfn_nvl(aprv)
			, yrChk 		: gfn_nvl(yrChk)
			, yrChkVal 		: gfn_nvl(yrChkVal)
			, apoSe 		: "1"
		});
	}


	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		let yr = SBUxMethod.get("srch-input-yr");//
		//통합조직인 경우
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");//
		}
		await fn_fcltMngCreateGrid01();
		await $(".setYr").text(yr);

		//console.log(yr);
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

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

		let postJsonPromise01 = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			cmptnInst : cmptnInst
			,ctpv : ctpv
			,yr : yr
			,yrChk : yrChkVal

			,corpSeCd : corpSeCd
			,corpDtlSeCd : corpDtlSeCd

			,brno : brno
			,corpNm : corpNm
			,apoSe : '1'
			,aprv : aprv

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
			,recordCountPerPage : pageSize
		});

		let data = await postJsonPromise01 ;
		try{
			jsonInvShipOgnReqMng.length = 0;
			let totalRecordCount = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoSe: item.apoSe
						,apoCd: item.apoCd
						,ctpv: item.ctpv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,brno: item.brno
						,crno: item.crno
						,aprv: item.aprv
						,yr: item.yr
						,corpDdlnSeCd: item.corpDdlnSeCd
				}
				jsonInvShipOgnReqMng.push(InvShipOgnReqMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonInvShipOgnReqMng.length > 0) {

				if(grdInvShipOgnReqMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdInvShipOgnReqMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdInvShipOgnReqMng.rebuild();
				}else{
					grdInvShipOgnReqMng.refresh()
				}
			} else {
				grdInvShipOgnReqMng.setPageTotalCount(totalRecordCount);
				grdInvShipOgnReqMng.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdInvShipOgnReqMng.rebuild();

			//비어 있는 마지막 줄 추가용도?
			//grdInvShipOgnReqMng.addRow();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//사용자 조회
	const fn_dtlSearch = async function(){
		//console.log('============fn_dtlSearch=============');
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		//사용자는 현재년도만 필요함
		let now = new Date();
		let year = now.getFullYear();

		let yr = SBUxMethod.get("dtl-input-yr");//
		//console.log(yr);
		if(gfn_isEmpty(yr)){
			yr = year;
		}

		let postJsonPromise01 = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
		//let postJsonPromise01 = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			brno : brno
			,yr : yr
		});

		let data = await postJsonPromise01 ;
		try{
			//console.log("data==="+data);
			let wrtYn = null;
			let corpDdlnSeCd = null;
			let apoSe = null;
			//console.log('data');
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd01',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe01',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm01',gfn_nvl(item.corpNm))//법인명
				//SBUxMethod.set('dtl-input-crno01',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno01',gfn_nvl(item.brno))//사업자등록번호
				//신청정보가 없는 경우 년도값이 없음
				//SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//
				wrtYn = item.wrtYn;
				corpDdlnSeCd = item.corpDdlnSeCd;
				apoSe = item.apoSe;
				SBUxMethod.set('dtl-input-corpDdlnSeCd',gfn_nvl(item.corpDdlnSeCd))//법인체마감 여부
			});

			//let apoSe = SBUxMethod.get('dtl-input-apoSe01');

			/*
			//하위 출자출하조직 그리드 데이터 제거
			jsonInvShipOgnReqMng01.length = 0;
			grdInvShipOgnReqMng01.rebuild();
			*/

			//산지조직관리 작성여부
			if(wrtYn != 'Y'){
				$(".btn").hide();// 모든 버튼 숨기기
				SBUxMethod.clearAllData();//모든 데이터 클리어
				//하위 출자출하조직 그리드 데이터 제거
				$("#isoListGrid").hide();

				alert("산지조직관리 작성이 필요합니다.");

				//iframe 밖의 탭 닫기
				//parent.tabJsonData 열린 탭 정보 리스트
				//parent.SBUxMethod.get('tab_menu') 현재 선택된 탭이름
				//현재 열린 탭정보
				let tabInfo = _.find(parent.tabJsonData, {text: parent.SBUxMethod.get('tab_menu')});

				//사이드 메뉴를 누르기 전 상태로 돌려야함
				//removeTab 으로 탭 닫기 하는경우 기존 사이드메뉴 누른 상태가 남아서
				//사이드 메뉴를 아무것도 선택안한 상태로 돌릴 방법이 필요함 -> 재호출 or 닫힘으로 처리
				parent.SBUxMethod.refresh('side_menu');
				//탭닫기
				parent.gfn_tabClose(tabInfo);

				return false;
			}
			//법인체마감 여부
			if(corpDdlnSeCd == 'Y'){
				//$(".btn").hide();// 모든 버튼 숨기기
				//저장버튼만 숨김처리
				$("#btnSaveFclt01").hide();
				$("#btnSaveFclt1").hide();
				SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);
				SBUxMethod.attr('dtl-input-isoFundAplyAmt','readonly',true);

			}

			if(apoSe == '1'){
				$("#uoInfo").show();
				$("#isoListGrid").show();
				fn_dtlSearch01();//하위 출자출하조직 리스트
			}else{
				//$("#uoInfo").hide();
				$("#isoListGrid").hide();
				jsonInvShipOgnReqMng01.length = 0;
				grdInvShipOgnReqMng01.rebuild();
				fn_dtlSearch02();//출자출하조직 정보 조회
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//출자출하조직 리스트 조회
	const fn_dtlSearch01 = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		//현재년도
		let now = new Date();
		let year = now.getFullYear();
		let yr = SBUxMethod.get('dtl-input-yr');
		//년도가 비어있는 예외의 경우
		if(gfn_isEmpty(yr)){
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			uoBrno : brno
			,yr : yr
		});
		let data = await postJsonPromise;
		try{
			jsonInvShipOgnReqMng01.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoCd: item.apoCd
						,corpNm: item.corpNm
						,corpDdlnSeCd: item.corpDdlnSeCd
						,rprsvFlnm: item.rprsvFlnm
						,brno: item.brno
						,crno: item.crno
						,uoBrno: item.uoBrno
						,uoBrnoDel: item.uoBrnoDel
						,uoCd: item.uoCd
						,rprsvTelno: item.rprsvTelno
						,corpDtlSeCd: item.corpDtlSeCd
						,invstNope: item.invstNope
						,invstExpndFrmerNope: item.invstExpndFrmerNope

						,crno: item.crno
						,corpSeCd: item.corpSeCd
						,corpFndnDay: item.corpFndnDay
						,invstAmt: item.invstAmt
						,frmerInvstAmt: item.frmerInvstAmt
						,prdcrGrpInvstAmt: item.prdcrGrpInvstAmt
						,locgovInvstAmt: item.locgovInvstAmt
						,etcInvstAmt: item.etcInvstAmt
						,rprsvFlnm: item.rprsvFlnm
						,rprsvTelno: item.rprsvTelno
						,fxno: item.fxno
						,isoFundAplyAmt: item.isoFundAplyAmt
						,aplyTrgtSe: item.aplyTrgtSe
						,yr: item.yr

						,frmerInvstAmtRt: item.frmerInvstAmtRt

						,aplyChk: item.aplyChk
						,aplyDay: item.aplyDay
						,userType: item.userType

				}
				jsonInvShipOgnReqMng01.push(InvShipOgnReqMngVO);
			});

			grdInvShipOgnReqMng01.rebuild();
			fn_clearForm01();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	//출자출하조직 조회
	const fn_dtlSearch02 = async function(){
		//console.log('fn_dtlSearch02');
		let brno = '${loginVO.brno}';
		//현재년도
		let now = new Date();
		let year = now.getFullYear();
		let yr = SBUxMethod.get('dtl-input-yr');
		//console.log(brno,yr);
		if(gfn_isEmpty(brno)) return;
		//년도가 비어있는 예외의 경우
		if(gfn_isEmpty(yr)){
			yr = year;
		}
		let wrtYn = null;
		let corpDdlnSeCd = null;

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			isoBrno : brno
			,yr : yr
		});
		let data = await postJsonPromise;
		try{
			jsonInvShipOgnReqMng01.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				SBUxMethod.set("dtl-input-apoCd", item.apoCd);
				SBUxMethod.set("dtl-input-apoSe", item.apoSe);
				SBUxMethod.set("dtl-input-crno", item.crno);
				SBUxMethod.set("dtl-input-brno", item.brno);
				SBUxMethod.set("dtl-input-uoBrno", item.uoBrno);
				SBUxMethod.set("dtl-input-corpNm", item.corpNm);
				//SBUxMethod.set("dtl-input-corpDdlnSeCd", item.corpDdlnSeCd);//법인체 마감
				SBUxMethod.set("dtl-input-corpSeCd", item.corpSeCd);
				SBUxMethod.set("dtl-input-corpDtlSeCd", item.corpDtlSeCd);
				SBUxMethod.set("dtl-input-corpFndnDay", item.corpFndnDay);
				SBUxMethod.set("dtl-input-invstNope", item.invstNope);
				SBUxMethod.set("dtl-input-invstExpndFrmerNope", item.invstExpndFrmerNope);
				SBUxMethod.set("dtl-input-invstAmt", item.invstAmt);
				SBUxMethod.set("dtl-input-frmerInvstAmt", item.frmerInvstAmt);
				SBUxMethod.set("dtl-input-prdcrGrpInvstAmt", item.prdcrGrpInvstAmt);
				SBUxMethod.set("dtl-input-locgovInvstAmt", item.locgovInvstAmt);
				SBUxMethod.set("dtl-input-etcInvstAmt", item.etcInvstAmt);
				SBUxMethod.set("dtl-input-rprsvFlnm", item.rprsvFlnm);
				SBUxMethod.set("dtl-input-rprsvTelno", item.rprsvTelno);
				SBUxMethod.set("dtl-input-fxno", item.fxno);

				//SBUxMethod.set("dtl-input-aplyTrgtSe", item.aplyTrgtSe);
				SBUxMethod.set("dtl-input-isoFundAplyAmt", item.isoFundAplyAmt);

				SBUxMethod.set("dtl-input-frmerInvstAmtRt", item.frmerInvstAmtRt);

				wrtYn = item.wrtYn;
				corpDdlnSeCd = item.corpDdlnSeCd;
			});

			//산지조직신청 확인
			if(wrtYn != 'Y'){
				alert("산지조직관리 작성이 필요합니다.");
				$(".btn").hide();// 모든 버튼 숨기기
				$(".uoList").hide();
				SBUxMethod.clearAllData();//모든 데이터 클리어
				return false;
			}

			//출자출하조직 사용자 화면에서는 그리드 선택하는 과정이 없어 추가
			await fn_searchUoList();
			let uoBrno = SBUxMethod.get("dtl-input-uoBrno");
			await SBUxMethod.set("dtl-input-selUoBrno", uoBrno);

			//마감 확인
			if(corpDdlnSeCd == 'Y'){
				//$(".btn").hide();// 모든 버튼 숨기기
				//저장버튼 숨김 처리
				$("#btnSaveFclt01").hide();
				$("#btnSaveFclt1").hide();
				SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);
				SBUxMethod.attr('dtl-input-isoFundAplyAmt','readonly',true);
			}else{
				//$(".btn").show();// 모든 버튼 보이게
				$("#btnSaveFclt01").show();
				$("#btnSaveFclt1").show();
				SBUxMethod.attr('dtl-input-selUoBrno','readonly',false);
				SBUxMethod.attr('dtl-input-isoFundAplyAmt','readonly',false);
			}

			fn_selectGpcList();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	var comUoBrno = [];//통합조직 선택

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(){
		//console.log('fn_searchUoList');
		//출자출하조직이 아닌경우
		<c:if test="${loginVO.apoSe ne '2'}">
		let brno = SBUxMethod.get('dtl-input-brno');
		</c:if>
		//출자출하조직인 경우
		<c:if test="${loginVO.apoSe eq '2'}">
		let brno = '${loginVO.brno}';
		</c:if>

		let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			brno : brno
		});
		let data = await postJsonPromise;
		try{
			//통합조직 콤보박스
			comUoBrno = [];
			let uoBrno;
			data.resultList.forEach((item, index) => {
				uoBrno = item.uoBrno;
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
				SBUxMethod.set('dtl-input-selUoBrno' , uoBrno);
				SBUxMethod.set('dtl-input-uoBrno',uoBrno);
			}

			//상위 통합조직 그리드
			jsonUoList.length = 0;
			data.resultList.forEach((item, index) => {
				let uoListVO = {
						uoApoCd		: item.uoApoCd
						,uoCorpNm	: item.uoCorpNm
						,uoBrno		: item.uoBrno
						,uoCrno		: item.uoCrno
						,isoApoCd	: item.isoApoCd
						,delYn		: item.delYn
				}
				jsonUoList.push(uoListVO);
			});
			grdUoList.rebuild();

			//비어 있는 마지막 줄 추가용도
			let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
			if(corpDdlnSeCd != 'Y'){
				grdUoList.addRow();
			}

			let rmrkCol = grdUoList.getColRef('rmrk');
			let selCol = grdUoList.getColRef('sel');

			let grdData = grdUoList.getGridDataAll();
			let captionRow = grdUoList.getFixedRows();
			for (var i = captionRow; i < grdData.length + captionRow; i++) {
				let rowData = grdUoList.getRowData(i);
				//console.log(rowData.delYn);
				if(rowData.delYn != 'N'){
					grdUoList.setCellStyle('background-color', i, selCol, i, rmrkCol, 'lightgray');
				}
			}

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
		if( typeof selCombo == "undefined" || selCombo == null || selCombo == "" ){
			SBUxMethod.set('dtl-input-uoBrno' , null);
			SBUxMethod.set('dtl-input-uoCd' , null);
		}else{
			SBUxMethod.set('dtl-input-uoBrno',selCombo.value);
			SBUxMethod.set('dtl-input-uoCd',selCombo.uoApoCd);
		}
	}

	/**
	 * 저장 버튼
	 */
	const fn_save = async function() {
		//console.log("******************fn_save**********************************");

		let brno = SBUxMethod.get('dtl-input-brno')//
		if(gfn_isEmpty(brno)) return;

		//필수값 체크
		if(!fn_checkRequiredInput()){
			return false;
		}

		fn_subUpdate(confirm("저장 하시겠습니까?"));
	}

	function fn_checkRequiredInput(){
		//레드닷 처리한 필수값들 확인
		//W0001	{0}을/를 선택하세요.
		//W0002 : {0}을/를 입력하세요.

		let isoFundAplyAmt = SBUxMethod.get("dtl-input-isoFundAplyAmt");
		if(gfn_isEmpty(isoFundAplyAmt)){
			gfn_comAlert("W0002", "자금 신청액");
			return false;
		}

		let selUoBrno = SBUxMethod.get("dtl-input-selUoBrno");
		if(gfn_isEmpty(selUoBrno)){
			gfn_comAlert("W0001", "통합조직");
			return false;
		}

		//품목 그리드 필수갑 확인
		let gridData = grdGpcList.getGridDataAll();
		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdGpcList.getRowData(i);

			if(rowData.delYn == 'N'){
				if(gfn_isEmpty(rowData.sttgUpbrItemSe)){
					alert('품목 리스트의 전문/육성 구분을 선택해주세요');
					grdGpcList.focus();
					return false;
				}
				//기타가 아닌 경우
				/* 20241220 기타 품목인 경우에도 평가부류 입력 하게 변경 요청 */
				/*
				if(rowData.sttgUpbrItemSe != '3'){
					if(gfn_isEmpty(rowData.ctgryCd)){
						alert('품목 리스트의 평가부류를 선택해주세요');
						grdGpcList.focus();//그리드 객체로 포커스 이동
						return false;
					}
				}
				*/
				if(gfn_isEmpty(rowData.itemCd)){
					alert('품목 리스트의 품목을 선택해주세요');
					grdGpcList.focus();
					return false;
				}
				if(gfn_isEmpty(rowData.ctgryCd)){
					alert('품목 리스트의 평가부류를 선택해주세요');
					grdGpcList.focus();//그리드 객체로 포커스 이동
					return false;
				}
				if(gfn_isEmpty(rowData.clsfCd)){
					alert('품목 리스트의 부류를 선택해주세요');
					grdGpcList.focus();//그리드 객체로 포커스 이동
					return false;
				}
			}
		}
		return true;
	}


	/**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
	const fn_subInsert = async function (isConfirmed){
		//console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let yr = SBUxMethod.get('dtl-input-yr')//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		const postJsonPromise = gfn_postJSON("/pd/aom/insertPrdcrCrclOgnReqMng.do", {
			apoCd: SBUxMethod.get('dtl-input-apoCd')//
			,apoSe: SBUxMethod.get('dtl-input-apoSe')//
			,brno: SBUxMethod.get('dtl-input-brno')//
			,crno: SBUxMethod.get('dtl-input-crno')//
			,corpNm: SBUxMethod.get('dtl-input-corpNm')//
			,yr : yr
			,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
			//,aplyTrgtSe: SBUxMethod.get('dtl-input-aplyTrgtSe')//
		});

		const data = await postJsonPromise;
		//console.log("insert result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
				fn_search();
			</c:if>
			<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
				//통합조직인 경우
				<c:if test="${loginVO.apoSe eq '1'}">
				//console.log('통합조직인');
				//fn_dtlSearch();
				fn_dtlSearch01();
				</c:if>
				//출하조직인 경우
				<c:if test="${loginVO.apoSe eq '2'}">
				//console.log('출하조직인');
				fn_dtlSearch02();
				</c:if>
			</c:if>
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {

		}
	}


	/**
     * @param {boolean} isConfirmed
     * 업데이트
     */
	const fn_subUpdate = async function (isConfirmed){
		//console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

		let gridData = grdGpcList.getGridDataAll();
		let gpcList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd')//
		let apoSe = SBUxMethod.get('dtl-input-apoSe')//
		let brno = SBUxMethod.get('dtl-input-brno')//
		let crno = SBUxMethod.get('dtl-input-crno')//
		let corpNm = SBUxMethod.get('dtl-input-corpNm')//
		let yr = SBUxMethod.get('dtl-input-yr')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdGpcList.getRowData(i);
			let rowSts = grdGpcList.getRowStatus(i);
			//console.log(i+"행 상태값 : "+rowSts);

			let delYn = rowData.delYn;

			rowData.apoCd = apoCd;
			rowData.apoSe = '2';
			rowData.brno = brno;
			rowData.crno = crno;
			rowData.corpNm = corpNm;
			rowData.yr = yr;

			if(delYn == 'N'){
				//모든데이터 저장 처리
				rowData.rowSts = "I";
				gpcList.push(rowData);

			}
		}

		let saveList = {
				apoCd: SBUxMethod.get('dtl-input-apoCd')//
				,apoSe: '2'// 해당화면 등록자는 전부 출자출하조직임
				,brno: SBUxMethod.get('dtl-input-brno')//
				,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
				,uoCd: SBUxMethod.get('dtl-input-uoCd')//
				,crno: SBUxMethod.get('dtl-input-crno')//
				,corpNm: SBUxMethod.get('dtl-input-corpNm')//
				,yr: SBUxMethod.get('dtl-input-yr')//
				,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
			};

		saveList.gpcList = gpcList;

		const postJsonPromise = gfn_postJSON("/pd/aom/insertInvShipOgnReqMng.do", saveList);

		const data = await postJsonPromise;
		//console.log("update result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
				fn_search();
			</c:if>
			<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
				//통합조직인 경우
				<c:if test="${loginVO.apoSe eq '1'}">
				//console.log('통합조직인');
				//fn_dtlSearch();
				fn_dtlSearch01();
				</c:if>
				//출하조직인 경우
				<c:if test="${loginVO.apoSe eq '2'}">
				//console.log('출하조직인');
				fn_dtlSearch02();
				</c:if>
				<c:if test="${loginVO.apoSe ne '1' && loginVO.apoSe ne '2'}">
				//iframe 부모요소에 접근해야 전체 새로고침 가능
				window.parent.document.location.reload();
				</c:if>
			</c:if>
			} else {
				//alert(data.resultMessage);
			}
		} catch(e) {

		}

  }



	//통합조직 리스트 그리드 클릭시 출자출하조직 리스트 조회 이벤트
	const fn_view = async function(){
		//console.log("******************fn_view**********************************");
		fn_clearForm();

		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdInvShipOgnReqMng.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = grdInvShipOgnReqMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//해당 로우 데이터로 출자출하조직 리스트 조회
		let rowData = grdInvShipOgnReqMng.getRowData(nRow);
		//console.log(rowData);
		SBUxMethod.set('dtl-input-corpNm01',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-brno01',gfn_nvl(rowData.brno))//사업자등록번호
		//콤보박스로 선택할수 있게 변경 됨
		//SBUxMethod.set("dtl-input-uoCd", rowData.apoCd);
		//SBUxMethod.set("dtl-input-uoBrno", rowData.brno);

		let uoBrno = rowData.brno;
		let yr = rowData.yr;
		if(gfn_isEmpty(yr)){
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
			yr = SBUxMethod.set("srch-input-yr");
			</c:if>
			<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
			yr = SBUxMethod.set("dtl-input-yr");
			</c:if>
		}

		//let apoCd = rowData.apoCd;

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			uoBrno : uoBrno
			//,apoCd : apoCd
			,yr : yr
		});
		let data = await postJsonPromise;
		try{
			jsonInvShipOgnReqMng01.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoCd: item.apoCd
						,uoBrno: item.uoBrno
						,uoBrnoDel: item.uoBrnoDel
						,uoCd: item.uoCd
						,corpNm: item.corpNm
						,rprsvFlnm: item.rprsvFlnm
						,brno: item.brno
						,rprsvTelno: item.rprsvTelno
						,corpDtlSeCd: item.corpDtlSeCd
						,invstNope: item.invstNope
						,invstExpndFrmerNope: item.invstExpndFrmerNope

						,crno: item.crno
						,corpSeCd: item.corpSeCd
						,corpFndnDay: item.corpFndnDay
						,invstAmt: item.invstAmt
						,frmerInvstAmt: item.frmerInvstAmt
						,prdcrGrpInvstAmt: item.prdcrGrpInvstAmt
						,locgovInvstAmt: item.locgovInvstAmt
						,etcInvstAmt: item.etcInvstAmt
						,rprsvFlnm: item.rprsvFlnm
						,rprsvTelno: item.rprsvTelno
						,fxno: item.fxno
						,isoFundAplyAmt: item.isoFundAplyAmt
						,aplyTrgtSe: item.aplyTrgtSe
						,yr: item.yr

						,frmerInvstAmtRt: item.frmerInvstAmtRt

						,corpDdlnSeCd: item.corpDdlnSeCd

						,aplyChk: item.aplyChk
						,aplyDay: item.aplyDay
						,userType: item.userType
				}
				jsonInvShipOgnReqMng01.push(InvShipOgnReqMngVO);
			});

			grdInvShipOgnReqMng01.rebuild();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출자출하조직 상세 조회
	const fn_view01 = async function(){
		//console.log("******************fn_view**********************************");

		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdInvShipOgnReqMng01.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = grdInvShipOgnReqMng01.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}
		fn_clearForm01();

		//해당 로우 데이터로 출자출하조직 리스트 조회
		let rowData = grdInvShipOgnReqMng01.getRowData(nRow);
		//console.log(rowData);

		SBUxMethod.set("dtl-input-apoCd", rowData.apoCd);
		SBUxMethod.set("dtl-input-crno", rowData.crno);
		SBUxMethod.set("dtl-input-brno", rowData.brno);
		SBUxMethod.set("dtl-input-corpNm", rowData.corpNm);
		SBUxMethod.set("dtl-input-corpSeCd", rowData.corpSeCd);
		SBUxMethod.set("dtl-input-corpDtlSeCd", rowData.corpDtlSeCd);
		SBUxMethod.set("dtl-input-corpFndnDay", rowData.corpFndnDay);
		SBUxMethod.set("dtl-input-invstNope", rowData.invstNope);
		SBUxMethod.set("dtl-input-invstExpndFrmerNope", rowData.invstExpndFrmerNope);
		SBUxMethod.set("dtl-input-invstAmt", rowData.invstAmt);
		SBUxMethod.set("dtl-input-frmerInvstAmt", rowData.frmerInvstAmt);
		SBUxMethod.set("dtl-input-prdcrGrpInvstAmt", rowData.prdcrGrpInvstAmt);
		SBUxMethod.set("dtl-input-locgovInvstAmt", rowData.locgovInvstAmt);
		SBUxMethod.set("dtl-input-etcInvstAmt", rowData.etcInvstAmt);
		SBUxMethod.set("dtl-input-rprsvFlnm", rowData.rprsvFlnm);
		SBUxMethod.set("dtl-input-rprsvTelno", rowData.rprsvTelno);
		SBUxMethod.set("dtl-input-fxno", rowData.fxno);
		//신청정보가 없는 예외의 경우 년도 값이 없음
		if(!gfn_isEmpty(rowData.yr)){
			SBUxMethod.set("dtl-input-yr", rowData.yr);
		}
		if(gfn_isEmpty(SBUxMethod.get("dtl-input-yr"))){
			SBUxMethod.set("dtl-input-yr", SBUxMethod.get("srch-input-yr") );
		}

		SBUxMethod.set("dtl-input-aprv", rowData.aprv);

		//SBUxMethod.set("dtl-input-aplyTrgtSe", rowData.aplyTrgtSe);
		SBUxMethod.set("dtl-input-isoFundAplyAmt", rowData.isoFundAplyAmt);

		SBUxMethod.set("dtl-input-frmerInvstAmtRt", rowData.frmerInvstAmtRt);

		SBUxMethod.set("dtl-input-uoCd", rowData.uoCd);
		SBUxMethod.set("dtl-input-uoBrno", rowData.uoBrno);
		await fn_searchUoList();
		await SBUxMethod.set("dtl-input-selUoBrno", rowData.uoBrno);
		fn_selectGpcList();//품목리스트 조회
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		/*
		if(rowData.corpDdlnSeCd == 'Y'){
			//$(".btn").hide();// 모든 버튼 숨기기
			SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);
			SBUxMethod.attr('dtl-input-isoFundAplyAmt','readonly',true);
		}else{
			//$(".btn").show();// 모든 버튼 보이기
			SBUxMethod.attr('dtl-input-selUoBrno','readonly',false);
			SBUxMethod.attr('dtl-input-isoFundAplyAmt','readonly',false);
		}
		*/
		</c:if>
	}

	const fn_clearForm01 = function() {
		jsonGpcList.length=0;
		grdGpcList.rebuild();

		SBUxMethod.set("dtl-input-apoCd", null);
		SBUxMethod.set("dtl-input-crno", null);
		SBUxMethod.set("dtl-input-brno", null);
		SBUxMethod.set("dtl-input-corpNm", null);
		SBUxMethod.set("dtl-input-corpSeCd", null);
		SBUxMethod.set("dtl-input-corpDtlSeCd", null);
		SBUxMethod.set("dtl-input-corpFndnDay", null);
		SBUxMethod.set("dtl-input-invstNope", null);
		SBUxMethod.set("dtl-input-invstExpndFrmerNope", null);
		SBUxMethod.set("dtl-input-invstAmt", null);
		SBUxMethod.set("dtl-input-frmerInvstAmt", null);
		SBUxMethod.set("dtl-input-prdcrGrpInvstAmt", null);
		SBUxMethod.set("dtl-input-locgovInvstAmt", null);
		SBUxMethod.set("dtl-input-etcInvstAmt", null);
		SBUxMethod.set("dtl-input-rprsvFlnm", null);
		SBUxMethod.set("dtl-input-rprsvTelno", null);
		SBUxMethod.set("dtl-input-fxno", null);
		SBUxMethod.set("dtl-input-aprv", null);

		//SBUxMethod.set("dtl-input-aplyTrgtSe", null);
		SBUxMethod.set("dtl-input-isoFundAplyAmt", null);

		SBUxMethod.set("dtl-input-frmerInvstAmtRt", null);

		SBUxMethod.set("dtl-input-uoCd", null);
		SBUxMethod.set("dtl-input-uoBrno", null);
		SBUxMethod.set("dtl-input-selUoBrno", null);
	}

	//신규
	function fn_create() {
		//console.log("******************fn_create**********************************");
		SBUxMethod.set('dtl-input-intyYn',null)//
		SBUxMethod.set('dtl-input-uoNm',null)//
		SBUxMethod.set('dtl-input-uoBrno',null)//
		SBUxMethod.set('dtl-input-untyYr',null)//
	}

	//삭제
	//출자출하조직 리스트 삭제
	async function fn_deleteRsrc(InvShipOgnReqMngVO,nRow){
		//console.log("===========fn_deleteRsrc===========");
		let postJsonPromise = gfn_postJSON("/pd/aom/deleteInvShipOgnReqMng.do", InvShipOgnReqMngVO);
		let data = await postJsonPromise;

		try{
			if(data.result > 0){
				alert("삭제 되었습니다.");
				grdInvShipOgnReqMng01.deleteRow(nRow);
				fn_search();
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

	const fn_clearForm = function() {
		jsonInvShipOgnReqMng01.length=0;
		grdInvShipOgnReqMng01.rebuild();

		jsonGpcList.length=0;
		grdGpcList.rebuild();

		SBUxMethod.set("dtl-input-apoCd", null);
		SBUxMethod.set("dtl-input-crno", null);
		SBUxMethod.set("dtl-input-brno", null);
		SBUxMethod.set("dtl-input-uoBrno", null);
		SBUxMethod.set("dtl-input-uoCd", null);
		SBUxMethod.set("dtl-input-selUoBrno", null);
		SBUxMethod.set("dtl-input-corpNm", null);
		SBUxMethod.set("dtl-input-corpSeCd", null);
		SBUxMethod.set("dtl-input-corpDtlSeCd", null);
		SBUxMethod.set("dtl-input-corpFndnDay", null);
		SBUxMethod.set("dtl-input-invstNope", null);
		SBUxMethod.set("dtl-input-invstExpndFrmerNope", null);
		SBUxMethod.set("dtl-input-invstAmt", null);
		SBUxMethod.set("dtl-input-frmerInvstAmt", null);
		SBUxMethod.set("dtl-input-prdcrGrpInvstAmt", null);
		SBUxMethod.set("dtl-input-locgovInvstAmt", null);
		SBUxMethod.set("dtl-input-etcInvstAmt", null);
		SBUxMethod.set("dtl-input-rprsvFlnm", null);
		SBUxMethod.set("dtl-input-rprsvTelno", null);
		SBUxMethod.set("dtl-input-fxno", null);
		SBUxMethod.set("dtl-input-aprv", null);

		//SBUxMethod.set("dtl-input-aplyTrgtSe", null);
		SBUxMethod.set("dtl-input-isoFundAplyAmt", null);

		SBUxMethod.set("dtl-input-frmerInvstAmtRt", null);
	}

	// Grid Row 추가 및 삭제 기능
	function fn_procUoRow(gubun, grid, nRow, nCol) {
		//console.log("===========fn_procUoRow===========");
		if (grid === "grdInvShipOgnReqMng01") {
			let vo = grdInvShipOgnReqMng01.getRowData(nRow);
			var delMsg = '"' + vo.corpNm + '" 과의 조직관계를 삭제 하시겠습니까?';
			if(confirm(delMsg)){
				var reDelMsg = '"' + vo.corpNm + '" 과의 조직관계를 삭제 하시겠습니까?';
				if(confirm(reDelMsg)){
				//console.log(vo);
				fn_deleteRsrc(vo,nRow);
				}
			}

		}
	}

	/**************************품목 그리드**********************************/

	//품목입력 그리드 변수
	var jsonGpcList = []; // 그리드의 참조 데이터 주소 선언
	var grdGpcList;

	//품목입력 그리드
	/* Grid 화면 그리기 기능*/
	const fn_gpcListGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGpcList';
		SBGridProperties.id = 'grdGpcList';
		SBGridProperties.jsonref = 'jsonGpcList';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.rowheader = ['seq', 'update'];//맨앞열 추가 행갯수 , 업데이트 여부
		SBGridProperties.rowheadercaption = {seq: 'No'};//seq 해더 추가
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = true;//입력 활성화 true 1번클릭 false 더블클릭
		SBGridProperties.columns = [
			{caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'60px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				<c:if test="${loginVO.userType ne '02'}">
				let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
				if(corpDdlnSeCd != 'Y'){
					if(strValue== null || strValue == ""){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procItemRow(\"ADD\", \"grdGpcList\", " + nRow + ", " + nCol + ")'>추가</button>";
					}else{
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procItemRow(\"DEL\", \"grdGpcList\", " + nRow + ")'>삭제</button>";
					}
				}
				</c:if>
				return "";
			}},

			{caption: ["전문/육성 구분"], 	ref: 'sttgUpbrItemSe',   type:'combo',  width:'150px',	style:'text-align:center',
				typeinfo : {ref:'jsonGrdSttgUpbrItemSe', label:'label', value:'value', displayui : true, itemcount : 5, position : 'bottom'},
				validate : fn_Validate},
			{caption: ["품목선택"], 				ref: 'sel',   	type:'button', width:'60px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
				let delYnCol = objGrid.getColRef('delYn');
				let delYnVal = objGrid.getCellData(nRow,delYnCol);
				if(corpDdlnSeCd != 'Y'){
					if(delYnVal == 'N'){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_openMaodalGpcSelect(" + nRow + ")'>선택</button>";
					}
				}
				return "";
			}},
			{caption: ["부류"], 		ref: 'clsfCd',   	type:'combo',  width:'150px',	style:'text-align:center',
				typeinfo : {ref:'jsonGrdClsfCd', label:'label', value:'value', displayui : true, itemcount : 5, position : 'bottom'}},
			{caption: ["평가부류"], 		ref: 'ctgryCd',   	type:'combo',  width:'150px',	style:'text-align:center',
				typeinfo : {ref:'jsonGrdCtgryCd', label:'label', value:'value', displayui : true, itemcount : 5, position : 'bottom'}},

			{caption: ["품목명"], 			ref: 'itemNm',   	type:'output',  width:'150px',	style:'text-align:center'},
			{caption: ["품목코드"], 		ref: 'itemCd',   	type:'output',  width:'150px',	style:'text-align:center'},
			{caption: ["비고"], 			ref: 'rmrk',   	type:'input',  width:'150px',	style:'text-align:center'},

			{caption: ["등록년도"], 	ref: 'yr',   		hidden : true},
			{caption: ["조직코드"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["조직구분"], 	ref: 'apoSe',   	hidden : true},
			{caption: ["사업자등록번호"], 	ref: 'brno',   		hidden : true},
			{caption: ["통합조직 사업자등록번호"], 	ref: 'uoBrno',   		hidden : true},
			/*
			{caption: ["분류명"], 		ref: 'ctgryNm',   	type:'output',  width:'150px',	style:'text-align:center'},
			{caption: ["분류코드"], 		ref: 'ctgryCd',   	hidden : true},
			*/
			{caption: ["상세내역"], 	ref: 'orgCtgryCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'orgSttgUpbrItemSe',   hidden : true},
		];

		grdGpcList = _SBGrid.create(SBGridProperties);

		grdGpcList.bind('dblclick','gridClick');
	}

	//전문/육성 품목 선택
	function fn_Validate(objGrid, nRow, nCol, strValue) {
		//console.log("fn_Validate");
		let aprv = SBUxMethod.get("dtl-input-aprv");
		if(strValue != ""){
			if(aprv == "2"){
				if(strValue == "2"){
					alert("육성형 조직은 전문품목만 선택가능합니다.");
					objGrid.setCellData(nRow,nCol,"1",true);
					return "1";
				}
			}
		}

		let clsfCdCol = objGrid.getColRef('clsfCd');//부류
		let ctgryCdCol = objGrid.getColRef('ctgryCd');//평가부류
		let itemCdCol = objGrid.getColRef('itemCd');//품목코드
		let itemNmCol = objGrid.getColRef('itemNm');//품목명
		let uoBrnoCol = objGrid.getColRef('uoBrno');//통합조직 사업자등록번호

		let orgStr = objGrid.getCellData(nRow,nCol);
		//값 초기화
		if(strValue != orgStr){
			objGrid.setCellData(nRow,clsfCdCol,null,true);
			objGrid.setCellData(nRow,ctgryCdCol,null,true);
			objGrid.setCellData(nRow,itemCdCol,null,true);
			objGrid.setCellData(nRow,itemNmCol,null,true);
			objGrid.setCellData(nRow,uoBrnoCol,null,true);
		}
		//기타일떄 부류,평가부류 비활성화
		if(strValue == '3'){
			objGrid.setCellDisabled(nRow, clsfCdCol, nRow, clsfCdCol, false);
			//20241220 기존 기타 선택시 평가부류 선택 불가 처리에서 다시 선택가능하게 변경 요청
			objGrid.setCellDisabled(nRow, ctgryCdCol, nRow, ctgryCdCol, false);
			//objGrid.setCellStyle('background-color', nRow, ctgryCdCol, nRow, ctgryCdCol, 'lightgray');
			//objGrid.setCellData(nRow,clsfCdCol,0);
			//objGrid.setCellData(nRow,ctgryCdCol,0);
		}else{
			objGrid.setCellDisabled(nRow, clsfCdCol, nRow, clsfCdCol, true);
			objGrid.setCellDisabled(nRow, ctgryCdCol, nRow, ctgryCdCol, true);
			//objGrid.setCellStyle('background-color', nRow, ctgryCdCol, nRow, ctgryCdCol, 'white');
		}
		return strValue;
	}

	/* 품목리스트 조회 기능*/
	const fn_selectGpcList = async function(){
		//console.log("===========fn_selectGpcList===========");
		let apoCd = SBUxMethod.get('dtl-input-apoCd')//
		let yr = SBUxMethod.get('dtl-input-yr')//
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		//없는경우 품목그리드 초기화
		//apoCd 가 없는 경우가 없어야 한데 현재는 있어서 추가 함
		if(gfn_isEmpty(apoCd)){
			jsonGpcList.length = 0;
			grdGpcList.rebuild();
			return;
		}
		let postJsonPromise = gfn_postJSON("/pd/aom/selectGpcList.do", {
			// apoCd : apoCd
			apoSe : '2'
			,brno : SBUxMethod.get('dtl-input-brno')//
			,crno : SBUxMethod.get('dtl-input-crno')//
			//,corpNm : SBUxMethod.get('dtl-input-corpNm')//
			,yr : yr
		});
		let data = await postJsonPromise;
		try{
			jsonGpcList.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let GpcListVO = {
						 yr: item.yr
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,ctgryCd: item.ctgryCd
						,ctgryNm: item.ctgryNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm
						,rmrk: item.rmrk
						,delYn: item.delYn
						,apoCd: item.apoCd
						,apoSe: item.apoSe
						,brno: item.brno

						,clsfCd: item.clsfCd

						,uoBrno: item.uoBrno
				}
				jsonGpcList.push(GpcListVO);
			});

			grdGpcList.rebuild();

			let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
			if(corpDdlnSeCd != 'Y'){
				//비어 있는 마지막 줄 추가용도
				grdGpcList.addRow();
			}
			var nCol =grdGpcList.getColRef('sttgUpbrItemSe');
			window.scrollTo(0, 0);

			let rmrkCol = grdGpcList.getColRef('rmrk');//부류
			let clsfCdCol = grdGpcList.getColRef('clsfCd');//부류
			let ctgryCdCol = grdGpcList.getColRef('ctgryCd');//평가부류
			let sttgUpbrItemSeCol = grdGpcList.getColRef('sttgUpbrItemSe');//전문/육성 구분

			let grdData = grdGpcList.getGridDataAll();
			for (var i = 1; i <= grdData.length; i++) {
				let rowData = grdGpcList.getRowData(i);
				if(rowData.delYn != 'N'){
					//추가 row 비활성화
					grdGpcList.setCellDisabled(i, sttgUpbrItemSeCol, i, ctgryCdCol, true);
					grdGpcList.setCellStyle('background-color', i, sttgUpbrItemSeCol, i, rmrkCol, 'lightgray');
				}else{
					//기타일떄 부류,평가부류 비활성화
					if(rowData.sttgUpbrItemSe == '3'){
						grdGpcList.setCellDisabled(i, clsfCdCol, i, clsfCdCol, false);
						grdGpcList.setCellDisabled(i, ctgryCdCol, i, ctgryCdCol, false);//20241220 기타인경우 평가부류 다시 활성화 요청
						//grdGpcList.setCellStyle('background-color', i, ctgryCdCol, i, ctgryCdCol, 'lightgray');
						//grdGpcList.setCellData(i,clsfCdCol,0);
						//grdGpcList.setCellData(i,ctgryCdCol,0);
					}else{
						/* 출자출하조직 품목 전문/육성 품목의 경우 통합조직의 부류, 평가부류를 따라감 */
						grdGpcList.setCellDisabled(i, clsfCdCol, i, clsfCdCol, true);
						grdGpcList.setCellDisabled(i, ctgryCdCol, i, ctgryCdCol, true);
						//grdGpcList.setCellStyle('background-color', i, ctgryCdCol, i, ctgryCdCol, 'white');
					}

					//법인체 마감인 경우
					if(corpDdlnSeCd == 'Y'){
						grdGpcList.setCellDisabled(i, sttgUpbrItemSeCol, i, sttgUpbrItemSeCol, true);
						grdGpcList.setCellDisabled(i, clsfCdCol, i, clsfCdCol, true);
						grdGpcList.setCellDisabled(i, ctgryCdCol, i, ctgryCdCol, true);
					}
				}
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	// Grid Row 추가 및 삭제 기능
	function fn_procItemRow(gubun, grid, nRow, nCol) {
		if (gubun === "ADD") {
			if (grid === "grdGpcList") {
				grdGpcList.setCellData(nRow, nCol, "N", true);
				grdGpcList.addRow(true);

				let rmrkCol = grdGpcList.getColRef('rmrk');//부류
				let ctgryCdCol = grdGpcList.getColRef('ctgryCd');//평가부류
				let sttgUpbrItemSeCol = grdGpcList.getColRef('sttgUpbrItemSe');//전문/육성 구분
				//기존 row 활성화
				grdGpcList.setCellDisabled(nRow, sttgUpbrItemSeCol, nRow, ctgryCdCol, false);
				grdGpcList.setCellStyle('background-color', nRow, sttgUpbrItemSeCol, nRow, rmrkCol, 'white');
				//추가 row 비활성화
				grdGpcList.setCellDisabled(nRow+1, sttgUpbrItemSeCol, nRow+1, ctgryCdCol, true);
				grdGpcList.setCellStyle('background-color', nRow+1, sttgUpbrItemSeCol, nRow+1, rmrkCol, 'lightgray');
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdGpcList") {
				if(grdGpcList.getRowStatus(nRow) == 0 || grdGpcList.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var vo = grdGpcList.getRowData(nRow);
						fn_deleteItem(vo);
						grdGpcList.deleteRow(nRow);
					}
				}else{
					grdGpcList.deleteRow(nRow);
				}
			}
		}
	}
	//품목 리스트 삭제
	async function fn_deleteItem(vo){
		let postJsonPromise = gfn_postJSON("/pd/aom/deleteGpc.do", vo);
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

	//품목 리스트 저장
	const fn_gpcListMultiSave = async function (){
		//console.log("******************fn_GpcListMultiSave**********************************");

		let gridData = grdGpcList.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdGpcList.getRowData(i);
			let rowSts = grdGpcList.getRowStatus(i);

			let delYn = rowData.delYn;

			rowData.uoCd = apoCd;

			if(delYn == 'N'){
				if (gfn_isEmpty(uoBrno)) {
					alert("품목을 선택해주세요");
					return;
				}

				//모든데이터 저장 처리
				rowData.rowSts = "I";
				gpcList.push(rowData);
				/*
				if (rowSts === 1){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else {
					continue;
				}
				*/
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveGpcList.do", saveList);
		let data = await postJsonPromise;
		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
				fn_search();
			</c:if>
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

	function fn_GridPop(gubun, grid, nRow, nCol) {
		//console.log("================fn_GridPop================");
		if (gubun === "pop") {
			if (grid === "grdGpcList") {
				//부른 선택된 그리드 셀의 값을 N 으로 변경
				grdGpcList.setCellData(nRow, nCol, "N", true);
			}
		}
	}

	//그리드 클릭이벤트
	function gridClick(){
		//법인체 마감여부 확인
		let corpDdlnSeCd = SBUxMethod.get('dtl-input-corpDdlnSeCd');//법인체마감 여부
		if(corpDdlnSeCd == 'Y'){
			return;
		}

		//console.log("================gridClick================");
		//grdGpcList 그리드 객체
		let selGridRow = grdGpcList.getRow();
		let selGridCol = grdGpcList.getCol();


		let delYnCol = grdGpcList.getColRef('delYn');
		let delYnValue = grdGpcList.getCellData(selGridRow,delYnCol);

		//임력할 데이터 인지 확인
		//추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
		//fn_procRow 의 ADD 확인
		if(delYnValue != 'N'){
			return;
		}

		//분류,품목,
		//let ctgryNmCol = grdGpcList.getColRef('ctgryNm');
		let itemNmCol = grdGpcList.getColRef('itemNm');

		if(selGridRow == '-1'){
			return;
		} else {
			if (selGridCol == itemNmCol){
				//팝업창 오픈
				//팝업창 id : modal-gpcList
				//popGpcSelect.init(fn_setGridItem);
				//SBUxMethod.openModal('modal-gpcList');
				fn_openMaodalGpcSelect(selGridRow);
			}
		}
	}

	//품목선택 팝업 버튼
	function fn_openMaodalGpcSelect(nRow){
		//법인체 마감여부 확인
		let corpDdlnSeCd = SBUxMethod.get('dtl-input-corpDdlnSeCd');//법인체마감 여부
		if(corpDdlnSeCd == 'Y'){
			return;
		}

		grdGpcList.setRow(nRow);
		let delYnCol = grdGpcList.getColRef('delYn');
		let delYnValue = grdGpcList.getCellData(nRow,delYnCol);
		if(delYnValue == '' || delYnValue == null){
			return;
		}
		let rowData = grdGpcList.getRowData(nRow);
		let selType = 'Y';

		if(gfn_isEmpty(rowData.sttgUpbrItemSe)){
			alert('전문/육성 구분을 선택해주세요');
			return;
		}
		//기타품목인 경우 모든 품목 사용 가능
		if(rowData.sttgUpbrItemSe == '3'){
			selType = 'N';
		}
		let brno = SBUxMethod.get('dtl-input-brno');//
		let yr = SBUxMethod.get('dtl-input-yr');//
		if(gfn_isEmpty(brno)){return}
		popGpcSelect.init(fn_setGridItem , selType , brno , yr);
		SBUxMethod.openModal('modal-gpcList');
	}


	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		//console.log("================fn_setGridItem================");
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값
			let selGridRow = grdGpcList.getRow();

			let colRefIdx1 = grdGpcList.getColRef("ctgryCd");//분류코드 인덱스
			//let colRefIdx2 = grdGpcList.getColRef("ctgryNm");//분류명 인덱스
			let colRefIdx3 = grdGpcList.getColRef("itemCd");//품목코드 인덱스
			let colRefIdx4 = grdGpcList.getColRef("itemNm");//품목명 인덱스
			let colRefIdx5 = grdGpcList.getColRef("rmrk");//기타 인덱스
			let colRefIdx6 = grdGpcList.getColRef("clsfCd");//신규부류 인덱스
			let colRefIdx7 = grdGpcList.getColRef("sttgUpbrItemSe");//전문육성 구분 인덱스
			let colRefIdx8 = grdGpcList.getColRef("uoBrno");//통합조직 사업자번호 인덱스

			let gridData = grdGpcList.getGridDataAll();
			for(var i=1; i<=gridData.length; i++ ){
				let orgRowData = grdGpcList.getRowData(i);
				if ($.trim(rowData.itemCd) === $.trim(orgRowData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}
			let selRowData = grdGpcList.getRowData(selGridRow);
			let sttgUpbrItemSe = selRowData.sttgUpbrItemSe;

			//그리드 값 세팅
			if(sttgUpbrItemSe != '3'){
				//sttgUpbrItemSe 해당 값이 변경될떄 초기화 로직이 있어 먼저 배치
				grdGpcList.setCellData(selGridRow,colRefIdx7,rowData.sttgUpbrItemSe,true);

				grdGpcList.setCellData(selGridRow,colRefIdx1,rowData.ctgryCd,true);
				grdGpcList.setCellData(selGridRow,colRefIdx6,rowData.clsfCd,true);
				grdGpcList.setCellData(selGridRow,colRefIdx8,rowData.brno,true);
			}
			grdGpcList.setCellData(selGridRow,colRefIdx3,rowData.itemCd,true);
			grdGpcList.setCellData(selGridRow,colRefIdx4,rowData.itemNm,true);
			grdGpcList.setCellData(selGridRow,colRefIdx5,rowData.rmrk,true);

			let grdStatus = grdGpcList.getRowStatus(selGridRow);
			if(grdStatus != '1'){
				grdGpcList.setRowStatus(selGridRow,'update');
			}
		}
	}

	/* 20241022 신청관리 출자출하조직 신청 통합조직 선택 추가 */
	var jsonUoList = []; // 그리드의 참조 데이터 주소 선언
	var grdUoList; //그리드 객체

	// TB_EV_APO_UO_CD 테이블
	/* Grid 화면 그리기 기능*/
	const fn_uoListGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdUoList';
		SBGridProperties.id = 'grdUoList';
		SBGridProperties.jsonref = 'jsonUoList';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
				if(corpDdlnSeCd == 'Y'){
					return "";
				}
				if(strValue== null || strValue == ""){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_uoGridAdd(\"ADD\", \"grdUoList\", " + nRow + ", " + nCol + ")'>추가</button>";
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_uoGridAdd(\"DEL\", \"grdUoList\", " + nRow + ")'>삭제</button>";
				}
			}},
			{caption: ["조직선택"], 			ref: 'sel',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
				if(corpDdlnSeCd == 'Y'){
					return "";
				}
				let delYn = objRowData.delYn;
				if(delYn != 'N'){
					return "";
				}
				return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_openMaodalSelect(" + nRow + ")'>선택</button>";
			}},
			{caption: ["통합조직코드"], 		ref: 'uoApoCd',		hidden : true},
			{caption: ["통합조직명"], 			ref: 'uoCorpNm',	type:'output',  width:'400px',    style:'text-align:center'},
			{caption: ["통합조직 사업자번호"], 	ref: 'uoBrno',		type:'output',  width:'400px',    style:'text-align:center'},
			{caption: ["비고"], 		ref: 'rmrk',	type:'output',     style:'text-align:center'},

			{caption: ["상세내역"], 	ref: 'uoCrno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'isoApoCd',	hidden : true}

		];

		grdUoList = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdUoList.bind('click','gridUoListClick');
	}

	/* Grid Row 추가 및 삭제 기능*/
	function fn_uoGridAdd(gubun, grid, nRow, nCol) {
		//법인체 마감여부 확인
		let corpDdlnSeCd = SBUxMethod.get('dtl-input-corpDdlnSeCd');//법인체마감 여부
		if(corpDdlnSeCd == 'Y'){
			return;
		}

		if (gubun === "ADD") {
			if (grid === "grdUoList") {
				grdUoList.setCellData(nRow, nCol, "N", true);
				grdUoList.addRow(true);
				let rmrkCol = grdUoList.getColRef('rmrk');
				let selCol = grdUoList.getColRef('sel');
				grdUoList.setCellStyle('background-color', nRow, selCol, nRow, rmrkCol, 'white');
				grdUoList.setCellStyle('background-color', nRow+1, selCol, nRow+1, rmrkCol, 'lightgray');
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdUoList") {
				if(grdUoList.getRowStatus(nRow) == 0 || grdUoList.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var uoVO = grdUoList.getRowData(nRow);
						fn_deleteUo(uoVO);
						grdUoList.deleteRow(nRow);
					}
				}else{
					grdUoList.deleteRow(nRow);
				}
			}
		}
	}

	async function fn_deleteUo(uoVO){
		let postJsonPromise = gfn_postJSON("/pd/bsm/deleteUo.do", uoVO);
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

	//그리드 클릭이벤트
	function gridUoListClick(){
		//법인체 마감여부 확인
		let corpDdlnSeCd = SBUxMethod.get('dtl-input-corpDdlnSeCd');//법인체마감 여부
		if(corpDdlnSeCd == 'Y'){
			return;
		}

		//grdPrdcrCrclOgnReqClsMng 그리드 객체
		let selGridUoListRow = grdUoList.getRow();
		let selGridUoListCol = grdUoList.getCol();

		let delYnCol = grdUoList.getColRef('delYn');
		let uoBrnoCol = grdUoList.getColRef('uoBrno');
		let delYnValue = grdUoList.getCellData(selGridUoListRow,delYnCol);
		let uoBrnoValue = grdUoList.getCellData(selGridUoListRow,uoBrnoCol);

		//입력할 데이터 인지 확인
		//추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
		//fn_procRow 의 ADD 확인
		if(delYnValue != 'N'){
			return;
		}
		if(!gfn_isEmpty(uoBrnoValue)){
			return;
		}

		//uoCorpNm 법인체명 uoBrno 사업자번호
		let uoCorpNmCol = grdUoList.getColRef('uoCorpNm');
		if(selGridUoListRow == '-1'){
			return;
		} else {
			//선택한 데이터가 통합조직명,통합조직 사업자번호 일떄
			if (selGridUoListCol == uoCorpNmCol || selGridUoListCol == uoBrnoCol){
				//통합조직 선택 세팅
				//통합조직 팝업 객체 popAplyBrno
				let yr = SBUxMethod.get('dtl-input-yr');
				popAplyBrno.init(fn_setGridMngmstInfoId , yr);
				//팝업창 오픈
				//통합조직 팝업창 id : modal-aplyBrno
				SBUxMethod.openModal('modal-aplyBrno');
			}else{
				return;
			}
		}
	}

	function fn_openMaodalSelect(nRow){
		let delYnCol = grdUoList.getColRef('delYn');
		let delYnValue = grdUoList.getCellData(nRow,delYnCol);
		if(delYnValue == '' || delYnValue == null){
			return
		}
		grdUoList.setRow(nRow);
		let yr = SBUxMethod.get('dtl-input-yr');
		popAplyBrno.init(fn_setGridMngmstInfoId , yr);
		SBUxMethod.openModal('modal-aplyBrno');
	}

	// 그리드의 통합조직선택 선택 팝업 콜백 함수
	const fn_setGridMngmstInfoId = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridUoListRow 선택된 행 값
			//getColRef(ref) ref의 인덱스 값 가져오기

			let selGridUoListRow = grdUoList.getRow();

			let colRefIdx1 = grdUoList.getColRef('uoCorpNm');//통합조직 인덱스
			let colRefIdx2 = grdUoList.getColRef('uoBrno');//통합조직 코드 인덱스
			let colRefIdx3 = grdUoList.getColRef('uoApoCd');//통합조직 코드 인덱스

			let gridData = grdUoList.getGridDataAll();
			for(var i=1; i<=gridData.length; i++ ){
				let uoData = grdUoList.getRowData(i);
				if ($.trim(rowData.apoCd) === $.trim(uoData.uoApoCd)){
					gfn_comAlert("E0000", "동일한 통합조직이 있습니다.");
					return false;
				}
			}
			//그리드 값 세팅
			grdUoList.setCellData(selGridUoListRow,colRefIdx1,rowData.corpNm,true);
			grdUoList.setCellData(selGridUoListRow,colRefIdx2,rowData.brno,true);
			grdUoList.setCellData(selGridUoListRow,colRefIdx3,rowData.apoCd,true);

			let grdStatus = grdUoList.getRowStatus(selGridUoListRow);
			if(grdStatus != '1'){
				grdUoList.setRowStatus(selGridUoListRow,'update');
			}
			fn_saveUoList();
		}
	}

	/* 상위 통합조직 리스트 조회 */
	const fn_selectUoList = async function(){
		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let brno = SBUxMethod.get('dtl-input-brno');

		if (gfn_isEmpty(apoCd)) {
			return;
		}
		if (gfn_isEmpty(brno)) {
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			apoCd : apoCd
			,brno : brno
		});
		let data = await postJsonPromise;

		try{
			jsonUoList.length = 0;
			data.resultList.forEach((item, index) => {
				let uoListVO = {
						uoApoCd		: item.uoApoCd
						,uoCorpNm	: item.uoCorpNm
						,uoBrno		: item.uoBrno
						,uoCrno		: item.uoCrno
						,isoApoCd	: item.isoApoCd
						,delYn		: item.delYn
				}
				jsonUoList.push(uoListVO);
			});
			grdUoList.rebuild();

			//비어 있는 마지막 줄 추가용도
			let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
			if(corpDdlnSeCd != 'Y'){
				grdUoList.addRow();
			}

			let rmrkCol = grdUoList.getColRef('rmrk');
			let selCol = grdUoList.getColRef('sel');

			let grdData = grdUoList.getGridDataAll();
			let captionRow = grdUoList.getFixedRows();
			for (var i = captionRow; i < grdData.length + captionRow; i++) {
				let rowData = grdUoList.getRowData(i);
				if(rowData.delYn != 'N'){
					grdUoList.setCellStyle('background-color', i, selCol, i, rmrkCol, 'lightgray');
				}
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출자출하조직이 속한 통합조직 리스트 업데이트
	const fn_saveUoList = async function (){
		let gridData = grdUoList.getGridDataAll();
		let saveList = [];

		let isoBrno = SBUxMethod.get('dtl-input-brno')//
		let isoCorpNm = SBUxMethod.get('dtl-input-corpNm')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdUoList.getRowData(i);
			let rowSts = grdUoList.getRowStatus(i);
			let uoBrno = rowData.uoBrno;

			let delYn = rowData.delYn;
			rowData.isoBrno = isoBrno;
			rowData.isoCorpNm = isoCorpNm;

			if(delYn == 'N'){
				if (gfn_isEmpty(uoBrno)) {
					alert("통합조직을 선택해주세요");
					return;
				}
				if (rowSts === 1){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");	//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveUoList.do", saveList);
		let data = await postJsonPromise;
		try {
			if (_.isEqual("S", data.resultStatus)) {
				//gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
				fn_search();
			</c:if>
			<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2' || loginVO.mbrTypeCd eq '1'}">
				fn_dtlSearch();
			</c:if>
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

	async function fn_deleteAply(){
		var delMsg = "기존 신청된 정보를 삭제 하시겠습니까?";
		if(!confirm(delMsg)){return;}

		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/aom/deletePrdcrCrclOgnReqMng.do", {
			brno : brno
			, yr : yr
		});

		let data = await postJsonPromise;
		try{

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//자금 신청액 최소 입력 단위 100,000(천원) 1억부터 하위 단위 절삭처리
	function fn_fundAplyAmt(){
		if(!gfn_isEmpty(SBUxMethod.get('dtl-input-isoFundAplyAmt'))){
			isoFundAplyAmt = parseFloat(SBUxMethod.get('dtl-input-isoFundAplyAmt'));
			isoFundAplyAmt = Math.floor(isoFundAplyAmt / 100000) * 100000;
			SBUxMethod.set('dtl-input-isoFundAplyAmt',isoFundAplyAmt);
		}
	}

	/****************************************************************/
	/* 로우데이터 요청 */
	var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd = async function() {
		let yr = SBUxMethod.get('srch-input-yr');
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get('dtl-input-yr');
		}

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
			{caption: ["신청구분"],					ref: 'aprv',				type:'output',	width:'70px',    style:'text-align:center'},
			{caption: ["법인체마감"],				ref: 'corpDdlnSeCd',		type:'output',	width:'70px',    style:'text-align:center'},
			{caption: ["통합조직사업자번호"],			ref: 'uoBrno',				type:'output',  width:'130px',    style:'text-align:center'},
			{caption: ["통합조직법인번호"],			ref: 'uoCrno',				type:'output',  width:'130px',    style:'text-align:center'},
			{caption: ["통합조직명"],				ref: 'uoCorpNm',			type:'output',  width:'220px',    style:'text-align:center'},
			{caption: ["주소"],					ref: 'addr',				type:'output',  width:'330px',    style:'text-align:center'},
			{caption: ["출자출하조직사업자번호"],		ref: 'brno',				type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["출자출하조직법인번호"],		ref: 'crno',				type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["출자출하조직명"],				ref: 'corpNm',				type:'output',  width:'90px',    style:'text-align:center'},
			{caption: ["복수출자출하 여부"],			ref: 'uoBrnoCnt',			type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["법인구분"],					ref: 'corpSeCd',			type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["법인형태"],					ref: 'corpDtlSeCd',			type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["설립연도"],					ref: 'corpFndnDay',			type:'output',  width:'130px',    style:'text-align:center'},
			{caption: ["출자자수"],					ref: 'invstNope',			type:'output',  width:'90px',    style:'text-align:center'},
			{caption: ["출자자 중 농업인수"],			ref: 'invstExpndFrmerNope', type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["출자금"],					ref: 'invstAmt',			type:'output',  width:'90px',    style:'text-align:center'},
			{caption: ["농업인 출자금 지분"],			ref: 'frmerInvstAmt',		type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["생산자단체 출자금 지분"],		ref: 'prdcrGrpInvstAmt',	type:'output',  width:'140px',    style:'text-align:center'},
			{caption: ["지자체 출자금지분"],			ref: 'locgovInvstAmt',		type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["기타 출자금지분"],			ref: 'etcInvstAmt',			type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["농업인출자지분율"],			ref: 'frmerInvstAmtRt',		type:'output',  width:'120px',    style:'text-align:center'},
			{caption: ["출자출하조직 "+yr+"년 자금신청액"],	ref: 'isoFundAplyAmt',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["작성자 성명"],				ref: 'picFlnm',				type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["작성자 전화번호"],			ref: 'picTelno',			type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["작성자 휴대번호"],			ref: 'picMoblno',			type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["작성자 이메일주소"],			ref: 'picEml',				type:'output',  width:'210px',    style:'text-align:center'},
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

		let postJsonPromise = gfn_postJSON("/pd/aom/hiddenGrdIsoSelectList.do", {
			yr : yr
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						aprv:						item.aprv
						, corpDdlnSeCd:				item.corpDdlnSeCd
						, uoBrno:					item.uoBrno
						, uoCrno:					item.uoCrno
						, uoCorpNm:					item.uoCorpNm
						, addr:						item.addr
						, brno:						item.brno
						, crno:						item.crno
						, corpNm:					item.corpNm
						, uoBrnoCnt:				item.uoBrnoCnt
						, corpSeCd:					item.corpSeCd
						, corpDtlSeCd:				item.corpDtlSeCd
						, corpFndnDay:				item.corpFndnDay
						, invstNope:				Number(item.invstNope)
						, invstExpndFrmerNope:		Number(item.invstExpndFrmerNope)
						, invstAmt:					Number(item.invstAmt)
						, frmerInvstAmt:			Number(item.frmerInvstAmt)
						, prdcrGrpInvstAmt:			Number(item.prdcrGrpInvstAmt)
						, locgovInvstAmt:			Number(item.locgovInvstAmt)
						, etcInvstAmt:				Number(item.etcInvstAmt)
						, frmerInvstAmtRt:			Number(item.frmerInvstAmtRt)
						, isoFundAplyAmt:			Number(item.isoFundAplyAmt)
						, picFlnm:					item.picFlnm
						, picTelno:					item.picTelno
						, picMoblno:				item.picMoblno
						, picEml:					item.picEml
						, picEml:					item.picEml
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

		let fileName = formattedDate + "_신청관리_출자출하조직_로우데이터";

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
