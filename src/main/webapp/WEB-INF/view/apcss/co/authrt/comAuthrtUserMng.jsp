<%
 /**
  * @Class Name : comAuthrtUserMng.jsp
  * @Description : 사용자권한관리 화면
  * @author SI개발부
  * @since 2023.06.30
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.06.30   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 권한별사용자관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 권한별 사용자관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelectAll.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
				<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">권한그룹명</th>
							<td class="td_input" colspan="3" style="border-right:hidden;">
								<sbux-input uitype="text" id="srch-inp-authrtNm" name="srch-inp-authrtNm" class="form-control input-sm" onkeyenter="fn_search"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span style="color: black;">권한그룹목록</span>
									<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdComAuth" style="width:100%;height:579px;"></div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span style="color: black;">권한그룹정보</span></li>
							</ul>
						 	<div class="ad_tbl_toplist">
							</div>
						</div>
						<div>
							<sbux-input id="dtl-inp-apcCd" name="dtl-inp-apcCd" uitype="hidden"></sbux-input>
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<thead>
									<tr>
										<th scope="row" class="th_bg">권한ID</th>
										<td class="td_input">
											<sbux-input id="dtl-inp-authrtId" name="dtl-inp-authrtId" uitype="text" class="form-control input-sm" readonly ></sbux-input>
										</td>
										<th scope="row" class="th_bg">권한명</th>
										<td class="td_input">
											<sbux-input id="dtl-inp-authrtNm" name="dtl-inp-authrtNm" uitype="text" class="form-control input-sm" readonly ></sbux-input>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">권한유형</th>
										<td class="td_input">
											<sbux-input id="dtl-inp-authrtTypeNm" name="dtl-inp-authrtTypeNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg">APC명</th>
										<td class="td_input">
											<sbux-input id="dtl-inp-apcNm" name="dtl-inp-apcNm" uitype="text" uitype="text" class="form-control input-sm" readonly ></sbux-input>
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>
									<span style="color: black;">사용자 목록</span>
									<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
								</li>
							</ul>
						 	<div class="ad_tbl_toplist">
						 		<sbux-button id="btnAddUser" name="btnAddUser" uitype="modal" text="사용자추가" class="btn btn-sm btn-outline-dark" target-id="modal-comAuthUser" onclick="fn_addUser()" disabled></sbux-button>
							</div>
						</div>
						<div>
							<div class="sbt-grid-wrap">
		                        <div class="sbt-wrap-body">
		                            <div class="sbt-grid">
		                                <!-- SBGrid를 호출합니다. -->
		                                <div id="sb-area-grdComAuthUser" style="width:100%;height:468px;"></div>
		                            </div>
		                        </div>
		                    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 사용자 팝업 -->
	<div>
        <sbux-modal id="modal-comAuthUser" name="modal-comAuthUser" uitype="middle" header-title="사용자 선택" body-html-id="body-modal-comAuthUser" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-comAuthUser">
    	<jsp:include page="../../co/popup/comAuthUserPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	let lv_prvAuthrtId = "";

	/* 공통코드 */
	var jsonComApcCd = [];	// APC코드	srch-slt-apcCd	APC_CD

    /* SBGrid */
    var grdComAuth;			// 권한그룸 목록
    var grdComAuthUser;		// 권한사용자 목록

    /* SBGrid Data (JSON) */
    var jsonComAuth = [];
    var jsonComAuthUser = [];

    const fn_init = async function() {

    	lv_prvAuthrtId = "";
    	fn_createGrdComAuth();
		fn_createGrdComAuthUser();

		fn_initSBSelect();
    }

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

    /**
     *
     */
    const fn_initSBSelect = async function() {
    	// 조회 SB select
	 	gfn_setComCdSBSelect('srch-slt-apcCd', jsonComApcCd, 'APC_CD');	// APC코드	srch-slt-apcCd	APC_CD
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
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
        	{caption: ["No."],		ref: 'rowSeq',			type:'output',  width:'10%',    style:'text-align:right'},
        	{caption: ["권한ID"],		ref: 'authrtId',		type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["권한명"],		ref: 'authrtNm',    	type:'output',  width:'30%',    style:'text-align:left'},
            {caption: ["권한유형"],	ref: 'authrtTypeNm',	type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["APC명"],		ref: 'apcNm',    		type:'output',  width:'20%',    style:'text-align:left'},
            {caption: ["권한설명"],	ref: 'rmrk',        	type:'output',  hidden: true},
            {caption: ["APC코드"],	ref: 'apcCd',        	type:'output',  hidden: true},
            {caption: ["권한유형코드"],	ref: 'authrtType',      type:'output',  hidden: true}
        ];

        //document.getElementById('sb-area-grdComAuth').style.height = "500px";

        grdComAuth = _SBGrid.create(SBGridProperties);
        grdComAuth.bind('click', fn_view);
        grdComAuth.bind('beforepagechanged', fn_pagingGrdComAuth);
    }


    /**
     * @name fn_pagingGrdComAuth
     * @description 페이징
     * @function
     */
    const fn_pagingGrdComAuth = async function() {
    	let recordCountPerPage = grdComAuth.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdComAuth.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_clearForm();
    	fn_setGrdComAuth(recordCountPerPage, currentPageNo);
    }

    /**
     * @name fn_createGrdComAuthUser
     * @description 권한사용자 그리드 초기화
     * @function
     */
    const fn_createGrdComAuthUser = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdComAuthUser';
	    SBGridProperties.id = 'grdComAuthUser';
	    SBGridProperties.jsonref = 'jsonComAuthUser';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
        	{caption: ["체크박스"], 	ref: 'checked', 		type: 'checkbox', 	width:'40px',	style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
        	{caption: ["No."],		ref: 'rowSeq',			type:'output',  	width:'40px',	style:'text-align:right'},
        	{caption: ["사용자ID"],	ref: 'userId',			type:'output',  	width:'160px',	style:'text-align:left'},
            {caption: ["사용자명"],	ref: 'userNm',    		type:'output',  	width:'160px',	style:'text-align:left'},
            {caption: ["사용자유형"],	ref: 'userTypeNm',		type:'output',  	width:'160px',	style:'text-align:left'},
            {caption: ["APC명"],		ref: 'apcNm',    		type:'output',  	width:'160px',	style:'text-align:left'},
            {caption: ["APC코드"],	ref: 'apcCd',        	type:'output',  	hidden: true},
            {caption: ["권한ID"],		ref: 'authrtId',      	type:'output',  	hidden: true}
        ];

        grdComAuthUser = _SBGrid.create(SBGridProperties);
        grdComAuthUser.bind('beforepagechanged', fn_pagingGrdComAuthUser);
    }

    /**
     * @name fn_pagingGrdComAuth
     * @description 페이징
     * @function
     */
    const fn_pagingGrdComAuthUser = async function() {
    	let recordCountPerPage = grdComAuthUser.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdComAuthUser.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_clearForm();
    	fn_setGrdComAuth(recordCountPerPage, currentPageNo);
    }

 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

    	lv_prvAuthrtId = "";
    	// set pagination
    	grdComAuth.rebuild();
    	let pageSize = grdComAuth.getPageSize();
    	let pageNo = 1;

    	jsonComAuth.length = 0;
    	grdComAuth.movePaging(pageNo);
    }

    /**
     * @name fn_setGrdComAuth
     * @description 권한그룹 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdComAuth = async function(pageSize, pageNo) {

    	grdComAuth.clearStatus();

		let authrtNm = SBUxMethod.get("srch-inp-authrtNm");
		let apcCd = gv_selectedApcCd;

        const postJsonPromise = gfn_postJSON("/co/authrt/selectComAuthrtList.do", {
        	authrtNm: authrtNm,
        	apcCd: apcCd,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
		});

        const data = await postJsonPromise;

		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonComAuth.length = 0;

  	        	data.resultList.forEach((item, index) => {
  					const authrt = {
  						rowSeq: item.rowSeq,
  						authrtId: item.authrtId,
  						authrtNm: item.authrtNm,
  						authrtType: item.authrtType,
  						authrtTypeNm: item.authrtTypeNm,
  						authrtExpln: item.authrtExpln,
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

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_setGrdComAuthUser
     * @description 권한사용자 조회
     * @param {number} pageSize
     * @param {number} pageNo
     * @param {string} authrtId	권한그룹id
     */
    const fn_setGrdComAuthUser = async function(pageSize, pageNo, authrtId) {

     	grdComAuthUser.clearStatus();

		const postJsonPromise = gfn_postJSON("/co/authrt/selectComAuthrtUserList.do", {
         	authrtId: authrtId,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
 		});

		const data = await postJsonPromise;

		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonComAuthUser.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					const user = {
  						rowSeq: item.rowSeq,
  						authrtId: item.authrtId,
  						userId: item.userId,
  						userNm: item.userNm,
  						apcCd: item.apcCd,
  						apcNm: item.apcNm
  					}
  					jsonComAuthUser.push(user);

  					if (index === 0) {
  						totalRecordCount = item.totalRecordCount;
  					}
  				});

  	        	if (jsonComAuthUser.length > 0) {

  	        		if(grdComAuth.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	        			grdComAuthUser.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	        			grdComAuthUser.rebuild();
  					}else{
  						grdComAuthUser.refresh();
  					}
  	        	} else {
  	        		grdComAuthUser.setPageTotalCount(totalRecordCount);
  	        		grdComAuthUser.rebuild();
  	        	}

  	        	document.querySelector('#listCount2').innerText = totalRecordCount;

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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

        let rowData = grdComAuth.getRowData(nRow);

        if (_.isEqual(lv_prvAuthrtId, rowData.authrtId)) {
        	return;
        }
        fn_clearForm();

        lv_prvAuthrtId = rowData.authrtId;

        SBUxMethod.attr('btnAddUser', 'disabled', false);

        SBUxMethod.set("dtl-inp-authrtId", rowData.authrtId);
        SBUxMethod.set("dtl-inp-authrtNm", rowData.authrtNm);
        SBUxMethod.set("dtl-inp-authrtTypeNm", rowData.authrtTypeNm);
        SBUxMethod.set("dtl-inp-apcCd", rowData.apcCd);
        SBUxMethod.set("dtl-inp-apcNm", rowData.apcNm);

        grdComAuthUser.rebuild();
        fn_setGrdComAuthUser(grdComAuthUser.getPageSize(), 1, rowData.authrtId);
    }

    /**
     * @name fn_clearForm
     * @description 상세정보 초기화
     */
    const fn_clearForm = function() {
    	lv_prvAuthrtId = "";
        SBUxMethod.set("dtl-inp-authrtId", null);
        SBUxMethod.set("dtl-inp-authrtNm", null);
        SBUxMethod.set("dtl-inp-authrtTypeNm", null);
        SBUxMethod.set("dtl-inp-apcCd", null);
        SBUxMethod.set("dtl-inp-apcNm", null);

    	jsonComAuthUser.length = 0;
    	grdComAuthUser.refresh();
		var getColRef = grdComAuthUser.getColRef("checked");
		grdComAuthUser.setFixedcellcheckboxChecked(0, getColRef, false);
    	SBUxMethod.attr('btnAddUser', 'disabled', true);
    }

    /**
     * @name fn_save
     * @description 권한사용자 등록
     * @function
     */
    const fn_save = async function() {

    	const allUsers = grdComAuthUser.getGridDataAll();
    	const users = [];
    	for ( let i=1; i<=allUsers.length; i++ ) {
    		let rowSts = grdComAuthUser.getRowStatus(i);
    		if (rowSts === 1 || rowSts === 3) {
    			const rowData = grdComAuthUser.getRowData(i);
    			users.push({
    				userId: rowData.userId
    			});
    		}
    	}

    	if (users.length == 0) {
    		gfn_comAlert("W0003", "등록");		//	W0003	{0}할 대상이 없습니다.
            return;
    	}

    	if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const authrtId = SBUxMethod.get("dtl-inp-authrtId");
    	const postJsonPromise = gfn_postJSON("/co/authrt/insertComAuthrtUserList.do", {
    		'authrtId': authrtId,
    		'comAuthrtUserList': users
    	});

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		lv_prvAuthrtId = "";
        		fn_view();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }


    /**
     * @name fn_delete
     * @description 권한사용자 삭제
     * @function
     */
    const fn_delete = async function() {

    	const allUsers = grdComAuthUser.getGridDataAll();
    	const users = [];
    	for ( let i=1; i<=allUsers.length; i++ ) {
    		let rowSts = grdComAuthUser.getRowStatus(i);
    		if (rowSts !== 1 && rowSts !== 3) {
    			const rowData = grdComAuthUser.getRowData(i);
    			if (rowData.checked === 'true') {
    				users.push({
        				userId: rowData.userId,
        				authrtId: rowData.authrtId
        			});
    			}
    		}
    	}

    	if (users.length == 0) {
    		gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
            return;
    	}

    	if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/co/authrt/deleteComAuthrtUserList.do", {
    		'authrtId': users[0].authrtId,
    		'comAuthrtUserList': users
    	});

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		lv_prvAuthrtId = "";
        		fn_view();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }


	/**
	 * @name fn_addUser
	 * @description 권한 사용자 추가 (popup 호출)
	 * @function
	 */
	const fn_addUser = function() {

		let nRow = grdComAuth.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdComAuth.getRowData(nRow);

        let authrtId = rowData.authrtId;
        let apcCd = rowData.apcCd;
        let apcNm = rowData.apcNm;

		popComAuthUser.init(authrtId, apcCd, apcNm, fn_setUsers);

	}

	/**
	 * @name fn_setUsers
	 * @description 권한등록 대상 사용자 popup 후처리
	 * @function
	 */
	const fn_setUsers = function(users) {
		if (gfn_isEmpty(users)) {
			return;
		}

		const orgnUsers = [];
		const allData = grdComAuthUser.getGridDataAll();
		for ( let i=1; i<=allData.length; i++) {
			orgnUsers.push(grdComAuthUser.getRowData(i));
		}

		users.forEach((item, index) => {
			// userId check
			let chkData = gfn_getJsonFilter(orgnUsers, "userId", item.userId);
			if (gfn_isEmpty(chkData)) {
				// addRow
				grdComAuthUser.addRow(true, {
					userId: item.userId,
					userNm: item.userNm,
					userTypeNm: item.userTypeNm,
					apcNm: item.apcNm,
					apcCd: item.apcCd,
					authrtId: item.authrtId
				}, true);
			}
		});
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>