<%
    /**
     * @Class Name 		: trd2030.jsp
     * @Description 	: 예적금거래전표생성 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.09.09
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.09.09   	이경한		최초 생성
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
    <title>title : 예적금거래전표생성</title>
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
                    <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" class="btn btn-sm btn-outline-danger" text="확정" onclick="fn_confirm"></sbux-button>
                    <sbux-button id="btnCancel" name="btnCancel" uitype="normal" class="btn btn-sm btn-outline-danger" text="취소" onclick="fn_cancel"></sbux-button>
                    <sbux-button id="btnInterface" name="btnInterface" uitype="normal" class="btn btn-sm btn-outline-danger" text="자금계획등록" onclick="fn_interface"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="자금계획삭제" onclick="fn_delete"></sbux-button>
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
							<th scope="row" class="th_bg_search">APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<div class="dropdown">
									<button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
										<font>선택</font>
										<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
									</div>
								</div>
							</td>
                            <td></td>
                            <th scope="row" class="th_bg_search">입출금계좌</th>
                            <td class="td_input" data-group="SRCH_OUT_DEPOSIT">
                                <sbux-input id="SRCH_OUT_DEPOSIT_CODE" class="form-control input-sm" uitype="text"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" data-group="SRCH_OUT_DEPOSIT">
                                <sbux-input id="SRCH_OUT_ACCOUNT_NO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_OUT_DEPOSIT">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="..." uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findDepositCode"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg_search">년월</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="SRCH_PERIOD_YYYYMM"
                                        name="SRCH_PERIOD_YYYYMM"
                                        date-format="yyyy-mm"
                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast inpt_data_reqed table-datepicker-ma"
                                        style="width:100%;"
                                        datepicker-mode="month"
                                        group-id="panHeader"
                                        required
                                />
                            </td>
                            <td colspan="3"></td>
                            <th scope="row" class="th_bg_search">금융기관</th>
                            <td class="td_input" data-group="SRCH_BANK_CS">
                                <sbux-input id="SRCH_BANK_CS_CODE" class="form-control input-sm" uitype="text"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" data-group="SRCH_BANK_CS">
                                <sbux-input id="SRCH_BANK_CS_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                <sbux-input id="SRCH_DEPT_CODE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK_CS">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="..." uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findBankCsCode"
                                ></sbux-button>
                            </td>
						</tr>
						<tr>
                            <th scope="row" class="th_bg_search">예적금거래유형</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_TXN_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_TXN_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
						</tr>
                    </tbody>
                </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>예적금</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwList" style="height:150px;"></div>
                </div>
                <div class="row">
                    <div>
                        <sbux-tabs id="idxTabMaster" name="idxTabMaster" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData" onclick="fn_view">
                        </sbux-tabs>
                        <div class="tab-content">
                            <div id="tabPageEx1">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>자금실적</span></li>
                                    </ul>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwDetail" style="height:450px;"></div>
                                </div>
                            </div>
                            <div id="tabPageEx3">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>회계처리</span></li>
                                    </ul>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwAccount" style="height:450px;"></div>
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
</body>

<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_deptCode = "${loginVO.maDeptCode}";
    var p_currUnit = "${loginVO.maCurrUnit}";
    var p_defaultAcctRule = "${loginVO.maDefaultAcctRule}";
    //-----------------------------------------------------------

    var strLastWorkType = "";
    var strtxn_id = "";

    var jsonFiOrgCode = []; // APC명
    var jsonBankCsCode = []; // 금융기관코드
    var jsonTxnType = []; // 예적금유형
    var jsonCostCenterCode = []; // 원가중심점
    var jsonPayMethodDeposit = []; // 지급방법
    var jsonTxnGroupCode = []; // 거래유형
    var jsonBankCode = []; // 은행코드
    var jsonDocType = []; // 전표유형
    var jsonPayMethod = []; // 지급방법
    var jsonStatusCode = []; // 상태코드
    var jsonDocStatus = []; // 전표상태
    var jsonLineType = []; // LINE
    var jsonDebitCredit = []; // 차/대
    var jsonUom = []; // 단위
    var jsonCostCenterCCCode = []; // 원가중심점코드
    var jsonAccItemCode = []; // 관리항목코드
    var jsonCurrencyCode = []; // 통화코드
    var jsonExchangeType = []; // 환전유형

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;
    var gvwAccount;

    var jsonDepositPaymentPlanList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonFundPerformanceList = [];
    var jsonAccountTreatmentList = [];

    // Tab Data
    var jsonTabData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "자금실적", "targetid" : "tabPageEx1", "targetvalue" : "자금실적" },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "회계처리", "targetid" : "tabPageEx3", "targetvalue" : "회계처리" },
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // APC명
            gfnma_setComSelect(['gvwList'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
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
            // 예적금거래유형
            gfnma_setComSelect(['gvwList'], jsonTxnType, 'L_FIM084', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_TXN_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM084'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 금융기관코드
            gfnma_setComSelect(['gvwList'], jsonBankCsCode, 'L_CS_BANK', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CS_CODE', 'BANK_CS_NAME', 'Y', ''),
            // 원가중심점
            gfnma_setComSelect(['gvwList'], jsonCostCenterCode, 'L_COST_CENTER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
            // 지급방법
            gfnma_setComSelect(['gvwList'], jsonPayMethodDeposit, 'L_FIM073_DEPOSIT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 거래유형
            gfnma_setComSelect(['gvwDetail'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 은행코드
            gfnma_setComSelect(['gvwDetail'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['gvwDetail', 'gvwAccount'], jsonDocType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['gvwAccount'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급방법
            gfnma_setComSelect(['gvwDetail'], jsonPayMethod, 'L_FIM081', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상태코드
            gfnma_setComSelect(['gvwDetail'], jsonStatusCode, 'L_FIM074', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // LINE
            gfnma_setComSelect(['gvwAccount'], jsonLineType, 'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차/대
            gfnma_setComSelect(['gvwAccount'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 단위
            gfnma_setComSelect(['gvwAccount'], jsonUom, 'L_LGS001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'UNIT_CODE', 'UNIT_NAME', 'Y', ''),
            // 원가중심점코드
            gfnma_setComSelect(['gvwAccount'], jsonCostCenterCCCode, 'L_CC_INPUT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwAccount'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwAccount'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 환율유형
            gfnma_setComSelect(['gvwAccount'], jsonExchangeType, 'L_COM034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonDepositPaymentPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'output',  	width:'70px',  style:'text-align:left', hidden: true},
            {caption: ["금융기관"], 		ref: 'BANK_CS_CODE',   	    type:'combo', style:'text-align:left' ,width: '198px',
                typeinfo: {
                    ref			: 'jsonBankCsCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["예적금명"],         ref: 'DEPOSIT_NAME',    type:'input',  	width:'138px',  style:'text-align:left'},
            {caption: ["예적금번호"],         ref: 'DEPOSIT_NUM',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'PLAN_SEQ',    type:'input',  	width:'56px',  style:'text-align:left'},
            {caption: ["확정"],   ref: 'CONFIRM_FLAG', 		    type:'checkbox',  	width:'37px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["기간"],         ref: 'PERIOD_CODE',    type:'input',  	width:'60px',  style:'text-align:left'},
            {caption: ["불입예정일"],       ref: 'IN_PLAN_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["입출금계좌코드"],         ref: 'OUT_DEPOSIT_CODE',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["입출금계좌"],         ref: 'OUT_ACCOUNT_NO',    type:'input',  	width:'120px',  style:'text-align:left'},
            {caption: ["거래유형"], 		ref: 'TXN_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTxnType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["통화"],         ref: 'CURRENCY_CODE',    type:'input',  	width:'50px',  style:'text-align:left'},
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["부서"],         ref: 'DEPT_CODE',    type:'input',  	width:'103px',  style:'text-align:left'},
            {caption: ["원가중심점"], 		ref: 'COST_CENTER_CODE',   	    type:'combo', style:'text-align:left' ,width: '116px',
                typeinfo: {
                    ref			: 'jsonCostCenterCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["자동이체"],   ref: 'IN_PREAUTH_PAY_YN', 		    type:'checkbox',  	width:'60px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["지급방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayMethodDeposit',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["예적금(원래)"],         ref: 'DEPOSIT_AMT_O',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금(환산)"],         ref: 'DEPOSIT_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자금액"],         ref: 'PRETAX_INTEREST_AMT_O',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자금액(환산)"],         ref: 'PRETAX_INTEREST_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["세후이자금액"],         ref: 'INTEREST_IN_PLAN_AMT_O',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["세후이자금액(환산)"],         ref: 'INTEREST_IN_PLAN_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["법인세율"],         ref: 'CTAX_RATE',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["법인세(원래)"],         ref: 'CTAX_WITHHOLD_AMOUNT',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["법인세(환산)"],         ref: 'CTAX_WITHHOLD_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지방소득세율"],         ref: 'PTAX_RATE',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지방세(원래)"],         ref: 'PTAX_WITHHOLD_AMOUNT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지방세(환산)"],         ref: 'PTAX_WITHHOLD_AMT_F',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자율"],         ref: 'INTEREST_RATE',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["시작일"],       ref: 'INTEREST_FROM_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일"],       ref: 'INTEREST_TO_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["불입원금"],         ref: 'IN_PLAN_AMT_O',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["불입원금(환산)"],         ref: 'IN_PLAN_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["불입후 잔액"],         ref: 'REMAIN_DEPOSIT_AMT_O',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["불입후잔액(환산)"],         ref: 'REMAIN_DEPOSIT_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["불입원금(환산전)"],         ref: 'IN_PLAN_AMT_BEFORE',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["총불입액"],         ref: 'TOTAL_IN_PLAN_AMT_O',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["총불입액(환산)"],         ref: 'TOTAL_IN_PLAN_AMT_F',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["환차손익"],         ref: 'FOREIGN_EXCHANGE_PL',    type:'input',  	width:'160px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["APC명"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonFiOrgCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["자금"],   ref: 'ACCOUNT_COMPLETE_FLAG', 		    type:'checkbox',  	width:'37px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
        gvwList.bind('valuechanged','fn_gvwListValueChanged');
    }

    const fn_view = async function () {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();
        if (nRow < 0)
            return;

        if(nCol == gvwList.getColRef("INTEREST_IN_PLAN_AMT_O") || nCol == gvwList.getColRef("CTAX_RATE")
            || nCol == gvwList.getColRef("PTAX_RATE") || nCol == gvwList.getColRef("CTAX_WITHHOLD_AMOUNT")
            || nCol == gvwList.getColRef("PTAX_WITHHOLD_AMOUNT")) return;

        if (SBUxMethod.get('idxTabMaster') == "tabPageEx1") {
            fnQRY_P_TRD2030_Q("DETAIL");
        } else if (SBUxMethod.get('idxTabMaster') == "tabPageEx3") {
            fnQRY_P_TRD2030_Q("ACCOUNT");
        }

        if (gvwList.getCellData(nRow, gvwList.getColRef("CONFIRM_FLAG")) == "Y") {
            for(var i = 0; i < gvwList.getCols(); i++) {
                if (i == gvwList.getColRef("CHECK_YN")) {
                    gvwList.setColDisabled(i, false);
                } else {
                    gvwList.setColDisabled(i, true);
                }
            }
        } else {
            for (var i = 0; i < gvwList.getCols(); i++){
                if (i == gvwList.getColRef("CHECK_YN") || i == gvwList.getColRef("PAY_METHOD")) {
                    gvwList.setColDisabled(i, false);
                } else {
                    gvwList.setColDisabled(i, true);
                }
            }
        }
    }

    const fn_gvwListValueChanged = async function () {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();
        if (nRow < 0)
            return;

        // 수량, 단가 변경시 금액 계산
        if (nCol == gvwList.getColRef("INTEREST_IN_PLAN_AMT_O")) {
            var dAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("INTEREST_IN_PLAN_AMT_O")))
                * parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))), p_currUnit);

            gvwList.setCellData(nRow, gvwList.getColRef("INTEREST_IN_PLAN_AMT_F"), dAmount);
        }

        if (nCol == gvwList.getColRef("CTAX_RATE") || nCol == gvwList.getColRef("INTEREST_IN_PLAN_AMT_O")) {
            var dAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("INTEREST_IN_PLAN_AMT_O")))
                * parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("CTAX_RATE"))) / 100, p_currUnit);
            var dptax_rate = parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("CTAX_RATE"))) / 10;

            gvwList.setCellData(nRow, gvwList.getColRef("CTAX_WITHHOLD_AMOUNT"), dAmount);
            gvwList.setCellData(nRow, gvwList.getColRef("PTAX_RATE"), dptax_rate);
        }

        if (nCol == gvwList.getColRef("PTAX_RATE") || nCol == gvwList.getColRef("INTEREST_IN_PLAN_AMT_O")) {
            var dAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("INTEREST_IN_PLAN_AMT_O")))
                * parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("PTAX_RATE"))) / 100, p_currUnit);

            gvwList.setCellData(nRow, gvwList.getColRef("PTAX_WITHHOLD_AMOUNT"), dAmount);
        }

        if (nCol == gvwList.getColRef("CTAX_WITHHOLD_AMOUNT")) {
            var dAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("CTAX_WITHHOLD_AMOUNT")))
                * parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))), p_currUnit);
            var dptaxAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("CTAX_WITHHOLD_AMOUNT"))) / 10, p_currUnit);

            gvwList.setCellData(nRow, gvwList.getColRef("CTAX_WITHHOLD_AMT_F"), dAmount);
            gvwList.setCellData(nRow, gvwList.getColRef("PTAX_WITHHOLD_AMOUNT"), dptaxAmount);
        }

        if (nCol == gvwList.getColRef("PTAX_WITHHOLD_AMOUNT")) {
            var dAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("PTAX_WITHHOLD_AMOUNT")))
                * parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))), p_currUnit);

            gvwList.setCellData(nRow, gvwList.getColRef("PTAX_WITHHOLD_AMT_F"), dAmount);
        }
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonFundPerformanceList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["id"],         ref: 'TREASURY_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["자금배치번호"],         ref: 'TREASURY_BATCH_NO',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'TREASURY_LINE_NUM',    type:'output',  	width:'61px',  style:'text-align:left'},
            {caption: ["거래유형"], 		ref: 'TXN_GROUP_CODE',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonTxnGroupCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래은행"], 		ref: 'BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래계좌"],         ref: 'ACCOUNT_NUM',    type:'output',  	width:'116px',  style:'text-align:left'},
            {caption: ["거래처"],         ref: 'PAYER_ID',    type:'output',  	width:'116px',  style:'text-align:left'},
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급예정일"],       ref: 'PLANNED_PAY_DATE', 		type:'inputdate',  	width:'87px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급일"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급방식"], 		ref: 'TR_PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayMethodDeposit',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["상태"], 		ref: 'STATUS_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["통화"],         ref: 'CURRENCY_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["환산유형"],         ref: 'EXCHANGE_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["원래금액"],         ref: 'ORIGINAL_CR_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["환산금액"],         ref: 'FUNCTIONAL_CR_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
        gvwDetail.bind('dblclick', 'fn_gvwDetailDblclick');
    }

    const fn_gvwDetailDblclick = async function () {
        var nRow = gvwDetail.getRow();
        if(nRow < 0) return;

        var ht = {};
        ht["TREASURY_BATCH_NO"] = gfn_nvl(gvwDetail.getCellData(nRow, gvwDetail.getColRef("TREASURY_BATCH_NO"))) == "" ?
            "" : gfn_nvl(gvwDetail.getCellData(nRow, gvwDetail.getColRef("TREASURY_BATCH_NO")));
        ht["COMP_CODE"] = gv_ma_selectedApcCd;
        ht["FI_ORG_CODE"] = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        ht["ASAVE"] = "Y";
        ht["APRINT"] = "Y";

        ht["target"] = 'MA_A20_060_030_740';
        let json = JSON.stringify(ht);

        window.parent.cfn_openTabSearch(json);
    }

    function fn_createGvwAccountGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAccount';
        SBGridProperties.id 				= 'gvwAccount';
        SBGridProperties.jsonref 			= 'jsonAccountTreatmentList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["ITEM_ID"], 	        ref: 'ITEM_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["KEY_ID"], 	        ref: 'KEY_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '83px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표번호"], 	        ref: 'DOC_NAME',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
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
            {caption: ["차변(원래)"],         ref: 'ORIGINAL_DR_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["대변(원래)"],         ref: 'ORIGINAL_CR_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["차변(환산)"],         ref: 'FUNCTIONAL_DR_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["대변(환산)"],         ref: 'FUNCTIONAL_CR_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["원가중심점"],           ref: 'COST_CENTER_CODE', 		        type:'combo',  	width:'150px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCostCenterCCCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서"], 	        ref: 'DEPT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
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
            {caption: ["프로젝트명"], 	        ref: 'PROJECT_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
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
            {caption: ["INVOICE_ID"], 	        ref: 'ITEM_INVOICE_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천소스"], 	        ref: 'ITEM_DOC_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["원천전표번호"], 	        ref: 'ITEM_DOC_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천라인ID"], 	        ref: 'ITEM_SOURCE_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["건수"], 	        ref: 'SOURCE_RECORD_COUNT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["전표ID"], 	        ref: 'DOC_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["통화"],           ref: 'CURRENCY_CODE', 		        type:'combo',  	width:'75px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율유형"],           ref: 'EXCHANGE_TYPE', 		        type:'combo',  	width:'75px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonExchangeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"], 	        ref: 'EXCHANGE_RATE',    	        type:'output',  	width:'70px',  	style:'text-align:left'},
        ];

        gvwAccount = _SBGrid.create(SBGridProperties);
        gvwAccount.bind('dblclick', 'fn_gvwAccountDblclick');
    }

    const fn_gvwAccountDblclick = async function () {
        var nRow = gvwAccount.getRow();
        if (nRow < 0)
            return;

        if (gvwAccount.getCol() == gvwAccount.getColRef("DOC_NAME")) {
            var strdoc_id = gfn_nvl(gvwAccount.getCellData(nRow, gvwAccount.getColRef("DOC_ID")));

            if (strdoc_id == "")
                return;

            var ht = {};
            ht["WORK_TYPE"] =  "VIEW";
            ht["DOC_ID"] = strdoc_id;

            ht["target"] = 'MA_A20_030_020_150';
            let json = JSON.stringify(ht);

            window.parent.cfn_openTabSearch(json);
        }
    }


    const fn_findBankCsCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_CS_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_BANK'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명"]
            ,searchInputFields		: ["CS_CODE", "CS_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "은행코드", "은행명", "사업자번호", "주소"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BANK_CODE", "BANK_NAME", "BIZ_REGNO", "ADDRESS"]
            ,tableColumnWidths		: ["100px", "200px", "100px", "100px", "120px", "300px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_BANK_CS_NAME', data.CS_NAME);
                SBUxMethod.set('SRCH_BANK_CS_CODE', data.CS_CODE);
            },
        });
    }

    const fn_findDepositCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_OUT_DEPOSIT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_OUT_ACCOUNT_NO"));
        var replaceText0 	= "_DEPOSIT_CODE_";
        var replaceText1 	= "_DEPOSIT_NAME_";
        var strWhereClause 	= "AND DEPOSIT_CODE LIKE '%" + replaceText0 + "%' AND DEPOSIT_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '계좌정보(예적금원장) 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_DEPOSIT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["예적금코드", "예적금명" ]
            ,searchInputFields		: ["DEPOSIT_CODE", "DEPOSIT_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["예적금코드", "예적금명", "계좌번호", "계좌유형", "금융기관코드", "금융기관명", "수금자금수지", "수금계정", "수금계정명", "수수료계정", "수수료계정명", "통화코드", "은행코드"]
            ,tableColumnNames		: ["DEPOSIT_CODE" , "DEPOSIT_NAME", "ACCOUNT_NUM", "DEPOSIT_TYPE", "BANK_CS_CODE", "BANK_CS_NAME", "RECEIPT_TR_TYPE", "RECEIPT_ACCOUNT", "RECEIPT_ACCOUNT_NAME", "FEE_ACCOUNT", "FEE_ACCOUNT_NAME", "CURRENCY_CODE", "BANK_CODE"]
            ,tableColumnWidths		: ["100px", "200px", "140px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_OUT_ACCOUNT_NO', data.ACCOUNT_NUM);
                SBUxMethod.set('SRCH_OUT_DEPOSIT_CODE', data.DEPOSIT_CODE);
            },
        });
    }

    const fnQRY_P_TRD2030_Q = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        var nRow = gvwList.getRow();

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        let PERIOD_CODE = gfn_nvl(SBUxMethod.get("SRCH_PERIOD_YYYYMM"));
        let BANK_CS_CODE = strWorkType == "Q" ? gfn_nvl(SBUxMethod.get("SRCH_BANK_CS_CODE")) : gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("BANK_CS_CODE")));
        let DEPOSIT_NUM = strWorkType == "Q" ? "" : gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("DEPOSIT_NUM")));
        let TXN_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_TYPE'));
        let TXN_ID = strWorkType == "Q" ? 0 : parseInt(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("TXN_ID"))));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_PERIOD_CODE : PERIOD_CODE,
            V_P_BANK_CS_CODE : BANK_CS_CODE,
            V_P_DEPOSIT_NUM : DEPOSIT_NUM,
            V_P_TXN_TYPE : TXN_TYPE,
            V_P_TXN_ID : TXN_ID,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trd/selectTrd2030List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (strWorkType == "Q") {
                    jsonDepositPaymentPlanList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            CHECK_YN : item.CHECK_YN,
                            TXN_ID : item.TXN_ID,
                            BANK_CS_CODE : item.BANK_CS_CODE,
                            DEPOSIT_NUM : item.DEPOSIT_NUM,
                            DEPOSIT_NAME : item.DEPOSIT_NAME,
                            PLAN_SEQ : item.PLAN_SEQ,
                            PERIOD_CODE : item.PERIOD_CODE,
                            TXN_TYPE : item.TXN_TYPE,
                            IN_PLAN_DATE : item.IN_PLAN_DATE,
                            OUT_DEPOSIT_CODE : item.OUT_DEPOSIT_CODE,
                            OUT_ACCOUNT_NO : item.OUT_ACCOUNT_NO,
                            BANK_CS_CODE : item.BANK_CS_CODE,
                            ACCOUNT_NUM : item.ACCOUNT_NUM,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            EXCHANGE_RATE : item.EXCHANGE_RATE,
                            DEPT_CODE : item.DEPT_CODE,
                            COST_CENTER_CODE : item.COST_CENTER_CODE,
                            DEPOSIT_AMT_O : item.DEPOSIT_AMT_O,
                            DEPOSIT_AMT_F : item.DEPOSIT_AMT_F,
                            IN_PLAN_AMT_O : item.IN_PLAN_AMT_O,
                            REMAIN_DEPOSIT_AMT_O : item.REMAIN_DEPOSIT_AMT_O,
                            IN_PLAN_AMT_BEFORE : item.IN_PLAN_AMT_BEFORE,
                            FOREIGN_EXCHANGE_PL : item.FOREIGN_EXCHANGE_PL,
                            INTEREST_DAY : item.INTEREST_DAY,
                            INTEREST_IN_PLAN_AMT_O : item.INTEREST_IN_PLAN_AMT_O,
                            TOTAL_IN_PLAN_AMT_O : item.TOTAL_IN_PLAN_AMT_O,
                            IN_PLAN_AMT_F : item.IN_PLAN_AMT_F,
                            REMAIN_DEPOSIT_AMT_F : item.REMAIN_DEPOSIT_AMT_F,
                            INTEREST_IN_PLAN_AMT_F : item.INTEREST_IN_PLAN_AMT_F,
                            TOTAL_IN_PLAN_AMT_F : item.TOTAL_IN_PLAN_AMT_F,
                            INTEREST_FROM_DATE : item.INTEREST_FROM_DATE,
                            INTEREST_TO_DATE : item.INTEREST_TO_DATE,
                            INTEREST_RATE : item.INTEREST_RATE,
                            CONFIRM_FLAG : item.CONFIRM_FLAG,
                            INTERFACE_FLAG : item.INTERFACE_FLAG,
                            COMPLETE_FLAG : item.COMPLETE_FLAG,
                            FI_ORG_CODE : item.FI_ORG_CODE,
                            PRETAX_INTEREST_AMT_O : item.PRETAX_INTEREST_AMT_O,
                            PRETAX_INTEREST_AMT_F : item.PRETAX_INTEREST_AMT_F,
                            ACCOUNT_COMPLETE_FLAG : item.ACCOUNT_COMPLETE_FLAG,
                            CTAX_RATE : item.CTAX_RATE,
                            CTAX_WITHHOLD_AMOUNT : item.CTAX_WITHHOLD_AMOUNT,
                            PTAX_RATE : item.PTAX_RATE,
                            PTAX_WITHHOLD_AMOUNT : item.PTAX_WITHHOLD_AMOUNT,
                            CTAX_WITHHOLD_AMT_F : item.CTAX_WITHHOLD_AMT_F,
                            PTAX_WITHHOLD_AMT_F : item.PTAX_WITHHOLD_AMT_F,
                            IN_PREAUTH_PAY_YN : item.IN_PREAUTH_PAY_YN,
                            PAY_METHOD : item.PAY_METHOD,
                        }
                        jsonDepositPaymentPlanList.push(msg);
                    });

                    gvwList.rebuild();

                    document.querySelector('#listCount').innerText = jsonDepositPaymentPlanList.length;

                    if (jsonDepositPaymentPlanList.length > 0) {
                        gvwList.clickRow(1);
                    } else {
                        jsonFundPerformanceList.length = 0;
                        jsonAccountTreatmentList.length = 0;
                        gvwDetail.rebuild();
                        gvwAccount.rebuild();
                    }
                } else if (strWorkType == "DETAIL") {
                    jsonFundPerformanceList.length = 0;

                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            TREASURY_ID : item.TREASURY_ID,
                            TREASURY_BATCH_NO : item.TREASURY_BATCH_NO,
                            TREASURY_LINE_NUM : item.TREASURY_LINE_NUM,
                            TXN_GROUP_CODE : item.TXN_GROUP_CODE,
                            ACCOUNT_NUM : item.ACCOUNT_NUM,
                            BANK_CODE : item.BANK_CODE,
                            PAYER_ID : item.PAYER_ID,
                            DOC_TYPE : item.DOC_TYPE,
                            PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                            PAY_DATE : item.PAY_DATE,
                            PAY_METHOD : item.PAY_METHOD,
                            TR_PAY_METHOD : item.TR_PAY_METHOD,
                            STATUS_CODE : item.STATUS_CODE,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                            EXCHANGE_RATE : item.EXCHANGE_RATE,
                            ORIGINAL_CR_AMT : item.ORIGINAL_CR_AMT,
                            FUNCTIONAL_CR_AMT : item.FUNCTIONAL_CR_AMT,

                        }
                        jsonFundPerformanceList.push(msg);
                    });

                    gvwDetail.rebuild();
                } else if (strWorkType == "ACCOUNT") {
                    jsonAccountTreatmentList.length = 0;
                    data.cv_1.forEach((item, index) => {
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
                            INVOICE_ID : item.INVOICE_ID,
                            FI_ORG_CODE : item.FI_ORG_CODE,
                            ITEM_DOC_TYPE : item.ITEM_DOC_TYPE,
                            DOC_NAME : item.DOC_NAME,
                            DOC_TYPE : item.DOC_TYPE,
                            DOC_STATUS : item.DOC_STATUS,
                            DOC_ID : item.DOC_ID,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                            EXCHANGE_RATE : item.EXCHANGE_RATE,
                        }
                        jsonAccountTreatmentList.push(msg);
                    });

                    gvwAccount.rebuild();
                }

                return true;
            } else {
                alert(data.resultMessage);
                return false;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            return false;
        }
    }

    const fnSET_P_TRD2030_S = async function () {
        // 비즈니스 로직 정보
        let updatedData = gvwList.getUpdateData(true, 'all');
        let listData = [];

        updatedData.forEach((item, index) => {
            strLastWorkType = item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D')

            if (gfn_nvl(item.data.TXN_ID) == "") {
                strTxn_id = "0";
            } else {
                strTxn_id = gfn_nvl(item.data.TXN_ID);
            }

            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedApcCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_FI_ORG_CODE : gfn_nvl(item.data.FI_ORG_CODE) == "" ? gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')) : gfn_nvl(item.data.FI_ORG_CODE),
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == "" ? 0 : parseInt(gfn_nvl(item.data.TXN_ID)),
                    V_P_INTEREST_IN_PLAN_AMT : gfn_nvl(item.data.INTEREST_IN_PLAN_AMT) == "" ? 0 : Number(gfn_nvl(item.data.INTEREST_IN_PLAN_AMT)),
                    V_P_INTEREST_IN_PLAN_AMT_F : gfn_nvl(item.data.INTEREST_IN_PLAN_AMT_F) == "" ? 0 : Number(gfn_nvl(item.data.INTEREST_IN_PLAN_AMT_F)),
                    V_P_CTAX_RATE : gfn_nvl(item.data.CTAX_RATE) == "" ? 0 : Number(gfn_nvl(item.data.CTAX_RATE)),
                    V_P_CTAX_WITHHOLD_AMOUNT : gfn_nvl(item.data.CTAX_WITHHOLD_AMOUNT) == "" ? 0 : Number(gfn_nvl(item.data.CTAX_WITHHOLD_AMOUNT)),
                    V_P_CTAX_WITHHOLD_AMT_F : gfn_nvl(item.data.CTAX_WITHHOLD_AMT_F) == "" ? 0 : Number(gfn_nvl(item.data.CTAX_WITHHOLD_AMT_F)),
                    V_P_PTAX_RATE : gfn_nvl(item.data.PTAX_RATE) == "" ? 0 : Number(gfn_nvl(item.data.PTAX_RATE)),
                    V_P_PTAX_WITHHOLD_AMOUNT : gfn_nvl(item.data.PTAX_WITHHOLD_AMOUNT) == "" ? 0 : Number(gfn_nvl(item.data.PTAX_WITHHOLD_AMOUNT)),
                    V_P_PTAX_WITHHOLD_AMT_F : gfn_nvl(item.data.PTAX_WITHHOLD_AMT_F) == "" ? 0 : Number(gfn_nvl(item.data.PTAX_WITHHOLD_AMT_F)),
                    V_P_PAY_METHOD : gfn_nvl(item.data.PAY_METHOD),
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/ftr/trd/insertTrd2030.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (strLastWorkType == "N") {
                        strTxn_id = data.v_returnStr;
                    } else if (strLastWorkType == "D") {
                        strTxn_id = "";
                    }
                    gfn_comAlert("I0001");
                    return true;
                } else {
                    alert(data.resultMessage);
                    return false;
                }

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                return false;
            }
        }
    }

    const fnSET_P_TRD2030_S1 = async function (strWorkType) {
        // 비즈니스 로직 정보
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        let listData = [];

        if(gvwListCheckedList.length == 0) {
            gfn_comAlert("E0000", "check된 Row가 없습니다.");
            return false;
        }

        gvwListCheckedList.forEach((item, index) => {
            let data = gvwList.getRowData(item);

            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item,
                workType: strWorkType,
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedApcCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_ACCT_RULE_CODE : gfn_nvl(p_defaultAcctRule),
                    V_P_PERIOD_CODE : gfn_nvl(data.PERIOD_CODE),
                    V_P_OUT_DEPOSIT_CODE : gfn_nvl(data.OUT_DEPOSIT_CODE),
                    V_P_TXN_TYPE : gfn_nvl(data.TXN_TYPE),
                    V_P_TXN_ID : gfn_nvl(data.TXN_ID) == "" ? 0 : parseInt(gfn_nvl(data.TXN_ID)),
                    V_P_CONFIRM_FLAG : gfn_nvl(data.CONFIRM_FLAG),
                    V_P_EXCHANGE_RATE : gfn_nvl(data.EXCHANGE_RATE) == "" ? 0 : gfn_nvl(data.EXCHANGE_RATE),
                    V_P_IN_PLAN_AMT_F : gfn_nvl(data.IN_PLAN_AMT_F) == "" ? 0 : gfn_nvl(data.IN_PLAN_AMT_F),
                    V_P_REMAIN_DEPOSIT_AMT_F : gfn_nvl(data.REMAIN_DEPOSIT_AMT_F) == "" ? 0 : gfn_nvl(data.REMAIN_DEPOSIT_AMT_F),
                    V_P_INTEREST_IN_PLAN_AMT_F : gfn_nvl(data.INTEREST_IN_PLAN_AMT_F) == "" ? 0 : gfn_nvl(data.INTEREST_IN_PLAN_AMT_F),
                    V_P_IN_PLAN_AMT_BEFORE : gfn_nvl(data.IN_PLAN_AMT_BEFORE) == "" ? 0 : gfn_nvl(data.IN_PLAN_AMT_BEFORE),
                    V_P_FOREIGN_EXCHANGE_PL : gfn_nvl(data.FOREIGN_EXCHANGE_PL) == "" ? 0 : gfn_nvl(data.FOREIGN_EXCHANGE_PL),
                    V_P_CTAX_RATE : gfn_nvl(data.CTAX_RATE) == "" ? 0 : gfn_nvl(data.CTAX_RATE),
                    V_P_CTAX_WITHHOLD_AMOUNT : gfn_nvl(data.CTAX_WITHHOLD_AMOUNT) == "" ? 0 : gfn_nvl(data.CTAX_WITHHOLD_AMOUNT),
                    V_P_CTAX_WITHHOLD_AMT_F : gfn_nvl(data.CTAX_WITHHOLD_AMT_F) == "" ? 0 : gfn_nvl(data.CTAX_WITHHOLD_AMT_F),
                    V_P_PTAX_RATE : gfn_nvl(data.PTAX_RATE) == "" ? 0 : gfn_nvl(data.PTAX_RATE),
                    V_P_PTAX_WITHHOLD_AMOUNT : gfn_nvl(data.PTAX_WITHHOLD_AMOUNT) == "" ? 0 : gfn_nvl(data.PTAX_WITHHOLD_AMOUNT),
                    V_P_PTAX_WITHHOLD_AMT_F : gfn_nvl(data.PTAX_WITHHOLD_AMT_F) == "" ? 0 : gfn_nvl(data.PTAX_WITHHOLD_AMT_F),
                    V_P_PAY_METHOD : gfn_nvl(data.PAY_METHOD),
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/ftr/trd/insertTrd2030Confirm.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    return true;
                } else {
                    alert(data.resultMessage);
                    return false;
                }

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                return false;
            }
        }
    }

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

    const fn_onload = async function () {
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        SBUxMethod.set("SRCH_PERIOD_YYYYMM", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_DEPT_CODE", p_deptCode);
    }

    const fn_save = async function () {
        if (jsonDepositPaymentPlanList.length < 1) {
            return;
        }

        if (fnSET_P_TRD2030_S("")) {
            await fn_search();

            if (strLastWorkType == "N" || strLastWorkType == "U")
                gvwList.clickRow(gvwList.getFilterDatas(gvwList.getColRef("TXN_ID"), strTxn_id));
        }

        strLastWorkType = "";
        strTxn_id = "";
    }

    const fn_search = async function () {
        await fnQRY_P_TRD2030_Q("Q");
    }

    const fn_confirm = async function () {
        var nRow = gvwList.getRow();
        if (nRow < 0)
            return;

        if (fnSET_P_TRD2030_S1("CONFIRM")) {
            fn_search();
            gvwList.clickRow(nRow);
        }
    }

    const fn_cancel = async function () {
        var nRow = gvwList.getRow();
        if (nRow < 0)
            return;

        if (fnSET_P_TRD2030_S1("UNCONFIRM")) {
            fn_search();
            gvwList.clickRow(nRow);
        }
    }

    const fn_interface = async function () {
        var nRow = gvwList.getRow();
        if (nRow < 0)
            return;

        if (fnSET_P_TRD2030_S1("ACCOUNT")) {
            fn_search();
            gvwList.clickRow(nRow);
        }
    }

    const fn_delete = async function () {
        var nRow = gvwList.getRow();
        if (nRow < 0)
            return;

        if (fnSET_P_TRD2030_S1("CANCEL")) {
            fn_search();
            gvwList.clickRow(nRow);
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwDetailGrid();
        fn_createGvwAccountGrid();
        await fn_onload();
    });
</script>
<!-- inline scripts related to this page -->
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>