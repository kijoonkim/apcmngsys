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
					<h3 class="box-title">▶ 재고정보등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						
						<tr>
							<th scope="row" >APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
							<td colspan="9">&nbsp;</td>
						</tr>
						
						<tr>
							<th class="ta_r">재고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-invntrySe" name="srch-slt-invntrySe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th class="ta_r">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfct" name="srch-slt-spcfct" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						
						<tr>
							<th class="ta_r">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th class="ta_r">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prcdcr" name="srch-inp-prcdcr" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr" name="srch-btn-prdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th class="ta_r">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-gdsSe" name="srch-slt-gdsSe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						
						<tr>
							<th class="ta_r">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-wrhsSe" name="srch-slt-wrhsSe" class="form-control input-sm"/>
							</td>
							<td colspan="10">&nbsp;</td>
						</tr>
					</tbody>
				</table>


				<div class="sbt-wrap-body">
					<div class="ad_tbl_toplist">
							<sbux-button uitype="normal" id="srch-btn-rawmtrInvntrDsctn" name="srch-btn-rawmtrInvntrDsctn" class="btn btn-sm btn-outline-danger" text="원물재고 내역" onclick="fn_sample1()"></sbux-button>
							<sbux-button uitype="normal" id="srch-btn-sortInvntrDsctn" name="srch-btn-sortInvntrDsctn" class="btn btn-sm btn-outline-danger" text="선별재고 내역" onclick="fn_sample2()"></sbux-button>
							<sbux-button uitype="normal" id="srch-btn-gdsInvntrDsctn" name="srch-btn-gdsInvntrDsctn" class="btn btn-sm btn-outline-danger" text="상품재고 내역" onclick="fn_sample3()"></sbux-button>
					</div>
                    <div class="sbt-grid">
                        <div id="inptCmndDsctnGridArea" style="height:300px;"></div>
                    </div>
               	</div>
               	
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>

<script type="text/javascript">	
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid1();
// 		fn_createGrid2();
// 		fn_createGrid3();
		
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-crtrYmd", year+month+day);
	});

	var inptCmndDsctnList = []; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_sample1(){
		_SBGrid.destroy('inptCmndDsctnList');
		fn_createGrid1();
	}
	function fn_sample2(){
		_SBGrid.destroy('inptCmndDsctnList');
		fn_createGrid2();
	}
	function fn_sample3(){
		_SBGrid.destroy('inptCmndDsctnList');
		fn_createGrid3();
	}
	function fn_createGrid1() {
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
	        {caption: ["선택","선택"],		ref: 'msgKey',      type:'checkbox',  width:'50px',    style:'text-align:center'},
	        {caption: ["입고번호","입고번호"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["상품","상품"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고","입고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["운송","운송"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["입고","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["투입","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["투입","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
// 	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList2';
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
	    	{caption: ["선택","선택"],		ref: 'msgKey',      type:'checkbox',  width:'50px',    style:'text-align:center'},
	        {caption: ["선별번호","선별번호"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["투입일자","투입일자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["선별","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["선별","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
// 	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList3 = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid3() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList3';
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
	    	{caption: ["선택","선택"],		ref: 'msgKey',      type:'checkbox',  width:'50px',    style:'text-align:center'},
	        {caption: ["포장번호","포장번호"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["순번","순번"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["포장일자","포장일자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["포장","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["출하","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["출하","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],		ref: 'msgKey',      type:'output',  width:'55px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	
// 	function fn_closeModal(modalId){
// 		SBUxMethod.closeModal(modalId);
// 	}
</script>


</html>