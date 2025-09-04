
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
							id="btnReport"
							name="btnReport"
							uitype="normal"
							class="btn btn-sm btn-primary btn-mbl"
							onclick="fn_report"
							text="거래명세서"
					></sbux-button>
					<sbux-button
							id="btnSave"
							name="btnSave"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_del"
							text="삭제"
					></sbux-button>
					<sbux-button
							id="btnDel"
							name="btnDel"
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
							<th class="ta_r th_bg">거래일자</th>
							<td colspan="2"  class="td_input" style="border-right: hidden">
								<div style="display: flex; gap: 3px">
									<sbux-datepicker
											id="srch-dtp-dlngYmdFrom"
											name="srch-dtp-dlngYmdFrom"
											uitype="popup"
											wrap-style="flex:1;"
											date-format="yyyy-mm-dd"
											class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
											onchange="fn_dtpChange(srch-dtp-igiYmdFrom)"
									></sbux-datepicker>
									<sbux-datepicker
											id="srch-dtp-dlngYmdTo"
											name="srch-dtp-dlngYmdTo"
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
						<tr>
							<td style="display: none">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="srch-slt-itemCd"
										name="srch-slt-itemCd"
										class="form-control input-sm"
										jsondata-ref="jsonApcItem"
								/>
							</td>
							<td style="display: none">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="srch-slt-vrtyCd"
										name="srch-slt-vrtyCd"
										class="form-control input-sm"
										jsondata-value="itemVrtyCd"
										jsondata-ref="jsonApcVrty"
								/>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>원물 거래 이력</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">
							<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" ></sbux-button>
						</div>
					</div>

					<div class="table-responsive tbl_scroll_sm" style="width:100%">
						<div id="sb-area-rawDlng" style="height:614px; width:100%"></div>
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
</body>
<script type="text/javascript">

	var jsonRawDlng = [];
	var grdRawDlng;

	var jsonPrdcr					= [];
	var jsonPrdcrDtl				= [];
	var jsonPrdcrAutocomplete 		= [];
	var jsonPrdcrAutocompleteDtl 	= [];
	var jsonStrgLoctnCd = [];
	var jsonIgiJgmtCd = [];
	var jsonRwArtclCd = [];
	var jsonSortGrds = [];
	var jsonApcItem = [];
	var jsonApcVrty = [];

	var jsonSortAtrbCd 				= []; // 선별속성코드 (개별APC)
	const sums = _.range(3, 5).concat(_.range(6, 20))

	var jsonGrdPrdcr = [];
	const year = gfn_dateToYear(new Date());
	const month = 6;		// 수매월 정의

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setPrdcrSBSelect('grdRawDlng', 			jsonGrdPrdcr, 	gv_selectedApcCd),		// Grid 생산자
			gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 	gv_selectedApcCd),		// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, 	gv_selectedApcCd),		// 품종
		]);

		if (jsonApcItem.length == 1) {
			SBUxMethod.set('srch-slt-itemCd', jsonApcItem[0].itemCd);
		}

		if (jsonApcVrty.length == 1) {
			SBUxMethod.set('srch-slt-vrtyCd', jsonApcVrty[0].itemVrtyCd);
		}

		SBUxMethod.set('srch-dtp-dlngYmdFrom', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-dtp-dlngYmdTo', gfn_dateToYmd(new Date()));
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		fn_getPrdcrs();
		fn_initSBSelect();
		fn_createRawDlngGrid();

	})

	/**
	 * @name fn_createRawMtrWrhsIgiGrid
	 * @description 원물거래명세 Grid
	 */
	const fn_createRawDlngGrid = async function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-rawDlng";
		SBGridProperties.id = "grdRawDlng";
		SBGridProperties.jsonref = "jsonRawDlng";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.useinitsorting = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : sums
			},
			grandtotalrow : {
				titlecol 	: 1,
				titlevalue	: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol	: 1
			},
			datasorting	: true,
			usedecimal : false,
		};

		let columns = [
			{caption : [''], ref : 'checkBox', width : '50px', style : 'text-align:center', type : 'checkbox',
				typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
			{caption: ['생산자', '생산자'], 						ref: 'prdcrCd', 	type:'inputcombo',  width: '110px', filtering: {uitype : 'checklist^', listsearch: true, sort:'asc'},	style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption : ['일자', '일자'], 						ref: 'wrhsYmd', 	type : 'datepicker', 	width: '100px', filtering: { usemode: false }, style:'text-align:center; background:#FFF8DC;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['원물<br>C/T수량', '원물<br>C/T수량'], 	ref: 'bxQntt', 		type: 'input',  	width: '60px', style:'text-align:right;', format : {type:'number', rule:'#,###'}},
		];

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdRawDlng', 		jsonSortAtrbCd,  	'SORT_ATRB_CD', 	gv_selectedApcCd),  // 검수등급
			gfn_getStdGrdDtls(gv_selectedApcCd, 	_GRD_SE_CD_SORT, 	'0602'),
		]);

		jsonSortGrds = rst[1];

		for (var i=1; i<=jsonSortAtrbCd.length; i++) {

			let sortAtrbCdCaption = jsonSortAtrbCd[i-1].text;
			let sortAtrbQnttRef = 'sortAtrbQntt' + i;
			let sortAtrbUntprcRef = 'sortAtrbUntprc' + i;
			columns.push(
					{
						caption : [sortAtrbCdCaption, '수량'],
						ref: sortAtrbQnttRef,
						type: 'input',
						width: '60px',
						filtering: { usemode: false },
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
					{
						caption : [sortAtrbCdCaption, '단가'],
						ref: sortAtrbUntprcRef,
						type: 'input',
						width: '60px',
						filtering: { usemode: false },
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}

		for (let j=1; j<jsonSortGrds.length; j++) {
			let grdCdCaption = jsonSortGrds[j-1].grdNm;
			let grdCdRef = 'grdCd' + jsonSortGrds[j-1].grdCd;
			columns.push(
					{
						caption : [grdCdCaption, grdCdCaption],
						ref: grdCdRef,
						type: 'input',
						width: '60px',
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}



		columns.push(
				{caption : ['합계', '합계'], 		ref: 'tot', 		type: 'output',  	width: '100px', style:'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고번호', '입고번호'], 	ref: 'wrhsno', 		type: 'output',  	hidden : true},
				{caption : ['선별번호', '선별번호'], 	ref: 'sortno', 		type: 'output',  	hidden : true},
				{caption : ['포장번호', '포장번호'], 	ref: 'pckgno', 		type: 'output',  	hidden : true},
		)

		SBGridProperties.columns = columns;
		grdRawDlng = _SBGrid.create(SBGridProperties);
		grdRawDlng.bind('valuechanged','fn_gridValueChanged')
		grdRawDlng.rebuild();


	}

	/**
	 * @description 컨텍스트메뉴 json 검수등록 - 수기입력 대장
	 * @type {object}
	 */
	const fn_addRow = function () {

		jsonRawDlng.push({
			wrhsYmd : gfn_dateToYmd(new Date())
		})
		grdRawDlng.refresh();

	};


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

		//fn_selectRawMtrWrhsIgi();
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

	/**
	 * @name fn_gridValueChanged
	 * @description 그리드 수량 입력 시 합계 변경
	 */
	const fn_gridValueChanged = async function () {

		let nRow = grdRawDlng.getRow();
		let nCol = grdRawDlng.getCol();

		if (sums.includes(nCol)) {

			let rowData = grdRawDlng.getRowData(nRow);
			let tot = 0;
			let totCol = grdRawDlng.getColRef('tot');
			let checkBoxCol = grdRawDlng.getColRef('checkBox');

			for (let i=1; i<=jsonSortGrds.length; i++) {

				let grdCdKey = 'grdCd' + jsonSortGrds[i-1].grdCd;
				let grdQntt = rowData[grdCdKey] || 0;
				tot += parseInt(grdQntt);
			}

			grdRawDlng.setCellData(nRow, totCol, tot, true);

			if (tot > 0 ) {
				grdRawDlng.setCellData(nRow, checkBoxCol, true, true);
			} else {
				grdRawDlng.setCellData(nRow, checkBoxCol, false, true);
			}
		}

		grdRawDlng.refresh();

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
					, strgLoctnCd       : item.strgLoctnCd
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
	 * @description 원물 거래 저장
	 */
	const fn_save = async function () {
		let checkBoxCol = grdRawDlng.getColRef('checkBox');
		let checkedRowData = grdRawDlng.getCheckedRowData(checkBoxCol);

		if (checkedRowData.length == 0) {
			gfn_comAlert("W0001", "대상");				//	W0001	{0}을/를 선택하세요.
			return;
		}

		/**
		 * 통합으로 실적 담을 객체 선언
		 * 통합실적타입별로 실적을 생성 여부 판단. (R : 입고, W : 계량, S : 선별, P : 포장, D : 출하)
		 * 각각의 실적별 모듈 번호로 타입 설정
		 * 현재 논산배수출 화면 기준
		 * 입고(단일)[R2] -> 선별(복수)[S2] -> 포장(복수)[P1]  -> 출하없음[D0]
		 * R2S2P1D0 로 untyPrfmncType 에 값 설정
		 * */
		let untyPrfmncList = [];


		for (let i=0; i<checkedRowData.length; i++) {
			let untyPrfmncVO = JSON.parse(JSON.stringify(checkedRowData[i].data));
			/**
			 * 통합실적타입
			 * */
			untyPrfmncVO.untyPrfmncType = "R2S2P1D0";
			let rowData = JSON.parse(JSON.stringify(checkedRowData[i].data));
			rowData.apcCd = gv_selectedApcCd;

			let prdcrCd = rowData.prdcrCd;
			let wrhsYmd = rowData.wrhsYmd;
			let bxQntt = rowData.bxQntt || 0;
			let tot = rowData.tot || 0;
			rowData.inptQntt = bxQntt;
			rowData.wrhsQntt = bxQntt;

			if (gfn_isEmpty(prdcrCd)) {
				gfn_comAlert("W0001", "생산자");				//	W0001	{0}을/를 선택하세요.
				return;
			}

			if (gfn_isEmpty(wrhsYmd)) {
				gfn_comAlert("W0001", "일자");				//	W0001	{0}을/를 선택하세요.
				return;
			}

			if (bxQntt == 0) {
				gfn_comAlert("W0002", "원물C/T수량");		//	W0002	{0}을/를 입력하세요.
				return;
			}

			if (tot == 0) {
				gfn_comAlert("W0002", "선별수량");		//	W0002	{0}을/를 입력하세요.
				return;
			}

			if (gfn_isEmpty(rowData.wrhsno)) {
				let itemCd = SBUxMethod.get('srch-slt-itemCd');
				let vrtyCd = SBUxMethod.get('srch-slt-vrtyCd');

				rowData.itemCd = itemCd;
				rowData.vrtyCd = vrtyCd.substring(4);
				rowData.rowSts = "I";

			} else {
				rowData.rowSts = "U";
			}

			let rawMtrWrhsVO = rowData;

			let sortPrfmncList = [];
			let pckgPrfmncList = [];
			for (let j=1; j<=jsonSortGrds.length; j++) {

				let grdCdKey = 'grdCd' + jsonSortGrds[j-1].grdCd;
				let grdQntt = rowData[grdCdKey] || 0;

				if (grdQntt > 0) {
					let sortPrfmncVO = JSON.parse(JSON.stringify(rowData));
					sortPrfmncVO.inptYmd = rowData.wrhsYmd;
					sortPrfmncVO.sortQntt = grdQntt;
					sortPrfmncVO.grdCd = jsonSortGrds[j-1].grdCd;

					sortPrfmncList.push(sortPrfmncVO);

					if (!gfn_isEmpty(jsonSortGrds[j-1].aftrGrdCd)) {

						let pckgPrfmncVO = JSON.parse(JSON.stringify(rowData));
						sortPrfmncVO.pckgYmd = rowData.wrhsYmd;
						sortPrfmncVO.pckgQntt = grdQntt;
						sortPrfmncVO.grdCd = jsonSortGrds[j-1].grdCd;

						pckgPrfmncList.push(pckgPrfmncVO);
					}
				}
			}

			rawMtrWrhsVO.sortPrfmncList = sortPrfmncList;
			rawMtrWrhsVO.pckgPrfmncList = pckgPrfmncList;

			untyPrfmncVO.rawMtrWrhsVO = rawMtrWrhsVO;

			untyPrfmncList.push(untyPrfmncVO);
		}

		console.log("untyPrfmncList", untyPrfmncList);

		const postJsonPromise = gfn_postJSON("/am/wrhs/multiUntyPrfmncList.do", untyPrfmncList);
		const data = await postJsonPromise;
		try{
			if (_.isEqual("S", data.resultStatus)) {

				gfn_comAlert("I0001");					// I0001 처리 되었습니다.

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
	 *
	 */
	const fn_del = async function (rowData, nRow) {
		const postJsonPromise = gfn_postJSON("/am/wrhs/deleteRawMtrWrhsIgi.do", rowData);
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

	/**
	 * @name fn_report
	 * @description 다중 리포트 출력
	 */
	const fn_report = async function () {
		// 은총 씨 할 일 !! 흐흐
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