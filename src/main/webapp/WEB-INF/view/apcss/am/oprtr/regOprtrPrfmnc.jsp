<%
/**
 * @Class Name : regOprtrPrfmnc.jsp
 * @Description : 작업자실적등록 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.10.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : 작업자실적등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 작업자실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
								<sbux-datepicker id="srch-dtp-prfmncYmd" name="srch-dtp-prfmncYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>

							<th scope="row" class="th_bg"><span class="data_required" ></span>작업구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-prfmncSeCd"
									name="srch-slt-prfmncSeCd"
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
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPrfmnc" style="height:270px;"></div>
				</div>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>작업자별 실적 내역</span>
						</li>
					</ul>
				 	<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: auto">
							<col style="width: 80px">
							<col style="width: 220px">
							<col style="width: 220px">
							<col style="width: 68px">
							<col style="width: 68px">
							<col style="width: 68px">
						</colgroup>
						<tbody>
							<tr>
								<td style="border-left:hidden"></td>
								<td style="border-left:hidden">
									<h5 style="float:left; color:black;">시간 적용</h5>
								</td>
								<td class="td_input" style="border-right:hidden; border-left:hidden" >
									<sbux-spinner id="dtl-spn-jobBgngHr" name="dtl-spn-jobBgngHr" uitype="normal" data-type="time" time-format="HH:MM" ></sbux-spinner>
								</td>
								<td class="td_input" style="border-right:hidden; border-left:hidden" >
									<sbux-spinner id="dtl-spn-jobEndHr" name="dtl-spn-jobEndHr" uitype="normal" data-type="time" time-format="HH:MM" ></sbux-spinner>
								</td>
								<td class="td_input" style="border-right:hidden;">
								  <sbux-button id="btnHrRowSet" name="btnHrRowSet" uitype="normal" text="선택적용" class="btn btn-sm btn-outline-danger" onclick="fn_hrRowSet"></sbux-button>
								</td>
								<td class="td_input" style="border-right:hidden;">
								  <sbux-button id="btnHrAllSet" name="btnHrAllSet" uitype="normal" text="일괄적용" class="btn btn-sm btn-outline-danger" onclick="fn_hrAllSet"></sbux-button>
								</td>
								<td class="td_input" style="border-right:hidden;">
								  <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
								</td>
							</tr>
						</tbody>
				 		</table>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOptrtPrfmnc" style="height:271px;"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- 생산작업자 선택 Modal -->
    <div>
        <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 선택" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="body-modal-oprtr">
    	<jsp:include page="../../am/popup/oprtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComPrfmncSeCd = [];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-prfmncSeCd', 	jsonComPrfmncSeCd, 	'PRFMNC_SE_CD'),	// 작업구분
		])
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createPrfmncGrid();
		SBUxMethod.set("srch-dtp-prfmncYmd", gfn_dateToYmd(new Date()));
	})

	var grdPrfmnc;
	var grdOptrtPrfmnc;
	var jsonPrfmnc = [];
	var jsonOptrtPrfmnc = [];

	function fn_createPrfmncGrid() {

	    var SBGridPrfmncProperties = {};
	    SBGridPrfmncProperties.parentid = 'sb-area-grdPrfmnc';
	    SBGridPrfmncProperties.id = 'grdPrfmnc';
	    SBGridPrfmncProperties.jsonref = 'jsonPrfmnc';
	    SBGridPrfmncProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridPrfmncProperties.selectmode = 'free';
	    SBGridPrfmncProperties.allowcopy = true;
	    SBGridPrfmncProperties.extendlastcol = 'scroll';
	    SBGridPrfmncProperties.columns = [
	         {caption: ["작업구분"],	ref: 'prfmncSeNm',	type:'output',  width:'100px', style: 'text-align:center'},
	         {caption: ["작업일자"], 	ref: 'prfmncYmd',	type:'output',  width:'120px', style: 'text-align:center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	         {caption: ["설비"], 	 	ref: 'fcltNm',		type:'output',  width:'120px', style: 'text-align:center'},
	         {caption: ["규격"],    	ref: 'spcfctNm',	type:'output',  width:'120px', style: 'text-align:center'},
	         {caption: ["수량"],	    ref: 'qntt',   		type:'output',  width:'120px', style: 'text-align:right',
     			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
	         {caption: ["중량 (Kg)"],	    ref: 'wght', 		type:'output',  width:'120px', style: 'text-align:right',
     			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
	         {caption: ["작업자수"],  	ref: 'oprtrQntt',   type:'output',  width:'120px', style: 'text-align:right',
        			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 명'}},
	         {caption: ["비고"],  		ref: 'rmrk',   		type:'output',  width:'300px', style: 'text-align:left'}
	    ];
	    grdPrfmnc = _SBGrid.create(SBGridPrfmncProperties);
	    grdPrfmnc.bind('click', fn_setGrdOprtrPrfmnc);


	    var SBGridOptrtProperties = {};
	    SBGridOptrtProperties.parentid = 'sb-area-grdOptrtPrfmnc';
	    SBGridOptrtProperties.id = 'grdOptrtPrfmnc';
	    SBGridOptrtProperties.jsonref = 'jsonOptrtPrfmnc';
	    SBGridOptrtProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridOptrtProperties.selectmode = 'free';
	    SBGridOptrtProperties.extendlastcol = 'scroll';
	    SBGridOptrtProperties.oneclickedit = true;
	    SBGridOptrtProperties.allowcopy = true;
	    SBGridOptrtProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridOptrtProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridOptrtProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
	    SBGridOptrtProperties.columns = [
	    	{caption: ["처리"], 		ref: 'delYn',   	type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
			{caption: ["작업구분"],		ref: 'prfmncSeNm',      type:'output',  width:'100px', style: 'text-align:center'},
			{caption: ["작업일자"], 	ref: 'jobYmd',     		type:'output',  width:'120px', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ["설비"], 	 	ref: 'fcltNm',    		type:'output',  width:'120px', style: 'text-align:center'},
			{caption: ["작업자명"],    	ref: 'flnm',        	type:'outputbutton',   width:'100px', style: 'text-align:center',
				typeinfo : {callback: fn_grdChoiceOprtr}},
			{caption: ["시작시간"],		ref: 'jobBgngHr',   	type:'input',  width:'120px', style: 'text-align:center',
				format : {type:'date', rule:'HH:mm', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
			},
			{caption: ["종료시간"],		ref: 'jobEndHr', 		type:'input',  width:'120px', style: 'text-align:center',
				format : {type:'date', rule:'HH:mm', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
			},
			{caption: ["작업시간"], ref: 'jobHr',   		type:'output',  width:'120px', style: 'text-align:right',
	     		typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 분'}},
			{caption: ["비고"], 	 	ref: 'rmrk',   			type:'input',  	width:'300px', style: 'text-align:center'},
			{caption: ["apcCd"], 	 	ref: 'apcCd',   		hidden:true},
			{caption: ["실적번호"], 	ref: 'prfmncno',   		hidden:true},
			{caption: ["작업구분"], 	ref: 'prfmncSeCd',   	hidden:true},
			{caption: ["실적순번"], 	ref: 'prfmncSn',   		hidden:true},
			{caption: ["생년월일"], 	ref: 'brdt',   			hidden:true},

	    ];
	    grdOptrtPrfmnc = _SBGrid.create(SBGridOptrtProperties);
	    grdOptrtPrfmnc.bind('valuechanged', 'fn_grdHrValueChanged');
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdOptrtPrfmnc.exportLocalExcel("작업자실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	const fn_reset = function(){
		SBUxMethod.set("srch-dtp-prfmncYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-slt-prfmncSeCd", "");
		SBUxMethod.set("dtl-spn-jobBgngHr", "");
		SBUxMethod.set("dtl-spn-jobEndHr", "");

		jsonOptrtPrfmnc.length = 0;
		jsonPrfmnc.length= 0;
		grdOptrtPrfmnc.rebuild();
		grdPrfmnc.rebuild();

	}

	const fn_grdHrValueChanged = function(){
		let prfmncYmd = SBUxMethod.get("srch-dtp-prfmncYmd");
		if(gfn_isEmpty(prfmncYmd)){
			gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		let nRow = grdOptrtPrfmnc.getRow();
		let nCol = grdOptrtPrfmnc.getCol();

		let jobBgngHrCol = grdOptrtPrfmnc.getColRef("jobBgngHr");
		let jobEndHrCol = grdOptrtPrfmnc.getColRef("jobEndHr");

		switch (nCol) {
		case jobBgngHrCol:	// checkbox
			fn_hrClCln();
			break;
		case jobEndHrCol:
			//check qntt
			fn_hrClCln();
			break;
		default:
			return;
		}
	}

	const fn_hrClCln = function(){
		let nRow = grdOptrtPrfmnc.getRow();
		let nCol = grdOptrtPrfmnc.getCol();
		let jobBgngHrCol = grdOptrtPrfmnc.getColRef("jobBgngHr");
		let jobEndHrCol = grdOptrtPrfmnc.getColRef("jobEndHr");
		let jobHrCol = grdOptrtPrfmnc.getColRef("jobHr");

		let rowData = grdOptrtPrfmnc.getRowData(nRow);
		let jobBgngHr = rowData.jobBgngHr
		let jobEndHr = rowData.jobEndHr


		if(!(gfn_isEmpty(jobBgngHr) || gfn_isEmpty(jobEndHr))){

			let jobHr = fn_hrSet(jobBgngHr, jobEndHr)
			if(jobHr == null){
				grdOptrtPrfmnc.setCellData(nRow, jobEndHrCol, "");
			}else{
				grdOptrtPrfmnc.setCellData(nRow, jobHrCol, jobHr)
			}
		}
	}

	const fn_hrRowSet = function(){
		let prfmncYmd = SBUxMethod.get("srch-dtp-prfmncYmd");
		if(gfn_isEmpty(prfmncYmd)){
			gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		let jobBgngHr = SBUxMethod.get("dtl-spn-jobBgngHr");
		let jobEndHr = SBUxMethod.get("dtl-spn-jobEndHr");

		let jobBgngHrCol = grdOptrtPrfmnc.getColRef("jobBgngHr");
		let jobEndHrCol = grdOptrtPrfmnc.getColRef("jobEndHr");
		let jobHrCol = grdOptrtPrfmnc.getColRef("jobHr");

		let nRow = grdOptrtPrfmnc.getRow();

		if (gfn_isEmpty(jobBgngHr)) {
  			gfn_comAlert("W0002", "시작시간");		//	W0002	{0}을/를 입력하세요.
            return;
  		}
		if (gfn_isEmpty(jobEndHr)) {
			gfn_comAlert("W0002", "종료시간");		//	W0002	{0}을/를 입력하세요.
            return;
  		}
		if(nRow < 1){
			gfn_comAlert("W0001", "적용할 행");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		if(!(gfn_isEmpty(jobBgngHr) || gfn_isEmpty(jobEndHr))){

			let jobHr = fn_hrSet(jobBgngHr, jobEndHr)
			if(jobHr == null){
				SBUxMethod.set("dtl-spn-jobEndHr", "");
			}else{
				grdOptrtPrfmnc.setCellData(nRow, jobBgngHrCol, jobBgngHr)
				grdOptrtPrfmnc.setCellData(nRow, jobEndHrCol, jobEndHr)
				grdOptrtPrfmnc.setCellData(nRow, jobHrCol, jobHr)
			}
		}
	}

	const fn_hrAllSet = function(){
		let prfmncYmd = SBUxMethod.get("srch-dtp-prfmncYmd");
		if(gfn_isEmpty(prfmncYmd)){
			gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		let jobBgngHr = SBUxMethod.get("dtl-spn-jobBgngHr");
		let jobEndHr = SBUxMethod.get("dtl-spn-jobEndHr");

		let jobBgngHrCol = grdOptrtPrfmnc.getColRef("jobBgngHr");
		let jobEndHrCol = grdOptrtPrfmnc.getColRef("jobEndHr");
		let jobHrCol = grdOptrtPrfmnc.getColRef("jobHr");

		if (gfn_isEmpty(jobBgngHr)) {
  			gfn_comAlert("W0002", "시작시간");		//	W0002	{0}을/를 입력하세요.
            return;
  		}
		if (gfn_isEmpty(jobEndHr)) {
			gfn_comAlert("W0002", "종료시간");		//	W0002	{0}을/를 입력하세요.
            return;
  		}

		if(!(gfn_isEmpty(jobBgngHr) || gfn_isEmpty(jobEndHr))){

			let jobHr = fn_hrSet(jobBgngHr, jobEndHr)
			if(jobHr == null){
				SBUxMethod.set("dtl-spn-jobEndHr", "");
			}else{
				let gridData = grdOptrtPrfmnc.getGridDataAll();

				for(var i=1; i<gridData.length; i++ ){
					let rowData = grdOptrtPrfmnc.getRowData(i);
					let rowSts = grdOptrtPrfmnc.getRowStatus(i);
					let delYn = rowData.delYn;
					if(delYn == "N"){

						grdOptrtPrfmnc.setCellData(i, jobBgngHrCol, jobBgngHr)
						grdOptrtPrfmnc.setCellData(i, jobEndHrCol, jobEndHr)
						grdOptrtPrfmnc.setCellData(i, jobHrCol, jobHr)
					}
				}


			}
		}
	}

	const fn_hrSet = function(bngn, end){
		let jobYmd = SBUxMethod.get("srch-dtp-prfmncYmd");

		jobYmd = jobYmd.substr(0,4) + "-" + jobYmd.substr(4,2) + "-" + jobYmd.substr(6,2)

		let bgngHr = new Date(jobYmd + " " + fn_formatHr(bngn));
		let endHr = new Date(jobYmd + " " + fn_formatHr(end));

		if(endHr - bgngHr > 0){
			let differentHr = (endHr.getTime() - bgngHr.getTime()) / (1000)

			let mm = Math.round(differentHr / 60)

			return mm;
		}else{
			gfn_comAlert("W0008", "종료시간", "시작시간") // W0008 {0} 보다 {1}이/가 큽니다.
			return null;
		}
	}

	const fn_typeSet = function(time){

		if(time < 10){
			return "0"+time;
		}else{
			return time;
		}
	}

	const fn_formatHr = function(hr){

		if(hr.length == 2){
			return hr+":00:00";
		}else if(hr.length == 4){
			return hr.substr(0,2)+":" + hr.substr(2,2) + ":00";
		}else
			return hr.substr(0,2)+":" + hr.substr(2,2) + ":" + hr.substr(4,2);
	}



	const fn_search = async function(){
		jsonOptrtPrfmnc.length = 0;
		grdOptrtPrfmnc.refresh();

		let rst = await Promise.all([
			fn_setGrdPrfmnc()
		])
	}

	const fn_setGrdPrfmnc = async function(){

		let prfmncYmd = SBUxMethod.get("srch-dtp-prfmncYmd");
		let prfmncSeCd = SBUxMethod.get("srch-slt-prfmncSeCd");


		if(gfn_isEmpty(prfmncYmd)){
			gfn_comAlert("W0001", "작업일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(prfmncSeCd)){
			gfn_comAlert("W0001", "작업구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		const prfmncVO = {
			apcCd: gv_selectedApcCd,
			prfmncYmd: prfmncYmd,
			prfmncSeCd: prfmncSeCd,
		}

		const postJsonPromise = gfn_postJSON("/am/oprtr/selectRegPrfmncList.do", prfmncVO);
        const data = await postJsonPromise;
		try {
			jsonPrfmnc.length = 0;
	      	data.resultList.forEach((item, index) => {
	      		const prfmncVO = {
	      			prfmncSeNm	: item.prfmncSeNm
	      		  , prfmncSeCd	: item.prfmncSeCd
	      		  , prfmncYmd 	: item.prfmncYmd
	      		  , fcltNm		: item.fcltNm
	      		  , spcfctCd	: item.spcfctCd
	      		  , spcfctNm	: item.spcfctNm
	      		  , qntt		: item.qntt
	      		  , wght		: item.wght
	      		  , oprtrQntt	: item.oprtrQntt
	      		  , rmrk		: item.rmrk
	      		  , prfmncno	: item.prfmncno
	      		  , apcCd		: item.apcCd
			}
      		jsonPrfmnc.push(prfmncVO);

		});
      	grdPrfmnc.refresh();
	    } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_setGrdOprtrPrfmnc = async function(){
		let prfmncSeCd = SBUxMethod.get("srch-slt-prfmncSeCd");

		if(gfn_isEmpty(prfmncSeCd)){
			gfn_comAlert("W0001", "작업구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		let nRow = grdPrfmnc.getRow();
        if (nRow < 1 ) {
            return;
        }

        let rowData = grdPrfmnc.getRowData(nRow);
        let prfmncno = rowData.prfmncno;
        let apcCd = rowData.apcCd;
        let jobYmd = rowData.prfmncYmd;

        prfmncVO = {
        		apcCd 		: apcCd
        	  , prfmncno 	: prfmncno
        	  , jobYmd 		: jobYmd
        	  , prfmncSeCd  : prfmncSeCd
        }

        const postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrPrfmncList.do", prfmncVO);
        const data = await postJsonPromise;
		try {
			jsonOptrtPrfmnc.length = 0;
	      	data.resultList.forEach((item, index) => {
	      		const prfmncVO = {
		      			prfmncSeNm	: item.prfmncSeNm
		      		  , prfmncSeCd	: item.prfmncSeCd
		      		  , fcltNm		: item.fcltNm
		      		  , fcltCd		: item.fcltCd
		      		  , prfmncSn	: item.prfmncSn
		      		  , brdt		: item.brdt
		      		  , flnm		: item.flnm
		      		  , jobYmd 		: item.jobYmd
		      		  , jobBgngHr	: item.jobBgngHr
		      		  , jobEndHr	: item.jobEndHr
		      		  , jobHr		: item.jobHr
		      		  , rmrk		: item.rmrk
		      		  , prfmncno	: item.prfmncno
		      		  , apcCd		: item.apcCd
		      		  , brdt		: item.brdt
		      		  , delYn		: item.delYn
		      		  , insertYn	: "N"
				}
		      	jsonOptrtPrfmnc.push(prfmncVO);

			});
	      	grdOptrtPrfmnc.setCellDisabled(0, grdOptrtPrfmnc.getRows() -1, 0, grdOptrtPrfmnc.getCols() - 1, false);
	      	grdOptrtPrfmnc.rebuild();
	      	grdOptrtPrfmnc.addRow(true);
	      	grdOptrtPrfmnc.setCellDisabled(grdOptrtPrfmnc.getRows()-1, 0, grdOptrtPrfmnc.getRows()-1, grdOptrtPrfmnc.getCols() - 1, true);
	    } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_procRow = async function(gubun, nRow, nCol){

		if(gubun == "ADD"){
			let chioseNRow = grdPrfmnc.getRow();
			if(chioseNRow < 1){
	  			gfn_comAlert("W0001", "작업실적");		//	W0001	{0}을/를 선택하세요.
				return;
			}
	        let rowData = grdPrfmnc.getRowData(chioseNRow);

	        let fcltNm = rowData.fcltNm
	        let prfmncSeNm = rowData.prfmncSeNm
	        let prfmncSeCd = rowData.prfmncSeCd
	        let jobYmd = rowData.prfmncYmd
	        let prfmncno = rowData.prfmncno

			let apcCdCol = grdOptrtPrfmnc.getColRef("apcCd");
			let prfmncSeNmCol = grdOptrtPrfmnc.getColRef("prfmncSeNm");
			let prfmncSeCdCol = grdOptrtPrfmnc.getColRef("prfmncSeCd");
			let prfmncnoCol = grdOptrtPrfmnc.getColRef("prfmncno");
			let jobYmdCol = grdOptrtPrfmnc.getColRef("jobYmd");
			let fcltNmCol = grdOptrtPrfmnc.getColRef("fcltNm");

			grdOptrtPrfmnc.setCellData(nRow, nCol, "N", true);
			grdOptrtPrfmnc.setCellData(nRow, apcCdCol, gv_selectedApcCd, true);
			grdOptrtPrfmnc.setCellData(nRow, prfmncSeNmCol, prfmncSeNm, true);
			grdOptrtPrfmnc.setCellData(nRow, prfmncSeCdCol, prfmncSeCd, true);
			grdOptrtPrfmnc.setCellData(nRow, prfmncnoCol, prfmncno, true);
			grdOptrtPrfmnc.setCellData(nRow, jobYmdCol, jobYmd, true);
			grdOptrtPrfmnc.setCellData(nRow, fcltNmCol, fcltNm, true);

			grdOptrtPrfmnc.rebuild();
			grdOptrtPrfmnc.addRow(true);
			grdOptrtPrfmnc.setCellDisabled(nRow+1, 0, nRow+1, grdOptrtPrfmnc.getCols() - 1, true);
		}else if(gubun == "DEL"){

			if(grdOptrtPrfmnc.getRowData(nRow).insertYn == "Y"){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var oprtrPrfmncVO = grdOptrtPrfmnc.getRowData(nRow);
        			fn_deleteOprtrPrfmnc(oprtrPrfmncVO);
        			grdOptrtPrfmnc.deleteRow(nRow);
        		}
        	}else{
        		grdOptrtPrfmnc.deleteRow(nRow);
        	}
		}
	}

	const fn_save = async function(){
		let saveList = [];
		let gridData = grdOptrtPrfmnc.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdOptrtPrfmnc.getRowData(i);
			let rowSts = grdOptrtPrfmnc.getRowStatus(i);

			let delYn = rowData.delYn;
			let flnm = rowData.flnm;
			let jobBgngHr = rowData.jobBgngHr;
			let jobEndHr = rowData.jobEndHr;
			let insertYn = rowData.insertYn;
			if(delYn == 'N'){
				if (gfn_isEmpty(flnm)) {
		  			gfn_comAlert("W0001", "작업자");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}
				if (gfn_isEmpty(jobBgngHr)) {
		  			gfn_comAlert("W0002", "시작시간");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (gfn_isEmpty(jobEndHr)) {
					gfn_comAlert("W0002", "종료시간");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				if (insertYn==="N"){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					rowData.rowSts = "I";
					saveList.push(rowData);
				}
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/am/oprtr/multiSaveOprtrPrfmnc.do", saveList);
	        let data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert("E0001");
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
		}
	}

	const fn_deleteOprtrPrfmnc = async function(oprtrPrfmncVO){

		const postJsonPromise = gfn_postJSON("/am/oprtr/deleteOprtrPrfmnc.do", oprtrPrfmncVO);
    	const data = await postJsonPromise;

    	 try {
         	if (_.isEqual("S", data.resultStatus)) {
         		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
         	} else {
         		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
         		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         	}
         } catch(e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }
	}

	/* 생산작업자 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalOprtr
	 * @description 생산작업자선택팝업 호출
	 */
	const fn_grdChoiceOprtr = function() {
		let nRow = grdOptrtPrfmnc.getRow();
		let flnm = "";

		SBUxMethod.openModal('modal-oprtr');

		popOprtr.init(gv_selectedApcCd, gv_selectedApcNm, flnm, fn_setFlnm);
	}

	/**
	 * @name fn_setFlnm
	 * @description 생산작업자 선택 callback
	 */
	const fn_setFlnm = function(oprtr) {
		let nRow = grdOptrtPrfmnc.getRow();
		let flnmCol = grdOptrtPrfmnc.getColRef("flnm");
		let brdtCol = grdOptrtPrfmnc.getColRef("brdt");
		let flag = true;
		if (!gfn_isEmpty(oprtr)) {

			let gridData = grdOptrtPrfmnc.getGridDataAll();
			if(gridData.length > 2){
				for(var i=1; i<gridData.length; i++ ){
					let rowData = grdOptrtPrfmnc.getRowData(i);
					let rowSts = grdOptrtPrfmnc.getRowStatus(i);
					let delYn = rowData.delYn;
					let flnm = rowData.flnm
					let brdt = rowData.brdt

					if(delYn == 'N'){
						if(oprtr.flnm == flnm && oprtr.brdt == brdt){
							gfn_comAlert("W0010", "등록", "작업자")	// W0010 이미 {0}된 {1} 입니다.
							flag = false;
							break;
						}
					}
				}
				if(flag){
					grdOptrtPrfmnc.setCellData(nRow, flnmCol, oprtr.flnm);
					grdOptrtPrfmnc.setCellData(nRow, brdtCol, oprtr.brdt);
				}else{
					let flnm = "";

					SBUxMethod.openModal('modal-oprtr');

					popOprtr.init(gv_selectedApcCd, gv_selectedApcNm, flnm, fn_setFlnm);
				}
			}else{
				grdOptrtPrfmnc.setCellData(nRow, flnmCol, oprtr.flnm);
				grdOptrtPrfmnc.setCellData(nRow, brdtCol, oprtr.brdt);
			}

		}
	}
	/* End */

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>