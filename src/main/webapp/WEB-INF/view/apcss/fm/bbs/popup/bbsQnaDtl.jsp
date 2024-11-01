<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 첨부파일 스타일 추가 -->
	<style>
		#drop-area {
			border: 2px dashed #ccc;
			padding: 20px;
			width: 100%;
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
		.remove-file , .download-file {
			padding-left: 10px;
			cursor: pointer;
			color: #e74c3c;
		}
		.remove-file:hover ,.download-file:hover{
			font-weight: bolder;
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
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="bbsDtl-btn-btnDelete" name="bbsDtl-btn-btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="popBbsDtl.fn_delete"></sbux-button>
					<sbux-button id="bbsDtl-btn-btnEdit" name="bbsDtl-btn-btnEdit" uitype="normal" text="수정" class="btn btn-sm btn-outline-danger" onclick="popBbsDtl.fn_edit"></sbux-button>
					<sbux-button id="bbsDtl-btn-btnSave" name="bbsDtl-btn-btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popBbsDtl.fn_save"></sbux-button>
					<sbux-button id="bbsDtl-btn-btnEnd" name="bbsDtl-btn-btnEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popBbsDtl.fn_close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="bbsDtl-inp-orgBbsNo" name="bbsDtl-inp-orgBbsNo" uitype="hidden"></sbux-input>
				<sbux-input id="bbsDtl-inp-orgBbsSeCd" name="bbsDtl-inp-orgBbsSeCd" uitype="hidden"></sbux-input>
				<div class="bbsDtl-wrap">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px;padding-left: 10px;">게시글 상세정보</span>
							</li>
						</ul>
					</div>
					<div class="sbt-wrap-body">
						<form id="frm1" name="frm1" method="post">
							<sbux-input class="form-control input-sm" id="bbsDtl-inp-orngBbsNo" name="bbsDtl-inp-orngBbsNo" uitype="hidden"></sbux-input>
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width:10%">
									<col style="width:3%">

									<col style="width:10%">
									<col style="width:10%">

									<col style="width:10%">
									<col style="width:10%">

									<col style="width:10%">
									<col style="width:25%">
								</colgroup>
								<tr>
									<!--
									<th scope="row" class="th_bg">구분</th>
									<td class="td_input" style="border-right: hidden;word-break:break-all">
										<sbux-select class="form-control input-sm" id="bbsDtl-inp-bbsSeCd" name="bbsDtl-inp-bbsSeCd" uitype="single"
											jsondata-ref="jsonBbsDtlPopBbsSeCd"
											unselected-text="선택"
											readonly
											></sbux-select>
									</td>
									-->
									<th scope="row" class="th_bg">비밀글여부</th>
									<td>
										<sbux-checkbox id="bbsDtl-chk-prvtPstYn" name="bbsDtl-chk-prvtPstYn" uitype="normal" text="" true-value="Y" false-value="N">
									</td>
									<th scope="row" class="th_bg">게시글번호</th>
									<td class="td_input" style="border-right: hidden">
										<sbux-input class="form-control input-sm" id="bbsDtl-inp-bbsNo" name="bbsDtl-inp-bbsNo" uitype="text" required style="width:100%" readonly ></sbux-input>
									</td>
									<th scope="row" class="th_bg">작성자</th>
									<td class="td_input" style="border-right: hidden">
										<sbux-input class="form-control input-sm" id="bbsDtl-inp-sysFrstInptUserIdNm" name="bbsDtl-inp-sysFrstInptUserIdNm" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
									<th scope="row" class="th_bg">작성일</th>
									<td class="td_input" style="border-right: hidden">
										<sbux-input class="form-control input-sm" id="bbsDtl-inp-sysFrstInptDt" name="bbsDtl-inp-sysFrstInptDt" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">제목</th>
									<td colspan="7">
										<sbux-input class="form-control input-sm" id="bbsDtl-inp-bbsTtl" name="bbsDtl-inp-bbsTtl" uitype="text" required style="width:100%"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">내용</th>
									<td colspan="7">
										<sbux-textarea  rows="16" cols="120"  id="bbsDtl-inp-bbsSbjt" name="bbsDtl-inp-bbsSbjt"  uitype="normal" style="width:100%;overflow-y: auto"></sbux-textarea>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">첨부파일</th>
									<td colspan="7">
										<div id="drop-area">
											<div id = "fileUploadArea">
												<p>첨부파일을 여기에 드래그 해주세요</p>
												<label for="bbsfile" class="custom-file-upload">첨부파일</label>
												<input type="file" name="files" id="bbsfile" multiple style="display: none;" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx , .zip , .pdf , .hwp , .hwpx">
												<input type="file" name="filesa" id="bbsfileList" multiple style="display: none;">
											</div>
											<ul id="org-file-list"></ul>
											<ul id="file-list"></ul>
										</div>
									</td>
								</tr>
								<tr>
									<th colspan="4" scope="row" class="th_bg">답변</th>
									<th scope="row" class="th_bg">답변자</th>
									<td class="td_input" style="border-right: hidden">
										<sbux-input class="form-control input-sm" id="bbsDtl-inp-ansUserNm" name="bbsDtl-inp-ansUserNm" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
									<th scope="row" class="th_bg">답변 일시</th>
									<td class="td_input" style="border-right: hidden">
										<sbux-input class="form-control input-sm" id="bbsDtl-inp-ansDt" name="bbsDtl-inp-ansDt" uitype="text" style="width:100%" readonly></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">답변 내용</th>
									<td colspan="7">
										<sbux-textarea  rows="16" cols="120"  id="bbsDtl-inp-ansSbjt" name="bbsDtl-inp-ansSbjt"  uitype="normal" style="width:100%;overflow-y: auto"></sbux-textarea>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<sbux-button id="bbsDtl-btn-btnSaveAns" name="bbsDtl-btn-btnSaveAns" uitype="normal" text="답변 저장" class="btn btn-sm btn-outline-danger" onclick="popBbsDtl.fn_saveAns"></sbux-button>
				</div>
			</div><!-- box-body end -->
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonBbsDtlPopBbsSeCd = [];

	// 허용하려는 확장자들
	const allowedExtensions = ['.gif' , '.jpg' , '.jpeg' , '.png' , '.xls' , '.xlsx' , '.zip' , '.pdf' , '.hwp' , '.hwpx'];

	/**
	 * @description 게시글 팝업
	 */
	const popBbsDtl = {
		prgrmId: 'bbsDtlPopup',
		modalId: 'modal-bbsDtl',
		callbackFnc: function() {},
		init: async function(_callbackFnc , _bbsSeCd , _bbsNo) {
			SBUxMethod.hide("bbsDtl-btn-btnSave");//저장버튼
			if(gv_userType == "00" || gv_userType == "01" || gv_userType == "02"){
				SBUxMethod.show("bbsDtl-btn-btnDelete");//삭제버튼
				SBUxMethod.show("bbsDtl-btn-btnEdit");//수정버튼
				SBUxMethod.show("bbsDtl-btn-btnSaveAns");//답변저장 버튼
				this.fn_editAns();
			}else{
				SBUxMethod.hide("bbsDtl-btn-btnDelete");//삭제버튼
				SBUxMethod.hide("bbsDtl-btn-btnEdit");//수정버튼
				SBUxMethod.hide("bbsDtl-btn-btnSaveAns");//답변저장 버튼
			}

			//게시글 구분
			//await gfn_setComCdSBSelect('bbsDtl-inp-bbsSeCd', jsonBbsDtlPopBbsSeCd, 'BBS_SE_CD');

			//초기화
			await this.fn_clearForm();

			SBUxMethod.set("bbsDtl-inp-orgBbsNo",_bbsNo);//게시글 번호
			SBUxMethod.set("bbsDtl-inp-orgBbsSeCd",_bbsSeCd);//게시글 구분
			SBUxMethod.set("bbsDtl-inp-bbsNo",_bbsNo);//게시글 번호
			//SBUxMethod.set("bbsDtl-inp-bbsSeCd",_bbsSeCd);//게시글 구분

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if(_bbsNo != null){
				await this.fn_search();
			}else{
				await this.fn_edit();
			}
		},
		fn_clearForm: function() {
			SBUxMethod.set("bbsDtl-inp-orgBbsNo",null);//게시글 번호
			SBUxMethod.set("bbsDtl-inp-orgBbsSeCd",null);//게시글 구분

			SBUxMethod.set("bbsDtl-inp-bbsNo", null);
			//SBUxMethod.set("bbsDtl-inp-bbsSeCd", null);
			SBUxMethod.set("bbsDtl-inp-bbsTtl", null);
			SBUxMethod.set("bbsDtl-inp-bbsSbjt", null);
			SBUxMethod.set("bbsDtl-inp-sysFrstInptUserIdNm", null);
			SBUxMethod.set("bbsDtl-inp-sysFrstInptDt", null);

			SBUxMethod.set("bbsDtl-inp-ansDt", null);
			SBUxMethod.set("bbsDtl-inp-ansUserNm", null);
			SBUxMethod.set("bbsDtl-inp-ansSbjt", null);
			SBUxMethod.set("bbsDtl-chk-prvtPstYn", "N");

			SBUxMethod.attr("bbsDtl-inp-bbsTtl","readonly","true");//제목
			SBUxMethod.attr("bbsDtl-inp-bbsSbjt","readonly","true");//내용
			SBUxMethod.attr("bbsDtl-inp-ansSbjt","readonly","true");//답변내용
			SBUxMethod.attr("bbsDtl-chk-prvtPstYn","readonly","true");//비밀글여부

			//첨부파일 리스트 초기화
			$('#file-list').empty();
			$('#org-file-list').empty();
			$('#fileUploadArea').hide();
			this.bbsDtlFileTrigger = false;
		},
		fn_close: function(_refresh) {
			gfn_closeModal(this.modalId, this.callbackFnc, _refresh);
		},
		fn_search: async function() {

			let bbsNo = SBUxMethod.get("bbsDtl-inp-orgBbsNo");
			let bbsSeCd = SBUxMethod.get("bbsDtl-inp-orgBbsSeCd");

			const postJsonPromise = gfn_postJSON("/fm/bbs/selectBbs.do", {
				bbsNo : bbsNo //게시글 번호
				,bbsSeCd : bbsSeCd //게시글 구분
			});
			const data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					let item = data.resultMap;

					if(item != null){
						SBUxMethod.set("bbsDtl-inp-bbsNo", item.bbsNo);
						//SBUxMethod.set("bbsDtl-inp-bbsSeCd", item.bbsSeCd);
						SBUxMethod.set("bbsDtl-inp-bbsTtl", item.bbsTtl);
						SBUxMethod.set("bbsDtl-inp-bbsSbjt", item.bbsSbjt);
						SBUxMethod.set("bbsDtl-inp-sysFrstInptUserIdNm", item.sysFrstInptUserIdNm);
						SBUxMethod.set("bbsDtl-inp-sysFrstInptDt", item.sysFrstInptDt);

						SBUxMethod.set("bbsDtl-inp-ansDt", item.ansDt);
						SBUxMethod.set("bbsDtl-inp-ansUserNm", item.ansUserNm);
						SBUxMethod.set("bbsDtl-inp-ansSbjt", item.ansSbjt);

						SBUxMethod.set("bbsDtl-chk-prvtPstYn", item.prvtPstYn);

						if(item.bbsEditChk == '1'){
							SBUxMethod.show("bbsDtl-btn-btnEdit");//수정버튼
							SBUxMethod.show("bbsDtl-btn-btnDelete");//삭제버튼
						}
						this.fn_fileSearch();//첨부파일 조회
					}
				} else {
					gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
				}
			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		fn_fileSearch: async function() {
			let bbsNo = SBUxMethod.get("bbsDtl-inp-orgBbsNo");

			const postJsonPromise = gfn_postJSON("/fm/bbs/selectBbsAttachesList.do", {
				bbsNo: bbsNo
			});

			const data = await postJsonPromise;
			try {
				data.resultList.forEach((item, index) => {
					const msg = {
						bbsNo: item.bbsNo,
					}
					let ulList = $('#org-file-list');
					let fileName = item.atchflOrgnNm;
					let fileItem = $('<li class="file-item" id=att_"' + item.atchflno + '">' +
							'<span class="file-name">' + fileName + '</span>' +
							'<span class="download-file" onclick="downloadFile(' + item.atchflno + ')">다운</span>' +
							'<span class="remove-file" style="display:none;" onclick="deleteFile(' + item.atchflno + ')">삭제</span>' +
							'</li>');
					ulList.append(fileItem);
				});
			} catch(e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		fn_edit: async function() {
			SBUxMethod.attr("bbsDtl-inp-bbsTtl","readonly","false");//제목
			SBUxMethod.attr("bbsDtl-inp-bbsSbjt","readonly","false");//내용
			SBUxMethod.attr("bbsDtl-chk-prvtPstYn","readonly","false");//비밀글여부

			SBUxMethod.show("bbsDtl-btn-btnSave");//저장버튼
			SBUxMethod.hide("bbsDtl-btn-btnEdit");//수정버튼
			$(".remove-file").show();
			$("#fileUploadArea").show();
			this.bbsDtlFileTrigger = true;
			console.log(this.bbsDtlFileTrigger);
		},
		fn_editAns: async function() {
			SBUxMethod.attr("bbsDtl-inp-ansSbjt","readonly","false");//답변 내용
		},
		fn_save: async function() {
			let bbsNo = SBUxMethod.get("bbsDtl-inp-bbsNo");

			if (!SBUxMethod.get("bbsDtl-inp-bbsTtl")) {
				alert("제목을 입력하세요.");
				return;
			}

			if (!SBUxMethod.get("bbsDtl-inp-bbsSbjt")) {
				alert("내용을 입력하세요.");
				return;
			}

			if (gfn_isEmpty(bbsNo)) {
				// 신규 등록
				this.fn_subInsert(confirm("등록 하시겠습니까?"));
			} else {
				// 변경 저장
				this.fn_subUpdate(confirm("저장 하시겠습니까?"));
			}
		},
		fn_subInsert: async function(isConfirmed) {
			if (!isConfirmed) return;

			const postJsonPromise = gfn_postJSON("/fm/bbs/insertBbs.do", {
				bbsSeCd: SBUxMethod.get('bbsDtl-inp-orgBbsSeCd'),
				bbsTtl: SBUxMethod.get('bbsDtl-inp-bbsTtl'),
				bbsSbjt: SBUxMethod.get('bbsDtl-inp-bbsSbjt'),
				prvtPstYn: SBUxMethod.get("bbsDtl-chk-prvtPstYn")['bbsDtl-chk-prvtPstYn']
			});

			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					var fileList = $('#bbsfileList')[0].files;
					if(fileList.length > 0){
						fn_fileUpload(data.bbsNo);
					}else{
						alert("처리 되었습니다.");
						this.fn_close("refresh");
					}
				} else {
					alert(data.resultMessage);
				}
			} catch(e) {
			}

			// 결과 확인 후 재조회
			//console.log("insert result", data);
		},
		fn_subUpdate: async function(isConfirmed) {
			if (!isConfirmed) return;

			const postJsonPromise = gfn_postJSON("/fm/bbs/updateBbs.do", {
				bbsNo: SBUxMethod.get('bbsDtl-inp-orgBbsNo'),
				bbsSeCd: SBUxMethod.get('bbsDtl-inp-orgBbsSeCd'),
				bbsTtl: SBUxMethod.get('bbsDtl-inp-bbsTtl'),
				bbsSbjt: SBUxMethod.get('bbsDtl-inp-bbsSbjt'),
				prvtPstYn: SBUxMethod.get("bbsDtl-chk-prvtPstYn")['bbsDtl-chk-prvtPstYn']
			});

			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					var fileList = $('#bbsfileList')[0].files;
					if(fileList.length > 0){
						var bbsNo = SBUxMethod.get('bbsDtl-inp-bbsNo');
						fn_fileUpload(bbsNo);
					}else{
						alert("처리 되었습니다.");
						this.fn_close("refresh");
					}
				} else {
					alert(data.resultMessage);
				}
			} catch(e) {
			}
			// 결과 확인 후 재조회
			//console.log("update result", data);
		},
		fn_delete: async function() {
			//const postJsonPromise = gfn_postJSON("/co/msg/deleteComMsgList.do", list);
			const postJsonPromise = gfn_postJSON("/fm/bbs/deleteBbs.do",{
				bbsNo: SBUxMethod.get('bbsDtl-inp-orgBbsNo')
			});

			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					alert("처리 되었습니다.");
					this.fn_close("refresh");
				} else {
					alert(data.resultMessage);
				}
			} catch(e) {
				alert(data.resultMessage);
			}
		},
		fn_saveAns: async function() {
			const postJsonPromise = gfn_postJSON("/fm/bbs/updateBbsAns.do", {
				bbsNo: SBUxMethod.get('bbsDtl-inp-orgBbsNo'),
				bbsSeCd: SBUxMethod.get('bbsDtl-inp-orgBbsSeCd'),
				ansSbjt: SBUxMethod.get('bbsDtl-inp-ansSbjt')
			});

			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {
					alert("처리 되었습니다.");
					this.fn_close("refresh");
				} else {
					alert(data.resultMessage);
				}
			} catch(e) {
			}
			// 결과 확인 후 재조회
			//console.log("update result", data);
		}
	}

	function fn_itemSelectEnterKey() {
		if(window.event.keyCode == 13) {
			popItemSelect.search();
		}
	}

	//null 체크
	function nvlScnd(str, defaultStr){
		if(typeof str == "undefined" || str == null || str == "" || str == "null")
			str = defaultStr ;
		return str ;
	}

	/**************첨부 파일********************/

	//첨부파일 업로드
	function fn_fileUpload(bbsNo) {
		if(gfn_isEmpty(bbsNo)){
			return;
		}

		var formData = new FormData();
		var files = $('#bbsfileList')[0].files;
		if(files.length == 0){return;}
		for (var i = 0; i < files.length; i++) {
			formData.append('files', files[i]);
		}

		formData.append('bbsNo', bbsNo);


		$.ajax({
			type: 'POST',
			url: '/fm/bbs/fileUpload.do',
			data: formData,
			processData: false,
			contentType: false,
			success: function (response) {
				alert("처리 되었습니다.");
				//fn_search();
				popBbsDtl.fn_close("refresh");
			},
			error: function (error) {
				//console.log('Error:', error);
			}
		});
	}

	//첨부파일 드래그 앤 드랍 구현
	var dropArea = $('#drop-area');
	dropArea.on('dragover', function (e) {
		e.preventDefault();
		dropArea.addClass('highlight');
	});

	dropArea.on('dragleave', function () {
		dropArea.removeClass('highlight');
	});

	//드랍 이벤트
	dropArea.on('drop', function (e) {
		e.preventDefault();
		dropArea.removeClass('highlight');
		var files = e.originalEvent.dataTransfer.files;
		//showFiles(files);
		popBbsDtl.fn_showFiles(files);
	});

	//input 변경이벤트
	$('#bbsfile').on('change', function (e) {
		var files = $(this)[0].files;
		//showFiles(files);
		popBbsDtl.fn_showFiles(files);
	});


	function showFiles(newfiles) {
		console.log(popBbsDtl.bbsDtlFileTrigger);
		if(popBbsDtl.fn_trigger()){
			return;
		}
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

				if (allowedExtensions.indexOf(fileExtension.toLowerCase()) === -1) {
					alert('올바른 확장자를 선택하세요.');
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
		$('#bbsfile').val("");
	}

	// 파일 리스트에서 파일을 제거하는 함수
	function removeFile(index) {

		var fileList = $('#bbsfileList')[0].files;
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
		showFiles(null);
	}
	//첨부파일 삭제
	const deleteFile = async function (atchflno){

		const postJsonPromise = gfn_postJSON("/fm/bbs/deleteBbsAttache.do", {
			atchflno : atchflno
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				$("#att_"+atchflno).remove();
				alert("삭제 되었습니다.");
				fn_search();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}

		// 결과 확인 후 재조회
		//console.log("update result", data);
	}

	//파일다운로드
	const downloadFile = async function (atchflno){
		var url = "/download/"+atchflno;
		window.open(url);
	}

</script>
</html>