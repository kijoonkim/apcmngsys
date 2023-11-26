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
					<!--
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					 -->
				</div>
			</div>
			<div class="box-body">
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
								<sbux-select
									id="srch-input-year"
									name="srch-input-year"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
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
							<td style="border-right: hidden;"></td>
							<th colspan="2" scope="row" class="th_bg" >시도</th>
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
									jsondata-ref="jsonDSA"
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
									jsondata-ref="jsonDSA"
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
									id="srch-input-ii"
									name="srch-input-ii"
									uitype="single"
									jsondata-ref="jsonDSA"
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
								<sbux-input
									uitype="text"
									id="srch-input-jj"
									name="srch-input-jj"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-brno"
									name="srch-input-brno"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
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
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnReqMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<br>
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
								<sbux-input
									uitype="text"
									id="dtl-input-kk"
									name="dtl-input-kk"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
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
							<sbux-input
									uitype="text"
									id="dtl-input-corpSeCd"
									name="dtl-input-corpSeCd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
							<td colspan="5" class="td_input">
							<!-- 법인형태 -->
							<sbux-input
									uitype="text"
									id="dtl-input-corpDtlSeCd"
									name="dtl-input-corpDtlSeCd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
							<td colspan="5" class="td_input">
							<!-- 법인설립일 -->
							<sbux-input
									uitype="text"
									id="dtl-input-corpFndnDay"
									name="dtl-input-corpFndnDay"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
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
									autocomplete="off"
									readonly
								></sbux-input>
								</td>
							<td class="td_input">
							<!-- 농업인출 자지분율 -->
							<!--
							<sbux-input
									uitype="text"
									id="dtl-input-invstAmt"
									name="dtl-input-invstAmt"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								 -->
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
										autocomplete="off"
										readonly
									></sbux-input>
							</td>
							<td>명</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div>
				*위 사항이 실제와 다를 경우, 기본정보관리에서 수정하시기 바랍니다.
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
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdGpcList" style="height:200px; width: 620px;"></div>
				</div>
				<br>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>생산유통통합조직 여부</caption>
					<tbody>
						<tr>
							<th colspan="3" scope="row" class="th_bg">생산유통통합조직</th>
							<td colspan="4" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd1" name="rdo-apcSeCd" uitype="normal" value="1" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">승인형</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd2" name="rdo-apcSeCd" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">육성형</label>
								</p>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg">원물확보 시•군 및 시•도 개소 수</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-22"
									name="dtl-input-22"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="8" style="border: none"></td>
						</tr>
						<tr>
							<th colspan="3" scope="row" class="th_bg">출자출하조직 보유 여부</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-isoHldYn"
									name="dtl-input-isoHldYn"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
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
									id="dtl-input-intyYn"
									name="dtl-input-intyYn"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
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
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg">통합년도</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-untyYr"
									name="dtl-input-untyYr"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
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
							<th colspan="7" scope="row" class="th_bg">NH(농협) 자금 신청액</th>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg th_border_right">생산유통통합조직</th>
							<th colspan="4" scope="row" class="th_bg">2024자금 신청액</th>
							<td colspan="7" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-88"
									name="dtl-input-88"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="4" scope="row" class="th_bg th_border_right">출자출하조직</th>
							<th colspan="4" scope="row" class="th_bg">2024 자금 신청액</th>
							<td colspan="7" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-99"
									name="dtl-input-99"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="8" scope="row" class="th_bg">계</th>
							<td colspan="7" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-10"
									name="dtl-input-10"
									class="form-control input-sm"
									autocomplete="off"
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
								<sbux-input
									uitype="text"
									id="dtl-input-12"
									name="dtl-input-12"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="7" style="border: none"></td>
						</tr>
					</tbody>
				</table>
				<div>
				*신청대상구분은 aT본사에서만 이용하는 란입니다.
				</div>
			</div>
		</div>
	</section>



</body>
<script type="text/javascript">

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
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["신청년도"], 		ref: 'year',   	type:'output',  width:'220px',    style:'text-align:center'},
	    	{caption: ["통합조직여부"], 	ref: 'apoSe',   type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["시도"], 			ref: 'ctpv',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'bb',   	type:'output',  width:'220px',    style:'text-align:center'},

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

	        {caption: ["상세내역"], 	ref: 'intyYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'uoNm',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'uoBrno',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'untyYr',   	hidden : true}
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
	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let year = SBUxMethod.get("srch-input-year");//
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

		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnReqMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrCrclOgnReqMngVO = {
						apoSe: item.apoSe
						,apoCd: item.apoCd
						,ctpv: item.ctpv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,brno: item.brno
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

						,intyYn: item.intyYn
						,uoNm: item.uoNm
						,uoBrno: item.uoBrno
						,untyYr: item.untyYr
				}
				jsonPrdcrCrclOgnReqMng.push(PrdcrCrclOgnReqMngVO);
			});

        	grdPrdcrCrclOgnReqMng.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	//grdPrdcrCrclOgnReqMng.addRow();
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

   	 	const postJsonPromise = gfn_postJSON("/pd/aom/insertPrdcrCrclOgnReqMng.do", {
   	 		apoCd: SBUxMethod.get('dtl-input-apoCd')//
   	 		,intyYn: SBUxMethod.get('dtl-input-intyYn')//
			,uoNm: SBUxMethod.get('dtl-input-uoNm')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,untyYr: SBUxMethod.get('dtl-input-untyYr')//
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

		const postJsonPromise = gfn_postJSON("/pd/aom/updatePrdcrCrclOgnReqMng.do", {
			apoCd: SBUxMethod.get('dtl-input-apoCd')//
			,intyYn: SBUxMethod.get('dtl-input-intyYn')//
			,uoNm: SBUxMethod.get('dtl-input-uoNm')//
			,uoBrno: SBUxMethod.get('dtl-input-uoBrno')//
			,untyYr: SBUxMethod.get('dtl-input-untyYr')//
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

		console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',rowData.apoCd)//
		SBUxMethod.set('dtl-input-corpNm',rowData.corpNm)//
		SBUxMethod.set('dtl-input-picFlnm',rowData.picFlnm)//
		SBUxMethod.set('dtl-input-lotnoAddr',rowData.lotnoAddr)//
		SBUxMethod.set('dtl-input-lotnoDtlAddr',rowData.lotnoDtlAddr)//
		SBUxMethod.set('dtl-input-zip',rowData.zip)//
		SBUxMethod.set('dtl-input-roadNmAddr',rowData.roadNmAddr)//
		SBUxMethod.set('dtl-input-roadNmDtlAddr',rowData.roadNmDtlAddr)//
		SBUxMethod.set('dtl-input-corpSeCd',rowData.corpSeCd)//
		SBUxMethod.set('dtl-input-corpDtlSeCd',rowData.corpDtlSeCd)//
		SBUxMethod.set('dtl-input-corpFndnDay',rowData.corpFndnDay)//
		SBUxMethod.set('dtl-input-invstNope',rowData.invstNope)//
		SBUxMethod.set('dtl-input-invstExpndFrmerNope',rowData.invstExpndFrmerNope)//
		SBUxMethod.set('dtl-input-invstAmt',rowData.invstAmt)//
		SBUxMethod.set('dtl-input-frmerInvstAmt',rowData.frmerInvstAmt)//
		SBUxMethod.set('dtl-input-prdcrGrpInvstAmt',rowData.prdcrGrpInvstAmt)//
		SBUxMethod.set('dtl-input-locgovInvstAmt',rowData.locgovInvstAmt)//
		SBUxMethod.set('dtl-input-etcInvstAmt',rowData.etcInvstAmt)//
		SBUxMethod.set('dtl-input-rgllbrNope',rowData.rgllbrNope)//
		SBUxMethod.set('dtl-input-dwNope',rowData.dwNope)//
		SBUxMethod.set('dtl-input-dlbrrNope',rowData.dlbrrNope)//

		SBUxMethod.set('dtl-input-intyYn',rowData.intyYn)//
		SBUxMethod.set('dtl-input-uoNm',rowData.uoNm)//
		SBUxMethod.set('dtl-input-uoBrno',rowData.uoBrno)//
		SBUxMethod.set('dtl-input-untyYr',rowData.untyYr)//

    }


    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set('dtl-input-intyYn',null)//
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

	//품목입력 그리드 변수
	var jsonGpcList = []; // 그리드의 참조 데이터 주소 선언
	var grdGpcList;
	var jsonAa = [
		{'text': '과실류','label': '과실류', 'value': '1'},
		{'text': '시설원예','label': '시설원예', 'value': '2'},
		{'text': '노지채소','label': '노지채소', 'value': '3'}
	];
	var jsonBb = [
		{'text': '전문품목','label': '전문품목', 'value': '1'},
		{'text': '육성품목','label': '육성품목', 'value': '2'}
	];
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
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["품목부류"], 		ref: 'aa',   	type:'combo',  width:'120px',    style:'text-align:center'
	    		typeinfo : {ref:'jsonAa', label:'label', value:'value', displayui : true}},
	    	{caption: ["전문/육성 구분"], 	ref: 'bb',   type:'combo',  width:'120px',    style:'text-align:center'
	    		typeinfo : {ref:'jsonBb', label:'label', value:'value', displayui : true}},
	        {caption: ["품목"], 			ref: 'cc',   	type:'input',  width:'120px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'dd',   	type:'input',  width:'120px',    style:'text-align:center'},

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
	}
	/*
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

	// Grid Row 추가 및 삭제 기능
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
	*/
</script>
</html>
