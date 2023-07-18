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

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section class="content container-fluid">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title"> ▶ 원물입고 팔레트/박스 관리</h3>
							<div class="ad_tbl_top">
								<div class="ad_tbl_toplist">
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
									<col style="width: 5%">
									<col style="width: 10%">
									<col style="width: 5%">
									<col style="width: 25%">
									<col style="width: 7%">
									<col style="width: 7%">
									<col style="width: 21%">
								</colgroup>
								<tbody>
									<tr>
										<th class="ta_r">APC명</th>
										<th class="ta_r">
											<input type="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled>
										</th>
										<th class="ta_r">기준일자</th>
										<th class="td_input">
											<div class="form-group">
												<div class="dp_inline wd_125 va_m">
													<div class="input-group date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" name="datepicker" placeholder="시작일" class="form-control pull-right">
													</div>
												</div>
												~
												<div class="dp_inline wd_125 va_m">
													<div class="input-group date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" name="datepicker" placeholder="종료일" class="form-control pull-right">
													</div>
												</div>
											</div>
										</th>
										<th class="ta_r">입/출고 구분</th>
										<th class="ta_r">
											<select class="select2">
												<option selected></option>
											</select>
										</th>
										<th></th>
									</tr>
								</tbody>
							</table>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>팔레트/박스 재고현황</span></li>
								</ul>
							</div>
							<b>&nbsp;<b>
								<table class="table table-bordered table-hover tbl_col tbl_fixed" style="width: 98%;">
									<colgroup>
										<col style="width: 12%">
										<col style="width: 25%">
										<col style="width: 12%">
										<col style="width: 6%">
										<col style="width: 6%">
										<col style="width: 6%">
										<col style="width: 6%">
										<col style="width: 6%">
										<col style="width: 6%">
										<col style="width: 6%">
										<col style="width: 6%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" rowspan="2">
												구분
											</th>
											<th scope="row" rowspan="2">
												명칭
											</th>
											<th scope="row" rowspan="2">
												단중
											</th>
											<th scope="row" colspan="2">
												전일재고
											</th>
											<th scope="row" colspan="2">
												입고
											</th>
											<th scope="row" colspan="2">
												출고
											</th>
											<th scope="row" colspan="2">
												현재고
											</th>
										</tr>
										<tr>
											<th scope="col">수량</th>
											<th scope="col">중량</th>
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
											<td>팔레트/박스</td>
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
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>입출 내역</span></li>
								</ul>
							</div>
							<b>&nbsp;<b>
								<table class="table table-bordered table-hover tbl_col tbl_fixed" style="width: 98%;">
									<colgroup>
										<col style="width: 3%">
										<col style="width: 8%">
										<col style="width: 10%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row">
												선택
											</th>
											<th scope="row">
												작업일자
											</th>
											<th scope="row">
												입출고구분
											</th>
											<th scope="row">
												구분
											</th>
											<th scope="row">
												명칭
											</th>
											<th scope="row">
												단중
											</th>
											<th scope="row">
												생산자
											</th>
											<th scope="row">
												수량
											</th>
											<th scope="row">
												중량
											</th>
											<th scope="row">
												비고
											</th>
											<th scope="row">
												처리
											</th>
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
											<td>
												<select class="select2">
													<option selected>입고/출고</option>
												</select>
											</td>
											<td>
												<select class="select2">
													<option selected>팔레트/박스</option>
												</select>
											</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>&nbsp;</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												<button type="button" class="btn btn-xs btn-outline-danger">삭제</button>
											</td>
										</tr>
										<tr>
											<td>
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check_all">
													<label class="check_label" for="check_all"></label>
												</p>
											</td>
											<td>&nbsp;</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>&nbsp;</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												<button type="button" class="btn btn-xs btn-outline-danger">추가</button>
											</td>
										</tr>
										<tr>
											<td>
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check_all">
													<label class="check_label" for="check_all"></label>
												</p>
											</td>
											<td>&nbsp;</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
											<td>&nbsp;</td>
											<td>
												<select class="select2">
													<option selected></option>
												</select>
											</td>
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