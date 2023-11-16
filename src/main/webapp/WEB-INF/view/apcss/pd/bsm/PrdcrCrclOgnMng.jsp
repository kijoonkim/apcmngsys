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
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
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
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-cmptnInst"
									name="srch-input-cmptnInst"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >시도</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-ctpv"
									name="srch-input-ctpv"
									uitype="single"
									jsondata-ref="jsonDSFA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">시군</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-sgg"
									name="srch-input-sgg"
									uitype="single"
									jsondata-ref="jsonDSSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">법인구분</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-corpSeCd"
									name="srch-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
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
									jsondata-ref="jsonDSA"
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
									id="srch-input-ii"
									name="srch-input-ii"
									uitype="single"
									jsondata-ref="jsonDSA"
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
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="3" class="td_input">
							</td>
						</tr>

					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<table class="table table-bordered tbl_fixed">
					<caption>경영체,통합조직 팝업</caption>
					<tbody>
						<tr>
							<td colspan="2" scope="row" class="th_bg"  style="text-align:center;">경영체번호</td>
							<td style="border-right:hidden;">
								<sbux-button id="srch-btn-mngmstInfoId" name="srch-btn-mngmstInfoId" uitype="modal" target-id="modal-mngmstInfoId" onclick="fn_choiceMngmstInfoId" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th colspan="3" scope="row" class="th_bg"  style="text-align:center;"><span class="data_required" ></span>출자출하조직이 속한 통합조직 사업자번호</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-uoNm"
									name="dtl-input-uoNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-uoBrno"
									name="dtl-input-uoBrno"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td style="border-right:hidden;">
								<sbux-button id="srch-btn-brno" name="srch-btn-brno" uitype="modal" target-id="modal-brno" onclick="fn_choiceBrno" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
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
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd" class="form-control input-sm" autocomplete="off"></sbux-input>
							<th colspan="15" scope="row" class="th_bg"  style="text-align:center;">업체정보</th>
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
								<sbux-input
									uitype="text"
									id="dtl-input-mngmstYn"
									name="dtl-input-mngmstYn"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
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
								<sbux-input
									uitype="text"
									id="dtl-input-cmptnInst"
									name="dtl-input-cmptnInst"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>시도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="dtl-input-ctpv"
									name="dtl-input-ctpv"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg">시군</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-sgg"
									name="dtl-input-sgg"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
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
							<th rowspan="8" scope="row" class="th_bg">조직형태</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인구분</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인형태</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인설립일</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>출자출하조직여부</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>출자지수</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>출자자중 농업인수</th>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>출자금액(천원)</th>
						</tr>
						<tr>
							<td colspan="2" class="td_input">
							<!-- 법인구분 -->
							<sbux-input
									uitype="text"
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							<!--
							<sbux-select
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							 -->
								</td>
							<td colspan="2" class="td_input">
							<!-- 법인형태 -->
							<sbux-input
									uitype="text"
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							<!--
							<sbux-select
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							 -->
								</td>
							<td colspan="2" class="td_input">
							<!-- 법인설립일 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstNope"
									name="dtl-input-invstNope"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							<!-- 현재 데이터 문제로 datepicker 보류 -->
							<!--
							<sbux-datepicker
									uitype="popup"
									id="dtl-input-corpFndnDay"
									name="dtl-input-corpFndnDay"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-datepicker>
							 -->
								</td>
							<td colspan="2" class="td_input">
							<!-- 출자출하조직여부 -->
							<sbux-input
									uitype="text"
									id="dtl-input-isoHldYn"
									name="dtl-input-isoHldYn"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							<!--
							<sbux-select
									id="dtl-input-isoHldYn"
									name="dtl-input-isoHldYn"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							-->
								</td>
							<td colspan="2" class="td_input">
							<!-- 출자자수 -->
							<sbux-input
									uitype="text"
									id="dtl-input-invstNope"
									name="dtl-input-invstNope"
									class="form-control input-sm"
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
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
						<th colspan="12" style="text-align:center;" scope="row" class="th_bg">출자금세부현황</th>
						<th rowspan="2" colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>농업인 출자 지분율</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>농업인</th>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>생산자단체</th>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>지자체</th>
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
								></sbux-input>
							</td>
							<td></td>
							<td colspan="2"   style="border-right: hidden;">
							<!-- 기타 -->
							<sbux-input
									uitype="text"
									id="dtl-input-etcAmt"
									name="dtl-input-etcAmt"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td>천원</td>
						</tr>
						<tr>
							<th colspan="14" scope="row" class="th_bg" style="text-align:center;">전체 종사자 수</th>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>정규직</th>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>파견직</th>
							<th colspan="3" scope="row" class="th_bg"><span class="data_required" ></span>일용직</th>
							<th colspan="5" scope="row" class="th_bg"><span class="data_required" ></span>합계</th>
						</tr>
						<tr>
						<td colspan="2" style="border-right:hidden;">
						<!-- 정규직 -->
						<sbux-input
									uitype="text"
									id="dtl-input-rgllbrNope"
									name="dtl-input-rgllbrNope"
									class="form-control input-sm"
									autocomplete="off"
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
									autocomplete="off"
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
									autocomplete="off"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="4" style="border-right:hidden;">
						<!-- 합계 -->
						<sbux-input
									uitype="text"
									id="dtl-input-tot"
									name="dtl-input-tot"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
						</td>
						<td>명</td>
						</tr>
						<tr>
							<th colspan="7" scope="row" class="th_bg">대표자 정보</th>
							<th colspan="8" scope="row" class="th_bg">작성자 정보</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>성명</th>
							<td colspan="5">
							<sbux-input
									uitype="text"
									id="dtl-input-rprsvFlnm"
									name="dtl-input-rprsvFlnm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>직위</th>
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
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>전화번호</th>
							<td colspan="5">
							<sbux-input
									uitype="text"
									id="dtl-input-rprsvTelno"
									name="dtl-input-rprsvTelno"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>전화번호</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="dtl-input-picTelno"
									name="dtl-input-picTelno"
									class="form-control input-sm"
									autocomplete="off"
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
							<th colspan="2" scope="row" class="th_bg">이메일주소</th>
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
									id="dtl-input-jisoAt"
									name="dtl-input-jisoAt"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- 사업자번호 조회 팝업 -->
    <div>
        <sbux-modal
        	id="modal-brno"
        	name="modal-brno"
        	uitype="middle"
        	header-title="통합조직,출자출하조직 선택"
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
다른곳에서 그렇게 사용중
가급적 지켜줘야 변경할 부분이 적어짐
컬럼값이 없다면 고유값으로 명명할것

팝업 추가시 id,name 값은 고유 값이 여야함 겹치면 안됨
sb그리드 sbUx 에서는 id 가 없으면 name 값을 기준으로 작동함 고유값으로 해야함
동일한 값으로 할시 문제가 발생함

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

	var jsonPrdcrCrclOgnMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrCrclOgnMng; //그리드 객체


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		//그리드 생성
		fn_fcltMngCreateGrid();
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
	    SBGridProperties.columns = [
	    	{caption: ["산지유통조직코드"], 	ref: 'apoCd',   	hidden : true},
	        {caption: ["법인구분"], 		ref: 'corpSeCd',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["시도"], 			ref: 'ctpv',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["법인명"], 		ref: 'corpNm',   	type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["대표자명"], 		ref: 'rprsvFlnm',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["전화번호"], 		ref: 'rprsvTelno',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["2차승인구분"], 	ref: 'ii',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["참여조직여부"], 	ref: 'apoSe',   	type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmk',   	type:'output',  width:'80px',    style:'text-align:center'},

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
	        {caption: ["상세내역"], 	ref: 'etcAmt',   	hidden : true},
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
	        {caption: ["상세내역"], 	ref: 'jisoAt',   	hidden : true}
	    ];

	    grdPrdcrCrclOgnMng = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
	    grdPrdcrCrclOgnMng.bind('click','fn_view');
	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
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

		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrCrclOgnMngVO = {
						apoSe: item.apoSe
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
						,etcAmt: item.etcAmt
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
						,jisoAt: item.jisoAt
				}
				jsonPrdcrCrclOgnMng.push(PrdcrCrclOgnMngVO);
			});

        	grdPrdcrCrclOgnMng.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	//grdPrdcrCrclOgnMng.addRow();
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

    	let apoCd = SBUxMethod.get("dtl-input-apoCd");

    	//필수값 체크
    	fn_

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
			,etcAmt: SBUxMethod.get('dtl-input-etcAmt')//
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
			,jisoAt: SBUxMethod.get('dtl-input-jisoAt')//
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
			,etcAmt: SBUxMethod.get('dtl-input-etcAmt')//
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
			,jisoAt: SBUxMethod.get('dtl-input-jisoAt')//
   		});

		const data = await postJsonPromise;
		console.log("update result", data);

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



	//사업자번호 조회 팝업
	const fn_choiceBrno = function() {
		console.log("======fn_choiceBrno=======");
		popBrno.init(fn_setBrno);
	}
	//사업자번호 조회 팝업 콜백함수
	const fn_setBrno = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("srch-input-brno", rowData.brno);
			SBUxMethod.set("srch-input-corpNm", rowData.corpNm);
		}
	}

	//경영체조회 팝업
	const fn_choiceMngmstInfoId = function() {
		console.log("======dd=======");
		popMngmstInfoId.init(fn_setMngmstInfoId);
	}
	//경영체조회 팝업 콜백함수
	//법인명,법인등록번호,사업자번호,경영체번호
	const fn_setMngmstInfoId = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("srch-input-mngmstInfoId", rowData.mngmstInfoId);//경영체번호
			SBUxMethod.set("srch-input-corpNm", rowData.corpNm);			//법인명
			SBUxMethod.set("srch-input-brno", rowData.brno);				//사업자등록번호
			SBUxMethod.set("srch-input-crno", rowData.crno);				//법인등록번호
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

		console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',rowData.apoCd)//
		SBUxMethod.set('dtl-input-apoSe',rowData.apoSe)//
		SBUxMethod.set('dtl-input-uoBrno',rowData.uoBrno)//
		SBUxMethod.set('dtl-input-corpNm',rowData.corpNm)//
		SBUxMethod.set('dtl-input-crno',rowData.crno)//
		SBUxMethod.set('dtl-input-brno',rowData.brno)//
		SBUxMethod.set('dtl-input-mngmstInfoId',rowData.mngmstInfoId)//
		SBUxMethod.set('dtl-input-mngmstYn',rowData.mngmstYn)//
		SBUxMethod.set('dtl-input-nonghyupCd',rowData.nonghyupCd)//
		SBUxMethod.set('dtl-input-cmptnInst',rowData.cmptnInst)//
		SBUxMethod.set('dtl-input-ctpv',rowData.ctpv)//
		SBUxMethod.set('dtl-input-sgg',rowData.sgg)//
		SBUxMethod.set('dtl-input-zip',rowData.zip)//
		SBUxMethod.set('dtl-input-lotnoAddr',rowData.lotnoAddr)//
		SBUxMethod.set('dtl-input-lotnoDtlAddr',rowData.lotnoDtlAddr)//
		SBUxMethod.set('dtl-input-roadNmAddr',rowData.roadNmAddr)//
		SBUxMethod.set('dtl-input-roadNmDtlAddr',rowData.roadNmDtlAddr)//
		SBUxMethod.set('dtl-input-corpSeCd',rowData.corpSeCd)//
		SBUxMethod.set('dtl-input-corpDtlSeCd',rowData.corpDtlSeCd)//
		SBUxMethod.set('dtl-input-corpFndnDay',rowData.corpFndnDay)//
		SBUxMethod.set('dtl-input-isoHldYn',rowData.isoHldYn)//
		SBUxMethod.set('dtl-input-invstNope',rowData.invstNope)//
		SBUxMethod.set('dtl-input-invstExpndFrmerNope',rowData.invstExpndFrmerNope)//
		SBUxMethod.set('dtl-input-invstAmt',rowData.invstAmt)//
		SBUxMethod.set('dtl-input-frmerInvstAmt',rowData.frmerInvstAmt)//
		SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',rowData.prdcrGrpInvstAmt)//
		SBUxMethod.set('dtl-input-locgovInvstAmt',rowData.locgovInvstAmt)//
		SBUxMethod.set('dtl-input-etcAmt',rowData.etcAmt)//
		SBUxMethod.set('dtl-input-rgllbrNope',rowData.rgllbrNope)//
		SBUxMethod.set('dtl-input-dwNope',rowData.dwNope)//
		SBUxMethod.set('dtl-input-dlbrrNope',rowData.dlbrrNope)//
		SBUxMethod.set('dtl-input-rprsvFlnm',rowData.rprsvFlnm)//
		SBUxMethod.set('dtl-input-rprsvTelno',rowData.rprsvTelno)//
		SBUxMethod.set('dtl-input-rprsvMoblno',rowData.rprsvMoblno)//
		SBUxMethod.set('dtl-input-rprsvEml',rowData.rprsvEml)//
		SBUxMethod.set('dtl-input-picPosition',rowData.picPosition)//
		SBUxMethod.set('dtl-input-picFlnm',rowData.picFlnm)//
		SBUxMethod.set('dtl-input-picTelno',rowData.picTelno)//
		SBUxMethod.set('dtl-input-picMoblno',rowData.picMoblno)//
		SBUxMethod.set('dtl-input-picEml',rowData.picEml)//
		SBUxMethod.set('dtl-input-fxno',rowData.fxno)//
		SBUxMethod.set('dtl-input-jisoAt',rowData.jisoAt)//

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
		SBUxMethod.set('dtl-input-etcAmt',null)//
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
		SBUxMethod.set('dtl-input-jisoAt',null)//
    }


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
</script>
</html>