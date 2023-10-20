<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 정산자료등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="btnReset" 
						name="btnReset" 
						uitype="normal" 
						class="btn btn-sm btn-outline-danger" 
						text="초기화" 
						onclick="fn_reset"
					></sbux-button>
					<sbux-button 
						id="btnSearch" 
						name="btnSearch" 
						uitype="normal" 
						class="btn btn-sm btn-outline-danger" 
						text="조회" 
						onclick="fn_search"
					></sbux-button>
					<sbux-button 
						id="btnSave" 
						name="btnSave" 
						uitype="normal" 
						class="btn btn-sm btn-outline-danger" 
						text="저장" 
						onclick="fn_save"
					></sbux-button>
					<sbux-button 
						id="btnDelete" 
						name="btnDelete" 
						uitype="normal" 
						class="btn btn-sm btn-outline-danger" 
						text="삭제" 
						onclick="fn_delete"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산기준</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="srch-slt-clclnCrtrCd" 
											name="srch-slt-clclnCrtrCd" 
											uitype="single" 
											unselected-text="전체" 
											class="form-control input-sm input-sm-ast"
											jsondata-ref="jsonComClclnCrtrCd"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker 
									id="srch-dtp-clclnYmdFrom" 
									name="srch-dtp-clclnYmdFrom" 
									uitype="popup" 
									class="form-control input-sm input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker 
									id="srch-dtp-clclnYmdTo" 
									name="srch-dtp-clclnYmdTo" 
									uitype="popup" 
									class="form-control input-sm input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">확정여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="srch-slt-cfmtnYn" 
											name="srch-slt-cfmtnYn" 
											uitype="single" 
											unselected-text="전체" 
											class="form-control input-sm"
											jsondata-ref="jsonCfmtnYn"
										></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="srch-slt-itemCd" 
											name="srch-slt-itemCd" 
											uitype="single" 
											unselected-text="전체" 
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="srch-slt-vrtyCd" 
											name="srch-slt-vrtyCd" 
											uitype="single" 
											unselected-text="전체" 
											class="form-control input-sm"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="srch-inp-prdcrNm" 
									name="srch-inp-prdcrNm" 
									uitype="text" 
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcrCd"
									name="btnSrchPrdcrCD"
									uitype="modal"
									class="btn btn-xs btn-outline-dark"
									text="찾기" target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>정산 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clcln">0</span>건)</span>
						</li>
					</ul>
				 	<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: auto">
							<col style="width: 180px">
							<col style="width: 82px">
						</colgroup>
						<tbody>
							<tr>
								<td style="border-left:hidden"></td>
								<td class="td_input" style="border-right:hidden; border-left:hidden" >
									<sbux-datepicker 
										id="srch-dtp-clclnYmd" 
										name="srch-dtp-clclnYmd" 
										uitype="popup" 
										class="form-control input-sm sbux-pik-group-apc"
									></sbux-datepicker></td>
								<td class="td_input" style="border-right:hidden;">
									<sbux-button 
										id="btnInsertClclnData" 
										name="btnInsertClclnData" 
										uitype="normal" 
										class="btn btn-xs btn-outline-dark" 
										text="정산자료생성"
										onclick="fn_insertClclnData"
									></sbux-button>
								</td>
							</tr>
						</tbody>
				 		</table>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnPrfmnc" style="width:100%;height:540px;"></div>
				</div>
				<!--[pp] //검색결과 -->
				</div>
			</div>
	</section>
	
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal 
	        id="modal-prdcr" 
	        name="modal-prdcr" 
	        uitype="middle" 
	        header-title="생산자 선택" 
	        body-html-id="body-modal-prdcr" 
	        footer-is-close-button="false" 
	        style="width:1100px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">


	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComClclnCrtrCd	= [];	// 정산기준 	clclnCrtr	검색
	var jsonCfmtnYn			= [
			{text: "Y", value: "Y"},
			{text: "N", value: "N"}
		];	// 확정여부 	cfmtnYn		검색

	/* 생산자 자동완성 */
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];
	
    /* SBGrid */
	var grdClclnPrfmnc;
    /* SBGrid Data (JSON) */
	var jsonClclnPrfmnc = [];
    
    
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 		gv_selectedApcCd),						// 품종
			gfn_setComCdSBSelect('srch-slt-clclnCrtrCd', 	jsonComClclnCrtrCd, 	'CLCLN_CRTR_CD')	// 정산기준
		]);
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
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		
		fn_createGrid();

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_clearForm();
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});


	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdClclnPrfmnc';
	    SBGridProperties.id = 'grdClclnPrfmnc';
	    SBGridProperties.jsonref = 'jsonClclnPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
			{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["정산일자"], ref: 'clclnYmd', type:'output',  width:'120px', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ['생산자'], ref: 'prdcrNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['정산기준'], ref: 'clclnCrtrNm', width: '100px', type : 'output', style: 'text-align:center'},
            {caption: ['입고구분'], ref: 'wrhsSeNm', width: '80px', type : 'output', style: 'text-align:center'},
            {caption: ['상품구분'], ref: 'gdsSeNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품목'], ref: 'itemNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], ref: 'spcfctNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['등급'], ref: 'grdNm', width: '100px', type: 'output'},
            {caption: ["수량"], ref: 'qntt', type:'output',  width:'80px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["중량"], ref: 'wght', type:'output',  width:'100px',   style:'text-align:right',
            	format : {type:'number', rule:'#,### kg'}
            },
            {caption: ["계산금액"], ref: 'rkngAmt', type:'output',  width:'100px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {
				caption: ["확정금액"],
				ref: 'cfmtnAmt',
				datatype: 'number',
				type:'input',
				width:'100px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "sortQntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 14,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
            {caption: ["확정여부"], ref: 'cfmtnYn', type:'combo',  width:'80px', style: 'text-align:center;',
            	userattr: {colNm: "cfmtnYn"},
            	typeinfo: {ref:'jsonComClclnCrtrCd', label:'cmnsNm', value:'cmnsCd', oneclickedit: true, displayui : false}
            },
            {caption: [""], ref: '_', type:'output', width:'1px'},
            {caption: ["생산자코드"], ref: 'prdcrCd', type:'output', hidden: true},
            {caption: ["정산기준코드"], ref: 'clclnCrtrCd', type:'output', hidden: true},
            {caption: ["입고구분코드"], ref: 'wrhsSeCd', type:'output', hidden: true},
            {caption: ["상품구분코드"], ref: 'gdsSeCd', type:'output', hidden: true},
            {caption: ["품목코드"], ref: 'itemCd', type:'output', hidden: true},
            {caption: ["품종코드"], ref: 'vrtyCd', type:'output', hidden: true},
            {caption: ["규격코드"], ref: 'spcfctCd', type:'output', hidden: true},
            {caption: ["등급코드"], ref: 'grdCd', type:'output', hidden: true},
        ];
        
        grdClclnPrfmnc = _SBGrid.create(SBGridProperties);
        grdClclnPrfmnc.bind('valuechanged', fn_grdClclnPrfmncValueChanged);
    }

 	/**
     * @name fn_grdClclnPrfmncValueChanged
     * @description 정산실적 변경 event 처리
     * @function
     */
	const fn_grdClclnPrfmncValueChanged = function() {
		var nRow = grdClclnPrfmnc.getRow();
		var nCol = grdClclnPrfmnc.getCol();

		const usrAttr = grdClclnPrfmnc.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			/*
			const rowData = grdClclnPrfmnc.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {
				case "sortQntt":
					let spcfctWght = parseInt(rowData.spcfctWght) || 0;

					const wght = rowData.sortQntt * spcfctWght;
					rowData.sortWght = wght;

					grdSortPrfmnc.refresh();

					let inptWght = parseInt(SBUxMethod.get("dtl-inp-inptWght")) || 0;
					let sortWght = 0;
					const allSortData = grdSortPrfmnc.getGridDataAll();
					allSortData.forEach((item, index) => {
						if (!gfn_isEmpty(item.inptYmd)) {
							sortWght += parseInt(item.sortWght) || 0;
						}
					});

					SBUxMethod.set("dtl-inp-sortWght", sortWght);
					let actlWght = parseInt(SBUxMethod.get("dtl-inp-actlWght")) || 0;
					SBUxMethod.set("dtl-inp-lossWght", actlWght - sortWght);
					break;

				default:
					return;
			}
			*/
		}
	}
	
	
	/**
	 * common button action
	 */
	 
	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		
		let result = await Promise.all([
			fn_initSBSelect(),
			fn_getPrdcrs()
		]);
		
		fn_clearForm();
	}
	 
	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = function() {
		fn_clearForm();
	}

 	/**
     * @name fn_delete
     * @description 삭제 버튼
     */
 	const fn_delete = async function() {
 		
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
    	fn_setGrdClclnPrfmnc();
	}

    /**
     * @name fn_setGrdClclnPrfmnc
     * @description 정산내역 조회
     */
	const fn_setGrdClclnPrfmnc = async function() {

   		let clclnCrtrCd = SBUxMethod.get("srch-slt-clclnCrtrCd");	// 정산기준코드
   		let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");	// 정산일자 from
   		let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");	// 정산일자 to
   		let cfmtnYn = SBUxMethod.get("srch-slt-cfmtnYn");		// 확정여부

  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

		const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			clclnCrtrCd: clclnCrtrCd,
			clclnYmdFrom: clclnYmdFrom,
			clclnYmdTo: clclnYmdTo,
			cfmtnYn: cfmtnYn,
			
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
          	// pagination
  	  		pagingYn : 'N',
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonClclnPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const clclnPrfmnc = {
  						apcCd: item.apcCd,
  						clclnYmd: item.clclnYmd,
  						clclnCrtrCd: item.clclnCrtrCd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						vrtyCd: item.vrtyCd,
  						spcfctCd: item.spcfctCd,
  						wrhsSeCd: item.wrhsSeCd,
  						gdsSeCd: item.gdsSeCd,
  						qntt: item.qntt,
  						wght: item.wght,
  						rkngAmt: item.rkngAmt,
  						cfmtnAmt: item.cfmtnAmt,
  						itemNm: item.itemNm,
  						vrtyNm: item.vrtyNm,
  						spcfctNm: item.spcfctNm,
  						clclnCrtrNm: item.clclnCrtrNm,
  						wrhsSeNm: item.wrhsSeNm,
  						gdsSeNm: item.gdsSeNm,
  						grdNm: item.grdNm,
  				}
          		
          		jsonClclnPrfmnc.push(clclnPrfmnc);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	totalRecordCount = jsonClclnPrfmnc.length;
          	grdClclnPrfmnc.refresh();
          	
          	document.querySelector('#cnt-clcln').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}
 	
 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

 		// 일자
		let ymd = gfn_dateToYmd(new Date());		
		SBUxMethod.set("srch-dtp-clclnYmdFrom", ymd);
		SBUxMethod.set("srch-dtp-clclnYmdTo", ymd);
		SBUxMethod.set("srch-dtp-clclnYmd", ymd);

		// 정산기준
		SBUxMethod.set("srch-slt-clclnCrtrCd", null);
		// 품목
		SBUxMethod.set("srch-slt-itemCd", null);
		// 품종
		SBUxMethod.set("srch-slt-vrtyCd", null);

		// 생산자
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		
		// 확정여부
		SBUxMethod.set("srch-slt-cfmtnYn", null);
		
		fn_onChangeSrchItemCd({value: null});
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {		
		
		let vrtyCd = obj.value;
		
		const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});
		const itemCd = vrtyInfo.mastervalue;
		
		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
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
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}
	}

</script>
</html>