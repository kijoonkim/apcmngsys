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
    <style>
        /*해당 레이아웃 템플릿 페이지를 표현하기위한 임의의 스타일 CSS 입니다.
        실작업시, 해당 프로젝트의 CSS 네이밍에 맞추어 재작업이 필요합니다.*/
        .sbt-A-wrap {min-width:1024px; margin:0 auto; border:1px solid #333;}
        .sbt-A-wrap .main {display:table;  width:100%; height:500px;}
        .sbt-A-wrap .left {display:table-cell; vertical-align: top; width:200px; }
        .sbt-A-wrap .left .sbt-all-left {height: 100%;}
        .sbt-A-wrap .content {display:table-cell;}
        .sbux-sidemeu {position: relative; z-index: 1;}
        .footer {
            display: flex; align-items: center; justify-content: center; font-size: 16px;
            background:rgb(42, 48, 65); height:150px; padding:10px; box-sizing: border-box;  color:#dddddd;
        }
        .tbl>tbody>tr{height: 40px;}
        .tbl>tbody>tr>td>button{width: 200px;}
        .tbl>tbody>tr>td{padding-left: 5px;}
    </style>




<!-- SB 스타일 가이드 영역 완료 -->




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
		<!--[if lt IE 9]>
		<script src="/resource/src/jquery/js/jquery-1.12.3.min.js"></script>
		<script src="/resource/src/jquery/js/html5shiv.js"></script>
		<script src="/resource/src/jquery/js/IE9.js"></script>
		<script src="/resource/src/jquery/js/respond.min.js"></script>
		<![endif]-->
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






<!-- section============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->

<section class="content container-fluid">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title"> ▶ APC사용자별권한관리</h3>
							<div class="ad_tbl_top">
								<div class="ad_tbl_toplist">
									<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
									<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
									<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
									<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
								</div>
							</div>
						</div>
						<div>
						</div>
						<div class="box-body">
							<!--[pp] 검색 -->
							<div>
							<table class="table table-bordered tbl_row tbl_fixed">
								<caption>검색 조건 설정</caption>
								<colgroup>
									<col style="width: 10%">
									<col style="width: 15%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 15%">
									<col style="width: 10%">
									<col style="width: 15%">
									<col style="width: 10%">
								</colgroup>
								<tbody>
									<tr>
										<th class="ta_r">APC명</th>
										<th class="ta_r">
											<input type="text" class="form-control input-sm" placeholder="" title="입력하세요." disabled>
										</th>
										
										<!-- <th class="ta_r">작업일자</th> -->
										<th scope="row">작업일자</th>
										<th class="td_input">
											<div class="dp_inline wd_125 va_m">
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
												</div>
											</div>
										</th>
										<th scope="row"></th>
										<th scope="row">작업구분</th>
										<th class="td_input">
											<select class="form-control input-sm">
												<option>선별/포장</option>
											</select>
										</th>
										<th scope="row"></th>
									</tr>
								</tbody>
							</table>
							</div>
							<br>
							<!-- 1번째 그리드-->
							<div>
								<div>
								<b>생산실적 내역</b>
								<div>
								<table class="table table-bordered table-hover tbl_col tbl_fixed" >
									<colgroup>
										<col style="width: 15%">
										<col style="width: 15%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 20%">
										
									</colgroup>
									<thead>
										<tr>
											<th>작업구분</th>
											<th>작업일자</th>
											<th>설비</th>
											<th>규격</th>
											<th>수량</th>
											<th>중량</th>
											<th>작업자수</th>
											<th>비고</th>
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
										</tr>
									</tbody>
								</table>
								</div>
								</div>
							</div>
							<br>
							<!-- 1번째 그리드-->
							<div>
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span style="color: black;">작업자별 실적 내역</span></li>
									</ul>
								 	<div class="ad_tbl_toplist">
										<button type="button" class="btn btn-sm btn-outline-danger">내려받기</button>
										<button type="button" class="btn btn-sm btn-outline-danger">올리기</button>
									</div>
								</div>
								<div>
								<table class="table table-bordered table-hover tbl_col tbl_fixed" >
									<colgroup>
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 15%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 10%">
										<col style="width: 20%">
										<col style="width: 5%">
									</colgroup>
									<thead>
										<tr>
											<th>작업구분</th>
											<th>작업일자</th>
											<th>설비</th>
											<th>작업자명</th>
											<th>시작신간</th>
											<th>종료시간</th>
											<th>작업시간</th>
											<th>비고</th>
											<th>처리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												<select class="form-control input-sm">
													<option></option>
												</select>
											</td>
											<td>1200</td>
											<td>1800</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td><button type="button" class="btn btn-xs btn-outline-primary">삭제</button></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												<select class="form-control input-sm" style="height: 40%;">
													<option></option>
												</select>
											</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td><button type="button" class="btn btn-xs btn-outline-primary">추가</button></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												<select class="form-control input-sm" style="height: 40%;">
													<option></option>
												</select>
											</td>
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
											<td>
												<select class="form-control input-sm" style="height: 40%;">
													<option></option>
												</select>
											</td>
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
							</div>
						</div>
					</div>
				</section>


<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- ============================================================================================================== -->
<!-- section============================================================================================================== -->







<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 완료-->

</body>
</html>