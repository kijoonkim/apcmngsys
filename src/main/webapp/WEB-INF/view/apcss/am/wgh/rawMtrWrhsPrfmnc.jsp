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
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_rawMtrWrhsPrfmncSearch" text="조회" ></sbux-button>
					
				</div>
			</div>
			<div>
			</div>
			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">입고일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" class="form-control pull-right input-sm"></sbux-datepicker>

							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="srch-inp-prdcrNm" 
									name="srch-inp-prdcrNm" 
									class="form-control input-sm"
									placeholder="초성검색 기능입니다." 
									autocomplete-ref="jsonPrdcrAutocomplete" 
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"    									
   								></sbux-input>
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
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd1" name="chk-wrhsKnd1" uitype="normal" class="form-control input-sm" text="일반매입" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd2" name="chk-wrhsKnd2" uitype="normal" class="form-control input-sm" text="공선" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd3" name="chk-wrhsKnd3" uitype="normal" class="form-control input-sm" text="매취" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd4" name="chk-wrhsKnd4" uitype="normal" class="form-control input-sm" text="상품" checked/>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd1" name="chk-gsd1" uitype="normal" class="form-control input-sm" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd2" name="chk-gsd2" uitype="normal" class="form-control input-sm" text="GAP" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd3" name="chk-gsd3" uitype="normal" class="form-control input-sm" text="무농약" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd4" name="chk-gsd4" uitype="normal" class="form-control input-sm" text="유기농" checked/>
								</p>
							</td>
					    	<th scope="row" class="th_bg">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt1" name="chk-trsprt1" uitype="normal" class="form-control input-sm" text="자가" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt2" name="chk-trsprt2" uitype="normal" class="form-control input-sm" text="용역" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt3" name="chk-trsprt3" uitype="normal" class="form-control input-sm" text="기타" checked/>
								</p>
							</td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhclno" name="srch-inp-vhclno" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-vhcl"
									name="srch-btn-vhcl"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceVhcl"
								/>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">계량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghNo" name="srch-inp-wghNo" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-wghNo" name="srch-btn-wghNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal"/>
							</td>
						</tr>
					</tbody>
				</table>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>원물입고 내역</span></li>
						</ul>
					</div>
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea" style="height:508px;"></div>
						</div>
					</div>
			</div>
		</div>
	</section>
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
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

	var jsonComItem				= [];	// 품목 		itemCd			검색
	var jsonComWarehouseSeCd	= [];	// 창고 		warehouseSeCd	검색
	var autoCompleteDataJson = [];		// 생산자 초성검색 결과
	var jsonDataPrdcr	= [];			// 생산자 전체리스트

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		await gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd);	// 창고
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd);		// 품목
	}
	
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}
    
    const fn_setVrty = function(vrty) {

		if (!gfn_isEmpty(vrty)) {
			console.log("vrty", vrty);
			vrtyCds = [];
			vrtyCds.push(vrty.vrtyCd);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
	var vrtyCds = [];
    const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			vrtyCds = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
				vrtyCds.push(vrtys[i].vrtyCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}
    
	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);
		}
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
		fn_getPrdcrs();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

// 	window.jsoninptCmndDsctnList =  [
// 	];

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
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
	        {caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'wrhsSeNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'trsprtSeNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["운송료"],		ref: 'trsprtCst',      type:'output',  width:'120px', hidden:true,   style:'text-align:right', format : {type:'number', rule:'#,### 원 '}},
	        {caption: ["등급"],		ref: 'grdNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["입고중량"],		ref: 'wrhsWght',      type:'output',  width:'100px',    style:'text-align:right', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg '}},
	        {caption: ["보관창고"],		ref: 'warehouseSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'wghno',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],		ref: 'pltno',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'rmrk',      type:'output',  width:'250px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
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
     * @name fn_rawMtrWrhsPrfmncSearch
     * @description 조회 버튼
     */
    const fn_rawMtrWrhsPrfmncSearch = async function() {
    	try{
    		console.log("Test");
 		   if (gfn_isEmpty(SBUxMethod.get("srch-dtp-startPrdctnYmd")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-endPrdctnYmd")))
 				   throw "입고일자는 필수입력 항목입니다.";
	        // set pagination
	    	inptCmndDsctnList.rebuild();
	    	let pageSize = inptCmndDsctnList.getPageSize();
	    	let pageNo = 1;
	
	    	// grid clear
	    	jsoninptCmndDsctnList.length = 0;
	    	inptCmndDsctnList.clearStatus();
	    	fn_setGrdRawMtrWrhsPrfmnc(pageSize, pageNo);
 	   } catch(e){
		   alert(e);
		   return;
	   }
	}
	const fn_setGrdRawMtrWrhsPrfmnc = async function(pageSize, pageNo) {
			console.log("Test");
	   		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-startPrdctnYmd");		// 입고시작일자
	   		let wrhsYmdTo = SBUxMethod.get("srch-dtp-endPrdctnYmd");		// 입고종료일자
	   		
	  		let wrhsSeCd = fn_getChkValue('chk-wrhsKnd', 4);	// 입고구분
	  		let gdsSeCd = fn_getChkValue('chk-gsd', 4);	// 입고구분
	  		let trsprtSeCd = fn_getChkValue('chk-trsprt', 3);	// 입고구분

	  		// optional
	  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
	  		let itemCd = SBUxMethod.get("srch-slt-itemCd");
			let vrtyCd = vrtyCds.length > 0 ? +vrtyCds.join(',') : "";
			const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsPrfmncList.do", {
				apcCd: gv_selectedApcCd,
				wrhsYmdFrom: wrhsYmdFrom,
				wrhsYmdTo: wrhsYmdTo,
				wrhsSeCd: wrhsSeCd,
				gdsSeCd: gdsSeCd,
				trsprtSeCd: trsprtSeCd,
				prdcrCd: prdcrCd,
				vrtyCd: vrtyCd,
				itemCd: itemCd,
	          	// pagination
	  	  		pagingYn : 'N',
	  			currentPageNo : pageNo,
	   		  	recordCountPerPage : pageSize
	  		});
			
	        const data = await postJsonPromise;
	 	   try{
			/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhs = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						apcNm: item.apcNm,
  						wrhsno: item.wrhsno,
  						wghno: item.wghno,
  						pltno: item.pltno,
  						wrhsYmd: item.wrhsYmd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						vhclno: item.vhclno,
  						bxQntt: item.bxQntt,
  						wrhsWght: item.wrhsWght,
  						bxKnd: item.bxKnd,
  						bxKndNm: item.bxKndNm,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						rmrk: item.rmrk,
  						trsprtCst: item.trsprtCst
  				}
  				jsoninptCmndDsctnList.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsoninptCmndDsctnList.length > 0) {
          		if(inptCmndDsctnList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			inptCmndDsctnList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			inptCmndDsctnList.rebuild();
  				}else{
  					inptCmndDsctnList.refresh();
  				}
          	} else {
          		inptCmndDsctnList.setPageTotalCount(totalRecordCount);
          		inptCmndDsctnList.rebuild();
          	}
          	document.querySelector('#listCount').innerText = totalRecordCount;
       } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
		}
	}
	
	function fn_getChkValue(id, len){
		result = [];
		for(var i=1; i<=len; i++){
			fullId = id+i;
			if(SBUxMethod.get(fullId)[fullId] == true)
				result.push(i);
		}
		if (result.length > 0)
			return result.join(',');
		else
			return "";
	}
	
</script>

</html>