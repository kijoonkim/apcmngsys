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
				<h3 class="box-title"> ▶ 원물입고계획 등록</h3>
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
						<col style="width: 5%">
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 25%">
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
							<th class="ta_r">기준일자</th>
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
							<th class="ta_r">생산자</th>
							<th class="ta_r">
								<p class="dp_inline ad_search_row search_sm ad_search_row wd_p100">
									<input type="text" class="form-control input-sm" placeholder="" disabled>
									<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
								</p>
							</th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<b>&nbsp;<b>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 25%">
						<col style="width: 5%">
						<col style="width: 13%">
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 9%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">계획일자</th>
							<th class="ta_r">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_125 va_m">
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right" disabled>
										</div>
									</div>
									시간
									<input type="text" class="form-control input-sm" placeholder="12:00" style="width: 30%;" disabled>
								</div>
							</th>
							<th class="ta_r">품목</th>
							<th class="td_input">
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th class="ta_r">생산자/품종</th>
							<th class="ta_r">
								<div class="fl_group fl_rpgroup">
									<p class="dp_inline ad_search_row search_sm ad_search_row wd_p100">
										<select class="form-control">
											<option>단일선택</option>
										</select>
										<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
									</p>
								</div>
							</th>
							<th>
								<select class="form-control">
									<option>단일선택</option>
								</select>
							</th>
							<th></th>
						</tr>
						<tr>
							<th>입고구분</th>
							<th>
								<div class="fl_group fl_rpgroup">
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">일반매입</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">공선</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">매취</label>
									</p>
								</div>
							</th>
							<th>상품구분</th>
							<th>
								<div class="fl_group fl_rpgroup">
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all" checked>
										<label class="check_label" for="check_all">일반</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">GAP</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">무농약</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">유기농</label>
									</p>
								</div>
							</th>
							<th>운송</th>
							<th>
								<div class="fl_group fl_rpgroup">
									<p class="ad_input_col">
										<input type="checkbox" class="check" id="check_all" checked>
										<label class="check_label" for="check_all">자가</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">용역</label>
									</p>
									<p class="ad_input_row">
										<input type="checkbox" class="check" id="check_all">
										<label class="check_label" for="check_all">기타</label>
									</p>
								</div>
							</th>
							<th colspan="2"></th>
						</tr>
						<tr>
							<th>수량/중량</th>
							<th>
								<div class="fl_group fl_rpgroup">
									<input type="text" class="form-control input-sm" placeholder="" style="width: 30%;" disabled>
									&nbsp;
									<input type="text" class="form-control input-sm" placeholder="" style="width: 30%;">
									&nbsp; Kg
								</div>
							</th>
							<th>비고</th>
							<th colspan="3">
								<input type="text" class="form-control input-sm" placeholder="">
							</th>
							<th colspan="2">&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물입고 계획</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">내려받기</button>
						<button type="button" class="btn btn-sm btn-outline-danger">올려받기</button>
					</div>
				</div>

				<b>&nbsp;<b>
					<table class="table table-bordered table-hover tbl_col tbl_fixed" style="width: 98%;">
						<colgroup>
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 10%">
							<col style="width: 8%">
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
									계획일자
								</th>
								<th scope="row">
									계획시간
								</th>
								<th scope="row">
									품목
								</th>
								<th scope="row">
									품종
								</th>
								<th scope="row">
									생산자
								</th>
								<th scope="row">
									상품구분
								</th>
								<th scope="row">
									입고구분
								</th>
								<th scope="row">
									운송구분
								</th>
								<th scope="row" >
									계획수량
								</th>
								<th scope="row" >
									계획중량
								</th>
								<th scope="row" >
									비고
								</th>
								<th scope="row" >
									처리
								</th>
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
								<td>
									<button type="button" class="btn btn-xs btn-outline-danger">삭제</button>
								</td>
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
								<td>
									<button type="button" class="btn btn-xs btn-outline-danger">추가</button>
								</td>
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