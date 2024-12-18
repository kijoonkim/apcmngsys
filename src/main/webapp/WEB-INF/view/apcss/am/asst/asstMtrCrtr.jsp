
<%
/**
 * @Class Name : asstMtrCrtr.jsp
 * @Description : 부자재 기준 관리
 * @author SI개발부
 * @since 2024.09.03
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2024.10.04   	박승진		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>title : 부자재 기준 관리</title>
<%@ include file="../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../frame/inc/headerScript.jsp"%>
<%@ include file="../../../frame/inc/clipreport.jsp"%>
<style>
		#bomTab, #asstTab{
			padding:0px
		}
	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header"
				style="display: flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title">
						▶
						<c:out value='${menuNm}'></c:out>
					</h3>
					<!-- 부자재 기준 관리 -->
				</div>
				<div style="margin-left: auto;">


					<sbux-button id="btnSave" name="btnSave" uitype="normal"
						class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>

					<sbux-button id="btnSearch" name="btnSearch" uitype="normal"
						class="btn btn-sm btn-outline-danger" text="조회"
						onclick="fn_search"></sbux-button>

				</div>
			</div>
			<div class="box-body">
				<%@ include file="../../../frame/inc/apcSelect.jsp"%>
				<div>
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
								<th scope="row" class="th_bg">자재유형</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-select
										id="srch-slt-mtrlType"
										name="srch-slt-mtrlType"
										uitype="single"
										class="form-control input-sm"
										unselected-text="전체"
										jsondata-ref="jsonMtrlType"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
										style="max-width:80%;">
									</sbux-select>
								</td>
								<th scope="row" class="th_bg">자재코드</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										uitype="text"
										id="srch-inp-mtrlCd"
										name="srch-inp-mtrlCd"
										class="form-control input-sm"
										style="max-width:80%;"
								></sbux-input>
								</td>
								<th scope="row" class="th_bg">자재명</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										uitype="text"
										id="srch-inp-mtrlNm"
										name="srch-inp-mtrlNm"
										class="form-control input-sm"
										style="max-width:80%;"
								></sbux-input>
								</td>

							</tr>
							<tr>
								<th scope="row" class="th_bg">품목/품종</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-select
										id="srch-slt-itemCd"
										name="srch-slt-itemCd"
										uitype="single"
										class="form-control input-sm"
										unselected-text="전체"
										jsondata-ref="jsonApcItem"
										onchange="fn_selectItem"
									></sbux-select>
								</td>
								<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
								<sbux-input
									uitype="hidden"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchVrty"
									name="btnSrchVrty"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vrty"
									onclick="fn_modalVrty"
								/>
							</td>
							</tr>
						</tbody>
					</table>

					<div class="ad_tbl_top" style="margin-top:30px">
					<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData" onclick="fn_tabClick(idxTab_norm)">
					</sbux-tabs>

					<div class="tab-content" >
						<div id="asstTab">
							<div>
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span style="padding-left: 5px;">부자재 기준 목록</span></li>
									</ul>
								</div>
								<div id="sb-area-grdAsstCrtrList" style="height:450px;"></div>
							</div>
						</div>
						<div id=bomTab>
							<div style="display: flex; gap: 1vw">
								<div style="flex: 6; display: flex; flex-direction: column;">
									<div class="ad_tbl_top">
										<ul class="ad_tbl_count">
											<li><span style="padding-left: 5px;">BOM목록</span></li>
										</ul>
									</div>
									<div id="sb-area-grdBomList" style="flex: 1; height:450px;"></div>
								</div>
								<div style="flex: 5; display: flex; flex-direction: column;">
									<div class="ad_tbl_top">
										<ul class="ad_tbl_count">
											<li><span style="padding-left: 5px;">BOM구성품</span></li>
										</ul>
									</div>
									<div id="sb-area-grdBomCmpstn" style="flex: 1;height:450px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>






				</div>
			</div>
		</div>
		<div id="div-rpt-clipReportPrint" style="display: none;"></div>
	</section>
	<!--  품목 선택 Modal -->
   	<div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script>
	var nowTab = "asstTab";
	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "부자재관리", "targetid" : "asstTab", "targetvalue" : "등록" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "BOM관리", "targetid" : "bomTab", "targetvalue" : "등록내역" },
	];



    /** 부자재목록 grid ref Json **/
    var jsonAsstCrtrList =[];
    var grdAsstCrtrList;



	/** BOM목록 grid ref Json **/
    var jsonBomList =[];
    var grdBomList;

    /** BOM구성품 grid ref Json **/
    var jsonBomCmpstn = [];
    var jsonBomCmpstnTemp = [];
    var grdBomCmpstn = [];


    /** 자재유형 select **/
    var jsonMtrlType = [];

    /** 설비유형 select **/
    var jsonFcltType =[];

    /** 포장구분 select **/
    var jsonPckgSe =[];

    /** 단위 select **/
    var jsonUnit =[];

    /** 대표품목 **/
    var jsonApcItem = [];

    /** 대표품종 **/
    var jsonApcVrty = [];
    var jsonApcSpcfctGrd = [];

    //** 규격 **//
    var jsonApcSpcfct = [];

    //** 상품(출하포장단위)**//
    var jsonSpmtPckgUnit = [];
    var jsonSpmtPckgUnitGrd = [];

    //** 단위 **//
    var jsonStdUnitCd = [];

    //** 구성구분코드(BOM)**//
    var jsonCmpstnSeCd = [];

    var comboData = [{label:'Y', value:'Y'},{label:'N', value:'N'}]


    const fn_init = async function(){
    	await fn_initSBselect();
    	fn_createAsstCrtrList();
    	fn_createBomList();
    	fn_createBomCmpstn();
        fn_search();
    }
    const fn_initSBselect = async function(){

        let result = await Promise.all([
            //gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-fcltType',	jsonFcltType, 	'FCLT_GUBUN', '0000'),	// 설비유형
			gfn_setComCdSBSelect('dtl-slt-unit',	jsonUnit, 	'STD_PCKG_CD', '0000'), 			// 단위
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
			fn_selectSpmtPckgUnit()
        ]);

        jsonMtrlType = await gfn_getComCdDtls('MTRL_TYPE'); //자재유형
        jsonStdUnitCd = await gfn_getComCdDtls('STD_UNIT_CD'); //단위
        jsonCmpstnSeCd = await gfn_getComCdDtls('CMPSTN_SE_CD'); //구성구분코드 (BOM)
        jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd,'');

        SBUxMethod.refresh("srch-slt-mtrlType");
    }

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

    const fn_grdModalVrty = function(){
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, "", fn_setGrdVrty, "");
    	SBUxMethod.openModal('modal-vrty')
    }

	const fn_setGrdVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			let row = grdAsstCrtrList.getRow();
			let rowData = grdAsstCrtrList.getRowData(row);

			rowData['itemCd'] = vrty.itemCd;
			rowData['vrtyCd'] = vrty.vrtyCd;
			rowData['itemNm'] = vrty.itemNm;
			rowData['vrtyNm'] = vrty.vrtyNm;
			rowData['itemVrtyCd'] = vrty.itemCd + vrty.vrtyCd;
			grdAsstCrtrList.setRowData(row,rowData,true);
			let filter =  jsonApcSpcfct.filter(item => item.itemCd === vrty.itemCd);
			let filter2 = jsonSpmtPckgUnit.filter(item => item.itemCd === vrty.itemCd);
			jsonApcSpcfctGrd = filter;
			jsonSpmtPckgUnitGrd = filter2;

			grdAsstCrtrList.rebuild();
			//gfn_setApcSpcfctsSBSelect('grdAsstCrtrList', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}

	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyNms = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyNms.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}

	/** 부자재목록 grid create **/
    const fn_createAsstCrtrList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAsstCrtrList';
        SBGridProperties.id = 'grdAsstCrtrList';
        SBGridProperties.jsonref = 'jsonAsstCrtrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
        	{caption: [""], 		ref: 'chk', 		type:'button', width:'50px', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdAsstCrtrList," + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdAsstCrtrList," + nRow + ")'>삭제</button>";
                    }
                }},
                {caption: ['자재코드'], ref: 'mtrlCd', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['자재유형'], ref: 'mtrlType', width: '100px', type: 'combo', typeinfo : {ref:'jsonMtrlType', label:'cdVlNm', value:'cdVl', oneclickedit: true}, style:'text-align:center'},
                {caption: ['자재명'], ref: 'mtrlNm', width: '100px', type: 'input', style:'text-align:center'},
                {caption: ['그룹ID'], ref: 'mtrlGroupId', width: '100px', type: 'input', style:'text-align:center'},
                {caption: ['단위'], ref: 'unitCd', width: '100px', type: 'combo', typeinfo : {ref:'jsonStdUnitCd', label:'cdVlNm', value:'cdVl', oneclickedit: true}, style:'text-align:center'},
                {caption: ['단중'], ref: 'unitWght', width: '100px', type: 'input', dataType : 'number' ,format : {type:'number', rule:'#,###'}, style:'text-align:center'},
                {caption: ['품목'], ref: 'itemNm', width: '100px', type : 'outputbutton' , 	typeinfo : {callback : fn_grdModalVrty}, style:'text-align:center'},
                {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['규격'], ref: 'spcfctCd', width: '100px', type : 'combo', typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd', filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false} }, style:'text-align:center'},
                {caption: ['포장단위'], ref: 'spmtPckgUnitCd', width: '100px', type : 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'spcfctNm', value:'spmtPckgUnitCd', filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}}, style:'text-align:center', disabled : {uihidden : true}},
                {caption: ['상품'], ref: 'gdsCd', width: '100px', type : 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'spmtPckgUnitNm', value:'spmtPckgUnitCd',  filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}}, style:'text-align:center'},
                {caption: [''], ref: 'rmrk', width: '50px', type: 'input', style:'text-align:center'},
                {caption: ['품목코드'], ref: 'itemCd', width: '50px', type: 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'itemNm', value:'itemCd'},style:'text-align:center', hidden:true},
                {caption: ['품종코드'], ref: 'vrtyCd', width: '50px', type: 'output', style:'text-align:center', hidden:true}


        ]
        grdAsstCrtrList = _SBGrid.create(SBGridProperties);
        //grdAsstCrtrList.bind('valuechanged','fn_grdAsstCrtrListClick');
    }


    /** BOM목록 grid create **/
    const fn_createBomList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdBomList';
        SBGridProperties.id = 'grdBomList';
        SBGridProperties.jsonref = 'jsonBomList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption: [""], 		ref: 'itemCd', 		type:'button', width:'50px', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdBomList," + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdBomList," + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ['자재유형'], ref: 'mtrlType', width: '100px', type: 'combo', typeinfo : {ref:'jsonMtrlType', label:'cdVlNm', value:'cdVl', oneclickedit: true}, style:'text-align:center'},
            {caption: ['자재코드'], ref: 'mtrlCd', width: '200px', type: 'output', style:'text-align:center'},
            {caption: ['자재명'], ref: 'mtrlNm', width: '200px', type: 'output', style:'text-align:center'},
            {caption: ['구분'], ref: 'cmpstnSeCd', width: '50px', type: 'combo', typeinfo : {ref:'jsonCmpstnSeCd', label:'cdVlNm', value:'cdVl', oneclickedit: true} , style:'text-align:center'},
            {caption: ['순번'], ref: 'cmpstnSn', width: '50px', type: 'input', style:'text-align:center',format : {type:'number', rule:'#,###'}},
            {caption: ['구성명'], ref: 'cmpstnNm', width: '200px', type: 'input', style:'text-align:center'},
            {caption: ['사용여부'], ref: 'useYn', width: '50px', type: 'input', style:'text-align:center'}
        ]

        grdBomList = _SBGrid.create(SBGridProperties);
        grdBomList.bind('click','fn_grdBomListClick');
    }

    /** BOM구성품 grid create **/
    const fn_createBomCmpstn= function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdBomCmpstn';
        SBGridProperties.id = 'grdBomCmpstn';
        SBGridProperties.jsonref = 'jsonBomCmpstn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption: [""], 		ref: 'itemCd', 		type:'button', width:'50px', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdBomCmpstn," + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdBomCmpstn," + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ['BOM자재코드'], ref: 'elmtMtrlCd', width: '150px', type: 'output', style:'text-align:center'},
            {caption: ['자재명'], ref: 'mtrlNm', width: '150px', type: 'input', style:'text-align:center'},
            {caption: ['수량'], ref: 'bscQntt', width: '50px', type: 'input', style:'text-align:center', format : {type:'number', rule:'#,###'}},
            {caption: ['중량'], ref: 'bscWght', width: '50px', type: 'input', style:'text-align:center', format : {type:'number', rule:'#,###'}},
            {caption: ['단위'], ref: 'bscUnitCd', width: '100px', type: 'combo', typeinfo : {ref:'jsonStdUnitCd', label:'cdVlNm', value:'cdVl', oneclickedit: true}, style:'text-align:center'},
            {caption: ['순번'], ref: 'cmpstnSn', width: '50px', type: 'input', style:'text-align:center',format : {type:'number', rule:'#,###'}},
            {caption: [''], ref: 'rmrk', width: '50px', type: 'input', style:'text-align:center'}
        ]
        grdBomCmpstn = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(grd, nRow, nCol) {

        const editableRow = grd.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow['delYn'] = "N";
        editableRow['gubun'] = "insert";

        //grd.rebuild();
        grd.addRow(true);
        grd.addStatus(nRow,"insert");

        nRow++;
        grd.setCellDisabled(nRow, 0, nRow, grd.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(grd,nRow) {
        let rowIndex = grd.getRow();
        let status = grd.getRowStatus(rowIndex);
        if(status === 0){
        	fn_deleteDtl(grd,rowIndex);
        }else{
        	grd.deleteRow(nRow);
        }
    }

	const fn_search = async function(){
		let tabId = SBUxMethod.get('idxTab_norm');
		if(tabId === "asstTab"){
			fn_asstSearch();
		}else if(tabId === "bomTab"){
			fn_bomSearch();
		}

	}

    const fn_asstSearch = async function(){
    	//SBUxMethod.refreshGroup("group1");
    	jsonAsstCrtrList.length = 0;


    	let mtrlType = SBUxMethod.get("srch-slt-mtrlType");
    	let mtrlCd = SBUxMethod.get("srch-inp-mtrlCd");
    	let mtrlNm = SBUxMethod.get("srch-inp-mtrlNm");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    	let obj = {
    			apcCd:gv_apcCd
    			, mtrlType : mtrlType
    			, mtrlCd : mtrlCd
    			, mtrlNm : mtrlNm
    			, itemCd : itemCd
    			, vrtyCd : vrtyCd
   			}

        try{
            let postJsonPromise = gfn_postJSON("/am/asst/selectAsstMtrCrtrInfoList.do",obj);
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
            	jsonAsstCrtrList.length = 0;

            	data.resultList.forEach((item, index) => {
  	          		jsonAsstCrtrList.push(item);
            	});
            	let nRow = grdAsstCrtrList.getRows();
            	grdAsstCrtrList.addRow(true);
                grdAsstCrtrList.setCellDisabled(nRow, 0, nRow, grdAsstCrtrList.getCols() - 1, true);

                grdAsstCrtrList.rebuild();

            }else{
            	jsonAsstCrtrList.length = 0;
            	grdAsstCrtrList.addRow(true);


                const inputs = document.querySelectorAll('input[id^="dtl"]');
                inputs.forEach((item) => {
                    SBUxMethod.set(item.id, null);
                });
            }



        }catch (e){
            console.log(e);
        }
    }

    const fn_bomSearch = async function(){
    	//grdBomList;
    	//grdBomCmpstn;
    	jsonBomList.length = 0;
    	jsonBomCmpstn.length = 0;


        try{
            let postJsonPromise = gfn_postJSON("/am/asst/selectBomInfoList.do",{apcCd:gv_apcCd});
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList1.length > 0){
            	jsonBomList.length = 0;

            	data.resultList1.forEach((item, index) => {
            		jsonBomList.push(item);
            	});
            	let nRow = grdAsstCrtrList.getRows();
            	grdBomList.addRow(true);
            	grdBomList.setCellDisabled(nRow, 0, nRow, grdBomList.getCols() - 1, true);

            	grdBomList.rebuild();

            }else{
            	jsonBomList.length = 0;
            	grdBomList.addRow(true);

            }

            if(data.resultList2.length > 0){
            	jsonBomCmpstnTemp.length = 0;

            	data.resultList2.forEach((item, index) => {
            		jsonBomCmpstnTemp.push(item);
            	});
            	let nRow = grdAsstCrtrList.getRows();
            	//grdBomCmpstn.addRow(true);
            	grdBomCmpstn.setCellDisabled(nRow, 0, nRow, grdBomCmpstn.getCols() - 1, true);

            	grdBomCmpstn.rebuild();

            }else{
            	jsonBomCmpstnTemp.length = 0;
            	//grdBomCmpstn.addRow(true);

            }

        }catch (e){
            console.log(e);
        }
    }

	const fn_save = async function(){
		let tabId = SBUxMethod.get('idxTab_norm');
		if(tabId === "asstTab"){
			fn_asstSave();
		}else if(tabId === "bomTab"){
			fn_bomSave();
		}
	}

    const fn_asstSave = async function(){

    	let allData = grdAsstCrtrList.getGridDataAll();


        try{

        	allData.forEach(item => {
        		if(gfn_nvl(item.gubun) === ""){
        			item.gubun = "update";
    			}
        		item['apcCd'] = gv_apcCd;
        		item['useYn'] = "Y";
        	})
			let filterData = allData.filter(item => item.delYn === "N")
            let postJsonPromise = gfn_postJSON("/am/asst/insertAsstMtrCrtrInfoList.do",filterData);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    //fn_reset();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }

	const fn_bomSave = async function(){
		let row = grdBomList.getRow()
    	let bomData = grdBomList.getRowData(row);
    	let bomDtlData = grdBomCmpstn.getGridDataAll();


        try{


       		if(gfn_nvl(bomData.gubun) === ""){
       			bomData.gubun = "update";
   			}
       		bomData['apcCd'] = gv_apcCd;
       		bomData['useYn'] = "Y";


			bomDtlData.forEach(item => {
        		if(gfn_nvl(item.gubun) === ""){
        			item.gubun = "update";
    			}
        		item['apcCd'] = gv_apcCd;
        		item['useYn'] = "Y";
        		item['mtrlCd'] = bomData.mtrlCd;
       			item['mtrlType'] = "S";
       			item['unitCd'] = item['bscUnitCd'];
       			item['unitWght'] = item['bscWght'];

        	})
			let filterData = bomDtlData.filter(item => item.delYn === "N")

            let postJsonPromise = gfn_postJSON("/am/asst/insertBomInfoList.do",[bomData,filterData]);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    //fn_reset();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }


    const fn_delete = async function(){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let idx = grdAsstCrtrList.getRow();
        let sortFcltVO = grdAsstCrtrList.getRowData(idx);
        let postJsonPromise = gfn_postJSON("/am/sort/deleteSortOprtngCrtr.do",sortFcltVO);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                    gfn_comAlert("I0001");
                    fn_search();
                }
            };
        }catch (e){
            console.error(e);
        }
    }

    const fn_deleteDtl = async function(grd ,rowIndex){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let rowData = grd.getRowData(rowIndex);
        let url = "";

        let grdId = grd.getID();
        if(grdId === "grdAsstCrtrList"){
        	url = "/am/asst/deleteAsstMtrCrtrInfo.do";
        }else if(grdId === "grdBomList"){
        	url = "/am/asst/deleteBomCrtrInfo.do";
        }else if(grdId === "grdBomCmpstn"){
        	url = "/am/asst/deleteBomDtlList.do";
        }

        let postJsonPromise = gfn_postJSON(url,rowData);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                	fn_search();
                    gfn_comAlert("I0001");
                }
            };
        }catch (e){
            console.error(e);
        }
    }




    /**
     * @name fn_dtpChange
     * @description 입고일자 from to validation
     * @function
     */
    const fn_dtpChange = function(_targetId){
        let wrhsYmdFrom = SBUxMethod.get("dtl-dtp-bgngYmd");
        let wrhsYmdTo = SBUxMethod.get("dtl-dtp-endYmd");
        let newValue = 0;
        if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
            gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
            if(_targetId.id == 'dtl-dtp-bgngYmd'){
                 newValue = wrhsYmdTo - 1;
            }else{
                 newValue = parseInt(wrhsYmdFrom) + 1;
            }
            SBUxMethod.set(_targetId.id, String(newValue));
            return;
        }
    }

    /**
     * @name fn_selectWghInfo
     * @description 상단 그리드 click event => 상세 목록 조회
     * @function
     */
    /* const fn_grdAsstCrtrListClick = async function(){
    	var nRow = grdAsstCrtrList.getRow();
    	var nCol = grdAsstCrtrList.getCol(); //현재 선택된 컬럼
    	var col = grdAsstCrtrList.getColRef('gdsCd'); //상품 컬럼 인덱스

    	if(nCol !== col){
    		return;
    	}
    	let rowData = grdAsstCrtrList.getRowData(nRow);
    	let spmtPckgUnit = jsonSpmtPckgUnitGrd.find(item => item.spmtPckgUnitCd === rowData.gdsCd);
    	rowData['spmtPckgUnitCd'] = spmtPckgUnit.spmtPckgUnitCd;
    	grdAsstCrtrList.setRowData(nRow,rowData,true);
    	grdAsstCrtrList.rebuild();

    } */

    /**
     * @name fn_selectWghInfo
     * @description 상단 그리드 click event => 상세 목록 조회
     * @function
     */
    const fn_grdBomListClick = async function(){
    	let nRow = grdBomList.getRow();
    	let nCol = grdBomList.getCol(); //현재 선택된 컬럼

    	let rowData = grdBomList.getRowData(nRow);


    	let bomCmpstnFilter = jsonBomCmpstnTemp.filter(item => item.mtrlCd === rowData.mtrlCd);
    	jsonBomCmpstn = bomCmpstnFilter;
    	grdBomCmpstn.refresh();
    	grdBomCmpstn.addRow(true);

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
 					  , stdPckgCd      : item.stdPckgCd
 					  , stdGrdCd      : item.stdGrdCd
 					  , stdUnitCd      : item.stdUnitCd
 					  , stdEcfrdCd      : item.stdEcfrdCd
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

    const fn_tabClick = function(tab){
 		//let tab = SBUxMethod.get("idxTab_norm");
 		if(tab === nowTab){
 			return;
 		}else{
 			if(tab === "asstTab"){
 				nowTab = "asstTab";
 	 			fn_asstSearch();
 	 		}else if(tab === "bomTab"){
 	 			nowTab = "bomTab";
 	 			fn_bomSearch();
 	 		}
 		}

 	}


    window.addEventListener("DOMContentLoaded",function(){
    	fn_init();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp"%>
</html>
