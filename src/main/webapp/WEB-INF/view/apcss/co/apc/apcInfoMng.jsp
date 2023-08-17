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
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_c">APC코드</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcCd" name="srch-inp-apcCd" class="form-control input-sm" onkeyenter="fn_search"/>
							</td>
							<th class="ta_c">원본 APC명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-regApcNm" name="srch-inp-regApcNm" uitype="text" class="form-control input-sm" onkeyenter="fn_search"></sbux-input>
							</td>
							<th class="ta_c">사용유무</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-delYn" name="srch-slt-delYn" uitype="single" jsondata-ref="jsonComboDelYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
											
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>APC 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class='btn btn-xs btn-outline-danger' onClick="fn_procRowApcInfo('ADD')"></sbux-button>
						<sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class='btn btn-xs btn-outline-danger' onClick="fn_procRowApcInfo('DEL')"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdApcInfoMng" style="width:100%;height:600px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComboDelYn = [];
	var comboDelYnJsData = [];
	var comboMbCdJsData = [];
	
	var apcInfoMngData = [];

	const fn_initSBSelect = async function() {
		gfn_setComCdSBSelect('srch-slt-delYn', jsonComboDelYn, 'REVERSE_YN', '0000');
		gfn_setComCdGridSelect('grdApcInfoMng', comboDelYnJsData, "REVERSE_YN", "0000");
		gfn_setComCdGridSelect('grdApcInfoMng', comboMbCdJsData, "MB_CD", "0000");
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createApcInfoMngGrid();
        fn_search();
		fn_initSBSelect();
	})
	
	function fn_createApcInfoMngGrid() {
		apcInfoMngData = [];
		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcInfoMng';
	    SBGridProperties.id = 'grdApcInfoMng';
	    SBGridProperties.jsonref = 'apcInfoMngData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.scrollbubbling = false;
    	SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
        	{caption: ['선택'],		ref: 'checked',  	width: '50px',		type: 'checkbox'},
            {caption: ['APC코드'],	ref: 'apcCd',		width: '70px', 		type: 'output',		style:'text-align: center'},
            {caption: ['원본APC명'], 	ref: 'regApcNm', 	width: '200px',		type: 'input',		style:'text-align: center'},
            {caption: ['시도명'], 	ref: 'ctpvNm',	 	width: '70px', 		type: 'input',		style:'text-align: center'},
            {caption: ['시군명'], 	ref: 'sigunNm',	 	width: '70px', 		type: 'input',		style:'text-align: center'},
			{caption: ['주체명'], 	ref: 'mbCd', 	 	width: '70px', 		type: 'combo',		style:'text-align: center',
        		typeinfo : {ref:'comboMbCdJsData', label:'label', value:'value'}},
            {caption: ['원본주소'], 	ref: 'regAddr',  	width: '400px',		type: 'input'},
            {caption: ['원본전화번호'],	ref: 'regTelno', 	width: '100px', 	type: 'input',		style:'text-align: center'},
            {caption: ['APC명'], 	ref: 'apcNm', 	 	width: '200px', 	type: 'input',		style:'text-align: center'},
            {caption: ['사업자번호'],	ref: 'brno', 	 	width: '100px', 	type: 'input',		style:'text-align: center'},
            {caption: ['주소'],	 	ref: 'addr', 	 	width: '400px', 	type: 'input',},
            {caption: ['팩스번호'],	ref: 'fxno', 	 	width: '100px', 	type: 'input',		style:'text-align: center'},
            {caption: ['전화번호'], 	ref: 'telno',	 	width: '100px', 	type: 'input',		style:'text-align: center'},
            {caption: ['사용유무'], 	ref: 'delYn', 	 	width: '70px', 		type: 'combo',		style:'text-align: center',
            	typeinfo : {ref:'comboDelYnJsData', label:'label', value:'value', oneclickedit: true}}
        ];
        grdApcInfoMng = _SBGrid.create(SBGridProperties);
        grdApcInfoMng.bind( "afterpagechanged" , "fn_pagingApcInfoMng" );
    }
	
	// 행 삭제 및 추가
	async function fn_procRowApcInfo(type){
		if (type == "ADD"){
			grdApcInfoMng.addRow(true, {'delYn':'N'});
			grdApcInfoMng.setCellData(grdApcInfoMng.getGridDataAll().length, 0, true);
			fn_initSBSelect();
		}
		else{
			for(var i=0; i<grdApcInfoMng.getGridDataAll().length; i++){
				if(grdApcInfoMng.getGridDataAll()[i].checked == "true"){
					if (grdApcInfoMng.getGridDataAll()[i].apcCd == "" || grdApcInfoMng.getGridDataAll()[i].apcCd == null){
						grdApcInfoMng.deleteRow(i+1);
						i--;
					}
				}
			}
		}
	}
	
// 	콤보박스 (검색 조건)
// 	async function setRegApcNmSBSelect(_targetIds, _jsondataRef) {
// 		let apcCd = SBUxMethod.get("srch-inp-apcCd");
// 		let regApcNm = SBUxMethod.get("srch-slt-regApcNm");
// 		let postJsonPromise = gfn_postJSON("/am/apc/selectApcDsctn.do", {apcCd: apcCd, regApcNm: regApcNm, delYn: "N"});
// 		let data = await postJsonPromise;
// 		let resultVO = data.resultVO;

// 		let sourceJson = [];
// 		let item = {
// 				cmnsCd: resultVO.apcCd,
// 				cmnsNm: resultVO.regApcNm
// 			}
// 		sourceJson.push(item);

// 		gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
// 	}

	// APC 내역 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdApcInfoMng.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdApcInfoMng.movePaging(currentPageNo);
    }
	
	let newApcInfoMngData = [];
	
	// APC 내역 목록 조회 호출
	async function fn_callSelectApcDsctnList(recordCountPerPage, currentPageNo){
		apcInfoMngData = [];
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let regApcNm = SBUxMethod.get("srch-inp-regApcNm");
		let delYn = SBUxMethod.get("srch-slt-delYn");
		let ApcEvrmntStngVO = {apcCd : apcCd, regApcNm : regApcNm, delYn : delYn, pagingYn : 'Y', currentPageNo : currentPageNo, recordCountPerPage : recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/apc/selectApcDsctnList.do", ApcEvrmntStngVO);
        let data = await postJsonPromise;
        newApcInfoMngData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let apcDsctn = {
					apcCd 		: item.apcCd
				  , regApcNm 	: item.regApcNm
				  , ctpvNm 		: item.ctpvNm
				  , sigunNm 	: item.sigunNm
				  , mbCd 		: item.mbCd
				  , regAddr 	: item.regAddr
				  , regTelno	: item.regTelno
				  , apcNm 		: item.apcNm
				  , brno 		: item.brno
				  , addr 		: item.addr
				  , fxno 		: item.fxno
				  , telno 		: item.telno
				  , delYn		: item.delYn
				}
				apcInfoMngData.push(Object.assign({}, apcDsctn));
				newApcInfoMngData.push(Object.assign({}, apcDsctn));
			});
        	if(apcInfoMngData.length > 0){
				if(grdApcInfoMng.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdApcInfoMng.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdApcInfoMng.rebuild();
				}else{
					grdApcInfoMng.refresh();
				}
			}else{
				grdApcInfoMng.setPageTotalCount(0);
				grdApcInfoMng.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingApcInfoMng(){
    	let recordCountPerPage = grdApcInfoMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdApcInfoMng.getSelectPageIndex(); 
    	fn_callSelectApcDsctnList(recordCountPerPage, currentPageNo);
    }
	
	// APC 내역 등록 (등록 버튼)
	async function fn_save() {
		const apcCd = SBUxMethod.get("srch-inp-apcCd");
		let allData = grdApcInfoMng.getGridDataAll();
		
		const apcDsctnList = [];
		
		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdApcInfoMng.getRowData(i);
			const rowSts = grdApcInfoMng.getRowStatus(i);
			console.log(grdApcInfoMng.getRowData(i).checked, rowData.checked);
			if (rowData.checked == "true"){
				if (gfn_isEmpty(rowData.regApcNm)){
					gfn_comAlert("W0002", "원본APC명");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
	
				if (rowSts === 3){
					rowData.rowSts = "I";
					apcDsctnList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					apcDsctnList.push(rowData);
				} else {
					continue;
				}
			}
		}
		
		if (apcDsctnList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		
		if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	console.log(apcDsctnList);
    	
    	const postJsonPromise = gfn_postJSON("/am/apc/multiApcDsctnList.do", apcDsctnList, this.prgrmId);	// 프로그램id 추가
    	
		const data = await postJsonPromise;	    
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectApcDsctnList();
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {        	
        }
	}
</script>
</html>