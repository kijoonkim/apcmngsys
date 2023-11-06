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
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 포장투입등록 태블릿 -->
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
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="조회"
						onclick="fn_search"
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
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">
								<span class="data_required" ></span>포장기
							</th>
							<td colspan="2" class="td_input"  style="border-right:hidden;">
								<sbux-select
									id="dtl-slt-fcltCd"
									name="dtl-slt-fcltCd"
									uitype="single"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComFclt"
								></sbux-select>
							</td>
							<td style="border-right:hidden ;">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-fxngFclt"
										name="dtl-chk-fxngFclt"
										uitype="normal"
									></sbux-checkbox>
									<label class="check_label" for="dtl-chk-fxngFclt" >고정</label>
								</p>
							</td>
							<td colspan="5" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>선별번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortnoIndct" name="srch-inp-sortnoIndct" uitype="text" maxlength="25" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
								<sbux-input id="srch-inp-sortno" name="srch-inp-sortno" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-sortSn" name="srch-inp-sortSn" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchSortInvntr" name="btnSrchSortInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-sortInvntr" onclick="fn_modalSortInvntr" text="찾기"></sbux-button>
						  	</td>
							<td colspan="5"></td>
				        </tr>
						<tr>
							<th scope="row" class="th_bg"><sbux-label id="srch-lbl-pckgCmndnoIndct" name="srch-lbl-pckgCmndnoIndct" uitype="normal" text="포장지시번호" class="bold"></sbux-label></th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pckgCmndnoIndct" name="srch-inp-pckgCmndnoIndct" uitype="text" maxlength="25" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-pckgCmndno" name="srch-inp-pckgCmndno" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-pckgCmndSn" name="srch-inp-pckgCmndSn" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
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
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmd" name="srch-dtp-pckgYmd" uitype="popup" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td colspan="7"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-itemNm" name="srch-inp-itemNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-itemCd" name="srch-inp-itemCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">규격명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spcfctNm" name="srch-inp-spcfctNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="srch-inp-spcfctCd" name="srch-inp-spcfctCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">선별수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortQntt" name="srch-inp-sortQntt" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortWght" name="srch-inp-sortWght" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-sortQnttWght" name="srch-lbl-sortQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입수량/중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-inptQntt" name="srch-inp-inptQntt" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-inptWght" name="srch-inp-inptWght" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-inptQnttWght" name="srch-lbl-inptQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장투입 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgInptTablet" class="table table-bordered table-hover tbl_col tbl_fixed" style="width:100%;height:330px;"></div>
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
	var jsonPckgInptTablet = [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd', jsonComFclt, 'PCKG_FCLT_CD', gv_apcCd)
		]);

	}

	const fn_init = async function() {
		let rst = await Promise.all([
			fn_initSBSelect()
		]);


		fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		fn_init();
	})

	function fn_createPckgInptTabletGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInptTablet';
	    SBGridProperties.id = 'grdPckgInptTablet';
	    SBGridProperties.jsonref = 'jsonPckgInptTablet';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
            {caption: ['투입일자'], 		ref: 'pckgYmd', 		width: '100px', type: 'output',	style:'text-align: center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['포장기명'], 		ref: 'fcltNm', 			width: '100px', type: 'output',	style:'text-align: center'},
            {caption: ['선별번호'], 		ref: 'sortnoIndct', 	width: '130px', type: 'output',	style:'text-align: center'},
            {caption: ['포장지시번호'],		ref: 'pckgCmndnoIndct',	width: '130px', type: 'output',	style:'text-align: center'},
            {caption: ['등급'], 			ref: 'grdNm', 			width: '60px', 	type: 'output',	style:'text-align: center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px', 	type: 'output',	style:'text-align: center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output',	style:'text-align: center'},
            {caption: ['규격명'], 		ref: 'spcfctNm', 		width: '80px', 	type: 'output',	style:'text-align: center'},
            {caption: ['투입수량'], 		ref: 'inptQntt', 		width: '80px', 	type: 'output', style:'text-align: right',
            	format : {type:'number', rule:'#,###'}},
            {caption: ['투입중량'], 		ref: 'inptWght', 		width: '80px', 	type: 'output', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['비고'], 			ref: 'rmrk', 			width: '200px', type: 'output'},
            {caption: ['포장기코드'], 		ref: 'fcltCd', 			hidden: true},
            {caption: ['선별번호'], 		ref: 'sortno', 			hidden: true},
            {caption: ['선별순번'], 		ref: 'sortSn', 			hidden: true},
            {caption: ['포장지시번호'], 	ref: 'pckgCmndno', 		hidden: true},
            {caption: ['포장지시순번'], 	ref: 'pckgCmndSn', 		hidden: true},
            {caption: ['등급코드'], 		ref: 'grdCd', 			hidden: true},
            {caption: ['품목코드'], 		ref: 'itemCd', 			hidden: true},
            {caption: ['품종코드'], 		ref: 'vrtyCd', 			hidden: true},
            {caption: ['규격코드'], 		ref: 'spcfctCd', 		hidden: true}
        ];
        grdPckgInptTablet = _SBGrid.create(SBGridProperties);
        grdPckgInptTablet.bind('afterpagechanged', fn_pagingRegPckgInptTablet);
        grdPckgInptTablet.bind('click', fn_choice);
    }

	// 포장투입 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdPckgInptTablet.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdPckgInptTablet.movePaging(currentPageNo);
    }

	// 포장투입 목록 조회 호출
	async function fn_callSelectPckgInptList(recordCountPerPage, currentPageNo){
		jsonPckgInptTablet = [];
		let apcCd = gv_apcCd;
		let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");
		if (gfn_isEmpty(pckgYmd)){
			gfn_comAlert("W0002", "투입일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		let pckgInpt = {apcCd 				: apcCd
					  , pckgYmd 			: pckgYmd
					  , pagingYn 			: 'Y'
					  , currentPageNo 		: currentPageNo
					  , recordCountPerPage 	: recordCountPerPage};

    	let postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do", pckgInpt);
        let data = await postJsonPromise;
        try{
        	jsonPckgInptTablet.length = 0;
        	data.resultList.forEach((item, index) => {
				let pckgInpt = {
					pckgYmd 		: item.pckgYmd
				  , fcltNm 			: item.fcltNm
				  , fcltCd 			: item.fcltCd
				  , sortnoIndct 	: item.sortnoIndct
				  , sortno 			: item.sortno
				  , sortSn 			: item.sortSn
				  , pckgCmndnoIndct : item.pckgCmndnoIndct
				  , pckgCmndno 		: item.pckgCmndno
				  , pckgCmndSn 		: item.pckgCmndSn
				  , grdNm 			: item.gdsGrdNm
				  , itemNm 			: item.itemNm
				  , vrtyNm			: item.vrtyNm
				  , spcfctNm 		: item.spcfctNm
				  , grdCd 			: item.grdCd
				  , itemCd 			: item.itemCd
				  , vrtyCd			: item.vrtyCd
				  , spcfctCd 		: item.spcfctCd
				  , inptQntt 		: item.inptQntt
				  , inptWght 		: item.inptWght
				  , rmrk			: item.rmrk
				}
				jsonPckgInptTablet.push(pckgInpt);
			});
        	if(jsonPckgInptTablet.length > 0){
				if(grdPckgInptTablet.getPageTotalCount() != data.resultList[0].totalRecordCount){   	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdPckgInptTablet.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdPckgInptTablet.rebuild();
				}else{
					grdPckgInptTablet.refresh();
				}
			}else{
				grdPckgInptTablet.setPageTotalCount(0);
				grdPckgInptTablet.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 페이징
    async function fn_pagingRegPckgInptTablet(){
    	let recordCountPerPage = grdPckgInptTablet.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPckgInptTablet.getSelectPageIndex();
    	fn_callSelectPckgInptList(recordCountPerPage, currentPageNo);
    }

	// 클릭 이벤트
    async function fn_choice() {
    	let nRow = grdPckgInptTablet.getRow();
    	rowData = grdPckgInptTablet.getRowData(nRow);

		SBUxMethod.set('srch-slt-fcltCd', rowData.fcltCd);
		SBUxMethod.set('srch-inp-sortnoIndct', rowData.sortnoIndct);
		SBUxMethod.set('srch-inp-sortno', rowData.sortno);
		SBUxMethod.set('srch-inp-sortSn', rowData.sortSn);
		SBUxMethod.set('srch-inp-pckgCmndnoIndct', rowData.pckgCmndnoIndct);
		SBUxMethod.set('srch-inp-pckgCmndno', rowData.pckgCmndno);
		SBUxMethod.set('srch-inp-pckgCmndSn', rowData.pckgCmndSn);
		SBUxMethod.set("srch-dtp-pckgYmd", rowData.pckgYmd);
		SBUxMethod.set('srch-inp-itemNm', rowData.itemNm);
		SBUxMethod.set('srch-inp-vrtyNm', rowData.vrtyNm);
		SBUxMethod.set('srch-inp-itemCd', rowData.itemCd);
		SBUxMethod.set('srch-inp-vrtyCd', rowData.vrtyCd);
		SBUxMethod.set('srch-inp-spcfctNm', rowData.spcfctNm);
		SBUxMethod.set('srch-inp-spcfctCd', rowData.spcfctCd);
		SBUxMethod.set('srch-inp-sortQntt', rowData.sortQntt);
		SBUxMethod.set('srch-inp-sortWght', rowData.sortWght);
		SBUxMethod.set('srch-inp-inptQntt', rowData.inptQntt);
		SBUxMethod.set('srch-inp-inptWght', rowData.inptWght);
    }

	// 초기화
    const fn_reset = async function() {
		SBUxMethod.set('srch-slt-fcltCd', "");
		SBUxMethod.set('srch-chk-fcltCd', 'false');
		SBUxMethod.refresh('srch-chk-fcltCd');
		SBUxMethod.set('srch-inp-sortnoIndct', "");
		SBUxMethod.set('srch-inp-sortno', "");
		SBUxMethod.set('srch-inp-sortSn', "");
		SBUxMethod.set('srch-inp-pckgCmndnoIndct', "");
		SBUxMethod.set('srch-inp-pckgCmndno', "");
		SBUxMethod.set('srch-inp-pckgCmndSn', "");
		SBUxMethod.set("srch-dtp-pckgYmd", gfn_dateToYmd(new Date()));
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
	}

	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		const sortInptPrfmncList = [];

		let fcltCd = SBUxMethod.get("dtl-slt-fcltCd");
		let pltno = SBUxMethod.get("dtl-inp-pltno");
		let wrhsno = SBUxMethod.get("dtl-inp-wrhsno");
		let sortCmndno = SBUxMethod.get("dtl-inp-sortCmndno");

		let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");

		let inptQntt = parseInt(SBUxMethod.get("dtl-inp-inptQntt")) || 0;
		let inptWght = parseInt(SBUxMethod.get("dtl-inp-inptWght")) || 0;

		let invntrQntt = parseInt(SBUxMethod.get("dtl-inp-invntrQntt")) || 0;
		let invntrWght = parseInt(SBUxMethod.get("dtl-inp-invntrWght")) || 0;


		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "선별기");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(pltno)) {
			gfn_comAlert("W0005", "팔레트번호");		//	W0005	{0}이/가 없습니다.
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

		sortInptPrfmncList.push({
    		fcltCd: fcltCd,
    		pltno: pltno,
    		wrhsno: wrhsno,
    		inptYmd: inptYmd,
    		qntt: inptQntt,
    		wght: inptWght
		});

		const sortMng = {
    		apcCd: gv_selectedApcCd,
    		sortInptPrfmncList: sortInptPrfmncList
    	}

    	const postJsonPromise = gfn_postJSON("/am/sort/insertSortInpt.do", sortMng);
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
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}




	// 선별지시번호 선택 팝업 호출
	 const fn_modalSortInvntr = function() {
		 popSortInvntr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortInvntr);
	}

	const fn_setSortInvntr = function(sortInvntr) {
		if (!gfn_isEmpty(sortInvntr)) {
			SBUxMethod.set('srch-inp-sortnoIndct', sortInvntr.sortnoIndct);
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
			SBUxMethod.set('srch-inp-pckgCmndnoIndct', pckgCmnd.pckgCmndnoIndct);
			SBUxMethod.set('srch-inp-pckgCmndno', pckgCmnd.pckgCmndno);
			SBUxMethod.set('srch-inp-pckgCmndSn', pckgCmnd.pckgCmndSn);
			SBUxMethod.set('srch-inp-inptQntt', pckgCmnd.cmndQntt);
			SBUxMethod.set('srch-inp-inptWght', pckgCmnd.cmndWght);
		}
	}
</script>
</html>