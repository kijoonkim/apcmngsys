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
					<!-- 생산유통통합조직 등록 -->
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

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">통합조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnReqMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<br>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<div>신청관리 내역등록</div>
				<br>
				<table class="table table-bordered tbl_fixed">
					<caption>사용자관리 수정 화면</caption>
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
							<th colspan="2" scope="row" class="th_bg">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd" class="form-control input-sm" autocomplete="off"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe" class="form-control input-sm" autocomplete="off"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-brno" name="dtl-input-brno" class="form-control input-sm" autocomplete="off"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-crno" name="dtl-input-crno" class="form-control input-sm" autocomplete="off"></sbux-input>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg">작성자(전화번호,휴대폰)</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="dtl-input-picFlnm"
									name="dtl-input-picFlnm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg">경영체등록여부</th>
							<td colspan="3" class="td_input">
								<sbux-select
									id="dtl-input-mngmstYn"
									name="dtl-input-mngmstYn"
									uitype="single"
									jsondata-ref="jsonComMngmstYn"
									unselected-text="전체"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th colspan="2" rowspan="2" scope="row" class="th_bg">
								주소
								<!--
								<br>
								<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								 -->
							</th>
							<td class="td_input" style="border-right:hidden;">[지번 주소]</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-lotnoAddr"
									name="dtl-input-lotnoAddr"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-lotnoDtlAddr"
									name="dtl-input-lotnoDtlAddr"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<td class="td_input" style="border-right:hidden;">도로명 주소</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-zip"
									name="dtl-input-zip"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="5" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-roadNmAddr"
									name="dtl-input-roadNmAddr"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-roadNmDtlAddr"
									name="dtl-input-roadNmDtlAddr"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="5" scope="row" class="th_bg th_border_right">법인구분</th>
							<th colspan="5" scope="row" class="th_bg th_border_right">법인형태</th>
							<th colspan="5" scope="row" class="th_bg th_border_right">법인설립일</th>
						</tr>
						<tr>
							<td colspan="5" class="td_input">
							<!-- 법인구분 -->
							<sbux-select
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpSeCd"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
									readonly
								></sbux-select>
								</td>
							<td colspan="5" class="td_input">
							<!-- 법인형태 -->
							<sbux-select
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpDtlSeCd"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
									readonly
								></sbux-select>
								</td>
							<td colspan="5" class="td_input">
							<!-- 법인설립일 -->
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
							<th rowspan="2" colspan="2" scope="row" class="th_bg th_border_right">출자자수</th>
							<th rowspan="2" colspan="2" scope="row" class="th_bg th_border_right">출자자중<br>농업인 수</th>
							<th rowspan="2" colspan="2" scope="row" class="th_bg th_border_right">출자금액</th>
							<th colspan="8" scope="row" class="th_bg th_border_right">출자금세부현황</th>
							<th rowspan="2" scope="row" class="th_bg th_border_left">농업인출<br>자지분율</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg th_border_right">농업인</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">생산자단체</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">지자체</th>
							<th colspan="2" scope="row" class="th_bg th_border_right">기타</th>
						</tr>
						<tr>
							<td colspan="2" class="td_input">
							<!-- 출자자수 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstNope"
									name="dtl-input-invstNope1"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '명' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
							<td colspan="2" class="td_input">
							<!-- 출자자중 농업인수 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstExpndFrmerNope"
									name="dtl-input-invstExpndFrmerNope"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3,'suffix': '명' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
							<td colspan="2" class="td_input">
							<!-- 출자금액 -->
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
							<td colspan="2" class="td_input">
							<!-- 농업인 -->
							<sbux-input
									uitype="text"
									id="dtl-input-frmerInvstAmt"
									name="dtl-input-frmerInvstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'suffix': '(천원)' , 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
							<td colspan="2" class="td_input">
							<!-- 생산자단체 -->
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
							<td colspan="2" class="td_input">
							<!-- 지자체 -->
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
							<td colspan="2" class="td_input">
							<!-- 기타 -->
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
							<td class="td_input">
							<!-- 농업인출 자지분율 -->
							<sbux-input
									uitype="text"
									id="dtl-input-frmerInvstAmtRt"
									name="dtl-input-frmerInvstAmtRt"
									class="form-control input-sm"
									mask = "{ 'alias': 'currency', 'digits': 2, 'suffix': '%' , 'prefix': '', 'autoUnmask': true }"
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
						</tr>
						<tr>
							<th colspan="15" scope="row" class="th_bg" style="text-align:center;">전체 종사자 수</th>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg th_border_right">정규직</th>
							<th colspan="4" scope="row" class="th_bg th_border_right">파견직</th>
							<th colspan="4" scope="row" class="th_bg th_border_right">일용직</th>
							<th colspan="3" scope="row" class="th_bg th_border_right">합계</th>
						</tr>
						<tr>
							<td colspan="3">
							<!-- 정규직 -->
							<sbux-input
										uitype="text"
										id="dtl-input-rgllbrNope"
										name="dtl-input-rgllbrNope"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
							</td>
							<td>명</td>
							<td colspan="3" style="border-right: hidden;">
							<!-- 파견직 -->
							<sbux-input
										uitype="text"
										id="dtl-input-dwNope"
										name="dtl-input-dwNope"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
							</td>
							<td>명</td>
							<td colspan="3" style="border-right: hidden;">
							<!-- 일용직 -->
							<sbux-input
										uitype="text"
										id="dtl-input-dlbrrNope"
										name="dtl-input-dlbrrNope"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
							</td>
							<td>명</td>
							<td colspan="2" style="border-right: hidden;">
							<!-- 합계 -->
							<sbux-input
										uitype="text"
										id="dtl-input-tot"
										name="dtl-input-tot"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
							</td>
							<td>명</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="descripton_wrap desc">
					*위 사항이 실제와 다를 경우, 기본정보관리에ㅁ서 수정하시기 바랍니다.
					<br>
					<br>생산유통통합조직등록
					<br>
					<br>※사업신청 유의사항
					<br>-신청관리 입력 시 생산유통통합조직이 총괄하여 2024년도 산지유통확설화사업 참여 출자 출하조직 정보 등록
					<br>-사업관리 입력 시 출자출하조직 데이터는 출자출하조직 자체적으로 정보등록
					<br>
					<br>>사업신청
					<br>가. 생산유통통합조직 여부
				</div>
				<br>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">품목 리스트</span>
							</li>
							<li>
								<span style="font-size:12px">상세조회시 추가버튼이 생성됩니다</span>
							</li>
							<li>
								<span style="font-size:12px">품목은 추가버튼을 눌러 생성 후 작성해주세요</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdGpcList" style="height:200px; width: 908px;"></div>
				</div>
				<br>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>생산유통통합조직 여부</caption>
					<col style="width: 5%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 1%">
						<col style="width: 6%">

						<col style="width: 3%">
						<col style="width: 14%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 7%">

						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
					<tbody>
						<tr>
							<th colspan="3" scope="row" class="th_bg">생산유통통합조직</th>
							<td colspan="5" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd1" name="rdo-aprv" uitype="normal" value="1" class="radio_label"></sbux-radio>
									<label class="radio_label" for="rdo-apcSeCd1">승인형</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd2" name="rdo-aprv" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="rdo-apcSeCd2">육성형</label>
								</p>
							</td>
							<td colspan="7" style="border: none"></td>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg">원물확보 시•군 및 시•도 개소 수</th>
							<td class="td_input">
								<sbux-select
									id="dtl-input-rawMtrEnsr"
									name="dtl-input-rawMtrEnsr"
									uitype="single"
									jsondata-ref="selectRawMtrEnsr"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								<!--
								<sbux-radio id="dtl-input-rawMtrEnsr1" name="rawMtrEnsr" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
								<label class="radio_label" for="dtl-input-rawMtrEnsr1">시•군</label>
								<sbux-radio id="dtl-input-rawMtrEnsr2" name="rawMtrEnsr" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
								<label class="radio_label" for="dtl-input-rawMtrEnsr2">시•군</label>
								 -->
							</td>
							<td class="td_input">
								(
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-rawMtrEnsrCnt"
									name="dtl-input-rawMtrEnsrCnt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input">
								)개소
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-rawMtrEnsrNm"
									name="dtl-input-rawMtrEnsrNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="7" style="border: none"></td>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg">출자출하조직 보유 여부</th>
							<td colspan="5" class="td_input">
								<sbux-select
									id="dtl-input-isoHldYn"
									name="dtl-input-isoHldYn"
									uitype="single"
									jsondata-ref="jsonComIsoHldYn"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="7" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div>
				> 전년도에 3개 시•군•구 또는 2개 시•도 이상에서 원물을 확보하고 원예농산물 취급액 100억원 이상, 조직화취급액 70억원 이상, 조직화 취급률 35% 이상의 요건을 갖춘 조직
				</div>
				<br>
				<table class="table table-bordered tbl_fixed">
					<caption>타 조직 통합여부</caption>
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
							<th colspan="5" rowspan="3" scope="row" class="th_bg">타 조직 통합 여부</th>
							<td colspan="3" rowspan="3" class="td_input">
								<sbux-select
									id="dtl-input-untyYn"
									name="dtl-input-untyYn"
									uitype="single"
									jsondata-ref="jsonComUntuYn"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<th colspan="4" scope="row" class="th_bg">통합된 조직명</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-uoNm"
									name="dtl-input-uoNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg">통합된 조직 사업자번호</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-uoBrno"
									name="dtl-input-uoBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg">통합년도</th>
							<td colspan="3" class="td_input">
								<sbux-spinner
									id="dtl-input-untyYr"
									name="dtl-input-untyYr"
									uitype="normal"
                					step-value="1"
                				></sbux-spinner>
                				<!--
								<sbux-input
									uitype="text"
									id="dtl-input-untyYr"
									name="dtl-input-untyYr"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								 -->
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div>
					산지유통활성지원 자금신청 현황
					<br>
					<br>* 기존 보유금액 등을 감안하여 신규(또는 추가)로 필요한 금액 입력.
				</div>
				<br>
				<table class="table table-bordered tbl_fixed">
					<caption>산지유통활성지원 자금신청 현황</caption>
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
							<th colspan="4" scope="row" class="th_bg th_border_right">구분</th>
							<th colspan="4" scope="row" class="th_bg th_border_right">연도</th>
							<th colspan="7" scope="row" class="th_bg">NH(농협) 자금 신청액(천원)</th>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg th_border_right">생산유통통합조직</th>
							<th colspan="4" scope="row" class="th_bg">2024자금 신청액(천원)</th>
							<td colspan="7" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-pruoFundAplyAmt"
									name="dtl-input-pruoFundAplyAmt"
									class="form-control input-sm"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									onkeyup="fn_fundAplyAmt"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg th_border_right">출자출하조직</th>
							<th colspan="4" scope="row" class="th_bg">2024 자금 신청액(천원)</th>
							<td colspan="7" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-isoFundAplyAmt"
									name="dtl-input-isoFundAplyAmt"
									class="form-control input-sm"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									onkeyup="fn_fundAplyAmt"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="8" scope="row" class="th_bg">계</th>
							<td colspan="7" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-fundAplyAmtTot"
									name="dtl-input-fundAplyAmtTot"
									class="form-control input-sm"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
				*신청대상구분
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
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
								></sbux-select>
							</td>
							<td colspan="7" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<div>
				*신청대상구분은 aT본사에서만 이용하는 란입니다.
				</div>
			</div>
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
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
        	style="width:500px"
       	></sbux-modal>
    </div>
    <div id="body-modal-gpcList">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/gpcSelectPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		fn_init();
		fn_initSBSelect();
		fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		fn_gpcListGrid();
		fn_initSBSelect();
		fn_dtlSearch();
	</c:if>
		var now = new Date();
		var year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

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
	})


	//원물확보 시•군 및 시•도
	var selectRawMtrEnsr = [
		{'text': '시•군','label': '시•군', 'value': '1'},
		{'text': '시•도','label': '시•도', 'value': '2'}
	];
	//경영체여부
	var jsonComItemNhBrofYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'Y'}
	];
	//타 조직 통합 여부
	var jsonComUntuYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'Y'}
	];
	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//통합조직여부
	var jsonComAplyTrgtSe = [];//신청대상구분
	var jsonComCtgryCd = [];//분류코드
	var jsonComSttgUpbrItemSe = [];//품목구분 전문/육성
	var jsonComIsoHldYn = [];//출자출하조직 보유 여부
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
			gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),	 //시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('dtl-input-corpSeCd', 		jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('dtl-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //통합조직여부
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			gfn_setComCdSBSelect('grdGpcList', 				jsonComCtgryCd, 	'CTGRY_CD'), //분류코드
			gfn_setComCdSBSelect('grdGpcList', 				jsonComSttgUpbrItemSe, 	'STTG_UPBR_ITEM_SE'), //품목구분
			gfn_setComCdSBSelect('dtl-input-isoHldYn', 		jsonComIsoHldYn, 	'ISO_HLD_YN'), //출자출하조직 보유 여부
		]);
		//품목 그리드
		grdGpcList.refresh({"combo":true});

		console.log("============fn_initSBSelect=====1=======");
	}

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
		fn_gpcListGrid();
	}

	//그리드 변수
	var jsonPrdcrCrclOgnReqMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrCrclOgnReqMng;


	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrCrclOgnReqMng';
	    SBGridProperties.id = 'grdPrdcrCrclOgnReqMng';
	    SBGridProperties.jsonref = 'jsonPrdcrCrclOgnReqMng';
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
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["통합조직구분"], 	ref: 'apoSe',   	hidden : true},
	    	{caption: ["법인등록번호"], 	ref: 'crno',   		hidden : true},
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
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'220px',    style:'text-align:center'},

	        {caption: ["상세내역"], 	ref: 'picFlnm',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'lotnoAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'lotnoDtlAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'zip',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'roadNmAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'roadNmDtlAddr',   hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpSeCd',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpDtlSeCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpFndnDay',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstExpndFrmerNope',   hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstAmt',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'frmerInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrGrpInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'locgovInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'etcInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rgllbrNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'dwNope',   		hidden : true},

	        {caption: ["상세내역"], 	ref: 'rawMtrEnsr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rawMtrEnsrSigunCnt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rawMtrEnsrCtpvCnt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'ctpvNm',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'sigunNm',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'aprv',   		hidden : true},

	        {caption: ["상세내역"], 	ref: 'untyYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'uoNm',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'uoBrno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'untyYr',   	hidden : true},

	        {caption: ["상세내역"], 	ref: 'pruoFundAplyAmt',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'isoFundAplyAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'aplyTrgtSe',   	hidden : true}

	    ];

	    grdPrdcrCrclOgnReqMng = _SBGrid.create(SBGridProperties);
	    /*
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		*/
		//grdPrdcrCrclOgnReqMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdPrdcrCrclOgnReqMng.bind('click','fn_view');
	    grdPrdcrCrclOgnReqMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}
	/**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdPrdcrCrclOgnReqMng.getPageSize();
    	let pageNo = 1;

    	fn_setGrdFcltList(pageSize, pageNo);
    }

	const fn_pagingBbsList = async function() {
    	let recordCountPerPage = grdPrdcrCrclOgnReqMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPrdcrCrclOgnReqMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltList(recordCountPerPage, currentPageNo);
    }

	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		//let yr = SBUxMethod.get("srch-input-yr");// 보류
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,brno : brno
    		,corpNm : corpNm
    		//,yr : yr

    		//페이징
    		,pagingYn : 'Y'
    		,currentPageNo : pageNo
     		,recordCountPerPage : pageSize
		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnReqMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrCrclOgnReqMngVO = {
						apoSe: item.apoSe
						,yr: '2023'
						,apoCd: item.apoCd
						,apoSe: item.apoSe
						,corpNm: item.corpNm
						,brno: item.brno
						,crno: item.crno

						,aprv: item.aprv
						,ctpv: item.ctpv
						,sgg: item.sgg
						,picFlnm: item.picFlnm

						,lotnoAddr: item.lotnoAddr
						,lotnoDtlAddr: item.lotnoDtlAddr
						,zip: item.zip
						,roadNmAddr: item.roadNmAddr
						,roadNmDtlAddr: item.roadNmDtlAddr

						,corpSeCd: item.corpSeCd
						,corpDtlSeCd: item.corpDtlSeCd
						,corpFndnDay: item.corpFndnDay

						,invstNope: item.invstNope
						,invstExpndFrmerNope: item.invstExpndFrmerNope
						,invstAmt: item.invstAmt

						,frmerInvstAmt: item.frmerInvstAmt
						,prdcrGrpInvstAmt: item.prdcrGrpInvstAmt
						,locgovInvstAmt: item.locgovInvstAmt
						,etcInvstAmt: item.etcInvstAmt

						,rgllbrNope: item.rgllbrNope
						,dwNope: item.dwNope
						,dlbrrNope: item.dlbrrNope

						,rawMtrEnsr: item.rawMtrEnsr
						,rawMtrEnsrSigunCnt: item.rawMtrEnsrSigunCnt
						,sigunNm: item.sigunNm
						,rawMtrEnsrCtpvCnt: item.rawMtrEnsrCtpvCnt
						,ctpvNm: item.ctpvNm
						,isoHldYn: item.isoHldYn

						,untyYn: item.untyYn
						,uoNm: item.uoNm
						,uoBrno: item.uoBrno
						,untyYr: item.untyYr

						,pruoFundAplyAmt: item.pruoFundAplyAmt
						,isoFundAplyAmt: item.isoFundAplyAmt
						,aplyTrgtSe: item.aplyTrgtSe
				}
				jsonPrdcrCrclOgnReqMng.push(PrdcrCrclOgnReqMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonPrdcrCrclOgnReqMng.length > 0) {

        		if(grdPrdcrCrclOgnReqMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdPrdcrCrclOgnReqMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdPrdcrCrclOgnReqMng.rebuild();
				}else{
					grdPrdcrCrclOgnReqMng.refresh()
				}
        	} else {
        		grdPrdcrCrclOgnReqMng.setPageTotalCount(totalRecordCount);
        		grdPrdcrCrclOgnReqMng.rebuild();
        	}
        	document.querySelector('#listCount').innerText = totalRecordCount;

        	//grdPrdcrCrclOgnReqMng.rebuild();

        	//입력그리드인경우 추가용
        	//grdPrdcrCrclOgnReqMng.addRow();

        	//조회후 포커스가 이상한곳으로 가있는 경우가 있어서 추가
        	window.scrollTo(0, 0);
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
        let data = await postJsonPromise;
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//

				SBUxMethod.set('dtl-input-picFlnm',gfn_nvl(item.picFlnm))//
				SBUxMethod.set('dtl-input-lotnoAddr',gfn_nvl(item.lotnoAddr))//
				SBUxMethod.set('dtl-input-lotnoDtlAddr',gfn_nvl(item.lotnoDtlAddr))//
				SBUxMethod.set('dtl-input-zip',gfn_nvl(item.zip))//
				SBUxMethod.set('dtl-input-roadNmAddr',gfn_nvl(item.roadNmAddr))//
				SBUxMethod.set('dtl-input-roadNmDtlAddr',gfn_nvl(item.roadNmDtlAddr))//
				SBUxMethod.set('dtl-input-corpSeCd',gfn_nvl(item.corpSeCd))//
				SBUxMethod.set('dtl-input-corpDtlSeCd',gfn_nvl(item.corpDtlSeCd))//
				SBUxMethod.set('dtl-input-corpFndnDay',gfn_nvl(item.corpFndnDay))//
				SBUxMethod.set('dtl-input-invstNope',gfn_nvl(item.invstNope))//
				SBUxMethod.set('dtl-input-invstExpndFrmerNope',gfn_nvl(item.invstExpndFrmerNope))//
				SBUxMethod.set('dtl-input-invstAmt',gfn_nvl(item.invstAmt))//
				SBUxMethod.set('dtl-input-frmerInvstAmt',gfn_nvl(item.frmerInvstAmt))//
				SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',gfn_nvl(item.prdcrGrpInvstAmt))//
				SBUxMethod.set('dtl-input-locgovInvstAmt',gfn_nvl(item.locgovInvstAmt))//
				SBUxMethod.set('dtl-input-etcInvstAmt',gfn_nvl(item.etcInvstAmt))//
				SBUxMethod.set('dtl-input-rgllbrNope',gfn_nvl(item.rgllbrNope))//
				SBUxMethod.set('dtl-input-dwNope',gfn_nvl(item.dwNope))//
				SBUxMethod.set('dtl-input-dlbrrNope',gfn_nvl(item.dlbrrNope))//
				SBUxMethod.set('rdo-aprv',gfn_nvl(item.aprv))//

				SBUxMethod.set('dtl-input-rawMtrEnsr',gfn_nvl(item.rawMtrEnsr))//
				let rawMtrEnsr = SBUxMethod.get('dtl-input-rawMtrEnsr');
				if(rawMtrEnsr == '1'){
					SBUxMethod.set('dtl-input-rawMtrEnsrCnt',gfn_nvl(item.rawMtrEnsrSigunCnt))//
					SBUxMethod.set('dtl-input-rawMtrEnsrNm',gfn_nvl(item.sigunNm))//
				}else if (rawMtrEnsr == '2'){
					SBUxMethod.set('dtl-input-rawMtrEnsrCnt',gfn_nvl(item.rawMtrEnsrCtpvCnt))//
					SBUxMethod.set('dtl-input-rawMtrEnsrNm',gfn_nvl(item.ctpvNm))//
				}
				SBUxMethod.set('dtl-input-isoHldYn',gfn_nvl(item.isoHldYn))//

				SBUxMethod.set('dtl-input-untyYn',gfn_nvl(item.untyYn))//
				SBUxMethod.set('dtl-input-uoNm',gfn_nvl(item.uoNm))//
				SBUxMethod.set('dtl-input-uoBrno',gfn_nvl(item.uoBrno))//
				SBUxMethod.set('dtl-input-untyYr',gfn_nvl(item.untyYr))//

				SBUxMethod.set('dtl-input-pruoFundAplyAmt',gfn_nvl(item.pruoFundAplyAmt))//
				SBUxMethod.set('dtl-input-isoFundAplyAmt',gfn_nvl(item.isoFundAplyAmt))//
				SBUxMethod.set('dtl-input-aplyTrgtSe',gfn_nvl(item.aplyTrgtSe))//

			});
			//품목 그리드 조회
			fn_selectGpcList();

        	//조회후 포커스가 이상한곳으로 가있는 경우가 있어서 추가
        	window.scrollTo(0, 0);
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

    	//통합조직 정보가 있어야만 가능함
    	let apoCd = SBUxMethod.get("dtl-input-apoCd");

    	//필수값 체크
    	if(fn_checkRequiredInput()){
    		return;
    	}

    	if (gfn_isEmpty(apoCd)) {
    		console.log("apoCd null");
    		return;
    		// 신규 등록
			//fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		console.log("저장");
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}
    }

    function fn_checkRequiredInput(){
    	//필수값 확인


    	//품목 그리드 필수갑 확인
    	let gridData = grdGpcList.getGridDataAll();
    	for(var i=1; i<=gridData.length; i++ ){
    		let rowData = grdGpcList.getRowData(i);

    		if(rowData.delYn == 'N'){
    			if(gfn_isEmpty(rowData.ctgryCd)){
    				alert('품목 그리드의 품목분류를 선택해주세요');
    				grdGpcList.focus();//그리드 객체로 포커스 이동
    				return true;
    			}
    			if(gfn_isEmpty(rowData.itemCd)){
    				alert('품목 그리드의 품목을 선택해주세요');
    				grdGpcList.focus();
    				return true;
    			}
    			if(gfn_isEmpty(rowData.sttgUpbrItemSe)){
    				alert('품목 그리드의 전문/육성 구분을 선택해주세요');
    				grdGpcList.focus();
    				return true;
    			}
    		}
    	}
    	return false;
    }


    /**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
    const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		var rawMtrEnsr = SBUxMethod.get('dtl-input-rawMtrEnsr')//
		var rawMtrEnsrCnt = SBUxMethod.get('dtl-input-rawMtrEnsrCnt')//
		var rawMtrEnsrNm = SBUxMethod.get('dtl-input-rawMtrEnsrNm')//
		var rawMtrEnsrSigunCnt = "";
		var rawMtrEnsrCtpvCnt = "";
		var sigunNm = "";
		var ctpvNm = "";
		if(rawMtrEnsr == '1'){
			rawMtrEnsrSigunCnt = rawMtrEnsrCnt;
			sigunNm = rawMtrEnsrNm;
		}else if (rawMtrEnsr == '2'){
			rawMtrEnsrCtpvCnt = rawMtrEnsrCnt;
			ctpvNm = rawMtrEnsrNm;
		}


   	 	const postJsonPromise = gfn_postJSON("/pd/aom/insertPrdcrCrclOgnReqMng.do", {

   	 		apoCd: SBUxMethod.get('dtl-input-apoCd')//
			,apoSe: SBUxMethod.get('dtl-input-apoSe')//
			,brno: SBUxMethod.get('dtl-input-brno')//
			,crno: SBUxMethod.get('dtl-input-crno')//
			,corpNm: SBUxMethod.get('dtl-input-corpNm')//
   	 		//생산유통통합조직 승인형,육성형
   	 		,aprv: SBUxMethod.get('rdo-aprv')//
   	 		//원물확보 시군 및 시도 개소 수
   	 		,uoCd: SBUxMethod.get('dtl-input-apoCd')//
   	 		,rawMtrEnsrSigunCnt: rawMtrEnsrSigunCnt
   	 		,rawMtrEnsrCtpvCnt: rawMtrEnsrCtpvCnt
   	 		,ctpvNm: ctpvNm
	 		,sigunNm: sigunNm
   	 		//타조직통합여부
   	 		,untyYn: SBUxMethod.get('dtl-input-untyYn')//
			,uoNm: SBUxMethod.get('dtl-input-uoNm')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,untyYr: SBUxMethod.get('dtl-input-untyYr')//
			//산지유통활성지원금 자금신청 현황
			,pruoFundAplyAmt: SBUxMethod.get('dtl-input-pruoFundAplyAmt')//
			,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
			//신청대상구분
			,aplyTrgtSe: SBUxMethod.get('dtl-input-aplyTrgtSe')//
		});

        const data = await postJsonPromise;
        console.log("insert result", data);

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				fn_search();
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
		console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

		var rawMtrEnsr = SBUxMethod.get('dtl-input-rawMtrEnsr')//
		var rawMtrEnsrCnt = SBUxMethod.get('dtl-input-rawMtrEnsrCnt')//
		var rawMtrEnsrNm = SBUxMethod.get('dtl-input-rawMtrEnsrNm')//
		var rawMtrEnsrSigunCnt = "";
		var rawMtrEnsrCtpvCnt = "";
		var sigunNm = "";
		var ctpvNm = "";
		if(rawMtrEnsr == '1'){
			rawMtrEnsrSigunCnt = rawMtrEnsrCnt;
			sigunNm = rawMtrEnsrNm;
		}else if (rawMtrEnsr == '2'){
			rawMtrEnsrCtpvCnt = rawMtrEnsrCnt;
			ctpvNm = rawMtrEnsrNm;
		}

		let gridData = grdGpcList.getGridDataAll();
		let gpcList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd')//
		let apoSe = SBUxMethod.get('dtl-input-apoSe')//
		let brno = SBUxMethod.get('dtl-input-brno')//
		let crno = SBUxMethod.get('dtl-input-crno')//
		let corpNm = SBUxMethod.get('dtl-input-corpNm')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdGpcList.getRowData(i);
			let rowSts = grdGpcList.getRowStatus(i);
			//console.log(i+"행 상태값 : "+rowSts);

			//let ctgryCd = rowData.ctgryCd;
			//let itemCd = rowData.itemCd;

			let delYn = rowData.delYn;

			rowData.apoCd = apoCd;
			rowData.apoSe = apoSe;
			rowData.brno = brno;
			rowData.crno = crno;
			rowData.corpNm = corpNm;

			if(delYn == 'N'){
				/*
				if (gfn_isEmpty(apoCd)) {
		  			alert("품목을 선택해주세요");
		            return;
		  		}
				*/
				if(gfn_isEmpty(rowData.yr)) {
					rowData.yr = '2023';
				}

				if (rowSts === 1){
					rowData.rowSts = "I";
					gpcList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "I";
					gpcList.push(rowData);
				} else if (rowSts === 3){
					rowData.rowSts = "I";
					gpcList.push(rowData);
				} else {
					continue;
				}
			}
		}

		var saveList = {
				apoCd: SBUxMethod.get('dtl-input-apoCd')//
				,apoSe: SBUxMethod.get('dtl-input-apoSe')//
				,brno: SBUxMethod.get('dtl-input-brno')//
				,crno: SBUxMethod.get('dtl-input-crno')//
				,corpNm: SBUxMethod.get('dtl-input-corpNm')//
				,yr: '2023'
	   	 		//생산유통통합조직 승인형,육성형
	   	 		,aprv: SBUxMethod.get('rdo-aprv')//
	   	 		,isoHldYn: SBUxMethod.get('dtl-input-isoHldYn')//
	   	 		//원물확보 시군 및 시도 개소 수
	   	 		,uoCd: SBUxMethod.get('dtl-input-apoCd')//
	   	 		,rawMtrEnsrSigunCnt: rawMtrEnsrSigunCnt
	   	 		,rawMtrEnsrCtpvCnt: rawMtrEnsrCtpvCnt
	   	 		,ctpvNm: ctpvNm
		 		,sigunNm: sigunNm
	   	 		//타조직통합여부
	   	 		,untyYn: SBUxMethod.get('dtl-input-untyYn')//
				,uoNm: SBUxMethod.get('dtl-input-uoNm')//
				,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
				,untyYr: SBUxMethod.get('dtl-input-untyYr')//
				//산지유통활성지원금 자금신청 현황
				,pruoFundAplyAmt: SBUxMethod.get('dtl-input-pruoFundAplyAmt')//
				,isoFundAplyAmt: SBUxMethod.get('dtl-input-isoFundAplyAmt')//
				//신청대상구분
				,aplyTrgtSe: SBUxMethod.get('dtl-input-aplyTrgtSe')//
	  		};
		saveList.gpcList = gpcList;

		//console.log(saveList.gpcList);
		const postJsonPromise = gfn_postJSON("/pd/aom/updatePrdcrCrclOgnReqMng.do", saveList);

		const data = await postJsonPromise;
		//console.log("update result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				fn_search();
			</c:if>
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {

		}

  	}



	//그리드 클릭시 상세보기 이벤트
	function fn_view() {
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrCrclOgnReqMng.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdPrdcrCrclOgnReqMng.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdPrdcrCrclOgnReqMng.getRowData(nRow);

		//console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//

		SBUxMethod.set('dtl-input-picFlnm',gfn_nvl(rowData.picFlnm))//
		SBUxMethod.set('dtl-input-lotnoAddr',gfn_nvl(rowData.lotnoAddr))//
		SBUxMethod.set('dtl-input-lotnoDtlAddr',gfn_nvl(rowData.lotnoDtlAddr))//
		SBUxMethod.set('dtl-input-zip',gfn_nvl(rowData.zip))//
		SBUxMethod.set('dtl-input-roadNmAddr',gfn_nvl(rowData.roadNmAddr))//
		SBUxMethod.set('dtl-input-roadNmDtlAddr',gfn_nvl(rowData.roadNmDtlAddr))//
		SBUxMethod.set('dtl-input-corpSeCd',gfn_nvl(rowData.corpSeCd))//
		SBUxMethod.set('dtl-input-corpDtlSeCd',gfn_nvl(rowData.corpDtlSeCd))//
		SBUxMethod.set('dtl-input-corpFndnDay',gfn_nvl(rowData.corpFndnDay))//
		SBUxMethod.set('dtl-input-invstNope',gfn_nvl(rowData.invstNope))//
		SBUxMethod.set('dtl-input-invstExpndFrmerNope',gfn_nvl(rowData.invstExpndFrmerNope))//
		SBUxMethod.set('dtl-input-invstAmt',gfn_nvl(rowData.invstAmt))//
		SBUxMethod.set('dtl-input-frmerInvstAmt',gfn_nvl(rowData.frmerInvstAmt))//
		SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',gfn_nvl(rowData.prdcrGrpInvstAmt))//
		SBUxMethod.set('dtl-input-locgovInvstAmt',gfn_nvl(rowData.locgovInvstAmt))//
		SBUxMethod.set('dtl-input-etcInvstAmt',gfn_nvl(rowData.etcInvstAmt))//
		SBUxMethod.set('dtl-input-rgllbrNope',gfn_nvl(rowData.rgllbrNope))//
		SBUxMethod.set('dtl-input-dwNope',gfn_nvl(rowData.dwNope))//
		SBUxMethod.set('dtl-input-dlbrrNope',gfn_nvl(rowData.dlbrrNope))//


		SBUxMethod.set('rdo-aprv',gfn_nvl(rowData.aprv))//
		SBUxMethod.set('dtl-input-rawMtrEnsr',gfn_nvl(rowData.rawMtrEnsr))//
		SBUxMethod.set('dtl-input-rawMtrEnsrCnt',gfn_nvl(rowData.rawMtrEnsrCnt))//
		SBUxMethod.set('dtl-input-rawMtrEnsrNm',gfn_nvl(rowData.rawMtrEnsrNm))//
		SBUxMethod.set('dtl-input-isoHldYn',gfn_nvl(rowData.isoHldYn))//
		let rawMtrEnsr = SBUxMethod.get('dtl-input-rawMtrEnsr');
		if(rawMtrEnsr == '1'){
			SBUxMethod.set('dtl-input-rawMtrEnsrCnt',gfn_nvl(rowData.rawMtrEnsrSigunCnt))//
			SBUxMethod.set('dtl-input-rawMtrEnsrNm',gfn_nvl(rowData.sigunNm))//
		}else if (rawMtrEnsr == '2'){
			SBUxMethod.set('dtl-input-rawMtrEnsrCnt',gfn_nvl(rowData.rawMtrEnsrCtpvCnt))//
			SBUxMethod.set('dtl-input-rawMtrEnsrNm',gfn_nvl(rowData.ctpvNm))//
		}

		SBUxMethod.set('dtl-input-untyYn',gfn_nvl(rowData.untyYn))//
		SBUxMethod.set('dtl-input-uoNm',gfn_nvl(rowData.uoNm))//
		SBUxMethod.set('dtl-input-uoBrno',gfn_nvl(rowData.uoBrno))//
		SBUxMethod.set('dtl-input-untyYr',gfn_nvl(rowData.untyYr))//

		SBUxMethod.set('dtl-input-pruoFundAplyAmt',gfn_nvl(rowData.pruoFundAplyAmt))//
		SBUxMethod.set('dtl-input-isoFundAplyAmt',gfn_nvl(rowData.isoFundAplyAmt))//
		SBUxMethod.set('dtl-input-aplyTrgtSe',gfn_nvl(rowData.aplyTrgtSe))//

		fn_selectGpcList();

    }


    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set('dtl-input-untyYn',null)//
    	SBUxMethod.set('dtl-input-uoNm',null)//
    	SBUxMethod.set('dtl-input-uoBrno',null)//
    	SBUxMethod.set('dtl-input-untyYr',null)//
    }



	/* 주소 팝업 */
	//팝업 실행
	var fn_goPopup = function(){
		w = 520;
		h = 620;
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;

		settings = "height=" + h
				   + ",width=" + w
				   + ",top=" + TopPosition
				   + ",left=" + LeftPosition
				   + ",scrollbars=yes, resizable=yes";
		window.open( "/fm/popup/jusoPopup.do", "zipCodeSearchWin", settings );

	}
	/* 주소 팝업 */
	//팝업 콜백
	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
		/*
			roadFullAddr 전체 도로명주소
			roadAddrPart1 도로명주소(참고항목 제외)
			roadAddrPart2 도로명주소 참고항목
			addrDetail 상세주소
			engAddr 도로명 주소 영문
			jibunAddr 지번 정보
			zipNo 우편번호
		*/
		if(addrDetail.length>30){
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		SBUxMethod.set("dtl-input-zip", zipNo);//우편번호
		SBUxMethod.set("dtl-input-lotnoAddr", jibunAddr);//지번주소
		SBUxMethod.set("dtl-input-lotnoDtlAddr", addrDetail);//지번주소 상세주소
		SBUxMethod.set("dtl-input-roadNmAddr", roadFullAddr);//도로명주소
		SBUxMethod.set("dtl-input-roadNmDtlAddr", addrDetail);//도로명주소 상세주소
		//console.log(roadFullAddr+" , "+roadAddrPart1+" , "+addrDetail+" , "+roadAddrPart2+" , "+engAddr+" , "+jibunAddr+" , "+zipNo);
		//alert("성공");
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
	        {caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdGpcList\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdGpcList\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	    	{caption: ["통합조직코드"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["통합조직코드"], 	ref: 'yr',   		hidden : true},
	    	/*
	    	{caption: ["분류명"], 		ref: 'ctgryNm',   	type:'output',  width:'150px',    style:'text-align:center'},
	    	{caption: ["분류코드"], 		ref: 'ctgryCd',   	hidden : true},
	    	*/

	    	{caption: ["품목분류"], 		ref: 'ctgryCd',   	type:'combo',  width:'150px',    style:'text-align:center',
	    		typeinfo : {ref:'jsonComCtgryCd', label:'label', value:'value', displayui : true}},

	    	{caption: ["전문/육성 구분"], 	ref: 'sttgUpbrItemSe',   type:'combo',  width:'150px',    style:'text-align:center',
	    		typeinfo : {ref:'jsonComSttgUpbrItemSe', label:'label', value:'value', displayui : true}},
	    	{caption: ["품목명"], 			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
	    	/*
	        {caption: ["품목코드"], 			ref: 'itemCd',   	hidden : true},
	        */
	        {caption: ["품목코드"], 			ref: 'itemCd',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["상세내역"], 	ref: 'picFlnm',   		hidden : true},

	    ];

	    grdGpcList = _SBGrid.create(SBGridProperties);
	    /*
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		*/
		//grdGpc.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    //grdGpcList.bind('click','fn_view');
	  	//클릭 이벤트 바인드
	    //grdGpcList.bind('click','gridClick');
	    grdGpcList.bind('dblclick','gridClick');
	}

	/* 품목리스트 조회 기능*/
	const fn_selectGpcList = async function(){
		console.log("===========fn_selectGpcList===========");
		let apoCd = SBUxMethod.get('dtl-input-apoCd')//

		//없는경우 품목그리드 초기화
		//apoCd 가 없는 경우가 없어야 한데 현재는 있어서 추가 함
		if(gfn_isEmpty(apoCd)){
			jsonGpcList.length = 0;
			grdGpcList.rebuild();
			return;
		}
    	let postJsonPromise = gfn_postJSON("/pd/aom/selectGpcList.do", {
    		 apoCd : apoCd
    		,apoSe : SBUxMethod.get('dtl-input-apoSe')//
    		,brno : SBUxMethod.get('dtl-input-brno')//
    		,crno : SBUxMethod.get('dtl-input-crno')//
    		,corpNm : SBUxMethod.get('dtl-input-corpNm')//
		});
        let data = await postJsonPromise;
        try{
        	jsonGpcList.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let GpcListVO = {
						 yr: item.yr
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,ctgryCd: item.ctgryCd
						,ctgryNm: item.ctgryNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm
						,rmrk: item.rmrk

				}
				jsonGpcList.push(GpcListVO);
			});

        	grdGpcList.rebuild();
        	//비어 있는 마지막 줄 추가용도
        	grdGpcList.addRow();
        	var nCol =grdGpcList.getColRef('sttgUpbrItemSe');
        	console.log(nCol);
        	window.scrollTo(0, 0);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	// Grid Row 추가 및 삭제 기능
    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "grdGpcList") {
            	grdGpcList.setCellData(nRow, nCol, "N", true);
            	//grdGpcList.setCellData(nRow, 5, gv_apcCd, true);
            	grdGpcList.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdGpcList") {
            	if(grdGpcList.getRowStatus(nRow) == 0 || grdGpcList.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var vo = grdGpcList.getRowData(nRow);
            			fn_deleteRsrc(vo);
            			grdGpcList.deleteRow(nRow);
            		}
            	}else{
            		grdGpcList.deleteRow(nRow);
            	}
            }
        }
    }
	//품목 리스트 삭제
	async function fn_deleteRsrc(vo){
		let postJsonPromise = gfn_postJSON("/pd/aom/deleteUo.do", vo);
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
		console.log("******************fn_GpcListMultiSave**********************************");

		let gridData = grdGpcList.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdGpcList.getRowData(i);
			let rowSts = grdGpcList.getRowStatus(i);
			//console.log(i+"행 상태값 : "+rowSts);

			let delYn = rowData.delYn;

			rowData.uoCd = apoCd;

			if(delYn == 'N'){
				if (gfn_isEmpty(uoBrno)) {
		  			alert("품목을 선택해주세요");
		            return;
		  		}
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
        	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
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
    	console.log("================fn_GridPop================");
        if (gubun === "pop") {
            if (grid === "grdGpcList") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdGpcList.setCellData(nRow, nCol, "N", true);
            }
        }
    }

	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

    //그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdGpcList 그리드 객체
        selGridRow = grdGpcList.getRow();
        selGridCol = grdGpcList.getCol();


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
        	//선택한 데이터가 통합조직 일떄
        	if (selGridCol == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		popGpcSelect.init(fn_setGridItem);
        		SBUxMethod.openModal('modal-gpcList');
        	}
        }
    }


	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		console.log("================fn_setGridItem================");
		//console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdGpcList.getRefOfCol(selGridCol);

			//let colRefIdx1 = grdGpcList.getColRef("ctgryCd");//분류코드 인덱스
			//let colRefIdx2 = grdGpcList.getColRef("ctgryNm");//분류명 인덱스
			let colRefIdx3 = grdGpcList.getColRef("itemCd");//품목코드 인덱스
			let colRefIdx4 = grdGpcList.getColRef("itemNm");//품목명 인덱스
			let colRefIdx5 = grdGpcList.getColRef("rmrk");//기타 인덱스

			//그리드 값 세팅
			//grdGpcList.setCellData(selGridRow,colRefIdx1,rowData.ctgryCd,true);
			//grdGpcList.setCellData(selGridRow,colRefIdx2,rowData.ctgryNm,true);
			grdGpcList.setCellData(selGridRow,colRefIdx3,rowData.itemCd,true);
			grdGpcList.setCellData(selGridRow,colRefIdx4,rowData.itemNm,true);
			grdGpcList.setCellData(selGridRow,colRefIdx5,rowData.rmrk,true);
		}
	}

	function fn_fundAplyAmt(){
		let pruoFundAplyAmt = 0;
		if(!gfn_isEmpty(SBUxMethod.get('dtl-input-pruoFundAplyAmt'))){
			pruoFundAplyAmt = parseFloat(SBUxMethod.get('dtl-input-pruoFundAplyAmt'));
		}
		let isoFundAplyAmt = 0;
		if(!gfn_isEmpty(SBUxMethod.get('dtl-input-isoFundAplyAmt'))){
			isoFundAplyAmt = parseFloat(SBUxMethod.get('dtl-input-isoFundAplyAmt'));
		}
		SBUxMethod.set('dtl-input-fundAplyAmtTot',isoFundAplyAmt + pruoFundAplyAmt);
	}
</script>
</html>



