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
						<span style="font-weight:bold;">사업자번호를 조회합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchBrno" name="btnSearchBrnoMng" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popBrnoMng.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="btnEndBrno" name="btnEndBrnoMng" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popBrnoMng.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 20%">
						<col style="width: 30%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">사업자번호</th>
							<th>
								<sbux-input id="brno-inp-brno" name="brno-inp-brno" uitype="text" class="form-control input-sm" onkeyenter="fn_brnoEnterKey"></sbux-input>
							</th>
							<th scope="row">법인체명</th>
							<th>
								<sbux-input id="brno-inp-corpNm" name="brno-inp-corpNm" uitype="text" class="form-control input-sm" onkeyenter="fn_brnoEnterKey"></sbux-input>
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
					<div id="sb-area-grdBrnoMngPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonApcItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdBrnoMngPop = null;
	var jsonBrnoMngPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popBrnoMng = {
		prgrmId: 'brnoMngPopup',
		modalId: 'modal-brnoMng',
		gridId: 'grdBrnoMngPop',
		jsonId: 'jsonBrnoMngPop',
		areaId: "sb-area-grdBrnoMngPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc) {

			//SBUxMethod.attr('btnSearchBrnoMng', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			this.search();
		},
		close: function(_vo) {
			gfn_closeModal(this.modalId, this.callbackFnc, _vo);
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
				{caption: ['법인명'],		ref: 'corpNm', width: '200px', type: 'output', style: 'text-align:center'},
				{caption: ['사업자번호'],	ref: 'brno', width: '100px', type: 'output', style: 'text-align:center'},
				{caption: ['사업자번호'],	ref: 'crno', width: '100px', type: 'output', style: 'text-align:center'},
				{caption: ['통합조직코드'],	ref: 'apoCd', 	hidden:true},
				{caption: ['본번'],		ref: 'mno', 	hidden:true},
				{caption: ['부번'],		ref: 'sno', 	hidden:true},
				{caption: ['선정년도'],		ref: 'slctnYr', hidden:true},
			];

			grdBrnoMngPop = _SBGrid.create(SBGridProperties);
			grdBrnoMngPop.bind('beforepagechanged', this.paging);
			grdBrnoMngPop.bind('dblclick', popBrnoMng.choice);
		},
		choice: function() {
			let nRow = grdBrnoMngPop.getRow();
			let rowData = grdBrnoMngPop.getRowData(nRow);
			popBrnoMng.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdBrnoMngPop.rebuild();
			let pageSize = grdBrnoMngPop.getPageSize();
			let pageNo = 1;

			// grid clear
			jsonBrnoMngPop.length = 0;
			grdBrnoMngPop.refresh();
			//grdBrnoMngPop.clearStatus();
			this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var brno = nvlScnd(SBUxMethod.get("brno-inp-brno"),'');
			var corpNm = nvlScnd(SBUxMethod.get("brno-inp-corpNm"),'');

			const postJsonPromise = gfn_postJSON("/pd/popup/selectBrnoMngList.do", {

				brno : brno, //검색 파라미터
				corpNm : corpNm,

				// pagination
				pagingYn : 'Y',
				currentPageNo : pageNo,
	 			recordCountPerPage : pageSize
			});

			const data = await postJsonPromise;

			try {
				/** @type {number} **/
				let totalRecordCount = 0;

				jsonBrnoMngPop.length = 0;
				data.resultList.forEach((item, index) => {
					const itemVo = {
						brno 	: item.brno,
						crno 	: item.crno,
						corpNm 	: item.corpNm,
						apoCd	: item.apoCd,

						mno 	: item.mno,
						sno 	: item.sno,
						slctnYr : item.slctnYr,

					}
					jsonBrnoMngPop.push(itemVo);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

				if (jsonBrnoMngPop.length > 0) {
					if(grdBrnoMngPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
						grdBrnoMngPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
						grdBrnoMngPop.rebuild();
					}else{
						grdBrnoMngPop.refresh();
					}
				} else {
					grdBrnoMngPop.setPageTotalCount(totalRecordCount);
					grdBrnoMngPop.rebuild();
				}

				if (isEditable) {
					grdBrnoMngPop.setCellDisabled(0, 0, grdBrnoMngPop.getRows() - 1, grdBrnoMngPop.getCols() - 1, false);
					let nRow = grdBrnoMngPop.getRows();
					grdBrnoMngPop.addRow(true);
					grdBrnoMngPop.setCellDisabled(nRow, 0, nRow, grdBrnoMngPop.getCols() - 1, true);
				} else {
					grdBrnoMngPop.setCellDisabled(0, 0, grdBrnoMngPop.getRows() - 1, grdBrnoMngPop.getCols() - 1, true);
				}

				document.querySelector('#brno-pop-cnt').innerText = totalRecordCount;

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		paging: function() {
			let recordCountPerPage = grdBrnoMngPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
			let currentPageNo = grdBrnoMngPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

			popBrnoMng.setGrid(recordCountPerPage, currentPageNo);
		}
	}

	function fn_brnoEnterKey() {
		if(window.event.keyCode == 13) {
			popBrnoMng.search();
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