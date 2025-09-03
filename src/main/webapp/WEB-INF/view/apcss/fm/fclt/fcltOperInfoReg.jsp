<%
 /**
  * @Class Name : fcltOperInfoReg.jsp
  * @Description : 1.운영자개요 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호			최초 생성
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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
				</div>
				<div style="margin-left: auto;">
					<!--
					<sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력" class="btn btn-sm btn-primary" onclick=""></sbux-button>
					-->
					<sbux-button id="btnSearchPy" name="btnSearchPy" uitype="normal" text="전년도 데이터" class="btn btn-sm btn-outline-danger" onclick="fn_pySearch"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
					<sbux-button id="btnTmprStrg" name="btnTmprStrg" uitype="normal" text="임시저장" class="btn btn-sm btn-outline-danger" onclick="fn_tmprStrg"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
							<col style="width: 11%">
							<col style="width: 22%">
							<col style="width: 50px">
							<col style="width: 11%">
<%--							<col style="width: 187px">--%>
							<col style="width: 22%">
							<col style="width: 100px">
						<tbody>
							<tr>
								<th scope="row" style="border-bottom:1px solid white;" >APC명</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</td>
								<td>
									<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</td>
								<th scope="row">조사연도</th>
								<td class="td_input" style="border-right: hidden;">
									<%--<sbux-spinner
										id="srch-inp-crtrYr"
										name="srch-inp-crtrYr"
										uitype="normal"
										step-value="1"
										disabled
									></sbux-spinner>--%>
									<sbux-select
											id="srch-slt-crtrYr"
											name= "srch-slt-crtrYr"
											uitype="single"
											jsondata-ref="jsonCrtrYr"
											class="form-control input-sm"
									></sbux-select>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<!--
									<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_copyfn_copy" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
									-->
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<!-- 진척도 추가 -->
				<%@ include file="prgrs/apcPrgrs.jsp" %>
				<br>
				<div>
					<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
				</div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>APC 등록</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 20%">
						<col style="width: 30%">
					</colgroup>
					<tbody>
						<tr>
							<th style="border-right: 1px solid white !important; text-align: center;">구분</th>
							<th style="border-right: 1px solid white !important; text-align: center;">내용</th>
							<th style="border-right: 1px solid white !important; text-align: center;">구분</th>
							<th style="border-right: 1px solid white !important; text-align: center;">내용</th>
						</tr>
						<tr>
							<th>운영조직명</th>
							<td>
								<sbux-input id="dtl-inp-operOgnzNm" name="dtl-inp-operOgnzNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="2">
						</tr>
						<tr>
							<th>운영조직 사업자번호</th>
							<td>
								<sbux-input
									uitype="text"
									id="dtl-inp-operOgnzBrno"
									name="dtl-inp-operOgnzBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th>운영조직 법인번호</th>
							<td>
								<sbux-input
									uitype="text"
									id="dtl-inp-operOgnzCrno"
									name="dtl-inp-operOgnzCrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 대표자</th>
							<td>
								<sbux-input id="dtl-inp-rprsv" name="dtl-inp-rprsv" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
							</td>
							<td colspan="2"></td>
							<!--
							<th>운영조직 조직유형</th>
							<td>
								<sbux-select
									id="dtl-inp-ognzTypeCd"
									name="dtl-inp-ognzTypeCd"
									uitype="single"
									jsondata-ref="jsonComOgnzTypeCd"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							-->
						</tr>
						<!--
						<tr>
							<th rowspan="2">
								운영조직 주소<br>
								<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup(1)" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</th>
							<td colspan="3">
								<div class="col-sm-1" style="text-align: center; padding: 5px;">
									[지번주소]
								</div>
								<div class="col-sm-11">
									<sbux-input
										id="dtl-inp-operOgnzLotnoAddr"
										name="dtl-inp-operOgnzLotnoAddr"
										uitype="text"
										class="form-control input-sm"
										placeholder="주소 검색하여 작성"
										readonly
									></sbux-input>
								</div>
							</td>
						</tr>
						 -->
						<tr>
							<th>
								운영조직 주소<br>
								<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup(1)" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</th>
							<td colspan="3">
								<sbux-input uitype="hidden" id="dtl-inp-operOgnzAdmCd" name="dtl-inp-operOgnzAdmCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-ctpvCd" name="dtl-inp-ctpvCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-sigunCd" name="dtl-inp-sigunCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-operOgnzRoadNmCd" name="dtl-inp-operOgnzRoadNmCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-operOgnzBmno" name="dtl-inp-operOgnzBmno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-operOgnzSlno" name="dtl-inp-operOgnzSlno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-operOgnzRoadNmAddr" name="dtl-inp-operOgnzRoadNmAddr"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-operOgnzRoadNmAddrDtl" name="dtl-inp-operOgnzRoadNmAddrDtl"></sbux-input>
								<div class="col-sm-1" style="text-align: center; padding: 5px;">
									[도로명주소]
								</div>
								<div class="col-sm-1">
									<sbux-input
										id="dtl-inp-operOgnzZip"
										name="dtl-inp-operOgnzZip"
										uitype="text"
										class="form-control input-sm"
										placeholder="우편번호"
										readonly
									></sbux-input>
								</div>
								<div class="col-sm-10">
									<sbux-input
										id="dtl-inp-operOgnzRoadNmAddrFull"
										name="dtl-inp-operOgnzRoadNmAddrFull"
										uitype="text"
										class="form-control input-sm"
										placeholder="주소 검색하여 작성"
										readonly
									></sbux-input>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 명</th>
							<td>
								<sbux-input id="dtl-inp-apcNm" name="dtl-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th>APC 사업자번호</th>
							<td>
								<sbux-input
									uitype="text"
									id="dtl-inp-apcBrno"
									name="dtl-inp-apcBrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2"></td>
							<!--
							<th>APC 법인번호</th>
							<td>
								<sbux-input
									uitype="text"
									id="dtl-inp-apcCrno"
									name="dtl-inp-apcCrno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							-->
						</tr>
						<!--
						<tr>
							<th rowspan="2">
								APC 주소<br>
								<sbux-button id="dtl-btn-apcAddr" name="dtl-btn-apcAddr" uitype="modal" target-id="" onclick="fn_goPopup(2)" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</th>
							<td colspan="3">
								<div class="col-sm-1" style="text-align: center; padding: 5px;">
									[지번주소]
								</div>
								<div class="col-sm-11">
									<sbux-input
										id="dtl-inp-apcLotnoAddr"
										name="dtl-inp-apcLotnoAddr"
										uitype="text"
										class="form-control input-sm"
										placeholder="주소 검색하여 작성"
										readonly
									></sbux-input>
								</div>
							</td>
						</tr>
						-->
						<tr>
							<th>
								APC 주소<br>
								<sbux-button id="dtl-btn-apcAddr" name="dtl-btn-apcAddr" uitype="modal" target-id="" onclick="fn_goPopup(2)" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</th>
							<td colspan="3">
								<sbux-input uitype="hidden" id="dtl-inp-apcAdmCd" name="dtl-inp-apcAdmCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-apcRoadNmCd" name="dtl-inp-apcRoadNmCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-apcBmno" name="dtl-inp-apcBmno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-apcSlno" name="dtl-inp-apcSlno"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-apcRoadNmAddr" name="dtl-inp-apcRoadNmAddr"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-inp-apcRoadNmAddrDtl" name="dtl-inp-apcRoadNmAddrDtl"></sbux-input>
								<div class="col-sm-1" style="text-align: center; padding: 5px;">
									[도로명주소]
								</div>
								<div class="col-sm-1">
									<sbux-input
										id="dtl-inp-apcZip"
										name="dtl-inp-apcZip"
										uitype="text"
										class="form-control input-sm"
										placeholder="우편번호"
										readonly
									></sbux-input>
								</div>
								<div class="col-sm-10">
									<sbux-input
										id="dtl-inp-apcRoadNmAddrFull"
										name="dtl-inp-apcRoadNmAddrFull"
										uitype="text"
										class="form-control input-sm"
										placeholder="주소 검색하여 작성"
										readonly
									></sbux-input>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목1</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-operOgnzItemNm1" name="dtl-inp-operOgnzItemNm1" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-operOgnzItemCd1" name="dtl-inp-operOgnzItemCd1" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item1" name="dtl-btn-item1" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(1)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>

							<th>APC 처리 대표품목1</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-apcItemNm1" name="dtl-inp-apcItemNm1" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-apcItemCd1" name="dtl-inp-apcItemCd1" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item4" name="dtl-btn-item4" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(4)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-operOgnzItemNm2" name="dtl-inp-operOgnzItemNm2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-operOgnzItemCd2" name="dtl-inp-operOgnzItemCd2" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-item2" name="dtl-btn-item2" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(2)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-itemDel2" name="dtl-btn-itemDel2" uitype="normal" onclick="fn_itemDel(1,2)" text="품목삭제" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>

							<th>APC 처리 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-apcItemNm2" name="dtl-inp-apcItemNm2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-apcItemCd2" name="dtl-inp-apcItemCd2" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-item5" name="dtl-btn-item5" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(5)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-itemDel5" name="dtl-btn-itemDel5" uitype="normal" onclick="fn_itemDel(2,2)" text="품목삭제" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-operOgnzItemNm3" name="dtl-inp-operOgnzItemNm3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-operOgnzItemCd3" name="dtl-inp-operOgnzItemCd3" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-item3" name="dtl-btn-item3" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(3)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-itemDel3" name="dtl-btn-itemDel3" uitype="normal" onclick="fn_itemDel(1,3)" text="품목삭제" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>

							<th>APC 처리 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-apcItemNm3" name="dtl-inp-apcItemNm3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-apcItemCd3" name="dtl-inp-apcItemCd3" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-item6" name="dtl-btn-item6" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(6)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-itemDel6" name="dtl-btn-itemDel6" uitype="normal" onclick="fn_itemDel(2,3)" text="품목삭제" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 기타품목</th>
							<td>
								<div class="col-md-6">
									<sbux-input id="dtl-inp-operOgnzItemNm4" name="dtl-inp-operOgnzItemNm4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 수기입력" ></sbux-input>
								</div>
								<div class="col-md-4">
									<sbux-select
										id="dtl-inp-operOgnzEtcCtgryCd"
										name="dtl-inp-operOgnzEtcCtgryCd"
										uitype="single"
										jsondata-ref="jsonComEtcCtgryCd"
										unselected-text="부류선택"
										class="form-control input-sm"
									></sbux-select>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-itemDelEtc1" name="dtl-btn-itemDelEtc1" uitype="normal" onclick="fn_itemDel(1,4)" text="품목삭제" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
							<th>APC 처리 기타품목명</th>
							<td>
								<div class="col-md-6">
									<sbux-input id="dtl-inp-apcItemNm4" name="dtl-inp-apcItemNm4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은  수기입력" ></sbux-input>
								</div>
								<div class="col-md-4">
									<sbux-select
										id="dtl-inp-apcEtcCtgryCd"
										name="dtl-inp-apcEtcCtgryCd"
										uitype="single"
										jsondata-ref="jsonComApcEtcCtgryCd"
										unselected-text="부류선택"
										class="form-control input-sm"
									></sbux-select>
								</div>
								<div class="col-md-2">
									<sbux-button id="dtl-btn-itemDelEtc2" name="dtl-btn-itemDelEtc2" uitype="normal" onclick="fn_itemDel(2,4)" text="품목삭제" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="position: relative; height: 4vh!important">
								<sbux-button id="btnInsert1" name="btnInsert1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save" style="position: absolute; right: 0; bottom: 0; padding: 5px"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="APC 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
	<!-- 품목 선택 Modal -->
	<div>
		<sbux-modal id="modal-itemSelect" name="modal-itemSelect" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
	</div>
	<div id="body-modal-itemSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/ApcItemSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);//trgtYr -> crtrYr 변경

		/*
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		*/

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let crtrYr = '2024';
		let apcCd = '0861';
		let apcNm = 'test';
		//SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcCd", apcCd);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	//var jsonComOgnzTypeCd = [];//조직유형
	var jsonComEtcCtgryCd = [];//기타부류
	var jsonComApcEtcCtgryCd = [];//APC기타부류

	// 기준연도
	var jsonCrtrYr = [];

	// 전년도 데이터
	var jsonPrevData = [];

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			//gfn_setComCdSBSelect('dtl-inp-ognzTypeCd', 	jsonComOgnzTypeCd, 	'OGNZ_TYPE_CD'), 	//조직유형
			gfn_setComCdSBSelect('dtl-inp-operOgnzEtcCtgryCd', 		jsonComEtcCtgryCd, 	'ETC_CLS'), 	//운영조직 기타 부류
			gfn_setComCdSBSelect('dtl-inp-apcEtcCtgryCd', 	jsonComApcEtcCtgryCd, 	'ETC_CLS'), 	//APC 기타 부류
			gfn_getApcSurveyCrtrYr('srch-slt-crtrYr',jsonCrtrYr) // 연도
		]);

	}

	const fn_init = async function() {
		await fn_initSBSelect();

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		//apc가 있으면 자동 조회
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		if(gfn_isEmpty(apcCd)){
			return;
		}
		await fn_search();
		//진척도
		//await cfn_selectPrgrs();
	}

	/* 선택가능한 APC리스트 조회 */
	const fn_selectUserApcList = async function(){

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

		});

		let data = await postJsonPromise;
		try{
			let apcListLength = data.resultList.length;

			if(apcListLength == 1){
				SBUxMethod.set("srch-inp-apcCd", data.resultList[0].apcCd);
				SBUxMethod.set("srch-inp-apcNm", data.resultList[0].apcNm);
			}else if (apcListLength > 1){
				//APC선택 팝업 열기
				fn_modalApcSelect();
				SBUxMethod.openModal("modal-apcSelect");
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	const fn_search = async function() {
		let apcCd = SBUxMethod.get("srch-inp-apcCd");

		if(gfn_isEmpty(apcCd)){
			alert('APC를 선택해주세요');
			return;
		}
		await fn_clearForm();
		//진척도
		await cfn_selectPrgrs();
		await fn_selectFcltOperInfo();
		// 전년도
		await fn_selectFcltOperInfo(true);
	}

	const fn_selectFcltOperInfo = async function(isPrev = false){

		const apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr  =  SBUxMethod.get("srch-slt-crtrYr");

		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0001", "조사연도");
			return;
		}

		jsonPrevData.length = 0;
		// 전년도 데이터
		if (isPrev === true) {
			crtrYr = parseFloat(crtrYr) - 1;
		}

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr,
			//memberInfoYn : "Y"
		});

		let data = await postJsonPromise;
		try{
			if(data.resultList.length > 0){
				if (isPrev === true) {
						const resultVO = data.resultList[0];
						const userInfoVO = data.resultMap;

						const vo = {
							crtrYr : resultVO.crtrYr
							, apcCd : resultVO.apcCd
							, operOgnzNm : resultVO.operOgnzNm
							, operOgnzBrno : resultVO.operOgnzBrno
							, operOgnzCrno : resultVO.operOgnzCrno
							, rprsv : resultVO.rprsv
							, operOgnzRoadNmAddr : resultVO.loctn
							, operOgnzRoadNmAddrDtl : resultVO.loctnDtl
							, operOgnzRoadNmAddrFull : resultVO.loctn + (resultVO.loctnDtl || "")
							, operOgnzAdmCd : resultVO.operOgnzAdmCd
							, operOgnzZip : resultVO.operOgnzZip
							, apcNm : resultVO.apcNm
							, apcBrno : resultVO.apcBrno
							, apcZip : resultVO.apcZip
							, apcRoadNmAddr : resultVO.apcLoctn
							, apcRoadNmAddrDtl : resultVO.apcLoctnDtl
							, apcRoadNmAddrFull : resultVO.apcLoctn + (resultVO.apcLoctnDtl || "")
							// , operOgnzNm : userInfoVO.operOgnzNm
							// , operOgnzBrno : userInfoVO.operOgnzBrno
							// , operOgnzCrno : userInfoVO.operOgnzCrno
							// , rprsv : userInfoVO.rprsv
						};
						/*for (let i = 0; i < resultVO.itemList.length; i++) {
							const itemData = resultVO.itemList[i];
							const sn = itemData.sn;
							const ognzSeCd = itemData.ognzSeCd;

							if (ognzSeCd === '1') {
								vo[`operOgnzItemNm${'${sn}'}`] = itemData.itemNm;
								if (sn === '4') {
									vo["operOgnzEtcCtgryCd"] = itemData.etcCtgryCd;
								} else {
									vo[`operOgnzItemCd${'${sn}'}`] = itemData.itemCd;
								}
							} else if (ognzSeCd === '2') {
								vo[`apcItemNm${'${sn}'}`] = itemData.itemNm;
								if (sn === '4') {
									vo["apcEtcCtgryCd"] = itemData.etcCtgryCd;
								} else {
									vo[`apcItemCd${'${sn}'}`] = itemData.itemCd;
								}
							}
						}*/
						vo.itemList = resultVO.itemList
						jsonPrevData.push(vo);

				} else {
					let resultVO = data.resultList[0];

					SBUxMethod.set("dtl-inp-operOgnzNm", resultVO.operOgnzNm);//운영조직명
					SBUxMethod.set("dtl-inp-operOgnzBrno", resultVO.operOgnzBrno);//운영조직 사업자등록번호
					SBUxMethod.set("dtl-inp-operOgnzCrno", resultVO.operOgnzCrno);//운영조직 법인등록번호
					SBUxMethod.set("dtl-inp-rprsv", resultVO.rprsv);//대표자
					SBUxMethod.set("dtl-inp-operOgnzRoadNmAddr", resultVO.loctn);//소재지
					SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrDtl", resultVO.loctnDtl);//소재지
					let addrFull = resultVO.loctn;
					if (resultVO.loctnDtl) {
						addrFull += resultVO.loctnDtl;
					}
					SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrFull", addrFull);//운영조직 주소

					SBUxMethod.set("dtl-inp-operOgnzAdmCd", resultVO.operOgnzAdmCd);//운영조직 법정동코드(행정구역코드)
					SBUxMethod.set("dtl-inp-operOgnzRoadNmCd", resultVO.operOgnzRoadNmCd);//운영조직 도로명코드
					SBUxMethod.set("dtl-inp-operOgnzZip", resultVO.operOgnzZip);//운영조직 우편번호
					SBUxMethod.set("dtl-inp-operOgnzBmno", resultVO.operOgnzBmno);//운영조직 건물 본번
					SBUxMethod.set("dtl-inp-operOgnzSlno", resultVO.operOgnzSlno);//운영조직 건물 부번


					SBUxMethod.set("dtl-inp-ctpvCd", resultVO.ctpvCd);//시도 코드
					SBUxMethod.set("dtl-inp-sigunCd", resultVO.sigunCd);//시군구 코드
					//SBUxMethod.set("dtl-inp-ognzTypeCd", resultVO.ognzTypeCd);//조직유형 코드

					SBUxMethod.set("dtl-inp-apcNm", SBUxMethod.get("srch-inp-apcNm"));//apc명
					SBUxMethod.set("dtl-inp-apcBrno", resultVO.apcBrno);//apc 사업자등록번호
					//SBUxMethod.set("dtl-inp-apcCrno", resultVO.apcCrno);//apc 법인등록번호
					//SBUxMethod.set("dtl-inp-apcAddr", resultVO.apcLoctn);//apc 주소

					SBUxMethod.set("dtl-inp-apcRoadNmAddr", resultVO.apcLoctn);//apc 주소
					SBUxMethod.set("dtl-inp-apcRoadNmAddrDtl", resultVO.apcLoctnDtl);//apc 주소

					let apcAddrFull = resultVO.apcLoctn;
					if (resultVO.apcLoctnDtl) {
						apcAddrFull += resultVO.loctnDtl;
					}
					SBUxMethod.set("dtl-inp-apcRoadNmAddrFull", apcAddrFull);//apc 주소

					SBUxMethod.set("dtl-inp-apcAdmCd", resultVO.apcAdmCd);//apc 법정동코드(행정구역코드)
					SBUxMethod.set("dtl-inp-apcRoadNmCd", resultVO.apcRoadNmCd);//apc 도로명코드
					SBUxMethod.set("dtl-inp-apcZip", resultVO.apcZip);//apc 우편번호
					SBUxMethod.set("dtl-inp-apcBmno", resultVO.apcBmno);//apc 건물 본번
					SBUxMethod.set("dtl-inp-apcSlno", resultVO.apcSlno);//apc 건물 부번


					for (var i = 0; i < resultVO.itemList.length; i++) {
						let itemData = resultVO.itemList[i];
						let sn = itemData.sn;
						let ognzSeCd = itemData.ognzSeCd;
						if(ognzSeCd == '1'){
							SBUxMethod.set("dtl-inp-operOgnzItemNm"+sn, itemData.itemNm);
							if(sn == '4'){
								SBUxMethod.set("dtl-inp-operOgnzEtcCtgryCd", itemData.etcCtgryCd);
							}else{
								SBUxMethod.set("dtl-inp-operOgnzItemCd"+sn, itemData.itemCd);
							}
						}else if(ognzSeCd == '2'){
							SBUxMethod.set("dtl-inp-apcItemNm"+sn, itemData.itemNm);
							if(sn == '4'){
								SBUxMethod.set("dtl-inp-apcEtcCtgryCd", itemData.etcCtgryCd);
							}else{
								SBUxMethod.set("dtl-inp-apcItemCd"+sn, itemData.itemCd);
							}
						}
					}
				}
			} else {
				let resultVO = data.resultMap;
				SBUxMethod.set("dtl-inp-operOgnzNm", resultVO.operOgnzNm);//운영조직명
				SBUxMethod.set("dtl-inp-operOgnzBrno", resultVO.operOgnzBrno);//운영조직 사업자등록번호
				SBUxMethod.set("dtl-inp-operOgnzCrno", resultVO.operOgnzCrno);//운영조직 법인등록번호
				SBUxMethod.set("dtl-inp-rprsv", resultVO.rprsv);//대표자

				SBUxMethod.set("dtl-inp-apcNm", SBUxMethod.get("srch-inp-apcNm"));//apc명
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//입력폼 초기화
	const fn_clearForm = function() {
		SBUxMethod.set("dtl-inp-operOgnzNm",null);  // 운영조직 명
		SBUxMethod.set("dtl-inp-operOgnzBrno",null);  //운영조직 사업자등록번호
		SBUxMethod.set("dtl-inp-operOgnzCrno",null);  //운영조직 법인등록번호
		SBUxMethod.set("dtl-inp-rprsv",null);  // 대표자
		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddr",null);  // 소재지
		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrDtl",null);  // 소재지 상세
		SBUxMethod.set("dtl-inp-operOgnzAdmCd",null);  //운영조직 법정동코드(행정구역코드)
		SBUxMethod.set("dtl-inp-operOgnzRoadNmCd",null);  //운영조직 도로명코드
		SBUxMethod.set("dtl-inp-operOgnzZip",null);  //apc 우편번호
		SBUxMethod.set("dtl-inp-operOgnzBmno",null);  //apc 건물 본번
		SBUxMethod.set("dtl-inp-operOgnzSlno",null);  //apc 건물 부번
		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrFull",null);  //apc 주소 상세

		SBUxMethod.set("dtl-inp-ctpvCd",null);  //시도 코드 (법정동코드 앞2자리)
		SBUxMethod.set("dtl-inp-sigunCd",null);  //시군구 코드 (법정동 코드 앞5자리)

		SBUxMethod.getText("dtl-inp-ognzType",null);  //조직유형 명
		//SBUxMethod.getValue("dtl-inp-ognzTypeCd",null);  //조직유형 코드

		//SBUxMethod.set("dtl-inp-apcNm",null);  //apc명
		SBUxMethod.set("dtl-inp-apcBrno",null);  //apc 사업자등록번호
		//SBUxMethod.set("dtl-inp-apcCrno",null);  //apc 법인등록번호
		//SBUxMethod.set("dtl-inp-apcAddr",null);  //apc 주소

		SBUxMethod.set("dtl-inp-apcRoadNmAddr",null);  //apc 주소 상세
		SBUxMethod.set("dtl-inp-apcRoadNmAddrDtl",null);  //apc 주소 상세
		SBUxMethod.set("dtl-inp-apcAdmCd",null);  //apc 법정동코드(행정구역코드)
		SBUxMethod.set("dtl-inp-apcRoadNmCd",null);  //apc 도로명코드
		SBUxMethod.set("dtl-inp-apcZip",null);  //apc 우편번호
		SBUxMethod.set("dtl-inp-apcBmno",null);  //apc 건물 본번
		SBUxMethod.set("dtl-inp-apcSlno",null);  //apc 건물 부번
		SBUxMethod.set("dtl-inp-apcRoadNmAddrFull",null);  //apc 주소 상세

		SBUxMethod.set("dtl-inp-operOgnzEtcCtgryCd",null);  //운영조직 기타 품목 부류
		SBUxMethod.set("dtl-inp-apcEtcCtgryCd",null);  //apc 기타 품목 부류

		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrFull", null);//운영조직 주소
		SBUxMethod.set("dtl-inp-apcRoadNmAddrFull", null);//apc 주소

		for (var i = 1; i < 5; i++) {
			SBUxMethod.set("dtl-inp-operOgnzItemNm"+i, null);
			SBUxMethod.set("dtl-inp-operOgnzItemCd"+i, null);
			SBUxMethod.set("dtl-inp-apcItemNm"+i, null);
			SBUxMethod.set("dtl-inp-apcItemCd"+i, null);
		}

		// 메세지 초기화
		const msgDivs = document.getElementsByClassName('div-msg');
		for (let i = 0; i < msgDivs.length; i++) {
			msgDivs[i].style.visibility = 'hidden';
			msgDivs[i].style.fontSize = '0rem';
		}

	}

	//작년 데이터 복사
	const fn_copy = async function(){
		const crtrYr = SBUxMethod.get('srch-slt-crtrYr');
		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0001","조사연도"); // W0001 {0}을/를 선택하세요.
		}
		const prevYr = Number(crtrYr) - 1;

		let apcCd = SBUxMethod.get("srch-inp-apcCd");

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
			apcCd : apcCd
			,crtrYr : prevYr
		});

		let data = await postJsonPromise;
		try{
			if(data.resultList.length > 0){
				let resultVO = data.resultList[0];

				SBUxMethod.set("dtl-inp-operOgnzNm", resultVO.operOgnzNm);//운영조직명
				SBUxMethod.set("dtl-inp-operOgnzBrno", resultVO.operOgnzBrno);//운영조직 사업자등록번호
				SBUxMethod.set("dtl-inp-operOgnzCrno", resultVO.operOgnzCrno);//운영조직 법인등록번호
				SBUxMethod.set("dtl-inp-rprsv", resultVO.rprsv);//대표자
				SBUxMethod.set("dtl-inp-operOgnzRoadNmAddr", resultVO.loctn);//소재지
				SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrDtl", resultVO.loctnDtl);//소재지
				SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrFull", resultVO.loctn + resultVO.loctnDtl);//운영조직 주소

				SBUxMethod.set("dtl-inp-operOgnzAdmCd", resultVO.operOgnzAdmCd);//운영조직 법정동코드(행정구역코드)
				SBUxMethod.set("dtl-inp-operOgnzRoadNmCd", resultVO.operOgnzRoadNmCd);//운영조직 도로명코드
				SBUxMethod.set("dtl-inp-operOgnzZip", resultVO.operOgnzZip);//운영조직 우편번호
				SBUxMethod.set("dtl-inp-operOgnzBmno", resultVO.operOgnzBmno);//운영조직 건물 본번
				SBUxMethod.set("dtl-inp-operOgnzSlno", resultVO.operOgnzSlno);//운영조직 건물 부번


				SBUxMethod.set("dtl-inp-ctpvCd", resultVO.ctpvCd);//시도 코드
				SBUxMethod.set("dtl-inp-sigunCd", resultVO.sigunCd);//시군구 코드
				//SBUxMethod.set("dtl-inp-ognzTypeCd", resultVO.ognzTypeCd);//조직유형 코드

				SBUxMethod.set("dtl-inp-apcNm", SBUxMethod.get("srch-inp-apcNm"));//apc명
				SBUxMethod.set("dtl-inp-apcBrno", resultVO.apcBrno);//apc 사업자등록번호
				//SBUxMethod.set("dtl-inp-apcCrno", resultVO.apcCrno);//apc 법인등록번호
				//SBUxMethod.set("dtl-inp-apcAddr", resultVO.apcLoctn);//apc 주소

				SBUxMethod.set("dtl-inp-apcRoadNmAddr", resultVO.apcLoctn);//apc 주소
				SBUxMethod.set("dtl-inp-apcRoadNmAddrDtl", resultVO.apcLoctnDtl);//apc 주소
				SBUxMethod.set("dtl-inp-apcRoadNmAddrFull", resultVO.apcLoctn + resultVO.apcLoctnDtl);//apc 주소

				SBUxMethod.set("dtl-inp-apcAdmCd", resultVO.apcAdmCd);//apc 법정동코드(행정구역코드)
				SBUxMethod.set("dtl-inp-apcRoadNmCd", resultVO.apcRoadNmCd);//apc 도로명코드
				SBUxMethod.set("dtl-inp-apcZip", resultVO.apcZip);//apc 우편번호
				SBUxMethod.set("dtl-inp-apcBmno", resultVO.apcBmno);//apc 건물 본번
				SBUxMethod.set("dtl-inp-apcSlno", resultVO.apcSlno);//apc 건물 부번

				for (var i = 0; i < resultVO.itemList.length; i++) {
					let itemData = resultVO.itemList[i];
					let sn = itemData.sn;
					let ognzSeCd = itemData.ognzSeCd;
					if(!gfn_isEmpty(itemData.itemCd)){
						if(ognzSeCd == '1'){
							SBUxMethod.set("dtl-inp-operOgnzItemNm"+sn, itemData.itemNm);
							if(sn == '4'){
								SBUxMethod.set("dtl-inp-operOgnzEtcCtgryCd", itemData.etcCtgryCd);
							}else{
								SBUxMethod.set("dtl-inp-operOgnzItemCd"+sn, itemData.itemCd);
							}
						}else if(ognzSeCd == '2'){
							SBUxMethod.set("dtl-inp-apcItemNm"+sn, itemData.itemNm);
							if(sn == '4'){
								SBUxMethod.set("dtl-inp-apcEtcCtgryCd", itemData.etcCtgryCd);
							}else{
								SBUxMethod.set("dtl-inp-apcItemCd"+sn, itemData.itemCd);
							}
						}
					}
				}
			}else{
				let resultVO = data.resultMap;
				SBUxMethod.set("dtl-inp-operOgnzNm", resultVO.operOgnzNm);//운영조직명
				SBUxMethod.set("dtl-inp-operOgnzBrno", resultVO.operOgnzBrno);//운영조직 사업자등록번호
				SBUxMethod.set("dtl-inp-operOgnzCrno", resultVO.operOgnzCrno);//운영조직 법인등록번호
				SBUxMethod.set("dtl-inp-rprsv", resultVO.rprsv);//대표자

				SBUxMethod.set("dtl-inp-apcNm", SBUxMethod.get("srch-inp-apcNm"));//apc명
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	/**
	 * @name fn_save
	 * @description 운영자 개요 저장
	 * @function
	 */
	const fn_save = async function() {

		const apcCd = SBUxMethod.get("srch-inp-apcCd");
		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			gfn_comAlert("W0001", "APC");	//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0002", "조사연도");	//	W0002	{0}을/를 입력하세요.
			return;
		}

		const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);

		if (!canInsert) {
			return;
		}


		//운영조직 주소 , apc주소 , apc 사업자번호 ,
		let addr = SBUxMethod.get("dtl-inp-operOgnzRoadNmAddrFull");
		if (gfn_isEmpty(addr)) {
			gfn_comAlert("W0002", "운영조직 주소");	//	W0002	{0}을/를 입력하세요.
			return;
		}

		//apc 사업자번호
		let apcBrno = SBUxMethod.get("dtl-inp-apcBrno");

		if (gfn_isEmpty(apcBrno)) {
			gfn_comAlert("W0002", "APC 사업자번호");	//	W0002	{0}을/를 입력하세요.
			return;
		}
		if (apcBrno.length != 10) {
			alert("APC 사업자번호는 총 10자리입니다. 사업자번호를 올바르게 작성하였는지 확인해주세요.");
			return;
		}

		//APC주소
		let apcAddr = SBUxMethod.get("dtl-inp-apcRoadNmAddrFull");
		if (gfn_isEmpty(apcAddr)) {
			gfn_comAlert("W0002", "APC주소");	//	W0002	{0}을/를 입력하세요.
			return;
		}


		let itemCd1 = SBUxMethod.get("dtl-inp-operOgnzItemCd1");
		let apcItemCd1 = SBUxMethod.get("dtl-inp-apcItemCd1");
		if (gfn_isEmpty(itemCd1)) {
			alert("'운영조직 취급 대표품목1'은 필수로 작성해주셔야 합니다.");
			return;
		}
		if (gfn_isEmpty(apcItemCd1)) {
			alert("'APC 처리 대표품목1'은 필수로 작성해주셔야 합니다.");
			return;
		}

		//기타품목 값이 있을떄 부류 선택 필수
		let itemNm4 = SBUxMethod.get("dtl-inp-operOgnzItemNm4");
		let apcItemNm4 = SBUxMethod.get("dtl-inp-apcItemNm4");

		let operOgnzEtcCtgryCd = SBUxMethod.get("dtl-inp-operOgnzEtcCtgryCd");
		let apcEtcCtgryCd = SBUxMethod.get("dtl-inp-apcEtcCtgryCd");

		if (!gfn_isEmpty(itemNm4)) {
			if(gfn_isEmpty(operOgnzEtcCtgryCd)){
				alert("운영조직 기타품목의 부류를 선택해주세요");
				//gfn_comAlert("W0001","운영조직 기타품목 부류"); // W0001  {0}을/를 선택하세요.
				return;
			}
		}
		if (!gfn_isEmpty(apcItemNm4)) {
			if(gfn_isEmpty(apcEtcCtgryCd)){
				alert("APC 기타품목의 부류를 선택해주세요");
				return;
			}
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		await fn_subInsert('N');
	}

	/**
	 * @name fn_tmprStrg
	 * @description 운영자 개요 임시 저장
	 * @function
	 */
	const fn_tmprStrg = async function(tmpChk) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			gfn_comAlert("W0001", "APC");	//	W0001	{0}을/를 선택하세요.
			return;
		}

		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0002", "조사연도");	//	W0002	{0}을/를 입력하세요.
			return;
		}

		const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);
		if (!canInsert) {
			return;
		}

		if (!gfn_comConfirm("Q0001", "임시저장")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		await fn_subInsert('Y');

	}

	/**
	 * @name fn_subInsert
	 * @description 운영자 개요 저장
	 * @function
	 */
	const fn_subInsert = async function (tmpChk){

		//등록년도는 항상 올해
		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		const apcCd = SBUxMethod.get("srch-inp-apcCd");

		//품목 리스트
		const itemArr = [];

		//운영조직 품목
		for ( let i = 1; i < 5; i++ ) {
			let itemNm = SBUxMethod.get("dtl-inp-operOgnzItemNm"+i);
			let itemCd = SBUxMethod.get("dtl-inp-operOgnzItemCd"+i);
			let ognzSeCd = '1';
			let etcCtgryCd;
			if (i === 4){
				etcCtgryCd = SBUxMethod.get("dtl-inp-operOgnzEtcCtgryCd");
			}

			if (!gfn_isEmpty(itemNm)) {

				let isDuplicate = false;

				for (let j = 0; j < itemArr.length; j++) {
					if (itemArr[j].itemCd == itemCd && itemArr[j].ognzSeCd == ognzSeCd) {
						isDuplicate = true;
						break;
					}
				}

				if (isDuplicate) {
					// gfn_comAlert("W0010", "등록", "운영조직 품목"); //  W0010	이미 {0}된 {1} 입니다.
					gfn_comAlert("W0009", "중복 등록된 운영조직 품목");	// W0009 {0}이/가 있습니다.
					return;
				} else {
					itemArr.push({
						itemNm : itemNm,
						itemCd : itemCd,
						ognzSeCd : ognzSeCd,
						etcCtgryCd : etcCtgryCd,
						sn : i
					});
				}
			}
		}

		//APC 품목
		for ( let i = 1; i < 5; i++ ) {
			let itemNm = SBUxMethod.get("dtl-inp-apcItemNm"+i);
			let itemCd = SBUxMethod.get("dtl-inp-apcItemCd"+i);
			let ognzSeCd = '2';
			let etcCtgryCd;
			if (i === 4){
				etcCtgryCd = SBUxMethod.get("dtl-inp-apcEtcCtgryCd");
			}

			if (!gfn_isEmpty(itemNm)) {

				let isDuplicate = false;

				for ( let j = 0; j < itemArr.length; j++ ) {
					if (itemArr[j].itemCd == itemCd && itemArr[j].ognzSeCd == ognzSeCd) {
						isDuplicate = true;
						break;
					}
				}

				if (isDuplicate) {
					// gfn_comAlert("W0010", "등록", "APC 품목"); //  W0010	이미 {0}된 {1} 입니다.
					gfn_comAlert("W0009","중복 등록된 APC 품목"); // W0009 {0}이/가 있습니다.
					return;
				} else {
					itemArr.push({
						itemNm : itemNm,
						itemCd : itemCd,
						ognzSeCd : ognzSeCd,
						etcCtgryCd : etcCtgryCd,
						sn : i
					});
				}
			}
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertOperOgnz.do", {
			crtrYr: crtrYr  // 등록년도
			, prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn: tmpChk//임시저장 체크
			, apcCd: apcCd // APC코드
			, operOgnzNm: gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzNm"))  // 운영조직 명
			, operOgnzBrno: gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzBrno"))  //운영조직 사업자등록번호
			, operOgnzCrno: gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzCrno"))  //운영조직 법인등록번호
			, rprsv: gfn_nvl(SBUxMethod.get("dtl-inp-rprsv"))  // 대표자

			, loctn: gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzRoadNmAddr"))  // 소재지
			, loctnDtl: gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzRoadNmAddrDtl"))  // 소재지 상세

			, operOgnzAdmCd : gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzAdmCd")) //운영조직 법정동코드(행정구역코드)
			, operOgnzRoadNmCd : gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzRoadNmCd")) //운영조직 도로명코드
			, operOgnzZip : gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzZip")) //apc 우편번호
			, operOgnzBmno : gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzBmno")) //apc 건물 본번
			, operOgnzSlno : gfn_nvl(SBUxMethod.get("dtl-inp-operOgnzSlno")) //apc 건물 부번

			, ctpvCd: gfn_nvl(SBUxMethod.get("dtl-inp-ctpvCd")) //시도 코드 (법정동코드 앞2자리)
			, sigunCd: gfn_nvl(SBUxMethod.get("dtl-inp-sigunCd")) //시군구 코드 (법정동 코드 앞5자리)

			, ognzType: gfn_nvl(SBUxMethod.getText("dtl-inp-ognzType")) //조직유형 명
			//, ognzTypeCd: gfn_nvl(SBUxMethod.getValue("dtl-inp-ognzTypeCd")) //조직유형 코드

			, apcNm: gfn_nvl(SBUxMethod.get("dtl-inp-apcNm"))  //apc명
			, apcBrno: gfn_nvl(SBUxMethod.get("dtl-inp-apcBrno"))  //apc 사업자등록번호
			//, apcCrno: gfn_nvl(SBUxMethod.get("dtl-inp-apcCrno"))  //apc 법인등록번호

			, apcLoctn: gfn_nvl(SBUxMethod.get("dtl-inp-apcRoadNmAddr"))  //apc 주소
			, apcLoctnDtl: gfn_nvl(SBUxMethod.get("dtl-inp-apcRoadNmAddrDtl"))  //apc 주소 상세

			, apcAdmCd : gfn_nvl(SBUxMethod.get("dtl-inp-apcAdmCd")) //apc 법정동코드(행정구역코드)
			, apcRoadNmCd : gfn_nvl(SBUxMethod.get("dtl-inp-apcRoadNmCd")) //apc 도로명코드
			, apcZip : gfn_nvl(SBUxMethod.get("dtl-inp-apcZip")) //apc 우편번호
			, apcBmno : gfn_nvl(SBUxMethod.get("dtl-inp-apcBmno")) //apc 건물 본번
			, apcSlno : gfn_nvl(SBUxMethod.get("dtl-inp-apcSlno")) //apc 건물 부번

			, itemList : itemArr //품목 리스트
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				await cfn_allTabPrgrsRefrash();
				await selectFcltOperInfo();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		//진척도 재조회
		//cfn_selectPrgrs();
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = async function(apc) {
		await fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
			SBUxMethod.set('dtl-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}

	// 품목 선택 팝업 호출
	const fn_modalItemSelect = function(sn) {
		popItemSelect.init(sn,fn_setItem);
	}
	// 품목 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		if (!gfn_isEmpty(itemVal)) {
			switch (itemVal.sn) {
				case 1: case 2: case 3:
					let operItemCdList = [];
					for (let i = 1; i < 4; i++) {
						let operOgnzItemCd = SBUxMethod.get("dtl-inp-operOgnzItemCd" + i);
						operItemCdList.push(operOgnzItemCd);
					}

					// 중복 체크
					let isOperDuplicate = false;
					for (let i = 0; i < operItemCdList.length; i++) {
						if (_.isEqual(operItemCdList[i], itemVal.itemCd)) {
							gfn_comAlert("W0009", "이미 등록된 운영조직 품목"); // W0009 {0}이/가 있습니다.
							isOperDuplicate = true;
							break;
						}
					}

					// 중복이 없을 때만 set
					if (!isOperDuplicate) {
						SBUxMethod.set('dtl-inp-operOgnzItemCd' + itemVal.sn, itemVal.itemCd);
						SBUxMethod.set('dtl-inp-operOgnzItemNm' + itemVal.sn, itemVal.itemNm);
						fn_checkItemDuplicate();
					}
					break;

				case 4: case 5: case 6:
					let apcItemCdList = [];
					for (let i = 1; i < 4; i++) {
						let apcItemCd = SBUxMethod.get("dtl-inp-apcItemCd" + i);
						apcItemCdList.push(apcItemCd);
					}

					// 중복 여부 체크
					let isApcDuplicate = false;
					for (let i = 0; i < apcItemCdList.length; i++) {
						if (_.isEqual(apcItemCdList[i], itemVal.itemCd)) {
							gfn_comAlert("W0009", "이미 등록된 APC 품목"); // W0009 {0}이/가 있습니다.
							isApcDuplicate = true;
							break;
						}
					}

					// 중복이 때만 set
					if (!isApcDuplicate) {
						let sn = Number(itemVal.sn) - 3;
						SBUxMethod.set('dtl-inp-apcItemCd' + sn, itemVal.itemCd);
						SBUxMethod.set('dtl-inp-apcItemNm' + sn, itemVal.itemNm);
						fn_checkItemDuplicate();
					}
					break;

				default:
					break;
			}
		}
	}

	const fn_itemDel = async function(ognzSeCd,sn) {
		let itemNm;
		if(ognzSeCd == '1'){
			itemNm = SBUxMethod.get('dtl-inp-operOgnzItemNm'+sn);
		}else if(ognzSeCd == '2'){
			itemNm = SBUxMethod.get('dtl-inp-apcItemNm'+sn);
		}

		if(gfn_isEmpty(itemNm)) return;

		if(!confirm("품목을 삭제 하시겠습니까?")) return;

		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		let apcCd = SBUxMethod.get("srch-inp-apcCd");

		let postJsonPromise = gfn_postJSON("/fm/fclt/deleteItem.do", {
			crtrYr: crtrYr
			, apcCd : apcCd
			, sn : sn
			, ognzSeCd : ognzSeCd
		});
		let data = await postJsonPromise;
		try{

			if (_.isEqual("S", data.resultStatus)) {
				fn_search();//상세조회
				alert("삭제 되었습니다.");
			}else{
				alert("삭제 도중 오류가 발생 되었습니다.");
			}
			// 중복메세지
			fn_checkItemDuplicate();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//운영조직 , apc 주소 구분
	let jusoChk;

	/* 주소 팝업 */
	//팝업 실행
	var fn_goPopup = function(chk){

		jusoChk = chk;

		w = 520;
		h = 620;
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;

		settings = "height=" + h
				   + ",width=" + w
				   + ",top=" + TopPosition
				   + ",left=" + LeftPosition
				   + ",scrollbars=yes, resizable=yes";
		window.open( "/fm/popup/jusoPopup.do", "zipCodeSearchWin", settings );

	}
	/* 주소 팝업 */
	//팝업 콜백
	//var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
	var jusoCallBack = function(roadFullAddr, addrPart1, addrDetail, addrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo, hemdNm){

		/*
		console.log("roadFullAddr= "+roadFullAddr+
				"addrPart1= "+addrPart1+
				"addrDetail= "+addrDetail+
				"addrPart2= "+addrPart2+
				"engAddr= "+engAddr+
				"jibunAddr= "+jibunAddr+
				"zipNo= "+zipNo+
				"admCd= "+admCd+
				"rnMgtSn= "+rnMgtSn+
				"bdMgtSn= "+bdMgtSn+
				"detBdNmList= "+detBdNmList+
				"bdNm= "+bdNm+
				"bdKdcd= "+bdKdcd+
				"siNm= "+siNm+
				"sggNm= "+sggNm+
				"emdNm= "+emdNm+
				"liNm= "+liNm+
				"rn= "+rn+
				"udrtYn= "+udrtYn+
				"buldMnnm= "+buldMnnm+
				"buldSlno= "+buldSlno+
				"mtYn= "+mtYn+
				"lnbrMnnm= "+lnbrMnnm+
				"lnbrSlno= "+lnbrSlno+
				"emdNo= "+emdNo+
				"hemdNm= "+hemdNm);
		*/

		/*
			roadFullAddr= 서울특별시 강남구 봉은사로71길 50, @@ (삼성동)	// 전체 도로면 주소
			addrPart1= 서울특별시 강남구 봉은사로71길 50	//도로명주소(참고항목 제외)
			addrDetail= @@	// 도로명주소 참고항목
			addrPart2= (삼성동)	// 지번정보
			engAddr= 50 Bongeunsa-ro 71-gil, Gangnam-gu, Seoul	// 도로명주소(영문)
			jibunAddr= 서울특별시 강남구 삼성동 25	// 지번 정보
			zipNo= 06094				// 우편번호
			admCd= 11 680 105 00		// 행정구역코드 (법정동코드) (시도 2자리 + 시군구 3자리 + 읍면동 3자리 + 리 2자리  총 10자리)
			rnMgtSn= 11680 4 166375	// 도로명코드 (시군구코드 5자리 + 도로명번호 7자리)(도로명번호 위계 1자리 + 도로명 6자리)(위계 고속도로 1, 대로 2, 로 3, 길 4(5))
			bdMgtSn= 1168010500 1 0025 0000 015308	// 건물관리번호
			detBdNmList= 	//상세건물명
			bdNm= 			//건물명
			bdKdcd= 0		//공동주택여부(1:공동주택 , 0:비공동주택)
			siNm= 서울특별시	//시명
			sggNm= 강남구		//시군구명
			emdNm= 삼성동		//읍면동명
			liNm= 			//법정리명
			rn= 봉은사로71길	//도로명
			udrtYn= 0		//지하여부 0:지상 1:지하
			buldMnnm= 50	//건물본번
			buldSlno= 0		//건물부번
			mtYn= 0			//산여부
			lnbrMnnm= 25		//지번본번(번지)
			lnbrSlno= 0		//지번부번(호)(부번이 없는경우 0)
			emdNo= 01		//읍면동일련번호
			hemdNm= 서울특별시 강남구 삼성2동	//관할주민센터
		*/


		//console.log(roadFullAddr+" , "+roadAddrPart1+" , "+addrDetail+" , "+roadAddrPart2+" , "+engAddr+" , "+jibunAddr+" , "+zipNo);
		//alert("성공");

		//1 운영조직 2 apc
		if(addrDetail.length>30){
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		if(jusoChk == '1'){
			SBUxMethod.set("dtl-inp-operOgnzZip", zipNo);//우편번호
			//SBUxMethod.set("dtl-inp-operOgnzLotnoAddr", jibunAddr + addrDetail);//지번주소
			//SBUxMethod.set("dtl-inp-loctnDtl", addrDetail);//지번주소 상세주소
			SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrFull", roadFullAddr);//도로명주소
			SBUxMethod.set("dtl-inp-operOgnzRoadNmAddr", addrPart1);//도로명주소
			SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrDtl", addrDetail);//도로명주소
			//SBUxMethod.set("dtl-inp-roadNmDtl", addrDetail);//도로명주소 상세주소
			SBUxMethod.set("dtl-inp-operOgnzAdmCd", admCd);// 행정구역코드(법정동코드)

			SBUxMethod.set("dtl-inp-operOgnzRoadNmCd", rnMgtSn);//도로명코드
			SBUxMethod.set("dtl-inp-operOgnzBmno", buldMnnm);//운영조직 건물 본번
			SBUxMethod.set("dtl-inp-operOgnzSlno", buldSlno);//운영조직 건물부번

		}else if(jusoChk == '2'){
			SBUxMethod.set("dtl-inp-apcZip", zipNo);//우편번호
			//SBUxMethod.set("dtl-inp-apcLotnoAddr", jibunAddr + addrDetail);//지번주소
			//SBUxMethod.set("dtl-inp-apcLoctnDtl", addrDetail);//지번주소 상세주소
			//SBUxMethod.set("dtl-inp-apcRoadNmAddr", roadFullAddr);//도로명주소
			SBUxMethod.set("dtl-inp-apcRoadNmAddrFull", roadFullAddr);//도로명주소
			SBUxMethod.set("dtl-inp-apcRoadNmAddr", addrPart1);//도로명주소
			SBUxMethod.set("dtl-inp-apcRoadNmAddrDtl", addrDetail);//도로명주소
			//SBUxMethod.set("dtl-inp-apcRoadNmDtl", addrDetail);//도로명주소 상세주소
			SBUxMethod.set("dtl-inp-apcAdmCd", admCd);// 행정구역코드(법정동코드)
			SBUxMethod.set("dtl-inp-apcRoadNmCd", rnMgtSn);//도로명코드
			SBUxMethod.set("dtl-inp-apcBmno", buldMnnm);//APC 건물본번
			SBUxMethod.set("dtl-inp-apcSlno", buldSlno);//APC 건물부번

			let ctpvCd = admCd.substr(0, 2);//시도코드
			let sigunCd = admCd.substr(0, 5);//시군구코드
			SBUxMethod.set("dtl-inp-ctpvCd", ctpvCd);// 행정구역코드(법정동코드)
			SBUxMethod.set("dtl-inp-sigunCd", sigunCd);// 행정구역코드(법정동코드)
		}
	}
	//최종제출 여부 체크
	function fn_prgrsLastChk(){
		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');

		if(prgrsLast  == 'Y'){
			SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
			SBUxMethod.attr("btnInsert1",'disabled','true'); // 저장버튼 비활성화

			SBUxMethod.attr("btnTmprStrg",'disabled','true'); // 임시저장버튼 비활성화

		} else {
			SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
			SBUxMethod.attr("btnInsert1",'disabled','false'); // 저장버튼 활성화

			SBUxMethod.attr("btnTmprStrg",'disabled','false'); // 임시저장버튼 활성화
		}
	}

	const fn_getCrtrYr = async function () {

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectApcCmsuCrtrYr.do");
		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				data.resultList.forEach(item => {
					jsonCrtrYr.push({
						text : item.crtrYr,
						value : item.crtrYr
					});
				});

			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
				console.error("failed", e.message);
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}
	}

	//전년도 데이터
	const fn_pySearch = async function(){
		await fn_clearForm();

		if (gfn_isEmpty(jsonPrevData)) {
			gfn_comAlert("W0005","전년도 데이터"); // W0005  {0}이/가 없습니다.
			return;
		}

		const data = jsonPrevData[0];

		SBUxMethod.set("dtl-inp-operOgnzNm", data.operOgnzNm);//운영조직명
		SBUxMethod.set("dtl-inp-operOgnzBrno", data.operOgnzBrno);//운영조직 사업자등록번호
		SBUxMethod.set("dtl-inp-operOgnzCrno", data.operOgnzCrno);//운영조직 법인등록번호
		SBUxMethod.set("dtl-inp-rprsv", data.rprsv);//대표자
		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddr", data.operOgnzRoadNmAddr);//소재지
		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrDtl", data.operOgnzRoadNmAddrDtl);//소재지
		let addrFull = data.operOgnzRoadNmAddr;
		if (data.operOgnzRoadNmAddrDtl) {
			addrFull += data.operOgnzRoadNmAddrDtl;
		}
		SBUxMethod.set("dtl-inp-operOgnzRoadNmAddrFull", addrFull);//운영조직 주소

		SBUxMethod.set("dtl-inp-operOgnzAdmCd", data.operOgnzAdmCd);//운영조직 법정동코드(행정구역코드)
		SBUxMethod.set("dtl-inp-operOgnzRoadNmCd", data.operOgnzRoadNmCd);//운영조직 도로명코드
		SBUxMethod.set("dtl-inp-operOgnzZip", data.operOgnzZip);//운영조직 우편번호
		SBUxMethod.set("dtl-inp-operOgnzBmno", data.operOgnzBmno);//운영조직 건물 본번
		SBUxMethod.set("dtl-inp-operOgnzSlno", data.operOgnzSlno);//운영조직 건물 부번


		SBUxMethod.set("dtl-inp-ctpvCd", data.ctpvCd);//시도 코드
		SBUxMethod.set("dtl-inp-sigunCd", data.sigunCd);//시군구 코드
		//SBUxMethod.set("dtl-inp-ognzTypeCd", data.ognzTypeCd);//조직유형 코드

		SBUxMethod.set("dtl-inp-apcNm", SBUxMethod.get("srch-inp-apcNm"));//apc명
		SBUxMethod.set("dtl-inp-apcBrno", data.apcBrno);//apc 사업자등록번호
		//SBUxMethod.set("dtl-inp-apcCrno", data.apcCrno);//apc 법인등록번호
		//SBUxMethod.set("dtl-inp-apcAddr", data.apcLoctn);//apc 주소

		SBUxMethod.set("dtl-inp-apcRoadNmAddr", data.apcRoadNmAddr);//apc 주소
		SBUxMethod.set("dtl-inp-apcRoadNmAddrDtl", data.apcRoadNmAddrDtl);//apc 주소

		let apcAddrFull = data.apcRoadNmAddr;
		if (data.apcRoadNmAddrDtl) {
			apcAddrFull += data.apcRoadNmAddrDtl;
		}
		SBUxMethod.set("dtl-inp-apcRoadNmAddrFull", apcAddrFull);//apc 주소

		SBUxMethod.set("dtl-inp-apcAdmCd", data.apcAdmCd);//apc 법정동코드(행정구역코드)
		SBUxMethod.set("dtl-inp-apcRoadNmCd", data.apcRoadNmCd);//apc 도로명코드
		SBUxMethod.set("dtl-inp-apcZip", data.apcZip);//apc 우편번호
		SBUxMethod.set("dtl-inp-apcBmno", data.apcBmno);//apc 건물 본번
		SBUxMethod.set("dtl-inp-apcSlno", data.apcSlno);//apc 건물 부번


		/*const itemList = data.itemList;

		const operItemList = [];
		const apcItemList = [];

		// 중복확인
		let isDuplicateFound = false;

		for (let i = 0; i < itemList.length; i++) {
			const current = itemList[i];
			const itemCd = current.itemCd;
			const ognzSeCd = current.ognzSeCd;
			const sn = current.sn;

			// 운영조직 품목
			if (ognzSeCd === '1') {
				let isDuplicate = false;
				for (let j = 0; j < operItemList.length; j++) {
					if (operItemList[j].itemCd === itemCd) {
						isDuplicate = true;
						break;
					}
				}
				if (isDuplicate) {
					isDuplicateFound = true;
					gfn_comAlert("W0009","이미 등록된 운영조직 품목"); // W0009 {0}이/가 있습니다.
					break;
				} else {
					operItemList.push(current);
				}
			}

			// APC품목
			else if (ognzSeCd === '2') {
				let isDuplicate = false;
				for (let j = 0; j < apcItemList.length; j++) {
					if (apcItemList[j].itemCd === itemCd) {
						isDuplicate = true;
						break;
					}
				}
				if (isDuplicate) {
					isDuplicateFound = true;
					gfn_comAlert("W0009","이미 등록된 APC 품목"); // W0009 {0}이/가 있습니다.
					break;
				} else {
					apcItemList.push(current);
				}
			}
		}*/


		// 전년도 데이터 아이템 리스트
		for (var i = 0; i < data.itemList.length; i++) {
			const itemData = data.itemList[i];
			const sn = itemData.sn;
			const ognzSeCd = itemData.ognzSeCd;
			const itemCd = itemData.itemCd;

			if(ognzSeCd == '1'){
				SBUxMethod.set("dtl-inp-operOgnzItemNm"+sn, itemData.itemNm);
				if(sn == '4'){
					SBUxMethod.set("dtl-inp-operOgnzEtcCtgryCd", itemData.etcCtgryCd);
				}else{
					SBUxMethod.set("dtl-inp-operOgnzItemCd"+sn, itemData.itemCd);
				}
			}else if(ognzSeCd == '2'){
				SBUxMethod.set("dtl-inp-apcItemNm"+sn, itemData.itemNm);
				if(sn == '4'){
					SBUxMethod.set("dtl-inp-apcEtcCtgryCd", itemData.etcCtgryCd);
				}else{
					SBUxMethod.set("dtl-inp-apcItemCd"+sn, itemData.itemCd);
				}
			}
		}
		// 중복메세지
		fn_checkItemDuplicate();

	}

	function fn_checkItemDuplicate() {
		// 초기화
		const msgDivs = document.getElementsByClassName('div-msg');
		for (let i = 0; i < msgDivs.length; i++) {
			msgDivs[i].style.visibility = 'hidden';
			msgDivs[i].style.fontSize = '0rem';
		}

		// 운영조직 품목
		let operItemList = [];
		for (let i = 1; i < 4; i++) {
			const operItemCd = SBUxMethod.get('dtl-inp-operOgnzItemCd' + i);
			operItemList.push({ sn: i, itemCd: operItemCd , ognzSeCd : 1});
		}

		// apc품목
		let apcItemList = [];
		for (let i = 1; i < 4; i++) {
			const operItemCd = SBUxMethod.get('dtl-inp-apcItemCd' + i);
			apcItemList.push({ sn: i, itemCd: operItemCd , ognzSeCd : 2});
		}

		let operItem = {};
		for (let i = 0; i < operItemList.length; i++) {
			const sn = operItemList[i].sn;
			const itemCd = operItemList[i].itemCd;
			if (gfn_isEmpty(itemCd)) break;

			if (operItem[itemCd]) {
				fn_duplicateMsg(sn, 1); // 중복 메시지
			} else {
				operItem[itemCd] = true;
			}
		}

		let apcItem = {};
		for (let i = 0; i < apcItemList.length; i++) {
			const sn = apcItemList[i].sn;
			const itemCd = apcItemList[i].itemCd;
			if (gfn_isEmpty(itemCd)) break;

			if (apcItem[itemCd]) {
				fn_duplicateMsg(sn, 2); // 중복 메시지
			} else {
				apcItem[itemCd] = true;
			}
		}

	}

	// 중복 메시지 보여주는 함수
	function fn_duplicateMsg(sn,ognzSeCd) {
		let inputEl;
		let msg;
		if (ognzSeCd === 1) {
			inputEl = $(`#dtl-inp-operOgnzItemCd${'${sn}'}`);
			msg = '중복으로 등록된 운영조직 품목입니다.'
		} else if (ognzSeCd === 2) {
			inputEl = $(`#dtl-inp-apcItemCd${'${sn}'}`);
			msg = '중복으로 등록된 APC 품목입니다.'
		}
		const msgDiv = inputEl.closest('span').next();

		msgDiv.text(msg);
		msgDiv.css({
			fontSize: "1.2rem",
			visibility: "visible",
			fontWeight: "bold",
			color: "#be0000",
			textAlign: "left"
		});

		inputEl.closest('tr').find('td, th').css('vertical-align', 'top');
	}


</script>
</html>