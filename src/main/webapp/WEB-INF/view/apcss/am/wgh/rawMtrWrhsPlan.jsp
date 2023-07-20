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

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ 원물입고계획 등록</h3>
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
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						</tr>
							<th scope="row" >APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
							<td colspan="9">&nbsp;</td>
						<tr>
							<th class="ta_r">기준일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtCrtrYmd" name="srch-dtp-strtCrtrYmd" class="form-control pull-right input-sm"/>
							</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCrtrYmd" name="srch-dtp-endCrtrYmd" class="form-control pull-right input-sm"/>
							</th>
							<td>&nbsp;</td>
							<th class="ta_r">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prcdcr" name="srch-inp-prcdcr" class="form-control input-sm" disabled/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr" name="srch-btn-prdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<b>&nbsp;<b>
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
						<col style="width: 6%">
						
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">계획일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtPlanYmd" name="srch-dtp-strtPlanYmd" class="form-control pull-right input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endPlanYmd" name="srch-dtp-endPlanYmd" class="form-control pull-right input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-prdcr" name="srch-slt-prdcr" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcrSrch" name="srch-btn-prdcrSrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th class="ta_r">입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-wrhsSe1" name="chk-wrhsSe" uitype="normal" class="form-control input-sm" text="일반매입"/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-wrhsSe2" name="chk-wrhsSe" uitype="normal" class="form-control input-sm" text="공선"/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-wrhsSe3" name="chk-wrhsSe" uitype="normal" class="form-control input-sm" text="매취"/>
									</p>
								</div>
							</td>
							<th class="ta_r">상품구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-gdsSe1" name="chk-gdsSe" uitype="normal" class="form-control input-sm" text="일반" checked/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-gdsSe2" name="chk-gdsSe" uitype="normal" class="form-control input-sm" text="GAP"/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-gdsSe3" name="chk-gdsSe" uitype="normal" class="form-control input-sm" text="무농약"/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-gdsSe4" name="chk-gdsSe" uitype="normal" class="form-control input-sm" text="유기농"/>
									</p>
								</div>
							</td>
							<th class="ta_r">운송</th>
							<td colspan="3" class="td_input">
								<div class="fl_group fl_rpgroup">
									<p class="ad_input_col">
										<sbux-checkbox uitype="normal"id="chk-trsprt1" name="chk-trsprt" uitype="normal" class="form-control input-sm" text="자가" checked/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-trsprt2" name="chk-trsprt" uitype="normal" class="form-control input-sm" text="용역"/>
									</p>
									<p class="ad_input_row">
										<sbux-checkbox uitype="normal"id="chk-trsprt3" name="chk-trsprt" uitype="normal" class="form-control input-sm" text="기타"/>
									</p>
								</div>
							</td>
						</tr>
						<tr>
							<th class="ta_r">수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="srch-inp-qntt" name="srch-inp-qntt" class="form-control input-sm" disabled/>

							</td>
							<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="srch-inp-wght" name="srch-inp-wght" class="form-control input-sm" />
							</td>
							<td class="td_input" style="border-right: hidden;">
									<sbux-label uitype="normal" id="lbl-kg" name="lbl-chc" text="Kg"/>
							</td>
							<th class="ta_r">비고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm" placeholder="" />
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물입고 계획</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">내려받기</button>
						<button type="button" class="btn btn-sm btn-outline-danger">올려받기</button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea2" style="height:340px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
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
		SBUxMethod.set("srch-dtp-strtCrtrYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endCrtrYmd", year+month+day);
		SBUxMethod.set("srch-dtp-strtPlanYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPlanYmd", year+month+day);
	});

	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = ['test']; // 그리드의 참조 데이터 주소 선언

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
	        {caption: ["계획일자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["계획시간"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["계획수량"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["계획중량"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'userStts', 	type:'button',  width:'105px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
//             	if(strValue === "01"){
//             		return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//             		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
            		return "<button type='button' class='btn btn-xs btn-outline-danger'>삭제</button>";
//             	}else{
// 			        return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//             	}
		    }},
	    ];
	    
	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>