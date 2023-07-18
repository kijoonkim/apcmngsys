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
					<h3 class="box-title">▶ 선별지시조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="srch-btn-search" name="srch-btn-search" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="srch-btn-insert" name="srch-btn-insert" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="srch-btn-delete" name="srch-btn-delete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
					<sbux-button id="srch-btn-terminate" name="srch-btn-terminate" uitype="button" class="btn btn-sm btn-outline-danger">종료</sbux-button>
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
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan= "2" class="td_input" style="border-right: hidden;">
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" disabled/>
							</td>
						</tr>
						<tr>
							<th scope="row">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-startCmndDate" name="srch-dtp-startDate">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCmndDate" name="srch-dtp-endDate">
							</td>
							<td>&nbsp;</td>
							<th scope="row" style="border-right: hidden;">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
<!-- 							<td class="td_input" style="border-right: hidden;"/> -->
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
								</select>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button>
							</td>
							<td>&nbsp;</td>
							
						</tr>
						<tr>
							<th scope="row">참고</th>
							<td class="td_input" style="border-right: hidden;">
								<select class="form-control input-sm">
									<option>단일선택</option>
								</select>
							</td>
						
						
						
						
						
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>투입지시 내역</span></li>
						<li><span>　　　지시중량 : 99.999Kg　　　　실적중량 : 99.999Kg</span></li>
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
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
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
	        {caption: ["지시번호","지시번호"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시일자","지시일자"], 	ref: 'msgCn',     	type:'output',  width:'130px',    style:'text-align:left'},
	        {caption: ["생산자","생산자"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'msgKndNm',    type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["투입지시","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["투입지시","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["투입실적","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["투입실적","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["비고","비고"],  	ref: 'msgKndNm',    type:'output',  width:'180px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
</script>
</html>