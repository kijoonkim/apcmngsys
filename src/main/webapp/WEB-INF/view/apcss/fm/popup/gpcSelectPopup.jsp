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
						<span style="font-weight:bold;">품목을 선택합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchGpc" name="btnSearchGpc" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popGpcSelect.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditGpc" name="btnEditGpc" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popGpcSelect.edit"></sbux-button>
					<sbux-button id="btnCancelGpc" name="btnCancelGpc" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popGpcSelect.cancel"></sbux-button>
					<sbux-button id="btnSaveGpc" name="btnSaveGpc" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popGpcSelect.save" disabled></sbux-button>
					<sbux-button id="btnEndGpc" name="btnEndGpc" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popGpcSelect.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="gpc-inp-gpcCd" name="gpc-inp-gpcCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<tbody>
						<tr>
							<!--
							<th scope="row">분류</th>
							<th>
								<sbux-input id="gpc-inp-gpcNm" name="gpc-inp-gpcNm" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							 -->
							<th scope="row">품목</th>
							<th>
								<sbux-input id="gpc-inp-itemNm" name="gpc-inp-itemNm" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">품목 목록</span>
								<span style="font-size:12px">(조회건수 <span id="gpc-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdGpcPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonGpcItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdGpcPop = null;
	var jsonGpcPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popGpcSelect = {
		prgrmId: 'gpcPopup',
		modalId: 'modal-gpcList',
		gridId: 'grdGpcPop',
		jsonId: 'jsonGpcPop',
		areaId: "sb-area-grdGpcPop",
		prvGpcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {

			SBUxMethod.hide('btnEditGpc');
			SBUxMethod.hide('btnCancelGpc');
			SBUxMethod.hide('btnSaveGpc');
			SBUxMethod.attr('btnSearchGpc', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			this.search();
			/*
			if (grdGpcPop === null || this.prvGpcCd != _gpcCd) {
				let rst = await Promise.all([
					//gfn_getGpcList('grdGpc', jsonGpcItemPop),				// APC 리스트
				]);
				this.createGrid();
				this.search();
			} else {
				grdGpcPop.bind('dblclick', popGpcSelect.choice);
				this.search();
			}

			this.prvGpcCd = _gpcCd;
			*/
		},
		close: function(_gpc) {
			console.log(_gpc);
			console.log(this.modalId);
			gfn_closeModal(this.modalId, this.callbackFnc, _gpc);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdGpcPop';					//'grdGpcPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonGpcPop';		//'jsonGpcPop';
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
		        {caption: ['분류코드'], 	ref: 'ctgryCd', hidden : true},
		        {caption: ['분류명'], 	ref: 'ctgryNm', hidden : true},
		        /*
		        {caption: ['분류명'], 	ref: 'ctgryNm', width: '200px', type: 'input', style: 'text-align:center'},
		        */
		        {caption: ['품목코드'], 	ref: 'itemCd', 	hidden : true},
		        {caption: ['품목명'], 	ref: 'itemNm', 	width: '200px', type: 'input', style: 'text-align:center'},
		        /*
		        {caption: ['비고'], 		ref: 'rmrk', 	width: '500px', type: 'input', style: 'text-align:center'},
		        */
		    ];

		    grdGpcPop = _SBGrid.create(SBGridProperties);
		    grdGpcPop.bind('beforepagechanged', this.paging);
		    grdGpcPop.bind('dblclick', popGpcSelect.choice);	//'popGpcChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdGpcPop.getRow();
			let rowData = grdGpcPop.getRowData(nRow);
			popGpcSelect.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdGpcPop.rebuild();
	    	let pageSize = grdGpcPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonGpcPop.length = 0;
	    	grdGpcPop.refresh();
	    	//grdGpcPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	//var gpcCd = SBUxMethod.get("gpc-inp-gpcCd");
			//var gpcNm = nvlScnd(SBUxMethod.get("gpc-inp-gpcNm"),'');
			var itemNm = SBUxMethod.get("gpc-inp-itemNm");

			//console.log("setGrid 호출 / gpcNm : " + gpcNm + "/ 타입 : " + typeof(gpcNm));

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectGpcListPopup.do", {

	        	//gpcNm : gpcNm, //검색 파라미터
	        	itemNm : itemNm,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonGpcPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const gpc = {
							ctgryCd : item.ctgryCd,
							ctgryNm : item.ctgryNm,
							itemCd 	: item.itemCd,
							itemNm 	: item.itemNm
							//rmrk 	: item.rmrk
					}
					jsonGpcPop.push(gpc);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonGpcPop.length > 0) {
	        		if(grdGpcPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdGpcPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdGpcPop.rebuild();
					}else{
						grdGpcPop.refresh();
					}
	        	} else {
	        		grdGpcPop.setPageTotalCount(totalRecordCount);
	        		grdGpcPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdGpcPop.setCellDisabled(0, 0, grdGpcPop.getRows() - 1, grdGpcPop.getCols() - 1, false);
	        		let nRow = grdGpcPop.getRows();
					grdGpcPop.addRow(true);
					grdGpcPop.setCellDisabled(nRow, 0, nRow, grdGpcPop.getCols() - 1, true);
	        	} else {
	        		grdGpcPop.setCellDisabled(0, 0, grdGpcPop.getRows() - 1, grdGpcPop.getCols() - 1, true);
	        	}

	        	document.querySelector('#gpc-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdGpcPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdGpcPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popGpcSelect.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey() {
		if(window.event.keyCode == 13) {
			popGpcSelect.search();
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