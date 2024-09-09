<%
 /**
  * @Class Name : fcltOgnzPrcsPrfmnc.jsp
  * @Description : 유통조직처리실적 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호		최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 유통조직처리실적 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<!-- apc리스트 -->
		<div class="box-body">
			<!--[pp] 검색 -->
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
						<th scope="row" class="th_bg">년도</th>
						<td colspan="2" class="td_input" style="border-right:hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
						</td>
						<td colspan="2" style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg">시도</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-select
								id="srch-inp-ctpv"
								name="srch-inp-ctpv"
								uitype="single"
								jsondata-ref="jsonComCtpv"
								unselected-text="전체"
								class="form-control input-sm"
								onchange="fn_ctpvChange"
							></sbux-select>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
						</td>
						<th scope="row" class="th_bg">시군구</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select
								id="srch-inp-sgg"
								name="srch-inp-sgg"
								uitype="single"
								jsondata-ref="jsonComSgg"
								unselected-text="전체"
								class="form-control input-sm"
								filter-source-name="srch-inp-ctpv"
								jsondata-filter="mastervalue"
							></sbux-select>
						</td>
						<td colspan="" class="td_input" style="border-right: hidden;">
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">APC명</th>
						<td colspan="2" class="td_input" style="border-right:hidden;">
							<sbux-input
								uitype="text"
								id="srch-inp-apcNm"
								name="srch-inp-apcNm"
								class="form-control input-sm srch-keyup-area"
								autocomplete="off"
							></sbux-input>
						</td>
						<td colspan="2" style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg">품목명</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-input
								uitype="text"
								id="srch-inp-itemNm"
								name="srch-inp-itemNm"
								class="form-control input-sm srch-keyup-area"
								autocomplete="off"
							></sbux-input>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
						</td>
						<th scope="row" class="th_bg">부류</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select
								id="srch-inp-srchLclsfCd"
								name="srch-inp-srchLclsfCd"
								uitype="single"
								jsondata-ref="jsonComSrchLclsfCd"
								unselected-text="전체"
								class="form-control input-sm"
							></sbux-select>
						</td>
						<td colspan="" class="td_input" style="border-right: hidden;">
						</td>
					</tr>
				</tbody>
			</table>
			<!--[pp] //검색 -->
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
				<div id="sb-area-grdFcltApcInfo" style="height:350px; width: 100%;"></div>
			</div>
		</div>
		<div class="box-body">
			<sbux-input uitype="hidden" id="dtl-inp-apcCd" name="dtl-inp-apcCd"></sbux-input>
			<sbux-input uitype="hidden" id="dtl-inp-crtrYr" name="dtl-inp-crtrYr"></sbux-input>
			<!--[pp] 검색 -->
			<div><label>유통조직처리실적 상세 내역</label></div>
			<div><label style="font-size: x-small;">- APC 운영자인 산지유통조직의 원예농산물 총취급액을 기재(APC에서 처리한 원예농산물 취급액 + APC에서 처리하지 않은 원예농산물 취급액)</label></div>

			<div>
				<table class="table table-bordered table-hover tbl_col tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 7%">
						<col style="width: 28px">
					</colgroup>
						<thead>
							<tr>
								<th class="text-center" style="border-right: 1px solid white !important;" rowspan="2">구분</th>
								<th class="text-center" style="border-right: 1px solid white !important;" rowspan="2" colspan="2">총취급액</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="6">일반취급</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="6">조직화취급</th>
								<th class="text-center" style="border-right: 1px solid white !important;" rowspan="2" colspan="2">취급 물량</th>
							</tr>
							<tr>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">계</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">단순수탁</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">단순매취</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">계</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">공선수탁</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">계약매취</th>
							</tr>
							<tr>
								<th class="text-center">품목1</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt1"
										name="dtl-inp-rtlOgnzTotTrmtAmt1"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum1"
										name="dtl-inp-rtlOgnzGnrlSum1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst1"
										name="dtl-inp-rtlOgnzGnrlSmplTrst1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap1"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum1"
										name="dtl-inp-rtlOgnzOGnzSum1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst1"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap1"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm1"
										name="dtl-inp-rtlOgnzTotTrmtVlm1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">품목2</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt2"
										name="dtl-inp-rtlOgnzTotTrmtAmt2"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum2"
										name="dtl-inp-rtlOgnzGnrlSum2"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst2"
										name="dtl-inp-rtlOgnzGnrlSmplTrst2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap2"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum2"
										name="dtl-inp-rtlOgnzOGnzSum2"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst2"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap2"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm2"
										name="dtl-inp-rtlOgnzTotTrmtVlm2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">품목3</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt3"
										name="dtl-inp-rtlOgnzTotTrmtAmt3"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum3"
										name="dtl-inp-rtlOgnzGnrlSum3"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst3"
										name="dtl-inp-rtlOgnzGnrlSmplTrst3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap3"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum3"
										name="dtl-inp-rtlOgnzOGnzSum3"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst3"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap3"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm3"
										name="dtl-inp-rtlOgnzTotTrmtVlm3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">기타</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt4"
										name="dtl-inp-rtlOgnzTotTrmtAmt4"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum4"
										name="dtl-inp-rtlOgnzGnrlSum4"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst4"
										name="dtl-inp-rtlOgnzGnrlSmplTrst4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap4"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum4"
										name="dtl-inp-rtlOgnzOGnzSum4"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst4"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap4"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm4"
										name="dtl-inp-rtlOgnzTotTrmtVlm4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">계</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmtTot"
										name="dtl-inp-rtlOgnzTotTrmtAmtTot"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSumTot"
										name="dtl-inp-rtlOgnzGnrlSumTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrstTot"
										name="dtl-inp-rtlOgnzGnrlSmplTrstTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspapTot"
										name="dtl-inp-rtlOgnzGnrlSmplEmspapTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSumTot"
										name="dtl-inp-rtlOgnzOGnzSumTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspapTot"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspapTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlmTot"
										name="dtl-inp-rtlOgnzTotTrmtVlmTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">계</th>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmtTot1"
										name="dtl-inp-rtlOgnzTotTrmtAmtTot1"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSumTot1"
										name="dtl-inp-rtlOgnzGnrlSumTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrstTot1"
										name="dtl-inp-rtlOgnzGnrlSmplTrstTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspapTot1"
										name="dtl-inp-rtlOgnzGnrlSmplEmspapTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSumTot1"
										name="dtl-inp-rtlOgnzOGnzSumTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot1"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspapTot1"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspapTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
							</tr>
						</thead>
					</table>
					</div>
			</div>
			<!--[pp] //검색결과 -->
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSave1" name="btnSave1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				</div>
			</div>
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			//SBUxMethod.set("srch-inp-apcCd", '0122');
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let apcCd = '0861';
		let crtrYr = '2024';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_fcltApcInfoCreateGrid();

		await fn_search();

	}

	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군구

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-inp-ctpv', 	jsonComCtpv, 	'UNTY_CTPV'), 	//시도
			gfn_setComCdSBSelect('srch-inp-sgg', 	jsonComSgg, 	'UNTY_SGG'), 	//시군구
		]);
	}

	const fn_selectOgPcList = async function(copy_chk) {
		 console.log("******************fn_pagingOgPcList**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOgnzPrcsPrfmncList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인
		//예외처리
		try {

			data.resultList.forEach((item, index) => {
				//console.log(item);

				let sn = item.sn;

				//let rtlOgnzGnrlSum = Number(item.rtlOgnzGnrlSmplTrst) + Number(item.rtlOgnzGnrlSmplEmspap);
				//let rtlOgnzOGnzSum = Number(item.rtlOgnzOgnzCprtnSortTrst) + Number(item.rtlOgnzOgnzCtrtEmspap);
				//let rtlOgnzTotTrmtAmt = Number(rtlOgnzGnrlSum) + Number(rtlOgnzOGnzSum);

				//SBUxMethod.set('dtl-inp-rtlOgnzGnrlSum',rtlOgnzGnrlSum);
				//SBUxMethod.set('dtl-inp-rtlOgnzOGnzSum',rtlOgnzOGnzSum);
				//SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt',rtlOgnzTotTrmtAmt);

				SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrst'+sn,item.rtlOgnzGnrlSmplTrst);
				SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspap'+sn,item.rtlOgnzGnrlSmplEmspap);
				SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+sn,item.rtlOgnzOgnzCprtnSortTrst);
				SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspap'+sn,item.rtlOgnzOgnzCtrtEmspap);

				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtVlm'+sn,item.rtlOgnzTotTrmtVlm);
			});
			//sum('srch-inp-opera3',1);
			fn_sum();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}


	//등록
	const fn_save = async function() {
		console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			alert("대상연도를 작성해주세요");
			return;
		}


		fn_subInsert(confirm("등록 하시겠습니까?"));
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed){
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;

		 let saveList = [];

		 for (var i = 1; i < 5; i++) {
			let item = {
					crtrYr : SBUxMethod.get('dtl-inp-crtrYr')
					,apcCd : SBUxMethod.get('dtl-inp-apcCd')
					, prgrsYn : 'N' //진척도 갱신 여부

					,sn : i
					,rtlOgnzTotTrmtAmt : SBUxMethod.get('dtl-inp-rtlOgnzTotTrmtAmt'+i)
					,rtlOgnzTotTrmtVlm : SBUxMethod.get('dtl-inp-rtlOgnzTotTrmtVlm'+i)
					,rtlOgnzGnrlSum : SBUxMethod.get('dtl-inp-rtlOgnzGnrlSum'+i)
					,rtlOgnzGnrlSmplTrst : SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplTrst'+i)
					,rtlOgnzGnrlSmplEmspap : SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplEmspap'+i)
					,rtlOgnzOGnzSum : SBUxMethod.get('dtl-inp-rtlOgnzOGnzSum'+i)
					,rtlOgnzOgnzCprtnSortTrst : SBUxMethod.get('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+i)
					,rtlOgnzOgnzCtrtEmspap : SBUxMethod.get('dtl-inp-rtlOgnzOgnzCtrtEmspap'+i)
			}
			saveList.push(item);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveFcltOgnzPrcsPrfmnc.do", saveList);

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
	}


	//처리실적 자동계산
	function fn_sum(e){
		if(e != null){
			extractNumbers2(e.name);
		}

		let rtlOgnzGnrlSmplTrstArr = [];
		let rtlOgnzGnrlSmplEmspapArr = [];

		let rtlOgnzOgnzCprtnSortTrstArr = [];
		let rtlOgnzOgnzCtrtEmspapArr = [];

		let rtlOgnzTotTrmtVlmArr = [];

		for (var i = 0; i < 4; i++) {
			rtlOgnzGnrlSmplTrstArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplTrst'+(i+1)));
			rtlOgnzGnrlSmplEmspapArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplEmspap'+(i+1)));

			rtlOgnzOgnzCprtnSortTrstArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+(i+1)));
			rtlOgnzOgnzCtrtEmspapArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzOgnzCtrtEmspap'+(i+1)));

			rtlOgnzTotTrmtVlmArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzTotTrmtVlm'+(i+1)));
		}

		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrstTot',rtlOgnzGnrlSmplTrstArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspapTot',rtlOgnzGnrlSmplEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrstTot',rtlOgnzOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspapTot',rtlOgnzOgnzCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtVlmTot',rtlOgnzTotTrmtVlmArr.reduce((acc, cur) => {return acc + cur;}, 0));

		//한글 단위 표시
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrstTot1',fn_numberToKorean( rtlOgnzGnrlSmplTrstArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspapTot1',fn_numberToKorean( rtlOgnzGnrlSmplEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrstTot1',fn_numberToKorean( rtlOgnzOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspapTot1',fn_numberToKorean( rtlOgnzOgnzCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0) ));

		let rtlOgnzTotTrmtAmt = [];
		let rtlOgnzGnrlSum = [];
		let rtlOgnzOGnzSum = [];

		for (var i = 0; i < 4; i++) {
			let sum1 = rtlOgnzGnrlSmplTrstArr[i] + rtlOgnzGnrlSmplEmspapArr[i];
			let sum2 = rtlOgnzOgnzCprtnSortTrstArr[i] + rtlOgnzOgnzCtrtEmspapArr[i];
			let sum3 = sum1 + sum2;

			rtlOgnzTotTrmtAmt[i] = sum3;
			rtlOgnzGnrlSum[i] = sum1;
			rtlOgnzOGnzSum[i] = sum2;

			SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt'+(i+1),sum3);
			SBUxMethod.set('dtl-inp-rtlOgnzGnrlSum'+(i+1),sum1);
			SBUxMethod.set('dtl-inp-rtlOgnzOGnzSum'+(i+1),sum2);
		}

		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot',rtlOgnzTotTrmtAmt.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSumTot',rtlOgnzGnrlSum.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzOGnzSumTot',rtlOgnzOGnzSum.reduce((acc, cur) => {return acc + cur;}, 0));

		//한글 단위 표시
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot1',fn_numberToKorean( rtlOgnzTotTrmtAmt.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSumTot1',fn_numberToKorean( rtlOgnzGnrlSum.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzOGnzSumTot1',fn_numberToKorean( rtlOgnzOGnzSum.reduce((acc, cur) => {return acc + cur;}, 0) ));
	}

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
	// 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/\D/g, ""));
		}
	}

	//값이 없는 경우 0 있는 경우 숫자로 반환
	function convertToNumberOrZero(value) {
		// 값이 없는 경우 0으로 설정
		if (value === undefined || value === null) {
		return 0;
		}

		// 값이 있는 경우 숫자로 변환하고 반환
		const numericValue = parseFloat(value);
		if (isNaN(numericValue)) {
			return 0; // 변환 실패 시 0 반환
		} else {
			return numericValue;
		}
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}

	function fn_numberToKorean(number) {
		if(number == null){
			return "";
		}
		if(typeof number == "string"){
			number = parseFloat(number);
		}
		//기본 단위 100만원  100 0000
		number = number * 100
		var inputNumber = number < 0 ? false : number;
		var unitWords = ["만", "억", "조", "경"];
		var splitUnit = 10000;
		var splitCount = unitWords.length;
		var resultArray = [];
		var resultString = "";

		for (var i = 0; i < splitCount; i++) {
			var unitResult = (inputNumber % Math.pow(splitUnit, i + 1)) / Math.pow(splitUnit, i);
			unitResult = Math.floor(unitResult);
			if (unitResult > 0) {
				resultArray[i] = unitResult;
			}
		}
		for (var i = 0; i < resultArray.length; i++) {
			if (!resultArray[i]) continue;
			resultString = String(resultArray[i]) + unitWords[i] + resultString;
		}
		return resultString + "원";
	}


	/*
	 * APC 리스트 추가
	 */

	var jsonFcltApcInfo = []; // 그리드의 참조 데이터 주소 선언
	var grdFcltApcInfo;


	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};


	function fn_excelDwnld01() {
		grdFcltApcInfo.exportLocalExcel("시설설치보완", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//apc 리스트
	const fn_fcltApcInfoCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdFcltApcInfo';
		SBGridProperties.id = 'grdFcltApcInfo';
		SBGridProperties.jsonref = 'jsonFcltApcInfo';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		//SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheader="seq";
		SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
			};
		SBGridProperties.columns = [
			{caption: ["APC명"],		ref: 'apcNm',		type:'input',  width:'200px',    style:'text-align:center'},
			{caption: ["대표품목1"],	ref: 'itemNm1',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["대표품목2"],	ref: 'itemNm2',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["대표품목3"],	ref: 'itemNm3',		type:'input',  width:'100px',    style:'text-align:center'},

			{caption: ["시도"],	ref: 'ctpvNm',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["시군구"],	ref: 'sigunNm',		type:'input',  width:'100px',    style:'text-align:center'},

			{caption: ["시도"],		ref: 'ctpvCd',		hidden : true},
			{caption: ["시군구"],		ref: 'sigunCd',		hidden : true},

			{caption: ["대표품목1"],		ref: 'itemCd1',		hidden : true},
			{caption: ["대표품목2"],		ref: 'itemCd2',		hidden : true},
			{caption: ["대표품목3"],		ref: 'itemCd3',		hidden : true},

			{caption: ["apcCd"],	ref: 'apcCd',	hidden : true},
			{caption: ["crtrYr"],	ref: 'crtrYr',	hidden : true},
		];

		grdFcltApcInfo = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdFcltApcInfo.bind('click','fn_view');
		grdFcltApcInfo.bind('beforepagechanged', 'fn_pagingBbsList');

	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdFcltApcInfo.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdFcltApcInfo.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchApcList(recordCountPerPage, currentPageNo);
	}

	/**
     * 목록 조회
     */
	const fn_search = async function() {
		//console.log("fn_search");
		// set pagination
		let pageSize = grdFcltApcInfo.getPageSize();
		let pageNo = 1;
		//입력폼 초기화
		//fn_clearForm();

		fn_searchApcList(pageSize, pageNo);
	}

	const fn_searchApcList = async function(pageSize, pageNo) {
		console.log("******************fn_setGrdFcltInstlInfoList**********************************");

		//let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let apcNm = SBUxMethod.get("srch-inp-apcNm");//
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		let ctpvCd = SBUxMethod.get("srch-inp-ctpv");//
		let sigunCd = SBUxMethod.get("srch-inp-sgg");//

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectApcList.do", {
			//apcCd: apcCd,
			apcNm: apcNm,
			crtrYr: crtrYr,
			ctpvCd: ctpvCd,
			sigunCd: sigunCd,

			// pagination
			pagingYn : 'Y',
			currentPageNo : pageNo,
			recordCountPerPage : pageSize
		});
		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			jsonFcltApcInfo.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				//console.log(item);
				let itemVO = {
						apcCd			:item.apcCd
						,apcNm			:item.apcNm
						,crtrYr			:item.crtrYr

						,itemCd1		:item.itemCd1
						,itemNm1		:item.itemNm1
						,itemCd2		:item.itemCd2
						,itemNm2		:item.itemNm2
						,itemCd3		:item.itemCd3
						,itemNm3		:item.itemNm3

						,ctpvCd			:item.ctpvCd
						,ctpvNm			:item.ctpvNm
						,sigunCd		:item.sigunCd
						,sigunNm		:item.sigunNm
				}
				jsonFcltApcInfo.push(itemVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonFcltApcInfo.length > 0) {

				if(grdFcltApcInfo.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdFcltApcInfo.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdFcltApcInfo.rebuild();
				}else{
					grdFcltApcInfo.refresh()
				}
			} else {
				grdFcltApcInfo.setPageTotalCount(totalRecordCount);
				grdFcltApcInfo.rebuild();
			}
			document.querySelector('#listApcCount').innerText = totalRecordCount;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//그리드 클릭시 상세보기 이벤트
	const fn_view = async function (){
		console.log("******************fn_view**********************************");
		//fn_clearForm();
		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdFcltApcInfo.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = grdFcltApcInfo.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdFcltApcInfo.getRowData(nRow);

		SBUxMethod.set('dtl-inp-apcCd',gfn_nvl(rowData.apcCd));
		SBUxMethod.set('dtl-inp-apcNm',gfn_nvl(rowData.apcNm));
		SBUxMethod.set('dtl-inp-crtrYr',gfn_nvl(rowData.crtrYr));
		console.log(SBUxMethod.get('dtl-inp-apcCd'));
		console.log(SBUxMethod.get('dtl-inp-crtrYr'));

		fn_selectOgPcList();
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}

</script>
</html>