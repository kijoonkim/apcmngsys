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
				<h3 class="box-title"> ▶ 재고이송등록</h3>
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
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 9%">
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 17%">
						<col style="width: 11%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">APC명</th>
							<th class="ta_r">
								<input type="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled>
							</th>
							<th colspan="5">
								&nbsp;
							</th>
						</tr>
						<tr>
							<th class="ta_r">품목/품종</th>
							<th class="td_input">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_125 va_m">
										<select class="form-control"  style="width: 100%;">
											<option>선택</option>
										</select>
									</div>
									<select class="form-control"  style="width: 90%;">
										<option>선택</option>
									</select>
								</div>
							</th>
							<th class="ta_r">규격</th>
							<th class="ta_r">
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th class="ta_r">창고구분</th>
							<th class="ta_r">
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th></th>
						</tr>
						<tr>
							<th>생산자</th>
							<th class="td_input">
								<p class="dp_inline ad_search_row search_sm ad_search_row wd_p100">
									<input type="text" class="form-control input-sm" placeholder="" title="입력하세요." disabled>
									<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
								</p>										</th>
							<th class="ta_r">상품구분</th>
							<th class="ta_r">
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th class="ta_r">입고구분</th>
							<th>
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th>&nbsp;</th>
						</tr>

					</tbody>
				</table>
				<div>
					<table class="table table-bordered tbl_row tbl_fixed" style="border: hidden;">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 18%">
							<col style="width: 18%">
							<col style="width: 18%">
							<col style="width: 18%">
							<col style="width: 8%">
							<col style="width: 15%">
						</colgroup>
						<tbody style="border: hidden;">
							<tr>
								<td style="border: hidden;">
									<button type="button" class="btn btn-lg btn-outline-danger">원물재고 내역</button>
								</td>
								<td style="border: hidden;">
									<button type="button" class="btn btn-lg btn-outline-danger">선별재고 내역</button>
								</td>
								<td style="border: hidden;">
									<button type="button" class="btn btn-lg btn-outline-danger">상품재고 내역</button>
								</td>
								<td style="border: hidden;"></td>
								<td class="ta_r">이송 APC</td>
								<td class="ta_l" style="border: hidden;">
									<select class="form-control">
										<option></option>
									</select>
								</td>
							</tr>
						</tbody>
						</table>
						<table class="table table-bordered table-hover tbl_col tbl_fixed" >
							<colgroup>
								<col style="width: 5%">
								<col style="width: 20%">
								<col style="width: 10%">
								<col style="width: 12%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 5%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 5%">
								<col style="width: 6%">
								<col style="width: 6%">
							</colgroup>
							<thead>
								<tr>
									<th scope="row" rowspan="2">
										선택
									</th>
									<th scope="row" rowspan="2">
										입고번호
									</th>
									<th scope="row" rowspan="2">
										팔레트번호
									</th>
									<th scope="row" rowspan="2">
										입고일자
									</th>
									<th scope="row" rowspan="2">
										생산자
									</th>
									<th scope="row" rowspan="2">
										품목
									</th>
									<th scope="row" rowspan="2">
										품종
									</th>
									<th scope="row" rowspan="2">
										상품
									</th>
									<th scope="row" rowspan="2">
										입고
									</th>
									<th scope="row"  rowspan="2">
										운송
									</th>
									<th scope="row"  rowspan="2">
										현물창고
									</th>
									<th scope="row"  colspan="2">
										재고
									</th>
									<th scope="row"  rowspan="2">
										이송창고
									</th>
									<th scope="row"  colspan="2">
										이송
									</th>
								</tr>
								<tr>
									<th>수량</th>
									<th>중량</th>
									<th>수량</th>
									<th>중량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check_all">
											<label class="check_label" for="check_all"></label>
										</p>
									</td>
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
									<td>
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check_all">
											<label class="check_label" for="check_all"></label>
										</p>
									</td>
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
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>&nbsp;</span></li>
								</ul>
							</div>
							<table class="table table-bordered table-hover tbl_col tbl_fixed" >
								<colgroup>
									<col style="width: 5%">
									<col style="width: 20%">
									<col style="width: 10%">
									<col style="width: 12%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 6%">
									<col style="width: 5%">
									<col style="width: 6%">
									<col style="width: 6%">
									<col style="width: 5%">
									<col style="width: 6%">
									<col style="width: 6%">
								</colgroup>
								<thead>
									<tr>
										<th scope="row" rowspan="2">
											선택
										</th>
										<th scope="row" rowspan="2">
											선별번호
										</th>
										<th scope="row" rowspan="2">
											등급
										</th>
										<th scope="row" rowspan="2">
											투입일자
										</th>
										<th scope="row" rowspan="2">
											설비
										</th>
										<th scope="row" rowspan="2">
											생산자
										</th>
										<th scope="row" rowspan="2">
											품목
										</th>
										<th scope="row" rowspan="2">
											품종
										</th>
										<th scope="row" rowspan="2">
											규격
										</th>
										<th scope="row"  rowspan="2">
											현물창고
										</th>
										<th scope="row"  colspan="2">
											재고
										</th>
										<th scope="row"  rowspan="2">
											이송창고
										</th>
										<th scope="row"  colspan="2">
											이송
										</th>
									</tr>
									<tr>
										<th>수량</th>
										<th>중량</th>
										<th>수량</th>
										<th>중량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<p class="ad_input_row">
												<input type="checkbox" class="check" id="check_all">
												<label class="check_label" for="check_all"></label>
											</p>
										</td>
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
										<td>
											<p class="ad_input_row">
												<input type="checkbox" class="check" id="check_all">
												<label class="check_label" for="check_all"></label>
											</p>
										</td>
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
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>&nbsp;</span></li>
								</ul>
							</div>
							<table class="table table-bordered table-hover tbl_col tbl_fixed" >
								<colgroup>
									<col style="width: 5%">
									<col style="width: 20%">
									<col style="width: 10%">
									<col style="width: 12%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 6%">
									<col style="width: 6%">
									<col style="width: 5%">
									<col style="width: 6%">
									<col style="width: 6%">
									<col style="width: 5%">
									<col style="width: 6%">
									<col style="width: 6%">
								</colgroup>
								<thead>
									<tr>
										<th scope="row" rowspan="2">
											선택
										</th>
										<th scope="row" rowspan="2">
											포장번호
										</th>
										<th scope="row" rowspan="2">
											순번
										</th>
										<th scope="row" rowspan="2">
											포장일자
										</th>
										<th scope="row" rowspan="2">
											설비
										</th>
										<th scope="row" rowspan="2">
											생산자
										</th>
										<th scope="row" rowspan="2">
											품목
										</th>
										<th scope="row" rowspan="2">
											품종
										</th>
										<th scope="row" rowspan="2">
											규격
										</th>
										<th scope="row"  rowspan="2">
											등급
										</th>
										<th scope="row"  rowspan="2">
											현물창고
										</th>
										<th scope="row"  colspan="2">
											재고
										</th>
										<th scope="row"  rowspan="2">
											이송창고
										</th>
										<th scope="row"  colspan="2">
											이송
										</th>
									</tr>
									<tr>
										<th>수량</th>
										<th>중량</th>
										<th>수량</th>
										<th>중량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<p class="ad_input_row">
												<input type="checkbox" class="check" id="check_all">
												<label class="check_label" for="check_all"></label>
											</p>
										</td>
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
										<td>
											<p class="ad_input_row">
												<input type="checkbox" class="check" id="check_all">
												<label class="check_label" for="check_all"></label>
											</p>
										</td>
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
				</div>
				<!--[pp] //검색결과 -->
			</div>
	</section>
</body>
</html>