
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 수매집계 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
							id="btnWrhsHr"
							name="btnWrhsHr"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_rawMtrHr"
							text="시간별입고"
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

				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
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
							<th class="ta_r th_bg">APC명</th>
							<td colspan="2"  class="td_input" style="border-right: hidden">
								<%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
							</td>
							<td></td>
							<th class="ta_r th_bg">검수일자</th>
							<td colspan="2"  class="td_input" style="border-right: hidden">
								<div style="display: flex; gap: 3px">
									<sbux-datepicker
											id="srch-dtp-igiYmdFrom"
											name="srch-dtp-igiYmdFrom"
											uitype="popup"
											wrap-style="flex:1;"
											date-format="yyyy-mm-dd"
											class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
											onchange="fn_dtpChange(srch-dtp-igiYmdFrom)"
									></sbux-datepicker>
									<sbux-datepicker
											id="srch-dtp-igiYmdTo"
											name="srch-dtp-igiYmdTo"
											uitype="popup"
											wrap-style="flex:1;"
											date-format="yyyy-mm-dd"
											class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
											onchange="fn_dtpChange(srch-dtp-igiYmdTo)"
									></sbux-datepicker>
								</div>
							</td>
							<td style="border-right: hidden"></td>
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
										oninput="fn_onInputPrdcrNm(event)"
										autocomplete-select-callback="fn_onSelectPrdcrNm"
										autocomplete-height="270px"
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
										id="btnSrchPrdcr"
										name="btnSrchPrdcr"
										class="btn btn-xs btn-outline-dark"
										text="찾기"
										uitype="modal"
										target-id="modal-prdcr"
										onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">

					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>수기입력 대장</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">

						</div>
					</div>

					<div class="table-responsive tbl_scroll_sm" style="width:100%">
						<div id="sb-area-rawMtrWrhsIgi" style="height:614px; width:100%"></div>
					</div>

				</div>
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
				header-is-close-button="false"
				style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-prdcr">
		<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
	</div>

	<!-- 생산자 선택 Modal -->
	<div>
		<sbux-modal
				id="modal-rawMtrHrPrfmnc"
				name="modal-rawMtrHrPrfmnc"
				uitype="middle"
				header-title="시간별 입고"
				body-html-id="body-modal-rawMtrHrPrfmnc"
				footer-is-close-button="false"
				header-is-close-button="false"
				style="width:460px"
		></sbux-modal>
	</div>
	<div id="body-modal-rawMtrHrPrfmnc">
		<jsp:include page="../../am/popup/rawMtrHrPrfmncPopup.jsp"></jsp:include>
	</div>



</body>
<script type="text/javascript">

	var jsonRawMtrWrhsIgi = [];
	var grdRawMtrWrhsIgi;

	var jsonPrdcr					= [];
	var jsonPrdcrDtl				= [];
	var jsonPrdcrAutocomplete 		= [];
	var jsonPrdcrAutocompleteDtl 	= [];
	var jsonStrgLoctnCd = [];
	var jsonIgiJgmtCd = [];
	var jsonRwArtclCd = [];
	var jsonIgiGrdCd = [];
	var jsonIgiGrdRt = [];
	var jsonGrdPrdcr = [];
	const year = gfn_dateToYear(new Date());
	const month = 6;		// 수매월 정의

	var jsonComSmplYn = [{'label' : "샘플", 'value' : 'Y'}];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setPrdcrSBSelect('grdRawMtrWrhsIgi', 	jsonGrdPrdcr, 			gv_selectedApcCd),		// Grid 생산자
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonStrgLoctnCd,  		'STRG_LOCTN_CD', 	gv_selectedApcCd),		// 저장위치코드
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiJgmtCd,  		'IGI_JGMT_CD', 		gv_selectedApcCd),		// 검수판정
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonRwArtclCd,  		'RW_ARTCL_CD',  	gv_selectedApcCd),		// 감량항목
		]);

		grdRawMtrWrhsIgi.refresh({"combo":true})

		SBUxMethod.set('srch-dtp-igiYmdFrom', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-dtp-igiYmdTo', gfn_dateToYmd(new Date()));
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		fn_getPrdcrs();
		fn_initSBSelect();
		fn_createRawMtrWrhsIgiGrid();
	})


	const fn_rawMtrHr = async function () {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let yr = SBUxMethod.get("srch-dtp-yr");
		SBUxMethod.openModal('modal-rawMtrHrPrfmnc');
		await popRawMtrHrPrfmnc.init(gv_selectedApcCd);
	}

	/**
	 * @name fn_createRawMtrWrhsIgiGrid
	 * @description 담당자별 Grid
	 */
	const fn_createRawMtrWrhsIgiGrid = async function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-rawMtrWrhsIgi";
		SBGridProperties.id = "grdRawMtrWrhsIgi";
		SBGridProperties.jsonref = "jsonRawMtrWrhsIgi";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.useinitsorting = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.filtering = true;
		SBGridProperties.contextmenu = true;					// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListRawMtrWrhsIgi;	// 우클릭 메뉴 리스트

		let columns = [
			{caption : ['처리', '처리'], 		ref: 'delYn',  type:'button',  width:'60px', filtering: { usemode: false },   style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
				if (gfn_isEmpty(strValue)) {
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRawMtrWrhsIgi(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
				} else {
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRawMtrWrhsIgi(\"DEL\", " + nRow + ")'>삭제</button>";
				}}},
			{caption : ['일자', '일자'], 						ref: 'igiYmd', 		type : 'datepicker', 	width: '100px', filtering: { usemode: false }, style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption: ['생산자', '생산자'], 						ref: 'prdcrCd', 		type:'inputcombo',  width: '110px', filtering: {uitype : 'checklist^', listsearch: true, sort:'asc'},	style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption : ['지역', '지역'], 						ref: 'frmhsNm', 		type: 'output', filtering: { usemode: false },	 style:'text-align:center;'},
			{caption : ['검수<br>판정', '검수<br>판정'], 					ref: 'igiJgmtCd', 		type:'combo',  		width: '60px', filtering: {uitype : 'checklist^', sort:'asc'}, style:'text-align:center;',
				typeinfo : {ref:'jsonIgiJgmtCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption : ['샘플링<br>여부', '샘플링<br>여부'], 		ref: 'smplYn', 			type:'combo',  		width: '70px', filtering: {uitype : 'checklist^', sort:'asc'}, style:'text-align:center;',
				typeinfo : {ref:'jsonComSmplYn', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption : ['입고<br>톤백수량', '입고<br>톤백수량'], 	ref: 'igiGrdQnttTot', 	type: 'output', 		width: '60px', filtering: { usemode: false }, style:'text-align:right;', format : {type:'number', rule:'#,###'}},
		];

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiGrdCd,  		'IGI_GRD_CD', 	gv_selectedApcCd),		// 검수등급
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiGrdRt,  		'IGI_GRD_RT',  	gv_selectedApcCd),		// 검수비율
		]);

		for (var i=1; i<=jsonIgiGrdCd.length; i++) {

			let igiGrdCdCaption = jsonIgiGrdCd[i-1].text;
			let igiGrdQnttRef = 'igiGrdQntt' + i;
			columns.push(
					{
						caption : ['등급별 톤백수량', igiGrdCdCaption],
						ref: igiGrdQnttRef,
						type: 'input',
						width: '50px',
						filtering: { usemode: false },
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}

		for (var j=1; j<=jsonIgiGrdRt.length; j++) {

			let igiGrdRtCaption = jsonIgiGrdRt[j-1].text;
			let igiGrdRtRef = 'igiGrdRt' + j;
			columns.push(
					{
						caption : ['비율 적용', igiGrdRtCaption],
						ref: igiGrdRtRef,
						type: 'input',
						width: '50px',
						filtering: { usemode: false },
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}

		columns.push(
				{caption : ['감량항목', '항목'], 						ref: 'rwArtclCd', 		type:'combo',  		width: '60px', filtering: { usemode: false }, style:'text-align:center;',
					typeinfo : {ref:'jsonRwArtclCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption : ['감량항목', '%'], 						ref: 'rwRt', 			type: 'input', 		width: '50px', filtering: { usemode: false }, style:'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['회송<br>톤백수량', '회송<br>톤백수량'], 	ref: 'sndbkQntt', 		type: 'input', 		width: '60px', filtering: { usemode: false }, style:'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['검수내용', '검수내용'], 					ref: 'igiRmrk', 		type: 'input', 		width: '140px', filtering: {uitype : 'text^', sort:'asc'}, style:'text-align:left;'},
				{caption : ['톤백수량<br>매세지', '톤백수량<br>매세지'], ref: 'qnttRmrk', 		type: 'input', 		width: '120px', filtering: { usemode: false }, style:'text-align:left;'},
				{caption : ['비율<br>메시지', '비율<br>메시지'], 		ref: 'rtRmrk', 			type: 'input', 		width: '120px', filtering: { usemode: false }, style:'text-align:left;'},
				{caption : ['품질<br>평가', '품질<br>평가'], 			ref: 'qltEvl', 			type:'output',  	width: '60px', filtering: {uitype : 'checklist^', sort:'asc'}, style:'text-align:center;'},
				{caption : ['검수순번', '검수순번'], 					ref: 'igiReq', 			type: 'output', 	width: '120px', filtering: { usemode: false }, style:'text-align:left;', hidden : true},
		)

		SBGridProperties.columns = columns;
		grdRawMtrWrhsIgi = _SBGrid.create(SBGridProperties);
		grdRawMtrWrhsIgi.bind('valuechanged','gridValueChanged')
		grdRawMtrWrhsIgi.rebuild();

	}

	/**
	 * @description 컨텍스트메뉴 json 검수등록 - 수기입력 대장
	 * @type {object}
	 */
	const objMenuListRawMtrWrhsIgi = {
		"excelDwnld": {
			"name": "엑셀 다운로드",					//컨텍스트메뉴에 표시될 이름
			"accesskey": "e",						//단축키
			"callback": fn_excelDwnldRawMtrWrhsIgi,	//콜백함수명
		},
	};

	// 엑셀 다운로드 (검수등록 - 수기입력 대장)
	function fn_excelDwnldRawMtrWrhsIgi() {

		if (gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?\n (확인 클릭 시 xlsx, 취소 클릭 시 xls)")) {
			grdRawMtrWrhsIgi.exportData("xlsx","수기입력대장",true, {arrRemoveCols: [0]});
		} else {
			grdRawMtrWrhsIgi.exportLocalExcel("수기입력대장", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
		}
	}

	/**
	 * @name fn_dtpChange
	 * @description From ~ To 시작일보다 종료일보다 작을 수 없음
	 */
	const fn_dtpChange = function () {

		let igiYmdFrom = SBUxMethod.get("srch-dtp-igiYmdFrom");
		let igiYmdTo = SBUxMethod.get("srch-dtp-igiYmdTo");
		var maxYmd = gfn_addDate(igiYmdFrom, 90);

		if (maxYmd < igiYmdTo) {
			SBUxMethod.set("srch-dtp-igiYmdTo", maxYmd);
		}

		if (gfn_diffDate(igiYmdFrom, igiYmdTo) < 0) {
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-igiYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-igiYmdTo", gfn_dateToYmd(new Date()));
			return;
		}

		if (maxYmd < igiYmdTo) {
			SBUxMethod.set("srch-dtp-igiYmdTo", maxYmd);
		}
	}

	const fn_search = async function () {

		fn_selectRawMtrWrhsIgi();
	}

	/**
	 * @name fn_selectRawMtrWrhsIgi
	 * @description 수기 입력 추가 및 삭제
	 */
	const fn_procRawMtrWrhsIgi = function (gubun, nRow, nCol) {

		if (gubun == "ADD") {
			let rowData = grdRawMtrWrhsIgi.getRowData(nRow);

			let igiYmdCol = grdRawMtrWrhsIgi.getColRef("igiYmd");
			grdRawMtrWrhsIgi.setCellData(nRow, nCol, "Y", true);

			grdRawMtrWrhsIgi.setCellData(nRow, igiYmdCol, gfn_dateToYmd(new Date()), true);

			grdRawMtrWrhsIgi.addRow(true);
			grdRawMtrWrhsIgi.setCellDisabled(0, 0, grdRawMtrWrhsIgi.getRows() -1, grdRawMtrWrhsIgi.getCols() -1, false);
			grdRawMtrWrhsIgi.setCellDisabled(grdRawMtrWrhsIgi.getRows() -1, 0, grdRawMtrWrhsIgi.getRows() -1, grdRawMtrWrhsIgi.getCols() -1, true);

		} else if (gubun == "DEL") {

			let rowData = grdRawMtrWrhsIgi.getRowData(nRow);
			let igiSeq = rowData.igiSeq;

			if (gfn_isEmpty(igiSeq)) {
				grdRawMtrWrhsIgi.deleteRow(nRow);
			} else {
				if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")) {
					fn_del(rowData, nRow);
				}
			}
		}

		grdRawMtrWrhsIgi.initFiltering();
	}

	const gridValueChanged = function () {

		let nRow = grdRawMtrWrhsIgi.getRow();
		let nCol = grdRawMtrWrhsIgi.getCol();
		let prdcrCdCol = grdRawMtrWrhsIgi.getColRef('prdcrCd');


		if (nCol == prdcrCdCol) {

			let prdcrCd = (grdRawMtrWrhsIgi.getRowData(nRow)).prdcrCd;
			let prdcrVO = jsonGrdPrdcr.find(item => item.prdcrCd === prdcrCd);
			let frmhsNmCol = grdRawMtrWrhsIgi.getColRef('frmhsNm');
			let qltEvlCol = grdRawMtrWrhsIgi.getColRef('qltEvl');
			let frmhsNm = prdcrVO.frmhsNm;
			let qltEvl = prdcrVO.qltEvl;

			grdRawMtrWrhsIgi.setCellData(nRow, frmhsNmCol, frmhsNm, true);
			grdRawMtrWrhsIgi.setCellData(nRow, qltEvlCol, qltEvl, true);
		}

		for (let i=1; i<=jsonIgiGrdCd.length; i++) {

			let igiGrdQnttRef = 'igiGrdQntt' + i;
			let igiGrdQnttCol = grdRawMtrWrhsIgi.getColRef(igiGrdQnttRef);

			if (nCol == igiGrdQnttCol) {
				let igiGrdQnttCol = grdRawMtrWrhsIgi.getColRef('igiGrdQnttTot');
				let igiGrdQnttTot = 0;
				let rowData = grdRawMtrWrhsIgi.getRowData(nRow);
				for (let j=1; j<=jsonIgiGrdCd.length; j++) {
					let igiGrdQnttKey = 'igiGrdQntt' + j;
					let igiGrdQntt = rowData[igiGrdQnttKey] || 0;

					if (!gfn_isEmpty(igiGrdQnttKey)) {
						igiGrdQnttTot += parseInt(igiGrdQntt);
					}
				}
				grdRawMtrWrhsIgi.setCellData(nRow, igiGrdQnttCol, igiGrdQnttTot, true);
				break;
			}
		}

		let rowData = grdRawMtrWrhsIgi.getRowData(nRow);
		let prdcrCd = rowData.prdcrCd;
		let igiYmd = rowData.igiYmd;
		rowData.apcCd = gv_selectedApcCd;

		if (!gfn_isEmpty(prdcrCd) && !gfn_isEmpty(igiYmd)) {
			fn_save(rowData, nRow);
		}

	}

	/**
	 * @name fn_selectPrchsPicTot
	 * @description 수기입력 대장 목록 조회
	 */
	const fn_selectRawMtrWrhsIgi = async function () {

		let igiYmdFrom = SBUxMethod.get('srch-dtp-igiYmdFrom');
		let igiYmdTo = SBUxMethod.get('srch-dtp-igiYmdTo');
		let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');

		if (gfn_isEmpty(igiYmdFrom)) {
			gfn_comAlert("W0001", "검수시작일자");				//	W0002	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(igiYmdTo)) {
			gfn_comAlert("W0001", "검수종료일자");				//	W0002	{0}을/를 선택하세요.
			return;
		}

		const param = {
			  apcCd			: gv_selectedApcCd
			, igiYmdFrom	: igiYmdFrom
			, igiYmdTo		: igiYmdTo
			, prdcrCd		: prdcrCd
		}
		jsonRawMtrWrhsIgi.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
					"/am/wrhs/selectRawMtrWrhsIgiList.do",
					param,
					null,
					false
			);
			const data = await postJsonPromise;

			data.resultList.forEach((item, index) => {

				const rawMtrWrhsIgiVO = {

					  apcCd				: item.apcCd
					, igiYmd            : item.igiYmd
					, igiSeq           	: item.igiSeq
					, prdcrCd           : item.prdcrCd
					, frmhsNm           : item.frmhsNm
					, igiJgmtCd         : item.igiJgmtCd
					, smplYn            : item.smplYn
					, rwArtclCd         : item.rwArtclCd
					, wrhsUnitCd        : item.wrhsUnitCd
					, rwRt				: fn_zero(item.rwRt)
					, sndbkQntt         : fn_zero(item.sndbkQntt)
					, igiRmrk           : item.igiRmrk
					, qnttRmrk          : item.qnttRmrk
					, rtRmrk            : item.rtRmrk
					, qltEvl       		: item.qltEvl
					, igiGrdQnttTot     : fn_zero(item.igiGrdQnttTot)
					, igiGrdQntt1       : fn_zero(item.igiGrdQntt1)
					, igiGrdQntt2       : fn_zero(item.igiGrdQntt2)
					, igiGrdQntt3       : fn_zero(item.igiGrdQntt3)
					, igiGrdQntt4       : fn_zero(item.igiGrdQntt4)
					, igiGrdQntt5       : fn_zero(item.igiGrdQntt5)
					, igiGrdRt1         : fn_zero(item.igiGrdRt1)
					, igiGrdRt2         : fn_zero(item.igiGrdRt2)
					, igiGrdRt3         : fn_zero(item.igiGrdRt3)
					, igiGrdRt4         : fn_zero(item.igiGrdRt4)
					, igiGrdRt5         : fn_zero(item.igiGrdRt5)
					, delYn				: 'N'
				}
				jsonRawMtrWrhsIgi.push(rawMtrWrhsIgiVO);
			});

			grdRawMtrWrhsIgi.rebuild();
			grdRawMtrWrhsIgi.addRow(true);
			grdRawMtrWrhsIgi.setCellDisabled(0, 0, grdRawMtrWrhsIgi.getRows() -1, grdRawMtrWrhsIgi.getCols() -1, false);
			grdRawMtrWrhsIgi.setCellDisabled(grdRawMtrWrhsIgi.getRows() -1, 0, grdRawMtrWrhsIgi.getRows() -1, grdRawMtrWrhsIgi.getCols() -1, true);
			grdRawMtrWrhsIgi.initFiltering();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}

	}


	/**
	 * @name fn_zero
	 * @description 0 일때 빈값 처리
	 */
	const fn_zero = function(val) {

		if (gfn_isEmpty(val)) {
			return "";
		} else {
			if (val == 0) {
				return "";
			} else {
				return val;
			}
		}
	}

	/**
	 * @name fn_save
	 * @description 검수 등록 저장
	 */
	const fn_save = async function (rowData, nRow) {

		let igiSeq = rowData.igiSeq;
		let rowMtrWrhsIgiList = [];


		if (gfn_isEmpty(igiSeq)) {

			let rawMtrWrhsIgiDtlList = [];

			for (let j=1; j<=jsonIgiGrdCd.length; j++) {

				let igiGrdCdKey = "igiGrdQntt" + j;
				let igiGrdRtKey = "igiGrdRt" + j;

				let igiGrdCd = JSON.parse(JSON.stringify(jsonIgiGrdCd[j-1])).value;
				let igiGrdQntt = rowData[igiGrdCdKey] || 0;
				let igiGrdRt = rowData[igiGrdRtKey] || 0;
				let rawMtrWrhsIgiDtl = JSON.parse(JSON.stringify(rowData));

				rawMtrWrhsIgiDtl.igiGrdQntt = igiGrdQntt;
				rawMtrWrhsIgiDtl.igiGrdCd = igiGrdCd;
				rawMtrWrhsIgiDtl.igiGrdRt = igiGrdRt;

				if (parseInt(igiGrdQntt) > 0 || parseInt(igiGrdRt) > 0) {
					rawMtrWrhsIgiDtl.delYn = 'N'
				}

				if (parseInt(igiGrdQntt) == 0 && parseInt(igiGrdRt) == 0) {
					rawMtrWrhsIgiDtl.delYn = 'Y'
				}

				rawMtrWrhsIgiDtlList.push(rawMtrWrhsIgiDtl);

			}
			rowData.rowSts = "I"
			rowData.wrhsUnitCd = "3";
			rowData.rawMtrWrhsIgiDtlList = rawMtrWrhsIgiDtlList;

			rowMtrWrhsIgiList.push(rowData);
		} else {
			let rawMtrWrhsIgiDtlList = [];
			let rowSts = grdRawMtrWrhsIgi.getRowStatus(nRow);
			if (rowSts == "2" && !gfn_isEmpty(igiSeq)) {


				for (let k=1; k<=jsonIgiGrdCd.length; k++) {

					let igiGrdCdKey = "igiGrdQntt" + k;
					let igiGrdRtKey = "igiGrdRt" + k;

					let igiGrdCd = JSON.parse(JSON.stringify(jsonIgiGrdCd[k-1])).value;
					let igiGrdQntt = rowData[igiGrdCdKey] || 0;
					let igiGrdRt = rowData[igiGrdRtKey] || 0;
					let rawMtrWrhsIgiDtl = JSON.parse(JSON.stringify(rowData));

					rawMtrWrhsIgiDtl.igiGrdQntt = igiGrdQntt;
					rawMtrWrhsIgiDtl.igiGrdCd = igiGrdCd;
					rawMtrWrhsIgiDtl.igiGrdRt = igiGrdRt;

					if (parseInt(igiGrdQntt) > 0 || parseInt(igiGrdRt) > 0) {
						rawMtrWrhsIgiDtl.delYn = 'N'
					}

					if (parseInt(igiGrdQntt) == 0 && parseInt(igiGrdRt) == 0) {
						rawMtrWrhsIgiDtl.delYn = 'Y'
					}
					rawMtrWrhsIgiDtlList.push(rawMtrWrhsIgiDtl);

				}
				rowData.rowSts = "U"
				rowData.rawMtrWrhsIgiDtlList = rawMtrWrhsIgiDtlList;
				rowMtrWrhsIgiList.push(rowData);
			}
		}

		const postJsonPromise = gfn_postJSON("/am/wrhs/multiRawMtrWrhsIgiList.do", rowMtrWrhsIgiList);
		const data = await postJsonPromise;
		try{
			if (_.isEqual("S", data.resultStatus)) {

				if (gfn_isEmpty(igiSeq)) {
					await fn_search();
				}

			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}

	}

	/**
	 * @name fn_del
	 * @description 검수 등록 삭제
	 */
	const fn_del = async function (rowData, nRow) {
		const postJsonPromise = gfn_postJSON("/am/wrhs/deleteRawMtrWrhsIgi.do", rowData,);
		const data = await postJsonPromise;
		try{
			if (_.isEqual("S", data.resultStatus)) {

				gfn_comAlert("I0001");					// I0001 처리 되었습니다.
				grdRawMtrWrhsIgi.deleteRow(nRow);

			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
		jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
		jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd, gfn_dateToYear(new Date()));
		jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
	const getByteLengthOfString = function (s, b, i, c) {
		for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		return b;
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
		SBUxMethod.set("srch-inp-prdcrIdentno", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {
		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr)
		}
	}



	const fn_setPrdcrForm = async function(prdcr) {
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}

</script>
</html>