<%
/**
 * @Class Name : rawMtrWghPltBxMng.jsp
 * @Description : 팔레스/박스 불출관리 화면
 * @author SI개발부
 * @since 2023.08.31
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.08.31   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 팔레트/박스불출관리</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 팔레트/박스불출관리 -->
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
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>팔레트/박스 재고현황</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="inptCmndDsctnGridArea" style="height:243px;"></div>
				</div>

				<br>

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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
						    <th scope="row" class="th_bg"><span class="data_required"></span>작업일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-cmndYmd" name="srch-inp-cmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>입출고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-wrhsSpmtSe" name="srch-slt-wrhsSpmtSe" uitype="single" jsondata-ref="jsonWrhsSpmtSe" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="3" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pltBxSe" name="srch-slt-pltBxSe" uitype="single" jsondata-ref="jsonPltBxSe" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" onchange="fn_selectPltBxSe()"></sbux-select>
							</td>
							<td colspan="2" class="td_input"  style="border-left: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>명칭</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pltBxNm" name="srch-slt-pltBxNm" uitype="single" jsondata-ref="jsonPltBxNm" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
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
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-qntt"
									name="srch-inp-qntt"
									uitype="text"
									maxlength="7"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>입출 내역</span>
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
						<sbux-button id="btnSave" name="btnSearch" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDel" name="btnSearch" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
					</div>
				</div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="inptCmndDsctnGridArea2" style="height:243px;"></div>
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

	var jsonWrhsSpmtSe = [];
	var jsonPltBxSe = [];
	var jsonPltBxNm = [];

	var jsonPrdcr				= [];	//생산자 목록
    var jsonPrdcrAutocomplete 	= [];	//생산자 자동완성

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-wrhsSpmtSe', jsonWrhsSpmtSe, 'WRHS_SPMT_SE_CD'),	// 창고
			gfn_setComCdSBSelect('srch-slt-pltBxSe', jsonPltBxSe, 'PLT_BX_SE_CD'),			// 창고
		]);
		fn_search();
	}

	const fn_selectPltBxSe = async function(){
		let pltBxSe = SBUxMethod.get("srch-slt-pltBxSe");
		gfn_setPltBxSBSelect("srch-slt-pltBxNm", jsonPltBxNm, gv_selectedApcCd, pltBxSe);
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-inp-cmndYmd", gfn_dateToYmd(new Date()));

		fn_createGrid();
		fn_createGrid2();
		fn_initSBSelect();
		fn_getPrdcrs();
	});

	var pltBxMngList; // 그리드를 담기위한 객체 선언
	var jsonPltBxMngList = []; // 그리드의 참조 데이터 주소 선언


	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'pltBxMngList';
	    SBGridProperties.jsonref = 'jsonPltBxMngList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList1;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;

	    SBGridProperties.columns = [
	        {caption: ["구분"],			ref: 'pltBxSeNm',      	type:'output',  width:'90px',     style:'text-align:center'},
	        {caption: ["명칭"],			ref: 'pltBxNm',      	type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["대여업체"],		ref: 'pltCnptNm',      	type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["단중 (Kg)"],			ref: 'unitWght',      	type:'output',  width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,### '}},
	        {caption: ["전일재고수량"],		ref: 'ystdBssInvntrQntt',   type:'output',  width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'}},
	        {caption: ["입고수량"],		ref: 'wrhsQntt',      	type:'output',  width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'}},
	        {caption: ["출고수량"],		ref: 'spmtQntt',      	type:'output',  width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'}},
	        {caption: ["현재고수량"],		ref: 'bssInvntrQntt',      type:'output',  width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'}},
			{caption: ["비고"],			ref: 'rmrk',      		type:'output',  width:'170px',    style:'text-align:center'}
	    ];
	    pltBxMngList = _SBGrid.create(SBGridProperties);
	}

	const fn_search = async function(){

		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd");
  		
		if (gfn_isEmpty(cmndYmd)) {
    		gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
		
		var getColRef = grdPltWrhsSpmt.getColRef("checkedYn");
		grdPltWrhsSpmt.setFixedcellcheckboxChecked(0, getColRef, false);

		fn_clearForm();

    	// grid clear
    	jsonPltBxMngList.length = 0;
    	await fn_setPltBxMngList();

    	// grid clear
    	jsonPltWrhsSpmt.length = 0;
    	await fn_setPltWrhsSpmtList();
	}
	
	const fn_setPltBxMngList = async function(){ 
    	const postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxMngList.do", {
			apcCd: gv_selectedApcCd
  		});

        const data = await postJsonPromise;
		try{
			
			if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
			
     		jsonPltWrhsSpmt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
          				apcCd: item.apcCd,
          				pltBxSeCd: item.pltBxSeCd,
          				pltBxSeNm: item.pltBxSeNm,
          				pltBxCd: item.pltBxCd,
          				pltBxNm: item.pltBxNm,
          				unitWght: item.unitWght,
          				useYn: item.useYn,
          				delYn: item.delYn,
          				bssInvntrQntt: item.bssInvntrQntt,
          				wrhsQntt: item.wrhsQntt,
          				spmtQntt: item.spmtQntt,
          				ystdBssInvntrQntt : item.ystdBssInvntrQntt,
          				unitCd: item.unitCd,
          				rmrk: item.rmrk,
          				pltCnptNm: item.pltCnptNm,
				}
      			jsonPltBxMngList.push(pckgCmnd);
  			});
          	
			pltBxMngList.rebuild();
		} catch (e) {
	   		if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }

	var grdPltWrhsSpmt; // 그리드를 담기위한 객체 선언
	var jsonPltWrhsSpmt = []; // 그리드의 참조 데이터 주소 선언

	var comboUesYnJsData = ['입고/출고']
	var comboUesYnJsData1 = ['팔레트/박스']
	var comboUesYnJsData2 = ['명칭']
	var comboUesYnJsData3 = ['생산자']

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea2';
	    SBGridProperties.id = 'grdPltWrhsSpmt';
	    SBGridProperties.jsonref = 'jsonPltWrhsSpmt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList2;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;

	    SBGridProperties.columns = [
        	{caption: ["체크박스"], 	ref: 'checkedYn', 		type: 'checkbox', 	width: '40px',	  style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
	        {caption: ["작업일자"],	ref: 'jobYmd',      	type:'output',  	width:'100px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["입출고구분"],	ref: 'wrhsSpmtSeNm',    type:'output',  	width:'100px',    style:'text-align:center'},
	        {caption: ["구분"],		ref: 'pltBxSeNm',      	type:'output',  	width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],		ref: 'pltNm',      		type:'output',  	width:'100px',    style:'text-align:center'},
	        {caption: ["대여업체"],	ref: 'pltCnptNm',      	type:'output',  	width:'170px',    style:'text-align:center'},
	        {caption: ["단중 (Kg)"],		ref: 'unitWght',      	type:'output',  	width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,### '}},
	        {caption: ["생산자"],		ref: 'prdcrNm',      	type:'output',  	width:'100px',    style:'text-align:center'},
	        {caption: ["수량"],		ref: 'qntt',      		type:'output',  	width:'100px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'}},
		    {caption: ["비고"],		ref: 'rmrk',      		type:'output',  	width:'170px',    style:'text-align:center'}
	    ];

	    grdPltWrhsSpmt = _SBGrid.create(SBGridProperties);

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
			"callback": fn_personalSave1,		//콜백함수명
		},
		"personalLoad" : {
			"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
			"accesskey": "l",					//단축키
			"callback": fn_personalLoad1,		//콜백함수명
		},
		"colHidden" : {
			"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
			"accesskey": "h",					//단축키
			"callback": fn_colHidden1,			//콜백함수명
		},
		"colShow" : {
			"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
			"accesskey": "w",					//단축키
			"callback": fn_colShow1,			//콜백함수명
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
            "callback": fn_personalSave2,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad2,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden2,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow2,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld1() {
    	pltBxMngList.exportLocalExcel("팔레트/박스 재고현황", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave1(){
    	pltBxMngList.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad1(){
    	pltBxMngList.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden1(){
    	pltBxMngList.setColHidden(pltBxMngList.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow1(){
    	for(let i = pltBxMngList.getFixedCols(); i < pltBxMngList.getCols()-1; i++) {
    		pltBxMngList.setColHidden(i, false);
    	}
   	}

    // 엑셀 다운로드
    function fn_excelDwnld2() {
    	grdPltWrhsSpmt.exportLocalExcel("팔레트/박스 입출내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave2(){
    	grdPltWrhsSpmt.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad2(){
    	grdPltWrhsSpmt.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden2(){
    	grdPltWrhsSpmt.setColHidden(grdPltWrhsSpmt.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow2(){
    	for(let i = grdPltWrhsSpmt.getFixedCols(); i < grdPltWrhsSpmt.getCols()-1; i++) {
   			grdPltWrhsSpmt.setColHidden(i, false);
    	}
   	}

	const fn_setPltWrhsSpmtList = async function(){ 
		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd");
    	const postJsonPromise = gfn_postJSON("/am/cmns/selectPltWrhsSpmtList.do", {
			apcCd: gv_selectedApcCd,
			jobYmd: cmndYmd,
			delYn: 'N'
  		});

        const data = await postJsonPromise;
		try{
     		jsonPltWrhsSpmt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
          				apcCd: item.apcCd,
          				jobYmd: item.jobYmd,
          				wrhsSpmtSeCd: item.wrhsSpmtSeCd,
          				wrhsSpmtSeNm: item.wrhsSpmtSeNm,
          				pltBxSeCd: item.pltBxSeCd,
          				pltBxSeNm: item.pltBxSeNm,
          				pltBxCd: item.pltBxCd,
          				prdcrCd: item.prdcrCd,
          				prdcrNm: item.prdcrNm,
          				seqNo: item.seqNo,
          				pltNm: item.pltNm,
          				unitWght: item.unitWght,
          				qntt: item.qntt,
          				rmrk: item.rmrk,
          				delYn: item.delYn,
          				pltCnptNm: item.pltCnptNm,
          				sn: item.sn
				}
      			jsonPltWrhsSpmt.push(pckgCmnd);
  			});

			grdPltWrhsSpmt.rebuild();
          	SBUxMethod.set("crtr-ymd", cmndYmd);
		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
	const fn_save = async function() {
		let apcCd = gv_selectedApcCd;
		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd");
		let wrhsSpmtSeCd = SBUxMethod.get("srch-slt-wrhsSpmtSe");
		let pltBxSeCd = SBUxMethod.get("srch-slt-pltBxSe");
		let pltBxCd = SBUxMethod.get("srch-slt-pltBxNm");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let qntt = SBUxMethod.get("srch-inp-qntt");
		let rmrk = SBUxMethod.get("srch-inp-rmrk");
		let bssInvntrQntt = "";

		if(gfn_isEmpty(cmndYmd)){
			gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(wrhsSpmtSeCd)){
			gfn_comAlert("W0001", "입출고구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(pltBxSeCd)){
			gfn_comAlert("W0001", "구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(pltBxCd)){
			gfn_comAlert("W0001", "명칭");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(qntt) || qntt == 0){
			gfn_comAlert("W0001", "수량");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		if(wrhsSpmtSeCd == '2'){
			for(var i=0; i<jsonPltBxMngList.length; i++){
				if(jsonPltBxMngList[i].pltBxCd == pltBxCd){
					bssInvntrQntt = jsonPltBxMngList[i].bssInvntrQntt;
					if(qntt > jsonPltBxMngList[i].bssInvntrQntt && pltBxSeCd == jsonPltBxMngList[i].pltBxSeCd && apcCd == jsonPltBxMngList[i].apcCd ){
					gfn_comAlert("W0008", "팔레트잔여수량", "입력한팔레트수량");//W0008{0} 보다 {1}이/가 큽니다.
					SBUxMethod.set("srch-inp-qntt", 0);
					return;
					}
				}
			}
		}

		let pltNm = jsonPltBxNm.find(e => e.value == pltBxCd).text;
		let pltBxs = await gfn_getPltBxs(gv_selectedApcCd, pltBxSeCd);
		let unitWght = pltBxs.find(e => e.pltBxCd == pltBxCd).unitWght;



    	var insertList = [{
   			apcCd: apcCd
			,jobYmd: cmndYmd
			,wrhsSpmtSeCd: wrhsSpmtSeCd
			,pltBxSeCd: pltBxSeCd
			,pltBxCd: pltBxCd
			,prdcrCd: prdcrCd
			,qntt: qntt
			,pltNm: pltNm
			,unitWght: unitWght
			,rmrk: rmrk
			,bssInvntrQntt: bssInvntrQntt
    	}];
    	if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/cmns/insertPltWrhsSpmt.do", insertList);
	    	const data = await postJsonPromise;
	    	try{
	       		if(_.isEqual("S", data.resultStatus)){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert(data.resultCode , data.resultMessage);
	       		}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}

	const fn_del = async function(){
		let grdRows = grdPltWrhsSpmt.getCheckedRows(0);
    	let deleteList = [];


    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		deleteList.push(jsonPltWrhsSpmt[nRow-1]);
    	}
    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}
    	if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/cmns/updateDelYnPltWrhsSpmt.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert(data.resultCode , data.resultMessage);
	       		}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}

	// 초기화
	const fn_reset = async function() {
		SBUxMethod.set("srch-inp-cmndYmd", gfn_dateToYmd(new Date()));
		fn_clearForm();
	}
	const fn_clearForm = async function() {
		SBUxMethod.set("srch-slt-wrhsSpmtSe", "");
		SBUxMethod.set("srch-slt-pltBxSe", "");
		SBUxMethod.set("srch-slt-pltBxNm", "");
		fn_clearPrdcr();
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrIdentno", "");
		SBUxMethod.set("srch-inp-qntt", "");
	}

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect(),
			fn_getPrdcrs()
		]);

		fn_reset();
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

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>