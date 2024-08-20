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
						<span style="font-weight:bold;">지원사업 목록</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="pop_biz_btnSearch" name="pop_biz_btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popBiz.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="pop_biz_btnEdit" name="pop_biz_btnEdit" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popBiz.edit"></sbux-button>
					<sbux-button id="pop_biz_btnCancel" name="pop_biz_btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popBiz.cancel"></sbux-button>
					<sbux-button id="pop_biz_btnSave" name="pop_biz_btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popBiz.save" disabled></sbux-button>
					<sbux-button id="pop_biz_btnEnd" name="pop_biz_btnEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popBiz.close"></sbux-button>
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
							<th scope="row">사업명</th>
							<th>
								<sbux-input id="pop_biz_srch-inp-apcCd" name="pop_biz_srch-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="pop_biz_srch-inp-apcNm" name="pop_biz_srch-inp-apcNm" uitype="hidden"></sbux-input>
								<sbux-input id="pop_biz_srch-inp-bizNm" name="pop_biz_srch-inp-bizNm" uitype="text" class="form-control input-sm" onkeyenter="fn_bizEnterKey"></sbux-input>
							</th>
							<th scope="row">지원유형</th>
							<th>
								<sbux-select
									id="pop_biz_srch-inp-bizSprtCd"
									name="pop_biz_srch-inp-bizSprtCd"
									uitype="single"
									jsondata-ref="jsonComBizSprtCd1"
									unselected-text="전체"
									class="form-control input-sm inpt_data_reqed"
									onchange=""
								></sbux-select>
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
								<span style="color: black;">사업 목록</span>
								<span style="font-size:12px">(조회건수 <span id="pop_biz_cnt">0</span>건)</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">
							<sbux-button id="pop_biz_btn_add" name="pop_biz_btn_add" uitype="normal" text="행추가" class="btn btn-xs btn-outline-danger" onclick="popBiz.fn_addRow"></sbux-button>
							&nbsp;
							<sbux-button id="pop_biz_btn_del" name="pop_biz_btn_del" uitype="normal" text="행삭제" class="btn btn-xs btn-outline-danger" onclick="popBiz.fn_deleteRow"></sbux-button>
						</div>
					</div>
					<div id="sb-area-grdBizPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
/*
 * 개발 중지 사업명을 코드로 관리 하는것은 폐기
 * 컬럼명에서 APC에서 지원하는 최근 3년 사업을 컬럼으로 관리
 */


	/* grid 내 select json */
	var jsonComBizSprtCd1= [];	//지원유형
	var jsonGrdComBizSprtCd1= [];	//지원유형

	var grdBizPop = null;
	var jsonBizPop = [];

	/**
	 * @description
	 */
	const popBiz = {
		prgrmId: 'bizPopup',
		modalId: 'modal-biz',
		gridId: 'grdBizPop',
		jsonId: 'jsonBizPop',
		areaId: "sb-area-grdBizPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_param,_callbackFnc) {
			if(!gfn_isEmpty(_param)){
				this.param = gfn_cloneJson(_param);

				// set param
				SBUxMethod.set("pop_biz_srch-inp-apcCd", this.param.apcCd);
				SBUxMethod.set("pop_biz_srch-inp-apcNm", this.param.apcNm);
			}

			SBUxMethod.hide('pop_biz_btnEdit');
			SBUxMethod.hide('pop_biz_btnCancel');
			//SBUxMethod.hide('pop_biz_btnSave');
			SBUxMethod.attr('pop_biz_btnSave', 'disabled', false);
			SBUxMethod.attr('pop_biz_btnSearch', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			//콤보박스 세팅
			gfn_setComCdSBSelect('pop_biz_srch-inp-bizSprtCd', 	jsonComBizSprtCd1, 	'BIZ_SPRT_CD'), 	//지원 유형
			await gfn_setComCdSBSelect(this.gridId, 	jsonGrdComBizSprtCd1, 	'BIZ_SPRT_CD'), 	//지원 유형
			this.search();
		},
		close: function(_param) {
			gfn_closeModal(this.modalId);
			//gfn_closeModal(this.modalId, this.callbackFnc, _param);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
			SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
			SBGridProperties.id = this.gridId;			//'grdBizPop';					//'grdBizPop';
			SBGridProperties.jsonref = this.jsonId;		//'jsonBizPop';		//'jsonBizPop';
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
				{caption: ["체크박스"], 	ref: 'checked', 	width: '40px', type: 'checkbox', style:'text-align: center',
					typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
				//{caption: ["지원유형"], 	ref: 'bizSprtCd',	width: '100px', type: 'input', style: 'text-align:center'},
				{caption: ["지원유형"], 	ref: 'bizSprtCd',	width: '160px', type: 'combo', style: 'text-align:center'
					,typeinfo : {ref:'jsonGrdComBizSprtCd1', label:'label', value:'value', displayui : false}},
				{caption: ["사업명"], 		ref: 'bizNm', 		width: '300px', type: 'input', style: 'text-align:center'},
				{caption: ["사업내용"], 	ref: 'bizCn', 		width: '300px', type: 'input', style: 'text-align:center'},
				{caption: ["사업고유번호"], 	ref: 'sn', 		type: 'output', hidden : true},
				{caption: ["행추가여부"],	ref: 'addYn',	type: 'output', hidden : true}
			];

			grdBizPop = _SBGrid.create(SBGridProperties);
			grdBizPop.bind('beforepagechanged', this.paging);
			grdBizPop.bind('dblclick', popBiz.choice);	//'popApcChoice');
			//this.search();
		},
		choice: function() {
			let nRow = grdBizPop.getRow();
			let rowData = grdBizPop.getRowData(nRow);
			popBiz.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdBizPop.rebuild();
			let pageSize = grdBizPop.getPageSize();
			let pageNo = 1;

			// grid clear
			jsonBizPop.length = 0;
			grdBizPop.refresh();
			//grdBizPop.clearStatus();
			this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var bizNm = gfn_nvl(SBUxMethod.get("pop_biz_srch-inp-bizNm"));
			var bizSprtCd = gfn_nvl(SBUxMethod.get("pop_biz_srch-inp-bizSprtCd"));

			const postJsonPromise = gfn_postJSON("/fm/fclt/popup/selectFcltBizInfoList.do", {

				bizNm : bizNm, //검색 파라미터
				bizSprtCd : bizSprtCd,

				// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

			const data = await postJsonPromise;

			try {
				/** @type {number} **/
				let totalRecordCount = 0;

				jsonBizPop.length = 0;
				data.resultList.forEach((item, index) => {
					const bizVo = {
							bizNm 		: item.bizNm
							,bizSprtCd 	: item.bizSprtCd
							,bizCn		: item.bizCn
							,sn			: item.sn
							,addYn		: 'N'
					}
					jsonBizPop.push(bizVo);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

				if (jsonBizPop.length > 0) {
					if(grdBizPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
						grdBizPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
						grdBizPop.rebuild();
					}else{
						grdBizPop.refresh();
					}
				} else {
					grdBizPop.setPageTotalCount(totalRecordCount);
					grdBizPop.rebuild();
				}

				if (isEditable) {
					grdBizPop.setCellDisabled(0, 0, grdBizPop.getRows() - 1, grdBizPop.getCols() - 1, false);
					let nRow = grdBizPop.getRows();
					grdBizPop.addRow(true);
					grdBizPop.setCellDisabled(nRow, 0, nRow, grdBizPop.getCols() - 1, true);
				} else {
					grdBizPop.setCellDisabled(0, 0, grdBizPop.getRows() - 1, grdBizPop.getCols() - 1, true);
				}

				document.querySelector('#pop_biz_cnt').innerText = totalRecordCount;

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		paging: function() {
			let recordCountPerPage = grdBizPop.getPageSize();			// 몇개의 데이터를 가져올지 설정
			let currentPageNo = grdBizPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

			popBiz.setGrid(recordCountPerPage, currentPageNo);
		},
		fn_addRow: function() {
			grdBizPop.addRow(true, {addYn:'Y'});
		},
		fn_deleteRow: function() {
			let delList = [];
			let gridList = grdBizPop.getGridDataAll();
			for (let i=gridList.length-1; i>-1; i--) {
				if (gridList[i].checked === "true") {
					delList.push(gridList[i]);
					if (gridList[i].addYn == 'N') {
						gfn_comAlert("E0000", (i+1) + "행은 기존데이터로 삭제를 이용하여 주세요.");
						return;
					}
					grdBizPop.deleteRow(i+1);
				}
			}
			if (delList.length < 1) {
				gfn_comAlert("W0003", "삭제");
				return;
			}
		},
		save: async function() {
			return;
			let allData = grdBizPop.getGridDataAll();

			const saveCdList = [];

			for(var i=1; i<= allData.length; i++){
				let rowData = grdBizPop.getRowData(i);
				let rowSts = grdBizPop.getRowStatus(i);
				if(rowData.checked === 'true'){
					/*
					if (gfn_isEmpty(rowData.cdId)) {
						gfn_comAlert("W0002", i+"번째 행 코드ID");
						return;
					}
					*/
					if (rowSts === 3 || rowSts === 1) {
						rowData.rowSts = "I";
						saveCdList.push(rowData);
					} else if (rowSts === 2) {
						rowData.rowSts = "U";
						saveCdList.push(rowData);
					} else {
						continue;
					}
				}
			}

			if (saveCdList.length == 0){
				//gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
				return;
			}

			if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
				return;
			}

			const postJsonPromise = gfn_postJSON("/fm/fclt/popup/", saveCdList, this.prgrmId);	// 프로그램id 추가

			const data = await postJsonPromise;
			try {
				console.log(data);
				if (_.isEqual("S", data.resultStatus)) {
					//gfn_comAlert("I0001");	// I0001	처리 되었습니다.
					//gfn_comAlert(data.resultCode, data.resultMessage);
					//this.searchInEdit();
				} else {
					//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
					//gfn_comAlert(data.resultCode, data.resultMessage);
				}
			} catch(e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
				//gfn_comAlert(data.resultCode, data.resultMessage);
			}
		}
	}

	function fn_bizEnterKey() {
		if(window.event.keyCode == 13) {
			popBiz.search();
		}
	}

</script>
</html>