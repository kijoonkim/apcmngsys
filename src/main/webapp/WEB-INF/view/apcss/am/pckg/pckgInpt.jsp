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
					<sbux-button id="btnDocPckg" name="btnDocPckg" uitype="normal" class="btn btn-sm btn-success" text="포장확인서" onclick="fn_docPckg"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_selectSortInptList()"></sbux-button>
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
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
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
								placeholder="초성검색 가능" autocomplete-ref="autoCompleteDataJson" autocomplete-text="name"
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
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
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
// 	const fn_initSBSelect = async function() {
// 		// 검색 SB select
// 	 	await gfn_setComCdSBSelect('srch-slt-pckgSeCd', 		jsonComFcltCd, 	'FCLT_CD', gv_selectedApcCd);				// 선벌기
// 	 	await gfn_setComCdSBSelect('srch-slt-strgWarehouse',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd);	// 선벌기
// 	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonItem, gv_selectedApcCd);	// 품목
// 	 	await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonVrty, gv_selectedApcCd);	// 품종

// 		jsonDataPrdcr =  await gfn_getPrdcrs(gv_selectedApcCd);
// 	}
	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-pckgSeCd', 		jsonComFcltCd, 	'FCLT_CD', gv_selectedApcCd),				// 선별기
		 	gfn_setComCdSBSelect('srch-slt-strgWarehouse',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 선별기
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonItem, gv_selectedApcCd),								// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonVrty, gv_selectedApcCd)		// 품종
		])
	}

	async function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd);	// 규격
		await gfn_setApcGrdsSBSelect('srch-slt-grdCd', 			jsonGrd, 	gv_selectedApcCd, itemCd);	// 등급
		console.log(jsonSpcfct);
		fn_getPrdcrs();
	}
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
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
		fn_selectSortInptList();
	})

	function fn_createPckgInptGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInpt';
	    SBGridProperties.id = 'grdPckgInpt';
	    SBGridProperties.jsonref = 'jsonPckgInpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
            {caption: ['포장내역','포장내역'], 	ref: 'fcltNm', 			width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['포장일자','포장일자'], 	ref: 'pckgYmd', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['지시번호','지시번호'], 	ref: 'pckgCmndno', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['품종','품종'], 			ref: 'vrtyNm', 			width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['규격','규격'], 			ref: 'spcfctNm', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['상품등급','상품등급'], 	ref: 'gdsGrdNm', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['중량','중량'], 			ref: 'pckgWght', 			width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['포장기','포장기'], 		ref: 'fcltNm', 			width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['대표생산자','대표생산자'],ref: 'rprsPrdcrNm', 	width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['창고','창고'], 			ref: 'warehouseSeNm', 	width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['포장','수량'], 			ref: 'pckgQntt', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['포장','중량'], 			ref: 'pckgWght', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['출하','수량'], 			ref: 'spmtQntt', 		width: '7.15%', type: 'output', style:'text-align:center'},
            {caption: ['출하','중량'], 			ref: 'spmtWght', 		width: '7.15%', type: 'output', style:'text-align:center'}
        ];
        grdPckgInpt = _SBGrid.create(SBGridProperties);
    }
	
	 //조회
    const fn_selectSortInptList = async function() {
    	grdPckgInpt.rebuild();
    	let pageSize = grdPckgInpt.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonPckgInpt.length = 0;
    	grdPckgInpt.clearStatus();
    	fn_callSelectSortInptList(pageSize, pageNo);

    }

    var newSortInptPrfmncGridData = [];
	const fn_callSelectSortInptList = async function(pageSize, pageNo) {
    	let fromPckgYmd = SBUxMethod.get("srch-dtp-fromPckgYmd");
    	let toPckgYmd = SBUxMethod.get("srch-dtp-toPckgYmd");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
    	let fcltCd = SBUxMethod.get("srch-slt-pckgSeCd");
    	let strgWarehouse = SBUxMethod.get("srch-slt-strgWarehouse");
    	let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
    	let prdcrNm = SBUxMethod.get("srch-inp-prdcrNm");
    	let grdCd = SBUxMethod.get("srch-slt-grdCd");
    	
		const postJsonPromise = gfn_postJSON("/am/pckg/pckgInpt.do", {
			apcCd		: gv_selectedApcCd,
			fromPckgYmd: fromPckgYmd,
			toPckgYmd: toPckgYmd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			fcltCd: fcltCd,
			strgWarehouse: strgWarehouse,
			spcfctCd: spcfctCd,
			prdcrNm: prdcrNm,
			grdCd: grdCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

		console.log('test','test');
        let data = await postJsonPromise;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
			console.log('try','try');
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonPckgInpt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgPrfmnc = {
        			fcltNm: item.fcltNm,
       				pckgYmd: item.pckgYmd,
       				pckgCmndno: item.pckgCmndno,
       				vrtyNm: item.vrtyNm,
       				spcfctNm: item.spcfctNm,
       				gdsGrdNm: item.gdsGrdNm,
       				pckgWght: item.pckgWght,
       				fcltNm: item.fcltNm,
       				rprsPrdcrNm: item.rprsPrdcrNm,
       				warehouseSeNm: item.warehouseSeNm,
       				pckgQntt: item.pckgQntt,
       				pckgWght: item.pckgWght,
       				spmtQntt: item.spmtQntt,
       				spmtWght: item.spmtWght
  				}
  				jsonPckgInpt.push(pckgPrfmnc);
          		console.log('pckgPrfmnc',pckgPrfmnc);
          		console.log('jsonPckgInpt',jsonPckgInpt);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
			console.log('jsonPckgInpt',jsonPckgInpt);
			console.log('jsonPckgInpt.length',jsonPckgInpt.length);
          	if (jsonPckgInpt.length > 0) {
          		if(grdPckgInpt.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdPckgInpt.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdPckgInpt.rebuild();
  				}else{
  					grdPckgInpt.refresh();
  				}
          	} else {
          		grdPckgInpt.setPageTotalCount(totalRecordCount);
          		grdPckgInpt.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
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
		SBUxMethod.set("srch-inp-prdcrCd", null);
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

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>