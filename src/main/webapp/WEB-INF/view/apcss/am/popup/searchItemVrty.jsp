<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 조회품종 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>

				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchItemVrtySave" name="btnSearchItemVrtySave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popSearchItemVrty.save"></sbux-button>
					<sbux-button id="btnSearchSearchItemVrty" name="btnSearchSearchItemVrty" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSearchItemVrty.search"></sbux-button>
					<sbux-button id="btnEndSearchItemVrty" name="btnEndSearchItemVrty" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-searchItemVrty')"></sbux-button>


					<sbux-input id="input-hidden1" name="input-hidden1" uitype="hidden"></sbux-input>
					<sbux-input id="input-hidden2" name="input-hidden2" uitype="hidden"></sbux-input>
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
								<sbux-input id="itemVrty-inp-apcNm" name="itemVrty-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th scope="row">
								<sbux-label id="itemVrty-label-norm" name="itemVrty-label-norm" uitype="normal" text="" style="font-weight: bold"></sbux-label>
							</th>
							<th>
								<sbux-input
									id="itemVrty-inp-comNm"
									name="itemVrty-inp-comNm"
									uitype="text"
									maxlength="33"
									class="form-control input-sm"
									onkeyenter="fn_comVrtyPopKeyEnter()"></sbux-input>
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
					<div id="sb-area-grdSearchItemVrty" style="height:250px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonSearchItemVrty = []; // 그리드의 참조 데이터 주소 선언

	 /** 대표품목 **/
    var jsonApcItem = [];

    /** 대표품종 **/
    var jsonApcVrty = [];


	const popSearchItemVrty = {
		modalId: 'modal-searchItemVrty',
		gridId: 'grdSearchItemVrty',
		jsonId: 'jsonSearchItemVrty',
		areaId: "sb-area-grdSearchItemVrty",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _ComCd,_cdVl,_cdVlNm,_prdcrCd , _callbackChoiceFnc) {


			await this.initSBselect();
			this.prvApcCd = _apcCd;

			SBUxMethod.set("itemVrty-label-norm",_cdVlNm);
			SBUxMethod.set("input-hidden1",_cdVl);
			SBUxMethod.set("input-hidden2",_prdcrCd);
			SBUxMethod.set("itemVrty-inp-apcNm", _apcNm);
			SBUxMethod.set("itemVrty-inp-comNm", _ComCd);

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
		    	{caption: ["처리"], 			ref: 'delYn', 			type: 'button', width: '50px', 	style: 'text-align:center', sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addVrtyRow(grdSearchItemVrty," + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delVrtyRow(grdSearchItemVrty," + nRow + ")'>삭제</button>";
		            	}
			    }},
		        {caption: ["생산자명"], 	ref: 'prdcrNm',  	type: 'output',  width:'100px',	style:'text-align:center'},
		        {caption: ['품목코드'], ref: 'itemCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonApcItem', label:'itemNm', value:'itemCd'}, style:'text-align:center'},
	        	{caption: ['품종코드'], ref: 'vrtyCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonApcVrty', label:'vrtyNm', value:'vrtyCd', filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false}},style:'text-align:center'},
	        	{caption: ["순번"], 	ref: 'indctSeq',  	type: 'input',  width:'100px',	style:'text-align:center'},

		        {caption: [""], 	ref: 'rmrk',  	type: 'output',  width:'100px',	style:'text-align:center'}


		    ];
		    grdSearchItemVrty = _SBGrid.create(SBGridProperties);
		    //grdSearchItemVrty.bind('dblclick', popComCd.choice);
		    grdSearchItemVrty.bind( "afterpagechanged" , "fn_pagingSearchItemVrty" );
		},
		choice: function() {
			let nRow = grdSearchItemVrty.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdSearchItemVrty.getRowData(nRow);
				popComCd.close(rowData);
			}
		},
		search: function(){
			fn_pagingSearchItemVrty();
		},
		initSBselect: async function(){
			let result = await Promise.all([

				gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
				gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, gv_apcCd)			// APC 품종(저장)
	        ]);
		},
		save : async function(){
			fn_saveItemVrty();
		}



	}
	const fn_pagingSearchItemVrty = async function(){
    	let pageSize = grdSearchItemVrty.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdSearchItemVrty.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setcomSearchItemVrty(pageSize, pageNo);
    }
	const fn_comVrtyPopKeyEnter = function(){
		fn_pagingSearchItemVrty();
	}
	const fn_setcomSearchItemVrty = async function(pageSize, pageNo) {
		let prdcrCd = SBUxMethod.get("input-hidden2");
		let itemNm = SBUxMethod.get("itemVrty-inp-comNm");
		let item = jsonApcItem.filter(item => item.itemNm === itemNm);
		let itemCd = "";
		if(gfn_nvl(item) !== ""){
			itemCd = item[0].itemCd;
		}


		jsonSearchItemVrty = [];

		let postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrTypeDtlList.do", {

			pagingYn : 'Y',
			currentPageNo : pageNo,
			recordCountPerPage : pageSize,
			prdcrCd : prdcrCd,
			apcCd : popSearchItemVrty.prvApcCd,
			crtrCd : itemCd
			}, null, true);

        let data = await postJsonPromise;
        try{
        	let totalRecordCount = 0;
        	jsonSearchItemVrty.lenght = 0;
        	data.resultList.forEach((item, index) => {
				let comCdDtlList = {
						prdcrNm : item.prdcrNm
						, prdcrCrtrType : item.prdcrCrtrType
						, itemCd : item.crtrCd.substring(0,4)
						, vrtyCd : item.crtrDtlCd
						, itemVrtyCd : item.crtrCd
						, indctSeq : item.indctSeq
						, delYn : item.delYn

				}
				jsonSearchItemVrty.push(comCdDtlList);
				if (index === 0) {
	  					totalRecordCount = item.totalRecordCount;
				}
        	});
        	if (jsonSearchItemVrty.length > 0) {
	          		if(grdSearchItemVrty.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	          			grdSearchItemVrty.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	          			grdSearchItemVrty.rebuild();
	          			grdSearchItemVrty.addRow();
	  				}else{
	  					grdSearchItemVrty.refresh();
	  					grdSearchItemVrty.addRow();
	  				}
	          	} else {
	          		grdSearchItemVrty.setPageTotalCount(totalRecordCount);
	          		grdSearchItemVrty.rebuild();
	          		grdSearchItemVrty.addRow();

	          	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

	const fn_addVrtyRow = async function(grd, nRow, nCol){

		 const editableRow = grd.getRowData(nRow, false);	// call by reference(deep copy)
        editableRow['delYn'] = "N";
        editableRow['gubun'] = "insert";

        //grd.rebuild();
        grd.addRow(true);
        grd.addStatus(nRow,"insert");

        nRow++;
        grd.setCellDisabled(nRow -1, 0, nRow -1, grd.getCols() - 1, false);
        grd.setCellDisabled(nRow, 0, nRow, grd.getCols() - 1, true);

	}

	/**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delVrtyRow = async function(grd,nRow) {
        let rowIndex = grd.getRow();
        let status = grd.getRowStatus(rowIndex);
        if(status === 0){
        	fn_deleteVrtyDtl(grd,rowIndex);
        }else{
        	grd.deleteRow(nRow);
        }
    }

	const fn_deleteVrtyDtl = async function(grd,nRow){

		if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };
        let rowData = grd.getRowData(nRow);
        let url = "";
        let prdcrCd = SBUxMethod.get("input-hidden2")



        let obj = {
        		prdcrCd : prdcrCd
        		, prdcrCrtrType : 'ITEM_VRTY_FILTER'
        		, crtrCd : rowData.itemCd + rowData.vrtyCd
        		, crtrDtlCd : rowData.vrtyCd
        		, apcCd : gv_apcCd
        }

        let postJsonPromise = gfn_postJSON("/am/cmns/deletePrdcrTypeDtl.do",obj);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                	fn_search();
                    gfn_comAlert("I0001");
                }
            };
        }catch (e){
            console.error(e);
        }


	}

	const fn_saveItemVrty = async function(){

		let allData = grdSearchItemVrty.getGridDataAll();
		let prdcrCd  = SBUxMethod.get("input-hidden2");

        try{

        	allData.forEach(item => {
        		if(gfn_nvl(item.gubun) === ""){
        			item.gubun = "update";
    			}
        		item['apcCd'] = gv_apcCd;
        		item['crtrCd'] = item['itemCd'] + item['vrtyCd'];
        		item['crtrDtlCd'] = item['vrtyCd'];
        		item['prdcrCd'] = prdcrCd;
        		item['prdcrCrtrType'] = 'ITEM_VRTY_FILTER';
        	})
			let filterData = allData.filter(item => item.delYn === "N")
            let postJsonPromise = gfn_postJSON("/am/cmns/savePrdcrTypeDtlList.do",filterData);

            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    //gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    //fn_reset();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
	}



</script>
</html>