
<%
/**
 * @Class Name : asstMtrInvntr.jsp
 * @Description : 부자재현황조회
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
<title>title : 부자재현황조회</title>
<%@ include file="../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../frame/inc/headerScript.jsp"%>
<%@ include file="../../../frame/inc/clipreport.jsp"%>

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
				</div>
				<div style="margin-left: auto;">




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
								<th scope="row" class="th_bg">기준일자</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-datepicker
										uitype="range"
										id="srch-dtp-crtrYmd"
										name="srch-dtp-crtrYmd"
										date-format="yyyy-mm-dd"
										class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
								</td>
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

						</tbody>
					</table>

					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span style="padding-left: 5px;">부자재 목록</span></li>
						</ul>
					</div>
					<div id="sb-area-grdAsstCrtrList" style="height:200px;"></div>

					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span style="padding-left: 5px;">부자재 입고 목록</span></li>
						</ul>
					</div>
					<div id="sb-area-grdAsstWrhsList" style="height:200px;"></div>

					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span style="padding-left: 5px;">부자재 출고 목록</span></li>
						</ul>
					</div>
					<div id="sb-area-grdAsstSpmtList" style="height:200px;"></div>


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

    /** 부자재입고목록 grid ref Json **/
    var jsonAsstWrhsList =[];
    var jsonAsstWrhsListTemp =[];
    var grdAsstWrhsList;

    /** 부자재출고목록 grid ref Json **/
    var jsonAsstSpmtList =[];
    var jsonAsstSpmtListTemp =[];
    var grdAsstSpmtList;

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
    	fn_createAsstWrhsList();
    	fn_createAsstSpmtList();
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

                {caption: ['자재코드'], ref: 'mtrlCd', width: '150px', type: 'output', style:'text-align:center'},
                {caption: ['자재유형'], ref: 'mtrlType', width: '100px', type: 'combo', typeinfo : {ref:'jsonMtrlType', label:'cdVlNm', value:'cdVl', oneclickedit: true}, style:'text-align:center', disabled : {uihidden : true}},
                {caption: ['자재명'], ref: 'mtrlNm', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['그룹ID'], ref: 'mtrlGroupId', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['단위'], ref: 'unitCd', width: '100px', type: 'combo', typeinfo : {ref:'jsonStdUnitCd', label:'cdVlNm', value:'cdVl', oneclickedit: true}, style:'text-align:center'},
                {caption: ['단중'], ref: 'unitWght', width: '100px', type: 'output', dataType : 'number' ,format : {type:'number', rule:'#,###'}, style:'text-align:center'},
                {caption: ['품목'], ref: 'itemNm', width: '100px', type : 'output' , style:'text-align:center'},
                {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['규격'], ref: 'spcfctCd', width: '100px', type : 'combo', typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd', filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false} }, style:'text-align:center', disabled : {uihidden : true}},
                {caption: ['포장단위'], ref: 'spmtPckgUnitCd', width: '100px', type : 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'spcfctNm', value:'spmtPckgUnitCd', filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}}, style:'text-align:center', disabled : {uihidden : true}},
                {caption: ['상품'], ref: 'gdsCd', width: '100px', type : 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'spmtPckgUnitNm', value:'spmtPckgUnitCd',  filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}}, style:'text-align:center', disabled : {uihidden : true}},
                {caption: ['재고수량'], ref: 'invntrQntt', width: '50px', type: 'output', style:'text-align:center'},
                {caption: [''], ref: 'rmrk', width: '50px', type: 'input', style:'text-align:center'},
                {caption: ['품목코드'], ref: 'itemCd', width: '50px', type: 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'itemNm', value:'itemCd'},style:'text-align:center', hidden:true},
                {caption: ['품종코드'], ref: 'vrtyCd', width: '50px', type: 'output', style:'text-align:center', hidden:true}
        ]
        grdAsstCrtrList = _SBGrid.create(SBGridProperties);
        grdAsstCrtrList.bind('onclick','fn_grdAsstCrtrListClick');
    }
    /** 부자재목록 grid create **/
    const fn_createAsstWrhsList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAsstWrhsList';
        SBGridProperties.id = 'grdAsstWrhsList';
        SBGridProperties.jsonref = 'jsonAsstWrhsList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
                {caption: ['부자재코드'], ref: 'asstMtrCd', width: '150px', type: 'output', style:'text-align:center'},
                {caption: ['부자재번호'], ref: 'asstMtrNo', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['입고일자'], ref: 'wrhsYmd', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['입고수량'], ref: 'wrhsQntt', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['입고무게'], ref: 'wrhsWght', width: '100px', type: 'output', style:'text-align:center'}
        ]
        grdAsstWrhsList = _SBGrid.create(SBGridProperties);
    }

    /** 출고목록 grid create **/
    const fn_createAsstSpmtList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAsstSpmtList';
        SBGridProperties.id = 'grdAsstSpmtList';
        SBGridProperties.jsonref = 'jsonAsstSpmtList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
                {caption: ['부자재코드'], ref: 'asstMtrCd', width: '150px', type: 'output', style:'text-align:center'},
                {caption: ['부자재번호'], ref: 'asstMtrNo', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['출고일자'], ref: 'spmtYmd', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['출고수량'], ref: 'spmtQntt', width: '100px', type: 'output', style:'text-align:center'},
                {caption: ['출고무게'], ref: 'spmtWght', width: '100px', type: 'output', style:'text-align:center'}
        ]
        grdAsstSpmtList = _SBGrid.create(SBGridProperties);
        //grdAsstSpmtList.bind('onclick','fn_grdAsstWrhsListClick');
    }

	const fn_grdAsstCrtrListClick = function(){
		let row = grdAsstCrtrList.getRow();
		let rowData = grdAsstCrtrList.getRowData(row);
		if(gfn_nvl(rowData)=== ""){
			return;
		}

		jsonAsstWrhsList.length = 0;
		jsonAsstWrhsList = jsonAsstWrhsListTemp.filter(item => item.asstMtrCd === rowData.mtrlCd);

		jsonAsstSpmtList.length = 0;
		jsonAsstSpmtList = jsonAsstSpmtListTemp.filter(item => item.asstMtrCd === rowData.mtrlCd);
		grdAsstWrhsList.refresh();
		grdAsstSpmtList.refresh();
	}


	const fn_search = async function(){
		await fn_asstSearch();
		await fn_spmtSearch();
		await fn_wrhsSearch();
	}

	//재고조회
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
            let postJsonPromise = gfn_postJSON("/am/asst/selectBomInvntrInfoList.do",obj);
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

                grdAsstCrtrList.rebuild();

            }else{
            	jsonAsstCrtrList.length = 0;



            }



        }catch (e){
            console.log(e);
        }
    }

    const fn_spmtSearch = async function(){
    	//SBUxMethod.refreshGroup("group1");
    	jsonAsstSpmtList.length = 0;


    	let mtrlType = SBUxMethod.get("srch-slt-mtrlType");
    	let mtrlCd = SBUxMethod.get("srch-inp-mtrlCd");
    	let mtrlNm = SBUxMethod.get("srch-inp-mtrlNm");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    	let spmtYmdFrom = SBUxMethod.get("srch-dtp-crtrYmd_from");
    	let spmtYmdTo = SBUxMethod.get("srch-dtp-crtrYmd_to");
    	let obj = {
    			apcCd:gv_apcCd
    			, mtrlType : mtrlType
    			, mtrlCd : mtrlCd
    			, mtrlNm : mtrlNm
    			, itemCd : itemCd
    			, vrtyCd : vrtyCd
    			, spmtYmdFrom : spmtYmdFrom
    			, spmtYmdTo : spmtYmdTo
   			}

        try{
            let postJsonPromise = gfn_postJSON("/am/asst/selectBomSpmtInfoList.do",obj);
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
            	jsonAsstSpmtList.length = 0;
            	jsonAsstSpmtListTemp.length = 0;

            	data.resultList.forEach((item, index) => {
            		jsonAsstSpmtListTemp.push(item);
            	});
            	grdAsstSpmtList.rebuild();

            }else{
            	jsonAsstSpmtList.length = 0;
            	jsonAsstSpmtListTemp.length = 0;
            }
        }catch (e){
            console.log(e);
        }
    }

    const fn_wrhsSearch = async function(){
    	//SBUxMethod.refreshGroup("group1");
    	jsonAsstWrhsList.length = 0;


    	let mtrlType = SBUxMethod.get("srch-slt-mtrlType");
    	let mtrlCd = SBUxMethod.get("srch-inp-mtrlCd");
    	let mtrlNm = SBUxMethod.get("srch-inp-mtrlNm");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    	let wrhsYmdFrom = SBUxMethod.get("srch-dtp-crtrYmd_from");
    	let wrhsYmdTo = SBUxMethod.get("srch-dtp-crtrYmd_to");
    	let obj = {
    			apcCd:gv_apcCd
    			, mtrlType : mtrlType
    			, mtrlCd : mtrlCd
    			, mtrlNm : mtrlNm
    			, itemCd : itemCd
    			, vrtyCd : vrtyCd
    			, wrhsYmdFrom : wrhsYmdFrom
    			, wrhsYmdTo : wrhsYmdTo
   			}

        try{
            let postJsonPromise = gfn_postJSON("/am/asst/selectBomWrhsInfoList.do",obj);
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
            	jsonAsstWrhsList.length = 0;
            	jsonAsstWrhsListTemp.length = 0;

            	data.resultList.forEach((item, index) => {
            		jsonAsstWrhsListTemp.push(item);
            	});
            	grdAsstWrhsList.rebuild();

            }else{
            	jsonAsstWrhsList.length = 0;
            	jsonAsstWrhsListTemp.length = 0;
            }
        }catch (e){
            console.log(e);
        }
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




    window.addEventListener("DOMContentLoaded",function(){
    	fn_init();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp"%>
</html>
