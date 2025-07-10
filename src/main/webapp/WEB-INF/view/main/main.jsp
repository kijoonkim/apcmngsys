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
	<title>메인</title>

    <c:set scope="request" var="serverType" value="${serverType}"></c:set>
    <c:choose>
        <c:when test="${serverType eq 'prd'}">
            <!-- Google tag (gtag.js) 36 APC정보지원시스템 2024.4. UA connected-->
            <script async src="https://www.googletagmanager.com/gtag/js?id=G-L64PQ48CK5"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());
              gtag('config', 'G-L64PQ48CK5');
              gtag('config', 'G-1C6GSRP5Z8', {'content_group': 'APC정보지원시스템'});
            </script>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>



    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다.
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/
        html, body {
            height:100%;
            padding: 0;
            margin: 0;
            overflow-x: hidden;
            width : 100%;
            overscroll-behavior: none;
        }
        #mainBody > div.sbt-A-wrap > div.main > div.content > div.row{
            margin : 0 !important;
        }
        .sbt-A-wrap {min-width:612px; margin:0 auto; height:100vh; overflow: scroll; -ms-overflow-style: none; scrollbar-width: none;}
        .sbt-A-wrap ::-webkit-scrollbar {display: none;}
        .sbt-A-wrap .main {display:table;  width:100%;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px; height:90vh;}
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell; height: 90vh;}
        .sbux-sidemeu {position: relative; z-index: 1; height: 100%;}
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:0px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }


.button {
    color: #4d4f51;
    padding: 5px 0px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 5px 3px;
    transition-duration: 0.15s;
    cursor: pointer;
    border-radius: 3px;
    width: 84px;
    /* box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.55); */
    background-color: #ffffff;
    border: 1px solid #4d4f51;
}
.button:hover{
    color: white;
    border: 1px solid #149FFF;
    background-color: #149FFF;
}
.button:disabled {
  background: #CCC;
  border: 1px solid #CCC;
  pointer-events: none;
}
.button_1{
    background-color : #2193b0;
}
.button_2{
    background-color : #6dd5ed;
}
.button_3{
    background-color : #4F86C6;
}
.button_4{
    background-color : #548687;
}

.button_5{
    background-color : #3d855b;
}
.button_6{
    background-color : #8FBC94;
}
.button_7{
    background-color : #C5E99B;
}

.header-hide {
    position: fixed!important;
    top: 0; left: 0; right: 0;
    transform: translateY(-100%);   /* 화면 위로 가려두기 */
    transition: transform 0.3s ease;
    z-index: 1000;                   /* 다른 요소 위로 */
}
.header-hide.visible{
    transform: translateY(0);
}



/*.button-green {*/
/*  background-color: #04AA6D;*/
/*  color: white;*/
/*  border: 1px solid #04AA6D;*/
/*}*/

/*.button-green:hover {*/
/*  background-color: white;*/
/*  color: black;*/
/*}*/

/*.button-blue {*/
/*  background-color: #008CBA;*/
/*  color: white;*/
/*  border: 1px solid #008CBA;*/
/*}*/

/*.button-blue:hover {*/
/*  background-color: white;*/
/*  color: black;*/
/*}*/

/*.button-red {*/
/*  background-color: #f44336;*/
/*  color: white;*/
/*  border: 1px solid #f44336;*/
/*}*/

/*.button-red:hover {*/
/*  background-color: white;*/
/*  color: black;*/
/*}*/

/*.button-gray {*/
/*  background-color: #e7e7e7;*/
/*  color: black;*/
/*  border: 1px solid #e7e7e7;*/
/*}*/

/*.button-gray:hover {*/
/*  background-color: white;*/
/*  color: black;*/
/*}*/

/*.button-black {*/
/*  background-color: #555555;*/
/*  color: white;*/
/*  border: 1px solid #555555;*/
/*}*/

/*.button-black:hover {*/
/*  background-color: white;*/
/*  color: black;*/
/*}*/

/*.button-brown{*/
/*    background-color: #6b3111;*/
/*    color: white;*/
/*    border: 1px solid #6b3111;*/
/*}*/

/*.button-brown:hover {*/
/*    background-color: white;*/
/*    color: black;*/
/*}*/
/*.button-goldenBrown{*/
/*    background-color: #bd8e1e;*/
/*    color: white;*/
/*    border: 1px solid #bd8e1e;*/
/*}*/
/*.button-goldenBrown:hover{*/
/*    background-color: white;*/
/*    color: black;*/
/*}*/
/*#idxSide_menu > div.sbux-vscroll-wrap{*/
/*    height: 100% !important;*/
/*}*/
/*#idxSide_menu > div.sbux-vscroll-wrap > div.sbux-sidemeu.sbux-sidemeu-split.slideline{*/
/*    height: 100% !important;*/
/*}*/

/*div.sbux-sidemeu.sbux-sidemeu-split.slideline > div.sbux-sidemeu-title-wrap {*/
/*    position: sticky;*/
/*    top: 0;*/
/*    z-index: 999;*/
/*    background: white;*/
/*}*/

/*div.sbux-sidemeu.sbux-sidemeu-split.slideline > div.sbux-sidemeu-filter-wrap {*/
/*    position: sticky;*/
/*    top: 61px;*/
/*    z-index: 999;*/
/*    background: white;*/
/*}*/




/**
 * notics popup
 */
/*.layerPopup img{*/
/*margin-bottom : 20px;}*/
/*.layerPopup:before {display:block; content:""; position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,.5); z-index:9000}*/
/*.layerPopup .layerBox {    z-index:10000;*/
/*position:fixed; left:50%; top:50%; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }*/
/*.layerPopup .layerBox .title {margin-bottom:10px; font-weight:600;}*/
/*.layerPopup .layerBox .btnTodayHide {*/
/*font-size:14px; font-weight:600; color:black;*/
/*float: left;text-decoration:none;width: 150px;*/
/*height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;*/
/*}*/
/*.layerPopup div{*/
/*	display : inline;*/
/*}*/
/*.layerPopup form{*/
/*	margin-top : 5px;*/
/*	font-size:16px; font-weight:600;*/
/*	weight: 100%;*/
/*	height : 30px;*/
/*	line-height:30px*/
/*}*/
/*.layerPopup #close {*/
/*font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;*/
/*}*/
/*.layerPopup a{*/
/*    text-decoration-line: none;*/
/*    color: #3c8dbc;*/
/*}*/

</style>
<style id="dynamicStyle" disabled>
    .sbux-bre-wrap > ul.sbux-bre-item-wrap li.sbux-bre-item > a.sbux-bre-link span.sbux-bre-item-txt{
        color:white;
    }
</style>

<%--<script language="JavaScript">--%>
<%--	//head 태그 안에 스크립트 선언--%>
<%--    function setCookie( name, value, expiredays ) {--%>
<%--        var todayDate = new Date();--%>
<%--        todayDate.setDate( todayDate.getDate() + expiredays ); --%>
<%--        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"--%>
<%--    }--%>
<%--    function closePop() {--%>
<%--        if ( document.pop_form.chkbox.checked ){--%>
<%--            setCookie( "maindiv", "done" , 1 );--%>
<%--        }--%>
<%--        document.all['layer_popup'].style.visibility = "hidden";--%>
<%--    }--%>
<%--</script>--%>

</head>
<body id="mainBody" oncontextmenu="return false;">


<!-- inline scripts related to this page -->
<script type="text/javascript">

    const __TAB_PRFX__ = "TAB_";
    const __BOOKMARK_PRFX__ = "BMK_"
    const lv_tabPrefix = "idxfrmJson_TAB_";
    let lv_frmId = "";
    let prvTabMenuId = "";

    let lv_isNewTab = true;
	let lv_needExpand = true;
	
	let lv_sysId	= "";

	const jsonSideTempData = [];
	
    const jsonTabPage = [];

    const jsonCommonBtn = [];

    <c:choose>
        <c:when test="${initMenuId != null}">
            <c:set scope="request" var="initMenuId" value="${initMenuId}"></c:set>
            const initMenuId = '<c:out value='${initMenuId}' escapeXml="false"></c:out>';
        </c:when>
        <c:otherwise>
            const initMenuId = '';
        </c:otherwise>
    </c:choose>

    <c:set scope="request" var="topMenuList" value="${topMenuList}"></c:set>
    var menuJson = <c:out value='${topMenuList}' escapeXml="false"></c:out>;
    //var menuJson = ${topMenuList};


    //SBUx sidemenu 컴포넌트의 json 데이터
    var sideJsonData = [];
    //
    var menuJsonB = [
        /*
        {
            "order": 10,
            "id": "id_1",
            "pid": "",
            "text": "홈"
        },
         */
    ];

    // 탭 메뉴 빈 값 설정
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

    /**
     * @name fn_selectTopMenu
     * @description 상단메뉴조회
     * @function
     */
    const fn_selectTopMenu = async (_id) => {

        const data = SBUxMethod.get(_id);

        const url = data.customData === undefined ? "" : data.customData.url;

        await fn_setLeftMenu(data.id);

    }

    /**
     * @name fn_setLeftMenu
     * @description Set LEFT MENU : menuNo 값으로 (비동기식으로)서버로 부터 데이터를 요청
     * @param {String} _menuNo
     * @param {String} _menuId
     * @function
     */
    async function fn_setLeftMenu(_menuNo, _menuId = null) {

        const menuInfo = _.find(menuJson, {id: _menuNo});
        let pMenuId = menuInfo.pid;
        let pMenuNm = menuInfo.value;

        if (gfn_isEmpty(pMenuId)) {
            pMenuId = _menuNo;
            pMenuNm = menuInfo.text;
        }

        lv_sysId = pMenuId;
        
        const idxSideTemp = jsonSideTempData.findIndex(function(item) {return item.id === lv_sysId}) // findIndex = find + indexOf
        if (idxSideTemp > -1) {
        	jsonSideTempData.splice(idxSideTemp, 1)
        }

        try {
            const postJsonPromise = gfn_postJSON(
                    "/co/authrt/selectSideMenuTreeList.do",
                    {upMenuId: pMenuId},
                    "main",
                    true
                );
            const data = await postJsonPromise;

        	const list = [];
            sideJsonData.length = 0;
            data.resultList.forEach((item, index) => {
                const menu = {
                    id: item.menuId,
                    pid: item.upMenuId,
                    order: item.indctSeq,
                    text: item.menuNm,
                    url: item.pageUrl,
                    prsnaYn : item.prsnaInfoYn,
                    bmkYn	: item.bmkYn
                }
                sideJsonData.push(menu);
                list.push(menu);
            });

            jsonSideTempData.push({
            	id: lv_sysId,
            	list: list
            });
            
            //if (pMenuId !== "0") {
            if (!gfn_isEmpty(menuInfo.pid)) {
                var pIdx = _.findLastIndex(sideJsonData, {id: menuInfo.pid});
                if (pIdx >= 0) {
                    sideJsonData[pIdx].class = "active";
                }
            }

            if (!gfn_isEmpty(_menuId)) {
                _menuNo = _menuId;
            }

            const idx = _.findLastIndex(sideJsonData, {id: _menuNo});
            let expndPid;
            if (idx >= 0) {
                //sideJsonData[idx].class = "active";
                
                expndPid = sideJsonData[idx].pid;
            }

            SBUxMethod.refresh("side_menu");
            
            if (!gfn_isEmpty(expndPid)) {            	
                //SBUxMethod.expandSideMenu("side_menu", expndPid, true);
            }

            const title = pMenuNm;
            //document.querySelector('.sbux-sidemeu-title-wrap>div').innerHTML = '<div style="font-size:18px; text-align: center">'+title+'<div>';
            const titleEl = document.querySelector('.sbux-sidemeu-title-wrap>div>span');
            titleEl.innerText = title;
            //document.querySelector('.sbux-sidemeu-title-wrap>div').innerHTML = '<div style="font-size:18px; text-align: center">'+title+'<div>';
            if (idx >= 0 && _menuId == undefined && !gfn_isEmpty(sideJsonData[idx].url)) {
                
            	await fn_actionGoPage(
                        sideJsonData[idx].url
                        , "LEFT"
                        , sideJsonData[idx].id
                        , sideJsonData[idx].text
                        , sideJsonData[idx].pid
                    );
            }

            /*
            if (gv_userType === "00" || gv_userType ==="01") {
            	titleEl.innerText = "관리 시스템";
            }
             */

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }

    }

    /**
     * @name fn_selectMenu
     * @description 좌측 메뉴 선택
     * @function
     */
    async function fn_selectMenu(_target, _id) {

        let data = SBUxMethod.get(_id);
        if (gfn_isEmpty(data)) {
            return;
        }

        if (_target === "TOP" && gfn_isEmpty(data.pid)) {
            return;
        }

        let url = data.customData === undefined ? "" : data.customData.url;

        if (gfn_isEmpty(url)) {
            return;
        }

		await fn_actionGoPage(
                url
                , _target
                , data.id
                , data.text
                , data.pid
            );
        /*
        try {
            await insertComLog(data);
        } catch (err){
            console.log(err);
        }
         */
    }


    /**
     * @name insertComLog
     * @description 화면 접근 로그 등록
     * @function
     */
    const insertComLog = async function (obj){

        const postJsonPromise = gfn_postJSON("/sys/insertComLog.do", {
            menuId : obj.id,
            menuNm : obj.text,
            flfmtTaskSeCd : obj.customData.prsnaYn,
            prslType : "M1"
        });

        try {
            const data = await postJsonPromise;
            // if (_.isEqual("S", data.resultStatus)) {
            //
            // }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        /*
        fetch("/sys/insertComLog.do",{
            method: "POST",
            headers: {
                "Content-Type" : "application/json",
            },
            body: JSON.stringify({
            	menuId : data.id,
            	menuNm : data.text,
            	userNm : userName,
            	apcCd : apc_cd,
            	flfmtTaskSeCd : prsnaYn,
            	prslType : "M1"
            })
        })
            .then((response) => response.json())
            .catch((err) => console.log(err))
        */
    }

    // 탭 화면 이동
    const __MAX_TAB_MENU_COUNT__ = 11;//메뉴탭 최대 허용 개수(10)
    const __FIXED_TAB_PAGES__ = [
        "TAB_CO_014",
        "TAB_PD_009"
    ];

    /**
     * @name fn_actionGoPage
     * @description page open action
     * @param {String} _url         페이지 경로
     * @param {String} _menuType    메뉴 유형
     * @param {String} _menuNo      메뉴 번호
     * @param {String} _menuNm      메뉴 명
     * @param {String} _topMenuNo   상단 메뉴 번호
     * @function
     */
    const fn_actionGoPage = async function (_url, _menuType, _menuNo, _menuNm, _topMenuNo) {

        if (_menuType === "TOP") {
            await fn_setLeftMenu(_menuNo);
        } else if (_menuType === "LEFT") {

            //Set 브레드크럼 내비게이션
            fn_setBreadcrumbs(_menuNo);

            //메뉴탭 생성 및 화면 요청
            let tabName = __TAB_PRFX__ + _menuNo;

            const tabPage = document.getElementById(tabName);
            if (gfn_isEmpty(tabPage)) {
                const tabCount = SBUxMethod.getTabsCount('tab_menu');

                if (tabCount >= __MAX_TAB_MENU_COUNT__) {
                    if (!gfn_comConfirm("Q0000", "탭 허용개수 초과. 가장 오래된 페이지를 닫으시겠습니까?")) {
                        return;
                    }

                    const tabList = SBUxMethod.getTabsChangedOrderData('tab_menu').data;
                    let target = "";
                    for ( let i=0; i<tabList.length; i++ ) {
                        const tabData = tabList[i];
                        if (__FIXED_TAB_PAGES__.indexOf(tabData.targetid) < 0) {
                            target = tabData.targetid;
                            break;
                        }
                    }
                    SBUxMethod.removeTab('tab_menu', target);
                }

                const tabObj = {
                        'id': tabName,
                        'pid': '-1',
                        'text': _menuNm,
                        'targetid': tabName,
                        'targetvalue': tabName,
                        'targetname': 'frmJson',
                        'link': '/co/menu/openPage.do/' + _menuNo,	// _url
                        'closeicon': true,
                        callbackCompleteAddTab : fn_afterCompleteAddTab
                };

                lv_isNewTab = true;
                SBUxMethod.addTab('tab_menu', tabObj);
            } else {
                lv_isNewTab = false;
                SBUxMethod.selectTab(tabName);
            }

            /*
            if ( $('#' + tabName).length == 0 ) {
                if (SBUxMethod.getTabsCount('tab_menu') == __MAX_TAB_MENU_COUNT__+1) {
                    if(gfn_comConfirm("Q0000","가장 오래된 탭을 삭제하시겠습니까?")){
                        let target =SBUxMethod.getTabsChangedOrderData('tab_menu').data[2].targetid;
                        SBUxMethod.removeTab('tab_menu',target);
                    }else{
                        // alert("메뉴탭 최대 허용 개수(" + maxTebMenuCnt.toString() + "개)를 초과하였습니다.");
                        return;
                    }
                }
                var jsonTabSelect = {
                    'id': tabName
                    , 'pid': '-1'
                    , 'text': _menuNm
                    , 'targetid': tabName
                    , 'targetvalue': tabName
                    , 'targetname': 'frmJson'
                    , 'link': '/co/menu/openPage.do/' + _menuNo	// _url
                    , 'closeicon': true
                };
                lv_isNewTab = true;
                SBUxMethod.addTab('tab_menu', jsonTabSelect);
            } else {
            	lv_isNewTab = false;
                SBUxMethod.selectTab(tabName);
            }
             */
        }
    }


    const fn_afterCompleteAddTab = async function(_tabObj) {
        /*
        if (!gfn_isEmpty(_tabObj)) {
            await fn_afterAddTab(_tabObj.id.replace(__TAB_PRFX__, ""));
        }
         */
    }

    /**
     * @name fn_afterAddTab
     * @description tab 추가 후 처리
     * @param {String} _menuId
     * @function
     */
    const fn_afterAddTab = async function(_menuId) {

        prvTabMenuId = _menuId;

        if (gfn_isEmpty(_menuId)) {
        	lv_frmId = "";
        } else {
        	lv_frmId = lv_tabPrefix + _menuId;
        }

        // 공통버튼 설정
        await fn_setTabInfo(_menuId);

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
                // console.log(data);
            }
        );
    }

    /**
     * @name fn_afterSeletTab
     * @description tab 선택 후 처리
     * @param {String} _menuId
     * @function
     */
    async function fn_afterSeletTab(_menuId) {

        prvTabMenuId = _menuId;

        if (gfn_isEmpty(_menuId)) {
        	lv_frmId = "";
        } else {
        	lv_frmId = lv_tabPrefix + _menuId;
        }

        // TODO
        // set page info and common button 설정
        // 공통버튼 설정
        await fn_setTabInfo(_menuId);

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
                // console.log(data);
            }
        );
    }


    /**
     * @name fn_setBreadcrumbs
     * @description Breadcrumbs 설정
     * @function
     */
    function fn_setBreadcrumbs(menuNo) {
        menuJsonB.length = 0;
        menuJsonB.push({
                "order": 10,
                "id": "id_1",
                "pid": "",
                "text": "홈"
            });
        const menuInfo = _.find(menuJson, {id: menuNo});
        const upMenuNo = menuInfo.pid;
        let upMenuNm = "";

        if (!gfn_isEmpty(upMenuNo)) {
            const upMenuInfo = _.find(menuJson, {id: upMenuNo});
            if (!gfn_isEmpty(upMenuInfo.pid)) {
                const topMenuInfo = _.find(menuJson, {id: upMenuInfo.pid});
                menuJsonB.push({
                        "order": 20,
                        "id": topMenuInfo.id,
                        "pid": "",
                        "text": topMenuInfo.text,
                        "url": topMenuInfo.url
                    });
            }

            upMenuNm = upMenuInfo.text;
            menuJsonB.push({
                    "order": 30,
                    "id": upMenuInfo.id,
                    "pid": upMenuInfo.pid,
                    "text": upMenuInfo.text,
                    "url": upMenuInfo.url
                });
        }

        menuJsonB.push({
                "order": 40,
                "id": menuNo,
                "pid": upMenuNo,
                "text": menuInfo.text,
                "url": menuInfo.url,
                "menuNo": menuNo,
                "upMenuNm": upMenuNm
            });

        const bmkId = __BOOKMARK_PRFX__ + menuNo;

        switch (menuInfo.bmkYn) {
            case "Y":
                menuJsonB.push({
                    "order": 50,
                    "id": bmkId,
                    "pid": menuNo,
                    "text": '⭐',
                    "value" : menuInfo.bmkYn
                });
                break;
            case "N":
                menuJsonB.push({
                    "order": 50,
                    "id": bmkId,
                    "pid": menuNo,
                    "text": '☆',
                    "value" : menuInfo.bmkYn
                });
                break;
            default:
                break;
        }

        SBUxMethod.refresh('breadcrumb');
    }

    /**
     * @name fn_setBreadcrumbsHome
     * @description Breadcrumbs 설정 (홈)
     * @function
     */
    const fn_setBreadcrumbsHome = function() {
    	menuJsonB.length = 0;
    	menuJsonB.push({
            "order": 10,
            "id": "id_1",
            "pid": "",
            "text": "홈"
        });
    	SBUxMethod.refresh('breadcrumb');
    }


    //선택한 탭메뉴의 정보를 가져와 메뉴정보 설정
    function fn_setMenuInfo(args) {

        let idx = _.findLastIndex(tabJsonData, {text: args});
        let tabObj = tabJsonData[idx];
        let tabId = tabObj.targetid;
        let menuId = tabId.substring(tabId.indexOf("_")+1);

        let menuInfo = _.find(sideJsonData, {id: menuId});

        if (gfn_isEmpty(menuInfo)) {
        	// home
        	fn_setBreadcrumbsHome();
            prvTabMenuId = "";
            lv_frmId = "";
        	return;
        }

        let upMenuNo = menuInfo.pid;
        let upMenuInfo = _.find(menuJson, {id: upMenuNo});
        //var topMenuNo = upMenuInfo.pid;
        let topMenuNo = menuId.substring(0, 2);	// topMenu 고정
        if (gfn_isEmpty(topMenuNo)) {
            topMenuNo = upMenuNo;
        }

        //LEFT MENU
        if($('#idxSide_menu')[0].style.width != '0px'){
            //fn_setLeftMenu(topMenuNo, menuId); // 2023-07-26 추가
        }

        // fn_setBreadcrumbs(menuId, tabObj.text);

        if (prvTabMenuId !== menuId) {
            fn_afterSeletTab(menuId);
        } else {
            /** 해당페이지는 그대로 다른 탭만 닫힐경우 공통버튼 사라짐 24.11.27 **/
            fn_setTabInfo(menuId);
        }
    }

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


    /**
     * @name fn_selectTabMenu
     * @description 탭 페이지 선택 후 CALLBACK
     * @param _selectId
     * @param _selectJson
     * @function
     */
    async function fn_selectTabMenu(_selectId, _selectJson) {

        const _menuNo = _selectId.substring(_selectId.indexOf("_")+1);

		await fn_afterAddTab(_menuNo);

		const topId = _menuNo.substring(0, 2); //substr(0, 2);

        if (__FIXED_TAB_PAGES__.indexOf(_selectId) >= 0) {
            fn_setBreadcrumbsHome();
            return;
        }



        /*
		if (_.isEqual(_menuNo, "PD_009") || _.isEqual(_menuNo, "CO_014")) {
			return;
		}
         */

		if (!_.isEqual(topId, lv_sysId)) {
			const sideData = _.find(jsonSideTempData, {id: topId});
			if (gfn_isEmpty(sideData)) {
				return;
			}
			
			sideJsonData.length = 0;
			sideData.list.forEach((item) => {
				sideJsonData.push(item);
			});
			
			lv_sysId = topId;
		}
		
		if (lv_isNewTab) {
			lv_isNewTab = false;
			return;
		}
		
		const idx = _.findLastIndex(sideJsonData, {id: _menuNo});
        if (idx >= 0) {
        	
        	sideJsonData.forEach((item, index) => {
        		if (idx === index) {
        			sideJsonData[index].class = "active";
        		} else {
        			sideJsonData[index].class = "";
        		}
        	});
        }

		SBUxMethod.refresh("side_menu");
        const titleEl = document.querySelector('.sbux-sidemeu-title-wrap>div>span');
        const topMenu = _.find(menuJson, {id: lv_sysId});

        if (!gfn_isEmpty(topMenu)) {
            titleEl.innerText = topMenu.text;
        }

        fn_setBreadcrumbs(_menuNo);

		if (!lv_needExpand) {
			lv_needExpand = true;
			return;
		}
		
		let findMenu = _.find(sideJsonData, {id: _menuNo});
		if (!gfn_isEmpty(findMenu)) {
			SBUxMethod.expandSideMenu("side_menu", _menuNo, false);
		}
	}


    /**
     * @name fn_chkTabList
     * @description 메뉴탭을 모두 닫으면 업무 영역 숨김 처리
     * @function
     */
    async function fn_chkTabList() {

   		fn_clearPrvTabInfo();

        const tabCount = SBUxMethod.getTabsCount('tab_menu');
        let tabs = SBUxMethod.getTabsChangedOrderData('tab_menu');
        tabJsonData = tabs.data;

        if (tabCount === 1) {
            //$('.tab-content').hide();
            document.querySelectorAll(".tab-content").forEach(tab => { tab.style.display = "none" });
            menuJsonB.length = 0;
            menuJsonB.push({
                    "order": 10,
                    "id": "id_1",
                    "pid": "",
                    "text": "홈"
                });
            SBUxMethod.refresh('breadcrumb');
            await fn_afterSeletTab("main");
        } else {
            fn_setMenuInfo(SBUxMethod.get('tab_menu'));
        }
    }
    //================== Modal ==================//

</script>
<!-- //inline scripts related to this page -->
<div class="sbt-A-wrap" style="display:flex; flex-direction: column">
    <!-- header (menu) -->
    <div id="main_header" class="sbt-all-header" style="position: relative">
        <sbux-menu id="idxTop_json" name="top_menu" uitype="normal"
                   jsondata-ref="menuJson"
                   is-fixed="false"
                   wrap-style="width:100%"
                   storage-data="object"
                   onclick="fn_selectTopMenu('top_menu')">
            <brand-item text="APC통합지원" image-src="/resource/images/header_logo.png" wrap-style="width:500px;">
            </brand-item>
        </sbux-menu>
        <div class="user-info-wrap" style="z-index:9999;border-left: 5px solid white;position: absolute;right: 0">
            <div style="width: 50px;margin-left: 5px;position: relative;cursor: pointer" onclick="fn_msgPopup();">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="mdi-bell-circle" width="100%" height="100%" viewBox="0 0 24 24">
                    <path d="M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M17,16V15L16,14V11.39C16,10.3 15.73,9.34 15.21,8.53C14.7,7.72 13.96,7.21 13,7V6.5A1,1 0 0,0 12,5.5A1,1 0 0,0 11,6.5V7C10.04,7.21 9.3,7.72 8.79,8.53C8.27,9.34 8,10.3 8,11.39V14L7,15V16H17M13.5,17H10.5A1.5,1.5 0 0,0 12,18.5A1.5,1.5 0 0,0 13.5,17Z" fill="#fff" />
                </svg>
                <span id="pop_wrap" style="position:absolute;left: 30px; border-radius:50%;text-align:center;background: red;width: 15px;height: 15px;line-height: 15px;">
                    <p id="pop_cnt" style="font-weight: bold; color: white"></p>
                </span>
            </div>
            <c:if test="${loginVO != null && loginVO.id != null}">
            	<c:set scope="request" var="userName" value="${loginVO.name}"></c:set>
                <span class="name-t" style="margin-left: 5px"><c:out value='${userName}' escapeXml="false"></c:out></span>
				<span style="cursor: pointer;font-size:20px;margin-left:5px;" id="lbl-autoRefresh" onclick="fn_setAutoRefresh()">🔒</span>
                <ul class="user-login-menu">
                    <li style="padding: 0!important;">
                        <sbux-button
                            id="btnPrfrmImprvDmnd"
                            name="btnPrfrmImprvDmnd"
                            uitype="normal"
                            text="개선요청"
                            style="width:64px;
                            text-align:center;
                            display:inline-block;
                            font-size:12px;" onclick="fn_modalPopup"
                        ></sbux-button></li>
                    <li><a href="/actionLogout.do">로그아웃</a></li>
                </ul>
            </c:if>
        </div>
        <div id="pinToggle" style="position: absolute;right: 15%;top: 5px;z-index:10000">
            <svg id="icon-unpinned" xmlns="http://www.w3.org/2000/svg" style="display:none;"
                 width="50" height="50" viewBox="0 0 30 30"
                 fill="none" stroke="white" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round"
                 class="icon icon-tabler icon-tabler-pin">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                <path d="M15 4.5l-4 4l-4 1.5l-1.5 1.5l7 7l1.5 -1.5l1.5 -4l4 -4" />
                <path d="M9 15l-4.5 4.5" />
                <path d="M14.5 4l5.5 5.5" />
            </svg>
            <svg id="icon-pinned" xmlns="http://www.w3.org/2000/svg"
                 width="50" height="50" viewBox="0 0 30 30"
                 fill="none" stroke="white" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round"
                 class="icon icon-tabler icon-tabler-pinned"
                 >
                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                <path d="M9 4v6l-2 4v2h10v-2l-2 -4v-6" />
                <path d="M12 16l0 5" />
                <path d="M8 4l8 0" />
            </svg>
        </div>
    </div>
    <div class="main" style="flex: 1">
        <!--left (sidemenu) -->
        <div class="left">
            <div class="sbt-all-left">
                <sbux-sidemenu
                	id="idxSide_menu"
                	name="side_menu"
                	uitype="normal"
                    jsondata-ref="sideJsonData"
                    show-filter-box="true"
                    show-slide-button="true"
                    menu-title="메뉴"
                    storage-data="object"
                    is-expand-only-select="true"
                    callback-slide-button="fn_SlideButton"
                    onclick="fn_selectMenu('LEFT', 'side_menu')"
                    vertical-scroll-height="800px"
                    vertical-scroll-placement="left"
                ></sbux-sidemenu>
            </div>
        </div>
        <!--main content-->
        <div class="content">
        	<div class="row">
        		<div class="col-sm-6">
		            <sbux-breadcrumb
		                    id="breadcrumb"
		                    name="breadcrumb"
		                    uitype="text"
		                    jsondata-ref="menuJsonB"
		                    show-tooltip="true"
		                    tooltip-key="url"
		                    onclick="fn_onClickNavigator()"
                            home-icon="home"
		            ></sbux-breadcrumb>
        		</div>
        		<div class="col-sm-6">
					<div style="position: relative; text-align: right; margin: 3px;">
                        <button id="main-btn-attach" class="button"
                                style="display:none" onclick="mfn_attach()">파일첨부</button>
                        <button id="main-btn-appr" class="button"
                                style="display:none" onclick="mfn_appr()">결재처리</button>
						<button id="main-btn-init" class="button"
                                style="display:none" onclick="mfn_init()">초기화</button>
        				<button id="main-btn-add" class="button"
                                style="display:none" onclick="mfn_add()">신규</button>
        				<button id="main-btn-save" class="button"
                                style="display:none" onclick="mfn_save()">저장</button>
        				<button id="main-btn-del" class="button"
                                style="display:none" onclick="mfn_del()">삭제</button>
        				<button id="main-btn-search" class="button"
                                style="display:none;" onclick="mfn_search()">조회</button>
        			</div>
        		</div>
        	</div>

            <!--full content-->
            <div class="sbt-wrap-full">
                <!--탭 입력 영역-->
                <div class="sbt-input-tab" style="height: 100%">
                    <!--탭 영역-->
                    <sbux-tabs
                    	id="tab_menu"
                    	name="tab_menu"
                    	uitype="normal"
                        jsondata-ref="tabJsonData"
                        storage-data="text"
                        onclick="fn_setMenuInfo(tab_menu)"
                        callback-after-select="fn_selectTabMenu"
                        callback-after-close="fn_chkTabList"
                    ></sbux-tabs>
                    <div class="tab-content">
                        <iframe id="idxfrmJson" name="frmJson"
                        ></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 개선요청 Modal -->
<div>
    <sbux-modal id="modal-prfrmImprvDmnd" name="modal-prfrmImprvDmnd" uitype="middle" header-title="프로그램 개선요청" body-html-id="body-modal-prfrmImprvDmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prfrmImprvDmnd">
    <jsp:include page="../apcss/co/dmnd/prfrmImprvDmndPopup.jsp"></jsp:include>
</div>
<%--<jsp:include page="./noticePopup.jsp"/>--%>
<%--<jsp:include page="./surveyPopup.jsp"/>--%>
<div>
    <sbux-modal id="modal-msgAlarm" name="modal-msgAlarm" uitype="middle" header-title="APC업무지원시스템 - 알림" body-html-id="body-modal-msgAlarm" footer-is-close-button="false" header-is-close-button="true" callback-after-close="fn_popMsgRefresh" style="width:1000px;margin-top: 20vh"></sbux-modal>
</div>
<div id="body-modal-msgAlarm">
    <jsp:include page="../apcss/co/ntc/comMsgPopup.jsp"></jsp:include>
</div>
<div>
    <sbux-modal
        id="modal-menuInfo"
        name="modal-menuInfo"
        uitype="middle"
        header-title="메뉴상세정보"
        body-html-id="body-modal-menuInfo"
        footer-is-close-button="false"
        header-is-close-button="true"
        callback-after-close=""
        style="width:500px;margin-top: 20vh"
    ></sbux-modal>
</div>
<div id="body-modal-menuInfo">
    <jsp:include page="../apcss/co/ntc/menuInfoPopup.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">

	let lv_sessUpdtUseYn;
	let lv_interval = 3 * 60 * 1000;

	let timerId;

	const fn_clearBatch = () => {
		if (!gfn_isEmpty(timerId)) {
			clearInterval(timerId);
		}
	}

    /**
     * @name fn_getSysInfo
     * @description apc 확인
     * @function
     */
	const fn_getSysInfo = async function() {

		if (!lv_authRefresh) {
			return;
		}

    	if (_.isEqual("N", lv_sessUpdtUseYn)) {
    		fn_clearBatch();
    		return;
    	}

    	fn_clearBatch();

    	if (gfn_isEmpty(gv_selectedApcCd)) {
    		return;
    	}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/selectApcEvrmntStng.do",
						{apcCd: gv_selectedApcCd}
					);
	        const data = await postJsonPromise;

	        if (	_.isEqual("S", data.resultStatus)
	        		&& data.hasOwnProperty('resultMap')) {
	        	if (	!gfn_isEmpty(data.resultMap)
	        			&& data.resultMap.hasOwnProperty('sessUpdtUseYn')
	        			&& _.isEqual("Y", data.resultMap.sessUpdtUseYn)) {

	        		lv_sessUpdtUseYn = "Y";
	        		document.querySelector("#lbl-autoRefresh").style.display = "";

	        		timerId = setInterval(() => {
						fn_getSysInfo();
					}, lv_interval);

	        	} else {
	        		lv_sessUpdtUseYn = "N";
					document.querySelector("#lbl-autoRefresh").style.display = "none";
	        	}
        	} else {
        		lv_sessUpdtUseYn = "N";
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {

		}
	}

	let lv_authRefresh = true;
	const fn_setAutoRefresh = function() {
		lv_authRefresh = !lv_authRefresh;

		const lblText = lv_authRefresh ? '🔒' : '🔓';
		document.querySelector('#lbl-autoRefresh').innerText = lblText;
	}
    document.addEventListener('touchmove', function(event) {
        // 페이지 전체가 드래그될 때 기본 동작 방지
        event.preventDefault();
    }, { passive: false });

    window.addEventListener('keydown', function(event) {
        if (event.altKey && (event.key === 'F' || event.key === 'f' || event.key === 'ㄹ')) {
            event.preventDefault();
            mfn_search();
        }
    });

    //only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
        const wrapper = document.getElementById('pinToggle');
        const svgOff = document.getElementById('icon-unpinned');
        const svgOn  = document.getElementById('icon-pinned');
        const header = document.getElementById('main_header');
        const style = document.getElementById('dynamicStyle');
        const sheet = style.sheet;
        style.disabled = true;
        const showThreshold = 50;   // 위에서부터 50px 이내로 들어오면 보이기
        const hideThreshold = 20;

        wrapper.addEventListener('click', () => {
            const isNowOn = svgOff.style.display !== 'none';
            // 토글
            svgOff.style.display = isNowOn ? 'none' : '';
            svgOn .style.display = isNowOn ? ''   : 'none';
            if(!isNowOn){
                header.classList.add("header-hide");
                $("#mainBody > div.sbt-A-wrap > div.main > div.content > div.row").css("background-color","#149fff");
                sheet.disabled = false;
            }else{
                header.classList.remove("header-hide");
                $("#mainBody > div.sbt-A-wrap > div.main > div.content > div.row").css("background-color","white");
                sheet.disabled = true;
            }
        });

        // 헤더 높이 + 여분 20px 밖으로 벗어나면 숨기기
        document.addEventListener('mousemove', e => {
            if (e.clientY < showThreshold) {
                header.classList.add('visible');
            } else if (e.clientY > hideThreshold) {
                header.classList.remove('visible');
            }
        });
    });

    /**
     * @name fn_init
     * @description 초기 화면 로드 후
     * @function
     */
    const fn_init = async function() {
        document.querySelector("#lbl-autoRefresh").style.display = "none";

        // 공지사항 등록
        await fn_openNoticeTab();


        // 생산관리 대시보드
        if (gfn_isEmpty(initMenuId)) {
            await fn_openMainTab();
        }

        const jsonSysId = menuJson.filter((item, index, arr) => {
            return gfn_isEmpty(item.pid);
        });

        // 여기서 분기
        let menuId = menuJson[0].id;
        if (!gfn_isEmpty(initMenuId)) {
            menuId = initMenuId;
        }

        //await fn_setLeftMenu(menuJson[0].id, menuJson[0].text);
        await fn_setLeftMenu(menuId);

        await fn_getSysInfo();

        const iframe = document.getElementById('idxfrmJson');
        iframe.scrolling = 'auto';

        mfn_displayButton();

        await fn_topMenuSet();
    }


    /** 각각 탭끼리 소통 관제탑 메인
     *  send Tab > main > receive Tab **/
    window.addEventListener('message', function(event){
        try{
            let object = JSON.parse(event.data);
            if(!gfn_isEmpty(object)){
                let target = object.target;
                let data = sideJsonData.filter((item) => item.id == target);
                let openFlag = tabJsonData.some((item) => item.targetid.replace("TAB_","") == target);

                if(openFlag){
                    /** receive Tab이 열려 있는 상태에선 msg를 전달하여 VO 전달 **/
                    let iframe = "idxfrmJson_TAB_" + target;
                    let el = document.getElementById(iframe);
                    SBUxMethod.set("tab_menu","TAB_"+target);

                    el.contentWindow.postMessage(object);

                }else{
                    localStorage.setItem("callMain",JSON.stringify(object));
                    /** 현재 receive Tab이 없는경우 새로 오픈 **/
                    fn_actionGoPage(
                        data[0].url
                        , 'LEFT'
                        , data[0].id
                        , data[0].text
                        , data[0].pid
                    );
                }
            }
        }catch (e){
            if(event.data == 'sideMenuOff'){
                SBUxMethod.closeSideMenu('side_menu');
            }
        }


    });

    const fn_modalPopup = async function() {

        var userId 		= '${loginVO.id}';
        var userNm		= '${loginVO.name}';
        var userType	= '${loginVO.userType}';
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

            prfrmImprvDmnd.init(gv_apcCd, gv_apcNm, userId, userNm, userType, menuId, menuNm);
            SBUxMethod.openModal('modal-prfrmImprvDmnd');
        }else{
            gfn_comAlert("W0001", "프로그램");		//	W0001	{0}을/를 선택하세요.
        }

    }

    /**
     * @name fn_naviOnClick
     * @description navigator click event
     */
    const fn_onClickNavigator = async function() {

        let navi = SBUxMethod.getBreadcrumb("breadcrumb");
        if (gfn_isEmpty(navi)) {
            return;
        }

        const order = navi.order;
        const idx = parseInt(navi['sbux_index']) || 0;
        let result = false;
        /*
        const idx = menuJsonB.findIndex(menu => {
           if (menu.order === order) {
               return true;
           }
        });
         */

        const menu = menuJsonB[idx];
        if (gfn_isEmpty(menu)) {
            return;
        }

        switch (menu.order) {
            case 40:
                popMenuInfo.init({
                        menuId: menu.id,
                        menuNm: menu.text,
                        sysNm: "",
                        upMenuId: menu.pid,
                        upMenuNm: menu.upMenuNm,
                        url: menu.url,
                    });
                SBUxMethod.openModal(popMenuInfo.modalId);
                break;

            case 50:    // BOOKMARK ACTION
                SBUxMethod.refresh('breadcrumb');
                const menuId = menu.id.replace(__BOOKMARK_PRFX__, "");
                const bmkYn = menu.value;

                switch (bmkYn) {
                    case "Y":
                        result = await fn_deleteBookmark({menuId : menuId});

                        if (result) {
                            menuJsonB[idx].text = '☆';
                            menuJsonB[idx].value = "N";
                            for ( let i; i<menuJson.length; i++) {
                                const checkId = menuJson[i].id;
                                if (_.isEqual(checkId, menuId)) {
                                    menuJson[i].bmkYn = "N"
                                    break;
                                }
                            }
                        }
                        SBUxMethod.refresh('breadcrumb');
                        break;

                    case "N":
                        result = await fn_insertBookmark({menuId : menuId});
                        if (result) {
                            menuJsonB[idx].text = '⭐';
                            menuJsonB[idx].value = "Y";
                            for ( let i; i<menuJson.length; i++) {
                                const checkId = menuJson[i].id;
                                if (_.isEqual(checkId, menuId)) {
                                    menuJson[i].bmkYn = "Y";
                                    break;
                                }
                            }
                        }
                        SBUxMethod.refresh('breadcrumb');
                        break;
                }
                break;
            default:
                break;
        }
    }
    /**
     * @name fn_deleteBookmark
     * @description delete bookmark
     */
    const fn_deleteBookmark = async function(objMenu) {
        const postJsonPromise = gfn_postJSON("/co/authrt/deleteBmk.do", objMenu);
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                return true;
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }

        return false;
    }
    /**
     * @name fn_insertBookmark
     * @description insert bookmark
     */
    const fn_insertBookmark = async function(objMenu) {
        const postJsonPromise = gfn_postJSON("/co/authrt/insertBmk.do", objMenu);
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                return true;
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }

        return false;
    }


    const fn_bmkYn = async function(){

    	let breadcrumb = SBUxMethod.getBreadcrumb("breadcrumb");
    	let order = breadcrumb.order;

    	if (order == "50"){

    		let menuId = menuJsonB[menuJsonB.length-1].id;
    		let bmkYn = menuJsonB[menuJsonB.length-1].value;

    		SBUxMethod.refresh('breadcrumb');

    		if(bmkYn == "Y" || bmkYn == "N"){
    			let bmk = {menuId : menuId}
    			if(bmkYn == "Y"){

    				const postJsonPromise = gfn_postJSON("/co/authrt/deleteBmk.do", bmk);
    		    	const data = await postJsonPromise;
    		    	try{
    		    		if (_.isEqual("S", data.resultStatus)) {

    		    			let index = menuJsonB.length-1;
    		    			menuJsonB[index].text = '☆'
    		    			menuJsonB[index].value = "N"

    		    			for(var i; i<menuJson.length; i++){
    		    				if(menuJson[i].menuId == menuId){
    		    					menuJson[i].bmkYn = "N"
    		    					break;
    		    				}
    		    			}
    		        	} else {
    		        		gfn_comAlert(data.resultCode, data.resultMessage);
    		        	}
    		        }catch (e) {
    		        	if (!(e instanceof Error)) {
    		    			e = new Error(e);
    		    		}
    		    		console.error("failed", e.message);
    				}
    			}
    			if(bmkYn == "N"){
    				const postJsonPromise = gfn_postJSON("/co/authrt/insertBmk.do", bmk);
    		    	const data = await postJsonPromise;
    		    	try{
    		    		if (_.isEqual("S", data.resultStatus)) {

    		    			let index = menuJsonB.length-1;
    		    			menuJsonB[index].text = '⭐'
    		    			menuJsonB[index].value = "Y"

    		    			for(var i; i<menuJson.length; i++){
    		    				if(menuJson[i].menuId == menuId){
    		    					menuJson[i].bmkYn = "Y";
    		    					break;
    		    				}
    		    			}
    		        	} else {
    		        		gfn_comAlert(data.resultCode, data.resultMessage);
    		        	}
    		        }catch (e) {
    		        	if (!(e instanceof Error)) {
    		    			e = new Error(e);
    		    		}
    		    		console.error("failed", e.message);
    				}
    			}
    			SBUxMethod.refresh('breadcrumb');
    		}
    	}
    }

    const getHomeSvg = function(){
        return `<?xml version="1.0" encoding="iso-8859-1"?><!-- Generator: Adobe Illustrator 16.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  --><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="13px" viewBox="0 0 612.008 612.008" style="enable-background:new 0 0 612.008 612.008;" xml:space="preserve"><g><g id="Shape_379_1_"><g><path d="M609.208,298.575L313.306,3.815c-3.987-3.988-10.445-3.988-14.433,0L2.961,298.575c-3.988,3.988-3.907,10.353,0,14.393c1.999,2.06,4.61,3.11,7.201,3.131v0.041h71.441v284.865c0,2.815,1.142,5.335,2.988,7.171c1.846,1.856,4.396,3.009,7.211,3.009h142.8c5.63,0,10.2-4.569,10.2-10.18V397.556h122.401v203.449c0,5.6,4.569,10.18,10.2,10.18h142.8c5.63,0,10.2-4.569,10.2-10.18V316.14h71.899c2.673,0.051,5.191-1,6.905-3.162C612.676,308.541,613.197,302.563,609.208,298.575z" fill="#FFFFFF"/></g></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>`;
    }

    /**
     * @name fn_openNoticeTab
     * @description 공지사항
     */
    const fn_openNoticeTab = async function() {
        // 공지사항
        const tabName = "TAB_PD_009";
        const menuNo = "PD_009";

        const noticeTab = SBUxMethod.getTab('tab_menu', tabName);
        if (!gfn_isEmpty(noticeTab)) {
            return;
        }

        const jsonTabSelect = {
            'id': tabName,
            'pid': '-1',
            'text': '📢',	//'공지사항'📣
            'targetid': tabName,
            'targetvalue': tabName,
            'targetname': 'frmJson',
            'link': '/co/menu/openPage.do/' + menuNo,	// _url
            'closeicon': false,
        };

        SBUxMethod.addTab('tab_menu', jsonTabSelect);
        //화면이력관리용 data
        await insertComLog({
            customData : {prsnaYn : null},
            id : menuNo,
            text : "공지사항",
            prslType: "M1"
        });
    }

    /**
     * @name fn_openMainTab
     * @description 생산관리 대시보드
     */
    const fn_openMainTab = async function() {
        const tabName = "TAB_CO_014";
        const menuNo = "CO_014";

        const mainTab = SBUxMethod.getTab('tab_menu', tabName);
        if (!gfn_isEmpty(mainTab)) {
            return;
        }
        const svg = '📊'; //getHomeSvg();
        const jsonTabSelect = {
                'id': tabName,
                'pid': '-1',
                'text': svg,	//'대시보드'
                'targetid': tabName,
                'targetvalue': tabName,
                'targetname': 'frmJson',
                'link': '/co/menu/openPage.do/' + menuNo,	// _url
                'closeicon': false,
            };

        SBUxMethod.addTab('tab_menu', jsonTabSelect);

        /** 관리자 00,10 type시 agent 대시보드 노출 **/
        if(gv_untyAuthrtType === '00' || gv_untyAuthrtType === '10'){
            const jsonTabSelect = {
                'text': 'Agent',	//'대시보드'
                'targetid': "TAB_CO_020",
                'targetvalue': "TAB_CO_020",
                'targetname': 'frmJson',
                'link': '/co/menu/openPage.do/CO_020',	// _url
                'closeicon': false,
            };
            SBUxMethod.addTab('tab_menu',jsonTabSelect);
        }
        //화면이력관리용 data
        const data = {
                customData : {prsnaYn : null},
                id : menuNo,
                text : "대시보드",
                prslType: "M1"
            }
        await insertComLog(data);

    }

    function gfn_tabClose(_menuId) {
    	SBUxMethod.removeTab("tab_menu", _menuId)
    }

    function lfn_redirect(_url) {
    	window.location.href = _url;
    }

    const mfn_search = function() {

    	if (gfn_isEmpty(lv_frmId)) {
    		return;
    	}

    	try {
    		const tabContent = document.getElementById(lv_frmId).contentWindow;

        	if (typeof tabContent !== 'object') {
        		return;
        	}

        	tabContent.cfn_search();

    	} catch (e) {
    		console.log(e.message);
    	}
    }


	const mfn_init = function() {

		if (gfn_isEmpty(lv_frmId)) {
    		return;
    	}

    	try {
    		const tabContent = document.getElementById(lv_frmId).contentWindow;
        	if (typeof tabContent !== 'object') {
        		return;
        	}

        	tabContent.cfn_init();

    	} catch (e) {
    		console.log(e.message);
    	}
    }

	const mfn_add = function() {

    	if (gfn_isEmpty(lv_frmId)) {
    		return;
    	}

    	try {
    		const tabContent = document.getElementById(lv_frmId).contentWindow;
        	if (typeof tabContent !== 'object') {
        		return;
        	}

        	tabContent.cfn_add();

    	} catch (e) {
    		console.log(e.message);
    	}
    }

	const mfn_save = function() {

    	if (gfn_isEmpty(lv_frmId)) {
    		return;
    	}

    	try {
    		const tabContent = document.getElementById(lv_frmId).contentWindow;
        	if (typeof tabContent !== 'object') {
        		return;
        	}

        	tabContent.cfn_save();

    	} catch (e) {
    		console.log(e.message);
    	}
    }

	const mfn_del = function() {

    	if (gfn_isEmpty(lv_frmId)) {
    		return;
    	}

    	try {
    		const tabContent = document.getElementById(lv_frmId).contentWindow;
        	if (typeof tabContent !== 'object') {
        		return;
        	}

        	tabContent.cfn_del();

    	} catch (e) {
    		console.log(e.message);
    	}
    }

    const mfn_appr = function() {
        if (gfn_isEmpty(lv_frmId)) {
            return;
        }
        try {
            const tabContent = document.getElementById(lv_frmId).contentWindow;
            if (typeof tabContent !== 'object') {
                return;
            }

            tabContent.cfn_appr();

        }catch (e){
            console.log(e.message);
        }
    }

    const mfn_attach = function() {
        if (gfn_isEmpty(lv_frmId)) {
            return;
        }
        try {
            const tabContent = document.getElementById(lv_frmId).contentWindow;
            if (typeof tabContent !== 'object') {
                return;
            }

            tabContent.cfn_attach();

        }catch (e){
            console.log(e.message);
        }
    }


	const mfn_displayButton = function (_uiInfo) {


		const btnInit = document.getElementById("main-btn-init");
		const btnAdd = document.getElementById("main-btn-add");
		const btnSave = document.getElementById("main-btn-save");
		const btnDel = document.getElementById("main-btn-del");
		const btnSearch = document.getElementById("main-btn-search");
		const btnAttach = document.getElementById("main-btn-attach");
		const btnAppr = document.getElementById("main-btn-appr");

		btnInit.disabled = true;
		btnAdd.disabled = true;
		btnDel.disabled = true;
		btnSave.disabled = true;
		btnSearch.disabled = true;
        btnAttach.disable = true;
        btnAppr.disable = true;

		btnInit.style.display = "none";
		btnAdd.style.display = "none";
		btnDel.style.display = "none";
		btnSave.style.display = "none";
		btnSearch.style.display = "none";
        btnAttach.style.display = "none";
        btnAppr.style.display = "none";

    	if (gfn_isEmpty(_uiInfo)) {
    		return;
    	}

    	try {
    		if (_uiInfo.hasOwnProperty('cmnsInit')) {
    			if (_uiInfo.cmnsInit['button']) {
    				btnInit.disabled = false;
    				btnInit.disabled = _uiInfo.cmnsInit['disabled'];
    				btnInit.style.display = _uiInfo.cmnsInit['visible'] ? "" : "none";
    			}
    		}
    		if (_uiInfo.hasOwnProperty('cmnsAdd')) {
    			if (_uiInfo.cmnsAdd['button']) {
    				btnAdd.disabled = false;
    				btnAdd.disabled = _uiInfo.cmnsAdd['disabled'];
    				btnAdd.style.display = _uiInfo.cmnsAdd['visible'] ? "" : "none";
    			}
    		}
    		if (_uiInfo.hasOwnProperty('cmnsDel')) {
    			if (_uiInfo.cmnsDel['button']) {
    				btnDel.disabled = false;
    				btnDel.disabled = _uiInfo.cmnsDel['disabled'];
    				btnDel.style.display = _uiInfo.cmnsDel['visible'] ? "" : "none";
    			}
    		}
    		if (_uiInfo.hasOwnProperty('cmnsSave')) {
    			if (_uiInfo.cmnsSave['button']) {
    				btnSave.disabled = false;
    				btnSave.disabled = _uiInfo.cmnsSave['disabled'];
    				btnSave.style.display = _uiInfo.cmnsSave['visible'] ? "" : "none";
    			}
    		}
    		if (_uiInfo.hasOwnProperty('cmnsSearch')) {
    			if (_uiInfo.cmnsSearch['button']) {
    				btnSearch.disabled = false;
    				btnSearch.disabled = _uiInfo.cmnsSearch['disabled'];
    				btnSearch.style.display = _uiInfo.cmnsSearch['visible'] ? "" : "none";
    			}
    		}
            if (_uiInfo.hasOwnProperty('cmnsUpload')) {
                if (_uiInfo.cmnsUpload['button']) {
                    btnAttach.disabled = false;
                    btnAttach.disabled = _uiInfo.cmnsUpload['disabled'];
                    btnAttach.style.display = _uiInfo.cmnsUpload['visible'] ? "" : "none";
                }
            }
            if (_uiInfo.hasOwnProperty('cmnsAppr')) {
                if (_uiInfo.cmnsAppr['button']) {
                    btnAppr.disabled = false;
                    btnAppr.disabled = _uiInfo.cmnsAppr['disabled'];
                    btnAppr.style.display = _uiInfo.cmnsAppr['visible'] ? "" : "none";
                }
            }
            // /** 공통버튼 css 순차적용 **/
            // let btns = document.querySelectorAll("button.button");
            // /** 공통버튼 css 초기화 **/
            // btns.forEach(function(item){
            //    item.className = "button"
            // });
            // let activeBtn = Array.from(btns).filter(btn => window.getComputedStyle(btn).display !== 'none');
            // activeBtn.forEach(function(item,idx){
            //    item.classList.add("button_" + (idx + 1));
            // });
    	} catch (e) {
    		console.log(e.message);
    	}
    }

	const fn_clearPrvTabInfo = function() {
        if (gfn_isEmpty(prvTabMenuId)) {
			return;
		}

		mfn_displayButton(null);
		const idx = jsonTabPage.findIndex(function(item) {return item.menuId === prvTabMenuId});
		if (idx >= 0) {
			jsonTabPage.splice(idx, 1);
		}
	}

    /**
     * @name fn_setTabInfo
     * @description tab page 정보 설정 : 공통버튼 설정
     * @param {String} _menuId
     * @function
     */
	const fn_setTabInfo = async function(_menuId) {

		let uiInfo;

		const idx = jsonTabPage.findIndex(function(item) {return item.menuId === _menuId});

		if (idx >= 0) {
			uiInfo = jsonTabPage[idx];
		} else {

			uiInfo = {
				menuId: _menuId,
        		cmnsInit: {
        			button: false,
        			disabled: false,
        			visible: false,
        		},
        		cmnsAdd: {
        			button: false,
        			disabled: false,
        			visible: false,
        		},
        		cmnsDel: {
        			button: false,
        			disabled: false,
        			visible: false,
        		},
        		cmnsSave: {
        			button: false,
        			disabled: false,
        			visible: false,
        		},
        		cmnsSearch: {
        			button: false,
        			disabled: false,
        			visible: false,
        		},
                cmnsUpload: {
                    button: false,
                    disabled: false,
                    visible: false,
                },
                cmnsAppr: {
                    button: false,
                    disabled: false,
                    visible: false,
                }
			}

            try {
                const postJsonPromise = gfn_postJSON(
                        "/co/authrt/selectLoginUserAuthrtCmnsBtnList.do",
                        {menuId: _menuId},
                        "main",
                        true
                    );

                const data = await postJsonPromise;
                data.resultList.forEach((item, index) => {

                    const hasButton = _.isEqual(item.delYn, 'N');
                    const disabled = _.isEqual(item.accessUseYn, 'Y') && _.isEqual(item.accessYn, 'N');
                    const visible = !(_.isEqual(item.indctUseYn, 'Y') && _.isEqual(item.indctYn, 'N'));

                    switch (item.entyId) {
                        case "CMNS_INIT":
                            uiInfo.cmnsInit.button = hasButton;
                            uiInfo.cmnsInit.disabled = disabled;
                            uiInfo.cmnsInit.visible = visible;
                            break;
                        case "CMNS_ADD":
                            uiInfo.cmnsAdd.button = hasButton;
                            uiInfo.cmnsAdd.disabled = disabled;
                            uiInfo.cmnsAdd.visible = visible;
                            break;
                        case "CMNS_DEL":
                            uiInfo.cmnsDel.button = hasButton;
                            uiInfo.cmnsDel.disabled = disabled;
                            uiInfo.cmnsDel.visible = visible;
                            break;
                        case "CMNS_SAVE":
                            uiInfo.cmnsSave.button = hasButton;
                            uiInfo.cmnsSave.disabled = disabled;
                            uiInfo.cmnsSave.visible = visible;
                            break;
                        case "CMNS_SEARCH":
                            uiInfo.cmnsSearch.button = hasButton;
                            uiInfo.cmnsSearch.disabled = disabled;
                            uiInfo.cmnsSearch.visible = visible;
                            break;
                        case "CMNS_UPLOAD":
                            uiInfo.cmnsUpload.button = hasButton;
                            uiInfo.cmnsUpload.disabled = disabled;
                            uiInfo.cmnsUpload.visible = visible;
                            break;
                        case "CMNS_APPR":
                            uiInfo.cmnsAppr.button = hasButton;
                            uiInfo.cmnsAppr.disabled = disabled;
                            uiInfo.cmnsAppr.visible = visible;
                            break;
                    }
                });

                jsonTabPage.push(uiInfo);

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
            }
		}

		mfn_displayButton(uiInfo);
	}

    /**
     * @name fn_fullScreen
     * @description 페이지 Full 스크린 처리
     * @function
     */
    const fn_fullScreen = function(){

        let el = $(".tab-content > div.active").children().attr('id');
        let iframe = document.getElementById(el);
        let dc =iframe.contentDocument || iframe.contentWindow.document;

        if (!dc.fullscreenElement){
            if (dc.documentElement.requestFullscreen){
                dc.documentElement.requestFullscreen();
            } else if (dc.documentElement.webkitRequestFullscreen){
                dc.documentElement.webkitRequestFullscreen()
            } else if (dc.documentElement.msRequestFullscreen){
                dc.documentElement.msRequestFullscreen();
            }
        } else {
            if (dc.exitFullscreen){
                dc.exitFullscreen();
            } else if (dc.webkitExitFullscreen){
                dc.webkitExitFullscreen();
            } else if (dc.msExitFullscreen){
                dc.msExitFullscreen();
            }
        }
    }

    /**
     * @name cfn_openTabSearch
     * @description 공통버튼 Action : 조회
     * @function
     */
    function cfn_openTabSearch (obj){
        try {
            let object = JSON.parse(obj);
            if (!gfn_isEmpty(object)) {
                let target = object.target;
                /** left Menu에서 넘어온 해당 Tab의 대한 정보로 필터링 **/
                let data = sideJsonData.filter((item) => item.id == target);
                /** 현재 열려있는 탭인지 확인 **/
                let openFlag = tabJsonData.some((item) => item.targetid.replace("TAB_","") == target);

                if (openFlag) {
                    /** receive Tab이 열려 있는 상태에선 msg를 전달하여 VO 전달 **/
                    let iframe = "idxfrmJson_TAB_" + target;
                    let el = document.getElementById(iframe);
                    /** 해당 Tab open **/
                    SBUxMethod.set("tab_menu","TAB_"+target);
                    /** main > receive 로 parameter 전달 **/
                    el.contentWindow.postMessage(object);
                } else {
                    localStorage.setItem("callMain",JSON.stringify(object));
                    /** 현재 receive Tab이 없는경우 새로 오픈하며 중간에 로직을 위해서
                     * 직접 전달하지않고 localStorage를 사용하여 param 전달 **/
                    fn_actionGoPage(
                        data[0].url
                        , 'LEFT'
                        , data[0].id
                        , data[0].text
                        , data[0].pid
                    );
                }
            }
        } catch (e) {
            /** 전달인자가 비어있을경우 json parse exception **/
            console.error(e.toString());
        }
    }

    /**
     * @name fn_topMenuSet
     * @description 상단 메뉴 설정
     * @function
     */
    const fn_topMenuSet = async function () {
        let width = $("body > div.sbt-A-wrap > div.sbt-all-header > div").css("width");
        $("#idxTop_json > div").css({
            "width": "100%",
            "left": "0",
            "margin-left": "0"
        });
        $("#sbux_idxTop_json").css({
            "width": "calc(100% - 240px - " + width + ")",
            "overflow-x": "scroll"
        });

        const scrollContainer = document.querySelector('#sbux_idxTop_json');
        let isDown = false;
        let startX;
        let scrollLeft;
        let isDragging = false;

        scrollContainer.addEventListener('mousedown', (e) => {
            isDown = true;
            startX = e.pageX - scrollContainer.offsetLeft;
            scrollLeft = scrollContainer.scrollLeft;
            scrollContainer.style.cursor = 'grabbing';
            isDragging = false;
        });

        scrollContainer.addEventListener('mouseleave', () => {
            isDown = false;
            scrollContainer.style.cursor = 'grab';
        });

        scrollContainer.addEventListener('mouseup', () => {
            isDown = false;
            scrollContainer.style.cursor = 'grab';
        });

        scrollContainer.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            const x = e.pageX - scrollContainer.offsetLeft;
            const walk = (x - startX) * 2; // 드래그 속도 조정
            scrollContainer.scrollLeft = scrollLeft - walk;
            isDragging = true;
        });

        let data = await popMsg.search('');
        if (data.resultList.length > 0){
            $("#pop_cnt").text(data.resultList.length);
            fn_msgPopup();
        } else {
            $("#pop_wrap").css("display","none");
        }
    }

    /**
     * @name cfn_closeTab
     * @description 탭 메뉴 닫기
     * @param {String} _menuId
     * @function
     */
    function cfn_closeTab(_menuId){
        let menuId = 'TAB_' + _menuId;
        SBUxMethod.removeTab("tab_menu", menuId);
    }

    /**
     * @name fn_msgPopup
     * @description 사용자 알림 팝업
     * @function
     */
    const fn_msgPopup = function(){
        SBUxMethod.openModal('modal-msgAlarm');
        popMsg.init('');
    }

    /**
     * @name fn_popMsgRefresh
     * @description 사용자 알림 새로고침
     * @function
     */
    async function fn_popMsgRefresh(){
        let data = await popMsg.search('');
        if(data.resultList.length > 0){
            $("#pop_cnt").text(data.resultList.length);
        }else{
            $("#pop_wrap").css("display","none");
        }
    }

    /** 공통버튼 활성유무
     *  호출하는 innerframe :> window.parent.fn_toggleButtonDisable('save',true);
     * **/
    function fn_toggleButtonDisable(_btnName,_flag = false){
        let uiId = '#main-btn-' + _btnName;
        $(uiId).prop("disabled",_flag);
    }
</script>

</html>