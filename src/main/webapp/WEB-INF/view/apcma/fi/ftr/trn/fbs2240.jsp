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
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>
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
                    <%--<sbux-button id="btnResult" name="btnResult" uitype="normal" text="결과조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_result"></sbux-button>
                    <sbux-button id="btnTrans" name="btnTrans" uitype="normal" text="이체처리" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_trans"></sbux-button>--%>
                    <%--<sbux-button id="btnBatchResult" name="btnBatchResult" uitype="normal" text="급여이체결과 확인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_batchResult"></sbux-button>--%>
                    <sbux-button id="btnConfirmHist" name="btnConfirmHist" uitype="normal" text="결재이력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confimHist"></sbux-button>
                    <sbux-button id="btnTrfCancel" name="btnTrfCancel" uitype="normal" text="급여이체파일 전송취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_trfCancel"></sbux-button>
                    <sbux-button id="btnSend" name="btnSend" uitype="normal" text="급여이체파일 전송" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_send"></sbux-button>
                    <sbux-button id="btnDownload" name="btnDownload" uitype="normal" text="급여이체파일 저장" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_download"></sbux-button>
                    <sbux-button id="btnName" name="btnName" uitype="normal" text="수취인확인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_name"></sbux-button>
                    <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_create"></sbux-button>
                    <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_print"></sbux-button>
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
                        <th scope="row" class="th_bg_search">사업장</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">예적금</th>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_DEPOSIT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_DEPOSIT_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_BANK_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SRCH_BANK_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
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
                        <th scope="row" class="th_bg_search">귀속년월</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_PAY_YYYYMM"
                                    name="SRCH_PAY_YYYYMM"
                                    datepicker-mode="month"
                                    date-format="yyyy-mm"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                    style="width:100%;"
                                    group-id="panHeader"
                                    required
                            />
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">급여구분</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <sbux-select id="SRCH_PAY_TYPE" uitype="single" jsondata-ref="jsonPayType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panHeader" required></sbux-select>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">귀속일자</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <sbux-select id="SRCH_PAY_DATE" uitype="single" jsondata-ref="jsonPayDate" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panHeader" required></sbux-select>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">실지급일자</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_ACTUAL_PAY_DATE"
                                    name="SRCH_ACTUAL_PAY_DATE"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                    style="width:100%;"
                                    group-id="panHeader"
                                    required
                            />
                            <sbux-input id="SRCH_PASSWORD" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-input id="SRCH_APPR_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    </tbody>
                </table>
                </div>
                <div class="row">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>이체 리스트</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-input id="PAY_AMOUNT" uitype="text" placeholder="" class="form-control input-sm" style="float: right; margin-right: 5px;" readonly></sbux-input>
                            <label style="float: right; padding-top: 7px;">이체금액합계</label>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                        <div id="sb-area-gvwInfo" style="height:540px;"></div>
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
        <sbux-modal style="width:600px" id="modal-compopfbspassword" name="modal-compopfbspassword" uitype="middle" header-title="" body-html-id="body-modal-compopfbspassword" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopfbspassword">
        <jsp:include page="../../../com/popup/comPopFbsPassword.jsp"></jsp:include>
    </div>
<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:1400px" id="modal-compopfim3420" name="modal-compopfim3420" uitype="middle" header-title="" body-html-id="body-modal-compopfim3420" header-is-close-button="true" footer-is-close-button="false" callback-after-close="fn_search"></sbux-modal>
    </div>
    <div id="body-modal-compopfim3420">
    	<jsp:include page="../../../com/popup/comPopFim3420.jsp"></jsp:include>
    </div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_empCode = '${loginVO.maEmpCode}';
    var p_fbsServerType = '${loginVO.maFBSSERVERTYPE}';
    var p_fbsBip = '${loginVO.maFBSBIP}';
    var p_fbsSendPath = '${loginVO.maFBSSENDPATH}';
    var p_fbsBatchId = '${loginVO.maFBSBATCHID}';
    var p_fbsBatchPw = '${loginVO.maFBSBATCHPW}';
    var p_fbsReceivePath = '${loginVO.maFBSRECEIVEPATH}';
    //-----------------------------------------------------------

    var ds;
    var dtFirmbanking;
    var bReaderEnabled = false;

    var strConfrimStatus = "1";
    var strEmpCodeList = "";
    var numApprId = 0;


    var jsonPayType = []; // 급여구분
    var jsonPayDate = []; // 귀속일자
    var jsonSiteCode = []; // 사업장
    var jsonPayGubun = []; // 지급구분
    var jsonFirmbankNameCode = []; // 계좌조회결과
    var jsonUser = []; // 사용자

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonTransferDetailList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            //사업장
            gfnma_setComSelect(['gvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedCorpCd
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
                compCode: gv_ma_selectedCorpCd,
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
                ],
                callback: function (value) {
                    gfnma_multiSelectSet('#SRCH_BANK_CODE', 'DEPOSIT_CODE', 'BANK_CODE', value);
                }
            }),
            // 예적금원장_은행코드
            gfnma_multiSelectInit({
                target: ['#SRCH_BANK_CODE'],
                compCode: gv_ma_selectedCorpCd,
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
            // 급여영역
            gfnma_setComSelect(['SRCH_PAY_TYPE', 'gvwInfo'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 귀속일자
            gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),
            // 지급구분
            gfnma_setComSelect(['gvwInfo'], jsonPayGubun, 'L_HRP054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계좌조회결과
            gfnma_setComSelect(['gvwInfo'], jsonFirmbankNameCode, 'L_FIF019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwInfo'], jsonUser, 'L_USER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonTransferDetailList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
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
            {caption: ["연번"],       ref: 'TXN_ID', 		type:'inputdate',  	width:'88px',  	style:'text-align:left'},
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
            {caption: ["지급액"],         ref: 'PAY_NET_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["급여계좌(인사)"],         ref: 'BANK_ACCOUNT_REAL_HRP',    type:'output',  	width:'143px',  style:'text-align:left'},
            {caption: ["지급액(인사)"],         ref: 'PAY_NET_AMT_HRP',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["SOCIAL_NUM"],         ref: 'SOCIAL_NUM',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["BANK_ACCOUNT"],         ref: 'BANK_ACCOUNT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["응답코드"],         ref: 'FIRMBANK_ERROR_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["응답메시지"],         ref: 'FIRMBANK_ERROR_MESSAGE',    type:'output',  	width:'180px',  style:'text-align:left'},
            {caption: ["결과수신시각"],       ref: 'FIRMBANK_RECEIVE_DATE', 		type:'inputdate',  	width:'136px',  	style:'text-align:left',
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
            {caption: ["지급일자"],       ref: 'FIRMBANK_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
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
            {caption: ["전송시간"],       ref: 'FIRMBANK_SEND_DATE', 		type:'inputdate',  	width:'141px',  	style:'text-align:left',
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

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('click', 'fn_view');
        gvwInfo.bind('keyup', 'fn_keyup');
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function () {
        var nRow = gvwInfo.getRow();
        var nCol = gvwInfo.getCol();
        if(nRow < 1) return;

        if(nCol == gvwInfo.getColRef("CHECK_YN")) {
            let gvwListCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHECK_YN"), true);
            let dpay_amt = 0;

            gvwListCheckedList.forEach((item, index) => {
                dpay_amt += Number(gvwInfo.getCellData(item, gvwInfo.getColRef("PAY_NET_AMT")));
            });

            SBUxMethod.set("PAY_AMOUNT", dpay_amt);
        }

        strConfrimStatus = gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("FIRMBANK_CONFIRM_STATUS")));
        numApprId = gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("APPR_ID"))) == "" ? 0 : parseInt(gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("APPR_ID"))));
        var strstatus = gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("FIRMBANK_CONFIRM_STATUS")));
        var strconfirmemp_code = gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("CONFIRM_EMP_CODE")));
        var strtran_yn = gfn_nvl(gvwInfo.getCellData(nRow, gvwInfo.getColRef("TRAN_YN")));

        strPayType = gvwInfo.getCellData(nRow, gvwInfo.getColRef("PAY_TYPE"));

        if (strstatus == "1") {  //미승인
            $("#btnSummit").attr('disabled', 'false');
            $("#btnTrans").attr('disabled', 'true');
            $("#btnResult").attr('disabled', 'true');
        } else if (strstatus == "3") { //승인중
            $("#btnSummit").attr('disabled', 'true');
            $("#btnTrans").attr('disabled', 'true');
            $("#btnResult").attr('disabled', 'true');

            if (strconfirmemp_code == p_empCode) {
                $("#btnSummit").attr('disabled', 'false');
            }
        }
        else if (strstatus == "5") { //승인완료
            $("#btnSummit").attr('disabled', 'true');
            $("#btnTrans").attr('disabled', 'false');
            $("#btnResult").attr('disabled', 'false');
        } else {
            $("#btnSummit").attr('disabled', 'true');
            $("#btnTrans").attr('disabled', 'true');
            $("#btnResult").attr('disabled', 'true');
        }

        if (strtran_yn == "Y")
            $("#btnTrans").attr('disabled', 'false');
        else
            $("#btnTrans").attr('disabled', 'true');
    }

    const fn_onload = async function (parentParameter) {
        SBUxMethod.set("SRCH_PAY_YYYYMM", gfn_dateToYm(new Date()));

        if (p_fbsServerType == "DEV") {
            gfnma_multiSelectSet('#SRCH_DEPOSIT_CODE', 'DEPOSIT_CODE', 'DEPOSIT_NAME', "0201825KRW12");
        } else {
            gfnma_multiSelectSet('#SRCH_DEPOSIT_CODE', 'DEPOSIT_CODE', 'DEPOSIT_NAME', "0110000KRW01");
        }

        if (parentParameter){
            if (parentParameter.hasOwnProperty("TYPE")) {
                if (gfn_nvl(parentParameter["TYPE"]) == "Q1") {
                    if (parentParameter.hasOwnProperty("PAY_YYYYMM")) {
                        SBUxMethod.set("SRCH_PAY_YYYYMM", gfn_nvl(parentParameter["PAY_YYYYMM"]));
                    }

                    if (parentParameter.hasOwnProperty("PAY_GUBUN")) {
                        SBUxMethod.set("SRCH_PAY_TYPE", gfn_nvl(parentParameter["PAY_GUBUN"]));
                    }

                    if (parentParameter.hasOwnProperty("PAY_DATE")) {
                        SBUxMethod.set("SRCH_PAY_DATE", gfn_nvl(parentParameter["PAY_DATE"]));
                    }

                    if (gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")) != "" && gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")) != "" && gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")) != "") {
                        gfnma_multiSelectSet('#SRCH_FBS_SERVICE', 'SUB_CODE', 'CODE_NAME', "ECBANK");
                        fn_search();
                    }
                }
            }
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        await fn_onload();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 결재처리
    function cfn_appr() {
        fn_approval();
    }

    const fnSET_P_FBS2240_S = async function (strWorkType) {
        let listData = [];
        if (strWorkType == "TRF_CANCEL") {
            let gvwInfoCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHECK_YN"), true);

            if (gvwInfoCheckedList.length != 0) {
                gvwInfoCheckedList.forEach((item, index) => {
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
                            V_P_PAY_YYYYMM : gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")),
                            V_P_PAY_TYPE : gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")),
                            V_P_PAY_DATE : gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")),
                            V_P_EMP_CODE : gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("EMP_CODE"))),
                            V_P_FIRMBANK_CODE : "",
                            V_P_FIRMBANK_NAME_CODE : "",
                            V_P_FIRMBANK_NAME : "",
                            V_P_FIRMBANK_DATE : "",
                            V_P_FIRMBANK_NO : "",
                            V_P_FIRMBANK_ERROR_CODE : "",
                            V_P_FIRMBANK_FEE_AMT : 0,
                            V_P_FORM_ID: p_formId,
                            V_P_MENU_ID: p_menuId,
                            V_P_PROC_ID: '',
                            V_P_USERID: '',
                            V_P_PC: ''
                        })
                    }
                    listData.push(param);
                });
            }
        } else {
            for(var i = 0; i < jsonTransferDetailList.length; i++) {
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
                        V_P_PAY_YYYYMM : gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")),
                        V_P_PAY_TYPE : gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")),
                        V_P_PAY_DATE : gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")),
                        V_P_EMP_CODE : gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("EMP_CODE"))),
                        V_P_FIRMBANK_CODE : gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("FIRMBANK_CODE"))),
                        V_P_FIRMBANK_NAME_CODE : gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("FIRMBANK_NAME_CODE"))),
                        V_P_FIRMBANK_NAME : gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("FIRMBANK_NAME"))),
                        V_P_FIRMBANK_DATE : "",
                        V_P_FIRMBANK_NO : gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("FIRMBANK_NO"))),
                        V_P_FIRMBANK_ERROR_CODE : gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("FIRMBANK_ERROR_CODE"))),
                        V_P_FIRMBANK_FEE_AMT : parseInt(gfn_nvl(gvwInfo.getCellData((i+1), gvwInfo.getColRef("FIRMBANK_FEE_AMT")))),
                        V_P_FORM_ID: p_formId,
                        V_P_MENU_ID: p_menuId,
                        V_P_PROC_ID: '',
                        V_P_USERID: '',
                        V_P_PC: ''
                    })
                }
                listData.push(param);
            }
        }

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertFbs2240List.do", {listData: listData});

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
    }

    const fnQRY_P_FBSPAYROLLBATCH_S = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired('panHeader')) {
             return false;
        }

        let gvwListCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHECK_YN"), true);
        let arr_txn_id = "";
        let arr_emp_code = "";
        let arr_account_num = "";
        let arr_bank_code = "";
        let arr_amt = "";
        let strFBS_WORK_TYPE = "PAYBATCH";
        let sendWorkType = "N";
        let IntRowCount = gvwListCheckedList.length;
        let IntChkCount = 0;

        if ( strWorkType.Equals("BATCH") || strWorkType.Equals("FILE")) { //이체,결과확인
            gvwListCheckedList.forEach((item, index) => {
                if (strWorkType == "BATCH") { //이체,결과확인
                    if (gvwInfo.getCellData(item, gvwInfo.getColRef("FIRMBANK_SEND_YN")) == "Y") {
                        gfn_comAlert("E0000", "(" + gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("EMP_CODE"))) + " : " + gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("EMP_FULL_NAME"))) + ")는 이미 전송하였습니다.");
                        return false;
                    }
                }
            });

            if (IntRowCount > 0) {
                gvwListCheckedList.forEach((item, index) => {
                    strEmpCodeList = "";
                    IntChkCount++;

                    if (arr_emp_code != "") {
                        arr_txn_id += "|";
                        arr_emp_code += "|";
                        arr_account_num += "|";
                        arr_bank_code += "|";
                        arr_amt += "|";

                        strEmpCodeList += "|";
                    }

                    arr_txn_id += gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("TXN_ID"))).trim();
                    arr_emp_code += gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("EMP_CODE"))).trim();
                    arr_account_num += gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("BANK_ACCOUNT_REAL"))).replaceAll("-", "").trim();
                    arr_bank_code += gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("BANK_CODE"))).replaceAll("-", "").trim();
                    arr_amt += gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("PAY_NET_AMT"))).replaceAll("-", "").trim();

                    strEmpCodeList += gfn_nvl(gvwInfo.getCellData(item, gvwInfo.getColRef("EMP_CODE"))).trim();
                });

                let PAY_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
                let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
                let PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"));
                let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE"));
                let BANK_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_BANK_CODE"));
                let PASSWORD = gfn_nvl(SBUxMethod.get("SRCH_PASSWORD"));
                let DEPOSIT_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_CODE"));
                let ACTUAL_PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_ACTUAL_PAY_DATE"));

                // 비즈니스 로직 정보
                var paramObj = {
                    V_P_DEBUG_MODE_YN	: '',
                    V_P_LANG_ID		: '',
                    V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_PAY_YYYYMM : PAY_YYYYMM,
                    V_P_PAY_TYPE_GROUP : PAY_TYPE,
                    V_P_PAY_DATE : PAY_DATE,
                    V_P_FBS_SERVICE : FBS_SERVICE,
                    V_P_FBS_WORK_TYPE : strFBS_WORK_TYPE,
                    V_P_BANK_CODE : BANK_CODE,
                    V_P_PASSWORD : PASSWORD,
                    V_P_DEPOSIT_CODE : DEPOSIT_CODE,
                    V_P_ACTUAL_PAY_DATE : ACTUAL_PAY_DATE,
                    V_P_FILE_NAME : "",
                    V_P_ARR_TXN_ID : arr_txn_id,
                    V_P_ARR_EMP_CODE : arr_emp_code,
                    V_P_ARR_ACCOUNT_NUM : arr_account_num,
                    V_P_ARR_BANK_CODE : arr_bank_code,
                    V_P_ARR_AMT : arr_amt,
                    V_P_PROCESS_YN : "",
                    V_P_INTERFACEID : "",
                    V_P_FORM_ID		: p_formId,
                    V_P_MENU_ID		: p_menuId,
                    V_P_PROC_ID		: '',
                    V_P_USERID			: '',
                    V_P_PC				: '',
                };

                const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbs2240DataForToBeUpload.do", {
                    getType				: 'json',
                    workType			: sendWorkType,
                    cv_count			: '0',
                    params				: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        // 변수 초기화
                        arr_txn_id = "";
                        arr_emp_code = "";
                        arr_account_num = "";
                        arr_bank_code = "";
                        arr_amt = "";

                        if (!fnQRY_P_FBSPAYROLLBATCH_Q(strWorkType)) return false;

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
                gfn_comAlert("E0000", "선택한 데이터가 없습니다.");
                return false;
            }
        }

        return false;
    }

    const fnQRY_P_FBSPAYROLLBATCH_Q = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired('panHeader')) {
            return false;
        }

        let arr_txn_id = "";
        let arr_emp_code = "";
        let arr_account_num = "";
        let arr_bank_code = "";
        let arr_amt = "";
        let strFBS_WORK_TYPE = "PAYBATCH";
        let IntRowCount = 0;

        let PAY_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE"));
        let PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"));
        let BANK_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_BANK_CODE"));
        let PASSWORD = gfn_nvl(SBUxMethod.get("SRCH_PASSWORD"));
        let DEPOSIT_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_CODE"));
        let ACTUAL_PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_ACTUAL_PAY_DATE"));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_YYYYMM : PAY_YYYYMM,
            V_P_PAY_TYPE : PAY_TYPE,
            V_P_FBS_SERVICE : FBS_SERVICE,
            V_P_PAY_DATE : PAY_DATE,
            V_P_FBS_WORK_TYPE : strFBS_WORK_TYPE,
            V_P_BANK_CODE : BANK_CODE,
            V_P_PASSWORD : PASSWORD,
            V_P_DEPOSIT_CODE : DEPOSIT_CODE,
            V_P_ACTUAL_PAY_DATE : ACTUAL_PAY_DATE,
            V_P_FILE_NAME : "",
            V_P_ARR_TXN_ID : arr_txn_id,
            V_P_ARR_EMP_CODE : arr_emp_code,
            V_P_ARR_ACCOUNT_NUM : arr_account_num,
            V_P_ARR_BANK_CODE : arr_bank_code,
            V_P_ARR_AMT : arr_amt,
            V_P_PROCESS_YN : "",
            V_P_INTERFACEID : "",
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbs2240Batch.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                dtFirmbanking = data.cv_1;
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

    const fn_search = async function () {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired('panHeader')) {
            return false;
        }

        // 비즈니스 로직 정보
        let PAY_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"));
        let PASS_WORD = gfn_nvl(SBUxMethod.get("SRCH_PASSWORD"));
        let DEPOSIT_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_CODE"));
        let ACTUAL_PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_ACTUAL_PAY_DATE"));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_YYYYMM : PAY_YYYYMM,
            V_P_PAY_TYPE : PAY_TYPE,
            V_P_PAY_DATE : PAY_DATE,
            V_P_PASS_WORD : PASS_WORD,
            V_P_DEPOSIT_CODE : DEPOSIT_CODE,
            V_P_ACTUAL_PAY_DATE : ACTUAL_PAY_DATE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbs2240List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonTransferDetailList.legnth = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN : item.CHECK_YN,
                        TXN_ID : item.TXN_ID,
                        PAY_TYPE : item.PAY_TYPE,
                        SITE_CODE : item.SITE_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        EMP_CODE : item.EMP_CODE,
                        EMP_FULL_NAME : item.EMP_FULL_NAME,
                        BANK_CODE : item.BANK_CODE,
                        BANK_NAME : item.BANK_NAME,
                        BANK_ACCOUNT : item.BANK_ACCOUNT,
                        BANK_ACCOUNT_REAL : item.BANK_ACCOUNT_REAL,
                        BANK_DEPOSITOR : item.BANK_DEPOSITOR,
                        SOCIAL_NUM : item.SOCIAL_NUM,
                        SOCIAL_NUM_REAL : item.SOCIAL_NUM_REAL,
                        PAY_NET_AMT : item.PAY_NET_AMT,
                        FIRMBANK_CODE : item.FIRMBANK_CODE,
                        FIRMBANK_NAME_CODE : item.FIRMBANK_NAME_CODE,
                        FIRMBANK_NAME : item.FIRMBANK_NAME,
                        FIRMBANK_ERROR_CODE : item.FIRMBANK_ERROR_CODE,
                        FIRMBANK_ERROR_MESSAGE : item.FIRMBANK_ERROR_MESSAGE,
                        FIRMBANK_NO : item.FIRMBANK_NO,
                        FIRMBANK_FEE_AMT : item.FIRMBANK_FEE_AMT,
                        FIRMBANK_CONFIRM_STATUS : item.FIRMBANK_CONFIRM_STATUS,
                        FIRMBANK_DATE : item.FIRMBANK_DATE,
                        TRAN_YN : item.TRAN_YN,
                        PAY_GUBUN : item.PAY_GUBUN,
                        FIRMBANK_SEND_YN : item.FIRMBANK_SEND_YN,
                        FIRMBANK_SEND_DATE : item.FIRMBANK_SEND_DATE,
                        FIRMBANK_RECEIVE_DATE : item.FIRMBANK_RECEIVE_DATE,
                        FIRMBANK_SEND_USERID : item.FIRMBANK_SEND_USERID,
                        BANK_ACCOUNT_HRP : item.BANK_ACCOUNT_HRP,
                        BANK_ACCOUNT_REAL_HRP : item.BANK_ACCOUNT_REAL_HRP,
                        PAY_NET_AMT_HRP : item.PAY_NET_AMT_HRP,
                        PAY_MEMO : item.PAY_MEMO,
                        PAY_SEQ : item.PAY_SEQ,
                        APPR_ID : item.APPR_ID,
                        REQUEST_EMP : item.REQUEST_EMP,
                        BEFORE_APPR_EMP : item.BEFORE_APPR_EMP,
                        NEXT_APPR_EMP : item.NEXT_APPR_EMP,
                        BEFORE_PROXY_EMP : item.BEFORE_PROXY_EMP,
                        NEXT_PROXY_EMP : item.NEXT_PROXY_EMP,
                        CONFIRM_EMP_CODE : item.CONFIRM_EMP_CODE,
                        PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                    }
                    jsonTransferDetailList.push(msg);
                });
                gvwInfo.rebuild();

                document.querySelector('#listCount').innerText = jsonTransferDetailList.length;

                if (jsonTransferDetailList.length > 0) {
                    gvwInfo.clickRow(1);
                }

                $("#btnSend").attr('disabled', 'false');
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

    const fn_approval = async function() {
        if (gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")) == "" || gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_CODE")) == "" || gvwInfo.getRow() < 0)
            return;

        compopappvmng({
            workType		: numApprId == 0 ? 'TEMPLATE' : 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
            ,compCode		: gv_ma_selectedCorpCd
            ,compCodeNm		: gv_ma_selectedCorpNm
            ,clientCode		: gv_ma_selectedClntCd
            ,apprId			: numApprId
            ,sourceNo		: gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")) + "_" + gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")) + "_" + gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"))
            ,sourceType		: "HR"
            ,empCode		: p_empCode
            ,formID			: p_formId
            ,menuId			: p_menuId
            ,callback       : function(data) {
                if(data && data.result == "Y") {
                    fn_search();
                }
            }
        });
    }

    const fn_confimHist = async function () {
        SBUxMethod.attr('modal-compopfim3420', 'header-title', '승인결과조회');
        SBUxMethod.openModal('modal-compopfim3420');

        compopfim3420({
            height			: '600px'
            ,param			: {
                p_appr_id	: numApprId
                ,p_doc_id	: gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")) + "_" + gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")) + "_" + gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"))
                ,p_doc_type	: "HR"
            }
        });
    }

    const fn_print = async function (strPrintType) {
        // TODO : 레포트 개발 필요
        var param = {};

        if (gvwInfo.getRow() < 0 || gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")) == "" || gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")) == "")
            return;

        param["WORK_TYPE"] = "PAY";
        param["PRINT_TYPE"] = strPrintType;
        param["PAY_YYYYMM"] = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        param["PAY_TYPE"] = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        param["PAY_DATE"] = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"));

        gfn_popClipReport("", reportFilePath, param);
        //object objResult = OpenChildForm("\\FIG\\App.erp.FIG.FIG1010.dll", htparam, OpenType.Modal);
    }

    /*const fn_result = async function () {
        if (gvwInfo.FocusedRowHandle < 0)
            return;

        if (!await gfnma_fbsOpen(gfn_nvl(gfnma_multiSelectGet("#SRCH_BANK_CODE")), gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE")),"", "OPEN"))
            return;

        fnQRY_P_FBS2240_Q("RESULT");

        if (dtFirmbanking == null || dtFirmbanking.Rows.Count < 1)
        {
            gfn_comAlert("E0000", "결과를 확인할 데이터가 없습니다.");
            return;
        }

        foreach (DataRow dr in dtFirmbanking.Rows)
        {

            string[] result = fnFirmBankingSend(gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE")), dr["send_data"].ToString());

            int iemp_index = GetGridRowIndex(grdInfo, "emp_code", fnFirmSubString(result[1].ToString(), 71, 8).Trim());

            if (result[0].ToString().Trim() == "000" || result[0].ToString().Trim() == "0000")
            {
                gvwInfo.SetValue(iemp_index, "firmbank_error_code", fnFirmSubString(result[1].ToString(), 193, 4).TrimEnd());
            }

            else
            {
                gfn_comAlert("E0000", "이체 처리 결과확인 실패");
            }
        }

        if (fnSET_P_FBS2240_S("U"))
            fn_search();
    }

    const fn_trans = async function () {
        if (gvwInfo.getRow() < 0)
            return;

        fnQRY_P_FBS2240_Q("BANKING");

        var objResult;
        SBUxMethod.attr('modal-compopfbspassword', 'header-title', '펌뱅킹 비밀번호 입력');
        SBUxMethod.openModal('modal-compopfbspassword');

        compopfbspassword({
            height			: '400px'
            ,callback	: async function (data) {
                objResult = data.PASSWORD;

                if (typeof objResult === 'string') {
                    SBUxMethod.set("PASSWORD", objResult);

                    if (!await gfnma_fbsOpen(gfn_nvl(gfnma_multiSelectGet("#SRCH_BANK_CODE")), gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE")), "", "OPEN"))
                        return;

                    if (dtFirmbanking == null || dtFirmbanking.Rows.Count < 1) {
                        gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
                        return;
                    }

                    let iemp_index = 0;

                    foreach(DataRow dr in dtFirmbanking.Rows){
                        var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE")), dr["SEND_DATA"]);

                        iemp_index = GetGridRowIndex(grdInfo, "emp_code", gfnma_firmSubString(gfn_nvl(result[1]), 71, 8).Trim());

                        if (gfn_nvl(result[0]).trim() == "000" || gfn_nvl(result[0]).trim() == "0000") { // 성공시
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_CODE"), gfnma_firmSubString(gfn_nvl(result[1]), 21, 3));  // 펌뱅킹 은행
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_NO"), gfnma_firmSubString(gfn_nvl(result[1]), 32, 6));    // 전문번호
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_ERROR_CODE"), gfnma_firmSubString(gfn_nvl(result[1]), 52, 4).TrimEnd()); // 펌뱅킹 응답코드
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_FEE_AMT"), gfnma_firmSubString(gfn_nvl(result[1]), 174, 9)); // 수수료
                        } else { //에러시
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_CODE"), gfnma_firmSubString(gfn_nvl(result[1]), 21, 3)); // 펌뱅킹 은행
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_NO"), gfnma_firmSubString(gfn_nvl(result[1]), 32, 6)); // 전문번호
                            gvwInfo.setCellData(iemp_index, gvwInfo.getColRef("FIRMBANK_ERROR_CODE"), gfnma_firmSubString(gfn_nvl(result[1]), 52, 4).TrimEnd()); // 펌뱅킹 응답코드
                        }
                    }

                    if (fnSET_P_FBS2240_S("U"))
                        fn_search();

                }
            },
        });
        SBUxMethod.setModalCss('modal-compopfbspassword', {width:'400px'})


    }

    const fn_batchResult = async function () {
        if (gvwInfo.FocusedRowHandle < 0)
            return;

        Boolean bSuccess = true;

        string newfile_name = "C:\\FB999";

        // 코드 단순화를 위해 하드코드함
        string strftpaddress = "ftp://" + p_fbsBip + "/";
        string strPath = p_fbsReceivePath;
        string ftpPath = strftpaddress + strPath;
        string user = p_fbsBatchId;
        string pwd = p_fbsBatchPw;
        if (p_fbsServerType.Equals("DEV"))
        {
            //ftpPath = "ftp://10.10.153.53//HSSERP_NEW/FBSBATCH/RECV/FB999";
            strftpaddress = "ftp://" + p_fbsBip + "/";
            strPath = p_fbsReceivePath;
            //strPath = "firmtest/data/batch/in/data/";
            ftpPath = strftpaddress + strPath;
            user = p_fbsBatchId;
            pwd = p_fbsBatchPw;
            // user = "fcm";  // FTP 익명 로그인시. 아니면 로그인/암호 지정.
            // pwd = "Hss2016";
        }

        string outputFile = newfile_name;

        // WebRequest.Create로 Http,Ftp,File Request 객체를 모두 생성할 수 있다.
        FtpWebRequest req = (FtpWebRequest)WebRequest.Create(ftpPath);
        // FTP 다운로드한다는 것을 표시
        req.Method = WebRequestMethods.Ftp.DownloadFile;
        // FTP PASSIVE MODE false
        req.UsePassive = false;
        // 익명 로그인이 아닌 경우 로그인/암호를 제공해야
        req.Credentials = new NetworkCredential(user, pwd);

        // FTP Request 결과를 가져온다.
        using (FtpWebResponse resp = (FtpWebResponse)req.GetResponse())
        {
            // FTP 결과 스트림
            Stream stream = resp.GetResponseStream();

            // 결과를 문자열로 읽기 (바이너리로 읽을 수도 있다)
            string data;
            using (StreamReader reader = new StreamReader(stream))
            {
                data = reader.ReadToEnd();
            }

            // 로컬 파일로 출력
            File.WriteAllText(outputFile, data);
        }

        // 데이터 구조
        //  1. HEAD (식별코드 = "11") : 식별코드(2) + 화일코드(2) + 은행코드(2) + 이체지정일(8) + 업체ID(4) + 업체번호(10) + 공란(52)
        //  2. BODY (식별코드 = "22") : 식별코드(2) + 일련번호(7) + 의뢰점(9) + 사용자정의1(8) + 신은행코드(3) + 계좌번호(15) + 이체금액(15) + 자금구분(요금종류)(2) + 처리상태(1) + 불능코드(4) + 예금주명(10) + 공란(10)
        //  3. TAIL (식별코드 = "33") : 식별코드(2) + 의뢰건수(7) + 의뢰금액(15) + 정상처리건수(7) + 정상처리금액(15) + 에러처리건수(7) + 에러처리금액(15) + 사용자정의1(6) + TEST KEY(4) + HEX0D0A(CRLF)(2)
        // (예)
        //      1141052017071426816510102681
        //      220000001241        005620219496245   00000000982000050Y0000
        //      220000002241        02059933184902101 00000000844000050Y0000
        //      220000003241        08118391019113407 00000000697500050Y0000
        //      220000004241        26391000123       00000000568700050X0104
        //      33000000400000003092200000000030000000252350000000001000000005687000      1740

        string strline = "";

        StreamReader srFile = new StreamReader(outputFile);
        // 초기화
        bReaderEnabled = false;

        string strTextCode = "";
        string strInitCode = "";  // 시작점 검출용
        string strTransDate = "";   // 이체지정일

        string strBankCode = "";    // 신은행코드
        string strAccountNum = "";  // 계좌번호
        Int32 iTxnAmt = 0;        // 이체금액
        string strStatus = "";      // 처리상태
        string strErrorCode = "";   // 불능코드

        Int32 iReqestCnt = 0;     // 의뢰건수
        Int32 iReqestAmt = 0;     // 의뢰금액
        Int32 iCompleteCnt = 0;   // 성공건수
        Int32 iCompleteAmt = 0;   // 성공금액
        Int32 iErrorCnt = 0;      // 에러건수
        Int32 iErrorAmt = 0;      // 에러금액

        // 비교용
        Int32 compReqestCnt = 0;     // 의뢰건수
        Int32 compReqestAmt = 0;     // 의뢰금액
        Int32 compCompleteCnt = 0;   // 성공건수
        Int32 compCompleteAmt = 0;   // 성공금액
        Int32 compErrorCnt = 0;      // 에러건수
        Int32 compErrorAmt = 0;      // 에러금액

        while ((strline = srFile.ReadLine()) != null)
        {

            // 초기화
            strTextCode = "";
            strTransDate = "";   // 이체지정일

            strBankCode = "";    // 신은행코드
            strAccountNum = "";  // 계좌번호
            iTxnAmt = 0;        // 이체금액
            strStatus = "";      // 처리상태
            strErrorCode = "";   // 불능코드

            iReqestCnt = 0;     // 의뢰건수
            iReqestAmt = 0;     // 의뢰금액
            iCompleteCnt = 0;   // 성공건수
            iCompleteAmt = 0;   // 성공금액
            iErrorCnt = 0;      // 에러건수
            iErrorAmt = 0;      // 에러금액

            strTextCode = strline.Substring(0, 1);
            strInitCode = strline.Substring(37, 4) + strline.Substring(21, 8);

            //HEAD
            if (strInitCode == ("3797" + cbopay_date.EditValue.ToString().Replace("-", "")))
            {
                bReaderEnabled = true;
            }

            //BODY
            if (strTextCode == "D" && bReaderEnabled)
            {
                strBankCode = strline.Substring(23, 3).Trim(); //신은행코드(3자리)
                strAccountNum = strline.Substring(26, 16).Trim(); //계좌번호
                iTxnAmt = Int32.Parse(strline.Substring(42, 13).Trim()); //이체금액
                strStatus = strline.Substring(154, 1).Trim(); //처리여부
                strErrorCode = strline.Substring(155, 4).Trim(); //불능코드

                for (int i=0;i< gvwInfo.RowCount; i++)
                {
                    string compBankCode = gvwInfo.GetValue(i, "bank_code").ToString();
                    string compAccountNum = gvwInfo.GetValue(i, "bank_account_real").ToString().Replace("-","");
                    Int32  compTxnAmt = Int32.Parse(gvwInfo.GetValue(i, "pay_net_amt").ToString());

                    if(compBankCode == strBankCode && compAccountNum == strAccountNum && compTxnAmt == iTxnAmt)
                    {
                        gvwInfo.SetValue(i, "firmbank_date", strStatus.Equals("Y")?strTransDate:"");
                        gvwInfo.SetValue(i, "tran_yn", strStatus);
                        gvwInfo.SetValue(i, "firmbank_error_code", strErrorCode);

                        break;
                    }
                }

            }

            //TAIL
            if (strTextCode == "E" && bReaderEnabled)
            {
                iReqestCnt = Int32.Parse(strline.Substring(1, 7)); //의뢰건수
                iReqestAmt = Int32.Parse(strline.Substring(37, 15)) + Int32.Parse(strline.Substring(103, 15)) +
                    Int32.Parse(strline.Substring(147, 15)) + Int32.Parse(strline.Substring(169, 15)); //의뢰금액
                iCompleteCnt = Int32.Parse(strline.Substring(8, 7)) + Int32.Parse(strline.Substring(74, 7)) +
                    Int32.Parse(strline.Substring(140, 7)); //성공건수
                iCompleteAmt = Int32.Parse(strline.Substring(15, 15)) + Int32.Parse(strline.Substring(81, 15)) +
                    Int32.Parse(strline.Substring(147, 15)); //성공금액
                iErrorCnt = Int32.Parse(strline.Substring(52, 7)) + Int32.Parse(strline.Substring(118, 7)) +
                    Int32.Parse(strline.Substring(162, 7)); //에러건수
                iErrorAmt = Int32.Parse(strline.Substring(59, 15)) + Int32.Parse(strline.Substring(125, 15)) +
                    Int32.Parse(strline.Substring(169, 15)); //에러금액

                for (int i = 0; i < gvwInfo.RowCount; i++)
                {
                    string strTranYn = gvwInfo.GetValue(i, "tran_yn").ToString();
                    Int32 compTxnAmt = Int32.Parse(gvwInfo.GetValue(i, "pay_net_amt").ToString());

                    compReqestCnt++;
                    compReqestAmt += compTxnAmt;

                    if (strTranYn == "Y")
                    {
                        compCompleteCnt++;
                        compCompleteAmt += compTxnAmt;
                    }
                    else
                    {
                        compErrorCnt++;
                        compErrorAmt += compTxnAmt;
                    }
                }

                bReaderEnabled = false;
            }


        } // while


        srFile.Dispose();
        srFile.Close();

        if (iReqestCnt == 0)
        {
            gfn_comAlert("E0000", "해당일의 급여이체결과가 없습니다.");
            return;
        }
        else
        {
            if (compReqestCnt == iReqestCnt && compReqestAmt == iReqestAmt && compCompleteCnt == iCompleteCnt && compCompleteAmt == iCompleteAmt && compErrorCnt == iErrorCnt && compErrorAmt == iErrorAmt)
            {
                gfn_comAlert("E0000", "이체결과가 정상적으로 수신되었습니다.");

                if (fnSET_P_FBS2240_S("U"))
                    fn_search();
            }
            else
            {
                gfn_comAlert("E0000", "이체결과에 이상이 발견되었습니다. [성공 " + iCompleteCnt + "건/실패 " + iErrorCnt + "건 | 성공 " + iCompleteAmt + "원/실패 " + iErrorAmt + "원]");
            }
        }
    }*/

    const fn_trfCancel = async function () {
        if (fnSET_P_FBS2240_S("TRF_CANCEL"))
            fn_search();
    }

    const fn_send = async function () {
        $("#btnSend").attr('disabled', 'true');

        if (gvwInfo.getRow() < 0)
            return;

        if(!await fnQRY_P_FBSPAYROLLBATCH_S("BATCH"))
            return;

        let bSuccess = true;

        if (dtFirmbanking == null || dtFirmbanking.length < 1) {
            gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
            return;
        }

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/uploadFbs2240.do", {
            params				: gfnma_objectToString(dtFirmbanking)
        });

        const uploadData = await postJsonPromise;

        try {
            if (_.isEqual("S", uploadData.resultStatus)) {
                //전송상태 업데이트
                let PAY_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
                let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
                let PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"));

                // 비즈니스 로직 정보
                var paramObj = {
                    V_P_DEBUG_MODE_YN	: '',
                    V_P_LANG_ID		: '',
                    V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_PAY_YYYYMM : PAY_YYYYMM,
                    V_P_PAY_TYPE : PAY_TYPE,
                    V_P_PAY_DATE : PAY_DATE,
                    V_P_EMP_CODE : strEmpCodeList,
                    V_P_FORM_ID		: p_formId,
                    V_P_MENU_ID		: p_menuId,
                    V_P_PROC_ID		: '',
                    V_P_USERID			: '',
                    V_P_PC				: '',
                };

                const postJsonPromise = gfn_postJSON("/fi/ftr/trn/updateFbs2240List.do", {
                    getType				: 'json',
                    workType			: 'U',
                    cv_count			: '0',
                    params				: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
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
            } else {
                alert(uploadData.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        $("#btnSend").attr('disabled', 'true');
    }

    const fn_download = async function () {
        if (gvwInfo.getRow() < 0)
            return;

        if(!await fnQRY_P_FBSPAYROLLBATCH_S("FILE")) return;

        let bSuccess = true;

        if (dtFirmbanking == null || dtFirmbanking.length < 1) {
            gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
            return;
        }

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/downloadFbs2240.do", {
            params				: gfnma_objectToString(dtFirmbanking)
        });

        const uploadData = await postJsonPromise;

        try {
            if (_.isEqual("S", uploadData.resultStatus)) {
                gfn_comAlert("E0000", "파일이 생성되었습니다.");
            } else {
                gfn_comAlert("E0000", "파일생성이 실패했습니다.");
                //alert(uploadData.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_name = async function () {
        if (gvwInfo.getRow() < 0)
            return;

        let gvwDetailCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);
        let intmax_seq = gvwDetailCheckedList.length;
        let strpayer_bank_code = "";
        let strpayer_bank_account = "";
        let strsocial_num = "";
        let strpayer_bank_account_owner = "";
        let strfbs_no = "";
        let intprogram_seq = 1;

        if (intmax_seq == 0) {
            gfn_comAlert("E0000", "수취인확인 데이터가 없습니다.");
            return;
        }

        SBUxMethod.openProgress(gv_loadingOptions);

        for(var i = 0; i < gvwDetailCheckedList.length; i++) {
            if (intprogram_seq % 1000 == 1) {
                strpayer_bank_code = gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("BANK_CODE")).trim();
                strpayer_bank_account = gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("BANK_ACCOUNT_REAL")).trim();
                strpayer_bank_account_owner = gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("BANK_DEPOSITOR")).trim();
                strfbs_no = "FBSPAYROLLTXN." + gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("TXN_ID")).trim();
            } else {
                strpayer_bank_code = strpayer_bank_code + "|" + gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("BANK_CODE")).trim();
                strpayer_bank_account = strpayer_bank_account + "|" + gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("BANK_ACCOUNT_REAL")).trim();
                strpayer_bank_account_owner = strpayer_bank_account_owner + "|" + gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("BANK_DEPOSITOR")).trim();
                strfbs_no = strfbs_no + "|" + "FBSPAYROLLTXN." + gvwInfo.getCellData(gvwDetailCheckedList[i], gvwInfo.getColRef("TXN_ID")).trim();
            }


            if (intprogram_seq % 1000 == 0 || intprogram_seq + 1 > intmax_seq) {
                var FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet("#SRCH_FBS_SERVICE"));
                var result = await gfnma_fbsName("", FBS_SERVICE, "NAME", strpayer_bank_code, strpayer_bank_account, strsocial_num, strpayer_bank_account_owner, "KRW", strfbs_no);

                if (result[1] != "OK") break;

                strpayer_bank_code = "";
                strpayer_bank_account = "";
                strpayer_bank_account_owner = "";
                strfbs_no = "";
            }

            intprogram_seq = intprogram_seq + 1;
        }

        fn_search();
        SBUxMethod.closeProgress(gv_loadingOptions);

    }

    const fn_create = async function () {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
              return false;
          }

        // 비즈니스 로직 정보
        let PAY_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));
        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));
        let PAY_DATE = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE"));
        let DEPOSIT_CODE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_CODE"));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_YYYYMM : PAY_YYYYMM,
            V_P_PAY_TYPE : PAY_TYPE,
            V_P_PAY_DATE : PAY_DATE,
            V_P_DEPOSIT_CODE : DEPOSIT_CODE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/createFbs2240List.do", {
            getType				: 'json',
            workType			: 'CREATE',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>