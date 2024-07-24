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
                            <span style="margin-right: 10px;">▶ 자금계획 확정</span>
                            <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="fn_confirm" style="float: right;"></sbux-button>
                            <sbux-button id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="fn_unconfirm" style="float: right;"></sbux-button>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: left; margin-right: 5%">
                            <span style="margin-right: 10px;">▶ 자금실적처리</span>
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
                        <sbux-button id="btnDeleteRowForGvwWFItem" name="btnDeleteRowForGvwWFItem" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwWFItem" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRowForGvwWFItem" name="btnAddRowForGvwWFItem" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwWFItem" style="float: right;"></sbux-button>
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
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    //-----------------------------------------------------------

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
        SBGridProperties.frozencols = 9;
        SBGridProperties.columns = [
            {caption: ["KEY_ID"],         ref: 'KEY_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["품의번호"],         ref: 'TREASURY_ID',    type:'output',  	width:'117px',  style:'text-align:left'},
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
            {caption: ["예적금코드"],         ref: 'DEPOSIT_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["예적금명"],         ref: 'DEPOSIT_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["입출일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'110px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
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
            {caption: ["거래처"],         ref: 'PAYER_ID',    type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["거래처명"],         ref: 'PAYER_NAME',    type:'output',  	width:'160px',  style:'text-align:left'},
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
            {caption: ["지급조건"], 		ref: 'PAY_TERM_CODE',   	    type:'combo', style:'text-align:left' ,width: '192px',
                typeinfo: {
                    ref			: 'jsonPayTermCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지불방식"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["상태"], 		ref: 'STATUS_CODE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["VOUCHER_YN"],         ref: 'VOUCHER_YN',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["계획 비고"],         ref: 'DESCRIPTION',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["FBS_TXN_DATE"],         ref: 'FBS_TXN_DATE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["FBS_TXN_TIME"],         ref: 'FBS_TXN_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["DOC_ID"],         ref: 'DOC_H_DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["회계단위"], 		ref: 'DOC_H_FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사업장"], 		ref: 'DOC_H_SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표일자"],       ref: 'DOC_H_DOC_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["전표순번"],         ref: 'DOC_H_DOC_NUM',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["전표번호"],         ref: 'DOC_H_DOC_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["DOC_H_DOC_AMT"],         ref: 'DOC_H_DOC_AMT',    type:'output',  	width:'75px',  style:'text-align:left'},
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
            {caption: ["결의부서"],         ref: 'DOC_H_DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["결의부서"],         ref: 'DOC_H_DEPT_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["전표비고"],         ref: 'DOC_H_DESCRIPTION',    type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["통화"], 		ref: 'DOC_H_CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonCurrenvyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율유형"], 		ref: 'DOC_H_EXCHANGE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonExchangeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'DOC_H_EXCHANGE_RATE',    type:'output',  	width:'70px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["TEMP_AREA"],         ref: 'TEMP_AREA',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["VOUCHER_NO"],         ref: 'VOUCHER_NO',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["VOUCHER_TYPE"],         ref: 'VOUCHER_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["TEMP_AMT"],         ref: 'TEMP_AMT',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["구분"],         ref: 'DOC_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["SOURCE_DOC"],         ref: 'SOURCE_DOC',    type:'output',  	width:'75px',  style:'text-align:left'},
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
        SBGridProperties.frozencols = 10;
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
            },
            {caption: ["ORIGINAL_AMT_BEFORE"],         ref: 'ORIGINAL_AMT_BEFORE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["원래금액"],         ref: 'ORIGINAL_AMT',    type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["환산금액"],         ref: 'FUNCTIONAL_AMT',    type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["품목"],         ref: 'ITEM_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["단위"], 		ref: 'UOM',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonUom',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["수량"],         ref: 'TXN_QTY',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["귀속부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["원가중심점"],         ref: 'COST_CENTER_CODE',    type:'output',  	width:'71px',  style:'text-align:left'},
            {caption: ["원가중심점명"],         ref: 'COST_CENTER_NAME',    type:'output',  	width:'174px',  style:'text-align:left'},
            {caption: ["부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
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
            {caption: ["적요"], ref: 'DESCRIPTION', type: 'output', width: '300px', style: 'text-align:left'},
            {caption: ["차/대변 구분"], ref: 'BALANCE_SIDE', type: 'output', width: '75px', style: 'text-align:left'},
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
            {caption: ["통화코드"], ref: 'CURRENCY_CODE', type: 'combo', style: 'text-align:left', width: '75px',
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
            {caption: ["환율"], ref: 'EXCHANGE_RATE', type: 'output', width: '70px', style: 'text-align:left', hidden: true},
            {caption: ["원천징수여부"], ref: 'WITHHOLD_FLAG', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["증빙유형"], ref: 'WITHHOLD_TAX_TYPE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["원천징수거래처코드"], ref: 'WITHHOLD_CS_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["원천징수세금코드2"], ref: 'WITHHOLD_TAX_TYPE2', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["원천징수거래처코드2"], ref: 'WITHHOLD_CS_CODE2', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["지급기일코드"], ref: 'PAY_TERM_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["지급예정일"],       ref: 'EXPECTED_PAY_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden : true
            },
            {caption: ["지급방법"], ref: 'PAY_METHOD', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["증빙유형"], ref: 'VOUCHER_TYPE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["증빙번호"], ref: 'VOUCHER_NO', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["증빙번호1"], ref: 'VOUCHER_NO1', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["증빙일자"],       ref: 'VOUCHER_RECEIPT_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden : true
            },
            {caption: ["사업단위코드"], ref: 'FI_ORG_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["사업장코드"], ref: 'SITE_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["반제완료여부"], ref: 'APPLY_COMPLETE_FLAG', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["반제완료일"],       ref: 'APPLY_COMPLETE_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden : true
            },
            {caption: ["고객사코드"], ref: 'SALES_CS_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["고객사"], ref: 'SALES_CS_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["거래처코드"], ref: 'CS_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["거래처"], ref: 'CS_NAME', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
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
        SBGridProperties.frozencols = 10;
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
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["거래처명"],         ref: 'TRADER_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["거래처사업자번호"],         ref: 'CS_REG_NO',    type:'output',  	width:'110px',  style:'text-align:left',
                typeinfo : {mask : {alias : '###-##-#####'}, maxlength : 10}
                , format : {type:'number', rule:'###-##-#####', emptyvalue:'0'}
            },
            {caption: ["계정과목"],         ref: 'ACCOUNT_CODE',    type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["라인타입"], 		ref: 'LINE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계정과목"],         ref: 'ACCOUNT_NAME',    type:'output',  	width:'170px',  style:'text-align:left'},
            {caption: ["자금수지"],         ref: 'TR_ACTIVITY_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["자금수지"],         ref: 'TR_ACTIVITY_NAME',    type:'output',  	width:'146px',  style:'text-align:left'},
            {caption: ["지급예정일"],       ref: 'EXPECTED_PAY_DATE', 		type:'datepicker',  	width:'92px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["증빙번호"],         ref: 'VOUCHER_NO',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["ORIGINAL_AMOUNT_BEFORE"],         ref: 'ORIGINAL_AMOUNT_BEFORE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["원화환산금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["ITEM_ID"],         ref: 'ITEM_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["적요"],         ref: 'DESCRIPTION',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["ITEM_SEQ"],         ref: 'ITEM_SEQ',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["SOURCE_DOC"],         ref: 'SOURCE_DOC',    type:'output',  	width:'75px',  style:'text-align:left'},
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

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwWFItemGrid();
        fn_createGvwActGrid();
        //fn_search();
    });
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
