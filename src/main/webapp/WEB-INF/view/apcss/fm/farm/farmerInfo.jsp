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
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 일반현황정보 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					<sbux-button id="btnSaveFrm" name="btnSaveFrm" uitype="normal" text="연계 등록(농업인일련번호)" class="btn btn-sm btn-outline-danger" onclick="fn_saveFrmerSn"></sbux-button>
					<sbux-button id="btnSaveFrmBtdt" name="btnSaveFrmBtdt" uitype="normal" text="연계 등록(성명생년월일)" class="btn btn-sm btn-outline-danger" onclick="fn_saveBrdt"></sbux-button>
					<sbux-button id="btnSaveFrmBcno" name="btnSaveFrmBcno" uitype="normal" text="연계 등록(법인등록번호)" class="btn btn-sm btn-outline-danger" onclick="fn_saveBcno"></sbux-button>
					<sbux-button id="btnSaveFrmBtdtAll" name="btnSaveFrmBtdtAll" uitype="normal" text="연계 등록(사용자전체)" class="btn btn-sm btn-outline-danger" onclick="fn_saveBrdtAll"></sbux-button>
					<sbux-button id="btnSaveFrmBcnoAll" name="btnSaveFrmBcnoAll" uitype="normal" text="연계 등록(사용자법인전체)" class="btn btn-sm btn-outline-danger" onclick="fn_saveBcnoAll"></sbux-button>
					<sbux-button id="btnSaveFrmBcnoDeptAll" name="btnSaveFrmBcnoDeptAll" uitype="normal" text="연계 등록(산지조직법인전체)" class="btn btn-sm btn-outline-danger" onclick="fn_saveBcnoDeptAll"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>

					<tbody>
						<tr>
							<th scope="row">농업인 번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-frmerSn" name="srch-inp-frmerSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">경영체 등록번호</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-bzobRgno" name="srch-inp-bzobRgno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">성명</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-reprNm" name="srch-inp-reprNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">생년월일</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-brthdy" name="srch-inp-brthdy" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">법인등록번호</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-bzmCorpNo" name="srch-inp-bzmCorpNo" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdfarmerInfo" style="height:650px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>


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
	var jsonfarmerInfo = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdfarmerInfo', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
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
	    SBGridProperties.parentid = 'sb-area-grdfarmerInfo';
	    SBGridProperties.id = 'grdfarmerInfo';
	    SBGridProperties.jsonref = 'jsonfarmerInfo';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdfarmerInfo\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	    	{caption: ["농업인 번호"], 		ref: 'frmerSn',   	type:'input',  style:'text-align:center', hidden : false},
	        {caption: ["경영체 등록번호"], 	ref: 'bzobRgno',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["경영주 및 경영주와 의 관계"], 	ref: 'mngerRelate',   	type:'input',     style:'text-align:center' ,width: '180px'},
	        {caption: ["경영주 법인 명"], 	ref: 'bzmCorpNm',   	type:'input',     style:'text-align:left' ,width: '200px'},
	        {caption: ["경영주 주민등록 주소"], 	ref: 'addr',   	type:'input',     style:'text-align:left' ,width: '300px'},
	        {caption: ["경영주 실거주 주소"], 	ref: 'rrsdAddr',   	type:'input',     style:'text-align:left' ,width: '300px'},
	        {caption: ["경영주 실거주 도로명 주소"], 	ref: 'rdnmAddr',   	type:'input',     style:'text-align:left' ,width: '300px'},
	        {caption: ["마을명"], 	ref: 'twNm',   	type:'input',     style:'text-align:left' ,width: '100px'},
	        {caption: ["개인 법인 구분코드명"], 	ref: 'perCorpDvcdNm',   	type:'input',     style:'text-align:center' ,width: '150px'},
	        {caption: ["내외국인 구분코드명"], 	ref: 'nafoDvcdNm',   	type:'input',     style:'text-align:center' ,width: '150px'},
	        {caption: ["전화번호"], 	ref: 'telno',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["휴대 전화번호"], 	ref: 'mblTelno',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["팩스 전화번호"], 	ref: 'faxTelno',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["이메일 주소"], 	ref: 'emailAddr',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["영농 시작 일자"], 	ref: 'famgStrYmd',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["농업시작형태"], 	ref: 'farmngBeginStleCdNm',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["농업종사형태"], 	ref: 'farmngEngageStleCdNm',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["설립 년도"], 	ref: 'fndtYr',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["사업자 등록 번호"], 	ref: 'bzmRgno',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["대표자 명"], 	ref: 'reprNm',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["대표자 주소"], 	ref: 'reprAddr',   	type:'input',     style:'text-align:left' ,width: '300px'},
	        {caption: ["생년월일"], 	ref: 'brthdy',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["성별"], 	ref: 'sexdstn',   	type:'input',     style:'text-align:center' ,width: '100px'},
	        {caption: ["시스템최초입력일시"], 	ref: 'sysFrstInptDt',   	type:'input',     style:'text-align:center' ,width: '160px'},
	        {caption: ["시스템최초입력사용자ID"], 	ref: 'sysFrstInptUserId',   	type:'input',     style:'text-align:center' ,width: '160px'},
	        {caption: ["시스템최초입력프로그램ID"], 	ref: 'sysFrstInptPrgrmId',   	type:'input',     style:'text-align:center' ,width: '160px'},
	        {caption: ["시스템최종변경일시"], 	ref: 'sysLastChgDt',   	type:'input',     style:'text-align:center' ,width: '160px'},
	        {caption: ["시스템최종변경사용자ID"], 	ref: 'sysLastChgUserId',   	type:'input',     style:'text-align:center' ,width: '160px'},
	        {caption: ["시스템최종변경프로그램ID"], 	ref: 'sysLastChgPrgrmId',   	type:'input',     style:'text-align:center' ,width: '160px'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdfarmerInfo\", " + nRow + ")'>삭제</button>";
	        	}
	        }}

// 	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["통합조직 코드"], 	ref: 'iiCode',   	type:'input', hidden:true},
	        /*
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	console.log(strValue);
	        	if(strValue== null || strValue == ""){
	        		console.log("통합조직 값없음");
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'></sbux-button>"
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		console.log("통합조직 값있음");
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdfarmerInfo\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        */
	    ];

	    grdfarmerInfo = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdfarmerInfo.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdfarmerInfo.bind('click','gridClick');

	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");//
		let bzobRgno = SBUxMethod.get("srch-inp-bzobRgno");//
		let brthdy = SBUxMethod.get("srch-inp-brthdy");
		let reprNm = SBUxMethod.get("srch-inp-reprNm");
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/fm/farm/selectfarmerInfo.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/fm/farm/selectFarmerInfoList.do", {
    		 frmerSn : frmerSn
    		,bzobRgno : bzobRgno
    		,brthdy : brthdy
    		,reprNm : reprNm
		});
        let data = await postJsonPromise;
        try{
        	jsonfarmerInfo.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let farmerInfoVO = {
					frmerSn : item.frmerSn
				  , bzobRgno 		: item.bzobRgno
				  , mngerRelate 	: item.mngerRelate
				  , bzmCorpNm 	: item.bzmCorpNm
				  , addr 		: item.addr
				  , rrsdAddr 		: item.rrsdAddr
				  , rdnmAddr 		: item.rdnmAddr
				  , twNm 		: item.twNm
				  , perCorpDvcdNm 		: item.perCorpDvcdNm
				  , nafoDvcdNm 		: item.nafoDvcdNm
				  , telno 		: item.telno
				  , mblTelno 		: item.mblTelno
				  , faxTelno 		: item.faxTelno
				  , emailAddr 		: item.emailAddr
				  , famgStrYmd 		: item.famgStrYmd
				  , farmngEngageStleCdNm 		: item.farmngEngageStleCdNm
				  , fndtYr 		: item.fndtYr
				  , bzmRgno 		: item.bzmRgno
				  , reprNm 		: item.reprNm
				  , reprAddr 		: item.reprAddr
				  , brthdy 		: item.brthdy
				  , sexdstn 		: item.sexdstn
				  , sysFrstInptDt 		: item.sysFrstInptDt
				  , sysFrstInptUserId 		: item.sysFrstInptUserId
				  , sysFrstInptPrgrmId 		: item.sysFrstInptPrgrmId
				  , sysLastChgDt 		: item.sysLastChgDt
				  , sysLastChgUserId 		: item.sysLastChgUserId
				  , sysLastChgPrgrmId 		: item.sysLastChgPrgrmId
				  , delYn 		: item.delYn
				}
				jsonfarmerInfo.push(farmerInfoVO);
			});



        	grdfarmerInfo.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdfarmerInfo.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdfarmerInfo.getGridDataAll();
		let saveList = [];
		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdfarmerInfo.getRowData(i);
			let rowSts = grdfarmerInfo.getRowStatus(i);
			let frmerSn = rowData.frmerSn;
			let bzobRgno = rowData.bzobRgno;
			let delYn = rowData.delYn;
			console.log("================delYn================"+delYn);
			if(delYn == 'N'){

				if (gfn_isEmpty(frmerSn)) {
		  			gfn_comAlert("W0002", "농업인 번호");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				 if (gfn_isEmpty(bzobRgno)) {
		  			gfn_comAlert("W0001", "경영체 등록번호");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}
				 console.log("rowData==========="+ rowData );
				 console.log("================gridClick================");
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
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveFarmerInfoList.do", saveList);
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
            if (grid === "grdfarmerInfo") {
            	grdfarmerInfo.setCellData(nRow, nCol, "N", true);
            	//grdfarmerInfo.setCellData(nRow, 5, gv_apcCd, true);
            	grdfarmerInfo.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdfarmerInfo") {
            	if(grdfarmerInfo.getRowStatus(nRow) == 0 || grdfarmerInfo.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var farmerInfoVO = grdfarmerInfo.getRowData(nRow);
            			fn_deleteRsrc(farmerInfoVO);
            			grdfarmerInfo.deleteRow(nRow);
            		}
            	}else{
            		grdfarmerInfo.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(farmerInfoVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deleteFarmerInfo.do", farmerInfoVO);
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
            if (grid === "grdfarmerInfo") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdfarmerInfo.setCellData(nRow, nCol, "N", true);
            }
        }
    }


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

    //그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdfarmerInfo 그리드 객체
        selGridRow = grdfarmerInfo.getRow();
        selGridCol = grdfarmerInfo.getCol();


        let delYnCol = grdfarmerInfo.getColRef('delYn');
        let delYnValue = grdfarmerInfo.getCellData(selGridRow,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
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
			let colRefIdx1 = grdfarmerInfo.getColRef('ii');//ii 통합조직 인덱스
			let colRefIdx2 = grdfarmerInfo.getColRef('iiCode');//ii 통합조직 코드 인덱스

			//그리드 값 세팅
			grdfarmerInfo.setCellData(selGridRow,colRefIdx1,rowData.mainCodeNm,true);
			grdfarmerInfo.setCellData(selGridRow,colRefIdx2,rowData.mainCode,true);
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
			let selRef = grdfarmerInfo.getRefOfCol(selGridCol);

			//구분하기 편하기 위해 ref 값이 cc라면 코드값은 ccCode 로 설정
			let colRefIdx1 = grdfarmerInfo.getColRef(selRef);//품목명 인덱스
			let colRefIdx2 = grdfarmerInfo.getColRef(selRef+"Code");//품목코드 인덱스

			//그리드 값 세팅
			grdfarmerInfo.setCellData(selGridRow,colRefIdx1,rowData.itemNm,true);
			grdfarmerInfo.setCellData(selGridRow,colRefIdx2,rowData.itemCd,true);
		}
	}











	/* 농업인 일련번호 연계 저장*/
	const fn_saveFrmerSn= async function(){
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");

		if (gfn_isEmpty(frmerSn)) {
  			gfn_comAlert("W0002", "농업인 번호");		//	W0002	{0}을/를 입력하세요.
            return;
  		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyfarmerInfoList.do", {
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyFarmerInfoJsoneList.do", {
	    		 frmerSn : frmerSn
	 		});
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



	/* 농업인 성명/생년월일 연계 저장*/
	const fn_saveBrdt= async function(){
		let reprNm = SBUxMethod.get("srch-inp-reprNm"); //성명
		let brthdy = SBUxMethod.get("srch-inp-brthdy"); // 생년월일

		if (gfn_isEmpty(reprNm)) {
  			gfn_comAlert("W0002", "성명");		//	W0002	{0}을/를 입력하세요.
            return;
  		}
		if (gfn_isEmpty(brthdy)) {
  			gfn_comAlert("W0002", "생년월일");		//	W0002	{0}을/를 입력하세요.
            return;
  		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyfarmerInfoList.do", {
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyFarmerInfoJsoneBrdtList.do", {
				  reprNm : reprNm
	    		 ,brthdy : brthdy
	 		});
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



	/* 농업인 법인등록번호 연계 저장*/
	const fn_saveBcno= async function(){
		let crno = SBUxMethod.get("srch-inp-bzmCorpNo");

		if (gfn_isEmpty(crno)) {
  			gfn_comAlert("W0002", "법인등록번호");		//	W0002	{0}을/를 입력하세요.
            return;
  		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyfarmerInfoList.do", {
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoList.do", {
				crno : crno
	 		});
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



	/* 농업인 법인등록번호(전체) 연계 저장*/
	const fn_saveBcnoAll= async function(){
		let crno = SBUxMethod.get("srch-inp-bzmCorpNo");

		/* if (gfn_isEmpty(crno)) {
  			gfn_comAlert("W0002", "법인등록번호");		//	W0002	{0}을/를 입력하세요.
            return;
  		} */

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyfarmerInfoList.do", {
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoAllList.do", {
				test : ""
	 		});
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


	/* 농업인 법인등록번호(전체) 연계 저장*/
	const fn_saveBrdtAll= async function(){
		let crno = SBUxMethod.get("srch-inp-bzmCorpNo");

		/* if (gfn_isEmpty(crno)) {
  			gfn_comAlert("W0002", "법인등록번호");		//	W0002	{0}을/를 입력하세요.
            return;
  		} */

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyfarmerInfoList.do", {
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyFarmerInfoJsoneBrdtAllList.do", {
				test : ""
	 		});
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

	/* 농업인 법인등록번호(전체) 연계 저장*/
	const fn_saveBcnoDeptAll= async function(){
		let crno = SBUxMethod.get("srch-inp-bzmCorpNo");

		/* if (gfn_isEmpty(crno)) {
  			gfn_comAlert("W0002", "법인등록번호");		//	W0002	{0}을/를 입력하세요.
            return;
  		} */

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyfarmerInfoList.do", {
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveReleyFarmerInfoJsoneBcnoDeptAllList.do", {
				test : ""
	 		});
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




</script>
</html>