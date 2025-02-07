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
						id="btnDocRawMtrWgh"
						name="btnDocRawMtrWgh"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_docRawMtrWgh"
						text="계량확인서"
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
						<%@ include file="../../../frame/inc/apcSelect.jsp" %>
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
								<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
								<td colspan="2" class="td_input" style="border-right:hidden; border-top: hidden" >
									<sbux-datepicker
											id="dtl-dtp-wghYmd"
											name="dtl-dtp-wghYmd"
											uitype="popup"
											date-format="yyyy-mm-dd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
									></sbux-datepicker>
								</td>
								<td colspan="2" style="border-top: hidden"></td>
								<th scope="row" class="th_bg"><span class="data_required" ></span>차량번호</th>
								<td class="td_input" style="border-right: hidden; border-top: hidden">
									<sbux-input
											uitype="text"
											id="dtl-inp-vhclno"
											name="dtl-inp-vhclno"
											class="form-control input-sm inpt_data_reqed"
											autocomplete="off"
									></sbux-input>
								</td>
								<td colspan="3" class="td_input"  style="border-top: hidden">
									<sbux-button id="btnSrchVhclno" name="btnSrchVhclno" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
								</td>
								<th scope="row" class="th_bg" ><span class="data_required" ></span>생산자</th>
								<td class="td_input" style="border-right:hidden; border-top: hidden">
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
											autocomplete-select-callback="fn_onSelectPrdcrNm"
									></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden; border-top: hidden">
									<sbux-input
											uitype="text"
											id="dtl-inp-prdcrIdentno"
											name="dtl-inp-prdcrIdentno"
											class="form-control input-sm"
											maxlength="2"
											autocomplete="off"
											onkeyup="fn_noKeyup"
											onchange="fn_onChangeSrchPrdcrIdentno(this)"
									/>
								</td>
								<td colspan="2" class="td_input" style=" border-top: hidden">
									<sbux-button
											id="btnSrchPrdcr"
											name="btnSrchPrdcr"
											class="btn btn-xs btn-outline-dark"
											text="찾기"
											uitype="modal"
											target-id="modal-prdcr"
											onclick="fn_choicePrdcr"
									></sbux-button>
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
										<div style="flex: 1">
											<sbux-input
													uitype="text"
													id="dtl-inp-wholWghtTime"
													name="dtl-inp-wholWghtTime"
													class="form-control input-sm input-sm-ast"
													autocomplete="off"
													readonly
											></sbux-input>
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
													onchange="fn_onChangeEmptVhclWght"
											></sbux-input>
										</div>
										<div style="display: flex; align-items: center">
											KG
										</div>
										<div style="flex: 1">
											<sbux-input
													uitype="text"
													id="dtl-inp-emptVhclWghtTime"
													name="dtl-inp-emptVhclWghtTime"
													class="form-control input-sm input-sm-ast"
													autocomplete="off"
													readonly
											></sbux-input>
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
								<%--							<td class="td_input" style="border-right: hidden;">--%>
								<%--								<sbux-input--%>
								<%--									uitype="text"--%>
								<%--									id="dtl-inp-emptVhclWght"--%>
								<%--									name="dtl-inp-emptVhclWght"--%>
								<%--									class="form-control input-sm input-sm-ast inpt_data_reqed"--%>
								<%--									maxlength="6"--%>
								<%--									autocomplete="off"--%>
								<%--									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"--%>
								<%--									onchange="fn_onChangeEmptVhclWght"--%>
								<%--								></sbux-input>--%>
								<%--							</td>--%>
								<%--							<td>Kg</td>--%>
								<%--							<td class="td_input" style="border-right:hidden;" >--%>
								<%--								<sbux-input--%>
								<%--									uitype="text"--%>
								<%--									id="dtl-inp-emptVhclWghtTime"--%>
								<%--									name="dtl-inp-emptVhclWghtTime"--%>
								<%--									class="form-control input-sm input-sm-ast"--%>
								<%--									autocomplete="off"--%>
								<%--									readonly--%>
								<%--								></sbux-input>--%>
								<%--							</td>--%>
								<%--							<td>--%>
								<%--								<sbux-button--%>
								<%--									id="btnEmptVhcl"--%>
								<%--									name="btnEmptVhcl"--%>
								<%--									class="btn btn-xs btn-outline-dark"--%>
								<%--									text="측정"--%>
								<%--									uitype="normal"--%>
								<%--									onclick="fn_emptVhcl"--%>
								<%--								></sbux-button>--%>
								<%--							</td>--%>
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
											class="form-control input-sm"
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
											class="form-control input-sm"
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
								<th scope="row" class="th_bg">비고</th>
								<td colspan="4" class="td_input" style="border-right:hidden;" >
									<sbux-input
											uitype="text"
											id="dtl-inp-rmrk"
											name="dtl-inp-rmrk"
											class="form-control input-sm"
											style="width: 80%"
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
								<th scope="row" class="th_bg">출고가구</th>
								<td class="td_input" style="border-right:hidden;" >
									<sbux-input
											uitype="text"
											id="dtl-inp-shpgotQntt"
											name="dtl-inp-shpgotQntt"
											class="form-control input-sm"
											mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									></sbux-input>
								</td>
								<td colspan="3"></td>
								<th scope="row" class="th_bg">출고팔레트</th>
								<td class="td_input" style="border-right:hidden;" >
									<sbux-input
											uitype="text"
											id="dtl-inp-shpgotPltQntt"
											name="dtl-inp-shpgotPltQntt"
											class="form-control input-sm"
											mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									></sbux-input>
								</td>
								<td colspan="3"></td>
								<th scope="row" class="th_bg">작업자</th>
								<td colspan="4" class="td_input">
									<sbux-input
											uitype="text"
											id="dtl-inp-oprtrNm"
											name="dtl-inp-oprtrNm"
											class="form-control input-sm"
											style="width:80%"
									></sbux-input>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdVrty" style="width:100%;height:132px;"></div>
				</div>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>원물계량 내역</span>
							<span style="font-size:12px">(기준일자 :
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label> , 조회건수 <span id="cnt-wgh">0</span>건)
							</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:298px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
			<div id="wsarea">
				<button style="position: absolute; top: 5px; right: 10px" onclick="$('#wsarea').css('display','none');">X</button>
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

    <!-- 원물계량연계 Modal -->
    <div>
        <sbux-modal
            id="modal-apcLinkPop"
            name="modal-apcLinkPop"
            uitype="middle"
            header-title="원물연계수신"
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

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
	}
	async function cfn_add() {

	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}


	let prvRowNum = -1;

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

    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 		'WAREHOUSE_SE_CD',	gv_selectedApcCd),	// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, 			gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, 			gv_selectedApcCd),						// 품종
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,  		'GDS_SE_CD', 		gv_selectedApcCd), 	// 상품구분 등록
			gfn_setComCdSBSelect('dtl-slt-fcltCd',			jsonComFcltCd, 			'WGH_FCLT_CD', 		gv_selectedApcCd),	// 설비
		 	gfn_setComCdSBSelect('dtl-slt-wrhsSpmtType',	jsonComWrhsSpmtType, 	'WRHS_SPMT_TYPE'),	// 입고출고유형
		]);

		jsonComWrhsSpmtType = jsonComWrhsSpmtType.filter(item => item.value !== 'TF');
		jsonGrdWrhsSpmtType = jsonGrdWrhsSpmtType.filter(item => item.value !== 'TF');

		SBUxMethod.set('dtl-rdo-gdsSeCd', '1');

		SBUxMethod.refresh('dtl-slt-wrhsSpmtType');

		if (jsonApcItem.length == 1) {
			fn_onChangeSrchItemCd({value: jsonApcItem[0].itemCd});
			SBUxMethod.set("dtl-slt-itemCd", jsonApcItem[0].itemCd);
		}

		if (gv_selectedApcCd == '0669') {
			SBUxMethod.set('dtl-slt-wrhsSpmtType', 'RT');
		}

		SBUxMethod.set('dtl-dtp-wghYmd', gfn_dateToYmd(new Date()));
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_init = async function() {
		//fn_reset();
		fn_createWghPrfmncGrid();

		fn_initSBSelect();
		fn_getPrdcrs();
		ws.init();
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	var grdVrty;
	var jsonVrty = [];

	const fn_createWghPrfmncGrid = function() {
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.total = {
      		  type 		: 'grand',
      		  position	: 'bottom',
      		  columns		: {
      		      standard : [1,2],
      		      sum : [7, 8, 9, 11, 12],
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
            {caption: ['계량대'], 		ref: 'fcltNm', 		width: '80px', type:'output',  	style:'text-align:center;'},
            {caption: ['구분'], 		ref: 'wrhsSpmtTypeNm', width: '60px', type:'output',  	style:'text-align:center'},
            {caption: ['입고일자'], 	ref: 'wghYmd', 		width: '80px', type : 'output', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
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


	const fn_view = async function () {

		let nRow = grdWghPrfmnc.getRow();

		if (nRow < 1) {
			return;
		}

		let rowData = grdWghPrfmnc.getRowData(nRow);
		let wrhsSpmtType = rowData.wrhsSpmtType;

		SBUxMethod.set('dtl-dtp-wghYmd', rowData.wghYmd);
      	SBUxMethod.set('dtl-inp-wghno', rowData.wghno);
 		SBUxMethod.set('dtl-inp-prdcrCd', rowData.prdcrCd);
 		SBUxMethod.set('dtl-inp-prdcrNm', rowData.prdcrNm);
 		SBUxMethod.set('dtl-inp-vhclno', rowData.vhclno);
 		SBUxMethod.set('dtl-inp-wholWght', rowData.wholWght);
 		SBUxMethod.set('dtl-inp-emptVhclWght', rowData.emptVhclWght);
 		SBUxMethod.set('dtl-inp-actlWght', rowData.actlWght);
 		SBUxMethod.set('dtl-slt-itemCd', rowData.itemCd);
 		SBUxMethod.set('dtl-slt-fcltCd', rowData.fcltCd);
 		SBUxMethod.set('dtl-slt-wrhsSpmtType', rowData.wrhsSpmtType);
 		SBUxMethod.set('dtl-inp-bxQntt', rowData.bxQntt);
 		SBUxMethod.set('dtl-inp-pltQntt', rowData.pltQntt);
 		SBUxMethod.set('dtl-inp-trsprtCst', rowData.trsprtCst || "");
 		SBUxMethod.set('dtl-inp-rmrk', rowData.rmrk || "") ;
 		SBUxMethod.set('dtl-inp-oinstSpmtNm', rowData.oinstSpmtNm || "");
 		SBUxMethod.set('dtl-inp-shpgotQntt', rowData.shpgotQntt || "");
 		SBUxMethod.set('dtl-inp-shpgotPltQntt', rowData.shpgotPltQntt || "");
 		SBUxMethod.set('dtl-inp-oprtrNm', rowData.oprtrNm || "");

 		if (wrhsSpmtType == "RT") {
 			url = "/am/wgh/selectWghRcptWrhsDtlList.do"
 		}
 		if (wrhsSpmtType == "DT") {
 			url = "/am/wgh/selectWghRcptSpmtDtlList.do"
 		}

		const postJsonPromise = gfn_postJSON(url, rowData);

  		try {

  			const data = await postJsonPromise;
	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

      		jsonVrty.length = 0;
      		jsonWghDtlPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {

          		let vrtyCd = item.vrtyCd
          		let vrtyCdCol = grdVrty.getColRef(vrtyCd);


          		for (var i=1; i<=jsonGrdCd.length; i++) {

          			let grdCdKey = "grdCd" + i;
          			let grdQnttKey = "grdQntt" + i;
          			let grdCd = item[grdCdKey];

         			grdVrty.setCellData(i, vrtyCdCol, item[grdQnttKey], true);
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


	}

	/**
     * @name fn_docRawMtrWgh
     * @description 계량확인서 발행 버튼
     */
	const fn_docRawMtrWgh = function() {

		const wghnoList = [];
		const allData = grdWghPrfmnc.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				wghnoList.push(item.wghno);
    		}
		});

 		if (wghnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

		const wghno = wghnoList.join("','");
		gfn_popClipReport("계량확인서", "am/rawMtrWghDoc_0669.crf", {apcCd: gv_selectedApcCd, wghno: wghno});
	}

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
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
		SBUxMethod.set('dtl-dtp-wghYmd', gfn_dateToYmd(new Date()));
  		SBUxMethod.set('dtl-inp-prdcrCd', '');
  		SBUxMethod.set('dtl-inp-prdcrNm', '');
  		SBUxMethod.set('dtl-inp-vhclno', '');
  		SBUxMethod.set('dtl-inp-wholWght', 0);
  		SBUxMethod.set('dtl-inp-emptVhclWght', 0);
  		SBUxMethod.set('dtl-inp-actlWght', 0);

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
  		SBUxMethod.set('dtl-inp-oprtrNm', '');
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 	jsonApcVrty, 	gv_selectedApcCd, itemCd),			// 품종
			gfn_setApcGdsGrdSBSelect('grdVrty', 		jsonGrdCd, 		gv_selectedApcCd, itemCd, "01"),	// 등급
		]);
		console.log(jsonApcVrty,"?");
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
	        let columns = [{caption: ['등급'], ref: 'grdCd', width: '80px', type:'combo',  	style:'text-align:center',
    			typeinfo : {ref:'jsonGrdCd', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},];

	        for(var i=0; i<jsonApcVrty.length; i++) {

	        	columns.push(
	        			{caption: [jsonApcVrty[i].vrtyNm], ref: jsonApcVrty[i].vrtyCd, width: '100px', type: 'input', style:'text-align:right', format : {type:'number', rule:'###.## '}},
	        		)
	        }
			SBGridProperties.columns = columns;

	        grdVrty = _SBGrid.create(SBGridProperties);
	        grdVrty.bind('valuechanged', 'fn_grdQnttChanged');

	        for (var j=0; j<jsonGrdCd.length; j++) {
	        	grdVrty.addRow(true, {'grdCd': jsonGrdCd[j].grdCd});
	        }

	        grdVrty.refresh();
		}

	}

	const fn_grdQnttChanged = function () {

		let nRow = grdVrty.getRow();

		if (nRow < 1) {
			return;
		}

		let vrtyList = grdVrty.getGridDataAll();
		let total = 0;
		for (var i=1; i<=vrtyList.length; i++) {

			let rowData = grdVrty.getRowData(i);

			for (var j=0; j<jsonApcVrty.length; j++) {
				let vrtyCdKey = jsonApcVrty[j].vrtyCd;
				let vrtyQntt = rowData[vrtyCdKey] || 0;

				if (vrtyQntt > 0) {
					total += parseInt(vrtyQntt);
				}
			}
		}
		SBUxMethod.set("dtl-inp-bxQntt", total);

	}

	/**
     * @name fn_setGrdWghPrfmnc
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_search = async function () {

  		let wghYmd 			= SBUxMethod.get("dtl-dtp-wghYmd");		// 계량일자
  		let itemCd 			= SBUxMethod.get("dtl-slt-itemCd");		// 품목
  		let wrhsSpmtType 	= SBUxMethod.get("dtl-slt-wrhsSpmtType");	// 입고출고유형
 		let url 			= "";

  		if (gfn_isEmpty(wrhsSpmtType)) {
    		gfn_comAlert("W0001", "구분");					//	W0001	{0}을/를 선택하세요.
            return;
    	}

 		if (wrhsSpmtType == "RT") {
 			url = "/am/wgh/selectWghRcptWrhsList.do"
 		}
 		if (wrhsSpmtType == "DT") {
 			url = "/am/wgh/selectWghRcptSpmtList.do"
 		}


		const postJsonPromise = gfn_postJSON(url, {
				apcCd			: gv_selectedApcCd
			  , wghYmd			: wghYmd
			  , itemCd 			: itemCd
			  , wrhsSpmtType 	: wrhsSpmtType
  		});

  		try {

  			const data = await postJsonPromise;
	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

          	/** @type {number} **/
      		let totalRecordCount = 0;
      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = item;
  				const vrtyArray = item.vrtyNm.split(",");
  				const set = new Set(vrtyArray);
  				const uniqueArr = [...set];
  				const vrtyNm = uniqueArr.join(", ");
  				wghPrfmnc.vrtyNm = vrtyNm;
  				jsonWghPrfmnc.push(wghPrfmnc);
  			});

          	if (jsonWghPrfmnc.length == 0) {
          		grdWghPrfmnc.refresh();
          	} else {
	          	grdWghPrfmnc.rebuild();
          	}
		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


     /**
 	 * @name fn_whol
 	 * @description 전체중량 이벤트
 	 */
 	const fn_save = async function () {

 		let wghYmd 			= SBUxMethod.get('dtl-dtp-wghYmd');
 		let wghno 			= SBUxMethod.get('dtl-inp-wghno');
 		let prdcrCd 		= SBUxMethod.get('dtl-inp-prdcrCd');
 		let vhclno 			= SBUxMethod.get('dtl-inp-vhclno');
 		let wholWght 		= SBUxMethod.get('dtl-inp-wholWght');
 		let emptVhclWght 	= SBUxMethod.get('dtl-inp-emptVhclWght');
 		let actlWght 		= SBUxMethod.get('dtl-inp-actlWght');
 		let itemCd 			= SBUxMethod.get('dtl-slt-itemCd');
 		let fcltCd 			= SBUxMethod.get('dtl-slt-fcltCd');
 		let wrhsSpmtType 	= SBUxMethod.get('dtl-slt-wrhsSpmtType');
 		let bxQntt 			= SBUxMethod.get('dtl-inp-bxQntt');
 		let pltQntt 		= SBUxMethod.get('dtl-inp-pltQntt');

 		if (gfn_isEmpty(wghYmd)) {
    		gfn_comAlert("W0001", "계량일자");					//	W0001	{0}을/를 선택하세요.
            return;
    	}

 		if (gfn_isEmpty(vhclno)) {
    		gfn_comAlert("W0002", "차량번호");					//	W0002	{0}을/를 입력하세요.
            return;
    	}



 		let trsprtCst 		= SBUxMethod.get('dtl-inp-trsprtCst') || 0;
 		let rmrk 			= SBUxMethod.get('dtl-inp-rmrk') || "";
 		let oinstSpmtNm 	= SBUxMethod.get('dtl-inp-oinstSpmtNm') || "";
 		let shpgotQntt 		= SBUxMethod.get('dtl-inp-shpgotQntt') || "";
 		let shpgotPltQntt 	= SBUxMethod.get('dtl-inp-shpgotPltQntt') || "";
 		let oprtrNm 		= SBUxMethod.get('dtl-inp-oprtrNm') || "";

		let vrtyList = grdVrty.getGridDataAll();

		let wghPrfmnc = {
				apcCd			: gv_selectedApcCd
			  , wghno			: wghno
			  ,	wghYmd 			: wghYmd
			  , prdcrCd			: prdcrCd
			  , vhclno			: vhclno
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
		}

		let multiList = [];
		let wghSnArray = [];

		for (var i=1; i<=vrtyList.length; i++) {
			let rowData = JSON.parse(JSON.stringify(grdVrty.getRowData(i)));

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

						multiList.push(wghPrfmncVO);
					}
				} else {

					wghPrfmncVO.vrtyCd = vrtyCdKey;
					wghPrfmncVO.bxQntt = vrtyQntt;
					wghPrfmncVO.grdCd = rowData.grdCd;
					wghPrfmncVO.groupId = 1;
					wghPrfmncVO.rowSts = 'U';

					for (var k=1; k<=4; k++) {
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
						multiList.push(wghPrfmncVO);
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

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wgh/multiWghPrfmncList.do", multiList);
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
	const fn_whol = function () {
		let wght = $("#nowWght").text();
		wght = parseFloat(wght) || 0;
		let now = new Date();
		const formattedDate = now.toLocaleString('ko-KR');
		SBUxMethod.set('dtl-inp-wholWght', wght);
		SBUxMethod.set('dtl-inp-wholWghtTime', formattedDate);
	}

	/**
	 * @name fn_whol
	 * @description 공차중량 이벤트
	 */
	const fn_emptVhcl = function () {
		let wght = $("#nowWght").text();
		wght = parseFloat(wght) || 0;
		let now = new Date();
		const formattedDate = now.toLocaleString('ko-KR');
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
			SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
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
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);

		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
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
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("dtl-inp-vhclno", prdcr.vhclno);
		}
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("dtl-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("dtl-inp-prdcrIdentno", "");
		}
	}


	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("dtl-inp-vhclno"));
	}
	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("dtl-inp-vhclno", vhcl.vhclno);
		}
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

	function fn_noKeyup(event) {

	}

	const fn_popApcLinkCallBack = function() {

    }

     const fn_popApcLink = function() {
         popApcLink.init(
                     {
                         apcCd: gv_selectedApcCd,
                         apcNm: gv_selectedApcNm,
                         linkKnd: "W",
                         kndList: ["W", "R"]
                     },
                     fn_popApcLinkCallBack
                 );
     }

	const ws = {
		socket: null,
		isConnected: false,
		isReconnecting: false,
		reconnectInterval: 30000,
		init: function() {
			this.socket = new WebSocket("ws://localhost:9090/ws");

			this.socket.onopen = () => {
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
				let wght = parseInt(event.data).toLocaleString('en-US');
				$("#nowWght").text(wght);
				$("#nowWght").css("color","blue");
			};

			this.socket.onerror = (error) => {
				this.isConnected = false;
			};

			this.socket.onclose = () => {
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
				console.log(`웹소켓 재연결 시도 중... (${'${this.reconnectInterval / 1000}'}초 간격)`);
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
	// function addWghtInput(){
	// 	$("body > section > div > div.box-body.srch-keyup-area > table:nth-child(1) > tbody > tr td").last().remove();
	// 	$("body > section > div > div.box-body.srch-keyup-area > table:nth-child(1) > tbody > tr").append(`<th class='th_bg'>계량정보</th><td class='td_input' colspan="8"><span id="nowWght">수신중..</spna></td>`)
	// }
	// addWghtInput();
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>