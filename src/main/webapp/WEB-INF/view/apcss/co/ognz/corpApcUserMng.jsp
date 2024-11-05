<%
/**
 * @Class Name : corpApcUserMng.jsp
 * @Description : 법인별 APC사용자 관리 화면
 * @author SI개발부
 * @since 2024.10.22
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	 ----------	 ---------------------------
 * @ 2024.10.22  신정철			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 법인별 APC사용자 관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 메뉴관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="btnSave" 
						name="btnSave" 
						uitype="normal"  
						text="저장" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_save"
					></sbux-button>
					<sbux-button 
						id="btnSearch" 
						name="btnSearch" 
						uitype="normal"  
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 3%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 3%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 3%">
							<col style="width: 6%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_bg">법인명</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-ognzNm" 
										name="srch-inp-ognzNm" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
										onkeyenter="fn_search"
									></sbux-input>
								</td>
								<th scope="row" class="th_bg">APC코드</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-apcCd" 
										name="srch-inp-apcCd" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
										onkeyenter="fn_search"
									></sbux-input>
								</td>
								<th scope="row" class="th_bg">APC명</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-apcNm" 
										name="srch-inp-apcNm" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
										onkeyenter="fn_search"
									></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<div class ="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>법인별 관리APC 목록</span></li>
							</ul>
						</div>
						<div class ="row">
							<div id="sb-area-grdCorpApc" style="width:95%;height:596px;"></div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>관리 APC 정보</span></li>
							</ul>
						</div>
						<div  class ="row">
							<sbux-input 
								id="dtl-inp-untyOgnzId" 
								name="dtl-inp-untyOgnzId" 
								uitype="hidden"
							></sbux-input>
							<sbux-input 
								id="dtl-inp-apcCd" 
								name="dtl-inp-apcCd" 
								uitype="hidden"
							></sbux-input>
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<thead>
									<tr>
										<th scope="row" class="th_bg">APC코드</th>
										<td class="td_input">
											<sbux-label
												id="dtl-lbl-apcCd"
												name="dtl-lbl-apcCd" 
												uitype="normal"
												text=""
											></sbux-label>
										</td>
										<th scope="row" class="th_bg">APC명</th>
										<td class="td_input">
											<sbux-label
												id="dtl-lbl-apcNm"
												name="dtl-lbl-apcNm" 
												uitype="normal"
												text=""
											></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">주소</th>
										<td colspan="3" class="td_input">
											<sbux-label
												id="dtl-lbl-addr"
												name="dtl-lbl-addr" 
												uitype="normal"
												text=""
											></sbux-label>
										</td>
									</tr>
								</thead>
							</table>
							<div class="ad_tbl_top2">
								<ul class="ad_tbl_count">
									<li>
										<span>APC사용자 목록</span>
									</li>
								</ul>
							</div>
							<div class ="row">
								<div id="sb-area-grdCorpApcUser" style="height:520px;"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	
    <!-- APC 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-apcUser" 
        	name="modal-apcUser" 
        	uitype="middle" 
        	header-title="APC사용자 선택" 
        	body-html-id="body-modal-apcUser" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-apcUser">
    	<jsp:include page="../../co/popup/corpApcUserPopup.jsp"></jsp:include>
    </div>
	
</body>
   
<!-- inline scripts related to this page -->
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		
	}
	async function cfn_add() {
		fn_create();
	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}


	// left 법인별 APC
    var grdCorpApc;
	var jsonCorpApc = [];
    
    var grdCorpApcUser;
    var jsonCorpApcUser = [];
    
    
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

    /**
     * @name fn_init
     * @description 화면로드 시 초기 설정
     * @function
     */
	const fn_init = async function() {
		fn_initSBSelect();
		fn_createGrid();
	}
	
    /**
     * @name fn_initSBSelect
     * @description SBSelect 설정 - 공통코드
     * @function
     */
    const fn_initSBSelect = async function() {

    }


    /**
     * @name fn_createGrid
     * @description 그리드 초기화
     * @function
     */
    function fn_createGrid() {
        fn_createGridCorpApc();
        fn_createGridCorpApcUser();
    }


    /**
     * @name fn_createGridCorpApc
     * @description 법인별 APC 그리드 생성
     * @function
     */
    function fn_createGridCorpApc() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdCorpApc';
	    SBGridProperties.id = 'grdCorpApc';
	    SBGridProperties.jsonref = 'jsonCorpApc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.rowheader = ['select'];
        SBGridProperties.columns = [
        	{
            	caption: ['법인명'],
            	ref: 'ognzNm',
            	type: 'output',
                width: '100px',
                style: 'text-align:left',
            },
        	{
            	caption: ['APC코드'],
            	ref: 'apcCd',
            	type: 'output',
                width: '100px',
                style: 'text-align:left',
            },
            {
            	caption: ['APC명'],
            	ref: 'apcNm',
            	type: 'output',
                width: '100px',
                style: 'text-align:center',
            },
            {
            	caption: ['사업자번호'],
            	ref: 'brno',
            	type: 'output',
                width: '120px',
                style: 'text-align:center',
            },
            {
            	caption: ['주소'],
            	ref: 'addr',
            	type: 'output',
                width: '200px',
                style: 'text-align:center',
            },
        ];
        
        grdCorpApc = _SBGrid.create(SBGridProperties);
        grdCorpApc.bind('click', fn_view);
    }
    
    /**
     * @name fn_createGridCorpApcUser
     * @description APC사용자 그리드 생성
     * @function
     */
    function fn_createGridCorpApcUser() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdCorpApcUser';
	    SBGridProperties.id = 'grdCorpApcUser';
	    SBGridProperties.jsonref = 'jsonCorpApcUser';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'none';
	    //SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
	    	{
            	caption: ["처리"],
            	ref: 'delYn',
            	type:'button',
            	width:'50px',
            	style:'text-align:center',
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if (strValue== null || strValue == ""){
            			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
            		} else {
			        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
            		}
		    	}
            },
        	{
            	caption: ['사용자ID'],
            	ref: 'userId',
            	type: 'output',
                width: '100px',
                style: 'text-align:left',
            },
            {
            	caption: ['사용자명'],
            	ref: 'userNm',
            	type: 'output',
                width: '100px',
                style: 'text-align:center',
            },
        	{
	        	caption: ["사용자명"],
        		ref: 'userNm',
        		type:'button',
        		width:'40px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		if (_.isEqual("Y", objRowData.chkVl)) {
	        			return "";
	        		}
	        		if (_.isEqual("N", objRowData.delYn)) {
	        			if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_choiceApcUser(" + nRow + ")'>🔍</button>";
		            	} else {
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_clearApcUser(" + nRow + ")'>❌</button>";
						}
	        		}	            	
		    	}
	        },
            {
            	caption: ['승인'],
            	ref: 'aprvYn',
            	type: 'output',
                width: '50px',
                style: 'text-align:center',
            },
            {
            	caption: ['AM'],
            	ref: 'prdctnMngUseYn',
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "prdctnMngUseYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">APC생산관리</span></div>'
            },
            {
            	caption: ['FM'],
            	ref: 'frmhsMngUseYn',
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "frmhsMngUseYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">농가관리</span></div>'
            },
            {
            	caption: ['MA'],
            	ref: 'admstMngUseYn',
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "admstMngUseYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">농가관리</span></div>'
            },
            {
            	caption: ['회사'],
            	ref: 'coNm',
            	type: 'output',
                width: '140px',
                style: 'text-align:center',
            },
            {
	        	caption: ["직위"],		
	        	ref: 'jbps',   	
	        	type:'output',  	
	        	width:'80px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["휴대전화"],		
	        	ref: 'mblTelno',   	
	        	type:'output',  	
	        	width:'120px', 
	        	style:'text-align:left'
	        },
	        {
	        	caption: ["전화번호"],		
	        	ref: 'coTelno',   	
	        	type:'output',  	
	        	width:'120px', 
	        	style:'text-align:left'
	        },
            
        ];
        
        grdCorpApcUser = _SBGrid.create(SBGridProperties);
    }
    
	/**
     * @name fn_addRow
     * @description APC 사용자 행추가
     */
    const fn_addRow = function (nRow) {

		const untyOgnzId = SBUxMethod.get("dtl-inp-untyOgnzId");
    	const apcCd = SBUxMethod.get("dtl-inp-apcCd");
    	const apcNm = SBUxMethod.get("dtl-lbl-apcNm");
		
    	if (gfn_isEmpty(apcCd)) {
    		gfn_comAlert("W0001", "APC");	//	W0001	{0}을/를 선택하세요.
    		return;
    	}
    	
        const row = grdCorpApcUser.getRowData(nRow, false);
		row.delYn = "N";
		
		row.apcCd = apcCd;
		row.apcNm = apcNm;
		
		grdCorpApcUser.addRow(true);

		grdCorpApcUser.setCellDisabled(
	    			0, 
	    			0, 
	    			grdCorpApcUser.getRows() -1, 
	    			grdCorpApcUser.getCols() -1, 
	    			false
    			);
		grdCorpApcUser.setCellDisabled(
					grdCorpApcUser.getRows() -1, 
	    			0, 
	    			grdCorpApcUser.getRows() -1, 
	    			grdCorpApcUser.getCols() -1, 
    				true
    			);
    };
    
	/**
     * @name fn_delRow
     * @description APC 사용자 행삭제
     */
	const fn_delRow = async function(nRow) {
		
		const rowSts = grdCorpApcUser.getRowStatus(nRow);
		
		if (rowSts == 0 || rowSts == 2) {
			if (!gfn_comConfirm("Q0002", "등록된 정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const apcUser = grdCorpApcUser.getRowData(nRow);
			await fn_deleteCorpApcUser(apcUser);

    	} else {
    		grdCorpApcUser.deleteRow(nRow);
    	}
	}
	
	/**
     * @name fn_deleteCorpApcUser
     * @description APC 삭제 처리
     */	
	const fn_deleteCorpApcUser = async function(_user) {

		// validate check

    	const untyOgnzId = SBUxMethod.get("dtl-inp-untyOgnzId");
    	const apcCd = SBUxMethod.get("dtl-inp-apcCd");
    	
		const apcUserList = [];
		
		apcUserList.push(_user);
    	
		try {
			const param = {
				untyOgnzId: untyOgnzId,
				untyOgnzCd: untyOgnzId,
				apcCd: apcCd,
				apcUserList: apcUserList
			}
			
    		const postJsonPromise = gfn_postJSON("/co/ognz/deleteCorpApcUser.do", param);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		await fn_setCorpApcUser();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }  
		
	}
    
    /**
     * @name fn_create
     * @description 신규 작성
     * @param {number} nRow	행번호
     */
    function fn_create(nRow) {
    	 
    }


 	/**
     * @name fn_save
     * @description 저장
     */
    const fn_save = async function() {
    	
 		// validate check

    	const untyOgnzId = SBUxMethod.get("dtl-inp-untyOgnzId");
    	const apcCd = SBUxMethod.get("dtl-inp-apcCd");
    	
		const allData = grdCorpApcUser.getGridDataAll();
		const apcUserList = [];
		
    	
		for (let i=1; i<=allData.length; i++) {
			
			const rowData = grdCorpApcUser.getRowData(i);
			const rowSts = grdCorpApcUser.getRowStatus(i);
			
			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}
							
			if (gfn_isEmpty(rowData.userId)) {
				gfn_comAlert("W0005", "사용자");		//	W0005	{0}이/가 없습니다.
	            return;
			}
			
			if (gfn_isEmpty(rowData.apcCd)) {
				gfn_comAlert("W0005", "APC정보");		//	W0005	{0}이/가 없습니다.
	            return;
			}
			
			apcUserList.push(rowData);
		}
		
		if (apcUserList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "저장")) {
			return;
		}
		
		try {
			const param = {
				untyOgnzId: untyOgnzId,
				untyOgnzCd: untyOgnzId,
				apcCd: apcCd,
				apcUserList: apcUserList
			}
			
			console.log("apcUserList", apcUserList);
			
    		const postJsonPromise = gfn_postJSON("/co/ognz/insertCorpApcUser.do", param);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		await fn_setCorpApcUser();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }    	
    	
    }

 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	fn_clearCorpApcUser();
    	fn_setCorpApc();
    }

 	
    /**
     * @name fn_setCorpApc
     * @description 법인별 APC 조회
     */
    const fn_setCorpApc = async function() {

    	// form clear
    	fn_clearForm();

    	grdCorpApc.clearStatus();

    	const untyOgnzNm = SBUxMethod.get("srch-inp-untyOgnzNm");
    	const apcCd = SBUxMethod.get("srch-inp-apcCd");
    	const apcNm = SBUxMethod.get("srch-inp-apcNm");
    	
        try {
        	
        	const postJsonPromise = gfn_postJSON("/co/ognz/selectCorpApcList.do", {
            	untyOgnzNm: untyOgnzNm,
            	apcCd: apcCd,
            	apcNm: apcNm,
            	// pagination
    	  		pagingYn : 'N',
    			currentPageNo : 0,
     		  	recordCountPerPage : 0
    		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonCorpApc.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					
  	        		jsonCorpApc.push(item);

  					totalRecordCount = jsonCorpApc.length;
  				});

  	        	grdCorpApc.rebuild();
  	        	//document.querySelector('#listCount').innerText = totalRecordCount;

        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    
    const fn_clearCorpApcUser = function() {
    	jsonCorpApcUser.length = 0;
    	grdCorpApcUser.refresh();
    }
    
    /**
     * @name fn_setCorpApcUser
     * @description APC사용자 조회
     */
    const fn_setCorpApcUser = async function() {

    	jsonCorpApcUser.length = 0;
		
    	const apcCd = SBUxMethod.get("dtl-lbl-apcCd");
    	
    	if (gfn_isEmpty(apcCd)) {
    		grdCorpApcUser.rebuild();
    		return;
    	}
    	
        const postJsonPromise = gfn_postJSON("/co/ognz/selectCorpApcUserList.do", {
        	apcCd: apcCd,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : 0,
 		  	recordCountPerPage : 0
		});

        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonCorpApcUser.length = 0;
  	        	data.resultList.forEach((item, index) => {
  	        		item.delYn = "N";
  	        		item.chkVl = "Y";
  	        		jsonCorpApcUser.push(item);
  				});
  	        	
  	        	totalRecordCount = jsonCorpApcUser.length;
  	        	grdCorpApcUser.rebuild();
  	        	//document.querySelector('#listCount').innerText = totalRecordCount;
  	        	
  		        grdCorpApcUser.setCellDisabled(
  		        		0, 
  		        		0, 
  		        		grdCorpApcUser.getRows() -1, 
  		        		2, 
  		        		true
  	        		);
  		        
  		      	grdCorpApcUser.addRow();
  		    	grdCorpApcUser.setCellDisabled(
 		    			grdCorpApcUser.getRows() -1, 
 			        	0, 
 			        	grdCorpApcUser.getRows() -1, 
 			        	grdCorpApcUser.getCols() -1, 
 			        	true
 		        	);
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
     * @description 선택 APC 상세정보 표시
     */
    const fn_view = function () {

    	const prvUntyOgnzId = SBUxMethod.get("dtl-inp-untyOgnzId");	// 통합조직ID
    	const prvApcCd = SBUxMethod.get("dtl-lbl-apcCd");	// dtl-lbl-apcCd	APC코드
    	
        const nRow = grdCorpApc.getRow();
        if (nRow < 1) {
            return;
        }

        const rowData = grdCorpApc.getRowData(nRow);

        SBUxMethod.set("dtl-inp-untyOgnzId", rowData.untyOgnzId);
        SBUxMethod.set("dtl-inp-apcCd", rowData.apcCd);
        SBUxMethod.set("dtl-lbl-apcCd", rowData.apcCd);
        SBUxMethod.set("dtl-lbl-apcNm", rowData.apcNm);
        SBUxMethod.set("dtl-lbl-addr",  gfn_nvl(rowData.addr));
        
		if (!_.isEqual(prvApcCd, rowData.apcCd) || !_.isEqual(prvUntyOgnzId, rowData.untyOgnzId)) {
			fn_setCorpApcUser();
		}
    }

    
	/**
	 * @name fn_setApcUser
	 * @description APC 선택 popup callback 처리
	 */
	const fn_setApcUser = function(_apcUser) {
		
		console.log("_apcUser", _apcUser);
		
		if (!gfn_isEmpty(_apcUser)) {
			
			const nRow = grdCorpApcUser.getRow();
			const rowData = grdCorpApcUser.getRowData(nRow, false);
			
			rowData.userId = _apcUser.userId;
			rowData.userNm = _apcUser.userNm;
			rowData.mbrTypeCd = _apcUser.mbrTypeCd;
			rowData.ognzCd = _apcUser.ognzNm;
			rowData.ognzNm = _apcUser.ognzNm;
			rowData.jbps = _apcUser.jbps;
			rowData.mblTelno = _apcUser.mblTelno;
			rowData.coNm = _apcUser.coNm;
			rowData.jbps = _apcUser.jbps;
			rowData.coTelno = _apcUser.coTelno;
			rowData.brno = _apcUser.brno;
			
			grdCorpApcUser.refresh({"focus":false});			
		}
	}
    
    /**
     * @name fn_choiceApcUser
     * @description APC 사용자 선택
     */
	const fn_choiceApcUser = async function(nRow) {

		SBUxMethod.openModal('modal-apcUser');
		
		const rowData = grdCorpApcUser.getRowData(nRow);
		
		const excludeUsers = [];
		
		jsonCorpApcUser.forEach((user) => {
			if (!gfn_isEmpty(user.userId)) {
				excludeUsers.push(user.userId);
			}
		});
		
		const initParam = {
				untyOgnzId: rowData.untyOgnzId,
				ognzNm: "",
				mbrTypeCd: "",
				userNm: "", 
				userId: "",
				excludeUsers: excludeUsers
		};
		
		popApcUser.init(initParam, fn_setApcUser);
	}
    
    /**
     * @name fn_clearApc
     * @description APC 삭제
     */
	const fn_clearApcUser = async function(nRow) {
    	
		const rowData = grdCorpApcUser.getRowData(nRow, false);
		rowData.userId = "";
		rowData.userNm = "";
		rowData.mbrTypeCd = "";
		rowData.ognzCd = "";
		rowData.ognzNm = "";
		rowData.jbps = "";
		rowData.mblTelno = "";
		rowData.coNm = "";
		rowData.jbps = "";
		rowData.coTelno = "";
		rowData.brno = "";
		
		grdCorpApcUser.refresh({"focus":false});
	}
    
    
    /**
     * @name fn_clearForm
     * @description 상세정보 초기화
     */
    const fn_clearForm = function() {
        SBUxMethod.set("dtl-lbl-apcCd", "");
        SBUxMethod.set("dtl-lbl-apcNm", "");
        SBUxMethod.set("dtl-lbl-addr", "");
    }

	
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>