<%
 /**
  * @Class Name : regRawMtrWrhsPrfmnc.jsp
  * @Description : 원물입고 실적등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	정희운			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 원물입고등록 -->
					<sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="normal" class="btn btn-sm btn-primary" onclick="fn_docRawMtrWrhs" text="원물인식표" ></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_save" text="저장" ></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_delete" text="삭제" ></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-wrhsno" name="srch-inp-wrhsno" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
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
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>생산자</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td colspan="6"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonApcVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td>&nbsp;</td>

						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-wrhsSeCd"
										name="srch-rdo-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComWrhsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
<!-- 							<td colspan="4">&nbsp;</td> -->
							<th scope="row" class="th_bg">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-trsprtSeCd"
										name="srch-rdo-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComTrsprtSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">수량/<span class="data_required" ></span>중량</th>
							<td colspan="3" class="td_input"style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-bxQntt"
									name="srch-inp-bxQntt"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="6"
									autocomplete="off"
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeBxQntt(this)"
								/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-wghtAvg"
									name="srch-inp-wghtAvg"
									class="form-control input-sm"
									placeholder="평균"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWghtAvg(this)"
								/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-wrhsWght"
									name="srch-inp-wrhsWght"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="7"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWrhsWght(this)"
								/>
							</td>
							<td colspan="5">
								<sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"/>
							</td>
							<th scope="row" class="th_bg">차량/운임</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vhclno"
									name="srch-inp-vhclno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-vhcl"
									name="srch-btn-vhcl"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceVhcl"
								/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-trsprtCst"
									name="srch-inp-trsprtCst"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true }"
									readonly
								/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-trsprtCst"
									name="srch-btn-trsprtCst"
									class="btn btn-xs btn-outline-dark"
									text="등록" uitype="modal"
									target-id="modal-trsprtCst"
									onclick="fn_choiceTrsprtCst"
								/>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-bxKnd"
									name="srch-slt-bxKnd"
									class="form-control input-sm"
									jsondata-ref="jsonApcBx"
								/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-warehouseSeCd"
									name="srch-slt-warehouseSeCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonComWarehouse"
								/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>생산연도</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-prdctnYr"
									name="srch-dtp-prdctnYr"
									date-format="yyyy"
									datepicker-mode="year"
									class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
								/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="srch-inp-rmrk"
									name="srch-inp-rmrk"
									class="form-control input-sm"
									autocomplete="off"
								/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">팔레트번호</th>
							<td colspan= "6" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-pltno"
									name="srch-inp-pltno"
									class="form-control input-sm"
									autocomplete="off"
								/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>등급</th>
							<td colspan="19" class="td_input">
								<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
							</td>
						</tr>
					</tbody>
				</table>


				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>원물입고 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-wrhs">0</span>건)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" ></sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-sm btn-outline-danger" onclick="fn_uld"></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-grdRawMtrWrhs" style="height:410px;"></div>
					</div>
				</div>
				<!-- <div class="exp-div-excel" style="display: none;width: 2000px;"> none block-->
				<div class="exp-div-excel" style="display: none;width: 1000px;">
					<div id="sbexp-area-grdExpRawMtrWrhs" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWarehouseSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpBxKnd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpStdGrd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpStdGrdDtl" style="height:1px; width: 100%;"></div>
					<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
				</div>
				<!-- 엑셀 시트별 데이터 영역 -->
				<!--
				<div style="display: none">


					<div class="row" >
						<div class="col-sm-3">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>원물입고샘플</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-excelRawMtrWrhs" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>APC 품목</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdItem" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>APC 품종</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdVrty" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>생산자</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdPrdcr" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>입고구분코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdWrhsSeCd" style="height:157px; width: 100%;"></div>
							</div>
						</div>
					</div>
					<div class="row" >
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>상품구분코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdGdsSeCd" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>운송구분코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdTrsprtSeCd" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>창고코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdWarehouseSeCd" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>박스코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdBxKnd" style="height:157px; width: 100%;"></div>
							</div>
						</div>

						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>등급코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdStdGrd" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span>등급상세코드</span></li>
								</ul>
							</div>
							<div>
								<div id="sb-area-grdStdGrdDtl" style="height:157px; width: 100%;"></div>
							</div>
						</div>
						<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
					</div>
				</div>
				-->
			</div>
		</div>

	</section>



    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>
    <!-- 운임 선택 Modal -->
    <div>
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>

    <!-- 원물입고 엑셀 등록 Modal -->
    <div>
        <sbux-modal
        	id="modal-imp"
        	name="modal-imp"
        	uitype="middle"
        	header-title="원물입고등록(Excel)"
        	body-html-id="body-modal-imp"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
		></sbux-modal>
    </div>
    <div id="body-modal-imp">
    	<jsp:include page="../../am/popup/importExcelPopup.jsp"></jsp:include>
    </div>

    <div>
        <sbux-modal id="modal-excel" name="modal-excel" uitype="middle" header-title="원물입고등록" body-html-id="body-modal-excel" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-excel">
    	<jsp:include page="../../am/popup/rawMtrWrhsPrfmncPopup.jsp"></jsp:include>
    </div>
    <sbux-button id="btnRawMtrWrhsfmncPopup" name="btnRawMtrWrhsfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel" onclick="fn_modal('btnSpmtSlsUntprcReg')"></sbux-button>
	<!-- importExcelPopup -->
</body>

<script type="text/javascript">

	const lv_paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };

	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		grdCd		검색
	var jsonApcSpcfct		= [];	// 규격 		spcfcCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonApcBx			= [];	// 팔레트/박스 	검색

	var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
	var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
	var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    /* SBGrid */
	var grdRawMtrWrhs;
    /* SBGrid Data (JSON) */
	var jsonRawMtrWrhs = [];

    let vhclData = {vhclno : null, drvrNm : null, bankNm : null, bankCd : null, actno : null, dpstr : null};

    /**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			 	gfn_setPltBxSBSelect('srch-slt-bxKnd', 			jsonApcBx, gv_selectedApcCd, 'B'),	// 박스
			 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),		// 품목
			 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd)		// 품종
			]);
	}

    /**
     * @name fn_initSBRadio
     * @description SBRadio JSON 불러오기
     */
    const fn_initSBRadio = async function() {

    	let result = await Promise.all([
	    		gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
	    		gfn_getComCdDtls('GDS_SE_CD', gv_selectedApcCd),		// 상품구분
	    		gfn_getComCdDtls('TRSPRT_SE_CD')	// 운송구분
    		]);

    	jsonComWrhsSeCd = gfn_getJsonFilter(result[0], 'cdVl', ["1", "2", "3"]);
		jsonComGdsSeCd = result[1];
		jsonComTrsprtSeCd = result[2];

		SBUxMethod.refresh('srch-rdo-wrhsSeCd');
		SBUxMethod.refresh('srch-rdo-gdsSeCd');
		SBUxMethod.refresh('srch-rdo-trsprtSeCd');
    }


	/**
	 * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		fn_createGrid();

		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio(),
				fn_getPrdcrs()
			]);

		fn_clearForm();
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		stdGrdSelect.init();
	});

	/**
	 * @name fn_createGrid
	 * @description 원물입고실적 그리드 생성
	 */
	const fn_createGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = lv_paging;

	    SBGridProperties.columns = [
	        {caption: ["입고번호"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],	ref: 'pltno',      	type:'output',  width:'120px',    style:'text-align:center', hidden: true},
	        {caption: ["생산자"],		ref: 'prdcrNm',     type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',     type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'wrhsSeNm',    type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'trsprtSeNm',  type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'grdNm',      	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],	ref: 'wrhsWght',    type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["박스종류"],		ref: 'bxKndNm',     type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'warehouseSeNm',	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'wghno',      	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산연도"],		ref: 'prdctnYr',    type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상세등급"],		ref: 'stdGrd',    	type:'output',  width:'200px',    style:'text-align:left'},
	        {caption: ["비고"],		ref: 'rmrk',      	type:'output',  width:'200px',    style:'text-align:left'},

	        {caption: ["APC코드"],	ref: 'apcCd',     	type:'output',  hidden: true},
	        {caption: ["생산자코드"],	ref: 'prdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   	type:'output',  hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 	type:'output',  hidden: true},
	        {caption: ["등급코드"],		ref: 'grdCd',   	type:'output',  hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   	type:'output',  hidden: true},
	        {caption: ["보관창고코드"],	ref: 'warehouseSeCd', type:'output',  hidden: true},
	        {caption: ["상세등급코드"],	ref: 'stdGrdCd', type:'output',  hidden: true},
	    ];

	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
	    // TODO 바인드 추가 확인할 것
	    grdRawMtrWrhs.bind('click', fn_view);
	}


	/**
	 * common button action
	 */

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = function() {
		fn_clearForm();
	}

	/**
     * @name fn_delete
     * @description 삭제 버튼
     */
	const fn_delete = async function() {
		let wrhsno = SBUxMethod.get("srch-inp-wrhsno");

		if (gfn_isEmpty(wrhsno)) {
			gfn_comAlert("W0004", "선택");		//	W0004	{0}한 대상이 없습니다.
            return;
		}

		const rawMtrWrhs = {
    		apcCd: gv_selectedApcCd,
    		wrhsno: wrhsno
    	}

    	let postUrl = "/am/wrhs/deleteRawMtrWrhs.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_inputClear();
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
 	}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		let wrhsno = SBUxMethod.get("srch-inp-wrhsno");
    	// 항목 set
    	let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
 		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
 		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
 		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분
 		let itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
 		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");		// 생산자
 		let bxQntt = SBUxMethod.get("srch-inp-bxQntt");			// 수량
 		let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");		// 중량
 		let pltno = SBUxMethod.get("srch-inp-pltno");			// 팔레트번호
 		let bxKnd = SBUxMethod.get("srch-slt-bxKnd");			// 박스종류
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
 		let vhclno = SBUxMethod.get("srch-inp-vhclno");			// 차량번호
 		let trsprtCst = SBUxMethod.get("srch-inp-trsprtCst");	// 운임비용
 		let rmrk = SBUxMethod.get("srch-inp-rmrk");				// 비고
 		//let grdCd = SBUxMethod.get("srch-slt-grdCd");			// 등급
 		let wghno = SBUxMethod.get("srch-inp-wghno");			// 계량번호
 		let prdctnYr = SBUxMethod.get("srch-dtp-prdctnYr");		// 생산연도

    	// validation check
    	if (gfn_isEmpty(wrhsYmd)) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(wrhsSeCd)) {
    		gfn_comAlert("W0001", "입고구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(gdsSeCd)) {
    		gfn_comAlert("W0001", "상품구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(trsprtSeCd)) {
    		gfn_comAlert("W0001", "운송구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(itemCd)) {
    		gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(vrtyCd)) {
    		gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	if (gfn_isEmpty(wrhsWght)) {
    		gfn_comAlert("W0001", "중량");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	if (gfn_isEmpty(warehouseSeCd)) {
    		gfn_comAlert("W0001", "창고");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if (gfn_isEmpty(prdctnYr)) {
    		gfn_comAlert("W0001", "생산연도");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	// 등급
    	const stdGrd = stdGrdSelect.getStdGrd();

    	if (gfn_isEmpty(stdGrd)) {
    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if (stdGrd.isOmit) {
    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	let grdCd = stdGrd.grdJgmt.grdCd;
    	if (gfn_isEmpty(grdCd)) {
    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if (!gfn_comConfirm("Q0001", "저장")) {
    		return;
    	}

    	const rawMtrWrhs = {
    		apcCd: gv_selectedApcCd,
    		wrhsno: wrhsno,
   			wrhsYmd: wrhsYmd,
   			wrhsSeCd: wrhsSeCd,
   			gdsSeCd: gdsSeCd,
   			trsprtSeCd: trsprtSeCd,
   			itemCd: itemCd,
   			vrtyCd: vrtyCd,
   			prdcrCd: prdcrCd,
   			bxQntt: bxQntt,
   			wrhsWght: wrhsWght,
   			pltno: pltno,
   			bxKnd: bxKnd,
   			warehouseSeCd: warehouseSeCd,
   			vhclno: vhclno,
   			trsprtCst: trsprtCst,
   			rmrk: rmrk,
   			grdCd: grdCd,
   			wghno: wghno,
   			prdctnYr: prdctnYr,
   			stdGrdList: stdGrd.stdGrdList
    	}

    	let postUrl = gfn_isEmpty(wrhsno) ? "/am/wrhs/insertRawMtrWrhs.do" : "/am/wrhs/updateRawMtrWrhs.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_inputClear();
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }

	}

    const fn_view = async function() {

		let nRow = grdRawMtrWrhs.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdRawMtrWrhs.getRowData(nRow);

     	// 입고번호
		SBUxMethod.set("lbl-wrhsno", "입고번호 : " + rowData.wrhsno);
		SBUxMethod.set("srch-inp-wrhsno", rowData.wrhsno);

		SBUxMethod.set("srch-dtp-wrhsYmd", rowData.wrhsYmd);	// 입고일자
 		SBUxMethod.set("srch-rdo-wrhsSeCd", rowData.wrhsSeCd);		// 입고구분
 		SBUxMethod.set("srch-rdo-gdsSeCd", rowData.gdsSeCd);		// 상품구분
 		SBUxMethod.set("srch-rdo-trsprtSeCd", rowData.trsprtSeCd);	// 운송구분

 		SBUxMethod.set("srch-inp-prdcrCd", rowData.prdcrCd);
 		SBUxMethod.set("srch-inp-prdcrNm", rowData.prdcrNm);
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

 		SBUxMethod.set("srch-inp-bxQntt", rowData.bxQntt);			// 수량
 		fn_onChangeWrhsWght();

 		SBUxMethod.set("srch-inp-pltno", rowData.pltno);			// 팔레트번호
 		SBUxMethod.set("srch-slt-bxKnd", rowData.bxKnd);			// 박스종류
 		SBUxMethod.set("srch-slt-warehouseSeCd", rowData.warehouseSeCd);	// 창고
 		SBUxMethod.set("srch-inp-vhclno", rowData.vhclno);			// 차량번호

 		SBUxMethod.set("srch-inp-rmrk", rowData.rmrk);				// 비고
 		if (gfn_isEmpty(rowData.rmrk)) {
 			SBUxMethod.set("srch-inp-rmrk", "");				// 비고
 		}

 		SBUxMethod.set("srch-inp-wghno", rowData.wghno);			// 계량번호

 		await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
		SBUxMethod.set("srch-slt-vrtyCd", rowData.vrtyCd);
		await fn_onChangeSrchVrtyCd({value: rowData.vrtyCd});

 		if (!gfn_isEmpty(rowData.prdctnYr)) {
 			SBUxMethod.set("srch-inp-prdctnYr", rowData.prdctnYr);	// 생산연도
 		}

 		SBUxMethod.set("srch-inp-wrhsWght", rowData.wrhsWght);		// 중량

		const stdGrdList = [];
		if (!gfn_isEmpty(rowData.stdGrdCd)) {
			rowData.stdGrdCd.split(',').forEach((item) => {
				const grd = item.split(':');
				stdGrdList.push({
					grdKnd: grd[0],
					grdCd: grd[1]
				});
			});
		}
		console.log("stdGrdList");
		console.log(stdGrdList);

		const stdGrdObj = {
				apcCd: rowData.apcCd,
				grdSeCd: _GRD_SE_CD_WRHS,	// 등급구분코드:원물입고
				itemCd: rowData.itemCd,
				stdGrdList: stdGrdList,
				grdJgmt: {grdCd: rowData.grdCd}
			}
		console.log("stdGrdObj");
		console.log(stdGrdObj);

		stdGrdSelect.setStdGrd(rowData.apcCd, _GRD_SE_CD_WRHS, rowData.itemCd, stdGrdObj);
    }

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

    	fn_clearInptForm();

        // set pagination
    	grdRawMtrWrhs.rebuild();
    	let pageSize = grdRawMtrWrhs.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrWrhs.length = 0;
    	grdRawMtrWrhs.clearStatus();
    	fn_setGrdRawMtrWrhs(pageSize, pageNo);

		SBUxMethod.set("lbl-wrhsno", "");
		SBUxMethod.set("srch-inp-wrhsno", "");
	}

    /**
     * @name fn_setGrdRawMtrWrhs
     * @description 입고내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdRawMtrWrhs = async function(pageSize, pageNo) {

   		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
  		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
  		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
  		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자

  		let itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmd: wrhsYmd,
			//wrhsSeCd: wrhsSeCd,
			//gdsSeCd: gdsSeCd,
			//trsprtSeCd: trsprtSeCd,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrWrhs.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhs = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						apcNm: item.apcNm,
  						wrhsno: item.wrhsno,
  						wghno: item.wghno,
  						pltno: item.pltno,
  						wrhsYmd: item.wrhsYmd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						vhclno: item.vhclno,
  						bxQntt: item.bxQntt,
  						wrhsWght: item.wrhsWght,
  						bxKnd: item.bxKnd,
  						bxKndNm: item.bxKndNm,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						prdctnYr: item.prdctnYr,
  						rmrk: item.rmrk,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
  				}
  				jsonRawMtrWrhs.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonRawMtrWrhs.length > 0) {
          		if(grdRawMtrWrhs.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdRawMtrWrhs.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdRawMtrWrhs.rebuild();
  				}else{
  					grdRawMtrWrhs.refresh();
  				}
          	} else {
          		grdRawMtrWrhs.setPageTotalCount(totalRecordCount);
          		grdRawMtrWrhs.rebuild();
          	}

          	document.querySelector('#cnt-wrhs').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

    const fn_inputClear = function() {
  		// 수량
  		SBUxMethod.set("srch-inp-bxQntt", "");
  		// 중량
  		SBUxMethod.set("srch-inp-wrhsWght", "");
  		// 평균
  		SBUxMethod.set("srch-inp-wghtAvg", "");
    }

 	/**
      * @name fn_clearForm
      * @description form 초기화
      * @function
      */
 	const fn_clearForm = function() {

		SBUxMethod.set("lbl-wrhsno", "");
		SBUxMethod.set("srch-inp-wrhsno", "");

 		// 입고일자
 		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));

 		// 입고구분
 		SBUxMethod.set("srch-rdo-wrhsSeCd", "3");
 		// 상품구분
 		SBUxMethod.set("srch-rdo-gdsSeCd", "1");
 		// 운송구분
 		SBUxMethod.set("srch-rdo-trsprtSeCd", "1");

 		// 품목
 		SBUxMethod.set("srch-slt-itemCd", null);
 		// 품종
 		SBUxMethod.set("srch-slt-vrtyCd", null);

 		fn_clearInptForm();

 		fn_onChangeSrchItemCd({value: null});
 	}

 	const fn_clearInptForm = function() {
 		// 수량
 		SBUxMethod.set("srch-inp-bxQntt", "");
 		// 중량
 		SBUxMethod.set("srch-inp-wrhsWght", "");
 		// 평균
 		SBUxMethod.set("srch-inp-wghtAvg", "");

 		// 팔레트번호
 		SBUxMethod.set("srch-inp-pltno", "");

 		// 박스종류
 		SBUxMethod.set("srch-slt-bxKnd", null);

 		// 창고
 		SBUxMethod.set("srch-slt-warehouseSeCd", null);

 		// 차량번호
 		SBUxMethod.set("srch-inp-vhclno", "");

 		// 운임비용
 		SBUxMethod.set("srch-inp-trsprtCst", "");

 		// 생산연도
 		SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));

 		// 비고
 		SBUxMethod.set("srch-inp-rmrk", "");

 		// 등급
 		SBUxMethod.set("srch-slt-grdCd", null);

 		// 계량번호
 		SBUxMethod.set("srch-inp-wghno", "");

 		// 생산자
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.set("srch-inp-prdcrIdentno", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue
 	}

	/** ui event */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		let result = await Promise.all([
			fn_initSBSelect(),
			fn_initSBRadio(),
			fn_getPrdcrs()
		]);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			//gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd),
			stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
		]);

		if (gfn_isEmpty(itemCd)) {
			SBUxMethod.set("srch-inp-wghtAvg", "");
		}
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});

		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = vrtyInfo.mastervalue;
		} else {
			itemCd = SBUxMethod.get("srch-slt-itemCd");
			SBUxMethod.set("srch-inp-wghtAvg", "");
			fn_onChangeWghtAvg();
		}

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
		const wghtRkngSeCd = vrtyInfo.wghtRkngSeCd;
		const unitWght = parseInt(vrtyInfo.unitWght) || 0;
		SBUxMethod.set("srch-inp-wghtAvg", unitWght);
		fn_onChangeWghtAvg();
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}

		if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
			SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
		}
		if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
			SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
		}
		if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
			SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
		}

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}

	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);
			vhclData = {
							vhclno 	: vhcl.vhclno
					  	  , drvrNm 	: vhcl.drvrNm
					  	  , bankNm 	: vhcl.bankNm
					  	  , bankCd 	: vhcl.bankCd
					  	  , actno 	: vhcl.actno
					  	  , dpstr 	: vhcl.dpstr
					   };
		}
	}

	/**
	 * @name fn_choiceTrsprtCst
	 * @description 원물운임비용등록 popup
	 */
	const fn_choiceTrsprtCst = function() {
		//_trsprtYmd, _vhclno, _callbackFnc
		//
		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");
		let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");
		let data = {
						apcCd 		: gv_selectedApcCd,
						trsprtYmd 	: null,
						vhclno 		: null,
			  			drvrNm 		: null,
			  			bankNm 		: null,
			  			bankCd 		: null,
			  			actno 		: null,
			  			dpstr 		: null,
						trsprtSeCd 	: trsprtSeCd,
						wrhsWght 	: wrhsWght
				    };
		if(!gfn_isEmpty(wrhsYmd)){
			data.trsprtYmd = wrhsYmd;
		} else {
			data.trsprtYmd = gfn_dateToYmd(new Date());
		}
		if(!gfn_isEmpty(SBUxMethod.get("srch-inp-vhclno"))){
			data.vhclno = vhclData.vhclno;
			data.drvrNm = vhclData.drvrNm;
			data.bankNm = vhclData.bankNm;
			data.bankCd = vhclData.bankCd;
			data.actno = vhclData.actno;
			data.dpstr = vhclData.dpstr;
		}
		popTrsrptCst.init(gv_selectedApcCd, gv_selectedApcNm, data, fn_setTrsprtCst);
	}

	const fn_setTrsprtCst = function(trsprtCst) {
		if (!gfn_isEmpty(trsprtCst)) {
			SBUxMethod.set("srch-inp-trsprtCst", trsprtCst.trsprtCst);
		}
	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}

	const fn_onChangeBxQntt = function(obj) {
		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

		if (wghtAvg > 0) {
			let wrhsWght = Math.round(bxQntt * wghtAvg);
			SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
		}
	}

	const fn_onChangeWghtAvg = function(obj) {

		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

		if (wghtAvg > 0) {
			let wrhsWght = Math.round(bxQntt * wghtAvg);
			SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
		}
	}

	const fn_onChangeWrhsWght = function(obj) {
		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wrhsWght = parseInt(SBUxMethod.get("srch-inp-wrhsWght")) || 0;
		/*
		if (bxQntt > 0 && wrhsWght > 0) {
			let wghtAvg = Math.round(wrhsWght / bxQntt);
			SBUxMethod.set("srch-inp-wghtAvg", wghtAvg);
		}
		*/
	}

	/**
     * @name fn_docRawMtrWrhs
     * @description 원물확인서 발행 버튼
     */
	const fn_docRawMtrWrhs = function() {
		let wrhsno = SBUxMethod.get("srch-inp-wrhsno");

		if (gfn_isEmpty(wrhsno)) {
			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
            return;
		}

		gfn_popClipReport("원물인식표", "am/rawMtrIdntyDoc.crf", {apcCd: gv_selectedApcCd, wrhsno: wrhsno});
	}



	// exp combo
	var jsonExpSltItem = [];
	var jsonExpSltVrty = [];
	var jsonExpSltPrdcr = [];
	var jsonExpSltWrhsSeCd = [];
	var jsonExpSltGdsSeCd = [];
	var jsonExpSltTrsprtSeCd = [];
	var jsonExpSltWarehouseSeCd = [];
	var jsonExpSltBxKnd = [];

	var grdExpRawMtrWrhs;
	var grdExpItem;
	var grdExpVrty;
	var grdExpPrdcr;
	var grdExpWrhsSeCd;
	var grdExpGdsSeCd;
	var grdExpTrsprtSeCd;
	var grdExpWarehouseSeCd;
	var grdExpBxKnd;
	var grdExpStdGrd;
	var grdExpStdGrdDtl;

	// exp grid json
	var jsonExpRawMtrWrhs = [];
	var jsonExpItem = [];
	var jsonExpVrty = [];
	var jsonExpPrdcr = [];
	var jsonExpWrhsSeCd = [];
	var jsonExpGdsSeCd = [];
	var jsonExpTrsprtSeCd = [];
	var jsonExpWarehouseSeCd = [];
	var jsonExpBxKnd = [];
	var jsonExpStdGrd = [];
	var jsonExpStdGrdDtl = [];

	const fn_getExpColumns = function() {
		const _columns = []
		_columns.push(
			{caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 		ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
	        {caption: ["입고구분"], 	ref: 'wrhsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltWrhsSeCd', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
	        {caption: ["상품구분"], 	ref: 'gdsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltGdsSeCd', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
	        {caption: ["운송구분"], 	ref: 'trsprtSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltTrsprtSeCd', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
	        {caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltWarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["박스"],		ref: 'pltBxCd ',	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltBxKnd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["생산연도"],		ref: 'prdctnYr',    	type:'output',  width:'80px',    style:'text-align:left'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],	ref: 'wrhsWght',    type:'output',  width:'60px',    style:'text-align:right'},
		);

		const columnsStdGrd = [];
	    gjsonStdGrdObjKnd.forEach((item, index) => {
			const grd = {
				caption: ["등급:" + item.grdKndNm],
				ref: gStdGrdObj.colPrfx + item.grdKnd,
				type:'combo',
				width:'80px',
				style: 'text-align:center;background-color:#FFF8DC;',
				userattr: {colNm: "stdGrd"},
				typeinfo: {ref: item.jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
			}
			columnsStdGrd.push(grd);
		});

	    if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
			const jgmtGrd = {
				caption: ["판정등급"],
				ref: "jgmtGrdCd",
				type:'combo',
				width:'80px',
				style: 'text-align:center;',
				userattr: {colNm: "jgmtGrd"},
				typeinfo: {ref: gStdGrdObj.jgmtJsonId, label:'grdNm', value:'grdCd', displayui : false}
			}
			_columns.push(jgmtGrd);
		}

	    columnsStdGrd.forEach((item) => {
	    	_columns.push(item);
		});

	    _columns.push(
			{caption: ["비고"],		ref: 'rmrk',      	type:'output',  width:'200px',    style:'text-align:left'}
	    );

	    return _columns;
	}

	const fn_setSltJson = async function() {
		// set exp/imp combo json
		// 품목
		jsonExpSltItem = gfn_cloneJson(jsonApcItem);
		// 품종
		jsonExpSltVrty = gfn_cloneJson(jsonApcVrty);
		// 생산자
		jsonExpSltPrdcr = gfn_cloneJson(jsonPrdcr);
		// 입고구분
		jsonExpSltWrhsSeCd = gfn_cloneJson(jsonComWrhsSeCd);
		// 상품구분
		jsonExpSltGdsSeCd = gfn_cloneJson(jsonComGdsSeCd);
		// 운송구분
		jsonExpSltTrsprtSeCd = gfn_cloneJson(jsonComTrsprtSeCd);
		// 보관창고
		jsonExpSltWarehouseSeCd = gfn_cloneJson(jsonComWarehouse);
		// 박스
		jsonExpSltBxKnd = gfn_cloneJson(jsonApcBx);
	}

	const fn_setExpJson = async function() {
		// export grid data
		jsonExpRawMtrWrhs.length = 0;
		jsonExpItem = gfn_cloneJson(jsonApcItem);
		jsonExpVrty = gfn_cloneJson(jsonApcVrty);
		jsonExpPrdcr = gfn_cloneJson(jsonPrdcr);
		jsonExpWrhsSeCd = gfn_cloneJson(jsonComWrhsSeCd);
		jsonExpGdsSeCd = gfn_cloneJson(jsonComGdsSeCd);
		jsonExpTrsprtSeCd = gfn_cloneJson(jsonComTrsprtSeCd);
		jsonExpWarehouseSeCd = gfn_cloneJson(jsonComWarehouse);
		jsonExpBxKnd = gfn_cloneJson(jsonApcBx);
		jsonExpStdGrd = gfn_cloneJson(gjsonStdGrdObjKnd);
		jsonExpStdGrdDtl = gfn_cloneJson(gjsonStdGrdObjDtl);
	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach( (exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';;
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;

			exp.sbGrid = _SBGrid.create(SBGridProperties);
			exp.sbGrid.addRow(true);
			/*
			if (idx === 0) {
				exp.sbGrid.addRow(true, {
				   	wrhsYmd 		: gfn_dateToYmd(new Date())
			      , itemCd			: "0101"
			      , vrtyCd			: "2000"
			      , prdcrCd			: "0001"
			      , wrhsSeCd		: "1"
			      , gdsSeCd			: "1"
			      , trsprtSeCd		: "1"
			      , warehouseSeCd 	: "01"
			      , pltBxCd 		: "0001"
			      , prdctnYr		: "2023"
			      , stdGrd			: "01"
			      , stdGrdDtl		: "01"
			      , bxQntt    		: "5"
			      , wrhsWght		: "500"
			      , rmrk			: "비고"
				});
			}
			*/
		});
	}

	const fn_dwnld = async function(){

		const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
		}

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();

		const expObjList = [
		    {
		        sbGrid: grdExpRawMtrWrhs,
		        parentid: "sbexp-area-grdExpRawMtrWrhs",
		        id: "grdExpRawMtrWrhs",
		        jsonref: "jsonExpRawMtrWrhs",
				columns: expColumns,
		        sheetName: "원물입고목록",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpItem,
		        parentid: "sbexp-area-grdExpItem",
		        id: "grdExpItem",
		        jsonref: "jsonExpItem",
				columns: [
			    	{caption: ["품목코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
			        {caption: ["품목명칭"],     ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품목",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpVrty,
		        parentid: "sbexp-area-grdExpVrty",
		        id: "grdExpVrty",
		        jsonref: "jsonExpVrty",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품종코드"],    ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품종명칭"],    ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품종",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   ref: 'prdcrCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    	ref: 'prdcrNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ['대표품목'],		ref: 'rprsItemCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpWrhsSeCd,
		        parentid: "sbexp-area-grdExpWrhsSeCd",
		        id: "grdExpWrhsSeCd",
		        jsonref: "jsonExpWrhsSeCd",
				columns: [
			    	{caption: ["입고구분코드"],   	ref: 'cdVl',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["입고구분코드명"],  	ref: 'cdVlNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "입고구분",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpGdsSeCd,
		        parentid: "sbexp-area-grdExpGdsSeCd",
		        id: "grdExpGdsSeCd",
		        jsonref: "jsonExpGdsSeCd",
				columns: [
			    	{caption: ["상품구분코드"],   	ref: 'cdVl',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품구분코드명"],  	ref: 'cdVlNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "상품구분",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpTrsprtSeCd,
		        parentid: "sbexp-area-grdExpTrsprtSeCd",
		        id: "grdExpTrsprtSeCd",
		        jsonref: "jsonExpTrsprtSeCd",
				columns: [
			    	{caption: ["운송구분코드"],   	ref: 'cdVl',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["운송구분코드명"],  	ref: 'cdVlNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "운송구분",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpWarehouseSeCd,
		        parentid: "sbexp-area-grdExpWarehouseSeCd",
		        id: "grdExpWarehouseSeCd",
		        jsonref: "jsonExpWarehouseSeCd",
				columns: [
			    	{caption: ["창고코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["창고코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "창고",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpBxKnd,
		        parentid: "sbexp-area-grdExpBxKnd",
		        id: "grdExpBxKnd",
		        jsonref: "jsonExpBxKnd",
				columns: [
			    	{caption: ["박스코드"],   	ref: 'pltBxCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["박스코드명"],  	ref: 'pltBxNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "박스",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpStdGrd,
		        parentid: "sbexp-area-grdExpStdGrd",
		        id: "grdExpStdGrd",
		        jsonref: "jsonExpStdGrd",
				columns: [
			    	{caption: ["품목코드"],   	ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품목명"],   	ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드"],   	ref: 'grdKnd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드명"],  	ref: 'grdKndNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "등급",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpStdGrdDtl,
		        parentid: "sbexp-area-grdExpStdGrdDtl",
		        id: "grdExpStdGrdDtl",
		        jsonref: "jsonExpStdGrdDtl",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품목명"],   	ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드"],   	ref: 'grdKnd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급명"],   	ref: 'grdKndNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급상세코드"], 	ref: 'grdCd',  		type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급상세명"],  	ref: 'grdNm',  		type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "등급상세",
		        title: "",
		        unit: ""
		    },
		];

		await fn_createExpGrid(expObjList);

		//exportExcel();
	    gfn_exportExcelMulti("원물입고(샘플).xlsx", expObjList);
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		var objExcelInfo = {
			strFileName : _fileName,
			//strAction : "/saveExcel.do",
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}


	const importExcelData = function (e){
    	 SBUxMethod.openModal('modal-excel');
    	 fn_createGridPopup();
    	 jsonExcelRawMtrWrhsPopup = 0;
    	 grdExcelRawMtrWrhsPopup.rebuild();

    	 grdExcelRawMtrWrhsPopup.importExcelData(e);
     }

     const fn_uld = async function() {

		const impColumns = fn_getExpColumns();
		await fn_setSltJson();

		var SBGridProperties = {};
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = impColumns;
		popImp.importExcel(
    			"원물입고실적 Import",
    			SBGridProperties,
    			fn_importRawMtrWrhs
			);

    	 //$("#btnFileUpload").click();
     }

     const fn_importRawMtrWrhs = async function() {
    	 alert('import data save');
     }

</script>
</html>