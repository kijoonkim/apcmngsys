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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>

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


#latestInfo > table > thead > tr >th{
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	color: #333;
	font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
	border-spacing: 0;
	border-collapse: collapse;
	box-sizing: border-box;
	margin: 0;
	border-color: #e8f1f9 !important;
	border-bottom: 1px solid #ffffff !important;
	word-wrap: break-word;
	background-color: #e8f1f9;
	text-align: center;
	font-weight: bold;
	font-size: 28px;
	padding: 8px;
	line-height: 1.42857143;
	border: 1px solid #ddd;
	border-top: 1px solid #f4f4f4;
	vertical-align: middle;
}
#latestInfoBody > tr:hover{
	background-color : #FFF8DC;
	cursor: pointer;
}

#latestInfoBody > tr > td {
	-webkit-text-size-adjust: 100%;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	color: #333;
	font-weight: 400;
	font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
	border-spacing: 0;
	border-collapse: collapse;
	box-sizing: border-box;
	margin: 0;
	font-size: 28px;
	text-align: center;
	word-wrap: break-word;
	border-color: #e8f1f9 !important;
	padding: 3px !important;
	line-height: 1.42857143;
	border: 1px solid #f4f4f4;
	vertical-align: middle;
	border-right: hidden;
}

/*
li:hover{background: black;}
li:hover a { color: white; font-weight: bold }


.panel ul>li:nth-child(odd){
  background-color: #fff;
}

.panel ul>li:nth-child(even){
  background-color: #eee;
}
*/
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
						id="btn-search"
						name="btn-search"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-danger btn-mbl"
						onclick="fn_searchSort"
					></sbux-button>
					<sbux-button
						id="btnClose"
						name="btnClose"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger btn-mbl"
						onclick="fn_close"
					></sbux-button>
					<div style="float:right;margin-left:10px;">
						<p class="ad_input_row chk-mbl" style="vertical-align:middle;">
						    <input style="width:20px;height:20px;" type="checkbox" id="srch-chk-autoPrint" name="srch-chk-autoPrint" checked />
						    <label for="srch-chk-autoPrint">자동출력</label>
					    </p>
					</div>


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
						<tr class="tr-sortno" style="display:none;">
							<th scope="row" class="th_bg th-mbl">
								<span style="color:red">(실적변경)선별번호
							</th>
							<td colspan="4" class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-sortno"
									name="dtl-inp-sortno"
									uitype="text"
									class="inpt-mbl"
									placeholder=""
									readonly
								></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
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
						<!-- 규격
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
						 -->
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckgEx(1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrdEx1"
									name="dtl-btn-addGrdEx1"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrdEx(1)"
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckgEx(2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrdEx2"
									name="dtl-btn-addGrdEx2"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrdEx(2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrdEx2"
									name="dtl-btn-delGrdEx2"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrdEx(1)"
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckgEx(3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrdEx3"
									name="dtl-btn-addGrdEx3"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrdEx(3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrdEx3"
									name="dtl-btn-delGrdEx3"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrdEx(2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grdEx4">
							<th scope="row" class="th-mbl">
								<sbux-select
									id="dtl-slt-grdEx4"
									name="dtl-slt-grdEx4"
									uitype="single"
									class="input-sm-ast inpt-mbl align-center"
									jsondata-ref="jsonOptnGrd"
									jsondata-text="grdNm"
									jsondata-value="grdCd"
									onchange="fn_onChangeSltGrd(3)"
								></sbux-select>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qnttEx4"
									name="dtl-inp-qnttEx4"
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
									id="dtl-inp-wghtEx4"
									name="dtl-inp-wghtEx4"
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
									id="dtl-slt-spmtPckgUnitCdEx4"
									name="dtl-slt-spmtPckgUnitCdEx4"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckgEx(4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrdEx4"
									name="dtl-btn-addGrdEx4"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrdEx(4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrdEx4"
									name="dtl-btn-delGrdEx4"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrdEx(3)"
								></sbux-button>
							</td>
						</tr>

						<!-- ex5 -->
						<tr class="tr-grdEx5">
							<th scope="row" class="th-mbl">
								<sbux-select
									id="dtl-slt-grdEx5"
									name="dtl-slt-grdEx5"
									uitype="single"
									class="input-sm-ast inpt-mbl align-center"
									jsondata-ref="jsonOptnGrd"
									jsondata-text="grdNm"
									jsondata-value="grdCd"
									onchange="fn_onChangeSltGrd(4)"
								></sbux-select>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qnttEx5"
									name="dtl-inp-qnttEx5"
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
									id="dtl-inp-wghtEx5"
									name="dtl-inp-wghtEx5"
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
									id="dtl-slt-spmtPckgUnitCdEx5"
									name="dtl-slt-spmtPckgUnitCdEx5"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckgEx(5)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrdEx5"
									name="dtl-btn-delGrdEx5"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrdEx(4)"
								></sbux-button>
							</td>
						</tr>

						<!-- grd 1 -->
						<tr class="tr-grd1">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd1"></span>
								<sbux-input id="dtl-inp-grdCd1" name="dtl-inp-grd1" uitype="hidden"></sbux-input>
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd1"
									name="dtl-btn-addGrd1"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(1,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd11">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd11"></span>
								<sbux-input id="dtl-inp-grdCd11" name="dtl-inp-grd11" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt11"
									name="dtl-inp-qntt11"
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
									id="dtl-inp-wght11"
									name="dtl-inp-wght11"
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
									id="dtl-slt-spmtPckgUnitCd11"
									name="dtl-slt-spmtPckgUnitCd11"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(1,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd11"
									name="dtl-btn-addGrd11"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(1,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd11"
									name="dtl-btn-delGrd11"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(1,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd12">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd12"></span>
								<sbux-input id="dtl-inp-grdCd12" name="dtl-inp-grd12" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt12"
									name="dtl-inp-qntt12"
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
									id="dtl-inp-wght12"
									name="dtl-inp-wght12"
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
									id="dtl-slt-spmtPckgUnitCd12"
									name="dtl-slt-spmtPckgUnitCd12"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(1,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd12"
									name="dtl-btn-addGrd12"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(1,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd12"
									name="dtl-btn-delGrd12"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(1,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd13">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd13"></span>
								<sbux-input id="dtl-inp-grdCd13" name="dtl-inp-grd13" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt13"
									name="dtl-inp-qntt13"
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
									id="dtl-inp-wght13"
									name="dtl-inp-wght13"
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
									id="dtl-slt-spmtPckgUnitCd13"
									name="dtl-slt-spmtPckgUnitCd13"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(1,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd13"
									name="dtl-btn-addGrd13"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(1,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd13"
									name="dtl-btn-delGrd13"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(1,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd14">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd14"></span>
								<sbux-input id="dtl-inp-grdCd14" name="dtl-inp-grd14" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt14"
									name="dtl-inp-qntt14"
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
									id="dtl-inp-wght14"
									name="dtl-inp-wght14"
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
									id="dtl-slt-spmtPckgUnitCd14"
									name="dtl-slt-spmtPckgUnitCd14"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(1,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd14"
									name="dtl-btn-delGrd14"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(1,4)"
								></sbux-button>
							</td>
						</tr>

						<!-- grd 2 -->
						<tr class="tr-grd2">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd2"></span>
								<sbux-input id="dtl-inp-grdCd2" name="dtl-inp-grd2" uitype="hidden"></sbux-input>
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd2"
									name="dtl-btn-addGrd2"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(2,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd21">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd21"></span>
								<sbux-input id="dtl-inp-grdCd21" name="dtl-inp-grd21" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt21"
									name="dtl-inp-qntt21"
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
									id="dtl-inp-wght21"
									name="dtl-inp-wght21"
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
									id="dtl-slt-spmtPckgUnitCd21"
									name="dtl-slt-spmtPckgUnitCd21"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(2,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd21"
									name="dtl-btn-addGrd21"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(2,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd21"
									name="dtl-btn-delGrd21"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(2,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd22">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd22"></span>
								<sbux-input id="dtl-inp-grdCd2" name="dtl-inp-grd2" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt22"
									name="dtl-inp-qntt22"
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
									id="dtl-inp-wght22"
									name="dtl-inp-wght22"
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
									id="dtl-slt-spmtPckgUnitCd22"
									name="dtl-slt-spmtPckgUnitCd22"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(2,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd22"
									name="dtl-btn-addGrd22"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(2,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd22"
									name="dtl-btn-delGrd22"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(2,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd23">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd23"></span>
								<sbux-input id="dtl-inp-grdCd23" name="dtl-inp-grd23" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt23"
									name="dtl-inp-qntt23"
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
									id="dtl-inp-wght23"
									name="dtl-inp-wght23"
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
									id="dtl-slt-spmtPckgUnitCd23"
									name="dtl-slt-spmtPckgUnitCd23"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(2,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd23"
									name="dtl-btn-addGrd23"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(2,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd23"
									name="dtl-btn-delGrd23"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(2,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd24">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd24"></span>
								<sbux-input id="dtl-inp-grdCd24" name="dtl-inp-grd24" uitype="hidden"></sbux-input>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt24"
									name="dtl-inp-qntt24"
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
									id="dtl-inp-wght24"
									name="dtl-inp-wght24"
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
									id="dtl-slt-spmtPckgUnitCd24"
									name="dtl-slt-spmtPckgUnitCd24"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(2,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd24"
									name="dtl-btn-delGrd24"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(2,4)"
								></sbux-button>
							</td>
						</tr>

						<!-- grd 3 -->
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd3"
									name="dtl-btn-addGrd3"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(3,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd31">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd31"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt31"
									name="dtl-inp-qntt31"
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
									id="dtl-inp-wght31"
									name="dtl-inp-wght31"
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
									id="dtl-slt-spmtPckgUnitCd31"
									name="dtl-slt-spmtPckgUnitCd31"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(3,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd31"
									name="dtl-btn-addGrd31"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(3,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd31"
									name="dtl-btn-delGrd31"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(3,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd32">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd32"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt32"
									name="dtl-inp-qntt32"
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
									id="dtl-inp-wght32"
									name="dtl-inp-wght32"
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
									id="dtl-slt-spmtPckgUnitCd32"
									name="dtl-slt-spmtPckgUnitCd32"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(3,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd32"
									name="dtl-btn-addGrd32"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(3,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd32"
									name="dtl-btn-delGrd32"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(3,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd33">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd33"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt33"
									name="dtl-inp-qntt33"
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
									id="dtl-inp-wght33"
									name="dtl-inp-wght33"
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
									id="dtl-slt-spmtPckgUnitCd33"
									name="dtl-slt-spmtPckgUnitCd33"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(3,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd33"
									name="dtl-btn-addGrd33"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(3,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd33"
									name="dtl-btn-delGrd33"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(3,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd34">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd34"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt34"
									name="dtl-inp-qntt34"
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
									id="dtl-inp-wght34"
									name="dtl-inp-wght34"
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
									id="dtl-slt-spmtPckgUnitCd34"
									name="dtl-slt-spmtPckgUnitCd34"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(3,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd34"
									name="dtl-btn-delGrd34"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(3,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 4 -->
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd4"
									name="dtl-btn-addGrd4"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(4,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd41">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd41"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt41"
									name="dtl-inp-qntt41"
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
									id="dtl-inp-wght41"
									name="dtl-inp-wght41"
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
									id="dtl-slt-spmtPckgUnitCd41"
									name="dtl-slt-spmtPckgUnitCd41"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(4,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd41"
									name="dtl-btn-addGrd41"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(4,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd41"
									name="dtl-btn-delGrd41"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(4,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd42">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd42"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt42"
									name="dtl-inp-qntt42"
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
									id="dtl-inp-wght42"
									name="dtl-inp-wght42"
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
									id="dtl-slt-spmtPckgUnitCd42"
									name="dtl-slt-spmtPckgUnitCd42"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(4,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd42"
									name="dtl-btn-addGrd42"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(4,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd42"
									name="dtl-btn-delGrd42"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(4,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd43">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd43"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt43"
									name="dtl-inp-qntt43"
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
									id="dtl-inp-wght43"
									name="dtl-inp-wght43"
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
									id="dtl-slt-spmtPckgUnitCd43"
									name="dtl-slt-spmtPckgUnitCd43"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(4,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd43"
									name="dtl-btn-addGrd43"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(4,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd43"
									name="dtl-btn-delGrd43"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(4,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd44">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd44"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt44"
									name="dtl-inp-qntt44"
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
									id="dtl-inp-wght44"
									name="dtl-inp-wght44"
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
									id="dtl-slt-spmtPckgUnitCd44"
									name="dtl-slt-spmtPckgUnitCd44"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(4,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd44"
									name="dtl-btn-delGrd44"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(4,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 5 -->
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
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(5)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd5"
									name="dtl-btn-addGrd5"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(5,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd51">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd51"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt51"
									name="dtl-inp-qntt51"
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
									id="dtl-inp-wght51"
									name="dtl-inp-wght51"
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
									id="dtl-slt-spmtPckgUnitCd51"
									name="dtl-slt-spmtPckgUnitCd51"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(5,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd51"
									name="dtl-btn-addGrd51"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(5,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd51"
									name="dtl-btn-delGrd51"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(5,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd52">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd52"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt52"
									name="dtl-inp-qntt52"
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
									id="dtl-inp-wght52"
									name="dtl-inp-wght52"
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
									id="dtl-slt-spmtPckgUnitCd52"
									name="dtl-slt-spmtPckgUnitCd52"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(5,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd52"
									name="dtl-btn-addGrd52"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(5,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd52"
									name="dtl-btn-delGrd52"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(5,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd53">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd53"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt53"
									name="dtl-inp-qntt53"
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
									id="dtl-inp-wght53"
									name="dtl-inp-wght53"
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
									id="dtl-slt-spmtPckgUnitCd53"
									name="dtl-slt-spmtPckgUnitCd53"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(5,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd53"
									name="dtl-btn-addGrd53"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(5,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd53"
									name="dtl-btn-delGrd53"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(5,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd54">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd54"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt54"
									name="dtl-inp-qntt54"
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
									id="dtl-inp-wght54"
									name="dtl-inp-wght54"
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
									id="dtl-slt-spmtPckgUnitCd54"
									name="dtl-slt-spmtPckgUnitCd54"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(5,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd54"
									name="dtl-btn-delGrd54"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(5,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 6 -->
						<tr class="tr-grd6">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd6"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt6"
									name="dtl-inp-qntt6"
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
									id="dtl-inp-wght6"
									name="dtl-inp-wght6"
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
									id="dtl-slt-spmtPckgUnitCd6"
									name="dtl-slt-spmtPckgUnitCd6"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(6)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd6"
									name="dtl-btn-addGrd6"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(6,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd61">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd61"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt61"
									name="dtl-inp-qntt61"
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
									id="dtl-inp-wght61"
									name="dtl-inp-wght61"
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
									id="dtl-slt-spmtPckgUnitCd61"
									name="dtl-slt-spmtPckgUnitCd61"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(6,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd61"
									name="dtl-btn-addGrd61"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(6,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd61"
									name="dtl-btn-delGrd61"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(6,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd62">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd62"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt62"
									name="dtl-inp-qntt62"
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
									id="dtl-inp-wght62"
									name="dtl-inp-wght62"
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
									id="dtl-slt-spmtPckgUnitCd62"
									name="dtl-slt-spmtPckgUnitCd62"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(6,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd62"
									name="dtl-btn-addGrd62"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(6,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd62"
									name="dtl-btn-delGrd62"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(6,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd63">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd63"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt63"
									name="dtl-inp-qntt63"
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
									id="dtl-inp-wght63"
									name="dtl-inp-wght63"
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
									id="dtl-slt-spmtPckgUnitCd63"
									name="dtl-slt-spmtPckgUnitCd63"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(6,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd63"
									name="dtl-btn-addGrd63"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(6,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd63"
									name="dtl-btn-delGrd63"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(6,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd64">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd64"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt64"
									name="dtl-inp-qntt64"
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
									id="dtl-inp-wght64"
									name="dtl-inp-wght64"
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
									id="dtl-slt-spmtPckgUnitCd64"
									name="dtl-slt-spmtPckgUnitCd64"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(6,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd64"
									name="dtl-btn-delGrd64"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(6,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 7 -->
						<tr class="tr-grd7">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd7"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt7"
									name="dtl-inp-qntt7"
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
									id="dtl-inp-wght7"
									name="dtl-inp-wght7"
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
									id="dtl-slt-spmtPckgUnitCd7"
									name="dtl-slt-spmtPckgUnitCd7"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(7)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd7"
									name="dtl-btn-addGrd7"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(7,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd71">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd71"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt71"
									name="dtl-inp-qntt71"
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
									id="dtl-inp-wght71"
									name="dtl-inp-wght71"
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
									id="dtl-slt-spmtPckgUnitCd71"
									name="dtl-slt-spmtPckgUnitCd71"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(7,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd71"
									name="dtl-btn-addGrd71"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(7,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd71"
									name="dtl-btn-delGrd71"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(7,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd72">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd72"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt72"
									name="dtl-inp-qntt72"
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
									id="dtl-inp-wght72"
									name="dtl-inp-wght72"
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
									id="dtl-slt-spmtPckgUnitCd72"
									name="dtl-slt-spmtPckgUnitCd72"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(7,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd72"
									name="dtl-btn-addGrd72"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(7,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd72"
									name="dtl-btn-delGrd72"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(7,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd73">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd73"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt73"
									name="dtl-inp-qntt73"
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
									id="dtl-inp-wght73"
									name="dtl-inp-wght73"
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
									id="dtl-slt-spmtPckgUnitCd73"
									name="dtl-slt-spmtPckgUnitCd73"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(7,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd73"
									name="dtl-btn-addGrd73"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(7,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd73"
									name="dtl-btn-delGrd73"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(7,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd74">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd74"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt74"
									name="dtl-inp-qntt74"
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
									id="dtl-inp-wght74"
									name="dtl-inp-wght74"
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
									id="dtl-slt-spmtPckgUnitCd74"
									name="dtl-slt-spmtPckgUnitCd74"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(7,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd74"
									name="dtl-btn-delGrd74"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(7,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 8 -->
						<tr class="tr-grd8">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd8"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt8"
									name="dtl-inp-qntt8"
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
									id="dtl-inp-wght8"
									name="dtl-inp-wght8"
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
									id="dtl-slt-spmtPckgUnitCd8"
									name="dtl-slt-spmtPckgUnitCd8"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(8)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd8"
									name="dtl-btn-addGrd8"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(8,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd81">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd81"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt81"
									name="dtl-inp-qntt81"
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
									id="dtl-inp-wght81"
									name="dtl-inp-wght81"
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
									id="dtl-slt-spmtPckgUnitCd81"
									name="dtl-slt-spmtPckgUnitCd81"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(8,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd81"
									name="dtl-btn-addGrd81"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(8,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd81"
									name="dtl-btn-delGrd81"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(8,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd82">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd82"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt82"
									name="dtl-inp-qntt82"
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
									id="dtl-inp-wght82"
									name="dtl-inp-wght82"
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
									id="dtl-slt-spmtPckgUnitCd82"
									name="dtl-slt-spmtPckgUnitCd82"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(8,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd82"
									name="dtl-btn-addGrd82"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(8,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd82"
									name="dtl-btn-delGrd82"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(8,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd83">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd83"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt83"
									name="dtl-inp-qntt83"
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
									id="dtl-inp-wght83"
									name="dtl-inp-wght83"
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
									id="dtl-slt-spmtPckgUnitCd83"
									name="dtl-slt-spmtPckgUnitCd83"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(8,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd83"
									name="dtl-btn-addGrd83"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(8,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd83"
									name="dtl-btn-delGrd83"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(8,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd84">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd84"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt84"
									name="dtl-inp-qntt84"
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
									id="dtl-inp-wght84"
									name="dtl-inp-wght84"
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
									id="dtl-slt-spmtPckgUnitCd84"
									name="dtl-slt-spmtPckgUnitCd84"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(8,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd84"
									name="dtl-btn-delGrd84"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(8,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 9 -->
						<tr class="tr-grd9">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd9"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt9"
									name="dtl-inp-qntt9"
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
									id="dtl-inp-wght9"
									name="dtl-inp-wght9"
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
									id="dtl-slt-spmtPckgUnitCd9"
									name="dtl-slt-spmtPckgUnitCd9"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(9)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd9"
									name="dtl-btn-addGrd9"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(9,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd91">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd91"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt91"
									name="dtl-inp-qntt91"
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
									id="dtl-inp-wght91"
									name="dtl-inp-wght91"
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
									id="dtl-slt-spmtPckgUnitCd91"
									name="dtl-slt-spmtPckgUnitCd91"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(9,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd91"
									name="dtl-btn-addGrd91"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(9,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd91"
									name="dtl-btn-delGrd91"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(9,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd92">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd92"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt92"
									name="dtl-inp-qntt92"
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
									id="dtl-inp-wght92"
									name="dtl-inp-wght92"
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
									id="dtl-slt-spmtPckgUnitCd92"
									name="dtl-slt-spmtPckgUnitCd92"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(9,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd92"
									name="dtl-btn-addGrd92"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(9,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd92"
									name="dtl-btn-delGrd92"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(9,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd93">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd93"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt93"
									name="dtl-inp-qntt93"
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
									id="dtl-inp-wght93"
									name="dtl-inp-wght93"
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
									id="dtl-slt-spmtPckgUnitCd93"
									name="dtl-slt-spmtPckgUnitCd93"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(9,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd93"
									name="dtl-btn-addGrd93"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(9,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd93"
									name="dtl-btn-delGrd93"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(9,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd94">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd94"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt94"
									name="dtl-inp-qntt94"
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
									id="dtl-inp-wght94"
									name="dtl-inp-wght94"
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
									id="dtl-slt-spmtPckgUnitCd94"
									name="dtl-slt-spmtPckgUnitCd94"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(9,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd94"
									name="dtl-btn-delGrd94"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(9,4)"
								></sbux-button>
							</td>
						</tr>
						<!-- grd 10 -->
						<tr class="tr-grd10">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd10"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt10"
									name="dtl-inp-qntt10"
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
									id="dtl-inp-wght10"
									name="dtl-inp-wght10"
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
									id="dtl-slt-spmtPckgUnitCd10"
									name="dtl-slt-spmtPckgUnitCd10"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(10)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd10"
									name="dtl-btn-addGrd10"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(10,1)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd101">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd101"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt101"
									name="dtl-inp-qntt101"
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
									id="dtl-inp-wght101"
									name="dtl-inp-wght101"
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
									id="dtl-slt-spmtPckgUnitCd101"
									name="dtl-slt-spmtPckgUnitCd101"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(10,1)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd101"
									name="dtl-btn-addGrd101"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(10,2)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd101"
									name="dtl-btn-delGrd101"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(10,1)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd102">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd102"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt102"
									name="dtl-inp-qntt102"
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
									id="dtl-inp-wght102"
									name="dtl-inp-wght102"
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
									id="dtl-slt-spmtPckgUnitCd102"
									name="dtl-slt-spmtPckgUnitCd102"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(10,2)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd102"
									name="dtl-btn-addGrd102"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(10,3)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd102"
									name="dtl-btn-delGrd102"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(10,2)"
								></sbux-button>
							</td>
						</tr>

						<tr class="tr-grd103">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd103"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt103"
									name="dtl-inp-qntt103"
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
									id="dtl-inp-wght103"
									name="dtl-inp-wght103"
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
									id="dtl-slt-spmtPckgUnitCd103"
									name="dtl-slt-spmtPckgUnitCd103"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(10,3)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-addGrd103"
									name="dtl-btn-addGrd103"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="추가"
									uitype="normal"
									onclick="fn_addGrd(10,4)"
								></sbux-button>
								<sbux-button
									id="dtl-btn-delGrd103"
									name="dtl-btn-delGrd103"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(10,3)"
								></sbux-button>
							</td>
						</tr>
						<tr class="tr-grd104">
							<th scope="row" class="th_bg th-mbl">
								<span></span>
								<span class="spn-grd104"></span>
							</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									id="dtl-inp-qntt104"
									name="dtl-inp-qntt104"
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
									id="dtl-inp-wght104"
									name="dtl-inp-wght104"
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
									id="dtl-slt-spmtPckgUnitCd104"
									name="dtl-slt-spmtPckgUnitCd104"
									uitype="single"
									class="input-sm-ast inpt_data_reqed inpt-mbl"
									jsondata-ref="jsonSpmtPckgUnit"
									jsondata-text="spmtPckgUnitNm"
									jsondata-value="spmtPckgUnitCd"
									onchange="fn_onChangeSltPckg(10,4)"
								></sbux-select>
							</td>
							<td colspan="3">
								<sbux-button
									id="dtl-btn-delGrd104"
									name="dtl-btn-delGrd104"
									class="btn btn-xs btn-outline-dark btn-mbl"
									text="삭제"
									uitype="normal"
									onclick="fn_delGrd(10,4)"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 최근 실적 조회구간 -->

				<!--[pp] //검색 -->
			</div>

			<div class="box-body" id="latestInfo">
				<table class="table table-bordered tbl_fixed tbl_mbl">
					<colgroup>
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 15%">
						<col style="width: 15%">
						<col style="width: 35%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th>생산자명</th>
							<th>팔레트번호</th>
							<th>품목</th>
							<th>투입수량</th>
							<th>선별내역</th>
							<th>선별일시</th>
						</tr>
					</thead>
					<tbody id="latestInfoBody">
					</tbody>
				</table>
			</div>
			<!--[pp] //검색결과 -->

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
    <div id="div-rpt-clipReportPrint" style="display:none;"></div>

</body>
<script type="text/javascript">

	let lv_rawMtrVlType;

	let lv_cntOptnGrd = 0;

	const grdList = [
		'1', '2', '3', '4', '5',
		'6', '7', '8', '9', '10'
	];

	const dtlList = [
		'', '1', '2', '3', '4'
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
		fn_setSortInptForm();
	}

	const fn_setApcForm = async function() {
		await gfn_getApcStng(gv_selectedApcCd);

		if (!gfn_isEmpty(gv_apcStng)) {
			lv_rawMtrVlType = gv_apcStng.rawMtrVlType;
		}

		/*
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
		*/
	}
	
	const fn_setSortInptForm = async function(_sortInptVlType) {
		
		const wghtEls = document.querySelectorAll(".dsp-wght");

		wghtEls.forEach((el) => {
    		el.style.display = "";
    	});

		if (!gfn_isEmpty(_sortInptVlType)) {
			if (_.isEqual(_sortInptVlType, "QNTT")) {
				wghtEls.forEach((el) => {
		    		el.style.display = "none";
		    	});
			}
		}
		
	}


	const fn_showSortno = function(sortno) {
		document.querySelectorAll(".tr-sortno").forEach((el) => {
			el.style.display = "";
		});
		SBUxMethod.set("dtl-inp-sortno", sortno);
	}

	const fn_hideSortno = function() {
		document.querySelectorAll(".tr-sortno").forEach((el) => {
			el.style.display = "none";
		});
		SBUxMethod.set("dtl-inp-sortno", "");
	}

	let sortList = [];


	const fn_view = async function(idx) {

		if (idx >= sortList.length) {
			return;
		}

		const sort = sortList[idx];

		SBUxMethod.set("dtl-inp-pltno", sort.pltno);

		SBUxMethod.set("dtl-inp-wrhsno", sort.wrhsno);
		SBUxMethod.set("dtl-inp-invntrQntt", sort.inptQntt);
		SBUxMethod.set("dtl-inp-invntrWght", sort.inptWght);

		SBUxMethod.set("dtl-inp-itemCd", sort.itemCd);
		SBUxMethod.set("dtl-inp-itemNm", sort.itemNm);
		SBUxMethod.set("dtl-inp-vrtyCd", sort.vrtyCd);
		SBUxMethod.set("dtl-inp-vrtyNm", sort.vrtyNm);
		SBUxMethod.set("dtl-inp-prdcrCd", sort.rprsPrdcrCd);
		SBUxMethod.set("dtl-inp-prdcrNm", sort.rprsPrdcrNm);
		SBUxMethod.set("dtl-lbl-warehouseSeNm", sort.warehouseSeCd);
		let invntrInfo = " ";

		invntrInfo += "투입: " + sort.inptQntt.toLocaleString();

		/*
		if (!_.isEqual(lv_rawMtrVlType, "QNTT")) {
			invntrInfo += "    " + sort.inptWght.toLocaleString() + " Kg ";
		}
		*/
		if (!_.isEqual(sort.sortInptVlType, "QNTT")) {
			invntrInfo += "    " + sort.inptWght.toLocaleString() + " Kg ";
		}
		
		invntrInfo += "   선별: " + sort.sortQntt.toLocaleString();
		invntrInfo += " (" + sort.grdQnttNm + ")";

		SBUxMethod.set("dtl-lbl-invntr", invntrInfo);

		await fn_setSortInptForm(sort.sortInptVlType);
		
      	await fn_setGrdUpdt(sort.itemCd, sort.vrtyCd);

      	await fn_getApcSpcfct(sort.itemCd);
      	await fn_getSpmtPckgUnit(sort.itemCd, sort.vrtyCd);

      	if (!gfn_isEmpty(sort.grdQnttWght)) {

      		let prvGrdCd = "";
      		let dtlIdx = 0;

      		sort.grdQnttWght.split(',').forEach((item) => {

				const grd = item.split(':');

				const grdCd = grd[0];
				const qntt = grd[1];
				const wght = grd[2];
				const spmtPckgUnitCd = grd[3];

				if (_.isEqual(grdCd, prvGrdCd)) {
					dtlIdx++;
				} else {
					dtlIdx = 0;
				}

				
				for ( let i=0; i<jsonFxngGrd.length; i++ ) {
					const stdGrd = jsonFxngGrd[i];
					if (_.isEqual(grdCd, stdGrd.grdCd)) {

						const dtl = dtlList[dtlIdx];
						
						if (!gfn_isEmpty(dtl)) {
							fn_addGrd(i+1, dtlIdx);
						}

						const grdId = grdList[i];
						SBUxMethod.set("dtl-inp-qntt" + grdId + dtl, qntt);
						SBUxMethod.set("dtl-inp-wght" + grdId + dtl, wght);
						SBUxMethod.set("dtl-slt-spmtPckgUnitCd" + grdId + dtl, spmtPckgUnitCd);
						
						break;
					}
				}

				prvGrdCd = grdCd;

			});
		}

      	fn_showSortno(sort.sortno);

      	fn_updateSortQntt();

      	// focus
		if (jsonOptnGrd.length > 0) {
			SBUxMethod.focus('dtl-inp-qnttEx1');
		} else {
			SBUxMethod.focus('dtl-inp-qntt1');
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

    	fn_hideSortno();

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
		//SBUxMethod.set("dtl-slt-spcfctCd", null);

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

		for ( let i=0; i<10; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qntt" + grdId;
			const wghtId = "dtl-inp-wght" + grdId;
			SBUxMethod.set(qnttId, null);
			SBUxMethod.set(wghtId, null);

			if (i==0) {
				for ( let j=0; j<5; j++ ) {
					const dtlId = grdList[j];

				}
			}


		}

		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qnttEx" + grdId;
			const wghtId = "dtl-inp-wghtEx" + grdId;
			SBUxMethod.set(qnttId, null);
			SBUxMethod.set(wghtId, null);
		}

		SBUxMethod.set("dtl-inp-sortQntt", null);
		SBUxMethod.set("dtl-inp-sortWght", null);

		SBUxMethod.focus("dtl-inp-pltno");

		fn_searchSort();
    }

	/**
	 * @name fn_getStdGrd
	 * @description 표준등급 json set
	 */
    const fn_getStdGrd = async function(_itemCd, _vrtyCd) {
		await gStdGrdObj.init(gv_selectedApcCd, _GRD_SE_CD_SORT, _itemCd, _vrtyCd);
	}

	const fn_setGrd = async function(_itemCd, _vrtyCd) {

		jsonOptnGrd.length = 0;
		jsonFxngGrd.length = 0;
		lv_cntOptnGrd = 0;

		sortGrdObj.hide();

		if (gfn_isEmpty(_itemCd)) {
			return;
		}

		await fn_getStdGrd(_itemCd, _vrtyCd);

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

		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			SBUxMethod.refresh("dtl-slt-grdEx" + grdId);
			document.querySelector('.tr-grdEx' + grdId).style.display = "none";
			if (jsonOptnGrd.length > 0 && i==0) {
				document.querySelector('.tr-grdEx' + grdId).style.display = "";
				//document.querySelector('.spn-grd' + grdId).innerText = gjsonStdGrdObj_1[i].grdNm;
			}
			SBUxMethod.set("dtl-inp-qnttEx" + grdId, null);
			SBUxMethod.set("dtl-inp-wghtEx" + grdId, null);
		}

		for ( let i=0; i<10; i++ ) {
			const grdId = grdList[i];
			dtlList.forEach((dtl, idx) => {

				document.querySelector('.tr-grd' + grdId + dtl).style.display = "none";
				if (i < jsonFxngGrd.length) {
					if (idx == 0) {
						document.querySelector('.tr-grd' + grdId + dtl).style.display = "";
					}
					document.querySelector('.spn-grd' + grdId + dtl).innerText = jsonFxngGrd[i].grdNm;
					// hidden input set
					SBUxMethod.set("dtl-inp-grdCd" + grdId + dtl, jsonFxngGrd[i].grdCd);
				} else {
					document.querySelector('.spn-grd' + grdId + dtl).innerText = "";
					SBUxMethod.set("dtl-inp-grdCd" + grdId + dtl, "");
				}

				SBUxMethod.set("dtl-inp-qntt" + grdId + dtl, null);
				SBUxMethod.set("dtl-inp-wght" + grdId + dtl, null);
			});
		}

		SBUxMethod.set("dtl-inp-sortQntt", null);
		SBUxMethod.set("dtl-inp-sortWght", null);

		sortGrdObj.show();
	}

	const fn_setGrdUpdt = async function(_itemCd, _vrtyCd) {

		jsonOptnGrd.length = 0;
		jsonFxngGrd.length = 0;
		lv_cntOptnGrd = 0;

		sortGrdObj.hide();

		if (gfn_isEmpty(_itemCd)) {
			return;
		}

		await fn_getStdGrd(_itemCd, _vrtyCd);

		if (gjsonStdGrdObj_1 == 0) {
			return;
		} else {
			gjsonStdGrdObj_1.forEach((grd) => {
				jsonFxngGrd.push(grd);
			});
		}

		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			SBUxMethod.refresh("dtl-slt-grdEx" + grdId);
			document.querySelector('.tr-grdEx' + grdId).style.display = "none";

			SBUxMethod.set("dtl-inp-qnttEx" + grdId, null);
			SBUxMethod.set("dtl-inp-wghtEx" + grdId, null);
		}

		/**
		for ( let i=0; i<10; i++ ) {
			const grdId = grdList[i];
			document.querySelector('.tr-grd' + grdId).style.display = "none";
			SBUxMethod.set("dtl-inp-qntt" + grdId, null);
			SBUxMethod.set("dtl-inp-wght" + grdId, null);
			if (i < jsonFxngGrd.length) {
				document.querySelector('.tr-grd' + grdId).style.display = "";
				document.querySelector('.spn-grd' + grdId).innerText = jsonFxngGrd[i].grdNm;
			}
		}
		 */

		for ( let i=0; i<10; i++ ) {
			const grdId = grdList[i];
			dtlList.forEach((dtl, idx) => {
				document.querySelector('.tr-grd' + grdId + dtl).style.display = "none";
				if (i < jsonFxngGrd.length) {
					if (idx == 0) {
						document.querySelector('.tr-grd' + grdId + dtl).style.display = "";
					}
					document.querySelector('.spn-grd' + grdId + dtl).innerText = jsonFxngGrd[i].grdNm;
				}
				// hidden input
				SBUxMethod.set("dtl-inp-qntt" + grdId + dtl, null);
				SBUxMethod.set("dtl-inp-wght" + grdId + dtl, null);
			});
		}


		SBUxMethod.set("dtl-inp-sortQntt", null);
		SBUxMethod.set("dtl-inp-sortWght", null);

		sortGrdObj.show();
	}


	const fn_addGrdEx = function(idx) {

		const grdId = grdList[idx];
		SBUxMethod.refresh("dtl-slt-grdEx" + grdId);
		document.querySelector('.tr-grdEx' + grdId).style.display = "";

		const btnId = grdList[idx-1];
		document.querySelector('#dtl-btn-addGrdEx' + btnId).style.display = "none";
	}

	const fn_delGrdEx = function(idx) {

		const grdId = grdList[idx];

		document.querySelector('.tr-grdEx' + grdId).style.display = "none";

		SBUxMethod.set("dtl-inp-qnttEx" + grdId, null);
		SBUxMethod.set("dtl-inp-wghtEx" + grdId, null);

		const prvBtnId = grdList[idx-1];
		document.querySelector('#dtl-btn-addGrdEx' + prvBtnId).style.display = "";

		fn_onChangeSortQntt();
	}



    /**
     * @name fn_addGrd
     * @description 고정등급 추가
     * @function
     */
	const fn_addGrd = function(idx, dtl) {

		const grdId = grdList[idx-1];
		const dtlId = dtlList[dtl];
		document.querySelector('.tr-grd' + grdId + dtlId).style.display = "";
		const btnId = grdList[idx-1];
		const prvDtlId = dtlList[dtl-1];
		document.querySelector('#dtl-btn-addGrd' + btnId + prvDtlId).style.display = "none";
		//SBUxMethod.refresh("dtl-inp-grd" + grdId);
	}

    /**
     * @name fn_delGrd
     * @description 고정등급 삭제
     * @function
     */
	const fn_delGrd = function(idx, dtl) {
		//fn_delGrd(1,1)
		const grdId = grdList[idx-1];
		const dtlId = dtlList[dtl];
		//SBUxMethod.refresh("dtl-slt-grd" + grdId);
		document.querySelector('.tr-grd' + grdId + dtlId).style.display = "none";

		SBUxMethod.set("dtl-inp-qntt" + grdId + dtlId, null);
		SBUxMethod.set("dtl-inp-wght" + grdId + dtlId, null);

		const prvBtnId = grdList[idx-1];
		const prvDtlId = dtlList[dtl-1];
		document.querySelector('#dtl-btn-addGrd' + prvBtnId + prvDtlId).style.display = "";

		fn_onChangeSortQntt();
	}

	const fn_onChangeSltGrd = function(idx) {
		const pckgId = "dtl-slt-spmtPckgUnitCdEx" + grdList[idx];
		const grdCd = SBUxMethod.get("dtl-slt-grdEx" + grdList[idx]);

		let chkInfo = _.find(jsonSpmtPckgUnit, {gdsGrd: grdCd});
		if (!gfn_isEmpty(chkInfo)) {
			SBUxMethod.set(pckgId, chkInfo.spmtPckgUnitCd);

			fn_onChangeSltPckgEx(idx)
		}
	}

	const fn_onChangeSltPckgEx = function(idx) {
		fn_onChangeSortQntt();
	}

	const fn_onChangeSltPckg = function(idx, dtl) {
		fn_onChangeSortQntt();
	}

	/**
	 *
	 */
	const fn_onChangeSortQntt = function() {

		/*
		const spcfctCd = SBUxMethod.get("dtl-slt-spcfctCd");
		let spcfctWght = 0;

		try {
			const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: spcfctCd});
			spcfctWght = parseFloat(spcfctInfo.wght) || 0;

			let chkInfo = _.find(jsonSpmtPckgUnit, {gdsGrd: grdCd});

		} catch(e) {
		}
		 */


		let totalQntt = 0;
		let totalWght = 0;

		for ( let i=0; i<10; i++ ) {
			const grdId = grdList[i];
			dtlList.forEach((dtl) => {
				const qnttId = "dtl-inp-qntt" + grdId + dtl;
				const wghtId = "dtl-inp-wght" + grdId + dtl;
				const pckgId = "dtl-slt-spmtPckgUnitCd" + grdId + dtl;

				const qntt = parseInt(SBUxMethod.get(qnttId)) || 0;

				let spcfctWght = 0;
				if (qntt > 0) {
					const spmtPckgUnitCd = SBUxMethod.get(pckgId);
					if (!gfn_isEmpty(spmtPckgUnitCd)) {
						const pckgInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
						if (!gfn_isEmpty(pckgInfo)) {
							spcfctWght = parseFloat(pckgInfo.spcfctWght) || 0;
						}
					}
				}
				const wght = gfn_apcEstmtWght(qntt * spcfctWght, gv_selectedApcCd);
				SBUxMethod.set(wghtId, wght);

				totalQntt += qntt;
				totalWght += wght;
			});
		}

		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qnttEx" + grdId;
			const wghtId = "dtl-inp-wghtEx" + grdId;
			const pckgId = "dtl-slt-spmtPckgUnitCdEx" + grdId;

			const qntt = parseInt(SBUxMethod.get(qnttId)) || 0;

			let spcfctWght = 0;
			if (qntt > 0) {
				const spmtPckgUnitCd = SBUxMethod.get(pckgId);
				if (!gfn_isEmpty(spmtPckgUnitCd)) {
					const pckgInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
					if (!gfn_isEmpty(pckgInfo)) {
						spcfctWght = parseFloat(pckgInfo.spcfctWght) || 0;
					}
				}
			}

			const wght = gfn_apcEstmtWght(qntt * spcfctWght, gv_selectedApcCd);
			SBUxMethod.set(wghtId, wght);

			totalQntt += qntt;
			totalWght += wght;
		}

		SBUxMethod.set("dtl-inp-sortQntt", totalQntt);
		SBUxMethod.set("dtl-inp-sortWght", totalWght);
	}

	const fn_updateSortQntt = function() {

		let totalQntt = 0;
		let totalWght = 0;

		for ( let i=0; i<10; i++ ) {
			const grdId = grdList[i];

			dtlList.forEach((dtl) => {
				const qnttId = "dtl-inp-qntt" + grdId + dtl;
				const wghtId = "dtl-inp-wght" + grdId + dtl;
				const qntt = parseInt(SBUxMethod.get(qnttId)) || 0;
				const wght = parseFloat(SBUxMethod.get(wghtId)) || 0;

				totalQntt += qntt;
				totalWght += wght;
			});

		}

		for ( let i=0; i<5; i++ ) {
			const grdId = grdList[i];
			const qnttId = "dtl-inp-qnttEx" + grdId;
			const wghtId = "dtl-inp-wghtEx" + grdId;
			const qntt = parseInt(SBUxMethod.get(qnttId)) || 0;
			const wght = parseFloat(SBUxMethod.get(wghtId)) || 0;

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

		//SBUxMethod.refresh("dtl-slt-spcfctCd");
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

		for ( let i=0; i<10; i++ ) {
			dtlList.forEach((dtl) => {
				const sltId = "dtl-slt-spmtPckgUnitCd" + grdList[i] + dtl;
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
			});
		}

		for ( let i=0; i<5; i++ ) {
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

		if (_.isEqual(lv_rawMtrVlType, "QNTT")) {
			if (invntrInptQntt <= 0) {
				gfn_comAlert("W0005", "재고수량");		//	W0005	{0}이/가 없습니다.
				return;
			}
		} else {
			if (invntrInptWght <= 0) {
				gfn_comAlert("W0005", "재고중량");		//	W0005	{0}이/가 없습니다.
				return;
			}
		}

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

		/**
		 *TODO
		 **/
		//const spcfctCd = SBUxMethod.get("dtl-slt-spcfctCd");

		const fcltCd = SBUxMethod.get("dtl-slt-fcltCd");
		const itemCd = SBUxMethod.get("dtl-inp-itemCd");
		const vrtyCd = SBUxMethod.get("dtl-inp-vrtyCd");
		const warehouseSeCd = SBUxMethod.get("dtl-slt-warehouseSeCd");

		//const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: spcfctCd});
		//const spcfctWght = parseFloat(spcfctInfo.wght) || 0;

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

		const inptYmd = sortYmd;

		if (jsonOptnGrd.length > 0) {

			for ( let i=0; i<5; i++ ) {

				const grdId = grdList[i];
				const qnttId = "dtl-inp-qnttEx" + grdId;
				const wghtId = "dtl-inp-wghtEx" + grdId;
				const pckgId = "dtl-slt-spmtPckgUnitCdEx" + grdId;
				const spcfctId = "dtl-slt-grdEx" + grdId;

				const sortQntt = parseInt(SBUxMethod.get(qnttId)) || 0;
				const sortWght = parseInt(SBUxMethod.get(wghtId)) || 0;

				const spmtPckgUnitCd = SBUxMethod.get(pckgId);

				if (gfn_isEmpty(spmtPckgUnitCd)) {
					gfn_comAlert("W0005", "상품명");		//	W0005	{0}이/가 없습니다.
					return;
				}

				let spcfctCd = "";
				if (!gfn_isEmpty(spmtPckgUnitCd)) {
					const pckgInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
					if (!gfn_isEmpty(pckgInfo)) {
						spcfctCd = pckgInfo.spcfctCd;
					}
				}

				if (gfn_isEmpty(spcfctCd)) {
					gfn_comAlert("W0005", "규격");		//	W0005	{0}이/가 없습니다.
					return;
				}

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

				//if (_.isEqual("Y", autoPckgInptYn)) {
				if (gfn_isEmpty(spmtPckgUnitCd)) {
					gfn_comAlert("W0005", "상품명");		//	W0005	{0}이/가 없습니다.
					return;
				}
				if (gfn_isEmpty(gdsGrd)) {
					gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
					return;
				}
				//}

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

			for ( let iDtl=0; iDtl<dtlList.length; iDtl++ ) {

				const dtl = dtlList[iDtl];

				const qnttId = "dtl-inp-qntt" + grdId + dtl;
				const wghtId = "dtl-inp-wght" + grdId + dtl;
				const pckgId = "dtl-slt-spmtPckgUnitCd" + grdId + dtl;

				const sortQntt = parseInt(SBUxMethod.get(qnttId)) || 0;
				const sortWght = parseFloat(SBUxMethod.get(wghtId)) || 0;

				if (sortQntt <= 0) {
					break;
				}

				const spmtPckgUnitCd = SBUxMethod.get(pckgId);
				const autoPckgInptYn = gfn_isEmpty(spmtPckgUnitCd) ? "N" : "Y";

				if (gfn_isEmpty(spmtPckgUnitCd)) {
					gfn_comAlert("W0005", "상품명");		//	W0005	{0}이/가 없습니다.
					return;
				}
				let spcfctCd = "";
				const pckgInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
				if (!gfn_isEmpty(pckgInfo)) {
					spcfctCd = pckgInfo.spcfctCd;
				}

				if (gfn_isEmpty(spcfctCd)) {
					gfn_comAlert("W0005", "규격");		//	W0005	{0}이/가 없습니다.
					return;
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

		const sortno = SBUxMethod.get("dtl-inp-sortno");

		const sortMng = {
    		apcCd: gv_selectedApcCd,
    		sortYmd: sortYmd,
    		sortno: sortno,
    		rawMtrVlType: lv_rawMtrVlType,
    		rawMtrInvntrList: rawMtrInvntrList,
    		sortPrfmncList: sortPrfmncList
    	}


		const postUrl = gfn_isEmpty(sortno) ?
					"/am/sort/insertSortPrfmnc.do" : "/am/sort/updateSortPrfmnc.do";

        try {
    		const postJsonPromise = gfn_postJSON(postUrl, sortMng);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_reset();
       			fn_autoPrint(data.resultMap);

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

	const fn_autoPrint =  async function(resultMap){
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'ST_DOC');
		let sortSnList = resultMap.sortSnList;
		let sortno = resultMap.sortno;
		let sortNoSnList = [];


		sortSnList.forEach(function(item){
			sortNoSnList.push(sortno + item);
		})
		const sortnoSn = sortNoSnList.join("','");
		if(document.querySelector('#srch-chk-autoPrint').checked){
			gfn_DirectPrintClipReport(rptUrl, {apcCd: gv_selectedApcCd, sortno: resultMap.sortno, sortnosn:sortnoSn, element : 'div-rpt-clipReportPrint'});
		}else{
			gfn_popClipReport("선별확인서",rptUrl, {apcCd: gv_selectedApcCd, sortno: resultMap.sortno, sortnosn:sortnoSn});
		}
	}

	const fn_searchSort = async function() {

		const sortYmd = SBUxMethod.get("dtl-dtp-inptYmd");

		// search fn_searchSort


		const tbd = document.querySelector('#latestInfoBody');
		while (tbd.hasChildNodes()){
			tbd.removeChild( tbd.firstChild );
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/sort/selectSortRsltList.do", {
    			apcCd: gv_selectedApcCd,
    			sortYmd: sortYmd,
      		});

            const data = await postJsonPromise;

  			if (_.isEqual("S", data.resultStatus)) {

  				sortList = data.resultList;

  				for ( let i = 0; i < sortList.length; i++ ) {		// fn_view('ST202403100001')

  					const rowData = sortList[i];

  					const tr = document.createElement('tr');



  					const tdRprsPrdcrNm = document.createElement('td');
  					tdRprsPrdcrNm.innerText = rowData.rprsPrdcrNm;
  					tr.appendChild(tdRprsPrdcrNm);

  					const tdPltno = document.createElement('td');
  					tdPltno.innerText = rowData.pltno;
  					tr.appendChild(tdPltno);

  					const tdItemVrty = document.createElement('td');
  					tdItemVrty.innerText = rowData.itemNm + " " + rowData.vrtyNm;
  					tr.appendChild(tdItemVrty);

  					const tdInpt = document.createElement('td');
  					tdInpt.innerText = rowData.inptQntt.toLocaleString();
  					tr.appendChild(tdInpt);

  					const tdSort = document.createElement('td');
  					tdSort.innerText = rowData.sortQntt.toLocaleString()
  								+ " (" + rowData.grdQnttNm + ")";
  					tr.appendChild(tdSort);

  					const tdRegDt = document.createElement('td');
  					tdRegDt.innerText = rowData.sysLastChgDt;
  					tr.appendChild(tdRegDt);

					tr.addEventListener("click", () => {
						fn_view(i);
					});

					tbd.appendChild(tr);
  				}

        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
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

  				invntrInfo += "수량: " + _rawMtrInvntr.invntrQntt.toLocaleString();
				
  				/*
  				if (!_.isEqual(lv_rawMtrVlType, "QNTT")) {
  					invntrInfo += "   중량: " + _rawMtrInvntr.invntrWght.toLocaleString() + " Kg ";
  					invntrInfo += "   (등급: " + _rawMtrInvntr.grdNm + ")";
  				}
  				*/
  				if (!_.isEqual(_rawMtrInvntr.sortInptVlType, "QNTT")) {
  					invntrInfo += "   중량: " + _rawMtrInvntr.invntrWght.toLocaleString() + " Kg ";
  					invntrInfo += "   (등급: " + _rawMtrInvntr.grdNm + ")";
  				}
  				
  				await fn_setSortInptForm(_rawMtrInvntr.sortInptVlType);
  				
  				SBUxMethod.set("dtl-lbl-invntr", invntrInfo);
  	        	await fn_setGrd(_rawMtrInvntr.itemCd, _rawMtrInvntr.vrtyCd);
  	        	fn_getApcSpcfct(_rawMtrInvntr.itemCd);
  	        	fn_getSpmtPckgUnit(_rawMtrInvntr.itemCd, _rawMtrInvntr.vrtyCd);

  	        	// focus
				if (jsonOptnGrd.length > 0) {
					SBUxMethod.focus('dtl-inp-qnttEx1');
				} else {
					SBUxMethod.focus('dtl-inp-qntt1');
				}

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

	const fn_close = function(){
		parent.gfn_tabClose("TAB_AM_003_003");
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>