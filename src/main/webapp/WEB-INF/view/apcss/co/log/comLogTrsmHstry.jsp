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
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
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
							<th scope="row" class="th_bg">송수신구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-sendRcptnSeCd" name="srch-slt-sendRcptnSeCd" uitype="single" jsondata-ref="jsonComSendRcptnSeCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">인터페이스명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-intrfcNm" name=srch-inp-intrfcNm uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>송수신이력 정보</span></li>
						</ul>
					</div>	
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-logTrsmHstry" style="height:400px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComSendRcptnSeCd = [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-sendRcptnSeCd', jsonComSendRcptnSeCd, 'SEND_RCPTN_SE_CD', gv_selectedApcCd),	// 창고구분
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
	    SBGridProperties.parentid = 'sb-area-logTrsmHstry';
	    SBGridProperties.id = 'grdLogTrsmHstry';
	    SBGridProperties.jsonref = 'jsonLogTrsmHstry';
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
            {caption: ['처리일시'], 		ref: 'prcsDt',			width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['인터페이스ID'], 	ref: 'intrfcId', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['인터페이스명'],		ref: 'intrfcNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['송수신구분'],		ref: 'sendRcptnSeCd', 	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['처리결과'], 		ref: 'vrtyNm', 			width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['접속일시'], 		ref: 'spcfctNm',		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['종료일시'], 		ref: 'brndCd',			width: '15%', 	type: 'output',	style:'text-align: center'}
        ];
        grdLogTrsmHstry = _SBGrid.create(SBGridProperties);
        grdLogTrsmHstry.bind( "afterpagechanged" , "fn_pagingLogTrsmHstry" );
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdLogTrsmHstry.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdLogTrsmHstry.movePaging(currentPageNo);
    }
	
	let newJsonLogTrsmHstry = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectLogTrsmHstryList(recordCountPerPage, currentPageNo){
		jsonLogTrsmHstry = [];
		let apcCd = gv_selectedApcCd;
		let inqYmdFrom = SBUxMethod.get("srch-dtp-inqYmdFrom");
		let inqYmdTo = SBUxMethod.get("srch-dtp-inqYmdTo");
		let sendRcptnSeCd = SBUxMethod.get("srch-slt-sendRcptnSeCd");
		let intrfcNm = SBUxMethod.get("srch-inp-intrfcNm");
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
						 , sendRcptnSeCd 		: sendRcptnSeCd
						 , intrfcNm 			: intrfcNm
						 , pagingYn 			: 'Y'
						 , currentPageNo 		: currentPageNo
						 , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/sls/selectSlsPrfmncList.do", SlsPrfmncVO);
        let data = await postJsonPromise;
        newJsonLogTrsmHstry = [];
        try{
        	data.resultList.forEach((item, index) => {
				let logTrsmHstry = {
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
				jsonLogTrsmHstry.push(Object.assign({}, logTrsmHstry));
				newJsonLogTrsmHstry.push(Object.assign({}, logTrsmHstry));
			});
        	if(jsonLogTrsmHstry.length > 0){
				if(grdLogTrsmHstry.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdLogTrsmHstry.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdLogTrsmHstry.rebuild();
				}else{
					grdLogTrsmHstry.refresh();
				}
			}else{
				grdLogTrsmHstry.setPageTotalCount(0);
				grdLogTrsmHstry.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingLogTrsmHstry(){
    	let recordCountPerPage = grdLogTrsmHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdLogTrsmHstry.getSelectPageIndex(); 
    	fn_callSelectLogTrsmHstryList(recordCountPerPage, currentPageNo);
    }
</script>
</html>