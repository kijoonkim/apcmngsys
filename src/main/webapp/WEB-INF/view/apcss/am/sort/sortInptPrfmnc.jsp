<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 선별실적조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSort" name="btnDocSort" uitype="normal" text="선별확인서" class="btn btn-sm btn-success" onclick="gfn_comAlert('E0000', 'test')"></sbux-button>
					<sbux-button id="btnSearch" name="btnDocSort" uitype="normal" text="조회" class="btn btn-sm btn-outline-dark" onclick="fn_selectSortInptList"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<th scope="row" class="th_bg">선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-startsortYmd" name="srch-inp-startsortYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-endSortYmd" name="srch-inp-endSortYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm-ast" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">선별기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-fcltCd" name="srch-slt-fcltCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComFcltCd"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouse" ></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonSpcfct"></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
							<th scope="row" class="th_bg">대표생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>선별 내역</span></li>
						</ul>
					</div>
					<div id="sb-area-grdSortDsctn" style="height:540px;"></div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!--  품목 선택 Modal -->
   	<div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonItem			= [];	// 품목 	itemCd			검색
	var jsonVrty			= [];	// 품종 	vrtyCd			검색
	var jsonSpcfct			= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd		검색
	var jsonPrdcr			= [];
	var jsonPrdcrAutocomplete = [];
	var jsonComItem			= [];	// 품목 			itemCd		검색
	var jsonComVrty			= [];	// 품종 			vrtyCd		검색
	var jsonSpmtPckgUnit	= [];	// 출하포장단위 	pckgSeCd	그리드

	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 		'FCLT_CD',		  gv_selectedApcCd)		// 선벌기
		])
	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}


     const fn_setVrty = function(vrty) {

		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}



	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	async function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonSpcfct, gv_selectedApcCd, itemCd);	// 규격

		fn_getPrdcrs();
	}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_createSortDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2);
		let day = ('0' + today.getDate()).slice(-2);
		SBUxMethod.set("srch-inp-startsortYmd", year+month+day);
		SBUxMethod.set("srch-inp-endSortYmd", year+month+day);

		fn_selectSortInptList();

		fn_initSBSelect();

    });

    //grid 초기화
    var grdComMsgList; // 그리드를 담기위한 객체 선언
    var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createSortDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortDsctn';
	    SBGridProperties.id = 'grdComMsgList';
	    SBGridProperties.jsonref = 'jsonComMsgList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
            {caption: ["선별일자","선별일자"],		ref: 'inptYmd',     	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["설비명","설비명"], 			ref: 'fcltNm',     		type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["입고구분","입고구분"], 	 	ref: 'wrhsSeNm',    	type:'output',  width:'50px',    style:'text-align:center'},
            {caption: ["상품구분","상품구분"],    	ref: 'gdsSeNm',       	type:'output',  width:'50px',    style:'text-align:center'},
            {caption: ["품종","품종"],	    		ref: 'itemNm', 			type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["규격","규격"],  			ref: 'spcfctCd',   		type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["투입","수량"],  			ref: 'inptQntt',   		type:'output',  width:'60px',    style:'text-align:center'},
            {caption: ["투입","중량"],  			ref: 'inptWght',   		type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["등급","등급"],  			ref: 'grdNm', 			type:'output',  width:'60px',    style:'text-align:center'},
            {caption: ["선별","수량"],  			ref: 'sortQntt', 		type:'output',  width:'60px',    style:'text-align:center'},
            {caption: ["선별","중량"],  			ref: 'sortWght', 		type:'output',  width:'80px',    style:'text-align:center'},
            {caption: ["LOSS","LOSS"], 				ref: 'ls',  			type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["대표생산자","대표생산자"], 	ref: 'rprsPrdcrNm',  	type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["투입창고","투입창고"], 		ref: 'strgWarehouse',  	type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["저장창고","저장창고"], 		ref: 'warehouseSeNm',  	type:'output',  width:'7%',    style:'text-align:center'},
            {caption: ["비고","비고"], 				ref: 'rmrk',  			type:'output',  width:'7%',    style:'text-align:center'}
        ];


        grdComMsgList = _SBGrid.create(SBGridProperties);
    }

  //조회
    const fn_selectSortInptList = async function() {
    	grdComMsgList.rebuild();
    	let pageSize = grdComMsgList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonComMsgList.length = 0;
    	grdComMsgList.clearStatus();
    	fn_callSelectSortInptList(pageSize, pageNo);

    }

    var newSortInptPrfmncGridData = [];
	const fn_callSelectSortInptList = async function(pageSize, pageNo) {
    	let startsortYmd  = SBUxMethod.get("srch-inp-startsortYmd");
    	let endSortYmd  = SBUxMethod.get("srch-inp-endSortYmd");
    	let itemCd  = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd  = SBUxMethod.get("srch-inp-vrtyCd");
    	let fcltCd  = SBUxMethod.get("srch-slt-fcltCd");
    	let warehouseSeCd  = SBUxMethod.get("srch-slt-warehouseSeCd");
    	let spcfctCd  = SBUxMethod.get("srch-slt-spcfctCd");
    	let prdcrCd  = SBUxMethod.get("srch-inp-prdcrCd");

		const postJsonPromise = gfn_postJSON("/am/sort/sortPrfmncInq.do", {
			apcCd		: gv_selectedApcCd,
			startsortYmd: startsortYmd,
			endSortYmd: endSortYmd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			fcltCd: fcltCd,
			warehouseSeCd: warehouseSeCd,
			spcfctCd: spcfctCd,
			prdcrCd: prdcrCd,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonComMsgList.length = 0;
          	data.resultList.forEach((item, index) => {
          		const sortPrfmncInq = {

          				inptYmd: item.inptYmd,
          				fcltNm: item.fcltNm,
          				wrhsSeNm: item.wrhsSeNm,
          				gdsSeNm: item.gdsSeNm,
          				itemNm: item.itemNm,
          				spcfctCd: item.spcfctCd,
          				inptQntt: item.inptQntt,
          				inptWght: item.inptWght,
          				grdNm: item.grdNm,
          				sortQntt: item.sortQntt,
          				sortWght: item.sortWght,
          				ls: item.ls,
          				rprsPrdcrNm: item.rprsPrdcrNm,
          				warehouseSeNm: item.warehouseSeNm,
          				strgWarehouse: item.strgWarehouse,
          				rmrk: item.rmrk
  				}
  				jsonComMsgList.push(sortPrfmncInq);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	if (jsonComMsgList.length > 0) {
          		if(grdComMsgList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdComMsgList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdComMsgList.rebuild();
  				}else{
  					grdComMsgList.refresh();
  				}
          	} else {
          		grdComMsgList.setPageTotalCount(totalRecordCount);
          		grdComMsgList.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
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
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
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