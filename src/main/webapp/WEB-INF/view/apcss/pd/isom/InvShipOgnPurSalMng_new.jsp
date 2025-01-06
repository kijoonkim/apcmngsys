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
					<!-- 출자출하조직 관리 총 매입·매출 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.apoSe eq '1'}">
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</c:if>
				<c:if test="${loginVO.apoSe eq '2'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
					 <sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
				</c:if>
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
								></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

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

							<th colspan="2" scope="row" class="th_bg">통합조직 사업자번호로 검색</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-uoBrno"
									name="srch-input-uoBrno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
						</tr>
						<tr>
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
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">법인명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"></td>
							<!--
							<th colspan="2" scope="row" class="th_bg"></th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >

							</td>
							<td colspan="2" class="td_input">
							-->
							<td colspan="6" class="td_input" style="border-right: hidden;border-bottom: hidden;">
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.apoSe eq '1'}">
				<!-- 통합조직 정보 , 통합조직 진척도 -->
				<c:if test="${loginVO.apoSe eq '1'}">
					<table class="table table-bordered tbl_fixed">
						<caption>통합조직 정보 표기</caption>
						<tbody>
							<tr>
								<th scope="row" class="th_bg th_border_right">법인명</th>
								<sbux-input uitype="hidden" id="dtl-input-userApoCd" name="dtl-input-userApoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-userApoSe" name="dtl-input-userApoSe"></sbux-input>
								<td colspan="2" class="td_input">
									<sbux-input
										uitype="text"
										id="dtl-input-userCorpNm"
										name="dtl-input-userCorpNm"
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
										id="dtl-input-userBrno"
										name="dtl-input-userBrno"
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
										id="dtl-input-userCrno"
										name="dtl-input-userCrno"
										class="form-control input-sm"
										mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
										autocomplete="off"
										readonly
									></sbux-input>
								</td>
								<td class="td_input"  style="border-left: hidden;">
							</tr>
						</tbody>
					</table>
					<!--
					%@ include file="../prgrs/PrgrsUo.jsp" %>
					-->
				</c:if>

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
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
						<!--
						<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
						 -->
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->

				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-prfmncCorpDdlnYn" name="dtl-input-prfmncCorpDdlnYn"></sbux-input>
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
							<!--
							<th scope="row" class="th_bg th_border_right">통합조직 선택</th>
							<td colspan="2" class="td_input">
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
							 -->
						</tr>
					</tbody>
				</table>

				<!-- 출자출하조직 진척도 -->
				<c:if test="${loginVO.apoSe eq '2'}">
					<!--
					%@ include file="../prgrs/PrgrsIso.jsp" %>
					-->
				</c:if>

				<!--
				<br>
				<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
					<p>전체 취급실적 작성(전문/육성 품목 포함 주요품목 작성, 취급액 비중이 낮은 품목은 기타품목으로 통합작성 후 비고란에 기타품목 명 기재</p>
				</div>
				-->
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
						<p>▶출자출하조직 총 매입현황</p>
						<p>o 전문품목 매입매출 화면에서 입력한 수치가 총매입매출 화면으로 자동 연계</p>
						<p> 1) 전문/육성품목</p>
						<p> - 불려오는 값 : 취급유형별 매입물량/매입금액, 품목별 총 매입물량/매입금액</p>
						<!--
						<p>   * (참고) 요건충족 취급유형 : OO색으로 표시, 요건미달 생산자조직 : OO색으로 표시
						-->
						<p> - 입력필요 값 : (전문품목 매입매출 화면에서의) 사입한 물량에 대해, 단순수탁 및 단순매취로 구분작성하여, 총매입물량/매입금액(합계)과 맞춰야 함("합계" 메뉴에서 보이는 "차이" 값이 0이 되는지 확인)</p>
						<br>
						<p> 2) 기타품목</p>
						<p> - 불려오는 값이 별도 없으므로, 취급유형에 맞춰서 물량/금액 입력</p>
						<br>
						<p>  ⇒ 전문/육성/기타품목에 대해 입력완료 후 "매입저장"</p>
					</div>
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">

							<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="매입저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
							</c:if>

						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 총 매입현황</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:300px; width: 100%;"></div>
				</div>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
						<p>▶출자출하조직 총 매출현황 - 취급실적</p>
						<p>o 전문품목 매입매출 화면에서 입력한 수치가 총매입매출 화면으로 자동 연계</p>
						<br>
						<p> 1) 전문/육성품목</p>
						<p> - 전문품목 매입매출 화면에서 입력한 매출현황(합계) 수치가 "조정 취급실적"으로 자동 연계</p>
						<p> - 출자출하조직 총매출액 중에서 공제가 필요한 실적을 "취급액 공제 실적"에 입력하면, 조정취급실적+취급액공제실적 = 총취급실적으로 계산됨</p>
						<p> - 품목별 총취급실적의 합계가 출자출하조직 총매출액과 일치해야 함</p>
						<p>   * 공제가능항목 : 자체수출, 자체공판장, 군납, 학교급식 등  </p>
						<br>
						<p> 2) 기타품목</p>
						<p> - 불려오는 값이 별도 없으므로, "총취급실적"에 물량/금액 입력</p>
						<br>
						<p>  ⇒ 전문/육성/기타품목에 대해 입력완료 후 "매출저장" </p>
					</div>
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">

							<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="매출저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
							</c:if>

						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 총 매출현황 - 취급실적</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:300px; width: 100%;"></div>
				</div>

				<div class="ad_section_top" id="grid3">
					<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
						<p>▶출자출하조직 총 매출현황 - 통합조직 출하실적</p>
						<p>o 전문품목 매입매출 화면에서 입력한 수치가 총매입매출 화면으로 자동 연계</p>
						<br>
						<p> 1) 전문/육성품목</p>
						<p> - 전문품목 매입매출 화면에서 입력한 "통합조직에 출하(판매)" 수치가 "통합조직 총 출하실적"으로 자동 연계</p>
						<p> - 단순기표 실적이 있다면 해당실적 입력 시, 통합조직 총출하실적-단순기표=인정 출하실적으로 계산됨</p>
						<p> - 전문품목 매입매출 화면에서 입력한 취급유형별 통합조직에 출하(판매) 수치가 "생산자조직 약정(전속)출하 실적"으로 자동 연계</p>
						<!--
						<p>     * (참고) 요건충족 취급유형 : OO색으로 표시, 요건미달 생산자조직 : OO색으로 표시
						-->
						<br>
						<p> 2) 기타품목</p>
						<p> - 통합조직에 출하한 실적이 있다면, "통합조직 총 출하실적"에 물량/금액 입력</p>
						<br>
						<p>  ⇒ 전문/육성/기타품목에 대해 입력완료 후 "매출저장" </p>
					</div>
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
							<sbux-button id="btnSaveFclt3" name="btnSaveFclt3" uitype="normal" text="매출저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave03"></sbux-button>
							</c:if>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 총 매출현황 - 통합조직 출하실적</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng03" style="height:300px; width: 100%;"></div>
				</div>
			</div>

			<!-- 로우데이터 -->
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
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
		<jsp:include page="/WEB-INF/view/apcss/fm/popup/gpcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
//생산자조직 등록의 경우
//통합조직 직속 농가 출자출하조직 농가 두가지 경우가 있음
//첫리스트는 통합조직,출자출하조직 둘다 보여야함
//조직 선택후 품목 취급유형 선택후 다시 조회

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
			});
		}
	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_setYear();//기본년도 세팅

	<c:if test="${loginVO.apoSe eq '1'}">
		//통합조직 기본정보
		SBUxMethod.set("dtl-input-userCorpNm","${loginVO.corpNm}");
		SBUxMethod.set("dtl-input-userBrno","${loginVO.brno}");
		SBUxMethod.set("dtl-input-userCrno","${loginVO.crno}");
	</c:if>

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.apoSe eq '1'}">
		fn_fcltMngCreateGrid();
	</c:if>
		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();
		fn_fcltMngCreateGrid03();
	<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2'}">
		$("#grid3").hide();
	</c:if>
		await fn_initSBSelect();

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.apoSe eq '1'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.apoSe eq '2'}">
		await fn_dtlSearch();
	</c:if>
	}

	/* 기본 년도값 세팅 */
	const fn_setYear = async function() {
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
	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분

	var jsonGrdComCtpv = [];//시도
	var jsonGrdComSgg = [];//시군
	var jsonGrdComCorpSeCd = [];//법인구분
	var jsonGrdComAprv = [];//승인형 육성형 구분

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
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
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCorpSeCd, 	'CORP_SE_CD'),//법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComAprv, 	'APRV_UPBR_SE_CD'), //신청구분

		]);
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
		grdPrdcrOgnCurntMng.exportLocalExcel("출자출하조직관리(조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.explorerbar = 'sort';//정렬
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
			{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdComAprv', label:'label', value:'value', displayui : false}},
			{caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
			{caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'250px',    style:'text-align:center'},
			{caption: ["적합품목(전문품목)"], 		ref: 'stbltYnNmList1',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["적합품목(육성품목)"], 		ref: 'stbltYnNmList2',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdComCorpSeCd', label:'label', value:'value', displayui : false}},
			{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdComCtpv', label:'label', value:'value', displayui : false}},
			{caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonGrdComSgg', label:'label', value:'value', displayui : false}},
			{caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("출자출하조직관리(총 매입현황)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = true;
		SBGridProperties.frozencols=4;
		SBGridProperties.frozenbottomrows=1;
		SBGridProperties.columns = [
			{caption: ["구분","구분","구분"], 			ref: 'sttgUpbrItemNm',	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["부류","부류","부류"], 			ref: 'clsfNm',   	type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["품목","품목","품목"], 			ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["통합조직","통합조직","통합조직명"], 		ref: 'corpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합조직","통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center;border-right-color: black !important;'},

			/*= 수탁 =*/
			{caption: ["수탁","공동선별수탁","물량(톤)"], ref: 'prchsSortTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동선별수탁","금액(천원)"], ref: 'prchsSortTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["수탁","공동출하수탁","물량(톤)"], ref: 'prchsSpmtTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","공동출하수탁","금액(천원)"], ref: 'prchsSpmtTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["수탁","단순수탁","물량(톤)"], ref: 'prchsSmplTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","단순수탁","금액(천원)"], ref: 'prchsSmplTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["수탁","수탁소계","물량(톤)"], ref: 'prchsTrstVlm',   	type:'output',  width:'50px',    style:'text-align:right'
				,calc : 'fn_trstVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["수탁","수탁소계","금액(천원)"], ref: 'prchsTrstAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
				,calc : 'fn_trstAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			/*= 매취 =*/
			{caption: ["매취","공동선별매취","물량(톤)"], 	ref: 'prchsSortEmspapVlm',   type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","공동선별매취","금액(천원)"], 	ref: 'prchsSortEmspapAmt',   type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","단순매취","물량(톤)"], 	ref: 'prchsSmplEmspapVlm',   type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","단순매취","금액(천원)"], 	ref: 'prchsSmplEmspapAmt',   type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["매취","매취소계","물량(톤)"], 	ref: 'prchsEmspapVlm',   type:'output',  width:'50px',    style:'text-align:right'
				,calc : 'fn_emspapVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["매취","매취소계","금액(천원)"], ref: 'prchsEmspapAmt',   type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
				,calc : 'fn_emspapAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			/*= 매입 합계 =*/
			{caption: ["합계","합계","물량(톤)"], 	ref: 'prchsTotVlm',   		type:'output',  width:'50px',    style:'text-align:right'
				,calc : 'fn_prchsVlmSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","차이"], 		ref: 'prchsTotVlmDiff',   		type:'output',  width:'50px',    style:'text-align:right; background-color: lightgray'
				, calc : 'fn_prchsVlmDiff'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","금액(천원)"], 	ref: 'prchsTotAmt',   		type:'output',  width:'80px',    style:'text-align:right'
				,calc : 'fn_prchsAmtSum'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["합계","합계","차이"], 		ref: 'prchsTotAmtDiff',   		type:'output',  width:'80px',    style:'text-align:right; background-color: lightgray'
				, calc : 'fn_prchsAmtDiff'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			/*= 기타 =*/
			/*
			{caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   type:'input',  width:'90px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["기타","금액(천원)"], 		ref: 'etcAmt',   type:'input',  width:'100px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			*/
			{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',  	hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',  	hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'delYn',		hidden : true}
		];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
		//grdPrdcrOgnCurntMng01.bind('click','gridClick01');
		//grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
		grdPrdcrOgnCurntMng01.bind('valuechanged','fn_valuechanged01');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
		'prchsSortTrstVlm', 'prchsSortTrstAmt'
		,'prchsSpmtTrstVlm', 'prchsSpmtTrstAmt'
		,'prchsSmplTrstVlm', 'prchsSmplTrstAmt'

		,'prchsSortEmspapVlm', 'prchsSortEmspapAmt'
		,'prchsSmplEmspapVlm', 'prchsSmplEmspapAmt'
	];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_valuechanged01(){
		let nCol = grdPrdcrOgnCurntMng01.getCol();
		let nRef = grdPrdcrOgnCurntMng01.getRefOfCol(nCol);

		if(columnsToRefresh01.includes(nRef)){
			grdPrdcrOgnCurntMng01.refresh();
			fn_grdTot01();
		}
	}

	//수탁 물량 합계
	function fn_trstVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.prchsSortTrstVlm)) + Number(gfn_nvl(rowData.prchsSpmtTrstVlm)) + Number(gfn_nvl(rowData.prchsSmplTrstVlm));
		return sumVal;
	}

	//수탁 금액 합계
	function fn_trstAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.prchsSortTrstAmt)) + Number(gfn_nvl(rowData.prchsSpmtTrstAmt)) + Number(gfn_nvl(rowData.prchsSmplTrstAmt));
		return sumVal;
	}

	//매취 물량 합계
	function fn_emspapVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.prchsSortEmspapVlm)) + Number(gfn_nvl(rowData.prchsSmplEmspapVlm));
		return sumVal;
	}

	//매취 금액 합계
	function fn_emspapAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.prchsSortEmspapAmt)) + Number(gfn_nvl(rowData.prchsSmplEmspapAmt));
		return sumVal;
	}

	//매입 물량 합계
	function fn_prchsVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(gfn_nvl(rowData.prchsSortTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSmplTrstVlm))
					+ Number(gfn_nvl(rowData.prchsSortEmspapVlm))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapVlm));
		}else{
			sumVal = rowData.prchsTotVlm;
		}

		return sumVal;
	}
	//매입 물량 합계 차이
	function fn_prchsVlmDiff(objGrid, nRow, nCol){
		nRow = Number(nRow);
		nCol = Number(nCol);
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe != '3' && rowData.delYn == 'N'){
			sumVal = Number(gfn_nvl(rowData.prchsTotVlm)) -
					(
							Number(gfn_nvl(rowData.prchsSortTrstVlm))
							+ Number(gfn_nvl(rowData.prchsSpmtTrstVlm))
							+ Number(gfn_nvl(rowData.prchsSmplTrstVlm))
							+ Number(gfn_nvl(rowData.prchsSortEmspapVlm))
							+ Number(gfn_nvl(rowData.prchsSmplEmspapVlm))
					);
			console.log(sumVal);
			if(sumVal === 0){
				console.log('0');
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			}else{
				console.log('!0');
				console.log(nRow,nCol);
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'red');
			}
			return sumVal;
		}else{
			sumVal = '';
			objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
		}
		return sumVal;
	}

	//매입 금액 합계
	function fn_prchsAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = Number(gfn_nvl(rowData.prchsSortTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSmplTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSortEmspapAmt))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapAmt));
		}else{
			sumVal = rowData.prchsTotAmt;
		}
		return sumVal;
	}

	//매입 금액 합계 차이
	function fn_prchsAmtDiff(objGrid, nRow, nCol){
		nRow = Number(nRow);
		nCol = Number(nCol);
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//금액의 경우 기타인 경우만 합산 처리
		if(rowData.sttgUpbrItemSe != '3' && rowData.delYn == 'N'){
			sumVal = Number(gfn_nvl(rowData.prchsTotAmt)) -
					(
					Number(gfn_nvl(rowData.prchsSortTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSpmtTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSmplTrstAmt))
					+ Number(gfn_nvl(rowData.prchsSortEmspapAmt))
					+ Number(gfn_nvl(rowData.prchsSmplEmspapAmt))
					);
			if(sumVal === 0){
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			}else{
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'red');
			}
			return sumVal;
		}else{
			sumVal = '';
			objGrid.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
		}
		return sumVal;
	}

	//소계 추가를 위해 조정
	function fn_grdTot01(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			'prchsSortTrstVlm', 'prchsSortTrstAmt'
			,'prchsSpmtTrstVlm', 'prchsSpmtTrstAmt'
			,'prchsSmplTrstVlm', 'prchsSmplTrstAmt'

			,'prchsSortEmspapVlm', 'prchsSortEmspapAmt'
			,'prchsSmplEmspapVlm', 'prchsSmplEmspapAmt'

			,'prchsTrstVlm', 'prchsTrstVlm'
			,'prchsEmspapVlm', 'prchsEmspapAmt'
			,'prchsTotVlm', 'prchsTotAmt'
		];
		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdPrdcrOgnCurntMng01;
		let grdJson = jsonPrdcrOgnCurntMng01;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 메인 길이
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
		  acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
		  return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});
		objGrid.refresh();

		fn_gridCustom();
	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02;

	const objMenuList02 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld02,			//콜백함수명
			}
		};

	function fn_excelDwnld02() {
		grdPrdcrOgnCurntMng02.exportLocalExcel("출자출하조직관리(총 매출현황 - 출자출하조직 취급실적)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid02 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
		SBGridProperties.frozencols=4;
		SBGridProperties.frozenbottomrows=1;
		//SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["구분","구분","구분","구분"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["부류","부류","부류","부류"], 		ref: 'clsfNm',   	type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["평가부류","평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["품목","품목","품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

			{caption: ["통합조직","통합조직","통합조직","통합조직명"], 		ref: 'corpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합조직","통합조직","통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center;border-right-color: black !important;'},
			/*총취급실적*/
			{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","물량(톤)"]
				,ref: 'totTrmtPrfmncVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,calc : 'fn_totTrmtPrfmncVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","금액(천원)"]
				,ref: 'totTrmtPrfmncAmt',   	type:'input',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
				,calc : 'fn_totTrmtPrfmncAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			/*취급액 공제 실적*/
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","물량(톤)"]
				,ref: 'ddcExprtVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","금액(천원)"]
				,ref: 'ddcExprtAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","물량(톤)"]
				,ref: 'ddcVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","금액(천원)"]
				,ref: 'ddcAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","물량(톤)"]
				,ref: 'ddcArmyDlvgdsVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","금액(천원)"]
				,ref: 'ddcArmyDlvgdsAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","물량(톤)"]
				,ref: 'ddcMlsrVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","금액(천원)"]
				,ref: 'ddcMlsrAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","물량(톤)"]
				,ref: 'ddcTotVlm',   	type:'output',  width:'50px',    style:'text-align:right'
				, calc : 'fn_ddcTotVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","금액(천원)"]
				,ref: 'ddcTotAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
				, calc : 'fn_ddcTotAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			/*조정 취급실적*/
			{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","물량(톤)"]
				,ref: 'ajmtVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				, calc : 'fn_ajmtVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","금액(A)"]//전문품목 매입매출 화면의 매출 총합
				,ref: 'ajmtAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;' , fixedstyle:'border-right-color: black !important;'
				, calc : 'fn_ajmtAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			//{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'delYn',		hidden : true}
		];

		grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
		//grdPrdcrOgnCurntMng02.bind('click','gridClick02');
		grdPrdcrOgnCurntMng02.bind('valuechanged','fn_valuechanged02');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh02 = [
		'totSpmtPrfmncVlm', 'totSpmtPrfmncAmt'
		,'ddcExprtVlm', 'ddcExprtAmt'
		,'ddcVlm', 'ddcAmt'
		,'ddcArmyDlvgdsVlm', 'ddcArmyDlvgdsAmt'
		,'ddcMlsrVlm', 'ddcMlsrAmt',
		,'ajmtVlm','ajmtAmt'
	];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_valuechanged02(){
		grdPrdcrOgnCurntMng02.refresh();
		fn_grdTot02();

		/*
		if(columnsToRefresh02.includes(nRef)){
			let nCol = grdPrdcrOgnCurntMng02.getCol();
			let nRef = grdPrdcrOgnCurntMng02.getRefOfCol(nCol);
			grdPrdcrOgnCurntMng02.refresh();
			fn_grdTot02("refresh");
		}
		*/
	}

	function fn_totTrmtPrfmncVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
			sumVal = Number(gfn_nvl(rowData.ddcExprtVlm))
				+ Number(gfn_nvl(rowData.ddcVlm))
				+ Number(gfn_nvl(rowData.ddcArmyDlvgdsVlm))
				+ Number(gfn_nvl(rowData.ddcMlsrVlm))
				+ Number(gfn_nvl(rowData.ajmtVlm));
		}else{
			sumVal = rowData.totTrmtPrfmncVlm;
		}
		return sumVal;
	}
	function fn_totTrmtPrfmncAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
			sumVal = Number(gfn_nvl(rowData.ddcExprtAmt))
				+ Number(gfn_nvl(rowData.ddcAmt))
				+ Number(gfn_nvl(rowData.ddcArmyDlvgdsAmt))
				+ Number(gfn_nvl(rowData.ddcMlsrAmt))
				+ Number(gfn_nvl(rowData.ajmtAmt));
		}else{
			sumVal = rowData.totTrmtPrfmncAmt;
		}
		return sumVal;
	}

	function fn_ddcTotVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.ddcExprtVlm))
				+ Number(gfn_nvl(rowData.ddcVlm))
				+ Number(gfn_nvl(rowData.ddcArmyDlvgdsVlm))
				+ Number(gfn_nvl(rowData.ddcMlsrVlm));
		return sumVal;
	}
	function fn_ddcTotAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.ddcExprtAmt))
				+ Number(gfn_nvl(rowData.ddcAmt))
				+ Number(gfn_nvl(rowData.ddcArmyDlvgdsAmt))
				+ Number(gfn_nvl(rowData.ddcMlsrAmt));
		return sumVal;
	}

	//조정 취급실적
	function fn_ajmtVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = rowData.totTrmtPrfmncVlm;
		}else{
			sumVal = rowData.ajmtVlm;
		}
		return sumVal;
	}
	//조정 취급실적
	function fn_ajmtAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//기타인 경우 총 취급실적 가져오기
		if(rowData.sttgUpbrItemSe == '3'){
			sumVal = rowData.totTrmtPrfmncAmt;
		}else{
			sumVal = rowData.ajmtAmt;
		}
		return sumVal;
	}


	//소계 추가를 위해 조정
	function fn_grdTot02(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			'totTrmtPrfmncVlm', 'totTrmtPrfmncAmt'

			,'ddcExprtVlm', 'ddcExprtAmt'
			,'ddcVlm', 'ddcAmt'
			,'ddcArmyDlvgdsVlm', 'ddcArmyDlvgdsAmt'
			,'ddcMlsrVlm', 'ddcMlsrAmt'

			,'ddcTotVlm', 'ddcTotAmt'

			,'ajmtVlm', 'ajmtAmt'
		];

		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdPrdcrOgnCurntMng02;
		let grdJson = jsonPrdcrOgnCurntMng02;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 내용 row수
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
		  acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
		  return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});

		objGrid.refresh();

		fn_gridCustom();
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
		grdPrdcrOgnCurntMng03.exportLocalExcel("출자출하조직관리(총 매출현황 - 출자출하조직의 통합조직 출하실적)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid03 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng03';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng03';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng03';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList03;	// 우클릭 메뉴 리스트
		SBGridProperties.frozencols=4;
		SBGridProperties.frozenbottomrows=1;
		//SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["구분","구분","구분","구분"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["부류","부류","부류","부류"], 		ref: 'clsfNm',   	type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["평가부류","평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["품목","품목","품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

			{caption: ["소속 통합조직","소속 통합조직","소속 통합조직","소속 통합조직명"], 		ref: 'corpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["소속 통합조직","소속 통합조직","소속 통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center;border-right-color: black !important;'},

			{caption: ["출자출하조직의 통합조직 출하실적","통합조직 총 출하실적","통합조직 총 출하실적","물량(톤)"]
				,ref: 'totSpmtPrfmncVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","통합조직 총 출하실적","통합조직 총 출하실적","금액(천원)"]//전문품목 매입매출 화면의 매입 총합
				,ref: 'totSpmtPrfmncAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","단순기표","단순기표","물량(톤)"]
				,ref: 'smplInptVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","단순기표","단순기표","금액(천원)"]
				,ref: 'smplInptAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","인정 출하실적","인정 출하실적","물량(톤)"]
				,ref: 'spmtPrfmncVlm',   	type:'output',  width:'50px',    style:'text-align:right'
				,calc: 'fn_spmtPrfmncVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","인정 출하실적","인정 출하실적","금액(B)"]
				,ref: 'spmtPrfmncAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
				,calc: 'fn_spmtPrfmncAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별수탁","물량(톤)"]
				,ref: 'slsCprtnSortTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별수탁","금액(천원)"]
				,ref: 'slsCprtnSortTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별매취","물량(톤)"]
				,ref: 'slsCprtnSortEmspapVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별매취","금액(천원)"]
				,ref: 'slsCprtnSortEmspapAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동출하수탁","물량(톤)"]
				,ref: 'slsCprtnTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동출하수탁","금액(천원)"]
				,ref: 'slsCprtnTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","합계","물량(톤)"]
				,ref: 'slsCprtnTotVlm',   	type:'output',  width:'50px',    style:'text-align:right'
				,calc: 'fn_slsCprtnTotVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","합계","금액(천원)"]
				,ref: 'slsCprtnTotAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
				,calc: 'fn_slsCprtnTotAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

			{caption: ["출자출하조직\n출하율\n(B/A)\n(B:인정 출하실적)\n(A:조정 취급실적)","출자출하조직\n출하율\n(B/A)\n(B:인정 출하실적)\n(A:조정 취급실적)","출자출하조직\n출하율\n(B/A)\n(B:인정 출하실적)\n(A:조정 취급실적)","출자출하조직\n출하율\n(B/A)\n(B:인정 출하실적)\n(A:조정 취급실적)"]
				,ref: 'spmtRtAmt',   	type:'output',  width:'105px',    style:'text-align:right'
				,calc: 'fn_spmtRtAmt'
			},

			{caption: ["상세내역"], 	ref: 'ajmtAmt',  hidden : true},//출하비율 구하는 용도
			{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',  	hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',  	hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'delYn',		hidden : true}
		];

		grdPrdcrOgnCurntMng03 = _SBGrid.create(SBGridProperties);
		//grdPrdcrOgnCurntMng03.bind('click','gridClick03');
		grdPrdcrOgnCurntMng03.bind('valuechanged','fn_valuechanged03');
	}


	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh03 = [
		'totSpmtPrfmncVlm','totSpmtPrfmncAmt'
		,'spmtPrfmncVlm', 'spmtPrfmncAmt'
		, 'smplInptVlm', 'smplInptAmt',
		, 'slsCprtnSortTrstVlm', 'slsCprtnSortTrstAmt'
		, 'slsCprtnSortEmspapVlm','slsCprtnSortEmspapAmt'
		, 'slsCprtnTrstVlm', 'slsCprtnTrstAmt'
	];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_valuechanged03(){
		grdPrdcrOgnCurntMng03.refresh();
		fn_grdTot03();

		/*
		if(columnsToRefresh03.includes(nRef)){
			let nCol = grdPrdcrOgnCurntMng03.getCol();
			let nRef = grdPrdcrOgnCurntMng03.getRefOfCol(nCol);
			grdPrdcrOgnCurntMng03.refresh();
			fn_grdTot03("refresh");
		}
		*/
	}

	//출하실적 물량
	function fn_spmtPrfmncVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.totSpmtPrfmncVlm))
				- Number(gfn_nvl(rowData.smplInptVlm));
		return sumVal;
	}
	//출하실적 금액
	function fn_spmtPrfmncAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.totSpmtPrfmncAmt))
				- Number(gfn_nvl(rowData.smplInptAmt));
		return sumVal;
	}

	function fn_slsCprtnTotVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.slsCprtnTrstVlm))
				+ Number(gfn_nvl(rowData.slsCprtnSortEmspapVlm))
				+ Number(gfn_nvl(rowData.slsCprtnSortTrstVlm));
		return sumVal;
	}

	function fn_slsCprtnTotAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(gfn_nvl(rowData.slsCprtnTrstAmt))
				+ Number(gfn_nvl(rowData.slsCprtnSortEmspapAmt))
				+ Number(gfn_nvl(rowData.slsCprtnSortTrstAmt));
		return sumVal;
	}
	//출자출하조직 출하율
	function fn_spmtRtVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.ajmtVlm > 0 && rowData.spmtPrfmncVlm > 0){
			sumVal = Number(gfn_nvl(rowData.spmtPrfmncVlm)) / Number(gfn_nvl(rowData.ajmtVlm)) * 100
		}
		return sumVal;
	}
	//출자출하조직 출하율
	function fn_spmtRtAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.ajmtAmt > 0 && rowData.spmtPrfmncAmt > 0){
			sumVal = Number(gfn_nvl(rowData.spmtPrfmncAmt)) / Number(gfn_nvl(rowData.ajmtAmt)) * 100
		}
		return sumVal.toFixed(2) + "%";
	}

	//소계 추가를 위해 조정
	function fn_grdTot03(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			'totSpmtPrfmncVlm','totSpmtPrfmncAmt'

			, 'smplInptVlm', 'smplInptAmt',

			,'spmtPrfmncVlm', 'spmtPrfmncAmt'

			, 'slsCprtnSortTrstVlm', 'slsCprtnSortTrstAmt'
			, 'slsCprtnSortEmspapVlm','slsCprtnSortEmspapAmt'
			, 'slsCprtnTrstVlm', 'slsCprtnTrstAmt'

			, 'slsCprtnTotVlm', 'slsCprtnTotAmt'
		];

		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdPrdcrOgnCurntMng03;
		let grdJson = jsonPrdcrOgnCurntMng03;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 내용 row수
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
		  acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
		  return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});

		objGrid.refresh();

		fn_gridCustom();
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


	/* 출력물 */
	const fn_report = async function() {
		let yr = SBUxMethod.get("srch-input-yr");//
		//통합조직인 경우
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");//
		}
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		let apoSe = SBUxMethod.get("srch-input-apoSe");//
		let frmhsHldYn = SBUxMethod.get("srch-input-frmhsHldYn");//
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
		</c:if>

		<c:if test="${loginVO.apoSe eq '1'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		gfn_popClipReport("검색리스트", "pd/totalDoc1.crf", {
			brno: brno
			, yr			: gfn_nvl(yr)
			, frmhsHld 		: "Y"
			, cmptnInst 	: gfn_nvl(cmptnInst)
			, ctpv 			: gfn_nvl(ctpv)
			, corpSeCd 		: gfn_nvl(corpSeCd)
			, corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			, corpNm 		: gfn_nvl(corpNm)
			, aprv 			: gfn_nvl(aprv)
			, apoSe 		: gfn_nvl(apoSe)
			, frmhsHldYn 	: gfn_nvl(frmhsHldYn)
			, yrChk 		: gfn_nvl(yrChkVal)
			, uoBrno 		: gfn_nvl(uoBrno)
		});
		</c:if>
		<c:if test="${loginVO.apoSe eq '1'}">
		gfn_popClipReport("검색리스트", "pd/totalDoc1.crf", {
			brno		: gfn_nvl(brno)
			, yr		: gfn_nvl(yr)
			, frmhsHld 	: "Y"
			, userType 	: "21"
		});
		</c:if>
	}




	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		let yr = SBUxMethod.get("srch-input-yr");//
		//통합조직인 경우
		if(gfn_isEmpty(yr)){
			yr = SBUxMethod.get("dtl-input-yr");//
		}
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		//let apoSe = SBUxMethod.get("srch-input-apoSe");//
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
		let stbltHldYn = SBUxMethod.get("srch-input-stbltHldYn");//
		</c:if>
		<c:if test="${loginVO.apoSe eq '1'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
		brno : brno
		,apoSe : '2'
		,yr : yr
		,stbltYnNm:'Y'

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		,cmptnInst : cmptnInst
		,ctpv : ctpv

		,corpSeCd : corpSeCd
		,corpDtlSeCd : corpDtlSeCd

		,corpNm : corpNm

		,aprv : aprv
		//,apoSe : apoSe
		,uoBrno : uoBrno
		,yrChk : yrChkVal
		,stbltHldYn : stbltHldYn //적합품목 보유 여부
		</c:if>

		<c:if test="${loginVO.apoSe eq '1'}">
		,userType : '21'
		,stbltYnBrno : brno
		</c:if>


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
				//console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				<c:if test="${loginVO.apoSe eq '1'}">
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt1').hide();
					$('#btnSaveFclt2').hide();
					$('#btnSaveFclt3').hide();
				}
				</c:if>
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
						,stbltYnNm: item.stbltYnNm
						,stbltYnNmList: item.stbltYnNmList
						,stbltYnNmList1: item.stbltYnNmList1
						,stbltYnNmList2: item.stbltYnNmList2
						,corpSeCd: item.corpSeCd
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
	const fn_dtlSearch = async function(){
		let brno = '${loginVO.brno}';
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(brno)) return;
		if(gfn_isEmpty(yr)) return;

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			,yr:yr
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
				SBUxMethod.set('dtl-input-prfmncCorpDdlnYn',gfn_nvl(item.prfmncCorpDdlnYn))//실적 법인체 마감
				if(gfn_isEmpty(item.yr)){
					//저장 버튼 숨김처리
					$('#btnSaveFclt1').hide();
					alert('신청정보가 없습니다');
				}
				//console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt2').hide();
					$('#btnSaveFclt3').hide();
				}
			});
			//총매입매출은 전체 값이 다보여야 해서 통합조직을 고르지 않음
			//fn_searchUoList();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	//매입 다중 세이브
	const fn_listSave01 = async function(){

		let objGrid = grdPrdcrOgnCurntMng01;

		let gridData01 = objGrid.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');

		if(gfn_isEmpty(brno)) return;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		for(var i = captionRow; i < gridData01.length + captionRow; i++ ){
			let rowData01 = objGrid.getRowData(i);
			let rowSts01 = objGrid.getRowStatus(i);
			let delYn = rowData01.delYn;

			if(delYn == 'N'){
				if( Number(rowData01.prchsSortEmspapAmt) > 0
						&& (gfn_isEmpty(rowData01.prchsSortEmspapVlm) || Number(rowData01.prchsSortEmspapVlm) == 0)){
					alert('공동선별매취 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}

				rowData01.apoCd = apoCd;
				rowData01.apoSe = apoSe;
				rowData01.crno = crno;
				rowData01.brno = brno;

				rowData01.rowSts = "I";
				saveList.push(rowData01);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveInvShipOgnPurSalMngList01.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
					//fn_searchFcltList();
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

	//매출 다중 세이브
	const fn_listSave02 = async function(){
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');

		let objGrid = grdPrdcrOgnCurntMng02;
		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		let gridData02 = objGrid.getGridDataAll();
		for(var i = captionRow; i < gridData02.length + captionRow; i++ ){
			let rowData02 = objGrid.getRowData(i);
			let rowSts02 = objGrid.getRowStatus(i);

			let delYn = rowData02.delYn;

			if(delYn == 'N'){

				if( Number(rowData02.totTrmtPrfmncAmt) > 0 && rowData02.sttgUpbrItemSe === '3'
						&& (gfn_isEmpty(rowData02.totTrmtPrfmncVlm) || Number(rowData02.totTrmtPrfmncVlm) == 0)){
					alert('총취급실적 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}

				if( Number(rowData02.ddcExprtAmt) > 0 && rowData02.sttgUpbrItemSe !== '3'
						&& (gfn_isEmpty(rowData02.ddcExprtVlm) || Number(rowData02.ddcExprtVlm) == 0)){
					alert('자체수출 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}
				if( Number(rowData02.ddcAmt) > 0 && rowData02.sttgUpbrItemSe !== '3'
						&& (gfn_isEmpty(rowData02.ddcVlm) || Number(rowData02.ddcVlm) == 0)){
					alert('자체공판장 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}

				if( Number(rowData02.ddcArmyDlvgdsAmt) > 0 && rowData02.sttgUpbrItemSe !== '3'
					&& (gfn_isEmpty(rowData02.ddcArmyDlvgdsVlm) || Number(rowData02.ddcArmyDlvgdsVlm) == 0)){
					alert('군납 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}

				if( Number(rowData02.ddcMlsrAmt) > 0 && rowData02.sttgUpbrItemSe !== '3'
					&& (gfn_isEmpty(rowData02.ddcMlsrVlm) || Number(rowData02.ddcMlsrVlm) == 0)){
					alert('학교급식 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}


				rowData02.apoCd = apoCd;
				rowData02.apoSe = apoSe;
				rowData02.crno = crno;
				rowData02.brno = brno;
				rowData02.brno = brno;

				rowData02.rowSts = "I";
				saveList.push(rowData02);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveInvShipOgnPurSalMngList02.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
					//fn_searchFcltList();
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

	//매출 다중 세이브
	const fn_listSave03 = async function(){

		let objGrid = grdPrdcrOgnCurntMng03;

		let gridData03 = objGrid.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		for(var i = captionRow; i < gridData03.length + captionRow; i++ ){
			let rowData = objGrid.getRowData(i);
			let rowSts = objGrid.getRowStatus(i);

			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if( Number(rowData.totSpmtPrfmncAmt) > 0 && rowData.sttgUpbrItemSe === '3'
						&& (gfn_isEmpty(rowData.totSpmtPrfmncVlm) || Number(rowData.totSpmtPrfmncVlm) == 0)){
					alert('통합조직 총 출하실적 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}

				if( Number(rowData.smplInptAmt) > 0 && rowData.sttgUpbrItemSe !== '3'
						&& (gfn_isEmpty(rowData.smplInptVlm) || Number(rowData.smplInptVlm) == 0)){
					alert('단순기표 금액이 존재하는 경우 물량 입력이 필요합니다');
					objGrid.selectRow(i);
					return false;
				}

				if( Number(rowData.spmtPrfmncAmt) < 0 && rowData.sttgUpbrItemSe !== '3'){
					alert('인정출하실적 금액이 음수 일수 없습니다');
					objGrid.selectRow(i);
					return false;
				}
				if( Number(rowData.spmtPrfmncVlm) < 0 && rowData.sttgUpbrItemSe !== '3'){
					alert('인정출하실적 물량이 음수 일수 없습니다');
					objGrid.selectRow(i);
					return false;
				}

				rowData.apoCd = apoCd;
				rowData.apoSe = apoSe;
				rowData.crno = crno;
				rowData.brno = brno;
				rowData.brno = brno;

				rowData.rowSts = "I";
				saveList.push(rowData);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveInvShipOgnPurSalMngList03.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
					//fn_searchFcltList();
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


	//통합조직 리스트 그리드 클릭시  이벤트
	const fn_view = async function(){
		let objGrid = grdPrdcrOgnCurntMng;
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

		let rowData = objGrid.getRowData(nRow);
		fn_clearForm();

		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호

		//총매입매출은 전체 값이 다보여야 해서 통합조직을 고르지 않음
		//fn_searchUoList();
	}

	//매입 매출 그리드 초기화
	async function fn_clearForm() {

		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-uoBrno',null)//선택한 통합조직
		SBUxMethod.set('dtl-input-selUoBrno',null)//상위 통합조직 리스트

		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
		jsonPrdcrOgnCurntMng03.length= 0;
		grdPrdcrOgnCurntMng03.rebuild();

	}


	//총괄표 출력
	const fn_report2 = async function() {

		//조회 대상 유무 확인
		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		//let apoSe = SBUxMethod.get('dtl-input-apoSe');
		//let itemCd = SBUxMethod.get('dtl-input-itemCd');
		//let ctgryCd = SBUxMethod.get('dtl-input-ctgryCd');
		//총매입매출은 통합조직을 고르지 않고 전체 데이터를 보여줌
		//let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let reqCorpNmT = $('#dtl-input-corpNm').val();
		let reqBrnoT = $('#dtl-input-brno').val();
		let reqCrnoT = $('#dtl-input-crno').val();

		gfn_popClipReport("출자출하조직 총 매입 매출 현황", "pd/totalDoc2.crf", {
			brno : gfn_nvl(brno)
			, yr : gfn_nvl(yr)
			, reqCorpNm : gfn_nvl(reqCorpNmT)
			, reqBrno : gfn_nvl(reqBrnoT)
			, reqCrno : gfn_nvl(reqCrnoT)
		});
	}

	//통합조직 매입 매출 리스트 조회
	async function fn_dtlGridSearch() {
		//조회 대상 유무 확인
		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)){return;}

		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise01 = gfn_postJSON("/pd/isom/selectInvShipOgnPurSalMngPrchsSlsListNew.do", {
			brno : brno
			,yr : yr
		});
		let data = await postJsonPromise01;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			jsonPrdcrOgnCurntMng02.length = 0;
			jsonPrdcrOgnCurntMng03.length = 0;
			console.log("data==="+data);
			data.resultPrchsList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO01 = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno
						,delYn: item.delYn
						,yr: item.yr
						,uoBrno: item.uoBrno
						,corpNm: item.corpNm

						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm

						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm
						,ctgryCd: 		item.ctgryCd
						,ctgryNm: 		item.ctgryNm
						,clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,prchsSlsSe: 	item.prchsSlsSe

						,prchsSortTrstVlm: 		item.prchsSortTrstVlm
						,prchsSortTrstAmt: 		item.prchsSortTrstAmt
						,prchsSpmtTrstVlm: 		item.prchsSpmtTrstVlm
						,prchsSpmtTrstAmt: 		item.prchsSpmtTrstAmt
						,prchsSmplTrstVlm: 		item.prchsSmplTrstVlm
						,prchsSmplTrstAmt: 		item.prchsSmplTrstAmt

						,prchsTrstVlm: 			item.prchsTrstVlm
						,prchsTrstAmt: 			item.prchsTrstAmt

						,prchsSortEmspapVlm: 	item.prchsSortEmspapVlm
						,prchsSortEmspapAmt: 	item.prchsSortEmspapAmt
						,prchsSmplEmspapVlm: 	item.prchsSmplEmspapVlm
						,prchsSmplEmspapAmt: 	item.prchsSmplEmspapAmt

						,prchsEmspapVlm: 		item.prchsEmspapVlm
						,prchsEmspapAmt: 		item.prchsEmspapAmt

						,prchsTotVlm: 			item.prchsTotVlm
						,prchsTotAmt: 			item.prchsTotAmt
						//,etcVlm: 				item.etcVlm
						//,etcAmt: 				item.etcAmt

				};
				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
			})
			data.resultSlsList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO02 = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno
						,delYn: item.delYn
						,yr: item.yr
						,uoBrno: item.uoBrno
						,corpNm: item.corpNm

						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm

						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm
						,ctgryCd: 		item.ctgryCd
						,ctgryNm: 		item.ctgryNm
						,clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,prchsSlsSe: 	item.prchsSlsSe


						,slsSmplTrstVlm: 	item.slsSmplTrstVlm
						,slsSmplTrstAmt: 	item.slsSmplTrstAmt
						,slsSmplEmspapVlm: 	item.slsSmplEmspapVlm
						,slsSmplEmspapAmt: 	item.slsSmplEmspapAmt

						,slsEmspapVlm: 		item.slsEmspapVlm
						,slsEmspapAmt: 		item.slsEmspapAmt
						,slsTrstVlm: 		item.slsTrstVlm
						,slsTrstAmt: 		item.slsTrstAmt

						,totTrmtPrfmncVlm: 		item.totTrmtPrfmncVlm
						,totTrmtPrfmncAmt: 		item.totTrmtPrfmncAmt

						,ddcExprtVlm: 		item.ddcExprtVlm
						,ddcExprtAmt: 		item.ddcExprtAmt
						,ddcVlm: 			item.ddcVlm
						,ddcAmt: 			item.ddcAmt
						,ddcArmyDlvgdsVlm: 	item.ddcArmyDlvgdsVlm
						,ddcArmyDlvgdsAmt: 	item.ddcArmyDlvgdsAmt
						,ddcMlsrVlm: 		item.ddcMlsrVlm
						,ddcMlsrAmt: 		item.ddcMlsrAmt

						,ajmtVlm: 		item.ajmtVlm
						,ajmtAmt: 		item.ajmtAmt

						,slsTotVlm: 		item.slsTotVlm
						,slsTotAmt: 		item.slsTotAmt
				};
				let PrdcrOgnCurntMngVO03 = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno
						,delYn: item.delYn
						,yr: item.yr
						,uoBrno: item.uoBrno
						,corpNm: item.corpNm

						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm

						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm
						,ctgryCd: 		item.ctgryCd
						,ctgryNm: 		item.ctgryNm
						,clsfCd: 		item.clsfCd
						,clsfNm: 		item.clsfNm
						,prchsSlsSe: 	item.prchsSlsSe

						,totSpmtPrfmncVlm: 		item.totSpmtPrfmncVlm
						,totSpmtPrfmncAmt: 		item.totSpmtPrfmncAmt

						,smplInptVlm: 			item.smplInptVlm
						,smplInptAmt: 			item.smplInptAmt
						,spmtPrfmncVlm: 		item.spmtPrfmncVlm
						,spmtPrfmncAmt: 		item.spmtPrfmncAmt

						,slsCprtnSortTrstVlm: 		item.slsCprtnSortTrstVlm
						,slsCprtnSortTrstAmt: 		item.slsCprtnSortTrstAmt
						,slsCprtnSortEmspapVlm: 	item.slsCprtnSortEmspapVlm
						,slsCprtnSortEmspapAmt: 	item.slsCprtnSortEmspapAmt
						,slsCprtnTrstVlm: 			item.slsCprtnTrstVlm
						,slsCprtnTrstAmt: 			item.slsCprtnTrstAmt

						,slsCprtnTotVlm: 			item.slsCprtnTotVlm
						,slsCprtnTotAmt: 			item.slsCprtnTotAmt

						,ajmtAmt: 		item.ajmtAmt
				}
				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO02);
				jsonPrdcrOgnCurntMng03.push(PrdcrOgnCurntMngVO03);
			})
			grdPrdcrOgnCurntMng03.rebuild();
			grdPrdcrOgnCurntMng02.rebuild();
			grdPrdcrOgnCurntMng01.rebuild();
			//grdPrdcrOgnCurntMng04.rebuild(); 매출현황 요약

			//소계 줄 추가
			grdPrdcrOgnCurntMng03.addRow();
			grdPrdcrOgnCurntMng02.addRow();
			grdPrdcrOgnCurntMng01.addRow();

			fn_grdTot03();
			fn_grdTot02();
			fn_grdTot01();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//그리드 커스텀 배경 및 disabled 처리
	const fn_gridCustom = async function(){
		//console.log("=========fn_gridCustom================");

		//매입 그리드
		let objGrid01 = grdPrdcrOgnCurntMng01;

		let prchsSortTrstAmt = objGrid01.getColRef("prchsSortTrstAmt");//
		let prchsSpmtTrstAmt = objGrid01.getColRef("prchsSpmtTrstAmt");//
		let prchsSmplTrstAmt = objGrid01.getColRef("prchsSmplTrstAmt");//

		let prchsSortTrstVlm = objGrid01.getColRef("prchsSortTrstVlm");//
		let prchsSpmtTrstVlm = objGrid01.getColRef("prchsSpmtTrstVlm");//
		let prchsSmplTrstVlm = objGrid01.getColRef("prchsSmplTrstVlm");//

		let prchsSortEmspapAmt = objGrid01.getColRef("prchsSortEmspapAmt");//
		let prchsSmplEmspapAmt = objGrid01.getColRef("prchsSmplEmspapAmt");//

		let prchsSortEmspapVlm = objGrid01.getColRef("prchsSortEmspapVlm");//
		let prchsSmplEmspapVlm = objGrid01.getColRef("prchsSmplEmspapVlm");//

		let prchsTrstVlm = objGrid01.getColRef("prchsTrstVlm");//
		let prchsTrstAmt = objGrid01.getColRef("prchsTrstAmt");//
		let prchsEmspapVlm = objGrid01.getColRef("prchsEmspapVlm");//
		let prchsEmspapAmt = objGrid01.getColRef("prchsEmspapAmt");//

		let prchsTotVlm = objGrid01.getColRef("prchsTotVlm");//
		let prchsTotAmt = objGrid01.getColRef("prchsTotAmt");//

		let sttgUpbrItemNm01 = objGrid01.getColRef("sttgUpbrItemNm");//

		let gridData01 = objGrid01.getGridDataAll();
		//그리드 해더 row수
		let captionRow01 = objGrid01.getFixedRows();
		for(var i = captionRow01; i < gridData01.length + captionRow01; i++){
			let rowData = objGrid01.getRowData(i);
			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				//disabled 처리
				objGrid01.setCellDisabled(i, prchsSortTrstVlm, i, prchsSortTrstAmt, true);
				objGrid01.setCellDisabled(i, prchsSpmtTrstVlm, i, prchsSpmtTrstAmt, true);
				objGrid01.setCellDisabled(i, prchsSortEmspapVlm, i, prchsSortEmspapAmt, true);

				objGrid01.setCellDisabled(i, prchsTrstVlm, i, prchsTrstAmt, true);
				objGrid01.setCellDisabled(i, prchsEmspapVlm, i, prchsEmspapAmt, true);
				objGrid01.setCellDisabled(i, prchsTotVlm, i, prchsEmspapAmt, true);

				//배경 속성 추가
				objGrid01.setCellStyle('background-color', i, prchsSortTrstVlm, i, prchsSortTrstAmt, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsSpmtTrstVlm, i, prchsSpmtTrstAmt, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsSortEmspapVlm, i, prchsSortEmspapAmt, 'lightgray');

				objGrid01.setCellStyle('background-color', i, prchsTrstVlm, i, prchsTrstAmt, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsEmspapVlm, i, prchsEmspapAmt, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsTotVlm, i, prchsTotVlm, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsTotAmt, i, prchsTotAmt, 'lightgray');
				//해당 타입 위치 저장
			}else if (rowData.sttgUpbrItemSe == '3') {
				objGrid01.setCellDisabled(i, prchsSortTrstVlm, i, prchsSortTrstAmt, false);
				objGrid01.setCellDisabled(i, prchsSpmtTrstVlm, i, prchsSpmtTrstAmt, false);
				objGrid01.setCellDisabled(i, prchsSortEmspapVlm, i, prchsSortEmspapAmt, false);

				objGrid01.setCellDisabled(i, prchsTrstVlm, i, prchsTrstAmt, true);
				objGrid01.setCellDisabled(i, prchsEmspapVlm, i, prchsEmspapAmt, true);
				objGrid01.setCellDisabled(i, prchsTotVlm, i, prchsTotAmt, true);

				//objGrid01.setCellStyle('background-color', i, prchsSortTrstVlm, i, prchsTotAmt, 'white');

				objGrid01.setCellStyle('background-color', i, prchsTrstVlm, i, prchsTrstAmt, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsEmspapVlm, i, prchsEmspapAmt, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsTotVlm, i, prchsTotVlm, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsTotAmt, i, prchsTotAmt, 'lightgray');
			}else{
				objGrid01.setCellDisabled(i, sttgUpbrItemNm01, i, prchsTotAmt, true);
				objGrid01.setCellStyle('background-color', i, sttgUpbrItemNm01, i, prchsTotAmt, 'lightgray');
			}
		}

		let objGrid02 = grdPrdcrOgnCurntMng02;

		let totTrmtPrfmncVlm = objGrid02.getColRef("totTrmtPrfmncVlm");//총취급물량
		let totTrmtPrfmncAmt = objGrid02.getColRef("totTrmtPrfmncAmt");//총취급실적
		let ddcTotVlm = objGrid02.getColRef("ddcTotVlm");//
		let ddcTotAmt = objGrid02.getColRef("ddcTotAmt");//
		let ajmtVlm = objGrid02.getColRef("ajmtVlm");//
		let ajmtAmt = objGrid02.getColRef("ajmtAmt");//

		let ddcExprtVlm = objGrid02.getColRef("ddcExprtVlm");//자체수출 물량

		let sttgUpbrItemNm02 = objGrid02.getColRef("sttgUpbrItemNm");//

		let gridData02 = objGrid02.getGridDataAll();
		//그리드 해더 row수
		let captionRow02 = objGrid02.getFixedRows();
		for(var i = captionRow02; i < gridData02.length + captionRow02; i++){
			let rowData = objGrid02.getRowData(i);

			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				//비활성화
				objGrid02.setCellDisabled(i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, true);
				objGrid02.setCellDisabled(i, ddcTotVlm, i, ddcTotAmt, true);
				objGrid02.setCellDisabled(i, ajmtVlm, i, ajmtAmt, true);

				//배경색
				objGrid02.setCellStyle('background-color', i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, ddcTotVlm, i, ddcTotAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, ajmtVlm, i, ajmtAmt, 'lightgray');

			}else if(rowData.sttgUpbrItemSe == '3'){
				//기타
				//비활성화
				objGrid02.setCellDisabled(i, ddcExprtVlm, i, ajmtAmt, true);

				//배경색
				objGrid02.setCellStyle('background-color', i, ddcExprtVlm, i, ajmtAmt, 'lightgray');

				//소계였던 줄 떄문에 추가
				objGrid02.setCellDisabled(i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, false);
				objGrid02.setCellStyle('background-color', i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, 'white');

			}else{
				//소계
				//비활성화
				objGrid02.setCellDisabled(i, sttgUpbrItemNm02, i, ajmtAmt, true);
				//배경색
				objGrid02.setCellStyle('background-color', i, sttgUpbrItemNm02, i, ajmtAmt, 'lightgray');
			}
		}

		let objGrid03 = grdPrdcrOgnCurntMng03;

		let totSpmtPrfmncVlm = objGrid03.getColRef("totSpmtPrfmncVlm");//
		let totSpmtPrfmncAmt = objGrid03.getColRef("totSpmtPrfmncAmt");//
		let slsCprtnTotVlm = objGrid03.getColRef("slsCprtnTotVlm");//
		let slsCprtnTotAmt = objGrid03.getColRef("slsCprtnTotAmt");//
		let spmtRtAmt = objGrid03.getColRef("spmtRtAmt");//

		let smplInptVlm = objGrid03.getColRef("smplInptVlm");//

		let slsCprtnSortTrstVlm = objGrid03.getColRef("slsCprtnSortTrstVlm");//

		let sttgUpbrItemNm03 = objGrid03.getColRef("sttgUpbrItemNm");//

		let gridData03 = objGrid03.getGridDataAll();
		//그리드 해더 row수
		let captionRow03 = objGrid03.getFixedRows();
		for(var i = captionRow03; i < gridData03.length + captionRow03; i++){
			let rowData = objGrid03.getRowData(i);

			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				//비활성화
				objGrid03.setCellDisabled(i, totSpmtPrfmncAmt, i, totSpmtPrfmncAmt, true);
				objGrid03.setCellDisabled(i, slsCprtnSortTrstVlm, i, spmtRtAmt, true);

				//배경색
				objGrid03.setCellStyle('background-color', i, totSpmtPrfmncVlm, i, totSpmtPrfmncAmt, 'lightgray');
				objGrid03.setCellStyle('background-color', i, slsCprtnSortTrstVlm, i, spmtRtAmt, 'lightgray');

			}else if(rowData.sttgUpbrItemSe == '3'){
				//기타
				//비활성화
				objGrid03.setCellDisabled(i, smplInptVlm, i, spmtRtAmt, true);

				//배경색
				objGrid03.setCellStyle('background-color', i, smplInptVlm, i, spmtRtAmt, 'lightgray');

				//소계였던 줄 떄문에 추가
				objGrid03.setCellDisabled(i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, false);
				objGrid03.setCellStyle('background-color', i, totSpmtPrfmncVlm, i, totSpmtPrfmncAmt, 'white');

			}else{
				//소계
				//비활성화
				objGrid03.setCellDisabled(i, sttgUpbrItemNm03, i, spmtRtAmt, true);
				//배경색
				objGrid03.setCellStyle('background-color', i, sttgUpbrItemNm03, i, spmtRtAmt, 'lightgray');
			}
		}
	}

	var comUoBrno = [];//통합조직 선택

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(){
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
		console.log(selCombo);
		if( typeof selCombo == "undefined" || selCombo == null || selCombo == "" ){
			SBUxMethod.set('dtl-input-uoBrno' , null);
			//SBUxMethod.set('dtl-input-uoCd' , null);
		}else{
			SBUxMethod.set('dtl-input-uoBrno',selCombo.value);
			//SBUxMethod.set('dtl-input-uoCd',selCombo.uoApoCd);
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
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["신청년도"],		ref: 'yr',                    type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["사업자번호"],		ref: 'brno',                  type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["법인명"],		ref: 'corpNm',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["통합조직 구분"],		ref: 'aprv',                  type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입/매출 구분"],		ref: 'prchsSlsSe',            type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입/매출 구분"],		ref: 'prchsSlsSeNm',          type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["전문/육선/기타 구분"],		ref: 'sttgUpbrItemSe',        type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["전문/육선/기타 구분"],		ref: 'sttgUpbrItemNm',        type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["품목코드"],		ref: 'itemCd',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["품목명"],		ref: 'itemNm',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["분류코드"],		ref: 'ctgryCd',               type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["분류명"],		ref: 'ctgryNm',               type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["통합조직사업자번호"],		ref: 'uoBrno',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["통합조직명"],		ref: 'uoCorpNm',              type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 수탁 물량(톤)"],		ref: 'prchsTrstVlm',          type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 수탁 금액(천원)"],		ref: 'prchsTrstAmt',          type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 매취 물량(톤)"],		ref: 'prchsEmspapVlm',        type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 매취 금액(천원)"],		ref: 'prchsEmspapAmt',        type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 합계 물량(톤)"],		ref: 'prchsVlmTot',           type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 합계 금액(천원)"],		ref: 'prchsAmtTot',           type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["기타 물량(톤)"],		ref: 'etcVlm',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["기타 금액(천원)"],		ref: 'etcAmt',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 합계 물량(톤)"],		ref: 'totTrmtPrfmncVlm',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["매입 합계 금액(천원)"],		ref: 'totTrmtPrfmncAmt',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["총취급실적 물량(톤)"],		ref: 'totTrmtPrfmncVlm1',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["총취급실적 금액(천원)"],		ref: 'totTrmtPrfmncAmt1',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["자체수출 물량(톤)"],		ref: 'ddcExprtVlm',           type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["자체수출 금액(천원)"],		ref: 'ddcExprtAmt',           type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["자체공판장 물량(톤)"],		ref: 'ddcVlm',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["자체공판장 금액(천원)"],		ref: 'ddcAmt',                type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["군납 물량(톤)"],		ref: 'ddcArmyDlvgdsVlm',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["군납 금액(천원)"],		ref: 'ddcArmyDlvgdsAmt',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["학교급식 물량(톤)"],		ref: 'ddcMlsrVlm',            type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["학교급식 금액(천원)"],		ref: 'ddcMlsrAmt',            type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공제대상 소계 물량(톤)"],		ref: 'ddcVlmTot',             type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공제대상 소계 금액(천원)"],		ref: 'ddcAmtTot',             type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["조정 취급실적 물량(톤)"],		ref: 'ajmtVlm',               type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["조정 취급실적 금액(A)"],		ref: 'ajmtAmt',               type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["총 출하실적 물량(톤)"],		ref: 'totSpmtPrfmncVlm',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["총 출하실적 금액(천원)"],		ref: 'totSpmtPrfmncAmt',      type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["단순기표 물량(톤)"],		ref: 'smplInptVlm',           type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["단순기표 금액(천원)"],		ref: 'smplInptAmt',           type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["출하실적 물량(톤)"],		ref: 'spmtPrfmncVlm',         type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["출하실적 금액(B)"],		ref: 'spmtPrfmncAmt',         type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공동선별수탁 물량(톤)"],		ref: 'slsCprtnSortTrstVlm',   type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공동선별수탁 금액(천원)"],		ref: 'slsCprtnSortTrstAmt',   type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공동선별매취 물량(톤)"],		ref: 'slsCprtnSortEmspapVlm', type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공동선별매취 금액(천원)"],		ref: 'slsCprtnSortEmspapAmt', type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공동출하수탁 물량(톤)"],		ref: 'slsCprtnTrstVlm',       type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["공동출하수탁 금액(천원)"],		ref: 'slsCprtnTrstAmt',       type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["합계 물량(톤)"],		ref: 'slsCprtnVlmTot',        type:'output',  width:'70px',	style:'text-align:center'},
			{caption: ["합계 금액(천원)"],		ref: 'slsCprtnAmtTot',        type:'output',  width:'70px',	style:'text-align:center'},
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

		let postJsonPromise = gfn_postJSON("/pd/isom/selectInvShipOgnPurSalMngRawDataList.do", {
			yr : yr
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						yr						: item.yr
						,brno					: item.brno
						,corpNm					: item.corpNm
						,aprv					: item.aprv
						,prchsSlsSe				: item.prchsSlsSe
						,prchsSlsSeNm			: item.prchsSlsSeNm
						,sttgUpbrItemSe			: item.sttgUpbrItemSe
						,sttgUpbrItemNm			: item.sttgUpbrItemNm
						,itemCd					: item.itemCd
						,itemNm					: item.itemNm
						,ctgryCd				: item.ctgryCd
						,ctgryNm				: item.ctgryNm
						,uoBrno					: item.uoBrno
						,uoCorpNm				: item.uoCorpNm

						,prchsTrstVlm			: Number(item.prchsTrstVlm)
						,prchsTrstAmt			: Number(item.prchsTrstAmt)
						,prchsEmspapVlm			: Number(item.prchsEmspapVlm)
						,prchsEmspapAmt			: Number(item.prchsEmspapAmt)
						,prchsVlmTot			: Number(item.prchsTotVlm)
						,prchsAmtTot			: Number(item.prchsTotAmt)
						,etcVlm					: Number(item.etcVlm)
						,etcAmt					: Number(item.etcAmt)

						,slsCprtnSortTrstVlm	: Number(item.slsCprtnSortTrstVlm)
						,slsCprtnSortTrstAmt	: Number(item.slsCprtnSortTrstAmt)
						,slsCprtnTrstVlm		: Number(item.slsCprtnTrstVlm)
						,slsCprtnTrstAmt		: Number(item.slsCprtnTrstAmt)
						,slsCprtnSortEmspapVlm	: Number(item.slsCprtnSortEmspapVlm)
						,slsCprtnSortEmspapAmt	: Number(item.slsCprtnSortEmspapAmt)
						,slsCprtnVlmTot			: Number(item.slsCprtnVlmTot)
						,slsCprtnAmtTot			: Number(item.slsCprtnAmtTot)
						,ddcExprtVlm			: Number(item.ddcExprtVlm)
						,ddcExprtAmt			: Number(item.ddcExprtAmt)
						,ddcVlm					: Number(item.ddcVlm)
						,ddcAmt					: Number(item.ddcAmt)
						,ddcArmyDlvgdsVlm		: Number(item.ddcArmyDlvgdsVlm)
						,ddcArmyDlvgdsAmt		: Number(item.ddcArmyDlvgdsAmt)
						,ddcMlsrVlm				: Number(item.ddcMlsrVlm)
						,ddcMlsrAmt				: Number(item.ddcMlsrAmt)
						,ddcVlmTot				: Number(item.ddcVlmTot)
						,ddcAmtTot				: Number(item.ddcAmtTot)
						,spmtPrfmncVlm			: Number(item.spmtPrfmncVlm)
						,spmtPrfmncAmt			: Number(item.spmtPrfmncAmt)
						,smplInptVlm			: Number(item.smplInptVlm)
						,smplInptAmt			: Number(item.smplInptAmt)
						,ajmtVlm				: Number(item.ajmtVlm)
						,ajmtAmt				: Number(item.ajmtAmt)
						,totTrmtPrfmncVlm		: Number(item.totTrmtPrfmncVlm)
						,totTrmtPrfmncAmt		: Number(item.totTrmtPrfmncAmt)
						,totTrmtPrfmncVlm1		: Number(item.totTrmtPrfmncVlm)
						,totTrmtPrfmncAmt1		: Number(item.totTrmtPrfmncAmt)
						,totSpmtPrfmncVlm		: Number(item.totSpmtPrfmncVlm)
						,totSpmtPrfmncAmt		: Number(item.totSpmtPrfmncAmt)
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

		let fileName = formattedDate + "_총매입매출_출자출하조직_로우데이터";

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

