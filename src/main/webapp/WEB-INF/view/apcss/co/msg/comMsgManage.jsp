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
                        <sbux-button id="btn_create" name="btn_create" uitype="normal" wrap-class="sbt-btn-reset" text="신규" onclick="fn_create"></sbux-button>
                        <sbux-button id="btn_delete" name="btn_delete" uitype="normal" wrap-class="sbt-btn-reset" text="삭제" onclick="fn_delete"></sbux-button>
                        <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset" text="저장" onclick="fn_save"></sbux-button>
                        <sbux-button id="btn_search" name="btn_search" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_search"></sbux-button>
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
                                                <sbux-label id="srchLabel_1" name="label_norm" uitype="normal" text="검색조건"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="srchCondition" name="srchCondition" uitype="single" jsondata-ref="jsonSearchCondCombo" unselected-text="전체" style="width:120px;"></sbux-select>&nbsp;
                                                <sbux-input id="srchKeyword" name="srchKeyword" uitype="text" style="width:200px" placeholder="검색어 입력" ></sbux-input>
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
                    <li style="display:inline-block;float:left;width: 49.5%;vertical-align:top;">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>메시지목록 <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span></h3>
                        </div>
                        <div class="sbt-wrap-body">
                            <div class="sbt-grid">
                                <!-- SBGrid를 호출합니다. -->
                                <div id="SBGridArea" style="height:340px;"></div>
                            </div>
                        </div>
                    </div>
                    </li>
                    <li style="display:inline-block;float:right;width: 49.5%;vertical-align:top;">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>메시지상세정보</h3>
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
                                    <th>메시지KEY</th>
                                    <td colspan="3">
                                        <sbux-input id="msgKey" name="msgKey" uitype="text" required style="width:100%" readonly ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>메시지내용</th>
                                    <td colspan="3">
                                        <sbux-input id="msgCont" name="msgCont" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>비고</th>
                                    <td colspan="3">
                                        <sbux-textarea id="bigo" name="bigo" uitype="normal" contenteditable="true" is-content-html="true" rows="2" cols="85" auto-resize="true" maxlength="1000"></sbux-textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록자ID</th>
                                    <td>
                                        <sbux-input id="creUserId" name="creUserId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>최초변경자ID</th>
                                    <td>
                                        <sbux-input id="updUserId" name="updUserId" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>최초등록일시</th>
                                    <td>
                                        <sbux-input id="creDateTime" name="creDateTime" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>최초변경일시</th>
                                    <td>
                                        <sbux-input id="updDateTime" name="updDateTime" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th>등록프로그램</th>
                                    <td>
                                        <sbux-input id="creProgram" name="creProgram" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th>변경프로그램</th>
                                    <td>
                                        <sbux-input id="updProgram" name="updProgram" uitype="text"	style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                            </form>
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
        fn_search();
    });
    //조회조건
    var jsonSearchCondCombo = [
        {'text': '메세지Key', 'value': 'msgKey'},
        {'text': '메세지내용', 'value': 'msgCont'}
    ];
    //신규 작성
    function fn_create() {
        SBUxMethod.set("gubun", "C");
        SBUxMethod.attr("msgKey", "readonly", false);
        SBUxMethod.set("msgKey", "");
        SBUxMethod.set("msgCont", "");
        SBUxMethod.set("bigo", "");
        SBUxMethod.set("creUserId", "");
        SBUxMethod.set("creDateTime", "");
        SBUxMethod.set("updUserId", "");
        SBUxMethod.set("updDateTime", "");
        SBUxMethod.set("creProgram", "");
        SBUxMethod.set("updProgram", "");
    }
    //선택 삭제
    function fn_delete() {
        var delList = new Array();
        var gridList = datagrid.getGridDataAll();
        for (var i=0; i<gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].msgKey);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg;
        if (delList.length == 1) {
            delMsg = delList[0];
        }
        else {
            delMsg = delList.length + "건";
        }
        delMsg += "을 삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delKey=" + delList.join(",");
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
            if (!SBUxMethod.get("msgKey")) {
                alert("메시지Key를 입력하세요.");
                return;
            }
            if (!SBUxMethod.get("msgCont")) {
                alert("메시지내용을 입력하세요.");
                return;
            }
            saveMsg = "저장 하시겠습니까?";
        }
        else if (gubun === "M") {//수정
            saveMsg = "수정 하시겠습니까?";
        }
        if (confirm(saveMsg)) {
            var params = $('#frm1').serialize();
        }
    }
    //목록 조회
    function fn_search() {
        //검색조건 확인 - 검색조건 선택시 키워드는 필수 입력을 해야 하는 경우
        var srchCondition = SBUxMethod.get("srchCondition");
        var srchKeyword = SBUxMethod.get("srchKeyword");
        if (srchCondition != null) {
            if (!srchKeyword) {
                alert("검색조건을 입력하세요.");
                return;
            }
        }
        //
        fn_setGridData("init");
    }
    //상세정보 보기
    function fn_view() {
        var nCol = datagrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 2) {
            return;
        }
        var nRow = datagrid.getRow();
		if (nRow < 1) {
            return;
		}
        SBUxMethod.set("gubun", "M");
        var rowData = datagrid.getRowData(nRow);
        SBUxMethod.set("msgKey", rowData.msgKey);
        SBUxMethod.set("msgCont", rowData.msgCont);
        SBUxMethod.set("bigo", rowData.bigo);
        SBUxMethod.set("creUserId", rowData.creUserId);
        SBUxMethod.set("creDateTime", rowData.creDateTime);
        SBUxMethod.set("updUserId", rowData.updUserId);
        SBUxMethod.set("updDateTime", rowData.updDateTime);
        SBUxMethod.set("creProgram", rowData.creProgram);
        SBUxMethod.set("updProgram", rowData.updProgram);
    }
    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = datagrid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
            datagrid.setCellData(i+1, 1, checkedYn, true, false);
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
			type: 'page'
			, count: 10
			, size: 10
			, showgoalpageui: true
	    };
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["메시지Key"],    ref: 'msgKey',      type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["메시지내용"],   ref: 'msgCont',     type:'output',  width:'50%',    style:'text-align:left'},
            {caption: ["메시지종류"],   ref: 'msgType',     type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["비고"],         ref: 'bigo',        type:'output',  hidden: true},
            {caption: ["최초등록자ID"], ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"], ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"], ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"], ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}
        ];
        datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind('click', 'fn_view');
    }
    function fn_setGridData(args) {
        var params = $('#frm').serialize();
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
            {'msgKey': 'MSG0001', 'msgCont': '메세지내용1', 'msgType': '', 'bigo': '메세지1_비고', 'creUserId': 'test001', 'creDateTime': '', 'updUserId': '', 'updDateTime': '', 'creProgram' : '', 'updProgram' : ''},
            {'msgKey': 'MSG0002', 'msgCont': '메세지내용2', 'msgType': '', 'bigo': '메세지2_비고', 'creUserId': 'test001', 'creDateTime': '', 'updUserId': '', 'updDateTime': '', 'creProgram' : '', 'updProgram' : ''},
            {'msgKey': 'MSG0003', 'msgCont': '메세지내용3', 'msgType': '', 'bigo': '메세지3_비고', 'creUserId': 'test001', 'creDateTime': '', 'updUserId': '', 'updDateTime': '', 'creProgram' : '', 'updProgram' : ''},
            {'msgKey': 'MSG0004', 'msgCont': '메세지내용4', 'msgType': '', 'bigo': '메세지4_비고', 'creUserId': 'test001', 'creDateTime': '', 'updUserId': '', 'updDateTime': '', 'creProgram' : '', 'updProgram' : ''}
        ];
        datagrid.setPageTotalCount(gridData.length);
        $('#listCount').html(gridData.length);
        if (args === "init") {
            datagrid.rebuild();
        }
    }
</script>
</body>
</html>