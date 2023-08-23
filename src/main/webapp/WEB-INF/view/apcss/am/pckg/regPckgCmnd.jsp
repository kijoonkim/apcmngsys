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
					<h3 class="box-title">▶ 포장지시등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장"class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" disabled/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm input-sm-ast inpt_data_reqed" jsondata-ref="jsonComVrty"></sbux-select>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm input-sm-ast inpt_data_reqed" jsondata-ref="jsonComSpcfct"></sbux-select>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>지시수량</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-cmndQntt" name="srch-inp-cmndQntt" class="form-control input-sm input-sm-ast inpt_data_reqed"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산설비</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-fclt" name="srch-slt-fclt" class="form-control input-sm input-sm-ast inpt_data_reqed" jsondata-ref="jsonComFclt"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
						    <td colspan="3" class="td_input" style="border-right:hidden ;">
						    	<sbux-input uitype="hidden" id="srch-inp-cnptCd" name="srch-inp-cnptCd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
						    	<sbux-input uitype="text" id="srch-inp-cnptNm" name="srch-inp-cnptNm" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
							<td class="td_input">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"/>
						    </td>
<!-- 						    <td colspan="2">&nbsp;</td> -->
						</tr>
						<tr>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-datepicker uitype="popup" id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row"  class="th_bg"style="border-right:hidden ;">상품명</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-gdsNm" name="srch-inp-gdsNm" class="form-control input-sm" disabled/>
							</td>
							<td >&nbsp;</td>
							<th scope="row"  class="th_bg"style="border-right:hidden ;">발주수량/입수</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-outordrQntt" name="srch-inp-outordrQntt" class="form-control input-sm" disabled/>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-bxGdsQntt" name="srch-inp-bxGdsQntt" class="form-control input-sm" disabled/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">발주번호</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-gdsNo" name="srch-inp-gdsNo" class="form-control input-sm" disabled/>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>생산지시 내역</span></li>
						</ul>
					</div>
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea" style="height:457px;"></div>
						</div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem				= [];	// 품목 		itemCd		검색
	var jsonComVrty				= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct			= [];	// 규격 		spcfcCd		검색
	var jsonComFclt				= [];	// 설비 			fcltCd		검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-fclt', 			jsonComFclt, 			'FCLT_CD', gv_selectedApcCd);			// 설비
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, gv_selectedApcCd);	// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd);			// 품종
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, gv_selectedApcCd, itemCd);		// 규격

		console.log("jsonComSpcfct", jsonComSpcfct);
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();


		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-cmndYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
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
		  	'size' : 15,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
            {caption: ["선택"], ref: 'checked', type: 'checkbox', width : '60px', style: 'text-align:center'},
	        {caption: ["지시번호"],		ref: 'pckgCmndno',      type:'output',  width:'180px',    style:'text-align:center'},
	        {caption: ["생산설비"],		ref: 'fcltNm',      type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["납기일자"],		ref: 'dudtYmd',      type:'output',  width:'160px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["규격"],		ref: 'spcfctNm',      type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["상품명"],		ref: 'gdsNm',      type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["발주수량"],		ref: 'ordrQntt',      type:'output',  width:'150px',    style:'text-align:right'},
	        {caption: ["입수"],		ref: 'bxGdsQntt',      type:'output',  width:'150px',    style:'text-align:right'},
	        {caption: ["지시수량"],		ref: 'cmndQntt',      type:'output',  width:'150px',    style:'text-align:right'},
	        {caption: ["지시중량"],		ref: 'cmndWght',      type:'output',  width:'150px',    style:'text-align:right'},
	        {caption: ["순번"],  			ref: 'pckgCmndSn',    hidden:true},
	    ];

	    pckgCmndList = _SBGrid.create(SBGridProperties);
	    pckgCmndList.bind( "afterpagechanged" , "fn_pagingPckgCmndList" );
// 	    fn_setGrdPckgCmnd();
	    fn_search();
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

		let pckgCmndYmd  = SBUxMethod.get("srch-dtp-cmndYmd"); //포장지시일자

    	const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgCmndList.do", {
			apcCd: gv_selectedApcCd,
			pckgCmndYmd: pckgCmndYmd,
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
	const fn_reset = async function(){
	
	}
	const fn_save = async function(){
		try{
			console.log("jsonComSpcfct", jsonComSpcfct);
			console.log("srch-slt-spcfctCd", SBUxMethod.get("srch-slt-spcfctCd"));
			spcfctData = await gfn_getApcSpcfcts(gv_selectedApcCd, SBUxMethod.get("srch-slt-itemCd"));
			console.log("spcfctData", spcfctData);
			var find = spcfctData.find(e => e.spcfctCd == SBUxMethod.get("srch-slt-spcfctCd"))
			console.log("find", find);
			console.log("find.wght", find.wght);
			console.log("find.wght", spcfctData.find(e => e.spcfctCd == SBUxMethod.get("srch-slt-spcfctCd")).wght);
			
			
 		   if (gfn_isEmpty(SBUxMethod.get("srch-dtp-cmndYmd")))
				throw "지시일자는 필수입력 항목입니다.";
 		   if (gfn_isEmpty(SBUxMethod.get("srch-slt-itemCd")) || gfn_isEmpty(SBUxMethod.get("srch-slt-vrtyCd")))
				throw "품목/품종은 필수입력 항목입니다.";
 		   if (gfn_isEmpty(SBUxMethod.get("srch-slt-vrtyCd")))
				throw "규격은 필수입력 항목입니다.";
 		   if (gfn_isEmpty(SBUxMethod.get("srch-inp-cmndQntt")))
				throw "지시수량은 필수입력 항목입니다.";
 		   if (gfn_isEmpty(SBUxMethod.get("srch-slt-fclt")))
				throw "생산설비는 필수입력 항목입니다.";
 		   if (gfn_isEmpty(SBUxMethod.get("srch-inp-cnptNm")))
				throw "거래처는 필수입력 항목입니다.";
	 		   
			let pckgCmndYmd  = SBUxMethod.get("srch-dtp-cmndYmd"); //포장지시일자
			let itemCd  = SBUxMethod.get("srch-slt-itemCd"); //품목코드
			let vrtyCd  = SBUxMethod.get("srch-slt-vrtyCd"); //품종코드
			let spcfctCd  = SBUxMethod.get("srch-slt-spcfctCd"); //규격코드
			let cmndQntt  = SBUxMethod.get("srch-inp-cmndQntt"); //지시수량
			spcfctData = await gfn_getApcSpcfcts(gv_selectedApcCd, itemCd);
			let cmndWght = cmndQntt * spcfctData.find(e => e.spcfctCd == SBUxMethod.get("srch-slt-spcfctCd")).wght//지시 중량 = 지시 수량 * 규격의 단중
			let fcltCd  = SBUxMethod.get("srch-slt-fclt"); //설비코드
			let cnptCd  = SBUxMethod.get("srch-inp-cnptCd"); //거래처코드
			let cnptNm  = SBUxMethod.get("srch-inp-cnptNm"); //거래처명
			
			let dudtYmd  = SBUxMethod.get("srch-dtp-dudtYmd"); //납기일자
	// 		let gdsCd  = SBUxMethod.get(""); //상품코드
			let gdsNm  = SBUxMethod.get("srch-inp-gdsNm"); //상품명
			let ordrQntt  = SBUxMethod.get("srch-inp-outordrQntt"); //발주수량
			let bxGdsQntt  = SBUxMethod.get("srch-inp-bxGdsQntt"); //입수
			let ordrNo  = SBUxMethod.get("srch-inp-gdsNo"); //발주번호
			
			const postJsonPromise = gfn_postJSON("/am/pckg/insertPckgCmnd.do", {
				apcCd: gv_selectedApcCd,
				pckgCmndYmd: pckgCmndYmd,
				itemCd: itemCd,
				vrtyCd: vrtyCd,
				spcfctCd: spcfctCd,
				cmndQntt: cmndQntt,
				cmndWght: cmndWght,
				fcltCd: fcltCd,
				cnptCd: cnptCd,
				cnptNm: cnptNm,
				dudtYmd: dudtYmd,
	// 			gdsCd: gdsCd,
				gdsNm: gdsNm,
				ordrQntt: ordrQntt,
				bxGdsQntt: bxGdsQntt,
				ordrNo: ordrNo,
				delYn: 'Y'
				});
			
		    const data = await postJsonPromise;
		    
		    fn_search();
		}catch(e){
			   alert(e);
			   return;
		}
	}
	
	const fn_delete = async function(){
		
	   	var grdRows = pckgCmndList.getCheckedRows(0);
    	var deleteList = [];
    	
    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		deleteList.push(pckgCmndList.getRowData(nRow));
    	}
    	

    	var delMsg = "삭제 하시겠습니까?";
		if(confirm(delMsg)){
			const postJsonPromise = gfn_postJSON("/am/pckg/deletePckgCmndList.do", deleteList);
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
	
	
 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}
 	
 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			console.log("cnpt", cnpt);
 			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
 			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
 		}
 	}

</script>
</html>