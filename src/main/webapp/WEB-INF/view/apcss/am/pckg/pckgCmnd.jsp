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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="button" class="btn btn-sm btn-primary">포장지시서</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
							<th scope="row"  class="th_bg"style="border-right:hidden ;">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-startCmndDate" name="srch-dtp-strtCmndYmd" class="form-control pull-right input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCmndDate" name="srch-dtp-endCmndYmd" class="form-control pull-right input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">생산설비</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-fclt" name="srch-slt-fclt" class="form-control input-sm" jsondata-ref="jsonComFclt"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">거래처</th>
						    <td colspan="2"class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-cnptNm" name="srch-inp-cnptNm" class="form-control input-sm"></sbux-input>
								<sbux-input uitype="hidden" id="srch-inp-cnptCd" name="srch-inp-cnptCd" class="form-control input-sm"></sbux-input>
							</td>	
							<td class="td_input">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"/>
							</td>
						<tr>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-datepicker uitype="popup" id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonComSpcfct"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">발주번호</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-gdsNo" name="srch-inp-gdsNo" class="form-control input-sm"/>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>지시 내역</span></li>
					</ul>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea" style="height:462px;"></div>
					</div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct		= [];	// 규격 		spcfct		검색
	var jsonComFclt			= [];	// 설비 		fcltCd		검색
	
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	await gfn_setComCdSBSelect('srch-slt-fclt', 		jsonComFclt, 		'FCLT_CD', gv_selectedApcCd);			// 설비
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd);		// 품목
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_apcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, gv_apcCd, itemCd);		// 규격
	}
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-strtCmndYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endCmndYmd", year+month+day);

		fn_initSBSelect();
	});

	var pckgCmndList; // 그리드를 담기위한 객체 선언
	var jsonpckgCmndList = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'pckgCmndList';
	    SBGridProperties.jsonref = 'jsonpckgCmndList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 14,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
 	        {caption: ["순번","순번"],		ref: 'pckgCmndSn',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["지시번호","지시번호"],		ref: 'pckgCmndno',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산설비","생산설비"],		ref: 'fcltNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["거래처","거래처"],		ref: 'cnptNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'vrtyNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["규격","규격"],		ref: 'spcfctNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["납기일자","납기일자"],		ref: 'dudtYmd',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["상품명","상품명"],		ref: 'gdsNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["발주","수량"],		ref: 'ordrQntt',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["발주","중량"],		ref: 'ordrWght',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["지시","수량"],		ref: 'cmndQntt',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["지시","중량"],		ref: 'cmndWght',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["실적","수량"],		ref: 'pckgQntt',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["실적","중량"],		ref: 'pckgWght',      type:'output',  width:'100px',    style:'text-align:center'},
	    ];

	    pckgCmndList = _SBGrid.create(SBGridProperties);
	    pckgCmndList.bind( "afterpagechanged" , "fn_pagingPckgCmndList" );
	}

    async function fn_pagingPckgCmndList(){
    	let recordCountPerPage = pckgCmndList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = pckgCmndList.getSelectPageIndex(); 
    	fn_setGrdPckgCmnd(recordCountPerPage, currentPageNo);
    }

	const fn_search = async function(){
		pckgCmndList.rebuild();
    	let pageSize = pckgCmndList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonpckgCmndList.length = 0;
    	pckgCmndList.clearStatus();
    	await fn_setGrdPckgCmnd(pageSize, pageNo);

	}
	
	const fn_setGrdPckgCmnd = async function(pageSize, pageNo){

		let pckgCmndFromYmd  = SBUxMethod.get("srch-dtp-strtCmndYmd"); //포장지시 시작일자
		let pckgCmndToYmd  = SBUxMethod.get("srch-dtp-endCmndYmd"); //포장지시 종료일자
		let fcltCd  = SBUxMethod.get("srch-slt-fclt"); //설비코드
		let dudtYmd  = SBUxMethod.get("srch-dtp-dudtYmd"); //납기일자
		let itemCd  = SBUxMethod.get("srch-slt-itemCd"); //품목코드
		let vrtyCd  = SBUxMethod.get("srch-inp-vrtyCd"); //품종코드
		let spcfctCd  = SBUxMethod.get("srch-slt-spcfctCd"); //규격코드
		let ordrNo  = SBUxMethod.get("srch-inp-gdsNo"); //발주번호
		let cnptCd  = SBUxMethod.get("srch-inp-cnptCd");
    	const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgCmndList.do", {
			apcCd: gv_selectedApcCd,
			pckgCmndFromYmd: pckgCmndFromYmd,
			pckgCmndToYmd: pckgCmndToYmd,
			cnptCd: cnptCd,
			fcltCd: fcltCd,
			dudtYmd: dudtYmd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			ordrNo: ordrNo,
			
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
		
        const data = await postJsonPromise;
		try{
         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonpckgCmndList.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
      				apcCd: item.apcCd,
      				pckgCmndno: item.pckgCmndno,
      				pckgCmndSn: item.pckgCmndSn,
      				pckgCmndYmd: item.pckgCmndYmd,
      				fcltCd: item.fcltCd,
      				fcltNm: item.fcltNm,
      				cnptCd: item.cnptCd,
      				cnptNm: item.cnptNm,
      				dudtYmd: item.dudtYmd,
      				itemCd: item.itemCd,
      				vrtyCd: item.vrtyCd,
      				vrtyNm: item.vrtyNm,
      				spcfctCd: item.spcfctCd,
      				spcfctNm: item.spcfctNm,
      				ordrQntt: item.ordrQntt,
      				ordrWght: item.ordrWght,
      				bxGdsQntt: item.bxGdsQntt,
      				cmndQntt: item.cmndQntt,
      				cmndWght: item.cmndWght,
      				pckgQntt: item.pckgQntt,
      				pckgWght: item.pckgWght,
      				ordrNo: item.ordrNo,
      				gdsCd: item.gdsCd,
      				gdsNm: item.gdsNm,
      				rmrk: item.rmrk,
      				delYn: item.delYn
				}
      			jsonpckgCmndList.push(pckgCmnd);
	
				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
	
	      	if (jsonpckgCmndList.length > 0) {
	      		if(pckgCmndList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			pckgCmndList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			pckgCmndList.rebuild();
					}else{
						pckgCmndList.refresh();
					}
	      	} else {
	      		pckgCmndList.setPageTotalCount(totalRecordCount);
	      		pckgCmndList.rebuild();
	      	}
	      	document.querySelector('#listCount').innerText = totalRecordCount;
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
	
 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}
 	
 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
 			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
 		}
 	}
 	
    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}
    
     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}
     
</script>
</html>