<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">APC명을 선택합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchApc3" name="btnSearchApc3" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popApc3.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditApc3" name="btnEditApc3" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popApc3.edit"></sbux-button>
					<sbux-button id="btnCancelApc3" name="btnCancelApc3" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popApc3.cancel"></sbux-button>
					<sbux-button id="btnSaveApc3" name="btnSaveApc3" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popApc3.save" disabled></sbux-button>
					<sbux-button id="btnEndApc3" name="btnEndApc3" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popApc3.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="apc-inp-apcCd3" name="apc-inp-apcCd3" uitype="hidden"></sbux-input>
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
								<sbux-input id="apc-inp-apcNm3" name="apc-inp-apcNm3" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
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
								<span style="font-size:12px">(조회건수 <span id="apc-pop-cnt3">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdApcPop3" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonApcItemPop			= [];	// 대표품목 rprsItemCd	Grid

	var grdApcPop3 = null;
	var jsonApcPop3 = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popApc3 = {
		prgrmId: 'apcPopup3',
		modalId: 'modal-apc3',
		gridId: 'grdApcPop3',
		jsonId: 'jsonApcPop3',
		areaId: "sb-area-grdApcPop3",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc) {

			// set param
			SBUxMethod.set("apc-inp-apcCd3", _apcCd);
			SBUxMethod.set("apc-inp-apcNm3", _apcNm);

			SBUxMethod.hide('btnEditApc3');
			SBUxMethod.hide('btnCancelApc3');
			SBUxMethod.hide('btnSaveApc3');
			SBUxMethod.attr('btnSearchApc3', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdApcPop3 === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					//gfn_getApcList('grdApc', jsonApcItemPop),				// APC 리스트
				]);
				this.createGrid();
				this.search();
			} else {
				grdApcPop3.bind('dblclick', popApc3.choice);
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

		    grdApcPop3 = _SBGrid.create(SBGridProperties);
		    grdApcPop3.bind('beforepagechanged', this.paging);
		    grdApcPop3.bind('dblclick', popApc3.choice);	//'popApcChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdApcPop3.getRow();
			let rowData = grdApcPop3.getRowData(nRow);
			popApc3.close(rowData);
		},
		edit: async function() {

			SBUxMethod.hide('btnEditApc3');
			SBUxMethod.show('btnCancelApc3');
			SBUxMethod.attr('btnSaveApc3', 'disabled', false);
			SBUxMethod.attr('btnSearchApc3', 'disabled', true);

			this.createGrid(true);
			grdApcPop3.rebuild();
			grdApcPop3.setCellDisabled(0, 0, grdApcPop3.getRows() - 1, grdApcPop3.getCols() - 1, false);

			let nRow = grdApcPop3.getRows();
			grdApcPop3.addRow(true);
			grdApcPop3.setCellDisabled(nRow, 0, nRow, grdApcPop3.getCols() - 1, true);
			grdApcPop3.unbind('dblclick');
		},
		cancel: function() {

			SBUxMethod.show('btnEditApc3');
			SBUxMethod.hide('btnCancelApc3');
			SBUxMethod.attr('btnSaveApc3', 'disabled', true);
			SBUxMethod.attr('btnSearchApc3', 'disabled', false);

			this.createGrid();
			this.search();
		},
		/**
		 * @param {number} nRow
		 * @param {number} nCol
		 */
		add: function(nRow, nCol) {
			grdApcPop3.setCellData(nRow, nCol, "N", true);
			grdApcPop3.setCellDisabled(nRow, 0, nRow, grdApcPop3.getCols() - 1, false);
			nRow++;
			grdApcPop3.addRow(true);
			grdApcPop3.setCellDisabled(nRow, 0, nRow, grdApcPop3.getCols() - 1, false);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("apc-inp-apcCd");
			const rowSts = grdApcPop3.getRowStatus(nRow);
			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdApcPop3.getRowData(nRow);
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
        		grdApcPop3.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("apc-inp-apcCd3");
			let allData = grdApcPop3.getGridDataAll();
			let insertList = [];
			let updateList = [];
			let insertCnt = 0;
			let updateCnt = 0;

			const apcList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdApcPop3.getRowData(i);
				const rowSts = grdApcPop3.getRowStatus(i);

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
			grdApcPop3.rebuild();
	    	let pageSize = grdApcPop3.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonApcPop3.length = 0;
	    	grdApcPop3.refresh();
	    	//grdApcPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	var apcCd = SBUxMethod.get("apc-inp-apcCd3");
			var apcNm = nvlScnd(SBUxMethod.get("apc-inp-apcNm3"),'');

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

	    		jsonApcPop3.length = 0;
	        	data.resultList.forEach((item, index) => {
					const apc = {
					    apcCd 		: item.apcCd,
					    apcNm 	: item.apcNm
					}
					jsonApcPop3.push(apc);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonApcPop3.length > 0) {
	        		if(grdApcPop3.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdApcPop3.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdApcPop3.rebuild();
					}else{
						grdApcPop3.refresh();
					}
	        	} else {
	        		grdApcPop3.setPageTotalCount(totalRecordCount);
	        		grdApcPop3.rebuild();
	        	}

	        	if (isEditable) {
	        		grdApcPop3.setCellDisabled(0, 0, grdApcPop3.getRows() - 1, grdApcPop3.getCols() - 1, false);
	        		let nRow = grdApcPop3.getRows();
					grdApcPop3.addRow(true);
					grdApcPop3.setCellDisabled(nRow, 0, nRow, grdApcPop3.getCols() - 1, true);
	        	} else {
	        		grdApcPop3.setCellDisabled(0, 0, grdApcPop3.getRows() - 1, grdApcPop3.getCols() - 1, true);
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
	    	let recordCountPerPage = grdApcPop3.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdApcPop3.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popApc3.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey() {
		if(window.event.keyCode == 13) {
			popApc3.search();
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