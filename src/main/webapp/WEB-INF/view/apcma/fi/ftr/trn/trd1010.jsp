<%
    /**
     * @Class Name 		: trd1010.jsp
     * @Description 	: 계좌이체등록 화면
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
    <title>title : 계좌이체등록</title>
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
                </h3>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="자급계획삭제" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_delete"></sbux-button>
                <sbux-button id="btnInterface" name="btnInterface" uitype="normal" text="자금계획등록" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_interface"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="panHeader" class="table table-bordered tbl_fixed">
                <caption>지급프로그램</caption>
                <colgroup>
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 1%">
                    <col style="width: 11%">
                    <col style="width: 3%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 3%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">회계단위</th>
                    <td colspan="4" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">기간</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_DATE_FR_P"
                                name="SRCH_DATE_FR_P"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_DATE_TO_P"
                                name="SRCH_DATE_TO_P"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">금융기관</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_BANK_CS_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_BANK_CS_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankCsCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">거래유형</th>
                    <td class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_TXN_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_TXN_TYPE" style="width:730px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">통화</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_PAY_CURRENCY_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_PAY_CURRENCY_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findPayCurrencyCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">계좌</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPOSIT_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_ACCOUNT_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findAccountNo"
                        ></sbux-button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>예금 거래내역</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwList" style="height:300px;"></div>
                </div>
                <div>
                    <sbux-tabs id="idxTab" name="idxTab" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData" onclick="fn_idxTabClick">
                    </sbux-tabs>
                    <div class="tab-content">
                        <div id="tabPageEx1">
                            <div class="ad_tbl_top2">
                                <ul class="ad_tbl_count">
                                    <li><span>자금실적</span></li>
                                </ul>
                            </div>
                            <div class="table-responsive tbl_scroll_sm" style="margin-top: 0px;">
                                <div id="sb-area-gvwDetail" style="height:300px;"></div>
                            </div>
                        </div>
                        <div id="tabPageEx3">
                            <div class="ad_tbl_top2">
                                <ul class="ad_tbl_count">
                                    <li><span>회계처리</span></li>
                                </ul>
                            </div>
                            <div class="table-responsive tbl_scroll_sm" style="margin-top: 0px;">
                                <div id="sb-area-gvwAccount" style="height:300px;"></div>
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

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_currUnit = "${loginVO.maCurrUnit}";
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_currCode = "${loginVO.maCurrCode}";
    var p_currName = "${loginVO.maCurrName}";
    var p_siteCode = "${loginVO.maSiteCode}";
    var p_defaultAcctRule = "${loginVO.maDefaultAcctRule}";
    //-----------------------------------------------------------

    var strLastWorkType = "";
    var strTxn_id = "";
    var strout_deposit_seq = "";
    var strin_deposit_seq = "";

    var jsonFiOrgCode = []; // 회계단위
    var jsonSiteCode = []; // 사업장
    var jsonTxnType = []; // 거래유형
    var jsonCurrencyCode = []; // 통화코드
    var jsonPayMethodDeposit = []; // 출금방법
    var jsonExchangeType = []; // 환율유형
    var jsonTxnGroupCode = []; // 거래유형
    var jsonBankCode = []; // 은행코드
    var jsonPayerId = []; // 거래처
    var jsonDocType = []; // 전표유형
    var jsonDocStatus = []; // 전표상태
    var jsonTrPayMethod = []; // 지급방식
    var jsonPayMethod = []; // 지급방법
    var jsonStatusCode = []; // 상태코드
    var jsonLineType = []; // LINE
    var jsonDebitCredit = []; // 차/대
    var jsonUom = []; // 단위
    var jsonCostCenterCode = []; // 원가중심점코드
    var jsonAccItemCode = []; // 관리항목코드

    // Tab Data
    var jsonTabData = [
        {"id": "0", "pid": "-1", "order": "1", "text": "자금실적", "targetid": "tabPageEx1", "targetvalue": "자금실적"},
        {"id": "1", "pid": "-1", "order": "2", "text": "회계처리", "targetid": "tabPageEx3", "targetvalue": "회계처리"},
    ];

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;
    var gvwAccount;

    var jsonDepositTransactionList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonFundList = [];
    var jsonAccountingList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 회계단위
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
            // 거래유형
            gfnma_setComSelect(['gvwList'], jsonTxnType, 'L_FIM082_DEPO', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_TXN_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM082_DEPO'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'80px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'120px',  	style:'text-align:left'},
                ]
            }),
            gfnma_setComSelect(['gvwList'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwList'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwList'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 출금방법
            gfnma_setComSelect(['gvwList'], jsonPayMethodDeposit, 'L_FIM073_DEPOSIT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 환율유형
            gfnma_setComSelect(['gvwList'], jsonExchangeType, 'L_COM034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 거래유형
            gfnma_setComSelect(['gvwDetail'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 은행코드
            gfnma_setComSelect(['gvwDetail'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 거래처
            gfnma_setComSelect(['gvwDetail'], jsonPayerId, 'L_COMP_ID', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CS_CODE', 'CS_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['gvwDetail', 'gvwAccount'], jsonDocType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['gvwDetail', 'gvwAccount'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급방식
            gfnma_setComSelect(['gvwDetail'], jsonTrPayMethod, 'L_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
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
            gfnma_setComSelect(['gvwAccount'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwAccount'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonDepositTransactionList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.frozencols = 8;
/*        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [2],
                sum : [21,22,24,26,28],
            },
            datasorting	: true,
            usedecimal : false,
        };*/
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'output',  	width:'92px',  style:'text-align:left', hidden: true},
            {caption: ["회계단위"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '161px',
                typeinfo: {
                    ref			: 'jsonFiOrgCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '151px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["거래일"],       ref: 'TXN_DATE', 		type:'datepicker',  	width:'84px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["거래유형"], 		ref: 'TXN_TYPE',   	    type:'combo', style:'text-align:left' ,width: '106px',
                typeinfo: {
                    ref			: 'jsonTxnType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ['확정'],         ref: 'CONFIRM_FLAG',				type:'checkbox',        width:'49px', style : 'text-align:center',
                typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }
                , disabled: true
            },
            {caption: ['자금등록여부'],         ref: 'ACCOUNT_COMPLETE_FLAG',				type:'checkbox',        width:'89px', style : 'text-align:center',
                typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["입금통화"], 		ref: 'IN_CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["입금계좌코드"],         ref: 'IN_DEPOSIT_CODE',    type:'output',  	width:'118px',  style:'text-align:left'}, // TODO P_DEPOSIT
            {caption: ["입금계좌번호"],         ref: 'IN_ACCOUNT_NO',    type:'output',  	width:'119px',  style:'text-align:left'}, // TODO P_DEPOSIT
            {caption: ["입금은행"],         ref: 'IN_BANK_NAME',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["회차(입금)"],         ref: 'IN_DEPOSIT_SEQ',    type:'output',  	width:'68px',  style:'text-align:left', hidden: true}, // TODO P_DEPOSIT
            {caption: ["출금계좌코드"],         ref: 'OUT_DEPOSIT_CODE',    type:'output',  	width:'131px',  style:'text-align:left'}, // TODO P_DEPOSIT
            {caption: ["출금계좌번호"],         ref: 'OUT_ACCOUNT_NO',    type:'output',  	width:'150px',  style:'text-align:left'}, // TODO P_DEPOSIT
            {caption: ["출금은행"],         ref: 'OUT_BANK_NAME',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["회차(출금)"],         ref: 'OUT_DEPOSIT_SEQ',    type:'output',  	width:'70px',  style:'text-align:left', hidden: true}, // TODO P_DEPOSIT
            {caption: ["출금방법(예금)"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '86px',
                typeinfo: {
                    ref			: 'jsonPayMethodDeposit',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["환율유형"], 		ref: 'EXCHANGE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '78px',
                typeinfo: {
                    ref			: 'jsonExchangeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'input',  	width:'67px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이체금액(통화)"],         ref: 'ORIGINAL_AMOUNT',    type:'input',  	width:'160px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이체금액(전표)"],         ref: 'FUNCTIONAL_AMOUNT',    type:'input',  	width:'160px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["이자율"],         ref: 'INTEREST_RATE',    type:'input',  	width:'75px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.000', emptyvalue:'0.000'}
            },
            {caption: ["이자수익"],         ref: 'INTEREST_AMOUNT',    type:'input',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["법인세율"],         ref: 'CTAX_RATE',    type:'input',  	width:'75px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.000', emptyvalue:'0.000'}
            },
            {caption: ["법인세원천징수"],         ref: 'CTAX_WITHHOLD_AMOUNT',    type:'input',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["지방소득세율"],         ref: 'PTAX_RATE',    type:'input',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.000', emptyvalue:'0.000'}
            },
            {caption: ["지방소득세원천징수"],         ref: 'PTAX_WITHHOLD_AMOUNT',    type:'input',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["원천징수 지점명"],         ref: 'WITHHOLD_BRANCH_NAME',    type:'input',  	width:'120px',  style:'text-align:left'},
            {caption: ["원천징수 사업자등록번호"],         ref: 'WITHHOLD_BIZ_REGNO',    type:'input',  	width:'120px',  style:'text-align:left'},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
        gvwList.bind('dblclick', 'fn_gvwListDblclick');
        gvwList.bind('valuechanged','fn_gvwListValueChanged');
        gvwList.bind('afterrebuild','fn_gvwListAfterRebuild');
        gvwList.bind('afterrefresh','fn_gvwListAfterRebuild');
    }

    const fn_view = async function () {
        var nRow = gvwList.getRow();
        if (nRow < 0)
            return;

        if(gvwList.getRowStatus(nRow) != 0)
            return;

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
                gvwList.setColDisabled(i, false);
            }
        }

        let seletedTapPage = SBUxMethod.get('idxTab');
        if (seletedTapPage == 'tabPageEx1') {
            fnQRY_P_TRD1010_Q("DETAIL");
        } else if (seletedTapPage == 'tabPageEx3') {
            fnQRY_P_TRD1010_Q("ACCOUNT");
        }
    }

    const fn_gvwListDblclick = async function () {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();

        if(!gvwList.getColDisabled(nCol)) {
            if (nCol == 10 || nCol == 11 || nCol == 14 || nCol == 15) {
                fn_findAccountNoForGvwList(nRow, nCol);
            }
        }
    }

    const fn_gvwListValueChanged = async function () {
        var nRow = gvwList.getRow();
        if (nRow < 0)
            return;

        // 수량, 단가 변경시 금액 계산
        if (nRow == "exchange_rate" || nRow == "original_amount") {
            let dAmount = Math.round(parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))) * parseFloat(gvwList.getCellData(nRow, gvwList.getColRef("ORIGINAL_AMOUNT"))), p_currUnit);
            gvwList.setCellData(nRow, gvwList.getColRef("FUNCTIONAL_AMOUNT"), dAmount);
        }

        if (nRow == "in_deposit_code" || nRow == "out_deposit_code") {
            if (gvwList.getCellData(nRow, gvwList.getColRef("TXN_TYPE")) == "1") {
                if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("IN_DEPOSIT_CODE"))) != "" && gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("OUT_DEPOSIT_CODE"))) != "") {
                    if (gvwList.getCellData(nRow, gvwList.getColRef("IN_DEPOSIT_CODE")) == gvwList.getCellData(nRow, gvwList.getColRef("OUT_DEPOSIT_CODE"))) {
                        gfn_comAlert("E0000", "같은 계좌번호로 이체할 수 없습니다.");
                    }
                }
            }
        }
    }

    const fn_gvwListAfterRebuild = async function() {
        let gvwListData = gvwList.getGridDataAll();

        for(var i = 0; i < gvwListData.length; i++) {
            if(gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("CONFIRM_FLAG"))) != "Y")
                gvwList.setRowStyle((i+1), 'data', 'background', '#D3D3D3');
        }
    }

    const fn_idxTabClick = async function () {
        if (gvwList.getRow() < 0)
            return;

        let seletedTapPage = SBUxMethod.get('idxTab');
        if (seletedTapPage == 'tabPageEx1') {
            fnQRY_P_TRD1010_Q("DETAIL");
        } else if (seletedTapPage == 'tabPageEx3') {
            fnQRY_P_TRD1010_Q("ACCOUNT");
        }
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonFundList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [2],
                sum : [20,21],
            },
            datasorting	: true,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption: ["ID"],         ref: 'TREASURY_ID',    type:'output',  	width:'52px',  style:'text-align:left'},
            {caption: ["자금배치번호"],         ref: 'TREASURY_BATCH_NO',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'TREASURY_LINE_NUM',    type:'output',  	width:'42px',  style:'text-align:left'},
            {caption: ["지급일"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급예정일"],       ref: 'PLANNED_PAY_DATE', 		type:'datepicker',  	width:'87px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래유형"], 		ref: 'TXN_GROUP_CODE',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonTxnGroupCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래처"], 		ref: 'PAYER_ID',   	    type:'combo', style:'text-align:left' ,width: '97px',
                typeinfo: {
                    ref			: 'jsonPayerId',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표유형"], 		ref: 'DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표ID"],         ref: 'DOC_ID',    type:'output',  	width:'45px',  style:'text-align:left', hidden: true},
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'96px',  style:'text-align:left'},
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["은행"], 		ref: 'BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '87px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계좌번호"],         ref: 'ACCOUNT_NUM',    type:'output',  	width:'116px',  style:'text-align:left'},
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
                    ref			: 'jsonTrPayMethod',
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
            {caption: ["통화"],         ref: 'CURRENCY_CODE',    type:'output',  	width:'63px',  style:'text-align:left'},
            {caption: ["환산유형"],         ref: 'EXCHANGE_TYPE',    type:'output',  	width:'63px',  style:'text-align:left'},
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'68px',  style:'text-align:left'},
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'160px',  style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
        gvwDetail.bind('dblclick', 'fn_gvwDetailDblclick');
    }

    const fn_gvwDetailDblclick = async function() {
        if (gvwDetail.getRow() < 0)
            return;

        if (nRow == gvwDetail.getColRef("TREASURY_BATCH_NO")) {
            var param = {
                TREASURY_BATCH_NO : gfn_nvl(gvwDetail.getCellData(nRow, gvwDetail.getColRef("TREASURY_BATCH_NO"))) == "" ? "" : gfn_nvl(gvwDetail.getCellData(nRow, gvwDetail.getColRef("TREASURY_BATCH_NO"))),
                COMP_CODE : gv_ma_selectedApcCd,
                FI_ORG_CODE : gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')),
                ASAVE : "N",
                APRINT : "Y",
                target : "MA_A20_060_030_700"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        } else if(nRow == gvwDetail.getColRef("DOC_NAME")) {
            // TODO FIG2210_99 개발 완료시 적용 필요
            var param = {
                WORK_TYPE : "VIEW",
                DOC_ID : gvwDetail.getCellData(nRow, gvwDetail.getColRef("DOC_ID")),
                target : "MA_A20_030_020_150"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        }
    }

    function fn_createGvwAccountGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAccount';
        SBGridProperties.id 				= 'gvwAccount';
        SBGridProperties.jsonref 			= 'jsonAccountingList';
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
            {caption: ["원가중심점"],           ref: 'COST_CENTER_CODE', 		        type:'combo',  	width:'150px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCostCenterCode',
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

        ];

        gvwAccount = _SBGrid.create(SBGridProperties);
        gvwAccount.bind('dblclick', 'fn_gvwAccountDblclick');
    }

    const fn_gvwAccountDblclick = async function() {
        // TODO FIG2210_99 개발 완료시 적용 필요
        if (gvwAccount.getRow() < 0)
            return;

        if(nRow == gvwAccount.getColRef("DOC_NAME")) {
            var param = {
                WORK_TYPE : "VIEW",
                DOC_ID : gvwAccount.getCellData(nRow, gvwAccount.getColRef("DOC_ID")),
                target : "MA_A20_030_020_150"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        }
    }

    const fn_findBankCsCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_BANK_CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '통화 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_BANK'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명"]
            ,searchInputFields		: ["CS_CODE", "CS_NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "은행코드", "은행명", "사업자번호", "주소"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BANK_CODE", "BANK_NAME", "BIZ_REGNO", "ADDRESS"]
            ,tableColumnWidths		: ["100px", "200px", "100px", "100px", "120px", "300px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_BANK_CS_NAME', data.CS_NAME);
                SBUxMethod.set('SRCH_BANK_CS_CODE', data.CS_CODE);
            },
        });
    }

    const fn_findPayCurrencyCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_NAME"));
        var replaceText0 	= "_CURRENCY_CODE_";
        var replaceText1 	= "_CURRENCY_NAME_";
        var strWhereClause 	= "AND CURRENCY_CODE LIKE '%" + replaceText0 + "%' AND CURRENCY_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '통화 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CURRENCY_USE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "코드명"]
            ,searchInputFields		: ["CURRENCY_CODE", "CURRENCY_NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["통화코드", "통화명", "비고"]
            ,tableColumnNames		: ["CURRENCY_CODE" , "CURRENCY_NAME", "DESCIPTION"]
            ,tableColumnWidths		: ["60px"    , "100px" , "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_PAY_CURRENCY_NAME', data.CURRENCY_NAME);
                SBUxMethod.set('SRCH_PAY_CURRENCY_CODE', data.CURRENCY_CODE);
            },
        });
    }

    const fn_findAccountNo = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPOSIT_CODE"));
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
            ,searchInputValues		: [searchText, ""]
            ,height					: '400px'
            ,tableHeader			: ["예적금코드", "예적금명", "계좌번호", "계좌유형", "금융기관코드", "금융기관명", "수금자금수지", "수금계정", "수금계정명", "수수료계정", "수수료계정명", "통화코드", "은행코드"]
            ,tableColumnNames		: ["DEPOSIT_CODE" , "DEPOSIT_NAME", "ACCOUNT_NUM", "DEPOSIT_TYPE", "BANK_CS_CODE", "BANK_CS_NAME", "RECEIPT_TR_TYPE", "RECEIPT_ACCOUNT", "RECEIPT_ACCOUNT_NAME", "FEE_ACCOUNT", "FEE_ACCOUNT_NAME", "CURRENCY_CODE", "BANK_CODE"]
            ,tableColumnWidths		: ["100px", "200px", "140px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_ACCOUNT_NO', data.ACCOUNT_NUM);
                SBUxMethod.set('SRCH_DEPOSIT_CODE', data.DEPOSIT_CODE);
            },
        });
    }

    const fn_findAccountNoForGvwList = function(nRow, nCol) {
        var replaceText0 	= "_DEPOSIT_CODE_";
        var replaceText1 	= "_DEPOSIT_NAME_";
        var strWhereClause 	= "AND DEPOSIT_CODE LIKE '%" + replaceText0 + "%' AND DEPOSIT_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '계좌정보(예적금원장) 정보');
        SBUxMethod.openModal('modal-compopup1');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_DEPOSIT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["예적금코드", "예적금명" ]
            ,searchInputFields		: ["DEPOSIT_CODE", "DEPOSIT_NAME"]
            ,searchInputValues		: ["", ""]
            ,height					: '400px'
            ,tableHeader			: ["예적금코드", "예적금명", "계좌번호", "계좌유형", "금융기관코드", "금융기관명", "수금자금수지", "수금계정", "수금계정명", "수수료계정", "수수료계정명", "통화코드", "은행코드"]
            ,tableColumnNames		: ["DEPOSIT_CODE" , "DEPOSIT_NAME", "ACCOUNT_NUM", "DEPOSIT_TYPE", "BANK_CS_CODE", "BANK_CS_NAME", "RECEIPT_TR_TYPE", "RECEIPT_ACCOUNT", "RECEIPT_ACCOUNT_NAME", "FEE_ACCOUNT", "FEE_ACCOUNT_NAME", "CURRENCY_CODE", "BANK_CODE"]
            ,tableColumnWidths		: ["100px", "200px", "140px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                if(nCol == 10 || nCol == 11) {
                    gvwList.setCellData(nRow, gvwList.getColRef("IN_ACCOUNT_NO"), data.ACCOUNT_NUM);
                    gvwList.setCellData(nRow, gvwList.getColRef("IN_DEPOSIT_CODE"), data.DEPOSIT_CODE);
                } else {
                    gvwList.setCellData(nRow, gvwList.getColRef("OUT_ACCOUNT_NO"), data.ACCOUNT_NUM);
                    gvwList.setCellData(nRow, gvwList.getColRef("OUT_DEPOSIT_CODE"), data.DEPOSIT_CODE);
                }

            },
        });
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_GATE", "OR");
        SBUxMethod.set("SRCH_MULTI_CS_YN", "N");
        SBUxMethod.set("SRCH_MULTI_M_YN", "N");
        SBUxMethod.set("SRCH_MULTI_A_YN", "N");
        SBUxMethod.set("SRCH_BEFORE_INCLUDE_YN", "N");

        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        SBUxMethod.set("SRCH_DATE_FR_P", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth() - 1, new Date().getDay())));
        SBUxMethod.set("SRCH_DATE_TO_P", gfn_dateToYmd(new Date())); // TODO GetServerDateTime()

        SBUxMethod.set("SRCH_PAY_CURRENCY_NAME", p_currName);
        SBUxMethod.set("SRCH_PAY_CURRENCY_CODE", p_currCode);
        gfnma_multiSelectSet('#SRCH_TXN_TYPE', 'SUB_CODE', 'CODE_NAME', "1");

        //SetLookUp(grdDetail, "colplayer_id_d", "L_COMP_ID", "comp_code = '" + SessionInfo.CompCode + "'"); //20160526
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwDetailGrid();
        fn_createGvwAccountGrid();
        await fn_onload();
    });

    const fnQRY_P_TRD1010_Q = async function (strWorkType) {
        var nRow = gvwList.getRow();

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        let DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR_P"));
        let DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO_P"));
        let TXN_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_TYPE'));
        let CURRENCY_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_CODE"));
        let BANK_CS_CODE = strWorkType == "Q" ? gfn_nvl(SBUxMethod.get("SRCH_BANK_CS_CODE")) : "";
        let BANK_ACCOUNT_NO = strWorkType == "Q" ? gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_CODE")) : "";
        let TXN_ID = strWorkType == "Q" ? 0 : gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("TXN_ID"))) == "" ? 0 : parseInt(gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("TXN_ID"))));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_DATE_FR : DATE_FR,
            V_P_DATE_TO : DATE_TO,
            V_P_TXN_TYPE : TXN_TYPE,
            V_P_CURRENCY_CODE : CURRENCY_CODE,
            V_P_BANK_CS_CODE : BANK_CS_CODE,
            V_P_BANK_ACCOUNT_NO : BANK_ACCOUNT_NO,
            V_P_TXN_ID : TXN_ID,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectTrd1010List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(strWorkType == "Q") {
                    jsonDepositTransactionList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            CHECK_YN: item.CHECK_YN,
                            TXN_ID: item.TXN_ID,
                            TXN_TYPE: item.TXN_TYPE,
                            TXN_DATE: item.TXN_DATE,
                            OUT_DEPOSIT_CODE: item.OUT_DEPOSIT_CODE,
                            OUT_BANK_NAME: item.OUT_BANK_NAME,
                            OUT_ACCOUNT_NO: item.OUT_ACCOUNT_NO,
                            OUT_DEPOSIT_SEQ: item.OUT_DEPOSIT_SEQ,
                            IN_DEPOSIT_CODE: item.IN_DEPOSIT_CODE,
                            IN_BANK_NAME: item.IN_BANK_NAME,
                            IN_ACCOUNT_NO: item.IN_ACCOUNT_NO,
                            IN_DEPOSIT_SEQ: item.IN_DEPOSIT_SEQ,
                            CURRENCY_CODE: item.CURRENCY_CODE,
                            IN_CURRENCY_CODE: item.IN_CURRENCY_CODE,
                            EXCHANGE_TYPE: item.EXCHANGE_TYPE,
                            EXCHANGE_RATE: item.EXCHANGE_RATE,
                            ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
                            FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
                            INTEREST_RATE: item.INTEREST_RATE,
                            INTEREST_AMOUNT: item.INTEREST_AMOUNT,
                            CTAX_RATE: item.CTAX_RATE,
                            CTAX_WITHHOLD_AMOUNT: item.CTAX_WITHHOLD_AMOUNT,
                            PTAX_RATE: item.PTAX_RATE,
                            PTAX_WITHHOLD_AMOUNT: item.PTAX_WITHHOLD_AMOUNT,
                            CONFIRM_FLAG: item.CONFIRM_FLAG,
                            FI_ORG_CODE: item.FI_ORG_CODE,
                            SITE_CODE: item.SITE_CODE,
                            PAY_METHOD: item.PAY_METHOD,
                            DESCRIPTION: item.DESCRIPTION,
                            ACCOUNT_COMPLETE_FLAG: item.ACCOUNT_COMPLETE_FLAG,
                            WITHHOLD_BRANCH_NAME: item.WITHHOLD_BRANCH_NAME,
                            WITHHOLD_BIZ_REGNO: item.WITHHOLD_BIZ_REGNO,
                        }
                        jsonDepositTransactionList.push(msg);
                    });

                    gvwList.rebuild();

                    if (jsonDepositTransactionList.length > 0) {
                        gvwMaster.clickRow(1);
                    }
                } else if(strWorkType == "DETAIL") {
                    jsonFundList.length = 0;
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
                            DOC_ID : item.DOC_ID,
                            DOC_NAME : item.DOC_NAME,
                            DOC_STATUS : item.DOC_STATUS,
                            PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                            PAY_DATE : item.PAY_DATE,
                            TR_PAY_METHOD : item.TR_PAY_METHOD,
                            PAY_METHOD : item.PAY_METHOD,
                            STATUS_CODE : item.STATUS_CODE,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                            EXCHANGE_RATE : item.EXCHANGE_RATE,
                            ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                            FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT,
                            ACCT_RULE_CODE : item.ACCT_RULE_CODE,

                        }
                        jsonFundList.push(msg);
                    });

                    gvwDetail.rebuild();
                } else if(strWorkType == "ACCOUNT") {
                    jsonAccountingList.length = 0;
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
                            TRADER_ID_D : item.TRADER_ID_D,
                            CURRENCY_CODE_D : item.CURRENCY_CODE_D,
                            EXCHANGE_RATE_DR : item.EXCHANGE_RATE_DR,
                            EXCHANGE_RATE_CR : item.EXCHANGE_RATE_CR,
                        }
                        jsonAccountingList.push(msg);
                    });

                    gvwAccount.rebuild();
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

    const fnSET_P_TRD1010_S1 = async function (strWorkType) {
        // 비즈니스 로직 정보
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        let listData = [];

        if (gvwListCheckedList.length != 0) {
            gvwListCheckedList.forEach((item, index) => {
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
                        V_P_FI_ORG_CODE: gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("FI_ORG_CODE"))),
                        V_P_SITE_CODE: gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("SITE_CODE"))),
                        V_P_ACCT_RULE_CODE: p_defaultAcctRule,
                        V_P_TXN_DATE : gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("TXN_DATE"))),
                        V_P_TXN_TYPE : gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("TXN_TYPE"))),
                        V_P_TXN_ID : parseInt(gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("TXN_ID")))),
                        V_P_CONFIRM_FLAG : gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("CONFIRM_FLAG"))),
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
                const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertTrd1010Sub.do", {listData: listData});

                const data = await postJsonPromise;
                console.log('data:', data);
                try {
                    if (_.isEqual("S", data.resultStatus)) {
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
            } else {
                return false;
            }
        } else {
            gfn_comAlert("E0000", "check된 Row가 없습니다.");
            return false;
        }
    }

    // 행 추가
    const fn_addRow = function () {
        let rowVal = gvwList.getRow();

        jsonDepositTransactionList.push()

        //데이터가 없고 행선택이 없을경우.
        if (rowVal == -1) {
            gvwList.addRow(true, {
                FI_ORG_CODE: p_fiOrgCode,
                SITE_CODE: p_siteCode,
                CURRENCY_CODE: p_currCode,
                EXCHANGE_RATE: 1,
                CONFIRM_FLAG: "N",
                TXN_DATE: gfn_dateToYmd(new Date()),
                TXN_TYPE: gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_TYPE')) == "" ? "1" : gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_TYPE'))
            });
        } else {
            gvwList.insertRow(rowVal, 'below', {
                FI_ORG_CODE: p_fiOrgCode,
                SITE_CODE: p_siteCode,
                CURRENCY_CODE: p_currCode,
                EXCHANGE_RATE: 1,
                CONFIRM_FLAG: "N",
                TXN_DATE: gfn_dateToYmd(new Date()),
                TXN_TYPE: gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_TYPE')) == "" ? "1" : gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_TYPE'))
            });
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwList.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwList.deleteRow(rowVal);
        }
    }

    const fn_interface = async function () {
        let updatedData = gvwList.getUpdateData(true, 'all');

        if (updatedData.length > 0) {
            if (!gfn_comConfirm("Q0000", "저장되지 않은 데이터가 있습니다. 저장하지 않고 진행하시겠습니까?"))
                return;
        }

        if (fnSET_P_TRD1010_S1("ACCOUNT")) {
            fn_search();
        }
    }

    const fn_delete = async function () {
        let updatedData = gvwList.getUpdateData(true, 'all');

        if (updatedData.length > 0) {
            if (!gfn_comConfirm("Q0000", "저장되지 않은 데이터가 있습니다. 저장하지 않고 진행하시겠습니까?"))
                return;
        }

        if (fnSET_P_TRD1010_S1("CANCEL")) {
            fn_search();
        }
    }

    const fn_confirm = async function () {
        let updatedData = gvwList.getUpdateData(true, 'all');

        if (updatedData.length > 0) {
            if (!gfn_comConfirm("Q0000", "저장되지 않은 데이터가 있습니다. 저장하지 않고 진행하시겠습니까?"))
                return;
        }

        if (fnSET_P_TRD1010_S1("CONFIRM")) {
            fn_search();
        }
    }

    const fn_cancel = async function () {
        let updatedData = gvwList.getUpdateData(true, 'all');

        if (updatedData.length > 0) {
            if (!gfn_comConfirm("Q0000", "저장되지 않은 데이터가 있습니다. 저장하지 않고 진행하시겠습니까?"))
                return;
        }

        if (fnSET_P_TRD1010_S1("UNCONFIRM")) {
            fn_search();
        }
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_save = async function () {
        // 비즈니스 로직 정보
        let updatedData = gvwList.getUpdateData(true, 'all');
        let listData = [];

        updatedData.forEach((item, index) => {
            strLastWorkType = dr["RowStatus"].ToString();

            if (gfn_nvl(item.data.TXN_ID) == "") {
                strTxn_id = "0";
            } else{
                strTxn_id = gfn_nvl(item.data.TXN_ID);
            }

            if (gfn_nvl(item.data.IN_DEPOSIT_SEQ) == "") {
                strin_deposit_seq = "0";
            } else {
                strin_deposit_seq = gfn_nvl(item.data.IN_DEPOSIT_SEQ);
            }

            if (gfn_nvl(item.data.OUT_DEPOSIT_SEQ) == "") {
                strout_deposit_seq = "0";
            } else {
                strout_deposit_seq = gfn_nvl(item.data.OUT_DEPOSIT_SEQ);
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
                    V_P_SITE_CODE : gfn_nvl(item.data.SITE_CODE),
                    V_P_TXN_ID : parseInt(gfn_nvl(strTxn_id)),
                    V_P_TXN_TYPE : gfn_nvl(item.data.TXN_TYPE),
                    V_P_TXN_DATE : gfn_nvl(item.data.TXN_DATE),
                    V_P_OUT_DEPOSIT_CODE : gfn_nvl(item.data.OUT_DEPOSIT_CODE),
                    V_P_OUT_DEPOSIT_SEQ : parseInt(gfn_nvl(strout_deposit_seq)),
                    V_P_IN_DEPOSIT_CODE : gfn_nvl(item.data.IN_DEPOSIT_CODE),
                    V_P_IN_DEPOSIT_SEQ : parseInt(gfn_nvl(strin_deposit_seq)),
                    V_P_CURRENCY_CODE : gfn_nvl(item.data.CURRENCY_CODE),
                    V_P_EXCHANGE_TYPE : gfn_nvl(item.data.EXCHANGE_TYPE),
                    V_P_EXCHANGE_RATE : Number(gfn_nvl(item.data.EXCHANGE_RATE)),
                    V_P_ORIGINAL_AMOUNT : Number(gfn_nvl(item.data.ORIGINAL_AMOUNT)),
                    V_P_FUNCTIONAL_AMOUNT : Number(gfn_nvl(item.data.FUNCTIONAL_AMOUNT)),
                    V_P_INTEREST_RATE : Number(gfn_nvl(item.data.INTEREST_RATE)),
                    V_P_INTEREST_AMOUNT : Number(gfn_nvl(item.data.INTEREST_AMOUNT)),
                    V_P_CTAX_RATE : Number(gfn_nvl(item.data.CTAX_RATE)),
                    V_P_CTAX_WITHHOLD_AMOUNT : Number(gfn_nvl(item.data.CTAX_WITHHOLD_AMOUNT)),
                    V_P_PTAX_RATE : Number(gfn_nvl(item.data.PTAX_RATE)),
                    V_P_PTAX_WITHHOLD_AMOUNT : Number(gfn_nvl(item.data.PTAX_WITHHOLD_AMOUNT)),
                    V_P_WITHHOLD_BRANCH_NAME : gfn_nvl(item.data.WITHHOLD_BRANCH_NAME),
                    V_P_WITHHOLD_BIZ_REGNO : gfn_nvl(item.data.WITHHOLD_BIZ_REGNO),
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
            const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertTrd1010List.do", {listData: listData});

            const data = await postJsonPromise;
            console.log('data:', data);
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
    }

    const fn_search = async function () {
        let updatedData = gvwList.getUpdateData(true, 'all');

        if (updatedData.length > 0) {
            if (!gfn_comConfirm("Q0000", "저장되지 않은 데이터가 있습니다. 저장하지 않고 진행하시겠습니까?"))
                return;
        }

        fnQRY_P_TRD1010_Q("Q");
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>