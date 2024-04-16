<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 품목/품종 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">APC에서 관리하고 있는 품목과 품종을 선택하세요.(여러가지 품목과 품종을 관리할 수 있습니다.)</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">품목은 농수축산물 표준코드를 준수하며, 품종은 APC별 사용자 정의로 등록할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSearchItem"
						name="btnSearchItem"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_searchAll"
					></sbux-button>
					<sbux-button
						id="btnSaveItem"
						name="btnSaveItem"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_saveApcVrtyList"
					></sbux-button>
					<sbux-button
						id="btnEndItem"
						name="btnEndItem"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger"
						onclick="gfn_closeModal('modal-item')"
					></sbux-button>
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
									<sbux-input id=item-inp-apcNm name="item-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">품목명</th>
								<th  style="border-right-style: hidden;">
									<sbux-input id=item-inp-itemNm name="item-inp-itemNm" uitype="text" class="form-control input-sm" onkeyenter="fn_searchItemList"></sbux-input>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">

					<div class="col-sm-5">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>농수축산물표준 품목</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdItem" style="height:159px; width: 100%;"></div>
						</div>
					</div>


					<div class="col-sm-7">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC관리 품목</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdApcItem" style="height:159px; width: 100%;"></div>
						</div>
					</div>
					<b>&nbsp;</b>
				</div>
				<div class="">
					<table class="table table-bordered tbl_row tbl_fixed mg_t10">
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
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="vrty-inp-itemNm" name="vrty-inp-itemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="vrty-inp-itemCd" name="vrty-inp-itemCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">품종명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="vrty-inp-vrtyNm" name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm" onkeyenter="fn_searchVrtyList"></sbux-input>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col-sm-5">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>농수축산물표준 품종</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdVrty" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC관리 품종</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdApcVrty" style="height:157px; width: 100%;"></div>
						</div>
					</div>
				</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>

	</section>
</body>
<script type="text/javascript">
	var jsonVrtyWghtRkngSeCd	= [];
	var jsonApcVrtyWghtRkngSeCd	= [];
	var jsonSortInptVlType = [];
	var jsonIndctArtclType = [];

	const fn_initSBSelectItemVrty = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect("grdVrty", 		jsonVrtyWghtRkngSeCd, "WGHT_RKNG_SE_CD"),		// 상품등급(출하)
			gfn_setComCdSBSelect("grdApcVrty", 		jsonApcVrtyWghtRkngSeCd, "WGHT_RKNG_SE_CD"), 	// 상품등급(출하)
			gfn_setComCdSBSelect("grdApcVrty", 		jsonSortInptVlType, "VL_TYPE"),					// 선별입력유형
			gfn_setComCdSBSelect("grdApcVrty", 		jsonIndctArtclType, "INDCT_ARTCL_TYPE")			// 상품표시유형
		]);

		jsonApcVrty.length = 0;
		jsonVrty.length = 0;
		grdVrty.refresh({"combo":true});
		grdApcVrty.refresh({"combo":true});

		fn_searchAll();
	}

	var jsonItem 	= []; // 품목 그리드의 참조 데이터 주소 선언
	var jsonApcItem = []; // APC품목 그리드의 참조 데이터 주소 선언
	var jsonVrty 	= []; // 품종 그리드의 참조 데이터 주소 선언
	var jsonApcVrty = []; // APC품종 그리드의 참조 데이터 주소 선언
	const fn_createGridItemVrty = async function() {
		SBUxMethod.set("item-inp-apcNm", gv_apcNm);

		// 마스터 품목
		let SBGridPropertiesItem = {};
		SBGridPropertiesItem.parentid = 'sb-area-grdItem';
		SBGridPropertiesItem.id = 'grdItem';
		SBGridPropertiesItem.jsonref = 'jsonItem';
		SBGridPropertiesItem.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesItem.selectmode = 'free';
		SBGridPropertiesItem.allowcopy = true;
		SBGridPropertiesItem.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridPropertiesItem.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridPropertiesItem.contextmenulist = objMenuListItem;	// 우클릭 메뉴 리스트
		SBGridPropertiesItem.extendlastcol = 'scroll';
		SBGridPropertiesItem.scrollbubbling = false;
		SBGridPropertiesItem.columns = [
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addItem(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["부류"],     	ref: 'clsNm',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'itemNm',  type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    grdItem = _SBGrid.create(SBGridPropertiesItem);

	    // APC 품목
	    let SBGridPropertiesApcItem = {};
	    SBGridPropertiesApcItem.parentid = 'sb-area-grdApcItem';
	    SBGridPropertiesApcItem.id = 'grdApcItem';
	    SBGridPropertiesApcItem.jsonref = 'jsonApcItem';
	    SBGridPropertiesApcItem.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesApcItem.selectmode = 'free';
	    SBGridPropertiesApcItem.allowcopy = true;
	    SBGridPropertiesApcItem.explorerbar = 'move';					// 개인화 컬럼 이동 가능
	    SBGridPropertiesApcItem.contextmenu = true;					// 우클린 메뉴 호출 여부
	    SBGridPropertiesApcItem.contextmenulist = objMenuListApcItem;	// 우클릭 메뉴 리스트
	    SBGridPropertiesApcItem.extendlastcol = 'scroll';
	    SBGridPropertiesApcItem.oneclickedit = true;
	    SBGridPropertiesApcItem.scrollbubbling = false;
		SBGridPropertiesApcItem.clickeventarea = {empty: false, fixed: true};
	    SBGridPropertiesApcItem.columns = [
	        {caption: ["삭제"], 	ref: 'empty',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteItem(" + nRow + ")'>삭제</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["코드"],     	ref: 'itemCd',  	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["명칭"],     	ref: 'itemNm',  	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품종"],     ref: 'vrtrCnt',  	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["규격"],     ref: 'spcfctCnt',  	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["등급"],     ref: 'grdCnt',  	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["외부연결코드"],     ref: 'extrnlLnkgCd',fixed:false,	type:'input',  width:'80px',    style:'text-align:center'},

	    ];
	    grdApcItem = _SBGrid.create(SBGridPropertiesApcItem);
	    grdApcItem.bind('click', fn_searchVrtyAll);

	    // 마스터 품종(품목별)
	    let SBGridPropertiesVrty = {};
	    SBGridPropertiesVrty.parentid = 'sb-area-grdVrty';
	    SBGridPropertiesVrty.id = 'grdVrty';
	    SBGridPropertiesVrty.jsonref = 'jsonVrty';
	    SBGridPropertiesVrty.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesVrty.selectmode = 'free';
	    SBGridPropertiesVrty.allowcopy = true;
	    SBGridPropertiesVrty.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridPropertiesVrty.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridPropertiesVrty.contextmenulist = objMenuListVrty;	// 우클릭 메뉴 리스트
	    SBGridPropertiesVrty.extendlastcol = 'scroll';
	    SBGridPropertiesVrty.oneclickedit = true;
	    SBGridPropertiesVrty.scrollbubbling = false;
	    SBGridPropertiesVrty.columns = [
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addVrty(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["코드"],     ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'vrtyNm',  type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdVrty = _SBGrid.create(SBGridPropertiesVrty);

	    // APC 품종
	    let SBGridPropertiesApcVrty = {};
	    SBGridPropertiesApcVrty.parentid = 'sb-area-grdApcVrty';
	    SBGridPropertiesApcVrty.id = 'grdApcVrty';
	    SBGridPropertiesApcVrty.jsonref = 'jsonApcVrty';
	    SBGridPropertiesApcVrty.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesApcVrty.selectmode = 'free';
	    SBGridPropertiesApcVrty.allowcopy = true;
	    SBGridPropertiesApcVrty.explorerbar = 'move';					// 개인화 컬럼 이동 가능
	    SBGridPropertiesApcVrty.contextmenu = true;					// 우클린 메뉴 호출 여부
	    SBGridPropertiesApcVrty.contextmenulist = objMenuListApcVrty;	// 우클릭 메뉴 리스트
	    SBGridPropertiesApcVrty.extendlastcol = 'scroll';
	    SBGridPropertiesApcVrty.oneclickedit = true;
	    SBGridPropertiesApcVrty.scrollbubbling = false;
	    SBGridPropertiesApcVrty.columns = [
	        {caption: ["선택"], 	ref: 'delYn',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if(strValue== null || strValue == ""){
		        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdApcVrty\", " + nRow + ", " + nCol + ")'>추가</button>";
		        	}else{
		                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteVrty(" + nRow + ")'>삭제</button>";
		        	}
	        }},
	        {caption: ["코드"],     ref: 'vrtyCd',  type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'vrtyNm',  type:'input',  	width:'80px',    style:'text-align:center',
	        	typeinfo : {maxlength : 30}},
	        {
	        	caption: ["입고단중 (Kg)"],
	        	ref: 'unitWght',
	        	type:'input',
	        	width:'80px',
	        	style: 'text-align:right;',
    			typeinfo : {
    				mask : {alias : 'numeric'},
    				maxlength : 10},
    				format : {type:'number', rule:'#,###.##'}
    		},
	        {caption: ["처리기준"],     ref: 'wghtRkngSeCd',  type:'combo',  width:'80px',    style:'text-align:center;',
					typeinfo : {ref:'jsonVrtyWghtRkngSeCd', displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["순번"],     ref: 'sn',  type:'input',  	width:'80px',    style:'text-align:center',
						typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
			{caption: ["외부연결코드"],     ref: 'extrnlLnkgCd',  type:'input',  width:'80px',    style:'text-align:center'},
			
			{
				caption: ["선별입력유형"],     
				ref: 'sortInptVlType',  
				type:'combo',  
				width:'80px',    
				style:'text-align:center;',
				typeinfo : {
					ref:'jsonSortInptVlType', 
					displayui : false,	
					itemcount: 10, 
					label:'label', 
					value:'value', 
					unselect:{label:'',value:''}
				}
			},
			{
				caption: ["상품표시유형"],     
				ref: 'indctArtclType',  
				type:'combo',  
				width:'80px',    
				style:'text-align:center;',
				typeinfo : {
					ref:'jsonIndctArtclType', 
					displayui : false,	
					itemcount: 10, 
					label:'label', 
					value:'value', 
					unselect:{label:'',value:''}
				}
			},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdApcVrty = _SBGrid.create(SBGridPropertiesApcVrty);

	    fn_initSBSelectItemVrty();
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListItem = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldItem,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldItem() {
    	grdItem.exportLocalExcel("농수축산물표준 품목 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListApcItem = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldApcItem,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldApcItem() {
    	grdApcItem.exportLocalExcel("APC관리 품목 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListVrty = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldVrty,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldVrty() {
    	grdVrty.exportLocalExcel("농수축산물표준 품종 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListApcVrty = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldApcVrty,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldApcVrty() {
    	grdApcVrty.exportLocalExcel("APC관리 품종 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }


	const fn_searchItemList = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
		let itemNm = SBUxMethod.get("item-inp-itemNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsItemList.do", {apcCd : apcCd, itemNm : itemNm});
        let data = await postJsonPromise;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	jsonItem.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					let itemVO = {

  					    itemCd 		: item.itemCd
  					  , itemNm 		: item.itemNm
  					  , apcCd		: apcCd
  					  , clsNm		: item.clsNm
  					}
  					jsonItem.push(itemVO);
  				});
  	        	grdItem.rebuild();

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

	const fn_searchApcItemList = async function(){

		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcCmnsItemList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	jsonApcItem.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					let itemVO = {
  						itemCd 		: item.itemCd
  					  , itemNm 		: item.itemNm
  					  , apcCd		: apcCd
  					  , vrtrCnt 	: item.vrtrCnt
  					  , spcfctCnt	: item.spcfctCnt
  					  , grdCnt		: item.grdCnt
					  , extrnlLnkgCd: item.extrnlLnkgCd
  					}
  					jsonApcItem.push(itemVO);
  				});
  	        	grdApcItem.rebuild();

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

	const fn_searchAll = async function(){
		let rst = await Promise.all([
			fn_searchItemList(),
			fn_searchApcItemList()
		]);
	}

	const fn_searchVrtyAll = async function(){
		let nCol = grdApcItem.getCol();
		if(nCol != 7){
			let rst = await Promise.all([
				fn_searchVrtyList(),
				fn_searchApcVrtyList()
			]);
		}
	}

	const fn_searchVrtyList = async function(){

		let nRow = grdApcItem.getRow();
        if (nRow < 1 && (SBUxMethod.get("vrty-inp-itemCd") == null || SBUxMethod.get("vrty-inp-itemCd") == "")) {
            return;
        }
        let rowData = grdApcItem.getRowData(nRow);
		let itemCd = "";
		if(rowData == null || rowData == ""){
			itemCd = SBUxMethod.get("vrty-inp-itemCd");
		}else{
			itemCd = rowData.itemCd;
			SBUxMethod.set("vrty-inp-itemNm", rowData.itemNm);
			SBUxMethod.set("vrty-inp-itemCd", rowData.itemCd);
		}
		let apcCd = gv_apcCd;
		let vrtyNm = SBUxMethod.get("vrty-inp-vrtyNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsVrtyList.do", {apcCd : apcCd, itemCd : itemCd, vrtyNm : vrtyNm});
        let data = await postJsonPromise;
        let newJsonVrty = [];
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let vrtyVO = {
  						vrtyCd 		: item.vrtyCd
  					  , vrtyNm 		: item.vrtyNm
  					  , apcCd		: apcCd
  					  , itemCd		: item.itemCd
  					}
  					newJsonVrty.push(vrtyVO);
  				});
  	        	jsonVrty = newJsonVrty;
  	        	grdVrty.rebuild();

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_searchApcVrtyList = async function(){

		let itemCol = grdApcItem.getCol();
		let emptyCol = grdApcItem.getColRef("empty")
		if(itemCol == emptyCol){
			return;
		}

		let nRow = grdApcItem.getRow();
        if (nRow < 1 && (SBUxMethod.get("vrty-inp-itemCd") == null || SBUxMethod.get("vrty-inp-itemCd") == "")) {
            return;
        }
        let rowData = grdApcItem.getRowData(nRow);
		let itemCd = "";
		if(rowData == null || rowData == ""){
			itemCd = SBUxMethod.get("vrty-inp-itemCd");
		}else{
			itemCd = rowData.itemCd
		}
		let apcCd = gv_apcCd;

    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcVrtyList.do", {apcCd : apcCd, itemCd : itemCd});
        let data = await postJsonPromise;
        let newJsonApcVrty = [];
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let vrtyVO = {
  						vrtyCd 			: item.vrtyCd
  					  , vrtyNm 			: item.vrtyNm
  					  , apcCd			: apcCd
  					  , delYn 			: item.delYn
  					  , itemCd			: item.itemCd
  					  , unitWght		: item.unitWght
  					  , wghtRkngSeCd 	: item.wghtRkngSeCd
  					  , sn				: item.sn
					  , extrnlLnkgCd	: item.extrnlLnkgCd
					  , sortInptVlType  : item.sortInptVlType
					  , indctArtclType  : item.indctArtclType
  					}
  					newJsonApcVrty.push(vrtyVO);
  				});
  	        	jsonApcVrty = newJsonApcVrty;
  	        	grdApcVrty.rebuild();
  	        	grdApcVrty.setCellDisabled(0, 1, grdApcVrty.getRows() - 1, 1, true);
  	        	grdApcVrty.addRow(true);
  	        	grdApcVrty.setCellDisabled(grdApcVrty.getRows() -1, 0, grdApcVrty.getRows() -1, grdApcVrty.getCols() -1, true);

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

	const fn_addItem = async function (nRow){
		let itemVO = grdItem.getRowData(nRow);
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcCmnsItem.do", itemVO);
        let data = await postJsonPromise;
        try{
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_searchAll();
        	}else{
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_deleteItem = async function(nRow){
		let itemVO = grdApcItem.getRowData(nRow);
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcCmnsItem.do", itemVO);
        let data = await postJsonPromise;

        try{
        	if (_.isEqual("S", data.resultStatus)) {
        		jsonApcVrty = [];
        		jsonVrty = [];
        		grdApcVrty.refresh();
        		grdVrty.refresh();
        		fn_searchAll();
        		return;
        	}else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        		return;
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_addVrty = async function(nRow){
		let vrtyVO = grdVrty.getRowData(nRow);
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcVrty.do", vrtyVO);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_searchAll();
        		fn_searchVrtyAll();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_deleteVrty = async function(nRow){
		if(grdApcVrty.getRowStatus(nRow) == 0 || grdApcVrty.getRowStatus(nRow) == 2){

			let vrtyVO = grdApcVrty.getRowData(nRow);

			let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcVrty.do", vrtyVO);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		fn_searchAll();
	        		fn_searchVrtyAll();
	        		return;
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        		return;
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
   			grdApcVrty.deleteRow(nRow);
    	}else{
    		grdApcVrty.deleteRow(nRow);
    	}
	}

	const fn_saveApcVrtyList = async function(){
		let itemSaveFlag = false;
		let itemSaveCount = 0;

		const fn_saveApcItemList = async function(){
			// apc품목
			let gridData = grdApcItem.getGridDataAll();
			let saveList = [];
			for ( var i=1; i<=gridData.length; i++ ){
				let rowData = grdApcItem.getRowData(i);
				let rowSts = grdApcItem.getRowStatus(i);
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
			if (saveList.length == 0){
				itemSaveFlag = true;
				return;
			}
			itemSaveCount = saveList.length;
			for(let saveItemVo of saveList){
				let postJsonPromise = gfn_postJSON("/am/cmns/updateApcCmnsItem.do", saveItemVo);
				let data = await postJsonPromise;
				try {
					if (_.isEqual("S", data.resultStatus)) {}
				} catch(e) {
					console.error("failed", e.message);
				}
			}
		}
		await fn_saveApcItemList();

		// apc품종
		let gridData = grdApcVrty.getGridDataAll();
		let saveList = [];
		for ( var i=1; i<=gridData.length; i++ ){
			let rowData = grdApcVrty.getRowData(i);
			let rowSts = grdApcVrty.getRowStatus(i);
			let delYn = rowData.delYn;
			let unitWght = rowData.unitWght;
			let wghtRkngSeCd = rowData.wghtRkngSeCd;
			let vrtyNm = rowData.vrtyNm;
			if (delYn == 'N'){
				if (gfn_isEmpty(vrtyNm)) {
		  			gfn_comAlert("W0002", "품종명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (saveList.length == 0 && itemSaveFlag){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (gfn_comConfirm("Q0001", "품목"+itemSaveCount+"건 품종"+saveList.length+"건 저장")){

			let postJsonPromise = gfn_postJSON("/am/cmns/multiApcVrtyList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		await fn_searchAll();
	        		fn_searchVrtyAll();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch(e) {
	        	console.error("failed", e.message);
	        }
		}
	}


</script>
</html>