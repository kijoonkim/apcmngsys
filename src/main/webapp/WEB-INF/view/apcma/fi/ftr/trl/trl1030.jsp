<%
	/**
	 * @Class Name 		: trl1010.jsp
	 * @Description 	: 차입금상환스케줄 화면
	 * @author 			: 인텔릭아이앤에스
	 * @since 			: 2024.10.17
	 * @version 		: 1.0
	 * @Modification Information
	 * @
	 * @ 수정일       	수정자      수정내용
	 * @ ----------		----------	---------------------------
	 * @ 2024.10.17   	장성주		최초 생성
	 * @see
	 *
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 차입금상환스케줄</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
<%-- 	<%@ include file="../../../../frame/inc/headerScript.jsp" %> --%>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
	<div class="box box-solid" style="border-radius:0px">
		<div class="box-header" style="display:flex; justify-content: flex-start;">
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
				</h3><!-- 차입금상환스케줄 -->
			</div>
		</div>
		<div class="box-body">

			<div class="box-search-ma">
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
				<table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">

						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">

						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">

						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row" class="th_bg_search">조회기준일자</th>
						<td class="td_input">
							<sbux-datepicker
									id="SCH_BASE_DATE"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="table-datepicker-ma inpt_data_reqed">
							</sbux-datepicker>
						</td>
						<td colspan="3" style="border-right: hidden;"></td>
						<th scope="row" class="th_bg_search">만기차입금포함여부</th>
						<td colspan="3" class="td_input">
							<sbux-select id="SCH_ALL_YN" uitype="single" jsondata-ref="jsonAllYn"
										 unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td style="border-right: hidden;"></td>
						<th scope="row" class="th_bg_search">차입금유형</th>
						<td colspan="3" class="td_input">
							<sbux-select id="SCH_LOAN_TYPE" uitype="single" jsondata-ref="jsonLoanType"
										 unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td style="border-right: hidden;"></td>
						<th scope="row" class="th_bg_search">차입기관</th>
						<td class="td_input" data-group="BANK_CS">
							<sbux-input style="width:100%" id="SCH_BANK_CS_CODE" uitype="text"
										class="form-control input-sm"></sbux-input>
						</td>
						<td colspan="2" class="td_input" data-group="BANK_CS">
							<sbux-input style="width:100%" id="SCH_BANK_CS_NAME" uitype="text"
										class="form-control input-sm"></sbux-input>
						</td>
						<td class="td_input" data-group="BANK_CS">
							<sbux-button
									class="btn btn-xs btn-outline-dark"
									text="…"
									uitype="modal"
									target-id="modal-compopup1"
									onclick="fn_compopup1('1')"
							></sbux-button>
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg_search">거래일자</th>
						<td class="td_input">
							<sbux-datepicker
									id="SCH_BASE_DATE_FR"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="table-datepicker-ma">
							</sbux-datepicker>
						</td>
						<td class="td_input">
							<span>-</span>
						</td>
						<td class="td_input">
							<sbux-datepicker
									id="SCH_BASE_DATE_TO"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="table-datepicker-ma">
							</sbux-datepicker>
						</td>
						<td colspan="16" style="border-right: hidden;"></td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-sm-6" style="width:100%">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>차입금</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div>
						<div id="sb_area_grid_top" style="height:200px; width:100%;"></div>
					</div>
				</div>
				<div class="col-sm-6" style="width:100%;padding-top:10px">
					<sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
							   title-target-id-array = "SB_TOP_TAB5"
							   title-text-array = "상환계획"
							   title-target-value-array="5"
							   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>
					<div class="tab-content" style="height:300px;width:100%;padding-top:0px" >
						<div id="SB_TOP_TAB5" >
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>상환계획</span>
									</li>
								</ul>
								<div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									<sbux-button uitype="normal" text="최초상환계획"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnPlan"></sbux-button>
									<font style="padding-right:5px"></font>
									<sbux-button uitype="normal" text="재계산"  		class="btn btn-sm btn-outline-danger" onclick="fn_btnReCalc"></sbux-button>
									<font style="padding-right:10px"></font>
									<sbux-button
											id="btnDel"
											name="btnDel"
											uitype="normal"
											text="행삭제"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_btnDel"
											style="float: right;"
									></sbux-button>
									<sbux-button
											id="btnAdd"
											name="btnAdd"
											uitype="normal"
											text="행추가"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_btnAdd"
											style="float: right;"
									></sbux-button>
								</div>
							</div>
							<div style="width:100%;">
								<div id="sb_area_grid_tap5" style="height:240px; width:100%;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 팝업 Modal -->
<div>
	<sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

<!-- 팝업 Modal -->
<div>
	<sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
</div>

</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}

	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';

	var p_ss_languageID	= '${loginVO.maLanguageID}';
	//-----------------------------------------------------------

	var p_sel_rowData =  null;

	//grid 초기화
	var Trl1030GridTop; 			// 그리드를 담기위한 객체 선언
	var jsonTrl1030Top 	= []; 		// 그리드의 참조 데이터 주소 선언

	/*var Trl1030GridTab4; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1030Tab4	= []; 		// 그리드의 참조 데이터 주소 선언*/

	var Trl1030GridTab5; 			// 그리드를 담기위한 객체 선언
	var jsonTrl1030Tab5	= []; 		// 그리드의 참조 데이터 주소 선언

	/*  var Trl1030GridTab6; 			// 그리드를 담기위한 객체 선언
      var jsonTrl1030Tab6	= []; 		// 그리드의 참조 데이터 주소 선언*/

	var jsonFiOrgCode		= [];	// APC명
	var jsonAllYn			= [];	// 만기차입금포함여부
	var jsonLoanType		= [];	// 차입금유형

	var jsonSiteCode		= [];	// 사업장
	var jsonLoanType		= [];	// 차입금유형
	var jsonCurrencyCode	= [];	// 통화
	var jsonLoanStatus		= [];	// 년간이자일수
	var jsonRepayBankCode	= [];	// 상환거래처계좌
	var jsonRepayTerm		= [];	// 원금상환조건
	var jsonRepayDd			= [];	// 원금상환일
	var jsonRepayBase		= [];	// 상환기준
	var jsonInterestType	= [];	// 이자율구분
	var jsonBankCsCode	= [];	// 상환거래처계좌

	var jsonInterestRepayType		= [];	// 이자지급기준
	var jsonInterestCalcDaysType	= [];	// 이자일수계산기준
	var jsonInterestCalcYearType	= [];	// 년간이자일수
	var jsonInterestCalcBaseDay		= [];	// 이자기산일기준

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			// APC명
			gfnma_setComSelect(['SCH_FI_ORG_CODE','FM_FI_ORG_CODE'],		jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
			// 만기차입금포함여부
			gfnma_setComSelect(['SCH_ALL_YN'],			jsonAllYn, 			'L_FIF016', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			// 차입금유형
			gfnma_setComSelect(['SCH_LOAN_TYPE'],		jsonLoanType, 		'L_FIF003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			// 사업장
			gfnma_setComSelect(['Trl1030GridTop'],		jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
			// 상환거래처계좌
			gfnma_setComSelect(['FM_REPAY_BANK_CODE'],	jsonBankCsCode,	'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CD', 'BANK_NM', 'Y', ''),
			// 통화
			gfnma_setComSelect(['Trl1030GridTop','Trl1030GridTab5'],	jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
			// 이자일수
			gfnma_setComSelect([/*'FM_REPAY_DD',*/ 'Trl1030GridTab5'],			jsonRepayDd,		'L_COM010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),

		]);
	}

	async function fn_init() {

		await fn_initSBSelect()

		//화면셋팅
		fn_state('L');

		fn_createTrl1030GridTop();
		//fn_createTrl1030GridTab4();
		fn_createTrl1030GridTab5();
		//fn_createTrl1030GridTab6();

		let openDate = gfn_dateToYmd(new Date());

		SBUxMethod.set('SCH_BASE_DATE', openDate);
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {

		fn_init();
	});

	/**
	 * 초기화
	 */
	var cfn_init = function() {
		gfnma_uxDataClear('#srchArea1');
	}

	/**
	 * 화면 state 변경
	 */
	function fn_state(type) {

// 		SBUxMethod.attr('FM_VAT_TYPE_CODE', 	'readonly', true);

//     	if(type=='L'){
// 			$('#main-btn-new', parent.document).attr('disabled', true);
// 			$('#main-btn-save', parent.document).attr('disabled', true);
// 			$('#main-btn-del', 	parent.document).attr('disabled', true);
// 			//fn_fmDisabled(true);
//     	} else if(type=='N'){
//     		SBUxMethod.attr('SCH_DEPRECIATION_METHOD2', 		'readonly', false);
//     		$('#main-btn-save', parent.document).attr('disabled', false);
//     		$('#main-btn-del', 	parent.document).attr('disabled', false);
// 			//fn_fmDisabled(false);
//     	}
	}

	/**
	 * 목록 조회
	 */
	function cfn_search() {
		fn_state('L');
		fn_P_TRL1010_Q_LIST('LIST', 1);
		//fn_setTrl1030GridTop('LIST');
	}

	/**
	 * 저장
	 */
	async function cfn_save() {

		//그리드 필수값 체크
		if (await gfnma_gridValidateCheck() == false){
			return;
		}

		let strloan_num = "";
		let strStatus = "";

		//let gridData = Trl1030GridTop.getGridDataAll();
		var nRow = Trl1030GridTop.getRow();
		let gridData = Trl1030GridTop.getRowData(nRow);

		if (_.isEmpty(gridData))
		{
			return;
		}

		updatedData = Trl1030GridTab5.getUpdateData(true, 'all');
		if (await fn_P_TRL1010_S2(updatedData) == false)
		{
			return;
		}


		//fn_P_TRL1010_Q_LIST('LIST', nRow);
		//fnQRY_P_TRL1010_Q("DETAIL");

		gfn_comAlert("I0001");
		fn_P_TRL1010_Q('DETAIL', gridData);
	}

	//차입금
	function fn_createTrl1030GridTop() {
		var SBGridProperties 				= {};
		SBGridProperties.parentid 			= 'sb_area_grid_top';
		SBGridProperties.id 				= 'Trl1030GridTop';
		SBGridProperties.jsonref 			= 'jsonTrl1030Top';
		SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
		SBGridProperties.selectmode 		= 'byrow';
		SBGridProperties.explorerbar 		= 'sortmove';
		SBGridProperties.extendlastcol 		= 'scroll';
		SBGridProperties.useinitsorting 	= true;
		SBGridProperties.frozenbottomrows 	= 1;
		SBGridProperties.total 				= {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : [7,8,9]
			},
			grandtotalrow : {
				titlecol 		: 6,
				titlevalue		: '합계',
				style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
				stylestartcol	: 0
			},
			datasorting	: true,
		};
		SBGridProperties.columns = [
			{caption: ["차입금번호"],	ref: 'LOAN_NUM', 	type:'output',  	width:'200px',  	style:'text-align:left'},
			{caption : ["회계단위"], ref : 'FI_ORG_CODE', width : '200px', style : 'text-align:center', type : 'combo', hidden : true,
				typeinfo : {ref : 'jsonFiOrgCode',  label : 'label', value : 'value'}/*, disabled: true*/
			},
			{caption : ["금융기관"], ref : 'BANK_CS_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonBankCsCode',  label : 'label', value : 'value'}, disabled: true
			},
			{caption : ["사업장"], ref : 'SITE_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, disabled: true
			},
			{caption : ["차입금유형"], ref : 'LOAN_TYPE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonLoanType',  label : 'label', value : 'value'}, disabled: true
			},
			{caption: ["차입금명"],	ref: 'LOAN_NAME',	type:'output',  	width:'250px',  	style:'text-align:left'}, //P_FIM002 DBOBIZCOMPONENT 에 값이 없음.
			{caption : ["통화"], ref : 'CURRENCY_CODE', width : '100px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}, disabled: true
			},
			{caption: ["차입금액(통화)"],	ref: 'LOAN_AMT',  		type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["상환금액(통화)"],	ref: 'REPAY_AMT',   	type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["잔액(통화)"],	ref: 'REMAIN_AMT', 		type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ['차입일'], ref: 'LOAN_DATE', 	width:'200px',	type: 'inputdate', style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ['만기일'], ref: 'EXPIRE_DATE', 	width:'200px',	type: 'inputdate', style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ["약정이율"],         ref: 'INTEREST_RATE',    type:'output',  	width:'150px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["분류1"],			ref: 'LOAN_CATEGORY1',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["분류2"],			ref: 'LOAN_CATEGORY2',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["분류3"],			ref: 'LOAN_CATEGORY3',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["repay_bank_cs_code"],	ref: 'REPAY_BANK_CS_CODE',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["repay_seq"],			ref: 'REPAY_SEQ',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
		];

		Trl1030GridTop = _SBGrid.create(SBGridProperties);
		Trl1030GridTop.bind('click', 'fn_view');
		Trl1030GridTop.bind('keyup', 'fn_keyup');
	}

	//상환계획
	function fn_createTrl1030GridTab5() {
		var SBGridProperties 				= {};
		SBGridProperties.parentid 			= 'sb_area_grid_tap5';
		SBGridProperties.id 				= 'Trl1030GridTab5';
		SBGridProperties.jsonref 			= 'jsonTrl1030Tab5';
		SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
		SBGridProperties.selectmode 		= 'byrow';
		SBGridProperties.explorerbar 		= 'sortmove';
		SBGridProperties.extendlastcol 		= 'scroll';
		SBGridProperties.useinitsorting 	= true;
		SBGridProperties.columns = [
			{caption: ["차입금번호"], 		ref: 'LOAN_NUM', 			  	type:'input',  	width:'230px',  	style:'text-align:left'},
			{caption: ["계획연번"], 		ref: 'PLAN_SEQ', 			  	type:'input',  	width:'200px',  	style:'text-align:left', userattr : {required : true}},
			{caption: ['상환예정일'], 	ref: 'REPAY_PLAN_DATE', 	type:'inputdate',	width:'220px', 		style: 'text-align: center', sortable: false, userattr : {required : true},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption : ["통화"], 		ref : 'CURRENCY_CODE', width : '200px', style : 'text-align:center', type : 'combo', userattr : {required : true},
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}},
			{caption: ["총상환액"],		ref: 'REPAY_TOTAL_AMT',  	type:'input',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}, userattr : {required : true}},
			{caption: ["차입금대체"],		ref: 'REPAY_TRANSFER_AMT',  type:'input',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["원금상환예정액"],	ref: 'REPAY_PLAN_AMT',  type:'input',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}, userattr : {required : true}},
			{caption: ["차입금잔액"],		ref: 'REMAIN_LOAN_AMT',  type:'input',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}, userattr : {required : true}},
			{caption: ["이자상환예정액"],	ref: 'INTEREST_REPAY_PLAN_AMT',  type:'input',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}, userattr : {required : true}},
			{caption: ["이자율"],        ref: 'INTEREST_RATE',    type:'input',  	width:'200px',  style:'text-align:right', userattr : {required : true},
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,##0.00', emptyvalue:'0.00'}},
			{caption : ["이자일수"], 	ref : 'INTEREST_DAY', 		type:'combo',		width:'200px', 	style : 'text-align:center', userattr : {required : true},
				typeinfo : {ref : 'jsonRepayDd',  label : 'label', value : 'value'}
			},
			{caption: ['적용시작일'], 	ref: 'INTEREST_FROM_DATE', 	type:'inputdate',	width:'220px', 		style: 'text-align: center', sortable: false, userattr : {required : true},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ['적용종료일'], 	ref: 'INTEREST_TO_DATE', 	type:'inputdate',	width:'220px', 		style: 'text-align: center', sortable: false, userattr : {required : true},
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ["확정여부"], 	ref: 'CONFIRM_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["전송여부"], 	ref: 'INTERFACE_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["완료여부"], 	ref: 'COMPLETE_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["id"],	ref: 'TXN_ID',	type:'output',  width:'300px',  style:'text-align:left' , hidden : true},
			{caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
		];

		Trl1030GridTab5 = _SBGrid.create(SBGridProperties);
		//Trl1030GridTab5.bind('click', 			'fn_viewTrl1030GridTab5Event');
	}

	/**
	 * 차입기관
	 */
	function fn_compopup1(type) {

		var searchText1 	= '';
		var searchText2 	= '';
		if(type=='1'){
			searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_BANK_CS_CODE"));
			searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_BANK_CS_NAME"));
		} else if(type=='2'){
			searchText1 	= gfnma_nvl(SBUxMethod.get("FM_BANK_CS_CODE"));
			searchText2 	= gfnma_nvl(SBUxMethod.get("FM_BANK_CS_NAME"));
		}

		var replaceText0 	= "_CNPT_CD_";
		var replaceText1 	= "_CNPT_NM_";
		var strWhereClause 	= "AND A.CO_CD = '" + gv_ma_selectedCorpCd + "' " +  "AND A.CNPT_CD LIKE '%" + replaceText0 + "%' AND A.CNPT_NM LIKE '%" + replaceText1 + "%'";

		SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
		compopup1({
			compCode				: gv_ma_selectedCorpCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_CS_BANK'
			,popupType				: 'A'
			,whereClause			: strWhereClause
			,searchCaptions			: ["거래처코드", 	"거래처명칭"]
			,searchInputFields		: ["CNPT_CD", 		"CNPT_NM"]
			,searchInputValues		: [searchText1, 	searchText2]
			,width					: '700px'
			,height					: '400px'
			,tableHeader			: ["거래처코드",	"거래처명",		"은행코드",		"은행명",		"사업자번호",		"주소"]
			,tableColumnNames		: ["CNPT_CD", 	 	"CNPT_NM",		"BANK_CD",	"BANK_NM",	"BRNO",		"ADDR"]
			,tableColumnWidths		: ["100px", 		 "250px",		"100px",		"100px",		"150px",			"300px"]
			,itemSelectEvent		: function (data){
				if(type=='1'){
					SBUxMethod.set('SCH_BANK_CS_CODE', data.CNPT_CD);
					SBUxMethod.set('SCH_BANK_CS_NAME', data.CNPT_NM);
				} else if(type=='2'){
					SBUxMethod.set('FM_BANK_CS_CODE', 	data.CNPT_CD);
					SBUxMethod.set('FM_BANK_CS_NAME', 	data.CNPT_NM);
				}
			},
		});
	}

	/**
	 * 목록 조회
	 */
	const fn_P_TRL1010_Q_LIST = async function (strWorkType, row) {

		let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//APC명
		let BASE_DATE 		= gfn_nvl(SBUxMethod.get("SCH_BASE_DATE")); 	//조회기준일자
		let ALL_YN 			= gfn_nvl(SBUxMethod.get("SCH_ALL_YN")); 		//만기차입금포함여부
		let LOAN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_LOAN_TYPE")); 	//차입금유형
		let BANK_CS_CODE 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_CODE")); 	//차입기관

		if (_.isEqual(strWorkType, 'LIST')){

			/*if (!FI_ORG_CODE) {
                gfn_comAlert("W0002", "APC명");
                return;
            }*/
			if (!BASE_DATE) {
				gfn_comAlert("W0002", "조회기준일자");
				return;
			}

		}

		var paramObj = {
			V_P_DEBUG_MODE_YN: ''
			,V_P_LANG_ID: ''
			,V_P_COMP_CODE: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE: gv_ma_selectedClntCd

			,V_P_FI_ORG_CODE  : FI_ORG_CODE /*fi_org_code*/
			,V_P_BASE_DATE    : BASE_DATE
			,V_P_TXN_DATE_FR  : ''
			,V_P_TXN_DATE_TO  : ''
			,V_P_ALL_YN       : ALL_YN
			,V_P_LOAN_TYPE    : LOAN_TYPE
			,V_P_BANK_CS_CODE : BANK_CS_CODE
			,V_P_LOAN_NUM     : ''
			,V_P_PLAN_SEQ     : 0

			,V_P_FORM_ID: p_formId
			,V_P_MENU_ID: p_menuId
			,V_P_PROC_ID: ''
			,V_P_USERID: ''
			,V_P_PC: ''
		};

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl1030List.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '5',
			params: gfnma_objectToString(paramObj)
		});

		const data = await postJsonPromise;

		try {

			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
				let totalRecordCount = 0;

				jsonTrl1030Top.length = 0;
				data.cv_1.forEach((item, index) => {
					const msg = {
						LOAN_NUM        	: gfn_nvl(item.BRW_NO),
						FI_ORG_CODE        	: gfn_nvl(item.ACNTG_OGNZ_CD),
						SITE_CODE        	: gfn_nvl(item.SITE_CD),
						BANK_CS_CODE        : gfn_nvl(item.BANK_CD),
						LOAN_CATEGORY1      : gfn_nvl(item.LOAN_CTGRY1),
						LOAN_CATEGORY2      : gfn_nvl(item.LOAN_CTGRY2),
						LOAN_CATEGORY3      : gfn_nvl(item.LOAN_CTGRY3),
						LOAN_NAME        	: gfn_nvl(item.BRW_NM),
						LOAN_DATE        	: gfn_nvl(item.BRW_YMD),
						LOAN_AMT        	: gfn_nvl(item.LOAN_AMT),
						REPAY_AMT        	: gfn_nvl(item.RPMT_AMT),
						REMAIN_AMT        	: gfn_nvl(item.REMAIN_AMT),
						EXPIRE_DATE        	: gfn_nvl(item.MTRY_YMD),
						CURRENCY_CODE       : gfn_nvl(item.CRN_CD),
						INTEREST_RATE       : gfn_nvl(item.INT_RT),
						LOAN_TYPE        	: gfn_nvl(item.BRW_TYPE),
						REPAY_BANK_CS_CODE  : gfn_nvl(item.RPMT_BANK_CNPT_CD),
						REPAY_SEQ        	: gfn_nvl(item.RPMT_SEQ),
						HDG_FLAG        	: gfn_nvl(item.DRSEC_FLAG),


					}
					jsonTrl1030Top.push(msg);
					totalRecordCount++;
				});
				Trl1030GridTop.rebuild();

				if(jsonTrl1030Top.length > 0) {
					Trl1030GridTop.clickRow(gfn_nvl(row) == '' ? 1 : row);
				}
				document.querySelector('#listCount').innerText = totalRecordCount;


			} else {
				alert(data.resultMessage);
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
	 * 목록 조회
	 */
	const fn_P_TRL1010_Q = async function (strWorkType, grdData) {

		let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//APC명
		let BASE_DATE 		= gfn_nvl(SBUxMethod.get("SCH_BASE_DATE")); 	//조회기준일자
		let ALL_YN 			= gfn_nvl(SBUxMethod.get("SCH_ALL_YN")); 		//만기차입금포함여부
		let LOAN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_LOAN_TYPE")); 	//차입금유형
		let BANK_CS_CODE 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_CODE")); 	//차입기관

		if (_.isEqual(strWorkType, 'LIST')){

			/*if (!FI_ORG_CODE) {
                gfn_comAlert("W0002", "APC명");
                return;
            }*/
			if (!BASE_DATE) {
				gfn_comAlert("W0002", "조회기준일자");
				return;
			}

		}

		var paramObj = {
			V_P_DEBUG_MODE_YN: ''
			,V_P_LANG_ID: ''
			,V_P_COMP_CODE: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE: gv_ma_selectedClntCd

			,V_P_FI_ORG_CODE  : FI_ORG_CODE /*fi_org_code*/
			,V_P_BASE_DATE    : BASE_DATE
			,V_P_TXN_DATE_FR  : ''
			,V_P_TXN_DATE_TO  : ''
			,V_P_ALL_YN       : ALL_YN
			,V_P_LOAN_TYPE    : LOAN_TYPE
			,V_P_BANK_CS_CODE : BANK_CS_CODE
			,V_P_LOAN_NUM     : gfn_nvl(grdData.LOAN_NUM)
			,V_P_PLAN_SEQ     : gfn_nvl(grdData.PLAN_SEQ)

			,V_P_FORM_ID: p_formId
			,V_P_MENU_ID: p_menuId
			,V_P_PROC_ID: ''
			,V_P_USERID: ''
			,V_P_PC: ''
		};

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl1030List.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '5',
			params: gfnma_objectToString(paramObj)
		});

		const data = await postJsonPromise;

		try {

			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
				//let totalRecordCount = 0;

				/**************************** 상환계획 **********************************/
				jsonTrl1030Tab5.length = 0;
				data.cv_4.forEach((item, index) => {
					const msg = {
						TXN_ID        				: gfn_nvl(item.TRSC_ID),
						LOAN_NUM        			: gfn_nvl(item.BRW_NO),
						PLAN_SEQ        			: gfnma_nvl2(item.PLAN_SEQ),
						CURRENCY_CODE        		: gfn_nvl(item.CRN_CD),
						REPAY_PLAN_DATE        		: gfn_nvl(item.RPMT_PLAN_YMD),
						REPAY_TRANSFER_AMT        	: gfn_nvl(item.BRW_RPLCMT_AMT),
						REMAIN_LOAN_AMT        		: gfn_nvl(item.NRPY_AMT),
						INTEREST_DAY        		: gfn_nvl(item.INT_DCNT),
						INTEREST_REPAY_PLAN_AMT     : gfn_nvl(item.INT_PRNMNT_AMT),
						REPAY_TOTAL_AMT        		: gfn_nvl(item.REPAY_TOTAL_AMT),
						INTEREST_FROM_DATE        	: gfn_nvl(item.INT_BGNG_YMD),
						INTEREST_TO_DATE        	: gfn_nvl(item.INT_END_YMD),
						INTEREST_RATE        		: gfn_nvl(item.INT_RT),	//--종료일자
						INTERFACE_FLAG        		: gfn_nvl(item.IF_FLAG),
						CONFIRM_FLAG        		: gfn_nvl(item.CFMTN_FLAG),
						COMPLETE_FLAG        		: gfn_nvl(item.CFMTN_FLAG),
						UPDATE_TIME        			: gfn_nvl(item.UPDT_DT),
						HDG_TRANS_AMT        		: gfn_nvl(item.DRSEC_DLNG_AMT),

					}
					jsonTrl1030Tab5.push(msg);
					//totalRecordCount++;
				});

				Trl1030GridTab5.rebuild();
				//document.querySelector('#listCount2').innerText = totalRecordCount;


			} else {
				alert(data.resultMessage);
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}

	}

	const fn_keyup = async function(event) {
		if(event.keyCode == 38 || event.keyCode == 40) {
			fn_view();
		}
	}

	//상세정보 보기
	async function fn_view() {
		var nCol = Trl1030GridTop.getCol();
		var nRow = Trl1030GridTop.getRow();

		if (nCol == -1) {
			return;
		}

		if (nRow == -1) {
			return;
		}

		let gridData = Trl1030GridTop.getRowData(nRow);

		if (_.isEmpty(gridData)){
			return;
		}


		fn_P_TRL1010_Q('DETAIL', gridData);


	}



	// 행 추가 [상황계횐]
	const fn_btnAdd = function() {
		let rowVal = Trl1030GridTab5.getRow();

		let LOAN_NUM 	= gfn_nvl(SBUxMethod.get("FM_LOAN_NUM")); //차입금번호

		const msg = {
			LOAN_NUM            		: LOAN_NUM,	//차입금번호
			PLAN_SEQ            		: '',		//순번
			REPAY_PLAN_DATE  			: '',		//상환예정일
			CURRENCY_CODE    			: '',		//통화
			REPAY_TOTAL_AMT            	: 0,		//총상환액
			REPAY_TRANSFER_AMT          : 0,		//차입금대체
			REPAY_PLAN_AMT            	: 0,		//원금상환예정액
			REMAIN_LOAN_AMT            	: 0,		//차입금잔액
			INTEREST_REPAY_PLAN_AMT     : 0,		//이자상환예정액
			INTEREST_RATE            	: 0,		//이자율
			INTEREST_DAY            	: '',		//이자일수
			INTEREST_FROM_DATE          : '',		//적용시작일
			INTEREST_TO_DATE          	: '',		//적용종료일
			CONFIRM_FLAG            	: 'N',		//확정여부
			INTERFACE_FLAG            	: 'N',		//전송여부
			COMPLETE_FLAG            	: 'N',		//완료여부
			TXN_ID            			: '',		//id


			status: 'i'
		}

		if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
			Trl1030GridTab5.addRow(true, msg);
		}else{
			Trl1030GridTab5.insertRow(rowVal, 'below', msg);
		}
	}

	// 행삭제 [상황계횐]
	const fn_btnDel = async function () {

		let rowVal = Trl1030GridTab5.getRow();

		if (rowVal == -1) {
			gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
			return;
		} else {
			Trl1030GridTab5.deleteRow(rowVal);
		}

	}

	// 최초상황계횐
	const fn_btnPlan = async function () {

		if (gfn_comConfirm("Q0000", "기존 상환계획 정보를 초기화하고 새로운 상환계획 정보를 불러오시겠습니까?")) {

			let strloan_num = '';

			var nRow = Trl1030GridTop.getRow();

			let gridData = Trl1030GridTop.getRowData(nRow);

			if (_.isEmpty(gridData) == false){
				strloan_num = gridData.LOAN_NUM;
			}

			//GridDeleteAllRow(grdPlan);
			await fn_P_TRL1010_Q("PLAN", gridData);
			await fn_P_TRL1010_Q("DETAIL", gridData);
			if (strloan_num != '')
			{
				//gvwInfo.FocusedRowHandle = GetGridRowIndex(grdInfo, "loan_num", strloan_num);
				//fn_P_TRL1010_Q_LIST('LIST', nRow);
			}

		}

	}

	// 재계산
	const fn_btnReCalc = async function () {

		if (gfn_comConfirm("Q0000", "기존 현재가치관리 정보를 초기화하고 새로운 정보를 불러오시겠습니까?")) {

			let strloan_num = '';

			var nRow = Trl1030GridTop.getRow();

			let gridData = Trl1030GridTop.getRowData(nRow);

			if (_.isEmpty(gridData) == false){
				strloan_num = gridData.LOAN_NUM;
			}

			//GridDeleteAllRow(grdPlan);
			await fn_P_TRL1010_Q("RECALC", gridData);
			await fn_P_TRL1010_Q("DETAIL", gridData);
			if (strloan_num != '')
			{
				//gvwInfo.FocusedRowHandle = GetGridRowIndex(grdInfo, "loan_num", strloan_num);
				//fn_P_TRL1010_Q_LIST('LIST', nRow);
			}
		}
	}

	//저장
	const fn_P_TRL1010_S2 = async function (updatedData) {

		let listData = [];
		listData =  await getParamForm(updatedData);

		if (listData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/ffa/alm/insertTrl1030S2.do", {listData: listData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {

					if (data.resultMessage) {
						if (_.isEqual(data.v_errorCode, 'MSG0004') || _.isEqual(data.v_errorCode, 'MSG0002')){
							return true;
						}else {
							alert(data.resultMessage);
							return false;
						}
					}
					return true;

				} else {
					alert(data.resultMessage);
					return false;
				}
			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}else{
			return true;
		}
	}

	const getParamForm = async function (updatedData) {

		let returnData = [];

		updatedData.forEach((item, index) => {

			const param = {

				cv_count: '0',
				getType: 'json',
				workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN: ''
					, V_P_LANG_ID: ''
					, V_P_COMP_CODE: gv_ma_selectedCorpCd
					, V_P_CLIENT_CODE: gv_ma_selectedClntCd

					,V_P_LOAN_NUM                : gfnma_nvl2(item.data.LOAN_NUM)
					,V_P_TXN_ID                  : gfnma_nvl2(item.data.TXN_ID)						//-- 계획연번
					,V_P_PLAN_SEQ                : gfnma_nvl2(item.data.PLAN_SEQ)					//-- 계획연번
					,V_P_REPAY_PLAN_DATE         : gfnma_nvl2(item.data.REPAY_PLAN_DATE)			//-- 상환예정일
					,V_P_CURRENCY_CODE           : gfnma_nvl2(item.data.CURRENCY_CODE)				//-- 통화
					,V_P_REPAY_PLAN_AMT          : gfnma_nvl2(item.data.REPAY_PLAN_AMT)				//-- 원금상환예정액
					,V_P_REPAY_TRANSFER_AMT      : gfnma_nvl2(item.data.REPAY_TRANSFER_AMT)			//-- 차입금 대체액
					,V_P_INTEREST_RATE           : gfnma_nvl2(item.data.INTEREST_RATE)				//-- 이자율
					,V_P_REMAIN_LOAN_AMT         : gfnma_nvl2(item.data.REMAIN_LOAN_AMT)			//-- 차입금잔액
					,V_P_INTEREST_REPAY_PLAN_AMT : gfnma_nvl2(item.data.INTEREST_REPAY_PLAN_AMT)	//-- 이자상환예정액
					,V_P_INTEREST_DAY            : gfnma_nvl2(item.data.INTEREST_DAY)				//-- 이자일수
					,V_P_INTEREST_FROM_DATE      : gfnma_nvl2(item.data.INTEREST_FROM_DATE)			//-- 적용시작일
					,V_P_INTEREST_TO_DATE        : gfnma_nvl2(item.data.INTEREST_TO_DATE)			//-- 적용종료일
					,V_P_INTERFACE_FLAG          : gfnma_nvl2(item.data.INTERFACE_FLAG)				//-- INTERFACE FLAG
					,V_P_CONFIRM_FLAG            : gfnma_nvl2(item.data.CONFIRM_FLAG)				//-- CONFIRM FLAG
					,V_P_COMPLETE_FLAG           : gfnma_nvl2(item.data.COMPLETE_FLAG)				//-- COMPLETE FLAG
					,V_P_HDG_TRANS_AMT           : 0		//--20200528 LJE

					, V_P_FORM_ID: p_formId
					, V_P_MENU_ID: p_menuId
					, V_P_PROC_ID: ''
					, V_P_USERID: ''
					, V_P_PC: ''

				})

			}

			returnData.push(param);

		});
		return returnData;
	}

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>