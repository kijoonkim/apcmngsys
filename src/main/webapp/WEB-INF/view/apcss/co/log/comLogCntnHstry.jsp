<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 31%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>조회일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-inqYmdFrom" name="srch-dtp-inqYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-inqYmdTo" name="srch-dtp-inqYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userNm" name="srch-inp-userNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>접속이력 정보</span></li>
						</ul>
					</div>	
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-logCntnHstry" style="height:450px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-inqYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inqYmdTo", gfn_dateToYmd(new Date()));

		fn_createLogCntnHstryGrid();
		fn_initSBSelect();
	})

	function fn_createLogCntnHstryGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-logCntnHstry';
	    SBGridProperties.id = 'grdLogCntnHstry';
	    SBGridProperties.jsonref = 'jsonLogCntnHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
            {caption: ['사용자ID'], 	ref: 'slsYmd',		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['사용자명'], 		ref: 'cnptNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['APC명'],		ref: 'gdsNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['현재상태'],	ref: 'gdsCd', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['접속일시'], 		ref: 'vrtyNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['종료일시'], 		ref: 'spcfctNm',	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['최초접속일시'], 		ref: 'brndCd',		width: '15%', 	type: 'output',	style:'text-align: center'}
        ];
        grdLogCntnHstry = _SBGrid.create(SBGridProperties);
        grdLogCntnHstry.bind( "afterpagechanged" , "fn_pagingSlsPrfmnc" );
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdLogCntnHstry.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdLogCntnHstry.movePaging(currentPageNo);
    }
	
	let newJsonSlsPrfmnc = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectSlsPrfmncList(recordCountPerPage, currentPageNo){
		jsonLogCntnHstry = [];
		let apcCd = gv_selectedApcCd;
		let slsYmdFrom = SBUxMethod.get("srch-dtp-slsYmdFrom");
		let slsYmdTo = SBUxMethod.get("srch-dtp-slsYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		if (gfn_isEmpty(slsYmdFrom)){
			gfn_comAlert("W0002", "매출일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(slsYmdTo)){
			gfn_comAlert("W0002", "매출일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let SlsPrfmncVO = {apcCd 				: apcCd
						 , slsYmdFrom 			: slsYmdFrom
						 , slsYmdTo 			: slsYmdTo
						 , cnptNm 				: cnptNm
						 , itemCd 				: itemCd
						 , vrtyCd 				: vrtyCd
						 , pagingYn 			: 'Y'
						 , currentPageNo 		: currentPageNo
						 , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/sls/selectSlsPrfmncList.do", SlsPrfmncVO);
        let data = await postJsonPromise;
        newJsonSlsPrfmnc = [];
        try{
        	data.resultList.forEach((item, index) => {
				let logCntnHstry = {
					slsYmd 		: item.slsYmd
				  , cnptNm 		: item.cnptNm
				  , gdsNm 		: item.gdsNm
				  , gdsCd 		: item.gdsCd
				  , vrtyNm 		: item.vrtyNm
				  , spcfctNm 	: item.spcfctNm
				  , brndCd		: item.brndCd
				  , spmtYmd 	: item.spmtYmd
				  , slsUntprc 	: item.slsUntprc
				  , qntt		: item.qntt
				  , wght 		: item.wght
				  , cfmtnAmt 	: item.cfmtnAmt
				  , totQntt		: item.totQntt
				  , totWght 	: item.totWght
				  , totCfmtnAmt : item.totCfmtnAmt
				}
				jsonLogCntnHstry.push(Object.assign({}, logCntnHstry));
				newJsonSlsPrfmnc.push(Object.assign({}, logCntnHstry));
			});
        	if(jsonLogCntnHstry.length > 0){
				if(grdLogCntnHstry.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdLogCntnHstry.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdLogCntnHstry.rebuild();
				}else{
					grdLogCntnHstry.refresh();
				}
			}else{
				grdLogCntnHstry.setPageTotalCount(0);
				grdLogCntnHstry.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingSlsPrfmnc(){
    	let recordCountPerPage = grdLogCntnHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdLogCntnHstry.getSelectPageIndex(); 
    	fn_callSelectSlsPrfmncList(recordCountPerPage, currentPageNo);
    }
</script>
</html>