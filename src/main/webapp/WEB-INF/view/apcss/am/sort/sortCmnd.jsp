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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>	<!-- 선별지시조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSortCmnd" name="btnDocSortCmnd" uitype="normal" text="선별지시서" class="btn btn-sm btn-primary" onclick="fn_docSortCmnd"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화"class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!-- <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"class="btn btn-sm btn-outline-danger"></sbux-button> -->
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
								<sbux-datepicker uitype="popup" id="srch-dtp-strtCmndYmd" name="srch-dtp-strtCmndYmd" class="form-control pull-right input-sm">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCmndYmd" name="srch-dtp-endCmndYmd" class="form-control pull-right input-sm">
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<td>&nbsp;</td>

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
	                        <div id="inptCmndDsctnGridArea" style="height:487px;"></div>
	                    </div>
	               	</div>
				</div>
		</div>
	</section>

    <!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
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
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, gv_apcCd, itemCd);		// 규격
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();
		fn_getPrdcrs();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-strtCmndYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endCmndYmd", year+month+day);

		fn_initSBSelect();

	});

	var grdSortCmnd; // 그리드를 담기위한 객체 선언
	var jsonSortCmnd = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'grdSortCmnd';
	    SBGridProperties.jsonref = 'jsonSortCmnd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 15,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
			{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center', userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
	        {caption: ["지시번호","지시번호"],		ref: 'sortCmndno',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시일자","지시일자"], 	ref: 'sortCmndYmd',     	type:'output',  width:'100px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자","생산자"],  	ref: 'prdcrNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'vrtyNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'warehouseSeNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["설비","설비"],  	ref: 'fcltNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'pltno',    type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["선별지시","수량"],  	ref: 'cmndQntt',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["선별지시","중량"],  	ref: 'cmndWght',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["투입실적","수량"],  	ref: 'inptQntt',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["투입실적","중량"],  	ref: 'inptWght',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["비고","비고"],  	ref: 'rmrk',    type:'output',  width:'180px',    style:'text-align:center'},
	    ];

	    grdSortCmnd = _SBGrid.create(SBGridProperties);
	    grdSortCmnd.bind( "afterpagechanged" , "fn_pagingGrdSortCmnd" );
	}

    async function fn_pagingGrdSortCmnd(){
    	let recordCountPerPage = grdSortCmnd.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSortCmnd.getSelectPageIndex();
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
 	   } catch(e){
		   alert(e);
		   return;
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
		}
	}


    const fn_delete = async function(){
    	var grdRows = grdSortCmnd.getCheckedRows(0);
    	var deleteList = [];

    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		deleteList.push(grdSortCmnd.getRowData(nRow));
    	}

    	var delMsg = "삭제 하시겠습니까?";
		if(confirm(delMsg)){
			const postJsonPromise = gfn_postJSON("/am/sort/deleteSortCmndList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.deletedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
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
	* @name fn_onKeyUpPrdcrNm
	* @description 생산자명 입력 시 event : autocomplete
	*/
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		}
		else{
			SBUxMethod.set("srch-inp-prdcrCd", value);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 찾기 버튼 클릭
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 모달 선택 콜백 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
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
			for(var i=0;i<vrtys.length;i++){
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
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
</script>
</html>