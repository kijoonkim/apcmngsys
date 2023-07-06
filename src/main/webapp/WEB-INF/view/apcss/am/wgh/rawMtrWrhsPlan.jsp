<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
    <link href="/resource/css/template_com.css" rel="stylesheet" type="text/css">
    <script>
        var SBUxConfig = {
            Path: '/resource/sbux/',
            SBGrid: {
                Version2_5: true
            },
            SBChart: {
                Version2_0: true
            }
        }
    </script>
    <script src="/resource/sbux/SBUx.js"></script>
    <!------------------ 컴포넌트 테마 CSS ------------------>
	<link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>
	<link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">
<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 시작-->
    <!-- favicon -->
	<link rel="apple-touch-icon" href="/resource/images/favicon.png">
	<link rel="shortcut icon" href="/resource/images/favicon.ico">
	<!-- //favicon -->

	<!-- [pp] icon -->
	<link rel="stylesheet" href="/resource/src/font-awesome/css/font-awesome.min.css">
	<!-- [pp] font-awesome 파이어폭스 미출력 에러 대응 -->
	<link rel="stylesheet" href="/resource/css/font-awesome/4.7.0/css/font-awesome.css">
	<!-- [pp] //font-awesome 파이어폭스 미출력 에러 대응 -->
	<link rel="stylesheet" href="/resource/src/remixicon/fonts/remixicon.css">
	<!-- [pp] //icon -->

	<!-- css -->
	<link rel="stylesheet" href="/resource/src/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-adminLTE/css/_all-skins.min.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="/resource/src/dataTables/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="/resource/src/dataTables/css/select.dataTables.min.css">
	<link rel="stylesheet" href="/resource/src/mCustomScrollbar/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="/resource/src/select2/css/select2.css">
	<link rel="stylesheet" href="/resource/src/apexchart/css/apexcharts.css">
	<link rel="stylesheet" href="/resource/css/dl_global.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_common.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_custom.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_table.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_ui.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_popup.css">
	<!-- //css -->

	<!-- js -->
	<script src="/resource/src/jquery/js/jquery-3.5.1.min.js"></script>
	<script src="/resource/src/jquery/js/jquery.mousewheel.min.js"></script>
	<script src="/resource/src/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resource/src/bootstrap-adminLTE/js/adminlte.js"></script>
	<script src="/resource/src/bootstrap-adminLTE/js/demo.js"></script>
	<script src="/resource/src/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<script src="/resource/src/dataTables/js/jquery.dataTables.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.bootstrap.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.buttons.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.select.min.js"></script>
	<script src="/resource/src/dataTables/js/jszip.min.js"></script>
	<script src="/resource/src/dataTables/js/pdfmake.min.js"></script>
	<script src="/resource/src/mCustomScrollbar/js/jquery.mCustomScrollbar.min.js"></script>
	<script src="/resource/src/select2/js/select2.min.js"></script>
	<script src="/resource/src/apexchart/js/apexcharts.js"></script>
	<script src="/resource/js/admin/pp_ui.js"></script>
	<!-- //js -->

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 완료-->
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