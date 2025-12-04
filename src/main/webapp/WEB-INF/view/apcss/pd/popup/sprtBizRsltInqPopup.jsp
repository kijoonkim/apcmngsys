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
				<div style="margin-left: auto;">
					<sbux-button id="btnClsSprtBizRsltInqPopup" name="btnClsSprtBizRsltInqPopup" uitype="normal" text="초기화" class="btn btn-sm btn-primary" onclick="popSprtBizRsltInq.reset"></sbux-button>
					<sbux-button id="btnSrchSprtBizRsltInqPopup" name="btnSearchSprtBizRsltInqPopup" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSprtBizRsltInq.search" onkeyup="enterKey();"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="sprtBizRsltInqPopup-inp-apcCd" name="sprtBizRsltInqPopup-inp-apcCd" uitype="hidden"></sbux-input>
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
								<sbux-input id="sprtBizRsltInqPopup-inp-bzmnConm" name="sprtBizRsltInqPopup-inp-bzmnConm" uitype="text" class="form-control input-sm" onkeyenter="fn_sprtBizRsltInqEnterKey"></sbux-input>
							</th>
							<th scope="row">사업자번호</th>
							<th>
								<sbux-input id="sprtBizRsltInqPopup-inp-brno" name="sprtBizRsltInqPopup-inp-brno" uitype="text" class="form-control input-sm" onkeyenter="fn_sprtBizRsltInqEnterKey"></sbux-input>
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
								<span style="color: black;">법인조회 목록</span>
								<span style="font-size:12px">(조회건수 <span id="sprtBizRsltInqPopup-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdSprtBizRsltInqPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdSprtBizRsltInqPop;
	var jsonSprtBizRsltInqPop = [];


	const popSprtBizRsltInq = {
		prgrmId	: 'sprtBizRsltInqPopup',
		modalId	: 'modal-sprtBizRsltInqPopup',
		gridId	: 'grdSprtBizRsltInqPop',
		jsonId	: 'jsonSprtBizRsltInqPop',
		areaId	: "sb-area-grdSprtBizRsltInqPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		brno: null,
		init: async function(_callbackFnc) {

			SBUxMethod.attr('btnSearchSprtBizRsltInqPopup', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			this.createGrid();
			this.search();

		},
		close: function(_arg) {
			gfn_closeModal(this.modalId, this.callbackFnc, _arg);
		},
		reset: function() {
			SBUxMethod.set('sprtBizRsltInqPopup-inp-bzmnConm', "");
			SBUxMethod.set("sprtBizRsltInqPopup-inp-brno", "");
		},
		createGrid: function(/** {boolean} */ isEditable) {
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
		        {caption: ['법인명'], 	ref: 'bzmnConm', width: '300px', type: 'input', style: 'text-align:center'},
		        {caption: ['법인번호'], 	ref: 'crno', 	 width: '300px', type: 'input', style: 'text-align:center'},
		        {caption: ['사업자번호'], ref: 'brno', 	 width: '300px', type: 'input', style: 'text-align:center'},
		    ];

		    grdSprtBizRsltInqPop = _SBGrid.create(SBGridProperties);
		    grdSprtBizRsltInqPop.bind('beforepagechanged', this.paging);
		    grdSprtBizRsltInqPop.bind('dblclick', popSprtBizRsltInq.choice);
		},
		choice: function() {
			let nRow = grdSprtBizRsltInqPop.getRow();
			let rowData = grdSprtBizRsltInqPop.getRowData(nRow);
			popSprtBizRsltInq.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdSprtBizRsltInqPop.rebuild();
	    	let pageSize = grdSprtBizRsltInqPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonSprtBizRsltInqPop.length = 0;
	    	grdSprtBizRsltInqPop.refresh();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var bzmnConm = SBUxMethod.get("sprtBizRsltInqPopup-inp-bzmnConm") || "";
			let brno = SBUxMethod.get("sprtBizRsltInqPopup-inp-brno") || "";

			if(!gfn_isEmpty(this.brno)){
				brno = this.brno;
			}

	        const postJsonPromise = gfn_postJSON("/pd/popup/selectSprtBizRsltInqPopupList.do", {

	        	bzmnConm 		   : bzmnConm,
				brno 			   : brno,
	        	// pagination
		  		pagingYn 		   : 'Y',
				currentPageNo 	   : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	    		let totalRecordCount = 0;

	    		jsonSprtBizRsltInqPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const sprtBizRsltInqPopupVO = {
						brno 		: item.brno,
						psnSeCd 	: item.psnSeCd,
						bzmnConm 	: item.bzmnConm,
						crno 		: item.crno,
						ognzCd 		: item.ognzCd,
					}
					jsonSprtBizRsltInqPop.push(sprtBizRsltInqPopupVO);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonSprtBizRsltInqPop.length > 0) {
	        		if(grdSprtBizRsltInqPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdSprtBizRsltInqPop.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdSprtBizRsltInqPop.rebuild();
					}else{
						grdSprtBizRsltInqPop.refresh();
					}
	        	} else {
	        		grdSprtBizRsltInqPop.setPageTotalCount(totalRecordCount);
	        		grdSprtBizRsltInqPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdSprtBizRsltInqPop.setCellDisabled(0, 0, grdSprtBizRsltInqPop.getRows() - 1, grdSprtBizRsltInqPop.getCols() - 1, false);
	        		let nRow = grdSprtBizRsltInqPop.getRows();
					grdSprtBizRsltInqPop.addRow(true);
					grdSprtBizRsltInqPop.setCellDisabled(nRow, 0, nRow, grdSprtBizRsltInqPop.getCols() - 1, true);
	        	} else {
	        		grdSprtBizRsltInqPop.setCellDisabled(0, 0, grdSprtBizRsltInqPop.getRows() - 1, grdSprtBizRsltInqPop.getCols() - 1, true);
	        	}

	        	document.querySelector('#sprtBizRsltInqPopup-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdSprtBizRsltInqPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdSprtBizRsltInqPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popSprtBizRsltInq.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

function fn_sprtBizRsltInqEnterKey() {
		if(window.event.keyCode == 13) {
			popSprtBizRsltInq.search();
		}
	}



</script>
</html>