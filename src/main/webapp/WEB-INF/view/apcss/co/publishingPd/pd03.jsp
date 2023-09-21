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

  		.box-body>table.table th {
    		border-bottom: 1px solid #ffffff !important;
  		}
  		div.input-group-addon {
			padding: 5px;
  		}
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






</head>

	<body class="hold-transition sidebar-mini">

		
				<!--[pp] //본문 타이틀 영역/페이지제목,페이지네비게이션 -->
				<!--[pp] 본문내용영역 -->
				<section class="content container-fluid">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title">사용자 관리</h3>
						</div>
						<div class="box-body">
							<!--[pp] 검색 -->
							<table class="table table-bordered tbl_row tbl_fixed">
								<caption>검색 조건 설정</caption>
								<colgroup>
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 5%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">관할기간</th>
										<th class="td_input">
											<select class="form-control input-sm">
												<option>전체</option>
											</select>
										</th>
										<th scope="row">1차승인여부</th>
										<th class="td_input">
											<select class="form-control input-sm">
												<option>전체</option>
											</select>
										</th>
										<th scope="row">2차승인여부</th>
										<th class="td_input">
											<select class="form-control input-sm">
												<option>전체</option>
											</select>
										</th>
										<th></th>
									</tr>
									<tr>
										<th scope="row">권한</th>
										<th class="td_input">
											<select class="form-control input-sm">
												<option>전체</option>
											</select>
										</th>
										<th scope="row">아이디</th>
										<th class="td_input">
											<input type="text" class="form-control input-sm" placeholder="" title="입력하세요." >
										</th>
										<th scope="row">이름</th>
										<th class="td_input">
											<input type="text" class="form-control input-sm" placeholder="" title="입력하세요." >
										</th>
										<th></th>
									</tr>
									<tr>
										<th scope="row">사업자번호</th>
										<th class="td_input">
											<input type="text" class="form-control input-sm" placeholder="_ _ _-_ _-_ _ _ _ _" title="입력하세요." >
										</th>
										<th scope="row">법인명</th>
										<th class="td_input">
											<input type="text" class="form-control input-sm" placeholder="" title="입력하세요." >
										</th>
										<th scope="row">&nbsp;</th>
										<th class="td_input">
											<div class="mg_t5 ta_r">
												<button type="button" class="btn btn-sm btn-primary"><i class="fa fa-search mg_r5"></i>조회</button>
											</div>
										</th>
										<th></th>
									</tr>                                                   
								</tbody>
							</table>
							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
							<div class="ad_section_top">
							<div class="ad_section_top">
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span>전체조회건수:</span>2건</li>
									</ul>
								</div>
								<div class="table-responsive tbl_scroll_sm">
									<table class="table table-bordered table-hover tbl_col tbl_fixed">
										<caption>검색결과 목록</caption>
										<colgroup>
											<col style="width: 5%">
											<col style="width: 8%">
											<col style="width: 9%">
											<col style="width: 8%">
											<col style="width: 9%">
											<col style="width: 18%">
											<col style="width: 10%">
											<col style="width: 15%">
											<col style="width: 10%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">법인명</th>
												<th scope="col">관할기관</th>
												<th scope="col">
													Agrix승인
												</th>
												<th scope="col">
													유통공사승인
												</th>
												<th scope="col">권한</th>
												<th scope="col">사업자번호</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td scope="row">
												nhag5599
												</td>
                                                <td>통합조직</td>
												<td>대저농업협동조합</td>
												<td>충남농협지역본부</td>
												<td>승인(2019-01-08)</td>
												<td>승인(2019-10-22)</td>
												<td>평가대상조직</td>	
												<td>622-82-12345</td>
												<td class="td_input">
													<button type="button" class="btn btn-xs btn-info">수정</button>
												</td>
											</tr>
											<tr>
												<td scope="row">
												h3011004
												</td>
                                                <td>농협회사법인(주)참드레</td>
												<td>&nbsp;</td>
												<td>전북지역본부</td>
												<td>승인(2017-02-01)</td>
												<td>미승인</td>
												<td>평가대상조직</td>	
												<td>_ _ _-_ _-_ _ _ _ _</td>
												<td class="td_input">
													<button type="button" class="btn btn-xs btn-info">수정</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="dataTables_paginate paging_simple_numbers ta_c">
									<ul class="pagination">
										<li class="paginate_button active"><a href="javascript:void(0);">1</a></li>
									</ul>
								</div>
							</div>
							<!--[pp] //검색결과 -->
						</div>
					</div>
				</section>
				
	</body>

</html>