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
    <script src="/resource/script/common.js"></script>
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
						<col style="width: 3%">
						<col style="width: 10%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 15%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC코드</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<sbux-input id="apcCd" name="apcCd" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td scope="row" colspan="8">&nbsp;</td>
						</tr>
						<tr>
							<th rowspan="2">APC정보</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td scope="row">명칭</td>
							<td scope="row">
								<sbux-input id="apcNm" name="apcNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" colspan="2">주소</td>
							<td colspan="3"scope="row">
								<sbux-input id="addr" name="addr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" >전화번호</td>
							<td scope="row">
								<sbux-input id="telno" name="telno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row">팩스번호</td>
							<td scope="row">
								<sbux-input id="fxno" name="fxno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<td style="border-right: hidden;">&nbsp;</td>
							<td scope="row">사업번호</td>
							<td scope="row">
								<sbux-input id="apcBrno" name="apcBrno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" colspan="2">계좌번호</td>
							<td colspan="3"scope="row">
								<sbux-input id="actno" name="actno" uitype="text" class="form-control input-sm"></sbux-input>

							</td>
							<td scope="row">입금은행</td>
							<td class="td_input">
								<sbux-select id="comboBankNm" name="comboBankNm" uitype="single" jsondata-ref="jsonComboBankNm" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>

							<td scope="row">예금주명</td>
							<td scope="row">
								<sbux-input id="dpstr" name="dpstr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">APC구분</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2"class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="apcGubun1" name="apcGubun" uitype="normal" text="농협" text-left-padding="5px" text-right-padding="5px" class="radio_label"></sbux-radio>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="apcGubun2" name="apcGubun" uitype="normal" text="법인" text-left-padding="5px" text-right-padding="5px" class="radio_label"></sbux-radio>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">생산자 정산기준</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="9" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun1" name="prdcrGubun" uitype="normal" text="원물입고" text-left-padding="5px" text-right-padding="5px" class="radio_label"></sbux-radio>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun2" name="prdcrGubun" uitype="normal" text="선별완료" text-left-padding="5px" text-right-padding="5px" class="radio_label"></sbux-radio>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">사용자관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2"class="td_input">
								<sbux-button id="userAuthMngBtn" name="userAuthMngBtn" uitype="modal" text="사용자권한 설정" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="userAuthMngModal" onclick="fn_modal('userAuthMngBtn')"></sbux-button>
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
								<sbux-button id="fcltMngBtn" name="fcltMngBtn" uitype="modal" text="설비 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="fcltMngModal" onclick="fn_modal('fcltMngBtn')"></sbux-button>
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
								<sbux-button id="warehouseMngBtn" name="warehouseMngBtn" uitype="modal" text="창고 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="warehouseMngModal" onclick="fn_modal('warehouseMngBtn')"></sbux-button>
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
								<sbux-button id="itemMngBtn" name="itemMngBtn" uitype="modal" text="품목 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="itemMngModal" onclick="fn_modal('itemMngBtn')"></sbux-button>
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
								<sbux-button id="pltBkBtn" name="pltBkBtn" uitype="modal" text="팔레트/박스 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="pltBkMngModal" onclick="fn_modal('pltBkMngBtn')"></sbux-button>
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
								<sbux-button id="otrdEyeBtn" name="otrdEyeBtn" uitype="modal" text="원물육안등급 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="otrdEyeMngModal" onclick="fn_modal('otrdEyeMngBtn')"></sbux-button>
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
								<sbux-button id="vhclBtn" name="vhclBtn" uitype="modal" text="입고차량/운임 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="vhclMngModal" onclick="fn_modal('vhclMngBtn')"></sbux-button>
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
								<sbux-button id="spmtTrsprtBtn" name="spmtTrsprtBtn" uitype="modal" text="출하 운송회사 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="spmtTrsprtMngModal" onclick="fn_modal('spmtTrsprtBtn')"></sbux-button>
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
								<sbux-button id="cnptMngBtn" name="cnptMngBtn" uitype="modal" text="거래처 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="cnptMngModal" onclick="fn_modal('cnptMngBtn')"></sbux-button>
							</td>
							<td>
								필수
							</td>
							<td>&nbsp;</td>
							<td colspan="4">
								설명) 거래처 정보 및 발주서 접속정보 관리(대형마트 발주서 정보는 선택사항)
							</td>
						</tr>
						<tr>
							<th scope="row">작업자 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="oprtrMngBtn" name="oprtrMngBtn" uitype="modal" text="작업자 등록" style="width:100%; height:30px;" class="btn btn-sm btn-outline-dark" target-id="oprtrMngModal" onclick="fn_modal('oprtrMngBtn')"></sbux-button>
							</td>
							<td>
							</td>
							<td>&nbsp;</td>
							<td colspan="4">
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
		</div>
	</section>

	<!-- 사용자권한 설정 Modal -->
    <div>
        <sbux-modal id="userAuthMngModal" name="userAuthMngModal" uitype="middle" header-title="APC사용자 권한설정" body-html-id="userAuthMngModalBody" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="userAuthMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/apcUserMngPopup.jsp"></jsp:include>
    </div>
    <!-- 설비 등록 Modal -->
    <div>
        <sbux-modal id="fcltMngModal" name="fcltMngModal" uitype="middle" header-title="설비 등록" body-html-id="fcltMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="fcltMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/fcltMngPopup.jsp"></jsp:include>
    </div>
    <!-- 창고 등록 Modal -->
    <div>
        <sbux-modal id="warehouseMngModal" name="warehouseMngModal" uitype="middle" header-title="창고 등록" body-html-id="warehouseMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="warehouseMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/warehouseMngPopup.jsp"></jsp:include>
    </div>
    <!--품목 등록 Modal -->
    <div>
        <sbux-modal id="itemMngModal" name="itemMngModal" uitype="middle" header-title="품목 등록" body-html-id="itemMngmodalBody" footer-is-close-button="false"style="width:1200px"></sbux-modal>
    </div>
    <div id="itemMngmodalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/itemMngPopup.jsp"></jsp:include>
    </div>
    <!-- 팔레트/박스 등록 Modal -->
    <div>
        <sbux-modal id="pltBkMngModal" name="pltBkMngModal" uitype="middle" header-title="팔레트/박스 등록" body-html-id="pltBkMngModalBody" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="pltBkMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/pltBkMngPopup.jsp"></jsp:include>
    </div>
    <!-- 원물육안등급 Modal -->
    <div>
        <sbux-modal id="otrdEyeMngModal" name="otrdEyeMngModal" uitype="middle" header-title="원물육안등급 등록" body-html-id="otrdEyeMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="otrdEyeMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/otrdEyeMngPopup.jsp"></jsp:include>
    </div>
    <!-- 입고차량정보 등록 Modal -->
    <div>
        <sbux-modal id="vhclMngModal" name="vhclMngModal" uitype="middle" header-title="입고차량정보 등록" body-html-id="vhclMngModalBody" footer-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="vhclMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/vhclMngPopup.jsp"></jsp:include>
    </div>
    <!-- 출하운송회사 등록 Modal -->
    <div>
        <sbux-modal id="spmtTrsprtMngModal" name="spmtTrsprtMngModal" uitype="middle" header-title="출하운송회사 등록" body-html-id="spmtTrsprtMngModalBody" footer-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="spmtTrsprtMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/spmtTrsprtMngPopup.jsp"></jsp:include>
    </div>
    <!-- 입고차량정보 등록 Modal -->
    <div>
        <sbux-modal id="cnptMngModal" name="cnptMngModal" uitype="middle" header-title="거래처 등록" body-html-id="cnptMngModalBody" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="cnptMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/cnptMngPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComboBankNm = [];
	console.log(jsonComboBankNm);
	//gfn_setComCdSelect('comboBankNm', jsonComboBankNm ,	'BANK_CD', '0000');		// 검색 조건(시스템구분)

	console.log(jsonComboBankNm);
	jsonComboBankNm = comCdLoad(jsonComboBankNm, 'SYS_ID', '1');

	console.log(jsonComboBankNm);
	jsonComboBankNm.push({text : '01', value : '01'});

	console.log(jsonComboBankNm);
//	var ttt = SBUxMethod.get('comboBankNm')
	console.log();
	// 공통코드 COMBO 호출
    function comCdLoad(jsonComboData ,cdId, type){
    	jsonComboData = [];
    	fetch("/co/cd/comBoCdDtls", {
  		  	method: "POST",
  		  	headers: {
  		    	"Content-Type": "application/json",
  		  	},
  		  	body: JSON.stringify({
  		  		cdId: cdId
  			}),
  		})
  		.then((response) => response.json())
  		.then(
				(data) => {
					data.resultList.forEach((item, index) => {
						var cdVlList ={};
						if(type === '1'){
							cdVlList = {
								text: item.cdVlNm,
								value: item.cdVl
							}
						}else if(type === '2'){
							cdVlList = {
								label: item.cdVlNm,
								value: item.cdVl
							}
						}
						jsonComboData.push(cdVlList);

					});
				}
  		);
    	return jsonComboData;
    }


</script>
</html>