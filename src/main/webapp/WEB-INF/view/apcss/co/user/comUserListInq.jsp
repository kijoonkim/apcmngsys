<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
<section class="content container-fluid">
					<div class="box box-solid">
						<div class="box-header" style="display:flex; justify-content: flex-start;" >
							<div>
								<h3 class="box-title" style="line-height: 30px;"> ▶ 사용자목록조회</h3>
							</div>
							<div style="margin-left: auto;">
								<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectUserList()"></sbux-button>
							</div>
							
						</div>

						<div class="box-body">
						<!--[APC] START -->
							<%@ include file="../../../frame/inc/apcSelect.jsp" %>
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
<!-- 									<tr> -->
<!-- 										<th scope="row">APC명</th> -->
<!-- 										<td colspan="3" class="td_input" style="border-right: hidden;"> -->
<!-- 											<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input> -->
<!-- 											<sbux-select unselected-text="전체" uitype="single" id="srch-slt-apcCd" name="srch-slt-apcCd" jsondata-ref="jsonComApcCd" class="form-control input-sm" /> -->
<!-- 										</td> -->
<!-- 										<td colspan="8" class="td_input"></td> -->
<!-- 									</tr> -->
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
										<td colspan="6"></td>
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
							<div id="sb-area-grdUserListInq" style="height:460px;"></div>
							<!--[pp] //검색결과 -->
					</div>
				</div>
			</section>
				
<script type="text/javascript">
var jsonComApcCd = [];	// APC코드	srch-slt-apcCd	APC_CD
const fn_initSBSelect = async function() {
	// 조회 SB select
 	gfn_setComCdSBSelect('srch-slt-apcCd', jsonComApcCd, 'APC_CD');	// APC코드	srch-slt-apcCd	APC_CD
}
				
window.addEventListener('DOMContentLoaded', function(e) {
	fn_createUserListInqGrid();

	let today = new Date();
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	
	fn_initSBSelect();
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
	    SBGridProperties1.columns = [
	         {caption: ["사용자ID"],			ref: 'userId',      type:'output',	width:'15%', style:'text-align:center'},
	         {caption: ["사용자명"], 		ref: 'userNm',     	type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["APC명"], 	 		ref: 'apcNm',    	type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["사용자유형"],    	ref: 'userTypeNm',  type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["메일주소"],	    	ref: 'eml',   		type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["전화번호"],	    	ref: 'telno', 		type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["직책명"],  			ref: 'jbttlNm',   	type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["담당업무"],  		ref: 'tkcgTaskNm',  type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["사용유무"],  		ref: 'reverseYn',  	type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["잠김여부"],  		ref: 'lckYn',   	type:'output',  width:'15%', style:'text-align:center'},
	         {caption: ["최종접속일시"],  	ref: 'endLgnDt',   	type:'output',  width:'15%'}
    ];
    window.userListInqGridId= _SBGrid.create(SBGridProperties1);
    fn_selectUserList();
}

async function fn_selectUserList(){
	fn_callSelectUserList();
}

var newUserAprvRegGridData = [];
async function fn_callSelectUserList(){
	let apcNm  = SBUxMethod.get("srch-inp-apcCd");
	let userId = SBUxMethod.get("srch-inp-userId");
	let userNm = SBUxMethod.get("srch-inp-userNm");
	
	var comUserVO = { apcNm: apcNm, userId: userId, userNm: userNm}
	console.log('apcNm',apcNm);
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
		});
		userListInqGridId.rebuild();
    }catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
 		console.error("failed", e.message);
    }
}
</script>
</body>
</html>