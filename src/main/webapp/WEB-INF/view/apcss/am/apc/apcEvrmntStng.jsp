<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 13%">
						<col style="width: 4%">
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 7%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg" rowspan="4">APC정보</th>
							<td scope="row" align="right">코드</td>
							<td scope="row" style="border-right: hidden;">
								<sbux-input id="inp-apcCd" name="inp-apcCd" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td scope="row" align="right">업태</td>
							<td scope="row" style="border-right: hidden;">
								<sbux-input id="inp-bzstat" name="inp-bzstat" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td scope="row" align="right">종목</td>
							<td scope="row" style="border-right: hidden;">
								<sbux-input id="inp-cls" name="inp-cls" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td scope="row" align="right">APC대표자명</td>
							<td scope="row" style="border-right: hidden;">
								<sbux-input id="inp-apcRprsvNm" name="inp-apcRprsvNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right"><span class="data_required"></span>명칭</td>
							<td scope="row" >
								<sbux-input id="inp-apcNm" name="inp-apcNm" uitype="text" class="form-control input-sm input-sm-ast"></sbux-input>
							</td>
							<td scope="row" align="right">주소</td>
							<td scope="row">
								<sbux-input id="inp-addr" name="inp-addr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" align="right">전화번호</td>
							<td scope="row">
								<sbux-input id="inp-telno" name="inp-telno" uitype="text" class="form-control input-sm"
								mask = "{ 'mask': '999-999-9999', 'clearIncomplete': true, 'autoUnmask': true }"
								></sbux-input>
							</td>
							<td scope="row" align="right">팩스번호</td>
							<td scope="row">
								<sbux-input id="inp-fxno" name="inp-fxno" uitype="text" class="form-control input-sm"
								mask = "{ 'mask': '999-999-9999', 'clearIncomplete': true, 'autoUnmask': true }"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">사업번호</td>
							<td scope="row">
								<sbux-input id="inp-brno" name="inp-brno" uitype="text" class="form-control input-sm"
								mask = "{ 'mask': '999-99-99999', 'clearIncomplete': true, 'autoUnmask': true }"
								></sbux-input>
							</td>
							<td scope="row" align="right">계좌번호</td>
							<td scope="row">
								<sbux-input id="inp-actno" name="inp-actno" uitype="text" class="form-control input-sm"></sbux-input>

							</td>
							<td scope="row"  align="right">입금은행</td>
							<td class="td_input" >
								<sbux-select id="slt-bankCd" name="slt-bankCd"
								uitype="singleExt"
								filtering="true"
								jsondata-ref="jsonComboBankNm"
								unselected-text="선택" class=""></sbux-select>
							</td>

							<td scope="row" align="right">예금주명</td>
							<td scope="row">
								<sbux-input id="inp-dpstr" name="inp-dpstr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">구분</td>
							<td class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd1" name="rdo-apcSeCd" uitype="normal" value="1" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">농협</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-apcSeCd2" name="rdo-apcSeCd" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">법인</label>
								</p>
							</td>
							<td scope="row" align="right">정산기준</td>
							<td class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-clclnCrtrCd1" name="rdo-clclnCrtrCd" uitype="normal" value="1"  class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">입고</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-clclnCrtrCd2" name="rdo-clclnCrtrCd" uitype="normal" value="2" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">선별</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-clclnCrtrCd3" name="rdo-clclnCrtrCd" uitype="normal" value="4"  class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">출하</label>
								</p>
							</td>
							<td scope="row" align="right">상품구분</td>
							<td colspan="3" class="td_input">
								<sbux-checkbox id="chk-gdsSeCd" name="chk-gdsSeCd" uitype="normal"
								jsondata-ref="jsonComGdsSeCd"
								true-value="Y"
								text-right-padding="10px"
								jsondata-true-value="value"
								>
								</sbux-checkbox>
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">APC사용자 관리</th>
							<td colspan="2"class="td_input">
								<sbux-button id="btnUserAuth" name="btnUserAuth" uitype="modal" text="사용자권한 설정" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-userAuth" onclick="fn_modal('btnUserAuth')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								업무지원시스템을 사용할 일반사용자를 승인합니다. (신규가입은 포탈을 이용하세요)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">운용설비 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnFclt" name="btnFclt" uitype="modal" text="설비 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-fclt" onclick="fn_modal('btnFclt')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 운영하고 있는 선별기와 포장기를 등록하세요. (선별1호기, 선별2호기... / 포장1호기, 포장2호기...)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">저장창고 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnWarehouse" name="btnWarehouse" uitype="modal" text="창고 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-warehouse" onclick="fn_modal('btnWarehouse')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 운영하고 있는 창고를 등록하세요. (원물창고1, 원물창고2... / 선별창고1 ... / 포장창고1..)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">품목/품종 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnItem" name="btnItem" uitype="modal" text="품목/품종 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-item" onclick="fn_modal('btnItem')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 관리하고 있는 품목과 품종을 선택하세요. (여러 개의 품목과 품종을 관리할 수 있습니다)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">규격/감량율 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnSpcfct" name="btnSpcfct" uitype="modal" text="품목별 규격/감량율 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-spcfct" onclick="fn_modal('btnSpcfct')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								선택한 품목별로 APC에서 관리하는 규격/품목별 감량율을 등록하세요.
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">등급 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnJgmtGrd" name="btnJgmtGrd" uitype="modal" text="품목별 등급 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-stdGrd" onclick="fn_modal('btnStdGrd')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								선택한 품목별로 APC에서 관리하는 등급을 등록하세요.
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">상품 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnSpmtPckgUnit" name="btnSpmtPckgUnit" uitype="modal" text="품목별 상품 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-spmtPckgUnit" onclick="fn_modal('btnSpmtPckgUnit')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								선택한 품목별로 APC에서 관리하는 출하포장단위을 등록하세요.
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">원물 팔레트/박스</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnpltBx" name="btnpltBx" uitype="modal" text="팔레트/박스 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-pltBx" onclick="fn_modal('btnPltBx')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 관리하고 있는 팔레트와 박스의 종류 및 기초재고수량을 등록합니다. (계근대를 사용하는 경우 단중을 입력해야 합니다)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">입고차량 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnVhcl" name="btnVhcl" uitype="modal" text="입고차량/운임 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-wrhsVhcl" onclick="fn_modal('btnWrhsVhcl')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								원물입고 시 차량번호를 관리하는 경우 차량번호를 입력하세요. (차후 추가등록도 가능합니다)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">출하운송사 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnSpmtTrsprt" name="btnSpmtTrsprt" uitype="modal" text="출하 운송회사 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-spmtTrsprt" onclick="fn_modal('btnSpmtTrsprt')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								상품출하시 운용하고 있는 운송사 정보를 등록하세요. (출하처리 시 필요한 정보입니다)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">거래처 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnCnpt" name="btnCnpt" uitype="modal" text="거래처/발주수신 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-cnpt" onclick="fn_modal('btnCnpt')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								상품출하시 관리하고 있는 거래처 정보를 등록하세요. (출하처리 시 필요한 정보입니다)
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg" scope="row">생산작업자 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnOprtr" name="btnOprtr" uitype="modal" text="생산작업자 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-oprtr" onclick="fn_modal('btnOprtr')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								선별작업 또는 포장작업 시 작업하는 작업자 정보를 등록하세요. (차후 작업자별 작업시간을 관리하기 위한 정보입니다)
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="box-body">
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>APC 사용메뉴 선택</span></li>
					</ul>
				 	<div class="ad_tbl_toplist">
						<sbux-button id="btnSaveMenu" name="btnSaveMenu" class="btn btn-xs btn-outline-danger" text="메뉴저장" uitype="normal" onclick="fn_saveMenu" ></sbux-button>
						<sbux-button id="btnSimpleStng" name="btnSimpleStng" class="btn btn-xs btn-outline-danger" text="메뉴간편설정" uitype="modal" target-id="modal-simpleStng" ></sbux-button>
					</div>
				</div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 9%">
						<col style="width: 9%">
						<col style="width: 9%">
						<col style="width: 16%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">계량정보 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-wghMngYn" name="chk-wghMngYn" uitype="normal" text="사용" true-value="Y" false-value="N" ></sbux-checkbox>
								</p>
							</td>
							<td>
		                     	<p class="ad_input_row">
									<sbux-checkbox id="chk-wghMblUseYn" name="chk-wghMblUseYn" uitype="normal" text="테블릿사용" true-value="Y" false-value="N"></sbux-checkbox>
		                  		</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-wghIdntyDocPblcnYn" name="chk-wghIdntyDocPblcnYn" uitype="normal" text="계량확인서 발행" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th rowspan="2">원물입고 관리</th>
							<td rowspan="2">
								<p class="ad_input_row">
									<sbux-checkbox id="chk-rawMtrWrhsMngYn" name="chk-rawMtrWrhsMngYn" uitype="normal" text="사용" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-rawMtrWrhsMblUseYn" name="chk-rawMtrWrhsMblUseYn" uitype="normal" text="테블릿사용" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-rawMtrIdentTagPblcnYn" name="chk-rawMtrIdentTagPblcnYn" uitype="normal" text="원물인식표 발행" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-pltBxMngYn" name="chk-pltBxMngYn" uitype="normal" text="팔레트/박스정보관리" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-rawMtrWrhsPlanMngYn" name="chk-rawMtrWrhsPlanMngYn" uitype="normal" true-value="Y" false-value="N" text="원물입고계획관리" ></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-gdsWrhsMngYn" name="chk-gdsWrhsMngYn" uitype="normal" text="상품입고관리" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-sortCmndMngYn" name="chk-sortCmndMngYn" uitype="normal" text="사용" true-value="Y"false-value="N" ></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-sortCmndDocPblcnYn" name="chk-sortCmndDocPblcnYn" uitype="normal" text="선별지시서 발행" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>포장지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-pckgCmndMngYn" name="chk-pckgCmndMngYn" uitype="normal" text="사용" true-value="Y" false-value="N" ></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-pckgCmndDocPblcnYn" name="chk-pckgCmndDocPblcnYn" uitype="normal" text="포장지시서 발행" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-sortMngYn" name="chk-sortMngYn" uitype="normal" text="사용" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-sortMblUseYn" name="chk-sortMblUseYn" uitype="normal" text="테블릿사용 (선별투입)" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-sortLblPblcnYn" name="chk-sortLblPblcnYn" uitype="normal" text="선별라벨 발행" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td><p class="ad_input_row">
									<sbux-checkbox id="chk-sortIdntyDocPblcnYn" name="chk-sortIdntyDocPblcnYn" uitype="normal" text="선별확인서 발행" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>포장 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-pckgMngYn" name="chk-pckgMngYn" uitype="normal" text="사용" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-pckgMblUseYn" name="chk-pckgMblUseYn" uitype="normal" text="테블릿사용 (포장투입)" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-gdsLblPblcnYn" name="chk-gdsLblPblcnYn" uitype="normal" text="상품라벨 발행" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-spmtCmndMngYn" name="chk-spmtCmndMngYn" uitype="normal" text="사용" true-value="Y"false-value="N" ></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-spmtCmndDocPblcnYn" name="chk-spmtCmndDocPblcnYn" uitype="normal" text="출하지시서 발행" true-value="Y" false-value="N" ></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-spmtMngYn" name="chk-spmtMngYn" uitype="normal" text="사용" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-spmtMblUseYn" name="chk-spmtMblUseYn" uitype="normal" text="테블릿 사용" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-spmtDocPblcnYn" name="chk-spmtDocPblcnYn" uitype="normal" text="송품장발행" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-slsMngYn" name="chk-slsMngYn" uitype="normal" text="매출관리" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>재고 관리</th>
							<td><p class="ad_input_row">
									<sbux-checkbox id="chk-invntrMngYn" name="chk-invntrMngYn" uitype="normal" text="관리유무" true-value="Y" false-value="N" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td><p class="ad_input_row">
									<sbux-checkbox id="chk-invntrTrnsfMngYn" name="chk-invntrTrnsfMngYn" uitype="normal" text="재고이송" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
						</tr>
						<tr>
							<th>정산 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-clclnMngYn" name="chk-clclnMngYn" uitype="normal" text="사용" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>발주정보 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-outordrMngYn" name="chk-outordrMngYn" uitype="normal" text="사용" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-outordrAtmtcRcptnYn" name="chk-outordrAtmtcRcptnYn" uitype="normal" text="발주정보 자동수신" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>생산작업자 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-oprtrUseYn" name="chk-oprtrUseYn" uitype="normal" text="사용" true-value="Y" false-value="N"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!-- 사용자권한 설정 Modal -->
    <div>
        <sbux-modal id="modal-userAuth" name="modal-userAuth" uitype="middle" header-title="APC사용자 권한설정" body-html-id="body-modal-userAuth" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-userAuth">
    	<jsp:include page="../apc/apcUserMngPopup.jsp"></jsp:include>
    </div>
    <!-- 설비 등록 Modal -->
    <div>
        <sbux-modal id="modal-fclt" name="modal-fclt" uitype="middle" header-title="설비 등록" body-html-id="body-modal-fclt" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-fclt">
    	<jsp:include page="../apc/fcltMngPopup.jsp"></jsp:include>
    </div>
    <!-- 창고 등록 Modal -->
    <div>
        <sbux-modal id="modal-warehouse" name="modal-warehouse" uitype="middle" header-title="창고 등록" body-html-id="body-modal-warehouse" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-warehouse">
    	<jsp:include page="../apc/warehouseMngPopup.jsp"></jsp:include>
    </div>
    <!--품목/품종 등록 Modal -->
    <div>
        <sbux-modal id="modal-item" name="modal-item" uitype="middle" header-title="품목/품종 등록" body-html-id="body-modal-item" footer-is-close-button="false" header-is-close-button="false" show-window-scroll="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-item">
    	<jsp:include page="../apc/itemMngPopup.jsp"></jsp:include>
    </div>
    <!-- 규격/감량율 등록 Modal -->
    <div>
        <sbux-modal id="modal-spcfct" name="modal-spcfct" uitype="middle" header-title="규격/감량율 등록" body-html-id="body-modal-spcfct" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spcfct">
    	<jsp:include page="../apc/spcfctMngPopup.jsp"></jsp:include>
    </div>
    <!-- 등급 등록 Modal -->
    <div>
        <sbux-modal id="modal-stdGrd" name="modal-stdGrd" uitype="middle" header-title="등급 등록" body-html-id="body-modal-stdGrd" footer-is-close-button="false" header-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="body-modal-stdGrd">
    	<jsp:include page="../apc/grdMngPopup.jsp"></jsp:include>
    </div>
    <!-- 상품 등록 Modal -->
    <div>
        <sbux-modal id="modal-spmtPckgUnit" name="modal-spmtPckgUnit" uitype="middle" header-title="상품 등록" body-html-id="body-modal-spmtPckgUnit" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtPckgUnit">
    	<jsp:include page="../apc/spmtPckgUnitMngPopup.jsp"></jsp:include>
    </div>
    <!-- 팔레트/박스 등록 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="팔레트/박스 등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../apc/pltBxMngPopup.jsp"></jsp:include>
    </div>
    <!-- 입고차량정보 등록 Modal -->
    <div>
        <sbux-modal id="modal-wrhsVhcl" name="modal-wrhsVhcl" uitype="middle" header-title="입고차량정보 등록" body-html-id="body-modal-wrhsVhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-wrhsVhcl">
    	<jsp:include page="../apc/wrhsVhclMngPopup.jsp"></jsp:include>
    </div>
    <!-- 출하운송회사 등록 Modal -->
    <div>
        <sbux-modal id="modal-spmtTrsprt" name="modal-spmtTrsprt" uitype="middle" header-title="출하운송회사 등록" body-html-id="body-modal-spmtTrsprt" footer-is-close-button="false" header-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="body-modal-spmtTrsprt">
    	<jsp:include page="../apc/spmtTrsprtMngPopup.jsp"></jsp:include>
    </div>
    <!-- 거래처 등록 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처/발주수신 등록" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../apc/cnptMngPopup.jsp"></jsp:include>
    </div>
    <!-- 생산작업자 등록 Modal -->
    <div>
        <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 등록" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-oprtr">
    	<jsp:include page="../apc/oprtrMngPopup.jsp"></jsp:include>
    </div>

    <!-- 간편설정 Modal -->
    <div>
        <sbux-modal id="modal-simpleStng" name="modal-simpleStng" uitype="middle" header-title="메뉴간편설정" body-html-id="body-modal-simpleStng" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-simpleStng">
    	<jsp:include page="../apc/simpleStngPopup.jsp"></jsp:include>
    </div>

    <!-- 출하매출단가 등록 Modal -->
    <div>
        <sbux-modal id="modal-spmtSlsUntprcReg" name="modal-spmtSlsUntprcReg" uitype="middle" header-title="출하 매출단가 등록" body-html-id="body-modal-spmtSlsUntprcReg" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtSlsUntprcReg">
    	<jsp:include page="../apc/spmtSlsUntprcRegMngPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var comboUesYnJsData = [];
	var comboReverseYnJsData = [];

	var jsonComboBankNm = [];
	var jsonComboGridBankNm = [];

	var comboUnitCdJsData = [];
	var comboGridBankCdJsData = [];
	var comboGridCnptTypeJsData = [];
    var comboGridPltCnptJsData = [];

	var jsonComGdsSeCd = [];
	var jsonComApcGdsSeCd = [];

	const fn_initSBSelect = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('slt-bankCd', jsonComboBankNm ,	'BANK_CD', '0000'),
			gfn_setComCdSBSelect('chk-gdsSeCd', jsonComGdsSeCd ,	'GDS_SE_CD', '0000'),
			gfn_setComCdSBSelect('chk-gdsSeCd', jsonComApcGdsSeCd ,	'GDS_SE_CD', gv_apcCd),
			gfn_setComCdGridSelect('userAuthMngDatagrid', comboUesYnJsData, "USE_YN", "0000"),
			gfn_setComCdGridSelect('grdPlt', comboUnitCdJsData, "UNIT_CD", "0000"),
			gfn_setComCdGridSelect('pckgMngDatagrid', comboReverseYnJsData, "REVERSE_YN", "0000"),
			gfn_setComCdGridSelect('wrhsVhclMngDatagrid', comboGridBankCdJsData, "BANK_CD", "0000"),
			gfn_setComCdGridSelect('cnptMngDatagrid', comboGridCnptTypeJsData, "CNPT_TYPE", "0000"),
            gfn_setComCdGridSelect('grdPlt', comboGridPltCnptJsData, "PLT_CNPT", "0000"),
		])

		selectApcEvrmntStng();

		jsonComGdsSeCd.forEach((item) => {
			let value = item.value;

			jsonComApcGdsSeCd.forEach((apcItem) => {
				let apcValue = apcItem.value;
				if(value==apcValue){
					item.checked = "checked";
				}
			});
		});

		SBUxMethod.refresh("chk-gdsSeCd");

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("inp-apcCd", gv_apcCd);
		fn_initSBSelect();
	})


	const selectApcEvrmntStng = async function(){
		let apcCd = gv_apcCd;
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcEvrmntStng.do", {apcCd : apcCd});
        let data = await postJsonPromise;
		let resultVO = data.resultVO;
        try{
        	SBUxMethod.set("inp-apcNm", resultVO.apcNm);
        	SBUxMethod.set("inp-telno", resultVO.telno);
        	SBUxMethod.set("inp-addr", resultVO.addr);
        	SBUxMethod.set("inp-fxno", resultVO.fxno);
        	SBUxMethod.set("inp-actno", resultVO.actno);
        	SBUxMethod.set("slt-bankCd", resultVO.bankCd);
        	SBUxMethod.set("inp-dpstr", resultVO.dpstr);
        	SBUxMethod.set("inp-brno", resultVO.brno);
        	SBUxMethod.set("rdo-clclnCrtrCd", resultVO.clclnCrtrCd);
        	SBUxMethod.set("rdo-apcSeCd", resultVO.apcSeCd);
        	SBUxMethod.set("inp-apcRprsvNm", resultVO.apcRprsvNm);
        	SBUxMethod.set("inp-cls", resultVO.cls);
        	SBUxMethod.set("inp-bzstat", resultVO.bzstat);
        	SBUxMethod.set("chk-wghMngYn", resultVO.wghMngYn);
        	SBUxMethod.set("chk-wghMblUseYn", resultVO.wghMblUseYn);
        	SBUxMethod.set("chk-wghIdntyDocPblcnYn", resultVO.wghIdntyDocPblcnYn);
        	SBUxMethod.set("chk-rawMtrWrhsMngYn", resultVO.rawMtrWrhsMngYn);
        	SBUxMethod.set("chk-rawMtrWrhsMblUseYn", resultVO.rawMtrWrhsMblUseYn);
        	SBUxMethod.set("chk-rawMtrIdentTagPblcnYn", resultVO.rawMtrIdentTagPblcnYn);
        	SBUxMethod.set("chk-pltBxMngYn", resultVO.pltBxMngYn);
        	SBUxMethod.set("chk-rawMtrWrhsPlanMngYn", resultVO.rawMtrWrhsPlanMngYn);
        	SBUxMethod.set("chk-gdsWrhsMngYn", resultVO.gdsWrhsMngYn);
        	SBUxMethod.set("chk-sortCmndMngYn", resultVO.sortCmndMngYn);
        	SBUxMethod.set("chk-sortCmndDocPblcnYn", resultVO.sortCmndDocPblcnYn);
        	SBUxMethod.set("chk-pckgCmndMngYn", resultVO.pckgCmndMngYn);
        	SBUxMethod.set("chk-pckgCmndDocPblcnYn", resultVO.pckgCmndDocPblcnYn);
        	SBUxMethod.set("chk-sortMngYn", resultVO.sortMngYn);
        	SBUxMethod.set("chk-sortMblUseYn", resultVO.sortMblUseYn);
        	SBUxMethod.set("chk-sortLblPblcnYn", resultVO.sortLblPblcnYn);
        	SBUxMethod.set("chk-sortIdntyDocPblcnYn", resultVO.sortIdntyDocPblcnYn);
        	SBUxMethod.set("chk-pckgMngYn", resultVO.pckgMngYn);
        	SBUxMethod.set("chk-pckgMblUseYn", resultVO.pckgMblUseYn);
        	SBUxMethod.set("chk-gdsLblPblcnYn", resultVO.gdsLblPblcnYn);
        	SBUxMethod.set("chk-spmtCmndMngYn", resultVO.spmtCmndMngYn);
        	SBUxMethod.set("chk-spmtCmndDocPblcnYn", resultVO.spmtCmndDocPblcnYn);
        	SBUxMethod.set("chk-spmtMngYn", resultVO.spmtMngYn);
        	SBUxMethod.set("chk-spmtMblUseYn", resultVO.spmtMblUseYn);
        	SBUxMethod.set("chk-spmtDocPblcnYn", resultVO.spmtDocPblcnYn);
        	SBUxMethod.set("chk-clclnMngYn", resultVO.clclnMngYn);
        	SBUxMethod.set("chk-outordrMngYn", resultVO.outordrMngYn);
        	SBUxMethod.set("chk-outordrAtmtcRcptnYn", resultVO.outordrAtmtcRcptnYn);
        	// SBUxMethod.set("chk-trsmMngYn", resultVO.trsmMngYn);
        	// SBUxMethod.set("chk-sortDataTrsmYn", resultVO.sortDataTrsmYn);
        	// SBUxMethod.set("chk-clclnDataTrsmYn", resultVO.clclnDataTrsmYn);
        	SBUxMethod.set("chk-oprtrUseYn", resultVO.oprtrUseYn);
        	SBUxMethod.set("chk-invntrMngYn", resultVO.invntrMngYn);
        	SBUxMethod.set("chk-invntrTrnsfMngYn", resultVO.invntrTrnsfMngYn);
        	SBUxMethod.set("chk-slsMngYn", resultVO.slsMngYn);
        	SBUxMethod.set("chk-outordrPckgCmndLnkgYn", resultVO.outordrPckgCmndLnkgYn);		// 현재 없음
        	SBUxMethod.set("chk-oprtrSortPrfmncTrsmYn", resultVO.oprtrSortPrfmncTrsmYn);		// 현재 없음
        	SBUxMethod.set("chk-oprtrPckgPrfmncTrsmYn", resultVO.oprtrPckgPrfmncTrsmYn);		// 현재 없음

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	function fn_modal(targetName){
		if(targetName == "btnUserAuth"){
			fn_createUserAuthGrid();
		}
		if(targetName == 'btnFclt'){
			fn_fcltMngCreateGrid();
		}
		if(targetName == 'btnWarehouse'){
			fn_warehouseMngCreateGrid();
		}
		if(targetName == 'btnItem'){
			fn_createGridItemVrty();
		}
		if(targetName == 'btnPltBx'){
			fn_pltMngCreateGrid();
			fn_bxMngCreateGrid();
		}
		if(targetName == 'btnSpcfct'){
			fn_createSpcfct();
		}
		if(targetName == 'btnStdGrd'){
			fn_createGrdGrid();
		}
		if(targetName == 'btnWrhsVhcl'){
			fn_wrhsVhclMngCreateGrid();
			fn_rgnTrsprtCstMngCreateGrid();
		}
		if(targetName == 'btnSpmtTrsprt'){
			fn_spmtTrsprtMngCreateGrid();
		}if(targetName == 'btnCnpt'){
			fn_cnptMngCreateGrid();
			fn_lgszMrktMngCreateGrid();
		}if(targetName == 'btnOprtr'){
			fn_oprtrMngCreateGrid();
		}if(targetName == 'btnSpmtPckgUnit'){
			fn_createSpmtPckgUnitGrid();
		}
	}

	async function fn_callInsertRsrcList(comCdList){
		let postJsonPromise = gfn_postJSON("/co/cd/insertComCdDtlList.do", comCdList);
        let data = await postJsonPromise;

        try{
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}

	async function fn_callUpdateRsrcList(comCdList){
		let postJsonPromise = gfn_postJSON("/co/cd/updateComCdDtlList.do", comCdList);
        let data = await postJsonPromise;
        try{
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

	async function fn_deleteRsrc(comCdVO){
		let postJsonPromise = gfn_postJSON("/co/cd/deleteComCdDtl.do", comCdVO);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        	}else{
        		alert("삭제 도중 오류가 발생 되었습니다.");
        	}
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}

    // Row 추가 및 삭제 기능

    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
            	cnptMngGridData[nRow-1].delYn = "N";
            	cnptMngDatagrid.addRow(true);
            }else if (grid === "grdFclt") {
            	let apcCdCol = grdFclt.getColRef("apcCd");
            	grdFclt.setCellData(nRow, nCol, "N", true);
            	grdFclt.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdFclt.addRow(true);

            	grdFclt.setCellDisabled(0, 0, grdFclt.getRows() -1, grdFclt.getCols() -1, false);
            	grdFclt.setCellDisabled(grdFclt.getRows() -1, 0, grdFclt.getRows() -1, grdFclt.getCols() -1, true);

            }else if (grid === "grdWarehouse") {
            	let apcCdCol = grdWarehouse.getColRef("apcCd");
            	let warehouseSeCdCol = grdWarehouse.getColRef("warehouseSeCd");

            	grdWarehouse.setCellData(nRow, nCol, "N", true);
            	grdWarehouse.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdWarehouse.setCellData(nRow, warehouseSeCdCol, "WAREHOUSE_SE_CD", true);
            	grdWarehouse.addRow(true);

            	grdWarehouse.setCellDisabled(0, 0, grdWarehouse.getRows() -1, grdWarehouse.getCols() -1, false);
            	grdWarehouse.setCellDisabled(grdWarehouse.getRows() -1, 0, grdWarehouse.getRows() -1, grdWarehouse.getCols() -1, true);
            }else if(grid === "grdPlt"){

            	let apcCdCol = grdPlt.getColRef("apcCd");
            	let unitCdCol = grdPlt.getColRef("unitCd");
            	let useYnCol = grdPlt.getColRef("useYn");
            	let pltBxSeCdCol = grdPlt.getColRef("pltBxSeCd");

            	grdPlt.setCellData(nRow, nCol, "N", true);
            	grdPlt.setCellData(nRow, unitCdCol, "2", true);
            	grdPlt.setCellData(nRow, useYnCol, "Y", true);
            	grdPlt.setCellData(nRow, pltBxSeCdCol, "P", true);
            	grdPlt.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdPlt.addRow(true);
            	grdPlt.setCellDisabled(0, 0, grdPlt.getRows() -1, grdPlt.getCols() -1, false);
            	grdPlt.setCellDisabled(grdPlt.getRows() -1, 0, grdPlt.getRows() -1, grdPlt.getCols() -1, true);
            }else if(grid === "grdBx"){

            	let apcCdCol = grdBx.getColRef("apcCd");
            	let unitCdCol = grdBx.getColRef("unitCd");
            	let useYnCol = grdBx.getColRef("useYn");
            	let pltBxSeCdCol = grdBx.getColRef("pltBxSeCd");

            	grdBx.setCellData(nRow, nCol, "N", true);
            	grdBx.setCellData(nRow, unitCdCol, "2", true);
            	grdBx.setCellData(nRow, useYnCol, "Y", true);
            	grdBx.setCellData(nRow, pltBxSeCdCol, "B", true);
            	grdBx.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdBx.addRow(true);

            	grdBx.setCellDisabled(0, 0, grdBx.getRows() -1, grdBx.getCols() -1, false);
            	grdBx.setCellDisabled(grdBx.getRows() -1, 0, grdBx.getRows() -1, grdBx.getCols() -1, true);
            }else if(grid === "grdPckg"){
            	grdPckg.setCellData(nRow, nCol, "N", true);
            	grdPckg.setCellData(nRow, 5, gv_apcCd, true);
            	grdPckg.setCellData(nRow, 6, "PCKG_SE_CD", true);
            	grdPckg.addRow(true);
            }else if(grid === "grdRgnTrsprtCst"){

            	let apcCdCol = grdRgnTrsprtCst.getColRef("apcCd");

            	grdRgnTrsprtCst.setCellData(nRow, nCol, "N", true);
            	grdRgnTrsprtCst.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdRgnTrsprtCst.addRow(true);
            	grdRgnTrsprtCst.setCellDisabled(0, 0, grdRgnTrsprtCst.getRows() -1, grdRgnTrsprtCst.getCols() -1, false);
            	grdRgnTrsprtCst.setCellDisabled(grdRgnTrsprtCst.getRows() -1, 0, grdRgnTrsprtCst.getRows() -1, grdRgnTrsprtCst.getCols() -1, true);

            }else if(grid === "grdWrhsVhcl"){
            	let apcCdCol = grdWrhsVhcl.getColRef("apcCd");

            	grdWrhsVhcl.setCellData(nRow, nCol, "N", true);
            	grdWrhsVhcl.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdWrhsVhcl.addRow(true);
            	grdWrhsVhcl.setCellDisabled(grdWrhsVhcl.getRows() -2, 0, grdWrhsVhcl.getRows() -2, grdWrhsVhcl.getCols() -1, false);
            	grdWrhsVhcl.setCellDisabled(grdWrhsVhcl.getRows() -1, 0, grdWrhsVhcl.getRows() -1, grdWrhsVhcl.getCols() -1, true);
            }else if(grid === "grdSpmtTrsprtCo"){

            	let apcCdCol = spmtTrsprtMngGridData.getColRef("apcCd");
            	spmtTrsprtMngGridData.setCellData(nRow, nCol, "N", true);
            	spmtTrsprtMngGridData.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdSpmtTrsprtCo.addRow(true);

            	spmtTrsprtMngGridData.setCellDisabled(0, 0, spmtTrsprtMngGridData.getRows() -1, spmtTrsprtMngGridData.getCols() -1, false);
            	spmtTrsprtMngGridData.setCellDisabled(spmtTrsprtMngGridData.getRows() -1, 0, spmtTrsprtMngGridData.getRows() -1, spmtTrsprtMngGridData.getCols() -1, true);
            }else if(grid === "grdOprtr"){

            	let apcCdCol = grdOprtr.getColRef("apcCd");
            	grdOprtr.setCellData(nRow, nCol, "N", true);
            	grdOprtr.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdOprtr.addRow(true);

            	grdOprtr.setCellDisabled(0, 0, grdOprtr.getRows() -1, grdOprtr.getCols() -1, false);
            	grdOprtr.setCellDisabled(grdOprtr.getRows() -1, 0, grdOprtr.getRows() -1, grdOprtr.getCols() -1, true);
            }else if(grid === "grdApcVrty"){

            	let apcCdCol = grdApcVrty.getColRef("apcCd");
            	let itemCdCol = grdApcVrty.getColRef("itemCd");

            	grdApcVrty.setCellData(nRow, nCol, "N", true);
            	grdApcVrty.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdApcVrty.setCellData(nRow, itemCdCol, SBUxMethod.get("vrty-inp-itemCd"), true);
            	grdApcVrty.addRow(true);

            	grdApcVrty.setCellDisabled(0, 0, grdApcVrty.getRows() -1, grdApcVrty.getCols() -1, false);
            	grdApcVrty.setCellDisabled(grdApcVrty.getRows() -1, 0, grdApcVrty.getRows() -1, grdApcVrty.getCols() -1, true);
            }else if(grid === "grdStdGrd"){
            	if(!(SBUxMethod.get("grd-slt-itemCd") == null || SBUxMethod.get("grd-slt-itemCd") == "")){

            		let apcCdCol = grdStdGrd.getColRef("apcCd");
                	let itemCdCol = grdStdGrd.getColRef("itemCd");
                	let grdSeCdCol = grdStdGrd.getColRef("grdSeCd");

            		grdStdGrd.setCellData(nRow, nCol, "N", true);
            		grdStdGrd.setCellData(nRow, apcCdCol, gv_apcCd, true);
            		grdStdGrd.setCellData(nRow, itemCdCol, SBUxMethod.get("grd-slt-itemCd"), true);
            		grdStdGrd.setCellData(nRow, grdSeCdCol, SBUxMethod.get("grd-rdo-grdSeCd"), true);
            		grdStdGrd.addRow(true);

            		grdStdGrd.setCellDisabled(0, 0, grdStdGrd.getRows() -1, grdStdGrd.getCols() -1, false);
            		grdStdGrd.setCellDisabled(grdStdGrd.getRows() -1, 0, grdStdGrd.getRows() -1, grdStdGrd.getCols() -1, true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdStdGrdDtl"){
            	if(!(SBUxMethod.get("grd-slt-itemCd") == null || SBUxMethod.get("grd-slt-itemCd") == "")){
            		let apcCdCol = grdStdGrdDtl.getColRef("apcCd");
                	let itemCdCol = grdStdGrdDtl.getColRef("itemCd");
                	let grdSeCdCol = grdStdGrdDtl.getColRef("grdSeCd");
                	let grdKndCol = grdStdGrdDtl.getColRef("grdKnd");

					let rowData = grdStdGrd.getRowData(grdStdGrd.getRow());
            		grdStdGrdDtl.setCellData(nRow, nCol, "N", true);
            		grdStdGrdDtl.setCellData(nRow, apcCdCol, gv_apcCd, true);
            		grdStdGrdDtl.setCellData(nRow, itemCdCol, rowData.itemCd, true);
            		grdStdGrdDtl.setCellData(nRow, grdSeCdCol, rowData.grdSeCd, true);
            		grdStdGrdDtl.setCellData(nRow, grdKndCol, rowData.grdKnd, true);
            		grdStdGrdDtl.addRow(true);

            		grdStdGrdDtl.setCellDisabled(0, 0, grdStdGrdDtl.getRows() -1, grdStdGrdDtl.getCols() -1, false);
            		grdStdGrdDtl.setCellDisabled(grdStdGrdDtl.getRows() -1, 0, grdStdGrdDtl.getRows() -1, grdStdGrdDtl.getCols() -1, true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdStdGrdJgmt"){
            	if(!(SBUxMethod.get("grd-slt-itemCd") == null || SBUxMethod.get("grd-slt-itemCd") == "")){
            		let apcCdCol = grdStdGrdJgmt.getColRef("apcCd");
                	let itemCdCol = grdStdGrdJgmt.getColRef("itemCd");
                	let grdSeCdCol = grdStdGrdJgmt.getColRef("grdSeCd");

					grdStdGrdJgmt.setCellData(nRow, nCol, "N", true);
					grdStdGrdJgmt.setCellData(nRow, apcCdCol, gv_apcCd, true);
					grdStdGrdJgmt.setCellData(nRow, itemCdCol, SBUxMethod.get("grd-slt-itemCd"), true);
					grdStdGrdJgmt.setCellData(nRow, grdSeCdCol, SBUxMethod.get("grd-rdo-grdSeCd"), true);
					grdStdGrdJgmt.addRow(true);

					grdStdGrdJgmt.setCellDisabled(0, 0, grdStdGrdJgmt.getRows() -1, grdStdGrdJgmt.getCols() -1, false);
					grdStdGrdJgmt.setCellDisabled(grdStdGrdJgmt.getRows() -1, 0, grdStdGrdJgmt.getRows() -1, grdStdGrdJgmt.getCols() -1, true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdApcSpcfct"){
            	if(!(SBUxMethod.get("spcfct-slt-itemCd") == null || SBUxMethod.get("spcfct-slt-itemCd") == "")){

            		let apcCdCol = grdApcSpcfct.getColRef("apcCd");
                	let itemCdCol = grdApcSpcfct.getColRef("itemCd");

            		grdApcSpcfct.setCellData(nRow, nCol, "N", true);
            		grdApcSpcfct.setCellData(nRow, apcCdCol, gv_apcCd, true);
            		grdApcSpcfct.setCellData(nRow, itemCdCol, SBUxMethod.get("spcfct-slt-itemCd"), true);
            		grdApcSpcfct.addRow(true);
            		grdApcSpcfct.setCellDisabled(0, 0, grdApcSpcfct.getRows() -1, grdApcSpcfct.getCols() -1, false);
            		grdApcSpcfct.setCellDisabled(grdApcSpcfct.getRows() -1, 0, grdApcSpcfct.getRows() -1, grdApcSpcfct.getCols() -1, true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdSmptPckgUnit"){
            	let apcCdCol = grdSpmtPckgUnit.getColRef("apcCd");
            	let itemCdCol = grdSpmtPckgUnit.getColRef("itemCd");

           		grdSpmtPckgUnit.setCellData(nRow, nCol, "N", true);
           		grdSpmtPckgUnit.setCellData(nRow, apcCdCol, gv_apcCd, true);
           		grdSpmtPckgUnit.setCellData(nRow, itemCdCol, SBUxMethod.get("spmtPckgUnit-slt-itemCd"), true);
           		grdSpmtPckgUnit.addRow(true);
           		grdSpmtPckgUnit.setCellDisabled(0, 0, grdSpmtPckgUnit.getRows() -1, grdSpmtPckgUnit.getCols() -1, false);
           		grdSpmtPckgUnit.setCellDisabled(grdSpmtPckgUnit.getRows() -1, 0, grdSpmtPckgUnit.getRows() -1, grdSpmtPckgUnit.getCols() -1, true);
            }else if(grid === "grdSpmtSlsUntprcReg"){

            	let apcCdCol = grdSpmtSlsUntprcReg.getColRef("apcCd");
            	let spmtPckgUnitCdCol = grdSpmtSlsUntprcReg.getColRef("spmtPckgUnitCd");
            	grdSpmtSlsUntprcReg.setCellData(nRow, nCol, "N", true);
            	grdSpmtSlsUntprcReg.setCellData(nRow, spmtPckgUnitCdCol, SBUxMethod.get("spmtSlsUntprcReg-inp-spmtPckgUnitCd"), true);
            	grdSpmtSlsUntprcReg.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdSpmtSlsUntprcReg.addRow(true);
            	grdSpmtSlsUntprcReg.setCellDisabled(0, 0, grdSpmtSlsUntprcReg.getRows() -1, grdSpmtSlsUntprcReg.getCols() -1, false);
            	grdSpmtSlsUntprcReg.setCellDisabled(grdSpmtSlsUntprcReg.getRows() -1, 0, grdSpmtSlsUntprcReg.getRows() -1, grdSpmtSlsUntprcReg.getCols() -1, true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "cnptMngDatagrid") {
            	if(cnptMngDatagrid.getRowStatus(nRow) == 0 || cnptMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var cnpt = cnptMngDatagrid.getRowData(nRow);
            			fn_deleteCnptList(cnpt);
            			cnptMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		cnptMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "grdFclt") {
            	if(grdFclt.getRowStatus(nRow) == 0 || grdFclt.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = grdFclt.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			grdFclt.deleteRow(nRow);
            		}
            	}else{
            		grdFclt.deleteRow(nRow);
            	}
            }else if (grid === "grdWarehouse") {
            	if(grdWarehouse.getRowStatus(nRow) == 0 || grdWarehouse.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = grdWarehouse.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			grdWarehouse.deleteRow(nRow);
            		}
            	}else{
            		warehouseMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "grdPlt") {
            	if(grdPlt.getRowStatus(nRow) == 0 || grdPlt.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var pltBxVO = grdPlt.getRowData(nRow);
            			fn_deletepltBx(pltBxVO);
            			grdPlt.deleteRow(nRow);
            		}
            	}else{
           		grdPlt.deleteRow(nRow);
            	}
            }else if (grid === "grdBx") {
            	if(grdBx.getRowStatus(nRow) == 0 || grdBx.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var pltBxVO = grdBx.getRowData(nRow);
            			fn_deletepltBx(pltBxVO);
            			grdBx.deleteRow(nRow);
            		}
            	}else{
           			grdBx.deleteRow(nRow);
            	}
            }else if (grid === "grdRgnTrsprtCst") {
            	if(grdRgnTrsprtCst.getRowStatus(nRow) == 0 || grdRgnTrsprtCst.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rgnTrsprtCst = grdRgnTrsprtCst.getRowData(nRow);
            			fn_deleteRgnTrsprtCstList(rgnTrsprtCst);
            			grdRgnTrsprtCst.deleteRow(nRow);
            		}
            	}else{
            		grdRgnTrsprtCst.deleteRow(nRow);
            	}
            }else if (grid === "grdWrhsVhcl") {
            	if(grdWrhsVhcl.getRowStatus(nRow) == 0 || grdWrhsVhcl.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var wrhsVhclVo = grdWrhsVhcl.getRowData(nRow);
            			fn_deleteWrhsVhclList(wrhsVhclVo);
            			grdWrhsVhcl.deleteRow(nRow);
            		}
            	}else{
            		grdWrhsVhcl.deleteRow(nRow);
            	}
            }else if (grid === "grdSpmtTrsprtCo") {
            	if(grdSpmtTrsprtCo.getRowStatus(nRow) == 0 || grdSpmtTrsprtCo.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var spmtTrsprt = grdSpmtTrsprtCo.getRowData(nRow);
            			fn_deleteSpmtTrsprtList(spmtTrsprt);
            			grdSpmtTrsprtCo.deleteRow(nRow);
            		}
            	}else{
            		grdSpmtTrsprtCo.deleteRow(nRow);
            	}
            }else if (grid === "grdOprtr") {
            	if(grdOprtr.getRowStatus(nRow) == 0 || grdOprtr.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var oprtrVO = grdOprtr.getRowData(nRow);
            			fn_deleteOprtrList(oprtrVO);
            			grdOprtr.deleteRow(nRow);
            		}
            	}else{
            		grdOprtr.deleteRow(nRow);
            	}
            }else if (grid === "grdStdGrd") {
            	if(grdStdGrd.getRowStatus(nRow) == 0 || grdStdGrd.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var stdGrdVO = grdStdGrd.getRowData(nRow);
            			fn_deleteGrd(stdGrdVO);
            			grdStdGrd.deleteRow(nRow);
            		}
            	}else{
            		grdStdGrd.deleteRow(nRow);
            	}
            }else if (grid === "grdStdGrdDtl") {
            	if(grdStdGrdDtl.getRowStatus(nRow) == 0 || grdStdGrdDtl.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var stdGrdDtlVO = grdStdGrdDtl.getRowData(nRow);
            			fn_deleteGrdDtl(stdGrdDtlVO);
            			grdStdGrdDtl.deleteRow(nRow);
            		}
            	}else{
            		grdStdGrdDtl.deleteRow(nRow);
            	}
            }else if (grid === "grdStdGrdJgmt") {
            	if(grdStdGrdJgmt.getRowStatus(nRow) == 0 || grdStdGrdJgmt.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var stdGrdJgmtVO = grdStdGrdJgmt.getRowData(nRow);
            			fn_deleteGrdJgmt(stdGrdJgmtVO);
            			grdStdGrdJgmt.deleteRow(nRow);
            		}
            	}else{
            		grdStdGrdJgmt.deleteRow(nRow);
            	}
            }else if (grid === "grdApcSpcfct") {
            	if(grdApcSpcfct.getRowStatus(nRow) == 0 || grdApcSpcfct.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var cmnsSpcfctVO = grdApcSpcfct.getRowData(nRow);
            			fn_deleteSpcfct(cmnsSpcfctVO);
            			grdApcSpcfct.deleteRow(nRow);
            		}
            	}else{
            		grdApcSpcfct.deleteRow(nRow);
            	}
            }else if (grid === "grdSmptPckgUnit") {
            	if(grdSpmtPckgUnit.getRowStatus(nRow) == 0 || grdSpmtPckgUnit.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var spmtPckgUnitVO = grdSpmtPckgUnit.getRowData(nRow);
            			fn_deleteSpmtPckgUnit(spmtPckgUnitVO);
            			grdSpmtPckgUnit.deleteRow(nRow);
            		}
            	}else{
            		grdSpmtPckgUnit.deleteRow(nRow);
            	}
            }else if (grid === "grdSpmtSlsUntprcReg") {
            	if(grdSpmtSlsUntprcReg.getRowStatus(nRow) == 0 || grdSpmtSlsUntprcReg.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var spmtSlsUntprcRegVO = grdSpmtSlsUntprcReg.getRowData(nRow);
            			fn_deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
            			grdSpmtSlsUntprcReg.deleteRow(nRow);
            		}
            	}else{
            		grdSpmtSlsUntprcReg.deleteRow(nRow);
            	}
            }
        }
    }

    // 정희운. 두 List<Object>가 동일한지 비교하는 함수.
	async function chkEqualObj(obj1, obj2){

		var obj1Len = obj1.length == 0 ? 0 : obj1.filter(e => e["delYn"] == "N").length;
		var obj2Len = obj2.length == 0 ? 0 : obj2.filter(e => e["delYn"] == "N").length;

		if (obj1Len != obj2Len)
			return false;

		if (obj1Len == 0 && obj2Len == 0)
			return true;

		var obj1keys = Object.keys(obj1[0]);
		obj1keys.sort();
		var obj2keys = Object.keys(obj2[0]);
		obj2keys.sort();

		if (JSON.stringify(obj1keys) != JSON.stringify(obj2keys))
			return false;

		for(var i=0; i<obj1Len; i++){
			for(var j=0; j<obj1keys.length; j++){
				if(obj1[i][obj1keys[j]] != obj2[i][obj1keys[j]])
					return false;
			}
		}
		return true;
	}

	// APC정보변경
    const fn_save = async function(){
		let chkGdsSeCd = SBUxMethod.get("chk-gdsSeCd");
		let keys = Object.getOwnPropertyNames(chkGdsSeCd);

		let insertList = [];
		let cdVls = "";
		for(let i=0; i<keys.length; i++){
			if(chkGdsSeCd[keys[i]]){
				cdVls += chkGdsSeCd[keys[i]]
			}
		}

    	let apcEvrmntStng = {
    		apcCd					: gv_selectedApcCd
    	  ,	apcNm 					: SBUxMethod.get("inp-apcNm")
    	  , telno 					: SBUxMethod.get("inp-telno")
    	  , addr 					: SBUxMethod.get("inp-addr")
    	  , fxno 					: SBUxMethod.get("inp-fxno")
    	  , actno 					: SBUxMethod.get("inp-actno")
    	  , bankCd 					: SBUxMethod.get("slt-bankCd")
    	  , dpstr 					: SBUxMethod.get("inp-dpstr")
    	  , brno 					: SBUxMethod.get("inp-brno")
    	  , apcSeCd					: SBUxMethod.get("rdo-apcSeCd")
    	  , clclnCrtrCd				: SBUxMethod.get("rdo-clclnCrtrCd")
    	  , bzstat					: SBUxMethod.get("inp-bzstat")
    	  , cls						: SBUxMethod.get("inp-cls")
    	  , apcRprsvNm				: SBUxMethod.get("inp-apcRprsvNm")
    	  , cdVls					: cdVls
    	}
    	let postJsonPromise = gfn_postJSON("/am/apc/updateApcEvrmntStng.do", apcEvrmntStng);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001")				// I0001	처리 되었습니다.
        		selectApcEvrmntStng();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }
	const fn_saveMenu = async function(){

		let apcEvrmntStng = {
			apcCd 					: gv_apcCd
		  , wghMngYn 				: SBUxMethod.get("chk-wghMngYn")["chk-wghMngYn"]
		  , wghMblUseYn 			: SBUxMethod.get("chk-wghMblUseYn")["chk-wghMblUseYn"]
	  	  , wghIdntyDocPblcnYn 		: SBUxMethod.get("chk-wghIdntyDocPblcnYn")["chk-wghIdntyDocPblcnYn"]
	  	  , rawMtrWrhsMngYn 		: SBUxMethod.get("chk-rawMtrWrhsMngYn")["chk-rawMtrWrhsMngYn"]
	  	  , rawMtrWrhsMblUseYn 		: SBUxMethod.get("chk-rawMtrWrhsMblUseYn")["chk-rawMtrWrhsMblUseYn"]
	  	  , rawMtrIdentTagPblcnYn 	: SBUxMethod.get("chk-rawMtrIdentTagPblcnYn")["chk-rawMtrIdentTagPblcnYn"]
	  	  , pltBxMngYn 				: SBUxMethod.get("chk-pltBxMngYn")["chk-pltBxMngYn"]
	  	  , rawMtrWrhsPlanMngYn 	: SBUxMethod.get("chk-rawMtrWrhsPlanMngYn")["chk-rawMtrWrhsPlanMngYn"]
	  	  , gdsWrhsMngYn 			: SBUxMethod.get("chk-gdsWrhsMngYn")["chk-gdsWrhsMngYn"]
	  	  , sortCmndMngYn 			: SBUxMethod.get("chk-sortCmndMngYn")["chk-sortCmndMngYn"]
	  	  , sortCmndDocPblcnYn 		: SBUxMethod.get("chk-sortCmndDocPblcnYn")["chk-sortCmndDocPblcnYn"]
	  	  , pckgCmndMngYn 			: SBUxMethod.get("chk-pckgCmndMngYn")["chk-pckgCmndMngYn"]
	  	  , pckgCmndDocPblcnYn 		: SBUxMethod.get("chk-pckgCmndDocPblcnYn")["chk-pckgCmndDocPblcnYn"]
	  	  , sortMngYn 				: SBUxMethod.get("chk-sortMngYn")["chk-sortMngYn"]
	  	  , sortMblUseYn 			: SBUxMethod.get("chk-sortMblUseYn")["chk-sortMblUseYn"]
	  	  , sortLblPblcnYn 			: SBUxMethod.get("chk-sortLblPblcnYn")["chk-sortLblPblcnYn"]
	  	  , sortIdntyDocPblcnYn 	: SBUxMethod.get("chk-sortIdntyDocPblcnYn")["chk-sortIdntyDocPblcnYn"]
	  	  , pckgMngYn 				: SBUxMethod.get("chk-pckgMngYn")["chk-pckgMngYn"]
	  	  , pckgMblUseYn 			: SBUxMethod.get("chk-pckgMblUseYn")["chk-pckgMblUseYn"]
	  	  , gdsLblPblcnYn 			: SBUxMethod.get("chk-gdsLblPblcnYn")["chk-gdsLblPblcnYn"]
	  	  , spmtCmndMngYn 			: SBUxMethod.get("chk-spmtCmndMngYn")["chk-spmtCmndMngYn"]
	  	  , spmtCmndDocPblcnYn 		: SBUxMethod.get("chk-spmtCmndDocPblcnYn")["chk-spmtCmndDocPblcnYn"]
	  	  , spmtMngYn 				: SBUxMethod.get("chk-spmtMngYn")["chk-spmtMngYn"]
	  	  , spmtMblUseYn 			: SBUxMethod.get("chk-spmtMblUseYn")["chk-spmtMblUseYn"]
	  	  , spmtDocPblcnYn 			: SBUxMethod.get("chk-spmtDocPblcnYn")["chk-spmtDocPblcnYn"]
	  	  , clclnMngYn 				: SBUxMethod.get("chk-clclnMngYn")["chk-clclnMngYn"]
	  	  , outordrMngYn 			: SBUxMethod.get("chk-outordrMngYn")["chk-outordrMngYn"]
	  	  , outordrAtmtcRcptnYn 	: SBUxMethod.get("chk-outordrAtmtcRcptnYn")["chk-outordrAtmtcRcptnYn"]
	  	  //, outordrPckgCmndLnkgYn : SBUxMethod.get("chk-outordrPckgCmndLnkgYn")
	  	  //, trsmMngYn 				: SBUxMethod.get("chk-trsmMngYn")["chk-trsmMngYn"]
	  	  //, sortDataTrsmYn 			: SBUxMethod.get("chk-sortDataTrsmYn")["chk-sortDataTrsmYn"]
	  	  //, clclnDataTrsmYn 		: SBUxMethod.get("chk-clclnDataTrsmYn")["chk-clclnDataTrsmYn"]
	  	  , oprtrUseYn 				: SBUxMethod.get("chk-oprtrUseYn")["chk-oprtrUseYn"]
	  	  , invntrMngYn 			: SBUxMethod.get("chk-invntrMngYn")["chk-invntrMngYn"]
	  	  , invntrTrnsfMngYn 		: SBUxMethod.get("chk-invntrTrnsfMngYn")["chk-invntrTrnsfMngYn"]
	  	  , slsMngYn 				: SBUxMethod.get("chk-slsMngYn")["chk-slsMngYn"]
	  	  //, oprtrSortPrfmncTrsmYn 			: SBUxMethod.get("chk-oprtrSortPrfmncTrsmYn")
	  	  //, oprtrPckgPrfmncTrsmYn 			: SBUxMethod.get("chk-oprtrPckgPrfmncTrsmYn")

		}

		let postJsonPromise = gfn_postJSON("/am/apc/updateApcMenuAuthrt.do", apcEvrmntStng);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001")				// I0001	처리 되었습니다.
        		selectApcEvrmntStng();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }

	}


</script>
</html>