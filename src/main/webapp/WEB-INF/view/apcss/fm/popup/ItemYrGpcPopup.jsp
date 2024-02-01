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
					<sbux-button id="btnSearchItem" name="btnSearchItem" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popYrGpcSelect.search" onkeyup="fn_gpcSelectEnterKey();"></sbux-button>
					<sbux-button id="btnEditItem" name="btnEditItem" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popYrGpcSelect.edit"></sbux-button>
					<sbux-button id="btnCancelItem" name="btnCancelItem" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popYrGpcSelect.cancel"></sbux-button>
					<sbux-button id="btnSaveItem" name="btnSaveItem" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popYrGpcSelect.save" disabled></sbux-button>
					<sbux-button id="btnEndItem" name="btnEndItem" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popYrGpcSelect.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="item-inp-itemCd" name="item-inp-itemCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<tbody>
						<tr>
							<th scope="row">품목명</th>
							<th colspan="2">
								<sbux-input id="item-inp-itemNm" name="item-inp-itemNm" uitype="text" class="form-control input-sm" onkeyenter="fn_itemSelectEnterKey"></sbux-input>
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
								<span style="color: black;">품목 목록</span>
								<span style="font-size:12px">(조회건수 <span id="yrItem-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdItemPop01" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonItemItemPop01= [];	// 대표품목 rprsItemCd	Grid

	var grdItemPop01 = null;
	var jsonItemPop01 = [];
	//팝업은 같은화면에서 작동하게 되므로 다른곳과 겹치지 않게 변수 사용할것
	var popYrGpcBrno;
	var popYrGpcYr;

	var jsonPopComCtgryCd = [];
	var jsonPopComSttgUpbrItemSe = [];
	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popYrGpcSelect = {
		prgrmId: 'yrGpcPopup',
		modalId: 'modal-yrGpcList',
		gridId: 'grdItemPop01',
		jsonId: 'jsonItemPop01',
		areaId: "sb-area-grdItemPop01",
		prvItemCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_brno,_yr,_callbackFnc) {
			console.log("========init===========");
			popYrGpcBrno = _brno;
			popYrGpcYr = _yr;
			SBUxMethod.hide('btnEditItem');
			SBUxMethod.hide('btnCancelItem');
			SBUxMethod.hide('btnSaveItem');
			SBUxMethod.attr('btnSearchItem', 'disabled', false);

			gfn_setComCdSBSelect('grdItemPop01', 	jsonPopComCtgryCd, 			'CTGRY_CD'); //분류코드
			gfn_setComCdSBSelect('grdItemPop01', 	jsonPopComSttgUpbrItemSe, 	'STTG_UPBR_ITEM_SE'); //품목구분

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
		    SBGridProperties.id = this.gridId;			//'grdItemPop01';					//'grdItemPop01';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonItemPop01';		//'jsonItemPop01';
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
		        {caption: ['품목코드'], 	ref: 'itemCd', width: '80px', type: 'input', style: 'text-align:center'},
		        {caption: ['품목명'], 		ref: 'itemNm', width: '80px', type: 'input', style: 'text-align:center'},
		        {caption: ['해당품목 선택조직'], ref: 'corpNm', width: '200px', type: 'input', style: 'text-align:center'},
		    	{caption: ["품목분류"], 		ref: 'ctgryCd',   	type:'combo',  width:'120px',    style:'text-align:center',
		    		typeinfo : {ref:'jsonPopComCtgryCd', label:'label', value:'value', displayui : false}},
		    	{caption: ["전문/육성 구분"], 	ref: 'sttgUpbrItemSe',   type:'combo',  width:'120px',    style:'text-align:center',
		    		typeinfo : {ref:'jsonPopComSttgUpbrItemSe', label:'label', value:'value', displayui : false}},
		        {caption: ['사업자번호'], 		ref: 'brno', hidden : true},
		    ];

		    grdItemPop01 = _SBGrid.create(SBGridProperties);
		    grdItemPop01.bind('beforepagechanged', this.paging);
		    grdItemPop01.bind('dblclick', popYrGpcSelect.choice);	//'popItemChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdItemPop01.getRow();
			let rowData = grdItemPop01.getRowData(nRow);
			popYrGpcSelect.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdItemPop01.rebuild();
	    	let pageSize = grdItemPop01.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonItemPop01.length = 0;
	    	grdItemPop01.refresh();
	    	//grdItemPop01.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	//var itemCd = SBUxMethod.get("item-inp-itemCd");
			var itemNm = nvlScnd(SBUxMethod.get("item-inp-itemNm"),'');

			console.log("setGrid 호출 / itemNm : " + itemNm + "/ 타입 : " + typeof(itemNm));

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectYrGpcListPopup.do", {

	        	itemNm : itemNm, //검색 파라미터
	        	brno : popYrGpcBrno,
	        	yr : popYrGpcYr,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonItemPop01.length = 0;
	        	data.resultList.forEach((item, index) => {
					const itemVal = {
							ctgryCd : item.ctgryCd,
							sttgUpbrItemSe : item.sttgUpbrItemSe,
							itemCd 	: item.itemCd,
							itemNm 	: item.itemNm,
							brno 	: item.brno,
							corpNm 	: item.corpNm
					}
					jsonItemPop01.push(itemVal);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonItemPop01.length > 0) {
	        		if(grdItemPop01.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdItemPop01.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdItemPop01.rebuild();
					}else{
						grdItemPop01.refresh();
					}
	        	} else {
	        		grdItemPop01.setPageTotalCount(totalRecordCount);
	        		grdItemPop01.rebuild();
	        	}

	        	if (isEditable) {
	        		grdItemPop01.setCellDisabled(0, 0, grdItemPop01.getRows() - 1, grdItemPop01.getCols() - 1, false);
	        		let nRow = grdItemPop01.getRows();
					grdItemPop01.addRow(true);
					grdItemPop01.setCellDisabled(nRow, 0, nRow, grdItemPop01.getCols() - 1, true);
	        	} else {
	        		grdItemPop01.setCellDisabled(0, 0, grdItemPop01.getRows() - 1, grdItemPop01.getCols() - 1, true);
	        	}

	        	document.querySelector('#yrItem-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdItemPop01.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdItemPop01.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popYrGpcSelect.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function fn_gpcSelectEnterKey() {
		if(window.event.keyCode == 13) {
			popYrGpcSelect.search();
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