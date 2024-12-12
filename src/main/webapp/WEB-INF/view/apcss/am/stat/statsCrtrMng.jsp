<%
 /**
  * @Class Name : statCrtrMng.jsp
  * @Description : 통계기준관리
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
	<title>title : 통계기준관리</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 통계기준관리 -->
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
									jsondata-ref="jsonCrtrType"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"
									style="max-width:80%;"
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
									<span>통계기준 목록</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdStatCrtrList" style="height:30vh;"></div>

						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>통계기준 상세정보</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdStatCrtrDtlList" style="height:30vh;"></div>

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


		jsonTermKnd = await gfn_getComCdDtls('STAT_TERM_KND');
		jsonArtclKnd = await gfn_getComCdDtls('STAT_ARTCL_KND');
		jsonElmtKnd = await gfn_getComCdDtls('STAT_ELMT_KND');
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);


		jsonCrtrType = await gfn_getComCdDtls('STAT_CRTR_TYPE');
		await gfn_setComCdSBSelect('srch-slt-crtrType', 		jsonCrtrCd, 	'STAT_CRTR_CD')			// 통계기준
		mergeArray = [...jsonCrtrCd,...jsonTermKnd,...jsonCrtTm,...jsonArtclKnd,...jsonExclItem,...jsonExclVrty,...jsonExclPrdcr,...jsonInclItem,...jsonInclVrty,...jsonInclPrdcr];


	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
		fn_createStatCrtrList();
		fn_createStatCrtrDtlList();
		fn_search();
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

    const fn_modalVrty = function() {
    	let row = grdStatCrtrDtlList.getRow()
		let rowData = grdStatCrtrDtlList.getRowData(grdStatCrtrDtlList.getRow());

    	if(rowData.dtlCd === 'ITEM' || rowData.dtlCd === 'VRTY'){
	    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty);
	    	SBUxMethod.openModal("modal-vrty");
    	}
	}

    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			let row = grdStatCrtrDtlList.getRow()
			let rowData = grdStatCrtrDtlList.getRowData(row);
			if(rowData.dtlCd === 'ITEM'){
				rowData['dtlVl'] = vrty.itemCd;
			}else if(rowData.dtlCd === 'VRTY'){
				rowData['dtlVl'] = vrty.itemCd + vrty.vrtyCd;
			}
			grdStatCrtrDtlList.setRowData(row,rowData,true);
		}
	}



	//기준유형
	/* var jsonCrtrType = [];
	var jsonExcl = [];
	var jsonIncl = [];
	var jsonCrtrKnd = [];
	var jsonTrgtKnd = [];


	var jsonStatArtclKnd = [];
	var jsonDtlPrcs = []; */

	var mergeArray = [];

	var jsonDtlCd =[];
	var jsonCrtrCd = [];
	var jsonTermKnd = [];
	var jsonCrtTm = [];
	var jsonArtclKnd = [];
	var jsonExclItem = [];
	var jsonExclVrty = [];
	var jsonExclPrdcr = [];
	var jsonInclItem = [];
	var jsonInclVrty = [];
	var jsonInclPrdcr = [];
	var jsonPrdcr = [];
	var jsonElmtKnd = [];


	var jsonElmt = [];

	var jsonYn = [
		{value : 'Y', label : '사용' }
		, {value : 'N', lable : '미사용' }
	];

	var jsonStatDtlType = [];

    // grid
    // 통계기준목록
    var grdStatCrtrList;
    var jsonStatCrtrList = [];

    // 통계기준상세정보
    var grdStatCrtrDtlList;
    var jsonStatCrtrDtlList= [];
    var jsonTempStatCrtrDtlList = [];


    const fn_createStatCrtrList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdStatCrtrList';
	    SBGridProperties.id = 'grdStatCrtrList';
	    SBGridProperties.jsonref = 'jsonStatCrtrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	 {caption: [""], 		ref: 'itemCd', 		type:'button', width:'5%', style: 'text-align:center',
                 renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                	 if (objRowData.status==="2" || objRowData.status==="3" ){
                		 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdStatCrtrList," + nRow + ")'>삭제</button>";
                     } else if(objRowData.status==="1") {
                         return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdStatCrtrList," + nRow + ", 1)'>추가</button>";
                     }
                 }},
            {caption: ["기준유형"],
               	 ref : 'statCrtrType',
               	 type: 'combo',
               	 typeinfo : {ref:'jsonCrtrType', label:'cdVlNm', value:'cdVl'},
               	 width:'15%',
               	 style:'text-align:center'},

            {caption: ["기준코드"],
                 ref: 'crtrCd',
                 type:'combo',
                 typeinfo : {ref:'jsonCrtrCd', label:'label', value:'value'},
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
        grdStatCrtrList = _SBGrid.create(SBGridProperties);
        grdStatCrtrList.bind('click', 'fn_grdStatCrtrClick');
    }

    const fn_createStatCrtrDtlList = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdStatCrtrDtlList';
	    SBGridProperties.id = 'grdStatCrtrDtlList';
	    SBGridProperties.jsonref = 'jsonStatCrtrDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	 {caption: [""], 		ref: 'itemCd', 		type:'button', width:'5%', style: 'text-align:center',
                 renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                     if (objRowData.status==="2" || objRowData.status==="3"){
                    	 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdStatCrtrDtlList," + nRow + ")'>삭제</button>";
                     } else if(objRowData.status==="1") {
                    	 return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdStatCrtrDtlList," + nRow + ", 1)'>추가</button>";
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
            {caption: ["통계상세처리코드"],
                ref: 'statDtlPrcsCd',
                type:'combo',
                typeinfo : {ref:'jsonArtclKnd', label:'cdVlNm', value:'cdVl'},
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
        grdStatCrtrDtlList = _SBGrid.create(SBGridProperties);
    }

    const fn_grdStatCrtrClick = function(){


    	let row = grdStatCrtrList.getRow();
    	let col = grdStatCrtrList.getCol();
    	let colType = grdStatCrtrList.getColRef('crtrCd');
    	let rowData = grdStatCrtrList.getRowData(row);

    	if(rowData === "undefined"){
    		return;
    	}


    	//통계기준 기준유형에 맞는 상세 목록 조회
    	jsonStatCrtrDtlList = jsonTempStatCrtrDtlList.filter(item => item.crtrCd === rowData.crtrCd && item.statCrtrType === rowData.statCrtrType);

    	grdStatCrtrDtlList.refresh();

    	let nRow = grdStatCrtrDtlList.getRows();
    	fn_addRow(grdStatCrtrDtlList,nRow,"1");

    	if (rowData.crtrCd === ""){
    		return;
    	}

    	if(rowData.crtrCd === "STAT_TERM_KND"){
    		jsonDtlCd = jsonTermKnd;
    		grdStatCrtrDtlList.rebuild();
    	}else if(rowData.crtrCd === "STAT_ELMT_KND"){
    		jsonDtlCd = jsonElmtKnd;
    		grdStatCrtrDtlList.rebuild();
    	}else if(rowData.crtrCd === "STAT_ARTCL_KND"){
    		jsonDtlCd = jsonArtclKnd;
    		grdStatCrtrDtlList.rebuild();
    	}


    }

    const fnCallback = function(){
    	let row = grdStatCrtrDtlList.getRow();
    	let rowData = grdStatCrtrDtlList.getRowData(row);

    	if(gfn_nvl(rowData)===""){
    		return;
    	}

    	if(rowData.dtlCd === "ITEM" || rowData.dtlCd === "VRTY"){
    		fn_modalVrty();
    	}else if(rowData.dtlCd === "PRDCR"){
    		fn_choicePrdcr();
    	}




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






	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	let crtrType = SBUxMethod.get("srch-slt-crtrType");

    	const postJsonPromise = gfn_postJSON("/am/stat/selectStatCrtrInfoList.do", {
			apcCd: gv_selectedApcCd,
			statCrtrType : crtrType
  		});

        const data = await postJsonPromise;

  		try {
 			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let statalRecordCount = 0;

  	      		jsonStatCrtrList.length = 0;
  	      	    jsonStatCrtrDtlList.length = 0;

  	      		data.resultList1.forEach(item => {
  	      			item['status'] = '2';
  	      			item['gubun'] = 'update';
  	      		});
  	          	jsonStatCrtrList = data.resultList1;

  	            data.resultList2.forEach(item =>{
  	            	item['status'] = '2';
  	            	item['gubun'] = 'update';
 	            });

  	            jsonTempStatCrtrDtlList = data.resultList2;



          		grdStatCrtrList.rebuild();
          		grdStatCrtrDtlList.rebuild();
          		let nRow = grdStatCrtrList.getRows();
  	  			let nRow2 = grdStatCrtrDtlList.getRows();

  	  		    fn_addRow(grdStatCrtrList,nRow,"1");
  	  			fn_addRow(grdStatCrtrDtlList,nRow2,"1");


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
    	let rowData = grdStatCrtrList.getRowData(grdStatCrtrList.getRow());
    	let status1 = grdStatCrtrList.getRowStatus(grdStatCrtrList.getRow());
		if(rowData === undefined){
			return;
		}
        try{
			let crtrIndctNm = jsonCrtrCd.find(item => item.value === rowData.crtrCd)
        	let statCrtr = {
        			apcCd : gv_selectedApcCd
        			, statCrtrType : rowData.statCrtrType
        			, crtrCd : rowData.crtrCd
        			, crtrVl : rowData.crtrVl
        			//, crtrIndctNm : mergeArray.find(item => item.cdVl === "VRTY")['cdVlNm']
        			, crtrIndctNm : crtrIndctNm.label
        			, indctSeq : parseInt(rowData.indctSeq)
        			, useYn : rowData.useYn
        			, status : status1
      				, gubun : rowData.gubun
        	};



			let statCrtrDtlList = grdStatCrtrDtlList.getGridDataAll();
			    statCrtrDtlList.forEach((item,sn) => {
			    	if(gfn_nvl(item["dtlVl"]) === ""){
			    		item["dtlVl"] = "0";
			    	}
					delete item.itemCd;
					item["apcCd"] = gv_selectedApcCd;
        			item["statCrtrType"] = rowData.statCrtrType;
        			item["crtrCd"] = rowData.crtrCd;
        			item["crtrVl"] = rowData.crtrVl;
					item["apcCd"] = gv_selectedApcCd;
					item["dtlIndctNm"] = item["dtlVl"];
					item["gubun"] = item.gubun;
				});

            let statDtlList = statCrtrDtlList.filter(x => x.status === "3" || x.status ==="2")



            let postJsonPromise = gfn_postJSON("/am/stat/insertStatCrtrInfoList.do",[statCrtr,statDtlList]);

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
			if (!gfn_comConfirm("Q0001", "통계기준목록 삭제")) {	//	Q0001	{0} 하시겠습니까?
		    	return;
		    }

	    	let rowData = grd.getRowData(index);
			if(rowData === undefined){
				return;
			}

	        try{

	        	let statCrtr = {
	        			apcCd : gv_apcCd
	        			, statCrtrType : rowData.statCrtrType
	        			, crtrCd : rowData.crtrCd
	        	};



				/*let statCrtrDtlList = grdStatCrtrDtlList.getGridDataAll();
				    statCrtrDtlList.forEach((item,sn) => {
						delete item.itemCd;
						item["apcCd"] = gv_selectedApcCd;
						Object.assign(item,statCrtr);
						item["status"] = grdStatCrtrDtlList.getRowStatus(sn+1).toString();
						item["dtlIndctNm"] = item["dtlVl"];

					}); */


	            //let statDtlList = statCrtrDtlList.filter(x => x.delYn==="N");

	            let postJsonPromise = gfn_postJSON("/am/stat/deleteStatMngInfo.do",statCrtr);

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
	 	 * @name fn_clearPrdcr
	 	 * @description 생산자 폼 clear
	 	 */
	 	const fn_clearPrdcr = function() {
	 		SBUxMethod.set("srch-inp-prdcrCd", "");
	 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
	 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	 	}

		/**
		 * @name fn_choicePrdcr
		 * @description 생산자 선택 popup 호출
		 */
	    const fn_choicePrdcr = function() {
	    	let row = grdStatCrtrDtlList.getRow()
			let rowData = grdStatCrtrDtlList.getRowData(row);
	    	if(gfn_nvl(rowData.dtlVl ) === ""){
	    		SBUxMethod.set("srch-inp-prdcrNm","")
	    	}else{
	    		let prdcr = jsonPrdcr.find(item => item.prdcrCd === String(rowData.dtlVl).padStart(4, '0'));
	    		SBUxMethod.set("srch-inp-prdcrNm",prdcr.prdcrNm)
	    	}

			popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
			SBUxMethod.openModal("modal-prdcr");
		}

		/**
		 * @name fn_setPrdcr
		 * @description 생산자 선택 popup callback 처리
		 */
		const fn_setPrdcr = async function(prdcr) {

			await fn_getPrdcrs();

			if (!gfn_isEmpty(prdcr)) {
				SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
				SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
				SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

				fn_setPrdcrForm(prdcr);

				let row = grdStatCrtrDtlList.getRow()
				let rowData = grdStatCrtrDtlList.getRowData(row);
				if(rowData.dtlCd === 'PRDCR'){
					rowData['dtlVl'] = prdcr.prdcrCd;
				}

				grdStatCrtrDtlList.setRowData(row,rowData,true);


			}
		}

		/**
		 * @name fn_getPrdcrs
	     * @description 생산자 자동완성 JSON 설정
		 */
		const fn_getPrdcrs = async function() {
			jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
			jsonPrdcr = gfn_setFrst(jsonPrdcr);
		}

		const fn_setPrdcrForm = async function(prdcr) {

			if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
				SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
			} else {
				SBUxMethod.set("srch-inp-prdcrIdentno", "");
			}

		}



		const fn_setTrsprtCst = function(trsprtCst) {

		}

		const fn_onChangeSrchPrdcrIdentno = function(obj) {

			if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
				return;
			}


			const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});


			SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcrInfo);

		}


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>