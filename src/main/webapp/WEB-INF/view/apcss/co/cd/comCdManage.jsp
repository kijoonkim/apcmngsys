<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
    <link href="/resource/css/template_com.css" rel="stylesheet" type="text/css">
    <script>
        var SBUxConfig = {
            Path: '/resource/sbux/',
            SBGrid: {
                Version2_5: true
            },
            SBChart: {
                Version2_0: true
            }
        }
    </script>
    <script src="/resource/sbux/SBUx.js"></script>
    <script src="/resource/script/common.js"></script>
    <!------------------ 컴포넌트 테마 CSS ------------------>
	<link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>
	<link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">
	<!------------------ 커스텀 테마 CSS ------------------>
	<link href="/resource/css/sbgrid_custom.css" rel="stylesheet" type="text/css">
    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다.
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/
        .sbt-A-wrap {min-width:1024px; margin:0 auto; border:1px solid #333;}
        .sbt-A-wrap .main {display:table;  width:100%; height:500px;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px; }
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell;}
        .sbux-sidemeu {position: relative; z-index: 1;}
    </style>
</head>
<body>
	<div class="sbt-A-wrap">
        <div class="main">
            <!--main content-->
            <div class="content">
                <!--full content-->
                <div class="sbt-wrap-full">
                    <!--탭 입력 영역-->
                    <div class="sbt-input-tab">
                        <div class="tab-content">
                            <div class="sbt-tab-wrap">
                                <div class="sbt-tab-row">
                                    <!--col -->
                                    <div class="sbt-tab-col">
                                        <div class="sbt-col-left">
                                            <sbux-radio id="selectType" name="selectType" uitype="normal" wrap-class="sbt-radio"  jsondata-ref="jsonSelectType"></sbux-radio>
                                        </div>
                                        <div class="sbt-col-right">
                                            <sbux-input id="srchKeyword" name="srchKeyword" uitype="text" onkeyenter="fn_KeyEnter()" style="width:200px" placeholder="코드 또는 코드명" ></sbux-input>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Button 영역-->
                <div class="sbt-search-button" style="text-align:right;">
                    <sbux-button id="btn_create" name="btn_create" uitype="normal" wrap-class="sbt-btn-reset" text="신규" onclick="fn_createComCdGridRow"></sbux-button>
                    <sbux-button id="btn_delete" name="btn_delete" uitype="normal" wrap-class="sbt-btn-reset" text="삭제" onclick="fn_deleteComCd"></sbux-button>
                    <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset" text="저장" onclick="fn_insertComCd"></sbux-button>
                    <sbux-button id="btn_selectComcdList" name="btn_selectComcdList" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_selectComcdList"></sbux-button>
                </div>
                <div class="sbt-con-wrap">
                	<ul>
	                    <li style="display:inline-block;float:left;width: 49.5%;vertical-align:top;">
	                    <div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-header">
	                            <span>icon</span>
	                            <h3>코드목록 <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span></h3>
	                        </div>
	                        <div class="sbt-wrap-body">
	                            <div class="sbt-grid">
	                                <!-- SBGrid를 호출합니다. -->
	                                <div id="comCdGridArea" style="width:100%;height:500px;"></div>
	                            </div>
	                        </div>
	                    </div>
	                    </li>
	                    <li style="display:inline-block;float:right;width: 49.5%;vertical-align:top;">
	                    <div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-header">
	                            <span>icon</span>
	                            <h3 style="width:90%">상세코드목록
                                <div style="float:right">
                                    <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" onclick="fn_addRow" ></sbux-button>&nbsp;
                                    <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" onclick="fn_deleteRow"></sbux-button>
                                </div>
                                </h3>
	                        </div>
	                        <div class="sbt-wrap-body">
	                            <div class="sbt-grid">
	                                <!-- SBGrid를 호출합니다. -->
	                                <div id="comCdDtlGridArea" style="height:500px;"></div>
	                            </div>
	                        </div>
	                    </div>
	                    </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	// 그리드 생성
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
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.clickeventarea = {fixed: true, empty: false};
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.paging = {
	    		  'type' : 'page',
	    		  'count' : 5,
	    		  'size' : 20,
	    		  'sorttype' : 'page',
	    		  'showgoalpageui' : true
 		};
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(comCdgrid, this);'>"],
                ref: 'checked', type: 'checkbox', width: '50px', style: 'text-align:center', sortable: false,
                typeinfo : {ignoreupdate : true}
            },
            {caption: ["코드ID"],   ref: 'cdId',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["코드명"],   ref: 'cdNm',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["코드설명"], ref: 'cdExpln', type:'input',  width:'200px',    style:'text-align:center'}
        ];
        window.comCdgrid = _SBGrid.create(SBGridProperties);
        comCdgrid.bind('click', 'fn_selectComCdDtlList');
        comCdgrid.bind( "beforepagechanged" , "fn_pagingComCd" );
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
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.entertotab = true;
	    SBGridProperties.paging = {
	    		  'type' : 'page',
	    		  'count' : 5,
	    		  'size' : 15,
	    		  'sorttype' : 'page',
	    		  'showgoalpageui' : true
 		};
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(comCdDtlgrid, this);'>"],
                ref: 'checked', type: 'checkbox', width : '50px', style: 'text-align:center', sortable: false,
                typeinfo : {ignoreupdate : true}
            },
            {caption: ["코드값"],       ref: 'cdVl',   		type:'input',   width:'150px',    style:'text-align:center'},
            {caption: ["코드값명"],     ref: 'cdVlNm',    	type:'input',   width:'150px',    style:'text-align:center'},
            {caption: ["코드값설명"],   ref: 'cdVlExpln',   type:'input',   width:'250px',    style:'text-align:center'},
            {caption: ["Sort순서"],     ref: 'indctSeq',   	type:'input',   width:'150px',    style:'text-align:center'},
            {caption: ["APC코드"],  	ref: 'apcCd', 		type:'input',   width:'0px',    style:'text-align:center', hidden : true},
            {caption: ["코드ID"],  		ref: 'cdId', 		type:'input',   width:'0px',    style:'text-align:center', hidden : true},
            {caption: ["행추가여부"],  	ref: 'addYn', 		type:'input',   width:'0px',    style:'text-align:center', hidden : true}

        ];
        window.comCdDtlgrid = _SBGrid.create(SBGridProperties);
        comCdDtlgrid.bind( "beforepagechanged" , "fn_pagingComCdDtl" );
    }

  	//공통코드 목록 조회
    async function fn_selectComcdList() {

    	let recordCountPerPage = comCdgrid.getPageSize();  							// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;

    	fn_callSelectComcdList(recordCountPerPage, currentPageNo);
    }

    // 공통코드 목록 조회 호출
    async function fn_callSelectComcdList(recordCountPerPage, currentPageNo){
    	comCdgrid.clearStatus();
    	let selectType = SBUxMethod.get("selectType");
    	let cdId;
    	let cdNm;
    	if(selectType === 'ID'){
    		cdId = SBUxMethod.get("srchKeyword");
    	}else if(selectType === 'NM'){
    		cdNm = SBUxMethod.get("srchKeyword");
    	}
    	let newGridData = [];
    	fetch("/co/cd/comCds", {
  		  	method: "POST",
  		  	async : "false",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({

  		  		cdId: cdId,
  		  		cdNm : cdNm,
  		  		pagingYn : 'Y',
  		  		currentPageNo : currentPageNo,
  		  		recordCountPerPage : recordCountPerPage

  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					data.resultList.forEach((item, index) => {
						let comCdList = {
								cdId : item.cdId,
								cdNm : item.cdNm,
								cdExpln : item.cdExpln
						}
						newGridData.push(comCdList);
					});
					comCdgridData = newGridData;
					if(comCdgridData.length > 0){

						if(comCdgrid.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
							comCdgrid.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
							comCdgrid.rebuild();
						}else{
					    	comCdgrid.refresh()
						}
						$('#listCount').text(data.resultList[0].totalRecordCount);
					}else{
						$('#listCount').text(0);
						comCdgrid.setPageTotalCount(0);
						comCdgrid.rebuild();
					}
				}
  		);
    }

 	// 공통코드 상세 목록 조회
    async function fn_selectComCdDtlList() {
    	let recordCountPerPage = comCdDtlgrid.getPageSize();
    	let currentPageNo = 1;

    	fn_callSelectComCdDtlList(recordCountPerPage, currentPageNo);
    	if(!(comCdgrid.getRowData(comCdgrid.getRow()).cdId === null || comCdgrid.getRowData(comCdgrid.getRow()).cdId === '')){
	    	fn_callSelectComCdDtlList(recordCountPerPage, currentPageNo)
    	}else{
    		fn_clearComCdDtl();
    	}
    }

    // 공통코드 상세 목록 조회 호출
    async function fn_callSelectComCdDtlList(recordCountPerPage, currentPageNo){
    	let cdId = comCdgrid.getRowData(comCdgrid.getRow()).cdId;
    	let newDtlGridData = [];
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {cdId : cdId});
        let data = await postJsonPromise;

        try{
        	data.resultList.forEach((item, index) => {
				let comCdDtlList = {
						cdVl : item.cdVl,
						cdVlNm : item.cdVlNm,
						cdVlExpln : item.cdVlExpln,
						indctSeq : item.indctSeq,
						apcCd : item.apcCd,
						cdId : item.cdId,
						addYn : 'N'
				}
				newDtlGridData.push(comCdDtlList);
			});
			comCdDtlGridData = newDtlGridData;
			if(comCdDtlGridData.length > 0){

				if(comCdDtlgrid.getPageTotalCount() != data.resultList[0].totalRecordCount){  // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					comCdDtlgrid.setPageTotalCount(data.resultList[0].totalRecordCount); // 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					comCdDtlgrid.rebuild();  // 페이지 load 이후 조회하는 형태로 처음 데이터 바인딩시 반드시 rebuild해줘야 합니다.
				}else{
			    	comCdDtlgrid.refresh()
				}
			}else{
				comCdDtlgrid.rebuild();
			}

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

 	// 공통코드 페이징
    async function fn_pagingComCd(){
    	let recordCountPerPage = comCdgrid.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = comCdgrid.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_clearComCdDtl();
    	fn_callSelectComcdList(recordCountPerPage, currentPageNo);
    }

    // 공통코드 상세 페이징
    async function fn_pagingComCdDtl(){
    	let recordCountPerPage = comCdDtlgrid.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = comCdDtlgrid.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_callSelectComCdDtlList(recordCountPerPage, currentPageNo);
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
    	comCdgrid.addRow(true);
    }

    //선택 삭제
    async function fn_deleteComCd() {

    	let delComCdList = [];
    	let delComCdDtlList = [];
        let comCdgridList = comCdgrid.getGridDataAll();
        let comCdDtlgridList = comCdDtlgrid.getGridDataAll();
        let resultComCdCnt = 0;
        let resultComCdDtlCnt = 0;
        for (var i=0; i<comCdgridList.length; i++) {
            if (comCdgridList[i].checked === "true") {
            	delComCdList.push(comCdgridList[i]);
            }
        }

        for (var i=0; i<comCdDtlgridList.length; i++) {
            if (comCdDtlgridList[i].checked === "true") {
            	delComCdDtlList.push(comCdDtlgridList[i]);
            }
        }

        if (comCdgridList.length + comCdDtlgridList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }

        var delMsg = "삭제 하시겠습니까?";
        if (confirm(delMsg)) {

        	if(delComCdList.length > 0){
        		resultComCdCnt += await fn_callDeleteComCd(delComCdList);
        	}
        	if(delComCdDtlList.length >0){
        		resultComCdDtlCnt += await fn_callDeleteComCdDtl(delComCdDtlList);
        	}

        	if(resultComCdCnt > 0){
        		fn_selectComcdList();
        	}

        	if(resultComCdDtlCnt > 0){
        		let recordCountPerPage = comCdDtlgrid.getPageSize();
            	let currentPageNo = 1;
            	if(!(comCdgrid.getRowData(comCdgrid.getRow()).cdId == null || comCdgrid.getRowData(comCdgrid.getRow()).cdId == '')){
    	    		fn_callSelectComCdDtlList(recordCountPerPage, currentPageNo)
	        	}else{
	        		fn_clearComCdDtl();
	        	}
        	}
        	if(resultComCdCnt + resultComCdDtlCnt > 0){
        		alert("삭제 되었습니다.");
        	}

        }
    }



    //공통코드 및 공통코드 상세 저장
    async function fn_insertComCd() {
    	const addList = [];
    	const updateList = [];
    	const addDtlList = [];
    	const updateDtlList = [];
    	const comCdGridList = comCdgrid.getGridDataAll();
    	const comCdDtlGridList = comCdDtlgrid.getGridDataAll();
    	let comCdResult = 0;
    	let comCdDtlResult = 0;
    	for(var i=1; i<=comCdGridList.length; i++){

    		if(comCdgrid.getRowData(i).checked === 'true'){
    			let cdId = comCdgrid.getRowData(i).cdId;
    			let cdNm = comCdgrid.getRowData(i).cdNm;
    			if(cdId == null || cdId == ''){
        			alert(i+"번째 행 코드ID는 필수 입력 값 입니다.");
        			return;
        		}
        		if(cdNm == null || cdNm == ''){
        			alert(i+"번째 행 코드명는 필수 입력 값 입니다.");
        			return;
        		}

	    		if(comCdgrid.getRowStatus(i) === 3 || comCdgrid.getRowStatus(i) === 1){
	    			let check = await fn_duplicateCheckCdId(cdId, i);
	    			if(check != 0){
	    				alert(i+"번째 행은 중복 된 코드ID 입니다.");
	    				return;
	    			}
		    		addList.push(comCdgrid.getRowData(i))
	    		}else if(comCdgrid.getRowStatus(i) === 2){
	    			updateList.push(comCdgrid.getRowData(i))
	    		}
    		}
    	}
    	for(let i=1; i<=comCdDtlGridList.length; i++){

    		if(comCdDtlgrid.getRowData(i).checked === 'true'){
    			let cdVl = comCdDtlgrid.getRowData(i).cdVl;
    			let cdVlNm = comCdDtlgrid.getRowData(i).cdVlNm;
    			if(cdVl == null || cdVl == ''){
        			alert(i+"번째 행 코드값는 필수 입력 값 입니다.");
        			return;
        		}
        		if(cdVlNm == null || cdVlNm == ''){
        			alert(i+"번째 행 코드값명는 필수 입력 값 입니다.");
        			return;
        		}

    			let check = await fn_duplicateCheckCdIdDtl(comCdDtlgrid.getRowData(i))
    			if(check != 0){
    				alert(i+"번째 행은 중복 된 코드ID 입니다.");
    				return;
    			}

	    		if(comCdDtlgrid.getRowStatus(i) === 3 || comCdDtlgrid.getRowStatus(i) === 1){
	    			addDtlList.push(comCdDtlgrid.getRowData(i))
	    		}else if(comCdDtlgrid.getRowStatus(i) === 2){
	    			updateDtlList.push(comCdDtlgrid.getRowData(i))
	    		}
    		}
    	}

		let addListCnt = addList.length;
		let updateListCnt = updateList.length;
		let addDtlListCnt = addDtlList.length;
		let updateDtlListCnt = updateDtlList.length;

    	if ((addListCnt + updateListCnt + addDtlListCnt + updateDtlListCnt) == 0 ) {
            alert("저장 할 대상이 없습니다.");
            return;
        }
    	var seveMsg = "저장 하시겠습니까?";
        if (confirm(seveMsg)) {
        	if(addListCnt > 0){
    			comCdResult += await fn_callInsertComCd(addList);
    		}

        	if(updateListCnt > 0){
        		comCdResult += await fn_callUpdateComCd(updateList);
        	}

        	if(addDtlListCnt > 0){
        		comCdDtlResult += await fn_callInsertComCdDtl(addDtlList)
        	}
        	if(updateDtlListCnt > 0){
        		comCdDtlResult += await fn_callUpdateComCdDtl(updateDtlList);
        	}
        	if(comCdResult > 0){
        		fn_selectComcdList();
        		fn_clearComCdDtl();
        	}
        	if(comCdDtlResult > 0){
        		let recordCountPerPage = comCdDtlgrid.getPageSize();
            	let currentPageNo = 1;
            	if(!(comCdgrid.getRowData(comCdgrid.getRow()).cdId == null || comCdgrid.getRowData(comCdgrid.getRow()).cdId == '')){
    	    		fn_callSelectComCdDtlList(recordCountPerPage, currentPageNo)
	        	}else{
	        		fn_clearComCdDtl();
	        	}
        	}
        	if(comCdResult + comCdDtlResult > 0){
        		alert("저장 되었습니다.");
        	}
        }


    }

    // 공통코드 중복 체크 호출
    async function fn_duplicateCheckCdId(cdId){

    	let postJsonPromise = gfn_postJSON("/co/cd/duplicateCheckCdId.do", {cdId : cdId});
        let data = await postJsonPromise;
		return data.result;
    }

    // 공통코드 상세 중복 체크 호출
    async function fn_duplicateCheckCdIdDtl(comCdVO){
    	let postJsonPromise = gfn_postJSON("/co/cd/duplicateCheckCdIdDtl.do", comCdVO);
        let data = await postJsonPromise;
		return data.result;
    }

    // 공통코드 등록
    async function fn_callInsertComCd(comCdList){

    	let postJsonPromise = gfn_postJSON("/co/cd/insertComCdList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
				return data.result;
			}else{
				alert("저장을 실패 했습니다.");
				return;
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    // 공통코드 수정
    async function fn_callUpdateComCd(comCdList){

    	let postJsonPromise = gfn_postJSON("/co/cd/updateComCdList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
				return data.result;
			}else{
				alert("저장을 실패 했습니다.");
				return;
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    // 공통코드 삭제
    async function fn_callDeleteComCd(comCdList){

    	let postJsonPromise = gfn_postJSON("/co/cd/deleteComCdList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
				return data.result;
			}else{
				alert("삭제를 실패 했습니다.");
				return;
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    // 공통코드 상세 등록
    async function fn_callInsertComCdDtl(comCdList){

    	let postJsonPromise = gfn_postJSON("/co/cd/insertComCdDtlList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
				return data.result;
			}else{
				alert("저장을 실패 했습니다.");
				return;
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

 	// 공통코드 상세 수정
    async function fn_callUpdateComCdDtl(comCdList){

    	let postJsonPromise = gfn_postJSON("/co/cd/updateComCdList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
				return data.result;
			}else{
				alert("저장을 실패 했습니다.");
				return;
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }

    }

 	// 공통코드 상세 삭제
    async function fn_callDeleteComCdDtl(comCdList){

    	let postJsonPromise = gfn_postJSON("/co/cd/deleteComCdDtlList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
				return data.result;
			}else{
				alert("삭제를 실패 했습니다.");
				return;
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    // 공통코드 || 명 입력 후 엔터 이벤트(조회)
    function fn_KeyEnter(){
    	fn_selectComcdList();
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
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
			alert("공통코드를 선택 해주세요.");
			return;
		}
    	comCdDtlgrid.addRow(true, ['false', '', '', '', '','0000', cdId, 'Y']);
    }
    //공통코드 상세 선택된 행 삭제
    function fn_deleteRow() {
    	var delList = [];
        var gridList = comCdDtlgrid.getGridDataAll();
        for (var i=gridList.length-1; i>-1; i--) {
            if (gridList[i].checked === "true") {
				delList.push(gridList[i])
            	if(gridList[i].addYn == 'N'){
            		alert((i+1) + "행은 기존 공통코드 상세이므로 삭제를 이용하여 주세요.");
            		return;
            	}
            	comCdDtlgrid.deleteRow(i+1);
            }
        }
        if (delList.length < 1) {
            alert("선택하세요.");
            return;
        }
    }


</script>
</body>
</html>