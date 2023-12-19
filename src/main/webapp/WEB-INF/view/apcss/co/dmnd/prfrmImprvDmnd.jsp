<%
/**
 * @Class Name : prfrmImprvDmnd.jsp
 * @Description : 프로그램 요청사항 화면
 * @author SI개발부
 * @since 2023.12.12
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.12.12 김현호		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : 프로그램 요청사항</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 프로그램 요청사항 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
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
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">요청일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-dmndYmdFrom" name="srch-dtp-dmndYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-dmndYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-dmndYmdTo" name="srch-dtp-dmndYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-dmndYmdTo)"></sbux-datepicker>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<br>
				<!--[pp] 검색결과 -->
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPrgrmImprvDmnd" style="width:100%;height:594px;"></div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComPic			= [];		// PIC

	var jsonPrgrmImprvDmnd	= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdPrgrmImprvDmnd', jsonComPic, 'PIC', gv_selectedApcCd)	// PIC
		]);
        fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-dmndYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-dmndYmdTo", gfn_dateToYmd(new Date()));

		fn_createPrgrmImprvDmndGrid();
		fn_initSBSelect();
	})

	function fn_createPrgrmImprvDmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrgrmImprvDmnd';
	    SBGridProperties.id = 'grdPrgrmImprvDmnd';
	    SBGridProperties.jsonref = 'jsonPrgrmImprvDmnd';
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
        	{caption: ["처리"], 		ref: 'delYn',  			width: '80px',		type: 'button',		style: 'text-align: center',
        		renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(" + nRow + ")'>삭제</button>";
		    }},
            {caption: ['상태'], 		ref: 'dmndStts', 		width: '80px', 		type: 'output', 	style: 'text-align: center'},
            {caption: ['요청일자'], 	ref: 'dmndYmd', 		width: '80px', 		type: 'output', 	style: 'text-align: center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['요청자'], 	ref: 'userNm', 			width: '80px', 		type: 'output', 	style: 'text-align: center'},
            {caption: ['프로그램명'], 	ref: 'menuNm', 			width: '300px',		type: 'output', 	style: 'text-align: center'},
            {caption: ['접수자'], 	ref: 'pic', 			width: '120px',		type: 'combo',		style: 'text-align: center',
        		typeinfo : {ref:'jsonComPic', label:'label', value:'value', itemcount: 10}},
            {caption: ['조치예정일자'],	ref: 'actnPrnmntYmd', 	width: '120px',		type: 'datepicker',	style: 'text-align: center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ['개선요청사항'],	ref: 'imprvDmndMttr', 	width: '500px', 	type: 'output'},
            {caption: ['조치결과'], 	ref: 'actnRslt', 		width: '500px',		type: 'input',
            	validate : gfn_chkByte.bind({byteLimit: 1000})},
            {caption: ['APC코드'], 	ref: 'apcCd', 			hidden: true},
            {caption: ['순번'], 		ref: 'sn', 				hidden: true},
            {caption: ['요청자ID'], 	ref: 'userId', 			hidden: true}
        ];
        grdPrgrmImprvDmnd = _SBGrid.create(SBGridProperties);
        grdPrgrmImprvDmnd.bind( "afterpagechanged" , "fn_pagingPrgrmImprvDmnd" );
    }

	// 행 삭제
	async function fn_procRow(nRow, nCol) {
   		if(grdPrgrmImprvDmnd.getRowStatus(nRow) == 0 || grdPrgrmImprvDmnd.getRowStatus(nRow) == 2){
       		if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
       			var prfrmImprvDmnd = grdPrfrmImprvDmnd.getRowData(nRow);
       			fn_delete(prfrmImprvDmnd);
       			grdPrfrmImprvDmnd.deleteRow(nRow);
       		}
       	}
    }

	// 프로그램 개선요청 삭제
	async function fn_delete(prfrmImprvDmndVO){
    	let postJsonPromise = gfn_postJSON("/co/dmnd/deletePrfrmImprvDmnd.do", prfrmImprvDmndVO);
        let data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {
        		fn_search();
        		return;
        	}else if (data.errMsg != null ){
        		gfn_comAlert("E0000", data.errMsg)		// W0009   {0}이/가 있습니다.
        		return;
        	}else {
        		gfn_comAlert("E0001");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

	// 프로그램 개선요청 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdPrgrmImprvDmnd.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdPrgrmImprvDmnd.movePaging(currentPageNo);
    }

	let newJsonPrgrmImprvDmnd = [];

	// 프로그램 개선요청 목록 조회 호출
	async function fn_callSelectPrgrmImprvDmndList(recordCountPerPage, currentPageNo){
		jsonPrgrmImprvDmnd = [];
		let apcCd = gv_selectedApcCd;
		let dmndYmdFrom = SBUxMethod.get("srch-dtp-dmndYmdFrom");
		let dmndYmdTo = SBUxMethod.get("srch-dtp-dmndYmdTo");
		let PrfrmImprvDmndVO = {apcCd 				: apcCd
							  , dmndYmdFrom 		: dmndYmdFrom
							  , dmndYmdTo 			: dmndYmdTo
							  , pagingYn 			: 'Y'
							  , currentPageNo		: currentPageNo
							  , recordCountPerPage	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/co/dmnd/selectPrfrmImprvDmndList.do", PrfrmImprvDmndVO);
        let data = await postJsonPromise;
        newJsonPrgrmImprvDmnd = [];
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let dmnd = {
  							apcCd 			: item.apcCd,
  							dmndYmd 		: item.dmndYmd,
  							sn 				: item.sn,
  							menuNm 			: item.menuNm,
  							userId 			: item.userId,
  							userNm 			: item.userNm,
  							imprvDmndMttr	: item.imprvDmndMttr,
  							actnPrnmntYmd 	: item.actnPrnmntYmd,
  							pic 			: item.pic,
  							picNm			: item.picNm,
  							actnRslt 		: item.actnRslt,
  							delYn			: item.delYn,
  							dmndStts		: item.dmndStts
  					}
  					jsonPrgrmImprvDmnd.push(Object.assign({}, dmnd));
  					newJsonPrgrmImprvDmnd.push(Object.assign({}, dmnd));
  				});
  	        	if(jsonPrgrmImprvDmnd.length > 0){
  					if(grdPrgrmImprvDmnd.getPageTotalCount() != data.resultList[0].totalRecordCount){   	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  						grdPrgrmImprvDmnd.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  						grdPrgrmImprvDmnd.rebuild();
  					}else{
  						grdPrgrmImprvDmnd.refresh();
  					}
  				}else{
  					grdPrgrmImprvDmnd.setPageTotalCount(0);
  					grdPrgrmImprvDmnd.rebuild();
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
	}

	// 페이징
    async function fn_pagingPrgrmImprvDmnd(){
    	let recordCountPerPage = grdPrgrmImprvDmnd.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPrgrmImprvDmnd.getSelectPageIndex();
    	fn_callSelectPrgrmImprvDmndList(recordCountPerPage, currentPageNo);
    }

	// 프로그램 개선요청 수정
    async function fn_save(){
    	let saveList = [];
		let gridData = grdPrgrmImprvDmnd.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdPrgrmImprvDmnd.getRowData(i);
			let rowSts = grdPrgrmImprvDmnd.getRowStatus(i);
			let delYn = rowData.delYn;
			let imprvDmndMttr = rowData.imprvDmndMttr;
			if(delYn == 'N'){
				if (gfn_isEmpty(imprvDmndMttr)) {
		  			gfn_comAlert("W0002", "개선요청사항");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}
		if(gfn_comConfirm("Q0001", "저장")){

			let postJsonPromise = gfn_postJSON("/co/dmnd/multiSavePrfrmImprvDmndList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert("E0001");
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
		}
    }

 	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

	const fn_dtpChange = function(){
  		let dmndYmdFrom = SBUxMethod.get("srch-dtp-dmndYmdFrom");
  		let dmndYmdTo = SBUxMethod.get("srch-dtp-dmndYmdTo");
  		if(gfn_diffDate(dmndYmdFrom, dmndYmdTo) < 0){
  			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
  			SBUxMethod.set("trsm-dtp-dmndYmdFrom", gfn_dateToYmd(new Date()));
  			SBUxMethod.set("trsm-dtp-dmndYmdTo", gfn_dateToYmd(new Date()));
  			return;
  		}
  	}
</script>
</html>