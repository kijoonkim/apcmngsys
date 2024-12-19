<%
    /**
     * @Class Name : wghCurInq.jsp
     * @Description : 계량현황조회 화면
     * @author SI개발부
     * @since 2024.11.25
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
    <title>title : 계량현황 조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 계량현황조회 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
                <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
                <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
                <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
            </div>
        </div>
        <div class="box-body">
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <table class="table table-bordered tbl_fixed">
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
                    <th scope="row" class="th_bg">기준유형</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-select id="srch-slt-sortFcltCd"
                                     name="srch-slt-sortFcltCd"
                                     uitype="single"
                                     unselected-text="전체"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     jsondata-ref="jsonSortFclt">
                        </sbux-select>
                    </td>
                    <td colspan="9" style="border-top: hidden"></td>
                </tr>
                </tbody>
            </table>
            <div style="display: flex; flex-direction: column; gap: 10px">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>실사 기준목록</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-rtnCrtr"></div>
                </div>
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>실사 기준정보</span>
                            </li>
                        </ul>
                    </div>
                    <table class="table table-bordered tbl_fixed">
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
                            <th scope="row" class="th_bg">기준명</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;">
                                <sbux-input id="srch-slt-vhclno"
                                            name="srch-slt-vhclno"
                                            uitype="text"
                                            class="form-control input-sm"
                                            style="width: 80%">
                                </sbux-input>
                            </td>
                            <td colspan="9" style=""></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">대상품목</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-warehouseSeCd"
                                        name="srch-slt-warehouseSeCd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        style="width: 80%"
                                        jsondata-ref="jsonComWarehouse">
                                </sbux-select>
                            </td>
                            <th scope="row" class="th_bg">대상품종</th>
                            <td class="td_input" colspan="4" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-warehouseSeCd1"
                                        name="srch-slt-warehouseSeCd1"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        style="width: 80%"
                                        jsondata-ref="jsonComWarehouse">
                                </sbux-select>
                            </td>
                            <td colspan="4" style=""></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">재고유형</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-warehouseSeCd2"
                                        name="srch-slt-warehouseSeCd2"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        style="width: 80%"
                                        jsondata-ref="jsonComWarehouse">
                                </sbux-select>
                            </td>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">실사주기</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;">
                                <sbux-input id="srch-slt-vhclno"
                                            name="srch-slt-vhclno"
                                            uitype="text"
                                            class="form-control input-sm"
                                            style="width: 80%">
                                </sbux-input>
                            </td>
                            <th scope="row" class="th_bg">저장위치</th>
                            <td class="td_input" colspan="4" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-warehouseSeCd3"
                                        name="srch-slt-warehouseSeCd3"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        style="width: 80%"
                                        jsondata-ref="jsonComWarehouse">
                                </sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td class="td_input" colspan="8" style="border-right: hidden;">
                                <sbux-textarea id="srch-slt-vhclno1"
                                            name="srch-slt-vhclno1"
                                            uitype="normal"
                                            class="form-control input-sm"
                                            style="width: 92%; height: 100%">
                                </sbux-textarea>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">
    /** grid 변수 셋팅 **/
    var jsonRtnCrtr = [];
    let gridRtnCrtr;

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });
    const fn_init = async function(){
        await fn_create_rtnCrtr();
    }

    const fn_create_rtnCrtr = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rtnCrtr';
        SBGridProperties.id = 'gridRtnCrtr';
        SBGridProperties.jsonref = 'jsonRtnCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: [""],	ref: 'fcltCd',		type:'output',  width:'6%', style: 'text-align:center;'},
            {caption: ["기준유형"],	ref: 'wghYmd',		type:'output',  width:'20%', style: 'text-align:center;'},
            {caption: ["기준명"],	ref: 'wghFcltCd',		type:'output',  width:'12%', style: 'text-align:center;'},
            {caption: ["대상품목"],	ref: 'wghFcltCd',		type:'output',  width:'12%', style: 'text-align:center;'},
            {caption: ["대상품종"],	ref: 'wghFcltCd',		type:'output',  width:'12%', style: 'text-align:center;'},
            {caption: ["재고유형"],	ref: 'wghno',	type:'output',  width:'13%', style: 'text-align:center;'},
            {caption: ["실사주기"],	ref: 'vhclno',		type:'output',  width:'13%', style: 'text-align:center;'},
            {caption: ["저장위치"],	ref: 'vhclno',		type:'output',  width:'12%', style: 'text-align:center;'},
            {caption: ["비고"],	ref: 'vhclno',		type:'output',  width:'12%', style: 'text-align:center;'},
        ]
        gridRtnCrtr = _SBGrid.create(SBGridProperties);
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>