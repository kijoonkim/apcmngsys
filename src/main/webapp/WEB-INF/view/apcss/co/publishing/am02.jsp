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
							<h3 class="box-title"> ▶ APC환경설정</h3>
							<div class="ad_tbl_top">
								<div class="ad_tbl_toplist">
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
									<col style="width: 1%">
									<col style="width: 2%">
									<col style="width: 10%">
									<col style="width: 2%">
									<col style="width: 2%">
									<col style="width: 1%">
									<col style="width: 15%">
									<col style="width: 2%">
									<col style="width: 7%">
									<col style="width: 2%">
									<col style="width: 9%">
								</colgroup>
								<tbody>
									<tr>	
										<th scope="row">APC코드</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td>&nbsp;</td>	
										<td>											
											<input type="text" class="form-control input-sm" placeholder="변경불가" disabled>
										</td>
										<td scope="row" colspan="8">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2">APC정보</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td scope="row">명칭</td>
										<td scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td scope="row">주소</td>
										<td colspan="3"scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td scope="row">전화번호</td>
										<td scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td scope="row">팩스번호</td>
										<td scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
									</tr>
									<tr>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td scope="row">사업번호</td>
										<td scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td scope="row">계좌번호</td>
										<td colspan="3"scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
										<td scope="row">입금은행</td>
										<td class="td_input">
											<select class="form-control input-sm">
											</select>
										</td>

										<td scope="row">예금주명</td>
										<td scope="row">											
											<input type="text" class="form-control input-sm" placeholder="" title="">
										</td>
									</tr>
									<tr>
										<th scope="row">APC구분</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td colspan="2"class="td_input">
											<p class="ad_input_row">
												<input type="radio" name="radio" class="radio" id="radio1">
												<label class="radio_label" for="radio1">농협　</label>
											</p>
											<p class="ad_input_row">
												<input type="radio" name="radio_dis" class="radio" id="radio_dis_on" checked>
												<label class="radio_label" for="radio_dis_on">법인</label>
											</p>
										</td>								
									</tr>
									<tr>
										<th scope="row">생산자 정산기준</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td colspan="9" class="td_input">
											<p class="ad_input_row">
												<input type="radio" name="radio" class="radio" id="radio1">
												<label class="radio_label" for="radio1">원물입고기준</label>
											</p>
											<p class="ad_input_row">
												<input type="radio" name="radio" class="radio" id="radio1" checked>
												<label class="radio_label" for="radio1">선별완료기준</label>
											</p>
											<p class="ad_input_row">
												<input type="radio" name="radio" class="radio" id="radio1">
												<label class="radio_label" for="radio1">포장완료기준</label>
											</p>
											<p class="ad_input_row">
												<input type="radio" name="radio" class="radio" id="radio1">
												<label class="radio_label" for="radio1">출하완료기준</label>
											</p>
										</td>									
									</tr>
									<tr>
										<th scope="row">사용자관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td colspan="2"class="td_input">
											<button style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark">사용자권한 설정</button>									
										</td> 
										<td>필수</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) APC관리자가 사용자별 권한정보를 설정									
										</td>
									</tr>
									<tr>
										<th scope="row">운용설비관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark">설비 등록</button>											
										</td> 
										<td>필수</td>
										<td>&nbsp;</td>
										<td colspan="4">
											Ex) 선별1호기, 선별2호기... / 포장라인, 포장라인2...									
										</td>
									</tr>
									<tr>
										<th scope="row">저장창고 관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;">창고 등록</button>										
										</td> 
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td colspan="4">
											Ex) 원물창고1, 원물창고2... / 상품창고1, 상품창고2... / A창고, B창고...									
										</td>
									</tr>
									<tr>
										<th scope="row">품목 관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark">품목 등록</button>									
										</td> 
										<td>필수</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) 품목등록, 품목에 종속된 품종, 선별등급, 규격 정보 등록									
										</td>
									</tr>
									<tr>
										<th scope="row">원물 팔레트/박스</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark">팔레트/박스 등록</button>									
										</td> 
										<td>필수</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) 원물입고 시 사용되는 팔레트와 박스정보 및 출하 포장단위 관리									
										</td>
									</tr>
									<tr>
										<th scope="row">원물육안등급</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;">원물육안등급 등록</button>										
										</td> 
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) 원물입고 시 육안등급을 관리하는 경우 (최대 5종까지 관리)									
										</td>
									</tr>
									<tr>
										<th scope="row">입고차량 관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;">입고차량/운임 등록</button>												
										</td> 
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) 원물입고 차량의 운반비 송금계좌정보 및 지역별 운임비용 관리									
										</td>
									</tr>
									<tr>
										<th scope="row">출하운송사 관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;">출하 운송회사 등록</button>										
										</td> 
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) 출하실적 및 송품장 발행을 위한 운송회사정보 관리								
										</td>
									</tr>
									<tr>
										<th scope="row">거래처 관리</th>
										<td style="border-right: hidden;">&nbsp;</td>	
										<td class="td_input" colspan="2">
											<button style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark">거래처 등록</button>											
										</td> 
										<td>
											필수									
										</td>
										<td>&nbsp;</td>
										<td colspan="4">
											설명) 거래처 정보 및 발주서 접속정보 관리(대형마트 발주서 정보는 선택사항)								
										</td>
									</tr>
								</tbody> 
							</table>

							<!--[pp] //검색 -->
							<!--[pp] 검색결과 -->
							<div class="box-body">
									<table class="table table-bordered tbl_row tbl_fixed">
										<caption>검색 조건 설정</caption>
										<colgroup>
											<col style="width: 8%">
											<col style="width: 7%">
											<col style="width: 18%">
											<col style="width: 18%">
											<col style="width: 18%">
											<col style="width: auto">
										</colgroup>
										<tbody>
										<tr>
												<th colspan="5">APC 사용메뉴 선택<button type="button" class="btn btn-sm btn-outline-danger" style="float:right;">간편설정</button></th>
											</tr>
											<tr>
												<th scope="row">계량정보관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default" >사용</label>
													</p>
												</td>
												<td>
							                     	<p class="ad_input_row">
								                    	<input type="checkbox" class="check" id="check_default">
									                    <label class="check_label" for="check_default">테블릿사용</label>
							                  	</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">계량확인서 발행</label>
													</p>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>원물입고관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default" checked>
														<label class="check_label" for="check_default" >사용</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">테블릿사용</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default" checked>
														<label class="check_label" for="check_default">원물인식표 발행</label>
													</p>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>투입지시관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default" >사용</label>
													</p>
												</td>
												<td>&nbsp;</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">투입지시서 발행</label>
													</p>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>생산지시관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default" >사용</label>
													</p>

												</td>
												<td>&nbsp;</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">생산지시서 발행</label>
													</p>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>선별관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default" checked>
														<label class="check_label" for="check_default">사용</label>
													</p>

												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">테블릿사용 (선별투입)</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">선별라벨 발행</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default" checked>
														<label class="check_label" for="check_default">선별확인서 발행</label>
													</p>
												</td>
											</tr>
											<tr>
												<th>포장관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">사용</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">테블릿사용 (선별투입)</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">상품라벨 발행</label>
													</p>
												</td>

												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>출하지시관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">사용</label>
													</p>
												</td>
												<td>
													<p style="color:#ff0000">발주정보관리 필수</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">출하지시서 발행</label>
													</p>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>출하관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default" checked>
														<label class="check_label" for="check_default">사용</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">테블릿 사용</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default" checked>
														<label class="check_label" for="check_default">송품장발행</label>
													</p>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>정산관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">사용</label>
													</p>
												</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>발주정보관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">사용</label>
													</p>
												</td>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">생산지시 발주정보 연결</label>
													</p>
												</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<th>농협전송관리</th>
												<td>
													<p class="ad_input_row">
														<input type="checkbox" class="check" id="check_default">
														<label class="check_label" for="check_default">사용</label>
													</p>
												</td>
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