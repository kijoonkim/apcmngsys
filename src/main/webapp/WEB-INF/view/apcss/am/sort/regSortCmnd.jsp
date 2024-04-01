 <%
 /**
  * @Class Name : regSortCmnd.jsp
  * @Description : 선별지시등록 화면
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
	<title>title : 선별지시등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별지시등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmdFrom" name="srch-dtp-wrhsYmdFrom" date-format="yyyy-mm-dd" class="form-control pull-right input-sm input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmdTo" name="srch-dtp-wrhsYmdTo" date-format="yyyy-mm-dd" class="form-control pull-right input-sm input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)">
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_onChangeSrchItemCd(this)"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComVrty" jsondata-value="itemVrtyCd" onchange="fn_onChangeSrchVrtyCd(this)"></sbux-select>
							</td>
							<td>&nbsp;</td>
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
							<td class="td_input">
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
						<li><span>투입대상 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrInvntr" style="height:310px;"></div>
				</div>

				<br/>

				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
					</colgroup>
					<tr>
						<th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-cmndYmd)"/>
						</td>
						<td>&nbsp;</td>
						<th scope="row" class="th_bg"><span class="data_required"></span>투입설비</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select uitype="single" id="srch-slt-inptFclt" name="srch-slt-inptFclt" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComFclt"></sbux-select>
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>선별지시 내역</span>
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
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</div>
				</div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-grdSortCmnd" style="height:310px;"></div>
                </div>
			</div>
		</div>
	</section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComFclt			= [];	// 설비 		fcltCd		검색

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

 	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createRawMtrInvntr();
		fn_createSortCmnd();
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));
		fn_initSBSelect();
		fn_getPrdcrs();
	});

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComFclt, 		'SORT_FCLT_CD', gv_selectedApcCd),		// 설비
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, gv_selectedApcCd),								// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd)								// 품종
		]);
	}
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonComItem, {value: itemCd});
		
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd)			// 품종
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		if(!gfn_isEmpty(vrtyCd)){
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}

	var jsonRawMtrInvntr = []; // 그리드의 참조 데이터 주소 선언

	const fn_createRawMtrInvntr = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdRawMtrInvntr';
		SBGridProperties.id = 'grdRawMtrInvntr';
		SBGridProperties.jsonref = 'jsonRawMtrInvntr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList1;	// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 2;
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.columns = [
			{
				caption : ["전체","<input type='checkbox' id='allCheckBox' onchange='fn_checkAllRawMtrInvntr(grdRawMtrInvntr, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'50px',
				style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',			type:'output',  width:'120px', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["팔레트번호","팔레트번호"], 	ref: 'pltno',     		type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["생산자","생산자"],    		ref: 'prdcrNm',     	type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["품종","품종"],	    		ref: 'vrtyNm',   		type:'output',  width:'100px', style: 'text-align:center'},
            {caption: ["창고","창고"],	    		ref: 'warehouseSeNm', 	type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["입고","수량"],  			ref: 'wrhsQntt',   		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["입고","중량 (Kg)"],  			ref: 'wrhsWght',   		type:'output',  width:'80px', style: 'text-align:right',  typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ["재고","수량"],  			ref: 'invntrCmndQntt', 	type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["재고","중량(Kg)"],  			ref: 'invntrCmndWght', 	type:'output',  width:'80px', style: 'text-align:right',  typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ["지시","수량"], 				ref: 'cmndQntt',  		type:'input',   width:'80px', style: 'text-align:right; background:#FFF8DC;', typeinfo: {mask : {alias : '#', repeat: '*'}}, format : {type:'number', rule:'#,###'}},
            {caption: ["지시","중량(Kg)"], 				ref: 'cmndWght',  		type:'input',   width:'80px', style: 'text-align:right; background:#FFF8DC;', typeinfo : {mask : {alias : '#', repeat: '*'}}, format : {type:'number', rule:'#,###'}},
            {caption: ["선별지시 비고","선별지시 비고"], ref: 'rmrk', 		type:'input',   width:'120px', style: 'text-align:center'},

 	        {caption: ["생산자코드"],	ref: 'prdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   	type:'output',  hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 	type:'output',  hidden: true},
	        {caption: ["창고구분코드"],	ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["등급코드"],		ref: 'grdCd',   	type:'output',  hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   	type:'output',  hidden: true},
	        {caption: ["입고번호"],		ref: 'wrhsno', 		type:'output',  hidden: true},
	        {caption: ["입고구분명"],	ref: 'wrhsSeNm', 	type:'output',  hidden: true},
	        {caption: ["운송구분명"],	ref: 'trsprtSeNm', 	type:'output',  hidden: true},
	        {caption: ["박스종류명"],	ref: 'bxKndNm', 	type:'output',  hidden: true},
	        {caption: ["설비코드"],		ref: 'fcltCd', 		type:'output',  hidden: true},
	        {caption: ["지시일자"],		ref: 'sortCmndYmd', type:'output',  hidden: true},
	        {caption: ["APC코드"],		ref: 'apcCd',	 	type:'output',  hidden: true}

    	];
		grdRawMtrInvntr = _SBGrid.create(SBGridProperties);
		grdRawMtrInvntr.bind('valuechanged','fn_grdCmndQnttValueChanged');
		grdRawMtrInvntr.bind('select','fn_setValue');
		grdRawMtrInvntr.bind('deselect','fn_delValue');
	}

	var jsonSortCmnd = []; // 그리드의 참조 데이터 주소 선언

	const fn_createSortCmnd = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortCmnd';
	    SBGridProperties.id = 'grdSortCmnd';
	    SBGridProperties.jsonref = 'jsonSortCmnd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList2;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	        {caption: ["지시번호","지시번호"], 	ref: 'sortCmndno',  	type:'output',  	width:'130px',    style:'text-align:center'},
	        {caption: ["지시일자","지시일자"],  	ref: 'sortCmndYmd', 	type:'output',  	width:'130px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["투입설비","투입설비"],  	ref: 'fcltNm',    		type:'output',  	width:'130px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],  	ref: 'prdcrNm',    		type:'output',  	width:'130px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  		ref: 'vrtyNm',    		type:'output',  	width:'130px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  		ref: 'warehouseSeNm',	type:'output',  	width:'130px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"], ref: 'pltno',    		type:'output',  	width:'130px',    style:'text-align:center'},
	        {caption: ["지시","수량"],  		ref: 'cmndQntt',    	type:'output',  	width:'100px',    style:'text-align:right', typeinfo: {mask : {alias : '#', repeat: '*', unmaskvalue : true}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["지시","중량 (Kg)"],  		ref: 'cmndWght',    	type:'output',  	width:'100px',    style:'text-align:right', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["비고","비고"],  		ref: 'rmrk',    		type:'output',  	width:'130px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ["APC코드"],  			ref: 'apcCd',    		hidden:true},
	        {caption: ["순번"],  				ref: 'sortCmndSn',    	hidden:true},
	    ];

	    grdSortCmnd = _SBGrid.create(SBGridProperties);
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
		}
	};

    const objMenuList2 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld2,			//콜백함수명
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
    	grdRawMtrInvntr.exportLocalExcel("투입대상 내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 엑셀 다운로드
    function fn_excelDwnld2() {
    	grdSortCmnd.exportLocalExcel("선별지시 내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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

	const fn_search = async function(){
		let flag = true;
		flag = await fn_setGrdRawMtrInvntr();
		if(flag){
			await fn_setGrdSortCmnd();
		}
	}

	/**
     * @name fn_setGrdRawMtrInvntr
     * @description 입고내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
    */

	const fn_setGrdRawMtrInvntr = async function() {

		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");		// 입고일자from
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");			// 입고일자to
   		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");				// 생산자
   		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
   		let inptYmd = SBUxMethod.get("srch-dtp-cmndYmd");				// 지시일자


  		let itemCd = SBUxMethod.get("srch-slt-itemCd");					// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");					// 품종

  		if (gfn_isEmpty(wrhsYmdFrom) || gfn_isEmpty(wrhsYmdTo)) {
  			await gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			await gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}else{
  			vrtyCd = vrtyCd.substring(4,8);
  		}

		const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			warehouseSeCd:warehouseSeCd,
			inptYmd : inptYmd
  		});
        const data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonRawMtrInvntr.length = 0;
  	          	data.resultList.forEach((item, index) => {
  					if(item.invntrCmndWght > 0){
  		          		const rawMtrInvntr = {
  		  						rowSeq: item.rowSeq,
  		  						apcCd: item.apcCd,
  		  						wrhsno: item.wrhsno,
  		  						pltno: item.pltno,
  		  						wrhsYmd: item.wrhsYmd,
  		  						prdcrCd: item.prdcrCd,
  		  						itemCd: item.itemCd,
  		  						vrtyCd: item.vrtyCd,
  		  						gdsSeCd: item.gdsSeCd,
  		  						wrhsSeCd: item.wrhsSeCd,
  		  						trsprtSeCd: item.trsprtSeCd,
  		  						warehouseSeCd: item.warehouseSeCd,
  		  						bxKnd: item.bxKnd,
  		  						grdCd: item.grdCd,
  		  						wrhsQntt: item.wrhsQntt,
  		  						wrhsWght: item.wrhsWght,
  		  						inptQntt: item.inptQntt,
  		  						inptWght: item.inptWght,
  		  						invntrQntt: item.invntrQntt,
  		  						invntrWght: item.invntrWght,
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
  		  						sortCmndno: item.sortCmndno,
  		  						invntrCmndQntt : item.invntrCmndQntt,
  		  						invntrCmndWght : item.invntrCmndWght
  		  				}
  						jsonRawMtrInvntr.push(rawMtrInvntr);
  					}
  	  			});
  				grdRawMtrInvntr.rebuild();

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
		return true;
	}

    const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_clearPrdcr(),
			fn_initSBSelect(),
			fn_getPrdcrs(),
			jsonRawMtrInvntr = [],
			jsonSortCmnd = [],
			grdRawMtrInvntr.rebuild(),
			grdSortCmnd.rebuild()
		]);
	}

    const fn_grdCmndQnttValueChanged = async function(){

    	var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();


		switch (nCol) {
		case 10:	// checkbox
			fn_checkInptQntt();
			break;
		case 11:
			//check qntt
			fn_checkInptWght();
			break;
		default:
			return;
		}
    }

    const fn_setValue = async function(){
    	var nRow = grdRawMtrInvntr.getRow();
    	let invntrQntt = grdRawMtrInvntr.getRowData(nRow).invntrCmndQntt;
		let invntrWght = grdRawMtrInvntr.getRowData(nRow).invntrCmndWght;
		let cmndQntt = grdRawMtrInvntr.getRowData(nRow).cmndQntt;
		let cmndWght = grdRawMtrInvntr.getRowData(nRow).cmndWght;

		let checkboxChecked = grdRawMtrInvntr.getCheckedRows(0, true);
    	const allCheckbox = grdRawMtrInvntr.getGridDataAll();
    	if(checkboxChecked.length == allCheckbox.length){
    		allCheckBox.checked = true;
    	}

		if((cmndQntt == 0 && cmndWght == 0) || (gfn_isEmpty(cmndQntt) && gfn_isEmpty(cmndWght))){
	    	grdRawMtrInvntr.setCellData(nRow, 10, invntrQntt);
			grdRawMtrInvntr.setCellData(nRow, 11, invntrWght);
		}
    }

    const fn_delValue = async function(){
    	var nRow = grdRawMtrInvntr.getRow();
    	const allCheckBox = document.querySelector('#allCheckBox');
    	allCheckBox.checked = false;
    	grdRawMtrInvntr.setCellData(nRow, 10, 0);
		grdRawMtrInvntr.setCellData(nRow, 11, 0);
    }

    const fn_checkInptWght = async function(){

    	var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();

		let invntrQntt = grdRawMtrInvntr.getRowData(nRow).invntrCmndQntt;
		let invntrWght = grdRawMtrInvntr.getRowData(nRow).invntrCmndWght;
		let cmndWght = grdRawMtrInvntr.getRowData(nRow).cmndWght;

		if(invntrWght - cmndWght < 0){
			gfn_comAlert("W0008", "재고중량", "지시중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdRawMtrInvntr.setCellData(nRow, nCol , 0);
            return;
		}
		if(invntrWght == cmndWght && invntrQntt > 0){
			grdRawMtrInvntr.setCellData(nRow, 10, invntrQntt);
		}
		if(invntrWght % cmndWght == 0){
			grdRawMtrInvntr.setCellData(nRow, 10, (cmndWght / invntrWght * invntrQntt));
		}

		if(cmndWght > 0){
			grdRawMtrInvntr.setCellData(nRow, 0, "Y")
		}else{
			grdRawMtrInvntr.setCellData(nRow, 0, "N")
		}
    }

    const fn_checkInptQntt = async function(){

    	var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();

		let invntrQntt = grdRawMtrInvntr.getRowData(nRow).invntrCmndQntt;
		let invntrWght = grdRawMtrInvntr.getRowData(nRow).invntrCmndWght;
		let cmndQntt = grdRawMtrInvntr.getRowData(nRow).cmndQntt;

		if(invntrQntt - cmndQntt < 0){
			gfn_comAlert("W0008", "재고수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdRawMtrInvntr.setCellData(nRow, nCol , 0);
            return;
		}
		if(invntrQntt > 0 && cmndQntt > 0){
			grdRawMtrInvntr.setCellData(nRow, 11, Math.round(invntrWght / invntrQntt * cmndQntt));
			grdRawMtrInvntr.setCellData(nRow, 0, "Y");
		}
		if(cmndQntt == 0 && invntrQntt > 0){
			grdRawMtrInvntr.setCellData(nRow, 11, 0);
			grdRawMtrInvntr.setCellData(nRow, 0, "N");
		}
    }

    const fn_save = async function() {

    	var grdRows = grdRawMtrInvntr.getCheckedRows(0);
    	var insertList = [];

    	var fcltCd	= SBUxMethod.get("srch-slt-inptFclt");
    	var sortCmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");

    	if(gfn_isEmpty(sortCmndYmd)){
    		gfn_comAlert("W0001", "지시일자");			//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if(gfn_isEmpty(fcltCd)){
    		gfn_comAlert("W0001", "투입설비");			//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		var cmndWght = grdRawMtrInvntr.getRowData(nRow).cmndWght;
    		if(cmndWght == 0){
    			gfn_comAlert("W0001", "지시중량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}
    		grdRawMtrInvntr.setCellData(nRow, 26, fcltCd);
    		grdRawMtrInvntr.setCellData(nRow, 27, sortCmndYmd);
    		grdRawMtrInvntr.setCellData(nRow, 28, gv_selectedApcCd);
    		insertList.push(grdRawMtrInvntr.getRowData(nRow));
    	}
    	
    	if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/sort/insertSortCmndList.do", insertList);
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

    const fn_setGrdSortCmnd = async function(){
    	let sortCmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");

    	const postJsonPromise = gfn_postJSON("/am/sort/selectSortCmndList.do", {
			apcCd: gv_selectedApcCd,
			sortCmndYmd: sortCmndYmd
  		});
        const data = await postJsonPromise;
  		try {
  			if (_.isEqual("S", data.resultStatus)) {
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
  	  						rmrk : item.rmrk
  	  				}
  	          		jsonSortCmnd.push(sortCmnd);
  	  			});
  	          	grdSortCmnd.refresh({"focus":false});
  	          	SBUxMethod.set("crtr-ymd", sortCmndYmd);
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

		if (!gfn_isEmpty(prdcr.rprsItemCd)) {
			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
			fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
			
		}
		if(!gfn_isEmpty(prdcr.itemVrtyCd)){
			await fn_onChangeSrchVrtyCd({value:prdcr.itemVrtyCd});
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

	const fn_dtpChange = function(){
 		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
 		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
 		let cmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");
 		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
 			SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
 			return;
 		}
 		if(gfn_diffDate(gfn_dateToYmd(new Date()), cmndYmd) < 0){
 			gfn_comAlert("E0000", "지시일자는 금일보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));
 			return;
 		}
 	}

    //그리드 체크박스 전체 선택
    const fn_checkAllRawMtrInvntr = function (grid, obj) {
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

    const fn_reset = async function() {
		SBUxMethod.set('srch-dtp-wrhsYmdFrom', gfn_dateFirstYmd(new Date()));
		SBUxMethod.set('srch-dtp-wrhsYmdTo', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-slt-itemCd', "");
		SBUxMethod.set('srch-slt-vrtyCd', "");
		SBUxMethod.set('srch-inp-prdcrNm', "");
		SBUxMethod.set('srch-inp-prdcrCd', "");
		SBUxMethod.set('srch-inp-prdcrIdentno', "");
		SBUxMethod.set('srch-dtp-cmndYmd', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-slt-inptFclt', "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:initial");

		fn_initSBSelect()
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>