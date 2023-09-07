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
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchPltBx" name="btnSearchPltBx" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPltBx.search"></sbux-button>
						<sbux-button id="btnSavePltBx" name="btnSavePltBx" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertPltBx"></sbux-button>
						<sbux-button id="btnEndPltBx" name="btnEndPltBx" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popPltBx.close"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="pltBx-inp-apcNm" name="pltBx-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">계량번호</th>
							<th class="td_input">
								<sbux-input id="pltBx-inp-vhclNm" name="pltBx-inp-vhclNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="col-sm-6">
					<div class="ad_section_top">
						<div id="sb-area-grdPlt" style="width:100%;height:300px;"></div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="ad_section_top">
						<div id="sb-area-grdBx" style="width:100%;height:300px;"></div>
					</div>
				</div>
				<div class="col-sm-6">
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>합계</caption>
						<colgroup>
							<col style="width: 155px">
							<col style="width: 85px">
							<col style="width: 85px">
							<col style="width: 85px">
							<col style="width: 60px">
							<col style="width: 80px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">합계</th>
								<td>
									<sbux-input id="plt-inp-qntt" name="plt-inp-qntt" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="plt-inp-unitWght" name="plt-inp-unitWght" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="plt-inp-wght" name="plt-inp-wght" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="plt-inp-unitCd" name="plt-inp-unitCd" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="plt-inp-delYn" name="plt-inp-delYn" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-sm-6">
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 155px">
							<col style="width: 85px">
							<col style="width: 85px">
							<col style="width: 85px">
							<col style="width: 60px">
							<col style="width: 80px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">합계</th>
								<td>
									<sbux-input id="bx-inp-qntt" name="bx-inp-qntt" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="bx-inp-unitWght" name="bx-inp-unitWght" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="bx-inp-wght" name="bx-inp-wght" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="bx-inp-unitCd" name="bx-inp-unitCd" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>
									<sbux-input id="bx-inp-delYn" name="bx-inp-delYn" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComUnitCd 		= [];
	var jsonComPltNm		= [];
	var jsonComBxNm		= [];
	
	const pltMap = {};
	const bxMap = {};
	
	var jsonPlt = [];
	var jsonBx = [];
	var jsonBxPltBxPop 	= [];
	
	var grdPlt = null;
	var grdBx = null;
	const popPltBx = {
			prgrmId: 'pltBxPopup',
			modalId: 'modal-pltBx',
// 			gridId: 'grdPlt',
// 			jsonId: 'jsonPlt',
// 			areaId: "sb-area-grdPrdcr",
// 			prvApcCd: "",
			objGrid: null,
			apcCd: null,
// 			gridJson: [],
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc, _pltBxData) {
				this.apcCd = _apcCd;
				SBUxMethod.set("pltBx-inp-apcNm", gv_apcNm);
				await this.initSBSelectPltBx();
				
				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;	
				}
				this.createPltGrid();
				this.createBxGrid();
				
				
				jsonPltBxPop = {
						pltData: [],
						bxData: []
					}

				if (!gfn_isEmpty(_pltBxData)) {
					if (!gfn_isEmpty(_pltBxData.pltData)) {
						jsonPltBxPop.pltData = gfn_cloneJson(_pltBxData.pltData);
					}
					if (!gfn_isEmpty(_pltBxData.bxData)) {
						jsonPltBxPop.bxData = gfn_cloneJson(_pltBxData.bxData);
					}
				}
				
				this.search(_pltBxData);
			},
			close: function() {
				pltBxData = {
							jsonPlt: jsonPlt,
							jsonBx: jsonBx,
							totalPltWght: SBUxMethod.get("plt-inp-wght"),
							totalBxWght: SBUxMethod.get("bx-inp-wght")
						}
				gfn_closeModal(this.modalId, this.callbackFnc, pltBxData);
			},
			createPltGrid: function() {
				jsonPlt = [];
			    var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-grdPlt';
			    SBGridProperties.id = 'grdPlt';
			    SBGridProperties.jsonref = 'jsonPlt';
			    SBGridProperties.emptyrecords = '데이터가 없습니다.';
			    SBGridProperties.selectmode = 'byrow';
			    SBGridProperties.extendlastcol = 'scroll';
			    SBGridProperties.columns = [
			        {caption: ["팔레트","종류"], 		ref: 'pltBxNm',   		type:'combo',  width:'140px',    style:'text-align:center',
						typeinfo : {ref:'jsonComPltNm', label:'label', value:'value', displayui : true}},
			        {caption: ["팔레트","대여업체"], 		ref: 'pltCnptNm',  	type:'input',  width:'100px',    style:'text-align:center'},
			        {caption: ["팔레트","수량"], 		ref: 'qntt',  	type:'input',  width:'70px',    style:'text-align:center'},
			        {caption: ["팔레트","단중"], 		ref: 'unitWght',   		type:'input',  width:'70px',    style:'text-align:center'},
			        {caption: ["팔레트","중량"], 		ref: 'wght',   		type:'output',  width:'70px',    style:'text-align:center'},
			        {caption: ["팔레트","단위"], 		ref: 'unitCd',   		type:'combo',  width:'50px',    style:'text-align:center',
							typeinfo : {ref:'jsonComUnitCd', label:'label', value:'value', displayui : true}},
					{caption: ["팔레트","처리"], 		ref: 'delYn',   	type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.add(\"grdPlt\", " + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.del(\"grdPlt\", " + nRow + ")'>삭제</button>";
		            	}
				    }},
			    	{caption: ["박스 정보","코드"], 					ref: 'pltBxCd',  	hidden : true},
				    {caption: ["박스 정보","팔레트/박스 구분코드"], 		ref: 'pltBxSeCd',  	hidden : true},
				    {caption: ["박스 정보","APC코드"], 					ref: 'apcCd',  		hidden : true}
			    ];
			    grdPlt = _SBGrid.create(SBGridProperties);
			    grdPlt.bind('valuechanged', popPltBx.setPltUnitWght);
			    grdPlt.addRow(true);
			},
			createBxGrid: function() {
				jsonBx = [];
			    var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-grdBx';
			    SBGridProperties.id = 'grdBx';
			    SBGridProperties.jsonref = 'jsonBx';
			    SBGridProperties.emptyrecords = '데이터가 없습니다.';
			    SBGridProperties.selectmode = 'byrow';
			    SBGridProperties.extendlastcol = 'scroll';
			    SBGridProperties.columns = [
			    	{caption: ["박스","종류"], 		ref: 'pltBxNm',   		type:'combo',  width:'140px',    style:'text-align:center',
						typeinfo : {ref:'jsonComBxNm', label:'label', value:'value', displayui : true}},
					{caption: ["박스","대여업체"], 		ref: 'pltCnptNm',  	type:'input',  width:'100px',    style:'text-align:center'},
			        {caption: ["박스","수량"], 		ref: 'qntt',  	type:'input',  width:'70px',    style:'text-align:center'},
			        {caption: ["박스","단중"], 		ref: 'unitWght',   		type:'input',  width:'70px',    style:'text-align:center'},
			        {caption: ["박스","중량"], 		ref: 'wght',   		type:'output',  width:'70px',    style:'text-align:center'},
			        {caption: ["박스","단위"], 		ref: 'unitCd',   		type:'combo',  width:'50px',    style:'text-align:center',
						typeinfo : {ref:'jsonComUnitCd', label:'label', value:'value', displayui : true}},
					{caption: ["박스","처리"], 		ref: 'delYn',   	type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.add(\"grdBx\", " + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.del(\"grdBx\", " + nRow + ")'>삭제</button>";
		            	}
				    }},
			    	{caption: ["박스","코드"], 					ref: 'pltBxCd',  	hidden : true},
				    {caption: ["박스","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
				    {caption: ["박스","APC코드"], 				ref: 'apcCd',  	hidden : true}

			    ];
			    grdBx = _SBGrid.create(SBGridProperties);
			    grdBx.bind('valuechanged', this.setBxUnitWght);
			    grdBx.addRow(true);
			},

			add: function(grid, nRow, nCol) {
				if(grid === "grdPlt"){
					grdPlt.setCellData(nRow, nCol, "N", true);
					grdPlt.setCellData(nRow, 6, "P", true);
					grdPlt.setCellData(nRow, 7, SBUxMethod.get("apcCd"), true);
					grdPlt.addRow(true);
				}else if(grid ==="grdBx"){
					grdBx.setCellData(nRow, nCol, "N", true);
					grdBx.setCellData(nRow, 6, "B", true);
					grdBx.setCellData(nRow, 7, SBUxMethod.get("apcCd"), true);
					grdBx.addRow(true);
				}
			},
			del: async function(grid, nRow) {
				if(grid === "grdPlt"){
					if(grdPlt.getRowStatus(nRow) == 0 || grdPlt.getRowStatus(nRow) == 2){
						if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
							return;
						}
	        			var pltBxVO = grdPlt.getRowData(nRow);
	        			grdPlt.deleteRow(nRow);
		        	}else{
		        		grdPlt.deleteRow(nRow);
		        	}
				}else if(grid === "grdBx"){
					if(grdBx.getRowStatus(nRow) == 0 || grdBx.getRowStatus(nRow) == 2){
						if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
							return;
						}
	        			var pltBxVO = grdPlt.getRowData(nRow);
	        			grdBx.deleteRow(nRow);
		        	}else{
		        		grdBx.deleteRow(nRow);
		        	}
				}
			},
			save: async function() {

			},
			search: async function(pltBxData) {
				if(!gfn_isEmpty(pltBxData)){
					if(!gfn_isEmpty(pltBxData.jsonPlt))
						jsonPlt = pltBxData.jsonPlt;
					
					if(!gfn_isEmpty(pltBxData.jsonBx))
						jsonBx = pltBxData.jsonBx;
				}
				
				grdPlt.rebuild();
				grdBx.rebuild();
			},
		    initSBSelectPltBx: async function() {
			 	gfn_setComCdGridSelect('grdPlt', jsonComUnitCd, 'UNIT_CD', '0000');			// 단위
			 	gfn_setComCdGridSelect('grdBx', jsonComUnitCd, 'UNIT_CD', '0000');			// 단위
			 	
		 		// 팔레트 SB select
			 	jsonComPltNm = [];
				var postJsonPromise = gfn_postJSON("/am/cmns/pltBxInfos", {apcCd: this.apcCd, pltBxSeCd: 'P', delYn: "N"});
				var data = await postJsonPromise;
				data.resultList.forEach((item) => {
					const pltBx = {
						label: item.pltBxNm,
						value: item.pltBxCd
					}
					pltMap[item.pltBxCd] = item;
					jsonComPltNm.push(pltBx);
				});
		 		console.log("jsonComPltNm", jsonComPltNm);
		 		console.log("pltMap", pltMap);
		 		SBUxMethod.refresh('grdPlt');
		 		
		 		
		 		// 박스 SB select
		 		jsonComBxNm = [];
				postJsonPromise = gfn_postJSON("/am/cmns/pltBxInfos", {apcCd: this.apcCd, pltBxSeCd: 'B', delYn: "N"});
				data = await postJsonPromise;
				data.resultList.forEach((item) => {
					const pltBx = {
						label: item.pltBxNm,
						value: item.pltBxCd
					}
					bxMap[item.pltBxCd] = item;
					jsonComBxNm.push(pltBx);
				});
		 		console.log("jsonComBxNm", jsonComBxNm);
		 		console.log("bxMap", bxMap);
		 		SBUxMethod.refresh('grdBx');
		    },
		    setPltUnitWght: function() {
			    var nRow = grdPlt.getRow();
			    var nCol = grdPlt.getCol();
				if(nCol == 0){
				    grdPlt.setCellData(nRow,nCol+1,pltMap[grdPlt.getCellData(nRow,nCol)].pltCnptNm);
				    grdPlt.setCellData(nRow,nCol+3,pltMap[grdPlt.getCellData(nRow,nCol)].unitWght);
				    grdPlt.setCellData(nRow,nCol+5,pltMap[grdPlt.getCellData(nRow,nCol)].unitCd);
				    grdPlt.setCellData(nRow,nCol+7,pltMap[grdPlt.getCellData(nRow,nCol)].pltBxCd);
				    grdPlt.setCellData(nRow,nCol+8,pltMap[grdPlt.getCellData(nRow,nCol)].pltBxSeCd);
				    grdPlt.setCellData(nRow,nCol+9,pltMap[grdPlt.getCellData(nRow,nCol)].apcCd);
				}
				else if(nCol == 2){
					grdPlt.setCellData(nRow,nCol+2,grdPlt.getCellData(nRow, 2) * grdPlt.getCellData(nRow, 3));
				}
				
				var totalQntt = Number(0);
				var totalWght = 0;
				for(var i=0; i<jsonPlt.length; i++){
					totalQntt += Number(jsonPlt[i].qntt);
					
					if (jsonPlt[i].unitCd == 1)
						totalWght += jsonPlt[i].qntt * jsonPlt[i].unitWght / 1000
					else if(jsonPlt[i].unitCd == 3)
						totalWght += jsonPlt[i].qntt * jsonPlt[i].unitWght * 1000
					else
						totalWght += jsonPlt[i].qntt * jsonPlt[i].unitWght
				}
				SBUxMethod.set("plt-inp-qntt", totalQntt);
				SBUxMethod.set("plt-inp-wght", totalWght);
		    },
		    setBxUnitWght: function() {
			    var nRow = grdBx.getRow();
			    var nCol = grdBx.getCol();
			    console.log(nRow, nCol);
				if(nCol == 0){
					grdBx.setCellData(nRow,nCol+1,bxMap[grdBx.getCellData(nRow,nCol)].pltCnptNm);
					grdBx.setCellData(nRow,nCol+3,bxMap[grdBx.getCellData(nRow,nCol)].unitWght);
					grdBx.setCellData(nRow,nCol+5,bxMap[grdBx.getCellData(nRow,nCol)].unitCd);
					grdBx.setCellData(nRow,nCol+7,bxMap[grdBx.getCellData(nRow,nCol)].pltBxCd);
					grdBx.setCellData(nRow,nCol+8,bxMap[grdBx.getCellData(nRow,nCol)].pltBxSeCd);
					grdBx.setCellData(nRow,nCol+9,bxMap[grdBx.getCellData(nRow,nCol)].apcCd);
				}
				else if(nCol == 2){
					grdBx.setCellData(nRow,nCol+2, grdBx.getCellData(nRow, 2) * grdBx.getCellData(nRow, 3));
				}
				
				var totalQntt = Number(0);
				var totalWght = 0;
				for(var i=0; i<jsonPlt.length; i++){
					totalQntt += Number(jsonBx[i].qntt);
					
					if (jsonBx[i].unitCd == 1)
						totalWght += jsonBx[i].qntt * jsonBx[i].unitWght / 1000
					else if(jsonBx[i].unitCd == 3)
						totalWght += jsonBx[i].qntt * jsonBx[i].unitWght * 1000
					else
						totalWght += jsonBx[i].qntt * jsonBx[i].unitWght
				}
				SBUxMethod.set("bx-inp-qntt", totalQntt);
				SBUxMethod.set("bx-inp-wght", totalWght);
		    }
		}
</script>
</html>