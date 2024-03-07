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
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 생산자관리 -->
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
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" style="float: right;">서식받기</sbux-button>
						<sbux-button
									id="btnUld"
									name="btnUld"
									uitype="normal"
									text="올리기"
									class="btn btn-sm btn-outline-danger"
									onclick="fn_uld"
									style="float: right;"
								></sbux-button>
					</div>
				</div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdApcPrdcr" style="height:283px;"></div>
				</div>
			</div>

				<div class="exp-div-excel" style="display: none;width: 1000px;">
					<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpItemCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWarehouseSe" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpClclnCrtrCd" style="height:1px; width: 100%;"></div>
					<input type="file" id="btnFileUploadPrdcr" name="btnFileUploadPrdcr" style="visibility: hidden;" onchange="importExcelDataPrdcr(event)" />


					<sbux-select id="excel-slt-gdsGrd"
							name="excel-slt-gdsGrd"
							uitype="single"
							unselected-text="전체"
							class="form-control input-sm"
							jsondata-ref="jsonExeclComGdsGrd"
					></sbux-select>
					<sbux-select id="excel-slt-trsprtSeCd"
							name="excel-slt-trsprtSeCd"
							uitype="single"
							unselected-text="전체"
							class="form-control input-sm"
							jsondata-ref="jsonExeclComGdsGrd"
					></sbux-select>
					<sbux-select id="excel-slt-spmtPckgUnit"
							name="excel-slt-spmtPckgUnit"
							uitype="single"
							unselected-text="전체"
							class="form-control input-sm"
							jsondata-ref="jsonExeclComSpmtPckgUnit"
					></sbux-select>
					<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
					<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
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

	<!-- 생산자 상세 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcrDtl"
        	name="modal-prdcrDtl"
        	uitype="middle"
        	header-title="생산자 상세"
        	body-html-id="body-modal-prdcrDtl"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcrDtl">
    	<jsp:include page="../../am/popup/prdcrDtlPopup.jsp"></jsp:include>
    </div>

    <!-- 산지 선택 Modal -->
    <div>
        <sbux-modal id="modal-comCd" name="modal-comCd" uitype="middle" header-title="공통코드조회" body-html-id="body-modal-comCd" footer-is-close-button="false" header-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="body-modal-comCd">
    	<jsp:include page="../../am/popup/comCdPopup.jsp"></jsp:include>
    </div>
     <div>
		<sbux-modal id="modal-excel-gdsInvntr" name="modal-excel-gdsInvntr"
			uitype="middle"
			header-title="재고등록"
			body-html-id="body-modal-excelGds"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>


    <!-- 엑셀 import 등록 Modal -->
    <div>
        <sbux-modal
        	id="modal-imp"
        	name="modal-imp"
        	uitype="middle"
        	header-title="생산자등록(Excel)"
        	body-html-id="body-modal-imp"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
		></sbux-modal>
    </div>
    <div id="body-modal-imp">
    	<jsp:include page="../../am/popup/importExcelPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	var jsonApcItemCd		= [];	// 대표품목 rprsItemCd	Grid
	var jsonApcVrtyCd		= [];	// 대표품종 rprsVrtyCd	Grid
	var jsonComGdsSeCd		= [];	// 상품구분 gdsSeCd	Grid
	var jsonComWrhsSeCd		= [];	// 입고구분 wrhsSeCd	Grid
	var jsonComTrsprtSeCd	= [];	// 운송구분 trsprtSeCd	Grid
	var jsonComClclnCrtrCd	= [];	// 정산기준 clclnCrtr	Grid
	var excelYn = "N";


	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('grdApcPrdcr', 	jsonApcItemCd, 		gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('grdApcPrdcr', 	jsonApcVrtyCd, 		gv_selectedApcCd),						// 품종
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComGdsSeCd, 	'GDS_SE_CD',	gv_selectedApcCd),		// 상품구분
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComTrsprtSeCd, 	'TRSPRT_SE_CD'),						// 운송구분
			gfn_setComCdSBSelect('grdApcPrdcr', 	jsonComClclnCrtrCd, 'CLCLN_CRTR_CD'),						// 정산기준
			gfn_setComCdSBSelect('prdcrDtl-slt-frmhsCtpv', jsonCtpvPrdcrDtlPop, 'CTPV', '0000'),		// 지역
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

	const fn_createAgrixPrdcrGrid = function() {

	    var SBGridAgrixPrdcrProperties = {};
	    SBGridAgrixPrdcrProperties.parentid = 'sb-area-grdAgrixPrdcr';
	    SBGridAgrixPrdcrProperties.id = 'grdAgrixPrdcr';
	    SBGridAgrixPrdcrProperties.jsonref = 'jsonAgrixPrdcr';
	    SBGridAgrixPrdcrProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridAgrixPrdcrProperties.selectmode = 'free';
	    SBGridAgrixPrdcrProperties.allowcopy = true;
	    SBGridAgrixPrdcrProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridAgrixPrdcrProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
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
	        {caption: ["휴대폰번호"], 		ref: 'mblTelno',			type:'output',  width:'150px', style: 'text-align:center'},
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
		    {caption: ["상세"], 			ref: 'delYn',  			type:'button',  width:'50px',  style:'text-align:center',	sortable: false,
		    	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(!gfn_isEmpty(strValue)){
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_modalPrdcrDtl(" + nRow + ")'>정보</button>";
	        	}else{
	        		return ;
	        	}
		    }},
		    {caption: ['번호'], 			ref: 'prdcrIdentno', 	type: 'input', 	width: '50px', style: 'text-align:center', sortable: false},
		    //{caption: ['생산자코드'], 			ref: 'prdcrCd', 	type: 'input', 	width: '70px', style: 'text-align:center', sortable: false},
		    {caption: ['생산자코드'], 			ref: 'prdcrCd', 	hidden:true},
	        {caption: ['생산자명'], 		ref: 'prdcrNm', 		type: 'input', 	width: '150px', style: 'text-align:center', sortable: false,
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
			{caption: ["산지코드"],    	ref: 'plorCd',        	type:'inputbutton',   width:'100px', style: 'text-align:center',
				typeinfo : {callback: fn_grdComCd}},
			{caption: ["외부연결코드"],    	ref: 'extrnlLnkgCd',     type:'input',   width:'100px', style: 'text-align:center'},
	        {caption: ['비고'], 			ref: 'rmrk', 			type: 'input', 	width: '200px', style: 'text-align:center', sortable: false,
	        	validate : gfn_chkByte.bind({byteLimit: 1000})},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
	        {caption: ['생산자코드'], ref: 'prdcrCd', hidden : true},
	        {caption: ['ROW STATUS'], ref: 'rowSts', hidden : true},

	    ];
	    grdApcPrdcr = _SBGrid.create(SBGridApcPrdcrProperties);
	    grdApcPrdcr.bind("afterimportexcel", setDataAfterImport);
	    fn_search();
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
			if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
			jsonAgrixPrdcr.length = 0;
	      	data.resultList.forEach((item, index) => {
	      		const prdcrVO = {
	      			mngmstRegno			: item.mngmstRegno
	      		  , admstOwnrCorpNm		: item.admstOwnrCorpNm
	      		  , admstOwnrRgdtAddr 	: item.admstOwnrRgdtAddr
	      		  , telno				: item.telno
	      		  , mblTelno			: item.mblTelno
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
			 if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
    		jsonApcPrdcr.length = 0;
        	data.resultList.forEach((item, index) => {
				const prdcrVO = {
					rowSeq			: item.rowSeq
				  ,	prdcrCd			: item.prdcrCd
				  , prdcrNm 		: item.prdcrNm
				  , rprsItemCd 		: item.rprsItemCd
				  , rprsItemNm 		: item.rprsItemNm
				  , rprsVrtyCd 		: item.rprsVrtyCd
				  , rprsVrtyNm 		: item.rprsVrtyNm
				  , gdsSeCd 		: item.gdsSeCd
				  , wrhsSeCd 		: item.wrhsSeCd
				  , trsprtSeCd 		: item.trsprtSeCd
				  , clclnCrtrCd 	: item.clclnCrtrCd
				  , vhclno 			: item.vhclno
				  , telno			: item.telno
				  , plorCd			: item.plorCd
				  , prdcrLinkCd		: item.prdcrLinkCd
				  , prdcrIdentno	: item.prdcrIdentno
				  , rmrk 			: item.rmrk
				  , delYn 			: item.delYn
				  , apcCd 			: item.apcCd
				  , frmhsTelno      : item.frmhsTelno
				  , frmhsCtpv		: item.frmhsCtpv
				  , frmhsAddr		: item.frmhsAddr
				  , extrnlLnkgCd	: item.extrnlLnkgCd
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
			if(excelYn == "Y"){
				if (rowSts === 0 || rowSts === 2){
					rowData.apcCd = apcCd;
					rowData.rowSts = "I";
					prdcrList.push(rowData);
				}  else {
					continue;
				}
			}else{
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
			  , telno		: rowData.mblTelno
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

	// 생산자 상세 팝업 호출
	const fn_modalPrdcrDtl = async function (nRow){
		let rowData = grdApcPrdcr.getRowData(nRow);
		SBUxMethod.openModal('modal-prdcrDtl');
		popPrdcrDtl.init(gv_selectedApcCd, gv_selectedApcNm, rowData);
	}


	/* 산지코드 선택 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalComCd
	 * @description 산지코드선택팝업 호출
	 */
	const fn_grdComCd = function() {
		let nRow = grdApcPrdcr.getRow();
		let plorCd = nRow.plorCd;
		let cdVlNm = '산지명';
		let cdVl = 'STD_PLOR_CD';

		SBUxMethod.openModal('modal-comCd');

		popComCd.init(gv_selectedApcCd, gv_selectedApcNm, plorCd,cdVl,cdVlNm, fn_setComNm);
	}

	/**
	 * @name fn_setFlnm
	 * @description 산지코드선택 callback
	 */
	const fn_setComNm = function(comNm) {
		let nRow = grdApcPrdcr.getRow();
		let comCdCol = grdApcPrdcr.getColRef("plorCd");
		let flag = true;

		if (!gfn_isEmpty(comNm)) {

			let gridData = grdApcPrdcr.getGridDataAll();
			if(gridData.length > 2){

				if(flag){
					grdApcPrdcr.setCellData(nRow, comCdCol, comNm.comCd);
					grdApcPrdcr.setRowStatus(nRow,2);

				}else{
					let plorNm = "";
					SBUxMethod.openModal('modal-comCd');
					popOprtr.init(gv_selectedApcCd, gv_selectedApcNm, plorNm, fn_setplorNm);
				}
			}else{
				grdApcPrdcr.setCellData(nRow, plorCol, plorNm.plorCd);
			}

		}

	}
	function fn_excelDwnld() {
		grdApcPrdcr.exportLocalExcel("생산자 목록", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	const fn_dwnld = async function(){
		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();
		const expObjList = [
		{
			sbGrid: grdExpPrdcr,
	        parentid: "sbexp-area-grdExpPrdcr",
	        id: "grdExpPrdcr",
	        jsonref: "jsonExpPrdcr",
			columns: expColumns,
	        sheetName: "생산자등록내역",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpItemCd,
	        parentid: "sbexp-area-grdExpItemCd",
	        id: "grdExpItemCd",
	        jsonref: "jsonExpItemCd",
			columns: [
		    	{caption: ["품목코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
		        {caption: ["품목명"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}
			],
	        sheetName: "대표품목",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpVrty,
	        parentid: "sbexp-area-grdExpVrty",
	        id: "grdExpVrty",
	        jsonref: "jsonExpVrty",
			columns: [
				{caption: ["품목코드"],		ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
				{caption: ["품목명"],		ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'},
				{caption: ["품종코드"],    ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
		    	{caption: ["품종명칭"],    ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
			],
	        sheetName: "대표품종",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpGdsSeCd,
	        parentid: "sbexp-area-grdExpGdsSeCd",
	        id: "grdExpGdsSeCd",
	        jsonref: "jsonExpGdsSeCd",
			columns: [
				{caption: ["상품구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
		    	{caption: ["상품구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
			],
	        sheetName: "상품구분",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpWrhsSeCd,
	        parentid: "sbexp-area-grdExpWrhsSeCd",
	        id: "grdExpWrhsSeCd",
	        jsonref: "jsonExpWrhsSeCd",
			columns: [
		    	{caption: ["입고구분코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
		        {caption: ["입고구분코드명"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}

			],
	        sheetName: "입고구분",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpTrsprtSeCd,
	        parentid: "sbexp-area-grdExpTrsprtSeCd",
	        id: "grdExpTrsprtSeCd",
	        jsonref: "jsonExpTrsprtSeCd",
			columns: [
		    	{caption: ["운송구분코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
		        {caption: ["운송구분코드명"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}

			],
	        sheetName: "운송구분",
	        title: "",
	        unit: ""
		},{
			sbGrid: grdExpClclnCrtrCd,
	        parentid: "sbexp-area-grdExpClclnCrtrCd",
	        id: "grdExpClclnCrtrCd",
	        jsonref: "jsonExpClclnCrtrCd",
			columns: [
		    	{caption: ["정산구분코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
		        {caption: ["정산구분코드명"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}

			],
	        sheetName: "정산구분",
	        title: "",
	        unit: ""
		}];





		await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드

		let fileName = "생산자등록(샘플).xlsx";
		gfn_exportExcelMulti(fileName, expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}
	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			exp.sbGrid.addRow(true);
		});
	}
	const gfn_exportExcelMulti = function(_fileName, _objList) {

		//	엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		//넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}




	var grdExpItemCd;					// 품목
	var grdExpVrty;						// 품종
	var grdExpGdsSeCd;		        	// 상품구분
	var grdExpWarehouseSe;				//보관창고
	var grdExpWrhsSeCd;					//입고구분
	var grdExpTrsprtSeCd;		        // 운송구분
	var grdExpClclnCrtrCd;		    	// 정산기준
	var grdExpPrdcr;					//엑셀 생산자

	var jsonExpSltItemCd 			= [];				// 품목
	var jsonExpSltVrty 			    = [];				// 품종
	var jsonExpSltGdsSeCd 		    = [];		        // 상품구분
	var jsonExpSltWrhsSeCd 		    = [];				// 입고구분
	var jsonExpSltWarehouseSe 	    = [];			    // 보관창고
	var jsonExpSltTrsprtSeCd 	    = [];	            // 운송구분
	var jsonExpSltClclnCrtrCd 		= [];			    // 정산기준

	var jsonExpPrdcr 			= [];				// 엑셀 생산자
	var jsonExpItemCd 			= [];				// 품목
	var jsonExpVrty 			= [];				// 품종
	var jsonExpGdsSeCd 		    = [];		        // 상품등급
	var jsonExpWrhsSeCd 		= [];				// 생산자
	var jsonExpWarehouseSe 	    = [];			    // 보관창고
	var jsonExpTrsprtSeCd 	    = [];	            // 운송구분
	var jsonExpClclnCrtrCd 		= [];			    // 정산기준

	const fn_setSltJson = async function() {
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		jsonExpSltItemCd 			= gfn_cloneJson(jsonApcItemCd);				// 품목
		jsonExpSltVrty 			= gfn_cloneJson(jsonApcVrtyCd);					// 품종
		jsonExpSltGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);				// 상품구분
		jsonExpSltWrhsSeCd 		= gfn_cloneJson(jsonComWrhsSeCd);				// 입고구분
		jsonExpSltWarehouseSe 	= gfn_cloneJson(jsonComWrhsSeCd);				// 보관창고
		jsonExpSltTrsprtSeCd 	= gfn_cloneJson(jsonComTrsprtSeCd);				// 운송구분
		jsonExpSltClclnCrtrCd 		= gfn_cloneJson(jsonComClclnCrtrCd);		// 정산기준
	}

	const fn_setExpJson = async function() {
		// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// export grid data
		jsonExpPrdcr.length = 0;

		jsonExpItemCd 			= gfn_cloneJson(jsonApcItemCd);			// 엑셀 품목Json
		jsonExpVrty 			= gfn_cloneJson(jsonApcVrtyCd);			// 엑셀 품종Json
		jsonExpGdsSeCd 			= gfn_cloneJson(jsonComGdsSeCd);		// 엑셀 상품구분Json
		jsonExpWrhsSeCd 		= gfn_cloneJson(jsonComWrhsSeCd);		// 엑셀 입고구분Json
		jsonExpWarehouseSe 		= gfn_cloneJson(jsonComWrhsSeCd);		// 엑셀 입고구분Json
		jsonExpTrsprtSeCd 		= gfn_cloneJson(jsonComTrsprtSeCd);		// 엑셀 운송구분Json
		jsonExpClclnCrtrCd 		= gfn_cloneJson(jsonComClclnCrtrCd);	// 엑셀 정산구분Json

	}

	const fn_uld = function (){
		document.querySelector("#btnFileUploadPrdcr").value = "";
		$("#btnFileUploadPrdcr").click();
	}
	const importExcelDataPrdcr = function (e){
		jsonExpPrdcr = 0;
		grdApcPrdcr.rebuild();
		grdApcPrdcr.importExcelData(e,1,2);
     }

	const setDataAfterImport = function (e){
		let allData = grdApcPrdcr.getGridDataAll();
		for(var i=1; i<=allData.length; i++){
			let rowData = grdApcPrdcr.getRowData(i, false) // deep copy;

			let rprsItemCd 		= $.trim(rowData.rprsItemCd);
			let rprsVrtyCd 		= $.trim(rowData.rprsVrtyCd);
			let gdsSeCd	 		= $.trim(rowData.gdsSeCd);
			let wrhsSeCd	 	= $.trim(rowData.wrhsSeCd);
			let trsprtSeCd	 	= $.trim(rowData.trsprtSeCd);
			let clclnCrtrCd	 	= $.trim(rowData.clclnCrtrCd);
			// 상품구분 명 or 코드 일치 검사
			for(var j=0; j<jsonExpGdsSeCd.length; j++){
				if(jsonExpGdsSeCd[j].text == gdsSeCd || jsonExpGdsSeCd[j].value == gdsSeCd){
					rowData.gdsSeCd = jsonExpGdsSeCd[j].value;
					break;
				}
			}

			// 입고구분 명 or 코드 일치 검사
			for(var j=0; j<jsonExpWrhsSeCd.length; j++){
				if(jsonExpWrhsSeCd[j].text == wrhsSeCd || jsonExpWrhsSeCd[j].value == wrhsSeCd){
					rowData.wrhsSeCd = jsonExpWrhsSeCd[j].value;
					break;
				}
			}

			// 운송구분 명 or 코드 일치 검사
			for(var j=0; j<jsonExpTrsprtSeCd.length; j++){
				if(jsonExpTrsprtSeCd[j].text == trsprtSeCd || jsonExpTrsprtSeCd[j].value == trsprtSeCd){
					rowData.trsprtSeCd = jsonExpTrsprtSeCd[j].value;
					break;
				}
			}

			// 정산구분 명 or 코드 일치 검사
			for(var j=0; j<jsonExpClclnCrtrCd.length; j++){
				if(jsonExpClclnCrtrCd[j].text == clclnCrtrCd || jsonExpClclnCrtrCd[j].value == clclnCrtrCd){
					rowData.clclnCrtrCd = jsonExpClclnCrtrCd[j].value;
					break;
				}
			}

			// 품목 명 or 코드 일치 검사
			for(var j=0; j<jsonExpItemCd.length; j++){
				if(jsonExpItemCd[j].itemCd == rprsItemCd || jsonExpItemCd[j].itemNm == rprsItemCd){
					rowData.rprsItemCd = jsonExpItemCd[j].itemCd;
					break;
				}
			}
			// 품종 명 or 코드 일치 검사
			for(var j=0; j<jsonExpVrty.length; j++){
				if(jsonExpVrty[j].itemCd == rowData.rprsItemCd && (jsonExpVrty[j].vrtyNm == rprsVrtyCd || jsonExpVrty[j].vrtyCd == rprsVrtyCd ) ){
					rowData.rprsVrtyCd = jsonExpVrty[j].vrtyCd;
					break;
				}
			}
			rowData.delYn = "N";
			rowData.rowSts = "I";
			excelYn = "Y";
			grdApcPrdcr.rebuild();
		}
	}

	const fn_getExpColumns = function() {
		let _columns = fn_getPrdcrColumns();

		return _columns;
	}

	const fn_getPrdcrColumns = function() {
		const _columns = [

			{
				caption: ['번호'],
				ref: 'prdcrIdentno',
				type: 'input',
				width: '60px',
				style: 'text-align:center',
				sortable: false,
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},
			{
				caption: ["생산자명"],
				ref: 'prdcrNm',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},
			{
				caption: ["대표품목"],
				ref: 'rprsItemCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpItemCd',
					displayui : false,
					itemcount: 10,
					label:'label',
					value:'value'
				}
			},
			{
				caption: ["대표품종"],
				ref: 'rprsVrtyCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpVrty',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},
			{
				caption: ["상품구분"],
				ref: 'gdsSeCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpGdsSeCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},
			{
				caption: ["입고구분"],
				ref: 'wrhsSeCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpWrhsSeCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["운송구분"],
				ref: 'trsprtSeCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpTrsprtSeCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["정산기준"],
				ref: 'clclnCrtrCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["차량번호"],
				ref: 'vhclno',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["전화번호"],
				ref: 'telno',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["생산자연계코드"],
				ref: 'prdcrLinkCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["산지코드"],
				ref: 'plorCd',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			},{
				caption: ["비고"],
				ref: 'rmrk',
				type:'combo',
				width:'80px',
				style:'text-align:center;background-color:#FFF8DC;',
				typeinfo : {
					ref:'jsonExpClclnCrtrCd',
					displayui : false,
					itemcount: 10,
					style: 'text-align:right;background-color:#FFF8DC;',
					label:'label',
					value:'value'
				}
			}

		];
		return _columns;
	}
	/* End */
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>