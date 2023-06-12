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
        /** table css */
        table{border-collapse: collapse;border-spacing: 0;}
        table,th{text-align:center;}
        table,td{padding:5px;}
        .tbl{width: 100%;border-top: 2px solid #888;border-bottom: 1px solid #ddd;text-align: left;}
    </style>
<title>Insert title here</title>
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
                                                <sbux-label id="srchLabel_2" name="label_norm" uitype="normal" text="권한명"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchAuthNm" name="srchAuthNm" uitype="text"
                                                    style="width:200px"
                                                    placeholder="권한명 입력"
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
                	<ul>
	                    <li style="display:inline-block;float:left;width: 29.5%;vertical-align:top;">
	                    <div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-header">
	                            <span>icon</span>
	                            <h3>권한그룹목록</h3>
	                        </div>
	                        <div class="sbt-wrap-body">
	                            <div class="sbt-grid">
	                                <div id="SBGridArea" style="height:400px;"></div>
	                            </div>
	                        </div>
	                    </div>
	                    </li>
	                    <li style="display:inline-block;width: 69.5%;vertical-align:top;">
	                    <div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-header">
	                            <span>icon</span>
	                            <h3>사용자 목록
	                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
	                            </h3>
	                        </div>
	                        <div class="sbt-wrap-body">
	                            <div class="sbt-grid">
	                                <div id="SBGridArea2" style="height:400px;"></div>
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
        {'text': '관리명1', 'value': 'value1'},
        {'text': '관리명2', 'value': 'value2'},
        {'text': '관리명3', 'value': 'value3'},
        {'text': '관리명4', 'value': 'value4'},
        {'text': '관리명5', 'value': 'value5'}
    ];
    //신규 작성
    function fn_create() {

    }
    //삭제
    function fn_delete() {
        var chkList = datagrid2.getCheckedRowData(0);
        if (chkList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delList = new Array();
        for (var rowData of chkList) {
            var data = rowData.data;
            if (data.checked === "Y") {
                delList.push(data.userId);
            }
        }
        var delMsg = "삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "authId=" + selAuthId + "&delUserId=" + delList.join(",");
            console.log("data ::::: " + params);
        }
    }
    //저장
    function fn_save() {
        var gridList = datagrid2.getGridDataAll();
        var userList = new Array();
        for (data of gridList) {
            userList.push(data.userId);
        }
        var params = "authId=" + selAuthId
            + "userIds=" + userList.join(",");
        console.log("save Params ::::: " + params);
    }
    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var srchCombo = SBUxMethod.get("srchCombo");
        if (!srchCombo) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        //권한그룹목록
        fn_setGridData();
        //사용자목록 init
        datagrid2.setTreeCheckboxAll(false);
    }
    //상세정보 보기
    var selAuthId;
    function fn_view() {
        var nRow = datagrid.getRow();
        if (nRow < 1) {
            return;
        }
        var rowData = datagrid.getRowData(nRow);
        selAuthId = rowData.authId;
        fn_setGridData2(selAuthId);
    }
    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = datagrid2.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
            datagrid2.setCellData(i+1, 0, checkedYn, true, false);
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
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["권한ID"],   ref: 'authId',  type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["권한명"],   ref: 'authNm',  type:'output',  width:'70%',    style:'text-align:center'}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_view');
    }
    function fn_setGridData() {
        var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        gridData = [
            {'authId': 'A01', 'authNm': '시스템관리자'},
            {'authId': 'A02', 'authNm': '전체관리자'},
            {'authId': 'A03', 'authNm': '업무관리자'},
            {'authId': 'A04', 'authNm': '개발자'},
            {'authId': 'A05', 'authNm': '테스트'}
        ];
        datagrid.refresh();
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
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["ID"],           ref: 'userId',      type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["사용자명"],     ref: 'userNm',      type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["센터명"],       ref: 'cntrNm',      type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["유형"],         ref: 'type',        type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["상태"],         ref: 'state',       type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["등록자ID"],     ref: 'creUserId',   type: 'output', width: '12%',   style:'text-align:center'},
            {caption: ["프로그램ID"],   ref: 'progmId',     type: 'output', width: '14%',   style:'text-align:center'},
            {caption: ["등록일시"],     ref: 'creDateTime', type: 'output', width: '14%',   style:'text-align:center'}
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
    }
    function fn_setGridData2(authId) {
        console.log("data ::::: " + authId);
        gridData2 = [
            {'userId': 'userId_01', 'userNm': '사용자_01', 'cntrNm': '통합', 'type': '관리자', 'state': '정상', 'creUserId': 'admin', 'progmId': 'PROGRAM_01', 'creDateTime': '2023-05-01 12:00:00'},
            {'userId': 'userId_02', 'userNm': '사용자_02', 'cntrNm': '통합', 'type': '관리자', 'state': '정상', 'creUserId': 'admin', 'progmId': 'PROGRAM_02', 'creDateTime': '2023-05-01 12:00:00'}
        ];
        document.getElementById("listCount").innerHTML = (gridData2.length).toString();
        datagrid2.refresh();
    }
</script>
</body>
</html>