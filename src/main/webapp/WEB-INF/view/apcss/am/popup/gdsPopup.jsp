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
					<sbux-button id="btnSearchGds" name="btnSearchGds" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popGds.search"></sbux-button>
					<sbux-button id="btnEndGds" name="btnEndGds" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popGds.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 80px">
						<col style="width: 180px">
						<col style="width: 80px">
						<col style="width: 180px">
						<col style="width: 80px">
						<col style="width: 180px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="gds-inp-apcNm" name="gds-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="gds-inp-apcCd" name="gds-inp-apcCd" uitype="hidden"></sbux-input>
							</th>
							<th scope="row"><span class="data_required"></span>품목명</th>
							<th style="border-right-style: hidden;">
								<sbux-select id="gds-slt-itemCd"
								name="gds-slt-itemCd"
								style="background-color:#ffffff;"
								uitype="single"
								jsondata-ref="jsonGdsItemCd"
								unselected-text="선택"
								class="form-control input-sm input-sm-ast inpt_data_reqed"
								onchange="fn_selectItem"></sbux-select>
							</th>
							<th scope="row">상품명</th>
							<th class="td_input">
								<sbux-input id="gds-inp-gdsNm" name="gds-inp-spmtPckgUnitNm" uitype="text" class="form-control input-sm" ></sbux-input>
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
								<span style="color: black;">상품 목록</span>
								<span style="font-size:12px">(조회건수 <span id="gds-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdGds" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var grdGds = null;
	var jsonGdsPop = [];
	var jsonGdsItemCd = [];

	/**
	 * @description 차량 선택 팝업
	 */
	const popGds = {
		prgrmId: 'gdsPopup',
		modalId: 'modal-gds',
		gridId: 'grdGds',
		jsonId: 'jsonGdsPop',
		areaId: "sb-area-grdGds",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _spmtPckgUnitNm, _callbackFnc) {
			// set param
			SBUxMethod.set("gds-inp-apcCd", _apcCd);
			SBUxMethod.set("gds-inp-apcNm", _apcNm);
			SBUxMethod.set("gds-inp-spmtPckgUnitNm", _spmtPckgUnitNm)
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdGds === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setApcItemSBSelect("gds-slt-itemCd", jsonGdsItemCd, _apcCd), 	// APC 품목(검색)
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_gds) {
			gfn_closeModal(this.modalId, this.callbackFnc, _gds);
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
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
	            {caption: ['품목'], 		ref: 'itemNm', 			width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['상품등급'], 	ref: 'gdsGrdNm', 		width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['상품명'], 	ref: 'spmtPckgUnitNm', 	width: '200px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ['브랜드'], 	ref: 'brndNm', 			width: '100px', 	type: 'output', 	style: 'text-align: center'},
	            {caption: ["판매단가"],   	ref: 'ntslUntprc',  	width: '100px',     type: 'output',		style: 'text-align:center',
	            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}}
		    ];
		    grdGds = _SBGrid.create(SBGridProperties);
		    grdGds.bind('afterpagechanged', this.paging);
		    grdGds.bind('dblclick', popGds.choice);
		},
		choice: function() {
			let nRow = grdGds.getRow();
			let rowData = grdGds.getRowData(nRow);
			popGds.close(rowData);
		},
		search: async function() {
			// set pagination
			grdGds.rebuild();
	    	let pageSize = grdGds.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonGdsPop.length = 0;
	    	await this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
	    	let apcCd = SBUxMethod.get("gds-inp-apcCd");
			let spmtPckgUnitNm = SBUxMethod.get("gds-inp-spmtPckgUnitNm");
			let itemCd = SBUxMethod.get("gds-slt-itemCd");
	        const postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtPckgUnitList.do", {
	        	apcCd				: apcCd,
	        	spmtPckgUnitNm		: spmtPckgUnitNm,
	        	itemCd				: itemCd,
	        	// pagination
		  		pagingYn 			: 'Y',
				currentPageNo 		: pageNo,
	 		  	recordCountPerPage	: pageSize
			});

	        const data = await postJsonPromise;

			try {
	    		let totalRecordCount = 0;

	    		jsonGdsPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const gds = {
						itemCd			: item.itemCd,
						itemNm 			: item.itemNm,
						vrtyCd			: item.vrtyCd,
						vrtyNm 			: item.vrtyNm,
						spcfctCd		: item.spcfctCd,
						spcfctNm 		: item.spcfctNm,
						gdsGrdNm 		: item.gdsGrdNm,
						brndNm 			: item.brndNm,
						spmtPckgUnitNm	: item.spmtPckgUnitNm,
						spmtPckgUnitCd	: item.spmtPckgUnitCd,
						ntslUntprc		: item.ntslUntprc
					}
					jsonGdsPop.push(gds);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonGdsPop.length > 0) {
	        		if(grdGds.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdGds.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdGds.rebuild();
					}else{
						grdGds.refresh();
					}
	        	} else {
	        		grdGds.setPageTotalCount(totalRecordCount);
	        		grdGds.rebuild();
	        	}

	        	grdGds.setCellDisabled(0, 0, grdGds.getRows() - 1, grdGds.getCols() - 1, true);

	        	document.querySelector('#gds-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdGds.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdGds.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popGds.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

</script>
</html>