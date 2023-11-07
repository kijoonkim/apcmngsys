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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 입고실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
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
								<sbux-datepicker uitype="popup" id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-startPrdctnYmd)"></sbux-datepicker>
							</td>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-endPrdctnYmd)"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" readonly></sbux-input>
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
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
									<sbux-checkbox
										id="dtl-chk-wrhsSeCd"
										name="dtl-chk-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonWrhsSeCd">
									</sbux-checkbox>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-gdsSeCd"
										name="dtl-chk-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonGdsSeCd">
									</sbux-checkbox>
								</p>
							</td>
					    	<th scope="row" class="th_bg">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-trsprtSeCd"
										name="dtl-chk-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonTrsprtSeCd">
									</sbux-checkbox>
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
								<sbux-input uitype="text" id="srch-inp-vhclno" name="srch-inp-vhclno" class="form-control input-sm" onkeyup="fn_onKeyVhclno(srch-inp-vhclno)"/>
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
							<td colspan="6" style="border-left: hidden;">&nbsp;</td>
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
							<div id="inptCmndDsctnGridArea" style="height:495px;"></div>
						</div>
					</div>
			</div>
		</div>
	</section>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
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

    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

    var jsonWrhsSeCd			= [];	// 입고구분 checkbox 검색
   	var jsonGdsSeCd				= [];	// 상품구분 checkbox 검색
    var jsonTrsprtSeCd			= [];	// 운송구분 checkbox 검색


	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),										// 품목
		 	gfn_setComCdSBSelect('dtl-chk-wrhsSeCd', jsonWrhsSeCd, 'WRHS_SE_CD'),											// 입고구분
		 	gfn_setComCdSBSelect('dtl-chk-gdsSeCd', jsonGdsSeCd, 'GDS_SE_CD', gv_selectedApcCd),							// 상품구분
		 	gfn_setComCdSBSelect('dtl-chk-trsprtSeCd', jsonTrsprtSeCd, 'TRSPRT_SE_CD'),										// 운송구분
	 	]);
		jsonWrhsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-wrhsSeCd');
		jsonGdsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-gdsSeCd');
		jsonTrsprtSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-trsprtSeCd');
	}

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	var vrtyCds = [];
	
    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			vrtyCds = [];
			vrtyCds.push(vrty.vrtyCd);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
	
    const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtys.push(vrtys[i].vrtyNm);
				vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}

    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		if (gfn_isEmpty(itemCd)) {
			vrtyCds = [];
		}
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}
    
	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("srch-inp-vhclno"));
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);
		}
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
		SBUxMethod.set("srch-dtp-startPrdctnYmd", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-endPrdctnYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
		fn_getPrdcrs();
	});
	
	const fn_dtpChange = function(){
		let startPrdctnYmd = SBUxMethod.get("srch-dtp-startPrdctnYmd");
		let endPrdctnYmd = SBUxMethod.get("srch-dtp-endPrdctnYmd");
		if(gfn_diffDate(startPrdctnYmd, endPrdctnYmd) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-startPrdctnYmd", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-endPrdctnYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}
	
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
	        {caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["참여조직명"],		ref: 'prdcrNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'wrhsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'trsprtSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["운송료"],		ref: 'trsprtCst',      type:'output',  width:'120px', hidden:true,   style:'text-align:right', format : {type:'number', rule:'#,### 원 '}},
	        {caption: ["등급"],		ref: 'grdNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["입고중량"],		ref: 'wrhsWght',      type:'output',  width:'100px',    style:'text-align:right', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg '}},
	        {caption: ["보관창고"],		ref: 'warehouseSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'wghno',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],		ref: 'pltno',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'rmrk',      type:'output',  width:'200px',    style:'text-align:center'},
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
     * @name fn_rawMtrWrhsPrfmncSearch
     * @description 조회 버튼
     */
    const fn_rawMtrWrhsPrfmncSearch = async function() {
    	try{
 		   if (gfn_isEmpty(SBUxMethod.get("srch-dtp-startPrdctnYmd")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-endPrdctnYmd"))){
 			  await gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
 	          return false;
 		   }
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
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-startPrdctnYmd");		// 입고시작일자
   		let wrhsYmdTo = SBUxMethod.get("srch-dtp-endPrdctnYmd");		// 입고종료일자
  		let wrhsSeCd = fn_getChkbox(jsonWrhsSeCd, SBUxMethod.get("dtl-chk-wrhsSeCd"));
  		let gdsSeCd = fn_getChkbox(jsonGdsSeCd, SBUxMethod.get("dtl-chk-gdsSeCd"))
  		let trsprtSeCd = fn_getChkbox(jsonTrsprtSeCd, SBUxMethod.get("dtl-chk-trsprtSeCd"))

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
  		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
  		let vhclno = SBUxMethod.get("srch-inp-vhclno");	// 차량번호
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = vrtyCds.length > 0 ? vrtyCds.join(',') : "";
		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			wrhsSeCd: wrhsSeCd,
			gdsSeCd: gdsSeCd,
			trsprtSeCd: trsprtSeCd,
			warehouseSeCd: warehouseSeCd,
			prdcrCd: prdcrCd,
			vrtyCd: vrtyCd,
			itemCd: itemCd,
			vhclno: vhclno,
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
        } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
     	}
	}

	function fn_getChkbox(json, result) {
		val = [];
		for(var key in result){
			if(result[key] == true)
				val.push(json[Number(key.substring(key.lastIndexOf('_')+1))].value);
		}

		return val.join(',');
	}

	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
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

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 찾기 버튼 클릭
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 모달 선택 콜백 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	const fn_onKeyVhclno = function(vhclno){
		if(getByteLengthOfString(vhclno) > 40){
			SBUxMethod.set("srch-inp-vhclno", "");
			return;
		}
    }

	/**
	 * @name fn_reset
	 * @description 상단 검색조건 초기화
	 */
	const fn_reset = function(){
		SBUxMethod.set("srch-dtp-startPrdctnYmd", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-endPrdctnYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-slt-itemCd", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		vrtyCds = [];
		fn_clearPrdcr();
		SBUxMethod.set('srch-inp-prdcrNm', "");
		jsonWrhsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-wrhsSeCd');
		jsonGdsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-gdsSeCd');
		jsonTrsprtSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-trsprtSeCd');
		SBUxMethod.set("srch-slt-warehouseSeCd", "");
		SBUxMethod.set("srch-inp-vhclno", "");
	}
</script>

</html>