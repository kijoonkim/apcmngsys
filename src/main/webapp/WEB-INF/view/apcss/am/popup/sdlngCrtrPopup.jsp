<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 육묘기준 관리</title>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <p>
                    <span style="font-weight:bold;"></span>
                </p>
                <p>
                    <span style="color:black; font-weight:bold;"></span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                    id="btnSearchSdlngCrtr"
                    name="btnSearchSdlngCrtr"
                    uitype="normal"
                    text="조회"
                    class="btn btn-sm btn-outline-danger"
                    onclick="sdlngCrtrPop.search"
                ></sbux-button>
                <sbux-button
                    id="btnSaveSdlngCrtr"
                    name="btnSaveSdlngCrtr"
                    uitype="normal"
                    text="저장"
                    class="btn btn-sm btn-outline-danger"
                    onclick="sdlngCrtrPop.save"
                ></sbux-button>
                <sbux-button
                    id="btnEndSdlngCrtr"
                    name="btnEndSdlngCrtr"
                    uitype="normal"
                    text="종료"
                    class="btn btn-sm btn-outline-danger"
                    onclick="sdlngCrtrPop.close"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <table class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: 12%">
                    <col style="width: 24%">
                    <col style="width: auto">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">APC명</th>
                        <th colspan="2">
                            <sbux-input
                                id="sdlngCrtr-inp-apcCd"
                                name="sdlngCrtr-inp-apcCd"
                                uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                id="sdlngCrtr-inp-apcNm"
                                name="sdlngCrtr-inp-apcNm"
                                uitype="text"
                                class="form-control input-sm"
                                disabled
                            ></sbux-input>
                        </th>
                        <th colspan="2">&nbsp;</th>
                    </tr>
                </tbody>
            </table>

            <div class="ad_section_top">
                <div id="sb-area-gridSdlngCrtr" style="width: 100%; height: 300px;"></div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    var gridSdlngCrtr = null;
    var jsonSdlngCrtrPopUp = [];
    var jsonApcItemCd = [];    // 품목    itemCd    Grid
    var jsonApcVrtyCd = [];    // 품종    vrtyCd    Grid

    const sdlngCrtrPop = {
        modalId: 'modal-sdlngCrtrPop',
        gridId: 'gridSdlngCrtr',
        jsonId: 'jsonSdlngCrtrPopUp',
        areaId: "sb-area-gridSdlngCrtr",
        prvApcCd: "",
        callbackChoiceFnc: function() {},
        callbackSelectFnc: function() {},
        init: async function(_apcCd, _apcNm, _callbackChoiceFnc) {
            SBUxMethod.set("sdlngCrtr-inp-apcCd", _apcCd);
            SBUxMethod.set("sdlngCrtr-inp-apcNm", _apcNm);

            if(this.prvApcCd != _apcCd) {
                await this.initSBSelect();
                this.createGrid();
                this.search();
            } else {
                this.search();
            }

            this.prvApcCd = _apcCd;
        },
        initSBSelect: async function() {
            let rst = await Promise.all([
                gfn_setApcItemSBSelect(this.gridId, jsonApcItemCd, gv_selectedApcCd),    // 품목
                gfn_setApcVrtySBSelect(this.gridId, jsonApcVrtyCd, gv_selectedApcCd)    // 품종
            ]);
        },
        createGrid: function() {
            var SBGridProperties = {};
            SBGridProperties.parentid = this.areaId;
            SBGridProperties.id = this.gridId;
            SBGridProperties.jsonref = this.jsonId;
            SBGridProperties.emptyrecords = '데이터가 없습니다.';
            SBGridProperties.selectmode = 'free';
            SBGridProperties.explorerbar = 'move';
            SBGridProperties.extendlastcol = 'scroll';
            SBGridProperties.oneclickedit = true;
            SBGridProperties.allowcopy = true;
            SBGridProperties.columns = [
                {
                    caption: ["처리"], ref: 'delYn', type: 'button', width: '50px', style: 'text-align: center', sortable: false,
                    renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                        if(gfn_isEmpty(strValue)) {
                            return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_sdlngCrtrAddRow(" + nRow + ", " + nCol + ")'>추가</button>";
                        } else {
                            return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_sdlngCrtrDelRow(" + nRow + ")'>삭제</button>";
                        }
                    }
                },
                { caption: ["순서"], ref: 'indctSeq', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 10} },
                { caption: ["육묘명"], ref: 'sdlngNm', width: '150px', type: 'input', style:'text-align: center; background: #FFF8DC;' },
                { caption: ["품목"], ref: 'itemCd', type: 'combo', width: '90px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonApcItemCd', label: 'label', value: 'value', itemcount: 10} },
                { caption: ['품종'], ref: 'itemVrtyCd', type: 'combo', width: '90px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonApcVrtyCd', label: 'label', value: 'itemVrtyCd', itemcount: 10, filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd'}} },
                { caption: ['사용여부'], ref: 'useYn', width: '100px', style: 'text-align: center', type: 'multiradio', typeinfo: {radiolabel: ['사용', '미사용'], radiovalue: ['Y', 'N']} },
                { caption: ["육묘일수"], ref: 'sdlngDayCnt', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 4}, format: {type: 'number', rule: '#,###'} },
                { caption: ['육묘코드'], ref: 'sdlngCd', hidden: true },
            ];

            gridSdlngCrtr = _SBGrid.create(SBGridProperties);
        },
        search: async function() {
            gridSdlngCrtr.rebuild();

            jsonSdlngCrtrPopUp.length = 0;
            await this.setGrid();
        },
        save: async function() {
            var sdlngCrtrList = [];

            let sdlngAllData = gridSdlngCrtr.getGridDataAll();
            for(var i = 1; i < sdlngAllData.length; i++) {
                const rowData = gridSdlngCrtr.getRowData(i);
                const rowSts = gridSdlngCrtr.getRowStatus(i);

                if(rowData.delYn != 'N') {
                    continue;
                }

                if(gfn_isEmpty(rowData.indctSeq)) {
                    gfn_comAlert("W0002", "순서");    // W0002    {0}을/를 입력하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.sdlngNm)) {
                    gfn_comAlert("W0002", "육묘명");    // W0002    {0}을/를 입력하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.itemCd)) {
                    gfn_comAlert("W0002", "품목");    // W0002    {0}을/를 입력하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.itemVrtyCd)) {
                    gfn_comAlert("W0002", "품종");    // W0002    {0}을/를 입력하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.useYn)) {
                    gfn_comAlert("W0001", "사용여부");    // W0001    {0}을/를 선택하세요.
                    return;
                }

                if(!gfn_isEmpty(rowData.itemCd)) {
                    rowData.vrtyCd = rowData.itemVrtyCd.substring(4);
                }

                let param = {
                    apcCd: gv_selectedApcCd,
                    indctSeq: rowData.indctSeq,
                    sdlngNm: rowData.sdlngNm,
                    itemCd: rowData.itemCd,
                    vrtyCd: rowData.vrtyCd,
                    useYn: rowData.useYn,
                    sdlngDayCnt: rowData.sdlngDayCnt,
                    sdlngCd: rowData.sdlngCd
                }

                if(rowSts === 3) {
                    param.rowSts = "I";
                    sdlngCrtrList.push(param);
                } else if(rowSts === 2) {
                    param.rowSts = "U";
                    sdlngCrtrList.push(param);
                } else {
                    continue;
                }
            }

            if(sdlngCrtrList.length == 0) {
                gfn_comAlert("W0003", "저장");    // W0003    {0}할 대상이 없습니다.
                return;
            }

            console.log("sdlngCrtrList: ", sdlngCrtrList);

            if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
                return;
            }

            const postJsonPromise = gfn_postJSON("/am/wrhs/multiSdlngCrtrList.do", sdlngCrtrList);
            const data = await postJsonPromise;

            try {
                if(_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                    this.search();
                } else {
                    gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
                }
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        },
        close: function(_callbackFnc, _data) {
            gfn_closeModal(this.modalId, _callbackFnc, _data);

            if(typeof this.callbackChoiceFnc === 'function') {
                this.callbackChoiceFnc();
            }
        },
        setGrid: async function() {
            let apcCd = SBUxMethod.get("sdlngCrtr-inp-apcCd");

            let postJsonPromise = gfn_postJSON("/am/wrhs/selectSdlngCrtrList.do", {
                apcCd: apcCd
            });
            let data = await postJsonPromise;

            try {
                jsonSdlngCrtrPopUp.length = 0;

                data.resultList.forEach((item, index) => {
                    const sdlngCrtrVO = {
                        sdlngCd: item.sdlngCd,
                        sdlngNm: item.sdlngNm,
                        itemCd: item.itemCd,
                        itemVrtyCd: item.itemCd + item.vrtyCd,
                        indctSeq: item.indctSeq,
                        sdlngDayCnt: item.sdlngDayCnt == 0 ? null : item.sdlngDayCnt,
                        useYn: item.useYn,
                        delYn: item.delYn
                    }

                    jsonSdlngCrtrPopUp.push(sdlngCrtrVO);
                });

                gridSdlngCrtr.rebuild();
                gridSdlngCrtr.setCellDisabled(0, 0, gridSdlngCrtr.getRows() - 1, gridSdlngCrtr.getCols() - 1, false);
                let nRow = gridSdlngCrtr.getRows();
                gridSdlngCrtr.addRow(true);
                gridSdlngCrtr.setCellDisabled(nRow, 0, nRow, gridSdlngCrtr.getCols() - 1, true);
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        }
    }

    const fn_sdlngCrtrAddRow = async function(nRow, nCol) {
        gridSdlngCrtr.setCellData(nRow, nCol, "N", true);
        gridSdlngCrtr.setCellDisabled(nRow, 0, nRow, gridSdlngCrtr.getCols() - 1, false);
        nRow++;
        gridSdlngCrtr.addRow(true);
        gridSdlngCrtr.setCellDisabled(nRow, 0, nRow, gridSdlngCrtr.getCols() - 1, true);
    }

    const fn_sdlngCrtrDelRow = async function(nRow) {
        const rowData = gridSdlngCrtr.getRowData(nRow);
        const rowSts = gridSdlngCrtr.getRowStatus(nRow);

        if(rowSts == 0 || rowSts == 2) {
            let postJsonPromise = gfn_postJSON("/am/wrhs/selectSdlngList.do", {
                apcCd: gv_selectedApcCd,
                sdlngCd: rowData.sdlngCd
            });
            let data = await postJsonPromise;

            if(data.resultList.length !== 0) {
                gfn_comAlert("E0000", "해당 육묘는 육묘장이/가 존재 합니다.");
                return;
            }

            if(!gfn_comConfirm("Q0001", "삭제")) {    // Q0001    {0} 하시겠습니까?
                return;
            }

            postJsonPromise = gfn_postJSON("/am/wrhs/deleteSdlngCrtrList.do", {
                apcCd: gv_selectedApcCd,
                sdlngCd: rowData.sdlngCd
            });
            data = await postJsonPromise;

            try {
                if(_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                    sdlngCrtrPop.search();
                } else {
                    gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
                }
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                // gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } else {
            gridSdlngCrtr.deleteRow(nRow);
        }
    }
</script>
</html>