<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="srch-btn-ddln" name="srch-btn-ddln" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-ddln" onclick="fn_modalDdln"/>
				</div>
			</div>
		</div>
	</section>
    <!-- 마감 등록 Modal -->
    <div>
        <sbux-modal id="modal-ddln" name="modal-ddln" uitype="middle" header-title="마감 등록" body-html-id="body-modal-ddln" footer-is-close-button="false" style="width:700px"></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/regDdlnPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem				= [];	// 품목 		itemCd		검색
	var jsonComVrty				= [];	// 품종 		vrtyCd		검색
	var jsonComGrd				= [];	// 등급 		vrtyCd		검색
	var jsonComSpcfct			= [];	// 규격 		spcfcCd		검색
	var jsonComWarehouseSeCd	= [];	// 팔레트/박스 	warehouse	검색
	var jsonComBox	= [];	// 팔레트/박스 	warehouse	검색

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd);			// 창고
	 	gfn_setPltBxSBSelect('srch-slt-box', 			jsonComBox, 			gv_selectedApcCd, 'B');			// 박스
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, gv_selectedApcCd);			// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd);		// 품종
	}

	const fn_choiceDdln = function() {
    	console.log("apcCd: ", gv_apcCd, " apcNm: ", gv_apcNm);
    	fn_modalDdln(gv_apcCd, gv_apcNm, fn_setDdln);
	}
	
	const fn_setDdln = function(ddln) {
		if (!gfn_isEmpty(ddln)) {
			SBUxMethod.set("trsprtCst-inp-vhclno", ddln.vhclno);
			SBUxMethod.attr("trsprtCst-inp-vhclno", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, gv_selectedApcCd, itemCd);		// 규격
		gfn_setApcGrdsSBSelect('srch-slt-grdCd', 		jsonComGrd, 	gv_selectedApcCd, itemCd);		// 등급
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();
// 		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		fn_initSBSelect();
		fn_getPrdcrs();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

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
	        {caption: ["입고번호"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["팔레트번호번호"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'msgKey',      type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["중량 Kg"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["박스종류"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'130px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}


	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", null);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}


</script>
</html>