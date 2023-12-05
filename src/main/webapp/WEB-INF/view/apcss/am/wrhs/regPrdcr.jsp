<%
/**
 * @Class Name : regPrdcr.jsp
 * @Description : 생산자관리 화면
 * @author SI개발부
 * @since 2023.12.04
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.12.04   	김호			최초 생성
 * @see
 *
 */
%>
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
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 생산자관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
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
							<th scope="row" class="th_bg">생산자명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text" id="srch-inp-prdcrNm" name="srch-inp-prdcrNm"
									class="form-control input-sm" maxlength="33"
    								onkeyenter="keyUpInp(prdcr-inp-prdcrNm, 'prdcr-inp-prdcrNm', 'true')">
    							</sbux-input>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">전화번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text" id="srch-inp-telno" name="srch-inp-telno"
									class="form-control input-sm" maxlength="20"
    							></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">주소</th>
							<td class="td_input" style="border-right: hidden;" colspan="3">
								<sbux-input
									uitype="text" id="srch-inp-addr" name="srch-inp-addr"
									class="form-control input-sm" maxlength="50"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>


				<!-- 1번째 그리드-->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>생산자 목록</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdAgrixPrdcr" style="height:258px;"></div>
				</div>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>생산자 등록 내역</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdApcPrdcr" style="height:283px;"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- 생산작업자 선택 Modal -->
    <div>
        <sbux-modal id="modal-oprtr" name="modal-oprtr" uitype="middle" header-title="생산작업자 선택" body-html-id="body-modal-oprtr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-oprtr">
    	<jsp:include page="../../am/popup/oprtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonApcItemCd		= [];	// 대표품목 rprsItemCd	Grid
	var jsonApcVrtyCd		= [];	// 대표품종 rprsVrtyCd	Grid
	var jsonComGdsSeCd		= [];	// 상품구분 gdsSeCd		Grid
	var jsonComWrhsSeCd		= [];	// 입고구분 wrhsSeCd	Grid
	var jsonComTrsprtSeCd	= [];	// 운송구분 trsprtSeCd	Grid
	var jsonComClclnCrtrCd	= [];	// 정산기준 clclnCrtr	Grid

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('grdApcPrdcr', 	jsonApcItemCd, 		gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('grdApcPrdcr', 	jsonApcVrtyCd, 		gv_selectedApcCd),						// 품종
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComGdsSeCd, 	'GDS_SE_CD',	gv_selectedApcCd),		// 상품구분
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComTrsprtSeCd, 	'TRSPRT_SE_CD'),						// 운송구분
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComClclnCrtrCd, 'CLCLN_CRTR_CD')						// 정산기준
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createAgrixPrdcrGrid();
	})

	var grdAgrixPrdcr;
	var grdApcPrdcr;
	var jsonAgrixPrdcr = [];
	var jsonApcPrdcr = [];

	function fn_createAgrixPrdcrGrid() {

	    var SBGridAgrixPrdcrProperties = {};
	    SBGridAgrixPrdcrProperties.parentid = 'sb-area-grdAgrixPrdcr';
	    SBGridAgrixPrdcrProperties.id = 'grdAgrixPrdcr';
	    SBGridAgrixPrdcrProperties.jsonref = 'jsonAgrixPrdcr';
	    SBGridAgrixPrdcrProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridAgrixPrdcrProperties.selectmode = 'free';
	    SBGridAgrixPrdcrProperties.allowcopy = true;
	    SBGridAgrixPrdcrProperties.extendlastcol = 'scroll';
	    SBGridAgrixPrdcrProperties.columns = [
	    	{caption: ["선택"], 		ref: 'empty',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addPrdcr(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["경영체등록번호"],	ref: 'mngmstRegno',		type:'output',  width:'120px', style: 'text-align:center'},
	        {caption: ["경영주 법인명"], 	ref: 'admstOwnrCorpNm',	type:'output',  width:'150px', style: 'text-align:center'},
	        {caption: ["경영주 주소"], 		ref: 'admstOwnrRgdtAddr',	type:'output',  width:'250px', style: 'text-align:center'},
	        {caption: ["전화번호"], 		ref: 'telno',			type:'output',  width:'100px', style: 'text-align:center'},
	        {caption: ["휴대폰번호"], 		ref: 'moblno',			type:'output',  width:'150px', style: 'text-align:center'},
	        {caption: ["영농시작일자"], 	ref: 'agrcBgngYmd',		type:'output',  width:'150px', style: 'text-align:center',
    		    	format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
	        {caption: ["영농시작형태"], 	ref: 'frmngBgngShap',	type:'output',  width:'150px', style: 'text-align:center'},
	        {caption: ["영농종사형태"], 	ref: 'frmngEnggShap',	type:'output',  width:'150px', style: 'text-align:center'},
	        {caption: ["설립년도"], 		ref: 'fndnYr',			type:'output',  width:'80px', style: 'text-align:center'},
	        {caption: ["비고"],  			ref: 'rmrk',   			type:'output',  width:'300px', style: 'text-align:left'}
	    ];
	    grdAgrixPrdcr = _SBGrid.create(SBGridAgrixPrdcrProperties);


	    var SBGridApcPrdcrProperties = {};
	    SBGridApcPrdcrProperties.parentid = 'sb-area-grdApcPrdcr';
	    SBGridApcPrdcrProperties.id = 'grdApcPrdcr';
	    SBGridApcPrdcrProperties.jsonref = 'jsonApcPrdcr';
	    SBGridApcPrdcrProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridApcPrdcrProperties.selectmode = 'free';
	    SBGridApcPrdcrProperties.extendlastcol = 'scroll';
	    SBGridApcPrdcrProperties.oneclickedit = true;
	    SBGridApcPrdcrProperties.allowcopy = true;
	    SBGridApcPrdcrProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
	    SBGridApcPrdcrProperties.columns = [
	    	{caption: ["처리"], 			ref: 'delYn', 			type: 'button', width: '50px', 	style: 'text-align:center', sortable: false,
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
	            	}
		    }},
		    {caption: ['번호'], 			ref: 'prdcrIdentno', 	type: 'input', 	width: '50px', style: 'text-align:center', sortable: false},
	        {caption: ['생산자명'], 		ref: 'prdcrNm', 		type: 'input', 	width: '65px', style: 'text-align:center', sortable: false,
	        	validate : gfn_chkByte.bind({byteLimit: 100})},
	        {caption: ['대표품목'], 		ref: 'rprsItemCd', 		type: 'combo', 	width: '90px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonApcItemCd', 	label:'label', value:'value', itemcount: 10}},
	        {caption: ['대표품종'], 		ref: 'rprsVrtyCd', 		type: 'combo', 	width: '90px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonApcVrtyCd', 	label:'label', value:'value', itemcount: 10}},
	        {caption: ['상품구분'], 		ref: 'gdsSeCd', 		type: 'combo', 	width: '80px', 	style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonComGdsSeCd', 	label:'label', value:'value', itemcount: 10}},
	        {caption: ['입고구분'], 		ref: 'wrhsSeCd', 		type: 'combo', 	width: '80px', 	style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonComWrhsSeCd', 	label:'label', value:'value', itemcount: 10}},
	        {caption: ['운송구분'], 		ref: 'trsprtSeCd', 		type: 'combo', 	width: '80px', 	style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonComTrsprtSeCd', label:'label', value:'value', itemcount: 10}},
	        {caption: ['정산기준'], 		ref: 'clclnCrtrCd', 	type: 'combo', 	width: '80px', 	style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonComClclnCrtrCd', label:'label', value:'value', itemcount: 10}},
	        {caption: ['차량번호'], 		ref: 'vhclno', 			type: 'input', 	width: '110px', style: 'text-align:center', sortable: false,
				validate : gfn_chkByte.bind({byteLimit: 40})},
	        {caption: ['전화번호'], 		ref: 'telno', 			type: 'input', 	width: '110px', style: 'text-align:center', sortable: false,
				validate : gfn_chkByte.bind({byteLimit: 11}), typeinfo : {mask : {alias : '#-', repeat: '*'}}},
	        {caption: ['생산자연계코드'], 	ref: 'prdcrLinkCd', 	type: 'input', 	width: '120px', style: 'text-align:center', sortable: false,
				validate : gfn_chkByte.bind({byteLimit: 20})},
	        {caption: ['비고'], 			ref: 'rmrk', 			type: 'input', 	width: '200px', style: 'text-align:center', sortable: false,
	        	validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
	        {caption: ['생산자코드'], ref: 'prdcrCd', hidden : true},
	        {caption: ['ROW STATUS'], ref: 'rowSts', hidden : true},

	    ];
	    grdApcPrdcr = _SBGrid.create(SBGridApcPrdcrProperties);
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

		jsonApcPrdcr.length = 0;
		jsonAgrixPrdcr.length= 0;
		grdApcPrdcr.rebuild();
		grdAgrixPrdcr.rebuild();

	}

	const fn_search = async function(){

		let rst = await Promise.all([
			fn_setGrdAgrixAprdcr(),
			fn_setGrdApcPrdcr(),
		])
	}

	const fn_setGrdAgrixAprdcr = async function(){
		let admstOwnrCorpNm 	= SBUxMethod.get("srch-inp-prdcrNm");
		let telno 				= SBUxMethod.get("srch-inp-telno");
		let admstOwnrRgdtAddr 	= SBUxMethod.get("srch-inp-addr");
		const prdcrVO = {
			apcCd				: gv_selectedApcCd
		  , admstOwnrCorpNm 	: admstOwnrCorpNm
		  ,	admstOwnrRgdtAddr 	: admstOwnrRgdtAddr
		  ,	telno 				: telno
		}

		const postJsonPromise = gfn_postJSON("/am/cmns/selectAgrixPrdcrList.do", prdcrVO);
        const data = await postJsonPromise;
		try {
			jsonAgrixPrdcr.length = 0;
	      	data.resultList.forEach((item, index) => {
	      		const prdcrVO = {
	      			mngmstRegno			: item.mngmstRegno
	      		  , admstOwnrCorpNm		: item.admstOwnrCorpNm
	      		  , admstOwnrRgdtAddr 	: item.admstOwnrRgdtAddr
	      		  , telno				: item.telno
	      		  , moblno				: item.moblno
	      		  , agrcBgngYmd			: item.agrcBgngYmd
	      		  , frmngBgngShap		: item.frmngBgngShap
	      		  , frmngEnggShap		: item.frmngEnggShap
	      		  , fndnYr				: item.fndnYr
	      		  , rmrk				: item.rmrk
			}
	      	jsonAgrixPrdcr.push(prdcrVO);

		});
      	grdAgrixPrdcr.refresh();
	    } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_setGrdApcPrdcr = async function(){
		let prdcrNm 	= SBUxMethod.get("srch-inp-prdcrNm");
		let telno 		= SBUxMethod.get("srch-inp-telno");

		const postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrList.do", {
        	apcCd		: gv_selectedApcCd
          , prdcrNm		: prdcrNm
          ,	telno 		: telno
		});

        const data = await postJsonPromise;

		try {
    		jsonApcPrdcr.length = 0;
        	data.resultList.forEach((item, index) => {
				const prdcrVO = {
					rowSeq			: item.rowSeq,
					prdcrCd			: item.prdcrCd,
				    prdcrNm 		: item.prdcrNm,
				    rprsItemCd 		: item.rprsItemCd,
				    rprsItemNm 		: item.rprsItemNm,
				    rprsVrtyCd 		: item.rprsVrtyCd,
				    rprsVrtyNm 		: item.rprsVrtyNm,
				    gdsSeCd 		: item.gdsSeCd,
				    wrhsSeCd 		: item.wrhsSeCd,
				    trsprtSeCd 		: item.trsprtSeCd,
				    clclnCrtrCd 	: item.clclnCrtrCd,
				    vhclno 			: item.vhclno,
				    telno			: item.telno,
				    prdcrLinkCd		: item.prdcrLinkCd,
				    prdcrIdentno	: item.prdcrIdentno,
				    rmrk 			: item.rmrk,
				    delYn 			: item.delYn,
				    apcCd 			: item.apcCd
				}
				jsonApcPrdcr.push(prdcrVO);
			});
    		grdApcPrdcr.rebuild();
    		grdApcPrdcr.setCellDisabled(0, 0, grdApcPrdcr.getRows() - 1, grdApcPrdcr.getCols() - 1, false);
    		let nRow = grdApcPrdcr.getRows();
    		grdApcPrdcr.addRow(true);
    		grdApcPrdcr.setCellDisabled(nRow, 0, nRow, grdApcPrdcr.getCols() - 1, true);

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	const fn_save = async function(){
		const apcCd = gv_selectedApcCd;
		let allData = grdApcPrdcr.getGridDataAll();
		const prdcrList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdApcPrdcr.getRowData(i);
			const rowSts = grdApcPrdcr.getRowStatus(i);

			if (rowData.delYn !== "N") {
				continue;
			}

			if (gfn_isEmpty(rowData.prdcrNm)){
				gfn_comAlert("W0002", "생산자명");		//	W0002	{0}을/를 입력하세요.
	            return;
			}
			if(!gfn_isEmpty(rowData.vhclno)){
	    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(rowData.vhclno))){
		    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
	    			return;
	    		}
	    	}

			if (rowSts === 3){
				rowData.apcCd = apcCd;
				rowData.rowSts = "I";
				prdcrList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				prdcrList.push(rowData);
			} else {
				continue;
			}
		}

		if (prdcrList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/cmns/multiPrdcrList.do", prdcrList);

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	const fn_addPrdcr = async function(nRow){
		const rowData = grdAgrixPrdcr.getRowData(nRow);

		const prdcrList = [];

		if(gfn_isEmpty(rowData.rmrk)){
			rowData.rmrk = "";
		}

		const prdcrVO = {
				apcCd  		: gv_selectedApcCd
			  , prdcrNm		: rowData.admstOwnrCorpNm
			  , prdcrLinkCd : rowData.mngmstRegno
			  , telno		: rowData.moblno
			  , rmrk		: rowData.rmrk
			  , rowSts 		: "I"
		}

		prdcrList.push(prdcrVO);

		const postJsonPromise = gfn_postJSON("/am/cmns/multiPrdcrList.do", prdcrList);

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}

	const fn_addRow = async function(nRow, nCol){

		grdApcPrdcr.setCellData(nRow, nCol, "N", true);
		grdApcPrdcr.setCellDisabled(nRow, 0, nRow, grdApcPrdcr.getCols() - 1, false);
		nRow++;
		grdApcPrdcr.addRow(true);
		grdApcPrdcr.setCellDisabled(nRow, 0, nRow, grdApcPrdcr.getCols() - 1, true);
	}

	const fn_delRow = async function(nRow){

		const rowSts = grdApcPrdcr.getRowStatus(nRow);

		if (rowSts == 0 || rowSts == 2){
			if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
				return;
			}
			const rowData = grdApcPrdcr.getRowData(nRow);
			const postJsonPromise = gfn_postJSON("/am/cmns/deletePrdcr.do", {
				apcCd: gv_selectedApcCd,
				prdcrCd: rowData.prdcrCd
			});

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
    	} else {
    		grdApcPrdcr.deleteRow(nRow);
    	}
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>