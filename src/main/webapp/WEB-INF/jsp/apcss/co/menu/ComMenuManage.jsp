<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
                        <form id="frm" name="frm" method="post"></form>
				        <div class="sbt-search-wrap"> 
                            <div class="sbt-wrap-body-con">
                                <div class="sbt-wrap-body">
                                    <div class="sbt-search-row">
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="srchLabel_1" name="label_norm" uitype="normal" text="시스템구분" wrap-class="sbt-label"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="srchCombo" name="srchCombo" uitype="single"
                                                    jsondata-ref="jsonSearchCombo"
                                                    unselected-text="선택"
                                                    style="width:200px;"
                                                ></sbux-select>
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
                    <li style="display:inline-block;float:left;width: 49.5%;vertical-align:top;">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-body">
                            <div class="sbt-grid">
                                <!-- SBGrid를 호출합니다. -->
                                <div id="SBGridArea" style="width:100%;height:300px;"></div>
                            </div>
                        </div>
                    </div>
                    </li>
                    <li style="display:inline-block;float:right;width: 49.5%;vertical-align:top;">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>메뉴상세정보</h3>
                        </div>
                        <div class="sbt-wrap-body">
                            <form id="frm1" name="frm1" method="post">
                            <!-- 저장 구분(C: 신규, M: 수정)-->
                            <sbux-input id="gubun" name="gubun" uitype="hidden"></sbux-input>
                            <table class="tbl">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tr>
                                    <th>상위메뉴</th>
                                    <td>
                                        <sbux-input id="upMenuNm" name="upMenuNm" uitype="text"
                                            style="width:100%"
                                            readonly
                                        ></sbux-input>
                                        <sbux-input id="upMenuId" name="upMenuId" uitype="hidden"></sbux-input>
                                    </td>
                                    <th>시스템구분</th>
                                    <td>
                                        <sbux-input id="sysGb" name="sysGb" uitype="text"
                                            style="width:100%"
                                            readonly
                                        ></sbux-input>
                                        <sbux-input id="sysCd" name="sysCd" uitype="hidden"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>메뉴ID</th>
                                    <td>
                                        <sbux-input id="menuId" name="menuId" uitype="text"
                                            required
                                            style="width:100%"
                                            readonly
                                        ></sbux-input>
                                    </td>
                                    <th>APC코드</th>
                                    <td>
                                        <sbux-input id="apcCd" name="apcCd" uitype="text"
                                            required
                                            style="width:100%"
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>메뉴명</th>
                                    <td>
                                        <sbux-input id="menuNm" name="menuNm" uitype="text"
                                            style="width:100%"
                                        ></sbux-input>
                                    </td>
                                    <th>표시순서</th>
                                    <td>
                                        <sbux-input id="order" name="order" uitype="text"
                                            style="width:100%"
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>화면유형</th>
                                    <td>
                                        <sbux-input id="pType" name="pType" uitype="text"
                                            style="width:100%"
                                        ></sbux-input>
                                    </td>
                                    <th>사용자유형</th>
                                    <td>
                                        <sbux-input id="uType" name="uType" uitype="text"
                                            style="width:100%"
                                        ></sbux-input>
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </div>
                    </div>
                    </li>
                </div>
            </div>
        </div>
    </div>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
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
    function fn_create(nRow) {
        if (nRow == undefined) {
            nRow = datagrid.getRow();
            if (nRow < 1) {
                alert("상위메뉴를 선택하세요.");
                return;
            }
        }
        SBUxMethod.set("gubun", "C");
        var sysGubun = _.find(jsonSearchCombo, {value: SBUxMethod.get("srchCombo")});
        SBUxMethod.set("sysGb", sysGubun.text);
        SBUxMethod.set("sysCd", sysGubun.value);
        var rowData = datagrid.getRowData(nRow);
        SBUxMethod.set("upMenuId", rowData.menuId);
        SBUxMethod.set("upMenuNm", rowData.menuNm);
        SBUxMethod.attr("menuId", "readonly", false);
        SBUxMethod.set("menuId", "");
        SBUxMethod.set("apcCd", "");
        SBUxMethod.set("menuNm", "");
        SBUxMethod.set("order", "");
        SBUxMethod.set("pType", "");
        SBUxMethod.set("uType", "");
    }
    //선택 삭제
    function fn_delete() {
        var menuId = SBUxMethod.get("menuId");
        if (!menuId) {
            alert("메뉴를 선택하세요.");
            return;
        }
        var delMsg = "삭제하시겠습니까?";
        if (confirm(delMsg)) {
            console.log("DELETE MENUID ::::: " + menuId);
        }
    }
    //저장
    function fn_save() {
        var gubun = SBUxMethod.get("gubun");
        if (gubun == undefined) {
            return;
        }
        var saveMsg;
        if (gubun === "C") {//신규
            //validate check
            if (!SBUxMethod.get("menuId")) {
                alert("메뉴ID를 입력하세요.");
                return;
            }
            if (!SBUxMethod.get("menuNm")) {
                alert("메뉴명을 입력하세요.");
                return;
            }
            saveMsg = "저장 하시겠습니까?";
        }
        else if (gubun === "M") {//수정
            saveMsg = "수정 하시겠습니까?";
        }
        if (confirm(saveMsg)) {
            var params = $('#frm1').serialize();
            console.log("form data ::::: " + params);
        }
    }
    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var srchCombo = SBUxMethod.get("srchCombo");
        if (!srchCombo) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        fn_setGridData("init");
    }
    //grid 초기화
    var objMenuList = {
        "ADD": {
            "name": "메뉴 추가",//컨텍스트메뉴에 표시될 이름
            "accesskey": "a",//단축키
            "callback": ctxt_addRow,//콜백함수명
            "callbackparam": ['datagrid', true]// 콜백함수 파라미터 전달
        },
        "Delete": {
            "name": "메뉴삭제",
            "accesskey": "d",
            "callback": ctxt_delRow
        }
    };
    function ctxt_addRow(arg1, arg2, arg3) {
        /* 두번째 파라미터 부터 callbackparam 속성으로 설정한 값을 반환할 수 있습니다. */
        var nRow = datagrid.getRow();
        if (nRow > 0) {
            fn_create(nRow);
        }
    };
    function ctxt_delRow() {
        fn_delete();
    };
    var grid; // 그리드를 담기위한 객체 선언
    var gridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea';
	    SBGridProperties.id = 'datagrid';
	    SBGridProperties.jsonref = 'gridData';
        SBGridProperties.contextmenu = true;
        SBGridProperties.contextmenulist = objMenuList;
        SBGridProperties.tree = {
            col: 0,
            levelref: 'level',
            open: true,
            lock: true,
            checkbox: false,
            checkboxexceptionlevel: [0],
            openlevel: 0,
            checkboxchildrencheck: false,
            iconclickeventignore: true
        };
        SBGridProperties.columns = [
            {caption: ['메뉴목록'], ref: 'menuNm', width: '100%', type: 'output'}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_view');
    }
    //
    function fn_view() {
        var nRow = datagrid.getRow();
        if (nRow < 2) {
            return;
        }
        SBUxMethod.set("gubun", "M");
        //Set Menu Info
        var sysGubun = _.find(jsonSearchCombo, {value: SBUxMethod.get("srchCombo")});
        SBUxMethod.set("sysGb", sysGubun.text);
        SBUxMethod.set("sysCd", sysGubun.value);
        var rowData = datagrid.getRowData(nRow);
        SBUxMethod.set("upMenuId", rowData.upMenuId);
        SBUxMethod.set("upMenuNm", rowData.upMenuNm);
        SBUxMethod.attr("menuId", "readonly", true);
        SBUxMethod.set("menuId", rowData.menuId);
        SBUxMethod.set("apcCd", rowData.apcCd);
        SBUxMethod.set("menuNm", rowData.menuNm);
        SBUxMethod.set("order", rowData.order);
        SBUxMethod.set("pType", rowData.pType);
        SBUxMethod.set("uType", rowData.uType);
    }
    function fn_setGridData(args) {
        var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        gridData = [
            {level: 0, upMenuId: '',        upMenuNm: '',          apcCd: '',       order: 0,  pType: '', uType: '', menuId: 'SYS_MNG', menuNm: '시스템관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc001', order: 1,  pType: '', uType: '', menuId: 'MNG_100', menuNm: '메뉴관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc002', order: 2,  pType: '', uType: '', menuId: 'MNG_200', menuNm: '화면관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc003', order: 3,  pType: '', uType: '', menuId: 'MNG_300', menuNm: '권한관리'},
            {level: 2, upMenuId: 'MNG_300', upMenuNm: '권한관리',   apcCd: 'apc004', order: 4,  pType: '', uType: '', menuId: 'MNG_310', menuNm: '권한그룹관리'},
            {level: 2, upMenuId: 'MNG_300', upMenuNm: '권한관리',   apcCd: 'apc005', order: 5,  pType: '', uType: '', menuId: 'MNG_320', menuNm: '권한별 사용자관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc006', order: 6,  pType: '', uType: '', menuId: 'MNG_400', menuNm: '사용자관리'},
            {level: 2, upMenuId: 'MNG_400', upMenuNm: '사용자관리', apcCd: 'apc007', order: 7,  pType: '', uType: '', menuId: 'MNG_410', menuNm: '사용자관리'},
            {level: 2, upMenuId: 'MNG_400', upMenuNm: '사용자관리', apcCd: 'apc008', order: 8,  pType: '', uType: '', menuId: 'MNG_420', menuNm: '사용자별 권한관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc009', order: 9,  pType: '', uType: '', menuId: 'MNG_500', menuNm: '메시지관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc010', order: 10, pType: '', uType: '', menuId: 'MNG_600', menuNm: '공통코드'},
            {level: 2, upMenuId: 'MNG_600', upMenuNm: '공통코드',   apcCd: 'apc011', order: 11, pType: '', uType: '', menuId: 'MNG_610', menuNm: '공통코드관리'},
            {level: 2, upMenuId: 'MNG_600', upMenuNm: '공통코드',   apcCd: 'apc012', order: 12, pType: '', uType: '', menuId: 'MNG_620', menuNm: '센터별 공통코드관리'},
            {level: 1, upMenuId: 'SYS_MNG', upMenuNm: '시스템관리', apcCd: 'apc013', order: 13, pType: '', uType: '', menuId: 'MNG_700', menuNm: '이력관리'}
        ];
        datagrid.rebuild();
        if (args === "init") {
            //Set Menu Info Init
            SBUxMethod.set("sysGb", "");
            SBUxMethod.set("upMenuId", "");
            SBUxMethod.set("upMenuNm", "");
            SBUxMethod.set("menuId", "");
            SBUxMethod.set("apcCd", "");
            SBUxMethod.set("menuNm", "");
            SBUxMethod.set("order", "");
            SBUxMethod.set("pType", "");
            SBUxMethod.set("uType", "");
        }
    }
</script>
<!-- //inline scripts related to this page -->

</body>
</html>