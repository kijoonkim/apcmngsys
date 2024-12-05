<%
    /**
     * @Class Name : wghCurInq.jsp
     * @Description : 계량현황조회 화면
     * @author SI개발부
     * @since 2024.11.25
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.11.25   	손민성		최초 생성
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
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
<%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
<%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
<%--                <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>--%>
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
                    <th scope="row" class="th_bg">계량대</th>
                    <td class="td_input" colspan="3" style="border-right: hidden; border-top: hidden">
                        <sbux-select
                                id="srch-slt-wghFcltCd"
                                name="srch-slt-wghFcltCd"
                                uitype="single"
                                class="form-control input-sm"
                                jsondata-ref="jsonWghFclt"
                                jsondata-text="cdVlNm"
                                jsondata-value="cdVl"
                                style="max-width:80%;">
                        </sbux-select>
                    </td>
                    <td colspan="9" style="border-top: hidden"></td>
                </tr>
                </tbody>
            </table>
            <div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>계량대 현황</span>
                        </li>
                    </ul>
                </div>
                <div id="sb-area-grdWghInfo" style="height: 400px"></div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">
    var jsonWghFclt = [];

    /** grid **/
    var jsonWghFcltStts = [];
    var grdWghFcltStts;

    document.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });
    const fn_init = async function(){
        let postJsonPromise = gfn_postJSON("/co/cd/selectFcltList.do", {apcCd : gv_selectedApcCd});
        let data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            let wghList = data.resultList.filter((item) => item.cdVl === '01' && item.cdId === 'WGH_FCLT_CD');
            jsonWghFclt = [...wghList];
            SBUxMethod.refresh("srch-slt-wghFcltCd");
        }
        fn_createGrid();
    }

    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdWghInfo';
        SBGridProperties.id = 'grdWghFcltStts';
        SBGridProperties.jsonref = 'jsonRawMtrWrhs';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["코드"],ref: 'wrhsYmd',type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["명칭"],ref: 'wrhsYmd',type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["상태정보"],ref: 'wrhsYmd',type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["최근 가동 일자"],ref: 'wrhsYmd',type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["연계코드"],ref: 'wrhsYmd',type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
        ]
        grdWghFcltStts = _SBGrid.create(SBGridProperties);
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
