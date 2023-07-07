<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header">
			<h3 class="box-title"> ▶ APC사용자 권한설정 (팝업)</h3>
			<div class="ad_tbl_top">
				<div class="ad_tbl_toplist">
					<sbux-button id="btnUserSach" name="btnUserSach" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectUserList()"></sbux-button>
					<sbux-button id="btnUserReg" name="btnUserReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
					<sbux-button id="btnUserEnd" name="btnUserEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('userAuthMngModal')"></sbux-button>
				</div>
			</div>
		</div>

		<div class="box-body">
			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 8%">
					<col style="width: 18%">
					<col style="width: 8%">
					<col style="width: 18%">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">APC명</th>
						<th>
							<sbux-input id=userAuthApcNm name="userAuthApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
						</th>
						<th scope="row">사용자명</th>
						<th>
							<sbux-input id=userAuthUserNm name="userAuthUserNm" uitype="text" class="form-control input-sm"></sbux-input>
						</th>
						<th>&nbsp;</th>
					</tr>
				</tbody>
			</table>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="userAuthMngGridArea" style="height:250px; width: 100%;"></div>
				</div>
				</div>
			</div>
	</section>
</body>
<script type="text/javascript">
//APC사용자 권한설정
	var userAuthMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_userAuthMngCreateGrid() {

		SBUxMethod.set("userAuthApcNm", SBUxMethod.get("apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'userAuthMngGridArea';
	    SBGridProperties.id = 'userAuthMngDatagrid';
	    SBGridProperties.jsonref = 'userAuthMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["순번"], 		ref: 'rowSeq',  	type:'output',  width:'50px',     style:'text-align:center'},
	        {caption: ["사용자 ID"], 	ref: 'userId',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["사용자 명"], 	ref: 'userNm',   	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["직책"], 		ref: 'jbttlNm',   	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["담당업무"], 	ref: 'tkcgTaskNm',  type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["권한"], 		ref: 'chrgdCertYn', type:'button',  width:'100px',    style:'text-align:center', typeinfo : {buttonvalue : '사용승인', 	callback : fn_Approval}},
	        {caption: ["비밀번호"], 	ref: 'lckYn',   	type:'button',  width:'100px',    style:'text-align:center', typeinfo : {buttonvalue : '초기화', 	callback : fn_PwReSet}},
	        {caption: ["사용유무"], 	ref: 'delYn',   	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',   	type:'output',  width:'150px',    style:'text-align:center'}
	    ];
	    window.userAuthMngDatagrid = _SBGrid.create(SBGridProperties);
	    fn_selectUserList();
	}

	async function fn_selectUserList(){
		fn_callSelectUserList();
	}

	async function fn_callSelectUserList(){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcUserList", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newUserGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let userList = {
					rowSeq : itrm.rowSeq
				  , userId : item.userId
				  , userNm : item.userNm
				  , jbttlNm : item.jbttlNm
				  , tkcgTaskNm : item.tkcgTaskNm
				  , chrgdCertYn : item.chrgdCertYn
				  , lckYn : item.lckYn
				  , delYn : item.delYn
				  , rmrk : item.rmrk
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

	function fn_Approval() {
    	console.log("사용승인");
    	var nRow = userAuthMngDatagrid.getRow();
    	var nCol = userAuthMngDatagrid.getCol();
    }
    function fn_PwReSet(){
    	console.log("비밀번호 초기화");
    }
</script>
</html>