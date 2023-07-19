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
<!-- 			<div class="box-header"> -->
<!-- 				<h3 class="box-title"> ▶ 원물입고등록</h3> -->
<!-- 				<div class="ad_tbl_top"> -->
<!-- 					<div class="ad_tbl_toplist"> -->
<!-- 						<button type="button" class="btn btn-sm btn-primary">원물인식표</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">초기화</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">조회</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">등록</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">삭제</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">종료</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ 원물입고등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="button" class="btn btn-sm btn-primary">원물인식표</sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>
			
			
			<div>
			</div>
			<div class="box-body">
<!-- 				[pp] 검색 -->
<!-- 				<table class="table table-bordered tbl_row tbl_fixed"> -->
<!-- 					<caption>검색 조건 설정</caption> -->
<!-- 					<colgroup> -->
<!-- 						<col style="width: 3%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 1.5%"> -->
<!-- 						<col style="width: 3%"> -->
<!-- 						<col style="width: 3%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 						<col style="width: 3%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 						<col style="width: 2%"> -->
<!-- 					</colgroup> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<th scope="row">APC명</th> -->
<!-- 							<td colspan= "7" class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<th scope="row">입고일자</th> -->
<!-- 							<td colspan= "2" class="td_input" style="border-right: hidden;"> -->
<!-- 								<div class="dp_inline wd_125 va_m"> -->
<!-- 									<div class="input-group date"> -->
<!-- 										<div class="input-group-addon"> -->
<!-- 											<i class="fa fa-calendar"></i> -->
<!-- 										</div> -->
<!-- 										<input type="text" name="datepicker" placeholder="2023-01-01" class="form-control pull-right input-sm"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th scope="row">입고</th> -->
<!-- 							<td colspan="8" class="td_input" style="border-right: hidden;"> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1" value="일반매입" checked> -->
<!-- 									<label class="radio_label" for="radio1">일반매입</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">공선</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">매취</label> -->
<!-- 								</p> -->
<!-- 							</td> -->
<!-- 							<th scope="row">상품</th> -->
<!-- 							<td colspan="4" class="td_input" style="border-right: hidden;"> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1" value="일반" checked> -->
<!-- 									<label class="radio_label" for="radio1">일반</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">GAP</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">무농약</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">유기농</label> -->
<!-- 								</p> -->
<!-- 							</td> -->
<!-- 							<th scope="row">운송</th> -->
<!-- 							<td colspan="4" class="td_input" style="border-right: hidden;"> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio_dis" class="radio" id="radio_dis_on" checked> -->
<!-- 									<label class="radio_label" for="radio_dis_on">자가</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">용역</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">기타</label> -->
<!-- 								</p> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 						  	<th scope="row">품목</th> -->
<!-- 							<td colspan= "3" class="td_input" style="border-right: hidden;"> -->
<!-- 								<select class="form-control input-sm"> -->
<!-- 									<option>단일선택</option> -->
<!-- 								</select> -->
<!-- 							</td> -->
<!-- 	             						<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<th scope="row">생산지/품종</th> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
<!-- 							</td> -->
<!-- 							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td> -->
<!-- 							<td colspan= "2" class="td_input" style="border-right: hidden;"> -->
<!-- 								<select class="form-control input-sm"> -->
<!-- 									<option>단일선택</option> -->
<!-- 								</select> -->
<!-- 							</td> -->
<!-- 							<th scope="row">수량/중량</th> -->
<!-- 							<td class="td_input"style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
<!-- 							</td> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="평균" disabled> -->
<!-- 							</td> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
<!-- 							<td><label class="bold">Kg</label></td> -->
<!-- 						</tr> -->
<!-- 						 <tr> -->
<!-- 							<th scope="row">팔레트번호</th> -->
<!-- 							<td colspan= "3" class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
<!-- 							</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<th scope="row">박스종류</th> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<select class="form-control input-sm"> -->
<!-- 								</select> -->
<!-- 							</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<th scope="row">창고</th> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<select class="form-control input-sm"> -->
<!-- 									<option>선택</option> -->
<!-- 								</select> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th scope="row">차량/운임</th> -->
<!-- 							<td colspan= "2"class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
<!-- 							</td> -->
<!-- 							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">찾기</button></td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td colspan= "2" class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td><button class="btn btn-xs btn-outline-dark" type="button">등록</button></td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<th scope="row">비고</th> -->
<!-- 							<td colspan= "6" class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 						 	<th scope="row">육안등급</th> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 							<td style="border-right: hidden;"><button class="btn btn-xs btn-outline-dark" type="button">입력</button></td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<td style="border-right: hidden;">&nbsp;</td> -->
<!-- 							<th scope="row">계량번호</th> -->
<!-- 							<td colspan= "2" class="td_input" style="border-right: hidden;"> -->
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						</tbody> -->
<!-- 				</table> -->
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 1.5%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 1.5%">
						
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="15" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" disabled/>
							</td>
						</tr>
							<th scope="row">입고일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">입고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs1" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="일반매입" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs2" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="공선"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs3" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="매취"/>
								</p>
							</td>
							
							<th scope="row">상품</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds1" name="srch-rdo-gds" uitype="normal" class="radio_label" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds2" name="srch-rdo-gds" uitype="normal" class="radio_label" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds3" name="srch-rdo-gds" uitype="normal" class="radio_label" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds4" name="srch-rdo-gds" uitype="normal" class="radio_label" text="유기농"/>
								</p>
							</td>
						<tr>
							<th scope="row">운송</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
							<p class="ad_input_row">
								<sbux-radio id="srch-rdo-trsprt1" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="자가" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt2" name=""srch-rdo-trsprt"" uitype="normal" class="radio_label" text="용역"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt3" name=""srch-rdo-trsprt"" uitype="normal" class="radio_label" text="기타"/>
								</p>
								
								
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio_dis" class="radio" id="radio_dis_on" checked> -->
<!-- 									<label class="radio_label" for="radio_dis_on">자가</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">용역</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="radio" name="radio" class="radio" id="radio1"> -->
<!-- 									<label class="radio_label" for="radio1">기타</label> -->
<!-- 								</p> -->
							</td>
							<th scope="row">품목</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-gds" name="srch-slt-gds" class="form-control input-sm"/>
							</td>
	             			<td colspan="4" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">생산지/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-plor" name="srch-inp-plor" class="form-control input-sm"/>
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-plor" name="srch-btn-plor" class="btn btn-xs btn-outline-dark" text="찾기"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
						</tr>
						<tr>
							<th scope="row">수량/중량</th>
							<td colspan="4" class="td_input"style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qntt" name="srch-inp-qntt" class="form-control input-sm"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qnttAvg" name="srch-inp-qnttAvg" class="form-control input-sm" placeholder="평균" disabled/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="평균" disabled> -->
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wght" name="srch-inp-wght" class="form-control input-sm"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
							</td>
							<td colspan="3">
								<sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"/>
<!-- 								<label class="bold">Kg</label> -->
							</td>
							<th scope="row">팔레트번호</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
								<sbux-input uitype="text" id="srch-inp-pltNo" name="srch-inp-pltNo" class="form-control input-sm"/>
							</td>
							<td colspan="4" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-boxKnd" name="srch-slt-boxKnd" class="form-control input-sm"/>
<!-- 								<select class="form-control input-sm"> -->
<!-- 								</select> -->
							</td>
						</tr>
						<tr>
							<th scope="row">창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-wrhs" name="srch-slt-wrhs" class="form-control input-sm"/>
<!-- 								<select class="form-control input-sm"> -->
<!-- 									<option>선택</option> -->
<!-- 								</select> -->
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량/운임</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhcl" name="srch-inp-vhcl" class="form-control input-sm"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-vhcl" name="srch-btn-vhcl" class="btn btn-xs btn-outline-dark" text="찾기"/>
<!-- 								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button> -->
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-trsprt" name="srch-inp-trsprt" class="form-control input-sm" disabled/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-trsprt" name="srch-btn-trsprt" class="btn btn-xs btn-outline-dark" text="등록"/>
<!-- 								<button class="btn btn-xs btn-outline-dark" type="button">등록</button> -->
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">비고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="" title=""> -->
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">등급</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-rate" name="srch-slt-rate" class="form-control input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">계량번호</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghNo" name="srch-inp-wghNo" class="form-control input-sm" disabled/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
						<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　원물입고 내역</span></li>
						</ul>
					<div class="ad_tbl_toplist">
						<sbux-button uitype="normal" id="btnDwnld" name="btnDwnld" class="btn btn-xs btn-outline-dark" text="찾기"/>
						<sbux-button uitype="normal" id="btnUld" name="btnUld" class="btn btn-xs btn-outline-dark" text="찾기"/>
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">내려받기</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">올리기</button> -->
						</div>
					</div>
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea" style="height:340px;"></div>
						</div>
					</div>
<!-- 						<div class="table-responsive tbl_scroll_sm"> -->
<!-- 						<table class="table table-bordered table-hover tbl_col tbl_fixed"> -->
<!-- 							<caption>검색결과 목록</caption> -->
<!-- 							<colgroup> -->

<!-- 								<col style="width: 7%"> -->
<!-- 								<col style="width: 7%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 								<col style="width: 4%"> -->
<!-- 								<col style="width: 4%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 							</colgroup> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th scope="col">입고번호</th> -->
<!-- 									<th scope="col">팔레트번호</th> -->
<!-- 									<th scope="col">생산자</th> -->
<!-- 									<th scope="col">품목</th> -->
<!-- 									<th scope="col">품종</th> -->
<!-- 									<th scope="col">상품구분</th> -->
<!-- 									<th scope="col">입고구분</th> -->
<!-- 									<th scope="col">운송구분</th> -->
<!-- 									<th scope="col">등급1</th> -->
<!-- 									<th scope="col">등급2</th> -->
<!-- 									<th scope="col">등급3</th> -->
<!-- 									<th scope="col">등급4</th> -->
<!-- 									<th scope="col">등급5</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 						<td>&nbsp;</td> -->
<!-- 					</div> -->
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea2" style="height:340px;"></div>
						</div>
					</div>
<!-- 					<div class="table-responsive tbl_scroll_sm"> -->
<!-- 						<table class="table table-bordered table-hover tbl_col tbl_fixed"> -->
<!-- 							<caption>검색결과 목록</caption> -->
<!-- 							<colgroup> -->
<!-- 								<col style="width: 10%"> -->
<!-- 								<col style="width: 10%"> -->
<!-- 								<col style="width: 10%"> -->
<!-- 								<col style="width: 10%"> -->
<!-- 								<col style="width: 10%"> -->
<!-- 								<col style="width: 10%"> -->
<!-- 								<col style="width: 20%"> -->
<!-- 							</colgroup> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th scope="col">차량번호</th> -->
<!-- 									<th scope="col">박스수량</th> -->
<!-- 									<th scope="col">중량 Kg</th> -->
<!-- 									<th scope="col">박스종류</th> -->
<!-- 									<th scope="col">보관창고</th> -->
<!-- 									<th scope="col">계량번호</th> -->
<!-- 									<th scope="col">비고</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 						<td>&nbsp;</td> -->
<!-- 					</div> -->
					<div class="table-responsive tbl_scroll_sm">
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<caption>검색결과 목록</caption>
							<colgroup>
								<col style="width: 30%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">

							</colgroup>
							<thead>
								<tr>
									<th scope="col">합계</th>
									<th scope="col">수량</th>
									<td scope="col">&nbsp;</td>
									<th scope="col">Kg중량</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
						</table>

					</div>

				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>

<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
		fn_createGrid2();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };

		
	    SBGridProperties.columns = [
	        {caption: ["입고번호"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["팔레트번호번호"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea2';
	    SBGridProperties.id = 'inptCmndDsctnList2';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList2';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["차량번호"],		ref: 'msgKey',      type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["중량 Kg"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["박스종류"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
</script>
</html>