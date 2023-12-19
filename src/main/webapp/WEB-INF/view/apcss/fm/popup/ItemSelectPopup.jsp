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
					<sbux-button id="btnSearchItem" name="btnSearchItem" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popItemSelect.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditItem" name="btnEditItem" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popItemSelect.edit"></sbux-button>
					<sbux-button id="btnCancelItem" name="btnCancelItem" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popItemSelect.cancel"></sbux-button>
					<sbux-button id="btnSaveItem" name="btnSaveItem" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popItemSelect.save" disabled></sbux-button>
					<sbux-button id="btnEndItem" name="btnEndItem" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popItemSelect.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="item-inp-itemCd" name="item-inp-itemCd" uitype="hidden"></sbux-input>
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
							<th scope="row">품목명</th>
							<th colspan="2">
								<sbux-input id="item-inp-itemNm" name="item-inp-itemNm" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							<th colspan="2"></th>
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
								<span style="font-size:12px">(조회건수 <span id="item-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdItemPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonItemItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdItemPop = null;
	var jsonItemPop = [];
	var itemSn;
	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popItemSelect = {
		prgrmId: 'itemPopup',
		modalId: 'modal-itemSelect',
		gridId: 'grdItemPop',
		jsonId: 'jsonItemPop',
		areaId: "sb-area-grdItemPop",
		prvItemCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_itemSn,_callbackFnc) {
			console.log("========init===========");
			itemSn = _itemSn;
			SBUxMethod.hide('btnEditItem');
			SBUxMethod.hide('btnCancelItem');
			SBUxMethod.hide('btnSaveItem');
			SBUxMethod.attr('btnSearchItem', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			this.search();

		},
		close: function(_item) {
			console.log(_item);
			console.log(this.modalId);
			gfn_closeModal(this.modalId, this.callbackFnc, _item);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdItemPop';					//'grdItemPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonItemPop';		//'jsonItemPop';
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
		        {caption: ['품목코드'], ref: 'itemCd', width: '50%', type: 'input', style: 'text-align:center'},
		        {caption: ['품목명'], ref: 'itemNm', width: '50%', type: 'input', style: 'text-align:center'}
		    ];

		    grdItemPop = _SBGrid.create(SBGridProperties);
		    grdItemPop.bind('beforepagechanged', this.paging);
		    grdItemPop.bind('dblclick', popItemSelect.choice);	//'popItemChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdItemPop.getRow();
			let rowData = grdItemPop.getRowData(nRow);
			console.log(itemSn);
			rowData.sn = itemSn;
			console.log(rowData);
			popItemSelect.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdItemPop.rebuild();
	    	let pageSize = grdItemPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonItemPop.length = 0;
	    	grdItemPop.refresh();
	    	//grdItemPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	//var itemCd = SBUxMethod.get("item-inp-itemCd");
			var itemNm = nvlScnd(SBUxMethod.get("item-inp-itemNm"),'');

			console.log("setGrid 호출 / itemNm : " + itemNm + "/ 타입 : " + typeof(itemNm));

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectItemListPopup.do", {

	        	itemNm : itemNm, //검색 파라미터
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonItemPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const itemVal = {
							itemCd 	: item.itemCd,
							itemNm 	: item.itemNm
					}
					jsonItemPop.push(itemVal);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonItemPop.length > 0) {
	        		if(grdItemPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdItemPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdItemPop.rebuild();
					}else{
						grdItemPop.refresh();
					}
	        	} else {
	        		grdItemPop.setPageTotalCount(totalRecordCount);
	        		grdItemPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdItemPop.setCellDisabled(0, 0, grdItemPop.getRows() - 1, grdItemPop.getCols() - 1, false);
	        		let nRow = grdItemPop.getRows();
					grdItemPop.addRow(true);
					grdItemPop.setCellDisabled(nRow, 0, nRow, grdItemPop.getCols() - 1, true);
	        	} else {
	        		grdItemPop.setCellDisabled(0, 0, grdItemPop.getRows() - 1, grdItemPop.getCols() - 1, true);
	        	}

	        	document.querySelector('#item-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdItemPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdItemPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popItemSelect.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey() {
		if(window.event.keyCode == 13) {
			popItemSelect.search();
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