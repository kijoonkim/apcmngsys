<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>title : 게시판 팝업</title>

</head>
<style>
	table {
		width:80%
	}

	#cmntList .cmntHd{
		text-align:center;
		height:50px;
		border: 1px solid #e8f1f9;
		font-weight: bold;
	}
	#cmnt{
		border: 1px solid #e8f1f9;
		padding: 10px;
	}
	#cmntXmp{
		padding: 10px;
		font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
	}
</style>
<body oncontextmenu="return false">
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
									<sbux-input id="dtl-input-orngApcCd" name="dtl-input-orngApcCd" uitype="hidden"></sbux-input>
		                            <sbux-input id="dtl-input-orngBbsNo" name="dtl-input-orngBbsNo" uitype="hidden"></sbux-input>
		                            <sbux-input id="dtl-input-orngCmntNo" name="dtl-input-orngCmntNo" uitype="hidden"></sbux-input>
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
			                                        <sbux-input id="dtl-input-bbsTtl" name="dtl-input-bbsTtl" uitype="text" required style="width:100%" readonly></sbux-input>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">내용</th>
			                                    <td colspan="8">
			                                        <sbux-textarea  rows="10" cols="110"  id="dtl-input-bbsSbjt" name="dtl-input-bbsSbjt"  uitype="normal" readonly></sbux-textarea>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">첨부파일</th>
			                                    <td colspan="8">
			                                        <div id="drop-area">
													    <p>첨부파일을 여기에 드래그 해주세요</p>
													    <label for="bbsfile" class="custom-file-upload">첨부파일</label>
													    <input type="file" name="files" id="bbsfile" multiple style="display: none;"  accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx">
													    <input type="file" name="filesa" id="bbsfileList" multiple style="display: none;">
													    <ul id="org-file-list"></ul>
													    <ul id="file-list"></ul>
													</div>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">댓글작성1</th>
			                                    <td colspan="6">
			                                        <sbux-input id="dtl-input-cmntCn" name="dtl-input-cmntCn" uitype="text" required style="width:100%"></sbux-input>
			                                    </td>
			                                    <td colspan="2">
			                                    	<sbux-button id="btnInsertCmnt" name="btnInsertCmnt" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_regComment"></sbux-button>
			                                    </td>
			                                </tr>
			                              </table>
			                              <table  class="table table-bordered tbl_fixed" id="cmntList" >
				                              <colgroup>
			                                    <col style="width:10%">
			                                    <col style="width:50%">
			                                    <col style="width:10%">
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
			SBUxMethod.attr("dtl-input-bbsTtl","readonly","false");
			SBUxMethod.attr("dtl-input-bbsSbjt","readonly","false");

		}else if (SBUxMethod.get("btnUpdateBbsPopup") == "취소"){
			SBUxMethod.attr("dtl-select-bbsSeCd","readonly","true");
			SBUxMethod.attr("dtl-input-bbsTtl","readonly","true");
			SBUxMethod.attr("dtl-input-bbsSbjt","readonly","true");
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
		let apcCd = "";

		if(gv_apcCd == "0000"){
			apcCd = SBUxMethod.get("dtl-input-orngApcCd");
		}else{
			apcCd = gv_apcCd;
		}

		const postJsonPromise = gfn_postJSON("/am/bbs/deleteBbs.do", {
			 apcCd : apcCd
			,bbsNo : bbsNo
		});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_closeModal('modal-bbsModal','fn_search');
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	async function fn_bbsDetailupdate(){
		let x = bbs_info;
		let bbsSeCd = SBUxMethod.get("dtl-select-bbsSeCd");
		if(bbsSeCd){
			bbs_info.bbsSecd = bbsSeCd;
		}
		if(SBUxMethod.get("dtl-input-bbsTitle")){
			bbs_info.bbsTitle = SBUxMethod.get("dtl-input-bbsTtl");
				}
		if(SBUxMethod.get("dtl-input-bbsSbjt")){
			bbs_info.bbsSubject = SBUxMethod.get("dtl-input-bbsSbjt");
		}

		let bbsNo = SBUxMethod.get("dtl-input-bbsNo");
		const postJsonPromise = gfn_postJSON("/am/bbs/updateBbs.do", {
			bbsSeCd : bbs_info.bbsSecd
			, bbsTtl : bbs_info.bbsTtl
			, bbsSbjt : bbs_info.bbsSbjt
			, bbsNo : bbsNo
			, apcCd : gv_apcCd
		});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		SBUxMethod.attr("dtl-select-bbsSeCd","readonly","true");
        		SBUxMethod.attr("dtl-input-bbsTtl","readonly","true");
        		SBUxMethod.attr("dtl-input-bbsSbjt","readonly","true");
        		SBUxMethod.set("btnUpdateBbsPopup","수정");
        		SBUxMethod.hide("btnCancelBbsPopup");
        		SBUxMethod.show("btnUpdateBbsPopup");
        		SBUxMethod.show("dtl-input-cmntCn");
        		SBUxMethod.show("btnInsertCmnt");
        		gfn_closeModal('modal-bbsModal','fn_search');
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	function remove_Comment(){
		var i = 0;
		var cmntLength = $("#cmntList #cmnt").length;
		for(i ; i < cmntLength; i++){
			$("#cmnt").remove();
		}

	}

	async function fn_callInit(user){
		SBUxMethod.hide("btnCancelBbsPopup");
		SBUxMethod.hide("btnSaveBbsPopup");
		SBUxMethod.show("btnUpdateBbsPopup");
		SBUxMethod.attr("dtl-select-bbsSeCd","readonly","true");
		SBUxMethod.attr("dtl-input-bbsTtl","readonly","true");
		SBUxMethod.attr("dtl-input-bbsSbjt","readonly","true");
		SBUxMethod.show("dtl-input-cmntCn");
		SBUxMethod.show("btnInsertCmnt");
		let apcCd = gv_apcCd;
		if(apcCd === '0000' || user === '${loginVO.name}'){
			SBUxMethod.show("btnDeleteBbsPopup");
			SBUxMethod.show("btnUpdateBbsPopup");
		}else{
			SBUxMethod.hide("btnDeleteBbsPopup");
			SBUxMethod.hide("btnUpdateBbsPopup");
		}

	}

	async function fn_callselectComment(bbsNo){
		$('#cmntList *').remove();
		let apcCd = gv_apcCd;
		const postJsonPromise = gfn_postJSON("/am/bbs/selectBbsCmntList.do", {
			 apcCd: apcCd
        	,bbsNo: bbsNo
		});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            	return;
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	return;
        }

		SBUxMethod.set("dtl-input-cmntCn", "");

		if(data.resultList.length < 0){
			return;
		}
		remove_Comment();
		const list = data.resultList;
		const classtag = list.bbsNo+list.cmntChildNo;
		$("#cmntList").append("<tr id=cmnt>");
		$("#cmntList").append("<td id=cmnt class=cmntHd>사용자명 </td> <td id=cmnt class=cmntHd>내용 </td> <td id=cmnt class=cmntHd>  </td> ");
		$("#cmntList").append("</tr>");
		data.resultList.forEach((item, index) => {
			let bbsCmnt = {
				bbsNo 		: item.bbsNo
			  , cmntNo 		: item.cmntNo
			  , cmntChildNo : item.cmntChildNo
			  , cmntCn 		: item.cmntCn
			  , user 		: item.sysFrstInptUserId

			}
			$("#cmntList").append("<tr id=cmnt>");
			if(item.cmntChildNo == "1"){
				$("#cmntList").append("<td id=cmnt style=text-align:center>"+ bbsCmnt.user  +"</td>");
				//$("#cmntList").append("<td id=newCmnt style=border-left:20px><xmp id=cmntXmp>"+String(bbsCmnt.cmntCn)+"</xmp></td>");
				const newTdCmnt = document.createElement("td");
				const newSpanCmnt = document.createElement("span");
				newSpanCmnt.innerText = String(bbsCmnt.cmntCn);
				newTdCmnt.appendChild(newSpanCmnt);
				$("#cmntList").append(newTdCmnt);
				$("#cmntList").append("<td id=cmnt>"+"<button id=bbsChildCmntModal name=bbsChildCmntModal class=btn btn-xs  style=width:100% onclick=fn_childComment("+bbsCmnt.cmntNo+","+bbsCmnt.cmntChildNo+")>답글</button></td>");
				if('${loginVO.userId}' == item.sysFrstInptUserId){
					$("#cmntList").append("<td id=cmnt>"+"<button id=btnDeleteCmnt name=btnDeleteCmnt class=btn btn-xs  style=width:100% onclick=fn_deleteComment("+bbsCmnt.cmntNo+")>삭제</button></td>");
				}

			}else if(item.cmntChildNo != "1"){
				$("#cmntList").append("<td id=cmnt style=text-align:center>"+ " " +"</td>");
				$("#cmntList").append("<td id=cmnt style=border-left:20px><xmp id=cmntXmp>"+bbsCmnt.user+" : "+bbsCmnt.cmntCn+"</xmp></td>");
				if('${loginVO.userId}' == item.sysFrstInptUserId){
					$("#cmntList").append("<td id=cmnt>"+"<button id=btnDeleteCmnt name=btnDeleteCmnt class=btn btn-xs  style=width:100% onclick=fn_deleteCommentComment("+bbsCmnt.cmntNo+","+bbsCmnt.cmntChildNo+")>삭제</button></td>");
				}
			}
			$("#cmntList").append("</tr>");
		});

	}

	async function fn_childComment(cmntNo,cmntChildNo){
		SBUxMethod.set("dtl-input-orngCmntNo",cmntNo);
		SBUxMethod.set("dtl-input-orngChildCmntNo",cmntChildNo);
		SBUxMethod.openModal('modal-bbsChildCmntModal');
		console.log('openModal');
	}

	async function fn_deleteComment(cmntNo){
		let orngbbsNo = SBUxMethod.get("dtl-input-orngBbsNo");
		let postJsonPromise = gfn_postJSON("/am/bbs/deleteCmntBbs.do", { apcCd : gv_apcCd, bbsNo : orngbbsNo, cmntNo : cmntNo});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		remove_Comment();
        		fn_selectComment(orngbbsNo);
        	} else {
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	async function fn_deleteCommentComment(cmntNo, cmntChildNo){
		console.log('대댓글 삭제');
		let orngbbsNo = SBUxMethod.get("dtl-input-orngBbsNo");
		console.log('cmntChildNo', cmntChildNo);
		let postJsonPromise = gfn_postJSON("/am/bbs/deleteCmntBbs.do", { apcCd : gv_apcCd, bbsNo : orngbbsNo, cmntNo : cmntNo, cmntChildNo : cmntChildNo});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		remove_Comment();
        		fn_selectComment(orngbbsNo);
        	} else {
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}


	async function fn_regComment(){
		let orngbbsNo = SBUxMethod.get("dtl-input-orngBbsNo");
        let cmntCn = SBUxMethod.get("dtl-input-cmntCn");
        let apcCd = gv_apcCd;
        if(cmntCn.length==0){
        	gfn_comAlert("W0005", "입력대상");		//	W0005	{0}이/가 없습니다.
        	fn_selectComment(orngbbsNo);
        	return false;
        }
		let postJsonPromise = gfn_postJSON("/am/bbs/insertBbsCmnt.do", {
			apcCd : apcCd,
			bbsNo : orngbbsNo,
			cmntCn : cmntCn,
			cmntChildNo : 1
			});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_selectComment(orngbbsNo);
        	} else {
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}


	function fn_selectComment(orngbbsNo){
		fn_callselectComment(orngbbsNo);
	}
	const fn_callBackSelectComment = function(orngbbsNo) {
		fn_callselectComment(orngbbsNo);
	}


	/**************첨부 파일********************/

	//첨부파일 업로드
    function fn_fileUpload(bbsNo) {
    	console.log("===========fn_fileUpload");
    	var formData = new FormData();
    	var files = $('#bbsfileList')[0].files;

    	if(files.length == 0){return;}

    	for (var i = 0; i < files.length; i++) {
            formData.append('files', files[i]);
        }
    	if(Number(bbsNo) > 0){
			//게시판 번호
    		formData.append('bbsNo', "0");
    	}else{
    		//게시판 번호
    		formData.append('bbsNo', bbsNo);
    	}

        $.ajax({
            type: 'POST',
            url: '/am/bbs/fileUpload.do',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                console.log(response);
                gfn_comAlert("I0001");
        		fn_search();
            },
            error: function (error) {
                console.log('Error:', error);
            }
        });
	}

    window.addEventListener('DOMContentLoaded', function(e) {
    	//첨부파일 드래그 앤 드랍 구현
    	$('#drop-area').on('dragover', function (e) {
        	console.log("dragover---------");
    	    e.preventDefault();
    	    $('#drop-area').addClass('highlight');
    	});

    	$('#drop-area').on('dragleave', function () {
        	console.log("dragleave---------");
        	$('#drop-area').removeClass('highlight');
    	});

    	//드랍 이벤트
    	$('#drop-area').on('drop', function (e) {
    		console.log("drop---------");
    	    e.preventDefault();
    	    $('#drop-area').removeClass('highlight');
    	    var files = e.originalEvent.dataTransfer.files;
    	    showFiles(files);
    	});
    	//input 변경이벤트
    	$('#bbsfile').on('change', function (e) {
    		console.log("change---------");
    	    var files = $(this)[0].files;
    	    showFiles(files);
    	});
    });

 	// 허용하려는 확장자들
    const allowedExtensionsBbs = ['.gif' , '.jpg' , '.jpeg' , '.png' , '.xls' , '.xlsx' , 'zip'];

	function showFiles(newfiles) {

		var newFileList = new DataTransfer();
		var fileList = $('#bbsfileList')[0].files;
		//기존파일
		for (var i = 0; i < fileList.length; i++) {
			newFileList.items.add(fileList[i]);
		}
		if(newfiles != null){
			//새로운 파일
			for (var i = 0; i < newfiles.length; i++) {
				var newfileName = newfiles[i].name;
				var fileExtension = '.' + newfileName.split('.').pop();

				if (allowedExtensionsBbs.indexOf(fileExtension.toLowerCase()) === -1) {
			    	gfn_comAlert('W0001', '올바른 확장자');
			    	newfiles = null; // 파일 선택 취소
			    	return false;
			    }
				newFileList.items.add(newfiles[i]);
			}
		}

		$('#bbsfileList')[0].files = newFileList.files;

	    var ulList = $('#file-list');
	    //리스트 초기화
	    ulList.empty();
	    //파일 목록
		var realFileList = $('#bbsfileList')[0].files;
	    for (var i = 0; i < realFileList.length; i++) {
	    	var fileName = realFileList[i].name;
	        var fileItem = $('<li class="file-item">' +
	                '<span class="file-name">' + fileName + '</span>' +
	                '<span class="remove-file" onclick="removeFile(' + i + ')">삭제</span>' +
	                '</li>');
	        ulList.append(fileItem);
	    }
	    console.log($('#bbsfile')[0].files);
	    $('#bbsfile').val("");
	}

 	// 파일 리스트에서 파일을 제거하는 함수
    function removeFile(index) {
    	console.log("==============removeFile==============");

 		var fileList = $('#bbsfileList')[0].files;
    	console.log(fileList);
        var fileListContainer = $('#file-list');

        // 선택한 파일을 리스트에서 제거
        fileListContainer.find('.file-item').eq(index).remove();

        // input[type=file]에서도 제거
        //보안 문제로 files는 읽기 전용
        var newFileList = new DataTransfer();
        for (var i = 0; i < fileList.length; i++) {
            if (i !== index) {
                //newFileList.push(fileList[i]);
            	newFileList.items.add(fileList[i]);
            }
        }
        $('#bbsfileList')[0].files = newFileList.files;
        console.log($('#bbsfileList')[0].files);
        showFiles(null);
    }
 	//첨부파일 삭제
    const deleteFile = async function (atchflno){

     	const postJsonPromise = gfn_postJSON("/am/bbs/deleteBbsAttache.do", {
     		atchflno : atchflno
     	});

         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
				$("#att_"+atchflno).remove();
         		gfn_comAlert("I0001");
         	} else {
         		gfn_comAlert("E0001");
         	}
         } catch(e) {
         }

         // 결과 확인 후 재조회
         console.log("update result", data);
    }

 	//파일다운로드
    const downloadFile = async function (atchflno){
 		var url = "/download/"+atchflno;
 		window.open(url);
    }

</script>

	<!-- 첨부파일 스타일 추가 -->
	<style>
        #drop-area {
            border: 2px dashed #ccc;
            padding: 20px;
            width: 90%;
            text-align: center;
            cursor: pointer;
        }

        #file-list {
            list-style-type: none;
            padding: 0;
        }

        .file-item {
            margin: 5px;
        }
        .remove-file {
        	padding-left: 10px;
            cursor: pointer;
            color: #e74c3c;
        }
        .custom-file-upload {
            display: inline-block;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            padding: 5px 10px;
            color: #fff;
            background-color: #3498db;
            border: 1px solid #3498db;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .custom-file-upload:hover {
            background-color: #2980b9;
            border: 1px solid #2980b9;
        }
    </style>
</html>