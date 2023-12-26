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
						<span style="font-weight:bold;">경영체번호를 선택합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchMngmstInfoId" name="btnSearchMngmstInfoId" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popMngmstInfoId.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditMngmstInfoId" name="btnEditMngmstInfoId" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popMngmstInfoId.edit"></sbux-button>
					<sbux-button id="btnCancelMngmstInfoId" name="btnCancelMngmstInfoId" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popMngmstInfoId.cancel"></sbux-button>
					<sbux-button id="btnSaveMngmstInfoId" name="btnSaveMngmstInfoId" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popMngmstInfoId.save" disabled></sbux-button>
					<sbux-button id="btnEndMngmstInfoId" name="btnEndMngmstInfoId" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popMngmstInfoId.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="mngmstInfoId-inp-apcCd" name="mngmstInfoId-inp-apcCd" uitype="hidden"></sbux-input>
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
							<th scope="row">법인명</th>
							<th>
								<sbux-input id="mngmstInfoId-inp-corpNm" name="mngmstInfoId-inp-corpNm" uitype="text" class="form-control input-sm" onkeyenter="fn_mngmstInfoIdEnterKey"></sbux-input>
							</th>
							<th scope="row">법인등록번호</th>
							<th>
								<sbux-input id="mngmstInfoId-inp-brno" name="mngmstInfoId-inp-brno" uitype="text" class="form-control input-sm" onkeyenter="fn_mngmstInfoIdEnterKey"></sbux-input>
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
								<span style="color: black;">경영체조회 목록</span>
								<span style="font-size:12px">(조회건수 <span id="mngmstInfoId-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdMngmstInfoIdPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonApcItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdMngmstInfoIdPop = null;
	var jsonMngmstInfoIdPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popMngmstInfoId = {
		prgrmId: 'MngmstInfoIdPopup',
		modalId: 'modal-mngmstInfoId',
		gridId: 'grdMngmstInfoIdPop',
		jsonId: 'jsonMngmstInfoIdPop',
		areaId: "sb-area-grdMngmstInfoIdPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {

			SBUxMethod.hide('btnEditMngmstInfoId');
			SBUxMethod.hide('btnCancelMngmstInfoId');
			SBUxMethod.hide('btnSaveMngmstInfoId');
			SBUxMethod.attr('btnSearchMngmstInfoId', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			this.search();

		},
		close: function(_apc) {
			console.log(_apc);
			console.log(this.modalId);
			gfn_closeModal(this.modalId, this.callbackFnc, _apc);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdMngmstInfoIdPop';					//'grdMngmstInfoIdPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonMngmstInfoIdPop';		//'jsonMngmstInfoIdPop';
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
		        {caption: ['경영체(법인)명'], ref: 'admstOwnrCorpNm', width: '100px', type: 'input', style: 'text-align:center'},
		        {caption: ['주민(법인)번호'], ref: 'brno', width: '100px', type: 'input', style: 'text-align:center'},
		        {caption: ['경영체번호'], ref: 'mngmstRegno', width: '100px', type: 'input', style: 'text-align:center'},
		        {caption: ['경영주'], ref: 'rprsvNm', width: '100px', type: 'input', style: 'text-align:center'},
		        {caption: ['지번주소'], ref: 'rprsvAddr', width: '100px', type: 'input', style: 'text-align:center'}
		    ];

		    grdMngmstInfoIdPop = _SBGrid.create(SBGridProperties);
		    grdMngmstInfoIdPop.bind('beforepagechanged', this.paging);
		    grdMngmstInfoIdPop.bind('dblclick', popMngmstInfoId.choice);	//'popApcChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdMngmstInfoIdPop.getRow();
			let rowData = grdMngmstInfoIdPop.getRowData(nRow);
			popMngmstInfoId.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdMngmstInfoIdPop.rebuild();
	    	let pageSize = grdMngmstInfoIdPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonMngmstInfoIdPop.length = 0;
	    	grdMngmstInfoIdPop.refresh();
	    	//grdMngmstInfoIdPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var corpNm = nvlScnd(SBUxMethod.get("mngmstInfoId-inp-corpNm"),'');
			var crno = nvlScnd(SBUxMethod.get("mngmstInfoId-inp-crno"),'');

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectMngmstInfoIdList.do", {

	        	corpNm : corpNm, //검색 파라미터
	        	brno : brno,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonMngmstInfoIdPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const mngmstInfoId = {
							rprsvNm 			: item.rprsvNm,
							rprsvAddr 			: item.rprsvAddr,
							admstOwnrCorpNm 	: item.admstOwnrCorpNm,
							brno 				: item.brno,
							mngmstRegno 		: item.mngmstRegno,
					}
					jsonMngmstInfoIdPop.push(mngmstInfoId);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonMngmstInfoIdPop.length > 0) {
	        		if(grdMngmstInfoIdPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdMngmstInfoIdPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdMngmstInfoIdPop.rebuild();
					}else{
						grdMngmstInfoIdPop.refresh();
					}
	        	} else {
	        		grdMngmstInfoIdPop.setPageTotalCount(totalRecordCount);
	        		grdMngmstInfoIdPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdMngmstInfoIdPop.setCellDisabled(0, 0, grdMngmstInfoIdPop.getRows() - 1, grdMngmstInfoIdPop.getCols() - 1, false);
	        		let nRow = grdMngmstInfoIdPop.getRows();
					grdMngmstInfoIdPop.addRow(true);
					grdMngmstInfoIdPop.setCellDisabled(nRow, 0, nRow, grdMngmstInfoIdPop.getCols() - 1, true);
	        	} else {
	        		grdMngmstInfoIdPop.setCellDisabled(0, 0, grdMngmstInfoIdPop.getRows() - 1, grdMngmstInfoIdPop.getCols() - 1, true);
	        	}

	        	document.querySelector('#mngmstInfoId-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdMngmstInfoIdPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdMngmstInfoIdPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popMngmstInfoId.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function fn_mngmstInfoIdEnterKey() {
		if(window.event.keyCode == 13) {
			popMngmstInfoId.search();
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