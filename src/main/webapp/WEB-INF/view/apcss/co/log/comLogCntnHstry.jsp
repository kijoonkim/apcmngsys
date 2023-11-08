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
				<col style="width: 31%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th_bg"><span class="data_required"></span>조회일자</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="cntn-dtp-logYmdFrom" name="cntn-dtp-logYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="cntn-dtp-logYmdTo" name="cntn-dtp-logYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td></td>
					<th scope="row" class="th_bg">사용자명</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input id="cntn-inp-userNm" name="cntn-inp-userNm" uitype="text" maxlength="19" class="form-control input-sm"></sbux-input>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="ad_tbl_toplist">
			<sbux-button id="btnLogCntnHstry1" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry1" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry1" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry1" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnRawMtrChgHstry1" name="btnRawMtrChgHstry" uitype="normal" text="원물재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnSortInvntrChgHstry1" name="btnSortInvntrChgHstry" uitype="normal" text="선별재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnGdsInvntrChgHstry1" name="btnGdsInvntrChgHstry" uitype="normal" text="상품재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-logCntnHstry" style="height:590px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonLogCntnHstry = [];
	var grdLogCntnHstry = null;

	const tabLogCntnHstry = {
			prgrmId: 'logCntnHstryTab',
			gridId: 'grdLogCntnHstry',
			jsonId: 'jsonLogCntnHstry',
			areaId: "sb-area-logCntnHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc) {
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				if (grdLogCntnHstry === null || this.prvApcCd != _apcCd) {
					SBUxMethod.set("cntn-dtp-logYmdFrom", gfn_dateFirstYmd(new Date()));
					SBUxMethod.set("cntn-dtp-logYmdTo", gfn_dateToYmd(new Date()));
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
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
		            {caption: ['사용자ID'], 	ref: 'userId',		width: '240px',		type: 'output',	style:'text-align: center'},
		            {caption: ['사용자명'], 	ref: 'userNm', 		width: '240px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['APC명'],		ref: 'apcNm', 		width: '240px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['접속일시'],	ref: 'prslDt',		width: '240px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['최초접속일시'],	ref: 'frstPrslDt',	width: '240px', 	type: 'output',	style:'text-align: center'}
		        ];
		        grdLogCntnHstry = _SBGrid.create(SBGridProperties);
		        grdLogCntnHstry.bind( "afterpagechanged" , tabLogCntnHstry.setGrid );
			},
			search: async function() {
				// set pagination
				grdLogCntnHstry.rebuild();
		    	let recordCountPerPage = grdLogCntnHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonLogCntnHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let apcCd = gv_selectedApcCd;
				let logYmdFrom = SBUxMethod.get("cntn-dtp-logYmdFrom");
				let logYmdTo = SBUxMethod.get("cntn-dtp-logYmdTo");
				let userNm = SBUxMethod.get("cntn-inp-userNm");
				if (gfn_isEmpty(logYmdFrom)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if (gfn_isEmpty(logYmdTo)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
		            return;
				}

		        const postJsonPromise = gfn_postJSON("/co/log/selectCntnHstryList.do", {
					    logYmdFrom 			: logYmdFrom
					  , logYmdTo 			: logYmdTo
					  , userNm 				: userNm
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		    		let totalRecordCount = 0;

		    		jsonLogCntnHstry.length = 0;
		        	data.resultList.forEach((item, index) => {
						const log = {
							userId			: item.userId
						  ,	userNm			: item.userNm
					      , apcNm 			: item.apcNm
						  ,	prslDt			: item.prslDt
						  ,	frstPrslDt		: item.frstPrslDt
						}
						jsonLogCntnHstry.push(log);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonLogCntnHstry.length > 0) {
		        		if(grdLogCntnHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdLogCntnHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdLogCntnHstry.rebuild();
						}else{
							grdLogCntnHstry.refresh();
						}
		        	} else {
		        		grdLogCntnHstry.setPageTotalCount(totalRecordCount);
		        		grdLogCntnHstry.rebuild();
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