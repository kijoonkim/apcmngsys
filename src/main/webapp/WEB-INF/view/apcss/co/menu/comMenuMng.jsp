<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
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
                        <sbux-button id="btn_save" name="btn_save" uitype="normal" wrap-class="sbt-btn-reset" text="저장"onclick="fn_save"></sbux-button>
                        <sbux-button id="btn_search" name="btn_search" uitype="normal" wrap-class="sbt-btn-search" text="조회" onclick="fn_search"></sbux-button>
                    </div>
                    <!--조회 영역-->
			        <div class="sbt-con-wrap">
				        <div class="sbt-search-wrap">
                            <div class="sbt-wrap-body-con">
                                <div class="sbt-wrap-body">
                                    <div class="sbt-search-row">
                                        <!--col -->
                                        <div class="sbt-search-col popup-search-col">
                                            <div class="sbt-col-left">
                                                <sbux-label id="srch-label-sysId" name="srch-label-sysId" uitype="normal" text="시스템구분" wrap-class="sbt-label"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="srch-select-sysId" name="srch-select-sysId" uitype="single" jsondata-ref="jsonComSysId" unselected-text="선택" style="width:200px;"></sbux-select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sbt-con-wrap">
                	<ul>
                    <li style="display:inline-block;float:left;width: 49.5%;vertical-align:top;">
	                    <div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-body">
	                            <div class="sbt-grid">
	                                <!-- SBGrid를 호출합니다. -->
	                                <div id="sb-area-grdMenuTree" style="width:100%;height:300px;"></div>
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
	                                        <sbux-input id="dtl-input-upMenuNm" name="dtl-input-upMenuNm" uitype="text" style="width:100%" readonly></sbux-input>
	                                        <sbux-input id="dtl-input-upMenuId" name="dtl-input-upMenuId" uitype="hidden"></sbux-input>
	                                    </td>
	                                    <th>시스템구분</th>
	                                    <td>
	                                        <sbux-input id="dtl-input-sysNm" name="dtl-input-sysNm" uitype="text" style="width:100%" readonly></sbux-input>
	                                        <sbux-input id="dtl-input-sysId" name="dtl-input-sysId" uitype="hidden"></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>메뉴ID</th>
	                                    <td>
	                                        <sbux-input id="dtl-input-menuId" name="dtl-input-menuId" uitype="text" required style="width:100%" readonly ></sbux-input>
	                                    </td>
	                                    <th>APC코드</th>
	                                    <td>
	                                        <sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="text" required style="width:100%"></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>메뉴명</th>
	                                    <td>
	                                        <sbux-input id="dtl-input-menuNm" name="dtl-input-menuNm" uitype="text" style="width:100%"></sbux-input>
	                                    </td>
	                                    <th>표시순서</th>
	                                    <td>
	                                        <sbux-input id="dtl-input-order" name="dtl-input-order" uitype="text" style="width:100%"></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>화면유형</th>
	                                    <td>
	                                    	<sbux-select id="dtl-select-menuType" name="dtl-select-menuType" uitype="single" jsondata-ref="jsonComMenuType" onChange="onSelectMenuTypeChange(this)" unselected-text="선택" style="width:100%"></sbux-select>
	                                    </td>
	                                    <th>사용자유형</th>
	                                    <td>
	                                    	<sbux-select id="dtl-select-userType" name="dtl-select-userType" uitype="single" jsondata-ref="jsonComUserType" unselected-text="선택" style="width:100%"></sbux-select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>화면URL</th>
	                                    <td>
	                                    	<sbux-input id="dtl-input-pageUrl" name="dtl-input-pageUrl" uitype="text" style="width:100%"></sbux-input>
	                                    </td>
	                                    <th>사용유무</th>
	                                    <td>
	                                    	<sbux-select id="dtl-select-delYn" name="dtl-select-delYn" uitype="single" jsondata-ref="jsonComDelYn" unselected-text="선택" style="width:100%"></sbux-select>
	                                    </td>
	                                </tr>
	                            </table>
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


    var grid; // 그리드를 담기위한 객체 선언
    var gridData = []; // 그리드의 참조 데이터 주소 선언

    /*
    var jsonSearchCombo   = comCdLoad("SYS_ID");		//조회조건(시스템ID)
    var jsonComboUserType = comCdLoad("USER_TYPE");		// 사용자유형
    var jsonComboMenuType = comCdLoad("MENU_TYPE");		// 화면유형
    var jsonComDelYn = 
    */
    	
	var jsonComSysId 	= [];	// 시스템유형	srch-select-sysId		SYS_ID
    var jsonComMenuType = [];	// 메뉴유형	dtl-select-menuType		MENU_TYPE
    var jsonComUserType = [];	// 사용자유형	dtl-select-userType		USER_TYPE
    var jsonComDelYn 	= [];	// 삭제유무	dtl-select-delYn		REVERSE_YN

    // grid 초기화
    var grdMenuTreeList; // 그리드를 담기위한 객체 선언
    var jsonMenuTreeList = []; // 그리드의 참조 데이터 주소 선언
    
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {		
		fn_createGrid();
		fn_initSBSelect();
	});    
    
    /**
     *
     */
    const fn_initSBSelect = async function() {
		
    	// 조회 SB select
	 	gfn_setComCdSBSelect('srch-select-sysId', jsonComSysId, 'SYS_ID');	// 시스템유형
	 	
	 	// 상세 SB select
	 	gfn_setComCdSBSelect('dtl-select-menuType', jsonComMenuType, 'MENU_TYPE');	// 메뉴유형	 	
	 	gfn_setComCdSBSelect('dtl-select-userType', jsonComUserType, 'USER_TYPE');	// 사용자유형	 	
	 	gfn_setComCdSBSelect('dtl-select-delYn', jsonComDelYn, 'REVERSE_YN');		// 삭제유무
    }
    
    
    /**
     * @name fn_createGrid
     * @description 그리드 초기화
     * @function
     */
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdMenuTree';
	    SBGridProperties.id = 'grdMenuTreeList';
	    SBGridProperties.jsonref = 'jsonMenuTreeList';
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
        grdMenuTreeList = _SBGrid.create(SBGridProperties);
        grdMenuTreeList.bind('click', 'fn_view');
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    var objMenuList = {
        "Add": {
            "name": "메뉴 추가",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "a",			//단축키
            "callback": fn_ctxtAddRow,	//콜백함수명
            "callbackparam": ['grdMenuTreeList', true]// 콜백함수 파라미터 전달
        },
        "Delete": {
            "name": "메뉴삭제",
            "accesskey": "d",
            "callback": fn_ctxtDelRow
        }
    };
    
	/**
     * @name fn_ctxtAddRow
     * @description 메뉴추가 (CTXT)
     */
    function fn_ctxtAddRow(arg1, arg2, arg3) {
        /* 두번째 파라미터 부터 callbackparam 속성으로 설정한 값을 반환할 수 있습니다. */
        var nRow = grdMenuTreeList.getRow();
        if (nRow > 0) {
            fn_create(nRow);
        }
    };
    
	/**
     * @name fn_ctxtDelRow
     * @description 메뉴삭제 (CTXT)
     */
    function fn_ctxtDelRow() {
    	fn_delete();
    };
    
    /**
     * @name fn_create
     * @description 신규 작성
     * @param {number} nRow	행번호
     */
    function fn_create(nRow) {
        
    	if (nRow == undefined) {
            nRow = grdMenuTreeList.getRow();
            if (nRow < 1) {
                //alert("상위메뉴를 선택하세요.");
            	alert(gfn_getComMsg("W0001", "상위메뉴"));	//	W0001	{0}을/를 선택하세요.
                return;
            }
        }
        
    	var rowData = grdMenuTreeList.getRowData(nRow);
    	
        if (rowData.menuType == "02") {
        	//alert("상위메뉴를 선택하세요.");
        	alert(gfn_getComMsg("W0001", "상위메뉴"));	//	W0001	{0}을/를 선택하세요.
            return;
        }
        
        var sysIdInfo = _.find(jsonComSysId, {value: SBUxMethod.get("srch-select-sysId")});
        SBUxMethod.set("dtl-input-sysNm", sysIdInfo.text);
        SBUxMethod.set("dtl-input-sysId", sysIdInfo.value);
        
        SBUxMethod.set("dtl-input-upMenuId", rowData.menuId);
        SBUxMethod.set("dtl-input-upMenuNm", rowData.menuNm);
        SBUxMethod.attr("dtl-input-menuId", "readonly");
        SBUxMethod.set("dtl-input-menuId", "");
        SBUxMethod.set("dtl-input-apcCd", "");
        SBUxMethod.set("dtl-input-menuNm", "");
        SBUxMethod.set("dtl-input-order", "");
        SBUxMethod.set("dtl-select-menuType", "");
        SBUxMethod.set("dtl-select-userType", "");
        SBUxMethod.set("dtl-input-pageUrl", "");
        SBUxMethod.set("dtl-select-delYn", "N");	// 기본값 사용여부(N)
    }
	

 	/**
     * @name fn_save
     * @description 저장
     */
    function fn_save() {
    	
    	// validate check
    	if (!SBUxMethod.get("dtl-input-upMenuId")) {
    		return;	// 상위메뉴가 없으면 return
    	}
    	
    	// check 메뉴명
        if (!SBUxMethod.get("dtl-input-menuNm")) {
        	alert(gfn_getComMsg("W0002", "메뉴명"));	//	W0002	{0}을/를 입력하세요.
            return;
        }        
    	// check APC코드
        if (!SBUxMethod.get("dtl-input-apcCd")) {
            alert(gfn_getComMsg("W0002", "APC코드"));	//	W0002	{0}을/를 입력하세요.
            return;
        }
        // check 화면유형
        if (!SBUxMethod.get("dtl-select-menuType")) {
        	alert(gfn_getComMsg("W0001", "화면유형"));	//	W0001	{0}을/를 선택하세요.
            return;
        }
        // check 사용자유형
        if (!SBUxMethod.get("dtl-select-userType")) {
            alert(gfn_getComMsg("W0001", "사용자유형"));	//	W0001	{0}을/를 선택하세요.
            return;
        }
    	
    	/**
    	 * @type {string}
    	 */
    	let menuId = SBUxMethod.get("dtl-input-menuId");
    	
    	/**
    	 * @type {string}
    	 */
    	let saveMsg = "";
    	
        if (gfn_isEmpty(menuId)) {	//신규
            saveMsg = gfn_getComMsg("Q0001", "등록");	//	Q0001	{0} 하시겠습니까?
			fn_insertMenu(confirm(saveMsg));
        } else {
            saveMsg = gfn_getComMsg("Q0001", "변경");	//	Q0001	{0} 하시겠습니까?
            fn_updateMenu(confirm(saveMsg));
        }
    }
    
 	/**
     * @name fn_delete
     * @description 메뉴삭제
     */
    function fn_delete() {
        let menuId = SBUxMethod.get("srch-input-menuId");
        if (!menuId) {
            //alert("메뉴를 선택하세요.");
            alert(gfn_getComMsg("W0001", "메뉴"));	//	W0001	{0}을/를 선택하세요.
            return;
        }
        
        let delMsg = gfn_getComMsg("Q0001", "삭제");	//	Q0001	{0} 하시겠습니까?
        
		fn_deleteMenu(confirm(delMsg));        
    }
    
 	
 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
        
        if (!SBUxMethod.get("srch-select-sysId")) {
        	alert(gfn_getComMsg("W0001", "시스템구분"));	//	W0001	{0}을/를 선택하세요.
            return;
        }
    	
    	// set pagination
    	let pageSize = grdMenuTreeList.getPageSize();
    	let pageNo = 1;
        
    	fn_setGrdMenuTreeList(pageSize, pageNo);
    }
    
    /**
     * @name fn_setGrdMenuTreeList
     * @description 메뉴트리 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdMenuTreeList = async function(pageSize, pageNo) {
    	
    	// form clear 
    	fn_clearForm();
    	
    	grdMenuTreeList.clearStatus();

		let sysId = SBUxMethod.get("srch-select-sysId");
		
        const postJsonPromise = gfn_postJSON("/co/menu/selectMenuList.do", {
        	sysId: sysId,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
		});
        
        const data = await postJsonPromise;
        
        try {
        	
        	/** @type {number} **/
    		let totalRecordCount = 0;
        	
        	jsonMenuTreeList.length = 0;
        	data.resultList.forEach((item, index) => {
				const menu = {
					level: item.menuLvl,
					upMenuId: item.upMenuId,
					upMenuNm: item.upMenuNm,
					apcCd : item.apcCd,
					order: item.indctSeq,
					menuId : item.menuId,
					menuNm : item.menuNm,
					menuType : item.menuType,
					userType : item.userType,
					pageUrl : item.pageUrl,
					delYn : item.delYn
				}
				jsonMenuTreeList.push(menu);
				
				totalRecordCount = jsonMenuTreeList.length;
			});
        	
        	grdMenuTreeList.rebuild();
        	//document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
    		alert(gfn_getComMsg("E0001"));	//	E0001	오류가 발생하였습니다.
        }
    } 
    
    /**
     * @name fn_insertMenu
     * @description 메뉴등록
     * @param {boolean} isConfirmed
     */
    const fn_insertMenu = async function(isConfirmed) {

		if (!isConfirmed) {
			return;
		}
		
    	let upMenuId 		= SBUxMethod.get('dtl-input-upMenuId');		// 상위메뉴ID
    	let menuNm 			= SBUxMethod.get('dtl-input-menuNm');			// 메뉴이름
    	let apcCd 			= SBUxMethod.get('dtl-input-apcCd');			// APC코드
    	let order 			= SBUxMethod.get('dtl-input-order');			// 정렬순서
    	let menuType 		= SBUxMethod.get('dtl-select-menuType');	// 메뉴유형
    	let userType 		= SBUxMethod.get('dtl-select-userType');	// 사용자유형
    	let pageUrl 		= SBUxMethod.get('dtl-input-pageUrl');		// 화면URL

    	if (gfn_isEmpty(order)){
	    	let orderArray = [];
	    	jsonMenuTreeList.forEach((item, index)=>{
        		if(item.upMenuId == upMenuId){
        			orderArray.push(item.order)
        		}
        	});
    		order = Math.max.apply(null, orderArray) + 1;
    	}
    	
    	const postJsonPromise = gfn_postJSON("/co/menu/insertMenu.do", {
		  		apcCd 		: apcCd,
  		  		upMenuId 	: upMenuId,
	  		  	menuNm 		: menuNm,
	  		  	indctSeq 	: order,
	  		  	menuType 	: menuType,
	  		    userType 	: userType,
	  		  	pageUrl 	: pageUrl  	        	
		});
    	
		const data = await postJsonPromise;
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert(gfn_getComMsg("I0001"));	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        		alert(gfn_getComMsg("E0001"));	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
    }

    /**
     * @name updateMenu
     * @description 메뉴정보 변경
     * @param {boolean} isConfirmed
     */     
	const fn_updateMenu = async function(isConfirmed) {

		if (!isConfirmed) {
			return;
		}
		
    	let menuId 			= SBUxMethod.get('dtl-input-menuId');		// 메뉴ID(PK)
    	let upMenuId 		= SBUxMethod.get('dtl-input-upMenuId');		// 상위메뉴ID
    	let menuNm 			= SBUxMethod.get('dtl-input-menuNm');		// 메뉴이름
    	let apcCd 			= SBUxMethod.get('dtl-input-apcCd');		// APC코드
    	let order 			= SBUxMethod.get('dtl-input-order');		// 정렬순서
    	let menuType 		= SBUxMethod.get('dtl-select-menuType');	// 메뉴유형
    	let userType 		= SBUxMethod.get('dtl-select-userType');	// 사용자유형
    	let pageUrl 		= SBUxMethod.get('dtl-input-pageUrl');		// 화면URL
    	let delYn 			= SBUxMethod.get('dtl-select-delYn');		// 사용유무
    	
    	const postJsonPromise = gfn_postJSON("/co/menu/updateMenu.do", {
	  		apcCd 		: apcCd,
	  		menuId 		: menuId,
  		  	menuNm 		: menuNm,
  		  	indctSeq 	: order,
  		  	menuType 	: menuType,
  		    userType 	: userType,
  		  	pageUrl 	: pageUrl  	        	
		});
	
		const data = await postJsonPromise;
	    
	    try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		alert(gfn_getComMsg("I0001"));	// I0001	처리 되었습니다.
	    		fn_search();
	    	} else {
	    		alert(data.resultMessage);
	    		alert(gfn_getComMsg("E0001"));	//	E0001	오류가 발생하였습니다.
	    	}
	    } catch(e) {        	
	    }
    	
    }

    /**
     * @name fn_deleteMenu
     * @description 메뉴정보 삭제
     * @param {boolean} isConfirmed
     */     
   	const fn_deleteMenu = async function(isConfirmed) {

 		if (!isConfirmed) {
 			return;
 		}
 		
		let menuId = SBUxMethod.get('dtl-input-menuId');		// 메뉴ID(PK)

		const postJsonPromise = gfn_postJSON("/co/menu/deleteMenu.do", {
			menuId 		: menuId 	        	
		});
	
		const data = await postJsonPromise;
	    
	    try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		alert(gfn_getComMsg("I0001"));	// I0001	처리 되었습니다.
	    		fn_search();
	    	} else {
	    		alert(data.resultMessage);
	    		alert(gfn_getComMsg("E0001"));	//	E0001	오류가 발생하였습니다.
	    	}
	    } catch(e) {        	
	    }
    }

	
    /**
     * @name fn_view
     * @description 선택메뉴 상세정보 표시
     */
    const fn_view = function () {
    	
        let nRow = grdMenuTreeList.getRow();
        if (nRow < 2) {
            return;
        }
        
        var rowData = grdMenuTreeList.getRowData(nRow);
        
        var sysIdInfo = _.find(jsonComSysId, {value: SBUxMethod.get("srch-select-sysId")});
        SBUxMethod.set("dtl-input-sysNm", sysIdInfo.text);
        SBUxMethod.set("dtl-input-sysId", sysIdInfo.value);
        
        SBUxMethod.set("dtl-input-upMenuId", rowData.upMenuId);
        SBUxMethod.set("dtl-input-upMenuNm", rowData.upMenuNm);
        SBUxMethod.attr("dtl-input-menuId", "readonly", true);
        SBUxMethod.set("dtl-input-menuId", rowData.menuId);
        SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);
        SBUxMethod.set("dtl-input-menuNm", rowData.menuNm);
        SBUxMethod.set("dtl-input-order", rowData.order);
        SBUxMethod.set("dtl-select-menuType", rowData.menuType);
        SBUxMethod.set("dtl-select-userType", rowData.userType);
        SBUxMethod.set("dtl-input-pageUrl", rowData.pageUrl);
        SBUxMethod.set("dtl-select-delYn", rowData.delYn);	// 기본값 사용여부(N)
        
        // 화면유형 : 01 -> 입력불가, 02 -> PAGE_URL 입력
        if(rowData.menuType == "01"){
        	SBUxMethod.attr("dtl-input-pageUrl", "readonly", "true");
        }else{
        	SBUxMethod.attr("dtl-input-pageUrl", "readonly", "false");
        }
    }
    
    /**
     * @name fn_clearForm
     * @description 상세정보 초기화
     */
    const fn_clearForm = function() {
		SBUxMethod.set("dtl-input-upMenuId", "");
        SBUxMethod.set("dtl-input-upMenuNm", "");
        SBUxMethod.attr("dtl-input-menuId", "readonly");
        SBUxMethod.set("dtl-input-menuId", "");
        SBUxMethod.set("dtl-input-apcCd", "");
        SBUxMethod.set("dtl-input-menuNm", "");
        SBUxMethod.set("dtl-input-order", "");
        SBUxMethod.set("dtl-select-menuType", "");
        SBUxMethod.set("dtl-select-userType", "");
        SBUxMethod.set("dtl-input-pageUrl", "");
        SBUxMethod.set("dtl-select-delYn", "");
    }
    
    /**
     * ui event
     */
    
    /**
     * @name onSelectMenuTypeChange
     * @description 화면유형 ChangeEvent : 화면유형(01) PAGE_URL -> NULL, 화면유형(02) -> PAGE_URL(MAPPING_URL)
     */
    function onSelectMenuTypeChange(args){
    	if (SBUxMethod.get('dtl-select-menuType') == "01"){
    		SBUxMethod.set("dtl-input-pageUrl", "");
    		SBUxMethod.attr("dtl-input-pageUrl", "readonly","true");
    	} else {
    		SBUxMethod.set("dtl-input-pageUrl", grdMenuTreeList.getRowData(grdMenuTreeList.getRow()).pageUrl);
    		SBUxMethod.attr("dtl-input-pageUrl", "readonly","false");
    	}
    }
</script>

</body>
</html>