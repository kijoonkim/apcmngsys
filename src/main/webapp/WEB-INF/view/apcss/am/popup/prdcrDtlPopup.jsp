<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 생산자 선택</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">생산자 상세 정보를 등록합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchPrdcrDtl" name="btnSearchPrdcrDtl" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPrdcrDtl.search"></sbux-button>
					<sbux-button id="btnSavePrdcrDtl" name="btnSavePrdcrDtl" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popPrdcrDtl.save"></sbux-button>
					<sbux-button id="btnEndPrdcrDtl" name="btnEndPrdcrDtl" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popPrdcrDtl.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="prdcrDtl-inp-apcCd" name="prdcrDtl-inp-apcCd" uitype="hidden"></sbux-input>
				<sbux-input id="prdcrDtl-inp-prdcrCd" name="prdcrDtl-inp-prdcrCd" uitype="hidden"></sbux-input>
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
								<sbux-input id="prdcrDtl-inp-apcNm" name="prdcrDtl-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</th>
							<th scope="row">농가명</th>
							<th class="td_input">
								<sbux-input id="prdcrDtl-inp-frmhsNm" name="prdcrDtl-inp-frmhsNm" uitype="text" class="form-control input-sm" maxlength='100' onchange='popPrdcrDtl.onChangeFrmhs'></sbux-input>
							</th>
							<th scope="row">연락처</th>
							<th>
								<sbux-input
									id="prdcrDtl-inp-frmhsTelno"
									name="prdcrDtl-inp-frmhsTelno"
									uitype="text"
									class="form-control input-sm"
									auto-fill-phone-dashes="true"
									auto-fill-gen-dashes="true"
									maxlength='22'
									onchange='popPrdcrDtl.onChangeFrmhs'
								></sbux-input>
							</th>
						</tr>
						<tr>
							<th scope="row">지역</th>
							<th class="td_input">
								<sbux-select
									id="prdcrDtl-slt-frmhsCtpv"
									name="prdcrDtl-slt-frmhsCtpv"
									uitype="single"
									jsondata-ref="jsonCtpvPrdcrDtlPop"
									unselected-text="선택"
									class="form-control input-sm"
									onchange='popPrdcrDtl.onChangeFrmhs'
									style="background-color:#FFFFFF;"
								></sbux-select>
							</th>
							<th scope="row">주소</th>
							<th colspan='3' class="td_input">
								<sbux-input id="prdcrDtl-inp-frmhsAddr" name="prdcrDtl-inp-frmhsAddr" uitype="text" class="form-control input-sm" maxlength='200' onchange='popPrdcrDtl.onChangeFrmhs'></sbux-input>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdPrdcrDtlPop" style="height:300px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonApcVrtyPrdcrDtlPop = [];
	var jsonCtpvPrdcrDtlPop = [];

	var grdPrdcrDtlPop = null;
	var jsonPrdcrDtlPop = [];
	var onChangeFrmhsYn = 'N';

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popPrdcrDtl = {
		prgrmId: 'prdcrDtlPopup',
		modalId: 'modal-prdcrDtl',
		gridId: 'grdPrdcrDtlPop',
		jsonId: 'jsonPrdcrDtlPop',
		areaId: "sb-area-grdPrdcrDtlPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		init: async function(_apcCd, _apcNm, _prdcrCd) {
			// set param
			SBUxMethod.set("prdcrDtl-inp-apcCd", _apcCd);
			SBUxMethod.set("prdcrDtl-inp-apcNm", _apcNm);
			onChangeFrmhsYn = 'N';
			if (!gfn_isEmpty(_prdcrCd)) {
				SBUxMethod.set("prdcrDtl-inp-prdcrCd",_prdcrCd);
			}
			
			if (grdPrdcrDtlPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setApcVrtySBSelect('grdPrdcrDtlPop', jsonApcVrtyPrdcrDtlPop, _apcCd),				// 품종
					gfn_setComCdSBSelect('prdcrDtl-slt-frmhsCtpv', jsonCtpvPrdcrDtlPop, 'CTPV', '0000')		// 지역
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_prdcrDtl) {
			gfn_closeModal(this.modalId);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'free';
		    SBGridProperties.explorerbar = 'move';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.columns = [
		    	{caption: ["처리","처리"],					ref: 'delYn',		type: 'button', 	width: '50px',	style: 'text-align:center',	sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPrdcrDtl.add(" + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPrdcrDtl.del(" + nRow + ")'>삭제</button>";
		            	}
			    }},
			    {caption: ['등록일자','등록일자'],			ref: 'regYmd',		type: 'output',		width: '80px',	style: 'text-align:center',	sortable: false,
			    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ['순번','순번'],					ref: 'sn',			type: 'output', 	width: '40px',	style: 'text-align:center',	sortable: false},
		        {caption: ['품종','품종1'],				ref: 'vrtyCd1',		type: 'combo', 		width: '80px',	style: 'text-align:center',	sortable: false,
					typeinfo: {ref:'jsonApcVrtyPrdcrDtlPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['품종','품종2'],				ref: 'vrtyCd2',		type: 'combo', 		width: '80px',	style: 'text-align:center',	sortable: false,
					typeinfo: {ref:'jsonApcVrtyPrdcrDtlPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['품종','품종3'],				ref: 'vrtyCd3',		type: 'combo', 		width: '80px',	style: 'text-align:center',	sortable: false,
					typeinfo: {ref:'jsonApcVrtyPrdcrDtlPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['품종','품종4'],				ref: 'vrtyCd4',		type: 'combo', 		width: '80px',	style: 'text-align:center',	sortable: false,
					typeinfo: {ref:'jsonApcVrtyPrdcrDtlPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['품종','품종5'],				ref: 'vrtyCd5',		type: 'combo', 		width: '80px',	style: 'text-align:center',	sortable: false,
					typeinfo: {ref:'jsonApcVrtyPrdcrDtlPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['계약면적','평'],				ref: 'ctrtArea', 	type: 'input', 		width: '70px',	style: 'text-align:right',	sortable: false,
					typeinfo : {mask : {alias: 'decimal', digits : 3}}, format : {type:'number', rule:'#,###.###'}},
		        {caption: ['계약면적','㎡'],				ref: 'ctrtAreaSqM',	type: 'input', 		width: '80px',	style: 'text-align:right',	sortable: false,
					typeinfo : {mask : {alias: 'decimal', digits : 3}}, format : {type:'number', rule:'#,###.###'}},
		        {caption: ['정식면적(평)','정식면적(평)'],	ref: 'cltvtnArea',	type: 'input', 		width: '80px',	style: 'text-align:right',	sortable: false,
					typeinfo : {mask : {alias: 'decimal', digits : 3}}, format : {type:'number', rule:'#,###.###'}},
		        {caption: ['비고','비고'],					ref: 'rmrk',		type: 'input', 		width: '100px',	style: 'text-align:center', sortable: false,
		        	validate : gfn_chkByte.bind({byteLimit: 1000})},
		        {caption: ['APC코드','APC코드'],			ref: 'apcCd',		hidden : true},
		        {caption: ['생산자코드','생산자코드'],		ref: 'prdcrCd',		hidden : true}
		    ];
		    grdPrdcrDtlPop = _SBGrid.create(SBGridProperties);
		    grdPrdcrDtlPop.bind('valuechanged', this.setCtrtArea);
		},
		add: function(nRow, nCol) {
			grdPrdcrDtlPop.setCellData(nRow, nCol, "N", true);
			grdPrdcrDtlPop.setCellDisabled(nRow, 0, nRow, grdPrdcrDtlPop.getCols() - 1, false);
			nRow++;
			grdPrdcrDtlPop.addRow(true);
			grdPrdcrDtlPop.setCellDisabled(nRow, 0, nRow, grdPrdcrDtlPop.getCols() - 1, true);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("prdcrDtl-inp-apcCd");
			const rowSts = grdPrdcrDtlPop.getRowStatus(nRow);

			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdPrdcrDtlPop.getRowData(nRow);
				const prdcrDtlVO = {
					apcCd	: apcCd,
					prdcrCd	: rowData.prdcrCd,
					regYmd	: rowData.regYmd,
					sn		: rowData.sn
				}
				const postJsonPromise = gfn_postJSON("/am/cmns/updatePrdcrDtlDelYn.do", prdcrDtlVO, this.prgrmId);

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
        	} else {
        		grdPrdcrDtlPop.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("prdcrDtl-inp-apcCd");
			const prdcrCd = SBUxMethod.get("prdcrDtl-inp-prdcrCd");
			const frmhsNm = gfn_isEmpty(SBUxMethod.get("prdcrDtl-inp-frmhsNm")) ? "" : SBUxMethod.get("prdcrDtl-inp-frmhsNm");
			const frmhsTelno = (typeof(SBUxMethod.get("prdcrDtl-inp-frmhsTelno")) == "undefined" || gfn_isEmpty(SBUxMethod.get("prdcrDtl-inp-frmhsTelno"))) ? "" : SBUxMethod.get("prdcrDtl-inp-frmhsTelno");
			const frmhsCtpv = SBUxMethod.get("prdcrDtl-slt-frmhsCtpv");
			const frmhsAddr = gfn_isEmpty(SBUxMethod.get("prdcrDtl-inp-frmhsAddr")) ? "" : SBUxMethod.get("prdcrDtl-inp-frmhsAddr");
			let allData = grdPrdcrDtlPop.getGridDataAll();

			const prdcrDtlList = [];

			for ( let i=2; i<=allData.length; i++ ){
				const rowData = grdPrdcrDtlPop.getRowData(i);
				const rowSts = grdPrdcrDtlPop.getRowStatus(i);

				if (rowData.delYn !== "N") {
					continue;
				}

				if (rowSts === 3){
					rowData.apcCd = apcCd;
					rowData.prdcrCd = prdcrCd;
					rowData.regYmd = gfn_dateToYmd(new Date());
					rowData.rowSts = "I";
					rowData.frmhsNm = frmhsNm;
					rowData.frmhsTelno = frmhsTelno;
					rowData.frmhsCtpv = frmhsCtpv;
					rowData.frmhsAddr = frmhsAddr;
					
					prdcrDtlList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					rowData.frmhsNm = frmhsNm;
					rowData.frmhsTelno = frmhsTelno;
					rowData.frmhsCtpv = frmhsCtpv;
					rowData.frmhsAddr = frmhsAddr;
					
					prdcrDtlList.push(rowData);
				} else {
					continue;
				}
			}

			if (prdcrDtlList.length == 0){
				if (onChangeFrmhsYn == 'N') {
					gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
		            return;
				} else {
					var frmhs = {
						apcCd 		: apcCd,
						prdcrCd 	: prdcrCd,
						frmhsNm 	: frmhsNm,
						frmhsTelno 	: frmhsTelno,
						frmhsCtpv 	: frmhsCtpv,
						frmhsAddr 	: frmhsAddr
					};
					
					prdcrDtlList.push(frmhs);
				}
			}

			console.log(prdcrDtlList);
			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiPrdcrDtlList.do", prdcrDtlList, this.prgrmId);

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		onChangeFrmhsYn = 'N';
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
		search: async function() {
			grdPrdcrDtlPop.rebuild();

	    	// grid clear
	    	jsonPrdcrDtlPop.length = 0;
	    	grdPrdcrDtlPop.refresh();
	    	this.setFrmhs();
	    	this.setGrid();
		},
		setFrmhs: async function() {

	    	let apcCd = SBUxMethod.get("prdcrDtl-inp-apcCd");
			let prdcrCd = SBUxMethod.get("prdcrDtl-inp-prdcrCd");

	        const postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrList.do", {
	        	apcCd	: apcCd,
	        	prdcrCd	: prdcrCd
			});

	        const data = await postJsonPromise;

			try {
	        	data.resultList.forEach((item, index) => {
					const prdcrDtl = {
							frmhsNm			: item.frmhsNm,
							frmhsTelno		: item.frmhsTelno,
							frmhsCtpv		: item.frmhsCtpv,
							frmhsAddr		: item.frmhsAddr
					}
					SBUxMethod.set("prdcrDtl-inp-frmhsNm", prdcrDtl.frmhsNm);
					SBUxMethod.set("prdcrDtl-inp-frmhsTelno", prdcrDtl.frmhsTelno);
					SBUxMethod.set("prdcrDtl-slt-frmhsCtpv", prdcrDtl.frmhsCtpv);
					SBUxMethod.set("prdcrDtl-inp-frmhsAddr", prdcrDtl.frmhsAddr);
				});
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
		setGrid: async function() {

	    	let apcCd = SBUxMethod.get("prdcrDtl-inp-apcCd");
			let prdcrCd = SBUxMethod.get("prdcrDtl-inp-prdcrCd");

	        const postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrDtlList.do", {
	        	apcCd	: apcCd,
	        	prdcrCd	: prdcrCd
			});

	        const data = await postJsonPromise;

			try {
	    		jsonPrdcrDtlPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const prdcrDtl = {
						cltvtnArea		: item.cltvtnArea,
						ctrtArea		: item.ctrtArea,
						ctrtAreaSqM		: item.ctrtArea*3.305785,
						regYmd			: item.regYmd,
						sn				: item.sn,
						vrtyCd1			: item.vrtyCd1,
						vrtyCd2			: item.vrtyCd2,
						vrtyCd3			: item.vrtyCd3,
						vrtyCd4			: item.vrtyCd4,
						vrtyCd5			: item.vrtyCd5,
					    rmrk 			: item.rmrk,
					    delYn 			: item.delYn,
					    apcCd 			: item.apcCd,
						prdcrCd			: item.prdcrCd
					}
					jsonPrdcrDtlPop.push(prdcrDtl);
				});
        		grdPrdcrDtlPop.rebuild();
        		
        		let nRow = grdPrdcrDtlPop.getRows();
        		grdPrdcrDtlPop.addRow(true);
        		grdPrdcrDtlPop.setCellDisabled(nRow, 0, nRow, grdPrdcrDtlPop.getCols() - 1, true);

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    onChangeFrmhs: async function() {
	    	onChangeFrmhsYn = 'Y';
	    },
	    setCtrtArea: async function() {
	    	let nRow = grdPrdcrDtlPop.getRow();
			let nCol = grdPrdcrDtlPop.getCol();
			let ctrtAreaCol = grdPrdcrDtlPop.getColRef("ctrtArea");
			let ctrtAreaSqMCol = grdPrdcrDtlPop.getColRef("ctrtAreaSqM");
			let cltvtnAreaCol = grdPrdcrDtlPop.getColRef("cltvtnArea");
			if (nCol == ctrtAreaCol) {
				
				if (grdPrdcrDtlPop.getCellData(nRow, nCol)%1 != 0) {
					if ((grdPrdcrDtlPop.getCellData(nRow, nCol)).length > 11) {
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaCol, "");
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaSqMCol, "");
						alert("소수점 자리를 포함해 10자리까지(평 단위 기준)만 입력 가능합니다.");
						return;
					}
				} else {
					if ((grdPrdcrDtlPop.getCellData(nRow, nCol)).length > 10) {
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaCol, "");
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaSqMCol, "");
						alert("소수점 자리를 포함해 10자리까지(평 단위 기준)만 입력 가능합니다.");
						return;
					}
				}
				
				let ctrtAreaSqM = parseFloat((grdPrdcrDtlPop.getCellData(nRow, nCol)*3.305785).toPrecision(10));
				ctrtAreaSqM = parseFloat(ctrtAreaSqM.toFixed(3));
				
				grdPrdcrDtlPop.setCellData(nRow, ctrtAreaSqMCol, ctrtAreaSqM);
				
			} else if (nCol == ctrtAreaSqMCol) {

				let ctrtArea = parseFloat((grdPrdcrDtlPop.getCellData(nRow, nCol)/3.305785).toPrecision(10));
				ctrtArea = parseFloat(ctrtArea.toFixed(3));
				
				if (ctrtArea%1 != 0) {
					if (ctrtArea.toString().length > 11) {
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaCol, "");
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaSqMCol, "");
						alert("소수점 자리를 포함해 10자리까지(평 단위 기준)만 입력 가능합니다.");
						return;
					}
				} else {
					if (ctrtArea.toString().length > 10) {
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaCol, "");
						grdPrdcrDtlPop.setCellData(nRow, ctrtAreaSqMCol, "");
						alert("소수점 자리를 포함해 10자리까지(평 단위 기준)만 입력 가능합니다.");
						return;
					}
				}
				
				grdPrdcrDtlPop.setCellData(nRow, ctrtAreaCol, ctrtArea);
				
			} else if (nCol == cltvtnAreaCol) {
				
				if (grdPrdcrDtlPop.getCellData(nRow, nCol)%1 != 0) {
					if ((grdPrdcrDtlPop.getCellData(nRow, nCol)).length > 11) {
						grdPrdcrDtlPop.setCellData(nRow, cltvtnAreaCol, "");
						alert("소수점 자리를 포함해 10자리까지(평 단위 기준)만 입력 가능합니다.");
						return;
					}
				} else {
					if ((grdPrdcrDtlPop.getCellData(nRow, nCol)).length > 10) {
						grdPrdcrDtlPop.setCellData(nRow, cltvtnAreaCol, "");
						alert("소수점 자리를 포함해 10자리까지(평 단위 기준)만 입력 가능합니다.");
						return;
					}
				}
				
			}
	    }
	}
</script>
</html>