<%
 /**
  * @Class Name : purSalPrfmncInfo.jsp
  * @Description : 매출실적정보
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
	<title>title : 매출실적정보</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 매출실적정보 -->
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
						id="btnDel"
						name="btnDel"
						uitype="normal"
						text="삭제"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_delete"
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
							<th scope="row" class="th_bg">매출일자</th>
								<td colspan="4" class="td_input" style="border-right: hidden;">
									<div style="display:flex">
									<sbux-datepicker
										uitype="range"
										id="srch-dtp-purSalYmd"
										name="srch-dtp-purSalYmd"
										wrap-style="display:flex"
										date-format="yyyy-mm-dd"
										class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
									</div>
								</td>
							<th scope="row" class="th_bg">품목/품종</th>
								<td colspan="4" class="td_input" style="border-right: hidden;">
									<div style="display:flex">
										<div>
											<sbux-select
												unselected-text="전체"
												uitype="single"
												id="srch-slt-itemCd"
												name="srch-slt-itemCd"
												class="form-control input-sm input-sm-ast"
												jsondata-ref="jsonApcItem"
												onchange="fn_onChangeSrchItemCd(this)">
											</sbux-select>
										</div>
										<div>
											<sbux-select
												unselected-text="선택"
												uitype="single"
												id="srch-slt-vrtyCd"
												name="srch-slt-vrtyCd"
												class="form-control input-sm input-sm-ast inpt_data_reqed"
												jsondata-ref="jsonApcVrty"
												jsondata-value="itemVrtyCd"
												onchange="fn_onChangeSrchVrtyCd(this)">
											</sbux-select>
										</div>
									</div>
									
								</td>
								<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
							<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									style="max-width:80%;"
																	
								></sbux-input>
							</td>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th scope="row" class="th_bg">상세구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-dtlCd"
									name="srch-slt-dtlCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonDtlSe"
									style="max-width:80%;"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg">조회구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-searchSe"
									name="srch-slt-searchSe"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonSearchSe"
									style="max-width:80%;"
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
									<span>매출 실적 목록</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSlsPrfmncList" style="height:50vh;"></div>

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
	//매출실적 
	var jsonSlsPrfmnc = [];
	var grdSlsPrfmncList = [];
	var jsonSlsPrfmncLsit = [];
	
	//품목
	var jsonApcItem = [];
	//품종
	var jsonComVrty = [];
	
	//생산자
	var jsonDataPrdcr = [];
    var jsonPrdcr = [];
    
	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색



	const fn_initSBSelect = async function() {
		
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);

		jsonCrtrCd = await gfn_getComCdDtls('SLS_CRTR_CD');

		await gfn_setComCdSBSelect('srch-slt-crtrType', jsonCrtrCd, 'SLS_CRTR_CD');
		
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyNm', jsonComVrty, gv_selectedApcCd),	// 품종
		]);

		fn_getPrdcrs();
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    	$(".sbux-pik-wrap").css("display","flex");
    });

    const fn_init = async function() {
    	await fn_initSBSelect();
    	
    	SBUxMethod.set("srch-slt-itemCd", ""); // 품목
		SBUxMethod.set("srch-slt-vrtyNm", ""); // 품종
		
		fn_createSlsPrfmnclist();
		fn_search();
    }



    const fn_createSlsPrfmnclist = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSlsPrfmncList';
	    SBGridProperties.id = 'grdSlsPrfmncList';
	    SBGridProperties.jsonref = 'jsonSlsPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	{
        		caption: [""], 	ref: 'checkedYn', 	type:'checkbox', width:'3%',	style:'text-align:center',
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
            {caption: ["품목"],  ref :'itemCd',  type: 'combo', width:'9.7%',typeinfo : {ref :'jsonApcItem', label : 'itemNm',value :'itemCd'}, style:'text-align:center'},
            {caption: ["품종"],  ref: 'vrtyCd',  type:'combo', typeinfo : {ref:'jsonComVrty', label:'vrtyNm', value:'vrtyCd', filtering: {usemode: true, uppercol: 'itemNm', attrname: 'itemCd'}},width:'9.7%',  style:'text-align:center'},
            {caption: ["생산자"], ref: '?',       type:'input', width:'9.7%',  style:'text-align:center'},
            {caption: ["상세구분"],ref: '?',	   type:'input', width:'9.7%',  style:'text-align:center'},
            {caption: ["매출번호"],ref: 'slsSn',   type:'input', width:'9.7%',  style:'text-align:center'},
            {caption: ["수량"],  ref: 'qntt',    type:'input',width:'9.7%',  style:'text-align:center'},
            {caption: ["중량"],  ref: 'wght',    type:'input',width:'9.7%',  style:'text-align:center'},
            {caption: ["상세코드"],ref: '?',       type:'input',width:'9.7%',  style:'text-align:center'},
            {caption: ["매출금액"],ref: 'rkngAmt', type:'input',width:'9.7%',  style:'text-align:center'},
            {caption: ["확정금액"],ref: 'cfmtnAmt',type:'input',width:'9.7%',  style:'text-align:center'},
			{caption: ["삭제여부"],ref: 'delYn', type:'output',hidden : true}
						
        ];
        grdSlsPrfmncList = _SBGrid.create(SBGridProperties);
    }

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	let getpurSalYmd= SBUxMethod.get("srch-dtp-purSalYmd");
    	let getItemCd = SBUxMethod.get("srch-slt-itemCd");
    	
    	
    	let purSalYmdFrom;
    	let purSalYmdTo;
    	
    	if(getpurSalYmd === undefined){
    		return;
    	}

    	getpurSalYmd.forEach((item,index) =>{
    		if(index === 0 ){
    			purSalYmdFrom = item;
    		}else if(index === 1){
    			purSalYmdTo = item;
    		}
    	})
    	
    	const postJsonPromise = gfn_postJSON("/am/spmt/selectSlsPrfmnc.do", {
			apcCd: gv_selectedApcCd,
			slsYmdFrom : purSalYmdFrom,
			slsYmdTo : purSalYmdTo,
			itemCd : getItemCd
  		});
        const data = await postJsonPromise;       
  		try {
 			if (_.isEqual("S", data.resultStatus)) {
 				jsonSlsPrfmnc = data.resultList;
          		grdSlsPrfmncList.rebuild();
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
    	let rowData = grdSlsPrfmncList.getRowData(grdSlsPrfmncList.getRow());
    	let status1 = grdSlsPrfmncList.getRowStatus(grdSlsPrfmncList.getRow());
    	
    	
		if(rowData === undefined){
			return;
		}
		
		let getpurSalYmd= SBUxMethod.get("srch-dtp-purSalYmd");
    	
    	let purSalYmdFrom;
    	let purSalYmdTo;

    	getpurSalYmd.forEach((item,index) =>{
    		if(index === 0 ){
    			purSalYmdFrom = item;
    		}else if(index === 1){
    			purSalYmdTo = item;
    		}
    	})
    	
		let allData = grdSlsPrfmncList.getGridDataAll();		
		var slsPrfmncList = [];
						
        try{
			
			allData.forEach((item, index)=>{								
					slsPrfmncList.push({
						apcCd : gv_selectedApcCd
						, slsSn : item.slsSn
						, slsYmdFrom : purSalYmdFrom
						, slsYmdTo : purSalYmdTo
						, itemCd : item.itemCd
	        			, vrtyCd : item.vrtyCd
	        			, qntt : item.qntt
	        			, wght : item.wght
	        			, rkngAmt : item.rkngAmt
	        			, cfmtnAmt : item.cfmtnAmt
					});
			});

			
            let postJsonPromise = gfn_postJSON("/am/spmt/updateSlsPrfmnc.do",slsPrfmncList);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    //fn_reset();
                    fn_search();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }



	 const fn_delete = async function(){
		 
		 
			// comConfirm
			if (!gfn_comConfirm("Q0001", "매출실적목록 삭제")) {	//	Q0001	{0} 하시겠습니까?
		    	return;
		    }

			let allData = grdSlsPrfmncList.getGridDataAll();
			//let getCheckYn = allData.filter(item => item.checkedYn === "Y");
			//let allData = grdSlsPrfmncList.getGridDataAll.filter((item)=>item.checkYn === "Y");
			
			let getpurSalYmd= SBUxMethod.get("srch-dtp-purSalYmd");
    	
	    	let purSalYmdFrom;
	    	let purSalYmdTo;
	
	    	getpurSalYmd.forEach((item,index) =>{
	    		if(index === 0 ){
	    			purSalYmdFrom = item;
	    		}else if(index === 1){
	    			purSalYmdTo = item;
	    		}
	    	})
			
			
			var slsPrfmncList = [];
			
			
			allData.forEach((item, index)=>{
				if(item.checkedYn === "Y"){					
					slsPrfmncList.push({
						apcCd : gv_selectedApcCd,
						slsSn : item.slsSn,
						slsYmdFrom : purSalYmdFrom,
						slsYmdTo : purSalYmdTo
					});
				}
			});
			
		
			console.log(slsPrfmncList);
			
			
			/*if(rowData === undefined){
				return;
			}*/

	        try{
	            const postJsonPromise = gfn_postJSON("/am/spmt/deleteSlsPrfmnc.do",slsPrfmncList);
	            
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
		 * @name fn_choicePrdcr
		 * @description 생산자 선택 popup 호출
		 */
	    const fn_choicePrdcr = function() {
	    	/* let row = grdTotCrtrDtlList.getRow()
			let rowData = grdTotCrtrDtlList.getRowData(row);
	    	if(gfn_nvl(rowData.dtlVl ) === ""){
	    		SBUxMethod.set("srch-inp-prdcrNm","")
	    	}else{
	    		let prdcr = jsonPrdcr.find(item => item.prdcrCd === String(rowData.dtlVl).padStart(4, '0'));
	    		SBUxMethod.set("srch-inp-prdcrNm",prdcr.prdcrNm)
	    	} */

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

				/* let row = grdTotCrtrDtlList.getRow()
				let rowData = grdTotCrtrDtlList.getRowData(row);
				if(rowData.dtlCd === 'PRDCR'){
					rowData['dtlVl'] = prdcr.prdcrCd;
				}

				grdTotCrtrDtlList.setRowData(row,rowData,true); */


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
		
		/**
		 * @name fn_onChangeSrchItemCd
		 * @description 품목 선택 변경 event
		 */
		const fn_onChangeSrchItemCd = async function(obj) {

			let itemCd = obj.value;
			const itemInfo = _.find(jsonApcItem, {value: itemCd});
			
			let result = await Promise.all([
				gfn_setApcVrtySBSelect('srch-slt-vrtyNm', jsonComVrty, gv_selectedApcCd, itemCd)
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
			SBUxMethod.set("srch-slt-vrtyNm", vrtyCd);
		}
		
		



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>