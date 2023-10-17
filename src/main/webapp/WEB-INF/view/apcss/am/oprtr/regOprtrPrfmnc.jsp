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
	<section>
		<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 작업자실적등록 -->
			</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
				</div>
		</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
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
							<th scope="row" class="th_bg"><span class="data_required" ></span>작업일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-jobYmd" name="srch-inp-jobYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>

							<th scope="row" class="th_bg"><span class="data_required" ></span>작업구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-jobSe"
									name="srch-slt-jobSe"
									jsondata-ref="jsonComPrfmncSeCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
								></sbux-select>
							</td>
							<td colspan="6" class="td_input" style="border-left: hidden;">&nbsp;</td>
						</tr>
					</tbody>
				</table>


				<!-- 1번째 그리드-->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>작업실적</span></li>
					</ul>
				</div>
				<div id="sb-area-grdWrtrPrfmncDsctn" style="height:270px;"></div>
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
					<div id="sb-area-grdWrtrPrfmncDsctn2" style="height:270px;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComPrfmncSeCd

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComPrfmncSeCd, 	'PRFMNC_SE_CD'),	// 작업구분
		])
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createPrfmncGrid();
		SBUxMethod.set("srch-inp-jobYmd", gfn_dateToYmd(new Date()));
	})

	function fn_createPrfmncGrid() {

	    var fn_createPrfmncGrid = {};
	    SBGridPrfmncProperties.parentid = 'sb-area-grdWrtrPrfmncDsctn';
	    SBGridPrfmncProperties.id = 'grdPrfmnc';
	    SBGridPrfmncProperties.jsonref = 'jsonJobPrfmnc';
	    SBGridPrfmncProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridPrfmncProperties.selectmode = 'byrow';
	    SBGridPrfmncProperties.extendlastcol = 'scroll';
	    SBGridPrfmncProperties.columns = [
	         {caption: ["작업구분"],	ref: 'msgKey',      type:'output',  width:'120px'},
	         {caption: ["작업일자"], 	ref: 'msgCn',     	type:'output',  width:'120px'},
	         {caption: ["설비"], 	 	ref: 'msgKndNm',    type:'output',  width:'120px'},
	         {caption: ["규격"],    	ref: 'rmrk',        type:'output',  width:'120px'},
	         {caption: ["수량"],	    ref: 'creUserId',   type:'output',  width:'120px'},
	         {caption: ["중량"],	    ref: 'creDateTime', type:'output',  width:'120px'},
	         {caption: ["작업자수"],  	ref: 'oprtrQntt',   type:'output',  width:'120px'},
	         {caption: ["비고"],  		ref: 'rmrk',   type:'output',  width:'120px'}
	    ];
	    grdPrfmnc = _SBGrid.create(SBGridPrfmncProperties);


	    var SBGridOptrtProperties = {};
	    SBGridOptrtProperties.parentid = 'sb-area-grdWrtrPrfmncDsctn2';
	    SBGridOptrtProperties.id = 'grdOptrtPrfmnc';
	    SBGridOptrtProperties.jsonref = 'jsonOptrtPrfmnc';
	    SBGridOptrtProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridOptrtProperties.selectmode = 'byrow';
	    SBGridOptrtProperties.extendlastcol = 'scroll';
	    SBGridOptrtProperties.columns = [
			{caption: ["작업구분"],		ref: 'msgKey',      type:'output',  width:'120px'},
			{caption: ["작업일자"], 	ref: 'msgCn',     	type:'output',  width:'120px'},
			{caption: ["설비"], 	 	ref: 'msgKndNm',    type:'output',  width:'120px'},
			{caption: ["작업자명"],    	ref: 'rmrk',        type:'input',   width:'120px'},
			{caption: ["시작시간"],		ref: 'creUserId',   type:'output',  width:'120px'},
			{caption: ["종료시간"],		ref: 'creDateTime', type:'output',  width:'120px'},
			{caption: ["작업시간"],  	ref: 'updUserId',   type:'output',  width:'120px'},
			{caption: ["비고"], 	 	ref: 'updUserId',   type:'output',  width:'120px'},
			{caption: ["처리"],  		ref: 'updDateTime', type:'output',  width:'120px'}

	    ];
	    grdOptrtPrfmnc = _SBGrid.create(SBGridOptrtProperties);
	}

	const fn_setGrdSortCmnd = async function(pageSize, pageNo){
		let jobYmd = SBUxMethod.get("srch-dtp-jobYmd");
		let jobSe = SBUxMethod.get("srch-slt-jobSe");


		if(gfn_isEmpty(jobYmd) || gfn_isEmpty(sortCmndToYmd)){
			gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(jobSe)){
			gfn_comAlert("W0001", "작업구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		const postJsonPromise = gfn_postJSON("/am/sort/selectPckgCmndTrgetList.do", {
			apcCd: gv_selectedApcCd,
			jobYmd: jobYmd,
			jobSe: jobSe,

      		// pagination
	  		pagingYn: 'N',
			currentPageNo : pageNo,
		  	recordCountPerPage : pageSize
			});
	    const data = await postJsonPromise;
			try {
	      	/** @type {number} **/
	  		let totalRecordCount = 0;

	  		jsonJobPrfmnc.length = 0;
	      	data.resultList.forEach((item, index) => {
	      		const sortCmnd = {
					rowSeq: item.rowSeq,
					rowSeq: item.rowSeq,
					rowSeq: item.rowSeq,
					rowSeq: item.rowSeq,
					rowSeq: item.rowSeq,

				}
	      		jsonJobPrfmnc.push(sortCmnd);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
	      	grdJobPrfmnc.refresh();
	      	if (jsonJobPrfmnc.length > 0) {
	      		if(grdJobPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			grdJobPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			grdJobPrfmnc.rebuild();
					}else{
						grdJobPrfmnc.refresh();
					}
	      	} else {
	      		grdJobPrfmnc.setPageTotalCount(totalRecordCount);
	      		grdJobPrfmnc.rebuild();
	      	}
	      	document.querySelector('#listCount').innerText = totalRecordCount;
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
	}
</script>
</html>