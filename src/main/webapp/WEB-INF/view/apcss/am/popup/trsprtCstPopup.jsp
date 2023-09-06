<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
		/* .sbgrid_inputbutton_button_st  {
			 width:  19 px;
			 height:  18 px;
			 background: url(../img/grid/button.png) no-repeat;
			 background-position: center;
			 border: none;
			 cursor: Pointer;
		} */
	</style>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchTrsprtCst" name="btnSearchTrsprtCst" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.search"></sbux-button>
						<sbux-button id="btnSaveTrsprtCst" name="btnSaveTrsprtCst" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.save"></sbux-button>
						<sbux-button id="btnEndTrsprtCst" name="btnEndTrsprtCst" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.close"></sbux-button>
					</div>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 90px">
						<col style="width: 180px">
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 45px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th class="td_input">
								<sbux-input id="trsprtCst-inp-apcNm" name="trsprtCst-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="trsprtCst-inp-apcCd" name="trsprtCst-inp-apcCd" uitype="hidden" class="form-control input-sm" readonly></sbux-input>
							</th>
							<th scope="row">운송일자</th>
							<th class="td_input">
								<sbux-datepicker id="trsprtCst-dtp-trsprtYmd" name="trsprtCst-dtp-trsprtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm"></sbux-datepicker>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input
									id="trsprtCst-inp-vhclno"
									name="trsprtCst-inp-vhclno"
									uitype="text" maxlength="8"
									class="form-control input-sm"
    							></sbux-input>
							</th>
							<th class="td_input">
								<sbux-button
									id="btnSrchTrsprtCstVhclNo"
									name="btnSrchTrsprtCstVhclNo"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceTrsprtCstVhcl"
								></sbux-button>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">운임운임비용 목록</span>
								<span style="font-size:12px">(조회건수 <span id="trsprtCst-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdTrsrptCst" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonTrsprtCstPop = [];

	var jsonComTrsprtSeCd 		= [];	// 운송구분 trsprtSeCd		Grid
	var jsonComTrsprtRgnCd		= [];	// 운송지역	trsprtRgnCd		Grid

	var grdTrsptCstPop = null;
    var jsonVhcl = [];

    /**
	 * @description 차량 선택 팝업
	 */
	const popTrsrptCst = {
		prgrmId: 'trsptCstPopup',
		modalId: 'modal-trsprtCst',

		gridId: 'grdTrsprtCstPop',
		jsonId: 'jsonTrsprtCstPop',
		areaId: "sb-area-grdTrsrptCst",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		receivedData: null,
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _data, _callbackFnc) {
			// set param
			receivedData = _data;
			SBUxMethod.set("trsprtCst-dtp-trsprtYmd", _data.trsprtYmd);
			SBUxMethod.set("trsprtCst-inp-vhclno", _data.vhclno);
			SBUxMethod.set("trsprtCst-inp-apcCd", _apcCd);
			SBUxMethod.set("trsprtCst-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdTrsptCstPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setComCdGridSelect('grdTrsprtCstPop', 		jsonComTrsprtSeCd, 	'TRSPRT_SE_CD'),	// 운송구분
					gfn_setTrsprtRgnSBSelect('grdTrsprtCstPop', 	jsonComTrsprtRgnCd, _apcCd)				// 운송지역
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;

		},
		close: function(_trsprtCst) {
			gfn_closeModal(this.modalId, this.callbackFnc, _trsprtCst);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;
		    SBGridProperties.id = this.gridId;
		    SBGridProperties.jsonref = this.jsonId;
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
			SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
			SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		        {caption: ["처리"],	 	ref: 'delYn',  		width:'70px',	type: 'button',			style: 'text-align: center', sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
			        	if(strValue== null || strValue == ""){
			        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popTrsrptCst.add(" + nRow + ", " + nCol + ")'>추가</button>";
			        	}else{
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popTrsrptCst.del(" + nRow + ")'>삭제</button>";
			        	}
			    	}},
		        {caption: ['운송일자'], 	ref: 'trsprtYmd', 	width:'120px',	type: 'datepicker', 	style: 'text-align: center', sortable: false,
			    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ['운송구분'], 	ref: 'trsprtSeCd',	width: '100px',	type: 'combo',			style: 'text-align: center', sortable: false,		
					typeinfo : {ref:'jsonComTrsprtSeCd', label:'label', value:'value', itemcount: 10}},
		        {caption: ['차량번호'], 	ref: 'vhclno',		width: '100px',	type: 'inputbutton',	style: 'text-align: center', sortable: false,		
					typeinfo : {callback: fn_grdChoiceVhcl}, validate : gfn_chkByte.bind({byteLimit: 40})},
		        {caption: ['기사명'], 	ref: 'drvrNm',		width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['운송지역'], 	ref: 'trsprtRgnCd', width: '100px', type: 'combo', 			style: 'text-align: center', sortable: false, 	
					typeinfo : {ref:'jsonComTrsprtRgnCd', label:'label', value:'value', itemcount: 10}},
		        {caption: ['중량'], 		ref: 'wrhsWght', 	width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false,
					typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###Kg'}},
		        {caption: ['운임비용'],	ref: 'trsprtCst', 	width: '100px',	type: 'input', 			style: 'text-align: center', sortable: false,
					typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}, validate : gfn_chkByte.bind({byteLimit: 18})},
		        {caption: ['은행'],		ref: 'bankNm', 		width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['계좌'],		ref: 'actno', 		width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['예금주'],	 	ref: 'dpstr', 		width: '80px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['비고'],		ref: 'rmrk', 		width: '240px',	type: 'input',										 sortable: false,
		        	validate : gfn_chkByte.bind({byteLimit: 1000})},
		        {caption: ['APC코드'], 	ref: 'apcCd', 		hidden : true},
		        {caption: ['은행'],		ref: 'bankCd', 		hidden : true},
		        {caption: ['순번'], 		ref: 'sn', 			hidden : true}

		    ];
		    grdTrsprtCstPop = _SBGrid.create(SBGridProperties);
		    grdTrsprtCstPop.bind('dblclick', popTrsrptCst.choice);

		},
		choice: function() {
			let nRow = grdTrsprtCstPop.getRow();
			let rowData = grdTrsprtCstPop.getRowData(nRow);
			popTrsrptCst.close(rowData);
		},
		/**
		 * @param {number} nRow
		 * @param {number} nCol
		 */
		add: function(nRow, nCol) {

			grdTrsprtCstPop.setCellData(nRow, 0, SBUxMethod.get("trsprtCst-dtp-trsprtYmd"), true);
			grdTrsprtCstPop.setCellData(nRow, nCol, "N", true);
			grdTrsprtCstPop.addRow(true, receivedData);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("trsprtCst-inp-apcCd");
			const rowSts = grdTrsprtCstPop.getRowStatus(nRow);
			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdTrsprtCstPop.getRowData(nRow);
				const grdTrsprtCstVO = {
					apcCd		: apcCd,
					trsprtYmd	: rowData.trsprtYmd,
					vhclno		: rowData.vhclno,
					sn			: rowData.sn
				}
				const postJsonPromise = gfn_postJSON("/am/cmns/deleteRawMtrTrsprtCst.do", grdTrsprtCstVO, this.prgrmId);	// 프로그램id 추가

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.search();
		        	} else {
		        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        	}
		        } catch(e) {
		        }
        	} else {
        		grdTrsprtCstPop.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("trsprtCst-inp-apcCd");
			let allData = grdTrsprtCstPop.getGridDataAll();

			const trsprtCstList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdTrsprtCstPop.getRowData(i);
				const rowSts = grdTrsprtCstPop.getRowStatus(i);
				if (!gfn_isEmpty(rowData.delYn)){

					if (gfn_isEmpty(rowData.trsprtYmd)){
						gfn_comAlert("W0002", "운송일자");		//	W0002	{0}을/를 입력하세요.
			            return;
					}

					if (gfn_isEmpty(rowData.vhclno)){
						gfn_comAlert("W0002", "차량번호는");		//	W0002	{0}을/를 입력하세요.
			            return;
					}

					if (rowSts === 3){
						rowData.apcCd = apcCd;
						rowData.rowSts = "I";
						trsprtCstList.push(rowData);
					} else if (rowSts === 2){
						rowData.rowSts = "U";
						trsprtCstList.push(rowData);
					} else {
						continue;
					}
				}
			}

			if (trsprtCstList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiTrsprtCstList.do", trsprtCstList, this.prgrmId);	// 프로그램id 추가

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.search();
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	        }
		},
		search: async function() {
			// set pagination
			grdTrsprtCstPop.rebuild();
	    	let pageSize = grdTrsprtCstPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	grdTrsprtCstPop.length = 0;
	    	await this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {

	    	let apcCd 		= SBUxMethod.get("trsprtCst-inp-apcCd");
	    	let trsprtYmd 	= SBUxMethod.get("trsprtCst-dtp-trsprtYmd");
	    	let vhclno 		= SBUxMethod.get("trsprtCst-inp-vhclno");
	        const postJsonPromise = gfn_postJSON("/am/cmns/selectRawMtrTrsprtCstList.do", {
	        	apcCd		: apcCd,
	        	trsprtYmd	: trsprtYmd,
	        	vhclno		: vhclno,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;
			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonTrsprtCstPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const trsprtCstVO = {
							trsprtYmd 	: item.trsprtYmd
						  , trsprtSeCd 	: item.trsprtSeCd
						  , vhclno 		: item.vhclno
						  , drvrNm 		: item.drvrNm
						  , trsprtRgnCd : item.trsprtRgnCd
						  , wrhsWght	: item.wrhsWght
						  , trsprtCst 	: item.trsprtCst
						  , bankCd 		: item.bankCd
						  , bankNm 		: item.bankNm
						  , actno 		: item.actno
						  , dpstr 		: item.dpstr
						  , rmrk 		: item.rmrk
						  , delYn		: item.delYn
						  , apcCd		: item.apcCd
						  , sn			: item.sn
					}
					jsonTrsprtCstPop.push(trsprtCstVO);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonTrsprtCstPop.length > 0) {
	        		if(grdTrsprtCstPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdTrsprtCstPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdTrsprtCstPop.rebuild();
					}else{
						grdTrsprtCstPop.refresh();
					}
	        	} else {
	        		grdTrsprtCstPop.setPageTotalCount(totalRecordCount);
	        		grdTrsprtCstPop.rebuild();
	        	}
	        	grdTrsprtCstPop.addRow(true, receivedData);
	        	document.querySelector('#trsprtCst-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdComAuthUserPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdComAuthUserPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popComAuthUser.setGrid(recordCountPerPage, currentPageNo);
	    },
   	}

	/* 원물운임비용 등록에서 사용 차량선택 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 차량선택팝업 호출
	 */
	const fn_choiceTrsprtCstVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setTrsprtCstVhcl);
	}

	/**
	 * @name fn_setVhcl
	 * @description 차량 선택 callback
	 */
	const fn_setTrsprtCstVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("trsprtCst-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	/* End */

	const fn_grdChoiceVhcl = function() {
		SBUxMethod.openModal('modal-vhcl');
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setGrdVhcl);
	}

	const fn_setGrdVhcl = function(vhcl) {
		let nRow = grdTrsprtCstPop.getRow();

		if (!gfn_isEmpty(vhcl)) {
			grdTrsprtCstPop.setCellData(nRow, 3, vhcl.vhclno);
			grdTrsprtCstPop.setCellData(nRow, 4, vhcl.drvrNm);
			grdTrsprtCstPop.setCellData(nRow, 8, vhcl.bankNm);
			grdTrsprtCstPop.setCellData(nRow, 9, vhcl.actno);
			grdTrsprtCstPop.setCellData(nRow, 10, vhcl.dpstr);
		}
	}

</script>
</html>