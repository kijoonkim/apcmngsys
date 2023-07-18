<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title"> ▶ 포장실적등록</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
						<sbux-button id="btnInsert" name="btnInsert" uitype="normal" class="btn btn-sm btn-outline-danger" text="등록" onclick="fn_insert"></sbux-button>
						<sbux-button id="btnEnd" name="btnEnd" uitype="normal" class="btn btn-sm btn-outline-danger" text="종료"></sbux-button>
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
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC 명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcName" name="srch-inp-apcName" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-sltDate" name="srch-dtp-sltDate" uitype="range" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control fl_fixed mg_r5 wd_110"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" class="form-control fl_fixed mg_r5 wd_110"></sbux-select>
							</td>
							<td></td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" class="form-control fl_fixed mg_r5 wd_110"></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>포장대상내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 4%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 4%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
								<col style="width: 4%">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">선택</th>
									<th rowspan="2">선별번호/등급</th>
									<th rowspan="2">생산지시번호</th>
									<th rowspan="2">품종</th>
									<th rowspan="2">규격</th>
									<th rowspan="2">대표생산자</th>
									<th colspan="2">선별재고</th>
									<th colspan="2">포장지시</th>
									<th colspan="2">포장투입</th>
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
											<sbux-checkbox id="chk-1" name="chk-1" uitype="normal" class="check"></sbux-checkbox>
											<sbux-label id="lbl-chk-1" name="lbl-chk-1" uitype="normal" for-id="chk-1" class="check_label ta_i"></sbux-label>
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

								</tr>
								<tr>
									<th scope="row" class="td_input">
										<p class="ad_input_row">
											<sbux-checkbox id="chk-2" name="chk-2" uitype="normal" class="check"></sbux-checkbox>
											<sbux-label id="lbl-chk-2" name="lbl-chk-2" uitype="normal" for-id="chk-2" class="check_label ta_i"></sbux-label>
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

								</tr>
							</tbody>
						</table>
					<td>&nbsp;</td>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">포장일자</th>
				          	<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgDate" name="srch-dtp-pckgDate" uitype="popup" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<th scope="row">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pckg" name="srch-slt-pckg" uitype="single" unselected-text="선택" class="form-control fl_fixed mg_r5 wd_140"></sbux-select>
							</td>
							<td></td>
							<th scope="row">출하수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-shpgotAmt1" name="srch-inp-shpgotAmt1" type="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-shpgotAmt2" name="srch-inp-shpgotAmt2" type="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td>Kg</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="table-responsive tbl_scroll_sm">
				<div class="ad_section_top">
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장실적 내역</span></li>
					</ul>
				</div>

					<table class="table table-bordered table-hover tbl_col tbl_fixed">
						<caption>검색결과 목록</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 5%">
							<col style="width: 6%">
							<col style="width: 5%">
							<col style="width: 5%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 16%">
							<col style="width: 3%">
							<col style="width: 3%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">포장일자</th>
								<th scope="col">포장기</th>
								<th scope="col">규격</th>
								<th scope="col">포장수량</th>
								<th scope="col">포장중량</th>
								<th scope="col">상품등급</th>
								<th scope="col">창고</th>
								<th scope="col">비고</th>
								<th scope="col">라벨</th>
								<th scope="col">처리</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>2023-05-01</td>
									<td>&nbsp;</td>
									<td><sbux-select id="dtl-slt-spcfct1" name="dtl-slt-spcfct1" uitype="single" class="form-control input-sm"></sbux-select></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><sbux-select id="dtl-slt-gdsGrd1" name="dtl-slt-gdsGrd1" uitype="single" class="form-control input-sm"></sbux-select></td>
									<td><sbux-select id="dtl-slt-strg1" name="dtl-slt-strg1" uitype="single" class="form-control input-sm"></sbux-select></td>
									<td>&nbsp;</td>
									<td><sbux-button id="btnLblIssu" name="btnLblIssu" uitype="normal" class="btn btn-sm btn-outline-primary" text="발행"></sbux-button></td>
									<td><sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button></td>
								</tr>
								<tr>
									<td>2023-05-01</td>
									<td>&nbsp;</td>
									<td><sbux-select id="dtl-slt-spcfct2" name="dtl-slt-spcfct2" uitype="single" class="form-control input-sm"></sbux-select></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><sbux-select id="dtl-slt-gdsGrd2" name="dtl-slt-gdsGrd2" uitype="single" class="form-control input-sm"></sbux-select></td>
									<td><sbux-select id="dtl-slt-strg2" name="dtl-slt-strg2" uitype="single" class="form-control input-sm"></sbux-select></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><sbux-button id="btnAddPrfmnc" name="btnAddPrfmnc" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가"></sbux-button></td>
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