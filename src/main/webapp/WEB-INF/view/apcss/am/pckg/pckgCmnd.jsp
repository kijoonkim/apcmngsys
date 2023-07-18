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
				<h3 class="box-title"> ▶ 포장지시조회</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-primary">포장지시서</button>
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
					    	<td colspan="2" class="td_input" style="border-right:hidden ;">
					    		<input type= "text" class= "form-control input-sm" placeholder="" disabled="" >
							</td>
							<th scope="row" style="border-right:hidden ;">지시일자</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
								~
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-31" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
	                	</tr>
						<tr>
							<th scope="row">생산설비</th>
							<td class="td_input" style="border-right:hidden ;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							<td style="border-right:hidden ;">&nbsp;</td>
							<th scope="row">거래처</th>
						    <td class="td_input" style="border-right:hidden ;">
								<input type="text" class="form-control input-sm">
							<td class="td_input" style="border-right:hidden ;">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<th scope="row">납기일자</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">품목/품종</th>
						    <td class="td_input" style="border-right:hidden ;">
								<select class="form-control input-sm">
									<option></option>
								</select>
						    <td class="td_input" style="border-right:hidden ;">
								<select class="form-control input-sm" disabled>
									<option></option>
								</select>
							</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<select class="form-control input-sm" disabled>
									<option></option>
								</select>
							<td style="border-right:hidden ;">&nbsp;</td>
						    <th scope="row">발주번호</th>
							<td class="td_input" style="border-right:hidden ;">
								<input type="text" class="form-control input-sm">
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>지시 내역</span></li>
						<li><span>지시수량/중량 : 99 / 99,999 Kg</span></li>
						</ul>
					</div>
						<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>

								<col style="width: 3%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">순번</th>
									<th rowspan="2">지시번호</th>
									<th rowspan="2">생산설비</th>
									<th rowspan="2">거래처</th>
									<th rowspan="2">품종</th>
									<th rowspan="2">규격</th>
									<th rowspan="2">납기일자</th>
									<th rowspan="2">상품명</th>
									<th colspan="2">발주</th>
									<th colspan="2">지시</th>
									<th colspan="2">실적</th>
								</tr>
								<tr>
									<th scope="col">수량</th>
									<th scope="col">중량</th>
									<th scope="col">수량</th>
									<th scope="col">중량</th>
									<th scope="col">수량</th>
									<th scope="col">중량</th>
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
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>