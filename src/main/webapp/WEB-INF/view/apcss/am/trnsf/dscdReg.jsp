<%
    /**
     * @Class Name : dscdReg.jsp
     * @Description : 폐기 등록 화면
     * @author SI개발부
     * @since 2024.12.19
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2024.11.25     손민성       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 폐기 등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 폐기 등록 -->
                </div>
                <%--/** 상단 버튼 **/--%>
                <div style="margin-left: auto;">
                    <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="초기화"
                        onclick="fn_reset"
                    ></sbux-button>
                    <sbux-button
                        disabled="true"
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="저장"
                        onclick="fn_save"
                    ></sbux-button>
                    <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
                    ></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <table id="searchTable" class="table table-bordered tbl_fixed">
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
                        <col style="width: 6%">
                        <col style="width: 3%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg"><span class="data_required"></span>재고구분</th>
                            <td class="td_input" colspan="2" style="border-right: hidden">
                                <sbux-select
                                    unselected-text="선택"
                                    uitype="single"
                                    id="srch-slt-invntrSeCd"
                                    name="srch-slt-invntrSeCd"
                                    class="form-control input-sm inpt_data_reqed"
                                    jsondata-ref="jsonInvntrSeCd"
                                    onchange="fn_onChangeInvvntrSeCd"
                                ></sbux-select>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">품목/품종</th>
                            <td class="td_input" colspan="3" style="border-right: hidden">
                                <div style="display: flex; gap: 5px">
                                    <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm input-sm-ast"
                                        jsondata-ref="jsonApcItem"
                                        onchange="fn_onChangeSrchItemCd(this)"
                                    ></sbux-select>
                                    <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-vrtyCd"
                                        name="srch-slt-vrtyCd"
                                        class="form-control input-sm input-sm-ast"
                                        jsondata-ref="jsonApcVrty"
                                        jsondata-value="itemVrtyCd"
                                        onchange="fn_onChangeSrchVrtyCd(this)"
                                    ></sbux-select>
                                </div>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">창고구분</th>
                            <td class="td_input" colspan="2" style="border-right: hidden">
                                <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-warehouseSeCd"
                                    name="srch-slt-warehouseSeCd"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcWarehouse"
                                ></sbux-select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">생산자</th>
                            <td class="td_input" colspan="3" style="border-right: hidden">
                                <div style="display: flex">
                                    <sbux-input
                                        id="srch-inp-prdcrCd"
                                        name="srch-inp-prdcrCd"
                                        uitype="hidden"
                                    ></sbux-input>
                                    <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrNm"
                                        name="srch-inp-prdcrNm"
                                        class="form-control input-sm"
                                        wrap-style="margin-right: 10px"
                                        placeholder="초성검색 가능"
                                        autocomplete-ref="jsonPrdcrAutocomplete"
                                        autocomplete-text="name"
                                        autocomplete-height="270px"
                                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                                        oninput="fn_onInputPrdcrNm(event)"
                                    ></sbux-input>
                                    <sbux-button
                                        id="btnSrchPrdcr"
                                        name="btnSrchPrdcr"
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기"
                                        uitype="modal"
                                        target-id="modal-prdcr"
                                        onclick="fn_choicePrdcr"
                                    ></sbux-button>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">규격</th>
                            <td class="td_input" colspan="3" style="border-right: hidden">
                                <sbux-select
                                    unselected-text="전체"
                                    id="dtl-slt-spcfctCd"
                                    name="dtl-slt-spcfctCd"
                                    uitype="single"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcSpcfct"
                                ></sbux-select>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">재고일자</th>
                            <td class="td_input" style="border-right: hidden">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-invntrYmdFrom"
                                    name="srch-dtp-invntrYmdFrom"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-invntrYmdFrom)"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-invntrYmdTo"
                                    name="srch-dtp-invntrYmdTo"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-invntrYmdTo)"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="display: flex; flex-direction: column; gap: 10px">
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>재고 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-invntrList" style="height: 200px"></div>
                    </div>
                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li><span>폐기 등록 목록</span></li>
                        </ul>
                        <div class="ad_tbl_toplist_datepk">
                            <table class="table table-bordered tbl_fixed">
                                <caption>검색 조건 설정</caption>
                                <colgroup>
                                    <col style="width: auto">
                                    <col style="width: 100px">
                                    <col style="width: 150px">
                                    <col style="width: 70px">
                                    <col style="width: 70px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td style="border-left:hidden"></td>
                                    <th scope="row" class="th_bg" style="border-left:hidden">폐기일자</th>
                                    <td class="td_input" style="border-right: hidden; border-left: hidden;">
                                        <sbux-datepicker
                                            uitype="popup"
                                            id="srch-dtp-dscdYmd"
                                            name="srch-dtp-dscdYmd"
                                            date-format="yyyy-mm-dd"
                                            class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                        ></sbux-datepicker>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                            id="btnAddRow"
                                            name="btnAddRow"
                                            uitype="normal"
                                            text="행추가"
                                            onclick="fn_addRow"
                                            class="btn btn-sm btn-outline-danger"
                                        ></sbux-button>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                            id="btnDelRow"
                                            name="btnDelRow"
                                            text="행삭제"
                                            uitype="modal"
                                            target-id="modal-ddln"
                                            onclick="fn_delRow"
                                            class="btn btn-sm btn-outline-danger"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-dscdRegList" style="height: 200px"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
            id="modal-prdcr"
            name="modal-prdcr"
            uitype="middle"
            header-title="생산자 선택"
            body-html-id="body-modal-prdcr"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
        <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="application/javascript">
    /** 생산자 관련 변수 **/
    var jsonDataPrdcr = [];
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];
    var autoCompleteDataJson = [];

    var jsonInvntrSeCd = [];    // 재고구분    invntrSeCd    검색
    var jsonApcItem = [];    // 품목    itemCd    검색
    var jsonApcVrty = [];    // 품종    vrtyCd    검색
    var jsonApcWarehouse = [];    // 창고    warehouseSeCd    검색
    var jsonApcSpcfct = [];    // 규격    scpfctCd    등록
    var jsonBadCd = [];    // 불량코드    badCd    조회
    var jsonDscdSeCd = [];    // 폐기사유코드    dscdSeCd    조회


    var dscdRegList = [];

    /** grid 변수 셋팅 **/
    var jsonInvntrList = [];    // 재고 목록
    var jsonDscdRegList = [];    // 폐기 등록 목록

    let gridInvntrList;
    let gridDscdRegList;

    window.addEventListener("DOMContentLoaded", function() {
        SBUxMethod.set("srch-dtp-invntrYmdTo", gfn_dateToYmd(new Date()));    // 재고 시작 일자
        SBUxMethod.set("srch-dtp-invntrYmdFrom", gfn_dateFirstYmd(new Date()));    // 재고 종료 일자
        SBUxMethod.set("srch-dtp-dscdYmd",gfn_dateToYmd(new Date()));    // 폐기 일자

        fn_init();
    });

    const fn_init = async function() {
        await fn_initSBSelect();
        await fn_create_rtnCrtr();
        await fn_create_rtnCrtrDtl();
        await fn_getPrdcrs();
    }

    /**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
    const fn_initSBSelect = async function() {
        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-invntrSeCd', jsonInvntrSeCd, 'INVNTR_SE_CD'),    // 재고구분
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_apcCd),    // 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_apcCd),    // 품종
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonApcWarehouse, 'WAREHOUSE_SE_CD', gv_apcCd),    // 창고
            gfn_postJSON("/am/dscd/selectDscdCrtrDtlList.do",{apcCd:gv_selectedApcCd}),
            gfn_postJSON("/am/dscd/selectDscdRegList.do", {apcCd: gv_selectedApcCd})
        ]);

        jsonBadCd = [...result[4].resultList] || [];
        jsonBadCd = jsonBadCd.map(item => {
            return{
                ...item,
                label: item.dscdCrtrType === "DSCD_BAD_CD" ? item.crtrIndctNm : '',
                value: item.crtrCd
            }
        });
        jsonBadCd = jsonBadCd.filter(item => item.label.trim() !== "");

        jsonDscdSeCd = [...result[4].resultList] || [];
        jsonDscdSeCd = jsonDscdSeCd.map(item => {
            return{
                ...item,
                label: item.dscdCrtrType === "DSCD_CS_CD" ? item.crtrIndctNm : '',
                value: item.crtrCd
            }
        });
        jsonDscdSeCd = jsonDscdSeCd.filter(item => item.label.trim() !== "");

        dscdRegList = [...result[5].resultList] || [];
    }

    const fn_create_rtnCrtr = async function() {
        var SBGridProperties = {};

        const invntrColumns = [];

        let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");

        SBGridProperties.parentid = 'sb-area-invntrList';
        SBGridProperties.id = 'gridInvntrList';
        SBGridProperties.jsonref = 'jsonInvntrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.datamergefalseskip = true;
        invntrColumns.push(
            {
                caption: ["선택", "선택"],
                ref: 'checkedYn',
                type: 'checkbox',
                width: '50px',
                style: 'text-align: center',
                userattr : {colNm :"checkedYn"},
                typeinfo: {
                    ignoreupdate: true,
                    checkedvalue: 'Y',
                    uncheckedvalue: 'N'
                }
            },
        )

        if(invntrSeCd == "1") {
            invntrColumns.push(
                {
                    caption: ['입고일자', '입고일자'],
                    ref: 'wrhsYmd',
                    width: '110px',
                    type: 'output',
                    style: 'text-align: center',
                    format: {
                        type: 'date',
                        rule: 'yyyy-mm-dd',
                        origin: 'yyyymmdd'
                    }
                },
                {
                    caption: ['입고번호', '입고번호'],
                    ref: 'wrhsNo',
                    width: '120px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['생산자', '생산자'],
                    ref: 'prdcrNm',
                    width: '100px',
                    type: 'output',
                    style: 'text-align: center'
                },
            )
        }
        if(invntrSeCd == "2") {
            invntrColumns.push(
                {
                    caption: ['선별일자', '선별일자'],
                    ref: 'sortYmd',
                    width: '110px',
                    type: 'output',
                    style: 'text-align: center',
                    format: {
                        type: 'date',
                        rule: 'yyyy-mm-dd',
                        origin: 'yyyymmdd'
                    }
                },
                {
                    caption: ['선별번호', '선별번호'],
                    ref: 'sortno',
                    width: '120px',
                    type: 'output',
                    style: 'text-align: center'
                },
            )
        }
        if(invntrSeCd == "3") {
            invntrColumns.push(
                {
                    caption: ['포장일자', '포장일자'],
                    ref: 'pckgYmd',
                    width: '110px',
                    type: 'output',
                    style: 'text-align: center',
                    format: {
                        type: 'date',
                        rule: 'yyyy-mm-dd',
                        origin: 'yyyymmdd'
                    }
                },
                {
                    caption: ['포장번호', '포장번호'],
                    ref: 'pckgno',
                    width: '120px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['상품명', '상품명'],
                    ref: 'gdsNm',
                    width: '100px',
                    type: 'output',
                    style: 'text-align: center'
                },
            )
        }

        invntrColumns.push(
            {
                caption: ['품목', '품목'],
                ref: 'itemNm',
                width: '90px',
                type: 'output',
                style: 'text-align: center'
            },
            {
                caption: ['품종', '품종'],
                ref: 'vrtyNm',
                width: '90px',
                type: 'output',
                style: 'text-align: center'
            },
        )

        if(invntrSeCd == "2" || invntrSeCd == "3") {
            invntrColumns.push(
                {
                    caption: ['규격', '규격'],
                    ref: 'spcfctNm',
                    width: '90px',
                    type: 'output',
                    style: 'text-align:center'
                },
            )
        }

        invntrColumns.push(
            {
                caption: ['등급', '등급'],
                ref: 'grdNm',
                width: '90px',
                type: 'output',
                style: 'text-align: center'
            },
            {
                caption: ['창고', '창고'],
                ref: 'warehouseSeNm',
                width: '100px',
                type: 'output',
                style: 'text-align: center'
            },
        )

        if(invntrSeCd == "2" || invntrSeCd == "3") {
            invntrColumns.push(
                {
                    caption: ['대표생산자', '대표생산자'],
                    ref: 'rprsPrdcrNm',
                    width: '100px',
                    type: 'output',
                    style: 'text-align: center'
                },
            )
        }

        invntrColumns.push(
            {
                caption: ['재고', '수량'],
                ref: 'invntrQntt',
                width: '60px',
                type: 'output',
                style: 'text-align: right',
                typeinfo: {
                    mask: {
                        alias: 'numeric'
                    }
                },
                format: {
                    type: 'number',
                    rule: '#,###'
                }
            },
            {
                caption: ['재고', '중량'],
                ref: 'invntrWght',
                width: '60px',
                type: 'output',
                style: 'text-align: right',
                typeinfo: {
                    mask: {
                        alias: 'numeric'
                    }
                },
                format: {
                    type: 'number',
                    rule: '#,###'
                }
            },
            {
                caption: ['폐기등록', '수량'],
                ref: 'dscdQnttReg',
                width: '60px',
                type: 'input',
                style: 'text-align: right; background-color: #FFF8DC;',
                userattr : {colNm : "dscdQnttReg"},
                typeinfo: {
                    mask: {
                        alias: 'numeric'
                    },
                    oneclickedit :true
                },
                format: {
                    type: 'number',
                    rule: '#,###'
                }
            },
            {
                caption: ['폐기등록', '중량'],
                ref: 'dscdWghtReg',
                width: '60px',
                type: 'input',
                style: 'text-align: right;  background-color: #FFF8DC;',
                userattr : {colNm : "dscdWghtReg"},
                typeinfo: {
                    mask: {
                        alias: 'numeric'
                    },
                    oneclickedit :true

                },
                format: {
                    type: 'number',
                    rule: '#,###'
                }
            }
        )

        SBGridProperties.columns = invntrColumns;
        gridInvntrList = _SBGrid.create(SBGridProperties);

        //gridInvntrList.bind("click", "fn_selectInvntr");
        gridInvntrList.bind('valuechanged','fn_gridInvntrValueChanged');
    }

    const fn_create_rtnCrtrDtl = async function() {
        var SBGridProperties = {};
        let dscdColumns = [];
        let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");

        SBGridProperties.parentid = 'sb-area-dscdRegList';
        SBGridProperties.id = 'gridDscdRegList';
        SBGridProperties.jsonref = 'jsonDscdRegList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.allowpaste = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.oneclickedit = true;
            dscdColumns.push(
                {
                    caption: ["선택", "선택"],
                    ref: 'checkedYn',
                    type: 'checkbox',
                    width: '50px',
                    style: 'text-align: center',
                    typeinfo: {
                        ignoreupdate: false,
                        checkedvalue: 'Y',
                        uncheckedvalue: 'N'
                    }
                },
                {
                    caption: ['재고구분', '재고구분'],
                    ref: 'invntrSeNm',
                    width: '100px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['재고번호', '재고번호'],
                    ref: 'invntrno',
                    width: '120px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['생산자', '생산자'],
                    ref: 'prdcrNm',
                    width: '90px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['품목', '품목'],
                    ref: 'itemNm',
                    width: '90px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['품종', '품종'],
                    ref: 'vrtyNm',
                    width: '90px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['규격', '규격'],
                    ref: 'spcfctNm',
                    width: '90px',
                    type: 'output',
                    style: 'text-align:center'
                },
                {
                    caption: ['등급', '등급'],
                    ref: 'grdNm',
                    width: '90px',
                    type: 'output',
                    style: 'text-align: center'
                },
            )
            if(invntrSeCd === "3") {
                dscdColumns.push(
                    {
                        caption: ['상품명', '상품명'],
                        ref: 'gdsNm',
                        width: '100px',
                        type: 'output',
                        style: 'text-align: center'
                    },
                )
            }
            dscdColumns.push(
                {
                    caption: ['창고', '창고'],
                    ref: 'warehouseSeNm',
                    width: '100px',
                    type: 'output',
                    style: 'text-align: center'
                },
                {
                    caption: ['폐기', '수량'],
                    ref: 'dscdQntt',
                    width: '60px',
                    type: 'output',
                    style: 'text-align: right;',
                    typeinfo: {
                        mask: {
                            alias: 'numeric'
                        }
                    },
                    format: {
                        type: 'number',
                        rule: '#,###'
                    }
                },
                {
                    caption: ['폐기', '중량'],
                    ref: 'dscdWght',
                    width: '60px',
                    type: 'output',
                    style: 'text-align: right;',
                    typeinfo: {
                        mask: {
                            alias: 'numeric'
                        }
                    },
                    format: {
                        type: 'number',
                        rule: '#,###'
                    }
                },
               {
                    caption: ['폐기원인코드', '폐기원인코드'],
                    ref: 'dscdCsCd',
                    width: '100px',
                    type: 'combo',
                    style: 'text-align: center; background-color: #FFF8DC;',
                    typeinfo: {
                        ref: 'jsonDscdSeCd',
                        label: 'label',
                        value: 'value'
                    }
                },
                {
                    caption: ['폐기사유코드', '폐기사유코드'],
                    ref: 'dscdBadCd',
                    width: '100px',
                    type: 'combo',
                    style: 'text-align: center; background-color: #FFF8DC;',
                    typeinfo: {
                        ref: 'jsonBadCd',
                        label: 'label',
                        value: 'value'
                    }
                },
                {
                    caption: ['폐기사유', '폐기사유'],
                    ref: 'dscdRsn',
                    width: '250px',
                    type: 'input',
                    style: 'text-align: center; background-color: #FFF8DC;'
                },
            )
        if(invntrSeCd === "2" || invntrSeCd === "3") {
            dscdColumns.push(
                {
                    caption: ['재고순번', '재고순번'],
                    ref: 'invntrSn',
                    width: '100px',
                    type: 'output',
                    style: 'text-align: center',
                    hidden : true
                },
            )
        }

        SBGridProperties.columns = dscdColumns;
        gridDscdRegList = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_search
     * @description 재고 목록 조회 event (clear)
     */
    const fn_search = async function() {
        jsonDscdRegList.length = 0;
        gridDscdRegList.rebuild();

        /*
        let srchParam = gfn_getTableElement("searchTable", "srch-", ["itemCd", "vrtyCd", "vhclno", "warehouseSeCd", "inqType", "prdcrNm", "prdcrCd"]);
        if(!srchParam) {
            return;
        }

        srchParam.vrtyCd = srchParam.vrtyCd?.substring(4);
        srchParam.apcCd = gv_apcCd; */


        let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
        let url = "";

        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
        let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let spcfctCd = SBUxMethod.get("dtl-slt-spcfctCd");
        let invntrYmdFrom = SBUxMethod.get("srch-dtp-invntrYmdFrom");
        let invntrYmdTo= SBUxMethod.get("srch-dtp-invntrYmdTo");
        if (!gfn_isEmpty(vrtyCd)) {
            vrtyCd = vrtyCd.substring(4);
        }

        if(invntrSeCd == "1") {
            url = "/am/dscd/selectRawMtrInvntrList.do";
        } else if(invntrSeCd == "2") {
            url = "/am/dscd/selectSortInvntrList.do";
        } else if(invntrSeCd == "3") {
            url = "/am/dscd/selectGdsInvntrList.do";
        } else if(gfn_isEmpty(invntrSeCd)) {
            gfn_comAlert("W0001", "재고구분");		//	W0002	{0}을/를 선택하세요.
            return;
        }

        const postJsonPromise = gfn_postJSON(url, {
            apcCd : gv_apcCd,
            invntrSeCd : invntrSeCd,
            itemCd : itemCd,
            vrtyCd : vrtyCd,
            warehouseSeCd : warehouseSeCd,
            prdcrCd : prdcrCd,
            spcfctCd : spcfctCd,
            invntrYmdFrom : invntrYmdFrom,
            invntrYmdTo : invntrYmdTo,
        });
        const data = await postJsonPromise;

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        if(data.resultList.length > 0) {
            jsonInvntrList = data.resultList;
            jsonInvntrList = jsonInvntrList.map(item=>({...item, dscdQnttReg : 0,dscdWghtReg : 0}));
            gridInvntrList.rebuild();
        }

        SBUxMethod.attr("btnSave", "disabled", "true");
    }

    /**
     * @name fn_selectInvntr
     * @description 재고 목록 클릭 시, 폐기 등록 목록 조회
     */
    const fn_selectInvntr = async function() {
        let nRow = gridInvntrList.getRow();
        let rowData = gridInvntrList.getRowData(nRow, true);

        if(rowData.checkedYn == "Y") {
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/dscd/selectDscdRegList.do", rowData);
        const data = await postJsonPromise;

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        gridDscdRegList.rebuild();
    }

    /**
     * @name fn_addRow
     * @description 폐기 등록 목록 추가
     */
    const fn_addRow = async function() {

        let result = jsonInvntrList.filter(item => item.checkedYn === "Y"); //재고목록

        if (result.length === 0) {
            gfn_comAlert("W0001", "폐기 등록할 재고");		//	W0001	{0}을/를 선택하세요.
            return;
        }
/*

        result.forEach(item => {
            let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
            let invntrSeNm;
            let invntrno;
            let prdcrCd;

            if (invntrSeCd == "1") {
                invntrSeNm = '원물재고';
                invntrSeCd = '1';
                invntrno = item.pltno;
                prdcrCd = item.prdcrCd;
            } else if (invntrSeCd == "2") {
                invntrSeNm = '선별재고';
                invntrSeCd = '2';
                invntrno = item.sortno;
                prdcrCd = item.rprsPrdcrCd;
            } else if (invntrSeCd == "3") {
                invntrSeNm = '상품재고';
                invntrSeCd = '3';
                invntrno = item.pckgno;
                prdcrCd = item.rprsPrdcrCd;
            }
            jsonDscdRegList.push({
                invntrSeNm: invntrSeNm,
                invntrno: invntrno,
                itemNm: item.itemNm,
                vrtyNm: item.vrtyNm,
                spcfctNm: item.spcfctNm,
                grdNm: item.grdNm,
                gdsNm: item.gdsNm,
                warehouseSeNm: item.warehouseSeNm,
                prdcrNm : item.prdcrNm,
                delYn: 'N',

                invntrSeCd: invntrSeCd,
                itemCd: item.itemCd,
                vrtyCd: item.vrtyCd,
                spcfctCd: item.spcfctCd,
                grdCd: item.grdCd,
                gdsSeCd: item.gdsSeCd,
                warehouseSeCd: item.warehouseSeCd,
                spmtPckgUnitCd: item.spmtPckgUnitCd,
                wrhsSeCd: item.wrhsSeCd,
                invntrSn: item.invntrSn,
                dtlSn: item.dtlSn,
                prdcrCd: prdcrCd,
                dscdQntt : item.dscdQnttReg,
                dscdWght : item.dscdWghtReg,
            });
        });
*/

        let allData = gridDscdRegList.getGridDataAll();//폐기등록목록
        let newAdd = [];

        let getInvntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");

        switch(getInvntrSeCd){
            case "1" :
                for( let i = 0; i<result.length; i++){
                    let isExist = false;
                    for( let j = 0; j < allData.length;j++){
                        if(result[i].wrhsNo === allData[j].wrhsNo){
                            isExist = true;
                            break;
                        }
                    }
                    if(!isExist){ //중복아닐때
                        newAdd.push(result[i]);
                    }
                }
                if(newAdd.length > 0){
                    let invntrSeNm = SBUxMethod.getText("srch-slt-invntrSeCd");
                    let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
                    for(let i = 0; i < newAdd.length; i++){
                        newAdd[i].invntrSeNm = invntrSeNm;
                        newAdd[i].invntrSeCd = invntrSeCd;
                        newAdd[i].invntrno = newAdd[i].wrhsNo;
                        newAdd[i].dscdQntt = newAdd[i].dscdQnttReg;
                        newAdd[i].dscdWght = newAdd[i].dscdWghtReg;
                    }
                    gridDscdRegList.addRows(newAdd);
                    gridDscdRegList.refresh();
                }
                break;
            case "2" :
                for( let i = 0; i<result.length; i++){
                    let isExist = false;
                    for( let j = 0; j < allData.length;j++){
                        if(result[i].sortno.concat(result[i].sortSn) === allData[j].sortno.concat(allData[j].sortSn)){
                            isExist = true;
                            break;
                        }
                    }
                    if(!isExist){ //중복아닐때
                        newAdd.push(result[i]);
                    }
                }
                if(newAdd.length > 0){
                    let invntrSeNm = SBUxMethod.getText("srch-slt-invntrSeCd");
                    let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
                    for(let i = 0; i < newAdd.length; i++){
                        newAdd[i].invntrSeNm = invntrSeNm;
                        newAdd[i].invntrSeCd = invntrSeCd;
                        newAdd[i].invntrno = newAdd[i].sortno;
                        newAdd[i].dscdQntt = newAdd[i].dscdQnttReg;
                        newAdd[i].dscdWght = newAdd[i].dscdWghtReg;
                        newAdd[i].prdcrNm = newAdd[i].rprsPrdcrNm
                    }
                    gridDscdRegList.addRows(newAdd);
                    gridDscdRegList.refresh();
                }
                break;
            case "3" :
                for( let i = 0; i<result.length; i++){
                    let isExist = false;
                    for( let j = 0; j < allData.length;j++){
                        if(result[i].pckgno.concat(result[i].pckgSn) === allData[j].pckgno.concat(allData[j].pckgSn)){
                            isExist = true;
                            break;
                        }
                    }
                    if(!isExist){ //중복아닐때
                        newAdd.push(result[i]);
                    }
                }
                if(newAdd.length > 0){
                    let invntrSeNm = SBUxMethod.getText("srch-slt-invntrSeCd");
                    let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
                    for(let i = 0; i < newAdd.length; i++){
                        newAdd[i].invntrSeNm = invntrSeNm;
                        newAdd[i].invntrSeCd = invntrSeCd;
                        newAdd[i].invntrno = newAdd[i].pckgno;
                        newAdd[i].dscdQntt = newAdd[i].dscdQnttReg;
                        newAdd[i].dscdWght = newAdd[i].dscdWghtReg;
                        newAdd[i].prdcrNm = newAdd[i].rprsPrdcrNm
                    }
                    gridDscdRegList.addRows(newAdd);
                    gridDscdRegList.refresh();
                }
                break;
            default :
                break;

        }
        SBUxMethod.attr("btnSave","disabled","false");
    }

    /**
     * @name fn_delRow
     * @description 폐기 등록 목록 삭제
     */
    const fn_delRow = async function() {
        let allData = gridDscdRegList.getGridDataAll();
        let deleteIndex = [];

        for(let i = 0; i < allData.length; i++){
            if(allData[i].checkedYn === "Y"){
                deleteIndex.push(i+2);
            }
        }
        if(gfn_isEmpty(deleteIndex)) {
            gfn_comAlert("W0003", "삭제");    // W0003 {0}할 대상이 없습니다.
            return;
        }
        for(let i = deleteIndex.length-1; i >= 0; i--){
            gridDscdRegList.deleteRow(deleteIndex[i]);
        }
    }

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        let dscdYmd = SBUxMethod.get("srch-dtp-dscdYmd");

        let saveParam = gridDscdRegList.getGridDataAll().filter(item => item.checkedYn === 'Y').map((item,index) => {
            let idx = dscdRegList.length;
            delete item.checkedYn;
            item.apcCd = gv_selectedApcCd;
            item.dscdYmd = dscdYmd;
            item.dtlSn = index + 1;
            return item;
        });


        if(!gfn_comConfirm("Q0001", "저장")) {    // 저장 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/dscd/insertDscdRegList.do", saveParam);
        const data = await postJsonPromise;

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        gfn_comAlert("I0001");

        await fn_search();
    }

    /**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
        SBUxMethod.attr("btnSave", "disabled", "true");
        SBUxMethod.set("srch-slt-invntrSeCd", "");
        SBUxMethod.set("srch-slt-itemCd", "");
        SBUxMethod.set("srch-slt-vrtyCd", "");
        SBUxMethod.set("srch-slt-warehouseSeCd", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:none");
        SBUxMethod.set("srch-inp-prdcrCd","");
        SBUxMethod.set("srch-inp-prdcrNm","");
        SBUxMethod.set("dtl-slt-spcfctCd","");
        SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'true');
        SBUxMethod.set("srch-dtp-invntrYmdTo", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-invntrYmdFrom", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("srch-dtp-dscdYmd",gfn_dateToYmd(new Date()));

        jsonInvntrList.length = 0;
        gridInvntrList.rebuild();

        jsonDscdRegList.length = 0;
        gridDscdRegList.rebuild();

        fn_initSBSelect();

        jsonApcSpcfct.length = 0;
        SBUxMethod.refresh("dtl-slt-spcfctCd");
    }

    /**
     * @name fn_onChangeInvvntrSeCd
     * @description 재고구분 선택 변경 event
     */
    const fn_onChangeInvvntrSeCd = function() {
        let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
        let grdSeCd = "";

        if(invntrSeCd == 1) {
            grdSeCd = _GRD_SE_CD_WRHS;
            SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'true');
        } else if(invntrSeCd == 2) {
            grdSeCd = _GRD_SE_CD_SORT;
            SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'false');
        } else if(invntrSeCd == 3) {
            grdSeCd = _GRD_SE_CD_GDS;
            SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'false');
        } else {
            SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'true');
        }

        jsonInvntrList.length = 0;
        gridInvntrList.rebuild();

        fn_create_rtnCrtr();
        fn_create_rtnCrtrDtl();
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        const itemInfo = _.find(jsonApcItem, {
            value: itemCd
        });

        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)
        ]);

        if (gfn_isEmpty(itemCd)) {
            gfn_setApcSpcfctsSBSelect('dtl-slt-spcfctCd', jsonApcSpcfct, "");
        } else {
            gfn_setApcSpcfctsSBSelect('dtl-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd);				// 규격
        }
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;

        if(gfn_isEmpty(vrtyCd)) {
            return;
        }

        const itemCd = vrtyCd.substring(0,4);
        SBUxMethod.set("srch-slt-itemCd", itemCd);
        await fn_onChangeSrchItemCd({
            value: itemCd
        });
        SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
    }

    /* 생산자 팝업 호출 필수 function  */
    /* Start */
    /**
     * @name fn_getPrdcrs
     * @description 생산자 리스트 호출
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 팝업 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 callback
     */
    const fn_setPrdcr = function(prdcr) {
        if(!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");

            fn_setPrdcrForm(prdcr);
        }
    }

    const fn_setPrdcrForm = async function(prdcr) {
        if(!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
            SBUxMethod.set("srch-inp-vrtyNm", prdcr.rprsVrtyNm);
            SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyCd);
            SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
            await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, prdcr.rprsItemCd) // 규격
            if(checkSection == 1) {
                SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');
            } else {
                SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false');
            }
        } else {
            if(!gfn_isEmpty(prdcr.rprsItemCd)) { // 대표품목
                const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
                if(prvItemCd != prdcr.rprsItemCd) {
                    SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                    fn_selectItem();
                }
            }
        }

        if(!gfn_isEmpty(prdcr.wrhsSeCd)) { // 입고구분
            SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.wrhsSeCd);
        }

        if(!gfn_isEmpty(prdcr.gdsSeCd)) { // 상품구분
            SBUxMethod.set("srch-slt-gdsSeCd", prdcr.gdsSeCd);
        }
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function (s, b, i, c) {
        for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
        return b;
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){
        fn_clearPrdcr();
        if(getByteLengthOfString(prdcrNm.target.value) > 100) {
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }

        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: ''");
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1) {
            document.getElementById('btnSrchPrdcr').click();
        } else {
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: aquamarine"); // skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

            fn_setPrdcrForm(prdcr);
        }
    }
    /* End */

    /**
     * @name fn_dtpChange
     * @description 재고일자 onChange
     */
    const fn_dtpChange = function() {
        let pckgYmdFrom = SBUxMethod.get("srch-dtp-invntrYmdFrom");
        let pckgYmdTo = SBUxMethod.get("srch-dtp-invntrYmdTo");

        if(gfn_diffDate(pckgYmdFrom, pckgYmdTo) < 0) {
            gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");

            SBUxMethod.set("srch-dtp-invntrYmdFrom", gfn_dateFirstYmd(new Date()));
            SBUxMethod.set("srch-dtp-invntrYmdTo", gfn_dateToYmd(new Date()));

            return;
        }
    }

    const fn_gridInvntrValueChanged = function(){
        let nRow = gridInvntrList.getRow();
        let nCol = gridInvntrList.getCol();


        let getRowData = gridInvntrList.getRowData(nRow,false); //call by refrence로 반환

        let getUserAttr = gridInvntrList.getColUserAttr(nCol);

        let invntrQntt = getRowData.invntrQntt; //재고 수량
        let invntrWght = getRowData.invntrWght; //재고 중량

        let dscdQnttReg = parseInt(getRowData.dscdQnttReg); //폐기등록 수량
        let dscdWghtReg = parseInt(getRowData.dscdWghtReg); //폐기등록 중량

        let qntt = parseInt(getRowData.qntt);//입고,선별,포장 수량
        let wght = parseInt(getRowData.wght);//입고,선별,포장 중량

        let getCheckedYn = getRowData.checkedYn;

        switch(getUserAttr.colNm){
            case "checkedYn" :
                if(getCheckedYn === "Y"){
                    getRowData.dscdQnttReg = invntrQntt;
                    getRowData.dscdWghtReg = invntrWght;
                }else {
                    getRowData.dscdQnttReg = 0;
                    getRowData.dscdWghtReg = 0;
                }
                break;
            case "dscdQnttReg" :
                if(dscdQnttReg > invntrQntt ){
                    gfn_comAlert("W0008", "재고수량", "폐기등록수량"); //	W0008	{0} 보다 {1}이/가 큽니다.
                    getRowData.dscdQnttReg = 0;
                    getRowData.checkedYn = "N";
                }else{
                    getRowData.dscdQnttReg = dscdQnttReg;
                    getRowData.dscdWghtReg = Math.round(wght/qntt*dscdQnttReg);
                    getRowData.checkedYn = "Y";
                }
                break;
            case "dscdWghtReg" :
                if(dscdWghtReg > invntrWght){
                    gfn_comAlert("W0008", "재고중량", "폐기등록중량"); //	W0008	{0} 보다 {1}이/가 큽니다.
                    getRowData.dscdWghtReg = 0;
                    getRowData.checkedYn = "N";
                }else{
                    getRowData.dscdWghtReg = dscdWghtReg;
                    getRowData.checkedYn = "Y";
                }
                break;
            default:
                break;
        }
        gridInvntrList.refresh();
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>