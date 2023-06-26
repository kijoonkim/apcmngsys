<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <!------------------ 커스텀 테마 CSS ------------------>
    <link href="/resource/css/sbgrid_custom.css" rel="stylesheet" type="text/css">
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
        /* table{border-collapse: collapse;border-spacing: 0;}
        table,th{text-align:center;}
        table,td{padding:5px;}
        .tbl{width: 100%;border-top: 2px solid #888;border-bottom: 1px solid #ddd;text-align: left;} */
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
                                                <sbux-label id="srchLabel_1" name="label_norm" uitype="normal" text="시스템구분" wrap-class="sbt-label"></sbux-label>
                                            </div>
                                            <div class="sbt-col-right">
                                                <sbux-select id="comBoSysId" name="comBoSysId" uitype="single" jsondata-ref="jsonSearchCombo" unselected-text="선택" style="width:200px;"></sbux-select>
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
	                                <div id="menuTreeArea" style="width:100%;height:300px;"></div>
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
	                                        <sbux-input id="upMenuNm" name="upMenuNm" uitype="text" style="width:100%" readonly></sbux-input>
	                                        <sbux-input id="upMenuId" name="upMenuId" uitype="hidden"></sbux-input>
	                                    </td>
	                                    <th>시스템구분</th>
	                                    <td>
	                                        <sbux-input id="sysGb" name="sysGb" uitype="text" style="width:100%" readonly></sbux-input>
	                                        <sbux-input id="sysCd" name="sysCd" uitype="hidden"></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>메뉴ID</th>
	                                    <td>
	                                        <sbux-input id="menuId" name="menuId" uitype="text" required style="width:100%" readonly ></sbux-input>
	                                    </td>
	                                    <th>APC코드</th>
	                                    <td>
	                                        <sbux-input id="apcCd" name="apcCd" uitype="text" required style="width:100%"></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>메뉴명</th>
	                                    <td>
	                                        <sbux-input id="menuNm" name="menuNm" uitype="text" style="width:100%"></sbux-input>
	                                    </td>
	                                    <th>표시순서</th>
	                                    <td>
	                                        <sbux-input id="order" name="order" uitype="text" style="width:100%"></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>화면유형</th>
	                                    <td>
	                                    	<sbux-select id="comBoMenuType" name="comBoMenuType" uitype="single" jsondata-ref="jsonComboMenuType" onChange="selectChange(comBoMenuType)" unselected-text="선택" style="width:100%"></sbux-select>
	                                    </td>
	                                    <th>사용자유형</th>
	                                    <td>
	                                    	<sbux-select id="comBoUserType" name="comBoUserType" uitype="single" jsondata-ref="jsonComboUserType" unselected-text="선택" style="width:100%"></sbux-select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>화면URL</th>
	                                    <td>
	                                    	<sbux-input id="pageUrl" name="pageUrl" uitype="text" style="width:100%"></sbux-input>
	                                    </td>
	                                    <th>사용유무</th>
	                                    <td>
	                                    	<sbux-select id="comBoDelYn" name="comBoDelYn" uitype="single" jsondata-ref="jsonComBoDelYn" unselected-text="선택" style="width:100%"></sbux-select>
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

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
    });
    var grid; // 그리드를 담기위한 객체 선언
    var gridData = []; // 그리드의 참조 데이터 주소 선언
    // 사용유무 (임시)
    var jsonComBoDelYn = [
    	{'text': 'YES', 'value' : 'N'},
    	{'text': 'NO', 'value' : 'Y'}
    ];

    var jsonSearchCombo   = comCdLoad("SYS_ID");		//조회조건(시스템ID)
    var jsonComboUserType = comCdLoad("USER_TYPE");		// 사용자유형
    var jsonComboMenuType = comCdLoad("MENU_TYPE");		// 화면유형


    // 공통코드 COMBO 호출
    function comCdLoad(cdId){
    	let jsonComboData = [];
    	fetch("/co/cd/comBoCdDtls", {
  		  	method: "POST",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		cdId: cdId
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					data.resultList.forEach((item, index) => {
						let cdVlList = {
							'text': item.cdVlNm,
							'value': item.cdVl
						}
						jsonComboData.push(cdVlList);
					});
				}
  		);
    	return jsonComboData;
    }

    //신규 작성
    function fn_create(nRow) {
        if (nRow == undefined) {
            nRow = datagrid.getRow();
            if (nRow < 1) {
                alert("상위메뉴를 선택하세요.");
                return;
            }
        }
        if(datagrid.getRowData(datagrid.getRow()).menuType == "02"){
        	alert("상위메뉴를 선택하세요.");
            return;
        }
        SBUxMethod.set("gubun", "C");
        var sysGubun = _.find(jsonSearchCombo, {value: SBUxMethod.get("comBoSysId")});
        SBUxMethod.set("sysGb", sysGubun.text);
        SBUxMethod.set("sysCd", sysGubun.value);
        var rowData = datagrid.getRowData(nRow);
        SBUxMethod.set("upMenuId", rowData.menuId);
        SBUxMethod.set("upMenuNm", rowData.menuNm);
        SBUxMethod.attr("menuId", "readonly");
        SBUxMethod.set("menuId", "");
        SBUxMethod.set("apcCd", "");
        SBUxMethod.set("menuNm", "");
        SBUxMethod.set("order", "");
        SBUxMethod.set("comBoMenuType", "");
        SBUxMethod.set("comBoUserType", "");
        SBUxMethod.set("pageUrl", "");
        SBUxMethod.set("comBoDelYn", "N");	// 기본값 사용여부(N)
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
            deleteMenu();
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
            if (!SBUxMethod.get("menuNm")) {
                alert("메뉴명을 입력하세요.");
                return;
            }
            if (!SBUxMethod.get("apcCd")) {
                alert("APC코드를 입력하세요.");
                return;
            }
            if (!SBUxMethod.get("comBoMenuType")) {
                alert("화면유형을 선택해주세요.");
                return;
            }
            if (!SBUxMethod.get("comBoUserType")) {
                alert("사용자유형을 선택해주세요.");
                return;
            }

            saveMsg = "저장 하시겠습니까?";
        }
        else if (gubun === "M") {//수정
            saveMsg = "수정 하시겠습니까?";
        }
        if (confirm(saveMsg)) {
        	if(gubun === "C"){
        		console.log("신규 ");
        		menuInsert();
        	}else{
        		updateMenu();
        	}

        }
    }
    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var sysId = SBUxMethod.get("comBoSysId");
        if (!sysId) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        searchList(sysId);
    }

    //목록 조회
    function searchList(sysId){
    	var newGridData = [];
    	fetch("/co/menu/selectMenuList.do", {
  		  	method: "POST",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		sysId: sysId
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					data.resultList.forEach((item, index) => {
						const menuList = {
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
						newGridData.push(menuList);
					});
					gridData = newGridData;
					datagrid.rebuild();
				}
  		);
	}


    // 메뉴 등록
    function menuInsert(){

    	let upMenuId 		= SBUxMethod.get('upMenuId');		// 상위메뉴ID
    	let menuNm 			= SBUxMethod.get('menuNm');			// 메뉴이름
    	let apcCd 			= SBUxMethod.get('apcCd');			// APC코드
    	let order 			= SBUxMethod.get('order');			// 정렬순서
    	let comBoMenuType 	= SBUxMethod.get('comBoMenuType');	// 메뉴유형
    	let comBoUserType 	= SBUxMethod.get('comBoUserType');	// 사용자유형
    	let pageUrl 		= SBUxMethod.get('pageUrl');		// 화면URL

    	if(order === null || order === ""){
	    	let orderArray = [];
    		gridData.forEach((item, index)=>{
        		if(item.upMenuId == upMenuId){
        			orderArray.push(item.order)
        		}
        	});
    		order = Math.max.apply(null, orderArray) + 1;
    	}
		fetch("/co/menu/insertMenu.do", {
  		  	method: "POST",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		apcCd 		: apcCd,
  		  		upMenuId 	: upMenuId,
	  		  	menuNm 		: menuNm,
	  		  	indctSeq 	: order,
	  		  	menuType 	: comBoMenuType,
	  		    userType 	: comBoUserType,
	  		  	pageUrl 	: pageUrl
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					if(data.result == "1"){
						alert("신규 등록 되었습니다.");
						fn_search();
					}else{
						alert("등록 중 오류가 발생 되었습니다.");
					}
				}
  		);

    }

    // 메뉴 수정
    function updateMenu(){
    	let menuId 			= SBUxMethod.get('menuId');			// 메뉴ID(PK)
    	let menuNm 			= SBUxMethod.get('menuNm');			// 메뉴이름
    	let apcCd 			= SBUxMethod.get('apcCd');			// APC코드
    	let order 			= SBUxMethod.get('order');			// 정렬순서
    	let comBoMenuType 	= SBUxMethod.get('comBoMenuType');	// 메뉴타입
    	let comBoUserType 	= SBUxMethod.get('comBoUserType');	// 사용자유형
    	let pageUrl 		= SBUxMethod.get('pageUrl');		// 화면URL
    	let delYn 			= SBUxMethod.get('comBoDelYn');		// 사용유무

    	if(order === null || order === ""){
	    	let orderArray = [];
    		gridData.forEach((item, index)=>{
        		if(item.upMenuId == upMenuId){
        			orderArray.push(item.order)
        		}
        	});
    		order = Math.max.apply(null, orderArray) + 1;
    	}
		fetch("/co/menu/updateMenu.do", {
  		  	method: "POST",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		apcCd 		: apcCd,
  		  		menuId 		: menuId,
	  		  	menuNm 		: menuNm,
	  		  	indctSeq 	: order,
	  		  	menuType 	: comBoMenuType,
	  		    userType 	: comBoUserType,
	  		  	pageUrl 	: pageUrl,
	  		  	delYn 		: delYn
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					if(data.result == "1"){
						alert("수정 되었습니다.");
						fn_search();
					}else{
						alert("수정 중 오류가 발생 되었습니다.");
					}
				}
  		);
    }

    // 메뉴 삭제
    function deleteMenu(){
    	let menuId = SBUxMethod.get('menuId');		// 메뉴ID(PK)

		fetch("/co/menu/deleteMenu.do", {
  		  	method: "POST",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		menuId : menuId
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					if(data.result == "1"){
						alert("삭제 되었습니다.");
						fn_search();
						SBUxMethod.set("upMenuId", "");
				        SBUxMethod.set("upMenuNm", "");
				        SBUxMethod.attr("menuId", "readonly");
				        SBUxMethod.set("menuId", "");
				        SBUxMethod.set("apcCd", "");
				        SBUxMethod.set("menuNm", "");
				        SBUxMethod.set("order", "");
				        SBUxMethod.set("comBoMenuType", "");
				        SBUxMethod.set("comBoUserType", "");
				        SBUxMethod.set("pageUrl", "");
				        SBUxMethod.set("comBoDelYn", "");
					}else{
						alert("삭제 중 오류가 발생 되었습니다.");
					}
				}
  		);
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

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'menuTreeArea';
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
    // 상세 정보
    function fn_view() {
        var nRow = datagrid.getRow();
        if (nRow < 2) {
            return;
        }
        SBUxMethod.set("gubun", "M");
        //Set Menu Info
        var sysGubun = _.find(jsonSearchCombo, {value: SBUxMethod.get("comBoSysId")});
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
        SBUxMethod.set("comBoMenuType", rowData.menuType);
        SBUxMethod.set("comBoUserType", rowData.userType);
        // PAGE_URL NULL 일때 빈칸처리"
        if(rowData.userType == null || rowData.userType == "null" || rowData.userType == "" ){
	        SBUxMethod.set("pageUrl", "");
        }else{
	        SBUxMethod.set("pageUrl", rowData.pageUrl);
        }

        // 화면유형 : 01 -> 입력불가, 02 -> PAGE_URL 입력
        if(rowData.menuType == "01"){
        	SBUxMethod.attr("pageUrl", "readonly","true");
        }else{
        	SBUxMethod.attr("pageUrl", "readonly","false");
        }
        SBUxMethod.set("comBoDelYn", rowData.delYn);
    }

    // 화면유형 ChangeEvent : 화면유형(01) PAGE_URL -> NULL, 화면유형(02) -> PAGE_URL(MAPPING_URL)
    function selectChange(args){
    	if(SBUxMethod.get('comBoMenuType') == "01"){
    		SBUxMethod.set("pageUrl", "");
    		SBUxMethod.attr("pageUrl", "readonly","true");
    	}else{
    		SBUxMethod.set("pageUrl", datagrid.getRowData(datagrid.getRow()).pageUrl);
    		SBUxMethod.attr("pageUrl", "readonly","false");
    	}
    }
</script>

</body>
</html>