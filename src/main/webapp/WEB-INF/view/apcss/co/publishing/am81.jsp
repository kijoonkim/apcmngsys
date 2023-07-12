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
     		div.input-group-addon {
			padding: 5px;  		
  		
  		table.table-bordered td{
  			
  		} 
  		table.table-bordered th{
			border-bottom: 1px solid #ffffff !important;
  		} 
  		table.table-bordered td{
			border-right:hidden !important;
  		} 
  		btn.btn-xs {
  			font-size: x-small; !important;
  		}
  		select.form-control.input-sm {
    		background-size: 34px !important;
    		padding: 3px !important;
		}
		td.select_box {
			padding: 0px !important;
		}
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
							<h3 class="box-title"> ▶ 메뉴관리</h3>
							<div class="ad_tbl_top">
								<div class="ad_tbl_toplist">
									<button type="button" class="btn btn-sm btn-outline-danger">신규</button>
									<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
									<button type="button" class="btn btn-sm btn-primary">저장</button>
									<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
								</div>
							</div>
						</div>
						<div>
						
						<div class="box-body">
							<!--[pp] 검색 -->
							<div>
							<table class="table table-bordered tbl_row tbl_fixed">
								<caption>검색 조건 설정</caption>
								<colgroup>
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 10%">
									<col style="width: 3%">
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 4%">
								</colgroup>
								<tbody>
									<tr>
										<th class="ta_c">시스템구분</th>
										<td class="ta_r" colspan="2"   style="border-right:hidden;">
											<select class="form-control input-sm">
												<option>시스템관리</option>
											</select>
										</td>
										<td colspan="6"></td>
									</tr>
								</tbody>
							</table>
							</div>
														
							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
							<br>
							<div class ="row">
								<div class="col-sm-3">
								<b>메뉴목록</b>
								<div class ="row">
								<table class="table table-bordered table-hover tbl_col tbl_fixed" style="width: 95%;">
									<colgroup>
										<col style="width: 100%">
									</colgroup>
									<thead>
										<tr>
											<td class="ta_l">
												<br>
												<br>
												<b>시스템관리</b><br>
												<br>
												<br>
												&nbsp;* 시스템관리<br>
												<br>
												&nbsp;* 화면관리<br>
												<br>
												&nbsp;* 권한관리<br>
												&nbsp;&nbsp;&nbsp;-권한그룹관리<br>
												&nbsp;&nbsp;&nbsp;-권한별 사용자관리<br>
												<br>
												&nbsp;* 사용자관리<br>
												&nbsp;&nbsp;&nbsp;-사용자관리<br>
												&nbsp;&nbsp;&nbsp;-권한별 사용자관리<br>
												<br>
												&nbsp;* 메시지관리<br>
												<br>
												&nbsp;* 공통코드<br>
												&nbsp;&nbsp;&nbsp;-공통코드관리<br>
												&nbsp;&nbsp;&nbsp;-센터별 공통코드관리<br>
												<br>
												&nbsp;* 이력관리<br>
												<br>
												<br>
												<br>
											</td>
										</tr>
									</thead>
									<tbody>
									</tbody>	
									</table>

								</div>
								</div>
								
								<div class="col-sm-9">
									<b>메뉴 상세정보</b>
									<div  class ="row">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<colgroup>
											<col style="width: 25%">
											<col style="width: 25%">
											<col style="width: 25%">
											<col style="width: 25%">
										</colgroup>
										<thead>
											<tr>
												<th>상위메뉴</th>
												<td></td>
												<th>시스템구분</th>
												<td></td>
											</tr>
											<tr>
												<th>메뉴ID</th>
												<td></td>
												<th>APC코드</th>
												<td></td>
											</tr>
											<tr>
												<th>메뉴명</th>
												<td></td>
												<th>표시순서</th>
												<td></td>
											</tr>
											<tr>
												<th>화면유형</th>
												<td></td>
												<th>사용자유형</th>
												<td>												
												</td>
											</tr>
										</thead>
									</table>
									</div>
									<br>
									
									<b>확인버튼 및 개체 목록</b>
									<div class ="row">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<colgroup>
											<col style="width: 5%">
											<col style="width: 25%">
											<col style="width: 38%">
											<col style="width: 27%">
										</colgroup>
										<thead>
											<tr>
												<th>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check1" >
														<label class="check_label ta_i" for="check1">선택</label>
													</p>	
												</th>
												<th>id</th>
												<th>명칭</th>
												<th>사용여부</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check1" >
														<label class="check_label ta_i" for="check1">선택</label>
													</p>	
												</td>
												<td>btnSearch</td>
												<td>조회</td>
												<td>
													<p class="ad_input_row">
														<input type="radio" name="radio" class="radio" id="radio100" checked>
														<label class="radio_label" for="radio100">사용</label>
													</p>
													<p class="ad_input_row">
														<input type="radio" name="radio" class="radio" id="radio100">
														<label class="radio_label" for="radio100">미사용</label>
													</p>
												</td>
											</tr>
											<tr>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check1" >
														<label class="check_label ta_i" for="check1">선택</label>
													</p>	
												</td>
												<td>grpInsert</td>
												<td>등록GROUP</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								</div>
							</div>
							<!--[pp] //검색결과 -->
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