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
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_selectFcltOperInfo"></sbux-button>
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
							<col style="width: 187px">
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
								<th scope="row">대상연도</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-spinner
										id="srch-inp-crtrYr"
										name="srch-inp-crtrYr"
										uitype="normal"
										step-value="1"
										disabled
									></sbux-spinner>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<!--
									<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_copy" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
								<sbux-input id="dtl-inp-operOgnzNm" name="dtl-inp-operOgnzNm" uitype="text" class="form-control input-sm" ></sbux-input>
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
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 대표자</th>
							<td>
								<sbux-input id="dtl-inp-rprsv" name="dtl-inp-rprsv" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
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
									<sbux-input id="dtl-inp-operOgnzItemCd1" name="dtl-inp-operOgnzItemCd1" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-operOgnzItemNm1" name="dtl-inp-operOgnzItemNm1" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item1" name="dtl-btn-item1" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(1)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>

							<th>APC 처리 대표품목1</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-apcItemCd1" name="dtl-inp-apcItemCd1" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-apcItemNm1" name="dtl-inp-apcItemNm1" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
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
									<sbux-input id="dtl-inp-operOgnzItemCd2" name="dtl-inp-operOgnzItemCd2" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-operOgnzItemNm2" name="dtl-inp-operOgnzItemNm2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item2" name="dtl-btn-item2" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(2)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>

							<th>APC 처리 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-apcItemCd2" name="dtl-inp-apcItemCd2" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-apcItemNm2" name="dtl-inp-apcItemNm2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item5" name="dtl-btn-item5" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(5)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-operOgnzItemCd3" name="dtl-inp-operOgnzItemCd3" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-operOgnzItemNm3" name="dtl-inp-operOgnzItemNm3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item3" name="dtl-btn-item3" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(3)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>

							<th>APC 처리 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-5">
									<sbux-input id="dtl-inp-apcItemCd3" name="dtl-inp-apcItemCd3" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-inp-apcItemNm3" name="dtl-inp-apcItemNm3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="dtl-btn-item6" name="dtl-btn-item6" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(6)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 기타품목</th>
							<td>
								<div class="col-md-6">
									<sbux-input id="dtl-inp-operOgnzItemNm4" name="dtl-inp-operOgnzItemNm4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 수기입력" ></sbux-input>
								</div>
								<div class="col-md-6">
									<sbux-select
										id="dtl-inp-operOgnzEtcCtgryCd"
										name="dtl-inp-operOgnzEtcCtgryCd"
										uitype="single"
										jsondata-ref="jsonComEtcCtgryCd"
										unselected-text="부류선택"
										class="form-control input-sm"
									></sbux-select>
								</div>
							</td>
							<th>APC 처리 기타품목명</th>
							<td>
								<div class="col-md-6">
									<sbux-input id="dtl-inp-apcItemNm4" name="dtl-inp-apcItemNm4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은  수기입력" ></sbux-input>
								</div>
								<div class="col-md-6">
									<sbux-select
										id="dtl-inp-apcEtcCtgryCd"
										name="dtl-inp-apcEtcCtgryCd"
										uitype="single"
										jsondata-ref="jsonComApcEtcCtgryCd"
										unselected-text="부류선택"
										class="form-control input-sm"
									></sbux-select>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnInsert1" name="btnInsert1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				</div>
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

		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		let brno = '${loginVO.brno}';
		if(brno != 0000 || brno != null || brno != ""){

		}

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let apcCd = '0861';
		let crtrYr = '2024';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	//var jsonComOgnzTypeCd = [];//조직유형
	var jsonComEtcCtgryCd = [];//기타부류
	var jsonComApcEtcCtgryCd = [];//APC기타부류

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
		]);
	}

	const fn_init = async function() {
		fn_initSBSelect();

		//if() user=userTpye 값과 apc에 따라 변경 dtl-inp-apcNm
		//APC명 자동설정
		SBUxMethod.set("dtl-inp-apcNm", SBUxMethod.get("srch-inp-apcNm"));

		fn_search();

		//진척도
		cfn_selectPrgrs();

		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			await SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
		} else {
			await SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
		}
	}
	const fn_search = async function() {
		fn_clearForm();
		fn_selectFcltOperInfo();
	}

	const fn_selectFcltOperInfo = async function(){
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr  =  SBUxMethod.get("srch-inp-crtrYr");

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
			apcCd : apcCd
			,crtrYr : crtrYr
		});

		let data = await postJsonPromise;
		try{
			if(data.resultList.length > 0){
				let resultVO = data.resultList[0];
				console.log(resultVO);

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
	}

	//작년 데이터 복사
	const fn_copy = async function(){
		console.log('************fn_copy********');
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr  =  SBUxMethod.get("srch-inp-crtrYr");
		crtrYr = Number(crtrYr) - 1;

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
			apcCd : apcCd
			,crtrYr : crtrYr
		});

		let data = await postJsonPromise;
	    try{
			if(data.resultList.length > 0){
				let resultVO = data.resultList[0];
				//console.log(resultVO);

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
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	//등록
	const fn_save = async function() {
		console.log("******************fn_save**********************************");

		/*
		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let trgtYr = SBUxMethod.get("dtl-inp-trgtYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(trgtYr)) {
			alert("대상연도를 작성해주세요");
			return;
		}

		let itemCd1 = SBUxMethod.get("dtl-inp-operOgnzItemCd1");
		let apcItem1 = SBUxMethod.get("dtl-inp-apcItem1");
		if (gfn_isEmpty(itemCd1) && gfn_isEmpty(apcItem1)) {
			alert("'운영조직 취급 대표품목1'과 'APC 처리 대표품목1'은 필수로 작성해주셔야 합니다.");
			return;
		}
		//2,4 사업자 번호
		let operOgnzBrno = !SBUxMethod.get("dtl-inp-operOgnzBrno");
		let apcBrno = !SBUxMethod.get("dtl-inp-apcBrno");
		if (gfn_isEmpty(operOgnzBrno)) {
			alert("사업자번호는 총 10자리입니다. 사업자번호를 올바르게 작성하였는지 확인해주세요.");
			return;
		}
		*/

		fn_subInsert(confirm("등록 하시겠습니까?") , 'N');
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {
		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}

	//신규등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		//등록년도는 항상 올해
		//let now = new Date();
		//let crtrYr = now.getFullYear();
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		let apcCd = SBUxMethod.get("srch-inp-apcCd");

		//품목 리스트
		let itemArr = [];

		//운영조직 품목
		for (var i = 1; i < 5; i++) {
			let itemNm = SBUxMethod.get("dtl-inp-operOgnzItemNm"+i);
			let itemCd = SBUxMethod.get("dtl-inp-operOgnzItemCd"+i);
			let ognzSeCd = '1';
			let etcCtgryCd;
			if(i == 4){
				etcCtgryCd = SBUxMethod.get("dtl-inp-operOgnzEtcCtgryCd");
			}
			//console.log(i+" gfn_isEmpty(itemNm) = " + gfn_isEmpty(itemNm));
			if(!gfn_isEmpty(itemNm)){
				let itemData = {
						itemNm : itemNm
						, itemCd : itemCd
						, ognzSeCd : ognzSeCd
						, etcCtgryCd : etcCtgryCd
						, sn : i
				}
				itemArr.push(itemData);
			}
		}

		//APC 품목
		for (var i = 1; i < 5; i++) {
			let itemNm = SBUxMethod.get("dtl-inp-apcItemNm"+i);
			let itemCd = SBUxMethod.get("dtl-inp-apcItemCd"+i);
			let ognzSeCd = '2';
			let etcCtgryCd;
			if(i == 4){
				etcCtgryCd = SBUxMethod.get("dtl-inp-apcEtcCtgryCd");
			}
			//console.log(i+" gfn_isEmpty(itemNm) = " + gfn_isEmpty(itemNm)+ " itemNm = "+itemNm);
			if(!gfn_isEmpty(itemNm)){
				let itemData = {
						itemNm : itemNm
						, itemCd : itemCd
						, ognzSeCd : ognzSeCd
						, etcCtgryCd : etcCtgryCd
						, sn : i
				}
				itemArr.push(itemData);
			}
		}

		console.log(itemArr);

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperInfo.do", {
			crtrYr: crtrYr  // 등록년도
			, prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn: tmpChk//임시저장 체크
			, apcCd: apcCd // APC코드
			, operOgnzNm: SBUxMethod.get("dtl-inp-operOgnzNm")  // 운영조직 명
			, operOgnzBrno: SBUxMethod.get("dtl-inp-operOgnzBrno")  //운영조직 사업자등록번호
			, operOgnzCrno: SBUxMethod.get("dtl-inp-operOgnzCrno")  //운영조직 법인등록번호
			, rprsv: SBUxMethod.get("dtl-inp-rprsv")  // 대표자

			, loctn: SBUxMethod.get("dtl-inp-operOgnzRoadNmAddr")  // 소재지
			, loctnDtl: SBUxMethod.get("dtl-inp-operOgnzRoadNmAddrDtl")  // 소재지 상세

			, operOgnzAdmCd : SBUxMethod.get("dtl-inp-operOgnzAdmCd") //운영조직 법정동코드(행정구역코드)
			, operOgnzRoadNmCd : SBUxMethod.get("dtl-inp-operOgnzRoadNmCd") //운영조직 도로명코드
			, operOgnzZip : SBUxMethod.get("dtl-inp-operOgnzZip") //apc 우편번호
			, operOgnzBmno : SBUxMethod.get("dtl-inp-operOgnzBmno") //apc 건물 본번
			, operOgnzSlno : SBUxMethod.get("dtl-inp-operOgnzSlno") //apc 건물 부번

			, ctpvCd: SBUxMethod.get("dtl-inp-ctpvCd") //시도 코드 (법정동코드 앞2자리)
			, sigunCd: SBUxMethod.get("dtl-inp-sigunCd") //시군구 코드 (법정동 코드 앞5자리)

			, ognzType: SBUxMethod.getText("dtl-inp-ognzType") //조직유형 명
			//, ognzTypeCd: SBUxMethod.getValue("dtl-inp-ognzTypeCd") //조직유형 코드

			, apcNm: SBUxMethod.get("dtl-inp-apcNm")  //apc명
			, apcBrno: SBUxMethod.get("dtl-inp-apcBrno")  //apc 사업자등록번호
			//, apcCrno: SBUxMethod.get("dtl-inp-apcCrno")  //apc 법인등록번호

			, apcLoctn: SBUxMethod.get("dtl-inp-apcRoadNmAddr")  //apc 주소
			, apcLoctnDtl: SBUxMethod.get("dtl-inp-apcRoadNmAddrDtl")  //apc 주소 상세

			, apcAdmCd : SBUxMethod.get("dtl-inp-apcAdmCd") //apc 법정동코드(행정구역코드)
			, apcRoadNmCd : SBUxMethod.get("dtl-inp-apcRoadNmCd") //apc 도로명코드
			, apcZip : SBUxMethod.get("dtl-inp-apcZip") //apc 우편번호
			, apcBmno : SBUxMethod.get("dtl-inp-apcBmno") //apc 건물 본번
			, apcSlno : SBUxMethod.get("dtl-inp-apcSlno") //apc 건물 부번

			, itemList : itemArr //품목 리스트
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				selectFcltOperInfo();
				//fn_search();
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				cfn_allTabPrgrsRefrash();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
		//진척도 재조회
		cfn_selectPrgrs();
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
		//console.log(itemVal);
		if (!gfn_isEmpty(itemVal)) {
			switch (itemVal.sn) {
			case 1: case 2: case 3:
				SBUxMethod.set('dtl-inp-operOgnzItemCd' + itemVal.sn , itemVal.itemCd);
				SBUxMethod.set('dtl-inp-operOgnzItemNm' + itemVal.sn , itemVal.itemNm);
				break;
			case 4: case 5: case 6:
				let sn = Number(itemVal.sn) - 3;
				SBUxMethod.set('dtl-inp-apcItemCd' + sn , itemVal.itemCd);
				SBUxMethod.set('dtl-inp-apcItemNm' + sn , itemVal.itemNm);
				break;
			default:
				break;
			}
		}
	}

	//운영조직 , apc 주소 구분
	let jusoChk;

	/* 주소 팝업 */
	//팝업 실행
	var fn_goPopup = function(chk){
		console.log(chk);
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
			let ctpvCd = admCd.substr(0, 2);//시도코드
			let sigunCd = admCd.substr(0, 5);//시군구코드
			SBUxMethod.set("dtl-inp-ctpvCd", ctpvCd);// 행정구역코드(법정동코드)
			SBUxMethod.set("dtl-inp-sigunCd", sigunCd);// 행정구역코드(법정동코드)

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
		}
	}

</script>
</html>