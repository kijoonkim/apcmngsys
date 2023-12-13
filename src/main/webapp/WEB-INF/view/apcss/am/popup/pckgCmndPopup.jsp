<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 포장지시번호 선택</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">포장지시번호를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchPckgCmnd" name="btnSearchPckgCmnd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPckgCmnd.search"></sbux-button>
					<sbux-button id="btnChoicePckgCmnd" name="btnChoicePckgCmnd" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popPckgCmnd.choice"></sbux-button>
					<sbux-button id="btnEndPckgCmnd" name="btnEndPckgCmnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-pckgCmndno')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="pckgCmnd-inp-apcCd" name="pckgCmnd-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="pckgCmnd-inp-apcNm" name="pckgCmnd-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">포장지시일자</th>
							<th class="td_input">
								<sbux-datepicker id="pckgCmnd-dtp-pckgCmndYmd" name="pckgCmnd-dtp-pckgCmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</th>
							<th scope="row">규격</th>
							<th>
								<sbux-select id="pckgCmnd-slt-spcfctCd" name="pckgCmnd-slt-spcfctCd" uitype="single" class="form-control input-sm" style="background-color:#FFFFFF;" jsondata-ref="jsonApcSpcfct" unselected-text="전체"></sbux-select>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="pckgCmnd-slt-itemCd"
									name="pckgCmnd-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="popPckgCmnd.srchItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="pckgCmnd-slt-vrtyCd"
									name="pckgCmnd-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="popPckgCmnd.srchVrtyCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th></th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdPckgCmndPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	/* grid 내 select json */
	var jsonApcItem			= [];	// 품목 		itemCd			검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd			검색
	var jsonApcSpcfct		= [];	// 규격 		spcfct			검색

	var grdPckgCmndPop = null;
	
	const popPckgCmnd = {
		modalId: 'modal-pckgCmndno',
		gridId: 'grdPckgCmndPop',
		jsonId: 'jsonPckgCmndPop',
		areaId: "sb-area-grdPckgCmndPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackChoiceFnc) {
			SBUxMethod.set("pckgCmnd-inp-apcCd", _apcCd);
			SBUxMethod.set("pckgCmnd-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdPckgCmndPop === null || this.prvApcCd != _apcCd) {

				SBUxMethod.set("pckgCmnd-dtp-pckgCmndYmd", gfn_dateToYmd(new Date()));
				
				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('pckgCmnd-slt-itemCd', jsonApcItem, _apcCd),							// 품목
					gfn_setApcVrtySBSelect('pckgCmnd-slt-vrtyCd', jsonApcVrty, _apcCd)							// 품종
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_pckgCmnd) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _pckgCmnd);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.columns = [
		        {caption: ["지시번호","지시번호"],	ref: 'pckgCmndnoIndct', type:'output',  width:'130px',	style:'text-align:center'},
		        {caption: ["생산설비","생산설비"],	ref: 'fcltNm',      	type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["거래처","거래처"],		ref: 'cnptNm',      	type:'output',  width:'120px',	style:'text-align:center'},
		        {caption: ["품종","품종"],			ref: 'vrtyNm',      	type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["규격","규격"],			ref: 'spcfctNm',    	type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["납기일자","납기일자"],	ref: 'dudtYmd',     	type:'output',  width:'120px',	style:'text-align:center',
		        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ["지시","수량"],			ref: 'cmndQntt',    	type:'output',  width:'80px',	style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["지시","중량"],			ref: 'cmndWght',    	type:'output',  width:'80px',	style:'text-align:right',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["실적","수량"],			ref: 'pckgQntt',    	type:'output',  width:'80px',	style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["실적","중량"],			ref: 'pckgWght',    	type:'output',  width:'80px',	style:'text-align:right',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고","비고"],			ref: 'rmrk',      		type:'output',  width:'300px',	style:'text-align:center'},
		    ];
		    grdPckgCmndPop = _SBGrid.create(SBGridProperties);
		    grdPckgCmndPop.bind('dblclick', popPckgCmnd.choice);
		},
		choice: function() {
			let nRow = grdPckgCmndPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdPckgCmndPop.getRowData(nRow);
				popPckgCmnd.close(rowData);
			}
		},
		search: async function() {
			grdPckgCmndPop.rebuild();

	    	// grid clear
	    	jsonPckgCmndPop.length = 0;
	    	grdPckgCmndPop.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {
			jsonPckgCmndPop = [];

			let apcCd = SBUxMethod.get("pckgCmnd-inp-apcCd");
			let pckgCmndYmd = SBUxMethod.get("pckgCmnd-dtp-pckgCmndYmd");
			let itemCd = SBUxMethod.get("pckgCmnd-slt-itemCd");
			let vrtyCd = SBUxMethod.get("pckgCmnd-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("pckgCmnd-slt-spcfctCd");
			let pckgCmnd = {
					apcCd 				: apcCd,
					pckgCmndYmd 		: pckgCmndYmd,
					itemCd 				: itemCd,
					vrtyCd 				: vrtyCd,
					spcfctCd 			: spcfctCd
			}
			let postJsonPromise = gfn_postJSON("/am/pckg/selectPckgCmndList.do", pckgCmnd);
		    let data = await postJsonPromise;

		    try{
		    	jsonPckgCmndPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let pckgCmnd = {
		      				pckgCmndno		: item.pckgCmndno,
		      				pckgCmndSn		: item.pckgCmndSn,
		      				pckgCmndnoIndct	: item.pckgCmndnoIndct,
		      				pckgCmndYmd		: item.pckgCmndYmd,
		      				fcltCd			: item.fcltCd,
		      				fcltNm			: item.fcltNm,
		      				cnptCd			: item.cnptCd,
		      				cnptNm			: item.cnptNm,
		      				dudtYmd			: item.dudtYmd,
		      				itemCd			: item.itemCd,
		      				vrtyCd			: item.vrtyCd,
		      				vrtyNm			: item.vrtyNm,
		      				spcfctCd		: item.spcfctCd,
		      				spcfctNm		: item.spcfctNm,
		      				ordrQntt		: item.ordrQntt,
		      				ordrWght		: item.ordrWght,
		      				bxGdsQntt		: item.bxGdsQntt,
		      				cmndQntt		: item.cmndQntt,
		      				cmndWght		: item.cmndWght,
		      				pckgQntt		: item.pckgQntt,
		      				pckgWght		: item.pckgWght,
		      				ordrNo			: item.ordrNo,
		      				gdsCd			: item.gdsCd,
		      				gdsNm			: item.gdsNm,
		      				rmrk			: item.rmrk
					}
					jsonPckgCmndPop.push(pckgCmnd);
				});
	        	grdPckgCmndPop.rebuild();
		    } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		    }
	    },
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("pckgCmnd-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('pckgCmnd-slt-vrtyCd', jsonApcVrty, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('pckgCmnd-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)			// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("pckgCmnd-inp-apcCd");
			let vrtyCd = obj.value;
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("pckgCmnd-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("pckgCmnd-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("pckgCmnd-slt-vrtyCd", vrtyCd);
			}
			gfn_setApcSpcfctsSBSelect('pckgCmnd-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)
		}
	}
</script>
</html>