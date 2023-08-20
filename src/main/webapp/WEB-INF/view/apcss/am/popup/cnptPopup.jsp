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
				<div>
					<p>
						<span style="font-weight:bold;">거래처를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchCnpt" name="btnSearchCnpt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popCnpt.search"></sbux-button>
					<sbux-button id="btnEndCnpt" name="btnEndCnpt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-cnpt')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="cnpt-inp-apcCd" name="cnpt-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="cnpt-inp-apcNm" name="cnpt-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">거래처명</th>
							<th class="td_input">
								<sbux-input id="cnpt-inp-cnptNm" name="cnpt-inp-cnptNm" uitype="text" class="form-control input-sm" onkeyenter="fn_searchCnpt()" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdCnpt" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonCnptPopUp = [];
	const popCnpt = {
		modalId: 'modal-cnpt',
		gridId: 'grdCnpt',
		jsonId: 'jsonCnptPopUp',
		areaId: "sb-area-grdCnpt",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		apcCd :"",
		cnptNm : "",
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _cnptNm, _callbackChoiceFnc) {
			this.apcCd = _apcCd;
			SBUxMethod.set("cnpt-inp-apcNm", _apcNm);
			this.cnptNm = _cnptNm;
			
			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;	
			}
			this.createGrid();
			this.search();
			this.prvApcCd = _apcCd;
		},
		close: function(_cnpt) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _cnpt);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
	 	        {caption: ['거래처명'], 		ref: 'cnptNm',		width: '150px', type: 'output', style:'text-align:center'},
	 	        {caption: ['유형'], 			ref: 'cnptTypeNm', 	width: '120px', type: 'output', style:'text-align:center'},
	 	        {caption: ['사업자번호'], 	ref: 'brno', 		width: '100px', type: 'output', style:'text-align:center'},
	 	        {caption: ['담당자'], 		ref: 'picNm',		width: '80px', 	type: 'output', style:'text-align:center'},
	 	        {caption: ['전화번호'], 		ref: 'telno', 		width: '100px', type: 'output', style:'text-align:center'},
	 	        {caption: ['비고'], 			ref: 'rmrk', 		width: '200px', type: 'output', style:'text-align:center'},
	 	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true},
	 	        {caption: ['거래처코드'], 	ref: 'cnptCd', 		hidden : true}
		    ];
		    grdCnpt = _SBGrid.create(SBGridProperties);
		    grdCnpt.bind('dblclick', popCnpt.choice);
		},
		choice: function() {
			let nRow = grdCnpt.getRow();
			let rowData = grdCnpt.getRowData(nRow);
			popCnpt.close(rowData);
		},
		
		search: async function() {
			//console.log('search');
			let apcCd = this.apcCd;
			let cnptNm = this.cnptNm;
			this.setGrid(apcCd);
		},
		setGrid: async function() {
			jsonCnptPopUp = [];
			
			let cnptNm = SBUxMethod.get("cnpt-inp-cnptNm");
			let apcCd = this.apcCd;
			let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {apcCd : apcCd, cnptNm : cnptNm});
		    let data = await postJsonPromise;                
		    
		    try{
		    	data.resultList.forEach((item, index) => {
					let cnpt = {
	 					cnptCd 		: item.cnptCd
	 				  , cnptNm 		: item.cnptNm
	 				  , cnptType 	: item.cnptType
	 				  , cnptTypeNm 	: item.cnptTypeNm
	 				  , brno 		: item.brno
	 				  , picNm 		: item.picNm
	 				  , telno 		: item.telno
	 				  , rmrk 		: item.rmrk
	 				  , delYn 		: item.delYn
	 				  , apcCd 		: item.apcCd
					}
					jsonCnptPopUp.push(cnpt);
				});
		    	grdCnpt.rebuild();
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