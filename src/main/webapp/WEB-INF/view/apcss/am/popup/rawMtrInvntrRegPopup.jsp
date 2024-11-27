<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>원물재고 등록 팝업</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button
						id="rawMtrPop-btn-choice"
						name="rawMtrPop-btn-choice"
						uitype="normal" 
						text="선택"
						class="btn btn-sm btn-outline-danger" 
						onclick="popRawMtr.choice"
					></sbux-button>
					<sbux-button 
						id="rawMtrPop-btn-close"
						name="rawMtrPop-btn-close"
						uitype="normal" 
						text="종료" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popRawMtr.close"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 25%">

						<col style="width: 8%">
						<col style="width: 12%">
						<col style="width: 13%">

						<col style="width: 8%">
						<col style="width: 17%">
						<col style="width: 5%">
						<col style="width: 5%">

					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td class="td_input">
								<sbux-input
									id="rawMtrPop-inp-apcCd"
									name="rawMtrPop-inp-apcCd"
									uitype="hidden"
								></sbux-input>
								<sbux-input 
									id="rawMtrPop-inp-apcNm"
									name="rawMtrPop-inp-apcNm"
									uitype="text" 
									class="form-control input-sm"
									readonly
								></sbux-input>
							</td>
							<th scope="row">품목/품종</th>
							<td class="td_input">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="rawMtrPop-slt-itemCd"
										name="rawMtrPop-slt-itemCd"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										jsondata-ref="jsonRawMtrPopItem"
										jsondata-value="itemCd"
										jsondata-text="itemNm"
										onchange="popRawMtr.onChangeItem(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
										uitype="single"
										id="rawMtrPop-slt-vrtyCd"
										name="rawMtrPop-slt-vrtyCd"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										unselected-text="선택"
										jsondata-ref="jsonRawMtrPopVrty"
										jsondata-value="itemVrtyCd"
										jsondata-text="vrtyNm"
										onchange="popRawMtr.onChangeVrty(this)"
								></sbux-select>
							</td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right-style: hidden;">
								<sbux-input
										id="rawMtrPop-inp-prdcrCd"
										name="rawMtrPop-inp-prdcrCd"
										uitype="hidden"
								></sbux-input>
								<sbux-input
										uitype="search"
										id="rawMtrPop-inp-prdcrNm"
										name="rawMtrPop-inp-prdcrNm"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										placeholder="초성검색 가능"
										autocomplete-zindex="99999"
										autocomplete-ref="jsonRawMtrPopPrdcrInitial"
										autocomplete-text="name"
										autocomplete-height="270px"
										onkeyup="popRawMtr.onkeyupPrdcr(rawMtrPop-inp-prdcrNm)"
										autocomplete-select-callback="popRawMtrOnSelectPrdcr"
										button-back-text="❌"
										button-back-event="popRawMtr.clearPrdcr"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right-style: hidden;">
								<sbux-input
										uitype="text"
										id="rawMtrPop-inp-prdcrIdentno"
										name="rawMtrPop-inp-prdcrIdentno"
										class="form-control input-sm"
										maxlength="2"
										autocomplete="off"
										onchange="popRawMtr.onChangePrdcrIdentno(this)"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button
										id="rawMtrPop-btn-prdcr"
										name="rawMtrPop-btn-prdcr"
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-prdcr"
										onclick="popRawMtr.choicePrdcr"
								></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row">상품구분</th>
							<td class="td_input">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="rawMtrPop-slt-gdsSeCd"
										name="rawMtrPop-slt-gdsSeCd"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										jsondata-ref="jsonRawMtrPopGdsSeCd"
										jsondata-value="cdVl"
										jsondata-text="cdVlNm"
								></sbux-select>
							</td>
							<th scope="row">입고구분</th>
							<td colspan="2" class="td_input">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="rawMtrPop-slt-wrhsSeCd"
										name="rawMtrPop-slt-wrhsSeCd"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										jsondata-ref="jsonRawMtrPopWrhsSeCd"
										jsondata-value="cdVl"
										jsondata-text="cdVlNm"
								></sbux-select>
							</td>
							<th scope="row">운송구분</th>
							<td colspan="3" class="td_input">
								<sbux-select
										unselected-text="선택"
										uitype="single"
										id="rawMtrPop-slt-trsprtSeCd"
										name="rawMtrPop-slt-trsprtSeCd"
										class="form-control input-sm input-sm-ast inpt_data_reqed"
										jsondata-ref="jsonRawMtrPopTrsprtSeCd"
										jsondata-value="cdVl"
										jsondata-text="cdVlNm"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row">등급</th>
							<td colspan="8" class="td_input">
								<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">원물재고 등록 목록</span>
							</li>
						</ul>
						<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
							<sbux-button
									id="rawMtrPop-grd-addRow"
									name="rawMtrPop-grd-addRow"
									uitype="normal"
									text="행추가"
									class='btn btn-sm btn-outline-danger'
									onClick="popRawMtr.addRow"
									style="margin-right:5px"
									image-src="/static/resource/svg/grdPlus.svg"
									image-style="width:3rem;height:20px"
									image-placement="front"
							></sbux-button>
							<sbux-button
									id="rawMtrPop-grd-delRow"
									name="rawMtrPop-grd-delRow"
									uitype="normal"
									text="행삭제"
									class='btn btn-sm btn-outline-danger'
									onClick="popRawMtr.delRow"
									style="margin-right:5px"
									image-src="/static/resource/svg/grdMinus.svg"
									image-style="width:3rem;height:20px"
									image-placement="front"
							></sbux-button>
						</div>
					</div>
					<div id="sb-area-rawMtrPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var grdRawMtrPop = null;
	var jsonRawMtrPop = [];

	var jsonRawMtrPopItem = [];
	var jsonRawMtrPopVrty = [];
	var jsonRawMtrPopSpcfct = [];
	var jsonRawMtrPopWarehouse = [];
	var jsonRawMtrPopBx = [];

	var jsonRawMtrPopWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
	var jsonRawMtrPopGdsSeCd		= [];	// 상품구분		GDS_SE_CD
	var jsonRawMtrPopTrsprtSeCd		= [];	// 운송구분		TRSPRT_SE_CD

	var jsonRawMtrPopPrdcr			= [];	// 생산자
	var jsonRawMtrPopPrdcrInitial 	= [];	// 생산자 초성

	/**
	 * @name popRawMtr
	 * @description 원물재고 등록
	 */
	const popRawMtr = {
		prgrmId: 'rawMtrPop',
		modalId: 'modal-rawMtrPop',
		gridId: 'grdRawMtrPop',
		jsonId: 'jsonRawMtrPop',
		areaId: 'sb-area-rawMtrPop',
		prvApcCd: "",
		objMenuList: {
			"excelDwnldPop": {
				"name": "엑셀 다운로드",					//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",						//단축키
				"callback": "popRawMtr.exportExcel",	//콜백함수명
			}
		},
		exportExcel: function () {
			grdRawMtrPop.exportLocalExcel(
					"원물재고등록", {
						bSaveLabelData: true, 
						bNullToBlank: true, 
						bSaveSubtotalValue: true, 
						bCaptionConvertBr: true, 
						arrSaveConvertText: true
					});
	    },
		param: {
			apcCd: null,
			apcNm: null,
			itemCd: null,
			itemVrtyCd: null
		},
		callbackFnc: function() {},
		initCode: async function() {
			jsonRawMtrPopItem.length = 0;
			jsonRawMtrPopVrty.length = 0;
			jsonRawMtrPopSpcfct.length = 0;
			jsonRawMtrPopWarehouse.length = 0;
			jsonRawMtrPopBx.length = 0;
			jsonRawMtrPopWrhsSeCd.length = 0;
			jsonRawMtrPopGdsSeCd.length = 0;
			jsonRawMtrPopTrsprtSeCd.length = 0;
			jsonRawMtrPopPrdcr.length = 0;
			jsonRawMtrPopPrdcrInitial.length = 0;

			let rst = await Promise.all([
				gfn_getApcItem(this.param.apcCd),
				gfn_getApcVrty(this.param.apcCd),
				gfn_getComCdDtls('WAREHOUSE_SE_CD', this.param.apcCd),
				gfn_getPltBxs(this.param.apcCd, "B"),
				gfn_getComCdDtls('WRHS_SE_CD'),
				gfn_getComCdDtls('GDS_SE_CD', this.param.apcCd),
				gfn_getComCdDtls('TRSPRT_SE_CD'),
				gfn_getPrdcrs(this.param.apcCd),
			]);

			jsonRawMtrPopItem = rst[0];
			jsonRawMtrPopVrty = rst[1];
			jsonRawMtrPopWarehouse = rst[2];
			jsonRawMtrPopBx = rst[3];
			jsonRawMtrPopWrhsSeCd = rst[4];
			jsonRawMtrPopGdsSeCd = rst[5];
			jsonRawMtrPopTrsprtSeCd = rst[6];
			jsonRawMtrPopPrdcr = rst[7];

			jsonRawMtrPopPrdcr = gfn_setFrst(jsonRawMtrPopPrdcr);

			SBUxMethod.refresh('rawMtrPop-slt-gdsSeCd');
			SBUxMethod.refresh('rawMtrPop-slt-wrhsSeCd');
			SBUxMethod.refresh('rawMtrPop-slt-trsprtSeCd');
			SBUxMethod.refresh('rawMtrPop-slt-itemCd');
			SBUxMethod.refresh('rawMtrPop-slt-vrtyCd');
		},
		init: async function(_param, _callbackFnc) {

			SBUxMethod.openModal(this.modalId);

			const prvApcCd = this.param.apcCd;
			this.param = gfn_cloneJson(_param);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			stdGrdSelect.init();

			// set param
			SBUxMethod.set("rawMtrPop-inp-apcCd", this.param.apcCd);
			SBUxMethod.set("rawMtrPop-inp-apcNm", this.param.apcNm);

			if (grdRawMtrPop == null || !_.isEqual(this.param.apcCd, prvApcCd)) {
				await this.initCode();
				this.createGrid();
			}

			// 기본값 설정
			SBUxMethod.set('rawMtrPop-slt-gdsSeCd', "1");
			SBUxMethod.set('rawMtrPop-slt-wrhsSeCd', "3");
			SBUxMethod.set('rawMtrPop-slt-trsprtSeCd', "3");

			if (!gfn_isEmpty(this.param.itemVrtyCd)) {
				await this.onChangeVrty({value:this.param.itemVrtyCd});
			} else if (!gfn_isEmpty(this.param.itemCd)) {
				SBUxMethod.set("rawMtrPop-slt-itemCd", this.param.itemCd);
				await this.onChangeItem({value: this.param.itemCd})
			}
		},
		close: function(_rawMtrList) {
			gfn_closeModal(this.modalId, this.callbackFnc, _rawMtrList);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;
		    SBGridProperties.id = this.gridId;
		    SBGridProperties.jsonref = this.jsonId;
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
			SBGridProperties.useinitsorting = true;
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.contextmenulist = this.objMenuList;	// 우클릭 메뉴 리스트
		    SBGridProperties.columns = [
				{
					caption: [''],
					ref: 'checkedYn',
					type: 'checkbox',
					width: '50px',
					style: 'text-align:center',
					userattr: {colNm: 'checkedYn'},
					typeinfo: {
						checkedvalue: 'Y',
						uncheckedvalue: 'N',
						ignoreupdate: true,
						fixedcellcheckbox: {
							usemode: true,
							rowindex: 0
						}
					},
				},
				{
					caption: ['입고일자'],
					ref: 'wrhsYmd',
					width: '90px',
					type: 'inputdate',
					style: 'text-align:center',
					calendartype: 'date',
					dateformat: 'yymmdd',
					format : {
						type:'date',
						rule:'yyyy-mm-dd',
						origin:'yyyymmdd'
					},
					typeinfo: {
						oneclickedit: true,
					},
					hideeditesckeyvaluechanged: true,
					clearincomplete: true,
				},
				{
					caption: ["생산자"],
					ref: 'prdcrNm',
					type:'output',
					width:'100px',
					style:'text-align:center'
				},
				{
					caption: ["품목"],
					ref: 'itemNm',
					type:'output',
					width:'80px',
					style:'text-align:center'
				},
				{
					caption: ["품종"],
					ref: 'vrtyNm',
					type:'output',
					width:'100px',
					style:'text-align:left'
				},
				{
					caption: ["등급"],
					ref: 'grdNm',
					type:'output',
					width:'120px',
					style:'text-align:center'
				},
				{
					caption: ['창고'],
					ref: 'warehouseSeCd',
					width: '80px',
					type: 'combo',
					style: 'text-align:center;',
					userattr: {colNm: "warehouseSeCd"},
					typeinfo: {
						ref:'jsonRawMtrPopWarehouse',
						label:'cdVlNm',
						value:'cdVl',
						displayui : false,
						oneclickedit: true,
						unselect: {
							label : '',
							value: ''
						}
					}
				},
				{
					caption: ['박스종류'],
					ref: 'bxKnd',
					width: '80px',
					type: 'combo',
					style: 'text-align:center;',
					userattr: {colNm: "bxKnd"},
					typeinfo: {
						ref:'jsonRawMtrPopBx',
						label:'pltBxNm',
						value:'pltBxCd',
						displayui : false,
						oneclickedit: true,
						unselect: {
							label : '',
							value: ''
						}
					}
				},
				{
					caption: ["수량"],
					ref: 'qntt',
					type: 'input',
					width:'70px',
					style: 'text-align:right;background-color:#FFF8DC;',
					userattr: {colNm: "qntt"},
					typeinfo: {
						mask : {alias : '#', repeat: '*', unmaskvalue : true},
						maxlength: 13,
						oneclickedit: true
					},
					format : {type:'number', rule:'#,###'}
				},
				{
					caption: ["중량 (Kg)"],
					ref: 'wght',
					type:'input',
					width:'70px',
					style: 'text-align:right;background-color:#FFF8DC;',
					userattr: {colNm: "wght"},
					typeinfo: {
						mask : {alias : '#', repeat: '*', unmaskvalue : true},
						maxlength: 13,
						oneclickedit: true
					},
					format : {type:'number', rule:'#,###'}
				},
				{
					caption: ['팔레트번호'],
					ref: 'pltno',
					width: '100px',
					type: 'input',
					style: 'text-align:left;'
				},
				{
					caption: ['생산연도'],
					ref: 'prdctnYr',
					width: '80px',
					type: 'inputdate',
					style: 'text-align:center',
					calendartype: 'year',
					dateformat: 'yymmdd',
					format : {
						type:'date',
						rule:'yyyy',
						origin:'yyyy'
					},
					typeinfo: {
						oneclickedit: true,
					},
					hideeditesckeyvaluechanged: true,
					clearincomplete: true,
				},
				{
					caption: ['비고'],
					ref: 'rmrk',
					width: '200px',
					type: 'input',
					style: 'text-align:left;'
				},
				{
					caption: ['상품구분'],
					ref: 'gdsSeCd',
					width: '80px',
					type: 'combo',
					style: 'text-align:center;',
					userattr: {colNm: "gdsSeCd"},
					typeinfo: {
						ref:'jsonRawMtrPopGdsSeCd',
						label:'cdVlNm',
						value:'cdVl',
						displayui : false,
						oneclickedit: true,
						unselect: {
							label : '',
							value: ''
						}
					},
					disabled: true,
				},
				{
					caption: ['입고구분'],
					ref: 'wrhsSeCd',
					width: '80px',
					type: 'combo',
					style: 'text-align:center;',
					userattr: {colNm: "wrhsSeCd"},
					typeinfo: {
						ref:'jsonRawMtrPopWrhsSeCd',
						label:'cdVlNm',
						value:'cdVl',
						displayui : false,
						oneclickedit: true,
						unselect: {
							label : '',
							value: ''
						}
					},
					disabled: true,
				},
				{
					caption: ['운송구분'],
					ref: 'trsprtSeCd',
					width: '80px',
					type: 'combo',
					style: 'text-align:center;',
					userattr: {colNm: "trsprtSeCd"},
					typeinfo: {
						ref:'jsonRawMtrPopTrsprtSeCd',
						label:'cdVlNm',
						value:'cdVl',
						displayui : false,
						oneclickedit: true,
						unselect: {
							label : '',
							value: ''
						}
					},
					disabled: true,
				},
		    ];
			grdRawMtrPop = _SBGrid.create(SBGridProperties);
		},
		addRow: function() {

			try {
				const grid = grdRawMtrPop;
				if (grid == null) {
					return;
				}

				const apcCd = SBUxMethod.get("rawMtrPop-inp-apcCd");
				const itemCd = SBUxMethod.get("rawMtrPop-slt-itemCd");
				const itemVrtyCd = SBUxMethod.get("rawMtrPop-slt-vrtyCd");
				const prdcrCd = SBUxMethod.get("rawMtrPop-inp-prdcrCd");
				const prdcrNm = SBUxMethod.get("rawMtrPop-inp-prdcrNm");
				const gdsSeCd = SBUxMethod.get("rawMtrPop-slt-gdsSeCd");
				const wrhsSeCd = SBUxMethod.get("rawMtrPop-slt-wrhsSeCd");
				const trsprtSeCd = SBUxMethod.get("rawMtrPop-slt-trsprtSeCd");
				const stdGrd = stdGrdSelect.getStdGrd();

				if (gfn_isEmpty(itemCd)) {
					gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
					return;
				}
				if (gfn_isEmpty(itemVrtyCd)) {
					gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
					return;
				}
				if (gfn_isEmpty(prdcrCd)) {
					gfn_comAlert("W0002", "생산자");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				if (gfn_isEmpty(gdsSeCd)) {
					gfn_comAlert("W0002", "상품구분");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				if (gfn_isEmpty(wrhsSeCd)) {
					gfn_comAlert("W0002", "입고구분");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				if (gfn_isEmpty(trsprtSeCd)) {
					gfn_comAlert("W0002", "운송구분");		//	W0002	{0}을/를 입력하세요.
					return;
				}

				console.log("stdGrd", stdGrd);

				if (gfn_isEmpty(stdGrd)) {
					gfn_comAlert("W0001", "등급");		//	W0001	{0}을/를 선택하세요.
					return;
				}
				if (stdGrd.isOmit) {
					gfn_comAlert("W0001", "등급");		//	W0001	{0}을/를 선택하세요.
					return;
				}

				const grdCd = stdGrd.grdJgmt.grdCd;
				const grdNm = stdGrd.grdJgmt.grdNm;

				if (gfn_isEmpty(grdCd)) {
					gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
					return;
				}

				const itemInfo = _.find(jsonRawMtrPopItem, {itemCd: itemCd});
				const itemNm = itemInfo.itemNm;

				const vrtyInfo = _.find(jsonRawMtrPopVrty, {itemVrtyCd: itemVrtyCd});
				const vrtyCd = vrtyInfo.vrtyCd;
				const vrtyNm = vrtyInfo.vrtyNm;

				const nowDate = new Date();
				const wrhsYmd = gfn_dateToYmd(nowDate);
				const prdctnYr = gfn_dateToYear(nowDate);

				const _rowData = {
					checkedYn: "Y",
					apcCd: apcCd,
					wrhsYmd: wrhsYmd,
					prdctnYr: prdctnYr,
					itemCd: itemCd,
					itemNm: itemNm,
					vrtyCd: vrtyCd,
					vrtyNm: vrtyNm,
					prdcrCd: prdcrCd,
					prdcrNm: prdcrNm,
					gdsSeCd: gdsSeCd,
					wrhsSeCd: wrhsSeCd,
					trsprtSeCd: trsprtSeCd,
					grdCd: grdCd,
					grdNm: grdNm,
					stdGrdList: stdGrd.stdGrdList
				}

				grid.addRow(true,  _rowData);

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
			}
		},
		choice: function() {

			const grid = grdRawMtrPop;
			const chkCol = grid.getColRef("checkedYn");
			if (chkCol < 0) {
				return;
			}

			const datalist = [];
			const rows = grid.getCheckedRows(chkCol);
			for ( let row of rows ) {

				const rowData = grid.getRowData(row);
				// 입력값 확인
				if (gfn_isEmpty(rowData.wrhsYmd)) {
					gfn_comAlert("W0001", "입고일자");		//	W0001	{0}을/를 선택하세요.
					return;
				}

				if (rowData.qntt < 0) {
					gfn_comAlert("W0005", "수량");		//	W0005	{0}이/가 없습니다.
					return;
				}
				if (rowData.wght < 0) {
					gfn_comAlert("W0005", "중량");		//	W0005	{0}이/가 없습니다.
					return;
				}

				if (gfn_isEmpty(rowData.bxKnd)) {
					gfn_comAlert("W0005", "박스종류");		//	W0005	{0}이/가 없습니다.
					return;
				}

				datalist.push(rowData);
			}

			if (datalist.length == 0) {
				gfn_comAlert("W0004", "선택");		//	W0004	{0}한 대상이 없습니다.
				return;
			}

			popRawMtr.close(datalist);
		},
		onChangeItem: async function(obj) {
			const itemCd = obj.value;
			const apcCd = SBUxMethod.get("rawMtrPop-inp-apcCd");
			const rslt = await Promise.all([
				gfn_getApcVrty(apcCd, itemCd),
				stdGrdSelect.setStdGrd(apcCd, _GRD_SE_CD_WRHS, itemCd)
			]);
			jsonRawMtrPopVrty = rslt[0];
			SBUxMethod.refresh('rawMtrPop-slt-vrtyCd');
	    },
		onChangeVrty: async function(obj) {
			const vrtyCd = obj.value;
			if (!gfn_isEmpty(vrtyCd)){
				const itemCd = vrtyCd.substr(0,4);
				SBUxMethod.set("rawMtrPop-slt-itemCd", itemCd);
				await popRawMtr.onChangeItem({value: itemCd});
				SBUxMethod.set("rawMtrPop-slt-vrtyCd", vrtyCd);
			}
		},
		setPrdcrForm: function(_prdcr) {

			_prdcr.itemCd = _prdcr.rprsItemCd;
			_prdcr.itemVrtyCd = _prdcr.rprsItemCd + _prdcr.rprsVrtyCd;

			SBUxMethod.set("rawMtrPop-inp-prdcrCd", _prdcr.prdcrCd);
			SBUxMethod.set("rawMtrPop-inp-prdcrNm", _prdcr.prdcrNm);
			SBUxMethod.set("rawMtrPop-inp-prdcrIdentno", _prdcr.prdcrIdentno);
			SBUxMethod.attr("rawMtrPop-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			if (!gfn_isEmpty(_prdcr.rprsVrtyCd)) {
				popRawMtr.onChangeVrty({value:_prdcr.itemVrtyCd});
			} else {
				SBUxMethod.set("rawMtrPop-slt-itemCd", itemCd);
				popRawMtr.onChangeItem({value:_prdcr.itemCd});
			}
		},
		setPrdcr: function(_objPrdcr) {
			if (!gfn_isEmpty(_objPrdcr)) {
				popRawMtr.setPrdcrForm(_objPrdcr);
			}
		},
		clearPrdcr: function() {
			SBUxMethod.set("rawMtrPop-inp-prdcrCd", "");
			SBUxMethod.set("rawMtrPop-inp-prdcrNm", "");
			SBUxMethod.set("rawMtrPop-inp-prdcrIdentno", "");
			SBUxMethod.attr("rawMtrPop-inp-prdcrNm", "style", "background-color:''");
		},
		choicePrdcr: function () {
			const apcCd = SBUxMethod.get("rawMtrPop-inp-apcCd");
			const apcNm = SBUxMethod.get("rawMtrPop-inp-apcNm");
			popPrdcr.init(apcCd, apcNm, popRawMtr.setPrdcr);
		},
		onSelectPrdcr: function(value, label, item) {
			const prdcrInfo = _.find(jsonRawMtrPopPrdcr, {prdcrCd: value});
			popRawMtr.setPrdcrForm(prdcrInfo);
		},
		onkeyupPrdcr: function(_prdcrNm) {
			if (gfn_getByteLengthOfString(_prdcrNm) > 100){
				return;
			}
			jsonRawMtrPopPrdcrInitial = gfn_filterFrst(_prdcrNm, jsonRawMtrPopPrdcr);
			SBUxMethod.changeAutocompleteData('rawMtrPop-inp-prdcrNm', true);
		},
		onChangePrdcrIdentno: function(obj) {
			const prdcrIdentno = SBUxMethod.get("rawMtrPop-inp-prdcrIdentno");
			if (gfn_isEmpty(prdcrIdentno)) {
				return;
			}
			const pNo = parseInt(prdcrIdentno) || 0;
			if (pNo < 1) {
				return;
			}
			const prdcrInfo = _.find(jsonRawMtrPopPrdcr, {prdcrIdentno: pNo});
			if (gfn_isEmpty(prdcrInfo)) {
				return;
			}
			popRawMtr.setPrdcrForm(prdcrInfo);
		},
	}

	function popRawMtrOnSelectPrdcr(value, label, item) {
		const prdcrInfo = _.find(jsonRawMtrPopPrdcr, {prdcrCd: value});
		popRawMtr.setPrdcrForm(prdcrInfo);
	}

</script>
</html>