<%
 /**
  * @Class Name : untyUserAprvReg.jsp
  * @Description : 통합권한승인등록 화면
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
	<title>title : 통합사용자승인등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">

	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- APC관리자승인등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnInsert" 
						name="btnInsert" 
						uitype="normal" 
						text="승인" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_userAprv"
					></sbux-button>
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
			<div>
			</div>
			<div class="box-body">
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
									unselected-text="전체"
									onchange="fn_search"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">사용자유형</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-userType"
									name="srch-slt-userType"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonComUserType"
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									unselected-text="전체"
									onchange="fn_search"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">권한유형</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-untyAuthrtType"
									name="srch-slt-untyAuthrtType"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonUntyAuthrtType"
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									unselected-text="전체"
									onchange="fn_search"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-userNm"
									name="srch-inp-userNm"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									autocomplete="off"
									title=""
									maxlength="30"
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
									autocomplete="off"
									title=""
									maxlength="30"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row"></th>
							<td class="td_input" style="border-right: hidden;">
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
					</tbody>
				</table>
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>요청목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-userAprv">0</span>건)</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist_datepk">
							<table class="table table-bordered tbl_fixed">
					 			<caption>검색 조건 설정</caption>
								<colgroup>
									<col style="width: auto">
									<col style="width: 110px">
									<col style="width: 100px">
									<col style="width: 80px">
								</colgroup>
								<tbody>
									<tr>
										<td style="border-left:hidden"></td>
										<td class="td_input" style="border-right:hidden; border-left:hidden" >
											<span>표시건수 :</span>
										</td>
										<td class="td_input" style="border-right:hidden; border-left:hidden" >
											<sbux-select
												id="srch-slt-pageSize"
												name="srch-slt-pageSize"
												uitype="single"
												class="form-control input-sm"
												jsondata-ref="jsonPageSize"
												onchange="setPageSize"
											></sbux-select>
										</td>
										<td class="td_input" style="border-right:hidden;">
											<sbux-button
												id="btnAllSave" 
												name="btnAllSave" 
												uitype="normal" 
												text="일괄승인" 
												class="btn btn-sm btn-outline-danger" 
												onclick="fn_allUserAprv()" 
											></sbux-button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="sb-area-grdUserAprv" style="height:576px;"></div>
				</div>
			</div>
	</section>
</body>

<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {

	}
	async function cfn_add() {
	
	}
	async function cfn_del() {

	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}

	var jsonPageSize = [
		{'text': '50건', 'value': '50'},
		{'text': '100건', 'value': '100'},
		{'text': '200건', 'value': '200'},
		{'text': '500건', 'value': '500'},
		{'text': '1000건', 'value': '1000'},
	]
	
	var jsonComUserType = [];
	var jsonComUserStts	= [
		{'text': '승인대기', 'value': '00'},
		{'text': '승인완료', 'value': '01'},
	];
	var jsonUntyAuthrtType = [];
	
	var grdUserAprv;
	var jsonUserAprv = [];

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		//await gfn_setComCdSBSelect('srch-slt-userStts', jsonComUserStts, 'USER_STTS');
// 		await gfn_setComCdGridSelect('grdUserAprv', 	jsonUserType,    'USER_TYPE');	// 사용유무
		SBUxMethod.set("srch-slt-userStts", "00");
		SBUxMethod.set("srch-slt-pageSize", "50");
		
		await fn_initSBSelect();
		
		fn_createGridUserAprv();
	}

	const fn_initSBSelect = async function() {
		
		let result = await Promise.all([
			gfn_getComCdDtls("USER_TYPE"),
			gfn_getComCdDtls("UNTY_AUTHRT_TYPE"),
		]);
		
		jsonComUserType = result[0];
		jsonUntyAuthrtType = result[1];
		
		SBUxMethod.refresh("srch-slt-userType");
		SBUxMethod.refresh("srch-slt-untyAuthrtType");
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };
	
	const fn_createGridUserAprv = function() {
		var SBGridProperties = {};

	    SBGridProperties.parentid = 'sb-area-grdUserAprv';
	    SBGridProperties.id = 'grdUserAprv';
	    SBGridProperties.jsonref = 'jsonUserAprv';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'none';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 50,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.columns = [
        	{
        		caption: ["체크"], 	
        		ref: 'checkedYn', 	
        		type: 'checkbox',	
        		width:'40px',  
        		style:'text-align: center',
				typeinfo: {
					ignoreupdate : true, 
					fixedcellcheckbox : {usemode : true, rowindex : 0}, 
					checkedvalue : 'Y', 
					uncheckedvalue : 'N'
				}
        	},
	        {
        		caption: ["상태"], 		
        		ref: 'userSttsNm',	
        		type:'output',  	
        		width:'80px', 
        		style:'text-align:center'
        	},
	        {
        		caption: ["사용자ID"],  	
        		ref: 'userId',    	
        		type:'output',		
        		width:'200px', 
        		style:'text-align:left'
        	},
	        {
        		caption: ["사용자명"],   	
        		ref: 'userNm',      
        		type:'output',  	
        		width:'100px', 
        		style:'text-align:left'
        	},
        	{
        		caption: ["사용자유형"],   	
        		ref: 'userTypeNm',      
        		type:'output',  	
        		width:'120px', 
        		style:'text-align:center'
        	},
        	{
        	    caption: ["권한유형"],	
        	    ref: 'untyAuthrtType',	
        	    type:'combo',  		
        	    width:'100px', 
        	    style:'text-align:center',
        	    typeinfo : {
        	        ref:'jsonUntyAuthrtType', 
        	        label:'cdVlNm', 
        	        value:'cdVl', 
        	        displayui : true
        	    },
        	    userattr: {colNm: "untyAuthrtType"},
        	},
        	{
        		caption: ["조직관리자"], 	 
	        	ref: 'odSbmsnYnA', 
	        	type: 'checkbox',  
	        	width:'100px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: ''},
                userattr: {colNm: "yn"},
        	},
	        {
            	caption: ['사업자번호'],
            	ref: 'brno',
            	type: 'output',
                width: '180px',
                style: 'text-align:center',
                format : {
                	type:'string',
                	rule:'000-00-00000'
                }
	        },
	        {
	        	caption: ["통합조직"],		
	        	ref: 'untyOgnzNm',   	
	        	type:'output',  	
	        	width:'200px', 
	        	style:'text-align:left',
	        	userattr: {
	        		colNm: "apoNm"
	        	},
	        },
	        {
	        	caption: ["APC명"],		
	        	ref: 'apcNm',   	
	        	type:'output',  	
	        	width:'200px', 
	        	style:'text-align:left'
	        },
	        {
	        	caption: ["메일주소"],  	
	        	ref: 'eml',  		
	        	type:'output', 		
	        	width:'200px', 
	        	style:'text-align:left'
	        },
	    	{
	        	caption: ["전화번호"],  	
	        	ref: 'mblTelno',   	
	        	type:'output',  	
	        	width:'150px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["직책"],  	
	        	ref: 'jbttlNm',   	
	        	type:'output',  	
	        	width:'100px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["담당업무"],  	
	        	ref: 'tkcgTaskNm',  
	        	type:'output',  	
	        	width:'100px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption : ["공문제출"], 
	        	ref: 'odSbmsnYn', 
	        	type: 'checkbox',  
	        	width:'100px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: ''},
                userattr: {colNm: "yn"},
            },
            {
	        	caption : ["이용신청서제출"], 
	        	ref: 'aplyDocSbmsnYn', 
	        	type: 'checkbox',  
	        	width:'100px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: ''},
                userattr: {colNm: "yn"},
            },
		];
		
	    grdUserAprv = _SBGrid.create(SBGridProperties);
	    grdUserAprv.bind( "afterpagechanged" , fn_pagingUserAprv);
	    grdUserAprv.bind('valuechanged', fn_grdUserAprvValueChanged);
	}

    const fn_search = async function() {
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
		
		const userStts = SBUxMethod.get("srch-slt-userStts");		//	사용자상태
		const userType = SBUxMethod.get("srch-slt-userType");		//	사용자유형
		const untyAuthrtType = SBUxMethod.get("srch-slt-untyAuthrtType");	//	통합권한유형
		
		const userNm = SBUxMethod.get("srch-inp-userNm");     // 	사용자명
		const userId = SBUxMethod.get("srch-inp-userId");     // 	사용자ID

		const postJsonPromise = gfn_postJSON("/co/user/selectUntyUserAprvList.do", {
			userStts: userStts,
			userType: userType,
			untyAuthrtType: untyAuthrtType,
			userNm: userNm,
			userId: userId,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : currentPageNo,
   		  	recordCountPerPage : recordCountPerPage
  		});

        const data = await postJsonPromise;

  		try {
  			
  			if (!_.isEqual("S", data.resultStatus)) {
  	      		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
  	      		return;
	      	}
  			
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
  						userSttsNm: item.userStts == "01" ? "승인완료" : item.userSttsNm,
  						userType: 	item.userType,
  						userTypeNm: item.userTypeNm,
  						eml: 		item.eml,
  						telno: 		item.telno,
  						jbttlNm: 	item.jbttlNm,
  						tkcgTaskNm: item.tkcgTaskNm,
  						mblTelno:	item.mblTelno,
  						odSbmsnYn:	item.odSbmsnYn,
  						aplyDocSbmsnYn:	item.aplyDocSbmsnYn,
  						untyOgnzNm:	item.untyOgnzNm,
  						untyOgnzId:	item.untyOgnzId,
  						untyOgnzType:	item.untyOgnzType,
  						untyAuthrtType:	item.untyAuthrtType,
  						brno:		item.brno,
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


          } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
          }
	}

  	// 페이징
	const fn_pagingUserAprv = async function (){
     	let recordCountPerPage = grdUserAprv.getPageSize();   		// 몇개의 데이터를 가져올지 설정
     	let currentPageNo = grdUserAprv.getSelectPageIndex();
     	fn_setGrdUserAprv(recordCountPerPage, currentPageNo);
    }
  	
	const fn_userAprv = async function() {

		const userAprvList = [];
		const allUserData = grdUserAprv.getGridDataAll();
		
		for ( let i=0; i<allUserData.length; i++) {
			
			const item = allUserData[i];
			
			if (item.checkedYn === "Y") {
				if (!_.isEqual(item.userStts, "00")){
					gfn_comAlert("W0010", "승인", "사용자");		//	W0010  이미 {0}된 {1} 입니다.	
					return;
				}
				
				if (item.userType == "10"){
					userAprvList.push({
						  userStts : "01"
						, userType : item.userType
	    				, userId: item.userId
	    				, apcCd: item.apcCd
	    			});
				} else{
					userAprvList.push({
						  userStts : "01"
						, userType : "10"
						, userId   : item.userId
						, apcCd: item.apcCd
					});
				}
    		}
		}

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

		allUserData.forEach((item, index) => {
			if (_.isEqual(item.userStts, "00")) {
				if (item.userType == "10"){
					userAprvList.push({
						  userStts : "01"
					  	, userType : "10"
	    				, userId   : item.userId
	    				, apcCd: item.apcCd
	    			});
				} else if(item.userType == "11"){
					console.log('userType11', item.userId);
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
				  	  userType 	: item.userType
    				, userId   	: item.userId
    				, odSbmsnYn	: item.odSbmsnYn
    				, aplyDocSbmsnYn : item.aplyDocSbmsnYn
    			});
			}
		});
		
		if (userTypeChgList.length == 0) {
			gfn_comAlert("W0001", "저장대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
    	if (!gfn_comConfirm("Q0001", "저장")) {
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
     * @name fn_grdUserAprvValueChanged
     * @description 그리드 변경 event 처리
     * @function
     */
	const fn_grdUserAprvValueChanged = function() {
		
		let nRow = grdUserAprv.getRow();
		let nCol = grdUserAprv.getCol();
		const usrAttr = grdUserAprv.getColUserAttr(nCol);
		const rowData = grdUserAprv.getRowData(nRow, false);	// deep copy
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			switch (usrAttr.colNm) {
				case "userType":
				case "yn":
					rowData.checkedYn = "Y";
					grdUserAprv.refresh({"focus":false});
					break;
			}
		}
		
 	}

	
	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_init();
	}

	
    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdUserAprv.exportLocalExcel(
    			"APC관리자승인요청정보", 
    			{
    				bSaveLabelData: true, 
    				bNullToBlank: true, 
    				bSaveSubtotalValue: true, 
    				bCaptionConvertBr: true, 
    				arrSaveConvertText: true
    			}
    		);
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdUserAprv.savePersonalInfo("apcCd");
	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdUserAprv.loadPersonalInfo("apcCd");
	}
 	// 열 숨기기
    function fn_colHidden(){
    	grdUserAprv.setColHidden(grdUserAprv.getCol(), true);
    }
 	// 열 보이기
	function fn_colShow(){
     	for (let i = grdUserAprv.getFixedCols(); i < grdUserAprv.getCols()-1; i++) {
     		grdUserAprv.setColHidden(i, false);
     	}
   	}
 	
	const setPageSize = function(){
		const size = parseInt(SBUxMethod.get("srch-slt-pageSize")) || 50;
		grdUserAprv.setPageSize(size);
		grdUserAprv.rebuild();
		fn_search();
	};
 	
	
</script>

</html>