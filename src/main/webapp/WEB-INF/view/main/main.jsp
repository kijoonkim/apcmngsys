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
        

.button {
  background-color: #04AA6D; /* Green */
  border: none;
  color: white;
  padding: 2px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 2px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 8px;
}

.button:disabled {
  background: #CCC;
  border: 1px solid #CCC;
  pointer-events: none;
}

.button-green {
  background-color: #04AA6D;
  color: white;
  border: 1px solid #04AA6D;
}

.button-green:hover {
  background-color: white; 
  color: black; 
}

.button-blue {
  background-color: #008CBA;
  color: white;
  border: 1px solid #008CBA;
}

.button-blue:hover {
  background-color: white; 
  color: black; 
}

.button-red { 
  background-color: #f44336;
  color: white;
  border: 1px solid #f44336;
}

.button-red:hover {
  background-color: white; 
  color: black;
}

.button-gray {
  background-color: #e7e7e7;
  color: black;
  border: 1px solid #e7e7e7;
}

.button-gray:hover {
  background-color: white;
  color: black;
}

.button-black {
  background-color: #555555;
  color: white;
  border: 1px solid #555555;
}

.button-black:hover {
  background-color: white;
  color: black;
}

        
        
    </style>
</head>
<body id="mainBody" oncontextmenu="return false;">
<!-- inline scripts related to this page -->
<script type="text/javascript">

    const lv_tabPrefix = "idxfrmJson_TAB_";
    let lv_frmId = "";
    let prvTabMenuId = "";    

    
    const jsonTabPage = [];
    
    const jsonCommonBtn = [];
    
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

    /**
     * @name fn_selectTopMenu
     * @description 상단메뉴조회
     * @function
     */
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
                //, 'targetvalue': tabName + '_value'
                , 'targetvalue': tabName
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

            //await fn_afterAddTab(menuNo);
            
    	} else {
    		if(data.id == "PD" || data.id == "FM"){
           		SBUxMethod.showTab('tab_menu','TAB_PD_009');
            }else{
            	SBUxMethod.hideTab('tab_menu','TAB_PD_009');
            }
    	}
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
                    url: item.pageUrl,
                    prsnaYn : item.prsnaInfoYn,
                    bmkYn	: item.bmkYn
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
            document.querySelector('.sbux-sidemeu-title-wrap>div').innerHTML = '<div style="font-size:18px; text-align: center">'+title+'<div>';

            if (idx >= 0 && _menuId == undefined && !gfn_isEmpty(sideJsonData[idx].url)) {
                fn_actionGoPage(
                    sideJsonData[idx].url
                    , "LEFT"
                    , sideJsonData[idx].id
                    , sideJsonData[idx].text
                    , sideJsonData[idx].pid
                );
            }
            if(gv_userType === "00" || gv_userType ==="01"){
            	document.querySelector("#idxSide_menu > div.sbux-sidemeu-title-wrap > div").innerHTML += '<div style="font-size:18px; text-align: center">관리 시스템<div>';
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }

    }

    /**
     * @name fn_selectMenu
     * @description 메뉴 선택
     * @function
     */
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

        try {
            insertComLog(data);
        } catch (err){
            console.log(err);
        }

    }
    
    //로그
    function insertComLog(data){
    	var userName = "${loginVO.name}";
    	var apc_cd = "${loginVO.apcCd}";
    	var prsnaYn = data.customData.prsnaYn;

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

    }

    //화면 이동
    const maxTebMenuCnt = 11;//메뉴탭 최대 허용 개수(10)
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
                    , 'targetvalue': tabName
                    , 'targetname': 'frmJson'
                    , 'link': '/co/menu/openPage.do/' + _menuNo	// _url
                    , 'closeicon': true
                };
                
                SBUxMethod.addTab('tab_menu', jsonTabSelect);
            } else {
                SBUxMethod.selectTab(tabName);
            }
        }
    }

    /**
     * @param {string} _menuId
     */
    async function fn_afterAddTab(_menuId) {

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
     * @param {string} menuNo
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

    //Set breadcrumbs
    function fn_setBreadcrumbs(menuNo, menuNm) {
    	
        menuJsonB.length = 0;
        menuJsonB.push(
            {"order": 10, "id": "id_1", "pid": "", "text": "홈"}
        );

        //부모메뉴정보
        var menuInfo = _.find(sideJsonData, {id: menuNo});
        var upMenuNo = menuInfo.pid;
        var upMenuInfo = _.find(menuJson, {id: upMenuNo});
        if (!gfn_isEmpty(upMenuInfo.pid)) {
            var topMenuInfo = _.find(menuJson, {id: upMenuInfo.pid});

            menuJsonB.push(
                {"order": 20, "id": topMenuInfo.id, "pid": "", "text": topMenuInfo.text, "url": topMenuInfo.url}
            );
            
        }
        menuJsonB.push(
            {"order": 30, "id": upMenuInfo.id, "pid": upMenuInfo.pid, "text": upMenuInfo.text, "url": upMenuInfo.url}
        );
        menuJsonB.push(
            {"order": 40, "id": menuNo, "pid": upMenuNo, "text": menuNm, "url": menuInfo.url}
        );
        if (menuInfo.bmkYn == "Y"){
        	menuJsonB.push(
                    {"order": 50, "id": menuNo, "pid": upMenuNo, "text": '⭐', "value" : "Y"}
                );
        }else if(menuInfo.bmkYn == "N"){
        	menuJsonB.push(
                    {"order": 50, "id": menuNo, "pid": upMenuNo, "text": '☆', "value" : "N"}
                );
        }
        SBUxMethod.refresh('breadcrumb');
    }

    const fn_setBreadcrumbsHome = function() {
    	menuJsonB.length = 0;
    	menuJsonB.push(
            {"order": "10", "id": "id_1", "pid": "", "text": "홈"}
        );
    	SBUxMethod.refresh('breadcrumb');
    }


    //선택한 탭메뉴의 정보를 가져와 메뉴정보 설정
    function fn_setMenuInfo(args) {

        var idx = _.findLastIndex(tabJsonData, {text: args});
        var tabObj = tabJsonData[idx];
        var tabId = tabObj.targetid;
        var menuId = tabId.substring(tabId.indexOf("_")+1);

        var menuInfo = _.find(sideJsonData, {id: menuId});

        if (gfn_isEmpty(menuInfo)) {
        	// home
        	fn_setBreadcrumbsHome();
            prvTabMenuId = "";
            lv_frmId = "";
        	return;
        }

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

        if (prvTabMenuId !== menuId) {
            fn_afterSeletTab(menuId);
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
    
    function fn_selectTabMenu(_selectId, _selectJson) {
        fn_afterAddTab(_selectId.substring(_selectId.indexOf("_")+1));
    }

    //메뉴탭을 모두 닫으면 업무 영역 숨김 처리
    function fn_chkTabList() {
    	
    	if (gfn_isEmpty()) {
    		fn_clearPrvTabInfo();
    	}
    	
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
            <brand-item text="APC통합지원" image-src="/resource/images/header_logo.png">
            </brand-item>
        </sbux-menu>
        <div class="user-info-wrap">
            <c:if test="${loginVO != null && loginVO.id != null}">
            	<c:set scope="request" var="userName" value="${loginVO.name}"></c:set>
                <span class="name-t"><c:out value='${userName}'></c:out></span>님 반갑습니다.
				<span style="cursor: pointer;font-size:20px;margin-left:5px;" id="lbl-autoRefresh" onclick="fn_setAutoRefresh()">🔒</span>
                <ul class="user-login-menu">
                    <li style="background-color:#149FFF;">
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
    </div>
    <div class="main">
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
		                    onclick="fn_bmkYn()"
		            ></sbux-breadcrumb>
        		</div>
        		<div class="col-sm-6">
        			
					<c:choose>
						<c:when test="${serverType eq 'prd'}">
						</c:when>
						<c:otherwise>
							<div style="position: relative; text-align: right; margin: 3px;">
								<button id="main-btn-init" class="button button-blue" onclick="mfn_init()">초기화 🔃</button>
		        				<button id="main-btn-add" class="button button-blue" onclick="mfn_add()">신규 ➕</button>
		        				<button id="main-btn-save" class="button button-red" onclick="mfn_save()">저장 💾</button>
		        				<button id="main-btn-del" class="button button-black" onclick="mfn_del()">삭제 🗑️</button>
		        				<button id="main-btn-search" class="button button-green" onclick="mfn_search()">조회 🔍</button>
		        			</div>
						</c:otherwise>
					</c:choose>
        		</div>
        	</div>

            <!--full content-->
            <div class="sbt-wrap-full">
                <!--탭 입력 영역-->
                <div class="sbt-input-tab">
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

    //only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	document.querySelector("#lbl-autoRefresh").style.display = "none";
        initMain();
        var iframe = document.getElementById('idxfrmJson');
        iframe.scrolling = 'auto';
        
        mfn_displayButton();
        
    });
    window.addEventListener('message',function(event){
       if(event.data == 'sideMenuOff'){
           SBUxMethod.closeSideMenu('side_menu');
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

    const fn_bmkYn = async function(){

    	let breadcrumb = SBUxMethod.getBreadcrumb("breadcrumb");
    	let order = breadcrumb.order;
    	if(order == "50"){

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

    const initMain = async function() {
        var tabName = "TAB_CO_014";
        var menuNo = "CO_014";
        var jsonTabSelect = {
            'id': tabName
            , 'pid': '-1'
            , 'text': '🏠'	//'대시보드'
            , 'targetid': tabName
            , 'targetvalue': tabName
            , 'targetname': 'frmJson'
            , 'link': '/co/menu/openPage.do/' + menuNo	// _url
            , 'closeicon': false
        };
        SBUxMethod.addTab('tab_menu', jsonTabSelect);
        //화면이력관리용 data
        var data = {
        		customData : {prsnaYn : null},
        		id : tabName,
        		text : "대시보드",
        		prslType: "M1"
        }

       	insertComLog(data);

        fn_setLeftMenu(menuJson[0].id, menuJson[0].text);

        fn_getSysInfo();
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
	
	const mfn_displayButton = function (_uiInfo) {
		
		const btnInit = document.getElementById("main-btn-init");
		const btnAdd = document.getElementById("main-btn-add");
		const btnSave = document.getElementById("main-btn-save");
		const btnDel = document.getElementById("main-btn-del");
		const btnSearch = document.getElementById("main-btn-search");
		
		btnInit.disabled = true;
		btnAdd.disabled = true;
		btnDel.disabled = true;
		btnSave.disabled = true;
		btnSearch.disabled = true;
		
		btnInit.style.display = "none";
		btnAdd.style.display = "none";
		btnDel.style.display = "none";
		btnSave.style.display = "none";
		btnSearch.style.display = "none";
		
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
        		}
			}
			
			let _userId;
       		<c:set scope="request" var="userId" value="${loginVO.id}"></c:set>
       		_userId = '<c:out value='${userId}'></c:out>';

           	if (!gfn_isEmpty(_userId)) {
           		const postJsonPromise = gfn_postJSON(
						"/co/authrt/selectUserAuthrtCmnsBtnList.do", 
						{menuId: _menuId, userId: _userId}, 
						"main", 
						true
					);
		        const data = await postJsonPromise;
		        try {
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
			
		}
		
		mfn_displayButton(uiInfo);
		
	}
	
	
</script>
</html>