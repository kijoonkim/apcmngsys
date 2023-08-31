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
					<h3 class="box-title">▶ 원물입고 팔레트/박스 관리</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_rawMtrWghPltBxMngSearch">조회</sbux-button>
				</div>
			</div>
			<div class="box-body">
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
							<th scope="row" class="th_bg">APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg">기준일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtCrtrYmd" name="srch-dtp-strtCrtrYmd" class="form-control pull-right input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCrtrYmd" name="srch-dtp-endCrtrYmd" class="form-control pull-right input-sm"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th class="ta_r th_bg">입/출고 구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-wrhsSpmtSe" name="srch-slt-wrhsSpmtSe" class="form-control input-sm" jsondata-ref="jsonComWrhsSpmtSe"></sbux-select>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>팔레트/박스 재고현황</span></li>
					</ul>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea" style="height:200px;"></div>
					</div>
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>입출 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea2" style="height:340px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">
	var jsonComMsgKnd 		= [];	// srch.select.comMsgKnd
	var jsonComWrhsSpmtSe	= [];	// 설비 fcltCd		검색
	
	var jsonWrhsSpmtSe	= [];	// 입출고구분 grdPltWrhsSpmt 그리드
	var jsonPltBxSe		= [];	// 팔레트/박스구분 grdPltWrhsSpmt 그리드
	var jsonPltNm		= [];	// 팔레트 명칭 grdPltWrhsSpmt 그리드
	var jsonPrdcr		= [];	// 생산자 grdPltWrhsSpmt 그리드


	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComwrhsSpmtSe, 		'WRHS_SPMT_SE', gv_apcCd);			// 설비
	}
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-strtCrtrYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endCrtrYmd", year+month+day);

		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
	});

	var pltBxMngList; // 그리드를 담기위한 객체 선언
	var jsonPltBxMngList = []; // 그리드의 참조 데이터 주소 선언

	window.jsonPltBxMngList =  [
		[],
	];
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
	        {caption: ["구분","구분"],		ref: 'msgKey',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["명칭","명칭"],		ref: 'msgKey',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["단중","단중"],		ref: 'msgKey',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["전일재고","수량	"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["전일재고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["입고","수량	"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["입고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["출고","수량	"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["출고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["현재고","수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["현재고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},

	    ];

	    pltBxMngList = _SBGrid.create(SBGridProperties);

	}
	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = ["test"]; // 그리드의 참조 데이터 주소 선언

	var comboUesYnJsData = ['입고/출고']
	var comboUesYnJsData1 = ['팔레트/박스']
	var comboUesYnJsData2 = ['명칭']
	var comboUesYnJsData3 = ['생산자']

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea2';
	    SBGridProperties.id = 'inptCmndDsctnList2';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList2';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;

	    SBGridProperties.columns = [
	        {caption: ["선택"],		ref: 'msgKey',      type:'checkbox',  width:'70px',    style:'text-align:center'},
	        {caption: ["작업일자"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["입출고구분"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
	        	typeinfo : {ref:'jsonWrhsSpmtSe', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["구분"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData1', label:'label', value:'value', displayui : true}},
	        {caption: ["명칭"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData2', label:'label', value:'value', displayui : true}},
	        {caption: ["단중"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["생산자"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData3', label:'label', value:'value', displayui : true}},
	        {caption: ["수량"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["중량"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'300px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'userStts', 	type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		return "<button type='button' class='btn btn-xs btn-outline-danger'>삭제</button>";

		    }},
	    ];

	    inptCmndDsctnList2 = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
// 	function fn_rawMtrWghPltBxMngSearch(){
    const fn_rawMtrWghPltBxMngSearch = async function() {
	   try{
		   if (gfn_isEmpty(SBUxMethod.get("srch-dtp-strtCrtrYmd")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-endCrtrYmd")))
				   throw "작업일자는 필수입력 항목입니다.";
		   
	        // set pagination
	    	pltBxMngList.rebuild();
	    	let pageSize = pltBxMngList.getPageSize();
	    	let pageNo = 1;
	
	    	// grid clear
	    	jsonPltBxMngList.length = 0;
	    	pltBxMngList.clearStatus();
	    	fn_setGrdRawMtrWghPltBxMng(pageSize, pageNo);
	   } catch(e){
		   alert(e);
		   return;
	   }
	}
    
    const fn_setGrdRawMtrWghPltBxMng = async function(pageSize, pageNo) {

  		console.log("vrtyCd", vrtyCd);
		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsPrfmncList.do", {
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

  		jsonPltBxMngList.length = 0;
      	data.resultList.forEach((item, index) => {
      		const pltBxMng = {
						apcCd: item.apcCd,
						apcNm: item.apcNm,
				}
				jsonPltBxMngList.push(pltBxMng);

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
</script>

</html>