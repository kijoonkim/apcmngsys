<%
 /**
  * @Class Name : purSalCrtrInfo.jsp
  * @Description : 매출기준정보
  * @author SI개발부
  * @since 2024.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.23   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 매출기준정보</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 매출기준정보 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-success"
						onclick="fn_save"
					></sbux-button>
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
							<th scope="row" class="th_bg">기준유형</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-crtrType"
									name="srch-slt-crtrType"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonSlsCrtrType"
									style="max-width:80%;"
								></sbux-select>
							</td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="display: flex; flex-direction: row; height: 40vh; gap :10px">

						<div style="flex: 1">
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>매출기준 목록</span>
									</li>
								</ul>
							</div>
							<div id="sb-area-grdSlsCrtrList" style="height:500px;"></div>
						</div>
						<div style="flex :1 ">
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>매출기준 상세정보</span>
									</li>
								</ul>
							</div>
							<div id="sb-area-grdSlsCrtrDtlList" style="height:500px;"></div>
						</div>

				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">


	//매출기준유형
	var jsonSlsCrtrType = [];

	//매출기준
	var jsonSlsCrtrList = [];
	var grdSlscrtrList;
	//매출기준상세
	var jsonSlsCrtrDtlList = [];
	var grdSlsCrtrDtlList;

	//매출지정품목
	var jsonSlsDsgnItem = [];
	//매출전표
	var jsonSlsSlipCrtr = [];
	//품목코드
	var jsonItemCd = [];
	//품종코드
	var jsonVrtyCd = [];

	//기준코드
	var jsonCrtrCd = [];
	//사용여부
	var jsonUseYn = [];
	//매출전표기본
	var jsonSlsSLipBsc = [];
	//출하포장단위
	var jsonSpmtPckgUnit =[];
	//거래처
	var jsonCnpt = [];

	//상세코드
	var jsonDtlCd = [];
	//상세 기준 코드
	var jsonDtlCrtrCd = [];


	const fn_initSBSelect = async function() {
		//jsonSlsCrtrType = await gfn_getComCdDtls('SLS_CRTR_TYPE');
		await gfn_setComCdSBSelect('srch-slt-crtrType', jsonSlsCrtrType, 'SLS_CRTR_TYPE');
		await fn_selectSpmtPckgUnit();
		await fn_selectCnptList();
		jsonUseYn = await gfn_getComCdDtls('USE_YN');
		jsonSlsDsgnItem = await gfn_getComCdDtls('SLS_DSGN_ITEM');
		jsonSlsSlipCrtr = await gfn_getComCdDtls('SLS_SLIP_CRTR');
		jsonSlsSLipBsc = await gfn_getComCdDtls('SLS_SLIP_BSC');
		jsonItemCd = await gfn_getApcItem(gv_selectedApcCd);
		jsonVrtyCd = await gfn_getApcVrty(gv_selectedApcCd);
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
		await fn_setCrtrCd();
		jsonCrtrCd = [...jsonSlsDsgnItem,...jsonSlsSlipCrtr,...jsonItemCd,...jsonVrtyCd,...jsonSpmtPckgUnit];
		fn_createSlsCrtrList();
		fn_createSlsCrtrDtlList();
		await fn_search();
    }



    const fn_createSlsCrtrList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSlsCrtrList';
	    SBGridProperties.id = 'grdSlscrtrList';
	    SBGridProperties.jsonref = 'jsonSlsCrtrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	 {caption: [""], 		ref: 'itemCd', 		type:'button', width:'6%', style: 'text-align:center',
                 renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                	 if (gfn_isEmpty(objRowData.delYn)){
						 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(\"grdSlscrtrList\"," + nRow + ")'>추가</button>";
					 } else{
						 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(\"grdSlscrtrList\"," + nRow + ")'>삭제</button>";
					 }
                 }},
            {caption: ["기준유형코드"], ref : 'slsCrtrType', type: 'combo', typeinfo : {ref : 'jsonSlsCrtrType', label : 'label', value :'value',oneclickedit :true },width:'15.3%', style:'text-align:center'},
            {caption: ["기준코드"], ref: 'crtrCd', type:'combo', typeinfo :{ref :'jsonCrtrCd',label:'cdVlNm',value :'cdVl',oneclickedit: true,filtering : {usemode: true, uppercol :'slsCrtrType', attrname :'cdId'}},width:'15.3%', style:'text-align:center'},
/*
            {caption: ["기준코드"], ref: 'crtrCd', type:'combo', typeinfo :{ref :'jsonSlsSlipCrtr',label:'cdVlNm',value :'cdVl',oneclickedit: true, filtering : {usemode: true, uppercol :'slsCrtrType', attrname :'cdId'}},width:'15%', style:'text-align:center'},
*/
			{caption: ["기준값"], ref: 'crtrVl', type:'input', typeinfo : {mask : {alias :'numeric'},oneclickedit: true}, width:'15.3%', style:'text-align:center'},
			{caption: ["기준표시명"], ref: 'crtrIndctNm', type:'input',typeinfo :{oneclickedit: true}, width:'15.3%', style:'text-align:center'},
			{caption: ["표시순서"],  ref: 'indctSeq', type:'input', typeinfo : {mask : {alias :'numeric'},oneclickedit: true}, width:'17.4%', style:'text-align:center'},
			{caption: ["사용여부"], ref: 'useYn', type:'combo',typeinfo : {ref :'jsonUseYn',label:'cdVlNm', value:'cdVl', oneclickedit: true},width:'15.3%', style:'text-align:center'},
		];
		grdSlscrtrList = _SBGrid.create(SBGridProperties);
		//grdSlscrtrList.bind('click', 'fn_grdSlsCrtrClick');
		grdSlscrtrList.bind('rowchanged', 'fn_clickGrdSlsCrtr');
    }

    const fn_createSlsCrtrDtlList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSlsCrtrDtlList';
	    SBGridProperties.id = 'grdSlsCrtrDtlList';
	    SBGridProperties.jsonref = 'jsonSlsCrtrDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
			{caption: [""], 		ref: 'itemCd', 		type:'button', width:'6%', style: 'text-align:center',
				renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					if (gfn_isEmpty(objRowData.delYn)){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(\"grdSlsCrtrDtlList\"," + nRow + ", 1)'>추가</button>";
					} else{
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(\"grdSlsCrtrDtlList\"," + nRow + ")'>삭제</button>";
					}
				}},
            {caption: ["기준코드"], ref: 'crtrCd', type:'combo', typeinfo :{ref :'jsonCrtrCd',label:'cdVlNm',value :'cdVl',oneclickedit: true},width:'18.5%', style:'text-align:center'},
            {caption: ["상세코드"], ref: 'dtlCd', type:'combo', typeinfo : {ref:'jsonDtlCd',label:'cdVlNm', value:'cdVl',oneclickedit: true},width:'18.5%', style:'text-align:center' },
			{caption: ["상세코드값"], ref: 'dtlChrVl', type:'input',typeinfo :{oneclickedit: true},  width:'18.5%',  style:'text-align:center'},
			{caption: ["표시순서"], ref: 'indctSeq', type:'input',typeinfo:{ mask : {alias :'numeric'}, oneclickedit: true}, width:'18.5%', style:'text-align:center' },
			{caption: ["사용여부"], ref: 'useYn', type:'combo',typeinfo : {ref :'jsonUseYn',label:'cdVlNm', value:'cdVl', oneclickedit: true},width:'18.5', style:'text-align:center'},
        ];
        grdSlsCrtrDtlList = _SBGrid.create(SBGridProperties);
    }

    /**
	 * @name fn_addRow
	 * @description 행추가
	 * @param grd
	 * @param {number} nRow
	 * @param chk
	 */
    const fn_addRow = async function(grd, nRow) {
		if(grd === "grdSlscrtrList"){
			let editableRow = grdSlscrtrList.getRowData(nRow, false);	// call by reference(deep copy)
			if(gfn_isEmpty(editableRow)){
				gfn_comAlert("W0001","매출 기준목록");
				return;
			}else{
				editableRow.status = "3";
				editableRow.gubun = "insert";
				editableRow.delYn = "N";
			}
			//grd.addRows([{status : chk.toString(r) gubun : "insert" }]);
			grdSlscrtrList.addRow();
			nRow++;
			grdSlscrtrList.setCellDisabled(nRow, 0, nRow, grdSlscrtrList.getCols() - 1, true);
			grdSlscrtrList.setCellDisabled(nRow-1, 0, nRow-1, grdSlscrtrList.getCols() - 1, false);
		}else if(grd === "grdSlsCrtrDtlList"){
			let editableRow = grdSlsCrtrDtlList.getRowData(nRow, false);
			let getRow = grdSlscrtrList.getRow();
			let getGrdSlsCrtrList = grdSlscrtrList.getRowData(getRow);
			let getSlsCrtrType = getGrdSlsCrtrList.slsCrtrType;
			let getCrtrCd = getGrdSlsCrtrList.crtrCd;

			if(gfn_isEmpty(editableRow)){
				gfn_comAlert("W0001","매출 기준목록");
				return;
			}else{
				editableRow.status = "3";
				editableRow.gubun = "insert";
				editableRow.delYn = "N";
				editableRow.slsCrtrType = getSlsCrtrType;
				editableRow.crtrCd = getCrtrCd;

			}
			grdSlsCrtrDtlList.addRow();
			nRow++;
			console.log("grdSlsCrtrDtlList nRow : ",nRow ,"col : ",grdSlsCrtrDtlList.getCols());
			grdSlsCrtrDtlList.setCellDisabled(0, 0, nRow-1, grdSlsCrtrDtlList.getCols() - 1, false);
			grdSlsCrtrDtlList.setCellDisabled(0, 0, nRow-1, 1, true);
			grdSlsCrtrDtlList.setCellDisabled(nRow, 0, nRow, grdSlsCrtrDtlList.getCols() - 1, true); //마지막행


		}

    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(grd,nRow) {
		if(grd === "grdSlscrtrList"){
			let rowIndex = grdSlscrtrList.getRow();
			let status = grdSlscrtrList.getRowStatus(rowIndex);
			if(status === 0){
				await fn_delete("grdSlscrtrList", rowIndex);
			}else{
				grdSlscrtrList.deleteRow(nRow);
			}
		}else if(grd === "grdSlsCrtrDtlList"){
			let rowIndex = grdSlsCrtrDtlList.getRow();
			let status = grdSlsCrtrDtlList.getRowStatus(rowIndex);
			if(status === 0){
				await fn_delete("grdSlsCrtrDtlList", rowIndex);
			}else{
				grdSlsCrtrDtlList.deleteRow(nRow);
			}
		}

    }


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		jsonSlsCrtrDtlList.length = 0;
		grdSlsCrtrDtlList.rebuild();

    	let slsCrtrType = SBUxMethod.get("srch-slt-crtrType");

  		try {
			const postJsonPromise = gfn_postJSON("/am/spmt/selectSlsCrtr.do", {
				apcCd: gv_selectedApcCd,
				slsCrtrType : slsCrtrType
			});
			const data = await postJsonPromise;
 			if (_.isEqual("S", data.resultStatus)) {
				if(data.resultList.length > 0){
					jsonSlsCrtrList = data.resultList;
					grdSlscrtrList.rebuild();
					let rowLength = data.resultList.length;
					let nRow = grdSlscrtrList.getRows();
					grdSlscrtrList.addRow(true);
					grdSlscrtrList.setCellDisabled(1, 1, rowLength,grdSlscrtrList.getCols() -5, true);
					grdSlscrtrList.setCellDisabled(nRow, 0, nRow,grdSlscrtrList.getCols() - 1, true);//마지막행
					/*let nRow2 = grdSlsCrtrDtlList.getRows();

                    fn_addRow(grdSlscrtrList,nRow,"1");
                    fn_addRow(grdSlsCrtrDtlList,nRow2,"1");*/
				}else{
					jsonSlsCrtrList.length = 0;
					grdSlscrtrList.rebuild();
					let nRow = grdSlscrtrList.getRows();
					grdSlscrtrList.addRow(true);
					grdSlscrtrList.setCellDisabled(nRow, 0, nRow,grdSlscrtrList.getCols() - 1, true);//마지막행
				}

 			 }
  		}
 		catch (e) {
 	            if (!(e instanceof Error)) {
 	                e = new Error(e);
 	            }
 	            console.error("failed", e.message);
 	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
 	    }
	}

	const fn_clickGrdSlsCrtr = async function(){
		let nRow = grdSlscrtrList.getRow();
		let rowData = grdSlscrtrList.getRowData(nRow);
		if(gfn_isEmpty(rowData)){
			return;
		}
		if(gfn_isEmpty(rowData.slsCrtrType)){
			return;
		}
		let postJsonPromise = gfn_postJSON("/am/spmt/selectSlsCrtrDtl.do",rowData);
		let data = await postJsonPromise;
		if (!_.isEqual("S", data.resultStatus)) {
			gfn_comAlert(data.resultCode, data.resultMessage);
			return;
		}else {
			jsonSlsCrtrDtlList.length = 0;

			let getCrtrType = rowData.crtrCd;
			let getSlsCrtrType = rowData.slsCrtrType;
			if(getCrtrType === "SLS_ITEM"){
				jsonDtlCd = jsonItemCd.map(item =>({cdVl : item.cdVl, cdVlNm : item.cdVlNm}));
			}else if(getCrtrType === "SLS_VRTY"){
				jsonDtlCd = jsonVrtyCd.map(item =>({cdVl : item.cdVl, cdVlNm : item.cdVlNm}));
			}else if(getCrtrType === "SLS_GDS"){
				jsonDtlCd = jsonSpmtPckgUnit.map(item =>({cdVl : item.cdVl, cdVlNm : item.cdVlNm}));
			}else if(getCrtrType === "SLS_SLIP_BSC"){
				jsonDtlCd = jsonSlsSLipBsc.map(item => ({cdVl : item.cdVl, cdVlNm : item.cdVlNm}));
			}else if(getCrtrType === "SLS_CNPT"){
				jsonDtlCd = jsonCnpt.map(item => ({cdVl : item.cnptCd, cdVlNm : item.cnptNm}));
			}else if(getSlsCrtrType === "SLS_SPCL_ITEM" || getSlsCrtrType === "SLS_SPCL_VRTY" || getSlsCrtrType === "SLS_SPCL_GDS"){
				jsonDtlCd = jsonSlsSLipBsc.map(item => ({cdVl : item.cdVl, cdVlNm : item.cdVlNm}));
			}

			grdSlsCrtrDtlList.rebuild();
			if(data.resultList.length > 0){
				jsonSlsCrtrDtlList = data.resultList;
				grdSlsCrtrDtlList.rebuild();
				let nRow = grdSlsCrtrDtlList.getRows();
				console.log("클릭할 때 : ",nRow)
				grdSlsCrtrDtlList.addRow(true);
				grdSlsCrtrDtlList.setCellDisabled(0, 1, nRow-1, 1, true);
				grdSlsCrtrDtlList.setCellDisabled(nRow, 0, nRow, grdSlsCrtrDtlList.getCols() - 1, true);
			}else{
				grdSlsCrtrDtlList.rebuild();
				let nRow = grdSlsCrtrDtlList.getRows();
				grdSlsCrtrDtlList.addRow(true);
				grdSlsCrtrDtlList.setCellDisabled(nRow, 0, nRow, grdSlsCrtrDtlList.getCols() - 1, true);
			}
		}
	}



    const fn_save = async function(){
		let allData = grdSlscrtrList.getGridDataAll();
        try{
			allData = allData.filter(item =>{
				if(gfn_nvl(item.gubun) === ""){
					item.gubun = "update";
				}
				item.apcCd = gv_selectedApcCd;
				return item.delYn === 'N'
			})

			let getInsertData = jsonSlsCrtrList.filter(item =>item.gubun === "insert");
			let getUpdateData = jsonSlsCrtrList.filter(item =>item.gubun === "update");

			getInsertData.forEach(insertItem => {
				let equalData = getUpdateData.find(updateItem => insertItem.slsCrtrType === updateItem.slsCrtrType && insertItem.crtrCd === updateItem.crtrCd);
				if(equalData !== undefined && Object.keys(equalData).length > 0){
					gfn_comAlert("W0009","기준유형,기준코드");
					return;
				}
			});

			let slsCrtrDtlList = grdSlsCrtrDtlList.getGridDataAll();
			slsCrtrDtlList = slsCrtrDtlList.filter(item => {
				if(gfn_nvl(item.gubun) === ""){
					item.gubun = "update";
				}
				item.apcCd = gv_selectedApcCd;
				//item.slsCrtrType = item.crtrCd;
				return item.delYn === 'N'
			})

			console.log(slsCrtrDtlList);


            let postJsonPromise = gfn_postJSON("/am/spmt/insertSlsCrtr.do",[allData,slsCrtrDtlList]);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    //fn_reset();
					await fn_search();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }



	 const fn_delete = async function(grd,index){
			if(grd === "grdSlscrtrList"){
				if (!gfn_comConfirm("Q0001", "매출기준목록 삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				let rowData = grdSlscrtrList.getRowData(index);
				if(rowData === undefined){
					return;
				}
				try{
					let postJsonPromise = gfn_postJSON("/am/spmt/deleteSlsCrtr.do",rowData);

					if(postJsonPromise){
						let data = await postJsonPromise;
						if (data.resultStatus == "S") {
							await fn_search();
							return;
						}
					}

				}catch (e){
					console.log(e);
				}
			}else if(grd === "grdSlsCrtrDtlList"){
				if (!gfn_comConfirm("Q0001", "매출기준상세 삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				let rowData = grdSlsCrtrDtlList.getRowData(index);
				if(rowData === undefined){
					return;
				}
				try{
					let postJsonPromise = gfn_postJSON("/am/spmt/deleteSlsCrtrDtl.do",rowData);

					if(postJsonPromise){
						let data = await postJsonPromise;
						if (data.resultStatus == "S") {
							await fn_search();
							return;
						}
					}

				}catch (e){
					console.log(e);
				}
			}

	    }


	const fn_setCrtrCd = async function (){
		jsonItemCd.forEach(item => {
			item.cdId = "SLS_SPCL_ITEM";
			item.cdVlNm = item.itemNm;
			item.cdVl = item.itemCd;
			item.crtrCd = "SLS_SPCL_ITEM";
		});
		jsonVrtyCd.forEach(item =>{
			item.cdId = "SLS_SPCL_VRTY";
			item.cdVlNm = item.vrtyNm;
			//item.cdVl = item.vrtyCd;
			item.cdVl = item.itemVrtyCd;
			item.crtrCd = "SLS_SPCL_VRTY";
		});
		jsonSpmtPckgUnit.forEach(item =>{
			item.cdId = "SLS_SPCL_GDS";
			item.cdVlNm = item.spmtPckgUnitNm;
			item.cdVl = item.spmtPckgUnitCd;
			item.crtrCd = "SLS_SPCL_GDS";
		});
		/*jsonCnpt.forEach(item =>{
			item.cdId = ""
		});
*/
	}

	const fn_selectSpmtPckgUnit = async function(){
		let apcCd = gv_apcCd;

		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtPckgUnitList.do", {apcCd : apcCd});
		let data = await postJsonPromise;
		try{
			if (_.isEqual("S", data.resultStatus)) {
				jsonSpmtPckgUnit.length = 0;
				data.resultList.forEach((item, index) => {
					let spmtPckgUnitVO = {
						itemCd 			: item.itemCd
						, vrtyCd 			: item.vrtyCd
						, spcfctCd		: item.spcfctCd
						, spmtPckgUnitNm	: item.spmtPckgUnitNm
						, ntslUntprc		: item.ntslUntprc
						, brndNm			: item.brndNm
						, delYn			: item.delYn
						, apcCd			: item.apcCd
						, spmtPckgUnitCd	: item.spmtPckgUnitCd
						, itemNm			: item.itemNm
						, vrtyNm			: item.vrtyNm
						, spcfctNm		: item.spcfctNm
						, gdsGrd			: item.gdsGrd
						, gdsGrdNm		: item.gdsGrdNm
						, extrnlLnkgCd	: item.extrnlLnkgCd
						, plorCd			: item.plorCd
						, addRow			: "N"
						, stdPckgCd      	: item.stdPckgCd
						, stdGrdCd      	: item.stdGrdCd
						, stdUnitCd      	: item.stdUnitCd
						, stdEcfrdCd      : item.stdEcfrdCd
						, sn				: item.sn
					}
					jsonSpmtPckgUnit.push(spmtPckgUnitVO);
				});


			} else {
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	const fn_selectCnptList = async function(){
		let apcCd = gv_selectedApcCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {apcCd : apcCd});
		let data = await postJsonPromise;
		jsonCnpt.length = 0;
		try{
			if (_.isEqual("S", data.resultStatus)) {
				data.resultList.forEach((item, index) => {
					let cnpt = {
						cnptCd			: item.cnptCd
						, cnptNm			: item.cnptNm
						, cnptType		: item.cnptType
						, brno			: item.brno
						, picNm			: item.picNm
						, telno			: item.telno
						, rmrk			: item.rmrk
						, delYn			: item.delYn
						, apcCd			: item.apcCd
						, eml				: item.eml
						, bzstat			: item.bzstat
						, cls				: item.cls
						, whlslMrktCorpCd	: item.whlslMrktCorpCd
						, picTelno 		: item.picTelno
						, addr 			: item.addr
						, fxno 			: item.fxno
						, dlngShapCd 		: item.dlngShapCd
						, dlngMthdCd 		: item.dlngMthdCd
						, extrnlLnkgCd 	: item.extrnlLnkgCd
						, sn				: item.sn
						, useYn 			: item.useYn
					}
					jsonCnpt.push(cnpt);
				});
			} else {
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>