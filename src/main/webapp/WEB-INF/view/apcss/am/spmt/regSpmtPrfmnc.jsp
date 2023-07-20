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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ 출하실적 등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8"></td>
						</tr>
						<tr>
							<th scope="row">생산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" uitype="popup" ></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-EndPrdctnYmd" name="srch-dtp-EndPrdctnYmd" uitype="popup" ></sbux-datepicker>
							</td>
							<td class="td_input"></td>
							
							<th scope="row">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
						
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">상품</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<input type="radio" name="radio_dis" class="radio" id="radio_dis_on" disabled="disabled" checked>
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
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td><button type="button" class="btn btn-sm btn-outline-danger">재고조회</button></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>출하대상 내역</span></li>
						<li><span>선택수량/중량 : 99/99,999 kg</span></li>
						</ul>
					</div>
					<div class="ad_tbl_toplist">
					</div>
						<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 4%">
								<col style="width: 5%">
								<col style="width: 7%">
								<col style="width: 5%">
								<col style="width: 7%">
								<col style="width: 7%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">선택</th>
									<th rowspan="2">품종</th>
									<th rowspan="2">상품구분</th>
									<th rowspan="2">규격</th>
									<th rowspan="2">생산일자</th>
									<th rowspan="2">포장번호</th>
									<th colspan="2">재고</th>
									<th colspan="2">출하지시</th>
									<th colspan="2">출하</th>
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
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 10%">
						<col style="width: 7%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">지시번호</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">지시수량</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">출하일자</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<div class="dp_inline wd_125 va_m">
									<div class="input-group date">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" name="datepicker" placeholder="2023.01.01" class="form-control pull-right input-sm">
									</div>
								</div>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">거래처</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title=""></td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="입력" title="입력"></td>
							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td>
							<th scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">출하수량</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="평균" disabled="">
							</td>
							<td style="border-right: hidden;">KG</td>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
					     	<td>&nbsp;</td>
							<th scope="row">운송회사</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">포장구분</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>선택</option>
								</select>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td>&nbsp;</td>
							<th scope="row">배송처</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="선택" title="선택">
							<td style="border-right: hidden;">&nbsp;</td>
							<td>&nbsp;</td>
							<th scope="row">운임비용</th>
							<td class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="입력" title="입력">
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">비고</th>
							<td colspan= "8" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" title="">
							</td>
						</tr>
					</tbody>
				</table>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>출하 내역</span></li>
							<li><span>출하수량/중량 : 99/99,999 kg</span></li>
						</ul>
						<button type="button" class="btn btn-sm btn-outline-dark">내려받기</button>
						<button type="button" class="btn btn-sm btn-outline-dark">올리기</button>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
							<col style="width: 3%">
							<col style="width: 6%">
							<col style="width: 5%">
							<col style="width: 3%">
							<col style="width: 3%">
							<col style="width: 3%">
							<col style="width: 3%">
							<col style="width: 3%">
							<col style="width: 3%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 6%">
							<col style="width: 7%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">출하일자</th>
								<th scope="col">거래처</th>
								<th scope="col">품종</th>
								<th scope="col">규격</th>
								<th scope="col">상품</th>
								<th scope="col">등급</th>
								<th scope="col">수량</th>
								<th scope="col">중량</th>
								<th scope="col">운송회사</th>
								<th scope="col">차량번호</th>
								<th scope="col">배송처</th>
								<th scope="col">운임비용</th>
								<th scope="col">포장구분</th>
								<th scope="col">지시번호</th>
								<th scope="col">비고</th>
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
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
</html>