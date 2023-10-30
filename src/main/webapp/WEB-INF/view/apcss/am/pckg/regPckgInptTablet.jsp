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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 포장투입등록 태블릿 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_insert"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
					<sbux-button id="btnClose" name="btnClose" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
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
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>포장기</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-fcltCd" name="srch-slt-fcltCd" uitype="single" unselected-text="선택" jsondata-ref="jsonComFclt" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox id="srch-chk-fcltCd" name="srch-chk-fcltCd" uitype="normal" text="고정" class="check"></sbux-checkbox>
								</p>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>선별번호/등급</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortnoIndct" name="srch-inp-sortnoIndct" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchSortInvntr" name="btnSrchSortInvntr" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-sortInvntr" onclick="fn_modalSortInvntr" text="찾기"></sbux-button>
						  	</td>
							<td colspan="5"></td>
				        </tr>
						<tr>
							<th scope="row" class="th_bg"><sbux-label id="srch-lbl-pckgCmndno" name="srch-lbl-pckgCmndno" uitype="normal" text="포장지시번호" class="bold"></sbux-label></th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pckgCmndno" name="srch-inp-pckgCmndno" uitype="text" maxlength="20" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPckgCmndno" name="btnSrchPckgCmndno" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-pckgCmndno" text="찾기" onclick="fn_modalPckgCmndno"></sbux-button>
						    </td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-inptYmd" name="srch-dtp-inptYmd" uitype="popup" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td colspan="7"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>투입수량/중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-inptQntt" name="srch-inp-inptQntt" uitype="text" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-inptWght" name="srch-inp-inptWght" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-inptQnttWght" name="srch-lbl-inptQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-itemNm" name="srch-inp-itemNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
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
							<th scope="row" class="th_bg">규격명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-input id="srch-inp-spcfctNm" name="srch-inp-spcfctNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</td>
							<td colspan="6"></td>
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
					<div id="sb-area-grdPckgInptTablet" class="table table-bordered table-hover tbl_col tbl_fixed" style="width:100%;height:300px;"></div>
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

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd', jsonComFclt, 'PCKG_FCLT_CD', gv_apcCd)
		]);
        // fn_search();
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		SBUxMethod.set("srch-dtp-inptYmd", gfn_dateToYmd(new Date()));

		fn_createPckgInptTabletGrid();
		fn_initSBSelect();
	})

	function fn_createPckgInptTabletGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInptTablet';
	    SBGridProperties.id = 'grdPckgInptTablet';
	    SBGridProperties.jsonref = 'jsonPckgInptTablet';
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
            {caption: ['투입일자'], 		ref: 'inptYmd', 		width: '100px', type: 'output',	style:'text-align: center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['포장기명'], 		ref: 'fcltNm', 			width: '100px', type: 'output',	style:'text-align: center'},
            {caption: ['선별번호'], 		ref: 'sortnoIndct', 	width: '130px', type: 'output',	style:'text-align: center'},
            {caption: ['포장지시번호'],		ref: 'pckgCmndnoIndct',	width: '130px', type: 'output',	style:'text-align: center'},
            {caption: ['등급'], 			ref: 'grdNm', 			width: '100px', type: 'output',	style:'text-align: center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '100px', type: 'output',	style:'text-align: center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '100px', type: 'output',	style:'text-align: center'},
            {caption: ['투입수량'], 		ref: 'inptQntt', 		width: '100px', type: 'output', style:'text-align: right',
            	format : {type:'number', rule:'#,###'}},
            {caption: ['투입중량'], 		ref: 'inptWght', 		width: '100px', type: 'output', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['규격명'], 		ref: 'spcfctNm', 		width: '100px', type: 'output',	style:'text-align: center'},
            {caption: ['비고'], 			ref: 'rmrk', 			width: '100px', type: 'output'}
        ];
        grdPckgInptTablet = _SBGrid.create(SBGridProperties);
        grdPckgInptTablet.bind('afterpagechanged', fn_pagingRegPckgInptTablet);
        grdPckgInptTablet.bind('click', fn_choice);
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdPckgInptTablet.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdPckgInptTablet.movePaging(currentPageNo);
    }

	// 출하지시 목록 조회 호출
	async function fn_callSelectPckgInptList(recordCountPerPage, currentPageNo){
		jsonPckgInpt = [];
		let apcCd = gv_apcCd;
		let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");
		if (gfn_isEmpty(inptYmd)){
			gfn_comAlert("W0002", "투입일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		let spmtCmndVO = {apcCd 				: apcCd
						, inptYmd 				: inptYmd
						, pagingYn 				: 'Y'
						, currentPageNo 		: currentPageNo
						, recordCountPerPage 	: recordCountPerPage};

    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", spmtCmndVO);
        let data = await postJsonPromise;
        try{
        	jsonPckgInpt.length = 0;
        	data.resultList.forEach((item, index) => {
				let pckgInpt = {
					inptYmd 		: item.inptYmd
				  , fcltNm 			: item.fcltNm
				  , sortnoIndct 	: item.sortnoIndct
				  , pckgCmndnoIndct : item.pckgCmndnoIndct
				  , grdNm 			: item.grdNm
				  , itemNm 			: item.itemNm
				  , vrtyNm			: item.vrtyNm
				  , inptQntt 		: item.inptQntt
				  , inptWght 		: item.inptWght
				  , spcfctNm 		: item.spcfctNm
				  , rmrk			: item.rmrk
				}
				jsonPckgInpt.push(pckgInpt);
			});
        	if(jsonPckgInpt.length > 0){
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
    	grdPckgInptTablet
		SBUxMethod.set('srch-slt-fcltCd', "");
		SBUxMethod.set('srch-inp-sortnoIndct', "");
		SBUxMethod.set('srch-inp-pckgCmndno', "");
		SBUxMethod.set("srch-dtp-inptYmd", "");
		SBUxMethod.set('srch-inp-inptQntt', "");
		SBUxMethod.set('srch-inp-inptWght', "");
		SBUxMethod.set('srch-inp-itemNm', "");
		SBUxMethod.set('srch-inp-vrtyNm', "");
		SBUxMethod.set('srch-inp-sortQntt', "");
		SBUxMethod.set('srch-inp-sortWght', "");
		SBUxMethod.set('srch-inp-spcfctNm', "");
    }
	
	// 초기화
    async function fn_reset() {
		SBUxMethod.set('srch-slt-fcltCd', "");
		SBUxMethod.set('srch-chk-fcltCd', 'false');
		SBUxMethod.refresh('srch-chk-fcltCd');
		SBUxMethod.set('srch-inp-sortnoIndct', "");
		SBUxMethod.set('srch-inp-pckgCmndno', "");
		SBUxMethod.set("srch-dtp-inptYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-inp-inptQntt', "");
		SBUxMethod.set('srch-inp-inptWght', "");
		SBUxMethod.set('srch-inp-itemNm', "");
		SBUxMethod.set('srch-inp-vrtyNm', "");
		SBUxMethod.set('srch-inp-sortQntt', "");
		SBUxMethod.set('srch-inp-sortWght', "");
		SBUxMethod.set('srch-inp-spcfctNm', "");
    }
	
	// 선별지시번호 선택 팝업 호출
	 const fn_modalSortInvntr = function() {
		 popSortInvntr.init(gv_apcCd, gv_apcNm, fn_setSortInvntr);
	}
	 const fn_setSortInvntr = function(sortInvntr) {
		if (!gfn_isEmpty(sortInvntr)) {
			SBUxMethod.set('srch-inp-sortnoIndct', sortInvntr.sortnoIndct);
			SBUxMethod.set('srch-inp-itemNm', sortInvntr.itemNm);
			SBUxMethod.set('srch-inp-vrtyNm', sortInvntr.vrtyNm);
			SBUxMethod.set('srch-inp-sortQntt', sortInvntr.invntrQntt);
			SBUxMethod.set('srch-inp-sortWght', sortInvntr.invntrWght);
			SBUxMethod.set('srch-inp-spcfctNm', sortInvntr.spcfctNm);
		}
	}
	
	// 포장지시번호 선택 팝업 호출
	const fn_modalPckgCmndno = function() {
		popPckgCmnd.init(gv_apcCd, gv_apcNm, fn_setPckgCmnd);
	}
	const fn_setPckgCmnd = function(pckgCmnd) {
		if (!gfn_isEmpty(pckgCmnd)) {
			SBUxMethod.set('srch-inp-pckgCmndno', pckgCmnd.pckgCmndnoIndct);
		}
	}
</script>
</html>