<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>

	<!-- 엑셀 리포트 샘플 추가 -->
	<script src="../../../../resource/script/co/guide/excelReport.js"></script>

	<style>
		.tableWrap{background:var(--card);border:1px solid var(--line);border-radius:16px;padding:12px}
		.tableScroll{overflow:auto}
		.tbl_doc{width:100%;border-collapse:separate;border-spacing:0;min-width:1100px}
		.thd_doc th{position:sticky;top:0;background:#e6e6fa;border-bottom:1px solid var(--line);padding:10px 12px;text-align:left;color:#0f172a;font-size:12px}
		.tbd_doc td{border-bottom:1px solid var(--line);vertical-align:top;padding:10px 12px}
		.tbd_doc tr:hover{background:#f5f5f5}
		.pickCell{width:68px;text-align:center}
		.evGroup{display:grid;gap:8px}
		.evItem{border:1px dashed #263455;border-radius:10px;padding:8px;background:#f5f5f5}
		.evHead{display:flex;align-items:center;gap:8px;margin-bottom:6px}
		.evName{font-size:13px;color:#0f172a}
		.badgeTiny{font-size:11px;padding:1px 6px;border-radius:999px;border:1px solid var(--line);}
		.files{display:flex;flex-wrap:wrap;gap:6px;margin-top:6px}
		.chip{border:1px solid #314064;border-radius:8px;padding:3px 8px;font-size:12px;color:#4169e1}
		.sum{display:flex;justify-content:flex-end;gap:16px;align-items:center;margin-top:14px;color:#cbd5e1}
		.sum strong{font-size:18px}
		.hint{font-size:12px;color:#93c5fd;margin-top:10px}
		.money{font-variant-numeric: tabular-nums}
		.txa-resize{resize:both}
	</style>
</head>
<body oncontextmenu="return false">
    <section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ 팝업</h3>
				</div>
				<div style="margin-left: auto;">
				</div>
			</div>
			<div class="box-body">
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
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
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" >품목선택</th>
							<td class="td_input">
								<sbux-input id="item-inp-itemNm" name="item-inp-itemNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchItem" name="btnSrchItem" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-itemCrtr" onclick="fn_modalItem"></sbux-button>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목선택</th>
							<td class="td_input">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" >생산자선택</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									maxlength="33"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >팔레트/박스 선택</th>
							<td class="td_input">
								<sbux-input
									id="srch-inp-pltWght"
									name="srch-inp-pltWght"
									uitype="text"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									id="srch-inp-bxWght"
									name="srch-inp-bxWght"
									uitype="text"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
							</td>
							<th scope="row" >거래처선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >마감등록</th>
							<td class="td_input">
								<sbux-button id="btnRegDdln" name="btnRegDdln" class="btn btn-xs btn-outline-dark" text="마감등록" uitype="modal" target-id="modal-ddln" onclick="fn_regDDln"></sbux-button>
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >차량선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" maxlength="8" class="form-control pull-right input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
							<td></td>

							<th scope="row" >원물운임비용</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="srch-inp-trsprtCst"
									name="srch-inp-trsprtCst"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true }"
								/>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchTrsprtCst" name="btnSrchTrsprtCst" class="btn btn-xs btn-outline-dark" text="등록" uitype="modal" target-id="modal-trsprtCst" onclick="fn_choiceTrsprtCst"></sbux-button>
							</td>
							<td class="td_input">
							</td>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gds" onclick="fn_modalGds" text="찾기"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >출하지시번호</th>
							<td class="td_input">
								<sbux-input id="srch-inp-spmtCmndno" name="srch-inp-spmtCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSpmtCmndNo" name="btnSrchSpmtCmndNo" uitype="modal" text="찾기" class="btn btn-xs btn-outline-dark" target-id="modal-spmtCmnd" onclick="fn_choiceSpmtCmnd"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >선별지시번호선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-sortCmndno" name="srch-inp-sortCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSortCmndno" name="btnSrchSortCmndno" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-sortCmndno" onclick="fn_modalSortCmndno" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >포장지시번호선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-pckgCmndno" name="srch-inp-pckgCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPckgCmndno" name="btnSrchPckgCmndno" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-pckgCmndno" onclick="fn_modalPckgCmndno" text="찾기"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >원물재고선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-rawMtrInvntr" name="srch-inp-rawMtrInvntr" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchRawMtrInvntr" name="btnSrchRawMtrInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-rawMtrInvntr" onclick="fn_modalRawMtrInvntr" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >선별재고선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-sortInvntr" name="srch-inp-sortInvntr" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSortInvntr" name="btnSrchSortInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-sortInvntr" onclick="fn_modalSortInvntr" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >상품재고선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-gdsInvntr" name="srch-inp-gdsInvntr" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchGdsInvntr" name="btnSrchGdsInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gdsInvntr" onclick="fn_modalGdsInvntr" text="찾기"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >생산작업자선택</th>
							<td class="td_input">
								<sbux-input id="srch-inp-flnm" name="srch-inp-flnm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchOprtr" name="btnSrchOprtr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-oprtr" onclick="fn_modalOprtr" text="찾기"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >입고일자</th>
							<td class="td_input">
								<sbux-datepicker id="srch-dtp-trsprtYmd" name="srch-dtp-trsprtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" >레포트(JSON)</th>
							<td class="td_input">
								테스트
							</td>
							<td class="td_input">
								<sbux-button
									id="btnSrchReportJSON"
									name="btnSrchReportJSON"
									uitype="normal"
									class="btn btn-sm btn-primary"
									onclick="fn_reportJSON"
									text="리포트"
								></sbux-button>
							</td>
							<td class="td_input">
								<sbux-button
										id="btnSrchReportPdfJSON"
										name="btnSrchReportPdfJSON"
										uitype="normal"
										class="btn btn-sm btn-primary"
										onclick="fn_reportPdfJSON"
										text="PDF (pw:111)"
								></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" >엑셀리포트</th>
							<td colspan="2">
								<sbux-button
										id="srch-btn-excelReport"
										name="srch-btn-excelReport"
										uitype="normal"
										class="btn btn-sm btn-primary"
										onclick="fn_exportExcelReport"
										text="엑셀다운로드"
								></sbux-button>
							</td>
							<td></td>
							<td colspan="8"></td>

						</tr>
					</tbody>
				</table>
			</div>
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li>
						<span>증빙서류</span>
					</li>
				</ul>
				<div class="ad_tbl_toplist">
					<sbux-button
							id="doc-btn-newRow"
							name="doc-btn-newRow"
							uitype="normal"
							text="➕추가"
							class="btn btn-sm btn-primary"
							onclick="fn_docNewRow"
					></sbux-button>
				</div>
			</div>
			<div class="tableWrap"><!-- table table-bordered tbl_fixed -->
				<div class="tableScroll">
					<table class="tbl_doc" id="doc-tbl-prufDoc"> <!--  class="table table-bordered tbl_fixed" -->
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 20%">
						</colgroup>
						<thead class="thd_doc">
							<tr>
								<th rowspan="2" scope="col">주요항목</th>
								<th rowspan="2" scope="col">세부항목</th>
								<th rowspan="2" scope="col">내용</th>
								<th rowspan="2" scope="col">정산요청액</th>
								<th colspan="2" scope="col">증빙서류</th>
								<th rowspan="2" scope="col">비고</th>
							</tr>
							<tr>
								<th scope="col">공통</th>
								<th scope="col">세부항목별 증빙</th>
							</tr>
						</thead>
						<tbody class="tbd_doc" id="doc-tbd-oldData">

						</tbody>
						<tbody class="tbd_doc" id="doc-tbd-newData">

						</tbody>
						<tfoot class="tft_doc">
							<tr>
								<th colspan="3" scope="row">합계</th>
								<td></td>
								<td colspan="3"></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="../../am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>

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

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" header-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup.jsp"></jsp:include>
    </div>

    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>

    <!-- 원물운임비용등록 Modal -->
    <div>
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>

     <!-- 마감 등록 Modal -->
    <div>
        <sbux-modal id="modal-ddln" name="modal-ddln" uitype="middle" header-title="마감 등록" body-html-id="body-modal-ddln" footer-is-close-button="false" header-is-close-button="false" style="width:700px"></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/regDdlnPopup.jsp"></jsp:include>
    </div>

    <!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmnd">
    	<jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
    </div>

     <!-- 상품 선택 Modal -->
    <div>
        <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gds">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/gdsPopup.jsp"></jsp:include>
    </div>

     <!-- 생산작업자 선택 Modal -->
    <div>
        <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 선택" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-oprtr">
    	<jsp:include page="../../am/popup/oprtrPopup.jsp"></jsp:include>
    </div>

    <!-- 포장지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-pckgCmndno" name="modal-pckgCmndno" uitype="middle" header-title="포장지시번호 선택" body-html-id="body-modal-pckgCmndno" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-pckgCmndno">
    	<jsp:include page="../../am/popup/pckgCmndPopup.jsp"></jsp:include>
    </div>

    <!-- 선별재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-sortInvntr" name="modal-sortInvntr" uitype="middle" header-title="선별재고 선택" body-html-id="body-modal-sortInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-sortInvntr">
    	<jsp:include page="../../am/popup/sortInvntrPopup.jsp"></jsp:include>
    </div>

    <!-- 선별지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-sortCmndno" name="modal-sortCmndno" uitype="middle" header-title="선별지시번호 선택" body-html-id="body-modal-sortCmndno" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-sortCmndno">
    	<jsp:include page="../../am/popup/sortCmndnoPopup.jsp"></jsp:include>
    </div>

    <!-- 원물재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-rawMtrInvntr" name="modal-rawMtrInvntr" uitype="middle" header-title="원물재고 선택" body-html-id="body-modal-rawMtrInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-rawMtrInvntr">
    	<jsp:include page="../../am/popup/rawMtrInvntrPopup.jsp"></jsp:include>
    </div>

    <!-- 상품재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-gdsInvntr" name="modal-gdsInvntr" uitype="middle" header-title="상품재고 선택" body-html-id="body-modal-gdsInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gdsInvntr">
    	<jsp:include page="../../am/popup/gdsInvntrPopup.jsp"></jsp:include>
    </div>

<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_getPrdcrs();
		SBUxMethod.set("srch-dtp-trsprtYmd", gfn_dateToYmd(new Date()));
		fn_initSBSelect();
	})

	 const fn_initSBSelect = async function() {
		// 검색 SB select
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd);		// 품목
	}

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_getPrdcrs();
		fn_initSBSelect();
	}

	/* 생산자 팝업 호출 필수 json  */
	/* Start */
	var autoCompleteDataJson = [];
	var jsonDataPrdcr = [];
	var jsonPrdcr = [];
	var jsonPrdcrAutocomplete = [];
	/* End */


	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 팝업 호출
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
		}
	}
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}
	/* End */


	/* 차량선택 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 차량선택팝업 호출
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	/**
	 * @name fn_setVhcl
	 * @description 차량 선택 callback
	 */
	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	/* End */


	/* 원물운임비용등록팝업 호출 필수 json  */
	/* Start */
	let vhclData = {vhclno : null, drvrNm : null, bankNm : null, bankCd : null, actno : null, dpstr : null};
	/* End */


	/* 원물운임비용등록팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 원물운임비용등록팝업 호출
	 */
	 const fn_choiceTrsprtCst = function() {
			//_trsprtYmd, _vhclno, _callbackFnc
			//
			let trsprtYmd = SBUxMethod.get("srch-dtp-trsprtYmd");
			let data = {
							apcCd 		: gv_selectedApcCd,
							trsprtYmd 	: null,
							vhclno 		: null,
				  			drvrNm 		: null,
				  			bankNm 		: null,
				  			bankCd 		: null,
				  			actno 		: null,
				  			dpstr 		: null,
							trsprtSeCd 	: null,
							wrhsWght 	: null
					    };
			if(!gfn_isEmpty(trsprtYmd)){
				data.trsprtYmd = trsprtYmd;
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

	/**
	 * @name fn_setVhcl
	 * @description 원물운임비용 선택 callback
	 */
	const fn_setTrsprtCst = function(trsprtCst) {
		if (!gfn_isEmpty(trsprtCst)) {
			SBUxMethod.set("srch-inp-trsprtCst", trsprtCst.trsprtCst);   // callBack input
		}
	}
	/* End */


	/* 마감등록팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_regDDln
	 * @description 마감등록팝업 호출
	 */
	const fn_regDDln = function() {
		fn_modalDdln(gv_selectedApcCd, gv_selectedApcNm);
	}
	/* End */


	/* 품종선택팝업 호출 필수 json  */
	/* Start */
	var jsonComItem	= [];
	/* End */

	/* 품종선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_selectItem
	 * @description 품목콤보 선택 시 이벤트
	 */
    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	/**
	 * @name fn_modalVrty
	 * @description 품종선택팝업 호출
	 */
    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
    	//_apcCd, _apcNm, _itemNm, _callbackFnc
	}

    /**
	 * @name fn_setVrty
	 * @description 단일 품종 callback
	 */
    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}

    /**
	 * @name fn_setVrtys
	 * @description 복수 품종 callback
	 */
	 const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}

 	/**
	 * @name
	 * @description 품종 input 삭제 버튼 이벤트
	 */
	 $(function(){
			$(".glyphicon").on("click", function(){
				SBUxMethod.set("srch-inp-vrtyNm", "");
				SBUxMethod.set("srch-inp-vrtyCd", "");
			})
		})
	/* End */


	/* 거래처선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalCnpt
	 * @description 거래처선택팝업 호출
	 */
 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, "", fn_setCnpt);
 	}

 	/**
	 * @name fn_setCnpt
	 * @description 거래처 선택 callback
	 */
 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			SBUxMethod.set('srch-slt-cnptCd', cnpt.cnptCd);
			SBUxMethod.refresh('srch-slt-cnptCd');
 		}
 	}

 	/* End */


	/* 출하지시번호선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_choiceSpmtCmnd
	 * @description 출하지시번호선택팝업 호출
	 */
	 const fn_choiceSpmtCmnd = function() {
// 		 let searchData = {
// 			regSpmtList	: regSpmtList
// 		}

    	popSpmtCmnd.init(gv_selectedApcCd, gv_selectedApcNm, null, fn_setSpmtCmnd);
	}

	/**
	 * @name fn_setSpmtCmnd
	 * @description 출하지시번호 선택 callback
	 */
	const fn_setSpmtCmnd = function(spmtCmnd) {
		if (!gfn_isEmpty(spmtCmnd)) {
			SBUxMethod.set('srch-inp-spmtCmndno', spmtCmnd.spmtCmndno);
		}
	}
	/* End */


	/* 상품선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalGds
	 * @description 상품선택팝업 호출
	 */
	const fn_modalGds = function() {
    	popGds.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-gdsNm"), fn_setGdsNm);
	}

	/**
	 * @name fn_setGdsNm
	 * @description 상품 선택 callback
	 */
	const fn_setGdsNm = function(gds) {
		if (!gfn_isEmpty(gds)) {
			SBUxMethod.set('srch-inp-gdsNm', gds.spmtPckgUnitNm);
		}
	}
	/* End */

	/* 생산작업자 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalOprtr
	 * @description 생산작업자선택팝업 호출
	 */
	const fn_modalOprtr = function() {
		popOprtr.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-flnm"), fn_setFlnm);
	}

	/**
	 * @name fn_setFlnm
	 * @description 생산작업자 선택 callback
	 */
	const fn_setFlnm = function(oprtr) {
		if (!gfn_isEmpty(oprtr)) {
			SBUxMethod.set('srch-inp-flnm', oprtr.flnm);
		}
	}
	/* End */

	/* 포장지시번호 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalPckgCmndno
	 * @description 포장지시번호선택팝업 호출
	 */
	 const fn_modalPckgCmndno = function() {
		popPckgCmnd.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPckgCmnd);
	}

	/**
	 * @name fn_setPckgCmnd
	 * @description 포장지시번호 선택 callback
	 */
	 const fn_setPckgCmnd = function(pckgCmnd) {
		if (!gfn_isEmpty(pckgCmnd)) {
			SBUxMethod.set('srch-inp-pckgCmndno', pckgCmnd.pckgCmndno);
		}
	}
	/* End */

	/* 선별재고 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalSortInvntr
	 * @description 선별재고선택팝업 호출
	 */
	 const fn_modalSortInvntr = function() {
		popSortInvntr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortInvntr);
	}

	/**
	 * @name fn_setSortInvntr
	 * @description 선별재고 선택 callback
	 */
	 const fn_setSortInvntr = function(sortInvntr) {
		if (!gfn_isEmpty(sortInvntr)) {
			SBUxMethod.set('srch-inp-sortInvntr', sortInvntr.sortno);
		}
	}
	/* End */

	/* 선별지시번호 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalSortCmndno
	 * @description 선별지시번호선택팝업 호출
	 */
	 const fn_modalSortCmndno = function() {
		 popSortCmndno.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortCmndno);
	}

	/**
	 * @name fn_setSortCmndno
	 * @description 선별지시번호 선택 callback
	 */
	 const fn_setSortCmndno = function(sortCmndno) {
		if (!gfn_isEmpty(sortCmndno)) {
			SBUxMethod.set('srch-inp-sortCmndno', sortCmndno.sortCmndno);
		}
	}
	/* End */

	/* 원물재고 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalRawMtrInvntr
	 * @description 원물재고선택팝업 호출
	 */
	 const fn_modalRawMtrInvntr = function() {
		 popRawMtrInvntr.init({apcCd : gv_selectedApcCd, apcNm : gv_selectedApcNm}, fn_setRawMtrInvntr);
	}

	/**
	 * @name fn_setRawMtrInvntr
	 * @description 원물재고 선택 callback
	 */
	 const fn_setRawMtrInvntr = function(rawMtrInvntr) {
		if (!gfn_isEmpty(rawMtrInvntr)) {
			SBUxMethod.set('srch-inp-rawMtrInvntr', rawMtrInvntr.pltno);
		}
	}
	/* End */

	/* 상품재고 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalGdsInvntr
	 * @description 상품재고선택팝업 호출
	 */
	 const fn_modalGdsInvntr = function() {
// 		let searchData = {
// 			itemCd 		: SBUxMethod.get('srch-inp-itemCd'),
// 			vrtyCd 		: SBUxMethod.get('srch-inp-vrtyCd'),
// 			spcfctCd	: SBUxMethod.get('srch-inp-spcfctCd'),
// 			gdsGrd		: SBUxMethod.get('srch-inp-gdsGrd'),
// 			spmtGdsList	: spmtGdsList
// 		}

		popGdsInvntr.init(gv_selectedApcCd, gv_selectedApcNm, null, fn_setGdsInvntr);
	}

	/**
	 * @name fn_setGdsInvntr
	 * @description 상품재고 선택 callback
	 */
	 const fn_setGdsInvntr = function(gdsInvntr) {
		if (!gfn_isEmpty(gdsInvntr)) {
			SBUxMethod.set('srch-inp-gdsInvntr', gdsInvntr.pckgno);
		}
	}
	/* End */

	/* 생산자 팝업 호출 필수 json  */
	/* Start */
	var pltBxData = null;
	/* End */

	/* 원물입고 팔레트/박스 입고등록팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalPltBx
	 * @description 원물입고 팔레트/박스 입고등록팝업 호출
	 */
	const fn_modalPltBx = function() {
		popPltBx.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPltBx, pltBxData);
	}

	/**
	 * @name fn_setPltBx
	 * @description 팔레트 팝업 callback
	 */
	const fn_setPltBx = function(_pltBxData) {
		if (!gfn_isEmpty(_pltBxData)) {
			// 팔레트/박스 Kg set
			SBUxMethod.set("srch-inp-pltWght", _pltBxData.totalPltWght);
			SBUxMethod.set("srch-inp-bxWght", _pltBxData.totalBxWght);
			//정산중량 Kg set
			//fn_setClclnWght();
		}
	}


	const score = {
		"root":[
			{"Data Structures":"B0","Database":"","ExamType":"1학기 중간","ID":1,"Introduction to Computer Science":"C+","JAVA Programing":"D0","Operating System":"A0","Software Engineering":"B+","StudentID":1},{"Data Structures":"A0","Database":"B0","ExamType":"1학기 기말","ID":2,"Introduction to Computer Science":"B+","JAVA Programing":"C+","Operating System":"B+","Software Engineering":"B+","StudentID":1},{"Data Structures":"B0","Database":"A0","ExamType":"2학기 중간","ID":3,"Introduction to Computer Science":"B0","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"A+","StudentID":1},{"Data Structures":"D0","Database":"C+","ExamType":"2학기 기말","ID":4,"Introduction to Computer Science":"D0","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"A+","StudentID":1},{"Data Structures":"B+","Database":"C+","ExamType":"1학기 중간","ID":5,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"D+","StudentID":2},{"Data Structures":"D+","Database":"C+","ExamType":"1학기 기말","ID":6,"Introduction to Computer Science":"C+","JAVA Programing":"A+","Operating System":"A+","Software Engineering":"C+","StudentID":2},{"Data Structures":"D0","Database":"B0","ExamType":"2학기 중간","ID":7,"Introduction to Computer Science":"B+","JAVA Programing":"B0","Operating System":"A0","Software Engineering":"A0","StudentID":2},{"Data Structures":"D+","Database":"B0","ExamType":"2학기 기말","ID":8,"Introduction to Computer Science":"C+","JAVA Programing":"A+","Operating System":"C+","Software Engineering":"C+","StudentID":2},{"Data Structures":"B+","Database":"B0","ExamType":"1학기 중간","ID":9,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"D+","Software Engineering":"C+","StudentID":3},{"Data Structures":"A0","Database":"B0","ExamType":"1학기 기말","ID":10,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"D+","StudentID":3},{"Data Structures":"C+","Database":"D+","ExamType":"2학기 중간","ID":11,"Introduction to Computer Science":"C+","JAVA Programing":"D0","Operating System":"C+","Software Engineering":"D+","StudentID":3},{"Data Structures":"B0","Database":"B+","ExamType":"2학기 기말","ID":12,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"A+","Software Engineering":"C+","StudentID":3},{"Data Structures":"D+","Database":"A0","ExamType":"1학기 중간","ID":13,"Introduction to Computer Science":"C+","JAVA Programing":"D+","Operating System":"A0","Software Engineering":"C+","StudentID":4},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 기말","ID":14,"Introduction to Computer Science":"D+","JAVA Programing":"D0","Operating System":"D+","Software Engineering":"A0","StudentID":4},{"Data Structures":"B0","Database":"C+","ExamType":"2학기 중간","ID":15,"Introduction to Computer Science":"C+","JAVA Programing":"D+","Operating System":"B+","Software Engineering":"B0","StudentID":4},{"Data Structures":"B0","Database":"C+","ExamType":"2학기 기말","ID":16,"Introduction to Computer Science":"C+","JAVA Programing":"D+","Operating System":"A0","Software Engineering":"D+","StudentID":4},{"Data Structures":"B0","Database":"B+","ExamType":"1학기 중간","ID":17,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"C+","Software Engineering":"D+","StudentID":5},{"Data Structures":"D+","Database":"D+","ExamType":"1학기 기말","ID":18,"Introduction to Computer Science":"A0","JAVA Programing":"D0","Operating System":"A0","Software Engineering":"D+","StudentID":5},{"Data Structures":"C+","Database":"B0","ExamType":"2학기 중간","ID":19,"Introduction to Computer Science":"D+","JAVA Programing":"A0","Operating System":"A+","Software Engineering":"C+","StudentID":5},{"Data Structures":"D+","Database":"B+","ExamType":"2학기 기말","ID":20,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"D+","StudentID":5},{"Data Structures":"D+","Database":"B0","ExamType":"1학기 중간","ID":21,"Introduction to Computer Science":"D+","JAVA Programing":"A0","Operating System":"A0","Software Engineering":"B0","StudentID":6},{"Data Structures":"B0","Database":"D+","ExamType":"1학기 기말","ID":22,"Introduction to Computer Science":"D+","JAVA Programing":"A0","Operating System":"A+","Software Engineering":"D0","StudentID":6},{"Data Structures":"C+","Database":"B0","ExamType":"2학기 중간","ID":23,"Introduction to Computer Science":"A+","JAVA Programing":"D+","Operating System":"D+","Software Engineering":"B0","StudentID":6},{"Data Structures":"C+","Database":"C+","ExamType":"2학기 기말","ID":24,"Introduction to Computer Science":"A+","JAVA Programing":"A0","Operating System":"B+","Software Engineering":"C+","StudentID":6},{"Data Structures":"C+","Database":"C+","ExamType":"1학기 중간","ID":25,"Introduction to Computer Science":"B+","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"C+","StudentID":7},{"Data Structures":"A+","Database":"D0","ExamType":"1학기 기말","ID":26,"Introduction to Computer Science":"C+","JAVA Programing":"A+","Operating System":"D0","Software Engineering":"C+","StudentID":7},{"Data Structures":"C+","Database":"B+","ExamType":"2학기 중간","ID":27,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"C+","Software Engineering":"C+","StudentID":7},{"Data Structures":"B+","Database":"A+","ExamType":"2학기 기말","ID":28,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"B+","StudentID":7},{"Data Structures":"A+","Database":"B0","ExamType":"1학기 중간","ID":29,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"B+","Software Engineering":"B0","StudentID":8},{"Data Structures":"A0","Database":"B+","ExamType":"1학기 기말","ID":30,"Introduction to Computer Science":"B+","JAVA Programing":"A0","Operating System":"D0","Software Engineering":"C+","StudentID":8},{"Data Structures":"A+","Database":"A0","ExamType":"2학기 중간","ID":31,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"B+","Software Engineering":"B0","StudentID":8},{"Data Structures":"D0","Database":"C+","ExamType":"2학기 기말","ID":32,"Introduction to Computer Science":"B+","JAVA Programing":"D0","Operating System":"C+","Software Engineering":"B+","StudentID":8},{"Data Structures":"A+","Database":"B+","ExamType":"1학기 중간","ID":33,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"C+","StudentID":9},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 기말","ID":34,"Introduction to Computer Science":"B+","JAVA Programing":"B+","Operating System":"B0","Software Engineering":"C+","StudentID":9},{"Data Structures":"A+","Database":"B+","ExamType":"2학기 중간","ID":35,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"C+","Software Engineering":"C+","StudentID":9},{"Data Structures":"C+","Database":"A0","ExamType":"2학기 기말","ID":36,"Introduction to Computer Science":"C+","JAVA Programing":"D0","Operating System":"B0","Software Engineering":"B+","StudentID":9},{"Data Structures":"C+","Database":"C+","ExamType":"1학기 중간","ID":37,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"F","Software Engineering":"C+","StudentID":10},{"Data Structures":"B+","Database":"A0","ExamType":"1학기 기말","ID":38,"Introduction to Computer Science":"D+","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"C+","StudentID":10},{"Data Structures":"C+","Database":"D+","ExamType":"2학기 중간","ID":39,"Introduction to Computer Science":"D0","JAVA Programing":"C+","Operating System":"B0","Software Engineering":"D0","StudentID":10},{"Data Structures":"D+","Database":"A0","ExamType":"2학기 기말","ID":40,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"C+","StudentID":10},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 중간","ID":41,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"D+","StudentID":11},{"Data Structures":"D0","Database":"C+","ExamType":"1학기 기말","ID":42,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"D+","Software Engineering":"D0","StudentID":11},{"Data Structures":"C+","Database":"B+","ExamType":"2학기 중간","ID":43,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"A0","StudentID":11},{"Data Structures":"B0","Database":"C+","ExamType":"2학기 기말","ID":44,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"B0","Software Engineering":"B0","StudentID":11},{"Data Structures":"C+","Database":"A+","ExamType":"1학기 중간","ID":45,"Introduction to Computer Science":"B0","JAVA Programing":"C+","Operating System":"B0","Software Engineering":"A0","StudentID":12},{"Data Structures":"B+","Database":"B0","ExamType":"1학기 기말","ID":46,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B0","Software Engineering":"A0","StudentID":12},{"Data Structures":"C+","Database":"A0","ExamType":"2학기 중간","ID":47,"Introduction to Computer Science":"C+","JAVA Programing":"B0","Operating System":"C+","Software Engineering":"B0","StudentID":12},{"Data Structures":"B0","Database":"D0","ExamType":"2학기 기말","ID":48,"Introduction to Computer Science":"B0","JAVA Programing":"B0","Operating System":"D0","Software Engineering":"B0","StudentID":12},{"Data Structures":"B+","Database":"A+","ExamType":"1학기 중간","ID":49,"Introduction to Computer Science":"B0","JAVA Programing":"B+","Operating System":"B0","Software Engineering":"A+","StudentID":13},{"Data Structures":"B0","Database":"C+","ExamType":"1학기 기말","ID":50,"Introduction to Computer Science":"B0","JAVA Programing":"A+","Operating System":"C+","Software Engineering":"A+","StudentID":13},{"Data Structures":"B0","Database":"D0","ExamType":"2학기 중간","ID":51,"Introduction to Computer Science":"B+","JAVA Programing":"B+","Operating System":"D0","Software Engineering":"B+","StudentID":13},{"Data Structures":"C+","Database":"A0","ExamType":"2학기 기말","ID":52,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"C+","StudentID":13},{"Data Structures":"A0","Database":"B+","ExamType":"1학기 중간","ID":53,"Introduction to Computer Science":"C+","JAVA Programing":"C+","Operating System":"A0","Software Engineering":"B+","StudentID":14},{"Data Structures":"C+","Database":"A0","ExamType":"1학기 기말","ID":54,"Introduction to Computer Science":"B+","JAVA Programing":"D0","Operating System":"C+","Software Engineering":"B0","StudentID":14},{"Data Structures":"D0","Database":"C+","ExamType":"2학기 중간","ID":55,"Introduction to Computer Science":"B+","JAVA Programing":"A0","Operating System":"C+","Software Engineering":"B0","StudentID":14},{"Data Structures":"C+","Database":"B+","ExamType":"2학기 기말","ID":56,"Introduction to Computer Science":"A0","JAVA Programing":"C+","Operating System":"C+","Software Engineering":"B+","StudentID":14},{"Data Structures":"B0","Database":"D0","ExamType":"1학기 중간","ID":57,"Introduction to Computer Science":"D0","JAVA Programing":"A0","Operating System":"B0","Software Engineering":"B0","StudentID":15},{"Data Structures":"C+","Database":"D0","ExamType":"1학기 기말","ID":58,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"C+","StudentID":15},{"Data Structures":"B0","Database":"A0","ExamType":"2학기 중간","ID":59,"Introduction to Computer Science":"C+","JAVA Programing":"A0","Operating System":"B+","Software Engineering":"B0","StudentID":15},{"Data Structures":"A+","Database":"D0","ExamType":"2학기 기말","ID":60,"Introduction to Computer Science":"C+","JAVA Programing":"B+","Operating System":"B+","Software Engineering":"B0","StudentID":15}
		]
	};
	const students = {
		"root":[
			{"_Name":"권우창","Address":"서울특별시 강남구 테헤란로2길 8","Birth":19850403,"Gender":"남","ID":1},{"_Name":"김병성","Address":"서울특별시 강남구 대치동 131번지 0호 2 은마- 219","Birth":19780608,"Gender":"남","ID":2},{"_Name":"손경석","Address":"서울특별시 강남구 역삼동 730번지 5호","Birth":19840820,"Gender":"남","ID":3},{"_Name":"이래우","Address":"서울특별시 양천구 목동 121번지 4호 지상 5층","Birth":19780417,"Gender":"남","ID":4},{"_Name":"이민정","Address":"서울특별시 강남구 개포동 1218번지 27호","Birth":19791212,"Gender":"여","ID":5},{"_Name":"이수우","Address":"서울특별시 서대문구 대현동 60번지 60호","Birth":19841026,"Gender":"여","ID":6},{"_Name":"김영우","Address":"서울특별시 서대문구 남가좌동 291번지 26호","Birth":19881010,"Gender":"남","ID":7},{"_Name":"이승건","Address":"서울특별시 서대문구 대현동 37번지 75호","Birth":19820531,"Gender":"남","ID":8},{"_Name":"전주철","Address":"서울특별시 양천구 목동 929번지 한청상가 7,8호","Birth":19810707,"Gender":"남","ID":9},{"_Name":"홍일석","Address":"서울특별시 용산구 이태원동 59번지 4호 에덴빌딩 지상6층","Birth":19750922,"Gender":"남","ID":10},{"_Name":"김기정","Address":"서울특별시 은평구 불광동 168번지 1호 1층","Birth":19910818,"Gender":"남","ID":11},{"_Name":"김숙현","Address":"서울특별시 은평구 응암동 590번지 32호 1층","Birth":19910104,"Gender":"여","ID":12},{"_Name":"남성주","Address":"서울특별시 중구 신당동 292번지 74호 1층","Birth":19850327,"Gender":"여","ID":13},{"_Name":"성해진","Address":"서울특별시 중랑구 묵동 159번지 27호\r\n 서울특별시 중랑구 묵동 159번지 27호","Birth":19730208,"Gender":"여","ID":14},{"_Name":"손선실","Address":"서울특별시 송파구 가락동 79번지 3호 대동빌딩 지하1층 101호","Birth":19760704,"Gender":"여","ID":15}
		]
	};

	const fn_reportJSON = function() {

		/*
		_conn = [
			{
				memo: "JSON1",
				name: "JSONDS1",
				rootPath: "{%dataset.json.root%}",
				data: {
					root: [
						
					]
				}
			},
			{
				memo: "JSON2",
				name: "JSONDS2",
				rootPath: "{%dataset.json.root%}",
				data: {
					root: [
						
					]
				}
			},
		]
		*/
		
		const conn = [];
		conn.push({data: score},{data: students});

		gfn_popClipReportPost(
					"레포트출력 샘플(JSON)", 
					"am/jsonSample.crf", 
					null,
					conn
				);
	}

	const fn_reportPdfJSON = async function() {

		const conn = [];
		conn.push({data: score},{data: students});

		await gfn_getReportPdfFetch("test.pdf", "am/jsonSample.crf", conn, {userPassword:""}, null);

	}


	var jsonMajorArticle = [
		{
			value: "PRUF_OGNZ",
			text: "조직화",
		},
		{
			value: "PRUF_PRMT",
			text: "홍보 및 마케팅",
		},
		{
			value: "PRUF_DVLP",
			text: "상품개발",
		},
		{
			value: "PRUF_CMNS",
			text: "공통",
		},
	];

	var jsonArticle = [
		{
			mastervalue: "PRUF_OGNZ",
			value: "FRMHS_EDUCO",
			text: "1. 농가 교육비",
		},
		{
			mastervalue: "PRUF_OGNZ",
			value: "FRMHS_CNSLT",
			text: "2. 농가 농가조직화 컨설팅",
		},
		{
			mastervalue: "PRUF_PRMT",
			value: "OM_PR_GDS",
			text: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작",
		},
		{
			mastervalue: "PRUF_PRMT",
			value: "PRMT_GIFT",
			text: "2. 각종 홍보물 제작",
		},
		{
			mastervalue: "PRUF_DVLP",
			value: "DVLP_LBSRVC",
			text: "1. 상품개발 용역",
		},
		{
			mastervalue: "PRUF_CMNS",
			value: "MTG_CST",
			text: "1. 각종 회의비용",
		},
	];

	/**
	 * 기본증빙문서
	 * @type {[{text: string, value: string}]}
	 */
	var jsonPrufDocBsc = [
		{
			mastervalue: "PRUF_BSC",
			value: "B102",
			text: "영수증(또는 전자세금계산서)",
		},
		{
			mastervalue: "PRUF_BSC",
			value: "D203",
			text: "(현급거래시) 계좌이체내역 및 통장입금확인증 사본",
		},
	]

	/**
	 *
	 * @type {[{artclCd: string, text: string, artclNm: string, value: string}]}
	 */
	var jsonPrufDoc = [
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "A101", text: "계약서사본"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "C101", text: "사업자등록증"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "F101", text: "참석자명부"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "B201", text: "강사수당 서명영수증"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "B202", text: "강사수당 원천징수영수증"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "A201", text: "차량, 장소 임차계약서(해당시)"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "H101", text: "결과보고서"},
		{artclCd: "FRMHS_EDUCO", artclNm: "1. 농가 교육비", value: "X101", text: "기타증빙(보완요청시)"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "A101", text: "계약서사본"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "C101", text: "사업자등록증"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "F101", text: "참석자명부"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "B201", text: "강사수당 서명영수증"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "B202", text: "강사수당 원천징수영수증"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "A201", text: "차량, 장소 임차계약서(해당시)"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "H101", text: "결과보고서"},
		{artclCd: "FRMHS_CNSLT", artclNm: "2. 농가 농가조직화 컨설팅", value: "X101", text: "기타증빙(보완요청시)"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "A101", text: "계약서사본"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "C101", text: "사업자등록증"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "F101", text: "참석자명부"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "B201", text: "강사수당 서명영수증"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "B202", text: "강사수당 원천징수영수증"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "A201", text: "차량, 장소 임차계약서(해당시)"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "H101", text: "결과보고서"},
		{artclCd: "FRMHS_ADV", artclNm: "3. 농가조직화 자문", value: "X101", text: "기타증빙(보완요청시)"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "A101", text: "계약서사본"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "C101", text: "사업자등록증"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "F101", text: "참석자명부"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "B201", text: "강사수당 서명영수증"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "B202", text: "강사수당 원천징수영수증"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "A201", text: "차량, 장소 임차계약서(해당시)"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "H101", text: "결과보고서"},
		{artclCd: "CNSGN_EDUCO", artclNm: "4. 위탁교육비", value: "X101", text: "기타증빙(보완요청시)"},
		{artclCd: "QLT_INSP", artclNm: "5. 산지 품질조사비 및 검사비", value: "E102", text: "검사확인증 사본"},
		{artclCd: "VST_TRNG", artclNm: "6. 국내외 선진지 견학 등 연수", value: "F101", text: "참석자명부"},
		{artclCd: "VST_TRNG", artclNm: "6. 국내외 선진지 견학 등 연수", value: "H101", text: "결과보고서"},
		{artclCd: "VST_TRNG", artclNm: "6. 국내외 선진지 견학 등 연수", value: "A202", text: "차량 임차계약서"},
		{artclCd: "VST_TRNG", artclNm: "6. 국내외 선진지 견학 등 연수", value: "B801", text: "(국외 선진지) 여행사 INVOICE"},
		{artclCd: "VST_TRNG", artclNm: "6. 국내외 선진지 견학 등 연수", value: "B802", text: "(국외 선진지) e-티켓 또는 탑승권"},
		{artclCd: "VST_TRNG", artclNm: "6. 국내외 선진지 견학 등 연수", value: "C202", text: "(국외 선진지) 탑승자 재직증명서"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "D101", text: "급여내역서"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "C201", text: "재직증명서"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "J101", text: "업무분장표"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "D202", text: "급여이체내역"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "E301", text: "온라인도매시장 거래실적 확인서"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "B203", text: "갑종근로소득 원천징수영수증"},
		{artclCd: "UOOM_LBRCO", artclNm: "7. 생산유통 통합조직 및 온라인도매시장 인건비", value: "F201", text: "4대 사회보험 사업장 가입자 명부"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "G101", text: "(샘플제공시) 온라인도매시장 견본상품 요청서(양식)"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "E203", text: "(샘플제공시) 원물단가 확인서"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "E401", text: "(샘플제공시) 택배운송장"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "B101", text: "(샘플제공시) 영수증"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "A101", text: "(상품소개페이지 제작시) 계약서사본"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "C101", text: "(상품소개페이지 제작시) 사업자등록증"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "X201", text: "(상품소개페이지 제작시) 온라인도매시장플랫폼 상품등록화면"},
		{artclCd: "OM_PR_GDS", artclNm: "1. 온라인 도매시장 판매 상품 샘플 제공, 상품 소개 페이지 제작", value: "H201", text: "(상품소개페이지 제작시) 검인수 보고서"},
		{artclCd: "PRMT_GIFT", artclNm: "2. 각종 홍보물 제작", value: "A101", text: "계약서사본"},
		{artclCd: "PRMT_GIFT", artclNm: "2. 각종 홍보물 제작", value: "C101", text: "사업자등록증"},
		{artclCd: "PRMT_GIFT", artclNm: "2. 각종 홍보물 제작", value: "H201", text: "검인수 보고서"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "A101", text: "계약서사본"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "F101", text: "참석자명부"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "C101", text: "사업자등록증"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "B201", text: "강사수당 서명영수증"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "B202", text: "강사수당 원천징수영수증"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "A201", text: "차량, 장소 임차계약서"},
		{artclCd: "PRMT_CST", artclNm: "3. 광고 및 홍보비", value: "H101", text: "결과보고서"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "A101", text: "계약서사본"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "F101", text: "참석자명부"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "C101", text: "사업자등록증"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "B201", text: "강사수당 서명영수증"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "B202", text: "강사수당 원천징수영수증"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "A201", text: "차량, 장소 임차계약서"},
		{artclCd: "NTSL_CNSTNG", artclNm: "4. 마케팅 관련 자문 및 컨설팅 ", value: "H101", text: "결과보고서"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "H101", text: "결과보고서"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "A201", text: "차량, 장소 임차계약서"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "E201", text: "(시식원물) 원물입출고 확인서(양식)"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "E202", text: "(시식원물) 원가 및 수량의 적정성 확인서"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "X301", text: "(홍보 및 증정품) 로고 등 확인 사진 2컷 이상"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "B801", text: "(국외 시장개척) 여행사 INVOICE"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "B802", text: "(국외 시장개척) e-티켓 또는 탑승권"},
		{artclCd: "MKRT_EXTD", artclNm: "5. 국내외 시장개척", value: "C202", text: "(국외 시장개척) 탑승자 재직증명서"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "A101", text: "계약서사본"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "C101", text: "사업자등록증"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "H101", text: "결과보고서"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "A203", text: "장소 임차계약서"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "E801", text: "(도우미) 근무확인서"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "B301", text: "(도우미) 소모품영수증"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "C301", text: "(도우미) 통장입금확인증"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "E201", text: "(시식원물) 원물입출고 확인서(양식)"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "E202", text: "(시식원물) 원가 및 수량의 적정성 확인서(예 : 거래명세표)"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "X301", text: "(홍보 및 증정품) 로고 등 확인 사진 2컷 이상"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "B801", text: "(국외 판촉) 여행사 INVOICE"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "B802", text: "(국외 판촉) e-티켓 또는 탑승권"},
		{artclCd: "PRMT_EVNT", artclNm: "6. 국내외 판촉행사", value: "C202", text: "(국외 판촉) 탑승자 재직증명서"},
		{artclCd: "SEMINAR", artclNm: "7. 바이어 대상 사업 설명회 및 마케팅 협의회", value: "H101", text: "결과보고서"},
		{artclCd: "SEMINAR", artclNm: "7. 바이어 대상 사업 설명회 및 마케팅 협의회", value: "A201", text: "차량, 장소 임차계약서"},
		{artclCd: "BRND_APPL", artclNm: "8. 브랜드 개발 및 등록비용", value: "A101", text: "계약서사본"},
		{artclCd: "BRND_APPL", artclNm: "8. 브랜드 개발 및 등록비용", value: "C101", text: "사업자등록증"},
		{artclCd: "BRND_APPL", artclNm: "8. 브랜드 개발 및 등록비용", value: "E101", text: "등록 확인서"},
		{artclCd: "DVLP_LBSRVC", artclNm: "1. 상품개발 용역", value: "A101", text: "계약서사본"},
		{artclCd: 'DVLP_LBSRVC', artclNm: '1. 상품개발 용역', value: 'C101', text: '사업자등록증'},
		{artclCd: 'DVLP_LBSRVC', artclNm: '1. 상품개발 용역', value: 'E101', text: '등록 확인서'},
		{artclCd: 'GDS_DSGN', artclNm: '2. 포장 디자인, 도안, 용기 등 상품개발', value: 'A101', text: '계약서사본'},
		{artclCd: 'GDS_DSGN', artclNm: '2. 포장 디자인, 도안, 용기 등 상품개발', value: 'C101', text: '사업자등록증'},
		{artclCd: 'GDS_DSGN', artclNm: '2. 포장 디자인, 도안, 용기 등 상품개발', value: 'E101', text: '등록 확인서'},
		{artclCd: 'DSGN_APPL', artclNm: '3. 특허, 실용신안, 디자인, 상표 등록', value: 'A101', text: '계약서사본'},
		{artclCd: 'DSGN_APPL', artclNm: '3. 특허, 실용신안, 디자인, 상표 등록', value: 'C101', text: '사업자등록증'},
		{artclCd: 'DSGN_APPL', artclNm: '3. 특허, 실용신안, 디자인, 상표 등록', value: 'E101', text: '등록 확인서'},
		{artclCd: 'MTG_CST', artclNm: '1. 각종 회의비용', value: 'H101', text: '결과보고서'},
		{artclCd: 'MTG_CST', artclNm: '1. 각종 회의비용', value: 'F101', text: '참석자명부'},
		{artclCd: 'UO_CMNS', artclNm: '2. 통합조직', value: 'J102', text: '교육 참석자 업무분장표'},
		{artclCd: 'UO_CMNS', artclNm: '2. 통합조직', value: 'E501', text: '교육 수료증'},
		{artclCd: 'UO_CMNS', artclNm: '2. 통합조직', value: 'A501', text: '지급보증보험증권'},
	];

	const objDoc = {
		maxSeq : -1,
		prefix : "tbl-doc-",
		getInitCol: function(_knd) {
			let col = -1;
			switch (_knd) {
				case "MAJOR_ARTICLE":	// 주요항목
					col = 0;
					break;
				case "ARTICLE":			// 세부항목
					col = 1;
					break;
				case "DMND_CN":			// 요청내용
					col = 2;
					break;
				case "DMND_AMT":		// 요청금액
					col = 3;
					break;
				case "PRUF_DOC_BSC":	// 공통증빙
					col = 4;
					break;
				case "PRUF_DOC":		// 증빙서류
					col = 5;
					break;
				case "DMND_RMRK":		// 비고
					col = 6;
					break;
			}
			return col;
		},
		initList : [
			// attribute default (id, name)
			// 0 행 : 주요항목
			{
				isSBUx: true,
				elementKey: "dmndArtclKnd",
				type: "sbux-select",
				id: "slt-majorArticle",
				attributes: {
						"uitype": "single",
						"unselected-text": "선택",
						"class": "form-control input-sm input-sm-ast",
						"jsondata-ref": "jsonMajorArticle",
					},
				exAttributes: {

				},
				exEvents: [{
					key: "onchange",
					name: "fn_onChangeMajorArticle"
				}],
			},
			// 1 행 : 세부항목
			{
				isSBUx: true,
				elementKey: "dmndArtclCd",
				type: "sbux-select",
				id: "slt-article",
				attributes: {
					"uitype": "single",
					//"unselected-text": "선택",
					"class": "form-control input-sm input-sm-ast",
					"jsondata-ref": "jsonArticle",
					"jsondata-filter": "mastervalue"
				},
				exAttributes: {
					"filter-source-name": "slt-majorArticle"
				},
				exEvents: [{
					key: "onchange",
					name: "fn_onChangeArticle"
				}],
			},
			// 2 행 : 내용
			{
				isSBUx: true,
				elementKey: "dmndCn",
				type: "sbux-input",
				id: "inp-dmndCn",
				attributes: {
					"uitype": "text",
					"unselected-text": "선택",
					"class": "form-control input-sm",
				},
				exAttributes: {
				},
				exEvents: [],
			},
			// 3 행 : 정산요청액
			{
				isSBUx: true,
				elementKey: "dmndAmt",
				type: "sbux-input",
				id: "inp-dmndAmt",
				attributes: {
					"uitype": "text",
					"unselected-text": "선택",
					"class": "form-control input-sm input-sm-ast inpt_data_reqed",
					"maxlength": "6",
					"autocomplete": "off",
					"mask": "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}",
				},
				exAttributes: {
					"filter-source-name": "slt-majorArticle"
				},
				exEvents: [{
					key: "onchange",
					name: "fn_onChangeDmndAmt"
				}],
			},
			// 4 행 : 공통증빙
			{
				isSBUx: false,
				elementKey: "pfudDoc",
				type: "div",
				id: 'div-prufDocBsc',
				attributes: {
				},
				contents: {
					"classList": ["evGroup"]
				}
			},
			// 5행 : 증빙서류
			{
				isSBUx: false,
				elementKey: "pfudDoc",
				type: "div",
				id: 'div-prufDoc',
				attributes: {
				},
				contents: {
					"textContent": "세부항목 선택 시 표시",
					"classList": ["evGroup"]
				}
			},
			// 6 행 : 비고
			{
				isSBUx: true,
				elementKey: "dmndRmrk",
				type: "sbux-textarea",
				id: "txa-dmndRmrk",
				attributes: {
					"uitype": "normal",
					"class": "form-control input-sm input-sm-ast txa-resize",
					"resize": "true",
					//"auto-resize": "true",
					"detect-attack": "true"
				},
				exAttributes: {

				},
				exEvents: [],
			},
		],
	}

	function ClclnDmndRow(_nRow) {
		this.row = _nRow;
		this.elementsId = {
			dmndArtclKnd: {id: ""},
			dmndArtclCd: {id: ""},
			dmndCn: {id: ""},
			dmndAmt: {id: ""},
			dmndRmrk: {id: ""},
			pfudDocBsc: {id: "", sub: []},
			pfudDoc: {id: "", sub: []},
		};
		this.files = {};
	}

	/**
	 *
	 * @type ClclnDmndRow
	 */
	const objRows = [];

	function DmndPrufDoc(_code, _id) {
		this.code = _code;
		this.id = _id;
	}

	const objPrufDoc = {

	}

	const __ACCEPT = ['pdf','jpg','jpeg','png','hwp','doc','docx'];

	// FileList 재구성을 위한 helper
	function buildFileList(files){
		const dt = new DataTransfer();
		files.forEach(f=> dt.items.add(f));
		return dt.files;
	}

	const fn_renderPrufDocBsc = function(_row) {

		if (_row < 0) {
			return;
		}

		const parentId = "tbl-doc-div-prufDocBsc" + String(_row);
		const parentEl = document.getElementById(parentId);

		while (parentEl.firstChild) {
			parentEl.removeChild(parentEl.lastChild);
		}

		const docs = jsonPrufDocBsc;
		if (docs.length === 0) {
			parentEl.style.color = '#94a3b8';
		} else {
			docs.forEach(doc => {

				// id 넣어야함

				const elBox = document.createElement('div');
				elBox.className = 'evItem';
				const elHead = document.createElement('div');
				elHead.className = 'evHead';
				const elName = document.createElement('div');
				elName.className = 'evName';
				elName.textContent = doc.text;
				document.createElement('div');

				const elFile = document.createElement('input');
				elFile.type = 'file';
				elFile.multiple = true;
				elFile.accept = __ACCEPT.map(x=>'.'+x).join(',');

				const elChips = document.createElement('div');
				elChips.className = 'files';

				elHead.append(elName);
				elBox.append(elHead, elFile, elChips);

				parentEl.appendChild(elBox);
			});
		}
	}

	const fn_renderPrufDoc = function(_row, _article) {
		try {
		if (_row < 0) {
			return;
		}
		console.log("_row", _row);
		console.log("objRows", objRows);
		const row = objRows[_row];

		const parentId = "tbl-doc-div-prufDoc" + String(_row);
		const parentEl = document.getElementById(parentId);

		while (parentEl.firstChild) {
			parentEl.removeChild(parentEl.lastChild);
		}

		if (gfn_isEmpty(_article)) {
			return;
		}
			console.log(111);
		const docs = gfn_getJsonFilter(jsonPrufDoc, "artclCd", _article);

		if (docs.length === 0) {
			parentEl.style.color = '#94a3b8';
			parentEl.textContent = '세부항목 선택 시 표시';
		} else {
			docs.forEach(doc => {

				// id 넣어야함

				const elBox = document.createElement('div');
				elBox.className = 'evItem';
				const elHead = document.createElement('div');
				elHead.className = 'evHead';
				const elName = document.createElement('div');
				elName.className = 'evName';
				elName.textContent = doc.text;
				document.createElement('div');

				const elFile = document.createElement('input');
				elFile.type = 'file';
				elFile.multiple = true;
				elFile.accept = __ACCEPT.map(x=>'.'+x).join(',');

				const elChips = document.createElement('div');
				elChips.className='files';
				console.log(1234);
				console.log("row", row);
				console.log("row.files", row.files);

				console.log(1111);
				function refreshChips(){
					elChips.innerHTML = '';
					const list = (row.files && row.files[doc.value]) ? row.files[doc.value] : [];
					console.log(2222);
					list.forEach((f, idx)=>{
						const c = document.createElement('span');
						c.className = 'chip';
						c.textContent = f.name+' ';
						const x = document.createElement('span');
						x.className='x';
						x.textContent='×';
						x.title='이 파일 제거';
						x.onclick=()=>{
							const files = (row.files && row.files[doc.value]) ? row.files[doc.value].slice() : [];
							files.splice(idx,1);
							if (files.length>0){ row.files = files; } else { delete row.files[doc.value]; }
							elFile.value = '';
							if (files.length>0){ row.files = buildFileList(files); }
							refreshChips();
						};
						c.appendChild(x);
						elChips.appendChild(c);
					});
				}

				elFile.onchange = (e)=>{
					console.log(4444);
					const files = Array.from(e.target.files||[]);
					const safe = files.filter(f=> __ACCEPT.includes(f.name.split('.').pop().toLowerCase()));
					row.files = row.files || {};
					console.log(5555);
					const prev = row.files[doc.value] ? row.files[doc.value].slice() : [];
					const merged = prev.concat(safe);          // 기존 + 신규 (추가 업로드 지원)
					row.files[doc.value] = merged;
					elFile.files = buildFileList(merged);       // input과 상태 동기화

					refreshChips();
				};
				console.log(7777);
				if (row.files && row.files[doc.value]){
					elFile.files = buildFileList(row.files[doc.value]);
				}
				refreshChips();

				elHead.append(elName);
				elBox.append(elHead, elFile, elChips);

				parentEl.appendChild(elBox);
			});
		}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	const fn_onChangeMajorArticle = function(_nRow) {
		console.log("fn_onChangeMajorArticle");
		const col = objDoc.getInitCol("MAJOR_ARTICLE");
		if (col < 0) {
			return;
		}
		const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);

		//fn_clearArticle(_nRow);
		fn_onChangeArticle(_nRow);
	}

	const fn_clearArticle = function(_nRow) {
		const col = objDoc.getInitCol("ARTICLE");
		if (col < 0) {
			return;
		}
		const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);

		SBUxMethod.set(id, "");
		SBUxMethod.refresh(id);
		fn_renderPrufDoc(_nRow);
	}

	const fn_onChangeArticle = function(_nRow) {

		console.log("fn_onChangeArticle");

		const col = objDoc.getInitCol("ARTICLE");
		if (col < 0) {
			return;
		}

		fn_renderPrufDocBsc(_nRow);

		const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);
		console.log("id", id);
		const article = SBUxMethod.get(id);
		fn_renderPrufDoc(_nRow, article);
	}

	const fn_onChangeDmndAmt = function(_nRow) {
		const col = objDoc.getInitCol("DMND_AMT");
		if (col < 0) {
			return;
		}
		const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);
	}
	const fn_onChangePrufDocBsc = function(_nRow) {
		const col = objDoc.getInitCol("PRUF_DOC_BSC");
		if (col < 0) {
			return;
		}
		const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);
		alert(SBUxMethod.get(id));
	}

	const fn_docNewRow = function() {
		try {

			objDoc.maxSeq++;

			const seq = objDoc.maxSeq;
			const row = new ClclnDmndRow(seq);

			const sbuxList = [];
			const newRow = document.createElement("tr");
			newRow.setAttribute("id", objDoc.prefix + "tr"  + String(seq));

			objDoc.initList.forEach(item => {
				const cell = document.createElement("td");

				const id = objDoc.prefix + item.id + String(seq);
				const element = document.createElement(item.type);
				element.setAttribute("id", id);
				element.setAttribute("name", id);

				if (item.hasOwnProperty("elementKey")) {
					row.elementsId[item.elementKey].id = id;
				}

				for (const key in item.attributes) {
					if (item.attributes.hasOwnProperty(key)) { // 객체의 속성인지 확인 (상속받은 속성 제외)
						element.setAttribute(key, item.attributes[key]);
					}
				}

				if (item.isSBUx) {
					for (const key in item.exAttributes) {
						if (item.exAttributes.hasOwnProperty(key)) { // 객체의 속성인지 확인 (상속받은 속성 제외)
							element.setAttribute(key, objDoc.prefix + item.exAttributes[key] + String(seq));
						}
					}

					item.exEvents.forEach(evt => {
						element.setAttribute(evt.key, evt.name + "(" + String(seq) + ")");
					});
					sbuxList.push(id);
				} else {
					for (const key in item.contents) {
						if (item.contents.hasOwnProperty(key)) { // 객체의 속성인지 확인 (상속받은 속성 제외)
							switch (key) {
								case "textContent":
									element.textContent = item.contents[key];
									break;
								case "classList":
									if (Array.isArray(item.contents[key])) {
										item.contents[key].forEach(clazz => {element.classList.add(clazz);});
									}
									break;
							}
						}
					}
				}

				cell.append(element);
				newRow.appendChild(cell);
			});

			const elTbody = document.getElementById("doc-tbd-newData");
			elTbody.appendChild(newRow);

			sbuxList.forEach(id => {
				SBUxMethod.render("#" + id);
			});

			objRows.push(row);

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	/* End */
</script>
</body>
</html>