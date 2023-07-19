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
					<h3 class="box-title">▶ 선별지시등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>
			<div class="box-body">
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
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
						</tr>
						<tr>		
							<th scope="row">입고일자</th>
							<td class="td_input" style="border-right: hidden;">
<!-- 								<sbux-datepicker uitype="range" id="srch-dtp-rangeDate" name="srch-dtp-rangeDate"> -->
								<sbux-datepicker uitype="popup" id="srch-dtp-startDate" name="srch-dtp-startDate">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endDate" name="srch-dtp-endDate">
							</td>
							<td>&nbsp;</td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
						    <th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-provider" name="srch-slt-provider" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-providerSrch" name="srch-btn-providerSrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">창고</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-container" name="srch-slt-container" class="form-control input-sm" placeholder="선택"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>투입대상 내역</span></li>
						</ul>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptTrgtDsctnGridArea" style="height:340px;"></div>
					</div>
				</div>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<table class="table table-bordered tbl_row tbl_fixed">
							<caption>검색 조건 설정</caption>
							<colgroup>
									<col style="width: 7%">
									<col style="width: 6%">
									<col style="width: 9%">
									<col style="width: 7%">
									<col style="width: 6%">
									<col style="width: 9%">
							</colgroup>
							<tr>
								<th scope="row">지시일자</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" class="form-control pull-right input-sm"/>
								</td>
								<td>&nbsp;</td>
								<th scope="row">투입설비</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-select uitype="single" id="srch-slt-inptEqupmnt" name="srch-slt-inptEqupmnt" class="form-control input-sm"/>
								</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>투입지시 내역</span></li>
							<li><span>　　　지시중량 : 99,999 Kg</span></li>
						</ul>
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
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid1();
		fn_createGrid2();
	});

	var inptTrgtDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptTrgtDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid1() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptTrgtDsctnGridArea';
	    SBGridProperties.id = 'inptTrgtDsctnList';
	    SBGridProperties.jsonref = 'jsoninptTrgtDsctnList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["선택","선택"],		ref: 'msgKey',      type:'output',  width:'50px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"], 	ref: 'msgCn',     	type:'output',  width:'90px',    style:'text-align:left'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["입고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["입고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["재고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["재고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["비고","비고"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	    ];
	    
	    inptTrgtDsctnList = _SBGrid.create(SBGridProperties);

	}
	
	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
<!-- 	    SBGridProperties.selectmode = 'byrow'; -->
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
	        {caption: ["선택","선택"],		ref: 'msgKey',      type:'output',  width:'50px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"], 	ref: 'msgCn',     	type:'output',  width:'100px',    style:'text-align:left'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["입고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["입고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["재고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["재고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["비고","비고"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
</script>

</html>