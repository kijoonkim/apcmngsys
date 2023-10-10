<%
 /**
  * @Class Name : pckgInpt.jsp
  * @Description : 포장실적조회 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	하민우			최초 생성
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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 포장실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDocPckg"
						name="btnDocPckg"
						uitype="normal"
						class="btn btn-sm btn-success"
						text="포장확인서"
						onclick="fn_docPckg"
					></sbux-button>
					<sbux-button
						id="btnLblGds"
						name="btnLblGds"
						uitype="normal"
						class="btn btn-sm btn-success"
						text="상품라벨"
						onclick="fn_lblGds"
					></sbux-button>

					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-vrtyCds" name="srch-inp-vrtyCds" uitype="hidden"></sbux-input>
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
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>포장일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-pckgYmdFrom"
									name="srch-dtp-pckgYmdFrom"
									uitype="popup"
									class="form-control input-sm"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-pckgYmdTo"
									 name="srch-dtp-pckgYmdTo"
									 uitype="popup"
									 class="form-control input-sm"
								 ></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									class="form-control input-sm"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-vrtySrch"
									name="srch-btn-vrtySrch"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vrty"
									onclick="fn_modalVrty"
								/>
							</td>
							<th scope="row" class="th_bg">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-fcltCd"
											name="srch-slt-fcltCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonComFcltCd"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-warehouseSeCd"
											name="srch-slt-warehouseSeCd"
											uitype="single"
											class="form-control input-sm"
											unselected-text="전체"
											jsondata-ref="jsonComWarehouse"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan= "2"></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-spcfctCd"
											name="srch-slt-spcfctCd"
											uitype="single"
											class="form-control input-sm"
											unselected-text="전체"
											jsondata-ref="jsonApcSpcfct"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg" style="border-right: hidden;">대표생산자</th>
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
						    </td>
						    <td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
						    <td class="td_input">
					    		<sbux-button
						    		id="srch-btn-prdcrCd"
						    		name="srch-btn-prdcrCd"
						    		uitype="modal"
						    		class="btn btn-xs btn-outline-dark"
						    		text="찾기"
						    		target-id="modal-prdcr"
						    		onclick="fn_choicePrdcr"
					    		></sbux-button>
							</td>
						</tr>
						<!--
						<tr>
							<th scope="row" class="th_bg">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-gdsGrd" name="srch-slt-grdCd" uitype="single" jsondata-ref="jsonGrd" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
						 -->
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>포장내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-pckgPrfmnc">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgPrfmnc" style="width:100%;height:540px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	 <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
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

	var jsonApcItem			= [];	// 품목 	itemCd			검색
	var jsonApcVrty			= [];	// 품종 	vrtyCd			검색
	var jsonApcSpcfct		= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd			검색

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	/** 포장실적 grid */
	var grdPckgPrfmnc;
	var jsonPckgPrfmnc = [];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 	'PCKG_FCLT_CD', gv_selectedApcCd),				// 선별기
		 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 선별기
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd)								// 품목
		]);
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	const fn_modalVrty = function() {
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, itemCd, fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCds', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
		}
	}

    const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			const _vrtyCds = [];
			const _vrtyNms = [];

			vrtys.forEach((item) => {
				_vrtyCds.push(item.vrtyCd);
				_vrtyNms.push(item.vrtyNm);
			});

			SBUxMethod.set('srch-inp-vrtyCds', _vrtyCds.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
		} else {
			SBUxMethod.set('srch-inp-vrtyCds', "");
			SBUxMethod.set('srch-inp-vrtyNm', "");
		}
		console.log(SBUxMethod.get('srch-inp-vrtyCds'));
		console.log(SBUxMethod.get('srch-inp-vrtyNm'));
	}

    const fn_init = async function() {

    	let nowDate = new Date();
		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateLastYmd(nowDate);

		SBUxMethod.set("srch-dtp-pckgYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-pckgYmdTo", lastYmd);

		let rst = await Promise.all([
			fn_getPrdcrs(),
			fn_initSBSelect()
		]);

		fn_createGrid();

		fn_search();
    }

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})

	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgPrfmnc';
	    SBGridProperties.id = 'grdPckgPrfmnc';
	    SBGridProperties.jsonref = 'jsonPckgPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [

        	{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["포장일자","포장일자"], 	ref: 'pckgYmd', 		width: '120px', type: 'output', style:'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
        	},
        	{caption: ["포장번호","포장번호"], 	ref: 'pckgnoIndct',     width: '120px',	type: 'output',	style: 'text-align:center'},
            {caption: ['지시번호','지시번호'], 	ref: 'pckgCmndno', 		width: '120px', type: 'output', style:'text-align:center'},
            {caption: ['품목','품목'], 			ref: 'itemNm', 			width: '80px',	type: 'output', style:'text-align:center'},
            {caption: ['품종','품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output', style:'text-align:center'},
            {caption: ['규격','규격'], 			ref: 'spcfctNm', 		width: '80px', 	type: 'output', style:'text-align:center'},
            {caption: ['상품등급','상품등급'], 	ref: 'gdsGrdNm', 		width: '80px',	type: 'output', style:'text-align:center'},
            {caption: ['재고','수량'], 			ref: 'invntrQntt', 		width: '50px', 	type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['재고','중량'], 			ref: 'invntrWght', 		width: '80px', 	type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###kg'}
            },
            {caption: ['포장기','포장기'], 		ref: 'fcltNm', 			width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['대표생산자','대표생산자'],	ref: 'rprsPrdcrNm', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['창고','창고'], 			ref: 'warehouseSeNm', 	width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['포장','수량'], 			ref: 'pckgQntt', 		width: '50px', 	type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['포장','중량'], 			ref: 'pckgWght', 		width: '80px', 	type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###kg'}
            },
            {caption: ['출하','수량'], 			ref: 'spmtQntt', 		width: '50px', 	type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['출하','중량'], 			ref: 'spmtWght', 		width: '80px', 	type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###kg'}
            },
            {caption: ['비고','비고'], 		ref: 'rmrk', 				width: '250px', type: 'output', style:'text-align:center'},
 	        {caption: ["APC코드"],	ref: 'apcCd',   	type:'output',  hidden: true},
 	        {caption: ["대표생산자코드"],	ref: 'rprsPrdcrCd',   	type:'output',  hidden: true},
 	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["규격코드"],		ref: 'spcfctCd',   	type:'output',  hidden: true},
	        {caption: ["창고구분코드"],	ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["설비"],		ref: 'fcltCd', 		type:'output',	hidden: true},
	        {caption: ["상품등급코드"],	ref: 'gdsGrd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분명"],	ref: 'gdsSeNm',   	type:'output',  hidden: true},
	        {caption: ["생산연도"],		ref: 'prdctnYr',   	type:'output',  hidden: true},
	        {caption: ["포장단위"],		ref: 'spmtPckgUnitCd',   	type:'output',  hidden: true},
	        {caption: ["포장단위명"],	ref: 'spmtPckgUnitNm',   	type:'output',  hidden: true},
	        {caption: ["생산연도"],		ref: 'prdctnYr',   	type:'output',  hidden: true},
	        {caption: ["산지코드"],		ref: 'plorCd',   	type:'output',  hidden: true},
	        {caption: ["포장번호"],		ref: 'pckgno', 		type:'output',  hidden: true},
	        {caption: ["포장순번"],		ref: 'pckgSn', 		type:'output',  hidden: true}
        ];
        grdPckgPrfmnc = _SBGrid.create(SBGridProperties);
    }

	//조회
    const fn_search = async function() {

    	grdPckgPrfmnc.rebuild();
    	let pageSize = grdPckgPrfmnc.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonPckgPrfmnc.length = 0;
    	grdPckgPrfmnc.clearStatus();
    	fn_setGrdPckgPrfmnc(pageSize, pageNo);
    }

    /**
     * @name fn_setGrdPckgPrfmnc
     * @description 포장실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdPckgPrfmnc = async function(pageSize, pageNo) {
    	let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
    	let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
    	let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
    	let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
    	let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	let prdcrNm = SBUxMethod.get("srch-inp-prdcrNm");
    	let gdsGrd = SBUxMethod.get("srch-slt-gdsGrd");

		const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do", {
			apcCd: gv_selectedApcCd,
			pckgYmdFrom: pckgYmdFrom,
			pckgYmdTo: pckgYmdTo,
			itemCd: itemCd,
			//vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			fcltCd: fcltCd,
			warehouseSeCd: warehouseSeCd,
			rprsPrdcrCd: prdcrCd,
			rprsPrdcrNm: prdcrNm,
			gdsGrd: gdsGrd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

            jsonPckgPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgPrfmnc = {
          			apcCd: item.apcCd,
          			apcNm: item.apcNm,
          			pckgno: item.pckgno,
          			pckgSn: item.pckgSn,
          			pckgnoIndct: item.pckgnoIndct,
          			pckgCmndno: item.pckgCmndno,
          			pckgYmd: item.pckgYmd,
          			fcltCd: item.fcltCd,
          			fcltNm: item.fcltNm,
          			rprsPrdcrCd: item.rprsPrdcrCd,
          			rprsPrdcrNm: item.rprsPrdcrNm,
          			itemCd: item.itemCd,
          			itemNm: item.itemNm,
          			vrtyCd: item.vrtyCd,
          			vrtyNm: item.vrtyNm,
          			spcfctCd: item.spcfctCd,
          			spcfctNm: item.spcfctNm,
          			gdsGrd: item.gdsGrd,
          			gdsGrdNm: item.gdsGrdNm,
          			gdsSeCd: item.gdsSeCd,
          			gdsSeNm: item.gdsSeNm,
          			prdctnYr: item.prdctnYr,
          			spmtPckgUnitCd: item.spmtPckgUnitCd,
          			spmtPckgUnitNm: item.spmtPckgUnitNm,
          			warehouseSeCd: item.warehouseSeCd,
          			warehouseSeNm: item.warehouseSeNm,
          			pckgQntt: item.pckgQntt,
          			pckgWght: item.pckgWght,
          			spmtQntt: item.spmtQntt,
          			spmtWght: item.spmtWght,
          			invntrQntt: item.invntrQntt,
          			invntrWght: item.invntrWght,
          			plorCd: item.plorCd,
          			prdctnYr: item.prdctnYr,
  				}
          		jsonPckgPrfmnc.push(pckgPrfmnc);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonPckgPrfmnc.length > 0) {
          		if(grdPckgPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdPckgPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdPckgPrfmnc.rebuild();
  				}else{
  					grdPckgPrfmnc.refresh();
  				}
          	} else {
          		grdPckgPrfmnc.setPageTotalCount(totalRecordCount);
          		grdPckgPrfmnc.rebuild();
          	}

          	document.querySelector('#cnt-pckgPrfmnc').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }

 	/** ui event */
 	/**
 	 * @name fn_onChangeApc
 	 * @description APC 선택 변경 event
 	 */
 	const fn_onChangeApc = async function() {
 		fn_clearPrdcr();
 		let result = await Promise.all([
 			fn_init()
 		]);
 	}

 	/**
 	 * @name fn_onChangeSrchItemCd
 	 * @description 품목 선택 변경 event
 	 */
 	const fn_onChangeSrchItemCd = async function(obj) {
 		let itemCd = obj.value;
 		SBUxMethod.set("srch-slt-spcfctCd", "");
 		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd);
 	}

    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", null);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcrInfo.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}

	/**
	 * @name fn_docPckg
	 * @description 포장확인서 발행
	 */
	const fn_docPckg = function() {
		const pckgnoList = [];
		const allData = grdPckgPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				pckgnoList.push(item.pckgno);
    		}
		});

 		if (pckgnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const pckgno = pckgnoList.join("','");
 		console.log(gv_selectedApcCd);
 		console.log(pckgno);

 		gfn_popClipReport("포장확인서", "am/pckgIdntyDoc.crf", {apcCd: gv_selectedApcCd, pckgno: pckgno});
 	}

	/**
	 * @name fn_lblGds
	 * @description 상품라벨 발행
	 */
	const fn_lblGds = function() {
		const pckgnoList = [];
		const allData = grdPckgPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				pckgnoList.push(item.pckgno);
    		}
		});

 		if (pckgnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const pckgno = pckgnoList.join("','");
 		console.log(gv_selectedApcCd);
 		console.log(pckgno);

 		gfn_popClipReport("상품라벨", "am/gdsLabel.crf", {apcCd: gv_selectedApcCd, pckgno: pckgno});
 	}

</script>
</html>