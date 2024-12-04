<%
    /**
     * @Class Name 		: fig3100.jsp
     * @Description 	: 전자세금계산서 관리(매입) 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.08.05
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.08.05   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 전자세금계산서 관리(매입)</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnXml" name="btnXml" uitype="normal" class="btn btn-sm btn-outline-danger" text="파일등록(XML)" onclick="$('#xmlFile').click()"></sbux-button>
                <sbux-button id="btndisconnection" name="btndisconnection" uitype="normal" text="전표연결끊기" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btndisconnection"></sbux-button>
                <sbux-button id="btnUpdate" name="btnUpdate" uitype="normal" text="정보갱신" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnUpdate"></sbux-button>
                <sbux-button id="btnImport" name="btnImport" uitype="normal" text="불러오기" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnImport"></sbux-button>
                <sbux-button id="btnExcelUpload" name="btnExcelUpload" uitype="normal" class="btn btn-sm btn-outline-danger" text="전자세금계산서" onclick="$('#excelFile').click()"></sbux-button>
                <sbux-button id="btnUpload2" name="btnUpload2" uitype="normal" class="btn btn-sm btn-outline-danger" text="전자계산서" onclick="$('#excelFile2').click()"></sbux-button>

            </div>
        </div>

        <div class="box-body">

            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table id="dataArea1" class="table table-bordered tbl_fixed table-search-ma">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">

                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">

                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">

                        <col style="width: 8%">
                        <col style="width: 7%">
                        <col style="width: 1%">
                        <col style="width: 7%">
                        <col style="width: 2%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg_search">년월</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="SRCH_YMDPERIOD_YYYYMM"
                                    name="SRCH_YMDPERIOD_YYYYMM"
                                    uitype="popup"
                                    datepicker-mode="month"
                                    date-format="yyyy-mm"
                                    class="table-datepicker-ma inpt_data_reqed"
                                    required
                                    onchange="fn_payDate"
                            ></sbux-datepicker>
                        </td>
                        <td colspan="3" style="border-right: hidden;"></td>
                        <th scope="row" class="th_bg_search">APC명</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left"
                                        class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button"
                                        id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE"
                                     style="width:600px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td style="border-right: hidden;"></td>
                        <th scope="row" class="th_bg_search">조회구분</th>
                        <td colspan="4" class="td_input inpt_data_reqed">
                            <sbux-radio id="ALL" name="SRCH_RIDGUBUN" uitype="normal"
                                        text="전체" value="99" checked>
                            </sbux-radio>
                            <sbux-radio id="TAX" name="SRCH_RIDGUBUN" uitype="normal"
                                        text="세금계산서" value="20">
                            </sbux-radio>
                            <sbux-radio id="BILL" name="SRCH_RIDGUBUN" uitype="normal"
                                        text="계산서" value="10">
                            </sbux-radio>
                        </td>
                        <th scope="row" class="th_bg_search">사업자번호</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_CS_BIZ_REGNO"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td style="border-right: hidden;"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">작성일자</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="SRCH_DATE_FR"
                                    name="SRCH_DATE_FR"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma inpt_data_reqed"
                            ></sbux-datepicker>
                        </td>
                        <td>
                            <p>~</p>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="SRCH_DATE_TO"
                                    name="SRCH_DATE_TO"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma inpt_data_reqed"
                            ></sbux-datepicker>
                        </td>
                        <td style="border-right: hidden;"></td>
                        <th scope="row" class="th_bg_search">상호</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_CS_NAME"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td style="border-right: hidden;"></td>
                        <th scope="row" class="th_bg_search">관련부서</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_DEPT_CODE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-input
                            <%-- uitype="hidden"--%>
                                    uitype="text"
                                    id="SRCH_DEPT_NAME"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td <%--colspan="2"--%> class="td_input">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_compopup1"
                                    text="…"
                            ></sbux-button>
                        </td>
                        <th scope="row" class="th_bg_search">사원</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_EMP_CODE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-input
                            <%-- uitype="hidden"--%>
                                    uitype="text"
                                    id="SRCH_EMP_NAME"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_compopup2"
                                    text="…"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_TXTAMT"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_TXTAPPROVAL_NO"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="SRCH_NUMROW_CNT"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>






            <%--<table id="dataArea1" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 1%">
                    <col style="width: 6%">
                    <col style="width: 2%">

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
                    <th scope="row" class="th_bg">년월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_YMDPERIOD_YYYYMM"
                                name="SRCH_YMDPERIOD_YYYYMM"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="form-control input-sm input-sm-ast inpt_data_reqed"
                                required
                                onchange="fn_payDate"
                        ></sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">APC명</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td colspan="2" style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">조회구분</th>
                    <td colspan="3" class="td_input inpt_data_reqed">
                        <sbux-radio id="ALL" name="SRCH_RIDGUBUN" uitype="normal"
                                    text="전체" value="99" checked>
                        </sbux-radio>
                        <sbux-radio id="TAX" name="SRCH_RIDGUBUN" uitype="normal"
                                    text="세금계산서" value="20">
                        </sbux-radio>
                        <sbux-radio id="BILL" name="SRCH_RIDGUBUN" uitype="normal"
                                    text="계산서" value="10">
                        </sbux-radio>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">작성일자</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_DATE_FR"
                                name="SRCH_DATE_FR"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm input-sm-ast inpt_data_reqed"
                                ></sbux-datepicker>
                    </td>
                    <td>
                        <p>~</p>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_DATE_TO"
                                name="SRCH_DATE_TO"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm input-sm-ast inpt_data_reqed"
                                ></sbux-datepicker>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_CS_BIZ_REGNO"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">상호</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_CS_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">관련부서</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_DEPT_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-input
                        &lt;%&ndash; uitype="hidden"&ndash;%&gt;
                                uitype="text"
                                id="SRCH_DEPT_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td &lt;%&ndash;colspan="2"&ndash;%&gt; class="td_input" >
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                        &lt;%&ndash; uitype="hidden"&ndash;%&gt;
                                uitype="text"
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="5" class="td_input" >
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                </tr>
                <tr style="display: none">
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_TXTAMT"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_TXTAPPROVAL_NO"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_NUMROW_CNT"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>--%>

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>조회 결과</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
                <div class="ad_tbl_toplist">
                    <sbux-button
                            id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
                            onclick="fn_delRow" style="float: right; margin-right: 3px;"></sbux-button>
                    <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger"
                                 onclick="fn_addRow" style="float: right; margin-right: 3px;; "></sbux-button>
                    <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="제외처리 취소" class="btn btn-sm btn-outline-danger"
                                 onclick="fn_btnExclusion('CANCEL')" style="float: right; margin-right: 3px;"></sbux-button>
                    <sbux-button id="btnExclusion" name="btnExclusion" uitype="normal" text="제외처리" class="btn btn-sm btn-outline-danger"
                                 onclick="fn_btnExclusion('EXCEPT')" style="float: right; margin-right: 3px;"></sbux-button>
                    <sbux-input id="EXCEPT_REASON" uitype="text" placeholder="" class="form-control input-sm" style="float: right; margin-right: 5px;"></sbux-input>
                    <div class="dropdown" style="float: right; margin-right: 5px;">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="EXCEPT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="EXCEPT_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                    <span style="float: right; padding-top: 7px;">제외사유</span>
                </div>
            </div>
            <div>
                <div id="sb-area-gvwList" style="height:300px; width:100%;"></div>
            </div>

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>품목</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-gvwItem" style="height:200px; width:100%;"></div>
            </div>
            <input type="file" name="file" id="xmlFile" accept="text/xml" style="display: none;" multiple>
            <input type="file" name="file" id="excelFile" accept=".xls,.xlsx" style="display: none;">
            <input type="file" name="file" id="excelFile2" accept=".xls,.xlsx" style="display: none;">
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
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
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    //-----------------------------------------------------------

    //grid 초기화
    var gvwListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwItemGrid;
    var jsonItemList = [];

    /******* C# 코드내용 그대로 처리 ******/
    let strIfType = '1';  //EXCEL FILE, 2: XML
    let newAddOn = false;
    let strjob_name = '';

    var jsonSiteCode = []; //사업장 ( L_ORG001 )srch-site_code, 	SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )srch-pay_area_type

    var jsonExceptCode = []; // 제외코드
    var jsonEinvoiceCategory = []; // 전자세금계산서분류
    var jsonEinvoiceType = []; // 전자세금계산서종류
    var jsonMatchMethod = []; // 정발행/역발행
    var jsonReceiptOrBill = []; // 영수/청구 구분
    var jsonCostCenterCode = []; // 원가중심점코드
    var jsonEmpState = []; // 재직구분
    var jsonDeptCode = []; // 부서코드= DEPT_CODE
    var jsonProjectCode = []; // 프로젝트= PROJECT_CODE
    var jsonAccount = []; // 계정과목= ACCOUNT_CODE

    const fn_initSBSelect = async function() {
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);

        let rst = await Promise.all([
            // APC명
            gfnma_multiSelectInit({
                target			: ['#SRCH_FI_ORG_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM022'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'FI_ORG_CODE'
                ,colLabel		: 'FI_ORG_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'FI_ORG_CODE', 		width:'300px',  	style:'text-align:left'},
                    {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'300px',  	style:'text-align:left'}
                ]
            }),
            // 제외사유
            gfnma_setComSelect(['gvwList'], jsonExceptCode, 'L_FIM251', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CODE', 'NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#EXCEPT_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM251'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'CODE'
                ,colLabel		: 'NAME'
                ,columns		:[
                    {caption: "제외사유",		ref: 'CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "제외내용", 		ref: 'NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 전자세금계산서분류
            gfnma_setComSelect(['gvwListGrid'], jsonEinvoiceCategory, 'L_FIG3100', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전자세금계산서종류
            gfnma_setComSelect(['gvwListGrid'], jsonEinvoiceType, 'L_FIG3100_TYPE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 정발행/역발행
            gfnma_setComSelect(['gvwListGrid'], jsonMatchMethod, 'L_FIT005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 영수/청구 구분
            gfnma_setComSelect(['gvwListGrid'], jsonReceiptOrBill, 'L_FIT042', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 원가중심점코드
            gfnma_setComSelect(['gvwItemGrid'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['gvwListGrid'], jsonEmpState, 'P_HRI001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //부서코드
            gfnma_setComSelect(['gvwItemGrid'], jsonDeptCode, 'P_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            //프로젝트코드
            gfnma_setComSelect(['gvwItemGrid'], jsonProjectCode, 'P_COM028', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PROJECT_CODE', 'PROJECT_NAME', 'Y', ''),
            //계정과목
            gfnma_setComSelect(['gvwItemGrid'], jsonAccount, 'P_FIM045', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACCOUNT_CODE', 'ACCOUNT_NAME', 'Y', ''),
        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
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
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });

    }

    /**
     * 공급사코드 오픈
     */
    const fn_compopup3 = function(row, col) {

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        SBUxMethod.openModal('modal-compopup1');


        var searchText 		= "";
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND a.CS_CODE LIKE '%" + replaceText0 + "%' AND a.CS_NAME LIKE '%" + replaceText1 + "%' AND a.BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드"  , 	"거래처명",  "사업자번호" ]
            ,searchInputFields		: ["CS_CODE"   , 	"CS_NAME",  "BIZ_REGNO"]
            ,searchInputValues		: [""          , 	searchText, ""         ]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호" , "대표자"     ,"업태"          ,"종목"      ,"주소"    ,"전화"  ,"팩스"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME","BIZ_CATEGORY" ,"BIZ_ITEMS","ADDRESS","TEL"   ,"FAX"]
            ,tableColumnWidths		: ["100px"    , "130px" , "100px"    , "120px"     ,"120px"        ,"100px"    ,"200px"  ,"100px" ,"100px"]
            ,itemSelectEvent		: function (data){
                gvwListGrid.setCellData(row, gvwListGrid.getColRef('PO_DOC_NO'), data['CS_CODE']);
                gvwListGrid.setCellData(row, gvwListGrid.getColRef('SELLER_NAME'), data['CS_NAME']);
                gvwListGrid.setCellData(row, gvwListGrid.getColRef('SELLER_OWNER'), data['CHIEF_NAME']);
                gvwListGrid.setCellData(row, gvwListGrid.getColRef('SELLER_ADDRESS'), data['ADDRESS']);
            }
        });
    }

    var fn_findEmpCodeForGvwList = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: ''
            ,searchCaptions			: ["부서",		"사원", 		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
            ,searchInputValues		: ["", 			searchText,		""]
            ,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                gvwListGrid.setCellData(row, col, data.EMP_CODE);
                gvwListGrid.setCellData(row, (col+1), data.EMP_NAME);
            },
        });
    }

    //품목 그리드 부서 팝업
    var fn_compopup4 = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                gvwItemGrid.setCellData(row, gvwItemGrid.getColRef('DEPT_NAME'), data['DEPT_NAME']);
                gvwItemGrid.setCellData(row, gvwItemGrid.getColRef('DEPT_CODE'), data['DEPT_CODE']);
            },
        });
    }

    var fn_findEmpCodeForGvwList = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: ''
            ,searchCaptions			: ["부서",		"사원", 		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
            ,searchInputValues		: ["", 			searchText,		""]
            ,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                gvwListGrid.setCellData(row, col, data.EMP_CODE);
                gvwListGrid.setCellData(row, (col+1), data.EMP_NAME);
            },
        });
    }

    //품목 그리드 부서 팝업
    /*var fn_compopup4 = function(row, col) {
        var searchText 		= "";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
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
                NationInGrid.setCellData(row, gvwItemGrid.getColRef('DEPT_NAME'), data['DEPT_NAME']);
                NationInGrid.setCellData(row, gvwItemGrid.getColRef('DEPT_CODE'), data['DEPT_CODE']);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }*/

    var fn_compopup5 = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
        SBUxMethod.openModal('modal-compopup1');

        var strWhereClause 	= "AND FI_ORG_CODE = '" + gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE")) + "'" ;

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM028'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["프로젝트코드",		"프로젝트명"]
            ,searchInputFields		: ["PROJECT_CODE",	"PROJECT_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["프로젝트코드", "프로젝트명"]
            ,tableColumnNames		: ["PROJECT_CODE", "PROJECT_NAME"]
            ,tableColumnWidths		: ["150px", "250px"]
            ,itemSelectEvent		: function (data){
                gvwItemGrid.setCellData(row, gvwItemGrid.getColRef('PROJECT_CODE'), data.PROJECT_CODE);
                gvwItemGrid.setCellData(row, gvwItemGrid.getColRef('PROJECT_NAME'), data.PROJECT_NAME);
            },
        });
    }

    var fn_compopup6 = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        var addParams = ['NULL'];
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIM045'
            ,popupType				: 'B'
            ,whereClause			: addParams
            ,searchCaptions			: ["코드", 		"코드명"]
            ,searchInputFields		: ["V_P_ACCOUNT_CODE", 	"V_P_ACCOUNT_NAME"]
            ,searchInputValues		: ["", 				searchText]
            ,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
            ,height					: '400px'
            ,tableHeader			: ["계정코드",		"계정명", 		"계정명(한글)"]
            ,tableColumnNames		: ["ACCOUNT_CODE",	"ACCOUNT_NAME", 	"ACCOUNT_NAME_CHN"]
            ,tableColumnWidths		: ["100px", 		"100px", 		"200px"]
            ,itemSelectEvent		: function (data){
                gvwItemGrid.setCellData(row, gvwItemGrid.getColRef('ACCOUNT_CODE'), data.ACCOUNT_CODE);
                gvwItemGrid.setCellData(row, gvwItemGrid.getColRef('ACCOUNT_NAME'), data.ACCOUNT_NAME);
            },
        });
    }

    var fn_compopup7 = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: ''
            ,searchCaptions			: ["부서",		"사원", 		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
            ,searchInputValues		: ["", 			searchText,		""]
            ,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px"    , "80px"    , "120px"     , "120px"    , "80px"]
            ,itemSelectEvent		: function (data){
                gvwListGrid.setCellData(row, gvwListGrid.getColRef('ACCOUNT_EMP_CODE'), data.EMP_CODE);
                gvwListGrid.setCellData(row, gvwListGrid.getColRef('ACCOUNT_EMP_NAME'), data.EMP_NAME);
            },
        });
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

        document.getElementById('xmlFile').addEventListener('change', function(event) {
            if(!window.FileReader) return;

            var files = event.target.files;
            var promises = Array.from(files).map(file => {
                return new Promise((resolve, reject) => {
                    var reader = new FileReader();

                    reader.addEventListener("load", () => {
                        fn_uploadXml(reader.result);
                        resolve();
                    }, false);

                    reader.addEventListener("error", reject, false);

                    reader.readAsText(file);
                });
            });

            Promise.all(promises).then(() => {
                fn_insertXmlData();
            }).catch(error => {
                console.error("Error processing files:", error);
            });
        });

        document.getElementById('excelFile').addEventListener('change', function(event) {
            if(!window.FileReader) return;

            if (event.target.files[0].name.substring(0, 9) != "매입전자세금계산서") {
                gfn_comAlert("E0000", "매입전자세금계산서만 가능합니다. 파일명은 '매입전자세금계산서..' 로 시작해야합니다. 파일명을 확인해주세요")
                return;
            }

            var reader = new FileReader();
            let strmindate = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR"));
            let strmaxdate = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));
            let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));

            reader.addEventListener(
                "load",
                () => {
                    let workBook = XLSX.read(reader.result, { type: 'binary' });
                    workBook.SheetNames.forEach(function (sheetName) {
                        if(sheetName == "세금계산서") {
                            let list = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 6, header: [
                                    "WRITE_DATE",
                                    "APPROVAL_NO",
                                    "ISSUE_DATE",
                                    "SEND_DATE",
                                    "SELLER_REG_NO",
                                    "SELLER_SUB_REG_NO",
                                    "SELLER_NAME",
                                    "SELLER_OWNER",
                                    "SELLER_ADDRESS",
                                    "BUYER_REG_NO",
                                    "BUYER_SUB_REG_NO",
                                    "BUYER_NAME",
                                    "BUYER_OWNER",
                                    "BUYER_ADDRESS",
                                    "TOTAL_AMT",
                                    "TOTAL_VAT_AMT",
                                    "TOTAL_TAXABLE_AMT",
                                    "EINVOICE_CATEGORY",
                                    "EINVOICE_TYPE",
                                    "ISSUE_TYPE",
                                    "DESCRIPTION",
                                    "RECEIPT_OR_BILL",
                                    "SELLER_EMAIL",
                                    "BUYER_EMAIL1",
                                    "BUYER_EMAIL2",
                                    "TXN_DATE",
                                    "ITEM_NAME",
                                    "ITEM_SPEC",
                                    "ITEM_QTY",
                                    "ITEM_UNIT_PRICE",
                                    "ITEM_VAT_AMT",
                                    "ITEM_TAXABLE_AMT",
                                    "ITEM_DESC"
                                ]});


                            list.forEach((item, index) => {
                                if(gfn_nvl(item.APPROVAL_NO) != "") {
                                    if (parseInt(item.ISSUE_DATE.replace(/-/gi, "")) < parseInt(strmindate)) {
                                        strmindate = item.ISSUE_DATE.replace(/-/gi, "");
                                    }

                                    if (parseInt(item.ISSUE_DATE.replace(/-/gi, "")) > parseInt(strmaxdate)) {
                                        strmaxdate = item.ISSUE_DATE.replace(/-/gi, "");
                                    }

                                    item["WRITE_DATE"] = item.WRITE_DATE.replace(/-/gi, "");
                                    item["ISSUE_DATE"] = item.ISSUE_DATE.replace(/-/gi, "");
                                    item["SEND_DATE"] = item.SEND_DATE.replace(/-/gi, "");
                                    item["TXN_DATE"] = item.TXN_DATE.replace(/-/gi, "");
                                    item["SELLER_ADDRESS"] = item.SELLER_ADDRESS
                                    item["BUYER_ADDRESS"] = item.BUYER_ADDRESS

                                    item["OTHER_DESC"] = "";
                                    item["ACCOUNT_EMP_CODE"] = "";
                                    item["FI_ORG_CODE"] = FI_ORG_CODE;
                                    item["MATCH_METHOD"] = "";
                                    item["SELLER_BIZ_CATEGORY"] = "";
                                    item["SELLER_BIZ_ITEM"] = "";
                                    item["BUYER_BIZ_CATEGORY"] = "";
                                    item["BUYER_BIZ_ITEM"] = "";
                                    item["BUYER_BIZ_TYPE"] = "";
                                    item["DOC_ID"] = "";

                                    gvwListGrid.addRow(true, item);
                                }
                            });
                        }

                        if(sheetName == "품목") {
                            let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 5, header: [
                                    "APPROVAL_NO",
                                    "SEQ",
                                    "SELLER_REG_NO",
                                    "BUYER_REG_NO",
                                    "WRITE_DATE",
                                    "ITEM_NAME",
                                    "ITEM_SPEC",
                                    "ITEM_QTY",
                                    "ITEM_UNIT_PRICE",
                                    "ITEM_TAXABLE_AMT",
                                    "ITEM_VAT_AMT",
                                    "ITEM_DESC"
                                ]});

                            rows.forEach((item, index) => {
                                item["COST_CENTER_CODE"] = "";
                                item["ACCOUNT_CODE"] = "";
                                item["DEPT_CODE"] = "";
                                item["PROJECT_CODE"] = "";

                                gvwItemGrid.addRow(true, item);
                            });
                        }
                    })
                    fn_excelUpload();
                },
                false,
            );
            reader.readAsBinaryString(event.target.files[0]);
        });

        document.getElementById('excelFile2').addEventListener('change', function(event) {
            if(!window.FileReader) return;

            if (event.target.files[0].name.substring(0, 7) != "매입전자계산서") {
                gfn_comAlert("E0000", "매입전자계산서만 가능합니다. 파일명은 '매입전자계산서..' 로 시작해야합니다. 파일명을 확인해주세요")
                return;
            }

            var reader = new FileReader();
            let strmindate = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR"));
            let strmaxdate = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));
            let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));

            reader.addEventListener(
                "load",
                () => {
                    let workBook = XLSX.read(reader.result, { type: 'binary' });
                    workBook.SheetNames.forEach(function (sheetName) {
                        if(sheetName == "세금계산서") {
                            let list = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 6, header: [
                                    "WRITE_DATE",
                                    "APPROVAL_NO",
                                    "ISSUE_DATE",
                                    "SEND_DATE",
                                    "SELLER_REG_NO",
                                    "SELLER_SUB_REG_NO",
                                    "SELLER_NAME",
                                    "SELLER_OWNER",
                                    "SELLER_ADDRESS",
                                    "BUYER_REG_NO",
                                    "BUYER_SUB_REG_NO",
                                    "BUYER_NAME",
                                    "BUYER_OWNER",
                                    "BUYER_ADDRESS",
                                    "TOTAL_AMT",
                                    "TOTAL_VAT_AMT",
                                    "EINVOICE_CATEGORY",
                                    "EINVOICE_TYPE",
                                    "ISSUE_TYPE",
                                    "DESCRIPTION",
                                    "RECEIPT_OR_BILL",
                                    "SELLER_EMAIL",
                                    "BUYER_EMAIL1",
                                    "BUYER_EMAIL2",
                                    "TXN_DATE",
                                    "ITEM_NAME",
                                    "ITEM_SPEC",
                                    "ITEM_QTY",
                                    "ITEM_UNIT_PRICE",
                                    "ITEM_TAXABLE_AMT",
                                    "ITEM_VAT_AMT",
                                    "ITEM_DESC"
                                ]});

                            list.forEach((item, index) => {
                                if(gfn_nvl(item.APPROVAL_NO) != "") {
                                    if (parseInt(item.ISSUE_DATE.replace(/-/gi, "")) < parseInt(strmindate)) {
                                        strmindate = item.ISSUE_DATE.replace(/-/gi, "");
                                    }

                                    if (parseInt(item.ISSUE_DATE.replace(/-/gi, "")) > parseInt(strmaxdate)) {
                                        strmaxdate = item.ISSUE_DATE.replace(/-/gi, "");
                                    }

                                    item["WRITE_DATE"] = item.WRITE_DATE.replace(/-/gi, "");
                                    item["ISSUE_DATE"] = item.ISSUE_DATE.replace(/-/gi, "");
                                    item["SEND_DATE"] = item.SEND_DATE.replace(/-/gi, "");
                                    item["TXN_DATE"] = item.TXN_DATE.replace(/-/gi, "");
                                    item["SELLER_ADDRESS"] = item.SELLER_ADDRESS
                                    item["BUYER_ADDRESS"] = item.BUYER_ADDRESS

                                    item["TOTAL_TAXABLE_AMT"] = '0';
                                    item["OTHER_DESC"] = "";
                                    item["ACCOUNT_EMP_CODE"] = "";
                                    item["FI_ORG_CODE"] = FI_ORG_CODE;
                                    item["MATCH_METHOD"] = "";
                                    item["SELLER_BIZ_CATEGORY"] = "";
                                    item["SELLER_BIZ_ITEM"] = "";
                                    item["BUYER_BIZ_CATEGORY"] = "";
                                    item["BUYER_BIZ_ITEM"] = "";
                                    item["BUYER_BIZ_TYPE"] = "";
                                    item["DOC_ID"] = "";

                                    gvwListGrid.addRow(true, item);
                                }
                            });
                        }

                        if(sheetName == "품목") {
                            let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 5, header: [
                                    "APPROVAL_NO",
                                    "SEQ",
                                    "SELLER_REG_NO",
                                    "BUYER_REG_NO",
                                    "WRITE_DATE",
                                    "ITEM_NAME",
                                    "ITEM_SPEC",
                                    "ITEM_QTY",
                                    "ITEM_UNIT_PRICE",
                                    "ITEM_TAXABLE_AMT",
                                    "ITEM_VAT_AMT",
                                    "ITEM_DESC"
                                ]});

                            rows.forEach((item, index) => {
                                item["ITEM_QTY"] = gfn_nvl(item.ITEM_QTY) == "" ? '0' : item.ITEM_QTY;
                                item["ITEM_UNIT_PRICE"] = gfn_nvl(item.ITEM_UNIT_PRICE) == "" ? '0' : item.ITEM_UNIT_PRICE;
                                item["ITEM_TAXABLE_AMT"] = gfn_nvl(item.ITEM_TAXABLE_AMT) == "" ? '0' : item.ITEM_TAXABLE_AMT;

                                item["ITEM_VAT_AMT"] = '0';
                                item["COST_CENTER_CODE"] = "";
                                item["ACCOUNT_CODE"] = "";
                                item["DEPT_CODE"] = "";
                                item["PROJECT_CODE"] = "";

                                gvwItemGrid.addRow(true, item);
                            });
                        }
                    })
                    fn_excelUpload()
                },
                false,
            );
            reader.readAsBinaryString(event.target.files[0]);
        });
    });

    const fn_uploadXml = async function (file) {
        let parser = new DOMParser();
        let xml = parser.parseFromString(file, "text/xml");
        let parseXmlForJson = xmlToJson(xml);
        let taxInvoice = parseXmlForJson.TaxInvoice;
        let nodeTaxInvoice = taxInvoice;
        let nodeExchangedDocument = taxInvoice.ExchangedDocument;
        let nodeTaxInvoiceDocument = taxInvoice.TaxInvoiceDocument;
        let nodeInvoicerParty = taxInvoice.TaxInvoiceTradeSettlement.InvoicerParty;
        let nodeInvoiceeParty = taxInvoice.TaxInvoiceTradeSettlement.InvoiceeParty;
        let nodeSpecifiedMonetarySummation = taxInvoice.TaxInvoiceTradeSettlement.SpecifiedMonetarySummation;
        let nodeTaxInvoiceTradeLineItem = taxInvoice.TaxInvoiceTradeLineItem;
        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));

        if (nodeTaxInvoice != null) {
            var rowHeader = {};

            rowHeader["CHECK_YN"] = "N";
            rowHeader["INTERFACED_FLAG"] = "N";
            rowHeader["CS_CODE"] = "";
            rowHeader["CS_CODE_ORG"] = "";
            rowHeader["ACCOUNT_EMP_CODE"] = "";
            rowHeader["DOC_ID"] = null;
            rowHeader["FI_ORG_CODE"] = FI_ORG_CODE;
            rowHeader["NOTE2"] = "";
            rowHeader["MATCH_METHOD"] = "";
            rowHeader["ISSUE_TYPE"] = "";
            rowHeader["SELLER_SUB_REG_NO"] = "";
            rowHeader["BUYER_SUB_REG_NO"] = "";

            //발행일자
            rowHeader["SEND_DATE"] = nodeExchangedDocument["IssueDateTime"].substring(0, 8);

            //세금계산서정보
            let strIssueId = nodeTaxInvoiceDocument["IssueID"];
            rowHeader["APPROVAL_NO"] = strIssueId;
            rowHeader["EINVOICE_CATEGORY"] = nodeTaxInvoiceDocument["TypeCode"];
            rowHeader["EINVOICE_TYPE"] = nodeTaxInvoiceDocument["TypeCode"].substring(2, 4);
            if (gfn_nvl(nodeTaxInvoiceDocument["DescriptionText"]) != "") {
                rowHeader["NOTE1"] = nodeTaxInvoiceDocument["DescriptionText"];
            }
            rowHeader["WRITE_DATE"] = nodeTaxInvoiceDocument["IssueDateTime"];
            rowHeader["ISSUE_DATE"] = nodeTaxInvoiceDocument["IssueDateTime"];
            rowHeader["TXN_DATE"] = nodeTaxInvoiceDocument["IssueDateTime"];
            rowHeader["RECEIPT_OR_BILL"] = nodeTaxInvoiceDocument["PurposeCode"];
            rowHeader["MATCH_METHOD"] = "1";
            rowHeader["ISSUE_TYPE"] = "1";

            //공급하는자
            rowHeader["SELLER_REG_NO"] = nodeInvoicerParty["ID"];
            rowHeader["SELLER_BIZ_CATEGORY"] = nodeInvoicerParty["TypeCode"];
            rowHeader["SELLER_NAME"] = nodeInvoicerParty["NameText"];
            rowHeader["SELLER_BIZ_ITEM"] = nodeInvoicerParty["ClassificationCode"];
            rowHeader["SELLER_OWNER"] = nodeInvoicerParty["SpecifiedPerson"].NameText;
            if (gfn_nvl(nodeInvoicerParty["DefinedContact"]) != "") {
                rowHeader["SELLER_EMAIL"] = nodeInvoicerParty["DefinedContact"].URICommunication;
            }
            rowHeader["SELLER_ADDRESS"] = nodeInvoicerParty["SpecifiedAddress"].replace(/,/gi, "&#44;");

            //공급받는자
            rowHeader["BUYER_REG_NO"] = nodeInvoiceeParty["ID"];
            rowHeader["BUYER_BIZ_CATEGORY"] = nodeInvoiceeParty["TypeCode"];
            rowHeader["BUYER_NAME"] = nodeInvoiceeParty["NameText"];
            rowHeader["BUYER_BIZ_ITEM"] = nodeInvoiceeParty["ClassificationCode"];
            rowHeader["BUYER_BIZ_TYPE"] = nodeInvoiceeParty["SpecifiedOrganization"].BusinessTypeCode;
            rowHeader["BUYER_OWNER"] = nodeInvoiceeParty["SpecifiedPerson"].NameText;
            rowHeader["BUYER_EMAIL1"] = nodeInvoiceeParty["PrimaryDefinedContact"].URICommunication;
            if (gfn_nvl(nodeInvoiceeParty["SecondaryDefinedContact"]) != "") {
                rowHeader["BUYER_EMAIL2"] = nodeInvoiceeParty["SecondaryDefinedContact"].URICommunication;
            }
            if (gfn_nvl(nodeInvoiceeParty["SPECIFIEDADDRESS"]) != "") {
                rowHeader["BUYER_ADDRESS"] = nodeInvoiceeParty["SpecifiedAddress"].LineOneText.replace(/,/gi, "&#44;");
            }

            rowHeader["TOTAL_TAXABLE_AMT"] = gfn_nvl(nodeSpecifiedMonetarySummation["ChargeTotalAmount"]) == "" ? '0' : nodeSpecifiedMonetarySummation["ChargeTotalAmount"];
            rowHeader["TOTAL_VAT_AMT"] = gfn_nvl(nodeSpecifiedMonetarySummation["TaxTotalAmount"]) == "" ? '0' : nodeSpecifiedMonetarySummation["TaxTotalAmount"];
            rowHeader["TOTAL_AMT"] = gfn_nvl(nodeSpecifiedMonetarySummation["GrandTotalAmount"]) == "" ? '0' : nodeSpecifiedMonetarySummation["GrandTotalAmount"];

            gvwListGrid.addRow(true, rowHeader);

            if(Array.isArray(nodeTaxInvoiceTradeLineItem)) {
                nodeTaxInvoiceTradeLineItem.forEach((item, index) => {
                    var rowItem = {};
                    rowItem["APPROVAL_NO"] = strIssueId;
                    rowItem["SEQ"] = item["SequenceNumeric"];
                    rowItem["ITEM_TAXABLE_AMT"] = item["InvoiceAmount"];
                    if (gfn_nvl(item["SecondaryDefinedContact"]) != "") {
                        rowItem["ITEM_QTY"] = item["ChargeableUnitQuantity"];
                    }
                    rowItem["ITEM_NAME"] = item["NameText"];
                    rowItem["TXN_DATE"] = item["PurchaseExpiryDateTime"];
                    rowItem["ITEM_VAT_AMT"] = item["TotalTax"].CalculatedAmount;
                    if (gfn_nvl(item["UnitPrice"]) != "") {
                        rowItem["ITEM_UNIT_PRICE"] = item["UnitPrice"].UnitAmount;
                    }
                    gvwItemGrid.addRow(true, rowItem);
                });
            } else {
                var rowItem = {};
                rowItem["APPROVAL_NO"] = strIssueId;
                rowItem["SEQ"] = nodeTaxInvoiceTradeLineItem["SequenceNumeric"];
                rowItem["ITEM_TAXABLE_AMT"] = nodeTaxInvoiceTradeLineItem["InvoiceAmount"];
                if (gfn_nvl(nodeTaxInvoiceTradeLineItem["SecondaryDefinedContact"]) != "") {
                    rowItem["ITEM_QTY"] = nodeTaxInvoiceTradeLineItem["ChargeableUnitQuantity"];
                }
                rowItem["ITEM_NAME"] = nodeTaxInvoiceTradeLineItem["NameText"];
                rowItem["TXN_DATE"] = nodeTaxInvoiceTradeLineItem["PurchaseExpiryDateTime"];
                if (gfn_nvl(nodeTaxInvoiceTradeLineItem["TotalTax"]) != "") {
                    rowItem["ITEM_VAT_AMT"] = nodeTaxInvoiceTradeLineItem["TotalTax"].CalculatedAmount;
                }
                if (gfn_nvl(nodeTaxInvoiceTradeLineItem["UnitPrice"]) != "") {
                    rowItem["ITEM_UNIT_PRICE"] = nodeTaxInvoiceTradeLineItem["UnitPrice"].UnitAmount;
                }

                gvwItemGrid.addRow(true, rowItem);
            }
        }
    }

    const fn_insertXmlData = async function () {
        let updatedData = gvwListGrid.getUpdateData(true, 'i');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                cv_count : '0',
                getType : 'json',
                rownum: item.rownum,
                workType : 'N1',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_FI_ORG_CODE : gfn_nvl(item.data.FI_ORG_CODE),
                    V_P_WRITE_DATE : gfn_nvl(item.data.WRITE_DATE),
                    V_P_APPROVAL_NO : gfn_nvl(item.data.APPROVAL_NO),
                    V_P_ISSUE_DATE : gfn_nvl(item.data.ISSUE_DATE),
                    V_P_SEND_DATE : gfn_nvl(item.data.SEND_DATE),
                    V_P_SELLER_REG_NO : gfn_nvl(item.data.SELLER_REG_NO.replace(/-/gi, "")),
                    V_P_SELLER_SUB_REG_NO : gfn_nvl(item.data.SELLER_SUB_REG_NO),
                    V_P_CS_CODE : gfn_nvl(item.data.CS_CODE),
                    V_P_SELLER_NAME : gfn_nvl(item.data.SELLER_NAME),
                    V_P_SELLER_OWNER : gfn_nvl(item.data.SELLER_OWNER),
                    V_P_SELLER_ADDRESS : gfn_nvl(item.data.SELLER_ADDRESS),
                    V_P_SELLER_BIZ_CATEGORY : gfn_nvl(item.data.SELLER_BIZ_CATEGORY),
                    V_P_SELLER_BIZ_ITEM : gfn_nvl(item.data.SELLER_BIZ_ITEM),
                    V_P_BUYER_REG_NO : gfn_nvl(item.data.BUYER_REG_NO.replace(/-/gi, "")),
                    V_P_BUYER_SUB_REG_NO : gfn_nvl(item.data.BUYER_SUB_REG_NO),
                    V_P_BUYER_NAME : gfn_nvl(item.data.BUYER_NAME),
                    V_P_BUYER_OWNER : gfn_nvl(item.data.BUYER_OWNER),
                    V_P_BUYER_ADDRESS : gfn_nvl(item.data.BUYER_ADDRESS),
                    V_P_BUYER_BIZ_CATEGORY : gfn_nvl(item.data.BUYER_BIZ_CATEGORY),
                    V_P_BUYER_BIZ_ITEM : gfn_nvl(item.data.BUYER_BIZ_ITEM),
                    V_P_BUYER_BIZ_TYPE : gfn_nvl(item.data.BUYER_BIZ_TYPE),
                    V_P_TOTAL_AMT : parseInt(gfn_nvl(item.data.TOTAL_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_AMT)),
                    V_P_TOTAL_TAXABLE_AMT : parseInt(gfn_nvl(item.data.TOTAL_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_TAXABLE_AMT)),
                    V_P_TOTAL_VAT_AMT : parseInt(gfn_nvl(item.data.TOTAL_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.TOTAL_VAT_AMT)),
                    V_P_EINVOICE_CATEGORY : gfn_nvl(item.data.EINVOICE_CATEGORY),
                    V_P_EINVOICE_TYPE : gfn_nvl(item.data.EINVOICE_TYPE),
                    V_P_MATCH_METHOD : gfn_nvl(item.data.MATCH_METHOD),
                    V_P_ISSUE_TYPE : gfn_nvl(item.data.ISSUE_TYPE),
                    V_P_NOTE1 : gfn_nvl(item.data.NOTE1),
                    V_P_NOTE2 : gfn_nvl(item.data.NOTE2),
                    V_P_RECEIPT_OR_BILL : gfn_nvl(item.data.RECEIPT_OR_BILL),
                    V_P_SELLER_EMAIL : gfn_nvl(item.data.SELLER_EMAIL),
                    IV_P_BUYER_EMAIL1 : gfn_nvl(item.data.BUYER_EMAIL1),
                    V_P_BUYER_EMAIL2 : gfn_nvl(item.data.BUYER_EMAIL2),
                    V_P_ACCOUNT_EMP_CODE : gfn_nvl(item.data.ACCOUNT_EMP_CODE),
                    V_P_TXN_DATE : gfn_nvl(item.data.TXN_DATE.replace(/-/gi, "")),
                    V_P_DOC_ID : gfn_nvl(item.data.DOC_ID),
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });
        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/pay/insertFig3100.do", {listData: returnData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    let updatedData = gvwItemGrid.getUpdateData(true, 'i');
                    let returnData = [];

                    updatedData.forEach((item, index) => {
                        const param = {
                            cv_count : '0',
                            getType : 'json',
                            rownum: item.rownum,
                            workType : 'N',
                            params: gfnma_objectToString({
                                V_P_DEBUG_MODE_YN : '',
                                V_P_LANG_ID	: '',
                                V_P_COMP_CODE : gv_ma_selectedCorpCd,
                                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                                V_P_APPROVAL_NO : gfn_nvl(item.data.APPROVAL_NO),
                                V_P_SEQ : gfn_nvl(item.data.SEQ),
                                V_P_ITEM_NAME : gfn_nvl(item.data.ITEM_NAME),
                                V_P_ITEM_SPEC : gfn_nvl(item.data.ITEM_SPEC),
                                V_P_ITEM_QTY : parseInt(gfn_nvl(item.data.ITEM_QTY) == "" ? "0" : gfn_nvl(item.data.ITEM_QTY)),
                                V_P_ITEM_UNIT_PRICE : parseInt(gfn_nvl(item.data.ITEM_UNIT_PRICE) == "" ? "0" : gfn_nvl(item.data.ITEM_UNIT_PRICE)),
                                V_P_ITEM_TAXABLE_AMT : parseInt(gfn_nvl(item.data.ITEM_TAXABLE_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_TAXABLE_AMT)),
                                V_P_ITEM_VAT_AMT : parseInt(gfn_nvl(item.data.ITEM_VAT_AMT) == "" ? "0" : gfn_nvl(item.data.ITEM_VAT_AMT)),
                                V_P_ITEM_DESC : gfn_nvl(item.data.ITEM_DESC),
                                V_P_COST_CENTER_CODE : gfn_nvl(item.data.COST_CENTER_CODE),
                                V_P_DEPT_CODE : gfn_nvl(item.data.DEPT_CODE),
                                V_P_PROJECT_CODE : gfn_nvl(item.data.PROJECT_CODE),
                                V_P_ACCOUNT_CODE : gfn_nvl(item.data.ACCOUNT_CODE),
                                V_P_FORM_ID : p_formId,
                                V_P_MENU_ID : p_menuId,
                                V_P_PROC_ID : '',
                                V_P_USERID : '',
                                V_P_PC : ''
                            })
                        }
                        returnData.push(param);
                    });

                    if(returnData.length > 0) {
                        const postJsonPromise = gfn_postJSON("/fi/fap/pay/insertFig3100S1.do", {listData: returnData});
                        const data = await postJsonPromise;

                        try {
                            if (_.isEqual("S", data.resultStatus)) {
                                gfn_comAlert("I0001");
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
                } else {
                    alert(data.resultMessage);
                    fn_search();
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

    function xmlToJson(xml) {
        var obj = {};

        if (xml.nodeType == 1) {
            if (xml.attributes.length > 0) {
                obj["@attributes"] = {};
                for (var j = 0; j < xml.attributes.length; j++) {
                    var attribute = xml.attributes.item(j);
                    obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
                }
            }
        } else if (xml.nodeType == 3) {
            obj = xml.nodeValue;
        }

        var textNodes = [].slice.call(xml.childNodes).filter(function(node) {
            return node.nodeType === 3;
        });
        if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
            obj = [].slice.call(xml.childNodes).reduce(function(text, node) {
                return text + node.nodeValue;
            }, "");
        } else if (xml.hasChildNodes()) {
            for (var i = 0; i < xml.childNodes.length; i++) {
                var item = xml.childNodes.item(i);
                var nodeName = item.nodeName;
                if (typeof obj[nodeName] == "undefined") {
                    obj[nodeName] = xmlToJson(item);
                } else {
                    if (typeof obj[nodeName].push == "undefined") {
                        var old = obj[nodeName];
                        obj[nodeName] = [];
                        obj[nodeName].push(old);
                    }
                    obj[nodeName].push(xmlToJson(item));
                }
            }
        }
        return obj;
    }

    const fn_init = async function () {

        let openDate = gfn_dateToYm(new Date());
        let openDateFR = gfn_dateToYmd(new Date());

        SBUxMethod.set('SRCH_YMDPERIOD_YYYYMM', openDate);
        SBUxMethod.set('SRCH_DATE_FR', openDate+'01');

        //월별로 말일 구하기
        let lastDate = new Date(openDateFR.slice(0,4),openDateFR.slice(4,6),0);
        let DATE_TO = gfn_dateToYmd(lastDate);
        SBUxMethod.set("SRCH_DATE_TO", 			DATE_TO);

        fn_createGrid();
        fn_createItemGrid();
    }

    /**
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let NATION_CODE = gfn_nvl(SBUxMethod.get("SRCH_YMDPERIOD_YYYYMM"));

        if (NATION_CODE == ''){

            SBUxMethod.set("SRCH_DATE_FR", 			"");
            SBUxMethod.set("SRCH_DATE_TO", 			"");
        }

        SBUxMethod.set("SRCH_DATE_FR", 			NATION_CODE + '01');

        //월별로 말일 구하기
        let lastDate = new Date(NATION_CODE.slice(0,4),NATION_CODE.slice(4,6),0);
        let DATE_TO = gfn_dateToYmd(lastDate);
        SBUxMethod.set("SRCH_DATE_TO", 			DATE_TO);

    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    // 저장
    async function cfn_save() {
        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {


            if (strIfType == "2")
            {
                let listGridData = gvwListGrid.getUpdateData(true, 'all');

                if (_.isEmpty(listGridData) == false){

                    if (await fn_save(listGridData, 'N')){
                        return;
                    }
                }

                //let itemGridData = gvwItemGrid.getUpdateData(true, 'all');
                let itemGridData = gvwItemGrid.getUpdateData(true, 'all');

                if (_.isEmpty(itemGridData) == false){

                    if (await fn_saveS1(itemGridData, 'N')){
                        return;
                    }
                }
            }
            else
            {
                if (newAddOn)
                {
                    let listGridData = gvwListGrid.getUpdateData(true, 'all');

                    if (_.isEmpty(listGridData) == false){

                        if (await fn_save(listGridData, 'N')){
                            return;
                        }
                    }
                }
                else
                {
                    /* 전자 세금계산서 저장 */
                    let listGridData = gvwListGrid.getUpdateData(true, 'all');

                    if (_.isEmpty(listGridData) == false){

                        if ( await fn_save(listGridData, 'U')){
                            return;
                        }
                    }

                    //let itemGridData = gvwItemGrid.getUpdateData(true, 'all');
                    let itemGridData = gvwItemGrid.getUpdateData(true, 'all');
                    if (_.isEmpty(itemGridData) == false){

                        if (await fn_saveS1(itemGridData, 'U1')){
                            return;
                        }
                    }
                }
            }

            /*fn_search();*/

        }
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

        //라디오버튼 초기화시 리플레시 해줘야함
        SBUxMethod.refresh('SRCH_RIDGUBUN')
    }

    //조회 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["전표작성"],			    ref: 'INTERFACED_FLAG', 			        type:'checkbox',  	width:'75px',  	style:'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["작성일자"],       ref: 'WRITE_DATE', 		type: 'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd', oneclickedit: true},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["승인번호"], ref: 'APPROVAL_NO', type: 'input', width: '170px', style: 'text-align:left'},
            {caption: ['발급일자'], ref: 'ISSUE_DATE', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {dateformat :'yymmdd', oneclickedit: true}},
            {caption: ['전송일자'], ref: 'SEND_DATE', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {dateformat :'yymmdd', oneclickedit: true}},
            {caption: ["공급자사업자번호"], ref: 'SELLER_REG_NO', type:'input',  width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 12}
                , format : {type:'string', rule:'###-##-#####', emptyvalue:'0'}
            },
            {caption: ["종사업장번호"], ref: 'SELLER_SUB_REG_NO', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구분"], ref: 'RID_GUBUN', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["DOC_ID"], ref: 'DOC_ID', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["전표번호"], ref: 'DOC_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            /*{caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(objRowData['DOC_ID']){
                        return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
                    } else {
                        return "";
                    }
                }
            },*/
            {caption: ["배치번호"], ref: 'DOC_BATCH_NO', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["매입정산번호"], ref: 'PO_DOC_NO', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급사코드"], ref: 'CS_CODE', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급사코드 조회"], 			ref: 'CS_CODE_POP_BTN',    type:'button',  	width:'100px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["상호"], ref: 'SELLER_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["대표자명"], ref: 'SELLER_OWNER', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급자주소"], ref: 'SELLER_ADDRESS', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급자업종"], ref: 'SELLER_BIZ_CATEGORY', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급자업태"], ref: 'SELLER_BIZ_ITEM', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급자유형"], ref: 'SELLER_BIZ_TYPE', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["공급받는자사업자번호"], ref: 'BUYER_REG_NO', type: 'input', width: '140px', style: 'text-align:left', hidden: true},
            {caption: ["종사업자번호"], ref: 'BUYER_SUB_REG_NO', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자상호"], ref: 'BUYER_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자대표자명"], ref: 'BUYER_OWNER', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자업종"], ref: 'BUYER_BIZ_CATEGORY', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자업태"], ref: 'BUYER_BIZ_ITEM', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자유형"], ref: 'BUYER_BIZ_TYPE', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자주소"], ref: 'BUYER_ADDRESS', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["합계금액"], ref: 'TOTAL_AMT', type: 'input', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["세액"], ref: 'TOTAL_TAXABLE_AMT', type: 'input', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["공급가액"], ref: 'TOTAL_VAT_AMT', type: 'input', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["전표총금액"], ref: 'DOC_TOTAL_AMT', type: 'input', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["전표공급가액"], ref: 'DOC_SUPPLY_AMT', type: 'input', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["전표부가세"], ref: 'DOC_VAT_AMT', type: 'input', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["차이여부"], ref: 'DIFF_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["제외코드"], ref : 'EXCEPT_CODE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonExceptCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["제외사유"], ref: 'EXCEPT_REASON', type: 'input', width: '140px', style: 'text-align:left'},
            {caption : ["전자세금계산서분류"], ref : 'EINVOICE_CATEGORY', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonEinvoiceCategory', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["전자세금계산서종류"], ref : 'EINVOICE_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonEinvoiceType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["정발행/역발행"], ref : 'MATCH_METHOD', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonMatchMethod', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["발급유형"], ref: 'ISSUE_TYPE', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'NOTE1', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["other_desc"], ref: 'NOTE2', type: 'input', width: '140px', style: 'text-align:left', hidden: true},
            {caption : ["영수/청구 구분"], ref : 'RECEIPT_OR_BILL', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonReceiptOrBill', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["공급자이메일"], ref: 'SELLER_EMAIL', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자이메일1"], ref: 'BUYER_EMAIL1', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["구매자이메일2"], ref: 'BUYER_EMAIL2', type: 'input', width: '140px', style: 'text-align:left'},
           /* {caption : ["전표담당자코드"], ref : 'ACCOUNT_EMP_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonEmpState', displayui : true, label : 'label', value : 'value'}
            },
            //고정
            {caption : ["전표담당자"], ref : 'ACCOUNT_EMP_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonEmpState', displayui : true, label : 'label', value : 'value'}
            },*/
            {caption: ["전표담당자코드"],         ref: 'ACCOUNT_EMP_CODE',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["전표담당자 조회"], 			ref: 'ACCOUNT_EMP_POP_BTN',    type:'button',  	width:'100px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridAccountEmpPopup(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["전표담당자"],         ref: 'ACCOUNT_EMP_NAME',    type:'input',  	width:'100px',  style:'text-align:left'},


            {caption: ['품목일자'], ref: 'TXN_DATE', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, hidden: true},
            {caption: ["품목명"], ref: 'ITEM_NAME', type: 'output', width: '140px', style: 'text-align:left' , hidden: true},
            {caption: ["품목규격"], ref: 'ITEM_SPEC', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
            {caption: ["품목수량"], ref: 'ITEM_QTY', type: 'output', width: '140px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["품목단가"], ref: 'ITEM_UNIT_PRICE', type: 'output', width: '140px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["품목세액"], ref: 'ITEM_TAXABLE_AMT', type: 'output', width: '140px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["품목공급가액"], ref: 'ITEM_VAT_AMT', type: 'output', width: '140px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["품목비고"], ref: 'ITEM_DESC', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
            {caption: ["상태"], ref: 'ROW_STATUS', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
            {caption: ["회계단위"], ref: 'FI_ORG_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
            {caption: ["조회시공급사코드"], ref: 'CS_CODE_ORG', type: 'output', width: '140px', style: 'text-align:left', hidden: true},

        ];

        gvwListGrid = _SBGrid.create(SBGridProperties);
        gvwListGrid.bind('afterrebuild','fn_gvwListAfterRebuild');
        gvwListGrid.bind('afterrefresh','fn_gvwListAfterRebuild');
        gvwListGrid.bind('dblclick', 'fn_gvwListDblclick');
        gvwListGrid.bind('click', 'fn_view');
        gvwListGrid.bind('keyup', 'fn_keyup');
    }


    //조회 리스트
    function fn_createItemGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwItem';
        SBGridProperties.id = 'gvwItemGrid';
        SBGridProperties.jsonref = 'jsonItemList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        //그리드 총계 하단 고정
        /*SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [6,7]
            },
           /!* subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },*!/
            datasorting	: true,
            usedecimal : false,
        };*/
        SBGridProperties.columns = [
            {caption: ["승인번호"], ref: 'APPROVAL_NO', type: 'output', width: '170px', style: 'text-align:left'},
            {caption: ["품목순번"], ref: 'SEQ', type: 'output', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' }},
            {caption: ["품목명"], ref: 'ITEM_NAME', type: 'output', width: '170px', style: 'text-align:left'},
            {caption: ["규격"], ref: 'ITEM_SPEC', type: 'output', width: '170px', style: 'text-align:left'},
            {caption: ["품목수량"], ref: 'ITEM_QTY', type: 'output', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' , emptyvalue:'0'}},
            {caption: ["품목단가"], ref: 'ITEM_UNIT_PRICE', type: 'output', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["품목공급가액"], ref: 'ITEM_TAXABLE_AMT', type: 'output', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["품목세액"], ref: 'ITEM_VAT_AMT', type: 'output', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["비고"], ref: 'ITEM_DESC', type: 'output', width: '170px', style: 'text-align:left'},
            {caption : ["원가중심점코드"], ref : 'COST_CENTER_CODE', width : '160px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonCostCenterCode', displayui : true, label : 'label', value : 'value'}
            },
            /*{caption : ["부서코드"], ref : 'DEPT_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },*/
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '160px', style: 'text-align:left', hidden : true},
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'input', width: '160px', style: 'text-align:left'},
            {caption: ["부서 조회"], ref: 'DEPT_POP_BTN',    type:'button',  	width:'90px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridDepPopup(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            /*{caption : ["프로젝트코드"], ref : 'PROJECT_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonProjectCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["프로젝트"], ref : 'PROJECT_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonProjectCode', displayui : true, label : 'label', value : 'value'}
            },*/
            {caption: ["프로젝트코드"], ref: 'PROJECT_CODE', type: 'output', width: '160px', style: 'text-align:left', hidden : true},
            {caption: ["프로젝트"], ref: 'PROJECT_NAME', type: 'input', width: '160px', style: 'text-align:left'},
            {caption: ["프로젝트 조회"], ref: 'PROJECT_POP_BTN',    type:'button',  	width:'90px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridProPopup(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            /*{caption : ["계정과목코드"], ref : 'ACCOUNT_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonAccount', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["계정과목"], ref : 'ACCOUNT_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonAccount', displayui : true, label : 'label', value : 'value'}
            },*/
            {caption: ["계정과목코드"], ref: 'ACCOUNT_CODE', type: 'output', width: '160px', style: 'text-align:left', hidden : true},
            {caption: ["계정과목"], ref: 'ACCOUNT_NAME', type: 'input', width: '160px', style: 'text-align:left'},
            {caption: ["계정과목 조회"], ref: 'ACCOUNT_POP_BTN',    type:'button',  	width:'90px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridAccountPopup(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
        ];

        gvwItemGrid = _SBGrid.create(SBGridProperties);
        /*gvwItemGrid.bind('click', 'fn_view');*/
    }

    /**
     * 공급사코드 팝업 조회
     */
    function fn_gridPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup3(row, col);
    }

    /**
     * 부서 팝업 조회
     */
    function fn_gridDepPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup4(row, col);
    }

    /**
     * 프로젝트 팝업 조회
     */
    function fn_gridProPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup5(row, col);
    }

    /**
     * 계정과목 팝업 조회
     */
    function fn_gridAccountPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup6(row, col);
    }

    /**
     * 전표담당자 팝업 조회
     */
    function fn_gridAccountEmpPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup7(row, col);
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

       /* let YMDPERIOD_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_YMDPERIOD_YYYYMM")); //년월*/
        //let FI_ORG_CODE = gfn_nvl(SBUxMethod.get("srch-fi_org_code")); //회계단위
        let FI_ORG_CODE     = gfnma_multiSelectGet('#SRCH_FI_ORG_CODE');//APC명
        let RIDGUBUN        = gfn_nvl(SBUxMethod.get("SRCH_RIDGUBUN")); //조회구분
        let DATE_FR         = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR")); //작성일자
        let DATE_TO         = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO")); //작성일자
        let CS_BIZ_REGNO    = gfn_nvl(SBUxMethod.get("SRCH_CS_BIZ_REGNO")); //사업자번호
        let CS_NAME         = gfn_nvl(SBUxMethod.get("SRCH_CS_NAME")); //상호
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //관련부서
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let AMT             = gfn_nvl(SBUxMethod.get("SRCH_TXTAMT")); //몬지도 모르겠는 숨겨져 있는 컬럼
        let APPROVAL_NO     = gfn_nvl(SBUxMethod.get("SRCH_TXTAPPROVAL_NO")); //몬지도 모르겠는 숨겨져 있는 컬럼
        let ROW_CNT         = gfn_nvl(SBUxMethod.get("SRCH_NUMROW_CNT")); //몬지도 모르겠는 숨겨져 있는 컬럼

        if (!FI_ORG_CODE) {
            gfn_comAlert("W0002", "회계단위");
            return;
        }
        if (!DATE_FR) {
            gfn_comAlert("W0002", "작성일자");
            return;
        }
        if (!DATE_TO) {
            gfn_comAlert("W0002", "작성일자");
            return;
        }
        if (!RIDGUBUN) {
            gfn_comAlert("W0002", "조회구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_FI_ORG_CODE      : FI_ORG_CODE
            ,V_P_DATE_FR          : DATE_FR
            ,V_P_DATE_TO          : DATE_TO
            ,V_P_CS_BIZ_REGNO     : CS_BIZ_REGNO
            ,V_P_APPROVAL_NO      : APPROVAL_NO
            ,V_P_ITEM_TAXABLE_AMT : AMT
            ,V_P_CS_NAME          : CS_NAME
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_GUBUN            : RIDGUBUN

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/fap/pay/selectFig3100List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        ROW_STATUS		        : gfn_nvl(item.ROW_STATUS),
                        CHECK_YN		        : gfn_nvl(item.CHECK_YN),
                        WRITE_DATE		        : gfn_nvl(item.WRITE_DATE),
                        APPROVAL_NO		        : gfn_nvl(item.APPROVAL_NO),
                        ISSUE_DATE		        : gfn_nvl(item.ISSUE_DATE),
                        SEND_DATE		        : gfn_nvl(item.SEND_DATE),
                        SELLER_REG_NO		    : gfn_nvl(item.SELLER_REG_NO),
                        SELLER_SUB_REG_NO		: gfn_nvl(item.SELLER_SUB_REG_NO),
                        CS_CODE		            : gfn_nvl(item.CS_CODE),
                        CS_CODE_ORG		        : gfn_nvl(item.CS_CODE_ORG),
                        SELLER_NAME		        : gfn_nvl(item.SELLER_NAME),
                        SELLER_OWNER		    : gfn_nvl(item.SELLER_OWNER),
                        SELLER_BIZ_CATEGORY		: gfn_nvl(item.SELLER_BIZ_CATEGORY),
                        SELLER_BIZ_ITEM		    : gfn_nvl(item.SELLER_BIZ_ITEM),
                        SELLER_BIZ_TYPE		    : gfn_nvl(item.SELLER_BIZ_TYPE),
                        BUYER_REG_NO		    : gfn_nvl(item.BUYER_REG_NO),
                        BUYER_SUB_REG_NO		: gfn_nvl(item.BUYER_SUB_REG_NO),
                        BUYER_NAME		        : gfn_nvl(item.BUYER_NAME),
                        BUYER_OWNER		        : gfn_nvl(item.BUYER_OWNER),
                        BUYER_BIZ_CATEGORY		: gfn_nvl(item.BUYER_BIZ_CATEGORY),
                        BUYER_BIZ_ITEM		    : gfn_nvl(item.BUYER_BIZ_ITEM),
                        BUYER_BIZ_TYPE		    : gfn_nvl(item.BUYER_BIZ_TYPE),
                        TOTAL_AMT		        : gfn_nvl(item.TOTAL_AMT),
                        TOTAL_TAXABLE_AMT		: gfn_nvl(item.TOTAL_TAXABLE_AMT),
                        TOTAL_VAT_AMT		    : gfn_nvl(item.TOTAL_VAT_AMT),
                        DOC_TOTAL_AMT		    : gfn_nvl(item.DOC_TOTAL_AMT),
                        DOC_SUPPLY_AMT		    : gfn_nvl(item.DOC_SUPPLY_AMT),
                        DOC_VAT_AMT		        : gfn_nvl(item.DOC_VAT_AMT),
                        DIFF_FLAG		        : gfn_nvl(item.DIFF_FLAG),
                        EINVOICE_CATEGORY		: gfn_nvl(item.EINVOICE_CATEGORY),
                        EINVOICE_TYPE		    : gfn_nvl(item.EINVOICE_TYPE),
                        MATCH_METHOD		    : gfn_nvl(item.MATCH_METHOD),
                        ISSUE_TYPE		        : gfn_nvl(item.ISSUE_TYPE),
                        NOTE1		            : gfn_nvl(item.NOTE1),
                        NOTE2		            : gfn_nvl(item.NOTE2),
                        NOTE3		            : gfn_nvl(item.NOTE3),
                        RECEIPT_OR_BILL		    : gfn_nvl(item.RECEIPT_OR_BILL),
                        SELLER_EMAIL		    : gfn_nvl(item.SELLER_EMAIL),
                        BUYER_EMAIL1		    : gfn_nvl(item.BUYER_EMAIL1),
                        BUYER_EMAIL2		    : gfn_nvl(item.BUYER_EMAIL2),
                        ACCOUNT_EMP_CODE		: gfn_nvl(item.ACCOUNT_EMP_CODE),
                        ACCOUNT_EMP_NAME		: gfn_nvl(item.ACCOUNT_EMP_NAME),
                        TXN_DATE		        : gfn_nvl(item.TXN_DATE),
                        ITEM_NAME		        : gfn_nvl(item.ITEM_NAME),
                        ITEM_SPEC		        : gfn_nvl(item.ITEM_SPEC),
                        ITEM_QTY		        : gfn_nvl(item.ITEM_QTY),
                        ITEM_UNIT_PRICE		    : gfn_nvl(item.ITEM_UNIT_PRICE),
                        ITEM_TAXABLE_AMT		: gfn_nvl(item.ITEM_TAXABLE_AMT),
                        ITEM_VAT_AMT		    : gfn_nvl(item.ITEM_VAT_AMT),
                        ITEM_DESC		        : gfn_nvl(item.ITEM_DESC),
                        INTERFACED_FLAG		    : gfn_nvl(item.INTERFACED_FLAG),
                        FI_ORG_CODE		        : gfn_nvl(item.FI_ORG_CODE),
                        SELLER_ADDRESS		    : gfn_nvl(item.SELLER_ADDRESS),
                        BUYER_ADDRESS		    : gfn_nvl(item.BUYER_ADDRESS),
                        DOC_ID		            : gfn_nvl(item.DOC_ID),
                        DOC_NAME		        : gfn_nvl(item.DOC_NAME),
                        DOC_BATCH_NO		    : gfn_nvl(item.DOC_BATCH_NO),
                        DOC_STATUS		        : gfn_nvl(item.DOC_STATUS),
                        RID_GUBUN		        : gfn_nvl(item.RID_GUBUN),
                        EXCEPT_CODE		        : gfn_nvl(item.EXCEPT_CODE),
                        EXCEPT_REASON		    : gfn_nvl(item.EXCEPT_REASON),
                        EXCEPT_AMOUNT		    : gfn_nvl(item.EXCEPT_AMOUNT),
                        PO_DOC_NO		        : gfn_nvl(item.PO_DOC_NO),
                    }
                    jsonList.push(msg);
                    totalRecordCount ++;
                });

                gvwListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if (jsonList.length > 0){
                    jsonList.forEach((item, index) => {
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("INTERFACED_FLAG"), index+1, gvwListGrid.getColRef("ISSUE_DATE"), true, false, true); //전표작성, 작성일자, 승인번호, 발급일자
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("SELLER_REG_NO"), index+1, gvwListGrid.getColRef("SELLER_SUB_REG_NO"), true, false, true); //공급자사업자번호, 종사업장번호
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("SELLER_NAME"), index+1, gvwListGrid.getColRef("SELLER_OWNER"), true, false, true); //상호, 대표자명
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("BUYER_REG_NO"), index+1, gvwListGrid.getColRef("BUYER_OWNER"), true, false, true); //공급받는자사업자번호, 종사업자번호, 구매자상호, 구매자대표자명
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("TOTAL_AMT"), index+1, gvwListGrid.getColRef("TOTAL_VAT_AMT"), true, false, true); //합계금액, 세액, 공급가액
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("EINVOICE_CATEGORY"), index+1, gvwListGrid.getColRef("EINVOICE_TYPE"), true, false, true); //전자세금계산서분류, 전자세금계산서종류
                        gvwListGrid.setCellDisabled(index+1, gvwListGrid.getColRef("ISSUE_TYPE"), index+1, gvwListGrid.getColRef("SELLER_EMAIL"), true, false, true); // 발급유형, 비고, 영수/청구 구분, 공급자이메일


                    })
                }

                if(jsonList.length > 0) {
                    gvwListGrid.clickRow(1);
                }


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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {

        let nRow = gvwListGrid.getRow();
        let nCol = gvwListGrid.getCol();

        if (nCol == 14 || nCol == 48 || nCol == 49) return;


        if (nRow < 1) {
            return; //그리드 로우 첫번째값 셋팅
        }

        let rowData = gvwListGrid.getRowData(nRow);

        if(gfn_nvl(rowData) == "") return;

        if(nCol == gvwListGrid.getColRef("DOC_NAME")){

            var obj = {
                'MENU_MOVE'		: 'Y'
                ,'DOC_ID' 		: gfn_nvl(rowData.DOC_ID)
                ,'target'		: 'MA_A20_030_020_150'
            }
            let json = JSON.stringify(obj);
            window.parent.cfn_openTabSearch(json);

            return;

        }

        //let FI_ORG_CODE = gfn_nvl(SBUxMethod.get("srch-fi_org_code")); //회계단위
        let FI_ORG_CODE     = gfnma_multiSelectGet('#SRCH_FI_ORG_CODE');//APC명
        let RIDGUBUN        = gfn_nvl(SBUxMethod.get("SRCH_RIDGUBUN")); //조회구분
        let DATE_FR         = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR")); //작성일자
        let DATE_TO         = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO")); //작성일자
        let CS_BIZ_REGNO    = gfn_nvl(SBUxMethod.get("SRCH_CS_BIZ_REGNO")); //사업자번호
        let CS_NAME         = gfn_nvl(SBUxMethod.get("SRCH_CS_NAME")); //상호
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //관련부서
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let AMT             = gfn_nvl(SBUxMethod.get("SRCH_TXTAMT")); //몬지도 모르겠는 숨겨져 있는 컬럼
        let APPROVAL_NO     = gfn_nvl(SBUxMethod.get("SRCH_TXTAPPROVAL_NO")); //몬지도 모르겠는 숨겨져 있는 컬럼
        let ROW_CNT         = gfn_nvl(SBUxMethod.get("SRCH_NUMROW_CNT")); //몬지도 모르겠는 숨겨져 있는 컬럼

        if (!FI_ORG_CODE) {
            gfn_comAlert("W0002", "회계단위");
            return;
        }
        if (!DATE_FR) {
            gfn_comAlert("W0002", "작성일자");
            return;
        }
        if (!DATE_TO) {
            gfn_comAlert("W0002", "작성일자");
            return;
        }
        if (!RIDGUBUN) {
            gfn_comAlert("W0002", "조회구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_FI_ORG_CODE       : FI_ORG_CODE
            , V_P_DATE_FR           : DATE_FR
            , V_P_DATE_TO           : DATE_TO
            , V_P_CS_BIZ_REGNO      : CS_BIZ_REGNO
            , V_P_APPROVAL_NO       : gfn_nvl(rowData.APPROVAL_NO) == '' ? '' : gfn_nvl(rowData.APPROVAL_NO)
            , V_P_ITEM_TAXABLE_AMT  : AMT
            , V_P_CS_NAME           : CS_NAME
            , V_P_DEPT_CODE         : DEPT_CODE
            , V_P_EMP_CODE          : EMP_CODE
            , V_P_GUBUN             : RIDGUBUN

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/fap/pay/selectFig3100List.do", {
            getType: 'json',
            workType: 'ITEM',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonItemList.length = 0;
                data.cv_3.forEach((item, index) => {
                    const msg = {
                        ROW_STATUS      : gfn_nvl(item.ROW_STATUS),
                        APPROVAL_NO     : gfn_nvl(item.APPROVAL_NO),
                        SEQ             : gfn_nvl(item.SEQ),
                        ITEM_NAME       : gfn_nvl(item.ITEM_NAME),
                        ITEM_SPEC       : gfn_nvl(item.ITEM_SPEC),
                        ITEM_QTY        : gfn_nvl(item.ITEM_QTY),
                        ITEM_UNIT_PRICE : gfn_nvl(item.ITEM_UNIT_PRICE),
                        ITEM_TAXABLE_AMT: gfn_nvl(item.ITEM_TAXABLE_AMT),
                        ITEM_VAT_AMT    : gfn_nvl(item.ITEM_VAT_AMT),
                        ITEM_DESC       : gfn_nvl(item.ITEM_DESC),
                        COST_CENTER_CODE: gfn_nvl(item.COST_CENTER_CODE),
                        DEPT_CODE       : gfn_nvl(item.DEPT_CODE),
                        DEPT_NAME       : gfn_nvl(item.DEPT_NAME),
                        PROJECT_CODE    : gfn_nvl(item.PROJECT_CODE),
                        PROJECT_NAME    : gfn_nvl(item.PROJECT_NAME),
                        ACCOUNT_CODE    : gfn_nvl(item.ACCOUNT_CODE),
                        ACCOUNT_NAME    : gfn_nvl(item.ACCOUNT_NAME),

                    }
                    jsonItemList.push(msg);
                    totalRecordCount++;
                });

                gvwItemGrid.rebuild();
                document.querySelector('#listCount2').innerText = totalRecordCount;


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

    // 세금계산서 항목 프로시저(조회결과) 저장
    const fn_save = async function (listGridData, type) {


        let listData = [];
        listData = await getParamForm(listGridData, type);
        /* var paramObj = {
             P_HRP1170_S: await getParamForm('u')
         }*/

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/fi/fap/pay/insertFig3100.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        return true;
                    } else {

                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        /*alert(data.resultMessage);*/
                       return false;
                    }


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

    const getParamForm = async function (listGridData, type) {

        let returnData = [];

        let FI_ORG_CODE = gfnma_multiSelectGet('#SRCH_FI_ORG_CODE');//APC명

        if (!FI_ORG_CODE) {
            gfn_comAlert("W0002", "회계단위");
            return;
        }

        if (!_.isEmpty(listGridData)) {

            let isInsert = false;

            if (_.isEqual(type, 'N1')) {

                listGridData.forEach((item, index) => {
                    if (item.INTERFACED_FLAG == 'N') {
                        isInsert = true;
                    }
                });

                if (isInsert) {

                    listGridData.forEach((item, index) => {

                        if (item.INTERFACED_FLAG == 'N') {

                            const param = {

                                cv_count: '0',
                                getType: 'json',
                                workType: type,
                                params: gfnma_objectToString({

                                    V_P_DEBUG_MODE_YN: ''
                                    , V_P_LANG_ID: ''
                                    , V_P_COMP_CODE: gv_ma_selectedCorpCd
                                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                                    , V_P_FI_ORG_CODE: FI_ORG_CODE
                                    , V_P_WRITE_DATE:           gfn_nvl(item.WRITE_DATE)
                                    , V_P_APPROVAL_NO:          gfn_nvl(item.APPROVAL_NO)
                                    , V_P_ISSUE_DATE:           gfn_nvl(item.ISSUE_DATE)
                                    , V_P_SEND_DATE:            gfn_nvl(item.SEND_DATE)
                                    , V_P_SELLER_REG_NO:        gfn_nvl(item.SELLER_REG_NO)
                                    , V_P_SELLER_SUB_REG_NO:    gfn_nvl(item.SELLER_SUB_REG_NO)
                                    , V_P_CS_CODE:              gfn_nvl(item.CS_CODE)
                                    , V_P_SELLER_NAME:          gfn_nvl(item.SELLER_NAME)
                                    , V_P_SELLER_OWNER:         gfn_nvl(item.SELLER_OWNER)
                                    , V_P_SELLER_ADDRESS:       gfn_nvl(item.SELLER_ADDRESS)
                                    , V_P_SELLER_BIZ_CATEGORY:  gfn_nvl(item.SELLER_BIZ_CATEGORY)
                                    , V_P_SELLER_BIZ_ITEM:      gfn_nvl(item.SELLER_BIZ_ITEM)
                                    , V_P_SELLER_BIZ_TYPE:      gfn_nvl(item.SELLER_BIZ_TYPE)
                                    , V_P_BUYER_REG_NO:         gfn_nvl(item.BUYER_REG_NO)
                                    , V_P_BUYER_SUB_REG_NO:     gfn_nvl(item.BUYER_SUB_REG_NO)
                                    , V_P_BUYER_NAME:           gfn_nvl(item.BUYER_NAME)
                                    , V_P_BUYER_OWNER:          gfn_nvl(item.BUYER_OWNER)
                                    , V_P_BUYER_ADDRESS:        gfn_nvl(item.BUYER_ADDRESS)
                                    , V_P_BUYER_BIZ_CATEGORY:   gfn_nvl(item.BUYER_BIZ_CATEGORY)
                                    , V_P_BUYER_BIZ_ITEM:       gfn_nvl(item.BUYER_BIZ_ITEM)
                                    , V_P_TOTAL_AMT:            gfn_nvl(item.TOTAL_AMT)
                                    , V_P_TOTAL_TAXABLE_AMT:    gfn_nvl(item.TOTAL_TAXABLE_AMT)
                                    , V_P_TOTAL_VAT_AMT:        gfn_nvl(item.TOTAL_VAT_AMT)
                                    , V_P_EINVOICE_CATEGORY:    gfn_nvl(item.EINVOICE_CATEGORY)
                                    , V_P_EINVOICE_TYPE:        gfn_nvl(item.EINVOICE_TYPE)
                                    , V_P_MATCH_METHOD:         gfn_nvl(item.MATCH_METHOD)
                                    , V_P_ISSUE_TYPE:           gfn_nvl(item.ISSUE_TYPE)
                                    , V_P_NOTE1:                gfn_nvl(item.NOTE1)
                                    , V_P_NOTE2:                gfn_nvl(item.NOTE2)
                                    //--,V_P_NOTE3             IN VARCHAR2
                                    , V_P_RECEIPT_OR_BILL:      gfn_nvl(item.RECEIPT_OR_BILL)
                                    , V_P_SELLER_EMAIL:         gfn_nvl(item.SELLER_EMAIL)
                                    , IV_P_BUYER_EMAIL1:        gfn_nvl(item.BUYER_EMAIL1)
                                    , V_P_BUYER_EMAIL2:         gfn_nvl(item.BUYER_EMAIL2)
                                    , V_P_ACCOUNT_EMP_CODE:     gfn_nvl(item.ACCOUNT_EMP_CODE)
                                    , V_P_TXN_DATE:             gfn_nvl(item.TXN_DATE)

                                    , V_P_DOC_ID:               gfn_nvl(item.DOC_ID)
                                    //--,V_P_DOC_BATCH_ID      IN VARCHAR2

                                    , V_P_FORM_ID: p_formId
                                    , V_P_MENU_ID: p_menuId
                                    , V_P_PROC_ID: ''
                                    , V_P_USERID: ''
                                    , V_P_PC: ''
                                })
                            }
                            returnData.push(param);
                        }
                    });
                }else{
                    gfn_comConfirm("Q0000","생성할 건이 없습니다.");
                    return false;

                    /*SetMessageBox("생성할 건이 없습니다.");
                    return false;*/
                }

            } else {

                /*********** 조회결과 리스트 필수값 체크 *************/
                listGridData.forEach((item, index) => {

                    if (gfn_nvl(item.data.WRITE_DATE) == ''){
                        gfn_comAlert("W0002", "작성일자");
                        return;
                    }
                    if (gfn_nvl(item.data.APPROVAL_NO) == ''){
                        gfn_comAlert("W0002", "승인번호");
                        return;
                    }
                    if (gfn_nvl(item.data.ISSUE_DATE) == ''){
                        gfn_comAlert("W0002", "발급일자");
                        return;
                    }
                    if (gfn_nvl(item.data.SEND_DATE) == ''){
                        gfn_comAlert("W0002", "전송일자");
                        return;
                    }
                    if (gfn_nvl(item.data.SELLER_REG_NO) == ''){
                        gfn_comAlert("W0002", "공급자사업자번호");
                        return;
                    }
                    if (gfn_nvl(item.data.BUYER_REG_NO) == ''){
                        gfn_comAlert("W0002", "공급받는자사업자번호");
                        return;
                    }
                    if (gfn_nvl(item.data.EINVOICE_CATEGORY) == ''){
                        gfn_comAlert("W0002", "전자세금계산서분류");
                        return;
                    }
                    if (gfn_nvl(item.data.RECEIPT_OR_BILL) == ''){
                        gfn_comAlert("W0002", "영수/청구 구분");
                        return;
                    }

                });



                listGridData.forEach((item, index) => {

                    let workType = '';

                    if (_.isEqual(type, 'U')){
                        workType = 'U'
                    }else{
                        workType = item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D');
                    }

                    const param = {

                        cv_count: '0',
                        getType: 'json',
                        workType: workType,
                        params: gfnma_objectToString({

                            V_P_DEBUG_MODE_YN: ''
                            , V_P_LANG_ID: ''
                            , V_P_COMP_CODE: gv_ma_selectedCorpCd
                            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                            , V_P_FI_ORG_CODE:          gfn_nvl(item.data.FI_ORG_CODE)
                            , V_P_WRITE_DATE:           gfn_nvl(item.data.WRITE_DATE)
                            , V_P_APPROVAL_NO:          gfn_nvl(item.data.APPROVAL_NO)
                            , V_P_ISSUE_DATE:           gfn_nvl(item.data.ISSUE_DATE)
                            , V_P_SEND_DATE:            gfn_nvl(item.data.SEND_DATE)
                            , V_P_SELLER_REG_NO:        gfn_nvl(item.data.SELLER_REG_NO)
                            , V_P_SELLER_SUB_REG_NO:    gfn_nvl(item.data.SELLER_SUB_REG_NO)
                            , V_P_CS_CODE:              gfn_nvl(item.data.CS_CODE)
                            , V_P_SELLER_NAME:          gfn_nvl(item.data.SELLER_NAME)
                            , V_P_SELLER_OWNER:         gfn_nvl(item.data.SELLER_OWNER)
                            , V_P_SELLER_ADDRESS:       gfn_nvl(item.data.SELLER_ADDRESS)
                            , V_P_SELLER_BIZ_CATEGORY:  gfn_nvl(item.data.SELLER_BIZ_CATEGORY)
                            , V_P_SELLER_BIZ_ITEM:      gfn_nvl(item.data.SELLER_BIZ_ITEM)
                            , V_P_SELLER_BIZ_TYPE:      gfn_nvl(item.data.SELLER_BIZ_TYPE)
                            , V_P_BUYER_REG_NO:         gfn_nvl(item.data.BUYER_REG_NO)
                            , V_P_BUYER_SUB_REG_NO:     gfn_nvl(item.data.BUYER_SUB_REG_NO)
                            , V_P_BUYER_NAME:           gfn_nvl(item.data.BUYER_NAME)
                            , V_P_BUYER_OWNER:          gfn_nvl(item.data.BUYER_OWNER)
                            , V_P_BUYER_ADDRESS:        gfn_nvl(item.data.BUYER_ADDRESS)
                            , V_P_BUYER_BIZ_CATEGORY:   gfn_nvl(item.data.BUYER_BIZ_CATEGORY)
                            , V_P_BUYER_BIZ_ITEM:       gfn_nvl(item.data.BUYER_BIZ_ITEM)
                            , V_P_TOTAL_AMT:            gfn_nvl(item.data.TOTAL_AMT)
                            , V_P_TOTAL_TAXABLE_AMT:    gfn_nvl(item.data.TOTAL_TAXABLE_AMT)
                            , V_P_TOTAL_VAT_AMT:        gfn_nvl(item.data.TOTAL_VAT_AMT)
                            , V_P_EINVOICE_CATEGORY:    gfn_nvl(item.data.EINVOICE_CATEGORY)
                            , V_P_EINVOICE_TYPE:        gfn_nvl(item.data.EINVOICE_TYPE)
                            , V_P_MATCH_METHOD:         gfn_nvl(item.data.MATCH_METHOD)
                            , V_P_ISSUE_TYPE:           gfn_nvl(item.data.ISSUE_TYPE)
                            , V_P_NOTE1:                gfn_nvl(item.data.NOTE1)
                            , V_P_NOTE2:                gfn_nvl(item.data.NOTE2)
                            //--,V_P_NOTE3             IN VARCHAR2
                            , V_P_RECEIPT_OR_BILL:      gfn_nvl(item.data.RECEIPT_OR_BILL)
                            , V_P_SELLER_EMAIL:         gfn_nvl(item.data.SELLER_EMAIL)
                            , IV_P_BUYER_EMAIL1:        gfn_nvl(item.data.BUYER_EMAIL1)
                            , V_P_BUYER_EMAIL2:         gfn_nvl(item.data.BUYER_EMAIL2)
                            , V_P_ACCOUNT_EMP_CODE:     gfn_nvl(item.data.ACCOUNT_EMP_CODE)
                            , V_P_TXN_DATE:             gfn_nvl(item.data.TXN_DATE)

                            , V_P_DOC_ID:               gfn_nvl(item.data.DOC_ID)
                            //--,V_P_DOC_BATCH_ID      IN VARCHAR2

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

            return returnData;

        }
    }


    // 세금계산서 항목 프로시저(품목) 저장
    const fn_saveS1 = async function (itemGridData, type) {

        let listData = [];
        listData = await getParamFormS1(itemGridData, type);
        /* var paramObj = {
             P_HRP1170_S: await getParamForm('u')
         }*/

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1170.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        return true;
                    } else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        return false;
                    }

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

    const getParamFormS1 = async function (itemGridData, type) {

        let returnData = [];

        if (!_.isEmpty(itemGridData)) {

            if (_.isEqual(type, 'N')) {

                itemGridData.forEach((item, index) => {
                    const param = {

                        cv_count: '0',
                        getType: 'json',
                        workType: type,/*item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),*/
                        params: gfnma_objectToString({

                            V_P_DEBUG_MODE_YN: ''
                            , V_P_LANG_ID: ''
                            , V_P_COMP_CODE: gv_ma_selectedCorpCd
                            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                            , V_P_APPROVAL_NO:      gfn_nvl(item.APPROVAL_NO)
                            , V_P_SEQ:              gfn_nvl(item.SEQ)
                            , V_P_ITEM_NAME:        gfn_nvl(item.ITEM_NAME)
                            , V_P_ITEM_SPEC:        gfn_nvl(item.ITEM_SPEC)
                            , V_P_ITEM_QTY:         gfn_nvl(item.ITEM_QTY)
                            , V_P_ITEM_UNIT_PRICE:  gfn_nvl(item.ITEM_UNIT_PRICE)
                            , V_P_ITEM_TAXABLE_AMT: gfn_nvl(item.ITEM_TAXABLE_AMT)
                            , V_P_ITEM_VAT_AMT:     gfn_nvl(item.ITEM_VAT_AMT)
                            , V_P_ITEM_DESC:        gfn_nvl(item.ITEM_DESC)
                            , V_P_COST_CENTER_CODE: gfn_nvl(item.COST_CENTER_CODE)
                            , V_P_DEPT_CODE:        gfn_nvl(item.DEPT_CODE)
                            , V_P_PROJECT_CODE:     gfn_nvl(item.PROJECT_CODE)
                            , V_P_ACCOUNT_CODE:     gfn_nvl(item.ACCOUNT_CODE)

                            , V_P_FORM_ID: p_formId
                            , V_P_MENU_ID: p_menuId
                            , V_P_PROC_ID: ''
                            , V_P_USERID: ''
                            , V_P_PC: ''
                        })
                    }

                    returnData.push(param);

                });
            }else{

                /*********필수값 체크************/
                itemGridData.forEach((item, index) => {
                    if (gfn_nvl(item.data.APPROVAL_NO) == ''){
                        gfn_comAlert("W0002", "승인번호");
                        return;
                    }
                    if (gfn_nvl(item.data.SEQ) == ''){
                        gfn_comAlert("W0002", "품목순번");
                        return;
                    }
                    if (gfn_nvl(item.data.SEQ) == ''){
                        gfn_comAlert("W0002", "품목순번");
                        return;
                    }

                })

                itemGridData.forEach((item, index) => {
                    const param = {

                        cv_count: '0',
                        getType: 'json',
                        workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                        params: gfnma_objectToString({

                            V_P_DEBUG_MODE_YN: ''
                            , V_P_LANG_ID: ''
                            , V_P_COMP_CODE: gv_ma_selectedCorpCd
                            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                            , V_P_APPROVAL_NO:      gfn_nvl(item.APPROVAL_NO)
                            , V_P_SEQ:              gfn_nvl(item.SEQ)
                            , V_P_ITEM_NAME:        gfn_nvl(item.ITEM_NAME)
                            , V_P_ITEM_SPEC:        gfn_nvl(item.ITEM_SPEC)
                            , V_P_ITEM_QTY:         gfn_nvl(item.ITEM_QTY)
                            , V_P_ITEM_UNIT_PRICE:  gfn_nvl(item.ITEM_UNIT_PRICE)
                            , V_P_ITEM_TAXABLE_AMT: gfn_nvl(item.ITEM_TAXABLE_AMT)
                            , V_P_ITEM_VAT_AMT:     gfn_nvl(item.ITEM_VAT_AMT)
                            , V_P_ITEM_DESC:        gfn_nvl(item.ITEM_DESC)
                            , V_P_COST_CENTER_CODE: gfn_nvl(item.COST_CENTER_CODE)
                            , V_P_DEPT_CODE:        gfn_nvl(item.DEPT_CODE)
                            , V_P_PROJECT_CODE:     gfn_nvl(item.PROJECT_CODE)
                            , V_P_ACCOUNT_CODE:     gfn_nvl(item.ACCOUNT_CODE)

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

            return returnData;

        }
    }

    //전표연결끊기
    const fn_btndisconnection = async function () {

        let chkList = gvwListGrid.getGridDataAll();

        let chkVal = 'N'

        chkList.forEach((item, index) =>{

            if (item.CHECK_YN = 'Y'){
                chkVal = 'Y'
            }

        });

        let nRow = gvwListGrid.getRow();

        if (chkVal == 'N') {
            /*gfn_comAlert("W0005", "선택된 데이터");		//	W0005	{0}이/가 없습니다.
            return;*/

            let rowData = gvwListGrid.getRowData(nRow);

            if (_.isEmpty(rowData)) {
                gfn_comAlert("W0005", "선택된 데이터");		//	W0005	{0}이/가 없습니다.
                return;
            }
        }


        /*let nRow = gvwListGrid.getRow();

        let rowData = gvwListGrid.getRowData(nRow);

        if (_.isEmpty(rowData)) {
            gfn_comAlert("W0005", "선택된 데이터");		//	W0005	{0}이/가 없습니다.
            return;
        }*/

        /************** 포커스에 어떤 스타일을 바꿔야 하는지 확인******************/
        /*gvwList.CustomRowCellEdit -= GvwList_CustomRowCellEdit;
        gvwList.RowCellStyle -= gvwList_RowCellStyle;*/

        gvwListGrid.setCellData(nRow, gvwListGrid.getColRef('DOC_ID'), "",true,true);
        gvwListGrid.setCellData(nRow, gvwListGrid.getColRef('DOC_NAME'), "",true,true);
        /*gvwList.SetRowCellValue(gvwList.FocusedRowHandle, "doc_id", "");
        gvwList.SetRowCellValue(gvwList.FocusedRowHandle, "doc_name", "");*/

        let listGridData = gvwListGrid.getUpdateData(true, 'all');

        if (_.isEmpty(listGridData)){
            gfn_comAlert("W0005", "생성할 건");		//	W0005	{0}이/가 없습니다.
            return;
        }


        if (fn_save(listGridData,'U') == false){
            fn_search();
        }

        /************** 포커스에 어떤 스타일을 바꿔야 하는지 확인******************/
        /*gvwList.RowCellStyle += gvwList_RowCellStyle;
        gvwList.CustomRowCellEdit += GvwList_CustomRowCellEdit;*/

    }

    //정보갱신
    const fn_btnUpdate = async function () {

        strjob_name = 'IF_EC_FI_011';

        if (fn_set_p_common_job_run("RUN", strjob_name) == false){
            return;
        }

        fn_search();
    }

    //불러오기
    const fn_btnImport = async function () {

        strjob_name = 'IF_EC_FI_001';

        if (fn_set_p_common_job_run("RUN", strjob_name) == false){
            return;
        }

        fn_search();
    }

    // 배치프로그램 실행  프로시저
    const fn_set_p_common_job_run = async function (workType, jobName) {

        let DATE_FR 			= gfn_nvl(SBUxMethod.get("SRCH_DATE_FR"));
        let DATE_TO 			= gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));


        var paramObj = {
            V_P_DEBUG_MODE_YN	    : ''
            ,V_P_LANG_ID		    : ''
            ,V_P_COMP_CODE		    : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

            ,V_P_DATE_FR            : DATE_FR
            ,V_P_DATE_TO            : DATE_TO
            ,V_P_JOB_NAME           : jobName
            ,V_P_INTERFACE_RUN      : 'Y' //--Y 인터페이스 실행
            ,V_P_SCHEDULENAME       : ''
            ,V_P_COMMAND            : ''
            ,V_P_ADD_TIME           : 0
            ,V_P_FREQ_TYPE          : 0
            ,V_P_FREQ_INTERVAL      : 0
            ,V_P_STEP_NAME          : ''
            ,V_P_SUBSYSTEM          : ''
            ,V_P_DATABASE_NAME      : ''
            ,V_P_RETRY_ATTEMPTS     : 0
            ,V_P_RETRY_INTERVAL     : ''
            ,V_P_INTERFACE_ID       : jobName

            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''

        };

        const postJsonPromise = gfn_postJSON("/fi/fap/pay/insertFig3100COM.do", {
            getType: 'json',
            workType: workType,
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                    return true;
                }else {
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    return false;
                    /*gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_view();*/
                }

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

    //제외처리
    const fn_btnExclusion = async function (workType) {


        let listData = [];
        listData = await getParamFormS2(workType);

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/fi/fap/pay/insertFig3100S2.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    } else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
                    }

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

    const getParamFormS2 = async function (workType) {

        let returnData = [];

        let iCnt = 0;

        let CBOEXCEPT_CODE = gfnma_multiSelectGet('#EXCEPT_CODE');
        let EXCEPT_REASON  = gfn_nvl(SBUxMethod.get("EXCEPT_REASON"));

        if (!CBOEXCEPT_CODE) {
            gfn_comAlert("W0002", "제외사유");
            return;
        }

        let listGridData = gvwListGrid.getGridDataAll();

        listGridData.forEach((item, index) => {

            if (_.isEqual(item.CHECK_YN, 'Y')) {
                iCnt++;
            }

        });

        if (iCnt == 0) {
            gfn_comAlert("W0005", "처리대상");		//	W0005	{0}이/가 없습니다.
            return false;
            /*SetMessageBox("처리대상이 없습니다.");
            return false;*/
        } else {

            listGridData.forEach((item, index) => {

                if (_.isEqual(item.CHECK_YN, 'Y')) {

                    const param = {

                        cv_count: '0',
                        getType: 'json',
                        workType: workType,
                        params: gfnma_objectToString({

                            V_P_DEBUG_MODE_YN: ''
                            , V_P_LANG_ID: ''
                            , V_P_COMP_CODE: gv_ma_selectedCorpCd
                            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                            ,V_P_APPROVAL_NO     : item.APPROVAL_NO
                            ,V_P_EXCEPT_CODE     : CBOEXCEPT_CODE
                            ,V_P_EXCEPT_REASON   : EXCEPT_REASON
                            ,V_P_EXCEPT_AMOUNT 	 : 0

                            , V_P_FORM_ID: p_formId
                            , V_P_MENU_ID: p_menuId
                            , V_P_PROC_ID: ''
                            , V_P_USERID: ''
                            , V_P_PC: ''
                        })
                    }

                    returnData.push(param);

                }
            });

            return returnData;

        }
    }

    const fn_gvwListAfterRebuild = async function() {
        let gvwListData = gvwListGrid.getGridDataAll();

        for(var i = 0; i < gvwListData.length; i++) {
            let rowData = gvwListGrid.getRowData(i+1);

            if (rowData.CS_CODE_ORG == "")
            {
                if(rowData.CS_CODE == "")
                {
                    gvwListGrid.setRowStyle(i+1, 'data', 'background', '#9fbfdf');  //LightGreen
                }
                else
                {
                    gvwListGrid.setRowStyle(i+1, 'data', 'background', '#c2d6d6'); //Green
                }
            }


            if (gfn_nvl(rowData.ACCOUNT_EMP_CODE) == "" && !rowData.grandtotal) {
                gvwListGrid.setRowStyle(i+1, 'data', 'background', '#FFC0CB'); //Pink
            }
        }
    }
    // 행 추가
    const fn_addRow = async function() {

        let buyer_reg_no    = '';
        let buyer_owner     = '';
        let buyer_name      = '';
        let buyer_address   = '';

        var paramObj = {
            V_P_DEBUG_MODE_YN	    : ''
            ,V_P_LANG_ID		    : ''
            ,V_P_COMP_CODE		    : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

            ,V_P_TAX_SITE_CODE      : ''
            ,V_P_TAX_SITE_NAME      : ''
            ,V_P_BIZ_REGNO          : ''

            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''

        };

        const postJsonPromise = gfn_postJSON("/fi/fap/pay/selectFig3100ORG.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                /*if (data.resultMessage) {
                    alert(data.resultMessage);
                    return true;
                }*/

                let CBOEXCEPT_CODE = gfnma_multiSelectGet('#SRCH_FI_ORG_CODE');

                data.cv_1.forEach((item, index) => {
                    buyer_reg_no    = item.BIZ_REGNO;
                    buyer_owner     = item.CHIEF_NAME;
                    buyer_name      = item.TAX_SITE_NAME;
                    buyer_address   = item.ADDRESS;
                });

                let date = new Date();
                let year  = date.getFullYear();
                let month = ('0' + (date.getMonth() + 1)).slice(-2);
                let day   = ('0' + date.getDate()).slice(-2);
                let hours = ('0' + date.getHours()).slice(-2);
                let minutes = ('0' + date.getMinutes()).slice(-2);
                let seconds = ('0' + date.getSeconds()).slice(-2);

                let curDate = gfn_dateToYmd(new Date());
                let guid = gfnma_generateUUID().replace(/-/g, '').slice(-5);
                let newApprovalNo = 'tmp' + year + month + day + hours + minutes + seconds + guid + '01';

                let rowVal = gvwListGrid.getRow();

                const msg = {
                    CHECK_YN                : '',
                    INTERFACED_FLAG         : '',
                    WRITE_DATE              : curDate,
                    APPROVAL_NO             : newApprovalNo,
                    ISSUE_DATE              : curDate,
                    SEND_DATE               : curDate,
                    SELLER_REG_NO           : '',
                    SELLER_SUB_REG_NO       : '',
                    RID_GUBUN               : '',
                    DOC_ID                  : '',
                    DOC_NAME                : '',
                    DOC_BATCH_NO            : '',
                    PO_DOC_NO               : '',
                    CS_CODE                 : '',
                    SELLER_NAME             : '',
                    SELLER_OWNER            : '',
                    SELLER_ADDRESS          : '',
                    SELLER_BIZ_CATEGORY     : '',
                    SELLER_BIZ_ITEM         : '',
                    SELLER_BIZ_TYPE         : '',
                    BUYER_REG_NO            : buyer_reg_no,
                    BUYER_SUB_REG_NO        : '',
                    BUYER_NAME              : buyer_name,
                    BUYER_OWNER             : buyer_owner,
                    BUYER_BIZ_CATEGORY      : '',
                    BUYER_BIZ_ITEM          : '',
                    BUYER_BIZ_TYPE          : '',
                    BUYER_ADDRESS           : buyer_address,
                    TOTAL_AMT               : 0,
                    TOTAL_TAXABLE_AMT       : 0,
                    TOTAL_VAT_AMT           : 0,
                    DOC_TOTAL_AMT           : 0,
                    DOC_SUPPLY_AMT          : 0,
                    DOC_VAT_AMT             : 0,
                    DIFF_FLAG               : '',
                    EXCEPT_CODE             : '',
                    EXCEPT_REASON           : '',
                    EINVOICE_CATEGORY       : '',
                    EINVOICE_TYPE           : '',
                    MATCH_METHOD            : '',
                    ISSUE_TYPE              : '',
                    NOTE1                   : '',
                    NOTE2                   : '',
                    RECEIPT_OR_BILL         : '',
                    SELLER_EMAIL            : '',
                    BUYER_EMAIL1            : '',
                    BUYER_EMAIL2            : '',
                    ACCOUNT_EMP_NAME        : '',
                    ACCOUNT_EMP_CODE        : '',
                    TXN_DATE                : '',
                    ITEM_NAME               : '',
                    ITEM_SPEC               : '',
                    ITEM_QTY                : 0,
                    ITEM_UNIT_PRICE         : 0,
                    ITEM_TAXABLE_AMT        : 0,
                    ITEM_VAT_AMT            : 0,
                    ITEM_DESC               : '',
                    ROW_STATUS              : '',
                    FI_ORG_CODE             : CBOEXCEPT_CODE,
                    CS_CODE_ORG             : '',

                    status: 'i'
                }

                if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
                    gvwListGrid.addRow(true, msg);
                }else{
                    gvwListGrid.insertRow(rowVal, 'below', msg);
                }



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

    // 행삭제
    const fn_delRow = async function () {

        let rowVal = gvwListGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;

        } else {
            gvwListGrid.deleteRow(rowVal);
        }
    }

    const fn_gvwListDblclick = async function() {
        var nRow = gvwListGrid.getRow();
        var nCol = gvwListGrid.getCol();

        if(nCol == 14) { //공급사 코드

            fn_compopup3(nRow, nCol);
        }

        if(nCol == 48 || nCol ==49) {
            fn_findEmpCodeForGvwList(nRow, (nCol - 1));
        }
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
