<%
 /**
  * @Class Name : comUserArvReg.jsp
  * @Description : APC관리자승인등록 화면
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
	<title>title : APC관리자승인등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>

	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- APC관리자승인등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="승인" class="btn btn-sm btn-outline-danger" onclick="fn_userAprv"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>

			</div>
			<div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelectAll.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">승인여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-userStts"
									name="srch-slt-userStts"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonComUserStts"
									unselected-text="선택"
									readonly
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-userNm"
									name="srch-inp-userNm"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									title=""
									maxlength="13"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">사용자ID</th>
							<td class="td_input" style="border-right: hidden;">
							<sbux-input
									id="srch-inp-userId"
									name="srch-inp-userId"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									title=""
									maxlength="13"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
					</tbody>
				</table>
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>승인요청목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-userAprv">0</span>건)</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">
							<sbux-button id="btnAllSave" name="btnAllSave" uitype="normal" text="일괄승인" class="btn btn-sm btn-outline-danger" onclick="fn_allUserAprv()" ></sbux-button>
						</div>
					</div>
					<div id="sb-area-grdUserAprv" style="height:576px;"></div>
				</div>
			</div>
	</section>
</body>

<script type="text/javascript">
	var userType=[
		{'label': 'APC관리자', 'value': '10'},
		{'label': 'APC사용자', 'value': '11'}
	];
// 	var jsonUserType = [];
	var jsonComUserStts	= [];	// 사용자상태	USER_STTS	srch-slt-userStts

	var grdUserAprv;
	var jsonUserAprv = [];

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		await gfn_setComCdSBSelect('srch-slt-userStts', jsonComUserStts, 'USER_STTS');
// 		await gfn_setComCdGridSelect('grdUserAprv', 	jsonUserType,    'USER_TYPE');	// 사용유무
		SBUxMethod.set("srch-slt-userStts", "00");

		fn_createGridUserAprv();

		fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_createGridUserAprv = function() {
		var SBGridProperties = {};

	    SBGridProperties.parentid = 'sb-area-grdUserAprv';
	    SBGridProperties.id = 'grdUserAprv';
	    SBGridProperties.jsonref = 'jsonUserAprv';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.columns = [
        	{caption: ["체크박스"], 	ref: 'checkedYn', 	type: 'checkbox',	width:'40px',  style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}
        	},
	        {caption: ["상태"], 		ref: 'userSttsNm',	type:'output',  	width:'175px', style:'text-align:center'},
	        {caption: ["사용자ID"],  	ref: 'userId',    	type:'output',		width:'175px', style:'text-align:center'},
	        {caption: ["사용자명"],   	ref: 'userNm',      type:'output',  	width:'175px', style:'text-align:center'},
	        {caption: ["APC명"],		ref: 'apcNm',   	type:'output',  	width:'175px', style:'text-align:center'},
	        {caption: ["사용자유형"],	ref: 'userType',	type:'combo',  		width:'175px', style:'text-align:center',
	        	typeinfo : {ref:'userType', label:'label', value:'value', displayui : true}
	        },
	        {caption: ["메일주소"],  	ref: 'eml',  		type:'output', 		width:'175px', style:'text-align:center'},
	    	{caption: ["전화번호"],  	ref: 'telno',   	type:'output',  	width:'175px', style:'text-align:center'},
	        {caption: ["직책 명"],  	ref: 'jbttlNm',   	type:'output',  	width:'175px', style:'text-align:center'},
	        {caption: ["담당업무"],  	ref: 'tkcgTaskNm',  type:'output',  	width:'175px', style:'text-align:center'},
			{caption: ["사용자상태"],	ref: 'userStts',  	type:'output',  	hidden: true},
			{caption: ["사용자유형"],	ref: 'userType',  	type:'output',  	hidden: true},
			{caption: ["apc코드"],	ref: 'apcCd',  		type:'output',  	hidden: true}
		];
	    grdUserAprv = _SBGrid.create(SBGridProperties);
	    grdUserAprv.bind( "afterpagechanged" , "fn_pagingUserAprv" );
	}

    async function fn_search() {
    	let recordCountPerPage = grdUserAprv.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
		var getColRef = grdUserAprv.getColRef("checkedYn");
		grdUserAprv.setFixedcellcheckboxChecked(0, getColRef, false);
		grdUserAprv.movePaging(currentPageNo);
    }

    /**
     * @name fn_setGrdUserAprv
     * @description 사용자승인목록 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdUserAprv = async function(recordCountPerPage, currentPageNo) {
		let apcCd = SBUxMethod.get("gsb-slt-apcCd");	//	사용자상태
        let userStts = SBUxMethod.get("srch-slt-userStts");	//	사용자상태
        let userNm = SBUxMethod.get("srch-inp-userNm");     // 	사용자명
        let userId = SBUxMethod.get("srch-inp-userId");     // 	사용자ID

		const postJsonPromise = gfn_postJSON("/co/user/selectUserAprvList.do", {
			apcCd: apcCd,
			userStts: userStts,
			userNm: userNm,
			userId: userId,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : currentPageNo,
   		  	recordCountPerPage : recordCountPerPage
  		});

        const data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonUserAprv.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const userAprv = {
  	  						rowSeq: 	item.rowSeq,
  	  						apcCd: 		item.apcCd,
  	  						userId: 	item.userId,
  	  						userNm: 	item.userNm,
  	  						apcNm: 		item.apcNm,
  	  						userStts: 	item.userStts,
  	  						userSttsNm: item.userSttsNm,
  	  						userType: 	item.userType,
  	  						userTypeNm: item.userTypeNm,
  	  						eml: 		item.eml,
  	  						telno: 		item.telno,
  	  						jbttlNm: 	item.jbttlNm,
  	  						tkcgTaskNm: item.tkcgTaskNm
  	  				}
  	          		jsonUserAprv.push(userAprv);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});

  	          	if (jsonUserAprv.length > 0) {
  	          		if(grdUserAprv.getPageTotalCount() != data.resultList[0].totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			grdUserAprv.setPageTotalCount(data.resultList[0].totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			grdUserAprv.rebuild();
  	    				}else{
  	    					grdUserAprv.refresh();
  	    				}

  	          		grdUserAprv.setRow(2);
  	          	} else {
  	          		grdUserAprv.setPageTotalCount(0);
  	          		grdUserAprv.rebuild();
  	          	}

  	          	document.querySelector('#cnt-userAprv').innerText = totalRecordCount;

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

  	// 페이징
     async function fn_pagingUserAprv(){
     	let recordCountPerPage = grdUserAprv.getPageSize();   		// 몇개의 데이터를 가져올지 설정
     	let currentPageNo = grdUserAprv.getSelectPageIndex();
     	fn_setGrdUserAprv(recordCountPerPage, currentPageNo);
     }
	const fn_userAprv = async function() {

		const userAprvList = [];
		const allUserData = grdUserAprv.getGridDataAll();
		allUserData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				if (item.userType == "10"){
					userAprvList.push({
						  userStts : "01"
						, userType : item.userType
	    				, userId: item.userId
	    				, apcCd: item.apcCd
	    			});
				}else{
					userAprvList.push({
						  userStts : "01"
						, userType : "10"
						, userId   : item.userId
						, apcCd: item.apcCd
					});
				}
    		}
		});

		if (userAprvList.length == 0) {
			gfn_comAlert("W0001", "승인대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "승인")) {
			return;
		}
    	const postJsonPromise = gfn_postJSON("/co/user/insertUserAprvList.do", userAprvList);
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

	const fn_allUserAprv = async function() {

		const userAprvList = [];
		const allUserData = grdUserAprv.getGridDataAll();

		console.log('allUserData', allUserData);
		allUserData.forEach((item, index) => {
			if(item.userType == "10"){
				userAprvList.push({
					  userStts : "01"
				  	, userType : "10"
    				, userId   : item.userId
    				, apcCd: item.apcCd
    			});
			}else if(item.userType == "11"){
				console.log('userType11', item.userId);
			}
		});

		if (userAprvList.length == 0) {
			gfn_comAlert("W0001", "승인대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "승인")) {
			return;
		}
		console.log('userAprvList', userAprvList);
    	const postJsonPromise = gfn_postJSON("/co/user/insertUserAprvList.do", userAprvList);
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

	const fn_save = async function() {
		const userTypeChgList = [];
		const allUserData = grdUserAprv.getGridDataAll();

		allUserData.forEach((item, index) => {
			if(item.checkedYn === "Y"){
				userTypeChgList.push({
				  	  userType : item.userType
    				, userId   : item.userId
    			});
			}
		});
		if (userTypeChgList.length == 0) {
			gfn_comAlert("W0001", "저장대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		const postJsonPromise = gfn_postJSON("/co/user/updateUserTypeList.do", userTypeChgList);
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
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_init();
	}

</script>

</html>