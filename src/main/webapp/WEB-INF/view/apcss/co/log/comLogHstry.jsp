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
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>
			
			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>조회일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-inqYmd" name="srch-dtp-inqYmd" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="5"></td>
							<th scope="row" class="th_bg">재고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-invntrSeCd" name="srch-slt-invntrSeCd" uitype="single" unselected-text="선택" jsondata-ref="jsonComInvntrSeCd" class="form-control input-sm"></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>								
							<th scope="row" class="th_bg">품목/품종</th>
						    <td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" jsondata-ref="jsonApcSpcfct" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
	   								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
	   								autocomplete-select-callback="fn_onSelectPrdcrNm"
	  								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td></td>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-gdsSeCd" name="srch-slt-gdsSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComGdsSeCd"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-wrhsSeCd" name="srch-slt-wrhsSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWrhsSeCd"></sbux-select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnLogCntnHstry" name="btnLogCntnHstry" uitype="normal" data-tab="comLogCntnHstry" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
						<sbux-button id="btnLogMenuHstry" name="btnLogMenuHstry" uitype="normal" data-tab="comLogMenuHstry" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
						<sbux-button id="btnLogTrsmHstry" name="btnLogTrsmHstry" uitype="normal" data-tab="comLogTrsmHstry" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
						<sbux-button id="btnLogBatchHstry" name="btnLogBatchHstry" uitype="normal" data-tab="comLogBatchHstry" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					</div>
				</div>
				<div id="tab_content"></div>
			</div>
		</div>
	</section>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	$(function(){
		// tab operation 
		$('.ad_tbl_top2 button').click(function() {
			var activeTab = "com" + $(this).attr('id').slice(3);
			$('#tab_content').load(activeTab + ".do");
		});
	   	$('#btnLogCntnHstry').click();
	});

	var jsonApcItem				= [];	// 품목 			itemCd			검색
	var jsonApcVrty				= [];	// 품종 			vrtyCd			검색
	var jsonApcSpcfct			= [];	// 규격 			spcfct			검색
	var jsonComInvntrSeCd		= [];	// 재고구분 		invntrSeCd		검색
	var jsonComWarehouseSeCd	= [];	// 창고구분 		warehouseSeCd	검색
	var jsonComGdsSeCd			= [];	// 상품구분 		gdsSeCd			검색
	var jsonComWrhsSeCd			= [];	// 입고구분 		wrhsSeCd		검색
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 			gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 			gv_selectedApcCd),						// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonApcSpcfct, 			gv_selectedApcCd),						// 규격
			gfn_setComCdSBSelect('srch-slt-invntrSeCd', 	jsonComInvntrSeCd, 		'INVNTR_SE', 		gv_selectedApcCd),	// 재고구분
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 창고구분
			gfn_setComCdSBSelect('srch-slt-gdsSeCd', 		jsonComGdsSeCd, 		'GDS_SE_CD', 		gv_selectedApcCd),	// 상품구분
			gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 		'WRHS_SE_CD', 		gv_selectedApcCd)	// 입고구분
		]);
	}

	/**
	 * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-inqYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inqYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inqYmdTo", gfn_dateToYmd(new Date()));
		
		fn_initSBSelect();
	})

 	// APC 선택 변경
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
	}
	
    /**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd),	// 규격
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
	
	/*
	*
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
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
</script>
</html>