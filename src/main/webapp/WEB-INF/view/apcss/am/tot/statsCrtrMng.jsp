<%
 /**
  * @Class Name : statsCrtrMng.jsp
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
					<caption>검색조건설정</caption>
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
							<th scope="row"  style="border-right: hidden; text-align: left;">◆ 기간별 통계 기준</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg">기간</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-crtrType" name="srch-chk-crtrType" uitype="normal"  jsondata-ref="checkboxJsonData1"  group-id="group1"></sbux-checkbox>
							</td>
						</tr>

						<tr>
							<th scope="row"  style="border-right: hidden; text-align: left;">◆ 품목별 통계기준</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-wrhsQntt1"
									name="srch-slt-wrhsQntt1"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonWrhsQntt"
									 group-id="group1"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">평균단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-untPrc" name="srch-chk-untPrc" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
						</tr>

						<tr>
							<th scope="row"  style="border-right: hidden; text-align: left;">◆ 공급처별 통계기준</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-wrhsQntt2"
									name="srch-slt-wrhsQntt2"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonWrhsQntt"
									 group-id="group1"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">총비용</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-totPrc" name="srch-chk-totPrc" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
						</tr>
						<tr>
							<th scope="row"  style="border-right: hidden; text-align: left;">◆ 품질별 통계기준</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품질 등급별</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-qltGrd" name="srch-chk-qltGrd" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
							<th scope="row" class="th_bg">불량률</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-bad" name="srch-chk-bad" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
						</tr>
						<tr>
							<th scope="row"  style="border-right: hidden; text-align: left;">◆ 품목별 통계기준</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg">평균 재고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-avgInvtr" name="srch-chk-avgInvtr" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
							<th scope="row" class="th_bg">재고 회전율</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-invntrRttrt" name="srch-chk-invntrRttrt" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">최소 재고량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-minInvntr" name="srch-chk-minInvntr" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
							<th scope="row" class="th_bg">최대 재고량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-checkbox id="srch-chk-maxInvntr" name="srch-chk-maxInvntr" uitype="normal" text="표시 여부"  group-id="group1"></sbux-checkbox>
							</td>
						</tr>
					</tbody>
				</table>







			</div>
		</div>
	</section>

</body>
<script type="text/javascript">



	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-crtrType', 		jsonCrtrType, 'TOT_CRTR_TYPE_CD', gv_selectedApcCd),			// 선별기
		]);
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	//await fn_initSBSelect();

		//fn_search();
    }


	//기준유형
	var jsonCrtrType = [];

    // grid
    // 집계기준목록
    var grdTotCrtrList;
    var jsonTotCrtrList = [];

    // 집계기준상세정보
    var grdTotCrtrDtlList;
    var jsonTotCrtrDtlList= [];

    var checkboxJsonData1 = [
		{ text : "일별", truevalue : "day",     falsevalue: "N"},
		{ text : "주별", truevalue : "week",    falsevalue: "N"},
		{ text : "월별", truevalue : "month",     falsevalue: "N"},
		{ text : "분기별", truevalue : "quater",       falsevalue: "N"},
		{ text : "연도별", truevalue : "year",       falsevalue: "N"}
	];











	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

    	/* const postJsonPromise = gfn_postJSON("/am/tot/selectTotCrtr.do", {
			apcCd: gv_selectedApcCd,
			crtrType : ''
  		}); */

        //const data = await postJsonPromise;

  		try {
 			//if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonTotCrtrList.length = 0;
  	      	    jsonTotCrtrDtlList.length = 0;
  	          	/* data.resultList.forEach((item, index) => {
  	          		const totCrtrList = {

  	  				}
  	          		jsonTotCrtrList.push(totCrtrList);


  	  			}); */
  	  		let nRow = grdTotCrtrList.getRows();
  	  		let nRow2 = grdTotCrtrDtlList.getRows();
  	        grdTotCrtrList.addRow(true);
  	        grdTotCrtrList.setCellDisabled(nRow, 0, nRow, grdTotCrtrList.getCols() - 1, true);
  	        grdTotCrtrDtlList.addRow(true);
  	        grdTotCrtrDtlList.setCellDisabled(nRow2, 0, nRow2, grdTotCrtrDtlList.getCols() - 1, true);

  	          	if (jsonTotCrtrList.length > 0) {

  	          	} else {
  	          		grdTotCrtrList.rebuild();
  	          	}
 			 //}
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
        			apcCd : gv_apcCd
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
					Object.assign(item,totCrtr);
					item["dtlIndctNm"] = item["dtlVl"];

				});


            let totDtlList = totCrtrDtlList.filter(x => x.delYn==="N");

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



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>