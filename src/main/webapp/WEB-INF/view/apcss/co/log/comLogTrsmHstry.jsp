<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
				<col style="width: 9%">
				<col style="width: 7%">
				<col style="width: 6%">
				<col style="width: 9%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th_bg"><span class="data_required"></span>조회일자</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="trsm-dtp-logYmdFrom" name="trsm-dtp-logYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="trsm-dtp-logYmdTo" name="trsm-dtp-logYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td></td>
					<th scope="row" class="th_bg">송수신구분</th>
					<td class="td_input" style="border-right: hidden;">
						<div class="fl_group fl_rpgroup">
							<div class="dp_inline wd_180 va_m">
								<sbux-select id="trsm-slt-sendRcptnSeCd" name="trsm-slt-sendRcptnSeCd" uitype="single" jsondata-ref="jsonComSendRcptnSeCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</div>
						</div>
					</td>
					<td></td>
					<th scope="row" class="th_bg">인터페이스명</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input id="trsm-inp-prgrmNm" name=trsm-inp-prgrmNm uitype="text" class="form-control input-sm"></sbux-input>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="ad_tbl_toplist">
			<sbux-button id="btnLogCntnHstry3" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry3" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry3" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry3" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-logTrsmHstry" style="height:600px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonLogTrsmHstry = [];
	var jsonComSendRcptnSeCd = [];
	var comboSendRcptnSeCdJsData = [];
	var grdLogTrsmHstry = null;

	const tabLogTrsmHstry = {
			prgrmId: 'logTrsmHstryTab',
			gridId: 'grdLogTrsmHstry',
			jsonId: 'jsonLogTrsmHstry',
			areaId: "sb-area-logTrsmHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc) {
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				if (grdLogTrsmHstry === null || this.prvApcCd != _apcCd) {
					SBUxMethod.set("trsm-dtp-logYmdFrom", gfn_dateToYmd(new Date()));
					SBUxMethod.set("trsm-dtp-logYmdTo", gfn_dateToYmd(new Date()));
					let rst = await Promise.all([
						gfn_setComCdSBSelect('trsm-slt-sendRcptnSeCd', jsonComSendRcptnSeCd, 'SEND_RCPTN_SE_CD', gv_selectedApcCd),
						gfn_setComCdGridSelect('grdLogTrsmHstry', comboSendRcptnSeCdJsData, "SEND_RCPTN_SE_CD", gv_selectedApcCd)
					]);
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
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
		        	{caption: ['처리일시'], 		ref: 'prcsDt',			width: '260px',		type: 'output',	style:'text-align: center'},
		            {caption: ['인터페이스ID'], 	ref: 'prgrmId', 		width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['인터페이스명'],		ref: 'prgrmNm', 		width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['송수신구분'],		ref: 'sendRcptnSeCd', 	width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['처리결과'], 		ref: 'prcsRslt', 		width: '260px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['접속일시'],		ref: 'logYmd',			width: '260px', 	type: 'output',	style:'text-align: center'}
		        ];
		        grdLogTrsmHstry = _SBGrid.create(SBGridProperties);
		        grdLogTrsmHstry.bind( "afterpagechanged" , tabLogTrsmHstry.setGrid );
			},
			search: async function() {
				// set pagination
				grdLogTrsmHstry.rebuild();
		    	let recordCountPerPage = grdLogTrsmHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonLogTrsmHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let apcCd = gv_selectedApcCd;
				let logYmdFrom = SBUxMethod.get("trsm-dtp-logYmdFrom");
				let logYmdTo = SBUxMethod.get("trsm-dtp-logYmdTo");
				let sendRcptnSeCd = SBUxMethod.get("trsm-slt-sendRcptnSeCd");
				let prgrmNm = SBUxMethod.get("trsm-inp-prgrmNm");
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
					  , sendRcptnSeCd 		: sendRcptnSeCd
					  , prgrmNm 			: prgrmNm
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		        	/** @type {number} **/
		    		let totalRecordCount = 0;

		    		jsonLogTrsmHstry.length = 0;
		        	data.resultList.forEach((item, index) => {
						const log = {
							prcsDt			: item.prcsDt,
							prgrmId			: item.prgrmId,
							prgrmNm			: item.prgrmNm,
							sendRcptnSeCd	: item.sendRcptnSeCd,
							prcsRslt		: null,
							logYmd 			: item.logYmd
						}
						if(log.prcsDt != null && log.prcsDt != ""){
							log.prcsRslt = '처리';
						} else {
							log.prcsRslt = '미처리';
						}
						jsonLogTrsmHstry.push(log);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonLogTrsmHstry.length > 0) {
		        		if(grdLogTrsmHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdLogTrsmHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdLogTrsmHstry.rebuild();
						}else{
							grdLogTrsmHstry.refresh();
						}
		        	} else {
		        		grdLogTrsmHstry.setPageTotalCount(totalRecordCount);
		        		grdLogTrsmHstry.rebuild();
		        	}
		        } catch (e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        }
		    },
		    paging: function() {
		    	let recordCountPerPage = grdComAuthUserPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdComAuthUserPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	popComAuthUser.setGrid(recordCountPerPage, currentPageNo);
		    }
		}
</script>
</html>