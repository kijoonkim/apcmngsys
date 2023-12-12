<%
 /**
  * @Class Name : sortCmnd.jsp
  * @Description : 선별지시조회 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	정희운			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 선별지시조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSortCmnd" name="btnDocSortCmnd" uitype="normal" text="선별지시서" class="btn btn-sm btn-primary" onclick="fn_docSortCmnd"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화"class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtCmndYmd" name="srch-dtp-strtCmndYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-strtCmndYmd)">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCmndYmd" name="srch-dtp-endCmndYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-endCmndYmd)">
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>선별지시 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-sortCmnd">0</span>건)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
					</div>
				</div>
	            <div class="sbt-wrap-body">
	                    <div class="sbt-grid">
	                        <div id="inptCmndDsctnGridArea" style="height:579px;"></div>
	                    </div>
	               	</div>
				</div>
		</div>
	</section>

    <!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    const fn_initSBSelect = async function() {

		// 검색 SB select
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd);		// 품목
	}
    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createSortCmndGrid();
		fn_getPrdcrs();

		SBUxMethod.set("srch-dtp-strtCmndYmd", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-endCmndYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();

	});
	
	const fn_dtpChange = function(){
		let strtCmndYmd = SBUxMethod.get("srch-dtp-strtCmndYmd");
		let endCmndYmd = SBUxMethod.get("srch-dtp-endCmndYmd");
		if(gfn_diffDate(strtCmndYmd, endCmndYmd) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-strtCmndYmd", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-endCmndYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	var grdSortCmnd; // 그리드를 담기위한 객체 선언
	var jsonSortCmnd = []; // 그리드의 참조 데이터 주소 선언

	function fn_createSortCmndGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'grdSortCmnd';
	    SBGridProperties.jsonref = 'jsonSortCmnd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.frozencols = 3;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
			{
				caption : ["전체","<input type='checkbox' onchange='fn_checkAllSortCmnd(grdSortCmnd, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
	        {caption: ["지시번호","지시번호"],		ref: 'sortCmndno',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시일자","지시일자"], 	ref: 'sortCmndYmd',     	type:'output',  width:'100px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자","생산자"],  	ref: 'prdcrNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'vrtyNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'warehouseSeNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["설비","설비"],  	ref: 'fcltNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'pltno',    type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["선별지시","수량"],  	ref: 'cmndQntt',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,### '}},
	        {caption: ["선별지시","중량"],  	ref: 'cmndWght',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,### Kg'}},
	        {caption: ["투입실적","수량"],  	ref: 'inptQntt',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,### '}},
	        {caption: ["투입실적","중량"],  	ref: 'inptWght',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,### Kg'}},
	        {caption: ["비고","비고"],  	ref: 'rmrk',    type:'output',  width:'180px',    style:'text-align:center'},
	    ];

	    grdSortCmnd = _SBGrid.create(SBGridProperties);
	    grdSortCmnd.bind( "afterpagechanged" , "fn_pagingGrdSortCmnd" );
	}
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdSortCmnd.exportLocalExcel("선별지시", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdSortCmnd.savePersonalInfo("apcCd");
   }
    // 개인화 호출
    function fn_personalLoad(){
    	grdSortCmnd.loadPersonalInfo("apcCd");
   }
	// 열 숨기기
    function fn_colHidden(){
    	grdSortCmnd.setColHidden(grdSortCmnd.getCol(), true);
   }
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdSortCmnd.getFixedCols(); i < grdSortCmnd.getCols()-1; i++) {
   			grdSortCmnd.setColHidden(i, false);
    	}
   }

    async function fn_pagingGrdSortCmnd(){
    	let recordCountPerPage = grdSortCmnd.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSortCmnd.getSelectPageIndex();
    	let ref = "<input type='checkbox' onchange='fn_checkAllSortCmnd(grdSortCmnd, this);'>";
    	grdSortCmnd.setCellData(1, grdSortCmnd.getColRef("checkedYn"), ref, true, false);
    	fn_setGrdSortCmnd(recordCountPerPage, currentPageNo);
    }

	const fn_search = async function(){
    	try{
 		   if (gfn_isEmpty(SBUxMethod.get("srch-dtp-strtCmndYmd")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-endCmndYmd")))
 				   throw "지시일자는 필수입력 항목입니다.";

	    	grdSortCmnd.rebuild();
	    	let pageSize = grdSortCmnd.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonSortCmnd.length = 0;
	    	grdSortCmnd.clearStatus();
 			await fn_setGrdSortCmnd(pageSize, pageNo);
		} catch (e) {
	   		if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	const fn_setGrdSortCmnd = async function(pageSize, pageNo){
    	let fcltCd	= SBUxMethod.get("srch-slt-inptFclt");
    	let sortCmndFromYmd = SBUxMethod.get("srch-dtp-strtCmndYmd");
    	let sortCmndToYmd = SBUxMethod.get("srch-dtp-endCmndYmd");
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");			// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");				// 품종
  		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고

    	const postJsonPromise = gfn_postJSON("/am/sort/selectSortCmndList.do", {
			apcCd: gv_selectedApcCd,
			fcltCd: fcltCd,
			sortCmndFromYmd: sortCmndFromYmd,
			sortCmndToYmd: sortCmndToYmd,
			prdcrCd : prdcrCd,
			itemCd : itemCd,
			vrtyCd : vrtyCd,
			warehouseSeCd:warehouseSeCd,
          	// pagination
  	  		pagingYn: 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
        const data = await postJsonPromise;
  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonSortCmnd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const sortCmnd = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						sortCmndno: item.sortCmndno,
  						sortCmndSn: item.sortCmndSn,
  						sortCmndYmd : item.sortCmndYmd,
  						fcltCd : item.fcltCd,
  						fcltNm : item.fcltNm,
  						pltno: item.pltno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						vrtyCd: item.vrtyCd,
  						warehouseSeCd: item.warehouseSeCd,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						itemNm: item.itemNm,
  						vrtyNm: item.vrtyNm,
  						grdNm: item.grdNm,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeNm: item.trsprtSeNm,
  						bxKndNm: item.bxKndNm,
  						grdNm: item.grdNm,
  						cmndQntt: item.cmndQntt,
  						cmndWght: item.cmndWght,
  						inptQntt: item.inptQntt,
  						inptWght: item.inptWght,
  						rmrk : item.rmrk
  				}
          		jsonSortCmnd.push(sortCmnd);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	grdSortCmnd.refresh();
          	if (jsonSortCmnd.length > 0) {
          		if(grdSortCmnd.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdSortCmnd.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdSortCmnd.rebuild();
  				}else{
  					grdSortCmnd.refresh();
  				}
          	} else {
          		grdSortCmnd.setPageTotalCount(totalRecordCount);
          		grdSortCmnd.rebuild();
          	}
          	document.querySelector('#cnt-sortCmnd').innerText = totalRecordCount;
       } catch (e) {
	   		if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

    const fn_del = async function(){
    	var grdRows = grdSortCmnd.getCheckedRows(0);
    	var deleteList = [];

    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		deleteList.push(grdSortCmnd.getRowData(nRow));
    	}
    	if (deleteList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}
    	var delMsg = "삭제 하시겠습니까?";
		if(confirm(delMsg)){
			
			const postJsonPromise = gfn_postJSON("/am/sort/deleteSortCmndList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_search();
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
		}
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	
	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {
		
		await fn_getPrdcrs();
		
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-inp-vrtyCd', jsonComVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyNm);
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
		}

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}
	
	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}
	

	/** 품종 modal **/
    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}

	/**
     * @name fn_docSortCmnd
     * @description 선별지시서 발행 버튼
     */
 	const fn_docSortCmnd = function() {

 		const sortCmndnoList = [];
		const allData = grdSortCmnd.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				sortCmndnoList.push(item.sortCmndno);
    		}
		});

 		if (sortCmndnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
             return;
 		}

 		const sortCmndno = sortCmndnoList.join("','");
 		gfn_popClipReport("선별지시서", "am/sortCmndDoc.crf", {apcCd: gv_selectedApcCd, sortCmndno: sortCmndno});
 	}
	
 	/**
     * @name fn_reset
     * @description 검색조건 초기화 버튼
     */
	async function fn_reset() {
		SBUxMethod.set('srch-dtp-strtCmndYmd', gfn_dateFirstYmd(new Date()));
		SBUxMethod.set('srch-dtp-endCmndYmd', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-slt-itemCd', "");
		SBUxMethod.set('srch-inp-vrtyNm', "");
		SBUxMethod.set('srch-inp-vrtyCd', "");
		SBUxMethod.set('srch-inp-prdcrNm', "");
		fn_clearPrdcr();
	}
 	
	/**
     * @name fn_onChangeApc
     * @description APC 변경 시 리셋
     */
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_clearPrdcr(),
			fn_initSBSelect(),
			fn_getPrdcrs(),
			jsonSortCmnd = [],
			grdSortCmnd.rebuild()
		]);
	}

	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
		})
	})
	
    //그리드 체크박스 전체 선택
    function fn_checkAllSortCmnd(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+2, getColRef);
            grid.setCellData(i+2, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>