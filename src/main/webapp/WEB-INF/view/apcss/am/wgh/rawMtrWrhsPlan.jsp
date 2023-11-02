<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 원물입고계획등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_setGrdWrhsPlan"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg">조회일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-planYmdFrom" name="srch-dtp-planYmdFrom" date-format="yyyy-mm-dd" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-planYmdFrom)"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-planYmdTo" name="srch-dtp-planYmdTo" date-format="yyyy-mm-dd" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-planYmdTo)"/>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<b>&nbsp;</b>
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
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg"><span class="data_required"></span>계획일시</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="dtl-dtp-planYmd" name="dtl-dtp-planYmd" class="form-control pull-right input-sm" date-format="yyyy-mm-dd HH:MM" show-time-bar="true"></sbux-datepicker>
							</td>
							<td >&nbsp;</td>
							<th class="ta_r th_bg"><span class="data_required"></span>생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocompleteDtl"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNmDtl(dtl-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNmDtl"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnDtlprdcr"
									name="btnDtlprdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcrDtl"
								></sbux-button>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
								<sbux-select id="dtl-slt-vrtyCd" name="dtl-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed" onchange=fn_onChangeSrchVrtyCd(this)></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-wrhsSeCd"
										name="dtl-rdo-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComWrhsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl">
									</sbux-radio>
								</p>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-gdsSeCd"
										name="dtl-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd">
									</sbux-radio>
								</p>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>운송구분</th>
							<td colspan="3">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-trsprtSeCd"
										name="dtl-rdo-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComTrsprtSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl">
									</sbux-radio>
								</p>
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg"><span class="data_required"></span>수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="dtl-inp-planQntt" name="dtl-inp-planQntt" class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="dtl-inp-planWght" name="dtl-inp-planWght" class="form-control input-sm input-sm-ast inpt_data_reqed"
									autocomplete="off"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
									<sbux-label uitype="normal" id="lbl-kg" name="lbl-chc" text="Kg"/>
							</td>
							<th class="ta_r th_bg">비고</th>
							<td colspan="7" class="td_input">
								<sbux-input uitype="text" id="dtl-inp-rmrk" name="dtl-inp-rmrk" class="form-control input-sm" placeholder="" />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>원물입고 계획</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld"></sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-sm btn-outline-danger" onclick="fn_uld" ></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-wrhsPlan" style="height:405px;"></div>
					</div>
				</div>


				<div class="row" style="display: none;">
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>원물계량계획샘플</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-excelWrhsPlan" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC 품목</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdItem" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC 품종</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdVrty" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>생산자</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdPrdcr" style="height:157px; width: 100%;"></div>
						</div>
					</div>
				</div>
				<div class="row" style="display: none;">
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>입고구분코드</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdWrhsSeCd" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>상품구분코드</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdGdsSeCd" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>운송구분코드</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdTrsprtSeCd" style="height:157px; width: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
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
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComWarehouse = [];
	var jsonComWrhsSeCd = [];
	var jsonComTrsprtSeCd = [];
	var jsonGrdWrhsSeCd = [];
	var jsonGrdGdsSeCd = [];
	var jsonComGdsSeCd = [];
	var jsonGrdTrsprtSeCd = [];
	var jsonApcItem = [];
	var jsonApcVrty = [];
	var jsonApcPrdcr = [];
	var jsonGrdApcItem = [];
	var jsonGrdApcVrty = [];

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrDtl		= [];
    var jsonPrdcrAutocomplete = [];
    var jsonPrdcrAutocompleteDtl = [];
    var autoCompleteDataJson = [];

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();

		SBUxMethod.set("srch-dtp-planYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-planYmdTo", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
		fn_getPrdcrs();
	});

	/**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdWrhsPlan', 	jsonGrdWrhsSeCd, 	'WRHS_SE_CD'), 		// 입고구분 그리드
			gfn_setComCdSBSelect('grdWrhsPlan', 	jsonGrdGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 그리드
			gfn_setComCdSBSelect('grdWrhsPlan', 	jsonGrdTrsprtSeCd, 	'TRSPRT_SE_CD'), 	// 운송구분 그리드
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 	jsonComGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록

			gfn_setPrdcrSBSelect('grdWrhsPlan', 		jsonApcPrdcr,  gv_selectedApcCd), 	// 생산자 등록
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 	jsonApcItem, gv_selectedApcCd),		// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 	jsonApcVrty, gv_selectedApcCd),		// 품종
			gfn_setApcItemSBSelect('grdWrhsPlan', 		jsonGrdApcItem, gv_selectedApcCd),	// 품목 그리드
			gfn_setApcVrtySBSelect('grdWrhsPlan', 		jsonGrdApcVrty, gv_selectedApcCd),	// 품종 그리드

		]);

		grdWrhsPlan.refresh({"combo":true});

		let result = await Promise.all([
    		gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
    		gfn_getComCdDtls('TRSPRT_SE_CD')	// 운송구분
		]);

		jsonComWrhsSeCd = gfn_getJsonFilter(result[0], 'cdVl', ["1", "2", "3"]);
		jsonComTrsprtSeCd = result[1];

		SBUxMethod.refresh('dtl-rdo-wrhsSeCd');
		SBUxMethod.refresh('dtl-rdo-trsprtSeCd');
		SBUxMethod.set('dtl-rdo-wrhsSeCd', '3');
		SBUxMethod.set('dtl-rdo-gdsSeCd', '1');
		SBUxMethod.set('dtl-rdo-trsprtSeCd', '1');
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;	//SBUxMethod.get("srch-slt-itemCd");
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)	// 품종
		]);
	}
	
	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});
		
		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = vrtyInfo.mastervalue;
		} else {
			itemCd = SBUxMethod.get("dtl-slt-itemCd");
		}

		const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("dtl-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("dtl-slt-vrtyCd", vrtyCd);
		}
	}

	var jsonWrhsPlan = [];; // 그리드를 담기위한 객체 선언

	const fn_createGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-wrhsPlan';
	    SBGridProperties.id = 'grdWrhsPlan';
	    SBGridProperties.jsonref = 'jsonWrhsPlan';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["계획일자"],		ref: 'planYmd',			type:'output',  width:'140px',    style:'text-align:center',
		    	format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
	        {caption: ["계획시간"],		ref: 'planHr',      	type:'output',  width:'80px',    style:'text-align:center',
	        	format : {type:'date', rule:'HH:mm', origin : 'HHmm' }},
	        {caption: ["품목"], 	ref: 'itemCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 	ref: 'vrtyCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 	ref: 'prdcrCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonApcPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["입고구분"], 	ref: 'wrhsSeCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdWrhsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["상품구분"], 	ref: 'gdsSeCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["운송구분"], 	ref: 'trsprtSeCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdTrsprtSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["계획수량"],		ref: 'planQntt',      	type:'output',  width:'100px',    style:'text-align:right'},
	        {caption: ["계획중량"],		ref: 'planWght',      	type:'output',  width:'100px',    style:'text-align:right',
    				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
	        {caption: ["비고"],			ref: 'rmrk',      		type:'output',  width:'400px',    style:'text-align:center'},
	        {caption: ["APC코드"],		ref: 'apcCd',   	hidden: true},
	        {caption: ["계획번호"],		ref: 'planno',   	hidden: true},
	        {caption: ["창고구분"],		ref: 'warehouseSeCd',   hidden: true},
	        {caption: ["엑셀유무"],		ref: 'excelYn',   hidden: true},
	    ];

	    grdWrhsPlan = _SBGrid.create(SBGridProperties);

	}


	const fn_procRow = function (gubun, nRow, nCol){
		if(gubun == "ADD"){
			let planYmdHr = SBUxMethod.get("dtl-dtp-planYmd");
			if (gfn_isEmpty(planYmdHr)) {
	  			gfn_comAlert("W0001", "계획일시");		//	W0002	{0}을/를 선택하세요.
	            return;
	  		}
			let planYmd = planYmdHr.substr(0,8)
			let planHr = planYmdHr.substr(8,4)
			let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");
			let prdcrNm = SBUxMethod.get("dtl-inp-prdcrNm");
			let itemCd = SBUxMethod.get("dtl-slt-itemCd");
			let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");
			let wrhsSeCd = SBUxMethod.get("dtl-rdo-wrhsSeCd");
			let gdsSeCd = SBUxMethod.get("dtl-rdo-gdsSeCd");
			let trsprtSeCd = SBUxMethod.get("dtl-rdo-trsprtSeCd");
			let planQntt = SBUxMethod.get("dtl-inp-planQntt");
			let planWght = SBUxMethod.get("dtl-inp-planWght");
			let rmrk = SBUxMethod.get("dtl-inp-rmrk");


			if (gfn_isEmpty(prdcrCd)) {
	  			gfn_comAlert("W0001", "생산자");		//	W0002	{0}을/를 선택하세요.
	            return;
	  		}
			if (gfn_isEmpty(itemCd)) {
	  			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
	            return;
	  		}
			if (gfn_isEmpty(vrtyCd)) {
	  			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
	            return;
	  		}
			if (gfn_isEmpty(planWght)) {
	  			gfn_comAlert("W0005", "중량");		//	W0005	{0}이/가 없습니다.
	            return;
	  		}

			grdWrhsPlan.setCellData(nRow, nCol, "N", true);
			grdWrhsPlan.setCellData(nRow, 1, planYmd, true);
			grdWrhsPlan.setCellData(nRow, 2, planHr, true);
			grdWrhsPlan.setCellData(nRow, 3, itemCd, true);
			grdWrhsPlan.setCellData(nRow, 4, vrtyCd, true);

			grdWrhsPlan.setCellData(nRow, 5, prdcrCd, true);
			grdWrhsPlan.setCellData(nRow, 6, wrhsSeCd, true);
			grdWrhsPlan.setCellData(nRow, 7, gdsSeCd, true);
			grdWrhsPlan.setCellData(nRow, 8, trsprtSeCd, true);
			grdWrhsPlan.setCellData(nRow, 9, planQntt, true);
			grdWrhsPlan.setCellData(nRow, 10, planWght, true);
			grdWrhsPlan.setCellData(nRow, 11, rmrk, true);

			grdWrhsPlan.setCellData(nRow, 12, gv_selectedApcCd, true);
			grdWrhsPlan.setCellData(nRow, 15, "N", true);

			grdWrhsPlan.refresh();
			grdWrhsPlan.setCellDisabled(0, 0, grdWrhsPlan.getRows() - 1, grdWrhsPlan.getCols() - 1, true);
			grdWrhsPlan.addRow(true);


		}
		else if(gubun == "DEL"){

			let rowData = grdWrhsPlan.getRowData(nRow);
			let rowStts = grdWrhsPlan.getRowStatus(nRow);
			let excelYn = rowData.excelYn;

			if(excelYn == "N"){
				if(rowStts == 0 || rowStts == 2){
	        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
	        		if(confirm(delMsg)){
	        			var wrhsPlan = grdWrhsPlan.getRowData(nRow);
	        			fn_deleteWrhsPlan(wrhsPlan);
	        			grdWrhsPlan.deleteRow(nRow);
	        		}
	        	}else{
	        		grdWrhsPlan.deleteRow(nRow);
	        	}
			}else{
				grdWrhsPlan.deleteRow(nRow);
			}

		}
	}


	const fn_setGrdWrhsPlan = async function(){
		let planYmdFrom = SBUxMethod.get("srch-dtp-planYmdFrom");
		let planYmdTo = SBUxMethod.get("srch-dtp-planYmdTo");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");

		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsPlanList.do", {
			apcCd			: gv_selectedApcCd,
			planYmdFrom		: planYmdFrom,
			planYmdTo		: planYmdTo,
			prdcrCd			: prdcrCd
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonWrhsPlan.length = 0;
          	data.resultList.forEach((item, index) => {
          		const wrhsPlan = {
          				apcCd: item.apcCd,
          				planno: item.planno,
          				planYmd: item.planYmd,
          				planHr: item.planHr,
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
          				warehouseSeCd: item.warehouseSeCd,
          				warehouseSeNm: item.warehouseSeNm,
          				planQntt: item.planQntt,
          				planWght: item.planWght,
          				rmrk: item.rmrk,
          				delYn: item.delYn,
          				excelYn : "N"
  				}
          		jsonWrhsPlan.push(wrhsPlan);
  			});
          	grdWrhsPlan.refresh();
          	grdWrhsPlan.addRow();
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
	}

	const fn_save = async function(){

		let allData = grdWrhsPlan.getGridDataAll();

		let insertCnt = 0;
		const insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdWrhsPlan.getRowData(i);
			const rowSts = grdWrhsPlan.getRowStatus(i);
			const delYn = rowData.delYn;
			const excelYn = rowData.excelYn;

			if(!gfn_isEmpty(delYn)){

				if(excelYn === "N"){
					if (rowSts === 1){
						insertList.push(rowData);
					} else {
						continue;
					}
				}else{
					const itemCd = rowData.itemCd;
					const vrtyCd = rowData.vrtyCd;
					const prdcrCd = rowData.prdcrCd;
					const wrhsSeCd = rowData.wrhsSeCd;
					const gdsSeCd = rowData.gdsSeCd;
					const trsprtSeCd = rowData.trsprtSeCd;

					if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){
						if(gfn_comboValidation(jsonGrdApcItem, itemCd) != "Y" || gfn_isEmpty(itemCd)){
							gfn_comAlert("W0005", "품목") 	// W0005	{0}이/가 없습니다.
							return;
						}
						if(gfn_comboValidation(jsonGrdApcVrty, vrtyCd) != "Y" || gfn_isEmpty(vrtyCd)){
							gfn_comAlert("W0005", "품종") 	// W0005	{0}이/가 없습니다.
							return;
						}
						if(gfn_comboValidation(jsonApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
							gfn_comAlert("W0005", "입고구분") 	// W0005	{0}이/가 없습니다.
							return;
						}
						if(gfn_comboValidation(jsonGrdWrhsSeCd, wrhsSeCd) != "Y" || gfn_isEmpty(wrhsSeCd)){
							gfn_comAlert("W0005", "입고구분") 	// W0005	{0}이/가 없습니다.
							return;
						}

						if(gfn_comboValidation(jsonGrdGdsSeCd, gdsSeCd) != "Y" || gfn_isEmpty(gdsSeCd)){
							gfn_comAlert("W0005", "상품구분") 	// W0005	{0}이/가 없습니다.
							return;
						}

						if(gfn_comboValidation(jsonGrdTrsprtSeCd, trsprtSeCd) != "Y" || gfn_isEmpty(trsprtSeCd)){
							gfn_comAlert("W0005", "운송구분") 	// W0005	{0}이/가 없습니다.
							return;
						}
						rowData.apcCd = gv_selectedApcCd;
						insertList.push(rowData);
					}else{
						continue;
					}
				}
			}
		}

		if (insertList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/wrhs/insertRawMtrWrhsPlanList.do", insertList);

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_setGrdWrhsPlan();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	const fn_deleteWrhsPlan = async function(wrhsPlanVO){
		const postJsonPromise = gfn_postJSON("/am/wrhs/deleteRawMtrWrhsPlan.do", wrhsPlanVO);
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_setGrdWrhsPlan();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	const fn_reset = function(){
		SBUxMethod.set("srch-dtp-planYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-planYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-dtp-planYmd", "");
		fn_clearPrdcr();
		SBUxMethod.set("srch-inp-prdcrNm", "");
		fn_clearPrdcrDtl();
		SBUxMethod.set("dtl-inp-prdcrNm", "");
		SBUxMethod.set("dtl-slt-itemCd", "");
		SBUxMethod.set("dtl-slt-vrtyCd", "");
		SBUxMethod.set('dtl-rdo-wrhsSeCd', '3');
		SBUxMethod.set('dtl-rdo-gdsSeCd', '1');
		SBUxMethod.set('dtl-rdo-trsprtSeCd', '1');
		SBUxMethod.set("dtl-inp-planQntt", "");
		SBUxMethod.set("dtl-inp-planWght", "");
		SBUxMethod.set("dtl-inp-rmrk", "");
	}

	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
		jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcr);
	}
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 팝업 호출
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
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
		SBUxMethod.set("srch-inp-prdcrCd", "");
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
	/*
	* 조회조건 생산자 팝업 관련 function
	* End
	*/



	/*
	* 상세 정보 생산자 팝업 관련 function
	* Start
	*/
	const fn_choicePrdcrDtl = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcrDtl);
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcrDtl = function(jsonPrdcrDtl) {
		if (!gfn_isEmpty(jsonPrdcrDtl)) {
			SBUxMethod.set("dtl-inp-prdcrCd", jsonPrdcrDtl.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", jsonPrdcrDtl.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			SBUxMethod.set("dtl-slt-itemCd", jsonPrdcrDtl.rprsItemCd);
			SBUxMethod.set("dtl-slt-vrtyCd", jsonPrdcrDtl.rprsVrtyCd);
			SBUxMethod.set("dtl-rdo-gdsSeCd", jsonPrdcrDtl.gdsSeCd);
			SBUxMethod.set("dtl-rdo-wrhsSeCd", jsonPrdcrDtl.wrhsSeCd);
			SBUxMethod.set("dtl-rdo-trsprtSeCd", jsonPrdcrDtl.trsprtSeCd);
		}
	}

	/**
	 * @name fn_onKeyUpPrdcrNmDtl
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNmDtl = function(prdcrNm){
		fn_clearPrdcrDtl();
		jsonPrdcrAutocompleteDtl = gfn_filterFrst(prdcrNm, jsonPrdcrDtl);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcrDtl
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcrDtl = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	const fn_onSelectPrdcrNmDtl= function(value, label, item) {
		SBUxMethod.set("dtl-inp-prdcrCd", value);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}
	/*
	* 상세 정보 생산자 팝업 관련 function
	* End
	*/


	/*
	* 엑셀 다운로드(샘플양식)
	*/
	var grdExcelWrhsPlan;
	var grdExcelItem;
	var grdExcelVrty;
	var grdExcelPrdcr;
	var grdExcelWrhsSeCd;
	var grdExcelGdsSeCd;
	var grdExcelTrsprtSeCd;

	var jsonExcelWrhsPlan = [];
	var jsonExcelItem = [];
	var jsonExcelVrty = [];
	var jsonExcelPrdcr = [];
	var jsonExcelWrhsSeCd = [];
	var jsonExcelGdsSeCd = [];
	var jsonExcelTrsprtSeCd = [];
	const fn_dwnld = async function(){

		var SBGridPropertiesWrhsPlan = {};
		SBGridPropertiesWrhsPlan.parentid = 'sb-area-excelWrhsPlan';
		SBGridPropertiesWrhsPlan.id = 'grdExcelWrhsPlan';
		SBGridPropertiesWrhsPlan.jsonref = 'jsonExcelWrhsPlan';
		SBGridPropertiesWrhsPlan.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesWrhsPlan.selectmode = 'byrow';
		SBGridPropertiesWrhsPlan.extendlastcol = 'scroll';
		SBGridPropertiesWrhsPlan.columns = [
			{caption: ["처리"], 		ref: 'delYn',  type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["계획일자"],		ref: 'planYmd',			type:'output',  width:'140px',    style:'text-align:center',
		    	format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
	        {caption: ["계획시간"],		ref: 'planHr',      	type:'output',  width:'80px',    style:'text-align:center',
	        	format : {type:'date', rule:'HH:mm', origin : 'HHmm' }},
	        {caption: ["품목"], 	ref: 'itemCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 	ref: 'vrtyCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 	ref: 'prdcrCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonApcPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["입고구분"], 	ref: 'wrhsSeCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdWrhsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["상품구분"], 	ref: 'gdsSeCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["운송구분"], 	ref: 'trsprtSeCd',   	type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdTrsprtSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["계획수량"],		ref: 'planQntt',      	type:'output',  width:'100px',    style:'text-align:right'},
	        {caption: ["계획중량"],		ref: 'planWght',      	type:'output',  width:'100px',    style:'text-align:right'},
	        {caption: ["비고"],			ref: 'rmrk',      	type:'output',  width:'100px',    style:'text-align:right'},
	    ];

	    grdExcelWrhsPlan = _SBGrid.create(SBGridPropertiesWrhsPlan);
	    grdExcelWrhsPlan.addRow(true,{
	    				    delYn		: "N"
	    				  ,	planYmd 	: gfn_dateToYmd(new Date())
	    				  , planHr  	: "0900"
	    			      , itemCd		: "0101"
	    			      , vrtyCd		: "2000"
	    			      , prdcrCd		: "0001"
	    			      , wrhsSeCd	: "1"
	    			      , gdsSeCd		: "1"
	    			      , trsprtSeCd	: "1"
	    			      , planQntt    : "50"
	    			      , planWght	: "500"
	    			      , rmrk		: "1"
	    				})



		var SBGridPropertiesItem = {};
	    SBGridPropertiesItem.parentid = 'sb-area-grdItem';
	    SBGridPropertiesItem.id = 'grdExcelItem';
	    SBGridPropertiesItem.jsonref = 'jsonExcelItem';
	    SBGridPropertiesItem.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesItem.selectmode = 'byrow';
	    SBGridPropertiesItem.extendlastcol = 'scroll';
	    SBGridPropertiesItem.columns = [
	    	{caption: ["코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'}
	    ];
	    grdExcelItem = _SBGrid.create(SBGridPropertiesItem);

		var SBGridPropertiesVrty = {};
		SBGridPropertiesVrty.parentid = 'sb-area-grdVrty';
		SBGridPropertiesVrty.id = 'grdExcelVrty';
		SBGridPropertiesVrty.jsonref = 'jsonExcelVrty';
		SBGridPropertiesVrty.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesVrty.selectmode = 'byrow';
		SBGridPropertiesVrty.extendlastcol = 'scroll';
		SBGridPropertiesVrty.columns = [
	    	{caption: ["품종코드"],     ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["품종명칭"],     ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["품목코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'}
	    ];
	    grdExcelVrty = _SBGrid.create(SBGridPropertiesVrty);

		var SBGridPropertiesPrdcr = {};
		SBGridPropertiesPrdcr.parentid = 'sb-area-grdPrdcr';
		SBGridPropertiesPrdcr.id = 'grdExcelPrdcr';
		SBGridPropertiesPrdcr.jsonref = 'jsonExcelPrdcr';
		SBGridPropertiesPrdcr.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesPrdcr.selectmode = 'byrow';
		SBGridPropertiesPrdcr.extendlastcol = 'scroll';
		SBGridPropertiesPrdcr.columns = [
	    	{caption: ["생산자코드"],   ref: 'prdcrCd',  	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["생산자명"],    ref: 'prdcrNm',  	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ['대표품목'],	ref: 'rprsItemCd', 	type: 'output', width: '80px', style: 'text-align:center'},
	        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type: 'output', width: '80px', style: 'text-align:center'}
	    ];
	    grdExcelPrdcr = _SBGrid.create(SBGridPropertiesPrdcr);

	    var SBGridPropertiesWrhsSeCd = {};
		SBGridPropertiesWrhsSeCd.parentid = 'sb-area-grdWrhsSeCd';
		SBGridPropertiesWrhsSeCd.id = 'grdExcelWrhsSeCd';
		SBGridPropertiesWrhsSeCd.jsonref = 'jsonExcelWrhsSeCd';
		SBGridPropertiesWrhsSeCd.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesWrhsSeCd.selectmode = 'byrow';
		SBGridPropertiesWrhsSeCd.extendlastcol = 'scroll';
		SBGridPropertiesWrhsSeCd.columns = [
	    	{caption: ["입고구분코드"],   	ref: 'wrhsSeCd',  	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["입고구분코드명"],  	ref: 'wrhsSeNm',  	type:'output',  width:'100px',    style:'text-align:center'},
	    ];
	    grdExcelWrhsSeCd = _SBGrid.create(SBGridPropertiesWrhsSeCd);

		var SBGridPropertiesGdsSeCd = {};
		SBGridPropertiesGdsSeCd.parentid = 'sb-area-grdGdsSeCd';
		SBGridPropertiesGdsSeCd.id = 'grdExcelGdsSeCd';
		SBGridPropertiesGdsSeCd.jsonref = 'jsonExcelGdsSeCd';
		SBGridPropertiesGdsSeCd.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesGdsSeCd.selectmode = 'byrow';
		SBGridPropertiesGdsSeCd.extendlastcol = 'scroll';
		SBGridPropertiesGdsSeCd.columns = [
	    	{caption: ["상품구분코드"],   	ref: 'gdsSeCd',  	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["상품구분코드명"],  	ref: 'gdsSeNm',  	type:'output',  width:'100px',    style:'text-align:center'},
	    ];
	    grdExcelGdsSeCd = _SBGrid.create(SBGridPropertiesGdsSeCd);

		var SBGridPropertiesTrsprtSeCd = {};
		SBGridPropertiesTrsprtSeCd.parentid = 'sb-area-grdTrsprtSeCd';
		SBGridPropertiesTrsprtSeCd.id = 'grdExcelTrsprtSeCd';
		SBGridPropertiesTrsprtSeCd.jsonref = 'jsonExcelTrsprtSeCd';
		SBGridPropertiesTrsprtSeCd.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesTrsprtSeCd.selectmode = 'byrow';
		SBGridPropertiesTrsprtSeCd.extendlastcol = 'scroll';
		SBGridPropertiesTrsprtSeCd.columns = [
	    	{caption: ["운송구분코드"],   	ref: 'trsprtSeCd',  	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["운송구분코드명"],  	ref: 'trsprtSeNm',  	type:'output',  width:'100px',    style:'text-align:center'},
	    ];
	    grdExcelTrsprtSeCd = _SBGrid.create(SBGridPropertiesTrsprtSeCd);

	    let rst = await Promise.all([
		    fn_selectItemList(),
		    fn_selectVrtyList(),
		    fn_selectPrdcrList(),
		    fn_selectWrhsSeCdList(),
		    fn_selectGdsSeCdList(),
		    fn_selectTrsprtSeCdList()
	    ]);

		exportExcel();

	}

	const fn_selectItemList = async function(){
		let apcCd = gv_selectedApcCd;
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcCmnsItemList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        try{
        	jsonExcelItem.length = 0;
        	data.resultList.forEach((item, index) => {
				let itemVO = {
					itemCd 		: item.itemCd
				  , itemNm 		: item.itemNm
				  , apcCd		: apcCd
				}
				jsonExcelItem.push(itemVO);
			});
        	grdExcelItem.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_selectVrtyList = async function(){
		let apcCd = gv_selectedApcCd;
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcVrtyList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        try{
        	jsonExcelVrty.length = 0;
        	data.resultList.forEach((item, index) => {
				let vrtyVO = {
					vrtyCd 		: item.vrtyCd
				  , vrtyNm 		: item.vrtyNm
				  , itemCd		: item.itemCd
				}
				jsonExcelVrty.push(vrtyVO);
			});
        	grdExcelVrty.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	const fn_selectPrdcrList = async function(){
		let apcCd = gv_selectedApcCd;
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        try{
        	jsonExcelPrdcr.length = 0;
        	data.resultList.forEach((item, index) => {
        		const prdcr = {
						prdcrCd			: item.prdcrCd,
					    prdcrNm 		: item.prdcrNm,
					    rprsItemCd 		: item.rprsItemCd,
					    rprsVrtyCd 		: item.rprsVrtyCd,
					}
				jsonExcelPrdcr.push(prdcr);
			});
        	grdExcelPrdcr.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_selectWrhsSeCdList = async function(){
		let apcCd = gv_selectedApcCd;
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {cdId : "WRHS_SE_CD", delYn : "N"});
        let data = await postJsonPromise;
        try{
        	jsonExcelWrhsSeCd.length = 0;
        	data.resultList.forEach((item, index) => {
        		const wrhsSeCd = {
        				wrhsSeCd		: item.cdVl,
        				wrhsSeNm 		: item.cdVlNm,
					}
				jsonExcelWrhsSeCd.push(wrhsSeCd);
			});
        	grdExcelWrhsSeCd.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_selectGdsSeCdList = async function(){
		let apcCd = gv_selectedApcCd;
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {apcCd : apcCd, cdId : "GDS_SE_CD", delYn : "N"});
        let data = await postJsonPromise;
        try{
        	jsonExcelGdsSeCd.length = 0;
        	data.resultList.forEach((item, index) => {
        		const gdsSeCd = {
						gdsSeCd			: item.cdVl,
					    gdsSeNm 		: item.cdVlNm,
					}
				jsonExcelGdsSeCd.push(gdsSeCd);
			});
        	grdExcelGdsSeCd.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_selectTrsprtSeCdList = async function(){
		let apcCd = gv_selectedApcCd;
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {cdId : "TRSPRT_SE_CD", delYn : "N"});
        let data = await postJsonPromise;
        try{
        	jsonExcelWrhsSeCd.length = 0;
        	data.resultList.forEach((item, index) => {
        		const trsprtSeCd = {
        				trsprtSeCd		: item.cdVl,
        				trsprtSeNm 		: item.cdVlNm,
					}
				jsonExcelTrsprtSeCd.push(trsprtSeCd);
			});
        	grdExcelTrsprtSeCd.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	function exportExcel(){

		var objExcelInfo = {
			"strFileName" : "원물계량등록샘플및코드.xlsx",       //필수
			"strAction" : "/saveExcel.do",     //필수
			"bIsStyle" : true,
			"bIsMerge" : true,
			"bUseFormat" : false,
			"bIncludeData" : true,
			"bUseCompress":false,
			"arrAdditionalData" :[]		//addGridToExcel 메소드 내 "(1)엑셀 시트별 그리드 데이터 지정" 데이터를 파라미터로 넘길 때 사용예정
		};
		objExcelInfo = addGridToExcel(objExcelInfo, ["grdExcelItem","grdExcelVrty", "grdExcelPrdcr", "grdExcelWrhsSeCd", "grdExcelGdsSeCd", "grdExcelTrsprtSeCd"]);
		grdExcelWrhsPlan.exportExcel(objExcelInfo);
	};


	/*
	다중시트 엑셀 다운로드
	param1: 엑셀다운로드 그리드 기본정보
	*/
	function addGridToExcel(objExcelInfo, arrGridId){

        var arrGridList = [];

        /*(1)엑셀 시트별 그리드 데이터 지정*/
        var arrGridSheetName = ["원물계량등록샘플","품목","품종","생산자", "입고구분", "상품구분", "운송구분"];		//엑셀파일 하단 시트 제목
        var arrTitle = ["원물계량등록샘플","품목","품종","생산자", "입고구분", "상품구분", "운송구분"];		//각 시트별 그리드 제목
        var arrUnit = ["","","","","","",""];		//각 시트별 그리드 소제목

        for(var i=0; i<arrGridId.length; i++){

           var currentGrid = window[arrGridId[i]];
           var data = currentGrid.exportExcel(objExcelInfo, "return");		//그리드 기본정보를 제외한 각 그리드의 데이터와 메타데이터를 뽑음

           arrGridList.push(data);		  //메타 데이터를 arrGridList에 담음
        };

        /* 엑셀 다운로드 시 그리드 정보 이외의 값을 파라미터로 전달 가능한 속성 arrAdditionalData 사용*/
        objExcelInfo.arrAdditionalData.push(
           { "name" : "arrSheetData", "value":  JSON.stringify(arrGridList) },	//그리드 전체 메타데이터
           { "name" : "arrSheetName", "value":  JSON.stringify(arrGridSheetName)},
           { "name" : "arrTitle", "value":  JSON.stringify(arrTitle)},
           { "name" : "arrUnit", "value":  JSON.stringify(arrUnit)}
        );
        return objExcelInfo;
     };

     const importExcelData = function (e){
    	 jsonWrhsPlan.length =0;
    	 grdWrhsPlan.rebuild();

    	 grdWrhsPlan.importExcelData(e);
     }

     const fn_uld = function(){
    	 $("#btnFileUpload").click();
     }

     const fn_dtpChange = function(){
 		let planYmdFrom = SBUxMethod.get("srch-dtp-planYmdFrom");
 		let planYmdTo = SBUxMethod.get("srch-dtp-planYmdTo");
 		if(gfn_diffDate(planYmdFrom, planYmdTo) < 0){
 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-planYmdFrom", gfn_dateToYmd(new Date()));
 			SBUxMethod.set("srch-dtp-planYmdTo", gfn_dateToYmd(new Date()));
 			return;
 		}
 	}
     
     const fn_onChangeApc = async function() {
 		fn_clearPrdcr();
 		fn_clearPrdcrDtl();
 		fn_initSBSelect();
 		fn_getPrdcrs();
 	}
</script>
</html>