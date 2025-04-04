<%
    /**
     * @Class Name : drctPrchsPrst.jsp
     * @Description : 수매현황 화면
     * @author SI개발부
     * @since 2025.03.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.03.31   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 수매현황</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .c_input{
            width: 100%;
            text-align: right;
            border: 0;
        }
        #totalTable th{
            text-align: center;
        }
    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 수매현황 -->
                <div style="margin-left: auto">
                    <sbux-button
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_search"
                            text="조회"
                    ></sbux-button>
                    <sbux-button
                            id="btnDocRawMtrWgh"
                            name="btnDocRawMtrWgh"
                            uitype="normal"
                            class="btn btn-sm btn-primary"
                            onclick="fn_docRawMtrWgh"
                            text="보고서출력"
                    ></sbux-button>
                    <sbux-button
                            id="test"
                            name="test"
                            uitype="normal"
                            class="btn btn-sm btn-primary"
                            onclick="test"
                            text="test"
                    ></sbux-button>
                </div>
            </div>
            <div class="box-body" style="display: flex; flex-direction: column">
                <table class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 18%">
                        <col style="width: 7%">
                        <col style="width: 18%">
                        <col style="width: 7%">
                        <col style="width: 18%">
                        <col style="width: 7%">
                        <col style="width: 18%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg"><span class="data_required" ></span>입차일</th>
                        <td class="td_input">
                            <div style="display: flex; gap: 3px">
                                <sbux-datepicker
                                        id="srch-dtp-wghYmdFrom"
                                        name="srch-dtp-wghYmdFrom"
                                        uitype="popup"
                                        wrap-style="flex:1;"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                ></sbux-datepicker>
                                <sbux-datepicker
                                        id="srch-dtp-wghYmdTo"
                                        name="dtl-dtp-wghYmdTo"
                                        uitype="popup"
                                        wrap-style="flex:1;"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                ></sbux-datepicker>
                            </div>
                        </td>
                        <th scope="row" class="th_bg"><span class="data_required" ></span>생산자</th>
                        <td class="td_input">
                            <div style="display: flex; gap: 3px">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrNm"
                                        name="srch-inp-prdcrNm"
                                        class="form-control input-sm input-sm-ast"
                                        wrap-style="flex:2"
                                        placeholder="초성검색 가능"
                                        autocomplete-ref="jsonPrdcrAutocomplete"
                                        autocomplete-text="name"
                                        autocomplete-height="270px"
                                        oninput="fn_onInputPrdcrNm(event)"
                                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                                ></sbux-input>
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrIdentno"
                                        name="srch-inp-prdcrIdentno"
                                        wrap-style="flex:1"
                                        class="form-control input-sm"
                                        maxlength="2"
                                        autocomplete="off"
                                        onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                ></sbux-input>
                                <sbux-button
                                        id="btn-srch-prdcr"
                                        name="btn-srch-prdcr"
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-prdcr"
                                        onclick="fn_choicePrdcr"
                                ></sbux-button>
                                <sbux-input
                                        id="srch-inp-prdcrCd"
                                        name="srch-inp-prdcrCd"
                                        uitype="hidden">
                                </sbux-input>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">저장고</th>
                        <td class="td_input">
                            <div style="display: flex; width: 80%">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-warehouseSeCd"
                                        name="srch-slt-warehouseSeCd"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">차량번호</th>
                        <td class="td_input">
                            <div style="display: flex">

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">품목/품종</th>
                        <td class="td_input">
                            <div style="display: flex; gap: 3px">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm"
                                        wrap-style="flex:1"
                                        jsondata-ref="jsonComItem"
                                        onchange="fn_selectItem">
                                </sbux-select>
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-vrtyCd"
                                        name="srch-inp-vrtyCd"
                                        class="form-control input-sm"
                                        maxlength="33"
                                        show-clear-button="true"
                                        readonly>
                                </sbux-input>
                                <sbux-button id="btnSrchVrty"
                                             name="btnSrchVrty"
                                             class="btn btn-xs btn-outline-dark"
                                             text="찾기"
                                             uitype="modal"
                                             target-id="modal-vrty"
                                             onclick="fn_modalVrty">
                                </sbux-button>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">등급</th>
                        <td class="td_input">
                            <div style="display: flex">

                            </div>
                        </td>
                        <th scope="row" class="th_bg">사업구분</th>
                        <td class="td_input">
                            <div style="display: flex">

                            </div>
                        </td>
                        <th scope="row" class="th_bg">회계반영</th>
                        <td class="td_input">
                            <div style="display: flex">

                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table id="totalTable" class="table table-bordered tbl_fixed" style="margin-top: 1vh; margin-bottom: 1vh">
                    <colgroup>
                        <col style="width:6.4%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th rowspan="3" scope="row" class="th_bg">합계</th>
                        <th rowspan="2" scope="row" class="th_bg">입차수</th>
                        <th rowspan="2" scope="row" class="th_bg">운임비</th>
                        <th rowspan="2" scope="row" class="th_bg">총중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">공차중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">실중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">감량(%)</th>
                        <th rowspan="2" scope="row" class="th_bg">감량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">정산중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">가구당중량<br/>(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">비품비율(%)</th>
                        <th rowspan="2" scope="row" class="th_bg">상품수량</th>
                        <th rowspan="2" scope="row" class="th_bg">상품중량(kg)</th>
                        <th colspan="2" scope="row" class="th_bg">입고수량</th>
                        <th colspan="2" scope="row" class="th_bg">출고수량</th>
                        <th colspan="2" scope="row" class="th_bg">재고수량</th>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">가구</th>
                        <th scope="row" class="th_bg">팔레트</th>
                        <th scope="row" class="th_bg">가구</th>
                        <th scope="row" class="th_bg">팔레트</th>
                        <th scope="row" class="th_bg">가구</th>
                        <th scope="row" class="th_bg">팔레트</th>
                    </tr>
                    <tr>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div id="sb-area-drctPrchsPrst" style="flex: 1"></div>
            </div>
        </div>
    </section>
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
<script type="text/javascript">
    /** drctPrchsPrst **/
    var gridDrctPrchsPrst;
    let jsonDrctPrchsPrst = [];

    window.addEventListener("DOMContentLoaded",function(){
       fn_init();
    });
    const fn_init = async function(){
        /** SbSelect json **/
        await fn_setSbSelect();
        /** SbGrid create **/
        await fn_createDrctPrchsPrst();
    }

    const fn_setSbSelect = async function(){}

    const fn_createDrctPrchsPrst = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-drctPrchsPrst';
        SBGridProperties.id = 'gridDrctPrchsPrst';
        SBGridProperties.jsonref = 'jsonDrctPrchsPrst';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.fixedrowheight = '25';
        SBGridProperties.columns = [
            {caption : ['checked','checked'], ref : 'academy', width : '30px', fixedstyle:'height:50px;text-alian:center', style : 'text-align:center', type : 'checkbox', typeinfo : {fixedcellcheckbox:{usemode : true, rowindex: 0},checkedvalue : 'T', uncheckedvalue: 'F'}},
            {caption : ['번호','번호'], ref : 'academy', width : '50px',	style : 'text-align:center', type : 'output'},
            {caption : ['회계반영','회계반영'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입차번호','입차번호'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입차일','입차일'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['참여조직','참여조직'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['거래처명','거래처명'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['재배농가','재배농가'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['차량번호','차량번호'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['운임비','운임비'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['총중량(kg)','총중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['공차중량(kg)','공차중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['실중량(kg)','실중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['감량(%)','감량(%)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['감량(kg)','감량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['정산중량(kg)','정산중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['가구당중량(kg)','가구당중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['비품비율(%)','비품비율(%)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['비고','비고'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입고수량','가구'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입고수량','팔레트'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['출고수량','가구'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['출고수량','팔레트'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['상품','상품'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['사업구분','사업구분'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['등급','등급'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['수량','수량'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['중량<br/>(kg)','중량<br/>(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['계량대','계량대'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['작업자','작업자'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['비고','비고'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
        ]
        gridDrctPrchsPrst = _SBGrid.create(SBGridProperties);
    }


</script>
</html>
