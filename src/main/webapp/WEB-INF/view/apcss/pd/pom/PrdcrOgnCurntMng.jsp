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
					<!-- 생산자조직 현황 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '21'}">
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="생산자조직 로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnRowData1" name="btnRowData1" uitype="normal" text="농가 로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect01"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					 -->
					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType eq '22'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="생산자조직 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch01"></sbux-button>
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="생산자조직 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList01"></sbux-button>
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="생산자조직 출력" onclick="fn_report2"></sbux-button>
					<sbux-button id="btnReport4" name="btnReport4" uitype="normal" class="btn btn-sm btn-primary" text="생산자조직 하위 농가리스트 출력" onclick="fn_report4"></sbux-button>
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
								></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">조직구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-apoSe"
									name="srch-input-apoSe"
									uitype="single"
									jsondata-ref="jsonComApoSe"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td class="td_input"></td>

							<th colspan="2" scope="row" class="th_bg">생산자조직 보유 여부</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-frmhsHldYn"
									name="srch-input-frmhsHldYn"
									uitype="single"
									jsondata-ref="jsonComFrmhsHldYnYn"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
						</tr>
						<tr>
							<th scope="row" class="th_bg">통합조직 사업자번호로 검색</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-uoBrno"
									name="srch-input-uoBrno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

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
							<td class="td_input"></td>

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
							<!--
							<td colspan="6" class="td_input" style="border-right: hidden;border-bottom: hidden;">
							-->
						</tr>
					</tbody>
				</table>

			</c:if>
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '21'}">
				<!-- 통합조직 정보 , 통합조직 진척도 -->
				<c:if test="${loginVO.userType eq '21'}">
					<table class="table table-bordered tbl_fixed">
						<caption>통합조직 정보 표기</caption>
						<tbody>
							<tr>
								<th scope="row" class="th_bg th_border_right">법인명</th>
								<sbux-input uitype="hidden" id="dtl-input-userApoCd" name="dtl-input-userApoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-userApoSe" name="dtl-input-userApoSe"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
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
				<br>
				<!-- 생산자 조직 리스트 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="생산자조직 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch01"></sbux-button>

						<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="생산자조직 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList01"></sbux-button>
						</c:if>
						<sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" class="btn btn-sm btn-primary" text="과거실적 팝업" onclick="fn_openMaodal"></sbux-button>
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="생산자조직 출력" onclick="fn_report2"></sbux-button>
						<sbux-button id="btnReport4" name="btnReport4" uitype="normal" class="btn btn-sm btn-primary" text="생산자조직 하위 농가리스트 출력" onclick="fn_report4"></sbux-button>
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">조직구분</th>
							<td colspan="2" class="td_input">
								<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-crno" name="dtl-input-crno"></sbux-input>
								<!--
								<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
								 -->
								<sbux-input uitype="hidden" id="dtl-input-uoCd" name="dtl-input-uoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-prfmncCorpDdlnYn" name="dtl-input-prfmncCorpDdlnYn"></sbux-input>
								<sbux-select
									id="dtl-input-apoSe"
									name="dtl-input-apoSe"
									uitype="single"
									jsondata-ref="jsonComApoSe"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<!--
							<td class="td_input">
							 -->
							<th scope="row" class="th_bg th_border_right">법인명</th>
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
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
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
								<sbux-input
									uitype="text"
									id="dtl-input-uoBrno"
									name="dtl-input-uoBrno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!--
							<td class="td_input"  style="border-left: hidden;">
							<td colspan="5" class="td_input"  style="border-left: hidden;">
							</td>
							 -->
						</tr>
					</tbody>
				</table>

				<!-- 출자출하조직 진척도 -->
				<c:if test="${loginVO.userType eq '22'}">
					<!--
					%@ include file="../prgrs/PrgrsIso.jsp" %>
					-->
				</c:if>

				<!--[pp] 검색결과 상세보기-->
				<!-- 생산자조직 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶생산자조직 리스트</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:200px; width: 100%;"></div>
				</div>
				<br>
				<!-- 농가 리스트 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt2" name="btnSearchFclt2" uitype="normal" text="농가리스트 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch02"></sbux-button>

						<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="농가리스트 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList02"></sbux-button>
						</c:if>

						<sbux-button id="btnReport3" name="btnReport3" uitype="normal" class="btn btn-sm btn-primary" text="농가리스트 출력" onclick="fn_report3"></sbux-button>
						<sbux-button id="btnDown" name="btnDown" uitype="normal" text="서식다운" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld"></sbux-button>

						<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnUpload" name="btnUpload" uitype="normal" text="엑셀업로드" class="btn btn-sm btn-outline-danger" onclick="fn_upload"></sbux-button>
						</c:if>

					</div>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">생산자조직 명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd01" name="dtl-input-apoCd01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe01" name="dtl-input-apoSe01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-brno01" name="dtl-input-brno01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-crno01" name="dtl-input-crno01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr01" name="dtl-input-yr01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-prdcrOgnzSn" name="dtl-input-prdcrOgnzSn"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-prdcrOgnzCd" name="dtl-input-prdcrOgnzCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-sttgUpbrItemSe" name="dtl-input-sttgUpbrItemSe"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-prdcrOgnzNm"
									name="dtl-input-prdcrOgnzNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">품목</th>
							<sbux-input uitype="hidden" id="dtl-input-itemCd" name="dtl-input-itemCd"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-itemNm"
									name="dtl-input-itemNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
								<!--
								<sbux-button id="srch-btn-gpcList" name="srch-btn-gpcList" uitype="modal" target-id="modal-gpcList" onclick="fn_choiceGpcList" text="품목찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								 -->
							</td>
							<th scope="row" class="th_bg th_border_right">취급유형</th>
							<td colspan="2" class="td_input">
								<sbux-select
									id="dtl-input-trmtType"
									name="dtl-input-trmtType"
									uitype="single"
									jsondata-ref="jsonComDtlTrmtType"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 상세보기-->
				<!-- 농가 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶농가 리스트</span>
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
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:400px; width: 100%;"></div>
				</div>
			</div>
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
			<div id="sb-area-hiddenGrd01" style="height:400px; width: 100%; display: none;"></div>
		</div>
	</section>
	<!-- 엑셀 업로드 양식 -->
	<div class="exp-div-excel" style="display: none;width: 1000px;">
		<div id="sbexp-area-grdExpUpload" style="height:1px; width: 100%;"></div>
	</div>

	<!-- 품목 팝업 -->
	<div>
		<sbux-modal
			id="modal-yrGpcList"
			name="modal-yrGpcList"
			uitype="middle"
			header-title="품목 선택"
			body-html-id="body-modal-yrGpcList"
			footer-is-close-button="false"
			style="width:700px"
		></sbux-modal>
	</div>
	<div id="body-modal-yrGpcList">
		<jsp:include page="/WEB-INF/view/apcss/fm/popup/ItemYrGpcPopup.jsp"></jsp:include>
	</div>

	<!-- IMPORT 엑셀 등록 Modal -->
	<div>
		<sbux-modal
			id="modal-imp"
			name="modal-imp"
			uitype="middle"
			header-title="농가리스트 등록(Excel)"
			body-html-id="body-modal-imp"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-imp">
		<jsp:include page="../../fm/popup/importExcelPopup.jsp"></jsp:include>
	</div>
	<!-- 프로그래스 로딩바 진행률 관련 -->
	<sbux-progress id="progOpen" name="progOpen" uitype="bar" indicator-type="load"
			show-openlayer="true" is-fixed="true"
			openlayer-title="<span class='empRed'>데이터 로딩 중입니다.</span> 잠시만 기다려 주십시오."
			>
		<sbux-progress-bar striped="true" show-motion="true">
		<sbux-bar valuenow= "50" body-color="#f25c5c"  label="*%" label-style="color:black;font-weight:bold;"></bar>
		</sbux-progress-bar>
	</sbux-progress>
	<sbux-progress id="loadingOpen" name="loadingOpen" uitype="loading" openlayer-title="On Loading..." show-openlayer="true"></sbux-progress>
</body>
<script type="text/javascript">
//생산자조직 등록의 경우
//통합조직 직속 농가 출자출하조직 농가 두가지 경우가 있음
//첫리스트는 통합조직,출자출하조직 둘다 보여야함
//조직 선택후 품목 취급유형 선택후 다시 조회

//SBGridProperties.emptyareaindexclear = false;
//인경우에는 그리스 선택한 상태에서 인덱스로는 영역 밖인지 확인할 방법이 없음
//emptyareaindexclear true(default) 인경우
//그리드 에디트 상태에서 영역외 클릭시 부자연스럽게 그리드 영역이 부자연스럽게 이동함

	window.addEventListener('DOMContentLoaded', function(e) {
		var now = new Date();
		var year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

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

	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		$("#dtl-input-uoBrno").hide();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '21'}">
		fn_fcltMngCreateGrid();
		<c:if test="${loginVO.userType eq '21'}">
		$("#dtl-input-uoBrno").show();
		$("#dtl-input-selUoBrno").hide();
		</c:if>
	</c:if>
		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '21'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType eq '22'}">
		await fn_dtlSearch();
	</c:if>
	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분
	var jsonComAprv = [];//통합조직여부

	var jsonComDtlTrmtType = [];//취급유형

	var jsonComGrdSgg = [];//시군
	var jsonComGrdCtpv = [];//시도
	var jsonComGrdAprv = [];//신청구분
	var jsonComGrdCorpSeCd = [];//법인구분

	var jsonComGrdCtgryCd_1 = [];//평가부류
	var jsonComGrdClsfCd_1 = [];//신규부류
	var jsonComGrdSttgUpbrItemSe_1 = [];//품목구분 전문/육성
	var jsonComGrdTrmtType_1 = [];//취급유형
	//통합조직,출하조직
	var jsonComApoSe = [
		{'text': '통합조직','label': '통합조직', 'value': '1'},
		{'text': '출자출하조직','label': '출자출하조직', 'value': '2'}
	];
	//생산자조직 보유 여부
	var jsonComFrmhsHldYnYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
	//통합조직,출하조직
	var jsonComGrdApoSe = [
		{'text': '통합조직','label': '통합조직', 'value': '1'},
		{'text': '출자출하조직','label': '출자출하조직', 'value': '2'}
	];

	//생산자조직 제외 여부 (생산자조직인데 법인인 경우)
	var jsonComGrdExclYn = [
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
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 		'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('dtl-input-trmtType', 		jsonComDtlTrmtType, 	'TRMT_TYPE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 		'APRV_UPBR_SE_CD'), //통합조직여부
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCorpSeCd, 	'CORP_SE_CD'), //법인구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdSttgUpbrItemSe_1, 	'STTG_UPBR_ITEM_SE'), //품목구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdClsfCd_1, 	'CLSF_CD'), //신규부류
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdCtgryCd_1, 	'CTGRY_CD'), //평가부류
			gfn_setComCdSBSelect('dtl-input-trmtType', 		jsonComGrdTrmtType_1, 	'TRMT_TYPE'), //신청대상구분
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
		grdPrdcrOgnCurntMng.exportLocalExcel("생산자조직 현황(검색리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
	    	{caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'60px',    style:'text-align:center'},
	    	{caption: ["조직구분"], 		ref: 'apoSe',   	type:'combo',  width:'90px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComGrdApoSe', label:'label', value:'value', displayui : false}},
	    	{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["생산자조직 보유"], 		ref: 'frmhsCnt',   	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComGrdCorpSeCd', label:'label', value:'value', displayui : false}},
	    	{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComGrdCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComGrdSgg', label:'label', value:'value', displayui : false}},
		    //{caption: ["시군구"], 		ref: 'sgg',  type:'output',  width:'160px',    style:'text-align:center'},
	        //{caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'}
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("생산자조직 현황(생산자조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//생산자조직 리스트
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = false;//입력 활성화 true 1번클릭 false 더블클릭
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheader="seq";
		//SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.columns = [
			{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				<c:if test="${loginVO.userType ne '02'}">
				//법인체 마감 추가
				let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
				if (prfmncCorpDdlnYn == 'Y') {
					return "";
				}
				if(strValue== null || strValue == ""){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow01(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow01(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
				}
				</c:if>
				return "";
			}},
			//{caption: ["순번"], 			ref: 'prdcrOgnzSn',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'input',  width:'180px',    style:'text-align:center'},
			//{caption: ["생산자조직 코드"], 	ref: 'prdcrOgnzCd',   	type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["품목선택"], 			ref: 'sel',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				//법인체 마감 추가
				let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
				if (prfmncCorpDdlnYn == 'Y') {
					return "";
				}
				if(objRowData.delYn == 'N'){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_openMaodalSelect(" + nRow + ")'>선택</button>";
				}
				return "";
			}},
			{caption: ["구분"], 	ref: 'sttgUpbrItemSe',   type:'combo',  width:'100px',    style:'text-align:center', disabled:true , oneclickedit:true
				,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_1', label:'label', value:'value', displayui : false}},
			{caption: ["부류"], 			ref: 'clsfCd',   	type:'combo',  width:'100px',    style:'text-align:center', disabled:true , oneclickedit:true
				,typeinfo : {ref:'jsonComGrdClsfCd_1', label:'label', value:'value', displayui : false}},
			{caption: ["평가부류"], 			ref: 'ctgryCd',   	type:'combo',  width:'100px',    style:'text-align:center', disabled:true , oneclickedit:true
				,typeinfo : {ref:'jsonComGrdCtgryCd_1', label:'label', value:'value', displayui : false}},
			{caption: ["품목"], 			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["취급유형"], 		ref: 'trmtType',   	type:'combo',  width:'100px',    style:'text-align:center', disabled:false , oneclickedit:true
				,typeinfo : {ref:'jsonComGrdTrmtType_1', label:'label', value:'value', displayui : true}},

			{caption: ["적합여부"], 		ref: 'stbltYn',   	type:'output',  width:'50px',    style:'text-align:center'},
			{caption: ["조직원수"], 					ref: 'cnt',   	type:'output',  width:'70px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["계약물량(톤)\n[A]"], 	ref: 'ecSpmtPlanVlmTot',   	type:'output',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하량(톤)\n[B]"], 	ref: 'ecSpmtVlmTot',   	type:'output',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["출하대금\n지급액(천원)"], 		ref: 'spmtPrcTot',   	type:'output',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["출하비율(%)\n[B/A]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateB',   	type:'output',  width:'100px',    style:'text-align:center;'},

			/*
			{caption: ["생산량\n(결과)(톤)[A]"], 	ref: 'prdctnVlmTot',   	type:'output',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["전속(약정)\n출하계약량(톤)[B]"], 	ref: 'ecSpmtPlanVlmTot',   	type:'output',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["전속(약정)출하량\n(결과)(톤)[C]"], 	ref: 'ecSpmtVlmTot',   	type:'output',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			//{caption: ["출하비율A(%)\n[C/A]"], 					ref: 'ecSpmtRate',   	type:'output',  width:'85px',    style:'text-align:center'
				//,typeinfo : {mask : {alias: 'decimal', digits : 2, unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
				//,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출하비율(%)\n(승인형)[C/A]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateA',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출하비율(%)\n(육성형)[C/B]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateB',   	type:'output',  width:'100px',    style:'text-align:center;'},
			*/
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
			//20240315 생산자조직중 법인인 경우 제외 처리를 위해 추가
			{caption: ["제외여부"], 		ref: 'exclYn',   	type:'combo',  width:'60px',    style:'text-align:center', disabled:false , oneclickedit:true
				,typeinfo : {ref:'jsonComGrdExclYn', label:'label', value:'value', displayui : true}},
		</c:if>
			{caption: ["계약시기"], 		ref: 'ctrtDt',  	type:'datepicker',  width:'110px',    style:'text-align:center'
				,typeinfo : {locale : 'ko' , dateformat :'yymmdd' , yearrange : 150}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
			{caption: ["출하시기"], 		ref: 'spmtDt',  	type:'datepicker',  width:'110px',    style:'text-align:center'
				,typeinfo : {locale : 'ko' , dateformat :'yymmdd' , yearrange : 150}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
			{caption: ["비고"], 			ref: 'rmrk',   		type:'input',  width:'220px',    style:'text-align:center'},
			{caption: ["상세내역"], 	ref: 'yr',			hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'uoApoCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',		hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrOgnzCd',		hidden : true}
		];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);

		grdPrdcrOgnCurntMng01.bind('click','fn_view01');
		grdPrdcrOgnCurntMng01.bind('dblclick','gridClick');

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
		grdPrdcrOgnCurntMng02.exportLocalExcel("생산자조직 현황(농가 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//농가 리스트
	const fn_fcltMngCreateGrid02 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.fixedrowheight=36;
		SBGridProperties.rowheader="seq";
		//SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.columns = [
			{caption: ["처리","처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				<c:if test="${loginVO.userType ne '02'}">
				//법인체 마감 추가
				let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
				if (prfmncCorpDdlnYn == 'Y') {
					return "";
				}
				if(strValue== null || strValue == ""){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow02(\"ADD\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ", " + nCol + ")'>추가</button>";
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow02(\"DEL\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ")'>삭제</button>";
				}
				</c:if>
				return "";
			}},
			//{caption: ["순번"], 			ref: 'cltvtnLandSn',   	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["조직원명","조직원명"], 		ref: 'flnm',   	type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["재배지 주소","재배지 주소"], 	ref: 'cltvtnLandAddr',   	type:'input',  width:'500px',    style:'text-align:center'},
			{caption: ["품목","품목"], 			ref: 'itemNm',   	type:'output',  width:'120px',    style:'text-align:center' },
			{caption: ["기준","재배면적(㎡)"], 	ref: 'cltvtnSfc',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["기준","(평년)생산량(톤)"], ref: 'avgYrPrdctnVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			/*
			{caption: ["생산계획량(톤)"], ref: 'prdctnPlanVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["생산량(결과)(톤)"], ref: 'prdctnVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			*/

			{caption: ["계약","계약면적(㎡)"], 	ref: 'ecCltvtnSfc',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["계약","전속(약정)\n출하계약량(톤)"], ref: 'ecSpmtPlanVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["결과","전속(약정)\n출하량(톤)"], ref: 'ecSpmtVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["결과","출하대금\n지급액(천원)"], ref: 'spmtPrc',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["가입일","가입일"], 		ref: 'joinDay',  	type:'datepicker',  width:'110px',    style:'text-align:center'
				,typeinfo : {locale : 'ko' , dateformat :'yymmdd' , yearrange : 150}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
			//{caption: ["탈퇴일"], 		ref: 'whdwlDay',  	type:'datepicker',  width:'110px',    style:'text-align:center'
				//,typeinfo : {locale : 'ko' , dateformat :'yymmdd' , yearrange : 150}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
			{caption: ["비고","비고"], 			ref: 'cltvtnAreaRmrk',   	type:'input',  width:'220px',    style:'text-align:center'},
			{caption: ["상세내역"], 	ref: 'yr',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'cltvtnLandSn',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrOgnzNm',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'clsfCd',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'trmtType',	hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
		];

		grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);

		grdPrdcrOgnCurntMng02.bind('valuechanged','fn_valuechanged');

	}

	//붙여넣기 시도시 확인 컬럼 리스트 소숫점 허용 x
	const columnsList01 = [
		'cltvtnSfc','ecCltvtnSfc','spmtPrc'
	];
	//붙여넣기 시도시 확인 컬럼 리스트 소숫점 2자리 허용
	const columnsList02 = [
		'ecSpmtPlanVlm','avgYrPrdctnVlm', 'ecSpmtVlm'
	];
	//값변경 이벤트
	function fn_valuechanged(e){
		console.log(e);
		console.log(e.data.target);
		console.log(grdPrdcrOgnCurntMng02);
		let nRow = grdPrdcrOgnCurntMng02.getRow();
		let nCol = grdPrdcrOgnCurntMng02.getCol();
		let valueData = grdPrdcrOgnCurntMng02.getCellData(nRow,nCol);

		let colName = grdPrdcrOgnCurntMng02.getRefOfCol(nCol);
		console.log(colName);
		//붙여넣을 값 확인 리스트 체크
		if(columnsList01.includes(colName) || columnsList02.includes(colName)){
			const regex = /[^0-9.]/g;// 숫자 소숫점
			let result = Number(valueData.replace(regex,''));
			console.log(result);
			if(columnsList02.includes(colName)){
				result = result.toFixed(2);
			}else{
				result = result.toFixed(0);
			}
			console.log(result);
			grdPrdcrOgnCurntMng02.setCellData(nRow,nCol, result);
		}
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

		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		gfn_popClipReport("생산자조직 현황", "pd/prdDoc1.crf", {
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
		<c:if test="${loginVO.userType eq '21'}">
		gfn_popClipReport("생산자조직 현황", "pd/prdDoc1.crf", {
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

		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		console.log(yr);

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			,yr : yr

			,frmhsHld : 'Y'//생산자조직보유여부 조회 여부

			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
			,cmptnInst : cmptnInst
			,ctpv : ctpv
			,corpSeCd : corpSeCd
			,corpDtlSeCd : corpDtlSeCd

			,corpNm : corpNm

			,aprv : aprv
			,apoSe : apoSe
			,frmhsHldYn : frmhsHldYn
			,yrChk : yrChkVal
			,uoBrnoUo : uoBrno
			</c:if>

			<c:if test="${loginVO.userType eq '21'}">
			,userType : '21'
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
				console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				<c:if test="${loginVO.userType eq '21'}">
				//실적 법인체 마감 처리
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장버튼, 엑셀업로드 버튼 숨김처리
					$('#btnSaveFclt1').hide();
					$('#btnSaveFclt2').hide();
					$('#btnUpload').hide();
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
						,corpSeCd: item.corpSeCd
						,yr: item.yr
						,frmhsCnt : item.frmhsCnt
						,prfmncCorpDdlnYn : item.prfmncCorpDdlnYn
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

			<c:if test="${loginVO.userType eq '21'}">
			//통합조직 진척도 조회
			//cfn_selectPrgrs();
			</c:if>

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
		//사용자인경우는 현재 올해 년도만 사용함
		let now = new Date();
		let year = now.getFullYear();
		SBUxMethod.set('dtl-input-yr',year);
		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
		});

		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//사업자등록번호
				SBUxMethod.set('dtl-input-prfmncCorpDdlnYn',gfn_nvl(item.prfmncCorpDdlnYn))//실적 법인체 마감

				console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장버튼, 엑셀업로드 버튼 숨김처리
					$('#btnSaveFclt1').hide();
					$('#btnSaveFclt2').hide();
					$('#btnUpload').hide();
				}
			});
			//생산자조직 리스트 조회
			//fn_dtlGridSearch01();
			//출자출하조직이 속한 통합조직 리스트 콤보 생성
			fn_searchUoList();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//생산자조직 다중 세이브
	async function fn_saveFmList01() {
		console.log("===============fn_saveFmList01=================");
		let gridData = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		//필수값 체크
		if(fn_checkRequiredInput()){
			return;
		}

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		if(apoSe == '1'){
			uoBrno = brno;
		}

		let uoCd = SBUxMethod.get('dtl-input-uoCd');
		let yr = SBUxMethod.get('dtl-input-yr');

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng01.getRowStatus(i);
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if(gfn_isEmpty(rowData.apoCd)){
					rowData.apoCd = apoCd;
					rowData.apoSe = apoSe;
					rowData.crno = crno;
					rowData.brno = brno;
					rowData.uoBrno = uoBrno;
					rowData.uoCd = uoCd;
					rowData.yr = yr;
				}
				//모든데이터 저장 처리
				rowData.rowSts = "I";
				saveList.push(rowData);
				/*
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 1){
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

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pom/multiSaveTbEvFrmhsApoList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch01();
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
	function fn_checkRequiredInput(){
		//필수값 확인
		console.log("======fn_checkRequiredInput======");
		//품목 그리드 필수갑 확인
		let gridData = grdPrdcrOgnCurntMng01.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng01.getRowData(i);
			console.log(rowData);
			console.log(gfn_isEmpty(rowData.prdcrOgnzNm));
			if(rowData.delYn == 'N'){
				if(gfn_isEmpty(rowData.prdcrOgnzNm)){
					alert('생산자조직 리스트의 생산자조직 명을 입력해주세요');
					grdPrdcrOgnCurntMng01.focus();
					return true;
				}
				if(gfn_isEmpty(rowData.itemCd)){
					alert('생산자조직 리스트의 품목을 선택해주세요');
					grdPrdcrOgnCurntMng01.focus();
					return true;
				}
				if(gfn_isEmpty(rowData.ctgryCd)){
					alert('생산자조직 리스트의 평가부류를 선택해주세요');
					grdPrdcrOgnCurntMng01.focus();//그리드 객체로 포커스 이동
					return true;
				}
				if(gfn_isEmpty(rowData.clsfCd)){
					alert('생산자조직 리스트의 부류를 선택해주세요');
					grdPrdcrOgnCurntMng01.focus();//그리드 객체로 포커스 이동
					return true;
				}
				if(gfn_isEmpty(rowData.trmtType)){
					alert('생산자조직 리스트의 취급유형을 선택해주세요');
					grdPrdcrOgnCurntMng01.focus();
					return true;
				}
				if(gfn_isEmpty(rowData.sttgUpbrItemSe)){
					alert('생산자조직 리스트의 전문/육성 구분을 선택해주세요');
					grdPrdcrOgnCurntMng01.focus();
					return true;
				}
			}
		}
		return false;
	}

	//농가 다중 세이브
	async function fn_saveFmList02() {
		console.log("===============fn_saveFmList02=================");
		let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();
		let saveList = [];

		//필수값 체크
		if(fn_checkRequiredInput01()){
			return;
		}

		let apoCd = SBUxMethod.get('dtl-input-apoCd01');
		let apoSe = SBUxMethod.get('dtl-input-apoSe01');
		let crno = SBUxMethod.get('dtl-input-crno01');
		let brno = SBUxMethod.get('dtl-input-brno01');
		let yr = SBUxMethod.get('dtl-input-yr01');
		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let trmtType = SBUxMethod.get('dtl-input-trmtType');
		let sttgUpbrItemSe = SBUxMethod.get('dtl-input-sttgUpbrItemSe');
		let prdcrOgnzSn = SBUxMethod.get('dtl-input-prdcrOgnzSn');
		let prdcrOgnzCd = SBUxMethod.get('dtl-input-prdcrOgnzCd');
		let prdcrOgnzNm = SBUxMethod.get('dtl-input-prdcrOgnzNm');

		for(var i=1+1; i<=gridData.length+1; i++ ){

			let rowData = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng02.getRowStatus(i);
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if(gfn_isEmpty(rowData.apoCd)){
					rowData.apoCd = apoCd;
					rowData.apoSe = apoSe;
					rowData.crno = crno;
					rowData.brno = brno;
					rowData.yr = yr;
					rowData.itemCd = itemCd;
					rowData.trmtType = trmtType;
					rowData.prdcrOgnzSn = prdcrOgnzSn;
					rowData.prdcrOgnzCd = prdcrOgnzCd;
					rowData.prdcrOgnzNm = prdcrOgnzNm;
					rowData.sttgUpbrItemSe = sttgUpbrItemSe;
				}

				//모든데이터 저장 처리
				rowData.rowSts = "I";
				saveList.push(rowData);
				/*
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 1){
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

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pom/multiSavePrdcrOgnCurntMngList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch01();
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

	function fn_checkRequiredInput01(){
		//필수값 확인
		console.log("======fn_checkRequiredInput01======");
		//품목 그리드 필수갑 확인
		let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();

		for(var i=1+1; i<=gridData.length+1; i++ ){
			let rowData = grdPrdcrOgnCurntMng02.getRowData(i);
			console.log(rowData);
			console.log(gfn_isEmpty(rowData.prdcrOgnzNm));
			if(rowData.delYn == 'N'){
				if(gfn_isEmpty(rowData.flnm)){
					gfn_comAlert("W0002", "조직원명");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.focus();
					return true;
				}
				if(gfn_isEmpty(rowData.cltvtnLandAddr)){
					gfn_comAlert("W0002", "재배지 주소");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.focus();
					return true;
				}
				if (gfn_isEmpty(rowData.ecSpmtPlanVlm)){
					gfn_comAlert("W0002", "전속출하계약량");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.focus();
					return true;
				}
				if (gfn_isEmpty(rowData.ecSpmtVlm)){
					gfn_comAlert("W0002", "전속출하량(결과)");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.focus();
					return true;
				}
				if (gfn_isEmpty(rowData.spmtPrc)){
					gfn_comAlert("W0002", "출하대금 지급액");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.focus();
					return true;
				}
				if (gfn_isEmpty(rowData.joinDay)){
					gfn_comAlert("W0002", "가입일");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.focus();
					return true;
				}

			}
		}
		return false;
	}

	/* Grid Row 추가 및 삭제 기능*/
	function fn_procRow01(gubun, grid, nRow, nCol) {
		//console.log("======fn_procRow01=========");
		let objGrid = grdPrdcrOgnCurntMng01;
		if (gubun === "ADD") {
			if (grid === "grdPrdcrOgnCurntMng01") {
				objGrid.setCellData(nRow, nCol, "N", true);
				//grdPrdcrCrclOgnReqClsMng.setCellData(nRow, 5, gv_apcCd, true);
				objGrid.addRow(true);

				let rmrkCol = objGrid.getColRef('rmrk');//부류
				let prdcrOgnzNmCol = objGrid.getColRef('prdcrOgnzNm');//평가부류

				//기존 row 활성화
				objGrid.setCellDisabled(nRow, prdcrOgnzNmCol, nRow, rmrkCol, false);
				objGrid.setCellStyle('background-color', nRow, prdcrOgnzNmCol, nRow, rmrkCol, 'white');
				//추가 row 비활성화
				objGrid.setCellDisabled(nRow+1, prdcrOgnzNmCol, nRow+1, rmrkCol, true);
				objGrid.setCellStyle('background-color', nRow+1, prdcrOgnzNmCol, nRow+1, rmrkCol, 'lightgray');
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdPrdcrOgnCurntMng01") {
				if(objGrid.getRowStatus(nRow) == 0 || objGrid.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var rowVal = objGrid.getRowData(nRow);
						fn_deleteRsrc01(rowVal);
						fn_dtlGridSearch01();
					}
				}else{
					objGrid.deleteRow(nRow);
				}
			}
		}
	}

	/* Grid Row 추가 및 삭제 기능*/
	function fn_procRow02(gubun, grid, nRow, nCol) {
		console.log("======fn_procRow02=========");
		if (gubun === "ADD") {
			if (grid === "grdPrdcrOgnCurntMng02") {
				grdPrdcrOgnCurntMng02.setCellData(nRow, nCol, "N", true);
				//grdPrdcrCrclOgnReqClsMng.setCellData(nRow, 5, gv_apcCd, true);
				grdPrdcrOgnCurntMng02.addRow(true);
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdPrdcrOgnCurntMng02") {
				if(grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var rowVal = grdPrdcrOgnCurntMng02.getRowData(nRow);
						fn_deleteRsrc02(rowVal);
						fn_dtlGridSearch02();
					}
				}else{
					grdPrdcrOgnCurntMng02.deleteRow(nRow);
				}
			}
		}
	}

	//생산자조직 리스트 선택 데이터 삭제
	async function fn_deleteRsrc01(PrdcrOgnCurntMngVO){

		//prdcrOgnzSn 값 필수
		let postJsonPromise = gfn_postJSON("/pd/pom/deleteTbEvFrmhsApo.do", PrdcrOgnCurntMngVO);
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

	//농가 리스트 선택 데이터 삭제
	async function fn_deleteRsrc02(PrdcrOgnCurntMngVO){
		let postJsonPromise = gfn_postJSON("/pd/pom/deletePrdcrOgnCurntMngDtl.do", PrdcrOgnCurntMngVO);
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

	//통합조직 리스트 그리드 클릭시  이벤트
	const fn_view = async function(){
		console.log("******************fn_view**********************************");

		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrOgnCurntMng.getCol();
		if (nCol < 0) {
			return;
		}
		var nRow = grdPrdcrOgnCurntMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		//console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//사업자등록번호

		//통합조직 일 때 통합조직 선택 콤보 초기화 및 비활성하
		//console.log(rowData.apoSe);
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		SBUxMethod.set('dtl-input-selUoBrno' , null);
		SBUxMethod.set('dtl-input-uoBrno' , null);
		SBUxMethod.set('dtl-input-uoCd' , null);
		if(rowData.apoSe == '1'){
			SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);
		}else if(rowData.apoSe == '2'){
			SBUxMethod.attr('dtl-input-selUoBrno','readonly',false);
			fn_searchUoList();
		}
		</c:if>
		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		SBUxMethod.set('dtl-input-uoBrno' , brno);
		SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);

		//법인체 마감 추가로 통합조직인 경우
		SBUxMethod.set('dtl-input-prfmncCorpDdlnYn',gfn_nvl(rowData.prfmncCorpDdlnYn))//실적 법인체 마감
		</c:if>


		fn_clearForm();
	}

	var comUoBrno = [];//통합조직 선택

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(){
		//출자출하조직이 아닌경우
		<c:if test="${loginVO.userType ne '22'}">
		let brno = SBUxMethod.get('dtl-input-brno');
		</c:if>
		//출자출하조직인 경우
		<c:if test="${loginVO.userType eq '22'}">
		let brno = '${loginVO.brno}';
		</c:if>
		SBUxMethod.openProgress("loadingOpen");
		let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			brno : brno
		});
		let data = await postJsonPromise;
		try{
			comUoBrno = [];
			let uoBrno;
			data.resultList.forEach((item, index) => {
				uoBrno = item.uoBrno
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
			SBUxMethod.closeProgress("loadingOpen");
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
			SBUxMethod.set('dtl-input-uoCd' , null);
		}else{
			SBUxMethod.set('dtl-input-uoBrno',selCombo.value);
			SBUxMethod.set('dtl-input-uoCd',selCombo.uoApoCd);
		}
		fn_clearForm();
	}

	async function fn_clearForm() {
		SBUxMethod.set('dtl-input-apoCd01',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe01',null)//통합조직 구분
		SBUxMethod.set('dtl-input-crno01',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno01',null)//사업자등록번호
		SBUxMethod.set('dtl-input-prdcrOgnzSn',null)//생산자조직 순번
		SBUxMethod.set('dtl-input-prdcrOgnzNm',null)//생산자조직 명
		SBUxMethod.set('dtl-input-prdcrOgnzCd',null)//생산자조직 코드
		SBUxMethod.set('dtl-input-itemCd',null)//품목 코드
		SBUxMethod.set('dtl-input-itemNm',null)//품목명
		SBUxMethod.set('dtl-input-trmtType',null)//취급유형
		SBUxMethod.set('dtl-input-sttgUpbrItemSe',null)//품목구분 전문/육성

		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
	}

	//생산자조직 리스트 그리드 상세
	const fn_view01 = async function(){
		console.log("******************fn_view01**********************************");

		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrOgnCurntMng01.getCol();
		if (nCol < 0) {
			grdPrdcrOgnCurntMng01.moveScrollTop(0,true);
			return;
		}
		var nRow = grdPrdcrOgnCurntMng01.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		let rowData = grdPrdcrOgnCurntMng01.getRowData(nRow);
		console.log(rowData.yr);
		/*
		if(gfn_isEmpty(rowData.delYn)){
			return;
		}
		*/

		SBUxMethod.set('dtl-input-apoCd01',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe01',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-crno01',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno01',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr01',gfn_nvl(rowData.yr))//등록년도
		SBUxMethod.set('dtl-input-prdcrOgnzSn',gfn_nvl(rowData.prdcrOgnzSn))//생산자조직 순번
		SBUxMethod.set('dtl-input-prdcrOgnzNm',gfn_nvl(rowData.prdcrOgnzNm))//생산자조직 명
		SBUxMethod.set('dtl-input-prdcrOgnzCd',gfn_nvl(rowData.prdcrOgnzCd))//생산자조직 코드
		SBUxMethod.set('dtl-input-itemCd',gfn_nvl(rowData.itemCd))//품목 코드
		SBUxMethod.set('dtl-input-itemNm',gfn_nvl(rowData.itemNm))//품목명
		SBUxMethod.set('dtl-input-trmtType',gfn_nvl(rowData.trmtType))//취급유형
		SBUxMethod.set('dtl-input-sttgUpbrItemSe',gfn_nvl(rowData.sttgUpbrItemSe))//품목구분 전문/육성

		fn_clearForm01();
	}
	//농가 리스트 그리드 초기화
	async function fn_clearForm01() {
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
		jsonExpUpload.length = 0;
	}

	/* 생산자조직 출력물 */
	const fn_report2 = async function() {
		let apoSeVal = SBUxMethod.get('dtl-input-apoSe');
		let uoBrnoVal = SBUxMethod.get('dtl-input-uoBrno');
		let uoCorpNm;
		if (comUoBrno.length > 0) {
			let selVal = SBUxMethod.get('dtl-input-selUoBrno');
			let selCombo = _.find(comUoBrno, {value : selVal});
			uoCorpNm =  selCombo.text;
		}else{
			uoCorpNm = uoBrnoVal;
		}

		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		if(gfn_isEmpty(brno)){
			alert("조직을 선택해주세요");
			return false;
		}
		let apcgu;
		if(apoSeVal == '2'){
			if(gfn_isEmpty(uoBrnoVal)){
				alert("통합조직을 선택해 주세요");
				return;
			}
			apcgu = '출자출하조직'
		}else if(apoSeVal == '1'){
			uoBrnoVal = null;
			apcgu = '통합조직'
		}

		let apcguVal = $('#dtl-input-apoSe option:checked').text();
		let corpNm = $('#dtl-input-corpNm').val();
		let buisNo = $('#dtl-input-brno').val();

		gfn_popClipReport("생산자조직 리스트", "pd/prdDoc2.crf", {
			brno		: gfn_nvl(brno)
			, apcgu		: gfn_nvl(apcgu)
			, uobrno 	: gfn_nvl(uoBrnoVal)
			, uoNm		: gfn_nvl(uoCorpNm)
			, yr 		: gfn_nvl(yr)
			, corpNm	: gfn_nvl(corpNm)
			, buisNo	: gfn_nvl(buisNo)
		});
		//debugger;
	}

	/* 생산자조직 연계 출력물 */
	const fn_report4 = async function() {
		let apoSeVal = SBUxMethod.get('dtl-input-apoSe');
		let uoBrnoVal = SBUxMethod.get('dtl-input-uoBrno');
		let uoCorpNm;
		if (comUoBrno.length > 0) {
			let selVal = SBUxMethod.get('dtl-input-selUoBrno');
			let selCombo = _.find(comUoBrno, {value : selVal});
			uoCorpNm =  selCombo.text;
		}else{
			uoCorpNm = uoBrnoVal;
		}

		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		if(gfn_isEmpty(brno)){
			alert("조직을 선택해주세요");
			return false;
		}
		let apcgu;
		if(apoSeVal == '2'){
			if(gfn_isEmpty(uoBrnoVal)){
				alert("통합조직을 선택해 주세요");
				return;
			}
			apcgu = '출자출하조직'
		}else if(apoSeVal == '1'){
			uoBrnoVal = null;
			apcgu = '통합조직'
		}

		let apcguVal = $('#dtl-input-apoSe option:checked').text();;
		let corpNm = $('#dtl-input-corpNm').val();
		let buisNo = $('#dtl-input-brno').val();

		gfn_popClipReport("생산자조직 리스트", "pd/prdDocAll.crf", {
			brno		: gfn_nvl(brno)
			, apcgu		: gfn_nvl(apcgu)
			, uobrno 	: gfn_nvl(uoBrnoVal)
			, uoNm		: gfn_nvl(uoCorpNm)
			, yr 		: gfn_nvl(yr)
			, corpNm	: gfn_nvl(corpNm)
			, buisNo	: gfn_nvl(buisNo)
		});
		//debugger;
	}


	//생산자조직 리스트 조회
	async function fn_dtlGridSearch01() {
		let apoSeVal = SBUxMethod.get('dtl-input-apoSe');
		let uoBrnoVal = SBUxMethod.get('dtl-input-uoBrno');
		if(apoSeVal == '2'){
			if(gfn_isEmpty(uoBrnoVal)){
				alert("통합조직을 선택해 주세요");
				return;
			}
		}else if(apoSeVal == '1'){
			uoBrnoVal = null;
		}

		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		fn_clearForm();

		if(gfn_isEmpty(brno)){return;}

		let postJsonPromise01 = gfn_postJSON("/pd/pom/selectTbEvFrmhsApoList.do", {
			yr : yr
			,brno : brno
			,uoBrno : uoBrnoVal
		});
		let data = await postJsonPromise01;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let itemVO = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno
						,uoBrno: item.uoBrno

						,delYn: item.delYn

						,yr:item.yr
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,ctgryCd: 		item.ctgryCd
						,clsfCd: 		item.clsfCd
						,ctgryNm: 		item.ctgryNm
						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm
						,trmtType: 		item.trmtType

						,cnt: 				item.cnt
						,prdctnVlmTot: 		item.prdctnVlmTot
						,ecSpmtVlmTot: 		item.ecSpmtVlmTot
						,ecSpmtPlanVlmTot: 	item.ecSpmtPlanVlmTot
						,spmtPrcTot: 		item.spmtPrcTot
						,ecSpmtRateA: 		item.ecSpmtRateA
						,ecSpmtRateB: 		item.ecSpmtRateB
						,stbltYn: 			item.stbltYn//적합여부
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
						,exclYn: 			item.exclYn//제외여부
					</c:if>
						,prdcrOgnzSn: 	item.prdcrOgnzSn
						,prdcrOgnzCd: 	item.prdcrOgnzCd
						,prdcrOgnzNm: 	item.prdcrOgnzNm
						,rmrk: 			item.rmrk

						,ctrtDt: 	item.ctrtDt
						,spmtDt: 	item.spmtDt
				}

				jsonPrdcrOgnCurntMng01.push(itemVO);
			});

			grdPrdcrOgnCurntMng01.rebuild();

			//법인체 마감 추가
			let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
			if (prfmncCorpDdlnYn != 'Y') {
				//입력 그리드 인 경우 추가
				let nRow = jsonPrdcrOgnCurntMng01.length;
				grdPrdcrOgnCurntMng01.addRow();
				let rmrkCol = grdPrdcrOgnCurntMng01.getColRef('rmrk');//부류
				let prdcrOgnzNmCol = grdPrdcrOgnCurntMng01.getColRef('prdcrOgnzNm');//평가부류

				//추가 row 비활성화
				grdPrdcrOgnCurntMng01.setCellDisabled(nRow+1, prdcrOgnzNmCol, nRow+1, rmrkCol, true);
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', nRow+1, prdcrOgnzNmCol, nRow+1, rmrkCol, 'lightgray');
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 농가리스트 출력물 */
	const fn_report3 = async function() {
		let prdcrOgnzSn = SBUxMethod.get('dtl-input-prdcrOgnzSn');
		if(gfn_isEmpty(prdcrOgnzSn)){return;}

		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let yr = SBUxMethod.get('dtl-input-yr');

		gfn_popClipReport("농가리스트 현황", "pd/prdDoc3.crf", {
			apocd			: gfn_nvl(apoCd)
			, prdcrognzsn	: gfn_nvl(prdcrOgnzSn)
			, yr			: gfn_nvl(yr)
		});
	}

	//농가리스트 리스트 조회
	async function fn_dtlGridSearch02() {

		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		if(gfn_isEmpty(itemCd)){return;}

		let apoCd = SBUxMethod.get('dtl-input-apoCd');

		let prdcrOgnzSn = SBUxMethod.get('dtl-input-prdcrOgnzSn');
		let yr = SBUxMethod.get('dtl-input-yr');
		//let itemCd = SBUxMethod.get('dtl-input-itemCd');
		//let trmtType = SBUxMethod.get('dtl-input-trmtType');

		let postJsonPromise02 = gfn_postJSON("/pd/pom/selectPrdcrOgnCurntMngDtlList.do", {
			yr : yr
			,apoCd : apoCd
			,prdcrOgnzSn : prdcrOgnzSn
		});
		let data = await postJsonPromise02;
		try{
			jsonPrdcrOgnCurntMng02.length = 0;
			jsonExpUpload.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				console.log(item.itemNm);
				let PrdcrOgnCurntMngVO = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno

						,prdcrOgnzSn: 	item.prdcrOgnzSn
						,prdcrOgnzCd: 	item.prdcrOgnzCd
						,prdcrOgnzNm: 	item.prdcrOgnzNm
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,ctgryCd: 		item.ctgryCd
						,clsfCd: 		item.clsfCd
						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm
						,trmtType: 		item.trmtType
						,yr: 			item.yr
						,delYn: 			item.delYn

						,cltvtnLandSn: 		item.cltvtnLandSn
						,flnm: 				item.flnm
						,cltvtnLandAddr: 	item.cltvtnLandAddr

						,joinDay: 			item.joinDay
						,whdwlDay: 			item.whdwlDay
						,cltvtnSfc: 		item.cltvtnSfc
						,ecCltvtnSfc: 		item.ecCltvtnSfc
						,avgYrPrdctnVlm: 	item.avgYrPrdctnVlm
						,cltvtnAreaRmrk: 	item.cltvtnAreaRmrk

						,prdctnPlanVlm: 	item.prdctnPlanVlm
						,ecSpmtPlanVlm: 	item.ecSpmtPlanVlm
						//,planRmrk: 			item.planRmrk

						,prdctnVlm: 		item.prdctnVlm
						,ecSpmtVlm: 		item.ecSpmtVlm
						,spmtPrc: 			item.spmtPrc
						//,spmtRmrk: 			item.spmtRmrk

				}
				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO);
				jsonExpUpload.push(PrdcrOgnCurntMngVO)
			});

			grdPrdcrOgnCurntMng02.rebuild();

			//법인체 마감 추가
			let prfmncCorpDdlnYn = SBUxMethod.get('dtl-input-prfmncCorpDdlnYn');
			if (prfmncCorpDdlnYn != 'Y') {
				//입력폼 추가를 위한 줄추가
				grdPrdcrOgnCurntMng02.addRow();
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//그리드 클릭이벤트
	function gridClick(){
		console.log("================grid dbClick================");
		//grdGpcList 그리드 객체
		let selGridRow = grdPrdcrOgnCurntMng01.getRow();
		let selGridCol = grdPrdcrOgnCurntMng01.getCol();


		let delYnCol = grdPrdcrOgnCurntMng01.getColRef('delYn');
		let delYnValue = grdPrdcrOgnCurntMng01.getCellData(selGridRow,delYnCol);

		//임력할 데이터 인지 확인
		//추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
		//fn_procRow 의 ADD 확인
		if(delYnValue != 'N'){
			return;
		}

		//분류,품목,
		//let ctgryNmCol = grdPrdcrOgnCurntMng01.getColRef('ctgryNm');
		let itemNmCol = grdPrdcrOgnCurntMng01.getColRef('itemNm');

		if(selGridRow == '-1'){
			return;
		} else {
			//선택한 데이터가 통합조직 일떄
			//if (selGridCol == ctgryNmCol || selGridCol == itemNmCol){
			if (selGridCol == itemNmCol){
				//팝업창 오픈
				//통합조직 팝업창 id : modal-gpcList
				let yr = SBUxMethod.get('dtl-input-yr');
				let brno = SBUxMethod.get('dtl-input-brno');
				let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
				if(gfn_isEmpty(uoBrno)){
					uoBrno = brno;
				}
				console.log(yr, brno, uoBrno);
				popYrGpcSelect.init(yr, brno, uoBrno, fn_setGridItem);
				SBUxMethod.openModal('modal-yrGpcList');
			}
		}
	}

	function fn_openMaodalSelect(nRow){
		let delYnCol = grdPrdcrOgnCurntMng01.getColRef('delYn');
		let delYnValue = grdPrdcrOgnCurntMng01.getCellData(nRow,delYnCol);
		if(delYnValue == '' || delYnValue == null){
			return
		}
		grdPrdcrOgnCurntMng01.setRow(nRow);
		let yr = SBUxMethod.get('dtl-input-yr');
		let brno = SBUxMethod.get('dtl-input-brno');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		if(gfn_isEmpty(uoBrno)){
			uoBrno = brno;
		}
		console.log(yr, brno, uoBrno);
		popYrGpcSelect.init(yr, brno, uoBrno, fn_setGridItem);
		SBUxMethod.openModal('modal-yrGpcList');
	}

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		console.log("================fn_setGridItem================");
		//console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selGridRow = grdPrdcrOgnCurntMng01.getRow();
			//let selRef = grdPrdcrOgnCurntMng01.getRefOfCol(selGridCol);

			let colRefIdx1 = grdPrdcrOgnCurntMng01.getColRef("ctgryCd");//분류코드 인덱스
			let colRefIdx2 = grdPrdcrOgnCurntMng01.getColRef("sttgUpbrItemSe");//품목구분 인덱스
			let colRefIdx3 = grdPrdcrOgnCurntMng01.getColRef("itemCd");//품목코드 인덱스
			let colRefIdx4 = grdPrdcrOgnCurntMng01.getColRef("itemNm");//품목명 인덱스
			//let colRefIdx5 = grdPrdcrOgnCurntMng01.getColRef("rmrk");//기타 인덱스
			let colRefIdx6 = grdPrdcrOgnCurntMng01.getColRef("clsfCd");//분류코드 인덱스

			//그리드 값 세팅
			grdPrdcrOgnCurntMng01.setCellData(selGridRow,colRefIdx1,rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow,colRefIdx2,rowData.sttgUpbrItemSe,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow,colRefIdx3,rowData.itemCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow,colRefIdx4,rowData.itemNm,true);
			//grdPrdcrOgnCurntMng01.setCellData(selGridRow,colRefIdx5,rowData.rmrk,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow,colRefIdx6,rowData.clsfCd,true);

			let grdStatus = grdPrdcrOgnCurntMng01.getRowStatus(selGridRow);
		 	if(grdStatus != '1'){
				grdPrdcrOgnCurntMng01.setRowStatus(selGridRow,'update');
		 	}
		}
	}

	/*	엑셀업로드	*/

	// 엑셀다운로드

	const fn_getExpColumns = function() {
		const _columns = [];
		_columns.push(
			/*
			{caption: ["조직원명","조직원명"], 		ref: 'flnm',   	type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["재배지 주소","재배지 주소"], 	ref: 'cltvtnLandAddr',   	type:'input',  width:'500px',    style:'text-align:center'},
			{caption: ["기준","재배면적(㎡)"], 	ref: 'cltvtnSfc',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["생산","(평년)생산량(톤)"], ref: 'avgYrPrdctnVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["생산","생산계획량(톤)"], 	ref: 'prdctnPlanVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["생산","생산량(결과)(톤)"], ref: 'prdctnVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["계약","전속(약정)\n출하계약량(톤)"], 	ref: 'ecSpmtPlanVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하","전속(약정)\n출하량(결과)(톤)"], 	ref: 'ecSpmtVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하","출하대금\n지급액(천원)"], 		ref: 'spmtPrc',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["가입일\n(YYYY-MM-DD)","가입일\n(YYYY-MM-DD)"], 			ref: 'joinDay',  	type:'datepicker',  width:'110px',    style:'text-align:center'
				,typeinfo : {locale : 'ko' , dateformat :'yymmdd' , yearrange : 150}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
			{caption: ["비고","비고"],				ref: 'cltvtnAreaRmrk',      	type:'input',  width:'300px',    style:'text-align:center'},
			*/

			{caption: ["조직원명","조직원명"],			ref: 'flnm',				type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["재배지 주소","재배지 주소"],	ref: 'cltvtnLandAddr',		type:'input',  width:'600px',    style:'text-align:center'},
			{caption: ["기준","재배면적(㎡)"],		ref: 'cltvtnSfc',			type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["기준","(평년)생산량(톤)"],		ref: 'avgYrPrdctnVlm',   	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["계약","계약면적(㎡)"],		ref: 'ecCltvtnSfc',			type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["계약","전속(약정)\n출하계약량(톤)"],	ref: 'ecSpmtPlanVlm',	type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["결과","전속(약정)\n출하량(톤)"],	ref: 'ecSpmtVlm',		type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["결과","출하대금\n지급액(천원)"],		ref: 'spmtPrc',			type:'input',  width:'140px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["가입일\n(YYYY-MM-DD)","가입일\n(YYYY-MM-DD)"], 	ref: 'joinDay',  	type:'datepicker',  width:'140px',    style:'text-align:center'
				,typeinfo : {locale : 'ko' , dateformat :'yymmdd' , yearrange : 150}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
			{caption: ["비고","비고"],				ref: 'cltvtnAreaRmrk',		type:'input',  width:'300px',    style:'text-align:center'},
		);

		return _columns;
	}

	/**
	 * @name fn_upload
	 * @description 올리기 버튼 클릭
	 */
	const fn_upload = async function() {

		const brno = SBUxMethod.get('dtl-input-brno01');

		if (gfn_isEmpty(brno)) {
			gfn_comAlert("W0001", "생산자조직");		//	W0002	{0}을/를 선택하세요.
			return;
		}


		popImp.init();

		const impColumns = fn_getExpColumns();
		//await fn_setSltJson();

		var SBGridProperties = {};
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = impColumns;
		SBGridProperties.rowheader="seq";
		popImp.importExcel(
				"농가리스트 Import",
				SBGridProperties,
				fn_importExcel,
				fn_setDataAfterImport,
				fn_grdImpValueChanged
			);
	}

	/**
	 * @name fn_importExcel
	 * @description 엑셀 업로드 저장
	 */
	const fn_importExcel = async function(_grdImp) {

		//const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목

		const pckgPrfmncList = [];

		let impData = _grdImp.getGridDataAll();

		if (impData.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
		}

		let iCol = 0;

		//농가리스트 등록할때 필요한 값
		let apoCd = SBUxMethod.get('dtl-input-apoCd01');
		let apoSe = SBUxMethod.get('dtl-input-apoSe01');
		let crno = SBUxMethod.get('dtl-input-crno01');
		let brno = SBUxMethod.get('dtl-input-brno01');
		let yr = SBUxMethod.get('dtl-input-yr01');
		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let trmtType = SBUxMethod.get('dtl-input-trmtType');
		let sttgUpbrItemSe = SBUxMethod.get('dtl-input-sttgUpbrItemSe');
		let prdcrOgnzSn = SBUxMethod.get('dtl-input-prdcrOgnzSn');
		let prdcrOgnzCd = SBUxMethod.get('dtl-input-prdcrOgnzCd');
		let prdcrOgnzNm = SBUxMethod.get('dtl-input-prdcrOgnzNm');
		//년도값이 비어 있으면 현재 년도 넣기
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let regMsg = "기존데이터를 삭제 처리 하시겠습니까?";
		if(confirm(regMsg)){
			//농가리스트 삭제 처리
			await fn_cltbtnSnDeleteRsrc(prdcrOgnzSn , yr);
		}



		for ( let iRow = 2; iRow <= impData.length+1; iRow++ ) {

			const rowData = _grdImp.getRowData(iRow);
			//console.log(rowData);
			// validation check
			if (gfn_isEmpty(rowData.flnm)) {
				gfn_comAlert("W0002", "성명");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				return;
			}
			if (gfn_isEmpty(rowData.cltvtnLandAddr)) {
				gfn_comAlert("W0002", "재배지 주소");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				return;
			}
			if (gfn_isEmpty(rowData.ecSpmtPlanVlm)){
				gfn_comAlert("W0002", "전속출하계약량");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				return true;
			}
			if (gfn_isEmpty(rowData.ecSpmtVlm)){
				gfn_comAlert("W0002", "전속출하량(결과)");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				return true;
			}
			if (gfn_isEmpty(rowData.spmtPrc)){
				gfn_comAlert("W0002", "출하대금 지급액");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				return true;
			}
			if (gfn_isEmpty(rowData.joinDay)){
				gfn_comAlert("W0002", "가입일");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				return true;
			}

 			rowData.apoCd = apoCd;
			rowData.apoSe = apoSe;
			rowData.crno = crno;
			rowData.brno = brno;
			rowData.yr = yr;
			rowData.itemCd = itemCd;
			rowData.trmtType = trmtType;
			rowData.prdcrOgnzSn = prdcrOgnzSn;
			rowData.prdcrOgnzCd = prdcrOgnzCd;
			rowData.prdcrOgnzNm = prdcrOgnzNm;
			rowData.sttgUpbrItemSe = sttgUpbrItemSe;
			rowData.rowSts = "I";

			//날짜입력시 특수 문자 제거
			let dateVal = rowData.joinDay;
			let result = formatDateToYYYYMMDD(dateVal);
			rowData.joinDay = result.substr(0,8);//년월일 이상 적는 경우 대비

			//저장할데이터
			const pckgPrfmnc = {
				apoCd: rowData.apoCd,
				apoSe: rowData.apoSe,
				crno: rowData.crno,
				brno: rowData.brno,
				itemCd: rowData.itemCd,
				trmtType: rowData.trmtType,
				prdcrOgnzSn: rowData.prdcrOgnzSn,
				prdcrOgnzCd: rowData.prdcrOgnzCd,
				prdcrOgnzNm: rowData.prdcrOgnzNm,
				sttgUpbrItemSe: rowData.sttgUpbrItemSe,
				yr: rowData.yr,
				rowSts: "I",

				flnm: rowData.flnm,
				cltvtnLandAddr: rowData.cltvtnLandAddr,

				joinDay: rowData.joinDay,
				cltvtnSfc: rowData.cltvtnSfc,
				ecCltvtnSfc: rowData.ecCltvtnSfc,

				avgYrPrdctnVlm: rowData.avgYrPrdctnVlm,
				cltvtnAreaRmrk: rowData.cltvtnAreaRmrk,

				ecSpmtPlanVlm: 	rowData.ecSpmtPlanVlm,

				ecSpmtVlm: rowData.ecSpmtVlm,
				spmtPrc: rowData.spmtPrc
			}

			pckgPrfmncList.push(rowData);
		}

		if (pckgPrfmncList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
		}

		if (!gfn_comConfirm("Q0001", "저장")) {
			return;
		}

		let postUrl = "/pd/pom/multiSavePrdcrOgnCurntMngList.do";

		const postJsonPromise = gfn_postJSON(postUrl, pckgPrfmncList);
		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				popImp.close();
				fn_dtlGridSearch01();
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
			}
		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	//숫자 반환 함수
	function fn_numReturn(dateString) {
		// 숫자만 추출하여 문자열로 반환
		var numbers = dateString.toString().match(/\d+/g);

		// 추출된 숫자가 없는 경우 빈 문자열 반환
		return numbers ? numbers.join('') : '';
	}

	function formatDateToYYYYMMDD(inputDate) {
		// 정규식을 사용하여 날짜 형식에서 연도, 월, 일을 추출
		var match = inputDate.toString().match(/(\d{4})[-./년](\d{1,2})[-./월](\d{1,2})일?/);

		// 추출된 연도, 월, 일을 사용하여 YYYYMMDD 형태의 문자열로 반환
		if (match) {
			var year = match[1];
			var month = match[2].padStart(2, '0'); // 월이 한 자리 수일 경우 앞에 0 추가
			var day = match[3].padStart(2, '0');   // 일이 한 자리 수일 경우 앞에 0 추가
			return year + month + day;
		} else {
			// 매치되는 형식이 없을 경우 예외 처리 또는 기본값 반환
			return inputDate;
		}
	}

	function formatData(input) {
		if (typeof input === 'number') {
			// 숫자인 경우
			const inputString = input.toString();
			if (inputString.length === 5) {
				// 5자리인 경우: Excel 날짜 서식 시리얼을 YYYYMMDD로 변환
				return excelSerialToKoreanDate(input);
			} else {
				// 6자리 이상인 경우: 앞에서부터 8자리까지 잘라서 리턴
				// YY/MM/DD
				// YYYY/M/D
				return inputString.substring(0, 8);
			}
		} else if (typeof input === 'string') {
			// 문자열인 경우: 특수문자 제외하고 앞에서부터 8자리까지 잘라서 리턴
			//YYYY년 MM월 DD일
			//YY년 MM월 DD일
			//YYYY.MM.DD
			//YYYY/MM/DD
			//YYYY-YMM-DD
			//YYYYMMDD
			const sanitizedString = input.replace(/[^0-9a-zA-Z]/g, '');
			return sanitizedString.substring(0, 8);
		} else {
			// 다른 형식인 경우
			return null; // 또는 다른 처리를 원하는 대로 수행
		}
	}

	// Excel 시리얼 넘버를 YYYY-MM-DD로 변환하는 함수
	function excelSerialToKoreanDate(serial) {
		const MS_PER_DAY = 24 * 60 * 60 * 1000; // milliseconds per day
		let date = new Date((serial - 2) * MS_PER_DAY + Date.UTC(1900, 0, 1));

		let year = date.getFullYear();
		let month = (date.getMonth() + 1).toString().padStart(2, '0');
		let day = date.getDate().toString().padStart(2, '0');

		return '' + year + month + day;
	}

	//콤보 세팅
	const fn_setSltJson = async function() {

		//const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		//jsonExpSltItem 				= gfn_cloneJson(jsonApcItem);			// 엑셀 품목Json

		//jsonExpSltItem				= gfn_getJsonFilter(jsonExpSltItem, "itemCd", itemCd);

		//jsonExpSltPckgFclt 			= gfn_cloneJson(jsonComPckgFclt);			// 엑셀 포장기Json
	}


	/**
     * @name fn_grdImpValueChanged
     * @description import 변경 event 처리
     * @function
     */
	const fn_grdImpValueChanged = function(_grdImp) {
		//valuechanged 이벤트
		console.log("fn_grdImpValueChanged");
		console.log(_grdImp);
		var nRow = _grdImp.getRow();
		var nCol = _grdImp.getCol();
	}

	/**
	 * @name fn_setDataAfterImport
	 * @description afterimportexcel 이벤트
	 */
	const fn_setDataAfterImport = function(_grdImp) {
		console.log("fn_setDataAfterImport");
		console.log(_grdImp);
		let impData = _grdImp.getGridDataAll();

		const today = gfn_dateToYmd(new Date());

		const abnormalList = [];

		for ( let iRow = 1; iRow <= impData.length; iRow++ ) {

			const rowData = _grdImp.getRowData(iRow+1, false);	// deep copy
			if(typeof rowData == "undefined" || rowData == null || rowData == "" ){
				continue;
			}
			let dateVal = rowData.joinDay;
			console.log(dateVal);
			if (!gfn_isEmpty(rowData.joinDay)) {
				//날짜입력시 특수 문자 제거
				let result = formatData(dateVal);
				console.log(result);
				rowData.joinDay = result;//년월일 이상 적는 경우 대비
			}

			_grdImp.refresh({"combo":true, "focus":false});
		}
		_grdImp.refresh();

	}


	/*	엑셀 서식 받기	*/

	var grdExpUpload;			// 엑셀업로드 서식 그리드
	var jsonExpUpload 			= [];	// 엑셀업로드 서식 데이터

	//서식 다운로드
	const fn_dwnld = async function(){
		/*
		const itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		*/
		//const itemNm = SBUxMethod.getText("srch-slt-itemCd");	// 품목

		await fn_setSltJson();
		//await fn_setExpJson();

		const expColumns = fn_getExpColumns();
		const expObjList = [

			{
		        sbGrid: grdExpUpload,
		        parentid: "sbexp-area-grdExpUpload",
		        id: "grdExpUpload",
		        jsonref: "jsonExpUpload",
				columns: expColumns,
		        sheetName: "농가리스트",
		        title: "",
		        unit: ""
			}

		];

		await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드

		let fileName = "농가리스트 엑셀 업로드(샘플).xlsx"
	    gfn_exportExcelMulti(fileName, expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			console.log(exp.sbGrid);
			exp.sbGrid.addRow(true);
		});
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		// 엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		// 넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}

	//엑셀업로드 저장시 기존 농가리스트 삭제
	async function fn_cltbtnSnDeleteRsrc(prdcrOgnzSn, yr){
		console.log("==========fn_cltbtnSnDeleteRsrc============");
		let postJsonPromise = gfn_postJSON("/pd/pom/deleteTbEvFrmhsPrdctnEcSpmtSttnApo.do", {
				prdcrOgnzSn : prdcrOgnzSn
				,yr : yr
		})
		let data = await postJsonPromise;

		try{
			//console.log(data);
			console.log("삭제 되었습니다.");
			alert("삭제 되었습니다.");
			/*
			if(data.result > 0){
				console.log("삭제 되었습니다.");
			}else{
				console.log("삭제 할 데이터가 없습니다.");
				//alert("삭제 도중 오류가 발생 되었습니다.");
			}
			*/
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
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
			{caption: ["등록년도"], 		ref: 'yr',   		type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["조직구분"], 		ref: 'apoSeNm',   	type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["통합조직명"], 		ref: 'uoCorpNm',   	type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["통합조직 사업자등록번호"],ref: 'uoBrno',		type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["조직명"], 			ref: 'corpNm',   	type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["사업자등록번호"], 	ref: 'brno',   		type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["구분"], 			ref: 'sttgUpbrItemNm',   type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["부류"], 			ref: 'clsfNm',   	type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["평가부류"], 		ref: 'ctgryNm',   	type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 			ref: 'itemNm',   	type:'input',  width:'150px',    style:'text-align:center'},
			{caption: ["취급유형"], 		ref: 'trmtTypeNm',   	type:'input',  width:'100px',    style:'text-align:center'},

			{caption: ["적합여부"], 		ref: 'stbltYn',   	type:'input',  width:'50px',    style:'text-align:center'},
			{caption: ["조직원수"], 		ref: 'cnt',   		type:'input',  width:'70px',    style:'text-align:center'},

			{caption: ["계약물량(톤)\n[A]"], 	ref: 'ecSpmtPlanVlmTot',   	type:'input',  width:'140px',    style:'text-align:center'},
			{caption: ["출하량(톤)\n[B]"], 		ref: 'ecSpmtVlmTot',   	type:'input',  width:'140px',    style:'text-align:center'},

			{caption: ["출하대금\n지급액(천원)"], 	ref: 'spmtPrcTot',   	type:'input',  width:'140px',    style:'text-align:center'},

			{caption: ["출하비율(%)\n[B/A]"], 	ref: 'ecSpmtRateB',   	type:'input',  width:'100px',    style:'text-align:center;'},

			{caption: ["비고"], 				ref: 'rmrk',   			type:'input',  width:'220px',    style:'text-align:center'},

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

		let postJsonPromise = gfn_postJSON("/pd/pom/selectRawData01.do", {
			yr : yr
			});

			let data = await postJsonPromise;
			try{
			jsonHiddenGrd.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						yr: 				item.yr
						,apoSe: 			item.apoSe
						,apoSeNm: 			item.apoSeNm
						,brno: 				item.brno
						,corpNm: 			item.corpNm
						,uoBrno:			item.uoBrno
						,uoCorpNm:			item.uoCorpNm

						,apoSe: 			item.apoSe
						,apoSeNm: 			item.apoSeNm

						,prdcrOgnzNm: 		item.prdcrOgnzNm

						,sttgUpbrItemSe: 	item.sttgUpbrItemSe
						,sttgUpbrItemNm: 	item.sttgUpbrItemNm
						,clsfCd: 			item.clsfCd
						,clsfNm: 			item.clsfNm
						,ctgryCd: 			item.ctgryCd
						,ctgryNm: 			item.ctgryNm
						,itemCd: 			item.itemCd
						,itemNm: 			item.itemNm
						,trmtType: 			item.trmtType
						,trmtTypeNm: 		item.trmtTypeNm
						,stbltYn: 			item.stbltYn
						,cnt: 				item.cnt
						,ecSpmtPlanVlmTot: 	item.ecSpmtPlanVlmTot
						,ecSpmtVlmTot: 		item.ecSpmtVlmTot
						,spmtPrcTot: 		item.spmtPrcTot
						,ecSpmtRateB: 		item.ecSpmtRateB
						,rmrk: 				item.rmrk

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

		let fileName = formattedDate + "_생산자조직_로우데이터";

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


	/* 로우데이터 요청 */

	var jsonHiddenGrd01 = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd01;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd01 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd01';
		SBGridProperties.id = 'hiddenGrd01';
		SBGridProperties.jsonref = 'jsonHiddenGrd01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["신청년도"],			ref:'yr',				type:'output',width:'70px',style:'text-align:center'},
			{caption: ["조직구분"],			ref:'apoSeNm',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["사업자번호"],		ref:'brno',				type:'output',width:'70px',style:'text-align:center'},
			{caption: ["법인명"],			ref:'corpNm',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 사업자번호"],	ref:'uoBrno',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["통합조직 법인명"],	ref:'uoCorpNm',			type:'output',width:'70px',style:'text-align:center'},

			{caption: ["구분"], 			ref: 'sttgUpbrItemNm',   type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["부류"], 			ref: 'clsfNm',   		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["평가부류"], 		ref: 'ctgryNm',   		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 			ref: 'itemNm',   		type:'input',  width:'150px',    style:'text-align:center'},
			{caption: ["취급유형"], 		ref: 'trmtTypeNm',   	type:'input',  width:'100px',    style:'text-align:center'},

			{caption: ["생산자조직 명"], 		ref: 'prdcrOgnzNm',   	type:'input',  width:'180px',    style:'text-align:center'},
			{caption: ["조직원명"], 	ref: 'flnm',   		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["재배지 주소"],ref: 'cltvtnLandAddr',	type:'input',  width:'500px',    style:'text-align:center'},
			{caption: ["품목"], 			ref: 'itemNm',   		type:'input',  width:'120px',    style:'text-align:center' },
			{caption: ["기준 재배면적(㎡)"], 	ref: 'cltvtnSfc',   	type:'input',  width:'140px',    style:'text-align:center'},
			{caption: ["기준 (평년)생산량(톤)"],	ref: 'avgYrPrdctnVlm',	type:'input',  width:'140px',    style:'text-align:center'},

			{caption: ["계약 계약면적(㎡)"], 	ref: 'ecCltvtnSfc',		type:'input',  width:'140px',    style:'text-align:center'},
			{caption: ["계약 전속(약정)\n출하계약량(톤)"], ref: 'ecSpmtPlanVlm',	type:'input',  width:'140px',    style:'text-align:center'},

			{caption: ["결과 전속(약정)\n출하량(톤)"], ref: 'ecSpmtVlm',	type:'input',  width:'140px',    style:'text-align:center'},
			{caption: ["결과 출하대금\n지급액(천원)"], ref: 'spmtPrc',   	type:'input',  width:'140px',    style:'text-align:center'},

			{caption: ["가입일"], 		ref: 'joinDay',  		type:'input',  width:'110px',    style:'text-align:center'},

		];

		hiddenGrd01 = _SBGrid.create(SBGridProperties);

	}
	const fn_hiddenGrdSelect01 = async function(){

		if(!confirm("농가 로우데이터를 받으시곘습니까? \n농가리스트의 경우 양이 많아 오래 걸릴수 있습니다")) return;

		await fn_hiddenGrd01();
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pom/selectRawData02.do", {
			yr : yr
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd01.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						yr: 		item.yr
						,apoCd: 	item.apoCd
						,apoSe: 	item.apoSe
						,apoSeNm: 	item.apoSeNm
						,brno: 		item.brno
						,uoBrno: 	item.uoBrno
						,crno: 		item.crno
						,corpNm: 	item.corpNm
						,uoCorpNm: 	item.uoCorpNm

						,sttgUpbrItemSe: 	item.sttgUpbrItemSe
						,sttgUpbrItemNm: 	item.sttgUpbrItemNm
						,ctgryCd: 			item.ctgryCd
						,ctgryNm: 			item.ctgryNm
						,clsfCd: 			item.clsfCd
						,clsfNm: 			item.clsfNm
						,itemCd: 			item.itemCd
						,itemNm: 			item.itemNm
						,trmtType: 			item.trmtType
						,trmtTypeNm: 		item.trmtTypeNm

						,prdcrOgnzSn: 		item.prdcrOgnzSn
						,prdcrOgnzCd: 		item.prdcrOgnzCd
						,prdcrOgnzNm: 		item.prdcrOgnzNm

						,cltvtnLandSn: 		item.cltvtnLandSn
						,flnm: 				item.flnm
						,cltvtnLandAddr: 	item.cltvtnLandAddr

						,joinDay: 			item.joinDay
						,whdwlDay: 			item.whdwlDay
						,cltvtnSfc: 		item.cltvtnSfc
						,ecCltvtnSfc: 		item.ecCltvtnSfc
						,avgYrPrdctnVlm: 	item.avgYrPrdctnVlm
						,cltvtnAreaRmrk: 	item.cltvtnAreaRmrk

						,prdctnPlanVlm: 	item.prdctnPlanVlm
						,ecSpmtPlanVlm: 	item.ecSpmtPlanVlm

						,prdctnVlm: 		item.prdctnVlm
						,ecSpmtVlm: 		item.ecSpmtVlm
						,spmtPrc: 			item.spmtPrc

				}
				jsonHiddenGrd01.push(hiddenGrdVO);
			});

			await hiddenGrd01.rebuild();

			await fn_excelDown01();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//로우 데이터 엑셀 다운로드
	function fn_excelDown01(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_농가리스트_로우데이터";

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
		hiddenGrd01.exportData("xlsx" , fileName , true , true);
	}

	//과거 조회 팝업
	const fn_openMaodal = function() {
		//사업자번호
		let brno = SBUxMethod.get("dtl-input-brno");

		if(gfn_isEmpty(brno)){return;}

		//popBizPlanPdfViewer.init(rowData , fn_setPdfViewer);
		//SBUxMethod.openModal('modal-bizPlanPdfViewer');

		var url = "/pd/hisPopup/PrdcrOgnHisPopup.do"
		var title = "제출서류 보기";
		//SBUxMethod.popupWindow(url, title, '600px','500px');

		window.open(url, title, "width=1000px,height=900px");
	}

	//새창에서 변수 확인
	function fn_getData() {
		let data = [];
		data.brno = SBUxMethod.get("dtl-input-brno");
		data.corpNm = SBUxMethod.get("dtl-input-corpNm");
		return data;
	}

</script>
</html>


