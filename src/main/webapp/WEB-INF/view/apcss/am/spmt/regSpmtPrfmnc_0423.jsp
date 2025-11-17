<%
 /**
  * @Class Name : regSpmtPrfmnc.jsp
  * @Description : 출하실적등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 출하실적등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
							id="btnReset"
							name="btnReset"
							uitype="normal"
							text="초기화"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_reset"
					></sbux-button>
					<sbux-button
							id="btnSave"
							name="btnSabe"
							uitype="normal"
							text="저장"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_saveSpmtPrfmnc"
					></sbux-button>
					<sbux-button
							id="btnSearchSpmtPrfmnc"
							name="btnSearchSpmtPrfmnc"
							uitype="normal"
							text="조회"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
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
							<th class="ta_r th_bg">APC명</th>
							<td colspan="2"  class="td_input" style="border-right: hidden">
								<%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>출고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmdFrom" name="srch-dtp-spmtYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-pckgYmdFrom)"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmdTo" name="srch-dtp-spmtYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-pckgYmdTo)"></sbux-datepicker>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
									jsondata-ref="jsonComItem"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">매입처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-prdcrCd"
											 name="srch-slt-prdcrCd"
											 uitype="single"
											 unselected-text="전체"
											 class="form-control input-sm"
											 jsondata-ref="jsonComPrdcrCd"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">출고처</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-cnptCd"
									name="srch-slt-cnptCd"
									uitype="single"
									unselected-text="전체"
									class="form-control input-sm"
									jsondata-ref="jsonComCnpt"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출고 공통 내역</span></li>
					</ul>
				</div>
					<div class="ad_tbl_toplist">
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtPrfmncCom" style="height:227px;"></div>
				</div>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>출하 상세 내역</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtPrfmncDtl" style="height:227px;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComItem				= [];	// 품목 			itemCd			검색
	var jsonComVrty				= [];	// 품종 			vrtyCd			검색
	var jsonComSpcfct			= [];	// 규격 			spcfctCd		검색
	var jsonGrdGdsGrd			= [];	// 상품등급		gdsGrd			그리드
	var jsonGrdSpcfct			= [];	// 규격			spcfct			그리드
	var jsonGrdPrdcr			= [];	// 생산자		prdcrCd			그리드
	var jsonGrdSpmtPckgUnit		= [];	// 출하포장단위 	spmtPckgUnit	그리드
	var jsonDtlGdsGrd			= [];	// 상품등급		gdsGrd			그리드
	var jsonDtlSpmtPckgUnit		= [];	// 출하포장단위 	spmtPckgUnit	상세
	var jsonApcCrtrUntprc		= [];	// APC기준단가
	var jsonComCnpt				= [];	// 출고처		cnptCd			조회
	var jsonComPrdcrCd			= [];	// 매입처		prdcrCd			조회
	var jsonGrdItem				= []; 	// 품목			itemCd			그리드
	var jsonGrdVrty				= []; 	// 품종			vrtyCd			그리드
	var jsonGrdCnpt				= [];	// 출고처		cnptCd			그리드
	var jsonGrdPrchspt			= [];	// 매입처		prchspt			그리드

	var grdSpmtPrfmncCom;
	var jsonSpmtPrfmncCom = [];
	var grdSpmtPrfmncDtl;
	var jsonSpmtPrfmncDtl = [];
	let comSums = _.range(6, 12);
	let dtlSums = _.range(5, 16);
	let focusRow = 0;

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_getApcCrtrUntprc(gv_selectedApcCd, 'CRTR_UNTPRC_CD'),
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),			// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),			// 품종
			gfn_setApcItemSBSelect('grdSpmtPrfmncCom', 		jsonGrdItem, 		gv_selectedApcCd),			// 품목
			gfn_setApcVrtySBSelect('grdSpmtPrfmncCom', 		jsonGrdVrty, 		gv_selectedApcCd),			// 품종
			gfn_setCpntSBSelect('grdSpmtPrfmncCom', 		jsonGrdCnpt, 		gv_selectedApcCd,	'1'),	// 출고처
			gfn_setCpntSBSelect('grdSpmtPrfmncDtl', 		jsonGrdPrchspt, 	gv_selectedApcCd,	'2'),	// 매입처
			gfn_setCpntSBSelect('srch-slt-cnptCd', 			jsonComCnpt, 		gv_selectedApcCd, 	'1'),	// 출고처(조회)
			gfn_setPrdcrSBSelect('srch-slt-prdcrCd', 		jsonComPrdcrCd, 	gv_selectedApcCd, 	'2'),	// 매입처(조회)
			gfn_setApcSpcfctsSBSelect('grdSpmtPrfmncDtl', 	jsonGrdSpcfct,		gv_selectedApcCd),
			gfn_setPrdcrSBSelect('grdSpmtPrfmncDtl',		jsonGrdPrdcr,		gv_selectedApcCd),
		])
		jsonApcCrtrUntprc = rst[0];

		if (jsonComItem.length == 1) {
			SBUxMethod.set("srch-slt-itemCd", jsonComItem[0].value);
		}
		if (jsonComVrty.length == 1) {
			SBUxMethod.set("srch-slt-vrtyCd", jsonComVrty[0].itemVrtyCd);
		}

	}

	/**
	 * @name fn_createSmptPrfmncGrid
	 * @description 출고실적 그리드 생성
	 */
	const fn_createSmptPrfmncGrid = async function() {
        var SBGridPropertiesSpmtPrfmncCom = {};
        SBGridPropertiesSpmtPrfmncCom.parentid = 'sb-area-spmtPrfmncCom';
		SBGridPropertiesSpmtPrfmncCom.id = 'grdSpmtPrfmncCom';
		SBGridPropertiesSpmtPrfmncCom.jsonref = 'jsonSpmtPrfmncCom';
		SBGridPropertiesSpmtPrfmncCom.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesSpmtPrfmncCom.selectmode = 'free';
		SBGridPropertiesSpmtPrfmncCom.extendlastcol = 'scroll';
		SBGridPropertiesSpmtPrfmncCom.scrollbubbling = false;
		SBGridPropertiesSpmtPrfmncCom.oneclickedit = true;
		SBGridPropertiesSpmtPrfmncCom.allowcopy = true;

		let comColumns = [];
		comColumns.push(
				{caption: ["처리"],
					ref: 'delYn',
					type:'button',
					width:'4%',
					style:'text-align:center',
					renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
						if (strValue== null || strValue == "") {
							return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowCom(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
						} else {
							return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowCom(\"DEL\", " + nRow + ")'>삭제</button>";
						}
					}
				},
				{caption: ["상세"],
					ref: 'spmtno',
					type:'button',
					width:'4%',
					style:'text-align:center',
					renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
						if (gfn_isEmpty(strValue)) {
							return "";
						} else {
							if (strValue == 'INSERT') {
								return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_setSpmtPrfmncDtl(\"INSERT\", " + nRow + ", " + nCol + ")'>입력</button>";
							} else {
								return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_setSpmtPrfmncDtl(\"SELECT\", " + nRow + ")'>보기</button>";
							}
						}
					}
				},
				{caption: ['출고일자'],
					ref: 'spmtYmd',
					type: 'datepicker',
					width: '6%',
					style: 'text-align:center;background:#FFF8DC;',
					format : {
						type:'date',
						rule:'yyyy-mm-dd',
						origin:'yyyymmdd'}
				},
				{caption: ["품목"],
					ref: 'itemCd',
					type:'combo',
					width:'5%',
					style:'text-align:center;background:#FFF8DC;',
					typeinfo : {
						ref:'jsonGrdItem',
						itemcount: 10,
						label:'label',
						value:'value',
						displayui : false}
				},
				{caption: ["품종"],
					ref: 'vrtyCd',
					type:'combo',
					width:'5%',
					style:'text-align:center;background:#FFF8DC;',
					typeinfo : {
						ref:'jsonGrdVrty',
						itemcount: 10,
						label:'label',
						value:'value',
						displayui : false}
				},
				{caption: ["출고처"],
					ref: 'cnptCd',
					type:'combo',
					width:'8%',
					style:'text-align:center;background:#FFF8DC;',
					typeinfo : {
						ref:'jsonGrdCnpt',
						itemcount: 10,
						label:'label',
						value:'value',
						displayui : false}
				},
				{
					caption : ['판매액'],
					ref: 'totSpmtAmt',
					type: 'input',
					width: '5%',
					filtering: { usemode: false },
					style:'text-align:right;background:#FFF8DC;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['출고수수료'],
					ref: 'totSpmtFeeAmt',
					type: 'input',
					width: '5%',
					filtering: { usemode: false },
					style:'text-align:right;background:#FFF8DC;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['입금액'],
					ref: 'totPayAmt',
					type: 'input',
					width: '5%',
					style:'text-align:right;background:#FFF8DC;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['조공수수료'],
					ref: 'totFeeAmt',
					type: 'output',
					width: '5%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['수량'],
					ref: 'totQntt',
					type: 'output',
					width: '5%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['중량'],
					ref: 'totWght',
					type: 'output',
					width: '5%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
		)
		for (let i=1; i<=jsonApcCrtrUntprc.length; i++) {
			let captionNm = jsonApcCrtrUntprc[i-1].cdVlNm
			let refId = 'crtrUntprcCd' + i;
			comColumns.push(
					{
						caption : [captionNm],
						ref: refId,
						type: 'output',
						width: '5%',
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}
		comColumns.push(
				{
					caption : ['비고'],
					ref: 'rmrk',
					type: 'input',
					width: '18%',
					style:'text-align:left;'
				},
		)

		SBGridPropertiesSpmtPrfmncCom.columns = comColumns;
		grdSpmtPrfmncCom = _SBGrid.create(SBGridPropertiesSpmtPrfmncCom);
        grdSpmtPrfmncCom.bind('valuechanged', 'fn_grdSpmtPrfmncComValueChanged');

		var SBGridPropertiesSpmtPrfmncDtl = {};
		SBGridPropertiesSpmtPrfmncDtl.parentid = 'sb-area-spmtPrfmncDtl';
		SBGridPropertiesSpmtPrfmncDtl.id = 'grdSpmtPrfmncDtl';
		SBGridPropertiesSpmtPrfmncDtl.jsonref = 'jsonSpmtPrfmncDtl';
		SBGridPropertiesSpmtPrfmncDtl.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesSpmtPrfmncDtl.selectmode = 'free';
		SBGridPropertiesSpmtPrfmncDtl.extendlastcol = 'scroll';
		SBGridPropertiesSpmtPrfmncDtl.scrollbubbling = false;
		SBGridPropertiesSpmtPrfmncDtl.oneclickedit = true;
		SBGridPropertiesSpmtPrfmncDtl.allowcopy = true;
		SBGridPropertiesSpmtPrfmncDtl.columns = [
				{
					caption: ["처리"],
					ref: 'delYn',
					type:'button',
					width:'4%',
					style:'text-align:center',
					renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
						if (strValue== null || strValue == "") {
							return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowDtl(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
						} else {
							return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowDtl(\"DEL\", " + nRow + ")'>삭제</button>";
						}
					}
				},
				{caption: ["매입처"],
					ref: 'prdcrCd',
					type:'inputcombo',
					width:'12%',
					style:'text-align:center;background:#FFF8DC;',
					typeinfo : {
						ref:'jsonGrdPrdcr',
						itemcount: 10,
						label:'label',
						value:'value',
						displayui : false}
				},
				{caption: ["생산지"],
					ref: 'frmhsCtpv',
					type:'output',
					width:'6%',
					style:'text-align:center;',
				},
				{caption: ["규격"],
					ref: 'spcfctCd',
					type:'combo',
					width:'6%',
					style:'text-align:center;background:#FFF8DC;',
					typeinfo : {
						ref:'jsonGrdSpcfct',
						itemcount: 10,
						label:'label',
						value:'value',
						displayui : false}
				},
				{caption: ["등급"],
					ref: 'gdsGrd',
					type:'combo',
					width:'6%',
					style:'text-align:center;background:#FFF8DC;',
					typeinfo : {
						ref:'jsonGrdGdsGrd',
						itemcount: 10,
						label:'label',
						value:'value',
						displayui : false}
				},
				{
					caption : ['수량'],
					ref: 'spmtQntt',
					type: 'input',
					width: '6%',
					style:'text-align:right;background:#FFF8DC;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['중량'],
					ref: 'spmtWght',
					type: 'output',
					width: '6%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['단가'],
					ref: 'untprc',
					type: 'input',
					width: '6%',
					style:'text-align:right;background:#FFF8DC;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['지급금액'],
					ref: 'payAmt',
					type: 'output',
					width: '6%',
					filtering: { usemode: false },
					style:'text-align:right;',
					format : {type:'number', rule:'#,###.###'}
				},
				{
					caption : ['출하수수료'],
					ref: 'spmtFeeAmt',
					type: 'output',
					width: '6%',
					filtering: { usemode: false },
					style:'text-align:right;',
					format : {type:'number', rule:'#,###.###'}
				},
				{
					caption : ['출하금액'],
					ref: 'spmtAmt',
					type: 'output',
					width: '6%',
					filtering: { usemode: false },
					style:'text-align:right;',
					format : {type:'number', rule:'#,###.###'}
				},
				{
					caption : ['농협수수료'],
					ref: 'nhFeeAmt',
					type: 'output',
					width: '6%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###.###'}
				},
				{
					caption : ['운송비'],
					ref: 'trsprtCst',
					type: 'output',
					width: '6%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['마늘망'],
					ref: 'pckgAmt',
					type: 'output',
					width: '6%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['콘티'],
					ref: 'bxAmt',
					type: 'output',
					width: '6%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###'}
				},
				{
					caption : ['조공수수료'],
					ref: 'feeAmt',
					type: 'output',
					width: '6%',
					style:'text-align:right;',
					format : {type:'number', rule:'#,###.###'}
				},
		];

		grdSpmtPrfmncDtl = _SBGrid.create(SBGridPropertiesSpmtPrfmncDtl);
		grdSpmtPrfmncDtl.bind('valuechanged', 'fn_grdSpmtPrfmncDtlValueChanged');
    }

	/**
	 * @name fn_grdSpmtPrfmncDtlValueChanged
	 * @description 출고 상세 데이터 변경 event
	 */
	const fn_grdSpmtPrfmncDtlValueChanged = function () {
		let nRow = grdSpmtPrfmncDtl.getRow();
		let nCol = grdSpmtPrfmncDtl.getCol();
		let prdcrCdCol = grdSpmtPrfmncDtl.getColRef('prdcrCd');
		let untprcCol = grdSpmtPrfmncDtl.getColRef('untprc')
		let frmhsCtpvCol = grdSpmtPrfmncDtl.getColRef('frmhsCtpv')
		let spmtQnttCol = grdSpmtPrfmncDtl.getColRef('spmtQntt');

		if (prdcrCdCol === nCol) {
			let rowData = grdSpmtPrfmncDtl.getRowData(nRow);
			let prdcrCd = rowData.prdcrCd;
			let prdcrInfo = jsonGrdPrdcr.find(item => item.prdcrCd === prdcrCd);
			let frmhsCtpv = prdcrInfo.frmhsCtpv;
			let untprc = prdcrInfo.untprc;
			grdSpmtPrfmncDtl.setCellData(nRow, frmhsCtpvCol, frmhsCtpv, true);
			grdSpmtPrfmncDtl.setCellData(nRow, untprcCol, untprc, true);
		}

		if (nCol === spmtQnttCol || nCol === prdcrCdCol || nCol === untprcCol) {

			let rowData = grdSpmtPrfmncDtl.getRowData(nRow);
			let spmtQntt = parseInt(rowData.spmtQntt) || 0;

			if (spmtQntt > 0) {

				/**
				 * 상세
				 * */
				let spmtWghtCol = grdSpmtPrfmncDtl.getColRef('spmtWght');
				let spmtAmtCol = grdSpmtPrfmncDtl.getColRef('spmtAmt');
				let nhFeeAmtCol = grdSpmtPrfmncDtl.getColRef('nhFeeAmt');
				let trsprtCstCol = grdSpmtPrfmncDtl.getColRef('trsprtCst');
				let pckgAmtCol = grdSpmtPrfmncDtl.getColRef('pckgAmt');
				let bxAmtCol = grdSpmtPrfmncDtl.getColRef('bxAmt');

				let comNmFeeAmtCol = grdSpmtPrfmncCom.getColList('caption','농협수수료');
				let comNhFeeAmt = parseInt(grdSpmtPrfmncCom.getCellData(focusRow, comNmFeeAmtCol[0])) || 0;
				let comTrsprtCstCol = grdSpmtPrfmncCom.getColList('caption', '운송단가');
				let comTrsprtCst = parseInt(grdSpmtPrfmncCom.getCellData(focusRow, comTrsprtCstCol[0])) || 0;
				let comPckgAmtCol = grdSpmtPrfmncCom.getColList('caption', '망단가');
				let comPckgAmt = parseInt(grdSpmtPrfmncCom.getCellData(focusRow, comPckgAmtCol[0])) || 0;
				let comBxAmtCol = grdSpmtPrfmncCom.getColList('caption', '콘티단가');
				let comBxAmt = parseInt(grdSpmtPrfmncCom.getCellData(focusRow, comBxAmtCol[0])) || 0;

				let spmtWght = spmtQntt * 20;
				let untprc = rowData.untprc || 0;
				let spmtAmt =  spmtQntt * untprc;
				let nmFeeAmt = spmtQntt * comNhFeeAmt;
				let trsprtCst = spmtQntt * comTrsprtCst;
				let pckgAmt = spmtQntt * comPckgAmt;
				let bxAmt = spmtQntt * comBxAmt;

				grdSpmtPrfmncDtl.setCellData(nRow, spmtWghtCol, spmtWght, true);
				grdSpmtPrfmncDtl.setCellData(nRow, spmtAmtCol, spmtAmt, true);
				grdSpmtPrfmncDtl.setCellData(nRow, nhFeeAmtCol, nmFeeAmt, true);
				grdSpmtPrfmncDtl.setCellData(nRow, trsprtCstCol, trsprtCst, true);
				grdSpmtPrfmncDtl.setCellData(nRow, pckgAmtCol, pckgAmt, true);
				grdSpmtPrfmncDtl.setCellData(nRow, bxAmtCol, bxAmt, true);

				fn_comTotSet();
				fn_dtlFeeSet();

			} else {
				fn_comTotSet();
				fn_dtlFeeSet();
			}

		}
	}

	const fn_comTotSet = function () {

		let totWghtCol = grdSpmtPrfmncCom.getColRef('totWght');
		let totQnttCol = grdSpmtPrfmncCom.getColRef('totQntt');
		let totFeeAmtCol = grdSpmtPrfmncCom.getColRef('totFeeAmt');
		let rowData = grdSpmtPrfmncCom.getRowData(focusRow);
		let totPayAmt = parseInt(rowData.totPayAmt) || 0;
		let totQntt = 0;
		let totFeeAmt = 0;

		let dtlGridData = grdSpmtPrfmncDtl.getGridDataAllExceptTotal();

		for (let i=0; i<dtlGridData.length; i++) {
			let dtlData = dtlGridData[i];
			let spmtQntt = parseInt(dtlData.spmtQntt) || 0;
			let spmtAmt = parseInt(dtlData.spmtAmt) || 0;
			let nhFeeAmt = parseInt(dtlData.nhFeeAmt) || 0;
			let trsprtCst = parseInt(dtlData.trsprtCst) || 0;
			let pckgAmt = parseInt(dtlData.pckgAmt) || 0;
			let bxAmt = parseInt(dtlData.bxAmt) || 0;
			totQntt += spmtQntt;
			totFeeAmt += spmtAmt + nhFeeAmt + trsprtCst + pckgAmt + bxAmt;
		}

		grdSpmtPrfmncCom.setCellData(focusRow, totQnttCol, totQntt, true);
		grdSpmtPrfmncCom.setCellData(focusRow, totWghtCol, (totQntt * 20), true);

		if (totFeeAmt == 0) {
			grdSpmtPrfmncCom.setCellData(focusRow, totFeeAmtCol, 0, true);
		} else {
			grdSpmtPrfmncCom.setCellData(focusRow, totFeeAmtCol, (totPayAmt - totFeeAmt), true);
		}
	}

	const fn_dtlFeeSet = function () {

		let rowData = grdSpmtPrfmncCom.getRowData(focusRow);
		let totSpmtFeeAmt = parseFloat(rowData.totSpmtFeeAmt) || 0;
		let totFeeAmt = parseFloat(rowData.totFeeAmt) || 0;
		let totQntt = parseFloat(rowData.totQntt) || 0;
		let averageSpmtFeeAmt = (totSpmtFeeAmt / totQntt);
		let averageFeeAmt = (totFeeAmt / totQntt);

		let dtlGridData = grdSpmtPrfmncDtl.getGridDataAllExceptTotal();

		let spmtFeeAmtCol = grdSpmtPrfmncDtl.getColRef('spmtFeeAmt');
		let feeAmtCol = grdSpmtPrfmncDtl.getColRef('feeAmt');
		let payAmtCol = grdSpmtPrfmncDtl.getColRef('payAmt');

		for (let i=1; i<=dtlGridData.length; i++) {

			let dtlData = grdSpmtPrfmncDtl.getRowData(i);
			let spmtQntt = parseInt(dtlData.spmtQntt) || 0;
			let spmtAmt = parseInt(dtlData.spmtAmt) || 0;
			let nhFeeAmt = parseInt(dtlData.nhFeeAmt) || 0;
			let trsprtCst = parseInt(dtlData.trsprtCst) || 0;
			let pckgAmt = parseInt(dtlData.pckgAmt) || 0;
			let bxAmt = parseInt(dtlData.bxAmt) || 0;
			let spmtFeeAmt = spmtQntt * averageSpmtFeeAmt;
			let feeAmt = spmtQntt * averageFeeAmt;
			let payAmt = spmtAmt + nhFeeAmt + trsprtCst + pckgAmt + bxAmt + spmtFeeAmt + feeAmt;
			grdSpmtPrfmncDtl.setCellData(i, spmtFeeAmtCol, spmtFeeAmt, true);
			grdSpmtPrfmncDtl.setCellData(i, feeAmtCol, feeAmt, true);
			grdSpmtPrfmncDtl.setCellData(i, payAmtCol, payAmt, true);
		}

	}

	/**
	 * @name fn_procRowCom
	 * @description 출고 공통 처리 버튼 event
	 */
	const fn_procRowCom = function (gubun, nRow, nCol) {

		if (gubun == 'ADD') {

			if (grdSpmtPrfmncCom.getUseTotal()) {
				grdSpmtPrfmncCom.clearTotal();
			}
			grdSpmtPrfmncCom.setCellData(nRow, nCol, "N", true);
			if (jsonGrdItem.length == 1) {
				let itemCdCol = grdSpmtPrfmncCom.getColRef('itemCd');
				grdSpmtPrfmncCom.setCellData(nRow, itemCdCol, jsonGrdItem[0].value, true);
			}

			if (jsonGrdVrty.length == 1) {
				let vrtyCdCol = grdSpmtPrfmncCom.getColRef('vrtyCd');
				grdSpmtPrfmncCom.setCellData(nRow, vrtyCdCol, jsonGrdVrty[0].value, true);
			}


			let spmtnoCol = grdSpmtPrfmncCom.getColRef('spmtno');
			grdSpmtPrfmncCom.setCellData(nRow, spmtnoCol, "INSERT", true);
			fn_setUntprc(nRow);
			fn_setTotalCom();
			grdSpmtPrfmncCom.setCellDisabled(0, 0, nRow, grdSpmtPrfmncCom.getCols() -1, false);
		}

		if (gubun == 'DEL') {

			let rowData = grdSpmtPrfmncCom.getRowData(nRow);
			let spmtno = rowData.spmtno;

			if (spmtno != 'INSERT' && !gfn_isEmpty(spmtno)) {
				if (!gfn_comConfirm("Q0001", "등록 된 출하실적 입니다. 삭제?")) {
					return;
				} else {
					fn_del(rowData, nRow);
				}
			}

			if (jsonSpmtPrfmncCom.length == 2) {
				if (grdSpmtPrfmncCom.getUseTotal()) {
					grdSpmtPrfmncCom.clearTotal();
				}
				grdSpmtPrfmncCom.deleteRow(nRow);
				grdSpmtPrfmncCom.addRow(true);
				grdSpmtPrfmncCom.setCellDisabled(grdSpmtPrfmncCom.getRows() -1, 0, grdSpmtPrfmncCom.getRows() -1, grdSpmtPrfmncCom.getCols() -1, true);
			} else {
				if (grdSpmtPrfmncCom.getUseTotal()) {
					grdSpmtPrfmncCom.clearTotal();
				}
				grdSpmtPrfmncCom.deleteRow(nRow);
				fn_setTotalCom();
				grdSpmtPrfmncCom.setCellDisabled(0, 0, nRow, grdSpmtPrfmncCom.getCols() -1, false);
			}

			if (nRow == focusRow) {
				jsonSpmtPrfmncDtl.length = 0;
				grdSpmtPrfmncDtl.rebuild();
				focusRow = 0;
			}

		}
	}

	/**
	 * @name fn_procRowDtl
	 * @description 출고 상세 처리 버튼 event
	 */
	const fn_procRowDtl = function (gubun, nRow, nCol) {

		if (gubun == 'ADD') {

			if (grdSpmtPrfmncDtl.getUseTotal()) {
				grdSpmtPrfmncDtl.clearTotal();
			}
			grdSpmtPrfmncDtl.setCellData(nRow, nCol, "N", true);
			fn_setTotalDtl();
			grdSpmtPrfmncDtl.setCellDisabled(0, 0, nRow, grdSpmtPrfmncDtl.getCols() -1, false);
		}

		if (gubun == 'DEL') {

			if (jsonSpmtPrfmncDtl.length == 2) {

				if (grdSpmtPrfmncDtl.getUseTotal()) {
					grdSpmtPrfmncDtl.clearTotal();
				}
				grdSpmtPrfmncDtl.deleteRow(nRow);
				fn_comTotSet();
				fn_dtlFeeSet();
				grdSpmtPrfmncDtl.addRow(true);
				grdSpmtPrfmncDtl.setCellDisabled(grdSpmtPrfmncDtl.getRows() -1, 0, grdSpmtPrfmncDtl.getRows() -1, grdSpmtPrfmncDtl.getCols() -1, true);
			} else {
				if (grdSpmtPrfmncDtl.getUseTotal()) {
					grdSpmtPrfmncDtl.clearTotal();
				}
				grdSpmtPrfmncDtl.deleteRow(nRow);
				fn_comTotSet();
				fn_dtlFeeSet();
				fn_setTotalDtl();
				grdSpmtPrfmncDtl.setCellDisabled(0, 0, nRow, grdSpmtPrfmncDtl.getCols() -1, false);
			}
		}
	}

	/**
	 * @name fn_setSpmtPrfmncDtl
	 * @description 출고 공통 그리드 상세 버튼 event
	 */
	const fn_setSpmtPrfmncDtl = async function (gubun, nRow, nCol) {

		if (gubun == 'INSERT') {

			if (nRow != focusRow) {

				let comData = grdSpmtPrfmncCom.getRowData(nRow);
				let itemCd = comData.itemCd;

				if (gfn_isEmpty(itemCd)) {
					gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
					return;
				}
				if (jsonSpmtPrfmncDtl.length > 1) {
					if (!gfn_comConfirm("Q0001", "입력한 정보가 있습니다. 진행")) {
						return;
					}
				}

				if (grdSpmtPrfmncDtl.getUseTotal()) {
					grdSpmtPrfmncDtl.clearTotal();
				}
				focusRow = nRow;
				jsonSpmtPrfmncDtl.length = 0;

				grdSpmtPrfmncDtl.rebuild();
				grdSpmtPrfmncDtl.addRow(true);
				grdSpmtPrfmncDtl.setCellDisabled(grdSpmtPrfmncDtl.getRows() -1, 0, grdSpmtPrfmncDtl.getRows() -1, grdSpmtPrfmncDtl.getCols() -1, true);

				let rst = await Promise.all([
					gfn_setApcSpcfctsSBSelect('grdSpmtPrfmncDtl', 	jsonGrdSpcfct,		gv_selectedApcCd, itemCd),
					gfn_setApcGdsGrdSBSelect('grdSpmtPrfmncDtl', 	jsonGrdGdsGrd, 		gv_selectedApcCd, itemCd, '03')		// 상품등급(상세)
				])

				grdSpmtPrfmncDtl.refresh({"combo":true});
			}
		}
		if (gubun == 'SELECT') {

			if (nRow != focusRow) {

				if (grdSpmtPrfmncDtl.getUseTotal()) {
					grdSpmtPrfmncDtl.clearTotal();
				}

				focusRow = nRow;
				let comData = grdSpmtPrfmncCom.getRowData(nRow);
				let itemCd = comData.itemCd;
				let rst = await Promise.all([
					gfn_setApcSpcfctsSBSelect('grdSpmtPrfmncDtl', 	jsonGrdSpcfct,		gv_selectedApcCd, itemCd),
					gfn_setApcGdsGrdSBSelect('grdSpmtPrfmncDtl', 	jsonGrdGdsGrd, 		gv_selectedApcCd, itemCd, '03')		// 상품등급(상세)
				])

				grdSpmtPrfmncDtl.refresh({"combo":true});

				const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncSlsDtlList.do", comData);
				const data = await postJsonPromise;
				try {
					if (_.isEqual("S", data.resultStatus)) {
						/** @type {number} **/
						jsonSpmtPrfmncDtl.length = 0;
						data.resultList.forEach((item, index) => {
							if(item.invntrWght != 0){
								const spmtPrfmncSlsDtl = {
									apcCd			: item.apcCd
									, spmtno		: item.spmtno
									, prdcrCd		: item.prdcrCd
									, frmhsCtpv		: item.frmhsCtpv
									, itemCd		: item.itemCd
									, vrtyCd		: item.vrtyCd
									, spcfctCd		: item.spcfctCd
									, gdsGrd		: item.gdsGrd
									, spmtQntt		: item.qntt
									, spmtWght		: item.wght
									, untprc		: item.untprc
									, payAmt		: item.payAmt
									, spmtFeeAmt 	: item.spmtFeeAmt
									, spmtAmt		: item.spmtAmt
									, trsprtCst		: item.trsprtCst
									, nhFeeAmt		: item.nhFeeAmt
									, pckgAmt  		: item.pckgAmt
									, bxAmt			: item.bxAmt
									, delYn			: 'N'
								}
								jsonSpmtPrfmncDtl.push(spmtPrfmncSlsDtl);
							}
						});

						fn_setTotalDtl();
						fn_dtlFeeSet();
					} else {
						gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
					}
				} catch (e) {
					if (!(e instanceof Error)) {
						e = new Error(e);
					}
					console.error("failed", e.message);
					gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
				}
			}
		}

	}

	/**
	 * @name fn_setUntprc
	 * @description 출고 공통 그리드 기본단가 설정
	 */
	const fn_setUntprc = function (nRow) {
		for (let i=1; i<=jsonApcCrtrUntprc.length; i++) {
			let nColKey = 'crtrUntprcCd' + i;
			let nCol = grdSpmtPrfmncCom.getColRef(nColKey);
			let crtrUntprc = jsonApcCrtrUntprc[i-1].crtrUntprc;
			grdSpmtPrfmncCom.setCellData(nRow, nCol, crtrUntprc, true);
		}
	}

	const fn_grdSpmtPrfmncComValueChanged = function () {
		let nRow = grdSpmtPrfmncCom.getRow();
		let nCol = grdSpmtPrfmncCom.getCol();
		let totSpmtAmtCol = grdSpmtPrfmncCom.getColRef('totSpmtAmt')
		let totSpmtFeeAmtCol = grdSpmtPrfmncCom.getColRef('totSpmtFeeAmt')
		let totPayAmtCol = grdSpmtPrfmncCom.getColRef('totPayAmt')

		if (nCol == totSpmtAmtCol || nCol == totSpmtFeeAmtCol || nCol == totPayAmtCol) {
			if (jsonSpmtPrfmncDtl.length > 1) {
				fn_comTotSet();
				fn_dtlFeeSet();
			}
		}
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonComItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd)
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;

		if (gfn_isEmpty(vrtyCd)){
			return;
		}
		const itemCd = vrtyCd.substring(0,4);
		SBUxMethod.set("srch-slt-itemCd", itemCd);
		await fn_onChangeSrchItemCd({value: itemCd});
		SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);

	}
	window.addEventListener('DOMContentLoaded', async function(e) {
		await fn_initSBSelect();
		fn_createSmptPrfmncGrid();

		SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));
	})

	const fn_dtpChange = function() {
		let spmtYmdFrom = SBUxMethod.get("srch-dtp-spmtYmdFrom");
		let spmtYmdTo = SBUxMethod.get("srch-dtp-spmtYmdTo");
		if (gfn_diffDate(spmtYmdFrom, spmtYmdTo) < 0) {
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
			SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	const fn_search = async function() {
		fn_setGrdSpmtPrfmncCom()
	}

	const fn_setGrdSpmtPrfmncCom = async function() {
		focusRow = 0;
		let spmtYmdFrom = SBUxMethod.get('srch-dtp-spmtYmdFrom');
		let spmtYmdTo = SBUxMethod.get('srch-dtp-spmtYmdTo');
		let itemCd = SBUxMethod.get('srch-slt-itemCd');
		let vrtyCd = SBUxMethod.get('srch-slt-vrtyCd');
		let prdcrCd = SBUxMethod.get('srch-slt-prdcrCd');
		let cnptCd = SBUxMethod.get('srch-slt-cnptCd');

		if (gfn_isEmpty(spmtYmdFrom) || gfn_isEmpty(spmtYmdTo)) {
  			gfn_comAlert("W0001", "출고일자");		//	W0001	{0}을/를 선택하세요.
            return false;
  		}

		const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncSlsComList.do", {
			apcCd			: gv_selectedApcCd,
			spmtYmdFrom		: spmtYmdFrom,
			spmtYmdTo		: spmtYmdTo,
			itemCd			: itemCd,
			vrtyCd			: vrtyCd,
			prdcrCd			: prdcrCd,
			cnptCd			: cnptCd
  		});
        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		jsonSpmtPrfmncCom.length = 0;
				jsonSpmtPrfmncDtl.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		if(item.invntrWght != 0){
  		          		const spmtPrfmncSlsCom = {
  		          			  apcCd			: item.apcCd
  		          			, spmtno		: item.spmtno
  		          			, spmtYmd		: item.spmtYmd
  		          			, cnptCd		: item.cnptCd
  		          			, itemCd		: item.itemCd
  		          			, vrtyCd		: item.vrtyCd
  		          			, totQntt		: item.totQntt
							, totWght		: item.totWght
							, totPayAmt		: item.totPayAmt
							, totIncmAmt	: item.totIncmAmt
							, totFeeAmt		: item.totFeeAmt
							, totSpmtFeeAmt : item.totSpmtFeeAmt
							, totSpmtAmt	: item.totSpmtAmt
							, crtrUntprcCd1	: item.crtrUntprcCd1
							, crtrUntprcCd2	: item.crtrUntprcCd2
							, crtrUntprcCd3	: item.crtrUntprcCd3
							, crtrUntprcCd4	: item.crtrUntprcCd4
							, rmrk			: item.rmrk
							, delYn			: 'N'
  		  				}
  						jsonSpmtPrfmncCom.push(spmtPrfmncSlsCom);
  	          		}
  	  			});
				if (grdSpmtPrfmncCom.getUseTotal()) {
					grdSpmtPrfmncCom.clearTotal();
				}

				if (jsonSpmtPrfmncCom.length == 0) {
					grdSpmtPrfmncCom.addRow(true);
					grdSpmtPrfmncCom.setCellDisabled(grdSpmtPrfmncCom.getRows() -1, 0, grdSpmtPrfmncCom.getRows() -1, grdSpmtPrfmncCom.getCols() -1, true);
				} else {
					fn_setTotalCom();
				}
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
		grdSpmtPrfmncDtl.refresh();
	}



	const fn_setTotalCom = function () {
		var total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : comSums
			},
			grandtotalrow : {
				titlecol 	: 2,
				titlevalue	: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol	: 1
			},
			datasorting	: true,
			usedecimal : false,
		};

		grdSpmtPrfmncCom.setTotal(total);
	}

	const fn_setTotalDtl = function () {
		var total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : dtlSums
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

		grdSpmtPrfmncDtl.setTotal(total);
	}

	const fn_saveSpmtPrfmnc = async function () {

		let spmtPrfmncCom = grdSpmtPrfmncCom.getRowData(focusRow);
		let spmtPrfmncDtls = grdSpmtPrfmncDtl.getGridDataAllExceptTotal();
		if (spmtPrfmncDtls.length == 0) {
			gfn_comAlert("W0003", "상세 저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		spmtPrfmncCom.apcCd = gv_selectedApcCd;
		let spmtYmd = spmtPrfmncCom.spmtYmd;
		let itemCd = spmtPrfmncCom.itemCd;
		let vrtyCd = spmtPrfmncCom.vrtyCd;
		let cnptCd = spmtPrfmncCom.cnptCd;
		let totPayAmt = spmtPrfmncCom.totPayAmt || 0;
		let totSpmtFeeAmt = spmtPrfmncCom.totSpmtFeeAmt || 0;
		let totSpmtAmt = spmtPrfmncCom.totSpmtAmt || 0;

		if (gfn_isEmpty(spmtYmd)) {
			gfn_comAlert("W0001", "출고일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(vrtyCd)) {
			gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(cnptCd)) {
			gfn_comAlert("W0001", "출고처");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (totSpmtAmt == 0) {
			gfn_comAlert("W0002", "판매액");		//	W0002	{0}을/를 입력하세요.
			return;
		}
		if (totSpmtFeeAmt == 0) {
			gfn_comAlert("W0002", "출고수수료");		//	W0002	{0}을/를 입력하세요.
			return;
		}
		if (totPayAmt == 0) {
			gfn_comAlert("W0002", "입금액");		//	W0002	{0}을/를 입력하세요.
			return;
		}

		let spmtno = spmtPrfmncCom.spmtno;
		if (spmtno == 'INSERT') {
			spmtPrfmncCom.rowSts = 'I'
		} else if (!gfn_isEmpty(spmtno) && spmtno != 'INSERT') {
			spmtPrfmncCom.rowSts = 'U'
		}

		let spmtPrfmncDtlList = [];
		let spmtPrfmncSlsList = [];

		for (let i=0; i<spmtPrfmncDtls.length; i++) {
			let rowData = JSON.parse(JSON.stringify(spmtPrfmncDtls[i]));
			let gdsGrd = rowData.gdsGrd;
			let prchsptCd = rowData.prchsptCd;
			let prdcrCd = rowData.prdcrCd;
			let spcfctCd = rowData.spcfctCd;
			let spmtQntt = rowData.spmtQntt;
			let untprc = rowData.untprc;

			if (gfn_isEmpty(prdcrCd)) {
				gfn_comAlert("W0001", "매입처");		//	W0001	{0}을/를 선택하세요.
				return;
			}
			if (gfn_isEmpty(spcfctCd)) {
				gfn_comAlert("W0001", "규격");		//	W0001	{0}을/를 선택하세요.
				return;
			}
			if (gfn_isEmpty(gdsGrd)) {
				gfn_comAlert("W0001", "등급");		//	W0001	{0}을/를 선택하세요.
				return;
			}
			if (spmtQntt == 0) {
				gfn_comAlert("W0002", "수량");		//	W0002	{0}을/를 입력하세요.
				return;
			}
			if (untprc == 0) {
				gfn_comAlert("W0002", "단가");		//	W0002	{0}을/를 입력하세요.
				return;
			}

			let spmtPrfmncDtlVO = {
				  apcCd 		: gv_selectedApcCd
				, itemCd		: spmtPrfmncCom.itemCd
				, vrtyCd 		: spmtPrfmncCom.vrtyCd
				, gdsGrd		: gdsGrd
				, spcfctCd 		: spcfctCd
				, prdcrCd 		: prdcrCd
				, spmtQntt		: spmtQntt
				, spmtWght 		: rowData.spmtWght
				, rmrk			: rowData.rmrk
				, spmtno		: spmtno
			}

			spmtPrfmncDtlList.push(spmtPrfmncDtlVO);

			let spmtPrfmncSlsVO = {
				  apcCd 		: gv_selectedApcCd
				, itemCd		: spmtPrfmncCom.itemCd
				, vrtyCd 		: spmtPrfmncCom.vrtyCd
				, gdsGrd		: gdsGrd
				, spcfctCd 		: spcfctCd
				, prdcrCd 		: prdcrCd
				, qntt			: spmtQntt
				, wght 			: rowData.spmtWght
				, prchsptCd		: prchsptCd
				, untprc		: untprc
				, payAmt		: rowData.payAmt
				, spmtFeeAmt	: rowData.spmtFeeAmt
				, spmtAmt		: rowData.spmtAmt
				, nhFeeAmt		: rowData.nhFeeAmt
				, trsprtCst		: rowData.trsprtCst
				, pckgAmt		: rowData.pckgAmt
				, bxAmt			: rowData.bxAmt
				, spmtno		: spmtno
			}
			spmtPrfmncSlsList.push(spmtPrfmncSlsVO);

		}
		spmtPrfmncCom.spmtPrfmncList = spmtPrfmncDtlList;
		spmtPrfmncCom.spmtPrfmncSlsList = spmtPrfmncSlsList;

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/spmt/multiSaveSpmtPrfmncSls.do", spmtPrfmncCom);
			const data = await postJsonPromise;

			try{
				if (_.isEqual("S", data.resultStatus)) {
					fn_search();
					gfn_comAlert("I0001");					// I0001 처리 되었습니다.
					focusRow = 0;
				} else {
					gfn_comAlert(data.resultCode, data.resultMessage);
				}
			}catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		}
	}

	const fn_del = async function(spmtPrfmncVO, nRow) {

		const postJsonPromise = gfn_postJSON("/am/spmt/deleteSpmtPrfmncSls.do", spmtPrfmncVO);
		const data = await postJsonPromise;

		try{
			if (_.isEqual("S", data.resultStatus)) {
				fn_search();
				gfn_comAlert("I0001");					// I0001 처리 되었습니다.
				focusRow = 0;
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>