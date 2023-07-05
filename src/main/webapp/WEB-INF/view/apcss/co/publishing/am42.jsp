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
							<h3 class="box-title"> ▶ 재고정보등록</h3>
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
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 10%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">APC명</th>
									    <td colspan="2" class="td_input" style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder=""disabled>
										</td>
										<th scope="row">재고구분</th>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
												<option></option>
											</select>
										</td>
										<td colspan="4"></td>
									</tr>
									<tr>
										<th scope="row">품목/품종</th>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
												<option>선택</option>
											</select>
										</td>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
												<option>선택</option>
											</select>
										</td>
										<th scope="row">규격</th>
										<td colspan="2" class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
											<option></option>
											</select>
										</td>
										<th scope="row">창고구분</th>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
											<option></option>
											</select>
										</td>
										<td></td>
									</tr>
									<tr>
									    <th scope="row">생산자</th>
										<td class="td_input">
											<input type="text" class="form-control input-sm">
										</td>
										<td class="td_input">
											<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
										</td>
										<th scope="row">상품구분</th>
										<td colspan="2" class="td_input">
											<select class="form-control input-sm">
											<option></option>
											</select>
										</td>										
										<th scope="row">입고구분</th>
										<td class="td_input" style="border-right: hidden;">
											<select class="form-control input-sm">
											<option></option>
											</select>
										</td>
										<td></td>
									</tr>
								</tbody>
							</table>
														
							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
							<div class="ad_section_top">
								<div class="ad_tbl_toplist">
										<button type="button" class="btn btn-md btn-outline-danger">원물재고 내역</button>
										<button type="button" class="btn btn-md btn-outline-danger">선별재고 내역</button>
										<button type="button" class="btn btn-md btn-outline-danger">상품재고 내역</button>
								</div>
									<div class="table-responsive tbl_scroll_sm">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<caption>검색결과 목록</caption>
										<colgroup>																				
											<col style="width: 3%">
											<col style="width: 7%">
											<col style="width: 5%">
											<col style="width: 5%">
											<col style="width: 4%">
											<col style="width: 4%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
										</colgroup>
										<thead>
											<tr>
												<th rowspan="2">선택</th>
												<th rowspan="2">입고번호</th>
												<th rowspan="2">팔레트번호</th>
												<th rowspan="2">입고일자</th>
												<th rowspan="2">생산자</th>
												<th rowspan="2">품목</th>
												<th rowspan="2">품종</th>
												<th rowspan="2">상품</th>
												<th rowspan="2">입고</th>
												<th rowspan="2">운송</th>
												<th rowspan="2">창고</th>
												<th colspan="2">입고</th>
												<th colspan="2">투입</th>
												<th colspan="2">현 재고</th>
											</tr>
											<tr>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<th scope="row" class="td_input">
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check1">
													<label class="check_label ta_i" for="check1">선택</label>
												</p>
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
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th scope="row" class="td_input">
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check1">
													<label class="check_label ta_i" for="check1">선택</label>
												</p>
											</th>
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
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>																												
							</div>
								<div class="table-responsive tbl_scroll_sm">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<caption>검색결과 목록</caption>
										<colgroup>
											<col style="width: 3%">
											<col style="width: 6%">
											<col style="width: 4%">
											<col style="width: 5%">
											<col style="width: 4%">
											<col style="width: 5%">
											<col style="width: 4%">
											<col style="width: 4%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
										</colgroup>
										<thead>
											<tr>
												<th rowspan="2">선택</th>
                                                <th rowspan="2">선별번호</th>
												<th rowspan="2">등급</th>
                                                <th rowspan="2">투입일자</th>
												<th rowspan="2">설비</th>
                                                <th rowspan="2">생산자</th>
												<th rowspan="2">품목</th>
                                                <th rowspan="2">품종</th>
												<th rowspan="2">규격</th>
                                                <th rowspan="2">창고</th>
												<th colspan="2">선별</th>
												<th colspan="2">포장</th>
												<th colspan="2">현 재고</th>
											</tr>
									     	<tr>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<th scope="row" class="td_input">
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check1">
													<label class="check_label ta_i" for="check1">선택</label>
												</p>
											</th>
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
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th scope="row" class="td_input">
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check1">
													<label class="check_label ta_i" for="check1">선택</label>
												</p>
											</th>
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
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>															
							</div>
							<div class="table-responsive tbl_scroll_sm">
								<table class="table table-bordered table-hover tbl_col tbl_fixed">
									<caption>검색결과 목록</caption>
										<colgroup>
											<col style="width: 3%">
											<col style="width: 6%">
											<col style="width: 3%">
											<col style="width: 4%">
											<col style="width: 4%">
											<col style="width: 4%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
											<col style="width: 3%">
										</colgroup>
										<thead>
											<tr>
												<th rowspan="2">선택</th>
                                                <th rowspan="2">포장번호</th>
												<th rowspan="2">순번</th>
                                                <th rowspan="2">포장일자</th>
												<th rowspan="2">설비</th>
                                                <th rowspan="2">생산자</th>
												<th rowspan="2">품목</th>
                                                <th rowspan="2">품종</th>
												<th rowspan="2">규격</th>
                                                <th rowspan="2">등급</th>
												<th rowspan="2">창고</th>
												<th colspan="2">포장</th>
												<th colspan="2">출하</th>
												<th colspan="2">현 재고</th>
											</tr>
									     	<tr>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
												<th scope="col">수량</th>
												<th scope="col">중량</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<th scope="row" class="td_input">
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check1">
													<label class="check_label ta_i" for="check1">선택</label>
												</p>
											</th>
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
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th scope="row" class="td_input">
												<p class="ad_input_row">
													<input type="checkbox" class="check" id="check1">
													<label class="check_label ta_i" for="check1">선택</label>
												</p>
											</th>
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
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
									
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