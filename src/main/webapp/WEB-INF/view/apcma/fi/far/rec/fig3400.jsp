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
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
					<sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="출력" onclick="fn_print"></sbux-button>
				</div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 1%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
                        <col style="width: 3%">
						<col style="width: 10%">
						<col style="width: 10%">
                        <col style="width: 3%">
						<col style="width: 10%">
						<col style="width: 10%">
                        <col style="width: 3%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row" class="th_bg">사업단위</th>
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
                            <th scope="row" class="th_bg">자금상태</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_DOC_STATUS" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_DOC_STATUS" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td colspan="6"></td>
                            <td class="td_input" style="border-right:hidden;">
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
						</tr>
						<tr>
							<th scope="row" class="th_bg">년월</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_PERIOD_YYYYMM"
										name="SRCH_PERIOD_YYYYMM"
										date-format="yyyy-mm"
										datepicker-mode="month"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
                            <th scope="row" class="th_bg">거래처</th>
                            <td class="td_input">
                                <sbux-input id="SRCH_PAYER_CODE" name="SRCH_PAYER_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_PAYER_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findPayerName"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">작성부서</th>
                            <td class="td_input">
                                <sbux-input id="SRCH_CREATED_DEPT_CODE" name="SRCH_CREATED_DEPT_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_CREATED_DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findCreatedDeptName"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">청구부서</th>
                            <td class="td_input">
                                <sbux-input id="SRCH_PAYEE_DEPT_CODE" name="SRCH_PAYEE_DEPT_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_PAYEE_DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findPayeeDeptName"
                                ></sbux-button>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
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
						</tr>
						 <tr>
							<th scope="row" class="th_bg">거래일자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_DATE_FR"
										name="SRCH_DATE_FR"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<span> ~ </span>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_DATE_TO"
										name="SRCH_DATE_TO"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
							<th scope="row" class="th_bg">전표구분</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_DOC_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_DOC_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">작성자</th>
                            <td class="td_input">
                                <sbux-input id="SRCH_CREATED_BY_CODE" name="SRCH_CREATED_BY_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_CREATED_BY_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findCreatedByName"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">실사용자</th>
                            <td class="td_input">
                                <sbux-input id="SRCH_PAYEE_CODE" name="SRCH_PAYEE_CODE" uitype="hidden"></sbux-input>
                                <sbux-input id="SRCH_PAYEE_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
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
                            <th scope="row" class="th_bg">
                                <sbux-checkbox
                                        uitype="normal"
                                        id="SRCH_MULTI_YN"
                                        name="SRCH_MULTI_YN"
                                        uitype="normal"
                                        class="form-control input-sm"
                                        text="복수선택"
                                        true-value="Y" false-value="N"
                                />
                            </th>
                            <td class="td_input">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="복수선택" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_multiSelect"
                                ></sbux-button>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
                                        </li>
                                    </ul>
                                    <div class="ad_tbl_toplist">
                                        <sbux-button id="btnReject" name="btnReject" uitype="normal" text="일괄반려" class="btn btn-sm btn-outline-danger" onclick="fn_reject" style="float: right;"></sbux-button>
                                        <sbux-button id="btnApprove" name="btnApprove" uitype="normal" text="일괄결재" class="btn btn-sm btn-outline-danger" onclick="fn_approve" style="float: right;"></sbux-button>
                                        <sbux-input id="APPR_OPINION" uitype="text" placeholder="" class="form-control input-sm" style="float: right; margin-right: 5px;"></sbux-input>
                                        <span style="float: right;">결제의견</span>
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
                                                    <li><span>결재내역</span></li>
                                                </ul>
                                            </div>
                                            <div>
                                                <div id="sb-area-gvwDetail" style="height:150px;"></div>
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
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_fiOrgCode = "${loginVO.fiOrgCode}";
    //-----------------------------------------------------------

    var jsonFiOrgCode = []; // 사업단위
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
    var gvwDetail;

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
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "반제실적", "targetid" : "tpgApply", "targetvalue" : "반제실적" },
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "결재이력", "targetid" : "tpgApprove", "targetvalue" : "결재이력" },
    ];

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_DATE_FR",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_DATE_TO", gfn_dateLastYmd(new Date()));
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);


        let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_FI_ORG_CODE']
                ,compCode		: gv_ma_selectedApcCd
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
            gfnma_setComSelect(['gvwMaster', 'gvwAccount', 'gvwPayment', 'gvwInfo'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_DOC_STATUS']
                ,compCode		: gv_ma_selectedApcCd
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
            gfnma_setComSelect(['gvwMaster', 'gvwAccount', 'gvwPayment', 'gvwInfo'], jsonDocType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_DOC_TYPE']
                ,compCode		: gv_ma_selectedApcCd
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
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonPayMethod, 'L_FIM081', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwMaster', 'gvwPayment', 'gvwInfo'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 여신영역
            gfnma_setComSelect(['gvwMaster'], jsonCreditArea, 'L_ORG020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 증빙유형
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonUser, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwMaster', 'gvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // LINE
            gfnma_setComSelect(['gvwAccount'], jsonLineType, 'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차/대
            gfnma_setComSelect(['gvwAccount'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 단위
            gfnma_setComSelect(['gvwAccount'], jsonUom, 'L_LGS001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'UNIT_CODE', 'UNIT_NAME', 'Y', ''),
            // 원가중심점코드
            gfnma_setComSelect(['gvwAccount'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwAccount'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
            // 상태코드
            gfnma_setComSelect(['gvwPayment'], jsonStatusCode, 'L_FIM074', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['gvwDetail'], jsonApprType, 'L_FIM004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 결재구분
            gfnma_setComSelect(['gvwDetail'], jsonApprCategory, 'L_FIM065', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwDetail'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 승인결과
            gfnma_setComSelect(['gvwDetail'], jsonApprStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

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
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
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
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'94px',  style:'text-align:left'},
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
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["전기일자"],       ref: 'DOC_DATE', 		type:'datepicker',  	width:'97px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["공급가액"],         ref: 'SUPPLY_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["부가세(￦)"],         ref: 'VAT_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["상신일자"],       ref: 'INSERT_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
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
            {caption: ["사업단위"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '109px',
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
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 10}
                , format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
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
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'75px',  style:'text-align:left',
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
            {caption: ["수금요청일자"],       ref: 'EXPECTED_PAY_DATE', 		type:'datepicker',  	width:'86px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["수금예정일자"],       ref: 'TXN_EXP_PAY_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["수금일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["지급금액"],         ref: 'PAY_AMOUNT',    type:'output',  	width:'138px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
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
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["증빙수취일"],       ref: 'VOUCHER_RECEIPT_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
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
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["사업단위"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '115px',
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
            {caption: ["전기일자"],       ref: 'DOC_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래처"],         ref: 'PAYER_NAME',    type:'output',  	width:'151px',  style:'text-align:left'},
            {caption: ["사업자번호"],         ref: 'PAYER_BIZ_REGNO',    type:'output',  	width:'94px',  style:'text-align:left',
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 10}
                , format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
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
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'61px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["공급가액"],         ref: 'SUPPLY_AMOUNT',    type:'output',  	width:'130px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["부가세"],         ref: 'VAT_AMOUNT',    type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
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
            {caption: ["지급요청일자"],       ref: 'EXPECTED_PAY_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급예정일자"],       ref: 'TXN_EXP_PAY_DATE', 		type:'datepicker',  	width:'104px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["상신일자"],       ref: 'INSERT_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
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
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["ITEM_ID"], 	        ref: 'ITEM_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["KEY_ID"], 	        ref: 'KEY_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["전표번호"], 	        ref: 'DOC_NAME',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '83px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '79px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["순번"], 	        ref: 'ITEM_SEQ',    	        type:'output',  	width:'50px',  	style:'text-align:left'},
            {caption: ["TYPE"],           ref: 'LINE_TYPE', 		        type:'combo',  	width:'75px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["차/대"],           ref: 'DEBIT_CREDIT', 		        type:'combo',  	width:'50px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDebitCredit',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부가세유형코드"], 	        ref: 'VAT_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["부가세유형"], 	        ref: 'VAT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["계정코드"], 	        ref: 'ACCOUNT_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["계정과목명"], 	        ref: 'ACCOUNT_NAME',    	        type:'output',  	width:'170px',  	style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["차변(통화)"],         ref: 'ORIGINAL_DR_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["대변(통화)"],         ref: 'ORIGINAL_CR_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["차변(전표)"],         ref: 'FUNCTIONAL_DR_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["대변(전표)"],         ref: 'FUNCTIONAL_CR_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["부서"], 	        ref: 'DEPT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["원가중심점"],           ref: 'COST_CENTER_CODE', 		        type:'combo',  	width:'150px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCostCenterCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["적요"], 	        ref: 'DESCRIPTION',    	        type:'output',  	width:'300px',  	style:'text-align:left'},
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
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
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
            },
            {caption: ["자금번호"], 	        ref: 'TREASURY_BATCH_NO',    	        type:'output',  	width:'186px',  	style:'text-align:left'},
            {caption: ["송장번호"], 	        ref: 'INVOICE_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["라인번호"], 	        ref: 'TREASURY_LINE_NUM',    	        type:'output',  	width:'66px',  	style:'text-align:left'},
            {caption: ["전표id"], 	        ref: 'DOC_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["전표구분"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표번호"], 	        ref: 'DOC_NAME',    	        type:'output',  	width:'144px',  	style:'text-align:left'},
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급요청일자"],       ref: 'PLANNED_PAY_DATE', 		type:'datepicker',  	width:'108px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급일"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'104px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'160px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'160px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            }
        ];

        gvwPayment = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonDetailList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["APPR_ID"], 	        ref: 'APPR_ID',    	        type:'output',  	width:'60px',  	style:'text-align:left', hidden: true},
            {caption: ["순번"], 	        ref: 'STEP_SEQ',    	        type:'output',  	width:'61px',  	style:'text-align:left'},
            {caption: ["구분"],           ref: 'APPR_TYPE', 		        type:'combo',  	width:'60px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonApprType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["결재구분"],           ref: 'APPR_CATEGORY', 		        type:'combo',  	width:'101px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonApprCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서코드"], 	        ref: 'DEPT_CODE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true}, // TODO : P_ORG004
            {caption: ["부서명"], 	        ref: 'DEPT_NAME',    	        type:'output',  	width:'100px',  	style:'text-align:left'}, // TODO : P_ORG001
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
            {caption: ["이름"], 	        ref: 'EMP_NAME',    	        type:'output',  	width:'86px',  	style:'text-align:left'}, // TODO : P_HRI0001
            {caption: ["수임자사번"], 	        ref: 'PROXY_EMP_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["수임자명"], 	        ref: 'PROXY_EMP_NAME',    	        type:'output',  	width:'147px',  	style:'text-align:left'},
            {caption: ["결재자명"], 	        ref: 'UPDATE_EMP_NAME',    	        type:'output',  	width:'184px',  	style:'text-align:left'},
            {caption: ["승인결과"],           ref: 'APPR_STATUS', 		        type:'combo',  	width:'85px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonApprStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["승인일"],       ref: 'APPR_DATE', 		type:'datepicker',  	width:'153px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["결재의견"], 	        ref: 'APPR_OPINION',    	        type:'output',  	width:'345px',  	style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    const fn_view = async function () {}

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwMasterGrid();
        fn_createGvwInfoGrid();
        fn_createGvwAccountGrid();
        fn_createGvwPaymentGrid();
        fn_createGvwDetailGrid();
        //fn_search();
    });
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>