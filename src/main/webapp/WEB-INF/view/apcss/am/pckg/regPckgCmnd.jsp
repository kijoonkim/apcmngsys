<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title">▶ 포장지시등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="nonormal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="nonormal" text="조회"class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="nonormal" text="저장"class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="nonormal" text="삭제"class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
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
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" disabled/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-cmndDate" name="srch-dtp-cmndYmd" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm" jsondata-ref="jsonComVrty"></sbux-select>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonComSpcfct"></sbux-select>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">지시수량</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-cmndQntt" name="srch-inp-cmndQntt" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">생산설비</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-fclt" name="srch-slt-fclt" class="form-control input-sm" jsondata-ref="jsonComFclt"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">거래처</th>
						    <td colspan="3" class="td_input" style="border-right:hidden ;">
						    	<sbux-input uitype="text" id="srch-inp-cnpt" name="srch-inp-cnpt" class="form-control input-sm"/>
							<td class="td_input">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"/>
						    </td>
<!-- 						    <td colspan="2">&nbsp;</td> -->
						</tr>
						<tr>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-datepicker uitype="popup" id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row"  class="th_bg"style="border-right:hidden ;">상품명</th>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-gdsNm" name="srch-inp-gdsNm" class="form-control input-sm" disabled/>
							</td>
							<td >&nbsp;</td>
							<th scope="row"  class="th_bg"style="border-right:hidden ;">발주수량/입수</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-outordrQntt" name="srch-inp-outordrQntt" class="form-control input-sm" disabled/>
							</td>
							<td colspan="2" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-bxGdsQntt" name="srch-inp-bxGdsQntt" class="form-control input-sm" disabled/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">발주번호</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-gdsNo" name="srch-inp-gdsNo" class="form-control input-sm" disabled/>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>생산지시 내역</span></li>
						</ul>
					</div>
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea" style="height:450px;"></div>
						</div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem				= [];	// 품목 		itemCd		검색
	var jsonComVrty				= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct			= [];	// 규격 		spcfcCd		검색
	var jsonComFclt				= [];	// 설비 			fcltCd		검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-fclt', 			jsonComFclt, 			'FCLT_CD', gv_apcCd);			// 설비
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, gv_apcCd);	// 품목
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_apcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, gv_apcCd, itemCd);		// 규격
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();


		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-cmndYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		fn_initSBSelect();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = ["test"]; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
            {caption: ["선택"], ref: 'checked', type: 'checkbox', width : '60px', style: 'text-align:center'},
	        {caption: ["지시번호"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["생산설비"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["납기일자"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["규격"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["상품명"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["발주수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["입수"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>