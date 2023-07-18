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
				<h3 class="box-title"> ▶ 재고이송조회</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
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
						<col style="width: 6%">
						<col style="width: 19%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 7%">
						<col style="width: 17%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">APC명</th>
							<th class="ta_r">
								<input type="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled>
							</th>
							<th class="ta_r">이송일자</th>
							<th class="td_input">
									<div class="dp_inline wd_125 va_m">
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" name="datepicker" placeholder="시작일" class="form-control pull-right" disabled>
										</div>
									</div>
									~
									<div class="dp_inline wd_125 va_m">
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" name="datepicker" placeholder="종료일" class="form-control pull-right" disabled>
										</div>
									</div>
							</th>
							<th class="ta_r">이송APC</th>
							<th class="ta_r">
								<select class="form-control">
									<option></option>
								</select>
							</th>

							<th></th>
						</tr>
						<tr>
							<th class="ta_r">품목/품종</th>
							<th class="td_input">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_125 va_m">
										<select class="form-control"  style="width: 90%;">
											<option>선택</option>
										</select>
									</div>
									<select class="form-control"  style="width: 100%;">
										<option>선택</option>
									</select>
								</div>
							</th>
							<th class="ta_r">규격</th>
							<th class="td_input">
								<select class="form-control"  style="width: 70%;">
									<option>선택</option>
								</select>
							</th>
							<th class="ta_r">창고구분</th>
							<th class="ta_r">
								<select class="form-control"  style="width: 60%;">
									<option>선택</option>
								</select>
							</th>
							<th></th>
							<tr>
								<th class="ta_r">상품구분</th>
								<th class="td_input">
									<select class="form-control">
										<option></option>
									</select>
								</th>
								<th class="ta_r">입고구분</th>
								<th class="td_input">
									<select class="form-control" style="width: 60%;">
										<option></option>
									</select>
								</th>
								<th colspan="3"></th>
							</tr>

						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>이송 내역</span></li>
						<li><label> 매출 중량/ 금액: 99,999Kg/99,999₩</label></li>
					</ul>
				</div>

					<table class="table table-bordered table-hover tbl_col tbl_fixed" style="width: 98%;">
						<colgroup>
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">

						</colgroup>
						<thead>
							<tr>
								<th scope="row" rowspan="2">
									이송APC
								</th>
								<th scope="row" rowspan="2">
									입고번호
								</th>
								<th scope="row" rowspan="2">
									선별번호등급
								</th>
								<th scope="row" rowspan="2">
									포장번호순번
								</th>
								<th scope="row" rowspan="2">
									입고일자
								</th>
								<th scope="row" rowspan="2">
									생산자
								</th>
								<th scope="row" rowspan="2">
									품종
								</th>
								<th scope="row" rowspan="2">
									상품구분
								</th>
								<th scope="row" rowspan="2">
									입고구분
								</th>
								<th scope="row"  rowspan="2">
									운송구분
								</th>
								<th scope="row"  rowspan="2">
									현물창고
								</th>
								<th scope="row"  rowspan="2">
									이송창고
								</th>
								<th scope="row" colspan="2">
									이송
								</th>
								<th scope="row"  rowspan="2">
									금액
								</th>
								<th scope="row"  rowspan="2">
									운반비
								</th>
							</tr>
							<tr>
								<th>수량</th>
								<th>중량</th>
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
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--[pp] //검색결과 -->
			</div>
	</section>
</body>
</html>