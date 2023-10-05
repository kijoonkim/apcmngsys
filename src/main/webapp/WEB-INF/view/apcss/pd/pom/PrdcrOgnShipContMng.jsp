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
					<div id="sb-area-grdPrdcrOgnShipContMng" style="height:350px; width: 100%;"></div>
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
	var jsonPrdcrOgnShipContMng = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdPrdcrOgnShipContMng', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
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
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnShipContMng';
	    SBGridProperties.id = 'grdPrdcrOgnShipContMng';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnShipContMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["일련번호"], 		ref: 'testNo',   	type:'input',  hidden : false},
	    	{caption: ["구분"], 	ref: 'aa',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'jsonComFcltGubun', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
// 	        {caption: ["사업자등록번호"], 	ref: 'bb',   type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["사업자등록번호"], 	ref: 'iiCode',   	type:'input',  width:'80px',    style:'text-align:center' ,  editable : false},
	        {caption: ["전문품목"], 		ref: 'cc',   type:'output',  width:'200px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ["전문품목 코드"], 	ref: 'ccCode',   	type:'input', width:'80px', style:'text-align:center' ,  editable : false},
	        {caption: ["육성품목"], 	ref: 'dd',   	type:'output',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["육성품목 코드"], 	ref: 'ddCode',   	type:'input',width:'80px', style:'text-align:center' ,  editable : false},
	        {caption: ["선정여부"], 	ref: 'ee',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["탈락사유"], 	ref: 'ff',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["신청액"], 	ref: 'gg',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["적용금리"], 	ref: 'hh',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
// 	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["통합조직 코드"], 	ref: 'iiCode',   	type:'input', hidden:true},
	        /*
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	console.log(strValue);
	        	if(strValue== null || strValue == ""){
	        		console.log("통합조직 값없음");
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrOgnShipContMng\", " + nRow + ", " + nCol + ")'></sbux-button>"
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdPrdcrOgnShipContMng\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrOgnShipContMng\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		console.log("통합조직 값있음");
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdPrdcrOgnShipContMng\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrOgnShipContMng\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        */
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPrdcrOgnShipContMng\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPrdcrOgnShipContMng\", " + nRow + ")'>삭제</button>";
	        	}
	        }}
	    ];

	    grdPrdcrOgnShipContMng = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdPrdcrOgnShipContMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdPrdcrOgnShipContMng.bind('click','gridClick');

	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let ccCode = SBUxMethod.get("srch-inp-itemCd1");//전문품목
		let iiCode = SBUxMethod.get("srch-inp-apcCd2");//통합조직
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/pd/pom/selectPrdcrOgnShipContMng.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/pd/pom/selectPrdcrOgnShipContMngList.do", {
    		ccCode : ccCode
    		,iiCode : iiCode
		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrOgnShipContMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrOgnShipContMngVO = {
					testNo 		: item.testNo
				  , aa 		: item.aa
				  , bb 		: item.bb
				  , cc 	: item.cc
				  , ccCode 	: item.ccCode
				  , dd 	: item.dd
				  , ddCode 	: item.ddCode
				  , ee 		: item.ee
				  , ff 		: item.ff
				  , gg 		: item.gg
				  , hh 		: item.hh
				  , ii 		: item.ii
				  , iiCode 		: item.iiCode
				  , delYn 		: item.delYn
				}
				jsonPrdcrOgnShipContMng.push(PrdcrOgnShipContMngVO);
			});



        	grdPrdcrOgnShipContMng.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdPrdcrOgnShipContMng.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdPrdcrOgnShipContMng.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdPrdcrOgnShipContMng.getRowData(i);
			let rowSts = grdPrdcrOgnShipContMng.getRowStatus(i);
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
			let postJsonPromise = gfn_postJSON("/pd/pom/multiSavePrdcrOgnShipContMngList.do", saveList);
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
            if (grid === "grdPrdcrOgnShipContMng") {
            	grdPrdcrOgnShipContMng.setCellData(nRow, nCol, "N", true);
            	//grdPrdcrOgnShipContMng.setCellData(nRow, 5, gv_apcCd, true);
            	grdPrdcrOgnShipContMng.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdPrdcrOgnShipContMng") {
            	if(grdPrdcrOgnShipContMng.getRowStatus(nRow) == 0 || grdPrdcrOgnShipContMng.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var PrdcrOgnShipContMngVO = grdPrdcrOgnShipContMng.getRowData(nRow);
            			fn_deleteRsrc(PrdcrOgnShipContMngVO);
            			grdPrdcrOgnShipContMng.deleteRow(nRow);
            		}
            	}else{
            		grdPrdcrOgnShipContMng.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(PrdcrOgnShipContMngVO){
		let postJsonPromise = gfn_postJSON("/pd/pom/deletePrdcrOgnShipContMng.do", PrdcrOgnShipContMngVO);
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
            if (grid === "grdPrdcrOgnShipContMng") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdPrdcrOgnShipContMng.setCellData(nRow, nCol, "N", true);
            }
        }
    }


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

    //그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdPrdcrOgnShipContMng 그리드 객체
        selGridRow = grdPrdcrOgnShipContMng.getRow();
        selGridCol = grdPrdcrOgnShipContMng.getCol();


        let delYnCol = grdPrdcrOgnShipContMng.getColRef('delYn');
        let delYnValue = grdPrdcrOgnShipContMng.getCellData(selGridRow,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //cc 전문 품목 dd 육성 품목
        let ccCol = grdPrdcrOgnShipContMng.getColRef('cc');
        let ddCol = grdPrdcrOgnShipContMng.getColRef('dd');
        let iiCol = grdPrdcrOgnShipContMng.getColRef('ii');

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
			let colRefIdx1 = grdPrdcrOgnShipContMng.getColRef('ii');//ii 통합조직 인덱스
			let colRefIdx2 = grdPrdcrOgnShipContMng.getColRef('iiCode');//ii 통합조직 코드 인덱스

			//그리드 값 세팅
			grdPrdcrOgnShipContMng.setCellData(selGridRow,colRefIdx1,rowData.mainCodeNm,true);
			grdPrdcrOgnShipContMng.setCellData(selGridRow,colRefIdx2,rowData.mainCode,true);
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
			let selRef = grdPrdcrOgnShipContMng.getRefOfCol(selGridCol);

			//구분하기 편하기 위해 ref 값이 cc라면 코드값은 ccCode 로 설정
			let colRefIdx1 = grdPrdcrOgnShipContMng.getColRef(selRef);//품목명 인덱스
			let colRefIdx2 = grdPrdcrOgnShipContMng.getColRef(selRef+"Code");//품목코드 인덱스

			//그리드 값 세팅
			grdPrdcrOgnShipContMng.setCellData(selGridRow,colRefIdx1,rowData.itemNm,true);
			grdPrdcrOgnShipContMng.setCellData(selGridRow,colRefIdx2,rowData.itemCd,true);
		}
	}

</script>
</html>