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
						<span style="font-weight:bold;">사업자번호를 조회합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchBrno" name="btnSearchBrno" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popBrno.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEditBrno" name="btnEditBrno" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popBrno.edit"></sbux-button>
					<sbux-button id="btnCancelBrno" name="btnCancelBrno" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popBrno.cancel"></sbux-button>
					<sbux-button id="btnSaveBrno" name="btnSaveBrno" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popBrno.save" disabled></sbux-button>
					<sbux-button id="btnEndBrno" name="btnEndBrno" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popBrno.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
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
							<th scope="row">지사</th>
							<th>
								<sbux-input id="brno-inp-jisa" name="brno-inp-jisa" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							<th scope="row">사업자번호</th>
							<th>
								<sbux-input id="brno-inp-brno" name="brno-inp-brno" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							<th scope="row">법인체명</th>
							<th>
								<sbux-input id="brno-inp-corpNm" name="brno-inp-corpNm" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
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
								<span style="color: black;">사업자번호 목록</span>
								<span style="font-size:12px">(조회건수 <span id="brno-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdBrnoPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonApcItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdBrnoPop = null;
	var jsonBrnoPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popBrno = {
		prgrmId: 'brnoPopup',
		modalId: 'modal-brno',
		gridId: 'grdBrnoPop',
		jsonId: 'jsonBrnoPop',
		areaId: "sb-area-grdBrnoPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {

			SBUxMethod.hide('btnEditBrno');
			SBUxMethod.hide('btnCancelBrno');
			SBUxMethod.hide('btnSaveBrno');
			SBUxMethod.attr('btnSearchBrno', 'disabled', false);

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
		    SBGridProperties.id = this.gridId;			//'grdBrnoPop';					//'grdBrnoPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonBrnoPop';		//'jsonBrnoPop';
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
		        {caption: ['사업자번호'], ref: 'brno', width: '300px', type: 'input', style: 'text-align:center'},
		        {caption: ['법인체명'], ref: 'corpNm', width: '300px', type: 'input', style: 'text-align:center'}
		    ];

		    grdBrnoPop = _SBGrid.create(SBGridProperties);
		    grdBrnoPop.bind('beforepagechanged', this.paging);
		    grdBrnoPop.bind('dblclick', popBrno.choice);	//'popApcChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdBrnoPop.getRow();
			let rowData = grdBrnoPop.getRowData(nRow);
			popBrno.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdBrnoPop.rebuild();
	    	let pageSize = grdBrnoPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonBrnoPop.length = 0;
	    	grdBrnoPop.refresh();
	    	//grdBrnoPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var brno = nvlScnd(SBUxMethod.get("brno-inp-brno"),'');

	        const postJsonPromise = gfn_postJSON("/fm/popup/selectBrnoList.do", {

	        	brno : brno, //검색 파라미터
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonBrnoPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const apc = {
					    brno 	: item.brno,
					    corpNm 	: item.corpNm
					}
					jsonBrnoPop.push(apc);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonBrnoPop.length > 0) {
	        		if(grdBrnoPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdBrnoPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdBrnoPop.rebuild();
					}else{
						grdBrnoPop.refresh();
					}
	        	} else {
	        		grdBrnoPop.setPageTotalCount(totalRecordCount);
	        		grdBrnoPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdBrnoPop.setCellDisabled(0, 0, grdBrnoPop.getRows() - 1, grdBrnoPop.getCols() - 1, false);
	        		let nRow = grdBrnoPop.getRows();
					grdBrnoPop.addRow(true);
					grdBrnoPop.setCellDisabled(nRow, 0, nRow, grdBrnoPop.getCols() - 1, true);
	        	} else {
	        		grdBrnoPop.setCellDisabled(0, 0, grdBrnoPop.getRows() - 1, grdBrnoPop.getCols() - 1, true);
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
	    	let recordCountPerPage = grdBrnoPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdBrnoPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popBrno.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function enterKey() {
		if(window.event.keyCode == 13) {
			popBrno.search();
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