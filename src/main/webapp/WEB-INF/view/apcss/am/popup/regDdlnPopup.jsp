<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSaveVhcl" name="btnSaveVhcl" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveDdln"></sbux-button>
					<sbux-button id="btnEndVhcl" name="btnEndVhcl" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-ddln')"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="ddln-inp-apcCd" name="ddln-inp-apcCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="ddln-inp-apcNm" name="ddln-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</th>
							<th scope="row">기준년도</th>
							<th class="td_input">
								<sbux-datepicker id="ddln-dtp-crtrYr" name="ddln-dtp-crtrYr" uitype="popup" datepicker-mode="year" class="form-control input-sm" onchange="fn_searchDdln"></sbux-datepicker>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdDdln" style="width:100%;height:340px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonDdln = [];

    var comboDdlnYnJsData = [{label: "예", value: "Y"}, {label: "아니오", value: "N"}];

	const fn_initSBSelectDdln = async function() {
		
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		let today = new Date();
		let year = today.getFullYear();
		SBUxMethod.set("ddln-dtp-crtrYr", year);
		fn_initSBSelectDdln();
	})

	var jsonDdln = [];
	function fn_createDdlnGrid() {
		jsonDdln = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdDdln';
	    SBGridProperties.id = 'grdDdln';
	    SBGridProperties.jsonref = 'jsonDdln';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	        {caption: ['기준월'], 	ref: 'crtrMm', 			width: '200px',		style: 'text-align:center',		type: 'output'},
		    {caption: ['마감여부'], 	ref: 'ddlnYn', 			width: '150px',		style: 'text-align:center',		type: 'combo',
        		typeinfo : {ref:'comboDdlnYnJsData', label:'label', value:'value'}},
	        {caption: ['등록일시'], 	ref: 'sysLastChgDt', 	width: '100px',		style: 'text-align:center',		type: 'output'},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
	        {caption: ['기준연도'], ref: 'crtrYr', hidden : true}
	    ];
	    grdDdln = _SBGrid.create(SBGridProperties);
	}
	
	// 마감 목록 조회 호출 (조회 버튼)
	function defaulDdlnList(apcCd, crtrYr, index){
		DdlnList = {
				crtrMm 			: ("0" + (index+1)).slice(-2)
			  , ddlnYn 			: "N"
			  , sysLastChgDt 	: ""
			  , apcCd			: apcCd
			  , crtrYr			: crtrYr
			}
		return DdlnList;
	}
	
	let newJsonDdln = [];
	async function fn_searchDdln(){
		jsonDdln = [];
		let apcCd = SBUxMethod.get("ddln-inp-apcCd");
		let crtrYr = SBUxMethod.get("ddln-dtp-crtrYr");
		let DdlnVO = {apcCd : apcCd, crtrYr : crtrYr};
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectDdln.do", DdlnVO);
        let data = await postJsonPromise;
        resultList = data.resultList;
        newJsonDdln = [];
        let rowSeq = 0;
        try{
        	for (var i=0; i<12; i++){
	        	let DdlnList;
	        	if (resultList.length == 0){
            		DdlnList = defaulDdlnList(apcCd, crtrYr, i);
        		} else {
	        		if (rowSeq < resultList.length){
		        		if (resultList[rowSeq].crtrMm == i+1){
		        			DdlnList = {
		   						crtrMm 			: resultList[rowSeq].crtrMm
		   					  , ddlnYn 			: resultList[rowSeq].ddlnYn
		   					  , sysLastChgDt 	: resultList[rowSeq].sysLastChgDt
		   					  , apcCd			: resultList[rowSeq].apcCd
		   					  , crtrYr			: resultList[rowSeq].crtrYr
		   					}
		        			rowSeq++;
		    			} else {
		    				DdlnList = defaulDdlnList(apcCd, crtrYr, i);
		    			}
	        		} else {
	        			DdlnList = defaulDdlnList(apcCd, crtrYr, i);
	        		}
        		}
    			jsonDdln.push(Object.assign({}, DdlnList));
    			newJsonDdln.push(Object.assign({}, DdlnList));
      		}
       		grdDdln.rebuild();
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}
	
	// 마감 등록 (등록 버튼)
	async function fn_saveDdln(){
		let apcCd = SBUxMethod.get("ddln-inp-apcCd");
		let allData = grdDdln.getGridDataAll();

		const ddlnList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdDdln.getRowData(i);
			const rowSts = grdDdln.getRowStatus(i);
			if (rowSts === 2 && (rowData.sysLastChgDt == null || rowData.sysLastChgDt == '')){
				rowData.rowSts = "I";
				ddlnList.push(rowData);
			} else if (rowSts === 2 && rowData.sysLastChgDt != null){
				rowData.rowSts = "U";
				ddlnList.push(rowData);
			} else {
				continue;
			}
		}

		if (ddlnList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	console.log(ddlnList);

    	const postJsonPromise = gfn_postJSON("/am/cmns/multiDdlnList.do", ddlnList, this.prgrmId);	// 프로그램id 추가

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_searchDdln();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	// 모달 호출
	async function fn_modalDdln(_apcCd, _apcNm){
		SBUxMethod.set("ddln-inp-apcCd", _apcCd);
		SBUxMethod.set("ddln-inp-apcNm", _apcNm);
		
		fn_createDdlnGrid();
		fn_searchDdln();
	}
</script>
</html>