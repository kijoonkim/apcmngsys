<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 품목/품종 등록</title>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <p>
                    <span style="font-weight:bold;">APC에서 관리하고 있는 원산지를 선택하세요.(여러가지 원산지를 관리할 수 있습니다.)</span>
                </p>
                <p>
                    <span style="color:black; font-weight:bold;">원산지는 농수축산물 표준코드를 준수하며 APC별 사용자 정의로 등록할 수 있습니다.</span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnSaveVrtyDtl"
                        name="btnChoisPlor"
                        uitype="normal"
                        text="저장"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_vrtyDtlSave"
                ></sbux-button>
                <sbux-button
                        id="btnSearchVrtyDtl"
                        name="btnSearchPlor"
                        uitype="normal"
                        text="조회"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_searchVrtyDtlData"
                ></sbux-button>
                <sbux-button
                        id="btnEndVrtyDtl"
                        name="btnEndVrtyDtl"
                        uitype="normal"
                        text="종료"
                        class="btn btn-sm btn-outline-danger"
                        onclick="gfn_closeModal('modal-vrtyDtl')"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <div>
                <!--[pp] 검색 -->
                <table class="table table-bordered tbl_row tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 100px">
                        <col style="width: 200px">
                        <col style="width: 100px">
                        <col style="width: 200px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row">APC명</th>
                        <th>
                            <sbux-input
                                    id="srch-inp-apcNm"
                                    name="srch-inp-apcNm"
                                    uitype="text"
                                    class="form-control input-sm"
                                    disabled
                            ></sbux-input>
                        </th>
                        <th scope="row">품목명</th>
                        <th  style="border-right-style: hidden;">
                            <sbux-select
                                    id="srch-slt-vrtyDtl"
                                    name="srch-slt-vrtyDtl"
                                    uitype="single"
                                    wrap-style="background-color:white"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonItemVrtyDtl"
                                    onchange="fn_searchVrtyDtlData(srch-slt-vrtyDtl)"
                            ></sbux-select>
                        </th>
                        <th>&nbsp;</th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div class="row">
                <div class="ad_tbl_top"  style="width: 98%;">
                    <ul class="ad_tbl_count">
                        <li><span>APC 표준 원산지</span></li>
                    </ul>
                </div>
                <div style="display: flex;gap: 3px; height: 200px">
                    <div id="sb-area-grdVrtyDtl" style="flex: 1"></div>
                    <div id="sb-area-grdSeed" style="flex: 1"></div>
                </div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    /** grid 변수 **/
    var jsonVrtyDtl = [];
    var grdVrtyDtl;

    var jsonSeed = [];
    var grdSeed;

    var jsonItemVrtyDtl = [];
    /** 등급관리코드 json **/
    let jsonGrdMng = [];

    const fn_initVrtyDtl = async function(){
        fn_createVrtyDtlGrid();
        fn_createSeed();
        await fn_selectComCdDtl();
        SBUxMethod.set("srch-inp-apcNm", SBUxMethod.get("inp-apcNm"));
        await gfn_setApcItemSBSelect('srch-slt-vrtyDtl', jsonItemVrtyDtl, gv_selectedApcCd);
        await fn_searchVrtyDtlData(jsonItemVrtyDtl[0].itemCd);
    }

    const fn_createVrtyDtlGrid = function(){
        let SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdVrtyDtl';
        SBGridProperties.id = 'grdVrtyDtl';
        SBGridProperties.jsonref = 'jsonVrtyDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리"], 		ref: 'apcCd',   	type:'button', width:'10%',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
                    if(strValue== null || strValue == ""){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' data-id='grdVrtyDtl' onClick=\"gfn_gridRowPlusMinus(event, 'ADD', " + nRow + ")\">추가</button>";
                    }else{
                        return "<button type='button' class='btn btn-xs btn-outline-danger' data-id='grdVrtyDtl' data-del-fn='fn_deleteVrtyDtl' onClick=\"gfn_gridRowPlusMinus(event, 'DEL', " + nRow + ")\">삭제</button>";
                    }
            }},
            {caption: ["상세코드"], ref: 'itemDtlCd', type:'input',width:'16%',style:'text-align:center'},
            {caption: ["상세명"], ref: 'itemDtlNm', type:'input',width:'18%',style:'text-align:center'},
            {caption: ["등급관리코드"], ref: 'grdMngCd', type:'combo',width:'20%',style:'text-align:center',typeinfo:{ref:'jsonGrdMng', displayui: true, label: 'cdVlNm', value: 'cdVl', oneclickedit: true}},
            {caption: ["표시순서"], ref: 'indctSeq', type:'input',width:'16%',style:'text-align:center'},
            {caption: ["사용여부"], ref: 'useYn', type:'multiradio',width:'20%',style:'text-align:center',typeinfo : {radiolabel : ['사용', '미사용'], radiovalue : ['Y', 'N']}},
        ]
        grdVrtyDtl = _SBGrid.create(SBGridProperties);
    }

    const fn_createSeed = function(){
        SBUxMethod.set("oprtr-inp-apcNm", SBUxMethod.get("inp-apcNm"));
        let SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSeed';
        SBGridProperties.id = 'grdSeed';
        SBGridProperties.jsonref = 'jsonSeed';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리"], 		ref: 'apcCd',   	type:'button', width:'10%',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
                    if(strValue== null || strValue == ""){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' data-id='grdSeed' onClick=\"gfn_gridRowPlusMinus(event, 'ADD', " + nRow + ")\">추가</button>";
                    }else{
                        return "<button type='button' class='btn btn-xs btn-outline-danger' data-id='grdSeed' data-del-fn='fn_deleteSeed' onClick=\"gfn_gridRowPlusMinus(event, 'DEL', " + nRow + ")\">삭제</button>";
                    }
                }},
            {caption: ["종자코드"], ref: 'seedCd', type:'output',width:'22.5%',style:'text-align:center'},
            {caption: ["종자명"], ref: 'seedNm', type:'input',width:'22.5%',style:'text-align:center'},
            {caption: ["표시순서"], ref: 'indctSeq', type:'input',width:'22.5%',style:'text-align:center'},
            {caption: ["품종코드"], ref: 'vrtyCd', type:'input',width:'22.5%',style:'text-align:center'},
        ]
        grdSeed = _SBGrid.create(SBGridProperties);
        grdSeed.bind('valuechanged','fn_updateRowStatus');
    }

    const fn_selectComCdDtl = async function(){
        let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {
            cdId : "GRD_MNG_CD",
        }, null, true);
        let data = await postJsonPromise;
        jsonGrdMng = data.resultList;
    }

    const fn_searchVrtyDtlData = async function(_value){
        if(gfn_isEmpty(_value)){
            _value = SBUxMethod.get("srch-slt-vrtyDtl");
        }
        await fn_searchSeedList(_value);
        await fn_searchVrtyDtl(_value);
    }

    const fn_searchVrtyDtl = async function(itemCd){
        const postJsonPromise = gfn_postJSON("/am/cmns/selectApcItemCrtrDtlList.do",{apcCd: gv_selectedApcCd, itemCd:itemCd});
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
        jsonVrtyDtl.length = 0;
        if(data.resultList.length > 0){
            jsonVrtyDtl = data.resultList;
        }
        grdVrtyDtl.rebuild();
        grdVrtyDtl.addRow();
        grdVrtyDtl.setCellDisabled(grdVrtyDtl.getRows() -1, 0, grdVrtyDtl.getRows() -1, grdVrtyDtl.getCols() -1, true);
    }

    const fn_searchSeedList = async function(itemCd){
        const postJsonPromise = gfn_postJSON("/am/cmns/selectApcSeedCrtrList.do",{apcCd: gv_selectedApcCd, itemCd:itemCd});
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        jsonSeed.length = 0;
        if(data.resultList.length > 0){
            jsonSeed = data.resultList;
        }
        grdSeed.rebuild();
        grdSeed.addRow();
        grdSeed.setCellDisabled(grdSeed.getRows() -1, 0, grdSeed.getRows() -1, grdSeed.getCols() -1, true);
    }

    /** 품목상세 항목 merge **/
    const fn_vrtyDtlSave = async function(){
        /** 품목이 살아있는가 검증 **/
        const itemCd = SBUxMethod.get("srch-slt-vrtyDtl");
        if (gfn_isEmpty(itemCd)) {
            gfn_comAlert("W0001", "품목");
            return;
        }

        const itemDtlList = fn_getChangedList(grdVrtyDtl, itemCd);
        if (hasDuplicateByKey(itemDtlList, 'itemDtlCd')) {
            gfn_comAlert("E0000","중복된 상세코드가 있습니다.");
            return;
        }

        const seedList = fn_getChangedList(grdSeed, itemCd);
        /**
         * 종자코드 자동발행으로 해당 조건 미사용 처리
         * */
        /*if (hasDuplicateByKey(seedList, 'seedCd')) {
            gfn_comAlert("W0026", "중복", "종자코드");    // W0026    {0}된 {1}이/가 있습니다.
            return;
        }*/

        if (itemDtlList.length === 0 && seedList === 0) {
            gfn_comAlert("W0003", "저장");    //  W0003	{0}할 대상이 없습니다.
            return;
        }

        if(!gfn_comConfirm("Q0001", "저장")) {
            return;
        }

        /** 상세목록 저장 **/
        let isSuccess = true;

        if (itemDtlList.length > 0) {
            isSuccess = await fn_saveVrtyDtl(itemDtlList);
        }

        if (isSuccess && seedList.length > 0) {
            isSuccess = await fn_saveSeed(seedList);
        }

        if (!isSuccess) {
            return;
        }

        gfn_comAlert("I0001");

        await fn_searchVrtyDtlData(itemCd);
    }

    /** 품목상세 항목 삭제 **/
    async function fn_deleteVrtyDtl(_delVO){
        _delVO.apcCd = gv_selectedApcCd;
        const postJsonPromise = gfn_postJSON("/am/cmns/deleteApcItemCrtrDtl.do",_delVO);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }

        gfn_comAlert("I0001");
        await fn_searchVrtyDtl(_delVO.itemCd);
    }

    async function fn_deleteSeed(_delVO){

        _delVO.apcCd = gv_selectedApcCd;

        const postJsonPromise = gfn_postJSON("/am/cmns/deleteSeedCrtr.do",_delVO);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        gfn_comAlert("I0001");
        await fn_searchSeedList(_delVO.itemCd);
    }

    /**
     * @name fn_getChangedVrtyDtl
     * @description 품목/품종 그리드 생성
     * @param {Object} _gridObj
     * @param {String} _itemCd
     * @return {Array}
     */
    const fn_getChangedList = function(_gridObj, _itemCd) {
        const allData = _gridObj.getGridDataAll();
        return allData.filter((item, idx) => {
            if (gfn_isEmpty(item.apcCd)) {
                return false;
            }
            item.apcCd = gv_selectedApcCd;
            item.itemCd = _itemCd;
            let status = _gridObj.getRowStatus(idx + 1);
            /**
             * 추가 버튼 클릭시 grd rebuild
             * bind를 통해 상태값 저장 후 불러오기
             * ( insert 상태값이 저장전에 update 상태로 변경돼도 종자코드가 없으므로 뒤에서 insert )
             * */
            if(!gfn_isEmpty(jsonSeed[idx].rowSts)) {
                item.rowSts = jsonSeed[idx].rowSts;
            }
            return !gfn_isEmpty(status);
        });
    }

    const fn_saveVrtyDtl = async function(_changedList){

        let isSuccess = false;
        try {
            const postJsonPromise = gfn_postJSON("/am/cmns/mergeApcItemCrtrDtlList.do", _changedList);
            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
            } else {
                isSuccess = true;
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        return isSuccess;
    }

    const fn_saveSeed = async function(_changedList) {

        let isSuccess = false;
        try {
            const postJsonPromise = gfn_postJSON("/am/cmns/insertSeedCrtrList.do", _changedList);
            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
            } else {
                isSuccess = true;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        return isSuccess;
    }

    function hasDuplicateByKey(arr, key) {
        const seen = new Set();
        for (const obj of arr) {
            const value = obj[key];
            if (seen.has(value)) return true;
            seen.add(value);
        }
        return false;
    }

    /**
     * @name fn_updateRowStatus
     * @description grdSeed 상태값 업데이트
     * */
    const fn_updateRowStatus = function () {
        let row = grdSeed.getRow() - 1;

        let status = grdSeed.getRowStatus(row + 1);
        if (status == 2) {
            jsonSeed[row].rowSts = "U";
        }
    }
</script>
</html>