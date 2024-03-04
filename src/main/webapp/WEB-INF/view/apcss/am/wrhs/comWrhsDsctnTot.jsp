
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnCmndDocDsctn"
						name="btnCmndDocDsctn"
						uitype="normal"
						class="btn btn-sm btn-primary"
						text="입고확인서"
					></sbux-button>

                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 5%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>

							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>

							<th colspan="2" scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td colspan="2" class="td_input"style="border-right: hidden;">

								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdFrom"
									name="srch-dtp-wrhsYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdTo"
									name="srch-dtp-wrhsYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
								></sbux-datepicker>
							</td>

						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top2">


							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">입고내역집계</span>
								</li>
							</ul>

						<div class="ad_tbl_top" style="margin-bottom: 10px; text-align:right">
							<sbux-button
							id="btnWrhsReq"
							name="btnWrhsReq"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_wrhsReq"
							text="정보재수신"
						    ></sbux-button>
					    </div>
						<div id="sb-area-wrhsDsctnTot" style="height:544px;"></div>

				</div>
			</div>

	</section>
	<!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>

<script type="text/javascript">

	var jsonComItem				= [];	// 품목 		itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();


	})
	document.getElementById("sb-area-wrhsDsctnTot").addEventListener('keypress',(e)=>{
		if(e.keyCode===13){
			e.preventDefault();
			document.querySelector('sb-area-wrhsDsctnTot').blur();
		}
	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
		fn_createWrhsDsctnTot();
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),										// 품목
		]);
		fn_search();
	}




	//그리드 id, 그리드 json
	//입고내역집계
	var grdWrhsDsctnTot;

	//입고내역집계
	var jsonWrhsDsctnTot = [];


	const fn_createWrhsDsctnTot = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-wrhsDsctnTot';
	    SBGridProperties.id = 'grdWrhsDsctnTot';
	    SBGridProperties.jsonref = 'jsonWrhsDsctnTot';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.total = {
				type: 'grand',
				position: 'bottom',
				columns: {
					standard: [4],
					sum: [5,6,7,8,9,10,11,12,13,14,15,16]
				},

			grandtotalrow : {
				titlecol: 4,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				// 2: '#,###',
				3: '#,###',
				4: '#,###',
			}
		};
	    SBGridProperties.columns = [
	    	{caption : [],	ref : 'checkedYn',		width : '40px',	style : 'text-align:center',	type : 'radio', 			typeinfo : {checkedvalue : 'yes', uncheckedvalue : 'false'}},
	    	{caption : ["품목","품목"], ref: 'itemNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["품종","품종"], ref: 'vrtyNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["구분","구분"], ref: 'prdcrNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["입고일자","입고일자"], ref: 'wrhsYmd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	    	{caption : ["1차","수량"], ref: 'bxQntt1', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["1차","중량"], ref: 'wrhsWght1', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["2차","수량"], ref: 'bxQntt2', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["2차","중량"], ref: 'wrhsWght2', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["3차","수량"], ref: 'bxQntt3', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["3차","중량"], ref: 'wrhsWght3', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["4차","수량"], ref: 'bxQntt4', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["4차","중량"], ref: 'wrhsWght4', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["5차","수량"], ref: 'bxQntt5', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["5차","중량"], ref: 'wrhsWght5', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["소계","수량"], ref: 'qnttTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff ', format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;'},
	    	{caption : ["소계","중량"], ref: 'wrhsTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff ', format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;'},
	    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;'},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'output',  	hidden: true}


	    ];
	    grdWrhsDsctnTot = _SBGrid.create(SBGridProperties);


	}






	// 입고구분
	const fn_setWrhsDsctnTot = async function() {
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		const param = {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			itemCd: itemCd,
			vrtyCd: vrtyCd
		}
		jsonWrhsDsctnTot.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectComDsctnTotList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	const WrhsDsctnTot = {
	        			prdcrNm : item.prdcrNm
	        	    ,   prdcrCd : item.prdcrCd
	        	    ,   itemNm  : item.itemNm
	        	    ,   vrtyNm  : item.vrtyNm
	        	    ,   wrhsYmd : item.wrhsYmd
	        		,	bxQntt1 : item.bxQntt1
	        		,	bxQntt2 : item.bxQntt2
	        		,	bxQntt3 : item.bxQntt3
	        		,	bxQntt4 : item.bxQntt4
	        		,	bxQntt5 : item.bxQntt5
	        		,	wrhsWght1 : item.wrhsWght1
	        		,	wrhsWght2 : item.wrhsWght2
	        		,	wrhsWght3 : item.wrhsWght3
	        		,	wrhsWght4 : item.wrhsWght4
	        		,	wrhsWght5 : item.wrhsWght5
	        		,	qnttTot : item.qnttTot
	        		,	wrhsTot : item.wrhsTot

	        	}
	        	jsonWrhsDsctnTot.push(WrhsDsctnTot);
	        });

	        grdWrhsDsctnTot.refresh();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_search = async function () {

		fn_setWrhsDsctnTot();

	}
	const fn_wrhsReq = async function() {

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'W',
			wrhsReqYn: 'Y'
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLink.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	const fn_dtpChange = function(){
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

     // 엑셀 다운로드
     function fn_excelDwnld() {
    	 grdWrhsDsctnTot.exportLocalExcel("입고내역집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }

     /**
      * @name fn_docWrhsDsctnTot
      * @description 입고집계내역 발행 버튼
      */
 	const fn_docWrhsDsctnTot = function() {

 		const grdWrhsDsctnTotList = [];
 		const allData = grdWrhsDsctnTot.getGridDataAll();
 		allData.forEach((item, index) => {
 			if (item.checkedYn === "yes") {
 					grdWrhsDsctnTotList.push(
 						item.prdcrCd
 						, item.wrhsYmd
 					);
 				}

 		});
 		if (grdWrhsDsctnTotList.length === 0) {
 			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
 			return;
 		}
 		const list = grdWrhsDsctnTotList.join("','");

 		gfn_popClipReport("입고확인서", "am/popWrhsDsctnTot.crf", {apcCd: gv_selectedApcCd, prdcrCd : grdWrhsDsctnTotList[0] , wrhsYmd : grdWrhsDsctnTotList[1]});
 	}

</script>
</html>