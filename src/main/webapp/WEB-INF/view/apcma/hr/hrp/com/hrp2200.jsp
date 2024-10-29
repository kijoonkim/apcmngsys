<%
    /**
     * @Class Name        : hrp2200.jsp
     * @Description       : 급여 변동항목 등록 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.29
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.29   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 급여 변동항목 등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3><!-- 급여 변동항목 등록 -->
            </div>
           <%-- <div style="margin-left: auto;">
                &lt;%&ndash; <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                              class="btn btn-sm btn-outline-danger"
                              onclick="fn_create"></sbux-button>&ndash;%&gt;
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_delete"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_search"></sbux-button>
            </div>--%>
        </div>

        <!--[pp] 검색 -->
        <!--[APC] START -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 8%">
                <col style="width: 4%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 8%">
                <col style="width: 4%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 8%">
                <col style="width: 1%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select id="SRCH_PAY_AREA_TYPE" uitype="single" jsondata-ref="jsonPayAreaType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                </td>
                <td  colspan="5" style="border-right: hidden;">&nbsp;</td>
               <%-- <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>--%>
            </tr>
            <tr>
                <th scope="row" class="th_bg">귀속년월</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <%--<sbux-datepicker
                            id="SRCH_PAY_YYYYMM"
                            name="SRCH_PAY_YYYYMM"
                            uitype="popup"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            onchange="fn_dtpChangeClclnYmd"
                    ></sbux-datepicker>--%>
                    <sbux-datepicker id="SRCH_PAY_YYYYMM" name="SRCH_PAY_YYYYMM" uitype="popup" datepicker-mode="month" date-format="yyyymm" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">지급구분</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-select id="SRCH_PAY_TYPE" uitype="single" jsondata-ref="jsonPayType" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">입력부서</th>
                <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                    <sbux-input
                            uitype="text"
                            id="SRCH_ENTRY_DEPT_CODE"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="SRCH_ENTRY_DEPT_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" class="td_input" data-group="DEPT">
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup1"
                    ></sbux-button>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>급여변동항목 리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwMaster" style="height:800px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>급여 변동 항목</span></li>
                    </ul>

                    <div class="ad_tbl_toplist">
                        <sbux-button
                                id="btnApply"
                                name="btnDel"
                                uitype="normal"
                                text="수당기준적용"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnApply"
                                style="float: right;"
                        >
                        </sbux-button>
                        <sbux-button
                                id="btnDel"
                                name="btnDel"
                                uitype="normal"
                                text="행삭제"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnDel"
                                style="float: right;"
                        >
                        </sbux-button>
                        <sbux-button
                                id="btnAdd"
                                name="btnAdd"
                                uitype="normal"
                                text="행추가"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnAdd"
                                style="float: right;"
                        ></sbux-button>
                        <sbux-button
                                id="btmCopyClear"
                                name="btmCopyClear"
                                uitype="normal"
                                text="복사해제모드" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_gridCopyClear"
                                style="float: right; display: block"
                        ></sbux-button>
                        <sbux-button
                                id="btmCopyLine"
                                name="btmCopyLine"
                                uitype="normal"
                                text="행복사모드" <%--행단위로 복사--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_gridCopyLine"
                                style="float: right; display: none;"
                        ></sbux-button>
                        <sbux-button
                                id="btmCopyCell"
                                name="btmCopyCell"
                                uitype="normal"
                                text="셀복사모드" <%--셀단위로 복사--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_gridCopyCell"
                                style="float: right; display: none;"
                        ></sbux-button>
                    </div>
                </div>
                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:2%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:2%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:3%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">급여항목코드</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_ITEM_CODE" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">급여항목명</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_ITEM_NAME" uitype="text" style="width:95%" placeholder=""
                                            class="form-control input-sm" readonly></sbux-input>
                            </td>
                           <%-- <td style="border-right: hidden;">&nbsp;</td>--%>

                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">입력부서</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="ENTRY_DEPT_CODE" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="ENTRY_DEPT_NAME" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <%--<td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="ENTRY_DEPT_NAME"
                                        name="ENTRY_DEPT_NAME"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>--%>

                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>

                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>급여변동항목 등록</span></li>
                    </ul>

                    <div class="ad_tbl_toplist">
                        <input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="fn_importExcelData(event)">
                        <input type="file" name="excelFile2" id="excelFile2" accept=".xls,.xlsx" style="display: none;">
                        <sbux-button id="btnUpload2" name="btnUpload2" uitype="normal" class="btn btn-sm btn-outline-danger" text="Excel 업로드" onclick="fn_uld"></sbux-button>
                       <%-- <sbux-button
                                id="btnUpload"
                                name="btnUpload"
                                uitype="normal"
                                text="Excel 업로드"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_uld"
                                style="float: right;"
                        ></sbux-button>--%>
                        <sbux-button
                                id="btnDownload"
                                name="btnDownload"
                                uitype="normal"
                                text="Excel 양식받기"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_exportData"
                                style="float: right;"
                        ></sbux-button>
                        <sbux-button
                                id="btnSearchItem"
                                name="btnSearchItem"
                                uitype="normal"
                                text="검색"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_payInfoDelRow"
                                style="float: right;"
                        ></sbux-button>
                    </div>
                </div>
                <div>
                    <table id="dataArea3" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:2%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:2%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:3%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">사번</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="EMP_CODE" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">이름</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="EMP_FULL_NAME" uitype="text" style="width:95%" placeholder=""
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <%-- <td style="border-right: hidden;">&nbsp;</td>--%>

                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                    </table>
                </div>

                <div>
                    <div id="sb-area-gvwDetall" style="height:600px; width:100%;" ></div>
                </div>

                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:3%">
                            <col style="width:2%">

                            <col style="width:3%">
                            <col style="width:5%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:3%">
                        </colgroup>
                        <tr>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="ROW_COUNT" uitype="text" style="width:100%" placeholder="" disabled="true"
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric'}"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_AMT_TOTAL" uitype="text" style="width:100%" placeholder="" disabled="true"
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric'}"></sbux-input>
                            </td>
                            <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </div>
</section>

<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------


    var jsonSiteCode = []; //법인 ( L_ORG001 )site_code
    var jsonPayType = []; //지급구분 ( L_HRB008 )pay_type
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )pay_area_type
    var jsonPayItemCategory = []; //급여영역 ( L_HRB009 )pay_item_category

    var gvwDetallGrid;
    var jsonDetallList = [];
    var gvwMasterGrid;
    var jsonMasterList = [];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();


        document.getElementById('excelFile2').addEventListener('change', function (event) {
            if (!window.FileReader) return;

            let PAY_ITEM_NAME = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME")); //급여항목명

            //급여 변동항목 등록_출산경조금공제 - Excel파일 명
            if (event.target.files[0].name.indexOf("_") < 0) {
                gfn_comAlert("E0000", "해당 급여항목의 엑셀파일만 업로드 가능합니다."); // HRP2200_001
                return;
            } else if (event.target.files[0].name.substring(event.target.files[0].name.indexOf("_") + 1,
                event.target.files[0].name.length - 5) != PAY_ITEM_NAME) {
                gfn_comAlert("E0000", "해당 급여항목의 엑셀파일만 업로드 가능합니다."); // HRP2200_001
                return;
            }

            var reader = new FileReader();

            reader.addEventListener(
                "load",
                () => {
                    let workBook = XLSX.read(reader.result, {type: 'binary'});
                    workBook.SheetNames.forEach(function (sheetName) {
                        let list = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {
                            range: 1, header: [
                                "DEPT_NAME",
                                "EMP_CODE",
                                "EMP_FULL_NAME",
                                "PAY_AMT",
                                "TAX_PAY_DATE",
                                "MEMO",
                                "UPDATE_TIME",
                                "UPDATE_USERID",

                            ]
                        });

                        list.forEach((item, index) => {

                            item["CHK_YN"] = 'Y';
                            item["DEPT_NAME"] = item.DEPT_NAME;
                            item["EMP_CODE"] = item.EMP_CODE;
                            item["EMP_FULL_NAME"] = item.EMP_FULL_NAME;
                            item["PAY_AMT"] = item.PAY_AMT;
                            item["TAX_PAY_DATE"] = item.TAX_PAY_DATE.replace(/-/gi, "");
                            item["MEMO"] = item.MEMO;
                            item["UPDATE_TIME"] = item.UPDATE_TIME.replace(/-/gi, "");
                            item["UPDATE_USERID"] = item.UPDATE_USERID;
                            item["TXN_ID"] = '';

                            gvwDetallGrid.addRow(true, item);
                        });
                    });
                    fn_save();
                },
                false,
            );
            reader.readAsBinaryString(event.target.files[0]);
        });

    });

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            //지역
            gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_TYPE'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCategory, 'L_HRB009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_ENTRY_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_ENTRY_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_ENTRY_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    /**
     * 그리드내 공통팝업 오픈
     */
    var fn_compopup3 = function(row, col) {

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= "";
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            , whereClause           : strWhereClause
            , searchCaptions        :   ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields     :   ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues     :   [""           , ""         ,""             ,searchText         ,""]
            , height                : '400px'
            , tableHeader           :   ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames      :   ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths     :   ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            ,itemSelectEvent		: function (data){
                //그리드내 원하는 위치에 값 셋팅하기
                gvwDetallGrid.setCellData(row, (col-2), data['DEPT_NAME']);
                gvwDetallGrid.setCellData(row, (col-1), data['EMP_CODE']);
                gvwDetallGrid.setCellData(row, (col+1), data['EMP_NAME']);
            }
        });
    }

    const fn_init = async function () {

        let openDate = gfn_dateToYm(new Date());

        //귀속년월 날자값 셋팅
        SBUxMethod.set("SRCH_PAY_YYYYMM", 			openDate);

        fn_createGrid();
        fn_createDetallGrid();

        /*fn_search();*/
    }

    // 신규
   /* function cfn_add() {
        fn_create();
    }*/
    // 저장
    function cfn_save() {
        fn_save();
    }
    // 삭제
    function cfn_del() {
        fn_delete();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //급여변동항목 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwMaster';
        SBGridProperties.id = 'gvwMasterGrid';
        SBGridProperties.jsonref = 'jsonMasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["급여항목구분"], ref : 'PAY_ITEM_CATEGORY', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCategory', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["급여항목코드"], ref: 'PAY_ITEM_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["급여항목명"], ref: 'PAY_ITEM_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["입력부서 코드"], ref: 'ENTRY_DEPT_CODE', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["입력부서 명"], ref: 'ENTRY_DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["수당기준"], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center', hidden: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값

        ];

        gvwMasterGrid = _SBGrid.create(SBGridProperties);
        gvwMasterGrid.bind('click', 'fn_view');
    }

    //급여변동항목 등록 리스트
    function fn_createDetallGrid(chMode, rowData) {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDetall';
        SBGridProperties.id = 'gvwDetallGrid';
        SBGridProperties.jsonref = 'jsonDetallList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (chMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(chMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if(chMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        /*SBGridProperties.explorerbar = 'move';*/				// 개인화 컬럼 이동 가능
        /* SBGridProperties.contextmenu = true;*/				// 우클린 메뉴 호출 여부
        /*SBGridProperties.contextmenulist = objMenuList1;*/	// 우클릭 메뉴 리스트
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center', /*hidden: true,*/
                typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원검색 팝업"], 	ref: 'POP_BTN', type:'button', width:'80px', style:'text-align:center', /*disabled: true,*/
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'>선택</button>";
                }
            },
            {caption: ["이름"], ref: 'EMP_FULL_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["통화금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ['지급일(세무)'], 		ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ['수정일'], 		ref: 'UPDATE_TIME', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["수정자"], ref: 'UPDATE_USERID', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["TXN_ID"], ref: 'TXN_ID', type: 'input', width: '100px', style: 'text-align:left', hidden: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값


        ];

        gvwDetallGrid = _SBGrid.create(SBGridProperties);

        if (_.isEmpty(rowData) == false){
            jsonDetallList.length = 0;
            jsonDetallList.push(rowData);
            gvwDetallGrid.rebuild();
        }


        gvwDetallGrid.bind('click', 'fn_viewDetaill');
        gvwDetallGrid.bind('valuechanged','gridValueChanged');
    }

    /**
     * 그리드내 팝업 조회
     */
    function fn_gridPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup3(row, col);
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE       = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_YYYYMM      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE        = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_FULL_NAME   = gfnma_nvl(SBUxMethod.get("EMP_FULL_NAME"));
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));

         if (!PAY_YYYYMM) {
             gfn_comAlert("W0002", "귀속년월");
             return;
         }

         if (!PAY_TYPE) {
             gfn_comAlert("W0002", "지급구분");
             return;
         }

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE          : SITE_CODE
                ,V_P_PAY_YYYYMM         : PAY_YYYYMM
                ,V_P_PAY_TYPE           : PAY_TYPE
                ,V_P_ENTRY_DEPT_CODE    : ''
                ,V_P_PAY_ITEM_CODE      : ''
                ,V_P_EMP_CODE           : EMP_CODE
                ,V_P_EMP_FULL_NAME      : EMP_FULL_NAME
                ,V_P_PAY_AREA_TYPE      : PAY_AREA_TYPE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: p_userId
                , V_P_PC: ''
            };
            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp2200List.do", {
                getType: 'json',
                workType: 'MASTER',
                cv_count: '1',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    /** @type {number} **/
                    let totalRecordCount = 0;

                    jsonMasterList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CATEGORY   : item.PAY_ITEM_CATEGORY,
                            PAY_ITEM_CODE       : item.PAY_ITEM_CODE,
                            PAY_ITEM_NAME       : item.PAY_ITEM_NAME,
                            ENTRY_DEPT_CODE     : item.ENTRY_DEPT_CODE,
                            ENTRY_DEPT_NAME     : item.ENTRY_DEPT_NAME,
                            CHK_YN              : item.CHK_YN
                        }
                        jsonMasterList.push(msg);
                        totalRecordCount++;
                    });

                    gvwMasterGrid.rebuild();
                    document.querySelector('#listCount').innerText = totalRecordCount;

                    if(jsonMasterList.length > 0) {
                        gvwMasterGrid.clickRow(1);
                    }

                    //fn_view();
                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }

    }


    //상세정보 보기
    async function fn_view() {

        let nCol = gvwMasterGrid.getCol();
        let nRow = gvwMasterGrid.getRow();

        if (nCol == -1) {
            return;
        }
        if (nRow == -1) {
            return;
        }

        let rowData = gvwMasterGrid.getRowData(nRow);
        //let allDatas = gvwMasterGrid.getGridDataAll();

        //특정 열 부터 이벤트 적용
        /*if (_.isEmpty(allDatas)){
            return;
        }else if (nRow < 1){
            nRow = 1; //그리드 로우 첫번째값 셋팅;
        }*/

       /* SBUxMethod.set("EMP_CODE", ""); //사번
        SBUxMethod.set("EMP_FULL_NAME", ""); //이름*/


        let SITE_CODE       = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let PAY_YYYYMM      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE        = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_FULL_NAME   = gfnma_nvl(SBUxMethod.get("EMP_FULL_NAME"));
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));

        if(_.isEmpty(rowData) == false) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE          : ''
                ,V_P_PAY_YYYYMM         : PAY_YYYYMM
                ,V_P_PAY_TYPE           : PAY_TYPE
                ,V_P_ENTRY_DEPT_CODE    : ''/*rowData.ENTRY_DEPT_CODE*/
                ,V_P_PAY_ITEM_CODE      : rowData.PAY_ITEM_CODE
                ,V_P_EMP_CODE           : ''
                ,V_P_EMP_FULL_NAME      : ''
                ,V_P_PAY_AREA_TYPE      : ''

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp2200List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '1',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    /** @type {number} **/
                    let totalRecordCount = 0;

                    jsonDetallList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            CHK_YN          : item.CHK_YN,
                            DEPT_NAME       : item.DEPT_NAME,
                            EMP_CODE        : item.EMP_CODE,
                            EMP_FULL_NAME   : item.EMP_FULL_NAME,
                            PAY_AMT         : item.PAY_AMT,
                            MEMO            : item.MEMO,
                            TAX_PAY_DATE    : item.TAX_PAY_DATE,
                            UPDATE_TIME     : item.UPDATE_TIME,
                            UPDATE_USERID   : item.UPDATE_USERID,
                            TXN_ID          : item.TXN_ID

                        }
                        jsonDetallList.push(msg);
                        totalRecordCount++;
                    });

                    gvwDetallGrid.rebuild();
                    SBUxMethod.set("ROW_COUNT", totalRecordCount);


                    gfnma_uxDataClear('#dataArea2');
                    gfnma_uxDataClear('#dataArea3');

                    SBUxMethod.set("PAY_ITEM_CODE", rowData.PAY_ITEM_CODE); //급여항목코드
                    SBUxMethod.set("PAY_ITEM_NAME", rowData.PAY_ITEM_NAME); //급여항목명
                    SBUxMethod.set("ENTRY_DEPT_CODE", rowData.ENTRY_DEPT_CODE); //입력부서
                    SBUxMethod.set("ENTRY_DEPT_NAME", rowData.ENTRY_DEPT_NAME); //입력부서 코드

                    let chk_yn = rowData.CHK_YN;
                    if (chk_yn == 'Y') {
                        $("#fn_btnApply").attr("disabled", true);
                    }else{
                        $("#fn_btnApply").attr("disabled", false);
                    }
                    /*fn_view('search');*/
                    fn_viewDetaill();
                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }

    }

    //상세정보 보기
    async function fn_viewDetaill() {

        let nRow = gvwDetallGrid.getRow();

        let allDatas = gvwDetallGrid.getGridDataAll()

        //특정 열 부터 이벤트 적용
        if (allDatas.length == 0 ){
            return;
        }else if (nRow < 1){
            nRow = 1; //그리드 로우 첫번째값 셋팅;
        }


        let rowData = gvwDetallGrid.getRowData(nRow);
        if (!_.isEmpty(rowData)) {
            SBUxMethod.set("EMP_CODE", rowData.EMP_CODE); //사번
            SBUxMethod.set("EMP_FULL_NAME", rowData.EMP_FULL_NAME); //이름
        }

        let chdate = gvwDetallGrid.getGridDataAll();
        let totalPay = 0;

        chdate.forEach((item, index2) => {
           totalPay += Number(item.PAY_AMT);
        });

        SBUxMethod.set("PAY_AMT_TOTAL", totalPay);

    }

    // 행 추가
    const fn_btnAdd = function () {
        let rowVal = gvwDetallGrid.getRow();

        const msg = {
            CHK_YN          : 'N',
            DEPT_NAME       : '',
            EMP_CODE        : '',
            POP_BTN         : '',
            EMP_FULL_NAME   : '',
            PAY_AMT         : 0 ,
            TAX_PAY_DATE    : '',
            UPDATE_TIME     : '',
            UPDATE_USERID   : '',
            TXN_ID          : '',


            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwDetallGrid.addRow(true, msg);
        }else{
            gvwDetallGrid.insertRow(rowVal,'below', msg);
        }

    }

    // 행삭제
    const fn_btnDel = async function () {

        let rowVal = gvwDetallGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {

            gvwDetallGrid.deleteRow(rowVal);

        }

    }

    const fn_gridCopyClear = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').show();
        $('#btmCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = gvwDetallGrid.getGridDataAll();
        _SBGrid.destroy('gvwDetallGrid');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createDetallGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').show();

        let datas = gvwDetallGrid.getGridDataAll();
        _SBGrid.destroy('gvwDetallGrid');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createDetallGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btmCopyClear').show();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').hide();

        let datas = gvwDetallGrid.getGridDataAll();
        _SBGrid.destroy('gvwDetallGrid');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createDetallGrid(clear, datas);
    }

    const fn_btnApply = async function () { /*수당기준 적용*/

        let SITE_CODE       = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_YYYYMM      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE        = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_ITEM_CODE   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE")); //급여항목코드
        /*let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사번 디테일 그리드에도 있음*/
        let EMP_FULL_NAME   = gfnma_nvl(SBUxMethod.get("EMP_FULL_NAME")); //이름 디테일 그리드에도 있음
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역

        /*if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }

        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }*/

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_SITE_CODE: ''
            , V_P_PAY_YYYYMM: PAY_YYYYMM
            , V_P_PAY_TYPE: PAY_TYPE
            , V_P_PAY_ITEM_CODE: PAY_ITEM_CODE
            , V_P_EMP_CODE: ''
            , V_P_PAY_AMT: 0
            , V_P_TAX_PAY_DATE: ''
            , V_P_MEMO: ''
            , V_P_TXN_ID: 0

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp2200S2.do", {
            getType: 'json',
            workType: 'APPLY',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
                fn_search(/*tabId*/);
            } else {
                alert(data.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_exportData = function () {

        if(gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?")){

            let PAY_ITEM_NAME = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME")); //급여항목명

            const msg = {
                arrRemoveCols   : [0,3],
                combolabel      : false,
                sheetName       : "급여 변동항목 등록_"+PAY_ITEM_NAME
            }

            gvwDetallGrid.exportData("xlsx","급여 변동항목 등록_"+PAY_ITEM_NAME,true,msg);
        }
        //gvwDetallGrid.exportData("xlsx",'급여 변동항목 등록_복지포인트정산 [호환모드]', true , true);

    }

    const fn_importExcelData = function (e){

        SBUxMethod.openModal('modal-excel');
        /*fn_createGridGdsPopup();*/
        jsonDetallList = 0;
        gvwDetallGrid.rebuild();

        gvwDetallGrid.importExcelData(e);
    }
    const fn_uld = async function() {
        /*let itemCd = SBUxMethod.get("srch-slt-itemCd");

        if (gfn_isEmpty(itemCd)) {
            gfn_comAlert("W0001", "품목");				//	W0002	{0}을/를 선택하세요.
            return;
        }
*/
       /* document.querySelector("#btnFileUpload").value = "";
        $("#btnFileUpload").click();*/

        document.querySelector("#excelFile2").value = "";
        $('#excelFile2').click();

    }


    //저장
    const fn_save = async function () {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let listData = [];
            listData =  await getParamFormS1();

            if (_.isEmpty(listData) == false) {

                const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp2200S1.do", {listData: listData});
                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {

                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }else{
                            gfn_comAlert("I0001");
                            fn_search();
                        }

                    } else {
                        alert(data.resultMessage);
                    }
                } catch (e) {
                    if (!(e instanceof Error)) {
                        e = new Error(e);
                    }
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                }
            }
        }
    }

    const getParamFormS1 = async function(){

        let SITE_CODE       = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_YYYYMM      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE        = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));

        let PAY_ITEM_CODE   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));//급여항목코드
        let PAY_ITEM_NAME   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME"));//급여항목명
        let ENTRY_DEPT_CODE = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_CODE"));//입력부서
        let ENTRY_DEPT_NAME = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_NAME"));//입력부서
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE"));//사번
        let EMP_FULL_NAME   = gfnma_nvl(SBUxMethod.get("EMP_CODE"));//이름

        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }

        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }


        let updatedData = gvwDetallGrid.getUpdateData(true, 'all');

        let returnData = [];

        if (_.isEmpty(updatedData) == false) {

            updatedData.forEach((item, index) => {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedApcCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        , V_P_SITE_CODE     : SITE_CODE
                        , V_P_PAY_YYYYMM    : PAY_YYYYMM
                        , V_P_PAY_TYPE      : PAY_TYPE
                        , V_P_PAY_ITEM_CODE : PAY_ITEM_CODE
                        , V_P_EMP_CODE      : item.data.EMP_CODE
                        , V_P_PAY_AMT       : item.data.PAY_AMT
                        , V_P_TAX_PAY_DATE  : item.data.TAX_PAY_DATE
                        , V_P_MEMO          : item.data.MEMO
                        , V_P_TXN_ID        : item.data.TXN_ID

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }
                returnData.push(param);
            });
        }
        return  returnData;

    }

    const getParamForm = async function(typeData){

        let SITE_CODE       = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_YYYYMM      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE        = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));

        let PAY_ITEM_CODE   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));//급여항목코드
        let PAY_ITEM_NAME   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME"));//급여항목명
        let ENTRY_DEPT_CODE = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_CODE"));//입력부서
        let ENTRY_DEPT_NAME = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_NAME"));//입력부서
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE"));//사번
        let EMP_FULL_NAME   = gfnma_nvl(SBUxMethod.get("EMP_CODE"));//이름


        let strtxn_id;
        let stremp_code;
        let strpay_amt;
        let strtax_pay_date;
        let strmemo;

        let updateData

        if (typeData =='u'){
            updateData =gvwDetallGrid.getGridDataAll();
        }else if (typeData =='d'){
            updateData =gvwDetallGrid.getUpdateData(true, 'd');
        }

        updateData.forEach((item, index) => {

            if (index == 0){

                strtxn_id = index.toString();
                stremp_code = item.EMP_CODE;
                strpay_amt = item.PAY_AMT;
                strtax_pay_date = item.TAX_PAY_DATE;
                strmemo = item.MEMO;

            }else{

                strtxn_id += '|' + index.toString();
                stremp_code += '|' + item.EMP_CODE;
                strpay_amt += '|' + item.PAY_AMT;
                strtax_pay_date += '|' + item.TAX_PAY_DATE;
                strmemo += '|' + item.MEMO;

            }

        });


        let paramObj = {

            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_PAY_YYYYMM     : PAY_YYYYMM
            ,V_P_PAY_TYPE       : PAY_TYPE
            ,V_P_PAY_ITEM_CODE  : PAY_ITEM_CODE
            ,V_P_TXN_ID         : strtxn_id
            ,V_P_EMP_CODE       : stremp_code
            ,V_P_PAY_AMT        : strpay_amt
            ,V_P_TAX_PAY_DATE   : strtax_pay_date
            ,V_P_MEMO           : strmemo

            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        }
        return paramObj;
    }

    const fn_delete = async function() {

        if (gfn_comConfirm("Q0001", "삭제")) {

            let SITE_CODE       = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
            let PAY_YYYYMM      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
            let PAY_TYPE        = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
            let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));

            let PAY_ITEM_CODE   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));//급여항목코드
            let PAY_ITEM_NAME   = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME"));//급여항목명
            let ENTRY_DEPT_CODE = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_CODE"));//입력부서
            let ENTRY_DEPT_NAME = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_NAME"));//입력부서
            let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE"));//사번
            let EMP_FULL_NAME   = gfnma_nvl(SBUxMethod.get("EMP_CODE"));//이름

            if (!PAY_YYYYMM) {
                gfn_comAlert("W0002", "귀속년월");
                return;
            }

            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }

            let strtxn_id       = '';
            let stremp_code     = '';
            let strpay_amt      = '';
            let strtax_pay_date = '';
            let strmemo         = '';


            let detallGridData = gvwDetallGrid.getGridDataAll();

            detallGridData.forEach((item, index) => {

                if (item.CHK_YN == 'Y' && item.PAY_AMT != '')
                {
                    strtxn_id       += item.TXN_ID          + "|";
                    stremp_code     += item.EMP_CODE        + "|";
                    strpay_amt      += item.PAY_AMT         + "|";
                    strtax_pay_date += item.TAX_PAY_DATE    + "|";
                    strmemo         += item.MEMO            + "|";
                }
            });

            if (strtxn_id != '')
            {
                strtxn_id       = strtxn_id.slice(0, strtxn_id.Length - 1);
                stremp_code     = stremp_code.Substring(0, stremp_code.Length - 1);
                strpay_amt      = strpay_amt.Substring(0, strpay_amt.Length - 1);
                strtax_pay_date = strtax_pay_date.Substring(0, strtax_pay_date.Length - 1);
                strmemo         = strmemo.Substring(0, strmemo.Length - 1);
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN			: ''
                ,V_P_LANG_ID				: ''
                ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                ,V_P_SITE_CODE              : SITE_CODE
                ,V_P_PAY_YYYYMM             : PAY_YYYYMM
                ,V_P_PAY_TYPE               : PAY_TYPE
                ,V_P_PAY_ITEM_CODE          : PAY_ITEM_CODE
                ,V_P_TXN_ID                 : strtxn_id
                ,V_P_EMP_CODE               : stremp_code
                ,V_P_PAY_AMT                : strpay_amt
                ,V_P_TAX_PAY_DATE           : strtax_pay_date
                ,V_P_MEMO                   : strmemo

                ,V_P_FORM_ID				: p_formId
                ,V_P_MENU_ID				: p_menuId
                ,V_P_PROC_ID				: ''
                ,V_P_USERID					: ''
                ,V_P_PC						: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp2200.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if(data.resultMessage){
                        alert(data.resultMessage);
                    }
                    fn_search();
                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }


    //급여변동항목 등록 그리드 변경
    async function gridValueChanged() {

        var nCol = gvwDetallGrid.getCol();

        //특정 열 부터 이벤트 적용
        if (nCol == -1) {
            return;
        }
        var nRow = gvwDetallGrid.getRow();
        if (nRow == -1) {
            return;
        }

        var rowData = gvwDetallGrid.getRowData(nRow);

        if (_.isEmpty(rowData) == false){

            if (gvwDetallGrid.getRefOfCol(nCol) == "PAY_AMT" || gvwDetallGrid.getRefOfCol(nCol) == "MEMO")
            {
                if (rowData.CHK_YN == 'N')
                {
                    gvwDetallGrid.setCellData(nRow, 0, 'Y', true, true);
                    /*rowData['CHK_YN'] = 'Y'*/
                    /*gvwDetail.SetValue(e.RowHandle, "chk_yn", "Y");*/
                }
            }

            let chkdata = gvwDetallGrid.getGridDataAll();
        }



        /*if (e.RowHandle < 0)
            return;

        if (e.Column.FieldName == "pay_amt" || e.Column.FieldName == "memo")
        {
            if (gvwDetail.GetValue(e.RowHandle, "chk_yn").ToString() == "N")
            {
                gvwDetail.SetValue(e.RowHandle, "chk_yn", "Y");
            }
        }*/
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
