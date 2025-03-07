<%
    /**
     * @Class Name : spmtPrfmncRegByWgh.jsp
     * @Description : 출하실적등록(계량) 화면
     * @author SI개발부
     * @since 2025.02.24
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.02.25   유민지	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하실적등록(계량)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적등록(계량) -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <!--[APC] END -->
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
                    <col style="width: 6%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required">계량일자</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker id="srch-dtp-wghYmd" name="srch-dtp-wghYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast" ></sbux-datepicker>
                    </td>

                    <th scope="row" class="th_bg">차량번호</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-input id="dtl-inp-vhclno" name="dtl-inp-vhclno" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <!--<td class="td_input">
                        <sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
                    </td>-->
                    <td></td>

                    <th scope="row" class="th_bg">계량번호</th>
                    <td colspan="3" class="td_input">
                        <sbux-input id="dtl-inp-wghno" name="dtl-inp-wghno" uitype="text" class="form-control input-sm" ></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>

            <div style="display: flex ; flex-direction : row; gap : 10px";>


                <div style = "flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>계량정보</span></li>
                        </ul>
                    </div>
                    <div class="ad_tbl_toplist"></div>
                    <form>

                    <table class="table table-bordered tbl_fixed">
                        <caption>계량정보</caption>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">계량일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-wghYmd" name="dtl-inp-wghYmd" uitype="text" class="form-control input-sm" mask = "{'alias' : 'yyyy-mm-dd','autoUnmask': true}" readonly></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">계량번호</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-wghNo" name="dtl-inp-wghNo" uitype="text" class="form-control input-sm" readonly ></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">차량번호</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-vhclNo" name="dtl-inp-vhclNo" uitype="text" class="form-control input-sm" readonly ></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">기사명</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-drvrNm" name="dtl-inp-drvrNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">총중량</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-wholWght" name="dtl-inp-wholWght" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ','}" permit-keycodes-set="num" readonly></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">공차중량</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-emptVhclWght" name="dtl-inp-emptVhclWght" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ','}" permit-keycodes-set="num" readonly></sbux-input>
                            </td>

                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">감량률(%)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-rdcdRt" name="dtl-inp-rdcdRt" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ','}" permit-keycodes-set="num" readonly></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">계산중량</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-spmtWght" name="dtl-inp-spmtWght" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ','}" permit-keycodes-set="num" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">출고수량</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-spmtQntt" name="dtl-inp-spmtQntt" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ','}" permit-keycodes-set="num" readonly></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">팔레트수량</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="dtl-inp-pltQntt" name="dtl-inp-pltQntt" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ','}" permit-keycodes-set="num" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td class="td_input" colspan="3">
                                <sbux-input id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="text" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                </div>


                <div style = "flex :1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>계량목록</span></li>
                        </ul>
                    </div>
                    <div class="ad_tbl_toplist"></div>
                    <div id="sb-area-grdWghList" style="height: 214px"></div>
                </div>
            </div>

            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->

            <div style="height: 10px"></div>

            <div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>재고정보</span></li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                        <sbux-button id="btnSearchInvntr" name="btnSearchInvntr" uitype="normal" text="재고조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchInvntr"></sbux-button>
                    </div>
                </div>
                <div class="ad_tbl_toplist"></div>

                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <%--<colgroup>
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
                    </colgroup>--%>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">상품명</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input id="dtl-inp-gdsNm" name="dtl-inp-gdsNm" uitype="text" class="form-control input-sm"></sbux-input>
                        </td>
                        <%--<td class="td_input" style="border-right: hidden;"></td>--%>
                        <th scope="row" class="th_bg">창고</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
                        </td>
                        <th scope="row" class="th_bg">품목/품종</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    uitype="single"
                                    id="srch-slt-itemCd"
                                    name="srch-slt-itemCd"
                                    class="form-control input-sm input-sm-ast"
                                    unselected-text="전체"
                                    jsondata-ref="jsonComItem"
                                    onchange="fn_onChangeSrchItemCd(this)"
                            ></sbux-select>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    uitype="single"
                                    id="srch-slt-vrtyCd"
                                    name="srch-slt-vrtyCd"
                                    class="form-control input-sm input-sm-ast"
                                    unselected-text="전체"
                                    jsondata-ref="jsonComVrty"
                                    jsondata-value="itemVrtyCd"
                                    onchange="fn_onChangeSrchVrtyCd(this)"
                            ></sbux-select>
                        </td>
                        <th scope="row" class="th_bg">재고정보</th>
                        <td class="td_input" >
                            <div>
                                <sbux-radio id="rch-rdo-invntrInfo" name="rch-rdo-invntrInfo" uitype="normal" jsondata-ref="radioJsonData" onchange="fn_onChangeRchRdoInvntrInfo"></sbux-radio>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-grdInvntrInfo"></div>
                </div>
            </div>

            <div style="height: 10px"></div>

            <div style="display:flex; flex-direction: row; gap: 10px">
                <div style="flex: 4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>출하정보</span></li>
                        </ul>
                        <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                            <sbux-button id="btnSpmtReg" name="btnSpmtReg" uitype="normal" text="출하등록" class="btn btn-sm btn-success" onclick="fn_save"></sbux-button>
                        </div>
                    </div>
                    <div class="ad_tbl_toplist"></div>
                    <table class="table table-bordered tbl_fixed">
                        <caption>출하정보</caption>
                        <%--  <colgroup>
                              <col style="width: 7%">
                              <col style="width: 6%">
                              <col style="width: 6%">
                              <col style="width: 3%">
                              <col style="width: 7%">
                              <col style="width: 6%">
                              <col style="width: 3%">
                              <col style="width: 6%">
                              <col style="width: 7%">
                              <col style="width: 6%">
                              <col style="width: 6%">
                              <col style="width: 3%">
                          </colgroup>--%>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker id="dtl-dtp-spmtYmd" name="dtl-dtp-spmtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(dtl-dtp-spmtYmd)"></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg"><span class="data_required"></span>차량번호</th>
                            <td class="td_input" >
                                <sbux-input id="dtl-inp-spmtVhclno" name="dtl-inp-spmtVhclno" uitype="text" class="form-control input-sm inpt_data_reqed" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="dtl-slt-cnptCd" name="dtl-slt-cnptCd" uitype="single" class="form-control input-sm inpt_data_reqed" unselected-text="전체" jsondata-ref="jsonComCnptCd"></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">배송처</th>
                            <td class="td_input" >
                                <sbux-input id="dtl-inp-dldtn" name="dtl-inp-dldtn" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg"><span class="data_required"></span>운송회사</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="dtl-slt-trsprtCoCd" name="dtl-slt-trsprtCoCd" uitype="single" class="form-control input-sm inpt_data_reqed" unselected-text="전체" jsondata-ref="jsonComTrsprtCoCd"></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">운임비용</th>
                            <td class="td_input" >
                                <sbux-input id="dtl-inp-trsprtCst" name="dtl-inp-trsprtCst" uitype="text" class="form-control input-sm" mask ="{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',', 'autoUnmask': true}" permit-keycodes-set="num"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td class="td_input" colspan="3">
                                <sbux-input id="dtl-inp-spmtRmrk" name="dtl-inp-spmtRmrk" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">팔레트불출</th>
                            <td class="td_input" style="border-right: hidden;" colspan="2">
                                <%--<sbux-checkbox id="chkPltBxCd" name="chkPltBxCd" uitype="normal" jsondata-ref="checkboxJsonData"></sbux-checkbox>--%>
                                    <sbux-select id="dtl-slt-pltBxCd" name="dtl-slt-pltBxCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonDtlPltBxCd"></sbux-select>
                            </td>
                            <td class="td_input">
                                <sbux-spinner id="dtl-spn-bssInvntrQntt" name="dtl-spn-bssInvntrQntt" uitype="normal" init="0"></sbux-spinner>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div style="flex: 6">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>목록</span></li>
                        </ul>
                        <div style="display:flex;vertical-align:middle;float:right;margin-right:auto; gap: 5px">
                            <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow"></sbux-button>
                            <sbux-button id="btnDelRow" name="btnDelRow" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow"></sbux-button>
                        </div>
                    </div>
                    <div class="ad_tbl_toplist"></div>
                    <div id="sb-area-grdSpmtInfoRegList" style="height: 178px"></div>
                </div>
            </div>

            <div style="height: 10px"></div>

            <br>
            <div class="ad_tbl_top2">
                <ul class="ad_tbl_count">
                    <li>
                        <span>출하 내역</span>
                        <span style="font-size:12px">(기준일자 :
								<sbux-label
                                        id="crtr-ymd"
                                        name="crtr-ymd"
                                        uitype="normal"
                                        text=""
                                        class="bold"
                                        mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
                                ></sbux-label>)
							</span>
                    </li>
                </ul>
                <div class="ad_tbl_toplist">
                    <sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary" onclick="fn_docSpmt"></sbux-button>
                    <sbux-button id="btnSearchSpmtPrfmnc" name="btnSearchSpmtPrfmnc" uitype="normal" text="내역조회" class="btn btn-sm btn-outline-danger" onclick="fn_setGrdSpmtPrfmncList"></sbux-button>
                    <sbux-button id="btnDeleteSpmtPrfmnc" name="btnDeleteSpmtPrfmnc" uitype="normal" text="출하취소" class="btn btn-sm btn-outline-danger" onclick="fn_deleteSpmtPrfmnc"></sbux-button>
                </div>
            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-grdSpmtPrfmncList"></div>
            </div>
        </div>

    </div>
    <!--[pp] //검색결과 -->

</section>
<!-- 거래처 선택 Modal -->
<div>
    <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-cnpt">
    <jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
</div>
<!-- 차량 선택 Modal -->
<div>
    <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-vhcl">
    <jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
</div>
<!-- 출하지시번호 선택 Modal -->
<div>
    <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-spmtCmnd">
    <jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
</div>

<!--  출하실적엑셀 팝업 -->
<div>
    <sbux-modal id="modal-excel-spmtPrfmnc" name="modal-excel-spmtPrfmnc"
                uitype="middle"
                header-title="출하실적등록"
                body-html-id="body-modal-excelSpmtPrfmnc"
                footer-is-close-button="false"
                header-is-close-button="false"
                style="width:1000px"
    ></sbux-modal>
</div>
<div id="body-modal-excelSpmtPrfmnc">
    <jsp:include page="../../am/popup/spmtPrfmncExcelPopup.jsp"></jsp:include>
</div>
<sbux-button id="btnSpmtPrfmncPopup" name="btnSpmtPrfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel-spmtPrfmnc"></sbux-button>
</body>
<script type="text/javascript">

    //계량 목록
    var grdWghList;
    var jsonWghList = [];

    //재고정보
    var grdInvntrInfo;
    var jsonInvntrInfo =[];

    //출하내역 목록
    var grdSpmtPrfmncList;
    var jsonSpmtPrfmncList = [];

    //출하정보
    var grdSpmtInfoRegList;
    var jsonSpmtInfoRegList = [];


    var jsonComTrsprtCoCd = []; //운송사
    var jsonComCnptCd =[];      //거래처
    var jsonComItem = [];       //품목
    var jsonComVrty = [];       //품종
    var jsonComWarehouseSeCd =[]; //창고
    var jsonDtlPltBxCd = [];

    var radioJsonData = [
        {text : "기본", value : "bsc", checked :"checked"},
        {text : "상세", value : "dtl"}
    ];

    var checkboxJsonData = [
        {text : "예", truevalue : "Y" ,falsevalue: "N"}
    ];



    window.addEventListener('DOMContentLoaded', async function(e) {
        SBUxMethod.set("srch-dtp-wghYmd",gfn_dateToYmd(new Date()));
        SBUxMethod.set("dtl-dtp-spmtYmd",gfn_dateToYmd(new Date()));
        await fn_init();

    })

    const fn_initSBSelect = async function() {

        await gfn_setTrsprtsSBSelect('dtl-slt-trsprtCoCd', jsonComTrsprtCoCd, gv_selectedApcCd);	// 운송사
        await gfn_setCpntRgnSBSelect('dtl-slt-cnptCd', jsonComCnptCd, gv_selectedApcCd);	            // 거래처
        await gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd);	            // 품목
        await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd);	            // 품목
        await gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 'WAREHOUSE_SE_CD',gv_selectedApcCd);	// 창고
        await gfn_setPltBxSBSelect('dtl-slt-pltBxCd', jsonDtlPltBxCd, gv_selectedApcCd, "P")    // 팔레트
    }

    const fn_init = async function() {
        await fn_initSBSelect();
        await fn_createWghList();
        await fn_createInvntrInfo();
        await fn_createSpmtPrfmncList();
        await fn_createSpmtInfoRegList();


    }

    const fn_createWghList = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdWghList';
        SBGridProperties.id = 'grdWghList';
        SBGridProperties.jsonref = 'jsonWghList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["계량일자"], 		 ref: 'wghYmd',	 	type:'output', 	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, width:'10%', style:'text-align:center'},
            {caption: ["차량번호"],		 ref: 'vhclno', 	type:'output', width:'10%', style:'text-align:center'},
            {caption: ["생산자"], 		 ref: 'prdcrNm',	    type:'output',  width:'10%', style:'text-align:center'},
            {caption: ["총중량"], 	     ref: 'wholWght',	type:'output',  width:'10%', style:'text-align:right',format : {type:'number', rule:'#,### '}},
            {caption: ["공차중량"], 	     ref: 'emptVhclWght',	type:'output',  width:'10%', style:'text-align:right',format : {type:'number', rule:'#,### '}},
            {caption: ["감량률(%)"], 	     ref: 'rdcdRt',	type:'output',  width:'10%', style:'text-align:right',format : {type:'number', rule:'##.## '}},
            {caption: ["계산중량"], 	     ref: 'acptnWght',	type:'output',  width:'10%', style:'text-align:right',format : {type:'number', rule:'#,### '}},
            {caption: ["출고수량"], 	     ref: 'bxQntt',	type:'output',  width:'10%', style:'text-align:right',format : {type:'number', rule:'#,### '}},
            {caption: ["팔레트수량"], 	 ref: 'pltQntt',	type:'output',  width:'10%', style:'text-align:right',format : {type:'number', rule:'#,##0 '}},
            {caption: ["비고"],	 	     ref: 'rmrk',		type:'output', width:'10%',   style:'text-align:left'},
        ];
        grdWghList = _SBGrid.create(SBGridProperties);
        grdWghList.bind('click','fn_clickGrdWghList')
    }

    const fn_createInvntrInfo = function() {
        var SBGridProperties = {};

        const invntrInfoColumns = [];

        let invntrInfo = SBUxMethod.get("rch-rdo-invntrInfo");

        SBGridProperties.parentid = 'sb-area-grdInvntrInfo';
        SBGridProperties.id = 'grdInvntrInfo';
        SBGridProperties.jsonref = 'jsonInvntrInfo';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        invntrInfoColumns.push(
            {caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'3%', style: 'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}, userattr :{colNm : "checkedYn"}},
        )
        if(invntrInfo === "dtl") {
            invntrInfoColumns.push(
                {caption: ["포장번호"], ref: 'pckgno', type: 'output', width: '10%', style: 'text-align:center'},
                {caption: ["순번"], ref: 'pckgSn', type: 'output', width: '4%', style: 'text-align:center'},
                {caption: ["포장일자"], ref: 'pckgYmd', type: 'output', width: '10%', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
                {caption: ["생산자"], ref: 'prdcrNm', type: 'output', width: '7%', style: 'text-align:center'},
            )
        }
            invntrInfoColumns.push(
                {caption: ["상품명"], 		ref: 'gdsNm',	 	  	type:'output', 	width:'10%', style:'text-align:center'},
                {caption: ["품목"],		    ref: 'itemNm', 	        type:'output',  width:'6%', style:'text-align:center'},
                {caption: ["품종"], 		    ref: 'vrtyNm',	        type:'output',  width:'6%', style:'text-align:center'},
                {caption: ["규격"], 	        ref: 'spcfctNm',	    type:'output',  width:'6%', style:'text-align:center'},
                {caption: ["등급"],	 	    ref: 'grdNm',		    type:'output', width:'6%',   style:'text-align:center'},
                {caption: ["창고"],	 	    ref: 'warehouseSeNm',		    type:'output', width:'6%',   style:'text-align:center'},
                {caption: ["재고수량"],	 	ref: 'invntrQntt',		type:'output', width:'6%',   style:'text-align:right',format : {type:'number', rule:'#,##0 '}},
                {caption: ["재고중량"],	 	ref: 'invntrWght',		type:'output', width:'6%',   style:'text-align:right',format : {type:'number', rule:'#,##0 '}},
                {caption: ["출하수량"],	 	ref: 'spmtQntt',		type:'input', width:'7%',   style:'text-align:right; background-color: #FFF8DC;' ,format : {type:'number', rule:'#,##0 '}, typeinfo: {oneclickedit : true, mask : {alias :'numeric'}}, userattr : {colNm :"spmtQntt"}},
                {caption: ["출하중량"],	 	ref: 'spmtWght',		type:'input', width:'7%',   style:'text-align:right; background-color: #FFF8DC;' ,format : {type:'number', rule:'#,##0 '}, typeinfo: {oneclickedit : true}, userattr : {colNm :"spmtWght"}},
            )

        SBGridProperties.columns = invntrInfoColumns;
        grdInvntrInfo = _SBGrid.create(SBGridProperties);
        grdInvntrInfo.bind('valuechanged','fn_grdInvntrInfoValueChanged');
    }


    const fn_createSpmtInfoRegList = function() {

        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSpmtInfoRegList';
        SBGridProperties.id = 'grdSpmtInfoRegList';
        SBGridProperties.jsonref = 'jsonSpmtInfoRegList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'4%', style: 'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["상품명"],     ref: 'gdsNm',	 	type:'output', width:'15%',    style:'text-align:center'},
            {caption: ["품목"],		 ref: 'itemNm', 	type:'output', width:'10%',  style:'text-align:center'},
            {caption: ["품종"],		 ref: 'vrtyNm', 	type:'output', width:'10%',  style:'text-align:center'},
            {caption: ["규격"],		 ref: 'spcfctNm', 	type:'output', width:'10%',  style:'text-align:center'},
            {caption: ["등급"], 		 ref: 'grdNm',	    type:'output',  width:'10%', style:'text-align:center'},
            {caption: ["창고"], 		 ref: 'warehouseSeNm',	    type:'output',  width:'10%', style:'text-align:center'},
            {caption: ["출하수량"], 	 ref: 'spmtQntt',	type:'input',  width:'10%',  style:'text-align:right',format : {type:'number', rule:'#,### '}},
            {caption: ["출하중량"],	 ref: 'spmtWght',	type:'input', width:'10%',   style:'text-align:right',format : {type:'number', rule:'#,### '}},
            {caption: ["포장번호"],	 ref: 'pckgno',	type:'input', width:'15%',   style:'text-align:center',},
            {caption: ["순번"],	 ref: 'pckgSn',	type:'input', width:'6%',   style:'text-align:center',format : {type:'number', rule:'#,### '}},
        ];
        grdSpmtInfoRegList = _SBGrid.create(SBGridProperties);
    }

    const fn_createSpmtPrfmncList = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSpmtPrfmncList';
        SBGridProperties.id = 'grdSpmtPrfmncList';
        SBGridProperties.jsonref = 'jsonSpmtPrfmncList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {
                caption : ["선택"],
                ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['출하일자'], 		ref: 'spmtYmd', 		width: '100px', type: 'output', 	style: 'text-align:center',
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'],			ref: 'cnptNm', 			width: '120px', type: 'output', 	style: 'text-align:center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['등급'], 			ref: 'gdsGrdNm', 		width: '60px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '150px', type: 'output', 	style: 'text-align:center'},
            {caption: ['수량'], 			ref: 'spmtQntt', 		width: '60px', 	type: 'output', 	style: 'text-align:right'},
            {caption: ['중량 (Kg)'], 		ref: 'spmtWght',		width: '80px', 	type: 'output', 	style: 'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['운송회사'], 		ref: 'trsprtCoNm', 		width: '180px', type: 'output', 	style: 'text-align:center'},
            {caption: ['차량번호'], 		ref: 'vhclno', 			width: '100px', type: 'output', 	style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 			width: '150px', type: 'output', 	style: 'text-align:center'},
            {caption: ['운임비용 (원)'], 	ref: 'trsprtCst', 		width: '80px', 	type: 'output', 	style: 'text-align:center',
                typeinfo : {mask : {alias : 'numeric'}, maxlength: 10}, format : {type:'number', rule:'#,###'}},
            {caption: ['비고'], 			ref: 'rmrk', 			width: '150px', type: 'output', 	style: 'text-align:center'}
        ];
        grdSpmtPrfmncList = _SBGrid.create(SBGridProperties);
    }


    /**
     * @name fn_search
     * @description 계량목록 조회
     */
    const fn_search = async function () {

        let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");

        if(gfn_isEmpty(wghYmd)){
            gfn_comAlert("W0001", "계량일자");			//	W0001	{0}을/를 선택하세요.
            return;
        }
        let vhclno = SBUxMethod.get("dtl-inp-vhclno");
        let wghno = SBUxMethod.get("dtl-inp-wghno");

        jsonWghList.length = 0;
        grdWghList.rebuild();
        SBUxMethod.set("dtl-inp-wghYmd", "");
        SBUxMethod.set("dtl-inp-wghNo", "");
        SBUxMethod.set("dtl-inp-vhclNo", "");
        SBUxMethod.set("dtl-inp-drvrNm", "");
        SBUxMethod.set("dtl-inp-wholWght", "");
        SBUxMethod.set("dtl-inp-spmtQntt", "");
        SBUxMethod.set("dtl-inp-emptVhclWght", "");
        SBUxMethod.set("dtl-inp-spmtWght", "");
        SBUxMethod.set("dtl-inp-rdcdRt", "");
        SBUxMethod.set("dtl-inp-pltQntt", "");
        SBUxMethod.set("dtl-inp-rmrk", "");
        SBUxMethod.set("dtl-inp-spmtVhclno", "");
        SBUxMethod.set("dtl-slt-pltBxCd","");
        SBUxMethod.set("dtl-spn-bssInvntrQntt","0");



        try{
            const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncListForSpmtReg.do", {
                apcCd	: gv_selectedApcCd,
                wghYmd	: wghYmd,
                vhclno  : vhclno,
                wghno   : wghno
            });
            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            if (data.resultList.length > 0) {
                jsonWghList = data.resultList;
                grdWghList.rebuild();
            }

        }catch (e) {
            console.error(e);
        }

    }

    /**
     * @name fn_clickGrdWghList
     * @description 계량목록 click event
     */
    const fn_clickGrdWghList = async function () {
        const row = grdWghList.getRow();
        if (row < 1){
            return;
        }
        console.log(row);
        const rowData = grdWghList.getRowData(row);
        if (gfn_isEmpty(rowData)){
            return;
        }

        SBUxMethod.set("dtl-inp-wghYmd",rowData.wghYmd);
        SBUxMethod.set("dtl-inp-wghNo",rowData.wghno);
        SBUxMethod.set("dtl-inp-vhclNo",rowData.vhclno);
        SBUxMethod.set("dtl-inp-drvrNm",rowData.drvrNm);
        SBUxMethod.set("dtl-inp-wholWght",rowData.wholWght);
        SBUxMethod.set("dtl-inp-emptVhclWght",rowData.emptVhclWght);
        SBUxMethod.set("dtl-inp-rdcdRt",rowData.rdcdRt);
        SBUxMethod.set("dtl-inp-spmtQntt",rowData.bxQntt);
        SBUxMethod.set("dtl-inp-spmtWght",rowData.acptnWght);
        SBUxMethod.set("dtl-inp-pltQntt",rowData.pltQntt);
        SBUxMethod.set("dtl-inp-rmrk",rowData.rmrk);
        SBUxMethod.set("dtl-inp-spmtVhclno",rowData.vhclno);


    }

    /**
     * @name fn_searchInvntr
     * @description 재고정보조회
     */
    const fn_searchInvntr = async function() {
        let url = "";

        const gdsNm = SBUxMethod.get("dtl-inp-gdsNm");
        const warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
        const itemCd = SBUxMethod.get("srch-slt-itemCd");
        let invntrInfo = SBUxMethod.get("rch-rdo-invntrInfo");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
        if(!gfn_isEmpty(vrtyCd)) {
            vrtyCd = vrtyCd.substring(4,8);
        }
        if(!gfn_isEmpty(invntrInfo)) {
            if(invntrInfo === "bsc") {
                url = "/am/wgh/selectInvntrListForSpmtReg.do" ;
            }else if(invntrInfo === "dtl"){
                url = "/am/wgh/selectInvntrDtlListForSpmtReg.do";
            }
        }
        try{
            const postJsonPromise = gfn_postJSON(url, {
                apcCd	: gv_selectedApcCd,
                gdsNm	: gdsNm,
                warehouseSeCd   : warehouseSeCd,
                itemCd          : itemCd,
                vrtyCd          : vrtyCd,
            });
            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0) {
                jsonInvntrInfo = data.resultList;
                grdInvntrInfo.rebuild();
            } else {
                jsonInvntrInfo.length = 0;
                grdInvntrInfo.rebuild();
            }

        } catch (e) {
          console.error(e);
        }

    }

    /**
     * @name fn_addRow
     * @description 행추가
     */
    const fn_addRow = async function () {
        const invntrInfo = SBUxMethod.get("rch-rdo-invntrInfo");

        let result = [];

        for(let i = 0; i < jsonInvntrInfo.length; i++){
            if(jsonInvntrInfo[i].checkedYn === "Y"){
                result.push(jsonInvntrInfo[i]);
            }
        }
        if (result.length === 0) {
            gfn_comAlert("W0001", "출하 등록할 재고정보");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        let newAdd = [];
        let allData = grdSpmtInfoRegList.getGridDataAll();

        if(invntrInfo === "bsc"){
            for(let i = 0; i < result.length; i++){
                let isExist = false;
                for( let j = 0; j < allData.length;j++){
                    if(result[i].gdsNm === allData[j].gdsNm && result[i].itemCd === allData[j].itemCd && result[i].vrtyCd === allData[j].vrtyCd
                        && result[i].spcfctCd === allData[j].spcfctCd && result[i].grdCd === allData[j].grdCd && result[i].warehouseSeCd === allData[j].warehouseSeCd ){
                        isExist = true;
                        break;
                    }
                }
                if(!isExist){ //중복아닐때
                    newAdd.push(result[i]);
                }
            }
        } else if(invntrInfo === "dtl"){
            for(let i = 0; i < result.length; i++){
                let isExist = false;
                for( let j = 0; j < allData.length;j++){
                    if(result[i].pckgno === allData[j].pckgno && result[i].pckgSn === allData[j].pckgSn ){
                        isExist = true;
                        break;
                    }
                }
                if(!isExist){
                    newAdd.push(result[i]);
                }
            }
        }

        grdSpmtInfoRegList.addRows(newAdd);
        grdSpmtInfoRegList.refresh();

    }

    /**
     * @name fn_delRow
     * @description 행삭제
     */
    const fn_delRow = async function() {
        let allData = grdSpmtInfoRegList.getGridDataAll();
        let deleteIndex = [];

        for(let i = 0; i < allData.length; i++){
            if(allData[i].checkedYn === "Y"){
                deleteIndex.push(i+1);
            }
        }
        if(gfn_isEmpty(deleteIndex)) {
            gfn_comAlert("W0003", "삭제");    // W0003 {0}할 대상이 없습니다.
            return;
        }
        for(let i = deleteIndex.length-1; i >= 0; i--){
            grdSpmtInfoRegList.deleteRow(deleteIndex[i]);
        }
    }

    /**
     * @name fn_grdInvntrInfoValueChanged
     * @description 재고정보 - 출하수량/출하중량 변경 event
     */
    const fn_grdInvntrInfoValueChanged = function (){
        let row = grdInvntrInfo.getRow();
        let col = grdInvntrInfo.getCol();

        let rowData = grdInvntrInfo.getRowData(row,false); // call by refrence로 반환
        let userAttr = grdInvntrInfo.getColUserAttr(col);

        let spmtQntt = parseInt(rowData.spmtQntt); // 출하 수량
        let spmtWght = parseInt(rowData.spmtWght); // 출하 중량

        let invntrQntt = rowData.invntrQntt; // 재고 수량
        let invntrWght = rowData.invntrWght; // 재고 중량

        let pckgQntt = rowData.pckgQntt; // 포장 수량
        let pckgWght = rowData.pckgWght; // 포장 중량


        switch (userAttr.colNm) {
            case "checkedYn" :
                if(rowData.checkedYn === "Y"){
                    rowData.spmtQntt = invntrQntt;
                    rowData.spmtWght = invntrWght;
                }else {
                    rowData.spmtQntt = 0;
                    rowData.spmtWght = 0;
                }
                break;

            case "spmtQntt" :
                if(spmtQntt > invntrQntt){
                    gfn_comAlert("W0008", "재고수량", "출하수량"); //	W0008	{0} 보다 {1}이/가 큽니다.
                    rowData.spmtQntt = 0;
                    rowData.checkedYn = "N";
                } else {
                    if(pckgQntt > 0 ){
                        rowData.spmtWght = Math.round(spmtQntt*pckgWght/pckgQntt);
                    }else {
                        rowData.spmtWght = 0;
                    }
                    rowData.checkedYn = "Y";

                }
                break;

            case "spmtWght" :
                if(spmtWght > invntrWght){
                    gfn_comAlert("W0008", "재고중량", "출하중량"); //	W0008	{0} 보다 {1}이/가 큽니다.
                    rowData.spmtWght = 0;
                    rowData.checkedYn = "N";
                } else {
                    if( spmtQntt === 0 ){
                        gfn_comAlert("W0002", "재고수량"); // W0002 {0}을/를 입력하세요.
                        rowData.spmtWght = 0;
                        grdInvntrInfo.refresh();
                        return;
                    }
                    rowData.checkedYn = "Y";
                }

                break;

            default :
                break;

        }

        grdInvntrInfo.refresh();

    }

    /**
     * @name fn_save
     * @description 출하실적등록
     */
    const fn_save = async function() {
        let spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");
        let vhclno = SBUxMethod.get("dtl-inp-spmtVhclno");
        let cnptCd = SBUxMethod.get("dtl-slt-cnptCd");
        let dldtn = SBUxMethod.get("dtl-inp-dldtn");
        let trsprtCoCd = SBUxMethod.get("dtl-slt-trsprtCoCd");
        let trsprtCst = SBUxMethod.get("dtl-inp-trsprtCst");
        let rmrk = SBUxMethod.get("dtl-inp-spmtRmrk");
        let pltBxCd			= SBUxMethod.get("dtl-slt-pltBxCd");
        let bssInvntrQntt 	= SBUxMethod.get("dtl-spn-bssInvntrQntt");

        //계량정보
        let wghno = SBUxMethod.get('dtl-inp-wghNo');

        let allSpmtData = grdSpmtInfoRegList.getGridDataAll();

        let spmtRegList = [];

        allSpmtData.forEach(item => {
            if(item.checkedYn === "Y"){
                spmtRegList.push({
                    apcCd : item.apcCd,
                    itemCd : item.itemCd,
                    vrtyCd : item.vrtyCd,
                    spcfctCd : item.spcfctCd,
                    gdsGrd : item.gdsGrd,
                    spmtPckgUnitCd : item.spmtPckgUnitCd,
                    warehouseSeCd : item.warehouseSeCd,
                    spmtQntt : item.spmtQntt,
                    spmtWght : item.spmtWght,
                    pckgno : item.pckgno,
                    pckgSn : item.pckgSn,

                })
            }
        });

        if(spmtRegList.length == 0){
            gfn_comAlert("W0003", "출하등록");			// W0003	{0}할 대상이 없습니다.
            return;
        }

        if(gfn_isEmpty(spmtYmd)){
            gfn_comAlert("W0001", "출하일자");			//	W0001	{0}을/를 선택하세요.
            return;
        }
        if(gfn_isEmpty(cnptCd)){
            gfn_comAlert("W0001", "거래처");			//	W0001	{0}을/를 선택하세요.
            return;
        }
        if(gfn_isEmpty(trsprtCoCd)){
            gfn_comAlert("W0001", "운송회사");			//	W0001	{0}을/를 선택하세요.
            return;
        }
        if(gfn_isEmpty(vhclno)){
            gfn_comAlert("W0001", "차량번호");			//	W0001	{0}을/를 선택하세요.
            return;
        }

        let saveParam = {
            apcCd : gv_selectedApcCd,
            spmtYmd : spmtYmd,
            vhclno : vhclno,
            cnptCd : cnptCd,
            dldtn : dldtn,
            trsprtCoCd : trsprtCoCd,
            trsprtCst : trsprtCst,
            rmrk : rmrk,
            spmtPrfmncList : spmtRegList,
            wghno : wghno,
            pltBxCd : pltBxCd,
            bssInvntrQntt : bssInvntrQntt
        };

        if(!gfn_comConfirm("Q0001", "출하등록")) {    // 출하등록 하시겠습니까?
            return;
        }

        try{
            const postJsonPromise = gfn_postJSON("/am/wgh/insertSpmtPrfmncByWgh.do", saveParam);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.

                //계량정보
                SBUxMethod.set("dtl-inp-wghYmd", "");
                SBUxMethod.set("dtl-inp-wghNo", "");
                SBUxMethod.set("dtl-inp-vhclNo", "");
                SBUxMethod.set("dtl-inp-drvrNm", "");
                SBUxMethod.set("dtl-inp-wholWght", "");
                SBUxMethod.set("dtl-inp-spmtQntt", "");
                SBUxMethod.set("dtl-inp-emptVhclWght", "");
                SBUxMethod.set("dtl-inp-spmtWght", "");
                SBUxMethod.set("dtl-inp-rdcdRt", "");
                SBUxMethod.set("dtl-inp-pltQntt", "");
                SBUxMethod.set("dtl-inp-rmrk", "");

                jsonWghList = 0;
                grdWghList.rebuild();

                //출하정보
                jsonSpmtInfoRegList = 0;
                grdSpmtInfoRegList.rebuild();

                SBUxMethod.set("dtl-dtp-spmtYmd",gfn_dateToYmd(new Date()));
                SBUxMethod.set("dtl-inp-spmtVhclno", "");
                SBUxMethod.set("dtl-slt-cnptCd","");
                SBUxMethod.set("dtl-inp-dldtn","");
                SBUxMethod.set("dtl-slt-trsprtCoCd","");
                SBUxMethod.set("dtl-inp-trsprtCst","");
                SBUxMethod.set("dtl-inp-spmtRmrk","");
                SBUxMethod.set("dtl-slt-pltBxCd","");
                SBUxMethod.set("dtl-spn-bssInvntrQntt","0");
                SBUxMethod.refresh("chkPltBxCd");


                await fn_searchInvntr();
                await fn_setGrdSpmtPrfmncList();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            console.error("failed", e.message);
        }


    }

    /**
     * @name fn_setGrdSpmtPrfmncList
     * @description 출하실적 내역 조회
     */
    const fn_setGrdSpmtPrfmncList = async function(){
        let spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");

        const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDtlList.do", {
            apcCd		: gv_selectedApcCd,
            spmtYmd		: spmtYmd
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                /** @type {number} **/
                jsonSpmtPrfmncList.length = 0;
                data.resultList.forEach((item, index) => {
                    jsonSpmtPrfmncList.push(item);
                });
                grdSpmtPrfmncList.rebuild();
                SBUxMethod.set("crtr-ymd", spmtYmd);

            } else {
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_docSpmt
     * @description 송품장 발행
     */
    const fn_docSpmt = function() {
        const spmtnoList = [];
        const allData = grdSpmtPrfmncList.getGridDataAll();
        allData.forEach(item => {
            if(item.checkedYn === "Y" ){
                spmtnoList.push(item.spmtno)
            }
        });

        if (spmtnoList.length === 0) {
            gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        const spmtno = spmtnoList.join("','");
        gfn_popClipReport("송품장", "am/trsprtCmdtyDoc.crf", {apcCd: gv_selectedApcCd, spmtno: spmtno});
    }


    /**
     * @name fn_deleteSpmtPrfmnc
     * @description 출하취소
     */
    const fn_deleteSpmtPrfmnc = async function(){
        const deleteSpmtList = [];
        const allData = grdSpmtPrfmncList.getGridDataAll();
        allData.forEach((item,index) => {
            if (item.checkedYn === "Y" ){

                //중복항목 체크
                let isExist = false;
                for (let i = 0; i < deleteSpmtList.length; i++){
                    if (_.isEqual(deleteSpmtList[i].apcCd,item.apcCd) && _.isEqual(deleteSpmtList[i].spmtno,item.spmtno)) {
                        isExist = true;
                        break;
                    }
                }

                // 체크의 결과에 따라 삭제목록에 추가
                if (!isExist) {
                    deleteSpmtList.push({
                        apcCd : item.apcCd,
                        spmtno : item.spmtno,
                        wghno : item.wghno
                    });
                }


            }
        });

        if(deleteSpmtList.length == 0){
            gfn_comAlert("W0003", "출하취소");			// W0003	{0}할 대상이 없습니다.
            return;
        }

        if(!gfn_comConfirm("Q0001", "출하취소")) {    // 출하취소 하시겠습니까?
            return;
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/wgh/deleteSpmtPrfmncList.do", deleteSpmtList);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");					// I0001 처리 되었습니다.
                await fn_setGrdSpmtPrfmncList();
                await fn_searchInvntr();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        const itemInfo = _.find(jsonComItem, {
            value: itemCd
        });

        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd)
        ]);
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

    /**
     * @name fn_onChangeRchRdoInvntrInfo
     * @description 재고정보 선택 변경 event
     */
    const fn_onChangeRchRdoInvntrInfo = function () {
        jsonInvntrInfo.length = 0;
        grdInvntrInfo.rebuild();
        fn_createInvntrInfo();
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>