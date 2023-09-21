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
						<span style="font-weight:bold;">APC명을 선택합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchApc4" name="btnSearchApc4" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popApc4.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditApc4" name="btnEditApc4" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popApc4.edit"></sbux-button>
					<sbux-button id="btnCancelApc4" name="btnCancelApc4" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popApc4.cancel"></sbux-button>
					<sbux-button id="btnSaveApc4" name="btnSaveApc4" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popApc4.save" disabled></sbux-button>
					<sbux-button id="btnEndApc4" name="btnEndApc4" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popApc4.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="apc-inp-apcCd4" name="apc-inp-apcCd4" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="apc-inp-apcNm4" name="apc-inp-apcNm4" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							<th colspan="3"></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">APC 목록</span>
								<span style="font-size:12px">(조회건수 <span id="apc-pop-cnt4">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdApcPop4" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonApcItemPop			= [];	// 대표품목 rprsItemCd	Grid

	var grdApcPop4 = null;
	var jsonApcPop4 = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popApc4 = {
		prgrmId: 'apcPopup4',
		modalId: 'modal-apc4',
		gridId: 'grdApcPop4',
		jsonId: 'jsonApcPop4',
		areaId: "sb-area-grdApcPop4",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc) {

			// set param
			SBUxMethod.set("apc-inp-apcCd4", _apcCd);
			SBUxMethod.set("apc-inp-apcNm4", _apcNm);

			SBUxMethod.hide('btnEditApc4');
			SBUxMethod.hide('btnCancelApc4');
			SBUxMethod.hide('btnSaveApc4');
			SBUxMethod.attr('btnSearchApc4', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdApcPop4 === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					//gfn_getApcList('grdApc', jsonApcItemPop),				// APC 리스트
				]);
				this.createGrid();
				this.search();
			} else {
				grdApcPop4.bind('dblclick', popApc4.choice);
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_apc) {
			gfn_closeModal(this.modalId, this.callbackFnc, _apc);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdApcPop';					//'grdApcPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonApcPop';		//'jsonApcPop';
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
		        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
		        {caption: ['APC명'], ref: 'apcNm', width: '500px', type: 'input', style: 'text-align:center'},
		    ];

		    grdApcPop4 = _SBGrid.create(SBGridProperties);
		    grdApcPop4.bind('beforepagechanged', this.paging);
		    grdApcPop4.bind('dblclick', popApc4.choice);	//'popApcChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdApcPop4.getRow();
			let rowData = grdApcPop4.getRowData(nRow);
			popApc4.close(rowData);
		},
		edit: async function() {

			SBUxMethod.hide('btnEditApc4');
			SBUxMethod.show('btnCancelApc4');
			SBUxMethod.attr('btnSaveApc4', 'disabled', false);
			SBUxMethod.attr('btnSearchApc4', 'disabled', true);

			this.createGrid(true);
			grdApcPop4.rebuild();
			grdApcPop4.setCellDisabled(0, 0, grdApcPop4.getRows() - 1, grdApcPop4.getCols() - 1, false);

			let nRow = grdApcPop4.getRows();
			grdApcPop4.addRow(true);
			grdApcPop4.setCellDisabled(nRow, 0, nRow, grdApcPop4.getCols() - 1, true);
			grdApcPop4.unbind('dblclick');
		},
		cancel: function() {

			SBUxMethod.show('btnEditApc4');
			SBUxMethod.hide('btnCancelApc4');
			SBUxMethod.attr('btnSaveApc4', 'disabled', true);
			SBUxMethod.attr('btnSearchApc4', 'disabled', false);

			this.createGrid();
			this.search();
		},
		/**
		 * @param {number} nRow
		 * @param {number} nCol
		 */
		add: function(nRow, nCol) {
			grdApcPop4.setCellData(nRow, nCol, "N", true);
			grdApcPop4.setCellDisabled(nRow, 0, nRow, grdApcPop4.getCols() - 1, false);
			nRow++;
			grdApcPop4.addRow(true);
			grdApcPop4.setCellDisabled(nRow, 0, nRow, grdApcPop4.getCols() - 1, false);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("apc-inp-apcCd");
			const rowSts = grdApcPop4.getRowStatus(nRow);
			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdApcPop4.getRowData(nRow);
				const apcVO = {
					apcCd: apcCd,
					apcNm: rowData.apcNm
				}
				const postJsonPromise = gfn_postJSON("/am/cmns/deleteApc.do", {
					apcCd: apcCd,
					apcNm: rowData.apcNm
				}, this.prgrmId);	// 프로그램id 추가

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.search(true);
		        	} else {
		        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        	}
		        } catch(e) {
		        }
        	} else {
        		grdApcPop4.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("apc-inp-apcCd4");
			let allData = grdApcPop4.getGridDataAll();
			let insertList = [];
			let updateList = [];
			let insertCnt = 0;
			let updateCnt = 0;

			const apcList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdApcPop4.getRowData(i);
				const rowSts = grdApcPop4.getRowStatus(i);

				if (rowData.delYn !== "N") {
					continue;
				}

				if (gfn_isEmpty(rowData.apcNm)){
					gfn_comAlert("W0002", "생산자명");		//	W0002	{0}을/를 입력하세요.
		            return;
				}

				if (rowSts === 3){
					rowData.apcCd = apcCd;
					rowData.rowSts = "I";
					apcList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					apcList.push(rowData);
				} else {
					continue;
				}
			}

			if (apcList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiApcList.do", apcList, this.prgrmId);	// 프로그램id 추가

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.search(true);
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	        }

		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdApcPop4.rebuild();
	    	let pageSize = grdApcPop4.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonApcPop4.length = 0;
	    	grdApcPop4.refresh();
	    	//grdApcPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	var apcCd = SBUxMethod.get("apc-inp-apcCd4");
			var apcNm = nvlScnd(SBUxMethod.get("apc-inp-apcNm4"),'');

			console.log("setGrid 호출 / apcNm : " + apcNm + "/ 타입 : " + typeof(apcNm));

	        const postJsonPromise = gfn_postJSON("/fm/clt/selectApcListPopup.do", {

	        	apcNm : apcNm, //검색 파라미터
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonApcPop4.length = 0;
	        	data.resultList.forEach((item, index) => {
					const apc = {
					    apcCd 		: item.apcCd,
					    apcNm 	: item.apcNm
					}
					jsonApcPop4.push(apc);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonApcPop4.length > 0) {
	        		if(grdApcPop4.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdApcPop4.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdApcPop4.rebuild();
					}else{
						grdApcPop4.refresh();
					}
	        	} else {
	        		grdApcPop4.setPageTotalCount(totalRecordCount);
	        		grdApcPop4.rebuild();
	        	}

	        	if (isEditable) {
	        		grdApcPop4.setCellDisabled(0, 0, grdApcPop4.getRows() - 1, grdApcPop4.getCols() - 1, false);
	        		let nRow = grdApcPop4.getRows();
					grdApcPop4.addRow(true);
					grdApcPop4.setCellDisabled(nRow, 0, nRow, grdApcPop4.getCols() - 1, true);
	        	} else {
	        		grdApcPop4.setCellDisabled(0, 0, grdApcPop4.getRows() - 1, grdApcPop4.getCols() - 1, true);
	        	}

	        	document.querySelector('#apc-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdApcPop4.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdApcPop4.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popApc4.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey() {
		if(window.event.keyCode == 13) {
			popApc4.search();
		}
	}

	//null 체크
function nvlScnd(str, defaultStr){

       if(typeof str == "undefined" || str == null || str == "" || str == "null")
           str = defaultStr ;

       return str ;
   }



</script>
</html>