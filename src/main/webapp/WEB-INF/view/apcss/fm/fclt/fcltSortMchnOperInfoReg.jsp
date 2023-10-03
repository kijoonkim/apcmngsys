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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 선별기운영기간</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<tbody>
					<tr>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-trgtYr" name="srch-inp-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td colspan="5"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div><label>선별기운영기간 상세내역</label></div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:0px;"></div>
				</div>
			<br>
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
				</colgroup>
				<tbody>
					<tr>
						<th>선별기운영기간</th>
						<th class="text-center">연중</th>
						<th class="text-center">1</th>
						<th class="text-center">2</th>
						<th class="text-center">3</th>
						<th class="text-center">4</th>
						<th class="text-center">5</th>
						<th class="text-center">6</th>
						<th class="text-center">7</th>
						<th class="text-center">8</th>
						<th class="text-center">9</th>
						<th class="text-center">10</th>
						<th class="text-center">11</th>
						<th class="text-center">12</th>
					</tr>
					<tr>
						<th>품목1<br>
							운영기간<br>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_1" name="warehouseSeCd-chk-mon_1_1"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_2" name="warehouseSeCd-chk-mon_1_2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_3" name="warehouseSeCd-chk-mon_1_3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_4" name="warehouseSeCd-chk-mon_1_4" uitype="normal" true-value = "1" false-value = "0" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_5" name="warehouseSeCd-chk-mon_1_5" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_6" name="warehouseSeCd-chk-mon_1_6" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_7" name="warehouseSeCd-chk-mon_1_7" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_8" name="warehouseSeCd-chk-mon_1_8" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_9" name="warehouseSeCd-chk-mon_1_9" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_10" name="warehouseSeCd-chk-mon_1_10" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_11" name="warehouseSeCd-chk-mon_1_11" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_12" name="warehouseSeCd-chk-mon_1_12" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_1_13" name="warehouseSeCd-chk-mon_1_13" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th>품목2<br>
							운영기간<br>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_1" name="warehouseSeCd-chk-mon_2_1" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_2" name="warehouseSeCd-chk-mon_2_2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_3" name="warehouseSeCd-chk-mon_2_3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_4" name="warehouseSeCd-chk-mon_2_4" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_5" name="warehouseSeCd-chk-mon_2_5" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_6" name="warehouseSeCd-chk-mon_2_6" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_7" name="warehouseSeCd-chk-mon_2_7" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_8" name="warehouseSeCd-chk-mon_2_8" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_9" name="warehouseSeCd-chk-mon_2_9" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_10" name="warehouseSeCd-chk-mon_2_10" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_11" name="warehouseSeCd-chk-mon_2_11" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_12" name="warehouseSeCd-chk-mon_2_12" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_2_13" name="warehouseSeCd-chk-mon_2_13" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th>품목3<br>
							운영기간<br>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_1" name="warehouseSeCd-chk-mon_3_1" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_2" name="warehouseSeCd-chk-mon_3_2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_3" name="warehouseSeCd-chk-mon_3_3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_4" name="warehouseSeCd-chk-mon_3_4" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_5" name="warehouseSeCd-chk-mon_3_5" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_6" name="warehouseSeCd-chk-mon_3_6" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_7" name="warehouseSeCd-chk-mon_3_7" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_8" name="warehouseSeCd-chk-mon_3_8" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_9" name="warehouseSeCd-chk-mon_3_9" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_10" name="warehouseSeCd-chk-mon_3_10" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_11" name="warehouseSeCd-chk-mon_3_11" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_12" name="warehouseSeCd-chk-mon_3_12" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_3_13" name="warehouseSeCd-chk-mon_3_13" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th>기타품목<br>
							운영기간<br>
						</th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_1" name="warehouseSeCd-chk-mon_4_1" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_2" name="warehouseSeCd-chk-mon_4_2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_3" name="warehouseSeCd-chk-mon_4_3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_4" name="warehouseSeCd-chk-mon_4_4" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_5" name="warehouseSeCd-chk-mon_4_5" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_6" name="warehouseSeCd-chk-mon_4_6" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_7" name="warehouseSeCd-chk-mon_4_7" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_8" name="warehouseSeCd-chk-mon_4_8" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_9" name="warehouseSeCd-chk-mon_4_9" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_10" name="warehouseSeCd-chk-mon_4_10" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_11" name="warehouseSeCd-chk-mon_4_11" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_12" name="warehouseSeCd-chk-mon_4_12" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon_4_13" name="warehouseSeCd-chk-mon_4_13" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>

				</tbody>
			</table>
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
		//SBUxMethod.changeGroupAttr('group1','disabled','true');
		//SBUxMethod.changeGroupAttr('group2','disabled','true');
		//SBUxMethod.changeGroupAttr('group3','disabled','true');
		//SBUxMethod.changeGroupAttr('group4','disabled','true');
	})

	//등록
	const fn_save = async function() {
    	console.log("******************fn_save**********************************");

    	let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-trgtYr");
		if (gfn_isEmpty(apcCd)) {
    		alert("apc를 선택해주세요");
            return;
        }
		if (gfn_isEmpty(trgtYr)) {
    		alert("대상연도를 작성해주세요");
            return;
        }

    	fn_subInsert(confirm("등록 하시겠습니까?"));
    }
    //신규등록
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltSortMchnOperInfo.do", {
    		trgtYr : SBUxMethod.get('srch-inp-trgtYr')
    		,apcCd : SBUxMethod.get('srch-inp-apcCd')
    			,sortMchnHldYnAyr1 : $('#warehouseSeCd-chk-mon_1_1').val()
        		,sortMchnHldYn101 : $('#warehouseSeCd-chk-mon_1_2').val()
        		,sortMchnHldYn102 : $('#warehouseSeCd-chk-mon_1_3').val()
        		,sortMchnHldYn103 : $('#warehouseSeCd-chk-mon_1_4').val()
        		,sortMchnHldYn104 : $('#warehouseSeCd-chk-mon_1_5').val()
        		,sortMchnHldYn105 : $('#warehouseSeCd-chk-mon_1_6').val()
        		,sortMchnHldYn106 : $('#warehouseSeCd-chk-mon_1_7').val()
        		,sortMchnHldYn107 : $('#warehouseSeCd-chk-mon_1_8').val()
        		,sortMchnHldYn108 : $('#warehouseSeCd-chk-mon_1_9').val()
        		,sortMchnHldYn109 : $('#warehouseSeCd-chk-mon_1_10').val()
        		,sortMchnHldYn110 : $('#warehouseSeCd-chk-mon_1_11').val()
        		,sortMchnHldYn111 : $('#warehouseSeCd-chk-mon_1_12').val()
        		,sortMchnHldYn112 : $('#warehouseSeCd-chk-mon_1_13').val()
        		,sortMchnHldYnAyr2 : $('#warehouseSeCd-chk-mon_2_1').val()
        		,sortMchnHldYn201 : $('#warehouseSeCd-chk-mon_2_2').val()
        		,sortMchnHldYn202 : $('#warehouseSeCd-chk-mon_2_3').val()
        		,sortMchnHldYn203 : $('#warehouseSeCd-chk-mon_2_4').val()
        		,sortMchnHldYn204 : $('#warehouseSeCd-chk-mon_2_5').val()
        		,sortMchnHldYn205 : $('#warehouseSeCd-chk-mon_2_6').val()
        		,sortMchnHldYn206 : $('#warehouseSeCd-chk-mon_2_7').val()
        		,sortMchnHldYn207 : $('#warehouseSeCd-chk-mon_2_8').val()
        		,sortMchnHldYn208 : $('#warehouseSeCd-chk-mon_2_9').val()
        		,sortMchnHldYn209 : $('#warehouseSeCd-chk-mon_2_10').val()
        		,sortMchnHldYn210 : $('#warehouseSeCd-chk-mon_2_11').val()
        		,sortMchnHldYn211 : $('#warehouseSeCd-chk-mon_2_12').val()
        		,sortMchnHldYn212 : $('#warehouseSeCd-chk-mon_2_13').val()
        		,sortMchnHldYnAyr3 : $('#warehouseSeCd-chk-mon_3_1').val()
        		,sortMchnHldYn301 : $('#warehouseSeCd-chk-mon_3_2').val()
        		,sortMchnHldYn302 : $('#warehouseSeCd-chk-mon_3_3').val()
        		,sortMchnHldYn303 : $('#warehouseSeCd-chk-mon_3_4').val()
        		,sortMchnHldYn304 : $('#warehouseSeCd-chk-mon_3_5').val()
        		,sortMchnHldYn305 : $('#warehouseSeCd-chk-mon_3_6').val()
        		,sortMchnHldYn306 : $('#warehouseSeCd-chk-mon_3_7').val()
        		,sortMchnHldYn307 : $('#warehouseSeCd-chk-mon_3_8').val()
        		,sortMchnHldYn308 : $('#warehouseSeCd-chk-mon_3_9').val()
        		,sortMchnHldYn309 : $('#warehouseSeCd-chk-mon_3_10').val()
        		,sortMchnHldYn310 : $('#warehouseSeCd-chk-mon_3_11').val()
        		,sortMchnHldYn311 : $('#warehouseSeCd-chk-mon_3_12').val()
        		,sortMchnHldYn312 : $('#warehouseSeCd-chk-mon_3_13').val()
        		,sortMchnHldYnAyr4 : $('#warehouseSeCd-chk-mon_4_1').val()
        		,sortMchnHldYn401 : $('#warehouseSeCd-chk-mon_4_2').val()
        		,sortMchnHldYn402 : $('#warehouseSeCd-chk-mon_4_3').val()
        		,sortMchnHldYn403 : $('#warehouseSeCd-chk-mon_4_4').val()
        		,sortMchnHldYn404 : $('#warehouseSeCd-chk-mon_4_5').val()
        		,sortMchnHldYn405 : $('#warehouseSeCd-chk-mon_4_6').val()
        		,sortMchnHldYn406 : $('#warehouseSeCd-chk-mon_4_7').val()
        		,sortMchnHldYn407 : $('#warehouseSeCd-chk-mon_4_8').val()
        		,sortMchnHldYn408 : $('#warehouseSeCd-chk-mon_4_9').val()
        		,sortMchnHldYn409 : $('#warehouseSeCd-chk-mon_4_10').val()
        		,sortMchnHldYn410 : $('#warehouseSeCd-chk-mon_4_11').val()
        		,sortMchnHldYn411 : $('#warehouseSeCd-chk-mon_4_12').val()
        		,sortMchnHldYn412 : $('#warehouseSeCd-chk-mon_4_13').val()
		});

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
</script>
</html>