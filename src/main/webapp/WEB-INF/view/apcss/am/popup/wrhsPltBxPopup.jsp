<%
 /**
  * @Class Name : wrhsPltBxPopup.jsp
  * @Description : 입고팔레트박스등록 팝업 화면
  * @author SI개발부
  * @since 2023.09.19
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 원물계량 팔레트/박스 입고등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="wrhsPltBxPop-btn-search" name="wrhsPltBxPop-btn-search" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popWrhsPltBx.search"></sbux-button>
						<sbux-button id="wrhsPltBxPop-btn-confirm" name="wrhsPltBxPop-btn-confirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="popWrhsPltBx.confirm"></sbux-button>
						<sbux-button id="wrhsPltBxPop-btn-close" name="wrhsPltBxPop-btn-close" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popWrhsPltBx.close"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="wrhsPltBxPop-inp-apcCd" name="wrhsPltBxPop-inp-apcCd" uitype="hidden"></sbux-input>
				<sbux-input id="wrhsPltBxPop-inp-itemCd" name="wrhsPltBxPop-inp-itemCd" uitype="hidden"></sbux-input>
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
								<sbux-input id="wrhsPltBxPop-inp-apcNm" name="wrhsPltBxPop-inp-apcNm" uitype="text" class="form-control input-sm"  readonly></sbux-input>
							</th>
							<th scope="row">계량번호</th>
							<th class="td_input">
								<sbux-input id="wrhsPltBxPop-inp-wghno" name="wrhsPltBxPop-inp-wghno" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdWrhsPltBxPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonApcPltWrhsPltBxPop	= [];
	var jsonApcBxWrhsPltBxPop	= [];

	var grdWrhsPltBxPop 	= null;
	var jsonWrhsPltBxPop 	= [];

	const popWrhsPltBx = {
			prgrmId: 'wrhsPltBxPopup',
			modalId: 'modal-wrhsPltBx',
			colPrfx: 'std__',
 			param: {apcCd: "", apcNm: "", itemCd: "", wghno: ""},
			callbackFnc: function() {},
			init: async function(_param, _callbackFnc, _wrhsPltBx) {

				this.param.apcCd = _param.apcCd;
				this.param.apcNm = _param.apcNm;
				this.param.itemCd = _param.itemCd;
				this.param.wghno = _param.wghno;

				SBUxMethod.set("wrhsPltBxPop-inp-apcCd", _param.apcCd);
				SBUxMethod.set("wrhsPltBxPop-inp-apcNm", _param.apcNm);
				SBUxMethod.set("wrhsPltBxPop-inp-itemCd", _param.itemCd);

				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				await this.initApcPltBx();
				await gStdGrdObj.init(_param.apcCd, _GRD_SE_CD_WRHS, _param.itemCd);

				jsonWrhsPltBxPop.length = 0;

				if (!gfn_isEmpty(_wrhsPltBx)
						&& !gfn_isEmpty(_wrhsPltBx.wrhsPltBxData)
						&& Array.isArray(_wrhsPltBx.wrhsPltBxData)) {
					_wrhsPltBx.wrhsPltBxData.forEach((el) => {
						const pltBx = gfn_cloneJson(el);

						pltBx.apcCd = _param.apcCd;
						pltBx.delYn = "N";

						if (!gfn_isEmpty(pltBx.stdGrdList)
								&& Array.isArray(pltBx.stdGrdList)) {
							pltBx.stdGrdList.forEach((stdGrd) => {
								pltBx[this.colPrfx + stdGrd.grdKnd] = stdGrd.grdCd;
							});
						}

						jsonWrhsPltBxPop.push(pltBx);
					})
				}
				/*
				if (grdWrhsPltBxPop == null) {
					this.createGrid();
				} else {
					grdWrhsPltBxPop.rebuild();
				}
				 */
				this.createGrid();
				this.search(true);
			},
		    initApcPltBx: async function() {

		    	jsonApcPltWrhsPltBxPop.length = 0;
		    	jsonApcBxWrhsPltBxPop.length = 0;

				var postJsonPromise = gfn_postJSON(
										"/am/cmns/pltBxInfos",
										{apcCd: this.param.apcCd, useYn: "Y", delYn: "N"},
										this.prgrmId,
										true
									);
				var data = await postJsonPromise;
				data.resultList.forEach((item) => {
					const pltBx = {
							pltBxSeCd: item.pltBxSeCd,
							pltBxCd: item.pltBxCd,
							pltBxNm: item.pltBxNm,
							unitWght: item.unitWght,
							unitCd: item.unitCd,
							unitNm: item.unitNm,
							cnvrsUnitWght: item.cnvrsUnitWght,
							bssInvntrQntt: item.bssInvntrQntt
					}

					if (item.pltBxSeCd == "P") {
						jsonApcPltWrhsPltBxPop.push(pltBx);
					}
					if (item.pltBxSeCd == "B") {
						jsonApcBxWrhsPltBxPop.push(pltBx);
					}
				});
		    },
			close: function(_wrhsPltBx) {
				gfn_closeModal(this.modalId, this.callbackFnc, _wrhsPltBx);
			},
			createGrid: function() {
				jsonPltWrhsPltPop = [];
			    var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-grdWrhsPltBxPop';
			    SBGridProperties.id = 'grdWrhsPltBxPop';
			    SBGridProperties.jsonref = 'jsonWrhsPltBxPop';
			    SBGridProperties.emptyrecords = '데이터가 없습니다.';
			    SBGridProperties.selectmode = 'byrow';
			    SBGridProperties.extendlastcol = 'scroll';
			    SBGridProperties.scrollbubbling = false;
			    SBGridProperties.columns = [
			    	{caption: ["처리","처리"], 	ref: 'delYn',   	type:'button',  width:'50px',   style:'text-align:center',
			        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
			            	if (gfn_isEmpty(strValue)){
			            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popWrhsPltBx.add(" + nRow + ", " + nCol + ")'>추가</button>";
			            	} else {
						        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popWrhsPltBx.del(" + nRow + ")'>삭제</button>";
			            	}
			        	},
			        	userattr: {colNm: "button"},
				    },
			    	{caption: ["팔레트","팔레트"],	ref: 'pltKnd',		type:'combo',  width:'140px',   style:'text-align:center;background-color:#FFF8DC;',
						typeinfo : {
							ref:'jsonApcPltWrhsPltBxPop',
							label:'pltBxNm',
							value:'pltBxCd',
							displayui : false,
							oneclickedit: true
						},
						userattr: {colNm: "pltKnd"},
			    	},
			    	{caption: ["팔레트","팔레트번호"], ref: 'pltno',  	type:'input',  width:'0px',    style:'text-align:right;',
			    		maxlength: 14,
			    		typeinfo : {oneclickedit : false},
			        },
			        {caption: ["팔레트","식별"], 	ref: 'sn',		type:'input',  width:'0px',    style:'text-align:right;',
			    		maxlength: 1,
			    		typeinfo : {oneclickedit : false},
			        },
			        {caption: ["팔레트","중량"], 	ref: 'pltWght',   		type:'output',  width:'0px',   style:'text-align:right',
			        	format : {type:'number', rule:'#,###'},
			        	datatype: 'number',
			        },
				    {caption: ["박스","종류"], 		ref: 'bxKnd',   	type:'combo',	width:'140px',	style:'text-align:center;background-color:#FFF8DC;',
						typeinfo : {
							ref:'jsonApcBxWrhsPltBxPop',
							label:'pltBxNm',
							value:'pltBxCd',
							displayui : false,
							oneclickedit: true
						},
						userattr: {colNm: "bxKnd"},
			    	},
			        {caption: ["박스","수량"], 		ref: 'bxQntt',  	type:'input',  	width:'50px',   style:'text-align:right;background-color:#FFF8DC;',
			    		typeinfo: {mask: {alias: '#', repeat: '*', unmaskvalue: true}, oneclickedit: true},
						userattr: {colNm: "bxQntt"},
			    		format : {type:'number', rule:'#,###'},
			    		maxlength: 3,
			    		datatype: 'number',
		    		},
		    		{caption: ["박스","단중"], 		ref: 'bxUnitWght',   	type:'output',  width:'0px',   style:'text-align:right',
			        	format : {type:'number', rule:'#,###'},
			        	datatype: 'number',
			        },
		    		{caption: ["박스","중량"], 		ref: 'bxWght',   	type:'output',  width:'0px',   style:'text-align:right',
			        	format : {type:'number', rule:'#,###'},
			        	datatype: 'number',
			        },
			    ];

			    const columnsStdGrd = [];
			    gjsonStdGrdObjKnd.forEach((item, index) => {
					const grd = {
						caption: ["등급",item.grdKndNm],
						ref: this.colPrfx + item.grdKnd,
						type:'combo',
						width:'60px',
						style: 'text-align:center;background-color:#FFF8DC;',
						userattr: {colNm: "stdGrd"},
						typeinfo: {ref: item.jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
					}
					columnsStdGrd.push(grd);
				});

			    if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
					const jgmtGrd = {
						caption: ["판정등급","판정등급"],
						ref: "jgmtGrdCd",
						type:'combo',
						width:'60px',
						style: 'text-align:center;',
						userattr: {colNm: "jgmtGrd"},
						typeinfo: {ref: gStdGrdObj.jgmtJsonId, label:'grdNm', value:'grdCd', displayui : false}
					}
					SBGridProperties.columns.push(jgmtGrd);
				}

			    columnsStdGrd.forEach((item) => {
					SBGridProperties.columns.push(item);
				});

			    const columns2 = [
			    	{caption: ["",""], 	ref: '_',	type:'output',  width:'1px'},
			    	{caption: ["info","APC코드"], ref: 'apcCd',  		hidden : true},
				    {caption: ["info","환산단중"], 	ref: 'pltUnitWght',  	datatype: 'number', hidden : true},
				    {caption: ["info","환산단중"], 	ref: 'bxUnitWght',  	datatype: 'number', hidden : true},
			    ];

			    columns2.forEach((item) => {
					SBGridProperties.columns.push(item);
				});

			    grdWrhsPltBxPop = _SBGrid.create(SBGridProperties);
			    grdWrhsPltBxPop.bind('valuechanged', popWrhsPltBx.onValueChanged);
			    grdWrhsPltBxPop.bind('click', popWrhsPltBx.onClick);
			},
			add: function(nRow, nCol) {
				const apcCd = SBUxMethod.get("wrhsPltBxPop-inp-apcCd");
				const rowData = grdWrhsPltBxPop.getRowData(nRow, false);	// deep copy
				rowData.apcCd = apcCd;
				rowData.delYn = "N";
				grdWrhsPltBxPop.setCellDisabled(nRow, 0, nRow, grdWrhsPltBxPop.getCols() - 1, false);
				grdWrhsPltBxPop.addRow(true);
				grdWrhsPltBxPop.setCellDisabled(nRow+1, 0, nRow+1, grdWrhsPltBxPop.getCols() - 1, true);
			},
			del: async function(nRow) {
				const rowSts = grdWrhsPltBxPop.getRowStatus(nRow);
				if (rowSts == 0 || rowSts == 2){
					if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
						return;
					}
					grdWrhsPltBxPop.deleteRow(nRow);
	        	} else {
	        		grdWrhsPltBxPop.deleteRow(nRow);
	        	}
			},
			confirm: async function() {

				const wrhsPltBxData = jsonWrhsPltBxPop.filter((item, index, arr) => {
										return !gfn_isEmpty(item.apcCd);
									});
				let pltQntt = 0;
				let pltWght = 0;
				let bxQntt = 0;
				let bxWght = 0;

				for ( let i = 0; i < wrhsPltBxData.length; i++ ) {
					const pltBx = wrhsPltBxData[i];
					pltBx.pltQntt = 1;
					if (gfn_isEmpty(pltBx.pltKnd)) {
						gfn_comAlert("W0001", "팔레트종류");		//	W0001	{0}을/를 선택하세요.
						return;
					}
					if (gfn_isEmpty(pltBx.bxKnd)) {
						gfn_comAlert("W0001", "박스종류");		//	W0001	{0}을/를 선택하세요.
						return;
					}

					const qntt = parseInt(pltBx.bxQntt) || 0;
					if (qntt <= 0) {
						gfn_comAlert("W0005", "박스수량");	//	W0005	{0}이/가 없습니다.
						return;
					}

					const stdGrdList = [];
					let jgmtGrdCd;

					for ( let iKnd = 0; iKnd < gjsonStdGrdObjKnd.length; iKnd++ ) {
						const knd = gjsonStdGrdObjKnd[iKnd];
						const key = this.colPrfx + knd.grdKnd;
						const grdCd = pltBx[key];
						if (gfn_isEmpty(grdCd)) {
							gfn_comAlert("W0005", knd.grdKndNm);		//	W0005	{0}이/가 없습니다.
							return;
						}

						stdGrdList.push({
								grdSeCd: _GRD_SE_CD_WRHS,
								itemCd: this.param.itemCd,
								grdKnd: knd.grdKnd,
								grdCd: grdCd
							});

						if (iKnd === 0) {
							jgmtGrdCd = grdCd;
						}
					}

					if (stdGrdList.length === 0) {
						gfn_comAlert("W0005", "등급");		//	W0005	{0}이/가 없습니다.
						return;
					}

					if (gfn_isEmpty(pltBx['jgmtGrdCd'])) {
						pltBx['jgmtGrdCd'] = jgmtGrdCd;
					}

					if (gfn_isEmpty(pltBx['jgmtGrdCd'])) {
						gfn_comAlert("W0005", "등급");		//	W0005	{0}이/가 없습니다.
						return;
					}

					bxQntt += parseInt(pltBx.bxQntt) || 0;
					bxWght += parseInt(pltBx.bxWght) || 0;

					pltBx.stdGrdList = stdGrdList;

					let isDuplicatedPlt = false;
					/*
					if (i > 0) {
						const chkArr = wrhsPltBxData.slice(i);
						if (!gfn_isEmpty(pltBx.pltno)) {
							isDuplicatedPlt = chkArr.some((el) => el.pltno == pltBx.pltno);
						}
						if (!isDuplicatedPlt && !gfn_isEmpty(pltBx.sn)) {
							isDuplicatedPlt = chkArr.some((el) => el.sn == pltBx.sn);
						}
					}
					 */
					if (!isDuplicatedPlt) {
						pltQntt += parseInt(pltBx.pltQntt) || 0;
						pltWght += parseInt(pltBx.pltWght) || 0;
					}
				}

				const wrhsPltBx = {
					wrhsPltBxData: wrhsPltBxData,
					pltQntt: pltQntt,
					pltWght: pltWght,
					bxQntt: bxQntt,
					bxWght: bxWght,
					totalQntt: pltQntt + bxQntt,
					totalWght: pltWght + bxWght
				}

				popWrhsPltBx.close(wrhsPltBx);
			},
			search: async function(/** {boolean */ _isInit) {
				let nRow = jsonWrhsPltBxPop.length + 2;
				if (_isInit) {
					grdWrhsPltBxPop.addRow(true);
					grdWrhsPltBxPop.setCellDisabled(nRow, 0, nRow, grdWrhsPltBxPop.getCols() - 1, true);
				} else {
					nRow--;
					grdWrhsPltBxPop.setCellDisabled(nRow, 0, nRow, grdWrhsPltBxPop.getCols() - 1, true);
				}
				grdWrhsPltBxPop.refresh();
			},
		    onValueChanged: function() {

		    	const nRow = grdWrhsPltBxPop.getRow();
		    	const nCol = grdWrhsPltBxPop.getCol();

		    	const rowData = grdWrhsPltBxPop.getRowData(nRow, false);	// deep copy
				const usrAttr = grdWrhsPltBxPop.getColUserAttr(nCol);

				if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

					switch (usrAttr.colNm) {
						case "pltKnd":	// 팔레트종류
							const pltInfo = _.find(jsonApcPltWrhsPltBxPop, {pltBxCd: rowData.pltKnd});
			    			// 단중, 단위 set
			    			rowData.pltUnitWght = parseFloat(pltInfo.cnvrsUnitWght) || 0;
			    			rowData.pltWght = gfn_apcEstmtWght(parseFloat(rowData.pltUnitWght) || 0);
			    			break;

						case "bxKnd":	// 박스종류
							const bxInfo = _.find(jsonApcBxWrhsPltBxPop, {pltBxCd: rowData.bxKnd});
			    			// 단중, 단위 set
			    			rowData.bxUnitWght = parseFloat(bxInfo.cnvrsUnitWght) || 0;
			    		case "bxQntt": // 박스수량
			    			const bxQntt = parseInt(rowData.bxQntt) || 0;
			    			rowData.bxWght = gfn_apcEstmtWght(bxQntt * (parseFloat(rowData.bxUnitWght) || 0));
			    			break;

			    		case "stdGrd":
			    		//case "jgmtGrdCd"
			    			const stdGrdInfo = [];
				    		gjsonStdGrdObjKnd.forEach((item) => {
				    			const key = popWrhsPltBx.colPrfx + item.grdKnd;
				    			stdGrdInfo.push(rowData[key]);
							});
				    		rowData.jgmtGrdCd = gStdGrdObj.getJgmtGrdCd(stdGrdInfo);
			    			break;

			    		default:
			    			break;
					}
				}

				grdWrhsPltBxPop.refresh();
		    },
		}

</script>
</html>