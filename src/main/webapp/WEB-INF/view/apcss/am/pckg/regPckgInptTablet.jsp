<%
 /**
  * @Class Name : regPckgInptTablet.jsp
  * @Description : 포장투입등록 태블릿 화면
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
	<title>title : 포장투입등록(태블릿)</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 포장투입등록 태블릿 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="초기화"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="저장"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="삭제"
						onclick="fn_delete"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="조회"
						onclick="fn_search"
					></sbux-button>
					<sbux-button
						id="btnClose"
						name="btnClose"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_close"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 1%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 19%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">
								<span class="data_required" ></span>포장기
							</th>
							<td colspan="6" class="td_input"  style="border-right:hidden;">
								<sbux-select
									id="srch-slt-fcltCd"
									name="srch-slt-fcltCd"
									uitype="single"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComFclt"
								></sbux-select>
							</td>
							<td colspan="5">
								<p class="ad_input_row">
									<sbux-checkbox
										id="srch-chk-fxngFclt"
										name="srch-chk-fxngFclt"
										uitype="normal"
										text="고정"
										class="check"
									></sbux-checkbox>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>선별번호</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortnoIndct" name="srch-inp-sortnoIndct" uitype="text" maxlength="25" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
								<sbux-input id="srch-inp-sortno" name="srch-inp-sortno" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-sortSn" name="srch-inp-sortSn" uitype="hidden"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchSortInvntr"
									name="btnSrchSortInvntr"
									uitype="modal"
									class="btn btn-xs btn-outline-dark"
									target-id="modal-sortInvntr"
									onclick="fn_modalSortInvntr"
									text="찾기"
								></sbux-button>
						  	</td>
							<td colspan="3"></td>
				        </tr>
						<tr>
							<th scope="row" class="th_bg"><sbux-label id="srch-lbl-pckgCmndnoIndct" name="srch-lbl-pckgCmndnoIndct" uitype="normal" text="포장지시번호" class="bold"></sbux-label></th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pckgCmndnoIndct" name="srch-inp-pckgCmndnoIndct" uitype="text" maxlength="25" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-pckgCmndno" name="srch-inp-pckgCmndno" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-pckgCmndSn" name="srch-inp-pckgCmndSn" uitype="hidden"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPckgCmndno"
									name="btnSrchPckgCmndno"
									uitype="modal"
									class="btn btn-xs btn-outline-dark"
									target-id="modal-pckgCmndno"
									text="찾기"
									onclick="fn_modalPckgCmndno"
								></sbux-button>
						    </td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmd"
									name="srch-dtp-inptYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange"
									style="width:100%;"
								></sbux-datepicker>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-itemNm" name="srch-inp-itemNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-itemCd" name="srch-inp-itemCd" uitype="hidden"></sbux-input>
								<sbux-input id="cmnd-inp-itemCd" name="cmnd-inp-itemCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
								<sbux-input id="cmnd-inp-vrtyCd" name="cmnd-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">규격명</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spcfctNm" name="srch-inp-spcfctNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-spcfctCd" name="srch-inp-spcfctCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">선별수량/중량</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortQntt" name="srch-inp-sortQntt" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortWght" name="srch-inp-sortWght" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-sortQnttWght" name="srch-lbl-sortQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입수량/중량</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-inptQntt" name="srch-inp-inptQntt" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-inptWght" name="srch-inp-inptWght" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-inptQnttWght" name="srch-lbl-inptQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="3"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>포장투입 내역</span>
							<span style="font-size:12px">(기준일자 :
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label>)
							</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgInpt" class="table table-bordered table-hover tbl_col tbl_fixed" style="width:100%;height:285px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 선별재고 선택 Modal -->
    <div>
        <sbux-modal id="modal-sortInvntr" name="modal-sortInvntr" uitype="middle" header-title="선별재고 선택" body-html-id="body-modal-sortInvntr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-sortInvntr">
    	<jsp:include page="../../am/popup/sortInvntrPopup.jsp"></jsp:include>
    </div>
	<!-- 포장지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-pckgCmndno" name="modal-pckgCmndno" uitype="middle" header-title="포장지시번호 선택" body-html-id="body-modal-pckgCmndno" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-pckgCmndno">
    	<jsp:include page="../../am/popup/pckgCmndPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComFclt = [];
	var jsonPckgInpt = [];
	var grdPckgInpt;

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd', jsonComFclt, 'PCKG_FCLT_CD', gv_apcCd)
		]);

	}

	const fn_init = async function() {

		fn_reset();

		let rst = await Promise.all([
			fn_initSBSelect()
		]);

		fn_createGrid();
		fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		fn_init();
	})

	const fn_dtpChange = function(){
		let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");
		let toDayYmd = gfn_dateToYmd(new Date());
		if(gfn_diffDate(toDayYmd, inptYmd) < 0){
			gfn_comAlert("E0000", "투입일자는 금일 이전으로 등록 할 수 없습니다."); //W0001{0}
			SBUxMethod.set("srch-dtp-inptYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInpt';
	    SBGridProperties.id = 'grdPckgInpt';
	    SBGridProperties.jsonref = 'jsonPckgInpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.clickeventarea = {fixed: false, empty: false};
        SBGridProperties.columns = [
        	{caption: ["체크박스"], 		ref: 'checkedYn', 		width: '40px', 	type: 'checkbox',	style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ['투입일자'], 		ref: 'inptYmd', 		width: '100px', type: 'output',		style:'text-align: center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['포장기명'], 		ref: 'fcltNm', 			width: '100px', type: 'output',		style:'text-align: center'},
            {caption: ['선별번호'], 		ref: 'sortnoIndct', 	width: '130px', type: 'output',		style:'text-align: center'},
            {caption: ['포장지시번호'],		ref: 'pckgCmndno',		width: '130px', type: 'output',		style:'text-align: center'},
            {caption: ['등급'], 			ref: 'grdNm', 			width: '60px', 	type: 'output',		style:'text-align: center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px', 	type: 'output',		style:'text-align: center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output',		style:'text-align: center'},
            {caption: ['규격명'], 		ref: 'spcfctNm', 		width: '80px', 	type: 'output',		style:'text-align: center'},
            {caption: ['투입수량'], 		ref: 'qntt', 			width: '80px', 	type: 'output', 	style:'text-align: right',
            	format : {type:'number', rule:'#,###'}},
            {caption: ['투입중량 (Kg)'], 		ref: 'wght', 		width: '80px', 	type: 'output', 	style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['비고'], 			ref: 'rmrk', 			width: '200px', type: 'output'},
            {caption: ['포장기코드'], 		ref: 'fcltCd', 			hidden: true},
            {caption: ['선별번호'], 		ref: 'sortno', 			hidden: true},
            {caption: ['선별순번'], 		ref: 'sortSn', 			hidden: true},
            {caption: ['투입순번'], 		ref: 'inptSn', 			hidden: true},
            {caption: ['등급코드'], 		ref: 'grdCd', 			hidden: true},
            {caption: ['품목코드'], 		ref: 'itemCd', 			hidden: true},
            {caption: ['품종코드'], 		ref: 'vrtyCd', 			hidden: true},
            {caption: ['규격코드'], 		ref: 'spcfctCd', 		hidden: true}
        ];
        grdPckgInpt = _SBGrid.create(SBGridProperties);
        //grdPckgInpt.bind('click', fn_choice);
    }

	// 포장투입 목록 조회 (조회 버튼)
    const fn_search = async function() {
		var getColRef = grdPckgInpt.getColRef("checkedYn");
		grdPckgInpt.setFixedcellcheckboxChecked(0, getColRef, false);
    	fn_setGrdPckgInpt();
    }

	// 포장투입 목록 조회 호출
	const fn_setGrdPckgInpt = async function(){
		jsonPckgInpt = [];
		let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");
		if (gfn_isEmpty(inptYmd)){
			gfn_comAlert("W0002", "투입일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		let pckgInpt = {
					apcCd: gv_selectedApcCd,
					inptYmd: inptYmd,
					pckgCmptnYn: 'N',	// 포장미완료
					pagingYn: 'N'
				};

    	let postJsonPromise = gfn_postJSON("/am/pckg/selectPckgInptList.do", pckgInpt);
        let data = await postJsonPromise;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	jsonPckgInpt.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					let pckgInpt = {
  						inptYmd 		: item.inptYmd
  					  , fcltNm 			: item.fcltNm
  					  , fcltCd 			: item.fcltCd
  					  , sortno 			: item.sortno
  					  , sortSn 			: item.sortSn
  					  , sortnoIndct		: item.sortno + "-" + item.sortSn
  					  , pckgCmndno 		: item.pckgCmndno
  					  , grdNm 			: item.grdNm
  					  , itemNm 			: item.itemNm
  					  , vrtyNm			: item.vrtyNm
  					  , spcfctNm 		: item.spcfctNm
  					  , grdCd 			: item.grdCd
  					  , itemCd 			: item.itemCd
  					  , vrtyCd			: item.vrtyCd
  					  , spcfctCd 		: item.spcfctCd
  					  , qntt 			: item.qntt
  					  , wght 			: item.wght
  					  , inptSn			: item.inptSn
  					  , rmrk			: item.rmrk
  					}
  					jsonPckgInpt.push(pckgInpt);
  				});
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

        grdPckgInpt.rebuild();
	}


	// 초기화
    const fn_reset = async function() {

    	if (!SBUxMethod.get("srch-chk-fxngFclt")["srch-chk-fxngFclt"]) {
    		SBUxMethod.set('srch-slt-fcltCd', "");
    	}

		SBUxMethod.set('srch-inp-sortnoIndct', "");
		SBUxMethod.attr("srch-inp-sortnoIndct", "readonly", "false");
		SBUxMethod.set('srch-inp-sortno', "");
		SBUxMethod.set('srch-inp-sortSn', "");
		SBUxMethod.set('srch-inp-pckgCmndnoIndct', "");
		SBUxMethod.attr("srch-inp-pckgCmndnoIndct", "readonly", "false");
		SBUxMethod.set('srch-inp-pckgCmndno', "");
		SBUxMethod.set('srch-inp-pckgCmndSn', "");
		SBUxMethod.set("srch-dtp-inptYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-inp-itemNm', "");
		SBUxMethod.set('srch-inp-vrtyNm', "");
		SBUxMethod.set('srch-inp-itemCd', "");
		SBUxMethod.set('srch-inp-vrtyCd', "");
		SBUxMethod.set('srch-inp-spcfctNm', "");
		SBUxMethod.set('srch-inp-spcfctCd', "");
		SBUxMethod.set('srch-inp-sortQntt', "");
		SBUxMethod.set('srch-inp-sortWght', "");
		SBUxMethod.set('srch-inp-inptQntt', "");
		SBUxMethod.set('srch-inp-inptWght', "");
		SBUxMethod.set('cmnd-inp-itemCd', "");
		SBUxMethod.set('cmnd-inp-vrtyCd', "");
	}

	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		const pckgInptList = [];

		let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
		let sortno = SBUxMethod.get("srch-inp-sortno");
		let sortSn = SBUxMethod.get("srch-inp-sortSn");
		let pckgCmndno = SBUxMethod.get("srch-inp-pckgCmndno");

		let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");

		let inptQntt = parseInt(SBUxMethod.get("srch-inp-inptQntt")) || 0;
		let inptWght = parseInt(SBUxMethod.get("srch-inp-inptWght")) || 0;

		let invntrQntt = parseInt(SBUxMethod.get("srch-inp-sortQntt")) || 0;
		let invntrWght = parseInt(SBUxMethod.get("srch-inp-sortWght")) || 0;


		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "포장기");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(sortno)) {
			gfn_comAlert("W0005", "선별번호");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(sortSn)) {
			gfn_comAlert("W0005", "선별순번");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (gfn_isEmpty(inptYmd)) {
			gfn_comAlert("W0005", "투입일자");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (inptQntt <= 0) {
			gfn_comAlert("W0005", "투입수량");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (inptQntt > invntrQntt) {
			gfn_comAlert("W0014", "투입수량", "재고수량");		//	W0014	{0}이/가 {1} 보다 큽니다.
			return;
		}

		pckgInptList.push({
    		fcltCd: fcltCd,
    		sortno: sortno,
    		sortSn: sortSn,
    		inptYmd: inptYmd,
    		pckgCmndno: pckgCmndno,
    		qntt: inptQntt,
    		wght: inptWght
		});

		const pckgMng = {
    		apcCd: gv_selectedApcCd,
    		pckgInptList: pckgInptList
    	}

    	const postJsonPromise = gfn_postJSON("/am/pckg/insertPckgInpt.do", pckgMng);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_reset();
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	/**
     * @name fn_delete
     * @description 투입 삭제 : 그리드 선택 투입목록 삭제
     */
	const fn_delete = async function() {

		const allData = grdPckgInpt.getGridDataAll();

		const pckgInptList = [];
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				pckgInptList.push({
					sortno: item.sortno,
					sortSn: item.sortSn,
					inptSn: item.inptSn
				});
    		}
		});

		if (pckgInptList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "투입실적 삭제")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

		const pckgMng = {
	    		apcCd: gv_selectedApcCd,
	    		pckgInptList: pckgInptList
	    	}

    	const postJsonPromise = gfn_postJSON("/am/pckg/deletePckgInpt.do", pckgMng);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }



	// 선별지시번호 선택 팝업 호출
	 const fn_modalSortInvntr = function() {
		 popSortInvntr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortInvntr);
	}

	const fn_setSortInvntr = function(sortInvntr) {
		if (!gfn_isEmpty(sortInvntr)) {

			if(!gfn_isEmpty(SBUxMethod.get("cmnd-inp-itemCd"))){
				let sortItemCd = sortInvntr.itemCd;
				let sortVrtyCd = sortInvntr.vrtyCd;
				let cmndItemCd = SBUxMethod.get('cmnd-inp-itemCd');
				let cmndVrtyCd = SBUxMethod.get('cmnd-inp-vrtyCd');

				if(sortItemCd != cmndItemCd){
					gfn_comAlert("W0006","지시의 품목","선별재고의 품목") 	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
					return;
				}
				if(sortVrtyCd != cmndVrtyCd){
					gfn_comAlert("W0006","지시의 품종","선별재고의 품종") 	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
					return;
				}
			}

			SBUxMethod.set('srch-inp-sortnoIndct', sortInvntr.sortnoIndct);
			SBUxMethod.attr("srch-inp-sortnoIndct", "readonly", "true");
			SBUxMethod.set('srch-inp-sortno', sortInvntr.sortno);
			SBUxMethod.set('srch-inp-sortSn', sortInvntr.sortSn);
			SBUxMethod.set('srch-inp-itemNm', sortInvntr.itemNm);
			SBUxMethod.set('srch-inp-vrtyNm', sortInvntr.vrtyNm);
			SBUxMethod.set('srch-inp-itemCd', sortInvntr.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', sortInvntr.vrtyCd);
			SBUxMethod.set('srch-inp-sortQntt', sortInvntr.invntrQntt);
			SBUxMethod.set('srch-inp-sortWght', sortInvntr.invntrWght);
			SBUxMethod.set('srch-inp-spcfctNm', sortInvntr.spcfctNm);
			SBUxMethod.set('srch-inp-spcfctCd', sortInvntr.spcfctCd);



		}
	}

	// 포장지시번호 선택 팝업 호출
	const fn_modalPckgCmndno = function() {
		popPckgCmnd.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPckgCmnd);
	}

	const fn_setPckgCmnd = function(pckgCmnd) {
		if (!gfn_isEmpty(pckgCmnd)) {
			if(!gfn_isEmpty(SBUxMethod.get("srch-inp-itemCd"))){
				let sortItemCd = SBUxMethod.get("srch-inp-itemCd");
				let sortVrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
				let cmndItemCd = pckgCmnd.itemCd;
				let cmndVrtyCd = pckgCmnd.vrtyCd;

				if(sortItemCd != cmndItemCd){
					gfn_comAlert("W0006","지시의 품목","선별재고의 품목") 	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
					return;
				}
				if(sortVrtyCd != cmndVrtyCd){
					gfn_comAlert("W0006","지시의 품종","선별재고의 품종") 	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
					return;
				}
			}

			SBUxMethod.set('srch-inp-pckgCmndnoIndct', pckgCmnd.pckgCmndnoIndct);
			SBUxMethod.attr("srch-inp-pckgCmndnoIndct", "readonly", "true");
			SBUxMethod.set('srch-inp-pckgCmndno', pckgCmnd.pckgCmndno);
			SBUxMethod.set('srch-inp-pckgCmndSn', pckgCmnd.pckgCmndSn);
			SBUxMethod.set('srch-inp-inptQntt', pckgCmnd.cmndQntt);
			SBUxMethod.set('srch-inp-inptWght', pckgCmnd.cmndWght);
			SBUxMethod.set('cmnd-inp-itemCd', pckgCmnd.itemCd);
			SBUxMethod.set('cmnd-inp-vrtyCd', pckgCmnd.vrtyCd);
		}
	}
	const fn_close = function(){
		parent.gfn_tabClose("TAB_AM_004_003");
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>