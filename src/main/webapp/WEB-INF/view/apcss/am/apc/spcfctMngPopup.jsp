<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 규격/감량률 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">선택한 품목별로 APC에서 관리하는 규격을 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">품목별 감량률 등록은 원물계량실적, 선별실적, 포장실적에 적용되는 감량률을 등록하세요.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpcfct" name="btnSearchSpcfct" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchSpcfctAll"></sbux-button>
					<sbux-button id="btnSaveSpcfct" name="btnSaveSpcfct" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveApcSpcfctList"></sbux-button>
					<sbux-button id="btnEndSpcfct" name="btnEndSpcfct" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spcfct')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 200px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<sbux-input id="spcfct-inp-apcNm" name="spcfct-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row"><span class="data_required"></span>품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="spcfct-slt-itemCd" name="spcfct-slt-itemCd" uitype="single"
									jsondata-ref="jsonComItemCd"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_searchSpcfctAll"
									style="background-color:#ffffff;"
									></sbux-select>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>
					<!--[pp] 검색 -->
					<div class="ad_tbl_top"  style="width: 98%;">
						<ul class="ad_tbl_count">
							<li><span>품목별 감량률</span></li>
						</ul>
					</div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 200px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">원물감량률</th>
								<th>
									<sbux-input id="spcfct-inp-rawMtrRdcdRt" name="spcfct-inp-rawMtrRdcdRt" uitype="text" class="form-control input-sm"
									mask = "{ 'alias': 'currency', 'digits': 2, 'suffix': '%', 'prefix': '', 'autoUnmask': true }"
									maxlength="6"
									readonly
									></sbux-input>
								</th>
								<th scope="row">선별감량률</th>
								<th>
									<sbux-input id="spcfct-inp-sortRdcdRt" name="spcfct-inp-sortRdcdRt" uitype="text" class="form-control input-sm"
									mask = "{ 'alias': 'currency', 'digits': 2, 'suffix': '%' , 'prefix': '', 'autoUnmask': true }"
									maxlength="6"
									readonly
									></sbux-input>
								</th>
								<th scope="row">포장감량률</th>
								<th>
									<sbux-input id="spcfct-inp-pckgRdcdRt" name="spcfct-inp-pckgRdcdRt" uitype="text" class="form-control input-sm"
									mask = "{ 'alias': 'currency', 'digits': 2, 'suffix': '%' , 'prefix': '', 'autoUnmask': true }"
									maxlength="6"
									readonly
									></sbux-input>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">

					<div class="ad_tbl_top"  style="width: 98%;">
						<ul class="ad_tbl_count">
							<li><span>규격등록</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdApcSpcfct" style="height:283px; width: 100%;"></div>
					</div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComItemCd = [];

	var jsonGrd = [];
	var jsonApcSpcfct = [];
	var jsonSpcfctUnitCd = [];
	var jsonSpcfctPckgSttsCd = [];
	var jsonUseYn = [];

	var resultItemVO = {};

	const fn_initSBSelectSpcfct = async function() {
		let rst = await Promise.all([
			gfn_setComCdGridSelect('grdApcSpcfct', 			jsonSpcfctUnitCd, 		'UNIT_CD', '0000'),			// 단위
			gfn_setComCdGridSelect('grdApcSpcfct', 			jsonSpcfctPckgSttsCd, 	'PCKG_STTS_CD', '0000'),	// 포장구분
			gfn_setComCdGridSelect('grdApcSpcfct', 			jsonUseYn, 				'REVERSE_YN', '0000'),		// 포장구분
			gfn_setApcItemSBSelect("spcfct-slt-itemCd", 	jsonComItemCd, 			gv_apcCd)					// APC 품목
		])

		SBUxMethod.set("spcfct-inp-apcNm", gv_apcNm);

		jsonApcSpcfct.length = 0;
		grdApcSpcfct.refresh({"combo":true});
	}

	const fn_createSpcfct = async function() {

   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcSpcfct';
	    SBGridProperties.id = 'grdApcSpcfct';
	    SBGridProperties.jsonref = 'jsonApcSpcfct';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListApcSpcfct;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
			{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdApcSpcfct\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdApcSpcfct\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["규격명"],   ref: 'spcfctNm',  	type:'input',  width:'310px',    style:'text-align:center', typeinfo : {maxlength : 30}},
// 	        {caption: ["중량단위"], ref: 'unitCd',   	type:'combo',  width:'100px',    style:'text-align:center',
// 				typeinfo : {ref:'jsonSpcfctUnitCd', 	itemcount: 3, label:'label', value:'value', displayui : false}},
	        {caption: ["포장구분"], ref: 'pckgSttsCd',   	type:'combo',  width:'150px',    style:'text-align:center',
				typeinfo : {ref:'jsonSpcfctPckgSttsCd', itemcount: 10, label:'label', value:'value', displayui : false}},
	        {caption: ["평균입수"],	ref: 'bxGdsQntt',  	type:'input',  width:'150px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}},},
	        {caption: ["단중"],     ref: 'wght',  		type:'input',  width:'150px',    style:'text-align:center',
	        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###.000'}
	        },
	        {caption: ["사용유무"], 	ref: 'delYn',  type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonUseYn', label:'label', value:'value',  displayui : false}},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}
	    ];
	    grdApcSpcfct = _SBGrid.create(SBGridProperties);
	    fn_initSBSelectSpcfct();
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListApcSpcfct = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldApcSpcfct,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldApcSpcfct() {
    	grdApcSpcfct.exportLocalExcel("규격 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	const fn_searchSpcfctAll = async function(){
		if(jsonComItemCd.length == 0){
			gfn_comAlert("E0000", "품목 먼저 등록해주세요.");
			return;
		}
		let itemCd = SBUxMethod.get("spcfct-slt-itemCd");

		if(gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		SBUxMethod.attr('spcfct-inp-rawMtrRdcdRt', 'readonly', 'false');
		SBUxMethod.attr('spcfct-inp-sortRdcdRt', 'readonly', 'false');
		SBUxMethod.attr('spcfct-inp-pckgRdcdRt', 'readonly', 'false');

		let rst = await Promise.all([
			fn_searchItemRdCdDt(),
			fn_searchSpcfctList()
		])
	}

	const fn_searchItemRdCdDt = async function(){
		let itemCd = SBUxMethod.get("spcfct-slt-itemCd");
		let apcCd = SBUxMethod.get("inp-apcCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsApcItem.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				let itemVO = data.resultMap;
  				resultItemVO = itemVO;
  		    	SBUxMethod.set('spcfct-inp-rawMtrRdcdRt', itemVO.rawMtrRdcdRt);
  				SBUxMethod.set('spcfct-inp-sortRdcdRt', itemVO.sortRdcdRt);
  				SBUxMethod.set('spcfct-inp-pckgRdcdRt', itemVO.pckgRdcdRt);

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_searchSpcfctList = async function(){


		let itemCd = SBUxMethod.get("spcfct-slt-itemCd");

		let apcCd = SBUxMethod.get("inp-apcCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectApcSpcfctList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  		    	jsonApcSpcfct.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spcfctVO = {
  						spcfctCd 	: item.spcfctCd
  					  , spcfctNm 	: item.spcfctNm
  					  , apcCd		: item.apcCd
  					  , itemCd		: item.itemCd
  					  , unitCd		: item.unitCd
  					  , pckgSttsCd	: item.pckgSttsCd
  					  , bxGdsQntt	: item.bxGdsQntt
  					  , wght		: item.wght
  					  , useYn		: item.delYn
  					  , delYn		: item.delYn
  					}
  					jsonApcSpcfct.push(spcfctVO);
  				});
  		    	grdApcSpcfct.rebuild();
  		    	grdApcSpcfct.addRow(true);
  		    	grdApcSpcfct.setCellDisabled(grdApcSpcfct.getRows() -1, 0, grdApcSpcfct.getRows() -1, grdApcSpcfct.getCols() -1, true);

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_deleteSpcfct = async function(cmnsSpcfctVO){

		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcSpcfct.do", cmnsSpcfctVO);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return;
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }

	}

	const fn_saveApcSpcfctList = async function(){
		let spcfctGridData = grdApcSpcfct.getGridDataAll();
		let spcfctList = [];
		let resultCnt = 0;

		for(var i=1; i<=spcfctGridData.length; i++ ){
			let rowData = grdApcSpcfct.getRowData(i);

			let delYn = rowData.delYn;
			let spcfctNm = rowData.spcfctNm;
			let unitCd = "2";
// 			let unitCd = rowData.unitCd;
			let pckgSttsCd = rowData.pckgSttsCd;
			let rowSts = grdApcSpcfct.getRowStatus(i);

			if(delYn == 'N'){
				if (gfn_isEmpty(spcfctNm)) {
		  			gfn_comAlert("W0002", "규격명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (gfn_isEmpty(unitCd)) {
		  			gfn_comAlert("W0001", "단위");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}
				if (gfn_isEmpty(pckgSttsCd)) {
		  			gfn_comAlert("W0001", "단위");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}

				if (rowSts === 3){
					rowData.rowSts = "I";
					spcfctList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					spcfctList.push(rowData);
				} else {
					continue;
				}
			}
		}

		let apcCd			= gv_apcCd;
		let itemCd			= SBUxMethod.get('spcfct-slt-itemCd');
		let rawMtrRdcdRt 	= SBUxMethod.get('spcfct-inp-rawMtrRdcdRt');
		let sortRdcdRt 		= SBUxMethod.get('spcfct-inp-sortRdcdRt');
		let pckgRdcdRt 		= SBUxMethod.get('spcfct-inp-pckgRdcdRt');

		itemVO = {
				apcCd			: apcCd,
				itemCd			: itemCd,
				rawMtrRdcdRt 	: rawMtrRdcdRt,
				sortRdcdRt 		: sortRdcdRt,
				pckgRdcdRt 		: pckgRdcdRt
		}

		if((resultItemVO.rawMtrRdcdRt == rawMtrRdcdRt && resultItemVO.sortRdcdRt == sortRdcdRt && resultItemVO.pckgRdcdRt == pckgRdcdRt) && spcfctList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		if(!(resultItemVO.rawMtrRdcdRt == rawMtrRdcdRt && resultItemVO.sortRdcdRt == sortRdcdRt && resultItemVO.pckgRdcdRt == pckgRdcdRt)){
			resultCnt += await fn_saveRdcdRt(itemVO);
		}

		if(spcfctList.length > 0){
			resultCnt += await fn_saveSpcfct(spcfctList);
		}
		if(resultCnt > 0){
			gfn_comAlert("I0001");		// I0001	처리 되었습니다.
			let rst = await Promise.all([
				fn_searchItemRdCdDt(),
				fn_searchSpcfctList()
			])
		}
	}

	const fn_saveSpcfct = async function(spcfctList){
		let postJsonPromise = gfn_postJSON("/am/cmns/multiApcSpcfctList.do", spcfctList);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return 1;
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }
	}

	const fn_saveRdcdRt = async function(itemVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateApcCmnsItem.do", itemVO);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return 1;
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }

	}

</script>
</html>