<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 법정동코드 선택</title>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display: flex; justify-content: flex-start;">
            <div style="margin-left: auto;">
                <sbux-button
                    text="선택"
                    id="btnChoice"
                    name="btnChoice"
                    uitype="normal"
                    class="btn btn-sm btn-outline-danger"
                    onclick="popStdgCd.choice"
                ></sbux-button>
                <sbux-button
                    text="조회"
                    id="btnSearchStdg"
                    name="btnSearchStdg"
                    uitype="normal"
                    class="btn btn-sm btn-outline-danger"
                    onclick="popStdgCd.search"
                ></sbux-button>
                <sbux-button
                    text="종료"
                    id="btnEnd"
                    name="btnEnd"
                    uitype="normal"
                    class="btn btn-sm btn-outline-danger"
                    onclick="popStdgCd.close"
                ></sbux-button>
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
                            <sbux-input
                                id="stdgCd-inp-apcNm"
                                name="stdgCd-inp-apcNm"
                                uitype="text"
                                class="form-control input-sm"
                                disabled
                            ></sbux-input>
                        </th>
                        <th scope="row">법정동명</th>
                        <th>
                            <sbux-input
                                id="stdgCd-inp-stdgNm"
                                name="stdgCd-inp-stdgNm"
                                uitype="text"
                                maxlength="10"
                                class="form-control input-sm"
                                onkeyenter="fn_stdgCdPopKeyEnter()"
                            ></sbux-input>
                        </th>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div class="ad_section_top">
                <div id="sb-area-grdStdgCd" style="height:250px; width: 100%;"></div>
            </div>
            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    var jsonStdgCdPop = [];

    const popStdgCd = {
        modalId: 'modal-stdgCd',
        gridId: 'grdStdgCdPop',
        jsonId: 'jsonStdgCdPop',
        areaId: 'sb-area-grdStdgCd',
        prvApcCd: "",
        objGrid: null,
        gridJson: [],
        callbackSelectFnc: function() {},
        init: async function(_apcCd, _apcNm, _stdgCd, _callbackSelectFnc) {
            this.prvApcCd = _apcCd;

            SBUxMethod.set("stdgCd-inp-apcNm", _apcNm);

            if(!gfn_isEmpty(_callbackSelectFnc) && typeof _callbackSelectFnc === 'function') {
                this.callbackSelectFnc = _callbackSelectFnc;
            }
            this.createGrid();
            this.search();
        },
        createGrid: function() {
            var SBGridProperties = {};
            SBGridProperties.parentid = this.areaId;
            SBGridProperties.id = this.gridId;
            SBGridProperties.jsonref = this.jsonId;
            SBGridProperties.emptyrecords = '데이터가 없습니다.';
            SBGridProperties.selectmode = 'byrow';
            SBGridProperties.excomerbar = 'sortmove';
            SBGridProperties.extendlastcol = 'scroll';
            SBGridProperties.oneclickedit = true;
            SBGridProperties.allowcopy = true;
            SBGridProperties.scrollbubbling = false;
            SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
            SBGridProperties.paging = {
                'type': 'page',
                'count': 5,
                'size': 100,
                'sorttype': 'page',
                'showgoalpageui': true
            };
            SBGridProperties.columns = [
                {caption: ["법정동코드"], ref: 'stdgCd', type: 'output', width:'100px', style:'text-align: center;'},
                {caption: ["법정동명"], ref: 'stdg', type: 'output', width:'100px', style:'text-align: center;'}
            ];

            grdStdgCdPop = _SBGrid.create(SBGridProperties);
            grdStdgCdPop.bind('dblclick', popStdgCd.choice);
            grdStdgCdPop.bind("afterpagechanged" , "fn_pagingGrd" );
            fn_pagingGrd();
        },
        close: function(_stdg) {
            gfn_closeModal(this.modalId, this.callbackSelectFnc, _stdg);
        },
        choice: function() {
            let nRow = grdStdgCdPop.getRow();
            if(nRow == -1) {
                gfn_comAlert("W0003", "선택");    //  W0003    {0}할 대상이 없습니다.
                return;
            } else {
                let rowData = grdStdgCdPop.getRowData(nRow);
                gfn_closeModal(popStdgCd.modalId, popStdgCd.callbackSelectFnc, rowData);
            }
        },
        search: function() {
            fn_pagingGrd();
        }
    }

    const fn_stdgCdPopKeyEnter = function() {
        fn_pagingGrd();
    }

    const fn_pagingGrd = async function() {
        let pageSize = grdStdgCdPop.getPageSize();    // 몇개의 데이터를 가져올지 설정
        let pageNo = grdStdgCdPop.getSelectPageIndex();    // 몇번째 인덱스 부터 데이터를 가져올지 설정
        fn_setStdgGrd(pageSize, pageNo);
    }

    const fn_setStdgGrd = async function(pageSize, pageNo) {
        jsonStdgCdPop = [];

        let stdg = SBUxMethod.get("stdgCd-inp-stdgNm");

        let postJsonPromise = gfn_postJSON("/am/wrhs/selectStdg.do", {
            stdg: stdg,
            pagingYn: 'Y',
            currentPageNo: pageNo,
            recordCountPerPage: pageSize
        }, null, true);
        let data = await postJsonPromise;
        console.log("data: ", data);

        try {
            let totalRecordCount = 0;

            jsonStdgCdPop.lenght = 0;

            data.resultList.forEach((item, index) => {
                let stdgCdList = {
                    stdgCd: item.stdgCd,
                    stdg: item.stdg
                }

                jsonStdgCdPop.push(stdgCdList);

                if(index === 0) {
                    totalRecordCount = item.totalRecordCount;
                }
            });

            if(jsonStdgCdPop.length > 0) {
                if(grdStdgCdPop.getPageTotalCount() != totalRecordCount) {    // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
                    grdStdgCdPop.setPageTotalCount(totalRecordCount);    // 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
                    grdStdgCdPop.rebuild();
                } else {
                    grdStdgCdPop.refresh();
                }
            } else {
                grdStdgCdPop.setPageTotalCount(totalRecordCount);
                grdStdgCdPop.rebuild();
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }

            console.error("failed", e.message);
            gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }
</script>
</html>