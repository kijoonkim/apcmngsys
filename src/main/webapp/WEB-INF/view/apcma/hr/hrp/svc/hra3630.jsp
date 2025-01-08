<%
    /**
     * @Class Name 		: hra3620.jsp
     * @Description 	: 용역소득 확정 및 전송 화면
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
    <title>title : 용역소득 확정 및 전송</title>
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
                <sbux-button id="btnFile" name="btnFile" uitype="normal" text="파일저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFile"></sbux-button>
                <sbux-button id="btnSendEmail" name="btnSendEmail" uitype="normal" text="Email 발송" class="btn btn-sm btn-outline-danger" onclick="fn_sendEmail"></sbux-button>
                <sbux-button id="btnSendSMS" name="btnSendSMS" uitype="normal" text="SMS 발송" class="btn btn-sm btn-outline-danger" onclick="fn_sendSMS"></sbux-button>
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
                    <th scope="row" class="th_bg_search">양식일자</th>
                    <td colspan="3" class="td_input">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_REPORT_DATE"
                                name="SRCH_REPORT_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                        />
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
                                    <sbux-textarea id="SMS_SESSAGE" name="SMS_SESSAGE"  uitype="normal" rows="16" wrap-style="width:100%">
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
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center',
                typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}
            },
            {caption: ["귀속연월"],       ref: 'JOB_YYYYMM', 		type:'datepicker',  	width:'67px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
                , disabled: true
            },
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["소득자명"],         ref: 'EARNER_NAME',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거주국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'output', style:'text-align:left' ,width: '90px'},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'output', style:'text-align:left' ,width: '200px'},
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["근무기준일"],       ref: 'WORK_DATE', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["총지급액"],         ref: 'TOT_PAY_AMT',    type:'output',  	width:'103px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'100px',  style:'text-align:left'},
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
        SBGridProperties.columns = [
            {caption: ["귀속연월"],       ref: 'JOB_YYYYMM', 		type:'datepicker',  	width:'67px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
                , disabled: true
            },
            {caption: ["근무시작일"],       ref: 'WORK_ST_DAT', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["소득자 성명"],         ref: 'EARNER_NAME',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근무종료일"],       ref: 'WORK_END_DAT', 		type:'datepicker',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근로일수"],         ref: 'WORK_DAY',    type:'output',  	width:'69px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', emptyvalue:'0'}
            },
            {caption: ["인원수"],         ref: 'WORK_CNT',    type:'output',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', emptyvalue:'0'}
            },
            {caption: ["작업구분"], 		ref: 'WORK_GBN',   	    type:'combo', style:'text-align:left' ,width: '103px',
                typeinfo: {
                    ref			: 'jsonWorkGbn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["작업장소"], 		ref: 'WORK_PLACE',   	    type:'combo', style:'text-align:left' ,width: '91px',
                typeinfo: {
                    ref			: 'jsonWorkPlace',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["작업명"], 		ref: 'WORK_NAME',   	    type:'combo', style:'text-align:left' ,width: '138px',
                typeinfo: {
                    ref			: 'jsonWorkName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["작업세부명"], 		ref: 'WORK_DTL_NAME',   	    type:'combo', style:'text-align:left' ,width: '118px',
                typeinfo: {
                    ref			: 'jsonWorkDtlName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["작업장소2"], 		ref: 'WORK_PLACE2',   	    type:'combo', style:'text-align:left' ,width: '87px',
                typeinfo: {
                    ref			: 'jsonWorkPlace2',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["일당"],         ref: 'DAILY_PAY_AMT',    type:'output',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총지급액"],         ref: 'TOT_PAY_AMT',    type:'output',  	width:'103px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로급여"],         ref: 'WORK_PAY_AMT',    type:'output',  	width:'104px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["비과세소득"],         ref: 'NON_TXABLE_AMT',    type:'output',  	width:'110px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["소득공제"],         ref: 'INC_AMT',    type:'output',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로소득"],         ref: 'EARNED_INC_AMT',    type:'output',  	width:'89px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["소득세"],         ref: 'INC_TX_AMT',    type:'output',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["주민세"],         ref: 'LOCAL_TX_AMT',    type:'output',  	width:'101px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["건강보험"],         ref: 'HEALTH_INSURE_AMT',    type:'output',  	width:'112px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["장기요양보험"],         ref: 'LONG_HEALTH_INSURE_AMT',    type:'output',  	width:'105px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["국민연금"],         ref: 'NATIONAL_PENS_AMT',    type:'output',  	width:'100px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["고용보험"],         ref: 'EMPLOY_INSURE_AMT',    type:'output',  	width:'92px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["기타공제"],         ref: 'ETC_DED_AMT',    type:'output',  	width:'99px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총공제액"],         ref: 'TOT_DEDUCT_AMT',    type:'output',  	width:'102px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["차인지급액"],         ref: 'ALLOWANCE_AMT',    type:'output',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["분개장번호"],         ref: 'REMARK',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거주국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'output', style:'text-align:left' ,width: '90px'},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'output', style:'text-align:left' ,width: '200px'},
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
        gvwDetail.bind('click', 'fn_viewForDetail');
        gvwDetail.bind('keyup', 'fn_keyupForDetail');
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
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonServiceFeeList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        TXN_ID : item.TRSC_ID,
                        JOB_YYYYMM : item.BLN_YM,
                        SOCNO : item.RGDT_NO,
                        WORK_ST_DAT : item.WRKDY_BGNG_YMD,
                        EARNER_CODE : item.EARNR_CD,
                        EARNER_NAME : item.EARNR_NM,
                        SITE_CODE : item.SITE_CD,
                        PAY_DATE : item.PAY_YMD,
                        WORK_END_DAT : item.WORK_END_YMD,
                        WORK_DAY : item.WORK_DCNT,
                        WORK_CNT : item.WORK_NOPE,
                        WORK_GBN : item.JOB_SE,
                        WORK_NAME : item.JOB_NM,
                        WORK_PLACE : item.JOB_PLC,
                        WORK_DTL_NAME : item.JOB_DTL_NM,
                        WORK_PLACE2 : item.JOB_PLC2,
                        BANK_CODE : item.BANK_CD,
                        BANK_NAME : item.BANK_NM,
                        BANK_ACC : item.BACNT_NO,
                        DAILY_PAY_AMT : item.DAY_PAY_AMT,
                        TOT_PAY_AMT : item.PAY_AMT_SUM,
                        WORK_PAY_AMT : item.WORK_PAY_AMT,
                        NON_TXABLE_AMT : item.TXFR_INCM_AMT,
                        INC_AMT : item.EARN_DDC_AMT,
                        EARNED_INC_AMT : item.ERICM_AMT,
                        INC_TX_AMT : item.INCTX_AMT,
                        LOCAL_TX_AMT : item.RSDTX_AMT,
                        HEALTH_INSURE_AMT : item.HLTH_INSRNC_AMT,
                        LONG_HEALTH_INSURE_AMT : item.LTRM_RCPR_INSRNC_AMT,
                        NATIONAL_PENS_AMT : item.NPN_AMT,
                        EMPLOY_INSURE_AMT : item.EPIS_AMT,
                        ETC_DED_AMT : item.ETC_DDC_AMT,
                        TOT_DEDUCT_AMT : item.DDC_AMT_SUM,
                        ALLOWANCE_AMT : item.SBTR_PAY_AMT,
                        MEMO : item.MEMO,
                        REMARK : item.RMRK,
                        FOREI_TYPE : item.FRGNR_YN,
                        NATION_CODE : item.HBTN_NTN_CD,
                        TEL : item.TELNO,
                        MOBILE_PHONE : item.MOBL_NO,
                        EMAIL : item.EML,
                        ADDRESS : item.ADDR,
                        WORK_REGION : item.WORK_RGN_CD,
                    }
                    jsonServiceFeeList.push(msg);
                });
                gvwDetail.rebuild();
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

    const fn_keyupForDetail = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_viewForDetail();
        }
    }

    const fn_viewForDetail = async function () {
        var nRow = gvwDetail.getRow();
        if(nRow < 1) return;
        var rowData = gvwDetail.getRowData(nRow);

        if(gfn_nvl(rowData) == "") return;

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE_FR : '',
            V_P_PAY_DATE_TO : '',
            V_P_SITE_CODE : '',
            V_P_EARNER_NAME : '',
            V_P_PAY_DATE : '',
            V_P_EARNER_CODE : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3630List.do", {
            getType				: 'json',
            workType			: 'EMAIL',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_1.length > 0) {
                    strSmtpHost = data.cv_1[0]["SMTP_HOST"];
                    IntSmtpPort = parseInt(data.cv_1[0]["SMTP_PORT"]);
                    strUserName = data.cv_1[0]["USERNAME"];
                    strPassword = data.cv_1[0]["PASSWORD"];
                    strEmail = data.cv_1[0]["MAILID"];
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
        let PAY_DATE = gfn_nvl(SBUxMethod.get("PAY_DATE"));
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
            V_P_USERID			: '',
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
        let PAY_DATE = gfn_nvl(SBUxMethod.get("PAY_DATE"));
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
            V_P_USERID			: '',
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
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3630List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonServiceFeePayList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_DATE : item.PAY_YMD,
                        WORK_DATE : item.WORK_DATE,
                        EARNER_CODE : item.EARNR_CD,
                        EARNER_NAME : item.EARNR_NM,
                        SITE_CODE : item.SITE_CD,
                        TOT_PAY_AMT : item.PAY_AMT_SUM,
                        FOREI_TYPE : item.FRGNR_YN,
                        NATION_CODE : item.HBTN_NTN_CD,
                        TEL : item.TELNO,
                        MOBILE_PHONE : item.MOBL_NO,
                        EMAIL : item.EML,
                        ADDRESS : item.ADDR,
                        WORK_REGION : item.WORK_RGN_CD,
                    }
                    jsonServiceFeePayList.push(msg);
                });
                gvwInfo.rebuild();

                if(jsonServiceFeePayList.length > 0) {
                    gvwInfo.clickRow(1);
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

    const fn_create = async function () {}

    const fn_saveFile = async function(){
        var nRow = gvwInfoGrid.getRow();
        var conn = '';
        var SENDTYPE = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        if (nRow < 1) {
            return;
        }

        let checkDatas = gvwInfoGrid.getCheckedRowData( gvwInfoGrid.getColRef('CHK_YN') );

        if (_.isEmpty(checkDatas)){
            gfn_comAlert("Q0000","파일 저장할 항목을 체크박스 선택하세요.");
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        for (let i = 0; i < checkDatas.length; i++){

            let datas = [];
            datas.push(checkDatas[i]);

            if (SENDTYPE == "ALL") {
                conn = await fn_GetReportData('REPORT5', datas);
                conn = await gfnma_convertDataForReport(conn);
                let psw = conn[5].data.root[0].BIRTH_DATE;

                await gfn_getReportPdf("급여명세서.pdf", "ma/RPT_HRP2436_Q_ALL.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                    function(){
                        gfn_comConfirm("Q0001", "다운로드");
                    }
                );
            } else if(SENDTYPE == "PAY") {
                conn = await fn_GetReportData('REPORT3', datas);
                conn = await gfnma_convertDataForReport(conn);
                let psw = conn[5].data.root[0].BIRTH_DATE;

                await gfn_getReportPdf("급여명세서.pdf", "ma/RPT_HRP2436_Q_PAY.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                    function(){
                        gfn_comConfirm("Q0001", "다운로드");
                    }
                );
            } else if(SENDTYPE == "WORK") {
                conn = await fn_GetReportData('REPORT4', datas);
                conn = await gfnma_convertDataForReport(conn);
                let psw = conn[5].data.root[0].BIRTH_DATE;

                await gfn_getReportPdf("근태현황.pdf", "ma/RPT_HRP2436_Q_WORK.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                    function(){
                        gfn_comConfirm("Q0001", "다운로드");
                    }
                );
            }
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
            V_P_USERID			: '',
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
        let PAY_DATE = gfn_nvl(SBUxMethod.get("PAY_DATE"));
        let EARNER_CODE = gfn_nvl(SBUxMethod.get("EARNER_CODE"));
        let TEL_NO = gfn_nvl(SBUxMethod.get("TEL_NO"));
        let SMS_SEND_YN = gfn_nvl(SBUxMethod.get("SMS_SEND_YN"));
        let SMS_SEND_MSG = gfn_nvl(SBUxMethod.get("SMS_SEND_MSG"));
        let SMS_KEY = gfn_nvl(SBUxMethod.get("SMS_KEY"));
        let SMS_DATA_SET = gfn_nvl(SBUxMethod.get("SMS_DATA_SET"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_DATE : PAY_DATE,
            V_P_EARNER_CODE : EARNER_CODE,
            V_P_TEL_NO : TEL_NO,
            V_P_SMS_SEND_YN : SMS_SEND_YN,
            V_P_SMS_SEND_MSG : SMS_SEND_MSG,
            V_P_SMS_KEY : SMS_KEY,
            V_P_SMS_DATA_SET : SMS_DATA_SET,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3630ForSendSms.do", {
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>