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
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
<section class="content container-fluid">
					<div class="box box-solid">
						<div class="box-header" style="display:flex; justify-content: flex-start;" >
							<div>
								<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
								<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 사용자목록조회 -->
							</div>
							<div style="margin-left: auto;">
								<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search()"></sbux-button>
							</div>
							
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
										<th scope="row">사용자ID</th>
										<td class="td_input" style="border-right: hidden;">
											<sbux-input id="srch-inp-userId" name="srch-inp-userId" uitype="text" class="form-control input-sm" placeholder="" maxlength="13"></sbux-input>
										</td>
										<td colspan="2" style="border-right: hidden;"></td>
										<th scope="row">사용자명</th>
										<td class="td_input" style="border-right: hidden;">
											<sbux-input id="srch-inp-userNm" name="srch-inp-userNm" uitype="text" class="form-control input-sm" placeholder=""  maxlength="30"></sbux-input>
										</td>
										<td colspan="2" style="border-right: hidden;"></td>
										<th scope="row">사용자 유형</th>
										<td class="td_input" style="border-right: hidden;">
											<sbux-select id="srch-slt-userType" name="srch-slt-userType" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonUserType" onchange="cfn_onChangeUserType(this)">
										</td>
										<td colspan="2" class="td_input"></td>
									</tr>
								</tbody>
							</table>
							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>사용자 내역</span></li>
								</ul>
							</div>
							<div id="sb-area-grdUserListInq" style="height:579px;"></div>
							<!--[pp] //검색결과 -->
					</div>
				</div>
			</section>
				
<script type="text/javascript">
var jsonUserType=[];		// 사용자상태
const fn_initSBSelectSpcfct = async function() {
	let rst = await Promise.all([
		gfn_setComCdSBSelect('srch-slt-userType', 			jsonUserType, 			'USER_TYPE','0000')	// 사용자상태
	])
}

window.addEventListener('DOMContentLoaded', function(e) {
	fn_initSBSelectSpcfct();
	fn_createUserListInqGrid();
	fn_search();
})

var userInfoChgGridData = []; // 그리드의 참조 데이터 주소 선언
function fn_createUserListInqGrid() {
    var SBGridProperties1 = {};
	    SBGridProperties1.parentid = 'sb-area-grdUserListInq';
	    SBGridProperties1.id = 'userListInqGridId';
	    SBGridProperties1.jsonref = 'userListInqGridData';
	    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
	    SBGridProperties1.scrollbubbling = false;
	    SBGridProperties1.explorerbar = 'sortmove';
    	SBGridProperties1.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	};
	    SBGridProperties1.columns = [
	         {caption: ["사용자ID"],			ref: 'userId',      type:'output',	width:'150px', style:'text-align:center'},
	         {caption: ["사용자명"], 		ref: 'userNm',     	type:'output',  width:'95px', style:'text-align:center'},
	         {caption: ["APC명"], 	 		ref: 'apcNm',    	type:'output',  width:'150px', style:'text-align:center'},
	         {caption: ["사용자유형"],    	ref: 'userTypeNm',  type:'output',  width:'150px', style:'text-align:center'},
	         {caption: ["메일주소"],	    	ref: 'eml',   		type:'output',  width:'200px', style:'text-align:center'},
	         {caption: ["전화번호"],	    	ref: 'telno', 		type:'output',  width:'150px', style:'text-align:center'},
	         {caption: ["직책명"],  			ref: 'jbttlNm',   	type:'output',  width:'90px', style:'text-align:center'},
	         {caption: ["담당업무"],  		ref: 'tkcgTaskNm',  type:'output',  width:'110px', style:'text-align:center'},
	         {caption: ["사용유무"],  		ref: 'reverseYn',  	type:'output',  width:'100px', style:'text-align:center'},
	         {caption: ["잠김여부"],  		ref: 'lckYn',   	type:'output',  width:'100px', style:'text-align:center'},
	         {caption: ["최종접속일시"],  	ref: 'endLgnDt',   	type:'output',  width:'150px'}
    ];
//     window.userListInqGridId= _SBGrid.create(SBGridProperties1);
//     fn_selectUserList();
	    userListInqGridId = _SBGrid.create(SBGridProperties1);
	    userListInqGridId.bind( "afterpagechanged" , "fn_pagingUserList" );
}

async function fn_search() {
	let recordCountPerPage = userListInqGridId.getPageSize();  		// 몇개의 데이터를 가져올지 설정
	let currentPageNo = 1;
	userListInqGridId.movePaging(currentPageNo);
}

//페이징
async function fn_pagingUserList(){
	let recordCountPerPage = userListInqGridId.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	let currentPageNo = userListInqGridId.getSelectPageIndex();
	fn_callSelectUserList(recordCountPerPage, currentPageNo);
}

var newUserAprvRegGridData = [];
async function fn_callSelectUserList(recordCountPerPage, currentPageNo){
	let apcCd = SBUxMethod.get("gsb-slt-apcCd");
	let userId = SBUxMethod.get("srch-inp-userId");
	let userNm = SBUxMethod.get("srch-inp-userNm");
	let userType = SBUxMethod.get("srch-slt-userType");
	
	var comUserVO = { 
			  apcCd					: apcCd
			, userId				: userId
			, userNm				: userNm
			, userType				: userType
			, pagingYn 				: 'Y'
			, currentPageNo 		: currentPageNo
			, recordCountPerPage 	: recordCountPerPage
	}
	let postJsonPromise = gfn_postJSON("/co/user/users", comUserVO);
    let data = await postJsonPromise;                
    newUserListInqGridData = [];
    userListInqGridData = [];
    
    try{
    	data.resultList.forEach((item, index) => {
			let userListInq = {
				userId		: item.userId
			  , userNm		: item.userNm
			  , apcNm		: item.apcNm
			  , userTypeNm	: item.userTypeNm
			  , eml			: item.eml
			  , telno		: item.telno
			  , jbttlNm		: item.jbttlNm
			  , tkcgTaskNm	: item.tkcgTaskNm
			  , reverseYn	: item.reverseYn
			  , lckYn		: item.lckYn
			  , endLgnDt	: item.endLgnDt
			}
    	
			userListInqGridData.push(Object.assign({}, userListInq));
			newUserListInqGridData.push(Object.assign({}, userListInq));
			
			if (index === 0) {
				totalRecordCount = item.totalRecordCount;
			}
		});
    	if (userListInqGridData.length > 0) {
      		if(userListInqGridId.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
      			userListInqGridId.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
      			userListInqGridId.rebuild();
				}else{
					userListInqGridId.refresh();
				}

      		userListInqGridId.setRow(2);
      	} else {
      		userListInqGridId.setPageTotalCount(totalRecordCount);
      		userListInqGridId.rebuild();
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
</script>
</body>
</html>