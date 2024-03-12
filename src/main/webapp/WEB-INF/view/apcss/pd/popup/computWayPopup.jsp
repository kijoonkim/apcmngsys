<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">산출식 관리</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchComputWay" name="btnSearchComputWay" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popComputWay.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnSaveComputWay" name="btnSaveComputWay" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popComputWay.save"></sbux-button>
					<sbux-button id="btnEndComputWay" name="btnEndComputWay" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popComputWay.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 40%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">등록년도</th>
							<th>
								<sbux-spinner
									id="pop-srch-input-yr"
									name="pop-srch-input-yr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
							</th>
							<!--
							<th scope="row">항목</th>
							<th>
								<sbux-select
									id="pop-srch-input-fundArtcl"
									name="pop-srch-input-fundArtcl"
									uitype="single"
									jsondata-ref="jsonPopFundArtcl"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</th>
							 -->
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="" style="display:flex; justify-content: flex-start;" >
						<div class="ad_tbl_top" style="width: 50%">
							<ul class="ad_tbl_count">
								<li>
									<span style="color: black;">산출식 목록</span>
									<span style="font-size:12px">(조회건수 <span id="computWay-pop-cnt">0</span>건)</span>
								</li>
							</ul>
						 	<div class="ad_tbl_toplist">
							</div>
						</div>
						<div style="margin-left: auto;">
							<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="popComputWay.fn_addRow()"></sbux-button>
						</div>
					</div>

					<div id="sb-area-grdComputWayPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonPopGrdFundArtcl= [];	// 자금항목 fundArtcl	Grid
	//var jsonPopFundArtcl= [];	// 자금항목 fundArtcl	srch

	var grdComputWayPop = null;
	var jsonComputWayPop = [];

	const popComputWay = {
		prgrmId: 'computWayPopup',
		modalId: 'modal-computWay',
		gridId: 'grdComputWayPop',
		jsonId: 'jsonComputWayPop',
		areaId: "sb-area-grdComputWayPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {
			console.log('popComputWay.init');

			//SBUxMethod.attr('btnAddRow', 'disabled', true);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			//기본 년도 세팅
			let now = new Date();
			let year = now.getFullYear();
			SBUxMethod.set("pop-srch-input-yr",year);

			//콤보 데이터
			let rst = await Promise.all([
				gfn_setComCdSBSelect('grdComputWayPop',jsonPopGrdFundArtcl,'FUND_ARTCL'), //산출식 항목
			]);

			this.createGrid();
			//this.search();

		},
		close: function() {
			gfn_closeModal(this.modalId, this.callbackFnc);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
			SBGridProperties.parentid = this.areaId;
			SBGridProperties.id = this.gridId;
			SBGridProperties.jsonref = this.jsonId;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			//SBGridProperties.explorerbar = 'sortmove';
			//SBGridProperties.extendlastcol = 'scroll';
			SBGridProperties.oneclickedit = true;
			SBGridProperties.allowcopy = true;
			SBGridProperties.explorerbar = 'sortmove';
			SBGridProperties.scrollbubbling = false;
			SBGridProperties.rowheader = ['seq','update'];
			SBGridProperties.paging = {
				'type' : 'page',
				'count' : 5,
				'size' : 20,
				'sorttype' : 'page',
				'showgoalpageui' : true
			};
			SBGridProperties.columns = [
				{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'50px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
					if(strValue== null || strValue == ""){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popComputWay.fn_procRow(\"ADD\", \"grdComputWayPop\", " + nRow + ", " + nCol + ")'>추가</button>";
					}else{
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popComputWay.fn_procRow(\"DEL\", \"grdComputWayPop\", " + nRow + ")'>삭제</button>";
					}
					return "";
				}},
				{caption: ["사용여부"],		ref: 'useYn',		width:'60px',	type:'checkbox',	style:'text-align:center'
					,typeinfo: {ignoreupdate : false, fixedcellcheckbox : {usemode : false, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}
				},
				{caption: ["등록년도"],		ref: 'yr',			width:'80px',	type:'input',	style:'text-align:center'},
				{caption: ["항목"],		ref: 'fundArtcl',  	type:'combo',  width:'140px',    style:'text-align:center'
					,typeinfo : {ref:'jsonPopGrdFundArtcl', label:'label', value:'value', displayui : false}},
				{caption: ["산출식 코드"],	ref: 'computWayCd',				width:'80px',	type:'input',	style:'text-align:center'
					,columnhint : '<div style="width: auto;">중복불가 10자리 까지 가능합니다</div>'},
				{caption: ['배점'],		ref: 'alt', 			width: '50px', type: 'input',	style: 'text-align:center'},
				{caption: ['산출식'],		ref: 'computWayDtl',	width: '400px', type: 'textarea',	style: 'text-align:center'
					,typeinfo : {textareascroll : true},columnhint : '<div style="width: auto;">줄바꿈은 Shift + Enter</div>'},
				{caption: ['비고'],		ref: 'rmrk', 			width: '300px', type: 'input',	style: 'text-align:center'},
				{caption: ["상세내역"], 	ref: 'seq',			hidden : true},
			];

			grdComputWayPop = _SBGrid.create(SBGridProperties);
			grdComputWayPop.bind('beforepagechanged', this.paging);
			//grdComputWayPop.bind('dblclick', popComputWay.choice);	//'popApcChoice');
			//this.search();
		},
		//choice: function() {
		//},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdComputWayPop.rebuild();
			let pageSize = grdComputWayPop.getPageSize();
			let pageNo = 1;

			// grid clear
			jsonComputWayPop.length = 0;
			grdComputWayPop.refresh();
			//grdComputWayPop.clearStatus();
			this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			let yr = SBUxMethod.get("pop-srch-input-yr");
			//let fundArtcl = SBUxMethod.get("pop-srch-input-fundArtcl");
			if(gfn_isEmpty(yr)){
				let now = new Date();
				let year = now.getFullYear();
				yr = year;
			}

			const postJsonPromise = gfn_postJSON("/pd/pcorm/selectComputWayList.do", {
				//검색 파라미터
				yr : yr,
				//, fundArtcl : fundArtcl,

				// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

			const data = await postJsonPromise;

			try {
				/** @type {number} **/
				let totalRecordCount = 0;

				jsonComputWayPop.length = 0;
				data.resultList.forEach((item, index) => {
					const itemVo = {
						yr 	: item.yr
						,computWayDtl	: item.computWayDtl
						,computWayCd	: item.computWayCd
						,fundArtcl		: item.fundArtcl
						,alt			: item.alt
						,rmrk			: item.rmrk
						,useYn			: item.useYn
						,delYn			: item.delYn
						,seq			: item.seq
					}
					jsonComputWayPop.push(itemVo);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

				if (jsonComputWayPop.length > 0) {
					if(grdComputWayPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
						grdComputWayPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
						grdComputWayPop.rebuild();
					}else{
						grdComputWayPop.refresh();
					}
				} else {
					grdComputWayPop.setPageTotalCount(totalRecordCount);
					grdComputWayPop.rebuild();
				}

				document.querySelector('#computWay-pop-cnt').innerText = totalRecordCount;

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		paging: function() {
			let recordCountPerPage = grdComputWayPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
			let currentPageNo = grdComputWayPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

			popComputWay.setGrid(recordCountPerPage, currentPageNo);
		},
		save: async function() {
			let allData = grdComputWayPop.getGridDataAll();

			const saveList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdComputWayPop.getRowData(i);
				const rowSts = grdComputWayPop.getRowStatus(i);

				if (rowData.delYn !== "N") {
					continue;
				}

				if(gfn_isEmpty(rowData.computWayCd)){
					gfn_comAlert("W0002", "산출식 코드");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				if(gfn_isEmpty(rowData.fundArtcl)){
					gfn_comAlert("W0001", "항목");		//	W0001	{0}을/를 선택하세요.
					return;
				}
				for ( let j=1; j<=allData.length; j++ ){
					const rowData01 = grdComputWayPop.getRowData(j);
					if(i==j){continue;}
					if(rowData.computWayCd == rowData01.computWayCd){
						alert('중복된 코드값이 있습니다.');
						grdComputWayPop.selectRow(i);
						return;
					}
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

			if (saveList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/pd/pcorm/multiSaveComputWayList.do", saveList);

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.search();
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
		},
		fn_addRow: function() {
			let yrVal = SBUxMethod.get("pop-srch-input-yr");
			grdComputWayPop.addRow(true, {delYn:'N', yr:yrVal});
		},
		fn_procRow: async function(/** {String} */gubun, /** {String} */grid, /** {String} */nRow, /** {String} */nCol) {
			if (gubun === "ADD") {
				if (grid === "grdComputWayPop") {
					grdComputWayPop.setCellData(nRow, nCol, "N", true);
					grdComputWayPop.addRow(true);
				}
			}
			else if (gubun === "DEL") {
				if (grid === "grdComputWayPop") {
					if(grdComputWayPop.getRowStatus(nRow) == 0 || grdComputWayPop.getRowStatus(nRow) == 2){
						var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
						if(confirm(delMsg)){
							var vo = grdComputWayPop.getRowData(nRow);
							popComputWay.fn_deleteRsrc(vo);
							grdComputWayPop.deleteRow(nRow);
						}
					}else{
						grdComputWayPop.deleteRow(nRow);
					}
				}
			}
		},
		fn_deleteRsrc: async function(/** {object} */ vo) {
			let postJsonPromise = gfn_postJSON("/pd/pcorm/deleteComputWay.do", vo);
			let data = await postJsonPromise;

			try{
				if(data.result > 0){
					alert("삭제 되었습니다.");
				}else{
					alert("삭제 도중 오류가 발생 되었습니다.");
				}
			}catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		}
	}
</script>
</html>