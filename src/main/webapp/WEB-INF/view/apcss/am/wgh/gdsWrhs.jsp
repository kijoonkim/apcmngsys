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

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title">▶ 상품입고등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal"  text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
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
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm-ast input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds1" name="srch-rdo-gds" uitype="normal" class="radio_label" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds2" name="srch-rdo-gds" uitype="normal" class="radio_label" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds3" name="srch-rdo-gds" uitype="normal" class="radio_label" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds4" name="srch-rdo-gds" uitype="normal" class="radio_label" text="유기농"/>
								</p>
							</td>

							<th scope="row" class="th_bg"><span class="data_required"></span>매입처</th>
						    <td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-cnpt" name="srch-inp-cnpt" class="form-control input-sm-ast inpt_data_reqed input-sm"/>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											class="form-control input-sm input-sm-ast"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										/>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="선택"
											uitype="single"
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										/>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>수량/중량</th>
							<td colspan="4" class="td_input"style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qntt" name="srch-inp-qntt" class="form-control input-sm-ast inpt_data_reqed input-sm"/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qnttAvg" name="srch-inp-qnttAvg" class="form-control input-sm" placeholder="평균" disabled/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wght" name="srch-inp-wght" class="form-control input-sm-ast inpt_data_reqed input-sm"/>
							</td>
							<td colspan="3">
								<sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"/>
							</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonApcSpcfct"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-bx" name="srch-slt-bx" class="form-control input-sm" jsondata-ref="jsonComBx"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="9">&nbsp;</td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품입고내역</span></li>
					</ul>
				</div>
                <div class="sbt-wrap-body">
                    <div class="sbt-grid">
                        <div id="inptCmndDsctnGridArea" style="height:340px;"></div>
                    </div>
               	</div>
			</div>
		</div>
	</section>
    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="매입처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonApcItem				= [];	// 품목 		itemCd		검색
	var jsonApcVrty				= [];	// 품종 		vrtyCd		검색
	var jsonApcSpcfct			= [];	// 규격 		spcfcCd		검색
	var jsonComBx				= [];	// 규격 		spcfcCd		검색
	var jsonComWarehouseSeCd	= [];	// 팔레트/박스 	warehouse	검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd);			// 창고
	 	gfn_setPltBxSBSelect('srch-slt-bx', 	jsonComBx,  gv_selectedApcCd, 'B');			// 박스
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd);	// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);	// 품종
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonApcSpcfct, gv_selectedApcCd, itemCd);		// 규격
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		fn_initSBSelect();

	});

	var inptCmndDsctnList =  []; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = ["test"]; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["입고번호"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고일자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["거래처"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["수량"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["중량"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["박스종류"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	
	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),							// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd),					// 규격
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}
	
	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
	}
	
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
		}
	}
</script>
</html>