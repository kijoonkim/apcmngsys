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
				<h3 class="box-title">▶ 선별지시등록</h3>
				    <div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-dark">조회</button>
						<button type="button" class="btn btn-sm btn-outline-dark">등록</button>
						<button type="button" class="btn btn-sm btn-outline-dark">삭제</button>
						<button type="button" class="btn btn-sm btn-outline-dark">종료</button>
					</div>
			</div>
			  </div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
				<colgroup>
						<col style="width: 7%">
						<col style="width: 9%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 5%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">입고일자</th>
							<td colspan="3" class="td_input">
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
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
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
							<td class="td_input" style="border-right: hidden;">
										<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">창고</th>
							<td class="td_input"  style="border-right: hidden;">
								<select class="form-control input-sm"><option>선택</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
						<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　투입대상 내역</span></li>
							<li><span>　　　선택중량 : 99.999Kg</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 3%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 18%">
							</colgroup>
						<thead>
							<tr>
								<th rowspan="2">선택</th>
								<th rowspan="2">입고일자</th>
								<th rowspan="2">팔레트번호</th>
								<th rowspan="2">생산자</th>
								<th rowspan="2">품종</th>
								<th rowspan="2">창고</th>
								<th colspan="2">입고</th>
								<th colspan="2">재고</th>
								<th colspan="2">지시</th>
							    <th rowspan="2">비고</th>
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
									<td>&nbsp;</td>
					<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
				<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 5%">
				</colgroup>
					     <tr>
							<th scope="row">지시일자</th>
							<td colspan= "2" class="td_input">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
								</td>
								<td>&nbsp;</td>
							<th scope="row">투입설비</th>
							<td class="td_input">
								<select class="form-control input-sm">
									<option>선택</option>
							</select>
							</td>
						</tr>
						</tbody>
				</table>
				 <div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　투입지시 내역</span></li>
						<li><span>　　　지시중량 : 99,999 Kg</span></li>
						</ul>
					</div>
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
								<col style="width: 8%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 15%">
							</colgroup>
							<thead>
							<tr>
								<th rowspan="2">선택</th>
								<th rowspan="2">지시번호</th>
								<th rowspan="2">지시일자</th>
								<th rowspan="2">투입설비</th>
								<th rowspan="2">생산자</th>
								<th rowspan="2">품종</th>
								<th rowspan="2">창고</th>
								<th rowspan="2">팔레트번호</th>
								<th colspan="2">지시</th>
							    <th rowspan="2">비고</th>
							</tr>
							<tr>
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
								</tr>
							</tbody>
						</table>
						</div>
			<!--[pp] //검색결과 -->
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>