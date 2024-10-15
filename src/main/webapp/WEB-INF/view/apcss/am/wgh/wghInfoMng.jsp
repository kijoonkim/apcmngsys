<%
 /**
  * @Class Name : wghInfoMng.jsp
  * @Description : 계량정보관리 화면
  * @author SI개발부
  * @since 2024.10.15
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.15   	김호 			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 계량정보관리</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 계량정보관리 -->
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDocRawMtrWgh"
						name="btnDocRawMtrWgh"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_docRawMtrWgh"
						text="정산서발행"
					></sbux-button>
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
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

				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-wghno" name="dtl-inp-wghno" uitype="hidden"></sbux-input>
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
							<td class="td_input"style="border-right: hidden;">
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
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									jsondata-ref="jsonApcItem"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td colspan="1" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">구분</th>
							<td colspan="1" class="td_input" style="border-right:hidden;">
							</td>
						</tr>
						<tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>계량정보 상세</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:401px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
	}
	async function cfn_add() {

	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}


	let prvRowNum = -1;

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonComGdsSeCd		= [];	// 상품구분 	gdsSeCd		검색


    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회

    /* SBGrid Data (JSON) */
    var jsonWghPrfmnc = [];


    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),						// 품목
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		fn_init();

	});

	const fn_init = async function() {
		fn_reset();
		fn_createWghPrfmncGrid();

		fn_initSBSelect();
	}


	const fn_createWghPrfmncGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.mergecells = 'byrestriccol';
        SBGridProperties.columns = [
            {caption: ['계량번호'], 	ref: 'wghno', hidden: true},
        	{caption: ["체크박스"], 	ref: 'checkedYn', 		type: 'checkbox', 	width: '40px',	  style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ['계량일자'], 	ref: 'wghno', 		width: '120px', type: 'output', style:'text-align:center'},
            {caption: ['거래처'], 		ref: 'wghno', 		width: '120px', type: 'output', style:'text-align:center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['총 중량 (Kg)'], ref: 'wholWght', 	width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['공차중량 (Kg)'], ref: 'emptVhclWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['실중량 (Kg)'], 	ref: 'actlWght', 	width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['감량 (Kg)'], 	ref: 'rdcdWght', 	width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
        	{caption: ['인수량'], 		ref: 'prdcrNm', 	width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['생산자'], 		ref: 'prdcrNm', 	width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['입고중량 (Kg)'], ref: 'wrhsWght', 	width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
        	{caption: ['생산자'], 		ref: 'prdcrNm', 	width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['창고'], 		ref: 'warehouseSeCd', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['열'], 			ref: 'strgLoctnRow', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['행'], 			ref: 'strgLoctnCol', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['단'], 			ref: 'strgLoctnLvl', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'output'},
            {caption: ['순번'], 		ref: 'wghSn', 		width: '40px', type: 'output', style:'text-align:center',  hidden: true},
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
        grdWghPrfmnc.bind('click', fn_view);
    }



	/** common button action */

	/**
     * @name fn_docRawMtrWgh
     * @description 계량확인서 발행 버튼
     */
	const fn_docRawMtrWgh = function() {

		const wghnoList = [];
		const allData = grdWghPrfmnc.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				wghnoList.push(item.wghno);
    		}
		});

 		if (wghnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

		const wghno = wghnoList.join("','");
		gfn_popClipReport("계량확인서", "am/rawMtrWghDoc.crf", {apcCd: gv_selectedApcCd, wghno: wghno});
	}

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
	}


	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {


	}

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		if (gfn_isEmpty(SBUxMethod.get("dtl-dtp-wghYmd"))) {
    		gfn_comAlert("W0001", "계량일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

		var getColRef = grdWghPrfmnc.getColRef("checkedYn");
		grdWghPrfmnc.setFixedcellcheckboxChecked(0, getColRef, false);

		SBUxMethod.set("lbl-wghno", "");
		SBUxMethod.set("dtl-inp-wghno", "");

    	// grid clear
    	jsonWghPrfmnc.length = 0;
    	fn_setGrdWghPrfmnc();
	}

	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

	}


    /**
     * @name fn_setGrdWghPrfmnc
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function() {

		prvRowNum = -1;

  		let wghYmd = SBUxMethod.get("dtl-dtp-wghYmd");			// 계량일자

		const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			wghYmd: wghYmd,
          	// pagination
  	  		pagingYn : 'N'
  		});

  		try {

	        const data = await postJsonPromise;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = {
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghSn: item.wghSn,
  						wghnoIndct: item.wghnoIndct,
  						wrhsno: item.wrhsno,
  						wghYmd: item.wghYmd,
  						vhclno: item.vhclno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						wholWght: item.wholWght,
  						emptVhclWght: item.emptVhclWght,
  						rdcdRt: item.rdcdRt,
  						actlWght: item.actlWght,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						prdcrIdentno: item.prdcrIdentno,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxQntt: item.bxQntt,
  						bxWght: item.bxWght,
  						invntrWght: item.invntrWght,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);
  			});

          	grdWghPrfmnc.rebuild();

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}




	/** ui event */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_init();
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>