<%
    /**
     * @Class Name 		: fig3400.jsp
     * @Description 	: 송장등록및조회(매출) 화면
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
    <title>title : 송장등록및조회(매출)</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
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
					<sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="출력" onclick="fn_btnPrint"></sbux-button>
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
							<th scope="row" class="th_bg">APC</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<div class="dropdown">
									<button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<font>선택</font>
										<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
									</div>
								</div>
							</td>
                            <td></td>
                            <th scope="row" class="th_bg">상태</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_DOC_STATUS" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_DOC_STATUS" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td colspan="5" class="td_input" style="border-right:hidden;">
                                <sbux-checkbox
                                        uitype="normal"
                                        id="SRCH_APPR_ONLY_FLAG"
                                        name="SRCH_APPR_ONLY_FLAG"
                                        uitype="normal"
                                        class="form-control input-sm check"
                                        text="결재건만"
                                        true-value="Y" false-value="N"
                                />
                            </td>
                            <th scope="row" class="th_bg">거래처</th>
                            <td colspan="3" class="td_input" data-group="SRCH_PAYER">
                                <sbux-input id="SRCH_PAYER_CODE" name="SRCH_PAYER_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_PAYER_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_PAYER">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findPayerName"
                                ></sbux-button>
                            </td>
						</tr>
						<tr>
                            <th scope="row" class="th_bg">작성부서</th>
                            <td colspan="3" class="td_input" data-group="SRCH_CREATED_DEPT">
                                <sbux-input id="SRCH_CREATED_DEPT_CODE" name="SRCH_CREATED_DEPT_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_CREATED_DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_CREATED_DEPT">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findCreatedDeptName"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">청구부서</th>
                            <td colspan="3" class="td_input" data-group="SRCH_PAYEE_DEPT">
                                <sbux-input id="SRCH_PAYEE_DEPT_CODE" name="SRCH_PAYEE_DEPT_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_PAYEE_DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_PAYEE_DEPT">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findPayeeDeptName"
                                ></sbux-button>
                            </td>
                            <td colspan="5" class="td_input" style="border-right:hidden;">
                                <sbux-checkbox
                                        uitype="normal"
                                        id="SRCH_REVERSE_FLAG"
                                        name="SRCH_REVERSE_FLAG"
                                        uitype="normal"
                                        class="form-control input-sm check"
                                        text="역분개제외여부"
                                        true-value="Y" false-value="N"
                                />
                            </td>
                            <th scope="row" class="th_bg">전표구분</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_DOC_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_DOC_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
						</tr>
						 <tr>
                             <th scope="row" class="th_bg">년월</th>
                             <td class="td_input" style="border-right:hidden;">
                                 <sbux-datepicker
                                         uitype="popup"
                                         id="SRCH_PERIOD_YYYYMM"
                                         name="SRCH_PERIOD_YYYYMM"
                                         date-format="yyyy-mm"
                                         datepicker-mode="month"
                                         class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                         style="width:100%;"
                                         onchange="fn_payDate"
                                 />
                             </td>
                             <td colspan="3"></td>
							<th scope="row" class="th_bg">거래일자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_TXN_DATE_FROM"
										name="SRCH_TXN_DATE_FROM"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
										style="width:100%;"
                                        group-id="panHeader"
                                        required
								/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<span> ~ </span>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_TXN_DATE_TO"
										name="SRCH_TXN_DATE_TO"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
										style="width:100%;"
                                        group-id="panHeader"
                                        required
								/>
							</td>
                             <td></td>
                            <th scope="row" class="th_bg">작성자</th>
                            <td colspan="3" class="td_input" data-group="SRCH_CREATED_BY">
                                <sbux-input id="SRCH_CREATED_BY_CODE" name="SRCH_CREATED_BY_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_CREATED_BY_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_CREATED_BY">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findCreatedByName"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">실사용자</th>
                            <td colspan="3" class="td_input" data-group="SRCH_PAYEE">
                                <sbux-input id="SRCH_PAYEE_CODE" name="SRCH_PAYEE_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_PAYEE_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_PAYEE">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findPayeeName"
                                ></sbux-button>
                            </td>
						</tr>
                        <tr>
                            <th scope="row" class="th_bg">전표번호</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_DOC_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td></td>
                            <td class="td_input">
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
                                        text="복수전표" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_multiSelect"
                                ></sbux-button>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">제목</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                </div>
				<div class="row">
                    <div>
                        <sbux-tabs id="idxTabMaster" name="idxTabMaster" uitype="normal" is-scrollable="false" jsondata-ref="jsonMasterTabData">
                        </sbux-tabs>
                        <div class="tab-content">
                            <div id="tabPageEx1">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>매출송장리스트</span>
                                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                        </li>
                                    </ul>
                                    <div class="ad_tbl_toplist">
                                        <sbux-button id="btnReject" name="btnReject" uitype="normal" text="일괄반려" class="btn btn-sm btn-outline-danger" onclick="fn_reject" style="float: right;"></sbux-button>
                                        <sbux-button id="btnApprove" name="btnApprove" uitype="normal" text="일괄결재" class="btn btn-sm btn-outline-danger" onclick="fn_approve" style="float: right;"></sbux-button>
                                        <sbux-input id="APPR_OPINION" uitype="text" placeholder="" class="form-control input-sm" style="float: right; margin-right: 5px;"></sbux-input>
                                        <span style="float: right; padding-top: 7px; margin-right: 10px;">결재의견</span>
                                    </div>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwMaster" style="height:400px;"></div>
                                </div>
                                <div>
                                    <sbux-tabs id="idxTabSub" name="idxTabSub" uitype="normal" is-scrollable="false" jsondata-ref="jsonSubTabData">
                                    </sbux-tabs>
                                    <div class="tab-content">
                                        <div id="tpgAccount">
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li><span>회계처리</span></li>
                                                </ul>
                                            </div>
                                            <div>
                                                <div id="sb-area-gvwAccount" style="height:150px;"></div>
                                            </div>
                                        </div>
                                        <div id="tpgApply">
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li><span>반제/역분개 내역</span></li>
                                                </ul>
                                            </div>
                                            <div>
                                                <div id="sb-area-gvwPayment" style="height:150px;"></div>
                                            </div>
                                        </div>
                                        <div id="tpgApprove">
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li><span>결재이력</span></li>
                                                </ul>
                                            </div>
                                            <div>
                                                <div id="sb-area-gvwApprove" style="height:150px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tabPageEx2">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>증빙정보입력</span></li>
                                    </ul>
                                    <div class="ad_tbl_toplist">
                                        <sbux-button id="btnGetVoucherNo" name="btnGetVoucherNo" uitype="normal" text="증빙번호 가져오기" class="btn btn-sm btn-outline-danger" onclick="fn_getVoucherNo" style="float: right;"></sbux-button>
                                    </div>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwInfo" style="height:650px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
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
<!-- 리포트 출력 팝업 -->
<div>
	<sbux-modal style="width:600px" id="modal-comPopFig1000Report" name="modal-comPopFig1000Report" uitype="middle" header-title="" body-html-id="body-modal-comPopFig1000Report" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-comPopFig1000Report">
	<jsp:include page="../../../com/popup/comPopFig1000Report.jsp"></jsp:include>
</div>	
</body>

<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_empCd = '${loginVO.maEmpCode}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    //-----------------------------------------------------------

    var strDocNameList = "";

    var jsonFiOrgCode = []; // APC
    var jsonDocStatus = []; // 전표상태
    var jsonDocType = []; // 전표구분
    var jsonPayMethod = []; // 수금방법
    var jsonCurrencyCode = []; // 통화코드
    var jsonCreditArea = []; // 여신영역
    var jsonVoucherType = []; // 증빙유형
    var jsonUser = []; // 사용자
    var jsonSiteCode = []; // 사업장
    var jsonLineType = []; // LINE
    var jsonAccountCode = []; // 계정코드
    var jsonDebitCredit = []; // 차/대
    var jsonUom = []; // 단위
    var jsonCostCenterCode = []; // 원가중심코드
    var jsonAccItemCode = []; // 관리항목코드
    var jsonStatusCode = []; // 상태코드
    var jsonApprType = []; // 구분
    var jsonApprCategory = []; // 결재구분
    var jsonDutyCode = []; // 직책
    var jsonApprStatus = []; // 승인결과

    //grid 초기화
    var gvwMaster; 			// 그리드를 담기위한 객체 선언
    var gvwInfo;
    var gvwAccount;
    var gvwPayment;
    var gvwApprove;

    var jsonSalesInvoiceList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonInfotList = [];
    var jsonAccountList = [];
    var jsonPaymentList = [];
    var jsonDetailList = [];


    // Tab Data
    var jsonMasterTabData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "매출송장", "targetid" : "tabPageEx1", "targetvalue" : "매출송장" },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "증빙정보", "targetid" : "tabPageEx2", "targetvalue" : "증빙정보" },
    ];

    // Tab Data
    var jsonSubTabData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "회계처리", "targetid" : "tpgAccount", "targetvalue" : "회계처리"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "반제/역분개 내역", "targetid" : "tpgApply", "targetvalue" : "반제/역분개 내역" },
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "결재이력", "targetid" : "tpgApprove", "targetvalue" : "결재이력" },
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
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
            // 상태
            gfnma_setComSelect(['gvwMaster', 'gvwAccount', 'gvwPayment', 'gvwInfo'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_DOC_STATUS']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIG002'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "전표상태", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 전표구분
            gfnma_setComSelect(['gvwMaster', 'gvwAccount', 'gvwPayment', 'gvwInfo'], jsonDocType, 'L_FIM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_DOC_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM051_AR'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 수금방법
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonPayMethod, 'L_FIM081', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwMaster', 'gvwPayment', 'gvwInfo'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 여신영역
            gfnma_setComSelect(['gvwMaster'], jsonCreditArea, 'L_ORG020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 증빙유형
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonUser, 'L_USER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // LINE
            gfnma_setComSelect(['gvwAccount'], jsonLineType, 'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차/대
            gfnma_setComSelect(['gvwAccount'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 단위
            gfnma_setComSelect(['gvwAccount'], jsonUom, 'L_LGS001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'UNIT_CODE', 'UNIT_NAME', 'Y', ''),
            // 원가중심점코드
            gfnma_setComSelect(['gvwAccount'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwAccount'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
            // 상태코드
            gfnma_setComSelect(['gvwPayment'], jsonStatusCode, 'L_FIM074', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['gvwApprove'], jsonApprType, 'L_FIM004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 결재구분
            gfnma_setComSelect(['gvwApprove'], jsonApprCategory, 'L_FIM065', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwApprove'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 승인결과
            gfnma_setComSelect(['gvwApprove'], jsonApprStatus, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    function fn_createGvwMasterGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwMaster';
        SBGridProperties.id 				= 'gvwMaster';
        SBGridProperties.jsonref 			= 'jsonSalesInvoiceList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.frozencols = 10;
        SBGridProperties.frozenbottomrows = 1;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [2],
                sum : [10, 11, 12, 13],
            },
            datasorting	: true,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["전표ID"],         ref: 'DOC_ID',    type:'output',  	width:'116px',  style:'text-align:left', hidden: true},
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '56px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'94px',  style:'text-align:center;text-decoration: underline;cursor:pointer;color:#149fff'},
            {caption: ["적요"],         ref: 'DESCRIPTION',    type:'output',  	width:'217px',  style:'text-align:left'},
            {caption: ["역분개"],			    ref: 'REVERSE_FLAG', 			        type:'checkbox',  	width:'46px',  	style:'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["전표구분"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '56px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["배치번호"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'182px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'50px',  style:'text-align:right'},
            {caption: ["전기일자"],       ref: 'DOC_DATE', 		type:'inputdate',  	width:'97px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["공급가액"],         ref: 'SUPPLY_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["부가세(￦)"],         ref: 'VAT_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["상신일자"],       ref: 'INSERT_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["청구자"],         ref: 'REQUEST_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["직전결재자"],         ref: 'BEFORE_APPR_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["직전대행자"],         ref: 'BEFORE_PROXY_EMP',    type:'output',  	width:'85px',  style:'text-align:left'},
            {caption: ["결재수임권자"],         ref: 'NEXT_APPR_EMP',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["다음대행자"],         ref: 'NEXT_PROXY_EMP',    type:'output',  	width:'86px',  style:'text-align:left'},
            {caption: ["역분개전표id"],         ref: 'REVERSE_DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["역분개전표번호"],         ref: 'REVERSE_DOC_NAME',    type:'output',  	width:'109px',  style:'text-align:left'},
            {caption: ["원천전표id"],         ref: 'ORIG_DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["원천전표번호"],         ref: 'ORIG_DOC_NAME',    type:'output',  	width:'93px',  style:'text-align:left'},
            {caption: ["APC"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '109px',
                typeinfo: {
                    ref			: 'jsonFiOrgCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '109px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사업자번호"],         ref: 'PAYER_BIZ_REGNO',    type:'output',  	width:'107px',  style:'text-align:left',
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 12}
                , format : {type:'number', rule:'###-##-#####', emptyvalue:''}
            },
            {caption: ["거래처"],         ref: 'PAYER_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["통화코드"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["수금방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '81px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["수금요청일자"],       ref: 'EXPECTED_PAY_DATE', 		type:'inputdate',  	width:'86px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["수금예정일자"],       ref: 'TXN_EXP_PAY_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["수금일자"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["지급금액"],         ref: 'PAY_AMOUNT',    type:'output',  	width:'138px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
                , hidden: true
            },
            {caption: ["증빙유형"], 		ref: 'VOUCHER_TYPE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonVoucherType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["증빙번호"],         ref: 'VOUCHER_NO',    type:'output',  	width:'207px',  style:'text-align:left'},
            {caption: ["여신영역"], 		ref: 'CREDIT_AREA',   	    type:'combo', style:'text-align:left' ,width: '90px',
                typeinfo: {
                    ref			: 'jsonCreditArea',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["실사용자"],         ref: 'PAYEE_CODE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["작성자"], 		ref: 'CREATED_BY',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonUser',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["관련문서번호"],         ref: 'DOC_NO',    type:'output',  	width:'93px',  style:'text-align:left'},
            {caption: ["회계의견"],         ref: 'ACCT_OPINION',    type:'output',  	width:'133px',  style:'text-align:left'},
            {caption: ["자금의견"],         ref: 'TR_OPINION',    type:'output',  	width:'125px',  style:'text-align:left'},
            {caption: ["반제전표번호"],         ref: 'APPLY_DOC_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["결재경로ID"],         ref: 'APPR_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결재권자"],         ref: 'CONFIRM_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결재대행자"],         ref: 'PROXY_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결재소스유형"],         ref: 'APPR_SOURCE_TYPE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwMaster = _SBGrid.create(SBGridProperties);
        gvwMaster.bind('click', 'fn_view');
        gvwMaster.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonInfotList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["증빙수취일"],       ref: 'VOUCHER_RECEIPT_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["증빙유형"], 		ref: 'VOUCHER_TYPE',   	    type:'combo', style:'text-align:left' ,width: '116px',
                typeinfo: {
                    ref			: 'jsonVoucherType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["증빙번호"],         ref: 'VOUCHER_NO',    type:'output',  	width:'203px',  style:'text-align:left'},
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '91px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표ID"],         ref: 'DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["전표구분"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '56px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["배치번호"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'177px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'50px',  style:'text-align:right'},
            {caption: ["APC"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '115px',
                typeinfo: {
                    ref			: 'jsonFiOrgCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '114px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전기일자"],       ref: 'DOC_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래처"],         ref: 'PAYER_NAME',    type:'output',  	width:'151px',  style:'text-align:left'},
            {caption: ["사업자번호"],         ref: 'PAYER_BIZ_REGNO',    type:'output',  	width:'94px',  style:'text-align:left',
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 12}
                , format : {type:'number', rule:'###-##-#####', emptyvalue:''}
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '74px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'61px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["공급가액"],         ref: 'SUPPLY_AMOUNT',    type:'output',  	width:'130px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["부가세"],         ref: 'VAT_AMOUNT',    type:'output',  	width:'100px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
                , hidden: true
            },
            {caption: ["실사용자"],         ref: 'PAYEE_CODE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["지급방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급요청일자"],       ref: 'EXPECTED_PAY_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급예정일자"],       ref: 'TXN_EXP_PAY_DATE', 		type:'inputdate',  	width:'104px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["상신일자"],       ref: 'INSERT_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["작성자"], 		ref: 'CREATED_BY',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonUser',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["비고"],         ref: 'DESCRIPTION',    type:'output',  	width:'250px',  style:'text-align:left'},
            {caption: ["회계의견"],         ref: 'ACCT_OPINION',    type:'output',  	width:'133px',  style:'text-align:left'},
            {caption: ["자금의견"],         ref: 'TR_OPINION',    type:'output',  	width:'125px',  style:'text-align:left'},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwAccountGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAccount';
        SBGridProperties.id 				= 'gvwAccount';
        SBGridProperties.jsonref 			= 'jsonAccountList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.allowcopy 			= true; //복사
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [0],
                sum : [13,14,15,16]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 		: 12,
                titlevalue		: '합계',
                style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["ITEM_ID"], 	        ref: 'ITEM_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["KEY_ID"], 	        ref: 'KEY_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            //{caption: ["전표번호"], 	        ref: 'DOC_NAME',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(objRowData['DOC_ID']){
                        return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
                    } else {
                        return "";
                    }
                }
            },
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '150px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["순번"], 	        ref: 'ITEM_SEQ',    	        type:'output',  	width:'60px',  	style:'text-align:right'},
            {caption: ["TYPE"],           ref: 'LINE_TYPE', 		        type:'combo',  	width:'80px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["차/대"],           ref: 'DEBIT_CREDIT', 		        type:'combo',  	width:'70px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDebitCredit',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부가세유형코드"], 	    ref: 'VAT_TYPE',    	   type:'output',  	width:'150px',  	style:'text-align:left', hidden: true}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["계정코드"], 	        ref: 'ACCOUNT_CODE',       type:'output',  	width:'100px',  	style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["부가세유형"], 	    ref: 'VAT_NAME',    	   type:'output',  	width:'150px',  	style:'text-align:left'}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["계정과목명"], 	    ref: 'ACCOUNT_NAME',       type:'output',  	width:'200px',  	style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["차변(통화)"],        ref: 'ORIGINAL_DR_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["대변(통화)"],         ref: 'ORIGINAL_CR_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["차변(전표)"],         ref: 'FUNCTIONAL_DR_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["대변(전표)"],         ref: 'FUNCTIONAL_CR_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["부서"], 	        ref: 'DEPT_NAME',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점"],           ref: 'COST_CENTER_CODE', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCostCenterCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["적요"], 	        ref: 'DESCRIPTION',    	        type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["비고"],			ref: 'ETC',			            type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["품목"], 	        ref: 'ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["단위"],           ref: 'UOM', 		        type:'combo',  	width:'75px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUom',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["수량"], 	        ref: 'TXN_QTY',    	        type:'output',  	width:'120px',  	style:'text-align:left', hidden: true},
            {caption: ["귀속부서코드"], 	        ref: 'DEPT_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["프로젝트코드"], 	        ref: 'PROJECT_CODE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["관리항목1"], 	        ref: 'ACC_ITEM_CODE1',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목2"], 	        ref: 'ACC_ITEM_CODE2',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목3"], 	        ref: 'ACC_ITEM_CODE3',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목4"], 	        ref: 'ACC_ITEM_CODE4',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목5"], 	        ref: 'ACC_ITEM_CODE5',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목6"], 	        ref: 'ACC_ITEM_CODE6',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목7"], 	        ref: 'ACC_ITEM_CODE7',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목8"], 	        ref: 'ACC_ITEM_CODE8',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목9"], 	        ref: 'ACC_ITEM_CODE9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["관리항목10"], 	        ref: 'ACC_ITEM_CODE10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME1"], 	        ref: 'ACC_ITEM_NAME1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME2"], 	        ref: 'ACC_ITEM_NAME2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME3"], 	        ref: 'ACC_ITEM_NAME3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME4"], 	        ref: 'ACC_ITEM_NAME4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME5"], 	        ref: 'ACC_ITEM_NAME5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME6"], 	        ref: 'ACC_ITEM_NAME6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME7"], 	        ref: 'ACC_ITEM_NAME7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME8"], 	        ref: 'ACC_ITEM_NAME8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME9"], 	        ref: 'ACC_ITEM_NAME9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME10"], 	        ref: 'ACC_ITEM_NAME10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN1"], 	        ref: 'ACC_ITEM_YN1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN2"], 	        ref: 'ACC_ITEM_YN2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN3"], 	        ref: 'ACC_ITEM_YN3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN4"], 	        ref: 'ACC_ITEM_YN4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN5"], 	        ref: 'ACC_ITEM_YN5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN6"], 	        ref: 'ACC_ITEM_YN6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN7"], 	        ref: 'ACC_ITEM_YN7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN8"], 	        ref: 'ACC_ITEM_YN8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN9"], 	        ref: 'ACC_ITEM_YN9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN10"], 	        ref: 'ACC_ITEM_YN10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE1"], 	        ref: 'DATA_TYPE1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE2"], 	        ref: 'DATA_TYPE2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE3"], 	        ref: 'DATA_TYPE3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE4"], 	        ref: 'DATA_TYPE4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE5"], 	        ref: 'DATA_TYPE5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE6"], 	        ref: 'DATA_TYPE6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE7"], 	        ref: 'DATA_TYPE7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE8"], 	        ref: 'DATA_TYPE8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE9"], 	        ref: 'DATA_TYPE9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE10"], 	        ref: 'DATA_TYPE10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID1"], 	        ref: 'POPUP_ID1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID2"], 	        ref: 'POPUP_ID2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID3"], 	        ref: 'POPUP_ID3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID4"], 	        ref: 'POPUP_ID4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID5"], 	        ref: 'POPUP_ID5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID6"], 	        ref: 'POPUP_ID6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID7"], 	        ref: 'POPUP_ID7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID8"], 	        ref: 'POPUP_ID8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID9"], 	        ref: 'POPUP_ID9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID10"], 	        ref: 'POPUP_ID10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE1"], 	        ref: 'ACC_ITEM_VALUE1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE2"], 	        ref: 'ACC_ITEM_VALUE2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE3"], 	        ref: 'ACC_ITEM_VALUE3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE4"], 	        ref: 'ACC_ITEM_VALUE4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE5"], 	        ref: 'ACC_ITEM_VALUE5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE6"], 	        ref: 'ACC_ITEM_VALUE6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE7"], 	        ref: 'ACC_ITEM_VALUE7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE8"], 	        ref: 'ACC_ITEM_VALUE8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE9"], 	        ref: 'ACC_ITEM_VALUE9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE10"], 	        ref: 'ACC_ITEM_VALUE10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME1"], 	        ref: 'ACC_VALUE_NAME1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME2"], 	        ref: 'ACC_VALUE_NAME2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME3"], 	        ref: 'ACC_VALUE_NAME3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME4"], 	        ref: 'ACC_VALUE_NAME4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME5"], 	        ref: 'ACC_VALUE_NAME5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME6"], 	        ref: 'ACC_VALUE_NAME6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME7"], 	        ref: 'ACC_VALUE_NAME7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME8"], 	        ref: 'ACC_VALUE_NAME8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME9"], 	        ref: 'ACC_VALUE_NAME9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME10"], 	        ref: 'ACC_VALUE_NAME10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_CHARACTER"], 	        ref: 'ACC_CHARACTER',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["차/대변 구분"], 	        ref: 'BALANCE_SIDE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천전표번호"], 	        ref: 'ITEM_DOC_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천라인ID"], 	        ref: 'ITEM_SOURCE_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["건수"], 	        ref: 'SOURCE_RECORD_COUNT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["회계전표번호"], 	        ref: 'DOC_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
        ];

        gvwAccount = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwPaymentGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPayment';
        SBGridProperties.id 				= 'gvwPayment';
        SBGridProperties.jsonref 			= 'jsonPaymentList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.allowcopy 			= true; //복사
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.useinitsorting = true;
        SBGridProperties.total 				= {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [0],
                sum : [12,13]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 		: 6,
                titlevalue		: '합계',
                style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["자금id"], 	        ref: 'TREASURY_ID',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["자금상태"],           ref: 'STATUS_CODE', 		        type:'combo',  	width:'69px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["자금번호"], 	        ref: 'TREASURY_BATCH_NO',    	        type:'output',  	width:'186px',  	style:'text-align:left', hidden: true},
            {caption: ["송장번호"], 	        ref: 'INVOICE_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["라인번호"], 	        ref: 'TREASURY_LINE_NUM',    	        type:'output',  	width:'66px',  	style:'text-align:left', hidden: true},
            {caption: ["전표id"], 	        ref: 'DOC_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '200px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표번호"], 	        ref: 'link',    	        type:'button',  	width:'200px',  	style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(objRowData['DOC_ID']){
                        return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
                    } else {
                        return "";
                    }
                }
            },
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '200px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급요청일자"],       ref: 'PLANNED_PAY_DATE', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급일"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '200px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'220px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'220px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["비고"], 		ref: 'ETC', 			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        gvwPayment = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwApproveGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwApprove';
        SBGridProperties.id 				= 'gvwApprove';
        SBGridProperties.jsonref 			= 'jsonDetailList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.allowcopy 			= true; //복사
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["APPR_ID"], 	        ref: 'APPR_ID',    	        type:'output',  	width:'60px',  	style:'text-align:left', hidden: true},
            {caption: ["순번"], 	        ref: 'STEP_SEQ',    	        type:'output',  	width:'61px',  	style:'text-align:right'},
            {caption: ["구분"],           ref: 'APPR_TYPE', 		        type:'combo',  	width:'200px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonApprType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["결재구분"],           ref: 'APPR_CATEGORY', 		        type:'combo',  	width:'200px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonApprCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서코드"], 	        ref: 'DEPT_CODE',    	        type:'output',  	width:'200px',  	style:'text-align:left', hidden: true}, // TODO : P_ORG004
            {caption: ["부서명"], 	        ref: 'DEPT_NAME',    	        type:'output',  	width:'200px',  	style:'text-align:left'}, // TODO : P_ORG001
            {caption: ["직책"],           ref: 'DUTY_CODE', 		        type:'combo',  	width:'76px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사번"], 	        ref: 'EMP_CODE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true}, // TODO : P_HRI0001
            {caption: ["이름"], 	        ref: 'EMP_NAME',    	        type:'output',  	width:'200px',  	style:'text-align:left'}, // TODO : P_HRI0001
            {caption: ["수임자사번"], 	        ref: 'PROXY_EMP_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["수임자명"], 	        ref: 'PROXY_EMP_NAME',    	        type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["결재자명"], 	        ref: 'UPDATE_EMP_NAME',    	        type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["승인결과"],           ref: 'APPR_STATUS', 		        type:'combo',  	width:'200px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonApprStatus',
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
                , hidden: true
            },
            {caption: ["결재의견"], 	        ref: 'APPR_OPINION',    	        type:'output',  	width:'345px',  	style:'text-align:left'},
            {caption: ["비고"], 					ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},

        ];

        gvwApprove = _SBGrid.create(SBGridProperties);
    }

    const fn_searchApplyTab = async function (rowData) {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));
        let DOC_TYPE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DOC_TYPE"));
        let DOC_ID = gfn_nvl(rowData.DOC_ID) == "" ? 0 : parseInt(rowData.DOC_ID);
        let TXN_DATE_FROM = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FROM"));
        let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO"));
        let CS_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAYER_CODE"));
        let PAYEE_DEPT = gfn_nvl(SBUxMethod.get("SRCH_PAYEE_DEPT_CODE"));
        let PAYEE_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAYEE_CODE"));
        let DOC_STATUS = gfn_nvl(gfnma_multiSelectGet("#SRCH_DOC_STATUS"));
        let CREATED_DEPT = gfn_nvl(SBUxMethod.get("SRCH_CREATED_DEPT_CODE"));
        let CREATED_BY = gfn_nvl(SBUxMethod.get("SRCH_CREATED_BY_CODE"));
        let REVERSE_FLAG = gfn_nvl(SBUxMethod.get("SRCH_REVERSE_FLAG").SRCH_REVERSE_FLAG);
        let APPR_ONLY_FLAG = gfn_nvl(SBUxMethod.get("SRCH_APPR_ONLY_FLAG").SRCH_APPR_ONLY_FLAG);
        let DOC_NAME = gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME"));
        let DOC_NAME_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN) == "Y" ? strDocNameList : "";
        let DESC = gfn_nvl(SBUxMethod.get("SRCH_DESC"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_DOC_TYPE : DOC_TYPE,
            V_P_DOC_ID : DOC_ID,
            V_P_TXN_DATE_FROM : TXN_DATE_FROM,
            V_P_TXN_DATE_TO : TXN_DATE_TO,
            V_P_CS_CODE : CS_CODE,
            V_P_PAYEE_DEPT : PAYEE_DEPT,
            V_P_PAYEE_CODE : PAYEE_CODE,
            V_P_DOC_STATUS : DOC_STATUS,
            V_P_CREATED_DEPT : CREATED_DEPT,
            V_P_CREATED_BY : CREATED_BY,
            V_P_REVERSE_FLAG : REVERSE_FLAG,
            V_P_APPR_ONLY_FLAG : APPR_ONLY_FLAG,
            V_P_DOC_NAME : DOC_NAME,
            V_P_DOC_NAME_D : DOC_NAME_D,
            V_P_DESC : DESC,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/selectFig3400List.do", {
            getType				: 'json',
            workType			: 'PAYMENT',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonPaymentList.length = 0;

                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        TREASURY_BATCH_NO : item.TREASURY_BATCH_NO,
                        TREASURY_ID : item.TREASURY_ID,
                        TREASURY_LINE_NUM : item.TREASURY_LINE_NUM,
                        PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                        PAY_DATE : item.PAY_DATE,
                        STATUS_CODE : item.STATUS_CODE,
                        PAY_METHOD : item.PAY_METHOD,
                        DOC_TYPE : item.DOC_TYPE,
                        DOC_NAME : item.DOC_NAME,
                        DOC_ID : item.DOC_ID,
                        DOC_STATUS : item.DOC_STATUS,
                        CURRENCY_CODE : item.CURRENCY_CODE,
                        ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                        FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT
                    }
                    jsonPaymentList.push(msg);
                });
                gvwPayment.rebuild();
            } else {
                alert(listData.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_searchAccountTab = async function (rowData) {
        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));
        let DOC_ID = gfn_nvl(rowData.DOC_ID) == "" ? 0 : parseInt(rowData.DOC_ID);
        let EMP_CODE = gfn_nvl(p_empCd);

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_DOC_ID : DOC_ID,
            V_P_EMP_CODE : EMP_CODE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/fi/fgl/jor/selectFig2210ItemQList.do", {
            getType				: 'json',
            workType			: 'ACCOUNT',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonAccountList.length = 0;

                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        KEY_ID : item.KEY_ID,
                        ITEM_ID : item.ITEM_ID,
                        ITEM_SEQ : item.ITEM_SEQ,
                        LINE_TYPE : item.LINE_TYPE,
                        DEBIT_CREDIT : item.DEBIT_CREDIT,
                        VAT_TYPE : item.VAT_TYPE,
                        VAT_NAME : item.VAT_NAME,
                        DEPT_CODE : item.DEPT_CODE,
                        COST_CENTER_CODE : item.COST_CENTER_CODE,
                        PROJECT_CODE : item.PROJECT_CODE,
                        ORIGINAL_CR_AMT : item.ORIGINAL_CR_AMT,
                        ORIGINAL_DR_AMT : item.ORIGINAL_DR_AMT,
                        FUNCTIONAL_CR_AMT : item.FUNCTIONAL_CR_AMT,
                        FUNCTIONAL_DR_AMT : item.FUNCTIONAL_DR_AMT,
                        TXN_QTY : item.TXN_QTY,
                        ACCOUNT_CODE : item.ACCOUNT_CODE,
                        ACCOUNT_NAME : item.ACCOUNT_NAME,
                        ACC_ITEM_CODE1 : item.ACC_ITEM_CODE1,
                        ACC_ITEM_CODE2 : item.ACC_ITEM_CODE2,
                        ACC_ITEM_CODE3 : item.ACC_ITEM_CODE3,
                        ACC_ITEM_CODE4 : item.ACC_ITEM_CODE4,
                        ACC_ITEM_CODE5 : item.ACC_ITEM_CODE5,
                        ACC_ITEM_CODE6 : item.ACC_ITEM_CODE6,
                        ACC_ITEM_CODE7 : item.ACC_ITEM_CODE7,
                        ACC_ITEM_CODE8 : item.ACC_ITEM_CODE8,
                        ACC_ITEM_CODE9 : item.ACC_ITEM_CODE9,
                        ACC_ITEM_CODE10 : item.ACC_ITEM_CODE10,
                        ACC_ITEM_NAME1 : item.ACC_ITEM_NAME1,
                        ACC_ITEM_NAME2 : item.ACC_ITEM_NAME2,
                        ACC_ITEM_NAME3 : item.ACC_ITEM_NAME3,
                        ACC_ITEM_NAME4 : item.ACC_ITEM_NAME4,
                        ACC_ITEM_NAME5 : item.ACC_ITEM_NAME5,
                        ACC_ITEM_NAME6 : item.ACC_ITEM_NAME6,
                        ACC_ITEM_NAME7 : item.ACC_ITEM_NAME7,
                        ACC_ITEM_NAME8 : item.ACC_ITEM_NAME8,
                        ACC_ITEM_NAME9 : item.ACC_ITEM_NAME9,
                        ACC_ITEM_NAME10 : item.ACC_ITEM_NAME10,
                        ACC_ITEM_YN1 : item.ACC_ITEM_YN1,
                        ACC_ITEM_YN2 : item.ACC_ITEM_YN2,
                        ACC_ITEM_YN3 : item.ACC_ITEM_YN3,
                        ACC_ITEM_YN4 : item.ACC_ITEM_YN4,
                        ACC_ITEM_YN5 : item.ACC_ITEM_YN5,
                        ACC_ITEM_YN6 : item.ACC_ITEM_YN6,
                        ACC_ITEM_YN7 : item.ACC_ITEM_YN7,
                        ACC_ITEM_YN8 : item.ACC_ITEM_YN8,
                        ACC_ITEM_YN9 : item.ACC_ITEM_YN9,
                        ACC_ITEM_YN10 : item.ACC_ITEM_YN10,
                        DATA_TYPE1 : item.DATA_TYPE1,
                        DATA_TYPE2 : item.DATA_TYPE2,
                        DATA_TYPE3 : item.DATA_TYPE3,
                        DATA_TYPE4 : item.DATA_TYPE4,
                        DATA_TYPE5 : item.DATA_TYPE5,
                        DATA_TYPE6 : item.DATA_TYPE6,
                        DATA_TYPE7 : item.DATA_TYPE7,
                        DATA_TYPE8 : item.DATA_TYPE8,
                        DATA_TYPE9 : item.DATA_TYPE9,
                        DATA_TYPE10 : item.DATA_TYPE10,
                        POPUP_ID1 : item.POPUP_ID1,
                        POPUP_ID2 : item.POPUP_ID2,
                        POPUP_ID3 : item.POPUP_ID3,
                        POPUP_ID4 : item.POPUP_ID4,
                        POPUP_ID5 : item.POPUP_ID5,
                        POPUP_ID6 : item.POPUP_ID6,
                        POPUP_ID7 : item.POPUP_ID7,
                        POPUP_ID8 : item.POPUP_ID8,
                        POPUP_ID9 : item.POPUP_ID9,
                        POPUP_ID10 : item.POPUP_ID10,
                        ACC_CHARACTER : item.ACC_CHARACTER,
                        ACC_ITEM_VALUE1 : item.ACC_ITEM_VALUE1,
                        ACC_ITEM_VALUE2 : item.ACC_ITEM_VALUE2,
                        ACC_ITEM_VALUE3 : item.ACC_ITEM_VALUE3,
                        ACC_ITEM_VALUE4 : item.ACC_ITEM_VALUE4,
                        ACC_ITEM_VALUE5 : item.ACC_ITEM_VALUE5,
                        ACC_ITEM_VALUE6 : item.ACC_ITEM_VALUE6,
                        ACC_ITEM_VALUE7 : item.ACC_ITEM_VALUE7,
                        ACC_ITEM_VALUE8 : item.ACC_ITEM_VALUE8,
                        ACC_ITEM_VALUE9 : item.ACC_ITEM_VALUE9,
                        ACC_ITEM_VALUE10 : item.ACC_ITEM_VALUE10,
                        ACC_VALUE_NAME1 : item.ACC_VALUE_NAME1,
                        ACC_VALUE_NAME2 : item.ACC_VALUE_NAME2,
                        ACC_VALUE_NAME3 : item.ACC_VALUE_NAME3,
                        ACC_VALUE_NAME4 : item.ACC_VALUE_NAME4,
                        ACC_VALUE_NAME5 : item.ACC_VALUE_NAME5,
                        ACC_VALUE_NAME6 : item.ACC_VALUE_NAME6,
                        ACC_VALUE_NAME7 : item.ACC_VALUE_NAME7,
                        ACC_VALUE_NAME8 : item.ACC_VALUE_NAME8,
                        ACC_VALUE_NAME9 : item.ACC_VALUE_NAME9,
                        ACC_VALUE_NAME10 : item.ACC_VALUE_NAME10,
                        ITEM_CODE : item.ITEM_CODE,
                        UOM : item.UOM,
                        TXN_QTY : item.TXN_QTY,
                        DEPT_NAME : item.DEPT_NAME,
                        DESCRIPTION : item.DESCRIPTION,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        DOC_ID : item.DOC_ID,
                        DOC_NAME : item.DOC_NAME,
                        DOC_TYPE : item.DOC_TYPE,
                        DOC_STATUS : item.DOC_STATUS
                    }
                    jsonAccountList.push(msg);
                });
                gvwAccount.rebuild();
            } else {
                alert(listData.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_searchApproveTab = async function (rowData) {
        let APPR_ID = gfn_nvl(rowData.APPR_ID) == "" ? 0 : parseInt(rowData.APPR_ID);
        let SOURCE_NO = gfn_nvl(rowData.DOC_ID);
        let SOURCE_TYPE = gfn_nvl(rowData.DOC_TYPE);

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_APPR_ID : APPR_ID,
            V_P_SOURCE_NO : SOURCE_NO,
            V_P_SOURCE_TYPE : SOURCE_TYPE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/tri/selectFim3420List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonDetailList.length = 0;

                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        APPR_ID : item.APPR_ID,
                        STEP_SEQ : item.STEP_SEQ,
                        APPR_TYPE : item.APPR_TYPE,
                        APPR_CATEGORY : item.APPR_CATEGORY,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        DUTY_CODE : item.DUTY_CODE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        APPR_STATUS : item.APPR_STATUS,
                        APPR_DATE : item.APPR_DATE,
                        APPR_OPINION : item.APPR_OPINION,
                        UPDATE_USERID : item.UPDATE_USERID,
                        UPDATE_EMP_NAME : item.UPDATE_EMP_NAME,
                        UPDATE_TIME : item.UPDATE_TIME,
                        UPDATE_PC : item.UPDATE_PC,
                        DESCRIPTION : item.DESCRIPTION,
                        PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                        PROXY_EMP_NAME : item.PROXY_EMP_NAME
                    }
                    jsonDetailList.push(msg);
                });
                gvwApprove.rebuild();
            } else {
                alert(listData.resultMessage);
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

    const fn_view = async function () {
        var nRow = gvwMaster.getRow();
        if(nRow < 1) return;
        var nCol = gvwMaster.getCol();
        var rowData = gvwMaster.getRowData(nRow);
        if(gfn_nvl(rowData) == "") return;

        if (nCol == gvwMaster.getColRef("DOC_NAME")) {
            if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
                return false;
            }

            if (gvwMaster.getCellData(nRow, gvwMaster.getColRef("DOC_BATCH_NO")) != "") {
                var ht = {};
                ht["DOC_BATCH_NO"] = gfn_nvl(gvwMaster.getCellData(nRow, gvwMaster.getColRef("DOC_BATCH_NO")));
                ht["SOURCE_TYPE"] = "AR";
                ht["DOC_NUM"] = parseInt(gfn_nvl(gvwMaster.getCellData(nRow, gvwMaster.getColRef("DOC_NUM"))));
                ht["COMP_CODE"] = gv_ma_selectedCorpCd;
                ht["FI_ORG_CODE"] = gfn_nvl(gvwMaster.getCellData(nRow, gvwMaster.getColRef("FI_ORG_CODE")));
                ht["TXN_FROM_DATE"] = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FROM"));
                ht["TXN_TO_DATE"] = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO"));
                ht["ASAVE"] = "Y";
                ht["APRINT"] = "Y";
                ht["VOUCHER_TYPE"] = gfn_nvl(gvwMaster.getCellData(nRow, gvwMaster.getColRef("VOUCHER_TYPE")));
                ht["VOUCHER_NO"] = gfn_nvl(gvwMaster.getCellData(nRow, gvwMaster.getColRef("VOUCHER_NO")));

                ht["target"] = 'MA_A20_010_010_030';
                let json = JSON.stringify(ht);

                window.parent.cfn_openTabSearch(json);
            }
        } else {
            await fn_searchApplyTab(rowData);
            await fn_searchAccountTab(rowData);
            await fn_searchApproveTab(rowData);
        }
    }

    const fn_findPayerName = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_PAYER_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.CS_NAME LIKE '%" + replaceText1 + "%' AND A.BIZ_REGNO LIKE '%" + replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_SALE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["고객사코드",		"사업자번호", 		"고객사명"]
            ,searchInputFields		: ["CS_CODE",	"BIZ_REGNO", 	"CS_NAME"]
            ,searchInputValues		: ["", 			"",		searchText]
            ,searchInputTypes		: ["input", 	"input",		"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소"
                , "전화", "팩스", "채권계정", "채권계정명", "선수금계정", "선수금계정명", "수금기준", "수금기준명", "수금방법", "통화"]
            ,tableColumnNames		: ["CS_CODE", "CS_NAME",  "BIZ_REGNO", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS", "ADDRESS"
                , "TEL", "FAX", "AR_ACC_CODE", "AR_ACC_NAME", "ADVANCE_ACC_CODE", "ADVANCE_ACC_NAME", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_PAYER_CODE', data.CS_CODE);
                SBUxMethod.set('SRCH_PAYER_NAME', data.CS_NAME);
            },
        });
    }

    const fn_findCreatedDeptName = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_CREATED_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
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
                SBUxMethod.set('SRCH_CREATED_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_CREATED_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findPayeeDeptName = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_PAYEE_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
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
                SBUxMethod.set('SRCH_PAYEE_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_PAYEE_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findCreatedByName = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_CREATED_BY_NAME"));
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NAME_";
        var strWhereClause 	= "AND A.USER_ID LIKE '%" + replaceText0 + "%' AND A.USER_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_USER_02'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["사용자",		"사용자명"]
            ,searchInputFields		: ["USER_ID",	"USER_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사용자id", "사용자명", "부서코드", "부서명"]
            ,tableColumnNames		: ["USER_ID", "USER_NAME",  "DEPT_CODE", "DEPT_NAME"]
            ,tableColumnWidths		: ["100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_CREATED_BY_CODE', data.USER_ID);
                SBUxMethod.set('SRCH_CREATED_BY_NAME', data.USER_NAME);
            },
        });
    }

    const fn_findPayeeName = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_PAYEE_NAME"));
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NAME_";
        var strWhereClause 	= "AND A.USER_ID LIKE '%" + replaceText0 + "%' AND A.USER_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_USER_02'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["사용자",		"사용자명"]
            ,searchInputFields		: ["USER_ID",	"USER_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사용자id", "사용자명", "부서코드", "부서명"]
            ,tableColumnNames		: ["USER_ID", "USER_NAME",  "DEPT_CODE", "DEPT_NAME"]
            ,tableColumnWidths		: ["100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_PAYEE_CODE', data.USER_ID);
                SBUxMethod.set('SRCH_PAYEE_NAME', data.USER_NAME);
            },
        });
    }

    const fn_multiSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strDocNameList = "";
                data.forEach((item, index) => {
                    strDocNameList += item + "|";
                });

                if (strDocNameList.length > 0)
                    strDocNameList = strDocNameList.substring(0, strDocNameList.length - 1);

                if (strDocNameList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwMasterGrid();
        fn_createGvwInfoGrid();
        fn_createGvwAccountGrid();
        fn_createGvwPaymentGrid();
        fn_createGvwApproveGrid();
        await fn_onload();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_create = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        var ht = {};

        ht["DOC_BATCH_NO"] = "";
        ht["SOURCE_TYPE"] = "AR";
        ht["DOC_NUM"] = 0;
        ht["COMP_CODE"] = gv_ma_selectedCorpCd;
        ht["FI_ORG_CODE"] = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));
        ht["TXN_FROM_DATE"] = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FROM"));
        ht["TXN_TO_DATE"] = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO"));
        ht["ASAVE"] = "Y";
        ht["APRINT"] = "Y";
        ht["VOUCHER_TYPE"] = "";
        ht["VOUCHER_NO"] = "";

        ht["target"] = 'MA_A20_010_010_030';
        let json = JSON.stringify(ht);

        window.parent.postMessage(json);
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_TXN_DATE_FROM",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_TXN_DATE_TO", gfn_dateLastYmd(new Date()));
        SBUxMethod.set("SRCH_REVERSE_FLAG", "Y");
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);

        await fn_search();
    }

    const fn_search = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FI_ORG_CODE"));
        let DOC_TYPE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DOC_TYPE"));
        let TXN_DATE_FROM = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FROM"));
        let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO"));
        let CS_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAYER_CODE"));
        let PAYEE_DEPT = gfn_nvl(SBUxMethod.get("SRCH_PAYEE_DEPT_CODE"));
        let PAYEE_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAYEE_CODE"));
        let DOC_STATUS = gfn_nvl(gfnma_multiSelectGet("#SRCH_DOC_STATUS"));
        let CREATED_DEPT = gfn_nvl(SBUxMethod.get("SRCH_CREATED_DEPT_CODE"));
        let CREATED_BY = gfn_nvl(SBUxMethod.get("SRCH_CREATED_BY_CODE"));
        let REVERSE_FLAG = gfn_nvl(SBUxMethod.get("SRCH_REVERSE_FLAG").SRCH_REVERSE_FLAG);
        let APPR_ONLY_FLAG = gfn_nvl(SBUxMethod.get("SRCH_APPR_ONLY_FLAG").SRCH_APPR_ONLY_FLAG);
        let DOC_NAME = gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME"));
        let DOC_NAME_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN) == "Y" ? strDocNameList : "";
        let DESC = gfn_nvl(SBUxMethod.get("SRCH_DESC"));
        let ACTIVE_MASTER_TAB = SBUxMethod.get('idxTabMaster');

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_DOC_TYPE : DOC_TYPE,
            V_P_DOC_ID : '0',
            V_P_TXN_DATE_FROM : TXN_DATE_FROM,
            V_P_TXN_DATE_TO : TXN_DATE_TO,
            V_P_CS_CODE : CS_CODE,
            V_P_PAYEE_DEPT : PAYEE_DEPT,
            V_P_PAYEE_CODE : PAYEE_CODE,
            V_P_DOC_STATUS : DOC_STATUS,
            V_P_CREATED_DEPT : CREATED_DEPT,
            V_P_CREATED_BY : CREATED_BY,
            V_P_REVERSE_FLAG : REVERSE_FLAG,
            V_P_APPR_ONLY_FLAG : APPR_ONLY_FLAG,
            V_P_DOC_NAME : DOC_NAME,
            V_P_DOC_NAME_D : DOC_NAME_D,
            V_P_DESC : DESC,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/selectFig3400List.do", {
            getType				: 'json',
            workType			: ACTIVE_MASTER_TAB == "tabPageEx1" ? "Q" : "Q2",
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                if(ACTIVE_MASTER_TAB == "tabPageEx1") {
                    jsonSalesInvoiceList.length = 0;

                    listData.cv_1.forEach((item, index) => {
                        const msg = {
                            CHECK_YN: item.CHECK_YN,
                            DOC_BATCH_NO: item.DOC_BATCH_NO,
                            DOC_NUM: item.DOC_NUM,
                            FI_ORG_CODE: item.FI_ORG_CODE,
                            SITE_CODE: item.SITE_CODE,
                            DOC_NAME: item.DOC_NAME,
                            DOC_ID: item.DOC_ID,
                            PAYER_ID: item.PAYER_ID,
                            PAYER_NAME: item.PAYER_NAME,
                            PAYER_BIZ_REGNO: item.PAYER_BIZ_REGNO,
                            DOC_DATE: item.DOC_DATE,
                            DOC_TYPE: item.DOC_TYPE,
                            PAY_METHOD: item.PAY_METHOD,
                            CURRENCY_CODE: item.CURRENCY_CODE,
                            EXCHANGE_TYPE: item.EXCHANGE_TYPE,
                            EXCHANGE_RATE: item.EXCHANGE_RATE,
                            SUPPLY_AMOUNT: item.SUPPLY_AMOUNT,
                            VAT_AMOUNT: item.VAT_AMOUNT,
                            ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
                            FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
                            APPLIED_DOC_NAME: item.APPLIED_DOC_NAME,
                            APPLIED_DOC_DATE: item.APPLIED_DOC_DATE,
                            APPLIED_AMOUNT: item.APPLIED_AMOUNT,
                            APPLY_COMPLETE_FLAG: item.APPLY_COMPLETE_FLAG,
                            APPLY_COMPLETE_DATE: item.APPLY_COMPLETE_DATE,
                            APPLIED_FLAG: item.APPLIED_FLAG,
                            EXPECTED_PAY_DATE: item.EXPECTED_PAY_DATE,
                            DOC_STATUS: item.DOC_STATUS,
                            VOUCHER_TYPE: item.VOUCHER_TYPE,
                            VOUCHER_NO: item.VOUCHER_NO,
                            PAYEE_CODE: item.PAYEE_CODE,
                            CREATED_BY: item.CREATED_BY,
                            INSERT_TIME: item.INSERT_TIME,
                            INSERT_DATE: item.INSERT_DATE,
                            DESCRIPTION: item.DESCRIPTION,
                            CARD_NO: item.CARD_NO,
                            VOUCHER_RECEIPT_DATE: item.VOUCHER_RECEIPT_DATE,
                            ACCT_OPINION: item.ACCT_OPINION,
                            TR_OPINION: item.TR_OPINION,
                            CONFIRM_EMP_CODE: item.CONFIRM_EMP_CODE,
                            PROXY_EMP_CODE: item.PROXY_EMP_CODE,
                            APPR_ID: item.APPR_ID,
                            APPLY_DOC_NAME: item.APPLY_DOC_NAME,
                            REVERSE_FLAG: item.REVERSE_FLAG,
                            REVERSE_DOC_ID: item.REVERSE_DOC_ID,
                            REVERSE_DOC_NAME: item.REVERSE_DOC_NAME,
                            ORIG_DOC_ID: item.ORIG_DOC_ID,
                            ORIG_DOC_NAME: item.ORIG_DOC_NAME,
                            CREDIT_AREA: item.CREDIT_AREA,
                            AP_DOC_YN: item.AP_DOC_YN,
                            AR_DOC_YN: item.AR_DOC_YN,
                            ESS_DOC_YN: item.ESS_DOC_YN,
                            AP_DOC_VIEW_YN: item.AP_DOC_VIEW_YN,
                            AP_DOC_WRITE_YN: item.AP_DOC_WRITE_YN,
                            AR_DOC_WRITE_YN: item.AR_DOC_WRITE_YN,
                            MANUAL_DOC_WRITE_YN: item.MANUAL_DOC_WRITE_YN,
                            MULTI_AP_WRITE_YN: item.MULTI_AP_WRITE_YN,
                            APPR_SOURCE_TYPE: item.APPR_SOURCE_TYPE,
                            REQUEST_EMP: item.REQUEST_EMP,
                            BEFORE_APPR_EMP: item.BEFORE_APPR_EMP,
                            NEXT_APPR_EMP: item.NEXT_APPR_EMP,
                            BEFORE_PROXY_EMP: item.BEFORE_PROXY_EMP,
                            NEXT_PROXY_EMP: item.NEXT_PROXY_EMP
                        }
                        jsonSalesInvoiceList.push(msg);
                    });
                    gvwMaster.rebuild();

                    document.querySelector('#listCount').innerText = jsonSalesInvoiceList.length;

                    if (jsonSalesInvoiceList.length > 0) {
                        gvwMaster.clickRow(1);
                    }
                } else {
                    listData.cv_1.forEach((item, index) => {
                        const msg = {
                            CHECK_YN: item.CHECK_YN,
                            DOC_BATCH_NO: item.DOC_BATCH_NO,
                            DOC_NUM: item.DOC_NUM,
                            FI_ORG_CODE: item.FI_ORG_CODE,
                            SITE_CODE: item.SITE_CODE,
                            DOC_NAME: item.DOC_NAME,
                            DOC_ID: item.DOC_ID,
                            PAYER_ID: item.PAYER_ID,
                            PAYER_NAME: item.PAYER_NAME,
                            PAYER_BIZ_REGNO: item.PAYER_BIZ_REGNO,
                            DOC_DATE: item.DOC_DATE,
                            DOC_TYPE: item.DOC_TYPE,
                            PAY_METHOD: item.PAY_METHOD,
                            CURRENCY_CODE: item.CURRENCY_CODE,
                            EXCHANGE_TYPE: item.EXCHANGE_TYPE,
                            EXCHANGE_RATE: item.EXCHANGE_RATE,
                            SUPPLY_AMOUNT: item.SUPPLY_AMOUNT,
                            VAT_AMOUNT: item.VAT_AMOUNT,
                            ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
                            FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
                            APPLIED_DOC_NAME: item.APPLIED_DOC_NAME,
                            APPLIED_DOC_DATE: item.APPLIED_DOC_DATE,
                            APPLIED_AMOUNT: item.APPLIED_AMOUNT,
                            APPLY_COMPLETE_FLAG: item.APPLY_COMPLETE_FLAG,
                            APPLY_COMPLETE_DATE: item.APPLY_COMPLETE_DATE,
                            APPLIED_FLAG: item.APPLIED_FLAG,
                            EXPECTED_PAY_DATE: item.EXPECTED_PAY_DATE,
                            DOC_STATUS: item.DOC_STATUS,
                            VOUCHER_TYPE: item.VOUCHER_TYPE,
                            VOUCHER_NO: item.VOUCHER_NO,
                            PAYEE_CODE: item.PAYEE_CODE,
                            CREATED_BY: item.CREATED_BY,
                            INSERT_TIME: item.INSERT_TIME,
                            INSERT_DATE: item.INSERT_DATE,
                            DESCRIPTION: item.DESCRIPTION,
                            CARD_NO: item.CARD_NO,
                            VOUCHER_RECEIPT_DATE: item.VOUCHER_RECEIPT_DATE,
                            ACCT_OPINION: item.ACCT_OPINION,
                            TR_OPINION: item.TR_OPINION,
                            CONFIRM_EMP_CODE: item.CONFIRM_EMP_CODE,
                            PROXY_EMP_CODE: item.PROXY_EMP_CODE,
                            APPR_ID: item.APPR_ID,
                            APPLY_DOC_NAME: item.APPLY_DOC_NAME,
                            REVERSE_FLAG: item.REVERSE_FLAG,
                            REVERSE_DOC_ID: item.REVERSE_DOC_ID,
                            REVERSE_DOC_NAME: item.REVERSE_DOC_NAME,
                            ORIG_DOC_ID: item.ORIG_DOC_ID,
                            ORIG_DOC_NAME: item.ORIG_DOC_NAME,
                            CREDIT_AREA: item.CREDIT_AREA,
                            AP_DOC_YN: item.AP_DOC_YN,
                            AR_DOC_YN: item.AR_DOC_YN,
                            ESS_DOC_YN: item.ESS_DOC_YN,
                            AP_DOC_VIEW_YN: item.AP_DOC_VIEW_YN,
                            AP_DOC_WRITE_YN: item.AP_DOC_WRITE_YN,
                            AR_DOC_WRITE_YN: item.AR_DOC_WRITE_YN,
                            MANUAL_DOC_WRITE_YN: item.MANUAL_DOC_WRITE_YN,
                            MULTI_AP_WRITE_YN: item.MULTI_AP_WRITE_YN,
                            APPR_SOURCE_TYPE: item.APPR_SOURCE_TYPE,
                            REQUEST_EMP: item.REQUEST_EMP,
                            BEFORE_APPR_EMP: item.BEFORE_APPR_EMP,
                            NEXT_APPR_EMP: item.NEXT_APPR_EMP,
                            BEFORE_PROXY_EMP: item.BEFORE_PROXY_EMP,
                            NEXT_PROXY_EMP: item.NEXT_PROXY_EMP
                        }
                        jsonInfotList.push(msg);
                    });
                    gvwInfo.rebuild();
                }
            } else {
                alert(listData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_reject = async function () {
        let gvwListCheckedList = gvwMaster.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        let APPR_OPINION = gfn_nvl(SBUxMethod.get("APPR_OPINION"));
        if (gvwListCheckedList.length == 0)
            return;

        if(APPR_OPINION == "") {
            gfn_comAlert("E0000", "반려시 결재의견은 필수입니다.")
            return;
        }

        var strappr_id = "";
        var strappr_opinion = "";

        var intcount = 0;

        gvwListCheckedList.forEach((item, index) => {
            // 사용자가 이번 결재권자이거나 수임권자이면
            let data = gvwMaster.getRowData(item);
            if (data.CONFIRM_EMP_CODE == p_empCd || data.PROXY_EMP_CODE == p_empCd) {
                strappr_id += data.APPR_ID + "|";
                strappr_opinion += gfn_nvl(SBUxMethod.get("APPR_OPINION")) + "|";
                intcount += 1;
            }
        });

        if (intcount == 0) {
            gfn_comAlert("E0000", "결재 처리할 건이 없습니다.")
            return;
        } else {
            strappr_id = strappr_id.substring(0, strappr_id.length - 1);
            strappr_opinion = strappr_opinion.substring(0, strappr_opinion.length - 1);

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_APPR_ID : strappr_id,
                V_P_APPR_OPINION : strappr_opinion,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3400ForApprove.do", {
                getType				: 'json',
                workType			: 'REJECT',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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

    const fn_approve = async function () {
        let gvwListCheckedList = gvwMaster.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        if (gvwListCheckedList.length == 0)
            return;

        var strappr_id = "";
        var strappr_opinion = "";

        var intcount = 0;

        gvwListCheckedList.forEach((item, index) => {
            // 사용자가 이번 결재권자이거나 수임권자이면
            let data = gvwMaster.getRowData(item);
            if (data.CONFIRM_EMP_CODE == p_empCd || data.PROXY_EMP_CODE == p_empCd) {
                strappr_id += data.APPR_ID + "|";
                strappr_opinion += gfn_nvl(SBUxMethod.get("APPR_OPINION")) + "|";
                intcount += 1;
            }
        });

        if (intcount == 0) {
            gfn_comAlert("E0000", "결재 처리할 건이 없습니다.")
            return;
        } else {
            strappr_id = strappr_id.substring(0, strappr_id.length - 1);
            strappr_opinion = strappr_opinion.substring(0, strappr_opinion.length - 1);

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_APPR_ID : strappr_id,
                V_P_APPR_OPINION : strappr_opinion,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3400ForApprove.do", {
                getType				: 'json',
                workType			: 'APPROVE',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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

    const fn_getVoucherNo = async function () {
        let gvwListCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHECK_YN"), true);
        if (gvwListCheckedList.length == 0)
            return;

        var intcount = 0;
        var strdoc_id = "";

        gvwListCheckedList.forEach((item, index) => {
            let data = gvwInfo.getRowData(item);
            strdoc_id += data.DOC_ID + "|";
            intcount += 1;
        });

        if (intcount == 0) {
            gfn_comAlert("E0000", "선택 된 건이 없습니다.")
            return;
        } else {
            strdoc_id = strdoc_id.substring(0, strdoc_id.length - 1);

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_DOC_ID_D : strdoc_id,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3400ForGetVoucherNo.do", {
                getType				: 'json',
                workType			: 'GET',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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

    /**
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let NATION_CODE = gfnma_nvl(SBUxMethod.get("SRCH_PERIOD_YYYYMM"));

        if (NATION_CODE == ''){

            SBUxMethod.set("SRCH_TXN_DATE_FROM", 			'');
            SBUxMethod.set("SRCH_TXN_DATE_TO", 			'');
        }

        SBUxMethod.set("SRCH_TXN_DATE_FROM", 			NATION_CODE + '01');

        //월별로 말일 구하기
        let lastDate = new Date(NATION_CODE.slice(0,4),NATION_CODE.slice(4,6),0);
        let DATE_TO = gfn_dateToYmd(lastDate);
        SBUxMethod.set("SRCH_TXN_DATE_TO", 			DATE_TO);

    }

    /**
     * 그리드내 링크(전표번호) 조회
     */
    function fn_gridPopup1(event, doc_id) {
        event.preventDefault();

        var obj = {
            'MENU_MOVE'		: 'Y'
            ,'DOC_ID' 		: doc_id
            ,'target'		: 'MA_A20_030_020_150'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
    }

    const fn_btnPrint = async function () {
        let gvwListCheckedListData	= gvwMaster.getCheckedRowData(gvwMaster.getColRef("CHECK_YN"));
        if (gvwListCheckedListData.length == 0) {
            gfn_comAlert("E0000", "출력할 전표를 선택해 주십시오");
            return;
        } else {
            if (gfn_comConfirm("Q0000", "선택된 전표를 출력하시겠습니까?")) {
        		SBUxMethod.attr('modal-comPopFig1000Report', 'header-title', '전표 출력');
        		SBUxMethod.openModal('modal-comPopFig1000Report');
        		comPopFig1000Report({
        			height			: '200px'
        			,width			: '400px'
        			,param			: {
        				P_WORK_TYPE		: "INVOICE"
        				,P_DOC_BATCH_NO	: gvwListCheckedListData[0].data.DOC_BATCH_NO
        				,P_COMP_CODE	: gv_ma_selectedCorpCd
        				,P_CLIENT_CODE	: gv_ma_selectedClntCd
        			}
        		});
            }
        }
    }
</script>
<!-- inline scripts related to this page -->
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>