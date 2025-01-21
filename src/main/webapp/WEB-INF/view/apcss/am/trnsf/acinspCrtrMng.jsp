<%
    /**
     * @Class Name : acinspCrtrMng.jsp
     * @Description : 실사기준관리 화면
     * @author SI개발부
     * @since 2024.11.25
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2025.01.13     박승진       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 실사기준관리</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 실사기준관리 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
                <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
                <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
            </div>
        </div>
        <div class="box-body">
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 6%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">기준유형</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-select id="srch-slt-aiCrtrType"
                                     name="srch-slt-aiCrtrType"
                                     uitype="single"
                                     unselected-text="전체"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     jsondata-ref="jsonAiCrtrType">
                        </sbux-select>
                    </td>
                    <td colspan="9" style="border-top: hidden"></td>
                </tr>
                </tbody>
            </table>
            <div style="display: flex; flex-direction: row; gap: 10px">
                <div style="flex: 2">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>실사 기준정보</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-aiCrtr" style="height: 400px"></div>
                </div>
                 <div style="flex: 8">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>실사 기준상세정보</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-aiCrtrDtl" style="height: 400px"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">

	/** 대표품목 **/
	var jsonApcItem = [];

	/** 대표품종 **/
	var jsonApcVrty = [];

	/** 창고구분 **/
	var jsonComWarehouse = [];

	/** 기준유형 **/
	var jsonAiCrtrType = [];

	/** 재고구분 **/
	var jsonInvntrSeCd  = [];


    /** grid 변수 셋팅 **/
    var jsonAiCrtr = [];
    let grdAiCrtr;
    var jsonAiCrtrDtl = [];
    let grdAiCrtrDtl;

    var jsonMtrlType = [];

    var jsonDtlCd = [];

    var jsonAiCrtrDtlTemp = [];

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });

    const fn_initSBselect = async function(){

        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
            gfn_setComCdSBSelect('srch-slt-aiCrtrType',	jsonAiCrtrType, 	'AI_CRTR_TYPE'),	// 기준유형
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd)		// 품목
        ]);

        jsonAiCrtr = jsonAiCrtrType.map(item => ({label : item.label, value : item.value, aiCrtrType : item.value}));
    }


    const fn_init = async function(){
    	await fn_initSBselect();
        await fn_createAiCrtr();
        await fn_createAiCrtrDtl();

        await fn_search();
    }

    const fn_createAiCrtr = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-aiCrtr';
        SBGridProperties.id = 'grdAiCrtr';
        SBGridProperties.jsonref = 'jsonAiCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: ["기준유형"],	ref: 'aiCrtrType',	type: 'combo', typeinfo : {ref:'jsonAiCrtrType', label:'label', value:'value', oneclickedit: true},  width:'200px', style: 'text-align:center;', disabled : {uihidden : true}},
        ]
        grdAiCrtr = _SBGrid.create(SBGridProperties);
        grdAiCrtr.bind('click','fn_grdAiClick');
    }

    const fn_createAiCrtrDtl = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-aiCrtrDtl';
        SBGridProperties.id = 'grdAiCrtrDtl';
        SBGridProperties.jsonref = 'jsonAiCrtrDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
        	{caption: [""], 		ref: 'chk', 		type:'button', width:'50px', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (objRowData.delYn === ""){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdAiCrtrDtl," + nRow + ", " + nCol + ")'>추가</button>";
                    } else if (objRowData.delYn === "N"){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdAiCrtrDtl," + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ["기준상세코드"],	ref: 'crtrCd',	type: 'combo', typeinfo : {ref:'jsonDtlCd', label:'text', value:'value', oneclickedit: true},  width:'150px', style: 'text-align:center;'},
            {caption: ["기준상세값"],	ref: 'crtrVl',		type: 'input', width:'150px', style: 'text-align:center;' ,format : {type:'number', rule:'#,###'}},
            {caption: ["기준명"],	ref: 'crtrIndctNm',		type: 'input', width:'150px', style: 'text-align:center;'},
        ]
        grdAiCrtrDtl = _SBGrid.create(SBGridProperties);
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
        let getCols = grd.getCols();
        grd.rebuild();
        grd.setCellDisabled(0, 0, nRow, getCols, false);
        nRow++;
        grd.addRow(true,{delYn : ""});
        grd.setCellDisabled(nRow , 0, nRow, getCols, true);
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

     const fn_deleteDtl = async function(grd ,rowIndex){

         if(!gfn_comConfirm("Q0001","삭제")){
             return;
         };

         let rowData = grd.getRowData(rowIndex);
         let mtrlType = rowData.aiCrtrType;

         let url = "";

         let grdId = grd.getID();
         url = "/am/invntr/deleteInvntrAiCrtr.do";


         let postJsonPromise = gfn_postJSON(url,rowData);
         let data = await postJsonPromise;

         try{
             if(data.resultStatus == "S"){
               	 fn_search();
                 gfn_comAlert("I0001");
                 grd.refresh();
             };
         }catch (e){
             console.error(e);
         }
     }


     const fn_search = async function(){
    	jsonAiCrtrDtl.length = 0;
 		let apcCd = gv_apcCd;
 		let aiCrtrType = SBUxMethod.get("srch-slt-aiCrtrType");


 		let obj = {
 				apcCd : apcCd
 				, aiCrtrType : aiCrtrType
 				};

 		let postJsonPromise = gfn_postJSON("/am/invntr/selectInvntrAiCrtr.do",obj );
 	    let data = await postJsonPromise;
 	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				jsonAiCrtrDtl.length = 0;
  				jsonAiCrtrDtlTemp.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spmtPckgUnitVO = {
  					  apcCd : item.apcCd
  					  ,	aiCrtrType 		: item.aiCrtrType
  					  , crtrIndctNm 	: item.crtrIndctNm
  					  , crtrCd      	: item.crtrCd
  					  , crtrVl        	: item.crtrVl
  					  , delYn 			: item.delYn
  					  , gubun			: "update"
  					}
  					jsonAiCrtrDtlTemp.push(spmtPckgUnitVO);
  				});

  		    	let rowData = grdAiCrtr.getRowData(grdAiCrtr.getRow());
  		    	let nRow = grdAiCrtr.getRows();
  		    	let nCol = grdAiCrtr.getCols();

				if (rowData === undefined){
					grdAiCrtrDtl.addRow(true,{delYn : ""});
					grdAiCrtrDtl.setCellDisabled(0, nCol-1, nRow-1, nCol -1, false);
	  		    	grdAiCrtrDtl.setCellDisabled(nRow-1, 	0, nRow-1, nCol-1, true);
					return;
				}else{
					let aiCrtrType = rowData.aiCrtrType;

					jsonAiCrtrDtl = jsonAiCrtrDtlTemp.filter(item => item.aiCrtrType === aiCrtrType);
	  		    	grdAiCrtrDtl.rebuild();
	  		    	grdAiCrtrDtl.addRow(true,{delYn : ""});
	  		    	grdAiCrtrDtl.setCellDisabled(0, nCol-1, nRow-1, nCol -1, false);
	  		    	grdAiCrtrDtl.setCellDisabled(nRow-1, 	0, nRow-1, nCol-1, true);


				}




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

   const fn_save = async function(){
 		let apcCd = gv_apcCd;

 		let rowData = grdAiCrtr.getRowData(grdAiCrtr.getRow());
 		let aiCrtrType = rowData.aiCrtrType;




 		let allData = grdAiCrtrDtl.getGridDataAll();
 		let filterData = allData
 		  .filter(item => item.delYn === 'N') // delYn이 'N'인 항목 필터링
 		  .map(item => ({ ...item, aiCrtrType: aiCrtrType,apcCd : apcCd, useYn:"Y" })); // aiCrtrType 값 추가




 		let postJsonPromise = gfn_postJSON("/am/invntr/insertInvntrAiCrtr.do",filterData );
 	    let data = await postJsonPromise;
 	    try{
  			if (_.isEqual("S", data.resultStatus)) {
 				fn_search();
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

   const fn_grdAiClick = async function(){
   	let nRow = grdAiCrtr.getRow();
   	let nCol = grdAiCrtr.getCol(); //현재 선택된 컬럼

   	let rowData = grdAiCrtr.getRowData(nRow);

	if(nRow === -1){
		return;
	}

	let aiCrtrType = rowData.aiCrtrType;
	if(aiCrtrType === "AI_WAREHOUSE"){
		jsonDtlCd = jsonComWarehouse;
	}else if (aiCrtrType === "AI_ITEM"){
		jsonDtlCd = jsonApcItem;
	}

	jsonAiCrtrDtl.length = 0;
	jsonAiCrtrDtl = jsonAiCrtrDtlTemp.filter(item => item.aiCrtrType === rowData.aiCrtrType);

	grdAiCrtrDtl.rebuild();
	grdAiCrtrDtl.addRow(true,{delYn : ""});

   	//let jsonDtlCd = jsonBomCmpstnTemp.filter(item => item.mtrlCd === rowData.mtrlCd);
   	//jsonBomCmpstn = bomCmpstnFilter;
   	//grdAiCrtr.refresh();
   	//grdAiCrtr.addRow(true);

   }



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>