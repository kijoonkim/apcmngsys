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
    <!------------------ 컴포넌트 테마 CSS ------------------>
	<link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>
	<link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">
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
        table{border-collapse: collapse;border-spacing: 0;}
        table,th{text-align:center;}
        table,td{padding:5px;}
        .tbl{width: 100%;border-top: 2px solid #888;border-bottom: 1px solid #ddd;text-align: left;}
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
                        <sbux-button id="btn_create" name="btn_create" uitype="normal" wrap-class="sbt-btn-reset"
                            text="신규"
                            onclick="fn_create"
                        ></sbux-button>
                        <sbux-button id="btn_delete" name="btn_delete" uitype="normal" wrap-class="sbt-btn-reset"
                            text="삭제"
                            onclick="fn_delete"
                        ></sbux-button>
                        <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset"
                            text="저장"
                            onclick="fn_save"
                        ></sbux-button>
                        <sbux-button id="btn_search" name="btn_search" uitype="normal" wrap-class="sbt-btn-search"
                            text="조회"
                            onclick="fn_search"
                        ></sbux-button>
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
                                                <sbux-label id="srchLabel_1" name="label_norm" uitype="normal" text="시스템구분"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="srchCombo" name="srchCombo" uitype="single"
                                                    jsondata-ref="jsonSearchCombo"
                                                    unselected-text="선택"
                                                    style="width:120px;"
                                                ></sbux-select>
                                            </div>
                                        </div>
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="srchLabel_2" name="label_norm" uitype="normal" text="화면ID"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchPageId" name="srchPageId" uitype="text"
                                                    style="width:200px"
                                                    placeholder="화면ID 입력"
                                                ></sbux-input>
                                            </div>
                                        </div>
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="srchLabel_3" name="label_norm" uitype="normal" text="화면명"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchpageName" name="srchpageName" uitype="text"
                                                    style="width:200px"
                                                    placeholder="화면명 입력"
                                                ></sbux-input>
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
                                <div id="SBGridArea" style="height:340px;"></div>
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
                                        <sbux-input id="pageId" name="pageId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>화면명</th>
                                    <td>
                                        <sbux-input id="pageNm" name="pageNm" uitype="text" style="width:100%" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>화면설명</th>
                                    <td colspan="3">
                                        <sbux-input id="cont" name="cont" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>화면경로</th>
                                    <td colspan="3">
                                        <sbux-input id="url" name="url" uitype="text" style="width:100%" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>화면유형</th>
                                    <td>
                                        <sbux-input id="type" name="type" uitype="text" style="width:100%" ></sbux-input>
                                    </td>
                                    <th>사용여부</th>
                                    <td>
                                        <sbux-select id="useYn" name="useYn" uitype="single">
                                            <option-item value="Y">사용</option-item>
                                            <option-item value="N">미사용</option-item>
                                        </sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록자</th>
                                    <td>
                                        <sbux-input id="creUserId" name="creUserId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>최종변경자</th>
                                    <td>
                                        <sbux-input id="updUserId" name="updUserId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록일시</th>
                                    <td>
                                        <sbux-input id="creDateTime" name="creDateTime" uitype="text" style="width:100%" readonly ></sbux-input>
                                    </td>
                                    <th>최종변경일시</th>
                                    <td>
                                        <sbux-input id="updDateTime" name="updDateTime" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록프로그램</th>
                                    <td>
                                        <sbux-input id="creProgram" name="creProgram" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>최종변경프로그램</th>
                                    <td>
                                        <sbux-input id="updProgram" name="updProgram" uitype="text" style="width:100%" readonly></sbux-input>
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
                                    <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" onclick="fn_addRow" disabled></sbux-button>&nbsp;
                                    <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" onclick="fn_deleteRow" disabled></sbux-button>
                                </div>
                            </h3>
                        </div>
                        <div class="sbt-wrap-body">
                            <div class="sbt-grid">
                                <!-- SBGrid를 호출합니다. -->
                                <div id="SBGridArea2" style="height:300px;"></div>
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
        fn_createGrid();
        fn_createGrid2();
    });
    //조회조건
    var jsonSearchCombo = [
    	{'text': '정보지원시스템', 'value': 'AM'},
        {'text': '시스템관리', 'value': 'CO'},
        {'text': '생산관리', 'value': 'PM'}
    ];
    //신규 작성
    function fn_create() {
        SBUxMethod.set("gubun", "C");
        //전체 행의 선택 해제
        datagrid.clearSelection();
        //상세정보 초기화
        SBUxMethod.attr("pageId", "readonly", false);
        SBUxMethod.set("pageId", "");
        SBUxMethod.set("pageNm", "");
        SBUxMethod.set("cont", "");
        SBUxMethod.set("url", "");
        SBUxMethod.set("type", "");
        SBUxMethod.set("useYn", "Y");
        SBUxMethod.set("creUserId", "");
        SBUxMethod.set("creDateTime", "");
        SBUxMethod.set("creProgram", "");
        SBUxMethod.set("updUserId", "");
        SBUxMethod.set("updDateTime", "");
        SBUxMethod.set("updProgram", "");
        //개체목록 초기화
        gridData2 = [];
        datagrid2.refresh();
    }
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
    function fn_save() {
        //validate check
        if (!SBUxMethod.get("pageId")) {
            alert("화면ID를 입력하세요.");
            return;
        }
        if (!SBUxMethod.get("pageNm")) {
            alert("화면명를 입력하세요.");
            return;
        }
        //form data - gubun: C(INSERT), M(UPDATE)
        var params = $('#frm1').serialize();
        console.log("form data ::::: " + params);
        //grid data - DELETE INSERT
        var gridList = datagrid2.getGridDataAll();
        console.log("grid data ::::: " + JSON.stringify(gridList));
    }
    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var srchCombo = SBUxMethod.get("srchCombo");
        if (!srchCombo) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        //
        fn_setGridData("init");
    }
    //상세정보 보기
    function fn_view(args) {
        var nCol = datagrid.getCol();
        if (args == undefined) {
            //특정 열 부터 이벤트 적용
            if (nCol < 2) {
                return;
            }
        }
        var nRow = datagrid.getRow();
        if (nRow < 1) {
            return;
        }
        SBUxMethod.set("gubun", "M");
        var rowData = datagrid.getRowData(nRow);
        SBUxMethod.set("pageId", rowData.pageId);
        SBUxMethod.set("pageNm", rowData.pageNm);
        SBUxMethod.set("cont", rowData.cont);
        SBUxMethod.set("url", rowData.url);
        SBUxMethod.set("type", rowData.type);
        SBUxMethod.set("useYn", rowData.useYn);
        SBUxMethod.set("creUserId", rowData.creUserId);
        SBUxMethod.set("creDateTime", rowData.creDateTime);
        SBUxMethod.set("creProgram", rowData.creProgram);
        //선택 행 개체목록 조회
        fn_setGridData2();
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
    //grid 초기화
    var grid; // 그리드를 담기위한 객체 선언
    var gridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea';
	    SBGridProperties.id = 'datagrid';
	    SBGridProperties.jsonref = 'gridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			type: 'page   '
			, count: 10
			, size: 10
			, showgoalpageui: true
	    };
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(datagrid, this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["화면ID"],   ref: 'pageId',      type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["화면명"],   ref: 'pageNm',      type:'output',  width:'10%',    style:'text-align:left'},
            {caption: ["화면유형"], ref: 'type',        type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["화면설명"], ref: 'cont',        type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["화면경로"], ref: 'url',         type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["사용여부"], ref: 'useYn',       type:'output',  width:'10%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue == "Y" ? "사용" : "미사용";
                }
            },
            {caption: ["등록자"],   ref: 'creUserNm',   type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["등록일시"], ref: 'creDateTime', type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["등록자ID"], ref: 'creUserId',   type:'output',      hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["최종변경자"],   ref: 'updUserNm',   type:'output',  hidden: true},
            {caption: ["최종변경자ID"], ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"], ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["최종변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_view');
    }
    function fn_setGridData(args) {
        var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        /*
        datagrid.lockGrid(true);
        $.ajax({
            url : "<c:url value='/admin/selectLogListGrid.do' />",
            type : "POST",
            data : param,
            dataType : 'json',
            async : false,
            success : function(result) {
                grid1_data = result.list;
                datagrid.setPageTotalCount(result.listCount);
                if(args == "init"){
                    datagrid.rebuild();
                }
            },
            complete  : function() {
                datagrid.lockGrid(false);
            }
        });
        */
        gridData = [
            {'pageId': 'page0001', 'pageNm': '화면1', 'type': '조회', 'cont': '화면1_설멍', 'url': '/page/page1.do', 'useYn': 'Y', 'creUserNm': '관리자', 'creUserId': 'admin', 'creDateTime': '2023-05-05 12:00:00'},
            {'pageId': 'page0002', 'pageNm': '화면2', 'type': '조회', 'cont': '화면2_설멍', 'url': '/page/page2.do', 'useYn': 'Y', 'creUserNm': '관리자', 'creUserId': 'admin', 'creDateTime': '2023-05-05 12:00:00'},
            {'pageId': 'page0003', 'pageNm': '화면3', 'type': '조회', 'cont': '화면3_설멍', 'url': '/page/page3.do', 'useYn': 'Y', 'creUserNm': '관리자', 'creUserId': 'admin', 'creDateTime': '2023-05-05 12:00:00'},
            {'pageId': 'page0004', 'pageNm': '화면4', 'type': '조회', 'cont': '화면4_설멍', 'url': '/page/page4.do', 'useYn': 'N', 'creUserNm': '관리자', 'creUserId': 'admin', 'creDateTime': '2023-05-05 12:00:00'},
            {'pageId': 'page0005', 'pageNm': '화면5', 'type': '조회', 'cont': '화면5_설멍', 'url': '/page/page5.do', 'useYn': 'Y', 'creUserNm': '관리자', 'creUserId': 'admin', 'creDateTime': '2023-05-05 12:00:00'}
        ];
        datagrid.setPageTotalCount(gridData.length);
        if (args === "init") {
            datagrid.rebuild();
            if (gridData.length > 0) {
                //첫 번째 행 선택
                datagrid.setRow(datagrid.getFixedRows())
                //선택 행 상세정보 보기
                fn_view(args);
            }
        }
    }
    //grid2 초기화
    var grid2; // 그리드를 담기위한 객체 선언
    var gridData2 = []; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid2() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea2';
	    SBGridProperties.id = 'datagrid2';
	    SBGridProperties.jsonref = 'gridData2';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(datagrid2, this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["id"],       ref: 'objId',   type:'input',  width:'20%',    style:'text-align:center'},
            {caption: ["명칭"],     ref: 'objNm',   type:'input',  width:'20%',    style:'text-align:center'},
            {caption: ["유형"],     ref: 'objType', type:'combo',   width:'22%',    style:'text-align:center',
                typeinfo: {ref: 'typeComboData', label: 'label', value: 'value', oneclickedit: true, displayui: true}
            },
            {caption: ["센터"],     ref: 'center',  type:'input',  width:'20%',    style:'text-align:center'},
            {caption: ["표시여부"], ref: 'dispYn',  type:'combo',  width:'18%',    style:'text-align:center',
                typeinfo: {ref: 'dispYnComboData', label: 'label', value: 'value', oneclickedit: true, displayui: true}
            }
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
    }
    //
    var typeComboData = [
        {label: '버튼', value: 'BUTTON'},
        {label: '그룹', value: 'GROUP'},
        {label: '유효성', value: 'VALIDATE'}
    ];
    var dispYnComboData = [
        {label: 'Y', value: 'Y'},
        {label: 'N', value: 'N'}
    ];
    //
    function fn_setGridData2() {
        //Set Ajax data
        var data = {
            pageId: SBUxMethod.get("pageId")
        }
        gridData2 = [
            {'objId': 'btnSearch', 'objNm': '조회', 'objType': 'BUTTON', 'center': '', 'dispYn': 'Y'},
            {'objId': 'grpInsert', 'objNm': '등록GROUP', 'objType': 'GROUP', 'center': '', 'dispYn': 'Y'},
            {'objId': 'ipbGrpId', 'objNm': '그룹id', 'objType': 'VALIDATE', 'center': '', 'dispYn': 'Y'}
        ];
        datagrid2.setPageTotalCount(gridData2.length);
        datagrid2.rebuild();
        //버튼 활성화
        SBUxMethod.attr("btn_add", "disabled", false);
        SBUxMethod.attr("btn_del", "disabled", false);
    }
    //행 추가
    function fn_addRow() {
        datagrid2.addRow();
    }
    //선택된 행 삭제
    function fn_deleteRow() {
        var gridList = datagrid2.getGridDataAll();
        for (var i=gridList.length-1; i>-1; i--) {
            if (gridList[i].checked === "Y") {
                datagrid2.deleteRow(i+1);
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