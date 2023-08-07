<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchDfct" name="btnSearchDfct" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="dfctPopup.search"></sbux-button>
					<sbux-button id="btnSaveDfct" name="btnSaveDfct" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="dfctPopup.save"></sbux-button>
					<sbux-button id="btnEndDfct" name="btnEndDfct" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-dfctMng')"></sbux-button>
				</div>
			</div>

			<div class="box-body">

				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 150px">
						<col style="auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">프로그램명</th>
							<th colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-prgrmNm" name="dtl-inp-prgrmNm" uitype="text" disabled></sbux-input>
								<sbux-input id="dtl-inp-prgrmId" name="dtl-inp-prgrmId" uitype="hidden"></sbux-input>
							</th>
							<th scope="row" class="th_bg">담당자</th>
							<th  class="td_input" style="border-right:hidden;">
								<sbux-input id="dtl-inp-pic" name="dtl-inp-pic" uitype="text" disabled></sbux-input>
								<sbux-input id="dtl-hid-pic" name="dtl-hid-pic" uitype="hidden"></sbux-input>
							</th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdDfctMng" style="width:100%;height:400px;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdDtctPopup = null;

	const dfctPopup = {
		prgrmId: 'dfctPopup',
		gridId: 'grdDtctPopup',
		jsonId: 'jsonDfctPopup',
		areaId: "sb-area-grdDfctMng",
		prvPrgrmId : "",
		init: async function(rowData) {

			if (grdDtctPopup === null || this.prvPrgrmId != rowData.prgrmId) {
				this.createGrid();
				this.search();
			} else {
				this.search();
			}
			this.prvPrgrmId = rowData.prgrmId;
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.columns = [
		        {caption: ['결함내용'], 		ref: 'dfctCn', 		width: '280px', type: 'input', style:'text-align:center'},
		        {caption: ['등록자'], 			ref: 'regPrsnNm', 	width: '80px', 	type: 'input', style:'text-align:center'},
		        {caption: ['담당자 조치결과'], 	ref: 'actnRslt', 	width: '280px', type: 'input', style:'text-align:center'},
		        {caption: ['최종변경일시'], 	ref: 'ocrnYmd', 	width: '100px', type: 'output', format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'},style:'text-align:center'},
		        {caption: ['조치일자'], 		ref: 'actnYmd', 	width: '120px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  style:'text-align:center'},
		        {caption: ["처리"], 			ref: 'delYn', type:'button', width:'80px', style: 'text-align:center',
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='dfctPopup.add(" + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='dfctPopup.del(" + nRow + ")'>삭제</button>";
		            	}
			    }},
		        {caption: ['프로그램ID'], 	ref: 'prgrmId', 	hidden : true},
		        {caption: ['결함순번'], 	ref: 'dfctSn', 		hidden : true}
		    ];
		    grdDtctPopup = _SBGrid.create(SBGridProperties);
		},
		add: function(nRow, nCol) {
			grdDtctPopup.setCellData(nRow, nCol, "N", true);
			grdDtctPopup.setCellData(nRow, 6, SBUxMethod.get("dtl-inp-prgrmId"), true);
			grdDtctPopup.addRow(true);
		},
		del: async function(nRow) {
			const rowSts = grdDtctPopup.getRowStatus(nRow);
			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdDtctPopup.getRowData(nRow);
				const dfctVO = {
					prgrmId: rowData.prgrmId,
					dfctSn: rowData.dfctSn
				}
				const postJsonPromise = gfn_postJSON("/co/pms/deleteDfct.do", {
					prgrmId: rowData.prgrmId,
					dfctSn: rowData.dfctSn
				}, this.prgrmId);	// 프로그램id 추가

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.search();
		        		dvlpPrgs.search();
		        	} else {
		        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        	}
		        } catch(e) {
		        }
        	} else {
        		grdDtctPopup.deleteRow(nRow);
        	}
		},
		save: async function() {
			let allData = grdDtctPopup.getGridDataAll();
			let insertCnt = 0;
			let updateCnt = 0;

			const dfctList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdDtctPopup.getRowData(i);
				const rowSts = grdDtctPopup.getRowStatus(i);

				if(!gfn_isEmpty(rowData.delYn)){

					if (gfn_isEmpty(rowData.dfctCn)){
						gfn_comAlert("W0002", "결함내용");		//	W0002	{0}을/를 입력하세요.
			            return;
					}
					if (gfn_isEmpty(rowData.regPrsnNm)){
						gfn_comAlert("W0002", "등록자");		//	W0002	{0}을/를 입력하세요.
			            return;
					}

					if (rowSts === 3){
						rowData.rowSts = "I";
						dfctList.push(rowData);
					} else if (rowSts === 2){
						rowData.rowSts = "U";
						dfctList.push(rowData);
					} else {
						continue;
					}
				}
			}

			if (dfctList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/co/pms/multiDfctList.do", dfctList, this.prgrmId);	// 프로그램id 추가

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.search();
	        		dvlpPrgs.search();
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	        }

		},
		search: async function() {
			// set pagination
			grdDtctPopup.rebuild();

	    	// grid clear
	    	jsonDfctPopup.length = 0;
	    	grdDtctPopup.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {

	    	let prgrmId = SBUxMethod.get("dtl-inp-prgrmId");

	        const postJsonPromise = gfn_postJSON("/co/pms/selectDfctMngList.do", {
	        	prgrmId		: prgrmId
			});
	        const data = await postJsonPromise;
			try {
	    		jsonDfctPopup.length = 0;
	        	data.resultList.forEach((item, index) => {
	        		console.log(item);
					const dfctVO = {
						prgrmId		: item.prgrmId,
						dfctSn		: item.dfctSn,
						dfctCn		: item.dfctCn,
						regPrsnNm	: item.regPrsnNm,
						actnRslt	: item.actnRslt,
						ocrnYmd		: item.ocrnYmd,
						actnYmd		: item.actnYmd,
						delYn		: item.delYn
					}
					jsonDfctPopup.push(dfctVO);

				});

        		grdDtctPopup.rebuild();
        		grdDtctPopup.addRow(true);

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	}
</script>
</html>