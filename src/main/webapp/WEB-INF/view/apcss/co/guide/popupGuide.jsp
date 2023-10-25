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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 팝업</h3>
				</div>
				<div style="margin-left: auto;">
				</div>
			</div>
			<div class="box-body">
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" >품목선택</th>
							<td class="td_input">
								<sbux-input id="item-inp-itemNm" name="item-inp-itemNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchItem" name="btnSrchItem" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-itemCrtr" onclick="fn_modalItem"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >품종선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" class="form-control input-sm" maxlength="33" uitype="text"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >생산자선택</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									maxlength="33"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >팔레트/박스 선택</th>
							<td class="td_input">
								<sbux-input
									id="srch-inp-pltWght"
									name="srch-inp-pltWght"
									uitype="text"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									id="srch-inp-bxWght"
									name="srch-inp-bxWght"
									uitype="text"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
							</td>
							<th scope="row" >거래처선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >마감등록</th>
							<td class="td_input">
								<sbux-button id="btnRegDdln" name="btnRegDdln" class="btn btn-xs btn-outline-dark" text="마감등록" uitype="modal" target-id="modal-ddln" onclick="fn_regDDln"></sbux-button>
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >차량선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" maxlength="8" class="form-control pull-right input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
							<td></td>

							<th scope="row" >원물운임비용</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="srch-inp-trsprtCst"
									name="srch-inp-trsprtCst"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true }"
								/>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchTrsprtCst" name="btnSrchTrsprtCst" class="btn btn-xs btn-outline-dark" text="등록" uitype="modal" target-id="modal-trsprtCst" onclick="fn_choiceTrsprtCst"></sbux-button>
							</td>
							<td class="td_input">
							</td>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gds" onclick="fn_modalGds" text="찾기"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >출하지시번호</th>
							<td class="td_input">
								<sbux-input id="srch-inp-spmtCmndno" name="srch-inp-spmtCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSpmtCmndNo" name="btnSrchSpmtCmndNo" uitype="modal" text="찾기" class="btn btn-xs btn-outline-dark" target-id="modal-spmtCmnd" onclick="fn_choiceSpmtCmnd"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >선별지시번호선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-sortCmndno" name="srch-inp-sortCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSortCmndno" name="btnSrchSortCmndno" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-sortCmndno" onclick="fn_modalSortCmndno" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >포장지시번호선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-pckgCmndno" name="srch-inp-pckgCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPckgCmndno" name="btnSrchPckgCmndno" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-pckgCmndno" onclick="fn_modalPckgCmndno" text="찾기"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >원물재고선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-rawMtrInvntr" name="srch-inp-rawMtrInvntr" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchRawMtrInvntr" name="btnSrchRawMtrInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-rawMtrInvntr" onclick="fn_modalRawMtrInvntr" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >선별재고선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-sortInvntr" name="srch-inp-sortInvntr" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSortInvntr" name="btnSrchSortInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-sortInvntr" onclick="fn_modalSortInvntr" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >상품재고선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-gdsInvntr" name="srch-inp-gdsInvntr" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchGdsInvntr" name="btnSrchGdsInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gdsInvntr" onclick="fn_modalGdsInvntr" text="찾기"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >생산작업자선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-flnm" name="srch-inp-flnm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchOprtr" name="btnSrchOprtr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-oprtr" onclick="fn_modalOprtr" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >입고일자</th>
							<td class="td_input">
								<sbux-datepicker id="srch-dtp-trsprtYmd" name="srch-dtp-trsprtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="6"></td>
						</tr>
					</tbody>
				</table>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="../../am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" header-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup.jsp"></jsp:include>
    </div>

    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>

    <!-- 원물운임비용등록 Modal -->
    <div>
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>

     <!-- 마감 등록 Modal -->
    <div>
        <sbux-modal id="modal-ddln" name="modal-ddln" uitype="middle" header-title="마감 등록" body-html-id="body-modal-ddln" footer-is-close-button="false" header-is-close-button="false" style="width:700px"></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/regDdlnPopup.jsp"></jsp:include>
    </div>

    <!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmnd">
    	<jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
    </div>

     <!-- 상품 선택 Modal -->
    <div>
        <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gds">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/gdsPopup.jsp"></jsp:include>
    </div>
    
     <!-- 생산작업자 선택 Modal -->
    <div>
        <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 선택" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-oprtr">
    	<jsp:include page="../../am/popup/oprtrPopup.jsp"></jsp:include>
    </div>
    
    <!-- 포장지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-pckgCmndno" name="modal-pckgCmndno" uitype="middle" header-title="포장지시번호 선택" body-html-id="body-modal-pckgCmndno" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-pckgCmndno">
    	<jsp:include page="../../am/popup/pckgCmndPopup.jsp"></jsp:include>
    </div>
    
    <!-- 선별재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-sortInvntr" name="modal-sortInvntr" uitype="middle" header-title="선별재고 선택" body-html-id="body-modal-sortInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-sortInvntr">
    	<jsp:include page="../../am/popup/sortInvntrPopup.jsp"></jsp:include>
    </div>
    
    <!-- 선별지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-sortCmndno" name="modal-sortCmndno" uitype="middle" header-title="선별지시번호 선택" body-html-id="body-modal-sortCmndno" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-sortCmndno">
    	<jsp:include page="../../am/popup/sortCmndnoPopup.jsp"></jsp:include>
    </div>
    
    <!-- 원물재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-rawMtrInvntr" name="modal-rawMtrInvntr" uitype="middle" header-title="원물재고 선택" body-html-id="body-modal-rawMtrInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-rawMtrInvntr">
    	<jsp:include page="../../am/popup/rawMtrInvntrPopup.jsp"></jsp:include>
    </div>
    
    <!-- 상품재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-gdsInvntr" name="modal-gdsInvntr" uitype="middle" header-title="상품재고 선택" body-html-id="body-modal-gdsInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gdsInvntr">
    	<jsp:include page="../../am/popup/gdsInvntrPopup.jsp"></jsp:include>
    </div>

<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_getPrdcrs();
		SBUxMethod.set("srch-dtp-trsprtYmd", gfn_dateToYmd(new Date()));
	})

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_getPrdcrs();
	}

	/* 생산자 팝업 호출 필수 json  */
	/* Start */
	var autoCompleteDataJson = [];
	var jsonDataPrdcr = [];
	var jsonPrdcr			= [];
	var jsonPrdcrAutocomplete = [];
	/* End */


	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 팝업 호출
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
		}
	}
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}
	/* End */


	/* 차량선택 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 차량선택팝업 호출
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	/**
	 * @name fn_setVhcl
	 * @description 차량 선택 callback
	 */
	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	/* End */


	/* 원물운임비용등록팝업 호출 필수 json  */
	/* Start */
	let vhclData = {vhclno : null, drvrNm : null, bankNm : null, bankCd : null, actno : null, dpstr : null};
	/* End */


	/* 원물운임비용등록팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 원물운임비용등록팝업 호출
	 */
	 const fn_choiceTrsprtCst = function() {
			//_trsprtYmd, _vhclno, _callbackFnc
			//
			let trsprtYmd = SBUxMethod.get("srch-dtp-trsprtYmd");
			let data = {
							apcCd 		: gv_selectedApcCd,
							trsprtYmd 	: null,
							vhclno 		: null,
				  			drvrNm 		: null,
				  			bankNm 		: null,
				  			bankCd 		: null,
				  			actno 		: null,
				  			dpstr 		: null,
							trsprtSeCd 	: null,
							wrhsWght 	: null
					    };
			if(!gfn_isEmpty(trsprtYmd)){
				data.trsprtYmd = trsprtYmd;
			} else {
				data.trsprtYmd = gfn_dateToYmd(new Date());
			}
			if(!gfn_isEmpty(SBUxMethod.get("srch-inp-vhclno"))){
				data.vhclno = vhclData.vhclno;
				data.drvrNm = vhclData.drvrNm;
				data.bankNm = vhclData.bankNm;
				data.bankCd = vhclData.bankCd;
				data.actno = vhclData.actno;
				data.dpstr = vhclData.dpstr;
			}
			popTrsrptCst.init(gv_selectedApcCd, gv_selectedApcNm, data, fn_setTrsprtCst);
		}

	/**
	 * @name fn_setVhcl
	 * @description 원물운임비용 선택 callback
	 */
	const fn_setTrsprtCst = function(trsprtCst) {
		if (!gfn_isEmpty(trsprtCst)) {
			SBUxMethod.set("srch-inp-trsprtCst", trsprtCst.trsprtCst);   // callBack input
		}
	}
	/* End */


	/* 마감등록팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_regDDln
	 * @description 마감등록팝업 호출
	 */
	const fn_regDDln = function() {
		fn_modalDdln(gv_selectedApcCd, gv_selectedApcNm);
	}
	/* End */


	/* 품종선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalVrty
	 * @description 품종선택팝업 호출
	 */
    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
    	//_apcCd, _apcNm, _itemNm, _callbackFnc
	}

    /**
	 * @name fn_setVrty
	 * @description 단일 품종 callback
	 */
    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('scrh-inp-vrtyNm', vrty.vrtyNm);
		}
	}

    /**
	 * @name fn_setVrtys
	 * @description 복수 품종 callback
	 */
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
			}
			SBUxMethod.set('scrh-inp-vrtyNm', _vrtys.join(','));
		}
	}
	/* End */


	/* 거래처선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalCnpt
	 * @description 거래처선택팝업 호출
	 */
 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}

 	/**
	 * @name fn_setCnpt
	 * @description 거래처 선택 callback
	 */
 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
 		}
 	}
 	/* End */


	/* 출하지시번호선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_choiceSpmtCmnd
	 * @description 출하지시번호선택팝업 호출
	 */
	 const fn_choiceSpmtCmnd = function() {
// 		 let searchData = {
// 			regSpmtList	: regSpmtList
// 		}
		
    	popSpmtCmnd.init(gv_apcCd, gv_apcNm, null, fn_setSpmtCmnd);
	}

	/**
	 * @name fn_setSpmtCmnd
	 * @description 출하지시번호 선택 callback
	 */
	const fn_setSpmtCmnd = function(spmtCmnd) {
		if (!gfn_isEmpty(spmtCmnd)) {
			SBUxMethod.set('srch-inp-spmtCmndno', spmtCmnd.spmtCmndno);
		}
	}
	/* End */


	/* 상품선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalGds
	 * @description 상품선택팝업 호출
	 */
	const fn_modalGds = function() {
    	popGds.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-gdsNm"), fn_setGdsNm);
	}

	/**
	 * @name fn_setGdsNm
	 * @description 상품 선택 callback
	 */
	const fn_setGdsNm = function(gds) {
		if (!gfn_isEmpty(gds)) {
			SBUxMethod.set('srch-inp-gdsNm', gds.gdsNm);
		}
	}
	/* End */

	/* 생산작업자 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalOprtr
	 * @description 생산작업자선택팝업 호출
	 */
	const fn_modalOprtr = function() {
		popOprtr.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-flnm"), fn_setFlnm);
	}

	/**
	 * @name fn_setFlnm
	 * @description 생산작업자 선택 callback
	 */
	const fn_setFlnm = function(oprtr) {
		if (!gfn_isEmpty(oprtr)) {
			SBUxMethod.set('srch-inp-flnm', oprtr.flnm);
		}
	}
	/* End */
	
	/* 포장지시번호 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalPckgCmndno
	 * @description 포장지시번호선택팝업 호출
	 */
	 const fn_modalPckgCmndno = function() {
		popPckgCmnd.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPckgCmnd);
	}

	/**
	 * @name fn_setPckgCmnd
	 * @description 포장지시번호 선택 callback
	 */
	 const fn_setPckgCmnd = function(pckgCmnd) {
		if (!gfn_isEmpty(pckgCmnd)) {
			SBUxMethod.set('srch-inp-pckgCmndno', pckgCmnd.pckgCmndno);
		}
	}
	/* End */
	
	/* 선별재고 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalSortInvntr
	 * @description 선별재고선택팝업 호출
	 */
	 const fn_modalSortInvntr = function() {
		popSortInvntr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortInvntr);
	}

	/**
	 * @name fn_setSortInvntr
	 * @description 선별재고 선택 callback
	 */
	 const fn_setSortInvntr = function(sortInvntr) {
		if (!gfn_isEmpty(sortInvntr)) {
			SBUxMethod.set('srch-inp-sortInvntr', sortInvntr.sortno);
		}
	}
	/* End */
	
	/* 선별지시번호 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalSortCmndno
	 * @description 선별지시번호선택팝업 호출
	 */
	 const fn_modalSortCmndno = function() {
		 popSortCmndno.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortCmndno);
	}

	/**
	 * @name fn_setSortCmndno
	 * @description 선별지시번호 선택 callback
	 */
	 const fn_setSortCmndno = function(sortCmndno) {
		if (!gfn_isEmpty(sortCmndno)) {
			SBUxMethod.set('srch-inp-sortCmndno', sortCmndno.sortCmndno);
		}
	}
	/* End */
	
	/* 원물재고 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalRawMtrInvntr
	 * @description 원물재고선택팝업 호출
	 */
	 const fn_modalRawMtrInvntr = function() {
		 popRawMtrInvntr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setRawMtrInvntr);
	}

	/**
	 * @name fn_setRawMtrInvntr
	 * @description 원물재고 선택 callback
	 */
	 const fn_setRawMtrInvntr = function(rawMtrInvntr) {
		if (!gfn_isEmpty(rawMtrInvntr)) {
			SBUxMethod.set('srch-inp-rawMtrInvntr', rawMtrInvntr.pltno);
		}
	}
	/* End */
	
	/* 상품재고 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalGdsInvntr
	 * @description 상품재고선택팝업 호출
	 */
	 const fn_modalGdsInvntr = function() {
// 		let searchData = {
// 			itemCd 		: SBUxMethod.get('srch-inp-itemCd'),
// 			vrtyCd 		: SBUxMethod.get('srch-inp-vrtyCd'),
// 			spcfctCd	: SBUxMethod.get('srch-inp-spcfctCd'),
// 			gdsGrd		: SBUxMethod.get('srch-inp-gdsGrd'),
// 			spmtGdsList	: spmtGdsList
// 		}
		
		popGdsInvntr.init(gv_apcCd, gv_apcNm, null, fn_setGdsInvntr);
	}

	/**
	 * @name fn_setGdsInvntr
	 * @description 상품재고 선택 callback
	 */
	 const fn_setGdsInvntr = function(gdsInvntr) {
		if (!gfn_isEmpty(gdsInvntr)) {
			SBUxMethod.set('srch-inp-gdsInvntr', gdsInvntr.pckgno);
		}
	}
	/* End */

	/* 생산자 팝업 호출 필수 json  */
	/* Start */
	var pltBxData = null;
	/* End */

	/* 원물입고 팔레트/박스 입고등록팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalPltBx
	 * @description 원물입고 팔레트/박스 입고등록팝업 호출
	 */
	const fn_modalPltBx = function() {
		popPltBx.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPltBx, pltBxData);
	}

	/**
	 * @name fn_setPltBx
	 * @description 팔레트 팝업 callback
	 */
	const fn_setPltBx = function(_pltBxData) {
		if (!gfn_isEmpty(_pltBxData)) {
			// 팔레트/박스 Kg set
			SBUxMethod.set("srch-inp-pltWght", _pltBxData.totalPltWght);
			SBUxMethod.set("srch-inp-bxWght", _pltBxData.totalBxWght);
			//정산중량 Kg set
			//fn_setClclnWght();
		}
	}
	/* End */
</script>
</body>
</html>