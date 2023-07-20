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
      <link rel="apple-touch-icon" href="../../../images/favicon.png">
      <link rel="shortcut icon" href="../../../images/favicon.ico">
      <!-- //favicon -->

      <!-- [pp] icon -->
      <link rel="stylesheet" href="../../../src/font-awesome/css/font-awesome.min.css">
      <!-- [pp] font-awesome 파이어폭스 미출력 에러 대응 -->
<!--       <link href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"> -->
         <link rel="stylesheet" href="/resource/css/font-awesome/4.7.0/css/font-awesome.css">
      <!-- [pp] //font-awesome 파이어폭스 미출력 에러 대응 -->
      <link rel="stylesheet" href="../../../src/remixicon/fonts/remixicon.css">
      <!-- [pp] //icon -->

      <!-- css -->
      <link rel="stylesheet" href="../../../src/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="../../../src/bootstrap-adminLTE/css/AdminLTE.css">
      <link rel="stylesheet" href="../../../src/bootstrap-adminLTE/css/_all-skins.min.css">
      <link rel="stylesheet" href="../../../src/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
      <link rel="stylesheet" href="../../../src/dataTables/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" href="../../../src/dataTables/css/select.dataTables.min.css">
      <link rel="stylesheet" href="../../../src/mCustomScrollbar/css/jquery.mCustomScrollbar.min.css">
      <link rel="stylesheet" href="../../../src/select2/css/select2.css">
      <link rel="stylesheet" href="../../../src/apexchart/css/apexcharts.css">
      <link rel="stylesheet" href="../../../css/dl_global.css">
      <link rel="stylesheet" href="../../../css/admin/dl_common.css">
      <link rel="stylesheet" href="../../../css/admin/dl_custom.css">
      <link rel="stylesheet" href="../../../css/admin/dl_table.css">
      <link rel="stylesheet" href="../../../css/admin/dl_ui.css">
      <link rel="stylesheet" href="../../../css/admin/dl_popup.css">
      <!-- //css -->

      <!-- js -->
<!--       <script src="../../../src/jquery/js/jquery-3.5.1.min.js"></script> -->
      <script src="/resource/src/jquery/js/jquery-3.5.1.min.js"></script>
        <script src="/resource/src/jquery/js/jquery.mousewheel.min.js"></script>
      <!--[if lt IE 9]>
      <script src="../../../src/jquery/js/jquery-1.12.3.min.js"></script>
      <script src="../../../src/jquery/js/html5shiv.js"></script>
      <script src="../../../src/jquery/js/IE9.js"></script>
      <script src="../../../src/jquery/js/respond.min.js"></script>
      <![endif]-->
      <script src="../../../src/bootstrap/js/bootstrap.min.js"></script>
      <script src="../../../src/bootstrap-adminLTE/js/adminlte.js"></script>
      <script src="../../../src/bootstrap-adminLTE/js/demo.js"></script>
      <script src="../../../src/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
      <script src="../../../src/dataTables/js/jquery.dataTables.min.js"></script>
      <script src="../../../src/dataTables/js/dataTables.bootstrap.min.js"></script>
      <script src="../../../src/dataTables/js/dataTables.buttons.min.js"></script>
      <script src="../../../src/dataTables/js/dataTables.select.min.js"></script>
      <script src="../../../src/dataTables/js/jszip.min.js"></script>
      <script src="../../../src/dataTables/js/pdfmake.min.js"></script>
      <script src="../../../src/mCustomScrollbar/js/jquery.mCustomScrollbar.min.js"></script>
      <script src="../../../src/select2/js/select2.min.js"></script>
      <script src="../../../src/apexchart/js/apexcharts.js"></script>
      <script src="../../../js/admin/pp_ui.js"></script>
      <!-- //js -->


<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 완료-->




	<style>
  		.table th {
    		border-bottom: 1px solid #ffffff !important;
  		}
  		div.input-group-addon {
			padding: 5px;
  		}
	</style>


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
						<div class="box-header" style="display:flex; justify-content: flex-start;" >
							<div>
								<h3 class="box-title" style="line-height: 30px;"> ▶ 매출실적조회</h3>
							</div>
							<div style="margin-left: auto;">
								<button type="button" class="btn btn-sm btn-primary">거래명세표</button>
								<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
								<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
							</div>
							
						</div>
						<div>
						</div>
						<div class="box-body">
							<!--[pp] 검색 -->
							<table class="table table-bordered tbl_row tbl_fixed">
								<caption>검색 조건 설정</caption>
								<colgroup>
									<col style="width: 7%">
									<col style="width: 25%">
									<col style="width: 7%">
									<col style="width: 25%">
									<col style="width: 7%">
									<col style="width: 25%">
								</colgroup>
								<tbody>
									<tr>
										<th class="ta_c">APC명</th>
										<td class="ta_r"  style="border-right: hidden;">
											<input type="text" class="form-control input-sm" placeholder="통합조직" title="입력하세요." disabled>
										</td>
										<td colspan="4"></td>
									</tr>
									<tr>
										
										<th class="ta_c">매출일자</th>
										<td class="ta_l">
											<div class="form-group" style="position: relative; bottom: -0.7em;" >
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
										</td>
										<th class="ta_c">품종</th>
										<td class="ta_l">
											<p class="dp_inline ad_search_row search_sm ad_search_row wd_p200">
												<select class="form-control input-sm wd_150" style="width:200% ">
													<option>선택하세요</option>
												</select>
												<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
											</p>										
										</td>
										<th class="ta_c">거래처</th>
										<td class="ta_l">
											<p class="dp_inline ad_search_row search_sm ad_search_row wd_p160">
												<select class="form-control input-sm wd_150">
													<option>선택하세요</option>
												</select>
												<button type="button" class="btn btn-sm btn-primary btn_form btn_search">찾기</button>
											</p>
										</td>
								</tbody>
							</table>

							<div class="ad_tbl_top">
							</div>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>매출 내역</span></li>
									<li><label style="font-size:x-small;"> 매출 중량/ 금액: 99,999Kg/99,999₩</label></li>
								</ul>
							</div>

							<br>
								<table class="table table-bordered table-hover tbl_col tbl_fixed">
									<colgroup>
										<col style="width: 6%">
										<col style="width: 8%">
										<col style="width: 10%">
										<col style="width: 8%">
										<col style="width: 4%">
										<col style="width: 4%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row" rowspan="2">
												매출일자
											</th>
											<th scope="row" rowspan="2">
												거래처
											</th>
											<th scope="row" rowspan="2">
												상품명
											</th>
											<th scope="row" rowspan="2">												
												상품코드
											</th>
											<th scope="row" rowspan="2">												
												품종
											</th>
											<th scope="row" rowspan="2">												
												규격
											</th>
											<th scope="row" rowspan="2">												
												브랜드
											</th>
											<th scope="row"  rowspan="2">												
												단가
											</th>
											<th scope="row" colspan="2">												
												출하
											</th>
											<th scope="row"  rowspan="2">												
												매출금액
											</th>
										</tr>
										<tr>
											<th>수량</th>
											<th>중량</th>
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
										</tr>
										<tr>
											<th colspan="8">합계</th>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
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