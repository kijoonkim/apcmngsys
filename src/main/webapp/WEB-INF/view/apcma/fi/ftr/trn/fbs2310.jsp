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
                <sbux-button id="btnPrev" name="btnPrev" uitype="normal" text="전일" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_prev"></sbux-button>
                <sbux-button id="btnDay1" name="btnDay1" uitype="normal" text="1일" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Day"></sbux-button>
                <sbux-button id="btnWeek1" name="btnWeek1" uitype="normal" text="1주" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Week"></sbux-button>
                <sbux-button id="btnMonth1" name="btnMonth1" uitype="normal" text="1개월" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Month"></sbux-button>
                <sbux-button id="btnMonth3" name="btnMonth3" uitype="normal" text="3개월" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_3Month"></sbux-button>
                <sbux-button id="btnMonth6" name="btnMonth6" uitype="normal" text="6개월" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_6Month"></sbux-button>
                <sbux-button id="btnYear1" name="btnYear1" uitype="normal" text="1년" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_1Year"></sbux-button>
                <sbux-button id="btnAll" name="btnAll" uitype="normal" text="전체" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_all"></sbux-button>
                <sbux-button id="btnBalanceReqEach" name="btnBalanceReqEach" uitype="normal" text="개별 잔액조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_balanceReqEach"></sbux-button>
                <sbux-button id="btnBalanceRequest" name="btnBalanceRequest" uitype="normal" text="잔액조회요청" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_balanceRequest"></sbux-button>
                <sbux-button id="btnErrorNum" name="btnErrorNum" uitype="normal" text="결번확인요청" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_errorNum"></sbux-button>

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
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 1%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 3%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">회계단위</th>
                    <td colspan="3" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">통화</th>
                    <td colspan="2" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_CURRENCY_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">FBS서비스</th>
                    <td colspan="2" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FBS_SERVICE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FBS_SERVICE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">입출일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_FROM_DATE"
                                name="SRCH_FROM_DATE"
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
                                id="SRCH_TO_DATE"
                                name="SRCH_TO_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">은행</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_BANK_CODE" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_BANK_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">계좌번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_BANK_ACCOUNT_NO" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_BANK_ACCOUNT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankAccount"
                        ></sbux-button>
                    </td>
                    <sbux-input id="SRCH_TRANS_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>잔고 현황</span>
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
            // 통화
            gfnma_multiSelectInit({
                target: ['#SRCH_CURRENCY_CODE'],
                compCode: gv_ma_selectedApcCd,
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
                compCode: gv_ma_selectedApcCd,
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
            gfnma_setComSelect(['gvwList'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 수금유형
            gfnma_setComSelect(['gvwDetail'], jsonReceiptType, 'L_FBS029', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 제외사유
            gfnma_setComSelect(['gvwDetail'], jsonReceiptExceptReason, 'L_FBS027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 거래구분
            gfnma_setComSelect(['gvwDetail'], jsonTranType, 'L_FIF021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    const fn_findBankCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_BANK_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행코드 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_BANK_NAME', data.NAME);
                SBUxMethod.set('SRCH_BANK_CODE', data.CODE);
            },
        });
    }

    const fn_findBankAccount = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NAME"));
        var replaceText0 	= "_BANK_CODE_";
        var replaceText1 	= "_BANK_NAME_";
        var strWhereClause 	= "AND BANK_CODE LIKE '%" + replaceText0 + "%' AND BANK_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행계좌 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
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
            {caption: ["조회시간"],       ref: 'QUERY_TIME', 		type:'datepicker',  	width:'135px',  	style:'text-align:left',
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
            {caption: ["계정잔액"],         ref: 'BALANCE_AMT_NOW',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["인출가능잔액(펌뱅킹)"],         ref: 'USABLE_BALANCE_AMT_NOW',    type:'output',  	width:'155px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["차이금액[장부-가용]"],         ref: 'DIFF_BALANCE_AMT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["기초"],         ref: 'BEGIN_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["입금"],         ref: 'IN_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["출금"],         ref: 'OUT_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예금잔액"],         ref: 'BALANCE_AMT',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["소스"],         ref: 'DATA_SOURCE',    type:'output',  	width:'40px',  style:'text-align:left'},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
    }

    const fn_view = async function () {

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
            {caption: ["거래일자"],       ref: 'TRAN_DATE', 		type:'datepicker',  	width:'84px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래시간"],       ref: 'TRAN_TIME', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
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

    const fn_onload = async function () {
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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>