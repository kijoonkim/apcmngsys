<%
    /**
     * @Class Name : spmtWghInfoInq.jsp
     * @Description : 출하 계량 정보 조회 화면
     * @author SI개발부
     * @since 2024.12.18
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.12.18   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하 계량 정보 조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하 계량 정보 조회 -->
            </div>
            <div style="margin-left: auto;">
                <%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
                                    <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
                <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
                <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
            </div>
        <%--            /** 상단 버튼 **/--%>
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
                    <td class="td_input" colspan="3" style="border-right: hidden">
                        <sbux-select id="srch-slt-sortFcltCd"
                                     name="srch-slt-sortFcltCd"
                                     uitype="single"
                                     unselected-text="선택"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     jsondata-ref="jsonSortFclt">
                        </sbux-select>
                    </td>
                    <td colspan="9" style="border-top: hidden;"></td>
                </tr>
                </tbody>
            </table>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>계량대 목록</span>
                    </li>
                </ul>
            </div>
            <div id="sb-area-wghCurInq"></div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">
    var jsonWghCurInq = [];
    let gridWghCurInq;
    var jsonSortFclt = [];


    window.addEventListener("DOMContentLoaded", function(){
        fn_init();
    });
    const fn_init = async function(){
        await gfn_setComCdSBSelect('srch-slt-sortFcltCd',	jsonSortFclt, 	'WGH_FCLT_CD', 	gv_selectedApcCd),
            await fn_create_wghCurInq();
    }
    const fn_create_wghCurInq = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wghCurInq';
        SBGridProperties.id = 'gridWghCurInq';
        SBGridProperties.jsonref = 'jsonWghCurInq';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: [""],	ref: 'fcltCd',		type:'output',  width:'2%', style: 'text-align:center;'},
            {caption: ["계량대"],	ref: 'fcltNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["코드"],	ref: 'status',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["별칭"],	ref: 'sysLastChgDt',	type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["계량유형"],	ref: 'sysLastChgDt',	type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["입고유형"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["설명"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["최소중량"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["계량횟수"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["최대중량"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["기본창고"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["중량단위"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["시작일자"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["종료일자"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
            {caption: ["비고"],	ref: 'spcfctNm',		type:'output',  width:'7%', style: 'text-align:center;'},
        ]
        gridWghCurInq = _SBGrid.create(SBGridProperties);
    }
    const fn_search = async function(){
        let fcltCd = SBUxMethod.get("srch-slt-sortFcltCd");
        console.log(fcltCd,"?");
        let postJsonPromise = gfn_postJSON("/am/wgh/selectWghFclt.do",{apcCd:gv_apcCd,fcltCd:fcltCd});
        let data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            jsonWghCurInq = data.resultList;
            jsonWghCurInq.forEach(function(item){
                if(item.bgngYmd){
                    if(item.endYmd){
                        item.status = 'OFF';
                    }else{
                        item.status = 'ON';
                    }
                }
            });
            gridWghCurInq.rebuild();
        }
        console.log(data);
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
