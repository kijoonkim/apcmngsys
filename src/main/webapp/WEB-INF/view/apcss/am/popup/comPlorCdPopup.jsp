<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 공통코드 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>

				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnChoicePlorCd" name="btnChoicePlorCd" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popPlorCd.choice"></sbux-button>
					<sbux-button id="btnSearchPlorCd" name="btnSearchPlorCd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPlorCd.search"></sbux-button>
					<sbux-button id="btnEndPlorCd" name="btnEndPlorCd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-plorCd')"></sbux-button>


					<sbux-input id="input_hidden1" name="input_hidden1" uitype="hidden"></sbux-input>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=oprtr-inp-apcNm name="oprtr-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th scope="row">
								<sbux-label id="idxLabel_norm" name="label_norm" uitype="normal" text=""></sbux-label>
							</th>
							<th>
								<sbux-input id=oprtr-inp-flnm name="oprtr-inp-plorNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdplorCd" style="height:250px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonplorCdPop = []; // 그리드의 참조 데이터 주소 선언

	const popPlorCd = {
		modalId: 'modal-plorCd',
		gridId: 'grdplorCdPop',
		jsonId: 'jsonplorCdPop',
		areaId: "sb-area-grdplorCd",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _plorCd,_cdVl,_cdVlNm , _callbackChoiceFnc) {

			this.prvApcCd = _apcCd;

			SBUxMethod.set("label_norm",_cdVlNm);
			SBUxMethod.set("input_hidden1",_cdVl);
			SBUxMethod.set("oprtr-inp-apcNm", _apcNm);
			SBUxMethod.set("oprtr-inp-plorNm", _plorCd);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			this.createGrid();
			this.search();
		},
		close: function(_plor) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _plor);
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
		    SBGridProperties.paging = {
					'type' : 'page',
				  	'count' : 5,
				  	'size' : 100,
				  	'sorttype' : 'page',
				  	'showgoalpageui' : true
				};
		    SBGridProperties.columns = [
		        {caption: ["산지코드"], 	ref: 'plorCd',  	type: 'output',  width:'100px',	style:'text-align:center',
		        	},
	        	{caption: ["산지명"], 	ref: 'plorNm',  	type: 'output',  width:'100px',	style:'text-align:center',
		        	}

		    ];
		    grdplorCdPop = _SBGrid.create(SBGridProperties);
		    grdplorCdPop.bind('dblclick', popPlorCd.choice);
		    grdplorCdPop.bind( "afterpagechanged" , "fn_pagingGrd" );
		    fn_pagingGrd();

		},
		choice: function() {
			let nRow = grdplorCdPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdplorCdPop.getRowData(nRow);
				popPlorCd.close(rowData);
			}
		},
		search: function(){
			fn_pagingGrd();
		}


	}
	const fn_pagingGrd = async function(){
    	let pageSize = grdplorCdPop.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdplorCdPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setPlorGrd(pageSize, pageNo);
    }

	const fn_setPlorGrd = async function(pageSize, pageNo) {
		let cdVl = SBUxMethod.get("input_hidden1");
		jsonplorCdPop = [];
		let plorNm = SBUxMethod.get("oprtr-inp-plorNm");
		console.log(plorNm);
		let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {
			cdId : cdVl,
			pagingYn : 'Y',
			cdVlNm :plorNm ,
			currentPageNo : pageNo,
			recordCountPerPage : pageSize
			}, null, true);
        let data = await postJsonPromise;
        try{
        	let totalRecordCount = 0;
        	jsonplorCdPop.lenght = 0;
        	data.resultList.forEach((item, index) => {
				let comCdDtlList = {
						plorCd : item.cdVl,
						plorNm : item.cdVlNm,

				}
				jsonplorCdPop.push(comCdDtlList);
				if (index === 0) {
	  					totalRecordCount = item.totalRecordCount;
				}
        	});
        	if (jsonplorCdPop.length > 0) {
	          		if(grdplorCdPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	          			grdplorCdPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	          			grdplorCdPop.rebuild();
	  				}else{
	  					grdplorCdPop.refresh();
	  				}
	          	} else {
	          		grdplorCdPop.setPageTotalCount(totalRecordCount);
	          		grdplorCdPop.rebuild();
	          	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

</script>
</html>