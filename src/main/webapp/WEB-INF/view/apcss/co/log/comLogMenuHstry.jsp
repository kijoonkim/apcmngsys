<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
						<sbux-datepicker id="menu-dtp-logYmdFrom" name="menu-dtp-logYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="tabLogMenuHstry.dtpChange"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="menu-dtp-logYmdTo" name="menu-dtp-logYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="tabLogMenuHstry.dtpChange"></sbux-datepicker>
					</td>
					<td></td>
					<th scope="row" class="th_bg">화면명</th>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input id="menu-inp-menuNm" name="menu-inp-menuNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="ad_tbl_toplist">
			<sbux-button id="btnLogCntnHstry2" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry2" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry2" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry2" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnRawMtrChgHstry2" name="btnRawMtrChgHstry" uitype="normal" text="원물재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnSortInvntrChgHstry2" name="btnSortInvntrChgHstry" uitype="normal" text="선별재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnGdsInvntrChgHstry2" name="btnGdsInvntrChgHstry" uitype="normal" text="상품재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-logMenuHstry" style="height:613px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonLogMenuHstry = [];
	var grdLogMenuHstry = null;

	const tabLogMenuHstry = {
			prgrmId: 'logMenuHstryTab',
			gridId: 'grdLogMenuHstry',
			jsonId: 'jsonLogMenuHstry',
			areaId: "sb-area-logMenuHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _ymdFrom, _ymdTo) {
				SBUxMethod.set("menu-dtp-logYmdFrom", _ymdFrom);
				SBUxMethod.set("menu-dtp-logYmdTo", _ymdTo);
				if (grdLogMenuHstry === null || this.prvApcCd != _apcCd) {
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
				var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-logMenuHstry';
			    SBGridProperties.id = 'grdLogMenuHstry';
			    SBGridProperties.jsonref = 'jsonLogMenuHstry';
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
		        	{caption: ['화면ID'], 		ref: 'menuId',			width: '200px',		type: 'output',	style:'text-align: center'},
		            {caption: ['화면명'], 		ref: 'menuNm', 			width: '200px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['사용자ID'],		ref: 'userId', 			width: '200px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['사용자명'],		ref: 'userNm', 			width: '200px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['APC명'], 		ref: 'apcNm', 			width: '200px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['개인정보유형'], ref: 'flfmtTaskSeNm', 	width: '100px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['열람일시'],		ref: 'prslDt',			width: '200px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['접속IP'],		ref: 'userIp',			width: '120px', 	type: 'output',	style:'text-align: center'},
		        ];
		        grdLogMenuHstry = _SBGrid.create(SBGridProperties);
		        grdLogMenuHstry.bind( "afterpagechanged" , tabLogMenuHstry.paging );
			},
			search: async function() {
				// set pagination
				grdLogMenuHstry.rebuild();
		    	let recordCountPerPage = grdLogMenuHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonLogMenuHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let logYmdFrom = SBUxMethod.get("menu-dtp-logYmdFrom");
				let logYmdTo = SBUxMethod.get("menu-dtp-logYmdTo");
				let menuNm = SBUxMethod.get("menu-inp-menuNm");
				if (gfn_isEmpty(logYmdFrom)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
			    	jsonLogMenuHstry.length = 0;
					grdLogMenuHstry.rebuild();
		            return;
				}
				if (gfn_isEmpty(logYmdTo)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
			    	jsonLogMenuHstry.length = 0;
					grdLogMenuHstry.rebuild();
		            return;
				}

		        const postJsonPromise = gfn_postJSON("/co/log/selectMenuHstryList.do", {
					    logYmdFrom 			: logYmdFrom
					  , logYmdTo 			: logYmdTo
					  , menuNm 				: menuNm
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		  			if (_.isEqual("S", data.resultStatus)) {
			    		let totalRecordCount = 0;

			    		jsonLogMenuHstry.length = 0;
			        	data.resultList.forEach((item, index) => {
							const log = {
								menuId			: item.menuId
							  , menuNm			: item.menuNm
							  ,	userId 			: item.userId
							  ,	userNm 			: item.userNm
							  ,	apcNm 			: item.apcNm
							  ,	prslDt	 		: item.prslDt
							  ,	flfmtTaskSeNm	: item.flfmtTaskSeNm
							  ,	flfmtTaskSeCd	: item.flfmtTaskSeCd
							  , userIp			: item.userIp
							}
							jsonLogMenuHstry.push(log);

							if (index === 0) {
								totalRecordCount = item.totalRecordCount;
							}
						});

			        	if (jsonLogMenuHstry.length > 0) {
			        		if(grdLogMenuHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
			        			grdLogMenuHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
			        			grdLogMenuHstry.rebuild();
							}else{
								grdLogMenuHstry.refresh();
							}
			        	} else {
			        		grdLogMenuHstry.setPageTotalCount(totalRecordCount);
			        		grdLogMenuHstry.rebuild();
			        	}

		        	} else {
		        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
		    	let recordCountPerPage = grdLogMenuHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdLogMenuHstry.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	tabLogMenuHstry.setGrid(recordCountPerPage, currentPageNo);
		    },
			dtpChange : function(){
				let logYmdFrom = SBUxMethod.get("menu-dtp-logYmdFrom");
				let logYmdTo = SBUxMethod.get("menu-dtp-logYmdTo");
				if(gfn_diffDate(logYmdFrom, logYmdTo) < 0){
					gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다."); //W0001{0}
					SBUxMethod.set("menu-dtp-logYmdFrom", gfn_dateFirstYmd(new Date()));
					SBUxMethod.set("menu-dtp-logYmdTo", gfn_dateToYmd(new Date()));
					return;
				}
			}
		}
</script>
</html>