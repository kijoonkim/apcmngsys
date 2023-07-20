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
					<h3 class="box-title"> ▶ 입고실적조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="button" class="btn btn-sm btn-primary">초기화</sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
				</div>
			</div>
			
			
			<div>
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
							<th scope="row" >APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
						</tr>
						<tr>
							<th scope="row">생산일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" class="form-control pull-right input-sm"/>
								
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" class="form-control pull-right input-sm"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrty" name="srch-inp-vrty" class="form-control input-sm" placeholder="선택" />
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
							</td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prdcr" name="srch-inp-prdcr" class="form-control input-sm" placeholder="선택"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcrSrch" name="srch-btn-prdcrSrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd1" name="chk-wrhsKnd" uitype="normal" class="form-control input-sm" text="일반매입" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd2" name="chk-wrhsKnd" uitype="normal" class="form-control input-sm" text="공선"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd3" name="chk-wrhsKnd" uitype="normal" class="form-control input-sm" text="매취"/>
								</p>
							</td>
							<th scope="row">상품</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd1" name="chk-gsd" uitype="normal" class="form-control input-sm" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd2" name="chk-gsd" uitype="normal" class="form-control input-sm" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd3" name="chk-gsd" uitype="normal" class="form-control input-sm" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd4" name="chk-gsd" uitype="normal" class="form-control input-sm" text="유기농"/>
								</p>
							</td>
					    	<th scope="row">운송</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt1" name="chk-trsprt1" uitype="normal" class="form-control input-sm" text="자가" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt2" name="chk-trsprt2" uitype="normal" class="form-control input-sm" text="용역"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt3" name="chk-trsprt3" uitype="normal" class="form-control input-sm" text="기타"/>
								</p>
							</td>
						</tr>
						<tr>
						    <th scope="row">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-warehouse" name="srch-slt-warehouse" class="form-control input-sm"/>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhclNo" name="srch-inp-vhclNo" class="form-control input-sm" placeholder="선택"/>
							</td>
							<td style="border-right: hidden;">
								<sbux-button id="srch-btn-vhclNoSrch" name="srch-btn-vhclNoSrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"/>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">계량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghNo" name="srch-inp-wghNo" class="form-control input-sm" placeholder="선택"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-wghNoSrch" name="srch-btn-wghNoSrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
							</td>
						</tr>
					</tbody>
				</table>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　원물입고 내역</span></li>
						</ul>
					</div>
					<div class="sbt-wrap-body">
						<div class="sbt-grid">
							<div id="inptCmndDsctnGridArea" style="height:340px;"></div>
						</div>
					</div>
			</div>
		</div>
	</section>
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vhclPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
		
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
	window.jsoninptCmndDsctnList =  [
		['test'],
	];
	
	function fn_createGrid() {
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
	        {caption: ["입고일자"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["순번"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["차량구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["운송료"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
	        {caption: ["입고중량"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>

</html>