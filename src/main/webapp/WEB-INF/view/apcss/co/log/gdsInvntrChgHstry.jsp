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
						<sbux-datepicker id="gdsInvntr-dtp-chgYmdFrom" name="gdsInvntr-dtp-chgYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="gdsInvntr-dtp-chgYmdTo" name="gdsInvntr-dtp-chgYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"></sbux-datepicker>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="ad_tbl_toplist">
			<sbux-button id="btnLogCntnHstry7" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry7" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry7" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry7" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnRawMtrChgHstry7" name="btnRawMtrChgHstry" uitype="normal" text="원물재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnSortInvntrChgHstry7" name="btnSortInvntrChgHstry" uitype="normal" text="선별재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnGdsInvntrChgHstry7" name="btnGdsInvntrChgHstry" uitype="normal" text="상품재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-gdsInvntrChgHstry" style="height:590px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComWarehouse = [];

	var jsonGdsInvntrChgHstry = [];
	var grdGdsInvntrChgHstry = null;

	const tabGdsInvntrChgHstry = {
			prgrmId: 'gdsInvntrChgHstryTab',
			gridId: 'grdGdsInvntrChgHstry',
			jsonId: 'jsonGdsInvntrChgHstry',
			areaId: "sb-area-gdsInvntrChgHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc) {
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				if (grdGdsInvntrChgHstry === null || this.prvApcCd != _apcCd) {
					SBUxMethod.set("gdsInvntr-dtp-chgYmdFrom", gfn_dateFirstYmd(new Date()));
					SBUxMethod.set("gdsInvntr-dtp-chgYmdTo", gfn_dateToYmd(new Date()));
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
				var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-gdsInvntrChgHstry';
			    SBGridProperties.id = 'grdGdsInvntrChgHstry';
			    SBGridProperties.jsonref = 'jsonGdsInvntrChgHstry';
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
		        	{caption: ['입고번호'], 	ref: 'wrhsno',			width: '120px',		type: 'output',	style:'text-align: center'},
		            {caption: ['변경일자'], 	ref: 'chgYmd', 			width: '120px', 	type: 'output',	style:'text-align: center',
		        		format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		            {caption: ['변경전수량'],	ref: 'chgBfrQntt', 		width: '120px', 	type: 'output',	style:'text-align: right',
		            	format : {type:'number', rule:'#,###'}},
		            {caption: ['변경전중량'],	ref: 'chgBfrWght', 		width: '120px', 	type: 'output',	style:'text-align: right',
		                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		            {caption: ['변경후수량'],	ref: 'chgAftrQntt', 	width: '120px', 	type: 'output',	style:'text-align: right',
		            	format : {type:'number', rule:'#,###'}},
		            {caption: ['변경후중량'],	ref: 'chgAftrWght', 	width: '120px', 	type: 'output',	style:'text-align: right',
		                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		            {caption: ['변경사유'], 	ref: 'chgRsnNm', 		width: '120px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['창고구분'],	ref: 'warehouseSeNm',	width: '120px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['변경비고'],	ref: 'chgRmrk', 		width: '300px', 	type: 'output'}
		        ];
		        grdGdsInvntrChgHstry = _SBGrid.create(SBGridProperties);
		        grdGdsInvntrChgHstry.bind( "afterpagechanged" , tabGdsInvntrChgHstry.paging );
			},
			search: async function() {
				// set pagination
				grdGdsInvntrChgHstry.rebuild();
		    	let recordCountPerPage = grdGdsInvntrChgHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonGdsInvntrChgHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let chgYmdFrom = SBUxMethod.get("gdsInvntr-dtp-chgYmdFrom");
				let chgYmdTo = SBUxMethod.get("gdsInvntr-dtp-chgYmdTo");
				if (gfn_isEmpty(chgYmdFrom)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if (gfn_isEmpty(chgYmdTo)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
		            return;
				}

		        const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrHstryList.do", {
		        		apcCd				: gv_selectedApcCd
					  , chgYmdFrom 			: chgYmdFrom
					  , chgYmdTo 			: chgYmdTo
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		    		let totalRecordCount = 0;

		    		jsonGdsInvntrChgHstry.length = 0;
		        	data.resultList.forEach((item, index) => {
						const hstry = {
							wrhsno			: item.wrhsno,
							chgYmd			: item.chgYmd,
							chgBfrQntt 		: item.chgBfrQntt,
							chgBfrWght 		: item.chgBfrWght,
							chgAftrQntt 	: item.chgAftrQntt,
							chgAftrWght	 	: item.chgAftrWght,
							chgRmrk	 		: item.chgRmrk,
							chgRsnNm	 	: item.chgRsnNm,
							warehouseSeNm	: item.warehouseSeNm
						}
						jsonGdsInvntrChgHstry.push(hstry);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonGdsInvntrChgHstry.length > 0) {
		        		if(grdGdsInvntrChgHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdGdsInvntrChgHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdGdsInvntrChgHstry.rebuild();
						}else{
							grdGdsInvntrChgHstry.refresh();
						}
		        	} else {
		        		grdGdsInvntrChgHstry.setPageTotalCount(totalRecordCount);
		        		grdGdsInvntrChgHstry.rebuild();
		        	}
		        } catch (e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        }
		    },
		    paging: function() {
		    	let recordCountPerPage = grdGdsInvntrChgHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdGdsInvntrChgHstry.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	tabGdsInvntrChgHstry.setGrid(recordCountPerPage, currentPageNo);
		    }
		}
</script>
</html>