<%
    /**
     * @Class Name 		: trp1060.jsp
     * @Description 	: 자금전표등록 화면
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
    <title>title : 자금전표등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <%--<div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>--%>
        <div class="box-body">

            <!--[pp] 검색 -->
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span></span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist" style="display: flex; align-items: center; justify-content: flex-end;">
                        <div style="display: flex; align-items: center; justify-content: left; margin-right: 5%">
                            <span id="LBL_TITLE_CONFIRM" style="margin-right: 10px;">▶ 자금계획 확정</span>
                            <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="fn_confirm" style="float: right;"></sbux-button>
                            <sbux-button id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="fn_unconfirm" style="float: right;"></sbux-button>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: left; margin-right: 5%">
                            <span id="LBL_TITLE_END" style="margin-right: 10px;">▶ 자금실적처리</span>
                            <sbux-button id="btnEnd" name="btnEnd" uitype="normal" text="완료" class="btn btn-sm btn-outline-danger" onclick="fn_end" style="float: right;"></sbux-button>
                            <sbux-button id="btnEndCancel" name="btnEndCancel" uitype="normal" text="완료 취소" class="btn btn-sm btn-outline-danger" onclick="fn_endCancel" style="float: right;"></sbux-button>
                        </div>
                        <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력" class="btn btn-sm btn-outline-danger" onclick="fn_print" style="float: right;"></sbux-button>
                    </div>
                </div>
                <!--[APC] START -->
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">회계단위</th>
                        <td class="td_input" style="border-right:hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">자금번호</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="SRCH_TREASURY_BATCH_NO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_TRANS_ID" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_FINANCE_FLAG" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_DATE" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_CURRENCY_CODE" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_EXCHANGE_RATE" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_DOC_DATE" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_FROM_DATE" class="form-control input-sm"></sbux-input>
                            <sbux-input uitype="hidden" uitype="text" id="SRCH_TO_DATE" class="form-control input-sm"></sbux-input>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>자금계획</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btnDeleteRowForGvwList" name="btnDeleteRowForGvwList" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwList" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRowForGvwList" name="btnAddRowForGvwList" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwList" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddInvoiceItem" name="btnAddInvoiceItem" uitype="normal" text="지급리스트 생성" class="btn btn-sm btn-outline-danger" onclick="fn_addInvoiceItem" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwList" style="height:200px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>전표내역</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist" style="display: flex; align-items: center; justify-content: flex-end;">
                        <div style="display: flex; align-items: center; justify-content: left; margin-right: 5%">
                            <span style="margin-right: 10px;">차이(원래)</span>
                            <sbux-input id="DIFF_ORIGINAL" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: left; margin-right: 5%">
                            <span style="margin-right: 10px;">차이(환산)</span>
                            <sbux-input id="DIFF_FUNCTIONAL" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        </div>
                        <sbux-button id="btnAddRowForGvwWFItem" name="btnAddRowForGvwWFItem" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwWFItem" style="float: right;"></sbux-button>
                        <sbux-button id="btnDeleteRowForGvwWFItem" name="btnDeleteRowForGvwWFItem" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwWFItem" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwWFItem" style="height:200px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>송장내역</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btnDeleteRowForGvwAct" name="btnDeleteRowForGvwAct" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwAct" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRowForGvwAct" name="btnAddRowForGvwAct" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwAct" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwAct" style="height:300px;"></div>
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
    var p_isAccountManager = "${loginVO.maIsAccountManager}";
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_defaultAcctRule = "${loginVO.maDefaultAcctRule}";
    var p_deptCode = "${loginVO.maDeptCode}";
    var p_empCd = '${loginVO.maEmpCode}';
    //-----------------------------------------------------------

    let bSave_YN = false; //저장여부
    let bPrint_YN = false; //출력여부
    let bfocuschange = false;
    let bQeury_yn = false;

    let Allcheck1 = "N";
    var htInvoice = {};
    var dtKeyInvoiceMapping = {};

    var jsonFiOrgCode = []; // 회계단위
    var jsonTxnGroupCode = []; // 입출
    var jsonBankCode = []; // 은행코드
    var jsonPayTermCode = []; // 지급조건
    var jsonPayMethod = []; // 지불방식
    var jsonStatusCode = []; // 상태
    var jsonSiteCode = []; // 사업장
    var jsonDocType = []; // 전표구분
    var jsonDocStatus = []; // 전표상태
    var jsonCurrenvyCode = []; // 통화
    var jsonExchangeType = []; // 환율유형
    var jsonHoldYn = []; // 보류여부
    var jsonHoldReason = []; // 보류사유
    var jsonDebitCredit = []; // 차/대
    var jsonLineType = []; // 라인
    var jsonUom = []; // 단위
    var jsonAccItemCode = []; // 관리항목코드
    var jsonCurrencyCode = []; // 통화코드

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var gvwWFItem;
    var gvwAct;

    var jsonFinancialPlanList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonDocList = [];
    var jsonInvoiceList = [];


    const fn_initSBSelect = async function() {
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);

        let rst = await Promise.all([
            // 회계단위
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
            // 입출
            gfnma_setComSelect(['gvwList'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 은행코드
            gfnma_setComSelect(['gvwList'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 지급조건
            gfnma_setComSelect(['gvwList'], jsonPayTermCode, 'L_PAY_DATE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
            // 지불방식
            gfnma_setComSelect(['gvwList'], jsonPayMethod, 'L_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['gvwList'], jsonStatusCode, 'L_TR_STATUS', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CODE', 'NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwList'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['gvwWFItem', 'gvwList'], jsonDocType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['gvwList'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['gvwList'], jsonCurrenvyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 환율유형
            gfnma_setComSelect(['gvwWFItem', 'gvwList'], jsonExchangeType, 'L_COM034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보류여부
            gfnma_setComSelect(['gvwList'], jsonHoldYn, 'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보류사유
            gfnma_setComSelect(['gvwList'], jsonHoldReason, 'L_COM042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차/대
            gfnma_setComSelect(['gvwWFItem'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // LINE
            gfnma_setComSelect(['gvwWFItem', 'gvwAct'], jsonLineType, 'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 단위
            gfnma_setComSelect(['gvwWFItem'], jsonUom, 'L_LGS001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'UNIT_CODE', 'UNIT_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwWFItem'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwWFItem'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonFinancialPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.frozencols = 12;
        SBGridProperties.columns = [
            {caption: ["KEY_ID"],         ref: 'KEY_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["품의번호"],         ref: 'TREASURY_ID',    type:'output',  	width:'117px',  style:'text-align:left', hidden: true},
            {caption: ["상태"], 		ref: 'STATUS_CODE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["순번"],         ref: 'TREASURY_LINE_NUM',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["입출"], 		ref: 'TXN_GROUP_CODE',   	    type:'combo', style:'text-align:left' ,width: '81px',
                typeinfo: {
                    ref			: 'jsonTxnGroupCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["입출예정일"],       ref: 'PLANNED_PAY_DATE', 		type:'datepicker',  	width:'109px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["전표번호"],         ref: 'DOC_H_DOC_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["입출일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'110px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["예적금코드"],         ref: 'DEPOSIT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["예적금명"],         ref: 'DEPOSIT_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["지급조건"], 		ref: 'PAY_TERM_CODE',   	    type:'combo', style:'text-align:left' ,width: '192px',
                typeinfo: {
                    ref			: 'jsonPayTermCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["은행"], 		ref: 'BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계좌번호"],         ref: 'BANK_ACCOUNT_NO',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["거래처"],         ref: 'PAYER_ID',    type:'output',  	width:'128px',  style:'text-align:left', hidden: true},
            {caption: ["거래처"],         ref: 'PAYER_NAME',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["거래처은행"], 		ref: 'PAYER_BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래처계좌번호"],         ref: 'PAYER_BANK_ACCOUNT',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["거래처예금주"],         ref: 'PAYER_BANK_ACCOUNT_OWNER',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["지불방식"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["VOUCHER_YN"],         ref: 'VOUCHER_YN',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["계획 비고"],         ref: 'DESCRIPTION',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["FBS_TXN_DATE"],         ref: 'FBS_TXN_DATE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["FBS_TXN_TIME"],         ref: 'FBS_TXN_TIME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["DOC_ID"],         ref: 'DOC_H_DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["회계단위"], 		ref: 'DOC_H_FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["사업장"], 		ref: 'DOC_H_SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["전표일자"],       ref: 'DOC_H_DOC_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["전표순번"],         ref: 'DOC_H_DOC_NUM',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["DOC_H_DOC_AMT"],         ref: 'DOC_H_DOC_AMT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["전표구분"], 		ref: 'DOC_H_DOC_TYPE',   	    type:'combo', style:'text-align:left' ,width: '123px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표상태"], 		ref: 'DOC_H_DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["결의부서"],         ref: 'DOC_H_DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결의부서"],         ref: 'DOC_H_DEPT_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["전표비고"],         ref: 'DOC_H_DESCRIPTION',    type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["통화"], 		ref: 'DOC_H_CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonCurrenvyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["환율유형"], 		ref: 'DOC_H_EXCHANGE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonExchangeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["환율"],         ref: 'DOC_H_EXCHANGE_RATE',    type:'output',  	width:'70px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
                , hidden: true
            },
            {caption: ["TEMP_AREA"],         ref: 'TEMP_AREA',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["VOUCHER_NO"],         ref: 'VOUCHER_NO',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["VOUCHER_TYPE"],         ref: 'VOUCHER_TYPE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["TEMP_AMT"],         ref: 'TEMP_AMT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["구분"],         ref: 'DOC_TYPE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["SOURCE_DOC"],         ref: 'SOURCE_DOC',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["보류여부"], 		ref: 'HOLD_FLAG',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonHoldYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["보류사유"], 		ref: 'HOLD_REASON',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonHoldReason',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["어음만기일"],       ref: 'BILL_DUE_DATE', 		type:'datepicker',  	width:'109px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["어음번호"],         ref: 'BILL_NO',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["어음만기지급일"],       ref: 'BILL_DUE_PAY_DATE', 		type:'datepicker',  	width:'109px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
        ];

        gvwList = _SBGrid.create(SBGridProperties);
    }

    // 행 추가
    const fn_addRowForGvwList = function () {
        let rowVal = gvwList.getRow();
        if (rowVal == -1){
            gvwList.addRow(true);
        }else{
            gvwList.insertRow(rowVal);
        }
    }

    // 행 삭제
    const fn_deleteRowForGvwList = function() {
        let rowVal = gvwList.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwList.deleteRow(rowVal);
        }
    }

    function fn_createGvwWFItemGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwWFItem';
        SBGridProperties.id 				= 'gvwWFItem';
        SBGridProperties.jsonref 			= 'jsonDocList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.frozencols = 9;
        SBGridProperties.columns = [
            {caption: ["ITEM_ID"],         ref: 'ITEM_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["KEY_ID"],         ref: 'KEY_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["순번"],         ref: 'ITEM_SEQ',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["TYPE"], 		ref: 'LINE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부가세유형"],         ref: 'VAT_TYPE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["부가세유형명"],         ref: 'VAT_NAME',    type:'output',  	width:'124px',  style:'text-align:left'},
            {caption: ["계정코드"],         ref: 'ACCOUNT_CODE',    type:'output',  	width:'80px',  style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["계정과목명"],         ref: 'ACCOUNT_NAME',    type:'output',  	width:'170px',  style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["차/대"], ref: 'DEBIT_CREDIT', type: 'combo', width: '66px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonDebitCredit',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["ORIGINAL_AMT_BEFORE"],         ref: 'ORIGINAL_AMT_BEFORE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["원래금액"],         ref: 'ORIGINAL_AMT',    type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["환산금액"],         ref: 'FUNCTIONAL_AMT',    type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["품목"],         ref: 'ITEM_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["단위"], 		ref: 'UOM',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonUom',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["수량"],         ref: 'TXN_QTY',    type:'output',  	width:'120px',  style:'text-align:left', hidden: true},
            {caption: ["귀속부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["원가중심점"],         ref: 'COST_CENTER_CODE',    type:'output',  	width:'71px',  style:'text-align:left'},
            {caption: ["원가중심점명"],         ref: 'COST_CENTER_NAME',    type:'output',  	width:'174px',  style:'text-align:left'},
            {caption: ["부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["적요"], ref: 'DESCRIPTION', type: 'output', width: '300px', style: 'text-align:left'},
            {caption: ["프로젝트코드"],         ref: 'PROJECT_CODE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["프로젝트명"],         ref: 'PROJECT_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["관리항목1"], ref: 'ACC_ITEM_CODE1', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목2"], ref: 'ACC_ITEM_CODE2', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목3"], ref: 'ACC_ITEM_CODE3', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목4"], ref: 'ACC_ITEM_CODE4', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목5"], ref: 'ACC_ITEM_CODE5', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목6"], ref: 'ACC_ITEM_CODE6', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목7"], ref: 'ACC_ITEM_CODE7', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목8"], ref: 'ACC_ITEM_CODE8', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목9"], ref: 'ACC_ITEM_CODE9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["관리항목10"], ref: 'ACC_ITEM_CODE10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME1"], ref: 'ACC_ITEM_NAME1', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME2"], ref: 'ACC_ITEM_NAME2', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME3"], ref: 'ACC_ITEM_NAME3', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME4"], ref: 'ACC_ITEM_NAME4', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME5"], ref: 'ACC_ITEM_NAME5', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME6"], ref: 'ACC_ITEM_NAME6', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME7"], ref: 'ACC_ITEM_NAME7', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME8"], ref: 'ACC_ITEM_NAME8', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME9"], ref: 'ACC_ITEM_NAME9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME10"], ref: 'ACC_ITEM_NAME10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN1"], ref: 'ACC_ITEM_YN1', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN2"], ref: 'ACC_ITEM_YN2', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN3"], ref: 'ACC_ITEM_YN3', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN4"], ref: 'ACC_ITEM_YN4', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN5"], ref: 'ACC_ITEM_YN5', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN6"], ref: 'ACC_ITEM_YN6', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN7"], ref: 'ACC_ITEM_YN7', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN8"], ref: 'ACC_ITEM_YN8', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN9"], ref: 'ACC_ITEM_YN9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN10"], ref: 'ACC_ITEM_YN10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE1"], ref: 'DATA_TYPE1', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE2"], ref: 'DATA_TYPE2', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE3"], ref: 'DATA_TYPE3', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE4"], ref: 'DATA_TYPE4', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE5"], ref: 'DATA_TYPE5', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE6"], ref: 'DATA_TYPE6', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE7"], ref: 'DATA_TYPE7', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE8"], ref: 'DATA_TYPE8', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE9"], ref: 'DATA_TYPE9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["DATA_TYPE10"], ref: 'DATA_TYPE10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID1"], ref: 'POPUP_ID1', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID2"], ref: 'POPUP_ID2', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID3"], ref: 'POPUP_ID3', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID4"], ref: 'POPUP_ID4', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID5"], ref: 'POPUP_ID5', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID6"], ref: 'POPUP_ID6', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID7"], ref: 'POPUP_ID7', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID8"], ref: 'POPUP_ID8', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID9"], ref: 'POPUP_ID9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["POPUP_ID10"], ref: 'POPUP_ID10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE1"], ref: 'ACC_ITEM_VALUE1', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE2"], ref: 'ACC_ITEM_VALUE2', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE3"], ref: 'ACC_ITEM_VALUE3', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE4"], ref: 'ACC_ITEM_VALUE4', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE5"], ref: 'ACC_ITEM_VALUE5', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE6"], ref: 'ACC_ITEM_VALUE6', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE7"], ref: 'ACC_ITEM_VALUE7', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE8"], ref: 'ACC_ITEM_VALUE8', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE9"], ref: 'ACC_ITEM_VALUE9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE10"], ref: 'ACC_ITEM_VALUE10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME1"], ref: 'ACC_VALUE_NAME1', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME2"], ref: 'ACC_VALUE_NAME2', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME3"], ref: 'ACC_VALUE_NAME3', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME4"], ref: 'ACC_VALUE_NAME4', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME5"], ref: 'ACC_VALUE_NAME5', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME6"], ref: 'ACC_VALUE_NAME6', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME7"], ref: 'ACC_VALUE_NAME7', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME8"], ref: 'ACC_VALUE_NAME8', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME9"], ref: 'ACC_VALUE_NAME9', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME10"], ref: 'ACC_VALUE_NAME10', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["ACC_CHARACTER"], ref: 'ACC_CHARACTER', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["차/대변 구분"], ref: 'BALANCE_SIDE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["DOC_ID"], ref: 'DOC_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["원천소스"], ref: 'ITEM_DOC_TYPE', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonDocType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["원천전표번호"], ref: 'ITEM_DOC_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["원천라인ID"], ref: 'ITEM_SOURCE_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["건수"], ref: 'SOURCE_RECORD_COUNT', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["TMP_ACCOUNT_CODE"], ref: 'TMP_ACCOUNT_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["TMP_ACCOUNT_NAME"], ref: 'TMP_ACCOUNT_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["라인상태"], ref: 'DATA_STATUS', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["라인상태"], ref: 'DATA_STATUS', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["통화"], ref: 'CURRENCY_CODE', type: 'combo', style: 'text-align:left', width: '75px',
                typeinfo: {
                    ref: 'jsonCurrencyCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
            },
            {caption: ["환율유형"], ref: 'EXCHANGE_TYPE', type: 'combo', style: 'text-align:left', width: '75px',
                typeinfo: {
                    ref: 'jsonExchangeType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
            },
            {caption: ["환율"], ref: 'EXCHANGE_RATE', type: 'output', width: '70px', style: 'text-align:left'},
            {caption: ["원천징수여부"], ref: 'WITHHOLD_FLAG', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["증빙유형"], ref: 'WITHHOLD_TAX_TYPE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["원천징수거래처코드"], ref: 'WITHHOLD_CS_CODE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["원천징수세금코드2"], ref: 'WITHHOLD_TAX_TYPE2', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["원천징수거래처코드2"], ref: 'WITHHOLD_CS_CODE2', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["지급기일코드"], ref: 'PAY_TERM_CODE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["지급예정일"],       ref: 'EXPECTED_PAY_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급방법"], ref: 'PAY_METHOD', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["증빙유형"], ref: 'VOUCHER_TYPE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["증빙번호"], ref: 'VOUCHER_NO', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["증빙번호1"], ref: 'VOUCHER_NO1', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["증빙일자"],       ref: 'VOUCHER_RECEIPT_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사업단위코드"], ref: 'FI_ORG_CODE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["사업장코드"], ref: 'SITE_CODE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["반제완료여부"], ref: 'APPLY_COMPLETE_FLAG', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["반제완료일"],       ref: 'APPLY_COMPLETE_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["고객사코드"], ref: 'SALES_CS_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["고객사"], ref: 'SALES_CS_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["거래처코드"], ref: 'CS_CODE', type: 'output', width: '75px', style: 'text-align:left'},
            {caption: ["거래처"], ref: 'CS_NAME', type: 'output', width: '75px', style: 'text-align:left'},
        ];

        gvwWFItem = _SBGrid.create(SBGridProperties);
    }

    // 행 추가
    const fn_addRowForGvwWFItem = function () {
        let rowVal = gvwWFItem.getRow();
        if (rowVal == -1){
            gvwWFItem.addRow(true);
        }else{
            gvwWFItem.insertRow(rowVal);
        }
    }

    // 행 삭제
    const fn_deleteRowForGvwWFItem = function() {
        let rowVal = gvwWFItem.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwWFItem.deleteRow(rowVal);
        }
    }

    function fn_createGvwActGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAct';
        SBGridProperties.id 				= 'gvwAct';
        SBGridProperties.jsonref 			= 'jsonInvoiceList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["순번"],         ref: 'LINE_NUM',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["KEY_ID"],         ref: 'KEY_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["회계일자"],       ref: 'DOC_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["DOC_ID"],         ref: 'DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["배치번호"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["라인타입"], 		ref: 'LINE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["거래처명"],         ref: 'TRADER_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["거래처사업자번호"],         ref: 'CS_REG_NO',    type:'output',  	width:'110px',  style:'text-align:left',
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 10}
                , format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
            },
            {caption: ["계정과목"],         ref: 'ACCOUNT_CODE',    type:'output',  	width:'101px',  style:'text-align:left', hidden: true},
            {caption: ["계정과목"],         ref: 'ACCOUNT_NAME',    type:'output',  	width:'170px',  style:'text-align:left'},
            {caption: ["지급예정일"],       ref: 'EXPECTED_PAY_DATE', 		type:'datepicker',  	width:'92px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["자금수지"],         ref: 'TR_ACTIVITY_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["자금수지"],         ref: 'TR_ACTIVITY_NAME',    type:'output',  	width:'146px',  style:'text-align:left'},
            {caption: ["증빙번호"],         ref: 'VOUCHER_NO',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["ORIGINAL_AMOUNT_BEFORE"],         ref: 'ORIGINAL_AMOUNT_BEFORE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["원화환산금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["ITEM_ID"],         ref: 'ITEM_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["적요"],         ref: 'DESCRIPTION',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["ITEM_SEQ"],         ref: 'ITEM_SEQ',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["SOURCE_DOC"],         ref: 'SOURCE_DOC',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwAct = _SBGrid.create(SBGridProperties);
    }

    // 행 추가
    const fn_addRowForGvwAct = function () {
        let rowVal = gvwAct.getRow();
        if (rowVal == -1){
            gvwAct.addRow(true);
        }else{
            gvwAct.insertRow(rowVal);
        }
    }

    // 행 삭제
    const fn_deleteRowForGvwAct = function() {
        let rowVal = gvwAct.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwAct.deleteRow(rowVal);
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        let initObject = localStorage.getItem("callMain");
        await fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwWFItemGrid();
        fn_createGvwActGrid();

        if(!gfn_isEmpty(initObject)){
            initObject = JSON.parse(initObject);
            localStorage.removeItem("callMain");

            await fn_onload(initObject);
        } else {
            await fn_onload();
        }
    });

    window.addEventListener('message', async function(event){
        let obj = event.data;
        if(!gfn_isEmpty(obj)){
            await fn_onload(obj);
        } else {
            await fn_onload();
        }
    });

    // 신규
    function cfn_add() {
        fn_create();
    }

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

    const fn_onload = async function(parentParameter) {
        if (parentParameter) {
            if (gfn_nvl(parentParameter["APRINT"]) != "Y") {
                bPrint_YN = false;
            } else {
                bPrint_YN = true;
            }

            SBUxMethod.set("SRCH_TREASURY_BATCH_NO", gfn_nvl(parentParameter["TREASURY_BATCH_NO"]));
            gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', gfn_nvl(parentParameter["FI_ORG_CODE"]));

            if (gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")) == "")
                fn_create();
            else
                fn_search();
        }

        if (!p_isAccountManager) {
            $("#LBL_TITLE_CONFIRM").hide();
            $("#btnConfirm").hide();
            $("#btnUnconfirm").hide();

            $("#LBL_TITLE_END").hide();
            $("#btnEnd").hide();
            $("#btnEndCancel").hide();
        }

        htInvoice = {};

        dtKeyInvoiceMapping["KEY_ID"] = "";
        dtKeyInvoiceMapping["DOC_ID"] = "";
    }

    const fn_create = async function() {
        htInvoice = {};
        dtKeyInvoiceMapping = {};

        //InitControls(panBase);

        jsonFinancialPlanList.length = 0;
        jsonDocList.length = 0;
        jsonInvoiceList.length = 0;

        gvwList.rebuild();
        gvwWFItem.rebuild();
        gvwAct.rebuild();

        //btnSave.Enabled = true;

        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);

        if (gfn_nvl(SBUxMethod.get("SRCH_FROM_DATE")) == "") {
            SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date()));
        }

        if (gfn_nvl(SBUxMethod.get("SRCH_TO_DATE")) == "") {
            SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        }
    }

    const fn_save = async function() {
        if (jsonFinancialPlanList.length == 0) {
            gfn_comAlert("E0000", "저장할 데이터가 없습니다.");
            return;
        }

        if (gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")) == "") {
            if (!fnSET_P_TRP1060_S("GEN"))
                return;
        }

        if (fnSET_P_TRP1060_S("")) {
            fn_search();
        }
    }

    const fn_delete = async function() {
        if (gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")) == "") {
            return;
        }

        if (gfn_comConfirm("Q0000", "정말 삭제하시겠습니까? 삭제하시려면 예를 클릭하세요.")) {
            for (var i = 0; i < jsonFinancialPlanList.length; i++){
                if (gvwList.getCellData((i+1), gvwList.getColRef("STATUS_CODE")) != "1") {
                    gfn_comAlert("E0000", "자금계획 상태가 확정, 완료인 경우에는 삭제가 불가능합니다.")
                    return;
                }
            }

            if (fnSET_P_TRP1060_D("D")) {
                fn_create();
            }
        }
    }

    const fn_search = async function() {
        let TREASURY_BATCH_NO = gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO"));
        let FROM_DATE = gfn_nvl(SBUxMethod.get("SRCH_FROM_DATE"));
        let TO_DATE = gfn_nvl(SBUxMethod.get("SRCH_TO_DATE"));
        let TXN_DATE = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        let CURRENCY_CODE = gfn_nvl(SBUxMethod.get("SRCH_CURRENCY_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : p_fiOrgCode,
            V_P_TREASURY_BATCH_NO : TREASURY_BATCH_NO,
            V_P_TREASURY_LINE_NUM : 0,
            V_P_TREASURY_ID : 0,
            V_P_INVOICE_NO : '',
            V_P_FROM_DATE : FROM_DATE,
            V_P_TO_DATE : TO_DATE,
            V_P_TXN_DATE : TXN_DATE,
            V_P_CURRENCY_CODE : CURRENCY_CODE,
            V_P_DEPOSIT_CODE : '',
            V_P_TXN_GROUP : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectTrp1060List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                let iCmpltCnt = 0;
                jsonFinancialPlanList.length = 0;
                jsonDocList.length = 0;
                jsonInvoiceList.length = 0;

                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN : item.CHECK_YN,
                        KEY_ID : item.KEY_ID,
                        TREASURY_ID : item.TREASURY_ID,
                        TREASURY_LINE_NUM : item.TREASURY_LINE_NUM,
                        DOC_TYPE : item.DOC_TYPE,
                        TXN_GROUP_CODE : item.TXN_GROUP_CODE,
                        PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                        PAY_DATE : item.PAY_DATE,
                        DEPOSIT_CODE : item.DEPOSIT_CODE,
                        DEPOSIT_NAME : item.DEPOSIT_NAME,
                        BANK_CODE : item.BANK_CODE,
                        BANK_ACCOUNT_NO : item.BANK_ACCOUNT_NO,
                        PAYER_ID : item.PAYER_ID,
                        PAYER_NAME : item.PAYER_NAME,
                        PAYER_BANK_CODE : item.PAYER_BANK_CODE,
                        PAYER_BANK_ACCOUNT : item.PAYER_BANK_ACCOUNT,
                        PAYER_BANK_ACCOUNT_OWNER : item.PAYER_BANK_ACCOUNT_OWNER,
                        PAY_METHOD : item.PAY_METHOD,
                        PAY_TERM_CODE : item.PAY_TERM_CODE,
                        STATUS_CODE : item.STATUS_CODE,
                        VOUCHER_YN : item.VOUCHER_YN,
                        VOUCHER_NO : item.VOUCHER_NO,
                        VOUCHER_TYPE : item.VOUCHER_TYPE,
                        DESCRIPTION : item.DESCRIPTION,
                        FBS_TXN_DATE : item.FBS_TXN_DATE,
                        FBS_TXN_TIME : item.FBS_TXN_TIME,
                        SOURCE_DOC : item.SOURCE_DOC,
                        TRANSFER_TREASURY_ID : item.TRANSFER_TREASURY_ID,
                        DOC_H_DOC_ID : item.DOC_H_DOC_ID,
                        DOC_H_FI_ORG_CODE : item.DOC_H_FI_ORG_CODE,
                        DOC_H_SITE_CODE : item.DOC_H_SITE_CODE,
                        DOC_H_DOC_DATE : item.DOC_H_DOC_DATE,
                        DOC_H_DOC_NUM : item.DOC_H_DOC_NUM,
                        DOC_H_DOC_NAME : item.DOC_H_DOC_NAME,
                        DOC_H_DOC_AMT : item.DOC_H_DOC_AMT,
                        DOC_H_DOC_TYPE : item.DOC_H_DOC_TYPE,
                        DOC_H_DOC_STATUS : item.DOC_H_DOC_STATUS,
                        DOC_H_DEPT_CODE : item.DOC_H_DEPT_CODE,
                        HOLD_FLAG : item.HOLD_FLAG,
                        HOLD_REASON : item.HOLD_REASON,
                        DOC_H_DEPT_NAME : item.DOC_H_DEPT_NAME,
                        DOC_H_DESCRIPTION : item.DOC_H_DESCRIPTION,
                        TEMP_AREA : item.TEMP_AREA,
                        TEMP_AMT : item.TEMP_AMT,
                        BILL_DUE_DATE : item.BILL_DUE_DATE,
                        BILL_NO : item.BILL_NO,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE,
                    }

                    if(gfn_nvl(msg.STATUS_CODE) != "1") {
                        iCmpltCnt++;
                    }

                    jsonFinancialPlanList.push(msg);
                });

                data.cv_2.forEach((item, index) => {
                    const msg = {
                        CS_NAME : item.CS_NAME,
                        CS_CODE : item.CS_CODE,
                        SALES_CS_NAME : item.SALES_CS_NAME,
                        SALES_CS_CODE : item.SALES_CS_CODE,
                        APPLY_COMPLETE_FLAG : item.APPLY_COMPLETE_FLAG,
                        APPLY_COMPLETE_DATE : item.APPLY_COMPLETE_DATE,
                        SITE_CODE : item.SITE_CODE,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        VOUCHER_RECEIPT_DATE : item.VOUCHER_RECEIPT_DATE,
                        VOUCHER_NO1 : item.VOUCHER_NO1,
                        VOUCHER_NO : item.VOUCHER_NO,
                        VOUCHER_TYPE : item.VOUCHER_TYPE,
                        PAY_METHOD : item.PAY_METHOD,
                        EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                        PAY_TERM_CODE : item.PAY_TERM_CODE,
                        WITHHOLD_CS_CODE2 : item.WITHHOLD_CS_CODE2,
                        WITHHOLD_TAX_TYPE2 : item.WITHHOLD_TAX_TYPE2,
                        WITHHOLD_CS_CODE : item.WITHHOLD_CS_CODE,
                        WITHHOLD_TAX_TYPE : item.WITHHOLD_TAX_TYPE,
                        WITHHOLD_FLAG : item.WITHHOLD_FLAG,
                        EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                        EXCHANGE_RATE : item.EXCHANGE_RATE,
                        EXCHANGE_RATE_CR : item.EXCHANGE_RATE_CR,
                        EXCHANGE_RATE_DR : item.EXCHANGE_RATE_DR,
                        CURRENCY_CODE : item.CURRENCY_CODE,
                        CS_CODE : item.CS_CODE,
                        TRADER_ID_D : item.TRADER_ID_D,
                        DATA_STATUS : item.DATA_STATUS,
                        SOURCE_RECORD_COUNT : item.SOURCE_RECORD_COUNT,
                        ITEM_SOURCE_ID : item.ITEM_SOURCE_ID,
                        ITEM_DOC_NAME : item.ITEM_DOC_NAME,
                        ITEM_DOC_TYPE : item.ITEM_DOC_TYPE,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        INVOICE_ID : item.INVOICE_ID,
                        DESCRIPTION : item.DESCRIPTION,
                        DEPT_NAME : item.DEPT_NAME,
                        TXN_QTY : item.TXN_QTY,
                        UOM : item.UOM,
                        ITEM_CODE : item.ITEM_CODE,
                        ACC_VALUE_NAME10 : item.ACC_VALUE_NAME10,
                        ACC_VALUE_NAME9 : item.ACC_VALUE_NAME9,
                        ACC_VALUE_NAME8 : item.ACC_VALUE_NAME8,
                        ACC_VALUE_NAME7 : item.ACC_VALUE_NAME7,
                        ACC_VALUE_NAME6 : item.ACC_VALUE_NAME6,
                        ACC_VALUE_NAME5 : item.ACC_VALUE_NAME5,
                        ACC_VALUE_NAME4 : item.ACC_VALUE_NAME4,
                        ACC_VALUE_NAME3 : item.ACC_VALUE_NAME3,
                        ACC_VALUE_NAME2 : item.ACC_VALUE_NAME2,
                        ACC_VALUE_NAME1 : item.ACC_VALUE_NAME1,
                        ACC_ITEM_VALUE10 : item.ACC_ITEM_VALUE10,
                        ACC_ITEM_VALUE9 : item.ACC_ITEM_VALUE9,
                        ACC_ITEM_VALUE8 : item.ACC_ITEM_VALUE8,
                        ACC_ITEM_VALUE7 : item.ACC_ITEM_VALUE7,
                        ACC_ITEM_VALUE6 : item.ACC_ITEM_VALUE6,
                        ACC_ITEM_VALUE5 : item.ACC_ITEM_VALUE5,
                        ACC_ITEM_VALUE4 : item.ACC_ITEM_VALUE4,
                        ACC_ITEM_VALUE3 : item.ACC_ITEM_VALUE3,
                        ACC_ITEM_VALUE2 : item.ACC_ITEM_VALUE2,
                        ACC_ITEM_VALUE1 : item.ACC_ITEM_VALUE1,
                        ACC_CHARACTER : item.ACC_CHARACTER,
                        POPUP_ID10 : item.POPUP_ID10,
                        POPUP_ID9 : item.POPUP_ID9,
                        POPUP_ID8 : item.POPUP_ID8,
                        POPUP_ID7 : item.POPUP_ID7,
                        POPUP_ID6 : item.POPUP_ID6,
                        POPUP_ID5 : item.POPUP_ID5,
                        POPUP_ID4 : item.POPUP_ID4,
                        POPUP_ID3 : item.POPUP_ID3,
                        POPUP_ID2 : item.POPUP_ID2,
                        POPUP_ID1 : item.POPUP_ID1,
                        DATA_TYPE10 : item.DATA_TYPE10,
                        DATA_TYPE9 : item.DATA_TYPE9,
                        DATA_TYPE8 : item.DATA_TYPE8,
                        DATA_TYPE7 : item.DATA_TYPE7,
                        DATA_TYPE6 : item.DATA_TYPE6,
                        DATA_TYPE5 : item.DATA_TYPE5,
                        DATA_TYPE4 : item.DATA_TYPE4,
                        DATA_TYPE3 : item.DATA_TYPE3,
                        DATA_TYPE2 : item.DATA_TYPE2,
                        DATA_TYPE1 : item.DATA_TYPE1,
                        ACC_ITEM_YN10 : item.ACC_ITEM_YN10,
                        ACC_ITEM_YN9 : item.ACC_ITEM_YN9,
                        ACC_ITEM_YN8 : item.ACC_ITEM_YN8,
                        ACC_ITEM_YN7 : item.ACC_ITEM_YN7,
                        ACC_ITEM_YN6 : item.ACC_ITEM_YN6,
                        ACC_ITEM_YN5 : item.ACC_ITEM_YN5,
                        ACC_ITEM_YN4 : item.ACC_ITEM_YN4,
                        ACC_ITEM_YN3 : item.ACC_ITEM_YN3,
                        ACC_ITEM_YN2 : item.ACC_ITEM_YN2,
                        ACC_ITEM_YN1 : item.ACC_ITEM_YN1,
                        ACC_ITEM_NAME10 : item.ACC_ITEM_NAME10,
                        ACC_ITEM_NAME9 : item.ACC_ITEM_NAME9,
                        ACC_ITEM_NAME8 : item.ACC_ITEM_NAME8,
                        ACC_ITEM_NAME7 : item.ACC_ITEM_NAME7,
                        ACC_ITEM_NAME6 : item.ACC_ITEM_NAME6,
                        ACC_ITEM_NAME5 : item.ACC_ITEM_NAME5,
                        ACC_ITEM_NAME4 : item.ACC_ITEM_NAME4,
                        ACC_ITEM_NAME3 : item.ACC_ITEM_NAME3,
                        ACC_ITEM_NAME2 : item.ACC_ITEM_NAME2,
                        ACC_ITEM_NAME1 : item.ACC_ITEM_NAME1,
                        ACC_ITEM_CODE10 : item.ACC_ITEM_CODE10,
                        ACC_ITEM_CODE9 : item.ACC_ITEM_CODE9,
                        ACC_ITEM_CODE8 : item.ACC_ITEM_CODE8,
                        ACC_ITEM_CODE7 : item.ACC_ITEM_CODE7,
                        ACC_ITEM_CODE6 : item.ACC_ITEM_CODE6,
                        ACC_ITEM_CODE5 : item.ACC_ITEM_CODE5,
                        ACC_ITEM_CODE4 : item.ACC_ITEM_CODE4,
                        ACC_ITEM_CODE3 : item.ACC_ITEM_CODE3,
                        ACC_ITEM_CODE2 : item.ACC_ITEM_CODE2,
                        ACC_ITEM_CODE1 : item.ACC_ITEM_CODE1,
                        TMP_ACCOUNT_NAME : item.TMP_ACCOUNT_NAME,
                        TMP_ACCOUNT_CODE : item.TMP_ACCOUNT_CODE,
                        ACCOUNT_NAME : item.ACCOUNT_NAME,
                        ACCOUNT_CODE : item.ACCOUNT_CODE,
                        TXN_QTY : item.TXN_QTY,
                        FUNCTIONAL_AMT : item.FUNCTIONAL_AMT,
                        ORIGINAL_CR_AMT_BEFORE : item.ORIGINAL_CR_AMT_BEFORE,
                        ORIGINAL_AMT : item.ORIGINAL_AMT,
                        PROJECT_NAME : item.PROJECT_NAME,
                        PROJECT_CODE : item.PROJECT_CODE,
                        COST_CENTER_NAME : item.COST_CENTER_NAME,
                        COST_CENTER_CODE : item.COST_CENTER_CODE,
                        DEPT_CODE : item.DEPT_CODE,
                        VAT_NAME : item.VAT_NAME,
                        VAT_TYPE : item.VAT_TYPE,
                        DEBIT_CREDIT : item.DEBIT_CREDIT,
                        LINE_TYPE : item.LINE_TYPE,
                        ITEM_SEQ : item.ITEM_SEQ,
                        ITEM_ID : item.ITEM_ID,
                        KEY_ID : item.KEY_ID,
                    }
                    jsonDocList.push(msg);
                });

                data.cv_3.forEach((item, index) => {
                    const msg = {
                        KEY_ID : item.KEY_ID,
                        ITEM_ID : item.ITEM_ID,
                        LINE_NUM : item.LINE_NUM,
                        DOC_DATE : item.DOC_DATE,
                        DOC_ID : item.DOC_ID,
                        DOC_BATCH_NO : item.DOC_BATCH_NO,
                        DOC_NUM : item.DOC_NUM,
                        DOC_NAME : item.DOC_NAME,
                        CS_REG_NO : item.CS_REG_NO,
                        TRADER_NAME : item.TRADER_NAME,
                        ACCOUNT_CODE : item.ACCOUNT_CODE,
                        ACCOUNT_NAME : item.ACCOUNT_NAME,
                        TR_ACTIVITY_CODE : item.TR_ACTIVITY_CODE,
                        TR_ACTIVITY_NAME : item.TR_ACTIVITY_NAME,
                        EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                        VOUCHER_NO : item.VOUCHER_NO,
                        ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                        ORIGINAL_AMOUNT_BEFORE : item.ORIGINAL_AMOUNT_BEFORE,
                        FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT,
                        DESCRIPTION : item.DESCRIPTION,
                        ITEM_SEQ : item.ITEM_SEQ,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        LINE_TYPE : item.LINE_TYPE,
                        SOURCE_DOC : item.SOURCE_DOC,
                    }
                    jsonInvoiceList.push(msg);
                });

                gvwList.rebuild();
                gvwWFItem.rebuild();
                gvwAct.rebuild();

                if (iCmpltCnt > 0) {
                    SBUxMethod.attr("btnAddInvoiceItem", "disabled", "true");
                } else {
                    SBUxMethod.attr("btnAddInvoiceItem", "disabled", "false");
                }

                if(jsonFinancialPlanList.length > 0) {
                    gvwList.clickRow(1);
                } else {
                    fn_create();
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

    const fnSET_P_TRP1060_S = async function(strWorkType) {
        try {
            let bResult = false;
            let dtData = null;

            let dtSource = gvwList.getUpdateData(true, 'all');
            if (dtSource == null)
                return false;

            let dtSourceItem = gvwWFItem.getUpdateData(true, 'all');
            if (dtSourceItem == null)
                return false;

            let dtAct = gvwAct.getUpdateData(true, 'all');
            if (dtAct == null)
                return false;

            for(const row in dtSource) {
                let strRowStatus = "";

                strRowStatus = row["status"] == 'i' ? 'N' : (row["status"] == 'u' ? 'U' : 'D');
                let dr = row.data;

                if (strRowStatus == "N" || strRowStatus == "U") {
                    if (gfn_nvl(dr["PAY_METHOD"]) == "3" || gfn_nvl(dr["PAY_METHOD"]) == "4") {
                        //인터넷뱅킹,FBS일시
                        if (gfn_nvl(dr["PAYER_BANK_CODE"]) == "") {
                            gfn_comAlert("E0000", "거래처 은행은 필수 입니다.");
                            return false;
                        }

                        if (gfn_nvl(dr["PAYER_BANK_ACCOUNT"]) == "") {
                            gfn_comAlert("E0000", "거래처 계좌번호는 필수 입니다.");
                            return false;
                        }

                        if (gfn_nvl(dr["PAYER_BANK_ACCOUNT_OWNER"]) == "") {
                            gfn_comAlert("E0000", "거래처 예금주는 필수 입니다.");
                            return false;
                        }
                    }
                }

                let stritem_id = "";
                let stritem_seq = "";
                let strfi_org_code = "";
                let strline_type = "";
                let straccount_code = "";
                let strdebit_credit = "";
                let strorigin_dr_amt = "";
                let strorigin_cr_amt = "";
                let strfunctional_dr_amt = "";
                let strfunctional_cr_amt = "";
                let strvat_type = "";

                let stritem_code = "";
                let struom = "";
                let strtxn_qty = "";
                let strdept_code = "";
                let strcost_center_code = "";
                let strproject_code = "";
                let strdescription = "";

                let stracc_item_code1 = "";
                let stracc_item_value1 = "";
                let stracc_item_code2 = "";
                let stracc_item_value2 = "";
                let stracc_item_code3 = "";
                let stracc_item_value3 = "";
                let stracc_item_code4 = "";
                let stracc_item_value4 = "";
                let stracc_item_code5 = "";
                let stracc_item_value5 = "";
                let stracc_item_code6 = "";
                let stracc_item_value6 = "";
                let stracc_item_code7 = "";
                let stracc_item_value7 = "";
                let stracc_item_code8 = "";
                let stracc_item_value8 = "";
                let stracc_item_code9 = "";
                let stracc_item_value9 = "";
                let stracc_item_code10 = "";
                let stracc_item_value10 = "";

                let stracc_value_name1 = "";
                let stracc_value_name2 = "";
                let stracc_value_name3 = "";
                let stracc_value_name4 = "";
                let stracc_value_name5 = "";
                let stracc_value_name6 = "";
                let stracc_value_name7 = "";
                let stracc_value_name8 = "";
                let stracc_value_name9 = "";
                let stracc_value_name10 = "";
                let stritem_source_type = "";
                let stritem_source_id = "";
                let strsource_record_count = "";

                let strcurrency_code = "";
                let strexchange_rate = "";
                let strexchange_type = "";
                let strpayer_id = "";
                let strsite_code = "";

                let strsum_acc_item1 = "";
                let strsum_acc_value1 = "";
                let strsum_acc_item2 = "";
                let strsum_acc_value2 = "";

                // 관리항목 필수 체크

                let dSumdr_amt = 0;
                let dSumCr_amt = 0;


                if (gfn_nvl(dr["SOURCE_DOC"]) != "DEPO_IN") {
                    if (jsonDocList.length == 0) {
                        gfn_comAlert("E0000", "전표내역을 입력 해주십시오.");
                        return false;
                    }

                    for (const dtItem in dtSourceItem) {
                        if (row.status == 'd' || dtItem.status == 'd')
                            continue;

                        let thisdr = dtItem.data;

                        if (dr["KEY_ID"] == thisdr["KEY_ID"]) {
                            dSumdr_amt += gfn_nvl(thisdr["DEBIT_CREDIT"]) == "D" ? Number(thisdr["ORIGINAL_AMT"]) : 0;
                            dSumCr_amt += gfn_nvl(thisdr["DEBIT_CREDIT"]) == "C" ? Number(thisdr["ORIGINAL_AMT"]) : 0;

                            for (var j = 1; j <= 10; j++) {
                                if ((thisdr["ACC_ITEM_YN" + j] == "Y" && Number(thisdr["ORIGINAL_AMT"]) != 0)) {
                                    if (thisdr["ACC_ITEM_CODE" + j] != "") {
                                        if (thisdr["ACC_ITEM_VALUE" + j] == "") {
                                            gfn_comAlert("E0000", "필수 관리항목을 입력해주십시요.");
                                            return false;
                                        }
                                    }
                                }
                            }


                            stritem_id += thisdr["ITEM_ID"] + "|";
                            stritem_seq += thisdr["ITEM_SEQ"] + "|";
                            strfi_org_code += thisdr["FI_ORG_CODE"] + "|";
                            strsite_code += thisdr["SITE_CODE"] + "|";
                            strpayer_id += dr["PAYER_ID"] + "|";
                            strline_type += thisdr["LINE_TYPE"] + "|";
                            straccount_code += thisdr["ACCOUNT_CODE"] + "|";
                            strdebit_credit += thisdr["DEBIT_CREDIT"] + "|";


                            strorigin_dr_amt += (gfn_nvl(thisdr["debit_credit"]) == "D" ? thisdr["ORIGINAL_AMT"] : "") + "|";
                            strorigin_cr_amt += (gfn_nvl(thisdr["debit_credit"]) == "C" ? thisdr["ORIGINAL_AMT"] : "") + "|";
                            strfunctional_dr_amt += (gfn_nvl(thisdr["debit_credit"]) == "D" ? thisdr["FUNCTIONAL_AMT"] : "") + "|";
                            strfunctional_cr_amt += (gfn_nvl(thisdr["debit_credit"]) == "C" ? thisdr["FUNCTIONAL_AMT"] : "") + "|";
                            strvat_type += gfn_nvl(thisdr["VAT_TYPE"]) + "|";

                            stritem_code += gfn_nvl(thisdr["ITEM_CODE"]) + "|";
                            struom += gfn_nvl(thisdr["UOM"]) + "|";
                            strtxn_qty += gfn_nvl(thisdr["TXN_QTY"]) + "|";
                            strdept_code += gfn_nvl(thisdr["DEPT_CODE"]) + "|";
                            strcost_center_code += gfn_nvl(thisdr["COST_CENTER_CODE"]) + "|";
                            strproject_code += gfn_nvl(thisdr["PROJECT_CODE"]) + "|";
                            strdescription += gfn_nvl(thisdr["DESCRIPTION"]) + "|";

                            stracc_item_code1 += gfn_nvl(thisdr["ACC_ITEM_CODE1"]) + "|";
                            stracc_item_code2 += gfn_nvl(thisdr["ACC_ITEM_CODE2"]) + "|";
                            stracc_item_code3 += gfn_nvl(thisdr["ACC_ITEM_CODE3"]) + "|";
                            stracc_item_code4 += gfn_nvl(thisdr["ACC_ITEM_CODE4"]) + "|";
                            stracc_item_code5 += gfn_nvl(thisdr["ACC_ITEM_CODE5"]) + "|";
                            stracc_item_code6 += gfn_nvl(thisdr["ACC_ITEM_CODE6"]) + "|";
                            stracc_item_code7 += gfn_nvl(thisdr["ACC_ITEM_CODE7"]) + "|";
                            stracc_item_code8 += gfn_nvl(thisdr["ACC_ITEM_CODE8"]) + "|";
                            stracc_item_code9 += gfn_nvl(thisdr["ACC_ITEM_CODE9"]) + "|";
                            stracc_item_code10 += gfn_nvl(thisdr["ACC_ITEM_CODE10"]) + "|";

                            var strItem = StringToRemoveMask(thisdr);

                            stracc_item_value1 += strItem[0];
                            stracc_item_value2 += strItem[1];
                            stracc_item_value3 += strItem[2];
                            stracc_item_value4 += strItem[3];
                            stracc_item_value5 += strItem[4];
                            stracc_item_value6 += strItem[5];
                            stracc_item_value7 += strItem[6];
                            stracc_item_value8 += strItem[7];
                            stracc_item_value9 += strItem[8];
                            stracc_item_value10 += strItem[9];

                            stracc_value_name1 += gfn_nvl(thisdr["ACC_VALUE_NAME1"]) + "|";
                            stracc_value_name2 += gfn_nvl(thisdr["ACC_VALUE_NAME2"]) + "|";
                            stracc_value_name3 += gfn_nvl(thisdr["ACC_VALUE_NAME3"]) + "|";
                            stracc_value_name4 += gfn_nvl(thisdr["ACC_VALUE_NAME4"]) + "|";
                            stracc_value_name5 += gfn_nvl(thisdr["ACC_VALUE_NAME5"]) + "|";
                            stracc_value_name6 += gfn_nvl(thisdr["ACC_VALUE_NAME6"]) + "|";
                            stracc_value_name7 += gfn_nvl(thisdr["ACC_VALUE_NAME7"]) + "|";
                            stracc_value_name8 += gfn_nvl(thisdr["ACC_VALUE_NAME8"]) + "|";
                            stracc_value_name9 += gfn_nvl(thisdr["ACC_VALUE_NAME9"]) + "|";
                            stracc_value_name10 += gfn_nvl(thisdr["ACC_VALUE_NAME10"]) + "|";

                            stritem_source_type += gfn_nvl(thisdr["ITEM_DOC_TYPE"]) + "|";
                            stritem_source_id += gfn_nvl(thisdr["ITEM_SOURCE_ID"]) + "|";
                            strsource_record_count += gfn_nvl(thisdr["SOURCE_RECORD_COUNT"]) + "|";

                            strcurrency_code += gfn_nvl(thisdr["CURRENCY_CODE"]) + "|";   //add 20170725
                            strexchange_rate += gfn_nvl(thisdr["EXCHANGE_RATE"]) + "|";   //add 20170725
                            strexchange_type += gfn_nvl(thisdr["EXCHANGE_TYPE"]) + "|";   //add 20170725

                            strsum_acc_item1 += "" + "|";
                            strsum_acc_value1 += "" + "|";
                            strsum_acc_item2 += "" + "|";
                            strsum_acc_value2 += "" + "|";
                        }
                    }

                    if (dSumdr_amt != dSumCr_amt) {
                        gfn_comAlert("E0000", "차대금액이 맞지 않습니다. 금액을 확인해 주십시오");
                        return false;
                    }

                    if (strfi_org_code != "") {
                        stritem_id = stritem_id.substring(0, stritem_id.length - 1);
                        stritem_seq = stritem_seq.substring(0, stritem_seq.length - 1);
                        strfi_org_code = strfi_org_code.substring(0, strfi_org_code.length - 1);
                        strpayer_id = strpayer_id.substring(0, strpayer_id.length - 1);
                        strsite_code = strsite_code.substring(0, strsite_code.length - 1);
                        strline_type = strline_type.substring(0, strline_type.length - 1);
                        straccount_code = straccount_code.substring(0, straccount_code.length - 1);
                        strdebit_credit = strdebit_credit.substring(0, strdebit_credit.length - 1);
                        strorigin_dr_amt = strorigin_dr_amt.substring(0, strorigin_dr_amt.length - 1);
                        strorigin_cr_amt = strorigin_cr_amt.substring(0, strorigin_cr_amt.length - 1);
                        strfunctional_dr_amt = strfunctional_dr_amt.substring(0, strfunctional_dr_amt.length - 1);
                        strfunctional_cr_amt = strfunctional_cr_amt.substring(0, strfunctional_cr_amt.length - 1);
                        strvat_type = strvat_type.substring(0, strvat_type.length - 1);

                        stritem_code = stritem_code.substring(0, stritem_code.length - 1);
                        struom = struom.substring(0, struom.length - 1);
                        strtxn_qty = strtxn_qty.substring(0, strtxn_qty.length - 1);
                        strdept_code = strdept_code.substring(0, strdept_code.length - 1);
                        strcost_center_code = strcost_center_code.substring(0, strcost_center_code.length - 1);
                        strproject_code = strproject_code.substring(0, strproject_code.length - 1);
                        strdescription = strdescription.substring(0, strdescription.length - 1);

                        stracc_item_code1 = stracc_item_code1.substring(0, stracc_item_code1.length - 1);
                        stracc_item_value1 = stracc_item_value1.substring(0, stracc_item_value1.length - 1);
                        stracc_item_code2 = stracc_item_code2.substring(0, stracc_item_code2.length - 1);
                        stracc_item_value2 = stracc_item_value2.substring(0, stracc_item_value2.length - 1);
                        stracc_item_code3 = stracc_item_code3.substring(0, stracc_item_code3.length - 1);
                        stracc_item_value3 = stracc_item_value3.substring(0, stracc_item_value3.length - 1);
                        stracc_item_code4 = stracc_item_code4.substring(0, stracc_item_code4.length - 1);
                        stracc_item_value4 = stracc_item_value4.substring(0, stracc_item_value4.length - 1);
                        stracc_item_code5 = stracc_item_code5.substring(0, stracc_item_code5.length - 1);
                        stracc_item_value5 = stracc_item_value5.substring(0, stracc_item_value5.length - 1);
                        stracc_item_code6 = stracc_item_code6.substring(0, stracc_item_code6.length - 1);
                        stracc_item_value6 = stracc_item_value6.substring(0, stracc_item_value6.length - 1);
                        stracc_item_code7 = stracc_item_code7.substring(0, stracc_item_code7.length - 1);
                        stracc_item_value7 = stracc_item_value7.substring(0, stracc_item_value7.length - 1);
                        stracc_item_code8 = stracc_item_code8.substring(0, stracc_item_code8.length - 1);
                        stracc_item_value8 = stracc_item_value8.substring(0, stracc_item_value8.length - 1);

                        stracc_item_code9 = stracc_item_code9.substring(0, stracc_item_code9.length - 1);
                        stracc_item_value9 = stracc_item_value9.substring(0, stracc_item_value9.length - 1);
                        stracc_item_code10 = stracc_item_code10.substring(0, stracc_item_code10.length - 1);
                        stracc_item_value10 = stracc_item_value10.substring(0, stracc_item_value10.length - 1);

                        stracc_value_name1 = stracc_value_name1.substring(0, stracc_value_name1.length - 1);
                        stracc_value_name2 = stracc_value_name2.substring(0, stracc_value_name2.length - 1);
                        stracc_value_name3 = stracc_value_name3.substring(0, stracc_value_name3.length - 1);
                        stracc_value_name4 = stracc_value_name4.substring(0, stracc_value_name4.length - 1);
                        stracc_value_name5 = stracc_value_name5.substring(0, stracc_value_name5.length - 1);
                        stracc_value_name6 = stracc_value_name6.substring(0, stracc_value_name6.length - 1);
                        stracc_value_name7 = stracc_value_name7.substring(0, stracc_value_name7.length - 1);
                        stracc_value_name8 = stracc_value_name8.substring(0, stracc_value_name8.length - 1);
                        stracc_value_name9 = stracc_value_name9.substring(0, stracc_value_name9.length - 1);
                        stracc_value_name10 = stracc_value_name10.substring(0, stracc_value_name10.length - 1);
                        stritem_source_type = stritem_source_type.substring(0, stritem_source_type.length - 1);
                        stritem_source_id = stritem_source_id.substring(0, stritem_source_id.length - 1);
                        strsource_record_count = strsource_record_count.substring(0, strsource_record_count.length - 1);

                        strcurrency_code = strcurrency_code.substring(0, strcurrency_code.length - 1);
                        strexchange_rate = strexchange_rate.substring(0, strexchange_rate.length - 1);
                        strexchange_type = strexchange_type.substring(0, strexchange_type.length - 1);

                        strsum_acc_item1 = strsum_acc_item1.substring(0, strsum_acc_item1.length - 1);
                        strsum_acc_value1 = strsum_acc_value1.substring(0, strsum_acc_value1.length - 1);
                        strsum_acc_item2 = strsum_acc_item2.substring(0, strsum_acc_item2.length - 1);
                        strsum_acc_value2 = strsum_acc_value2.substring(0, strsum_acc_value2.length - 1);
                    }

                    if (strRowStatus != "D") {
                        if (straccount_code == "") {
                            gfn_comAlert("E0000", "전표내역을 입력해 주십시오.");
                            return false;
                        }
                    }
                }

                let stractitem_id = "";
                let stractline_num = "";
                let stractdoc_id = "";
                let stractaccount_code = "";
                let stracttr_activity_code = "";
                let stractoriginal_amount = "";
                let stractfunctional_amount = "";
                let stractline_type = "";

                if (strRowStatus != "D") {
                    if (jsonInvoiceList.length = 0) {
                        gfn_comAlert("E0000", "송장내역을 입력 해주십시오.");
                        return false;
                    }
                }

                for (const act in dtAct) {
                    if (row.status == 'd' || act.status == 'd')
                        continue;

                    let actdr = act.data;

                    if (dr["KEY_ID"] == actdr["KEY_ID"]) {
                        if (stractitem_id != "") {
                            if (stractitem_id != "") {
                                stractitem_id += "|";
                                stractline_num += "|";
                                stractdoc_id += "|";
                                stractaccount_code += "|";
                                stracttr_activity_code += "|";
                                stractoriginal_amount += "|";
                                stractfunctional_amount += "|";
                                stractline_type += "|";
                            }

                            stractitem_id += gfn_nvl(actdr["ITEM_ID"]);
                            stractline_num += gfn_nvl(actdr["LINE_NUM"]);
                            stractdoc_id += gfn_nvl(actdr["DOC_ID"]);
                            stractaccount_code += gfn_nvl(actdr["ACCOUNT_CODE"]);
                            stracttr_activity_code += gfn_nvl(actdr["TR_ACTIVITY_CODE"]);
                            stractoriginal_amount += gfn_nvl(actdr["ORIGINAL_AMOUNT"]);
                            stractfunctional_amount += gfn_nvl(actdr["FUNCTIONAL_AMOUNT"]);
                            stractline_type += gfn_nvl(actdr["LINE_TYPE"]);
                        }
                    }

                    if (strWorkType == "GEN")
                        break;

                    var paramObj = {
                        V_P_DEBUG_MODE_YN: '',
                        V_P_LANG_ID: '',
                        V_P_COMP_CODE: gv_ma_selectedApcCd,
                        V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                        V_P_ACCT_RULE_CODE: p_defaultAcctRule,
                        IV_P_TREASURY_BATCH_NO: gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")),
                        IV_P_TREASURY_ID: parseInt(dr["TREASURY_ID"]),
                        V_P_TREASURY_LINE_NUM: parseInt(dr["TREASURY_LINE_NUM"]),
                        V_P_DOC_TYPE: gfn_nvl(dr["DOC_TYPE"]),
                        V_P_TXN_GROUP_CODE: gfn_nvl(dr["TXN_GROUP_CODE"]),
                        V_P_PLANNED_PAY_DATE: gfn_nvl(dr["PLANNED_PAY_DATE"]),
                        V_P_PAY_DATE: gfn_nvl(dr["PAY_DATE"]),
                        V_P_BILL_NO: gfn_nvl(dr["BILL_NO"]),
                        V_P_BILL_DUE_DATE: gfn_nvl(dr["BILL_DUE_DATE"]),
                        V_P_BILL_DUE_PAY_DATE: gfn_nvl(dr["BILL_DUE_PAY_DATE"]),
                        V_P_ACTUAL_FLAG: "A",
                        V_P_DEPOSIT_CODE: gfn_nvl(dr["DEPOSIT_CODE"]),
                        V_P_PAYER_ID: gfn_nvl(dr["PAYER_ID"]),
                        V_P_PAYER_BANK_CODE: gfn_nvl(dr["PAYER_BANK_CODE"]),
                        V_P_PAYER_BANK_ACCOUNT: gfn_nvl(dr["PAYER_BANK_ACCOUNT"]),
                        V_P_PAYER_BANK_ACCOUNT_OWNER: gfn_nvl(dr["PAYER_BANK_ACCOUNT_OWNER"]),
                        V_P_PAY_METHOD: gfn_nvl(dr["PAY_METHOD"]),
                        V_P_PAY_TERM_CODE: gfn_nvl(dr["PAY_TERM_CODE"]),
                        V_P_STATUS_CODE: gfn_nvl(dr["STATUS_CODE"]),
                        V_P_DOC_STATUS: "",
                        V_P_VOUCHER_YN: gfn_nvl(dr["VOUCHER_YN"]),
                        V_P_DESCRIPTION: gfn_nvl(dr["DESCRIPTION"]),
                        V_P_DESC1: '',
                        V_P_DESC2: '',
                        V_P_DESC3: '',
                        V_P_DESC4: '',
                        V_P_DESC5: '',
                        V_P_DESC6: '',
                        V_P_DESC7: '',
                        V_P_DESC8: '',
                        V_P_DESC9: '',
                        V_P_DESC10: '',
                        V_P_SOURCE_DOC: gfn_nvl(dr["SOURCE_DOC"]),
                        V_P_FBS_TXN_DATE: '',
                        V_P_FBS_TXN_TIME: '',
                        V_P_FBS_TXN_SEQ: '0',
                        V_P_VOUCHER_NO: gfn_nvl(dr["VOUCHER_NO"]),
                        V_P_VOUCHER_TYPE: gfn_nvl(dr["VOUCHER_TYPE"]),
                        V_P_DOC_ID_H: parseInt(dr["DOC_H_DOC_ID"]),
                        IV_P_SOURCE_ID_H: parseInt(dr["TREASURY_ID"]),
                        V_P_FI_ORG_CODE_H: p_fiOrgCode,
                        V_P_DOC_DATE_H: gfn_nvl(dr["DOC_H_DOC_DATE"]),
                        V_P_WRITE_DATE_H: '',
                        V_P_APPROVE_DATE_H: '',
                        V_P_DOC_NUM_H: 0,
                        V_P_DOC_NAME_H: gfn_nvl(dr["DOC_H_DOC_NAME"]),
                        V_P_SITE_CODE_H: gfn_nvl(dr["DOC_H_SITE_CODE"]),
                        IV_P_DOC_TYPE_H: gfn_nvl(dr["DOC_H_DOC_TYPE"]),
                        V_P_DEPT_CODE_H: gfn_nvl(dr["DOC_H_DEPT_CODE"]),
                        V_P_ENTRY_PATH_H: "FI100",
                        V_P_DOC_AMT_H: 0,
                        V_P_DOC_STATUS_H: gfn_nvl(dr["DOC_H_DOC_STATUS"]),
                        V_P_SOURCE_TYPE_H: 'TR',
                        V_P_CURRENCY_CODE_H: '',
                        V_P_EXCHANGE_TYPE_H: '',
                        V_P_EXCHANGE_RATE_H: 0,
                        V_P_DESCRIPTION_H: gfn_nvl(dr["DOC_H_DESCRIPTION"]),
                        V_P_HOLD_FLAG_H: gfn_nvl(dr["HOLD_FLAG"]),
                        V_P_HOLD_REASON_H: gfn_nvl(dr["HOLD_REASON"]),
                        V_P_ITEM_ID_T: stractitem_id,
                        V_P_LINE_NUM_T: stractline_num,
                        V_P_DOC_ID_T: stractdoc_id,
                        V_P_ACCOUNT_CODE_T: stractaccount_code,
                        V_P_TR_ACTIVITY_CODE_T: stracttr_activity_code,
                        V_P_ORIGINAL_AMOUNT_T: stractoriginal_amount,
                        V_P_FUNCTIONAL_AMOUNT_T: stractfunctional_amount,
                        V_P_LINE_TYPE_T: stractline_type,
                        V_P_ITEM_ID_D: stritem_id,
                        V_P_ITEM_SEQ_D: stritem_seq,
                        V_P_FI_ORG_CODE_D: strfi_org_code,
                        V_P_LINE_TYPE_D: strline_type,
                        V_P_ACCOUNT_CODE_D: straccount_code,
                        V_P_DEBIT_CREDIT_D: strdebit_credit,
                        V_P_ORIGINAL_DR_AMT_D: strorigin_dr_amt,
                        V_P_ORIGINAL_CR_AMT_D: strorigin_cr_amt,
                        V_P_FUNCTIONAL_DR_AMT_D: strfunctional_dr_amt,
                        V_P_FUNCTIONAL_CR_AMT_D: strfunctional_cr_amt,
                        V_P_VAT_TYPE_D: strvat_type,
                        V_P_DEPT_CODE_D: strdept_code,
                        V_P_COST_CENTER_CODE_D: strcost_center_code,
                        V_P_PROJECT_CODE_D: strproject_code,
                        V_P_ITEM_CODE_D: stritem_code,
                        V_P_UOM_D: struom,
                        V_P_TXN_QTY_D: strtxn_qty,
                        V_P_DESCRIPTION_D: strdescription,
                        V_P_ACC_ITEM_CODE1_D: stracc_item_code1,
                        V_P_ACC_ITEM_VALUE1_D: stracc_item_value1,
                        V_P_ACC_ITEM_CODE2_D: stracc_item_code2,
                        V_P_ACC_ITEM_VALUE2_D: stracc_item_value2,
                        V_P_ACC_ITEM_CODE3_D: stracc_item_code3,
                        V_P_ACC_ITEM_VALUE3_D: stracc_item_value3,
                        V_P_ACC_ITEM_CODE4_D: stracc_item_code4,
                        V_P_ACC_ITEM_VALUE4_D: stracc_item_value4,
                        V_P_ACC_ITEM_CODE5_D: stracc_item_code5,
                        V_P_ACC_ITEM_VALUE5_D: stracc_item_value5,
                        V_P_ACC_ITEM_CODE6_D: stracc_item_code6,
                        V_P_ACC_ITEM_VALUE6_D: stracc_item_value6,
                        V_P_ACC_ITEM_CODE7_D: stracc_item_code7,
                        V_P_ACC_ITEM_VALUE7_D: stracc_item_value7,
                        V_P_ACC_ITEM_CODE8_D: stracc_item_code8,
                        V_P_ACC_ITEM_VALUE8_D: stracc_item_value8,
                        V_P_ACC_ITEM_CODE9_D: stracc_item_code9,
                        V_P_ACC_ITEM_VALUE9_D: stracc_item_value9,
                        V_P_ACC_ITEM_CODE10_D: stracc_item_code10,
                        V_P_ACC_ITEM_VALUE10_D: stracc_item_value10,
                        V_P_ACC_ITEM_VALUE_NAME1_D: stracc_value_name1,
                        V_P_ACC_ITEM_VALUE_NAME2_D: stracc_value_name2,
                        V_P_ACC_ITEM_VALUE_NAME3_D: stracc_value_name3,
                        V_P_ACC_ITEM_VALUE_NAME4_D: stracc_value_name4,
                        V_P_ACC_ITEM_VALUE_NAME5_D: stracc_value_name5,
                        V_P_ACC_ITEM_VALUE_NAME6_D: stracc_value_name6,
                        V_P_ACC_ITEM_VALUE_NAME7_D: stracc_value_name7,
                        V_P_ACC_ITEM_VALUE_NAME8_D: stracc_value_name8,
                        V_P_ACC_ITEM_VALUE_NAME9_D: stracc_value_name9,
                        V_P_ACC_ITEM_VALUE_NAME10_D: stracc_value_name10,
                        V_P_ITEM_SOURCE_TYPE_D: stritem_source_type,
                        V_P_ITEM_SOURCE_ID_D: stritem_source_id,
                        V_P_SOURCE_RECORD_COUNT_D: strsource_record_count,
                        V_P_CURRENCY_CODE_D: strcurrency_code,
                        V_P_EXCHANGE_RATE_D: strexchange_rate,
                        V_P_EXCHANGE_TYPE_D: strexchange_type,
                        V_P_CS_CODE_D: strpayer_id,
                        V_P_SITE_CODE_D: strsite_code,
                        V_P_DEPT_CODE: p_deptCode,
                        V_P_EMP_CODE: p_empCd,
                        V_P_FORM_ID: p_formId,
                        V_P_MENU_ID: p_menuId,
                        V_P_PROC_ID: '',
                        V_P_USERID: '',
                        V_P_PC: ''
                    };

                    const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertTrp1060List.do", {
                        getType: 'json',
                        workType: gfn_nvl(strWorkType) == "GEN" ? "GEN" : strRowStatus,
                        cv_count: '0',
                        params: gfnma_objectToString(paramObj)
                    });

                    const data = await postJsonPromise;
                    console.log('data:', data);

                    bResult = false;

                    try {
                        if (_.isEqual("S", data.resultStatus)) {
                            if (gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")) == "")
                                SBUxMethod.set("TREASURY_BATCH_NO", data.v_returnStr);

                            bResult = true;
                        } else {


                            bResult = false;
                        }

                        return bResult;
                    } catch (e) {
                        if (!(e instanceof Error)) {
                            e = new Error(e);
                        }
                        console.error("failed", e.message);
                        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                    }
                }
            }
        } catch (e) {
            console.error(e);
            return false;
        }
    }

    const fnSET_P_TRP1060_S1 = async function(strWorkType) {
        try {
            let strtreasury_id = "";
            let strpay_date = "";

            for (var i = 0; i < jsonFinancialPlanList.length; i++) {
                if (gvwList.getCellData((i+1), gvwList.getColRef("CHECK_YN")) == "Y") {
                    if (gvwList.getRowStatus((i+1)) == "1" || gvwList.getRowStatus((i+1)) == "3") {
                        gfn_comAlert("E0000", "신규 작성중인 데이터가 있습니다.");
                        return false;
                    }

                    if (strWorkType == "END") {
                        if (gvwList.getCellData((i+1), gvwList.getColRef("PAY_DATE")) == "") {
                            gfn_comAlert("E0000", "입출 일자는 필수 입력 항목입니다.");
                            return false;
                        }
                    }

                    if (strtreasury_id != "") {
                        strtreasury_id += "|";
                        strpay_date += "|";
                    }

                    strtreasury_id += gvwList.getCellData((i+1), gvwList.getColRef("TREASURY_ID"));
                    strpay_date += gvwList.getCellData((i+1), gvwList.getColRef("PAY_DATE"));
                }
            }

            if (strtreasury_id == "") {
                gfn_comAlert("E0000", "선택한 행이 없습니다.");
                return false;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_TREASURY_ID : strtreasury_id,
                V_P_PAY_DATE : strpay_date,
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertTrp1060Sub.do", {
                getType: 'json',
                workType: strWorkType,
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log('data:', data);

            bResult = false;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    bResult = true;
                } else {
                    bResult = false;
                }

                return bResult;
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        } catch (e) {
            console.error(e);
            return false;
        }
    }

    const fnSET_P_TRP1060_D = async function(strWorkType) {
        try {
            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_TREASURY_BATCH_NO : gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")),
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/deleteTrp1060.do", {
                getType: 'json',
                workType: strWorkType,
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log('data:', data);

            bResult = false;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    bResult = true;
                } else {
                    bResult = false;
                }

                return bResult;
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        } catch (e){
            console.error(e);
            return false;
        }
    }

    const StringToRemoveMask = async function(dr) {
        var removeMask =
            [
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
            ];

        for (var index = 1; index <= 10; ++index) {
            if (dr["DATA_TYPE" + index] != null && dr["ACC_ITEM_VALUE" + index] != null) {
                switch (dr["DATA_TYPE" + index]) {
                    case "TEXT":
                    case "POPUP":
                        removeMask[index - 1] = dr["ACC_ITEM_VALUE" + index] + "|";
                        continue;
                    case "NUM":
                        removeMask[index - 1] = dr["ACC_ITEM_VALUE" + index].replaceAll(",", "") + "|";
                        continue;
                    case "YYYY":
                    case "YYYYMM":
                    case "YYYYMMDD":
                        removeMask[index - 1] = dr["ACC_ITEM_VALUE" + index].replaceAll("-", "") + "|";
                        continue;
                    default:
                        removeMask[index - 1] = "|";
                        continue;
                }
            }
            else
                removeMask[index - 1] = "|";
        }
        return removeMask;
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
