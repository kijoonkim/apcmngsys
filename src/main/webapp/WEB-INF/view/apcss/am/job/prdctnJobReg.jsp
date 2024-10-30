<%
    /**
     * @Class Name : rawMtrWrhsRegMbl.jsp
     * @Description : 생산작업 간편등록화면(신선미세상)
     * @author SI개발부
     * @since 2024.10.30
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.10.30   	손민성	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>생산작업 간편등록(신선미세상)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        .inpt-mbl {
            height: 50px;
            font-size: 3vh;
            line-height: 1.5;
            color: #555;
        }
        .th-mbl {
            text-align: right;
            font-weight: bold;
            font-size: 28px;
        }
        .btn-mbl {
            height: 50px;
            font-size: 24px;
        }
        #latestInfo thead th{
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            background-color: #e8f1f9;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex;gap: 10px; flex-direction: column; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 태블릿 -->
            </div>
            <div style="display: flex; justify-content: space-between">
                <div>
                    <sbux-button
                            id="btnReset"
                            name="btnReset"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_reset"
                            text="초기화"
                    ></sbux-button>
                    <sbux-button
                            id="btnSave"
                            name="btnSave"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_save"
                            text="저장"
                    ></sbux-button>
                    <sbux-button
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_search"
                            text="조회"
                    ></sbux-button>
                    <sbux-button
                            id="btnClose"
                            name="btnClose"
                            uitype="normal"
                            text="종료"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_close"
                    ></sbux-button>
                </div>
                <div>
                    <sbux-button
                            id="btnCmndDocPckg"
                            name="btnCmndDocPckg"
                            uitype="normal"
                            style="margin-left: auto"
                            class="btn btn-sm btn-primary btn-mbl"
                            onclick="fn_docRawMtrWrhs"
                            text="작업시간 등록"
                    ></sbux-button>
                </div>
        </div>
        </div>
        <div class="box-body" style="display:flex; gap:15px;justify-content: flex-start;flex-direction: column">
            <table id="saveTable" class="table table-bordered tbl_fixed tbl_mbl">
                <colgroup>
                    <col style="width: 30%">
                    <col style="width: 70%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg th-mbl">
                        <span class="data_required" ></span>팔레트번호
                    </th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-pltno"
                                    name="dtl-inp-pltno"
                                    uitype="text"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl srch-pltno"
                                    autocomplete="off"
                                    onblur="fn_ipt_pltno"
                                    onclick="fn_ipt_init"
                            ></sbux-input>
                            <sbux-button
                                    id="dtl-btn-rawMtrInvntr"
                                    name="dtl-btn-rawMtrInvntr"
                                    class="btn btn-sm btn-outline-danger btn-mbl"
                                    text="조회"
                                    uitype="normal"
                                    onclick="fn_searchInvntr"
                            ></sbux-button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">품목/품종</th>
                    <td class="td_input" >
                        <div style="display: flex;gap: 10px">
                            <sbux-select
                                    id="dtl-inp-itemNm"
                                    name="dtl-inp-itemNm"
                                    uitype="single"
                                    class="inpt-mbl"
                                    style="width: 30%"
                                    jsondata-ref="jsonApcItem"
                                    unselected-text="선택"
                                    onchange="fn_onchangeItemCd"
                                    readonly
                            ></sbux-select>
                            <sbux-select
                                    id="dtl-inp-vrtyNm"
                                    name="dtl-inp-vrtyNm"
                                    uitype="single"
                                    class="inpt-mbl"
                                    style="width: 30%"
                                    jsondata-ref="jsonApcVrty"
                                    jsondata-value="itemVrtyCd"
                                    unselected-text="선택"
                                    onchange="fn_onchangeVrtyCd()"
                                    readonly
                            ></sbux-select>
                            <sbux-button
                                    id="dtl-btn-itemCdChg"
                                    name="dtl-btn-itemCdChg"
                                    class="btn btn-sm btn-outline-danger btn-mbl"
                                    text="수정"
                                    value="수정"
                                    is-change-text="true"
                                    uitype="normal"
                                    onclick="fn_onchangeItemVrtyCd"
                            ></sbux-button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">원물규격/<span style="color: red">재고수량</span>/<span style="color: red">투입수량</span></th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-prdc1rNm"
                                    name="dtl-inp-prdc1rNm"
                                    uitype="text"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                        <sbux-input
                                id="dtl-inp-prdcr1Cd"
                                name="dtl-inp-prdcr1Cd"
                                uitype="text"
                                class="inpt-mbl"
                                placeholder=""
                                readonly
                        ></sbux-input>
                        </div>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">생산자</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-prdcrNm"
                                    name="dtl-inp-prdcrNm"
                                    uitype="text"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-prdcrCd"
                                    name="dtl-inp-prdcrCd"
                                    uitype="text"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                        </div>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required" ></span>작업일자/창고</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-datepicker
                                    id="dtl-dtp-inptYmd"
                                    name="dtl-dtp-inptYmd"
                                    uitype="popup"
                                    wrap-style="width:30%"
                                    date-format="yyyy-mm-dd"
                                    class="sbux-pik-group-apc input-sm-ast inpt_data_reqed inpt-mbl"
                                    onchange="fn_dtpChange"
                                    style="width:100%;"
                            ></sbux-datepicker>
                            <sbux-select
                                    uitype="single"
                                    id="dtl-slt-warehouseSeCd"
                                    name="dtl-slt-warehouseSeCd"
                                    wrap-style="width:30%"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonComWarehouse">
                            </sbux-select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">상품규격/<span class="data_required"></span>수량</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-select
                                    uitype="single"
                                    id="dtl-slt-warehouseSeCd1"
                                    name="dtl-slt-warehouseSeCd1"
                                    wrap-style="width:30%"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonComWarehouse">
                            </sbux-select>
                            <sbux-input
                                    id="dtl-inp-prdcrCd1"
                                    name="dtl-inp-prdcrCd1"
                                    uitype="text"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                            <sbux-button
                                    id="btnCmndDocPuckg"
                                    name="btnCmndDocPuckg"
                                    uitype="normal"
                                    class="btn btn-sm btn-outline-danger btn-mbl"
                                    onclick="fn_docRawMtrWrhs"
                                    text="추가"
                            ></sbux-button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
                <table id="latestInfo" class="table table-bordered tbl_fixed tbl_mbl">
                    <colgroup>
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>생산자명</th>
                        <th>팔레트 번호</th>
                        <th>품목</th>
                        <th>투입규격</th>
                        <th>투입수량</th>
                        <th>선별일자</th>
                        <th>상품규격</th>
                        <th>상품수량</th>
                    </tr>
                    </thead>
                    <tbody id="latestInfoBody">

                    </tbody>
                </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    window.addEventListener('DOMContentLoaded', function(e) {
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontsize = "24px";
        });
        // fn_init();
    });
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
