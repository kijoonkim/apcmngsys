<%
    /**
     * @Class Name : rawMtrWrhsPrfmnc.jsp
     * @Description : 계량 기준정보 관리 화면
     * @author SI개발부
     * @since 2024.07.17
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.07.17   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 계량 기준정보 관리</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
<%--    <script src="/js/vue.global.js"></script>--%>
<%--    <script src="/js/vuex.global.js"></script>--%>
    <style>

    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 입고실적조회 -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
                    <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
                    <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                    <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 6%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">계량대</th>
                            <td class="tb_input" colspan="3" style="border-right: hidden;border-top: hidden;padding: 3px">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-sortFcltCd"
                                        name="srch-slt-sortFcltCd"
                                        class="form-control input-sm"
                                        style="width: 80%"
                                        jsondata-ref="jsonSortFclt">
                                </sbux-select>
                            </td>
                            <td colspan="9" style="border-top: hidden"></td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>계량대 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdWghList"></div>
                    </div>
                    <div style="display: flex;gap: 3vw">
                        <div style="flex: 1.6">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>기본정보</span>
                                    </li>
                                    <li id="createFlag"style="display: none">
                                        <span style="color: red">신규생성중</span>
                                    </li>
                                    <li id="editFlag"style="display: none">
                                        <span style="color: red">수정중</span>
                                    </li>
                                </ul>
                            </div>
                            <table id="wghDtlTable" class="table table-bordered tbl_fixed">
                                <caption>검색 조건 설정</caption>
                                <colgroup>
                                    <col style="width: 15%">
                                    <col style="width: 35%">
                                    <col style="width: 15%">
                                    <col style="width: 35%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="th_bg">코드</th>
                                        <td class="td_input">
                                            <sbux-input readonly id="dtl-inp-fcltCd" name="dtl-inp-fcltCd" uitype="text" class="form-control input-sm">
                                            </sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg"><span class="data_required"></span>명칭</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-fcltNm" name="dtl-inp-fcltNm" uitype="text" class="form-control input-sm">
                                            </sbux-input>
                                        </td>
                                    </tr>
<%--                                    <tr>--%>
<%--                                        <th scope="row" class="th_bg">계량유형</th>--%>
<%--                                        <td class="td_input">--%>
<%--                                            <sbux-select--%>
<%--                                                    id="dtl-slt-fcltType"--%>
<%--                                                    name="dtl-slt-fcltType"--%>
<%--                                                    uitype="single"--%>
<%--                                                    jsondata-ref="jsonFcltType"--%>
<%--                                                    unselected-text="전체"--%>
<%--                                                    class="form-control input-sm input-sm-ast"--%>
<%--&lt;%&ndash;                                                    onchange="fn_onChangeSrchItemCd(this)"&ndash;%&gt;--%>
<%--                                            ></sbux-select>--%>
<%--                                        </td>--%>
<%--                                        <th scope="row" class="th_bg">입고유형</th>--%>
<%--                                        <td class="td_input">--%>
<%--                                            <sbux-select--%>
<%--                                                    id="dtl-slt-wrhsType"--%>
<%--                                                    name="dtl-slt-wrhsType"--%>
<%--                                                    uitype="single"--%>
<%--                                                    jsondata-ref="jsonWrhsType"--%>
<%--                                                    unselected-text="전체"--%>
<%--                                                    class="form-control input-sm input-sm-ast"--%>
<%--&lt;%&ndash;                                                    onchange="fn_onChangeSrchItemCd(this)"&ndash;%&gt;--%>
<%--                                            ></sbux-select>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
                                    <tr>
                                        <th scope="row" class="th_bg">설명</th>
                                        <td class="td_input" colspan="3">
                                            <sbux-input id="dtl-inp-fcltExpln" name="dtl-inp-fcltExpln" uitype="text" class="form-control input-sm">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">최소중량</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-wghtMin" name="dtl-inp-wghtMin" uitype="text" class="form-control input-sm" permit-keycodes-set="num" exclude-kr="kr">
                                            </sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">계량횟수</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-prcsNmtm" name="dtl-inp-prcsNmtm" uitype="text" class="form-control input-sm" permit-keycodes-set="num" exclude-kr="kr">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">최대중량</th>
                                        <td class="td_input">
                                            <sbux-input id="dtl-inp-wghtMax" name="dtl-inp-wghtMax" uitype="text" class="form-control input-sm" permit-keycodes-set="num" exclude-kr="kr">
                                            </sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">기본창고</th>
                                        <td class="td_input">
                                            <sbux-select
                                                    id="dtl-slt-warehouseSeCd"
                                                    name="dtl-slt-warehouseSeCd"
                                                    uitype="single"
                                                    jsondata-ref="jsonWarehouseSeCd"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                            <%--    onchange="fn_onChangeSrchItemCd(this)"--%>
                                            ></sbux-select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">중량단위</th>
                                        <td class="td_input" style="border-right: hidden">
                                            <sbux-select
                                                    id="dtl-slt-cpctUnit"
                                                    name="dtl-slt-cpctUnit"
                                                    uitype="single"
                                                    jsondata-ref="jsonCpctUnit"
                                                    unselected-text="전체"
                                                    class="form-control input-sm input-sm-ast"
                                            <%--                                                    onchange="fn_onChangeSrchItemCd(this)"--%>
                                            ></sbux-select>
                                        </td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">시작일자</th>
                                        <td class="td_input">
                                            <sbux-datepicker id="dtl-dtp-bgngYmd" name="dtl-dtp-bgngYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast sbux-pik-group-apc" onchange="fn_editMode(this)"></sbux-datepicker>
                                        </td>
                                        <th scope="row" class="th_bg">종료일자</th>
                                        <td class="td_input">
                                            <sbux-datepicker id="dtl-dtp-endYmd" name="dtl-dtp-endYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast sbux-pik-group-apc" onchange="fn_editMode(this)"></sbux-datepicker>
                                        </td>
                                    </tr>
                                    <tr style="height: 5vh">
                                        <th rowspan="2" scope="row" class="th_bg">비고</th>
                                        <td rowspan="2" class="td_input" colspan="3">
                                            <sbux-textarea
                                                    uitype="normal"
                                                    id="dtl-inp-fcltRmrk"
                                                    name="dtl-inp-fcltRmrk"
                                                    style="height: 100%"
                                                    class="form-control input-sm">
                                            </sbux-textarea>
                                        </td>
                                    </tr>
                                    <tr><td></td></tr>

                                </tbody>

                            </table>
                        </div>
                        <div style="flex: 1;display: flex;flex-direction: column;">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>상세정보</span>
                                    </li>
                                </ul>
                            </div>
                            <div id="sb-area-grdWghDtlList" style="flex: 1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div-rpt-clipReportPrint" style="display:none;"></div>
    </section>
</body>
<script>
    var jsonSortFclt = [];
    /** 상단 grid ref Json **/
    var jsonWghList =[];
    var grdWghList;
    /** 하단 grid ref Json **/
    var jsonWghDtlList =[];
    var grdWghDtlList;
    /** 기본창고 select **/
    var jsonWarehouseSeCd =[];
    /** 중량단위 select **/
    var jsonCpctUnit =[];
    /** 입고유형 select **/
    var jsonWrhsType =[];
    /** 생성모드 Flag **/
    let createMode = false;
    /** 수정모드 Flag **/
    let editMode = false;

    const fn_init = async function(){
        /** 모든 input autoComplete Off**/
        $("input").attr("autocomplete", "off");
        /** 하단 Table 입력시 생성모드 **/
        $('*[id^="dtl"]').on("change",fn_editMode.bind(this));

        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-sortFcltCd',	jsonSortFclt, 	'WGH_FCLT_CD', 	gv_selectedApcCd),
            gfn_setComCdSBSelect('dtl-slt-warehouseSeCd',	jsonWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
            gfn_setComCdSBSelect('dtl-slt-cpctUnit',	jsonCpctUnit, 	'UNIT_CD'),	// 창고
            gfn_setComCdSBSelect('dtl-slt-wrhsType',	jsonWrhsType, 	'WRHS_SE_CD'),	// 입고유형
        ]);
    }
    /** 상단 버튼 action start **/
    const fn_create = async function(_mustFlag = false){
        /** 초기화 강제 원복 **/
        if(_mustFlag){
            let btn = document.getElementById("btnCreate");
            btn.classList.add("btn-outline-danger");
            btn.classList.remove("btn-success");
            $("#btnCreate span").text("신규");
            $("#dtl-inp-fcltCd").val("");
            createMode = false;
            return;
        }
        /** 수정중에 신규버튼을 누를때 **/
        if(editMode){
            if(!gfn_comConfirm("Q0001","수정중인 목록입니다. 신규생성")){
                return;
            }
        };
        /** 수정관련 상태 초기화 **/
        editMode = false;
        $("#btnSave span").text("저장");
        let btn = document.getElementById("btnSave");
        btn.classList.add("btn-outline-danger");
        btn.classList.remove("btn-success");
        $("#editFlag").css("display","none");


        if(!createMode){
            /** 신규 진입시 모든 폼 클리어는 직접함 양쪽의존 **/
            jsonWghList.length = 0;
            grdWghList.rebuild();
            grdWghList.setEmptyRecords("신규 생성중");
            jsonWghDtlList.length = 0;
            grdWghDtlList.rebuild();
            let nRow = grdWghDtlList.getRows();
            grdWghDtlList.addRow(true);
            grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);
            /** 저장버튼 활성화 **/
            SBUxMethod.attr("btnSave","disabled","false");

            /** table reset **/
            const inputs = document.querySelectorAll('input[id^="dtl"]');
            for (const item of inputs) {
               await SBUxMethod.set(item.id, null);
            }
            let btn = document.getElementById("btnCreate");
            btn.classList.remove("btn-outline-danger");
            btn.classList.add("btn-success");
            $("#btnCreate span").text("신규 취소");
            $("#createFlag").css("display","table-cell");
            $("#dtl-inp-fcltCd").val("자동발번");
            createMode = true;
        }else{
            await fn_reset();
        }
    }
    const fn_search = async function(){
        try{
            let postJsonPromise = gfn_postJSON("/am/cmns/selectWghDtlInfo.do",{apcCd:gv_apcCd});
            let data = await postJsonPromise;
            console.log(data);

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0){
                jsonWghList.length = 0;
                data.resultList.forEach((item) => {
                    jsonWghList.push(item);
                });
                grdWghList.rebuild();
            }else{
                jsonWghList.length = 0;
                grdWghList.rebuild();
                jsonWghDtlList.length = 0;
                grdWghDtlList.rebuild();

                let nRow = grdWghDtlList.getRows();
                grdWghDtlList.addRow(true);
                grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);

                const inputs = document.querySelectorAll('input[id^="dtl"]');
                inputs.forEach((item) => {
                    SBUxMethod.set(item.id, null);
                });
            }

        }catch (e){
            console.log(e);
        }
    }
    const fn_save = async function(){
        try{
            let wghInfo ={"apcCd" : gv_apcCd};
            let inputs = document.querySelectorAll('*[id^="dtl"]');

            inputs.forEach((item) => {
                let lastIndex = item.id.lastIndexOf("-");
                let extractedPart = item.id.substring(lastIndex + 1);
                wghInfo[extractedPart] = item.value;
            });

            /** 날짜 FORMAT **/
            wghInfo.bgngYmd = SBUxMethod.get("dtl-dtp-bgngYmd");
            wghInfo.endYmd = SBUxMethod.get("dtl-dtp-endYmd");

            let grdWghDtl = grdWghDtlList.getGridDataAll().filter((item,idx) => {
                delete item.itemCd;
                item.apcCd = gv_apcCd;
                item.sn = idx;
                return item.delYn == 'N'});

            let postJsonPromise;

            if(createMode && !editMode){
                 postJsonPromise = gfn_postJSON("/am/cmns/insertWghInfo.do",[wghInfo,grdWghDtl]);
            }else if(editMode && !createMode){
                 postJsonPromise = gfn_postJSON("/am/cmns/updateWghInfo.do",[wghInfo,grdWghDtl]);
            }else{
                gfn_comAlert("I0002","모드가 잘못됨",editMode,createMode);
            }
            if(postJsonPromise){
                let data = await postJsonPromise;
                if (data.resultStatus == "S") {
                    // gfn_comAlert(data.resultCode, data.resultMessage);
                    gfn_comAlert("I0002","1건",createMode?"생성":"수정");
                    fn_reset();
                    return;
                }
            }

        }catch (e){
            console.log(e);
        }
    }
    const fn_reset = async function () {
        /** gird reset **/
        jsonWghList.length = 0;
        grdWghList.rebuild();
        jsonWghDtlList.length = 0;
        grdWghDtlList.rebuild();
        /** table reset **/
        const inputs = document.querySelectorAll('input[id^="dtl"]');
        inputs.forEach((item) => {
            SBUxMethod.set(item.id, null);
        });
        /** select 전체 세팅 **/
        await SBUxMethod.set("dtl-slt-cpctUnit",null);
        let nRow = grdWghDtlList.getRows();
        grdWghDtlList.addRow(true);
        grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);

        /** 삭제 버튼 **/
        SBUxMethod.attr("btnDelete","disabled","true");
        SBUxMethod.attr("btnSave","disabled","true");
        /** 수정 생성 모드 **/
        $("#createFlag").css("display","none");
        $("#editFlag").css("display","none");

        /** 생성모드 OFF **/
        fn_create(true);
        /** 수정모드 OFF **/
        editMode = false;
        $("#btnSave span").text("저장");
        let btn = document.getElementById("btnSave");
        btn.classList.add("btn-outline-danger");
        btn.classList.remove("btn-success");

        fn_search();
    }
    const fn_delete = async function(){
        if(editMode){
            if(!gfn_comConfirm("Q0001","수정중인 목록입니다. 삭제")){
                return;
            }
        };
        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        };

        let idx = grdWghList.getRow();
        let wghDtlVO = grdWghList.getRowData(idx);
        let postJsonPromise = gfn_postJSON("/am/cmns/deleteWghInfo.do",wghDtlVO);
        let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.deletedCnt > 0){
                    gfn_comAlert("I0001");
                    fn_search();
                }
            };
        }catch (e){
            console.error(e);
        }
    }


    /** 상단 목록 grid create **/
    const fn_createWghListGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdWghList';
        SBGridProperties.id = 'grdWghList';
        SBGridProperties.jsonref = 'jsonWghList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.clickeventarea = {fixed: true, empty: false};
        SBGridProperties.columns = [
            {caption: ['코드'], ref: 'fcltCd', width: '10%', type: 'output', style:'text-align:center'},
            {caption: ['명칭'], ref: 'dtlIndctNm', width: '30%', type: 'output', style:'text-align:center'},
            {caption: ['설명'], ref: 'fcltExpln', width: '40%', type: 'output', style:'text-align:center'},
            {caption: ['연계코드'], ref: 'prdcrNm', width: '20%', type: 'output', style:'text-align:center'},
        ]
        grdWghList = _SBGrid.create(SBGridProperties);
        grdWghList.bind('click','fn_selectWghInfo');
    }
    /** 하단 우측 grid create **/
    const fn_createWghDtlListGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdWghDtlList';
        SBGridProperties.id = 'grdWghDtlList';
        SBGridProperties.jsonref = 'jsonWghDtlList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리"], 		ref: 'itemCd', 		type:'button', width:'10%', style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ['상세 유형'], ref: 'fcltAtrbType', width: '33%', type: 'input', style:'text-align:center'},
            {caption: ['상세 수치'], ref: 'atrbVl', width: '24%', type: 'input', style:'text-align:center'},
            {caption: ['상세 코드'], ref: 'atrbCd', width: '33%', type: 'input', style:'text-align:center'},
        ]
        grdWghDtlList = _SBGrid.create(SBGridProperties);
        grdWghDtlList.bind('valuechanged','fn_editMode');
        let nRow = grdWghDtlList.getRows();
        grdWghDtlList.addRow(true);
        grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {

        const editableRow = grdWghDtlList.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.delYn = "N";
        //grdSortPrfmnc.setCellData(nRow, nCol, "xxx", true);

        grdWghDtlList.rebuild();
        // grdWghDtlList.setCellDisabled(nRow, 0, nRow, 3, true);
        // grdWghDtlList.setCellDisabled(nRow, 4, nRow, grdWghDtlList.getCols() - 1, false);
        // nRow++;
        grdWghDtlList.addRow(true);
        nRow++;
        grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);
        // grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(nRow) {
        let gridSelectFlag = grdWghList.getRow();
        if(gridSelectFlag > -1 && !createMode){
            fn_editMode();
        }
        grdWghDtlList.deleteRow(nRow);
    }

    /**
     * @name fn_dtpChange
     * @description 입고일자 from to validation
     * @function
     */
    const fn_dtpChange = function(_targetId){
        let wrhsYmdFrom = SBUxMethod.get("dtl-dtp-bgngYmd");
        let wrhsYmdTo = SBUxMethod.get("dtl-dtp-endYmd");
        let newValue = 0;
        if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
            gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
            if(_targetId.id == 'dtl-dtp-bgngYmd'){
                 newValue = wrhsYmdTo - 1;
            }else{
                 newValue = parseInt(wrhsYmdFrom) + 1;
            }
            SBUxMethod.set(_targetId.id, String(newValue));
            return;
        }
    }

    /**
     * @name fn_selectWghInfo
     * @description 상단 그리드 click event => 상세 목록 조회
     * @function
     */
    const fn_selectWghInfo = async function(){
        if(editMode){
            if(!gfn_comConfirm("Q0001","수정중인 목록이있습니다. 조회")){
                return;
            }
        }
        $("#editFlag").css("display","none");
        editMode = false;

        let rowIdx = grdWghList.getRow();
        let wghDtlVO = grdWghList.getRowData(rowIdx);
        if(gfn_isEmpty(wghDtlVO)){
            return;
        }
        wghDtlVO.apcCd = gv_apcCd;

            let postJsonPromise = gfn_postJSON("/am/cmns/selectWghDtlInfo.do",wghDtlVO);
            let data = await postJsonPromise;

        try{
            if(data.resultStatus == "S"){
                if(data.resultList.length >= 0){
                    /** 우측 GRID **/
                    let fcltVO = JSON.parse(data.resultJson);
                    jsonWghDtlList.length = 0;
                    jsonWghDtlList = data.resultList;
                    grdWghDtlList.rebuild();

                    let nRow = grdWghDtlList.getRows();
                    grdWghDtlList.addRow(true);
                    grdWghDtlList.setCellDisabled(nRow, 0, nRow, grdWghDtlList.getCols() - 1, true);

                    /** 좌측 TABLE **/
                    const inputs = document.querySelectorAll('*[id^="dtl"]');
                    inputs.forEach((item) => {
                        let lastIndex = item.id.lastIndexOf("-");
                        let extractedPart = item.id.substring(lastIndex + 1);
                        item.value = fcltVO[extractedPart];
                    });
                    SBUxMethod.set("dtl-dtp-bgngYmd",fcltVO.bgngYmd);
                    SBUxMethod.set("dtl-dtp-endYmd",fcltVO.endYmd);

                    /** 삭제 버튼 **/
                    SBUxMethod.attr("btnDelete","disabled","false");
                }
            }
        }catch (e){
            console.error();
        }

    }
    const fn_editMode = async function(_el = null){
        let preValue;
        let preId;
        try{
            if(_el != null){
                preValue = _el.currentTarget.value;
                preId = _el.currentTarget.id;
            }
        }catch (e){
            preValue = $(_el).val();
            preId = $(_el).attr("id");
        }
        /** 신규생성모드에서 일반 입력시**/
        if(createMode) {
            return;
        }
        let chkGrid = grdWghList.getRow();

        /** 계량목록 있을때 수정모드 **/
         if(chkGrid > -1){
            editMode = true;
            $("#editFlag").css("display","table-cell");
            let btn = document.getElementById("btnSave");
            btn.classList.remove("btn-outline-danger");
            btn.classList.add("btn-success");

            SBUxMethod.attr("btnSave","disabled","false");
            $("#btnSave span").text("수정");
        /** 계량목록 선택된게 없을때 신규모드 **/
        }else{
            await fn_create();
            SBUxMethod.set(preId,preValue);
        }
    }

    window.addEventListener("DOMContentLoaded",function(){
        fn_createWghListGrid();
        fn_createWghDtlListGrid();
        fn_search();
        fn_init();
    });

</script>

<%--<script type="module">--%>
<%--    const { createStore } = Vuex;--%>
<%--    const { createApp } = Vue;--%>
<%--    const store = createStore({--%>
<%--        state() {--%>
<%--            return {--%>
<%--                message: 'Hello Vuex!'--%>
<%--            }--%>
<%--        },--%>
<%--        mutations: {--%>
<%--            setMessage(state, newMessage) {--%>
<%--                state.message = newMessage;--%>
<%--            }--%>
<%--        },--%>
<%--        actions: {--%>
<%--            updateMessage({ commit }, newMessage) {--%>
<%--                commit('setMessage', newMessage);--%>
<%--            }--%>
<%--        },--%>
<%--        getters: {--%>
<%--            message(state) {--%>
<%--                return state.message;--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>
<%--    const app = createApp({--%>
<%--        computed: {--%>
<%--            message() {--%>
<%--                return this.$store.getters.message;--%>
<%--            }--%>
<%--        },--%>
<%--        methods: {--%>
<%--            changeMessage() {--%>
<%--                this.$store.dispatch('updateMessage', 'New message from Vuex!');--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>
<%--    app.use(store);--%>
<%--    app.mount('#aaa');--%>

<%--</script>--%>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
