<%
 /**
  * @Class Name : totCrtrMng.jsp
  * @Description : 집계기준관리
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
	<title>title : 집계기준관리</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 집계기준관리 -->
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
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-crtrType"
									name="srch-slt-crtrType"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonCrtrType"
								></sbux-select>
							</td>

						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="display: flex; flex-direction: column; height: 40vh">
 					<div class="row">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>집계기준 목록</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdTotCrtrList" style="height:30vh;"></div>

						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>집계기준 상세정보</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdTotCrtrDtlList" style="height:30vh;"></div>

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
</body>
<script type="text/javascript">



	const fn_initSBSelect = async function() {
		jsonExcl = await gfn_getComCdDtls('TOT_ELMT_EXCL');
		jsonIncl = await gfn_getComCdDtls('TOT_ELMT_INCL');
		jsonTrgtKnd = await gfn_getComCdDtls('TOT_TRGT_KND');
		jsonCrtrKnd = await gfn_getComCdDtls('TOT_CRTR_KND');
		jsonTotArtclKnd = await gfn_getComCdDtls('TOT_ARTCL_KND');
		jsonDtlPrcs = await gfn_getComCdDtls('TOT_DTL_PRCS_CD');
		jsonElmt = await gfn_getComCdDtls('TOT_ELMT_INCL');
		jsonDtlType = await gfn_getComCdDtls('TOT_DTL_TYPE');


		//jsonCrtrType = await gfn_getComCdDtls('TOT_CRTR_TYPE');
		await gfn_setComCdSBSelect('srch-slt-crtrType', 		jsonCrtrType, 	'TOT_CRTR_TYPE')			// 집계기준
		mergeArray = [...jsonExcl, ...jsonIncl, ...jsonTrgtKnd, ...jsonCrtrKnd, ...jsonTotArtclKnd];
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
		fn_createTotCrtrList();
		fn_createTotCrtrDtlList();
		fn_search();
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

    const fn_modalVrty = function() {
    	let row = grdTotCrtrDtlList.getRow()
		let rowData = grdTotCrtrDtlList.getRowData(grdTotCrtrDtlList.getRow());

    	if(rowData.dtlCd === 'ITEM' || rowData.dtlCd === 'VRTY'){
	    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty);
	    	SBUxMethod.openModal("modal-vrty");
    	}
	}

    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			let row = grdTotCrtrDtlList.getRow()
			let rowData = grdTotCrtrDtlList.getRowData(grdTotCrtrDtlList.getRow());
			if(rowData.dtlCd === 'ITEM'){
				rowData['dtlVl'] = vrty.itemCd;
			}else if(rowData.dtlCd === 'VRTY'){
				rowData['dtlVl'] = vrty.itemCd + vrty.vrtyCd;
			}
			grdTotCrtrDtlList.setRowData(row,rowData,true);
		}
	}



	//기준유형
	var jsonCrtrType = [];
	var jsonExcl = [];
	var jsonIncl = [];
	var jsonCrtrKnd = [];
	var jsonTrgtKnd = [];
	var mergeArray = [];
	var jsonDtlCd =[];
	var jsonTotArtclKnd = [];
	var jsonDtlPrcs = [];

	var jsonElmt = [];

	var jsonYn = [
		{value : 'Y', label : '사용' }
		, {value : 'N', lable : '미사용' }
	];

	var jsonTotDtlType = [];

    // grid
    // 집계기준목록
    var grdTotCrtrList;
    var jsonTotCrtrList = [];

    // 집계기준상세정보
    var grdTotCrtrDtlList;
    var jsonTotCrtrDtlList= [];
    var jsonTempTotCrtrDtlList = [];


    const fn_createTotCrtrList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTotCrtrList';
	    SBGridProperties.id = 'grdTotCrtrList';
	    SBGridProperties.jsonref = 'jsonTotCrtrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	 {caption: [""], 		ref: 'itemCd', 		type:'button', width:'5%', style: 'text-align:center',
                 renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                	 if (objRowData.status==="2" || objRowData.status==="3" ){
                		 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdTotCrtrList," + nRow + ")'>삭제</button>";
                     } else if(objRowData.status==="1") {
                         return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdTotCrtrList," + nRow + ", 1)'>추가</button>";
                     }
                 }},
            {caption: ["기준유형"],
               	 ref : 'totCrtrType',
               	 type: 'combo',
               	 typeinfo : {ref:'jsonCrtrType', label:'label', value:'value'},
               	 width:'15%',
               	 style:'text-align:center'},

            {caption: ["기준코드"],
                 ref: 'crtrCd',
                 type:'combo',
                 typeinfo : {ref:'mergeArray', label:'cdVlNm', value:'cdVl',
                	 filtering: {usemode : true, uppercol : 'totCrtrType', attrname : 'cdId'}},
                width:'15%',
                style:'text-align:center'},
            {caption: ["집계상세유형"],
                ref: 'totDtlType',
                type:'combo',
                typeinfo : {ref:'jsonDtlType', label:'cdVlNm', value:'cdVl'},
               width:'15%',
               style:'text-align:center'},
            {caption: ["표시순서"],             ref: 'indctSeq',                 type:'input',      width:'5%',  style:'text-align:center'},
            {caption: ["사용여부"],
            	 ref: 'useYn',
            	 type:'combo',
            	 typeinfo : {ref:'jsonYn', label:'label', value:'value', oneclickedit: true},
				width:'5%',  style:'text-align:center'},
            {caption: ["기준비고"],             ref: 'rmrk',                 type:'input',      width:'55%',  style:'text-align:center'},
			{caption: ["상태"], ref: 'status', type:'output',hidden : true},
			{caption: ["삭제여부"], ref: 'delYn', type:'output',hidden : true}
        ];
        grdTotCrtrList = _SBGrid.create(SBGridProperties);
        grdTotCrtrList.bind('click', 'fn_grdTotCrtrClick');
        //grdTotCrtrList.bind('rowchanged', 'fn_grdTotCrtrClick');
        //grdTotCrtrList.bind('valuechanged' , fn_grdTotCrtrClick);
        //grdSortPrfmnc.bind('beforepagechanged', fn_pagingSortPrfmnc);
    }

    const fn_createTotCrtrDtlList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTotCrtrDtlList';
	    SBGridProperties.id = 'grdTotCrtrDtlList';
	    SBGridProperties.jsonref = 'jsonTotCrtrDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	 {caption: [""], 		ref: 'itemCd', 		type:'button', width:'5%', style: 'text-align:center',
                 renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                     if (objRowData.status==="2" || objRowData.status==="3"){
                    	 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdTotCrtrDtlList," + nRow + ")'>삭제</button>";
                     } else if(objRowData.status==="1") {
                    	 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdTotCrtrDtlList," + nRow + ", 1)'>추가</button>";
                     }
                 }},
            {caption: ["상세순번"],        ref: 'dtlSn',             type:'input', width:'15%', style:'text-align:center' },
            {caption: ["상세코드"],
            	 ref: 'dtlCd',
            	 type:'combo',
            	 typeinfo : {ref:'jsonDtlCd', label:'cdVlNm', value:'cdVl', oneclickedit: true},
				 width:'15%',
				 style:'text-align:center' },
            {caption: ["상세값"]
				 , ref: 'dtlVl'
				 , type:'inputbutton'
				 , typeinfo : {callback: fnCallback}
				 , width:'15%'
				 , style:'text-align:center'
				 //, datatype : 'number'
				 //, typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}}
				 },
            {caption: ["집계상세처리코드"],
                ref: 'totDtlPrcsCd',
                type:'combo',
                typeinfo : {ref:'jsonDtlPrcs', label:'cdVlNm', value:'cdVl'},
               width:'15%',
               style:'text-align:center'},
            {caption: ["사용여부"],
              	 ref: 'useYn',
              	 type:'combo',
              	 typeinfo : {ref:'jsonYn', label:'label', value:'value', oneclickedit: true},
  				width:'5%',  style:'text-align:center'},
            {caption: ["상세비고"], ref: 'rmrk', type:'input',      width:'50%',  style:'text-align:center'},
			{caption: ["상태"], ref: 'status', type:'output',hidden : true},
			{caption: ["삭제여부"], ref: 'delYn', type:'output',hidden : true}
        ];
        grdTotCrtrDtlList = _SBGrid.create(SBGridProperties);
    }

    const fn_grdTotCrtrClick = function(){


    	let row = grdTotCrtrList.getRow();
    	let col = grdTotCrtrList.getCol();
    	let colType = grdTotCrtrList.getColRef('totCrtrType');
    	let rowData = grdTotCrtrList.getRowData(row);

    	if(rowData === "undefined"){
    		return;
    	}
    	//집계기준 기준유형에 맞는 상세 목록 조회
    	jsonTotCrtrDtlList = jsonTempTotCrtrDtlList.filter(item => item.totCrtrType === rowData.totCrtrType);

    	grdTotCrtrDtlList.refresh();

    	let nRow = grdTotCrtrDtlList.getRows();
    	fn_addRow(grdTotCrtrDtlList,nRow,"1");

    	if (rowData.totCrtrType === ""){
    		return;
    	}

    	if(rowData.totCrtrType === "TOT_TRGT_KND"){
    		jsonDtlCd = jsonTotArtclKnd;
    		grdTotCrtrDtlList.rebuild();
    	}else if(rowData.totCrtrType === "TOT_ELMT_INCL"
    				|| rowData.totCrtrType=== "TOT_ELMT_EXCL"
    				|| rowData.totCrtrType=== "TOT_CRTR_KND" ){
    		jsonDtlCd = jsonDtlPrcs;
    		grdTotCrtrDtlList.rebuild();
    	}


    }

    const fnCallback = function(){
    	fn_modalVrty();
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(grd, nRow, chk) {
    	const editableRow = grd.getRowData(nRow, false);	// call by reference(deep copy)

    	if(editableRow === undefined){

    	}else{
    		editableRow.status = "3";
    	}

        grd.addRows([{status : chk.toString()}]);
        nRow++;
        grd.setCellDisabled(nRow, 0, nRow, grd.getCols() - 1, true);
        grd.setCellDisabled(nRow-1, 0, nRow-1, grd.getCols() - 1, false);
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
        	fn_delete(grd,rowIndex);
        }else{
        	grd.deleteRow(nRow);
        }
    }






	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

    	const postJsonPromise = gfn_postJSON("/am/tot/selectTotCrtrInfoList.do", {
			apcCd: gv_selectedApcCd,
			crtrType : ''
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonTotCrtrList.length = 0;
  	      	    jsonTotCrtrDtlList.length = 0;

  	      		data.resultList1.forEach(item => item['status'] = '2');
  	          	jsonTotCrtrList = data.resultList1;

  	            data.resultList2.forEach(item => item['status'] = '2');
  	            jsonTempTotCrtrDtlList = data.resultList2;



          		grdTotCrtrList.rebuild();
          		grdTotCrtrDtlList.rebuild();
          		let nRow = grdTotCrtrList.getRows();
  	  			let nRow2 = grdTotCrtrDtlList.getRows();

  	  		    fn_addRow(grdTotCrtrList,nRow,"1");
  	  			fn_addRow(grdTotCrtrDtlList,nRow2,"1");


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




    const fn_save = async function(){
    	let rowData = grdTotCrtrList.getRowData(grdTotCrtrList.getRow());
    	let status1 = grdTotCrtrList.getRowStatus(grdTotCrtrList.getRow());
		if(rowData === undefined){
			return;
		}
        try{

        	let totCrtr = {
        			apcCd : gv_selectedApcCd
        			, totCrtrType : rowData.totCrtrType
        			, crtrCd : rowData.crtrCd
        			, crtrVl : rowData.crtrVl
        			, crtrIndctNm : mergeArray.find(item => item.cdVl === "VRTY")['cdVlNm']
        			, indctSeq : parseInt(rowData.indctSeq)
        			, useYn : rowData.useYn
        			, status : status1
      				, totDtlType : rowData.totDtlType
        	};



			let totCrtrDtlList = grdTotCrtrDtlList.getGridDataAll();
			    totCrtrDtlList.forEach((item,sn) => {
					delete item.itemCd;
					item["apcCd"] = gv_selectedApcCd;
        			item["totCrtrType"] = rowData.totCrtrType;
        			item["crtrCd"] = rowData.crtrCd;
        			item["crtrVl"] = rowData.crtrVl;
					item["apcCd"] = gv_selectedApcCd;
					item["dtlIndctNm"] = item["dtlVl"];
				});

            let totDtlList = totCrtrDtlList.filter(x => x.status === "3" || x.status ==="2")



            let postJsonPromise = gfn_postJSON("/am/tot/insertTotCrtrInfoList.do",[totCrtr,totDtlList]);

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

	/**
     * @name fn_update
     * @description 선별실적 수정
     */
	const fn_update = async function() {

		const allData = grdSortPrfmnc.getGridDataAll().filter((item)=>item.checkedYn === "Y");
		var sortPrfmncList = [];

		allData.forEach((item, index) => {
					sortPrfmncList.push({
						apcCd: gv_selectedApcCd
						, sortno: item.sortno
						, qntt : item.chgSortQntt
						, wght : item.chgSortWght
						, sortSn : item.sortSn
						, inptYmd : item.inptYmd
						, grdCd : item.grdCd
						, fcltCd : item.fcltCd

	    			});


    		}
		);


		if (sortPrfmncList.length == 0) {
			gfn_comAlert("W0005", "수정대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "선별실적수정")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }


    	const postJsonPromise = gfn_postJSON("/am/sort/updateSortPrfmncForFcrs.do", sortPrfmncList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}

	 const fn_delete = async function(grd,index){
			// comConfirm
			if (!gfn_comConfirm("Q0001", "집계기준목록 삭제")) {	//	Q0001	{0} 하시겠습니까?
		    	return;
		    }

	    	let rowData = grd.getRowData(index);
			if(rowData === undefined){
				return;
			}

	        try{

	        	let totCrtr = {
	        			apcCd : gv_apcCd
	        			, totCrtrType : rowData.totCrtrType
	        			, crtrCd : rowData.crtrCd
	        	};



				/*let totCrtrDtlList = grdTotCrtrDtlList.getGridDataAll();
				    totCrtrDtlList.forEach((item,sn) => {
						delete item.itemCd;
						item["apcCd"] = gv_selectedApcCd;
						Object.assign(item,totCrtr);
						item["status"] = grdTotCrtrDtlList.getRowStatus(sn+1).toString();
						item["dtlIndctNm"] = item["dtlVl"];

					}); */


	            //let totDtlList = totCrtrDtlList.filter(x => x.delYn==="N");

	            let postJsonPromise = gfn_postJSON("/am/tot/deleteTotMngInfo.do",totCrtr);

	            if(postJsonPromise){
	                let data = await postJsonPromise;
	                if (data.resultStatus == "S") {
	                    fn_search();
	                    return;
	                }
	            }

	        }catch (e){
	            console.log(e);
	        }
	    }



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>