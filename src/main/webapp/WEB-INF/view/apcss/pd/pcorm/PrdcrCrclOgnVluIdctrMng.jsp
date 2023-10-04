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
					<div id="sb-area-grdPrdcrCrclOgnVluIdctrMng" style="height:350px; width: 100%;"></div>
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





	//설비 등록
	var jsonPrdcrCrclOgnVluIdctrMng = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdPrdcrCrclOgnVluIdctrMng', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
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
	    SBGridProperties.parentid = 'sb-area-grdPrdcrCrclOgnVluIdctrMng';
	    SBGridProperties.id = 'grdPrdcrCrclOgnVluIdctrMng';
	    SBGridProperties.jsonref = 'jsonPrdcrCrclOgnVluIdctrMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["일련번호"], 		ref: 'testNo',   	type:'input',  hidden : false},
	    	{caption: ["구분"], 	ref: 'aa',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'jsonComFcltGubun', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["사업자등록번호"], 	ref: 'bb',   type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	        {caption: ["전문품목"], 		ref: 'cc',   type:'input',  width:'200px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ["육성품목"], 	ref: 'dd',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["선정여부"], 	ref: 'ee',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["탈락사유"], 	ref: 'ff',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["신청액"], 	ref: 'gg',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["적용금리"], 	ref: 'hh',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_modalItemSelect(\"ADD\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	    ];
	    grdPrdcrCrclOgnVluIdctrMng = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdPrdcrCrclOgnVluIdctrMng.refresh({"combo":true});

	}



/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/pd/pcorm/selectPrdcrCrclOgnVluIdctrMng.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/pd/pcorm/selectPrdcrCrclOgnVluIdctrMngList.do", {
	  		pagingYn : 'Y'
		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnVluIdctrMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let prdcrCrclOgnVluIdctrMngVO = {
					testNo 		: item.testNo
				  , aa 		: item.aa
				  , bb 		: item.bb
				  , cc 	: item.cc
				  , dd 	: item.dd
				  , ee 		: item.ee
				  , ff 		: item.ff
				  , gg 		: item.gg
				  , hh 		: item.hh
				  , delYn 		: item.delYn
				}
				jsonPrdcrCrclOgnVluIdctrMng.push(prdcrCrclOgnVluIdctrMngVO);
			});



        	grdPrdcrCrclOgnVluIdctrMng.rebuild();
        	grdPrdcrCrclOgnVluIdctrMng.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdPrdcrCrclOgnVluIdctrMng.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdPrdcrCrclOgnVluIdctrMng.getRowData(i);
			let rowSts = grdPrdcrCrclOgnVluIdctrMng.getRowStatus(i);
			let bb = rowData.bb;
			let aa = rowData.aa;
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if (gfn_isEmpty(aa)) {
		  			gfn_comAlert("W0002", "설비명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				if (gfn_isEmpty(bb)) {
		  			gfn_comAlert("W0001", "설비구분");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}

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
			let postJsonPromise = gfn_postJSON("/pd/pcorm/multiSavePrdcrCrclOgnVluIdctrMngList.do", saveList);
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
            if (grid === "grdPrdcrCrclOgnVluIdctrMng") {
            	grdPrdcrCrclOgnVluIdctrMng.setCellData(nRow, nCol, "N", true);
            	//grdPrdcrCrclOgnVluIdctrMng.setCellData(nRow, 5, gv_apcCd, true);
            	grdPrdcrCrclOgnVluIdctrMng.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdPrdcrCrclOgnVluIdctrMng") {
            	if(grdPrdcrCrclOgnVluIdctrMng.getRowStatus(nRow) == 0 || grdPrdcrCrclOgnVluIdctrMng.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var prdcrCrclOgnVluIdctrMngVO = grdPrdcrCrclOgnVluIdctrMng.getRowData(nRow);
            			fn_deleteRsrc(prdcrCrclOgnVluIdctrMngVO);
            			grdPrdcrCrclOgnVluIdctrMng.deleteRow(nRow);
            		}
            	}else{
            		grdPrdcrCrclOgnVluIdctrMng.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(prdcrCrclOgnVluIdctrMngVO){
		let postJsonPromise = gfn_postJSON("/pd/pcorm/deletePrdcrCrclOgnVluIdctrMng.do", prdcrCrclOgnVluIdctrMngVO);
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
		popItemSelect.init(sn,fn_setItem);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		if (!gfn_isEmpty(itemVal)) {
			SBUxMethod.set('srch-inp-itemCd' + itemVal.sn , itemVal.itemCd);
			SBUxMethod.set('srch-inp-itemNm' + itemVal.sn , itemVal.itemNm);
		}
	}



    function fn_GridPop(gubun, grid, nRow, nCol) {
        if (gubun === "pop") {
            if (grid === "grdPrdcrCrclOgnVluIdctrMng") {
            	grdPrdcrCrclOgnVluIdctrMng.setCellData(nRow, nCol, "N", true);
            	//grdPrdcrCrclOgnVluIdctrMng.setCellData(nRow, 5, gv_apcCd, true);
            	//grdPrdcrCrclOgnVluIdctrMng.addRow(true);
            }
        }
    }

</script>
</html>