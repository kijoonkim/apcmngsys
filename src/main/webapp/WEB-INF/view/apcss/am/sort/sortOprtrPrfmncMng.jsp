<%
    /**
     * @Class Name : sortOprtrPrfmncMng.jsp
     * @Description : 작업자 선별 실적 관리(선별)
     * @author SI개발부
     * @since 2024.09.03
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.03   	박승진		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 작업자 선별 실적 관리(선별)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>

    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 작업자 선별 실적 관리(선별) -->
                </div>
                <div style="margin-left: auto;">


                    <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>

                </div>
            </div>
            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
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
							<th scope="row" class="th_bg">선별기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-sortFcltCd"
									name="srch-slt-sortFcltCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonSortFclt"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-sortYmdFrom"
									name="srch-dtp-sortYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-sortYmdTo"
									name="srch-dtp-sortYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</td>
						</tr>
					</tbody>
				</table>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>선별실적</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdSortPrfmnc"></div>
                    </div>
                    <div style="display: flex;gap: 3vw">
                        <div style="flex: 1;display: flex;flex-direction: column;">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>작업자별 선별실적</span>
                                    </li>
                                </ul>
                            </div>
                            <div id="sb-area-grdOprtrSortPrfmnc" style="flex: 1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div-rpt-clipReportPrint" style="display:none;"></div>
    </section>
</body>
<script>
    /** 상단 grid ref Json **/
    var jsonSortPrfmnc =[];
    var grdSortPrfmnc;

    /** 하단 grid ref Json **/
    var jsonOprtrSortPrfmnc =[];
    var grdOprtrSortPrfmnc;
	var jsonOprtrSortPrfmncTemp = [];



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



    const fn_init = async function(){



        let result = await Promise.all([
            //gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-fcltType',	jsonFcltType, 	'FCLT_GUBUN', '0000'),	// 설비유형
			gfn_setComCdSBSelect('dtl-slt-unit',	jsonUnit, 	'STD_PCKG_CD', '0000'), 			// 단위
			gfn_setApcItemSBSelect('dtl-inp-rprsItem', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("dtl-inp-rprsVrty", 		jsonApcVrty, 	gv_apcCd)			// APC 품종(저장)
        ]);
    }

    const fn_search = async function(){
    	//SBUxMethod.refreshGroup("group1");
    	jsonOprtrSortPrfmnc.length = 0;
    	grdOprtrSortPrfmnc.refresh();

        try{
            let postJsonPromise = gfn_postJSON("/am/sort/selectSortOprtngCrtrList.do",{apcCd:gv_apcCd});
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
            	jsonSortPrfmnc.length = 0;
                jsonOprtrSortPrfmncTemp.length = 0;
                data.resultList.forEach((item) => {
                	jsonOprtrSortPrfmncTemp.push(item);
                });
                jsonSortPrfmnc = jsonOprtrSortPrfmncTemp.filter((item, index, self) => index === self.findIndex(i => i.fcltCd === item.fcltCd));
                grdSortPrfmnc.rebuild();
            }else{
            	jsonSortPrfmnc.length = 0;
                grdSortPrfmnc.rebuild();
                jsonOprtrSortPrfmnc.length = 0;
                jsonOprtrSortPrfmncTemp.length = 0;
                grdOprtrSortPrfmnc.rebuild();

                let nRow = grdOprtrSortPrfmnc.getRows();
                grdOprtrSortPrfmnc.addRow(true);
                grdOprtrSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdOprtrSortPrfmnc.getCols() - 1, true);

                const inputs = document.querySelectorAll('input[id^="dtl"]');
                inputs.forEach((item) => {
                    SBUxMethod.set(item.id, null);
                });
            }

        }catch (e){
            console.log(e);
        }
    }


    const fn_save = async function(){
    	let rowData = grdSortPrfmnc.getRowData(grdSortPrfmnc.getRow());

        try{
			let sortOprtngCrtrList = grdOprtrSortPrfmnc.getGridDataAll();
				sortOprtngCrtrList.forEach((item,sn) => {
					item["status"] = grdOprtrSortPrfmnc.getRowStatus(sn+1);
					item["apcCd"] = gv_selectedApcCd;
					item["fcltType"] = rowData.fcltType;
					item["fcltCd"] = rowData.fcltCd;
				});


            //let sortFcltDtlList = sortFcltDtl.filter(x => x.delYn==="N");

            let postJsonPromise = gfn_postJSON("/am/sort/insertSortOprtngCrtr.do",sortOprtngCrtrList);

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

        let idx = grdSortPrfmnc.getRow();
        let sortFcltVO = grdSortPrfmnc.getRowData(idx);
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

    const fn_deleteDtl = async function(rowIndex){

        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let rowData = grdOprtrSortPrfmnc.getRowData(rowIndex);
        let postJsonPromise = gfn_postJSON("/am/sort/deleteSortOprtngCrtr.do",rowData);
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


    /** 상단 목록 grid create **/
    const fn_createSortPrfmncGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortPrfmnc';
        SBGridProperties.id = 'grdSortPrfmnc';
        SBGridProperties.jsonref = 'jsonSortPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
        	{
        		caption: ["전체",""], 			ref: 'checkedYn', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
					typeinfo: {
						ignoreupdate : true,
						fixedcellcheckbox : {
							usemode : true,
							rowindex : 1,
							deletecaption : false
						},
						checkedvalue : 'Y',
						uncheckedvalue : 'N'
					}
        	},
            {caption: ['선별기'], ref: 'fcltNm', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['선별일자'], ref: 'sortYmd', width: '20%', type: 'output', style:'text-align:center'},
            {caption: ['품목'], ref: 'itemNm', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['품종'], ref: 'vrtyNm', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['선별번호'], ref: 'sortNo', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['선별수량'], ref: 'sortQntt', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['선별중량'], ref: 'sortQntt', width: '10%', type: 'output', style:'text-align:center'},
        ]
        grdSortPrfmnc = _SBGrid.create(SBGridProperties);
        grdSortPrfmnc.bind('click','fn_selectSortFcltDtlInfo');
    }
    /** 하단 우측 grid create **/
    const fn_createOprtrSortPrfmnc= function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdOprtrSortPrfmnc';
        SBGridProperties.id = 'grdOprtrSortPrfmnc';
        SBGridProperties.jsonref = 'jsonOprtrSortPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: [""], 		ref: 'itemCd', 		type:'button', width:'5%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ['품목'], ref: 'rprsItem', width: '10%', type: 'combo', typeinfo : {ref:'jsonApcItem', label:'label', value:'value', displayui : true, oneclickedit : true}, style:'text-align:center'},
            {caption: ['품종'], ref: 'rprsVrty', width: '10%', type: 'combo', typeinfo : {ref:'jsonApcVrty', label:'label', value:'value', displayui : true, oneclickedit : true, filtering: {usemode : true, uppercol : 'rprsItem', attrname : 'itemCd'}}, style:'text-align:center'},
            {caption: ['규격'], ref: 'spcfctCd', width: '10%', type: 'input', style:'text-align:center'},
            {caption: ['투입수량'], ref: 'inptQntt', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
            {caption: ['투입중량'], ref: 'inptWght', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
            {caption: ['작업수량'], ref: 'rsltQntt', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
            {caption: ['작업중량'], ref: 'rsltWght', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
        ]
        grdOprtrSortPrfmnc = _SBGrid.create(SBGridProperties);

        let nRow = grdOprtrSortPrfmnc.getRows();
        grdOprtrSortPrfmnc.addRow(true);
        grdOprtrSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdOprtrSortPrfmnc.getCols() - 1, true);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {

        const editableRow = grdOprtrSortPrfmnc.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";

        grdOprtrSortPrfmnc.rebuild();
        grdOprtrSortPrfmnc.addRow(true);
        grdOprtrSortPrfmnc.addStatus(nRow,"insert");
        nRow++;
        grdOprtrSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdOprtrSortPrfmnc.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(nRow) {
        let rowIndex = grdOprtrSortPrfmnc.getRow();
        let status = grdOprtrSortPrfmnc.getRowStatus(rowIndex);
        if(status === 0){
        	fn_deleteDtl(rowIndex);
        }else{
        	grdOprtrSortPrfmnc.deleteRow(nRow);
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
    const fn_selectSortFcltDtlInfo = async function(){

		jsonOprtrSortPrfmnc.length = 0;
		let rowData = grdSortPrfmnc.getRowData(grdSortPrfmnc.getRow());

		jsonOprtrSortPrfmnc = jsonOprtrSortPrfmncTemp.filter(item => item.fcltCd === rowData.fcltCd && item.rprsItem != null);
		grdOprtrSortPrfmnc.rebuild();

		let nRow = grdOprtrSortPrfmnc.getRows();
		grdOprtrSortPrfmnc.addRow(true);
		grdOprtrSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdOprtrSortPrfmnc.getCols() - 1, true);


    }


    window.addEventListener("DOMContentLoaded",function(){
    	fn_createSortPrfmncGrid();
        fn_createOprtrSortPrfmnc();
        fn_search();
        fn_init();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
