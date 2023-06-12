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
                        <sbux-button id="btn_create" name="btn_create" uitype="normal" wrap-class="sbt-btn-reset" text="신규" onclick="fn_create"></sbux-button>
                        <sbux-button id="btn_delete" name="btn_delete" uitype="normal" wrap-class="sbt-btn-reset" text="삭제" onclick="fn_delete"></sbux-button>
                        <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset" text="저장" onclick="fn_save"></sbux-button>
                        <sbux-button id="btn_search" name="btn_search" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_search" ></sbux-button>
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
                                                <sbux-select id="srchCombo" name="srchCombo" uitype="single" jsondata-ref="jsonSearchCombo" unselected-text="선택" style="width:120px;"></sbux-select>
                                            </div>
                                        </div>
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="srchLabel_2" name="label_norm" uitype="normal" text="권한명"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchAuthNm" name="srchAuthNm" uitype="text" style="width:200px" placeholder="권한명 입력"></sbux-input>
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
                            <h3>권한그룹정보</h3>
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
                                    <th>권한ID</th>
                                    <td>
                                        <sbux-input id="authId" name="authId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>권한명</th>
                                    <td>
                                        <sbux-input id="authNm" name="authNm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>사용자유형</th>
                                    <td>
                                        <sbux-input id="authUser" name="authUser" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th>권한설명</th>
                                    <td>
                                        <sbux-input id="authDesc" name="authDesc" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                            </table>
                            </form>
                            <div class="sbt-grid-wrap">
                                <div class="sbt-wrap-body">
                                    <div class="sbt-grid">
                                        <!-- SBGrid를 호출합니다. -->
                                        <div id="SBGridTreeArea" style="width:100%;height:300px;"></div>
                                    </div>
                                </div>
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
        SBUxMethod.set("gubun", "C");
        //전체 행의 선택 해제
        datagrid.clearSelection();
        //상세정보 초기화
        fn_setDetailInfo("init");
        //메뉴목록 초기화
        datagrid2.clearSelection();
        datagrid2.setTreeCheckboxAll(false);
    }
    //삭제
    function fn_delete() {
        var authId = SBUxMethod.get("authId");
        if (!authId) {
            alert("삭제 대상을 선택하세요.");
            return;
        }
        var params = "authId=" + authId;
        console.log("delete data ::::: " + params);
    }
    //저장
    function fn_save() {
        //validate check
        if (!SBUxMethod.get("authId")) {
            alert("권한ID를 입력하세요.");
            return;
        }
        if (!SBUxMethod.get("authNm")) {
            alert("권한명를 입력하세요.");
            return;
        }
        //form data - gubun: C(INSERT), M(UPDATE)
        var params = $('#frm1').serialize();
        console.log("form data ::::: " + params);
        //grid(tree) data - DELETE INSERT
        var chkList = new Array();
        for (var idx of datagrid2.getCheckedTreeRows()) {
            var rowData = datagrid2.getRowData(idx);
            chkList.push(rowData.menuId);
        }
        if (chkList.length == 0) {
            alert("메뉴를 선택하세요.");
            return;
        }
        var params = "menuId=" + chkList.join(",");
        console.log("tree data ::::: " + params);
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
        fn_setGridData();
        //table data init
        fn_setDetailInfo("init");
        //메뉴목록 init
        datagrid2.setTreeCheckboxAll(false);
    }
    //상세정보 보기
    function fn_view() {
        var nRow = datagrid.getRow();
        if (nRow < 1) {
            return;
        }
        SBUxMethod.set("gubun", "M");
        var rowData = datagrid.getRowData(nRow);
        fn_setDetailInfo(rowData);
        //메뉴 설정
        fn_setGridData2(rowData);
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
            {caption: ["권한ID"],       ref: 'authId',      type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["권한명"],       ref: 'authNm',      type:'output',  width:'70%',    style:'text-align:center'},
            {caption: ["사용자유형"],   ref: 'authType',    type:'output',  hidden: true},
            {caption: ["권한설명"],     ref: 'authDesc',    type:'output',  hidden: true}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_view');
    }
    function fn_setGridData() {
        var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        gridData = [
            {'authId': 'A01', 'authNm': '시스템관리자', 'authUser': '', 'authDesc': '시스템관리자'},
            {'authId': 'A02', 'authNm': '전체관리자', 'authUser': '', 'authDesc': '전체관리자'},
            {'authId': 'A03', 'authNm': '업무관리자', 'authUser': '', 'authDesc': '업무관리자'},
            {'authId': 'A04', 'authNm': '개발자', 'authUser': '', 'authDesc': '개발자'},
            {'authId': 'A05', 'authNm': '테스트', 'authUser': '', 'authDesc': '테스트'}
        ];
        datagrid.refresh();
    }
    function fn_setDetailInfo(args) {
        if (args === "init") {
            SBUxMethod.attr("authId", "readonly", false);
            SBUxMethod.set("authId", "");
            SBUxMethod.set("authNm", "");
            SBUxMethod.set("authUser", "");
            SBUxMethod.set("authDesc", "");
        }
        else {
            SBUxMethod.attr("authId", "readonly", true);
            SBUxMethod.set("authId", args.authId);
            SBUxMethod.set("authNm", args.authNm);
            SBUxMethod.set("authUser", args.authUser);
            SBUxMethod.set("authDesc", args.authDesc);
        }
    }
    //grid2 초기화
    var grid2; // 그리드를 담기위한 객체 선언
    var gridData2 = []; // 그리드의 참조 데이터 주소 선언
    var gridData2 = [
        {level: 0, upMenuId: '',        order: 0,  menuId: 'SYS_MNG', menuNm: '시스템관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 1,  menuId: 'MNG_100', menuNm: '메뉴관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 2,  menuId: 'MNG_200', menuNm: '화면관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 3,  menuId: 'MNG_300', menuNm: '권한관리'},
        {level: 2, upMenuId: 'MNG_300', order: 4,  menuId: 'MNG_310', menuNm: '권한그룹관리'},
        {level: 2, upMenuId: 'MNG_300', order: 5,  menuId: 'MNG_320', menuNm: '권한별 사용자관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 6,  menuId: 'MNG_400', menuNm: '사용자관리'},
        {level: 2, upMenuId: 'MNG_400', order: 7,  menuId: 'MNG_410', menuNm: '사용자관리'},
        {level: 2, upMenuId: 'MNG_400', order: 8,  menuId: 'MNG_420', menuNm: '사용자별 권한관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 9,  menuId: 'MNG_500', menuNm: '메시지관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 10, menuId: 'MNG_600', menuNm: '공통코드'},
        {level: 2, upMenuId: 'MNG_600', order: 11, menuId: 'MNG_610', menuNm: '공통코드관리'},
        {level: 2, upMenuId: 'MNG_600', order: 12, menuId: 'MNG_620', menuNm: '센터별 공통코드관리'},
        {level: 1, upMenuId: 'SYS_MNG', order: 13, menuId: 'MNG_700', menuNm: '이력관리'}
    ];
    function fn_createGrid2() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridTreeArea';
	    SBGridProperties.id = 'datagrid2';
	    SBGridProperties.jsonref = 'gridData2';
        SBGridProperties.tree = {
            col: 0,
            levelref: 'level',
            open: true,
            lock: true,
            checkbox: true,
            checkboxexceptionlevel: [0],
            openlevel: 2,
            checkboxchildrencheck: false,
            iconclickeventignore: true
        };
        SBGridProperties.columns = [
            {caption: ['메뉴목록'], ref: 'menuNm', width: '100%', type: 'output'}
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
        //Tree Checkbox Disabled - 하위 메뉴가 있는 경우
        for (var i=1; i<datagrid2.getRows(); i++) {
            var cLen = datagrid2.getTreeChildRows(i).length;
            if (cLen > 0) {
                datagrid2.setTreeCheckboxDisabled(i, true);
            }
        }
    }
    function fn_setGridData2(data) {
        console.log("form data ::::: " + JSON.stringify(data));
        var result = [
            {"menuId": "MNG_100"}, {"menuId": "MNG_200"}
        ];
        for (var i=1; i<datagrid2.getRows(); i++) {
            var rowData = datagrid2.getRowData(i);
            for (var data of result) {
                if (rowData.menuId === data.menuId) {
                    datagrid2.setTreeCheckboxChecked(i, true)
                }
            }
        }
    }
</script>
</body>
</html>