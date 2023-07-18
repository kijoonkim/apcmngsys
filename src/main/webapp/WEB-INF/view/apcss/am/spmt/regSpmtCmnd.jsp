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
				<h3 class="box-title"> ▶ 출하지시등록</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">초기화</button>
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
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<th scope="row">발주일자</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.01" class="form-control pull-right input-sm">
									</div>
								</div>
								~
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.31" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>

							<th scope="row">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
									</select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<th scope="row">거래처</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							<td class="td_input">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td><button type="button" class="btn btn-sm btn-outline-danger">발주조회</button></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　출하지시대상 내역</span></li>
						<li><span>　　선택수량/중량 : 99/99,999 Kg</span></li>
						</ul>
					</div>
					<div class="ad_tbl_toplist">
					</div>
						<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>

								<col style="width: 5%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">선택</th>
									<th scope="col">거래처</th>
									<th scope="col">상품명</th>
									<th scope="col">배송처</th>
									<th scope="col">납기일자</th>
									<th scope="col">품종</th>
									<th scope="col">규격</th>
									<th scope="col">발주수량</th>
									<th scope="col">출하수량</th>
									<th scope="col">재고수량</th>
									<th scope="col">지시수량</th>
									<th scope="col">지시중량</th>

								</tr>
							</thead>
							<tbody>
							<tr>
								<th scope="row" class="td_input">
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check1">
										<label class="check_label ta_i" for="check1">선택</label>
									</p>
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
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 6%">
						<col style="width: 8%">
						<col style="width: 4%">
						<col style="width: 10%">
						<col style="width: 10%">
					    <col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
					  		<th scope="row">품목/품종/규격</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm" disabled>
									<option></option>
								</select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm" disabled>
									<option></option>
								</select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
						</tr>
						<tr>
						    <th scope="row">지시일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<th scope="row">운송회사</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">지시수량</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" style="border-right: hidden;">지시중량</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							<td style="border-right: hidden;">Kg</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" style="border-right: hidden;">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">비고</th>
							<td colspan="5" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>

					</tbody>
				</table>
			</div>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　출하지시 내역</span></li>
						<li><span>　　출하지시 수량/중량 : 99/99,999 Kg</span></li>
						</ul>
					</div>
					</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<caption>검색결과 목록</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 15%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">지시일자</th>
								<th scope="col">거래처</th>
								<th scope="col">상품명</th>
								<th scope="col">운송회사</th>
								<th scope="col">배송처</th>
								<th scope="col">품종</th>
								<th scope="col">규격</th>
								<th scope="col">수량</th>
								<th scope="col">중량</th>
								<th scope="col">상품등급</th>
								<th scope="col">포장구분</th>
								<th scope="col">비고</th>
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