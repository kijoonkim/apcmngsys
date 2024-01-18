<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>메인</title>
	<%@ include file="../frame/inc/headerMeta.jsp" %>
	<%@ include file="../frame/inc/headerScript.jsp" %>

    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다.
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/
        html, body {
        	height:100%;
        }
        .sbt-A-wrap {min-width:1024px; margin:0 auto; border:1px solid #333; height:auto;}
        .sbt-A-wrap .main {display:table;  width:100%; height:100%;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px; height:90vh;}
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell; height: 90vh;}
        .sbux-sidemeu {position: relative; z-index: 1;}
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:0px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }
    </style>
</head>
<body id="mainBody" oncontextmenu="return false">
<!-- inline scripts related to this page -->
<script type="text/javascript">

	let prvTabMenuId = "";

	var firstLoad = 0;
    var secondLaod = 0;

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
    //window.addEventListener('DOMContentLoaded', function(e) {
    	//let bodyHeight = document.body.scrollHeight;
    	//let topHeight = $(".sbt-all-header").height();
        //$(".sbt-A-wrap").height(bodyHeight - topHeight - 5);
    //});

    const fn_selectTopMenu = async (_id) => {

		var data = SBUxMethod.get(_id);

        var url = data.customData == undefined ? "" : data.customData.url;
        if (url == undefined) {
            return;
        }

        fn_setLeftMenu(data.id);

        var noticeTab = SBUxMethod.getTab('tab_menu', 'TAB_PD_009');

    	if(noticeTab == null || noticeTab == undefined){

    		var tabName = "TAB_PD_009";
            var menuNo = "PD_009";
            var jsonTabSelect = {
                  'id': tabName
                , 'pid': '-1'
                , 'text': '공지사항'	//'대시보드'
                , 'targetid': tabName
                , 'targetvalue': tabName + '_value'
                , 'targetname': 'frmJson'
                , 'link': '/co/menu/openPage.do/' + menuNo	// _url
                , 'closeicon': false
            };
            SBUxMethod.addTab('tab_menu', jsonTabSelect);
            //화면이력관리용 data
            var data = {
            		customData : {prsnaYn : null},
            		id : tabName,
            		text : "공지사항",
            		prslType: "M1"
            }
            insertComLog(data);

            await fn_afterAddTab(menuNo);
    	}else{
    		if(data.id == "PD" || data.id == "FM"){
           		SBUxMethod.showTab('tab_menu','TAB_PD_009');
            }else{
            	SBUxMethod.hideTab('tab_menu','TAB_PD_009');
            }
    	}

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
        //var pMenuId = menuInfo.pid;
       // var pMenuNm = menuInfo.value;
//         var pMenuId = "PD";
//         var pMenuNm = "산지유통평가등록";



        if(firstLoad == 0){
        	 var pMenuId = "PD";
             var pMenuNm = "생산유통통합조직등록";
            firstLoad = firstLoad +1;
          }else{
       	 var pMenuId = menuInfo.pid;
            var pMenuNm = menuInfo.value;
          }


        if (gfn_isEmpty(pMenuId)) {
        	pMenuId = _menuNo;
        	pMenuNm = menuInfo.text;
        }

//         alert(pMenuId);
//         alert(pMenuNm);
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
	async function fn_afterAddTab(_menuId) {

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
        			{"order": "20", "id": topMenuInfo.id, "pid": "", "text": topMenuInfo.text, "url": topMenuInfo.url}
        		);
        }
       	menuJsonB.push(
       			{"order": "30", "id": upMenuInfo.id, "pid": upMenuInfo.pid, "text": upMenuInfo.text, "url": upMenuInfo.url}
       		);

        menuJsonB.push(
        		{"order": "40", "id": menuNo, "pid": upMenuNo, "text": menuNm, "url": menuInfo.url}
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
        let iframe_height = that.contentWindow.document.body.scrollHeight + 17;	// +17
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
					<c:set scope="request" var="userName" value="${loginVO.name}"></c:set>
					<span class="name-t"><c:out value='${userName}'></c:out></span>님 반갑습니다.
                <ul class="user-login-menu">
					<li style="background-color:#149FFF;"><sbux-button id="btnPrfrmImprvDmnd" name="btnPrfrmImprvDmnd" uitype="normal" text="개선요청" style="width:64px; text-align:center; display:inline-block; font-size:12px;" onclick="fn_modalPopup"></sbux-button></li>
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
                <sbux-breadcrumb
                	id="breadcrumb"
                	name="breadcrumb"
                	uitype="text"
                	jsondata-ref="menuJsonB"
                	show-tooltip="true"
                	tooltip-key="url"
                ></sbux-breadcrumb>
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
                            <iframe id="idxfrmJson" name="frmJson"
                                style="overflow-x:hidden;overflow:auto;width:100%;min-height:780px;border:0px;"
                                scrolling="auto"
                            ></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- 출하매출단가 등록 Modal -->
    <div>
        <sbux-modal id="modal-prfrmImprvDmnd" name="modal-prfrmImprvDmnd" uitype="middle" header-title="프로그램 개선요청" body-html-id="body-modal-prfrmImprvDmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prfrmImprvDmnd">
    	<jsp:include page="../apcss/co/dmnd/prfrmImprvDmndPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	//only document
	window.addEventListener('DOMContentLoaded', function(e) {
		initMain();
	});
	const fn_modalPopup = async function() {

		var userId =  '${loginVO.userId}';
		var userNm	= '${loginVO.name}';
		if(menuJsonB[0].id != "empty"){
			var menuNm = "";
			var menuId = "";
			if(menuJsonB.length == 3){
				menuNm = menuJsonB[2].text;
				menuId = menuJsonB[2].pid;
			}else{

				menuNm = menuJsonB[3].text;
				menuId = menuJsonB[3].pid;
			}

			prfrmImprvDmnd.init(gv_apcCd, gv_apcNm, userId, userNm, menuId, menuNm);
			SBUxMethod.openModal('modal-prfrmImprvDmnd');
		}else{
			gfn_comAlert("W0001", "프로그램");		//	W0001	{0}을/를 선택하세요.
		}


	}

	const initMain = async function() {
		var tabName = "TAB_CO_014";
		var menuNo = "CO_014";
		var jsonTabSelect = {
                'id': tabName
                , 'pid': '-1'
                , 'text': '🏠'	//'대시보드'
                , 'targetid': tabName
                , 'targetvalue': tabName + '_value'
                , 'targetname': 'frmJson'
                , 'link': '/co/menu/openPage.do/' + menuNo	// _url
                , 'closeicon': false
            };
        SBUxMethod.addTab('tab_menu', jsonTabSelect);

		await fn_afterAddTab(menuNo);
		fn_setLeftMenu(menuJson[0].id, menuJson[0].text);
	}

</script>
</html>