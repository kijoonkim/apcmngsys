<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<p>
					<span style="font-weight:bold;">업무지원시스템을 사용할 APC의 일반사용자를 승인합니다.(사용자 신규가입은 포탈을 이용하세요.)</span>
				</p>
				<p>
					<span style="color:black; font-weight:bold;">비밀번호 초기화를 하면 비밀번호는 사용자ID로 변경됩니다.</span>
				</p>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnSearchUser" name="btnSearchUser" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectUserList"></sbux-button>
				<sbux-button id="btnUserReg" name="btnUserReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_updataUserList"></sbux-button>
				<sbux-button id="btnUserEnd" name="btnUserEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-userAuth')"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 100px">
					<col style="width: 200px">
					<col style="width: 100px">
					<col style="width: 200px">
					<col style="width: 100px">
					<col style="width: 200px">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">APC명</th>
						<th>
							<sbux-input id=userAuthApcNm name="userAuthApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
						</th>
						<th scope="row">사용자명</th>
						<th>
							<sbux-input id=userAuthUserNm name="userAuthUserNm" uitype="text" class="form-control input-sm" onkeyenter="fn_selectUserList"></sbux-input>
						</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
					</tr>
				</tbody>
			</table>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="userAuthMngGridArea" style="height:250px;"></div>
				</div>
				</div>
			</div>
	</section>
</body>
<script type="text/javascript">
	//APC사용자 권한설정
	var userAuthMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_userAuthMngCreateGrid() {
		SBUxMethod.set("userAuthApcNm", SBUxMethod.get("inp-apcNm"));
		SBUxMethod.set("userAuthUserNm", "");


		let SBGridProperties = {};
	    SBGridProperties.parentid = 'userAuthMngGridArea';
	    SBGridProperties.id = 'userAuthMngDatagrid';
	    SBGridProperties.jsonref = 'userAuthMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["순번"], 		ref: 'rowSeq',  	type:'output',  width:'50px',     style:'text-align:center'},
	        {caption: ["사용자 ID"], 	ref: 'userId',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["사용자 명"], 	ref: 'userNm',   	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["직책"], 		ref: 'jbttlNm',   	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["담당업무"], 	ref: 'tkcgTaskNm',  type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["권한"], 		ref: 'userStts', 	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue === "01"){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
            	}else{
			        return "승인완료";
            	}
		    }},
		    {caption: ["비밀번호"], 		ref: 'lckYn',   type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue == "Y"){
            		return "<button type='button' class='btn btn-xs btn-outline-dark' onClick='fn_pwReSet(" + nRow + ")'>초기화</button>";
            	}
		    }},
		    {caption: ["사용유무"], 	ref: 'delYn',   	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : true}},
	        {caption: ["비고"], 		ref: 'rmrk',   		type:'input',   width:'150px',    style:'text-align:left'},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    window.userAuthMngDatagrid = _SBGrid.create(SBGridProperties);
	    fn_selectUserList();
	}

	async function fn_selectUserList(){
		fn_callSelectUserList();
	}

	async function fn_callSelectUserList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
		let userNm = SBUxMethod.get("userAuthUserNm");
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcUserList.do", {apcCd : apcCd, userNm : userNm});
        let data = await postJsonPromise;
        let newUserGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let userList = {
					rowSeq 		: item.rowSeq
				  , userId 		: item.userId
				  , userNm 		: item.userNm
				  , jbttlNm 	: item.jbttlNm
				  , tkcgTaskNm 	: item.tkcgTaskNm
				  , userStts 	: item.userStts
				  , lckYn 		: item.lckYn
				  , delYn 		: item.delYn
				  , rmrk 		: item.rmrk
				  , apcCd 		: item.apcCd
				}
				newUserGridData.push(userList);
			});
        	userAuthMngGridData = newUserGridData;
        	userAuthMngDatagrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_updateComUserAprv() {
    	let nRow = userAuthMngDatagrid.getRow();
    	let userId = userAuthMngDatagrid.getRowData(nRow).userId;
    	let postJsonPromise = gfn_postJSON("/co/user/updateComUserAprv.do", {userId : userId, userStts : '99'});
    	let data = await postJsonPromise;
    	try{
    		if(data.result == 0){
    			alert("승인 실패 했습니다.");
    		}else{
    			alert("승인 되었습니다.");
    			fn_callSelectUserList();
    		}
    	}catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }
	async function fn_pwReSet(){
    	console.log("비밀번호 초기화");
    	var nRow = userAuthMngDatagrid.getRow();
    	console.log(nRow);

    }

	async function fn_updataUserList(){
		fn_callUpdateUserList();
	}

	async function fn_callUpdateUserList(){
		let gridData = userAuthMngDatagrid.getGridDataAll();
		let updateList = [];
		for(var i=1; i<=gridData.length; i++ ){
			if(userAuthMngDatagrid.getRowStatus(i) === 2){
				updateList.push(userAuthMngDatagrid.getRowData(i));
			}
		}
		if(updateList.length == 0){
			alert("등록 할 내용이 없습니다.");
			return;
		}
		let postJsonPromise = gfn_postJSON("/am/apc/updateComUserList.do", updateList);
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