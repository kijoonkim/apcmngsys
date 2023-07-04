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
									<sbux-radio id="apcGubun1" name="apcGubun" uitype="normal" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">농협</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="apcGubun2" name="apcGubun" uitype="normal" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">법인</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">생산자 정산기준</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="9" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun1" name="prdcrGubun" uitype="normal"  class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">원물입고</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun2" name="prdcrGubun" uitype="normal"  class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">선별완료</label>
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
			</div>

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
									<sbux-checkbox id="wghMngYn" name="wghMngYn" uitype="normal"></sbux-checkbox>
									<label class="check_label" for="check_default" >사용</label>
								</p>
							</td>
							<td>
		                     	<p class="ad_input_row">
									<sbux-checkbox id="wghMblUseYn" name="wghMblUseYn" uitype="normal" ></sbux-checkbox>
				                    <label class="check_label" for="check_default">테블릿사용</label>
		                  	</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="wghIdntyDocPblcnYn" name="wghIdntyDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">계량확인서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th rowspan="2">원물입고관리</th>
							<td rowspan="2">
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsMngYn" name="rawMtrWrhsMngYn" uitype="normal" checked ></sbux-checkbox>
									<label class="check_label" for="check_default" >사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsMblUseYn" name="rawMtrWrhsMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrIdentTagPblcnYn" name="rawMtrIdentTagPblcnYn" uitype="normal" checked></sbux-checkbox>
									<label class="check_label" for="check_default">원물인식표 발행</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pltBxMngYn" name="pltBxMngYn" uitype="normal" checked></sbux-checkbox>
									<label class="check_label" for="check_default">팔레트/박스정보관리</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsPlanMngYn" name="rawMtrWrhsPlanMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >원물입고계획관리</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="gdsWrhsMngYn" name="gdsWrhsMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">상품입고관리</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별지시관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortCmndMngYn" name="sortCmndMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >사용</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortCmndDocPblcnYn" name="sortCmndDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">선별지시서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>포장지시관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgCmndMngYn" name="pckgCmndMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgCmndDocPblcnYn" name="pckgCmndDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">포장지시서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortMngYn" name="sortMngYn" uitype="normal" checked></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortMblUseYn" name="sortMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿사용 (선별투입)</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortLabelPblcnYn" name="sortLabelPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">선별라벨 발행</label>
								</p>
							</td>
							<td><p class="ad_input_row">
									<sbux-checkbox id="sortIdntyDocPblcnYn" name="sortIdntyDocPblcnYn" uitype="normal" checked></sbux-checkbox>
									<label class="check_label" for="check_default">선별확인서 발행</label>
								</p>
							</td>
						</tr>
						<tr>
							<th>포장관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgMngYn" name="pckgMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgMblUseYn" name="pckgMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿사용 (포장투입)</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="gdsLblPblcnYn" name="gdsLblPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">상품라벨 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하지시관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtCmndMngYn" name="spmtCmndMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p style="color:#ff0000">발주정보관리 필수</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtCmndDocPblcnYn" name="spmtCmndDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">출하지시서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtMngYn" name="spmtMngYn" uitype="normal" checked></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtMblUseYn" name="spmtMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿 사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtDocPblcnYn" name="spmtDocPblcnYn" uitype="normal" checked></sbux-checkbox>
									<label class="check_label" for="check_default">송품장발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>정산관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="clclnMngYn" name="clclnMngYn" uitype="normal" ></sbux-checkbox>
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
									<sbux-checkbox id="ordrMngYn" name="ordrMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="ordrPckgCmndLnkgYn" name="ordrPckgCmndLnkgYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">포장지시 발주정보 연결</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>농협전송관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="trsmMngYn" name="trsmMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortDataTrsmYn" name="sortDataTrsmYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">선별정보 전송</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="clclnDataTrsmYn" name="clclnDataTrsmYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">정산자료 전송</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>생산작업자관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="test1" name="test1" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="test2" name="test2" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">작업자 선별실적</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="test3" name="test3" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">작업자 포장실적</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
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
        <sbux-modal id="pltBkMngModal" name="pltBkMngModal" uitype="middle" header-title="팔레트/박스 등록" body-html-id="pltBkMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
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
        <sbux-modal id="vhclMngModal" name="vhclMngModal" uitype="middle" header-title="입고차량정보 등록" body-html-id="vhclMngModalBody" footer-is-close-button="false" style="width:1000px"></sbux-modal>
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
	var jsonComboGridBankNm = [];
	gfn_setComCdSelect('comboBankNm', jsonComboBankNm ,	'BANK_CD', '0000');		// 검색 조건(시스템구분)

	function fn_modal(targetName){
		if(targetName == "userAuthMngBtn"){
			fn_userAuthMngCreateGrid();
		}
		if(targetName == 'fcltMngBtn'){
			fn_fcltMngCreateGrid();
		}
		if(targetName == 'warehouseMngBtn'){
			fn_warehouseMngCreateGrid();
		}
		if(targetName == 'itemMngBtn'){
			fn_itemMngCreateGrid();
            fn_itemMngCreateGrid2();
            fn_itemMngCreateGrid_1();
            fn_itemMngCreateGrid_2();
            fn_itemMngCreateGrid_3();
            fn_itemMngCreateGrid_4();
		}
		if(targetName == 'pltBkMngBtn'){
			fn_pltMngCreateGrid();
			fn_bkMngCreateGrid();
			fn_pckgMngCreateGrid();
		}
		if(targetName == 'otrdEyeMngBtn'){
			fn_otrdEyeMngCreateGrid();
		}
		if(targetName == 'vhclMngBtn'){
			fn_vhclMngCreateGrid();
			fn_trsprtMngCreateGrid();
		}
		if(targetName == 'spmtTrsprtBtn'){
			fn_spmtTrsprtMngCreateGrid();
		}if(targetName == 'cnptMngBtn'){
			fn_cnptMngCreateGrid();
			fn_ordrMngCreateGrid();
		}
	}

	// APC사용자 권한설정
    var userAuthMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_userAuthMngCreateGrid() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'userAuthMngGridArea';
	    SBGridProperties.id = 'userAuthMngDatagrid';
	    SBGridProperties.jsonref = 'userAuthMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["순번"], 		ref: 'no',  		type:'output',  width:'50px',     style:'text-align:center'},
            {caption: ["사용자 코드"], 	ref: 'userCd',  	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["사용자 명"], 	ref: 'userNm',   	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["직책"], 		ref: 'jbttlNm',   	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["담당업무"], 	ref: 'tkcgTaskNm',  type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["권한"], 		ref: 'chrgdCertYn', type:'button',  width:'100px',    style:'text-align:center', typeinfo : {buttonvalue : '사용승인', 	callback : fn_Approval}},
            {caption: ["비밀번호"], 	ref: 'lckYn',   	type:'button',  width:'100px',    style:'text-align:center', typeinfo : {buttonvalue : '초기화', 	callback : fn_PwReSet}},
            {caption: ["사용유무"], 	ref: 'useYn',   	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk',   	type:'output',  width:'150px',    style:'text-align:center'}
        ];
        window.userAuthMngDatagrid = _SBGrid.create(SBGridProperties);
    }
    function fn_Approval() {
    	console.log("사용승인");
    	var nRow = userAuthMngDatagrid.getRow();
    	var nCol = userAuthMngDatagrid.getCol();
    }
    function fn_PwReSet(){
    	console.log("비밀번호 초기화");
    }

    // 설비 등록
    var fcltMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_fcltMngCreateGrid() {
    	fcltMngGridData = [];
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'fcltMngGridArea';
	    SBGridProperties.id = 'fcltMngDatagrid';
	    SBGridProperties.jsonref = 'fcltMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["순번"], 		ref: 'no',  		type:'input',  width:'50px',     style:'text-align:center'},
            {caption: ["설비 코드"], 	ref: 'fcltCd',  	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["설비 명"], 		ref: 'fcltNm',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk',   		type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"fcltMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"fcltMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
            }}
        ];
        window.fcltMngDatagrid = _SBGrid.create(SBGridProperties);
        fcltMngDatagrid.addRow();
    }

    // 창고 등록
    var warehouseMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_warehouseMngCreateGrid() {
    	warehouseMngGridData = [];
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'warehouseMngGridArea';
	    SBGridProperties.id = 'warehouseMngDatagrid';
	    SBGridProperties.jsonref = 'warehouseMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["순번"], 		ref: 'no',  			type:'input',  width:'50px',     style:'text-align:center'},
            {caption: ["창고 코드"], 	ref: 'warehouseSeCd',  	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["창고 명"], 		ref: 'warehouseSeNm',   type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk',   			type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["처리"], 		ref: 'delYn',   		type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"warehouseMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"warehouseMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
            }}
        ];
        window.warehouseMngDatagrid = _SBGrid.create(SBGridProperties);
        warehouseMngDatagrid.addRow();
    }
    function fn_deleteWarehouse(){

    }


    var gridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_itemMngCreateGrid() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemMngGridArea';
	    SBGridProperties.id = 'datagrid';
	    SBGridProperties.jsonref = 'gridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center'},
            {caption: ["명칭"], ref: 'field2',  type:'output',  width:'55%',    style:'text-align:left'},
            {caption: ["선택"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow(\"ADD\", " + nRow + ")'>선택</button>";
                }
            }
        ];
        datagrid = _SBGrid.create(SBGridProperties);
    }
    function fn_setGridData(args) {
    var params = $('#frm').serialize();
        console.log("form data ::::: " + params);
        gridData = [
            {'field1': 'code001', 'field2': '명칭001'},
            {'field1': 'code002', 'field2': '명칭002'},
            {'field1': 'code003', 'field2': '명칭003'},
            {'field1': 'code004', 'field2': '명칭004'},
            {'field1': 'code005', 'field2': '명칭005'}
        ];
        datagrid.refresh();
    }

    // Row 추가 및 삭제 기능
    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngDatagrid.setCellData(nRow, nCol, "N", true);
            	cnptMngDatagrid.addRow(true);
            }else if (grid === "fcltMngDatagrid") {
            	fcltMngDatagrid.setCellData(nRow, nCol, "N", true);
            	fcltMngDatagrid.addRow(true);
            }else if (grid === "warehouseMngDatagrid") {
            	warehouseMngDatagrid.setCellData(nRow, nCol, "N", true);
            	warehouseMngDatagrid.addRow(true);
            }else if(grid === "pltMngDatagrid"){
            	pltMngDatagrid.setCellData(nRow, nCol, "N", true);
            	pltMngDatagrid.addRow(true);
            }else if(grid === "bkMngDatagrid"){
            	bkMngDatagrid.setCellData(nRow, nCol, "N", true);
            	bkMngDatagrid.addRow(true);
            }else if(grid === "pckgMngDatagrid"){
            	pckgMngDatagrid.setCellData(nRow, nCol, "N", true);
            	pckgMngDatagrid.addRow(true);
            }else if(grid === "trsprtMngDatagrid"){
            	trsprtMngDatagrid.setCellData(nRow, nCol, "N", true);
            	trsprtMngDatagrid.addRow(true);
            }else if(grid === "vhclMngDatagrid"){
            	vhclMngDatagrid.setCellData(nRow, nCol, "N", true);
            	vhclMngDatagrid.addRow(true);
            }else if(grid === "spmtTrsprtMngDatagrid"){
            	spmtTrsprtMngDatagrid.setCellData(nRow, nCol, "N", true);
            	spmtTrsprtMngDatagrid.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngDatagrid.deleteRow(nRow);
            }else if (grid === "fcltMngDatagrid") {
            	fcltMngDatagrid.deleteRow(nRow);
            }else if (grid === "warehouseMngDatagrid") {
            	warehouseMngDatagrid.deleteRow(nRow);
            }else if (grid === "pltMngDatagrid") {
            	pltMngDatagrid.deleteRow(nRow);
            }else if (grid === "bkMngDatagrid") {
            	bkMngDatagrid.deleteRow(nRow);
            }else if (grid === "pckgMngDatagrid") {
            	pckgMngDatagrid.deleteRow(nRow);
            }else if (grid === "trsprtMngDatagrid") {
            	trsprtMngDatagrid.deleteRow(nRow);
            }else if (grid === "vhclMngDatagrid") {
            	vhclMngDatagrid.deleteRow(nRow);
            }else if (grid === "spmtTrsprtMngDatagrid") {
            	spmtTrsprtMngDatagrid.deleteRow(nRow);
            }
        }
    }
    //grid2 초기화
    var grid2; // 그리드를 담기위한 객체 선언
    var gridData2 = []; // 그리드의 참조 데이터 주소 선언
    function fn_itemMngCreateGrid2() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemMngGridArea2';
	    SBGridProperties.id = 'datagrid2';
	    SBGridProperties.jsonref = 'gridData2';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"],     ref: 'field1',  type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["명칭"],     ref: 'field2',  type:'output',  width:'25%',    style:'text-align:left',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return '<a href="javascript:void(0);" onClick="fn_selectRow(' + nRow + ');">' + strValue + '</a>';
                }
            },
            {caption: ["품종등록"], ref: 'field3',  type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["등급등록"], ref: 'field4',  type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["규격등록"], ref: 'field5',  type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["처리"],     ref: 'empty',   type:'output',  width:'10%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid2 = _SBGrid.create(SBGridProperties);
    }

    //sub grid 초기화
    var grid_1, grid_2, grid_3, grid_4; // 그리드를 담기위한 객체 선언
    var gridData_1 = [], gridData_2 = [], gridData_3 = [], gridData_4 = []; // 그리드의 참조 데이터 주소 선언
    function fn_itemMngCreateGrid_1() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemMngGridAreaSub1';
	    SBGridProperties.id = 'datagrid_1';
	    SBGridProperties.jsonref = 'gridData_1';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["명칭"], ref: 'field2',  type:'input',   width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_1\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_1 = _SBGrid.create(SBGridProperties);
    }

    function fn_itemMngCreateGrid_2() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemMngGridAreaSub2';
	    SBGridProperties.id = 'datagrid_2';
	    SBGridProperties.jsonref = 'gridData_2';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["명칭"], ref: 'field2',  type:'input',  width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_2\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_2 = _SBGrid.create(SBGridProperties);
    }
    function fn_itemMngCreateGrid_3() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemMngGridAreaSub3';
	    SBGridProperties.id = 'datagrid_3';
	    SBGridProperties.jsonref = 'gridData_3';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["등급명"], ref: 'field2',  type:'input',  width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_3\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_3 = _SBGrid.create(SBGridProperties);
    }

    function fn_itemMngCreateGrid_4() {
    	let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemMngGridAreaSub4';
	    SBGridProperties.id = 'datagrid_4';
	    SBGridProperties.jsonref = 'gridData_4';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], ref: 'field1',  type:'output',  width:'25%',    style:'text-align:center;background-color:#E0E0E0'},
            {caption: ["규격명"], ref: 'field2',  type:'input',  width:'55%',    style:'text-align:left'},
            {caption: ["처리"], ref: 'empty',   type:'output',  width:'20%',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' onClick='fn_procRow2(\"DEL\", \"grid_3\", " + nRow + ")'>삭제</button>";
                }
            }
        ];
        datagrid_4 = _SBGrid.create(SBGridProperties);
    }
    //Set Grid Data
    function fn_setGridData_1(obj) {
        console.log("obj ::::: " + obj);
        //var params = $('#frm').serialize();
        //console.log("form data ::::: " + params);
        gridData_1 = [
            {'field1': 'code001', 'field2': '품종명칭001'},
            {'field1': 'code002', 'field2': '품종명칭002'}
        ];
        datagrid_1.refresh();
    }
    function fn_setGridData_2(obj) {
        var params = JSON.stringify(obj);
        console.log("data ::::: " + params);
        gridData_2 = [
            {'field1': 'code001', 'field2': '등급명001'}
        ];
        datagrid_2.refresh();
    }
    function fn_setGridData_3(obj) {
        var params = JSON.stringify(obj);
        console.log("data ::::: " + params);
        gridData_3 = [];
        datagrid_3.refresh();
    }

	var combofilteringData = [
		{'label': 'Y', 'value': 'Y'},
		{'label': 'N', 'value': 'N'}
	]

	// 팔레트/박스 등록
	// 팔레트 정보
    var pltMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_pltMngCreateGrid() {
    	pltMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'pltMngGridArea';
	    SBGridProperties.id = 'pltMngDatagrid';
	    SBGridProperties.jsonref = 'pltMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["팔레트 정보","코드"], 		ref: 'cd',  		type:'input',  width:'100px',     style:'text-align:center'},
            {caption: ["팔레트 정보","팔레트 명"], 	ref: 'pltNm',  		type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["팔레트 정보","단중 (KG)"], 	ref: 'unitWght',   	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["팔레트 정보","사용유무"], 	ref: 'useYn',   	type:'combo',  width:'100px',    style:'text-align:center',
            			typeinfo : {ref:'combofilteringData', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
            {caption: ["팔레트 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"pltMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"pltMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.pltMngDatagrid = _SBGrid.create(SBGridProperties);
        pltMngDatagrid.addRow();
    }
    function fn_deletePltBk(){

    }

    // 박스 정보
    var bkMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_bkMngCreateGrid() {
    	bkMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'bkMngGridArea';
	    SBGridProperties.id = 'bkMngDatagrid';
	    SBGridProperties.jsonref = 'bkMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["박스 정보","코드"], 		ref: 'cd',  		type:'input',  width:'100px',     style:'text-align:center'},
            {caption: ["박스 정보","박스 명"], 		ref: 'pltNm',  		type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["박스 정보","단중 (KG)"], 	ref: 'unitWght',   	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["박스 정보","사용유무"], 	ref: 'useYn',   	type:'combo',  width:'100px',    style:'text-align:center',
    					typeinfo : {ref:'combofilteringData', label:'label', value:'value', displayui : true}},
   			{caption: ["박스 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"bkMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"bkMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.bkMngDatagrid = _SBGrid.create(SBGridProperties);
        bkMngDatagrid.addRow();
    }

    // 상품출하
    var pckgMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_pckgMngCreateGrid() {
    	pckgMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'pckgMngGridArea';
	    SBGridProperties.id = 'pckgMngDatagrid';
	    SBGridProperties.jsonref = 'pckgMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], 				ref: 'cd',  		type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["출하 포장단위 명"], 	ref: 'pckgNm',  	type:'input',  width:'350px',    style:'text-align:center'},
            {caption: ["사용유무"], 			ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
    					typeinfo : {ref:'combofilteringData', label:'label', value:'value', displayui : true}},
   			{caption: ["처리"], 				ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"pckgMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"pckgMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.pckgMngDatagrid = _SBGrid.create(SBGridProperties);
        pckgMngDatagrid.addRow();
    }

    // 원물육안 등급
    var otrdEyeMngGridData = [
    	{"cd": "01", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "02", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "03", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "04", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "05", "otrdEyeNm" : "", "useYn":"Y"}
    ]; // 그리드의 참조 데이터 주소 선언
    function fn_otrdEyeMngCreateGrid() {
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'otrdEyeMngGridArea';
	    SBGridProperties.id = 'otrdEyeMngDatagrid';
	    SBGridProperties.jsonref = 'otrdEyeMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], 				ref: 'cd',  		type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["출하 포장단위 명"], 	ref: 'otrdEyeNm',  	type:'output',  width:'350px',    style:'text-align:center'},
            {caption: ["사용유무"], 			ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
    					typeinfo : {ref:'combofilteringData', label:'label', value:'value', displayui : true}}
        ];
        window.otrdEyeMngDatagrid = _SBGrid.create(SBGridProperties);
    }


    // 입고차량정보 등록
    var vhclMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_vhclMngCreateGrid() {
    	vhclMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'vhclMngGridArea';
	    SBGridProperties.id = 'vhclMngDatagrid';
	    SBGridProperties.jsonref = 'vhclMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["차량번호"], 	ref: 'vhclNo',  type:'input',  width:'120px',    style:'text-align:center'},
            {caption: ["기사명"], 		ref: 'drvrNm',  type:'input',  width:'80px',    style:'text-align:center'},
            {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
            			typeinfo : {ref:'jsonComboGridBankNm', label:'label', value:'value', displayui : true}},
            {caption: ["계좌번호"], 	ref: 'actno',  	type:'input',  width:'180px',    style:'text-align:center'},
            {caption: ["예금주"], 		ref: 'dpstr',  	type:'input',  width:'80px',    style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk',  	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["처리"], 		ref: 'delYn',   type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"vhclMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"vhclMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.vhclMngDatagrid = _SBGrid.create(SBGridProperties);
        vhclMngDatagrid.addRow();
    }

    // 운송지역별 운임비용 등록
    var trsprtMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_trsprtMngCreateGrid() {
    	trsprtMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'trsprtMngGridArea';
	    SBGridProperties.id = 'trsprtMngDatagrid';
	    SBGridProperties.jsonref = 'trsprtMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], 			ref: 'trsprtRgnCd',  	type:'input',  width:'100px',     style:'text-align:center'},
            {caption: ["운송지역"], 		ref: 'trsprtRgnNm',  	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["운송비용(원)"], 	ref: 'trsprtCst',  		type:'input',  width:'200px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["비고"], 			ref: 'rmrk',  			type:'input',  width:'300px',    style:'text-align:center'},
            {caption: ["처리"], 			ref: 'delYn',   		type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"trsprtMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"trsprtMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.trsprtMngDatagrid = _SBGrid.create(SBGridProperties);
        trsprtMngDatagrid.addRow();
    }


    // 출하운송회사 등록
    var spmtTrsprtMngGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_spmtTrsprtMngCreateGrid() {
    	spmtTrsprtMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'spmtTrsprtMngGridArea';
	    SBGridProperties.id = 'spmtTrsprtMngDatagrid';
	    SBGridProperties.jsonref = 'spmtTrsprtMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], 			ref: 'trsprtCoCd',  type:'input',  width:'80px',     style:'text-align:center'},
            {caption: ["운송회사명"], 		ref: 'trsprtCoNm',  type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["전화번호"], 		ref: 'telno',  		type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["팩스번호"], 		ref: 'fxno',  		type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["비고"], 			ref: 'rmrk',  		type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["처리"], 			ref: 'delYn',   	type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"spmtTrsprtMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"spmtTrsprtMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.spmtTrsprtMngDatagrid = _SBGrid.create(SBGridProperties);
        spmtTrsprtMngDatagrid.addRow();
    }

    var cnptMngGridData = [
    ]; // 그리드의 참조 데이터 주소 선언
    function fn_cnptMngCreateGrid() {
    	cnptMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'cnptMngGridArea';
	    SBGridProperties.id = 'cnptMngDatagrid';
	    SBGridProperties.jsonref = 'cnptMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], 		ref: 'cnptCd',  type:'input',  width:'80px',     style:'text-align:center'},
            {caption: ["거래처명"], 	ref: 'cnptNm',  type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["유형"], 		ref: 'typeCd',  type:'combo',  width:'100px',    style:'text-align:center'},
            {caption: ["사업자번호"], 	ref: 'brno',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["담당자"], 		ref: 'picNm',  	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["전화번호"], 	ref: 'telno',  	type:'input',  width:'120px',    style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk',  	type:'input',  width:'300px',    style:'text-align:center'},
            {caption: ["처리"], 		ref: 'delYn',   type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"cnptMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"cnptMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }}
        ];
        window.cnptMngDatagrid = _SBGrid.create(SBGridProperties);
	    cnptMngDatagrid.addRow();
    }


    var ordrMngGridData = [
    	{"martNm": "이마트", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "노브랜드", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "트레이더스", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "GS리테일(슈파)", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "홈플러스", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "에브리데이", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    	{"martNm": "SSG", "ordrUrl" : "", "userId":"", "userPw":"", "useYn":"","prcsDt":""},
    ]; // 그리드의 참조 데이터 주소 선언

    function fn_ordrMngCreateGrid() {
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'ordrMngGridArea';
	    SBGridProperties.id = 'ordrMngDatagrid';
	    SBGridProperties.jsonref = 'ordrMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["대형마트 명"], 		ref: 'martNm',  	type:'input',  width:'150px',     style:'text-align:center'},
            {caption: ["발주정보 URL"], 	ref: 'ordrUrl',  	type:'input',  width:'250px',    style:'text-align:center'},
            {caption: ["사용자ID"], 		ref: 'userId',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["패스워드"], 		ref: 'userPw',  	type:'input',  width:'150px',    style:'text-align:center'},
            {caption: ["사용유무"], 		ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'combofilteringData', label:'label', value:'value', displayui : true}},
            {caption: ["최종처리일시"], 	ref: 'prcsDt',  	type:'input',  width:'150px',    style:'text-align:center'}
        ];
        window.ordrMngDatagrid = _SBGrid.create(SBGridProperties);
    }
</script>
</html>