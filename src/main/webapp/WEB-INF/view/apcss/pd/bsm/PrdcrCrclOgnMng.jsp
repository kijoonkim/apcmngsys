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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<!-- 산지조직관리 -->
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
					</c:if>
					<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
						<sbux-button id="btnSaveFclt01" name="btnSaveFclt01" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				<!--[pp] 검색 -->
				<sbux-input id="dtl-input-wghno" name="dtl-input-wghno" uitype="hidden"></sbux-input>
				<sbux-input id="dtl-input-prdcrCd" name="dtl-input-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >관할기관</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
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
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >시도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
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
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">시군</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-sgg"
									name="srch-input-sgg"
									uitype="single"
									jsondata-ref="jsonComSgg"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;" >
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">법인구분</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
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
							<td colspan="2" class="td_input" style="border-right: hidden;" >
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
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">2차승인구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-evCertYn"
									name="srch-input-evCertYn"
									uitype="single"
									jsondata-ref="selectEvCertYn"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="3" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-brno"
									name="srch-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">법인명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
							<th scope="row" class="th_bg">참여조직여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-apoSe"
									name="srch-input-apoSe"
									uitype="single"
									jsondata-ref="selectApoSe"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td colspan="3" class="td_input">
							</td>
						</tr>

					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<!--
				<span style="font-size:16px">출자출하조직이 속한 통합조직 리스트</span><br>
				 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">검색리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<br>
				<div></div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<!-- 그리드 식으로 변경 -->
				<!--
				<table class="table table-bordered tbl_fixed">
					<caption>통합조직</caption>
					<tbody>
						<tr>
							<th colspan="2" scope="row" class="th_bg"  style="text-align:center;"><span class="data_required" ></span>출자출하조직이 속한 통합조직 사업자번호</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-uoNm1"
									name="uoNm1"
									class="form-control input-sm"
									autocomplete="off"
									group-id = "uoList"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-uoBrno1"
									name="uoBrno1"
									class="form-control input-sm"
									autocomplete="off"
									group-id = "uoList"
								></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-brno1" name="srch-btn-brno" uitype="modal" target-id="modal-brno" onclick="fn_choiceBrno" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td colspan="7" class="td_input" style="border-bottom:hidden; border-right:hidden; border-top:hidden;">
							</td>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg"  style="text-align:center;"><span class="data_required" ></span>출자출하조직이 속한 통합조직 사업자번호</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-uoNm2"
									name="uoNm2"
									class="form-control input-sm"
									autocomplete="off"
									group-id = "uoList"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-uoBrno2"
									name="uoBrno2"
									class="form-control input-sm"
									autocomplete="off"
									group-id = "uoList"
								></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-brno2" name="srch-btn-brno" uitype="modal" target-id="modal-brno" onclick="fn_choiceBrno" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td colspan="7" class="td_input" style="border-bottom:hidden; border-right:hidden; border-top:hidden;">
							</td>
						</tr>
					</tbody>
				</table>
				-->

				<!-- 출자출하조직이 속한 통합조직 리스트 그리드 -->
				<div class="ad_section_top uoList">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">출자출하조직이 속한 통합조직 리스트</span>
							</li>
							<li>
								<span style="font-size:12px">상세조회시 추가버튼이 생성됩니다</span>
							</li>
							<li>
								<span style="font-size:12px">추가 버튼을 누른후 통합조직명,사업자번호 위치 클릭시 팝업이 열립니다.</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdUoList" style="height:150px; width: 908px; overflow-x: hidden"></div>
				</div>
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
							<th colspan="2" scope="row" class="th_bg"  style="text-align:center;">

							<sbux-button id="srch-btn-mngmstInfoId" name="srch-btn-mngmstInfoId" uitype="modal" target-id="modal-mngmstInfoId" onclick="fn_choiceMngmstInfoId" text="경영체번호 찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</th>
							<!-- <td style="border-right:hidden;"></td> -->
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd" class="form-control input-sm" autocomplete="off"></sbux-input>
							<th colspan="13" scope="row" class="th_bg"  style="text-align:center;">업체정보</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인등록번호</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>사업자번호</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg">경영체번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-mngmstInfoId"
									name="dtl-input-mngmstInfoId"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>경영체여부</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-mngmstYn"
									name="dtl-input-mngmstYn"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								 -->
								<sbux-select
									id="dtl-input-mngmstYn"
									name="dtl-input-mngmstYn"
									uitype="single"
									jsondata-ref="jsonComMngmstYn"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg">환코드</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-nonghyupCd"
									name="dtl-input-nonghyupCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg">관할기관</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-cmptnInst"
									name="dtl-input-cmptnInst"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								 -->
								<sbux-select
									id="dtl-input-cmptnInst"
									name="dtl-input-cmptnInst"
									uitype="single"
									jsondata-ref="jsonComCmptnInst"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>시도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="dtl-input-ctpv"
									name="dtl-input-ctpv"
									uitype="single"
									jsondata-ref="jsonComCtpv"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg">시군</th>
							<td colspan="3" class="td_input">
								<sbux-select
									id="dtl-input-sgg"
									name="dtl-input-sgg"
									uitype="single"
									jsondata-ref="jsonComSgg"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th colspan="2" rowspan="2" scope="row" class="th_bg">
								<span class="data_required" ></span>주소<br>
								<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</th>
							<td class="td_input" style="border-right:hidden;">[지번 주소]</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-lotnoAddr"
									name="dtl-input-lotnoAddr"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-lotnoDtlAddr"
									name="dtl-input-lotnoDtlAddr"
									class="form-control input-sm"
									autocomplete="off"
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
								></sbux-input>
							</td>
							<td colspan="5" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-roadNmAddr"
									name="dtl-input-roadNmAddr"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-roadNmDtlAddr"
									name="dtl-input-roadNmDtlAddr"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th rowspan="8" scope="row" class="th_bg th_border_right">조직형태</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>법인구분</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>법인형태</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>법인설립일</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>출자출하조직여부</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>출자자수</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>출자자중 농업인수</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>출자금액(천원)</th>
						</tr>
						<tr>
							<td colspan="2" class="td_input">
							<!-- 법인구분 -->
							<!--
							<sbux-input
									uitype="text"
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							 -->
							<sbux-select
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpSeCd"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<!-- 법인형태 -->
							<!--
							<sbux-input
									uitype="text"
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							 -->
							<sbux-select
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpDtlSeCd"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<!-- 법인설립일 -->
							<sbux-datepicker
									uitype="popup"
									id="dtl-input-corpFndnDay01"
									name="dtl-input-corpFndnDay01"
									class="input-sm"
									style="width:100%;"
									autocomplete="off"
								></sbux-datepicker>

								</td>
							<td colspan="2" class="td_input">
							<!-- 출자출하조직여부 -->
							<!--
							<sbux-input
									uitype="text"
									id="dtl-input-isoHldYn"
									name="dtl-input-isoHldYn"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							-->
							<sbux-select
									id="dtl-input-isoHldYn"
									name="dtl-input-isoHldYn"
									uitype="single"
									jsondata-ref="selectApoSe"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<!-- 출자자수 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstNope"
									name="dtl-input-invstNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
								</td>

							<td colspan="2" class="td_input">
							<!-- 출자자중 농업인수 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstExpndFrmerNope"
									name="dtl-input-invstExpndFrmerNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
								</td>
							<td colspan="2" class="td_input">
							<!-- 출자금액 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstAmt"
									name="dtl-input-invstAmt"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
						<th colspan="12" style="text-align:center;" scope="row" class="th_bg  th_border_right">출자금세부현황</th>
						<th rowspan="2" colspan="2" scope="row" class="th_bg th_border_left"><span class="data_required" ></span>농업인 출자 지분율</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>농업인</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>생산자단체</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>지자체</th>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>기타</th>
						</tr>
						<tr>
							<td colspan="2"   style="border-right: hidden;">
							<!-- 농업인 -->
							<sbux-input
									uitype="text"
									id="dtl-input-frmerInvstAmt"
									name="dtl-input-frmerInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onkeyup="fn_calFrmerInvstAmtRt"
								></sbux-input>
							</td>
							<td>천원</td>
							<td colspan="2"   style="border-right: hidden;">
							<!-- 생산자단체 -->
							<sbux-input
									uitype="text"
									id="dtl-input-prdcrGrpInvstAmt"
									name="dtl-input-prdcrGrpInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td>천원</td>
							<td colspan="2"   style="border-right: hidden;">
							<!-- 지자체 -->
							<sbux-input
									uitype="text"
									id="dtl-input-locgovInvstAmt"
									name="dtl-input-locgovInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td>천원</td>
							<td colspan="2"   style="border-right: hidden; ">
							<!-- 기타 -->
							<sbux-input
									uitype="text"
									id="dtl-input-etcInvstAmt"
									name="dtl-input-etcInvstAmt"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td>천원</td>
							<!-- 농업인 출자비율 -->
							<td colspan="2"   style="border-right: hidden;">
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
							<th colspan="14" scope="row" class="th_bg" style="text-align:center;">전체 종사자 수</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>정규직</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>파견직</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"><span class="data_required" ></span>일용직</th>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>합계</th>
						</tr>
						<tr>
						<td colspan="2" style="border-right:hidden;">
						<!-- 정규직 -->
						<sbux-input
									uitype="text"
									id="dtl-input-rgllbrNope"
									name="dtl-input-rgllbrNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									onkeyup="fn_calTot"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="2" style="border-right:hidden;">
						<!-- 파견직 -->
						<sbux-input
									uitype="text"
									id="dtl-input-dwNope"
									name="dtl-input-dwNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									onkeyup="fn_calTot"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="2" style="border-right:hidden;">
						<!-- 일용직 -->
						<sbux-input
									uitype="text"
									id="dtl-input-dlbrrNope"
									name="dtl-input-dlbrrNope"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									autocomplete="off"
									onkeyup="fn_calTot"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="2" style="border-right:hidden;">
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
						<tr>
							<th colspan="7" scope="row" class="th_bg th_border_right">대표자 정보</th>
							<th colspan="8" scope="row" class="th_bg">작성자 정보</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg" ><span class="data_required" ></span>성명</th>
							<td colspan="5">
							<sbux-input
									uitype="text"
									id="dtl-input-rprsvFlnm"
									name="dtl-input-rprsvFlnm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg" ><span class="data_required" ></span>직위</th>
							<td colspan="2">
							<sbux-input
									uitype="text"
									id="dtl-input-picPosition"
									name="dtl-input-picPosition"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>성명</th>
							<td colspan="2">
							<sbux-input
									uitype="text"
									id="dtl-input-picFlnm"
									name="dtl-input-picFlnm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg" style="border-top: 1px solid white !important;"><span class="data_required" ></span>전화번호</th>
							<td colspan="5">
							<sbux-input
									uitype="text"
									id="dtl-input-rprsvTelno"
									name="dtl-input-rprsvTelno"
									class="form-control input-sm"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg" style="border-top: 1px solid white !important;"><span class="data_required" ></span>전화번호</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="dtl-input-picTelno"
									name="dtl-input-picTelno"
									class="form-control input-sm"
								></sbux-input>
								</td>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>핸드폰번호</th>
							<td colspan="5">
							<sbux-input
									uitype="text"
									id="dtl-input-rprsvMoblno"
									name="dtl-input-rprsvMoblno"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>핸드폰번호</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="dtl-input-picMoblno"
									name="dtl-input-picMoblno"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg th_border_right">이메일주소</th>
							<td colspan="5">
							<sbux-input
									uitype="text"
									id="dtl-input-rprsvEml"
									name="dtl-input-rprsvEml"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>이메일주소</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="dtl-input-picEml"
									name="dtl-input-picEml"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
							<th colspan="7" scope="row" class="th_bg">이메일주소</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>팩스번호</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="dtl-input-fxno"
									name="dtl-input-fxno"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
							<th colspan="7" scope="row" class="th_bg">품목농협 지소 여부</th>
							<td colspan="8">
							<sbux-select
									id="dtl-input-itemNhBrofYn"
									name="dtl-input-itemNhBrofYn"
									uitype="single"
									jsondata-ref="jsonComItemNhBrofYn"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
						</tr>

					</tbody>
				</table>

			</div>
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
		</div>
	</section>

	<!-- 사업자번호 조회 팝업 -->
    <div>
        <sbux-modal
        	id="modal-brno"
        	name="modal-brno"
        	uitype="middle"
        	header-title="사업자번호 선택"
        	body-html-id="body-modal-brno"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-brno">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/BrnoPopup.jsp"></jsp:include>
    </div>

    <!-- 경영체 조회 팝업 -->
	<div>
        <sbux-modal
        	id="modal-mngmstInfoId"
        	name="modal-mngmstInfoId"
        	uitype="middle"
        	header-title="경영체번호 선택"
        	body-html-id="body-modal-mngmstInfoId"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-mngmstInfoId">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/MngmstInfoIdPopup.jsp"></jsp:include>
    </div>



</body>
<script type="text/javascript">
/*

id,name 작명시
id와 name 은 동일하게
서치부분은 srch-input-컬럼명(카멜케이스 형식으로 ex)apcNm)
상세부분은 dtl-input-컬럼명
다른곳에서 그렇게 사용중입니다
가급적 지켜줘야 변경할 부분이 적어집니다
컬럼값이 없다면 고유값으로 명명할것

팝업 추가시 id,name 값은 고유 값이 여야함 겹치면 안됩니다.
sb그리드 sbUx 에서는 id 가 없으면 name 값을 기준으로 작동함 고유값으로 해야합니다.
동일한 값으로 할시 문제가 발생합니다.

참조 사이트
sbux
https://sbux.co.kr/document/sbux
sbgird
tps://sbgrid.co.kr/v2_5/document/guide

*/

	window.addEventListener('DOMContentLoaded', function(e) {
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		fn_init();
		fn_initSBSelect();
		fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		fn_uoListGrid();//품목그리드
		fn_initSBSelect();
		fn_dtlSearch();
	</c:if>
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

	//2차승인구분
	var selectEvCertYn = [
		{'text': '승인','label': '승인', 'value': '1'},
		{'text': '대기중','label': '대기중', 'value': '2'}
	];

	//경영체여부
	var jsonComMngmstYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'Y'}
	];

	//경영체여부
	var jsonComItemNhBrofYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'Y'}
	];

	//참여조직여부
	var selectApoSe = [
		{'text': 'Y','label': 'Y', 'value': '1'},
		{'text': 'N','label': 'N', 'value': '2'}
	];
	//통합조직,출하조직
	var jsonComApoSe = [
		{'text': '통합조직','label': '통합조직', 'value': '1'},
		{'text': '출자출하조직','label': '출자출하조직', 'value': '2'}
	];
	//승인여부
	var jsonComEvCertYn = [
		{'text': '승인','label': '승인', 'value': 'Y'},
		{'text': '미승인','label': '미승인', 'value': 'N'}
	];

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
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
			//상세
			gfn_setComCdSBSelect('dtl-input-cmptnInst', 	jsonComCmptnInst, 	'C90'), //관할기관
			gfn_setComCdSBSelect('dtl-input-ctpv', 			jsonComCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('dtl-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),	 //시군
			gfn_setComCdSBSelect('dtl-input-corpSeCd', 		jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('dtl-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP') //법인형태
			//gfn_setComCdSBSelect('srch-input-evCertYn', 	jsonCom, 	''), //2차승인구분
			//gfn_setComCdSBSelect('srch-input-apoSe', 	jsonCom, 	''), //참여조직여부
		]);
		console.log("============fn_initSBSelect=====1=======");
	}

	var jsonPrdcrCrclOgnMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrCrclOgnMng; //그리드 객체


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		//그리드 생성
		fn_fcltMngCreateGrid();
		fn_uoListGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrCrclOgnMng';
	    SBGridProperties.id = 'grdPrdcrCrclOgnMng';
	    SBGridProperties.jsonref = 'jsonPrdcrCrclOgnMng';
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
	    	{caption: ["APO_CD"], 	ref: 'apoCd',   	hidden : false, width:'60px',style:'text-align:center' },
	    	{caption: ["조직구분"], 		ref: 'apoSe',   	type:'combo',  width:'120px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComApoSe', label:'label', value:'value', displayui : false}},
	        {caption: ["법인구분"], 		ref: 'corpSeCd',   	type:'combo',  width:'120px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComCorpSeCd', label:'label', value:'value', displayui : false}},
	        {caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComSgg', label:'label', value:'value', displayui : false}},
	        {caption: ["법인명"], 		ref: 'corpNm',   	type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["대표자명"], 		ref: 'rprsvFlnm',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'160px',    style:'text-align:center'
	        	//,typeinfo : {mask: {alias : '999-99-99999'}}
	        },
	        {caption: ["전화번호"], 		ref: 'rprsvTelno',   	type:'output',  width:'160px',    style:'text-align:center'
	        	,typeinfo : {mask: {alias : '999-9999-9999'}}},
	        {caption: ["2차승인구분"], 	ref: 'evCertYn',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComEvCertYn', label:'label', value:'value', displayui : false}},

	        //{caption: ["참여조직여부"], 	ref: 'apoSe',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		//,typeinfo : {ref:'selectApoSe', label:'label', value:'value', displayui : false}},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'80px',    style:'text-align:center'},

	        {caption: ["상세내역"], 	ref: 'uoBrno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'mngmstInfoId',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'mngmstYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'nonghyupCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'cmptnInst',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'zip',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'lotnoAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'lotnoDtlAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'roadNmAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'roadNmDtlAddr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpSeCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpDtlSeCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'corpFndnDay',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'isoHldYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstExpndFrmerNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'invstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'frmerInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrGrpInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'locgovInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'etcInvstAmt',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rgllbrNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'dwNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'dlbrrNope',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rprsvFlnm',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rprsvTelno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rprsvMoblno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'rprsvEml',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'picPosition',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'picFlnm',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'picTelno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'picMoblno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'picEml',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'fxno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'itemNhBrofYn',   	hidden : true}
	    ];

	    grdPrdcrCrclOgnMng = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
	    grdPrdcrCrclOgnMng.bind('click','fn_view');
	    grdPrdcrCrclOgnMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}

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
	    	{caption: ["통합조직코드"], 		ref: 'uoApoCd',		hidden : true},
	        {caption: ["통합조직명"], 			ref: 'uoCorpNm',	type:'output',  width:'400px',    style:'text-align:center'},
	        {caption: ["통합조직 사업자번호"], 	ref: 'uoBrno',		type:'output',  width:'400px',    style:'text-align:center'},
	        {caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdUoList\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdUoList\", " + nRow + ")'>삭제</button>";
	        	}
	        }}
	    ];

	    grdUoList = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
	    grdUoList.bind('click','gridUoListClick');
	}

	/**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdPrdcrCrclOgnMng.getPageSize();
    	let pageNo = 1;
		//입력폼 초기화
    	fn_clearForm();

    	fn_setGrdFcltList(pageSize, pageNo);
    }

	const fn_pagingBbsList = async function() {
    	let recordCountPerPage = grdPrdcrCrclOgnMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPrdcrCrclOgnMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltList(recordCountPerPage, currentPageNo);
    }



	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//
		let sgg = SBUxMethod.get("srch-input-sgg");//
		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//
		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//
		let apoSe = SBUxMethod.get("srch-input-apoSe");//

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnMngList.do", {
    		cmptnInst : cmptnInst
    		,ctpv : ctpv
    		,sgg : sgg
    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd
    		,brno : brno
    		,corpNm : corpNm
    		,apoSe : apoSe

    		,pagingYn : 'Y'
			,currentPageNo : pageNo
 		  	,recordCountPerPage : pageSize

		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrCrclOgnMngVO = {
						apoSe: item.apoSe
						,apoCd: item.apoCd
						,uoBrno: item.uoBrno
						,corpNm: item.corpNm
						,crno: item.crno
						,brno: item.brno
						,mngmstInfoId: item.mngmstInfoId
						,mngmstYn: item.mngmstYn
						,nonghyupCd: item.nonghyupCd
						,cmptnInst: item.cmptnInst
						,ctpv: item.ctpv
						,sgg: item.sgg
						,zip: item.zip
						,lotnoAddr: item.lotnoAddr
						,lotnoDtlAddr: item.lotnoDtlAddr
						,roadNmAddr: item.roadNmAddr
						,roadNmDtlAddr: item.roadNmDtlAddr
						,corpSeCd: item.corpSeCd
						,corpDtlSeCd: item.corpDtlSeCd
						,corpFndnDay: item.corpFndnDay
						,isoHldYn: item.isoHldYn
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
						,rprsvFlnm: item.rprsvFlnm
						,rprsvTelno: item.rprsvTelno
						,rprsvMoblno: item.rprsvMoblno
						,rprsvEml: item.rprsvEml
						,picPosition: item.picPosition
						,picFlnm: item.picFlnm
						,picTelno: item.picTelno
						,picMoblno: item.picMoblno
						,picEml: item.picEml
						,fxno: item.fxno
						,itemNhBrofYn: item.itemNhBrofYn
						,evCertYn: item.evCertYn
				}
				jsonPrdcrCrclOgnMng.push(PrdcrCrclOgnMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonPrdcrCrclOgnMng.length > 0) {

        		if(grdPrdcrCrclOgnMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdPrdcrCrclOgnMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdPrdcrCrclOgnMng.rebuild();
				}else{
					grdPrdcrCrclOgnMng.refresh()
				}
        	} else {
        		grdPrdcrCrclOgnMng.setPageTotalCount(totalRecordCount);
        		grdPrdcrCrclOgnMng.rebuild();
        	}
        	document.querySelector('#listCount').innerText = totalRecordCount;

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	/* Grid Row 조회 기능*/
	const fn_dtlSearch = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnMngList.do", {
    		brno : brno
		});
        let data = await postJsonPromise;
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))
        		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))
        		SBUxMethod.set('dtl-input-uoBrno',gfn_nvl(item.uoBrno))
        		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))
        		SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))
        		SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))
        		SBUxMethod.set('dtl-input-mngmstInfoId',gfn_nvl(item.mngmstInfoId))
        		SBUxMethod.set('dtl-input-mngmstYn',gfn_nvl(item.mngmstYn))
        		SBUxMethod.set('dtl-input-nonghyupCd',gfn_nvl(item.nonghyupCd))
        		SBUxMethod.set('dtl-input-cmptnInst',gfn_nvl(item.cmptnInst))
        		SBUxMethod.set('dtl-input-ctpv',gfn_nvl(item.ctpv))
        		SBUxMethod.set('dtl-input-sgg',gfn_nvl(item.sgg))
        		SBUxMethod.set('dtl-input-zip',gfn_nvl(item.zip))
        		SBUxMethod.set('dtl-input-lotnoAddr',gfn_nvl(item.lotnoAddr))
        		SBUxMethod.set('dtl-input-lotnoDtlAddr',gfn_nvl(item.lotnoDtlAddr))
        		SBUxMethod.set('dtl-input-roadNmAddr',gfn_nvl(item.roadNmAddr))
        		SBUxMethod.set('dtl-input-roadNmDtlAddr',gfn_nvl(item.roadNmDtlAddr))
        		SBUxMethod.set('dtl-input-corpSeCd',gfn_nvl(item.corpSeCd))
        		SBUxMethod.set('dtl-input-corpDtlSeCd',gfn_nvl(item.corpDtlSeCd))
        		SBUxMethod.set('dtl-input-corpFndnDay',gfn_nvl(item.corpFndnDay))
        		SBUxMethod.set('dtl-input-corpFndnDay01',gfn_nvl(item.corpFndnDay))
        		SBUxMethod.set('dtl-input-isoHldYn',gfn_nvl(item.isoHldYn))
        		SBUxMethod.set('dtl-input-invstNope',gfn_nvl(item.invstNope))
        		SBUxMethod.set('dtl-input-invstExpndFrmerNope',gfn_nvl(item.invstExpndFrmerNope))
        		SBUxMethod.set('dtl-input-invstAmt',gfn_nvl(item.invstAmt))
        		SBUxMethod.set('dtl-input-frmerInvstAmt',gfn_nvl(item.frmerInvstAmt))
        		SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',gfn_nvl(item.prdcrGrpInvstAmt))
        		SBUxMethod.set('dtl-input-locgovInvstAmt',gfn_nvl(item.locgovInvstAmt))
        		SBUxMethod.set('dtl-input-etcInvstAmt',gfn_nvl(item.etcInvstAmt))
        		SBUxMethod.set('dtl-input-rgllbrNope',gfn_nvl(item.rgllbrNope))
        		SBUxMethod.set('dtl-input-dwNope',gfn_nvl(item.dwNope))
        		SBUxMethod.set('dtl-input-dlbrrNope',gfn_nvl(item.dlbrrNope))
        		SBUxMethod.set('dtl-input-rprsvFlnm',gfn_nvl(item.rprsvFlnm))
        		SBUxMethod.set('dtl-input-rprsvTelno',gfn_nvl(item.rprsvTelno))
        		SBUxMethod.set('dtl-input-rprsvMoblno',gfn_nvl(item.rprsvMoblno))
        		SBUxMethod.set('dtl-input-rprsvEml',gfn_nvl(item.rprsvEml))
        		SBUxMethod.set('dtl-input-picPosition',gfn_nvl(item.picPosition))
        		SBUxMethod.set('dtl-input-picFlnm',gfn_nvl(item.picFlnm))
        		SBUxMethod.set('dtl-input-picTelno',gfn_nvl(item.picTelno))
        		SBUxMethod.set('dtl-input-picMoblno',gfn_nvl(item.picMoblno))
        		SBUxMethod.set('dtl-input-picEml',gfn_nvl(item.picEml))
        		SBUxMethod.set('dtl-input-fxno',gfn_nvl(item.fxno))
        		SBUxMethod.set('dtl-input-itemNhBrofYn',gfn_nvl(item.itemNhBrofYn))
			});
        	fn_searchUoList();
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

    	var mngmstInfoId = SBUxMethod.get('dtl-input-mngmstInfoId')//
		var mngmstYn = SBUxMethod.get('dtl-input-mngmstYn')//
    	console.log(mngmstInfoId);
    	console.log(mngmstYn);
    	let apoCd = SBUxMethod.get("dtl-input-apoCd");
    	//필수값 체크
    	//fn_checkRequiredInput();

    	if (gfn_isEmpty(apoCd)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}
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

   	 	const postJsonPromise = gfn_postJSON("/pd/bsm/insertPrdcrCrclOgnMng.do", {
	   	 	apoSe: SBUxMethod.get('dtl-input-apoSe')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,corpNm: SBUxMethod.get('dtl-input-corpNm')//
			,crno: SBUxMethod.get('dtl-input-crno')//
			,brno: SBUxMethod.get('dtl-input-brno')//
			,mngmstInfoId: SBUxMethod.get('dtl-input-mngmstInfoId')//
			,mngmstYn: SBUxMethod.get('dtl-input-mngmstYn')//
			,nonghyupCd: SBUxMethod.get('dtl-input-nonghyupCd')//
			,cmptnInst: SBUxMethod.get('dtl-input-cmptnInst')//
			,ctpv: SBUxMethod.get('dtl-input-ctpv')//
			,sgg: SBUxMethod.get('dtl-input-sgg')//
			,zip: SBUxMethod.get('dtl-input-zip')//
			,lotnoAddr: SBUxMethod.get('dtl-input-lotnoAddr')//
			,lotnoDtlAddr: SBUxMethod.get('dtl-input-lotnoDtlAddr')//
			,roadNmAddr: SBUxMethod.get('dtl-input-roadNmAddr')//
			,roadNmDtlAddr: SBUxMethod.get('dtl-input-roadNmDtlAddr')//
			,corpSeCd: SBUxMethod.get('dtl-input-corpSeCd')//
			,corpDtlSeCd: SBUxMethod.get('dtl-input-corpDtlSeCd')//
			,corpFndnDay: SBUxMethod.get('dtl-input-corpFndnDay')//
			,isoHldYn: SBUxMethod.get('dtl-input-isoHldYn')//
			,invstNope: SBUxMethod.get('dtl-input-invstNope')//
			,invstExpndFrmerNope: SBUxMethod.get('dtl-input-invstExpndFrmerNope')//
			,invstAmt: SBUxMethod.get('dtl-input-invstAmt')//
			,frmerInvstAmt: SBUxMethod.get('dtl-input-frmerInvstAmt')//
			,prdcrGrpInvstAmt: SBUxMethod.get('dtl-input-prdcrGrpInvstAmt')//
			,locgovInvstAmt: SBUxMethod.get('dtl-input-locgovInvstAmt')//
			,etcInvstAmt: SBUxMethod.get('dtl-input-etcInvstAmt')//
			,rgllbrNope: SBUxMethod.get('dtl-input-rgllbrNope')//
			,dwNope: SBUxMethod.get('dtl-input-dwNope')//
			,dlbrrNope: SBUxMethod.get('dtl-input-dlbrrNope')//
			,rprsvFlnm: SBUxMethod.get('dtl-input-rprsvFlnm')//
			,rprsvTelno: SBUxMethod.get('dtl-input-rprsvTelno')//
			,rprsvMoblno: SBUxMethod.get('dtl-input-rprsvTelno')//
			,rprsvEml: SBUxMethod.get('dtl-input-rprsvEml')//
			,picPosition: SBUxMethod.get('dtl-input-picPosition')//
			,picFlnm: SBUxMethod.get('dtl-input-picFlnm')//
			,picTelno: SBUxMethod.get('dtl-input-picTelno')//
			,picMoblno: SBUxMethod.get('dtl-input-picMoblno')//
			,picEml: SBUxMethod.get('dtl-input-picEml')//
			,fxno: SBUxMethod.get('dtl-input-fxno')//
			,itemNhBrofYn: SBUxMethod.get('dtl-input-itemNhBrofYn')//
		});

        const data = await postJsonPromise;
        console.log("insert result", data);

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		let gridData = grdUoList.getGridDataAll();
				if(gridData.length > 1){
					fn_uoListMultiSave();
				}else{
					alert("처리 되었습니다.");
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					fn_search();
				</c:if>
				}
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

		const postJsonPromise = gfn_postJSON("/pd/bsm/updatePrdcrCrclOgnMng.do", {
			apoSe: SBUxMethod.get('dtl-input-apoSe')//
			,apoCd: SBUxMethod.get('dtl-input-apoCd')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,corpNm: SBUxMethod.get('dtl-input-corpNm')//
			,crno: SBUxMethod.get('dtl-input-crno')//
			,brno: SBUxMethod.get('dtl-input-brno')//
			,mngmstInfoId: SBUxMethod.get('dtl-input-mngmstInfoId')//
			,mngmstYn: SBUxMethod.get('dtl-input-mngmstYn')//
			,nonghyupCd: SBUxMethod.get('dtl-input-nonghyupCd')//
			,cmptnInst: SBUxMethod.get('dtl-input-cmptnInst')//
			,ctpv: SBUxMethod.get('dtl-input-ctpv')//
			,sgg: SBUxMethod.get('dtl-input-sgg')//
			,zip: SBUxMethod.get('dtl-input-zip')//
			,lotnoAddr: SBUxMethod.get('dtl-input-lotnoAddr')//
			,lotnoDtlAddr: SBUxMethod.get('dtl-input-lotnoDtlAddr')//
			,roadNmAddr: SBUxMethod.get('dtl-input-roadNmAddr')//
			,roadNmDtlAddr: SBUxMethod.get('dtl-input-roadNmDtlAddr')//
			,corpSeCd: SBUxMethod.get('dtl-input-corpSeCd')//
			,corpDtlSeCd: SBUxMethod.get('dtl-input-corpDtlSeCd')//
			,corpFndnDay: SBUxMethod.get('dtl-input-corpFndnDay')//
			,isoHldYn: SBUxMethod.get('dtl-input-isoHldYn')//
			,invstNope: SBUxMethod.get('dtl-input-invstNope')//
			,invstExpndFrmerNope: SBUxMethod.get('dtl-input-invstExpndFrmerNope')//
			,invstAmt: SBUxMethod.get('dtl-input-invstAmt')//
			,frmerInvstAmt: SBUxMethod.get('dtl-input-frmerInvstAmt')//
			,prdcrGrpInvstAmt: SBUxMethod.get('dtl-input-prdcrGrpInvstAmt')//
			,locgovInvstAmt: SBUxMethod.get('dtl-input-locgovInvstAmt')//
			,etcInvstAmt: SBUxMethod.get('dtl-input-etcInvstAmt')//
			,rgllbrNope: SBUxMethod.get('dtl-input-rgllbrNope')//
			,dwNope: SBUxMethod.get('dtl-input-dwNope')//
			,dlbrrNope: SBUxMethod.get('dtl-input-dlbrrNope')//
			,rprsvFlnm: SBUxMethod.get('dtl-input-rprsvFlnm')//
			,rprsvTelno: SBUxMethod.get('dtl-input-rprsvTelno')//
			,rprsvMoblno: SBUxMethod.get('dtl-input-rprsvMoblno')//
			,rprsvEml: SBUxMethod.get('dtl-input-rprsvEml')//
			,picPosition: SBUxMethod.get('dtl-input-picPosition')//
			,picFlnm: SBUxMethod.get('dtl-input-picFlnm')//
			,picTelno: SBUxMethod.get('dtl-input-picTelno')//
			,picMoblno: SBUxMethod.get('dtl-input-picMoblno')//
			,picEml: SBUxMethod.get('dtl-input-picEml')//
			,fxno: SBUxMethod.get('dtl-input-fxno')//
			,itemNhBrofYn: SBUxMethod.get('dtl-input-itemNhBrofYn')//
			,tot: SBUxMethod.get('dtl-input-tot')//
			,frmerInvstAmtRt: SBUxMethod.get('dtl-input-frmerInvstAmtRt')//
   		});

		const data = await postJsonPromise;
		console.log("update result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				let gridData = grdUoList.getGridDataAll();
				if(gridData.length > 1){
					fn_uoListMultiSave();
				}else{
					alert("처리 되었습니다.");
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					fn_search();
				</c:if>
				}
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {

		}

   }

  	//사업자번호 조회 팝업
  	const fn_choiceBrno = function() {
  		console.log("======fn_choiceBrno=======");
  		popBrno.init(fn_setBrno);
  	}
  	//사업자번호 조회 팝업 콜백함수
  	const fn_setBrno = function(rowData) {
  		if (!gfn_isEmpty(rowData)) {
  			SBUxMethod.set("dtl-input-brno", rowData.brno);
  			SBUxMethod.set("dtl-input-corpNm", rowData.corpNm);
  		}
  	}

	//경영체조회 팝업
	const fn_choiceMngmstInfoId = function() {
		console.log("======dd=======");
		popMngmstInfoId.init(fn_setMngmstInfoId);
	}
	//경영체조회 팝업 콜백함수
	//법인명,사업자번호,경영체번호
	const fn_setMngmstInfoId = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("dtl-input-mngmstInfoId", rowData.mngmstRegno);//경영체번호
			SBUxMethod.set("dtl-input-mngmstYn", 'Y');//경영체여부
			SBUxMethod.set("dtl-input-corpNm", rowData.admstOwnrCorpNm);//법인명
			SBUxMethod.set("dtl-input-brno", rowData.brno);				//사업자등록번호
		}
	}


	//그리드 클릭시 상세보기 이벤트
	function fn_view() {
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrCrclOgnMng.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdPrdcrCrclOgnMng.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdPrdcrCrclOgnMng.getRowData(nRow);

		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//
		SBUxMethod.set('dtl-input-uoBrno',gfn_nvl(rowData.uoBrno))//
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//
		SBUxMethod.set('dtl-input-mngmstInfoId',gfn_nvl(rowData.mngmstInfoId))//
		SBUxMethod.set('dtl-input-mngmstYn',gfn_nvl(rowData.mngmstYn))//
		SBUxMethod.set('dtl-input-nonghyupCd',gfn_nvl(rowData.nonghyupCd))//
		SBUxMethod.set('dtl-input-cmptnInst',gfn_nvl(rowData.cmptnInst))//
		SBUxMethod.set('dtl-input-ctpv',gfn_nvl(rowData.ctpv))//
		SBUxMethod.set('dtl-input-sgg',gfn_nvl(rowData.sgg))//
		SBUxMethod.set('dtl-input-zip',gfn_nvl(rowData.zip))//
		SBUxMethod.set('dtl-input-lotnoAddr',gfn_nvl(rowData.lotnoAddr))//
		SBUxMethod.set('dtl-input-lotnoDtlAddr',gfn_nvl(rowData.lotnoDtlAddr))//
		SBUxMethod.set('dtl-input-roadNmAddr',gfn_nvl(rowData.roadNmAddr))//
		SBUxMethod.set('dtl-input-roadNmDtlAddr',gfn_nvl(rowData.roadNmDtlAddr))//
		SBUxMethod.set('dtl-input-corpSeCd',gfn_nvl(rowData.corpSeCd))//
		SBUxMethod.set('dtl-input-corpDtlSeCd',gfn_nvl(rowData.corpDtlSeCd))//
		SBUxMethod.set('dtl-input-corpFndnDay',gfn_nvl(rowData.corpFndnDay))//
		SBUxMethod.set('dtl-input-corpFndnDay01',gfn_nvl(rowData.corpFndnDay))//
		SBUxMethod.set('dtl-input-isoHldYn',gfn_nvl(rowData.isoHldYn))//
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
		SBUxMethod.set('dtl-input-rprsvFlnm',gfn_nvl(rowData.rprsvFlnm))//
		SBUxMethod.set('dtl-input-rprsvTelno',gfn_nvl(rowData.rprsvTelno))//
		SBUxMethod.set('dtl-input-rprsvMoblno',gfn_nvl(rowData.rprsvMoblno))//
		SBUxMethod.set('dtl-input-rprsvEml',gfn_nvl(rowData.rprsvEml))//
		SBUxMethod.set('dtl-input-picPosition',gfn_nvl(rowData.picPosition))//
		SBUxMethod.set('dtl-input-picFlnm',gfn_nvl(rowData.picFlnm))//
		SBUxMethod.set('dtl-input-picTelno',gfn_nvl(rowData.picTelno))//
		SBUxMethod.set('dtl-input-picMoblno',gfn_nvl(rowData.picMoblno))//
		SBUxMethod.set('dtl-input-picEml',gfn_nvl(rowData.picEml))//
		SBUxMethod.set('dtl-input-fxno',gfn_nvl(rowData.fxno))//
		SBUxMethod.set('dtl-input-itemNhBrofYn',gfn_nvl(rowData.itemNhBrofYn))//

		if(rowData.apoSe == '1'){
			$("div.uoList").hide();
		}else{
			$("div.uoList").show();
			fn_searchUoList();
		}
		/*
		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(!gfn_isEmpty(apoCd)){
		}else{
			grdUoList.refresh();
			grdUoList.addRow();
		}
		*/

    }


	/* Grid Row 조회 기능*/
	const fn_searchUoList = async function(){

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let brno = SBUxMethod.get('dtl-input-brno');

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			apoCd : apoCd
			,brno : brno
		});
        let data = await postJsonPromise;
        try{
        	jsonUoList.length = 0;
        	//console.log("data==="+data);
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

        	//비어 있는 마지막 줄 추가용도?
        	grdUoList.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set('dtl-input-apoCd',null)//
		SBUxMethod.set('dtl-input-apoSe',null)//
		SBUxMethod.set('dtl-input-uoBrno',null)//
		SBUxMethod.set('dtl-input-corpNm',null)//
		SBUxMethod.set('dtl-input-crno',null)//
		SBUxMethod.set('dtl-input-brno',null)//
		SBUxMethod.set('dtl-input-mngmstInfoId',null)//
		SBUxMethod.set('dtl-input-mngmstYn',null)//
		SBUxMethod.set('dtl-input-nonghyupCd',null)//
		SBUxMethod.set('dtl-input-cmptnInst',null)//
		SBUxMethod.set('dtl-input-ctpv',null)//
		SBUxMethod.set('dtl-input-sgg',null)//
		SBUxMethod.set('dtl-input-zip',null)//
		SBUxMethod.set('dtl-input-lotnoAddr',null)//
		SBUxMethod.set('dtl-input-lotnoDtlAddr',null)//
		SBUxMethod.set('dtl-input-roadNmAddr',null)//
		SBUxMethod.set('dtl-input-roadNmDtlAddr',null)//
		SBUxMethod.set('dtl-input-corpSeCd',null)//
		SBUxMethod.set('dtl-input-corpDtlSeCd',null)//
		SBUxMethod.set('dtl-input-corpFndnDay',null)//
		SBUxMethod.set('dtl-input-isoHldYn',null)//
		SBUxMethod.set('dtl-input-invstNope',null)//
		SBUxMethod.set('dtl-input-invstExpndFrmerNope',null)//
		SBUxMethod.set('dtl-input-invstAmt',null)//
		SBUxMethod.set('dtl-input-frmerInvstAmt',null)//
		SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',null)//
		SBUxMethod.set('dtl-input-locgovInvstAmt',null)//
		SBUxMethod.set('dtl-input-etcInvstAmt',null)//
		SBUxMethod.set('dtl-input-rgllbrNope',null)//
		SBUxMethod.set('dtl-input-dwNope',null)//
		SBUxMethod.set('dtl-input-dlbrrNope',null)//
		SBUxMethod.set('dtl-input-rprsvFlnm',null)//
		SBUxMethod.set('dtl-input-rprsvTelno',null)//
		SBUxMethod.set('dtl-input-rprsvMoblno',null)//
		SBUxMethod.set('dtl-input-rprsvEml',null)//
		SBUxMethod.set('dtl-input-picPosition',null)//
		SBUxMethod.set('dtl-input-picFlnm',null)//
		SBUxMethod.set('dtl-input-picTelno',null)//
		SBUxMethod.set('dtl-input-picMoblno',null)//
		SBUxMethod.set('dtl-input-picEml',null)//
		SBUxMethod.set('dtl-input-fxno',null)//
		SBUxMethod.set('dtl-input-itemNhBrofYn',null)//
		$("div.uoList").hide();
		//출자출하조직이 속한 통합조직 리스트 입력 추가
		grdUoList.addRow();
    }

	const fn_clearForm = function() {

		SBUxMethod.set('dtl-input-apoCd',null)//
		SBUxMethod.set('dtl-input-apoSe',null)//
		SBUxMethod.set('dtl-input-uoBrno',null)//
		SBUxMethod.set('dtl-input-corpNm',null)//
		SBUxMethod.set('dtl-input-crno',null)//
		SBUxMethod.set('dtl-input-brno',null)//
		SBUxMethod.set('dtl-input-mngmstInfoId',null)//
		SBUxMethod.set('dtl-input-mngmstYn',null)//
		SBUxMethod.set('dtl-input-nonghyupCd',null)//
		SBUxMethod.set('dtl-input-cmptnInst',null)//
		SBUxMethod.set('dtl-input-ctpv',null)//
		SBUxMethod.set('dtl-input-sgg',null)//
		SBUxMethod.set('dtl-input-zip',null)//
		SBUxMethod.set('dtl-input-lotnoAddr',null)//
		SBUxMethod.set('dtl-input-lotnoDtlAddr',null)//
		SBUxMethod.set('dtl-input-roadNmAddr',null)//
		SBUxMethod.set('dtl-input-roadNmDtlAddr',null)//
		SBUxMethod.set('dtl-input-corpSeCd',null)//
		SBUxMethod.set('dtl-input-corpDtlSeCd',null)//
		SBUxMethod.set('dtl-input-corpFndnDay',null)//
		SBUxMethod.set('dtl-input-isoHldYn',null)//
		SBUxMethod.set('dtl-input-invstNope',null)//
		SBUxMethod.set('dtl-input-invstExpndFrmerNope',null)//
		SBUxMethod.set('dtl-input-invstAmt',null)//
		SBUxMethod.set('dtl-input-frmerInvstAmt',null)//
		SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',null)//
		SBUxMethod.set('dtl-input-locgovInvstAmt',null)//
		SBUxMethod.set('dtl-input-etcInvstAmt',null)//
		SBUxMethod.set('dtl-input-rgllbrNope',null)//
		SBUxMethod.set('dtl-input-dwNope',null)//
		SBUxMethod.set('dtl-input-dlbrrNope',null)//
		SBUxMethod.set('dtl-input-rprsvFlnm',null)//
		SBUxMethod.set('dtl-input-rprsvTelno',null)//
		SBUxMethod.set('dtl-input-rprsvMoblno',null)//
		SBUxMethod.set('dtl-input-rprsvEml',null)//
		SBUxMethod.set('dtl-input-picPosition',null)//
		SBUxMethod.set('dtl-input-picFlnm',null)//
		SBUxMethod.set('dtl-input-picTelno',null)//
		SBUxMethod.set('dtl-input-picMoblno',null)//
		SBUxMethod.set('dtl-input-picEml',null)//
		SBUxMethod.set('dtl-input-fxno',null)//
		SBUxMethod.set('dtl-input-itemNhBrofYn',null)//
		//출자출하조직이 속한 통합조직 리스트 초기화
		$("div.uoList").hide();
		grdUoList.rebuild();
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



	let selGridUoListRow;//선택한 행
	let selGridUoListCol;//선택한 열

    //그리드 클릭이벤트
    function gridUoListClick(){
		console.log("================gridClick================");
		//grdPrdcrCrclOgnReqClsMng 그리드 객체
        selGridUoListRow = grdUoList.getRow();
        selGridUoListCol = grdUoList.getCol();

        let delYnCol = grdUoList.getColRef('delYn');
        let delYnValue = grdUoList.getCellData(selGridUoListRow,delYnCol);

        //입력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //uoCorpNm 법인체명 uoBrno 사업자번호
        let uoCorpNmCol = grdUoList.getColRef('uoCorpNm');
        let uoBrnoCol = grdUoList.getColRef('uoBrno');

        if(selGridUoListRow == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직명,통합조직 사업자번호 일떄
        	if (selGridUoListCol == uoCorpNmCol || selGridUoListCol == uoBrnoCol){
        		console.log("");
        		//통합조직 선택 세팅
        		//통합조직 팝업 객체 popBrno
        		popBrno.init(fn_setGridMngmstInfoId);
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-brno
        		SBUxMethod.openModal('modal-brno');
        	}else{
        		return;
        	}
        }
    }

 	// 그리드의 통합조직선택 선택 팝업 콜백 함수
	const fn_setGridMngmstInfoId = function(rowData) {
		console.log("================fn_setGridMngmstInfoId================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridUoListRow 선택된 행 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let colRefIdx1 = grdUoList.getColRef('uoCorpNm');//ii 통합조직 인덱스
			let colRefIdx2 = grdUoList.getColRef('uoBrno');//ii 통합조직 코드 인덱스
			let colRefIdx3 = grdUoList.getColRef('uoApoCd');//ii 통합조직 코드 인덱스

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
		}
	}

	/* Grid Row 추가 및 삭제 기능*/
    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "grdUoList") {
            	grdUoList.setCellData(nRow, nCol, "N", true);
            	//grdUoList.setCellData(nRow, 5, gv_apcCd, true);
            	grdUoList.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdUoList") {
            	if(grdUoList.getRowStatus(nRow) == 0 || grdUoList.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var uoVO = grdUoList.getRowData(nRow);
            			fn_deleteRsrc(uoVO);
            			grdUoList.deleteRow(nRow);
            		}
            	}else{
            		grdUoList.deleteRow(nRow);
            	}
            }
        }
    }

	//출자출하조직이 속한 통합조직 리스트 업데이트
	const fn_uoListMultiSave = async function (){
		console.log("******************fn_uoListMultiSave**********************************");

		let gridData = grdUoList.getGridDataAll();
		let saveList = [];

		let isoBrno = SBUxMethod.get('dtl-input-brno')//
		let isoCorpNm = SBUxMethod.get('dtl-input-corpNm')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdUoList.getRowData(i);
			let rowSts = grdUoList.getRowStatus(i);
			console.log(i+"행 상태값 : "+rowSts);
			let uoBrno = rowData.uoBrno;
			let uoCorpNm = rowData.uoCorpNm;
			let uoApoCd = rowData.uoApoCd;
			let delYn = rowData.delYn;
			console.log(i+"행 uoApoCd : "+uoApoCd);
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

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveUoList.do", saveList);
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

	async function fn_deleteRsrc(uoVO){
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
	//농업인 출자 지분율 계산
	function fn_calFrmerInvstAmtRt(){
		let invstAmt = parseFloat(SBUxMethod.get('dtl-input-invstAmt'));
		let frmerInvstAmt = parseFloat(SBUxMethod.get('dtl-input-frmerInvstAmt'));
		let frmerInvstAmtRt = "";
		if(invstAmt != 0){
			frmerInvstAmtRt = frmerInvstAmt / invstAmt * 100
		}
		SBUxMethod.set('dtl-input-frmerInvstAmtRt',frmerInvstAmtRt);
	}
	//
	function fn_calTot(){
		let rgllbrNope = 0;
		if(!gfn_isEmpty(SBUxMethod.get('dtl-input-rgllbrNope'))){
			rgllbrNope = parseFloat(SBUxMethod.get('dtl-input-rgllbrNope'));
		}
		let dwNope = 0;
		if(!gfn_isEmpty(SBUxMethod.get('dtl-input-dwNope'))){
			dwNope = parseFloat(SBUxMethod.get('dtl-input-dwNope'));
		}
		let dlbrrNope = 0;
		if(!gfn_isEmpty(SBUxMethod.get('dtl-input-dlbrrNope'))){
			dlbrrNope = parseFloat(SBUxMethod.get('dtl-input-dlbrrNope'));
		}
		SBUxMethod.set('dtl-input-tot',rgllbrNope + dwNope + dlbrrNope);
	}
</script>
</html>