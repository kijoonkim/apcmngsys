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
			<!-- [pp] 기본 레이아웃 -->
			<div class="box box-solid">
				<div class="box-header">
				<h3 class="box-title"> ▶ 원물육안등급 선택 (팝업)</h3>
				<div class="ad_tbl_top">
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 13%">
						<col style="width: 35%">
						<col style="width: auto">
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
				<div class="ad_section_top">

					<div class="table-responsive tbl_scroll_sm">
						<div id="otrdEyeMngGridArea" style="height:200px; width: 100%"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
				</div>
			</div>
		</div>
	</section>
</body>
</html>