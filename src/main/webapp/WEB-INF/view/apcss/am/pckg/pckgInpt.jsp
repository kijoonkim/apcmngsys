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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 포장실적조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSort" name="btnDocSort" uitype="normal" class="btn btn-sm btn-success" text="선별확인서" onclick="fn_docSort"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
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
						<col style="width: 6%">
					    <col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromPckgYmd" name="srch-dtp-fromPckgYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toPckgYmd" name="srch-dtp-toPckgYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonItem" onchange="fn_selectItem"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonVrty"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-pckgSeCd" name="srch-slt-pckgSeCd" uitype="single" unselected-text="선택" class="form-control input-sm" jsondata-ref="jsonComFcltCd"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-strgWarehouse" name="srch-slt-strgWarehouse" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouse" ></sbux-select>
									</div>
								</div>
							</td>
							<td colspan= "2"></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonSpcfct"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg" style="border-right: hidden;">대표생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prdcrNm" name="srch-inp-prdcrNm" class="form-control input-sm"
								placeholder="초성검색 기능입니다." autocomplete-ref="autoCompleteDataJson" autocomplete-text="name"
    							onkeyup="keyUpInp(srch-inp-prdcrNm, 'srch-inp-prdcrNm', 'false')"></sbux-input>
						    </td>
						    <td class="td_input">
					    		<sbux-button id="btnSrchRprsPrdcrCd" name="btnSrchRprsPrdcrCd" uitype="modal" class="btn btn-xs btn-outline-dark" text="찾기" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-grdCd" name="srch-slt-grdCd" uitype="single" jsondata-ref="jsonGrd" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgInpt" style="width:100%;height:450px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	 <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonItem			= [];	// 품목 	itemCd			검색
	var jsonVrty			= [];	// 품종 	vrtyCd			검색
	var jsonGrd				= [];	// 등급 	grdCd			검색
	var jsonSpcfct			= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd			검색
	var autoCompleteDataJson = [];
	var jsonDataPrdcr = [];
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	await gfn_setComCdSBSelect('srch-slt-pckgSeCd', 		jsonComFcltCd, 	'FCLT_CD', gv_apcCd);				// 선벌기
	 	await gfn_setComCdSBSelect('srch-slt-strgWarehouse',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_apcCd);	// 선벌기
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonItem, gv_apcCd);	// 품목
	 	await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonVrty, gv_apcCd);	// 품종

		jsonDataPrdcr =  await gfn_getPrdcrs(gv_apcCd);
	}

	async function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonVrty, 	gv_apcCd, itemCd);		// 품종
		await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_apcCd, itemCd);	// 규격
		await gfn_setApcGrdsSBSelect('srch-slt-grdCd', 			jsonGrd, 	gv_apcCd, itemCd);	// 등급
		console.log(jsonSpcfct);
	}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createPckgInptGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromPckgYmd", year+month+day);
		SBUxMethod.set("srch-dtp-toPckgYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		fn_initSBSelect();
	})

	function fn_createPckgInptGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInpt';
	    SBGridProperties.id = 'grdPckgInpt';
	    SBGridProperties.jsonref = 'jsonPckgInpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
            {caption: ['포장내역','포장내역'], ref: 'pckgDsctn', width: '100px', type: 'output'},
            {caption: ['포장일자','포장일자'], ref: 'pckgYmd', width: '100px', type: 'output'},
            {caption: ['지시번호','지시번호'], ref: 'pckgCmndno', width: '100px', type: 'output'},
            {caption: ['품종','품종'], ref: 'vrtyCd', width: '100px', type: 'output'},
            {caption: ['규격','규격'], ref: 'spcfctCd', width: '100px', type: 'output'},
            {caption: ['상품등급','상품등급'], ref: 'gdsGrd', width: '100px', type: 'output'},
            {caption: ['중량','중량'], ref: 'wght', width: '100px', type: 'output'},
            {caption: ['포장기','포장기'], ref: 'pckg', width: '100px', type: 'output'},
            {caption: ['대표생산자','대표생산자'], ref: 'rprsPrdcrCd', width: '100px', type: 'output'},
            {caption: ['창고','창고'], ref: 'warehouseSeCd', width: '100px', type: 'output'},
            {caption: ['포장','수량'], ref: 'pckgQntt', width: '100px', type: 'output'},
            {caption: ['포장','중량'], ref: 'pckgWght', width: '100px', type: 'output'},
            {caption: ['출하','수량'], ref: 'spmtQntt', width: '100px', type: 'output'},
            {caption: ['출하','중량'], ref: 'spmtWght', width: '100px', type: 'output'}
        ];
        grdPckgInpt = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>