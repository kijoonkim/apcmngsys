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
					<!-- 산지조직관리 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
						<!--
						<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
						 -->
						<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>

						<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						</c:if>

						<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
					</c:if>
					<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
						<sbux-button id="btnSearchFclt01" name="btnSearchFclt01" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlSearch"></sbux-button>
						<sbux-button id="btnSaveFclt01" name="btnSaveFclt01" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
					</c:if>

				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
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
									onchange="fn_ctpvChange"
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
									filter-source-name="srch-input-ctpv"
									jsondata-filter="mastervalue"
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
									class="form-control input-sm srch-keyup-area"
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
									class="form-control input-sm srch-keyup-area"
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
								<span style="font-size:14px">▶검색리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnMng" style="height:350px; width: 100%;"></div>
				</div>
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
				<div class="uoList">
					<!-- <div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직이 속한 통합조직 리스트</span>
							</li>

							<li>
								<span style="font-size:12px">상세조회시 추가버튼이 생성됩니다</span>
							</li>
							<li>
								<span style="font-size:12px">추가 버튼을 누른후 통합조직명,사업자번호 위치 클릭시 팝업이 열립니다.</span>
							</li>

						</ul>
					</div> -->

					<div  class="ad_tbl_top">
						<p style="font-size:14px; color: #3c6dbc; text-align: left">▶ 출자출하조직이 속한 통합조직 리스트</p>

				    </div>


					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdUoList" style="height:150px; width: 100%; overflow-x: hidden"></div>
					<br>
				</div>


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
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe" class="form-control input-sm" autocomplete="off"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-corpDdlnSeCd" name="dtl-input-corpDdlnSeCd" class="form-control input-sm" autocomplete="off"></sbux-input>
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
									readonly
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
									readonly
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
									readonly
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>경영체등록여부</th>
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
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg">환코드</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-nonghyupCd"
									name="dtl-input-nonghyupCd"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>관할기관</th>
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
									unselected-text="선택"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>시도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="dtl-input-ctpv"
									name="dtl-input-ctpv"
									uitype="single"
									jsondata-ref="jsonComDtlCtpv"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_ctpvDtlChange"
								></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>시군</th>
							<td  colspan="3" class="td_input" >
								<sbux-select
									id="dtl-input-sgg"
									name="dtl-input-sgg"
									uitype="single"
									jsondata-ref="jsonComDtlSgg"
									unselected-text="선택"
									class="form-control input-sm"
									filter-source-name="dtl-input-ctpv"
									jsondata-filter="mastervalue"
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
									readonly
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" >
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
							<td colspan="6" class="td_input" >
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
							<th colspan="2" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>법인구분</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>법인형태</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>법인설립일</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>출자출하조직보유여부</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>출자자수</th>
							<th colspan="2" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>출자자중 농업인수</th>
							<th colspan="2" scope="row" class="th_bg"  style="text-align:center;"><span class="data_required" ></span>출자금액(천원)</th>
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
									unselected-text="선택"
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
									unselected-text="선택"
									class="form-control input-sm"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<!-- 법인설립일 -->
							<sbux-datepicker
									uitype="popup"
									id="dtl-input-corpFndnDay"
									name="dtl-input-corpFndnDay"
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
									unselected-text="선택"
									class="form-control input-sm"
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
									readonly
								></sbux-input>
								</td>
						</tr>
						<tr>
						<th colspan="12" style="text-align:center;" scope="row" class="th_bg  th_border_right">출자금세부현황</th>
						<th rowspan="2" colspan="2" scope="row" class="th_bg th_border_left"  style="text-align:center;"><span class="data_required" ></span>농업인 출자 지분율</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>농업인</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>생산자단체</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>지자체</th>
							<th colspan="3" scope="row" class="th_bg"  style="text-align:center;"><span class="data_required" ></span>기타</th>
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
									onchange="fn_calInvstAmtTot"
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
									onchange="fn_calInvstAmtTot"
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
									onchange="fn_calInvstAmtTot"
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
									onchange="fn_calInvstAmtTot"
								></sbux-input>
							</td>
							<td>천원</td>
							<!-- 농업인 출자비율 -->
							<td colspan="2"  >
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
							<th colspan="3" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>정규직</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>파견직</th>
							<th colspan="3" scope="row" class="th_bg th_border_right"  style="text-align:center;"><span class="data_required" ></span>일용직</th>
							<th colspan="3" scope="row" class="th_bg"  style="text-align:center;"><span class="data_required" ></span>합계</th>
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
							<th colspan="7" scope="row" class="th_bg th_border_right" style="text-align:center;">대표자 정보</th>
							<th colspan="8" scope="row" class="th_bg" style="text-align:center;">작성자 정보</th>
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
							<th colspan="7" scope="row" class="th_bg th_border_right">&nbsp;</th>
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
						<!-- 어그릭스 떄 사용 하던 잔재로 현재 쓰임새가 없어 숨김 처리 -->
						<tr style="display: none">
							<th colspan="7" scope="row" class="th_bg">품목농협 지소 여부</th>
							<td colspan="8">
							<sbux-select
									id="dtl-input-itemNhBrofYn"
									name="dtl-input-itemNhBrofYn"
									uitype="single"
									jsondata-ref="jsonComItemNhBrofYn"
									unselected-text="선택"
									class="form-control input-sm"
								></sbux-select>
								</td>
						</tr>
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
						<tr>
							<th colspan="7" scope="row" class="th_bg th_border_right">&nbsp;</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>선정년도</th>
							<td colspan="6">
							<sbux-spinner
									id="dtl-input-slctnYr"
									name="dtl-input-slctnYr"
									uitype="normal"
                					step-value="1"
                				></sbux-spinner>
								</td>
						</tr>
					</c:if>
					</tbody>
				</table>

			</div>
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
					</c:if>
					<c:if test="${loginVO.userType ne '02'}">
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</c:if>
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
	})

		/* 초기화면 로딩 기능*/
	const fn_init = async function() {
	//그리드 생성
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		fn_fcltMngCreateGrid();
		fn_uoListGrid();
	</c:if>
		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
		//통합조직인 경우
		<c:if test="${loginVO.userType eq '21'}">
		$(".uoList").hide();
		</c:if>
		//출하조직인 경우
		<c:if test="${loginVO.userType eq '22'}">
		await fn_uoListGrid();
		</c:if>
		await fn_dtlSearch();
	</c:if>
	}

	//2차승인구분
	var selectEvCertYn = [
		{'text': '승인','label': '승인', 'value': '1'},
		{'text': '대기중','label': '대기중', 'value': '2'}
	];

	//경영체등록여부
	var jsonComMngmstYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];

	//품목농협 지소 여부
	var jsonComItemNhBrofYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
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
	var jsonComDtlCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComDtlSgg = [];//시군
	var jsonGrdCtpv = [];//시도
	var jsonGrdSgg = [];//시군
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
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), 	//관할기관
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'CMPTN_INST_CTPV'), 	//시도
			gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 		'CMPTN_INST_SIGUN'),	 //시군
			gfn_setComCdSBSelect('grdPrdcrCrclOgnMng', 		jsonGrdSgg, 		'CMPTN_INST_SIGUN'),	 //시군
			gfn_setComCdSBSelect('grdPrdcrCrclOgnMng', 		jsonGrdCtpv, 		'CMPTN_INST_CTPV'), 	//시도
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), 		//법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 'CORP_SHAP'), 	//법인형태
			</c:if>
			//상세
			gfn_setComCdSBSelect('dtl-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 'CORP_SHAP'), 	//법인형태
			gfn_setComCdSBSelect('dtl-input-ctpv', 			jsonComDtlCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('dtl-input-sgg', 			jsonComDtlSgg, 		'CMPTN_INST_SIGUN'),	//시군


			gfn_setComCdSBSelect('grdPrdcrCrclOgnMng', 		jsonGrdSgg, 		'CMPTN_INST_SIGUN'),	//시군
			gfn_setComCdSBSelect('grdPrdcrCrclOgnMng', 		jsonGrdCtpv, 		'CMPTN_INST_CTPV'), 	//시도
			gfn_setComCdSBSelect('dtl-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), 	//관할기관
			gfn_setComCdSBSelect('dtl-input-corpSeCd', 		jsonComCorpSeCd, 	'CORP_SE_CD'), 		//법인구분
			//gfn_setComCdSBSelect('srch-input-evCertYn', 	jsonCom, 	''), //2차승인구분
			//gfn_setComCdSBSelect('srch-input-apoSe', 	jsonCom, 	''), //참여조직여부
		]);
	}

	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-input-sgg", "");
	}

	const fn_ctpvDtlChange = async function(){
		//SBUxMethod.set("dtl-input-sgg", null);
	}

	var jsonPrdcrCrclOgnMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrCrclOgnMng; //그리드 객체

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

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
	    	{caption: ["OGNZ_CD"], 	ref: 'ognzCd',   	hidden : false, width:'60px',style:'text-align:center' },
	    	{caption: ["조직구분"], 		ref: 'apoSe',   	type:'combo',  width:'120px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComApoSe', label:'label', value:'value', displayui : false}},
	        {caption: ["법인구분"], 		ref: 'corpSeCd',   	type:'combo',  width:'120px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComCorpSeCd', label:'label', value:'value', displayui : false}},
	        {caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonGrdSgg', label:'label', value:'value', displayui : false}},
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
	        {caption: ["상세내역"], 	ref: 'itemNhBrofYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'slctnYr',   	hidden : true}
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
	        {caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
	        	if(corpDdlnSeCd == 'Y'){
	        		return "";
	        	}
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdUoList\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdUoList\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["조직선택"], 			ref: 'sel',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
	        	if(corpDdlnSeCd == 'Y'){
	        		return "";
	        	}
	        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_openMaodalSelect(" + nRow + ")'>선택</button>";
	        }},
	    	{caption: ["통합조직코드"], 		ref: 'uoApoCd',		hidden : true},
	        {caption: ["통합조직명"], 			ref: 'uoCorpNm',	type:'output',  width:'400px',    style:'text-align:center'},
	        {caption: ["통합조직 사업자번호"], 	ref: 'uoBrno',		type:'output',  width:'400px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',	type:'output',     style:'text-align:center'}
	    ];

	    grdUoList = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
	    grdUoList.bind('click','gridUoListClick');
	}

	/**
     * 목록 조회
     */
    const fn_search = async function() {
		console.log("fn_search");
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

	const fn_report = async function() {
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//
		let sgg = SBUxMethod.get("srch-input-sgg");//
		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//
		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//
		let apoSe = SBUxMethod.get("srch-input-apoSe");//



		gfn_popClipReport("산지조직 관리", "pd/sanDoc1.crf", {
			cmptnInst 		: gfn_nvl(cmptnInst)
			, ctpv 			: gfn_nvl(ctpv)
			, sgg 			: gfn_nvl(sgg)
			,corpSeCd 		: gfn_nvl(corpSeCd)
			, corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			, brno 			: gfn_nvl(brno)
			, corpNm 		: gfn_nvl(corpNm)
			, apoSe 		: gfn_nvl(apoSe)
		});
	}

	const fn_report2 = async function() {


		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		var nRow = grdPrdcrCrclOgnMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdPrdcrCrclOgnMng.getRowData(nRow);

		let brno = rowData.brno
		</c:if>
		<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
		let brno = '${loginVO.brno}';
		</c:if>
		//debugger;

		gfn_popClipReport("산지조직 관리", "pd/sanDocAll.crf", {
			brno : gfn_nvl(brno)
		});
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
        	let totalRecordCount = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrCrclOgnMngVO = {
						apoSe: item.apoSe
						,apoCd: item.apoCd
						,ognzCd: item.ognzCd
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
						,slctnYr: item.slctnYr
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

	//사용자 화면 조회
	const fn_dtlSearch = async function(){
		let brno = '${loginVO.brno}';
		//SBUxMethod.set('dtl-input-brno',gfn_nvl(brno));
		if(gfn_isEmpty(brno)) return;

		//추후 등록 년도 관련 수정 할시 변경
		let now = new Date();
		let year = now.getFullYear();
		let yr = year;

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnMng.do", {
    		brno : brno
    		,yr : yr
		});
        let data = await postJsonPromise;
        let sgg;
        let corpDdlnSeCd;//법인체마감 확인
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		sgg = item.sgg;
        		corpDdlnSeCd = item.corpDdlnSeCd;
        		SBUxMethod.set('dtl-input-corpDdlnSeCd',gfn_nvl(item.corpDdlnSeCd))
        		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))
        		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))
        		SBUxMethod.set('dtl-input-uoBrno',gfn_nvl(item.uoBrno))
        		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))
        		SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))
        		SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))
        		SBUxMethod.set('dtl-input-mngmstInfoId',gfn_nvl(item.mngmstInfoId))
        		if(gfn_isEmpty(item.mngmstInfoId)){
        			SBUxMethod.set('dtl-input-mngmstYn','N')//
        		}else{
        			SBUxMethod.set('dtl-input-mngmstYn','Y')//
        		}
        		SBUxMethod.set('dtl-input-nonghyupCd',gfn_nvl(item.nonghyupCd))
        		SBUxMethod.set('dtl-input-cmptnInst',gfn_nvl(item.cmptnInst))

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

        		SBUxMethod.set('dtl-input-ctpv',gfn_nvl(item.ctpv));

			});

        	await gfn_setComCdSBSelect('dtl-input-sgg', 			jsonComDtlSgg, 		'CMPTN_INST_SIGUN');
    		await SBUxMethod.set('dtl-input-sgg',sgg);

        	let userType = '${loginVO.userType}';
        	let apoSe = SBUxMethod.get('dtl-input-apoSe');
        	if(userType == '21'){
    			userType = '1'
    		}else if(userType == '22'){
    			userType = '2'
    		}
    		//유저 권한과 데이터가 맞지 않는 경우 오류 처리
    		if(userType != apoSe){
    			alert("해당 계정의 권한과 기존데이터의 타입이 맞지 않습니다"+
    					"\n관리자에게 문의 해주세요");
    			$(".btn").hide();// 모든 버튼 숨기기
    			$(".uoList").hide();
    			SBUxMethod.clearAllData();//모든 데이터 클리어
    			return false;
    		}
    		if(corpDdlnSeCd == 'Y'){
    			//$(".btn").hide();// 모든 버튼 숨기기
    			//저장버튼만 숨김처리
    			$("#btnSaveFclt01").hide();
        		$("#btnSaveFclt1").hide();
    		}

        	fn_calInvstAmtTot();
    		fn_calTot();
        	<c:if test="${loginVO.userType eq '22'}">
        	fn_searchUoList();
    		</c:if>
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
    	if(!fn_checkRequiredInput()){
    		return false;
    	};

    	if (gfn_isEmpty(apoCd)) {
    		// 신규 등록 (회원가입할떄 자동 받음)
    		return;
			//fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}
    }

    function fn_checkRequiredInput(){
    	//레드닷 처리한 필수값들 확인
    	//W0001	{0}을/를 선택하세요.
		//W0002 : {0}을/를 입력하세요.

    	var corpNm = SBUxMethod.get("dtl-input-corpNm");
    	if(gfn_isEmpty(corpNm)){
    		gfn_comAlert("W0002", "법인명");
    		return false;
    	}
		/*
    	var crno = SBUxMethod.get("dtl-input-crno");
    	if(gfn_isEmpty(crno)){
    		gfn_comAlert("W0002", "법인등록번호");
    		return false;
    	}
    	*/

    	var brno = SBUxMethod.get("dtl-input-brno");
    	if(gfn_isEmpty(brno)){
    		gfn_comAlert("W0002", "사업자번호");
    		return false;
    	}
		/*
    	var mngmstYn = SBUxMethod.get("dtl-input-mngmstYn");
    	if(gfn_isEmpty(mngmstYn)){
    		gfn_comAlert("W0002", "경영체여부");
    		return false;
    	}
    	*/

    	var ctpv = SBUxMethod.get("dtl-input-cmptnInst");
    	if(gfn_isEmpty(ctpv)){
    		gfn_comAlert("W0001", "관할기관");
    		return false;
    	}

    	var ctpv = SBUxMethod.get("dtl-input-ctpv");
    	if(gfn_isEmpty(ctpv)){
    		gfn_comAlert("W0001", "시도");
    		return false;
    	}

    	var sgg = SBUxMethod.get("dtl-input-sgg");
    	if(gfn_isEmpty(sgg)){
    		gfn_comAlert("W0001", "시군");
    		return false;
    	}

    	var zip = SBUxMethod.get("dtl-input-zip");
    	if(gfn_isEmpty(zip)){
    		gfn_comAlert("W0002", "주소");
    		return false;
    	}

    	var corpSeCd = SBUxMethod.get("dtl-input-corpSeCd");
    	if(gfn_isEmpty(corpSeCd)){
    		gfn_comAlert("W0001", "법인구분");
    		return false;
    	}

    	var corpDtlSeCd = SBUxMethod.get("dtl-input-corpDtlSeCd");
    	if(gfn_isEmpty(corpDtlSeCd)){
    		gfn_comAlert("W0001", "법인형태");
    		return false;
    	}

    	var corpFndnDay = SBUxMethod.get("dtl-input-corpFndnDay");
    	if(gfn_isEmpty(corpFndnDay)){
    		gfn_comAlert("W0001", "법인설립일");
    		return false;
    	}

    	var isoHldYn = SBUxMethod.get("dtl-input-isoHldYn");
    	if(gfn_isEmpty(isoHldYn)){
    		gfn_comAlert("W0001", "출자출하조직여부");
    		return false;
    	}

    	var invstNope = SBUxMethod.get("dtl-input-invstNope");
    	if(gfn_isEmpty(invstNope)){
    		gfn_comAlert("W0002", "출자자수");
    		return false;
    	}

    	var invstExpndFrmerNope = SBUxMethod.get("dtl-input-invstExpndFrmerNope");
    	if(gfn_isEmpty(invstExpndFrmerNope)){
    		gfn_comAlert("W0002", "출자자중 농업인수");
    		return false;
    	}

    	var invstAmt = SBUxMethod.get("dtl-input-invstAmt");
    	if(gfn_isEmpty(invstAmt)){
    		gfn_comAlert("W0002", "출자금액");
    		return false;
    	}

    	var frmerInvstAmt = SBUxMethod.get("dtl-input-frmerInvstAmt");
    	if(gfn_isEmpty(frmerInvstAmt)){
    		gfn_comAlert("W0002", "출자금세부현황 농업인");
    		return false;
    	}

    	var prdcrGrpInvstAmt = SBUxMethod.get("dtl-input-prdcrGrpInvstAmt");
    	if(gfn_isEmpty(prdcrGrpInvstAmt)){
    		gfn_comAlert("W0002", "출자금세부현황 생산자단체");
    		return false;
    	}

    	var locgovInvstAmt = SBUxMethod.get("dtl-input-locgovInvstAmt");
    	if(gfn_isEmpty(locgovInvstAmt)){
    		gfn_comAlert("W0002", "출자금세부현황 지자체");
    		return false;
    	}

    	var etcInvstAmt = SBUxMethod.get("dtl-input-etcInvstAmt");
    	if(gfn_isEmpty(etcInvstAmt)){
    		gfn_comAlert("W0002", "출자금세부현황 기타");
    		return false;
    	}

    	var rgllbrNope = SBUxMethod.get("dtl-input-rgllbrNope");
    	if(gfn_isEmpty(rgllbrNope)){
    		gfn_comAlert("W0002", "종사자 수 정규직");
    		return false;
    	}

    	var dwNope = SBUxMethod.get("dtl-input-dwNope");
    	if(gfn_isEmpty(dwNope)){
    		gfn_comAlert("W0002", "종사자 수 파견직");
    		return false;
    	}

    	var dlbrrNope = SBUxMethod.get("dtl-input-dlbrrNope");
    	if(gfn_isEmpty(dlbrrNope)){
    		gfn_comAlert("W0002", "종사자 수 일용직");
    		return false;
    	}
    	//
    	var rprsvFlnm = SBUxMethod.get("dtl-input-rprsvFlnm");
    	if(gfn_isEmpty(rprsvFlnm)){
    		gfn_comAlert("W0002", "대표자 성명");
    		return false;
    	}

    	var rprsvTelno = SBUxMethod.get("dtl-input-rprsvTelno");
    	if(gfn_isEmpty(rprsvTelno)){
    		gfn_comAlert("W0002", "대표자 전화번호");
    		return false;
    	}

    	var rprsvMoblno = SBUxMethod.get("dtl-input-rprsvMoblno");
    	if(gfn_isEmpty(rprsvMoblno)){
    		gfn_comAlert("W0002", "대표자 핸드폰번호");
    		return false;
    	}
		/*
    	var rprsvEml = SBUxMethod.get("dtl-input-rprsvEml");
    	if(gfn_isEmpty(rprsvEml)){
    		gfn_comAlert("W0002", "대표자 이메일주소");
    		return false;
    	}
    	*/

    	var picFlnm = SBUxMethod.get("dtl-input-picFlnm");
    	if(gfn_isEmpty(picFlnm)){
    		gfn_comAlert("W0002", "작성자 성명");
    		return false;
    	}

    	var picPosition = SBUxMethod.get("dtl-input-picPosition");
    	if(gfn_isEmpty(picPosition)){
    		gfn_comAlert("W0002", "작성자 직위");
    		return false;
    	}

    	var picTelno = SBUxMethod.get("dtl-input-picTelno");
    	if(gfn_isEmpty(picTelno)){
    		gfn_comAlert("W0002", "작성자 전화번호");
    		return false;
    	}

    	var picMoblno = SBUxMethod.get("dtl-input-picMoblno");
    	if(gfn_isEmpty(picMoblno)){
    		gfn_comAlert("W0002", "작성자 핸드폰번호");
    		return false;
    	}

    	var picEml = SBUxMethod.get("dtl-input-picEml");
    	if(gfn_isEmpty(picEml)){
    		gfn_comAlert("W0002", "작성자 이메일주소");
    		return false;
    	}

    	var fxno = SBUxMethod.get("dtl-input-fxno");
    	if(gfn_isEmpty(fxno)){
    		gfn_comAlert("W0002", "작성자 팩스번호");
    		return false;
    	}
		/*
    	var itemNhBrofYn = SBUxMethod.get("dtl-input-itemNhBrofYn");
    	if(gfn_isEmpty(itemNhBrofYn)){
    		gfn_comAlert("W0001", "품목농협 지소 여부");
    		return false;
    	}
    	*/

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
        		console.log(gridData.length);
				if(gridData.length > 0){
					fn_uoListMultiSave();
				}else{
					alert("처리 되었습니다.");
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
					fn_search();
				</c:if>
				<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
					fn_dtlSearch();
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
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
			,slctnYr: SBUxMethod.get('dtl-input-slctnYr')//
		</c:if>

   		});

		const data = await postJsonPromise;
		console.log("update result", data);
		console.log(data.resultStatus);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				let apoSe = SBUxMethod.get('dtl-input-apoSe')//
				if(apoSe == '2'){
					let gridData = grdUoList.getGridDataAll();
					if(gridData.length > 0){
						fn_uoListMultiSave();
					}else{
						alert("처리 되었습니다.");
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
						fn_search();
					</c:if>
					<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
						fn_dtlSearch();
					</c:if>
					}
				}else{
					alert("처리 되었습니다.");
					fn_dtlSearch();
				}
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
			console.log(data.resultMessage);
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
		//계정 사업자번호
		let brno = '${loginVO.brno}';
		popMngmstInfoId.init(fn_setMngmstInfoId , brno);
	}
	//경영체조회 팝업 콜백함수
	//법인명,사업자번호,경영체번호
	const fn_setMngmstInfoId = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("dtl-input-mngmstInfoId", rowData.mngmstRegno);//경영체번호
			SBUxMethod.set("dtl-input-mngmstYn", 'Y');//경영체여부
			//SBUxMethod.set("dtl-input-corpNm", rowData.admstOwnrCorpNm);//법인명
			//SBUxMethod.set("dtl-input-brno", rowData.brno);				//사업자등록번호
		}
	}


	//그리드 클릭시 상세보기 이벤트
	const fn_view = async function (){
		console.log("******************fn_view**********************************");
		fn_clearForm();
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
		if(gfn_isEmpty(rowData.mngmstInfoId)){
			SBUxMethod.set('dtl-input-mngmstYn','N')//
		}else{
			SBUxMethod.set('dtl-input-mngmstYn','Y')//
		}
		SBUxMethod.set('dtl-input-nonghyupCd',gfn_nvl(rowData.nonghyupCd))//
		SBUxMethod.set('dtl-input-cmptnInst',gfn_nvl(rowData.cmptnInst))//

		//SBUxMethod.set('dtl-input-ctpv',gfn_nvl(rowData.ctpv))//
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
		SBUxMethod.set('dtl-input-slctnYr',gfn_nvl(rowData.slctnYr))//

		SBUxMethod.set('dtl-input-ctpv',gfn_nvl(rowData.ctpv));
		await gfn_setComCdSBSelect('dtl-input-sgg', 			jsonComDtlSgg, 		'CMPTN_INST_SIGUN');
		await SBUxMethod.set('dtl-input-sgg',gfn_nvl(rowData.sgg));

		fn_calInvstAmtTot();
		fn_calTot();

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

        	//비어 있는 마지막 줄 추가용도
        	let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
        	if(corpDdlnSeCd != 'Y'){
        		grdUoList.addRow();
        	}
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
		SBUxMethod.set('dtl-input-mngmstYn','N')//
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
		SBUxMethod.set('dtl-input-mngmstYn','N')//
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

    //그리드 클릭이벤트
    function gridUoListClick(){
		console.log("================gridUoListClick================");
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

    function fn_openMaodalSelect(nRow){
    	let delYnCol = grdUoList.getColRef('delYn');
        let delYnValue = grdUoList.getCellData(nRow,delYnCol);
		if(delYnValue == '' || delYnValue == null){
			return
		}
    	grdUoList.setRow(nRow);
    	popBrno.init(fn_setGridMngmstInfoId);
		SBUxMethod.openModal('modal-brno');
    }

 	// 그리드의 통합조직선택 선택 팝업 콜백 함수
	const fn_setGridMngmstInfoId = function(rowData) {
		console.log("================fn_setGridMngmstInfoId================");
		console.log(rowData);
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
	//업데이트가 존재할 필요가 없음
	const fn_uoListMultiSave = async function (){
		console.log("******************fn_uoListMultiSave**********************************");

		let gridData = grdUoList.getGridDataAll();
		let saveList = [];

		let isoBrno = SBUxMethod.get('dtl-input-brno')//
		let isoCorpNm = SBUxMethod.get('dtl-input-corpNm')//

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdUoList.getRowData(i);
			let rowSts = grdUoList.getRowStatus(i);
			//console.log(i+"행 상태값 : "+rowSts);
			let uoBrno = rowData.uoBrno;
			let uoCorpNm = rowData.uoCorpNm;
			let uoApoCd = rowData.uoApoCd;
			let delYn = rowData.delYn;
			//console.log(i+"행 uoApoCd : "+uoApoCd);
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
			//출자출하조직이 속한리스트 의 메세지 인데 오해의 소지가 있음
			//gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			gfn_comAlert("I0001") // 변경 대상이 없어도 처리 됬습니다 띄우기로 함
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveUoList.do", saveList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
        	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
				fn_search();
			</c:if>
			<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
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
	//출자금액 합계
	function fn_calInvstAmtTot(){

		let frmerInvstAmt = parseFloat(SBUxMethod.get('dtl-input-frmerInvstAmt'));
		let prdcrGrpInvstAmt = parseFloat(SBUxMethod.get('dtl-input-prdcrGrpInvstAmt'));
		let locgovInvstAmt = parseFloat(SBUxMethod.get('dtl-input-locgovInvstAmt'));
		let etcInvstAmt = parseFloat(SBUxMethod.get('dtl-input-etcInvstAmt'));

		let invstAmt = frmerInvstAmt + prdcrGrpInvstAmt + locgovInvstAmt + etcInvstAmt;
		SBUxMethod.set('dtl-input-invstAmt',invstAmt);
		fn_calFrmerInvstAmtRt();
	}

	//전체 종사자 수 합계
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