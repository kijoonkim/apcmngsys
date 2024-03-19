<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 신규계정 생성</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>

				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnAccountSave" name="btnAccountSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_AccountSave"></sbux-button>
					<sbux-button id="btnEndComCd" name="btnEndComCd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-account')"></sbux-button>


					<sbux-input id="input_hidden1" name="input_hidden1" uitype="hidden"></sbux-input>
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
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">사용자명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="com-account-userNm" name="com-account-userNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">ID</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="com-account-userId" name="com-account-userId" uitype="text" class="form-control input-sm" onchange="fnIdChange(com-account-userId)"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="com-account-id-check" name="com-account-id-check" uitype="normal" class="form-control input-sm" text="중복확인" onclick="fn_AccountDupChk" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">PW</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="com-account-userPw" name="com-account-userPw" uitype="password" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">사용자 유형</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-comUserType" name="srch-slt-comUserType" uitype="single" class="form-control input-sm" jsondata-ref="jsonUserType">
							</td>
						</tr>
						<tr>
							<th scope="row">사용자 상태</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-comUserStts" name="srch-slt-comUserStts" uitype="single" class="form-control input-sm" jsondata-ref="jsonUserStts">
							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	let dupCheck = "N";
	const fn_AccountSave = async function() {
		let userId = SBUxMethod.get("com-account-userId");
		let userPw = SBUxMethod.get("com-account-userPw");
		let userNm = SBUxMethod.get("com-account-userNm");
		let userType = SBUxMethod.get("srch-slt-comUserType")
		let userStts = SBUxMethod.get("srch-slt-comUserStts")
		let param = {
				userId : userId
				, pswd : userPw
				, userNm : userNm
				, userType : userType
				, userStts : userStts
		}
		if(param.userNm.length == 0){
			alert("사용자명을 입력하세요.");
			return;
		}
		if(dupCheck === "N"){
			alert("아이디 중복확인을 완료해주세요.");
			return;
		}
		if(param.pswd.length < 8 ){
			alert("비밀번호는 8자 이상으로 설정하세요");
			return;
		}
		try {
			const postJsonPromise = gfn_postJSON(
					"/co/user/insertAccount.do",
					param,
					null,
					false
				);
	    	const data = await postJsonPromise;

		    if(_.isEqual("S", data.resultStatus)){
        		gfn_comAlert("I0001");
        		fn_Clear();
        	}else{
        		gfn_comAlert("E0001");
        	}
		  } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		//console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	     	}
	}

	const fn_AccountDupChk = async function() {
		//let pwTemp = sha256(SBUxMethod.get("com-account-userPw"));

		let userId = SBUxMethod.get("com-account-userId");
		if(userId.length == 0){
			alert("아이디를 입력해주세요");
			return;
		}

		let param = {
				userId : userId
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/co/user/selectAccountDupChk.do",
						param,
						null,
						false
					);
		    const data = await postJsonPromise;
		    if(userId === data.userId){
		    	dupCheck = "N";
		    	alert("사용중인 아이디입니다.");
		    }else{
		    	dupCheck = "Y";
		    	alert("사용할 수 있는 아이디입니다.");

		    }
		  } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		//console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	     	}
	}
	const fnIdChange = async function(input){
		dupCheck = "N";
	}

	const fn_Clear = async function(input){
		SBUxMethod.clear("com-account-userId");
		SBUxMethod.clear("com-account-userPw");
		SBUxMethod.clear("com-account-userNm");
		dupCheck = "N";
	}


</script>
</html>