<%
/**
 * @Class Name : comCdManage.jsp
 * @Description : 공통코드등록 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.05.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 공통코드관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 공통코드관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_createComCdGridRow"></sbux-button>
                    <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_insertComCd"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_deleteComCd"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_selectComCdList"></sbux-button>
				</div>
			</div>
			<div class="box-body">

				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<td class="td_input" style="border-right:hidden;" >
								<sbux-radio id="selectType" name="selectType" uitype="normal" jsondata-ref="jsonSelectType" text-right-padding="10px"></sbux-radio>
							</td>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input id="srchKeyword" name="srchKeyword" uitype="text" class="form-control input-sm" onkeyenter="fn_KeyEnter()" style="width:200px" placeholder="코드 또는 코드명" ></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-6">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>
									<span>코드목록</span>
									<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div>
							<div id="comCdGridArea" style="height:613px; width:100%;"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li><span>상세코드목록</span></li>
							</ul>
							<div class="ad_tbl_toplist">
								<sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" ></sbux-button>&nbsp;
								<sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
							</div>
						</div>
						<div>
							<div id="comCdDtlGridArea" style="height:613px; width:100%;"></div>
						</div>
					</div>
				</div>
                <!--Button 영역-->
                <div class="sbt-search-button" style="text-align:right;">
            </div>
        </div>
	</div>
</section>
</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">
	var jsonComCdType = [];
    // only document
    window.addEventListener('DOMContentLoaded', async function(e) {
    	// 그리드 생성
    	await gfn_setComCdSBSelect('comCdgrid', 	jsonComCdType, 	'CD_TYPE'), 		// 코드유형
    	fn_comCdCreateGrid();
    	fn_comCdDtlCreateGrid();
    });
    //조회조건
    var jsonSelectType = [
        {text: "코드", value: "ID", checked: "checked"},
        {text: "명", value: "NM"}
    ];

    var comCdgridData = []; // 공통코드 그리드의 참조 데이터 주소 선언
    // 공통코드 그리드 생성
    function fn_comCdCreateGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'comCdGridArea';
	    SBGridProperties.id = 'comCdgrid';
	    SBGridProperties.jsonref = 'comCdgridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.frozencols = 1;
	    SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.paging = {
	    		  'type' : 'page',
	    		  'count' : 5,
	    		  'size' : 20,
	    		  'sorttype' : 'page',
	    		  'showgoalpageui' : true
 		};
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(comCdgrid, this);'>"],
            	ref: 'checked', type: 'checkbox', width: '40px', style: 'text-align:center', typeinfo: {ignoreupdate : true}},
            {caption: ["코드ID"],		ref: 'cdId',	type: 'input',	width: '150px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 20})},
            {caption: ["코드명"],		ref: 'cdNm',	type: 'input',	width: '150px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 100})},
            {caption: ["코드유형"],	ref: 'cdType',	type: 'combo',	width: '150px',	style: 'text-align:center',
            	typeinfo: {ref:'jsonComCdType', itemcount: 10, label:'label', value:'value'}},
            {caption: ["코드설명"],	ref: 'cdExpln',	type: 'input',	width: '200px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 1000})}
        ];
        window.comCdgrid = _SBGrid.create(SBGridProperties);
        comCdgrid.bind( "click" , "fn_selectComCdDtlList" );
        comCdgrid.bind( "afterpagechanged" , "fn_pagingComCd" );
    }

    var comCdDtlGridData = []; // 공통코드 상세 그리드의 참조 데이터 주소 선언
	// 공통코드 상세 그리드 생성
    function fn_comCdDtlCreateGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'comCdDtlGridArea';
	    SBGridProperties.id = 'comCdDtlgrid';
	    SBGridProperties.jsonref = 'comCdDtlGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.frozencols = 1;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.entertotab = true;
	    SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(comCdDtlgrid, this);'>"],
            	ref: 'checked', type: 'checkbox', width: '40px', style: 'text-align:center', typeinfo : {ignoreupdate : true}},
            {caption: ["코드값"],		ref: 'cdVl',		type: 'input',	width: '70px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 20})},
            {caption: ["코드값명"],	ref: 'cdVlNm',		type: 'input',	width: '150px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 100})},
            {caption: ["코드값설명"],	ref: 'cdVlExpln',	type: 'input',	width: '250px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 1000})},
            {caption: ["Sort순서"],	ref: 'indctSeq',	type: 'input',	width: '70px',	style: 'text-align:center',
            	typeinfo : {mask : {alias : 'numeric'}, maxlength: 10}, format : {type:'number'}},
            {caption: ["상위코드값"],	ref: 'upCdVl',		type: 'input',	width: '70px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 20})},
            {caption: ["코드숫자값"],	ref: 'cdNumVl',		type: 'input',	width: '70px',	style: 'text-align:center',
            	typeinfo : {mask : {alias : 'numeric'}, maxlength: 10}, format : {type:'number'}},
            {caption: ["코드문자값"],	ref: 'cdChrVl',		type: 'input',		width: '100px',	style: 'text-align:center',
            	validate : gfn_chkByte.bind({byteLimit: 20})},
            {caption: ["APC코드"],	ref: 'apcCd',		type: 'output',	hidden : true},
            {caption: ["코드ID"],		ref: 'cdId',		type: 'output',	hidden : true},
            {caption: ["행추가여부"],	ref: 'addYn',		type: 'output',	hidden : true}
        ];
        comCdDtlgrid = _SBGrid.create(SBGridProperties);
    }

  	//공통코드 목록 조회
    async function fn_selectComCdList() {
    	comCdgrid.rebuild();
    	let recordCountPerPage = comCdgrid.getPageSize();  							// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;

    	comCdgridData.length = 0;
    	comCdgrid.clearStatus();
    	fn_callSelectComCdList(recordCountPerPage, currentPageNo);
		fn_clearComCdDtl();
    }

    // 공통코드 목록 조회 호출
    async function fn_callSelectComCdList(recordCountPerPage, currentPageNo){
    	let selectType = SBUxMethod.get("selectType");
    	let cdId;
    	let cdNm;
    	if(selectType === 'ID'){
    		cdId = SBUxMethod.get("srchKeyword");
    	}else if(selectType === 'NM'){
    		cdNm = SBUxMethod.get("srchKeyword");
    	}

    	const postJsonPromise = gfn_postJSON("/co/cd/comCds", {
	  		cdId : cdId,
	  		cdNm : cdNm,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : currentPageNo,
   		  	recordCountPerPage : recordCountPerPage
  		});

        const data = await postJsonPromise;

        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	      		let totalRecordCount = 0;
  	      		comCdgridData.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	  				const comCd = {
  							cdId : item.cdId,
  							cdNm : item.cdNm,
  							cdType : item.cdType,
  							cdExpln : item.cdExpln
  	  				}
  	  				comCdgridData.push(comCd);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});

  	          	if (comCdgridData.length > 0) {
  	          		if (comCdgrid.getPageTotalCount() != totalRecordCount) {	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			comCdgrid.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			comCdgrid.rebuild();
  	  				} else {
  	  					comCdgrid.refresh();
  	  				}
  	              	comCdgrid.setCellDisabled(0, 1, comCdgrid.getRows() - 1, 1, true);
  	          	} else {
  	          		comCdgrid.setPageTotalCount(totalRecordCount);
  	          		comCdgrid.rebuild();
  	          	}

  				document.querySelector('#listCount').innerText = totalRecordCount;

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

 	// 공통코드 상세 목록 조회
    async function fn_selectComCdDtlList() {
    	if (!gfn_isEmpty(comCdgrid.getRowData(comCdgrid.getRow()).cdId)) {
    		if (comCdgrid.getPrevRow() != comCdgrid.getRow()) {
    	    	fn_callSelectComCdDtlList();
    		}
    	} else {
    		fn_clearComCdDtl();
    	}
    }

    // 공통코드 상세 목록 조회 호출
    async function fn_callSelectComCdDtlList(){
    	let cdId = comCdgrid.getRowData(comCdgrid.getRow()).cdId;
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {cdId : cdId}, null, true);
        let data = await postJsonPromise;

        try{
        	comCdDtlGridData = [];
        	data.resultList.forEach((item, index) => {
				let comCdDtlList = {
					cdVl : item.cdVl,
					cdVlNm : item.cdVlNm,
					cdVlExpln : item.cdVlExpln,
					indctSeq : item.indctSeq,
					apcCd : item.apcCd,
					cdId : item.cdId,
					upCdVl : item.upCdVl,
					cdNumVl : item.cdNumVl,
					cdChrVl : item.cdChrVl,
					addYn : 'N'
				}
				comCdDtlGridData.push(comCdDtlList);
			});
			comCdDtlgrid.rebuild();
			comCdDtlgrid.setCellDisabled(0, 1, comCdDtlgrid.getRows() - 1, 1, true);
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

 	// 공통코드 페이징
    async function fn_pagingComCd(){
    	let recordCountPerPage = comCdgrid.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = comCdgrid.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	let ref = "<input type='checkbox' onchange='fn_checkAll(comCdgrid, this);'>";
    	comCdgrid.setCellData(0, comCdgrid.getColRef("checked"), ref, true, false);
    	fn_clearComCdDtl();
    	fn_callSelectComCdList(recordCountPerPage, currentPageNo);
    }

    // 공통코드 상세 클리어
    function fn_clearComCdDtl(){
    	comCdDtlGridData = [];
    	comCdDtlgrid.rebuild();
    }


    //신규 작성
    async function fn_createComCdGridRow() {
    	// 공통코드 상세 비우기
    	fn_clearComCdDtl();
    	comCdgrid.addRow(true, {checked:'true'});
    	comCdgrid.setRow(comCdgrid.getGridDataAll().length);
    }

    //선택 삭제
    async function fn_deleteComCd() {
    	let deleteCdList = [];
    	let deleteCdDtlList = [];
        let comCdgridList = comCdgrid.getGridDataAll();
        let comCdDtlgridList = comCdDtlgrid.getGridDataAll();

        for (var i=0; i<comCdgridList.length; i++) {
            if (comCdgridList[i].checked === "true") {
            	deleteCdList.push(comCdgridList[i]);
            }
        }

        for (var i=0; i<comCdDtlgridList.length; i++) {
            if (comCdDtlgridList[i].checked === "true") {
            	deleteCdDtlList.push(comCdDtlgridList[i]);
            }
        }

        if (deleteCdList.length + deleteCdDtlList.length == 0) {
            gfn_comAlert("W0003", "삭제");
            return;
        }

    	let deleteList = {comCdList : deleteCdList, comCdDtlList : deleteCdDtlList};

        if (gfn_comConfirm("Q0001", "삭제")) {
        	const postJsonPromise = gfn_postJSON("/co/cd/deleteComCdComCdDtlList.do", deleteList, this.prgrmId);
			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        	if (deleteCdList.length > 0) {
	 	        		fn_selectComCdList();
		        	} else {
		        		fn_selectComCdDtlList();
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
    }



    //공통코드 및 공통코드 상세 저장
    async function fn_insertComCd() {
    	const saveCdList = [];
    	const saveCdDtlList = [];
    	const comCdGridList = comCdgrid.getGridDataAll();
    	const comCdDtlGridList = comCdDtlgrid.getGridDataAll();
    	let comCdResult = 0;
    	let comCdDtlResult = 0;

    	for(var i=1; i<=comCdGridList.length; i++){
			let rowData = comCdgrid.getRowData(i);
			let rowSts = comCdgrid.getRowStatus(i);
    		if(rowData.checked === 'true'){
    			if (gfn_isEmpty(rowData.cdId)) {
        			gfn_comAlert("W0002", i+"번째 행 코드ID");
        			return;
        		}
        		if (gfn_isEmpty(rowData.cdNm)) {
        			gfn_comAlert("W0002", i+"번째 행 코드명");
        			return;
        		}

	    		if (rowSts === 3 || rowSts === 1) {
	    			let check = await fn_duplicateCheckCdId(rowData);
	    			if (check != 0) {
	    				gfn_comAlert("E0000", i+"번째 행은 중복 된 코드ID 입니다.");
	    				return;
	    			}
					rowData.rowSts = "I";
					saveCdList.push(rowData);
	    		} else if (rowSts === 2) {
					rowData.rowSts = "U";
					saveCdList.push(rowData);
	    		} else {
					continue;
	    		}
    		}
    	}
    	for(let i=1; i<=comCdDtlGridList.length; i++){
			let rowData = comCdDtlgrid.getRowData(i);
			let rowSts = comCdDtlgrid.getRowStatus(i);
    		if(rowData.checked === 'true'){
    			if (gfn_isEmpty(rowData.cdVl)) {
        			gfn_comAlert("W0002", i+"번째 행 코드ID");
        			return;
        		}
        		if (gfn_isEmpty(rowData.cdVlNm)) {
        			gfn_comAlert("W0002", i+"번째 행 코드값명");
        			return;
        		}

	    		if (rowSts === 3 || rowSts === 1) {
	    			let check = await fn_duplicateCheckCdIdDtl(rowData)
	    			if (check != 0) {
	    				gfn_comAlert("E0000", i+"번째 행은 중복 된 코드값 입니다.");
	    				return;
	    			}
					rowData.rowSts = "I";
					saveCdDtlList.push(rowData);
	    		} else if (rowSts === 2) {
					rowData.rowSts = "U";
					saveCdDtlList.push(rowData);
	    		} else {
					continue;
	    		}
    		}
    	}

    	if ((saveCdList.length + saveCdDtlList.length) == 0 ) {
            gfn_comAlert("W0003", "저장");
            return;
        }

    	let saveList = {comCdList : saveCdList, comCdDtlList : saveCdDtlList};

        if (gfn_comConfirm("Q0001", "저장")) {
        	const postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdComCdDtlList.do", saveList, this.prgrmId);	// 프로그램id 추가
			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        	if (saveCdList.length > 0) {
	 	        		fn_selectComCdList();
		        	} else {
		        		fn_selectComCdDtlList();
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
    }

    // 공통코드 중복 체크 호출
    async function fn_duplicateCheckCdId(comCdVO){

    	let postJsonPromise = gfn_postJSON("/co/cd/duplicateCheckCdId.do", comCdVO);
        let data = await postJsonPromise;
		return data.result;
    }

    // 공통코드 상세 중복 체크 호출
    async function fn_duplicateCheckCdIdDtl(comCdVO){
    	let postJsonPromise = gfn_postJSON("/co/cd/duplicateCheckCdIdDtl.do", comCdVO);
        let data = await postJsonPromise;
		return data.result;
    }

    // 공통코드 || 명 입력 후 엔터 이벤트(조회)
    function fn_KeyEnter(){
    	fn_selectComCdList();
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "true" : "false";
        //체크박스 열 index
        var getColRef = grid.getColRef("checked");
        for (var i=0; i<gridList.length; i++) {
            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    }

    //공통코드 상세 행 추가
    function fn_addRow() {
		var cdId = comCdgrid.getRowData(comCdgrid.getRow()).cdId;
		if(cdId ==null || cdId == ''){
			gfn_comAlert("W0001", "공통코드");
			return;
		}
    	comCdDtlgrid.addRow(true, ['true', '', '', '', '', '', '', '', '0000', cdId, 'Y']);
    }
    //공통코드 상세 선택된 행 삭제
    function fn_deleteRow() {
    	var delList = [];
        var gridList = comCdDtlgrid.getGridDataAll();
        for (var i=gridList.length-1; i>-1; i--) {
            if (gridList[i].checked === "true") {
				delList.push(gridList[i])
            	if (gridList[i].addYn == 'N') {
            		gfn_comAlert("E0001", (i+1) + "행은 기존 공통코드 상세이므로 삭제를 이용하여 주세요.");
            		return;
            	}
            	comCdDtlgrid.deleteRow(i+1);
            }
        }
        if (delList.length < 1) {
            gfn_comAlert("W0003", "삭제");
            return;
        }
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>