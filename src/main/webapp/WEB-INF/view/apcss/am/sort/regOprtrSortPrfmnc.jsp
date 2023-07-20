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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 작업자실적등록</h3>
			</div>
			<div style="margin-left: auto;">
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
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td class="td_input">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">작업일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-jobYmd" name="srch-inp-jobYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							
							<th scope="row">작업구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-jobSe" name="srch-slt-jobSe" uitype="single" unselected-text="선택"></sbux-select>         
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">&nbsp;</td>
							<td colspan="4"></td>
						</tr>
					</tbody>
				</table>
				
				
				<!-- 1번째 그리드-->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>작업실적</span></li>
					</ul>
				</div>
				<div id="sb-area-grdWrtrPrfmncDsctn" style="height:300px;"></div>
				<!-- 1번째 그리드-->
				
				
<!-- 				<div class="ad_tbl_top"> -->
<!-- 					<ul class="ad_tbl_count"> -->
<!-- 						<li><span>원물계량 내역</span></li> -->
<!-- 					</ul> -->
<!-- 				 <div class="ad_tbl_toplist"> -->
<!-- 					<sbux-button uitype="btnDwnld" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button> -->
<!-- 					<sbux-button uitype="btnUld" class="btn btn-sm btn-outline-danger" onclick="fn_uld">올리기</sbux-button> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>작업자별 실적 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDown" name="btnDown" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger"></sbux-button>
						<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWrtrPrfmncDsctn2" style="height:300px;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	fn_createWghPrfmncGrid();

	let today = new Date();
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);
	SBUxMethod.set("srch-inp-jobYmd", year+month+day);
})

function fn_createWghPrfmncGrid() {
    var SBGridProperties1 = {};
	    SBGridProperties1.parentid = 'sb-area-grdWrtrPrfmncDsctn';
	    SBGridProperties1.id = 'grdComMsgList';
	    SBGridProperties1.jsonref = 'jsonComMsgList';
	    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
	    SBGridProperties1.columns = [
	         {caption: ["작업구분"],	ref: 'msgKey',      type:'output',  width:'15%'},
	         {caption: ["작업일자"], 	ref: 'msgCn',     	type:'output',  width:'15%'},
	         {caption: ["설비"], 	 	ref: 'msgKndNm',    type:'output',  width:'15%'},
	         {caption: ["규격"],    	ref: 'rmrk',        type:'output',  width:'15%'},
	         {caption: ["수량"],	    ref: 'creUserId',   type:'output',  width:'15%'},
	         {caption: ["중량"],	    ref: 'creDateTime', type:'output',  width:'15%'},
	         {caption: ["작업자수"],  	ref: 'updUserId',   type:'output',  width:'15%'},
	         {caption: ["비고"],  	ref: 'updUserId',   type:'output',  width:'15%'}
    ];
	    
    var SBGridProperties2 = {};
	    SBGridProperties2.parentid = 'sb-area-grdWrtrPrfmncDsctn2';
	    SBGridProperties2.id = 'grdComMsgList2';
	    SBGridProperties2.jsonref = 'jsonComMsgList2';
	    SBGridProperties2.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties2.selectmode = 'byrow';
	    SBGridProperties2.extendlastcol = 'scroll';
	    SBGridProperties2.columns = [
			{caption: ["작업구분"],		ref: 'msgKey',      type:'output',  width:'15%'},
			{caption: ["작업일자"], 		ref: 'msgCn',     	type:'output',  width:'15%'},
			{caption: ["설비"], 	 		ref: 'msgKndNm',    type:'output',  width:'15%'},
			{caption: ["작업자명"],    	ref: 'rmrk',        type:'input',   width:'15%'},
			{caption: ["시작시간"],		ref: 'creUserId',   type:'output',  width:'15%'},
			{caption: ["종료시간"],		ref: 'creDateTime', type:'output',  width:'15%'},
			{caption: ["작업시간"],  		ref: 'updUserId',   type:'output',  width:'15%'},
			{caption: ["비고"], 	 		ref: 'updUserId',   type:'output',  width:'15%'},
			{caption: ["처리"],  			ref: 'updDateTime', type:'output',  width:'15%'}
	        
    ];
    grdWghPrfmnc1 = _SBGrid.create(SBGridProperties1);
    grdWghPrfmnc2 = _SBGrid.create(SBGridProperties2);
}
    
</script>
</html>