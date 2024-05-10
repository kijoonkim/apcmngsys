<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : APC실적연계</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">실적연계 정보를 조회합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">버튼을 통해 실적정보수신을 요청/취소할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="apcLinkPop-btn_search" 
						name="apcLinkPop-btn_search" 
						uitype="normal" 
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popApcLink.search"
					></sbux-button>
					<sbux-button 
						id="wrhsPlt-btn-close" 
						name="wrhsPlt-btn-close" 
						uitype="normal" 
						text="종료" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popApcLink.close"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input 
									id="apcLinkPop-inp-apcCd" 
									name="apcLinkPop-inp-apcCd" 
									uitype="hidden"
								></sbux-input>
								<sbux-input 
									id="apcLinkPop-inp-apcNm" 
									name="apcLinkPop-inp-apcNm" 
									uitype="text" 
									class="form-control input-sm"
									readonly
								></sbux-input>
							</th>
							<th scope="row">연계실적</th>
							<th class="td_input">
								<sbux-select
									id="apcLinkPop-slt-linkKnd"
									name="apcLinkPop-slt-linkKnd"
									style="background-color:#ffffff;"
									uitype="single"
									jsondata-ref="jsonApcLinkPopLinkKnd"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast"
									readonly
								></sbux-select>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">연계기기 목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-apcLinkPop">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-apcLinkPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
var grdApcLinkPop = null;
var jsonApcLinkPop = [];

// 연계종류
var jsonApcLinkPopLinkKnd = [];

/**
 * @description 대형마트 발주상품정보 팝업
 */
const popApcLink = {
	prgrmId: 'apcLinkPop',
	modalId: 'modal-apcLinkPop',
	gridId: 'grdApcLinkPop',
	jsonId: 'jsonApcLinkPop',
	areaId: 'sb-area-apcLinkPop',
	prvApcCd: "",
	objGrid: null,
	saveCnt: 0,
	gridJson: [],
	objMenuList: {
		"excelDwnldPop": {
			"name": "엑셀 다운로드",						//컨텍스트메뉴에 표시될 이름
			"accesskey": "e",						//단축키
			"callback": "popApcLink.exportExcel",	//콜백함수명
		}
	},
	exportExcel: function () {
		grdApcLinkPop.exportLocalExcel(
				"APC실적연계정보", {
					bSaveLabelData: true, 
					bNullToBlank: true, 
					bSaveSubtotalValue: true, 
					bCaptionConvertBr: true, 
					arrSaveConvertText: true
				});
    },
	param: {
		apcCd: null,
		apcNm: null,
		linkKnd: null,
	},
	callbackFnc: function() {},
	init: async function(_param, _callbackFnc) {
		SBUxMethod.openModal(this.modalId);
		this.param = gfn_cloneJson(_param);
		console.log("param", this.param);
		// set param
		SBUxMethod.set("apcLinkPop-inp-apcCd", this.param.apcCd);
		SBUxMethod.set("apcLinkPop-inp-apcNm", this.param.apcNm);
		
		if (grdApcLinkPop == null) {
			await gfn_setComCdSBSelect(
						'apcLinkPop-slt-linkKnd', 
						jsonApcLinkPopLinkKnd, 
						'LINK_KND'
					);
		}
		SBUxMethod.set("apcLinkPop-slt-linkKnd", this.param.linkKnd);
		
		if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
			this.callbackFnc = _callbackFnc;
		}

		this.createGrid();
		this.search();
	},
	close: function(_apcLink) {
		gfn_closeModal(this.modalId, this.callbackFnc);
	},
	createGrid: function(/** {boolean} */ _isEditable) {
		
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
	    SBGridProperties.contextmenulist = this.objMenuList;	// 우클릭 메뉴 리스트
		
	    SBGridProperties.columns = [
	    	{
            	caption: ['기기ID'], 		
            	ref: 'trsmMatId', 			
            	width: '60px', 	
            	type: 'output', 	
            	style: 'text-align:center;'
            },
	    	{
            	caption: ['기기명'], 		
            	ref: 'trsmMatNm', 			
            	width: '120px', 	
            	type: 'output', 	
            	style: 'text-align:center;'
            },
            {
            	caption: ['통신상태'],
            	ref: 'trsmMatSttsNm', 			
            	width: '80px',
            	type: 'output', 	
            	style: 'text-align:center;',
           		renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
           			let _color = gfn_nvl(objRowData.trsmMatSttsColor, "#808080");
   					let _text = gfn_nvl(strValue, "...");
           			return '<span style="color: ' + _color + '">' + _text + '</span>'
   		    	}
            },
            {
            	caption: ['구분'],
            	ref: 'linkKndNm', 			
            	width: '60px', 	
            	type: 'output', 	
            	style: 'text-align:center;'
            },
            {
            	caption: ['요청일시'],
            	ref: 'reqDt', 			
            	width: '130px', 	
            	type: 'output', 	
            	style: 'text-align:center;'
            },
            {
            	caption: ['완료일시'],
            	ref: 'prcsCmptnDt', 			
            	width: '130px', 	
            	type: 'output', 	
            	style: 'text-align:center;'
            },
            {
            	caption: ['진행상태'],
            	ref: 'linkSttsNm', 			
            	width: '100px',
            	type: 'output', 	
            	style: 'text-align:center;',
           		renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
           			let _color = gfn_nvl(objRowData.linkSttsNmColor, "#808080");
   					let _text = gfn_nvl(strValue, "...");
           			return '<span style="color: ' + _color + '">' + _text + '</span>'
   		    	}
            },
	    	{
	    		caption: ["처리"], 			
	    		ref: 'linkStts', 			
	    		type: 'button', 
	    		width: '60px', 	
	    		style: 'text-align:center', 
	    		sortable: false,
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					
	        		switch (strValue) {
		        		case "P0":
		        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popApcLink.req(" + nRow + ")'>요청</button>";
		        			break;
		        		case "R0":
		        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popApcLink.reqCncl(" + nRow + ")'>취소</button>";
		        			break;
		        		default:
		        			return "";
	        		}
		    	}
	    	},
            {caption: ["APC코드"],	ref: 'apcCd',		type:'output',  hidden: true},
            {caption: ["연계종류"],	ref: 'linkKnd',   	type:'output',  hidden: true},
            {caption: ["연계상태"],	ref: 'linkStts',   	type:'output',  hidden: true},
            
	    ];
	    grdApcLinkPop = _SBGrid.create(SBGridProperties);
	},
	req: async function(nRow) {
		
		const rowData = grdApcLinkPop.getRowData(nRow);
		try {
    		const postJsonPromise = gfn_postJSON("/am/apc/updateLinkTrsmReq.do", 
    										{
    											apcCd: rowData.apcCd,
    											trsmMatId: rowData.trsmMatId,
    											linkKnd: rowData.linkKnd
							    			},
							    			this.prgrmId
							    		);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		this.search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
        
	},
	reqCncl: async function(nRow) {
		
		const rowData = grdApcLinkPop.getRowData(nRow);
        try {
    		const postJsonPromise = gfn_postJSON("/am/apc/updateLinkTrsmReqCncl.do",  
											{
												apcCd: rowData.apcCd,
												trsmMatId: rowData.trsmMatId,
												linkKnd: rowData.linkKnd
											},
											this.prgrmId
										);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		this.search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
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
    	// grid clear
    	jsonApcLinkPop.length = 0;
    	await this.setGrid();
    	document.querySelector('#cnt-apcLinkPop').innerText = jsonApcLinkPop.length;
	},
	setGrid: async function() {
    	const apcCd = this.param.apcCd;
    	const linkKnd = this.param.linkKnd;

		try {
	        const postJsonPromise = gfn_postJSON("/am/apc/selectApcLinkTrsmMatSttsList.do", {
	        	apcCd: apcCd,
	        	linkKnd: linkKnd
			});

	        const data = await postJsonPromise;
	        
	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
	        
	        jsonApcLinkPop.length = 0;
        	data.resultList.forEach((item, index) => {
        		jsonApcLinkPop.push(item);
			});
        	
        	grdApcLinkPop.rebuild();

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
}
</script>
</html>