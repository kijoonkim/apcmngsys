<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
		<div class="row">
			<div class="box box-solid">
				<div class="box-header">
					<h3 class="box-title"> ▶ 팔레트/박스 등록 (팝업)</h3>
					<div class="ad_tbl_top">
						<div class="ad_tbl_toplist">
							<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
							<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
						</div>
					</div>
				</div>
				<div class="box-body">
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 40%">
							<col style="width: 60%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>

								<th>
									<input type="text" class="form-control input-sm" placeholder="" disabled>
								</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

					<!--[pp] //검색 -->
					<!--[pp] 검색결과 -->
					<div class="table-responsive tbl_scroll_sm">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>원물입고</span></li>
							</ul>
						</div>
						<div id="pltMngGridArea" style="height:150px; width: 100%;"></div>
						<div id="bkMngGridArea" style="height:150px; width: 100%"></div>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>상품출하</span></li>
							</ul>
						</div>
						<div id="pckgMngGridArea" style="height:150px; width: 100%"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>