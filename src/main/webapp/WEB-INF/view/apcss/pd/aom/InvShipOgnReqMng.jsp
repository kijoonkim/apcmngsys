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
					<!-- 출자출하조직 등록 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					<!--
					<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
					 -->
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<!--
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					-->
				</c:if>
				<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
					<sbux-button id="btnSaveFclt01" name="btnSaveFclt01" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
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
									class="form-control input-sm"
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
									class="form-control input-sm"
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
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 리스트</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdInvShipOgnReqMng01" style="height:250px; width: 100%;"></div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
			<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType eq '21'}">
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
							<!--
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="srch-input-crno01"
									name="srch-input-crno01"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							 -->
							<td colspan="4" class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
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
			</c:if>
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
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								 -->
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
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								 -->
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
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-corpFndnDay"
									name="dtl-input-corpFndnDay"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								 -->
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
				<!-- <br>
				<div class="descripton_wrap desc" style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
				<p style="font-size:14px; color: #3c6dbc;">▶산지유통활성화 지원 자금 신청현황</p>
				기존 보유금액 등을 감안하여 신규(또는 추가)로 필요한 금액 입력.
				</div>
				<br> -->

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
							<th colspan="3" scope="row" class="th_bg">2024 자금 신청액(천원)</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-isoFundAplyAmt"
									name="dtl-input-isoFundAplyAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoUnmask': true , 'autoGroup': 3, 'groupSeparator': ','}"
									unmask-phone-dashes = "true"
									permit-keycodes-set = "num"
								></sbux-input>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<!-- <br>
				<div class="descripton_wrap desc" style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
				<p style="font-size:14px; color: #3c6dbc;">▶신청대상구분</p>
				*신청대상구분은 aT본사에서만 이용하는 란입니다.
				</div>
				<br> -->

				<!-- <div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶신청대상구분</span>

								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>

							</li>
						</ul>
				</div> -->

				<!-- <table class="table table-bordered tbl_fixed" style="border: none">
					<caption>신청대상구분</caption>
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
							<th colspan="3" scope="row" class="th_bg">신청대상구분</th>
							<td colspan="4" class="td_input">
								<sbux-select
									id="dtl-input-aplyTrgtSe"
									name="dtl-input-aplyTrgtSe"
									uitype="single"
									jsondata-ref="jsonComAplyTrgtSe"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
									readonly
								></sbux-select>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
					</tbody>
				</table> -->
				<div style="margin-left: auto;">
					<br>
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
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
		fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		//통합조직인 경우
		<c:if test="${loginVO.userType eq '21'}">
		console.log('통합조직인');
		fn_dtlSearch();
		fn_dtlSearch01();
		</c:if>
		//출하조직인 경우
		<c:if test="${loginVO.userType eq '22'}">
		console.log('출하조직인');
		fn_dtlSearch02();
		</c:if>
	</c:if>

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
			gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'), //시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('dtl-input-corpSeCd', 		jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('dtl-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE') //신청대상구분

		]);
		console.log("============fn_initSBSelect=====1=======");
	}



	var jsonInvShipOgnReqMng = []; // 그리드의 참조 데이터 주소 선언
	var grdInvShipOgnReqMng;

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		fn_fcltMngCreateGrid();
		fn_fcltMngCreateGrid01();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		//통합조직인 경우
		<c:if test="${loginVO.userType eq '21'}">
		fn_fcltMngCreateGrid01();
		</c:if>
	</c:if>
	}

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
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'bb',   	type:'output',  width:'220px',    style:'text-align:center'}
	    ];

	    grdInvShipOgnReqMng = _SBGrid.create(SBGridProperties);

		//grdInvShipOgnReqMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	   	grdInvShipOgnReqMng.bind('click','fn_view');
	   	grdInvShipOgnReqMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	var jsonInvShipOgnReqMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdInvShipOgnReqMng01;

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

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
	    		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdInvShipOgnReqMng01\", " + nRow + ")'>삭제</button>";
	        }},
	    	//{caption: ["순번"], 				ref: 'aa',   	type:'output',  width:'50px',    style:'text-align:center'},
	    	{caption: ["업체명"], 			ref: 'corpNm',   	type:'output',  width:'220px',    style:'text-align:center'},
	    	{caption: ["대표자명"], 			ref: 'rprsvFlnm',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 			ref: 'brno',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["전화번호"], 			ref: 'rprsvTelno',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["법인형태"], 			ref: 'corpDtlSeCd',  	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["출자자수"], 			ref: 'invstNope',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["출자자 중 농업인수"], 	ref: 'invstExpndFrmerNope',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["농업인 출자 지분율"], 	ref: 'frmerInvstAmtRt',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["2024 자금신청액"], 	ref: 'isoFundAplyAmt',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["비고"], 				ref: 'rmrk',   	type:'output',  width:'120px',    style:'text-align:center'},

	        //{caption: ["상세내역"], 	ref: 'isoFundAplyAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'aplyTrgtSe',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   				hidden : true},
	        {caption: ["상세내역"], 	ref: 'uoBrno',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',   				hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpSeCd',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpFndnDay',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstAmt',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'frmerInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrGrpInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'locgovInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'etcInvstAmt',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'fxno',   				hidden : true}
	    ];

	    grdInvShipOgnReqMng01 = _SBGrid.create(SBGridProperties);

		//grdInvShipOgnReqMng01.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdInvShipOgnReqMng01.bind('click','fn_view01');

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

	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){

		let yr = SBUxMethod.get("srch-input-year");//
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

    	let postJsonPromise01 = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		cmptnInst : cmptnInst
    		,ctpv : ctpv
    		,yr : yr

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,brno : brno
    		,corpNm : corpNm
    		,apoSe : '1'

    		//페이징
    		,pagingYn : 'Y'
    		,currentPageNo : pageNo
     		,recordCountPerPage : pageSize
		});

        let data = await postJsonPromise01 ;
        try{
        	jsonInvShipOgnReqMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoSe: item.apoSe
						,apoCd: item.apoCd
						,ctpv: item.ctpv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,brno: item.brno
						,aprv: item.aprv
						,yr: item.yr
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
		console.log('============fn_dtlSearch=============');
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

    	let postJsonPromise01 = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    	//let postJsonPromise01 = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
    		brno : brno
		});

        let data = await postJsonPromise01 ;
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		console.log(item);
        		console.log(item.corpNm);
        		console.log(item.brno);
				SBUxMethod.set('dtl-input-apoCd01',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe01',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm01',gfn_nvl(item.corpNm))//법인명
				//SBUxMethod.set('dtl-input-crno01',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno01',gfn_nvl(item.brno))//사업자등록번호
			});

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	//출자출하조직 조회
	const fn_dtlSearch01 = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			uoBrno : brno
		});
	    let data = await postJsonPromise;
	    try{
	    	jsonInvShipOgnReqMng01.length = 0;
	    	console.log("data==="+data);
	    	data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoCd: item.apoCd
						,corpNm: item.corpNm
						,rprsvFlnm: item.rprsvFlnm
						,brno: item.brno
						,uoBrno: item.uoBrno
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


	//출자출하조직 조회
	const fn_dtlSearch02 = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			isoBrno : brno
		});
        let data = await postJsonPromise;
        try{
        	jsonInvShipOgnReqMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				SBUxMethod.set("dtl-input-apoCd", item.apoCd);
				SBUxMethod.set("dtl-input-crno", item.crno);
				SBUxMethod.set("dtl-input-brno", item.brno);
				SBUxMethod.set("dtl-input-corpNm", item.corpNm);
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
			});
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	/**
     * 저장 버튼
     */
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

    	//let apoCd = SBUxMethod.get("dtl-input-apoCd");

    	//필수값 체크
    	//fn_checkRequiredInput();
		/*
    	if (gfn_isEmpty(apoCd)) {
    		// 신규 등록
			return;
    	} else {
    		// 변경 저장
    	}
		*/
    	fn_subUpdate(confirm("저장 하시겠습니까?"));
    }

    const fn_checkRequiredInput = async function (){
    	//레드닷 처리한 필수값들 확인

    	var val = SBUxMethod.get("dtl-input-trgtYr");

    	if(true){
    		return false;
    	}

    	return true;
    }


    /**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
    const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

   	 	const postJsonPromise = gfn_postJSON("/pd/aom/insertPrdcrCrclOgnReqMng.do", {
   	 		apoCd: SBUxMethod.get('dtl-input-apoCd')//
   	 		,apoSe: SBUxMethod.get('dtl-input-apoSe')//
			,brno: SBUxMethod.get('dtl-input-brno')//
			,crno: SBUxMethod.get('dtl-input-crno')//
			,corpNm: SBUxMethod.get('dtl-input-corpNm')//
   	 		,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
			//,aplyTrgtSe: SBUxMethod.get('dtl-input-aplyTrgtSe')//
		});

        const data = await postJsonPromise;
        console.log("insert result", data);

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
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
		console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;
		var a = SBUxMethod.get('dtl-input-isoFundAplyAmt');

		var b = {
				apoCd: SBUxMethod.get('dtl-input-apoCd')//
	   	 		,apoSe: SBUxMethod.get('dtl-input-apoSe')//
				,brno: SBUxMethod.get('dtl-input-brno')//
				,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
				,uoCd: SBUxMethod.get('dtl-input-uoCd')//
				,crno: SBUxMethod.get('dtl-input-crno')//
				,corpNm: SBUxMethod.get('dtl-input-corpNm')//
	   	 		,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
				//,aplyTrgtSe: SBUxMethod.get('dtl-input-aplyTrgtSe')//
	  		};

		console.log(b);
		return false;

		const postJsonPromise = gfn_postJSON("/pd/aom/insertInvShipOgnReqMng.do", {
			apoCd: SBUxMethod.get('dtl-input-apoCd')//
   	 		,apoSe: SBUxMethod.get('dtl-input-apoSe')//
			,brno: SBUxMethod.get('dtl-input-brno')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,uoCd: SBUxMethod.get('dtl-input-uoCd')//
			,crno: SBUxMethod.get('dtl-input-crno')//
			,corpNm: SBUxMethod.get('dtl-input-corpNm')//
   	 		,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
			//,aplyTrgtSe: SBUxMethod.get('dtl-input-aplyTrgtSe')//
  		});

		const data = await postJsonPromise;
		console.log("update result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				fn_search();
			} else {
				//alert(data.resultMessage);
			}
		} catch(e) {

		}

  }



	//통합조직 리스트 그리드 클릭시 출자출하조직 리스트 조회 이벤트
	const fn_view = async function(){
		console.log("******************fn_view**********************************");
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
		console.log(rowData);

		SBUxMethod.set("dtl-input-uoCd", rowData.apoCd);
		SBUxMethod.set("dtl-input-uoBrno", rowData.brno);

		let uoBrno = rowData.brno
		let apoCd = rowData.apoCd

		let postJsonPromise = gfn_postJSON("/pd/aom/selectInvShipOgnReqMngList.do", {
			uoBrno : uoBrno
    		//,apoCd : apoCd

		});
        let data = await postJsonPromise;
        try{
        	jsonInvShipOgnReqMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let InvShipOgnReqMngVO = {
						apoCd: item.apoCd
						,uoBrno: uoBrno
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
				}
				jsonInvShipOgnReqMng01.push(InvShipOgnReqMngVO);
			});

        	grdInvShipOgnReqMng01.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	//grdInvShipOgnReqMng01.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

	//출자출하조직 상세 조회
	function fn_view01() {
		console.log("******************fn_view**********************************");

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
		console.log(rowData);

		SBUxMethod.set("dtl-input-apoCd", rowData.apoCd);
		SBUxMethod.set("dtl-input-crno", rowData.brno);
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

		//SBUxMethod.set("dtl-input-aplyTrgtSe", rowData.aplyTrgtSe);
		SBUxMethod.set("dtl-input-isoFundAplyAmt", rowData.isoFundAplyAmt);

		SBUxMethod.set("dtl-input-frmerInvstAmtRt", rowData.frmerInvstAmtRt);
    }

	const fn_clearForm01 = function() {

		SBUxMethod.set("dtl-input-apoCd", null);
		SBUxMethod.set("dtl-input-crno", null);
		SBUxMethod.set("dtl-input-brno", null);
		SBUxMethod.set("dtl-input-uoBrno", null);
		SBUxMethod.set("dtl-input-uoCd", null);
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

		//SBUxMethod.set("dtl-input-aplyTrgtSe", null);
		SBUxMethod.set("dtl-input-isoFundAplyAmt", null);

		SBUxMethod.set("dtl-input-frmerInvstAmtRt", null);
	}

	//신규
    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set('dtl-input-intyYn',null)//
    	SBUxMethod.set('dtl-input-uoNm',null)//
    	SBUxMethod.set('dtl-input-uoBrno',null)//
    	SBUxMethod.set('dtl-input-untyYr',null)//
    }

	//삭제
	//출자출하조직 리스트 삭제
	async function fn_deleteRsrc(InvShipOgnReqMngVO,nRow){
		let postJsonPromise = gfn_postJSON("/pd/aom/deleteInvShipOgnReqMng.do", InvShipOgnReqMngVO);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        		grdInvShipOgnReqMng01.deleteRow(nRow);
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

		SBUxMethod.set("dtl-input-apoCd", null);
		SBUxMethod.set("dtl-input-crno", null);
		SBUxMethod.set("dtl-input-brno", null);
		SBUxMethod.set("dtl-input-uoBrno", null);
		SBUxMethod.set("dtl-input-uoCd", null);
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

		//SBUxMethod.set("dtl-input-aplyTrgtSe", null);
		SBUxMethod.set("dtl-input-isoFundAplyAmt", null);

		SBUxMethod.set("dtl-input-frmerInvstAmtRt", null);
	}

	// Grid Row 추가 및 삭제 기능
    function fn_procRow(gubun, grid, nRow, nCol) {
        if (grid === "grdInvShipOgnReqMng01") {
        	var vo = grdInvShipOgnReqMng01.getRowData(nRow);
        	var delMsg = '"' + vo.corpNm + '" 과의 조직관계를 삭제 하시겠습니까?';
        	if(confirm(delMsg)){
        		var reDelMsg = '"' + vo.corpNm + '" 과의 조직관계를 삭제 하시겠습니까?';
        		if(confirm(reDelMsg)){
        		//console.log(vo);
        		fn_deleteRsrc(vo,nRow);
        		//grdInvShipOgnReqMng01.deleteRow(nRow);
        		}
        	}

        }
    }


</script>
</html>
