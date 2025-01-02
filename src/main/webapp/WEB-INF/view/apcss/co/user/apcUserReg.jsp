<%
/**
 * @Class Name : apcUserReg.jsp
 * @Description : 법인사용자 APC 사용요청 화면
 * @author SI개발부
 * @since 2024.08.27
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2024.08.27   	신정철			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html `lang="ko">
<head>
	<title>title : 법인사용자 APC 사용요청</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<style>
	.col-md-1.justify-content-center {
	    justify-content: center;
	    display: flex;
	    align-items: center;
	    flex-direction: column;
	    height: 85vh;
	}


	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 공통코드관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">

				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">승인여부</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-aprvYn"
									name="srch-slt-aprvYn"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonAprvYn"
									unselected-text="전체"
									onchange="fn_search"
								></sbux-select>
							</td>
 							<th scope="row" class="th_bg">사용자명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-userNm"
									name="srch-inp-userNm"
									class="form-control input-sm"
   								></sbux-input>
   							</td>
   							<th scope="row" class="th_bg">사용자ID</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-userId"
									name="srch-inp-userId"
									class="form-control input-sm"
   								></sbux-input>
   							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>사용자APC목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-userApc">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdUserApc" style="height:540px; width:100%;"></div>
					</div>
				</div>
            </div>
        </div>
	</section>

    <!-- APC 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-ognzAprvApc" 
        	name="modal-ognzAprvApc" 
        	uitype="middle" 
        	header-title="관리APC 선택" 
        	body-html-id="body-modal-ognzAprvApc" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-ognzAprvApc">
    	<jsp:include page="../../co/popup/ognzAprvApcPopup.jsp"></jsp:include>
    </div>

	<!-- APC사용자 선택 Modal -->
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
	async function cfn_del() {
	}
	async function cfn_save() {
	}
	async function cfn_search() {
	}

    // only document
    window.addEventListener('DOMContentLoaded', async function(e) {

    	fn_init();

    });
    
    // SBSelect JSON
	var jsonAprvYn	= [
		{'text': '미승인', 'value': 'N'},
		{'text': '승인', 'value': 'Y'},
	];
    
	<c:choose>
		<c:when test="${loginVO != null && loginVO.id != null}">
			<c:set scope="request" var="userId" value="${loginVO.id}"></c:set>
			<c:set scope="request" var="userNm" value="${loginVO.name}"></c:set>
			const lv_userId = "<c:out value='${userId}'></c:out>";
			const lv_userNm = "<c:out value='${userNm}'></c:out>";
		</c:when>
		<c:otherwise>
			const lv_userId = "";
			const lv_userNm = "";			
		</c:otherwise>
	</c:choose>

    

    // 그리드 객체, json
    var grdUserApc = null;
    var jsonUserApc = [];
    
    /**
     * @name fn_init
     * @description 초기세팅
     * @function
     */
    const fn_init = async function() {
    	// 그리드 생성
    	fn_createSBGrid();
    }

    /**
     * @name fn_createSBGrid
     * @description 그리드생성
     * @function
     */
    const fn_createSBGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdUserApc';
	    SBGridProperties.id = 'grdUserApc';
	    SBGridProperties.jsonref = 'jsonUserApc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.frozencols = 1;
	    //SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.entereditcell = true;			// enter키로 행 이동시 하위 셀 edit창 활성화 여부를 설정하는 속성입니다.
	    SBGridProperties.allowcopy = true;
	    //SBGridProperties.oneclickedit = true;
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
            	caption: ["사용자ID"],		
            	ref: 'userId',	
            	type: 'output',		
            	width: '60px',	
            	style: 'text-align:center'
            },
            {
            	caption: ["사용자명"],		
            	ref: 'userNm',	
            	type: 'output',		
            	width: '100px',	
            	style: 'text-align:center'
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
            	caption: ["APC명"],		
            	ref: 'apcCd',	
            	type: 'output',		
            	width: '60px',	
            	style: 'text-align:center'
            },
            {
            	caption: ["APC명"],		
            	ref: 'apcNm',	
            	type: 'output',		
            	width: '150px',	
            	style: 'text-align:left'
            },
            {
	        	caption: ["APC명"],
        		ref: 'apcCd',
        		type:'button',
        		width:'40px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		if (_.isEqual("Y", objRowData.chkVl)) {
	        			return "";
	        		}
	        		if (_.isEqual("N", objRowData.delYn)) {
	        			if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_choiceApc(" + nRow + ")'>🔍</button>";
		            	} else {
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_clearApc(" + nRow + ")'>❌</button>";
						}
	        		}	            	
		    	}
	        },
        	{
        		caption: ["신청 일시"], 		
        		ref: 'aplyDt',	
        		type:'output',  	
        		width:'120px', 
        		style:'text-align:center',
        	},
        	{
        		caption: ["신청 상세"], 		
        		ref: 'aplyRmrk',	
        		type:'input',
        		width:'200px', 
        		style:'text-align:center',
        	},

	        {
        		caption: ["승인"], 		
        		ref: 'aprvYn',	
        		type:'output',  	
        		width:'40px', 
        		style:'text-align:center'
        	},
        	{
        		caption: ["승인 일시"], 		
        		ref: 'aprvDt',	
        		type:'output',  	
        		width:'110px', 
        		style:'text-align:center',
        	},
        	{
        		caption: ["승인 비고"], 		
        		ref: 'aprvRmrk',	
        		type:'output',
        		width:'200px', 
        		style:'text-align:center',
        	},
        ];
        
        grdUserApc = _SBGrid.create(SBGridProperties);
    	document.querySelector('#cnt-userApc').innerText = 0;
    	
    	grdUserApc.setCellDisabled(
        		0, 
        		0, 
        		grdUserApc.getRows() -1, 
        		grdUserApc.getCols() -1,
        		true
    		);
        
    	grdUserApc.addRow();
    	grdUserApc.setCellDisabled(
   				grdUserApc.getRows() -1, 
        		0, 
        		grdUserApc.getRows() -1, 
        		grdUserApc.getCols() -1,
        		true
       		);
    }

    /**
     * @name fn_save
     * @description 조회
     * @function
     */
    const fn_save = async function() {
		await fn_saveUserApc();
    }    
    
    const fn_saveUserApc = async function() {
    	
		const aplyList = [];
		const allData = grdUserApc.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++) {

			const item = allData[i];
			
			if (_.isEqual("N", item.delYn) && !_.isEqual("Y", item.chkVl)) {
				
				if (gfn_isEmpty(item.userId)) {
					gfn_comAlert("W0005", "사용자ID");		//	W0005	{0}이/가 없습니다.
					return;
				}
				
				if (gfn_isEmpty(item.apcCd)) {
					gfn_comAlert("W0005", "APC코드");		//	W0005	{0}이/가 없습니다.
					return;
				}
				
				aplyList.push({
					userId: item.userId,
					apcCd: item.apcCd,
					aplyRmrk: item.aplyRmrk
    			});	
			}
		}

		if (aplyList.length == 0) {
			gfn_comAlert("W0003", "저장");	//	W0003	{0}할 대상이 없습니다.
			return;
		}

		const param = {
			userApcList: aplyList
		}
		
    	const postJsonPromise = gfn_postJSON("/co/user/insertUserApcAply.do", param);
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
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
     * @description 조회
     * @function
     */
    const fn_search = async function() {
		await fn_setGrdUserApc();
    }    
    
    /**
     * @name fn_setGrdUserApc
     * @description 사용자APC목록 조회
     * @function
     */
    const fn_setGrdUserApc = async function() {
 		
    	jsonUserApc.length = 0;
 		
    	const aprvYn = SBUxMethod.get("srch-slt-aprvYn");
    	const userNm = SBUxMethod.get("srch-inp-userNm");
    	const userId = SBUxMethod.get("srch-inp-userId");

    	const postJsonPromise = gfn_postJSON("/co/user/selectUserApcList.do", {
    		aprvYn: aprvYn,
	  		userNm: userNm,
	  		userId: userId
  		});

        const data = await postJsonPromise;

        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		jsonUserApc.push(item);
				});

  	          	let totalRecordCount = jsonUserApc.length;
  	          	grdUserApc.rebuild();
  	          	
	        	document.querySelector('#cnt-userApc').innerText = totalRecordCount;
	        	
	        	grdUserApc.setCellDisabled(
		        		0, 
		        		0, 
		        		grdUserApc.getRows() -1, 
		        		grdUserApc.getCols() -1,
		        		true
	        		);
		        
	        	grdUserApc.addRow();
	        	grdUserApc.setCellDisabled(
	        				grdUserApc.getRows() -1, 
			        		0, 
			        		grdUserApc.getRows() -1, 
			        		grdUserApc.getCols() -1,
			        		true
		        		);
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
     * @name fn_addRow
     * @description 행추가
     */
    const fn_addRow = function (nRow) {

		if (gfn_isEmpty(lv_userId)) {
			gfn_comAlert("W0005", "로그인정보");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
        const row = grdUserApc.getRowData(nRow, false);
		row.delYn = "N";
		row.userId = lv_userId;
		row.userNm = lv_userNm;
		
		grdUserApc.addRow(true);

		grdUserApc.setCellDisabled(
	    			0, 
	    			0, 
	    			grdUserApc.getRows() -1, 
	    			grdUserApc.getCols() -1, 
	    			false
    			);
		grdUserApc.setCellDisabled(
					grdUserApc.getRows() -1, 
	    			0, 
	    			grdUserApc.getRows() -1, 
	    			grdUserApc.getCols() -1, 
    				true
    			);
    };
    
	/**
     * @name fn_delRow
     * @description APC 행삭제
     */
	const fn_delRow = async function(nRow) {
		
		const rowStatus = grdUserApc.getRowStatus(nRow);
		
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록된 정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const userApc = grdUserApc.getRowData(nRow);
			await fn_deleteUserApc(userApc);

    	} else {
    		grdUserApc.deleteRow(nRow);
    	}
	}

    /**
     * @name fn_deleteUserApc
     * @description 사용자 APC 등록 삭제
     * @function
     */
    const fn_deleteUserApc = async function(_userApc) {
    	
		const aplyList = [];
		
		if (gfn_isEmpty(_userApc.userId)) {
			gfn_comAlert("W0005", "사용자ID");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (gfn_isEmpty(_userApc.apcCd)) {
			gfn_comAlert("W0005", "APC코드");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		aplyList.push({
			userId: _userApc.userId,
			apcCd: _userApc.apcCd,
		});	
		
		const param = {
			userApcList: aplyList
		}
		
    	const postJsonPromise = gfn_postJSON("/co/user/deleteUserApcAply.do", param);
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
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
	 * @name fn_setOgnzApc
	 * @description APC 선택 popup callback 처리
	 */
	const fn_setOgnzApc = function(_apcInfo) {
		
		if (!gfn_isEmpty(_apcInfo)) {
			const nRow = grdUserApc.getRow();
			const rowData = grdUserApc.getRowData(nRow, false);
			rowData.apcCd = _apcInfo.apcCd;
			rowData.apcNm = _apcInfo.apcNm;
			grdUserApc.refresh({"focus":false});
		}
		
	}
    
    /**
     * @name fn_choiceApc
     * @description APC 선택
     */
	const fn_choiceApc = async function(nRow) {

		SBUxMethod.openModal('modal-ognzAprvApc');
		const rowData = grdUserApc.getRowData(nRow);
		
		const initParam = {
				apcCd: rowData.apcCd,
				apcNm: rowData.apcNm
		};
		
		popOgnzAprvApc.init(initParam, fn_setOgnzApc);
	}
    
    /**
     * @name fn_clearApc
     * @description APC 삭제
     */
	const fn_clearApc = async function(nRow) {
    	
		const rowData = grdUserApc.getRowData(nRow, false);
		rowData.apcCd = "";
		rowData.apcNm = "";
		
		grdUserApc.refresh({"focus":false});
	}


	/**
	 * @name fn_setApcUser
	 * @description APC사용자 선택 popup callback 처리
	 */
	const fn_setApcUser = function(_apcUser) {

		if (!gfn_isEmpty(_apcUser)) {

			const nRow = grdUserApc.getRow();
			const rowData = grdUserApc.getRowData(nRow, false);

			rowData.userId = _apcUser.userId;
			rowData.userNm = _apcUser.userNm;

			grdUserApc.refresh({"focus":false});
		}
	}

	/**
	 * @name fn_choiceApcUser
	 * @description APC사용자 선택
	 */
	const fn_choiceApcUser = async function(nRow) {
		const rowData = grdUserApc.getRowData(nRow);
		const initParam = {
			untyOgnzId: "",
			ognzNm: "",
			mbrTypeCd: "",
			userNm: "",
			userId: "",
			excludeUsers: []
		};

		popApcUser.init(initParam, fn_setApcUser);

		SBUxMethod.openModal('modal-apcUser');
	}

	/**
	 * @name fn_clearApcUser
	 * @description APC사용자 삭제
	 */
	const fn_clearApcUser = async function(nRow) {

		const rowData = grdUserApc.getRowData(nRow, false);
		rowData.userId = "";
		rowData.userNm = "";

		grdUserApc.refresh({"focus":false});
	}


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>