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

	<style>
  		.table th {
    		border-bottom: 1px solid #ffffff !important;
  		}
  		div.input-group-addon {
			padding: 5px;
  		}
	</style>



</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title"> ▶ APC환경설정</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 1%">
						<col style="width: 3%">
						<col style="width: 10%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 15%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC코드</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td>&nbsp;</td>
							<td scope="row">
								<sbux-input id="apcCd" name="apcCd" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th rowspan="2">APC정보</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td scope="row">명칭</td>
							<td scope="row">
								<sbux-input id="apcNm" name="apcNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" colspan="2">주소</td>
							<td colspan="3"scope="row">
								<sbux-input id="addr" name="addr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" >전화번호</td>
							<td scope="row">
								<sbux-input id="telno" name="telno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row">팩스번호</td>
							<td scope="row">
								<sbux-input id="fxno" name="fxno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<td style="border-right: hidden;">&nbsp;</td>
							<td scope="row">사업번호</td>
							<td scope="row">
								<sbux-input id="apcBrno" name="apcBrno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td scope="row" colspan="2">계좌번호</td>
							<td colspan="3"scope="row">
								<sbux-input id="actno" name="actno" uitype="text" class="form-control input-sm"></sbux-input>

							</td>
							<td scope="row">입금은행</td>
							<td >
								<sbux-select id="comboBankNm" name="comboBankNm" uitype="single" jsondata-ref="jsonComboBankNm" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>

							<td scope="row">예금주명</td>
							<td scope="row">
								<sbux-input id="dpstr" name="dpstr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">APC구분</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2"class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="apcGubun1" name="apcGubun" uitype="normal" class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">농협</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="apcGubun2" name="apcGubun" uitype="normal" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">법인</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">정산기준(대표)</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun1" name="prdcrGubun" uitype="normal"  class="radio_label"></sbux-radio>
									<label class="radio_label" for="radio1">원물입고</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="prdcrGubun2" name="prdcrGubun" uitype="normal"  class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="radio1">선별</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">APC사용자 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2"class="td_input">
								<sbux-button id="userAuthMngBtn" name="userAuthMngBtn" uitype="modal" text="사용자권한 설정" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="userAuthMngModal" onclick="fn_modal('userAuthMngBtn')"></sbux-button>
							</td>
							<td>필수</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) APC관리자가 사용자별 권한정보를 설정
							</td>
						</tr>
						<tr>
							<th scope="row">운용설비 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="fcltMngBtn" name="fcltMngBtn" uitype="modal" text="설비 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="fcltMngModal" onclick="fn_modal('fcltMngBtn')"></sbux-button>
							</td>
							<td>필수</td>
							<td>&nbsp;</td>
							<td colspan="7">
								Ex) 선별1호기, 선별2호기... / 포장라인, 포장라인2...
							</td>
						</tr>
						<tr>
							<th scope="row">저장창고 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="warehouseMngBtn" name="warehouseMngBtn" uitype="modal" text="창고 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="warehouseMngModal" onclick="fn_modal('warehouseMngBtn')"></sbux-button>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td colspan="7">
								Ex) 원물창고1, 원물창고2... / 상품창고1, 상품창고2... / A창고, B창고...
							</td>
						</tr>
						<tr>
							<th scope="row">품목/품종 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="itemMngBtn" name="itemMngBtn" uitype="modal" text="품목/품종 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="itemMngModal" onclick="fn_modal('itemMngBtn')"></sbux-button>
							</td>
							<td>필수</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 품목등록, 품목에 종속된 품종 등록
							</td>
						</tr>
						<tr>
							<th scope="row">등급/규격 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="otrdEyeBtn" name="otrdEyeBtn" uitype="modal" text="등급/규격 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="otrdEyeMngModal" onclick="fn_modal('otrdEyeMngBtn')"></sbux-button>
							</td>
							<td>필수</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 품목에 종속된 선별등급, 규격 정보 등록
							</td>
						</tr>
						<tr>
							<th scope="row">원물 팔레트/박스</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="pltBxBtn" name="pltBxBtn" uitype="modal" text="팔레트/박스 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="pltBxMngModal" onclick="fn_modal('pltBxMngBtn')"></sbux-button>
							</td>
							<td>필수</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 원물입고 시 사용되는 팔레트와 박스정보 및 출하 포장단위 관리
							</td>
						</tr>
						<tr>
							<th scope="row">입고차량 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="vhclBtn" name="vhclBtn" uitype="modal" text="입고차량/운임 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="wrhsVhclMngModal" onclick="fn_modal('wrhsVhclMngBtn')"></sbux-button>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 원물입고 차량의 운반비 송금계좌정보 및 지역별 운임비용 관리
							</td>
						</tr>
						<tr>
							<th scope="row">출하운송사 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="spmtTrsprtBtn" name="spmtTrsprtBtn" uitype="modal" text="출하 운송회사 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="spmtTrsprtMngModal" onclick="fn_modal('spmtTrsprtBtn')"></sbux-button>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 출하실적 및 송품장 발행을 위한 운송회사정보 관리
							</td>
						</tr>
						<tr>
							<th scope="row">거래처 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="cnptMngBtn" name="cnptMngBtn" uitype="modal" text="거래처 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="cnptMngModal" onclick="fn_modal('cnptMngBtn')"></sbux-button>
							</td>
							<td>
								필수
							</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 거래처 정보 및 발주서 접속정보 관리(대형마트 발주서 정보는 선택사항)
							</td>
						</tr>
						<tr>
							<th scope="row">생산작업자 관리</th>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" colspan="2">
								<sbux-button id="oprtrMngBtn" name="oprtrMngBtn" uitype="modal" text="생산작업자 등록" style="width:100%;" class="btn btn-sm btn-outline-dark" target-id="oprtrMngModal" onclick="fn_modal('oprtrMngBtn')"></sbux-button>
							</td>
							<td>
							</td>
							<td>&nbsp;</td>
							<td colspan="7">
								설명) 선별 및 포장 작업자 관리
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="box-body">
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 18%">
						<col style="width: 18%">
						<col style="width: 18%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="6">APC 사용메뉴 선택<button type="button" class="btn btn-sm btn-outline-danger" style="float:right;">간편설정</button></th>
						</tr>
						<tr>
							<th scope="row">계량정보 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="wghMngYn" name="wghMngYn" uitype="normal"></sbux-checkbox>
									<label class="check_label" for="check_default" >사용</label>
								</p>
							</td>
							<td>
		                     	<p class="ad_input_row">
									<sbux-checkbox id="wghMblUseYn" name="wghMblUseYn" uitype="normal" ></sbux-checkbox>
				                    <label class="check_label" for="check_default">테블릿사용</label>
		                  	</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="wghIdntyDocPblcnYn" name="wghIdntyDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">계량확인서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th rowspan="2">원물입고 관리</th>
							<td rowspan="2">
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsMngYn" name="rawMtrWrhsMngYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default" >사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsMblUseYn" name="rawMtrWrhsMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrIdentTagPblcnYn" name="rawMtrIdentTagPblcnYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default">원물인식표 발행</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pltBxMngYn" name="pltBxMngYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default">팔레트/박스정보관리</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="rawMtrWrhsPlanMngYn" name="rawMtrWrhsPlanMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >원물입고계획관리</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="gdsWrhsMngYn" name="gdsWrhsMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">상품입고관리</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortCmndMngYn" name="sortCmndMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortCmndDocPblcnYn" name="sortCmndDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">선별지시서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>포장지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgCmndMngYn" name="pckgCmndMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgCmndDocPblcnYn" name="pckgCmndDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">포장지시서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선별 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortMngYn" name="sortMngYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortMblUseYn" name="sortMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿사용 (선별투입)</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortLabelPblcnYn" name="sortLabelPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">선별라벨 발행</label>
								</p>
							</td>
							<td><p class="ad_input_row">
									<sbux-checkbox id="sortIdntyDocPblcnYn" name="sortIdntyDocPblcnYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default">선별확인서 발행</label>
								</p>
							</td>
						</tr>
						<tr>
							<th>포장 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgMngYn" name="pckgMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="pckgMblUseYn" name="pckgMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿사용 (포장투입)</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="gdsLblPblcnYn" name="gdsLblPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">상품라벨 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하지시 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtCmndMngYn" name="spmtCmndMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtCmndDocPblcnYn" name="spmtCmndDocPblcnYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">출하지시서 발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>출하 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtMngYn" name="spmtMngYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtMblUseYn" name="spmtMblUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">테블릿 사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="spmtDocPblcnYn" name="spmtDocPblcnYn" uitype="normal" checked readonly></sbux-checkbox>
									<label class="check_label" for="check_default">송품장발행</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>정산 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="clclnMngYn" name="clclnMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>발주정보 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="ordrMngYn" name="ordrMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>농협전송 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="trsmMngYn" name="trsmMngYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="sortDataTrsmYn" name="sortDataTrsmYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">선별정보 전송</label>
								</p>
							</td>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="clclnDataTrsmYn" name="clclnDataTrsmYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">정산자료 전송</label>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>생산작업자 관리</th>
							<td>
								<p class="ad_input_row">
									<sbux-checkbox id="oprtrUseYn" name="oprtrUseYn" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default">사용</label>
								</p>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!-- 사용자권한 설정 Modal -->
    <div>
        <sbux-modal id="userAuthMngModal" name="userAuthMngModal" uitype="middle" header-title="APC사용자 권한설정" body-html-id="userAuthMngModalBody" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="userAuthMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/apcUserMngPopup.jsp"></jsp:include>
    </div>
    <!-- 설비 등록 Modal -->
    <div>
        <sbux-modal id="fcltMngModal" name="fcltMngModal" uitype="middle" header-title="설비 등록" body-html-id="fcltMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="fcltMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/fcltMngPopup.jsp"></jsp:include>
    </div>
    <!-- 창고 등록 Modal -->
    <div>
        <sbux-modal id="warehouseMngModal" name="warehouseMngModal" uitype="middle" header-title="창고 등록" body-html-id="warehouseMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="warehouseMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/warehouseMngPopup.jsp"></jsp:include>
    </div>
    <!--품목 등록 Modal -->
    <div>
        <sbux-modal id="itemMngModal" name="itemMngModal" uitype="middle" header-title="품목 등록" body-html-id="itemMngmodalBody" footer-is-close-button="false"style="width:1250px"></sbux-modal>
    </div>
    <div id="itemMngmodalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/itemMngPopup.jsp"></jsp:include>
    </div>
    <!-- 팔레트/박스 등록 Modal -->
    <div>
        <sbux-modal id="pltBxMngModal" name="pltBxMngModal" uitype="middle" header-title="팔레트/박스 등록" body-html-id="pltBxMngModalBody" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="pltBxMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/pltBxMngPopup.jsp"></jsp:include>
    </div>
    <!-- 원물육안등급 Modal -->
    <div>
        <sbux-modal id="otrdEyeMngModal" name="otrdEyeMngModal" uitype="middle" header-title="정산등급 등록" body-html-id="otrdEyeMngModalBody" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="otrdEyeMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/otrdEyeMngPopup.jsp"></jsp:include>
    </div>
    <!-- 입고차량정보 등록 Modal -->
    <div>
        <sbux-modal id="wrhsVhclMngModal" name="wrhsVhclMngModal" uitype="middle" header-title="입고차량정보 등록" body-html-id="wrhsVhclMngModalBody" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="wrhsVhclMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/wrhsVhclMngPopup.jsp"></jsp:include>
    </div>
    <!-- 출하운송회사 등록 Modal -->
    <div>
        <sbux-modal id="spmtTrsprtMngModal" name="spmtTrsprtMngModal" uitype="middle" header-title="출하운송회사 등록" body-html-id="spmtTrsprtMngModalBody" footer-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="spmtTrsprtMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/spmtTrsprtMngPopup.jsp"></jsp:include>
    </div>
    <!-- 입고차량정보 등록 Modal -->
    <div>
        <sbux-modal id="cnptMngModal" name="cnptMngModal" uitype="middle" header-title="거래처 등록" body-html-id="cnptMngModalBody" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="cnptMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/cnptMngPopup.jsp"></jsp:include>
    </div>
    <!-- 생산작업자 등록 Modal -->
    <div>
        <sbux-modal id="oprtrMngModal" name="oprtrMngModal" uitype="middle" header-title="거래처 등록" body-html-id="oprtrMngModalBody" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="oprtrMngModalBody">
    	<jsp:include page="/WEB-INF/view/apcss/am/apc/oprtrMngPopup.jsp"></jsp:include>
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
	gfn_setComCdSBSelect('comboBankNm', jsonComboBankNm ,	'BANK_CD', '0000');				// 검색 조건(시스템구분)
	gfn_setComCdGridSelect('userAuthMngDatagrid', comboUesYnJsData, "USE_YN", "0000");
	gfn_setComCdGridSelect('bxMngDatagrid', comboUnitCdJsData, "UNIT_CD", "0000");
	gfn_setComCdGridSelect('pckgMngDatagrid', comboReverseYnJsData, "REVERSE_YN", "0000");
	gfn_setComCdGridSelect('wrhsVhclMngDatagrid', comboGridBankCdJsData, "BANK_CD", "0000");
	gfn_setComCdGridSelect('cnptMngDatagrid', comboGridCnptTypeJsData, "CNPT_TYPE", "0000");
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("apcCd", '9999');
		selectApcInfo();
	})


	async function selectApcInfo(){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcInfo.do", {apcCd : apcCd});
        let data = await postJsonPromise;
		let resultVO = data.resultVO;
        try{

        	SBUxMethod.set("apcNm", resultVO.regApcNm);
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
		if(targetName == "userAuthMngBtn"){
			fn_userAuthMngCreateGrid();
		}
		if(targetName == 'fcltMngBtn'){
			fn_fcltMngCreateGrid();
		}
		if(targetName == 'warehouseMngBtn'){
			fn_warehouseMngCreateGrid();
		}
		if(targetName == 'itemMngBtn'){
			fn_itemCreateGrid();
            fn_apcItemCreateGrid();
            //fn_itemMngCreateGrid_1();
            //fn_itemMngCreateGrid_2();
            //fn_itemMngCreateGrid_3();
            //fn_itemMngCreateGrid_4();
		}
		if(targetName == 'pltBxMngBtn'){
			fn_pltMngCreateGrid();
			fn_bxMngCreateGrid();
			fn_pckgMngCreateGrid();
		}
		if(targetName == 'otrdEyeMngBtn'){
			fn_otrdEyeMngCreateGrid();
		}
		if(targetName == 'wrhsVhclMngBtn'){
			fn_wrhsVhclMngCreateGrid();
			fn_rgnTrsprtCstMngCreateGrid();
		}
		if(targetName == 'spmtTrsprtBtn'){
			fn_spmtTrsprtMngCreateGrid();
		}if(targetName == 'cnptMngBtn'){
			fn_cnptMngCreateGrid();
			fn_ordrMngCreateGrid();
		}if(targetName == 'oprtrMngBtn'){
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
        if (gubun === "ADD") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngDatagrid.setCellData(nRow, nCol, "N", true);
            	cnptMngDatagrid.addRow(true);
            }else if (grid === "fcltMngDatagrid") {
            	fcltMngDatagrid.setCellData(nRow, nCol, "N", true);
            	fcltMngDatagrid.setCellData(nRow, 5, SBUxMethod.get("apcCd"), true);
            	fcltMngDatagrid.setCellData(nRow, 6, "FCLT_CD", true);
            	fcltMngDatagrid.addRow(true);
            }else if (grid === "warehouseMngDatagrid") {
            	warehouseMngDatagrid.setCellData(nRow, nCol, "N", true);
            	warehouseMngDatagrid.setCellData(nRow, 5, SBUxMethod.get("apcCd"), true);
            	warehouseMngDatagrid.setCellData(nRow, 6, "WAREHOUSE_SE_CD", true);
            	warehouseMngDatagrid.addRow(true);
            }else if(grid === "pltMngDatagrid"){
            	pltMngDatagrid.setCellData(nRow, nCol, "N", true);
            	pltMngDatagrid.setCellData(nRow, 5, "Y", true);
            	pltMngDatagrid.setCellData(nRow, 7, "P", true);
            	pltMngDatagrid.setCellData(nRow, 8, SBUxMethod.get("apcCd"), true);
            	pltMngDatagrid.addRow(true);
            }else if(grid === "bxMngDatagrid"){
            	bxMngDatagrid.setCellData(nRow, nCol, "N", true);
            	bxMngDatagrid.setCellData(nRow, 5, "Y", true);
            	bxMngDatagrid.setCellData(nRow, 7, "B", true);
            	bxMngDatagrid.setCellData(nRow, 8, SBUxMethod.get("apcCd"), true);
            	bxMngDatagrid.addRow(true);
            }else if(grid === "pckgMngDatagrid"){
            	pckgMngDatagrid.setCellData(nRow, nCol, "Y", true);
            	pckgMngDatagrid.setCellData(nRow, 5, SBUxMethod.get("apcCd"), true);
            	pckgMngDatagrid.setCellData(nRow, 6, "PCKG_SE_CD", true);
            	pckgMngDatagrid.addRow(true);
            }else if(grid === "rgnTrsprtCstMngDatagrid"){
            	rgnTrsprtCstMngDatagrid.setCellData(nRow, nCol, "N", true);
            	rgnTrsprtCstMngDatagrid.setCellData(nRow, 5, SBUxMethod.get("apcCd"), true);
            	rgnTrsprtCstMngDatagrid.addRow(true);
            }else if(grid === "wrhsVhclMngDatagrid"){
            	wrhsVhclMngDatagrid.setCellData(nRow, nCol, "N", true);
            	wrhsVhclMngDatagrid.setCellData(nRow, 7, SBUxMethod.get("apcCd"), true);
            	wrhsVhclMngDatagrid.addRow(true);
            }else if(grid === "spmtTrsprtMngDatagrid"){
            	spmtTrsprtMngDatagrid.setCellData(nRow, nCol, "N", true);
            	spmtTrsprtMngDatagrid.addRow(true);
            }else if(grid === "oprtrMngDatagrid"){
            	oprtrMngDatagrid.setCellData(nRow, nCol, "N", true);
            	oprtrMngDatagrid.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngDatagrid.deleteRow(nRow);
            }else if (grid === "fcltMngDatagrid") {
            	if(fcltMngDatagrid.getRowStatus(nRow) == 0 || fcltMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = fcltMngDatagrid.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
		            	fcltMngDatagrid.deleteRow(nRow);
            		}
            	}else{
	            	fcltMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "warehouseMngDatagrid") {
            	if(warehouseMngDatagrid.getRowStatus(nRow) == 0 || warehouseMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = warehouseMngDatagrid.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			warehouseMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		warehouseMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "pltMngDatagrid") {
            	if(pltMngDatagrid.getRowStatus(nRow) == 0 || pltMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var pltBxVO = pltMngDatagrid.getRowData(nRow);
            			console.log(pltBxVO);
            			fn_deletepltBx(pltBxVO);
            			pltMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		pltMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "bxMngDatagrid") {
            	if(bxMngDatagrid.getRowStatus(nRow) == 0 || bxMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var pltBxVO = bxMngDatagrid.getRowData(nRow);
            			fn_deletepltBx(pltBxVO);
            			bxMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		bxMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "pckgMngDatagrid") {
            	if(pckgMngDatagrid.getRowStatus(nRow) == 0 || pckgMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = pckgMngDatagrid.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			pckgMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		pckgMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "rgnTrsprtCstMngDatagrid") {
            	rgnTrsprtCstMngDatagrid.deleteRow(nRow);
            }else if (grid === "wrhsVhclMngDatagrid") {
            	wrhsVhclMngDatagrid.deleteRow(nRow);
            }else if (grid === "spmtTrsprtMngDatagrid") {
            	spmtTrsprtMngDatagrid.deleteRow(nRow);
            }else if (grid === "oprtrMngDatagrid") {
            	oprtrMngDatagrid.deleteRow(nRow);
            }
        }
    }

    // 원물육안 등급
    var otrdEyeMngGridData = [
    	{"cd": "01", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "02", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "03", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "04", "otrdEyeNm" : "", "useYn":"Y"},
    	{"cd": "05", "otrdEyeNm" : "", "useYn":"Y"}
    ]; // 그리드의 참조 데이터 주소 선언
    function fn_otrdEyeMngCreateGrid() {
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'otrdEyeMngGridArea';
	    SBGridProperties.id = 'otrdEyeMngDatagrid';
	    SBGridProperties.jsonref = 'otrdEyeMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["코드"], 	ref: 'cd',  		type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["등급명"], 	ref: 'otrdEyeNm',  	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["단가"], 	ref: 'otrdEyeNm',  	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["사용유무"], ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
    					typeinfo : {ref:'combofilteringData', label:'label', value:'value', displayui : true}}
        ];
        window.otrdEyeMngDatagrid = _SBGrid.create(SBGridProperties);
    }


</script>
</html>