<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>

</head>
<body>

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 원물입고팔레트/박스관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>팔레트/박스 재고현황</span></li>
					</ul>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea" style="height:213px;"></div>
					</div>
				</div>
				<br>
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
						    <th scope="row" class="th_bg"><span class="data_required"></span>작업일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-cmndYmd" name="srch-inp-cmndYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>입출고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-wrhsSpmtSe" name="srch-slt-wrhsSpmtSe" uitype="single" jsondata-ref="jsonWrhsSpmtSe" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pltBxSe" name="srch-slt-pltBxSe" uitype="single" jsondata-ref="jsonPltBxSe" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" onchange="fn_selectPltBxSe()"></sbux-select>
							</td>
							<td colspan="2" class="td_input"  style="border-left: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>명칭</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pltBxNm" name="srch-slt-pltBxNm" uitype="single" jsondata-ref="jsonPltBxNm" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
						    <th scope="row" class="th_bg">생산자</th>
						    <td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button 
									id="btn-srch-prdcr" 
									name="btn-srch-prdcr" 
									class="btn btn-xs btn-outline-dark" 
									text="찾기" uitype="modal" 
									target-id="modal-prdcr" 
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-Qntt" name="srch-inp-Qntt" uitype="text" class="form-control input-sm" placeholder="" title="" onchange="fn_onChangeQntt(this)"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-Wght" name="srch-inp-Wght" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" placeholder="" title="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-left: hidden;">
									<sbux-label uitype="normal" id="lbl-kg" name="lbl-chc" text="Kg"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>입출 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSearch" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDel" name="btnSearch" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
					</div>
				</div>
				
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea2" style="height:233px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonWrhsSpmtSe = [];
	var jsonPltBxSe = [];
	var jsonPltBxNm = [];
	
	var jsonPrdcr				= [];	//생산자 목록
    var jsonPrdcrAutocomplete 	= [];	//생산자 자동완성
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-wrhsSpmtSe', jsonWrhsSpmtSe, 'WRHS_SPMT_SE'),			// 창고
			gfn_setComCdSBSelect('srch-slt-pltBxSe', jsonPltBxSe, 'PLT_BX_SE_CD'),			// 창고
		]);
	}
	
	const fn_selectPltBxSe = async function(){
		let pltBxSe = SBUxMethod.get("srch-slt-pltBxSe");
		gfn_setPltBxSBSelect("srch-slt-pltBxNm", jsonPltBxNm, gv_selectedApcCd, pltBxSe);
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
// 		SBUxMethod.set("srch-dtp-strtCrtrYmd", year+month+day);
// 		SBUxMethod.set("srch-dtp-endCrtrYmd", year+month+day);
		SBUxMethod.set("srch-inp-cmndYmd", year+month+day);

		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		fn_initSBSelect();
		fn_search();
		fn_getPrdcrs();
	});

	var pltBxMngList; // 그리드를 담기위한 객체 선언
	var jsonPltBxMngList = []; // 그리드의 참조 데이터 주소 선언


	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'pltBxMngList';
	    SBGridProperties.jsonref = 'jsonPltBxMngList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;

	    SBGridProperties.columns = [
	        {caption: ["구분","구분"],		ref: 'pltBxSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["명칭","명칭"],		ref: 'pltBxNm',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["대여업체","대여업체"],		ref: 'pltCnptNm',      type:'output',  width:'145px',    style:'text-align:center'},
	        {caption: ["단중","단중"],		ref: 'unitWght',      type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["전일재고","수량	"],		ref: 'bssInvntrQntt',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["전일재고","중량"],		ref: 'bssInvntrWght',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["입고","수량	"],		ref: 'wrhsQntt',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["입고","중량"],		ref: 'wrhsWght',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["출고","수량	"],		ref: 'spmtQntt',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["출고","중량"],		ref: 'spmtWght',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["현재고","수량"],		ref: 'invntrQntt',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["현재고","중량"],		ref: 'invntrWght',      type:'output',  width:'145px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},

	    ];

	    pltBxMngList = _SBGrid.create(SBGridProperties);

	}
	
	const fn_search = async function(){
		pltBxMngList.rebuild();
    	let pageSize = pltBxMngList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonPltBxMngList.length = 0;
    	pltBxMngList.clearStatus();
    	await fn_setPltBxMngList(pageSize, pageNo);
    	
		grdPltWrhsSpmt.rebuild();
    	pageSize = grdPltWrhsSpmt.getPageSize();
    	pageNo = 1;

    	// grid clear
    	jsonPltWrhsSpmt.length = 0;
    	grdPltWrhsSpmt.clearStatus();
    	await fn_setPltWrhsSpmtList(pageSize, pageNo);
	}
	
	const fn_setPltBxMngList = async function(pageSize, pageNo){    	
    	const postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxMngList.do", {
			apcCd: gv_selectedApcCd,
			
          	// pagination
  	  		pagingYn : 'N',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
		
        const data = await postJsonPromise;
		try{
         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonPltWrhsSpmt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
          				apcCd: item.apcCd,
          				pltBxSeCd: item.pltBxSeCd,
          				pltBxSeNm: item.pltBxSeNm,
          				pltBxCd: item.pltBxCd,
          				pltBxNm: item.pltBxNm,
          				unitWght: item.unitWght,
          				useYn: item.useYn,
          				delYn: item.delYn,
          				bssInvntrQntt: item.bssInvntrQntt,
          				bssInvntrWght: item.bssInvntrWght,
          				wrhsQntt: item.wrhsQntt,
          				wrhsWght: item.wrhsWght,
          				spmtQntt: item.spmtQntt,
          				spmtWght: item.spmtWght,
          				invntrQntt: item.invntrQntt,
          				invntrWght: item.invntrWght,
          				unitCd: item.unitCd,
          				rmrk: item.rmrk,
          				pltCnptNm: item.pltCnptNm
				}
      			jsonPltBxMngList.push(pckgCmnd);
	
				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
	
	      	if (jsonPltBxMngList.length > 0) {
	      		if(pltBxMngList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			pltBxMngList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			pltBxMngList.rebuild();
					}else{
						pltBxMngList.refresh();
					}
	      	} else {
	      		pltBxMngList.setPageTotalCount(totalRecordCount);
	      		pltBxMngList.rebuild();
	      	}
	      	document.querySelector('#listCount').innerText = totalRecordCount;
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }
	
	var grdPltWrhsSpmt; // 그리드를 담기위한 객체 선언
	var jsonPltWrhsSpmt = []; // 그리드의 참조 데이터 주소 선언

	var comboUesYnJsData = ['입고/출고']
	var comboUesYnJsData1 = ['팔레트/박스']
	var comboUesYnJsData2 = ['명칭']
	var comboUesYnJsData3 = ['생산자']

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea2';
	    SBGridProperties.id = 'grdPltWrhsSpmt';
	    SBGridProperties.jsonref = 'jsonPltWrhsSpmt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;

	    SBGridProperties.columns = [
	        {caption: ["선택"],		ref: 'checkbox',      type:'checkbox',  width:'70px',    style:'text-align:center'},
	        {caption: ["작업일자"],		ref: 'jobYmd',      type:'output',  width:'160px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["입출고구분"],		ref: 'wrhsSpmtSeNm',      type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["구분"],		ref: 'pltBxSeNm',      type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["명칭"],		ref: 'pltNm',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["대여업체"],		ref: 'pltCnptNm',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["단중"],		ref: 'unitWght',      type:'output',  width:'160px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["수량"],		ref: 'qntt',      type:'output',  width:'160px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["중량"],		ref: 'wght',      type:'output',  width:'160px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	    ];

	    grdPltWrhsSpmt = _SBGrid.create(SBGridProperties);

	}

	const fn_setPltWrhsSpmtList = async function(pageSize, pageNo){   
		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd");
    	const postJsonPromise = gfn_postJSON("/am/cmns/selectPltWrhsSpmtList.do", {
			apcCd: gv_selectedApcCd,
			jobYmd: cmndYmd,
			
          	// pagination
  	  		pagingYn : 'N',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
		
        const data = await postJsonPromise;
		try{
         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonPltWrhsSpmt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
          				apcCd: item.apcCd,
          				jobYmd: item.jobYmd,
          				wrhsSpmtSeCd: item.wrhsSpmtSeCd,
          				wrhsSpmtSeNm: item.wrhsSpmtSeNm,
          				pltBxSeCd: item.pltBxSeCd,
          				pltBxSeNm: item.pltBxSeNm,
          				pltBxCd: item.pltBxCd,
          				prdcrCd: item.prdcrCd,
          				prdcrNm: item.prdcrNm,
          				seqNo: item.seqNo,
          				pltNm: item.pltNm,
          				unitWght: item.unitWght,
          				qntt: item.qntt,
          				wght: item.wght,
          				rmrk: item.rmrk,
          				delYn: item.delYn,
          				pltCnptNm: item.pltCnptNm
				}
      			jsonPltWrhsSpmt.push(pckgCmnd);
	
				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	console.log("jsonPltWrhsSpmt", jsonPltWrhsSpmt);
	      	if (jsonPltWrhsSpmt.length > 0) {
	      		if(grdPltWrhsSpmt.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			grdPltWrhsSpmt.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			grdPltWrhsSpmt.rebuild();
					}else{
						grdPltWrhsSpmt.refresh();
					}
	      	} else {
	      		grdPltWrhsSpmt.setPageTotalCount(totalRecordCount);
	      		grdPltWrhsSpmt.rebuild();
	      	}
	      	document.querySelector('#listCount').innerText = totalRecordCount;
	      	
	      	
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }
	const fn_save = async function() {
		let apcCd = gv_selectedApcCd;
		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd");
		let wrhsSpmtSeCd = SBUxMethod.get("srch-slt-wrhsSpmtSe");
		let pltBxSeCd = SBUxMethod.get("srch-slt-pltBxSe");
		let pltBxCd = SBUxMethod.get("srch-slt-pltBxNm");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let qntt = SBUxMethod.get("srch-inp-Qntt");	
		let rmrk = SBUxMethod.get("srch-inp-rmrk");

    	
		if(gfn_isEmpty(cmndYmd)){
			gfn_comAlert("W0001", "지시일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(wrhsSpmtSeCd)){
			gfn_comAlert("W0001", "입출고구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(pltBxSeCd)){
			gfn_comAlert("W0001", "구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(pltBxCd)){
			gfn_comAlert("W0001", "명칭");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(qntt)){
			gfn_comAlert("W0001", "수량");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		
		let pltNm = jsonPltBxNm.find(e => e.value == pltBxCd).text;
		let pltBxs = await gfn_getPltBxs(gv_selectedApcCd, SBUxMethod.get("srch-slt-pltBxSe"));
		let unitWght = pltBxs.find(e => e.pltBxCd == pltBxCd).unitWght;
		
    	let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/cmns/insertPltWrhsSpmt.do", {
				apcCd: apcCd
				,jobYmd: cmndYmd
				,wrhsSpmtSeCd: wrhsSpmtSeCd
				,pltBxSeCd: pltBxSeCd
				,pltBxCd: pltBxCd
				,prdcrCd: prdcrCd
				,pltNm: pltNm
				,unitWght: unitWght
				,qntt: qntt
				,rmrk: rmrk
				,delYn: 'N'
				});
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.insertedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}
	
	const fn_del = async function(){
		let grdRows = grdPltWrhsSpmt.getCheckedRows(0);
    	let deleteList = [];


    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		deleteList.push(jsonPltWrhsSpmt[nRow-1]);
    	}
		console.log(deleteList);
    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/cmns/deletePltWrhsSpmtList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.deletedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}
	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	/**
	* @name fn_onKeyUpPrdcrNm
	* @description 생산자명 입력 시 event : autocomplete
	*/
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			SBUxMethod.set("srch-inp-prdcrCd", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}
	
	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		}
		else{
			SBUxMethod.set("srch-inp-prdcrCd", value);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 찾기 버튼 클릭
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}
	
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
	const fn_onChangeQntt = async function(obj) {
		let wrhsSpmtSeCd = SBUxMethod.get("srch-slt-wrhsSpmtSe");
		let pltBxSeCd = SBUxMethod.get("srch-slt-pltBxSe");
		let pltBxCd = SBUxMethod.get("srch-slt-pltBxNm");
		if(wrhsSpmtSeCd == '2'){
			let invntrQntt = jsonPltBxMngList.find(e => e.pltBxCd == pltBxCd && e.pltBxSeCd == pltBxSeCd).invntrQntt;
			if(invntrQntt < obj.value){
				await alert("현재고를 초과하여 수량을 입력할 수 없습니다. 현재고: "+invntrQntt);
				SBUxMethod.set("srch-inp-Qntt", 0);
				SBUxMethod.set("srch-inp-Wght", 0);
				return;
			}
		}
		let pltBxs = await gfn_getPltBxs(gv_selectedApcCd, SBUxMethod.get("srch-slt-pltBxSe"));
		let unitWght = pltBxs.find(e => e.pltBxCd == pltBxCd).unitWght;
		
		SBUxMethod.set("srch-inp-Wght", SBUxMethod.get("srch-inp-Qntt") * unitWght);
	}
	
	
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
</script>

</html>