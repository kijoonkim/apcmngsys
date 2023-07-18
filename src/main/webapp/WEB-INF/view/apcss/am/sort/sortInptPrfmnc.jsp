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
				<h3 class="box-title">▶ 선별실적조회</h3>
					<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-success">선별확인서</button>
						<button type="button" class="btn btn-sm btn-outline-dark">조회</button>
						<button type="button" class="btn btn-sm btn-outline-dark">종료</button>
					</div>
			</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 8%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 8%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">APC명</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
					    	<div class="form-group">
								<input type="text" class="form-control" placeholder="" disabled="">
							</div>
						</td>
					</tr>
						<tr>
							<th scope="row">선별일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="시작일" class="form-control pull-right input-sm">
									</div>
								</div>
								~
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="종료일" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<th scope="row">품목</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option></option>
								</select>
							<td class="td_input" style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<th scope="row">품종</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>멀티선택</option>
									<td class="td_input" style="border-right: hidden;">
										<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
									</td>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">선별기</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">대표생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<td class="td_input" style="border-right: hidden;">
										<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<td>&nbsp;</td>
							<li><span>선별 내역</span></li>
							<td>&nbsp;</td>
						<li><span>선별수량/중량 : 99/99,999 Kg</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 7%">
								<col style="width: 7%">
								<col style="width: 7%">
								<col style="width: 7%">
								<col style="width: 7%">
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
									<th rowspan="2">선별일자</th>
									<th rowspan="2">설비명</th>
									<th rowspan="2">입고구분</th>
									<th rowspan="2">상품구분</th>
									<th rowspan="2">운송구분</th>
									<th rowspan="2">품종</th>
									<th rowspan="2">규격</th>
									<th colspan="2">투입</th>
									<th rowspan="2">등급</th>
									<th colspan="2">선별</th>
									<th rowspan="2">LOSS</th>
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
								</tr>
							</tbody>
						</table>
									<td>&nbsp;</td>
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 30%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">대표생산자</th>
									<th scope="col">투입창고</th>
									<th scope="col">저장창고</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<tr>
									</th>
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
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>