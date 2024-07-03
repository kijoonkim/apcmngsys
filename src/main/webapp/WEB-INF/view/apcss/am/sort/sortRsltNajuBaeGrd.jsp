
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

<style type="text/css">
.ad_tbl_toplist>span {
	font-weight: bold;
	margin-right: 10px;
}
</style>

</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >

				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>

				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별결과표 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
                            id="btn-srch-apcLinkPop"
                            name="btn-srch-apcLinkPop"
                            class="btn btn-sm btn-outline-danger"
                            text="연계요청"
                            uitype="modal"
                            target-id="modal-apcLinkPop"
                            onclick="fn_popApcLink"
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

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="1" scope="row" class="th_bg">선별일자</th>

							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-inptYmdFrom"
									name="srch-dtp-inptYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
								></sbux-datepicker>
							</td>

							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-inptYmdTo"
									name="srch-dtp-inptYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
								></sbux-datepicker>
							</td>
							<th colspan="1" scope="row" class="th_bg">선별기</th>
							<td colspan="2" class="td_input">
								<sbux-select uitype="single" id="srch-slt-fcltCd" name="srch-slt-fcltCd" class="form-control input-sm" jsondata-ref="jsonComFcltCd" onchange="fn_selectSortFclt" unselected-text="전체" ></sbux-select>
							</td>
							</tr>
							<tr>
							<th colspan="1" scope="row" class="th_bg">생산자</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
									autocomplete-height="270px"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th colspan = "1" scope="row" class="th_bg">품목</th>
							<td colspan = "2"class="td_input">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>




						</tr>
					</tbody>
				</table>


				<div class="table-responsive tbl_scroll_sm">
				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
				</sbux-tabs>



				<div class="tab-content">
					<div id="sortRsltTab" >
						<div id="sb-area-sortRslt" style="height:470px;"></div>
					</div>


				</div>

				</div>
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <div>
        <sbux-modal
            id="modal-apcLinkPop"
            name="modal-apcLinkPop"
            uitype="middle"
            header-title="선별연계수신"
            body-html-id="body-modal-apcLinkPop"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-apcLinkPop">
        <jsp:include page="../../am/popup/apcLinkPopup.jsp"></jsp:include>
     </div>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>

	<div>
    	<sbux-modal id="modal-regSort" name="modal-regSort" uitype="middle" header-title="참외 육안선별 등록" body-html-id="body-modal-regSort" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-regSort">
    	<jsp:include page="../../am/popup/regSortBffa.jsp"></jsp:include>
	</div>


</body>

<script type="text/javascript">

	let lv_interval = 3 * 60 * 1000;

	let timerId;

	const fn_clearBatch = () => {
		if (!gfn_isEmpty(timerId)) {
			clearInterval(timerId);
		}
	}

	let currApcLink;

    /**
     * @name fn_getApcLink
     * @description apc 연계상태 확인
     * @function
     */
	const fn_getApcLink = async function() {

		fn_clearBatch();

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/selectApcLinkStts.do",
						{apcCd: gv_selectedApcCd}
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {

	        	if (_.isEqual("S", data.resultStatus)) {

		        	const apcLink = data.resultMap;
					fn_setApcLink(apcLink);

	        	} else {
	        		fn_setApcLink(false);
	        	}

        	} else {
        		fn_setApcLink(false);
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			timerId = setInterval(() => {
				fn_getApcLink();
			}, lv_interval);
		}
    }

    /**
     * @name fn_setApcLink
     * @description apc 연계상태 정보 표시
     * @function
     */
	const fn_setApcLink = function(apcLink) {

		const sttsFigure = document.querySelector('#dtl-spn-sttsFigure');
		const trsmMatSttsNm = document.querySelector('#dtl-spn-trsmMatSttsNm');
		const reqDt = document.querySelector('#dtl-spn-reqDt');
		const cmptnDt = document.querySelector('#dtl-spn-cmptnDt');
		const sttsNm = document.querySelector('#dtl-spn-sttsNm');
		const emptyDt = "____-__-__ __:__:__";

    	if (gfn_isEmpty(apcLink)) {
    		sttsFigure.style.color = "#000000";
    		trsmMatSttsNm.innerText = "...";
    		trsmMatSttsNm.style.color = "#808080";

    		reqDt.innerText = emptyDt;
    		cmptnDt.innerText = emptyDt;
    		sttsNm.innerText = "확인중";
    		sttsNm.style.color = "#808080";

    		currApcLink = null;
    	} else {
    		sttsFigure.style.color = apcLink.trsmMatSttsColor;
    		trsmMatSttsNm.innerText = apcLink.trsmMatSttsNm;
    		trsmMatSttsNm.style.color = apcLink.trsmMatSttsColor;

    		reqDt.innerText = _.isEqual(apcLink.sortLinkStts, "P0") ? emptyDt : gfn_nvl(apcLink.sortReqDt, emptyDt);
    		cmptnDt.innerText = _.isEqual(apcLink.sortLinkStts, "P0") ? gfn_nvl(apcLink.sortPrcsCmptnDt, emptyDt) : emptyDt;
    		sttsNm.innerText = apcLink.sortSttsNm;
    		sttsNm.style.color = apcLink.sortSttsColor;

    		currApcLink = apcLink;
    	}
    }

    /**
     * @name fn_sortReq
     * @description 선별정보 연계요청
     * @function
     */
 	const fn_sortReq = async function() {

 		if (!gfn_comConfirm("Q0001", "정보재수신 요청")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
 		// validation check

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',	// 선별
			linkStts: 'R0'	// 요청
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLinkStts.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		} finally {
			await fn_getApcLink();
		}
	}

    /**
     * @name fn_sortReqCncl
     * @description 선별정보 연계요청 취소
     * @function
     */
 	const fn_sortReqCncl = async function() {

 		// validation check
 		if (!gfn_comConfirm("Q0001", "정보재수신 요청취소")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',	// 선별
			linkStts: 'R9'	// 요청
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLinkStts.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		} finally {
			await fn_getApcLink();
		}
	}


	var jsonComFcltCd				= [];	// 선별기
	var jsonPrdcrAutocomplete = []; // 생산자
	var jsonApcItem			= [];	// 품목 	itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {
		//SBUxMethod.openModal('modal-apcLinkPop');
		fn_init();

	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
		//fn_createSortRslt();
		//fn_createGrdDsctn();

		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd',jsonComFcltCd, 'SORT_FCLT_CD', 	gv_selectedApcCd),	// 설비
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),								// 품목
			fn_getApcLink()
		]);





		fn_selectSortBffaType();
		fn_search();
		//fn_bffaSearch();
	}


	//그리드 id, 그리드 json
	//선별내역
	var grdSortRslt;
	var jsonSortRslt = [];
	//컬럼 목록
	var jsonExhstColumnData = [];
    /** 육안선별 코드 변수 **/
    var BffaGrdType = [];

    var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "선별내역", "targetid" : "sortRsltTab", "targetvalue" : "선별 내역" }
	];


	const fn_createSortRslt= function() {
		var jsonExhstColumnCnt = jsonExhstColumnData.map((item,index) => {return index+4});
		jsonExhstColumnCnt.push(117);
		jsonExhstColumnCnt.push(118);
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-sortRslt';
	    SBGridProperties.id = 'grdSortRslt';
	    SBGridProperties.jsonref = 'jsonSortRslt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
		SBGridProperties.total = {
				  type 		: 'grand',
				  position	: 'bottom',
				  columns		: {
				      standard : [2],
				      sum : jsonExhstColumnCnt
				  },
				  grandtotalrow : {
				      titlecol 	: 2,
				      titlevalue	: '합계',
				      style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
				      stylestartcol	: 0
				  }

		},

	    SBGridProperties.columns = [
	    	{caption : ["선별일자","선별일자"], ref: 'sortYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["생산농가","생산농가"], ref: 'prdcrNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["호기","호기"], ref: 'sortFclt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	//{caption : ["투입CT","투입CT"], ref: 'bxCnt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
			{caption : ["총합","수량"], ref: 'totQntt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;background-color:#ceebff' ,format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true  },
			{caption : ["총합","중량"], ref: 'totWght', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;background-color:#ceebff' , format : {type:'number', rule:'#,###.###', emptyvalue:'0'}, disabled:true  },

	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true},
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        addSortRsltExhstCol = [];

        jsonExhstColumnData.forEach(function(item){

            addSortRsltExhstCol.push(
                    {caption : [item.GRD_NM.toString(),'수량'], ref: 'QNTT_' + item.GRD_SN, type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; '
                    , format : {type:'number', rule:'#,###', emptyvalue:'0'}, merge: false ,disabled:true}
               );
            addSortRsltExhstCol.push(
                    {caption : [item.GRD_NM.toString(),'중량'], ref: 'WGHT_' + item.GRD_SN, type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; '
                    , format : {type:'number', rule:'#,###.###', emptyvalue:'0'}, merge: false ,disabled:true}
               );
        })
        let originColumns = SBGridProperties.columns;
        originColumns.splice(3,0,...addSortRsltExhstCol);
        SBGridProperties.columns = originColumns;

        grdSortRslt = _SBGrid.create(SBGridProperties);
        //grdSortRslt.bind('click', fnClick)
        grdSortRslt.rebuild();
	}

    const fn_popApcLinkCallBack = function() {

    }

     const fn_popApcLink = function() {
         popApcLink.init(
                     {
                         apcCd: gv_selectedApcCd,
                         apcNm: gv_selectedApcNm,
                         linkKnd: "S",
                         kndList: ["S"]
                     },
                     fn_popApcLinkCallBack
                 );
     }



	// 배출구별 집계
	const fn_setSortRslt = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let sortFclt = SBUxMethod.get("srch-slt-fcltCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gv_selectedApcCd
		const param = {
			apcCd: gv_selectedApcCd
			, prdcrCd : prdcrCd
			, inptYmdFrom : inptYmdFrom
			, inptYmdTo  : inptYmdTo
			, sortFclt : sortFclt
			, prdcrCd : prdcrCd
			, itemCd : itemCd
		}
		jsonSortRslt.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectExhstDsctn.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	const exhstDsctnQnttTot = {
	        			sortYmd : item.INPT_YMD
	        			, grd     : item.GRD
	        			, sortFclt : item.FCLT_NM
	        			, prdcrNm : item.PRDCR_NM
	        			, QNTT_1 : item.QNTT_1
	        			, QNTT_2 : item.QNTT_2
	        			, QNTT_3 : item.QNTT_3
	        			, QNTT_4 : item.QNTT_4
	        			, QNTT_5 : item.QNTT_5
	        			, QNTT_6 : item.QNTT_6
	        			, QNTT_7 : item.QNTT_7
	        			, QNTT_8 : item.QNTT_8
	        			, QNTT_9 : item.QNTT_9
	        			, QNTT_10 : item.QNTT_10
	        			, QNTT_11 : item.QNTT_11
	        			, QNTT_12 : item.QNTT_12
	        			, QNTT_13 : item.QNTT_13
	        			, QNTT_14 : item.QNTT_14
	        			, QNTT_15 : item.QNTT_15
	        			, QNTT_16 : item.QNTT_16
	        			, QNTT_17 : item.QNTT_17
	        			, QNTT_18 : item.QNTT_18
	        			, QNTT_19 : item.QNTT_19
	        			, QNTT_20 : item.QNTT_20
	        			, QNTT_21 : item.QNTT_21
	        			, QNTT_22 : item.QNTT_22
	        			, QNTT_23 : item.QNTT_23
	        			, QNTT_24 : item.QNTT_24
	        			, QNTT_25 : item.QNTT_25
	        			, QNTT_26 : item.QNTT_26
	        			, QNTT_27 : item.QNTT_27
	        			, QNTT_28 : item.QNTT_28
	        			, QNTT_29 : item.QNTT_29
	        			, QNTT_30 : item.QNTT_30
	        			, QNTT_31 : item.QNTT_31
	        			, QNTT_32 : item.QNTT_32
	        			, QNTT_33 : item.QNTT_33
	        			, QNTT_34 : item.QNTT_34
	        			, QNTT_35 : item.QNTT_35
	        			, QNTT_36 : item.QNTT_36
	        			, QNTT_37 : item.QNTT_37
	        			, QNTT_38 : item.QNTT_38
	        			, QNTT_39 : item.QNTT_39
	        			, QNTT_40 : item.QNTT_40
	        			, QNTT_41 : item.QNTT_41
	        			, QNTT_42 : item.QNTT_42
	        			, QNTT_43 : item.QNTT_43
	        			, QNTT_44 : item.QNTT_44
	        			, QNTT_45 : item.QNTT_45
	        			, QNTT_46 : item.QNTT_46
	        			, QNTT_47 : item.QNTT_47
	        			, QNTT_48 : item.QNTT_48
	        			, QNTT_49 : item.QNTT_49
	        			, QNTT_50 : item.QNTT_50

	        			, WGHT_1 : item.WGHT_1
	        			, WGHT_2 : item.WGHT_2
	        			, WGHT_3 : item.WGHT_3
	        			, WGHT_4 : item.WGHT_4
	        			, WGHT_5 : item.WGHT_5
	        			, WGHT_6 : item.WGHT_6
	        			, WGHT_7 : item.WGHT_7
	        			, WGHT_8 : item.WGHT_8
	        			, WGHT_9 : item.WGHT_9
	        			, WGHT_10 : item.WGHT_10
	        			, WGHT_11 : item.WGHT_11
	        			, WGHT_12 : item.WGHT_12
	        			, WGHT_13 : item.WGHT_13
	        			, WGHT_14 : item.WGHT_14
	        			, WGHT_15 : item.WGHT_15
	        			, WGHT_16 : item.WGHT_16
	        			, WGHT_17 : item.WGHT_17
	        			, WGHT_18 : item.WGHT_18
	        			, WGHT_19 : item.WGHT_19
	        			, WGHT_20 : item.WGHT_20
	        			, WGHT_21 : item.WGHT_21
	        			, WGHT_22 : item.WGHT_22
	        			, WGHT_23 : item.WGHT_23
	        			, WGHT_24 : item.WGHT_24
	        			, WGHT_25 : item.WGHT_25
	        			, WGHT_26 : item.WGHT_26
	        			, WGHT_27 : item.WGHT_27
	        			, WGHT_28 : item.WGHT_28
	        			, WGHT_29 : item.WGHT_29
	        			, WGHT_30 : item.WGHT_30
	        			, WGHT_31 : item.WGHT_31
	        			, WGHT_32 : item.WGHT_32
	        			, WGHT_33 : item.WGHT_33
	        			, WGHT_34 : item.WGHT_34
	        			, WGHT_35 : item.WGHT_35
	        			, WGHT_36 : item.WGHT_36
	        			, WGHT_37 : item.WGHT_37
	        			, WGHT_38 : item.WGHT_38
	        			, WGHT_39 : item.WGHT_39
	        			, WGHT_40 : item.WGHT_40
	        			, WGHT_41 : item.WGHT_41
	        			, WGHT_42 : item.WGHT_42
	        			, WGHT_43 : item.WGHT_43
	        			, WGHT_44 : item.WGHT_44
	        			, WGHT_45 : item.WGHT_45
	        			, WGHT_46 : item.WGHT_46
	        			, WGHT_47 : item.WGHT_47
	        			, WGHT_48 : item.WGHT_48
	        			, WGHT_49 : item.WGHT_49
	        			, WGHT_50 : item.WGHT_50
	        			, totWght : item.WGHT_1 + 	item.WGHT_2 + 	item.WGHT_3 + 	item.WGHT_4 + 	item.WGHT_5 + 	item.WGHT_6 + 	item.WGHT_7 + 	item.WGHT_8 + 	item.WGHT_9 + 	item.WGHT_10 + 	item.WGHT_11 + 	item.WGHT_12 + 	item.WGHT_13 + 	item.WGHT_14 + 	item.WGHT_15 + 	item.WGHT_16 + 	item.WGHT_17 + 	item.WGHT_18 + 	item.WGHT_19 + 	item.WGHT_20 + 	item.WGHT_21 + 	item.WGHT_22 + 	item.WGHT_23 + 	item.WGHT_24 + 	item.WGHT_25 + 	item.WGHT_26 + 	item.WGHT_27 + 	item.WGHT_28 + 	item.WGHT_29 + 	item.WGHT_30 + 	item.WGHT_31 + 	item.WGHT_32 + 	item.WGHT_33 + 	item.WGHT_34 + 	item.WGHT_35 + 	item.WGHT_36 + 	item.WGHT_37 + 	item.WGHT_38 + 	item.WGHT_39 + 	item.WGHT_40 + 	item.WGHT_41 + 	item.WGHT_42 + 	item.WGHT_43 + 	item.WGHT_44 + 	item.WGHT_45 + 	item.WGHT_46 + 	item.WGHT_47 + 	item.WGHT_48 + 	item.WGHT_49 + 	item.WGHT_50
	        			, totQntt : item.QNTT_1 + 	item.QNTT_2 + 	item.QNTT_3 + 	item.QNTT_4 + 	item.QNTT_5 + 	item.QNTT_6 + 	item.QNTT_7 + 	item.QNTT_8 + 	item.QNTT_9 + 	item.QNTT_10 + 	item.QNTT_11 + 	item.QNTT_12 + 	item.QNTT_13 + 	item.QNTT_14 + 	item.QNTT_15 + 	item.QNTT_16 + 	item.QNTT_17 + 	item.QNTT_18 + 	item.QNTT_19 + 	item.QNTT_20 + 	item.QNTT_21 + 	item.QNTT_22 + 	item.QNTT_23 + 	item.QNTT_24 + 	item.QNTT_25 + 	item.QNTT_26 + 	item.QNTT_27 + 	item.QNTT_28 + 	item.QNTT_29 + 	item.QNTT_30 + 	item.QNTT_31 + 	item.QNTT_32 + 	item.QNTT_33 + 	item.QNTT_34 + 	item.QNTT_35 + 	item.QNTT_36 + 	item.QNTT_37 + 	item.QNTT_38 + 	item.QNTT_39 + 	item.QNTT_40 + 	item.QNTT_41 + 	item.QNTT_42 + 	item.QNTT_43 + 	item.QNTT_44 + 	item.QNTT_45 + 	item.QNTT_46 + 	item.QNTT_47 + 	item.QNTT_48 + 	item.QNTT_49 + 	item.QNTT_50

	        	};

				jsonSortRslt.push(exhstDsctnQnttTot);


	        });
	        jsonSortRslt.pop();
	        grdSortRslt.refresh();


		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	function sumValues(obj1,obj2){
		const result = {};
		for(const key in obj1){
			if(obj1.hasOwnProperty(key)){
				const val1 = obj1[key];
				const val2 = obj2[key] || 0;
				result[key] = val1 + val2
			}
		}
		return result;
	}



	const fn_search = async function () {
		await fn_setSortRsltCol();
        fn_createSortRslt();
        fn_setSortRslt(); // 배출구 집계
	}

	const fn_dtpChange = function(){
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
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
    	 grdSortRslt.exportLocalExcel("선별내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }

     /**
  	* @name fn_onInputPrdcrNm
  	* @description 생산자명 입력 시 event : autocomplete
  	*/
  	const fn_onInputPrdcrNm = function(prdcrNm){
  		fn_clearPrdcr();
  		if(getByteLengthOfString(prdcrNm.target.value) > 100){
  			SBUxMethod.set("srch-inp-prdcrNm", "");
  			return;
  		}
  		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
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

     const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
 	}

 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}

    const fn_setSortRsltCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd
            , grdSeCd : '02'
            , itemCd : itemCd
        }
        jsonExhstColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                        "/am/sort/selectExhstDsctnCol.do",
                        param,
                        null,
                        false
                    );


            const data = await postJsonPromise;
            jsonExhstColumnData = data.resultList;


        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
             //gfn_comAlert("E0001");    //    E0001    오류가 발생하였습니다.
        }

    }

    const fn_setGrdDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd
            , grdSeCd : '03'
            , itemCd : itemCd
        }
        jsonGrdColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                        "/am/sort/selectExhstDsctnCol.do",
                        param,
                        null,
                        false
                    );


            const data = await postJsonPromise;
            jsonGrdColumnData = data.resultList;
            //await fn_createGrdDsctn();
            //await fn_createBffaGrd();

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
             //gfn_comAlert("E0001");    //    E0001    오류가 발생하였습니다.
        }

    }


 	/**
	 * @name fn_docSort
	 * @description 선별확인서 발행
	 */
	const fn_docSort = async function() {
		const sortnoSnList = [];
		const sortnoList = [];
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'ST_DOC');
		const allData = grdSortRslt.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoSnList.push(item.sortno + item.sortSn);
				sortnoList.push(item.sortno);
    		}
		});

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const sortnoSn = sortnoSnList.join("','");
 		const sortno = sortnoList.join("','");
 		gfn_popClipReport("선별확인서", rptUrl, {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 		//gfn_popClipReport("선별확인서", "am/sortIdntyDoc.crf", {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 	}

    /** 육안선별 등록 팝업함수 **/
    const fn_reg_bffa = function(){
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0005", "품목");
            return
        }
        let rowData = grdSortBffa.getRowData(grdSortBffa.getRow());


        //popBffa.init(gv_apcCd,gv_selectedApcNm,itemCd,BffaGrdType,fn_bffaSearch);

        popBffa.rsltChoice(rowData);

        SBUxMethod.openModal('modal-regSort');
    }

    /** 품목 선택시 육안선별 종류 SELECT **/
    const fn_selectSortBffaType = async function(){
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        if(!gfn_isEmpty(itemCd)){
            try{
               let postJsonPromise = gfn_postJSON('/am/cmns/apcBffaType',{
                    apcCd:gv_apcCd,
                    itemCd:itemCd
                });
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {
                	BffaGrdType = data.resultList;
                }
                //await fn_createGrid();
            }catch (e){
                console.log(e);
            }
        }
    }


    function fnCloseProgress() {
		var options = {
			modelNm : 'main-loading'
		};
		SBUxMethod.closeProgress(options);
	};




</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>