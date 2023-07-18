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
				<h3 class="box-title"> ▶ 상품코드조회</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
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
						<col style="width: 5%">
						<col style="width: 15%">
						<col style="width: 9%">
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
							<th colspan="5">
								&nbsp;
							</th>
						</tr>
						<tr>
							<th class="ta_r">상품코드</th>
							<th class="td_input">
								<input type="text" class="form-control input-sm" placeholder="">
							</th>
							<th class="ta_r">품목</th>
							<th class="ta_r">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<select class="form-control">
											<option></option>
										</select>
									</div>
									<button type="button" class="btn btn-sm btn-outline-danger">찾기</button>
								</div>
							</th>
							<th class="ta_r">품종</th>
							<th class="ta_r">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<select class="form-control">
											<option>멀티선택</option>
										</select>
									</div>
									<button type="button" class="btn btn-sm btn-outline-danger">찾기</button>
								</div>
							</th>
							<th></th>
						</tr>
						<tr>
							<th>규격</th>
							<th class="td_input">
								<select class="form-control" style="width: 80%;">
									<option></option>
								</select>
							</th>
							<th class="ta_r">상품등급</th>
							<th class="ta_r">
								<select class="form-control" style="width: 70%;">
									<option></option>
								</select>
							</th>
							<th class="ta_r">브랜드</th>
							<th>
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th>&nbsp;</th>
						</tr>

						<tr>
							<th>산지</th>
							<th>
								<select class="form-control">
									<option></option>
								</select>
							</th>
							<th class="ta_r">포장구분</th>
							<th>
								<select class="form-control" style="width: 70%;">
									<option></option>
								</select>
							</th>
							<th colspan="3"></th>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품코드내역</span></li>
					</ul>
				</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed">
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
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">
									상품코드
								</th>
								<th scope="row">
									상품명
								</th>
								<th scope="row">
									품목
								</th>
								<th scope="row">
									규격
								</th>
								<th scope="row">
									상품등급
								</th>
								<th scope="row">
									브랜드
								</th>
								<th scope="row">
									산지
								</th>
								<th scope="row">
									포장구분
								</th>
								<th scope="row" >
									입수
								</th>
								<th scope="row" >
									중량
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