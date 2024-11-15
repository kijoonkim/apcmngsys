<%
    /**
     * @Class Name : strRawMtrWrhsReg.jsp
     * @Description : 딸기입고등록(모두) 화면
     * @author SI개발부
     * @since 2024.11.14
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.11.14   손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 딸기입고등록(모두)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        .th-mbl {
            text-align: left;
            font-weight: bold;
            font-size: 28px;
        }
        .inpt-mbl {
        //padding: 8px;
            height: 50px;
            font-size: 28px;
            line-height: 1.5;
            color: #555;
            width: 100%;
        }
        /* Webkit 기반 브라우저 (Chrome, Safari 등) */
        input[type=number]::-webkit-outer-spin-button,
        input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록(태블릿) -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-lg btn-outline-danger"
                        onclick="fn_reset"
                        text="초기화"
                ></sbux-button>
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-lg btn-primary"
                        onclick="fn_search"
                        text="조회"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-lg btn-outline-danger"
                        onclick="fn_save"
                        text="저장"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body" style="padding: 10px 30px 15px;">
            <!--[APC] START -->
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <!--[APC] END -->
            <table id="srchTable" class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg">품목</th>
                        <td class="td_input" colspan="3" style="border-top: hidden">
                            <sbux-select
                                    id="srch-slt-itemCd"
                                    name="srch-slt-itemCd"
                                    uitype="single"
                                    unselected-text="전체"
                                    style="width: 80%"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcItem"
                                    onchange="fn_selectItem">
                            </sbux-select>
                        </td>
                        <th scope="row" class="th_bg"><span class="data_required"></span>출고일자</th>
                        <td class="td_input" colspan="3" style="border-top: hidden">
                            <sbux-datepicker
                                    id="srch-dtp-spmtYmd"
                                    name="srch-dtp-spmtYmd"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
                                    onchange="fn_dtpChange(srch-dtp-spmtYmdFrom)">
                            </sbux-datepicker>
                        </td>
                        <th scope="row" class="th_bg">발주처</th>
                        <td class="td_input" colspan="3" style="border-top: hidden">
                            <sbux-select
                                    id="srch-slt-cnptCd"
                                    name="srch-slt-cnptCd"
                                    uitype="single"
                                    unselected-text="전체"
                                    style="width: 80%"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcCnpt"
                                    onchange="fn_selectItem">
                            </sbux-select>
                        </td>
                    </tr>

                </tbody>

            </table>
            <!--[pp] 검색 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    let jsonApcItem = [];
    let jsonApcCnpt = [];

    window.addEventListener("DOMContentLoaded",function(){
       fn_init();
    });
    const fn_init = async function(){
        await gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd);
        const data = await gfn_postJSON("/am/cmns/selectCnptList.do",{apcCd:gv_selectedApcCd});
        console.log(data,"??");
    }
</script>
</html>