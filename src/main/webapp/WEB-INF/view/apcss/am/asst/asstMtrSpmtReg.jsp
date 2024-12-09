
<%
/**
 * @Class Name : asstMtrSpmtReg.jsp
 * @Description : 부자재 출고등록
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
<title>title : 부자재 출고등록</title>
<%@ include file="../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../frame/inc/headerScript.jsp"%>
<%@ include file="../../../frame/inc/clipreport.jsp"%>
<style>
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
					<!-- 부자재 출고등록 -->
				</div>
				<div style="margin-left: auto;">

					<sbux-button id="btnCreate" name="btnCreate" uitype="normal"
						class="btn btn-sm btn-outline-danger" text="신규"
						onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal"
						class="btn btn-sm btn-outline-danger" text="저장"
						onclick="fn_search"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal"
						class="btn btn-sm btn-outline-danger" text="삭제"
						onclick="fn_search"></sbux-button>
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
								<th scope="row" class="th_bg">부자재유형</th>
								<td class="td_input" style="border-right: hidden;"><sbux-select
										id="srch-slt-asstMtrType" name="srch-slt-asstMtrType"
										uitype="single" class="form-control input-sm"
										unselected-text="전체" jsondata-ref="jsonAsstMtrType"></sbux-select>
								</td>
								<th scope="row" class="th_bg">상세구분</th>
								<td colspan="2" class="td_input" style="border-right: hidden;"><sbux-select
										id="srch-slt-spcfctModel" name="srch-slt-spcfctModel"
										uitype="single" class="form-control input-sm"
										unselected-text="전체" jsondata-ref="jsonSpcfctModel"></sbux-select>
								</td>
							</tr>
							<tr>


							</tr>
							<tr>
								<th scope="row" class="th_bg">저장위치</th>
								<td class="td_input" style="border-right: hidden;"><sbux-select
										id="srch-slt-strgSpot" name="srch-slt-strgSpot"
										uitype="single" class="form-control input-sm"
										unselected-text="전체" jsondata-ref="jsonStrgSpot"></sbux-select>
								</td>
								<th scope="row" class="th_bg">출고일자</th>
								<td colspan="2"class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-spmtYmd1"
									name="srch-dtp-spmtYmd1"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</tr>

						</tbody>
					</table>
					<div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>부자재 목록</span></li>
							</ul>
						</div>
						<div id="sb-area-grdAsstMtrList"></div>
					</div>

					<table class="table table-bordered tbl_fixed" style="margin-top: 5vh;">
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
								<th scope="row" class="th_bg">출고유형</th>
								<td class="td_input" style="border-right: hidden;"><sbux-select
										id="srch-slt-spmtType" name="srch-slt-spmtType"
										uitype="single" class="form-control input-sm"
										unselected-text="전체" jsondata-ref="jsonSpmtType"></sbux-select>
								</td>
								<th scope="row" class="th_bg">출고일자</th>
								<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-spmtYmd2"
									name="srch-dtp-spmtYmd2"
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
								<li><span>출고 등록</span></li>
							</ul>
						</div>
						<div id="sb-area-grdSpmtReg"></div>
					</div>

				</div>
			</div>
		</div>
		<div id="div-rpt-clipReportPrint" style="display: none;"></div>
	</section>
</body>
<script>
    /** 부자재목록 grid ref**/
    var jsonAsstMtrList =[];
    var grdAsstMtrList;

    /** 부자재입고목록 grid ref**/
    var jsonAsstMtrWrhs =[];
    var grdAsstMtrWrhs;

    /** 부자재출고목록 grid ref**/
    var jsonAsstMtrSpmt =[];
    var grdAsstMtrSpmt;



	/** 부자재유형 select **/
	var jsonAsstMtrType = [];

	/** 부자재유형 상세 select **/
	var jsonAsstMtrTypeDtl = [];

	/** 규격/모델 select **/
	var jsonSpcfctModel = [];



    /** 대표품목 **/
    var jsonApcItem = [];

    /** 대표품종 **/
    var jsonApcVrty = [];

    /** 저장위치 **/
    var jsonStrgSpot = [];

    var comboData = [{label:'Y', value:'Y'},{label:'N', value:'N'}]



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
    	jsonAsstCrtrList.length = 0;
    	jsonAsstCrtrDtlList.length = 0;


        try{
            let postJsonPromise = gfn_postJSON("/am/asst/selectAsstMtrCrtrInfoList.do",{apcCd:gv_apcCd});
            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList1.length > 0){
            	jsonAsstCrtrList.length = 0;

            	data.resultList1.forEach((item, index) => {
  	          		jsonAsstCrtrList.push(item);
            	});
            	let nRow = grdAsstCrtrList.getRows();
            	grdAsstCrtrList.addRow(true);
                grdAsstCrtrList.setCellDisabled(nRow, 0, nRow, grdAsstCrtrList.getCols() - 1, true);

                grdAsstCrtrList.rebuild();

            }else{
            	jsonAsstCrtrList.length = 0;
            	jsonAsstCrtrDtlListTemp.length = 0;


                let nRow = grdAsstCrtrDtlList.getRows();


                const inputs = document.querySelectorAll('input[id^="dtl"]');
                inputs.forEach((item) => {
                    SBUxMethod.set(item.id, null);
                });
            }

            if(data.resultList2.length > 0 ){
            	jsonAsstCrtrDtlList.length = 0;
            	jsonAsstCrtrDtlListTemp.length = 0;

                data.resultList2.forEach((item, index) => {
  	          		jsonAsstCrtrDtlListTemp.push(item);
            	});

                let nRowDtl = grdAsstCrtrDtlList.getRows();
                grdAsstCrtrDtlList.addRow(true);
                grdAsstCrtrDtlList.setCellDisabled(nRowDtl, 0, nRowDtl, grdAsstCrtrDtlList.getCols() - 1, true);
                grdAsstCrtrDtlList.rebuild();
            }else{
            	let nRow = grdAsstCrtrList.getRows();
            	grdAsstCrtrDtlList.addRow(true);
            	grdAsstCrtrDtlList.setCellDisabled(nRow, 0, nRow, grdAsstCrtrList.getCols() - 1, true);
            }

        }catch (e){
            console.log(e);
        }
    }


    const fn_save = async function(){
    	let rowData = grdAsstCrtrList.getRowData(grdAsstCrtrList.getRow());
    	let status1 = grdAsstCrtrList.getRowStatus(grdAsstCrtrList.getRow());
		if(rowData === undefined){
			return;
		}
        try{

        	let asstMtrCrtr = {
        			apcCd : gv_apcCd
        			, asstMtrCrtrType : rowData.asstMtrCrtrType
        			, crtrCd : rowData.crtrCd
        			, crtrVl : rowData.crtrVl
        			, crtrIndctNm : rowData.crtrIndctNm
        			, indctSeq : rowData.indctSeq
        			, useYn : rowData.useYn
        			, status : status1
        	};



			let asstMtrCrtrDtlList = grdAsstCrtrDtlList.getGridDataAll();
				asstMtrCrtrDtlList.forEach((item,sn) => {
					delete item.itemCd;
					item["apcCd"] = gv_selectedApcCd;
					Object.assign(item,asstMtrCrtr);
					item["status"] = grdAsstCrtrDtlList.getRowStatus(sn+1);
				});


            //let sortFcltDtlList = sortFcltDtl.filter(x => x.delYn==="N");

            let postJsonPromise = gfn_postJSON("/am/asst/insertAsstMtrCrtrInfoList.do",[asstMtrCrtr,asstMtrCrtrDtlList]);

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
    const fn_create1 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAsstMtrList';
        SBGridProperties.id = 'grdAsstMtrList';
        SBGridProperties.jsonref = 'jsonAsstMtrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
        	{caption: [""], 		ref: 'chk', 		type:'button', width:'5%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdAsstMtrList," + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdAsstMtrList," + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ['부자재유형'], ref: 'asstMtrCrtrType', width: '20%', type: 'input', style:'text-align:center'},
            {caption: ['수량'], ref: 'asstMtrCrtrTypeNm', width: '20%', type: 'input', format : {type:'number', rule:'#,###'}, style:'text-align:center'},
            {caption: ['명칭'], ref: 'crtrCd', width: '10%', type: 'input', style:'text-align:center'},
            {caption: ['규격/모델'], ref: 'crtrIndctNm', width: '10%', type: 'input', style:'text-align:center'},
            {caption: ['단위'], ref: 'crtrVl', width: '10%', type: 'input', style:'text-align:center'},
            {caption: ['단가'], ref: 'useYn', width: '10%', type: 'input',  format : {type:'number', rule:'#,###'}, style:'text-align:center'},
            {caption: ['저장위치'], ref: 'indctSeq', width: '10%', type: 'input', style:'text-align:center'},
            {caption: ['공급처'], ref: 'indctSeq', width: '10%', type: 'input', style:'text-align:center'}

        ]
        grdAsstMtrList = _SBGrid.create(SBGridProperties);
        grdAsstMtrList.bind('click','fn_selectSortFcltDtlInfo');
    }

    /** 부자재 입고목록 grid create **/
    const fn_create2 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSpmtReg';
        SBGridProperties.id = 'grdSpmtReg';
        SBGridProperties.jsonref = 'jsonSpmtReg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{caption: [""], 		ref: 'chk', 		type:'button', width:'5%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdSpmtReg," + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdSpmtReg," + nRow + ")'>삭제</button>";
                    }
                }},
                {caption: ['부자재유형'], ref: 'asstMtrCrtrType', width: '20%', type: 'input', style:'text-align:center'},
                {caption: ['수량'], ref: 'asstMtrCrtrTypeNm', width: '20%', type: 'input', format : {type:'number', rule:'#,###'}, style:'text-align:center'},
                {caption: ['명칭'], ref: 'crtrCd', width: '10%', type: 'input', style:'text-align:center'},
                {caption: ['규격/모델'], ref: 'crtrIndctNm', width: '10%', type: 'input', style:'text-align:center'},
                {caption: ['단위'], ref: 'crtrVl', width: '10%', type: 'input', style:'text-align:center'},
                {caption: ['단가'], ref: 'useYn', width: '10%', type: 'input',  format : {type:'number', rule:'#,###'}, style:'text-align:center'},
                {caption: ['저장위치'], ref: 'indctSeq', width: '10%', type: 'input', style:'text-align:center'},
                {caption: ['공급처'], ref: 'indctSeq', width: '10%', type: 'input', style:'text-align:center'}
        ]
        grdSpmtReg = _SBGrid.create(SBGridProperties);
    }



    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(grd, nRow, nCol) {

        const editableRow = grd.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";

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

    	jsonAsstCrtrDtlList.length = 0;
		let rowData = grdAsstCrtrList.getRowData(grdAsstCrtrList.getRow());

		jsonAsstCrtrDtlList = jsonAsstCrtrDtlListTemp.filter(item => item.asstMtrCrtrType === rowData.asstMtrCrtrType);
		grdAsstCrtrDtlList.rebuild();

		let nRow = grdAsstCrtrDtlList.getRows();
		grdAsstCrtrDtlList.addRow(true);
		grdAsstCrtrDtlList.setCellDisabled(nRow, 0, nRow, grdAsstCrtrDtlList.getCols() - 1, true);


    }




    window.addEventListener("DOMContentLoaded",function(){
    	fn_create1();
    	fn_create2();
        fn_create3();
        fn_search();
        fn_init();
    });

</script>


<%@ include file="../../../frame/inc/bottomScript.jsp"%>
</html>
