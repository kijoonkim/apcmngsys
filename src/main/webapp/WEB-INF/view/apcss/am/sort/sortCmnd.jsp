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
				<h3 class="box-title"> ▶ 선별지시조회</h3>
			</div>
				<div class="mg_t5 ta_r">
					<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
					<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
					<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
					<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
				</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 9%">
						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">지시일자</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
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
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" style="border-right: hidden;">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<select class="form-control input-sm">
									<option></option>
								</select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
								</select>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">참고</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>단일선택</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
						<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　투입지시 내역</span></li>
							<li><span>　　　지시중량 : 99.999Kg　　　　실적중량 : 99.999Kg</span></li>
						</ul>
					</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<colgroup>
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 4%">
							<col style="width: 9%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 18%">
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2">지시번호</th>
								<th rowspan="2">지시일자</th>
								<th rowspan="2">생산자</th>
								<th rowspan="2">품종</th>
								<th rowspan="2">창고</th>
								<th rowspan="2">팔레트번호</th>
								<th colspan="2">투입지시</th>
								<th colspan="2">투입실적</th>
								<th rowspan="2">비고</th>
							</tr>
							<tr>
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
							</tr>
						</tbody>
					</table>
												</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>