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
<!-- 			<div class="box-header"> -->
<!-- 				<h3 class="box-title"> ▶ 입고실적조회</h3> -->
<!-- 					<div class="ad_tbl_top"> -->
<!-- 					<div class="ad_tbl_toplist"> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">초기화</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">조회</button> -->
<!-- 						<button type="button" class="btn btn-sm btn-outline-danger">종료</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
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
<!-- 								<input type="text" class="form-control input-sm" placeholder="" disabled> -->
							</td>
						</tr>
						<tr>
							<th scope="row">생산일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd">
								
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd">
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
								
<!-- 								<select class="form-control input-sm"> -->
<!-- 									<option>단일선택</option> -->
<!-- 								</select> -->
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrty" name="srch-inp-vrty" class="form-control input-sm" placeholder="멀티선택" />
<!-- 								<input type="text" class="form-control input-sm" placeholder="멀티선택" title=""> -->
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
<!-- 								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button> -->
							</td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prdcr" name="srch-inp-prdcr" class="form-control input-sm" placeholder="멀티선택"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="멀티선택" title=""> -->
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-prdcrSrch" name="srch-btn-prdcrSrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
<!-- 								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button> -->
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd1" name="chk-wrhsKnd" uitype="normal" class="form-control input-sm" text="일반매입" checked/>
<!-- 									<sbux-radio id="srch-rdo-trsprt1" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="자가" checked/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd2" name="chk-wrhsKnd" uitype="normal" class="form-control input-sm" text="공선"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt2" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="용역"/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsKnd3" name="chk-wrhsKnd" uitype="normal" class="form-control input-sm" text="매취"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt3" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="기타"/> -->
								</p>
								
								
<!-- 								<p class="ad_input_row"> -->
<!-- 									<sbux-radio id="srch-rdo-wrhsKnd1" name="srch-rdo-wrhsKnd" uitype="normal" class="radio_label" text="일반매입" checked/> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<sbux-radio id="srch-rdo-wrhsKnd2" name="srch-rdo-wrhsKnd" uitype="normal" class="radio_label" text="공선"/> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<sbux-radio id="srch-rdo-wrhsKnd3" name="srch-rdo-wrhsKnd" uitype="normal" class="radio_label" text="매취"/> -->
<!-- 								</p> -->
								
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default" checked> -->
<!-- 									<label class="check_label" for="check_default">일반매입</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">공선</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">매취</label> -->
<!-- 								</p> -->
							</td>
							<th scope="row">상품</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd1" name="chk-gsd" uitype="normal" class="form-control input-sm" text="일반" checked/>
<!-- 									<sbux-radio id="srch-rdo-trsprt1" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="자가" checked/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd2" name="chk-gsd" uitype="normal" class="form-control input-sm" text="GAP"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt2" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="용역"/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd3" name="chk-gsd" uitype="normal" class="form-control input-sm" text="무농약"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt3" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="기타"/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-gsd4" name="chk-gsd" uitype="normal" class="form-control input-sm" text="유기농"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt3" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="기타"/> -->
								</p>
								
<!-- 								<p class="ad_input_row"> -->
<!-- 									<sbux-radio id="srch-rdo-gsd2" name="srch-rdo-gsd" uitype="normal" class="radio_label" text="GAP"/> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<sbux-radio id="srch-rdo-gsd3" name="srch-rdo-gsd" uitype="normal" class="radio_label" text="무농약"/> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<sbux-radio id="srch-rdo-gsd4" name="srch-rdo-gsd" uitype="normal" class="radio_label" text="유기농"/> -->
<!-- 								</p> -->
								
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default" checked> -->
<!-- 									<label class="check_label" for="check_default">일반</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">GAP</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">무농약</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">유기농</label> -->
<!-- 								</p> -->
							</td>
					    	<th scope="row">운송</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt1" name="chk-trsprt1" uitype="normal" class="form-control input-sm" text="자가" checked/>
<!-- 									<sbux-radio id="srch-rdo-trsprt1" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="자가" checked/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt2" name="chk-trsprt2" uitype="normal" class="form-control input-sm" text="용역"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt2" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="용역"/> -->
								</p>
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-trsprt3" name="chk-trsprt3" uitype="normal" class="form-control input-sm" text="기타"/>
<!-- 									<sbux-radio id="srch-rdo-trsprt3" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="기타"/> -->
								</p>
								
<!-- 								<p class="ad_input_row"> -->
<!-- 								<input type="checkbox" class="check" id="check_default" checked> -->
<!-- 									<label class="check_label" for="check_default">자가</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">용역</label> -->
<!-- 								</p> -->
<!-- 								<p class="ad_input_row"> -->
<!-- 									<input type="checkbox" class="check" id="check_default"> -->
<!-- 									<label class="check_label" for="check_default">기타</label> -->
<!-- 								</p> -->
							</td>
						</tr>
						<tr>
						    <th scope="row">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-warehouse" name="srch-slt-warehouse" class="form-control input-sm"/>
<!-- 								<select class="form-control input-sm"> -->
<!-- 									<option>선택</option> -->
<!-- 								</select> -->
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhclNo" name="srch-inp-vhclNo" class="form-control input-sm" placeholder="선택"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="선택" title=""> -->
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-vhclNoSrch" name="srch-btn-vhclNoSrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
<!-- 								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button> -->
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">계량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghNo" name="srch-inp-wghNo" class="form-control input-sm" placeholder="선택"/>
<!-- 								<input type="text" class="form-control input-sm" placeholder="선택" title=""> -->
							</td>
							<td style="border-right: hidden;">
								<sbux-button uitype="normal" id="srch-btn-wghNoSrch" name="srch-btn-wghNoSrch" class="btn btn-xs btn-outline-dark" text="찾기"/>
<!-- 								<button class="btn btn-xs btn-outline-dark" type="button">찾기</button> -->
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
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
<!-- 					<div class="table-responsive tbl_scroll_sm"> -->
<!-- 						<table class="table table-bordered table-hover tbl_col tbl_fixed"> -->
<!-- 							<caption>검색결과 목록</caption> -->
<!-- 							<colgroup> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 3%"> -->
<!-- 								<col style="width: 4%"> -->
<!-- 								<col style="width: 3%"> -->
<!-- 								<col style="width: 3%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 								<col style="width: 5%"> -->
<!-- 								<col style="width: 2%"> -->
<!-- 								<col style="width: 2%"> -->
<!-- 								<col style="width: 2%"> -->
<!-- 								<col style="width: 2%"> -->
<!-- 								<col style="width: 2%"> -->
<!-- 								<col style="width: 6%"> -->
<!-- 							</colgroup> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th scope="col">입고일자</th> -->
<!-- 									<th scope="col">순번</th> -->
<!-- 									<th scope="col">생산자</th> -->
<!-- 									<th scope="col">품목</th> -->
<!-- 									<th scope="col">품종</th> -->
<!-- 									<th scope="col">입고구분</th> -->
<!-- 									<th scope="col">운송구분</th> -->
<!-- 									<th scope="col">상품구분</th> -->
<!-- 									<th scope="col">차량번호</th> -->
<!-- 									<th scope="col">운송료</th> -->
<!-- 									<th colspan="5">입고등급</th> -->
<!-- 									<th scope="col">입고중량</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
						<div class="sbt-wrap-body">
							<div class="sbt-grid">
								<div id="inptCmndDsctnGridArea2" style="height:340px;"></div>
							</div>
						</div>
<!-- 						<table class="table table-bordered table-hover tbl_col tbl_fixed"> -->
<!-- 							<caption>검색결과 목록</caption> -->
<!-- 							<colgroup> -->
<!-- 								<col style="width: 15%"> -->
<!-- 								<col style="width: 15%"> -->
<!-- 								<col style="width: 15%"> -->
<!-- 								<col style="width: 45%"> -->
<!-- 							</colgroup> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th scope="col">보관창고</th> -->
<!-- 									<th scope="col">계량번호</th> -->
<!-- 									<th scope="col">팔레트번호</th> -->
<!-- 									<th scope="col">비고</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 									<td>&nbsp;</td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 						</table> -->

<!-- 					</div> -->

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
		fn_createGrid();
		fn_createGrid2();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	
	window.jsoninptCmndDsctnList =  [
		['test','test','test','test','test','test','test','test','test','test','test','test','test','test','test'],
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
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = []; // 그리드의 참조 데이터 주소 선언
	
	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea2';
	    SBGridProperties.id = 'inptCmndDsctnList2';
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
	        {caption: ["보관창고"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],		ref: 'msgKey',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'800px',    style:'text-align:center'},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
</script>

</html>