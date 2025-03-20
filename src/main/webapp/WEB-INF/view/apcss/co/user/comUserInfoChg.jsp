<%
 /**
  * @Class Name : comUserInfoChg.jsp
  * @Description : 사용자정보변경 화면
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
	<title>title : 사용자정보변경</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 사용자정보변경 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnNew" name="btnNew" uitype="modal" text="신규" target-id="modal-account" class="btn btn-sm btn-outline-danger" onclick="fn_new"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%--<%@ include file="../../../frame/inc/apcSelectAll.jsp" %>--%>
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
							<th scope="row">사용자ID</th>
							<td colspan="3" td class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="srch-inp-userId" 
									name="srch-inp-userId" 
									uitype="text" 
									class="form-control input-sm" 
									placeholder=""
								></sbux-input>
							</td>
							<th scope="row">사용자명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="srch-inp-userNm" 
									name="srch-inp-userNm" 
									uitype="text" 
									class="form-control input-sm" 
									placeholder=""
								></sbux-input>
							</td>
							<th scope="row">회원구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select 
									id="srch-slt-mbrTypeCd" 
									name="srch-slt-mbrTypeCd" 
									uitype="single" 
									class="form-control input-sm" 
									unselected-text="전체" 
						            jsondata-value="cdVl"
						            jsondata-text="cdVlNm"
									jsondata-ref="jsonMbrTypeCd"
								>
							</td>
						</tr>
						<tr>
							<th scope="row">법인명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="srch-inp-ognzNm" 
									name="srch-inp-ognzNm" 
									uitype="text" 
									class="form-control input-sm" 
									placeholder="" 
									maxlength="20"
								></sbux-input>
							</td>
							<th scope="row">시/도</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-untyCtpv"
									name="srch-slt-untyCtpv"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonUntyCtpv"
						            jsondata-value="cdVl"
						            jsondata-text="cdVlNm"
									unselected-text="전체"
									onchange="fn_sggInit"
								></sbux-select>
							</td>
							<th scope="row">시/군/구</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-untySgg"
									name="srch-slt-untySgg"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonUntySgg"
									jsondata-value="cdVl"
									jsondata-text="cdVlNm"
									unselected-text="전체"
									filter-source-name="srch-slt-untyCtpv"
            						jsondata-filter="upCdVl"
									
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td class="td_input" colspan="3" style="border-right: hidden;">
								<%@ include file="../../../frame/inc/apcSelectCompAll.jsp" %>
							</td>
							<th scope="row" class="th_bg">상세항목</th>
							<td class="td_input" colspan="7">
								<sbux-checkbox id="chkboxAdmstMngArtcl" name="chkboxAdmstMngArtcl" text ="" uitype="normal" true-value = "Y" false-value = "N" onclick = "fn_chkAdmstMngArtcl()"></sbux-checkbox>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="display: flex ; flex-direction : row; gap : 10px";>
					<div style = "flex: 8">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>사용자 내역</span></li>
							</ul>
						</div>
						<div id="sb-area-grdComUser" style="height:570px;"></div>
					</div>

					<div style = "flex: 2; display: none" id="admstMngArtcl" >
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>상세항목</span></li>
							</ul>
							<div style="height: 5px"></div>
							<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="상세저장" class="btn btn-sm btn-outline-danger" onclick="fn_changeSave"></sbux-button>
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
											<sbux-select id="dtl-slt-hrmMngrYn" name="dtl-slt-hrmMngrYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComUseYn"></sbux-select>
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
											<sbux-select id="dtl-slt-hrmPayMngrYn" name="dtl-slt-hrmPayMngrYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComUseYn"></sbux-select>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">회계관리자여부</th>
										<td class="td_input">
											<sbux-select id="dtl-slt-acntgMngrYn" name="dtl-slt-acntgMngrYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComUseYn"></sbux-select>
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
		<!-- 계정생성 Modal -->
	    <div>
	        <sbux-modal id="modal-account" name="modal-account" uitype="middle" header-title="계정생성" body-html-id="body-modal-account" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
	    </div>
	    <div id="body-modal-account">
	    	<jsp:include page="../../co/popup/comNewAccount.jsp"></jsp:include>
	    </div>
	</section>
</body>
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
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

	var jsonUseYn 		= [];
	var jsonLckYn 		= [];
	var jsonUserType	= [];
	var jsonUserStts	= [];
	
	// 공통코드 JSON
	var jsonMbrTypeCd 	= [];
    var jsonUntyCtpv 	= [];
    var jsonUntySgg 	= [];
	
	var grdComUser;
	// 그리드 데이터
	var jsonComUser	= [];

	// 경영관리항목
	var jsonComUseYn = [
		{text:"예", value:"Y"},
		{text:"아니오", value:"N"}
	];
    
	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		
		await fn_initSBSelect();
		fn_createGrid();
	}
    
	const fn_initSBSelect = async function() {
		
		let result = await Promise.all([
			gfn_getComCdDtls("TYPE_CD"),
			gfn_getComCdDtls("UNTY_CTPV"),
			gfn_getComCdDtls("UNTY_SGG"),
			
			gfn_setComCdGridSelect('userInfoChgGridId',		jsonUseYn, 				'REVERSE_YN'),	// 사용유무
			gfn_setComCdSBSelect('userInfoChgGridId', 		jsonLckYn, 				'LCK_YN'),		// 잠김여부
			gfn_setComCdSBSelect('srch-slt-comUserStts', 	jsonUserStts,			'USER_STTS'),	// 사용자상태
			gfn_setComCdSBSelect('srch-slt-comUserType', 	jsonUserType,			'USER_TYPE'),	// 사용자상태
		
		]);
		
		jsonMbrTypeCd 	= result[0];
	    jsonUntyCtpv 	= result[1];
	    jsonUntySgg 	= result[2];
	    
		SBUxMethod.refresh("srch-slt-mbrTypeCd");
		SBUxMethod.refresh("srch-slt-untyCtpv");
		SBUxMethod.refresh("srch-slt-untySgg");
	}

	const fn_sggInit = function() {
		SBUxMethod.set("srch-slt-untySgg", "");
		//SBUxMethod.refresh("srch-slt-untySgg");
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	
	
	const fn_createGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdComUser';
	    SBGridProperties.id = 'grdComUser';
	    SBGridProperties.jsonref = 'jsonComUser';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.frozencols = 3;
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.paging = {
   			'type' : 'page',
   		  	'count' : 5,
   		  	'size' : 50,
   		  	'sorttype' : 'page',
   		  	'showgoalpageui' : true
    	};
	    SBGridProperties.columns = [
			{
	        	caption: ["체크박스"], 		
	        	ref: 'checkedYn', 	
	        	type: 'checkbox',	
	        	width: '40px',	style:'text-align: center',
				typeinfo: {
					ignoreupdate : true, 
					fixedcellcheckbox : {
						usemode : true, rowindex : 0
					}, 
					checkedvalue : 'Y', 
					uncheckedvalue : 'N'
					
				}
			},
	        {
				caption: ["사용자ID"], 		
				ref: 'userId',     	
				type:'output',   	
				width:'180px', 	
				style:'text-align:center'
			},
	        {
				caption: ["사용자명"], 		
				ref: 'userNm',    	
				type:'output',  	
				width:'105px', 	
				style:'text-align:center'
			},
	        {
				caption: ["비밀번호"],    	
				ref: 'pswd',        
				type:'button',  	
				width:'51px', 	
				style:'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	 	        	if (strValue != null && strValue != ""){
	 	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_callUpdateUserPsd(\"UPD\", \"grdComUser\", " + nRow + ", " + nCol + ")'>초기화</button>";
	 	        	}
	 	        }
			},
	        {
				caption: ["APC명"],	    
				ref: 'apcNm',   	
				type:'output',  	
				width:'105px', 	
				style:'text-align:center'
			},
	        {
	        	caption: ["회원구분"],    	
	        	ref: 'mbrTypeNm',  
	        	type:'output',  
	        	width:'120px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["메일주소"],	    
	        	ref: 'eml', 		
	        	type:'input',  		
	        	width:'200px', 	
	        	style:'text-align:center',
				validate : gfn_chkByte.bind({byteLimit: 320})
			},
	        {
				caption: ["휴대전화"], 
				ref: 'mblTelno',   	
				type:'input',  		
				width:'105px', 	
				style:'text-align:center',
	        	validate : gfn_chkByte.bind({byteLimit: 11})
	        },
	        {
	        	caption: ["직책명"],  		
	        	ref: 'jbttlNm',   	
	        	type:'input',   	
	        	width:'105px', 	
	        	style:'text-align:center',
				validate : gfn_chkByte.bind({byteLimit: 100}),
	        	hidden: true
			},
	        {
				caption: ["담당업무"],  		
				ref: 'tkcgTaskNm',  
				type:'input',   	
				width:'105px', 	
				style:'text-align:center',
				validate : gfn_chkByte.bind({byteLimit: 100}),
	        	hidden: true
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
        		width:'120px', 
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
        		width:'120px', 
        		style: 'text-align:center',
                format : {
                	type:'string',
                	rule:'000-00-00000'
                }
        	},
        	{
        		caption: ["시/도"],
        		ref: 'ctpvNm',      
        		type:'output',  	
        		width:'100px', 
        		style:'text-align:left'
        	},
        	{
        		caption: ["시/군/구"],
        		ref: 'sggExpln',      
        		type:'output',  	
        		width:'100px', 
        		style:'text-align:left'
        	},
        	{
	        	caption: ["부서"],		
	        	ref: 'coNm',   	
	        	type:'input',  	
	        	width:'80px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["직위"],		
	        	ref: 'jbps',   	
	        	type:'input',  	
	        	width:'80px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["전화번호"],		
	        	ref: 'coTelno',   	
	        	type:'input',  	
	        	width:'120px', 
	        	style:'text-align:left'
	        },
	        {
				caption: ["사용유무"],  		
				ref: 'delYn',   	
				type:'combo',   	
				width:'105px', 	
				style:'text-align:center',
				typeinfo : {
					ref:'jsonUseYn', 
					label:'label', 
					value:'value', 
					displayui : true
				}
	        },
	        {
	        	caption: ["잠김여부"],  		
	        	ref: 'lckYn',   	
	        	type:'combo',   	
	        	width:'105px', 
	        	style:'text-align:center',
				typeinfo : {
					ref:'jsonLckYn', 
					label:'label', 
					value:'value', 
					displayui : true
				}
	        },
	        {
	        	caption: ["최종접속일시"],	
	        	ref: 'endLgnDt',  	
	        	type:'output',  	
	        	width:'105px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["APC코드"],		
	        	ref: 'apcCd',   	
	        	type:'output', 		
	        	hidden: true
	        }
	    ];
	    grdComUser = _SBGrid.create(SBGridProperties);
	    grdComUser.bind("afterpagechanged", fn_pagingComUser);
		grdComUser.bind("click", fn_clickGrdComUser);
	}

	const fn_search = async function() {
		let recordCountPerPage = grdComUser.getPageSize();  		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = 1;
		grdComUser.movePaging(currentPageNo);
		fn_clearAdmstMngArtcl();
	}

	//페이징
	const fn_pagingComUser = async function() {
		let recordCountPerPage = grdComUser.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdComUser.getSelectPageIndex();
		var getColRef = grdComUser.getColRef("checkedYn");
		grdComUser.setFixedcellcheckboxChecked(0, getColRef, false);
		fn_setGrdComUser(recordCountPerPage, currentPageNo);
	}

	const fn_setGrdComUser = async function(recordCountPerPage, currentPageNo) {

		let totalRecordCount = 0;
		jsonComUser.length = 0;
		
		const apcCd = SBUxMethod.get("gsb-slt-apcCd");
		const userId = SBUxMethod.get("srch-inp-userId");
		const userNm = SBUxMethod.get("srch-inp-userNm");
		const mbrTypeCd = SBUxMethod.get("srch-slt-mbrTypeCd");
		const ognzNm = SBUxMethod.get("srch-inp-ognzNm");
		const ctpv = SBUxMethod.get("srch-slt-untyCtpv");
		const sgg = SBUxMethod.get("srch-slt-untySgg");

		const param = {
			apcCd: apcCd,
			userId: userId,
			userNm: userNm,
			mbrTypeCd: mbrTypeCd,
			ognzNm: ognzNm,
			ctpv: ctpv,
			sgg: sgg,
			pagingYn: 'Y',
			currentPageNo: currentPageNo,
			recordCountPerPage: recordCountPerPage,
		}

	    try {
	    	const postJsonPromise = gfn_postJSON("/co/user/selectComUserList.do", param);
	    	const data = await postJsonPromise;
		    
		    if (_.isEqual("S", data.resultStatus)) {
		    	data.resultList.forEach((item, index) => {
		    		
		    		jsonComUser.push(item);
					
		    		if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});
		    	
		    	if (jsonComUser.length > 0) {
		      		if (grdComUser.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
		      			grdComUser.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
		      			grdComUser.rebuild();
					} else {
						grdComUser.refresh();
					}
		      	} else {
		      		grdComUser.setPageTotalCount(totalRecordCount);
		      		grdComUser.rebuild();
		      	}
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

	//초기화 버튼
	const fn_reset = async function(){
		SBUxMethod.clear("gsb-slt-apcCd");
		SBUxMethod.clear("srch-inp-apcCd");
		SBUxMethod.clear("srch-inp-userId");
		SBUxMethod.clear("srch-inp-userNm");
		//SBUxMethod.clear("srch-slt-userType");

		fn_search();
	}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		const allData = grdComUser.getGridDataAll();

		const userList = [];

		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				userList.push({
					userId: item.userId,
					eml: item.eml,
					mblTelno: item.mblTelno,
					jbttlNm: item.jbttlNm,
					tkcgTaskNm: item.tkcgTaskNm,
					coTelno: item.coTelno,
					jbps: item.jbps,
					coNm: item.coNm,
					delYn: item.delYn,
					lckYn: item.lckYn
    			});
    		}
		});

		if (userList.length == 0) {
			gfn_comAlert("W0005", "변경대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

        try {
        	
        	const postJsonPromise = gfn_postJSON(
        			"/co/user/compareComUserAprv.do", 
        			userList
        		);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
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
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_search();
	}
	/*
	 * 비밀번호 초기화 호출
	 * 2023-11-03
	 * ysh
	 */
	 function fn_callUpdateUserPsd(gubun, grid, nRow, nCol) {
	     if (gubun === "UPD") {
	         if (grid === "grdComUser") {
	    		if(gfn_comConfirm("Q0001", "비밀번호 초기화")){
	     			var comUserVO = grdComUser.getRowData(nRow);
	     			fn_updatePwd(comUserVO);
	       		}
	         }
	     }
	 }

	 /*
	  * 비밀번호 초기화 업데이트
	  * 2023-11-03
	  * ysh
	  */
	async function fn_updatePwd(comUserVO){
        try{
        	const postJsonPromise = gfn_postJSON("/co/user/updComUserPwd.do", comUserVO);
        	const data = await postJsonPromise;
        	
    	    if(_.isEqual("S", data.resultStatus)){
        		gfn_comAlert("I0001");
        	} else{
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
	 * @name fn_clickGrdComUser
	 * @description 사용자 내역 click event
	 */
	const fn_clickGrdComUser = async function() {
		fn_clearAdmstMngArtcl();
		const row = grdComUser.getRow();
		let rowData = grdComUser.getRowData(row);
		console.log("클릭할때 ",rowData);
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("dtl-inp-corpCd",gfn_nvl(rowData.corpCd));				// 법인코드
			SBUxMethod.set("dtl-inp-userCtrgy",gfn_nvl(rowData.userCtrgy));			// 사용자카테코리
			SBUxMethod.set("dtl-inp-empCd",gfn_nvl(rowData.empCd));					// 직원코드
			SBUxMethod.set("dtl-inp-deptCd",gfn_nvl(rowData.deptCd));				// 부서코드
			SBUxMethod.set("dtl-slt-hrmMngrYn",rowData.hrmMngrYn);			// 인사관리자여부
			SBUxMethod.set("dtl-inp-hrmEvlRole",gfn_nvl(rowData.hrmEvlRole));		// 인사평가역할
			SBUxMethod.set("dtl-slt-hrmPayMngrYn",rowData.hrmPayMngrYn);	// 급여관리자여부
			SBUxMethod.set("dtl-slt-acntgMngrYn",rowData.acntgMngrYn); 		// 회계관리자여부
			SBUxMethod.set("dtl-inp-userId",gfn_nvl(rowData.userId));
		} else {
			return;
		}
	}

	const fn_changeSave = async function() {
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
			gfn_comAlert("W0005", "상세저장대상");		//	W0005	{0}이/가 없습니다.
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
				fn_clearAdmstMngArtcl();
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

	const fn_clearAdmstMngArtcl = function() {
		SBUxMethod.clear("dtl-inp-corpCd");
		SBUxMethod.clear("dtl-inp-userCtrgy");
		SBUxMethod.clear("dtl-inp-empCd");
		SBUxMethod.clear("dtl-inp-deptCd");
		SBUxMethod.refresh("dtl-slt-hrmMngrYn");
		SBUxMethod.clear("dtl-inp-hrmEvlRole");
		SBUxMethod.refresh("dtl-slt-hrmPayMngrYn");
		SBUxMethod.clear("dtl-slt-acntgMngrYn");
		SBUxMethod.clear("dtl-inp-userId");
	}

	const fn_chkAdmstMngArtcl = function() {
		let chk = SBUxMethod.get("chkboxAdmstMngArtcl").chkboxAdmstMngArtcl;
		const div = document.getElementById('admstMngArtcl');
		if (chk === "Y") {
			div.style.display = 'block';
		} else {
			div.style.display = 'none';
		}
		grdComUser.rebuild();
	}

</script>

</html>