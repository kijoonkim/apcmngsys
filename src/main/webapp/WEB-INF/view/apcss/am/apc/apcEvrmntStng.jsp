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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ APC환경설정</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
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
							<th scope="row" rowspan="4">APC정보</th>
							<td scope="row" align="right">코드</td>
							<td scope="row" style="border-right: hidden;">
								<sbux-input id="inp-apcCd" name="inp-apcCd" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">명칭</td>
							<td scope="row" >
								<sbux-input id="inp-apcNm" name="inp-apcNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" align="right">주소</td>
							<td scope="row">
								<sbux-input id="addr" name="addr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" align="right">전화번호</td>
							<td scope="row">
								<sbux-input id="telno" name="telno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" align="right">팩스번호</td>
							<td scope="row">
								<sbux-input id="fxno" name="fxno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">사업번호</td>
							<td scope="row">
								<sbux-input id="apcBrno" name="apcBrno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" align="right">계좌번호</td>
							<td scope="row">
								<sbux-input id="actno" name="actno" uitype="text" class="form-control input-sm"></sbux-input>

							</td>
							<td scope="row" align="right">입금은행</td>
							<td >
								<sbux-select id="comboBankNm" name="comboBankNm" uitype="single" jsondata-ref="jsonComboBankNm" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>

							<td scope="row" align="right">예금주명</td>
							<td scope="row">
								<sbux-input id="dpstr" name="dpstr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<td scope="row" align="right">구분</td>
							<td class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="apcGubun1" name="apcGubun" uitype="normal" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">농협</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="apcGubun2" name="apcGubun" uitype="normal" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">법인</label>
								</p>
							</td>
							<td scope="row" align="right">정산기준</td>
							<td colspan="5" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun1" name="prdcrGubun" uitype="normal"  class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">입고</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun2" name="prdcrGubun" uitype="normal"  class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">선별</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">APC사용자 관리</th>
							<td colspan="2"class="td_input">
								<sbux-button id="btnUserAuth" name="btnUserAuth" uitype="modal" text="사용자권한 설정" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-userAuth" onclick="fn_modal('btnUserAuth')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								업무지원시스템을 사용할 일반사용자를 승인합니다. (신규가입은 포탈을 이용하세요)
							</td>
						</tr>
						<tr>
							<th scope="row">운용설비 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnFclt" name="btnFclt" uitype="modal" text="설비 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-fclt" onclick="fn_modal('btnFclt')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 운영하고 있는 선별기와 포장기를 등록하세요. (선별1호기, 선별2호기... / 포장1호기, 포장2호기...)
							</td>
						</tr>
						<tr>
							<th scope="row">저장창고 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnWarehouse" name="btnWarehouse" uitype="modal" text="창고 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-warehouse" onclick="fn_modal('btnWarehouse')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 운영하고 있는 창고를 등록하세요. (원물창고1, 원물창고2... / 선별창고1 ... / 포장창고1..)
							</td>
						</tr>
						<tr>
							<th scope="row">품목/품종 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnItem" name="btnItem" uitype="modal" text="품목/품종 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-item" onclick="fn_modal('btnItem')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 관리하고 있는 품목과 품종을 선택하세요. (여러 개의 품목과 품종을 관리할 수 있습니다)
							</td>
						</tr>
						<tr>
							<th scope="row">등급/규격 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnGrdSpcfct" name="btnGrdSpcfct" uitype="modal" text="등급/규격 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-grdSpcfct" onclick="fn_modal('btnGrdSpcfct')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								선택한 품목별로 APC에서 관리하는 등급과 규격을 등록하세요.
							</td>
						</tr>
						<!-- <tr>
							<th scope="row">출하포장단위 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnSpmtPckgUnit" name="btnSpmtPckgUnit" uitype="modal" text="출하포장단위 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-spmtPckgUnit" onclick="fn_modal('btnSpmtPckgUnit')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								선택한 품목별로 APC에서 관리하는 출하포장단위을 등록하세요.
							</td>
						</tr> -->
						<tr>
							<th scope="row">원물 팔레트/박스</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnpltBx" name="btnpltBx" uitype="modal" text="팔레트/박스 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-pltBx" onclick="fn_modal('btnPltBx')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								APC에서 관리하고 있는 팔레트와 박스의 종류 및 기초재고수량을 등록합니다. (계근대를 사용하는 경우 단중을 입력해야 합니다)
							</td>
						</tr>
						<tr>
							<th scope="row">입고차량 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnVhcl" name="btnVhcl" uitype="modal" text="입고차량/운임 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-wrhsVhcl" onclick="fn_modal('btnWrhsVhcl')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								원물입고 시 차량번호를 관리하는 경우 차량번호를 입력하세요. (차후 추가등록도 가능합니다)
							</td>
						</tr>
						<tr>
							<th scope="row">출하운송사 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnSpmtTrsprt" name="btnSpmtTrsprt" uitype="modal" text="출하 운송회사 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-spmtTrsprt" onclick="fn_modal('btnSpmtTrsprt')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								상품출하시 운용하고 있는 운송사 정보를 등록하세요. (출하처리 시 필요한 정보입니다)
							</td>
						</tr>
						<tr>
							<th scope="row">거래처 관리</th>
							<td class="td_input" colspan="2">
								<sbux-button id="btnCnpt" name="btnCnpt" uitype="modal" text="거래처 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="modal-cnpt" onclick="fn_modal('btnCnpt')"></sbux-button>
							</td>
							<td colspan="6" style="color:#999">
								상품출하시 관리하고 있는 거래처 정보를 등록하세요. (출하처리 시 필요한 정보입니다)
							</td>
						</tr>
						<tr>
							<th scope="row">생산작업자 관리</th>
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
									<sbux-checkbox id="wghMngYn" name="wghMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>
		                     	<p class="ad_input_row">
									<sbux-checkbox id="wghMblUseYn" name="wghMblUseYn" uitype="normal" text="테블릿사용" ></sbux-checkbox>
		                  		</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="wghIdntyDocPblcnYn" name="wghIdntyDocPblcnYn" uitype="normal" text="계량확인서 발행" ></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th rowspan="2">원물입고 관리</th>
							<td rowspan="2">
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsMngYn" name="rawMtrWrhsMngYn" uitype="normal" text="사용" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsMblUseYn" name="rawMtrWrhsMblUseYn" uitype="normal" text="테블릿사용" ></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrIdentTagPblcnYn" name="rawMtrIdentTagPblcnYn" uitype="normal" text="원물인식표 발행" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pltBxMngYn" name="pltBxMngYn" uitype="normal" text="팔레트/박스정보관리" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsPlanMngYn" name="rawMtrWrhsPlanMngYn" uitype="normal" text="원물입고계획관리" ></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="gdsWrhsMngYn" name="gdsWrhsMngYn" uitype="normal" text="상품입고관리"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortCmndMngYn" name="sortCmndMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortCmndDocPblcnYn" name="sortCmndDocPblcnYn" uitype="normal" text="선별지시서 발행"></sbux-checkbox>
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
									<sbux-checkbox id="pckgCmndMngYn" name="pckgCmndMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgCmndDocPblcnYn" name="pckgCmndDocPblcnYn" uitype="normal" text="포장지시서 발행"></sbux-checkbox>
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
									<sbux-checkbox id="sortMngYn" name="sortMngYn" uitype="normal" text="사용" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortMblUseYn" name="sortMblUseYn" uitype="normal" text="테블릿사용 (선별투입)"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortLabelPblcnYn" name="sortLabelPblcnYn" uitype="normal" text="선별라벨 발행"></sbux-checkbox>
								</p>
							</td>
							<td><p class="ad_input_row">
									<sbux-checkbox id="sortIdntyDocPblcnYn" name="sortIdntyDocPblcnYn" uitype="normal" text="선별확인서 발행" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>포장 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgMngYn" name="pckgMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgMblUseYn" name="pckgMblUseYn" uitype="normal" text="테블릿사용 (포장투입)"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="gdsLblPblcnYn" name="gdsLblPblcnYn" uitype="normal" text="상품라벨 발행"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtCmndMngYn" name="spmtCmndMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtCmndDocPblcnYn" name="spmtCmndDocPblcnYn" uitype="normal" text="출하지시서 발행"></sbux-checkbox>
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
									<sbux-checkbox id="spmtMngYn" name="spmtMngYn" uitype="normal" text="사용" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtMblUseYn" name="spmtMblUseYn" uitype="normal" text="테블릿 사용"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtDocPblcnYn" name="spmtDocPblcnYn" uitype="normal" text="송품장발행" checked readonly></sbux-checkbox>
								</p>
							</td>
							<td><p class="ad_input_row">
									<sbux-checkbox id="invntrTrnsfYn" name="invntrTrnsfYn" uitype="normal" text="재고이송"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>정산 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="clclnMngYn" name="clclnMngYn" uitype="normal" text="사용"></sbux-checkbox>
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
									<sbux-checkbox id="ordrMngYn" name="ordrMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>농협전송 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="trsmMngYn" name="trsmMngYn" uitype="normal" text="사용"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortDataTrsmYn" name="sortDataTrsmYn" uitype="normal" text="선별정보 전송"></sbux-checkbox>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="clclnDataTrsmYn" name="clclnDataTrsmYn" uitype="normal" text="정산자료 전송"></sbux-checkbox>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>생산작업자 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="oprtrUseYn" name="oprtrUseYn" uitype="normal" text="사용"></sbux-checkbox>
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
        <sbux-modal id="modal-userAuth" name="modal-userAuth" uitype="middle" header-title="APC사용자 권한설정" body-html-id="body-modal-userAuth" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-userAuth">
    	<jsp:include page="../apc/apcUserMngPopup.jsp"></jsp:include>
    </div>
    <!-- 설비 등록 Modal -->
    <div>
        <sbux-modal id="modal-fclt" name="modal-fclt" uitype="middle" header-title="설비 등록" body-html-id="body-modal-fclt" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-fclt">
    	<jsp:include page="../apc/fcltMngPopup.jsp"></jsp:include>
    </div>
    <!-- 창고 등록 Modal -->
    <div>
        <sbux-modal id="modal-warehouse" name="modal-warehouse" uitype="middle" header-title="창고 등록" body-html-id="body-modal-warehouse" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-warehouse">
    	<jsp:include page="../apc/warehouseMngPopup.jsp"></jsp:include>
    </div>
    <!--품목/품종 등록 Modal -->
    <div>
        <sbux-modal id="modal-item" name="modal-item" uitype="middle" header-title="품목/품종 등록" body-html-id="body-modal-item" footer-is-close-button="false"style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-item">
    	<jsp:include page="../apc/itemMngPopup.jsp"></jsp:include>
    </div>
    <!-- 등급/규격 등록 Modal -->
    <div>
        <sbux-modal id="modal-grdSpcfct" name="modal-grdSpcfct" uitype="middle" header-title="등급/규격 등록" body-html-id="body-modal-grdSpcfct" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-grdSpcfct">
    	<jsp:include page="../apc/grdSpcfctMngPopup.jsp"></jsp:include>
    </div>
    <!-- 출하포장단위 등록 Modal -->
    <%-- <div>
        <sbux-modal id="modal-spmtPckgUnit" name="modal-spmtPckgUnit" uitype="middle" header-title="춣하포장단위 등록" body-html-id="body-modal-spmtPckgUnit" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtPckgUnit">
    	<jsp:include page="../apc/spmtPckgUnitMngPopup.jsp"></jsp:include>
    </div> --%>
    <!-- 팔레트/박스 등록 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="팔레트/박스 등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../apc/pltBxMngPopup.jsp"></jsp:include>
    </div>
    <!-- 입고차량정보 등록 Modal -->
    <div>
        <sbux-modal id="modal-wrhsVhcl" name="modal-wrhsVhcl" uitype="middle" header-title="입고차량정보 등록" body-html-id="body-modal-wrhsVhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-wrhsVhcl">
    	<jsp:include page="../apc/wrhsVhclMngPopup.jsp"></jsp:include>
    </div>
    <!-- 출하운송회사 등록 Modal -->
    <div>
        <sbux-modal id="modal-spmtTrsprt" name="modal-spmtTrsprt" uitype="middle" header-title="출하운송회사 등록" body-html-id="body-modal-spmtTrsprt" footer-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="body-modal-spmtTrsprt">
    	<jsp:include page="../apc/spmtTrsprtMngPopup.jsp"></jsp:include>
    </div>
    <!-- 거래처 등록 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 등록" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../apc/cnptMngPopup.jsp"></jsp:include>
    </div>
    <!-- 생산작업자 등록 Modal -->
    <div>
        <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산자 등록" body-html-id="body-modal-oprtr" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-oprtr">
    	<jsp:include page="../apc/oprtrMngPopup.jsp"></jsp:include>
    </div>

    <!-- 간편설정 Modal -->
    <div>
        <sbux-modal id="modal-simpleStng" name="modal-simpleStng" uitype="middle" header-title="메뉴간편설정" body-html-id="body-modal-simpleStng" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-simpleStng">
    	<jsp:include page="../apc/simpleStngPopup.jsp"></jsp:include>
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

	const fn_initSBSelect = async function() {
		gfn_setComCdSBSelect('comboBankNm', jsonComboBankNm ,	'BANK_CD', '0000');				// 검색 조건(시스템구분)
		gfn_setComCdGridSelect('userAuthMngDatagrid', comboUesYnJsData, "USE_YN", "0000");
		gfn_setComCdGridSelect('grdPlt', comboUnitCdJsData, "UNIT_CD", "0000");
		gfn_setComCdGridSelect('pckgMngDatagrid', comboReverseYnJsData, "REVERSE_YN", "0000");
		gfn_setComCdGridSelect('wrhsVhclMngDatagrid', comboGridBankCdJsData, "BANK_CD", "0000");
		gfn_setComCdGridSelect('cnptMngDatagrid', comboGridCnptTypeJsData, "CNPT_TYPE", "0000");
	}


	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("inp-apcCd", gv_apcCd);
		selectApcInfo();
		fn_initSBSelect();
	})


	async function selectApcInfo(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcInfo.do", {apcCd : apcCd});

        let data = await postJsonPromise;
		let resultVO = data.resultVO;
        try{

        	SBUxMethod.set("inp-apcNm", resultVO.regApcNm);
        	SBUxMethod.set("telNo", resultVO.regTelNo);
        	SBUxMethod.set("addr", resultVO.regAddr);

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
			fn_userAuthMngCreateGrid();
		}
		if(targetName == 'btnFclt'){
			fn_fcltMngCreateGrid();
		}
		if(targetName == 'btnWarehouse'){
			fn_warehouseMngCreateGrid();
		}
		if(targetName == 'btnItem'){
			fn_itemCreateGrid();
            fn_apcItemCreateGrid();
            fn_vrtyCreateGrid();
            fn_apcVrtyCreateGrid();
		}
		if(targetName == 'btnPltBx'){
			fn_pltMngCreateGrid();
			fn_bxMngCreateGrid();
			fn_pckgMngCreateGrid();
		}
		if(targetName == 'btnGrdSpcfct'){
			fn_createGrdGrid();
			fn_createGrdSpcfct();
			fn_createGrdApcSpcfct();
			fn_initSBSelectItem();
		}
		if(targetName == 'btnWrhsVhcl'){
			fn_wrhsVhclMngCreateGrid();
			fn_rgnTrsprtCstMngCreateGrid();
		}
		if(targetName == 'btnSpmtTrsprt'){
			fn_spmtTrsprtMngCreateGrid();
		}if(targetName == 'btnCnpt'){
			fn_cnptMngCreateGrid();
			fn_ordrMngCreateGrid();
		}if(targetName == 'btnOprtr'){
			fn_oprtrMngCreateGrid();
		}
	}

	async function fn_callInsertRsrcList(comCdList){
		let postJsonPromise = gfn_postJSON("/co/cd/insertComCdDtlList.do", comCdList);
        let data = await postJsonPromise;

        try{
        	console.log("data >>> "+ data.result);
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
    async function fn_procRow(gubun, grid, nRow, nCol) {
    	console.log(gubun, grid, nRow, nCol);
        if (gubun === "ADD") { 
            if (grid === "cnptMngDatagrid") {
            	cnptMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
            	cnptMngGridData[nRow-1].delYn = "N";
            	console.log(cnptMngGridData[nRow-1]);
            	cnptMngDatagrid.addRow(true);
            }else if (grid === "grdFclt") {
            	grdFclt.setCellData(nRow, nCol, "N", true);
            	grdFclt.setCellData(nRow, 4, SBUxMethod.get("inp-apcCd"), true);
            	grdFclt.setCellData(nRow, 5, "FCLT_CD", true);
            	grdFclt.addRow(true);
            }else if (grid === "grdWarehouse") {
            	grdWarehouse.setCellData(nRow, nCol, "N", true);
            	grdWarehouse.setCellData(nRow, 4, SBUxMethod.get("inp-apcCd"), true);
            	grdWarehouse.setCellData(nRow, 5, "WAREHOUSE_SE_CD", true);
            	grdWarehouse.addRow(true);
            }else if(grid === "grdPlt"){
            	grdPlt.setCellData(nRow, nCol, "N", true);
            	grdPlt.setCellData(nRow, 3, "K", true);
            	grdPlt.setCellData(nRow, 5, "Y", true);
            	grdPlt.setCellData(nRow, 7, "P", true);
            	grdPlt.setCellData(nRow, 8, SBUxMethod.get("inp-apcCd"), true);
            	grdPlt.addRow(true);
            }else if(grid === "grdBx"){
            	grdBx.setCellData(nRow, nCol, "N", true);
            	grdBx.setCellData(nRow, 5, "Y", true);
            	grdBx.setCellData(nRow, 3, "K", true);
            	grdBx.setCellData(nRow, 7, "B", true);
            	grdBx.setCellData(nRow, 8, SBUxMethod.get("inp-apcCd"), true);
            	grdBx.addRow(true);
            }else if(grid === "grdPckg"){
            	grdPckg.setCellData(nRow, nCol, "N", true);
            	grdPckg.setCellData(nRow, 5, SBUxMethod.get("inp-apcCd"), true);
            	grdPckg.setCellData(nRow, 6, "PCKG_SE_CD", true);
            	grdPckg.addRow(true);
            }else if(grid === "rgnTrsprtCstMngDatagrid"){
            	rgnTrsprtCstMngDatagrid.setCellData(nRow, nCol, "N", true);
            	rgnTrsprtCstMngDatagrid.setCellData(nRow, 5, SBUxMethod.get("inp-apcCd"), true);
            	rgnTrsprtCstMngDatagrid.addRow(true);
            }else if(grid === "wrhsVhclMngDatagrid"){
            	wrhsVhclMngGridData[nRow-1].delYn = "N";
            	wrhsVhclMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
				wrhsVhclMngDatagrid.addRow();
            }else if(grid === "spmtTrsprtMngDatagrid"){
            	spmtTrsprtMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
            	spmtTrsprtMngGridData[nRow-1].delYn = "N";
            	spmtTrsprtMngDatagrid.addRow(true);
            }else if(grid === "grdOprtr"){
            	grdOprtr.setCellData(nRow, nCol, "N", true);
            	grdOprtr.addRow(true);
            }else if(grid === "grdApcVrty"){
            	grdApcVrty.setCellData(nRow, nCol, "N", true);
            	grdApcVrty.setCellData(nRow, 3, SBUxMethod.get("inp-apcCd"), true);
            	grdApcVrty.setCellData(nRow, 4, grdApcItem.getRowData(grdApcItem.getRow()).itemCd, true);
            	grdApcVrty.addRow(true);
            }else if(grid === "grdGrd"){
            	console.log("grdGrd");
            	if(!(SBUxMethod.get("spcfct-select-itemCd") == null || SBUxMethod.get("spcfct-select-itemCd") == "")){
	            	grdGrd.setCellData(nRow, nCol, "N", true);
	            	grdGrd.setCellData(nRow, 3, SBUxMethod.get("inp-apcCd"), true);
	            	grdGrd.setCellData(nRow, 4, SBUxMethod.get("spcfct-select-itemCd"), true);
	            	grdGrd.addRow(true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }
        }
        else if (gubun === "DEL") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngDatagrid.deleteRow(nRow);
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
            			console.log(pltBxVO);
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
            }else if (grid === "grdPckg") {
            	if(grdPckg.getRowStatus(nRow) == 0 || grdPckg.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = grdPckg.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			grdPckg.deleteRow(nRow);
            		}
            	}else{
            		grdPckg.deleteRow(nRow);
            	}
            }else if (grid === "rgnTrsprtCstMngDatagrid") {
            	rgnTrsprtCstMngDatagrid.deleteRow(nRow);
            }else if (grid === "wrhsVhclMngDatagrid") {
            	wrhsVhclMngDatagrid.deleteRow(nRow);
            }else if (grid === "spmtTrsprtMngDatagrid") {
            	spmtTrsprtMngDatagrid.deleteRow(nRow);
            }else if (grid === "grdOprtr") {
            	grdOprtr.deleteRow(nRow);
            }else if (grid === "grdGrd") {
            	if(!(SBUxMethod.get("spcfct-select-itemCd") == null || SBUxMethod.get("spcfct-select-itemCd") == "")){

	            	if(grdGrd.getRowStatus(nRow) == 0 || grdGrd.getRowStatus(nRow) == 2){
	            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
	            		if(confirm(delMsg)){
	            			var cmnsGrdVO = grdGrd.getRowData(nRow);
	            			fn_deleteGrd(cmnsGrdVO);
	            			grdGrd.deleteRow(nRow);
	            		}
	            	}else{
	            		grdGrd.deleteRow(nRow);
	            	}
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }
        }
    }

    // 정희운. 두 List<Object>가 동일한지 비교하는 함수.
	async function chkEqualObj(obj1, obj2){
		console.log("obj1", obj1);
		console.log("obj2", obj2);
		
		var obj1Len = obj1.length == 0 ? 0 : obj1.filter(e => e["delYn"] == "N").length;
		var obj2Len = obj2.length == 0 ? 0 : obj2.filter(e => e["delYn"] == "N").length;

		if (obj1Len != obj2Len)
			return false;

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
</script>
</html>