<%
    /**
     * @Class Name 		: hra3620.jsp
     * @Description 	: 용역소득 지급 및 전송 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.11.05
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.11.05   	이경한		최초 생성
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
    <title>title : 용역소득 지급 및 전송</title>
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
                <sbux-button id="btnFile" name="btnFile" uitype="normal" text="파일저장" class="btn btn-sm btn-outline-danger" style="float: right; margin-right: 3px;" onclick="fn_saveFile"></sbux-button>
                <sbux-button id="btnSendEmail" name="btnSendEmail" uitype="normal" text="Email 발송" class="btn btn-sm btn-outline-danger" style="float: right; margin-right: 3px;" onclick="fn_sendEmail"></sbux-button>
                <sbux-button id="btnSendSMS" name="btnSendSMS" uitype="normal" text="SMS 발송" class="btn btn-sm btn-outline-danger" style="float: right; margin-right: 3px;" onclick="fn_sendSMS"></sbux-button>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right; margin-right: 3px;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right; margin-right: 3px;" onclick="fn_confirm"></sbux-button>
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
                    <th scope="row" class="th_bg_search">지급일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_PAY_DATE_FR"
                                name="SRCH_PAY_DATE_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
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
                                id="SRCH_PAY_DATE_TO"
                                name="SRCH_PAY_DATE_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">소득자명</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input id="SRCH_EARNER_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>용역비 지급액</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                        <div id="sb-area-gvwInfo" style="height:160px;"></div>
                    </div>
                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>용역비내역</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwDetail" style="height:160px;"></div>
                    </div>

                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>메일 정보</span>
                                <span style="font-size:12px">※ 저장된 내용이 발송되므로 편집 후 반드시 저장하세요.</span>
                            </li>
                        </ul>
                        <div style="margin-left: auto;">
                            <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
                            <sbux-button id="btnDel" name="btnDel" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                        </div>
                    </div>
                    <div>
                        <table class="table table-bordered tbl_fixed">
                            <caption>메일 정보</caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 10%">
                                <col style="width: 10%">
                                <col style="width: 10%">
                                <col style="width: 10%">
                                <col style="width: 10%">
                                <col style="width: 20%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">메일제목</th>
                                <td colspan="2" class="td_input" >
                                    <sbux-textarea id="EMAIL_SUBJECT" name="EMAIL_SUBJECT" rows="1"  uitype="normal" wrap-style="width:100%" class="">
                                    </sbux-textarea>
                                </td>
                                <th scope="row" rowspan="8" class="th_bg">SMS문자메시지</th>
                                <td colspan="2" rowspan="8" class="td_input" >
                                    <sbux-textarea id="SMS_MESSAGE" name="SMS_MESSAGE"  uitype="normal" rows="16" wrap-style="width:100%">
                                    </sbux-textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">메일내용</th>
                                <td colspan="2" class="td_input" >
                                    <sbux-textarea id="EMAIL_BODY" name="EMAIL_BODY"  uitype="normal" rows="5" wrap-style="width:100%" class="">
                                    </sbux-textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">공지사항</th>
                                <td colspan="2" class="td_input" >
                                    <sbux-textarea id="NOTICE_MEMO" name="NOTICE_MEMO"  uitype="normal" rows="5" wrap-style="width:100%">
                                    </sbux-textarea>
                                </td>
                            </tr>
                            </tbody>
                        </table>
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
    var p_siteCode = "${loginVO.maSiteCode}";
    var p_userId = '${loginVO.id}';
    var p_linkRviewUrl = '${linkRviewUrl}';
    //-----------------------------------------------------------

    var strEmail = "";
    var strSmtpHost = "";
    var IntSmtpPort = 25;
    var strUserName = "";
    var strPassword = "";
    var strJobGroup = "";

    var jsonWorkGbn = []; // 작업구분
    var jsonWorkPlace = []; // 작업장소
    var jsonWorkName = []; // 작업명
    var jsonWorkDtlName = []; // 작업세부명
    var jsonWorkPlace2 = []; // 작업장소2
    var jsonForeignType = []; // 내외국인구분
    var jsonNationCode = []; // 거주지국
    var jsonWorkRegion = []; // 근무지역
    var jsonPayCycle = []; // 정산주기

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;
    var jsonServiceFeePayList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonServiceFeeList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CD'
                ,colLabel		: 'SITE_NM'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 작업구분
            gfnma_setComSelect(['gvwDetail'], jsonWorkGbn, 'L_HRA081', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwDetail'], jsonWorkPlace, 'L_HRA083', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업명
            gfnma_setComSelect(['gvwDetail'], jsonWorkName, 'L_HRA082', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업세부명
            gfnma_setComSelect(['gvwDetail'], jsonWorkDtlName, 'L_HRA084', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwDetail'], jsonWorkPlace2, 'L_HRA085', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 내외국민구분
            gfnma_setComSelect(['gvwInfo', 'gvwDetail'], jsonForeignType, 'L_HRA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 거주지국
            gfnma_setComSelect(['gvwInfo', 'gvwDetail'], jsonNationCode, 'L_COM015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'NTN_CD', 'NTN_NM', 'Y', ''),
            // 근무지역
            gfnma_setComSelect(['gvwInfo', 'gvwDetail'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 정산주기
            gfnma_setComSelect(['gvwInfo'], jsonPayCycle, 'L_HRA021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
        ]);
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonServiceFeePayList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting	= true;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [2, 7],
                sum : [8,9,10],
            },
            grandtotalrow : {
                titlecol: 0,
                titlevalue: '합계',
                style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol: 0
            },
        };
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center',
                typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}
            },
            {caption: ["지급확정여부"], 		ref: 'PAY_CONFIRM_YN',   	    type:'checkbox', style:'text-align:center' ,width: '80px'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["소득자명"],         ref: 'EARNER_NAME',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["근무시작일"],       ref: 'WORK_ST_DAT', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근무종료일"],       ref: 'WORK_END_DAT', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["총 금액"],         ref: 'TOT_AMOUNT',    type:'output',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 지급액"],         ref: 'TOT_PAY_AMT',    type:'output',  	width:'103px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 공제액"],         ref: 'TOT_DEDUCT_AMT',    type:'output',  	width:'102px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["은행코드"],         ref: 'BANK_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["은행명"],         ref: 'BANK_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["계좌번호"],         ref: 'BANK_ACC',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["정산주기"],         ref: 'PAY_CYCLE',    type:'combo',  	width:'75px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPayCycle',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["휴대폰번호"], 		ref: 'TEL',   	    type:'output', style:'text-align:left' ,width: '90px'},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('click', 'fn_view');
        gvwInfo.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonServiceFeeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting	= true;
        SBGridProperties.columns = [
            {caption: ["주민등록번호"],         ref: 'SOCNO',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["사업장코드"],         ref: 'SITE_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["은행코드"],         ref: 'BANK_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["계좌번호"],         ref: 'BANK_ACC',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'input', style:'text-align:left' ,width: '90px', hidden: true},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'input', style:'text-align:left' ,width: '200px', hidden: true},
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["거주국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["소득자 성명"],         ref: 'EARNER_NAME',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["귀속연월"],       ref: 'JOB_YYYYMM', 		type:'inputdate',  	width:'67px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["근무시작일"],       ref: 'WORK_ST_DAT', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근무종료일"],       ref: 'WORK_END_DAT', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근로일수"],         ref: 'WORK_DAY',    type:'output',  	width:'69px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', emptyvalue:'0'}
            },
            {caption: ["인원수"],         ref: 'WORK_CNT',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["일당"],         ref: 'DAILY_PAY_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["조정금액"],         ref: 'ADJUSTMENT_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["유류금액"],         ref: 'FUAL_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["기타비용"],         ref: 'ETC_COST',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 금액"],         ref: 'TOT_AMOUNT',    type:'output',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["작업구분"], 		ref: 'WORK_GBN',   	    type:'combo', style:'text-align:left' ,width: '103px',
                typeinfo: {
                    ref			: 'jsonWorkGbn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업장소"], 		ref: 'WORK_PLACE',   	    type:'combo', style:'text-align:left' ,width: '91px',
                typeinfo: {
                    ref			: 'jsonWorkPlace',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업명"], 		ref: 'WORK_NAME',   	    type:'combo', style:'text-align:left' ,width: '138px',
                typeinfo: {
                    ref			: 'jsonWorkName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업세부명"], 		ref: 'WORK_DTL_NAME',   	    type:'combo', style:'text-align:left' ,width: '118px',
                typeinfo: {
                    ref			: 'jsonWorkDtlName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업장소2"], 		ref: 'WORK_PLACE2',   	    type:'combo', style:'text-align:left' ,width: '87px',
                typeinfo: {
                    ref			: 'jsonWorkPlace2',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["비과세소득"],         ref: 'NON_TXABLE_AMT',    type:'input',  	width:'110px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로소득공제"],         ref: 'INC_AMT',    type:'input',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로소득금액"],         ref: 'EARNED_INC_AMT',    type:'output',  	width:'89px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["소득세"],         ref: 'INC_TX_AMT',    type:'input',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["주민세"],         ref: 'LOCAL_TX_AMT',    type:'input',  	width:'101px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["건강보험"],         ref: 'HEALTH_INSURE_AMT',    type:'input',  	width:'112px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["장기요양보험"],         ref: 'LONG_HEALTH_INSURE_AMT',    type:'input',  	width:'105px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["국민연금"],         ref: 'NATIONAL_PENS_AMT',    type:'input',  	width:'100px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["고용보험"],         ref: 'EMPLOY_INSURE_AMT',    type:'input',  	width:'92px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["기타공제"],         ref: 'ETC_DED_AMT',    type:'input',  	width:'99px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 공제액"],         ref: 'TOT_DEDUCT_AMT',    type:'output',  	width:'102px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 지급액"],         ref: 'TOT_PAY_AMT',    type:'output',  	width:'103px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["분개장번호"],         ref: 'REMARK',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["비고"],         ref: 'MEMO',    type:'input',  	width:'100px',  style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function () {
        var nRow = gvwInfo.getRow();
        if(nRow < 1) return;
        var rowData = gvwInfo.getRowData(nRow);

        if(gfn_nvl(rowData) == "") return;

        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        let PAY_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE_FR"));
        let PAY_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet("SRCH_SITE_CODE"));
        let EARNER_NAME = gfn_nvl(rowData.EARNER_NAME);
        let PAY_DATE = gfn_nvl(rowData.PAY_DATE);
        let EARNER_CODE = gfn_nvl(rowData.EARNER_CODE);

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE_FR : PAY_DATE_FR,
            V_P_PAY_DATE_TO : PAY_DATE_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_EARNER_NAME : EARNER_NAME,
            V_P_PAY_DATE : PAY_DATE,
            V_P_EARNER_CODE : EARNER_CODE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3630List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonServiceFeeList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        TXN_ID : gfn_nvl(item.TRSC_ID),
                        JOB_YYYYMM : gfn_nvl(item.BLN_YM),
                        SOCNO : gfn_nvl(item.RGDT_NO),
                        WORK_ST_DAT : gfn_nvl(item.WRKDY_BGNG_YMD),
                        EARNER_CODE : gfn_nvl(item.EARNR_CD),
                        EARNER_NAME : gfn_nvl(item.EARNR_NM),
                        SITE_CODE : gfn_nvl(item.SITE_CD),
                        PAY_DATE : gfn_nvl(item.PAY_YMD),
                        WORK_END_DAT : gfn_nvl(item.WORK_END_YMD),
                        WORK_DAY : gfn_nvl(item.WORK_DCNT),
                        WORK_CNT : gfn_nvl(item.WORK_NOPE),
                        WORK_GBN : gfn_nvl(item.JOB_SE),
                        WORK_NAME : gfn_nvl(item.JOB_NM),
                        WORK_PLACE : gfn_nvl(item.JOB_PLC),
                        WORK_DTL_NAME : gfn_nvl(item.JOB_DTL_NM),
                        WORK_PLACE2 : gfn_nvl(item.JOB_PLC2),
                        BANK_CODE : gfn_nvl(item.BANK_CD),
                        BANK_NAME : gfn_nvl(item.BANK_NM),
                        BANK_ACC : gfn_nvl(item.BACNT_NO),
                        DAILY_PAY_AMT : gfn_nvl(item.DAY_PAY_AMT, 0),
                        TOT_PAY_AMT : gfn_nvl(item.PAY_AMT_SUM, 0),
                        WORK_PAY_AMT : gfn_nvl(item.WORK_PAY_AMT, 0),
                        NON_TXABLE_AMT : gfn_nvl(item.TXFR_INCM_AMT, 0),
                        INC_AMT : gfn_nvl(item.EARN_DDC_AMT, 0),
                        EARNED_INC_AMT : gfn_nvl(item.ERICM_AMT, 0),
                        INC_TX_AMT : gfn_nvl(item.INCTX_AMT, 0),
                        LOCAL_TX_AMT : gfn_nvl(item.RSDTX_AMT, 0),
                        HEALTH_INSURE_AMT : gfn_nvl(item.HLTH_INSRNC_AMT, 0),
                        LONG_HEALTH_INSURE_AMT : gfn_nvl(item.LTRM_RCPR_INSRNC_AMT, 0),
                        NATIONAL_PENS_AMT : gfn_nvl(item.NPN_AMT, 0),
                        EMPLOY_INSURE_AMT : gfn_nvl(item.EPIS_AMT, 0),
                        ETC_DED_AMT : gfn_nvl(item.ETC_DDC_AMT, 0),
                        TOT_DEDUCT_AMT : gfn_nvl(item.DDC_AMT_SUM, 0),
                        MEMO : gfn_nvl(item.MEMO),
                        REMARK : gfn_nvl(item.RMRK),
                        FOREI_TYPE : gfn_nvl(item.FRGNR_YN),
                        NATION_CODE : gfn_nvl(item.HBTN_NTN_CD),
                        TEL : gfn_nvl(item.TELNO),
                        MOBILE_PHONE : gfn_nvl(item.MOBL_NO),
                        EMAIL : gfn_nvl(item.EML),
                        ADDRESS : gfn_nvl(item.ADDR),
                        WORK_REGION : gfn_nvl(item.WORK_RGN_CD),
                        ADJUSTMENT_AMT : gfn_nvl(item.AJMT_AMT, 0),
                        FUAL_AMT : gfn_nvl(item.OL_AMT, 0),
                        ETC_COST : gfn_nvl(item.ETC_CST, 0),
                        TOT_AMOUNT : gfn_nvl(item.TOT_AMT, 0)
                    }
                    jsonServiceFeeList.push(msg);
                });
                gvwDetail.rebuild();

                if(data.cv_2.length > 0 && data.cv_2[0] != null) {
                    SBUxMethod.set("EMAIL_SUBJECT", gfn_nvl(data.cv_2[0].EML_SBJT));
                    SBUxMethod.set("SMS_MESSAGE", gfn_nvl(data.cv_2[0].SMS_TTL));
                    SBUxMethod.set("EMAIL_BODY", gfn_nvl(data.cv_2[0].EML_MTXT));
                    SBUxMethod.set("NOTICE_MEMO", gfn_nvl(data.cv_2[0].NTC_CN));
                } else {
                    SBUxMethod.set("EMAIL_SUBJECT", "");
                    SBUxMethod.set("SMS_MESSAGE", "");
                    SBUxMethod.set("EMAIL_BODY", "");
                    SBUxMethod.set("NOTICE_MEMO", "");
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

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
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

    // 삭제
    function cfn_del() {
        fn_delete();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    const fn_onload = async function() {
        SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
        SBUxMethod.set("SRCH_PAY_DATE_FR", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_PAY_DATE_TO", gfn_dateToYmd(new Date()));
    }

    const fn_save = async function () {
        var nRow = gvwInfo.getRow();
        if(nRow < 1) return;
        var rowData = gvwInfo.getRowData(nRow);

        let PAY_DATE = gfn_nvl(rowData.PAY_DATE);
        let EMAIL_SUBJECT = gfn_nvl(SBUxMethod.get("EMAIL_SUBJECT"));
        let EMAIL_BODY = gfn_nvl(SBUxMethod.get("EMAIL_BODY"));
        let NOTICE_MEMO = gfn_nvl(SBUxMethod.get("NOTICE_MEMO"));
        let SMS_MESSAGE = gfn_nvl(SBUxMethod.get("SMS_MESSAGE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE : PAY_DATE,
            V_P_EMAIL_SUBJECT : EMAIL_SUBJECT,
            V_P_EMAIL_BODY : EMAIL_BODY,
            V_P_NOTICE_MEMO : NOTICE_MEMO,
            V_P_SMS_MESSAGE : SMS_MESSAGE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: p_userId,
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630.do", {
            getType				: 'json',
            workType			: 'N',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                await fn_search();
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

    const fn_delete = async function () {
        var nRow = gvwInfo.getRow();
        if(nRow < 1) return;
        var rowData = gvwInfo.getRowData(nRow);

        let PAY_DATE = gfn_nvl(rowData.PAY_DATE);
        let EMAIL_SUBJECT = gfn_nvl(SBUxMethod.get("EMAIL_SUBJECT"));
        let EMAIL_BODY = gfn_nvl(SBUxMethod.get("EMAIL_BODY"));
        let NOTICE_MEMO = gfn_nvl(SBUxMethod.get("NOTICE_MEMO"));
        let SMS_MESSAGE = gfn_nvl(SBUxMethod.get("SMS_MESSAGE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE : PAY_DATE,
            V_P_EMAIL_SUBJECT : EMAIL_SUBJECT,
            V_P_EMAIL_BODY : EMAIL_BODY,
            V_P_NOTICE_MEMO : NOTICE_MEMO,
            V_P_SMS_MESSAGE : SMS_MESSAGE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: p_userId,
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630.do", {
            getType				: 'json',
            workType			: 'D',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                await fn_search();
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

    const fn_search = async function () {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        let PAY_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE_FR"));
        let PAY_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet("SRCH_SITE_CODE"));
        let EARNER_NAME = gfn_nvl(SBUxMethod.get("SRCH_EARNER_NAME"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE_FR : PAY_DATE_FR,
            V_P_PAY_DATE_TO : PAY_DATE_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_EARNER_NAME : EARNER_NAME,
            V_P_PAY_DATE : '',
            V_P_EARNER_CODE : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: p_userId,
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3630List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonServiceFeePayList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_CONFIRM_YN : gfn_nvl(item.CFMTN_YN2, 'N'),
                        PAY_DATE : gfn_nvl(item.PAY_YMD),
                        WORK_ST_DAT : gfn_nvl(item.WRKDY_BGNG_YMD),
                        WORK_END_DAT : gfn_nvl(item.WORK_END_YMD),
                        EARNER_CODE : gfn_nvl(item.EARNR_CD),
                        EARNER_NAME : gfn_nvl(item.EARNR_NM),
                        SITE_CODE : gfn_nvl(item.SITE_CD),
                        TOT_PAY_AMT : gfn_nvl(item.PAY_AMT_SUM, 0),
                        TOT_DEDUCT_AMT : gfn_nvl(item.DDC_AMT_SUM, 0),
                        MOBILE_PHONE : gfn_nvl(item.MOBL_NO),
                        EMAIL : gfn_nvl(item.EML),
                        WORK_REGION : gfn_nvl(item.WORK_RGN_CD),
                        BANK_CODE : gfn_nvl(item.BANK_CD),
                        BANK_NAME : gfn_nvl(item.BANK_NM),
                        BANK_ACC : gfn_nvl(item.BACNT_NO),
                        PAY_CYCLE : gfn_nvl(item.PAY_CYCL),
                        TEL : gfn_nvl(item.MOBL_NO),
                        MEMO : gfn_nvl(item.MEMO),
                        TOT_AMOUNT : gfn_nvl(item.TOT_AMT, 0)
                    }
                    jsonServiceFeePayList.push(msg);
                });
                gvwInfo.rebuild();

                if(jsonServiceFeePayList.length > 0) {
                    gvwInfo.clickRow(1);
                } else {
                    jsonServiceFeeList.length = 0;
                    gvwDetail.rebuild();
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

    const fn_saveFile = async function(){
    	let conn = '';
        let checkDatas = gvwInfo.getCheckedRowData( gvwInfo.getColRef('CHK_YN') );
        if (_.isEmpty(checkDatas)){
            gfn_comAlert("Q0000","파일 저장할 항목을 체크박스 선택하세요.");
            return;
        }

        for (let i = 0; i < checkDatas.length; i++){

            let datas = [];
            datas.push(checkDatas[i]);

            conn = await fn_getReportData( checkDatas[i].data );
            conn = await gfnma_convertDataForReport(conn);

            await gfn_getReportPdf(
           		checkDatas[i].data.EARNER_NAME + " 용역비 임금명세서 " + gfnma_date5(checkDatas[i].data.PAY_DATE) + ".pdf",
           		"ma/RPT_HRA3630.crf",
           		conn,
           		{ userPassword : '', ownerPassword : ''},
                function(){
                    console.log('download');
                }
            );
        }
    }

	const fn_getReportData = async function(obj) {
        var paramObj = {
				V_P_DEBUG_MODE_YN		: ''
				,V_P_LANG_ID			: ''
				,V_P_COMP_CODE			: gv_ma_selectedCorpCd
				,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
                ,V_P_PAY_DATE_FR : ''
                ,V_P_PAY_DATE_TO : ''
                ,V_P_SITE_CODE : ''
                ,V_P_EARNER_NAME : ''
                ,V_P_PAY_DATE : obj.PAY_DATE
                ,V_P_EARNER_CODE : obj.EARNER_CODE
				,V_P_FORM_ID			: p_formId
				,V_P_MENU_ID			: p_menuId
				,V_P_PROC_ID			: ''
				,V_P_USERID				: p_userId
				,V_P_PC					: ''
	    };
	    const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3630Report.do", {
	        getType				: 'json',
	        workType			: 'REPORT',
	        userId				: p_userId,
	        cv_count			: '2',
	        params				: gfnma_objectToString(paramObj, true)
	    });
	    const data = await postJsonPromise;

	    try {
	        if (_.isEqual("S", data.resultStatus)) {
			    return data;
			} else {
			    alert(data.resultMessage);
			    return;
			}
	    } catch (e) {
	        if (!(e instanceof Error)) {
	            e = new Error(e);
	        }
	        console.error("failed", e.message);
	        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	    }
	}
	
    const fn_sendEmail = async function () {
        let PAY_DATE = gfn_nvl(SBUxMethod.get("PAY_DATE"));
        let EARNER_CODE = gfn_nvl(SBUxMethod.get("EARNER_CODE"));
        let MAIL_SEND_YN = gfn_nvl(SBUxMethod.get("MAIL_SEND_YN"));
        let MAIL_SEND_MSG = gfn_nvl(SBUxMethod.get("MAIL_SEND_MSG"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE : PAY_DATE,
            V_P_EARNER_CODE : EARNER_CODE,
            V_P_MAIL_SEND_YN : MAIL_SEND_YN,
            V_P_MAIL_SEND_MSG : MAIL_SEND_MSG,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: p_userId,
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630ForSendEmail.do", {
            getType				: 'json',
            workType			: 'N',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                await fn_search();
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

    const fn_sendSMS = async function () {
        let checkData 	  = gvwInfo.getCheckedRowData( gvwInfo.getColRef('CHK_YN') );
        if (_.isEmpty(checkData)) {
            gfn_comAlert("W0001", "SMS 발송할 데이터");
            return;
        }

        let paramObj = {};
        let listData = [];
        
        checkData.forEach((item, index) => {

            paramObj = {
                V_P_DEBUG_MODE_YN		: ''
                ,V_P_LANG_ID			: ''
                ,V_P_COMP_CODE			: gv_ma_selectedCorpCd
                ,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
                ,V_P_PAY_DATE_FR        : ''
                ,V_P_PAY_DATE_TO        : ''
                ,V_P_SITE_CODE          : ''
                ,V_P_EARNER_NAME        : ''
                ,V_P_PAY_DATE           : gfn_nvl(item.data.PAY_DATE)
                ,V_P_EARNER_CODE        : gfn_nvl(item.data.EARNER_CODE)
                ,V_P_FORM_ID			: p_formId
                ,V_P_MENU_ID			: p_menuId
                ,V_P_PROC_ID			: ''
                ,V_P_USERID				: p_userId
                ,V_P_PC					: ''
            };
            
            const param = {
                cv_count: '0',
                getType: 'json',
                workType: 'N',
                rownum: item.rownum,
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN      : ''
                    ,V_P_LANG_ID           : ''
                    ,V_P_COMP_CODE         : gv_ma_selectedCorpCd
                    ,V_P_CLIENT_CODE       : gv_ma_selectedClntCd

                    ,V_P_RPT_URL 	  			: p_linkRviewUrl						//리포트 링크
                    ,V_P_MOBL_NO 	  			: gfn_nvl(item.data.MOBILE_PHONE).replace(/-/g,'')		//휴대폰번호
                    ,V_P_LNKG_UNQ_ID   			: gfnma_generateUUID().replace(/-/g,'')	//UUID
                    ,V_P_TASK_ID				: "MA"									//업무아이디 AM, CO, MA 경영은 MA 고정
                    ,V_P_TASK_SE_CD    			: '2'									//업무구분코드 	1:급여, 2용역
                    ,V_P_RPT_DOC_FILE_PATH     	: "ma/RPT_HRA3630.crf" 					// 보고문서파일경로
                    ,V_P_PRGRM_NM		    	: 'SP_HRA3630_Q'						// 리포트 조회 프로시저 명		
                    ,V_P_PRGRM_URL		      	: '/hr/hrp/svc/selectHra3630Report.do'	//리포트 조회 URL
                    ,V_P_PRGRM_PRCS_TYPE 		: 'REPORT' 							// 프로시저 워크타입
                    ,V_P_PRCS_RSLT_NOCS 		: '2'									//프로시저 커서 카운트
                    ,V_P_PRMTR_DATA				: gfnma_objectToString(paramObj) 		// 리포트 조회 파라미터
                    ,V_P_LNKG_CERT_KEY	 		: gfn_nvl(item.data.EARNER_CODE)		// 조회 가능 비밀번호
                    ,V_P_LNKG_OPEN_YMD         	: gfn_addDate(gfnma_date4().replace(/-/g,'') , 30) //조회가능일자 (저장된 날 +30일로 임의로 설정함)
                    ,V_P_LNKG_EXPRY_YN         	: 'N' 									//연결만료여부
                    ,V_P_SYS_FRST_INPT_DT		: gfnma_date4().replace(/-/g,'')		//시스템최초입력일시
                    ,V_P_SYS_FRST_INPT_USER_ID	: p_userId								//시스템최초입력사용자ID
                    ,V_P_SYS_FRST_INPT_PRGRM_ID	: p_formId								//시스템최초입력프로그램ID

                    ,V_P_FORM_ID           : p_formId
                    ,V_P_MENU_ID           : p_menuId
                    ,V_P_PROC_ID           : ''
                    ,V_P_USERID            : p_userId
                    ,V_P_PC                : ''
                }, true)
            };
            listData.push(param);
        });

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630ForSendSms.do", {listData: listData});
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }else {
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
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

    const fn_confirm = async function () {
        let gvwInfoCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHK_YN"), true);
        let returnData = [];

        if(gvwInfoCheckedList.length == 0) {
            return;
        }

        gvwInfoCheckedList.forEach((item, index) => {
            let data = gvwInfo.getRowData(item);
            const param = {
                cv_count : '0',
                getType : 'json',
                workType : 'PAY_CONFIRM',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_EARNER_CODE : gfn_nvl(data.EARNER_CODE),
                    V_P_PAY_DATE : gfn_nvl(data.PAY_DATE),
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : p_userId,
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });

        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630ListForConfirm.do", {listData: returnData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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
            await fn_search();
        }
    }

    const fn_cancel = async function () {
        let gvwInfoCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHK_YN"), true);
        let returnData = [];

        if(gvwInfoCheckedList.length == 0) {
            return;
        }

        gvwInfoCheckedList.forEach((item, index) => {
            let data = gvwInfo.getRowData(item);
            const param = {
                cv_count : '0',
                getType : 'json',
                workType : 'PAY_CONFIRM_CANCLE',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_EARNER_CODE : gfn_nvl(data.EARNER_CODE),
                    V_P_PAY_DATE : gfn_nvl(data.PAY_DATE),
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : p_userId,
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });

        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630ListForConfirm.do", {listData: returnData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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
            await fn_search();
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>