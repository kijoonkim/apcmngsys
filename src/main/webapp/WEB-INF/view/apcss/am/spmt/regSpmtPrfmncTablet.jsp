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
					<h3 class="box-title" style="line-height: 30px;">▶ ${comMenuVO.menuNm}</h3><!-- 출하실적등록 태블릿 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnClose" name="btnClose" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_close"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-dmndQntt" name="srch-inp-dmndQntt" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>출하지시번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtCmndno" name="srch-inp-spmtCmndno" uitype="text" maxlength="20" class="form-control input-sm-ast inpt_data_reqed input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchSpmtCmndno" name="btnSrchSpmtCmndno" uitype="modal" text="찾기" class="btn btn-xs btn-outline-dark" target-id="modal-spmtCmnd" onclick="fn_choiceSpmtCmnd"></sbux-button>
								<p class="ad_input_row">
									<sbux-checkbox id="srch-chk-spmtCmndno" name="srch-chk-spmtCmndno" uitype="normal" text="고정" class="check"></sbux-checkbox>
								</p>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>포장번호/순번</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pckgnoIndct" name="srch-inp-pckgnoIndct" uitype="text" maxlength="25" class="form-control input-sm-ast inpt_data_reqed input-sm"></sbux-input>
								<sbux-input id="srch-inp-pckgno" name="srch-inp-pckgno" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-pckgSn" name="srch-inp-pckgSn" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPckgno" name="btnSrchPckgno" uitype="modal" text="찾기" class="btn btn-xs btn-outline-dark" target-id="modal-gdsInvntr" onclick="fn_modalGdsInvntr" disabled></sbux-button>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">지시수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndQntt" name="srch-inp-cmndQntt" uitype="text" class="form-control input-sm" maxlength="13" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndWght" name="srch-inp-cmndWght" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-cmndQnttWght" name="srch-lbl-cmndQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">등록수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-regQntt" name="srch-inp-regQntt" uitype="text" class="form-control input-sm" maxlength="13" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-regWght" name="srch-inp-regWght" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-regQnttWght" name="srch-lbl-regQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출하수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtQntt" name="srch-inp-spmtQntt" uitype="text" class="form-control input-sm" maxlength="13" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtWght" name="srch-inp-spmtWght" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-spmtQnttWght" name="srch-lbl-spmtQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품종/규격</th>
							<td style="border-right: hidden;" class="td_input">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-itemCd" name="srch-inp-itemCd" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-spcfctNm" name="srch-inp-spcfctNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-spcfctCd" name="srch-inp-spcfctCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품명</th>
							<td style="border-right: hidden;" colspan="2" class="td_input">
								<sbux-input id="srch-inp-spmtPckgUnitNm" name="srch-inp-spmtPckgUnitNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-spmtPckgUnitCd" name="srch-inp-spmtPckgUnitCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th class="th_bg" style="border-right: hidden;" scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsGrdNm" name="srch-inp-gdsGrdNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-gdsGrd" name="srch-inp-gdsGrd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="7"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">운송회사</th>
							<td colspan="2" style="border-right: hidden;" class="td_input">
								<sbux-input id="srch-inp-trsprtCoNm" name="srch-inp-trsprtCoNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-trsprtCoCd" name="srch-inp-trsprtCoCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">차량번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
								<p class="ad_input_row">
									<sbux-checkbox id="srch-chk-vhclno" name="srch-chk-vhclno" uitype="normal" text="고정" class="check"></sbux-checkbox>
								</p>
							</td>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하대상내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtTrgtDsctn" style="height:200px;"></div>
				</div>
				<!--[pp] //검색결과 -->
				
			</div>
		</div>
	</section>
	<!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmnd">
    	<jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
    </div>
    <!-- 상품재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-gdsInvntr" name="modal-gdsInvntr" uitype="middle" header-title="상품재고 선택" body-html-id="body-modal-gdsInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gdsInvntr">
    	<jsp:include page="../../am/popup/gdsInvntrPopup.jsp"></jsp:include>
    </div>
	<!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonSpmtTrgtDsctn = [];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			
		]);
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		
		fn_createSpmtTrgtDsctnGrid();
	})

	function fn_createSpmtTrgtDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtTrgtDsctn';
	    SBGridProperties.id = 'grdSpmtTrgtDsctn';
	    SBGridProperties.jsonref = 'jsonSpmtTrgtDsctn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['처리'], 		ref: 'delYn', 			width: '60px', 	type: 'button', 	style: 'text-align: center',
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='addSpmtTrgtDsctn(" + nRow + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='delRow(" + nRow + ")'>삭제</button>";
	            	}}},
            {caption: ['지시번호'], 	ref: 'spmtCmndno',		width: '130px',	type: 'output', 	style: 'text-align: center'},
            {caption: ['포장번호'], 	ref: 'pckgnoIndct', 	width: '130px', type: 'output', 	style: 'text-align: center'},
            {caption: ['수량'],		ref: 'spmtQntt', 		width: '70px', 	type: 'output', 	style: 'text-align: right'},
            {caption: ['중량'], 		ref: 'spmtWght', 		width: '80px', 	type: 'output', 	style: 'text-align: right'},
            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['상품명'], 	ref: 'spmtPckgUnitNm', 	width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['상품등급'], 	ref: 'gdsGrdNm', 		width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['거래처'], 	ref: 'cnptNm', 			width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm',		width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 			width: '100px', type: 'output', 	style: 'text-align: center'},
            {caption: ['APC코드'], 	ref: 'apcCd', 			hidden: true},
            {caption: ['출하일자'], 	ref: 'spmtYmd', 		hidden: true},
            {caption: ['포장번호'], 	ref: 'pckgno', 			hidden: true},
            {caption: ['포장순번'], 	ref: 'pckgSn', 			hidden: true},
            {caption: ['품목코드'], 	ref: 'itemCd', 			hidden: true},
            {caption: ['품종코드'], 	ref: 'vrtyCd', 			hidden: true},
            {caption: ['규격코드'], 	ref: 'spcfctCd', 		hidden: true},
            {caption: ['포장단위코드'],	ref: 'spmtPckgUnitCd',	hidden: true},
            {caption: ['상품등급'], 	ref: 'gdsGrd', 			hidden: true},
            {caption: ['거래처코드'], 	ref: 'cnptCd', 			hidden: true},
            {caption: ['운송회사코드'],	ref: 'trsprtCoCd',		hidden: true},
            {caption: ['부족수량'],	ref: 'dmndQntt',		hidden: true}
        ];
        grdSpmtTrgtDsctn = _SBGrid.create(SBGridProperties);
        grdSpmtTrgtDsctn.addRow();
    }
	
	// 출하대상 데이터 그리드 추가
	function addSpmtTrgtDsctn(nRow) {
		addData = {
				  spmtCmndno		: SBUxMethod.get('srch-inp-spmtCmndno')
				, pckgnoIndct		: SBUxMethod.get('srch-inp-pckgnoIndct')
				, spmtQntt 			: SBUxMethod.get('srch-inp-spmtQntt')
				, spmtWght 			: SBUxMethod.get('srch-inp-spmtWght')
				, vrtyNm 			: SBUxMethod.get('srch-inp-vrtyNm')
				, spcfctNm 			: SBUxMethod.get('srch-inp-spcfctNm')
				, gdsGrdNm 			: SBUxMethod.get('srch-inp-gdsGrdNm')
				, spmtPckgUnitNm 	: SBUxMethod.get('srch-inp-spmtPckgUnitNm')
				, cnptNm 			: SBUxMethod.get('srch-inp-cnptNm')
				, trsprtCoNm 		: SBUxMethod.get('srch-inp-trsprtCoNm')
				, vhclno 			: SBUxMethod.get('srch-inp-vhclno')
				, delYn 			: 'N'
				, apcCd				: gv_apcCd
				, spmtYmd			: gfn_dateToYmd(new Date())
				, pckgno			: SBUxMethod.get('srch-inp-pckgno')
				, pckgSn			: SBUxMethod.get('srch-inp-pckgSn')
				, itemCd 			: SBUxMethod.get('srch-inp-itemCd')
				, vrtyCd 			: SBUxMethod.get('srch-inp-vrtyCd')
				, spcfctCd 			: SBUxMethod.get('srch-inp-spcfctCd')
				, gdsGrd 			: SBUxMethod.get('srch-inp-gdsGrd')
				, spmtPckgUnitCd 	: SBUxMethod.get('srch-inp-spmtPckgUnitCd')
				, cnptCd 			: SBUxMethod.get('srch-inp-cnptCd')
				, trsprtCoCd 		: SBUxMethod.get('srch-inp-trsprtCoCd')
				, dmndQntt 			: SBUxMethod.get('srch-inp-dmndQntt')
		}
		if (gfn_isEmpty(addData.spmtQntt) || addData.spmtQntt == 0) {
			gfn_comAlert("W0002", "출하수량");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		grdSpmtTrgtDsctn.setRowData(nRow, addData);
		grdSpmtTrgtDsctn.addRow(true, null, true);

		chkSpmtCmndno = SBUxMethod.get('srch-chk-spmtCmndno');
		chkVhclno = SBUxMethod.get('srch-chk-vhclno');
		
		let cmndQntt = parseInt(SBUxMethod.get('srch-inp-cmndQntt'));
		let regQntt = parseInt(SBUxMethod.get('srch-inp-regQntt'));
		let regWght = parseInt(SBUxMethod.get('srch-inp-regWght'));
		let spmtQntt = parseInt(SBUxMethod.get('srch-inp-spmtQntt'));
		let spmtWght = parseInt(SBUxMethod.get('srch-inp-spmtWght'));
		
		if(!chkSpmtCmndno[Object.keys(chkSpmtCmndno)[0]]){
			fn_resetUnchecked();
		} else if (cmndQntt == regQntt + spmtQntt) {
			fn_resetUnchecked();
			SBUxMethod.set('srch-chk-spmtCmndno', 'false');
			SBUxMethod.refresh('srch-chk-spmtCmndno');
		} else {
			SBUxMethod.set('srch-inp-regQntt', regQntt + spmtQntt);
			SBUxMethod.set('srch-inp-regWght', regWght + spmtWght);
		}
		if(!chkVhclno[Object.keys(chkVhclno)[0]]){
			SBUxMethod.set('srch-inp-vhclno', "");
		}
		fn_resetPckgno();
	}
	
	// 출하대상 데이터 그리드 삭제
	async function delRow(nRow) {
    	grdSpmtTrgtDsctn.deleteRow(nRow);
	}
	
	// 출하실적 등록 (저장 버튼)
	async function fn_save() {
		let allData = grdSpmtTrgtDsctn.getGridDataAll();
		
		const insertList = [];
		const alertList = [];
		
		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdSpmtTrgtDsctn.getRowData(i);
			const rowSts = grdSpmtTrgtDsctn.getRowStatus(i);
			if (!gfn_isEmpty(rowData.delYn)) {
				if (gfn_isEmpty(rowData.apcCd)){
					gfn_comAlert("W0002", "APC코드");		//	W0002	{0}을/를 입력하세요.
		            return;
				} else if (gfn_isEmpty(rowData.pckgno)){
					gfn_comAlert("W0002", "포장번호");		//	W0002	{0}을/를 입력하세요.
		            return;
				}else if (gfn_isEmpty(rowData.pckgSn)){
					gfn_comAlert("W0002", "포장순번");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if (!gfn_isEmpty(rowData.dmndQntt)) {
					alertList.push("\r\n지시번호: " + rowData.spmtCmndno + "            부족한 수량: " + rowData.dmndQntt);
				}

				rowData.rowSts = "I";
				insertList.push(rowData);
			}
		}
		
		if (alertList.length != 0){
			alert("재고가 부족합니다.\r\n" + alertList);		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (insertList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		
		if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	
    	const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncList.do", insertList, this.prgrmId);
    	
		const data = await postJsonPromise;	    
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_reset();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
	}
	
	// 초기화
	async function fn_reset() {
		SBUxMethod.set('srch-inp-vhclno', "");
		fn_resetUnchecked();
		fn_resetPckgno();
	}
	
	async function fn_resetUnchecked() {
		SBUxMethod.set('srch-inp-spmtCmndno', "");
		SBUxMethod.set('srch-inp-cmndQntt', "");
		SBUxMethod.set('srch-inp-cmndWght', "");
		SBUxMethod.set('srch-inp-regQntt', "");
		SBUxMethod.set('srch-inp-regWght', "");
		SBUxMethod.set('srch-inp-vrtyNm', "");
		SBUxMethod.set('srch-inp-spcfctNm', "");
		SBUxMethod.set('srch-inp-gdsGrdNm', "");
		SBUxMethod.set('srch-inp-spmtPckgUnitNm', "");
		SBUxMethod.set('srch-inp-cnptNm', "");
		SBUxMethod.set('srch-inp-trsprtCoNm', "");
		SBUxMethod.set('srch-inp-itemCd', "");
		SBUxMethod.set('srch-inp-vrtyCd', "");
		SBUxMethod.set('srch-inp-spcfctCd', "");
		SBUxMethod.set('srch-inp-gdsGrd', "");
		SBUxMethod.set('srch-inp-spmtPckgUnitCd', "");
		SBUxMethod.set('srch-inp-cnptCd', "");
		SBUxMethod.set('srch-inp-trsprtCoCd', "");
		$("#btnSrchPckgno").attr("disabled", true);
	}
	
	async function fn_resetPckgno() {
		SBUxMethod.set('srch-inp-pckgnoIndct', "");
		SBUxMethod.set('srch-inp-pckgno', "");
		SBUxMethod.set('srch-inp-pckgSn', "");
		SBUxMethod.set('srch-inp-spmtQntt', "");
		SBUxMethod.set('srch-inp-spmtWght', "");
		SBUxMethod.set('srch-inp-dmndQntt', "");
	}
	
	// 차량 선택 팝업 호출
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_apcCd, gv_apcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	
	// 출하지시번호 선택 팝업 호출
	const fn_choiceSpmtCmnd = function() {
    	popSpmtCmnd.init(gv_apcCd, gv_apcNm, fn_setSpmtCmnd);
	}
	const fn_setSpmtCmnd = function(spmtCmnd) {
		if (!gfn_isEmpty(spmtCmnd)) {
			// 재고수량, 출하수량 비교
			let allData = grdSpmtTrgtDsctn.getGridDataAll();
			
			let regQntt = 0;		// 잔존출하지시수량
			let regWght = 0;		// 잔존출하지시중량
			
			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdSpmtTrgtDsctn.getRowData(i);
				
				if (rowData.spmtCmndno == spmtCmnd.spmtCmndno){
					regQntt += parseInt(rowData.spmtQntt);
					regWght += parseInt(rowData.spmtWght);
				}
			}
			
			if (spmtCmnd.cmndQntt > regQntt) {
				SBUxMethod.set('srch-inp-spmtCmndno', spmtCmnd.spmtCmndno);
				SBUxMethod.set('srch-inp-cmndQntt', spmtCmnd.cmndQntt);
				SBUxMethod.set('srch-inp-cmndWght', spmtCmnd.cmndWght);
				SBUxMethod.set('srch-inp-regQntt', regQntt);
				SBUxMethod.set('srch-inp-regWght', regWght);
				SBUxMethod.set('srch-inp-vrtyNm', spmtCmnd.vrtyNm);
				SBUxMethod.set('srch-inp-spcfctNm', spmtCmnd.spcfctNm);
				SBUxMethod.set('srch-inp-spmtPckgUnitNm', spmtCmnd.spmtPckgUnitNm);
				SBUxMethod.set('srch-inp-gdsGrdNm', spmtCmnd.gdsGrdNm);
				SBUxMethod.set('srch-inp-cnptNm', spmtCmnd.cnptNm);
				SBUxMethod.set('srch-inp-trsprtCoNm', spmtCmnd.trsprtCoNm);
				SBUxMethod.set('srch-inp-itemCd', spmtCmnd.itemCd);
				SBUxMethod.set('srch-inp-vrtyCd', spmtCmnd.vrtyCd);
				SBUxMethod.set('srch-inp-spcfctCd', spmtCmnd.spcfctCd);
				SBUxMethod.set('srch-inp-gdsGrd', spmtCmnd.gdsGrd);
				SBUxMethod.set('srch-inp-spmtPckgUnitCd', spmtCmnd.spmtPckgUnitCd);
				SBUxMethod.set('srch-inp-cnptCd', spmtCmnd.cnptCd);
				SBUxMethod.set('srch-inp-trsprtCoCd', spmtCmnd.trsprtCoCd);
				$("#btnSrchPckgno").attr("disabled", false);
			} else {
				alert("출하대상에 추가 완료된 출하지시입니다.");
			}
		}
	}
	
	// 포장번호 선택 팝업 호출
	const fn_modalGdsInvntr = function() {
		let data = {
			itemCd 		: SBUxMethod.get('srch-inp-itemCd'),
			vrtyCd 		: SBUxMethod.get('srch-inp-vrtyCd'),
			spcfctCd	: SBUxMethod.get('srch-inp-spcfctCd'),
			gdsGrd		: SBUxMethod.get('srch-inp-gdsGrd')
		}
		
		popGdsInvntr.init(gv_apcCd, gv_apcNm, data, fn_setGdsInvntr);
	}
	const fn_setGdsInvntr = function(gdsInvntr) {
		if (!gfn_isEmpty(gdsInvntr)) {
			// 재고수량, 출하수량 비교
			let spmtCmndno = SBUxMethod.get('srch-inp-spmtCmndno');
			let allData = grdSpmtTrgtDsctn.getGridDataAll();
			
			let leftSpmtQntt = SBUxMethod.get('srch-inp-cmndQntt') - SBUxMethod.get('srch-inp-regQntt');		// 잔존출하지시수량
			let leftSpmtWght = SBUxMethod.get('srch-inp-cmndWght') - SBUxMethod.get('srch-inp-regWght');		// 잔존출하지시중량
			let leftInvntrQntt = gdsInvntr.invntrQntt;															// 잔존재고수량
			let leftInvntrWght = gdsInvntr.invntrWght;															// 잔존재고중량
			
			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdSpmtTrgtDsctn.getRowData(i);
				
				if (rowData.pckgnoIndct == gdsInvntr.pckgnoIndct){
					leftInvntrQntt -= rowData.spmtQntt;
					leftInvntrWght -= rowData.spmtWght;
				}
			}
			
			if (leftInvntrQntt == 0) {
				alert("재고가 없습니다.");
			} else {
				SBUxMethod.set('srch-inp-pckgnoIndct', gdsInvntr.pckgnoIndct);
				SBUxMethod.set('srch-inp-pckgno', gdsInvntr.pckgno);
				SBUxMethod.set('srch-inp-pckgSn', gdsInvntr.pckgSn);
				
				if (leftSpmtQntt <= leftInvntrQntt) {
					SBUxMethod.set('srch-inp-spmtQntt', leftSpmtQntt);
					SBUxMethod.set('srch-inp-spmtWght', leftSpmtWght);
				}
				if (leftSpmtQntt > leftInvntrQntt) {
					SBUxMethod.set('srch-inp-spmtQntt', leftInvntrQntt);
					SBUxMethod.set('srch-inp-spmtWght', leftInvntrWght);
				}
			}
		}
	}
</script>
</html>