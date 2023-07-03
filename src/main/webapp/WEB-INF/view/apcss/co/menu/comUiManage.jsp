<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:150px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }
        /** table css */
        /* table{border-collapse: collapse;border-spacing: 0;}
        table,th{text-align:center;}
        table,td{padding:5px;}
        .tbl{width: 100%;border-top: 2px solid #888;border-bottom: 1px solid #ddd;text-align: left;} */
    </style>
<meta charset="UTF-8">
</head>
<body>
	<div class="sbt-A-wrap">
        <div class="main">
            <!--main content-->
            <div class="content">
                <!--full content-->
                <div class="sbt-wrap-full">
                    <!--Button 영역-->
                    <div class="sbt-search-button" style="text-align:right;">
                        <sbux-button id="btnSave" name="btnSave" uitype="normal" wrap-class="sbt-btn-reset" text="저장" onclick="fn_save" disabled></sbux-button>
                        <sbux-button id="btnDelete" name="btnDelete" uitype="normal" wrap-class="sbt-btn-reset" text="삭제" onclick="fn_delete" disabled></sbux-button>
                        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_search" ></sbux-button>
                    </div>
                    <!--조회 영역-->
			        <div class="sbt-con-wrap">
                        <form id="frm" name="frm" method="post">
				        <div class="sbt-search-wrap">
                            <div class="sbt-wrap-body-con">
                                <div class="sbt-wrap-body">
                                    <div class="sbt-search-row">
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="lebelSysId" name="lebelSysId" uitype="normal" text="시스템구분"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="srchComboSysId" name="srchComboSysId" uitype="single" jsondata-ref="jsonSearchComboSysId" unselected-text="선택" style="width:120px;"></sbux-select>
                                            </div>
                                        </div>
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="lebelMenuId" name="lebelMenuId" uitype="normal" text="화면ID"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchMenuId" name="srchMenuId" uitype="text" style="width:200px" placeholder="화면ID 입력"></sbux-input>
                                            </div>
                                        </div>
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="lebelMenuNm" name="lebelMenuNm" uitype="normal" text="화면명"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchMenuNm" name="srchMenuNm" uitype="text" style="width:200px" placeholder="화면명 입력"></sbux-input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="sbt-con-wrap">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>화면목록</h3>
                        </div>
                        <div class="sbt-wrap-body">
                            <div class="sbt-grid">
                                <div id="menuGridArea" style="height:250px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sbt-con-wrap">
                	<ul>
                    <li style="display:inline-block;width: 49.5%;vertical-align:top;">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>화면상세정보</h3>
                        </div>
                        <div class="sbt-wrap-body">
                            <form id="frm1" name="frm1" method="post">
                            <!-- 저장 구분(C: 신규, M: 수정) -->
                            <sbux-input id="gubun" name="gubun" uitype="hidden"></sbux-input>
                            <table class="tbl">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tr>
                                    <th>화면ID</th>
                                    <td>
                                        <sbux-input id="menuId" name="menuId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>화면명</th>
                                    <td>
                                        <sbux-input id="menuNm" name="menuNm" uitype="text" style="width:100%" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>화면경로</th>
                                    <td colspan="3">
                                        <sbux-input id="pageUrl" name="pageUrl" uitype="text" style="width:100%" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>화면유형</th>
                                    <td>
                                        <sbux-input id="menuTypeNm" name="menuTypeNm" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>사용여부</th>
                                    <td>
                                        <sbux-select id="delYn" name="delYn"  uitype="single" jsondata-ref="jsonViewComboUseYn" unselected-text="선택">
                                        </sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록자</th>
                                    <td>
                                        <sbux-input id="sysFrstInptUserId" name="sysFrstInptUserId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>최종변경자</th>
                                    <td>
                                        <sbux-input id="sysLastChgUserId" name="sysLastChgUserId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록일시</th>
                                    <td>
                                        <sbux-input id="sysFrstInptDt" name="sysFrstInptDt" uitype="text" style="width:100%" readonly ></sbux-input>
                                    </td>
                                    <th>최종변경일시</th>
                                    <td>
                                        <sbux-input id="sysLastChgDt" name="sysLastChgDt" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록프로그램</th>
                                    <td>
                                        <sbux-input id="sysFrstInptPrgrmId" name="sysFrstInptPrgrmId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>최종변경프로그램</th>
                                    <td>
                                        <sbux-input id="sysLastChgPrgrmId" name="sysLastChgPrgrmId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </div>
                    </div>
                    </li>
                    <li style="display:inline-block;float:right;width: 49.5%;vertical-align:top;">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3 style="width:90%">개체목록
                                <div style="float:right">
                                    <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" onclick="fn_addRow" disabled></sbux-button>&nbsp;
                                    <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" onclick="fn_deleteRow" disabled></sbux-button>
                                </div>
                            </h3>
                        </div>
                        <div class="sbt-wrap-body">
                            <div class="sbt-grid">
                                <!-- SBGrid를 호출합니다. -->
                                <div id="uiGridArea" style="height:230px;"></div>
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
    	fn_createMenuGrid();
    	fn_createMenuUiGrid();
    });
    //조회조건
    var jsonSearchComboSysId = [];
    var jsonViewComboUseYn = [];
    gfn_setComCdSelect('srchComboSysId', jsonSearchComboSysId ,	'SYS_ID', '0000');		// 검색 조건(시스템구분)
    gfn_setComCdSelect('useYn', 		 jsonViewComboUseYn , 	'USE_YN', '0000');		// 화면 상세(사용유무)
    //gfn_setComCdSelectGrid('useYn', 		 delYnComboData , 		'USE_YN', '0000');	// 그리드 (표시유무)
    //gfn_setComCdSelectGrid('delYn', 		 delYnComboData , 		'USE_YN', '0000');	// 그리드 (표시유무)
    //gfn_setComCdSelectGrid('entyType', 		 entyTypeComboData , 		'ENTY_TYPE', '0000');	// 그리드 (표시유무)


    //선택 삭제
    function fn_delete() {
        var delList = new Array();
        var gridList = datagrid.getGridDataAll();
        for (var i=0; i<gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].pageId);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg = "삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delId=" + delList.join(",");
            console.log("data ::::: " + params);
        }
    }
    //저장
    async function fn_save() {

        if (!SBUxMethod.get("menuNm")) {
            alert("화면명를 입력하세요.");
            return;
        }
        if (!SBUxMethod.get("pageUrl")) {
            alert("화면경로를 입력하세요.");
            return;
        }
        if (!SBUxMethod.get("delYn")) {
            alert("사용유무를 선택해주세요.");
            return;
        }
        let updateResult = 0;
        let insertResult = 0;
        var rowData = menuDatagrid.getRowData(menuDatagrid.getRow());

        insertComUiList = [];

        let gridList = uiDataGrid.getGridDataAll();
        for(var i=0; i < gridList.length; i++){
        	if(gridList[i].checked === 'Y'){
        		insertComUiList.push(gridList[i]);
        	}
        }

        if((!(SBUxMethod.get("munuNm") === rowData.numeNm && SBUxMethod.get("pageUrl") === rowData.pageUrl && SBUxMethod.get("delYn") === rowData.delYn)) || insertComUiList.length == 0){
        	alert("변경 된 내용이 없습니다.");
        	return;
        }
        var seveMsg = "저장 하시겠습니까?";
        if(confirm(seveMsg)){

	        if(!(SBUxMethod.get("munuNm") === rowData.numeNm && SBUxMethod.get("pageUrl") === rowData.pageUrl && SBUxMethod.get("delYn") === rowData.delYn)){
	        	updateResult = fn_callUpdateMenu();
	        }
	        if(insertComUiList.length > 0){
	        	insertResult = fn_callInsertComUi(insertComUiList);
	        }
        }

        if(updateResult + insertResult > 0){
        	fn_setGridData();
        	alert("저장 되었습니다.");
        }
    }

    async function fn_callUpdateMenu(){
        let menuId = SBUxMethod.get('menuId');
        let menuNm = SBUxMethod.get('menuNm');
        let pageUrl = SBUxMethod.get('pageUrl');
        let useYn = SBUxMethod.get('delYn');
        let delYn;
        if(useYn == "Y"){
        	delYn == 'N';
        }else if(useYn == 'N'){
        	delYn == 'Y'
        }
        let menuVO = {
        		menuId : menuId,
        		menuNm : menuNm,
        		pageUrl : pageUrl,
        		delYn : delYn
        }
        let postJsonPromise = gfn_postJSON("/co/menu/updateMenu.do", menuVO);
        let data = await postJsonPromise;
        try{
        	return data.result;

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    async function fn_callInsertComUi(comUiList){
        let postJsonPromise = gfn_postJSON("/co/menu/insertComUiList.do", comUiList);
        let data = await postJsonPromise;
        try{
        	return data.result;

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var srchComboSysId = SBUxMethod.get("srchComboSysId");
        if (!srchComboSysId) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        //
        fn_setGridData("init");
    }
    //상세정보 보기
    function fn_view(args) {
        var nCol = menuDatagrid.getCol();
        if (args == undefined) {
            //특정 열 부터 이벤트 적용
            if (nCol < 2) {
                return;
            }
        }
        var nRow = menuDatagrid.getRow();
        if (nRow < 1) {
            return;
        }
        SBUxMethod.set("gubun", "M");
        var rowData = menuDatagrid.getRowData(nRow);
        SBUxMethod.set("menuId", rowData.menuId);
        SBUxMethod.set("menuNm", rowData.menuNm);
        SBUxMethod.set("menuTypeNm", rowData.menuTypeNm);
        SBUxMethod.set("pageUrl", rowData.pageUrl);
        SBUxMethod.set("type", rowData.type);
        SBUxMethod.set("delYn", rowData.delYn);
        SBUxMethod.set("sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
        SBUxMethod.set("sysLastChgDt", rowData.sysLastChgDt);

        //선택 행 개체목록 조회
        fn_setUiGridData();
      	//버튼 활성화
        SBUxMethod.attr("btnSave", "disabled", false);
        SBUxMethod.attr("btnDelete", "disabled", false);
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

    var menuGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createMenuGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'menuGridArea';
	    SBGridProperties.id = 'menuDatagrid';
	    SBGridProperties.jsonref = 'menuGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["NO"],   		ref: 'rowSeq',      		type:'output',  width:'50px',    style:'text-align:center'},
            {caption: ["화면ID"],   	ref: 'menuId',      		type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["화면명"],   	ref: 'menuNm',      		type:'output',  width:'200px',    style:'text-align:left'},
            {caption: ["화면유형"], 	ref: 'menuType',    		type:'output',  hidden: true},
            {caption: ["화면유형"], 	ref: 'menuTypeNm',    		type:'output',  width:'100PX',    style:'text-align:center'},
            {caption: ["화면경로"], 	ref: 'pageUrl',     		type:'output',  width:'250px',    style:'text-align:left'},
            {caption: ["사용여부"], 	ref: 'delYn',       		type:'output',  width:'100px',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue == "Y" ? "사용" : "미사용";
                }
            },
            {caption: ["등록자"],   		ref: 'sysFrstInptUserId',   type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["등록프로그램"], 	ref: 'sysFrstInptPrgrmId', 	type:'output',  hidden: true},
            {caption: ["등록일시"], 		ref: 'sysFrstInptDt', 		type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["최종변경자"],   	ref: 'sysLastChgUserId',   	type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["최종변경프로그램"], ref: 'sysLastCngPrgrmId', 	type:'output',  hidden: true},
            {caption: ["최종변경일시"], 	ref: 'sysLastChgDt', 		type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["APC코드"], 			ref: 'apcCd', 				type:'output',  hidden: true}
        ];
        menuDatagrid = _SBGrid.create(SBGridProperties);
        menuDatagrid.bind('click', 'fn_view');
    }

    async function fn_setGridData(args) {
        let sysId = SBUxMethod.get('srchComboSysId');
        let menuId = SBUxMethod.get('srchMenuId');
        let menuNm = SBUxMethod.get('srchMenuNm');
        let menuVO = {
        		sysId : sysId,
        		menuId : menuId,
        		menuNm : menuNm
        }
        let postJsonPromise = gfn_postJSON("/co/menu/selectMenuUiList.do", menuVO);
        let data = await postJsonPromise;
		let newMenuGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let menuList = {
						rowSeq : item.rowSeq,
						menuId : item.menuId,
						menuNm : item.menuNm,
						menuType : item.menuType,
						menuTypeNm : item.menuTypeNm,
						pageUrl : item.pageUrl,
						delYn : item.delYn,
						sysFrstInptUserId : item.sysFrstInptUserId,
						sysFrstInptDt : item.sysFrstInptDt,
						sysFrstInptPrgrmId : item.sysFrstInptPrgrmId,
						sysLastChgUserId : item.sysLastChgUserId,
						sysLastChgPrgrmId : item.sysLastChgPrgrmId,
						sysLastChgDt : item.sysLastChgDt,
						apcCd : item.apcCd
				}
				newMenuGridData.push(menuList);
			});
        	menuGridData = newMenuGridData;
        	menuDatagrid.rebuild();

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }
    //grid2 초기화
    var uiGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createMenuUiGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'uiGridArea';
	    SBGridProperties.id = 'uiDataGrid';
	    SBGridProperties.jsonref = 'uiGridData';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(datagrid2, this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["id"],       ref: 'entyId',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["명칭"],     ref: 'entyNm',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["유형"],     ref: 'entyType', 	type:'combo',  width:'150px',    style:'text-align:center',
                typeinfo: {ref: 'entyTypeComboData', label: 'label', value: 'value', oneclickedit: true, displayui: true, unselect: {label : '선택', value: ''}}
            },
            {caption: ["표시여부"], ref: 'delYn',  		type:'combo',  width:'100px',    style:'text-align:center',
                typeinfo: {ref: 'delYnComboData', label: 'label', value: 'value', oneclickedit: true, displayui: true, unselect: {label : '선택', value: ''}}
            },
            {caption: ["메뉴ID"],  		ref: 'menuId', 	type:'input', hidden : true},
            {caption: ["행추가여부"],  	ref: 'addYn', 	type:'input', hidden : true}


        ];
        uiDataGrid = _SBGrid.create(SBGridProperties);
    }
    //
    var entyTypeComboData = [
        {label: 'BUTTON', value: '01'},
        {label: 'COMPONENT', value: '02'},
        {label: 'GRID', value: '03'}
    ];

    var delYnComboData = [
    	{label:'사용', value : 'N' },
    	{label:'미사용', value : 'Y' }
    ];
    //
    async function fn_setUiGridData() {

    	var nRow = menuDatagrid.getRow();
        if (nRow < 1) {
            return;
        }
        var rowData = menuDatagrid.getRowData(nRow);

        let menuId = rowData.menuId
        let postJsonPromise = gfn_postJSON("/co/menu/selectUiList.do", {menuId : menuId});
        let data = await postJsonPromise;
		let newUiGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let uiList = {
						menuId : item.menuId,
						entyId : item.entyId,
						entyNm : item.entyNm,
						entyType : item.entyType,
						delYn : item.delYn,
						addYn : 'N'
				}
				newUiGridData.push(uiList);
			});
        	uiGridData = newUiGridData;
        	uiDataGrid.rebuild();

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }

        //버튼 활성화
        SBUxMethod.attr("btnAdd", "disabled", false);
        SBUxMethod.attr("btnDel", "disabled", false);
    }
    //행 추가
    function fn_addRow() {
    	uiDataGrid.addRow(true, ['Y','','','','Y',SBUxMethod.get('menuId'),'Y']);
    }
    //선택된 행 삭제
    function fn_deleteRow() {
        var gridList = uiDataGrid.getGridDataAll();
        for (var i=gridList.length-1; i>-1; i--) {
            if (gridList[i].checked === "Y") {
            	uiDataGrid.deleteRow(i+1);
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