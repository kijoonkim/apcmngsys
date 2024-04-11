<%
 /**
  * @Class Name : apcEvmntStng.jsp
  * @Description : APC환경설정 화면
  * @author SI개발부
  * @since 2023.05.30
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.05.30   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : APC환경설정</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false;">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ Ex) Component</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 13%">
						<col style="width: 4%">
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg" rowspan="5">APC정보</th>
							<td scope="row" align="right">코드</td>
							<td scope="row" style="border-right: hidden;">
								<sbux-input id="inp-apcCd" name="inp-apcCd" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">구분</td>
							<td class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd1" name="rdo-apcSeCd" uitype="normal" value="1" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">농협</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd2" name="rdo-apcSeCd" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">법인</label>
								</p>
							</td>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>