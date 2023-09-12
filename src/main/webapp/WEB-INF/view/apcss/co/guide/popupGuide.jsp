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
								<sbux-input id="vrty-inp-vrtyNm" name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<td></td>
							<th scope="row" >생산자선택</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(dtl-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
								<sbux-input id="prdcr-inp-prdcrCd" name="prdcr-inp-prdcrCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPrdcr" name="btnSrchPrdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_choicePrdcr"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >팔레트/박스 선택</th>
							<td class="td_input">
								<sbux-input id="pltBx-inp-pltNm" name="pltBx-inp-pltNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input id="pltBx-inp-bxNm" name="pltBx-inp-bxNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
							</td>
							<th scope="row" >거래처선택</th>
							<td class="td_input">
								<sbux-input id="cnpt-inp-cnptNm" name="cnpt-inp-cnptNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >마감등록</th>
							<td>
								<sbux-button id="btnRegDdln" name="btnRegDdln" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-ddln" onclick="fn_regDDln"></sbux-button>
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >차량선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
							<td></td>

							<th scope="row" >원물운임비용</th>
							<td class="td_input">
								<sbux-input id="srch-inp-trsprtCst" name="srch-inp-trsprtCst" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchTrsprtCst" name="btnSrchTrsprtCst" class="btn btn-xs btn-outline-dark" text="등록" uitype="modal" target-id="modal-trsprtCst" onclick="fn_choiceTrsprtCst"></sbux-button>
							</td>
							<td class="td_input">
							</td>
							<th scope="row" >출하지시번호</th>
							<td class="td_input">
								<sbux-input id="srch-inp-spmtCmndno" name="srch-inp-spmtCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSpmtCmndNo" name="btnSrchSpmtCmndNo" uitype="modal" text="찾기" class="btn btn-xs btn-outline-dark" target-id="modal-spmtCmndno" onclick="fn_modalSpmtCmndno"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gds" onclick="fn_modalGds" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >입고일자</th>
							<td class="td_input">
								<sbux-datepicker id="srch-dtp-trsprtYmd" name="srch-dtp-trsprtYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="../../am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup.jsp"></jsp:include>
    </div>

    <!-- 품종 선택 Modal -->
     <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
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
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>
    
    <!-- 마감 등록 Modal -->
    <div>
        <sbux-modal id="modal-ddln" name="modal-ddln" uitype="middle" header-title="마감 등록" body-html-id="body-modal-ddln" footer-is-close-button="false" style="width:700px"></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/regDdlnPopup.jsp"></jsp:include>
    </div>
    
    <!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmndno" name="modal-spmtCmndno" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmndno" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmndno">
    	<jsp:include page="../../am/popup/spmtCmndnoPopup.jsp"></jsp:include>
    </div>
    
     <!-- 상품 선택 Modal -->
    <div>
        <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gds">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/gdsPopup.jsp"></jsp:include>
    </div>

<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_getPrdcrs();
		SBUxMethod.set("srch-dtp-trsprtYmd", gfn_dateToYmd(new Date()));
	})

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
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
		}
	}
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("dtl-inp-prdcrCd", value);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
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


	/* 원물운임비용등록 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 원물운임비용 호출
	 */
	const fn_choiceTrsprtCst = function() {
		let trsprtYmd = SBUxMethod.get("srch-dtp-trsprtYmd");
		let vhclno = SBUxMethod.get("srch-inp-vhclno");
		popTrsrptCst.init(gv_selectedApcCd, gv_selectedApcNm, trsprtYmd, vhclno, fn_setTrsprtCst);
	}

	/**
	 * @name fn_setVhcl
	 * @description 원물운임비용 선택 callback
	 */
	const fn_setTrsprtCst = function(trsprtCst) {
		if (!gfn_isEmpty(trsprtCst)) {
			SBUxMethod.set("srch-inp-vhclno", trsprtCst.vhclno);   // callBack input
			SBUxMethod.set("srch-inp-trsprtCst", trsprtCst.trsprtCst);   // callBack input
		}
	}
	/* End */
	
	
	/* 마감등록 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_regDDln
	 * @description 마감등록 호출
	 */
	const fn_regDDln = function() {
		fn_modalDdln(gv_selectedApcCd, gv_selectedApcNm);
	}
	/* End */

	/*
	* 품종 선택 팝업 시작
	*/
	
    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
    	//_apcCd, _apcNm, _itemNm, _callbackFnc
	}
    

     const fn_setVrty = function(vrty) {

		if (!gfn_isEmpty(vrty)) {
			console.log("vrty", vrty);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
// 			console.log("vrtys", vrtys);
// 			console.log("vrtys[2]", vrtys[2]);
			var _vrtys = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
// 				SBUxMethod.setValue('srch-inp-vrtyCd', vrtys[i].vrtyNm);
// 				SBUxMethod.set('srch-inp-vrtyCd', vrtys[i].vrtyNm);
// 				console.log("vrtys", _vrtys);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}
     
     /*
     * 품종 선택 팝업 끝
     */
     
     /*
     * 거래처 선택 팝업 시작
     */
 	// 거래처 선택 팝업 호출
 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}
 	
 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			console.log("cnpt", cnpt);
 			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
 			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
 		}
 	}
 	/*
 	* 거래처 선택 팝업 끝
 	*/
	
 	/*
     * 출하지시번호 선택 팝업 시작
     */
 	// 출하지시번호 선택 팝업 호출
	const fn_modalSpmtCmndno = function() {
    	popSpmtCmndno.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSpmtCmndno);
	}
	
	const fn_setSpmtCmndno = function(spmtCmndno) {
		if (!gfn_isEmpty(spmtCmndno)) {
			SBUxMethod.set('srch-inp-spmtCmndno', spmtCmndno.spmtCmndno);
		}
	}
	/*
 	* 출하지시번호 선택 팝업 끝
 	*/
 	
 	/*
     * 상풍 선택 팝업 시작
     */
 	// 상품 선택 팝업 호출
	const fn_modalGds = function() {
    	popGds.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-gdsNm"), fn_setGdsNm);
	}
	
	const fn_setGdsNm = function(gds) {
		if (!gfn_isEmpty(gds)) {
			SBUxMethod.set('srch-inp-gdsNm', gds.gdsNm);
		}
	}
	/*
 	* 상풍 선택 팝업 끝
 	*/
</script>
</body>
</html>