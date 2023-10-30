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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 상품코드조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
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
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품코드</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsCd" name="srch-inp-gdsCd" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComVrty" onchange="fn_selectVrty"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonSpcfct"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonGdsGrd"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">브랜드</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-input id="srch-inp-brndCd" name="srch-inp-brndCd" uitype="text" class="form-control input-sm"></sbux-input>
									</div>
								</div>
							</td>
							<td colspan="2">
							<th scope="row" class="th_bg">산지</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-plorCd" name="srch-slt-plorCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-pckgSeCd" name="srch-slt-pckgSeCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComSpmtPckgUnit"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품코드내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdGdsCd" style="width:100%;height:500px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
var jsonComItem = 			[];
var jsonComVrty = 			[];
var jsonSpcfct = 			[];
var jsonGdsGrd = 			[];
var jsonComSpmtPckgUnit =  [];

const fn_initSBSelect = async function() {
	
	let itemCd = SBUxMethod.get("srch-slt-itemCd");
	
	let rst = await Promise.all([
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
// 	 	gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd, gv_selectedApcCd),	// 규격
	 	gfn_setComCdSBSelect('srch-slt-gdsGrd', 		jsonGdsGrd,		'GDS_GRD'),									// 상품등급
	 	gfn_setSpmtPckgUnitSBSelect('srch-slt-pckgSeCd', 	jsonComSpmtPckgUnit, 	gv_selectedApcCd, itemCd)	// 포장구분
	])
	SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');
}

const fn_selectItem = async function(){
	let itemCd = SBUxMethod.get("srch-slt-itemCd");
	let rst = await Promise.all([
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd, itemCd),	// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',			jsonSpcfct, 				gv_selectedApcCd, itemCd),	// 규격
		stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
	])
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
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 			jsonSpcfct, 				gv_selectedApcCd, itemCd),	// 규격
		gfn_setSpmtPckgUnitSBSelect('excel-slt-spmtPckgUnit', 	jsonExeclComSpmtPckgUnit, 	gv_selectedApcCd, itemCd),	// 포장구분
		stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
	])
}


	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createGdsCdGrid();
		fn_search();
	})
	
	var grdGdsCd;
	var jsonGdsCd = [];
	
	function fn_createGdsCdGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGdsCd';
	    SBGridProperties.id = 'grdGdsCd';
	    SBGridProperties.jsonref = 'jsonGdsCd';
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
            {caption: ['상품코드'], 		ref: 'gdsCd', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품명'], 		ref: 'gdsNm', 			width: '11%', 	type: 'output', style: 'text-align:center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품등급'], 		ref: 'gdsGrdNm', 		width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['브랜드'], 		ref: 'brndNm', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['산지'], 			ref: 'plorCd', 			width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['포장구분'], 		ref: 'spmtPckgUnitNm', 	width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['입수'], 			ref: 'bxGdsQntt', 		width: '9%', 	type: 'output', style: 'text-align:center'},
            {caption: ['중량'], 			ref: 'wght', 			width: '8%', 	type: 'output', style: 'text-align:center',
            	format : {type:'number', rule:'#,### kg'}
            }
        ];
        grdGdsCd = _SBGrid.create(SBGridProperties);
    }
	
	//조회
    const fn_search = async function() {

    	grdGdsCd.rebuild();
    	let pageSize = grdGdsCd.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonGdsCd.length = 0;
    	grdGdsCd.clearStatus();
    	fn_setGrdPckgPrfmnc(pageSize, pageNo);
    }

	const fn_setGrdPckgPrfmnc = async function(pageSize, pageNo) {
		//검색조건
		let gdsCd = SBUxMethod.get('srch-inp-gdsCd');
		let itemCd = SBUxMethod.get('srch-slt-itemCd');
		let vrtyCd = SBUxMethod.get('srch-slt-vrtyCd');
		let spcfctCd = SBUxMethod.get('srch-slt-spcfctCd');
		let gdsGrd = SBUxMethod.get('srch-slt-gdsGrd');
		let brndCd = SBUxMethod.get('srch-slt-brndCd');
		let plorCd = SBUxMethod.get('srch-slt-plorCd');
		let pckgSeCd = SBUxMethod.get('srch-slt-pckgSeCd');


		const postJsonPromise = gfn_postJSON("/am/pckg/selectGdsCdList.do", {
			apcCd		:  gv_selectedApcCd,
			gdsCd		: gdsCd,
			itemCd		: itemCd,
			vrtyCd		: vrtyCd,
			spcfctCd	: spcfctCd,
			gdsGrd		: gdsGrd,
			brndCd		: brndCd,
			plorCd		: plorCd,
			pckgSeCd	: pckgSeCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

            jsonGdsCd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const gdsCd = {
          			gdsCd: item.gdsCd,
          			gdsNm: item.gdsNm,
          			itemNm: item.itemNm,
          			vrtyNm: item.vrtyNm,
          			spcfctNm: item.spcfctNm,
          			gdsGrdNm: item.gdsGrdNm,
          			brndNm: item.brndNm,
          			plorCd: item.plorCd,
          			spmtPckgUnitNm: item.spmtPckgUnitNm,
          			bxGdsQntt: item.bxGdsQntt,
        			wght: item.wght
  				}
          		jsonGdsCd.push(gdsCd);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonGdsCd.length > 0) {
          		if(grdGdsCd.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdGdsCd.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdGdsCd.rebuild();
  				}else{
  					grdGdsCd.refresh();
  				}
          	} else {
          		grdGdsCd.setPageTotalCount(totalRecordCount);
          		grdGdsCd.rebuild();
          	}

//           	document.querySelector('#cnt-pckgPrfmnc').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
</script>
</html>