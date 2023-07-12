<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title"> ▶ 품목/품종 등록 (팝업)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 20%">
							<col style="width: 5%">
							<col style="width: 15%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<input type="text" class="form-control input-sm" placeholder="" disabled>
								</th>
								<th scope="row">품목명</th>
								<th>
									<input type="text" class="form-control input-sm" placeholder="품목명 검색"
										title="">
								</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<b>&nbsp;</b>

				<div class="row">

					<div class="col-sm-4">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 7%">
								<col style="width: 12%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>명칭</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">선택</button>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>



					<div class="col-sm-8">

						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>

								<col style="width: 5%">
								<col style="width: 12%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 6%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>명칭</th>
									<th>품종등록</th>
									<th>등급등록</th>
									<th>규격등록</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>완료</td>
									<td>완료</td>
									<td>&nbsp;</td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">삭제</button>
									</td>
								</tr>
								<tr>
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
								</tr>
							</tbody>
						</table>
					</div>
					</div>
					<b>&nbsp;</b>
				</div>
				<div class="">
					<table class="table table-bordered tbl_row tbl_fixed mg_t10">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 20%">
							<col style="width: 5%">
							<col style="width: 15%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">품목명</th>
								<th>
									<input type="text" class="form-control input-sm" placeholder="" disabled>
								</th>
								<th colspan="3" scope="row"></th>

							</tr>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col-sm-3">
						<b>품종등록</b>

						<table class="table table-bordered tbl_row tbl_fixed mg_t10">
							<colgroup>
								<col style="width: 25%">
								<col style="width: 50%">
								<col style="width: 25%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>명칭</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">삭제</button></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-3">
						<b>&nbsp;</b>
						<table class="table table-bordered tbl_row tbl_fixed mg_t10">
							<colgroup>
								<col style="width: 25%">
								<col style="width: 50%">
								<col style="width: 25%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>명칭</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">삭제</button></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">추가</button></td>
								</tr>
								<tr>
									<td></td>
									<td>&nbsp;</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-3">
						<b>선별등급등록</b>
						<table class="table table-bordered tbl_row tbl_fixed mg_t10">
							<colgroup>
								<col style="width: 25%">
								<col style="width: 50%">
								<col style="width: 25%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>등급명</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">삭제</button>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">추가</button>
								</tr>
								<tr>
									<td></td>
									<td>&nbsp;</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-3">
						<b>규격등록</b>
						<table class="table table-bordered tbl_row tbl_fixed mg_t10">
							<colgroup>
								<col style="width: 25%">
								<col style="width: 50%">
								<col style="width: 25%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>규격명</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">삭제</button>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td><button type="button" class="btn btn-xs btn-outline-danger">추가</button>
								</tr>
								<tr>
									<td></td>
									<td></td>
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
<script type="text/javascript">

</script>
</html>