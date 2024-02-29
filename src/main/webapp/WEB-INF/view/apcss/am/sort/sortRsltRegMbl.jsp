<%
 /**
  * @Class Name : sortRsltRegMbl.jsp
  * @Description : 선별결과등록 모바일 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철		최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 선별등록(모바일)</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	
<style>

.align-center {
	text-align: center;
}

.col-hd {
	background-color: #e8f1f9;
}

.th-mbl {
	text-align: right;
	font-weight: bold;
	font-size: 28px;
}

.inpt-mbl {
    //padding: 8px;
	height: 50px;
	font-size: 28px;
	line-height: 1.5;
	color: #555;
	width: 100%;
}

.btn-mbl {
	height: 50px;
	font-size: 24px;
}

.chk-mbl {
	height: 50px;
	font-size: 24px;
	width: 100%;
}

.chk-mbl input, label {
	vertical-align: bottom;
}

.fs-30 {
	font-size: 30px;
}

.tbl-sortGrd {

}



</style>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 모바일 -->
				</div>
			</div>
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div style="margin-right: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						text="초기화"
						class="btn btn-sm btn-outline-danger btn-mbl"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-danger btn-mbl"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btnClose"
						name="btnClose"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger btn-mbl"
						onclick="fn_close"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th-mbl">
								<span class="data_required" ></span>선별기
							</th>
							<td colspan="3" class="td_input"  style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-fcltCd"
									name="dtl-slt-fcltCd"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonComFclt"
								></sbux-select>
							</td>
							<td colspan="2" style="border-right:hidden;">
								<p class="ad_input_row chk-mbl" style="vertical-align:middle;">
								    <input 
								    	style="width:20px;height:20px;" 
								    	type="checkbox" 
								    	id="dtl-chk-fxngFclt" 
								    	name="dtl-chk-fxngFclt" 
								    	checked 
								    />
								    <label for="dtl-chk-fxngFclt">고정</label>
							    </p>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg th-mbl">
								<span class="data_required" ></span>팔레트번호
							</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-pltno"
									name="dtl-inp-pltno"
									uitype="text"
									class="input-sm-ast inpt_data_reqed inpt-mbl srch-pltno"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-button
									id="dtl-btn-rawMtrInvntr"
									name="dtl-btn-rawMtrInvntr"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="조회"
									uitype="normal"
									onclick="fn_searchInvntr"
								></sbux-button>
						    </td>
						    <td colspan="3"></td>
			            </tr>
						<tr>
							<th scope="row" class="th_bg th-mbl">품목/품종</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-itemCd" name="dtl-inp-itemCd" uitype="hidden"></sbux-input>
								<sbux-input
									id="dtl-inp-itemNm"
									name="dtl-inp-itemNm"
									uitype="text"
									class="inpt-mbl"
									placeholder=""
									title=""
									readonly
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-vrtyCd" name="dtl-inp-vrtyCd" uitype="hidden"></sbux-input>
								<sbux-input
									id="dtl-inp-vrtyNm"
									name="dtl-inp-vrtyNm"
									uitype="text"
									class="inpt-mbl"
									placeholder=""
									title=""
									readonly
								></sbux-input>
							</td>
							<td colspan="4"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg th-mbl">생산자</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									uitype="text"
									class="inpt-mbl"
									placeholder=""
									readonly
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-prdcrCd"
									name="dtl-inp-prdcrCd"
									uitype="text"
									class="inpt-mbl"
									placeholder=""
									readonly
								></sbux-input>
							</td>
							<td colspan="4"></td>
						</tr>
			            <tr>
							<th scope="row" class="th_bg th-mbl">재고정보</th>
							<td colspan="5" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-wrhsno" name="dtl-inp-wrhsno" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-invntrQntt" name="dtl-inp-invntrQntt" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-invntrWght" name="dtl-inp-invntrWght" uitype="hidden"></sbux-input>
								<sbux-label
									id="dtl-lbl-invntr"
									name="dtl-lbl-invntr"
									uitype="normal"
									text=""
									class="bold inpt-mbl"
								></sbux-label>
							</td>
						    <td colspan="3"></td>
			            </tr>
						<tr>
							<th scope="row" class="th_bg th-mbl">
								<span class="data_required" ></span>선별일자/창고
							</th>
							<td colspan="3" class="td_input">
								<sbux-datepicker
									id="dtl-dtp-inptYmd"
									name="dtl-dtp-inptYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="sbux-pik-group-apc input-sm-ast inpt_data_reqed inpt-mbl"
									onchange="fn_dtpChange"
									style="width:100%;"
								></sbux-datepicker>
						    </td>
						    <td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									uitype="single"
									id="dtl-slt-warehouseSeCd"
									name="dtl-slt-warehouseSeCd"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonComWarehouse"
								/>
						    </td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg th-mbl">규격</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spcfctCd"
									name="dtl-slt-spcfctCd"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonApcSpcfct"
									jsondata-text="spcfctNm"
									jsondata-value="spcfctCd"
									onchange="fn_onChangeSortQntt"
								></sbux-select>
							</td>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered tbl_fixed tbl-sortGrd">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th-mbl">선별 수량/중량</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-sortQntt"
									name="dtl-inp-sortQntt"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									readonly
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-sortWght"
									name="dtl-inp-sortWght"
									uitype="text"
									class="inpt_data_reqed inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									readonly
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<label class="bold fs-30 dsp-wght">Kg</label>
							</td>
							<!--  <th colspan="2" scope="row" class="th_bg th-mbl" style="text-align: center;">포장 상품명</th>
							-->
							<td colspan="4"></td>
						</tr>
						
						<!-- 옵션등급 -->
						<tr class="tr-grdEx1">
							<th scope="row" class="th-mbl">
								<sbux-select
									id="dtl-slt-grdEx1"
									name="dtl-slt-grdEx1"
									uitype="single"
									class="input-sm-ast inpt-mbl align-center"
									jsondata-ref="jsonOptnGrd"
									jsondata-text="grdNm"
									jsondata-value="grdCd"
									onchange="fn_onChangeSltGrd(0)"
								></sbux-select>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qnttEx1"
									name="dtl-inp-qnttEx1"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wghtEx1"
									name="dtl-inp-wghtEx1"
									uitype="text"
									class="input-sm-ast inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCdEx1"
									name="dtl-slt-spmtPckgUnitCdEx1"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd1"
									name="dtl-btn-addGrd1"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(1)"
								></sbux-button>
							</td>
						</tr>
						
						<tr class="tr-grdEx2">
							<th scope="row" class="th-mbl">
								<sbux-select
									id="dtl-slt-grdEx2"
									name="dtl-slt-grdEx2"
									uitype="single"
									class="input-sm-ast inpt-mbl align-center"
									jsondata-ref="jsonOptnGrd"
									jsondata-text="grdNm"
									jsondata-value="grdCd"
									onchange="fn_onChangeSltGrd(1)"
								></sbux-select>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qnttEx2"
									name="dtl-inp-qnttEx2"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wghtEx2"
									name="dtl-inp-wghtEx2"
									uitype="text"
									class="input-sm-ast inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCdEx2"
									name="dtl-slt-spmtPckgUnitCdEx2"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd2"
									name="dtl-btn-addGrd2"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(2)"
								></sbux-button>
							</td>
						</tr>
						
						<tr class="tr-grdEx3">
							<th scope="row" class="th-mbl">
								<sbux-select
									id="dtl-slt-grdEx3"
									name="dtl-slt-grdEx3"
									uitype="single"
									class="input-sm-ast inpt-mbl align-center"
									jsondata-ref="jsonOptnGrd"
									jsondata-text="grdNm"
									jsondata-value="grdCd"
									onchange="fn_onChangeSltGrd(2)"
								></sbux-select>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qnttEx3"
									name="dtl-inp-qnttEx3"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wghtEx3"
									name="dtl-inp-wghtEx3"
									uitype="text"
									class="input-sm-ast inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCdEx3"
									name="dtl-slt-spmtPckgUnitCdEx3"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3">
							</td>
						</tr>
						
						<tr class="tr-grd1">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd1"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt1"
									name="dtl-inp-qntt1"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wght1"
									name="dtl-inp-wght1"
									uitype="text"
									class="input-sm-ast inpt_data_reqed inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCd1"
									name="dtl-slt-spmtPckgUnitCd1"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3"></td>
						</tr>
						
						<tr class="tr-grd2">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd2"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt2"
									name="dtl-inp-qntt2"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wght2"
									name="dtl-inp-wght2"
									uitype="text"
									class="input-sm-ast inpt_data_reqed inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCd2"
									name="dtl-slt-spmtPckgUnitCd2"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3"></td>
						</tr>
						
						<tr class="tr-grd3">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd3"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt3"
									name="dtl-inp-qntt3"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wght3"
									name="dtl-inp-wght3"
									uitype="text"
									class="input-sm-ast inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCd3"
									name="dtl-slt-spmtPckgUnitCd3"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3"></td>
						</tr>
						
						<tr class="tr-grd4">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd4"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt4"
									name="dtl-inp-qntt4"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wght4"
									name="dtl-inp-wght4"
									uitype="text"
									class="input-sm-ast inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCd4"
									name="dtl-slt-spmtPckgUnitCd4"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr class="tr-grd5">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd5"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt5"
									name="dtl-inp-qntt5"
									uitype="text"
									class="inpt_data_reqed inpt-mbl"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									onchange="fn_onChangeSortQntt"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-wght5"
									name="dtl-inp-wght5"
									uitype="text"
									class="input-sm-ast inpt-mbl dsp-wght"
									placeholder=""
									title=""
									autocomplete="off"
									permit-keycodes-set="num"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnitCd5"
									name="dtl-slt-spmtPckgUnitCd5"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									unselected-text="= 포장안함 ="
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
								></sbux-select>
							</td>
							<td colspan="3"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
			</div>
			<!--[pp] //검색결과 -->
		</div>
		</div>
	</section>

    <!-- 원물재고 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-rawMtrInvntr"
	        name="modal-rawMtrInvntr"
	        uitype="middle"
	        header-title="원물재고 선택"
	        body-html-id="body-modal-rawMtrInvntr"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-rawMtrInvntr">
    	<jsp:include page="../../am/popup/rawMtrInvntrPopup.jsp"></jsp:include>
    </div>

	<!-- 선별지시번호 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-sortCmndno"
        	name="modal-sortCmndno"
        	uitype="middle"
        	header-title="선별지시번호 선택"
        	body-html-id="body-modal-sortCmndno"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-sortCmndno">
    	<jsp:include page="../../am/popup/sortCmndnoPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	let lv_rawMtrVlType;

	let lv_cntOptnGrd = 0;
	
	const grdList = [
		'1', '2', '3', '4', '5'		
	];

	const sortGrdObj = {
			
			hide: function() {
				document.querySelector('.tbl-sortGrd').style.display = "none";
			},
			show: function() {
				document.querySelector('.tbl-sortGrd').style.display = "";
			},
	}
	
	/* SB Select */
	var jsonComFclt			= [];	// 설비 		SORT_FCLT_CD
	var jsonApcSpcfct		= [];	// 규격 		spcfctCd
	var jsonComWarehouse	= [];	// 창고			WAREHOUSE_SE_CD
	var jsonSpmtPckgUnit	= [];	// 출하포장단위
	// jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, itemCd, vrtyCd);
	var jsonSpmtPckgUnit	= [];	// 출하포장단위

	var jsonOptnGrd = [];			//	옵션등급
	var jsonFxngGrd = [];			//	고정등급
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setComCdSBSelect('dtl-slt-fcltCd', jsonComFclt, 'SORT_FCLT_CD', gv_selectedApcCd),		// 설비
	 	]);
		
		if (jsonComWarehouse.length > 0) {
			SBUxMethod.set('dtl-slt-warehouseSeCd', jsonComWarehouse[jsonComWarehouse.length - 1].value);
		}
	}

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		let nowYmd = gfn_dateToYmd(new Date());	
		SBUxMethod.set("dtl-dtp-inptYmd", nowYmd);

		let result = await Promise.all([
				fn_initSBSelect()
			]);

		fn_reset();
		
		fn_setApcForm();
	}

	const fn_setApcForm = async function() {
		await gfn_getApcStng(gv_selectedApcCd);
		
		if (!gfn_isEmpty(gv_apcStng)) {
			lv_rawMtrVlType = gv_apcStng.rawMtrVlType;
		}
		
		const wghtEls = document.querySelectorAll(".dsp-wght");
		
		wghtEls.forEach((el) => {
    		el.style.display = "";
    	});
		
		if (!gfn_isEmpty(gv_apcStng)) {
			if (_.isEqual(gv_apcStng.rawMtrVlType, "QNTT")) {
				wghtEls.forEach((el) => {
		    		el.style.display = "none";
		    	});
			}
		}
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	const el = document.querySelector(".srch-pltno")
    	el.addEventListener("keyup", (event) => {
	  		if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
	  			fn_searchInvntr();
	  		}
  		});
    	
		document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
    		el.style.width = "50px";
    		el.style.height = "50px";
    	});
		document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
    		el.style.fontSize = "24px";
    		//sbux-pik-icon
    	});
    	
    	fn_init();		
    });

	/**
	 * @name fn_reset
	 * @description form reset
	 */
    const fn_reset = function() {

    	//if (!SBUxMethod.get("dtl-chk-fxngFclt")["dtl-chk-fxngFclt"]) {
    	if (!document.querySelector('#dtl-chk-fxngFclt').checked) {
    		SBUxMethod.set("dtl-slt-fcltCd", null);
    		SBUxMethod.refresh("dtl-slt-fcltCd");
    	}

		SBUxMethod.set("dtl-inp-pltno", "");
		SBUxMethod.attr("dtl-inp-pltno", "readonly", "false");
		SBUxMethod.set("dtl-inp-wrhsno", "");
		SBUxMethod.set("dtl-inp-invntrQntt", null);
		SBUxMethod.set("dtl-inp-invntrWght", null);

		let nowYmd = gfn_dateToYmd(new Date());
		SBUxMethod.set("dtl-dtp-inptYmd", nowYmd);
		
		SBUxMethod.set("dtl-inp-inptQntt", null);
		SBUxMethod.set("dtl-inp-inptWght", null);
		SBUxMethod.set("dtl-inp-itemCd", null);
		SBUxMethod.set("dtl-inp-itemNm", "");
		SBUxMethod.set("dtl-slt-spcfctCd", null);
		
		SBUxMethod.set("dtl-inp-vrtyCd", null);
		SBUxMethod.set("dtl-inp-vrtyNm", "");
		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.set("dtl-inp-prdcrNm", "");

		SBUxMethod.set("dtl-lbl-wrhsYmd", "");
		SBUxMethod.set("dtl-lbl-warehouseSeNm", "");
		SBUxMethod.set("dtl-lbl-bxKndNm", "");

		SBUxMethod.set("dtl-lbl-invntr", "");
		
		fn_setGrd(null);
		fn_getApcSpcfct(null);
		fn_getSpmtPckgUnit(null);
		
		sortGrdObj.hide();
		
		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qntt" + grdId;
			const wghtId = "dtl-inp-wght" + grdId;
			SBUxMethod.set(qnttId, null);
			SBUxMethod.set(wghtId, null);
		}
		
		for ( let i=0; i<3; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qnttEx" + grdId;
			const wghtId = "dtl-inp-wghtEx" + grdId;
			SBUxMethod.set(qnttId, null);
			SBUxMethod.set(wghtId, null);
		}
		
		SBUxMethod.set("dtl-inp-sortQntt", null);
		SBUxMethod.set("dtl-inp-sortWght", null);
		
		SBUxMethod.focus("dtl-inp-pltno");

    }
	
	/**
	 * @name fn_getStdGrd
	 * @description 표준등급 json set
	 */
    const fn_getStdGrd = async function(_itemCd) {
		await gStdGrdObj.init(gv_selectedApcCd, _GRD_SE_CD_SORT, _itemCd);
	}
    
	const fn_setGrd = async function(_itemCd) {
		
		jsonOptnGrd.length = 0;
		jsonFxngGrd.length = 0;
		lv_cntOptnGrd = 0;
		
		sortGrdObj.hide();
		
		if (gfn_isEmpty(_itemCd)) {
			return;
		}
		
		await fn_getStdGrd(_itemCd);
		
		if (gjsonStdGrdObj_1 == 0) {
			return;
		} else {
			gjsonStdGrdObj_1.forEach((grd) => {				
				if (_.isEqual(grd.mngType, "OPTN")) {
					jsonOptnGrd.push(grd);
				} else {
					jsonFxngGrd.push(grd);
				}
			});
		}
		
		for ( let i=0; i<3; i++ ) {
			const grdId = grdList[i];
			SBUxMethod.refresh("dtl-slt-grdEx" + grdId);
			document.querySelector('.tr-grdEx' + grdId).style.display = "none";
			if (jsonOptnGrd.length > 0 && i==0) {
				document.querySelector('.tr-grdEx' + grdId).style.display = "";
				//document.querySelector('.spn-grd' + grdId).innerText = gjsonStdGrdObj_1[i].grdNm;
			}
		}
		
		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			document.querySelector('.tr-grd' + grdId).style.display = "none";
			if (i < jsonFxngGrd.length) {
				document.querySelector('.tr-grd' + grdId).style.display = "";
				document.querySelector('.spn-grd' + grdId).innerText = jsonFxngGrd[i].grdNm;
			}
		}
		
		sortGrdObj.show();
	}
	
	const fn_addGrd = function(idx) {
		const grdId = grdList[idx];
		SBUxMethod.refresh("dtl-slt-grdEx" + grdId);
		document.querySelector('.tr-grdEx' + grdId).style.display = "";
	}

	const fn_onChangeSltGrd = function(idx) {
		const sltId = "dtl-slt-spmtPckgUnitCdEx" + grdList[idx];
		const grdCd = SBUxMethod.get("dtl-slt-grdEx" + grdList[idx]);
		
		let chkInfo = _.find(jsonSpmtPckgUnit, {gdsGrd: grdCd});		
		if (!gfn_isEmpty(chkInfo)) {
			SBUxMethod.set(sltId, chkInfo.spmtPckgUnitCd);
		}
	}

	/**
	 * 
	 */
	const fn_onChangeSortQntt = function() {
		
		const spcfctCd = SBUxMethod.get("dtl-slt-spcfctCd");
		let spcfctWght = 0;
		
		try {
			const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: spcfctCd});
			spcfctWght = parseFloat(spcfctInfo.wght) || 0;
		} catch(e) {
		}
		

		let totalQntt = 0;
		let totalWght = 0;
		
		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qntt" + grdId;
			const wghtId = "dtl-inp-wght" + grdId;
			const qntt = parseInt(SBUxMethod.get(qnttId)) || 0;
			const wght = gfn_apcEstmtWght(qntt * spcfctWght, gv_selectedApcCd);
			SBUxMethod.set(wghtId, wght);
			
			totalQntt += qntt;
			totalWght += wght;
		}
		
		for ( let i=0; i<3; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qnttEx" + grdId;
			const wghtId = "dtl-inp-wghtEx" + grdId;
			const qntt = parseInt(SBUxMethod.get(qnttId)) || 0;
			const wght = gfn_apcEstmtWght(qntt * spcfctWght, gv_selectedApcCd);
			SBUxMethod.set(wghtId, wght);
			
			totalQntt += qntt;
			totalWght += wght;
		}
		
		SBUxMethod.set("dtl-inp-sortQntt", totalQntt);
		SBUxMethod.set("dtl-inp-sortWght", totalWght);
	}
	
	
	/**
	 * @name fn_getApcSpcfct
     * @description APC규격 JSON 설정
     * @function
	 * @param {string} itemCd
	 */
	const fn_getApcSpcfct = async function(_itemCd) {

		jsonApcSpcfct.length = 0;

		if (!gfn_isEmpty(_itemCd)) {
			jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd, _itemCd);	
		}

		SBUxMethod.refresh("dtl-slt-spcfctCd");
	}

	/**
	 * @name fn_getSpmtPckgUnit
     * @description APC출하포장단위 JSON 설정
     * @function
	 * @param {string} itemCd
	 * @param {string} vrtyCd
	 */
	const fn_getSpmtPckgUnit = async function(_itemCd, _vrtyCd) {
		
		jsonSpmtPckgUnit.length = 0;
		
		if (!gfn_isEmpty(_itemCd) && !gfn_isEmpty(_vrtyCd)) {
			jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, _itemCd, _vrtyCd);
		}
		
		for ( let i=0; i<5; i++ ) {
			
			const sltId = "dtl-slt-spmtPckgUnitCd" + grdList[i];
			SBUxMethod.refresh(sltId);
			
			if (i < jsonFxngGrd.length && jsonSpmtPckgUnit.length > 0) {
				const grdCd = jsonFxngGrd[i].grdCd;
				let chkInfo = _.find(jsonSpmtPckgUnit, {gdsGrd: grdCd});
				
				if (gfn_isEmpty(chkInfo)) {
					SBUxMethod.set(sltId, jsonSpmtPckgUnit[0].spmtPckgUnitCd);
				} else {
					SBUxMethod.set(sltId, chkInfo.spmtPckgUnitCd);
				}
			}
		}
		
		for ( let i=0; i<3; i++ ) {
			const sltId = "dtl-slt-spmtPckgUnitCdEx" + grdList[i];
			SBUxMethod.refresh(sltId);
			
			if (jsonSpmtPckgUnit.length > 0) {
				const grdCd = SBUxMethod.get("dtl-slt-grdEx" + grdList[i]);
				let chkInfo = _.find(jsonSpmtPckgUnit, {gdsGrd: grdCd});
				if (gfn_isEmpty(chkInfo)) {
					SBUxMethod.set(sltId, jsonSpmtPckgUnit[0].spmtPckgUnitCd);
				} else {
					SBUxMethod.set(sltId, chkInfo.spmtPckgUnitCd);
				}
			}
		}
		
	}

	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		if (gjsonStdGrdObj_1.length == 0) {
  			gfn_comAlert("W0005", "품목별 등급정보");		//	W0005	{0}이/가 없습니다.
            return;
		}

		// 원물재고 내역
		// 입고번호, 재고량, 투입량
		const rawMtrInvntrList = [];

		const wrhsno = SBUxMethod.get("dtl-inp-wrhsno");
		const invntrInptQntt = parseInt(SBUxMethod.get("dtl-inp-invntrQntt")) || 0;
		const invntrInptWght = parseInt(SBUxMethod.get("dtl-inp-invntrWght")) || 0;
		
		rawMtrInvntrList.push({
			wrhsno: wrhsno,
			inptQntt: invntrInptQntt,
			inptWght: invntrInptWght
		});
		
		if (rawMtrInvntrList.length == 0) {
			gfn_comAlert("W0005", "원물재고대상");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		const sortYmd = SBUxMethod.get("dtl-dtp-inptYmd");
		
		if (gfn_isEmpty(sortYmd)) {
			gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		const spcfctCd = SBUxMethod.get("dtl-slt-spcfctCd");
		
		const fcltCd = SBUxMethod.get("dtl-slt-fcltCd");
		const itemCd = SBUxMethod.get("dtl-inp-itemCd");
		const vrtyCd = SBUxMethod.get("dtl-inp-vrtyCd");
		const warehouseSeCd = SBUxMethod.get("dtl-slt-warehouseSeCd");
		
		const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: spcfctCd});
		const spcfctWght = parseFloat(spcfctInfo.wght) || 0;
		
		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0005", "설비");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (gfn_isEmpty(vrtyCd)) {
			gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (gfn_isEmpty(warehouseSeCd)) {
			gfn_comAlert("W0005", "창고");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		// 실적내역
		const sortPrfmncList = [];
		
		let sortInptQntt = 0;
		let sortInptWght = 0;

		if (jsonOptnGrd.length > 0) {
			
			for ( let i=0; i<3; i++ ) {
				
				const grdId = grdList[i];
				const qnttId = "dtl-inp-qnttEx" + grdId;
				const wghtId = "dtl-inp-wghtEx" + grdId;
				const pckgId = "dtl-slt-spmtPckgUnitCdEx" + grdId;
				const spcfctId = "dtl-slt-grdEx" + grdId;
				
				const inptYmd= sortYmd;
				const sortQntt = parseInt(SBUxMethod.get(qnttId)) || 0;
				const sortWght = parseInt(SBUxMethod.get(wghtId)) || 0;

				const spmtPckgUnitCd = SBUxMethod.get(pckgId);
				const autoPckgInptYn = gfn_isEmpty(spmtPckgUnitCd) ? "N" : "Y";
				
				if (sortQntt <= 0) {
					continue;
				} 
				
				const grdCd = SBUxMethod.get(spcfctId);
				
				const grdInfo = _.find(jsonOptnGrd, {grdCd: grdCd});
				
				const gdsGrdKnd = grdInfo.aftrGrdKnd;
				const gdsGrd = grdInfo.aftrGrdCd;
				
				const stdGrdList = [];
				stdGrdList.push({
					grdSeCd: _GRD_SE_CD_SORT,
					itemCd: itemCd,
					grdKnd: grdInfo.grdKnd,
					grdCd: grdCd
				});
				
				const gdsStdGrdList = [];
				gdsStdGrdList.push({
					grdSeCd: _GRD_SE_CD_GDS,
					itemCd: itemCd,
					grdKnd: gdsGrdKnd,
					grdCd: gdsGrd
				});
				
				if (_.isEqual("Y", autoPckgInptYn)) {
					if (gfn_isEmpty(spmtPckgUnitCd)) {
						gfn_comAlert("W0005", "상품명");		//	W0005	{0}이/가 없습니다.
						return;
					}
					if (gfn_isEmpty(gdsGrd)) {
						gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
						return;
					}
				}
				
				const sortPrfmnc = {
					inptYmd: inptYmd,
					fcltCd: fcltCd,
					itemCd: itemCd,
					vrtyCd: vrtyCd,
					spcfctCd: spcfctCd,
					warehouseSeCd: warehouseSeCd,
					grdCd: grdCd,
					sortQntt: sortQntt,
					sortWght: sortWght,
					autoPckgInptYn: autoPckgInptYn,
					stdGrdList: stdGrdList,
					spmtPckgUnitCd: spmtPckgUnitCd,
					gdsGrd: gdsGrd,
					gdsStdGrdList: gdsStdGrdList
				}

				sortPrfmncList.push(sortPrfmnc);
				
				sortInptQntt += sortQntt;
				sortInptWght += sortWght;
			}
		}
		
		
		for ( let i=0; i<jsonFxngGrd.length; i++ ) {
			
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qntt" + grdId;
			const wghtId = "dtl-inp-wght" + grdId;
			const pckgId = "dtl-slt-spmtPckgUnitCd" + grdId;
			
			const inptYmd= sortYmd;
			const sortQntt = parseInt(SBUxMethod.get(qnttId)) || 0;
			const sortWght = parseInt(SBUxMethod.get(wghtId)) || 0;

			const spmtPckgUnitCd = SBUxMethod.get(pckgId);
			const autoPckgInptYn = gfn_isEmpty(spmtPckgUnitCd) ? "N" : "Y";
			
			
			if (sortQntt <= 0) {
				continue;
			} 
			
			const grdCd = jsonFxngGrd[i].grdCd;
			const gdsGrdKnd = jsonFxngGrd[i].aftrGrdKnd;
			const gdsGrd = jsonFxngGrd[i].aftrGrdCd;
			
			const stdGrdList = [];
			stdGrdList.push({
				grdSeCd: _GRD_SE_CD_SORT,
				itemCd: itemCd,
				grdKnd: jsonFxngGrd[i].grdKnd,
				grdCd: grdCd
			});
			
			const gdsStdGrdList = [];
			gdsStdGrdList.push({
				grdSeCd: _GRD_SE_CD_GDS,
				itemCd: itemCd,
				grdKnd: gdsGrdKnd,
				grdCd: gdsGrd
			});
			
			if (_.isEqual("Y", autoPckgInptYn)) {
				if (gfn_isEmpty(spmtPckgUnitCd)) {
					gfn_comAlert("W0005", "상품명");		//	W0005	{0}이/가 없습니다.
					return;
				}
				if (gfn_isEmpty(gdsGrd)) {
					gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
					return;
				}
			}
			
			const sortPrfmnc = {
				inptYmd: inptYmd,
				fcltCd: fcltCd,
				itemCd: itemCd,
				vrtyCd: vrtyCd,
				spcfctCd: spcfctCd,
				warehouseSeCd: warehouseSeCd,
				grdCd: grdCd,
				sortQntt: sortQntt,
				sortWght: sortWght,
				autoPckgInptYn: autoPckgInptYn,
				stdGrdList: stdGrdList,
				spmtPckgUnitCd: spmtPckgUnitCd,
				gdsGrd: gdsGrd,
				gdsStdGrdList: gdsStdGrdList
			}

			sortPrfmncList.push(sortPrfmnc);
			
			sortInptQntt += sortQntt;
			sortInptWght += sortWght;
		}

		if (sortPrfmncList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (invntrInptWght < sortInptWght) {
			if (!_.isEqual(lv_rawMtrVlType, "QNTT")) {
				gfn_comAlert("W0008", "재고량", "투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
				return;
			}
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "선별실적 저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const sortMng = {
    		apcCd: gv_selectedApcCd,
    		sortYmd: sortYmd,
    		rawMtrVlType: lv_rawMtrVlType,
    		rawMtrInvntrList: rawMtrInvntrList,
    		sortPrfmncList: sortPrfmncList
    	}
		
        try {
    		const postJsonPromise = gfn_postJSON("/am/sort/insertSortPrfmnc.do", sortMng);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_reset();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	const fn_searchInvntr = async function() {
		
		const pltno = SBUxMethod.get("dtl-inp-pltno");
		
		if (gfn_isEmpty(pltno)) {
			gfn_comAlert("W0005", "팔레트번호");		//	W0005	{0}이/가 없습니다.
            return;
		}
		
		// search rawinvntr

        try {
        	const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntr.do", {
    			apcCd: gv_selectedApcCd,
    			pltno: pltno,
    			delYn: 'N',
      		});

            const data = await postJsonPromise;
            
  			if (_.isEqual("S", data.resultStatus)) {
  				
  				const _rawMtrInvntr = data.resultMap;
  				
  				if (gfn_isEmpty(_rawMtrInvntr)) {
  					return;
  				}

  				SBUxMethod.set("dtl-inp-pltno", _rawMtrInvntr.pltno);

  				SBUxMethod.set("dtl-inp-wrhsno", _rawMtrInvntr.wrhsno);
  				SBUxMethod.set("dtl-inp-invntrQntt", _rawMtrInvntr.invntrQntt);
  				SBUxMethod.set("dtl-inp-invntrWght", _rawMtrInvntr.invntrWght);
  				
  				SBUxMethod.set("dtl-inp-itemCd", _rawMtrInvntr.itemCd);
  				SBUxMethod.set("dtl-inp-itemNm", _rawMtrInvntr.itemNm);
  				SBUxMethod.set("dtl-inp-vrtyCd", _rawMtrInvntr.vrtyCd);
  				SBUxMethod.set("dtl-inp-vrtyNm", _rawMtrInvntr.vrtyNm);
  				SBUxMethod.set("dtl-inp-prdcrCd", _rawMtrInvntr.prdcrCd);
  				SBUxMethod.set("dtl-inp-prdcrNm", _rawMtrInvntr.prdcrNm);
  				
  				let invntrInfo = " ";
  				
  				invntrInfo += "수량: " + _rawMtrInvntr.invntrQntt;
  				
  				if (!_.isEqual(lv_rawMtrVlType, "QNTT")) {
  					invntrInfo += "   중량: " + _rawMtrInvntr.invntrWght + " Kg ";
  					invntrInfo += "   (등급: " + _rawMtrInvntr.grdNm + ")";
  				}
  				
  				SBUxMethod.set("dtl-lbl-invntr", invntrInfo);
  				
  	        	await fn_setGrd(_rawMtrInvntr.itemCd);
  	        	
  	        	fn_getApcSpcfct(_rawMtrInvntr.itemCd);
  	        	fn_getSpmtPckgUnit(_rawMtrInvntr.itemCd, _rawMtrInvntr.vrtyCd);
  	        	
  	        	
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        		
        		fn_reset();
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	
        	fn_reset();
        }
        
	}
	
	/**
     * @name fn_setGrdSortInpt
     * @description 선별투입내역 조회
     */
    const fn_setGrdSortInpt = async function() {

		let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");

		const postJsonPromise = gfn_postJSON("/am/sort/selectSortInptList.do", {
			apcCd: gv_selectedApcCd,
			inptYmd: inptYmd,
			sortCmptnYn: 'N',	// 선별미완료
          	// pagination
  	  		pagingYn : 'N'
  			//currentPageNo : pageNo,
   		  	//recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	        	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonSortInpt.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const sortInpt = {
  	          				apcCd: item.apcCd,
  	          				wrhsno: item.wrhsno,
  	          				inptSn: item.inptSn,
  	          				inptYmd: item.inptYmd,
  	          				fcltCd: item.fcltCd,
  	          				qntt: item.qntt,
  	          				wght: item.wght,
  	          				sortno: item.sortno,
  	          				sortCmndno: item.sortCmndno,
  	          				rmrk: item.rmrk,
  	          				pltno: item.pltno,
  	          				wrhsYmd: item.wrhsYmd,
  	          				prdcrCd: item.prdcrCd,
  	          				itemCd: item.itemCd,
  	          				vrtyCd: item.vrtyCd,
  	          				gdsSeCd: item.gdsSeCd,
  	          				wrhsSeCd: item.wrhsSeCd,
  	          				warehouseSeCd: item.warehouseSeCd,
  	          				bxKnd: item.bxKnd,
  	          				grdCd: item.grdCd,
  	          				prdcrNm: item.prdcrNm,
  	          				itemNm: item.itemNm,
  	          				vrtyNm: item.vrtyNm,
  	          				grdNm: item.grdNm,
  	          				fcltNm: item.fcltNm,
  	          				warehouseSeNm: item.warehouseSeNm,
  	          				gdsSeNm: item.gdsSeNm,
  	          				wrhsSeNm: item.wrhsSeNm,
  	          				vrtyNm: item.vrtyNm
  	  				}

  	          		jsonSortInpt.push(sortInpt);
  	  			});
  	          	totalRecordCount = jsonSortInpt.length;
  	          	document.querySelector('#cnt-inpt').innerText = totalRecordCount;
  	          	SBUxMethod.set("crtr-ymd", inptYmd);

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
		grdSortInpt.rebuild();
    }

	/**
     * @name fn_onChangeInptQntt
     * @description 투입 수량 변경 시 event
	 */
    const fn_onChangeInptQntt = function() {

		let inptQntt = parseInt(SBUxMethod.get("dtl-inp-inptQntt")) || 0;

		let invntrQntt = parseInt(SBUxMethod.get("dtl-inp-invntrQntt")) || 0;
		let invntrWght = parseInt(SBUxMethod.get("dtl-inp-invntrWght")) || 0;

		if (invntrQntt <= 0) {
			return;
		}

		if (inptQntt == invntrQntt) {
			SBUxMethod.set("dtl-inp-inptWght", invntrWght);
		} else if (inptQntt < invntrQntt) {
			let inptWght = gfn_apcEstmtWght(invntrWght / invntrQntt * inptQntt, gv_selectedApcCd);
			SBUxMethod.set("dtl-inp-inptWght", inptWght);
		}

    }

	/**
     * @name fn_choiceRawMtrInvntr
     * @description 원물재고 popup
	 */
	const fn_choiceRawMtrInvntr = function() {

		SBUxMethod.openModal('modal-rawMtrInvntr');
		popRawMtrInvntr.init({
				apcCd: gv_selectedApcCd,
				apcNm: gv_selectedApcNm
			}, fn_setRawMtrInvntr);
	}

	/**
     * @name fn_choiceRawMtrInvntr
     * @description 원물재고 popup
	 */
	const fn_setRawMtrInvntr = function(_rawMtrInvntr) {

		if (gfn_isEmpty(_rawMtrInvntr)) {
			return;
		}

		SBUxMethod.set("dtl-inp-pltno", _rawMtrInvntr.pltno);
		SBUxMethod.attr("dtl-inp-pltno", "readonly", "true");

		SBUxMethod.set("dtl-inp-wrhsno", _rawMtrInvntr.wrhsno);
		SBUxMethod.set("dtl-inp-invntrQntt", _rawMtrInvntr.invntrQntt);
		SBUxMethod.set("dtl-inp-invntrWght", _rawMtrInvntr.invntrWght);
		SBUxMethod.set("dtl-lbl-invntr", _rawMtrInvntr.invntr);
		SBUxMethod.set("dtl-inp-sortCmndno", _rawMtrInvntr.sortCmndno);
		SBUxMethod.set("dtl-inp-itemCd", _rawMtrInvntr.itemCd);
		SBUxMethod.set("dtl-inp-itemNm", _rawMtrInvntr.itemNm);
		SBUxMethod.set("dtl-inp-vrtyCd", _rawMtrInvntr.vrtyCd);
		SBUxMethod.set("dtl-inp-vrtyNm", _rawMtrInvntr.vrtyNm);
		SBUxMethod.set("dtl-inp-prdcrCd", _rawMtrInvntr.prdcrCd);
		SBUxMethod.set("dtl-inp-prdcrNm", _rawMtrInvntr.prdcrNm);
		SBUxMethod.set("dtl-lbl-wrhsYmd", _rawMtrInvntr.wrhsYmd);
		SBUxMethod.set("dtl-lbl-warehouseSeNm", _rawMtrInvntr.warehouseSeNm);
		SBUxMethod.set("dtl-lbl-bxKndNm", _rawMtrInvntr.bxKndNm);

		let invntrInfo = " ";
		invntrInfo += "수량: " + _rawMtrInvntr.invntrQntt
				+ " 중량: " + _rawMtrInvntr.invntrWght + " Kg "
				+ " 등급: " + _rawMtrInvntr.grdNm;
		SBUxMethod.set("dtl-lbl-invntr", invntrInfo);
	}

	// 선별지시번호 선택 팝업 호출
	const fn_choiceSortCmnd = function() {
		popSortCmndno.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortCmnd);
	}

	const fn_setSortCmnd = function(sortCmnd) {
		if (!gfn_isEmpty(sortCmnd)) {
			SBUxMethod.set('dtl-inp-sortCmndno', sortCmnd.sortCmndno);
			SBUxMethod.set('dtl-inp-sortCmndSn', sortCmnd.sortCmndSn);
			SBUxMethod.set('dtl-inp-sortCmndnoIndct', sortCmnd.sortCmndnoIndct);
			SBUxMethod.set('dtl-inp-inptQntt', sortCmnd.cmndQntt);
			SBUxMethod.set('dtl-inp-inptWght', sortCmnd.cmndWght);
			SBUxMethod.attr("dtl-inp-sortCmndnoIndct", "readonly", "true");


			SBUxMethod.set("dtl-inp-pltno", sortCmnd.pltno);
			SBUxMethod.attr("dtl-inp-pltno", "readonly", "true");

			SBUxMethod.set("dtl-inp-wrhsno", sortCmnd.wrhsno);
			SBUxMethod.set("dtl-inp-invntrQntt", sortCmnd.invntrQntt);
			SBUxMethod.set("dtl-inp-invntrWght", sortCmnd.invntrWght);
			SBUxMethod.set("dtl-lbl-invntr", sortCmnd.invntr);
			SBUxMethod.set("dtl-inp-itemCd", sortCmnd.itemCd);
			SBUxMethod.set("dtl-inp-itemNm", sortCmnd.itemNm);
			SBUxMethod.set("dtl-inp-vrtyCd", sortCmnd.vrtyCd);
			SBUxMethod.set("dtl-inp-vrtyNm", sortCmnd.vrtyNm);
			SBUxMethod.set("dtl-inp-prdcrCd", sortCmnd.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", sortCmnd.prdcrNm);
			SBUxMethod.set("dtl-lbl-wrhsYmd", sortCmnd.wrhsYmd);
			SBUxMethod.set("dtl-lbl-warehouseSeNm", sortCmnd.warehouseSeNm);
			SBUxMethod.set("dtl-lbl-bxKndNm", sortCmnd.bxKndNm);

			let invntrInfo = " ";
			invntrInfo += "수량: " + sortCmnd.invntrQntt
					+ " 중량: " + sortCmnd.invntrWght + " Kg "
					+ " 등급: " + sortCmnd.grdNm;
			SBUxMethod.set("dtl-lbl-invntr", invntrInfo);
		}
	}
	const fn_close = function(){
		parent.gfn_tabClose("TAB_AM_003_003");
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>