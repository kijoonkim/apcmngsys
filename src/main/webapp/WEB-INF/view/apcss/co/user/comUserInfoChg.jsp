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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 사용자정보변경</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset()"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search()"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save()"></sbux-button>
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
						<tr>
							<th scope="row">사용자ID</th>
							<td td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userId" name="srch-inp-userId" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userNm" name="srch-inp-userNm" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
							<th scope="row">명칭</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-userType" name="srch-slt-userType" uitype="single" class="form-control input-sm" unselected-text="선택" >
									<option-item value="01">AT관리자</option-item>
									<option-item value="10">APC관리자</option-item>
									<option-item value="11">APC사용자</option-item>
									<option-item value="20">농가사용자</option-item>
									<option-item value="30">외부사용자</option-item>
								</sbux-select>
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
			<div id="sb-area-grdUserInfoChg" style="height:579px;"></div>
			</div>
		</div>
</section>
</body>
<script type="text/javascript">
var combofilteringReverseYnData = [
	{'label': '사용', 'value': 'Y'},
	{'label': '미사용', 'value': 'N'}
]
var combofilteringLckYnData = [
	{'label': '사용', 'value': 'Y'},
	{'label': '미사용', 'value': 'N'}
]
window.addEventListener('DOMContentLoaded', function(e) {
	fn_createUserInfoChgGrid();
	fn_search();
});

var userInfoChgGridData = []; // 그리드의 참조 데이터 주소 선언
function fn_createUserInfoChgGrid() {
    var SBGridProperties1 = {};
	    SBGridProperties1.parentid = 'sb-area-grdUserInfoChg';
	    SBGridProperties1.id = 'userInfoChgGridId';
	    SBGridProperties1.jsonref = 'userInfoChgGridData';
	    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
	    SBGridProperties1.scrollbubbling = false;
	    SBGridProperties1.oneclickedit = true;
	    SBGridProperties1.explorerbar = 'sortmove';
    	SBGridProperties1.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	};
	    SBGridProperties1.columns = [
	         {caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'55px', style: 'text-align:center',
					userattr: {colNm: "checkedYn"},
	                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	            },
	         {caption: ["사용자ID"], 	ref: 'userId',     	type:'output',   width:'180px', style:'text-align:center'},
	         {caption: ["사용자명"], 	ref: 'userNm',    	type:'output',  width:'105px', style:'text-align:center'},
	         {caption: ["비밀번호"],    	ref: 'pswd',        type:'button',  width:'105px', style:'text-align:center',
	        	 renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	 	        	if(strValue != null && strValue != ""){
	 	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_callUpdateUserPsd(\"UPD\", \"userInfoChgGridId\", " + nRow + ", " + nCol + ")'>초기화</button>";
	 	        	}
	 	        }},
	         {caption: ["APC명"],	    ref: 'apcNm',   	type:'output',  width:'105px', style:'text-align:center'},
	         {caption: ["명칭"],   ref: 'userTypeNm',  type:'output',  width:'105px', style:'text-align:center'},
	         {caption: ["메일주소"],	    ref: 'eml', 		type:'input',  width:'200px', style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 320})},
	         {caption: ["전화번호"],  	ref: 'telno',   	type:'input',  width:'105px', style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 11})},
	         {caption: ["직책명"],  		ref: 'jbttlNm',   	type:'input',   width:'105px', style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	         {caption: ["담당업무"],  	ref: 'tkcgTaskNm',  type:'input',   width:'105px', style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	         {caption: ["사용유무"],  	ref: 'reverseYn',   type:'combo',   width:'105px', style:'text-align:center',
	        	 typeinfo : {ref:'combofilteringReverseYnData', label:'label', value:'value', displayui : true}
	         },
	         {caption: ["잠김여부"],  	ref: 'lckYn',   	type:'combo',   width:'105px', style:'text-align:center',
	        	 typeinfo : {ref:'combofilteringLckYnData', label:'label', value:'value', displayui : true}
	         },
	         {caption: ["최종접속일시"], ref: 'endLgnDt',  	type:'output',  width:'105px', style:'text-align:center'},
	         {caption: ["사용유무코드"],	ref: 'delYn',   	type:'output', hidden: true},
	         {caption: ["APC코드"],		ref: 'apcCd',   	type:'output', hidden: true}
    ];
	    userInfoChgGridId = _SBGrid.create(SBGridProperties1);
	    userInfoChgGridId.bind( "afterpagechanged" , "fn_pagingUserList" );
}

async function fn_search() {
	let recordCountPerPage = userInfoChgGridId.getPageSize();  		// 몇개의 데이터를 가져올지 설정
	let currentPageNo = 1;
	userInfoChgGridId.movePaging(currentPageNo);
}

//페이징
async function fn_pagingUserList(){
	let recordCountPerPage = userInfoChgGridId.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	let currentPageNo = userInfoChgGridId.getSelectPageIndex();
	fn_callSelectUserList(recordCountPerPage, currentPageNo);
}
newUserInfoChgGridData = [];
userInfoChgGridData = [];
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
		, recordCountPerPage 	: recordCountPerPage}
	let postJsonPromise = gfn_postJSON("/co/user/users", comUserVO);
    let data = await postJsonPromise;

    newUserInfoChgGridData = [];
    userInfoChgGridData = [];

    try{
    	data.resultList.forEach((item, index) => {
			let userAprvReg = {
				userId		: item.userId
			  , userNm		: item.userNm
			  , pswd		: item.pswd
			  , apcCd		: item.apcCd
			  , apcNm		: item.apcNm
			  , eml			: item.eml
			  , userTypeNm	: item.userTypeNm
			  , eml			: item.eml
			  , telno		: item.telno
			  , jbttlNm		: item.jbttlNm
			  , tkcgTaskNm	: item.tkcgTaskNm
			  , reverseYn	: item.reverseYn
			  , lckYn		: item.lckYn
			  , endLgnDt	: item.endLgnDt
			  , delYn		: item.delYN
			}

			userInfoChgGridData.push(Object.assign({}, userAprvReg));
			newUserInfoChgGridData.push(Object.assign({}, userAprvReg));
			
			if (index === 0) {
					totalRecordCount = item.totalRecordCount;
			}
		});
    	if (userInfoChgGridData.length > 0) {
      		if(userInfoChgGridId.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
      			userInfoChgGridId.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
      			userInfoChgGridId.rebuild();
				}else{
					userInfoChgGridId.refresh();
				}

      		userInfoChgGridId.setRow(2);
      	} else {
      		userInfoChgGridId.setPageTotalCount(totalRecordCount);
      		userInfoChgGridId.rebuild();
      	}

    }catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
 		console.error("failed", e.message);
    }
}



//초기화 버튼
async function fn_reset(){
	SBUxMethod.clear("srch-inp-apcCd");
	SBUxMethod.clear("srch-inp-userId");
	SBUxMethod.clear("srch-inp-userNm");
	SBUxMethod.clear("srch-slt-userType");
}

// //저장 버튼
// async function fn_updataUserList(){
// 	fn_callUpdateUserList();
// }


async function fn_callUpdateUserList(){


	let regMsg = "등록 하시겠습니까?";
	if(confirm(regMsg)){

// 		let postJsonPromise = gfn_postJSON("/am/cmns/compareComUserAprv.do", {origin : newUserAprvRegGridData, modified : userAprvRegGridData});
		let postJsonPromise = await gfn_postJSON("/co/user/compareComUserAprv.do", {origin : newUserInfoChgGridData, modified : userInfoChgGridData});
		alert("등록 되었습니다.");
	}
	fn_search();

}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
    	
		const allData = userInfoChgGridId.getGridDataAll();

		const userAprvRegGridData = [];
		
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				userAprvRegGridData.push({
					userId: item.userId,
					eml: item.eml,
					telno: item.telno,
					jbttlNm: item.jbttlNm,
					tkcgTaskNm: item.tkcgTaskNm
// 					reverseYn: item.reverseYn,
// 					lckYn: item.lckYn
    			});
    		}
		});

		if (userAprvRegGridData.length == 0) {
			gfn_comAlert("W0005", "변경대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		console.log(userAprvRegGridData);
    	const postJsonPromise = gfn_postJSON("/co/user/compareComUserAprv.do", userAprvRegGridData);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
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
         if (grid === "userInfoChgGridId") {
         		var updMsg = "비밀번호 초기화 하시겠습니까?";
         		if(confirm(updMsg)){
         			var comUserVO = userInfoChgGridId.getRowData(nRow);
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
		let postJsonPromise = gfn_postJSON("/co/user/updComUserPwd.do", comUserVO);
        let data = await postJsonPromise;
        try{
        	if(data.updatedCnt > 0){
        		alert("비밀번호가 초기화 되었습니다.");
        	}else{
        		alert("비밀번호 초기화 오류가 발생 되었습니다.");
        	}
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

</script>

</html>