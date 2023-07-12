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



	<style>
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
						<div class="box-header">
							<h3 class="box-title"> ▶ 메시지관리</h3>
							<div class="ad_tbl_top">
								<div class="ad_tbl_toplist">
									<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
									<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
									<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
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
									<col style="width: 15%">
									<col style="width: 60%">
								</colgroup>
								<tbody>
									<tr>
										<th>검색조건</th>
										<td style="border-right:hidden;">
											<select class="form-control input-sm">
												<option>전체</option>
											</select>
										</td>
										<td style="border-right:hidden;"><input style="font-size:x-small;" type="text" class="form-control input-sm" placeholder="검색어 입력" title=""></td>	
										<td></td>
									</tr>
								</tbody>
							</table>
							</div>							
							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
							<br>
							<div class="row">
								<div class="col-sm-7">
									<div class="ad_tbl_top"  style="width: 98%;">
										<ul class="ad_tbl_count">
											<li><span class="font_default" >메시지목록</span></li>
											<li><span style="font-size:x-small;" class="font_default normal" >조회건수 00건</span></li>
										</ul>
										<div class="ad_tbl_toplist">
											<button style="font-size:small;" type="button" class="btn btn-xs btn-outline-danger">행추가</button>
										</div>
									</div>
									<div class="ad_manager_list" style="width: 98%;">
										<div>
										<table class="table tbl_col table-bordered table-hover">
											<caption>권한목록 상세정보</caption>
											<colgroup>
												<col style="width: 5%">
												<col style="width: 10%">
												<col style="width: 15%">
												<col style="width: 40%">
												<col style="width: 20%">
											</colgroup>
											<thead>
												<tr>
													<th scope="row" class="td_input">
														<p class="ad_input_row">
															<input type="checkbox" class="check" id="check1">
															<label class="check_label ta_i" for="check1">선택</label>
														</p>
													</th>
													<th scope="col">No</th>
													<th scope="col">메시지Key</th>
													<th>메시지내용</th>
													<th>메시지종류</th>
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
													<td class="ta_r">1</td>
													<td>MSG0001</td>
													<td class="ta_l">(0)와/과 {1}은/는 동시에 입력...</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th scope="row" class="td_input">
														<p class="ad_input_row">
															<input type="checkbox" class="check" id="check1">
															<label class="check_label ta_i" for="check1">선택</label>
														</p>
													</th>
													<td class="ta_r">2</td>
													<td>MSG0002</td>
													<td class="ta_l">(0)을/를 입력하십시오.</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th scope="row" class="td_input">
														<p class="ad_input_row">
															<input type="checkbox" class="check" id="check2">
															<label class="check_label ta_i" for="check2">선택</label>
														</p>
													</th>
													<td class="ta_r">3</td>
													<td>MSG0003</td>
													<td class="ta_l">정상처리 되었습니다.</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th scope="row" class="td_input">
														<p class="ad_input_row">
															<input type="checkbox" class="check" id="check3">
															<label class="check_label ta_i" for="check3">선택</label>
														</p>
													</th>
													<td class="ta_r">4</td>
													<td>MSG0004</td>
													<td class="ta_l">(0)이/가 {1}보다 작습니다.</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table>
										</div>
									</div>
									<div class=" pd_l5 pd_r5" style="width: 98%;">
										<div class="row" style="border: 1px solid #ddd;">
											<div class="col-sm-3 pd_t5">
												<select class="form-control">
													<option value="100">100</option>
												</select>
											</div>
											<div class="col-sm-9 ta_c">
												<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
													<ul class="pagination mg_10">
														<li class="paginate_button previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
														<li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li>
														<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li>
														<li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li>
														<li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">Next</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-5">
									<div class="ad_tbl_top">
										<ul class="ad_tbl_count">
											<li><span class="font_default">메세지상세정보</span></li>
										</ul>
									</div>
									<div style="border: 1px solid #ddd;">
										<div>
										<table class="table table-bordered tbl_row tbl_fixed">
											<caption>검색 조건 설정</caption>
											<colgroup>
												<col style="width: 25%">
												<col style="width: 25%">
												<col style="width: 25%">
												<col style="width: 25%">
											</colgroup>
											<tbody>
												<tr>	
													<th scope="row">메세지KEY</th>
													<td class="ta_l" colspan="3">MSG0001</td>	
												</tr>
												<tr>	
													<th scope="row">메세지KEY</th>
													<td class="ta_l" colspan="3">(0)와/과 {1}은/는 동시에 입력하여야 합니다.</td>	
												</tr>
												<tr>	
													<th scope="row">비고</th>
													<td class="ta_l" colspan="3">유효성 체크 메시지</td>	
												</tr>
												<tr>
													<th>최초등록ID</th>
													<td>test001</td>
													<th>최종변경자ID</th>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th>최초등록일시</th>
													<td>&nbsp;</td>
													<th>최종변경일시</th>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th>등록프로그램</th>
													<td>&nbsp;</td>
													<th>변경프로그램</th>
													<td>&nbsp;</td>
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