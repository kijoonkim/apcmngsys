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
					<sbux-button id="btnSearchDmnd" name="btnSearchDmnd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="prfrmImprvDmnd.search"></sbux-button>
					<sbux-button id="btnSaveDmnd" name="btnSaveDmnd" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="prfrmImprvDmnd.save"></sbux-button>
					<sbux-button id="btnEndDmnd" name="btnEndDmnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="prfrmImprvDmnd.close"></sbux-button>
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
								<sbux-input id="dmnd-inp-apcNm" name="dmnd-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="dmnd-inp-apcCd" name="dmnd-inp-apcCd" uitype="hidden"></sbux-input>
							</th>
							<th scope="row">프로그램명</th>
							<th class="td_input">
								<sbux-input id="dmnd-inp-menuNm" name="dmnd-inp-menuNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="dmnd-inp-menuId" name="dmnd-inp-menuId" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</th>
							<th></th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdPrfrmImprvDmndPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top"  style="width: 98%;">
						<ul class="ad_tbl_count">
							<li><span>조치내용</span></li>
						</ul>
					</div>
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
								<th scope="row">조치예정일자</th>
								<th>
									<sbux-input id="dmnd-inp-actnPrnmntYmd" name="dmnd-inp-actnPrnmntYmd" uitype="text" class="form-control input-sm"
										mask = "{ 'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
										readonly
									></sbux-input>
								</th>
								<th scope="row">접수자</th>
								<th>
									<sbux-input id="dmnd-inp-picNm" name="dmnd-inp-picNm" uitype="text" class="form-control input-sm"
										readonly
									></sbux-input>
								</th>
								<th scope="row">조치결과</th>
								<th>
									<sbux-input id="dmnd-inp-actnRslt" name="dmnd-inp-actnRslt" uitype="text" class="form-control input-sm"
									readonly
									></sbux-input>
								</th>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var grdPrfrmImprvDmndPop = null;
	var jsonPrfrmImprvDmndPop = [];
	var jsonComPic= [];

	/**
	 * @description 차량 선택 팝업
	 */
	const prfrmImprvDmnd = {
		prgrmId: 'prfrmImprvDmndPopup',
		modalId: 'modal-prfrmImprvDmnd',
		gridId: 'grdPrfrmImprvDmndPop',
		jsonId: 'jsonPrfrmImprvDmndPop',
		areaId: "sb-area-grdPrfrmImprvDmndPop",
		prvApcCd: "",
		prvMenuId: "",
		prvUserId: "",
		prvUserNm: "",
		objGrid: null,
		gridJson: [],
		init: async function(_apcCd, _apcNm, _userId, _userNm, _menuId, _menuNm) {

			// set param
			SBUxMethod.set("dmnd-inp-apcNm", _apcNm);
			SBUxMethod.set("dmnd-inp-menuNm", _menuNm);

			this.createGrid();
			//this.search();

			this.prvApcCd = _apcCd;
			this.prvMenuId = _menuId;
			this.prvUserId = _userId;
			this.prvUserNm = _userNm;

			this.search();

		},
		close: function() {
			gfn_closeModal(this.modalId);
		},
		createGrid: async function() {
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
		    SBGridProperties.columns = [
		    	{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		        	if(strValue== null || strValue == ""){
		        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='prfrmImprvDmnd.procRow(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
		        	}else{
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='prfrmImprvDmnd.procRow(\"DEL\", " + nRow + ")'>삭제</button>";
		        	}
			    }},
	            {caption: ['상태'], 		ref: 'dmndStts', 	width: '80px', 		type: 'output', 	style: 'text-align: center'},
	            {caption: ['요청일자'], 	ref: 'dmndYmd', 	width: '80px', 	type: 'output', 	style: 'text-align: center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	            {caption: ['요청자'], 	ref: 'userNm', 		width: '80px', 		type: 'output', 	style: 'text-align: center'},
	            {caption: ['개선요청사항'], ref: 'imprvDmndMttr', 	width: '500px', 	type: 'input', 	style: 'text-align: center'},
	            {caption: ['APC코드'], 	ref: 'apcCd', 		hidden : true},
	            {caption: ['사용자ID'], 	ref: 'userId', 		hidden : true},
	            {caption: ['메뉴ID'], 	ref: 'menuId', 		hidden : true},
	            {caption: ['순번'], 		ref: 'sn', 			hidden : true}
		    ];

		    grdPrfrmImprvDmndPop = _SBGrid.create(SBGridProperties);
		    grdPrfrmImprvDmndPop.bind('click', this.selectDmnd);

		    let rst = await Promise.all([
				gfn_setComCdSBSelect('dmnd-slt-pic', 	jsonComPic, 'PIC'),			// 담당자(검색)
			]);
			grdPrfrmImprvDmndPop.refresh({"combo":true});
		},
		search: async function() {

			SBUxMethod.set("dmnd-inp-actnPrnmntYmd", "")
	    	SBUxMethod.set("dmnd-inp-picNm", "")
	    	SBUxMethod.set("dmnd-inp-actnRslt", "")

			let apcCd = this.prvApcCd;
			if(apcCd == "0000"){
				apcCd = "";
			}

	        const postJsonPromise = gfn_postJSON("/co/dmnd/selectPrfrmImprvDmndList.do", {
	        	apcCd				: apcCd,
	        	menuId				: this.prvMenuId,
			});

	        const data = await postJsonPromise;

			try {
				jsonPrfrmImprvDmndPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const dmnd = {
						apcCd 			: item.apcCd,
						dmndYmd 		: item.dmndYmd,
						sn 				: item.sn,
						menuId 			: item.menuId,
						userId 			: item.userId,
						userNm 			: item.userNm,
						imprvDmndMttr	: item.imprvDmndMttr,
						actnPrnmntYmd 	: item.actnPrnmntYmd,
						pic 			: item.pic,
						picNm			: item.picNm,
						actnRslt 		: item.actnRslt,
						delYn			: item.delYn,
						dmndStts		: item.dmndStts
					}
					jsonPrfrmImprvDmndPop.push(dmnd);

				});

	        	grdPrfrmImprvDmndPop.rebuild();
	        	grdPrfrmImprvDmndPop.addRow(true);

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    procRow : async function(gubun, nRow, nCol) {

	    	if(gubun === "ADD"){
	    		grdPrfrmImprvDmndPop.setCellData(nRow, nCol, "N", true);

	    		grdPrfrmImprvDmndPop.setCellData(nRow, 2, gfn_dateToYmd(new Date()), true);
	    		grdPrfrmImprvDmndPop.setCellData(nRow, 3, this.prvUserNm, true);
	    		grdPrfrmImprvDmndPop.setCellData(nRow, 5, this.prvApcCd, true);
	    		grdPrfrmImprvDmndPop.setCellData(nRow, 6, this.prvUserId, true);
	    		grdPrfrmImprvDmndPop.setCellData(nRow, 7, this.prvMenuId, true);
	    		grdPrfrmImprvDmndPop.addRow(true);

	    	}else if(gubun === "DEL"){
	    		if(grdPrfrmImprvDmndPop.getRowStatus(nRow) == 0 || grdPrfrmImprvDmndPop.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var prfrmImprvDmnd = grdPrfrmImprvDmndPop.getRowData(nRow);
            			this.delete(prfrmImprvDmnd);
            			grdPrfrmImprvDmndPop.deleteRow(nRow);
            		}
            	}else{
            		grdPrfrmImprvDmndPop.deleteRow(nRow);
            	}
	    	}
	    },
	    save : async function(){

	    	let saveList = [];
			let gridData = grdPrfrmImprvDmndPop.getGridDataAll();

			for(var i=1; i<=gridData.length; i++ ){
				let rowData = grdPrfrmImprvDmndPop.getRowData(i);
				let rowSts = grdPrfrmImprvDmndPop.getRowStatus(i);
				let delYn = rowData.delYn;
				let imprvDmndMttr = rowData.imprvDmndMttr;
				if(delYn == 'N'){
					if (gfn_isEmpty(imprvDmndMttr)) {
			  			gfn_comAlert("W0002", "개선요청사항");		//	W0002	{0}을/를 입력하세요.
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

			if(saveList.length == 0){
				gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
				return;
			}
			let regMsg = "저장 하시겠습니까?";
			if(confirm(regMsg)){

				let postJsonPromise = gfn_postJSON("/co/dmnd/multiSavePrfrmImprvDmndList.do", saveList);
		        let data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
		        		this.search();
		        	} else {
		        		alert(data.resultMessage);
		        	}
		        } catch (e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        }
			}
	    },
	    delete : async function(prfrmImprvDmndVO){
	    	let postJsonPromise = gfn_postJSON("/co/dmnd/deletePrfrmImprvDmnd.do", prfrmImprvDmndVO);
	        let data = await postJsonPromise;
	        try {
	        	if(data.deletedCnt > 0){
	        		this.search();
	        		return;
	        	}else if (data.errMsg != null ){
	        		gfn_comAlert("E0000", data.errMsg)		// W0009   {0}이/가 있습니다.
	        		return;
	        	}else {
	        		gfn_comAlert("E0001");
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    selectDmnd : async function(){
	    	let nRow = grdPrfrmImprvDmndPop.getRow();

	    	if(nRow > 0){
	    		let rowData = grdPrfrmImprvDmndPop.getRowData(nRow);
		    	let picNm = rowData.picNm
		    	let actnPrnmntYmd = rowData.actnPrnmntYmd
		    	let actnRslt = rowData.actnRslt

		    	SBUxMethod.set("dmnd-inp-actnPrnmntYmd", actnPrnmntYmd)
		    	SBUxMethod.set("dmnd-inp-picNm", picNm)
		    	SBUxMethod.set("dmnd-inp-actnRslt", actnRslt)
	    	}
	    }
	}
</script>
</html>