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
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title">▶ 발주정보조회</h3>
			</div>
			<div class="box-body">
			   <div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-dark">조회</button>
						<button type="button" class="btn btn-sm btn-outline-dark">등록</button>
						<button type="button" class="btn btn-sm btn-outline-dark">종료</button>
					</div>
				</div>


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
					    	<td colspan="2" class="td_input">
								<input type="text" class="form-control input-sm" placeholder=""disabled>
							</td>
					        <th scope="row">접수여부</th>
							<td colspan="2" class="td_input">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							<th scope="row">발주일자</th>
							<td colspan="2" class="td_input">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm">
									</div>
								</div>
								~
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.31" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
	                	</tr>
						<tr>
							<th scope="row">발주유형</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
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
						</tr>
						<tr>
						    <th scope="row">거래처명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							</td>
							<th scope="row">납기일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<th scope="row">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
									<td class="td_input">
										<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">지시일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<th scope="row">생산설비</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
						         	<option>선택</option>
						        </select>
							</td>
							<td colspan="4" class="ta_r">
								<div class="ad_tbl_toplist">
									  <button type="button" class="btn btn-sm btn-outline-success"></i>생산지시 등록</button>
							   </div>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>발주 내역</span></li>
						</ul>
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-dark">일괄접수</button>
						</div>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 5%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="td_input">
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check_default">
											<label class="check_label ta_i" for="check_default">전체선택</label>
										</p>
									<th scope="col">접수일자</th>
									<th scope="col">발주유형</th>
									<th scope="col">접수여부</th>
									<th scope="col">발주번호</th>
									<th scope="col">거래처명</th>
									<th scope="col">납기일자</th>
									<th scope="col">발주일자</th>
									<th scope="col">주문자</th>
									<th scope="col">공급자명</th>
									<th scope="col">상품명</th>
									<th scope="col">상품코드</th>
									<th scope="col">배송지</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<tr>
									<th scope="row" class="td_input">
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1">
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</th>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>
										<select class="form-control input-sm">
											<option></option>
										</select>
									</td>
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
									<td>
										<select class="form-control input-sm">
											<option></option>
										</select>
									</td>
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
					  <td>&nbsp;</td>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">품목</th>
									<th scope="col">품종</th>
									<th scope="col">규격</th>
									<th scope="col">입수</th>
									<th scope="col">발주수량</th>
									<th scope="col">낱개수량</th>
									<th scope="col">단위</th>
									<th scope="col">박스단가</th>
									<th scope="col">발주단가</th>
									<th scope="col">발주단위</th>
									<th scope="col">LOT</th>
									<th scope="col">세액</th>
									<th scope="col">발주금액</th>
									<th scope="col">입고형태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
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
					 <td>&nbsp;</td>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">문서번호</th>
									<th scope="col">도크정보</th>
									<th scope="col">센타구분</th>
									<th scope="col">바이어명</th>
									<th scope="col">센터입하일</th>
									<th scope="col">센터명</th>
									<th scope="col">납품구분</th>
									<th scope="col">기타</th>
									<th scope="col">접수APC (농협)</th>
									<th scope="col">생산지시번호</th>
								</tr>
							</thead>
							<tbody>
								<tr>
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
								</tr>
							</tbody>
						</table>

					</div>

				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>