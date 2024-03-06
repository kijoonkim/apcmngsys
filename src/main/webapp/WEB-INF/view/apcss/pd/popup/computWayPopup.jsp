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
						<span style="font-weight:bold;">산출식 관리</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchComputWay" name="btnSearchComputWay" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popComputWay.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnSaveComputWay" name="btnSaveComputWay" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popComputWay.save"></sbux-button>
					<sbux-button id="btnEndComputWay" name="btnEndComputWay" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popComputWay.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 40%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">등록년도</th>
							<th>
								<sbux-spinner
									id="pop-srch-input-yr"
									name="pop-srch-input-yr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
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
								<span style="color: black;">산출식 목록</span>
								<span style="font-size:12px">(조회건수 <span id="computWay-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdComputWayPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonGrdFundArtcl= [];	// 자금항목 fundArtcl	Grid

	var grdComputWayPop = null;
	var jsonComputWayPop = [];

	const popComputWay = {
		prgrmId: 'computWayPopup',
		modalId: 'modal-computWay',
		gridId: 'grdComputWayPop',
		jsonId: 'jsonComputWayPop',
		areaId: "sb-area-grdComputWayPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {
			console.log('popComputWay.init');
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			//기본 년도 세팅
			let now = new Date();
			let year = now.getFullYear();
			SBUxMethod.set("pop-srch-input-yr",year);

			//콤보 데이터
			let rst = await Promise.all([
				gfn_setComCdSBSelect('grdComputWayPop',jsonGrdFundArtcl,'FUND_ARTCL'), //산출식 항목
			]);

			this.createGrid();
			this.search();

		},
		close: function() {
			gfn_closeModal(this.modalId, this.callbackFnc);
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
				{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
					if(strValue== null || strValue == ""){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popComputWay.fn_procRow(\"ADD\", \"grdComputWayPop\", " + nRow + ", " + nCol + ")'>추가</button>";
					}else{
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popComputWay.fn_procRow(\"DEL\", \"grdComputWayPop\", " + nRow + ")'>삭제</button>";
					}
					return "";
				}},
				{caption: ["등록년도"],		ref: 'yr',				width:'80px',	type:'output',	style:'text-align:center'},
				{caption: ["항목"], 	ref: 'fundArtcl',  	type:'combo',  width:'120px',    style:'text-align:center'
					,typeinfo : {ref:'jsonGrdFundArtcl', label:'label', value:'value', displayui : false}},
				{caption: ['산출식'], 		ref: 'computWayDtl',	width: '300px', type: 'input',	style: 'text-align:center'},
				//{caption: ['자금항목'], 	ref: 'fundArtclNm',		width: '300px', type: 'combo',	style: 'text-align:center'},
				{caption: ['배점'],		ref: 'alt', 			width: '80px', type: 'input',	style: 'text-align:center'},
				{caption: ['비고'],		ref: 'rmrk', 			width: '300px', type: 'input',	style: 'text-align:center'},
				{caption: ["상세내역"],		ref: 'computWayCd',		hidden : true},
				//{caption: ["상세내역"],		ref: 'fundArtcl',		hidden : true},
			];

			grdComputWayPop = _SBGrid.create(SBGridProperties);
			grdComputWayPop.bind('beforepagechanged', this.paging);
			//grdComputWayPop.bind('dblclick', popComputWay.choice);	//'popApcChoice');
			//this.search();
		},
		//choice: function() {
		//},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdComputWayPop.rebuild();
			let pageSize = grdComputWayPop.getPageSize();
			let pageNo = 1;

			// grid clear
			jsonComputWayPop.length = 0;
			grdComputWayPop.refresh();
			//grdComputWayPop.clearStatus();
			this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var yr = SBUxMethod.get("pop-srch-input-yr");
			if(gfn_isEmpty(yr)){
				let now = new Date();
				let year = now.getFullYear();
				yr = year;
			}

			const postJsonPromise = gfn_postJSON("/pd/pcorm/selectComputWayList.do", {
				//검색 파라미터
				yr : yr,

				// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

			const data = await postJsonPromise;

			try {
				/** @type {number} **/
				let totalRecordCount = 0;

				jsonComputWayPop.length = 0;
				data.resultList.forEach((item, index) => {
					const itemVo = {
						yr 	: item.yr
						,computWayDtl	: item.computWayDtl
						,computWayCd	: item.computWayCd
						,fundArtcl		: item.fundArtcl
						,alt			: item.alt
						,rmrk			: item.rmrk
						,delYn			: item.delYn
					}
					jsonComputWayPop.push(itemVo);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

				if (jsonComputWayPop.length > 0) {
					if(grdComputWayPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
						grdComputWayPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
						grdComputWayPop.rebuild();
					}else{
						grdComputWayPop.refresh();
					}
				} else {
					grdComputWayPop.setPageTotalCount(totalRecordCount);
					grdComputWayPop.rebuild();
				}

				if (isEditable) {
					grdComputWayPop.setCellDisabled(0, 0, grdComputWayPop.getRows() - 1, grdComputWayPop.getCols() - 1, false);
					let nRow = grdComputWayPop.getRows();
					grdComputWayPop.addRow(true);
					grdComputWayPop.setCellDisabled(nRow, 0, nRow, grdComputWayPop.getCols() - 1, true);
				} else {
					grdComputWayPop.setCellDisabled(0, 0, grdComputWayPop.getRows() - 1, grdComputWayPop.getCols() - 1, true);
				}

				document.querySelector('#computWay-pop-cnt').innerText = totalRecordCount;

				grdComputWayPop.addRow();
			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		paging: function() {
			let recordCountPerPage = grdComputWayPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
			let currentPageNo = grdComputWayPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

			popComputWay.setGrid(recordCountPerPage, currentPageNo);
		},
		fn_procRow: async function(/** {String} */gubun, /** {String} */grid, /** {String} */nRow, /** {String} */nCol) {
			if (gubun === "ADD") {
				if (grid === "grdComputWayPop") {
					grdComputWayPop.setCellData(nRow, nCol, "N", true);
					grdComputWayPop.addRow(true);
				}
			}
			else if (gubun === "DEL") {
				if (grid === "grdComputWayPop") {
					if(grdComputWayPop.getRowStatus(nRow) == 0 || grdComputWayPop.getRowStatus(nRow) == 2){
						var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
						if(confirm(delMsg)){
							var vo = grdComputWayPop.getRowData(nRow);
							popComputWay.fn_deleteRsrc(vo);
							grdComputWayPop.deleteRow(nRow);
						}
					}else{
						grdComputWayPop.deleteRow(nRow);
					}
				}
			}
		},
		fn_deleteRsrc: async function(/** {object} */ vo) {
			let postJsonPromise = gfn_postJSON("/pd/pcorm/deleteComputWay.do", vo);
			let data = await postJsonPromise;

			try{
				if(data.result > 0){
					alert("삭제 되었습니다.");
				}else{
					alert("삭제 도중 오류가 발생 되었습니다.");
				}
			}catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		}
	}
</script>
</html>