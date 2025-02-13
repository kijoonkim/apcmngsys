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
  * @ 2024.10.23   				최초 생성
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
						class="btn btn-sm btn-success btn-outline-danger"
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
											uitype="popup"
											id="srch-dtp-crtrYmd"
											name="srch-dtp-crtrYmd"
											date-format="yyyy-mm-dd"
											wrap-style="width:80%"
											class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
									</sbux-datepicker>
							</td>
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
							<td  class="td_input" style="border-right: hidden;">
								<sbux-select
										uitype="single"
										id="srch-slt-vrtyCd"
										name="srch-slt-vrtyCd"
										class="form-control input-sm input-sm-ast"
										unselected-text="전체"
										jsondata-ref="jsonComVrty"
										jsondata-value="itemVrtyCd"
										onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
							</td>
							<td colspan="1" style="border-top: hidden"></td>

							<th scope="row" class="th_bg">상품명</th>
							<td colspan="3" class="td_input">
								<sbux-input
										id="dtl-inp-gdsNm"
										name="dtl-inp-gdsNm"
										uitype="text"
										style="max-width:80%;"
										class="form-control input-sm">
								</sbux-input>
							</td>

						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="display: flex; flex-direction: row; height: 40vh; gap: 10px">
					<div style="flex: 8">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>매출 단가 목록</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSlsUntprcList" style="height:544px;"></div>
					</div>
					<div style="flex: 4">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>단가 상세</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSlsUntprcDtlList" style="height:544px;"></div>
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

	var jsonCrtrCd = [];
    
    //매출 단가
    var grdSlsUntprcList;
    var jsonSlsUntprcList = [];

	//단가 상세
	var grdSlsUntprcDtlList;
	var jsonUntprcDtlList = [];

  	//품목
	var jsonComItem = [];
	//품종
	var jsonComVrty = [];
	//규격
	var jsonApcSpcfct = [];
	//출하포장단위
	var jsonSpmtPckgUnit = [];

	const fn_initSBSelect = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonComItem = await gfn_getApcItem(gv_selectedApcCd);
		jsonComVrty = await gfn_getApcVrty(gv_selectedApcCd);
		jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd);

		gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd); // 품목
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd); // 품종



	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		SBUxMethod.set("srch-dtp-crtrYmd",gfn_dateToYmd(new Date())); //현재날짜
	});

	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_createSlsUntprcList();
		await fn_createSlsUntprcDtlList();
		await fn_search();
	}


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
            {caption: ["품목"], 		 ref: 'itemNm',	 	  	type:'output', 	width:'20%', style:'text-align:center'},
			{caption: ["품종"],		 ref: 'vrtyNm', 	type:'output',  width:'20%', style:'text-align:center'},
            {caption: ["규격"], 		 ref: 'spcfctNm',	type:'output',  width:'20%', style:'text-align:center'},
            {caption: ["상품명"], 	 ref: 'spmtPckgUnitNm',	type:'output',  width:'20%', style:'text-align:center'},
            {caption: ["단가"],	 	 ref: 'ntslUntprc',		type:'output',	typeinfo : {mask : {alias :'numeric'}, oneclickedit: true},format : {type:'number', rule:'#,###'}, width:'20%',   style:'text-align:center'},
        ];
        grdSlsUntprcList = _SBGrid.create(SBGridProperties);
		grdSlsUntprcList.bind("rowchanged","fn_searchDtl")
    }

	const fn_createSlsUntprcDtlList = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdSlsUntprcDtlList';
		SBGridProperties.id = 'grdSlsUntprcDtlList';
		SBGridProperties.jsonref = 'jsonUntprcDtlList';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.columns = [
			{caption: [""],	ref: 'delYn',		type:'output',  width:'10%', style: 'text-align:center;',
				renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					if (gfn_isEmpty(objRowData.delYn)){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
					} else {
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
					}
			}},
			{caption: ["적용기준일자"],	ref: 'aplcnCrtrYmd', type:'datepicker',format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},typeinfo : {oneclickedit: true},width:'25%',style:'text-align:center'},
			{caption: ["단가"], 		ref: 'spmtSlsUntprc',type:'input', typeinfo : {mask : {alias :'numeric'}, oneclickedit: true},format : {type:'number', rule:'#,###원'},width:'25%',style:'text-align:center'},
			{caption: ["비고"],		 	ref: 'rmrk', 		 type:'input', typeinfo :{oneclickedit: true}, width:'40%',	style:'text-align:center'},
		];
		grdSlsUntprcDtlList = _SBGrid.create(SBGridProperties);
	}




    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {
		let slsUntprcRow = grdSlsUntprcList.getRow();
		let slsUntprcData = grdSlsUntprcList.getRowData(slsUntprcRow);

    	const editableRow = grdSlsUntprcDtlList.getRowData(nRow, false);	// call by reference(deep copy)
		editableRow.delYn = "N";
		editableRow.gubun = "insert";
		editableRow.spmtPckgUnitCd = slsUntprcData.spmtPckgUnitCd;
		grdSlsUntprcDtlList.addRow(true);
		let mRow = nRow + 1;
		grdSlsUntprcDtlList.setCellDisabled(nRow,0,nRow,grdSlsUntprcDtlList.getCols() -1 ,false);
		grdSlsUntprcDtlList.setCellDisabled(mRow,0,mRow,grdSlsUntprcDtlList.getCols() -1 ,true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(nRow) {
		let rowData = grdSlsUntprcDtlList.getRowData(nRow);
		if(!gfn_isEmpty(rowData.apcCd)){
			if(!gfn_comConfirm("Q0001","등록된 목록입니다. 삭제")){
				return;
			}
		}else{
			grdSlsUntprcDtlList.deleteRow(nRow);
			return;
		}

		let postJsonPromise = gfn_postJSON("/am/spmt/deleteSlsUntprc.do",rowData);
		let data = await postJsonPromise;

		if (!_.isEqual("S", data.resultStatus)) {
			gfn_comAlert(data.resultCode, data.resultMessage);
			return;
		}
		gfn_comAlert("I0001");
		await fn_search();
    }


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		jsonSlsUntprcList.length = 0;
		grdSlsUntprcList.rebuild();
		jsonUntprcDtlList.length = 0;
		grdSlsUntprcDtlList.rebuild();

    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let aplcnCrtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let gdsNm = SBUxMethod.get("dtl-inp-gdsNm");
		if(!gfn_isEmpty(vrtyCd)){
			vrtyCd = vrtyCd.substring(4,8);
		}
  		try {
			const postJsonPromise = gfn_postJSON("/am/spmt/selectSlsUntprc.do", {
				apcCd: gv_selectedApcCd,
				aplcnCrtrYmd : aplcnCrtrYmd,
				itemCd : itemCd,
				vrtyCd : vrtyCd,
				gdsNm : gdsNm,
			});

			const data = await postJsonPromise;

 			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
 			 }

			 if(data.resultList.length > 0){

				 let resultList = data.resultList;
				 console.log(resultList);
				 let newAdd = [];
				 for(let i = 0; i < resultList.length; i++){
					 let isExist = false;
					 for(let j = 0; j<newAdd.length; j++){
						 if(resultList[i].itemCd === newAdd[j].itemCd &&
						 	resultList[i].vrtyCd === newAdd[j].vrtyCd &&
						 	resultList[i].spcfctCd === newAdd[j].spcfctCd &&
						 	resultList[i].spmtPckgUnitNm === newAdd[j].spmtPckgUnitNm &&
						 	resultList[i].ntslUntprc === newAdd[j].ntslUntprc){
							 isExist = true;
							 break;
						 }
					 }
					 if (!isExist) {
						 newAdd.push(resultList[i]);
					 }
				 }

				 /*
				 // 그룹화 로직
				 const groupedData = data.resultList.reduce((acc, curr) => {
					 // 그룹 키 생성
					 const key = `${curr.apcCd}-${curr.spmtPckgUnitCd}-${curr.itemCd}-${curr.vrtyCd}-${curr.spcfctCd}`;

					 // 그룹 데이터가 이미 존재하지 않으면 추가
					 if (!acc[key]) {
						 acc[key] = {
							 apcCd: curr.apcCd,
							 spmtPckgUnitNm: curr.spmtPckgUnitNm,
							 itemNm: curr.itemNm,
							 vrtyNm: curr.vrtyNm,
							 spcfctNm: curr.spcfctNm,
							 ntslUntprc : curr.ntslUntprc,
							 spmtPckgUnitCd: curr.spmtPckgUnitCd,
							 aplcnCrtrYmd : curr.aplcnCrtrYmd,
							 itemCd : curr.itemCd,
							 vrtyCd : curr.vrtyCd,
							 spcfctCd : curr.spcfctCd
						 };
					 }
					 return acc;
				 }, {});

				// 결과를 배열 형태로 변환
				 const result = Object.values(groupedData);
				 */

				 //jsonSlsUntprcList = result;
				 jsonSlsUntprcList = newAdd;
				 grdSlsUntprcList.rebuild();

				 grdSlsUntprcList.setRow(1);//focus 지정
				 await fn_searchDtl();
			 }

  		}
 		catch (e) {
 	           console.log(e);
 	    }
	}

	const fn_searchDtl = async function(){
		jsonUntprcDtlList.length = 0;
		grdSlsUntprcDtlList.rebuild();

		let aplcnCrtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");

		let nRow = grdSlsUntprcList.getRow();
		let rowData = grdSlsUntprcList.getRowData(nRow,false);
		rowData.aplcnCrtrYmd = aplcnCrtrYmd;
		console.log("클릭할 때 ",rowData);

		if(gfn_isEmpty(rowData)){
			return;
		}

		try{
			let postJsonPromise = gfn_postJSON("/am/spmt/selectSlsUntprcDtl.do",rowData);
			const data = await postJsonPromise;
			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}
			if(data.resultList.length > 0){
				jsonUntprcDtlList = data.resultList;
				grdSlsUntprcDtlList.rebuild();

			}
			let nRow = grdSlsUntprcDtlList.getRows();
			grdSlsUntprcDtlList.addRow(true);
			grdSlsUntprcDtlList.setCellDisabled(nRow, 0, nRow, grdSlsUntprcDtlList.getCols() -1, true);


		}catch (e) {
			console.log(e);
		}
	}




    const fn_save = async function(){
		let allData = grdSlsUntprcDtlList.getGridDataAll();

		if(!gfn_comConfirm("Q0001", "저장")) {    // 저장 하시겠습니까?
			return;
		}

        try{
			let saveList = [];
			for(let i = 0; i < allData.length; i++){
				let isExist = false;
				for(let j=0; j<saveList.length; j++){
					if(allData[i].aplcnCrtrYmd === saveList[j].aplcnCrtrYmd){
						isExist = true;
						break;
					}
				}
				if(!isExist){
					saveList.push(allData[i]);
				}else{
					gfn_comAlert("W0009","적용기준일자") //W0009 {0} 이/가 있습니다.
					return;
				}
			}
			saveList = saveList.filter(item=>{
				if(gfn_nvl(item.gubun) === ""){
					item.gubun = "update";
				}
				item.apcCd = gv_selectedApcCd;
				return item.delYn === 'N'
			})
            let postJsonPromise = gfn_postJSON("/am/spmt/updateSlsUntprcReg.do",saveList);

			let data = await postJsonPromise;

			if(!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}
			gfn_comAlert("I0001"); //처리 되었습니다.
			await fn_search();
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