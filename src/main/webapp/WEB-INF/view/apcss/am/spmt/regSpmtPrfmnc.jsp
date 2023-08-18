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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary"></sbux-button>
					<sbux-button id="btnSearchGdsInvnrt" name="btnSearchGdsInvnrt" uitype="normal" text="재고조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
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
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmdFrom" name="srch-dtp-pckgYmdFrom" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmdTo" name="srch-dtp-pckgYmdTo" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast"></sbux-datepicker>
							</td>
							<td class="td_input"></td>

							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouse"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>

							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm-ast" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComVrty" read></sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSeCd_1" name="srch-rdo-gdsSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="srch-rdo-gdsSeCd_1" text="일반"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSeCd_2" name="srch-rdo-gdsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="srch-rdo-gdsSeCd_2" text="GAP"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSeCd_3" name="srch-rdo-gdsSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="srch-rdo-gdsSeCd_3" text="무농약"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSeCd_4" name="srch-rdo-gdsSeCd" uitype="normal" class="radio_label" value="4"></sbux-radio>
									<sbux-label class="radio_label" for-id="srch-rdo-gdsSeCd_4" text="유기농"></sbux-label>
								</p>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" unselected-text="선택" class="form-control input-sm" jsondata-ref="jsonComSpcfct"></sbux-select>
							</td>
							<td style="border-right: hidden;">

							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->

				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>상품재고 내역</span></li>
						</ul>
					</div>
						<div class="ad_tbl_toplist">
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-grdGdsInvntr" style="height:300px;"></div>
					</div>
				</div>

				<div class="ad_tbl_top"></div>

				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">지시번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndNo" name="srch-inp-cmndNo" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-cmndNo" name="srch-btn-cmndNo" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">지시수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndQntt" name="srch-inp-cmndQntt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								Kg
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-smptYmd" name="srch-dtp-smptYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" placeholder=""></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-grdCd" name="srch-slt-grdCd" uitype="single" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComGrd"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출하수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-smptQntt" name="srch-inp-smptQntt" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" placeholder=""></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
							<th scope="row" class="th_bg">운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComTrsprtCo"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vhclNo" name="srch-inp-vhclNo" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="2" class="td_input" ></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pckgSeCd" name="srch-slt-pckgSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComPckgSeCd"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">운임비용</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-trsprtCst" name="srch-inp-trsprtCst" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-rmrk" name="srch-inp-rmrk" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
					<sbux-button id="btnDown" name="srch-btn-invnrtInq" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-dark"></sbux-button>
					<sbux-button id="btnUp" name="srch-btn-invnrtInq" uitype="normal" text="올리기" class="btn btn-xs btn-outline-dark"></sbux-button>
					</div>
				</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-spmtPrfmnc" style="height:300px;"></div>
					</div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct		= [];	// 규격 		spcfctCd	검색
	var jsonComGrd			= [];	// 등급			grdCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComTrsprtCo		= [];	// 운송사 		trsprtCo	검색
	var jsonComPckgSeCd		= [];	// 포장구분 	pckgSeCd	검색

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_apcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-pckgSeCd', 		jsonComPckgSeCd, 	'PCKG_SE_CD', gv_apcCd),		// 포장구분
		 	gfn_setTrsprtsSBSelect('srch-slt-trsprtCo', 	jsonComTrsprtCo, 	gv_apcCd),		// 운송사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_apcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_apcCd)		// 품종
		])

	}

	const fn_selectItem = async = function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_apcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, gv_apcCd, itemCd);		// 규격
		gfn_setApcGrdsSBSelect('srch-slt-grdCd', 		jsonComGrd, gv_apcCd, itemCd);			// 등급

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createSmptPrfmncGrid();

		SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-smptYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
	})

	var jsonGdsInvntr = []; // 상품재고내역 Json
	var jsonSpmtPrfmnc = []; // 출하내역 Json
	const fn_createSmptPrfmncGrid = async function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGdsInvntr';
	    SBGridProperties.id = 'grdGdsInvntr';
	    SBGridProperties.jsonref = 'jsonGdsInvntr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
        	{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'80px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['품종','품종'], 			ref: 'vrtyNm', 		width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['상품구분','상품구분'],	ref: 'gdsSeNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['규격','규격'], 			ref: 'spcfctNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['생산일자','생산일자'], 	ref: 'pckgYmd', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['포장번호','포장번호'], 	ref: 'pckgno', 		width: '200px', type: 'output', style: 'text-align:center'},
            {caption: ['재고','수량'], 			ref: 'invntrQntt', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['재고','중량'], 			ref: 'invntrWght', 	width: '150px', type: 'output', style: 'text-align:center', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['출하지시','수량'], 		ref: 'cmndQntt',	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['출하지시','중량'], 		ref: 'cmndWght', 	width: '150px', type: 'output', style: 'text-align:center', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['출하','수량'], 			ref: 'smptQntt', 	width: '100px', type: 'input', style: 'text-align:center; background:#FFF8DC;' },
            {caption: ['출하','중량'], 			ref: 'smptWght', 	width: '150px', type: 'input', style: 'text-align:center; background:#FFF8DC;', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}}
        ];

        var SBGridProperties2 = {};
	    SBGridProperties2.parentid = 'sb-area-spmtPrfmnc';
	    SBGridProperties2.id = 'grdSpmtPrfmnc';
	    SBGridProperties2.jsonref = 'jsonSpmtPrfmnc';
        SBGridProperties2.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties2.selectmode = 'byrow';
	    SBGridProperties2.extendlastcol = 'scroll';
        SBGridProperties2.columns = [
            {caption: ['선택'], 		ref: 'wghno',		width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['출하일자'], 	ref: 'prdcrNm', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['거래처'],		ref: 'itemNm', 		width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'gdsSeNm', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['상품'], 		ref: 'wrhsSeNm', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['등급'], 		ref: 'trsprtSeNm', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 		ref: 'wholWght', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['중량'], 		ref: 'emptVhclWght',width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['운송회사'], 	ref: 'rdcdRt', 		width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['차량번호'], 	ref: 'rdcdWght', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'actlWght', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['운임비용'], 	ref: 'actlWght', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['포장구분'], 	ref: 'actlWght', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['지시번호'], 	ref: 'actlWght', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['비고'], 		ref: 'actlWght', 	width: '15%', type: 'output', style: 'text-align:center'}
        ];
        grdGdsInvntr = _SBGrid.create(SBGridProperties);
        grdSpmtPrfmnc = _SBGrid.create(SBGridProperties2);
    }

	const fn_search = async function(){
		let flag = true;
		flag = await fn_setGrdGdsInvntr();
		if(flag){
			//await fn_setGrdSmptPrfmnc();
		}
	}
	const fn_setGrdGdsInvntr = async function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");

		if (gfn_isEmpty(pckgYmdFrom)) {
  			gfn_comAlert("W0001", "생산시작일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}
  		if (gfn_isEmpty(pckgYmdTo)) {
  			gfn_comAlert("W0001", "생산종료일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			gfn_comAlert("W0001", "품종");				//	W0002	{0}을/를 선택하세요.
            return false;
  		}
  		if (gfn_isEmpty(gdsSeCd)) {
  			gfn_comAlert("W0001", "상품");				//	W0002	{0}을/를 선택하세요.
            return false;
  		}

		const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", {
			apcCd			: gv_selectedApcCd,
			pckgYmdFrom		: pckgYmdFrom,
			pckgYmdTo		: pckgYmdTo,
			warehouseSeCd	: warehouseSeCd,
			itemCd			: itemCd,
			vrtyCd			: vrtyCd,
			spcfctCd 		: spcfctCd,
			gdsSeCd 		: gdsSeCd
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonGdsInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
          		const gdsInvntr = {
          				apcCd: item.apcCd,
          				pckgno: item.pckgno,
          				pckgSn: item.pckgSn,
          				pckgYmd: item.pckgYmd,
          				itemCd: item.itemCd,
          				itemNm: item.itemNm,
          				vrtyCd: item.vrtyCd,
          				vrtyNm: item.vrtyNm,
          				spcfctCd: item.spcfctCd,
          				spcfctNm: item.spcfctNm,
          				gdsSeCd: item.gdsSeCd,
          				gdsSeNm: item.gdsSeNm,
          				invntrQntt: item.invntrQntt,
          				invntrWght: item.invntrWght,
          				spmtQntt: item.spmtQntt,
          				spmtWght: item.spmtWght,
          				pckgQntt: item.pckgQntt,
          				pckgWght: item.pckgWght,
          				pckgSeCd: item.pckgSeCd,
          				pckgSeNm: item.pckgSeNm,
          				rprsPrdcrCd: item.rprsPrdcrCd,
          				rprsPrdcrNm: item.rprsPrdcrNm,
          				fcltCd: item.fcltCd,
          				fcltNm: item.fcltNm,
          				cmndQntt: item.cmndQntt,
          				cmndWght: item.cmndWght
  				}
				jsonGdsInvntr.push(gdsInvntr);
  			});
          	grdGdsInvntr.refresh();


		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
		return true;
	}


</script>
</html>