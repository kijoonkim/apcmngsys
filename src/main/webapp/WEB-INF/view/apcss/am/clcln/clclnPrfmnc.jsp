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
				<h3 class="box-title"> ▶ 매출실적조회</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-primary">거래명세표</button>
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
						<col style="width: 8%">
						<col style="width: 25%">
						<col style="width: 5%">
						<col style="width: 25%">
						<col style="width: 5%">
						<col style="width: 25%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">APC명</th>
							<th class="ta_r">
								<input type="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled>
							</th>
							<th colspan="5"></th>
						</tr>
						<tr>

							<th class="ta_r">매출일자</th>
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
							<th class="ta_r">품종</th>
							<th class="td_input">
								<p class="dp_inline ad_search_row search_sm ad_search_row wd_p80">
									<select class="form-control input-sm wd_160">
										<option>선택하세요</option>
									</select>
									<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
								</p>
							</th>
							<th class="ta_r">거래처</th>
							<th class="ta_r">
								<p class="dp_inline ad_search_row search_sm ad_search_row wd_p80">
									<select class="form-control input-sm wd_160">
										<option>선택하세요</option>
									</select>
									<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
								</p>
							</th>
							<th></th>
					</tbody>
				</table>

				<div class="ad_tbl_top">
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>매출 내역</span></li>
						<li><span> 매출 중량/ 금액: 99,999Kg/99,999₩</span></li>
					</ul>
				</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<colgroup>
							<col style="width: 6%">
							<col style="width: 8%">
							<col style="width: 10%">
							<col style="width: 8%">
							<col style="width: 4%">
							<col style="width: 4%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 8%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row" rowspan="2">
									매출일자
								</th>
								<th scope="row" rowspan="2">
									거래처
								</th>
								<th scope="row" rowspan="2">
									상품명
								</th>
								<th scope="row" rowspan="2">
									상품코드
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
								<th scope="row"  rowspan="2">
									단가
								</th>
								<th scope="row" colspan="2">
									출하
								</th>
								<th scope="row"  rowspan="2">
									매출금액
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
								<th colspan="8">합계</th>
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