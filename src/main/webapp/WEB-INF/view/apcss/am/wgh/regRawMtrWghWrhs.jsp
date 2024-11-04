<%
    /**
     * @Class Name : regRawMtrWghWrhs.jsp
     * @Description : 원물계량 입고등록 화면
     * @author SI개발부
     * @since 2024.10.29
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.10.29   	손민성			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 원물계량등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        .th_bg{
            font-size: 15px;
            text-align: left;
        }
        .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd .sbux-tabs-content{
            padding: 16px 0px !important;
        }
        #tab_spmtPrfmncReg, #tab_spmtPrfmnc{
            border: 0 !important;
        }
        .btn{
            padding: 2px 20px !important;
        }
        #searchTable th{
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; gap :10px;flex-direction: column; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 -->
                    <sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
                    </sbux-label>
                </div>
                <div style="margin-right: auto;">
                    <sbux-button id="btnCmndDocspmt" name="btnCmndDocspmt" uitype="normal" class="btn btn-lg btn-primary" onclick="fn_docRawMtrWrhs" text="확인서 발행" ></sbux-button>
                    <sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-lg btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
                    <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-lg btn-outline-danger" onclick="fn_save" text="저장" ></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-lg btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                           title-target-id-array="tab_spmtPrfmncReg^tab_spmtPrfmnc"
                           title-text-array="입고등록^입고내역" onclick="fn_changeTab()"
                           title-style-array="{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="tab_spmtPrfmncReg">
                        <table class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 40%">
                            <colgroup>
                                <col style="width: 30%">
                                <col style="width: 70%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">
                                    입고일자
                                </th>
                                <td class="td_input">
                                    <sbux-datepicker uitype="popup" id="reg-dtp-wrhsYmd" name="reg-dtp-wrhsYmd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    품목
                                </th>
                                <td class="td_input">
                                    <div style="width: 50%">
                                        <sbux-select
                                                unselected-text="전체"
                                                uitype="single"
                                                id="reg-slt-itemCd"
                                                name="reg-slt-itemCd"
                                                class="form-control input-sm input-sm-ast"
                                                jsondata-ref="jsonApcItem">
                                        </sbux-select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    농가
                                </th>
                                <td class="td_input">
                                    <div style="display: flex; gap: 5px">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-prdcrIdentno"
                                                name="reg-inp-prdcrIdentno"
                                                class="form-control input-sm"
                                                wrap-style="flex-basis:10%"
                                                maxlength="2"
                                                autocomplete="off"
                                                onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-prdcrNm"
                                                name="reg-inp-prdcrNm"
                                                class="form-control input-sm input-sm-ast inpt_data_reqed"
                                                placeholder="초성검색 가능"
                                                wrap-style="flex-basis:50%"
                                                autocomplete-ref="jsonPrdcrAutocomplete"
                                                autocomplete-text="name"
                                                autocomplete-height="270px"
                                                oninput="fn_onInputPrdcrNm(event)"
                                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                                        ></sbux-input>
                                        <sbux-button
                                                id="btn-reg-prdcr"
                                                name="btn-reg-prdcr"
                                                class="btn btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-prdcr"
                                                onclick="fn_choicePrdcr"
                                        ></sbux-button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    산지
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-plorCd"
                                            name="reg-inp-prdcrIdentno"
                                            class="form-control input-sm"
                                            style="width: 30%"
                                            maxlength="2"
                                            autocomplete="off"
                                            onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    차량번호
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-vhclno"
                                            name="reg-inp-vhclno"
                                            class="form-control input-sm"
                                            style="width: 30%"
                                            maxlength="2"
                                            autocomplete="off"
                                            onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    총중량(Kg)
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-wholWght"
                                            name="reg-inp-wholWght"
                                            class="form-control input-sm"
                                            style="width: 30%"
                                            maxlength="2"
                                            autocomplete="off"
                                            onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    공차중량(Kg)
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-emptVhclWght"
                                            name="reg-inp-emptVhclWght"
                                            class="form-control input-sm"
                                            style="width: 30%"
                                            maxlength="2"
                                            autocomplete="off"
                                            onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    실중량(Kg)
                                </th>
                                <td style="padding :0!important;">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-actlWght"
                                            name="reg-inp-actlWght"
                                            style="background-color: yellow !important; border-radius: 0"
                                            autocomplete="off"
                                            readonly
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    콘티수(개)
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-bxQntt"
                                            name="reg-inp-bxQntt"
                                            class="form-control input-sm"
                                            style="width: 30%"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    상품등급
                                </th>
                                <td style="padding: 0!important;">
                                    <div style="display: flex">
                                        <div class="th_bg" style="flex-basis: 25%; text-align: center;align-content: center;">
                                            정품
                                        </div>
                                        <div>
                                            <sbux-input
                                                    uitype="text"
                                                    id="reg-inp-grdCd"
                                                    name="reg-inp-grdCd"
                                                    wrap-style="margin-left:5px"
                                                    style="width: 50%"
                                                    autocomplete="off"
                                            ></sbux-input>
                                        </div>
                                        <div class="th_bg" style="flex-basis: 25%; text-align: center;align-content: center;">
                                            비품
                                        </div>
                                        <div>
                                            <sbux-input
                                                    uitype="text"
                                                    id="reg-inp-NgrdCd"
                                                    name="reg-inp-NgrdCd"
                                                    wrap-style="margin-left:5px"
                                                    style="width: 50%"
                                                    autocomplete="off"
                                            ></sbux-input>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    파렛트수(개)
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-bxQntt"
                                            name="reg-inp-bxQntt"
                                            class="form-control input-sm"
                                            style="width: 30%"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    실중량(Kg)/콘티
                                </th>
                                <td style="padding: 0!important;">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-avgWght"
                                            name="reg-inp-avgWght"
                                            style="background-color: yellow !important; border-radius: 0"
                                            autocomplete="off"
                                            readonly
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">
                                    비고
                                </th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-bxQntt"
                                            name="reg-inp-bxQntt"
                                            class="form-control input-sm"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="tab_spmtPrfmnc">
                        <table class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 40%">
                            <colgroup>
                                <col style="width: 30%">
                                <col style="width: 70%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">
                                    입고일자
                                </th>
                                <td class="td_input">
                                    <sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="searchTable"class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 40%">
                            <colgroup>
                                <col style="width: 17.5%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 17.5%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">입고일자</th>
                                <th scope="row" class="th_bg">품목</th>
                                <th scope="row" class="th_bg">농가</th>
                                <th scope="row" class="th_bg">차량번호</th>
                                <th scope="row" class="th_bg">총중량</th>
                                <th scope="row" class="th_bg">상세</th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
        <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
    var jsonApcItem			= [];	// 품목 		itemCd		검색

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
        stdGrdSelect.init();
    });
    const fn_init = async function(){
        console.log("TLqkffhadl");
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        SBUxMethod.set("reg-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        await gfn_setApcItemSBSelect('reg-slt-itemCd',jsonApcItem, gv_selectedApcCd);		// 품목
    }
    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
