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
					<sbux-button id="pop_bizSrch_btnSearch" name="pop_bizSrch_btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popBizSrch.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="pop_bizSrch_btnEdit" name="pop_bizSrch_btnEdit" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popBizSrch.edit"></sbux-button>
					<sbux-button id="pop_bizSrch_btnCancel" name="pop_bizSrch_btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popBizSrch.cancel"></sbux-button>
					<sbux-button id="pop_bizSrch_btnSave" name="pop_bizSrch_btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popBizSrch.save" disabled></sbux-button>
					<sbux-button id="pop_bizSrch_btnEnd" name="pop_bizSrch_btnEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popBizSrch.close"></sbux-button>
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
								<sbux-input id="pop_bizSrch_srch-inp-apcCd" name="pop_bizSrch_srch-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="pop_bizSrch_srch-inp-apcNm" name="pop_bizSrch_srch-inp-apcNm" uitype="hidden"></sbux-input>
								<sbux-input id="pop_bizSrch_srch-inp-bizNm" name="pop_bizSrch_srch-inp-bizNm" uitype="text" class="form-control input-sm" onkeyenter="fn_bizSrchEnterKey"></sbux-input>
							</th>
							<th scope="row">지원유형</th>
							<th>
								<sbux-select
									id="pop_bizSrch_srch-inp-bizSprtCd"
									name="pop_bizSrch_srch-inp-bizSprtCd"
									uitype="single"
									jsondata-ref="jsonComBizSprtCd2"
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
								<span style="font-size:12px">(조회건수 <span id="pop_bizSrch_cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdBizSrchPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonComBizSprtCd2= [];	//지원유형
	var jsonGrdComBizSprtCd2= [];	//지원유형

	var grdBizSrchPop = null;
	var jsonBizSrchPop = [];

	/**
	 * @description
	 */
	const popBizSrch = {
		prgrmId: 'bizSrchPopup',
		modalId: 'modal-bizSrch',
		gridId: 'grdBizSrchPop',
		jsonId: 'jsonBizSrchPop',
		areaId: "sb-area-grdBizSrchPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_param,_callbackFnc) {
			if(!gfn_isEmpty(_param)){
				this.param = gfn_cloneJson(_param);

				// set param
				SBUxMethod.set("pop_bizSrch_srch-inp-apcCd", this.param.apcCd);
				SBUxMethod.set("pop_bizSrch_srch-inp-apcNm", this.param.apcNm);
			}

			SBUxMethod.hide('pop_bizSrch_btnEdit');
			SBUxMethod.hide('pop_bizSrch_btnCancel');
			SBUxMethod.hide('pop_bizSrch_btnSave');
			SBUxMethod.attr('pop_bizSrch_btnSearch', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}
			this.createGrid();
			//콤보박스 세팅
			gfn_setComCdSBSelect('pop_bizSrch_srch-inp-bizSprtCd', 	jsonComBizSprtCd2, 	'BIZ_SPRT_CD'), 	//지원 유형
			await gfn_setComCdSBSelect(this.gridId, 	jsonGrdComBizSprtCd2, 	'BIZ_SPRT_CD'), 	//지원 유형
			this.search();
		},
		close: function(_param) {
			console.log(_param);
			console.log(this.modalId);
			gfn_closeModal(this.modalId, this.callbackFnc, _param);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
			SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
			SBGridProperties.id = this.gridId;			//'grdBizSrchPop';					//'grdBizSrchPop';
			SBGridProperties.jsonref = this.jsonId;		//'jsonBizSrchPop';		//'jsonBizSrchPop';
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
				{caption: ['지원유형'], 	ref: 'bizSprtCd',	width: '100px', type: 'input', style: 'text-align:center'},
				{caption: ["지원유형"], 	ref: 'bizSprtCd',	width: '160px', type: 'combo', style: 'text-align:center'
					,typeinfo : {ref:'jsonGrdComBizSprtCd2', label:'label', value:'value', displayui : false}},
				{caption: ['사업명'], 		ref: 'bizNm', 		width: '300px', type: 'input', style: 'text-align:center'},
				{caption: ['사업내용'], 	ref: 'bizCn', 		width: '300px', type: 'input', style: 'text-align:center'},
				{caption: ['사업고유번호'], 	ref: 'sn', hidden:true}
			];

			grdBizSrchPop = _SBGrid.create(SBGridProperties);
			grdBizSrchPop.bind('beforepagechanged', this.paging);
			grdBizSrchPop.bind('dblclick', popBizSrch.choice);	//'popApcChoice');
			//this.search();
		},
		choice: function() {
			let nRow = grdBizSrchPop.getRow();
			let rowData = grdBizSrchPop.getRowData(nRow);
			popBizSrch.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdBizSrchPop.rebuild();
			let pageSize = grdBizSrchPop.getPageSize();
			let pageNo = 1;

			// grid clear
			jsonBizSrchPop.length = 0;
			grdBizSrchPop.refresh();
			//grdBizSrchPop.clearStatus();
			this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var bizNm = gfn_nvl(SBUxMethod.get("pop_bizSrch_srch-inp-bizNm"));
			var bizSprtCd = gfn_nvl(SBUxMethod.get("pop_bizSrch_srch-inp-bizSprtCd"));

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

				jsonBizSrchPop.length = 0;
				data.resultList.forEach((item, index) => {
					const bizVo = {
							bizNm 		: item.bizNm,
							bizSprtCd 	: item.bizSprtCd,
							bizCn		: item.bizCn,
							sn			: item.sn
					}
					jsonBizSrchPop.push(bizVo);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

				if (jsonBizSrchPop.length > 0) {
					if(grdBizSrchPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
						grdBizSrchPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
						grdBizSrchPop.rebuild();
					}else{
						grdBizSrchPop.refresh();
					}
				} else {
					grdBizSrchPop.setPageTotalCount(totalRecordCount);
					grdBizSrchPop.rebuild();
				}

				if (isEditable) {
					grdBizSrchPop.setCellDisabled(0, 0, grdBizSrchPop.getRows() - 1, grdBizSrchPop.getCols() - 1, false);
					let nRow = grdBizSrchPop.getRows();
					grdBizSrchPop.addRow(true);
					grdBizSrchPop.setCellDisabled(nRow, 0, nRow, grdBizSrchPop.getCols() - 1, true);
				} else {
					grdBizSrchPop.setCellDisabled(0, 0, grdBizSrchPop.getRows() - 1, grdBizSrchPop.getCols() - 1, true);
				}

				document.querySelector('#pop_bizSrch_cnt').innerText = totalRecordCount;

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		paging: function() {
			let recordCountPerPage = grdBizSrchPop.getPageSize();			// 몇개의 데이터를 가져올지 설정
			let currentPageNo = grdBizSrchPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

			popBizSrch.setGrid(recordCountPerPage, currentPageNo);
		}
	}

	function fn_bizSrchEnterKey() {
		if(window.event.keyCode == 13) {
			popBizSrch.search();
		}
	}

</script>
</html>