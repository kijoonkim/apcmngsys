
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	
<style type="text/css">
.ad_tbl_toplist>span {
	font-weight: bold;
	margin-right: 10px;
}
</style>

</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 파프리카출하실적조회 -->
				</div>
				<div style="margin-left: auto;">
                    <sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
						text="삭제"
					></sbux-button>
                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
							<th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-spmtYmdFrom"
									name="srch-dtp-spmtYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-spmtYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-spmtYmdTo"
									name="srch-dtp-spmtYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-spmtYmdTo)"
								></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-grdGubun"
									name="srch-slt-grdGubun"
									uitype="single"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComGrdGubun"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">출하처</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-cnptCd"
									name="srch-slt-cnptCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonCnptCd"
								></sbux-select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtPrfmncDsctn" style="height:559px;"></div>
				</div>
				<!--[pp] //검색결과 -->
				
			</div>
		</div>
	</section>
</body>

<script type="text/javascript">
	var jsonCnptCd = [];						// 출하처
	var jsonComGrdGubun = [						// 구분
		{'value' : 'A', 'text' : 'A품'},
		{'value' : 'B', 'text' : 'B품'},
		{'value' : 'C', 'text' : 'C품'}
	];
	
	var grdGubunNm = "";

	window.addEventListener('DOMContentLoaded', async function(e) {
		
		fn_init();
		
	});

	const fn_init = async function() {
		SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));
		
		fn_createSpmtPrfmncDsctnGrid();
		let rst = await Promise.all([
			gfn_setCpntSBSelect('srch-slt-cnptCd', jsonCnptCd, gv_selectedApcCd)		// 출하처
		]);
	}

    const fn_dtpChange = function(){
 		let spmtYmdFrom = SBUxMethod.get("srch-dtp-spmtYmdFrom");
 		let spmtYmdTo = SBUxMethod.get("srch-dtp-spmtYmdTo");
 		if(gfn_diffDate(spmtYmdFrom, spmtYmdTo) < 0){
 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateFirstYmd(new Date()));
 			SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));
 			return;
 		}
 	}

	// 그리드 id, 그리드 json
	var grdSpmtPrfmncDsctn;
	var jsonSpmtPrfmncDsctn = [];

	const fn_createSpmtPrfmncDsctnGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtPrfmncDsctn';
	    SBGridProperties.id = 'grdSpmtPrfmncDsctn';
	    SBGridProperties.jsonref = 'jsonSpmtPrfmncDsctn';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'byrestriccol';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [2],
				sum: [5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
			},
			grandtotalrow : {
				titlecol: 3,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
		};
	    SBGridProperties.columns = [
	    	{caption: ["","출하번호"],   	ref: 'spmtno',     	hidden: true},
        	{caption: ["","<input type='checkbox' id='allSpmtPrfmncDsctnCheckBox' onchange='fn_checkAll(grdSpmtPrfmncDsctn, this);'>"],
        		ref: 'checkedYn', type: 'checkbox',	width: '40px', style: 'text-align: center',
				typeinfo : {ignoreupdate : true, checkedvalue : 'Y', uncheckedvalue : 'N'}
        	},
	    	{caption: ["","출하일자"],		ref: 'spmtYmd', 	type: 'output',  	width:'100px', 	style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	    	{caption: ["","출하번호"],   	ref: 'spmtno',     	type: 'output', 	width:'120px', 	style: 'text-align:center'},
	    	{caption: ["","출하처"],   	ref: 'cnptNm',     	type: 'output', 	width:'120px', 	style: 'text-align:center'},
	    	
	    	{caption: ["빨강","2XL"], 	ref: 'redV1', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px;', 	format : {type:'number', rule:'#,###'}},
	    	{caption: ["빨강","XL"], 		ref: 'redV2', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px;', 	format : {type:'number', rule:'#,###'}},
	    	{caption: ["빨강","L"], 		ref: 'redV3', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px;', 	format : {type:'number', rule:'#,###'}},
	    	{caption: ["빨강","M"], 		ref: 'redV4', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px;', 	format : {type:'number', rule:'#,###'}},
	    	{caption: ["빨강","S"], 		ref: 'redV5', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px;', 	format : {type:'number', rule:'#,###'}},
	    	{caption: ["빨강","2S"], 		ref: 'redV6', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px;', 	format : {type:'number', rule:'#,###'}},
	    	{caption: ["빨강","소계"],		ref: 'redSbTot', 	type: 'output',  	width:'85px',	style: 'text-align:right; padding-right:5px;background-color:#ceebff;',
	    		format : {type:'number', rule:'#,###'}},
	    							
	    	{caption: ["노랑","2XL"], 	ref: 'ylwV1', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["노랑","XL"], 		ref: 'ylwV2', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["노랑","L"], 		ref: 'ylwV3', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["노랑","M"], 		ref: 'ylwV4', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["노랑","S"], 		ref: 'ylwV5', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["노랑","2S"], 		ref: 'ylwV6', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["노랑","소계"],		ref: 'ylwSbTot', 	type: 'output',  	width:'85px', 	style: 'text-align:right; padding-right:5px;background-color:#ceebff;',
	    		format : {type:'number', rule:'#,###'}},
	    							
	    	{caption: ["주황","2XL"], 	ref: 'orngV1', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["주황","XL"], 		ref: 'orngV2', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["주황","L"], 		ref: 'orngV3', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["주황","M"], 		ref: 'orngV4', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["주황","S"], 		ref: 'orngV5', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["주황","2S"], 		ref: 'orngV6', 		type: 'output',  	width:'50px', 	style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption: ["주황","소계"],		ref: 'orngSbTot', 	type: 'output',  	width:'85px', 	style: 'text-align:right; padding-right:5px;background-color:#ceebff;',
	    		format : {type:'number', rule:'#,###'}},

	    	{caption: ["총합계","총합계"], ref: 'totSum', 		type: 'output',  	width:'150px', 	style: 'text-align:right; padding-right:5px;background-color:#ceebff;',
		    	format : {type:'number', rule:'#,###'}}
	    ];
	    grdSpmtPrfmncDsctn = _SBGrid.create(SBGridProperties);
	    grdSpmtPrfmncDsctn.bind('select' , fn_setValue);
	    grdSpmtPrfmncDsctn.bind('deselect', fn_delValue);
	    
        grdSpmtPrfmncDsctn.setCellStyles(0,5,1,11,'background:#FF0000');
		grdSpmtPrfmncDsctn.setCellStyles(0,12,1,18,'background:#FFFC33');
		grdSpmtPrfmncDsctn.setCellStyles(0,19,1,25,'background:#FFB533');
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
		grdSpmtPrfmncDsctn.exportLocalExcel("출고내역집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
	
	// 조회
	const fn_search = async function () {
		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-spmtYmdFrom")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-spmtYmdTo"))) {
			gfn_comAlert("W0002", "출하일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(SBUxMethod.get("srch-slt-grdGubun"))) {
			gfn_comAlert("W0002", "구분");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		fn_callSelectSpmtPrfmncDsctnList();
	}
	
	const fn_callSelectSpmtPrfmncDsctnList = async function() {
		let spmtYmdFrom = SBUxMethod.get("srch-dtp-spmtYmdFrom");
		let spmtYmdTo = SBUxMethod.get("srch-dtp-spmtYmdTo");
		let cnptCd = SBUxMethod.get("srch-slt-cnptCd");
		let grdGubun = SBUxMethod.get("srch-slt-grdGubun");
		
		grdGubunNm = SBUxMethod.getText('srch-slt-grdGubun');
		
		const SpmtDsctnTotVO = {
			apcCd		: gv_selectedApcCd,
			spmtYmdFrom	: spmtYmdFrom,
			spmtYmdTo	: spmtYmdTo,
			itemCd		: '1326',
			cnptCd		: cnptCd,
			grdGubun	: grdGubun
		};
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDsctnList.do", SpmtDsctnTotVO, null, false);
        let data = await postJsonPromise;
		try {
        	if (!_.isEqual("S", data.resultStatus)) {
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	return;
	        }
        	
        	jsonSpmtPrfmncDsctn.length = 0;
        	
	        data.resultList.forEach((item, index) => {
	        	const spmtPrfmncDsctn = {
	        		  apcCd		: item.apcCd
	        		, spmtYmd	: item.spmtYmd
		        	, spmtno	: item.spmtno
	        		, cnptCd	: item.cnptCd
	        		, cnptNm	: item.cnptNm
	        		, itemCd	: item.itemCd
	        		
	        	    , redV1 	: item.red2Xl
	        	    , redV2 	: item.redXl
	        	    , redV3 	: item.redL
	        	    , redV4 	: item.redM
	        	    , redV5 	: item.redS
	        	    , redV6 	: item.redSs
	        	    , redSbTot 	: item.redTot
	        	    
	        	    , ylwV1 	: item.ylw2Xl
	        	    , ylwV2 	: item.ylwXl
	        	    , ylwV3 	: item.ylwL
	        	    , ylwV4 	: item.ylwM
	        	    , ylwV5 	: item.ylwS
	        	    , ylwV6 	: item.ylwSs
	        	    , ylwSbTot 	: item.ylwTot
	        	    
	        	    , orngV1 	: item.org2Xl
	        	    , orngV2 	: item.orgXl
	        	    , orngV3 	: item.orgL
	        	    , orngV4 	: item.orgM
	        	    , orngV5 	: item.orgS
	        	    , orngV6 	: item.orgSs
	        	    , orngSbTot : item.orgTot
	        	    
	        	    , totSum   	: item.tot
	        	}
	        	jsonSpmtPrfmncDsctn.push(spmtPrfmncDsctn);
	        });

	        grdSpmtPrfmncDsctn.rebuild();
			
			var getColRef = grdSpmtPrfmncDsctn.getColRef("checkedYn");
	        grdSpmtPrfmncDsctn.setCellData(0, getColRef, grdGubunNm);

	    	let caption = "<input type='checkbox' id='allSpmtPrfmncDsctnCheckBox' onchange='fn_checkAll(grdSpmtPrfmncDsctn, this);'>";
	    	grdSpmtPrfmncDsctn.setCellData(1, grdSpmtPrfmncDsctn.getColRef("checkedYn"), caption);

	        grdSpmtPrfmncDsctn.setCellStyles(0,5,1,11,'background:#FF0000');
			grdSpmtPrfmncDsctn.setCellStyles(0,12,1,18,'background:#FFFC33');
			grdSpmtPrfmncDsctn.setCellStyles(0,19,1,25,'background:#FFB533');
			
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
 	
    // 그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length-1; i++) {
        	grid.clickCell(i+2, getColRef);
            grid.setCellData(i+2, getColRef, checkedYn);
        }
    	grid.clickCell(getRow, getCol);
    	grid.setRow(getRow);
    	grid.setCol(getCol);
    }
    
    // 그리드 merged Row 체크값 변경
    function fn_checkMergedCell(grid, jsonData, nRow) {
		let rowData = grid.getRowData(nRow);
		
		for (var i=nRow-1; i<jsonData.length-1; i++) {
			if (rowData.spmtno == jsonData[i].spmtno) {
				jsonData[i].checkedYn = rowData.checkedYn;
			} else break;
		}
    }

    /**
	 * @name fn_setValue
	 * @description select Event
	 */
    const fn_setValue = function() {
    	let nRow = grdSpmtPrfmncDsctn.getRow();
    	let checkedCol = grdSpmtPrfmncDsctn.getColRef("checkedYn");
    	
    	fn_checkMergedCell(grdSpmtPrfmncDsctn, jsonSpmtPrfmncDsctn, nRow);
    	
    	// 체크박스가 모두 활성화 되었을 경우 상단에 체크박스 체크
		const allCheckBox = document.querySelector('#allSpmtPrfmncDsctnCheckBox');
		let checkboxChecked = grdSpmtPrfmncDsctn.getCheckedRows(checkedCol);
    	const gridData = grdSpmtPrfmncDsctn.getGridDataAll();
    	if(checkboxChecked.length == gridData.length-1){
    		allCheckBox.checked = true;
    	}
    }

    /**
	 * @name fn_delValue
	 * @description deselect Event
	 */
    const fn_delValue = async function(){
    	let nRow = grdSpmtPrfmncDsctn.getRow();
    	
    	fn_checkMergedCell(grdSpmtPrfmncDsctn, jsonSpmtPrfmncDsctn, nRow);

		// 상단 체크박스 비활성화
		const allCheckBox = document.querySelector('#allSpmtPrfmncDsctnCheckBox');
		allCheckBox.checked = false;
    }

    // 삭제
    const fn_delete = async function(){
    	let checkedCol = grdSpmtPrfmncDsctn.getColRef("checkedYn");
		let grdRows = grdSpmtPrfmncDsctn.getCheckedRows(checkedCol);
    	let deleteList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdSpmtPrfmncDsctn.getRowData(nRow);
    		deleteList.push(rowData);
    	}

    	if(deleteList.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
// 			const postJsonPromise = gfn_postJSON("/am/spmt/deleteSpmtCmndList.do", deleteList);
// 	    	const data = await postJsonPromise;

// 	    	try {
// 	        	if (_.isEqual("S", data.resultStatus)) {
// 	       			fn_search();
// 	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
// 	       		}  else{
// 	       			gfn_comAlert(data.resultCode, data.resultMessage);
// 	       		}
// 	        } catch (e) {
// 	        	if (!(e instanceof Error)) {
// 	    			e = new Error(e);
// 	    		}
// 	    		console.error("failed", e.message);
// 	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
// 			}
		}
	}
</script>
</html>