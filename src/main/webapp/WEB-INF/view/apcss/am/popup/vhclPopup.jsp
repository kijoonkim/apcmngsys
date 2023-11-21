<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 차량 선택</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">원물입고 차량번호를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">편집 버튼을 통해 차량정보를 등록/수정 할수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchVhcl" name="btnSearchVhcl" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popVhcl.search"></sbux-button>
					<sbux-button id="btnEditVhcl" name="btnEditVhcl" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popVhcl.edit"></sbux-button>
					<sbux-button id="btnCancelVhcl" name="btnCancelVhcl" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popVhcl.cancel"></sbux-button>
					<sbux-button id="btnSaveVhcl" name="btnSaveVhcl" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popVhcl.save" disabled></sbux-button>
					<sbux-button id="btnChoiceVhcl" name="btnChoiceVhcl" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popVhcl.choice"></sbux-button>
					<sbux-button id="btnEndVhcl" name="btnEndVhcl" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popVhcl.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
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
								<sbux-input id="vhcl-inp-apcNm" name="vhcl-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="vhcl-inp-apcCd" name="vhcl-inp-apcCd" uitype="hidden"></sbux-input>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input
									uitype="text" id="vhcl-inp-vhclno" name="vhcl-inp-vhclno"
									class="form-control input-sm" maxlength="8"
    								onkeyenter="popVhcl.search">
    							</sbux-input>
							</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">차량번호 목록</span>
								<span style="font-size:12px">(조회건수 <span id="vhcl-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdVhclPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonComBankCdVhclPop = [];	// 은행 bankCd

	var grdVhclPop = null;
	var jsonVhclPop = [];

	/**
	 * @description 차량 선택 팝업
	 */
	const popVhcl = {
		prgrmId: 'vhclPopup',
		modalId: 'modal-vhcl',
		gridId: 'grdVhclPop',
		jsonId: 'jsonVhclPop',
		areaId: "sb-area-grdVhclPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc, _vhclno) {
			// set param
			SBUxMethod.set("vhcl-inp-apcCd", _apcCd);
			SBUxMethod.set("vhcl-inp-apcNm", _apcNm);
			SBUxMethod.set("vhcl-inp-vhclno", _vhclno);

			SBUxMethod.show('btnEditVhcl');
			SBUxMethod.hide('btnCancelVhcl');
			SBUxMethod.attr('btnSaveVhcl', 'disabled', true);
			SBUxMethod.attr('btnSearchVhcl', 'disabled', false);
			SBUxMethod.attr('btnChoiceVhcl', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdVhclPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setComCdSBSelect('grdVhcl', jsonComBankCdVhclPop,'BANK_CD')		// 은행
				]);
				this.createGrid();
				this.search();
			} else {
			    grdVhclPop.bind('dblclick', popVhcl.choice);
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_vhcl) {
			gfn_closeModal(this.modalId, this.callbackFnc, _vhcl);
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
		    SBGridProperties.columns = [
		        {caption: ["처리"], 		ref: 'delYn', 			width: '70px',	type:'button', 		style: 'text-align:center', sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
						if (!isEditable) {
							return "";
						}
		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popVhcl.add(" + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popVhcl.del(" + nRow + ")'>삭제</button>";
		            	}
			    }},
		    	{caption: ['차량번호'], 	ref: 'vhclno', 			width: '100px',	type: 'input', 		style:'text-align:center', 	sortable: false,
		    		validate : gfn_chkByte.bind({byteLimit: 40})},
		        {caption: ['기사명'], 	ref: 'drvrNm', 			width: '100px', type: 'input', 		style:'text-align:center', 	sortable: false,
					validate : gfn_chkByte.bind({byteLimit: 20})},
		        {caption: ['예금주명'], 	ref: 'dpstr', 			width: '100px', type: 'input', 		style:'text-align:center', 	sortable: false,
					validate : gfn_chkByte.bind({byteLimit: 20})},
		        {caption: ['은행'], 		ref: 'bankCd', 			width: '100px',	type:'inputcombo',  style:'text-align:center', 	sortable: false,
					typeinfo : {ref:'jsonComBankCdVhclPop', itemcount: 10,	label:'label', value:'value'}, validate : gfn_chkByte.bind({byteLimit: 100})},
		        {caption: ['계좌번호'], 	ref: 'actno', 			width: '120px', type: 'input', 		style:'text-align:center', 	sortable: false,
					typeinfo : {mask : {alias : 'numeric'}}, validate : gfn_chkByte.bind({byteLimit: 256})},
		        {caption: ['비고'], 		ref: 'rmrk',			width: '200px', type: 'input', 									sortable: false,
					validate : gfn_chkByte.bind({byteLimit: 1000})},
		        {caption: ['최종처리일시'],	ref: 'sysLastChgDt',	width: '140px', type: 'output',		style:'text-align:center', 	sortable: false},
			    {caption: ['APC코드'], 	ref: 'apcCd', 			hidden : true},
			    {caption: ['은행명'], 	ref: 'bankNm', 			hidden : true}
		    ];
		    grdVhclPop = _SBGrid.create(SBGridProperties);
		    grdVhclPop.bind('dblclick', popVhcl.choice);
		},
		choice: function() {
			let nRow = grdVhclPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdVhclPop.getRowData(nRow);
				popVhcl.close(rowData);
			}
		},
		edit: async function() {

			SBUxMethod.hide('btnEditVhcl');
			SBUxMethod.show('btnCancelVhcl');
			SBUxMethod.attr('btnSaveVhcl', 'disabled', false);
			SBUxMethod.attr('btnSearchVhcl', 'disabled', true);
			SBUxMethod.attr('btnChoiceVhcl', 'disabled', true);

			this.createGrid(true);
			grdVhclPop.rebuild();
			grdVhclPop.setCellDisabled(0, 0, grdVhclPop.getRows() - 1, grdVhclPop.getCols() - 1, false);
			
			let nRow = grdVhclPop.getRows();
			grdVhclPop.addRow(true);
			grdVhclPop.setCellDisabled(nRow, 0, nRow, grdVhclPop.getCols() - 1, true);
		    grdVhclPop.unbind('dblclick');

		},
		cancel: function() {

			SBUxMethod.show('btnEditVhcl');
			SBUxMethod.hide('btnCancelVhcl');
			SBUxMethod.attr('btnSaveVhcl', 'disabled', true);
			SBUxMethod.attr('btnSearchVhcl', 'disabled', false);
			SBUxMethod.attr('btnChoiceVhcl', 'disabled', false);

			this.createGrid();
			this.search();
		},
		add: function(nRow, nCol) {
			grdVhclPop.setCellData(nRow, nCol, "N", true);
			grdVhclPop.setCellDisabled(nRow, 0, nRow, grdVhclPop.getCols() - 1, false);
			nRow++;
			grdVhclPop.addRow(true);
			grdVhclPop.setCellDisabled(nRow, 0, nRow, grdVhclPop.getCols() - 1, true);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("vhcl-inp-apcCd");
			const rowSts = grdVhclPop.getRowStatus(nRow);
			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdVhclPop.getRowData(nRow);
				const wrhsVhclVO = {
					apcCd: apcCd,
					vhclno: rowData.vhclno
				}
				const postJsonPromise = gfn_postJSON("/am/cmns/deleteWrhsVhclList.do", {
					apcCd: apcCd,
					vhclno: rowData.vhclno
				}, this.prgrmId);

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.searchInEdit();
		        	} else {
		        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        	}
		        } catch(e) {
		        }
        	} else {
        		grdVhclPop.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("vhcl-inp-apcCd");
			let allData = grdVhclPop.getGridDataAll();

			const vhclList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdVhclPop.getRowData(i);
				const rowSts = grdVhclPop.getRowStatus(i);
				if (!gfn_isEmpty(rowData.delYn)){
					if (gfn_isEmpty(rowData.vhclno)){
						gfn_comAlert("W0002", "차량번호");		//	W0002	{0}을/를 입력하세요.
			            return;
					} else {
			    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(rowData.vhclno))){
				    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
			    			return;
			    		}
			    	}

					if (rowSts === 3){
						rowData.apcCd = apcCd;
						rowData.rowSts = "I";
						vhclList.push(rowData);
					} else if (rowSts === 2){
						rowData.rowSts = "U";
						vhclList.push(rowData);
					} else {
						continue;
					}
				}
			}

			if (vhclList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiVhclList.do", vhclList, this.prgrmId);	// 프로그램id 추가

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.searchInEdit();
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	        }
		},
		search: async function() {
			grdVhclPop.rebuild();

	    	// grid clear
	    	jsonVhclPop.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {

	    	let apcCd = SBUxMethod.get("vhcl-inp-apcCd");
			let vhclno = SBUxMethod.get("vhcl-inp-vhclno");

	        const postJsonPromise = gfn_postJSON("/am/cmns/selectWrhsVhclList.do", {
	        	apcCd: apcCd,
	        	vhclno: vhclno
			});

	        const data = await postJsonPromise;

			try {
	    		jsonVhclPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const vhcl = {
						rowSeq			: item.rowSeq,
						vhclno			: item.vhclno,
					    drvrNm 			: item.drvrNm,
					    bankCd 			: item.bankCd,
					    bankNm 			: item.bankNm,
					    actno 			: item.actno,
					    dpstr 			: item.dpstr,
					    rmrk 			: item.rmrk,
					    delYn 			: item.delYn,
					    apcCd 			: item.apcCd,
					    sysLastChgDt	: item.sysLastChgDt
					}
					jsonVhclPop.push(vhcl);
				});
        		grdVhclPop.rebuild();

	        	grdVhclPop.setCellDisabled(0, 0, grdVhclPop.getRows() - 1, grdVhclPop.getCols() - 1, true);

	        	document.querySelector('#vhcl-pop-cnt').innerText = jsonVhclPop.length;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    searchInEdit: async function() {
	    	this.createGrid();
    		await this.search();
    		this.createGrid(true);
			grdVhclPop.rebuild();
    		grdVhclPop.addRow();
	    }
	}

</script>
</html>