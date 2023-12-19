<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>title : SBUx2.6</title>
</head>
<body oncontextmenu="return false">
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
						<sbux-datepicker id="sortInvntr-dtp-chgYmdFrom" name="sortInvntr-dtp-chgYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="tabSortInvntrChgHstry.dtpChange"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="sortInvntr-dtp-chgYmdTo" name="sortInvntr-dtp-chgYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="tabSortInvntrChgHstry.dtpChange"></sbux-datepicker>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="ad_tbl_toplist">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
			<sbux-button id="btnLogCntnHstry6" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry6" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry6" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry6" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			</c:if>
			<sbux-button id="btnRawMtrChgHstry6" name="btnRawMtrChgHstry" uitype="normal" text="원물재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnSortInvntrChgHstry6" name="btnSortInvntrChgHstry" uitype="normal" text="선별재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnGdsInvntrChgHstry6" name="btnGdsInvntrChgHstry" uitype="normal" text="상품재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-sortInvntrChgHstry" style="height:613px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComWarehouse = [];

	var jsonSortInvntrChgHstry = [];
	var grdSortInvntrChgHstry = null;

	const tabSortInvntrChgHstry = {
			prgrmId: 'sortInvntrChgHstryTab',
			gridId: 'grdSortInvntrChgHstry',
			jsonId: 'jsonSortInvntrChgHstry',
			areaId: "sb-area-sortInvntrChgHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _ymdFrom, _ymdTo) {
				SBUxMethod.set("sortInvntr-dtp-chgYmdFrom", _ymdFrom);
				SBUxMethod.set("sortInvntr-dtp-chgYmdTo", _ymdTo);
				if (grdSortInvntrChgHstry === null || this.prvApcCd != _apcCd) {
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
				var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-sortInvntrChgHstry';
			    SBGridProperties.id = 'grdSortInvntrChgHstry';
			    SBGridProperties.jsonref = 'jsonSortInvntrChgHstry';
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
		        	{caption: ['선별번호'], 			ref: 'sortno',			width: '120px',		type: 'output',	style:'text-align: center'},
		            {caption: ['선별순번'],				ref: 'sortSn', 			width: '70px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['변경일자'], 			ref: 'chgYmd', 			width: '120px', 	type: 'output',	style:'text-align: center',
		        		format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		            {caption: ['변경 전 수량'],			ref: 'chgBfrQntt', 		width: '120px', 	type: 'output',	style:'text-align: right',
		            	format : {type:'number', rule:'#,###'}},
		            {caption: ['변경 전 중량 (Kg)'],	ref: 'chgBfrWght', 		width: '120px', 	type: 'output',	style:'text-align: right',
		                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		            {caption: ['변경 후 수량'],			ref: 'chgAftrQntt', 	width: '120px', 	type: 'output',	style:'text-align: right',
		            	format : {type:'number', rule:'#,###'}},
		            {caption: ['변경 후 중량 (Kg)'],	ref: 'chgAftrWght', 	width: '120px', 	type: 'output',	style:'text-align: right',
		                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		            {caption: ['변경사유'], 			ref: 'chgRsnNm', 		width: '120px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['창고구분'],				ref: 'warehouseSeNm',	width: '120px', 	type: 'output',	style:'text-align: center'},
		            {caption: ['변경비고'],				ref: 'chgRsn', 		width: '300px', 	type: 'output'}
		        ];
		        grdSortInvntrChgHstry = _SBGrid.create(SBGridProperties);
		        grdSortInvntrChgHstry.bind( "afterpagechanged" , tabSortInvntrChgHstry.paging );
			},
			search: async function() {
				// set pagination
				grdSortInvntrChgHstry.rebuild();
		    	let recordCountPerPage = grdSortInvntrChgHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonSortInvntrChgHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let chgYmdFrom = SBUxMethod.get("sortInvntr-dtp-chgYmdFrom");
				let chgYmdTo = SBUxMethod.get("sortInvntr-dtp-chgYmdTo");
				if (gfn_isEmpty(chgYmdFrom)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
			    	jsonSortInvntrChgHstry.length = 0;
					grdSortInvntrChgHstry.rebuild();
		            return;
				}
				if (gfn_isEmpty(chgYmdTo)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
			    	jsonSortInvntrChgHstry.length = 0;
					grdSortInvntrChgHstry.rebuild();
		            return;
				}
				let apcCd = "";
				if(gv_userType == '10'){
					apcCd = gv_apcCd;
				}

		        const postJsonPromise = gfn_postJSON("/co/log/selectSortHstryList.do", {
		        		apcCd				: apcCd
					  , chgYmdFrom 			: chgYmdFrom
					  , chgYmdTo 			: chgYmdTo
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		  			if (_.isEqual("S", data.resultStatus)) {
			    		let totalRecordCount = 0;

			    		jsonSortInvntrChgHstry.length = 0;
			        	data.resultList.forEach((item, index) => {
							const hstry = {
								sortno			: item.sortno,
								sortSn			: item.sortSn,
								chgYmd			: item.chgYmd,
								chgBfrQntt 		: item.chgBfrQntt,
								chgBfrWght 		: item.chgBfrWght,
								chgAftrQntt 	: item.chgAftrQntt,
								chgAftrWght	 	: item.chgAftrWght,
								chgRsn	 		: item.chgRsn,
								chgRsnNm	 	: item.chgRsnNm,
								warehouseSeNm	: item.warehouseSeNm
							}
							jsonSortInvntrChgHstry.push(hstry);

							if (index === 0) {
								totalRecordCount = item.totalRecordCount;
							}
						});

			        	if (jsonSortInvntrChgHstry.length > 0) {
			        		if(grdSortInvntrChgHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
			        			grdSortInvntrChgHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
			        			grdSortInvntrChgHstry.rebuild();
							}else{
								grdSortInvntrChgHstry.refresh();
							}
			        	} else {
			        		grdSortInvntrChgHstry.setPageTotalCount(totalRecordCount);
			        		grdSortInvntrChgHstry.rebuild();
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
		    	let recordCountPerPage = grdSortInvntrChgHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdSortInvntrChgHstry.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	tabSortInvntrChgHstry.setGrid(recordCountPerPage, currentPageNo);
		    },
			dtpChange : function(){
				let chgYmdFrom = SBUxMethod.get("sortInvntr-dtp-chgYmdFrom");
				let chgYmdTo = SBUxMethod.get("sortInvntr-dtp-chgYmdTo");
				if(gfn_diffDate(chgYmdFrom, chgYmdTo) < 0){
					gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다."); //W0001{0}
					SBUxMethod.set("sortInvntr-dtp-chgYmdFrom", gfn_dateFirstYmd(new Date()));
					SBUxMethod.set("sortInvntr-dtp-chgYmdTo", gfn_dateToYmd(new Date()));
					return;
				}
			}
		}
</script>
</html>