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
					<sbux-button id="btnSearchApc" name="btnSearchApc" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popApcSelect.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditApc" name="btnEditApc" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popApcSelect.edit"></sbux-button>
					<sbux-button id="btnCancelApc" name="btnCancelApc" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popApcSelect.cancel"></sbux-button>
					<sbux-button id="btnSaveApc" name="btnSaveApc" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popApcSelect.save" disabled></sbux-button>
					<sbux-button id="btnEndApc" name="btnEndApc" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popApcSelect.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="apc-inp-apcCd" name="apc-inp-apcCd" uitype="hidden"></sbux-input>
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
								<sbux-input id="apc-inp-apcNm" name="apc-inp-apcNm" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
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
								<span style="font-size:12px">(조회건수 <span id="apc-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdApcPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonApcItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdApcPop = null;
	var jsonApcPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popApcSelect = {
		prgrmId: 'apcPopup',
		modalId: 'modal-apcSelect',
		gridId: 'grdApcPop',
		jsonId: 'jsonApcPop',
		areaId: "sb-area-grdApcPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {

			SBUxMethod.hide('btnEditApc');
			SBUxMethod.hide('btnCancelApc');
			SBUxMethod.hide('btnSaveApc');
			SBUxMethod.attr('btnSearchApc', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			this.search();
			/*
			if (grdApcPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					//gfn_getApcList('grdApc', jsonApcItemPop),				// APC 리스트
				]);
				this.createGrid();
				this.search();
			} else {
				grdApcPop.bind('dblclick', popApcSelect.choice);
				this.search();
			}

			this.prvApcCd = _apcCd;
			*/
		},
		close: function(_apc) {
			console.log(_apc);
			console.log(this.modalId);
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

		    grdApcPop = _SBGrid.create(SBGridProperties);
		    grdApcPop.bind('beforepagechanged', this.paging);
		    grdApcPop.bind('dblclick', popApcSelect.choice);	//'popApcChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdApcPop.getRow();
			let rowData = grdApcPop.getRowData(nRow);
			popApcSelect.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdApcPop.rebuild();
	    	let pageSize = grdApcPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonApcPop.length = 0;
	    	grdApcPop.refresh();
	    	//grdApcPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	//var apcCd = SBUxMethod.get("apc-inp-apcCd");
			var apcNm = nvlScnd(SBUxMethod.get("apc-inp-apcNm"),'');

			console.log("setGrid 호출 / apcNm : " + apcNm + "/ 타입 : " + typeof(apcNm));

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectApcListPopup.do", {

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

	    		jsonApcPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const apc = {
					    apcCd 		: item.apcCd,
					    apcNm 	: item.apcNm
					}
					jsonApcPop.push(apc);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonApcPop.length > 0) {
	        		if(grdApcPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdApcPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdApcPop.rebuild();
					}else{
						grdApcPop.refresh();
					}
	        	} else {
	        		grdApcPop.setPageTotalCount(totalRecordCount);
	        		grdApcPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdApcPop.setCellDisabled(0, 0, grdApcPop.getRows() - 1, grdApcPop.getCols() - 1, false);
	        		let nRow = grdApcPop.getRows();
					grdApcPop.addRow(true);
					grdApcPop.setCellDisabled(nRow, 0, nRow, grdApcPop.getCols() - 1, true);
	        	} else {
	        		grdApcPop.setCellDisabled(0, 0, grdApcPop.getRows() - 1, grdApcPop.getCols() - 1, true);
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
	    	let recordCountPerPage = grdApcPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdApcPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popApcSelect.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey() {
		if(window.event.keyCode == 13) {
			popApcSelect.search();
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