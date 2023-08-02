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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title">▶ 원물입고 팔레트/박스 관리</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
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
							<th scope="row" class="th_bg">APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg">작업일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtCrtrYmd" name="srch-dtp-strtCrtrYmd" class="form-control pull-right input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCrtrYmd" name="srch-dtp-endCrtrYmd" class="form-control pull-right input-sm"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th class="ta_r th_bg">입/출고 구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-wrhsSpmtSe" name="srch-slt-wrhsSpmtSe" class="form-control input-sm" jsondata-ref="jsonComWrhsSpmtSe"></sbux-select>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>팔레트/박스 재고현황</span></li>
					</ul>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea" style="height:340px;"></div>
					</div>
				</div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물입고 계획</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
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

</body>
<script type="text/javascript">
	var jsonComMsgKnd 		= [];	// srch.select.comMsgKnd
	var jsonComWrhsSpmtSe	= [];	// 설비 fcltCd		검색

	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComwrhsSpmtSe, 		'WRHS_SPMT_SE', gv_apcCd);			// 설비
	}
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-strtCrtrYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endCrtrYmd", year+month+day);

		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
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


	    SBGridProperties.columns = [
	        {caption: ["구분","구분"],		ref: 'msgKey',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["명칭","명칭"],		ref: 'msgKey',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["단중","단중"],		ref: 'msgKey',      type:'output',  width:'170px',    style:'text-align:center'},
	        {caption: ["전일재고","수량	"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["전일재고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["입고","수량	"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["입고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["출고","수량	"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["출고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["현재고","수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["현재고","중량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},

	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}
	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = ["test"]; // 그리드의 참조 데이터 주소 선언

	var comboUesYnJsData = ['입고/출고']
	var comboUesYnJsData1 = ['팔레트/박스']
	var comboUesYnJsData2 = ['명칭']
	var comboUesYnJsData3 = ['생산자']

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
	        {caption: ["선택"],		ref: 'msgKey',      type:'checkbox',  width:'70px',    style:'text-align:center'},
	        {caption: ["작업일자"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["입출고구분"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : true}},
	        {caption: ["구분"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData1', label:'label', value:'value', displayui : true}},
	        {caption: ["명칭"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData2', label:'label', value:'value', displayui : true}},
	        {caption: ["단중"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["생산자"], 	ref: 'delYn',   	type:'combo',  width:'140px',    style:'text-align:center',
				typeinfo : {ref:'comboUesYnJsData3', label:'label', value:'value', displayui : true}},
	        {caption: ["수량"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["중량"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'300px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'userStts', 	type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
//             	if(strValue === "01"){
//             		return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//             		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
            		return "<button type='button' class='btn btn-xs btn-outline-danger'>삭제</button>";
//             	}else{
// 			        return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//             	}
		    }},
	    ];

	    inptCmndDsctnList2 = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>

</html>