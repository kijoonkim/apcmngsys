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
			<h3 class="box-title"> ▶ APC사용자 권한설정 (팝업)</h3>
			<div class="ad_tbl_top">
				<div class="ad_tbl_toplist">
					<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
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
					<col style="width: 8%">
					<col style="width: 18%">
					<col style="width: 8%">
					<col style="width: 18%">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">APC명</th>
						<th>
							<sbux-input id=userAuthApcNm name="userAuthApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
						</th>
						<th scope="row">사용자명</th>
						<th>
							<sbux-input id=userAuthUserNm name="userAuthUserNm" uitype="text" class="form-control input-sm"></sbux-input>
						</th>
						<th>&nbsp;</th>
					</tr>
				</tbody>
			</table>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="userAuthMngGridArea" style="height:250px; width: 100%;"></div>
				</div>
				</div>
			</div>
	</section>
</body>
</html>