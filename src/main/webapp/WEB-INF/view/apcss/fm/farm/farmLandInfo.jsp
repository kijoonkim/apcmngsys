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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>

					<tbody>
						<tr>
							<th scope="row">생산유통통합조직</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd2" name="srch-inp-apcCd2" uitype="hidden" ></sbux-input>
								<sbux-input id="srch-inp-apcNm2" name="srch-inp-apcNm2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-apc2" name="srch-btn-apc2" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-invstmntSpmt" onclick="fn_choiceInvstmntSpmt" />
							</td>
							<th class="th_bg">전문품목</th>
							<td class="td_input" style="border-right:hidden;">
							    	<sbux-input id="srch-inp-itemCd1" name="srch-inp-itemCd1" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="srch-inp-itemNm1" name="srch-inp-itemNm1" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
							</td>
							<td>
									<sbux-button id="srch-btn-item1" name="srch-btn-item1" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(1)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td colspan="2" style="border-left: hidden;"></td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdfarmLandInfo" style="height:650px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>

    <!-- 통합조직,출자출하조직 선택 Modal -->
    <!-- 2023 09 22 ljw 통합조직 출자출하조직 리스트 팝업 생성 -->
    <div>
        <sbux-modal
        	id="modal-invstmntSpmt"
        	name="modal-invstmntSpmt"
        	uitype="middle"
        	header-title="통합조직,출자출하조직 선택"
        	body-html-id="body-modal-invstmntSpmt"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-invstmntSpmt">
<%--     	<jsp:include page="../popup/InvstmntSpmtPopup.jsp"></jsp:include> --%>
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/InvstmntSpmtPopup.jsp"></jsp:include>
    </div>


    <!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemSelect" name="modal-itemSelect" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemSelect" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/ItemSelectPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		/*
		gfn_setComCdSBSelect(
				'dtl-slt-frstApprv',
				jsonDSFA,
			'IOPD_COFM_CD');

		gfn_setComCdSBSelect(
				'dtl-slt-scndApprv',
				jsonDSSA,
			'IOPD_SED_COFM_CD');

		gfn_setComCdSBSelect(
				'dtl-slt-orgNm',
				jsonDSON,
			'IOPD_CMPTNT_ORG');

		gfn_setComCdSBSelect(
				'dtl-slt-athrt',
				jsonDSA,
			'IOPD_ATHRT'); */

		const elements = document.querySelectorAll(".srch-keyup-area");

		for (let i = 0; i < elements.length; i++) {
		  	const el = elements.item(i);
		  	el.addEventListener("keyup", (event) => {
		  		if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
		  			fn_search();
		  		}
		  		//key	Enter
		  		//keyCode
		  	});
		}
	})

	/**
	 * 조회 조건 select combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),	// 품종
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,  	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록
		]);

		SBUxMethod.set("dtl-rdo-gdsSeCd", '1');
	}


	//설비 등록
	var jsonfarmLandInfo = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdfarmLandInfo', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
		])

	}


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdfarmLandInfo';
	    SBGridProperties.id = 'grdfarmLandInfo';
	    SBGridProperties.jsonref = 'jsonfarmLandInfo';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["농업인 번호"], 		ref: 'frmerSn',   	type:'input',  hidden : false},
	    	{caption: ["경영체 등록번호"], 		ref: 'bzobRgno',   	type:'input',  hidden : false},
	    	{caption: ["농지 일련번호"], 		ref: 'frlndSn',   	type:'input',  hidden : false},
	    	{caption: ["법정동코드"], 		ref: 'legaldongCode',   	type:'input',  hidden : false},
	    	{caption: ["농지 본번"], 		ref: 'frlndMnnm',   	type:'input',  hidden : false},
	    	{caption: ["공동 경작 여부"], 		ref: 'copertnClvtAt',   	type:'input',  hidden : false},
	    	{caption: ["농지 부번"], 		ref: 'frlndSlno',   	type:'input',  hidden : false},
	    	{caption: ["농지 주소"], 		ref: 'frlndAdres',   	type:'input',  hidden : false},
	    	{caption: ["경작 형태"], 		ref: 'clvtStle',   	type:'input',  hidden : false},
	    	{caption: ["농지 소유자명"], 		ref: 'frlndOwnerNm',   	type:'input',  hidden : false},
	    	{caption: ["공부 지목"], 		ref: 'ofactLndcgr',   	type:'input',  hidden : false},
	    	{caption: ["실제 지목"], 		ref: 'realLndcgr',   	type:'input',  hidden : false},
	    	{caption: ["공부 농지 면적"], 		ref: 'ofactFrlndAr',   	type:'input',  hidden : false},
	    	{caption: ["실제 농지 면적"], 		ref: 'realFrlndAr',   	type:'input',  hidden : false},
	    	{caption: ["휴경면적"], 		ref: 'nuseClmgAr',   	type:'input',  hidden : false},
	    	{caption: ["폐경면적"], 		ref: 'nuseQtmgAr',   	type:'input',  hidden : false},
	    	{caption: ["품목코드"], 		ref: 'prdlstCode',   	type:'input',  hidden : false},
	    	{caption: ["품목명"], 		ref: 'predlstNm',   	type:'input',  hidden : false},
	    	{caption: ["노지/시설구분"], 		ref: 'eqptFcltyse',   	type:'input',  hidden : false},
	    	{caption: ["재배변적"], 		ref: 'ctvtAr',   	type:'input',  hidden : false},
	    	{caption: ["대장 구분 코드"], 		ref: 'ldgrDvcd',   	type:'input',  hidden : false},
	    	{caption: ["시설일련번호"], 		ref: 'eqptSeq',   	type:'input',  hidden : false},
	    	{caption: ["시설형태"], 		ref: 'eqptStle',   	type:'input',  hidden : false},
	    	{caption: ["시설종류"], 		ref: 'eqptKnd',   	type:'input',  hidden : false},
	    	{caption: ["시설면적"], 		ref: 'fcltyAra',   	type:'input',  hidden : false},
	    	{caption: ["시설설치년도"], 		ref: 'instlYear',   	type:'input',  hidden : false},

// 	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["통합조직 코드"], 	ref: 'iiCode',   	type:'input', hidden:true},
	        /*
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	console.log(strValue);
	        	if(strValue== null || strValue == ""){
	        		console.log("통합조직 값없음");
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdfarmLandInfo\", " + nRow + ", " + nCol + ")'></sbux-button>"
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdfarmLandInfo\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdfarmLandInfo\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		console.log("통합조직 값있음");
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdfarmLandInfo\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdfarmLandInfo\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        */
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdfarmLandInfo\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdfarmLandInfo\", " + nRow + ")'>삭제</button>";
	        	}
	        }}
	    ];

	    grdfarmLandInfo = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdfarmLandInfo.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdfarmLandInfo.bind('click','gridClick');

	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let ccCode = SBUxMethod.get("srch-inp-itemCd1");//전문품목
		let iiCode = SBUxMethod.get("srch-inp-apcCd2");//통합조직
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/fm/farm/selectfarmLandInfo.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/fm/farm/selectfarmLandInfoList.do", {
    		ccCode : ccCode
    		,iiCode : iiCode
		});
        let data = await postJsonPromise;
        try{
        	jsonfarmLandInfo.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let farmLandInfoVO = {
					frmerSn 		: item.frmerSn
				  , bzobRgno 		: item.bzobRgno
				  , frlndSn 		: item.frlndSn
				  , legaldongCode 	: item.legaldongCode
				  , frlndMnnm 	: item.frlndMnnm
				  , copertnClvtAt 	: item.copertnClvtAt
				  , frlndSlno 	: item.frlndSlno
				  , frlndAdres 		: item.frlndAdres
				  , clvtStle 		: item.clvtStle
				  , frlndOwnerNm 		: item.frlndOwnerNm
				  , ofactLndcgr 		: item.ofactLndcgr
				  , realLndcgr 		: item.realLndcgr
				  , ofactFrlndAr 		: item.ofactFrlndAr
				  , realFrlndAr 		: item.realFrlndAr
				  , nuseClmgAr 	: item.nuseClmgAr
				  , nuseQtmgAr 	: item.nuseQtmgAr
				  , prdlstCode 		: item.prdlstCode
				  , predlstNm 		: item.predlstNm
				  , eqptFcltyse 		: item.eqptFcltyse
				  , ctvtAr 		: item.ctvtAr
				  , ldgrDvcd 		: item.ldgrDvcd
				  , eqptSeq 		: item.eqptSeq
				  , eqptStle 		: item.eqptStle
				  , eqptKnd 		: item.eqptKnd
				  , fcltyAra 		: item.fcltyAra
				  , instlYear 		: item.instlYear
				  , sysFrstInptDt 		: item.sysFrstInptDt
				  , sysFrstInptUserId 		: item.sysFrstInptUserId
				  , sysFrstInptPrgrmId 		: item.sysFrstInptPrgrmId
				  , sysLastChgDt 		: item.sysLastChgDt
				  , sysLastChgUserId 		: item.sysLastChgUserId
				  , sysLastChgPrgrmId 		: item.sysLastChgPrgrmId
				  , delYn 		: item.delYn
				}
				jsonfarmLandInfo.push(farmLandInfoVO);
			});



        	grdfarmLandInfo.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdfarmLandInfo.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdfarmLandInfo.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdfarmLandInfo.getRowData(i);
			let rowSts = grdfarmLandInfo.getRowStatus(i);
			let bb = rowData.bb;
			let aa = rowData.aa;
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if (gfn_isEmpty(aa)) {
		  			gfn_comAlert("W0002", "설비명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				/* if (gfn_isEmpty(bb)) {
		  			gfn_comAlert("W0001", "설비구분");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		} */

				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSavefarmLandInfoList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchFcltList();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }

		}
	}


	/* Grid Row 추가 및 삭제 기능*/
    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "grdfarmLandInfo") {
            	grdfarmLandInfo.setCellData(nRow, nCol, "N", true);
            	//grdfarmLandInfo.setCellData(nRow, 5, gv_apcCd, true);
            	grdfarmLandInfo.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdfarmLandInfo") {
            	if(grdfarmLandInfo.getRowStatus(nRow) == 0 || grdfarmLandInfo.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var farmLandInfoVO = grdfarmLandInfo.getRowData(nRow);
            			fn_deleteRsrc(farmLandInfoVO);
            			grdfarmLandInfo.deleteRow(nRow);
            		}
            	}else{
            		grdfarmLandInfo.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(farmLandInfoVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deletefarmLandInfo.do", farmLandInfoVO);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        	}else{
        		alert("삭제 도중 오류가 발생 되었습니다.");
        	}
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}


	//통합조직,출자출하조직 팝업
	const fn_choiceInvstmntSpmt = function() {
		popInvstmntSpmt.init(gv_selectedApcCd, gv_selectedApcNm, fn_setInvstmntSpmt);
	}
	//통합조직 출자출하조직 팝업 콜백함수
	const fn_setInvstmntSpmt = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("srch-inp-apcCd1", rowData.subCode);
			SBUxMethod.set("srch-inp-apcNm1", rowData.subCodeNm);
			SBUxMethod.set("srch-inp-apcCd2", rowData.mainCode);
			SBUxMethod.set("srch-inp-apcNm2", rowData.mainCodeNm);
		}
	}


	// 품목 선택 팝업 호출
	const fn_modalItemSelect = function(sn) {
		console.log("================fn_modalItemSelect================");
		console.log(sn);
		popItemSelect.init(sn,fn_setItem);
	}
	// 품목 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		console.log("================fn_setItem================");
		console.log(itemVal);
		if (!gfn_isEmpty(itemVal)) {
			SBUxMethod.set('srch-inp-itemCd' + itemVal.sn , itemVal.itemCd);
			SBUxMethod.set('srch-inp-itemNm' + itemVal.sn , itemVal.itemNm);
		}
	}



    function fn_GridPop(gubun, grid, nRow, nCol) {
    	console.log("================fn_GridPop================");
        if (gubun === "pop") {
            if (grid === "grdfarmLandInfo") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdfarmLandInfo.setCellData(nRow, nCol, "N", true);
            }
        }
    }


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

    //그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdfarmLandInfo 그리드 객체
        selGridRow = grdfarmLandInfo.getRow();
        selGridCol = grdfarmLandInfo.getCol();


        let delYnCol = grdfarmLandInfo.getColRef('delYn');
        let delYnValue = grdfarmLandInfo.getCellData(selGridRow,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //cc 전문 품목 dd 육성 품목
        let ccCol = grdfarmLandInfo.getColRef('cc');
        let ddCol = grdfarmLandInfo.getColRef('dd');
        let iiCol = grdfarmLandInfo.getColRef('ii');

        if(selGridRow == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	if (selGridCol == iiCol){
        		//통합조직 선택 세팅
        		//통합조직 팝업 객체 popInvstmntSpmt
        		popInvstmntSpmt.init(gv_selectedApcCd, gv_selectedApcNm, fn_setGridInvstmntSpmt);
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-invstmntSpmt
        		SBUxMethod.openModal('modal-invstmntSpmt');
        	} else if (selGridCol == ccCol || selGridCol == ddCol){
        		//품목 선택 세팅
        		//품목 선택 팝업 객체 popItemSelect
        		popItemSelect.init(selGridRow, fn_setGridItem);
        		//팝업창 오픈
        		//품목 팝업창 id : modal-itemSelect
        		SBUxMethod.openModal('modal-itemSelect');
        	}
        }
    }

 	// 그리드의 통합조직 선택 팝업 콜백 함수
	const fn_setGridInvstmntSpmt = function(rowData) {
		console.log("================fn_setGridInvstmntSpmt================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow 선택된 행 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let colRefIdx1 = grdfarmLandInfo.getColRef('ii');//ii 통합조직 인덱스
			let colRefIdx2 = grdfarmLandInfo.getColRef('iiCode');//ii 통합조직 코드 인덱스

			//그리드 값 세팅
			grdfarmLandInfo.setCellData(selGridRow,colRefIdx1,rowData.mainCodeNm,true);
			grdfarmLandInfo.setCellData(selGridRow,colRefIdx2,rowData.mainCode,true);
		}
	}

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		console.log("================fn_setGridItem================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdfarmLandInfo.getRefOfCol(selGridCol);

			//구분하기 편하기 위해 ref 값이 cc라면 코드값은 ccCode 로 설정
			let colRefIdx1 = grdfarmLandInfo.getColRef(selRef);//품목명 인덱스
			let colRefIdx2 = grdfarmLandInfo.getColRef(selRef+"Code");//품목코드 인덱스

			//그리드 값 세팅
			grdfarmLandInfo.setCellData(selGridRow,colRefIdx1,rowData.itemNm,true);
			grdfarmLandInfo.setCellData(selGridRow,colRefIdx2,rowData.itemCd,true);
		}
	}

</script>
</html>