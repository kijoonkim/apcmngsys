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
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title" style="line-height: 30px;">▶선별실적등록</h3>
			</div>
			<div style="margin-left: auto;">
				<p class="ad_input_row">
					<sbux-checkbox id="check_all" name="check_all" uitype="normal" text="포장실적 자동등록" class="check"></sbux-checkbox>
				</p>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-dark"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-dark"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-dark"></sbux-button>
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
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8"></td>
						</tr>
						<tr>
						<th scope="row">입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmd1" name="srch-dtp-wrhsYmd1" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmd2" name="srch-dtp-wrhsYmd2" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemNm" name="srch-slt-itemNm" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrtyNm" name="srch-slt-vrtyNm" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td></td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrNm" name="srch-inp-prdcrNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-slt-prdcrNm" name="srch-btn-slt-prdcrNm" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
							<td class="td_input" ></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>원물재고내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-grdInptPremnc" style="height:300px;"></div>
					</div>
<!-- 					<div class="ad_section_bottom"></div> -->
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
									<th scope="row">선별일자</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-datepicker id="srch-dtp-inptYmd" name="srch-dtp-inptYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
									</td>
									<td colspan="2"></td>
									<th scope="row">설비</th>
									<td class="td_input" style="border-right: hidden;">
									<sbux-select id="srch-slt-fcltCd" name="srch-slt-fcltCd" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
									</td>
									<td colspan="2"></td>
									<th scope="row">선별 투입량</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-inp-sortWght" name="srch-inp-sortWght" uitype="text" placeholder="" class="form-control input-sm" disabled>
									</td>
									<td style="border-right: hidden;">
										<label class="bold">Kg</label>
									</td>
								</tr>
							</tbody>
			            </table>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>선별실적 내역</span></li>
								</ul>
								<div class="ad_tbl_toplist">
									<sbux-button id="btnDown" name="btnDown" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger"></sbux-button>
									<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger"></sbux-button>
								</div>
							</div>
						<div class="table-responsive tbl_scroll_sm">
							<div id="sb-area-grdInptPremnc2" style="height:340px;"></div>
						</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="사용자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
	<script type="text/javascript">
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createInptPremncGrid1();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd1", year+month+day);
		SBUxMethod.set("srch-dtp-wrhsYmd2", year+month+day);
		SBUxMethod.set("srch-dtp-inptYmd", year+month+day);
	})

	function fn_createInptPremncGrid1() {
	    var SBGridProperties1 = {};
		    SBGridProperties1.parentid = 'sb-area-grdInptPremnc';
		    SBGridProperties1.id = 'grdComMsgList';
		    SBGridProperties1.jsonref = 'jsonComMsgList';
		    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties1.selectmode = 'byrow';
		    SBGridProperties1.extendlastcol = 'scroll';
		    SBGridProperties1.columns = [
	             {caption: ["입고일자","입고일자"],		ref: 'msgKey',      type:'output',  width:'16%'},
	             {caption: ["팔레트번호","팔레트번호"], 	ref: 'msgCn',     	type:'output',  width:'16%'},
	             {caption: ["지시번호","지시번호"], 	 	ref: 'msgKndNm',    type:'output',  width:'16%'},
	             {caption: ["생산자","생산자"],    		ref: 'rmrk',        type:'output',  width:'16%'},
	             {caption: ["품종","품종"],	    		ref: 'creUserId',   type:'output',  width:'16%'},
	             {caption: ["창고","창고"],	    		ref: 'creDateTime', type:'output',  width:'16%'},
	             {caption: ["원물재고","수량"],  		ref: 'updUserId',   type:'output',  width:'8%'},
	             {caption: ["원물재고","중량"],  		ref: 'updUserId',   type:'output',  width:'8%'},
	             {caption: ["투입지시","수량"],  		ref: 'updDateTime', type:'output',  width:'8%'},
	             {caption: ["투입지시","중량"],  		ref: 'updDateTime', type:'output',  width:'8%'},
	             {caption: ["투입","수량"], 			ref: 'creProgram',  type:'output',  width:'8%'},
	             {caption: ["투입","중량"], 			ref: 'creProgram',  type:'output',  width:'8%'}
	    ];
		    
	    var SBGridProperties2 = {};
		    SBGridProperties2.parentid = 'sb-area-grdInptPremnc2';
		    SBGridProperties2.id = 'grdComMsgList2';
		    SBGridProperties2.jsonref = 'jsonComMsgList2';
		    SBGridProperties2.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties2.selectmode = 'byrow';
		    SBGridProperties2.extendlastcol = 'scroll';
		    SBGridProperties2.columns = [
	             {caption: ["선별일자"],	ref: 'msgKey',      type:'output',  width:'10%'},
	             {caption: ["설비"], 		ref: 'msgCn',     	type:'output',  width:'10%'},
	             {caption: ["규격"], 	 	ref: 'msgKndNm',    type:'output',  width:'10%'},
	             {caption: ["특"],    	ref: 'rmrk',        type:'output',  width:'10%'},
	             {caption: ["상"],	    ref: 'creUserId',   type:'output',  width:'10%'},
	             {caption: ["중"],	    ref: 'creDateTime', type:'output',  width:'10%'},
	             {caption: ["하"],  		ref: 'updUserId',   type:'output',  width:'10%'},
	             {caption: ["합계"], 	 	ref: 'updUserId',   type:'output',  width:'10%'},
	             {caption: ["kg"],  		ref: 'updDateTime', type:'output',  width:'10%'},
	             {caption: ["저장창고"],  	ref: 'updDateTime', type:'output',  width:'10%'},
	             {caption: ["비고"], 		ref: 'creProgram',  type:'output',  width:'10%'},
	             {caption: ["라벨"], 		ref: 'creProgram',  type:'output',  width:'10%'},
	             {caption: ["처리"], 		ref: 'creProgram',  type:'output',  width:'10%'}
		        
	    ];
	    grdWghPrfmnc1 = _SBGrid.create(SBGridProperties1);
	    grdWghPrfmnc2 = _SBGrid.create(SBGridProperties2);
	}
	
	// ${comMenuVO.menuId}
	
	// 공통코드 JSON
// 	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
//     // only document
//     window.addEventListener('DOMContentLoaded', function(e) {
    	
//     	fn_createInptPremncGrid1();
//     });
    
//     //grid 초기화
//     var grdComMsgList; // 그리드를 담기위한 객체 선언
//     var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언
    
//     function fn_createInptPremncGrid1() {
//         var SBGridProperties1 = {};
// 	    SBGridProperties1.parentid = 'sb-area-grdInptPremnc';
// 	    SBGridProperties1.id = 'grdComMsgList1';
// 	    SBGridProperties1.jsonref = 'jsonComMsgList1';
//         SBGridProperties1.emptyrecords = '데이터가 없습니다.';
//         SBGridProperties1.selectmode = 'byrow';
// 	    SBGridProperties1.explorerbar = 'sortmove';
// 	    SBGridProperties1.extendlastcol = 'scroll';
// 	    SBGridProperties1.paging = {
// 			'type' : 'page',
// 		  	'count' : 5,
// 		  	'size' : 20,
// 		  	'sorttype' : 'page',
// 		  	'showgoalpageui' : true
// 	    };
//         SBGridProperties1.columns = [
//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>","<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
//                 width: '6px'
//             },
//             {caption: ["입고일자","입고일자"],		ref: 'msgKey',      type:'output',  width:'16%'},
//             {caption: ["팔레트번호","팔레트번호"], 	ref: 'msgCn',     	type:'output',  width:'16%'},
//             {caption: ["지시번호","지시번호"], 	 	ref: 'msgKndNm',    type:'output',  width:'16%'},
//             {caption: ["생산자","생산자"],    		ref: 'rmrk',        type:'output',  width:'16%'},
//             {caption: ["품종","품종"],	    		ref: 'creUserId',   type:'output',  width:'16%'},
//             {caption: ["창고","창고"],	    		ref: 'creDateTime', type:'output',  width:'16%'},
//             {caption: ["원물재고","수량"],  		ref: 'updUserId',   type:'output',  width:'8%'},
//             {caption: ["원물재고","중량"],  		ref: 'updUserId',   type:'output',  width:'8%'},
//             {caption: ["투입지시","수량"],  		ref: 'updDateTime', type:'output',  width:'8%'},
//             {caption: ["투입지시","중량"],  		ref: 'updDateTime', type:'output',  width:'8%'},
//             {caption: ["투입","수량"], 			ref: 'creProgram',  type:'output',  width:'8%'},
//             {caption: ["투입","중량"], 			ref: 'creProgram',  type:'output',  width:'8%'}
//         ];
        
//         var SBGridPropertie2s = {};
// 	    SBGridProperties2.parentid = 'sb-area-grdPremnc';
// 	    SBGridProperties2.id = 'grdComMsgList2';
// 	    SBGridProperties2.jsonref = 'jsonComMsgList2';
//         SBGridProperties2.emptyrecords = '데이터가 없습니다.';
//         SBGridProperties2.selectmode = 'byrow';
// 	    SBGridProperties2.explorerbar = 'sortmove';
// 	    SBGridProperties2.extendlastcol = 'scroll';
// 	    SBGridProperties2.paging = {
// 			'type' : 'page',
// 		  	'count' : 5,
// 		  	'size' : 20,
// 		  	'sorttype' : 'page',
// 		  	'showgoalpageui' : true
// 	    };
//         SBGridProperties2.columns = [
//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
//                 width: '6px'
//             },
//             {caption: ["선별일자"],	ref: 'msgKey',      type:'output',  width:'7.46%'},
//             {caption: ["설비"], 		ref: 'msgCn',     	type:'output',  width:'7.46%'},
//             {caption: ["규격"], 	 	ref: 'msgKndNm',    type:'output',  width:'7.46%'},
//             {caption: ["특"],    	ref: 'rmrk',        type:'output',  width:'7.46%'},
//             {caption: ["상"],	    ref: 'creUserId',   type:'output',  width:'7.46%'},
//             {caption: ["중"],	    ref: 'creDateTime', type:'output',  width:'7.46%'},
//             {caption: ["하"],  		ref: 'updUserId',   type:'output',  width:'7.46%'},
//             {caption: ["합계"], 	 	ref: 'updUserId',   type:'output',  width:'7.46%'},
//             {caption: ["kg"],  		ref: 'updDateTime', type:'output',  width:'7.46%'},
//             {caption: ["저장창고"],  	ref: 'updDateTime', type:'output',  width:'7.46%'},
//             {caption: ["비고"], 		ref: 'creProgram',  type:'output',  width:'7.46%'},
//             {caption: ["라벨"], 		ref: 'creProgram',  type:'output',  width:'7.46%'},
//             {caption: ["처리"], 		ref: 'creProgram',  type:'output',  width:'7.46%'}
//         ];
        
//         grdComMsgList1 = _SBGrid.create(SBGridProperties1);
//         grdComMsgList2 = _SBGrid.create(SBGridProperties2);
//     }
    
//     function fn_createPremncGrid() {
//         var SBGridProperties = {};
// 	    SBGridProperties.parentid = 'sb-area-grdPremnc';
// 	    SBGridProperties.id = 'grdComMsgList1';
// 	    SBGridProperties.jsonref = 'jsonComMsgList1';
//         SBGridProperties.emptyrecords = '데이터가 없습니다.';
//         SBGridProperties.selectmode = 'byrow';
// 	    SBGridProperties.explorerbar = 'sortmove';
// 	    SBGridProperties.extendlastcol = 'scroll';
// 	    SBGridProperties.paging = {
// 			'type' : 'page',
// 		  	'count' : 5,
// 		  	'size' : 20,
// 		  	'sorttype' : 'page',
// 		  	'showgoalpageui' : true
// 	    };
//         SBGridProperties.columns = [
//             {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
//                 ref: 'checked', type: 'checkbox',   style: 'text-align:center',
//                 typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
//                 width: '6px'
//             },
//             {caption: ["선별일자"],	ref: 'msgKey',      type:'output',  width:'7.46%'},
//             {caption: ["설비"], 		ref: 'msgCn',     	type:'output',  width:'7.46%'},
//             {caption: ["규격"], 	 	ref: 'msgKndNm',    type:'output',  width:'7.46%'},
//             {caption: ["특"],    	ref: 'rmrk',        type:'output',  width:'7.46%'},
//             {caption: ["상"],	    ref: 'creUserId',   type:'output',  width:'7.46%'},
//             {caption: ["중"],	    ref: 'creDateTime', type:'output',  width:'7.46%'},
//             {caption: ["하"],  		ref: 'updUserId',   type:'output',  width:'7.46%'},
//             {caption: ["합계"], 	 	ref: 'updUserId',   type:'output',  width:'7.46%'},
//             {caption: ["kg"],  		ref: 'updDateTime', type:'output',  width:'7.46%'},
//             {caption: ["저장창고"],  	ref: 'updDateTime', type:'output',  width:'7.46%'},
//             {caption: ["비고"], 		ref: 'creProgram',  type:'output',  width:'7.46%'},
//             {caption: ["라벨"], 		ref: 'creProgram',  type:'output',  width:'7.46%'},
//             {caption: ["처리"], 		ref: 'creProgram',  type:'output',  width:'7.46%'}
//         ];
        
//         grdComMsgList = _SBGrid.create(SBGridProperties);
//         grdComMsgList.bind('click', 'fn_view');
//         grdComMsgList.bind('beforepagechanged', 'fn_pagingComMsgList');
//     }
    
// 	function fn_closeModal(modalId){
// 		SBUxMethod.closeModal(modalId);
// 	}
    
</script>
</body>
</html>