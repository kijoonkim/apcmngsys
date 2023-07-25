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
								<sbux-datepicker uitype="popup" id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" class="form-control pull-right input-sm"></sbux-datepicker>

							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrtyCrtr" onclick="fn_modalVrty"/>
							</td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prdcr" name="srch-inp-prdcr" class="form-control input-sm"/>
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
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd1" name="chk-wrhsKnd1" uitype="normal" class="form-control input-sm" text="일반매입"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd2" name="chk-wrhsKnd2" uitype="normal" class="form-control input-sm" text="공선"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd3" name="chk-wrhsKnd3" uitype="normal" class="form-control input-sm" text="매취" checked/>
								</p>
							</td>
							<th scope="row">상품구분</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd1" name="chk-gsd1" uitype="normal" class="form-control input-sm" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd2" name="chk-gsd2" uitype="normal" class="form-control input-sm" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd3" name="chk-gsd3" uitype="normal" class="form-control input-sm" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd4" name="chk-gsd4" uitype="normal" class="form-control input-sm" text="유기농"/>
								</p>
							</td>
					    	<th scope="row">운송구분</th>
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
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhclNo" name="srch-inp-vhclNo" class="form-control input-sm"/>
							</td>
							<td style="border-right: hidden;">
								<sbux-button id="srch-btn-vhclNoSrch" name="srch-btn-vhclNoSrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"/>
							</td>
							<td colspan="5" style="border-right: hidden;">&nbsp;</td>

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
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem				= [];	// 품목 		itemCd			검색
	var jsonComWarehouseSeCd	= [];	// 창고 		warehouseSeCd	검색

	const fn_initSBSelect = async function() {
		// 검색 SB select
		gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_apcCd);	// 창고
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_apcCd);		// 품목
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

	window.jsoninptCmndDsctnList =  [
		[],
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
	        {caption: ["입고구분"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["차량구분"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["운송료"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
// 	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
// 	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
// 	        {caption: ["입고등급"],		ref: 'msgKey',      type:'output',  width:'30px',    style:'text-align:center'},
	        {caption: ["입고중량"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>

</html>