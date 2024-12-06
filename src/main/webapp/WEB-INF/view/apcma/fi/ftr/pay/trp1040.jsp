<%
    /**
     * @Class Name 		: trp1040.jsp
     * @Description 	: 지급예정계획 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	이경한		최초 생성
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
    <title>title : 지급예정계획</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>
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
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_print"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table id="srchArea" class="table table-bordered tbl_fixed table-search-ma">
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
                        <th scope="row" class="th_bg_search">APC</th>
                        <td colspan="3" class="td_input">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">지급일자</th>
                        <td class="td_input">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_EXPECTED_PAY_DT"
                                    name="SRCH_EXPECTED_PAY_DT"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                    style="width:100%;"
                                    group-id="panHeader"
                                    required
                            />
                        </td>
                        <td colspan="3"></td>
                        <th scope="row" class="th_bg_search">회계일자</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_DOC_DATE_FR"
                                    name="SRCH_DOC_DATE_FR"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                            />
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <span> ~ </span>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_DOC_DATE_TO"
                                    name="SRCH_DOC_DATE_TO"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">통화</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_CURRENCY_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_CURRENCY_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">반려제외</th>
                        <td colspan="3" class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_OTHER_CURRENCY_YN"
                                    name="SRCH_OTHER_CURRENCY_YN"
                                    uitype="normal"
                                    class="form-control input-sm"
                                    text="반려제외여부"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">지급일자</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_PAY_DATE_FR"
                                    name="SRCH_PAY_DATE_FR"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                            />
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <span> ~ </span>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_PAY_DATE_TO"
                                    name="SRCH_PAY_DATE_TO"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">만기일자</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_DUE_DATE_FR"
                                    name="SRCH_DUE_DATE_FR"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                            />
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <span> ~ </span>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_DUE_DATE_TO"
                                    name="SRCH_DUE_DATE_TO"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">지급보류</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_HOLD_INCLUDE_YN"
                                    name="SRCH_HOLD_INCLUDE_YN"
                                    uitype="normal"
                                    class="form-control input-sm"
                                    text="지급보류 포함여부"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">전표번호</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;">
                            <sbux-input id="SRCH_DOC_NAME_FR" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_MULTI_A_YN"
                                    name="SRCH_MULTI_A_YN"
                                    uitype="normal"
                                    class="form-control input-sm"
                                    text="복수선택"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td colspan="3" class="td_input">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="복수선택" uitype="modal"
                                    target-id="modal-compopup3"
                                    onclick="fn_multiASelect"
                            ></sbux-button>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">지급방법</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_PAY_METHOD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_PAY_METHOD" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_MULTI_M_YN"
                                    name="SRCH_MULTI_M_YN"
                                    uitype="normal"
                                    class="form-control input-sm"
                                    text="복수선택"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td colspan="3" class="td_input">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="복수선택" uitype="modal"
                                    target-id="modal-compopup3"
                                    onclick="fn_multiMSelect"
                            ></sbux-button>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">지급조건</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_PAY_TERM_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_PAY_TERM_CODE" style="width:730px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_MULTI_YN"
                                    name="SRCH_MULTI_YN"
                                    uitype="normal"
                                    class="form-control input-sm"
                                    text="복수선택"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td colspan="3" class="td_input">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="복수선택" uitype="modal"
                                    target-id="modal-compopup3"
                                    onclick="fn_multiSelect"
                            ></sbux-button>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">거래처</th>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_FR">
                            <sbux-input id="SRCH_CS_CODE_FR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_CS_FR">
                            <sbux-input id="SRCH_CS_NAME_FR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_FR">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="..." uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findCsCode('FR')"
                            ></sbux-button>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <span> ~ </span>
                        </td>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_TO">
                            <sbux-input id="SRCH_CS_CODE_TO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_CS_TO">
                            <sbux-input id="SRCH_CS_NAME_TO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_TO">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="..." uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findCsCode('TO')"
                            ></sbux-button>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_MULTI_CS_YN"
                                    name="SRCH_MULTI_CS_YN"
                                    uitype="normal"
                                    class="form-control input-sm"
                                    text="복수선택"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td class="td_input">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="복수거래처" uitype="modal"
                                    target-id="modal-compopup3"
                                    onclick="fn_multiCsSelect"
                            ></sbux-button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>지급예정내역</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btnRelease" name="btnRelease" uitype="normal" text="보류해제" class="btn btn-sm btn-outline-danger" onclick="fn_release" ></sbux-button>
                        <sbux-button id="btnHold" name="btnHold" uitype="normal" text="보류지정" class="btn btn-sm btn-outline-danger" onclick="fn_hold"></sbux-button>
                        <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')"></sbux-button>
                        <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')"></sbux-button>
                        <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')"></sbux-button>
                    </div>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <caption>검색 조건 설정</caption>
                        <colgroup>
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                            <col style="width: 11%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">지급일자</th>
                            <td class="td_input">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PAY_DATE_A"
                                        name="PAY_DATE_A"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                        style="width:100%;"
                                />
                            </td>
                            <td class="td_input">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="일자반영" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_applyDate"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">지급조건</th>
                            <td class="td_input">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_TERM_CODE_A" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="PAY_TERM_CODE_A" style="width:730px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td class="td_input">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="조건반영" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_applyPayTerm"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">지급방법</th>
                            <td class="td_input">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_METHOD_A" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="PAY_METHOD_A" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td class="td_input">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="방법반영" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_applyPayMethod"
                                ></sbux-button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div id="sb-area-gvwList" style="height:220px;"></div>
                </div>

                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>결재내역</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-gvwDetail" style="height:150px;"></div>
                </div>
            </div>
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

<div>
    <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
    <jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    //-----------------------------------------------------------

    var copyMode            = "clear";

    var strCode1List = "";
    var strCode2List = "";
    var strCsCodeList = "";
    var strAccountCodeList = "";

    var jsonDocStatus = []; // 상태
    var jsonPayMethod = []; // 지급방법
    var jsonPayTermCode = []; // 지급조건
    var jsonNoteType = []; // 어음상품종류
    var jsonBankCode = []; // 은행코드
    var jsonComType = []; // 기업분류
    var jsonDocType = []; // 전표유형
    var jsonCurrencyCode = []; // 통화코드
    var jsonSiteCode = []; // 사업장
    var jsonApprType = []; // 구분
    var jsonApprCategory = []; // 결재구분
    var jsonDutyCode = []; // 직책

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;

    var jsonPaymentScheduledList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonApprovalList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // APC
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
                    {caption: "코드",		ref: 'FI_ORG_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 통화
            gfnma_multiSelectInit({
                target			: ['#SRCH_CURRENCY_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF045'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 지급조건
            gfnma_multiSelectInit({
                target: ['#SRCH_PAY_TERM_CODE', '#PAY_TERM_CODE_A']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_COM012_P'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'PAY_TERM_CODE'
                , colLabel: 'PAY_TERM_NAME'
                , columns: [
                    {caption: "코드", ref: 'PAY_TERM_CODE', width: '80px', style: 'text-align:left'},
                    {caption: "명칭", ref: 'PAY_TERM_NAME', width: '200px', style: 'text-align:left'},
                    {caption: "명칭2", ref: 'PAY_TERM_NAME2', width: '250px', style: 'text-align:left'},
                    {caption: "지급방법", ref: 'PAY_METHOD', width: '100px', style: 'text-align:left'},
                    {caption: "지급방법명", ref: 'PAY_METHOD_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 지급방법
            gfnma_multiSelectInit({
                target: ['#SRCH_PAY_METHOD']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIM081_A1'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "코드명", ref: 'CODE_NAME', width: '140px', style: 'text-align:left'},
                    {caption: "은행", ref: 'BANK_CODE', width: '30px', style: 'text-align:left'},
                    {caption: "계좌번호", ref: 'ACCOUNT_NUM', width: '120px', style: 'text-align:left'},
                    {caption: "계좌코드", ref: 'DEPOSIT_CODE', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 지급방법
            gfnma_multiSelectInit({
                target: ['#PAY_METHOD_A']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIM081_A1'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'right' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "코드명", ref: 'CODE_NAME', width: '140px', style: 'text-align:left'},
                    {caption: "은행", ref: 'BANK_CODE', width: '30px', style: 'text-align:left'},
                    {caption: "계좌번호", ref: 'ACCOUNT_NUM', width: '120px', style: 'text-align:left'},
                    {caption: "계좌코드", ref: 'DEPOSIT_CODE', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 상태
            gfnma_setComSelect(['gvwList', 'gvwDetail'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급방법
            gfnma_setComSelect(['gvwList'], jsonPayMethod, 'L_FIM081_B', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급조건
            gfnma_setComSelect(['gvwList'], jsonPayTermCode, 'L_COM012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
            // 어음상품종류
            gfnma_setComSelect(['gvwList'], jsonNoteType, 'L_FIF044', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 은행코드
            gfnma_setComSelect(['gvwList'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 기업분류
            gfnma_setComSelect(['gvwList'], jsonComType, 'L_COM030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['gvwList'], jsonDocType, 'L_FIM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['gvwList'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwList'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['gvwDetail'], jsonApprType, 'L_FIM004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 결재구분
            gfnma_setComSelect(['gvwDetail'], jsonApprCategory, 'L_FIM065', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwDetail'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonPaymentScheduledList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.useinitsorting = true;

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(copyMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrows'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if(copyMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["ROW_ID"],         ref: 'ROW_ID',    type:'output',  	width:'20px',  style:'text-align:left', hidden: true},
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전기일자"],       ref: 'DOC_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["기준일"],       ref: 'PAY_BASE_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["승인일"],       ref: 'POSTING_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급조건"],         ref: 'PAY_TERM_CODE',    type:'output',  	width:'98px',  style:'text-align:left'}, // TODO : P_PAY_DATE_P
            {caption: ["지급조건명"],         ref: 'PAY_TERM_NAME',    type:'output',  	width:'171px',  style:'text-align:left'},
            {caption: ["지급조건명"], 		ref: 'PAY_TERM_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findPayTermCodeForGvwList(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["지급일"],       ref: 'EXPECTED_PAY_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["어음만기일"],       ref: 'BILL_DUE_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["어음만기지급일"],       ref: 'BILL_DUE_PAY_DATE', 		type:'inputdate',  	width:'93px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ['보류'],         ref: 'HOLD_FLAG',				type:'checkbox',        width:'40px', style : 'text-align:center',
                typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }
                , disabled: true
            },
            {caption: ['거래처확정'],         ref: 'CONFIRM_FLAG',				type:'checkbox',        width:'70px', style : 'text-align:center',
                typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }
                , disabled: true
            },
            {caption: ["최초지급조건"], 		ref: 'PAY_TERM_ORIG',   	    type:'combo', style:'text-align:left' ,width: '164px',
                typeinfo: {
                    ref			: 'jsonPayTermCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래처C"],         ref: 'CS_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["지급처명"],         ref: 'CS_NAME',    type:'output',  	width:'187px',  style:'text-align:left'},
            {caption: ["지급방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '70px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급액(통화)"],         ref: 'PAY_ORIGINAL_AMOUNT',    type:'output',  	width:'132px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지급액(환산후)"],         ref: 'PAY_ORIGINAL_AMOUNT',    type:'output',  	width:'132px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["적요"],         ref: 'DOC_DESC',    type:'output',  	width:'270px',  style:'text-align:left'},
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'100px',  style:'text-align:center;text-decoration: underline;cursor:pointer;color:#149fff'},
            {caption: ["거래처계좌순번"],         ref: 'BANK_ACCOUNT_SEQ',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["계좌번호"],         ref: 'ACCOUNT_NUM',    type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["계좌번호"], 		ref: 'ACCOUNT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findAccountForGvwList(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["계좌비고"],         ref: 'BANK_DESC',    type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["은행코드"], 		ref: 'BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '70px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["어음상품종류"], 		ref: 'NOTE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '106px',
                typeinfo: {
                    ref			: 'jsonNoteType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["B2B코드"],         ref: 'BTB_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["사업자번호"],         ref: 'BIZ_REGNO',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["기업분류"], 		ref: 'COM_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonComType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["어음기일"],       ref: 'BILL_DUE_DAY', 		type:'inputdate',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["DOC_ID"],         ref: 'DOC_ID',    type:'output',  	width:'115px',  style:'text-align:left', hidden: true},
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'49px',  style:'text-align:left', hidden: true},
            {caption: ["보류사유"],         ref: 'HOLD_REASON',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APC"],         ref: 'FI_ORG_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["작성자"],         ref: 'USER_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["법인번호"],         ref: 'COMP_REGNO',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["증빙일자"],       ref: 'VOUCHER_RECEIPT_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["ITEM_ID"],         ref: 'ITEM_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["기산일기준"],         ref: 'BASIS_TYPE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결재id"],         ref: 'APPR_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('valuechanged','fn_gvwListValueChanged');
        gvwList.bind('click', 'fn_view');
        gvwList.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonApprovalList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["APPR_ID"],         ref: 'APPR_ID',    type:'output',  	width:'60px',  style:'text-align:left', hidden: true},
            {caption: ["순번"],         ref: 'STEP_SEQ',    type:'output',  	width:'61px',  style:'text-align:left'},
            {caption: ["구분"], 		ref: 'APPR_TYPE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonApprType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["결재구분"], 		ref: 'APPR_CATEGORY',   	    type:'combo', style:'text-align:left' ,width: '101px',
                typeinfo: {
                    ref			: 'jsonApprCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true}, // TODO: P_ORG001
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'100px',  style:'text-align:left'}, // TODO: P_ORG001
            {caption: ["직책"], 		ref: 'DUTY_CODE',   	    type:'combo', style:'text-align:left' ,width: '76px',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true}, // TODO: P_HRI0001
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'100px',  style:'text-align:left'}, // TODO: P_HRI0001
            {caption: ["수임자사번"],         ref: 'PROXY_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["수임자명"],         ref: 'PROXY_EMP_NAME',    type:'output',  	width:'147px',  style:'text-align:left'},
            {caption: ["결재자명"],         ref: 'UPDATE_EMP_NAME',    type:'output',  	width:'184px',  style:'text-align:left'},
            {caption: ["승인결과"], 		ref: 'APPR_STATUS',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["승인일"],       ref: 'APPR_DATE', 		type:'inputdate',  	width:'153px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["결재의견"],         ref: 'APPR_OPINION',    type:'output',  	width:'345px',  style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    var fn_findPayTermCodeForGvwList = function (row) {
        var replaceText0 = "_PAY_TERM_CODE_";
        var replaceText1 = "_PAY_TERM_NAME_";
        var strWhereClause = "AND A.PAY_TERM_CODE LIKE '%" + replaceText0 + "%' AND A.PAY_TERM_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_PAY_DATE_P'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["코드", "명칭"]
            , searchInputFields: ["PAY_TERM_CODE", "PAY_TERM_NAME"]
            , searchInputValues: ['', '']
            , height: '400px'
            , tableHeader: ["지급기일코드", "지급기일명", "지급기준"]
            , tableColumnNames: ["PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD_NAME"]
            , tableColumnWidths: ["80px", "250px", "100px"]
            , itemSelectEvent: function (data) {
                gvwList.setCellData(row, gvwList.getColRef("PAY_TERM_CODE"), data.PAY_TERM_CODE);
                gvwList.setCellData(row, gvwList.getColRef("PAY_TERM_NAME"), data.PAY_TERM_NAME);
                gvwList.setCellData(row, gvwList.getColRef("PAY_METHOD"), data.PAY_METHOD);
                gvwList.setCellData(row, gvwList.getColRef("BASIS_TYPE"), data.BASIS_TYPE);
            },
        });
    }

    var fn_findAccountForGvwList = function (row) {
        var replaceText0 = "_PAY_TERM_CODE_";
        var replaceText1 = "_PAY_TERM_NAME_";
        var strWhereClause = "AND A.PAY_TERM_CODE LIKE '%" + replaceText0 + "%' AND A.PAY_TERM_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_PAY_DATE_P'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["코드", "명칭"]
            , searchInputFields: ["PAY_TERM_CODE", "PAY_TERM_NAME"]
            , searchInputValues: ['', '']
            , height: '400px'
            , tableHeader: ["지급기일코드", "지급기일명", "지급기준"]
            , tableColumnNames: ["SEQ_NAME", "MAIN_FLAG", "BANK_CODE", "BANK_NAME", "BANK_ACCOUNT_NO", "DESCRIPTION",
                "BANK_ACCOUNT_OWNER", "NOTE_TYPE", "BTB_CODE", "CS_CODE", "EFFECT_START_DATE", "EFFECT_END_DATE"]
            , tableColumnWidths: ["70px", "100px", "60px", "120px", "130px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            , itemSelectEvent: function (data) {
                gvwList.setCellData(row, gvwList.getColRef("BANK_ACCOUNT_SEQ"), data.BANK_ACCOUNT_SEQ);
                gvwList.setCellData(row, gvwList.getColRef("BANK_CODE"), data.BANK_CODE);
                gvwList.setCellData(row, gvwList.getColRef("ACCOUNT_NUM"), data.BANK_ACCOUNT_NO);
                gvwList.setCellData(row, gvwList.getColRef("BANK_DESC"), data.DESCRIPTION);
                gvwList.setCellData(row, gvwList.getColRef("ACCOUNT_OWNER"), data.BANK_ACCOUNT_OWNER);
                gvwList.setCellData(row, gvwList.getColRef("NOTE_TYPE"), data.NOTE_TYPE);
                gvwList.setCellData(row, gvwList.getColRef("BTB_CODE"), data.BTB_CODE);
                gvwList.setCellData(row, gvwList.getColRef("BTB_CODE"), data.BTB_CODE);
            },
        });
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if(mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if(mode == "line") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").show();
            copyMode = "cell";
        } else if (mode == "cell") {
            $("#btnClearMode").show();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").hide();
            copyMode = "clear";
        }

        _SBGrid.destroy('gvwList');
        fn_createGvwListGrid();
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function () {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();

        if(nRow < 1) return;
        if(nCol < 1) return;

        if(nCol == gvwList.getColRef("DOC_NAME")) {
            var param = {
                WORK_TYPE : "VIEW",
                DOC_ID : gvwList.getCellData(nRow, gvwList.getColRef("DOC_ID")),
                target : "MA_A20_030_020_150"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        } else {
            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_APPR_ID: gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("APPR_ID"))) == "" ? 0 : parseInt(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("APPR_ID")))),
                V_P_SOURCE_NO: gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("DOC_ID"))),
                V_P_SOURCE_TYPE: gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("DOC_TYPE"))),
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/tri/selectFim3420List.do", {
                getType: 'json',
                workType: 'LIST',
                cv_count: '1',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    jsonApprovalList.length = 0;

                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            APPR_ID: item.APPR_ID,
                            STEP_SEQ: item.STEP_SEQ,
                            APPR_TYPE: item.APPR_TYPE,
                            APPR_CATEGORY: item.APPR_CATEGORY,
                            DEPT_CODE: item.DEPT_CODE,
                            DEPT_NAME: item.DEPT_NAME,
                            DUTY_CODE: item.DUTY_CODE,
                            EMP_CODE: item.EMP_CODE,
                            EMP_NAME: item.EMP_NAME,
                            APPR_STATUS: item.APPR_STATUS,
                            APPR_DATE: item.APPR_DATE,
                            APPR_OPINION: item.APPR_OPINION,
                            UPDATE_USERID: item.UPDATE_USERID,
                            UPDATE_EMP_NAME: item.UPDATE_EMP_NAME,
                            UPDATE_TIME: item.UPDATE_TIME,
                            UPDATE_PC: item.UPDATE_PC,
                            DESCRIPTION: item.DESCRIPTION,
                            PROXY_EMP_CODE: item.PROXY_EMP_CODE,
                            PROXY_EMP_NAME: item.PROXY_EMP_NAME,
                        }

                        jsonApprovalList.push(msg);
                    });

                    gvwDetail.rebuild();
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

    const fn_gvwListValueChanged = async function () {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();

        if (nRow < 0)
            return;

        if (!bEditEventEnabled)
            return;

        if (nCol == gvwList.getColRef("PAY_TERM_CODE")) {
            var ht = [];
            if (gvwList.getCellData(nRow, gvwList.getColRef("BASIS_TYPE")) != "5") {
                ht = fn_getExpectedPayDate(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_TERM_CODE"))), gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("DOC_DATE"))));
            }

            if (ht.length > 0) {
                if (ht[0].hasOwnProperty("EXPECTED_PAY_DATE")) {
                    if (gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) != "X") {
                        bEditEventEnabled = false;

                        gvwList.setCellData(nRow, gvwList.getColRef("EXPECTED_PAY_DATE"), ht[0].hasOwnProperty("EXPECTED_PAY_DATE") ? gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) != "" ? ht[0]["EXPECTED_PAY_DATE"] : "" : "");
                        gvwList.setCellData(nRow, gvwList.getColRef("PAY_BASE_DATE"), ht[0].hasOwnProperty("PAY_BASE_DATE") ? gfn_nvl(ht[0]["PAY_BASE_DATE"]) != "" ? ht[0]["PAY_BASE_DATE"] : "" : "");
                        gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DAY"), ht[0].hasOwnProperty("BILL_DUE_DAY") ? gfn_nvl(ht[0]["BILL_DUE_DAY"]) != "" ? ht[0]["BILL_DUE_DAY"] : "" : "");
                        gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DATE"), ht[0].hasOwnProperty("BILL_DUE_DATE") ? gfn_nvl(ht[0]["BILL_DUE_DATE"]) != "" ? ht[0]["BILL_DUE_DATE"] : "" : "");
                        gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_PAY_DATE"), ht[0].hasOwnProperty("BILL_DUE_PAY_DATE") ? gfn_nvl(ht[0]["BILL_DUE_PAY_DATE"]) != "" ? ht[0]["BILL_DUE_PAY_DATE"] : "" : "");

                        bEditEventEnabled = true;
                    } else if (gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) == "X") {
                        bEditEventEnabled = false;

                        gvwList.setCellData(nRow, gvwList.getColRef("EXPECTED_PAY_DATE"), gvwList.getCellData(nRow, gvwList.getColRef("DOC_DATE")));
                        gvwList.setCellData(nRow, gvwList.getColRef("PAY_BASE_DATE"), gvwList.getCellData(nRow, gvwList.getColRef("DOC_DATE")));
                        gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DAY"), "");
                        gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DATE"), "");
                        gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_PAY_DATE"), "");

                        bEditEventEnabled = true;
                    }
                }
            }
        }

        if (nCol == gvwList.getColRef("EXPECTED_PAY_DATE")) {
            var ht = [];
            var ht2 = [];
            if(gvwList.getCellData(nRow, gvwList.getColRef("BASIS_TYPE")) != "5") {
                ht = fn_getExpectedPayDate(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_TERM_CODE"))), gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("DOC_DATE"))));
                ht2 = fn_getExpectedPayDate(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_TERM_CODE"))), gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("EXPECTED_PAY_DATE"))));

                if (ht.length > 0) {
                    if (ht[0].hasOwnProperty("EXPECTED_PAY_DATE")) {
                        if (gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) == "X") {
                            bEditEventEnabled = false;

                            gvwList.setCellData(nRow, gvwList.getColRef("PAY_BASE_DATE"), gvwList.getCellData(nRow, gvwList.getColRef("EXPECTED_PAY_DATE")));
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DAY"), ht2[0].hasOwnProperty("BILL_DUE_DAY") ? gfn_nvl(ht2[0]["BILL_DUE_DAY"]) != "" ? ht2[0]["BILL_DUE_DAY"] : "" : "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DATE"), ht2[0].hasOwnProperty("BILL_DUE_DATE") ? gfn_nvl(ht2[0]["BILL_DUE_DATE"]) != "" ? ht2[0]["BILL_DUE_DATE"] : "" : "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_PAY_DATE"), ht2[0].hasOwnProperty("BILL_DUE_PAY_DATE") ? gfn_nvl(ht2[0]["BILL_DUE_PAY_DATE"]) != "" ? ht2[0]["BILL_DUE_PAY_DATE"] : "" : "");

                            bEditEventEnabled = true;
                        }
                    }
                }
            }
        }

        if (nCol == gvwList.getColRef("PAY_BASE_DATE")) {
            var ht = [];

            if (gvwList.getCellData(nRow, gvwList.getColRef("BASIS_TYPE")) != "5") {
                ht = fn_getExpectedPayDate(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_TERM_CODE"))), gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_BASE_DATE"))), "PAY_BASE_DATE");

                if (ht.length > 0) {
                    if (ht[0].hasOwnProperty("EXPECTED_PAY_DATE")) {
                        if (gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) != "X") {
                            gvwList.setCellData(nRow, gvwList.getColRef("EXPECTED_PAY_DATE"), ht[0].hasOwnProperty("EXPECTED_PAY_DATE") ? gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) != "" ? ht[0]["EXPECTED_PAY_DATE"] : "" : "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DAY"), ht[0].hasOwnProperty("BILL_DUE_DAY") ? gfn_nvl(ht[0]["BILL_DUE_DAY"]) != "" ? ht[0]["BILL_DUE_DAY"] : "" : "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DATE"), ht[0].hasOwnProperty("BILL_DUE_DATE") ? gfn_nvl(ht[0]["BILL_DUE_DATE"]) != "" ? ht[0]["BILL_DUE_DATE"] : "" : "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_PAY_DATE"), ht[0].hasOwnProperty("BILL_DUE_PAY_DATE") ? gfn_nvl(ht[0]["BILL_DUE_PAY_DATE"]) != "" ? ht[0]["BILL_DUE_PAY_DATE"] : "" : "");
                        } else if (gfn_nvl(ht[0]["EXPECTED_PAY_DATE"]) == "X") {
                            gvwList.setCellData(nRow, gvwList.getColRef("EXPECTED_PAY_DATE"), gvwList.getCellData(nRow, gvwList.getColRef("PAY_BASE_DATE")));
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DAY"), "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_DATE"), "");
                            gvwList.setCellData(nRow, gvwList.getColRef("BILL_DUE_PAY_DATE"), "");
                        }
                    }
                }
            }
        }

        SaveButton = true;
    }

    const fn_getExpectedPayDate = async function (strpay_term_code, strtxn_date, strdate_type) {
        var retrunData = [];

        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_PAY_TERM_CODE : strpay_term_code,
            V_P_TXN_DATE : strtxn_date,
            V_P_OUTPUT_TYPE : '',
            V_P_BASE_CALC_TYPE : gfn_nvl(strdate_type) == "" ? '' : strdate_type,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/getExpectedPayDate.do", {
            getType: 'json',
            workType: 'Q2',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                data.cv_1.forEach((item, index) => {
                    var msg = {
                        EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                        PAY_BASE_DATE : item.PAY_BASE_DATE,
                        BILL_DUE_DAY : item.BILL_DUE_DAY,
                        BILL_DUE_DATE : item.BILL_DUE_DATE,
                        BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE
                    }

                    retrunData.push(msg);
                });

                return retrunData;
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

    const fn_multiMSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strCode1List = "";
                data.forEach((item, index) => {
                    strCode1List += item + "|";
                });

                if (strCode1List.length > 0)
                    strCode1List = strCode1List.substring(0, strCode1List.length - 1);

                if (strCode1List.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_M_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_M_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_multiASelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strAccountCodeList = "";
                data.forEach((item, index) => {
                    strAccountCodeList += item + "|";
                });

                if (strAccountCodeList.length > 0)
                    strAccountCodeList = strAccountCodeList.substring(0, strAccountCodeList.length - 1);

                if (strAccountCodeList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_A_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_A_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_multiSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strCode2List = "";
                data.forEach((item, index) => {
                    strCode2List += item + "|";
                });

                if (strCode2List.length > 0)
                    strCode2List = strCode2List.substring(0, strCode2List.length - 1);

                if (strCode2List.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_multiCsSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strCsCodeList = "";
                data.forEach((item, index) => {
                    strCsCodeList += item + "|";
                });

                if (strCsCodeList.length > 0)
                    strCsCodeList = strCsCodeList.substring(0, strCsCodeList.length - 1);

                if (strCsCodeList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_CS_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_CS_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_findCsCode = function(target) {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_"+target));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_CS_NAME_"+target));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' AND BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_PURCHASE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명", "사업자번호" ]
            ,searchInputFields		: ["CS_CODE", "CS_NAME", "BIZ_REGNO"]
            ,searchInputValues		: [searchCode, searchName, ""]
            ,searchInputTypes		: ["input", "input", "input"]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소", "전화", "팩스", "지급기준", "지급기준명", "지급방법", "통화"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS", "ADDRESS", "TEL", "FAX", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_CS_NAME_'+target, data.CS_NAME);
                SBUxMethod.set('SRCH_CS_CODE_'+target, data.CS_CODE);
            },
        });
    }

    const fn_applyDate = async function() {
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        let strpay_date_a = gfn_nvl(SBUxMethod.get("PAY_DATE_A"));

        if (gvwListCheckedList.length == 0) {
            gfn_comAlert("E0000", "변경하고자 하는 대상을 선택 후 일자변경을 적용하십시오.");
        } else {
            gvwListCheckedList.forEach((item, index) => {
                gvwList.setCellData(item, "EXPECTED_PAY_DATE", strpay_date_a);
            });
        }
    }

    const fn_applyPayTerm = async function() {
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        let strpay_term_code_a = gfn_nvl(gfnma_multiSelectGet('#PAY_TERM_CODE_A'));

        if (gvwListCheckedList.length == 0) {
            gfn_comAlert("E0000", "변경하고자 하는 대상을 선택 후 조건변경을 적용하십시오.");
        } else {
            gvwListCheckedList.forEach((item, index) => {
                gvwList.setCellData(item, "PAY_TERM_CODE", strpay_term_code_a);
            });
        }
    }

    const fn_applyPayMethod = async function() {
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        let strpay_method_a = gfn_nvl(gfnma_multiSelectGet('#PAY_METHOD_A'));

        if (gvwListCheckedList.length == 0) {
            gfn_comAlert("E0000", "변경하고자 하는 대상을 선택 후 방법변경을 적용하십시오.");
        } else {
            gvwListCheckedList.forEach((item, index) => {
                gvwList.setCellData(item, "PAY_METHOD", strpay_method_a);
            });
        }
    }

    const fn_release = async function() {
        if (!SBUxMethod.validateRequired( {group_id: 'panHeader'} ) || !validateRequired("panHeader")) {
            return;
        }

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        if (gvwListCheckedList.length == 0)
            return;

        var numhold_count = 0;

        gvwListCheckedList.forEach((item, index) => {
            if(gvwList.getCellData(item, gvwList.getColRef("HOLD_FLAG")) == "Y") {
                numhold_count += 1;
            }
        });

        if (numhold_count > 0) {
            let strdoc_id_d = "";
            let stritem_id_d = "";
            let strhold_reason_d = "";
            let isChecked = false;

            gvwListCheckedList.forEach((item, index) => {
                if(gvwList.getCellData(item, gvwList.getColRef("HOLD_FLAG")) == "Y" && gvwList.getCellData(item, gvwList.getColRef("DOC_STATUS")) == "6") {
                    isChecked = true;
                }
            });

            if (!isChecked) {
                gfn_comAlert("E0000", "보류해제할 대상이 없습니다.");
                return false;
            }

            gvwListCheckedList.forEach((item, index) => {
                if(gvwList.getCellData(item, gvwList.getColRef("HOLD_FLAG")) == "Y" && gvwList.getCellData(item, gvwList.getColRef("DOC_STATUS")) == "6") {
                    strdoc_id_d += gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("DOC_ID"))) + "|";
                    stritem_id_d += gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("ITEM_ID"))) + "|";
                    strhold_reason_d += "B" + "|";
                }
            });

            strdoc_id_d = strdoc_id_d.substring(0, strdoc_id_d.length - 1);
            stritem_id_d = stritem_id_d.substring(0, stritem_id_d.length - 1);
            strhold_reason_d = strhold_reason_d.substring(0, strhold_reason_d.length - 1);

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE : gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')),
                V_P_DOC_DATE : '',
                V_P_DOC_ID : strdoc_id_d,
                V_P_ITEM_ID : stritem_id_d,
                V_P_HOLD_REASON : strhold_reason_d,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertTrp1040Sub.do", {
                getType				: 'json',
                workType			: 'RELEASE',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

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
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        } else {
            gfn_comAlert("E0000", "선택된 보류건이 없습니다.");
            return;
        }
    }

    const fn_hold = async function() {
        if (!SBUxMethod.validateRequired( {group_id: 'panHeader'} ) || !validateRequired("panHeader")) {
            return;
        }

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        if (gvwListCheckedList.length == 0)
            return;

        var numnoreason_count = 0;

        gvwListCheckedList.forEach((item, index) => {
            if(gvwList.getCellData(item, gvwList.getColRef("HOLD_FLAG")) == "N") {
                numnoreason_count += 1;
            }
        });

        if (numnoreason_count == 0) {
            gfn_comAlert("E0000", "보류지정 사유는 필수 입니다.");
            return;
        } else {
            let strdoc_id_d = "";
            let stritem_id_d = "";
            let strhold_reason_d = "";
            let isChecked = false;

            gvwListCheckedList.forEach((item, index) => {
                if(gvwList.getCellData(item, gvwList.getColRef("HOLD_FLAG")) == "N" && gvwList.getCellData(item, gvwList.getColRef("DOC_STATUS")) == "6") {
                    isChecked = true;
                }
            });

            if (!isChecked) {
                gfn_comAlert("E0000", "보류지정할 대상이 없습니다.");
                return false;
            }

            gvwListCheckedList.forEach((item, index) => {
                if(gvwList.getCellData(item, gvwList.getColRef("HOLD_FLAG")) == "N" && gvwList.getCellData(item, gvwList.getColRef("DOC_STATUS")) == "6") {
                    strdoc_id_d += gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("DOC_ID"))) + "|";
                    stritem_id_d += gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("ITEM_ID"))) + "|";
                    strhold_reason_d += "B" + "|";
                }
            });

            strdoc_id_d = strdoc_id_d.substring(0, strdoc_id_d.length - 1);
            stritem_id_d = stritem_id_d.substring(0, stritem_id_d.length - 1);
            strhold_reason_d = strhold_reason_d.substring(0, strhold_reason_d.length - 1);

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE : gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')),
                V_P_DOC_DATE : '',
                V_P_DOC_ID : strdoc_id_d,
                V_P_ITEM_ID : stritem_id_d,
                V_P_HOLD_REASON : strhold_reason_d,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertTrp1040Sub.do", {
                getType				: 'json',
                workType			: 'UNRELEASE',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

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
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwDetailGrid();
        await fn_onload();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_save = async function() {
        let updatedData = gvwList.getUpdateData(true, 'u');
        if(updatedData.length == 0)
            return;

        let stritem_id = "";
        let strexpected_pay_date = "";
        let strpay_base_date = "";
        let strpay_term_code = "";
        let strpay_method = "";
        let strbill_due_day = "";
        let strbill_due_date = "";
        let strbill_due_pay_date = "";
        let strbank_account_seq = "";

        updatedData.forEach((item, index) => {
            stritem_id += gfn_nvl(item.data.ITEM_ID) + "|";
            strexpected_pay_date += gfn_nvl(item.data.EXPECTED_PAY_DATE) + "|";
            strpay_base_date += gfn_nvl(item.data.PAY_BASE_DATE) + "|";
            strpay_term_code += gfn_nvl(item.data.PAY_TERM_CODE) + "|";
            strpay_method += gfn_nvl(item.data.PAY_METHOD) + "|";
            strbill_due_day += gfn_nvl(item.data.BILL_DUE_DAY) + "|";
            strbill_due_date += gfn_nvl(item.data.BILL_DUE_DATE) + "|";
            strbill_due_pay_date += gfn_nvl(item.data.BILL_DUE_PAY_DATE) + "|";
            strbank_account_seq += gfn_nvl(item.data.BANK_ACCOUNT_SEQ) + "|";
        });

        if (stritem_id != "") {
            stritem_id = stritem_id.substring(0, stritem_id.length - 1);
            strexpected_pay_date = strexpected_pay_date.substring(0, strexpected_pay_date.length - 1);
            strpay_base_date = strpay_base_date.substring(0, strpay_base_date.length - 1);
            strpay_term_code = strpay_term_code.substring(0, strpay_term_code.length - 1);
            strpay_method = strpay_method.substring(0, strpay_method.length - 1);
            strbill_due_day = strbill_due_day.substring(0, strbill_due_day.length - 1);
            strbill_due_date = strbill_due_date.substring(0, strbill_due_date.length - 1);
            strbill_due_pay_date = strbill_due_pay_date.substring(0, strbill_due_pay_date.length - 1);
            strbank_account_seq = strbank_account_seq.substring(0, strbank_account_seq.length - 1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_ITEM_ID : stritem_id,
            V_P_EXPECTED_PAY_DATE : strexpected_pay_date,
            V_P_PAY_BASE_DATE : strpay_base_date,
            V_P_PAY_TERM_CODE : strpay_term_code,
            V_P_PAY_METHOD : strpay_method,
            V_P_BILL_DUE_DAY : strbill_due_day,
            V_P_BILL_DUE_DATE : strbill_due_date,
            V_P_BILL_DUE_PAY_DATE : strbill_due_pay_date,
            V_P_BANK_ACCOUNT_SEQ : strbank_account_seq,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/updateTrp1040List.do", {
            getType				: 'json',
            workType			: 'U',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

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
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_onload = async function() {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        SBUxMethod.set("SRCH_EXPECTED_PAY_DT", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_HOLD_INCLUDE_YN", "Y");
        await gfnma_multiSelectSet('#SRCH_CURRENCY_TYPE', 'SUB_CODE', 'CODE_NAME', "1");

        SBUxMethod.set("SRCH_MULTI_YN", "N");
        SBUxMethod.set("SRCH_MULTI_CS_YN", "N");
        SBUxMethod.set("SRCH_MULTI_M_YN", "N");
        SBUxMethod.set("SRCH_MULTI_A_YN", "N");
        SBUxMethod.set("SRCH_OTHER_CURRENCY_YN", "Y");

        await fn_search();
    }

    const fn_search = async function() {
        if (!SBUxMethod.validateRequired( {group_id: 'panHeader'} ) || !validateRequired("panHeader")) {
            return;
        }

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        let EXPECTED_PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_EXPECTED_PAY_DT"));
        let PAY_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE_FR"));
        let PAY_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE_TO"));
        let DUE_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_DUE_DATE_FR"));
        let DUE_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_DUE_DATE_TO"));
        let DOC_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_DOC_DATE_FR"));
        let DOC_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_DOC_DATE_TO"));
        let PAY_METHOD = SBUxMethod.get("SRCH_MULTI_M_YN").SRCH_MULTI_M_YN == "N" ? gfn_nvl(SBUxMethod.get("SRCH_PAY_METHOD")) : "";
        let PAY_TERM_CODE = SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN == "N" ? gfn_nvl(SBUxMethod.get("SRCH_PAY_TERM_CODE")) : "";
        let PAY_METHOD_D = SBUxMethod.get("SRCH_MULTI_M_YN").SRCH_MULTI_M_YN == "N" ? "" : strCode1List;
        let PAY_TERM_CODE_D = SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN == "N" ? "" : strCode2List;
        let HOLD_INCLUDE_YN = gfn_nvl(SBUxMethod.get("SRCH_HOLD_INCLUDE_YN").SRCH_HOLD_INCLUDE_YN);
        let RETURN_INCLUDE_YN = gfn_nvl(SBUxMethod.get("SRCH_OTHER_CURRENCY_YN").SRCH_OTHER_CURRENCY_YN);
        let CURRENCY_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_CURRENCY_TYPE'));
        let CS_CODE_FR = gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_FR"));
        let CS_CODE_TO = gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_TO"));
        let CS_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_CS_YN").SRCH_MULTI_CS_YN) == "Y" ? strCsCodeList : "";
        let DOC_NAME = gfn_nvl(SBUxMethod.get("SRCH_MULTI_A_YN").SRCH_MULTI_A_YN) == "N" ? gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME")) : strAccountCodeList;

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_EXPECTED_PAY_DATE : EXPECTED_PAY_DATE,
            V_P_PAY_DATE_FR : PAY_DATE_FR,
            V_P_PAY_DATE_TO : PAY_DATE_TO,
            V_P_DUE_DATE_FR : DUE_DATE_FR,
            V_P_DUE_DATE_TO : DUE_DATE_TO,
            V_P_DOC_DATE_FR : DOC_DATE_FR,
            V_P_DOC_DATE_TO : DOC_DATE_TO,
            V_P_PAY_METHOD : PAY_METHOD,
            V_P_PAY_TERM_CODE : PAY_TERM_CODE,
            V_P_PAY_METHOD_D : PAY_METHOD_D,
            V_P_PAY_TERM_CODE_D : PAY_TERM_CODE_D,
            V_P_HOLD_INCLUDE_YN : HOLD_INCLUDE_YN,
            V_P_RETURN_INCLUDE_YN : RETURN_INCLUDE_YN,
            V_P_CURRENCY_TYPE : CURRENCY_TYPE,
            V_P_CS_CODE_FR : CS_CODE_FR,
            V_P_CS_CODE_TO : CS_CODE_TO,
            V_P_CS_CODE_D : CS_CODE_D,
            V_P_DOC_NAME : DOC_NAME,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectTrp1040List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonPaymentScheduledList.length = 0;

                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN : item.CHECK_YN,
                        ROW_ID : item.ROW_ID,
                        DOC_STATUS : item.DOC_STATUS,
                        WRITE_DATE : item.WRITE_DATE,
                        PAY_BASE_DATE : item.PAY_BASE_DATE,
                        EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                        DOC_DATE : item.DOC_DATE,
                        CS_CODE : item.CS_CODE,
                        CS_NAME : item.CS_NAME,
                        PAY_TERM_CODE : item.PAY_TERM_CODE,
                        PAY_TERM_NAME : item.PAY_TERM_NAME,
                        BASIS_TYPE : item.BASIS_TYPE,
                        PAY_TERM_ORIG : item.PAY_TERM_ORIG,
                        DOC_ID : item.DOC_ID,
                        DOC_TYPE : item.DOC_TYPE,
                        ITEM_ID : item.ITEM_ID,
                        DOC_BATCH_NO : item.DOC_BATCH_NO,
                        DOC_NUM : item.DOC_NUM,
                        DOC_NAME : item.DOC_NAME,
                        CURRENCY_CODE : item.CURRENCY_CODE,
                        PAY_CURRENCY_CODE : item.PAY_CURRENCY_CODE,
                        EXCHANGE_RATE : item.EXCHANGE_RATE,
                        REMAIN_ORIGINAL_AMOUNT : item.REMAIN_ORIGINAL_AMOUNT,
                        REMAIN_FUNCTIONAL_AMOUNT : item.REMAIN_FUNCTIONAL_AMOUNT,
                        REMAIN_FUNCTIONAL_AMT_CONV : item.REMAIN_FUNCTIONAL_AMT_CONV,
                        PAY_ORIGINAL_AMOUNT : item.PAY_ORIGINAL_AMOUNT,
                        PAY_FUNCTIONAL_AMOUNT : item.PAY_FUNCTIONAL_AMOUNT,
                        PAY_FUNCTIONAL_AMT_CONV : item.PAY_FUNCTIONAL_AMT_CONV,
                        PAY_EXCHANGE_PL_AMT : item.PAY_EXCHANGE_PL_AMT,
                        ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                        FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT,
                        PAYEE_CODE : item.PAYEE_CODE,
                        VOUCHER_NO : item.VOUCHER_NO,
                        VOUCHER_TYPE : item.VOUCHER_TYPE,
                        INVOICE_STATUS_CODE : item.INVOICE_STATUS_CODE,
                        AP_PAY_TERM_ORIG : item.AP_PAY_TERM_ORIG,
                        AP_PAY_TERM : item.AP_PAY_TERM,
                        CS_PAY_TERM : item.CS_PAY_TERM,
                        PAY_METHOD : item.PAY_METHOD,
                        DOC_DESC : item.DOC_DESC,
                        HOLD_FLAG : item.HOLD_FLAG,
                        HOLD_REASON : item.HOLD_REASON,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        COST_CENTER_CODE : item.COST_CENTER_CODE,
                        COST_CENTER_NAME : item.COST_CENTER_NAME,
                        PROJECT_CODE : item.PROJECT_CODE,
                        PROJECT_NAME : item.PROJECT_NAME,
                        AP_ACC_CODE : item.AP_ACC_CODE,
                        AP_ACC_NAME : item.AP_ACC_NAME,
                        AR_ACC_CODE : item.AR_ACC_CODE,
                        AR_ACC_NAME : item.AR_ACC_NAME,
                        EXCHANGE_GAIN_ACCOUNT : item.EXCHANGE_GAIN_ACCOUNT,
                        EXCHANGE_GAIN_ACCOUNT_NAME : item.EXCHANGE_GAIN_ACCOUNT_NAME,
                        EXCHANGE_LOSS_ACCOUNT : item.EXCHANGE_LOSS_ACCOUNT,
                        EXCHANGE_LOSS_ACCOUNT_NAME : item.EXCHANGE_LOSS_ACCOUNT_NAME,
                        BANK_ACCOUNT_SEQ : item.BANK_ACCOUNT_SEQ,
                        BANK_CODE : item.BANK_CODE,
                        BANK_CS_CODE : item.BANK_CS_CODE,
                        ACCOUNT_NUM : item.ACCOUNT_NUM,
                        BANK_DESC : item.BANK_DESC,
                        EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        SITE_CODE : item.SITE_CODE,
                        SOURCE_RECORD_COUNT : item.SOURCE_RECORD_COUNT,
                        COM_TYPE : item.COM_TYPE,
                        BIZ_REGNO : item.BIZ_REGNO,
                        BILL_DUE_DAY : item.BILL_DUE_DAY,
                        BILL_DUE_DATE : item.BILL_DUE_DATE,
                        BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE,
                        USER_NAME : item.USER_NAME,
                        NOTE_TYPE : item.NOTE_TYPE,
                        BTB_CODE : item.BTB_CODE,
                        CONFIRM_FLAG : item.CONFIRM_FLAG,
                        VOUCHER_RECEIPT_DATE : item.VOUCHER_RECEIPT_DATE,
                        COMP_REGNO : item.COMP_REGNO,
                        POSTING_DATE : item.POSTING_DATE,
                        APPR_ID : item.APPR_ID,
                    }

                    jsonPaymentScheduledList.push(msg);
                });

                gvwList.rebuild();
                document.querySelector('#listCount').innerText = jsonPaymentScheduledList.length;
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>