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
							<th scope="row" class="th_bg">프로그램명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prgrmNm" name="srch-inp-prgrmNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>배치실행이력 정보</span></li>
						</ul>
					</div>	
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-logBatchHstry" style="height:400px;"></div>
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
	    SBGridProperties.parentid = 'sb-area-logBatchHstry';
	    SBGridProperties.id = 'grdLogBatchHstry';
	    SBGridProperties.jsonref = 'jsonLogBatchHstry';
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
            {caption: ['처리일자'], 	ref: 'prcsDt',		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['순번'], 		ref: 'logSn', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['프로그램ID'],	ref: 'prgrmId', 	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['프로그램명'],	ref: 'prgrmNm', 	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['시작일시'], 	ref: 'vrtyNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['종료일시'], 	ref: 'spcfctNm',	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['처리결과'], 	ref: 'brndCd',		width: '15%', 	type: 'output',	style:'text-align: center'}
        ];
        grdLogBatchHstry = _SBGrid.create(SBGridProperties);
        grdLogBatchHstry.bind( "afterpagechanged" , "fn_pagingLogBatchHstry" );
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdLogBatchHstry.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdLogBatchHstry.movePaging(currentPageNo);
    }
	
	let newJsonLogBatchHstry = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectLogBatchHstryList(recordCountPerPage, currentPageNo){
		jsonLogBatchHstry = [];
		let apcCd = gv_selectedApcCd;
		let inqYmdFrom = SBUxMethod.get("srch-dtp-inqYmdFrom");
		let inqYmdTo = SBUxMethod.get("srch-dtp-inqYmdTo");
		let prgrmNm = SBUxMethod.get("srch-inp-prgrmNm");
		if (gfn_isEmpty(inqYmdFrom)){
			gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(inqYmdTo)){
			gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let SlsPrfmncVO = {apcCd 				: apcCd
						 , inqYmdFrom 			: inqYmdFrom
						 , inqYmdTo 			: inqYmdTo
						 , prgrmNm 				: prgrmNm
						 , pagingYn 			: 'Y'
						 , currentPageNo 		: currentPageNo
						 , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/sls/selectSlsPrfmncList.do", SlsPrfmncVO);
        let data = await postJsonPromise;
        newJsonLogBatchHstry = [];
        try{
        	data.resultList.forEach((item, index) => {
				let logBatchHstry = {
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
				jsonLogBatchHstry.push(Object.assign({}, logBatchHstry));
				newJsonLogBatchHstry.push(Object.assign({}, logBatchHstry));
			});
        	if(jsonLogBatchHstry.length > 0){
				if(grdLogBatchHstry.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdLogBatchHstry.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdLogBatchHstry.rebuild();
				}else{
					grdLogBatchHstry.refresh();
				}
			}else{
				grdLogBatchHstry.setPageTotalCount(0);
				grdLogBatchHstry.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingLogBatchHstry(){
    	let recordCountPerPage = grdLogBatchHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdLogBatchHstry.getSelectPageIndex(); 
    	fn_callSelectLogBatchHstryList(recordCountPerPage, currentPageNo);
    }
</script>
</html>