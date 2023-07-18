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
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title"> ▶ 작업자실적등록</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>
			<div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">APC명</th>
							<th class="ta_r">
								<input type="text" class="form-control input-sm" placeholder="" title="입력하세요." disabled>
							</th>

							<!-- <th class="ta_r">작업일자</th> -->
							<th scope="row">작업일자</th>
							<th class="td_input">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
							</th>
							<th scope="row"></th>
							<th scope="row">작업구분</th>
							<th class="td_input">
								<select class="form-control input-sm">
									<option>선별/포장</option>
								</select>
							</th>
							<th scope="row"></th>
						</tr>
					</tbody>
				</table>
				<br>
				<!-- 1번째 그리드-->
				<div>
					<div>
						<ul class="ad_tbl_count">
							<li><span>작업자별 실적 내역</span></li>
						</ul>
						<table class="table table-bordered table-hover tbl_col tbl_fixed" >
							<colgroup>
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 20%">

							</colgroup>
							<thead>
								<tr>
									<th>작업구분</th>
									<th>작업일자</th>
									<th>설비</th>
									<th>규격</th>
									<th>수량</th>
									<th>중량</th>
									<th>작업자수</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<!-- 1번째 그리드-->
				<div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>작업자별 실적 내역</span></li>
						</ul>
					 	<div class="ad_tbl_toplist">
							<button type="button" class="btn btn-sm btn-outline-danger">내려받기</button>
							<button type="button" class="btn btn-sm btn-outline-danger">올리기</button>
						</div>
					</div>
						<table class="table table-bordered table-hover tbl_col tbl_fixed" >
							<colgroup>
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 15%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 20%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th>작업구분</th>
									<th>작업일자</th>
									<th>설비</th>
									<th>작업자명</th>
									<th>시작신간</th>
									<th>종료시간</th>
									<th>작업시간</th>
									<th>비고</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>
										<select class="form-control input-sm">
											<option></option>
										</select>
									</td>
									<td>1200</td>
									<td>1800</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><button type="button" class="btn btn-xs btn-outline-primary">삭제</button></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>
										<select class="form-control input-sm" style="height: 40%;">
											<option></option>
										</select>
									</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><button type="button" class="btn btn-xs btn-outline-primary">추가</button></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>
										<select class="form-control input-sm" style="height: 40%;">
											<option></option>
										</select>
									</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>
										<select class="form-control input-sm" style="height: 40%;">
											<option></option>
										</select>
									</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>