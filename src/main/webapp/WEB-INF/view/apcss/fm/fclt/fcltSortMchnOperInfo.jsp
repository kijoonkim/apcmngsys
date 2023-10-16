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
				<!--
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				 -->
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<!--[APC] START -->
<%-- 					<%@ include file="../../../frame/inc/apcSelect.jsp" %> --%>
				<!--[APC] END -->

			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 6%">
					<col style="width: 10%">
					<col style="width: 6%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 58%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" scope="row">대상연도</th>
						<td class="td_input"   style="border-right: hidden;">
							<sbux-input id="srch-input-trgtYr" name="srch-input-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td style="border-right:hidden;">
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:150px;"></div>
				</div>
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
								<sbux-checkbox id="sortMchnHldYnAyr1" name="sortMchnHldYnAyr1"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn101" name="sortMchnHldYn101" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn102" name="sortMchnHldYn102" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn103" name="sortMchnHldYn103" uitype="normal" true-value = "1" false-value = "0" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn104" name="sortMchnHldYn104" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn105" name="sortMchnHldYn105" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn106" name="sortMchnHldYn106" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn107" name="sortMchnHldYn107" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn108" name="sortMchnHldYn108" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn109" name="sortMchnHldYn109" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn110" name="sortMchnHldYn110" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn111" name="sortMchnHldYn111" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn112" name="sortMchnHldYn112" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
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
								<sbux-checkbox id="sortMchnHldYnAyr2" name="sortMchnHldYnAyr2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn201" name="sortMchnHldYn201" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn202" name="sortMchnHldYn202" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn203" name="sortMchnHldYn203" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn204" name="sortMchnHldYn204" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn205" name="sortMchnHldYn205" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn206" name="sortMchnHldYn206" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn207" name="sortMchnHldYn207" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn208" name="sortMchnHldYn208" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn209" name="sortMchnHldYn209" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn210" name="sortMchnHldYn210" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn211" name="sortMchnHldYn211" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn212" name="sortMchnHldYn212" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
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
								<sbux-checkbox id="sortMchnHldYnAyr3" name="sortMchnHldYnAyr3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn301" name="sortMchnHldYn301" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn302" name="sortMchnHldYn302" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn303" name="sortMchnHldYn303" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn304" name="sortMchnHldYn304" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn305" name="sortMchnHldYn305" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn306" name="sortMchnHldYn306" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn307" name="sortMchnHldYn307" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn308" name="sortMchnHldYn308" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn309" name="sortMchnHldYn309" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn310" name="sortMchnHldYn310" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn311" name="sortMchnHldYn311" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn312" name="sortMchnHldYn312" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
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
								<sbux-checkbox id="sortMchnHldYnAyr4" name="sortMchnHldYnAyr4" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn401" name="sortMchnHldYn401" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn402" name="sortMchnHldYn402" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn403" name="sortMchnHldYn403" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn404" name="sortMchnHldYn404" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn405" name="sortMchnHldYn405" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn406" name="sortMchnHldYn406" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn407" name="sortMchnHldYn407" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn408" name="sortMchnHldYn408" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn409" name="sortMchnHldYn409" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn410" name="sortMchnHldYn410" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn411" name="sortMchnHldYn411" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-checkbox id="sortMchnHldYn412" name="sortMchnHldYn412" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="th_bg">대상연도</th>
						<td class="td_input" colspan="3">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="8" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">apc명</th>
						<td class="td_input" colspan="3">
							<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="8" style="border-left: hidden;">
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
        <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- apc 선택 Modal -->
    <div>
        <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-apcSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
    </div>
</body>
    <script type="text/javascript">

	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
    	fn_createGrid();//그리드 생성 설정 함수

    });

    //grid 초기화
    var grdStMcOpIfList; // 그리드를 담기위한 객체 선언
    var jsonStMcOpIfList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdStMcOpIfList';
	    SBGridProperties.jsonref = 'jsonStMcOpIfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APCNM"],		ref: 'apcNm',       		type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["품목1","연중"], ref: 'sortMchnHldYnAyr1', type:'output', width:'3%', style:'text-align:center'},
            {caption: ["품목1","1"], ref: 'sortMchnHldYn101', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","2"], ref: 'sortMchnHldYn102', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","3"], ref: 'sortMchnHldYn103', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","4"], ref: 'sortMchnHldYn104', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","5"], ref: 'sortMchnHldYn105', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","6"], ref: 'sortMchnHldYn106', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","7"], ref: 'sortMchnHldYn107', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","8"], ref: 'sortMchnHldYn108', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","9"], ref: 'sortMchnHldYn109', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","10"], ref: 'sortMchnHldYn110', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","11"], ref: 'sortMchnHldYn111', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목1","12"], ref: 'sortMchnHldYn112', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","연중"], ref: 'sortMchnHldYnAyr2', type:'output', width:'3%', style:'text-align:center'},
            {caption: ["품목2","1"], ref: 'sortMchnHldYn201', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","2"], ref: 'sortMchnHldYn202', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","3"], ref: 'sortMchnHldYn203', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","4"], ref: 'sortMchnHldYn204', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","5"], ref: 'sortMchnHldYn205', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","6"], ref: 'sortMchnHldYn206', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","7"], ref: 'sortMchnHldYn207', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","8"], ref: 'sortMchnHldYn208', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","9"], ref: 'sortMchnHldYn209', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","10"], ref: 'sortMchnHldYn210', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","11"], ref: 'sortMchnHldYn211', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목2","12"], ref: 'sortMchnHldYn212', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","연중"], ref: 'sortMchnHldYnAyr3', type:'output', width:'3%', style:'text-align:center'},
            {caption: ["품목3","1"], ref: 'sortMchnHldYn301', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","2"], ref: 'sortMchnHldYn302', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","3"], ref: 'sortMchnHldYn303', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","4"], ref: 'sortMchnHldYn304', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","5"], ref: 'sortMchnHldYn305', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","6"], ref: 'sortMchnHldYn306', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","7"], ref: 'sortMchnHldYn307', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","8"], ref: 'sortMchnHldYn308', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","9"], ref: 'sortMchnHldYn309', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","10"], ref: 'sortMchnHldYn310', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","11"], ref: 'sortMchnHldYn311', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["품목3","12"], ref: 'sortMchnHldYn312', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","연중"], ref: 'sortMchnHldYnAyr4', type:'output', width:'3%', style:'text-align:center'},
            {caption: ["기타품목","1"], ref: 'sortMchnHldYn401', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","2"], ref: 'sortMchnHldYn402', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","3"], ref: 'sortMchnHldYn403', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","4"], ref: 'sortMchnHldYn404', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","5"], ref: 'sortMchnHldYn405', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","6"], ref: 'sortMchnHldYn406', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","7"], ref: 'sortMchnHldYn407', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","8"], ref: 'sortMchnHldYn408', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","9"], ref: 'sortMchnHldYn409', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","10"], ref: 'sortMchnHldYn410', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","11"], ref: 'sortMchnHldYn411', type:'output', width:'2%', style:'text-align:center'},
            {caption: ["기타품목","12"], ref: 'sortMchnHldYn412', type:'output', width:'2%', style:'text-align:center'},

            {caption: ["APCCD"],		ref: 'apcCd',       		type:'output',  	hidden: true},
            {caption: ["대상연도"],			ref: 'trgtYr',          	type:'output',  hidden: true},
            {caption: ["등록프로그램"], 		ref: 'creProgram',  		type:'output',  hidden: true},
            {caption: ["변경프로그램"], 		ref: 'updProgram',  		type:'output',  hidden: true}

        ];

        grdStMcOpIfList = _SBGrid.create(SBGridProperties);
        grdStMcOpIfList.bind('click', 'fn_view');
        grdStMcOpIfList.bind('beforepagechanged', 'fn_pagingStMcOpIfList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdStMcOpIfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdStMcOpIfList.getPageSize());
    	fn_pagingStMcOpIfList(pageSize, pageNo);
    }
    /**
     *
     */

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_pagingStMcOpIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingStMcOpIfList**********************************");
    	// form clear
    	fn_clearForm();

		grdStMcOpIfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		var chk = {
				trgtYr: trgtYr,
	        	apcCd: apcCd,
	        	// pagination
		  		pagingYn : 'N',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize

		}
		console.log('=============chk==================');
		console.log(chk);

        //비동기 포스트타입 url 데이터연결 페이징처리 글로벌
        //gfn_postJSON 는 ajax고 post통신의 데이터를 json 타입으로 보내는것이다
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltSortMchnOperInfoList.do", {
			apcCd: apcCd,
        	trgtYr: trgtYr,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });
		console.log("a11111111111111");
        const data = await postJsonPromise;
		//await 오류시 확인
        console.log("---------------------------")
        console.log(data)
		//예외처리
        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonStMcOpIfList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					trgtYr: item.trgtYr						 	    //대상연도
					,apcCd: item.apcCd 	 		 						//apc코드
					,apcNm: item.apcNm 	 		 						//apc코드
					,sortMchnHldYnAyr1 : item.sortMchnHldYnAyr1
					,sortMchnHldYn101 : item.sortMchnHldYn101
					,sortMchnHldYn102 : item.sortMchnHldYn102
					,sortMchnHldYn103 : item.sortMchnHldYn103
					,sortMchnHldYn104 : item.sortMchnHldYn104
					,sortMchnHldYn105 : item.sortMchnHldYn105
					,sortMchnHldYn106 : item.sortMchnHldYn106
					,sortMchnHldYn107 : item.sortMchnHldYn107
					,sortMchnHldYn108 : item.sortMchnHldYn108
					,sortMchnHldYn109 : item.sortMchnHldYn109
					,sortMchnHldYn110 : item.sortMchnHldYn110
					,sortMchnHldYn111 : item.sortMchnHldYn111
					,sortMchnHldYn112 : item.sortMchnHldYn112
					,sortMchnHldYnAyr2 : item.sortMchnHldYnAyr2
					,sortMchnHldYn201 : item.sortMchnHldYn201
					,sortMchnHldYn202 : item.sortMchnHldYn202
					,sortMchnHldYn203 : item.sortMchnHldYn203
					,sortMchnHldYn204 : item.sortMchnHldYn204
					,sortMchnHldYn205 : item.sortMchnHldYn205
					,sortMchnHldYn206 : item.sortMchnHldYn206
					,sortMchnHldYn207 : item.sortMchnHldYn207
					,sortMchnHldYn208 : item.sortMchnHldYn208
					,sortMchnHldYn209 : item.sortMchnHldYn209
					,sortMchnHldYn210 : item.sortMchnHldYn210
					,sortMchnHldYn211 : item.sortMchnHldYn211
					,sortMchnHldYn212 : item.sortMchnHldYn212
					,sortMchnHldYnAyr3 : item.sortMchnHldYnAyr3
					,sortMchnHldYn301 : item.sortMchnHldYn301
					,sortMchnHldYn302 : item.sortMchnHldYn302
					,sortMchnHldYn303 : item.sortMchnHldYn303
					,sortMchnHldYn304 : item.sortMchnHldYn304
					,sortMchnHldYn305 : item.sortMchnHldYn305
					,sortMchnHldYn306 : item.sortMchnHldYn306
					,sortMchnHldYn307 : item.sortMchnHldYn307
					,sortMchnHldYn308 : item.sortMchnHldYn308
					,sortMchnHldYn309 : item.sortMchnHldYn309
					,sortMchnHldYn310 : item.sortMchnHldYn310
					,sortMchnHldYn311 : item.sortMchnHldYn311
					,sortMchnHldYn312 : item.sortMchnHldYn312
					,sortMchnHldYnAyr4 : item.sortMchnHldYnAyr4
					,sortMchnHldYn401 : item.sortMchnHldYn401
					,sortMchnHldYn402 : item.sortMchnHldYn402
					,sortMchnHldYn403 : item.sortMchnHldYn403
					,sortMchnHldYn404 : item.sortMchnHldYn404
					,sortMchnHldYn405 : item.sortMchnHldYn405
					,sortMchnHldYn406 : item.sortMchnHldYn406
					,sortMchnHldYn407 : item.sortMchnHldYn407
					,sortMchnHldYn408 : item.sortMchnHldYn408
					,sortMchnHldYn409 : item.sortMchnHldYn409
					,sortMchnHldYn410 : item.sortMchnHldYn410
					,sortMchnHldYn411 : item.sortMchnHldYn411
					,sortMchnHldYn412 : item.sortMchnHldYn412

				}


				jsonStMcOpIfList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonStMcOpIfList.length > 0) {

        		if(grdStMcOpIfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdStMcOpIfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdStMcOpIfList.rebuild();
				}else{
					grdStMcOpIfList.refresh()
				}
        	} else {
        		grdStMcOpIfList.setPageTotalCount(totalRecordCount);
        		grdStMcOpIfList.rebuild();
        	}

        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		//console.error("failed", e.message);
        }
    }
   	console.log("d4444444444444444444444444444");


    //신규 작성 dtl 내부의 값을 null로
    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("sortMchnHldYnAyr1",null)
		SBUxMethod.set("sortMchnHldYn101",null)
		SBUxMethod.set("sortMchnHldYn102",null)
		SBUxMethod.set("sortMchnHldYn103",null)
		SBUxMethod.set("sortMchnHldYn104",null)
		SBUxMethod.set("sortMchnHldYn105",null)
		SBUxMethod.set("sortMchnHldYn106",null)
		SBUxMethod.set("sortMchnHldYn107",null)
		SBUxMethod.set("sortMchnHldYn108",null)
		SBUxMethod.set("sortMchnHldYn109",null)
		SBUxMethod.set("sortMchnHldYn110",null)
		SBUxMethod.set("sortMchnHldYn111",null)
		SBUxMethod.set("sortMchnHldYn112",null)
		SBUxMethod.set("sortMchnHldYnAyr2",null)
		SBUxMethod.set("sortMchnHldYn201",null)
		SBUxMethod.set("sortMchnHldYn202",null)
		SBUxMethod.set("sortMchnHldYn203",null)
		SBUxMethod.set("sortMchnHldYn204",null)
		SBUxMethod.set("sortMchnHldYn205",null)
		SBUxMethod.set("sortMchnHldYn206",null)
		SBUxMethod.set("sortMchnHldYn207",null)
		SBUxMethod.set("sortMchnHldYn208",null)
		SBUxMethod.set("sortMchnHldYn209",null)
		SBUxMethod.set("sortMchnHldYn210",null)
		SBUxMethod.set("sortMchnHldYn211",null)
		SBUxMethod.set("sortMchnHldYn212",null)
		SBUxMethod.set("sortMchnHldYnAyr3",null)
		SBUxMethod.set("sortMchnHldYn301",null)
		SBUxMethod.set("sortMchnHldYn302",null)
		SBUxMethod.set("sortMchnHldYn303",null)
		SBUxMethod.set("sortMchnHldYn304",null)
		SBUxMethod.set("sortMchnHldYn305",null)
		SBUxMethod.set("sortMchnHldYn306",null)
		SBUxMethod.set("sortMchnHldYn307",null)
		SBUxMethod.set("sortMchnHldYn308",null)
		SBUxMethod.set("sortMchnHldYn309",null)
		SBUxMethod.set("sortMchnHldYn310",null)
		SBUxMethod.set("sortMchnHldYn311",null)
		SBUxMethod.set("sortMchnHldYn312",null)
		SBUxMethod.set("sortMchnHldYnAyr4",null)
		SBUxMethod.set("sortMchnHldYn401",null)
		SBUxMethod.set("sortMchnHldYn402",null)
		SBUxMethod.set("sortMchnHldYn403",null)
		SBUxMethod.set("sortMchnHldYn404",null)
		SBUxMethod.set("sortMchnHldYn405",null)
		SBUxMethod.set("sortMchnHldYn406",null)
		SBUxMethod.set("sortMchnHldYn407",null)
		SBUxMethod.set("sortMchnHldYn408",null)
		SBUxMethod.set("sortMchnHldYn409",null)
		SBUxMethod.set("sortMchnHldYn410",null)
		SBUxMethod.set("sortMchnHldYn411",null)
		SBUxMethod.set("sortMchnHldYn412",null)

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("sortMchnHldYnAyr1",null)
		SBUxMethod.set("sortMchnHldYn101",null)
		SBUxMethod.set("sortMchnHldYn102",null)
		SBUxMethod.set("sortMchnHldYn103",null)
		SBUxMethod.set("sortMchnHldYn104",null)
		SBUxMethod.set("sortMchnHldYn105",null)
		SBUxMethod.set("sortMchnHldYn106",null)
		SBUxMethod.set("sortMchnHldYn107",null)
		SBUxMethod.set("sortMchnHldYn108",null)
		SBUxMethod.set("sortMchnHldYn109",null)
		SBUxMethod.set("sortMchnHldYn110",null)
		SBUxMethod.set("sortMchnHldYn111",null)
		SBUxMethod.set("sortMchnHldYn112",null)
		SBUxMethod.set("sortMchnHldYnAyr2",null)
		SBUxMethod.set("sortMchnHldYn201",null)
		SBUxMethod.set("sortMchnHldYn202",null)
		SBUxMethod.set("sortMchnHldYn203",null)
		SBUxMethod.set("sortMchnHldYn204",null)
		SBUxMethod.set("sortMchnHldYn205",null)
		SBUxMethod.set("sortMchnHldYn206",null)
		SBUxMethod.set("sortMchnHldYn207",null)
		SBUxMethod.set("sortMchnHldYn208",null)
		SBUxMethod.set("sortMchnHldYn209",null)
		SBUxMethod.set("sortMchnHldYn210",null)
		SBUxMethod.set("sortMchnHldYn211",null)
		SBUxMethod.set("sortMchnHldYn212",null)
		SBUxMethod.set("sortMchnHldYnAyr3",null)
		SBUxMethod.set("sortMchnHldYn301",null)
		SBUxMethod.set("sortMchnHldYn302",null)
		SBUxMethod.set("sortMchnHldYn303",null)
		SBUxMethod.set("sortMchnHldYn304",null)
		SBUxMethod.set("sortMchnHldYn305",null)
		SBUxMethod.set("sortMchnHldYn306",null)
		SBUxMethod.set("sortMchnHldYn307",null)
		SBUxMethod.set("sortMchnHldYn308",null)
		SBUxMethod.set("sortMchnHldYn309",null)
		SBUxMethod.set("sortMchnHldYn310",null)
		SBUxMethod.set("sortMchnHldYn311",null)
		SBUxMethod.set("sortMchnHldYn312",null)
		SBUxMethod.set("sortMchnHldYnAyr4",null)
		SBUxMethod.set("sortMchnHldYn401",null)
		SBUxMethod.set("sortMchnHldYn402",null)
		SBUxMethod.set("sortMchnHldYn403",null)
		SBUxMethod.set("sortMchnHldYn404",null)
		SBUxMethod.set("sortMchnHldYn405",null)
		SBUxMethod.set("sortMchnHldYn406",null)
		SBUxMethod.set("sortMchnHldYn407",null)
		SBUxMethod.set("sortMchnHldYn408",null)
		SBUxMethod.set("sortMchnHldYn409",null)
		SBUxMethod.set("sortMchnHldYn410",null)
		SBUxMethod.set("sortMchnHldYn411",null)
		SBUxMethod.set("sortMchnHldYn412",null)

    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		/*
    	if (!SBUxMethod.get("gsb-slt-apcCd")) {
            alert("조회 항목의 APC 코드를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("srch-input-trgtYr")) {
            alert("조회 항목의 대상년도를 선택하세요.");
            return;
        }
		*/


    	if (gfn_isEmpty(trgtYr)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltSortMchnOperInfo.do", {
    		trgtYr: SBUxMethod.set('dtl-input-trgtYr')   	                     //  대상연도
    		,apcCd: SBUxMethod.set('dtl-input-apcCd')   	                     //  apc
			,sortMchnHldYnAyr1 : $('#sortMchnHldYnAyr1').val()
    		,sortMchnHldYn101 : $('#sortMchnHldYn101').val()
    		,sortMchnHldYn102 : $('#sortMchnHldYn102').val()
    		,sortMchnHldYn103 : $('#sortMchnHldYn103').val()
    		,sortMchnHldYn104 : $('#sortMchnHldYn104').val()
    		,sortMchnHldYn105 : $('#sortMchnHldYn105').val()
    		,sortMchnHldYn106 : $('#sortMchnHldYn106').val()
    		,sortMchnHldYn107 : $('#sortMchnHldYn107').val()
    		,sortMchnHldYn108 : $('#sortMchnHldYn108').val()
    		,sortMchnHldYn109 : $('#sortMchnHldYn109').val()
    		,sortMchnHldYn110 : $('#sortMchnHldYn110').val()
    		,sortMchnHldYn111 : $('#sortMchnHldYn111').val()
    		,sortMchnHldYn112 : $('#sortMchnHldYn112').val()
    		,sortMchnHldYnAyr2 : $('#sortMchnHldYnAyr2').val()
    		,sortMchnHldYn201 : $('#sortMchnHldYn201').val()
    		,sortMchnHldYn202 : $('#sortMchnHldYn202').val()
    		,sortMchnHldYn203 : $('#sortMchnHldYn203').val()
    		,sortMchnHldYn204 : $('#sortMchnHldYn204').val()
    		,sortMchnHldYn205 : $('#sortMchnHldYn205').val()
    		,sortMchnHldYn206 : $('#sortMchnHldYn206').val()
    		,sortMchnHldYn207 : $('#sortMchnHldYn207').val()
    		,sortMchnHldYn208 : $('#sortMchnHldYn208').val()
    		,sortMchnHldYn209 : $('#sortMchnHldYn209').val()
    		,sortMchnHldYn210 : $('#sortMchnHldYn210').val()
    		,sortMchnHldYn211 : $('#sortMchnHldYn211').val()
    		,sortMchnHldYn212 : $('#sortMchnHldYn212').val()
    		,sortMchnHldYnAyr3 : $('#sortMchnHldYnAyr3').val()
    		,sortMchnHldYn301 : $('#sortMchnHldYn301').val()
    		,sortMchnHldYn302 : $('#sortMchnHldYn302').val()
    		,sortMchnHldYn303 : $('#sortMchnHldYn303').val()
    		,sortMchnHldYn304 : $('#sortMchnHldYn304').val()
    		,sortMchnHldYn305 : $('#sortMchnHldYn305').val()
    		,sortMchnHldYn306 : $('#sortMchnHldYn306').val()
    		,sortMchnHldYn307 : $('#sortMchnHldYn307').val()
    		,sortMchnHldYn308 : $('#sortMchnHldYn308').val()
    		,sortMchnHldYn309 : $('#sortMchnHldYn309').val()
    		,sortMchnHldYn310 : $('#sortMchnHldYn310').val()
    		,sortMchnHldYn311 : $('#sortMchnHldYn311').val()
    		,sortMchnHldYn312 : $('#sortMchnHldYn312').val()
    		,sortMchnHldYnAyr4 : $('#sortMchnHldYnAyr4').val()
    		,sortMchnHldYn401 : $('#sortMchnHldYn401').val()
    		,sortMchnHldYn402 : $('#sortMchnHldYn402').val()
    		,sortMchnHldYn403 : $('#sortMchnHldYn403').val()
    		,sortMchnHldYn404 : $('#sortMchnHldYn404').val()
    		,sortMchnHldYn405 : $('#sortMchnHldYn405').val()
    		,sortMchnHldYn406 : $('#sortMchnHldYn406').val()
    		,sortMchnHldYn407 : $('#sortMchnHldYn407').val()
    		,sortMchnHldYn408 : $('#sortMchnHldYn408').val()
    		,sortMchnHldYn409 : $('#sortMchnHldYn409').val()
    		,sortMchnHldYn410 : $('#sortMchnHldYn410').val()
    		,sortMchnHldYn411 : $('#sortMchnHldYn411').val()
    		,sortMchnHldYn412 : $('#sortMchnHldYn412').val()
		});




	console.log(postVal);
	console.log("----------------------------");
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
        // 결과 확인 후 재조회
        console.log("insert result", data);
    }
	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){
    	 console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltSortMchnOperInfo.do", {
        		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
        		,apcCd: SBUxMethod.get('dtl-input-apcCd')   	                     //  apc
				,sortMchnHldYnAyr1 : $('#sortMchnHldYnAyr1').val()
	    		,sortMchnHldYn101 : $('#sortMchnHldYn101').val()
	    		,sortMchnHldYn102 : $('#sortMchnHldYn102').val()
	    		,sortMchnHldYn103 : $('#sortMchnHldYn103').val()
	    		,sortMchnHldYn104 : $('#sortMchnHldYn104').val()
	    		,sortMchnHldYn105 : $('#sortMchnHldYn105').val()
	    		,sortMchnHldYn106 : $('#sortMchnHldYn106').val()
	    		,sortMchnHldYn107 : $('#sortMchnHldYn107').val()
	    		,sortMchnHldYn108 : $('#sortMchnHldYn108').val()
	    		,sortMchnHldYn109 : $('#sortMchnHldYn109').val()
	    		,sortMchnHldYn110 : $('#sortMchnHldYn110').val()
	    		,sortMchnHldYn111 : $('#sortMchnHldYn111').val()
	    		,sortMchnHldYn112 : $('#sortMchnHldYn112').val()
	    		,sortMchnHldYnAyr2 : $('#sortMchnHldYnAyr2').val()
	    		,sortMchnHldYn201 : $('#sortMchnHldYn201').val()
	    		,sortMchnHldYn202 : $('#sortMchnHldYn202').val()
	    		,sortMchnHldYn203 : $('#sortMchnHldYn203').val()
	    		,sortMchnHldYn204 : $('#sortMchnHldYn204').val()
	    		,sortMchnHldYn205 : $('#sortMchnHldYn205').val()
	    		,sortMchnHldYn206 : $('#sortMchnHldYn206').val()
	    		,sortMchnHldYn207 : $('#sortMchnHldYn207').val()
	    		,sortMchnHldYn208 : $('#sortMchnHldYn208').val()
	    		,sortMchnHldYn209 : $('#sortMchnHldYn209').val()
	    		,sortMchnHldYn210 : $('#sortMchnHldYn210').val()
	    		,sortMchnHldYn211 : $('#sortMchnHldYn211').val()
	    		,sortMchnHldYn212 : $('#sortMchnHldYn212').val()
	    		,sortMchnHldYnAyr3 : $('#sortMchnHldYnAyr3').val()
	    		,sortMchnHldYn301 : $('#sortMchnHldYn301').val()
	    		,sortMchnHldYn302 : $('#sortMchnHldYn302').val()
	    		,sortMchnHldYn303 : $('#sortMchnHldYn303').val()
	    		,sortMchnHldYn304 : $('#sortMchnHldYn304').val()
	    		,sortMchnHldYn305 : $('#sortMchnHldYn305').val()
	    		,sortMchnHldYn306 : $('#sortMchnHldYn306').val()
	    		,sortMchnHldYn307 : $('#sortMchnHldYn307').val()
	    		,sortMchnHldYn308 : $('#sortMchnHldYn308').val()
	    		,sortMchnHldYn309 : $('#sortMchnHldYn309').val()
	    		,sortMchnHldYn310 : $('#sortMchnHldYn310').val()
	    		,sortMchnHldYn311 : $('#sortMchnHldYn311').val()
	    		,sortMchnHldYn312 : $('#sortMchnHldYn312').val()
	    		,sortMchnHldYnAyr4 : $('#sortMchnHldYnAyr4').val()
	    		,sortMchnHldYn401 : $('#sortMchnHldYn401').val()
	    		,sortMchnHldYn402 : $('#sortMchnHldYn402').val()
	    		,sortMchnHldYn403 : $('#sortMchnHldYn403').val()
	    		,sortMchnHldYn404 : $('#sortMchnHldYn404').val()
	    		,sortMchnHldYn405 : $('#sortMchnHldYn405').val()
	    		,sortMchnHldYn406 : $('#sortMchnHldYn406').val()
	    		,sortMchnHldYn407 : $('#sortMchnHldYn407').val()
	    		,sortMchnHldYn408 : $('#sortMchnHldYn408').val()
	    		,sortMchnHldYn409 : $('#sortMchnHldYn409').val()
	    		,sortMchnHldYn410 : $('#sortMchnHldYn410').val()
	    		,sortMchnHldYn411 : $('#sortMchnHldYn411').val()
	    		,sortMchnHldYn412 : $('#sortMchnHldYn412').val()
    		});

        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }

        // 결과 확인 후 재조회
        console.log("update result", data);
    }

    //선택 삭제
    function fn_delete() {
    	console.log("******************fn_delete**********************************");
    	/**
         * @type {any[]}
         */
        let list = [];

        /**
         * @type {any[]}
         */
        const rows = grdStMcOpIfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });

        if (list.length == 0) {
        	alert("삭제할 대상이 없습니다.");
        	return;
        }

        fn_subDelete(confirm("삭제 하시겠습니까?"), list);

        /*
        for ( let i = 0; i < gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].msgKey);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg;
        if (delList.length == 1) {
            delMsg = delList[0];
        }
        else {
            delMsg = delList.length + "건";
        }
        delMsg += "을 삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delKey=" + delList.join(",");
            console.log("data ::::: " + params);
        }
        */
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){
     	console.log("******************fn_subDelete**********************************");
 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltAtmtcMchnInfo.do", list);

         const data = await postJsonPromise;
//예외처리
         try {
         	if (_.isEqual("S", data.resultStatus)) {
         		alert("처리 되었습니다.");
         		fn_search();
         	} else {
         		alert(data.resultMessage);
         	}
         } catch(e) {
         }

         // 결과 확인 후 재조회
         console.log("update result", data);
    }

    //상세정보 보기 클릭이벤트
    function fn_view() {
    	console.log("******************fn_view**********************************");
    	var nCol = grdStMcOpIfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdStMcOpIfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdStMcOpIfList.getRowData(nRow);
			console.log("=========rowData=======");
		console.log(rowData.sortMchnHldYnAyr1);
		console.log(rowData.sortMchnHldYn101);
		console.log(rowData.sortMchnHldYn102);
		console.log(rowData.sortMchnHldYn103);
		console.log(rowData.sortMchnHldYn104);
		console.log(rowData.sortMchnHldYn105);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);         //apc코드
		SBUxMethod.set("sortMchnHldYnAyr1",fn_checkChk(rowData.sortMchnHldYnAyr1));
		SBUxMethod.set("sortMchnHldYn101",fn_checkChk(rowData.sortMchnHldYn101));
		SBUxMethod.set("sortMchnHldYn102",fn_checkChk(rowData.sortMchnHldYn102));
		SBUxMethod.set("sortMchnHldYn103",fn_checkChk(rowData.sortMchnHldYn103));
		SBUxMethod.set("sortMchnHldYn104",fn_checkChk(rowData.sortMchnHldYn104));
		SBUxMethod.set("sortMchnHldYn105",fn_checkChk(rowData.sortMchnHldYn105));
		SBUxMethod.set("sortMchnHldYn106",fn_checkChk(rowData.sortMchnHldYn106));
		SBUxMethod.set("sortMchnHldYn107",fn_checkChk(rowData.sortMchnHldYn107));
		SBUxMethod.set("sortMchnHldYn108",fn_checkChk(rowData.sortMchnHldYn108));
		SBUxMethod.set("sortMchnHldYn109",fn_checkChk(rowData.sortMchnHldYn109));
		SBUxMethod.set("sortMchnHldYn110",fn_checkChk(rowData.sortMchnHldYn110));
		SBUxMethod.set("sortMchnHldYn111",fn_checkChk(rowData.sortMchnHldYn111));
		SBUxMethod.set("sortMchnHldYn112",fn_checkChk(rowData.sortMchnHldYn112));
		SBUxMethod.set("sortMchnHldYnAyr2",fn_checkChk(rowData.sortMchnHldYnAyr2));
		SBUxMethod.set("sortMchnHldYn201",fn_checkChk(rowData.sortMchnHldYn201));
		SBUxMethod.set("sortMchnHldYn202",fn_checkChk(rowData.sortMchnHldYn202));
		SBUxMethod.set("sortMchnHldYn203",fn_checkChk(rowData.sortMchnHldYn203));
		SBUxMethod.set("sortMchnHldYn204",fn_checkChk(rowData.sortMchnHldYn204));
		SBUxMethod.set("sortMchnHldYn205",fn_checkChk(rowData.sortMchnHldYn205));
		SBUxMethod.set("sortMchnHldYn206",fn_checkChk(rowData.sortMchnHldYn206));
		SBUxMethod.set("sortMchnHldYn207",fn_checkChk(rowData.sortMchnHldYn207));
		SBUxMethod.set("sortMchnHldYn208",fn_checkChk(rowData.sortMchnHldYn208));
		SBUxMethod.set("sortMchnHldYn209",fn_checkChk(rowData.sortMchnHldYn209));
		SBUxMethod.set("sortMchnHldYn210",fn_checkChk(rowData.sortMchnHldYn210));
		SBUxMethod.set("sortMchnHldYn211",fn_checkChk(rowData.sortMchnHldYn211));
		SBUxMethod.set("sortMchnHldYn212",fn_checkChk(rowData.sortMchnHldYn212));
		SBUxMethod.set("sortMchnHldYnAyr3",fn_checkChk(rowData.sortMchnHldYnAyr3));
		SBUxMethod.set("sortMchnHldYn301",fn_checkChk(rowData.sortMchnHldYn301));
		SBUxMethod.set("sortMchnHldYn302",fn_checkChk(rowData.sortMchnHldYn302));
		SBUxMethod.set("sortMchnHldYn303",fn_checkChk(rowData.sortMchnHldYn303));
		SBUxMethod.set("sortMchnHldYn304",fn_checkChk(rowData.sortMchnHldYn304));
		SBUxMethod.set("sortMchnHldYn305",fn_checkChk(rowData.sortMchnHldYn305));
		SBUxMethod.set("sortMchnHldYn306",fn_checkChk(rowData.sortMchnHldYn306));
		SBUxMethod.set("sortMchnHldYn307",fn_checkChk(rowData.sortMchnHldYn307));
		SBUxMethod.set("sortMchnHldYn308",fn_checkChk(rowData.sortMchnHldYn308));
		SBUxMethod.set("sortMchnHldYn309",fn_checkChk(rowData.sortMchnHldYn309));
		SBUxMethod.set("sortMchnHldYn310",fn_checkChk(rowData.sortMchnHldYn310));
		SBUxMethod.set("sortMchnHldYn311",fn_checkChk(rowData.sortMchnHldYn311));
		SBUxMethod.set("sortMchnHldYn312",fn_checkChk(rowData.sortMchnHldYn312));
		SBUxMethod.set("sortMchnHldYnAyr4",fn_checkChk(rowData.sortMchnHldYnAyr4));
		SBUxMethod.set("sortMchnHldYn401",fn_checkChk(rowData.sortMchnHldYn401));
		SBUxMethod.set("sortMchnHldYn402",fn_checkChk(rowData.sortMchnHldYn402));
		SBUxMethod.set("sortMchnHldYn403",fn_checkChk(rowData.sortMchnHldYn403));
		SBUxMethod.set("sortMchnHldYn404",fn_checkChk(rowData.sortMchnHldYn404));
		SBUxMethod.set("sortMchnHldYn405",fn_checkChk(rowData.sortMchnHldYn405));
		SBUxMethod.set("sortMchnHldYn406",fn_checkChk(rowData.sortMchnHldYn406));
		SBUxMethod.set("sortMchnHldYn407",fn_checkChk(rowData.sortMchnHldYn407));
		SBUxMethod.set("sortMchnHldYn408",fn_checkChk(rowData.sortMchnHldYn408));
		SBUxMethod.set("sortMchnHldYn409",fn_checkChk(rowData.sortMchnHldYn409));
		SBUxMethod.set("sortMchnHldYn410",fn_checkChk(rowData.sortMchnHldYn410));
		SBUxMethod.set("sortMchnHldYn411",fn_checkChk(rowData.sortMchnHldYn411));
		SBUxMethod.set("sortMchnHldYn412",fn_checkChk(rowData.sortMchnHldYn412));
    }

    function fn_checkChk(value){

        if (value === null || value === "0") {
            return "0";
        } else {
            return "1";
        }
    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdStMcOpIfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdStMcOpIfList.setCellData(i+1, 1, checkedYn, true, false);
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

	// "null" 로 들어가는 경우 방지
	function fn_emptyString(obj) {
		console.log("==========fn_emptyString=============");
	    if (Array.isArray(obj)) {
	        // 배열의 경우
	        for (var i = 0; i < obj.length; i++) {
	        	if (data[i] === "null" || data[i] === null) {
	                obj[i] = "";
	            }
	        }
	    } else if (typeof obj === "object") {
	        // 객체의 경우
	        for (var key in obj) {
	        	if (obj[key] === "null" || obj[key] === null) {
	                obj[key] = "";
	            }
	        }
	    }
	    return obj;
	}

</script>
</html>
