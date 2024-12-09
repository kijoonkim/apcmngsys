<%
 /**
  * @Class Name : rawMtrWrhsPrfmncTot.jsp
  * @Description : 원물입고실적집계
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
	<title>title : 원물입고실적집계</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고실적집계 -->
				</div>
				<div style="margin-left: auto;">
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
							<th scope="row" class="th_bg">집계구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-totSeCd"
									name="srch-slt-totSeCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonTotSeCd"
									style="max-width:80%;"
									group-id="group1"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">기준일자</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
                                    id="dtl-dtp-crtrYmd"
                                    name="dtl-dtp-crtrYmd"
                                    uitype="popup"
                                    date-format="yyyy/mm/dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast"
									group-id="group1">
                               	</sbux-datepicker>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcItemCd"
									style="max-width:80%;"
									group-id="group1"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">품종</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcVrtyCd"
									style="max-width:80%;"
									group-id="group1"
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
									<span>자동집계등록현황</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdAutoTotRegSttn" style="height:30vh;"></div>

						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>원물입고실적</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdRawMtrWrhsPrfmnc" style="height:30vh;"></div>

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
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItemCd, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrtyCd, 	gv_apcCd)			// APC 품종(저장)
        ]);


	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
    	fn_createAutoTotRegSttn();
		fn_createRawMtrWrhsPrfmnc();
		//fn_search();
    }



	//집계구분
	var jsonTotSeCd = [];

	//품목
	var jsonApcItemCd = [];

	//품종
	var jsonApcVrtyCd = [];

    // grid
    // 자동집계 등록현황
    var grdAutoTotRegSttn;
    var jsonAutoTotRegSttn = [];

    // 원물입고실적
    var grdRawMtrWrhsPrfmnc;
    var jsonRawMtrWrhsPrfmnc= [];


    const fn_createAutoTotRegSttn = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdAutoTotRegSttn';
	    SBGridProperties.id = 'grdAutoTotRegSttn';
	    SBGridProperties.jsonref = 'jsonAutoTotRegSttn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	{caption: ["선택"],
        		ref: 'chk',
        		width:'5%',
        		style: 'text-align:center',
        		type : 'checkbox',
        		typeinfo : {checkedvalue : 'T', uncheckedvalue : 'F'}},

            {caption: ["설정명칭"],  ref: 'col1', type:'input', width:'10%',  style:'text-align:center'},
            {caption: ["기간별"],  ref: 'col2', type:'input', width:'10%',  style:'text-align:center'},
            {caption: ["사용공정"],  ref: 'col3', type:'input', width:'10%',  style:'text-align:center'},
            {caption: ["공급처"],  ref: 'col4', type:'input', width:'10%',  style:'text-align:center'},
            {caption: ["저장위치"],  ref: 'col5', type:'input', width:'10%',  style:'text-align:center'},
            {caption: ["설명"],  ref: 'col6', type:'input', width:'10%',  style:'text-align:center'}
        ];
        grdAutoTotRegSttn = _SBGrid.create(SBGridProperties);
        //grdTotCrtrList.bind('click', 'fn_grdTotCrtrClick');

    }

    const fn_createRawMtrWrhsPrfmnc = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhsPrfmnc';
	    SBGridProperties.id = 'grdRawMtrWrhsPrfmnc';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhsPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	{caption: ["구분"],  ref: 'col1', type:'input', width:'10%',  style:'text-align:center'},
        	{caption: ["품목"],  ref: 'col2', type:'input', width:'10%',  style:'text-align:center'},
        	{caption: ["품종"],  ref: 'col3', type:'input', width:'10%',  style:'text-align:center'},
        	{caption: ["공급처"],  ref: 'col4', type:'input', width:'10%',  style:'text-align:center'},
        	{caption: ["저장위치"],  ref: 'col5', type:'input', width:'10%',  style:'text-align:center'},
        	{caption: ["수량"],  ref: 'col6', type:'input', width:'10%',  style:'text-align:center'},
        	{caption: ["일자"],  ref: 'col7', type:'input', width:'10%',  style:'text-align:center'}
        ];
        grdRawMtrWrhsPrfmnc = _SBGrid.create(SBGridProperties);
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







</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>