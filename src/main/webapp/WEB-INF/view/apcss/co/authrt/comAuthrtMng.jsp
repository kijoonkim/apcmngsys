<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>


<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->

<!-- section============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->

<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header">
			<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
			<div class="ad_tbl_top">
				<div class="ad_tbl_toplist">
					<sbux-button id="btnSave" name="btnSave" uitype="normal" wrap-class="btn btn-sm btn-outline-danger sbt-btn-reset" text="저장"onclick="fn_save"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" wrap-class="btn btn-sm btn-outline-danger sbt-btn-reset" text="삭제" onclick="fn_delete"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" wrap-class="btn btn-sm btn-primary sbt-btn-search" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>
		</div>
		<div>
		</div>
		<div class="box-body">
		
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 15%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 4%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_c">시스템구분</th>
							<td class="ta_r" colspan="2">
								<sbux-select class="form-control input-sm" id="srch-slt-sysId" name="srch-slt-sysId" uitype="single" jsondata-ref="jsonComSysId" unselected-text="선택"></sbux-select>									
							</td>
							<th class="ta_c">권한명</th>
							<td colspan="1" class="td_input" style="border-right:hidden;">
								<sbux-input class="form-control input-sm" id="srch-inp-authrtNm" name="srch-inp-authrtNm" uitype="text" onkeyenter="fn_search"></sbux-input>
							</td>
							<th class="ta_c">APC코드</th>
							<td colspan="1" class="td_input" style="border-right:hidden;">
								<sbux-input class="form-control input-sm" id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" onkeyenter="fn_search"></sbux-input>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<br>				
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->							
			<div class ="row h-100">
				<div class="col-sm-5">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">권한그룹목록</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
							<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" wrap-class="btn btn-sm btn-outline-danger sbt-btn-reset" text="행추가" onclick="fn_addRow"></sbux-button>
						</div>
					</div>
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-body">
                            <div class="sbt-grid">
                                <!-- SBGrid를 호출합니다. -->
                                <div id="sb-area-grdComAuth" style="width:100%;height:500px;"></div>
                            </div>
                        </div>
                    </div>
				</div>
				<div class="col-sm-7">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span style="color: black;">권한그룹정보</span></li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div>
						<sbux-input id="dtl-inp-orgnAuthrtId" name="dtl-inp-orgnAuthrtId" uitype="hidden"></sbux-input>
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<colgroup>
								<col style="width: 20%">
								<col style="width: 30%">
								<col style="width: 20%">
								<col style="width: 30%">
							</colgroup>
							<thead>
								<tr>
									<th>권한ID</th>									
									<td>
										<sbux-input id="dtl-inp-authrtId" name="dtl-inp-authrtId" uitype="text" style="width:100%" readonly ></sbux-input>
									</td>
									<th>권한명</th>
									<td>
										<sbux-input id="dtl-inp-authrtNm" name="dtl-inp-authrtNm" uitype="text" required style="width:100%"  ></sbux-input>
									</td>
								</tr>
								<tr>
									<th>권한유형</th>
									<td>
										<sbux-select id="dtl-slt-authrtType" name="dtl-slt-authrtType" uitype="single" jsondata-ref="jsonComAuthrtType" unselected-text="선택" required style="width:100%"></sbux-select>
									</td>
									<th>APC코드</th>
									<td>
										<sbux-input id="dtl-inp-apcCd" name="dtl-inp-apcCd" uitype="text" required style="width:100%" ></sbux-input>
									</td>
								</tr>
								<tr>
									<th>권한설명</th>
									<td colspan="3">
										<sbux-input id="dtl-inp-authrtRmrk" name="dtl-inp-authrtRmrk" uitype="text" required style="width:100%" ></sbux-input>
									</td>
								</tr>								
							</thead>
						</table>					
					</div>
					<br />
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">메뉴목록</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
							<sbux-button id="btnSaveMenu" name="btnSaveMenu" uitype="normal" wrap-class="btn btn-sm btn-outline-danger sbt-btn-reset" text="메뉴권한저장" onclick="fn_saveMenu"></sbux-button>
						</div>
					</div>
					<div>
						<div class="sbt-grid-wrap">
	                        <div class="sbt-wrap-body">
	                            <div class="sbt-grid">
	                                <!-- SBGrid를 호출합니다. -->
	                                <div id="sb-area-grdComAuthMenu" style="width:100%;height:300px;"></div>
	                            </div>
	                        </div>
	                    </div>
					</div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</div>
</section>


<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- section============================================================================================================== -->

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 완료-->

<!-- inline scripts related to this page -->
<script type="text/javascript">
    
	/* 공통코드 */
	var jsonComSysId 		= [];	// 시스템유형	srch-slt-sysId		SYS_ID
    var jsonComAuthrtType 	= [];	// 권한유형	dtl-slt-authrtType	AUTHRT_TYPE
    
    /* SBGrid */
    var grdComAuth;			// 권한그룸 목록
    var grdComAuthMenu;		// 권한메뉴 목록
    
    /* SBGrid Data (JSON) */
    var jsonComAuth = [];
    var jsonComAuthMenu = [];
    
    
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {		
		fn_createGrdComAuth();
		fn_createGrdComAuthMenu();
		
		fn_initSBSelect();
	});    
    
    /**
     *
     */
    const fn_initSBSelect = async function() {
		
    	// 조회 SB select
	 	gfn_setComCdSBSelect('srch-slt-sysId', jsonComSysId, 'SYS_ID');	// 시스템유형
	 	
	 	// 상세 SB select
	 	gfn_setComCdSBSelect('dtl-slt-authrtType', jsonComAuthrtType, 'AUTHRT_TYPE');	// 권한유형
    }
    
    /**
     * @name fn_createGrdComAuth
     * @description 권한그룹 그리드 초기화
     * @function
     */
    const fn_createGrdComAuth = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdComAuth';
	    SBGridProperties.id = 'grdComAuth';
	    SBGridProperties.jsonref = 'jsonComAuth';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
            {caption: ["권한ID"],		ref: 'authrtId',		type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["권한명"],		ref: 'authrtNm',    	type:'output',  width:'40%',    style:'text-align:left'},
            {caption: ["권한유형"],	ref: 'authrtTypeNm',	type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["APC명"],		ref: 'apcNm',    		type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["권한설명"],	ref: 'rmrk',        	type:'output',  hidden: true},
            {caption: ["APC코드"],	ref: 'apcCd',        	type:'output',  hidden: true},
            {caption: ["권한유형코드"],	ref: 'authrtType',      type:'output',  hidden: true}
        ];
        
        //document.getElementById('sb-area-grdComAuth').style.height = "500px";
        
        grdComAuth = _SBGrid.create(SBGridProperties);
        grdComAuth.bind('click', 'fn_view');
        grdComAuth.bind('beforepagechanged', 'fn_pagingGrdComAuth');
    }

    const fn_pagingGrdComAuth = async function() {
    	let recordCountPerPage = grdComAuth.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdComAuth.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdComAuth(recordCountPerPage, currentPageNo);
    }
    
    /**
     * @name fn_createGrdComAuthMenu
     * @description 권한메뉴 그리드 초기화
     * @function
     */
    const fn_createGrdComAuthMenu = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdComAuthMenu';
	    SBGridProperties.id = 'grdComAuthMenu';
	    SBGridProperties.jsonref = 'jsonComAuthMenu';
        SBGridProperties.tree = {
            col: 0,
            levelref: 'menuLvl',
            open: true,
            lock: true,
            checkbox: false,
            checkboxexceptionlevel: [0],
            openlevel: 3,
            checkboxchildrencheck: false,
            iconclickeventignore: true
        };
        
        SBGridProperties.columns = [
            {caption: ['메뉴목록'], ref: 'menuNm', width: '100%', type: 'output'},
            {caption: ["<input type='checkbox' onchange='fn_checkAllAuthMenu(this);'>"],
                ref: 'useYn', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['상세'], ref: 'entyList', width: '100%', type: 'output',
				renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					let result = "";
					//result += "<button class='btn btn-xs btn-outline-danger' onClick='alert(" + nRow + ")'>테스트</button>";
					return result;
				}
            },
            
        ];
        
        grdComAuthMenu = _SBGrid.create(SBGridProperties);
    }

 	/**
     * @name fn_save
     * @description 저장
     */
    function fn_save() {
    	
    	// check 권한명
        if (!SBUxMethod.get("dtl-inp-authrtNm")) {
        	gfn_comAlert("W0002", "권한명");		//	W0002	{0}을/를 입력하세요.
            return;
        }
    	
     	// check 권한유형
        if (!SBUxMethod.get("dtl-slt-authrtType")) {
        	gfn_comAlert("W0001", "권한유형");		//	W0001	{0}을/를 선택하세요.
            return;
        }    	
    	console.log('apcCd:', SBUxMethod.get("dtl-inp-apcCd"));
    	// check APC코드
        if (!SBUxMethod.get("dtl-inp-apcCd")) {
            gfn_comAlert("W0002", "APC코드");		//	W0002	{0}을/를 입력하세요.
            return;
        }
    	
        // check 권한설명
        if (!SBUxMethod.get("dtl-inp-authrtRmrk")) {
        	gfn_comAlert("W0002", "권한설명");		//	W0002	{0}을/를 입력하세요.
            return;
        }
    	
    	/**
    	 * @type {string}
    	 */
    	let orgnAuthrtId = SBUxMethod.get("dtl-inp-orgnAuthrtId");
    	
        if (gfn_isEmpty(orgnAuthrtId)) {	//신규
			fn_insertComAuthrt(gfn_comConfirm("Q0001", "등록"));	//	Q0001	{0} 하시겠습니까?
        } else {
        	fn_updateComAuthrt(gfn_comConfirm("Q0001", "변경"));	//	Q0001	{0} 하시겠습니까?
        }
    }
    
 	/**
     * @name fn_delete
     * @description 삭제
     */
    function fn_delete() {
    	let orgnAuthrtId = SBUxMethod.get("dtl-inp-orgnAuthrtId");
        if (!orgnAuthrtId) {
        	gfn_comAlert("W0001", "권한그룹");		//	W0001	{0}을/를 선택하세요.
            return;
        }
        
		fn_deleteComAuthrt(gfn_comConfirm("Q0001", "삭제"));	//	Q0001	{0} 하시겠습니까?
    }
    
 	
 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
        
        if (!SBUxMethod.get("srch-slt-sysId")) {
        	gfn_comAlert("W0001", "시스템구분");		//	W0001	{0}을/를 선택하세요.
            return;
        }
    	
    	// set pagination
    	let pageSize = grdComAuth.getPageSize();
    	let pageNo = 1;
        
    	// form clear 
    	fn_clearForm();
    	// grid clear
    	jsonComAuth.length = 0;
    	jsonComAuthMenu.length = 0;
    	grdComAuthMenu.refresh();    	
    	
    	fn_setGrdComAuth(pageSize, pageNo);
    }
    
    /**
     * @name fn_setGrdComAuth
     * @description 권한그룹 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdComAuth = async function(pageSize, pageNo) {

    	grdComAuth.clearStatus();

		let sysId = SBUxMethod.get("srch-slt-sysId");
		let authrtNm = SBUxMethod.get("srch-inp-authrtNm");
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		
        const postJsonPromise = gfn_postJSON("/co/authrt/selectComAuthrtList.do", {
        	sysId: sysId,
        	authrtNm: authrtNm,
        	apcCd: apcCd,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
		});
        
        const data = await postJsonPromise;
        
		try {
        	
        	/** @type {number} **/
    		let totalRecordCount = 0;
        	
        	jsonComAuth.length = 0;
        	data.resultList.forEach((item, index) => {
				const authrt = {
					authrtId: item.authrtId,
					authrtNm: item.authrtNm,
					authrtType: item.authrtType,
					authrtTypeNm: item.authrtTypeNm,
					authrtRmrk: item.authrtRmrk,
					apcCd: item.apcCd,
					apcNm: item.apcNm,
					sysId: item.sysId
				}
				jsonComAuth.push(authrt);
				
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;	
				}
			});
        	
        	if (jsonComAuth.length > 0) {
        		
        		if(grdComAuth.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdComAuth.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdComAuth.rebuild();
				}else{
					grdComAuth.refresh();
				}
        	} else {
        		grdComAuth.setPageTotalCount(totalRecordCount);
        		grdComAuth.rebuild();
        	}
        	
        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

    /**
     * @name fn_setGrdComAuthMenu
     * @description 권한메뉴 조회
     * @param {string} sysId	시스템id
     * @param {string} authrtId	권한그룹id
     */
    const fn_setGrdComAuthMenu = async function(sysId, authrtId) {
     	
     	grdComAuthMenu.clearStatus();
		
		const postJsonPromise = gfn_postJSON("/co/authrt/selectComAuthrtMenuTreeList.do", {
         	sysId: sysId,
         	authrtId: authrtId,
         	// pagination
 	  		pagingYn : 'N'
 		});
		
		const data = await postJsonPromise;
         
 		try {
         	
         	/** @type {number} **/
     		let totalRecordCount = 0;
         	
         	jsonComAuthMenu.length = 0;
         	data.resultList.forEach((item, index) => {
 				const menu = {
 					//level: item.menuLvl,
					menuLvl: item.menuLvl,
					menuSeq: item.menuSeq,
					sysId: item.sysId,
					upMenuId: item.upMenuId,
					upMenuNm: item.upMenuNm,
					menuId: item.menuId,
					menuNm: item.menuNm,
					menuType: item.menuType,
					userType: item.userType,
					pageUrl: item.pageUrl,
					apcCd: item.apcCd,
					indctSeq: item.indctSeq,
					authrtId: item.authrtId,
					authrtNm: item.authrtNm,
					authrtType: item.authrtType,
					useYn: item.useYn,
					entyList: item.entyList
 				}
 				jsonComAuthMenu.push(menu);
 				
 				if (index === 0) {
 					totalRecordCount = item.totalRecordCount;	
 				}
 			});
         	
     		grdComAuthMenu.setPageTotalCount(totalRecordCount);
     		grdComAuthMenu.rebuild();

         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         }
     }
      
    /**
     * @name fn_insertComAuthrt
     * @description 메뉴등록
     * @param {boolean} isConfirmed
     */
    const fn_insertComAuthrt = async function(isConfirmed) {

		if (!isConfirmed) {
			return;
		}
		
		let authrtId		= SBUxMethod.get('dtl-inp-authrtId');		// 권한ID
		let authrtNm		= SBUxMethod.get('dtl-inp-authrtNm');		// 권한명
		let authrtType		= SBUxMethod.get('dtl-slt-authrtType');		// 권한유형
		let authrtRmrk		= SBUxMethod.get('dtl-inp-authrtRmrk');		// 권한설명
		let apcCd			= SBUxMethod.get('dtl-inp-apcCd');
    	
    	const postJsonPromise = gfn_postJSON("/co/authrt/insertComAuthrt.do", {
			authrtId 	: authrtId,
			authrtNm 	: authrtNm,
			authrtType 	: authrtType,
			authrtRmrk 	: authrtRmrk,
			apcCd 		: apcCd
		});
    	
		const data = await postJsonPromise;
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
    }

    /**
     * @name fn_updateComAuthrt
     * @description 권한그룹정보 변경
     * @param {boolean} isConfirmed
     */     
	const fn_updateComAuthrt = async function(isConfirmed) {

		if (!isConfirmed) {
			return;
		}
		
		let authrtId		= SBUxMethod.get('dtl-inp-orgnAuthrtId');		// 권한ID
		let authrtNm		= SBUxMethod.get('dtl-inp-authrtNm');		// 권한명
		let authrtType		= SBUxMethod.get('dtl-slt-authrtType');		// 권한유형
		let authrtRmrk		= SBUxMethod.get('dtl-inp-authrtRmrk');		// 권한설명
		let apcCd			= SBUxMethod.get('dtl-inp-apcCd');
    	
    	const postJsonPromise = gfn_postJSON("/co/authrt/updateComAuthrt.do", {
			authrtId 	: authrtId,
			authrtNm 	: authrtNm,
			authrtType 	: authrtType,
			authrtRmrk 	: authrtRmrk,
			apcCd 		: apcCd
		});
	
		const data = await postJsonPromise;
	    
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
    	
    }

    /**
     * @name fn_deleteComAuthrt
     * @description 권한그룹정보 삭제
     * @param {boolean} isConfirmed
     */     
   	const fn_deleteComAuthrt = async function(isConfirmed) {

 		if (!isConfirmed) {
 			return;
 		}
 		
		let authrtId = SBUxMethod.get('dtl-inp-authrtId');		// 권한ID
		
		const postJsonPromise = gfn_postJSON("/co/authrt/deleteComAuthrt.do", {
			authrtId: authrtId 	        	
		});
	
		const data = await postJsonPromise;
	    
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
    }

	
    /**
     * @name fn_view
     * @description 선택메뉴 상세정보 표시
     */
    const fn_view = function () {
    	
        let nRow = grdComAuth.getRow();
        if (nRow < 1) {
            return;
        }
        
        var rowData = grdComAuth.getRowData(nRow);
        
        SBUxMethod.set("dtl-inp-orgnAuthrtId", rowData.authrtId);
        SBUxMethod.set("dtl-inp-authrtId", rowData.authrtId);
        SBUxMethod.attr("dtl-inp-authrtId", "readonly", true);
        SBUxMethod.set("dtl-inp-authrtNm", rowData.authrtNm);
        SBUxMethod.set("dtl-slt-authrtType", rowData.authrtType);
        SBUxMethod.set("dtl-inp-authrtRmrk", rowData.authrtRmrk);
        SBUxMethod.set("dtl-inp-apcCd", rowData.apcCd);
        SBUxMethod.attr("dtl-inp-apcCd", "readonly", !gfn_isEmpty(rowData.authrtId));
        
        fn_setGrdComAuthMenu(rowData.sysId, rowData.authrtId);
    }
    
    /**
     * @name fn_clearForm
     * @description 상세정보 초기화
     */
    const fn_clearForm = function() {
        SBUxMethod.set("dtl-inp-orgnAuthrtId", null);
        SBUxMethod.set("dtl-inp-authrtId", null);
        SBUxMethod.attr("dtl-inp-authrtId", "readonly", false);
        SBUxMethod.set("dtl-inp-authrtNm", null);
        SBUxMethod.set("dtl-slt-authrtType", null);
        SBUxMethod.set("dtl-inp-authrtRmrk", null);
        SBUxMethod.set("dtl-inp-apcCd", null);
        SBUxMethod.attr("dtl-inp-apcCd", "readonly", false);  
    }
    
    /**
     * @name fn_saveMenu
     * @description 권한메뉴 저장
     * @function
     */
    const fn_saveMenu = function() {
    	
    	const comAuthMenuList = grdComAuthMenu.getGridDataAll();
    	if (comAuthMenuList.length == 0) {
    		gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
    	}
    	
    	fn_saveComAuthMenu(gfn_comConfirm("Q0001", "저장"));	//	Q0001	{0} 하시겠습니까?
    }
    
    /**
     * @name fn_saveComAuthMenu
     * @description 권한메뉴 등록
     * @param {boolean} isConfirmed
     */
    const fn_saveComAuthMenu = async function(isConfirmed) {
    	
    	if (!isConfirmed) {
    		return;
    	}
    	
    	let authrtId = SBUxMethod.get("dtl-inp-orgnAuthrtId");
		let sysId = "";
    	
    	const menuList = grdComAuthMenu.getGridDataAll();
		
    	const comAuthrtMenuList = [];
    	for ( let i=1; i<=menuList.length; i++ ){
    		
    		const menu = grdComAuthMenu.getRowData(i);
    		
    		// 상위메뉴id 확인
    		comAuthrtMenuList.push({
    			apcCd: menu.apcCd,
    			authrtId: menu.authrtId,
    			authrtNm: menu.authrtNm,
    			entyList: menu.entyList,
    			indctSeq: menu.indctSeq,
    			menuId: menu.menuId,
    			menuLvl: menu.menuLvl,
    			menuNm: menu.menuNm,
    			menuSeq: menu.menuSeq,
    			menuType: menu.menuType,
    			pageUrl: menu.pageUrl,
    			sysId: menu.sysId,
    			upMenuId: menu.upMenuId,
    			upMenuNm: menu.upMenuNm,
    			useYn: menu.useYn,
    			userType: menu.userType
    		});
    		
    		if (i==1) {
    			sysId = menu.sysId;
    		}
    	}
    	
    	console.log("comAuthrtMenuList", comAuthrtMenuList);
    	
    	const postJsonPromise = gfn_postJSON("/co/authrt/insertComAuthrtMenuList.do", {
    		'authrtId': authrtId, 
    		'comAuthrtMenuList': comAuthrtMenuList
    	});
    	
		const data = await postJsonPromise;
	    
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_setGrdComAuthMenu(sysId, authrtId);
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
    }
    
	/**
	 * @name fn_addRow
	 * @description 권한메뉴그룹 행추가
	 * @function
	 */
	const fn_addRow = function() {
		grdComAuth.addRow(true, [], true);
	}
	
    /**
     * ui event
     */

    /**
     * @name fn_checkAllAuthMenu
     * @description 권한메뉴 사용유무 전체 체크/체크해제
     * @param {checkbox} obj
     */
	const fn_checkAllAuthMenu = function(obj) {
    	const data = grdComAuthMenu.getGridDataAll();
        const checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<data.length; i++ ){
        	grdComAuthMenu.setCellData(i+1, 1, checkedYn, true, false);
        }
    }
     
</script>

</body>
</html>