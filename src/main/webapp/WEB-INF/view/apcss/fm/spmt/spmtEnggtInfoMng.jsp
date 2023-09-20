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
	<section class="content container-fluid">
		<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title" style="line-height: 30px;">▶출하약정계획관리</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
			<div class="box-body">
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
							<th scope="row">출자출하조직</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<th scope="row">생산유통통합조직</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<th scope="row">품목/품종</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item00" name="srch-slt-item" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item01" name="srch-slt-item" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row">출하기간</th>
							<td colspan="3" class="td_input"  style="border-right: hidden;">
								<div style="display: flex;">
									<sbux-datepicker id="srch-inp-enggtYmd2" name="srch-inp-enggtYmd2" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
									<span>~</span>
									<sbux-datepicker id="srch-inp-enggtYmd3" name="srch-inp-enggtYmd3" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
								</div>
							</td>

							<th scope="row">출하방법</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct00" name="srch-slt-spcfct" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<th scope="row">취급방법</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct01" name="srch-slt-spcfct" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>

						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>출하약정계획 내역</span></li>
						</ul>
					</div>

					<div id="sb-area-grdSpmtCmndTrgtDsctn" style="height:150px;"></div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>출하약정계획 상세내역</span></li>
						</ul>
					</div>
				<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 9.5%">
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
							<th scope="row">기초생산자조직</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">

								<sbux-input id="dtl-inp-apcCd" name="dtl-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-pckgSn" name="dtl-inp-pckgSn" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-apcNm" name="dtl-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-apc" name="srch-btn-apc" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-apc" onclick="fn_choiceApc"/>
							</td>
					  		<th scope="row">기초생산자조직 대표자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-prdcrNm" name="dtl-inp-prdcrNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>

							<td style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr1" name="srch-btn-prdcr1" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_choicePrdcr"/>
							</td>
							<th scope="row">조직원수</th>
							<td colspan="3" class="td_input" >
								<sbux-input id="dtl-inp-prdcrNum" name="dtl-inp-prdcrNum" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
						</tr>


						<tr>
						    <th scope="row">품목명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" class="form-control input-sm"  jsondata-ref="jsonApcItem" unselected-text="선택"></sbux-select>
							</td>
								<th scope="row">총재배면적</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cltvtnArea" name="dtl-inp-cltvtnArea" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
							</td>
							<th scope="row">재배품종</th>
							<td colspan="3" class="td_input">
								<sbux-select id="dtl-slt-vrtyCd" name="dtl-slt-vrtyCd" uitype="single" class="form-control input-sm"  jsondata-ref="jsonApcVrty" unselected-text="선택"></sbux-select>
							</td>
						</tr>
						<tr>
						    <th scope="row">출하품종</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-spmtCd" name="dtl-slt-spmtCd" uitype="single" class="form-control input-sm" jsondata-ref="jsonApcVrty" unselected-text="선택"></sbux-select>
							</td>
							<th scope="row">생산량</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdctnQntt" name="dtl-inp-prdctnQntt" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<th scope="row">출하량</th>
							<td colspan="3" class="td_input">
								<sbux-input id="dtl-inp-spmtQntt" name="dtl-inp-spmtQntt" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
						</tr>
						<tr>
						    <th scope="row">출하기간</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display: flex;">
									<sbux-datepicker id="dtl-inp-spmtStrDt" name="dtl-inp-spmtStrDt" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
									<span>~</span>
									<sbux-datepicker id="dtl-inp-spmtEndDt" name="dtl-inp-spmtEndDt" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
								</div>
							</td>

							<th scope="row">세부사항</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-enggtVlm" name="srch-inp-enggtVlm" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-cnpt06" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="첨부" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td colspan="4" class="td_input"></td>
						</tr>
						<tr>
						    <th scope="row">출하방법</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-spmtType" name="dtl-slt-spmtType" uitype="single" class="form-control input-sm" unselected-text="선택">
									<option-item value="유형1">유형1</option-item>
									<option-item value="유형2">유형2</option-item>
									<option-item value="유형3">유형3</option-item>
								</sbux-select>
							</td>
							<th scope="row">취급방법</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-trmtType" name="dtl-slt-trmtType" uitype="single" class="form-control input-sm" unselected-text="선택">
									<option-item value="유형1">유형1</option-item>
									<option-item value="유형2">유형2</option-item>
									<option-item value="유형3">유형3</option-item>
								</sbux-select>
							</td>
							<th scope="row">품질등급</th>
							<td colspan="3" class="td_input">
								<sbux-input id="srch-inp-enggtVlm" name="srch-inp-enggtVlm" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
						</tr>
						<tr>
						    <th scope="row">가격</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-enggtYmd" name="srch-inp-enggtYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<th scope="row">가격공시</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-spcfct-cd" name="srch-spcfct-cd" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<th scope="row">단위</th>
							<td colspan="3" class="td_input" >
								<sbux-input id="srch-inp-enggtVlm" name="srch-inp-enggtVlm" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
						</tr>
						<tr>
						    <th scope="row">대금지급</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-enggtYmd" name="srch-inp-enggtYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<th scope="row">특기사항</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-spcfct-cd" name="srch-spcfct-cd" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<th scope="row">선급금</th>
							<td colspan="3" class="td_input">
								<sbux-input id="srch-inp-enggtVlm" name="srch-inp-enggtVlm" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="11" class="td_input" >
								<sbux-input id="srch-inp-RMRK" name="srch-inp-RMRK" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
						</tr>

					</tbody>
				</table>

				<sbux-input id="dtl-input-gbnKey" name="dtl-input-gbnKey" uitype="hidden"></sbux-input>

				</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>조직원생산자</span></li>
						</ul>
						<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class='btn btn-sm btn-outline-danger' onClick="fn_procRowPrdcr('ADD')"></sbux-button>
						<sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class='btn btn-sm btn-outline-danger' onClick="fn_procRowPrdcr('DEL')"></sbux-button>
					</div>

		            <div class="sbt-wrap-body">
		               <div class="sbt-grid">
						<div id="sb-area-grdSpmtCmndTrgtDsctn1" style="height:150px;"></div>
		               </div>
		            </div>




			</div>
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>

    <!-- APC 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-apc"
        	name="modal-apc"
        	uitype="middle"
        	header-title="APC명 선택"
        	body-html-id="body-modal-apc"
        	footer-is-close-button="false"
        	style="width:800px"
       	></sbux-modal>
    </div>
    <div id="body-modal-apc">
    	<jsp:include page="../popup/apcPopup.jsp"></jsp:include>
    </div>

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


</body>
<script type="text/javascript">

	// ${comMenuVO.menuId}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_createGrid();
    	fn_search();
    	fn_createGrid1();
    	gfn_setComCdSBSelect(
    			['srch-select-msgKnd', 'dtl-select-msgKnd'],
    			jsonComMsgKnd,
			'MSG_KND');
    });

    //grid 초기화
    var grdComMsgList; // 그리드를 담기위한 객체 선언
    var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
	    SBGridProperties.id = 'grdComMsgList';
	    SBGridProperties.jsonref = 'jsonComMsgList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["출하유형"],	 ref: 'spmtType',      type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["취급유형"], 	 ref: 'trmtType',     	type:'output',   width:'15%',    style:'text-align:center'},
            {caption: ["품목명"],   	 ref: 'itemNm',    type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["재배면적"],    ref: 'cltvtnArea',        type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["재배품종"], 	 ref: 'vrtyNm',   type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["생산량"],	     ref: 'prdctnQntt', type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["출하량"],      ref: 'spmtQntt',   type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}
        ];

        grdComMsgList = _SBGrid.create(SBGridProperties);
        grdComMsgList.bind('click', 'fn_view');
        grdComMsgList.bind('beforepagechanged', 'fn_pagingComMsgList');
    }

    //grid1 초기화
    var grdComMsgList1; // 그리드를 담기위한 객체 선언
    var jsonComMsgList1 = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid1() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn1';
	    SBGridProperties.id = 'grdComMsgList1';
	    SBGridProperties.jsonref = 'jsonComMsgList1';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["성명"],	 ref: 'prdcrNm',      type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["품목"], 	 ref: 'itemNm',     	type:'output',   width:'15%',    style:'text-align:left'},
            {caption: ["품종"],   	 ref: 'vrtyNm',    type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["재배면적"],    ref: 'cltvtnArea',        type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["생산량"], 	 ref: 'prdctnQntt',   type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["출하량"],	     ref: 'spmtQntt', type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["서명"],      ref: 'updUserId1',   type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["최종변경일시"],  ref: 'updDateTime1', type:'output',  hidden: true},
            {caption: ["등록프로그램"],  ref: 'creProgram1',  type:'output',  hidden: true},
            {caption: ["변경프로그램"],  ref: 'updProgram1',  type:'output',  hidden: true}
        ];

        grdComMsgList1 = _SBGrid.create(SBGridProperties);
        grdComMsgList1.bind('click', 'fn_view');
        grdComMsgList1.bind('beforepagechanged1', 'fn_pagingComMsgList1');
    }

  //APC명 선택 popup
    const fn_choiceApc = function() {
		popApc.init(gv_selectedApcCd, gv_selectedApcNm, fn_setApc);
	}

	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set("dtl-inp-apcCd", apc.apcCd);
			SBUxMethod.set("dtl-inp-apcNm", apc.apcNm);
			SBUxMethod.attr("dtl-inp-apcNm", "style", "background-color:aquamarine");	//skyblue

			gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, apc.apcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, apc.apcCd),	// 품종
			gfn_setApcVrtySBSelect('dtl-slt-spmtCd', jsonApcVrty, apc.apcCd)	// 품종

		}
	}


    /**
     * 목록 조회
     */
    const fn_search = async function() {


    	fn_setGrdComMsgList();
    }

    /**
     *
     */
    const fn_pagingComMsgList = async function() {
    	fn_setGrdComMsgList();
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdComMsgList = async function(pageSize, pageNo) {

    	// form clear
    	fn_clearForm();

		grdComMsgList.clearStatus();

        const postJsonPromise = gfn_postJSON("/fm/spmt/selectSpmtEnggtInfoMngList.do", {

		});

        const data = await postJsonPromise;

        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonComMsgList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					apcCd: item.apcCd,
					apcNm: item.apcNm,
					pckgSn: item.pckgSn,
					spmtType: item.spmtType,
					trmtType: item.trmtType,
					itemCd: item.itemCd,
					itemNm: item.itemNm,
					vrtyCd: item.vrtyCd,
					vrtyNm: item.vrtyNm,
					prdcrCd:item.prdcrCd,
					prdcrNm:item.prdcrNm,
					cltvtnArea: item.cltvtnArea,
					prdctnQntt: item.prdctnQntt,
					spmtQntt: item.spmtQntt,
					rmrk: item.rmrk,
					sysFrstInptDt: item.sysFrstInptDt,
					sysFrstInptUserId: item.sysFrstInptUserId,
					sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,
					sysLastChgDt: item.sysLastChgDt,
					sysLastChgUserId: item.sysLastChgUserId,
					sysLastChgPrgrmId: item.sysLastChgPrgrmId
				}
				jsonComMsgList.push(msg);

				totalRecordCount = data.resultList.length;
			});

        	if (jsonComMsgList.length > 0) {

        		if(grdComMsgList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdComMsgList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdComMsgList.rebuild();
				}else{
					grdComMsgList.refresh()
				}
        	} else {
        		grdComMsgList.setPageTotalCount(totalRecordCount);
        		grdComMsgList.rebuild();
        	}


        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }


    //신규 작성
    function fn_create() {
    	SBUxMethod.set("dtl-input-gbnKey", null);
    	SBUxMethod.set("dtl-inp-apcCd", null);
    	SBUxMethod.set("dtl-inp-apcNm", null);
        SBUxMethod.set("dtl-inp-prdcrCd", null);
        SBUxMethod.attr("dtl-inp-prdcrNm", null);
        SBUxMethod.set("dtl-slt-itemCd", null);
        SBUxMethod.set("dtl-inp-cltvtnArea", null);
        SBUxMethod.set("dtl-slt-vrtyCd", null);
        SBUxMethod.set("dtl-slt-spmtCd", null);
        SBUxMethod.set("dtl-inp-prdctnQntt", null);
        SBUxMethod.set("dtl-inp-spmtQntt", null);
        SBUxMethod.set("dtl-inp-spmtStrDt", null);
        SBUxMethod.set("dtl-inp-spmtEndDt", null);
        SBUxMethod.set("dtl-slt-spmtType", null);
        SBUxMethod.set("dtl-slt-trmtType", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("dtl-input-gbnKey", null);
    	SBUxMethod.set("dtl-inp-apcCd", null);
    	SBUxMethod.set("dtl-inp-apcNm", null);
        SBUxMethod.set("dtl-inp-prdcrCd", null);
        SBUxMethod.attr("dtl-inp-prdcrNm", null);
        SBUxMethod.set("dtl-slt-itemCd", null);
        SBUxMethod.set("dtl-inp-cltvtnArea", null);
        SBUxMethod.set("dtl-slt-vrtyCd", null);
        SBUxMethod.set("dtl-slt-spmtCd", null);
        SBUxMethod.set("dtl-inp-prdctnQntt", null);
        SBUxMethod.set("dtl-inp-spmtQntt", null);
        SBUxMethod.set("dtl-inp-spmtStrDt", null);
        SBUxMethod.set("dtl-inp-spmtEndDt", null);
        SBUxMethod.set("dtl-slt-spmtType", null);
        SBUxMethod.set("dtl-slt-trmtType", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }

    //저장
    const fn_save = async function() {

    	let gbnKey = SBUxMethod.get("dtl-input-gbnKey"); //insert, update 구분 키



    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-apcNm"))) {
            alert("기초생산자조직을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-prdcrNm"))) {
            alert("기초생산자조직 대표자를 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-slt-itemCd"))) {
            alert("품목을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-cltvtnArea"))) {
            alert("재배면적을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-slt-vrtyCd"))) {
            alert("재배품종을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-slt-spmtCd"))) {
            alert("출하품종을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-prdctnQntt"))) {
            alert("생산량을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-spmtQntt"))) {
            alert("출하량을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-spmtStrDt"))) {
            alert("출하기간을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-spmtEndDt"))) {
            alert("출하기간을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-slt-spmtType"))) {
            alert("출하방법을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-slt-trmtType"))) {
            alert("취급방법을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(gbnKey)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (isConfirmed){

    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/spmt/insertSpmtEnggtInfoMng.do", {
			apcCd: SBUxMethod.get('dtl-inp-apcCd'),
			prdcrCd: SBUxMethod.get('dtl-inp-prdcrCd'),
			itemCd: SBUxMethod.get('dtl-slt-itemCd'),
			vrtyCd: SBUxMethod.get('dtl-slt-vrtyCd'),
			prdctnQntt: SBUxMethod.get('dtl-inp-prdctnQntt'),
			spmtQntt: SBUxMethod.get('dtl-inp-spmtQntt'),
			cltvtnArea: SBUxMethod.get('dtl-inp-cltvtnArea'),
			spmtType: SBUxMethod.get('dtl-slt-spmtType'),
			trmtType: SBUxMethod.get('dtl-slt-trmtType'),
			spmtStrDt: SBUxMethod.get('dtl-inp-spmtStrDt'),
			spmtEndDt: SBUxMethod.get('dtl-inp-spmtEndDt')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }

        // 결과 확인 후 재조회
        console.log("insert result", data);
    }

	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){

		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/spmt/updateSpmtEnggtInfoMng.do", {
			msgKey: SBUxMethod.get('dtl-input-orgnMsgKey'),
			msgKnd: SBUxMethod.get('dtl-select-msgKnd'),
			msgCn: SBUxMethod.get('dtl-input-msgCn'),
			rmrk: SBUxMethod.get('dtl-input-rmrk')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }

        // 결과 확인 후 재조회
        console.log("update result", data);
    }


    //선택 삭제
    function fn_delete() {

    	/**
         * @type {any[]}
         */
        let list = [];

        /**
         * @type {any[]}
         */
        const rows = grdComMsgList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({msgKey: row.msgKey});
        	}
        });

        if (list.length == 0) {
        	alert("삭제할 대상이 없습니다.");
        	return;
        }

        fn_subDelete(confirm("삭제 하시겠습니까?"), list);

        /*
        for ( let i = 0; i < gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].msgKey);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg;
        if (delList.length == 1) {
            delMsg = delList[0];
        }
        else {
            delMsg = delList.length + "건";
        }
        delMsg += "을 삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delKey=" + delList.join(",");
            console.log("data ::::: " + params);
        }
        */
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){

 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/spmt/deleteSpmtEnggtInfoMng.do", list);

         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
         		alert("처리 되었습니다.");
         		fn_search();
         	} else {
         		alert(data.resultMessage);
         	}
         } catch(e) {
         }

         // 결과 확인 후 재조회
         console.log("update result", data);
    }

    //상세정보 보기
    function fn_view() {

    	var nCol = grdComMsgList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdComMsgList.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = grdComMsgList.getRowData(nRow);

        SBUxMethod.set("dtl-inp-apcCd", rowData.apcCd);
    	SBUxMethod.set("dtl-inp-apcNm", rowData.apcNm);
    	SBUxMethod.set("dtl-inp-pckgSn", rowData.pckgSn);
        SBUxMethod.set("dtl-inp-prdcrCd", rowData.prdcrCd);
        SBUxMethod.attr("dtl-inp-prdcrNm", rowData.prdcrNm);
        SBUxMethod.set("dtl-slt-itemCd", rowData.itemCd);
        SBUxMethod.set("dtl-slt-itemNm", rowData.itemNm);
        SBUxMethod.set("dtl-inp-cltvtnArea", rowData.cltvtnArea);
        SBUxMethod.set("dtl-slt-vrtyCd", rowData.vrtyCd);
        SBUxMethod.set("dtl-slt-vrtyNm", rowData.vrtyNm);
        SBUxMethod.set("dtl-slt-spmtCd", rowData.spmtCd);
        SBUxMethod.set("dtl-inp-prdctnQntt", rowData.prdctnQntt);
        SBUxMethod.set("dtl-inp-spmtQntt", rowData.spmtQntt);
        SBUxMethod.set("dtl-inp-spmtStrDt", rowData.spmtStrDt);
        SBUxMethod.set("dtl-inp-spmtEndDt", rowData.spmtEndDt);
        SBUxMethod.set("dtl-slt-spmtType", rowData.spmtType);
        SBUxMethod.set("dtl-slt-trmtType", rowData.trmtType);
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdComMsgList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdComMsgList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

    /**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup
	 */
	const fn_choicePrdcr = function() {
		var apcChk = SBUxMethod.get("dtl-inp-apcNm");
		if(gfn_isEmpty(apcChk)) {
			SBUxMethod.attr("srch-btn-prdcr1","data-target","");
			alert('APC명을 선택해주세요.');
			return;
		} else {
			var dtlApcCd = SBUxMethod.get("dtl-inp-apcCd");
			SBUxMethod.attr("srch-btn-prdcr1","data-target","#modal-prdcr");
			popPrdcr.init(dtlApcCd, apcChk, fn_setPrdcr); //관리자 전용 화면이라 gv_selectedApcCd를 사용안하고 별도의 변수 만듦
		}
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsVrtyCd);
			SBUxMethod.set("dtl-slt-spmtCd", prdcr.rprsVrtyCd);

			//fn_setPrdcrForm(prdcr);
		}
	}

	// 행 삭제 및 추가
	async function fn_procRowPrdcr(type){
		if (type == "ADD"){
			grdComMsgList1.addRow(true, {delYn:'N'});
			grdComMsgList1.setCellData(grdComMsgList1.getGridDataAll().length, 0, true);
		}
		else{
			for(var i=0; i<grdComMsgList1.getGridDataAll().length; i++){
				if(grdComMsgList1.getGridDataAll()[i].checked == "true"){
					if (grdComMsgList1.getGridDataAll()[i].prdcrNm == "" || grdComMsgList1.getGridDataAll()[i].prdcrNm == null){
						grdComMsgList1.deleteRow(i+1);
						i--;
					}
				}
			}
		}
	}

</script>
</html>