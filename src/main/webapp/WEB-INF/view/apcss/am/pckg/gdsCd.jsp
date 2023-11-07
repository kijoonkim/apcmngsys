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
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
								<sbux-input uitype="text" id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComSpcfct"></sbux-select>
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
										<sbux-select id="srch-slt-spmtPckgUnit" name="srch-slt-spmtPckgUnit" uitype="single" unselected-text="전체" class="form-control input-sm" jsondata-ref="jsonComSpmtPckgUnit"></sbux-select>
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
	<!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComItem = 			[];
	var jsonComVrty = 			[];
	var jsonComSpcfct = 		[];
	var jsonGdsGrd = 			[];
	var jsonComSpmtPckgUnit =  [];

	const fn_initSBSelect = async function() {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-inp-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('srch-slt-gdsGrd', 		jsonGdsGrd,		'GDS_GRD'),									// 상품등급
		])
	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		if(gfn_isEmpty(itemCd)){
			jsonComSpcfct.length = 0;
			jsonComSpmtPckgUnit.length=0;
		}else{
			let rst = await Promise.all([
				gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnit', 	jsonComSpmtPckgUnit, 	gv_selectedApcCd, itemCd),	// 포장구분
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 			jsonComSpcfct, 			gv_selectedApcCd, itemCd),	// 규격
			])
		}
		SBUxMethod.refresh("srch-slt-spcfctCd");
		SBUxMethod.refresh("srch-slt-spmtPckgUnit");
	}
	const fn_modalVrty = function() {
		popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}
	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.setValue('srch-inp-vrtyCd', '');
			SBUxMethod.setValue('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', '');
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			var _vrtyCds = [];

			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', '');
			SBUxMethod.set('srch-inp-vrtyNm', _vrtys.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
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
        grdGdsCd.bind( "beforepagechanged" , "fn_pagingGrd" );
    }

	const fn_pagingGrd = async function(){
    	let pageSize = grdGdsCd.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdGdsCd.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdPckgPrfmnc(pageSize, pageNo);
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
		let vrtyCd = SBUxMethod.get('srch-inp-vrtyCd');
		let spcfctCd = SBUxMethod.get('srch-slt-spcfctCd');
		let gdsGrd = SBUxMethod.get('srch-slt-gdsGrd');
		let brndCd = SBUxMethod.get('srch-slt-brndCd');
		let plorCd = SBUxMethod.get('srch-slt-plorCd');
		let pckgSeCd = SBUxMethod.get('srch-slt-pckgSeCd');


		const postJsonPromise = gfn_postJSON("/am/pckg/selectGdsCdList.do", {
			apcCd		: gv_selectedApcCd,
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
          			gdsCd				: item.gdsCd
          		  ,	gdsNm				: item.gdsNm
          		  ,	itemNm				: item.itemNm
          		  ,	vrtyNm				: item.vrtyNm
          		  ,	spcfctNm			: item.spcfctNm
          		  ,	gdsGrdNm			: item.gdsGrdNm
          		  ,	brndNm				: item.brndNm
          		  ,	plorCd				: item.plorCd
          		  ,	spmtPckgUnitNm		: item.spmtPckgUnitNm
          		  ,	bxGdsQntt			: item.bxGdsQntt
          		  ,	wght				: item.wght
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


          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
</script>
</html>