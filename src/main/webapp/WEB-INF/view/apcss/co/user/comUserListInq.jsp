<%
 /**
  * @Class Name : comUserListInq.jsp
  * @Description : 사용자목록조회 화면
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
	<title>title : 사용자목록조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 사용자목록조회 -->
				</div>
				<div style="margin-left: auto;">
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
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="srch-inp-userId" 
									name="srch-inp-userId" 
									uitype="text" 
									class="form-control input-sm" 
									placeholder="" 
									maxlength="20"
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
									maxlength="30"
								></sbux-input>
							</td>
							<th scope="row">회원구분</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
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
							<td class="td_input"></td>
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
							<td colspan="2" class="td_input" style="border-right: hidden;">
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
							<td class="td_input"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>사용자 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-user">0</span>건)</span>
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
				<div id="sb-area-grdComUser" style="height:579px;"></div>
				<!--[pp] //검색결과 -->
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
	

	// 공통코드 JSON
	var jsonMbrTypeCd 	= [];
    var jsonUntyCtpv 	= [];
    var jsonUntySgg 	= [];
    
	var jsonUserType	= [];		// 사용자상태
	
	
	var grdComUser;
	// 그리드 데이터
	var jsonComUser	= [];
	
	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		
		SBUxMethod.set("srch-slt-pageSize", "50");
		
		await fn_initSBSelect();
		fn_createGrid();
	}
	
	const fn_initSBSelect = async function() {
		
		let result = await Promise.all([
			gfn_getComCdDtls("TYPE_CD"),
			gfn_getComCdDtls("UNTY_CTPV"),
			gfn_getComCdDtls("UNTY_SGG"),
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
    	SBGridProperties.selectmode = 'byrow';
    	SBGridProperties.extendlastcol = 'scroll';
    	SBGridProperties.scrollbubbling = false;
    	SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 50,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	};
    	
    	SBGridProperties.columns = [
			{
	        	caption: ["사용자ID"],		
	        	ref: 'userId',      
	        	type:'output',	
	        	width:'150px', 
	        	style:'text-align:center'
	        },
			{
	        	caption: ["사용자명"], 		
	        	ref: 'userNm',     	
	        	type:'output',  
	        	width:'95px', 
	        	style:'text-align:center'
	        },
			{
	        	caption: ["APC명"], 	 		
	        	ref: 'apcNm',    	
	        	type:'output',  
	        	width:'150px', 
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
	        	caption: ["사용자유형"],    	
	        	ref: 'userTypeNm',  
	        	type:'output',  
	        	width:'150px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["메일주소"],	    
	        	ref: 'eml',   		
	        	type:'output',  
	        	width:'200px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["휴대전화"],	    
	        	ref: 'mblTelno', 	
	        	type:'output',  
	        	width:'150px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["직책명"],  		
	        	ref: 'jbttlNm',   	
	        	type:'output',  
	        	width:'90px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["담당업무"],  		
	        	ref: 'tkcgTaskNm',  
	        	type:'output',  
	        	width:'110px', 
	        	style:'text-align:center'
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
	        	type:'output',  	
	        	width:'80px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["직위"],		
	        	ref: 'jbps',   	
	        	type:'output',  	
	        	width:'80px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["전화번호"],		
	        	ref: 'coTelno',   	
	        	type:'output',  	
	        	width:'120px', 
	        	style:'text-align:left'
	        },
	        {
	        	caption: ["사용유무"],  		
	        	ref: 'reverseYn',  	
	        	type:'output',  
	        	width:'100px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["잠김여부"],  		
	        	ref: 'lckYn',   	
	        	type:'output',  
	        	width:'100px', 
	        	style:'text-align:center'
	        },
	        {
	        	caption: ["최종접속일시"],  	
	        	ref: 'endLgnDt',   	
	        	type:'output',  
	        	width:'150px'
	        }
    	];
    	grdComUser = _SBGrid.create(SBGridProperties);
    	grdComUser.bind("afterpagechanged", fn_pagingComUser);
	}

	const fn_search = async function() {
		let recordCountPerPage = grdComUser.getPageSize();  		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = 1;
		grdComUser.movePaging(currentPageNo);
	}
	
	//페이징
	const fn_pagingComUser = async function() {
		let recordCountPerPage = grdComUser.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdComUser.getSelectPageIndex();
		fn_setGrdComUser(recordCountPerPage, currentPageNo);
	}
	
	
	const fn_setGrdComUser = async function(recordCountPerPage, currentPageNo) {
		
		jsonComUser.length = 0;
		
		const userId = SBUxMethod.get("srch-inp-userId");
		const userNm = SBUxMethod.get("srch-inp-userNm");
		const mbrTypeCd = SBUxMethod.get("srch-slt-mbrTypeCd");
		const ognzNm = SBUxMethod.get("srch-inp-ognzNm");
		const ctpv = SBUxMethod.get("srch-slt-untyCtpv");
		const sgg = SBUxMethod.get("srch-slt-untySgg");

		const param = {
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
		
		const postJsonPromise = gfn_postJSON("/co/user/selectComUserList.do", param);
		const data = await postJsonPromise;
		
		let totalRecordCount = 0;
		
	    try {
			if (_.isEqual("S", data.resultStatus)) {
  		    	
				data.resultList.forEach((item, index) => {
  		    		jsonComUser.push(item);
  					if (index === 0) {
  						totalRecordCount = item.totalRecordCount;
  					}
  				});
  		    	
  		    	if (jsonComUser.length > 0) {
  		    		
	  		    	if (grdComUser.getPageTotalCount() != totalRecordCount) {	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	  		    		grdComUser.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	  		    		grdComUser.rebuild();
	  				} else {
	  					grdComUser.refresh();
					}
	
					grdComUser.setRow(2);
					
				} else {
					grdComUser.setPageTotalCount(totalRecordCount);
					grdComUser.rebuild();
  		      	}
  		    	
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
			}
			
			document.querySelector('#cnt-user').innerText = totalRecordCount;
			
	    } catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	    }
	}


    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdComUser.exportLocalExcel(
    			"사용자목록", 
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
    	grdComUser.savePersonalInfo("apcCd");
	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdComUser.loadPersonalInfo("apcCd");
	}
 	// 열 숨기기
    function fn_colHidden(){
    	grdComUser.setColHidden(grdComUser.getCol(), true);
    }
 	// 열 보이기
	function fn_colShow(){
     	for (let i = grdComUser.getFixedCols(); i < grdComUser.getCols()-1; i++) {
     		grdComUser.setColHidden(i, false);
     	}
   	}
	
	const setPageSize = function(){
		const size = parseInt(SBUxMethod.get("srch-slt-pageSize")) || 50;
		grdComUser.setPageSize(size);
		grdComUser.rebuild();
		fn_search();
	};
	
	
</script>
</html>