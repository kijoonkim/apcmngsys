<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../frame/inc/headerMeta.jsp" %>
	<%@ include file="../frame/inc/headerScript.jsp" %>

    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다.
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/
        .sbt-A-wrap {min-width:1024px; margin:0 auto; border:1px solid #333; height:auto}
        .sbt-A-wrap .main {display:table;  width:100%; height:100%;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px;}
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell;}
        .sbux-sidemeu {position: relative; z-index: 1;}
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:0px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }
    </style>
</head>
<body>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	let prvTabMenuId = "";

	//const sysPrgrmId = "main";
	//gfn_setSysPrgrmId(sysPrgrmId);
    //SBUx topmenu 컴포넌트의 json 데이터

    /*
    var menuJson = [
        {"id": "1", "pid": "0", "order": "1", "text": "대메뉴1"},
        {"id": "2", "pid": "0", "order": "2", "text": "시스템"},
        {"id": "mng", "pid": "2", "order": "1", "text": "관리"},
        {"id": "hist", "pid": "2", "order": "2", "text": "이력조회"},
        {"id": "modal", "pid": "2", "order": "3", "text": "모달"},
    ];
    */

	var menuJson = ${topMenuList};

    //SBUx sidemenu 컴포넌트의 json 데이터
    var sideJsonData = [];
    //
    var menuJsonB = [
        {"order": "0", "id": "empty", "pid": "0", "text": ""},
    ];
    //텝메뉴 빈 값 설정
    var tabJsonData = [{
        'id': 'blank'
        , 'pid': '-1'
        , 'text': ''
        , 'targetid': 'blank'
        , 'targetvalue': 'blank_value'
        , 'targetname': 'frmJson'
        , 'contentlink': ''
        , 'cssstyle': 'display:none'
    }];

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    });

    const fn_selectTopMenu = (_id) => {

		var data = SBUxMethod.get(_id);

        var url = data.customData == undefined ? "" : data.customData.url;
        if (url == undefined) {
            return;
        }

        fn_setLeftMenu(data.id);

        /*
        fn_actionGoPage(
            url
            , _target
            , data.id
            , data.text
            , data.pid
        );

       	let title = gfn_isEmpty(data.value) ? data.text : data.value;
        document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = title;
        */
    }

    /**
     * Set LEFT MENU
     * menuNo 값으로 (비동기식으로)서버로 부터 데이터를 요청
     */
    async function fn_setLeftMenu(_menuNo, _menuId) {

        var menuInfo = _.find(menuJson, {id: _menuNo});
        var pMenuId = menuInfo.pid;
        var pMenuNm = menuInfo.value;

        if (gfn_isEmpty(pMenuId)) {
        	pMenuId = _menuNo;
        	pMenuNm = menuInfo.text;
        }

        //const postJsonPromise = gfn_postJSON("/co/menu/leftMenu", {upMenuId: pMenuId});
        const postJsonPromise = gfn_postJSON("/co/authrt/selectSideMenuTreeList.do", {upMenuId: pMenuId}, "main", true);

        const data = await postJsonPromise;

        try {
        	sideJsonData.length = 0;
        	data.resultList.forEach((item, index) => {
				const menu = {
					id: item.menuId,
					pid: item.upMenuId,
					order: item.indctSeq,
					text: item.menuNm,
					url: item.pageUrl
				}
				sideJsonData.push(menu);
			});

            //if (pMenuId !== "0") {
            if (!gfn_isEmpty(menuInfo.pid)) {
                var pIdx = _.findLastIndex(sideJsonData, {id: menuInfo.pid});
                if (pIdx >= 0) {
                	sideJsonData[pIdx].class = "active";
                }
            }

            if (_menuId != undefined) {
            	_menuNo = _menuId;
            }

            var idx = _.findLastIndex(sideJsonData, {id: _menuNo});
            if (idx >= 0) {
            	sideJsonData[idx].class = "active";
            }

            SBUxMethod.refresh("side_menu");
           	if (!gfn_isEmpty(menuInfo.pid)) {
                SBUxMethod.expandSideMenu("side_menu", pMenuId, 1, true);
            }

           	var title = pMenuNm;
            document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = title;

            if (idx >= 0 && _menuId == undefined && !gfn_isEmpty(sideJsonData[idx].url)) {
            	fn_actionGoPage(
            			  sideJsonData[idx].url
	                    , "LEFT"
	                    , sideJsonData[idx].id
	                    , sideJsonData[idx].text
	                    , sideJsonData[idx].pid
	                );
            }
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }

        /*
    	fetch("/co/menu/leftMenu", {
    		  method: "POST",
    		  headers: {
    		    "Content-Type": "application/json",
    		  },
    		  body: JSON.stringify({
    		    upMenuId: pMenuId
    		  }),
    		})
    		.then((response) => response.json())
    		.then(
				(data) => {
					console.log(data);
					sideJsonData = [];
					data.resultList.forEach((item, index) => {
						const menu = {
							id: item.menuId,
							pid: item.upMenuId,
							order: item.indctSeq,
							text: item.menuNm,
							url: item.pageUrl
						}
						sideJsonData.push(menu);
					});
					console.log("sideJsonData", sideJsonData);

		            //if (pMenuId !== "0") {
		            if (!gfn_isEmpty(menuInfo.pid)) {
		                var pIdx = _.findLastIndex(sideJsonData, {id: menuInfo.pid});
		                if (pIdx >= 0) {
		                	sideJsonData[pIdx].class = "active";
		                }
		            }

		            if (_menuId != undefined) {
		            	_menuNo = _menuId;
		            }

		            var idx = _.findLastIndex(sideJsonData, {id: _menuNo});
		            if (idx >= 0) {
		            	sideJsonData[idx].class = "active";
		            }

		            SBUxMethod.refresh("side_menu");
	                //if (pMenuId != undefined && pMenuId !== "0") {
		           	if (!gfn_isEmpty(menuInfo.pid)) {
		                SBUxMethod.expandSideMenu("side_menu", pMenuId, 1, true);
		            }

		           	var title = pMenuNm;
		            document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = title;

		            if (idx >= 0 && _menuId == undefined && !gfn_isEmpty(sideJsonData[idx].url)) {
		            	fn_actionGoPage(
		            			  sideJsonData[idx].url
			                    , "LEFT"
			                    , sideJsonData[idx].id
			                    , sideJsonData[idx].text
			                    , sideJsonData[idx].pid
			                );
		            }
				}
    		);
        */
    }

    //Left Menu Click
    function fn_selectMenu(_target, _id) {

    	var data = SBUxMethod.get(_id);

		if (_target === "TOP" && gfn_isEmpty(data.pid)) {
        //if (_target === "TOP" && data.pid == 0) {
            return;
        }
        var url = data.customData == undefined ? "" : data.customData.url;
        if (url == undefined) {
            return;
        }

        fn_actionGoPage(
            url
            , _target
            , data.id
            , data.text
            , data.pid
        );

        /*
        //[LEFT-MENU] menu-title 변경
        if (_target === "TOP") {
        	let title = gfn_isEmpty(data.value) ? data.text : data.value;
            document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = title;
        } else if (_target === "LEFT") {
        	let title = gfn_isEmpty(data.value) ? data.text : data.value;
            document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = title;
        }
        */
    }

    //화면 이동
    const maxTebMenuCnt = 10;//메뉴탭 최대 허용 개수(10)
    const fn_actionGoPage = function (_url, _menuGubun, _menuNo, _menuNm, _topMenuNo) {
    	if (_menuGubun === "TOP") {
            fn_setLeftMenu(_menuNo);
        } else if (_menuGubun === "LEFT") {
        	//Set 브레드크럼 내비게이션
            fn_setBreadcrumbs(_menuNo, _menuNm);

            //메뉴탭 생성 및 화면 요청
            var tabName = "TAB_" + _menuNo;
            if ( $('#' + tabName).length == 0 ) {
                if (SBUxMethod.getTabsCount('tab_menu') == maxTebMenuCnt+1) {
                    alert("메뉴탭 최대 허용 개수(" + maxTebMenuCnt.toString() + "개)를 초과하였습니다.");
                    return;
                }
                var jsonTabSelect = {
                    'id': tabName
                    , 'pid': '-1'
                    , 'text': _menuNm
                    , 'targetid': tabName
                    , 'targetvalue': tabName + '_value'
                    , 'targetname': 'frmJson'
                    , 'link': '/co/menu/openPage.do/' + _menuNo	// _url
                    , 'closeicon': true
                };
                SBUxMethod.addTab('tab_menu', jsonTabSelect);

                fn_afterAddTab(_menuNo)
            }
            else {
                SBUxMethod.selectTab(tabName);
            }
        }
    }

    /**
     * @param {string} _menuId
     */
	function fn_afterAddTab(_menuId) {

    	prvTabMenuId = _menuId;

    	fetch("/sys/actionNewTab.do", {
  		  	method: "POST",
  		  	headers: {
  		  		"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		sysPrgrmId : _menuId
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					console.log(data);
				}
  		);
    }

     /**
      * @param {string} menuNo
      */
 	function fn_afterSeletTab(_menuId) {

      	prvTabMenuId = _menuId;

     	fetch("/sys/actionOldTab.do", {
  		  	method: "POST",
  		  	headers: {
  		  		"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		sysPrgrmId : _menuId
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					console.log(data);
				}
  		);
	}

    //Set breadcrumbs
    function fn_setBreadcrumbs(menuNo, menuNm) {

    	/*
    	var upMenuNo;
        if (menuNo.indexOf("mng") > -1) {
            upMenuNo = "mng";
            topMenuNo = "2";
        }
        else if (menuNo.indexOf("hist") > -1) {
            upMenuNo = "hist";
            topMenuNo = "2";
        }

        var upMenuInfo = _.find(menuJson, {id: upMenuNo});
        var topMenuInfo = _.find(menuJson, {id: topMenuNo});
        menuJsonB = [
            {"order": "1", "id": "id_1", "pid": "0", "text": "홈"},
            {"order": "2", "id": "id_2", "pid": "0", "text": topMenuInfo.text},
            {"order": "3", "id": "id_3", "pid": "0", "text": upMenuInfo.text},
            {"order": "9", "id": "id_9", "pid": "0", "text": menuNm}
        ];
        */
        menuJsonB.length = 0;
        menuJsonB.push(
			{"order": "10", "id": "id_1", "pid": "", "text": "홈"}
		);

      	//부모메뉴정보
        var menuInfo = _.find(sideJsonData, {id: menuNo});
        var upMenuNo = menuInfo.pid;
        var upMenuInfo = _.find(menuJson, {id: upMenuNo});
        if (!gfn_isEmpty(upMenuInfo.pid)) {
        	var topMenuInfo = _.find(menuJson, {id: upMenuInfo.pid});
        	menuJsonB.push(
        			{"order": "20", "id": topMenuInfo.id, "pid": "", "text": topMenuInfo.text}
        		);
        }
       	menuJsonB.push(
       			{"order": "30", "id": upMenuInfo.id, "pid": upMenuInfo.pid, "text": upMenuInfo.text}
       		);

        menuJsonB.push(
        		{"order": "40", "id": menuNo, "pid": upMenuNo, "text": menuNm}
   		);

        /*
        if (menuInfo != undefined) {
            var pMenuNo = menuInfo.pid;
            var pMenuInfo = _.find(sideJsonData, {id: pMenuNo});
            if (pMenuInfo != undefined) {
                menuJsonB.splice(menuJsonB.length-1, 0,
                    {"order": "4", "id": "id_4", "pid": "0", "text": pMenuInfo.text}
                );
            }
        }
        */
        SBUxMethod.refresh('breadcrumb');
    }

    //선택한 탭메뉴의 정보를 가져와 메뉴정보 설정
    function fn_setMenuInfo(args) {

    	var idx = _.findLastIndex(tabJsonData, {text: args});
        var tabObj = tabJsonData[idx];
        var tabId = tabObj.targetid;
        var menuId = tabId.substring(tabId.indexOf("_")+1);

        var menuInfo = _.find(sideJsonData, {id: menuId});
        var upMenuNo = menuInfo.pid;
        var upMenuInfo = _.find(menuJson, {id: upMenuNo});
        var topMenuNo = upMenuInfo.pid;
        if (gfn_isEmpty(topMenuNo)) {
        	topMenuNo = upMenuNo;
        }

        //LEFT MENU
        if($('#idxSide_menu')[0].style.width != '0px'){
	        fn_setLeftMenu(topMenuNo, menuId); // 2023-07-26 추가
        }

        fn_setBreadcrumbs(menuId, tabObj.text);

        if (sysPrgrmId !== menuId) {
        	fn_afterSeletTab(menuId);
        }

        //[LEFT-MENU] menu-title 변경
        /*
        var data = _.find(menuJson, {id: topMenuNo});
        console.log("menuinfo data", data);
        document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = data.text;
        */
    }

    /**
     * Set LEFT MENU
     * menuNo 값으로 (비동기식으로)서버로 부터 데이터를 요청
     */
	/*
    function fn_setLeftMenu(menuNo, menuId) {
        if (menuNo === "AM_001") {
            sideJsonData = [
                {"id": "mng_1", "pid":"0", "order":"1", "text":"메뉴관리", "url":"/co/menu/menuMng.do", "topMenuNm": "aa"},
                {"id": "mng_2", "pid":"0", "order":"2", "text":"화면관리", "url":"./mng/pageMng.html"},
                {"id": "mng_3", "pid":"0", "order":"3", "text":"권한관리"},
                {"id": "mng_3_1", "pid":"mng_3", "order":"1", "text":"권한그룹관리", "url":"./mng/authMng.html"},
                {"id": "mng_3_2", "pid":"mng_3", "order":"2", "text":"권한사용자관리", "url":"./mng/authUserMng.html"},
                {"id": "mng_4", "pid":"0", "order":"4", "text":"메시지관리", "url":"./mng/messageMng.html"},
                {"id": "mng_5", "pid":"0", "order":"5", "text":"공통코드관리", "url":"./mng/codeMng.html"}
            ];
        }
        else if (menuNo === "hist") {
            sideJsonData = [
                {"id": "hist_1", "pid":"0", "order":"11", "text":"접속이력관리", "url":"./hist/connectHistoryList.html"},
                {"id": "hist_2", "pid":"0", "order":"12", "text":"화면열람이력관리", "url":"./hist/readingHistoryList.html"},
                {"id": "hist_3", "pid":"0", "order":"13", "text":"송수신이력관리", "url":"./hist/reqResHistoryList.html"},
                {"id": "hist_4", "pid":"0", "order":"14", "text":"배치실행이력관리", "url":"./hist/batchHistoryList.html"}
            ];
        }
        else if (menuNo === "modal") {
            SBUxMethod.openModal("jsModal");
            //Set Grid
            fn_createGrid();
            fn_createGrid2();
            fn_createGrid_1();
            fn_createGrid_2();
            fn_createGrid_3();
            return;
        }
        var menuInfo = _.find(sideJsonData, {id: menuId});
        var pMenuId;
        if (menuId != undefined) {
            pMenuId = menuInfo.pid;
            if (pMenuId !== "0") {
                var pIdx = _.findLastIndex(sideJsonData, {id: menuInfo.pid});
                sideJsonData[pIdx].class = "active";
            }
            var idx = _.findLastIndex(sideJsonData, {id: menuId});
            sideJsonData[idx].class = "active";
        }
		SBUxMethod.refresh("side_menu");
        if (pMenuId != undefined && pMenuId !== "0") {
            SBUxMethod.expandSideMenu("side_menu", pMenuId, 1, true);
        }
    }
    */

    //ifrmae 높이 자동 설정
    function fn_resizeFrame(that){
        let iframe_height = that.contentWindow.document.body.scrollHeight + 17;
        $(that).height(iframe_height);
    }

    function fn_SlideButton(type,b){
        if(type == "show"){
            $(".sbt-A-wrap .left").css({width:0});
        }else{
             $(".sbt-A-wrap .left").css({width:200});
        }
    }

    //메뉴탭을 모두 닫으면 업무 영역 숨김 처리
    function fn_chkTabList() {
        if (SBUxMethod.getTabsCount('tab_menu') == 1) {
            $('.tab-content').hide();
            //side menu init
		    //document.querySelector('.sbux-sidemeu-title-wrap>div>span').innerHTML = "메뉴";
		    //sideJsonData = [];
		    //SBUxMethod.refresh("side_menu");
            //breadCrumbs init
            //menuJsonB = [];
            menuJsonB.length = 0;
            menuJsonB.push(
    			{"order": "10", "id": "id_1", "pid": "", "text": "홈"}
    		);
            SBUxMethod.refresh('breadcrumb');

            fn_afterSeletTab("main");
	    }
        else {
            fn_setMenuInfo(SBUxMethod.get('tab_menu'));
	    }
    }
    //================== Modal ==================//
    //목록 조회
    function fn_search() {
        fn_setGridData();
        //Grid Init
        gridData2 = [];
        datagrid2.refresh();
        gridData_1 = [], gridData_2 = [], gridData_3 = [];
        datagrid_1.refresh();
        datagrid_2.refresh();
        datagrid_3.refresh();
        //Button disabled
        SBUxMethod.attr('btn_add_1', 'disabled', true);
        SBUxMethod.attr('btn_add_2', 'disabled', true);
        SBUxMethod.attr('btn_add_3', 'disabled', true);
    }
    //등록
    function fn_save() {
        var data = datagrid2.getGridDataAll();
        if (data.length == 0) {
            alert("등록 할 데이터가 없습니다.");
            return;
        }
        console.log("data ::::: " + JSON.stringify(data));
    }
    //닫기
    function fn_close() {
        gridData = [];
        gridData2 = [];
		SBUxMethod.closeModal('jsModal');
    }
    //그리드 선택
    function fn_selectRow(nRow) {
        var rowData2 = datagrid2.getRowData(nRow);
        var sText = rowData2.field2;
        document.getElementById("select_text").innerHTML = "[" + sText + "]";
        //Set Grid Data
        fn_setGridData_1(rowData2);
        fn_setGridData_2(rowData2);
        fn_setGridData_3(rowData2);
        //Button enabled
        SBUxMethod.attr('btn_add_1', 'disabled', false);
        SBUxMethod.attr('btn_add_2', 'disabled', false);
        SBUxMethod.attr('btn_add_3', 'disabled', false);
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
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center'},
            {caption: ["명칭"], ref: 'field2',  type:'output',  width:'55%',    style:'text-align:left'},
            {caption: ["선택"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow(\"ADD\", " + nRow + ")'>선택</button>";
                }
            }
        ];
        datagrid = _SBGrid.create(SBGridProperties);
    }
    function fn_setGridData(args) {
        var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        gridData = [
            {'field1': 'code001', 'field2': '명칭001'},
            {'field1': 'code002', 'field2': '명칭002'},
            {'field1': 'code003', 'field2': '명칭003'},
            {'field1': 'code004', 'field2': '명칭004'},
            {'field1': 'code005', 'field2': '명칭005'}
        ];
        datagrid.refresh();
    }
    //
    function fn_procRow(gubun, nRow) {
        if (gubun === "ADD") {
            var rowData = datagrid.getRowData(nRow);
            datagrid2.addRow(true, rowData);
            datagrid.deleteRow(nRow);
        }
        else if (gubun === "DEL") {
            var rowData = datagrid2.getRowData(nRow);
            datagrid.addRow(true, rowData);
            datagrid2.deleteRow(nRow);
        }
    }
    function fn_procRow2(gubun, grid, nRow) {
        if (gubun === "ADD") {
            if (grid === "grid_1") {
                datagrid_1.addRow(true);
            }
            else if (grid === "grid_2") {
                datagrid_2.addRow(true);
            }
            else if (grid === "grid_3") {
                datagrid_3.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grid_1") {
                datagrid_1.deleteRow(nRow);
            }
            else if (grid === "grid_2") {
                datagrid_2.deleteRow(nRow);
            }
            else if (grid === "grid_3") {
                datagrid_3.deleteRow(nRow);
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
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"],     ref: 'field1',  type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["명칭"],     ref: 'field2',  type:'output',  width:'25%',    style:'text-align:left',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return '<a href="javascript:void(0);" onClick="fn_selectRow(' + nRow + ');">' + strValue + '</a>';
                }
            },
            {caption: ["품종등록"], ref: 'field3',  type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["등급등록"], ref: 'field4',  type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["규격등록"], ref: 'field5',  type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["처리"],     ref: 'empty',   type:'output',  width:'10%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
    }
    //sub grid 초기화
    var grid_1, grid_2, grid_3; // 그리드를 담기위한 객체 선언
    var gridData_1 = [], gridData_2 = [], gridData_3 = []; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid_1() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea_1';
	    SBGridProperties.id = 'datagrid_1';
	    SBGridProperties.jsonref = 'gridData_1';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["명칭"], ref: 'field2',  type:'input',   width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_1\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_1 = _SBGrid.create(SBGridProperties);
    }
    function fn_createGrid_2() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea_2';
	    SBGridProperties.id = 'datagrid_2';
	    SBGridProperties.jsonref = 'gridData_2';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["명칭"], ref: 'field2',  type:'input',  width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_2\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_2 = _SBGrid.create(SBGridProperties);
    }
    function fn_createGrid_3() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'SBGridArea_3';
	    SBGridProperties.id = 'datagrid_3';
	    SBGridProperties.jsonref = 'gridData_3';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["명칭"], ref: 'field2',  type:'input',  width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_3\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_3 = _SBGrid.create(SBGridProperties);
    }
    //Set Grid Data
    function fn_setGridData_1(obj) {
        console.log("obj ::::: " + obj);
        //var params = $('#frm').serialize();
        //console.log("form data ::::: " + params);
        gridData_1 = [
            {'field1': 'code001', 'field2': '품종명칭001'},
            {'field1': 'code002', 'field2': '품종명칭002'}
        ];
        datagrid_1.refresh();
    }
    function fn_setGridData_2(obj) {
        var params = JSON.stringify(obj);
        console.log("data ::::: " + params);
        gridData_2 = [
            {'field1': 'code001', 'field2': '등급명001'}
        ];
        datagrid_2.refresh();
    }
    function fn_setGridData_3(obj) {
        var params = JSON.stringify(obj);
        console.log("data ::::: " + params);
        gridData_3 = [];
        datagrid_3.refresh();
    }
    
</script>
<!-- //inline scripts related to this page -->
    <div class="sbt-A-wrap">
        <!-- header (menu) -->
        <div class="sbt-all-header">
            <sbux-menu id="idxTop_json" name="top_menu" uitype="normal"
                jsondata-ref="menuJson"
                is-fixed="false"
                wrap-style="width:100%"
                storage-data="object"
                onclick="fn_selectTopMenu('top_menu')">
                <brand-item text="APC정보지원" image-src="/resource/images/header_logo.png">
                </brand-item>
            </sbux-menu>
			<div class="user-info-wrap">
				<c:if test="${loginVO != null && loginVO.id != null}">
					<span class="name-t">${loginVO.name}</span>님 반갑습니다.
                <ul class="user-login-menu">
                    <li><a href="/actionLogout.do">로그아웃</a></li>
                </ul>
                </c:if>
            </div>
        </div>
        <div class="main">
            <!--left (sidemenu) -->
            <div class="left">
                <div class="sbt-all-left">
                    <sbux-sidemenu id="idxSide_menu" name="side_menu" uitype="normal"
                        jsondata-ref="sideJsonData"
                        show-filter-box="true"
                        show-slide-button="true"
                        menu-title="메뉴"
                        storage-data="object"
                        is-expand-only-select="true"
                        callback-slide-button="fn_SlideButton"
                        onclick="fn_selectMenu('LEFT', 'side_menu')"
                    ></sbux-sidemenu>
                </div>
            </div>
            <!--main content-->
            <div class="content">
                <sbux-breadcrumb id="breadcrumb" name="breadcrumb" uitype="text" jsondata-ref="menuJsonB">
                </sbux-breadcrumb>
                <!--full content-->
                <div class="sbt-wrap-full">
                    <!--탭 입력 영역-->
                    <div class="sbt-input-tab">
                        <!--탭 영역-->
                        <sbux-tabs id="tab_menu" name="tab_menu" uitype="normal"
                            jsondata-ref="tabJsonData"
                            storage-data="text"
                            onclick="fn_setMenuInfo(tab_menu)"
                            callback-after-close="fn_chkTabList"
                        ></sbux-tabs>
                        <div class="tab-content">
                            <iframe id="idxfrmJson" name="frmJson" onload="fn_resizeFrame(this);"
                                style="overflow-x:hidden;overflow:auto;width:100%;min-height:650px;border:0px;"
                            ></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div>
        <sbux-modal id="jsModal" name="jsModal" uitype="middle"
            header-title="Modal TITLE"
            body-html-id="modalBody"
            footer-is-close-button="false"
            style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="modalBody">
        <div class="main">
            <!--main content-->
            <div class="content">
                <!--full content-->
                <div class="sbt-wrap-full">
                    <!--Button 영역-->
                    <div class="sbt-search-button" style="text-align:right;">
                        <sbux-button id="btn_search" name="btn_search" uitype="normal" text="조회" wrap-class="sbt-btn-search"
                            onclick="fn_search"
                        ></sbux-button>
                        <sbux-button id="btn_save" name="btn_save" uitype="normal" text="등록" wrap-class="sbt-btn-reset"
                            onclick="fn_save"
                        ></sbux-button>
                        <sbux-button id="btn_close" name="btn_close" uitype="normal" text="종료" wrap-class="sbt-btn-reset"
                            onclick="fn_close"
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
                                                <sbux-label id="srchLabel_1" name="label_norm" uitype="normal" text="품목명" wrap-class="sbt-label"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-input id="srchKeyword" name="srchKeyword" uitype="text"
                                                    style="width:200px"
                                                ></sbux-input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                    <!--SBGrid 영역-->
                    <div class="sbt-con-wrap">
                        <li style="display:inline-block;width: 39.5%;vertical-align:top;">
                        <div class="sbt-grid-wrap">
                            <div class="sbt-wrap-body">
                                <div class="sbt-grid">
                                    <!-- SBGrid를 호출합니다. -->
                                    <div id="SBGridArea" style="height:150px;"></div>
                                </div>
                            </div>
                        </div>
                        </li>
                        <li style="display:inline-block;float:right;width: 59.5%;vertical-align:top;">
                            <div class="sbt-grid-wrap">
                                <div class="sbt-wrap-body">
                                    <div class="sbt-grid">
                                        <!-- SBGrid를 호출합니다. -->
                                        <div id="SBGridArea2" style="height:150px;"></div>
                                    </div>
                                </div>
                            </div>
                            </li>
                    </div>
                </div>
                <div class="sbt-con-wrap">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>품목명<span id="select_text"></span></h3>
                        </div>
                        <li style="display:inline-block;float:left;width: 33%;vertical-align:top;">
                            <div class="sbt-wrap-body">
                                <div>
                                    <span>품종등록</span>
                                    <sbux-button id="btn_add_1" name="btn_add_1" uitype="normal" text="추가"
                                        button-size="small"
                                        onclick="fn_procRow2('ADD', 'grid_1')"
                                        disabled
                                    ></sbux-button>
                                </div>
                                <div class="sbt-grid">
                                    <div id="SBGridArea_1" style="height:150px;"></div>
                                </div>
                            </div>
                        </li>
                        <li style="display:inline-block;width: 33.3%;vertical-align:top;">
                            <div class="sbt-wrap-body">
                                <div>
                                    <span>등급등록</span>
                                    <sbux-button id="btn_add_2" name="btn_add_2" uitype="normal" text="추가"
                                        button-size="small"
                                        onclick="fn_procRow2('ADD', 'grid_2')"
                                        disabled
                                    ></sbux-button>
                                </div>
                                <div class="sbt-grid">
                                    <div id="SBGridArea_2" style="height:150px;"></div>
                                </div>
                            </div>
                        </li>
                        <li style="display:inline-block;float:right;width: 33.3%;vertical-align:top;">
                            <div class="sbt-wrap-body">
                                <div>
                                    <span>규격등록</span>
                                    <sbux-button id="btn_add_3" name="btn_add_3" uitype="normal" text="추가"
                                        button-size="small"
                                        onclick="fn_procRow2('ADD', 'grid_3')"
                                        disabled
                                    ></sbux-button>
                                </div>
                                <div class="sbt-grid">
                                    <div id="SBGridArea_3" style="height:150px;"></div>
                                </div>
                            </div>
                        </li>
                    </div>
            </div>
        </div>
    </div>
	
</body>
</html>