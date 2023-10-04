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
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					<sbux-button id="btnEndFclt" name="btnEndFclt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-fclt')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 200px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=fclt-inp-apcNm name="fclt-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnVluIdctrMng" style="height:258px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
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
	    	{caption: ["통합조직명"], 	ref: 'aa',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'jsonComFcltGubun', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["사업자등록번호"], 	ref: 'bb',   type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	        {caption: ["전문품목"], 		ref: 'cc',   type:'input',  width:'200px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ["육성품목"], 	ref: 'dd',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["선정여부"], 	ref: 'ee',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["탈락사유"], 	ref: 'ff',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["신청액"], 	ref: 'gg',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["적용금리"], 	ref: 'hh',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPrdcrCrclOgnVluIdctrMng\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["testNo"], 		ref: 'testNo',   	type:'input',  hidden : false},
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
            			var comCdVO = grdPrdcrCrclOgnVluIdctrMng.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			grdPrdcrCrclOgnVluIdctrMng.deleteRow(nRow);
            		}
            	}else{
            		grdPrdcrCrclOgnVluIdctrMng.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(comCdVO){
		let postJsonPromise = gfn_postJSON("/co/cd/deleteComCdDtl.do", comCdVO);
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

</script>
</html>