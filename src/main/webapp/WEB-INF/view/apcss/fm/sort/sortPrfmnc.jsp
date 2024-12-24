<%
 /**
  * @Class Name : sortPrfmnc.jsp
  * @Description : 선별실적조회 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 선별실적조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">생산농가</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-prdcrCd"
									name="srch-slt-prdcrCd"
									class="form-control input-sm"
									jsondata-ref="jsonPrdcr"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmdFrom"
									name="srch-dtp-inptYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmdTo"
									name="srch-dtp-inptYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonVrty"></sbux-select> -->
<!-- 							</td> -->
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
								<sbux-input
									uitype="hidden"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchVrty"
									name="btnSrchVrty"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vrty"
									onclick="fn_modalVrty"
								/>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
 				<div class="row">
					<div class="col-sm-12">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>선별 내역</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-sort">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSortPrfmnc" style="height:544px;"></div>
					</div>
 				</div>

				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
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


	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyNms = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyNms.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}

	var jsonApcItem			= [];	// 품목 	itemCd			검색

    var jsonPrdcr			= [];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd)								// 품목
		]);

		var prdcrResultList = JSON.parse('${prdcrResultList}');

		prdcrResultList.forEach((item, index) => {
			const prdcr = {
					value 	: item.PRDCR_CD
				  , text	: item.PRDCR_NM
			}
			jsonPrdcr.push(prdcr);
		})
		SBUxMethod.refresh("srch-slt-prdcrCd");

		if (jsonPrdcr.length == 1) {
			SBUxMethod.set("srch-slt-prdcrCd", jsonPrdcr[0].value);
			SBUxMethod.attr("srch-slt-prdcrCd", "disabled", true);
		} else {
			SBUxMethod.attr("srch-slt-prdcrCd", "disabled", false);
		}
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {

    	let nowDate = new Date();

		let firstYmd = gfn_dateToYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);

		SBUxMethod.set("srch-dtp-inptYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-inptYmdTo", lastYmd);

		let result = await Promise.all([
				fn_initSBSelect(),
			]);

		fn_createGrid();
    }

    const fn_dtpChange = async function(){
    	let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
    	let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
    	var maxYmd = gfn_addDate(inptYmdFrom,90);

    	SBUxMethod.setDatepickerMaxDate('srch-dtp-inptYmdTo', maxYmd);

    	if(inptYmdFrom > inptYmdTo){
    		gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
    		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    		return;
    	}

	    if (maxYmd < inptYmdTo) {
    		SBUxMethod.set("srch-dtp-inptYmdTo", maxYmd);
	    }

    }


    // grid
    // 선별실적
    var grdSortPrfmnc;
    var jsonSortPrfmnc = [];

    const fn_createGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortPrfmnc';
	    SBGridProperties.id = 'grdSortPrfmnc';
	    SBGridProperties.jsonref = 'jsonSortPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList1;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.controlpanelcolumnsui = {
	    		  frozen		: false,
	    		  hidden		: true,
	    		  width		: false,
	    		  filtering	: true,
	    		  applycallback : function(objGrid){},

	    		  columnsingrid : false
	    		};
		SBGridProperties.frozencols = 2;
   	    SBGridProperties.total = {
				type: 'grand',
				position: 'bottom',
				columns: {
					standard: [8],
					sum: [9,10]
				},
			grandtotalrow: {
				titlecol: 8,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
			}
		};
        SBGridProperties.columns = [
            {caption: ["APC명","APC명"],        ref: 'apcNm', 		type:'output',      width:'120px',  style:'text-align:center' },
            {caption: ["선별일자","선별일자"],	ref: 'inptYmd',     type:'output',      width:'90px',    style:'text-align:center'
                , format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["대표생산자","대표생산자"],  ref: 'rprsPrdcrNm', type:'output',  width:'80px',   style:'text-align:center'},
            {caption: ["설비명","설비명"],      ref: 'fcltNm',      type:'output',      width:'120px',  style:'text-align:center'},
            {caption: ["품목","품목"],          ref: 'itemNm',      type:'output',      width:'80px',   style:'text-align:center'},
            {caption: ["품종","품종"],          ref: 'vrtyNm',      type:'output',      width:'80px',   style:'text-align:center'},
            {caption: ["규격","규격"],          ref: 'spcfctNm',    type:'output',      width:'80px',   style:'text-align:center'},
            {caption: ["등급","등급"],          ref: 'grdNm',       type:'output',      width:'80px',   style:'text-align:center'},
            {caption: ["선별","수량"],  		ref: 'sortQntt',	type:'output',  	width:'60px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["선별","중량 (Kg)"],  		ref: 'sortWght', 			type:'output',  	width:'80px',   style:'text-align:right',
                format : {type:'number', rule:'#,###'}
            },
            {caption: ["선별","변경수량"],  			ref: 'chgSortQntt', 			type:'input',  	width:'60px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}, hidden : true, userattr:{colNm:"chgQntt"}
            },
            {caption: ["선별","변경중량 (Kg)"],  		ref: 'chgSortWght', 			type:'input',  	width:'80px',   style:'text-align:right',
                format : {type:'number', rule:'#,###'}, hidden : true, userattr:{colNm:"chgWght"}
            },
            {caption: ["입고구분","입고구분"],         ref: 'wrhsSeNm',            type:'output',      width:'60px',   style:'text-align:center'},
            {caption: ["상품구분","상품구분"],          ref: 'gdsSeNm',               type:'output',      width:'60px',   style:'text-align:center'},
            {caption: ["선별번호","선별번호"],         ref: 'sortno',                 type:'output',      width:'120px',  style:'text-align:center'},
            {caption: ["비고","비고"],             ref: 'rmrk',                  type:'output',      width:'200px',  style:'text-align:center'},

        ];
        grdSortPrfmnc = _SBGrid.create(SBGridProperties);

        //grdSortPrfmnc.bind('beforepagechanged', fn_pagingSortPrfmnc);
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList1 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld1,			//콜백함수명
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
    function fn_excelDwnld1() {

    	if(gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?\n (확인 클릭 시 xlsx, 취소 클릭 시 xls)")){
    		grdSortPrfmnc.exportData("xlsx","선별실적",true);
    	}else{
    		grdSortPrfmnc.exportLocalExcel("선별실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    	}

    }

    let nCol = []
    // exportData에서 제외할 컬럼을 담습니다.
    function ExcelExport(checkbox) {
        if (checkbox.checked) {
            nCol.push(grdSortPrfmnc.getMouseCol())
            // 체크된 컬럼을 배열에 담습니다.
            console.log(nCol)
        } else if (!checkbox.checked) {
            nCol = nCol.filter(item=>item !== grdSortPrfmnc.getMouseCol())
            // 체크해제된 컬럼을 배열에서 제거합니다.
            console.log(nCol)
        }
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdSortPrfmnc.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdSortPrfmnc.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdSortPrfmnc.setColHidden(grdSortPrfmnc.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdSortPrfmnc.getFixedCols(); i < grdSortPrfmnc.getCols()-1; i++) {
   			grdSortPrfmnc.setColHidden(i, false);
    	}
   	}


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-inptYmdFrom")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-inptYmdTo"))) {
    		gfn_comAlert("W0001", "선별일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

		// set pagination
    	grdSortPrfmnc.rebuild();
    	//let pageSize = grdSortPrfmnc.getPageSize();
    	let pageSize = 1;
    	let pageNo = 1;

    	// grid clear
    	jsonSortPrfmnc.length = 0;
    	grdSortPrfmnc.clearStatus();

    	fn_setGrdSortPrfmnc(pageSize, pageNo);
        nCol = [];
	}

    /**
     * @name fn_pagingSortPrfmnc
     * @description 선별실적 페이징
	 */
	const fn_pagingSortPrfmnc = async function() {
		/*
    	let pageSize = grdSortPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let pageNo = grdSortPrfmnc.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		*/
		let pageSize = 1;
		let pageNo = 1;
		var getColRef = grdSortPrfmnc.getColRef("checkedYn");
		grdSortPrfmnc.setFixedcellcheckboxChecked(1, getColRef, false);
		fn_setGrdSortPrfmnc(pageSize, pageNo);
	}

    /**
     * @name fn_setGrdSortPrfmnc
     * @description 선별실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdSortPrfmnc = async function(pageSize, pageNo) {

		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
    	let prdcrCd = SBUxMethod.get("srch-slt-prdcrCd");				// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");					// 품목
  		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");					// 품종
		const postJsonPromise = gfn_postJSON("/am/sort/selectSortPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			rprsPrdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
  		});

        const data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonSortPrfmnc.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const sortPrfmnc = {
  	 						rowSeq: item.rowSeq,
  	          				inptYmd: item.inptYmd,
  	          				fcltCd: item.fcltCd,
  	          				fcltNm: item.fcltNm,
  	          				wrhsSeNm: item.wrhsSeNm,
  	          				gdsSeNm: item.gdsSeNm,
  	          				itemCd: item.itemCd,
  	          				itemNm: item.itemNm,
  	          				vrtyNm: item.vrtyNm,
  	          				vrtyCd: item.vrtyCd,
  	          				spcfctCd: item.spcfctCd,
  	          				spcfctNm: item.spcfctNm,
  	          				inptQntt: item.inptQntt,
  	          				inptWght: item.inptWght,
  	          				grdCd: item.grdCd,
  	          				grdNm: item.grdNm,
  	          				sortQntt: item.sortQntt,
  	          				sortWght: item.sortWght,
  	          				wrhsSeCd: item.wrhsSeCd,
  	          				gdsSeCd: item.gdsSeCd,
  	          				rprsPrdcrCd: item.rprsPrdcrCd,
  	          				rprsPrdcrNm: item.rprsPrdcrNm,
  	          				warehouseSeNm: item.warehouseSeNm,
  	          				inptWarehouseSeNm: item.inptWarehouseSeNm,
  	          				sortno: item.sortno,
  	          				sortSn: item.sortSn,
  	          				wrhsno : item.wrhsno,
  	          				rmrk: item.rmrk,
  	          				apcCd : item.apcCd,
  	          				apcNm : item.apcNm
  	  				}
  	          		jsonSortPrfmnc.push(sortPrfmnc);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});

  	          	if (jsonSortPrfmnc.length > 0) {
  	          		if(grdSortPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			grdSortPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			grdSortPrfmnc.rebuild();
  	  				}else{
  	  					grdSortPrfmnc.refresh();
  	  				}
  	          	} else {
  	          		grdSortPrfmnc.setPageTotalCount(totalRecordCount);
  	          		grdSortPrfmnc.rebuild();
  	          	}

  	          	document.querySelector('#cnt-sort').innerText = totalRecordCount;

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

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList2 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld2,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld2() {
    	grdSortInptPrfmnc.exportLocalExcel("출하실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

     /**
 	 * @name getByteLengthOfString
 	 * @description 글자 byte 크기 계산
 	 */
  	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
 	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
		})
	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>