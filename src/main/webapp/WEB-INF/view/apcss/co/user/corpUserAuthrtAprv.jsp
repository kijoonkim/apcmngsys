<%
 /**
  * @Class Name : corpUserAuthrtAprv.jsp
  * @Description : 법인 사용자 승인 화면
  * @author SI개발부
  * @since 2024.08.30
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.08.30   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 법인 사용자 승인</title>
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
					<sbux-checkbox
							id="chkboxDtlArtcl"
							name="chkboxDtlArtcl"
							uitype="normal"
							text ="상세항목"
							true-value = "Y"
							false-value = "N"
							text-right-padding="5px"
							onclick = "fn_chkDtlArtcl"
					></sbux-checkbox>

					<sbux-button
						id="btn-aprvReg" 
						name="btn-aprvReg" 
						uitype="normal" 
						text="승인" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_insert"
					></sbux-button>
					 
					<sbux-button 
						id="btn-aprvCncl" 
						name="btn-aprvCncl" 
						uitype="normal" 
						text="승인취소" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_cancel"
					></sbux-button>
					
					<sbux-button 
						id="btn-search" 
						name="btn-search" 
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
							<th scope="row">승인상태</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
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
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">법인명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-corpNm"
									name="srch-inp-corpNm"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									autocomplete="off"
									title=""
									maxlength="30"
								></sbux-input>
							</td>
							<th scope="row">법인번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-crno"
									name="srch-inp-crno"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									autocomplete="off"
									title=""
									maxlength="30"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">신청여부</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-aplyYn"
									name="srch-slt-aplyYn"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonComAplyYn"
									unselected-text="전체"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>							
							<th scope="row">사용자명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
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
							<th scope="row">사용자ID</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
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
						</tr>
					</tbody>
				</table>
				<div style="display: flex ; flex-direction : row; gap : 10px"; >

					<div style="flex: 8;">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>
									<span>사용자 목록</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-userAprv">0</span>건)</span>
								</li>
								<li>
									<span style="font-size:10px;color:blue;">업무시스템 - MES : 생산관리, FM : 농가관리, PD : 생산유통통합조직, CS : APC전수조사 </span>
								</li>
							</ul>
							<div class="ad_tbl_toplist_datepk">
								<table class="table table-bordered tbl_fixed">
									<caption>검색 조건 설정</caption>
									<colgroup>
										<col style="width: auto">
										<col style="width: 110px">
										<col style="width: 100px">
										<!--<col style="width: 80px">-->
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
										<!--
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
                                        -->
									</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div id="sb-area-grdUserAprv" style="height:576px;"></div>
					</div>

					<div style = "flex: 2; display: none" id="dtlArtcl" >
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>상세항목</span></li>
							</ul>
							<div style="height: 5px"></div>
							<sbux-button id="btn-saveDtlArtcl" name="btn-saveDtlArtcl" uitype="normal" text="상세저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveDtlArtcl"></sbux-button>
						</div>
						<div id="" style="height:529px;">
							<table class="table table-bordered tbl_fixed">
								<caption>상세항목</caption>
								<tbody>
								<tr>
									<th scope="row" class="th_bg">법인코드</th>
									<td class="td_input" >
										<sbux-input id="dtl-inp-corpCd" name="dtl-inp-corpCd" uitype="text" class="form-control input-sm"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">사용자카테고리</th>
									<td class="td_input" >
										<sbux-input id="dtl-inp-userCtrgy" name="dtl-inp-userCtrgy" uitype="text" class="form-control input-sm"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">직원코드</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-empCd" name="dtl-inp-empCd" uitype="text" class="form-control input-sm"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">부서코드</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-deptCd" name="dtl-inp-deptCd" uitype="text" class="form-control input-sm"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">인사관리자여부</th>
									<td class="td_input">
										<sbux-select id="dtl-slt-hrmMngrYn" name="dtl-slt-hrmMngrYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonUseYn"></sbux-select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">인사평가역할</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-hrmEvlRole" name="dtl-inp-hrmEvlRole" uitype="text" class="form-control input-sm"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">급여관리자여부</th>
									<td class="td_input">
										<sbux-select id="dtl-slt-hrmPayMngrYn" name="dtl-slt-hrmPayMngrYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonUseYn"></sbux-select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">회계관리자여부</th>
									<td class="td_input">
										<sbux-select id="dtl-slt-acntgMngrYn" name="dtl-slt-acntgMngrYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonUseYn"></sbux-select>
									</td>
								</tr>
								<sbux-input id="dtl-inp-userId" name="dtl-inp-userId" uitype="hidden"></sbux-input>
								</tbody>
							</table>
						</div>
					</div>
				</div>



				</div>
			</div>
	</section>
	
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-untyOgnz" 
        	name="modal-untyOgnz" 
        	uitype="middle" 
        	header-title="통합조직 선택" 
        	body-html-id="body-modal-untyOgnz" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-untyOgnz">
    	<jsp:include page="../../co/popup/comUntyOgnzPopup.jsp"></jsp:include>
    </div>
	
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
		{'text': '승인취소', 'value': '09'},
	];
	var jsonComAplyYn = [
		{'text': '신청', 'value': 'Y'},
		{'text': '미신청', 'value': 'N'},
	];
	
	var jsonUntyAuthrtType = [];
	
	var jsonUntyOgnz = [];

    var jsonUntyCtpv = [];
    var jsonUntySgg = [];
	
	
	var grdUserAprv;
	var jsonUserAprv = [];

	// 상세항목
	var jsonUseYn = [
		{text:"예", value:"Y"},
		{text:"아니오", value:"N"}
	];

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		//await gfn_setComCdSBSelect('srch-slt-userStts', jsonComUserStts, 'USER_STTS');
// 		await gfn_setComCdGridSelect('grdUserAprv', 	jsonUserType,    'USER_TYPE');	// 사용유무
		SBUxMethod.set("srch-slt-userStts", "00");
		SBUxMethod.set("srch-slt-pageSize", "50");
		
		//await fn_initSBSelect();
		
		fn_createGridUserAprv();
	}

	const fn_initSBSelect = async function() {
		
		let result = await Promise.all([
			gfn_getComCdDtls("USER_TYPE"),
			gfn_getComCdDtls("UNTY_AUTHRT_TYPE"),
			gfn_getComCdDtls("UNTY_CTPV"),
			gfn_getComCdDtls("UNTY_SGG"),
			//fn_getApcOgnz()
		]);
		
		jsonComUserType = result[0];
		jsonUntyAuthrtType = result[1];
        jsonUntyCtpv = result[2];
        jsonUntySgg = result[3];
		
		SBUxMethod.refresh("srch-slt-userType");
		SBUxMethod.refresh("srch-slt-untyAuthrtType");
		SBUxMethod.refresh("srch-slt-untyCtpv");
		SBUxMethod.refresh("srch-slt-untySgg");
	}
	
	const fn_getApcOgnz = async function() {
		
		jsonUntyOgnz.length = 0;
		
		const postJsonPromise = gfn_postJSON("/co/ognz/selectOgnzList.do", {
          	// pagination
  	  		pagingYn : 'N',
  		});

        const data = await postJsonPromise;
		
		try {
  			
  			if (!_.isEqual("S", data.resultStatus)) {
  	      		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
  	      		return;
	      	}
  			
  			jsonApcOgnz = data.resultList;
  			
		} catch (e) {
	   		if (!(e instanceof Error)) {
	   			e = new Error(e);
	   		}
	   		console.error("failed", e.message);
	       	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
		
		console.log("jsonApcOgnz", jsonApcOgnz);
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
        		caption: ["관리자"], 	 
	        	ref: 'authrtMngrYn', 
	        	type: 'checkbox',  
	        	width:'70px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "authrtMngrYn"},
        	},
        	
        	{
        		caption: ["MES"],
        		ref: 'sysMesYn', 
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "sysMesYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">APC생산관리</span></div>'
        	},
        	{
        		caption: ["FM"], 	 
	        	ref: 'sysFmYn', 
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "sysFmYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">농가관리</span></div>'
        	},
        	{
        		caption: ["PD"], 	 
	        	ref: 'sysPdYn', 
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "sysPdYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">생산유통통합조직등록</span></div>'
        	},
        	{
        		caption: ["CS"], 	 
	        	ref: 'sysCsYn', 
	        	type: 'checkbox',  
	        	width:'50px', 
	        	style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                userattr: {colNm: "sysCsYn"},
                columnhint : '<div style="width:150px;"><span style="color:red;">APC전수조사</span></div>'
        	},
        	{
        		caption: ["법인명"],
        		ref: 'ognzNm',      
        		type:'output',  	
        		width:'100px', 
        		style:'text-align:left'
        	},
        	{
        		caption: ["법인번호"],
        		ref: 'crno',      
        		type:'output',  	
        		width:'100px', 
        		style: 'text-align:center',
                format : {
                	type:'string',
                	rule:'0000-00-000000-0'
                }
        	},
        	{
        		caption: ["사업자번호"],
        		ref: 'brno',      
        		type:'output',  	
        		width:'100px', 
        		style: 'text-align:center',
                format : {
                	type:'string',
                	rule:'000-00-00000'
                }
        	},
        	{
	        	caption: ["첨부파일"],		
	        	ref: 'brcAtchflNm',   	
	        	type:'output',  	
	        	width:'120px', 
	        	style:'text-align:center;color:blue;text-decoration: underline;',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (!gfn_isEmpty(strValue)){
	            		return "<a href='#' onClick='fn_getUserFile(" + nRow + ")'>" + strValue + "</a>";
	            	} else {
				        return "";
					}
		    	}
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
	        {
	        	caption: ["이메일주소"],		
	        	ref: 'eml',   	
	        	type:'output',  	
	        	width:'200px', 
	        	style:'text-align:left'
	        },
        	{
        		caption: ["관리자신청"], 		
        		ref: 'mngrAplyYn',	
        		type:'output',  	
        		width:'80px', 
        		style:'text-align:center'
        	},
        	{
        		caption: ["업무권한신청"], 		
        		ref: 'authrtAplyYn',	
        		type:'output',  	
        		width:'80px', 
        		style:'text-align:center'
        	},
        	{
        		caption: ["신청업무시스템"], 		
        		ref: 'aplySysId',	
        		type:'output',  	
        		width:'150px', 
        		style:'text-align:left'
        	},
		];
		
	    grdUserAprv = _SBGrid.create(SBGridProperties);
	    grdUserAprv.bind( "afterpagechanged" , fn_pagingUserAprv);
	    grdUserAprv.bind('valuechanged', fn_grdUserAprvValueChanged);
	    grdUserAprv.bind('click', fn_clickGrdUserAprv);
	}

    const fn_search = async function() {
    	
    	jsonUserAprv.length = 0;
    	
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
		
		const userStts = SBUxMethod.get("srch-slt-userStts");			//	사용자상태
		const corpNm = gfn_nvl(SBUxMethod.get("srch-inp-corpNm"));		//	법인명
		const crno = gfn_nvl(SBUxMethod.get("srch-inp-crno"));			//	법인등록번호
		
		const userNm = SBUxMethod.get("srch-inp-userNm");     // 	사용자명
		const userId = SBUxMethod.get("srch-inp-userId");     // 	사용자ID
		const aplyYn = SBUxMethod.get("srch-slt-aplyYn");     // 	신청여부
		
		console.log("corpNm", corpNm);
		console.log("crno", crno);
		
		const postJsonPromise = gfn_postJSON("/co/user/selectCorpUserAprvList.do", {
			userStts: userStts,
			corpNm: corpNm,
			crno: crno,
			userNm: userNm,
			userId: userId,
			aplyYn: aplyYn,
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
          		const user = {
					rowSeq: 		item.rowSeq,
					apcCd: 			item.apcCd,
					userId: 		item.userId,
					userNm: 		item.userNm,
					apcNm: 			item.apcNm,
					userStts: 		item.userStts,
					userSttsNm: 	item.userStts == "01" ? "승인완료" : item.userSttsNm,
					userType: 		item.userType,
					userTypeNm: 	item.userTypeNm,
					eml: 			item.eml,
					telno: 			item.telno,
					jbttlNm: 		item.jbttlNm,
					tkcgTaskNm: 	item.tkcgTaskNm,
					mblTelno:		item.mblTelno,
					coTelno:		item.coTelno,
					odSbmsnYn:		item.odSbmsnYn,
					aplyDocSbmsnYn:	item.aplyDocSbmsnYn,
					ognzCd:			item.ognzCd,
					ognzNm:			item.ognzNm,
					crno:			item.crno,
					brno:			item.brno, /* 20250116 빠진 사업자번호 추가 함 */
					jbps: 			item.jbps,
					authrtMngrYn:	item.authrtMngrYn,
					aplyYn:			item.aplyYn,
					sysMesYn:		item.sysMesYn,
					sysFmYn:		item.sysFmYn,
					sysPdYn:		item.sysPdYn,
					sysCsYn:		item.sysCsYn,
					mngrAplyYn:		item.mngrAplyYn,
					authrtAplyYn:	item.authrtAplyYn,
					aplySysId:		item.aplySysId,
					brcAtchflSn:	item.brcAtchflSn,
					brcAtchflNm:	item.brcAtchflNm,

					corpCd: 		item.corpCd,
					userCtrgy: 		item.userCtrgy,
					empCd: 			item.empCd,
					deptCd: 		item.deptCd,
					hrmMngrYn: 		item.hrmMngrYn,
					hrmEvlRole: 	item.hrmEvlRole,
					hrmPayMngrYn: 	item.hrmPayMngrYn,
					acntgMngrYn: 	item.acntgMngrYn
  				}
          		
          		jsonUserAprv.push(user);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonUserAprv.length > 0) {
          		if (grdUserAprv.getPageTotalCount() != data.resultList[0].totalRecordCount) {	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdUserAprv.setPageTotalCount(data.resultList[0].totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdUserAprv.rebuild();
   				} else {
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
  		
		jsonUserAprv.length = 0;
     	let recordCountPerPage = grdUserAprv.getPageSize();   		// 몇개의 데이터를 가져올지 설정
     	let currentPageNo = grdUserAprv.getSelectPageIndex();
     	fn_setGrdUserAprv(recordCountPerPage, currentPageNo);
    }
  	
	/**
	 * @name fn_insert
	 * @description 법인사용자승인등록
	 */
	const fn_insert = async function() {

		const aprvList = [];
		const allData = grdUserAprv.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++) {

			const item = allData[i];
			if (item.checkedYn === "Y") {
				
				aprvList.push({
					userId: item.userId,
    				authrtMngrYn: 	item.authrtMngrYn,
    				sysMesYn:		item.sysMesYn,
    				sysFmYn: 		item.sysFmYn,
    				sysPdYn: 		item.sysPdYn,
    				sysCsYn: 		item.sysCsYn,
    			});	
    		}
		}

		if (aprvList.length == 0) {
			gfn_comAlert("W0001", "승인대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "승인")) {
			return;
		}
		
    	const postJsonPromise = gfn_postJSON("/co/user/insertCorpAprvList.do", aprvList);
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
	 * @name fn_cancel
	 * @description 법인사용자승인취소
	 */
	const fn_cancel = async function() {

		const userList = [];
		const allData = grdUserAprv.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++) {

			const item = allData[i];
			if (item.checkedYn === "Y") {
				
				userList.push({
					userId: item.userId
    			});	
    		}
		}

		if (userList.length == 0) {
			gfn_comAlert("W0001", "승인취소대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "승인")) {
			return;
		}
		
    	const postJsonPromise = gfn_postJSON("/co/user/deleteCorpAprvList.do", userList);
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
				case "authrtMngrYn":
				case "sysMesYn":
				case "sysFmYn":
				case "sysPdYn":
				case "sysCsYn":
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

		
	const fn_getUserFile = async function(_nRow) {
		
		const rowData = grdUserAprv.getRowData(_nRow);
		
		const postJsonPromise = gfn_postJsonForDownload("/co/user/downloadUserFile.do", {
			userId: rowData.userId,
			brcAtchflSn: rowData.brcAtchflSn
  		});
		
        const data = await postJsonPromise;

  		try {
  			
  			if (data != null) {
  				const a = document.createElement("a");
  		        a.href = URL.createObjectURL(data);
  		        a.setAttribute("download", rowData.brcAtchflNm);
  		        a.click();
  			}
  			
  			
		} catch (e) {
	   		if (!(e instanceof Error)) {
	   			e = new Error(e);
	   		}
	   		console.error("failed", e.message);
	       	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	    }
		
				/*
		const response = await fetch('api address');
		const file = await response.blob(); 
		  const downloadUrl = window.URL.createObjectURL(file); // 해당 file을 가리키는 url 생성
		 
		  const anchorElement = document.createElement('a');
		  document.body.appendChild(anchorElement);
		  anchorElement.download = 'some file'; // a tag에 download 속성을 줘서 클릭할 때 다운로드가 일어날 수 있도록 하기
		  anchorElement.href = downloadUrl; // href에 url 달아주기
		 
		  anchorElement.click(); // 코드 상으로 클릭을 해줘서 다운로드를 트리거
		 
		  document.body.removeChild(anchorElement); // cleanup - 쓰임을 다한 a 태그 삭제
		  window.URL.revokeObjectUrl(downloadUrl); // cleanup - 쓰임을 다한 url 객체 삭제
		*/
	}
	
	
	
    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdUserAprv.exportLocalExcel(
    			"법인사용자승인요청정보", 
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

	/**
	 * @name fn_chkDtlArtcl
	 * @description 상세항목 checkbox event
	 */
	const fn_chkDtlArtcl = function() {
		let chk = SBUxMethod.get("chkboxDtlArtcl").chkboxDtlArtcl;
		const div = document.getElementById('dtlArtcl');
		if (chk === "Y") {
			div.style.display = 'block';
		} else {
			div.style.display = 'none';
		}
		grdUserAprv.rebuild();
	}

	/**
	 * @name fn_clickGrdUserAprv
	 * @description 사용자 내역 click event
	 */
	const fn_clickGrdUserAprv = async function() {
		fn_clearDtlArtcl();
		const row = grdUserAprv.getRow();
		let rowData = grdUserAprv.getRowData(row);
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("dtl-inp-corpCd",gfn_nvl(rowData.corpCd));				// 법인코드
			SBUxMethod.set("dtl-inp-userCtrgy",gfn_nvl(rowData.userCtrgy));			// 사용자카테코리
			SBUxMethod.set("dtl-inp-empCd",gfn_nvl(rowData.empCd));					// 직원코드
			SBUxMethod.set("dtl-inp-deptCd",gfn_nvl(rowData.deptCd));				// 부서코드
			SBUxMethod.set("dtl-slt-hrmMngrYn",rowData.hrmMngrYn);					// 인사관리자여부
			SBUxMethod.set("dtl-inp-hrmEvlRole",gfn_nvl(rowData.hrmEvlRole));		// 인사평가역할
			SBUxMethod.set("dtl-slt-hrmPayMngrYn",rowData.hrmPayMngrYn);			// 급여관리자여부
			SBUxMethod.set("dtl-slt-acntgMngrYn",rowData.acntgMngrYn); 				// 회계관리자여부
			SBUxMethod.set("dtl-inp-userId",gfn_nvl(rowData.userId));
		} else {
			return;
		}
	}

	/**
	 * @name fn_saveDtlArtcl
	 * @description 상세항목 저장
	 */
	const fn_saveDtlArtcl = async function() {
		const userId = SBUxMethod.get("dtl-inp-userId");
		const corpCd = SBUxMethod.get("dtl-inp-corpCd");
		const userCtrgy= SBUxMethod.get("dtl-inp-userCtrgy");
		const empCd = SBUxMethod.get("dtl-inp-empCd");
		const deptCd= SBUxMethod.get("dtl-inp-deptCd");
		const hrmMngrYn = SBUxMethod.get("dtl-slt-hrmMngrYn");
		const hrmEvlRole = SBUxMethod.get("dtl-inp-hrmEvlRole");
		const hrmPayMngrYn = SBUxMethod.get("dtl-slt-hrmPayMngrYn");
		const acntgMngrYn = SBUxMethod.get("dtl-slt-acntgMngrYn");

		const saveParam = {
			userId : userId,
			corpCd : corpCd,
			userCtrgy : userCtrgy,
			empCd : empCd,
			deptCd : deptCd,
			hrmMngrYn : hrmMngrYn,
			hrmEvlRole : hrmEvlRole,
			hrmPayMngrYn : hrmPayMngrYn,
			acntgMngrYn : acntgMngrYn
		}

		if (gfn_isEmpty(userId)) {
			gfn_comAlert("W0005", "상세항목 저장대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "상세항목저장")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		try {

			const postJsonPromise = gfn_postJSON("/co/user/saveComUserAdmstMngArtcl.do",saveParam);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				fn_search();
				fn_clearDtlArtcl();
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

	/**
	 * @name fn_clearDtlArtcl
	 * @description 상세항목 clear
	 */
	const fn_clearDtlArtcl = function() {
		SBUxMethod.clear("dtl-inp-corpCd");
		SBUxMethod.clear("dtl-inp-userCtrgy");
		SBUxMethod.clear("dtl-inp-empCd");
		SBUxMethod.clear("dtl-inp-deptCd");
		SBUxMethod.refresh("dtl-slt-hrmMngrYn");
		SBUxMethod.clear("dtl-inp-hrmEvlRole");
		SBUxMethod.refresh("dtl-slt-hrmPayMngrYn");
		SBUxMethod.refresh("dtl-slt-acntgMngrYn");
		SBUxMethod.clear("dtl-inp-userId");
	}
	
</script>

</html>