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
				<h3 class="box-title"> ▶ 입고실적조회</h3>
					<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">초기화</button>
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
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 8%">
						<col style="width: 8%">
						<col style="width: 4%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan= "2" class="td_input">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
						</tr>
							<tr>
							<th scope="row">생산일자</th>
							<td colspan= "2" class="td_input">
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
							<th scope="row">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>단일선택</option>
								</select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="멀티선택" title="">
							</td>
							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="멀티선택" title="">
							</td>
							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
						</tr>
						<tr>
							<th scope="row">입고구분</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default" checked>
									<label class="check_label" for="check_default">일반매입</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">공선</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">매취</label>
								</p>
							</td>
							<th scope="row">상품</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default" checked>
									<label class="check_label" for="check_default">일반</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">GAP</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">무농약</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">유기농</label>
								</p>
							</td>
					    	<th scope="row">운송</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
								<input type="checkbox" class="check" id="check_default" checked>
									<label class="check_label" for="check_default">자가</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">용역</label>
								</p>
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">기타</label>
								</p>
							</td>
						</tr>
						<tr>
						    <th scope="row">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="선택" title="">
							</td>
							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">계량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="선택" title="">
							</td>
							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
						<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　원물입고 내역</span></li>
							<li><span>　　　중량합계 : 99.999Kg</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 6%">
								<col style="width: 3%">
								<col style="width: 4%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 5%">
								<col style="width: 2%">
								<col style="width: 2%">
								<col style="width: 2%">
								<col style="width: 2%">
								<col style="width: 2%">
								<col style="width: 6%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">입고일자</th>
									<th scope="col">순번</th>
									<th scope="col">생산자</th>
									<th scope="col">품목</th>
									<th scope="col">품종</th>
									<th scope="col">입고구분</th>
									<th scope="col">운송구분</th>
									<th scope="col">상품구분</th>
									<th scope="col">차량번호</th>
									<th scope="col">운송료</th>
									<th colspan="5">입고등급</th>
									<th scope="col">입고중량</th>
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
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 45%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">보관창고</th>
									<th scope="col">계량번호</th>
									<th scope="col">팔레트번호</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
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
								</tr>
								<tr>
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