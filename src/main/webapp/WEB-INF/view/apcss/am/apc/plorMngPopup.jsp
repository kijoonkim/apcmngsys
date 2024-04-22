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
						<span style="font-weight:bold;">APC에서 관리하고 있는 원산지를 선택하세요.(여러가지 원산지를 관리할 수 있습니다.)</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">원산지는 농수축산물 표준코드를 준수하며 APC별 사용자 정의로 등록할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnSearchPlor"
						name="btnSearchPlor"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_searchPlorStd"
					></sbux-button>
					<sbux-button
						id="btnSavePlor"
						name="btnSavePlor"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_saveApcPlorList"
					></sbux-button>
					<sbux-button
						id="btnEndPlor"
						name="btnEndPlor"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger"
						onclick="gfn_closeModal('modal-plor')"
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
									<sbux-input id=plor-inp-apcNm name="plor-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">원산지명</th>
								<th  style="border-right-style: hidden;">
									<sbux-input id=plor-inp-plorNm name="plor-inp-plorNm" uitype="text" class="form-control input-sm" onkeyenter="fn_searchPlor"></sbux-input>
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
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC 표준 원산지</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdStdPlor" style="height:450px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC 상세 원산지</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdChoisPlor" style="height:450px; width: 100%;"></div>
						</div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
	</section>
</body>
<script type="text/javascript">

	const fn_selectAllPlor = async function(){
// 		await fn_searchStdPlorList();				// 표준 그리드 검색
// 		await fn_pagingStdGrd();
		await fn_searchPlorStd();
	}

	var jsonApcStdPlor = [];
	var jsonChoisPlor = [];

	const fn_plorStdMngCreateGrid = async function() {
		SBUxMethod.set('plor-inp-apcNm', gv_apcNm);
		
		var SBGridPlorStdProperties = {};
		SBGridPlorStdProperties.parentid = 'sb-area-grdStdPlor';
		SBGridPlorStdProperties.id = 'grdStdPlor';
	    SBGridPlorStdProperties.jsonref = 'jsonApcStdPlor';
	    SBGridPlorStdProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridPlorStdProperties.selectmode = 'free';
	    SBGridPlorStdProperties.allowcopy = true;
	    SBGridPlorStdProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridPlorStdProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridPlorStdProperties.contextmenulist = objMenuListApcPlor;		// 우클릭 메뉴 리스트
	    SBGridPlorStdProperties.extendlastcol = 'scroll';
	    SBGridPlorStdProperties.oneclickedit = true;
	    SBGridPlorStdProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 50,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
			};
	    SBGridPlorStdProperties.columns = [
	    	{caption: ["선택"], 	ref: 'empty',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addPlorStd(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["원산지명"], 	ref: 'cdVlNm',   	type:'input',  width:'200px',    style:'text-align:center'},
	        {caption: ["원산지코드"], 	ref: 'cdVl',   		type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',   		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["선택APC코드"], 	ref: 'choisApcCd',  type:'input',  hidden : true},
	        {caption: ["APC코드"], 	ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    grdStdPlor = _SBGrid.create(SBGridPlorStdProperties);
	    grdStdPlor.bind( "beforepagechanged" , "fn_pagingStdGrd" );
	    
	    let SBGridPropertiesChoisPlor = {};
	    SBGridPropertiesChoisPlor.parentid = 'sb-area-grdChoisPlor';
	    SBGridPropertiesChoisPlor.id = 'grdChoisPlor';
	    SBGridPropertiesChoisPlor.jsonref = 'jsonChoisPlor';
	    SBGridPropertiesChoisPlor.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesChoisPlor.selectmode = 'free';
	    SBGridPropertiesChoisPlor.allowcopy = true;
	    SBGridPropertiesChoisPlor.explorerbar = 'move';					// 개인화 컬럼 이동 가능
	    SBGridPropertiesChoisPlor.contextmenu = true;					// 우클린 메뉴 호출 여부
	    SBGridPropertiesChoisPlor.contextmenulist = objMenuListApcItem;	// 우클릭 메뉴 리스트
	    SBGridPropertiesChoisPlor.extendlastcol = 'scroll';
	    SBGridPropertiesChoisPlor.oneclickedit = true;
	    SBGridPropertiesChoisPlor.scrollbubbling = false;
	    SBGridPropertiesChoisPlor.clickeventarea = {empty: false, fixed: true};
	    SBGridPropertiesChoisPlor.columns = [
	        {caption: ["삭제"], 	ref: 'empty',   type:'output',  width:'60px',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteItem(" + nRow + ")'>삭제</button>";
	        }},
	        {caption: ["원산지명"], 	ref: 'cdVlNm',   	type:'input',  width:'200px',    style:'text-align:center'},
	        {caption: ["원산지코드"], 	ref: 'cdVl',   		type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',   		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["선택APC코드"], 	ref: 'choisApcCd',   	type:'input',  hidden : true},
	        {caption: ["APC코드"], 	ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    grdChoisPlor = _SBGrid.create(SBGridPropertiesChoisPlor);
	}
	const fn_pagingStdGrd = async function(){
    	let pageSize = grdStdPlor.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdStdPlor.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchStdPlorList(pageSize, pageNo);
    }
	
    const fn_searchPlorStd = async function() {
    	grdStdPlor.rebuild();
    	let pageSize = grdStdPlor.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonApcStdPlor.length = 0;
    	grdStdPlor.clearStatus();

    	grdStdPlor.movePaging(pageNo);
    }
	
	const fn_searchStdPlorList = async function(pageSize, pageNo){
		let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls",
			{
			  apcCd : '0000'
			, cdId : 'STD_PLOR_CD'
			// pagination
  	  		, pagingYn : 'Y'
  			, currentPageNo : pageNo
   		  	, recordCountPerPage : pageSize
			});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				let totalRecordCount = 0;
  				jsonApcStdPlor.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let plorStdVO = {
  						apcCd		: item.apcCd
  					  , cdVlNm 		: item.cdVlNm
  					  , cdVl 		: item.cdVl
  					  , rmrk		: item.rmrk
  					  , delYn		: item.delYn
  					  , extrnlLnkgCd : item.extrnlLnkgCd
  					}
  					jsonApcStdPlor.push(plorStdVO);
  					if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  				});
  		    	if (jsonApcStdPlor.length > 0) {
  	          		if(grdStdPlor.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	  	          		grdStdPlor.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	  	          		grdStdPlor.rebuild();
  	  				}else{
  	  					grdStdPlor.refresh();
  	  				}

  	          	} else {
  	          		grdStdPlor.setPageTotalCount(totalRecordCount);
  	         	 	grdStdPlor.rebuild();
  	          	}
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
	
	
	

	
	/**
	 *
	 * 그리드 추가 삭제 버튼
	 *
	**/
   const fn_procPlorRow = async function (gubun, grid, nRow, nCol) {
        if (gubun === "ADD") {
            if (grid === "grdStdPlor") {

            	let apcCdCol = grdStdPlor.getColRef("apcCd");
            	grdStdPlor.setCellData(nRow, nCol, "N", true);
            	grdStdPlor.setCellData(nRow, apcCdCol, gv_apcCd, true);
            	grdStdPlor.addRow(true);

            	grdStdPlor.setCellDisabled(0, 0, grdStdPlor.getRows() -1, grdStdPlor.getCols() -1, false);
            	grdStdPlor.setCellDisabled(grdStdPlor.getRows() -1, 0, grdStdPlor.getRows() -1, grdStdPlor.getCols() -1, true);

            }
        } else if (gubun === "DEL") {
            if (grid === "grdStdPlor") {
            	if(grdStdPlor.getRowStatus(nRow) == 0 || grdStdPlor.getRowStatus(nRow) == 2){
            		if(gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
            			var plor = grdStdPlor.getRowData(nRow);
            			await fn_deletePlor(plor, nRow);
            		}
            	}else{
            		await grdStdPlor.deleteRow(nRow);
            	}
            }
        }
	}
	
	const fn_addPlorStd = async function (nRow){
		let stdPlorVO = grdStdPlor.getRowData(nRow);
		stdPlorVO.choisApcCd = gv_apcCd;
		console.log('stdPlorVO', stdPlorVO);
		let postJsonPromise = gfn_postJSON("", stdPlorVO);
        let data = await postJsonPromise;
        try{
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_selectAllPlor();
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
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListApcPlor = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldApcPlor,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldApcPlor() {
    	grdStdPlor.exportLocalExcel("원산지 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
</script>
</html>