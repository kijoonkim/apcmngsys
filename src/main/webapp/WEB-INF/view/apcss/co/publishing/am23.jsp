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
							<h3 class="box-title"> ▶ 원물입고등록</h3>
							<div class="ad_tbl_top">
								<div class="ad_tbl_toplist">
									<button type="button" class="btn btn-sm btn-primary">계량확인서</button>
									&nbsp;								
									<button type="button" class="btn btn-sm btn-outline-danger">초기화</button>
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
							<table class="table table-bordered tbl_row tbl_fixed">
								<caption>검색 조건 설정</caption>
								<colgroup>
									<col style="width: 5%">
									<col style="width: 3%">
									<col style="width: 2%">
									<col style="width: 2%">
									<col style="width: 2%">
									<col style="width: 1%">
									<col style="width: 1%">
									<col style="width: 1%">
									<col style="width: 1%">
									<col style="width: 1%">
									<col style="width: 1%">
									<col style="width: 1%">
									<col style="width: 3%">
									<col style="width: 5%">
									<col style="width: 3%">
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 2%">
									<col style="width: 5%">
									<col style="width: 5%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">APC명</th>
										<td colspan= "7" class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" disabled>
										</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<th scope="row">계량일자</th>
										<td class="td_input" colspan="2" style="border-right: hidden;">
											<div class="dp_inline wd_125 va_m">
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">생산자/품목</th>
										<td colspan= "2"class="td_input"  style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
										<td colspan= "5"class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
											<option>단일선택</option>
											</select>
										</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<th scope="row">품종</th>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
												<option>단일선택</option>
											</select>
										</td>
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
										<th colspan="3" scope="row">상품구분</th>
										<td colspan="4" class="td_input">
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
										<th scope="row">운송구분</th>
										<td colspan="3" class="td_input">
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
									<tr>
									    <th scope="row">전체중량 Kg</th>
										<td colspan= "2"class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" title="입력하세요.">
										</td>
							     		<td style="border-right: hidden;">&nbsp;</td>
										<th colspan="3"scope="row">공차중량 Kg</th>
										<td colspan="4" class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" title="입력하세요.">
										</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<th scope="row">감량 %</th>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
											</select>
										</td>
										<td style="border-right: hidden;">
											<p class="ad_input_row">
												<input type="checkbox" class="check" id="check_all">
												<label class="check_label" for="check_all">고정</label>
											</p>
										</td>								
										<th scope="row">감량Kg</th>
										<td class="td_input"  style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" disabled>
										</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<th scope="row">실중량Kg</th>
										<td class="td_input">
											<input type="text" class="form-control input-sm" placeholder="" disabled>
										</td>
									<tr>
										<th scope="row">차량번호</th>
										<td class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
										<td style="border-right: hidden;">&nbsp;</td>
										<th colspan="3" scope="row">팔레트 Kg</th>
										<td colspan="3" class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" disabled>
										</td>
										<td colspan="2" class="td_input">
											<button class="btn btn-xs btn-outline-dark" type="button">입력</button></td>									
										<th scope="row">박스 Kg</th>
										<td class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" disabled>
										</td>	
										<td style="border-right: hidden;">&nbsp;</td>									
										<th scope="row">정산중량 Kg</th>
										<td class="td_input"  style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td style="border-right: hidden;">&nbsp;</td>									
										<th colspan="2">정산중량=전체중량-공차중량-감량팔레트중량-박스중량</th>
									</tr>
									<tr>
									    <th scope="row">보관창고</th>
										<td colspan= "2"class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
												<option>선택</option>
											</select>
										</td>
										<td style="border-right: hidden;">&nbsp;</td>
										<th colspan="3" scope="row">육안등급</th>
										<td class="td_input"  style="border-right: hidden;">
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
										<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">입력</button></td>
									 	<td style="border-right: hidden;">&nbsp;</td>
									 	<td style="border-right: hidden;">&nbsp;</td>
										<th scope="row">비고</th>
										<td colspan="4"class="td_input">
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>										
									</tr>
								</tbody>
							</table>
														
							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
									<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span>　원물계량 내역</span></li>
										<li><span>　　　전체중량 : 99.999Kg　공차중량 : 99.999Kg　정산중량 : 99.999Kg</span></li>
									</ul>
								 <div class="ad_tbl_toplist">
									<button type="button" class="btn btn-sm btn-outline-danger">내려받기</button>
									<button type="button" class="btn btn-sm btn-outline-danger">올리기</button>
									</div>
								</div>
									<div class="table-responsive tbl_scroll_sm">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<caption>검색결과 목록</caption>
										<colgroup>
																				
											<col style="width: 7%">
											<col style="width: 5%">
											<col style="width: 4%">
											<col style="width: 4%">
											<col style="width: 7%">
											<col style="width: 7%">
											<col style="width: 7%">
											<col style="width: 7%">
											<col style="width: 7%">
											<col style="width: 5%">
											<col style="width: 5%">
											<col style="width: 5%">
											<col style="width: 8%">
											<col style="width: 7%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">계량번호</th>
												<th scope="col">생산자</th>
												<th scope="col">품목</th>
												<th scope="col">품종</th>
												<th scope="col">상품구분</th>
												<th scope="col">입고구분</th>
												<th scope="col">운송구분</th>
												<th scope="col">전체중량</th>
												<th scope="col">공차중량</th>
												<th scope="col">감량%</th>
												<th scope="col">감량Kg</th>
												<th scope="col">실중량</th>
												<th scope="col">팔레트중량</th>
												<th scope="col">박스중량</th>
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
											</tr>
										</tbody>
									</table>
								</div>
								<b>&nbsp;</b>
								<div class="table-responsive tbl_scroll_sm">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<caption>검색결과 목록</caption>
										<colgroup>
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 10%">
											<col style="width: 20%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">정산중량</th>
												<th scope="col">등급1</th>
												<th scope="col">등급2</th>
												<th scope="col">등급3</th>
												<th scope="col">등급4</th>
												<th scope="col">등급5</th>
												<th scope="col">차량번호</th>
												<th scope="col">보관창고</th>
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
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!--[pp] //검색결과 -->
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