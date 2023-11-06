<%
 /**
  * @Class Name : pckgCmnd.jsp
  * @Description : 포장지시조회 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 포장지시조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="normal" class="btn btn-sm btn-primary" text="포장지시서" onclick="fn_cmndDocPckg"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화"class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
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
							<th scope="row"  class="th_bg"style="border-right:hidden ;"><span class="data_required" ></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmdFrom" name="srch-dtp-cmndYmdFrom" class="form-control pull-right input-sm input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-cmndYmdFrom)"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmdTo" name="srch-dtp-cmndYmdTo" class="form-control pull-right input-sm input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-cmndYmdTo)"/>
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
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm"  readonly></sbux-input>
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
						<div id="sb-area-grdPckgCmnd" style="height:536px;"></div>
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
		let rst = await Promise.all([
			// 검색 SB select
		 	gfn_setComCdSBSelect('srch-slt-fclt', 			jsonComFclt,	'PCKG_FCLT_CD',		gv_selectedApcCd),	// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 	gv_selectedApcCd)						// 품목
		]);
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	"");
		} else {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	gv_selectedApcCd, itemCd);		// 규격
		}
	}
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createPckgCmndGrid();

		SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
	});
	
	const fn_dtpChange = function(){
		let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
		let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
		if(gfn_diffDate(cmndYmdFrom, cmndYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	var grdPckgCmnd; // 그리드를 담기위한 객체 선언
	var jsonPckgCmnd = []; // 그리드의 참조 데이터 주소 선언

	function fn_createPckgCmndGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgCmnd';
	    SBGridProperties.id = 'grdPckgCmnd';
	    SBGridProperties.jsonref = 'jsonPckgCmnd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 12,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	    	{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	    	},
	    	{caption: ["지시번호","지시번호"],	ref: 'pckgCmndno',  type:'output',  width:'120px',    style:'text-align:center'},
	    	{caption: ["순번","순번"],			ref: 'pckgCmndSn',	type:'output',  width:'40px',    style:'text-align:center'},
	        {caption: ["생산설비","생산설비"],	ref: 'fcltNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["거래처","거래처"],		ref: 'cnptNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["품종","품종"],			ref: 'vrtyNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["규격","규격"],			ref: 'spcfctNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["납기일자","납기일자"],	ref: 'dudtYmd',     type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["상품명","상품명"],		ref: 'gdsNm',      	type:'output',  width:'130px',    style:'text-align:center', hidden: true},
	        {caption: ["지시","수량"],			ref: 'cmndQntt',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["지시","중량"],			ref: 'cmndWght',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["실적","수량"],			ref: 'pckgQntt',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["실적","중량"],			ref: 'pckgWght',    type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["비고","비고"],			ref: 'rmrk',      	type:'output',  width:'250px',    style:'text-align:center'},
	    ];

	    grdPckgCmnd = _SBGrid.create(SBGridProperties);
	    grdPckgCmnd.bind( "afterpagechanged" , "fn_pagingPckgCmndList" );
	}

    async function fn_pagingPckgCmndList(){
    	let recordCountPerPage = grdPckgCmnd.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPckgCmnd.getSelectPageIndex();
    	fn_setGrdPckgCmnd(recordCountPerPage, currentPageNo);
    }

	const fn_search = async function(){
		grdPckgCmnd.rebuild();
    	let pageSize = grdPckgCmnd.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonPckgCmnd.length = 0;
    	grdPckgCmnd.clearStatus();
    	await fn_setGrdPckgCmnd(pageSize, pageNo);

	}

	const fn_setGrdPckgCmnd = async function(pageSize, pageNo){

		let pckgCmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom"); //포장지시 시작일자
		let pckgCmndYmdTo  	= SBUxMethod.get("srch-dtp-cmndYmdTo"); //포장지시 종료일자
		let fcltCd  		= SBUxMethod.get("srch-slt-fclt"); //설비코드
		let dudtYmd  		= SBUxMethod.get("srch-dtp-dudtYmd"); //납기일자
		let itemCd  		= SBUxMethod.get("srch-slt-itemCd"); //품목코드
		let vrtyCd  		= SBUxMethod.get("srch-inp-vrtyCd"); //품종코드
		let spcfctCd  		= SBUxMethod.get("srch-slt-spcfctCd"); //규격코드
		let ordrNo  		= SBUxMethod.get("srch-inp-gdsNo"); //발주번호
		let cnptCd  		= SBUxMethod.get("srch-inp-cnptCd");
    	const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgCmndList.do", {
			apcCd				: gv_selectedApcCd,
			pckgCmndYmdFrom		: pckgCmndYmdFrom,
			pckgCmndYmdTo		: pckgCmndYmdTo,
			cnptCd				: cnptCd,
			fcltCd				: fcltCd,
			dudtYmd				: dudtYmd,
			itemCd				: itemCd,
			vrtyCd				: vrtyCd,
			spcfctCd			: spcfctCd,
			ordrNo				: ordrNo,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;
		try{
         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonPckgCmnd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
      				apcCd			: item.apcCd,
      				pckgCmndno		: item.pckgCmndno,
      				pckgCmndSn		: item.pckgCmndSn,
      				pckgCmndYmd		: item.pckgCmndYmd,
      				fcltCd			: item.fcltCd,
      				fcltNm			: item.fcltNm,
      				cnptCd			: item.cnptCd,
      				cnptNm			: item.cnptNm,
      				dudtYmd			: item.dudtYmd,
      				itemCd			: item.itemCd,
      				vrtyCd			: item.vrtyCd,
      				vrtyNm			: item.vrtyNm,
      				spcfctCd		: item.spcfctCd,
      				spcfctNm		: item.spcfctNm,
      				ordrQntt		: item.ordrQntt,
      				ordrWght		: item.ordrWght,
      				bxGdsQntt		: item.bxGdsQntt,
      				cmndQntt		: item.cmndQntt,
      				cmndWght		: item.cmndWght,
      				pckgQntt		: item.pckgQntt,
      				pckgWght		: item.pckgWght,
      				ordrNo			: item.ordrNo,
      				gdsCd			: item.gdsCd,
      				gdsNm			: item.gdsNm,
      				rmrk			: item.rmrk,
      				delYn			: item.delYn
				}
      			jsonPckgCmnd.push(pckgCmnd);

				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

	      	if (jsonPckgCmnd.length > 0) {
	      		if(grdPckgCmnd.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			grdPckgCmnd.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			grdPckgCmnd.rebuild();
					}else{
						grdPckgCmnd.refresh();
					}
	      	} else {
	      		grdPckgCmnd.setPageTotalCount(totalRecordCount);
	      		grdPckgCmnd.rebuild();
	      	}
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }

	/**
	 * @name fn_cmndDocPckg
	 * @description 포장지시서 발행
	 */
    const fn_cmndDocPckg = async function() {
    	
		console.log("xxxxx");
		
    	const cmndNoList = [];
		const allData = grdPckgCmnd.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				cmndNoList.push(item.pckgCmndno);
    		}
		});

 		if (cmndNoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const pckgCmndno = cmndNoList.join("','");
 		gfn_popClipReport("포장지시서", "am/pckgCmndDoc.crf", {apcCd: gv_selectedApcCd, pckgCmndno: pckgCmndno});
    }

	const fn_del = async function(){

	   	var grdRows = grdPckgCmnd.getCheckedRows(0);
    	var deleteList = [];

    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		deleteList.push(grdPckgCmnd.getRowData(nRow));
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
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}

     async function fn_reset() {
 		SBUxMethod.set('srch-dtp-cmndYmdFrom', gfn_dateFirstYmd(new Date()));
 		SBUxMethod.set('srch-dtp-cmndYmdTo', gfn_dateToYmd(new Date()));
 		SBUxMethod.set('srch-slt-fclt', "");
 		SBUxMethod.set('srch-inp-cnptNm', "");
 		SBUxMethod.set('srch-inp-cnptCd', "");
 		SBUxMethod.set('srch-dtp-dudtYmd', "");
 		SBUxMethod.set('srch-slt-itemCd', "");
 		SBUxMethod.set('srch-inp-vrtyNm', "");
 		SBUxMethod.set('srch-inp-vrtyCd', "");
 		SBUxMethod.set('srch-slt-spcfctCd', "");
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
 	}
     
  	// APC 선택 변경
 	const fn_onChangeApc = async function() {
 		let result = await Promise.all([
 			fn_initSBSelect(),
 			jsonPckgCmnd = [],
			grdPckgCmnd.rebuild()
 		]);
 	}
</script>
</html>