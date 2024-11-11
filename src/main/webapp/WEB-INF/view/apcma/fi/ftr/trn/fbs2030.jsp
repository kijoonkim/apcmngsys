<%
    /**
     * @Class Name 		: fbs2030.jsp
     * @Description 	: 실시간이체처리조회 화면
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
    <title>title : 실시간이체처리조회</title>
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
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="이체확인증" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_print"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table  id="srchArea" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 1%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 3%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">사업단위</th>
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
                    <th scope="row" class="th_bg">거래처</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_CUSTOMER_CS">
                        <sbux-input id="SRCH_CUSTOMER_CS_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_CUSTOMER_CS">
                        <sbux-input id="SRCH_CUSTOMER_CS_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_CUSTOMER_CS">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findCsCode"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">입출예정일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_TXN_DATE_FR"
                                name="SRCH_TXN_DATE_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
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
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <th scope="row" class="th_bg">은행</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK">
                        <sbux-input id="SRCH_BANK_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK">
                        <sbux-input id="SRCH_BANK_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">계좌번호</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK_ACCOUNT">
                        <sbux-input id="SRCH_BANK_ACCOUNT_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK_ACCOUNT">
                        <sbux-input id="SRCH_BANK_ACCOUNT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_BANK_ACCOUNT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findBankAccount"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">전표번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DOC_NAME_FR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DOC_NAME_TO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_DOC_YN"
                                name="SRCH_MULTI_DOC_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </th>
                    <td class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수전표" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="fn_multiDoc"
                        ></sbux-button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>자금이체 내역</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwInfo" style="height:350px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li><span>자금계획 내역</span></li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 0px;">
                    <div id="sb-area-gvwAct" style="height:250px;"></div>
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

    var dsReport;
    var strDocNameList = "";

    var jsonSiteCode = []; // 사업장
    var jsonTransferType = []; // 입출유형
    var jsonDepositCode = []; // 입금코드
    var jsonBankCode = []; // 은행코드
    var jsonProcessYn = []; // 처리결과코드
    var jsonCurrencyCode = []; // 통화
    var jsonUser = []; // 사용자
    var jsonPayMethod = []; // 지불방식

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var gvwAct;

    var jsonFundTransferList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonFinancialPlanList = [];

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
            // 사업장
            gfnma_setComSelect(['gvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 입출유형
            gfnma_setComSelect(['gvwInfo'], jsonTransferType, 'L_FBS016', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급구분
            gfnma_setComSelect(['gvwInfo'], jsonDepositCode, 'L_DEPOSIT_LIST', "", gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPOSIT_CODE', 'DEPOSIT_NAME', 'Y', ''),
            // 은행코드
            gfnma_setComSelect(['gvwInfo'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 이체처리결과
            gfnma_setComSelect(['gvwInfo'], jsonProcessYn, 'L_FIM080', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['gvwAct'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwAct'], jsonUser, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
            // 지불방식
            gfnma_setComSelect(['gvwAct'], jsonPayMethod, 'L_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonFundTransferList';
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
            {caption: ["처리예정일"],       ref: 'PLANNED_PAY_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["SEQ"],         ref: 'SEQ',    type:'output',  	width:'44px',  style:'text-align:left', hidden: true},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '115px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["등록일"],       ref: 'TXN_DATE', 		type:'inputdate',  	width:'96px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["등록시간"],       ref: 'TXN_TIME', 		type:'inputdate',  	width:'65px',  	style:'text-align:left',
                format : {type:'date', rule:'HH:mm:ss', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
                , disabled: true
            },
            {caption: ["등록회차"],         ref: 'TRANS_COUNT',    type:'output',  	width:'60px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'TXN_SEQ',    type:'output',  	width:'49px',  style:'text-align:left'},
            {caption: ["입출유형"], 		ref: 'TRANSFER_TYPE',   	    type:'combo', style:'text-align:left' ,width: '97px',
                typeinfo: {
                    ref			: 'jsonTransferType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["DOC_ID"],         ref: 'DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'96px',  style:'text-align:left'},
            {caption: ["거래처c"],         ref: 'CS_CODE',    type:'output',  	width:'65px',  style:'text-align:left', hidden: true},
            {caption: ["거래처명"],         ref: 'CS_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["예약여부"],         ref: 'RESERVE_YN',    type:'output',  	width:'66px',  style:'text-align:left', hidden: true},
            {caption: ["출금예적금"], 		ref: 'DEPOSIT_CODE',   	    type:'combo', style:'text-align:left' ,width: '150px',
                typeinfo: {
                    ref			: 'jsonDepositCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["출금은행명"],         ref: 'BANK_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["은행"],         ref: 'BANK_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["출금계좌번호"],         ref: 'BANK_ACCOUNT_NO',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["출금예금주"],         ref: 'BANK_OWNER',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["입금은행"], 		ref: 'PAYER_BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '103px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["입금은행명"],         ref: 'PAYER_BANK_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["입금계좌"],         ref: 'PAYER_BANK_ACCOUNT',    type:'output',  	width:'114px',  style:'text-align:left'},
            {caption: ["이체금액"],         ref: 'TXN_AMT',    type:'input',  	width:'108px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예금주"],         ref: 'PAYER_BANK_ACCOUNT_OWNER',    type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["지급구분"],         ref: 'PAYROLL_FLAG',    type:'output',  	width:'60px',  style:'text-align:left'},
            {caption: ["입금적요"],         ref: 'IN_PRINT',    type:'output',  	width:'118px',  style:'text-align:left'},
            {caption: ["출금적요"],         ref: 'OUT_PRINT',    type:'output',  	width:'118px',  style:'text-align:left'},
            {caption: ["거래ID"],         ref: 'TREASURY_ID',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["수수료"],         ref: 'FEE_AMT',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["처리결과"], 		ref: 'PROCESS_YN',   	    type:'combo', style:'text-align:left' ,width: '146px',
                typeinfo: {
                    ref			: 'jsonProcessYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["처리일"],       ref: 'PROCESS_DATE', 		type:'inputdate',  	width:'101px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["에러메세지"],         ref: 'ERROR_MESSAGE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["EB여부"],         ref: 'EB_USED',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["입력시간"],       ref: 'INSERT_TIME', 		type:'inputdate',  	width:'160px',  	style:'text-align:left',
                format : {type:'date', rule:'HH:mm:ss', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
                , disabled: true
            },
            {caption: ["수정시간"],       ref: 'UPDATE_TIME', 		type:'inputdate',  	width:'160px',  	style:'text-align:left',
                format : {type:'date', rule:'HH:mm:ss', origin:'HHmmss'}, typeinfo : {mask : {alias : 'numeric'}}
                , disabled: true
            },
            {caption: ["TXN_TIME_RAW"],         ref: 'TXN_TIME_RAW',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('click', 'fn_view');
        gvwInfo.bind('dblclick', 'fn_gvwInfoDblclick');
    }

    function fn_createGvwActGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAct';
        SBGridProperties.id 				= 'gvwAct';
        SBGridProperties.jsonref 			= 'jsonFinancialPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["자금배치번호"],         ref: 'TREASURY_BATCH_NO',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["지급요청일"],       ref: 'PLANNED_PAY_DATE', 		type:'inputdate',  	width:'92px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '69px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'76px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["부가세(￦)"],         ref: 'VAT_AMOUNT',    type:'output',  	width:'117px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["품의금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'123px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["품의환산금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'129px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["작성자"], 		ref: 'INSERT_USERID',   	    type:'combo', style:'text-align:left' ,width: '90px',
                typeinfo: {
                    ref			: 'jsonUser',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '76px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["순번"],         ref: 'TXN_SEQ',    type:'output',  	width:'45px',  style:'text-align:left'},
            {caption: ["집행금액"],         ref: 'ORIGINAL_AMOUNT2',    type:'output',  	width:'123px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["집행원화금액"],         ref: 'FUNCTIONAL_AMOUNT2',    type:'output',  	width:'125px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["적요"],         ref: 'DESCRIPTION',    type:'output',  	width:'300px',  style:'text-align:left'},
        ];

        gvwAct = _SBGrid.create(SBGridProperties);
        gvwAct.bind('dblclick', 'fn_gvwActDblclick');
    }

    const fn_view = async function () {
        var nRow = gvwInfo.getRow();
        if (nRow < 0)
            return;

        fnQRY_P_FBS2030_Q("DETAIL");
    }

    const fn_gvwInfoDblclick = async function () {
        var nRow = gvwInfo.getRow();
        var nCol = gvwInfo.getCol();

        if (nCol != gvwInfo.getColRef("DOC_NAME")) {
            var param = {
                TYPE : "Q",
                COMP_CODE : gv_ma_selectedApcCd,
                FI_ORG_CODE : gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')),
                TXN_DATE : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TXN_DATE"))),
                TXN_TIME : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TXN_TIME"))),
                TXN_TIME_RAW : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TXN_TIME_RAW"))),
                TRANS_COUNT : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TRANS_COUNT"))),
                TXN_ID : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TREASURY_ID"))),
                DEPOSIT_CODE : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("DEPOSIT_CODE"))),
                BANK_CODE : gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("BANK_CODE"))),
                ASAVE : "N",
                APRINT : "N",
                target : "MA_A20_060_030_720"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        } else if(nCol == gvwInfo.getColRef("DOC_NAME")) {
            var param = {
                WORK_TYPE: "VIEW",
                DOC_ID: gvwInfo.getCellData(nRow, gvwInfo.getColRef("DOC_ID")),
                target: "MA_A20_030_020_150"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        }
    }

    const fn_gvwActDblclick = async function () {
        // TODO FIF4110가 없어서 TRP1060로 대체
        if (gvwAct.getRow() < 0)
            return;

        if (nCol != gvwAct.getColRef("TREASURY_BATCH_NO")) {
            var param = {
                TREASURY_BATCH_NO: gvwAct.getCellData(gvwAct.getRow(), gvwAct.getColRef("TREASURY_BATCH_NO")),
                COMP_CODE: gv_ma_selectedApcCd,
                FI_ORG_CODE: gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')),
                ASAVE : "N",
                APRINT : "N",
                target : "MA_A20_060_030_700"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        }
    }

    const fn_findCsCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_CUSTOMER_CS_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_CUSTOMER_CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' AND BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_PURCHASE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명", "사업자번호" ]
            ,searchInputFields		: ["CS_CODE", "CS_NAME", "BIZ_REGNO"]
            ,searchInputValues		: [searchCode, searchName, ""]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소", "전화", "팩스", "지급기준", "지급기준명", "지급방법", "통화"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS", "ADDRESS", "TEL", "FAX", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_CUSTOMER_CS_NAME', data.CS_NAME);
                SBUxMethod.set('SRCH_CUSTOMER_CS_CODE', data.CS_CODE);
            },
        });
    }

    const fn_findBankCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_NAME"));
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
            ,searchInputValues		: [searchCode, searchName]
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
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NO"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND AA.code LIKE '%" + replaceText0 + "%' AND AA.name LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행계좌 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_BANK_ACCOUNT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["CODE", "NAME"]
            ,searchInputValues		: [searchCode, searchName]
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

    const fn_multiDoc = function() {
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
                    SBUxMethod.set("SRCH_MULTI_DOC_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_DOC_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fnQRY_P_FBS2030_Q = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }
        var nRow = gvwInfo.getRow();

        try {
            let itreasury_id = 0;

            if (strWorkType == "MASTER")
                itreasury_id = 0;
            else {
                if (nRow >= 0) {
                    itreasury_id = parseInt(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TREASURY_ID")));
                }
            }

            // 비즈니스 로직 정보
            let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
            let TXN_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FR"));
            let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO"));
            let TREASURY_ID = itreasury_id;
            let BANK_CODE = gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE"));
            let BANK_ACCOUNT_NO = gfn_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NO"));
            let CS_CODE = gfn_nvl(SBUxMethod.get("SRCH_CUSTOMER_CS_CODE"));
            let DOC_NAME_FR = gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME_FR"));
            let DOC_NAME_TO = gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME_TO"));
            let DOC_NAME_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_DOC_YN").SRCH_MULTI_DOC_YN) == "N" ? strDocNameList : "";

            // 비즈니스 로직 정보
            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE : FI_ORG_CODE,
                V_P_TXN_DATE_FR : TXN_DATE_FR,
                V_P_TXN_DATE_TO : TXN_DATE_TO,
                V_P_TREASURY_ID : TREASURY_ID,
                V_P_BANK_CODE : BANK_CODE,
                V_P_BANK_ACCOUNT_NO : BANK_ACCOUNT_NO,
                V_P_CS_CODE : CS_CODE,
                V_P_DOC_NAME_FR : DOC_NAME_FR,
                V_P_DOC_NAME_TO : DOC_NAME_TO,
                V_P_DOC_NAME_D : DOC_NAME_D,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbs2030List.do", {
                getType				: 'json',
                workType			: strWorkType,
                cv_count			: '2',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (strWorkType == "MASTER") {
                        jsonFundTransferList.length = 0;
                        data.cv_1.forEach((item, index) => {
                            const msg = {
                                SITE_CODE : item.SITE_CODE,
                                SEQ : item.SEQ,
                                TXN_DATE : item.TXN_DATE,
                                TXN_DATE_DSP : item.TXN_DATE_DSP,
                                TXN_TIME : item.TXN_TIME,
                                TXN_TIME_RAW : item.TXN_TIME_RAW,
                                TRANS_COUNT : item.TRANS_COUNT,
                                TXN_SEQ : item.TXN_SEQ,
                                TRANSFER_TYPE : item.TRANSFER_TYPE,
                                RESERVE_YN : item.RESERVE_YN,
                                DEPOSIT_CODE : item.DEPOSIT_CODE,
                                BANK_CODE : item.BANK_CODE,
                                BANK_NAME : item.BANK_NAME,
                                BANK_ACCOUNT_NO : item.BANK_ACCOUNT_NO,
                                PAYER_BANK_CODE : item.PAYER_BANK_CODE,
                                PAYER_BANK_NAME : item.PAYER_BANK_NAME,
                                PAYER_BANK_ACCOUNT : item.PAYER_BANK_ACCOUNT,
                                TXN_AMT : item.TXN_AMT,
                                TXN_AMT_DSP : item.TXN_AMT_DSP,
                                PAYER_BANK_ACCOUNT_OWNER : item.PAYER_BANK_ACCOUNT_OWNER,
                                PAYROLL_FLAG : item.PAYROLL_FLAG,
                                IN_PRINT : item.IN_PRINT,
                                OUT_PRINT : item.OUT_PRINT,
                                BANK_OWNER : item.BANK_OWNER,
                                FEE_AMT : item.FEE_AMT,
                                PROCESS_YN : item.PROCESS_YN,
                                PROCESS_DATE : item.PROCESS_DATE,
                                ERROR_MESSAGE : item.ERROR_MESSAGE,
                                EB_USED : item.EB_USED,
                                INSERT_TIME : item.INSERT_TIME,
                                UPDATE_TIME : item.UPDATE_TIME,
                                TREASURY_ID : item.TREASURY_ID,
                                BANK_CODE : item.BANK_CODE,
                                PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                                FI_ORG_CODE : item.FI_ORG_CODE,
                                DOC_ID : item.DOC_ID,
                                DOC_NAME : item.DOC_NAME,
                                DATE_TIME : item.DATE_TIME,
                                CS_CODE : item.CS_CODE,
                                CS_NAME : item.CS_NAME,
                                ACCOUNT_OWNER : item.ACCOUNT_OWNER,
                                M_BANK_CODENM : item.M_BANK_CODENM,
                                PAYER_BANK_CODENM : item.PAYER_BANK_CODENM,
                            }
                            jsonFundTransferList.push(msg);
                        });

                        gvwInfo.rebuild();

                        document.querySelector('#listCount').innerText = jsonFundTransferList.length;

                        if (jsonFundTransferList.length > 0) {
                            gvwInfo.clickRow(1);
                        } else {
                            jsonFinancialPlanList.length = 0;
                        }
                    } else if (strWorkType == "DETAIL") {
                        jsonFinancialPlanList.length = 0;
                        data.cv_2.forEach((item, index) => {
                            const msg = {
                                TREASURY_BATCH_NO : item.TREASURY_BATCH_NO,
                                TXN_ID : item.TXN_ID,
                                TXN_SEQ : item.TXN_SEQ,
                                PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                                CURRENCY_CODE : item.CURRENCY_CODE,
                                EXCHANGE_RATE : item.EXCHANGE_RATE,
                                DESCRIPTION : item.DESCRIPTION,
                                ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                                FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT,
                                ORIGINAL_AMOUNT2 : item.ORIGINAL_AMOUNT2,
                                FUNCTIONAL_AMOUNT2 : item.FUNCTIONAL_AMOUNT2,
                                INSERT_USERID : item.INSERT_USERID,
                                PAY_METHOD : item.PAY_METHOD,
                            }
                            jsonFinancialPlanList.push(msg);
                        });

                        gvwAct.rebuild();
                    } else if (strWorkType == "PRINT") {
                        if (data.cv_1.length > 0) {
                            dsReport = data.cv_1;
                        }
                    }
                    return true;
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
        } catch (e) {
            console.error(e);
            return false;
        }
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_TXN_DATE_FR", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_TXN_DATE_TO", gfn_dateToYmd(new Date()));

        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        fn_createGvwActGrid();
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
        var param = {
            TYPE : "N",
            COMP_CODE : gv_ma_selectedApcCd,
            FI_ORG_CODE : '',
            TXN_DATE : '',
            TXN_TIME : '',
            TXN_TIME_RAW : '',
            TRANS_COUNT : '',
            TXN_ID : '',
            DEPOSIT_CODE : '',
            BANK_CODE : '',
            ASAVE : "N",
            APRINT : "N",
            target : "MA_A20_060_030_720"
        };

        let json = JSON.stringify(param);
        window.parent.cfn_openTabSearch(json);
    }

    const fn_search = async function () {
        fnQRY_P_FBS2030_Q("MASTER");
    }

    const fn_print = async function () {
        // TODO : 레포트 개발 필요
        await fnQRY_P_FBS2030_Q("PRINT");

        let strTxn_date = "";
        let strTxn_time = "";

        let txn_date = "";
        let txn_time = "";

        var dt = dsReport;

        for (var i = 0; i < dt.length; i++) {
            if(!(txn_date == dt[i]["TXN_DATE"] && txn_time == dt[i]["TXN_TIME"].replaceAll(":", ""))) {
                strTxn_date += dt[i]["TXN_DATE"] + "|";
                strTxn_time += dt[i]["TXN_TIME"].replaceAll(":", "") + "|";

                txn_date = dt[i]["TXN_DATE"];
                txn_time = dt[i]["TXN_TIME"].replaceAll(":", "");
            }
        }

        if (dt.length > 0) {
            strTxn_date = strTxn_date.substring(0, strTxn_date.length - 1);
            strTxn_time = strTxn_time.substring(0, strTxn_time.length - 1);
        }

        var param = {};
        param["WORK_TYPE"] = "FBS";
        param["PRINT_TYPE"] = "PREVIEW";
        param["TXN_DATE"] = strTxn_date;
        param["TXN_TIME"] = strTxn_time;

        gfn_popClipReport("", reportFilePath, param);
        // OpenPopupForm("\\FIG\\App.erp.FIG.FIG1010.dll", param);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>