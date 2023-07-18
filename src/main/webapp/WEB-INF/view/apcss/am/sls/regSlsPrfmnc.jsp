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
				<h3 class="box-title"> ▶ 정산자료등록</h3>
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
						<col style="width: 6%">
						<col style="width: 19%">
						<col style="width: 5%">
						<col style="width: 17%">
						<col style="width: 7%">
						<col style="width: 25%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">APC명</th>
							<th class="ta_r">
								<input type="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled>
							</th>
							<th class="ta_r">정산기준</th>
							<th class="ta_r">
								<select class="form-control">
									<option>선택</option>
								</select>
							</th>
							<th class="ta_r">정산일자</th>
							<th class="td_input">
								<div class="form-group">
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
								</div>
							</th>

							<th></th>
						</tr>
						<tr>
							<th class="ta_r">확정여부</th>
							<th class="td_input">
								<select class="form-control" style="width: 50%;">
									<option>선택</option>
								</select>
							</th>
							<th class="ta_r">품종</th>
							<th class="td_input">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_125 va_m">
										<select class="form-control"  style="width: 100%;">
											<option>멀티선택</option>
										</select>
									</div>
									<button type="button" class="btn btn-sm btn-primary">찾기</button>
								</div>
							</th>
							<th class="ta_r">생산자</th>
							<th class="td_input">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_125 va_m">
										<select class="form-control"  style="width: 100%;">
											<option></option>
										</select>
									</div>
									<button type="button" class="btn btn-sm btn-primary">찾기</button>
								</div>
							</th>
							<th></th>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>정산 내역</span></li>
						<li><span> 정산 중량/ 금액: 99,999Kg/99,999₩</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<div class="dp_inline wd_125 va_m">
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" name="datepicker" placeholder="2023-06" class="form-control pull-right" disabled>
							</div>
						</div>
						<button type="button" class="btn btn-sm btn-primary btn_form btn_search">정산자료생성</button>
					</div>
				</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<colgroup>
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 2%">
							<col style="width: 2%">
							<col style="width: 2%">
							<col style="width: 2%">
							<col style="width: 2%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row" rowspan="2">
									선택
								</th>
								<th scope="row" rowspan="2">
									정산일자
								</th>
								<th scope="row" rowspan="2">
									생산자
								</th>
								<th scope="row" rowspan="2">
									입고구분
								</th>
								<th scope="row" rowspan="2">
									상품구분
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
								<th scope="row" rowspan="2">
									브랜드
								</th>
								<th scope="row" colspan="5">
									등급
								</th>
								<th scope="row"  rowspan="2">
									수량
								</th>
								<th scope="row"  rowspan="2">
									중량
								</th>
								<th scope="row"  rowspan="2">
									계산금액
								</th>
								<th scope="row" rowspan="2">
									확정금액
								</th>
								<th scope="row" rowspan="2">
									확정여부
								</th>

							</tr>
							<tr>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
								<th>5</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_input">
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
								<td class="td_input">
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
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="td_input">
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
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="td_input">
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
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th colspan="14">합계</th>
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