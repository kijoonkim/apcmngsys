<%
    /**
     * @Class Name 		: fbs2240.jsp
     * @Description 	: 급여이체파일전송 화면
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
    <title>title : 급여이체파일전송</title>
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
                <sbux-button id="btnResult" name="btnResult" uitype="normal" text="결과조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_result"></sbux-button>
                <sbux-button id="btnTrans" name="btnTrans" uitype="normal" text="이체처리" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_trans"></sbux-button>
                <sbux-button id="btnBatchResult" name="btnBatchResult" uitype="normal" text="급여이체결과 확인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_batchResult"></sbux-button>
                <sbux-button id="btnTrfCancel" name="btnTrfCancel" uitype="normal" text="급여이체파일 전송취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_trfCancel"></sbux-button>
                <sbux-button id="btnSend" name="btnSend" uitype="normal" text="급여이체파일 전송" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_send"></sbux-button>
                <sbux-button id="btnDownload" name="btnDownload" uitype="normal" text="급여이체파일 저장" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_download"></sbux-button>
                <sbux-button id="btnName" name="btnName" uitype="normal" text="수취인확인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_name"></sbux-button>
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_create"></sbux-button>
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
                    <th scope="row" class="th_bg">사업장</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">예적금</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_DEPOSIT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_DEPOSIT_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_BANK_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_BANK_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">FBS서비스</th>
                    <td class="td_input">
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
                    <th scope="row" class="th_bg">귀속년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_PAY_YYYYMM"
                                name="SRCH_PAY_YYYYMM"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">급여구분</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_PAY_TYPE" uitype="single" jsondata-ref="jsonPayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">귀속일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_PAY_DATE" uitype="single" jsondata-ref="jsonPayDate" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">실지급일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_ACTUAL_PAY_DATE"
                                name="SRCH_ACTUAL_PAY_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                        <sbux-input id="SRCH_PASSWORD" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                        <sbux-input id="SRCH_APPR_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>이체 리스트</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-input id="PAY_AMOUNT" uitype="text" placeholder="" class="form-control input-sm" style="float: right; margin-right: 5px;" readonly></sbux-input>
                        <label style="float: right; padding-top: 7px;">이체금액합계</label>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwList" style="height:650px;"></div>
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
    //-----------------------------------------------------------

    var jsonPayType = []; // 급여구분
    var jsonPayDate = []; // 귀속일자
    var jsonSiteCode = []; // 사업장
    var jsonPayGubun = []; // 지급구분
    var jsonFirmbankNameCode = []; // 계좌조회결과
    var jsonUser = []; // 사용자

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언

    var jsonTransferDetailList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            //사업장
            gfnma_setComSelect(['gvwList'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CODE', 		width:'80px',  		style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    	width:'120px',  	style:'text-align:left'}
                ]
            }),
            // 예적금원장
            gfnma_multiSelectInit({
                target: ['#SRCH_DEPOSIT_CODE'],
                compCode: gv_ma_selectedApcCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_DEPOSIT_LIST',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'DEPOSIT_CODE',
                colLabel: 'DEPOSIT_NAME',
                columns: [
                    {caption: "예적금코드",	ref: 'DEPOSIT_CODE', width: '80px', style: 'text-align:left' },
                    {caption: "예적금명",		ref: 'DEPOSIT_NAME', width: '200px',style: 'text-align:left' },
                ]
            }),
            // 예적금원장_은행코드
            gfnma_multiSelectInit({
                target: ['#SRCH_BANK_CODE'],
                compCode: gv_ma_selectedApcCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_DEPOSIT_BANK_CODE',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'DEPOSIT_CODE',
                colLabel: 'BANK_CODE',
                columns: [
                    {caption: "예적금코드",	ref: 'DEPOSIT_CODE', width: '80px', style: 'text-align:left' },
                    {caption: "은행코드",		ref: 'BANK_CODE', width: '200px',style: 'text-align:left' },
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
            // 급여영역
            gfnma_setComSelect(['SRCH_PAY_TYPE', 'gvwList'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 귀속일자
            gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),
            // 지급구분
            gfnma_setComSelect(['gvwList'], jsonPayGubun, 'L_HRP054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계좌조회결과
            gfnma_setComSelect(['gvwList'], jsonFirmbankNameCode, 'L_FIF019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwList'], jsonUser, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonTransferDetailList';
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
            {caption: ["연번"],       ref: 'TXN_ID', 		type:'datepicker',  	width:'88px',  	style:'text-align:left'},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '105px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["급여구분"], 		ref: 'PAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '70px',
                typeinfo: {
                    ref			: 'jsonPayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급구분"], 		ref: 'PAY_GUBUN',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPayGubun',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["은행코드"],         ref: 'BANK_CODE',    type:'output',  	width:'65px',  style:'text-align:left', hidden: true},
            {caption: ["은행"],         ref: 'BANK_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'65px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_FULL_NAME',    type:'output',  	width:'65px',  style:'text-align:left'},
            {caption: ["계좌번호"],         ref: 'BANK_ACCOUNT_REAL',    type:'output',  	width:'115px',  style:'text-align:left'},
            {caption: ["예금주"],         ref: 'BANK_DEPOSITOR',    type:'output',  	width:'65px',  style:'text-align:left'},
            {caption: ["주민번호"],         ref: 'SOCIAL_NUM_REAL',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["지급액"],         ref: 'PAY_NET_AMT',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["급여계좌(인사)"],         ref: 'BANK_ACCOUNT_REAL_HRP',    type:'output',  	width:'143px',  style:'text-align:left'},
            {caption: ["지급액(인사)"],         ref: 'PAY_NET_AMT_HRP',    type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["SOCIAL_NUM"],         ref: 'SOCIAL_NUM',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["BANK_ACCOUNT"],         ref: 'BANK_ACCOUNT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["응답코드"],         ref: 'FIRMBANK_ERROR_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["응답메시지"],         ref: 'FIRMBANK_ERROR_MESSAGE',    type:'output',  	width:'180px',  style:'text-align:left'},
            {caption: ["결과수신시각"],       ref: 'FIRMBANK_RECEIVE_DATE', 		type:'datepicker',  	width:'136px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["계좌조회결과"], 		ref: 'FIRMBANK_NAME_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonFirmbankNameCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계좌조회명"],         ref: 'FIRMBANK_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["전문번호"],         ref: 'FIRMBANK_NO',    type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["펌뱅킹은행"],         ref: 'FIRMBANK_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["수수료"],         ref: 'FIRMBANK_FEE_AMT',    type:'output',  	width:'75px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number'}
            },
            {caption: ["승인상태"],         ref: 'FIRMBANK_CONFIRM_STATUS',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["승인자"],         ref: 'CONFIRM_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["지급일자"],       ref: 'FIRMBANK_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["이체여부"],  ref: 'TRAN_YN',  type:'checkbox',  	width:'75px',  	style:'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                disabled: true
                , hidden: true
            },
            {caption: ["전송여부"],  ref: 'FIRMBANK_SEND_YN',  type:'checkbox',  	width:'59px',  	style:'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                disabled: true
            },
            {caption: ["전송시간"],       ref: 'FIRMBANK_SEND_DATE', 		type:'datepicker',  	width:'141px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["전송자"], 		ref: 'FIRMBANK_SEND_USERID',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonUser',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["결재ID"],         ref: 'APPR_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwListGrid();
    });
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>