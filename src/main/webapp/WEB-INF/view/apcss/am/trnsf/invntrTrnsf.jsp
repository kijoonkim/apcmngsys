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
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 재고이송조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
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
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">이송일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromTrnsfYmd" name="srch-dtp-fromTrnsfYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toTrnsfYmd" name="srch-dtp-toTrnsfYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">이송APC</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-trnsfSn" name="srch-slt-trnsfSn" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td ></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-gdsSeCd" name="srch-slt-gdsSeCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-wrhsSeCd" name="srch-slt-wrhsSeCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>이송 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdInvntrTrnsf" style="width:100%;height:500px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createInvntrTrnsfGrid();

		SBUxMethod.set("srch-dtp-fromTrnsfYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-toTrnsfYmd", gfn_dateToYmd(new Date()));
	})

	function fn_createInvntrTrnsfGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvntrTrnsf';
	    SBGridProperties.id = 'grdInvntrTrnsf'; //grdInvntrTrnsf
	    SBGridProperties.jsonref = 'jsonInvntrTrnsf'; //jsonInvntrTrnsf
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
        	{caption : ["선택", "선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['이송APC','이송APC'], 			ref: 'trnsfApcNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['이송일자','이송일자'], 			ref: 'trnsfYmd', 	width: '110px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['재고구분','재고구분'], 			ref: 'invntrSeNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['입고번호','입고번호'], 			ref: 'wrhsno', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['입고일자','입고일자'], 			ref: 'wrhsYmd', 	width: '110px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['등급','등급'], 					ref: 'grdNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['생산자','생산자'], 				ref: 'prdcrNm',	 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['품목','품목'], 					ref: 'itemNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['품종','품종'], 					ref: 'vrtyNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['규격','규격'], 					ref: 'spcfctNm', 	width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['상품구분','상품구분'], 			ref: 'gdsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['입고구분','입고구분'], 			ref: 'wrhsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['운송구분','운송구분'], 			ref: 'trsprtSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['창고','창고'], 					ref: 'warehouseSeNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['이송','수량'], 					ref: 'trnsfQntt', 	width: '60px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['이송','중량'], 					ref: 'trnsfWght', 	width: '80px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['확정여부','확정여부'], 			ref: 'cfmtnNm', 	width: '100px', type: 'output', style: 'text-align:center'}
        ];
        grdInvntrTrnsf = _SBGrid.create(SBGridProperties);

        fn_search();
    }

	//조회
    const fn_search = async function() {
    	grdInvntrTrnsf.rebuild();
    	let pageSize = grdInvntrTrnsf.getPageSize();
    	let pageNo = 1;

    	fn_callSelectGridList(pageSize, pageNo);
	}

	const fn_callSelectGridList = async function(pageSize, pageNo) {

// 		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");

		const postJsonPromise1 = gfn_postJSON("/am/trnsf/selectTrnsfInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise1;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonInvntrTrnsf.length = 0;
          	data.resultList.forEach((item, index) => {
          		let wrhsno ="";
          		if(item.invntrSeCd == "1"){
          			wrhsno = item.wrhsno
          		}
          		if(item.invntrSeCd == "2"){
          			wrhsno = item.sortno
          		}
          		if(item.invntrSeCd == "3"){
          			wrhsno = item.pckgno
          		}
          		const invntrTrnsf = {
          			  apcCd				: item.apcCd
          			, wrhsno			: wrhsno
          			, sortno			: item.sortno
          			, sortSn			: item.sortSn
          			, pckgno			: item.pckgno
          			, pckgSn			: item.pckgSn
          			, trnsfYmd			: item.trnsfYmd
          			, trnsfSn			: item.trnsfSn
          			, wrhsYmd			: item.wrhsYmd
          			, grdCd				: item.grdCd
          			, grdNm				: item.grdNm
          			, itemNm			: item.itemNm
          			, itemCd			: item.itemCd
          			, vrtyNm			: item.vrtyNm
          			, vrtyCd			: item.vrtyCd
          			, spcfctCd			: item.spcfctCd
          			, spcfctNm			: item.spcfctNm
          			, prdcrCd			: item.prdcrCd
          			, prdcrNm			: item.prdcrNm
          			, gdsSeNm			: item.gdsSeNm
          			, gdsSeCd			: item.gdsSeCd
          			, wrhsSeNm			: item.wrhsSeNm
          			, wrhsSeCd			: item.wrhsSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, invntrSeCd		: item.invntrSeCd
          			, invntrSeNm		: item.invntrSeNm
          			, trsprtSeCd		: item.trsprtSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, warehouseSeNm		: item.warehouseSeNm
          			, warehouseSeCd		: item.warehouseSeCd
          			, trnsfQntt			: item.trnsfQntt
          			, trnsfWght			: item.trnsfWght
          			, trnsfApcNm		: item.trnsfApcNm
          			, trnsfApcCd		: item.trnsfApcCd
          			, cfmtnNm			: item.cfmtnNm
          			, cfmtnCd			: item.cfmtnCd
  				}
  				jsonInvntrTrnsf.push(invntrTrnsf);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	if (jsonInvntrTrnsf.length > 0) {
          		if(grdInvntrTrnsf.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdInvntrTrnsf.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdInvntrTrnsf.rebuild();
  				}else{
  					grdInvntrTrnsf.refresh();
  				}
          	} else {
          		grdInvntrTrnsf.setPageTotalCount(totalRecordCount);
          		grdInvntrTrnsf.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }

	const fn_del = async function(){
		let grdRows = grdInvntrTrnsf.getCheckedRows(0);
    	let deleteList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdInvntrTrnsf.getRowData(nRow);
    		let cfmtnYn	= rowData.cfmtnYn;

			if(cfmtnYn == "Y"){
				gfn_comAlert("W0010", "이송확정", "이송실적")	// W0010 이미 {0}된 {1} 입니다.
				return;
			}

    		deleteList.push(rowData);

    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/trnsf/deleteTrnsfInvntrList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}
</script>
</html>