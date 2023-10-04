<%
 /**
  * @Class Name : rawMtrWghReg.jsp
  * @Description : 원물계량등록 화면
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
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">APC에서 운영하고 있는 선별기와 포장기를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">설비가 없는 APC는 설비명을 "수작업" 으로 등록해야합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFcltList"></sbux-button>
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
					<div id="sb-area-grdFclt" style="height:258px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	SBUxMethod.set("inp-apcCd", gv_apcCd);
	//fn_initSBSelect();
	fn_fcltMngCreateGrid();
})


	//설비 등록
	var jsonFclt = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdFclt', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
		])

	}
	const fn_fcltMngCreateGrid = async function() {

		SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdFclt';
	    SBGridProperties.id = 'grdFclt';
	    SBGridProperties.jsonref = 'jsonFclt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["설비구분"], 	ref: 'cdId',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'jsonComFcltGubun', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["설비 명"], 	ref: 'cdVlNm',   type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
	        {caption: ["비고"], 		ref: 'cdVlExpln',   type:'input',  width:'200px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ["표시순서"], 	ref: 'indctSeq',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdFclt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdFclt\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["설비 코드"], 		ref: 'cdVlCd',   	type:'input',  hidden:true},
	    ];
	    grdFclt = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdFclt.refresh({"combo":true});

	}

	const fn_searchFcltList = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/co/cd/selectFcltList.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/pd/pcorm/selectPrdcrCrclOgnVluIdctrMngList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        try{
        	jsonFclt.length = 0;
        	data.resultList.forEach((item, index) => {
				let fcltVO = {
					rowSeq 		: item.rowSeq
				  , cdVl 		: item.cdVl
				  , cdVlNm 		: item.cdVlNm
				  , cdVlExpln 	: item.cdVlExpln
				  , indctSeq 	: item.indctSeq
				  , delYn 		: item.delYn
				  , apcCd 		: item.apcCd
				  , cdId 		: item.cdId
				}
				jsonFclt.push(fcltVO);
			});
        	grdFclt.rebuild();
        	grdFclt.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}




	const fn_saveFcltList = async function(){


		let gridData = grdFclt.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdFclt.getRowData(i);
			let rowSts = grdFclt.getRowStatus(i);
			let fcltNm = rowData.cdVlNm;
			let fcltGubun = rowData.cdId;
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if (gfn_isEmpty(fcltNm)) {
		  			gfn_comAlert("W0002", "설비명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				if (gfn_isEmpty(fcltGubun)) {
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

			let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
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


	 // Row 추가 및 삭제 기능

    function fn_procRow(gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "cnptMngDatagrid") {
            	cnptMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
            	cnptMngGridData[nRow-1].delYn = "N";
            	cnptMngDatagrid.addRow(true);
            }else if (grid === "grdFclt") {
            	grdFclt.setCellData(nRow, nCol, "N", true);
            	grdFclt.setCellData(nRow, 5, gv_apcCd, true);
            	grdFclt.addRow(true);
            }else if (grid === "grdWarehouse") {
            	grdWarehouse.setCellData(nRow, nCol, "N", true);
            	grdWarehouse.setCellData(nRow, 4, gv_apcCd, true);
            	grdWarehouse.setCellData(nRow, 5, "WAREHOUSE_SE_CD", true);
            	grdWarehouse.addRow(true);
            }else if(grid === "grdPlt"){
            	grdPlt.setCellData(nRow, nCol, "N", true);
            	grdPlt.setCellData(nRow, 4, "2", true);
            	grdPlt.setCellData(nRow, 6, "Y", true);
            	grdPlt.setCellData(nRow, 8, "P", true);
            	grdPlt.setCellData(nRow, 9, gv_apcCd, true);
            	grdPlt.addRow(true);
            }else if(grid === "grdBx"){
            	grdBx.setCellData(nRow, nCol, "N", true);
            	grdBx.setCellData(nRow, 4, "2", true);
            	grdBx.setCellData(nRow, 6, "Y", true);
            	grdBx.setCellData(nRow, 8, "B", true);
            	grdBx.setCellData(nRow, 9, gv_apcCd, true);
            	grdBx.addRow(true);
            }else if(grid === "grdPckg"){
            	grdPckg.setCellData(nRow, nCol, "N", true);
            	grdPckg.setCellData(nRow, 5, gv_apcCd, true);
            	grdPckg.setCellData(nRow, 6, "PCKG_SE_CD", true);
            	grdPckg.addRow(true);
            }else if(grid === "rgnTrsprtCstMngDatagrid"){
            	rgnTrsprtCstMngDatagrid.setCellData(nRow, nCol, "N", true);
            	rgnTrsprtCstMngDatagrid.setCellData(nRow, 5, gv_apcCd, true);
            	rgnTrsprtCstMngDatagrid.addRow(true);
            }else if(grid === "wrhsVhclMngDatagrid"){
            	wrhsVhclMngGridData[nRow-1].delYn = "N";
            	wrhsVhclMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
				wrhsVhclMngDatagrid.addRow();
            }else if(grid === "grdSpmtTrsprtCo"){
            	spmtTrsprtMngGridData[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
            	spmtTrsprtMngGridData[nRow-1].delYn = "N";
            	grdSpmtTrsprtCo.addRow(true);
            }else if(grid === "grdOprtr"){
            	jsonOprtr[nRow-1].apcCd = SBUxMethod.get("inp-apcCd");
            	jsonOprtr[nRow-1].delYn = "N";
            	grdOprtr.addRow(true);
            }else if(grid === "grdApcVrty"){
            	grdApcVrty.setCellData(nRow, nCol, "N", true);
            	grdApcVrty.setCellData(nRow, 6, gv_apcCd, true);
            	grdApcVrty.setCellData(nRow, 7, SBUxMethod.get("vrty-inp-itemCd"), true);
            	grdApcVrty.addRow(true);
            }else if(grid === "grdStdGrd"){
            	if(!(SBUxMethod.get("grd-slt-itemCd") == null || SBUxMethod.get("grd-slt-itemCd") == "")){
            		grdStdGrd.setCellData(nRow, nCol, "N", true);
            		grdStdGrd.setCellData(nRow, 4, gv_apcCd, true);
            		grdStdGrd.setCellData(nRow, 5, SBUxMethod.get("grd-slt-itemCd"), true);
            		grdStdGrd.setCellData(nRow, 6, SBUxMethod.get("grd-rdo-grdSeCd"), true);
            		grdStdGrd.addRow(true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdStdGrdDtl"){
            	if(!(SBUxMethod.get("grd-slt-itemCd") == null || SBUxMethod.get("grd-slt-itemCd") == "")){

					let rowData = grdStdGrd.getRowData(grdStdGrd.getRow());
            		grdStdGrdDtl.setCellData(nRow, nCol, "N", true);
            		grdStdGrdDtl.setCellData(nRow, 4, gv_apcCd, true);
            		grdStdGrdDtl.setCellData(nRow, 5, rowData.itemCd, true);
            		grdStdGrdDtl.setCellData(nRow, 6, rowData.grdSeCd, true);
            		grdStdGrdDtl.setCellData(nRow, 7, rowData.grdKnd, true);
            		grdStdGrdDtl.addRow(true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdStdGrdJgmt"){
            	if(!(SBUxMethod.get("grd-slt-itemCd") == null || SBUxMethod.get("grd-slt-itemCd") == "")){

					grdStdGrdJgmt.setCellData(nRow, nCol, "N", true);
					grdStdGrdJgmt.setCellData(nRow, 7, gv_apcCd, true);
					grdStdGrdJgmt.setCellData(nRow, 8, SBUxMethod.get("grd-slt-itemCd"), true);
					grdStdGrdJgmt.setCellData(nRow, 9, SBUxMethod.get("grd-rdo-grdSeCd"), true);
					grdStdGrdJgmt.addRow(true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdApcSpcfct"){
            	if(!(SBUxMethod.get("spcfct-slt-itemCd") == null || SBUxMethod.get("spcfct-slt-itemCd") == "")){
            		grdApcSpcfct.setCellData(nRow, nCol, "N", true);
            		grdApcSpcfct.setCellData(nRow, 7, gv_apcCd, true);
            		grdApcSpcfct.setCellData(nRow, 8, SBUxMethod.get("spcfct-slt-itemCd"), true);
            		grdApcSpcfct.addRow(true);
            	}else{
            		alert("품목을 선택해주세요.")
            		return;
            	}
            }else if(grid === "grdSmptPckgUnit"){
           		grdSpmtPckgUnit.setCellData(nRow, nCol, "N", true);
           		grdSpmtPckgUnit.setCellData(nRow, 9, gv_apcCd, true);
           		grdSpmtPckgUnit.addRow(true);
            }else if(grid === "grdSpmtSlsUntprcReg"){
            	grdSpmtSlsUntprcReg.setCellData(nRow, nCol, "N", true);
            	grdSpmtSlsUntprcReg.setCellData(nRow, 4, SBUxMethod.get("spmtSlsUntprcReg-inp-spmtPckgUnitCd"), true);
            	grdSpmtSlsUntprcReg.setCellData(nRow, 5, gv_apcCd, true);
            	grdSpmtSlsUntprcReg.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "cnptMngDatagrid") {
            	if(cnptMngDatagrid.getRowStatus(nRow) == 0 || cnptMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var cnpt = cnptMngDatagrid.getRowData(nRow);
            			fn_deleteCnptList(cnpt);
            			cnptMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		cnptMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "grdFclt") {
            	if(grdFclt.getRowStatus(nRow) == 0 || grdFclt.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = grdFclt.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			grdFclt.deleteRow(nRow);
            		}
            	}else{
            		grdFclt.deleteRow(nRow);
            	}
            }else if (grid === "grdWarehouse") {
            	if(grdWarehouse.getRowStatus(nRow) == 0 || grdWarehouse.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var comCdVO = grdWarehouse.getRowData(nRow);
            			fn_deleteRsrc(comCdVO);
            			grdWarehouse.deleteRow(nRow);
            		}
            	}else{
            		warehouseMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "grdPlt") {
            	if(grdPlt.getRowStatus(nRow) == 0 || grdPlt.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var pltBxVO = grdPlt.getRowData(nRow);
            			console.log(pltBxVO);
            			fn_deletepltBx(pltBxVO);
            			grdPlt.deleteRow(nRow);
            		}
            	}else{
           		grdPlt.deleteRow(nRow);
            	}
            }else if (grid === "grdBx") {
            	if(grdBx.getRowStatus(nRow) == 0 || grdBx.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var pltBxVO = grdBx.getRowData(nRow);
            			fn_deletepltBx(pltBxVO);
            			grdBx.deleteRow(nRow);
            		}
            	}else{
           		grdBx.deleteRow(nRow);
            	}
            }else if (grid === "rgnTrsprtCstMngDatagrid") {
            	if(rgnTrsprtCstMngDatagrid.getRowStatus(nRow) == 0 || rgnTrsprtCstMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rgnTrsprtCst = rgnTrsprtCstMngDatagrid.getRowData(nRow);
            			fn_deleteRgnTrsprtCstList(rgnTrsprtCst);
            			rgnTrsprtCstMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		rgnTrsprtCstMngDatagrid.deleteRow(nRow);
            	}
            }else if (grid === "wrhsVhclMngDatagrid") {
            	if(wrhsVhclMngDatagrid.getRowStatus(nRow) == 0 || wrhsVhclMngDatagrid.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var wrhsVhclVo = wrhsVhclMngDatagrid.getRowData(nRow);
            			fn_deleteWrhsVhclList(wrhsVhclVo);
            			wrhsVhclMngDatagrid.deleteRow(nRow);
            		}
            	}else{
            		wrhsVhclMngDatagrid.deleteRow(nRow);
            	}
            	wrhsVhclMngDatagrid.deleteRow(nRow);
            }else if (grid === "grdSpmtTrsprtCo") {
            	if(grdSpmtTrsprtCo.getRowStatus(nRow) == 0 || grdSpmtTrsprtCo.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var spmtTrsprt = grdSpmtTrsprtCo.getRowData(nRow);
            			fn_deleteSpmtTrsprtList(spmtTrsprt);
            			grdSpmtTrsprtCo.deleteRow(nRow);
            		}
            	}else{
            		grdSpmtTrsprtCo.deleteRow(nRow);
            	}
            }else if (grid === "grdOprtr") {
            	if(grdOprtr.getRowStatus(nRow) == 0 || grdOprtr.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var oprtrVO = grdOprtr.getRowData(nRow);
            			fn_deleteOprtrList(oprtrVO);
            			grdOprtr.deleteRow(nRow);
            		}
            	}else{
            		grdOprtr.deleteRow(nRow);
            	}
            }else if (grid === "grdStdGrd") {
            	if(grdStdGrd.getRowStatus(nRow) == 0 || grdStdGrd.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var stdGrdVO = grdStdGrd.getRowData(nRow);
            			fn_deleteGrd(stdGrdVO);
            			grdStdGrd.deleteRow(nRow);
            		}
            	}else{
            		grdStdGrd.deleteRow(nRow);
            	}
            }else if (grid === "grdStdGrdDtl") {
            	if(grdStdGrdDtl.getRowStatus(nRow) == 0 || grdStdGrdDtl.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var stdGrdDtlVO = grdStdGrdDtl.getRowData(nRow);
            			fn_deleteGrdDtl(stdGrdDtlVO);
            			grdStdGrdDtl.deleteRow(nRow);
            		}
            	}else{
            		grdStdGrdDtl.deleteRow(nRow);
            	}
            }else if (grid === "grdStdGrdJgmt") {
            	if(grdStdGrdJgmt.getRowStatus(nRow) == 0 || grdStdGrdJgmt.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var stdGrdJgmtVO = grdStdGrdJgmt.getRowData(nRow);
            			fn_deleteGrdJgmt(stdGrdJgmtVO);
            			grdStdGrdJgmt.deleteRow(nRow);
            		}
            	}else{
            		grdStdGrdJgmt.deleteRow(nRow);
            	}
            }else if (grid === "grdApcSpcfct") {
            	if(grdApcSpcfct.getRowStatus(nRow) == 0 || grdApcSpcfct.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var cmnsSpcfctVO = grdApcSpcfct.getRowData(nRow);
            			fn_deleteSpcfct(cmnsSpcfctVO);
            			grdApcSpcfct.deleteRow(nRow);
            		}
            	}else{
            		grdApcSpcfct.deleteRow(nRow);
            	}
            }else if (grid === "grdSmptPckgUnit") {
            	if(grdSpmtPckgUnit.getRowStatus(nRow) == 0 || grdSpmtPckgUnit.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var spmtPckgUnitVO = grdSpmtPckgUnit.getRowData(nRow);
            			fn_deleteSpmtPckgUnit(spmtPckgUnitVO);
            			grdSpmtPckgUnit.deleteRow(nRow);
            		}
            	}else{
            		grdSpmtPckgUnit.deleteRow(nRow);
            	}
            }else if (grid === "grdSpmtSlsUntprcReg") {
            	if(grdSpmtSlsUntprcReg.getRowStatus(nRow) == 0 || grdSpmtSlsUntprcReg.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var spmtSlsUntprcRegVO = grdSpmtSlsUntprcReg.getRowData(nRow);
            			fn_deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
            			grdSpmtSlsUntprcReg.deleteRow(nRow);
            		}
            	}else{
            		grdSpmtSlsUntprcReg.deleteRow(nRow);
            	}
            }
        }
    }

</script>
</html>