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
					<h3 class="box-title"> ▶ 원물입고등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="button" class="btn btn-sm btn-primary">원물인식표</sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">

						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="15" class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" disabled/>
							</td>
						</tr>
							<th scope="row">입고일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">입고구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs1" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="일반매입"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs2" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="공선"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs3" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="매취" checked/>
								</p>
							</td>

							<th scope="row">상품구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds1" name="srch-rdo-gds" uitype="normal" class="radio_label" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds2" name="srch-rdo-gds" uitype="normal" class="radio_label" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds3" name="srch-rdo-gds" uitype="normal" class="radio_label" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds4" name="srch-rdo-gds" uitype="normal" class="radio_label" text="유기농"/>
								</p>
							</td>
						<tr>
							<th scope="row">운송구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt1" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="자가" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt2" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="용역"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt3" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="기타"/>
								</p>
							</td>
							<th scope="row">생산자</th>
							<td colspan="12" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prdcr" name="srch-inp-prdcr" class="form-control input-sm"/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr" name="srch-btn-prdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
<!-- 							<td colspan="4">&nbsp;</td> -->
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-gds" name="srch-slt-gds" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">수량/중량</th>
							<td colspan="4" class="td_input"style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qntt" name="srch-inp-qntt" class="form-control input-sm"/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qnttAvg" name="srch-inp-qnttAvg" class="form-control input-sm" placeholder="평균" disabled/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wght" name="srch-inp-wght" class="form-control input-sm"/>
							</td>
							<td colspan="3">
								<sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"/>
							</td>
							<th scope="row">팔레트번호</th>
							<td colspan= "6" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-pltNo" name="srch-inp-pltNo" class="form-control input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-boxKnd" name="srch-slt-boxKnd" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-wrhs" name="srch-slt-wrhs" class="form-control input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량/운임</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhcl" name="srch-inp-vhcl" class="form-control input-sm"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vhcl" name="srch-btn-vhcl" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-trsprt" name="srch-inp-trsprt" class="form-control input-sm" disabled/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-trsprt" name="srch-btn-trsprt" class="btn btn-xs btn-outline-dark" text="등록" uitype="modal" target-id="modal-trsprtCst" onclick="fn_modalTrsprtCst"/>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm"/>
							</td>
						</tr>
						<tr>
							<th scope="row">등급</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-rate" name="srch-slt-rate" class="form-control input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">계량번호</th>
							<td colspan= "6" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghNo" name="srch-inp-wghNo" class="form-control input-sm" disabled/>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물입고 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger" onclick="fn_uld">올리기</sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea" style="height:340px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

    <!-- 생산자 선택 Modal -->
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
    <!-- 운임 선택 Modal -->
    <div>
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" style="width:1350px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
// 		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

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
	        {caption: ["입고번호"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["팔레트번호번호"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'msgKey',      type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["중량 Kg"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["박스종류"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>