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
						<span style="font-weight:bold;">출하지시번호를 선택합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtCmndno" name="btnSearchSpmtCmndno" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSpmtCmndno.search"></sbux-button>
					<sbux-button id="btnEndSpmtCmndno" name="btnEndSpmtCmndno" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popSpmtCmndno.close"></sbux-button>
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
								<sbux-input id="spmtCmndno-inp-apcNm" name="spmtCmndno-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="spmtCmndno-inp-apcCd" name="spmtCmndno-inp-apcCd" uitype="hidden"></sbux-input>
							</th>
							<th scope="row">출하지시일자</th>
							<th>
								<sbux-datepicker id="spmtCmndno-dtp-cmndYmd" name="spmtCmndno-dtp-cmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</th>
							<th scope="row">포장구분</th>
							<th class="td_input">
								<sbux-select id="spmtCmndno-slt-pckgSeCd" name="spmtCmndno-slt-pckgSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComPckgSeCd"></sbux-select>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="spmtCmndno-slt-itemCd"
									name="spmtCmndno-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="popSpmtCmndno.srchItemCd(this)"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="spmtCmndno-slt-vrtyCd"
									name="spmtCmndno-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="popSpmtCmndno.srchVrtyCd(this)"
								/>
							</th>
							<th scope="row">규격</th>
							<th class="td_input">
								<sbux-select id="spmtCmndno-slt-spcfctCd" name="spmtCmndno-slt-spcfctCd" uitype="single" jsondata-ref="jsonApcSpcfct" class="form-control input-sm" unselected-text="선택"></sbux-select>
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
								<span style="color: black;">출하지시번호 목록</span>
								<span style="font-size:12px">(조회건수 <span id="spmtCmndno-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdSpmtCmndno" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcSpcfct		= [];	// 규격 		spcfct		검색
	var jsonComPckgSeCd		= [];	// 포장구분 	pckgSeCd	검색

	var grdSpmtCmndno = null;
	var jsonSpmtCmndnoPop = [];

	/**
	 * @description 차량 선택 팝업
	 */
	const popSpmtCmndno = {
		prgrmId: 'spmtCmndnoPopup',
		modalId: 'modal-spmtCmndno',
		gridId: 'grdSpmtCmndno',
		jsonId: 'jsonSpmtCmndnoPop',
		areaId: "sb-area-grdSpmtCmndno",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc) {
			// set param
			SBUxMethod.set("spmtCmndno-inp-apcCd", _apcCd);
			SBUxMethod.set("spmtCmndno-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdSpmtCmndno === null || this.prvApcCd != _apcCd) {
				SBUxMethod.set("spmtCmndno-dtp-cmndYmd", gfn_dateToYmd(new Date()));
				
				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('spmtCmndno-slt-itemCd', jsonApcItem, _apcCd),					// 품목
					gfn_setApcVrtySBSelect('spmtCmndno-slt-vrtyCd', jsonApcVrty, _apcCd),					// 품종
					gfn_setApcSpcfctsSBSelect('spmtCmndno-slt-spcfctCd', jsonApcSpcfct, _apcCd),			// 규격
					gfn_setComCdSBSelect('spmtCmndno-slt-pckgSeCd', jsonComPckgSeCd, 'PCKG_SE_CD', _apcCd)	// 포장구분
				]);
				this.createGrid();
				//this.search();
			} else {
				//this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_spmtCmndno) {
			gfn_closeModal(this.modalId, this.callbackFnc, _spmtCmndno);
		},
		createGrid: function() {
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
			SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		    	{caption: ['출하지시일자'], ref: 'cmndYmd', 	width: '100px',		type: 'output', 	style: 'text-align: center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	            {caption: ['거래처'],		ref: 'cnptNm', 		width: '120px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '80px', 		type: 'output', 	style: 'text-align: center'},
	            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '80px', 		type: 'output', 	style: 'text-align: center'},
	            {caption: ['상품'], 		ref: 'gdsNm', 		width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['등급'], 		ref: 'grdNm', 		width: '80px', 		type: 'output', 	style: 'text-align: center'},
	            {caption: ['수량'], 		ref: 'cmndQntt', 	width: '80px', 		type: 'output', 	style: 'text-align: center',
	            	format : {type:'number', rule:'#,###'}},
	            {caption: ['중량'], 		ref: 'cmndWght',		width: '80px', 	type: 'output', 	style: 'text-align: right',
	    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
	            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 	width: '180px', 	type: 'output',		style: 'text-align: center'},
	            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['배송처'], 	ref: 'dldtn', 		width: '150px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['운임비용'], 	ref: 'trsprtCst', 	width: '100px', 	type: 'output', 	style: 'text-align: center',
	    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
	            {caption: ['포장구분'], 	ref: 'pckgSe',		width: '150px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['거래처코드'], 	ref: 'cnptCd',		hidden: true},
	            {caption: ['품종코드'], 	ref: 'vrtyCd',		hidden: true},
	            {caption: ['규격코드'], 	ref: 'spcfctCd',	hidden: true},
	            {caption: ['상품코드'], 	ref: 'gdsCd',		hidden: true},
	            {caption: ['등급코드'], 	ref: 'gdsGrd',		hidden: true},
	            {caption: ['운송회사코드'],	ref: 'trsprtCoCd',	hidden: true},
	            {caption: ['포장구분코드'],	ref: 'pckgSeCd',	hidden: true},
		    ];
		    grdSpmtCmndno = _SBGrid.create(SBGridProperties);
		    grdSpmtCmndno.bind('dblclick', popSpmtCmndno.choice);
		},
		choice: function() {
			let nRow = grdSpmtCmndno.getRow();
			let rowData = grdSpmtCmndno.getRowData(nRow);
			popSpmtCmndno.close(rowData);
		},
		search: async function() {
			// set pagination
			grdSpmtCmndno.rebuild();
	    	let pageSize = grdSpmtCmndno.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonSpmtCmndnoPop.length = 0;
	    	//grdSpmtCmndno.refresh();
	    	//grdSpmtCmndno.clearStatus();
	    	await this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {

	    	let apcCd = SBUxMethod.get("spmtCmndno-inp-apcCd");
			let cmndYmd = SBUxMethod.get("spmtCmndno-dtp-cmndYmd");
			let itemCd = SBUxMethod.get("spmtCmndno-slt-itemCd");
			let vrtyCd = SBUxMethod.get("spmtCmndno-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("spmtCmndno-slt-spcfctCd");
			let pckgSeCd = SBUxMethod.get("spmtCmndno-slt-pckgSeCd");

	        const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", {
	        	apcCd				: apcCd,
	        	cmndYmd				: cmndYmd,
	        	itemCd				: itemCd,
	        	vrtyCd				: vrtyCd,
	        	spcfctCd			: spcfctCd,
	        	pckgSeCd			: pckgSeCd,
	        	// pagination
		  		pagingYn 			: 'Y',
				currentPageNo 		: pageNo,
	 		  	recordCountPerPage	: pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonSpmtCmndnoPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const spmtCmndno = {
						cmndYmd		: item.cmndYmd,
						cnptNm 		: item.cnptNm,
						vrtyNm 		: item.vrtyNm,
						spcfctNm 	: item.spcfctNm,
						gdsNm 		: item.gdsNm,
						grdNm 		: item.grdNm,
						cmndQntt 	: item.cmndQntt,
						cmndWght 	: item.cmndWght,
						trsprtCoNm	: item.trsprtCoNm,
						vhclno		: item.vhclno,
						dldtn		: item.dldtn,
						trsprtCst	: item.trsprtCst,
						pckgSe		: item.pckgSe,
						cnptCd		: item.cnptCd,
						vrtyCd		: item.vrtyCd,
						spcfctCd	: item.spcfctCd,
						gdsCd		: item.gdsCd,
						gdsGrd		: item.gdsGrd,
						trsprtCoCd	: item.trsprtCoCd,
						pckgSeCd	: item.pckgSeCd,
					}
					jsonSpmtCmndnoPop.push(spmtCmndno);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonSpmtCmndnoPop.length > 0) {
	        		if(grdSpmtCmndno.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdSpmtCmndno.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdSpmtCmndno.rebuild();
					}else{
						grdSpmtCmndno.refresh();
					}
	        	} else {
	        		grdSpmtCmndno.setPageTotalCount(totalRecordCount);
	        		grdSpmtCmndno.rebuild();
	        	}

	        	grdSpmtCmndno.setCellDisabled(0, 0, grdSpmtCmndno.getRows() - 1, grdSpmtCmndno.getCols() - 1, true);

	        	document.querySelector('#spmtCmndno-pop-cnt').innerText = totalRecordCount;

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
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("spmtCmndno-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('spmtCmndno-slt-vrtyCd', jsonApcVrty, apcCd, itemCd),		// 품종
				gfn_setApcSpcfctsSBSelect('spmtCmndno-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)	// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
			let vrtyCd = obj.value;
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("spmtCmndno-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("spmtCmndno-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("spmtCmndno-slt-vrtyCd", vrtyCd);
			}
		}
	}

</script>
</html>