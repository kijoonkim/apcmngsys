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
				<h3 class="box-title" style="line-height: 30px;">▶ ${comMenuVO.menuNm}</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->

				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden"></sbux-input>
<!-- 				<table class="table table-bordered tbl_row tbl_fixed"> -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">약정일자</th>
							<td colspan="4" class="td_input"  style="border-right: hidden;">
								<div style="display: flex;">
									<sbux-datepicker id="srch-inp-enggtSrtYmd" name="srch-inp-enggtSrtYmd" uitype="popup" class="form-control input-sm input-sm-ast" style="margin-right:5px;"></sbux-datepicker>
									<span>~</span>
									<sbux-datepicker id="srch-inp-enggtEndYmd" name="srch-inp-enggtEndYmd" uitype="popup" class="form-control input-sm input-sm-ast" style="margin-left:5px;"></sbux-datepicker>
								</div>
							</td>


							<th scope="row">품목/품종</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td colspan="3"></td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>재배약정계획 내역</span></li>
						</ul>
					</div>

					<div id="sb-area-grdSpmtCmndTrgtDsctn" style="height:250px;"></div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>재배약정계획 상세내역</span></li>
						</ul>
					</div>
<!-- 				<table class="table table-bordered tbl_row tbl_fixed"> -->
				<table class="table table-bordered tbl_fixed">
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
							<th scope="row"><span class="data_required" ></span>APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-apcCd" name="dtl-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-apcNm" name="dtl-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td style="border-left: hidden;">
								<sbux-button id="srch-btn-apcNm" name="srch-btn-apcNm" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-apc" onclick="fn_choiceApc"/>
							</td>
					  		<th scope="row"><span class="data_required" ></span>생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdcrNm" name="dtl-inp-prdcrNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr1" name="srch-btn-prdcr1" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_choicePrdcr"/>
							</td>
							<th scope="row"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-itemNm" name="dtl-inp-itemNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="dtl-inp-itemCd" name="dtl-inp-itemCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;" >
								<sbux-input id="dtl-inp-vrtyNm" name="dtl-inp-vrtyNm" uitype="text"  class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="dtl-inp-vrtyCd" name="dtl-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
						    <th scope="row"><span class="data_required" ></span>약정일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-inp-enggtYmd" name="dtl-inp-enggtYmd" uitype="popup" class="form-control input-sm input-sm-ast"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>
							<th scope="row"><span class="data_required" ></span>약정수량</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-enggtVlm" name="dtl-inp-enggtVlm" uitype="text" class="form-control input-sm" placeholder="" title=""
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td colspan="1" scope="row"> &nbsp;</th>
							<th class="td_input" scope="row"><span class="data_required" ></span>예상수확량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-expctHrvstQntt" name="dtl-inp-expctHrvstQntt" uitype="text" class="form-control input-sm" placeholder="" title=""
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							<td class="td_input" style="border-right: hidden;">Kg</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="9" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
								<sbux-input id="dtl-inp-reqCd" name="dtl-inp-reqCd" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-reqNm" name="dtl-inp-reqNm" uitype="hidden"></sbux-input>
							</td>
							<td></td>
						</tr>

					</tbody>
				</table>
				<sbux-input id="dtl-input-gbnKey" name="dtl-input-gbnKey" uitype="hidden"></sbux-input>
				<sbux-input id="dtl-inp-reqSn" name="dtl-inp-reqSn" uitype="hidden"></sbux-input>


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

	var jsonPltBxData = {};

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_createGrid();
    	fn_search();

    	gfn_setComCdSBSelect(
    			['srch-select-msgKnd', 'dtl-select-msgKnd'],
    			jsonComMsgKnd,
			'MSG_KND');
    });

    const fn_onChangeApc = async function() {
		jsonPltBxData = {};
		//fn_clearPrdcr();
		fn_initSBSelect();
		//fn_getPrdcrs();
	}

	 /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			//gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}

    //grid 초기화
    var grdCltvtnEnggtList; // 그리드를 담기위한 객체 선언
    var jsonCltvtnEnggtList = []; // 그리드의 참조 데이터 주소 선언


    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
	    SBGridProperties.id = 'grdCltvtnEnggtList';
	    SBGridProperties.jsonref = 'jsonCltvtnEnggtList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

        	{caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',  width:'5%',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["생산자"],	   ref: 'prdcrNm',      type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["품목"], 	   ref: 'itemNm',     	type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["품종"],     ref: 'vrtyNm',    type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["약정일자"],  ref: 'enggtYmd',        type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["약정수량"],  ref: 'enggtVlm',   type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["예상수확량"], ref: 'expctHrvstQntt', type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["진행구분"], ref: 'reqNm', type:'output',  width:'11%',    style:'text-align:center'},
            {caption: ["최종변경자ID"], ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}
        ];

        grdCltvtnEnggtList = _SBGrid.create(SBGridProperties);
        grdCltvtnEnggtList.bind('click', 'fn_view');
        grdCltvtnEnggtList.bind('beforepagechanged', 'fn_pagingCltvtnEnggtList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	fn_setGrdCltvtnEnggtList();
    }

    /**
     *
     */
    const fn_pagingCltvtnEnggtList = async function() {
    	fn_setGrdCltvtnEnggtList();
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdCltvtnEnggtList = async function() {

    	// form clear
    	fn_clearForm();

		grdCltvtnEnggtList.clearStatus();

		//var apcCd = SBUxMethod.get("gsb-slt-apcCd");
		//var apcCd = SBUxMethod.get("gv_selectedApcSeCd");
		var enggtSrtYmd = SBUxMethod.get("srch-inp-enggtSrtYmd");
		var enggtEndYmd = SBUxMethod.get("srch-inp-enggtEndYmd");
		var itemCd = SBUxMethod.get("srch-slt-itemCd");
		var vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
//alert(apcCd);
        const postJsonPromise = gfn_postJSON("/fm/clt/selectCltvtnEnggtAplyMngList.do", {
        	//apcCd: apcCd,
        	apcCd: gv_selectedApcCd,
        	enggtSrtYmd: enggtSrtYmd,
        	enggtEndYmd: enggtEndYmd,
        	itemCd: itemCd,
        	vrtyCd: vrtyCd
		});

        const data = await postJsonPromise;

        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonCltvtnEnggtList.length = 0;
        	data.resultList.forEach((item, index) => {
				const cltvtnEnggtList = {
					apcCd: item.apcCd,
					apcNm: item.apcNm,
					prdcrCd: item.prdcrCd,
					prdcrNm: item.prdcrNm,
					frmerNm: item.frmerNm,
					reqSn: item.reqSn,
					itemCd: item.itemCd,
					itemNm: item.itemNm,
					vrtyCd: item.vrtyCd,
					vrtyNm: item.vrtyNm,
					reqCd: item.reqCd,
					reqNm: item.reqNm,
					enggtVlm: item.enggtVlm,
					enggtYmd: fn_dateFormat(item.enggtYmd),
					expctHrvstQntt: item.expctHrvstQntt,
					rmrk: item.rmrk,
					sysFrstInptDt: item.sysFrstInptDt,
					sysFrstInptUserId: item.sysFrstInptUserId,
					sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,
					sysLastChgDt: item.sysLastChgDt,
					sysLastChgUserId: item.sysLastChgUserId,
					sysLastChgPrgrmId: item.sysLastChgPrgrmId
				}
				jsonCltvtnEnggtList.push(cltvtnEnggtList);

				totalRecordCount = data.resultList.length;

			});

        	if (jsonCltvtnEnggtList.length > 0) {

        		if(grdCltvtnEnggtList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdCltvtnEnggtList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdCltvtnEnggtList.rebuild();
				}else{
					grdCltvtnEnggtList.refresh()
				}
        	} else {
        		grdCltvtnEnggtList.setPageTotalCount(totalRecordCount);
        		grdCltvtnEnggtList.rebuild();
        	}

        	//document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

     //Date format 변경
     function fn_dateFormat(date) {
    	 var rtnDate = date.substr(0,4) + '/' + date.substr(4,2) + '/' + date.substr(6,2);
    	 return rtnDate;
     }


    //신규 작성
    function fn_create() {
    	SBUxMethod.set("dtl-input-gbnKey", null);
        SBUxMethod.set('dtl-inp-apcCd', gv_selectedApcCd),
        SBUxMethod.set('dtl-inp-apcNm', gv_selectedApcNm),
        SBUxMethod.set('dtl-inp-prdcrCd', null),
        SBUxMethod.set('dtl-inp-prdcrNm', null),
        SBUxMethod.set('dtl-inp-itemCd', null),
        SBUxMethod.set('dtl-inp-itemNm', null),
        SBUxMethod.set('dtl-inp-vrtyCd', null),
        SBUxMethod.set('dtl-inp-vrtyNm', null),
        SBUxMethod.set('dtl-inp-enggtVlm', null),
        SBUxMethod.set('dtl-inp-expctHrvstQntt', null),
        SBUxMethod.set('dtl-inp-enggtYmd', null),
        SBUxMethod.set('dtl-inp-rmrk', ''),
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);

        SBUxMethod.attr("srch-btn-apcNm","disabled",false);
        SBUxMethod.attr("srch-btn-prdcr1","disabled",false);
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("dtl-input-gbnKey", null);
    	SBUxMethod.set('dtl-inp-apcCd', gv_selectedApcCd),
        SBUxMethod.set('dtl-inp-apcNm', gv_selectedApcNm),
        SBUxMethod.set('dtl-inp-prdcrCd', null),
        SBUxMethod.set('dtl-inp-prdcrNm', null),
        SBUxMethod.set('dtl-inp-itemCd', null),
        SBUxMethod.set('dtl-inp-itemNm', null),
        SBUxMethod.set('dtl-inp-vrtyCd', null),
        SBUxMethod.set('dtl-inp-vrtyNm', null),
        SBUxMethod.set('dtl-inp-enggtVlm', null),
        SBUxMethod.set('dtl-inp-expctHrvstQntt', null),
        SBUxMethod.set('dtl-inp-enggtYmd', null),
        SBUxMethod.set('dtl-inp-rmrk', ''),
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);

        SBUxMethod.attr("srch-btn-apcNm","disabled",false);
        SBUxMethod.attr("srch-btn-prdcr1","disabled",false);
    }

    //저장
    const fn_save = async function() {

    	let gbnKey = SBUxMethod.get("dtl-input-gbnKey"); //insert, update 구분 키

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-apcNm"))) {
            alert("APC 명을 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-prdcrNm"))) {
            alert("생산자를 선택하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-itemNm"))) {
            alert("품종을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-vrtyNm"))) {
            alert("품목을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-enggtYmd"))) {
            alert("약정일자를 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-enggtVlm"))) {
            alert("약정수량을 입력하세요.");
            return;
        }

    	if (gfn_isEmpty(SBUxMethod.get("dtl-inp-expctHrvstQntt"))) {
            alert("예상수확량을 입력하세요.");
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

    	const postJsonPromise = gfn_postJSON("/fm/clt/insertCltvtnEnggtAplyMng.do", {
			apcCd: SBUxMethod.get('dtl-inp-apcCd'),
			prdcrCd: SBUxMethod.get('dtl-inp-prdcrCd'),
			frmerSn: Number(SBUxMethod.get('dtl-inp-prdcrCd')), //임시 농업인 일련번호
			frmerNm: SBUxMethod.get('dtl-inp-prdcrNm'),
			itemCd: SBUxMethod.get('dtl-inp-itemCd'),
			vrtyCd: SBUxMethod.get('dtl-inp-vrtyCd'),
			enggtVlm: SBUxMethod.get('dtl-inp-enggtVlm'),
			expctHrvstQntt: SBUxMethod.get('dtl-inp-expctHrvstQntt'),
			enggtYmd: SBUxMethod.get('dtl-inp-enggtYmd'),
			rmrk: nvl(SBUxMethod.get('dtl-inp-rmrk'),'')
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

    	const postJsonPromise = gfn_postJSON("/fm/clt/updateCltvtnEnggtAplyMng.do", {
    		apcCd: SBUxMethod.get('dtl-inp-apcCd'),
			prdcrCd: SBUxMethod.get('dtl-inp-prdcrCd'),
			frmerSn: Number(SBUxMethod.get('dtl-inp-prdcrCd')), //임시 농업인 일련번호
			frmerNm: SBUxMethod.get('dtl-inp-prdcrNm'),
			enggtVlm: SBUxMethod.get('dtl-inp-enggtVlm'),
			expctHrvstQntt: SBUxMethod.get('dtl-inp-expctHrvstQntt'),
			enggtYmd: SBUxMethod.get('dtl-inp-enggtYmd'),
			rmrk: SBUxMethod.get('dtl-inp-rmrk'),
			reqSn: SBUxMethod.get('dtl-inp-reqSn')
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
        const rows = grdCltvtnEnggtList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({
        			apcCd: row.apcCd,
        			prdcrCd: row.prdcrCd,
        			frmerSn: Number(row.prdcrCd),
        			reqSn: row.reqSn
        			});
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

     	const postJsonPromise = gfn_postJSON("/fm/clt/deleteCltvtnEnggtAplyMng.do", list);

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

    	var nCol = grdCltvtnEnggtList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdCltvtnEnggtList.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = grdCltvtnEnggtList.getRowData(nRow);

        SBUxMethod.set("dtl-input-gbnKey", "U");
    	SBUxMethod.set('dtl-inp-apcCd', rowData.apcCd);
        SBUxMethod.set('dtl-inp-apcNm', rowData.apcNm);
        SBUxMethod.set('dtl-inp-prdcrCd', rowData.prdcrCd);
        SBUxMethod.set('dtl-inp-prdcrNm', rowData.prdcrNm);
        SBUxMethod.set('dtl-inp-itemCd', rowData.itemCd);
        SBUxMethod.set('dtl-inp-itemNm', rowData.itemNm);
        SBUxMethod.set('dtl-inp-vrtyCd', rowData.vrtyCd);
        SBUxMethod.set('dtl-inp-vrtyNm', rowData.vrtyNm);
        SBUxMethod.set('dtl-inp-enggtVlm', rowData.enggtVlm);
        SBUxMethod.set('dtl-inp-expctHrvstQntt', rowData.expctHrvstQntt);
        SBUxMethod.set('dtl-inp-enggtYmd', rowData.enggtYmd);
        SBUxMethod.set('dtl-inp-rmrk', rowData.rmrk);
        SBUxMethod.set('dtl-inp-reqSn', rowData.reqSn);
        SBUxMethod.set('dtl-inp-reqCd', rowData.reqCd);
        SBUxMethod.set('dtl-inp-reqNm', rowData.reqNm);

        SBUxMethod.attr("srch-btn-apcNm","disabled",true);
        SBUxMethod.attr("srch-btn-prdcr1","disabled",true);

    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdCltvtnEnggtList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdCltvtnEnggtList.setCellData(i+1, 1, checkedYn, true, false);
        }
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
		}
	}

	//null 체크
	function nvl(str, defaultStr){

        if(typeof str == "undefined" || str == null || str == "")
            str = defaultStr ;

        return str ;
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

			SBUxMethod.set("dtl-inp-itemCd", prdcr.rprsItemCd);
			SBUxMethod.set("dtl-inp-itemNm", prdcr.rprsItemNm);
			SBUxMethod.set("dtl-inp-vrtyCd", prdcr.rprsVrtyCd);
			SBUxMethod.set("dtl-inp-vrtyNm", prdcr.rprsVrtyNm);

			//fn_setPrdcrForm(prdcr);
		}
	}



</script>
</html>