<%
 /**
  * @Class Name : rawMtrWghReg.jsp
  * @Description : 원물계량등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 원물계량등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	<style>
		#wsarea {
			border: solid 1px black;
			display: none;
			position: absolute;
			z-index: 9999;
			width: 50vw;
			height: 50vh;
			top: 35%;
			left: 55%;
			transform: translate(-50%, -50%);
			background-color: white;
			padding: 3vw;
			overflow: scroll;
		}
		#wsarea div {
			font-size: large;
		}
		#nowWght{
			margin-right: 10px;
			font-weight: bold;
			font-size: xxx-large;
			color: #0a0a0a;
		}
		img{
			cursor: pointer;
		}
		/*#nowWghtDot {*/
		/*	animation: blink 0.5s infinite step-start;*/
		/*}*/

		/*@keyframes blink {*/
		/*	0%, 100% {*/
		/*		opacity: 1;*/
		/*	}*/
		/*	50% {*/
		/*		opacity: 0;*/
		/*	}*/
		/*}*/
		#origin-wghtData{
			display: flex;
			flex-direction: column;
			flex: 1;
		}
		#wrap-wghtData{
			display: flex;
		}
		#area-wghtData{
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: xxx-large;
			flex-basis: 15%;
		}
		#pltBxModal{
			display: none;
			height: auto;
			width: 500px;
			position: fixed;
			top: 0;
			border: 1px solid black;
			z-index: 9999;
			background-color: white;
			cursor: grab;
		}
		#closeModal{
			display: flex;
			justify-content: flex-end;
			background-color: #37719c;
		}
		#close {
			text-align: right;
			margin-right: 7px;
			font-size: 2vh;
			font-weight: bold;
			box-sizing: border-box;
			cursor: pointer;
			color: white;
		}
		#modal-overlay {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
			z-index: 999; /* 모달보다 뒤에 위치 */
			display: none; /* 기본적으로 숨김 */
		}
		#warehouseModal{
			display: none;
			max-height: 800px;
			height: auto;
			width: 500px;
			position: fixed;
			top: 30%;
			left: 30%;
			border: 2px solid black;
			z-index: 9999;
			/*background-color: #367fa9;*/
			background-color: #FFFFFF;
			cursor: grab;
		}
	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="display: flex">
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물계량등록 -->
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text=""></sbux-label>
<%--					<div style="display: flex; position: absolute; left: 170px; top: 5px">--%>
<%--						<div id="svg-container" style="display: flex; align-items: center;gap: 5px">--%>
<%--							<img id="onBtn" onclick="fn_forceInit();" src="/static/resource/svg/onBtn.svg" style="width: 50px;display: none;"/>--%>
<%--							<img id="offBtn" onclick="fn_forceInit();" src="/static/resource/svg/offBtn.svg" style="width: 50px;display: none;"/>--%>
<%--							<div id="nowWght"></div>--%>
<%--							<span id="unit" style="display: none;color: rgb(28, 84, 162); font-weight: bold; font-size: x-large">KG</span>--%>
<%--						</div>--%>
<%--					</div>--%>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
							id="btn-srch-apcLinkPop"
							name="btn-srch-apcLinkPop"
							class="btn btn-sm btn-outline-danger"
							text="연계요청"
							uitype="modal"
							target-id="modal-apcLinkPop"
							onclick="fn_popApcLink"
					></sbux-button>
					<sbux-button
							id="btnPltBx"
							name="btnPltBx"
							uitype="normal"
							class="btn btn-sm btn-primary"
							onclick="fn_pltBxModal"
							text="팔레트불출관리"
					></sbux-button>
					<sbux-button
						id="btnDocRawMtrWghV1"
						name="btnDocRawMtrWghV1"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_docRawMtrWgh(this)"
						text="계량확인서V1"
					></sbux-button>
					<sbux-button
							id="btnDocRawMtrWghV2"
							name="btnDocRawMtrWghV2"
							uitype="normal"
							class="btn btn-sm btn-primary"
							onclick="fn_docRawMtrWgh(this)"
							text="계량확인서V2"
					></sbux-button>
					<sbux-button
							id="btnDocBxPltSpmt"
							name="btnDocBxPltSpmt"
							uitype="normal"
							class="btn btn-sm btn-primary"
							onclick="fn_docBxPltSpmt"
							text="출고확인증"
					></sbux-button>
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
						text="삭제"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<div id="wrap-wghtData">
					<div id="area-wghtData">
						<img id="offBtn" onclick="fn_forceInit();" src="/static/resource/svg/offBtn.svg" style="width: 50px;display: none;"/>
						<span id="nowWght"></span>
<%--						<span id="unit" style="display: none;padding: 0px 5px;color: rgb(28, 84, 162); font-weight: bold; font-size: xxx-large">KG</span>--%>
					</div>
					<div id="origin-wghtData">
						<!--[APC] START -->
<%--						<%@ include file="../../../frame/inc/apcSelect.jsp" %>--%>
						<!--[APC] END -->
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
								<col style="width: 6%">
								<col style="width: 2%">
								<col style="width: 5%">
								<col style="width: 2%">

								<col style="width: 7%">
								<col style="width: 6%">
								<col style="width: 2%">
								<col style="width: 5%">
								<col style="width: 2%">
							</colgroup>
							<tbody>
							<tr>
								<th scope="row" class="th_bg">APC명</th>
								<td colspan="4" class="td_input" style="border-right: hidden;">
									<%@include file="../../../frame/inc/apcSelectComp.jsp" %>
								</td>
								<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
								<td colspan="9" class="td_input">
									<div style="display: flex; gap: 15px; align-items: center">
										<sbux-datepicker
												id="dtl-dtp-wghYmdFrom"
												name="dtl-dtp-wghYmdFrom"
												uitype="popup"
<%--												wrap-style="flex:1; display:flex"--%>
												date-format="yyyy-mm-dd"
												class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
										></sbux-datepicker>
										<sbux-datepicker
												id="dtl-dtp-wghYmdTo"
												name="dtl-dtp-wghYmdTo"
												uitype="popup"
<%--												wrap-style="flex:1; display:flex"--%>
												date-format="yyyy-mm-dd"
												class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
										></sbux-datepicker>
										<sbux-checkbox
												id="chkbox_dayCrtr"
												name="chkbox_dayCrtr"
												uitype="normal"
												text="일일기준"
												onclick="fn_oneDay()">
										</sbux-checkbox>
										<sbux-checkbox
												id="chkbox_search"
												name="chkbox_search"
												uitype="normal"
												text="조회"
												tooltip="검색조건(생산자, 차량번호, 운임, 입력자, 타출고처, 비고) 추가"
												onclick="">
										</sbux-checkbox>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg" ><span class="data_required" ></span>생산자</th>
								<td colspan="14" class="td_input">
									<div style="display: flex; gap: 10px">
										<div style="display: flex; gap: 10px; flex-basis: 200px">
											<sbux-input
													uitype="text"
													id="dtl-inp-prdcrNm"
													name="dtl-inp-prdcrNm"
													class="form-control input-sm input-sm-ast inpt_data_reqed"
													placeholder="초성검색 가능"
													autocomplete-ref="jsonPrdcrAutocomplete"
													autocomplete-text="name"
													autocomplete-height="270px"
													oninput="fn_onInputPrdcrNm(event)"
													style="flex: 3"
													autocomplete-select-callback="fn_onSelectPrdcrNm"
													onkeyenter="fn_srchPrdcr(dtl-inp-prdcrNm)"
											></sbux-input>
											<sbux-input
													uitype="text"
													id="dtl-inp-prdcrIdentno"
													name="dtl-inp-prdcrIdentno"
													class="form-control input-sm"
													maxlength="2"
													autocomplete="off"
													onkeyup="fn_noKeyup"
													style="flex: 1"
													onchange="fn_onChangeSrchPrdcrIdentno(this)"
											></sbux-input>
											<sbux-button
													id="btnSrchPrdcr"
													name="btnSrchPrdcr"
													class="btn btn-xs btn-outline-dark"
													text="찾기"
													uitype="modal"
													target-id="modal-prdcr"
													onclick="fn_choicePrdcr"
											></sbux-button>
										</div>
										<sbux-input
												id="frmhsInfo"
												name="frmhsInfo"
												uitype="text"
												wrap-style="flex:1; margin-right:1vw"
												style="width: 60%"
												readonly
										></sbux-input>
										<div></div>
									</div>
								</td>
								<%--<td class="td_input" style="border-right: hidden;">

								</td>
								<td colspan="12" class="td_input">
                                    <div style="display: flex; gap: 10px">
                                    </div>
								</td>--%>
                            </tr>
							<tr>
								<th scope="row" class="th_bg"><span class="data_required"></span>차량번호</th>
								<td colspan="14" class="td_input">
									<div style="display: flex; gap: 10px">
										<div style="display: flex; gap: 10px; flex-basis: 200px">
											<sbux-input
													uitype="text"
													id="dtl-inp-vhclno"
													name="dtl-inp-vhclno"
													class="form-control input-sm inpt_data_reqed"
													onkeyenter="fn_srchVhclno"
													autocomplete="off"
											></sbux-input>
											<sbux-button
													id="btnSrchVhclno"
													name="btnSrchVhclno"
													class="btn btn-xs btn-outline-dark"
													text="찾기"
													uitype="modal"
													target-id="modal-vhcl"
													onclick="fn_choiceVhcl"
											></sbux-button>
										</div>
										<sbux-input
												id="vhclInfo"
												name="vhclInfo"
												uitype="text"
												wrap-style="flex:1; margin-right:1vw"
												style="width: 60%"
												readonly
										></sbux-input>
										<sbux-input
												id="dtl-inp-drvrNm"
												name="dtl-inp-drvrNm"
												uitype="hidden"
										></sbux-input>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg"><span class="data_required" ></span>전체중량/시간</th>
								<td colspan="4" class="td_input" style="border-right: hidden;">
									<div style="display: flex; gap: 5px">
										<div style="flex-basis: 30%">
											<sbux-input
													uitype="text"
													id="dtl-inp-wholWght"
													name="dtl-inp-wholWght"
													class="form-control input-sm input-sm-ast inpt_data_reqed"
													maxlength="6"
													autocomplete="off"
													mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
													onchange="fn_onChangeWholWght"
											></sbux-input>
										</div>
										<div style="display: flex; align-items: center">
											Kg
										</div>
										<div style="flex-basis:45%; display: flex; align-items: center">
											<sbux-spinner
													id="dtl-inp-wholWghtTime"
													name="dtl-inp-wholWghtTime"
													uitype="normal"
													wrap-style="width: 100%"
													data-type="time"
													time-format="HH:MM"
													time-hours="24hours"
													time-meridiem="none"
											></sbux-spinner>
										</div>
										<div style="display: flex">
											<sbux-button
													id="btnWhol"
													name="btnWhol"
													class="btn btn-xs btn-outline-dark"
													text="측정"
													uitype="normal"
													onclick="fn_whol"
											></sbux-button>
										</div>
									</div>
								</td>
								<th scope="row" class="th_bg"><span class="data_required" ></span>공차중량/시간</th>
								<td class="td_input" colspan="4" style="border-right: hidden;">
									<div style="display: flex; gap: 5px">
										<div style="flex-basis: 30%">
											<sbux-input
													uitype="text"
													id="dtl-inp-emptVhclWght"
													name="dtl-inp-emptVhclWght"
													class="form-control input-sm input-sm-ast inpt_data_reqed"
													maxlength="6"
													autocomplete="off"
													mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
													init = 0
													onchange="fn_onChangeEmptVhclWght"
											></sbux-input>
										</div>
										<div style="display: flex; align-items: center">
											Kg
										</div>
										<div style="flex-basis:45%; display: flex; align-items: center">
											<sbux-spinner
													id="dtl-inp-emptVhclWghtTime"
													name="dtl-inp-emptVhclWghtTime"
													uitype="normal"
													wrap-style="width: 100%"
													data-type="time"
													time-format="HH:MM"
													time-hours="24hours"
													time-meridiem="none"
													init = "00:00"
											></sbux-spinner>
										</div>
										<div style="display: flex">
											<sbux-button
													id="btnEmptVhcl"
													name="btnEmptVhcl"
													class="btn btn-xs btn-outline-dark"
													text="측정"
													uitype="normal"
													onclick="fn_emptVhcl"
											></sbux-button>
										</div>
									</div>
								</td>
								<th scope="row" class="th_bg">실중량</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input
											uitype="text"
											id="dtl-inp-actlWght"
											name="dtl-inp-actlWght"
											class="form-control input-sm"
											mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
											readonly
									></sbux-input>
								</td>
								<td class="td_input" colspan="3">Kg</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg"><span class="data_required" ></span>품목</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-select
											id="dtl-slt-itemCd"
											name="dtl-slt-itemCd"
											uitype="single"
											jsondata-ref="jsonApcItem"
											unselected-text="선택"
											class="form-control input-sm inpt_data_reqed"
											onchange="fn_onChangeSrchItemCd(this)"
									></sbux-select>
								</td>
								<td colspan="3"></td>
								<th scope="row" class="th_bg"><span class="data_required" ></span>계량대/구분</th>
								<td colspan="2" class="td_input" style="border-right: hidden;">
									<sbux-select
											id="dtl-slt-fcltCd"
											name="dtl-slt-fcltCd"
											uitype="single"
											jsondata-ref="jsonComFcltCd"
											unselected-text="선택"
											class="form-control input-sm inpt_data_reqed"
									></sbux-select>
								</td>
								<td colspan="2" class="td_input" style="border-right: hidden;">
									<sbux-select
											id="dtl-slt-wrhsSpmtType"
											name="dtl-slt-wrhsSpmtType"
											uitype="single"
											jsondata-ref="jsonComWrhsSpmtType"
											unselected-text="선택"
											class="form-control input-sm"
											onchange="fn_onChangeWrhsSpmtType(this)"
									></sbux-select>
								</td>
								<th scope="row" class="th_bg">입고 가구/팔레트</th>
								<td class="td_input" style="border-right:hidden;" >
									<sbux-input
											uitype="text"
											id="dtl-inp-bxQntt"
											name="dtl-inp-bxQntt"
											class="form-control input-sm"
											mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
											onchange="fn_onChangeBxQntt(dtl-inp-bxQntt)"
											readonly
									></sbux-input>
								</td>
								<td class="td_input" style="border-right:hidden;" >
									<sbux-input
											uitype="text"
											id="dtl-inp-pltQntt"
											name="dtl-inp-pltQntt"
											class="form-control input-sm"
											mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
											onchange="fn_onChangePltQntt(dtl-inp-pltQntt)"
									></sbux-input>
								</td>
								<td colspan="2"></td>
							</tr>
							<tr>
								<th scope="row" class="th_bg">운임</th>
								<td class="td_input" style="border-right:hidden;" >
									<sbux-input
											uitype="text"
											id="dtl-inp-trsprtCst"
											name="dtl-inp-trsprtCst"
											class="form-control input-sm"
											mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									></sbux-input>
								</td>
								<td colspan="3"></td>
								<th scope="row" class="th_bg">입력자</th>
								<td colspan="4" class="td_input">
									<sbux-input
											uitype="text"
											id="dtl-inp-oprtrNm"
											name="dtl-inp-oprtrNm"
											class="form-control input-sm"
											style="width:80%"
											init = "김복영"
									></sbux-input>
								</td>

								<th scope="row" class="th_bg">타출고처</th>
								<td colspan="4" class="td_input">
									<sbux-input
											uitype="text"
											id="dtl-inp-oinstSpmtNm"
											name="dtl-inp-oinstSpmtNm"
											class="form-control input-sm"
											style="width:80%"
									></sbux-input>
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg">비고</th>
								<td colspan="14" class="td_input">
									<sbux-input
											uitype="text"
											id="dtl-inp-rmrk"
											name="dtl-inp-rmrk"
											class="form-control input-sm"
											style="width: 80%"
									></sbux-input>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div>
					<div id="sb-area-grdVrty" style="width:100%;height:185px;"></div>
					<div id="sb-area-grdVrty2" style="width:100%;height:110px;"></div>
					<div id="sb-area-grdDtBxPlt" style="width:100%;height:260px;"></div>
				</div>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>원물계량 내역</span>
							<span style="font-size:12px">(기준일자 :
								<sbux-label
									id="crtr-ymdFrom"
									name="crtr-ymdFrom"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label> ~
								<sbux-label
										id="crtr-ymdTo"
										name="crtr-ymdTo"
										uitype="normal"
										text=""
										class="bold"
										mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label>
								, 조회건수 <span id="cnt-wgh">0</span>건)
							</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:170px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
			<div id="wsarea">
				<button style="position: absolute; top: 5px; right: 10px" onclick="$('#wsarea').css('display','none');">X</button>
			</div>
		</div>
		<div id="pltBxModal">
			<div id="closeModal">
				<p id="close" onclick="fn_pltBxModal()">&times;</p>
			</div>
			<div id="sb-area-pltBx" style="width: 100%;"></div>
		</div>
		<div id="modal-overlay"></div>
		<div id="warehouseModal">
			<div style="display: flex; flex-direction: column; align-items: stretch;">
				<div id="sb-area-warehouse" style=" width: 100%; height: auto; border: none; min-height: 200px"></div>
				<div style="display: flex; justify-content: center; gap: 10px; margin: 10px; border: none; ">
					<sbux-button
							id="btnCancel"
							name="btnCancel"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_warehouseModal"
							text="취소"
					></sbux-button>
					<sbux-button
							id="btnSetWarehouse"
							name="btnSetWarehouse"
							uitype="normal"
							class="btn btn-sm btn-primary"
							onclick=""
							text="저장"
					></sbux-button>
				</div>
			</div>
		</div>
	</section>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	header-is-close-button="false"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-vhcl"
	        name="modal-vhcl"
	        uitype="middle"
	        header-title="차량 선택"
	        body-html-id="body-modal-vhcl"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

	<!-- 생산작업자 등록 Modal -->
	<div>
		<sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 등록" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:900px"></sbux-modal>
	</div>
	<div id="body-modal-oprtr">
		<jsp:include page="../apc/oprtrMngPopup.jsp"></jsp:include>
	</div>

	<!-- 원물계량연계 Modal -->
	<div>
		<sbux-modal
				id="modal-apcLinkPop"
				name="modal-apcLinkPop"
				uitype="middle"
				header-title="계량연계송신"
				body-html-id="body-modal-apcLinkPop"
				header-is-close-button="false"
				footer-is-close-button="false"
				style="width:800px"
		></sbux-modal>
	</div>
	<div id="body-modal-apcLinkPop">
		<jsp:include page="../../am/popup/apcLinkPopup.jsp"></jsp:include>
	</div>

</body>
<script type="text/javascript">
	let prvRowNum = -1;
	let isSaved = false;
	let chkWghno = "";

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonComGdsSeCd		= [];	// 상품구분 	gdsSeCd		검색
	var jsonGrdCd			= [];	// 원물등급
	var jsonComWrhsSpmtType	= [];	// 입고출고구분 wghSpmtType	검색
	var jsonGrdWrhsSpmtType	= [];	// 입고출고구분 wghSpmtType	그리드
	var jsonComFcltCd		= [];	// 설비 		fcltCd		검색
	var jsonGrdFcltCd		= [];	// 설비 		fcltCd		그리드

    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	/* 차량정보 */
	let getVhclInfo = null;

	var jsonWghSeCd = [];	//계량구분코드

    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회

    /* SBGrid Data (JSON) */
    var jsonWghPrfmnc = [];
    var jsonWghDtlPrfmnc = [];

    /* 팔레트/박스 Data */
	let jsonWrhsPltBx = {
			wrhsPltBxData: [],
			pltQntt: 0,
			pltWght: 0,
			bxQntt: 0,
			bxWght: 0,
			totalQntt: 0,
			totalWght: 0
		}
	/* PltBox Grid */
	var jsonPltBox = [];
	var grdPltBox;
	/* Warehouse Grid */
	var jsonWarehouse = [];
	var grdWarehouse;
	/* DT BxPlt Grid */
	var grdDtBxPlt;
	var jsonDtBxPlt = [];
	/** 검품기준 공통 **/
	var jsonInspList = [];
	var jsonInspCd = [];
	/** 검품등급 비교 */
	var jsonInspCmpr = [];
	/** 팔레트/박스 수량 비교**/
	var jsonPltBoxCmpr = [];

	/**
	 * 비동기 함수 재시도
	 * @param {Function} fn - 실행할 비동기 함수
	 * @param {Number} maxRetries - 최대 재시도 횟수 (기본값: 3)
	 * @param {Number} delay - 재시도 간 지연 시간 밀리초 (기본값: 500)
	 * @returns {Promise} 함수 실행 결과
	 */
	const retryAsync = async (fn, maxRetries = 3, delay = 500) => {
		for (let i = 0; i < maxRetries; i++) {
			try {
				return await fn();
			} catch (error) {
				console.warn('재시도: ', i + 1, '/', maxRetries, '실패: ', error);
				if (i === maxRetries - 1) {
					console.error('최대 재시도 횟수 초과:', error);
					console.log('fn', fn);
					// gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
					throw error;
				}
				await new Promise(resolve => setTimeout(resolve, delay));
			}
		}
	};

	/**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select (각 Promise에 재시도 로직 적용)
		let rst = await Promise.all([
			retryAsync(() => gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 		'WAREHOUSE_SE_CD',	gv_selectedApcCd)),	// 창고
		 	retryAsync(() => gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, 			gv_selectedApcCd)),						// 품목
			retryAsync(() => gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, 			gv_selectedApcCd)),						// 품종
			retryAsync(() => gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,  		'GDS_SE_CD', 		gv_selectedApcCd)), 	// 상품구분 등록
			retryAsync(() => gfn_setComCdSBSelect('dtl-slt-fcltCd',			jsonComFcltCd, 			'WGH_FCLT_CD', 		gv_selectedApcCd)),	// 설비
		 	retryAsync(() => gfn_setComCdSBSelect('dtl-slt-wrhsSpmtType',	jsonComWrhsSpmtType, 	'WRHS_SPMT_TYPE')),	// 입고출고유형
			retryAsync(() => gfn_getComCdDtls('WGH_SE_CD')),	// 입고출고유형

			retryAsync(() => gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", { apcCd: gv_selectedApcCd, grdSeCd: '04', grdKnd: '01' }, null, true))	// 검품등급종류
		]);
		jsonComWarehouse = jsonComWarehouse.filter(i => i.useYn == "Y");
		jsonComWarehouse.unshift({
			label: "",
			mastervalue: "",
			text: "",
			useYn: "",
			value: "",
		});

		/** sn 순서보장 **/
		jsonApcVrty = jsonApcVrty.sort((a, b) => a.sn - b.sn);
		SBUxMethod.refresh('dtl-slt-vrtyCd');

		jsonWghSeCd = rst[6];
		jsonInspList = rst[7];

		jsonComWrhsSpmtType = jsonComWrhsSpmtType.filter(item => item.value !== 'TF');
		jsonGrdWrhsSpmtType = jsonGrdWrhsSpmtType.filter(item => item.value !== 'TF');

		SBUxMethod.set('dtl-rdo-gdsSeCd', '1');

		SBUxMethod.refresh('dtl-slt-wrhsSpmtType');

		if (jsonApcItem.length > 0) {
			let itemCd = jsonApcItem[0].itemCd;
			jsonApcVrty = jsonApcVrty.filter(e => e.itemCd === itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("dtl-slt-itemCd", itemCd);
		}

		if (gv_selectedApcCd == '0669') {
			SBUxMethod.set('dtl-slt-wrhsSpmtType', 'RT');
		}

		/** 계량일자 **/
		SBUxMethod.hide('dtl-dtp-wghYmdTo');
		SBUxMethod.attr('chkbox_dayCrtr','checked',true);
		SBUxMethod.set('dtl-dtp-wghYmdFrom', gfn_dateToYmd(new Date()));
		SBUxMethod.set('dtl-dtp-wghYmdTo', gfn_dateToYmd(new Date()));

	}

	window.addEventListener('DOMContentLoaded',async function(e) {
		SBUxMethod.openProgress(gv_loadingOptions);
		try {
			await fn_init();
			await fn_search();
		} catch (error) {
			console.error("초기화 중 오류 발생:", error);
			gfn_comAlert("E0001"); // 오류가 발생하였습니다.
		} finally {
			SBUxMethod.closeProgress(gv_loadingOptions);
		}
	});
	const getCookie = (name) => {
		const cookieString = `; ${'${document.cookie}'}`;
		const parts = cookieString.split(`; ${'${name}'}=`);
		if (parts.length === 2) {
			return parts[1].split(';')[0];
		}
		return null;
	};

	const fn_init = async function() {
		//fn_reset();
		await fn_createWghPrfmncGrid();
		await fn_initSBSelect();
		await fn_getPrdcrs();
		/** 팔레트 박스 select **/
		await fn_createPltBxGrid();
		await fn_selectPltBxList();
		await fn_modalDrag();
		/** cookie Set **/
		let addr = gfn_getCookie('addr');
		let itemCd = gfn_getCookie('itemCd');
		if(!gfn_isEmpty(addr)){
			SBUxMethod.set("dtl-slt-fcltCd",addr.toString());
		}
		if(!gfn_isEmpty(itemCd)){
			SBUxMethod.set("dtl-slt-itemCd",itemCd.toString());
			SBUxMethod.dispatch('dtl-slt-itemCd', 'onchange');
		}

		// WebSocket 초기화 (비동기 non-blocking)
		// 페이지 로드를 차단하지 않도록 백그라운드에서 실행
		setTimeout(() => {
			try {
				ws.init();
			} catch (error) {
				console.warn("WebSocket 초기화 실패:", error);
			}
		}, 0);

		/** report 버튼 활성화 */
		// SBUxMethod.attr("btnDocRawMtrWghV1", "disabled", "false");
		// SBUxMethod.attr("btnDocBxPltSpmt", "disabled", "true");

		/** addRow 대체 **/
		// await fn_addRow();
	}

	const fn_selectPltBxList = async function(){
		const postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxMngList.do", {
			apcCd: gv_selectedApcCd,
		}, null, true);

		const data = await postJsonPromise;
		const cleanedArray = data.resultList.map(obj => {
			// 객체의 모든 키를 순회
			Object.keys(obj).forEach(key => {
				// 값이 null, 0, undefined인 경우 키 삭제
				if (obj[key] === null || obj[key] === 0 || obj[key] === undefined) {
					delete obj[key];
				}
			});
			return obj;
		});

		let pltList = cleanedArray.filter(item => item.pltBxSeCd === "P");
		let boxList = cleanedArray.filter(item => item.pltBxSeCd === "B");
		const maxLength = Math.max(pltList.length, boxList.length);
		/** modal grid size **/
		$("#sb-area-pltBx").css("height",(maxLength * 60) + 40 + 'px');

		const merged = Array.from({ length: maxLength }, (_, i) => {
			const wrhs = {
				type: '입고',
				...Object.fromEntries(Object.entries(pltList[i] || {}).map(([k, v]) => [`P${'${k}'}`, v])),
				...Object.fromEntries(Object.entries(boxList[i] || {}).map(([k, v]) => [`B${'${k}'}`, v])),
			};

			const spmt = {
				type: '출고',
				...Object.fromEntries(Object.entries(pltList[i] || {}).map(([k, v]) => [`P${'${k}'}`, v])),
				...Object.fromEntries(Object.entries(boxList[i] || {}).map(([k, v]) => [`B${'${k}'}`, v])),
			}
			return [wrhs,spmt];
		}).flat().sort((a, b) => {
			if (a.type !== b.type) {
				return a.type === '입고' ? -1 : 1;
			}
			// 속성개수기준
			// return Object.keys(b).length - Object.keys(a).length;
		});


		jsonPltBox = merged;
		jsonPltBox.forEach(function(item){
			item.Bqntt = '';
			item.Pqntt = '';
			item.Bsn = 0;
			item.Psn = 0;
			item.rmrk = '';
		});
		grdPltBox.rebuild();

		merged.forEach(function(item) {
			if(item.type === '출고') {
				item.Bqntt = '';
				item.Pqntt = '';
				item.Bsn = 0;
				item.Psn = 0;
				item.rmrk = '';

				jsonDtBxPlt.push(item);
			}
		});
		grdDtBxPlt.rebuild();
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	var grdVrty;
	var jsonVrty = [];
	/** 검품 등급 grid **/
	var grdInsp;
	var jsonInsp = [];

	const fn_createWghPrfmncGrid = function() {
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.total = {
      		  type 		: 'grand',
      		  position	: 'bottom',
      		  columns		: {
      		      standard : [1,2],
				  sum : [8, 9, 10, 12, 13],
      		  },
      		  grandtotalrow : {
      		      titlecol 	: 1,
      		      titlevalue	: '합계',
      		      style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
      		      stylestartcol	: 1
      		  },
      		  datasorting	: true,
      		  usedecimal : false,
      		};
        SBGridProperties.columns = [
			{caption: ['순번'], 		ref: 'wghnoSn', 		width: '40px', type:'output',  	style:'text-align:center;'},
			{caption: ['계량대'], 		ref: 'fcltNm', 		width: '80px', type:'output',  	style:'text-align:center;'},
            {caption: ['구분'], 		ref: 'wrhsSpmtTypeNm', width: '60px', type:'output',  	style:'text-align:center'},
            {caption: ['입고일자'], 	ref: 'wghYmd', 		width: '80px', type : 'output', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  	style:'text-align:center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '80px', type: 'output', style:'text-align:center;', typeinfo : {max : 9}},
            {caption: ['생산자'], 		ref: 'prdcrNm', 	width: '120px', type:'output',  	style:'text-align:center'},
            {caption: ['품목'], 		ref: 'itemNm', 		width: '80px', type:'output',  	style:'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '200px', type:'output',  	style:'text-align:center'},
            {caption: ['실중량'], 		ref: 'actlWght', 	width: '70px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['입고가구'], 	ref: 'bxQntt', 		width: '60px', type: 'output', style:'text-align:right;', format : {type:'number', rule:'#,### '}},
            {caption: ['입고팔레트'], 	ref: 'pltQntt', 	width: '70px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['타출고처'], 	ref: 'oinstSpmtNm', width: '70px', type: 'output', style:'text-align:right'},
            {caption: ['출고가구'], 	ref: 'shpgotQntt', 	width: '60px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['출고팔레트'], 	ref: 'shpgotPltQntt', 	width: '70px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['기사명'], 		ref: 'drvrNm', 		width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['연락처'], 		ref: 'telno', 		width: '100px', type: 'output', style:'text-align:center', typeinfo : {max : 11}},
            {caption: ['작업자'], 		ref: 'oprtrNm', 	width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'output', style:'text-align:left'},
		];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
        grdWghPrfmnc.bind('click', 'fn_view');
    }


	const fn_view = async function (param) {

		SBUxMethod.openProgress(gv_loadingOptionsSub);

		let nRow = grdWghPrfmnc.getRow();

		if (param > 0) {
			nRow = param;
		}

		if (nRow < 1) {
			return;
		}

		let rowData = grdWghPrfmnc.getRowData(nRow);
		let wrhsSpmtType = SBUxMethod.get('dtl-slt-itemCd') === "dtPlt" ? "DT" : rowData.wrhsSpmtType;
		let itemCd = SBUxMethod.get('dtl-slt-itemCd') === "dtPlt" || gfn_isEmpty(rowData.itemCd) ? "dtPlt" : rowData.itemCd;

		SBUxMethod.set('dtl-dtp-wghYmdFrom', rowData.wghYmd);
      	SBUxMethod.set('dtl-inp-wghno', rowData.wghno);
 		SBUxMethod.set('dtl-inp-prdcrCd', rowData.prdcrCd);
 		SBUxMethod.set('dtl-inp-prdcrNm', rowData.prdcrNm);
 		SBUxMethod.set('dtl-inp-vhclno', rowData.vhclno);
 		SBUxMethod.set('dtl-inp-wholWght', rowData.wholWght);
 		SBUxMethod.set('dtl-inp-emptVhclWght', rowData.emptVhclWght);
 		SBUxMethod.set('dtl-inp-actlWght', rowData.actlWght);
 		SBUxMethod.set('dtl-slt-itemCd', itemCd);
 		SBUxMethod.set('dtl-slt-fcltCd', rowData.fcltCd);
 		SBUxMethod.set('dtl-slt-wrhsSpmtType', wrhsSpmtType);
 		SBUxMethod.set('dtl-inp-bxQntt', rowData.bxQntt);
 		SBUxMethod.set('dtl-inp-pltQntt', rowData.pltQntt);
 		SBUxMethod.set('dtl-inp-trsprtCst', rowData.trsprtCst || "");
 		SBUxMethod.set('dtl-inp-rmrk', rowData.rmrk || "") ;
 		SBUxMethod.set('dtl-inp-oinstSpmtNm', rowData.oinstSpmtNm || "");
 		SBUxMethod.set('dtl-inp-shpgotQntt', rowData.shpgotQntt || "");
 		SBUxMethod.set('dtl-inp-shpgotPltQntt', rowData.shpgotPltQntt || "");
 		SBUxMethod.set('dtl-inp-oprtrNm', rowData.oprtrNm || "");

		if (wrhsSpmtType ==="DT") {
			SBUxMethod.set('dtl-inp-bxQntt', rowData.shpgotQntt);
			SBUxMethod.set('dtl-inp-pltQntt', rowData.shpgotPltQntt);
		}


		await fn_onChangeWrhsSpmtType();
		await fn_onChangeSrchItemCd({value: itemCd});

		/** 생산자 정보, 기사정보 set */
		await fn_onSelectPrdcrNm(rowData.prdcrCd);
		await popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, rowData.vhclno);
		SBUxMethod.openModal('modal-vhcl');
		if(grdVhclPop.getRows() == 2){
			grdVhclPop.setRow(1);
			popVhcl.choice();
		}

 		if (rowData.wrhsSpmtType == "RT") {
 			url = "/am/wgh/selectWghRcptWrhsDtlList.do"
 		}
 		if (rowData.wrhsSpmtType == "DT") {
 			url = "/am/wgh/selectWghRcptSpmtDtlList.do"
 		}

		/** 거산 vrtyCd 전체 목록을 불러와서 보내주면 결과값 안나옴 **/
		if (wrhsSpmtType == "DT") {
			rowData.vrtyCd = "";
		}
		const postJsonPromise = gfn_postJSON(url, rowData, null, true);

  		try {
  			const data = await postJsonPromise;
	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

      		jsonVrty.length = 0;
      		jsonWghDtlPrfmnc.length = 0;

			let warehouseSeCdCol = grdVrty.getColRef("warehouseSeCd")

          	data.resultList.forEach((item, index) => {

          		let vrtyCd = item.vrtyCd
          		let vrtyCdCol = grdVrty.getColRef(vrtyCd);

          		for (var i=1; i<=jsonGrdCd.length; i++) {

          			let grdCdKey = "grdCd" + i;
          			let grdQnttKey = "grdQntt" + i;
          			let grdCd = item[grdCdKey];
					let warehouseSeCdKey = "warehouseSeCd" + i;
					let prevWarehouseSeCd = grdVrty.getCellData(i, warehouseSeCdCol);

         			grdVrty.setCellData(i, vrtyCdCol, item[grdQnttKey], true);

					if (gfn_isEmpty(prevWarehouseSeCd) && !gfn_isEmpty(item[warehouseSeCdKey])) {
						grdVrty.setCellData(i, warehouseSeCdCol, item[warehouseSeCdKey], true);
					}
          		}

          		jsonWghDtlPrfmnc.push(item);
  			});

          	let grdCdCol = grdVrty.getColRef("grdCd");

          	for (var j=0; j<jsonGrdCd.length; j++) {

	          	grdVrty.setCellData(j+1, grdCdCol, jsonGrdCd[j].grdCd, true);
          	}
          	grdVrty.rebuild();

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}

		const postJsonPromiseForInsp = gfn_postJSON("/am/wgh/selectWghInspPrfmncList.do",{apcCd: gv_selectedApcCd, wghno: rowData.wghno, itemCd: rowData.itemCd}, null, true);
		const dataForInsp = await postJsonPromiseForInsp;
		if (!_.isEqual("S", dataForInsp.resultStatus)) {
			gfn_comAlert(dataForInsp.resultCode, dataForInsp.resultMessage);
			return;
		}

		jsonInsp.length = 0;
		jsonInspCd.forEach(item => grdInsp.addRow(true, {'grdCd' : item.grdCd}));

		dataForInsp.resultList.forEach(function(item){
			let grdCd = item.grdCd;
			let grdVl = item.grdVl;
			let vrtyCd = item.vrtyCd;
			jsonInsp.forEach((item) => {
				if(item.grdCd === grdCd){
					item[vrtyCd] = grdVl;
				}
			});
		});
		grdInsp.rebuild();
		grdInsp.removeColumn();	// 검품 grid 저장창고컬럼 삭제

		// 검품등급 deep copy
		jsonInspCmpr.length = 0;
		jsonInspCmpr = JSON.parse(JSON.stringify(jsonInsp));

		const postJsonPromiseForPlt = gfn_postJSON("/am/cmns/selectPltWrhsSpmtList.do",{apcCd: gv_selectedApcCd, prcsNo: rowData.wghno}, null, true);
		const dataForPlt = await postJsonPromiseForPlt;
		if (!_.isEqual("S", dataForPlt.resultStatus)) {
			gfn_comAlert(dataForPlt.resultCode, dataForPlt.resultMessage);
			return;
		}
		// 팔레트/박스 데이터 초기화 함수
		const resetPltBxData = (item) => {
			item.Bqntt = '';
			item.Pqntt = '';
			item.Bsn = 0;
			item.Psn = 0;
			item.rmrk = '';
		};

		jsonPltBox.forEach(resetPltBxData);
		jsonDtBxPlt.forEach(resetPltBxData);

		dataForPlt.resultList.forEach(function(item){
			let prefix = item.pltBxSeCd;
			let pltBxCd = item.pltBxCd;
			let filterTxt = item.wrhsSpmtSeNm;
			let qntt = item.qntt;
			let rmrk = item.rmrk;
			jsonPltBox.forEach(function(plt){
				if(plt.type === filterTxt){
					let keyNm = prefix + 'pltBxCd';
					if(plt[keyNm] === pltBxCd){
						plt[prefix + 'qntt'] = qntt;
						plt[prefix + 'sn'] = item.sn;
						plt.rmrk = rmrk;
						plt.jobYmd = item.jobYmd;
						plt.prcsNo = item.prcsNo;
						plt.prdcrCd = item.prdcrCd;
					}
				}
			});
		});

		jsonDtBxPlt = jsonPltBox.filter(i => i.type === '출고');

		jsonPltBoxCmpr.length = 0;
		let jsonPltBoxCmprTemp = JSON.parse(JSON.stringify(jsonPltBox.filter(i => i.Bqntt !== "" || i.Pqntt !== "")));
		jsonPltBoxCmprTemp.forEach(function(item){
			if(item.Bqntt > 0){
				jsonPltBoxCmpr.push({
					apcCd : gv_selectedApcCd,
					jobYmd : item.jobYmd,
					wrhsSpmtSeCd : item.type === '입고'? '1' : '2',
					pltBxSeCd : 'B',
					pltBxCd : item.BpltBxCd,
					prdcrCd : item.prdcrCd,
					qntt : parseInt(item.Bqntt),
					unitWght : parseFloat(item.BunitWght),
					sn : item.Bsn,
					rmrk: item.rmrk,
					prcsNo: rowData.wghno
				})
			}
			if(item.Pqntt > 0){
				jsonPltBoxCmpr.push({
					apcCd : gv_selectedApcCd,
					jobYmd : item.jobYmd,
					wrhsSpmtSeCd : item.type === '입고'? '1' : '2',
					pltBxSeCd : 'P',
					pltBxCd : item.PpltBxCd,
					prdcrCd : item.prdcrCd,
					qntt : parseInt(item.Pqntt),
					unitWght : parseInt(item.PunitWght),
					sn : item.Psn,
					rmrk: item.rmrk,
					prcsNo: rowData.wghno
				})
			}
		});
		grdPltBox.rebuild();
		grdDtBxPlt.rebuild();

		/** 계량이력 시간 **/
		const postJsonPromiseHstry = gfn_postJSON("/am/wgh/selectWghHstryList.do",{apcCd : gv_selectedApcCd, wghno : rowData.wghno}, null, true);
		const data = await postJsonPromiseHstry;

		if (!_.isEqual("S", data.resultStatus)) {
		        gfn_comAlert(data.resultCode, data.resultMessage);
		        return;
		}

		data.resultList.forEach(function(item,idx){
			let time = fn_formatTime(item.wghDt);
			if(idx == 0){
				SBUxMethod.set("dtl-inp-wholWghtTime", time);
			}else{
				SBUxMethod.set("dtl-inp-emptVhclWghtTime", time);
			}
		});

		SBUxMethod.closeProgress(gv_loadingOptionsSub);
	}
	const fn_formatTime = function(_date){
		const dateStr = _date;
		const date = new Date(dateStr.replace(" ", "T"));

		const hours = String(date.getHours()).padStart(2, '0');
		const minutes = String(date.getMinutes()).padStart(2, '0');

		const result = hours + minutes;
		return result;
	}

	/**
     * @name fn_docRawMtrWgh
     * @description 계량확인서 발행 버튼
     */
	const fn_docRawMtrWgh = function(obj) {

		let rptUrl = obj.id === "btnDocRawMtrWghV1" ? "am/rawMtrWghDocV1_0669.crf" : "am/rawMtrWghDocV2_0669.crf";

		let rowIdx = grdWghPrfmnc.getRow();

		if(rowIdx < 0 ){
	 		gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return ;
		}
		let rowData = grdWghPrfmnc.getRowData(rowIdx);

		let reportVo = {
			APC_CD : gv_selectedApcCd,
			ITEM_CD : rowData.itemCd,
			WGHNO : rowData.wghno,
			JOB_YMD : rowData.wghYmd
		}

		gfn_popClipReport("계량확인서", rptUrl, reportVo);
	}

	/**
	 * @name fn_docBxPltSpmt
	 * @description 출과확인증 발행 버튼
	 */
	const fn_docBxPltSpmt = function() {

		const wghnoList = [];

		let rowIdx = grdWghPrfmnc.getRow();

		if(rowIdx < 0 ){
			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return ;
		}

        /** SQL **/
        let rowData = grdWghPrfmnc.getRowData(rowIdx);

        let reportVo = {
            APC_CD : gv_selectedApcCd,
            WGHNO : rowData.wghno,
            JOB_YMD : rowData.wghYmd
        }

        gfn_popClipReport("출고확인증", "am/rawMtrWghPltSpmtDoc_0669.crf", reportVo);

        /** json **/
		/*let rowData = grdWghPrfmnc.getRowData(rowIdx);
		let prdcr = _.find(jsonPrdcr, {prdcrCd: rowData.prdcrCd});

		let jsonData = [];
		rowData.abbrNm = prdcr.abbrNm;
		rowData.frmhsNm = prdcr.frmhsNm;
		rowData.prdcrTelno = prdcr.telno;
		rowData.frmhsAddr = prdcr.frmhsAddr;

		if(getVhclInfo && getVhclInfo.rmrk) {
			const rmrkArr = getVhclInfo.rmrk.split('|');
			rowData.bankNm = rmrkArr[0] || '';
			rowData.actNo = rmrkArr[1] || '';
			rowData.dpstrNm = rmrkArr[2] || '';
			rowData.drivrTelno = rmrkArr[3] || '';
		}

		jsonData.push(rowData);

		let pltVO = {};
		let dtBxPltData = grdDtBxPlt.getGridDataAll();
		dtBxPltData.forEach((item, idx) => {
			pltVO["bxNm" + idx] = item.BpltBxNm || "",
			pltVO["bxQntt" + idx] = item.Bqntt || "",
			pltVO["pltNm" + idx] = item.PpltBxNm || "",
			pltVO["pltQntt" + idx] = item.Pqntt || ""
		});

		let rstlData = {
			"jsonData": jsonData,
			"pltData": [pltVO]
		}

		let conn = [];

		conn.push(
				{
					data: {
						"root": [rstlData]
					}
				}
		);

		gfn_popClipReportPost("출고확인증", "am/rawMtrWghPltSpmtDoc_0669.crf",null, conn);*/
	}

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
		/** 팔레트 불출 초기화 **/
		jsonPltBox.forEach(function(item){
			item.Bqntt = '';
			item.Pqntt = '';
			item.Bsn = 0;
			item.Psn = 0;
			item.rmrk = '';
		});
		grdPltBox.rebuild();
		jsonDtBxPlt.forEach(function(item){
			item.Bqntt = '';
			item.Pqntt = '';
			item.Bsn = 0;
			item.Psn = 0;
			item.rmrk = '';
		});
		grdDtBxPlt.rebuild();
		// fn_init();
	}

	/** ui event */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_init();
	}

	/**
	 * @name fn_clearForm
	 * @description 입력 폼 초기화
	 */
	 const fn_clearForm = function () {
		SBUxMethod.set('dtl-inp-wghno', '');
		SBUxMethod.set('dtl-dtp-wghYmdFrom', gfn_dateToYmd(new Date()));
  		SBUxMethod.set('dtl-inp-prdcrCd', '');
  		SBUxMethod.set('dtl-inp-prdcrNm', '');
  		SBUxMethod.set('dtl-inp-vhclno', '');
  		SBUxMethod.set('dtl-inp-wholWght', 0);
  		SBUxMethod.set('dtl-inp-emptVhclWght', 0);
  		SBUxMethod.set('dtl-inp-actlWght', 0);
  		SBUxMethod.set('dtl-inp-wholWghtTime', '');
  		SBUxMethod.set('dtl-inp-emptVhclWghtTime', '0000');


  		if (jsonApcItem.length == 1) {
			fn_onChangeSrchItemCd({value: jsonApcItem[0].itemCd});
			SBUxMethod.set("dtl-slt-itemCd", jsonApcItem[0].itemCd);
		} else {
			SBUxMethod.set('dtl-slt-itemCd', '');
		}

  		SBUxMethod.set('dtl-slt-fcltCd', '');
  		SBUxMethod.set('dtl-slt-wrhsSpmtType', '');
  		SBUxMethod.set('dtl-inp-bxQntt', 0);
  		SBUxMethod.set('dtl-inp-pltQntt', 0);
  		SBUxMethod.set('dtl-inp-trsprtCst', '');
  		SBUxMethod.set('dtl-inp-rmrk', '');
  		SBUxMethod.set('dtl-inp-oinstSpmtNm', '')
  		SBUxMethod.set('dtl-inp-shpgotQntt', 0)
  		SBUxMethod.set('dtl-inp-shpgotPltQntt', 0);
  		SBUxMethod.set('dtl-inp-oprtrNm', '김복영');

		SBUxMethod.set('frmhsInfo', '');
		SBUxMethod.set('vhclInfo', '');

		/** grid reset **/
		jsonVrty.filter(i => i.grdCd !== '합계').forEach(item =>
				Object.keys(item).forEach(k =>
						!['apcCd', 'grdCd', 'warehouseSeCd'].includes(k) && (item[k] = "")
				)
		);
		jsonInsp.forEach(item =>
				Object.keys(item).forEach(k =>
						!['apcCd', 'grdCd'].includes(k) && (item[k] = "")
				)
		);

		/** jsonDelList reset */
		jsonInspCmpr = [];
		jsonPltBoxCmpr = [];

		grdVrty.rebuild();
		grdInsp.rebuild();
		grdInsp.removeColumn();	// 검품 grid 저장창고컬럼 삭제

	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		SBUxMethod.set('dtl-slt-itemCd', itemCd);

		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			gfn_setApcGdsGrdSBSelect('grdVrty', jsonGrdCd, gv_selectedApcCd, itemCd, "01"),	// 등급
		]);
		/** sn 순서보장 **/
		jsonApcVrty = jsonApcVrty.sort((a, b) => a.sn - b.sn);
		SBUxMethod.refresh('dtl-slt-vrtyCd');
		jsonApcVrty = jsonApcVrty.filter(item => item.useYn === 'Y');
		jsonVrty.length = 0;

		if (!gfn_isEmpty(itemCd)) {
			var SBGridProperties = {};
			SBGridProperties.parentid = 'sb-area-grdVrty';
			SBGridProperties.id = 'grdVrty';
			SBGridProperties.jsonref = 'jsonVrty';
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'free';
			SBGridProperties.oneclickedit = true;
			// SBGridProperties.mergecells = 'bycolrec';
			SBGridProperties.datamergefalseskip = true;

			/** total cnt **/
			let sum = Array.from({length: jsonApcVrty.length}, (_ = 1, i) => i + _);
			let columns = [{
				caption: ['등급'],
				ref: 'grdCd',
				width: '80px',
				type: 'combo',
				style: 'text-align:center',
				typeinfo: {ref: 'jsonGrdCd', displayui: false, itemcount: 10, label: 'label', value: 'value'},
				merge: false
			},];

			for (var i = 0; i < jsonApcVrty.length; i++) {
				columns.push(
						{
							caption: [jsonApcVrty[i].vrtyNm],
							ref: jsonApcVrty[i].vrtyCd,
							width: '100px',
							datatype: 'number',
							type: 'input',
							style: 'text-align:right',
							format: {type: 'number', rule: '###.## '},
							merge: false
						},
				);
			}

			/** 저장창고컬럼 추가 **/
			columns.push(
					{caption: ["apc코드"], ref: 'apcCd', type: 'output', hidden: true},
					{
						caption: ["저장창고"],
						ref: 'warehouseSeCd',
						type: 'combo',
						width: '100px',
						style: 'text-align:center',
						typeinfo: {
							ref: 'jsonComWarehouse',
							label: 'label',
							value: 'value',
							oneclickedit: true,
							displayui: true
						}
					}
			);

			/** total 추가 **/
			SBGridProperties.total = {
				type: 'grand',
				position: 'bottom',
				columns: {
					standard: [0],
					sum: sum,
				},
				grandtotalrow: {
					titlecol: 0,
					titlevalue: '합계',
					style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
					stylestartcol: 0
				},
			}

			SBGridProperties.columns = columns;

			grdVrty = await _SBGrid.create(SBGridProperties);
			delete SBGridProperties.total;
			grdVrty.bind('valuechanged', 'fn_grdQnttChanged');
			await fn_addRow();
			/** 검품 등급종류 set **/
			jsonInspCd.length = 0;
			if (jsonInspList.resultStatus !== 'S') {
				let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {
					apcCd: gv_selectedApcCd,
					itemCd: itemCd,
					grdSeCd: '04',
					grdKnd: '01'
				}, null, true);
				let data = await postJsonPromise;
				if (data.resultStatus === 'S') {
					jsonInspCd = data.resultList.map(item => {
						item.label = item.grdNm;
						item.value = item.grdCd;
						return item;
					});
				}
			} else {
				jsonInspCd = jsonInspList.resultList.filter(e => e.itemCd === itemCd).map(item => {
					item.label = item.grdNm;
					item.value = item.grdCd;
					return item;
				});
			}

			/** 검품 grid 재사용 **/
			jsonInsp.length = 0;

			var SBGridProperties2 = JSON.parse(JSON.stringify(SBGridProperties));
			SBGridProperties2.id = 'grdInsp';
			SBGridProperties2.parentid = 'sb-area-grdVrty2';
			SBGridProperties2.jsonref = 'jsonInsp';
			SBGridProperties2.columns[0].typeinfo.ref = 'jsonInspCd';
			SBGridProperties2.columns[0].caption = ['검품'];

			for (var i = 1; i <= jsonApcVrty.length; i++) {
				SBGridProperties2.columns[i] = {
					caption: [jsonApcVrty[i-1].vrtyNm],
					ref: jsonApcVrty[i-1].vrtyCd,
					width: '100px',
					type: 'input',
					validate : gfn_chkByte.bind({byteLimit: 20}),
					style: 'text-align:right',
					merge: false
				};

			}

			grdInsp = _SBGrid.create(SBGridProperties2);
			grdInsp.removeColumn();	// 검품 grid 저장창고컬럼 삭제
			jsonInspCd.forEach(item => grdInsp.addRow(true, {'grdCd': item.grdCd}));
			grdInsp.refresh();
		}

		let wghno = SBUxMethod.get('dtl-inp-wghno');

		if (gfn_isEmpty(wghno) && jsonDtBxPlt.length > 0) {
			jsonDtBxPlt.forEach(item => {
				item.Bqntt = '';
				item.Pqntt = '';
				item.Bsn = 0;
				item.Psn = 0;
				item.rmrk = '';
			});
			grdDtBxPlt.rebuild();
		}

		/** 25.10.13 출고 기능 추가 */
				// 'Vrty' 영역 표시
		const showVrtyArea = () => {
					SBUxMethod.attr("btnPltBx", "disabled", "false");
					$('#sb-area-grdVrty, #sb-area-grdVrty2').css('display', 'block');
					$('#sb-area-grdDtBxPlt').css('display', 'none');
				};

		// 가구/팔레트 출고 시
		const showDtBxPltArea = () => {
			SBUxMethod.attr("btnPltBx", "disabled", "true");
			$('#sb-area-grdVrty, #sb-area-grdVrty2').css('display', 'none');
			$('#sb-area-grdDtBxPlt').css('display', 'block');
		};

		let wrhsSpmtType = SBUxMethod.get("dtl-slt-wrhsSpmtType");	// 입고출고유형

		// 입/출고시 그리드 영역 표시
		if (wrhsSpmtType === "DT") {
			if (itemCd === "dtPlt") {
				showDtBxPltArea();
			} else {
				// grdVrty.removeColumn(); // 저장창고 컬럼 삭제
				showVrtyArea();
			}
		} else {
			showVrtyArea();
		}

		/** 그리드 높이 설정 */
		let grdVrtyHeight = parseInt(grdVrty.getDataRowHeight()) * parseInt(jsonVrty.length) + 35;
		$('#sb-area-grdVrty').height(grdVrtyHeight > 185 ? grdVrtyHeight : 185);

		let grdInspHeight = parseInt(grdInsp.getDataRowHeight()) * parseInt(jsonInsp.length) + 35;
		$('#sb-area-grdVrty2').height(grdInspHeight > 110 ? grdInspHeight : 110);

		if (jsonDtBxPlt.length > 0) {
			let grdDtBxPltHeight = parseInt(grdDtBxPlt.getDataRowHeight()) * parseInt(jsonDtBxPlt.length) + 35;
			$('#sb-area-grdDtBxPlt').height(grdDtBxPltHeight > 260 ? grdDtBxPltHeight : 260);
		}
	}

	/**
	 * @name fn_onChangeWrhsSpmtType
	 * @description 계량대/구분 선택 변경 event
	 */
	const fn_onChangeWrhsSpmtType = async function(obj) {

		/** 25.09.30 출고 변경 이벤트 추가 */
		const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
		let wrhsSpmtType = SBUxMethod.get("dtl-slt-wrhsSpmtType");	// 입고출고유형
		let captionInfo = grdWghPrfmnc.getCaption('array')[0];

		const $targetWholWght = $('th.th_bg:contains("전체중량/시간")');
		const $targetEmptVhcl = $('th.th_bg:contains("공차중량/시간")');
		// 재생성할 span 태그
		const requiredSpan = '<span class="data_required"></span>';

		if (wrhsSpmtType == "RT") {
			// 버튼 상태 설정
			// SBUxMethod.attr("btnDocRawMtrWghV1", "disabled", "false");
			// SBUxMethod.attr("btnDocBxPltSpmt", "disabled", "true");

			// 필수값 확인
			SBUxMethod.attr("dtl-inp-wholWght", "class", "form-control input-sm input-sm-ast inpt_data_reqed");
			SBUxMethod.attr("dtl-inp-emptVhclWght", "class", "form-control input-sm input-sm-ast inpt_data_reqed");

			// <span> 태그가 없으면 맨 앞에 재생성
			if ($targetWholWght.find('span.data_required').length === 0) {
				$targetWholWght.prepend(requiredSpan);
			}
			if ($targetEmptVhcl.find('span.data_required').length === 0) {
				$targetEmptVhcl.prepend(requiredSpan);
			}

			// 텍스트 변경
			$('th.th_bg:contains("출고 가구/팔레트")').text("입고 가구/팔레트");
			$('th.th_bg:contains("출고일자")').text("계량일자");
			$('.ad_tbl_top .ad_tbl_count li span:first-child').text("원물계량 내역");

			// 그리드 캡션 변경
			const targetIndex = captionInfo.indexOf("출고일자");

			if (targetIndex !== -1) {
				captionInfo[targetIndex] = "입고일자";
			}
			let caption = captionInfo.map(e => [e]);

			grdWghPrfmnc.setCaption(caption);

			// 가구/팔레트 제거
			jsonApcItem = jsonApcItem.filter(e => e.value !== "dtPlt");

		} else if (wrhsSpmtType == "DT") {
			// 버튼 상태 설정
			// SBUxMethod.attr("btnDocRawMtrWghV1", "disabled", "true");
			// SBUxMethod.attr("btnDocBxPltSpmt", "disabled", "false");

			// 필수값 확인
			SBUxMethod.attr("dtl-inp-wholWght", "class", "form-control input-sm input-sm-ast");
			SBUxMethod.attr("dtl-inp-emptVhclWght", "class", "form-control input-sm input-sm-ast");

			// span 태그 제거
			$targetWholWght.find('span.data_required').remove();
			$targetEmptVhcl.find('span.data_required').remove();

			// 텍스트 변경
			$('th.th_bg:contains("입고 가구/팔레트")').text("출고 가구/팔레트");
			$('th.th_bg:contains("계량일자")').text("출고일자");
			$('.ad_tbl_top .ad_tbl_count li span:first-child').text("출고 내역");

			// 그리드 캡션 변경
			const targetIndex = captionInfo.indexOf("입고일자");

			if (targetIndex !== -1) {
				captionInfo[targetIndex] = "출고일자";
			}
			let caption = captionInfo.map(e => [e]);

			grdWghPrfmnc.setCaption(caption);

			// 출고시 가구/팔레트 제거 후 combo 추가 (출고 > 선택 > 출고 시 중복)
			jsonApcItem = jsonApcItem.filter(e => e.value !== "dtPlt");
			jsonApcItem.push({
				text: "가구/팔레트",
				value: "dtPlt"
			});
		}

		SBUxMethod.refresh("dtl-slt-itemCd");
		SBUxMethod.set("dtl-slt-itemCd", prvItemCd);
		await fn_onChangeSrchItemCd({value: prvItemCd});
	}

	/**
	 * @name fn_onChangeBxQntt
	 * @description 입고(출고) 가구/팔레트 event
	 */
	const fn_onChangeBxQntt = async function(value) {
		/** 25.10.24 팔레트불출관리 - APC(0001) 수량 추가 (일단 입고만)*/
		let wrhsSpmtType = SBUxMethod.get("dtl-slt-wrhsSpmtType") == "RT" ? "입고" : "출고";
		let defaultWrhs = '거산APC';
		let defaultSpmt = SBUxMethod.get("dtl-inp-prdcrNm") || '';
		let setRmrk = wrhsSpmtType == "입고" ? defaultWrhs : defaultSpmt;

		jsonPltBox.forEach(item => {
			if (item.type == wrhsSpmtType && item.BpltBxCd == "0001") {
				item.Bqntt = value;
				item.rmrk = gfn_isEmpty(item.rmrk) ? setRmrk : item.rmrk;
			}
		});
		grdPltBox.refresh();
	}

	/**
	 * @name fn_onChangePltQntt
	 * @description 입고(출고) 가구/팔레트 event
	 */
	const fn_onChangePltQntt = async function(value) {
		/** 25.10.24 팔레트불출관리 - APC(0001) 수량 추가 (일단 입고만)*/
		let wrhsSpmtType = SBUxMethod.get("dtl-slt-wrhsSpmtType") == "RT" ? "입고" : "출고";
		let defaultWrhs = '거산APC';
		let defaultSpmt = SBUxMethod.get("dtl-inp-prdcrNm") || '';
		let setRmrk = wrhsSpmtType == "입고" ? defaultWrhs : defaultSpmt;

		jsonPltBox.forEach(item => {
			if (item.type == wrhsSpmtType && item.BpltBxCd == "0001") {
				item.Pqntt = value;
				item.rmrk = gfn_isEmpty(item.rmrk) ? setRmrk : item.rmrk;
			}
		});
		grdPltBox.refresh();
	}

	const fn_grdQnttChanged = function () {

		let itemCd = SBUxMethod.get('dtl-slt-itemCd');
		let nRow = grdVrty.getRow();

		if (nRow < 1) {
			return;
		}

		let vrtyList = grdVrty.getGridDataAllExceptTotal();
		let getItemVrtyList = jsonApcVrty.filter(e => e.itemCd === itemCd);
		let total = 0;
		for (var i=1; i<=vrtyList.length; i++) {

			let rowData = grdVrty.getRowData(i);
			for (var j=0; j<getItemVrtyList.length; j++) {
				let vrtyCdKey = getItemVrtyList[j].vrtyCd;
				let vrtyQntt = rowData[vrtyCdKey] || 0;

				if (vrtyQntt > 0) {
					total += parseInt(vrtyQntt);

					/** 25.11.03 입력한 품종 검품등급 기본값 세팅*/
					jsonInsp[0][vrtyCdKey] = gfn_isEmpty(jsonInsp[0][vrtyCdKey]) ? "3" : jsonInsp[0][vrtyCdKey];
					jsonInsp[1][vrtyCdKey] = gfn_isEmpty(jsonInsp[1][vrtyCdKey]) ? "3" : jsonInsp[1][vrtyCdKey];
				}
			}
		}
		grdInsp.refresh();

		SBUxMethod.set("dtl-inp-bxQntt", total);
		/** 25.10.13 입고가구 / 36 = 팔레트 */
		let pltTotal = parseInt(total / 36);
		SBUxMethod.set("dtl-inp-pltQntt", pltTotal);

		fn_onChangeBxQntt(total);
		fn_onChangePltQntt(pltTotal);
	}

	/**
     * @name fn_setGrdWghPrfmnc
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_search = async function () {
		SBUxMethod.openProgress(gv_loadingOptionsSub);

		let checked = SBUxMethod.getCheckbox('chkbox_dayCrtr', {trueValueOnly:true, ignoreDisabledValue:false});
		let checkedSearch = SBUxMethod.getCheckbox('chkbox_search', {trueValueOnly:true, ignoreDisabledValue:false});

		const isEmpty = (obj) => Object.keys(obj).length === 0;

		let wghYmdFrom = SBUxMethod.get("dtl-dtp-wghYmdFrom");
		let wghYmdTo = SBUxMethod.get("dtl-dtp-wghYmdTo");
		let wghYmd = SBUxMethod.get("dtl-dtp-wghYmdFrom");						// 계량일자

		let prdcrCd 		= SBUxMethod.get("dtl-inp-prdcrCd") || "";			// 생산자코드
		let vhclno 			= SBUxMethod.get("dtl-inp-vhclno") || "";			// 차량번호
		let trsprtCst 		= SBUxMethod.get('dtl-inp-trsprtCst') || 0;			// 운임
		let rmrk 			= SBUxMethod.get('dtl-inp-rmrk') || "";				// 비고
		let oinstSpmtNm 	= SBUxMethod.get('dtl-inp-oinstSpmtNm') || "";		// 타출고처
		let oprtrNm 		= SBUxMethod.get('dtl-inp-oprtrNm') || "";			// 입력자

		let itemCd 			= SBUxMethod.get("dtl-slt-itemCd") || "";					// 품목
		let wrhsSpmtType 	= SBUxMethod.get("dtl-slt-wrhsSpmtType");			// 입고출고유형
		let url 			= "";

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");					//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (gfn_isEmpty(wrhsSpmtType)) {
			gfn_comAlert("W0001", "구분");					//	W0001	{0}을/를 선택하세요.
			return;
		}

		let params = {
		      apcCd			: gv_selectedApcCd
			, itemCd 		: itemCd
			, wrhsSpmtType 	: wrhsSpmtType
		};

		let pltParams = {
			  apcCd			: gv_selectedApcCd
			, wrhsSpmtSeCd 	: '2'	// 출고
		};

		if (!isEmpty(checkedSearch)) {
			params.prdcrCd = prdcrCd;
			params.vhclno = vhclno;
			params.trsprtCst = trsprtCst;
			params.rmrk = rmrk;
			params.oinstSpmtNm = oinstSpmtNm;
			params.oprtrNm = oprtrNm;
		}

		if (isEmpty(checked)) {
			params.wghYmdFrom = wghYmdFrom;
			params.wghYmdTo = wghYmdTo;
			pltParams.jobYmdFrom = wghYmdFrom;
			pltParams.jobYmdTo = wghYmdTo;
		} else {
			params.wghYmd = wghYmd;
			pltParams.jobYmd = wghYmd;
		}

  		if (gfn_isEmpty(wrhsSpmtType)) {
    		gfn_comAlert("W0001", "구분");					//	W0001	{0}을/를 선택하세요.
            return;
    	}

 		if (wrhsSpmtType == "RT") {
 			url = "/am/wgh/selectWghRcptWrhsList.do"
 		}
 		if (wrhsSpmtType == "DT") {
 			url = "/am/wgh/selectWghRcptSpmtList.do"

			if (itemCd === "dtPlt") {
				url = "/am/wgh/selectWghPrfmncPltBxSpmtList.do"
			}
 		}

		const postJsonPromise = gfn_postJSON(url, params, null, true);

		/** 2025.09.12 출고 팔레트/박스 수량 추가 */
		const postJsonPromiseForPlt = gfn_postJSON("/am/cmns/selectPltWrhsSpmtList.do", pltParams, null, true);

  		try {

  			const data = await postJsonPromise;
			const dataForPlt = await postJsonPromiseForPlt;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

			if (!_.isEqual("S", dataForPlt.resultStatus)) {
				gfn_comAlert(dataForPlt.resultCode, dataForPlt.resultMessage);
				return;
			}

			const pltSpmtPrfmnc = dataForPlt.resultList;

          	/** @type {number} **/
      		let totalRecordCount = 0;
      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = item;

				if (gfn_isEmpty(item.itemCd)) {
					wghPrfmnc.itemNm = "가구/팔레트";
					wghPrfmnc.vrtyNm = "가구/팔레트";
				} else {
					const vrtyArray = item.vrtyNm.split(",");
					const set = new Set(vrtyArray);
					const uniqueArr = [...set];
					const vrtyNm = uniqueArr.join(", ");
					wghPrfmnc.vrtyNm = vrtyNm;
				}

				/**
				 * 25.10.02 순번 추가(계량번호 끝 4자리)
				 * 25.11.10 조회일자 변경으로 순번 순차 부여
				 * */
				// wghPrfmnc.wghnoSn = parseInt(item.wghno.slice(-4));
				wghPrfmnc.wghnoSn = data.resultList.length - index;

				const pltSpmtFilter = pltSpmtPrfmnc.filter(i => i.prcsNo === wghPrfmnc.wghno);
				const shpgotQntt = pltSpmtFilter.filter(e => e.pltBxSeCd === "B").reduce((sum, b) => sum + b.qntt, 0);
				const shpgotPltQntt = pltSpmtFilter.filter(e => e.pltBxSeCd === "P").reduce((sum, p) => sum + p.qntt, 0);

				wghPrfmnc.shpgotQntt = shpgotQntt;
				wghPrfmnc.shpgotPltQntt = shpgotPltQntt;

				/** 출고 실적 bxQntt, pltQntt 출하 수량 데이터 입고 데이터랑 구분이 없어서 일단 빈값으로 변환 */
				if (wrhsSpmtType === "DT" && itemCd !== "dtPlt") {
					wghPrfmnc.bxQntt = "";
					wghPrfmnc.pltQntt = "";
				}

  				jsonWghPrfmnc.push(wghPrfmnc);
  			});

          	if (jsonWghPrfmnc.length == 0) {
          		grdWghPrfmnc.refresh();
          	} else {
	          	grdWghPrfmnc.rebuild();
			}
			/** 계량 내역 set **/
			SBUxMethod.set("crtr-ymdFrom",wghYmdFrom);
			SBUxMethod.set("crtr-ymdTo",wghYmdTo);
			$("#cnt-wgh").text(data.resultList.length || 0);

			/** 25.11.03 저장 후 해당 내용 출력*/
			if (isSaved) {
				let row = chkWghno ? jsonWghPrfmnc.findIndex(item => item.wghno == chkWghno) + 1 : 1;
				grdWghPrfmnc.setRow(row);
				await fn_view(row);
			}
			isSaved = false;
			chkWghno = "";

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}

		SBUxMethod.closeProgress(gv_loadingOptionsSub);
	}

	const fn_delete = async function(){
		/** 계량실적 삭제대상 **/
		let nRow = grdWghPrfmnc.getRow();
		let deleteVo = grdWghPrfmnc.getRowData(nRow);

		/** 검품등급 삭제대상 **/
		let grdList = grdInsp.getGridDataAll();
		/** 검품등급 셋팅 **/
		const result = {};
		let inspList = [];
		let wghno = deleteVo.wghno;
		let itemCd = deleteVo.itemCd;
		let vrtyCd = deleteVo.vrtyCd.split(',');
		let wghYmd = deleteVo.wghYmd;
		let prdcrCd = deleteVo.prdcrCd;

		grdList.forEach(obj => {
			const grdCd = obj.grdCd;
			Object.keys(obj).forEach(key => {
				if (key !== "grdCd" && obj[key] !== "") {
					if (!result[key]) {
						result[key] = {};
					}
					result[key][grdCd] = obj[key];
				}
			});
		});
		let inspVO = {
			apcCd : gv_selectedApcCd,
			wghno : wghno,
			itemCd : itemCd,
			vrtyCd : '',
			grdCd : '',
			grdVl : '',
		}
		Object.keys(result).forEach(function(item){
			if(vrtyCd.findIndex( (vrtyCd) => item === vrtyCd) > -1 ){
				Object.keys(result[item]).forEach(function(iner){
					let vo = JSON.parse(JSON.stringify(inspVO));
					vo.vrtyCd = item;
					vo.grdCd = iner;
					vo.grdVl = result[item][iner];
					inspList.push(vo);
				});
			}
		});



		/** 팔레트불출 관리 삭제대상 **/
		let pltList = [];
		let pltGrd = grdPltBox.getGridDataAll();
		pltGrd = pltGrd.filter(item => (item.Bqntt > 0 || item.Pqntt > 0) && !item.hasOwnProperty("subtotal"));
		pltGrd.forEach(function(item){
			if(item.Bqntt > 0){
				pltList.push({
					apcCd : gv_selectedApcCd,
					jobYmd : wghYmd,
					wrhsSpmtSeCd : item.type === '입고'? '1' : '2',
					pltBxSeCd : 'B',
					pltBxCd : item.BpltBxCd,
					prdcrCd : prdcrCd,
					qntt : parseInt(item.Bqntt),
					sn : item.Bsn
				})
			}
			if(item.Pqntt > 0){
				pltList.push({
					apcCd : gv_selectedApcCd,
					jobYmd : wghYmd,
					wrhsSpmtSeCd : item.type === '입고'? '1' : '2',
					pltBxSeCd : 'P',
					pltBxCd : item.PpltBxCd,
					prdcrCd : prdcrCd,
					qntt : parseInt(item.Pqntt),
					sn : item.Psn
				})
			}
		});

		let param = {
			wghPrfmnc : deleteVo,
			inspList : inspList,
			pltList : pltList,
		}

		if (gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wgh/deleteWghPrfmncInspList.do", param);
			const data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					fn_search();
					fn_reset();
					gfn_comAlert("I0001");					// I0001 처리 되었습니다.
				} else {
					gfn_comAlert(data.resultCode, data.resultMessage);
				}
			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		}
	}


     /**
 	 * @name fn_whol
 	 * @description 전체중량 이벤트
 	 */
 	const fn_save = async function () {

		let checked = SBUxMethod.getCheckbox('chkbox_dayCrtr', {trueValueOnly:true, ignoreDisabledValue:false});
		const isEmpty = (obj) => Object.keys(obj).length === 0;

		if(isEmpty(checked)){
			gfn_comAlert("W0001", "일일기준");					//	W0001	{0}을/를 선택하세요.
			return;
		}

 		let wghYmd 			= SBUxMethod.get('dtl-dtp-wghYmdFrom');
 		let wghno 			= SBUxMethod.get('dtl-inp-wghno');
 		let prdcrCd 		= SBUxMethod.get('dtl-inp-prdcrCd');
 		let vhclno 			= SBUxMethod.get('dtl-inp-vhclno');
		let drvrNm			= SBUxMethod.get('dtl-inp-drvrNm');
 		let wholWght 		= SBUxMethod.get('dtl-inp-wholWght');
 		let emptVhclWght 	= SBUxMethod.get('dtl-inp-emptVhclWght');
 		let actlWght 		= SBUxMethod.get('dtl-inp-actlWght');
 		let itemCd 			= SBUxMethod.get('dtl-slt-itemCd');
 		let fcltCd 			= SBUxMethod.get('dtl-slt-fcltCd');
 		let wrhsSpmtType 	= SBUxMethod.get('dtl-slt-wrhsSpmtType');
 		let bxQntt 			= Number(SBUxMethod.get('dtl-inp-bxQntt'));
 		let pltQntt 		= SBUxMethod.get('dtl-inp-pltQntt');
		/** 계량 시각 **/
		let emptyTime = SBUxMethod.get("dtl-inp-emptVhclWghtTime");
		let wholTime = SBUxMethod.get("dtl-inp-wholWghtTime");
		// let wghDt = SBUxMethod.get("dtl-spi-wghDt");

 		if (gfn_isEmpty(wghYmd)) {
    		gfn_comAlert("W0001", "계량일자");					//	W0001	{0}을/를 선택하세요.
            return;
    	}

		if (gfn_isEmpty(prdcrCd)) {
			gfn_comAlert("W0002", "생산자");						//	W0002	{0}을/를 입력하세요.
			return;
		}

 		if (gfn_isEmpty(vhclno)) {
    		gfn_comAlert("W0002", "차량번호");					//	W0002	{0}을/를 입력하세요.
            return;
    	}

		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "계량대");						//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (gfn_isEmpty(wrhsSpmtType)) {
			gfn_comAlert("W0001", "계량대/구분");					//	W0001	{0}을/를 선택하세요.
			return;
		}

		/** 중량은 입고시에만 확인 */
		if (wrhsSpmtType == "RT") {
			if (gfn_isEmpty(wholTime)) {
				gfn_comAlert("W0002", "전체중량/시간");					//	W0002	{0}을/를 입력하세요.
				return;
			}

			if (gfn_isEmpty(emptyTime)) {
				gfn_comAlert("W0002", "공차중량/시간");					//	W0002	{0}을/를 입력하세요.
				return;
			}
		} else {
			wholWght = wholWght || 0;
			emptVhclWght = emptVhclWght || 0;
			actlWght = actlWght || 0;
			wholTime = wholTime || "";
			emptyTime = emptyTime || "";
		}

		let sumBqntt; // 팔레트 불출관리 상자 합계
		if (itemCd !== "dtPlt") {

			for(let i =0; i<jsonPltBox.length; i++){
				if(wrhsSpmtType === "RT" && jsonPltBox[i].BpltBxNm === "합계" && jsonPltBox[i].type === "입고"){
					sumBqntt = Number(jsonPltBox[i].Bqntt);
				} else if (wrhsSpmtType === "DT" && jsonPltBox[i].BpltBxNm === "합계" && jsonPltBox[i].type === "출고"){
					sumBqntt = Number(jsonPltBox[i].Bqntt);
				}
			}

			if(sumBqntt !== bxQntt && bxQntt){
				gfn_comAlert("W0006", "입고 가구 수","팔레트 불출관리 상자 합계"); // W0006 {0}와/과 {1}이/가 서로 다릅니다.
				return;
			}
		} else {
			sumBqntt = Number(jsonDtBxPlt[jsonDtBxPlt.length - 1].Bqntt);
			if (gfn_isEmpty(sumBqntt) || sumBqntt == 0) {
				gfn_comAlert("W0002", "가구/팔레트 수량");						//	W0002	{0}을/를 입력하세요.
				return;
			}
		}



 		let trsprtCst 		= SBUxMethod.get('dtl-inp-trsprtCst') || 0;
 		let rmrk 			= SBUxMethod.get('dtl-inp-rmrk') || "";
 		let oinstSpmtNm 	= SBUxMethod.get('dtl-inp-oinstSpmtNm') || "";
 		let shpgotQntt 		= SBUxMethod.get('dtl-inp-shpgotQntt') || "";
 		let shpgotPltQntt 	= SBUxMethod.get('dtl-inp-shpgotPltQntt') || "";
 		let oprtrNm 		= SBUxMethod.get('dtl-inp-oprtrNm') || "";

		let vrtyList = grdVrty.getGridDataAllExceptTotal();
		let grdList = grdInsp.getGridDataAll();

		/** 검품등급 && 팔레트 수정을 위한 삭제리스트 */
		let inspDelList = [];
		let pltDelList = [];

		if(!gfn_isEmpty(wghno)) {
			grdList.forEach((objA, index) => {
				const objB = jsonInspCmpr[index];
				if (objB) {
					Object.keys(objA).forEach(key => {
						if (objA[key] === "" && objB[key] !== "") {
							inspDelList.push({
								apcCd: gv_selectedApcCd,
								wghno: wghno,
								itemCd: itemCd,
								vrtyCd: key,
								grdCd: objB.grdCd,
								grdVl: objB[key],
							});
						}
					});
				}
			});
		}

		/** 저장대상 없음 **/
		// const even = (el) => Object.keys(el).length > 1;
		// 저장창고 컬럼 추가 후 조건 수정
		/**
		 * 저장창고 컬럼 추가 후 조건 수정
		 * 25.10.16 가구/팔레트 추가된 후 조건 추가
		 * */
		const even = (el) => jsonApcVrty.some(vrty => el[vrty.vrtyCd]);
		if(!vrtyList.some(even) && itemCd !== "dtPlt"){
			gfn_comAlert("W0002","실적 대상");
			return;
		}

		/** 검품등급 셋팅 **/
		const result = {};

		grdList.forEach(obj => {
			const grdCd = obj.grdCd;
			Object.keys(obj).forEach(key => {
				if (key !== "grdCd" && obj[key] !== "") {
					if (!result[key]) {
						result[key] = {};
					}
					result[key][grdCd] = obj[key];
				}
			});
		});

		let wghPrfmnc = {
				apcCd			: gv_selectedApcCd
			  , wghno			: wghno
			  ,	wghYmd 			: wghYmd
			  , prdcrCd			: prdcrCd
			  , vhclno			: vhclno
			  , drvrNm			: drvrNm
			  , wholWght		: wholWght
			  , emptVhclWght	: emptVhclWght
			  , actlWght		: actlWght
			  , itemCd			: itemCd
			  , fcltCd			: fcltCd
			  , wrhsSpmtType	: wrhsSpmtType
			  , bxQntt			: bxQntt
			  , pltQntt			: pltQntt
			  , trsprtCst		: trsprtCst
			  , rmrk			: rmrk
			  , oinstSpmtNm		: oinstSpmtNm
			  , shpgotPltQntt	: shpgotPltQntt
			  , oprtrNm			: oprtrNm
			  , inspPrfmncList  : []
		}

		let multiList = [];
		let wghSnArray = [];

		let prvWghPrfmncData = jsonWghPrfmnc.filter(e => e.wghno === wghno)[0];

		if (itemCd === "dtPlt") {
			/** 출고실적에서 품종 실적 내역 있으면 해당 그리드에서 품종 및 팔레트 수량 수정될 수 있도록 */
			if (prvWghPrfmncData?.itemCd && prvWghPrfmncData.wrhsSpmtType == "DT") {
				gfn_comAlert("Q0000", prvWghPrfmncData.itemNm + " 출고 실적이 있습니다.");
				return;
			}

			wghPrfmnc.itemCd = "";
			wghPrfmnc.groupId = 1;
			if (gfn_isEmpty(wghno)) {
				wghPrfmnc.rowSts = 'I';
				multiList.push(wghPrfmnc);
			} else {
				/** 출고 - 가구/팔레트시 계량 입고 실적이 있는 출고 팔레트는 계량 실적이 입고가 아닌 출고로 잡히지 않게*/
				wghPrfmnc.wrhsSpmtType = prvWghPrfmncData.wrhsSpmtType;
				wghPrfmnc.rowSts = 'U';
				wghPrfmnc.wghSn = '1';

				/** fn_onChangeSrchItemCd 에서 jsonGrdCd 초기화 */
				await gfn_setApcGdsGrdSBSelect('grdVrty', 		jsonGrdCd, 		gv_selectedApcCd, prvWghPrfmncData.itemCd, "01");		// 등급
				for (let i = 1; i <= jsonGrdCd.length; i++) {
					let dtlGrdCdKey = 'grdCd' + i;
					let dtlGrdQnttKey = 'grdQntt' + i;
					let dtlGrdWghSnKey = 'grdWghSn' + i;
					let dtlGrdWrhsnoKey = 'grdWrhsno' + i;
					let dtlWarehouseSeCdKey = 'warehouseSeCd' + i;
					jsonWghDtlPrfmnc.forEach( item => {
						if (item.wghno == wghno && !gfn_isEmpty(item[dtlGrdCdKey])) {
							wghPrfmnc.itemCd = item.itemCd;
							wghPrfmnc.vrtyCd = item.vrtyCd;
							wghPrfmnc.bxQntt = item[dtlGrdQnttKey];
							wghPrfmnc.grdCd = item[dtlGrdCdKey];
							wghPrfmnc.warehouseSeCd = item[dtlWarehouseSeCdKey];
							wghPrfmnc.grdSeCd = item.grdSeCd;


							wghPrfmnc.wghSn = item[dtlGrdWghSnKey];
							wghPrfmnc.wrhsno = item[dtlGrdWrhsnoKey];
							wghPrfmnc.pltno = item[dtlGrdWrhsnoKey];

							wghPrfmnc.dtlWrhsWght = item.dtlWrhsWght;

							multiList.push({...wghPrfmnc});
							wghSnArray.push(item[dtlGrdWghSnKey]);
						}
					});
				}

				if (jsonWghDtlPrfmnc.length == 0) {
					multiList.push(wghPrfmnc);
				}
			}
		} else {
			/** 사이즈 등급 그리드 ite **/
			// vrtyCd 중복값이 존재하여 jsonApcVrty 필터
			jsonApcVrty = jsonApcVrty.filter(e => e.itemCd === itemCd);
			for (var i=1; i<=vrtyList.length; i++) {
				let rowData = vrtyList[i-1];
				let warehouseSeCd = rowData.warehouseSeCd;
				/** 품종 ref ite **/
				for (var j=0; j<jsonApcVrty.length; j++) {
					let vrtyCdKey = JSON.parse(JSON.stringify(jsonApcVrty[j])).vrtyCd;
					let vrtyQntt = rowData[vrtyCdKey] || 0;

					const wghPrfmncVO = JSON.parse(JSON.stringify(wghPrfmnc))

					if (gfn_isEmpty(wghno)) {
						if (vrtyQntt > 0) {
							wghPrfmncVO.vrtyCd = vrtyCdKey;
							wghPrfmncVO.bxQntt = vrtyQntt;
							wghPrfmncVO.dtlWrhsWght = (parseFloat(actlWght) / parseFloat(vrtyQntt)).toFixed(2) ;
							wghPrfmncVO.grdCd = rowData.grdCd;
							wghPrfmncVO.groupId = 1;
							wghPrfmncVO.rowSts = 'I';
							wghPrfmncVO.warehouseSeCd = warehouseSeCd;
							/** 하단 그리드 grdSeCd set **/
							if(rowData.hasOwnProperty("grdSeCd")){
								wghPrfmncVO.grdSeCd = rowData.grdSeCd;
							}
							/** 출고실적 등록 **/
							if (wrhsSpmtType === "DT") {
								wghPrfmncVO.spmtPrfmncYn = "Y";
							}
							multiList.push(wghPrfmncVO);
						}
					} else {
						wghPrfmncVO.vrtyCd = vrtyCdKey;
						wghPrfmncVO.bxQntt = vrtyQntt;
						wghPrfmncVO.grdCd = rowData.grdCd;
						wghPrfmncVO.warehouseSeCd = warehouseSeCd;
						/** 하단 그리드 grdSeCd Set **/
						wghPrfmncVO.grdSeCd = rowData.grdSeCd;
						wghPrfmncVO.groupId = 1;
						wghPrfmncVO.rowSts = 'U';

						for (var k=1; k<=jsonGrdCd.length; k++) {
							let dtlGrdCdKey = 'grdCd' + k;
							let dtlGrdWghSnKey = 'grdWghSn' + k;
							let dtlGrdWrhsnoKey = 'grdWrhsno' + k;
							for (var l=0; l<jsonWghDtlPrfmnc.length; l++) {

								let wghPrfmnc = JSON.parse(JSON.stringify(jsonWghDtlPrfmnc[l]));
								if (wghPrfmnc.vrtyCd == vrtyCdKey && wghPrfmnc[dtlGrdCdKey] == rowData.grdCd) {
									wghPrfmncVO.wghSn = wghPrfmnc[dtlGrdWghSnKey];
									wghPrfmncVO.wrhsno = wghPrfmnc[dtlGrdWrhsnoKey];
									wghPrfmncVO.pltno = wghPrfmnc[dtlGrdWrhsnoKey];

									if (wghPrfmncVO.bxQntt == 0 || gfn_isEmpty(wghPrfmncVO.bxQntt)) {
										wghPrfmncVO.dtlDelYn = 'Y';
										multiList.push(wghPrfmncVO);
										wghSnArray.push(wghPrfmnc[dtlGrdWghSnKey]);
									}
								}
							}
						}

						if (!(vrtyQntt == 0 || gfn_isEmpty(vrtyQntt))) {
							wghPrfmncVO.dtlWrhsWght = (parseFloat(actlWght) / parseFloat(vrtyQntt)).toFixed(2);
							if (!gfn_isEmpty(wghPrfmncVO.wghSn)) {
								wghSnArray.push(wghPrfmncVO.wghSn)
							}
							/** 출고실적 등록 **/
							if (wrhsSpmtType === "DT") {
								wghPrfmncVO.spmtPrfmncYn = "Y";
							}
							multiList.push(wghPrfmncVO);
						}
					}
				}
			}
		}

		for (var z = 0; z < multiList.length; z++) {
			let prfmncVO = JSON.parse(JSON.stringify(multiList[z]));
			if (gfn_isEmpty(prfmncVO.wghSn)) {
				let max = Math.max(...wghSnArray);
				multiList[z].wghSn = parseInt(max) + 1;
				wghSnArray.push(parseInt(max) +1);
				multiList[z].newYn = 'Y';
			}
		}


		/** 팔레트 불출관리 **/
		let pltWrhsSpmt = [];
		let pltGrd = grdPltBox.getGridDataAllExceptTotal();
		let dtBxPltGrd = grdDtBxPlt.getGridDataAllExceptTotal();

		/** 조회한 팔레트/박스 수량과 수정한 수량을 비교하여 삭제리스트 추가 */
		let chkPltGrd = itemCd === "dtPlt" ? dtBxPltGrd : pltGrd;
		chkPltGrd.forEach(item => {
			jsonPltBoxCmpr.forEach(cmpr => {
				const matches = [
					[item.BpltBxSeCd, item.BpltBxCd, item.Bqntt, item.type === "입고" ? "1" : "2"],
					[item.PpltBxSeCd, item.PpltBxCd, item.Pqntt, item.type === "입고" ? "1" : "2"]
				].some(([seCd, cd, qntt, type]) =>
						seCd === cmpr.pltBxSeCd && cd === cmpr.pltBxCd && type === cmpr.wrhsSpmtSeCd && (qntt == 0 || gfn_isEmpty(qntt))
				);

				if (matches) pltDelList.push(cmpr);
			});
		});


		/** 팔레트 불출관리 set **/
		const createPltWrhsSpmtItem = (pltBxSeCd, pltBxCd, pltBxNm, qntt, unitWght, sn, rmrk, wghYmd, prdcrCd, wrhsSpmtSeCd) => ({
			apcCd: gv_selectedApcCd,
			jobYmd: wghYmd,
			wrhsSpmtSeCd,
			pltBxSeCd,
			pltBxCd,
			pltNm: pltBxNm,
			prdcrCd,
			qntt: parseInt(qntt),
			unitWght: parseFloat(unitWght),
			sn,
			rmrk
		});

		// 팔레트 불출 관리
		const filteredPltGrd = chkPltGrd.filter(item =>
				(item.Bqntt > 0 || item.Pqntt > 0)
		);

		filteredPltGrd.forEach(item => {
			const wrhsSpmtSeCd = item.type === '입고' ? '1' : '2';

			if (item.Bqntt > 0) {
				pltWrhsSpmt.push(createPltWrhsSpmtItem(
						'B', item.BpltBxCd, item.BpltBxNm, item.Bqntt, item.BunitWght,
						item.Bsn, item.rmrk, wghYmd, prdcrCd, wrhsSpmtSeCd
				));
			}

			if (item.Pqntt > 0) {
				pltWrhsSpmt.push(createPltWrhsSpmtItem(
						'P', item.PpltBxCd, item.PpltBxNm, item.Pqntt, item.PunitWght,
						item.Psn, item.rmrk, wghYmd, prdcrCd, wrhsSpmtSeCd
				));
			}
		});

		/** 검품등급 set **/
		 let inspVO = {
			 apcCd : gv_selectedApcCd,
			 wghno : '',
			 itemCd : itemCd,
			 vrtyCd : '',
			 grdCd : '',
			 grdVl : '',
		 }
		 multiList.forEach(function(item){
			 let key = item.vrtyCd;
			 if(result.hasOwnProperty(key)){
				 Object.keys(result[key]).forEach(function(grdCd){
					 let vo = JSON.parse(JSON.stringify(inspVO));
					 vo.vrtyCd = item.vrtyCd;
					 vo.grdCd = grdCd;
					 vo.grdVl = result[key][grdCd];
					 item.inspPrfmncList.push(vo);
				 });
			 }
		 });
		let Cfclt = SBUxMethod.get("dtl-slt-fcltCd");
		 document.cookie = `addr=${'${Cfclt}'}; path=/; max-age=31536000; samesite=strict`;
		 document.cookie = `itemCd=${'${itemCd}'}; path=/; max-age=31536000; samesite=strict`;

		/** 계량이력 set **/
		let wghHstryVO = {
			apcCd : gv_selectedApcCd,
			wghno: '',
			wghSeq : '',
			vhclno : vhclno,
			wghSeCd : '',
			wghWght : '',
			wghDt : '',
			prcsTaskCd : '',
			prcsCmptnDt : '',
			prcsCmptnYn : '',
			wghRmrk : '',
			fcltCd : fcltCd,
		}

		/** 계량구분 코드**/
		let wghSeCd = jsonWghSeCd.filter(item => item.cdChrVl === wrhsSpmtType);
		let wghHstryList = [];
		wghSeCd.forEach(function(item,idx){
			let vo = JSON.parse(JSON.stringify(wghHstryVO));
			/** 입출차, 입고출하로 무게 구분 **/
			if(item.cdNumVl == "1"){
				vo.wghWght = wrhsSpmtType == "RT" ? wholWght : emptVhclWght;
				vo.wghDt = wghYmd + wholTime;
			}else if(item.cdNumVl == "2"){
				vo.wghWght = wrhsSpmtType == "RT" ? emptVhclWght : wholWght;
				vo.wghDt = wghYmd + emptyTime;
			}
			vo.wghSeCd = item.cdVl;
			vo.wghSeq = idx;
			wghHstryList.push(vo);
		});

		/** jsonApcVrty 기준에 맞춰 정렬 **/
		// vrtyCd 순서를 매핑하는 Map 생성
		const orderMap = new Map();
		jsonApcVrty.forEach((item, index) => {
			orderMap.set(item.vrtyCd, index);
		});

		multiList.sort((a, b) => {
			// vrtyCd값 없으면 뒤로 보내기 위해 Infinity 사용
			const indexA = orderMap.get(a.vrtyCd) ?? Infinity;
			const indexB = orderMap.get(b.vrtyCd) ?? Infinity;
			return indexA - indexB;
		})

		jsonWarehouse = multiList.filter(item => item.dtlDelYn !== 'Y').map(item => {
			const vrtyNm = jsonApcVrty.find(i => i.vrtyCd === item.vrtyCd)?.vrtyNm || '';
			return {
				...item,
				vrtyNm: vrtyNm,
				[item.grdCd]: item.bxQntt
			}
		});

		 let param = {
			 multiList : multiList,
			 pltWrhsSpmt : pltWrhsSpmt,
			 wghHstryList : wghHstryList,
			 inspDelList : inspDelList,
			 pltDelList : pltDelList,
		 }

		if (wrhsSpmtType == "DT" && itemCd === "dtPlt") {
			if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
				param.inspDelList = [];
				const postJsonPromise = gfn_postJSON("/am/wgh/multiWghPrfmncList0669.do", param);
				const data = await postJsonPromise;

				if (_.isEqual("S", data.resultStatus)) {
					// await fn_reset();
					gfn_comAlert("I0001");					// I0001 처리 되었습니다.
					chkWghno = wghno || "";
					isSaved = true;
					await fn_search();
				} else {
					gfn_comAlert(data.resultCode, data.resultMessage);
				}
			}
			return;
		}

		/** 저장창고 select **/
		await fn_warehouseModal();

		/** modal grid size **/
		$("#sb-area-warehouse").css("height",(multiList.length * 25) + 30 + 'px');

		await fn_createWarehouseGrid();

		// return;
		const btnSetWarehouse = document.getElementById('btnSetWarehouse');
		const btnCancel = document.getElementById('btnCancel');

		 try {
			const checkBtn = await fn_setWarehouse(btnSetWarehouse, btnCancel);

			if (!_.isEqual(checkBtn, "btnSetWarehouse")) {
				return;
			}
			let setWarehouseCd = grdWarehouse.getGridDataAll();

			 param.multiList.filter(item => item.dtlDelYn !== 'Y').forEach(function(item, idx){
				 item.warehouseSeCd = setWarehouseCd[idx].warehouseSeCd;
			 });

			 await fn_warehouseModal();



			 if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
				 const postJsonPromise = gfn_postJSON("/am/wgh/multiWghPrfmncList0669.do", param);
				 const data = await postJsonPromise;

				 if (_.isEqual("S", data.resultStatus)) {
					 // await fn_reset();
					 gfn_comAlert("I0001");					// I0001 처리 되었습니다.
					 chkWghno = wghno || "";
					 isSaved = true;
					 await fn_search();
				 } else {
					 gfn_comAlert(data.resultCode, data.resultMessage);
				 }
			 }
		 } catch (e) {
			 if (!(e instanceof Error)) {
				 e = new Error(e);
			 }
			 console.error("failed", e.message);
		 }
    }

	/**
	 * @name fn_setWarehouse
	 * @description
	 */
	const fn_setWarehouse = function (btnSetWarehouse, btnCancel) {
		return new Promise((resolve, reject) => {
			const clickHandler = () => {
				btnSetWarehouse.removeEventListener('click', clickHandler); // 클릭 후 리스너 제거
				if (btnCancel) btnCancel.removeEventListener('click', cancelHandler);
				resolve(btnSetWarehouse.id); // 버튼 ID를 resolve
			};

			const cancelHandler = () => {
				if (btnSetWarehouse) btnSetWarehouse.removeEventListener('click', clickHandler);
				btnCancel.removeEventListener('click', cancelHandler); // 취소 후 리스너 제거
				reject('cancel'); // 취소 시 reject
			};

			btnSetWarehouse.addEventListener('click', clickHandler);
			if (btnCancel) {
				btnCancel.addEventListener('click', cancelHandler);
			}
		})
	}


	/**
	 wghPrfmncVO* @name fn_whol
	 * @description 전체중량 이벤트
	 */
	const fn_whol = function () {
		let wght = $("#nowWght").text().replace(/,/g, "");
		wght = parseFloat(wght) || 0;
		let now = new Date();
		const formattedDate = now.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }).replace(':', '');
		SBUxMethod.set('dtl-inp-wholWght', wght);
		SBUxMethod.set('dtl-inp-wholWghtTime', formattedDate);
	}

	/**
	 * @name fn_whol
	 * @description 공차중량 이벤트
	 */
	const fn_emptVhcl = function () {
		let wght = $("#nowWght").text().replace(/,/g, "");
		wght = parseFloat(wght) || 0;
		let now = new Date();

		const formattedDate = now.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }).replace(':', '');
		SBUxMethod.set('dtl-inp-emptVhclWght', wght);
		SBUxMethod.set('dtl-inp-emptVhclWghtTime', formattedDate);

		fn_calWght();
	}
	const fn_calWght = function(){
		let whol = parseFloat(SBUxMethod.get("dtl-inp-wholWght")) || 0;
		let empt = parseFloat(SBUxMethod.get("dtl-inp-emptVhclWght")) || 0;

		SBUxMethod.set('dtl-inp-actlWght', (whol - empt));
	}

	/**
	 * @name fn_srchPrdcr
	 * @description 생산자 enter 키 이벤트
	 */
	const fn_srchPrdcr = async function (prdcrNm) {
		if(jsonPrdcrAutocomplete.filter(e => e.name === prdcrNm).length == 1){
			fn_onSelectPrdcrNm(
				jsonPrdcrAutocomplete.filter(e => e.name === prdcrNm)[0].value,
				jsonPrdcrAutocomplete.filter(e => e.name === prdcrNm)[0].name
			);
		} else {
			document.getElementById('btnSrchPrdcr').click();
		}
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("dtl-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-prdcrIdentno", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btnSrchPrdcr').click();
		} else{
			SBUxMethod.set("dtl-inp-prdcrCd", value);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
			prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

			fn_setPrdcrForm(prdcr);

		}
	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("dtl-inp-prdcrNm"));
	}
	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			// fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
			// SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
			const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
			if (prvItemCd != prdcr.rprsItemCd && prvItemCd !== "dtPlt") {
				fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
			}
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.itemVrtyCd);
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	/**
	 * @name fn_onChangeSrchPrdcrIdentno
	 * @description 생산자 식별번호 변경 event
	 */
	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("dtl-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-prdcrNm", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("dtl-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("dtl-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("dtl-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			/** sn 순서보장 **/
			jsonApcVrty = jsonApcVrty.sort((a, b) => a.sn - b.sn);
			SBUxMethod.refresh('dtl-slt-vrtyCd');
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);

		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd && prvItemCd !== "dtPlt") {
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
					SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
				}
			}
		}

		if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
			SBUxMethod.set("dtl-rdo-wrhsSeCd", prdcr.wrhsSeCd);
		}
		if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
			SBUxMethod.set("dtl-rdo-gdsSeCd", prdcr.gdsSeCd);
		}
		if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
			SBUxMethod.set("dtl-rdo-trsprtSeCd", prdcr.trsprtSeCd);
		}
		if (!gfn_isEmpty(prdcr.vhclno) && gfn_isEmpty(SBUxMethod.get("dtl-inp-vhclno"))) {	// 차량번호
			SBUxMethod.set("dtl-inp-vhclno", prdcr.vhclno);
			await popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, prdcr.vhclno);
			SBUxMethod.openModal('modal-vhcl');
			if(grdVhclPop.getRows() == 2){
				grdVhclPop.setRow(1);
				popVhcl.choice();
			}
		}
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("dtl-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("dtl-inp-prdcrIdentno", "");
		}

		if (!gfn_isEmpty(prdcr.prdcrCd)) {
			let frmhsInfo = '';
			if (prdcr.abbrNm) {
				frmhsInfo += '별칭: ' + prdcr.abbrNm + '  ';
			}
			if (prdcr.frmhsNm) {
				frmhsInfo += '재배농가: ' + prdcr.frmhsNm + ' ';
			}
			if (prdcr.frmhsAddr) {
				frmhsInfo += '주소: ' + prdcr.frmhsAddr + ' ';
			}
			SBUxMethod.set("frmhsInfo", frmhsInfo);
		}
	}

	/**
	 * @name fn_srchVhclno
	 * @description 차량번호 enter 키 이벤트
	 */
	const fn_srchVhclno = async function () {
		let vhclno = SBUxMethod.get("dtl-inp-vhclno");
		await popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, vhclno);
		SBUxMethod.openModal('modal-vhcl');
		if(grdVhclPop.getRows() == 2){
			grdVhclPop.setRow(1);
			popVhcl.choice();
		}
	}

	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("dtl-inp-vhclno"));
	}
	function fn_setVhcl(vhcl) {
		let vhclInfo = '';
		if (!gfn_isEmpty(vhcl)) {
			getVhclInfo = vhcl;
			SBUxMethod.set("dtl-inp-vhclno", vhcl.vhclno);
			SBUxMethod.set("dtl-inp-drvrNm", vhcl.drvrNm || "");
			if(vhcl.drvrNm){
				vhclInfo += '기사명: ' + vhcl.drvrNm + ' ';
			}
			if(vhcl.rmrk){
				vhclInfo += '비고: ' + vhcl.rmrk + ' ';
			}
		}
		SBUxMethod.set("vhclInfo",vhclInfo);
	}

	/**
	 * @name fn_choiceWrhsPltBx
	 * @description 입고팔레트 지정 popup 호출
	 */
	const fn_choiceWrhsPltBx = function() {

		const itemCd = SBUxMethod.get("dtl-slt-itemCd");
		const wghno = SBUxMethod.get("dtl-inp-wghno");

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		SBUxMethod.openModal('modal-wrhsPltBx');
		popWrhsPltBx.init(
				{
					apcCd: gv_selectedApcCd,
					apcNm: gv_selectedApcNm,
					itemCd: itemCd,
					wghno: wghno
				}
				, fn_setWrhsPltBx
				, jsonWrhsPltBx);
	}

	/**
	 * @name fn_setWrhsPltBx
	 * @description 팔레트/박스 선택 Callback
	 */
	const fn_setWrhsPltBx = function(_wrhsPltBx) {

		if (!gfn_isEmpty(_wrhsPltBx)) {
			jsonWrhsPltBx = gfn_cloneJson(_wrhsPltBx);
			// 팔레트/박스 Kg set
			SBUxMethod.set("dtl-inp-pltWght", jsonWrhsPltBx.pltWght);
			SBUxMethod.set("dtl-inp-bxWght", jsonWrhsPltBx.bxWght);
			//정산중량 Kg set
			fn_setWght();
		}
	}

	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeWholWght = function() {
		// 전체중량 >> 감량, 실중량, 입고중량
		fn_setWght();
	}
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeEmptVhclWght = function() {
		// 공차중량 >> 감량, 실중량, 입고중량
		fn_setWght();
	}
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeRdcdRt = function() {
		// 감량(%) >> 감량, 실중량, 입고중량
		if (parseFloat(SBUxMethod.get("dtl-inp-rdcdRt")) > 100) {
			gfn_comAlert('W0008', '감량률', '100%');

			SBUxMethod.set("dtl-inp-rdcdRt", "");
			return;
		}
		fn_setWght();
	}

	/**
	 * @name fn_setWght
	 * @description 입고중량 계산
	 */
	const fn_setWght = function() {

		const wholWght = parseInt(SBUxMethod.get("dtl-inp-wholWght")) || 0;
		const emptVhclWght = parseInt(SBUxMethod.get("dtl-inp-emptVhclWght")) || 0;
		const rdcdRt = parseFloat(SBUxMethod.get("dtl-inp-rdcdRt")) || 0;
		const pltWght = parseInt(SBUxMethod.get("dtl-inp-pltWght")) || 0;
		const bxWght = parseInt(SBUxMethod.get("dtl-inp-bxWght")) || 0;

		// 실중량
		const actlWght = wholWght - emptVhclWght;
		// 감량(Kg)
		const rdcdWght = Math.round(actlWght * rdcdRt / 100);
		// 정산중량(입고중량)
		const wrhsWght = actlWght - rdcdWght - pltWght - bxWght;

		SBUxMethod.set("dtl-inp-actlWght", actlWght);	// 실중량
		SBUxMethod.set("dtl-inp-rdcdWght", rdcdWght);	// 감량(Kg)
		SBUxMethod.set("dtl-inp-wrhsWght", wrhsWght);	// 정산중량(입고중량)
	}

	const fn_oneDay = function(){
		let checked = SBUxMethod.getCheckbox('chkbox_dayCrtr', {trueValueOnly:true, ignoreDisabledValue:false});
		const isEmpty = (obj) => Object.keys(obj).length === 0;

		if(isEmpty(checked)){
			SBUxMethod.show('dtl-dtp-wghYmdTo');
		}else{
			SBUxMethod.hide('dtl-dtp-wghYmdTo');
		}
	}


	function fn_noKeyup(event) {

	}

	const fn_popApcLinkCallBack = function() {

    }

     const fn_popApcLink = function() {
         popApcLink.init(
                     {
                         apcCd: gv_selectedApcCd,
                         apcNm: gv_selectedApcNm,
                         linkKnd: "1",
                         kndList: ["1"]
                     },
                     fn_popApcLinkCallBack
                 );
     }

	const ws = {
		socket: null,
		isConnected: false,
		isReconnecting: false,
		reconnectInterval: 30000,
		connectionTimeout: 5000, // 5초 타임아웃
		timeoutId: null,
		init: function() {
			// 기존 타임아웃 제거
			if (this.timeoutId) {
				clearTimeout(this.timeoutId);
				this.timeoutId = null;
			}

			this.socket = new WebSocket("ws://localhost:9090/ws");

			// 연결 타임아웃 설정
			this.timeoutId = setTimeout(() => {
				if (!this.isConnected && this.socket) {
					console.warn("WebSocket 연결 타임아웃");
					this.socket.close();
				}
			}, this.connectionTimeout);

			this.socket.onopen = () => {
				// 타임아웃 취소
				if (this.timeoutId) {
					clearTimeout(this.timeoutId);
					this.timeoutId = null;
				}

				this.isConnected = true;

				// $("#unit").css("display","initial");
				$("#onBtn").css("display","initial");
				$("#offBtn").css("display","none");
				SBUxMethod.attr('btnWhol', 'disabled', 'false');
				SBUxMethod.attr('btnEmptVhcl', 'disabled', 'false');
				this.socket.send("hello, server");
			};

			this.socket.onmessage = (event) => {
				$("#nowWght").text('');
				let wght = parseInt(event.data);
				if(isNaN(wght)){
					wght = 0;
				}
				wght = wght.toLocaleString('en-US');
				$("#nowWght").text(wght);
				$("#nowWght").css("color","blue");
			};

			this.socket.onerror = (error) => {
				// 타임아웃 취소
				if (this.timeoutId) {
					clearTimeout(this.timeoutId);
					this.timeoutId = null;
				}
				this.isConnected = false;
			};

			this.socket.onclose = () => {
				// 타임아웃 취소
				if (this.timeoutId) {
					clearTimeout(this.timeoutId);
					this.timeoutId = null;
				}

				this.isConnected = false;
				this.isReconnecting = false;
				$("#nowWght").text('수신중');
				$("#nowWght").css("color","black");
				// $("#nowWght").append(`<span id="nowWghtDot">...</span>`)
				// $("#unit").css("display","none");
				$("#offBtn").css("display","initial");
				$("#onBtn").css("display","none");
				SBUxMethod.attr('btnWhol', 'disabled', 'true');
				SBUxMethod.attr('btnEmptVhcl', 'disabled', 'true');

                this.reconnect();
			};
		},
		checkConnection: function() {
			if (!this.isConnected && this.isReconnecting) {
				this.init();
			}
		},
		reconnect: function() {
			if (!this.isConnected && !this.isReconnecting) {
				this.isReconnecting = true;
				setTimeout(() => {
					this.checkConnection();
				}, this.reconnectInterval);
			}
		}
	};
	const fn_forceInit = async function(){
		ws.init();
	}
	const fn_pltBxModal = async function(){
		const displayValue = $('#pltBxModal').css('display');

		if(displayValue === 'none'){
			$("#pltBxModal").css("display","block");
		}else{
			$("#pltBxModal").css("display","none");
		}
	}
	const fn_createPltBxGrid = function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-pltBx';
		SBGridProperties.id = 'grdPltBox';
		SBGridProperties.jsonref = 'jsonPltBox';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.mergecells = 'bycol';
		SBGridProperties.total ={
			type:'sub',
			position : 'bottom',
			columns :{
				standard: [0],
				sum : [2,4]
			},
			subtotalrow : {
				0 : {
					titlecol:1,
					titlevalue : '합계',
					style:'background-color:rgb(206, 235, 255); font-weight:bold;',
					stylestartcol:1
				}
			}
		}
		SBGridProperties.columns = [
			{caption: ['구분'], 	ref: 'type', width: '15%', type:'output',  	style:'text-align:center'},
			{caption: ['상자종류'], 	ref: 'BpltBxNm', width: '20%', type:'output',  	style:'text-align:center',merge : false},
			{caption: ['수량'], 	ref: 'Bqntt', width: '12%', type:'input',  	style:'text-align:center',merge : false},
			{caption: ['팔레트종류'],	ref: 'PpltBxNm', width: '20%', type:'output',  	style:'text-align:center',merge : false},
			{caption: ['수량'], 	ref: 'Pqntt', width: '12%', type:'input',  	style:'text-align:center',merge : false},
			{caption: ['입고,출고지'],		ref: 'rmrk', width: '21%', type:'input',  	style:'text-align:center', merge : false},
		]
		grdPltBox = _SBGrid.create(SBGridProperties);
		grdPltBox.bind("beforeedit",'fn_qnttDisable');
		grdPltBox.bind('valuechanged', 'fn_grdPltBoxChanged');

		/** grid 재사용 **/
		jsonDtBxPlt.length = 0;
		var SBGridProperties2 = {};
		SBGridProperties2.id = 'grdDtBxPlt';
		SBGridProperties2.parentid = 'sb-area-grdDtBxPlt';
		SBGridProperties2.jsonref = 'jsonDtBxPlt';
		SBGridProperties2.emptyrecords = '데이터가 없습니다.';
		SBGridProperties2.selectmode = 'free';
		// SBGridProperties2.extendlastcol = 'scroll';
		SBGridProperties2.oneclickedit = true;
		SBGridProperties2.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [1, 2],
				sum : [2, 4],
			},
			grandtotalrow : {
				titlecol 	: 1,
				titlevalue	: '합계',
				style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
				stylestartcol	: 1
			},
			datasorting	: true,
			usedecimal : false,
		};
		SBGridProperties2.columns = [
			{caption: ['구분'], 	ref: 'type', hidden: true},
			{caption: ['가구'], 	ref: 'BpltBxNm', width: '80px', type:'output',  	style:'text-align:center'},
			{caption: ['수량'], 	ref: 'Bqntt', width: '100px', type:'input',  	style:'text-align:center'},
			{caption: ['팔레트'],	ref: 'PpltBxNm', width: '80px', type:'output',  	style:'text-align:center'},
			{caption: ['수량'], 	ref: 'Pqntt', width: '100px', type:'input',  	style:'text-align:center'},
			{caption: ['출고지'],		ref: 'rmrk', width: '100px', type:'input',  	style:'text-align:center'},
		]

		grdDtBxPlt = _SBGrid.create(SBGridProperties2);
		grdDtBxPlt.bind("beforeedit",'fn_qnttDisable');
		grdDtBxPlt.bind('valuechanged', 'fn_grdPltBoxChanged');
	}

	const fn_qnttDisable = function() {
		const lastFocusGrd = _SBGrid.getLastFocusGrid();
		let currentGrd = lastFocusGrd === 'grdPltBox' ? grdPltBox : grdDtBxPlt;

		// 현재 그리드의 row, col, ref 가져오기
		const nRow = currentGrd.getRow();
		const nCol = currentGrd.getCol();
		const ref = currentGrd.getRefOfCol(nCol);

		// Bqntt 또는 Pqntt 컬럼이 아닌 경우
		if (ref !== 'Bqntt' && ref !== 'Pqntt' && ref !== 'rmrk') {
			return;
		}

		// 이전 컬럼에 박스/팔레트 명이 없을때
		if (ref === 'Bqntt' || ref === 'Pqntt') {
			const name = currentGrd.getCellData(nRow, nCol - 1);
			if (!name) {
				currentGrd.stopEditing();
				return;
			}
		}

		/** 25.10.14 출고시 팔레트불출관리 입고행 수량 입력 X */
		// 출고일 경우
		const wrhsSpmtType = SBUxMethod.get("dtl-slt-wrhsSpmtType");
		if (wrhsSpmtType === "DT") {
			const type = currentGrd.getCellData(nRow, 0);
			if (type === "입고") {
				currentGrd.stopEditing();
			}
		}
	};

	const fn_grdPltBoxChanged = function () {
		const lastFocusGrd = _SBGrid.getLastFocusGrid();
		let currentGrd = lastFocusGrd === 'grdPltBox' ? grdPltBox : grdDtBxPlt;

		const nRow = currentGrd.getRow();
		const nCol = currentGrd.getCol();
		const rmrkCol = currentGrd.getColRef('rmrk');
		const getRowData = currentGrd.getRowData(nRow);
		const getCellData = currentGrd.getCellData(nRow, nCol);
		const getRmrkData = currentGrd.getCellData(nRow, rmrkCol);

		/** 가구/팔레트 수량 변경 */
		let itemCd = SBUxMethod.get('dtl-slt-itemCd');
		if (itemCd === "dtPlt") {
			let bxQntt = jsonDtBxPlt[jsonDtBxPlt.length - 1].Bqntt
			let pltQntt = jsonDtBxPlt[jsonDtBxPlt.length - 1].Pqntt;

			SBUxMethod.set("dtl-inp-bxQntt", bxQntt);
			SBUxMethod.set("dtl-inp-pltQntt", pltQntt);
		}

		/** 입/출고지 디폴트값 설정 */
		let defaultWrhs = '거산APC';
		let defaultSpmt = SBUxMethod.get("dtl-inp-prdcrNm") || '';

		let setRmrk = '';

		// 입/출고 입력 변경 X
		if (nCol === rmrkCol || !gfn_isEmpty(getRmrkData)) {
			return;
		}

		if (!gfn_isEmpty(getCellData)) {
			switch (getRowData.type) {
				case '입고':
					setRmrk = defaultWrhs;
					break;
				case '출고':
					setRmrk = defaultSpmt;
					break;
				default:
					break;
			}
		}

		currentGrd.setCellData(nRow, rmrkCol, setRmrk);
	}

	const fn_modalDrag = async function(){
		// 드래그 기능
		let isDragging = false;
		let offsetX, offsetY;
		let modalContent = document.getElementById("pltBxModal");

		modalContent.addEventListener('mousedown', function(e) {
			isDragging = true;
			$("#closeModal").css("cursor","grabbing");
			offsetX = e.clientX - modalContent.getBoundingClientRect().left;
			offsetY = e.clientY - modalContent.getBoundingClientRect().top;
		});

		window.addEventListener('mousemove', function(e) {
			if (isDragging) {
				modalContent.style.left = e.clientX - offsetX + 'px';
				modalContent.style.top = e.clientY - offsetY + 'px';
			}
		});

		window.addEventListener('mouseup', function() {
			isDragging = false;
			$("#closeModal").css("cursor","grab");
		});
	}
	const fn_addRow = async function(){
		let columns = grdVrty.getColumns();
		let initJson = [];
		jsonGrdCd.forEach(function(item) {
			let rowVo = {'grdCd' : item.grdCd};

			columns.forEach(function (item) {
				if(item.ref !== 'grdCd'){
					rowVo[item.ref] = '';
				}
				rowVo['apcCd'] = gv_selectedApcCd;	// merge 기준값 추가
				rowVo['warehouseSeCd'] = jsonComWarehouse[0].value;	// 저장창고 초기 세팅값
			});
			initJson.push(rowVo);
		});

		jsonVrty = [...initJson];
		grdVrty.rebuild();
	}

	/**
	 * @name fn_warehouseModal
	 * @description 저장창고 선택 Modal
	 */
	const fn_warehouseModal = async function(){
		const displayValue = $('#warehouseModal').css('display');

		if(displayValue === 'none'){
			// 오버레이 생성
			let overlay = document.getElementById('modal-overlay');
			if (!overlay) {
				overlay = document.createElement('div');
				overlay.id = 'modal-overlay';
				document.body.appendChild(overlay);
			}
			// 오버레이와 모달 표시
			$("#modal-overlay").css("display","block");
			$("#warehouseModal").css("display","block");

			// 오버레이 클릭 방지
			overlay.addEventListener('click', (e) => e.stopPropagation());
		}else{
			$("#warehouseModal").css("display","none");
			$("#modal-overlay").css("display","none");
		}
	}
	const fn_createWarehouseGrid = function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-warehouse';
		SBGridProperties.id = 'grdWarehouse';
		SBGridProperties.jsonref = 'jsonWarehouse';
		SBGridProperties.rowheight = '30';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;

		let columns = [
			{caption: ['품종'], 	ref: 'vrtyNm', width: '80px', type:'output',  	style:'text-align:center'},
		]

		for(var i=0; i<jsonGrdCd.length; i++) {
			columns.push(
					{caption: [jsonGrdCd[i].grdNm], ref: jsonGrdCd[i].grdCd, width: '60px', datatype : 'number',type: 'output', style:'text-align:center', format : {type:'number', rule:'###.## '}, merge: false},
			);
		}

		columns.push(
				{caption: ["저장창고"], ref: 'warehouseSeCd', type: 'combo', width: '100px', style: 'text-align:center', typeinfo: {ref: 'jsonComWarehouse', label: 'label', value: 'value', oneclickedit: true, displayui: true}}
		);

		SBGridProperties.columns = columns;
		grdWarehouse = _SBGrid.create(SBGridProperties);
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>