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
					<sbux-button id="btnChoiceComCd" name="btnChoiceComCd" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popComCd.choice"></sbux-button>
					<sbux-button id="btnSearchComCd" name="btnSearchComCd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popComCd.search"></sbux-button>
					<sbux-button id="btnEndComCd" name="btnEndComCd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-comCd')"></sbux-button>


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
								<sbux-input id=oprtr-inp-flnm name="oprtr-inp-comNm" uitype="text" maxlength="33" class="form-control input-sm" onkeyenter="fnKeyEnter(oprtr-inp-flnm)"></sbux-input>
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
					<div id="sb-area-grdComCd" style="height:250px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonComCdPop = []; // 그리드의 참조 데이터 주소 선언

	const popComCd = {
		modalId: 'modal-comCd',
		gridId: 'grdComCdPop',
		jsonId: 'jsonComCdPop',
		areaId: "sb-area-grdComCd",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _ComCd,_cdVl,_cdVlNm , _callbackChoiceFnc) {

			this.prvApcCd = _apcCd;

			SBUxMethod.set("label_norm",_cdVlNm);
			SBUxMethod.set("input_hidden1",_cdVl);
			SBUxMethod.set("oprtr-inp-apcNm", _apcNm);
			SBUxMethod.set("oprtr-inp-comNm", _ComCd);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			this.createGrid();
			this.search();
		},
		close: function(_com) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _com);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.excomerbar = 'sortmove';
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
		        {caption: ["산지코드"], 	ref: 'comCd',  	type: 'output',  width:'100px',	style:'text-align:center',
		        	},
	        	{caption: ["산지명"], 	ref: 'comNm',  	type: 'output',  width:'100px',	style:'text-align:center',
		        	}

		    ];
		    grdComCdPop = _SBGrid.create(SBGridProperties);
		    grdComCdPop.bind('dblclick', popComCd.choice);
		    grdComCdPop.bind( "afterpagechanged" , "fn_pagingGrd" );
		    fn_pagingGrd();

		},
		choice: function() {
			let nRow = grdComCdPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdComCdPop.getRowData(nRow);
				popComCd.close(rowData);
			}
		},
		search: function(){
			fn_pagingGrd();
		}


	}
	const fn_pagingGrd = async function(){
    	let pageSize = grdComCdPop.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdComCdPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setcomGrd(pageSize, pageNo);
    }
	function fnKeyEnter(args){
		popComCd.search;
	}
	const fn_setcomGrd = async function(pageSize, pageNo) {
		let cdVl = SBUxMethod.get("input_hidden1");
		jsonComCdPop = [];
		let comNm = SBUxMethod.get("oprtr-inp-comNm");

		let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {
			cdId : cdVl,
			pagingYn : 'Y',
			cdVlNm :comNm ,
			currentPageNo : pageNo,
			recordCountPerPage : pageSize
			}, null, true);
        let data = await postJsonPromise;
        try{
        	let totalRecordCount = 0;
        	jsonComCdPop.lenght = 0;
        	data.resultList.forEach((item, index) => {
				let comCdDtlList = {
						comCd : item.cdVl,
						comNm : item.cdVlNm,

				}
				jsonComCdPop.push(comCdDtlList);
				if (index === 0) {
	  					totalRecordCount = item.totalRecordCount;
				}
        	});
        	if (jsonComCdPop.length > 0) {
	          		if(grdComCdPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	          			grdComCdPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	          			grdComCdPop.rebuild();
	  				}else{
	  					grdComCdPop.refresh();
	  				}
	          	} else {
	          		grdComCdPop.setPageTotalCount(totalRecordCount);
	          		grdComCdPop.rebuild();
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