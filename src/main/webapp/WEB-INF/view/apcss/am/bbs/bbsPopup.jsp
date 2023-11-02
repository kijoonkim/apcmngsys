<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<style>
	table {
		width:80%
	}

	#cmntList .cmntHd{
		text-align:center;
		border:5px;
		height:50px;
	}
</style>
<body>
	<section>
		<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnUpdateBbsPopup" name="btnUpdateBbsPopup" uitype="normal" text="수정" class="btn btn-sm btn-outline-danger" onclick="fn_update"></sbux-button>
					<sbux-button id="btnCancelBbsPopup" name="btnCancelBbsPopup" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="fn_update"></sbux-button>
					<sbux-button id="btnSaveBbsPopup" name="btnSaveBbsPopup" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_bbsDetailupdate"></sbux-button>
					<sbux-button id="btnDeleteBbsPopup" name="btnDeleteBbsPopup" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_bbsDelete"></sbux-button>
					<sbux-button id="btnEndBbsPopup" name="btnEndWarehouse" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-bbsModal','fn_search')"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<div class="sbt-con-wrap">
                	<ul>
	                    <li style="display:inline-block;float:right;width: 100%;vertical-align:top;">
		                    <div class="sbt-grid-wrap">

		                        <div class="sbt-wrap-body">

		                            <sbux-input id="dtl-input-orngBbsNo" name="dtl-input-orngBbsNo" uitype="hidden"></sbux-input>
		                            <sbux-input id="dtl-input-orngChildCmntNo" name="dtl-input-orngChildCmntNo" uitype="hidden"></sbux-input>
		                            <div class="box-body">
			                            <table class="table table-bordered tbl_fixed">
											<colgroup>
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 10%">
												<col style="width: 15%">

											</colgroup>

			                                <tr>
			                                    <th scope="row">구분</th>
			                                    <td scope="row">
			                                    	<sbux-select id="dtl-select-bbsSeCd" name="dtl-select-bbsSeCd" uitype="single"
			                                    		jsondata-ref="jsonComBbsSeCd"
			                                    		unselected-text="선택"
			                                    		readonly
		                                    		></sbux-select>
			                                    </td>
			                                    <th scope="row">등록번호</th>
			                                    <td scope="row">
			                                        <sbux-input id="dtl-input-bbsNo" name="dtl-input-bbsNo" uitype="text" required style="width:100%" readonly ></sbux-input>
			                                    </td>
			                                    <th scope="row">등록자</th>
			                                    <td scope="row">
			                                        <sbux-input id="dtl-input-sysFrstInptUserIdNm" name="dtl-input-sysFrstInptUserIdNm" uitype="text" style="width:100%" readonly></sbux-input>
			                                    </td>
			                                    <th scope="row">등록일시</th>
			                                    <td scope="row">
			                                      <sbux-input id="dtl-input-sysFrstInptDt" name="dtl-input-sysFrstInptDt" uitype="text" style="width:100%" readonly></sbux-input>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">제목</th>
			                                    <td colspan="8">
			                                        <sbux-input id="dtl-input-bbsTitle" name="dtl-input-bbsTitle" uitype="text" required style="width:100%" readonly></sbux-input>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">내용</th>
			                                    <td colspan="8">
			                                        <sbux-textarea  rows="10" cols="110"  id="dtl-input-bbsSubject" name="dtl-input-bbsSubject"  uitype="normal" readonly></sbux-textarea>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">댓글작성</th>
			                                    <td colspan="6">
			                                        <sbux-input id="dtl-input-cmntCn" name="dtl-input-cmntCn" uitype="text" required style="width:100%"></sbux-input>
			                                    </td>
			                                    <td colspan="2">
			                                    	<sbux-button id="btnInsertCmnt" name="btnInsertCmnt" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_regComment"></sbux-button>
			                                    </td>
			                                </tr>
			                              </table>
			                              <table class="table table-bordered tbl_fixed" id="cmntList" >
				                              <colgroup>
			                                    <col style="width:10%">
			                                    <col style="width:50%">
			                                    <col style="width:10%">
				                              </colgroup>
			                              </table>
									</div>
		                        </div>
		                    </div>
	                    </li>
                    </ul>
                </div>

    		</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//창고 등록
	let bbs_info;

	function fn_update(){
		let check = SBUxMethod.get("btnUpdateBbsPopup");



		if(check == "수정" || typeof check =="undefined"){
			SBUxMethod.set("btnUpdateBbsPopup","취소");
			SBUxMethod.hide("btnUpdateBbsPopup");
			SBUxMethod.show("btnCancelBbsPopup");
			SBUxMethod.show("btnSaveBbsPopup");
			SBUxMethod.hide("dtl-input-cmntCn");
			SBUxMethod.hide("btnInsertCmnt");
			SBUxMethod.attr("dtl-select-bbsSeCd","readonly","false");
			SBUxMethod.attr("dtl-input-bbsTitle","readonly","false");
			SBUxMethod.attr("dtl-input-bbsSubject","readonly","false");

		}else if (SBUxMethod.get("btnUpdateBbsPopup") == "취소"){
			SBUxMethod.attr("dtl-select-bbsSeCd","readonly","true");
			SBUxMethod.attr("dtl-input-bbsTitle","readonly","true");
			SBUxMethod.attr("dtl-input-bbsSubject","readonly","true");
			SBUxMethod.show("dtl-input-cmntCn");
			SBUxMethod.show("btnInsertCmnt");
			SBUxMethod.set("btnUpdateBbsPopup","수정");
			SBUxMethod.hide("btnCancelBbsPopup");
			SBUxMethod.show("btnUpdateBbsPopup");
			SBUxMethod.hide("btnSaveBbsPopup");

		}

	}

	async function fn_bbsDelete(){
		let bbsNo = SBUxMethod.get("dtl-input-bbsNo");
		const postJsonPromise = gfn_postJSON("/am/bbs/deleteBbs.do", {
			bbsNo : bbsNo
		});
		const data = await postJsonPromise;

		gfn_closeModal('modal-bbsModal','fn_search');
	}

	async function fn_bbsDetailupdate(){
		let x = bbs_info;
		let bbsSeCd = SBUxMethod.get("dtl-select-bbsSeCd");
		if(bbsSeCd){
			bbs_info.bbsSecd = bbsSeCd;
		}
		if(SBUxMethod.get("dtl-input-bbsTitle")){
			bbs_info.bbsTitle = SBUxMethod.get("dtl-input-bbsTitle");
				}
		if(SBUxMethod.get("dtl-input-bbsSubject")){
			bbs_info.bbsSubject = SBUxMethod.get("dtl-input-bbsSubject");
		}

		let bbsNo = SBUxMethod.get("dtl-input-bbsNo");
		const postJsonPromise = gfn_postJSON("/am/bbs/updateBbs.do", {
			bbsSeCd : bbs_info.bbsSecd
			, bbsTitle : bbs_info.bbsTitle
			, bbsSubject : bbs_info.bbsSubject
			, bbsNo : bbsNo
		});
		const data = await postJsonPromise;
		SBUxMethod.attr("dtl-select-bbsSeCd","readonly","true");
		SBUxMethod.attr("dtl-input-bbsTitle","readonly","true");
		SBUxMethod.attr("dtl-input-bbsSubject","readonly","true");
		SBUxMethod.set("btnUpdateBbsPopup","수정");
		SBUxMethod.hide("btnCancelBbsPopup");
		SBUxMethod.show("btnUpdateBbsPopup");
		SBUxMethod.show("dtl-input-cmntCn");
		SBUxMethod.show("btnInsertCmnt");
		gfn_closeModal('modal-bbsModal','fn_search');

	}

	function remove_Comment(){
		var i = 0;
		var cmntLength = $("#cmntList #cmnt").length;
		for(i ; i < cmntLength; i++){
			$("#cmnt").remove();
		}

	}

	async function fn_callInit(){
		SBUxMethod.hide("btnCancelBbsPopup");
		SBUxMethod.hide("btnSaveBbsPopup");
	}

	async function fn_callselectComment(bbsNo){
		const postJsonPromise = gfn_postJSON("/am/bbs/selectBbsCmntList.do", {
        	bbsNo: bbsNo
		});
		const data = await postJsonPromise;
		SBUxMethod.set("dtl-input-cmntCn", "");

		if(data.resultList.length < 0){
			return;
		}
		remove_Comment();
		const list = data.resultList
		const classtag = list.bbsNo+list.cmntChildNo;
		$("#cmntList").append("<tr id=cmnt>");
		$("#cmntList").append("<td id=cmnt class=cmntHd>사용자명 </td> <td id=cmnt class=cmntHd>내용 </td> <td id=cmnt class=cmntHd>  </td> ");
		$("#cmntList").append("</tr>");
		data.resultList.forEach((item, index) => {
			let bbsCmnt = {
				bbsNo 		: item.bbsNo
			  , cmntNo 		: item.cmntNo
			  , cmntChildNo : item.cmntChildNo
			  , cmntCn 	: item.cmntCn
			  , user 	: item.sysFrstInptUserId

			}

			$("#cmntList").append("<tr id=cmnt>");
			$("#cmntList").append("<td id=cmnt style=text-align:center>"+ bbsCmnt.user  +"</td>");
			$("#cmntList").append("<td id=cmnt style=border-left:20px>"+bbsCmnt.cmntCn+"</td>");
			if('${loginVO.userId}' == item.sysFrstInptUserId){
				$("#cmntList").append("<td id=cmnt>"+"<button id=btnDeleteCmnt name=btnDeleteCmnt class=btn btn-xs btn-outline-dark style=width:100% onclick=fn_deleteComment("+bbsCmnt.cmntNo+")>삭제</button></td>");
			}

			$("#cmntList").append("</tr>");
		});

	}

	async function fn_childComment(childNo){
		SBUxMethod.openModal('modal-bbsChildCmntModal');
		SBUxMethod.set("dtl-input-orngChildCmntNo",childNo);
	}

	async function fn_deleteComment(cmntNo){
		let orngbbsNo = SBUxMethod.get("dtl-input-orngBbsNo");
		let postJsonPromise = gfn_postJSON("/am/bbs/deleteCmntBbs.do", { bbsNo : orngbbsNo, cmntNo : cmntNo});
		const data = await postJsonPromise;
		remove_Comment();
		fn_selectComment(orngbbsNo);
	}


	async function fn_regComment(){
		let orngbbsNo = SBUxMethod.get("dtl-input-orngBbsNo");
        let cmntCn = SBUxMethod.get("dtl-input-cmntCn");
		let postJsonPromise = gfn_postJSON("/am/bbs/insertBbsCmnt.do", {
			bbsNo : orngbbsNo,
			cmntCn : cmntCn,
			cmntChildNo : 1,
			});
		const data = await postJsonPromise;
		fn_selectComment(orngbbsNo)
	}


	function fn_selectComment(orngbbsNo){
		fn_callselectComment(orngbbsNo);
	}
</script>
</html>