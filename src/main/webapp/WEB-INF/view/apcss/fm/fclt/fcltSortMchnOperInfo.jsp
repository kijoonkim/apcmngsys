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
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
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
					<col style="width: 15%">
					<col style="width: 63%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" scope="row">대상연도</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-input id="srch-input-trgtYr" name="srch-input-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>


							<th scope="row" style="border-bottom:1px solid white " class="th_bg" >APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<script type="text/javascript">
								<c:choose>
									<c:when test="${comApcList != null}">
									var cjsonApcList = ${comApcList};
									</c:when>
									<c:otherwise>
									var cjsonApcList = {};
									</c:otherwise>
								</c:choose>
								<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
									gv_selectedApcCd = null;
									gv_selectedApcNm = null;
								</c:if>
									/**
									 * @name
									 * @description
									 * @function
									 * @param {string} _apcCd
									 */
									const cfn_onChangeApc = function(obj) {
										gv_selectedApcCd = obj.value;

										const apcInfo = gfn_getJsonFilter(cjsonApcList, 'apcCd', gv_selectedApcCd);
										apcInfo.forEach( (apc) => {
											gv_selectedApcNm = apc.apcNm;
											return false;
										});

										if (typeof fn_onChangeApc === "function") {
											fn_onChangeApc();
										}

									}

								</script>
								<c:choose>
									<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
										<sbux-select
											id="gsb-slt-apcCd"
											name="gsb-slt-apcCd"
											uitype="single"
											jsondata-ref="cjsonApcList"
											unselected-text="전체"
											class="form-control input-sm"
											onchange="cfn_onChangeApc(this)"
											style="max-width:150px;"
										></sbux-select>
									</c:when>
									<c:otherwise>
										<sbux-input id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="text"  class="form-control input-sm" disabled >${loginVO.apcNm}</sbux-input>
									</c:otherwise>
								</c:choose>
							</td>
							<td></td>
					</tr>
				</tbody>
			</table>
			</div>
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
					<col style="width: 9%">
					<col style="width: 8%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
					<col style="width: 7%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg">선별기운영기간</th>
						<th class="th_bg">연중</th>
						<th class="th_bg">1</th>
						<th class="th_bg">2</th>
						<th class="th_bg">3</th>
						<th class="th_bg">4</th>
						<th class="th_bg">5</th>
						<th class="th_bg">6</th>
						<th class="th_bg">7</th>
						<th class="th_bg">8</th>
						<th class="th_bg">9</th>
						<th class="th_bg">10</th>
						<th class="th_bg">11</th>
						<th class="th_bg">12</th>
					</tr>
					<tr>
						<th class="th_bg">품목1<br>
							운영기간<br>
						</th>
						<td class="td_input"  style="margin-left: auto; !important;">
							<p class="ad_input_row"  style="margin-left: auto; !important;">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn1" name="warehouseSeCd-chk-sortMchnOperYn1" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn2" name="warehouseSeCd-chk-sortMchnOperYn2" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn3" name="warehouseSeCd-chk-sortMchnOperYn3" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn4" name="warehouseSeCd-chk-sortMchnOperYn4" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn5" name="warehouseSeCd-chk-sortMchnOperYn5" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn6" name="warehouseSeCd-chk-sortMchnOperYn6" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn7" name="warehouseSeCd-chk-sortMchnOperYn7" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn8" name="warehouseSeCd-chk-sortMchnOperYn8" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn9" name="warehouseSeCd-chk-sortMchnOperYn9" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn10" name="warehouseSeCd-chk-sortMchnOperYn10" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn11" name="warehouseSeCd-chk-sortMchnOperYn11" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn12" name="warehouseSeCd-chk-sortMchnOperYn12" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn13" name="warehouseSeCd-chk-sortMchnOperYn13" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="th_bg">품목2<br>
							운영기간<br>
						</th>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn42" name="warehouseSeCd-chk-sortMchnOperYn42" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn43" name="warehouseSeCd-chk-sortMchnOperYn43" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn44" name="warehouseSeCd-chk-sortMchnOperYn44" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn45" name="warehouseSeCd-chk-sortMchnOperYn45" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn46" name="warehouseSeCd-chk-sortMchnOperYn46" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn47" name="warehouseSeCd-chk-sortMchnOperYn47" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn48" name="warehouseSeCd-chk-sortMchnOperYn48" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn49" name="warehouseSeCd-chk-sortMchnOperYn49" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn50" name="warehouseSeCd-chk-sortMchnOperYn50" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn51" name="warehouseSeCd-chk-sortMchnOperYn51" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn52" name="warehouseSeCd-chk-sortMchnOperYn52" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn53" name="warehouseSeCd-chk-sortMchnOperYn53" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn54" name="warehouseSeCd-chk-sortMchnOperYn54" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="th_bg">품목3<br>
							운영기간<br>
						</th>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn14" name="warehouseSeCd-chk-sortMchnOperYn14" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn15" name="warehouseSeCd-chk-sortMchnOperYn15" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn16" name="warehouseSeCd-chk-sortMchnOperYn16" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn17" name="warehouseSeCd-chk-sortMchnOperYn17" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn18" name="warehouseSeCd-chk-sortMchnOperYn18" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn19" name="warehouseSeCd-chk-sortMchnOperYn19" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn20" name="warehouseSeCd-chk-sortMchnOperYn20" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn21" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn24" name="warehouseSeCd-chk-sortMchnOperYn24" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn25" name="warehouseSeCd-chk-sortMchnOperYn25" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn26" name="warehouseSeCd-chk-sortMchnOperYn26" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn27" name="warehouseSeCd-chk-sortMchnOperYn27" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn28" name="warehouseSeCd-chk-sortMchnOperYn28" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="th_bg">기타품목<br>
							운영기간<br>
						</th>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn29" name="warehouseSeCd-chk-sortMchnOperYn29" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn30" name="warehouseSeCd-chk-sortMchnOperYn30" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn31" name="warehouseSeCd-chk-sortMchnOperYn31" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn32" name="warehouseSeCd-chk-sortMchnOperYn32" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn33" name="warehouseSeCd-chk-sortMchnOperYn33" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn34" name="warehouseSeCd-chk-sortMchnOperYn34" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn35" name="warehouseSeCd-chk-sortMchnOperYn35" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn36" name="warehouseSeCd-chk-sortMchnOperYn36" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn37" name="warehouseSeCd-chk-sortMchnOperYn37" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn38" name="warehouseSeCd-chk-sortMchnOperYn38" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn39" name="warehouseSeCd-chk-sortMchnOperYn39" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn40" name="warehouseSeCd-chk-sortMchnOperYn40" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-sortMchnOperYn41" name="warehouseSeCd-chk-sortMchnOperYn41" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
					<tr>
						<th class="th_bg">대상연도</th>
						<td class="td_input" colspan="1">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="12" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">APC 코드</th>
						<td class="td_input" colspan="1" style="border-bottom: solid;">
							<script type="text/javascript">
								<c:choose>
									<c:when test="${comApcList != null}">
									var cjsonApcList = ${comApcList};
									</c:when>
									<c:otherwise>
									var cjsonApcList = {};
									</c:otherwise>
								</c:choose>
								<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
									gv_selectedApcCd = null;
									gv_selectedApcNm = null;
								</c:if>
									/**
									 * @name
									 * @description
									 * @function
									 * @param {string} _apcCd
									 */
									const cfn_onChangeApc = function(obj) {
										gv_selectedApcCd = obj.value;

										const apcInfo = gfn_getJsonFilter(cjsonApcList, 'apcCd', gv_selectedApcCd);
										apcInfo.forEach( (apc) => {
											gv_selectedApcNm = apc.apcNm;
											return false;
										});

										if (typeof fn_onChangeApc === "function") {
											fn_onChangeApc();
										}

									}

								</script>
								<c:choose>
									<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
										<sbux-select
											id="dtl-input-apcCd"
											name="dtl-input-apcCd"
											uitype="single"
											jsondata-ref="cjsonApcList"
											unselected-text="선택"
											class="form-control input-sm"
											onchange="cfn_onChangeApc(this)"
											style="max-width:150px;"
										></sbux-select>
									</c:when>
									<c:otherwise>
										<sbux-input id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="text"  class="form-control input-sm" disabled >${loginVO.apcNm}</sbux-input>
									</c:otherwise>
								</c:choose>
						</td>
						<td colspan="12" style="border-left: hidden;"></td>
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

            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["선별기 품목"],	    ref: 'sortMchnItemCd',    		type:'output',  	width:'33%',    style:'text-align:center'},
            {caption: ["선별기품목 코드"], 		ref: 'sortMchnItemCd',   		type:'output',  	width:'33%',    style:'text-align:center'},
            {caption: ["선별기운영여부"],  		ref: 'sortMchnOperYn',  			type:'output',  	width:'33%',    style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',       		type:'output',  	hidden: false},
            {caption: ["대상연도"],			ref: 'trgtYr',          	type:'output',  hidden:false},
            {caption: ["최초등록자ID"],		ref: 'creUserId',  			type:'output',  hidden: true},
            {caption: ["최초등록일시"],		ref: 'creDateTime',			type:'output',  hidden: true},
            {caption: ["최종변경자ID"],		ref: 'updUserId',   		type:'output',  hidden: true},
            {caption: ["최종변경일시"], 		ref: 'updDateTime', 		type:'output',  hidden: true},
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

		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
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
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltAtmtcMchnInfoList.do", {
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
				trgtYr: item.trgtYr,						 	    //대상연도
				apcCd: item.apcCd, 	 		 						//apc코드
				sortMchnItemCd: item.sortMchnItemCd,     	 		//선별기 품목코드
				sortMchnOperCd: item.sortMchnOperCd,    			//선별기 운영코드
				sortMchnOperYn: item.sortMchnOperYn,     			//선별기 운영여부
				delYn: item.delYn,                  				//삭제유무
	            sysFrstInptDt: item.sysFrstInptDt,       			//시스템최초입력일시
		        sysFrstInptUserId: item.sysFrstInptUserId,   	   //시스템최초입력사용자id
		        sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,     	//시스템최초입력프로그램id
		        sysLastChgDt: item.sysLastChgDt,    				//시스템최종변경일시
		        sysLastChgUserId: item.sysLastChgUserId,  			//시스템최종변경사용자id
		        sysLastChgPrgrmId: item.sysLastChgPrgrmId   		//시스템최종변경프로그램id
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
    	SBUxMethod.set("dtl-input-sortMchnItemCd", null);   		 //선별기 품목코드
        SBUxMethod.set("dtl-input-sortMchnOperCd", null);   		 // 선별기 운영 코드
        SBUxMethod.set("dtl-input-sortMchnOperYn", null);  			  //선별기 운영 유무
    	SBUxMethod.set("dtl-input-delYn", null);                  	 //  삭제유무
    	SBUxMethod.set("dtl-input-sysFrstInptDt", null);       		 //	 시스템최초입력일시
    	SBUxMethod.set("dtl-input-sysFrstInptUserId", null);      	 //  시스템최초입력사용자id
    	SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);     	 //  시스템최초입력프로그램id
    	SBUxMethod.set("dtl-input-sysLastChgDt", null);      		 //  시스템최종변경일시
    	SBUxMethod.set("dtl-input-sysLastChgUserId", null);   	 	 //  시스템최종변경사용자id
    	SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);  	 	 //  시스템최종변경프로그램id

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
    	SBUxMethod.set("dtl-input-sortMchnItemCd", null);    //선별기 품목코드
        SBUxMethod.set("dtl-input-sortMchnOperCd", null);    // 선별기 운영 코드
        SBUxMethod.set("dtl-input-sortMchnOperYn", null);    //선별기 운영 유무

    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

    	if (!SBUxMethod.get("gsb-slt-apcCd")) {
            alert("조회 항목의 APC 코드를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("srch-input-trgtYr")) {
            alert("조회 항목의 대상년도를 선택하세요.");
            return;
        }



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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltAtmtcMchnInfo.do", {
        		trgtYr: SBUxMethod.set('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
            ,	apcCd: SBUxMethod.set('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
            ,	sn: SBUxMethod.set('dtl-input-sortMchnItemCd')      		         //	 선별기 품목코드
            ,	fcltCd: SBUxMethod.set('dtl-input-sortMchnOperCd')   	             //	 선별기 운영 코드
            ,	fcltNm: SBUxMethod.set('dtl-input-sortMchnOperYn')   	             //	 선별기 운영 유무
            ,	delYn: SBUxMethod.get('dtl-input-delYn')                  			 //	 삭제유무
            ,	sysFrstInptDt: SBUxMethod.get('dtl-input-sysFrstInptDt')      	  	 //	 시스템최초입력일시
            ,	sysFrstInptUserId: SBUxMethod.get('dtl-input-sysFrstInptUserId')     //	 시스템최초입력사용자id
            ,	sysFrstInptPrgrmId: SBUxMethod.get('dtl-input-sysFrstInptPrgrmId')   //	 시스템최초입력프로그램id
            ,	sysLastChgDt: SBUxMethod.get('dtl-input-sysLastChgDt')     		 	 //	 시스템최종변경일시
            ,	sysLastChgUserId: SBUxMethod.get('dtl-input-sysLastChgUserId')  	 //	 시스템최종변경사용자id
            ,	sysLastChgPrgrmId: SBUxMethod.get('dtl-input-sysLastChgPrgrmId')   	 //	 시스템최종변경프로그램id
			,	daddr:1
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltAtmtcMchnInfo.do", {
        	trgtYr: SBUxMethod.set('dtl-input-trgtYr')   	                     //  대상연도
        ,	sortMchnItemCd: SBUxMethod.set('dtl-input-sortMchnItemCd')   	     //	 선별기 품목코드
        ,	sortMchnOperCd: SBUxMethod.set('dtl-input-sortMchnOperCd')    	     //	 선별기 운영 코드
        ,	sortMchnOperYn: SBUxMethod.set('dtl-input-sortMchnOperYn')           //	 선별기 운영 유무
        ,	delYn: SBUxMethod.get('dtl-input-delYn')                  			 //	 삭제유무
        ,	sysFrstInptDt: SBUxMethod.get('dtl-input-sysFrstInptDt')      	  	 //	 시스템최초입력일시
        ,	sysFrstInptUserId: SBUxMethod.get('dtl-input-sysFrstInptUserId')     //	 시스템최초입력사용자id
        ,	sysFrstInptPrgrmId: SBUxMethod.get('dtl-input-sysFrstInptPrgrmId')   //	 시스템최초입력프로그램id
        ,	sysLastChgDt: SBUxMethod.get('dtl-input-sysLastChgDt')     		 	 //	 시스템최종변경일시
        ,	sysLastChgUserId: SBUxMethod.get('dtl-input-sysLastChgUserId')  	 //	 시스템최종변경사용자id
        ,	sysLastChgPrgrmId: SBUxMethod.get('dtl-input-sysLastChgPrgrmId')   	 //	 시스템최종변경프로그램id
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


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
    	SBUxMethod.set("dtl-input-sortMchnItemCd", rowData.fcltCd);      //선별기 품목코드
    	SBUxMethod.set("dtl-input-sortMchnOperCd", rowData.fcltNm);     //선별기 운영 코드
    	SBUxMethod.set("dtl-input-sortMchnOperYn", rowData.apcNm);         //선별기 운영 유무
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

</script>
</html>