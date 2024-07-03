<%
    /**
     * @Class Name 		: hrt2330.jsp
     * @Description 	: 일근태조회 화면
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
    <title>title : 일근태조회</title>
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
                <sbux-button id="btnResult" name="btnResult" uitype="normal" text="결재내역" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_result"></sbux-button>
                <sbux-button id="btnApprove" name="btnApprove" uitype="normal" text="결재처리" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_approve"></sbux-button>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
                <sbux-button id="btnManagerAppr" name="btnManagerAppr" uitype="normal" text="관리자승인취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_managerAppr"></sbux-button>
                <sbux-button id="btnApprCancel" name="btnApprCancel" uitype="normal" text="관리자승인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_apprCancel"></sbux-button>
                <sbux-button id="btnAllSave" name="btnAllSave" uitype="normal" text="일괄저장" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_allSave"></sbux-button>
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
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 1%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 3%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 32%">
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
                    <td colspan="2" class="td_input">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_PERIOD_YYYYMM"
                                name="SRCH_PERIOD_YYYYMM"
                                date-format="yyyy-mm"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td colspan="2"></td>
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
                    <th scope="row" class="th_bg">직군</th>
                    <td class="td_input">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">근태일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMMDD_FR"
                                name="SRCH_YYYYMMDD_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMMDD_TO"
                                name="SRCH_YYYYMMDD_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        <sbux-input id="SITE_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                        <sbux-input id="DEPT_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                        <sbux-input id="DEPT_NAME2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                        <sbux-input id="POSITION_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                        <sbux-input id="DUTY_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                        <sbux-input id="JOB_RANK2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                    <td class="">
                        <div style="margin-left: 100px; display: grid; grid-auto-flow: column;">
                            <span style="background-color: #DEB887; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미작성</span>
                            <span style="background-color: #FFB6C1; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미확정</span>
                            <span style="background-color: #D3D3D3; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미승인</span>
                            <span style="background-color: #ADD8E6; width: 70px; height: 25px; margin-left: 10px; text-align: center;">승인중</span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원리스트</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwShift" style="height:580px;"></div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원별 일근태 실적</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-bandgvwInfo" style="height:580px;"></div>
                    </div>
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

    var jsonSiteCode = []; // 사업장
    var jsonEmpState = []; // 재직구분
    var jsonJobGroup = []; // 직군
    var jsonPositionCode = []; // 직위
    var jsonShiftCode = []; // 교대조
    var jsonWorkPatternCode = []; // 근무패턴
    var jsonHolidayYn = []; // 휴일여부
    var jsonWorkDayType = []; // 근무일 구분
    var jsonTimeCategory = []; // 구분
    var jsonTimeItemCode = []; // 근태항목
    var jsonStartEndDayType = []; // 시작/종료구분
    var jsonStatusCode = []; // 상태
    var jsonConfirmYn = []; // 확정여부

    const fn_initSBSelect = async function() {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_FR",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_TO", gfn_dateToYmd(new Date()));

        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['bandgvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
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
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE', 'gvwShift'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047_03', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwShift', 'bandgvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교대조
            gfnma_setComSelect(['gvwShift'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
            // 근무패턴
            gfnma_setComSelect(['gvwShift'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 휴일여부
            gfnma_setComSelect(['bandgvwInfo'], jsonHolidayYn, 'L_HRT015', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무일구분
            gfnma_setComSelect(['bandgvwInfo'], jsonWorkDayType, 'L_HRT019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['bandgvwInfo'], jsonTimeCategory, 'L_HRT024_05', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태항목
            gfnma_setComSelect(['bandgvwInfo'], jsonTimeItemCode, 'L_HRT004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            // 시작/종료일자유형
            gfnma_setComSelect(['bandgvwInfo'], jsonStartEndDayType, 'L_HRT011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['bandgvwInfo'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 확정여부
            gfnma_setComSelect(['bandgvwInfo'], jsonConfirmYn, 'L_HRT014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwShiftGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwShift';
        SBGridProperties.id 				= 'gvwShift';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'85px',  style:'text-align:left', hidden: true},
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'85px',  style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'92px',  style:'text-align:left'},
            {caption: ["입사일"],       ref: 'ENTER_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["작성일수"],         ref: 'CREATE_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["확정일수"],         ref: 'CONFIRM_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["승인일수"],         ref: 'APPR_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["퇴사일"],       ref: 'RETIRE_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["재직상태"], 		ref: 'EMP_STATE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["교대조"], 		ref: 'SHIFT_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근무패턴"], 		ref: 'WORK_PATTERN_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근태관리"],         ref: 'WORK_TIME_YN',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwShift = _SBGrid.create(SBGridProperties);
        gvwShift.bind('click', 'fn_view');
    }

    function fn_createBandgvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwInfo';
        SBGridProperties.id 				= 'bandgvwInfo';
        SBGridProperties.jsonref 			= 'jsonDayShiftList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.frozencols = 5;
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["", ""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["진행상황", "근무일"],       ref: 'BASE_YYYYMMDD', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["진행상황", "상태"], 		ref: 'STATUS_CODE',   	    type:'combo', style:'text-align:left' ,width: '65px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["진행상황", "확정"], 		ref: 'CONFIRM_YN',   	    type:'combo', style:'text-align:left' ,width: '77px',
                typeinfo: {
                    ref			: 'jsonConfirmYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["진행상황", "확정일자"],        ref: 'CONFIRM_TIME', 		         type:'input',  	width:'80px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["근무일정보", "근무패턴"],         ref: 'WORK_PATTERN_CODE',    type:'input',  	width:'83px',  style:'text-align:left'},
            {caption: ["근무일정보", "교대조"], 		ref: 'SHIFT_CODE',   	    type:'combo', style:'text-align:left' ,width: '77px',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무일정보", "휴일"], 		ref: 'HOLIDAY_YN',   	    type:'combo', style:'text-align:left' ,width: '65px',
                typeinfo: {
                    ref			: 'jsonHolidayYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무일정보", "명절"],        ref: 'HOLIDAY2_YN', 		     type:'checkbox',  	width:'60px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["근무일정보", "근무일"], 		ref: 'WORK_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonWorkDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무일정보", "정상근무시간"],         ref: 'WORK_TIMES',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["근태항목", "순번"],         ref: 'HISTORY_SEQ',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["근태항목", "구분"], 		ref: 'TIME_CATEGORY',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTimeCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태항목", "항목"],         ref: 'TIME_ITEM_CODE',    type:'output',  	width:'86px',  style:'text-align:left'},
            {caption: ["근태항목", "명칭"],         ref: 'TIME_ITEM_NAME',    type:'output',  	width:'117px',  style:'text-align:left'},
            {caption: ["근태항목", "당초근태"], 		ref: 'TIME_ITEM_CODE_ORIG',   	    type:'combo', style:'text-align:left' ,width: '118px',
                typeinfo: {
                    ref			: 'jsonTimeItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["시작", "구분"], 		ref: 'START_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '65px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작", "시각"],        ref: 'TIME_START_HHMM', 		         type:'input',  	width:'70px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["종료", "구분"], 		ref: 'END_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["종료", "시각"],        ref: 'TIME_END_HHMM', 		         type:'input',  	width:'60px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["종료", "휴게적용여부"],        ref: 'BREAK_APPLY_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["종료", "대체근무여부"],        ref: 'ALTER_WORK_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["종료", "대체근무신청대상"],        ref: 'ALTER_REQ_YN', 		     type:'checkbox',  	width:'96px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["종료", "교대수당대상"],        ref: 'SHIFT_WORK_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["종료", "일반직석식"],        ref: 'DINNER_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["종료", "석식시작유형"], 		ref: 'BREAK_START_DAY_TYPE1',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["종료", "석식시작시각"],        ref: 'BREAK_START_HHMM1', 		         type:'input',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["종료", "석식종료유형"], 		ref: 'BREAK_END_DAY_TYPE1',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["종료", "석식종료시각"],        ref: 'BREAK_END_HHMM1', 		         type:'input',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["백신수당", "백신수당"],        ref: 'VACCINE_WORK_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["내역", "시간"],        ref: 'TIME_HOURS', 		         type:'output',  	width:'94px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["내역", "비고"],         ref: 'MEMO',    type:'input',  	width:'137px',  style:'text-align:left'},
            {caption: ["내역", "사유"],         ref: 'CAUSE',    type:'input',  	width:'106px',  style:'text-align:left'},
            {caption: ["야간시간", "근태항목"], 		ref: 'NIGHT_TIME_ITEM_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTimeItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["야간시간", "시작유형"], 		ref: 'NIGHT_START_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["야간시간", "시작시각"],        ref: 'NIGHT_START_HHMM', 		         type:'input',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["야간시간", "종료유형"], 		ref: 'NIGHT_END_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["야간시간", "종료시각"],        ref: 'NIGHT_END_HHMM', 		         type:'input',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["야간시간", "종료시간"],        ref: 'NIGHT_HOURS', 		         type:'output',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'output',  	width:'60px',  style:'text-align:left', hidden: true},
            {caption: ["신청자정보", "사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["신청자정보", "부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left', hidden: true},
            {caption: ["신청자정보", "직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '67px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["신청자정보", "사번"],         ref: 'EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["내역", "부서분류"],         ref: 'DEPT_CATEGORY',    type:'input',  	width:'50px',  style:'text-align:left', hidden: true},
            {caption: ["내역", "부서순번"],         ref: 'SORT_SEQ',    type:'input',  	width:'73px',  style:'text-align:left', hidden: true},
            {caption: ["신청자정보", "상위부서"],         ref: 'PARENT_DEPT',    type:'output',  	width:'50px',  style:'text-align:left', hidden: true},
            {caption: ["내역", "부서순번"],         ref: 'POSITION_CODE_SEQ',    type:'input',  	width:'50px',  style:'text-align:left', hidden: true},
            {caption: ["진행상태", "승인일자"],       ref: 'APPROVE_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["내역", "실적구분"],         ref: 'ACCRUAL_FLAG',    type:'input',  	width:'50px',  style:'text-align:left', hidden: true},
            {caption: ["진행상태", "실적일자"],       ref: 'ACCT_YYYYMMDD', 		type:'datepicker',  	width:'50px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["내역", "데이터 수정여부"],        ref: 'MODIFIED_YN', 		     type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true, hidden: true},
            {caption: ["내역", "소스유형"],         ref: 'SOURCE_TYPE',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["내역", "소스코드"],         ref: 'SOURCE_CODE',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청자정보", "부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["진행상태", "근태일(근무기준)"],       ref: 'WORK_YYYYMMDD', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["내역", "WORK_DATA_SOURCE"],         ref: 'WORK_DATA_SOURCE',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
    }

    const fn_view = async function () {
        var nRow = gvwShift.getRow();
        var rowData = gvwShift.getRowData(nRow);

        let YYYYMMDD_FR = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let SITE_CODE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfnma_nvl(rowData.DEPT_CODE);
        let JOB_GROUP = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfnma_nvl(rowData.EMP_CODE);
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_LOGIN_DEPT_CODE : '',
            V_P_HR_MANAGER_YN : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2330List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '4',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;
        console.log('data:', listData);

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonDayShiftList.length = 0;
                listData.cv_2.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        TXN_ID : item.TXN_ID,
                        SEQ_NO : item.SEQ_NO,
                        STATUS_CODE : item.STATUS_CODE,
                        APPROVE_DATE : item.APPROVE_DATE,
                        SITE_CODE : item.SITE_CODE,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        WORK_PATTERN_CODE : item.WORK_PATTERN_CODE,
                        SHIFT_CODE : item.SHIFT_CODE,
                        POSITION_CODE : item.POSITION_CODE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        HOLIDAY_YN : item.HOLIDAY_YN,
                        HOLIDAY2_YN : item.HOLIDAY2_YN,
                        WORK_DAY_TYPE : item.WORK_DAY_TYPE,
                        WORK_TIMES : item.WORK_TIMES,
                        TIME_CATEGORY : item.TIME_CATEGORY,
                        TIME_ITEM_CODE : item.TIME_ITEM_CODE,
                        TIME_ITEM_NAME : item.TIME_ITEM_NAME,
                        TIME_ITEM_CODE_ORIG : item.TIME_ITEM_CODE_ORIG,
                        BASE_YYYYMMDD : item.BASE_YYYYMMDD,
                        WORK_YYYYMMDD : item.WORK_YYYYMMDD,
                        START_DAY_TYPE : item.START_DAY_TYPE,
                        TIME_START_HHMM : item.TIME_START_HHMM,
                        END_DAY_TYPE : item.END_DAY_TYPE,
                        TIME_END_HHMM : item.TIME_END_HHMM,
                        TIME_HOURS : item.TIME_HOURS,
                        MEMO : item.MEMO,
                        CAUSE : item.CAUSE,
                        POSITION_CODE_SEQ : item.POSITION_CODE_SEQ,
                        CONFIRM_YN : item.CONFIRM_YN,
                        CONFIRM_TIME : item.CONFIRM_TIME,
                        ACCRUAL_FLAG : item.ACCRUAL_FLAG,
                        ACCT_YYYYMMDD : item.ACCT_YYYYMMDD,
                        SOURCE_TYPE : item.SOURCE_TYPE,
                        SOURCE_CODE : item.SOURCE_CODE,
                        MODIFIED_YN : item.MODIFIED_YN,
                        DEPT_CATEGORY : item.DEPT_CATEGORY,
                        SORT_SEQ : item.SORT_SEQ,
                        PARENT_DEPT : item.PARENT_DEPT,
                        NIGHT_TIME_ITEM_CODE : item.NIGHT_TIME_ITEM_CODE,
                        NIGHT_START_DAY_TYPE : item.NIGHT_START_DAY_TYPE,
                        NIGHT_START_HHMM : item.NIGHT_START_HHMM,
                        NIGHT_END_DAY_TYPE : item.NIGHT_END_DAY_TYPE,
                        NIGHT_END_HHMM : item.NIGHT_END_HHMM,
                        NIGHT_HOURS : item.NIGHT_HOURS,
                        APPROVE_GROUP : item.APPROVE_GROUP,
                        INSERT_USERID : item.INSERT_USERID,
                        INSERT_EMP_CODE : item.INSERT_EMP_CODE,
                        INSERT_GROUP : item.INSERT_GROUP,
                        INSERT_GROUP2 : item.INSERT_GROUP2,
                        CURRENT_APPROVE_EMP_CODE : item.CURRENT_APPROVE_EMP_CODE,
                        CURRENT_APPROVE_EMP_NAME : item.CURRENT_APPROVE_EMP_NAME,
                        PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                        PROXY_EMP_NAME : item.PROXY_EMP_NAME,
                        CURRENT_DUTY_CODE : item.CURRENT_DUTY_CODE,
                        APPR_COUNT : item.APPR_COUNT,
                        APPR_ID : item.APPR_ID,
                        FINAL_APPROVER : item.FINAL_APPROVER,
                        WORK_DATA_SOURCE : item.WORK_DATA_SOURCE,
                        WORK_TIME : item.WORK_TIME,
                        OVERTIME_CNT : item.OVERTIME_CNT,
                        VACCINE_WORK_YN : item.VACCINE_WORK_YN,
                        BREAK_APPLY_YN : item.BREAK_APPLY_YN,
                        ALTER_WORK_YN : item.ALTER_WORK_YN,
                        ALTER_REQ_YN : item.ALTER_REQ_YN,
                        SHIFT_WORK_YN : item.SHIFT_WORK_YN,
                        BREAK_START_DAY_TYPE1 : item.BREAK_START_DAY_TYPE1,
                        BREAK_START_HHMM1 : item.BREAK_START_HHMM1,
                        BREAK_END_DAY_TYPE1 : item.BREAK_END_DAY_TYPE1,
                        BREAK_END_HHMM1 : item.BREAK_END_HHMM1,
                        DINNER_YN : item.DINNER_YN
                    }
                    jsonDayShiftList.push(msg);
                });
                bandgvwInfo.rebuild();
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
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwShiftGrid();
        fn_createBandgvwInfoGrid();
        fn_search();
    });

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_search = async function () {
        let YYYYMMDD_FR = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let SITE_CODE = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_LOGIN_DEPT_CODE : '',
            V_P_HR_MANAGER_YN : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2330List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '4',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;
        console.log('data:', listData);

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonEmpList.length = 0;
                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        DEPT_NAME : item.DEPT_NAME,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        POSITION_CODE : item.POSITION_CODE,
                        SITE_CODE : item.SITE_CODE,
                        DEPT_CODE : item.DEPT_CODE,
                        ENTER_DATE : item.ENTER_DATE,
                        RETIRE_DATE : item.RETIRE_DATE,
                        EMP_STATE : item.EMP_STATE,
                        SORT_SEQ : item.SORT_SEQ,
                        SORT_SEQ2 : item.SORT_SEQ2,
                        WORK_TIME_YN : item.WORK_TIME_YN,
                        CREATE_CNT : item.CREATE_CNT,
                        CONFIRM_CNT : item.CONFIRM_CNT,
                        APPR_CNT : item.APPR_CNT
                    }
                    jsonEmpList.push(msg);
                });
                gvwShift.rebuild();
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
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>