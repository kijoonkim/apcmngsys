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
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
				</div>
			</div>
			<div class="box-body">
<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-wghno" name="dtl-inp-wghno" uitype="hidden"></sbux-input>
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
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
									id="dtl-slt-orgNm"
									name="dtl-slt-orgNm"
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
									id="dtl-slt-prvncs"
									name="dtl-slt-prvncs"
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
									id="dtl-slt-cnts"
									name="dtl-slt-cnts"
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
									id="dtl-slt-crprtDvd"
									name="dtl-slt-crprtDvd"
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
									id="dtl-slt-crprtForm"
									name="dtl-slt-crprtForm"
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
									id="dtl-slt-scndApprvDvd"
									name="dtl-slt-scndApprvDvd"
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
									id="dtl-inp-bsnssNb"
									name="dtl-inp-bsnssNb"
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
									id="dtl-inp-crprtNm"
									name="dtl-inp-crprtNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
							<th scope="row" class="th_bg">참여조직여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-prtcptOrgYn"
									name="dtl-slt-prtcptOrgYn"
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
							<th colspan="15" scope="row" class="th_bg"  style="text-align:center;">업체정보</th>
						</tr>
						<tr>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-crprtNm"
									name="dtl-inp-crprtNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>법인등록번호</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-input
									uitype="text"
									id="dtl-inp-crprtNb"
									name="dtl-inp-crprtNb"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>사업자번호</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-bsnssNb"
									name="dtl-inp-bsnssNb"
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
									id="dtl-inp-bsnssNb2"
									name="dtl-inp-bsnssNb2"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>경영체여부</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="dtl-inp-crprtNm"
									name="dtl-inp-crprtNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<th colspan="2" scope="row" class="th_bg">환코드</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-hwanCd"
									name="dtl-inp-hwanCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th colspan="2" rowspan="2" scope="row" class="th_bg"><span class="data_required" ></span>주소</th>
							<td class="td_input" style="border-right:hidden;">[지번 주소]</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-address1"
									name="dtl-inp-address1"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-address2"
									name="dtl-inp-address2"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<td class="td_input" style="border-right:hidden;">도로명 주소</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-hwanCd"
									name="dtl-inp-hwanCd"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="6" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-hwanCd"
									name="dtl-inp-hwanCd"
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
							<sbux-select
									id="1"
									name="1"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<sbux-select
									id="2"
									name="2"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<sbux-select
									id="3"
									name="3"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<sbux-select
									id="4"
									name="4"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<sbux-select
									id="5"
									name="5"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<sbux-select
									id="6"
									name="6"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
								</td>
							<td colspan="2" class="td_input">
							<sbux-select
									id="7"
									name="7"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
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
							<sbux-input
									uitype="text"
									id="11"
									name="11"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td>천원</td>
							<td colspan="2"   style="border-right: hidden;">
							<sbux-input
									uitype="text"
									id="22"
									name="22"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td>천원</td>
							<td colspan="2"   style="border-right: hidden;">
							<sbux-input
									uitype="text"
									id="33"
									name="33"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td></td>
							<td colspan="2"   style="border-right: hidden;">
							<sbux-input
									uitype="text"
									id="44"
									name="44"
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
						<sbux-input
									uitype="text"
									id="55"
									name="55"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="2" style="border-right:hidden;">
						<sbux-input
									uitype="text"
									id="66"
									name="66"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="2" style="border-right:hidden;">
						<sbux-input
									uitype="text"
									id="77"
									name="77"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
						</td>
						<td>명</td>
						<td colspan="4" style="border-right:hidden;">
						<sbux-input
									uitype="text"
									id="88"
									name="88"
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
									id="10"
									name="10"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>직위</th>
							<td colspan="2">
							<sbux-input
									uitype="text"
									id="11"
									name="11"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>성명</th>
							<td colspan="2">
							<sbux-input
									uitype="text"
									id="12"
									name="12"
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
									id="13"
									name="13"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>전화번호</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="14"
									name="14"
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
									id="15"
									name="15"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>핸드폰번호</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="16"
									name="16"
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
									id=17
									name="17"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required" ></span>이메일주소</th>
							<td colspan="6">
							<sbux-input
									uitype="text"
									id="18"
									name="18"
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
									id="19"
									name="19"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
								</td>
						</tr>
						<tr>
							<th colspan="7" scope="row" class="th_bg">품목농협 지소 여부</th>
							<td colspan="8">
							<sbux-select
									id="20"
									name="20"
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

    <!-- 통합조직,출자출하조직 선택 Modal -->
    <!-- 2023 09 22 ljw 통합조직 출자출하조직 리스트 팝업 생성 -->
    <div>
        <sbux-modal
        	id="modal-invstmntSpmt"
        	name="modal-invstmntSpmt"
        	uitype="middle"
        	header-title="통합조직,출자출하조직 선택"
        	body-html-id="body-modal-invstmntSpmt"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-invstmntSpmt">
<%--     	<jsp:include page="../popup/InvstmntSpmtPopup.jsp"></jsp:include> --%>
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/InvstmntSpmtPopup.jsp"></jsp:include>
    </div>


    <!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemSelect" name="modal-itemSelect" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemSelect" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/ItemSelectPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		/*
		gfn_setComCdSBSelect(
				'dtl-slt-frstApprv',
				jsonDSFA,
			'IOPD_COFM_CD');

		gfn_setComCdSBSelect(
				'dtl-slt-scndApprv',
				jsonDSSA,
			'IOPD_SED_COFM_CD');

		gfn_setComCdSBSelect(
				'dtl-slt-orgNm',
				jsonDSON,
			'IOPD_CMPTNT_ORG');

		gfn_setComCdSBSelect(
				'dtl-slt-athrt',
				jsonDSA,
			'IOPD_ATHRT'); */

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

	/**
	 * 조회 조건 select combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),	// 품종
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,  	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록
		]);

		SBUxMethod.set("dtl-rdo-gdsSeCd", '1');
	}


	//설비 등록
	var jsonPrdcrCrclOgnMng = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];
	var grdPrdcrCrclOgnMng;

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdPrdcrCrclOgnMng', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
		])

	}


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrCrclOgnMng';
	    SBGridProperties.id = 'grdPrdcrCrclOgnMng';
	    SBGridProperties.jsonref = 'jsonPrdcrCrclOgnMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["일련번호"], 		ref: 'testNo',   	type:'input',  hidden : false},
	    	{caption: ["구분"], 	ref: 'aa',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'jsonComFcltGubun', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
// 	        {caption: ["사업자등록번호"], 	ref: 'bb',   type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["사업자등록번호"], 	ref: 'iiCode',   	type:'input',  width:'80px',    style:'text-align:center' ,  editable : false},
	        {caption: ["전문품목"], 		ref: 'cc',   type:'output',  width:'200px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ["전문품목 코드"], 	ref: 'ccCode',   	type:'input', width:'80px', style:'text-align:center' ,  editable : false},
	        {caption: ["육성품목"], 	ref: 'dd',   	type:'output',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["육성품목 코드"], 	ref: 'ddCode',   	type:'input',width:'80px', style:'text-align:center' ,  editable : false},
	        {caption: ["선정여부"], 	ref: 'ee',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["탈락사유"], 	ref: 'ff',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["신청액"], 	ref: 'gg',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["적용금리"], 	ref: 'hh',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
// 	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["통합조직 코드"], 	ref: 'iiCode',   	type:'input', hidden:true},
	        /*
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	console.log(strValue);
	        	if(strValue== null || strValue == ""){
	        		console.log("통합조직 값없음");
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnMng\", " + nRow + ", " + nCol + ")'></sbux-button>"
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnMng\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnMng\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		console.log("통합조직 값있음");
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnMng\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnMng\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        */
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPrdcrCrclOgnMng\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPrdcrCrclOgnMng\", " + nRow + ")'>삭제</button>";
	        	}
	        }}
	    ];

	    grdPrdcrCrclOgnMng = _SBGrid.create(SBGridProperties);
// 	    let rst = await Promise.all([
// 	    	fn_initSBSelectFclt(),
// 		    fn_searchFcltList()
// 		])
// 		grdPrdcrCrclOgnMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
 	  	grdPrdcrCrclOgnMng.bind('click','gridClick');
	    grdPrdcrCrclOgnMng.bind('click','fn_view');
	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let ccCode = SBUxMethod.get("srch-inp-itemCd1");//전문품목
		let iiCode = SBUxMethod.get("srch-inp-apcCd2");//통합조직
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnMng.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnMngList.do", {
    		ccCode : ccCode
    		,iiCode : iiCode
		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrCrclOgnMngVO = {
					testNo 		: item.testNo
				  , aa 		: item.aa
				  , bb 		: item.bb
				  , cc 	: item.cc
				  , ccCode 	: item.ccCode
				  , dd 	: item.dd
				  , ddCode 	: item.ddCode
				  , ee 		: item.ee
				  , ff 		: item.ff
				  , gg 		: item.gg
				  , hh 		: item.hh
				  , ii 		: item.ii
				  , iiCode 		: item.iiCode
				  , delYn 		: item.delYn
				}
				jsonPrdcrCrclOgnMng.push(PrdcrCrclOgnMngVO);
			});



        	grdPrdcrCrclOgnMng.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdPrdcrCrclOgnMng.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdPrdcrCrclOgnMng.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdPrdcrCrclOgnMng.getRowData(i);
			let rowSts = grdPrdcrCrclOgnMng.getRowStatus(i);
			let bb = rowData.bb;
			let aa = rowData.aa;
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if (gfn_isEmpty(aa)) {
		  			gfn_comAlert("W0002", "설비명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				/* if (gfn_isEmpty(bb)) {
		  			gfn_comAlert("W0001", "설비구분");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		} */

				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
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

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			let postJsonPromise = gfn_postJSON("/pd/bsm/multiSavePrdcrCrclOgnMngList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchFcltList();
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


	/* Grid Row 추가 및 삭제 기능*/
    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "grdPrdcrCrclOgnMng") {
            	grdPrdcrCrclOgnMng.setCellData(nRow, nCol, "N", true);
            	//grdPrdcrCrclOgnMng.setCellData(nRow, 5, gv_apcCd, true);
            	grdPrdcrCrclOgnMng.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdPrdcrCrclOgnMng") {
            	if(grdPrdcrCrclOgnMng.getRowStatus(nRow) == 0 || grdPrdcrCrclOgnMng.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var PrdcrCrclOgnMngVO = grdPrdcrCrclOgnMng.getRowData(nRow);
            			fn_deleteRsrc(PrdcrCrclOgnMngVO);
            			grdPrdcrCrclOgnMng.deleteRow(nRow);
            		}
            	}else{
            		grdPrdcrCrclOgnMng.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(PrdcrCrclOgnMngVO){
		let postJsonPromise = gfn_postJSON("/pd/bsm/deletePrdcrCrclOgnMng.do", PrdcrCrclOgnMngVO);
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


	//통합조직,출자출하조직 팝업
	const fn_choiceInvstmntSpmt = function() {
		popInvstmntSpmt.init(gv_selectedApcCd, gv_selectedApcNm, fn_setInvstmntSpmt);
	}
	//통합조직 출자출하조직 팝업 콜백함수
	const fn_setInvstmntSpmt = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("srch-inp-apcCd1", rowData.subCode);
			SBUxMethod.set("srch-inp-apcNm1", rowData.subCodeNm);
			SBUxMethod.set("srch-inp-apcCd2", rowData.mainCode);
			SBUxMethod.set("srch-inp-apcNm2", rowData.mainCodeNm);
		}
	}


	// 품목 선택 팝업 호출
	const fn_modalItemSelect = function(sn) {
		console.log("================fn_modalItemSelect================");
		console.log(sn);
		popItemSelect.init(sn,fn_setItem);
	}
	// 품목 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		console.log("================fn_setItem================");
		console.log(itemVal);
		if (!gfn_isEmpty(itemVal)) {
			SBUxMethod.set('srch-inp-itemCd' + itemVal.sn , itemVal.itemCd);
			SBUxMethod.set('srch-inp-itemNm' + itemVal.sn , itemVal.itemNm);
		}
	}



    function fn_GridPop(gubun, grid, nRow, nCol) {
    	console.log("================fn_GridPop================");
        if (gubun === "pop") {
            if (grid === "grdPrdcrCrclOgnMng") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdPrdcrCrclOgnMng.setCellData(nRow, nCol, "N", true);
            }
        }
    }


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

    //그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdPrdcrCrclOgnMng 그리드 객체
        selGridRow = grdPrdcrCrclOgnMng.getRow();
        selGridCol = grdPrdcrCrclOgnMng.getCol();


        let delYnCol = grdPrdcrCrclOgnMng.getColRef('delYn');
        let delYnValue = grdPrdcrCrclOgnMng.getCellData(selGridRow,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //cc 전문 품목 dd 육성 품목
        let ccCol = grdPrdcrCrclOgnMng.getColRef('cc');
        let ddCol = grdPrdcrCrclOgnMng.getColRef('dd');
        let iiCol = grdPrdcrCrclOgnMng.getColRef('ii');

        if(selGridRow == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	if (selGridCol == iiCol){
        		//통합조직 선택 세팅
        		//통합조직 팝업 객체 popInvstmntSpmt
        		popInvstmntSpmt.init(gv_selectedApcCd, gv_selectedApcNm, fn_setGridInvstmntSpmt);
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-invstmntSpmt
        		SBUxMethod.openModal('modal-invstmntSpmt');
        	} else if (selGridCol == ccCol || selGridCol == ddCol){
        		//품목 선택 세팅
        		//품목 선택 팝업 객체 popItemSelect
        		popItemSelect.init(selGridRow, fn_setGridItem);
        		//팝업창 오픈
        		//품목 팝업창 id : modal-itemSelect
        		SBUxMethod.openModal('modal-itemSelect');
        	}
        }
    }

 	// 그리드의 통합조직 선택 팝업 콜백 함수
	const fn_setGridInvstmntSpmt = function(rowData) {
		console.log("================fn_setGridInvstmntSpmt================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow 선택된 행 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let colRefIdx1 = grdPrdcrCrclOgnMng.getColRef('ii');//ii 통합조직 인덱스
			let colRefIdx2 = grdPrdcrCrclOgnMng.getColRef('iiCode');//ii 통합조직 코드 인덱스

			//그리드 값 세팅
			grdPrdcrCrclOgnMng.setCellData(selGridRow,colRefIdx1,rowData.mainCodeNm,true);
			grdPrdcrCrclOgnMng.setCellData(selGridRow,colRefIdx2,rowData.mainCode,true);
		}
	}

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		console.log("================fn_setGridItem================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdPrdcrCrclOgnMng.getRefOfCol(selGridCol);

			//구분하기 편하기 위해 ref 값이 cc라면 코드값은 ccCode 로 설정
			let colRefIdx1 = grdPrdcrCrclOgnMng.getColRef(selRef);//품목명 인덱스
			let colRefIdx2 = grdPrdcrCrclOgnMng.getColRef(selRef+"Code");//품목코드 인덱스

			//그리드 값 세팅
			grdPrdcrCrclOgnMng.setCellData(selGridRow,colRefIdx1,rowData.itemNm,true);
			grdPrdcrCrclOgnMng.setCellData(selGridRow,colRefIdx2,rowData.itemCd,true);
		}
	}

	    //상세정보 보기 클릭이벤트
	function fn_view() {
	    	console.log("******************fn_view**********************************");
	    	var nCol = grdPrdcrCrclOgnMng.getCol();
	        //특정 열 부터 이벤트 적용
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
		console.log(rowData.operOgnzTrmtItemCn);
		console.log(gfn_isEmpty(rowData.operOgnzTrmtItemCn));
			console.log(rowData.operOgnzTrmtItemCn2);
			console.log(gfn_isEmpty(rowData.operOgnzTrmtItemCn2));
    	SBUxMethod.set("dtl-inp-crprtNm", rowData.aa);                           //  아이디
		SBUxMethod.set("dtl-inp-crprtNb", rowData.ii);                             //  이름
    	SBUxMethod.set("dtl-inp-bsnssNb", rowData.iiCode);             //  관할기관
    	SBUxMethod.set("dtl-inp-bsnssNb2", rowData.cc);             //  권한
    	SBUxMethod.set("dtl-inp-crprtNm", rowData.ccCode);                         //  사업자번호
    	SBUxMethod.set("dtl-inp-hwanCd", rowData.dd);                       //  법인명
    	SBUxMethod.set("dtl-inp-address1", rowData.ddCode);                             //  전화번호
        SBUxMethod.set("dtl-inp-address2", rowData.ee);                         //  핸드폰번호
        //여기까지 fn_view 적용중//
//	        SBUxMethod.set("dtl-slt-frstApprv2", rowData.ff);                     //  소유조직 명
//	        SBUxMethod.set("dtl-slt-frstApprvDay", rowData.gg);                     //  대표자
//	        SBUxMethod.set("dtl-slt-scndApprv2", rowData.hh);                 //  소유조직 사업자등록번호
//	        SBUxMethod.set("dtl-input-operOgnzCd", rowData.operOgnzCd);                   //  운영조직 코드
//	        SBUxMethod.set("dtl-input-operOgnzNm", rowData.operOgnzNm);                   //  운영조직 명
//	        SBUxMethod.set("dtl-input-operOgnzBrno", rowData.operOgnzBrno);               //  운영조직 사업자등록번호
//	        SBUxMethod.set("dtl-input-operOgnzDeptCd", rowData.operOgnzDeptCd);           //  운영조직 부서 코드
//	        SBUxMethod.set("dtl-input-operOgnzDeptNm", rowData.operOgnzDeptNm);           //  운영조직 부서명
//	        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", rowData.operOgnzTrmtItemCn === null ? "" : rowData.operOgnzTrmtItemCn);   //  운영조직 취급 품목 내용
//	        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn2", rowData.operOgnzTrmtItemCn2 === null ? "" : rowData.operOgnzTrmtItemCn2);   //  운영조직 취급 품목 내용
//	        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn3", rowData.operOgnzTrmtItemCn3 === null ? "" : rowData.operOgnzTrmtItemCn3);   //  운영조직 취급 품목 내용
//	        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn4", rowData.operOgnzTrmtItemCn4 === null ? "" : rowData.operOgnzTrmtItemCn4);   //  운영조직 취급 품목 내용
//	        SBUxMethod.set("dtl-input-apcTrmtItemCn", rowData.apcTrmtItemCn === null ? "" : rowData.apcTrmtItemCn);             //  APC 취급 품목 내용
//	        SBUxMethod.set("dtl-input-apcTrmtItemCn2", rowData.apcTrmtItemCn2 === null ? "" : rowData.apcTrmtItemCn2);            //  APC 취급 품목 내용
//	        SBUxMethod.set("dtl-input-apcTrmtItemCn3", rowData.apcTrmtItemCn3 === null ? "" : rowData.apcTrmtItemCn3);             //  APC 취급 품목 내용
//	        SBUxMethod.set("dtl-input-apcTrmtItemCn4", rowData.apcTrmtItemCn4 === null ? "" : rowData.apcTrmtItemCn4);             //  APC 취급 품목 내용
    }

</script>
</html>