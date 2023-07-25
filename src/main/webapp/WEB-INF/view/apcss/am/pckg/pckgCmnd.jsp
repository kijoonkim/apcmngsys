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
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title">▶ 포장지시조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="button" class="btn btn-sm btn-primary">포장지시서</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
				</div>
			</div>
			
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" disabled/>
							</td>
						</tr>
							<th scope="row" style="border-right:hidden ;">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-startCmndDate" name="srch-dtp-strtCmndYmd" class="form-control pull-right input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCmndDate" name="srch-dtp-endCmndYmd" class="form-control pull-right input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th scope="row">생산설비</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-prdctnFclt" name="srch-slt-prdctnFclt" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row">거래처</th>
						    <td colspan="2"class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-cnpt" name="srch-inp-cnpt" class="form-control input-sm"/>
							<td class="td_input">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"/>
							</td>
<!-- 							<td>&nbsp;</td> -->
						<tr>
							<th scope="row">납기일자</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-datepicker uitype="popup" id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfct" name="srch-slt-spcfct" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">발주번호</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-gdsNo" name="srch-inp-gdsNo" class="form-control input-sm"/>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>지시 내역</span></li>
						</ul>
					</div>
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea" style="height:340px;"></div>
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
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();
		
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-strtCmndYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endCmndYmd", year+month+day);
// 		SBUxMethod.set("srch-dtp-dudtYmd", year+month+day);
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
 	        {caption: ["순번","순번"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["지시번호","지시번호"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산설비","생산설비"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["거래처","거래처"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["규격","규격"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["납기일자","납기일자"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["상품명","상품명"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["발주","수량"],		ref: 'msgKey',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["발주","중량"],		ref: 'msgKey',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["지시","수량"],		ref: 'msgKey',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["지시","중량"],		ref: 'msgKey',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["실적","수량"],		ref: 'msgKey',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["실적","중량"],		ref: 'msgKey',      type:'output',  width:'90px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>