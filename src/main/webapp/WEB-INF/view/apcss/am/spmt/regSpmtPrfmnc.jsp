<%
 /**
  * @Class Name : regSpmtPrfmnc.jsp
  * @Description : 출하실적등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>	<!-- 출하실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary" onclick="fn_docSpmt"></sbux-button>
					<sbux-button id="btnSearchGdsInvnrt" name="btnSearchGdsInvnrt" uitype="normal" text="재고조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
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
								<sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComWarehouse"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>

							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
									jsondata-ref="jsonComItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									onchange="fn_selectVrty"
								></sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd">
									</sbux-radio>
								</p>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									unselected-text="전체"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">지시번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-spmtCmndno" name="dtl-inp-spmtCmndno" uitype="text" class="form-control input-sm" readOnly></sbux-input>
								<sbux-input id="dtl-inp-outordrno" name="dtl-inp-outordrno" uitype="hidden" class="form-control input-sm" readOnly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="dtl-btn-spmtCmndno" name="dtl-btn-spmtCmndno" uitype="modal" target-id="modal-spmtCmnd" onclick="fn_choiceSpmtCmnd" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
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
						<div id="sb-area-grdGdsInvntr" style="height:162px;"></div>
					</div>
				</div>
				<br>
				<table class="table table-bordered tbl_fixed">
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
							<th scope="row" class="th_bg">지시수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cmndQntt" name="dtl-inp-cmndQntt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cmndWght" name="dtl-inp-cmndWght" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								Kg
							</td>
							<th scope="row" class="th_bg">등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-gdsGrd"
									name="dtl-slt-gdsGrd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="지시선택"
									jsondata-ref="jsonDtlGdsGrd"
									disabled
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg">포장단위</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnit"
									name="dtl-slt-spmtPckgUnit"
									uitype="single"
									class="form-control input-sm"
									unselected-text="지시선택"
									jsondata-ref="jsonDtlSpmtPckgUnit"
									disabled
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-dtp-spmtYmd" name="dtl-dtp-spmtYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cnptCd" name="dtl-inp-cnptCd" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-cnptNm" name="dtl-inp-cnptNm" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" readonly></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="dtl-btn-cnpt" name="dtl-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_choiceCnpt" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-trsprtCoCd" name="dtl-slt-trsprtCoCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComTrsprtCoCd"></sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-vhclno" name="dtl-inp-vhclno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" ></td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-dldtn" name="dtl-inp-dldtn" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">운임비용</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-trsprtCst" name="dtl-inp-trsprtCst" uitype="text" class="form-control input-sm"
								autocomplete="off"
								mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>

							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>출하 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDown" name="srch-btn-invnrtInq" uitype="normal" text="내려받기" class="btn btn-sm btn-outline-dark"></sbux-button>
						<sbux-button id="btnUp" name="srch-btn-invnrtInq" uitype="normal" text="올리기" class="btn btn-sm btn-outline-dark"></sbux-button>
					</div>
				</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-spmtPrfmnc" style="height:162px;"></div>
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
	<!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmnd">
    	<jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 			itemCd			검색
	var jsonComVrty			= [];	// 품종 			vrtyCd			검색
	var jsonComSpcfct		= [];	// 규격 			spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 			warehouseSeCd	검색
	var jsonComGdsSeCd		= [];	// 상품구분 		gdsSeCd			검색
	var jsonComTrsprtCoCd	= [];	// 운송사 			trsprtCo		검색
	var jsonGrdGdsGrd		= [];	// 상품등급			gdsGrd			그리드
	var jsonGrdSpmtPckgUnit	= [];	// 출하포장단위 	spmtPckgUnit	그리드
	var jsonDtlGdsGrd		= [];	// 상품등급			gdsGrd			그리드
	var jsonDtlSpmtPckgUnit	= [];	// 출하포장단위 	spmtPckgUnit	상세
	var cmndYn = false;

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-rdo-gdsSeCd', 		jsonComGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록
			gfn_setComCdSBSelect('grdGdsInvntr', 			jsonGrdGdsGrd, 		'GDS_GRD'),		// 상품등급
			gfn_setComCdSBSelect('dtl-slt-gdsGrd', 			jsonDtlGdsGrd, 		'GDS_GRD'),		// 상품등급
		 	gfn_setTrsprtsSBSelect('dtl-slt-trsprtCoCd', 	jsonComTrsprtCoCd, 	gv_apcCd),		// 운송사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_apcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_apcCd)		// 품종
		])

		SBUxMethod.set('srch-rdo-gdsSeCd', '1');
	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_apcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, gv_apcCd, itemCd);		// 규격

	}

	const fn_selectVrty = async function(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = "";
		for(i=0;i<jsonComVrty.length;i++){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}
		SBUxMethod.set("srch-slt-itemCd", itemCd);
		let rst = await Promise.all([
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, 	gv_apcCd, itemCd),					// 규격
			gfn_setSpmtPckgUnitSBSelect('grdGdsInvntr', 	jsonGrdSpmtPckgUnit, 	gv_apcCd, itemCd, vrtyCd)	// 포장구분
		])
		grdGdsInvntr.refresh({"combo":true})
		SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");
	}

	window.addEventListener('DOMContentLoaded', async function(e) {
		await fn_initSBSelect();
		fn_createSmptPrfmncGrid();

		SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-dtp-spmtYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

	})

	var jsonGdsInvntr = []; // 상품재고내역 Json
	var jsonSpmtPrfmnc = []; // 출하내역 Json
	const fn_createSmptPrfmncGrid = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-grdGdsInvntr';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.selectmode = 'byrow';
        SBGridPropertiesGdsInvntr.extendlastcol = 'scroll';
        SBGridPropertiesGdsInvntr.oneclickedit = true;
        SBGridPropertiesGdsInvntr.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['품목'], 		ref: 'itemNm', 		width: '80px', type: 'output', style: 'text-align:center'},
        	{caption: ['품종'], 		ref: 'vrtyNm', 		width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['상품구분'],		ref: 'gdsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['생산일자'], 	ref: 'pckgYmd', 	width: '150px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['포장번호'], 	ref: 'pckgno', 		width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['재고수량'], 	ref: 'invntrQntt', 	width: '80px', type: 'output', style: 'text-align:right'},
            {caption: ['재고중량'], 	ref: 'invntrWght', 	width: '100px', type: 'output', style: 'text-align:right',
            			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
   			{caption: ["포장단위"], 	ref: 'spmtPckgUnitCd',   	type:'combo',  width:'200px',    style:'text-align:center; background:#FFF8DC;',
    					typeinfo : {ref:'jsonGrdSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
            {caption: ["등급"], 			ref: 'gdsGrd',   	type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
    					typeinfo : {ref:'jsonGrdGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['출하수량'], 	ref: 'spmtQntt', 	width: '80px', type: 'input', style: 'text-align:right; background:#FFF8DC;' },
            {caption: ['출하중량'], 	ref: 'spmtWght', 	width: '100px', type: 'input', style: 'text-align:right; background:#FFF8DC;',
            			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
			{caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'output', style: 'text-align:center'},
            {caption: ["출하일자"],		ref: 'spmtYmd',   	type:'output',  hidden: true},
            {caption: ["거래처코드"],	ref: 'cnptCd',   	type:'output',  hidden: true},
            {caption: ["운송사코드"],	ref: 'trsprtCoCd',  type:'output',  hidden: true},
            {caption: ["운송사명"],		ref: 'trsprtCoNm',  type:'output',  hidden: true},
            {caption: ["차량번호"],		ref: 'vhclno',   	type:'output',  hidden: true},
            {caption: ["배송지"],		ref: 'dldtn',   	type:'output',  hidden: true},
            {caption: ["운임"],			ref: 'trsprtCst',   type:'output',  hidden: true},
            {caption: ["비고"],			ref: 'rmrk',   		type:'output',  hidden: true},
            {caption: ["지시번호"],		ref: 'spmtCmndno',  type:'output',  hidden: true},
            {caption: ["브랜드명"],		ref: 'brndNm',  	type:'output',  hidden: true},
            {caption: ["발주번호"],		ref: 'outordrno',  	type:'output',  hidden: true},
            {caption: ["상품코드"],		ref: 'gdsCd',  	type:'output',  hidden: true}
        ];

        grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
        grdGdsInvntr.bind('valuechanged', 'fn_grdCmndQnttValueChanged');
        grdGdsInvntr.bind('select','fn_setValue');
        grdGdsInvntr.bind('deselect','fn_delValue');

        var SBGridPropertiesSpmtPrfmnc = {};
        SBGridPropertiesSpmtPrfmnc.parentid = 'sb-area-spmtPrfmnc';
        SBGridPropertiesSpmtPrfmnc.id = 'grdSpmtPrfmnc';
	    SBGridPropertiesSpmtPrfmnc.jsonref = 'jsonSpmtPrfmnc';
	    SBGridPropertiesSpmtPrfmnc.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesSpmtPrfmnc.selectmode = 'byrow';
	    SBGridPropertiesSpmtPrfmnc.extendlastcol = 'scroll';
	    SBGridPropertiesSpmtPrfmnc.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['출하일자'], 	ref: 'spmtYmd', 	width: '100px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'],		ref: 'cnptNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['품목'], 		ref: 'itemNm', 		width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['상품'], 		ref: 'gdsCd', 		width: '100px', type: 'output', style: 'text-align:center', hidden:true},
            {caption: ['등급'], 		ref: 'gdsGrdNm', 	width: '60px', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 		ref: 'spmtQntt', 	width: '60px', type: 'output', style: 'text-align:right'},
            {caption: ['중량'], 		ref: 'spmtWght',	width: '80px', type: 'output', style: 'text-align:right',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 	width: '180px', type: 'output', style: 'text-align:center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 		width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['운임비용'], 	ref: 'trsprtCst', 	width: '80px', type: 'output', style: 'text-align:center',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
            {caption: ['포장구분'], 	ref: 'spmtPckgUnitNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['지시번호'], 	ref: 'spmtCmndno', 	width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '150px', type: 'output', style: 'text-align:center'}
        ];

        grdSpmtPrfmnc = _SBGrid.create(SBGridPropertiesSpmtPrfmnc);
    }

	const fn_search = async function(){
		let flag = true;
		flag = await fn_setGrdGdsInvntr();
		if(flag){
			await fn_setGrdSmptPrfmnc();
		}
	}

	const fn_setGrdGdsInvntr = async function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");

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
			spmtPckgUnitCd  : spmtPckgUnitCd,
			gdsSeCd 		: gdsSeCd,
			spcfctCd		: spcfctCd
  		});
        const data = await postJsonPromise;
        console.log(data);
        try {
          	/** @type {number} **/
      		jsonGdsInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
          		if(item.invntrWght != 0){
	          		const gdsInvntr = {
	          				apcCd		: item.apcCd,
	          				pckgno		: item.pckgno,
	          				pckgSn		: item.pckgSn,
	          				pckgYmd		: item.pckgYmd,
	          				itemCd		: item.itemCd,
	          				itemNm		: item.itemNm,
	          				vrtyCd		: item.vrtyCd,
	          				vrtyNm		: item.vrtyNm,
	          				spcfctCd	: item.spcfctCd,
	          				spcfctNm	: item.spcfctNm,
	          				gdsSeCd		: item.gdsSeCd,
	          				gdsSeNm		: item.gdsSeNm,
	          				invntrQntt	: item.invntrQntt,
	          				invntrWght	: item.invntrWght,
	          				spmtQntt	: 0,
	          				spmtWght	: 0,
	          				pckgQntt	: item.pckgQntt,
	          				pckgWght	: item.pckgWght,
	          				pckgSeCd	: item.pckgSeCd,
	          				pckgSeNm	: item.pckgSeNm,
	          				prdcrCd		: item.rprsPrdcrCd,
	          				prdcrNm		: item.rprsPrdcrNm,
	          				fcltCd		: item.fcltCd,
	          				fcltNm		: item.fcltNm,
	          				cmndQntt	: item.cmndQntt,
	          				cmndWght	: item.cmndWght,
	          				gdsGrd		: item.gdsGrd,
	          				gdsGrdNm	: item.gdsGrdNm,
	          				gdsCd 		: item.gdsCd,
	          				plorCd 		: item.plorCd,
	          				spmtPckgUnitCd: item.spmtPckgUnitCd,
	          				spmtPckgUnitNm: item.spmtPckgUnitNm,
	          				rmrk		: item.rmrk,
	          				brndNm		: item.brndNm
	  				}
					jsonGdsInvntr.push(gdsInvntr);
          		}
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

	const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdGdsInvntr.getRow();
		let nCol = grdGdsInvntr.getCol();

		switch (nCol) {
		case 11:	// checkbox
			fn_checkInptQntt();
			break;
		case 12:
			//check qntt
			fn_checkInptWght();
			break;
		default:
			return;
		}
    }

    const fn_setValue = async function(){


    	let nRow = grdGdsInvntr.getRow();
    	let nCol = grdGdsInvntr.getCol();
    	if(nCol == 0){

	    	let invntrQntt = grdGdsInvntr.getRowData(nRow).invntrQntt;
			let invntrWght = grdGdsInvntr.getRowData(nRow).invntrWght;
			let spmtQntt = grdGdsInvntr.getRowData(nRow).spmtQntt;
			let spmtWght = grdGdsInvntr.getRowData(nRow).spmtWght;
			let cmndQntt = grdGdsInvntr.getRowData(nRow).cmndQntt;
			let cmndWght = grdGdsInvntr.getRowData(nRow).cmndWght;

			if((spmtQntt == 0 && spmtWght == 0) || (gfn_isEmpty(spmtQntt) && gfn_isEmpty(spmtWght))){
				if(cmndQntt > 0){
					grdGdsInvntr.setCellData(nRow, 11, cmndQntt);
					grdGdsInvntr.setCellData(nRow, 12, cmndWght);
				}else{

					grdGdsInvntr.setCellData(nRow, 11, invntrQntt);
					grdGdsInvntr.setCellData(nRow, 12, invntrWght);
				}

				let spmtPckgUnit = SBUxMethod.get("dtl-slt-spmtPckgUnit");
				let gdsGrdCd = SBUxMethod.get("dtl-slt-gdsGrd");
				let spmtCmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
				if(!gfn_isEmpty(spmtCmndno)){
					grdGdsInvntr.setCellData(nRow, 9, spmtPckgUnit, true);
					grdGdsInvntr.setCellData(nRow, 10, gdsGrdCd, true);
				}
			}
    	}
    }

    const fn_delValue = async function(){
    	var nRow = grdGdsInvntr.getRow();
    	grdGdsInvntr.setCellData(nRow, 11, 0);
    	grdGdsInvntr.setCellData(nRow, 12, 0);
    }

    const fn_checkInptWght = async function(){

    	let nRow = grdGdsInvntr.getRow();
		let nCol = grdGdsInvntr.getCol();

		let invntrQntt = grdGdsInvntr.getRowData(nRow).invntrQntt;
		let invntrWght = grdGdsInvntr.getRowData(nRow).invntrWght;
		let spmtWght = grdGdsInvntr.getRowData(nRow).spmtWght;

		if(invntrWght - spmtWght < 0){
			gfn_comAlert("W0008", "재고중량", "출하중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdGdsInvntr.setCellData(nRow, nCol , 0);
            return;
		}
		if(invntrWght == spmtWght && invntrQntt > 0){
			grdGdsInvntr.setCellData(nRow, 11, invntrQntt);
		}

		if(invntrWght % spmtWght == 0){
			grdGdsInvntr.setCellData(nRow, 11, (spmtWght / invntrWght * invntrQntt));
		}

		if(spmtWght > 0){
			grdGdsInvntr.setCellData(nRow, 0, "Y")
			let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-spmtPckgUnit");
			let gdsGrdCd = SBUxMethod.get("dtl-slt-gdsGrd");
			let spmtCmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
			if(!gfn_isEmpty(spmtCmndno)){
				grdGdsInvntr.setCellData(nRow, 9, spmtPckgUnitCd, true);
				grdGdsInvntr.setCellData(nRow, 10, gdsGrdCd, true);
			}
		}else{
			grdGdsInvntr.setCellData(nRow, 0, "N")
		}
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdGdsInvntr.getRow();
		let nCol = grdGdsInvntr.getCol();

		let invntrQntt = grdGdsInvntr.getRowData(nRow).invntrQntt;
		let invntrWght = grdGdsInvntr.getRowData(nRow).invntrWght;
		let spmtQntt = grdGdsInvntr.getRowData(nRow).spmtQntt;

		if(invntrQntt - spmtQntt < 0){
			gfn_comAlert("W0008", "재고수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdGdsInvntr.setCellData(nRow, nCol , 0);
            return;
		}

		if(invntrQntt > 0 && spmtQntt > 0){
			let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-spmtPckgUnit");
			let gdsGrdCd = SBUxMethod.get("dtl-slt-gdsGrd");
			let spmtCmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
			if(!gfn_isEmpty(spmtCmndno)){
				grdGdsInvntr.setCellData(nRow, 9, spmtPckgUnitCd, true);
				grdGdsInvntr.setCellData(nRow, 10, gdsGrdCd, true);
			}
			grdGdsInvntr.setCellData(nRow, 12, Math.round(invntrWght / invntrQntt) * spmtQntt);
			grdGdsInvntr.setCellData(nRow, 0, "Y");
		}
		if(spmtQntt == 0 && invntrQntt > 0){
			grdGdsInvntr.setCellData(nRow, 12, 0);
			grdGdsInvntr.setCellData(nRow, 0, "N");
		}
    }

	const fn_save = async function() {

    	var grdRows = grdGdsInvntr.getCheckedRows(0);
    	var insertList = [];
    	var totSpmtQntt = 0;

    	let spmtYmd		= SBUxMethod.get("dtl-dtp-spmtYmd");
    	let cnptCd		= SBUxMethod.get("dtl-inp-cnptCd");
    	let trsprtCoCd	= SBUxMethod.get("dtl-slt-trsprtCoCd");
    	let trsprtCoNm	= SBUxMethod.getText("dtl-slt-trsprtCoCd");
    	let vhclno		= SBUxMethod.get("dtl-inp-vhclno");
    	let dldtn		= SBUxMethod.get("dtl-inp-dldtn");
    	let trsprtCst	= SBUxMethod.get("dtl-inp-trsprtCst");
    	let rmrk		= SBUxMethod.get("dtl-inp-rmrk");
    	let spmtCmndno	= SBUxMethod.get("dtl-inp-spmtCmndno");
    	let outordrno	= SBUxMethod.get("dtl-inp-outordrno");

    	if(gfn_isEmpty(spmtYmd)){
    		gfn_comAlert("W0001", "출하일자");			//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if(gfn_isEmpty(cnptCd)){
    		gfn_comAlert("W0001", "거래처");			//	W0001	{0}을/를 선택하세요.
            return;
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdGdsInvntr.getRowData(nRow)
    		let spmtQntt = rowData.spmtQntt
    		let smptWght = rowData.smptWght;
    		let spmtPckgUnitCd = rowData.spmtPckgUnitCd;
    		let gdsGrd = rowData.gdsGrd;
    		let brndNm = rowData.brndNm;
    		let gdsCd = rowData.gdsCd;
    		totSpmtQntt = totSpmtQntt + Number(spmtQntt);

    		if(smptWght == 0){
    			gfn_comAlert("W0001", "출하중량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}
    		if(gfn_isEmpty(spmtPckgUnitCd)){
    			gfn_comAlert("W0002", "포장단위");		//	W0002	{0}을/를 선택하세요.
    			return;
    		}

    		if(gfn_isEmpty(gdsGrd)){
    			gfn_comAlert("W0002", "등급");			//	W0002	{0}을/를 선택하세요.
    			return;
    		}

    		if(cmndYn){
    			let cmndGdsGrd = SBUxMethod.get("dtl-slt-gdsGrd");
    			let cmndSpmtPckgUnitCd = SBUxMethod.get("dtl-slt-spmtPckgUnit");

    			if(gdsGrd != cmndGdsGrd){
    				gfn_comAlert("W0006", "지시등급", "실적등급");			// W0006 {0}와/과 {1}이/가 서로 다릅니다.
    				return;
    			}

    			if(spmtPckgUnitCd != cmndSpmtPckgUnitCd){
    				gfn_comAlert("W0006", "지시포장단위", "실적포장단위");	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
    				return;
    			}
    		}

    		grdGdsInvntr.setCellData(nRow, 14, spmtYmd);
    		grdGdsInvntr.setCellData(nRow, 15, cnptCd);
    		grdGdsInvntr.setCellData(nRow, 16, trsprtCoCd);
    		grdGdsInvntr.setCellData(nRow, 17, trsprtCoNm);
    		grdGdsInvntr.setCellData(nRow, 18, vhclno);
    		grdGdsInvntr.setCellData(nRow, 19, dldtn);
    		grdGdsInvntr.setCellData(nRow, 20, trsprtCst);
    		grdGdsInvntr.setCellData(nRow, 21, rmrk);
    		grdGdsInvntr.setCellData(nRow, 22, spmtCmndno);
    		grdGdsInvntr.setCellData(nRow, 23, brndNm);
    		grdGdsInvntr.setCellData(nRow, 24, outordrno);
    		grdGdsInvntr.setCellData(nRow, 25, gdsCd);
    		insertList.push(grdGdsInvntr.getRowData(nRow));
    	}

		if(cmndYn){
			let cmndQntt = SBUxMethod.get("dtl-inp-cmndQntt");
			let gdsGrd = SBUxMethod.get("dtl-slt-gdsGrd");
			let spmtPckgUnit = SBUxMethod.get("dtl-slt-spmtPckgUnit");

			if(totSpmtQntt != cmndQntt ){
	    		gfn_comAlert("W0006", "지시수량", "실적수량");			// W0006 {0}와/과 {1}이/가 서로 다릅니다.
	    		return
	    	}
		}

    	let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncList.do", insertList);
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.insertedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}

    }

	const fn_setGrdSmptPrfmnc = async function(){
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");
		let spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");

		const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDtlList.do", {
			apcCd		: gv_selectedApcCd,
			vrtyCd		: vrtyCd,
			spcfctCd 	: spcfctCd,
			gdsSeCd 	: gdsSeCd,
			spmtYmd		: spmtYmd
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonSpmtPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const gdsSpmtPrfmnc = {
          				apcCd			: item.apcCd,
          				spmtno			: item.spmtno,
          				spmtYmd			: item.spmtYmd,
          				itemCd			: item.itemCd,
          				itemNm			: item.itemNm,
          				vrtyCd			: item.vrtyCd,
          				vrtyNm			: item.vrtyNm,
          				spcfctCd		: item.spcfctCd,
          				spcfctNm		: item.spcfctNm,
          				gdsGrd			: item.gdsGrd,
          				gdsGrdNm		: item.gdsGrdNm,
          				cnptCd			: item.cnptCd,
          				cnptNm			: item.cnptNm,
          				trsprtCoCd		: item.trsprtCoCd,
          				trsprtCoNm		: item.trsprtCoNm,
          				delYn			: item.delYn,
          				vhclno			: item.vhclno,
          				dldtn			: item.dldtn,
          				trsprtCst		: item.trsprtCst,
          				spmtSeCd		: item.spmtSeCd,
          				spmtPrsnDclrnlo	: item.spmtPrsnDclrnlo,
          				plorCd			: item.plorCd,
          				pckgno			: item.pckgno,
          				pckgSn			: item.pckgSn,
          				brndNm			: item.brndNm,
          				gdsCd			: item.gdsCd,
          				prdcrCd			: item.prdcrCd,
          				spmtCmndno		: item.spmtCmndno,
          				spmtPckgUnitCd	: item.spmtPckgUnitCd,
          				spmtPckgUnitNm	: item.spmtPckgUnitNm,
          				spmtQntt		: item.spmtQntt,
          				spmtWght		: item.spmtWght,
          				rmrk			: item.rmrk

  				}
          		jsonSpmtPrfmnc.push(gdsSpmtPrfmnc);
  			});
          	grdSpmtPrfmnc.refresh();

		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
	}

	const fn_reset = function () {
		SBUxMethod.set("dtl-inp-spmtCmndno", "");
		SBUxMethod.set("dtl-inp-cmndQntt", "");
		SBUxMethod.set("dtl-inp-cmndWght", "");
		SBUxMethod.set("dtl-slt-trsprtCoCd", "");
		SBUxMethod.set("dtl-inp-cnptCd", "");
		SBUxMethod.set("dtl-inp-cnptNm", "");
		SBUxMethod.set("dtl-inp-dldtn", "");
		SBUxMethod.set("dtl-slt-gdsGrd", "");
		SBUxMethod.set("dtl-slt-outordrno", "");
		SBUxMethod.set("srch-slt-itemCd", "");
		SBUxMethod.set("srch-slt-vrtyCd", "");
		SBUxMethod.set("srch-slt-spcfctCd", "");
		SBUxMethod.set("dtl-slt-spmtPckgUnit", "");

		jsonGdsInvntr.length = 0;
		jsonSpmtPrfmnc.length = 0;
		grdGdsInvntr.refresh();
		grdSpmtPrfmnc.refresh();

		cmndYn = false;
	}

	/**
	 * 거래처 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceCnpt = function() {
		let cnptNm = SBUxMethod.get("dtl-inp-cnptNm");
		popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, cnptNm, fn_setCnpt);
	}
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set("dtl-inp-cnptCd", cnpt.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cnpt.cnptNm);
		}
	}
	/*
	 * 거래처 팝업 필수 함수
	 * 종료
	 */

	/**
	 * 출하지시 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceSpmtCmnd = function() {
		let cmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
		popSpmtCmnd.init(gv_selectedApcCd, gv_selectedApcNm, cmndno, fn_setSpmtCmnd);
	}
	const fn_setSpmtCmnd = async function(cmnd) {
		if (!gfn_isEmpty(cmnd)) {
			SBUxMethod.set("dtl-inp-spmtCmndno", cmnd.spmtCmndno);
			SBUxMethod.set("dtl-inp-cmndQntt", cmnd.cmndQntt);
			SBUxMethod.set("dtl-inp-cmndWght", cmnd.cmndWght);
			SBUxMethod.set("dtl-slt-trsprtCoCd", cmnd.trsprtCoCd);
			SBUxMethod.set("dtl-inp-cnptCd", cmnd.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cmnd.cnptNm);
			SBUxMethod.set("dtl-inp-dldtn", cmnd.dldtn);
			SBUxMethod.set("dtl-inp-rmrk", cmnd.rmrk);
			SBUxMethod.set("dtl-inp-outordrno", cmnd.outordrno);
			SBUxMethod.set("dtl-slt-gdsGrd", cmnd.gdsGrd);
			SBUxMethod.set("srch-slt-itemCd", cmnd.itemCd);
			SBUxMethod.set("srch-slt-vrtyCd", cmnd.vrtyCd);

			let rst = await Promise.all([
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',			jsonComSpcfct, 			gv_apcCd, cmnd.itemCd), 				// 규격
				gfn_setSpmtPckgUnitSBSelect('dtl-slt-spmtPckgUnit', 	jsonDtlSpmtPckgUnit, 	gv_apcCd, cmnd.itemCd, cmnd.vrtyCd),	// 포장구분
				gfn_setSpmtPckgUnitSBSelect('grdGdsInvntr', 			jsonGrdSpmtPckgUnit, 	gv_apcCd, cmnd.itemCd, cmnd.vrtyCd)		// 포장구분(그리드)
			])
			grdGdsInvntr.refresh({"combo":true})
			SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");

			SBUxMethod.set("srch-slt-spcfctCd", cmnd.spcfctCd);
			SBUxMethod.set("dtl-slt-spmtPckgUnit", cmnd.spmtPckgUnitCd);

			fn_search();

			cmndYn = true;
		}
	}
	/*
	 * 출하지시 팝업 필수 함수
	 * 종료
	 */

	/**
     * @name fn_docSpmt
     * @description 송품장 발행 버튼
     */
 	const fn_docSpmt = function() {

 		const spmtnoList = [];
		const allData = grdSpmtPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				spmtnoList.push(item.spmtno);
    		}
		});

 		if (spmtnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const spmtno = spmtnoList.join("','");
 		gfn_popClipReport("송품장", "am/trsprtCmdtyDoc.crf", {apcCd: gv_selectedApcCd, spmtno: spmtno});
 	}

</script>
</html>