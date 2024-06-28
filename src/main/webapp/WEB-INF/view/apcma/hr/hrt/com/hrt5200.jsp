<%
    /**
     * @Class Name 		: hrt5200.jsp
     * @Description 	: 연차발생조정 화면
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
    <title>title : 연차발생조정</title>
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
                <sbux-button id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_unconfirm"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
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
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_JOB_GROUP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_JOB_GROUP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">연차유형</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <%--<sbux-select id="SRCH_PAID_VACATION_TYPE" uitype="single" jsondata-ref="jsonPaidVacationType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" onchange="fn_srchPaidVacationType(SRCH_PAID_VACATION_TYPE)" required></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_PAID_VACATION_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_PAID_VACATION_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">세부항목</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SPECIAL_PERIOD" uitype="single" jsondata-ref="jsonSpecialPeriod" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
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
                                required
                        />
                    </td>
                    <td colspan="2"></td>
                    <th scope="row" class="th_bg">조회기준일</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_BASE_DATE"
                                name="SRCH_BASE_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">부서</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findDeptCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>연차 현황(연차기산일기준)</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')"></sbux-button>
                        <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')"></sbux-button>
                        <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')"></sbux-button>
                        <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" ></sbux-button>
                        <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-gvwInfo" style="height:450px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>연차사용내역</span>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwDetail" style="height:250px;"></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <table class="table table-bordered tbl_fixed">
                        <caption></caption>
                        <colgroup>
                            <col style="width: 50%">
                            <col style="width: 50%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">이월</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="CARRIED_DAY" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">총일수</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="TOT_DAY" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">사용일수</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="USE_DAY" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">보상일수</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="CHARGE_DAY" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">미사용 일수</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="BALANCE_DAY" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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
    //-----------------------------------------------------------

    var copyMode            = "clear";

    var jsonSiteCode = []; // 사업장
    var jsonEmpState = []; // 재직상태
    var jsonSrchJobGroup = []; // 직종
    var jsonPaidVacationType = []; // 연차유형
    var jsonSpecialPeriod = []; // 특별휴가기간
    var jsonTimeItemCode = []; // 근태항목
    var jsonPositionCode = []; // 직위
    var jsonJobRank = []; // 직급
    var jsonDutyCode = []; // 직책

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;

    var jsonInfoList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonDetailList = [];


    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_YYYY", gfn_dateToYear(new Date()));
        SBUxMethod.set("SRCH_BASE_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(),0,1)));
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['gvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
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
            gfnma_setComSelect(['gvwInfo'], jsonSrchJobGroup, 'L_HRI047_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                    } else if (args == "3") {
                        SBUxMethod.attr("SRCH_PAID_VACATION_TYPE", "required", "true");
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                    }
                }
            }),
            // 연차유형
            gfnma_setComSelect(['gvwInfo'], jsonPaidVacationType, 'L_HRT004_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
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
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                        gvwInfo.setColHidden(19, true, false);
                        gvwInfo.setColHidden(21, true, false);
                    } else if (args == "4040") {
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                        gvwInfo.setColHidden(19, true, false);
                        gvwInfo.setColHidden(21, true, false);
                    } else if (args == "4010") {
                        SBUxMethod.attr("SRCH_SPECIAL_PERIOD", "required", "false");
                        SBUxMethod.attr("SRCH_BASE_DATE", "required", "true");
                        gvwInfo.setColHidden(19, false, false);
                        gvwInfo.setColHidden(21, false, false);
                    }
                }
            }),
            // 특별휴가기간
            gfnma_setComSelect(['SRCH_SPECIAL_PERIOD', 'gvwInfo'], jsonSpecialPeriod, 'L_HRT026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태항목
            gfnma_setComSelect(['gvwDetail'], jsonTimeItemCode, 'L_HRT004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['gvwInfo'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwInfo'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    const fn_findDeptCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findEmpCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서",		"사원", 		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
            ,searchInputValues		: ["", 			searchText,		""]
            ,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
    }
    
    const fn_srchYyyy = async function(args) {
        SBUxMethod.set("SRCH_BASE_DATE", gfn_dateToYmd(new Date(args,0,1)));
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonInfoList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(copyMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if(copyMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'42px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["확정여부"],         ref: 'CONFIRM_YN',    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["확정일"],       ref: 'CONFIRM_DATE', 		type:'datepicker',  	width:'105px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["연차유형"], 		ref: 'PAID_ANNUAL_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPaidVacationType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["세부항목"], 		ref: 'SPECIAL_PERIOD',   	    type:'combo', style:'text-align:left' ,width: '134px',
                typeinfo: {
                    ref			: 'jsonSpecialPeriod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '83px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_FULL_NAME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["직책"], 		ref: 'DUTY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["직급"], 		ref: 'JOB_RANK',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["직종"], 		ref: 'JOB_GROUP',   	    type:'combo', style:'text-align:left' ,width: '125px',
                typeinfo: {
                    ref			: 'jsonSrchJobGroup',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["입사일"],       ref: 'ENTER_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["연차기산일"],       ref: 'ANNUAL_INITIAL_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사일"],       ref: 'RETIRE_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사여부"],         ref: 'RETIRE_FLAG',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["근속년수"],         ref: 'WORK_YEAR',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["전년이월"],         ref: 'CARRIED_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["회계연도 연차"],         ref: 'ANNUAL_DAY',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["1년미만 발생일수"],         ref: 'ONEYEAR_DAY',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["총 연차"],         ref: 'TOT_DAY',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["사용연차"],         ref: 'USE_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["보상일수"],         ref: 'CHARGE_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["잔여연차"],         ref: 'BALANCE_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["기준시작일"],       ref: 'BASIS_START_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["기준종료일"],       ref: 'BASIS_END_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사용가능시작일"],       ref: 'ANNUAL_START_DATE', 		type:'datepicker',  	width:'108px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사용가능종료일"],       ref: 'ANNUAL_END_DATE', 		type:'datepicker',  	width:'108px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["총일수"],         ref: 'TOTAL_WORK_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["실근무일수"],         ref: 'REAL_WORK_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["차감일수1"],         ref: 'MINUS1_WORK_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["차감일수2"],         ref: 'MINUS2_WORK_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["조정일수"],         ref: 'ADJUST_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["년도"],         ref: 'YYYY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('click', 'fn_view');
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonDetailList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["사용일자"],       ref: 'YYYYMMDD', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사용일수"],         ref: 'USE_DAY',    type:'output',  	width:'94px',  style:'text-align:left'},
            {caption: ["근태항목"], 		ref: 'TIME_ITEM_CODE',   	    type:'combo', style:'text-align:left' ,width: '136px',
                typeinfo: {
                    ref			: 'jsonTimeItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'257px',  style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if(mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if(mode == "line") {
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

        _SBGrid.destroy('gvwInfo');
        fn_createGvwInfoGrid();
    }

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwInfo.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwInfo.addRow(true, { USE_YN: 'Y' });
        }else{
            gvwInfo.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwInfo.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwInfo.deleteRow(rowVal);
        }
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwInfoGrid();
        fn_createGvwDetailGrid();
        fn_search();
    });

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_view = async function() {
        var nCol = gvwInfo.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = gvwInfo.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfo.getRowData(nRow);

        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let SITE_CODE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let BASE_DATE = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfnma_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let EMP_CODE = gfnma_nvl(rowData.EMP_CODE);
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let PAID_ANNUAL_TYPE = gfnma_nvl(rowData.PAID_ANNUAL_TYPE);
        let SPECIAL_PERIOD = gfnma_nvl(rowData.SPECIAL_PERIOD);
        let ANNUAL_START_DATE = gfnma_nvl(rowData.ANNUAL_START_DATE);
        let ANNUAL_END_DATE = gfnma_nvl(rowData.ANNUAL_END_DATE);

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            V_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_PAID_ANNUAL_TYPE : PAID_ANNUAL_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_ANNUAL_START_DATE : ANNUAL_START_DATE,
            V_P_ANNUAL_END_DATE : ANNUAL_END_DATE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt5200List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonDetailList.length = 0;
                data.cv_2.forEach((item, index) => {
                    const msg = {
                        YYYYMMDD : item.YYYYMMDD,
                        TIME_ITEM_CODE : item.TIME_ITEM_CODE,
                        USE_DAY : item.USE_DAY,
                        MEMO : item.MEMO
                    }
                    jsonDetailList.push(msg);
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

    const fn_search = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let SITE_CODE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let BASE_DATE = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfnma_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let PAID_ANNUAL_TYPE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let SPECIAL_PERIOD = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            V_P_BASE_DATE : BASE_DATE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_PAID_ANNUAL_TYPE : PAID_ANNUAL_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_ANNUAL_START_DATE : '',
            V_P_ANNUAL_END_DATE : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt5200List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        CONFIRM_YN : item.CONFIRM_YN,
                        CONFIRM_DATE : item.CONFIRM_DATE,
                        SITE_CODE : item.SITE_CODE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_FULL_NAME : item.EMP_FULL_NAME,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        JOB_GROUP : item.JOB_GROUP,
                        POSITION_CODE : item.POSITION_CODE,
                        DUTY_CODE : item.DUTY_CODE,
                        JOB_RANK : item.JOB_RANK,
                        ENTER_DATE : item.ENTER_DATE,
                        ANNUAL_INITIAL_DATE : item.ANNUAL_INITIAL_DATE,
                        RETIRE_DATE : item.RETIRE_DATE,
                        WORK_YEAR : item.WORK_YEAR,
                        ANNUAL_DAY : item.ANNUAL_DAY,
                        ONEYEAR_DAY : item.ONEYEAR_DAY,
                        TOT_DAY : item.TOT_DAY,
                        ADJUST_DAY : item.ADJUST_DAY,
                        CARRIED_DAY : item.CARRIED_DAY,
                        USE_DAY : item.USE_DAY,
                        CHARGE_DAY : item.CHARGE_DAY,
                        BALANCE_DAY : item.BALANCE_DAY,
                        DEPT_CATEGORY : item.DEPT_CATEGORY,
                        SORT_SEQ : item.SORT_SEQ,
                        PARENT_DEPT : item.PARENT_DEPT,
                        POSITION_CODE_SEQ : item.POSITION_CODE_SEQ,
                        ANNUAL_START_DATE : item.ANNUAL_START_DATE,
                        ANNUAL_END_DATE : item.ANNUAL_END_DATE,
                        BASIS_START_DATE : item.BASIS_START_DATE,
                        BASIS_END_DATE : item.BASIS_END_DATE,
                        PAID_ANNUAL_TYPE : item.PAID_ANNUAL_TYPE,
                        SPECIAL_PERIOD : item.SPECIAL_PERIOD,
                        YYYY : item.YYYY,
                        TOTAL_WORK_DAY : item.TOTAL_WORK_DAY,
                        REAL_WORK_DAY : item.REAL_WORK_DAY,
                        MINUS1_WORK_DAY : item.MINUS1_WORK_DAY,
                        MINUS2_WORK_DAY : item.MINUS2_WORK_DAY
                    }
                    jsonInfoList.push(msg);
                });

                gvwInfo.rebuild();
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

    const fn_save = async function() {
        let updatedData = gvwInfo.getUpdateData(true, 'all');
        let listDate = [];

        updatedData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedApcCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_YYYY: item.data.YYYY,
                    V_P_SITE_CODE: item.data.SITE_CODE,
                    V_P_EMP_CODE: item.data.EMP_CODE,
                    V_P_DEPT_CODE: item.data.DEPT_CODE,
                    V_P_ANNUAL_DAY: item.data.ANNUAL_DAY,
                    V_P_ONEYEAR_DAY: item.data.ONEYEAR_DAY,
                    V_P_TOT_DAY: item.data.TOT_DAY,
                    V_P_CARRIED_DAY: item.data.CARRIED_DAY,
                    V_P_USE_DAY: item.data.USE_DAY,
                    V_P_BALANCE_DAY: item.data.BALANCE_DAY,
                    V_P_ADJUST_DAY: item.data.ADJUST_DAY,
                    V_P_ANNUAL_START_DATE: item.data.ANNUAL_START_DATE,
                    V_P_ANNUAL_END_DATE: item.data.ANNUAL_END_DATE,
                    V_P_BASIS_START_DATE: item.data.BASIS_START_DATE,
                    V_P_BASIS_END_DATE: item.data.BASIS_END_DATE,
                    V_P_PAID_ANNUAL_TYPE: item.data.PAID_ANNUAL_TYPE,
                    V_P_SPECIAL_PERIOD: item.data.SPECIAL_PERIOD,
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listDate.push(param);
        });

        if(listDate.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5200List.do", {listData: listDate});

            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    alert(data.resultMessage);
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
    }

    const fn_confirm = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let SITE_CODE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let BASE_DATE = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfnma_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let EMP_CODE_D = "";
        let BASE_DATE_D = "";
        let SPECIAL_PERIOD_D = "";
        let PAID_ANNUAL_TYPE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let SPECIAL_PERIOD = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));

        let grdRows = gvwInfo.getCheckedRows(0, true);

        if (grdRows.length == 0) {
            alert("확정대상이 없습니다. 대상자 선택 후 처리하십시요");
            return false;
        }

        let isConfirm = false;

        grdRows.forEach((item, index) => {
            console.log(gvwInfo.getRowData(item))
            if (gvwInfo.getRowData(item).CONFIRM_YN == "Y") {
                isConfirm = true;
            }
            EMP_CODE_D += gvwInfo.getRowData(item).EMP_CODE + "|";
            //BASE_DATE_D += gvwInfo.getRowData(item).BASE_DATE + "|";
            SPECIAL_PERIOD_D += gvwInfo.getRowData(item).SPECIAL_PERIOD + "|";
        });

        if (isConfirm) {
            alert("이미 확정된 인원이 포함되어 있습니다. 해당인원 제외후 확정하십시요");
            return false;
        }

        if (EMP_CODE_D.length > 0) {
            EMP_CODE_D = EMP_CODE_D.substring(0, EMP_CODE_D.length - 1);
            //BASE_DATE_D = BASE_DATE_D.substring(0, BASE_DATE_D.length - 1);
            SPECIAL_PERIOD_D = EMP_CODE_D.substring(0, SPECIAL_PERIOD_D.length - 1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_BASE_DATE : BASE_DATE,
            V_P_EMP_CODE_D : EMP_CODE_D,
            V_P_BASE_DATE_D : BASE_DATE_D,
            V_P_SPECIAL_PERIOD_D : SPECIAL_PERIOD_D,
            V_P_PAID_ANNUAL_TYPE : PAID_ANNUAL_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };
        console.log(paramObj)
        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5200Confirm.do", {
            getType				: 'json',
            workType			: 'CONFIRM',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("연차발생이 확정되었습니다.");
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

    const fn_unconfirm = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let SITE_CODE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let BASE_DATE = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfnma_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
        let EMP_CODE_D = "";
        let BASE_DATE_D = "";
        let SPECIAL_PERIOD_D = "";
        let PAID_ANNUAL_TYPE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_PAID_VACATION_TYPE'));
        let SPECIAL_PERIOD = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));

        let grdRows = gvwInfo.getCheckedRows(0, true);

        if (grdRows.length == 0) {
            alert("확정대상이 없습니다. 대상자 선택 후 처리하십시요");
            return false;
        }

        grdRows.forEach((item, index) => {
            EMP_CODE_D += gvwInfo.getRowData(item).EMP_CODE + "|";
            //BASE_DATE_D += gvwInfo.getRowData(item).BASE_DATE + "|";
            SPECIAL_PERIOD_D += gvwInfo.getRowData(item).SPECIAL_PERIOD + "|";
        });

        if (EMP_CODE_D.length > 0) {
            EMP_CODE_D = EMP_CODE_D.substring(0, EMP_CODE_D.length - 1);
            //BASE_DATE_D = BASE_DATE_D.substring(0, BASE_DATE_D.length - 1);
            SPECIAL_PERIOD_D = EMP_CODE_D.substring(0, SPECIAL_PERIOD_D.length - 1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_BASE_DATE : BASE_DATE,
            V_P_EMP_CODE_D : EMP_CODE_D,
            V_P_BASE_DATE_D : BASE_DATE_D,
            V_P_SPECIAL_PERIOD_D : SPECIAL_PERIOD_D,
            V_P_PAID_ANNUAL_TYPE : PAID_ANNUAL_TYPE,
            V_P_SPECIAL_PERIOD : SPECIAL_PERIOD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5200Confirm.do", {
            getType				: 'json',
            workType			: 'UNCONFIRM',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', listData);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("연차발생이 확정취소되었습니다.");
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