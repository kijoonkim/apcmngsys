<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 출하지시번호 선택</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">출하지시번호를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtCmnd" name="btnSearchSpmtCmnd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSpmtCmnd.search"></sbux-button>
					<sbux-button id="btnChoiceSpmtCmnd" name="btnChoiceSpmtCmnd" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popSpmtCmnd.choice"></sbux-button>
					<sbux-button id="btnEndSpmtCmnd" name="btnEndSpmtCmnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtCmnd')"></sbux-button>
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
						<col style="width: 12%">
						<col style="width: 24%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="spmtCmnd-inp-apcCd" name="spmtCmnd-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="spmtCmnd-inp-apcNm" name="spmtCmnd-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">출하지시일자</th>
							<th class="td_input">
								<sbux-datepicker id="spmtCmnd-dtp-cmndYmd" name="spmtCmnd-dtp-cmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</th>
							<th scope="row">규격</th>
							<th>
								<sbux-select id="spmtCmnd-slt-spcfctCd" name="spmtCmnd-slt-spcfctCd" uitype="single" class="form-control input-sm" style="background-color:#FFFFFF;" jsondata-ref="jsonApcSpcfct" unselected-text="전체"></sbux-select>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="spmtCmnd-slt-itemCd"
									name="spmtCmnd-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="popSpmtCmnd.srchItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="spmtCmnd-slt-vrtyCd"
									name="spmtCmnd-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="popSpmtCmnd.srchVrtyCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th></th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdSpmtCmndPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	/* grid 내 select json */
	var jsonApcItem			= [];	// 품목 		itemCd			검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd			검색
	var jsonApcSpcfct		= [];	// 규격 		spcfct			검색

	var grdSpmtCmndPop = null;
	var regSpmtList = [];

	const popSpmtCmnd = {
		modalId: 'modal-spmtCmnd',
		gridId: 'grdSpmtCmndPop',
		jsonId: 'jsonSpmtCmndPop',
		areaId: "sb-area-grdSpmtCmndPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _spmtCmnd, _callbackChoiceFnc) {
			SBUxMethod.set("spmtCmnd-inp-apcCd", _apcCd);
			SBUxMethod.set("spmtCmnd-inp-apcNm", _apcNm);
			SBUxMethod.set("spmtCmnd-dtp-cmndYmd", gfn_dateToYmd(new Date()));
			if(!gfn_isEmpty(_spmtCmnd)){
				regSpmtList = _spmtCmnd.regSpmtList;
			}

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}

			if (grdSpmtCmndPop === null || this.prvApcCd != _apcCd) {

				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('spmtCmnd-slt-itemCd', jsonApcItem, _apcCd),								// 품목
					gfn_setApcVrtySBSelect('spmtCmnd-slt-vrtyCd', jsonApcVrty, _apcCd)								// 품종
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_spmtCmnd) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _spmtCmnd);
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
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.columns = [
		    	{caption: ['지시일자'], 	ref: 'cmndYmd', 		width: '80px',	type: 'output',	style:'text-align: center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ["출하지시번호"],	ref: 'spmtCmndnoIndct', width: '130px',	type: 'output',	style:'text-align: center'},
	            {caption: ['거래처'], 	ref: 'cnptNm', 			width: '110px',	type: 'output',	style:'text-align: center'},
	            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 		width: '100px',	type: 'output',	style:'text-align: center'},
	            {caption: ['배송처'], 	ref: 'dldtn', 			width: '120px',	type: 'output',	style:'text-align: center'},
	            {caption: ['수량'], 		ref: 'cmndQntt', 		width: '40px',	type: 'output',	style:'text-align: right',
	            	format : {type:'number', rule:'#,###'}},
	            {caption: ['중량'], 		ref: 'cmndWght', 		width: '60px',	type: 'output',	style:'text-align: right',
	            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
	            {caption: ['등급'], 		ref: 'gdsGrdNm', 		width: '50px',	type: 'output',	style:'text-align: center'},
	            {caption: ['포장단위'], 	ref: 'spmtPckgUnitNm', 	width: '140px',	type: 'output',	style:'text-align: center'},
	            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '60px',	type: 'output',	style:'text-align: center'},
	            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '60px',	type: 'output',	style:'text-align: center'},
	            {caption: ['비고'], 		ref: 'rmrk', 			width: '150px',	type: 'output'}
		    ];
		    grdSpmtCmndPop = _SBGrid.create(SBGridProperties);
		    grdSpmtCmndPop.bind('dblclick', popSpmtCmnd.choice);
		},
		choice: function() {
			let nRow = grdSpmtCmndPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdSpmtCmndPop.getRowData(nRow);
				popSpmtCmnd.close(rowData);
			}
		},
		search: async function() {
			grdSpmtCmndPop.rebuild();

	    	// grid clear
	    	jsonSpmtCmndPop.length = 0;
	    	grdSpmtCmndPop.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {
			jsonSpmtCmndPop = [];

			let apcCd = SBUxMethod.get("spmtCmnd-inp-apcCd");
			let cmndYmd = SBUxMethod.get("spmtCmnd-dtp-cmndYmd");
			let itemCd = SBUxMethod.get("spmtCmnd-slt-itemCd");
			let vrtyCd = SBUxMethod.get("spmtCmnd-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("spmtCmnd-slt-spcfctCd");
			let spmtCmnd = {
					apcCd 				: apcCd,
					cmndYmd 			: cmndYmd,
					itemCd 				: itemCd,
					vrtyCd 				: vrtyCd,
					spcfctCd 			: spcfctCd
			}
			let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", spmtCmnd);
		    let data = await postJsonPromise;

		    try{
		    	jsonSpmtCmndPop.length = 0;
		    	data.resultList.forEach((item, index) => {

		    		regSpmtQntt = 0;
		    		regSpmtWght = 0;

		    		if (!gfn_isEmpty(regSpmtList)) {
		    			for (let i=0; i<regSpmtList.length; i++) {
		    				if (regSpmtList[i].spmtCmndnoIndct == item.spmtCmndnoIndct) {
		    					regSpmtQntt = regSpmtList[i].spmtQntt;
		    					regSpmtWght = regSpmtList[i].spmtWght;
		    				}
		    			}
		    		}

		    		let cmndQntt = item.cmndQntt;
		    		let spmtQntt = item.spmtQntt;
		    		if (cmndQntt > spmtQntt) {
		    			if (item.cmndQntt > regSpmtQntt) {
							let spmtCmnd = {
									spmtCmndno		: item.spmtCmndno
								  , spmtCmndSn 		: item.spmtCmndSn
								  , spmtCmndnoIndct : item.spmtCmndnoIndct
								  ,	cmndYmd 		: item.cmndYmd
								  , cnptCd 			: item.cnptCd
								  , cnptNm 			: item.cnptNm
								  , gdsCd 			: item.gdsCd
								  , gdsNm 			: item.gdsNm
								  , trsprtCoCd 		: item.trsprtCoCd
								  , trsprtCoNm 		: item.trsprtCoNm
								  , dldtn 			: item.dldtn
								  , cmndQntt		: item.cmndQntt
								  , cmndWght 		: item.cmndWght
								  , gdsGrd 			: item.gdsGrd
								  , gdsGrdNm 		: item.gdsGrdNm
								  , spmtPckgUnitCd 	: item.spmtPckgUnitCd
								  , spmtPckgUnitNm 	: item.spmtPckgUnitNm
								  , vrtyNm 			: item.vrtyNm
								  , vrtyCd 			: item.vrtyCd
								  , spcfctCd 		: item.spcfctCd
								  , spcfctNm 		: item.spcfctNm
								  , rmrk			: item.rmrk
								  , itemCd			: item.itemCd
								  , outordrno		: item.outordrno
							}
							jsonSpmtCmndPop.push(spmtCmnd);
			    		}
		    		}
				});
	        	grdSpmtCmndPop.rebuild();
		    } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		    }
	    },
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("spmtCmnd-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('spmtCmnd-slt-vrtyCd', jsonApcVrty, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('spmtCmnd-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)			// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("spmtCmnd-inp-apcCd");
			let vrtyCd = obj.value;
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("spmtCmnd-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("spmtCmnd-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("spmtCmnd-slt-vrtyCd", vrtyCd);
			}
			gfn_setApcSpcfctsSBSelect('spmtCmnd-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)
		}
	}
</script>
</html>