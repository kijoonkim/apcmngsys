<%
 /**
  * @Class Name : userLoginDpcn.jsp
  * @Description : 로그인중복관리
  * @author SI개발부
  * @since 2024.04.18
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.04.18    김현호			최초 생성
  * 
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 로그인중복관리</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 사용자정보변경 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnNew" name="btnNew" uitype="modal" text="신규" target-id="modal-account" class="btn btn-sm btn-outline-danger" onclick="fn_new"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
<!-- 				[APC] START -->
<%-- 					<%@ include file="../../../frame/inc/apcSelectAll.jsp" %> --%>
<!-- 				[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
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
							<th scope="row">사용자ID</th>
							<td td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userId" name="srch-inp-userId" uitype="text" class="form-control input-sm"  onkeyenter="fn_search"></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<th scope="row">중복로그인가능여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-dpcnLgnPsbltyYn"
									name="srch-slt-dpcnLgnPsbltyYn"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonDpcnLgnPsbltyYn"
								/>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>사용자 정보</span></li>
					</ul>
				</div>
				<div id="sb-area-grdUserLgnDpcn" style="height:579px;"></div>
			</div>
		</div>
</section>
</body>
<script type="text/javascript">

	var jsonLgnDpcnGridData = [];
	var jsonDpcnLgnPsbltyYn = [];
	var jsonUseYn 			= [];
	var jsonIpLmtYn 		= [];
	var jsonUserIdData		= [];
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSelect();
		
	});
	
	const fn_initSelect = async function() {
		let result = await Promise.all([
			await gfn_setComCdGridSelect('grdUserLgnDpcn', jsonUseYn, 'USE_YN', '0000'),	// 사용유무 {사용 미사용}
			await gfn_setComCdSBSelect('srch-slt-dpcnLgnPsbltyYn', jsonDpcnLgnPsbltyYn, 'DPCN_LGN_PSBLTY_YN', '0000'),	// 중복로그인가능여부 {가능 불가능}
			await gfn_setComCdGridSelect('grdUserLgnDpcn', jsonIpLmtYn, 'USE_YN', '0000'),	// IP제한여부 {사용 미사용}
		]);
		fn_createLgnDpcnGrid();
		fn_search();
	}
	
	// 그리드 생성
	const fn_createLgnDpcnGrid = async function(){
		var SBGridLgnDpcnProperties = {};
	    SBGridLgnDpcnProperties.parentid = 'sb-area-grdUserLgnDpcn';
	    SBGridLgnDpcnProperties.id = 'grdUserLgnDpcn';
	    SBGridLgnDpcnProperties.jsonref = 'jsonLgnDpcnGridData';
	    SBGridLgnDpcnProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridLgnDpcnProperties.selectmode = 'byrow';
	    SBGridLgnDpcnProperties.extendlastcol = 'scroll';
	    SBGridLgnDpcnProperties.scrollbubbling = false;
	    SBGridLgnDpcnProperties.oneclickedit = true;
	    SBGridLgnDpcnProperties.explorerbar = 'sortmove';
    	SBGridLgnDpcnProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	};
	    SBGridLgnDpcnProperties.columns = [
	    	{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'50px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ");'>삭제</button>";
	        	}
		    }},
	         {caption: ["사용자ID"], 			ref: 'userId',     		type:'input',   width:'230px', 	style:'text-align:center'},
	         {caption: ["중복로그인가능여부"], 		ref: 'dpcnLgnPsbltyYn', type:'combo',  	width:'120px', 	style:'text-align:center',
	        	 typeinfo : {ref:'jsonDpcnLgnPsbltyYn', label:'label', value:'value'}
        	 },
	         {caption: ["IP정보"],	    	ref: 'ipInfo',   		type:'input',  	width:'520px', 	style:'text-align:center'},
	         {caption: ["IP제한여부"],   		ref: 'ipLmtYn',  		type:'combo',  	width:'105px', 	style:'text-align:center',
	        	 typeinfo : {ref:'jsonIpLmtYn', label:'label', value:'value'}
	       	 },
	         {caption: ["사용여부"],	    	ref: 'useYn', 			type:'combo',  	width:'105px', 	style:'text-align:center',
	        	 typeinfo : {ref:'jsonUseYn', label:'label', value:'value'}
	         },
	         {caption: ["최종변결일시"],			ref: 'sysLastChgDt',  	type:'output',  	width:'105px', 	style:'text-align:center'}
    	];
	    grdUserLgnDpcn = _SBGrid.create(SBGridLgnDpcnProperties);
	    grdUserLgnDpcn.bind('beforepagechanged', fn_pagingGrdDpcnLgn);
	    grdUserLgnDpcn.bind('valuechanged', gridValueChanged);
	}
	
    /**
     * @name fn_pagingGrdDpcnLgn
     * @description 페이징
     * @function
     */
    const fn_pagingGrdDpcnLgn = async function() {
    	let recordCountPerPage = grdUserLgnDpcn.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdUserLgnDpcn.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	
        fn_searchLgnDpcnGrid(recordCountPerPage, currentPageNo);
    }
	
	// 사용자 정보 검색
    async function fn_search() {
    	let recordCountPerPage = grdUserLgnDpcn.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdUserLgnDpcn.movePaging(currentPageNo);
    }
	
	const fn_searchLgnDpcnGrid = async function(pageSize, pageNo){
		let userId 				= SBUxMethod.get("srch-inp-userId");					// 사용자 ID
		let dpcnLgnPsbltyYn 	= SBUxMethod.get("srch-slt-dpcnLgnPsbltyYn");			// 로그인 중복 여부
		const postJsonPromise 	= gfn_postJSON("/co/authrt/selectComDpcnLgnList.do", {
			userId				: userId,
			dpcnLgnPsbltyYn		: dpcnLgnPsbltyYn,
			// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
  		});
		const data = await postJsonPromise;
		try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;
  	      		jsonLgnDpcnGridData.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const lgnDpcnData = {
  	          			userId 			: item.userId
  	          		  , dpcnLgnPsbltyYn : item.dpcnLgnPsbltyYn
  	          		  , ipInfo 			: item.ipInfo
  	          		  , ipLmtYn 		: item.ipLmtYn
  	          		  , useYn 			: item.useYn
  	          		  , sysLastChgDt 	: item.sysLastChgDt
  	          		  , delYn			: 'N'
  	          		  , addYn			: 'N'
  	  				}
  	          		jsonLgnDpcnGridData.push(lgnDpcnData);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});
  	          	
  	          	if (jsonLgnDpcnGridData.length > 0) {
  	          		if(grdUserLgnDpcn.getPageTotalCount() != data.resultList[0].totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			grdUserLgnDpcn.setPageTotalCount(data.resultList[0].totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			grdUserLgnDpcn.rebuild();
  	    				}else{
  	    					grdUserLgnDpcn.refresh();
  	    				}

  	          		grdUserLgnDpcn.setRow(2);
  	          	} else {
  	          		grdUserLgnDpcn.setPageTotalCount(0);
  	          		grdUserLgnDpcn.rebuild();
  	          	}
  	            fn_addRow(jsonLgnDpcnGridData.length,0);
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
	
	async function fn_save(){
		let gridData = '';
		let saveList = [];
		let gridAllData = grdUserLgnDpcn.getGridDataAll();

		for (var i = 1; i <gridAllData.length; i++) {
			let rowData = grdUserLgnDpcn.getRowData(i);
			let rowSts = grdUserLgnDpcn.getRowStatus(i);
			
			if (rowSts === 3){
				rowData.rowSts = "I";
				saveList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				saveList.push(rowData);
			}else{
				continue;
			}
		}
		
		for(var i=0; i<saveList.length;i++){
			let rowData = saveList[i];
			
			if(gfn_isEmpty(rowData.userId)){
				gfn_comAlert("W0005", '사용자ID');
				return false;
			}
			if(gfn_isEmpty(rowData.dpcnLgnPsbltyYn)){
				gfn_comAlert("W0005", '중복로그인가능여부');
				return false;
			}
			if(gfn_isEmpty(rowData.ipLmtYn)){
				gfn_comAlert("W0005", 'IP 제한여부');
				return false;
			}
			if(gfn_isEmpty(rowData.useYn)){
				gfn_comAlert("W0005", '사용여부');
				return false;
			}
		}
		
		if (saveList.length == 0) {
			gfn_comAlert("W0003", "저장");
    		return;
    	}
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		let postJsonPromise = gfn_postJSON("/co/authrt/saveDpcnLgnList.do", saveList);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_search();
        		return 1;
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }
	}
	
	function fn_addRow(nRow, nCol) {
		grdUserLgnDpcn.setCellData(nRow, 0, "N", true);
		grdUserLgnDpcn.addRow(true);
		grdUserLgnDpcn.setCellDisabled(0, 0, grdUserLgnDpcn.getRows()-1, grdUserLgnDpcn.getCols() -1, false);
		for(var i=0; i<jsonLgnDpcnGridData.length;i++){
			if(!gfn_isEmpty(jsonLgnDpcnGridData[i].addYn)){
				grdUserLgnDpcn.setCellDisabled(0, 0, i+1, 1, true);
			}else{
				grdUserLgnDpcn.setCellDisabled(grdUserLgnDpcn.getRows()-1, 0, grdUserLgnDpcn.getRows()-1, grdUserLgnDpcn.getCols() -1, true);
			}
		}
	}
	
	function fn_delRow(nRow){
		if(grdUserLgnDpcn.getRowStatus(nRow) == 0 || grdUserLgnDpcn.getRowStatus(nRow) == 2){
			gfn_comAlert("E0000", "등록된 행은 삭제할 수 없습니다. \n 사용여부를 변경하여주세요");
    	}else{
    		grdUserLgnDpcn.deleteRow(nRow);
    	}
	}

	const gridValueChanged = async function(){
		
		var nRow = grdUserLgnDpcn.getRow();
		var nCol = grdUserLgnDpcn.getCol();
		
		if(nCol != 1){
			return;
		}
		
		var rowData = grdUserLgnDpcn.getRowData(nRow);
		let userId = rowData.userId;
		
		const postJsonPromise 	= gfn_postJSON("/co/authrt/selectUserIdComDpcnLgn.do", {userId : userId});
		const data = await postJsonPromise;
		try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;
  	      		jsonUserIdData.length = 0;
          		const userIdData = {
          			userId : data.resultList
  				}
          		jsonUserIdData.push(userIdData);
  			}
  	  		if(!gfn_isEmpty(jsonUserIdData[0].userId)){
  	  			gfn_comAlert("E0000", "등록된 사용자ID 입니다.");
  	  			grdUserLgnDpcn.setCellData(nRow, nCol, "", true);
  	  			return false;
  	  		}
  		} catch (e) {
  			console.error("failed", e.message);
		}
	}

</script>

</html>