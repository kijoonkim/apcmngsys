<%
    /**
     * @Class Name 		: fbs2310.jsp
     * @Description 	: 예금잔고조회(은행통지) 화면
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
    <title>title : 예금잔고조회(은행통지)</title>
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
                <sbux-button id="btnErrorNum" name="btnErrorNum" uitype="normal" text="결번확인요청" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_errorNum"></sbux-button>
                <sbux-button id="btnBalanceRequest" name="btnBalanceRequest" uitype="normal" text="잔액조회요청" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_balanceRequest"></sbux-button>
                <sbux-button id="btnBalanceReqEach" name="btnBalanceReqEach" uitype="normal" text="개별 잔액조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_balanceReqEach"></sbux-button>
                <sbux-button id="btnAll" name="btnAll" uitype="normal" text="전체" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_all"></sbux-button>
                <sbux-button id="btnYear1" name="btnYear1" uitype="normal" text="1년" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Year"></sbux-button>
                <sbux-button id="btnMonth6" name="btnMonth6" uitype="normal" text="6개월" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_6Month"></sbux-button>
                <sbux-button id="btnMonth3" name="btnMonth3" uitype="normal" text="3개월" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_3Month"></sbux-button>
                <sbux-button id="btnMonth1" name="btnMonth1" uitype="normal" text="1개월" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Month"></sbux-button>
                <sbux-button id="btnWeek1" name="btnWeek1" uitype="normal" text="1주" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Week"></sbux-button>
                <sbux-button id="btnDay1" name="btnDay1" uitype="normal" text="1일" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Day"></sbux-button>
                <sbux-button id="btnPrev" name="btnPrev" uitype="normal" text="전일" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_prev"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table  id="srchArea" class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row" class="th_bg_search">통화</th>
                    <td colspan="3" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_CURRENCY_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">FBS서비스</th>
                    <td colspan="3" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FBS_SERVICE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FBS_SERVICE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">입출일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_FROM_DATE"
                                name="SRCH_FROM_DATE"
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
                                id="SRCH_TO_DATE"
                                name="SRCH_TO_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                        />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">은행</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;" data-group="SRCH_BANK">
                        <sbux-input id="SRCH_BANK_CODE" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_BANK_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">계좌번호</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;" data-group="SRCH_BANK_ACCOUNT">
                        <sbux-input id="SRCH_BANK_ACCOUNT_NO" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_BANK_ACCOUNT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK_ACCOUNT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankAccount"
                        ></sbux-button>
                    </td>
                    <sbux-input id="SRCH_TRANS_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>잔고 현황</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwList" style="height:250px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li><span>세부 입출금 현황</span></li>
                    </ul>
                    <div style="margin-left: auto;">
                        <sbux-button id="btnExceptCancel" name="btnExceptCancel" uitype="normal" text="수금제외취소" class="btn btn-sm btn-outline-danger" onclick="fn_exceptCancel" style="float: right;"></sbux-button>
                        <sbux-button id="btnReceiptExcept" name="btnReceiptExcept" uitype="normal" text="수금제외" class="btn btn-sm btn-outline-danger" onclick="fn_receiptExcept" style="float: right;"></sbux-button>
                        <sbux-button id="btnReceiptTransfer" name="btnReceiptTransfer" uitype="normal" text="수금처리" class="btn btn-sm btn-outline-danger" onclick="fn_receiptTransfer" style="float: right;"></sbux-button>
                        <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                        <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                        <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                        <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 0px;">
                    <div id="sb-area-gvwDetail" style="height:350px;"></div>
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
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    //-----------------------------------------------------------

    var copyMode = "clear";
    var isFBSAsync = true;

    var jsonBankCode = []; // 은행코드
    var jsonReceiptType = []; // 수금유형
    var jsonReceiptExceptReason = []; // 제외사유
    var jsonTranType = []; // 거래구분

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;

    var jsonBalanceStatusList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonDepositAndWithdrawalStatusList = [];

    const fn_initSBSelect = async function() {
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
                    {caption: "코드",		ref: 'FI_ORG_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 통화
            gfnma_multiSelectInit({
                target: ['#SRCH_CURRENCY_CODE'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_COM001',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'CURRENCY_CODE',
                colLabel: 'CURRENCY_NAME',
                columns: [
                    {caption: "통화코드",	ref: 'CURRENCY_CODE', width: '70px', style: 'text-align:left' },
                    {caption: "통화명",	ref: 'CURRENCY_NAME', width: '100px',style: 'text-align:left' },
                    {caption: "비고",	ref: 'DESCIPTION',    width: '100px',style: 'text-align:left' },
                ]
            }),
            // FBS서비스
            gfnma_multiSelectInit({
                target: ['#SRCH_FBS_SERVICE'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_FBS019',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'SUB_CODE',
                colLabel: 'CODE_NAME',
                columns: [
                    {caption: "코드",	ref: 'SUB_CODE', width: '70px', style: 'text-align:left' },
                    {caption: "명",		ref: 'CODE_NAME', width: '100px',style: 'text-align:left' },
                ]
            }),
            // 은행코드
            gfnma_setComSelect(['gvwList'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 수금유형
            gfnma_setComSelect(['gvwDetail'], jsonReceiptType, 'L_FBS029', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 제외사유
            gfnma_setComSelect(['gvwDetail'], jsonReceiptExceptReason, 'L_FBS027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 거래구분
            gfnma_setComSelect(['gvwDetail'], jsonTranType, 'L_FIF021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    const fn_findBankCode = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행코드 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_BANK_CODE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명"]
            ,searchInputFields		: ["CODE", "NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭"]
            ,tableColumnNames		: ["CODE" , "NAME"]
            ,tableColumnWidths		: ["90px", "150px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_BANK_NAME', data.NAME);
                SBUxMethod.set('SRCH_BANK_CODE', data.CODE);
            },
        });
    }

    const fn_findBankAccount = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NAME"));
        var replaceText0 	= "_BANK_CODE_";
        var replaceText1 	= "_BANK_NAME_";
        var strWhereClause 	= "AND BANK_CODE LIKE '%" + replaceText0 + "%' AND BANK_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행계좌 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_BANK_ACCOUNT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["BANK_CODE", "BANK_NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["계좌번호", "명칭", "은행명", "통화"]
            ,tableColumnNames		: ["CODE" , "NAME", "BANK_NAME", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["110px", "210px", "130px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_BANK_ACCOUNT_NAME', data.NAME);
                SBUxMethod.set('SRCH_BANK_ACCOUNT_NO', data.CODE);
            },
        });
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonBalanceStatusList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
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
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["조회시간"],       ref: 'QUERY_TIME', 		type:'inputdate',  	width:'135px',  	style:'text-align:left',
                format : {type:'date', rule:'HH:mm:ss', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
                , disabled: true
            },
            {caption: ["조회 상태"],         ref: 'FBS_STATUS',    type:'output',  	width:'114px',  style:'text-align:left', hidden: true},
            {caption: ["은행"], 		ref: 'BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '105px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계좌번호"],         ref: 'ACCOUNT_NUM',    type:'output',  	width:'105px',  style:'text-align:left'},
            {caption: ["예적금코드"],         ref: 'DEPOSIT_CODE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["예금계좌명"],         ref: 'DEPOSIT_NAME',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["통화"],         ref: 'CURRENCY_CODE',    type:'output',  	width:'40px',  style:'text-align:left'},
            {caption: ["계정잔액"],         ref: 'BALANCE_AMT_NOW',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["인출가능잔액(펌뱅킹)"],         ref: 'USABLE_BALANCE_AMT_NOW',    type:'output',  	width:'155px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["차이금액[장부-가용]"],         ref: 'DIFF_BALANCE_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["기초"],         ref: 'BEGIN_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["입금"],         ref: 'IN_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["출금"],         ref: 'OUT_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예금잔액"],         ref: 'BALANCE_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["소스"],         ref: 'DATA_SOURCE',    type:'output',  	width:'40px',  style:'text-align:left'},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
    }

    const fn_view = async function () {
        fnQRY_P_FBS2310_Q("DETAIL");
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonDepositAndWithdrawalStatusList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if (copyMode == 'line') { //행복사모드
            SBGridProperties.selectmode = 'byrows'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if (copyMode == 'cell') { //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["SEQ"],         ref: 'SEQ',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["수금 전송여부"],			    ref: 'RECEIPT_TRANSFER_YN', 			        type:'checkbox',  	width:'77px',  	style:'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                disabled: true
            },
            {caption: ["수금유형"], 		ref: 'RECEIPT_TYPE',   	    type:'combo', style:'text-align:left' ,width: '125px',
                typeinfo: {
                    ref			: 'jsonReceiptType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["수금제외"],			    ref: 'RECEIPT_EXCEPT_YN', type:'checkbox',  	width:'75px',  	style:'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                disabled: true
            },
            {caption: ["제외사유"], 		ref: 'RECEIPT_EXCEPT_REASON',   	    type:'combo', style:'text-align:left' ,width: '154px',
                typeinfo: {
                    ref			: 'jsonReceiptExceptReason',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래일자"],       ref: 'TRAN_DATE', 		type:'inputdate',  	width:'84px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래시간"],       ref: 'TRAN_TIME', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                format : {type:'date', rule:'HH:mm:ss', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
                , disabled: true
            },
            {caption: ["입출구분"],         ref: 'IN_OUT_TYPE',    type:'output',  	width:'60px',  style:'text-align:left'},
            {caption: ["거래구분"], 		ref: 'TRAN_TYPE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonTranType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["통화"],         ref: 'CURRENCY_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["입출금자성명"],         ref: 'TRAN_NAME',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["거래금액"],         ref: 'TRAN_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["입금액"],         ref: 'IN_AMOUNT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["출금액"],         ref: 'OUT_AMOUNT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["잔액"],         ref: 'BALANCE_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["통지전문번호"],         ref: 'NOTICE_TRF_NO',    type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["입금지점"],         ref: 'IN_BRANCH_CODE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["어음만기입금구분"],         ref: 'NOTE_DUE_RECEIPT_FLAG',    type:'output',  	width:'125px',  style:'text-align:left'},
            {caption: ["수표번호"],         ref: 'CHECK_NUM',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["선택영역1"],         ref: 'extra1',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["선택영역2"],         ref: 'extra2',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["선택영역3"],         ref: 'extra3',    type:'output',  	width:'75px',  style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if (mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if (mode == "line") {
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

        _SBGrid.destroy('gvwDetail');
        fn_createGvwDetailGrid();
    }

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwDetail.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwDetail.addRow(true, {
                RECEIPT_TRANSFER_YN: "N",
                RECEIPT_EXCEPT_YN: "N"
            });
        }else{
            gvwDetail.insertRow(rowVal, 'below', {
                RECEIPT_TRANSFER_YN: "N",
                RECEIPT_EXCEPT_YN: "N"
            });
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwDetail.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwDetail.deleteRow(rowVal);
        }
    }

    const fn_onload = async function () {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));

        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
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

    const fnSET_P_FBS2310_S = async function (strWorkType) {
        let gvwListCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);
        let listData = [];

        if (gvwListCheckedList.length != 0) {
            gvwListCheckedList.forEach((item, index) => {
                if(gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("RECEIPT_TRANSFER_YN"))) == "N") {
                    const param = {
                        cv_count: '0',
                        getType: 'json',
                        rownum: item,
                        workType: strWorkType,
                        params: gfnma_objectToString({
                            V_P_DEBUG_MODE_YN: '',
                            V_P_LANG_ID: '',
                            V_P_COMP_CODE: gv_ma_selectedCorpCd,
                            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                            V_P_SEQ : parseInt(gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("SEQ")))),
                            V_P_EXCEPT_REASON : gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("RECEIPT_EXCEPT_REASON"))),
                            V_P_FORM_ID: p_formId,
                            V_P_MENU_ID: p_menuId,
                            V_P_PROC_ID: '',
                            V_P_USERID: '',
                            V_P_PC: ''
                        })
                    }
                    listData.push(param);
                }
            });

            if(listData.length > 0) {
                const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertFbs2310List.do", {listData: listData});

                const data = await postJsonPromise;

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

    const fnSET_P_FBS2310_S1 = async function (strWorkType) {
        let gvwListCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);
        let listData = [];

        if (gvwListCheckedList.length != 0) {
            gvwListCheckedList.forEach((item, index) => {
                if( gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("RECEIPT_EXCEPT_YN"))) == "N"
                    && gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("RECEIPT_TYPE"))) != "") {
                    const param = {
                        cv_count: '0',
                        getType: 'json',
                        rownum: item,
                        workType: strWorkType,
                        params: gfnma_objectToString({
                            V_P_DEBUG_MODE_YN: '',
                            V_P_LANG_ID: '',
                            V_P_COMP_CODE: gv_ma_selectedCorpCd,
                            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                            V_P_SEQ : parseInt(gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("SEQ")))),
                            V_P_RECEIPT_TYPE : gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("RECEIPT_TYPE"))),
                            V_P_EXCHANGE_RATE : 0,
                            V_P_FUNCTIONAL_AMT : 0,
                            V_P_FORM_ID: p_formId,
                            V_P_MENU_ID: p_menuId,
                            V_P_PROC_ID: '',
                            V_P_USERID: '',
                            V_P_PC: ''
                        })
                    }
                    listData.push(param);
                }
            });

            if(listData.length > 0) {
                const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertFbs2310Sub.do", {listData: listData});

                const data = await postJsonPromise;

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

    const fnSET_P_FIM5300_S2 = async function (strWorkType, strDepositCode,
                                               strBalance_amt_now, strUsable_balance_amt_now,
                                               strFbs_status, strQuery_time) {
        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_DEPOSIT_CODE : strDepositCode,
            V_P_BALANCE_AMT_NOW : Number(gfn_nvl(strBalance_amt_now)),
            V_P_USABLE_BALANCE_AMT_NOW : Number(gfn_nvl(strUsable_balance_amt_now)),
            V_P_FBS_STATUS : strFbs_status,
            V_P_QUERY_TIME : strQuery_time,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

       // TODO : P_FIM5300_S2 개발시 변경처리
        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertFim5300AccountInfo.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

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
    }

    const fnSET_P_FIM5300_S3 = async function () {
        // 비즈니스 로직 정보
        let strdeposit_code = "";
        let strBalance_amt_now = "";
        let strUsable_balance_amt_now = "";
        let strFbs_status = "";
        let strQuery_time = "";

        let updatedData = gvwList.getUpdateData(true, 'u');

        updatedData.forEach((item, index) => {
            strdeposit_code += gfn_nvl(item.data.DEPOSIT_CODE) + "|";
            strBalance_amt_now += gfn_nvl(item.data.BALANCE_AMT_NOW) + "|";
            strUsable_balance_amt_now += gfn_nvl(item.data.USABLE_BALANCE_AMT_NOW) + "|";
            strFbs_status += gfn_nvl(item.data.FBS_STATUS) + "|";
            strQuery_time += gfn_nvl(item.data.QUERY_TIME) + "|";
        });

        if (strdeposit_code != "") {
            strdeposit_code = strdeposit_code.substring(0, strdeposit_code.length - 1);
            strBalance_amt_now = strBalance_amt_now.substring(0, strBalance_amt_now.length - 1);
            strUsable_balance_amt_now = strUsable_balance_amt_now.substring(0, strUsable_balance_amt_now.length - 1);
            strFbs_status = strFbs_status.substring(0, strFbs_status.length - 1);
            strQuery_time = strQuery_time.substring(0, strQuery_time.length - 1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_DEPOSIT_CODE : strdeposit_code,
            V_P_BALANCE_AMT_NOW : strBalance_amt_now,
            V_P_USABLE_BALANCE_AMT_NOW : strUsable_balance_amt_now,
            V_P_FBS_STATUS : strFbs_status,
            V_P_QUERY_TIME : strQuery_time,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        // TODO : P_FIM5300_S2 개발시 변경처리
        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertFim5300BalanceInfo.do", {
            getType				: 'json',
            workType			: "U",
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

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
    }

    const fnQRY_P_FBS2310_Q = async function (strWorkType) {
        if (!validateRequired('panHeader')) {
            return false;
        }

        var nRow = gvwList.getRow();

        var strtxn_date = ""
        var strcurrency_code = ""
        var strbank_code = ""
        var strbank_account_no = "";

        if (strWorkType == "Q" || strWorkType == "MASTER") {
            strtxn_date = "";
            strcurrency_code = gfn_nvl(gfnma_multiSelectGet('#SRCH_CURRENCY_CODE'));
            strbank_code = gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE"));
            strbank_account_no = gfn_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NO"));
        } else {
            strbank_code = gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("BANK_CODE")));
            strbank_account_no = gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("ACCOUNT_NUM")));
        }

        // 비즈니스 로직 정보
        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        let TXN_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_FROM_DATE"));
        let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TO_DATE"));
        let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE'));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            IV_P_TXN_DATE_FR : TXN_DATE_FR,
            IV_P_TXN_DATE_TO : TXN_DATE_TO,
            V_P_TXN_DATE : strtxn_date,
            V_P_FBS_SERVICE : FBS_SERVICE,
            V_P_CURRENCY_CODE : strcurrency_code,
            V_P_BANK_CODE : strbank_code,
            V_P_BANK_ACCOUNT_NO : strbank_account_no,
            V_P_TRAN_TYPE : '',
            V_P_TRAN_GUBUN : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbs2310List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (strWorkType == "MASTER") {
                    jsonBalanceStatusList.legnth = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            CHECK_YN : item.CHECK_YN,
                            BANK_CODE : item.BANK_CODE,
                            DEPOSIT_CODE : item.DEPOSIT_CODE,
                            DEPOSIT_NAME : item.DEPOSIT_NAME,
                            ACCOUNT_NUM : item.ACCOUNT_NUM,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            BEGIN_AMT : item.BEGIN_AMT,
                            IN_AMT : item.IN_AMT,
                            OUT_AMT : item.OUT_AMT,
                            BALANCE_AMT : item.BALANCE_AMT,
                            DATA_SOURCE : item.DATA_SOURCE,
                            FI_ORG_CODE : item.FI_ORG_CODE,
                            BALANCE_AMT_NOW : item.BALANCE_AMT_NOW,
                            USABLE_BALANCE_AMT_NOW : item.USABLE_BALANCE_AMT_NOW,
                            FBS_STATUS : item.FBS_STATUS,
                            QUERY_TIME : item.QUERY_TIME,
                            DIFF_BALANCE_AMT : item.DIFF_BALANCE_AMT,
                        }
                        jsonBalanceStatusList.push(msg);
                    });
                    gvwList.rebuild()

                    document.querySelector('#listCount').innerText = jsonBalanceStatusList.length;

                    if (jsonBalanceStatusList.length > 0) {
                        gvwList.clickRow(1);
                    } else {
                        jsonDepositAndWithdrawalStatusList.length = 0;
                    }
                } else if (strWorkType == "DETAIL") {
                    jsonDepositAndWithdrawalStatusList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            CHECK_YN : item.CHECK_YN,
                            SEQ : item.SEQ,
                            TRAN_DATE : item.TRAN_DATE,
                            TRAN_TIME : item.TRAN_TIME,
                            IN_OUT_TYPE : item.IN_OUT_TYPE,
                            BANK_CODE : item.BANK_CODE,
                            DEPOSIT_CODE : item.DEPOSIT_CODE,
                            DEPOSIT_NAME : item.DEPOSIT_NAME,
                            ACCOUNT_NUM : item.ACCOUNT_NUM,
                            TRAN_TYPE : item.TRAN_TYPE,
                            TRAN_GUBUN : item.TRAN_GUBUN,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            TRAN_AMT : item.TRAN_AMT,
                            IN_AMOUNT : item.IN_AMOUNT,
                            OUT_AMOUNT : item.OUT_AMOUNT,
                            BALANCE_AMT : item.BALANCE_AMT,
                            NOTICE_TRF_NO : item.NOTICE_TRF_NO,
                            IN_BRANCH_CODE : item.IN_BRANCH_CODE,
                            TRAN_NAME : item.TRAN_NAME,
                            NOTE_DUE_RECEIPT_FLAG : item.NOTE_DUE_RECEIPT_FLAG,
                            RECEIPT_TRANSFER_YN : item.RECEIPT_TRANSFER_YN,
                            RECEIPT_EXCEPT_YN : item.RECEIPT_EXCEPT_YN,
                            RECEIPT_EXCEPT_REASON : item.RECEIPT_EXCEPT_REASON,
                            RECEIPT_TYPE : item.RECEIPT_TYPE,
                            CHECK_NUM : item.CHECK_NUM,
                            EXTRA1 : item.EXTRA1,
                            EXTRA2 : item.EXTRA2,
                            EXTRA3 : item.EXTRA3,
                            EXCHANGE_RATE : item.EXCHANGE_RATE,
                            FUNCTIONAL_AMT : item.FUNCTIONAL_AMT,
                        }
                        jsonDepositAndWithdrawalStatusList.push(msg);
                    });
                    gvwDetail.rebuild();
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

    const fn_fbsReqMissNum = async function (strFbs_Service, strFbs_Work_Type, strTxn_Date, strBank_Code) {
        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FBS_SERVICE : strFbs_Service,
            V_P_FBS_WORK_TYPE : strFbs_Work_Type,
            V_P_TRANS_DATE : strTxn_Date,
            V_P_BANK_CODE : strBank_Code,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbsReqMissNumList.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_1.length > 0) {
                    let str = "";
                    let num1 = 0;
                    let num2 = 0;

                    for(var i = 0; i < data.cv_1.length; i++) {
                        var strArray = await gfnma_firmBankingSend(strFbs_Service, gfn_nvl(data.cv_1[i]["SEND_DATA"]), false);
                        if (gfn_nvl(strArray[0]).trim() == "000" || gfn_nvl(strArray[0]).trim() == "0000" || gfn_nvl(strArray[0]).trim() == "COMP") {
                            ++num2;
                        } else {
                            ++num1;
                            str = gfn_nvl(strArray[0]);
                        }
                    }

                    if (num1 > 0) {
                        gfn_comAlert("E0000", "결번요청 에러 ["+ str +"]");
                        return false;
                    }

                    if (num2 > 0 && num1 == 0)
                        return true;
                    if (num2 + num1 == 0) {
                        gfn_comAlert("E0000", "결번요청할 내역이 존재하지 않습니다.");
                        return false;
                    }
                }
            } else {
                alert(data.resultMessage);
                return false;
            }
            gfn_comAlert("I0002", "결번요청", "완료");
            return true;
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            return false;
        }
    }

    const fn_fbsBalanceGet = async function (strBank_Code, strFbs_Service, strFbs_Work_Type, straccount_no, bIsAsync) {
        var strArray1 = ["", "", "", ""];

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_BANK_CODE : strBank_Code,
            V_P_FBS_SERVICE : strFbs_Service,
            V_P_FBS_WORK_TYPE : strFbs_Work_Type,
            V_P_ACCOUNT_NO : straccount_no.replaceAll("-", ""),
            V_P_INTERFACEID : "",
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbsBalanceList.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_1.length > 0) {
                    if (bIsAsync) {
                        await gfnma_firmBankingSend(strFbs_Service, gfn_nvl(data.cv_1[0]["SEND_DATA"]), false);
                        strArray1[0] = "잔액조회 요청완료";
                    } else {
                        var strArray2 = await gfnma_firmBankingSend(strFbs_Service, gfn_nvl(data.cv_1[0]["SEND_DATA"]));
                        if (gfn_nvl(strArray2[0]).trim() == "000" || gfn_nvl(strArray2[0]).trim() == "0000") {
                            strArray1[0] = "잔액조회 정상 [" + gfn_nvl(strArray2[0]).trim() + "]";
                            strArray1[1] = gfnma_firmSubString(gfn_nvl(strArray2[1]), 135, 1) == "-" ? "-" : BigInt(gfnma_firmSubString(gfn_nvl(strArray2[1]), 136, 13)).toLocaleString().split(".")[0];
                            strArray1[2] = gfnma_firmSubString(gfn_nvl(strArray2[1]), 135, 1) == "-" ? "-" : BigInt(gfnma_firmSubString(gfn_nvl(strArray2[1]), 188, 13)).toLocaleString().split(".")[0];
                            strArray1[3] = gfn_getDateTime();
                        }
                        else
                            strArray1[0] = "잔액조회 에러 [" + gfn_nvl(strArray2[0]) +"]";
                    }
                }
            } else {
                alert(data.resultMessage);
                strArray1[0] = "[" + data.v_errorCode + "] " + data.resultMessage;
                return strArray1;
            }

            return strArray1;
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            strArray1[0] = e.message;
            return strArray1;
        }
    }

    const fn_FbsBalanceSave = async function (strDepositCode, strBalance_amt_now, strUsable_balance_amt_now, strFbs_status, strQuery_time) {
        if (gfn_nvl(strDepositCode) != "") {
            fnSET_P_FIM5300_S2("U", strDepositCode, strBalance_amt_now, strUsable_balance_amt_now, strFbs_status, strQuery_time);
        }
    }

    const fn_save = async function () {
        fnSET_P_FBS2310_S("");
    }

    const fn_search = async function () {
        fnQRY_P_FBS2310_Q("MASTER");
    }

    const fn_errorNum = async function () {
        if (gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')) == "ECBANK") {
            /* 결번요청 */
            fn_fbsReqMissNum(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), "BANKNOTICEBLANKKRW", gfn_nvl(SBUxMethod.get("SRCH_TO_DATE")), "");
        } else {
            fn_fbsReqMissNum(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), "BANKNOTICEBLANKFOR", gfn_nvl(SBUxMethod.get("SRCH_TO_DATE")), "");
        }
    }

    const fn_balanceRequest = async function () {
        if (gvwList.getRow() < 0) {
            gfn_comAlert("E0000", "조회할 데이터가 없습니다.");
            return;
        }

        /* 테스트용 주석처리 추후 펌뱅킹 완료되면 풀것 20170623 ebpark */
        if (!gfnma_fbsOpen(gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")), gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')),"", "OPEN")) {
            gfn_comAlert("E0000", "업무개시후 진행바랍니다.");
            return;
        }

        if (isFBSAsync) {
            for (var i = 0; i < jsonBalanceStatusList.length; i++) {
                let strSource = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("DATA_SOURCE")));

                if (strSource == "FBS") {
                    let strResult = ["", ""];
                    let strBank_code = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("BANK_CODE")));
                    let strAccount_num = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("ACCOUNT_NUM")));

                    strResult = fn_fbsBalanceGet(strBank_code, gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), "BANKBALANCE", strAccount_num, isFBSAsync);

                    gvwList.setCellData((i+1), gvwList.getColRef("FBS_STATUS"), gfn_nvl(strResult[0]));
                }
            }
        } else {
            for (var i = 0; i < jsonBalanceStatusList.length; i++) {
                let strSource = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("DATA_SOURCE")));

                if (strSource == "FBS") {
                    let strResult = ["", ""];
                    let strBank_code = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("BANK_CODE")));
                    let strAccount_num = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("ACCOUNT_NUM")));

                    strResult = fn_fbsBalanceGet(strBank_code, gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), "BANKBALANCE", strAccount_num);

                    gvwList.setCellData((i+1), gvwList.getColRef("QUERY_TIME"), gfn_nvl(strResult[3]));
                    gvwList.setCellData((i+1), gvwList.getColRef("BALANCE_AMT_NOW"), gfn_nvl(strResult[1]));
                    gvwList.setCellData((i+1), gvwList.getColRef("USABLE_BALANCE_AMT_NOW"), gfn_nvl(strResult[2]));
                    gvwList.setCellData((i+1), gvwList.getColRef("FBS_STATUS"), gfn_nvl(strResult[0]));
                }
            }

            if (fnSET_P_FIM5300_S3("U")) {
                fn_search();
            }
        }
    }

    const fn_balanceReqEach = async function () {
        if (gvwList.getRow() < 0)
            return;

        let bresult = false;
        let intmax_seq = 0;

        let gvwListCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);

        intmax_seq = gvwListCheckedList.length;

        if (intmax_seq == 0) {
            gfn_comAlert("E0000", "조회된 리스트에서 체크박스를 선택 후 처리가 가능합니다.");
            return;
        }

        let intprogram_seq = 1;

        SBUxMethod.openProgress(gv_loadingOptions);

        gvwListCheckedList.forEach((item, index) => {
            bresult = false;

            let strSource = gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("DATA_SOURCE")));

            if (strSource == "FBS") {
                let strResult = ["", ""];
                let strBank_code = gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("BANK_CODE")));
                let strAccount_num = gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_NUM")));
                let strDepositCode = gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE")));

                if (isFBSAsync) {
                    strResult = fn_fbsBalanceGet(strBank_code, gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), "BANKBALANCE", strAccount_num, isFBSAsync);

                    gvwList.setCellData(item, gvwList.getColRef("FBS_STATUS"), gfn_nvl(strResult[0]));
                } else {
                    strResult = fn_fbsBalanceGet(strBank_code, gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), "BANKBALANCE", strAccount_num);

                    let strBalance_amt_now = gfn_nvl(strResult[1]);
                    let strUsable_balance_amt_now = gfn_nvl(strResult[2]);
                    let strFbs_status = gfn_nvl(strResult[0]);
                    let strQuery_time = gfn_nvl(strResult[3]);

                    gvwList.setCellData(item, gvwList.getColRef("QUERY_TIME"), gfn_nvl(strResult[3]));
                    gvwList.setCellData(item, gvwList.getColRef("BALANCE_AMT_NOW"), gfn_nvl(strResult[1]));
                    gvwList.setCellData(item, gvwList.getColRef("USABLE_BALANCE_AMT_NOW"), gfn_nvl(strResult[2]));
                    gvwList.setCellData(item, gvwList.getColRef("FBS_STATUS"), gfn_nvl(strResult[0]));

                    fn_FbsBalanceSave(strDepositCode, strBalance_amt_now, strUsable_balance_amt_now, strFbs_status, strQuery_time);
                }

            }
        });

        if (bresult) {
            fn_search();
        }

        SBUxMethod.closeProgress(gv_loadingOptions);
    }

    const fn_all = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", '20140101');
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_1Year = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), 0, 1)));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_6Month = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth()-5, 1)));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_3Month = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth()-2, 1)));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_1Month = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), 1)));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_1Week = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate() - new Date().getDay())));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_1Day = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date()));
        fn_search();
    }

    const fn_prev = async function () {
        SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()-1)));
        SBUxMethod.set("SRCH_TO_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()-1)));
        fn_search();
    }

    const fn_exceptCancel = async function () {
        if(fnSET_P_FBS2310_S("CANCEL"))
            fn_search();
    }

    const fn_receiptExcept = async function () {
        if (fnSET_P_FBS2310_S("EXCEPT"))
            fn_search();
    }

    const fn_receiptTransfer = async function () {
        var nRow = gvwDetail.getRow();
        if (nRow < 0)
            return;

        if (fnSET_P_FBS2310_S1("RECEIPT")) {
            fn_view();
        }
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>