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
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="제출" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
							<th scope="row" class="th_bg text-center">사업자계획서</th>
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
							<th scope="row" class="th_bg text-center">서명서</th>
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
								<input type="file" id="newSgntrFile">
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
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let now = new Date();
		let year = now.getFullYear();
		//SBUxMethod.set("srch-input-yr",year);//

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


</script>
</html>