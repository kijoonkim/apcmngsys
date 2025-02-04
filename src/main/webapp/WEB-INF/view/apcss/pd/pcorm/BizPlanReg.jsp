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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 사업계획서 등록 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSubmit" name="btnSubmit" uitype="normal" text="제출" class="btn btn-sm btn-outline-danger" onclick="fn_upload"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>사용자 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶제출서류 리스트</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>제출 서류 리스트</caption>
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 10%">
						<col style="width: auto">
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center">제출서류</th>
							<th scope="row" class="th_bg text-center">기제출서류</th>
							<th scope="row" class="th_bg text-center">승인여부</th>
							<th scope="row" class="th_bg text-center">신규(변경)제출서류</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg text-center">
								사업자계획서/전환서(pdf/hwp/hwpx)
							</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-bizPlanFileName"
									name="dtl-input-bizPlanFileName"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-bizPlanAprvYn"
									name="dtl-input-bizPlanAprvYn"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<input type="file" id="newBizPlanFile">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg text-center">
								서명포함 스캔본(pdf)
							</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-sgntrFileName"
									name="dtl-input-sgntrFileName"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-sgntrAprvYn"
									name="dtl-input-sgntrAprvYn"
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<input type="file" id="newSgntrFile" accept=".pdf">
								<!--
								<sbux-button
									id="btnSgntrFileUpload"
									name="btnSgntrFileUpload"
									uitype="normal"
									text="파일선택"
									class="btn btn-sm btn-outline-danger"
									onclick="fn_fileUpload(2)"
								></sbux-button>
								 -->
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:20px">▶시스템 이용 설문조사</span>
							<p id="srvyCn">※2023년 실적입력을 위한 시스템 사용시 불편했던 점이나 개선헀으면 하는 사항을 작성해주세요.</p>
						</li>
					</ul>
				</div>
				<br>
				<div>
					<sbux-textarea
						id="dtl-input-rspnsCn"
						name="dtl-input-rspnsCn"
						uitype="normal"
						style="width: 100%; height: 100px;"
						auto-resize="true"
					></sbux-textarea>
				</div>
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {

		fn_init();

		/**
		 * 엔터시 검색 이벤트
		 */
		const elements = document.querySelectorAll(".srch-keyup-area");

		for (let i = 0; i < elements.length; i++) {
			const el = elements.item(i);
			el.addEventListener("keyup", (event) => {
				if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
					fn_search();
				}
				//key	Enter
				//keyCode
			});
		}
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅
		await fn_dtlSearch();
	}

	/* 기본 년도값 세팅 */
	const fn_setYear = async function() {
		let cdId = "SET_YEAR";
		//SET_YEAR 공통코드의 1첫번쨰 순서의 값 불러오기
		let postJsonPromise = gfn_postJSON("/pd/bsm/selectSetYear.do", {
			cdId : cdId
		});
		let data = await postJsonPromise;
		//현재 년도(세팅값이 없는경우 현재년도로)
		let now = new Date();
		let year = now.getFullYear();
		try{
			if(!gfn_isEmpty(data.setYear)){
				year = data.setYear;
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		//기본년도 세팅
		//SBUxMethod.set("srch-input-yr",year);
		SBUxMethod.set("dtl-input-yr",year);
	}


	/* Grid Row 조회 기능*/
	const fn_dtlSearch = async function(){

		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let year = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectBizPlanRegList.do", {
			brno : brno
			,yr : year
		});
		let data = await postJsonPromise;
		try{
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))
			})
			fn_fileListSearch();
			fn_srvySearch();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 파일 리스트 조회 기능*/
	const fn_fileListSearch = async function(){

		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let year = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectBizPlanRegFileList.do", {
			brno : brno
			,yr : year
		});
		let data = await postJsonPromise;
		try{
			//bizPlan 사업계획서
			//sgntr 서명서
			data.resultList.forEach((item, index) => {
				if(item.dcmntKnd == 'BP'){
					SBUxMethod.set('dtl-input-bizPlanFileName',gfn_nvl(item.orgFileNm));
					SBUxMethod.set('dtl-input-bizPlanAprvYn',gfn_nvl(item.sttsNm));
				}else if (item.dcmntKnd == 'S') {
					SBUxMethod.set('dtl-input-sgntrFileName',gfn_nvl(item.orgFileNm));
					SBUxMethod.set('dtl-input-sgntrAprvYn',gfn_nvl(item.sttsNm));
				}
			})
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 설문조사 조회 기능*/
	const fn_srvySearch = async function(){

		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let year = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectSrvy.do", {
			yr : year
		});
		let data = await postJsonPromise;
		try{
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-rspnsCn',gfn_nvl(item.rspnsCn));
			})
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}



	//첨부파일 업로드
	function fn_upload() {
		//console.log("===========fn_fileUpload");

		let brno = '${loginVO.brno}';
		//if(gfn_isEmpty(brno)) return;

		let rspnsCn = SBUxMethod.get('dtl-input-rspnsCn');
		let srvyCn = $("#srvyCn").text();

		if(gfn_isEmpty(rspnsCn)){
			alert('설문조사를 작성해주세요.');
			return;
		};

		var formData = new FormData();

		const bizPlanFile = $('#newBizPlanFile')[0].files;

		const sgntrFile = $('#newSgntrFile')[0].files;

		let bizPlanAprvYn = SBUxMethod.get('dtl-input-bizPlanAprvYn');
		let sgntrAprvYn = SBUxMethod.get('dtl-input-sgntrAprvYn');

		//새로운파일이 둘다 없으면
		if(bizPlanFile.length == 0 && sgntrFile.length == 0){
			alert('파일을 올려주세요.');
			return;
		}
		if (gfn_isEmpty(bizPlanAprvYn)){
			//승인값이 없는데 파일이 없으면
			if(bizPlanFile.length == 0){
				alert('사업계획서/전환서 파일을 올려주세요.');
				return;
			}
		}
		if (gfn_isEmpty(sgntrAprvYn)){
			//승인값이 없는데 파일이 없으면
			if(sgntrFile.length == 0){
				alert('서명포함 스캔본 파일을 올려주세요.');
				return;
			}
		}

		// 허용하려는 확장자들
		//사업계획서 및 전환서
		const allowedExtensions1 = ['pdf' , 'hwp' , 'hwpx'];
		//서명포함 스캔본
		const allowedExtensions2 = ['pdf'];

		if(bizPlanFile.length > 0){
			for (var i = 0; i < bizPlanFile.length; i++) {
				const extension = bizPlanFile[i].name.split('.').pop().toLowerCase();
				if (allowedExtensions1.includes(extension)) {
					formData.append('bizPlanFiles', bizPlanFile[i]);
				} else {
					alert('사업계획서/전환서 는 hwp/hwpx/pdf 확장자만 허용됩니다.');
					return;
				}
			}
		}

		if(sgntrFile.length > 0){
			for (var i = 0; i < sgntrFile.length; i++) {
				const extension = sgntrFile[i].name.split('.').pop().toLowerCase();
				if (allowedExtensions2.includes(extension)) {
					formData.append('sgntrFiles', sgntrFile[i]);
				} else {
					alert('서명서는 pdf 확장자만 허용됩니다.');
					return;
				}
			}
		}

		formData.append('brno', brno);
		formData.append('srvyCn', srvyCn);
		formData.append('rspnsCn', rspnsCn);

		$.ajax({
			type: 'POST',
			url: '/pd/pcorm/fileUpload.do',
			data: formData,
			processData: false,
			contentType: false,
			success: function (response) {
				//console.log(response);
				alert("처리 되었습니다.");
				fn_dtlSearch();
			},
			error: function (error) {
				 //console.log('Error:', error);
			}
		});
	}

	//첨부파일 삭제
	const deleteFile = async function (fileSn){

		const postJsonPromise = gfn_postJSON("/pd/pcorm/deleteFile.do", {
			fileSn : fileSn
		});

		 const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("삭제 되었습니다.");
				//fn_dtlSearch();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//파일다운로드
	const downloadFile = async function (fileSn){
		var url = "/pd/pcorm/download/"+fileSn;
		window.open(url);
	}
</script>
</html>