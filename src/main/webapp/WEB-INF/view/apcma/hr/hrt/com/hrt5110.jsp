<%
    /**
     * @Class Name 		: hrt5110.jsp
     * @Description 	: 연차생성 화면
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
    <title>title : 연차생성</title>
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
                <sbux-button id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_unconfirm"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="생성취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="연차생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_create"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="srchArea" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">사업장</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <%--<sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">재직구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">직종</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <%--<sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonSrchJobGroup" unselected-text="선택" class="form-control input-sm inpt_data_reqed" onchange="fn_srchJobGroup(SRCH_JOB_GROUP)" required></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_JOB_GROUP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_JOB_GROUP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">연차유형</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <%--<sbux-select id="SRCH_PAID_VACATION_TYPE" uitype="single" jsondata-ref="jsonPaidVacationType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" onchange="fn_srchPaidVacationType(SRCH_PAID_VACATION_TYPE)"  required></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_PAID_VACATION_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_PAID_VACATION_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">기준년도</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYY"
                                name="SRCH_YYYY"
                                date-format="yyyy"
                                datepicker-mode="year"
                                class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                onchange="fn_srchYyyy(SRCH_YYYY)"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td colspan="2"></td>
                    <th scope="row" class="th_bg">연차계산기준일</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_BASE_DATE"
                                name="SRCH_BASE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">특별휴가기준기간</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SPECIAL_PERIOD" uitype="single" jsondata-ref="jsonSpecialPeriod" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">부서</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findDeptCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">차년도존재여부</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EXIST_NEXT_YYYY" uitype="single" jsondata-ref="jsonYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">비고</th>
                    <td colspan="7" class="td_input" style="border-right:hidden;">
                        <sbux-textarea id="SRCH_MEMO" rows="2" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>연차 생성 이력</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwStatus" style="height:616px;"></div>
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
    //-----------------------------------------------------------

    var jsonSiteCode = []; // 사업장
    var jsonEmpState = []; // 재직상태
    var jsonSrchJobGroup = []; // 직종
    var jsonPaidVacationType = []; // 연차유형
    var jsonSpecialPeriod = []; // 특별휴가기간
    var jsonYn = []; // 차년도존재여부

    //grid 초기화
    var gvwStatus; 			// 그리드를 담기위한 객체 선언

    var jsonStatusList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            //gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 재직상태
            gfnma_setComSelect(['SRCH_EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            //gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonSrchJobGroup, 'L_HRI047_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_JOB_GROUP']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI047_02'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
                ,callback       : function(args) {
                    if (args == "") {
                        return;
                    } else if (args == "2") {
                        gfnma_multiSelectSet('#SRCH_PAID_VACATION_TYPE', 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', "4010");
                        SBUxMethod.set("SRCH_SPECIAL_PERIOD", "");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                    } else if (args == "3") {
                        SBUxMethod.attr("SRCH_PAID_VACATION_TYPE", "required", "true");
                    }
                }
            }),
            // 연차유형
            gfnma_setComSelect(['gvwStatus'], jsonPaidVacationType, 'L_HRT004_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_PAID_VACATION_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRT004_02'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'TIME_ITEM_CODE'
                ,colLabel		: 'TIME_ITEM_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'TIME_ITEM_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'TIME_ITEM_NAME',    		width:'100px',  	style:'text-align:left'},
                    {caption: "비고", 		ref: 'MEMO',    		width:'100px',  	style:'text-align:left'}
                ]
                ,callback       : function(args) {
                    if (args == "") {
                        return;
                    } else if (args == "4050") {
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "true");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "disabled", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "false");
                        SBUxMethod.set("SRCH_BASE_DATE", "");
                    } else if (args == "4010") {
                        SBUxMethod.set("SRCH_SPECIAL_PERIOD", "");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "disabled", "true");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                    } else if (args == "4040") {
                        SBUxMethod.set("SRCH_SPECIAL_PERIOD", "");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "disabled", "true");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                    } else if (args == "4080") {
                        SBUxMethod.set("SRCH_SPECIAL_PERIOD", "");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "disabled", "true");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                    }
                }
            }),
            // 특별휴가기간
            gfnma_setComSelect(['SRCH_SPECIAL_PERIOD', 'gvwStatus'], jsonSpecialPeriod, 'L_HRT026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차년도존재여부
            gfnma_setComSelect(['SRCH_EXIST_NEXT_YYYY'], jsonYn, 'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    var fn_findDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_CODE_";
        var replaceText2 	= "_EMP_NAME_";
        var replaceText3 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
            ,searchInputValues		: ["", 			searchCode, searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });
    }

    const fn_srchYyyy = async function(args) {
        SBUxMethod.set("SRCH_BASE_DATE", gfn_dateToYmd(new Date(args,0,1)));
    }

    function fn_createGvwShiftGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwStatus';
        SBGridProperties.id 				= 'gvwStatus';
        SBGridProperties.jsonref 			= 'jsonStatusList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["연차유형"], 		ref: 'PAID_ANNUAL_TYPE',   	    type:'combo', style:'text-align:left' ,width: '129px',
                typeinfo: {
                    ref			: 'jsonPaidVacationType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["년도"],         ref: 'YYYY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["대상기간"], 		ref: 'SPECIAL_PERIOD',   	    type:'combo', style:'text-align:left' ,width: '125px',
                typeinfo: {
                    ref			: 'jsonSpecialPeriod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["차수"],         ref: 'SEQ',    type:'output',  	width:'40px',  style:'text-align:left'},
            {caption: ["처리건수"],         ref: 'RECORD_COUNT',    type:'output',  	width:'95px',  style:'text-align:left'},
            {caption: ["처리구분"],         ref: 'LOG_TYPE',    type:'output',  	width:'106px',  style:'text-align:left'},
            {caption: ["생성자"],         ref: 'INSERT_USERID',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["생성일시"],         ref: 'INSERT_TIME',    type:'output',  	width:'130px',  style:'text-align:left'},
            {caption: ["생성PC"],         ref: 'INSERT_PC',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["집계조건"],         ref: 'TOT_COND',    type:'output',  	width:'450px',  style:'text-align:left'},
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'200px',  style:'text-align:left'}
        ];

        gvwStatus = _SBGrid.create(SBGridProperties);
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_YYYY", gfn_dateToYear(new Date()));
        SBUxMethod.set("SRCH_BASE_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(),0,1)));

        await fn_search();
    }

    const fn_search = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"}) || !validateRequired("panHeader")) {
            return false;
        }

        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let JOB_GROUP	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let PAID_VACATION_TYPE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let YYYY	    = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfn_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            V_P_PAID_ANNUAL_TYPE : PAID_VACATION_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_BASE_DATE : BASE_DATE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/com/selectHrt5110List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const postJsonPromiseForHistory = gfn_postJSON("/hr/hrt/com/selectHrt5110List.do", {
            getType				: 'json',
            workType			: 'HISTORY',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                let returnData = listData.cv_1[0];
                SBUxMethod.set("SRCH_BASE_DATE" , gfn_nvl(returnData.BASE_DATE));
                SBUxMethod.set("SRCH_YYYY" , gfn_nvl(returnData.YYYY));
                SBUxMethod.set("SRCH_EXIST_NEXT_YYYY" , gfn_nvl(returnData.EXIST_NEXT_YYYY));
                gfnma_multiSelectSet('#SRCH_SITE_CODE', 'SITE_CODE', 'SITE_NAME', gfn_nvl(returnData.SITE_CODE));
                gfnma_multiSelectSet('#SRCH_PAID_VACATION_TYPE', 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', gfn_nvl(returnData.PAID_ANNUAL_TYPE));
                SBUxMethod.set("SRCH_SPECIAL_PERIOD" , gfn_nvl(returnData.SPECIAL_PERIOD));
                gfnma_multiSelectSet('#SRCH_JOB_GROUP', 'SUB_CODE', 'CODE_NAME', gfn_nvl(returnData.JOB_GROUP));
            } else {
                alert(listData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        const historyData = await postJsonPromiseForHistory;

        try {
            if (_.isEqual("S", historyData.resultStatus)) {

                jsonStatusList.length = 0;
                historyData.cv_2.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        LOG_TYPE : item.LOG_TYPE,
                        YYYY : item.YYYY,
                        COMP_CODE : item.COMP_CODE,
                        SITE_CODE : item.SITE_CODE,
                        JOB_GROUP : item.JOB_GROUP,
                        PAID_ANNUAL_TYPE : item.PAID_ANNUAL_TYPE,
                        SPECIAL_PERIOD : item.SPECIAL_PERIOD,
                        RECORD_COUNT : item.RECORD_COUNT,
                        INSERT_USERID : item.INSERT_USERID,
                        INSERT_TIME : item.INSERT_TIME,
                        INSERT_PC : item.INSERT_PC,
                        TOT_COND : item.TOT_COND,
                        MEMO : item.MEMO,
                    }
                    jsonStatusList.push(msg);
                });

                gvwStatus.rebuild();
                document.querySelector('#listCount').innerText = jsonStatusList.length;
            } else {
                alert(historyData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_save = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"}) || !validateRequired("panHeader")) {
            return false;
        }

        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let JOB_GROUP	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let PAID_VACATION_TYPE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let YYYY	    = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfn_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("SRCH_MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            IV_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_JOB_GROUP_NAME : JOB_GROUP_NAME,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_MEMO : MEMO,
            V_P_PAID_ANNUAL_TYPE : PAID_VACATION_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5110.do", {
            getType				: 'json',
            workType			: 'CREATE',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("연차가 생성되었습니다.");
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
        fn_createGvwShiftGrid();
        await fn_onload();
    });

    const fn_unconfirm = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"}) || !validateRequired("panHeader")) {
            return false;
        }

        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let JOB_GROUP	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let PAID_VACATION_TYPE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let YYYY	    = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfn_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("SRCH_MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            IV_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_JOB_GROUP_NAME : JOB_GROUP_NAME,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_MEMO : MEMO,
            V_P_PAID_ANNUAL_TYPE : PAID_VACATION_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5110.do", {
            getType				: 'json',
            workType			: 'UNCONFIRM',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("확정취소처리되었습니다.");
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

    const fn_confirm = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"}) || !validateRequired("panHeader")) {
            return false;
        }

        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let JOB_GROUP	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let PAID_VACATION_TYPE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let YYYY	    = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfn_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("SRCH_MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            IV_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_JOB_GROUP_NAME : JOB_GROUP_NAME,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_MEMO : MEMO,
            V_P_PAID_ANNUAL_TYPE : PAID_VACATION_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5110.do", {
            getType				: 'json',
            workType			: 'CONFIRM',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("확정처리되었습니다.");
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

    const fn_cancel = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"}) || !validateRequired("panHeader")) {
            return false;
        }

        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let JOB_GROUP	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let PAID_VACATION_TYPE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let YYYY	    = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfn_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("SRCH_MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            IV_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_JOB_GROUP_NAME : JOB_GROUP_NAME,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_MEMO : MEMO,
            V_P_PAID_ANNUAL_TYPE : PAID_VACATION_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5110.do", {
            getType				: 'json',
            workType			: 'CANCEL',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("연차가 생성취소되었습니다.");
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

    const fn_create = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"}) || !validateRequired("panHeader")) {
            return false;
        }

        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let JOB_GROUP	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let PAID_VACATION_TYPE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let YYYY	    = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfn_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("SRCH_MEMO"));

        if (PAID_VACATION_TYPE == "4050" && SPECIAL_PERIOD == "") {
            alert("특별연차대상기간 선택후 실행하십시요");
            return;
        }

        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            IV_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_JOB_GROUP_NAME : JOB_GROUP_NAME,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_MEMO : MEMO,
            V_P_PAID_ANNUAL_TYPE : PAID_VACATION_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5110.do", {
            getType				: 'json',
            workType			: 'CREATE',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("연차가 생성되었습니다.");
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