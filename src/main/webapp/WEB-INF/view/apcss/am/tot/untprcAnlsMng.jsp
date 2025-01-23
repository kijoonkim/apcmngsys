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
                <%--                <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>--%>
                <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
                <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
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
                    <th scope="row" class="th_bg">적용일자</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-datepicker
                                uitype="popup"
                                id="srch-dtp-wrhsYmd"
                                name="srch-dtp-wrhsYmd"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
                        ></sbux-datepicker>
                    </td>
                    <th scope="row" class="th_bg">품목/품종</th>
                    <td class="td_input" colspan="4" style="border-top: hidden;border-right: hidden">
                        <div style="display: flex; gap: 5px">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-itemCd"
                                    name="srch-slt-itemCd"
                                    class="form-control input-sm input-sm-ast"
                                    jsondata-ref="jsonApcItem"
                                    onchange="fn_onChangeSrchItemCd(this)">
                            </sbux-select>
                            <sbux-select
                                    unselected-text="선택"
                                    uitype="single"
                                    id="srch-slt-vrtyCd"
                                    name="srch-slt-vrtyCd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    jsondata-ref="jsonApcVrty"
                                    jsondata-value="itemVrtyCd"
                                    onchange="fn_onChangeSrchVrtyCd(this)">
                            </sbux-select>
                        </div>
                    </td>
                    <td colspan="4" style="border-top: hidden"></td>
                </tr>
                </tbody>
            </table>
            <div style="display: flex; flex-direction: column; gap: 10px">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>단가 분석 목록</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-rtnCrtr" style="height: 400px"></div>
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

    var jsonApcItem			= [];	// 품목 		itemCd		검색
    var jsonApcVrty			= [];	// 품종 		vrtyCd		검

    window.addEventListener("DOMContentLoaded",function(){
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        fn_init();
    });
    const fn_init = async function(){
        await fn_create_rtnCrtr();
        await fn_initSBSelect();
    }
    const fn_initSBSelect = async function() {
        // 검색 SB select
        let result = await Promise.all([
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),		// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),		// 품종
        ]);
    }

    const fn_create_rtnCrtr = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rtnCrtr';
        SBGridProperties.id = 'gridRtnCrtr';
        SBGridProperties.jsonref = 'jsonRtnCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: ["상품명"],	ref: 'SPMT_PCKG_UNIT_NM',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["품목"],	ref: 'ITEM_NM',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["품종"],	ref: 'VRTY_NM',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["규격"],	ref: 'SPCFCT_NM',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_10"],	ref: 'U_10',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_9"],	ref: 'U_9',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_8"],	ref: 'U_8',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_7"],	ref: 'U_7',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_6"],	ref: 'U_6',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_5"],	ref: 'U_5',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_4"],	ref: 'U_4',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_3"],	ref: 'U_3',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_2"],	ref: 'U_2',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_1"],	ref: 'U_1',		type:'output',  width:'100px', style: 'text-align:center;'},
            {caption: ["U_0"],	ref: 'U_0',		type:'output',  width:'100px', style: 'text-align:center;'},
        ]
        gridRtnCrtr = _SBGrid.create(SBGridProperties);
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        const itemInfo = _.find(jsonApcItem, {value: itemCd});
        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),
        ]);
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        const itemCd = vrtyCd.substring(0,4);

        const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
        if(!gfn_isEmpty(vrtyCd)){
            if (itemCd != prvItemCd) {
                SBUxMethod.set("srch-slt-itemCd", itemCd);
                await fn_onChangeSrchItemCd({value: itemCd});
                SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
            } else{
                SBUxMethod.set("srch-slt-itemCd", itemCd);
                await fn_onChangeSrchItemCd({value: itemCd});
                SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
            }
        }
    }

    const fn_search = async function(){
        let itemCd = SBUxMethod.get("srch-slt-itemCd") || '';
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd") || '';
        vrtyCd = vrtyCd !== '' ? vrtyCd.substring(4) : '';
        let ymd = SBUxMethod.get("srch-dtp-wrhsYmd");
        let param = {
            apcCd: gv_selectedApcCd,
            itemCd : itemCd,
            vrtyCd : vrtyCd,
            ymd : ymd
        }
        const postJsonPromise = gfn_postJSON("/am/tot/selectAnlsList.do",param);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
        jsonRtnCrtr = data.resultList;
        gridRtnCrtr.rebuild();
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>