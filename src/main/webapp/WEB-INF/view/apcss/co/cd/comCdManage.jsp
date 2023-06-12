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
                        <form id="frm" name="frm" method="post">
                        <div class="tab-content">
                            <div class="sbt-tab-wrap">
                                <div class="sbt-tab-row">
                                    <!--col -->
                                    <div class="sbt-tab-col">
                                        <div class="sbt-col-left">
                                            <sbux-radio id="srchCondition" name="srchCondition" uitype="normal" wrap-class="sbt-radio"  jsondata-ref="jsonSearchCond"></sbux-radio>
                                        </div>
                                        <div class="sbt-col-right">
                                            <sbux-input id="srchKeyword" name="srchKeyword" uitype="text" style="width:200px" placeholder="코드 또는 코드명" ></sbux-input>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <!--Button 영역-->
                <div class="sbt-search-button" style="text-align:right;">
                    <sbux-button id="btn_create" name="btn_create" uitype="normal" wrap-class="sbt-btn-reset" text="신규" onclick="fn_create"></sbux-button>
                    <sbux-button id="btn_delete" name="btn_delete" uitype="normal" wrap-class="sbt-btn-reset" text="삭제" onclick="fn_delete"></sbux-button>
                    <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset" text="저장" onclick="fn_save"></sbux-button>
                    <sbux-button id="btn_search" name="btn_search" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_search"></sbux-button>
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
	                                <div id="SBGridArea" style="width:100%;height:300px;"></div>
	                            </div>
	                        </div>
	                    </li>
	                    <li style="display:inline-block;float:right;width: 49.5%;vertical-align:top;">
	                    <div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-header">
	                            <span>icon</span>
	                            <h3 style="width:90%">상세코드목록
	                                <div style="float:right">
	                                    <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" onclick="fn_addRow" disabled ></sbux-button>&nbsp;
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
    var jsonSearchCond = [
        {text: "코드", value: "CODE", checked: "checked"},
        {text: "명", value: "NAME"}
    ];
    //신규 작성
    function fn_create() {

    }
    //선택 삭제
    function fn_delete() {
        var delList = new Array();
        var gridList = datagrid.getGridDataAll();
        for (var i=0; i<gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].codeId);
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

    }
    //목록 조회
    function fn_search() {
        fn_setGridData("init");
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
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			type: 'page'
			, count: 10
			, size: 10
			, showgoalpageui: true
	    };
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(datagrid, this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center', sortable: false,
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["코드ID"],   ref: 'codeId',  type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["코드명"],   ref: 'codeNm',  type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["코드설명"], ref: 'desc',    type:'output',  width:'40%',    style:'text-align:left'}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_setGridData2');
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
            {'codeId': 'code0001', 'codeNm': '코드명1', 'desc': '코드설명1'},
            {'codeId': 'code0002', 'codeNm': '코드명2', 'desc': '코드설명2'},
            {'codeId': 'code0003', 'codeNm': '코드명3', 'desc': '코드설명3'},
            {'codeId': 'code0004', 'codeNm': '코드명4', 'desc': '코드설명4'},
            {'codeId': 'code0005', 'codeNm': '코드명5', 'desc': '코드설명5'}
        ];
        datagrid.setPageTotalCount(gridData.length);
        $('#listCount').html(gridData.length);
        if (args === "init") {
            datagrid.rebuild();
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
            {caption: ["코드값"],       ref: 'value',   type:'input',   width:'20%',    style:'text-align:center'},
            {caption: ["코드값명"],     ref: 'name',    type:'input',   width:'20%',    style:'text-align:center'},
            {caption: ["코드값설명"],   ref: 'desc',    type:'input',   width:'40%',    style:'text-align:left'},
            {caption: ["Sort순서"],     ref: 'order',   type:'input',   width:'20%',    style:'text-align:center'},
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
    }
    //
    let selectCodeId;   //선택코드ID
    function fn_setGridData2() {
        var nCol = datagrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        //데이터 부분만 이벤트 적용
        var nRow = datagrid.getRow();
		if (nRow < 1) {
            return;
		}
        SBUxMethod.set("gubun", "M");
        var rowData = datagrid.getRowData(nRow);
        //Set 선택 코드ID
        selectCodeId = rowData.codeId;
        //Set Ajax data
        var data = {
            codeId: selectCodeId
        }
        gridData2 = [
            {'value': 'codeValue1', 'name': '코드값명1', 'desc': '코드값설명1', 'order': '1'},
            {'value': 'codeValue2', 'name': '코드값명2', 'desc': '코드값설명2', 'order': '2'},
            {'value': 'codeValue3', 'name': '코드값명3', 'desc': '코드값설명3', 'order': '3'}
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