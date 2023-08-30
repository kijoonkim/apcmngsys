<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocRawMtrWgh" name="btnDocRawMtrWgh" uitype="normal" class="btn btn-sm btn-primary" onclick="fn_docRawMtrWgh" text="계량확인서" ></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_save" text="저장" ></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_delete" text="삭제" ></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->

				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-wghno" name="dtl-inp-wghno" uitype="hidden"></sbux-input>
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 4%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-datepicker id="dtl-dtp-wghYmd" name="dtl-dtp-wghYmd" uitype="popup" class="form-control input-sm input-sm-ast"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" ><span class="data_required" ></span>생산자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(dtl-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>

							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-itemCd"
									name="dtl-slt-itemCd"
									uitype="single"
									jsondata-ref="jsonApcItem"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
								<sbux-select
									id="dtl-slt-vrtyCd"
									name="dtl-slt-vrtyCd"
									uitype="single"
									jsondata-ref="jsonApcVrty"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="4" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_1" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="1"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_1" text="일반매입"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_2" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_2" text="공선"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_3" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="3" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_3" text="매취"></sbux-label>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="4" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_1" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_1" text="일반"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_2" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_2" text="GAP"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_3" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_3" text="무농약"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_4" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="4"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_4" text="유기농"></sbux-label>
								</p>
							</td>
							<th scope="row" class="th_bg">운송구분</th>
							<td colspan="4" class="td_input" >
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_1" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_1" text="자가"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_2" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_2" text="용역"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_3" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_3" text="기타"></sbux-label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-vhclno"
									name="dtl-inp-vhclno"
									class="form-control input-sm inpt_data_reqed"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="3" class="td_input"  style="border-right: hidden;">
								<sbux-button id="btnSrchVhclno" name="btnSrchVhclno" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>전체중량</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="dtl-inp-wholWght"
									name="dtl-inp-wholWght"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWholWght"
								></sbux-input>
							</td>
							<td colspan="3" style="border-right:hidden;">Kg</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>공차중량 </th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-emptVhclWght"
									name="dtl-inp-emptVhclWght"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeEmptVhclWght"
								></sbux-input>
							</td>
							<td colspan="3" style="border-right:hidden;">Kg</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">감량률</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-rdcdRt" name="dtl-inp-rdcdRt"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									mask = "{'alias': 'decimal' , 'digits': 0, 'radixPoint': '.', 'autoFillDigits': false, 'autoUnmask': true}"
									onchange="fn_onChangeRdcdRt"
								></sbux-input>
							</td>
							<td colspan="3">%</td>
							<th scope="row" class="th_bg">감량</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-rdcdWght"
									name="dtl-inp-rdcdWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								/>
							</td>
							<td colspan="3">Kg</td>
							<th scope="row" class="th_bg">실중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-actlWght"
									name="dtl-inp-actlWght"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td colspan="3">Kg</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">팔레트</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-pltWght"
									name="dtl-inp-pltWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPltBx"
									name="btnSrchPltBx"
									class="btn btn-xs btn-outline-dark"
									text="입력"
									uitype="modal"
									target-id="modal-pltBx" onclick="fn_choicePltBx"
								></sbux-button>
								</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">박스</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-bxWght"
									name="dtl-inp-bxWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td colspan="3">Kg</td>
							<th scope="row" class="th_bg">입고중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-wrhsWght"
									name="dtl-inp-wrhsWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td colspan="3">Kg</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>보관창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
							</td>
							<td colspan="3"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>등급</th>
							<td class="td_input" >
								<sbux-select id="dtl-slt-grdCd" name="dtl-slt-grdCd" uitype="single" jsondata-ref="jsonApcGrd" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
							</td>
							<td colspan="3"></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="4" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-rmrk"
									name="dtl-inp-rmrk"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>원물계량 내역</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>
					</ul>
				 	<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger" onclick="fn_uld">올리기</sbux-button>
					</div>
				</div>
				<div id="wrap-grdWghPrfmnc" class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:370px;"></div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	header-is-close-button="false"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-vhcl"
	        name="modal-vhcl"
	        uitype="middle"
	        header-title="차량 선택"
	        body-html-id="body-modal-vhcl"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-pltBx"
	        name="modal-pltBx"
	        uitype="middle"
	        header-title="원물입고 팔레트/박스 입고등록"
	        body-html-id="body-modal-pltBx"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup2.jsp"></jsp:include>
    </div>

    <!-- 리포트출력 Modal -->
    <div>
        <sbux-modal
	        id="modal-clipReport"
	        name="modal-clipReport"
	        uitype="large"
	        header-title="클립리포트"
	        body-html-id="body-modal-clipReport"
	        header-is-close-button="true"
	        footer-is-close-button="false"
	        style="width:95vw;height:80vh;"
        ></sbux-modal>
    </div>
    <div id="body-modal-clipReport">
    	<jsp:include page="../../am/popup/clipReportPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색

    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    var jsonRawMtrWghPlt	= [];
    var jsonRawMtrWghBx		= [];

    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회

    /* SBGrid Data (JSON) */
    var jsonWghPrfmnc = [];

    var jsonPltBxData = {};

    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

		const elements = document.querySelectorAll(".srch-keyup-area");

		for (let i = 0; i < elements.length; i++) {
		  	const el = elements.item(i);
		  	el.addEventListener("keyup", (event) => {
		  		if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
		  			fn_search();
		  		}
		  		//key	Enter
		  		//keyCode
		  	});
		}
	})

	const fn_init = async function() {
		fn_reset();
		fn_createWghPrfmncGrid();

		fn_initSBSelect();
		fn_getPrdcrs();
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	const fn_createWghPrfmncGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
        SBGridProperties.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'30px', style: 'text-align:center', userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["No."], ref: 'rowSeq', type:'output',  width:'50px', style:'text-align:right'},
        	{caption: ['계량번호'], ref: 'wghno', width: '120px', type: 'output', style:'text-align:center'},
            {caption: ['생산자'], ref: 'prdcrNm', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['품목'], ref: 'itemNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['상품구분'], ref: 'gdsSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['입고구분'], ref: 'wrhsSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['운송구분'], ref: 'trsprtSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['전체중량'], ref: 'wholWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['공차중량'], ref: 'emptVhclWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['감량%'], ref: 'rdcdRt', width: '60px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###.##'}},
            {caption: ['감량Kg'], ref: 'rdcdWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['실중량'], ref: 'actlWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['팔레트중량'], ref: 'pltWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['박스중량'], ref: 'bxWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['입고중량'], ref: 'wrhsWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['등급'], ref: 'grdNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['보관창고'], ref: 'warehouseSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['비고'], ref: 'rmrk', width: '300px', type: 'output'},
            {caption: ["APC코드"],	ref: 'apcCd',        	type:'output',  hidden: true},
            {caption: ["생산자코드"],	ref: 'prdcrCd',        	type:'output',  hidden: true},

        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
        grdWghPrfmnc.bind('click', fn_view);
    }

	/** common button action */

	/**
     * @name fn_docRawMtrWgh
     * @description 계량확인서 발행 버튼
     */
	const fn_docRawMtrWgh = function() {
		let wghno = SBUxMethod.get("dtl-inp-wghno");

		if (gfn_isEmpty(wghno)) {
			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
            return;
		}

		//
		/*
		if (!gfn_comConfirm("Q0001", "발행")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		 */

		popClipReport.modalView(
				"modal-clipReport",
				"계량확인서",
				"am/rawMtrWghDoc.crf",
				{apcCd: gv_selectedApcCd, wghno: wghno}
			);

		/*
		gfn_viewClipReport(
				"body-rpt-docRawMtrWgh",
				"am/rawMtrWghDoc.crf",
				{apcCd: gv_selectedApcCd, wghno: wghno}
			);
		 */
	}



	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
    	fn_setPltBx({
			pltData: [],
			bxData: [],
			pltQntt: 0,
			pltWght: 0,
			bxQntt: 0,
			bxWght: 0,
			totalQntt: 0,
			totalWght: 0
		});
	}

	/**
     * @name fn_delete
     * @description 삭제 버튼
	 */
	const fn_delete = async function() {

		const wghPrfmncList = [];

		const allData = grdWghPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				wghPrfmncList.push({
					apcCd: item.apcCd,
					wghno: item.wghno
				});
    		}
		});

		if (wghPrfmncList.length === 0) {
			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		console.log(wghPrfmncList);
		const postJsonPromise = gfn_postJSON("/am/wgh/deleteWghPrfmncList.do", wghPrfmncList);
		const data = await postJsonPromise;

        try {
			if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		//fn_inputClear();
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		// gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		let wghno = SBUxMethod.get("dtl-inp-wghno");					// 계량번호
		let wghYmd = SBUxMethod.get("dtl-dtp-wghYmd");					// 계량일자
		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");				// 생산자
		let itemCd = SBUxMethod.get("dtl-slt-itemCd");					// 품목
		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");					// 품종
		let wrhsSeCd = SBUxMethod.get("dtl-rdo-wrhsSeCd");				// 입고구분
		let gdsSeCd = SBUxMethod.get("dtl-rdo-gdsSeCd");				// 상품구분
		let trsprtSeCd = SBUxMethod.get("dtl-rdo-trsprtSeCd");			// 운송구분
		let warehouseSeCd = SBUxMethod.get("dtl-slt-warehouseSeCd");	// 창고
		let vhclno = SBUxMethod.get("dtl-inp-vhclno");					// 차량번호
		let grdCd = SBUxMethod.get("dtl-slt-grdCd");					// 등급
		let rmrk = SBUxMethod.get("dtl-inp-rmrk");				// 비고

		let wholWght = parseInt(SBUxMethod.get("dtl-inp-wholWght")) || 0;			// 전체중량
		let emptVhclWght = parseInt(SBUxMethod.get("dtl-inp-emptVhclWght")) || 0;	// 공차중량

		let rdcdRt = parseInt(SBUxMethod.get("dtl-inp-rdcdRt")) || 0;				// 감량률(%)
		let rdcdWght = parseInt(SBUxMethod.get("dtl-inp-rdcdWght")) || 0;			// 감량kg
		let actlWght = parseInt(SBUxMethod.get("dtl-inp-actlWght")) || 0;			// 실중량
		let wrhsWght = parseInt(SBUxMethod.get("dtl-inp-wrhsWght")) || 0;			// 입고중량

    	// validation check
    	if (gfn_isEmpty(wghYmd)) {
    		gfn_comAlert("W0001", "입고일자");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0002", "생산자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
    	if (gfn_isEmpty(itemCd)) {
    		gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(vrtyCd)) {
    		gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(wrhsSeCd)) {
    		gfn_comAlert("W0001", "입고구분");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(gdsSeCd)) {
    		gfn_comAlert("W0001", "상품구분");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(trsprtSeCd)) {
    		gfn_comAlert("W0001", "운송구분");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(warehouseSeCd)) {
    		gfn_comAlert("W0001", "창고");		//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(vhclno)) {
    		gfn_comAlert("W0002", "차량번호");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
    	if (gfn_isEmpty(grdCd)) {
    		gfn_comAlert("W0001", "등급");		//	W0001	{0}을/를 선택하세요.
            return;
    	}

    	if (wholWght <= 0) {
    		gfn_comAlert("W0002", "전체중량");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
    	if (wrhsWght <= 0) {
    		gfn_comAlert("W0005", "입고중량");		//	W0005	{0}이/가 없습니다.
            return;
    	}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const wghPrfmncDtlList = [];

    	if (!gfn_isEmpty(jsonPltBxData)) {
    		if (!gfn_isEmpty(jsonPltBxData.pltData)) {
    			jsonPltBxData.pltData.forEach((item, index) => {
        			const plt = {
            				apcCd: gv_selectedApcCd,
            				grdCd: grdCd,
            				pltBxSeCd: item.pltBxSeCd,
            				pltBxKnd: item.pltBxCd,
            				unitWght: item.unitWght,
            				qntt: item.qntt,
            				wght: item.kg
            			}
        			wghPrfmncDtlList.push(plt);
    			});
    		}
    		if (!gfn_isEmpty(jsonPltBxData.bxData)) {
    			jsonPltBxData.bxData.forEach((item, index) => {
        			const bx = {
            				apcCd: gv_selectedApcCd,
            				grdCd: grdCd,
            				pltBxSeCd: item.pltBxSeCd,
            				pltBxKnd: item.pltBxCd,
            				unitWght: item.unitWght,
            				qntt: item.qntt,
            				wght: item.kg
            			}
        			wghPrfmncDtlList.push(bx);
    			});
    		}
    	}

    	const rawMtrWgh = {
    		apcCd: gv_selectedApcCd,
    		wghno: wghno,
    		wghYmd: wghYmd,					// 계량일자
    		prdcrCd: prdcrCd,				// 생산자
    		itemCd: itemCd,					// 품목
    		vrtyCd: vrtyCd,					// 품종
    		wrhsSeCd: wrhsSeCd,				// 입고구분
    		gdsSeCd: gdsSeCd,				// 상품구분
    		trsprtSeCd: trsprtSeCd,			// 운송구분
    		warehouseSeCd: warehouseSeCd,	// 창고
    		vhclno: vhclno,					// 차량번호
    		grdCd: grdCd,					// 등급
    		rmrk: rmrk,						// 비고
    		wholWght: wholWght,				// 전체중량
    		emptVhclWght: emptVhclWght,		// 공차중량
    		rdcdRt: rdcdRt,					// 감량률(%)
    		rdcdWght: rdcdWght,				// 감량kg
    		actlWght: actlWght,				// 실중량
    		wrhsWght: wrhsWght,				// 입고중량
    		wghPrfmncDtlList: wghPrfmncDtlList
    	}

    	let postUrl = gfn_isEmpty(wghno) ? "/am/wgh/insertWghPrfmnc.do" : "/am/wgh/updateWghPrfmnc.do";

		const postJsonPromise = gfn_postJSON(postUrl, rawMtrWgh);
		const data = await postJsonPromise;

        try {
			if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		//fn_inputClear();
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

        // set pagination
    	grdWghPrfmnc.rebuild();
    	let pageSize = grdWghPrfmnc.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonWghPrfmnc.length = 0;
    	grdWghPrfmnc.clearStatus();
    	fn_setGrdWghPrfmnc(pageSize, pageNo);

		SBUxMethod.set("lbl-wghno", "");
		SBUxMethod.set("dtl-inp-wghno", "");
	}

	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

		// 계량번호
		SBUxMethod.set("lbl-wghno", "");
		SBUxMethod.set("dtl-inp-wghno", "");

		// 계량일자
		SBUxMethod.set("dtl-dtp-wghYmd", gfn_dateToYmd(new Date()));

		// 생산자
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-prdcrNm", "");

		// 품목
		SBUxMethod.set("dtl-slt-itemCd", null);
		// 품종
		SBUxMethod.set("dtl-slt-vrtyCd", null);
		// 입고구분
		SBUxMethod.set("dtl-rdo-wrhsSeCd", "3");
		// 상품구분
		SBUxMethod.set("dtl-rdo-gdsSeCd", "1");
		// 운송구분
		SBUxMethod.set("dtl-rdo-trsprtSeCd", "1");

		// 전체중량
		SBUxMethod.set("dtl-inp-wholWght", null);
		// 공차중량
		SBUxMethod.set("dtl-inp-emptVhclWght", null);
		// 감량 (%)
		SBUxMethod.set("dtl-inp-rdcdRt", null);
		// 감량kg
		SBUxMethod.set("dtl-inp-rdcdWght", null);
		// 실중량
		SBUxMethod.set("dtl-inp-actlWght", null);
		// 차량번호
		SBUxMethod.set("dtl-inp-vhclno", "");

		// 창고
		SBUxMethod.set("dtl-slt-warehouseSeCd", null);	// 창고
		// 등급
		SBUxMethod.set("dtl-slt-grdCd", null);
	}

    /**
     * @name fn_setGrdWghPrfmnc
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function(pageSize, pageNo) {

  		let wghYmd = SBUxMethod.get("dtl-dtp-wghYmd");		// 계량일자
  		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("dtl-slt-itemCd");		// 품목
  		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");		// 품종
  		let wrhsSeCd = SBUxMethod.get("dtl-rdo-wrhsSeCd");	// 입고구분
  		let gdsSeCd = SBUxMethod.get("dtl-rdo-gdsSeCd");	// 상품구분
  		let trsprtSeCd = SBUxMethod.get("dtl-rdo-trsprtSeCd");	// 운송구분

		const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			wghYmd: wghYmd,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			wrhsSeCd: wrhsSeCd,
			gdsSeCd: gdsSeCd,
			trsprtSeCd: trsprtSeCd,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghYmd: item.wghYmd,
  						vhclno: item.vhclno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						wholWght: item.wholWght,
  						emptVhclWght: item.emptVhclWght,
  						rdcdRt: item.rdcdRt,
  						actlWght: item.actlWght,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxWght: item.bxWght,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonWghPrfmnc.length > 0) {
          		if(grdWghPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdWghPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdWghPrfmnc.rebuild();
  				}else{
  					grdWghPrfmnc.refresh();
  				}
          	} else {
          		grdWghPrfmnc.setPageTotalCount(totalRecordCount);
          		grdWghPrfmnc.rebuild();
          	}

          	document.querySelector('#listCount').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

	const fn_view = async function() {

		let nCol = grdWghPrfmnc.getCol();

		const usrAttr = grdWghPrfmnc.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			if (usrAttr.colNm == "checkedYn") {
				// 체크박스 선택 시 action 없음
				return;
			}
		}

		let nRow = grdWghPrfmnc.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdWghPrfmnc.getRowData(nRow);

        const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmnc.do", {
         	apcCd: rowData.apcCd,
         	wghno: rowData.wghno,
         	delYn: 'N'
 		});

        const data = await postJsonPromise;

		try {
			if (gfn_isEmpty(data.resultMap) || gfn_isEmpty(data.resultMap.wghno)) {
				gfn_comAlert("W0005", "계량정보");		//	W0001	{0}이/가 없습니다.
	            return;
			}

			// 계량번호
			SBUxMethod.set("lbl-wghno", "계량번호 : " + rowData.wghno);
			SBUxMethod.set("dtl-inp-wghno", rowData.wghno);


			console.log("rowData", rowData);
			console.log("rowData.prdcrCd", rowData.prdcrCd);

			// 계량일자
			SBUxMethod.set("dtl-dtp-wghYmd", rowData.wghYmd);

			// 생산자
			SBUxMethod.set("dtl-inp-prdcrCd", rowData.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", rowData.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			// 입고구분
			SBUxMethod.set("dtl-rdo-wrhsSeCd", rowData.wrhsSeCd);
			// 상품구분
			SBUxMethod.set("dtl-rdo-gdsSeCd", rowData.gdsSeCd);
			// 운송구분
			SBUxMethod.set("dtl-rdo-trsprtSeCd", rowData.trsprtSeCd);

			// 전체중량
			SBUxMethod.set("dtl-inp-wholWght", rowData.wholWght);
			// 공차중량
			SBUxMethod.set("dtl-inp-emptVhclWght", rowData.emptVhclWght);
			// 감량 (%)
			SBUxMethod.set("dtl-inp-rdcdRt", rowData.rdcdRt);
			// 감량kg
			SBUxMethod.set("dtl-inp-rdcdWght", rowData.rdcdWght);
			// 실중량
			SBUxMethod.set("dtl-inp-actlWght", rowData.actlWght);
			// 차량번호
			SBUxMethod.set("dtl-inp-vhclno", rowData.vhclno);

			// 품목
			// SBUxMethod.set("dtl-slt-itemCd", wghInfo.itemCd);
			// 품종
			// SBUxMethod.set("dtl-slt-vrtyCd", wghInfo.vrtyCd);
			await gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("dtl-slt-vrtyCd", rowData.vrtyCd);
			await fn_onChangeSrchVrtyCd({value: rowData.vrtyCd});

			// 창고
			SBUxMethod.set("dtl-slt-warehouseSeCd", rowData.warehouseSeCd);	// 창고
			// 등급
			SBUxMethod.set("dtl-slt-grdCd", rowData.grdCd);

			const wghInfo = data.resultMap;
			// 팔레트 박스 정보
			const pltData = [];
			const bxData = [];
			let pltQntt = 0;
			let pltWght = 0;
			let bxQntt = 0;
			let bxWght = 0;

			if (!gfn_isEmpty(wghInfo.wghPrfmncDtlList)) {

				wghInfo.wghPrfmncDtlList.forEach((item, index) => {

					const pltBx = {
							pltBxSeCd: item.pltBxSeCd,
							pltBxCd: item.pltBxKnd,
							pltBxNm: item.pltBxNm,
							qntt: item.qntt,
							unitWght: item.unitWght,
							wght: item.wght,
							kg: item.cnvrtWght,
							unitCd: item.unitCd,
							unitNm: item.unitNm,
							delYn: item.delYn
					}

					if (item.pltBxSeCd == "P") {
						pltQntt += parseInt(item.qntt) || 0;
						pltWght += parseInt(item.cnvrtWght) || 0;
						pltData.push(pltBx);
					}

					if (item.pltBxSeCd == "B") {
						bxQntt += parseInt(item.qntt) || 0;
						bxWght += parseInt(item.cnvrtWght) || 0;
						bxData.push(pltBx);
					}
				});
			}

			const jsonPltBxDataTemp = {
					pltData: pltData,
					bxData: bxData,
					pltQntt: pltQntt,
					pltWght: pltWght,
					bxQntt: bxQntt,
					bxWght: bxWght,
					totalQntt: pltQntt + bxQntt,
					totalWght: pltWght + bxWght
				}

			fn_setPltBx(jsonPltBxDataTemp);

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	/** ui event */

	const fn_onChangeApc = async function() {
		jsonPltBxData = {};
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		console.log("onchanged itemCd");
		let itemCd = obj.value;

		// 품종은 필터처리
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
			gfn_setApcGrdsSBSelect('dtl-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

		const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("dtl-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("dtl-slt-vrtyCd", vrtyCd);
		}
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("dtl-inp-prdcrCd", value);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		console.log("jsonPrdcr", jsonPrdcr);
		console.log("prdcr", prdcr);
		fn_setPrdcrForm(prdcr);
	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}

		if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
			SBUxMethod.set("dtl-rdo-wrhsSeCd", prdcr.wrhsSeCd);
		}
		if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
			SBUxMethod.set("dtl-rdo-gdsSeCd", prdcr.gdsSeCd);
		}
		if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
			SBUxMethod.set("dtl-rdo-trsprtSeCd", prdcr.trsprtSeCd);
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("dtl-inp-vhclno", prdcr.vhclno);
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
			SBUxMethod.set("dtl-inp-vhclno", vhcl.vhclno);
		}
	}

	/**
	 * @name fn_choicePltBx
	 * @description 팔레트/박스 선택 팝업
	 */
	const fn_choicePltBx = function() {
		popPltBx.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPltBx, jsonPltBxData);
	}

	/**
	 * @name fn_setPltBx
	 * @description 팔레트/박스 선택 Callback
	 */
	const fn_setPltBx = function(_pltBxData) {

		if (!gfn_isEmpty(_pltBxData)) {
			jsonPltBxData = gfn_cloneJson(_pltBxData);

			// 팔레트/박스 Kg set
			SBUxMethod.set("dtl-inp-pltWght", _pltBxData.pltWght);
			SBUxMethod.set("dtl-inp-bxWght", _pltBxData.bxWght);
			//정산중량 Kg set
			fn_setWght();
		}
	}

	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeWholWght = function() {
		// 전체중량 >> 감량, 실중량, 입고중량
		fn_setWght();
	}
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeEmptVhclWght = function() {
		// 공차중량 >> 감량, 실중량, 입고중량
		fn_setWght();
	}
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeRdcdRt = function() {
		// 감량(%) >> 감량, 실중량, 입고중량
		fn_setWght();
	}

	/**
	 * @name fn_setWght
	 * @description 입고중량 계산
	 */
	const fn_setWght = function() {

		const wholWght = parseInt(SBUxMethod.get("dtl-inp-wholWght")) || 0;
		const emptVhclWght = parseInt(SBUxMethod.get("dtl-inp-emptVhclWght")) || 0;
		const rdcdRt = parseInt(SBUxMethod.get("dtl-inp-rdcdRt")) || 0;
		const pltWght = parseInt(SBUxMethod.get("dtl-inp-pltWght")) || 0;
		const bxWght = parseInt(SBUxMethod.get("dtl-inp-bxWght")) || 0;

		// 실중량
		const actlWght = wholWght - emptVhclWght;
		// 감량(kg)
		const rdcdWght = Math.round(actlWght * rdcdRt / 100);
		// 정산중량(입고중량)
		const wrhsWght = actlWght - rdcdWght - pltWght - bxWght;

		SBUxMethod.set("dtl-inp-actlWght", actlWght);	// 실중량
		SBUxMethod.set("dtl-inp-rdcdWght", rdcdWght);	// 감량(kg)
		SBUxMethod.set("dtl-inp-wrhsWght", wrhsWght);	// 정산중량(입고중량)
	}

	//const cloneObj = obj => JSON.parse(JSON.stringify(obj));
</script>
</html>