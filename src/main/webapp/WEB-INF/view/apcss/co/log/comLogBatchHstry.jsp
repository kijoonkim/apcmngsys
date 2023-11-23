<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title : SBUx2.6</title>
</head>
<body>
	<section>
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
						<sbux-datepicker id="batch-dtp-logYmdFrom" name="batch-dtp-logYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="batch-dtp-logYmdTo" name="batch-dtp-logYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td></td>
					<th scope="row" class="th_bg">프로그램명</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input id="batch-inp-prgrmNm" name="batch-inp-prgrmNm" uitype="text" maxlength="200" class="form-control input-sm"></sbux-input>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="ad_tbl_toplist">
			<sbux-button id="btnLogCntnHstry4" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry4" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry4" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry4" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnRawMtrChgHstry4" name="btnRawMtrChgHstry" uitype="normal" text="원물재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnSortInvntrChgHstry4" name="btnSortInvntrChgHstry" uitype="normal" text="선별재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnGdsInvntrChgHstry4" name="btnGdsInvntrChgHstry" uitype="normal" text="상품재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-logBatchHstry" style="height:613px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonLogBatchHstry = [];
	var grdLogBatchHstry = null;

	const tabLogBatchHstry = {
			prgrmId: 'logBatchHstryTab',
			gridId: 'grdLogBatchHstry',
			jsonId: 'jsonLogBatchHstry',
			areaId: "sb-area-logBatchHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc) {
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				if (grdLogBatchHstry === null || this.prvApcCd != _apcCd) {
					SBUxMethod.set("batch-dtp-logYmdFrom", gfn_dateFirstYmd(new Date()));
					SBUxMethod.set("batch-dtp-logYmdTo", gfn_dateToYmd(new Date()));
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
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
		        	{caption: ['처리일자'], 	ref: 'prcsDt',		width: '260px',		type: 'output',	style:'text-align: center'},
		            {caption: ['순번'], 		ref: 'logSn', 		width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['프로그램ID'],	ref: 'prgrmId', 	width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['프로그램명'],	ref: 'prgrmNm', 	width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['접속일시'],	ref: 'logYmd',		width: '260px', 	type: 'output',	style:'text-align: center',
		    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
		            {caption: ['처리결과'], 	ref: 'prcsRslt',	width: '260px', 	type: 'output',	style:'text-align: center'}
		        ];
		        grdLogBatchHstry = _SBGrid.create(SBGridProperties);
		        grdLogBatchHstry.bind( "afterpagechanged" , tabLogBatchHstry.paging );
			},
			search: async function() {
				// set pagination
				grdLogBatchHstry.rebuild();
		    	let recordCountPerPage = grdLogBatchHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonLogBatchHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let apcCd = gv_selectedApcCd;
				let logYmdFrom = SBUxMethod.get("batch-dtp-logYmdFrom");
				let logYmdTo = SBUxMethod.get("batch-dtp-logYmdTo");
				let prgrmNm = SBUxMethod.get("batch-inp-prgrmNm");
				if (gfn_isEmpty(logYmdFrom)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if (gfn_isEmpty(logYmdTo)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
		            return;
				}

		        const postJsonPromise = gfn_postJSON("/co/log/selectTrsmHstryList.do", {
					    logYmdFrom 			: logYmdFrom
					  , logYmdTo 			: logYmdTo
					  , prgrmNm 			: prgrmNm
					  , logSeCd				: "BT"
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		    		let totalRecordCount = 0;

		    		jsonLogBatchHstry.length = 0;
		        	data.resultList.forEach((item, index) => {
						const log = {
							prcsDt			: item.prcsDt,
							logSn			: item.logSn,
							prgrmId			: item.prgrmId,
							prgrmNm			: item.prgrmNm,
							logYmd 			: item.logYmd,
							prcsRslt		: null
						}
						if(log.prcsDt != null && log.prcsDt != ""){
							log.prcsRslt = '처리';
						} else {
							log.prcsRslt = '미처리';
						}
						jsonLogBatchHstry.push(log);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonLogBatchHstry.length > 0) {
		        		if(grdLogBatchHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdLogBatchHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdLogBatchHstry.rebuild();
						}else{
							grdLogBatchHstry.refresh();
						}
		        	} else {
		        		grdLogBatchHstry.setPageTotalCount(totalRecordCount);
		        		grdLogBatchHstry.rebuild();
		        	}
		        } catch (e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        }
		    },
		    paging: function() {
		    	let recordCountPerPage = grdLogBatchHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdLogBatchHstry.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	tabLogBatchHstry.setGrid(recordCountPerPage, currentPageNo);
		    }
		}
</script>
</html>