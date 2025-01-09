<%
 /**
  * @Class Name : purSalUntprcInfo.jsp
  * @Description : 매출 단가 관리
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
	<title>title : 매출 단가 관리</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 매출 단가 관리 -->
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
							<th scope="row" class="th_bg">기준일자</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
                                    uitype="range"
                                    id="dtl-dtp-crtrYmd"
                                    name="dtl-dtp-crtrYmd"
                                    date-format="yyyy/mm/dd"
									class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
                               	</sbux-datepicker>
							</td>
							<!-- <th scope="row" class="th_bg">조회구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-crtrType"
									name="srch-slt-crtrType"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonCrtrType"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"
									style="max-width:80%;"
								></sbux-select>
							</td> -->
							<th scope="row" class="th_bg">품목/품종</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-select
										id="srch-slt-itemCd"
										name="srch-slt-itemCd"
										uitype="single"
										class="form-control input-sm"
										unselected-text="전체"
										jsondata-ref="jsonComItem"
										onchange="fn_onChangeSrchItemCd(this)"
									></sbux-select>
								</td>
								<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
								</td>

							<sbux-input
								id="srch-inp-prdcrIdentno"
								name="srch-inp-prdcrIdentno"
								uitype="hidden"
							></sbux-input>
							<sbux-input
								id="srch-inp-prdcrCd"
								name="srch-inp-prdcrCd"
								uitype="hidden"
							></sbux-input>
							<sbux-input
								id="srch-inp-prdcrNm"
								name="srch-inp-prdcrNm"
								uitype="hidden"
							></sbux-input>

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
									<span>매출 단가 목록</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSlsUntprcList" style="height:50vh;"></div>


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




	const fn_initSBSelect = async function() {

		
		//jsonCrtrCd = await gfn_getComCdDtls('SLS_CRTR_CD');
		jsonCrtrType = await gfn_getComCdDtls('SLS_CRTR_TYPE');
		jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd,'');
		await gfn_setComCdSBSelect('srch-slt-crtrType', jsonCrtrCd, 'SLS_CRTR_TYPE'); //매출기준
		
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd),	// 품종
		]);
		

	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
    	
    	SBUxMethod.set("srch-slt-itemCd", ""); // 품목
		SBUxMethod.set("srch-slt-vrtyCd", ""); // 품종
		
		fn_createSlsUntprcList();
		fn_search();
    }




	var jsonCrtrCd = [];
    
    //매출 단가
    var grdSlsUntprcList;
    var jsonSlsUntprcList = [];
        
  	//품목
	var jsonComItem = [];
	//품종
	var jsonComVrty = [];
	//규격
	var jsonApcSpcfct = [];
	//출하포장단위
	var jsonSpmtPckgUnit = [];


    const fn_createSlsUntprcList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSlsUntprcList';
	    SBGridProperties.id = 'grdSlsUntprcList';
	    SBGridProperties.jsonref = 'jsonSlsUntprcList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	 {caption: [""], 		ref: 'itemCd', 		type:'button', width:'5%', style: 'text-align:center',
                 renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                	 if (objRowData.status==="2" || objRowData.status==="3" ){
                		 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdSlsUntprcList," + nRow + ")'>삭제</button>";
                     } else if(objRowData.status==="1") {
                         return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdSlsUntprcList," + nRow + ", 1)'>추가</button>";
                     }
                 }},
            {caption: ["품목"], 		ref: 'itemNm',	 	  	type: 'outputbutton',	width:'12%',	typeinfo : {callback : fn_grdModalVrty},	 style:'text-align:center'},
            {caption: ["품종"],		ref: 'vrtyNm', 		  	type:'output', 			width:'12%',	style:'text-align:center'},
            {caption: ["규격"], 		ref: 'spcfctNm',		type:'output', 			width:'12%', 	typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd', filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false} }, style:'text-align:center'},
            {caption: ["상품명"], 		ref: 'spmtPckgUnitNm',	type:'output',  			width:'14%',   	style:'text-align:center'},
            {caption: ["단가"],	 	ref: 'ntslUntprc',		type:'input',			width:'12%',   	style:'text-align:center'},
            {caption: ["적용기준일자"],	ref: 'aplcnCrtrYmd',	type:'datepicker',		width:'12%', 	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, style:'text-align:center'},
            {caption: [""],			ref: 'rmrk',			type:'input',			width:'%',   	style:'text-align:center'},      
			{caption: ["상태"], 		ref: 'status',			type:'output',	hidden : true},
			{caption: ["삭제여부"], 	ref: 'delYn', 			type:'output',	hidden : true},
			{caption: ['품목코드'], 	ref: 'itemCd', width: '50px', type: 'combo', typeinfo : {ref:'jsonSpmtPckgUnit', label:'itemNm', value:'itemCd'},style:'text-align:center', hidden:true},
            {caption: ['품종코드'], 	ref: 'vrtyCd', width: '50px', type: 'output', style:'text-align:center', hidden:true},
            {caption: ['규격코드'], 	ref: 'spcfctCd', width: '50px', type: 'output', style:'text-align:center', hidden:true}
        ];
        grdSlsUntprcList = _SBGrid.create(SBGridProperties);
    }





    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(grd, nRow, chk) {
    	const editableRow = grd.getRowData(nRow, false);	// call by reference(deep copy)
    	
    	
    	
    	if(gfn_nvl(editableRow) === ""){

    	}else{
    		editableRow.status = "3";
    	}

        grd.addRows([{status : chk.toString(),useYn : "Y", gubun : "insert" }]);
    	   	
    	
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


     const fn_grdModalVrty = function(){
     	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, "", fn_setGrdVrty, "");
     	SBUxMethod.openModal('modal-vrty')
     }
	
     const fn_setGrdVrty = function(vrty) {
 		if (!gfn_isEmpty(vrty)) {
 			let row = grdSlsUntprcList.getRow();
 			let rowData = grdSlsUntprcList.getRowData(row);

 			rowData['itemCd'] = vrty.itemCd;
 			rowData['vrtyCd'] = vrty.vrtyCd;
 			rowData['itemNm'] = vrty.itemNm;
 			rowData['vrtyNm'] = vrty.vrtyNm;
 			rowData['itemVrtyCd'] = vrty.itemCd + vrty.vrtyCd;
 			grdSlsUntprcList.setRowData(row,rowData,true);
 			let filter =  jsonApcSpcfct.filter(item => item.itemCd === vrty.itemCd);
 			let filter2 = jsonSpmtPckgUnit.filter(item => item.itemCd === vrty.itemCd);
 			jsonApcSpcfctGrd = filter;
 			jsonSpmtPckgUnitGrd = filter2;

 			grdSlsUntprcList.rebuild();
 			//gfn_setApcSpcfctsSBSelect('grdAsstCrtrList', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
 		}
 	}


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	//let crtrType = SBUxMethod.get("srch-slt-crtrType");
    	
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    	
    	let getCrtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
    	let crtrYmdFrom;
    	let crtrYmdTo;
    	
    	if(getCrtrYmd === undefined){
			return;
		}

    	getCrtrYmd.forEach((item,index) =>{
    		if(index === 0 ){
    			crtrYmdFrom = item;
    		}else if(index === 1){
    			crtrYmdTo = item;
    		}
    	})
    	    	
		if(!gfn_isEmpty(vrtyCd)){
			vrtyCd = vrtyCd.substring(4,8);
		}
    	
    	const postJsonPromise = gfn_postJSON("/am/spmt/selectSlsUntprc.do", {
			apcCd: gv_selectedApcCd,
			aplcnCrtrYmdFrom : crtrYmdFrom,
			aplcnCrtrYmdTo : crtrYmdTo,
			itemCd : itemCd,
			vrtyCd : vrtyCd
				
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonSlsUntprcList.length = 0;

  	      		data.resultList.forEach(item => {
  	      			item['status'] = '2';
  	      			item['gubun'] = 'update';
  	      		}); 
  	          	jsonSlsUntprcList = data.resultList;
  	          	
          		grdSlsUntprcList.rebuild();
          		
          		let nRow = grdSlsUntprcList.getRows();
  	  		    fn_addRow(grdSlsUntprcList,nRow,"1");

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
		
    	let rowData = grdSlsUntprcList.getRowData(grdSlsUntprcList.getRow());
    	let status1 = grdSlsUntprcList.getRowStatus(grdSlsUntprcList.getRow());
		if(rowData === undefined){
			return;
		}
		
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    	
    	let getCrtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
    	let crtrYmdFrom;
    	let crtrYmdTo;
    	if(getCrtrYmd === undefined){
			return;
		}

    	getCrtrYmd.forEach((item,index) =>{
    		if(index === 0 ){
    			crtrYmdFrom = item;
    		}else if(index === 1){
    			crtrYmdTo = item;
    		}
    	})
    	
		let allData = grdSlsUntprcList.getGridDataAll();
    	var slsUntprcList = [];
				
        try{
			
				allData.forEach((item, index)=>{								
					slsUntprcList.push({
						apcCd : gv_selectedApcCd
						, itemCd : item.itemCd
	        			, vrtyCd : item.vrtyCd
	        			, spcfctCd : item.spcfctCd
	        			, spmtPckgUnitNm : item.spmtPckgUnitNm
	        			, spmtPckgUnitCd : item.spmtPckgUnitCd
	        			, ntslUntprc  : item.ntslUntprc
						, aplcnCrtrYmd : item.aplcnCrtrYmd
						, spmtSlsUntprcCd : item.spmtSlsUntprcCd
					});
			});
			
            let postJsonPromise = gfn_postJSON("/am/spmt/updateSlsUntprc.do",slsUntprcList);

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



	 const fn_delete = async function(grd,index){
			// comConfirm
			if (!gfn_comConfirm("Q0001", "집계기준목록 삭제")) {	//	Q0001	{0} 하시겠습니까?
		    	return;
		    }
			
			let getCrtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
	    	let crtrYmdFrom;
	    	let crtrYmdTo;
	    	
			
	    	getCrtrYmd.forEach((item,index) =>{
	    		if(index === 0 ){
	    			crtrYmdFrom = item;
	    		}else if(index === 1){
	    			crtrYmdTo = item;
	    		}
	    	})
			
	    	let rowData = grd.getRowData(index);
			if(rowData === undefined){
				return;
			}
			console.log(rowData);
	    	
	    	//let allData = grdSlsUntprcList.getGridDataAll();


	        try{
	        	let slsUntprc = {
	        			apcCd : gv_selectedApcCd,
	        			crtrYmdFrom : crtrYmdFrom,
	        			crtrYmdTo : crtrYmdTo,
	        			itemCd : rowData.itemCd,
	        			vrtyCd : rowData.vrtyCd,
	        			spmtPckgUnitCd : rowData.spmtPckgUnitCd,
	        			spmtSlsUntprcCd : rowData.spmtSlsUntprcCd
	        			
	        	};
	        	
	        	console.log(slsUntprc);

	            let postJsonPromise = gfn_postJSON("/am/spmt/deleteSlsUntprc.do",slsUntprc);

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

		
		/**
		 * @name fn_onChangeSrchItemCd
		 * @description 품목 선택 변경 event
		 */
		const fn_onChangeSrchItemCd = async function(obj) {

			let itemCd = obj.value;
			const itemInfo = _.find(jsonComItem, {value: itemCd});
			
			let result = await Promise.all([
				gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd)
			]);
		}

		/**
		 * @name fn_onChangeSrchVrtyCd
		 * @description 품종 선택 변경 event
		 */
		const fn_onChangeSrchVrtyCd = async function(obj) {
			let vrtyCd = obj.value;

			if(gfn_isEmpty(vrtyCd)){
				return;
			}
			const itemCd = vrtyCd.substring(0,4);
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>