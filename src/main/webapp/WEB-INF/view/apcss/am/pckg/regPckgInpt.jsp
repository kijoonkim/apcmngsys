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
				<h3 class="box-title"> ▶ 포장실적등록</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
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
						<col style="width: 12%">
						<col style="width: 8%">
						<col style="width: 10%">
						<col style="width: 9%">
						<col style="width: 9%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 9%">
						<col style="width: 15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC 명</th>
							<th colspan="2">
							<input type="text" class="form-control input-sm" placeholder="" disabled>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
						<tr>
							<th scope="row">선별일자</th>
							<th colspan="2" class="th_input">
								<div class="dp_inline wd_100 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
								~
								<div class="dp_inline wd_100 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.31" class="form-control pull-right input-sm">
									</div>
								</div>
							</th>
							<th scope="row">품목/품종</th>
							<th class="td_input">
								<select class="form-control fl_fixed mg_r5 wd_110">
									<option></option>
								</select>
							</th>
							<th class="td_input">
								<select class="form-control fl_fixed mg_r5 wd_110">
								</select>
							</th>
							<th>&nbsp;</th>
							<th scope="row">규격</th>
							<th class="td_input">
								<select class="form-control fl_fixed mg_r5 wd_110">
									<option></option>
								</select>
							</th>
							<th>&nbsp;</th>
						    <th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>포장대상내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 4%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 4%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">선택</th>
									<th rowspan="2">선별번호/등급</th>
									<th rowspan="2">생산지시번호</th>
									<th rowspan="2">품종</th>
									<th rowspan="2">규격</th>
									<th rowspan="2">대표생산자</th>
									<th colspan="2">선별재고</th>
									<th colspan="2">포장지시</th>
									<th colspan="2">포장투입</th>
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
							<th scope="row" class="td_input">
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1">
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</th>
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
							<th scope="row" class="td_input">
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1">
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</th>
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
					<td>&nbsp;</td>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 9%">
						<col style="width: 14%">
						<col style="width: 8%">
						<col style="width: 13%">
						<col style="width: 8%">
						<col style="width: 4%">
						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">포장일자</th>
					          <th class="td_input">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.01" class="form-control pull-right input-sm">
									</div>
								</div>
							</th>
							<th scope="row">포장기</th>
								<th class="td_input">
								<select class="form-control fl_fixed mg_r5 wd_140">
								<option>선택</option>
								</select>
								</th>
								<th scope="row">출하수량</th>
							<th class="td_input">
								<input type="text" class="form-control input-sm" placeholder="" disabled></th>
							<th class="td_input">
								<input type="text" class="form-control input-sm" placeholder="" disabled><th>Kg</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="table-responsive tbl_scroll_sm">
				<div class="ad_section_top">
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장실적 내역</span></li>
					</ul>
				</div>

					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<caption>검색결과 목록</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 5%">
							<col style="width: 6%">
							<col style="width: 5%">
							<col style="width: 5%">
							<col style="width: 5%">
							<col style="width: 5%">
							<col style="width: 16%">
							<col style="width: 4%">
							<col style="width: 4%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">포장일자</th>
								<th scope="col">포장기</th>
								<th scope="col">규격</th>
								<th scope="col">포장수량</th>
								<th scope="col">포장중량</th>
								<th scope="col">상품등급</th>
								<th scope="col">창고</th>
								<th scope="col">비고</th>
								<th scope="col">라벨</th>
								<th scope="col">처리</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>2023-05-01</td>
									<td>&nbsp;</td>
									<td><select class="form-control input-sm">
									<option></option></select></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><select class="form-control input-sm">
									</select></td>
									<td>
									<select class="form-control input-sm">
									</select>
									</td>
									<td>&nbsp;</td>
									<td><button type="button" class="btn btn-sm btn-outline-primary">발행</button></td>
									<td><button type="button" class="btn btn-sm btn-outline-danger">삭제</button></td>
								</tr>
								<tr>
									<td>2023-05-01</td>
									<td>&nbsp;</td>
									<td><select class="form-control input-sm">
									<option></option></select></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><select class="form-control input-sm">
									<option></option></select></td>
									<td>
									<select class="form-control input-sm">
									<option></option></select>
									</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><button type="button" class="btn btn-sm btn-outline-danger">추가</button></td>
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