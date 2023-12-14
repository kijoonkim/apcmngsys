<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : APC사용자 권한설정</title>
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
							<sbux-input id="inp-userAuthApcNm" name="inp-userAuthApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
						</th>
						<th scope="row">사용자명</th>
						<th>
							<sbux-input id="inp-userAuthUserNm" name="inp-userAuthUserNm" uitype="text" class="form-control input-sm" onkeyenter="fn_selectUserList" maxlength="33"></sbux-input>
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
					<div id="sb-area-grdUserAuth" style="height:250px;"></div>
				</div>
				</div>
			</div>
	</section>
</body>
<script type="text/javascript">
	//APC사용자 권한설정
	var jsonUserAuth = []; // 그리드의 참조 데이터 주소 선언
	var jsonUAReverseYn = []

	const fn_initSBSelectUserAuth = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect("grdUserAuth", 		jsonUAReverseYn, "REVERSE_YN")		// 상품등급(출하)
		]);
		grdUserAuth.refresh({"combo":true});
	}


	const fn_createUserAuthGrid = async function() {
		SBUxMethod.set("inp-userAuthApcNm", SBUxMethod.get("inp-apcNm"));
		SBUxMethod.set("userAuthUserNm", "");

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdUserAuth';
	    SBGridProperties.id = 'grdUserAuth';
	    SBGridProperties.jsonref = 'jsonUserAuth';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["순번"], 		ref: 'rowSeq',  	type:'output',  width:'50px',     style:'text-align:center'},
	        {caption: ["사용자 ID"], 	ref: 'userId',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["사용자 명"], 	ref: 'userNm',   	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["직책"], 		ref: 'jbttlNm',   	type:'input',  width:'100px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
	        {caption: ["담당업무"], 	ref: 'tkcgTaskNm',  type:'input',  width:'100px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
	        {caption: ["권한"], 		ref: 'userStts', 	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue === "00"){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' style='color:blue' onClick='fn_updateComUserAprv("+ nRow + ", \"01\")'>승인대기</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' style='color:red' onClick='fn_updateComUserAprv("+ nRow + ", \"00\")'>승인취소</button>";
            	}
		    }},
		    {caption: ["비밀번호"], 	ref: 'lckYn',   type:'button',  width:'100px',    style:'text-align:center',
		    	renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	 	        	if(strValue != null && strValue != ""){
	 	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_callUpdateUserPsd(\"UPD\", \"grdUserAuth\", " + nRow + ", " + nCol + ")'>초기화</button>";
	 	        	}
		    }},
		    {caption: ["사용유무"], 	ref: 'delYn',   	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonUAReverseYn', label:'label', value:'value', displayui : true}},
	        {caption: ["비고"], 		ref: 'rmrk',   		type:'input',   width:'150px',    style:'text-align:left', validate : gfn_chkByte.bind({byteLimit: 1000}), typeinfo : {maxlength : 333}},
	        {caption: ["APC코드"], 	ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    grdUserAuth = _SBGrid.create(SBGridProperties);

	    fn_initSBSelectUserAuth();
	    fn_selectUserList();
	}

	const fn_selectUserList = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
		let userNm = SBUxMethod.get("inp-userAuthUserNm");
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcUserList.do", {apcCd : apcCd, userNm : userNm});
        let data = await postJsonPromise;
        try{
        	jsonUserAuth.length = 0;
        	data.resultList.forEach((item, index) => {
				let userVO = {
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
				jsonUserAuth.push(userVO);
			});
        	grdUserAuth.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_updateComUserAprv = async function(nRow, usrtStts) {
    	let userId = grdUserAuth.getRowData(nRow).userId;
    	let postJsonPromise = gfn_postJSON("/co/user/updateComUserAprv", {userId : userId, userStts : usrtStts});
    	let data = await postJsonPromise;
    	try{
    		if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
        		fn_selectUserList();
        	} else {
        		gfn_comAlert("E0001");
        	}
    	}catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }
	const fn_pwReSet = async function(){
    	var nRow = userAuthMngDatagrid.getRow();
    }

	const fn_updataUserList = async function(){

		let updateList = [];
		let gridData = grdUserAuth.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdUserAuth.getRowData(i);
			let rowSts = grdUserAuth.getRowStatus(i);
			if (rowSts === 2){
				rowData.rowSts = "U";
				updateList.push(rowData);
			} else {
				continue;
			}
		}

		if(updateList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/am/apc/updateComUserList.do", updateList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
        		fn_selectUserList();
        	} else {
        		gfn_comAlert("E0001");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	/*
	 * 비밀번호 초기화 호출
	 * 2023-11-03
	 * ysh
	 */
	 function fn_callUpdateUserPsd(gubun, grid, nRow, nCol) {
	     if (gubun === "UPD") {
	         if (grid === "grdUserAuth") {
	         		var updMsg = "비밀번호 초기화 하시겠습니까?";
	         		if(confirm(updMsg)){
	         			var comUserVO = grdUserAuth.getRowData(nRow);
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
	        		gfn_comAlert("I0001");
	        	}else{
	        		gfn_comAlert("E0001");
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