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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 재고이송조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_selectGridList"></sbux-button>
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled></sbux-input>
							</td>
						</tr>
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

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromTrnsfYmd", year+month+day);
		SBUxMethod.set("srch-dtp-toTrnsfYmd", year+month+day);
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
            {caption: ['이송APC','이송APC'], ref: 'trnsfSn', width: '100px', type: 'output'},
            {caption: ['입고번호','입고번호'], ref: 'wrhsno', width: '100px', type: 'output'},
            {caption: ['선별번호등급','선별번호등급'], ref: 'sortnoGrd', width: '100px', type: 'output'},
            {caption: ['포장번호순번','포장번호순번'], ref: 'pckgSn', width: '100px', type: 'output'},
            {caption: ['입고일자','입고일자'], ref: 'wrhsYmd', width: '100px', type: 'output'},
            {caption: ['생산자','생산자'], ref: 'prdcrCd', width: '100px', type: 'output'},
            {caption: ['품종','품종'], ref: 'vrtyCd', width: '100px', type: 'output'},
            {caption: ['상품구분','상품구분'], ref: 'gdsSeCd', width: '100px', type: 'output'},
            {caption: ['입고구분','입고구분'], ref: 'wrhsSeCd', width: '100px', type: 'output'},
            {caption: ['운송구분','운송구분'], ref: 'trsprtSeCd', width: '100px', type: 'output'},
            {caption: ['현물창고','현물창고'], ref: 'warehouse', width: '100px', type: 'output'},
            {caption: ['이송창고','이송창고'], ref: 'trnsfWarehouse', width: '100px', type: 'output'},
            {caption: ['이송','수량'], ref: 'trnsfQntt', width: '100px', type: 'output'},
            {caption: ['이송','중량'], ref: 'trnsfWght', width: '100px', type: 'output'},
            {caption: ['금액','금액'], ref: 'amt', width: '100px', type: 'output'},
            {caption: ['운반비','운반비'], ref: 'trsprtCst', width: '100px', type: 'output'}
        ];
        grdInvntrTrnsf = _SBGrid.create(SBGridProperties);
        
        fn_selectGridList();
    }
	
	//조회
    const fn_selectGridList = async function() {
    	grdInvntrTrnsf.rebuild();
    	let pageSize = grdInvntrTrnsf.getPageSize();
    	let pageNo = 1;
    	
    	fn_callSelectGridList(pageSize, pageNo);
	}
	
const fn_callSelectGridList = async function(pageSize, pageNo) {
		
// 		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		
		const postJsonPromise1 = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data1 = await postJsonPromise1;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonInvntrTrnsf.length = 0;
          	data1.resultList.forEach((item, index) => {
          		const invntrTrnsf = {
       				wrhsno: item.wrhsno,
       				pltno: item.pltno,
       				wrhsYmd: item.wrhsYmd,
       				prdcrNm: item.prdcrNm,
       				itemNm: item.itemNm,
       				vrtyNm: item.vrtyNm,
       				gdsSeNm: item.gdsSeNm,
       				wrhsSeNm: item.wrhsSeNm,
       				trsprtSeNm: item.trsprtSeNm,
       				warehouseSeNm: item.warehouseSeNm,
       				bxknd: item.bxknd,
       				grdNm: item.grdNm,
       				wrhsQntt: item.wrhsQntt,
       				wrhsWght: item.wrhsWght,
       				inptQntt: item.inptQntt,
       				inptWght: item.inptWght,
       				invntrQntt: item.invntrQntt,
       				invntrWght: item.invntrWght,
       				sortcmndNo: item.sortcmndNo,
       				fcltNm: item.fcltNm
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
</script>
</html>