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
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrtyCrtr" onclick="fn_modalVrty"></sbux-button>
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
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >마감등록</th>
							<td>
								<sbux-button id="btnRegDdln" name="btnRegDdln" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-ddln" onclick="fn_modalDdln"></sbux-button>
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
    <div>
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
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

</script>
</body>
</html>