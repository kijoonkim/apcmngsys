<%
 /**
  * @Class Name : fcltSortMchnOperInfoReg.jsp
  * @Description : 3.4.선별기운영기간 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호		최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 선별기운영기간 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
					<col style="width: 11%">
					<col style="width: 22%">
					<col style="width: 50px">
					<col style="width: 11%">
					<col style="width: 22%">
					<col style="width: 187px">
					<col style="width: 100px">
				<tbody>
					<tr>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<!--
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectStMcOpIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							 -->
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>

			<br>
			<!-- 진척도 추가 -->
			<%@ include file="prgrs/apcPrgrs.jsp" %>
			<br>
			<div><label>선별기운영기간 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 22%">
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

					<col style="width: 6%">
					<col style="width: 6%">
					<col style="width: 6%">
					<col style="width: 6%">
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center">선별기운영기간</th>
						<th class="text-center">운영안함</th>
						<th class="text-center">전체선택</th>
						<th class="text-center">1월</th>
						<th class="text-center">2월</th>
						<th class="text-center">3월</th>
						<th class="text-center">4월</th>
						<th class="text-center">5월</th>
						<th class="text-center">6월</th>
						<th class="text-center">7월</th>
						<th class="text-center">8월</th>
						<th class="text-center">9월</th>
						<th class="text-center">10월</th>
						<th class="text-center">11월</th>
						<th class="text-center">12월</th>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm1">품목1</span>
							<br>
							운영기간
							<sbux-input id="dtl-inp-itemChk1" name="dtl-inp-itemChk1" uitype="hidden"></sbux-input>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_non" name="warehouseSeCd_chk_mon_1_non" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectNon(this,1)"></sbux-checkbox>
								<label class="check_label" for="warehouseSeCd_chk_mon" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_1" name="warehouseSeCd_chk_mon_1_1" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectAll(this,1)"></sbux-checkbox>
								<label class="check_label" for="warehouseSeCd_chk_mon" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_2" name="warehouseSeCd_chk_mon_1_2" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_3" name="warehouseSeCd_chk_mon_1_3" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_4" name="warehouseSeCd_chk_mon_1_4" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_5" name="warehouseSeCd_chk_mon_1_5" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_6" name="warehouseSeCd_chk_mon_1_6" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_7" name="warehouseSeCd_chk_mon_1_7" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_8" name="warehouseSeCd_chk_mon_1_8" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_9" name="warehouseSeCd_chk_mon_1_9" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_10" name="warehouseSeCd_chk_mon_1_10" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_11" name="warehouseSeCd_chk_mon_1_11" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_12" name="warehouseSeCd_chk_mon_1_12" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_1_13" name="warehouseSeCd_chk_mon_1_13" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelect(this,1)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm2">품목2</span>
							<br>
							운영기간
							<sbux-input id="dtl-inp-itemChk2" name="dtl-inp-itemChk2" uitype="hidden"></sbux-input>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_non" name="warehouseSeCd_chk_mon_2_non" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectNon(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_1" name="warehouseSeCd_chk_mon_2_1" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectAll(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_2" name="warehouseSeCd_chk_mon_2_2" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_3" name="warehouseSeCd_chk_mon_2_3" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_4" name="warehouseSeCd_chk_mon_2_4" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_5" name="warehouseSeCd_chk_mon_2_5" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_6" name="warehouseSeCd_chk_mon_2_6" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_7" name="warehouseSeCd_chk_mon_2_7" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_8" name="warehouseSeCd_chk_mon_2_8" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_9" name="warehouseSeCd_chk_mon_2_9" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_10" name="warehouseSeCd_chk_mon_2_10" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_11" name="warehouseSeCd_chk_mon_2_11" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_12" name="warehouseSeCd_chk_mon_2_12" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_2_13" name="warehouseSeCd_chk_mon_2_13" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm3">품목3</span>
							<br>
							운영기간
							<sbux-input id="dtl-inp-itemChk3" name="dtl-inp-itemChk3" uitype="hidden"></sbux-input>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_non" name="warehouseSeCd_chk_mon_3_non" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectNon(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_1" name="warehouseSeCd_chk_mon_3_1" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectAll(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_2" name="warehouseSeCd_chk_mon_3_2" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_3" name="warehouseSeCd_chk_mon_3_3" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_4" name="warehouseSeCd_chk_mon_3_4" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_5" name="warehouseSeCd_chk_mon_3_5" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_6" name="warehouseSeCd_chk_mon_3_6" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_7" name="warehouseSeCd_chk_mon_3_7" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_8" name="warehouseSeCd_chk_mon_3_8" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_9" name="warehouseSeCd_chk_mon_3_9" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_10" name="warehouseSeCd_chk_mon_3_10" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_11" name="warehouseSeCd_chk_mon_3_11" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_12" name="warehouseSeCd_chk_mon_3_12" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_3_13" name="warehouseSeCd_chk_mon_3_13" uitype="normal" true-value = "Y" false-value = "N" group-id="group3" onchange="fn_checkSelect(this,3)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm4">기타품목</span>
							<br>
							운영기간
							<sbux-input id="dtl-inp-itemChk4" name="dtl-inp-itemChk4" uitype="hidden"></sbux-input>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_non" name="warehouseSeCd_chk_mon_4_non" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectNon(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_1" name="warehouseSeCd_chk_mon_4_1" uitype="normal" true-value = "Y" false-value = "N" onchange="fn_checkSelectAll(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_2" name="warehouseSeCd_chk_mon_4_2" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_3" name="warehouseSeCd_chk_mon_4_3" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_4" name="warehouseSeCd_chk_mon_4_4" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_5" name="warehouseSeCd_chk_mon_4_5" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_6" name="warehouseSeCd_chk_mon_4_6" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_7" name="warehouseSeCd_chk_mon_4_7" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_8" name="warehouseSeCd_chk_mon_4_8" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_9" name="warehouseSeCd_chk_mon_4_9" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_10" name="warehouseSeCd_chk_mon_4_10" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_11" name="warehouseSeCd_chk_mon_4_11" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_12" name="warehouseSeCd_chk_mon_4_12" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd_chk_mon_4_13" name="warehouseSeCd_chk_mon_4_13" uitype="normal" true-value = "Y" false-value = "N" group-id="group4" onchange="fn_checkSelect(this,4)"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>

				</tbody>
			</table>
				<div><label>* 해당 APC에서 소유하고 있는 품목별 선별기 모두 기재</label></div>
			</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);

		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let apcCd = '0122';
		let crtrYr = '2023';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	const fn_init = async function() {
		//await fn_clear();//전체 비활성화

		await fn_selectStMcOpIfList();//데이터 조회

		await cfn_selectPrgrs();//진척도
		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			await SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
		} else {
			await SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
		}
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_selectStMcOpIfList = async function(copy_chk) {
		 console.log("******************fn_selectStMcOpIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltSortMchnOperInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			//console.log(data);
			data.resultList.forEach((item, index) => {
				let sn = item.sn;
				SBUxMethod.set('dtl-inp-itemChk'+sn,'Y');//품목 존재 여부 확인

				$('#itemNm'+item.sn).text("품목 : "+item.itemNm);

				if(item.operYn == 'Y'){
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_2',item.operPeriodYn1);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_3',item.operPeriodYn2);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_4',item.operPeriodYn3);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_5',item.operPeriodYn4);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_6',item.operPeriodYn5);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_7',item.operPeriodYn6);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_8',item.operPeriodYn7);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_9',item.operPeriodYn8);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_10',item.operPeriodYn9);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_11',item.operPeriodYn10);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_12',item.operPeriodYn11);
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_13',item.operPeriodYn12);
					fn_checkSelect(null,sn);
				}else if(item.operYn == 'N'){
					SBUxMethod.set('warehouseSeCd_chk_mon_'+sn+'_non','Y');
				}
			});

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//등록
	const fn_save = async function() {
		console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			alert("대상연도를 작성해주세요");
			return;
		}

		fn_subInsert(confirm("등록 하시겠습니까?"));
	}
	//신규등록
	const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		let saveList = [];
		for (var i = 1; i < 5; i++) {
			let nonVal = $('#warehouseSeCd_chk_mon_'+i+'_non').val();
			let itemVo = [];
			let itemChk = SBUxMethod.get('dtl-inp-itemChk'+i);
			//품목 존재 여부 확인
			if(itemChk == 'Y'){
				//운영여부 확인
				if(nonVal == 'Y'){
					itemVo = {
							apcCd : apcCd
							, crtrYr : crtrYr
							, sn : i
							, operYn : 'N'
					}
				}else{
					itemVo = {
							apcCd : apcCd
							, crtrYr : crtrYr
							, sn : i
							, operYn : 'Y'
							, operPeriodYn1 : $('#warehouseSeCd_chk_mon_'+i+'_2').val()
							, operPeriodYn2 : $('#warehouseSeCd_chk_mon_'+i+'_3').val()
							, operPeriodYn3 : $('#warehouseSeCd_chk_mon_'+i+'_4').val()
							, operPeriodYn4 : $('#warehouseSeCd_chk_mon_'+i+'_5').val()
							, operPeriodYn5 : $('#warehouseSeCd_chk_mon_'+i+'_6').val()
							, operPeriodYn6 : $('#warehouseSeCd_chk_mon_'+i+'_7').val()
							, operPeriodYn7 : $('#warehouseSeCd_chk_mon_'+i+'_8').val()
							, operPeriodYn8 : $('#warehouseSeCd_chk_mon_'+i+'_9').val()
							, operPeriodYn9 : $('#warehouseSeCd_chk_mon_'+i+'_10').val()
							, operPeriodYn10 : $('#warehouseSeCd_chk_mon_'+i+'_11').val()
							, operPeriodYn11 : $('#warehouseSeCd_chk_mon_'+i+'_12').val()
							, operPeriodYn12 : $('#warehouseSeCd_chk_mon_'+i+'_13').val()
					}
				}
				itemVo.prgrsYn = 'Y';//진척도 갱신 여부
				saveList.push(itemVo);
			}
		}
		console.log(saveList);
		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltSortMchnOperInfo.do", saveList);

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
	}

	// 전체선택 체크박스
	const fn_checkSelectAll = function(e,num) {
		//let targetVal = SBUxMethod.get(e.name).e.name;
		let targetVal = $('#'+e.name).val();
		if(targetVal == 'Y'){
			SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_non','N');
		}

		//sbux-checkbox id에 '-' 빼기 기호 사용시 문제가 생김 '_' 언더바 사용
		for (var i = 1; i < 14; i++) {
			SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_'+i,targetVal);
		}
	}

	// 체크박스 선택시 전체선택 변경
	const fn_checkSelect = function(e,num) {
		let targetVal;
		if(!gfn_isEmpty(e)){
			targetVal = $('#'+e.name).val();
		}
		if(targetVal == 'Y'){
			SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_non','N');
		}
		//group 길이 랑 'Y' 값 갯수 비교
		let group = SBUxMethod.getGroupData('group'+num);
		let trueCnt = 0;
		for (var i = 0; i < group.length; i++) {
			let chkVal = Object.values(group[i].component_value);
			if(chkVal[0] == 'Y'){
				trueCnt++;
			}
		}

		//let allChkVal = ;
		SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_1',group.length == trueCnt ? 'Y' : 'N');
	}

	// 운영안함 선택
	const fn_checkSelectNon = function(e,num) {
		//let targetVal = SBUxMethod.get(e.name).e.name;
		let targetVal = $('#'+e.name).val();
		if(targetVal == 'Y'){
			//sbux-checkbox id에 '-' 빼기 기호 사용시 문제가 생김 '_' 언더바 사용
			for (var i = 1; i < 14; i++) {
				SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_'+i,'N');
			}
		}
	}

 	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}
	//탭열린 상태에서 해당 페이지 다시 왔을떄 이벤트
	window.addEventListener('message',function(event){
		console.log('1. 탭호출');
		console.log(event);
		let chkVal = event.data.chkVal;
		if(chkVal == "selTab"){
			//진척도 조회
			cfn_selectPrgrs();
		}
	});
</script>
</html>