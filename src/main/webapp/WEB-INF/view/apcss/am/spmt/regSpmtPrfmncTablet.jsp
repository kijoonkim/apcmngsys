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
					<h3 class="box-title" style="line-height: 30px;">▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<p class="ad_input_row">
						<sbux-checkbox id="chk-docSpmt" name="chk-docSpmt" uitype="normal" text="송품장 자동발행" class="check"></sbux-checkbox>
					</p>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnClose" name="btnClose" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_close"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출하지시번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtCmndNo" name="srch-inp-spmtCmndNo" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchSpmtCmndNo" name="btnSrchSpmtCmndNo" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark" onclick="fn_modalSpmtCmndno"></sbux-button>
								<p class="ad_input_row">
									<sbux-checkbox id="srch-chk-spmtCmndNo" name="srch-chk-spmtCmndNo" uitype="normal" text="고정" class="check"></sbux-checkbox>
								</p>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장번호/순번</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pckgno" name="srch-inp-pckgno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPckgno" name="btnSrchPckgno" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark" onclick="fn_modalPckgno"></sbux-button>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출하수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtQntt" name="srch-inp-spmtQntt" uitype="text" class="form-control input-sm" onchange="fn_getSpmtWght"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtWght" name="srch-inp-spmtWght" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-spmtQnttWght" name="srch-lbl-spmtQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품종/규격</th>
							<td style="border-right: hidden;" class="td_input">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-spcfctNm" name="srch-inp-spcfctNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품명</th>
							<td style="border-right: hidden;" colspan="2" class="td_input">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th class="th_bg" style="border-right: hidden;" scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsGrd" name="srch-inp-gdsGrd" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="7"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pckgSe" name="srch-inp-pckgSe" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="7"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">운송회사</th>
							<td colspan="2" style="border-right: hidden;" class="td_input">
								<sbux-input id="srch-inp-trsprtCoNm" name="srch-inp-trsprtCoNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">차량번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" class="form-control input-sm" readonly></sbux-input>
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
					<div id="sb-area-spmtTrgtDsctn" style="height:250px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
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
	var wght = 0;

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			
		]);
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-inp-apcCd", gv_selectedApcCd);
		
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
            {caption: ['지시번호'], 	ref: 'spmtCmndNo',	width: '15%',	type: 'output', 	style: 'text-align: center'},
            {caption: ['포장번호'], 	ref: 'pckgno', 		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['수량'],		ref: 'spmtQntt', 	width: '15%', 	type: 'output', 	style: 'text-align: right'},
            {caption: ['중량'], 		ref: 'spmtWght', 	width: '15%', 	type: 'output', 	style: 'text-align: right'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['상품명'], 	ref: 'gdsNm', 		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['상품등급'], 	ref: 'gdsGrd', 		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['포장구분'], 	ref: 'pckgSe',		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['거래처'], 	ref: 'cnptNm', 		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm',	width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '15%', 	type: 'output', 	style: 'text-align: center'},
            {caption: ['처리'], 		ref: 'delYn', 		width: '15%', 	type: 'button', 	style: 'text-align: center',
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='delRow(" + nRow + ")'>삭제</button>";
		    }}
        ];
        grdSpmtTrgtDsctn = _SBGrid.create(SBGridProperties);
    }

	// 출하중량 계산
	async function fn_getSpmtWght(){
		qntt = SBUxMethod.get('srch-inp-spmtQntt');
		SBUxMethod.set('srch-inp-spmtWght', wght*qntt);
		addSpmtTrgtDsctn();
	}
	
	// 출하대상 데이터 그리드 추가
	function addSpmtTrgtDsctn() {
		addData = {
				  spmtCmndNo	: SBUxMethod.get('srch-inp-spmtCmndNo')
				, pckgno		: SBUxMethod.get('srch-inp-pckgno')
				, spmtQntt 		: SBUxMethod.get('srch-inp-spmtQntt')
				, spmtWght 		: SBUxMethod.get('srch-inp-spmtWght')
				, vrtyNm 		: SBUxMethod.get('srch-inp-vrtyNm')
				, spcfctNm 		: SBUxMethod.get('srch-inp-spcfctNm')
				, gdsNm 		: SBUxMethod.get('srch-inp-gdsNm')
				, gdsGrd 		: SBUxMethod.get('srch-inp-gdsGrd')
				, pckgSe 		: SBUxMethod.get('srch-inp-pckgSe')
				, cnptNm 		: SBUxMethod.get('srch-inp-cnptNm')
				, trsprtCoNm 	: SBUxMethod.get('srch-inp-trsprtCoNm')
				, vhclno 		: SBUxMethod.get('srch-inp-vhclno')
				, delYn 		: 'N'
		}
		grdSpmtTrgtDsctn.addRow(true, addData);
		if(SBUxMethod.get('srch-chk-spmtCmndNo') == "false"){
			SBUxMethod.set('srch-inp-spmtCmndNo', null);
		}
		if(SBUxMethod.get('srch-chk-vhclno') == "false"){
			SBUxMethod.set('srch-inp-vhclno', null);
		}
	}
	
	// 출하대상 데이터 그리드 삭제
	async function delRow(nRow) {
    	grdSpmtTrgtDsctn.deleteRow(nRow);
	}
	
	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}
	
	// 차량 선택 팝업 호출
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	
	// 출하지시번호 선택 팝업 호출
	const fn_modalSpmtCmndno = function() {
    	//popSpmtCmndno.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-spmtCmndNo"), fn_setSpmtCmndno);
	}
	
// 	const fn_setSpmtCmndno = function(spmtCmndno) {
// 		if (!gfn_isEmpty(spmtCmndno)) {
// 			SBUxMethod.set('srch-inp-spmtCmndNo', spmtCmndno.spmtCmndno);
// 			SBUxMethod.set('srch-inp-vrtyNm', spmtCmndno.vrtyNm);
// 			SBUxMethod.set('srch-inp-spcfctNm', spmtCmndno.spcfctNm);
// 			SBUxMethod.set('srch-inp-gdsNm', spmtCmndno.gdsNm);
// 			SBUxMethod.set('srch-inp-gdsGrd', spmtCmndno.gdsGrd);
// 			SBUxMethod.set('srch-inp-pckgSe', spmtCmndno.pckgSe);
// 			SBUxMethod.set('srch-inp-cnptNm', spmtCmndno.cnptNm);
// 			SBUxMethod.set('srch-inp-trsprtCoNm', spmtCmndno.trsprtCoNm);
// 		}
// 	}
	
	// 포장번호 선택 팝업 호출
	const fn_modalPckgno = function() {
    	//popPckgno.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-pckgno"), fn_setPckgno);
	}
	
// 	const fn_setPckgno = function(pckgno) {
// 		wght = 0;
// 		if (!gfn_isEmpty(pckgno)) {
// 			SBUxMethod.set('srch-inp-pckgno', pckgno.pckgno);
// 			SBUxMethod.set('srch-inp-spmtQntt', null);
// 			wght = pckgno.pckgWght;
// 		}
// 	}
</script>
</html>