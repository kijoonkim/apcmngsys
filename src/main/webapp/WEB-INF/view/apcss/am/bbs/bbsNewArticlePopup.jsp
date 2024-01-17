<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : SBUx2.6</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<!--
					<sbux-button id="test" name="test" uitype="normal" text="test" class="btn btn-sm btn-outline-danger" onclick="fn_bbsNewFileUpload"></sbux-button>
					 -->
					<sbux-button id="btnsaveNewArticle" name="btnsaveNewArticle" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_ArticleCreate"></sbux-button>
					<sbux-button id="btnEndNewArticle" name="btnEndNewArticle" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-bbsNewArticlePopup','fn_search')"></sbux-button>

				</div>
			</div>
			<div class="box-body">
				<div class="sbt-con-wrap">
                	<ul>
	                    <li style="display:inline-block;float:right;width: 100%;vertical-align:top;">
		                    <div class="sbt-grid-wrap">

		                        <div class="sbt-wrap-body">
		                            <form id="frm1" name="frm1" method="post">
		                            <sbux-input id="dtl-input-orngBbsNo" name="dtl-input-orngBbsNo" uitype="hidden"></sbux-input>
		                            <sbux-input id="dtl-input-orngChildCmntNo" name="dtl-input-orngChildCmntNo" uitype="hidden"></sbux-input>
		                            <div class ="sbt-wrap-body">
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
			                                    <td colspan="8">
			                                    	<sbux-select id="dtl-select-newbbsSeCd" name="dtl-select-newbbsSeCd" uitype="single"
			                                    		jsondata-ref="jsonComBbsSeCd"
			                                    		unselected-text="선택"
		                                    		></sbux-select>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">제목</th>
			                                    <td colspan="8">
			                                        <sbux-input id="dtl-input-newBbsTtl" name="dtl-input-newBbsTtl" uitype="text" required style="width:100%"></sbux-input>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th scope="row">내용</th>
			                                    <td colspan="8">
			                                        <sbux-textarea  rows="10" cols="110"  id="dtl-input-newBbsSbjt" name="dtl-input-newBbsSbjt"  uitype="normal"></sbux-textarea>
			                                    </td>
			                                </tr>
											<tr>
			                                    <th scope="row">첨부파일</th>
			                                    <td colspan="8">
			                                        <div id="drop-area01">
													    <p>첨부파일을 여기에 드래그 해주세요</p>
													    <label for="bbsNewFile" class="custom-file-upload">첨부파일</label>
													    <input type="file" name="newfiles" id="bbsNewFile" multiple style="display: none;" accept=".gif , .jpg , .jpeg , .png , .xls , .xlsx">
													    <input type="file" name="newfilesa" id="bbsNewFileList" multiple style="display: none;">
													    <ul id="bbsNew-file-list"></ul>
													</div>
			                                    </td>
			                                </tr>
			                              </table>
									</div>
		                            </form>
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
	var jsonWarehouse = []; // 그리드의 참조 데이터 주소 선언
	async function fn_bbsJsp() {
		fn_selectWarehouseList();
	}

	function newArticle_clear(){
		SBUxMethod.set("dtl-input-newBbsTtl","");
		SBUxMethod.set("dtl-input-newBbsSbjt","");
	}
	async function fn_ArticleCreate(){
		let bbsSeCd = SBUxMethod.get("dtl-select-newbbsSeCd");
		let bbsTtl = SBUxMethod.get("dtl-input-newBbsTtl");
		let bbsSubject = SBUxMethod.get("dtl-input-newBbsSbjt");
		let apcCd = gv_apcCd;
		if (!SBUxMethod.get("dtl-select-newbbsSeCd")) {
            gfn_comAlert("W0001", "구분코드");
            return;
        }
		if (!SBUxMethod.get("dtl-input-newBbsTtl")) {
            gfn_comAlert("W0002", "제목");
            return;
        }

        if (!SBUxMethod.get("dtl-input-newBbsSbjt")) {
            gfn_comAlert("W0002", "내용");
            return;
        }
		const postJsonPromise = gfn_postJSON("/am/bbs/insertBbs.do", {
			apcCd : apcCd
			, bbsSeCd : bbsSeCd
			, bbsTtl : bbsTtl
			, bbsSbjt : bbsSbjt
		});
		const data = await postJsonPromise;
		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		var files = $('#bbsNewFileList')[0].files;
        		if(files.length > 0){
        			fn_bbsNewFileUpload();
        		}else{
        			newArticle_clear();
        			gfn_closeModal('modal-bbsNewArticlePopup','fn_search');
        		}
        	} else {
        		gfn_comAlert("E0001");
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	/**************첨부 파일********************/

	//첨부파일 업로드
    function fn_bbsNewFileUpload() {
    	console.log("===========fn_bbsNewFileUpload");
    	var formData = new FormData();
    	var files = $('#bbsNewFileList')[0].files;

    	if(files.length == 0){return;}

    	for (var i = 0; i < files.length; i++) {
            formData.append('files', files[i]);
        }
    	formData.append('bbsNo', "0");

        $.ajax({
            type: 'POST',
            url: '/am/bbs/fileUpload.do',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                console.log(response);
                newArticle_clear();
        		gfn_closeModal('modal-bbsNewArticlePopup','fn_search');
            },
            error: function (error) {
                console.log('Error:', error);
            }
        });
	}


    window.addEventListener('DOMContentLoaded', function(e) {
    	//첨부파일 드래그 앤 드랍 구현
    	$('#drop-area01').on('dragover', function (e) {
        	console.log("dragover---------");
    	    e.preventDefault();
    	    $('#drop-area01').addClass('highlight');
    	});

    	$('#drop-area01').on('dragleave', function () {
        	console.log("dragleave---------");
        	$('#drop-area01').removeClass('highlight');
    	});

    	//드랍 이벤트
    	$('#drop-area01').on('drop', function (e) {
    		console.log("drop---------");
    	    e.preventDefault();
    	    $('#drop-area01').removeClass('highlight');
    	    var files = e.originalEvent.dataTransfer.files;
    	    bbsNewShowFiles(files);
    	});
    	//input 변경이벤트
    	$('#bbsNewFile').on('change', function (e) {
    		console.log("change---------");
    	    var files = $(this)[0].files;
    	    bbsNewShowFiles(files);
    	});
    });


 // 허용하려는 확장자들
    const allowedExtensionsBbsNewArticle = ['.gif' , '.jpg' , '.jpeg' , '.png' , '.xls' , '.xlsx' , '.zip' , '.pdf'];

	function bbsNewShowFiles(newfiles) {
		console.log("=====bbsNewShowFiles");
		var newFileList = new DataTransfer();
		var fileList = $('#bbsNewFileList')[0].files;
		//기존파일
		for (var i = 0; i < fileList.length; i++) {
			newFileList.items.add(fileList[i]);
		}
		if(newfiles != null){
			//새로운 파일
			for (var i = 0; i < newfiles.length; i++) {
				var newfileName = newfiles[i].name;
				var fileExtension = '.' + newfileName.split('.').pop();

				if (allowedExtensionsBbsNewArticle.indexOf(fileExtension.toLowerCase()) === -1) {
			    	gfn_comAlert('W0001', '올바른 확장자');
			    	newfiles = null; // 파일 선택 취소
			    	return false;
			    }

				newFileList.items.add(newfiles[i]);
			}
		}

		$('#bbsNewFileList')[0].files = newFileList.files;

	    var ulList = $('#bbsNew-file-list');
	    //리스트 초기화
	    ulList.empty();
	    //파일 목록
		var realFileList = $('#bbsNewFileList')[0].files;
	    for (var i = 0; i < realFileList.length; i++) {
	    	var fileName = realFileList[i].name;
	        var fileItem = $('<li class="file-item">' +
	                '<span class="file-name">' + fileName + '</span>' +
	                '<span class="remove-file" onclick="bbsNewRemoveFile(' + i + ')">삭제</span>' +
	                '</li>');
	        ulList.append(fileItem);
	    }
	    console.log($('#bbsNewFile')[0].files);
	    $('#bbsNewFile').val("");
	}

 	// 파일 리스트에서 파일을 제거하는 함수
    function bbsNewRemoveFile(index) {
    	console.log("==============bbsNewRemoveFile==============");

 		var fileList = $('#bbsNewFileList')[0].files;
    	console.log(fileList);
        var fileListContainer = $('#bbsNew-file-list');

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
        $('#bbsNewFileList')[0].files = newFileList.files;
        console.log($('#bbsNewFileList')[0].files);
        bbsNewShowFiles(null);
    }




</script>

	<!-- 첨부파일 스타일 추가 -->
	<style>
        #drop-area01 {
            border: 2px dashed #ccc;
            padding: 20px;
            width: 100%;
            text-align: center;
            cursor: pointer;
        }

        #bbsNew-file-list {
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