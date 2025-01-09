<%
    /**
     * @Class Name : sortOprtngCrtrMng.jsp
     * @Description : 가동 기준 관리(포장)
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
    <title>title : 가동 기준 관리(포장)</title>
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
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 가동 기준 관리(선별) -->
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
							<th scope="row" class="th_bg">포장기</th>
							<td colspan="3"  class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-pckgFcltCd"
									name="srch-slt-pckgFcltCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonFclt"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"
									style="max-width:80%;"
								></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>포장기 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdSortFcltList"></div>
                    </div>
                    <div style="display: flex;gap: 3vw">
                        <div style="flex: 1;display: flex;flex-direction: column;">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>가동기준 기준정보</span>
                                    </li>
                                </ul>
                            </div>
                            <div id="sb-area-grdOprtngCrtr" style="flex: 1"></div>
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
    var jsonSortFcltList =[];
    var grdSortFcltList;

    /** 하단 grid ref Json **/
    var jsonOprtngCrtr =[];
    var grdOprtngCrtr;
	var jsonOprtngCrtrTemp = [];



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

    /** 규격 **/
    var jsonApcSpcfct = [];

    /** 설비 **/
    var jsonFclt = [];



    const fn_init = async function(){



        let result = await Promise.all([
            //gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-fcltType',	jsonFcltType, 	'FCLT_GUBUN', '0000'),	// 설비유형
			gfn_setComCdSBSelect('dtl-slt-unit',	jsonUnit, 	'STD_PCKG_CD', '0000'), 			// 단위
			gfn_setApcItemSBSelect('dtl-inp-rprsItem', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("dtl-inp-rprsVrty", 		jsonApcVrty, 	gv_apcCd)			// APC 품종(저장)

        ]);
        jsonApcSpcfct = await gfn_getApcSpcfcts(gv_apcCd);
    }

    const fn_search = async function(){
    	//SBUxMethod.refreshGroup("group1");
    	jsonOprtngCrtr.length = 0;
    	grdOprtngCrtr.refresh();
		let fcltCd = SBUxMethod.get("srch-slt-pckgFcltCd");
        try{
            let postJsonPromise = gfn_postJSON("/am/sort/selectSortOprtngCrtrList.do",{apcCd:gv_apcCd,fcltType : 'PCKG_FCLT_CD',fcltCd : fcltCd});
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
                jsonSortFcltList.length = 0;
                jsonOprtngCrtrTemp.length = 0;
                data.resultList.forEach((item) => {
                	jsonOprtngCrtrTemp.push(item);
                });
                jsonSortFcltList = jsonOprtngCrtrTemp.filter((item, index, self) => index === self.findIndex(i => i.fcltCd === item.fcltCd));
                grdSortFcltList.rebuild();
            }else{
                jsonSortFcltList.length = 0;
                grdSortFcltList.rebuild();
                jsonOprtngCrtr.length = 0;
                jsonOprtngCrtrTemp.length = 0;
                grdOprtngCrtr.rebuild();

                let nRow = grdOprtngCrtr.getRows();
                grdOprtngCrtr.addRow(true);
                grdOprtngCrtr.setCellDisabled(nRow, 0, nRow, grdOprtngCrtr.getCols() - 1, true);

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
    	let rowData = grdSortFcltList.getRowData(grdSortFcltList.getRow());

        try{
			let sortOprtngCrtrList = grdOprtngCrtr.getGridDataAll();
				sortOprtngCrtrList.forEach((item,sn) => {
					if(gfn_nvl(item["gubun"]) === ""){
						item["gubun"] = "update";
					}
					item["status"] = grdOprtngCrtr.getRowStatus(sn+1);
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

        let idx = grdSortFcltList.getRow();
        let sortFcltVO = grdSortFcltList.getRowData(idx);
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

        let rowData = grdOprtngCrtr.getRowData(rowIndex);
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
    const fn_createSortListGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortFcltList';
        SBGridProperties.id = 'grdSortFcltList';
        SBGridProperties.jsonref = 'jsonSortFcltList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
            {caption: ['코드'], ref: 'fcltCd', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['명칭'], ref: 'fcltNm', width: '30%', type: 'output', style:'text-align:center'},
            {caption: ['설명'], ref: 'fcltExpln', width: '40%', type: 'output', style:'text-align:center'}
        ]
        grdSortFcltList = _SBGrid.create(SBGridProperties);
        grdSortFcltList.bind('click','fn_selectSortFcltDtlInfo');
    }
    /** 하단 우측 grid create **/
    const fn_createSortFcltDtlList = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdOprtngCrtr';
        SBGridProperties.id = 'grdOprtngCrtr';
        SBGridProperties.jsonref = 'jsonOprtngCrtr';
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
            {caption: ['품종'], ref: 'itemVrtyCd', width: '10%', type: 'combo', typeinfo : {ref:'jsonApcVrty', label:'label', value:'itemVrtyCd', displayui : true, oneclickedit : true, filtering: {usemode : true, uppercol : 'rprsItem', attrname : 'itemCd'}}, style:'text-align:center'},
            {caption: ['규격'], ref: 'spcfctCd', width: '10%', type: 'combo', typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd', displayui : true, oneclickedit : true, filtering: {usemode : true, uppercol : 'rprsItem', attrname : 'itemCd'}}, style:'text-align:center'},
            {caption: ['투입수량'], ref: 'inptQntt', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
            {caption: ['투입중량'], ref: 'inptWght', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
            {caption: ['작업수량'], ref: 'rsltQntt', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
            {caption: ['작업중량'], ref: 'rsltWght', width: '10%', type: 'input', style:'text-align:center', typeinfo : {mask : { alias: 'numeric'}}},
        ]
        grdOprtngCrtr = _SBGrid.create(SBGridProperties);

        let nRow = grdOprtngCrtr.getRows();
        grdOprtngCrtr.addRow(true);
        grdOprtngCrtr.setCellDisabled(nRow, 0, nRow, grdOprtngCrtr.getCols() - 1, true);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {

        const editableRow = grdOprtngCrtr.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";
        editableRow.gubun = "insert";

        grdOprtngCrtr.rebuild();
        grdOprtngCrtr.addRow(true);
        grdOprtngCrtr.addStatus(nRow,"insert");
        nRow++;
        grdOprtngCrtr.setCellDisabled(nRow, 0, nRow, grdOprtngCrtr.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
     const fn_delRow = async function(nRow) {
         let rowIndex = grdOprtngCrtr.getRow();
         let rowData = grdOprtngCrtr.getRowData(rowIndex);


         if(rowData.gubun === "insert"){
         	grdOprtngCrtr.deleteRow(nRow,true);
         	grdOprtngCrtr.rebuild();
         }else{
         	fn_deleteDtl(rowIndex);
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

		jsonOprtngCrtr.length = 0;
		let rowData = grdSortFcltList.getRowData(grdSortFcltList.getRow());

		jsonOprtngCrtr = jsonOprtngCrtrTemp.filter(item => item.fcltCd === rowData.fcltCd && item.rprsItem != null);
        grdOprtngCrtr.rebuild();

		let nRow = grdOprtngCrtr.getRows();
        grdOprtngCrtr.addRow(true);
        grdOprtngCrtr.setCellDisabled(nRow, 0, nRow, grdOprtngCrtr.getCols() - 1, true);


    }

     const fn_searchFcltList = async function(){

     	let postJsonPromise = gfn_postJSON("/co/cd/selectFcltList.do", {apcCd : gv_apcCd});
         let data = await postJsonPromise;
         try{
   			if (_.isEqual("S", data.resultStatus)) {
   	        	jsonFclt.length = 0;
   	        	data.resultList.forEach((item, index) => {
   	        		if(item.cdId !== "PCKG_FCLT_CD"){
   	        			return;
   	        		}
   					let fcltVO = {
   						rowSeq 		: item.rowSeq
   					  , cdVl 		: item.cdVl
   					  , cdVlNm 		: item.cdVlNm
   					  , cdVlExpln 	: item.cdVlExpln
   					  , indctSeq 	: item.indctSeq
   					  , delYn 		: item.delYn
   					  , apcCd 		: item.apcCd
   					  , cdId 		: item.cdId
   					  , extrnlLnkgCd : item.extrnlLnkgCd
   					}


   					jsonFclt.push(fcltVO);
   				});
   	        	SBUxMethod.refresh("srch-slt-pckgFcltCd");
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
    	fn_createSortListGrid();
        fn_createSortFcltDtlList();
        fn_search();
        fn_init();
        fn_searchFcltList();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
