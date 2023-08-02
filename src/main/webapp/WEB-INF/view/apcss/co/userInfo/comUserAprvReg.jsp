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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 사용자승인등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset()"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectUserList()"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_updataUserList"></sbux-button>
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
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">승인여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-aprvYn" name="srch-slt-aprvYn" uitype="single" class="form-control fl_fixed mg_r5 wd_130" unselected-text="선택" style="height:100%; line-height:100%;"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-userNm" name="srch-inp-userNm" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
					</tbody>
				</table>
											
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				
<!-- 				<div class="ad_tbl_top"> -->
<!-- 					<ul class="ad_tbl_count"> -->
<!-- 						<li><span>선별실적 내역</span></li> -->
<!-- 					</ul> -->
<!-- 					<div class="ad_tbl_toplist"> -->
<!-- 						<sbux-button id="btnDown" name="btnDown" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger"></sbux-button> -->
<!-- 						<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger"></sbux-button> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>작업실적</span></li>
						</ul>
						<div class="ad_tbl_toplist">
							<sbux-button id="btn-bndlPrfmnc" name="btn-bndlPrfmnc" uitype="normal" text="일관승인" class="btn btn-sm btn-outline-danger"></sbux-button>
						</div>
					</div>
					<div id="sb-area-grdUserAprvReg" style="height:300px; margin-top:8px;"></div>
				</div>
			</div>
	</section>
</body>

<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	fn_createUserAprvRegGrid();

	let today = new Date();
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	SBUxMethod.set("srch-dtp-inqYmd1", year+month+day);
	SBUxMethod.set("srch-dtp-inqYmd2", year+month+day);
	//임시로 apcCd설정
	apcNm = SBUxMethod.set("srch-inp-apcCd", "9999");
})
var userAprvRegGridData = []; // 그리드의 참조 데이터 주소 선언
async function fn_createUserAprvRegGrid() {
    var SBGridProperties1 = {};
    	
	    SBGridProperties1.parentid = 'sb-area-grdUserAprvReg';
	    SBGridProperties1.id = 'userAprvRegGridId';
	    SBGridProperties1.jsonref = 'userAprvRegGridData';
	    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
	    SBGridProperties1.columns = [
	         {caption: ["선택"],			ref: 'chc',      	type:'checkbox',width:'15%'},
	         {caption: ["승인여부"], 		ref: 'aprvYn',     	type:'input',  	width:'15%'},
	         {caption: ["사용자ID"], 	 	ref: 'userId',    	type:'output',  width:'15%'},
	         {caption: ["사용자명"],    	ref: 'userNm',      type:'output',  width:'15%'},
	         {caption: ["APC명"],	    ref: 'apcCd',   	type:'output',  width:'15%'},
	         {caption: ["사용자유형"],	    ref: 'userType', 	type:'output',  width:'15%'},
	         {caption: ["메일주소"],  		ref: 'eml',  		type:'output',  width:'15%'},
        	 {caption: ["전화번호"],  		ref: 'telno',   	type:'output',  width:'15%'},
	         {caption: ["직책명"],  		ref: 'jbttlNm',   	type:'output',  width:'15%'},
	         {caption: ["담당업무"],  		ref: 'tkcgTaskNm',  type:'output',  width:'15%'}
    ];
    window.userAprvRegGridId= _SBGrid.create(SBGridProperties1);
    fn_selectUserList();
}

//조회 버튼
async function fn_selectUserList(){
	fn_callSelectUserList();
}

async function fn_callSelectUserList(){
	let apcCd = SBUxMethod.get("srch-inp-apcCd");
// 	let inqYmd1 = SBUxMethod.get("srch-dtp-inqYmd1");
// 	let inqYmd2 = SBUxMethod.get("srch-dtp-inqYmd2");
	let aprvYn = SBUxMethod.get("srch-slt-aprvYn");
	let userNm = SBUxMethod.get("srch-inp-userNm");
	
	var comUserVO = { apcCd: apcCd, aprvYn: aprvYn, userNm: userNm}
	
	let postJsonPromise = gfn_postJSON("/co/user/users", comUserVO);
    let data = await postJsonPromise;
    let newUserAprvRegGridData = [];
    
    try{
    	data.resultList.forEach((item, index) => {
			let userAprvReg = {
			    userId		: item.userId
			  , userNm		: item.userNm
			  , apcCd		: item.apcCd
			  , userType	: item.userType
			  , eml			: item.eml
			  , telno		: item.telno
			  , jbttlNm		: item.jbttlNm
			  , tkcgTaskNm	: item.tkcgTaskNm
			}
			newUserAprvRegGridData.push(userAprvReg);
			
		});
    	userAprvRegGridData = newUserAprvRegGridData;
    	userAprvRegGridId.rebuild();
    }catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
 		console.error("failed", e.message);
    }
}

//초기화 버튼
async function fn_reset(){
	
	console.log('초기화버튼 클릭');
	
	SBUxMethod.clear("srch-slt-aprvYn");
	SBUxMethod.clear("srch-inp-userNm");
}

async function fn_updataUserList(){
	fn_callUpdateUserList();
}

async function fn_callUpdateUserList(){
	let gridData = userAprvRegGridId.getGridDataAll();
	let updateList = [];
	for(var i=1; i<=gridData.length; i++ ){
		console.log('gridData.length', gridData.length);
		if(userAprvRegGridId.getRowStatus(i) === 2){
			updateList.push(userAprvRegGridId.getRowData(i));
			console.log('userAprvRegGridId.getRowData(i)', userAprvRegGridId.getRowData(i));
		}
	}
	if(updateList.length == 0){
		console.log('gridData.length', gridData.length);
		console.log('updateList.length', updateList.length);
		alert("등록 할 내용이 없습니다.");
		return;
	}
	let postJsonPromise = gfn_postJSON("/co/user/updateComUserAprv", updateList);
    let data = await postJsonPromise;
    try{
    	if(data.result > 0){
    		fn_callSelectUserList();
    		alert("등록 되었습니다.");
    	}else{
    		alert("등록 실패 하였습니다.");
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