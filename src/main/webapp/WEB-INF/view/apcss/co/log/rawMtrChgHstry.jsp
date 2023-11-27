<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<sbux-datepicker id="rawMtr-dtp-chgYmdFrom" name="rawMtr-dtp-chgYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="tabRawMtrChgHstry.dtpChange"></sbux-datepicker>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-datepicker id="rawMtr-dtp-chgYmdTo" name="rawMtr-dtp-chgYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="tabRawMtrChgHstry.dtpChange"></sbux-datepicker>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="ad_tbl_toplist">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
			<sbux-button id="btnLogCntnHstry5" name="btnLogCntnHstry" uitype="normal" text="접속이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogMenuHstry5" name="btnLogMenuHstry" uitype="normal" text="화면열람이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogTrsmHstry5" name="btnLogTrsmHstry" uitype="normal" text="송수신이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnLogBatchHstry5" name="btnLogBatchHstry" uitype="normal" text="배치실행이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			</c:if>
			<sbux-button id="btnRawMtrChgHstry5" name="btnRawMtrChgHstry" uitype="normal" text="원물재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnSortInvntrChgHstry5" name="btnSortInvntrChgHstry" uitype="normal" text="선별재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			<sbux-button id="btnGdsInvntrChgHstry5" name="btnGdsInvntrChgHstry" uitype="normal" text="상품재고변경이력" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
		</div>
		<div class="table-responsive tbl_scroll_sm">
			<div id="sb-area-rawMtrChgHstry" style="height:613px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComWarehouse = [];

	var jsonRawMtrChgHstry = [];
	var grdRawMtrChgHstry = null;

	const tabRawMtrChgHstry = {
			prgrmId: 'rawMtrChgHstryTab',
			gridId: 'grdRawMtrChgHstry',
			jsonId: 'jsonRawMtrChgHstry',
			areaId: "sb-area-rawMtrChgHstry",
			prvApcCd: "",
			objGrid: null,
			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _ymdFrom, _ymdTo) {
				SBUxMethod.set("rawMtr-dtp-chgYmdFrom", _ymdFrom);
				SBUxMethod.set("rawMtr-dtp-chgYmdTo", _ymdTo);
				if (grdRawMtrChgHstry === null || this.prvApcCd != _apcCd) {
					this.createGrid();
					this.search();
				} else {
					this.search();
				}

				this.prvApcCd = _apcCd;
			},
			createGrid: function() {
				var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-rawMtrChgHstry';
			    SBGridProperties.id = 'grdRawMtrChgHstry';
			    SBGridProperties.jsonref = 'jsonRawMtrChgHstry';
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
		        grdRawMtrChgHstry = _SBGrid.create(SBGridProperties);
		        grdRawMtrChgHstry.bind( "afterpagechanged" , tabRawMtrChgHstry.paging );
			},
			search: async function() {
				// set pagination
				grdRawMtrChgHstry.rebuild();
		    	let recordCountPerPage = grdRawMtrChgHstry.getPageSize();
		    	let currentPageNo = 1;

		    	// grid clear
		    	jsonRawMtrChgHstry.length = 0;
		    	await this.setGrid(recordCountPerPage, currentPageNo);
			},
			setGrid: async function(recordCountPerPage, currentPageNo) {

				let chgYmdFrom = SBUxMethod.get("rawMtr-dtp-chgYmdFrom");
				let chgYmdTo = SBUxMethod.get("rawMtr-dtp-chgYmdTo");
				if (gfn_isEmpty(chgYmdFrom)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
			    	jsonRawMtrChgHstry.length = 0;
					grdRawMtrChgHstry.rebuild();
		            return;
				}
				if (gfn_isEmpty(chgYmdTo)){
					gfn_comAlert("W0002", "조회일자");		//	W0002	{0}을/를 입력하세요.
			    	jsonRawMtrChgHstry.length = 0;
					grdRawMtrChgHstry.rebuild();
		            return;
				}
				let apcCd = "";
				if(gv_userType == '10'){
					apcCd = gv_apcCd;
				}

		        const postJsonPromise = gfn_postJSON("/co/log/selectRawMtrHstryList.do", {
		        		apcCd				: apcCd
					  , chgYmdFrom 			: chgYmdFrom
					  , chgYmdTo 			: chgYmdTo
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage
				});

		        const data = await postJsonPromise;

				try {
		    		let totalRecordCount = 0;

		    		jsonRawMtrChgHstry.length = 0;
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
						jsonRawMtrChgHstry.push(hstry);

						if (index === 0) {
							totalRecordCount = item.totalRecordCount;
						}
					});

		        	if (jsonRawMtrChgHstry.length > 0) {
		        		if(grdRawMtrChgHstry.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		        			grdRawMtrChgHstry.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		        			grdRawMtrChgHstry.rebuild();
						}else{
							grdRawMtrChgHstry.refresh();
						}
		        	} else {
		        		grdRawMtrChgHstry.setPageTotalCount(totalRecordCount);
		        		grdRawMtrChgHstry.rebuild();
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
		    	let recordCountPerPage = grdRawMtrChgHstry.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		    	let currentPageNo = grdRawMtrChgHstry.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

		    	tabRawMtrChgHstry.setGrid(recordCountPerPage, currentPageNo);
		    },
			dtpChange : function(){
				let chgYmdFrom = SBUxMethod.get("rawMtr-dtp-chgYmdFrom");
				let chgYmdTo = SBUxMethod.get("rawMtr-dtp-chgYmdTo");
				if(gfn_diffDate(chgYmdFrom, chgYmdTo) < 0){
					gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다."); //W0001{0}
					SBUxMethod.set("rawMtr-dtp-chgYmdFrom", gfn_dateFirstYmd(new Date()));
					SBUxMethod.set("rawMtr-dtp-chgYmdTo", gfn_dateToYmd(new Date()));
					return;
				}
			}
		}
</script>
</html>