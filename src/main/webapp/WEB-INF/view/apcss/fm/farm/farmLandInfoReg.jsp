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
					<div id="sb-area-grdFarmLandInfoReg" style="height:150px; width: 100%;"></div>
				</div>
				<br>
					<div><label>생산농가 상세내역</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>APC 등록</caption>
					<colgroup>
						<col style="width: 35%">
						<col style="width: 65%">
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<th>내용</th>
						</tr>
						<tr>
							<th>농업인 번호</th>
							<td>
								<sbux-input id="dtl-input-frmerSn" name="dtl-input-frmerSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>경영체 등록번호</th>
							<td>
								<sbux-input id="dtl-input-bzobRgno" name="dtl-input-bzobRgno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>농지 일련번호</th>
							<td>
								<sbux-input id="dtl-input-frlndSn" name="dtl-input-frlndSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>법정동코드</th>
							<td>
								<sbux-input id="dtl-input-legaldongCode" name="dtl-input-legaldongCode" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>농지 본번</th>
							<td>
								<sbux-input id="dtl-input-frlndMnnm" name="dtl-input-frlndMnnm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>공동 경작 여부</th>
							<td>
								<sbux-input id="dtl-input-copertnClvtAt" name="dtl-input-copertnClvtAt" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>농지 부번</th>
							<td>
								<sbux-input id="dtl-input-frlndSlno" name="dtl-input-frlndSlno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>농지 주소</th>
							<td>
								<sbux-input id="dtl-input-frlndAdres" name="dtl-input-frlndAdres" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>경작 형태</th>
							<td>
								<sbux-input id="dtl-input-clvtStle" name="dtl-input-clvtStle" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>농지 소유자명</th>
							<td>
								<sbux-input id="dtl-input-frlndOwnerNm" name="dtl-input-frlndOwnerNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>공부 지목</th>
							<td>
								<sbux-input id="dtl-input-ofactLndcgr" name="dtl-input-ofactLndcgr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>실제 지목</th>
							<td>
								<sbux-input id="dtl-input-realLndcgr" name="dtl-input-realLndcgr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>공부 농지 면적</th>
							<td>
								<sbux-input id="dtl-input-ofactFrlndAr" name="dtl-input-ofactFrlndAr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>실제 농지 면적</th>
							<td>
								<sbux-input id="dtl-input-realFrlndAr" name="dtl-input-realFrlndAr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>휴경면적</th>
							<td>
								<sbux-input id="dtl-input-nuseClmgAr" name="dtl-input-nuseClmgAr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>폐경면적</th>
							<td>
								<sbux-input id="dtl-input-nuseQtmgAr" name="dtl-input-nuseQtmgAr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>품목코드</th>
							<td>
								<sbux-input id="dtl-input-prdlstCode" name="dtl-input-prdlstCode" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>품목명</th>
							<td>
								<sbux-input id="dtl-input-predlstNm" name="dtl-input-predlstNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>노지/시설구분</th>
							<td>
								<sbux-input id="dtl-input-eqptFcltyse" name="dtl-input-eqptFcltyse" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>재배변적</th>
							<td>
								<sbux-input id="dtl-input-ctvtAr" name="dtl-input-ctvtAr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>대장 구분 코드</th>
							<td>
								<sbux-input id="dtl-input-ldgrDvcd" name="dtl-input-ldgrDvcd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>시설일련번호</th>
							<td>
								<sbux-input id="dtl-input-eqptSeq" name="dtl-input-eqptSeq" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>시설형태</th>
							<td>
								<sbux-input id="dtl-input-eqptStle" name="dtl-input-eqptStle" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>시설종류</th>
							<td>
								<sbux-input id="dtl-input-eqptKnd" name="dtl-input-eqptKnd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>시설면적</th>
							<td>
								<sbux-input id="dtl-input-fcltyAra" name="dtl-input-fcltyAra" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
							<th>시설설치년도</th>
							<td>
								<sbux-input id="dtl-input-instlYear" name="dtl-input-instlYear" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						<tr>
				</tbody>
				</table>
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
	var grdFarmLandInfoReg;
	var jsonfarmLandInfoReg = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdFarmLandInfoReg', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
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
	    SBGridProperties.parentid = 'sb-area-grdFarmLandInfoReg';
	    SBGridProperties.id = 'grdFarmLandInfoReg';
	    SBGridProperties.jsonref = 'jsonfarmLandInfoReg';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["농업인 번호"], 		ref: 'frmerSn',   	type:'output',  hidden : false},
	    	{caption: ["경영체 등록번호"], 		ref: 'bzobRgno',   	type:'output',  hidden : false},
	    	{caption: ["농지 일련번호"], 		ref: 'frlndSn',   	type:'output',  hidden : false},
	    	{caption: ["법정동코드"], 		ref: 'legaldongCode',   	type:'output',  hidden : false},
	    	{caption: ["농지 본번"], 		ref: 'frlndMnnm',   	type:'output',  hidden : false},
	    	{caption: ["공동 경작 여부"], 		ref: 'copertnClvtAt',   	type:'output',  hidden : false},
	    	{caption: ["농지 부번"], 		ref: 'frlndSlno',   	type:'output',  hidden : false},
	    	{caption: ["농지 주소"], 		ref: 'frlndAdres',   	type:'output',  hidden : false},
	    	{caption: ["경작 형태"], 		ref: 'clvtStle',   	type:'output',  hidden : false},
	    	{caption: ["농지 소유자명"], 		ref: 'frlndOwnerNm',   	type:'output',  hidden : false},
	    	{caption: ["공부 지목"], 		ref: 'ofactLndcgr',   	type:'output',  hidden : false},
	    	{caption: ["실제 지목"], 		ref: 'realLndcgr',   	type:'output',  hidden : false},
	    	{caption: ["공부 농지 면적"], 		ref: 'ofactFrlndAr',   	type:'output',  hidden : false},
	    	{caption: ["실제 농지 면적"], 		ref: 'realFrlndAr',   	type:'output',  hidden : false},
	    	{caption: ["휴경면적"], 		ref: 'nuseClmgAr',   	type:'output',  hidden : false},
	    	{caption: ["폐경면적"], 		ref: 'nuseQtmgAr',   	type:'output',  hidden : false},
	    	{caption: ["품목코드"], 		ref: 'prdlstCode',   	type:'output',  hidden : false},
	    	{caption: ["품목명"], 		ref: 'predlstNm',   	type:'output',  hidden : false},
	    	{caption: ["노지/시설구분"], 		ref: 'eqptFcltyse',   	type:'output',  hidden : false},
	    	{caption: ["재배변적"], 		ref: 'ctvtAr',   	type:'output',  hidden : false},
	    	{caption: ["대장 구분 코드"], 		ref: 'ldgrDvcd',   	type:'output',  hidden : false},
	    	{caption: ["시설일련번호"], 		ref: 'eqptSeq',   	type:'output',  hidden : false},
	    	{caption: ["시설형태"], 		ref: 'eqptStle',   	type:'output',  hidden : false},
	    	{caption: ["시설종류"], 		ref: 'eqptKnd',   	type:'output',  hidden : false},
	    	{caption: ["시설면적"], 		ref: 'fcltyAra',   	type:'output',  hidden : false},
	    	{caption: ["시설설치년도"], 		ref: 'instlYear',   	type:'output',  hidden : false},

// 	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["통합조직 코드"], 	ref: 'iiCode',   	type:'input', hidden:true},
	        /*
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	console.log(strValue);
	        	if(strValue== null || strValue == ""){
	        		console.log("통합조직 값없음");
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdFarmLandInfoReg\", " + nRow + ", " + nCol + ")'></sbux-button>"
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdFarmLandInfoReg\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdFarmLandInfoReg\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		console.log("통합조직 값있음");
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdFarmLandInfoReg\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdFarmLandInfoReg\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        */
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdFarmLandInfoReg\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdFarmLandInfoReg\", " + nRow + ")'>삭제</button>";
	        	}
	        }}
	    ];

	    grdFarmLandInfoReg = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdFarmLandInfoReg.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdFarmLandInfoReg.bind('click', 'fn_view');

	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let ccCode = SBUxMethod.get("srch-inp-itemCd1");//전문품목
		let iiCode = SBUxMethod.get("srch-inp-apcCd2");//통합조직
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/fm/farm/selectfarmLandInfoReg.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/fm/farm/selectfarmLandInfoRegList.do", {
    		ccCode : ccCode
    		,iiCode : iiCode
		});
        let data = await postJsonPromise;
        try{
        	jsonfarmLandInfoReg.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let farmLandInfoRegVO = {
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
				jsonfarmLandInfoReg.push(farmLandInfoRegVO);
			});



        	grdFarmLandInfoReg.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdFarmLandInfoReg.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdFarmLandInfoReg.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdFarmLandInfoReg.getRowData(i);
			let rowSts = grdFarmLandInfoReg.getRowStatus(i);
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
			let postJsonPromise = gfn_postJSON("/fm/farm/multiSavefarmLandInfoRegList.do", saveList);
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
            if (grid === "grdFarmLandInfoReg") {
            	grdFarmLandInfoReg.setCellData(nRow, nCol, "N", true);
            	//grdFarmLandInfoReg.setCellData(nRow, 5, gv_apcCd, true);
            	grdFarmLandInfoReg.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdFarmLandInfoReg") {
            	if(grdFarmLandInfoReg.getRowStatus(nRow) == 0 || grdFarmLandInfoReg.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var farmLandInfoRegVO = grdFarmLandInfoReg.getRowData(nRow);
            			fn_deleteRsrc(farmLandInfoRegVO);
            			grdFarmLandInfoReg.deleteRow(nRow);
            		}
            	}else{
            		grdFarmLandInfoReg.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(farmLandInfoRegVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deletefarmLandInfoReg.do", farmLandInfoRegVO);
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
            if (grid === "grdFarmLandInfoReg") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdFarmLandInfoReg.setCellData(nRow, nCol, "N", true);
            }
        }
    }


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열


	//상세정보 보기 클릭이벤트
    function fn_view() {
    	console.log("******************fn_view**********************************");
    	var nCol = grdFarmLandInfoReg.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFarmLandInfoReg.getRow();
		if (nRow < 1) {
            return;
		}

		if(nRow == null){
			nRow = 1;
		}

			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdFarmLandInfoReg.getRowData(nRow);
		console.log(rowData);
		console.log(rowData.operOgnzTrmtItemCn);
		console.log(gfn_isEmpty(rowData.operOgnzTrmtItemCn));
		console.log(rowData.operOgnzTrmtItemCn2);
		console.log(gfn_isEmpty(rowData.operOgnzTrmtItemCn2));

    	SBUxMethod.set("dtl-input-frmerSn", rowData.frmerSn);                           //  농업인 번호
		SBUxMethod.set("dtl-input-bzobRgno", rowData.bzobRgno);                             //  경영체 등록번호
    	SBUxMethod.set("dtl-input-frlndSn", rowData.frlndSn);             //  농지 일련번호
    	SBUxMethod.set("dtl-input-legaldongCode", rowData.legaldongCode);             //  법정동코드
    	SBUxMethod.set("dtl-input-frlndMnnm", rowData.frlndMnnm);                         //  농지 본번
    	SBUxMethod.set("dtl-input-copertnClvtAt", rowData.copertnClvtAt);                       //  공동 경작 여부
    	SBUxMethod.set("dtl-input-frlndSlno", rowData.frlndSlno);                             //  농지 부번
        SBUxMethod.set("dtl-input-frlndAdres", rowData.frlndAdres);                         //  농지 주소
        SBUxMethod.set("dtl-input-clvtStle", rowData.clvtStle);                     //  경작 형태
        SBUxMethod.set("dtl-input-frlndOwnerNm", rowData.frlndOwnerNm);                     //  농지 소유자명
        SBUxMethod.set("dtl-input-ofactLndcgr", rowData.ofactLndcgr);                 //  공부 지목
        SBUxMethod.set("dtl-input-realLndcgr", rowData.realLndcgr);                   // 실제 지목
        SBUxMethod.set("dtl-input-ofactFrlndAr", rowData.ofactFrlndAr);                   //  공부 농지 면적
        SBUxMethod.set("dtl-input-realFrlndAr", rowData.realFrlndAr);               //  실제 농지 면적
        SBUxMethod.set("dtl-input-nuseClmgAr", rowData.nuseClmgAr);           //  휴경면적
        SBUxMethod.set("dtl-input-nuseQtmgAr", rowData.nuseQtmgAr);           //  폐경면적
        SBUxMethod.set("dtl-input-prdlstCode", rowData.prdlstCode);           //  품목코드
        SBUxMethod.set("dtl-input-predlstNm", rowData.predlstNm);           //  품목명
        SBUxMethod.set("dtl-input-eqptFcltyse", rowData.eqptFcltyse);           //  노지/시설구분
        SBUxMethod.set("dtl-input-ctvtAr", rowData.ctvtAr);           //  재배면적
        SBUxMethod.set("dtl-input-ldgrDvcd", rowData.ldgrDvcd);           //  대장 구분 코드
        SBUxMethod.set("dtl-input-eqptSeq", rowData.eqptSeq);           //  시설형태
        SBUxMethod.set("dtl-input-eqptKnd", rowData.eqptKnd);           //  시설종류
        SBUxMethod.set("dtl-input-fcltyAra", rowData.fcltyAra);           //  시설면적
        SBUxMethod.set("dtl-input-instlYear", rowData.instlYear);           //  시설설치년도
    }


	//그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdFarmLandInfoReg 그리드 객체
        selGridRow = grdFarmLandInfoReg.getRow();
        selGridCol = grdFarmLandInfoReg.getCol();


        let delYnCol = grdFarmLandInfoReg.getColRef('delYn');
        let delYnValue = grdFarmLandInfoReg.getCellData(selGridRow,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //cc 전문 품목 dd 육성 품목
        let ccCol = grdFarmLandInfoReg.getColRef('cc');
        let ddCol = grdFarmLandInfoReg.getColRef('dd');
        let iiCol = grdFarmLandInfoReg.getColRef('ii');

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
			let colRefIdx1 = grdFarmLandInfoReg.getColRef('ii');//ii 통합조직 인덱스
			let colRefIdx2 = grdFarmLandInfoReg.getColRef('iiCode');//ii 통합조직 코드 인덱스

			//그리드 값 세팅
			grdFarmLandInfoReg.setCellData(selGridRow,colRefIdx1,rowData.mainCodeNm,true);
			grdFarmLandInfoReg.setCellData(selGridRow,colRefIdx2,rowData.mainCode,true);
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
			let selRef = grdFarmLandInfoReg.getRefOfCol(selGridCol);

			//구분하기 편하기 위해 ref 값이 cc라면 코드값은 ccCode 로 설정
			let colRefIdx1 = grdFarmLandInfoReg.getColRef(selRef);//품목명 인덱스
			let colRefIdx2 = grdFarmLandInfoReg.getColRef(selRef+"Code");//품목코드 인덱스

			//그리드 값 세팅
			grdFarmLandInfoReg.setCellData(selGridRow,colRefIdx1,rowData.itemNm,true);
			grdFarmLandInfoReg.setCellData(selGridRow,colRefIdx2,rowData.itemCd,true);
		}
	}

</script>
</html>