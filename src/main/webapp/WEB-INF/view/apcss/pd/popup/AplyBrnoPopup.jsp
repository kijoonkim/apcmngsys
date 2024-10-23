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
					<sbux-button id="aplyBrno-btnSearch" name="aplyBrno-btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popAplyBrno.search" onkeyup="enterKey();"></sbux-button>
					<sbux-button id="aplyBrno-btnEdit" name="aplyBrno-btnEdit" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popAplyBrno.edit"></sbux-button>
					<sbux-button id="aplyBrno-btnCancel" name="aplyBrno-btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popAplyBrno.cancel"></sbux-button>
					<sbux-button id="aplyBrno-btnSave" name="aplyBrno-btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popAplyBrno.save" disabled></sbux-button>
					<sbux-button id="aplyBrno-btnEnd" name="aplyBrno-btnEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popAplyBrno.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input uitype="hidden" id="aplyBrno-inp-yr" name="aplyBrno-inp-yr"></sbux-input>
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
							<!--
							<th scope="row">지사</th>
							<th>
								<sbux-input id="aplyBrno-inp-jisa" name="aplyBrno-inp-jisa" uitype="text" class="form-control input-sm" onkeyenter="enterKey();"></sbux-input>
							</th>
							 -->
							<th scope="row">사업자번호</th>
							<th>
								<sbux-input id="aplyBrno-inp-brno" name="aplyBrno-inp-brno" uitype="text" class="form-control input-sm" onkeyenter="fn_brnoEnterKey"></sbux-input>
							</th>
							<th scope="row">법인체명</th>
							<th>
								<sbux-input id="aplyBrno-inp-corpNm" name="aplyBrno-inp-corpNm" uitype="text" class="form-control input-sm" onkeyenter="fn_brnoEnterKey"></sbux-input>
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
								<span style="font-size:12px">(조회건수 <span id="aplyBrno-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdAplyBrnoPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	//var jsonApcItemPop= [];	// 대표품목 rprsItemCd	Grid

	var grdAplyBrnoPop = null;
	var jsonAplyBrnoPop = [];

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popAplyBrno = {
		prgrmId: 'brnoPopup',
		modalId: 'modal-aplyBrno',
		gridId: 'grdAplyBrnoPop',
		jsonId: 'jsonAplyBrnoPop',
		areaId: "sb-area-grdAplyBrnoPop",
		prvApcCd: "",
		//yr:"",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_callbackFnc , _yr) {

			SBUxMethod.hide('btnEditBrno');
			SBUxMethod.hide('btnCancelBrno');
			SBUxMethod.hide('btnSaveBrno');
			SBUxMethod.attr('btnSearchBrno', 'disabled', false);
			if(!gfn_isEmpty(_yr)){
				//this.yr = _yr;
				SBUxMethod.set('aplyBrno-inp-yr' , _yr);
			}
			console.log('_yr',_yr,'this.yr',this.yr);
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
			SBGridProperties.id = this.gridId;			//'grdAplyBrnoPop';					//'grdAplyBrnoPop';
			SBGridProperties.jsonref = this.jsonId;		//'jsonAplyBrnoPop';		//'jsonAplyBrnoPop';
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
				{caption: ['사업자번호'], 	ref: 'brno', width: '300px', type: 'input', style: 'text-align:center'},
				{caption: ['법인체명'],	 	ref: 'corpNm', width: '300px', type: 'input', style: 'text-align:center'},
				{caption: ['조직코드'], 	ref: 'apoCd', hidden:true},
				{caption: ['법인등록번호'], 	ref: 'crno', hidden:true}
			];

			grdAplyBrnoPop = _SBGrid.create(SBGridProperties);
			grdAplyBrnoPop.bind('beforepagechanged', this.paging);
			grdAplyBrnoPop.bind('dblclick', popAplyBrno.choice);	//'popApcChoice');
			//this.search();
		},
		choice: function() {
			let nRow = grdAplyBrnoPop.getRow();
			let rowData = grdAplyBrnoPop.getRowData(nRow);
			popAplyBrno.close(rowData);
		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdAplyBrnoPop.rebuild();
			let pageSize = grdAplyBrnoPop.getPageSize();
			let pageNo = 1;

			// grid clear
			jsonAplyBrnoPop.length = 0;
			grdAplyBrnoPop.refresh();
			//grdAplyBrnoPop.clearStatus();
			this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

			var brno = nvlScnd(SBUxMethod.get("aplyBrno-inp-brno"),'');
			var corpNm = nvlScnd(SBUxMethod.get("aplyBrno-inp-corpNm"),'');

			let yr = SBUxMethod.get('aplyBrno-inp-yr');

			const postJsonPromise = gfn_postJSON("/pd/popup/selectAplyBrnoList.do", {

				brno : brno, //검색 파라미터
				yr : yr,
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

				jsonAplyBrnoPop.length = 0;
				data.resultList.forEach((item, index) => {
					const apc = {
						brno 	: item.brno,
						crno 	: item.crno,
						corpNm 	: item.corpNm,
						apoCd	: item.apoCd
					}
					jsonAplyBrnoPop.push(apc);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

				if (jsonAplyBrnoPop.length > 0) {
					if(grdAplyBrnoPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
						grdAplyBrnoPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
						grdAplyBrnoPop.rebuild();
					}else{
						grdAplyBrnoPop.refresh();
					}
				} else {
					grdAplyBrnoPop.setPageTotalCount(totalRecordCount);
					grdAplyBrnoPop.rebuild();
				}

				if (isEditable) {
					grdAplyBrnoPop.setCellDisabled(0, 0, grdAplyBrnoPop.getRows() - 1, grdAplyBrnoPop.getCols() - 1, false);
					let nRow = grdAplyBrnoPop.getRows();
					grdAplyBrnoPop.addRow(true);
					grdAplyBrnoPop.setCellDisabled(nRow, 0, nRow, grdAplyBrnoPop.getCols() - 1, true);
				} else {
					grdAplyBrnoPop.setCellDisabled(0, 0, grdAplyBrnoPop.getRows() - 1, grdAplyBrnoPop.getCols() - 1, true);
				}

				document.querySelector('#aplyBrno-pop-cnt').innerText = totalRecordCount;

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		paging: function() {
			let recordCountPerPage = grdAplyBrnoPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
			let currentPageNo = grdAplyBrnoPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

			popAplyBrno.setGrid(recordCountPerPage, currentPageNo);
		}
	}

	function fn_brnoEnterKey() {
		if(window.event.keyCode == 13) {
			popAplyBrno.search();
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