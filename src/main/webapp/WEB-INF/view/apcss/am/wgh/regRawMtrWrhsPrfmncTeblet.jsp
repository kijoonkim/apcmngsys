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
				<h3 class="box-title">▶ 원물입고등록(테블릿)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
							<button type="button" class="btn btn-sm btn-primary">원물인식표</button>
						<button type="button" class="btn btn-sm btn-outline-danger">초기화</button>
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>
			<div></div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 9%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 10%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC 명</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">생산자 기본값 자동등록</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">생산자</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">조회</button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"> → 초성 검색기능 적용</td>
						</tr>
						<tr>
							<th scope="row">품목 / 품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
								<option>선택</option>
								</select>
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_all">
									<label class="check_label" for="check_all">고정</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"> → 생산자 기본설정 값에 따라 자동으로 설정 or 고정 선택 시 해당품종 유지</td>
						</tr>
						<tr>
							<th scope="row">입고일자</th>
							<td colspan="6"class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"> → 기본 현재일자로 지정</td>
						</tr>
						<tr>
							<th scope="row">입고수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder=""title="">
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="평균"title="">
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_all">
									<label class="check_label" for="check_all">고정</label>
								</p>
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder=""title="">
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;" colspan="2"> → 박스수량과 평균중량 입력 시 KG 자동계산(숫자 키 패드 적용검토)</td>
						</tr>
						<tr>
							<th scope="row">입고구분</th>
							<td colspan="8" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1" checked>
									<label class="radio_label" for="radio1">일반매입</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">공선</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">매취</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"> → 생산자 기본설정 값에 따라 자동으로 설정</td>
						</tr>
						<tr>
							<th scope="row">상품구분</th>
							<td colspan="8" class="td_input"  style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="radio" name="radio_dis" class="radio" id="radio_dis_on" checked>
									<label class="radio_label" for="radio_dis_on">일반</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">GAP</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">무농약</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">유기농</label>
								</p>
								</td>
								<td style="border-right: hidden;">&nbsp;</td>
								<td style="border-right: hidden;">&nbsp;</td>
								<td colspan="2" style="border-right: hidden;"> → 생산자 기본설정 값에 따라 자동으로 설정</td>
						</tr>
						<tr>
							<th scope="row" style="border-right: hidden;">운송구분</th>
							<td colspan="8" style="border-right: hidden;" class="td_input">
								<p class="ad_input_row">
									<input type="radio" name="radio_dis" class="radio" id="radio_dis_on" checked>
									<label class="radio_label" for="radio_dis_on">자가</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">용역</label>
								</p>
								<p class="ad_input_row">
									<input type="radio" name="radio" class="radio" id="radio1">
									<label class="radio_label" for="radio1">기타</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"> → 생산자 기본설정 값에 따라 자동으로 설정</td>
						</tr>
	 					<tr>
						 	<th scope="row">입고등급</th>
						 	<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">입력</button></td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
						</tr>
						<tr>
							<th scope="row">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">고정</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">입고창고</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="checkbox" class="check" id="check_default">
									<label class="check_label" for="check_default">고정</label>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>입고등록 내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table
							class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>

								<col style="width: 5%">
								<col style="width: 3%">
								<col style="width: 4%">
								<col style="width: 3%">
								<col style="width: 5%">
								<col style="width: 4%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 3%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">입고일자</th>
									<th scope="col">순번</th>
									<th scope="col">생산자</th>
									<th scope="col">품종</th>
									<th scope="col">상품구분</th>
									<th scope="col">박스수량</th>
									<th scope="col">중량</th>
									<th scope="col">등급1</th>
									<th scope="col">등급2</th>
									<th scope="col">등급3</th>
									<th scope="col">등급4</th>
									<th scope="col">등급5</th>
									<th scope="col">박스종류</th>
									<th scope="col">입고창고</th>
									<th scope="col">비고</th>
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