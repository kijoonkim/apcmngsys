<%
    /**
     * @Class Name 		: hrt2325.jsp
     * @Description 	: 일근태조정(기술) 화면
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
    <title>title : 일근태조정(기술)</title>
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
                <%--<sbux-button id="btnConfirmHist" name="btnConfirmHist" uitype="normal" text="결재이력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confimHist"></sbux-button>--%>
                <%--<sbux-button id="btnResult" name="btnResult" uitype="normal" text="결재내역" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_result"></sbux-button>
                <sbux-button id="btnApprove" name="btnApprove" uitype="normal" text="결재처리" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_approve"></sbux-button>--%>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
                <sbux-button id="btnManagerAppr" name="btnManagerAppr" uitype="normal" text="관리자승인취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_managerAppr"></sbux-button>
                <sbux-button id="btnApprCancel" name="btnApprCancel" uitype="normal" text="관리자승인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_apprCancel"></sbux-button>
                <sbux-button id="btnAllSave" name="btnAllSave" uitype="normal" text="일괄저장" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_allSave"></sbux-button>
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
                    <td></td>
                    <th scope="row" class="th_bg_search">재직구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_PERIOD_YYYYMM"
                                name="SRCH_PERIOD_YYYYMM"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                onchange="fn_changePeriodYyyymm(SRCH_PERIOD_YYYYMM)"
                        />
                    </td>
                    <td colspan="3"></td>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findDeptCode"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">직군</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">근태일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMMDD_FR"
                                name="SRCH_YYYYMMDD_FR"
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
                                id="SRCH_YYYYMMDD_TO"
                                name="SRCH_YYYYMMDD_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                    <td colspan="5">
                        <div style="margin-left: 100px; display: grid; grid-auto-flow: column;">
                            <span style="background-color: #DEB887; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미작성</span>
                            <span style="background-color: #FFB6C1; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미확정</span>
                            <span style="background-color: #D3D3D3; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미승인</span>
                            <span style="background-color: #ADD8E6; width: 70px; height: 25px; margin-left: 10px; text-align: center;">승인중</span>
                            <span style="background-color: #FF6347; width: 70px; height: 25px; margin-left: 10px; text-align: center;">반려</span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원리스트</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
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
                        <div style="margin-left: auto;">
                            <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                            <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                            <sbux-button id="btnCopyDown" name="btnCopyDown" uitype="normal" text="아래로복사" class="btn btn-sm btn-outline-danger" onclick="fn_copyDown" style="float: right;"></sbux-button>
                            <sbux-button id="btnCopyUp" name="btnCopyUp" uitype="normal" text="위로복사" class="btn btn-sm btn-outline-danger" onclick="fn_copyUp" style="float: right;"></sbux-button>
                            <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                            <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                            <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>
                        </div>
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

    var copyMode            = "clear";
    var bEventEnabled = true;

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

    //grid 초기화
    var gvwShift; 			// 그리드를 담기위한 객체 선언
    var bandgvwInfo;

    var jsonEmpList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonDayShiftList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['bandgvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
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
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE', 'gvwShift'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwShift', 'bandgvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교대조
            gfnma_setComSelect(['gvwShift'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
            // 근무패턴
            gfnma_setComSelect(['gvwShift'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 휴일여부
            gfnma_setComSelect(['bandgvwInfo'], jsonHolidayYn, 'L_HRT015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무일구분
            gfnma_setComSelect(['bandgvwInfo'], jsonWorkDayType, 'L_HRT019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['bandgvwInfo'], jsonTimeCategory, 'L_HRT024_05', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태항목
            gfnma_setComSelect(['bandgvwInfo'], jsonTimeItemCode, 'L_HRT004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            // 시작/종료일자유형
            gfnma_setComSelect(['bandgvwInfo'], jsonStartEndDayType, 'L_HRT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['bandgvwInfo'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 확정여부
            gfnma_setComSelect(['bandgvwInfo'], jsonConfirmYn, 'L_HRT014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
            {caption: ["입사일"],       ref: 'ENTER_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["작성일수"],         ref: 'CREATE_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["확정일수"],         ref: 'CONFIRM_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["승인일수"],         ref: 'APPR_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["퇴사일"],       ref: 'RETIRE_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
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
            {caption: ["", ""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["진행상황", "근무일"],       ref: 'BASE_YYYYMMDD', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
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
            {caption: ["진행상태", "승인일자"],       ref: 'APPROVE_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["내역", "실적구분"],         ref: 'ACCRUAL_FLAG',    type:'input',  	width:'50px',  style:'text-align:left', hidden: true},
            {caption: ["진행상태", "실적일자"],       ref: 'ACCT_YYYYMMDD', 		type:'inputdate',  	width:'50px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["내역", "데이터 수정여부"],        ref: 'MODIFIED_YN', 		     type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true, hidden: true},
            {caption: ["내역", "소스유형"],         ref: 'SOURCE_TYPE',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["내역", "소스코드"],         ref: 'SOURCE_CODE',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청자정보", "부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["진행상태", "근태일(근무기준)"],       ref: 'WORK_YYYYMMDD', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["내역", "WORK_DATA_SOURCE"],         ref: 'WORK_DATA_SOURCE',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('afterrebuild','fn_bandgvwInfoAfterRebuild');
        bandgvwInfo.bind('afterrefresh','fn_bandgvwInfoAfterRefresh');
        bandgvwInfo.bind('valuechanged', 'fn_bandgvwInfoValueChanged');
    }

    const fn_bandgvwInfoAfterRebuild = async function() {
        let bandgvwInfoData = bandgvwInfo.getGridDataAll();

        for(var i = 0; i < bandgvwInfoData.length; i++) {
            let rowData = bandgvwInfo.getRowData(i+2);

            if (rowData.STATUS_CODE == "0") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#DEB887');
            } else if (rowData.CONFIRM_YN == "N") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FFB6C1');
            } else if (rowData.STATUS_CODE == "1") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#D3D3D3');
            } else if (rowData.STATUS_CODE == "3") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#ADD8E6');
            } else if (rowData.STATUS_CODE == "4") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FF6347');
            }
        }
    }

    const fn_bandgvwInfoAfterRefresh = async function() {
        let bandgvwInfoData = bandgvwInfo.getGridDataAll();

        for(var i = 0; i < bandgvwInfoData.length; i++) {
            let rowData = bandgvwInfo.getRowData(i+2);

            if (rowData.STATUS_CODE == "0") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#DEB887');
            } else if (rowData.CONFIRM_YN == "N") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FFB6C1');
            } else if (rowData.STATUS_CODE == "1") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#D3D3D3');
            } else if (rowData.STATUS_CODE == "3") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#ADD8E6');
            } else if (rowData.STATUS_CODE == "4") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FF6347');
            }
        }
    }

    const fn_bandgvwInfoValueChanged = async function() {
        var nRow = bandgvwInfo.getRow();
        var nCol = bandgvwInfo.getCol();
        var rowData = bandgvwInfo.getRowData(nRow);

        if (nRow < 0)
            return;

        if (nCol == bandgvwInfo.getColRef("SHIFT_CODE")) {
            if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("CONFIRM_YN")) == "Y") {
                return;
            } else {
                if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("SHIFT_CODE")) != "") {
                    let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                    let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
                    let SHIFT_CODE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("SHIFT_CODE")));
                    let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN	: '',
                        V_P_LANG_ID		: '',
                        V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                        V_P_YYYYMMDD : '',
                        V_P_DATE_TYPE : '',
                        V_P_SITE_CODE : SITE_CODE,
                        V_P_DEPT_CODE : DEPT_CODE,
                        V_P_POSITION_CODE : '',
                        V_P_WORK_PATTERN_CODE : '',
                        V_P_JOB_GROUP : '',
                        V_P_EMP_CODE : EMP_CODE,
                        V_P_TIME_ITEM_CODE : '',
                        V_P_CONFIRM_YN : '',
                        V_P_SHIFT_CODE : SHIFT_CODE,
                        V_P_START_DAY_TYPE : '',
                        V_P_TIME_START_HHMM : '',
                        V_P_END_DAY_TYPE : '',
                        V_P_TIME_END_HHMM : '',
                        V_P_FORMID : 'HRT2325',
                        V_P_FORM_ID		: p_formId,
                        V_P_MENU_ID		: p_menuId,
                        V_P_PROC_ID		: '',
                        V_P_USERID			: '',
                        V_P_PC				: ''
                    };

                    const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/selectHrt2310List.do", {
                        getType				: 'json',
                        workType			: 'SHIFT',
                        cv_count			: '5',
                        params				: gfnma_objectToString(paramObj)
                    });

                    const data = await postJsonPromise;

                    try {
                        if (_.isEqual("S", data.resultStatus)) {
                            var returnData = data.cv_3[0];
                            bEventEnabled = false;
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("START_DAY_TYPE"), gfn_nvl(returnData["START_DAY_TYPE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_START_HHMM"), gfn_nvl(returnData["TIME_START_HHMM"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("END_DAY_TYPE"), gfn_nvl(returnData["END_DAY_TYPE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_HHMM"), gfn_nvl(returnData["TIME_END_HHMM"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("WORK_DAY_TYPE"), gfn_nvl(returnData["WORK_DAY_TYPE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"), gfn_nvl(returnData["TIME_ITEM_CODE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("WORK_TIMES"), gfn_nvl(returnData["WORK_TIMES"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_HOURS"), gfn_nvl(returnData["TIME_HOURS"]));
                            bEventEnabled = true;
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
        }

        if (nCol == bandgvwInfo.getColRef("START_DAY_TYPE") || nCol == bandgvwInfo.getColRef("TIME_START_HHMM") || nCol == bandgvwInfo.getColRef("END_DAY_TYPE") || nCol == bandgvwInfo.getColRef("TIME_END_HHMM")) {
            if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("CONFIRM_YN")) == "Y") {
                return;
            } else {
                if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("START_DAY_TYPE")) != "" && bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_HHMM")) != "" && bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("END_DAY_TYPE")) != "" && bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_HHMM")) != "") {
                    let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                    let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
                    let SHIFT_CODE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("SHIFT_CODE")));
                    let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
                    let START_DAY_TYPE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("START_DAY_TYPE")));
                    let TIME_START_HHMM = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_HHMM")));
                    let END_DAY_TYPE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("END_DAY_TYPE")));
                    let TIME_END_HHMM = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_HHMM")));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN	: '',
                        V_P_LANG_ID		: '',
                        V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                        V_P_YYYYMMDD : '',
                        V_P_DATE_TYPE : '',
                        V_P_SITE_CODE : SITE_CODE,
                        V_P_DEPT_CODE : DEPT_CODE,
                        V_P_POSITION_CODE : '',
                        V_P_WORK_PATTERN_CODE : '',
                        V_P_JOB_GROUP : '',
                        V_P_EMP_CODE : EMP_CODE,
                        V_P_TIME_ITEM_CODE : '',
                        V_P_CONFIRM_YN : '',
                        V_P_SHIFT_CODE : SHIFT_CODE,
                        V_P_START_DAY_TYPE : START_DAY_TYPE,
                        V_P_TIME_START_HHMM : TIME_START_HHMM,
                        V_P_END_DAY_TYPE : END_DAY_TYPE,
                        V_P_TIME_END_HHMM : TIME_END_HHMM,
                        V_P_FORMID : 'HRT2325',
                        V_P_FORM_ID		: p_formId,
                        V_P_MENU_ID		: p_menuId,
                        V_P_PROC_ID		: '',
                        V_P_USERID			: '',
                        V_P_PC				: ''
                    };

                    const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/selectHrt2310List.do", {
                        getType				: 'json',
                        workType			: 'TIME',
                        cv_count			: '5',
                        params				: gfnma_objectToString(paramObj)
                    });

                    const data = await postJsonPromise;

                    try {
                        if (_.isEqual("S", data.resultStatus)) {
                            var returnData = data.cv_4[0];
                            bEventEnabled = false;
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_HOURS"), gfn_nvl(returnData["TIME_HOURS"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("NIGHT_TIME_ITEM_CODE"), gfn_nvl(returnData["NIGHT_TIME_ITEM_CODE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("NIGHT_START_DAY_TYPE"), gfn_nvl(returnData["NIGHT_START_DAY_TYPE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("NIGHT_START_HHMM"), gfn_nvl(returnData["NIGHT_START_HHMM"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("NIGHT_END_DAY_TYPE"), gfn_nvl(returnData["NIGHT_END_DAY_TYPE"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("NIGHT_END_HHMM"), gfn_nvl(returnData["NIGHT_END_HHMM"]));
                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("NIGHT_HOURS"), gfn_nvl(returnData["NIGHT_HOURS"]));
                            bEventEnabled = true;
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
        }

        if (bEventEnabled) {
            if (nCol == bandgvwInfo.getColRef("TIME_START_HHMM")) {
                if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "3040") {
                    // 조퇴
                    let emp_code = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("EMP_CODE")));
                    let base_yyyymmdd = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("BASE_YYYYMMDD")));

                    for (var i = 0; i < jsonDayShiftList.length; i++){
                        if (jsonDayShiftList[i]["EMP_CODE"] == emp_code && jsonDayShiftList[i]["BASE_YYYYMMDD"] == base_yyyymmdd && jsonDayShiftList[i]["time_item_code"] == "1010") {
                            bandgvwInfo.setCellData((i+2), bandgvwInfo.getColRef("END_DAY_TYPE"), gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("START_DAY_TYPE"))));
                            bandgvwInfo.setCellData((i+2), bandgvwInfo.getColRef("TIME_END_HHMM"), gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_HHMM"))));
                        }
                    }
                }
            }

            if (nCol == bandgvwInfo.getColRef("TIME_END_HHMM")) {
                if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "3050") {
                    // 지각
                    let emp_code = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("EMP_CODE")));
                    let base_yyyymmdd = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("BASE_YYYYMMDD")));
                    for (var i = 0; i < jsonDayShiftList.length; i++){
                        if (jsonDayShiftList[i]["EMP_CODE"] == emp_code && jsonDayShiftList[i]["BASE_YYYYMMDD"] == base_yyyymmdd && jsonDayShiftList[i]["time_item_code"] == "1010") {
                            bandgvwInfo.setCellData((i+2), bandgvwInfo.getColRef("START_DAY_TYPE"), gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("END_DAY_TYPE"))));
                            bandgvwInfo.setCellData((i+2), bandgvwInfo.getColRef("TIME_START_HHMM"), gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_HHMM"))));
                        }
                    }
                }
            }
        }
    }

    var fn_findDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
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
            compCode				: gv_ma_selectedCorpCd
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
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
    }

    const fn_changePeriodYyyymm = function(data) {
        SBUxMethod.set("SRCH_YYYYMMDD_FR", data+"01");
        SBUxMethod.set("SRCH_YYYYMMDD_TO", gfn_dateLastYmd(new Date(data.substring(0,4)+"-"+data.substring(4,6)+"-01")));
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwShiftGrid();
        fn_createBandgvwInfoGrid();
        await fn_onload();
    });

    // 행추가
    const fn_addRow = async function () {
        let rowVal = bandgvwInfo.getRow();

        var data = {
            WORK_DATA_SOURCE : 'B',
            CHK_YN : 'N',
            HOLIDAY2_YN : 'N',
            BREAK_APPLY_YN : 'N',
            ALTER_WORK_YN : 'N',
            ALTER_REQ_YN : 'N',
            SHIFT_WORK_YN : 'N',
            DINNER_YN : 'N',
            VACCINE_WORK_YN : 'N',
            MODIFIED_YN : 'N',
        };

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            bandgvwInfo.addRow(true, data);
        }else{
            bandgvwInfo.insertRow(rowVal, data);
        }

        bandgvwInfo.refresh();
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = bandgvwInfo.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            bandgvwInfo.deleteRow(rowVal);
        }
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

        _SBGrid.destroy('bandgvwInfo');
        fn_createBandgvwInfoGrid();
    }

    const fn_copyDown = async function () {
        var nRow = bandgvwInfo.getRow();
        if(nRow < 0) {
            gfn_comAlert("E0000", "복사대상을 선택후 클릭하십시요.");
            return;
        }

        if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("CONFIRM_YN")) == "Y") {
            gfn_comAlert("E0000", "확정된 건은 복사할 수 없습니다.");
            return;
        } else {
            if (bEventEnabled) {
                bEventEnabled = false;
                bandgvwInfo.insertRow(nRow, 'below', {
                    CHK_YN : "Y",
                    SEQ_NO : (parseInt(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("SEQ_NO"))) + 1),
                    TIME_ITEM_CODE : "",
                    START_DAY_TYPE : bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("END_DAY_TYPE")),
                    TIME_START_HHMM : bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_HHMM")),
                    END_DAY_TYPE : "",
                    TIME_END_HHMM : "",
                    TIME_HOURS : "",
                    NIGHT_TIME_ITEM_CODE : "",
                    NIGHT_START_DAY_TYPE : "",
                    NIGHT_START_HHMM : "",
                    NIGHT_END_DAY_TYPE : "",
                    NIGHT_END_HHMM : "",
                    NIGHT_HOURS : "",
                    WORK_DATA_SOURCE : "B",
                });
                bEventEnabled = true;
            }
        }
    }

    const fn_copyUp = async function () {
        var nRow = bandgvwInfo.getRow();
        if(nRow < 0) {
            gfn_comAlert("E0000", "복사대상을 선택후 클릭하십시요.");
            return;
        }

        if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("CONFIRM_YN")) == "Y") {
            gfn_comAlert("E0000", "확정된 건은 복사할 수 없습니다.");
            return;
        } else {
            if (bEventEnabled) {
                bEventEnabled = false;
                bandgvwInfo.insertRow(nRow, 'above', {
                    CHK_YN : "Y",
                    SEQ_NO : (parseInt(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("SEQ_NO"))) - 1),
                    TIME_ITEM_CODE : "",
                    START_DAY_TYPE : "",
                    TIME_START_HHMM : "",
                    END_DAY_TYPE : bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("START_DAY_TYPE")),
                    TIME_END_HHMM : bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_HHMM")),
                    TIME_HOURS : "",
                    NIGHT_TIME_ITEM_CODE : "",
                    NIGHT_START_DAY_TYPE : "",
                    NIGHT_START_HHMM : "",
                    NIGHT_END_DAY_TYPE : "",
                    NIGHT_END_HHMM : "",
                    NIGHT_HOURS : "",
                    WORK_DATA_SOURCE : "B",
                });
                bEventEnabled = true;
            }
        }
    }

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

    function cfn_appr() {
        fn_approval();
    }

    const fn_save = async function () {
        let updatedData = bandgvwInfo.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {
            const param = {
                cv_count : '0',
                getType : 'json',
                rownum: item.rownum,
                workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == "" ? 0 : parseInt(item.data.TXN_ID),
                    V_P_SEQ_NO : gfn_nvl(item.data.SEQ_NO) == "" ? 0 : parseInt(item.data.SEQ_NO),
                    V_P_SITE_CODE : item.data.SITE_CODE,
                    V_P_DEPT_CODE : item.data.DEPT_CODE,
                    V_P_POSITION_CODE : item.data.POSITION_CODE,
                    V_P_WORK_PATTERN_CODE : item.data.WORK_PATTERN_CODE,
                    V_P_SHIFT_CODE : item.data.SHIFT_CODE,
                    V_P_EMP_CODE : item.data.EMP_CODE,
                    V_P_BASE_YYYYMMDD : item.data.BASE_YYYYMMDD,
                    V_P_WORK_YYYYMMDD : item.data.WORK_YYYYMMDD,
                    V_P_ACCT_YYYYMMDD : item.data.ACCT_YYYYMMDD,
                    V_P_HOLIDAY_YN : item.data.HOLIDAY_YN,
                    V_P_HOLIDAY2_YN : item.data.HOLIDAY2_YN,
                    V_P_WORK_DAY_TYPE : item.data.WORK_DAY_TYPE,
                    V_P_TIME_ITEM_CODE : item.data.TIME_ITEM_CODE,
                    V_P_TIME_ITEM_CODE_ORIG : item.data.TIME_ITEM_CODE_ORIG,
                    V_P_START_DAY_TYPE : item.data.START_DAY_TYPE,
                    V_P_TIME_START_HHMM : item.data.TIME_START_HHMM.replace(":", ""),
                    V_P_END_DAY_TYPE : item.data.END_DAY_TYPE,
                    V_P_TIME_END_HHMM : item.data.TIME_END_HHMM,
                    V_P_CONFIRM_TIME : item.data.CONFIRM_TIME,
                    V_P_CONFIRM_YN : item.data.CONFIRM_YN,
                    V_P_MEMO : item.data.MEMO,
                    V_P_CAUSE : item.data.CAUSE,
                    V_P_STATUS_CODE : item.data.STATUS_CODE,
                    V_P_APPROVE_DATE : item.data.APPROVE_DATE,
                    V_P_SOURCE_TYPE : item.data.SOURCE_TYPE,
                    V_P_SOURCE_CODE : item.data.SOURCE_CODE,
                    V_P_NIGHT_TIME_ITEM_CODE : item.data.NIGHT_TIME_ITEM_CODE,
                    V_P_NIGHT_START_DAY_TYPE : item.data.NIGHT_START_DAY_TYPE,
                    V_P_NIGHT_START_HHMM : item.data.NIGHT_START_HHMM.replace(":", ""),
                    V_P_NIGHT_END_DAY_TYPE : item.data.NIGHT_END_DAY_TYPE,
                    V_P_NIGHT_END_HHMM : item.data.NIGHT_END_HHMM.replace(":", ""),
                    V_P_WORK_DATA_SOURCE : item.data.WORK_DATA_SOURCE,
                    V_P_TXN_ID_D : '',
                    V_P_VACCINE_WORK_YN : item.data.VACCINE_WORK_YN,
                    V_P_BREAK_APPLY_YN : item.data.BREAK_APPLY_YN,
                    V_P_ALTER_WORK_YN : item.data.ALTER_WORK_YN,
                    V_P_ALTER_REQ_YN : item.data.ALTER_REQ_YN,
                    V_P_SHIFT_WORK_YN : item.data.SHIFT_WORK_YN,
                    V_P_BREAK_START_DAY_TYPE1 : item.data.BREAK_START_DAY_TYPE1,
                    V_P_BREAK_START_HHMM1 : item.data.BREAK_START_HHMM1,
                    V_P_BREAK_END_DAY_TYPE1 : item.data.BREAK_END_DAY_TYPE1,
                    V_P_BREAK_END_HHMM1 : item.data.BREAK_END_HHMM1,
                    V_P_DINNER_YN : item.data.DINNER_YN,
                    V_P_FORM_ID : p_formId.toUpperCase(),
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });

        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310List.do", {listData: returnData});
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
    }

    const fn_allSave = async function () {
        if (jsonEmpList.length > 0) {
            if (gfn_comConfirm("Q0000", "일괄저장하시겠습니까?")) {
                fn_save();
            }
        }
    }

    const fn_delete = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let gvwShiftCheckedList = gvwShift.getCheckedRows(gvwShift.getColRef("CHK_YN"), true);
        let bandgvwInfoCheckedList = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);

        if(gvwShiftCheckedList.length == 0 && bandgvwInfoCheckedList.length == 0) {
            return;
        }

        if (gfn_comConfirm("Q0000", "선택된 사원의 일근태를 정말 삭제하시겠습니까?")) {
            if (gvwShiftCheckedList.length > 0) {
                for (var i = 0; i < gvwShiftCheckedList.length; i++) {
                    let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
                    let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
                    let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                    let DEPT_CODE = gfn_nvl(bandgvwInfo.getCellData(gvwShiftCheckedList[i], bandgvwInfo.getColRef("DEPT_CODE")));
                    let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
                    let EMP_CODE = gfn_nvl(bandgvwInfo.getCellData(gvwShiftCheckedList[i], bandgvwInfo.getColRef("EMP_CODE")));
                    let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN	: '',
                        V_P_LANG_ID		: '',
                        V_P_COMP_CODE		: gv_ma_selectedCorpCd,
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
                        V_P_FORMID : "HRT2325",
                        V_P_FORM_ID		: p_formId,
                        V_P_MENU_ID		: p_menuId,
                        V_P_PROC_ID		: '',
                        V_P_USERID			: '',
                        V_P_PC				: ''
                    };

                    const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2325List.do", {
                        getType				: 'json',
                        workType			: 'DETAIL',
                        cv_count			: '2',
                        params				: gfnma_objectToString(paramObj)
                    });

                    const listData = await postJsonPromiseForList;

                    try {
                        if (_.isEqual("S", listData.resultStatus)) {
                            let strtxn_id = "";

                            if(listData.cv_2.length > 0) {
                                listData.cv_2.forEach((item, index) => {
                                    strtxn_id += item.TXN_ID + "|";
                                });

                                var paramObj = {
                                    V_P_DEBUG_MODE_YN	: '',
                                    V_P_LANG_ID		: '',
                                    V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                                    V_P_TXN_ID : '0',
                                    V_P_SEQ_NO : '0',
                                    V_P_SITE_CODE : '',
                                    V_P_DEPT_CODE : '',
                                    V_P_POSITION_CODE : '',
                                    V_P_WORK_PATTERN_CODE : '',
                                    V_P_SHIFT_CODE : '',
                                    V_P_EMP_CODE : '',
                                    V_P_BASE_YYYYMMDD : '',
                                    V_P_WORK_YYYYMMDD : '',
                                    V_P_ACCT_YYYYMMDD : '',
                                    V_P_HOLIDAY_YN : '',
                                    V_P_HOLIDAY2_YN : '',
                                    V_P_WORK_DAY_TYPE : '',
                                    V_P_TIME_ITEM_CODE : '',
                                    V_P_TIME_ITEM_CODE_ORIG : '',
                                    V_P_START_DAY_TYPE : '',
                                    V_P_TIME_START_HHMM : '',
                                    V_P_END_DAY_TYPE : '',
                                    V_P_TIME_END_HHMM : '',
                                    V_P_CONFIRM_TIME : '',
                                    V_P_CONFIRM_YN : '',
                                    V_P_MEMO : '',
                                    V_P_CAUSE : '',
                                    V_P_STATUS_CODE : '',
                                    V_P_APPROVE_DATE : '',
                                    V_P_SOURCE_TYPE : '',
                                    V_P_SOURCE_CODE : '',
                                    V_P_NIGHT_TIME_ITEM_CODE : '',
                                    V_P_NIGHT_START_DAY_TYPE : '',
                                    V_P_NIGHT_START_HHMM : '',
                                    V_P_NIGHT_END_DAY_TYPE : '',
                                    V_P_NIGHT_END_HHMM : '',
                                    V_P_WORK_DATA_SOURCE : '',
                                    V_P_TXN_ID_D : strtxn_id,
                                    V_P_VACCINE_WORK_YN : '',
                                    V_P_BREAK_APPLY_YN : '',
                                    V_P_ALTER_WORK_YN : '',
                                    V_P_ALTER_REQ_YN : '',
                                    V_P_SHIFT_WORK_YN : '',
                                    V_P_BREAK_START_DAY_TYPE1 : '',
                                    V_P_BREAK_START_HHMM1 : '',
                                    V_P_BREAK_END_DAY_TYPE1 : '',
                                    V_P_BREAK_END_HHMM1 : '',
                                    V_P_DINNER_YN : '',
                                    V_P_FORM_ID		: p_formId.toUpperCase(),
                                    V_P_MENU_ID		: p_menuId,
                                    V_P_PROC_ID		: '',
                                    V_P_USERID			: '',
                                    V_P_PC				: ''
                                };

                                const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                                    getType				: 'json',
                                    workType			: 'DELETE',
                                    cv_count			: '0',
                                    params				: gfnma_objectToString(paramObj)
                                });

                                const data = await postJsonPromise;

                                if (_.isEqual("S", data.resultStatus)) {
                                } else {
                                    alert(data.resultMessage);
                                }
                            } else {
                                gfn_comAlert("E0000","확정되어 있어 삭제할 수 없습니다.");
                                return false;
                            }
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
            } else {
                let temp_txn_id = "";

                if (bandgvwInfoCheckedList.length > 0) {
                    bandgvwInfoCheckedList.forEach((item, index) => {
                        temp_txn_id += bandgvwInfo.getCellData(item, bandgvwInfo.getColRef("TXN_ID")) + "|";
                    })

                    var paramObj = {
                        V_P_DEBUG_MODE_YN	: '',
                        V_P_LANG_ID		: '',
                        V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                        V_P_TXN_ID : '0',
                        V_P_SEQ_NO : '0',
                        V_P_SITE_CODE : '',
                        V_P_DEPT_CODE : '',
                        V_P_POSITION_CODE : '',
                        V_P_WORK_PATTERN_CODE : '',
                        V_P_SHIFT_CODE : '',
                        V_P_EMP_CODE : '',
                        V_P_BASE_YYYYMMDD : '',
                        V_P_WORK_YYYYMMDD : '',
                        V_P_ACCT_YYYYMMDD : '',
                        V_P_HOLIDAY_YN : '',
                        V_P_HOLIDAY2_YN : '',
                        V_P_WORK_DAY_TYPE : '',
                        V_P_TIME_ITEM_CODE : '',
                        V_P_TIME_ITEM_CODE_ORIG : '',
                        V_P_START_DAY_TYPE : '',
                        V_P_TIME_START_HHMM : '',
                        V_P_END_DAY_TYPE : '',
                        V_P_TIME_END_HHMM : '',
                        V_P_CONFIRM_TIME : '',
                        V_P_CONFIRM_YN : '',
                        V_P_MEMO : '',
                        V_P_CAUSE : '',
                        V_P_STATUS_CODE : '',
                        V_P_APPROVE_DATE : '',
                        V_P_SOURCE_TYPE : '',
                        V_P_SOURCE_CODE : '',
                        V_P_NIGHT_TIME_ITEM_CODE : '',
                        V_P_NIGHT_START_DAY_TYPE : '',
                        V_P_NIGHT_START_HHMM : '',
                        V_P_NIGHT_END_DAY_TYPE : '',
                        V_P_NIGHT_END_HHMM : '',
                        V_P_WORK_DATA_SOURCE : '',
                        V_P_TXN_ID_D : temp_txn_id,
                        V_P_VACCINE_WORK_YN : '',
                        V_P_BREAK_APPLY_YN : '',
                        V_P_ALTER_WORK_YN : '',
                        V_P_ALTER_REQ_YN : '',
                        V_P_SHIFT_WORK_YN : '',
                        V_P_BREAK_START_DAY_TYPE1 : '',
                        V_P_BREAK_START_HHMM1 : '',
                        V_P_BREAK_END_DAY_TYPE1 : '',
                        V_P_BREAK_END_HHMM1 : '',
                        V_P_DINNER_YN : '',
                        V_P_FORM_ID		: p_formId.toUpperCase(),
                        V_P_MENU_ID		: p_menuId,
                        V_P_PROC_ID		: '',
                        V_P_USERID			: '',
                        V_P_PC				: ''
                    };

                    const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                        getType				: 'json',
                        workType			: 'DELETE',
                        cv_count			: '0',
                        params				: gfnma_objectToString(paramObj)
                    });

                    const data = await postJsonPromise;

                    if (_.isEqual("S", data.resultStatus)) {
                    } else {
                        alert(data.resultMessage);
                    }
                } else {
                    gfn_comAlert("E0000", "삭제할 데이타가 없습니다.")
                }
            }
            gfn_comAlert("I0001");
            fn_search();
        }
    }

    const fn_onload = async function () {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_FR",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_TO", gfn_dateToYmd(new Date()));

        await fn_search();
    }

    const fn_search = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
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
            V_P_FORMID : "HRT2325",
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2325List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

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
                document.querySelector('#listCount').innerText = jsonEmpList.length;

                if(jsonEmpList.length > 0) {
                    gvwShift.clickRow(1);
                }
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

    const fn_view = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        var nRow = gvwShift.getRow();
        var rowData = gvwShift.getRowData(nRow);

        let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
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
            V_P_FORMID : "HRT2325",
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2325List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

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

                for(var i = 0;  i < jsonDayShiftList.length; i++) {
                    if (jsonDayShiftList[i]["CONFIRM_YN"] == "Y") {
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("TIME_CATEGORY"), (i+2), bandgvwInfo.getColRef("TIME_CATEGORY"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("TIME_ITEM_CODE"), (i+2), bandgvwInfo.getColRef("TIME_ITEM_CODE"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("TIME_ITEM_NAME"), (i+2), bandgvwInfo.getColRef("TIME_ITEM_NAME"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("START_DAY_TYPE"), (i+2), bandgvwInfo.getColRef("START_DAY_TYPE"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("TIME_START_HHMM"), (i+2), bandgvwInfo.getColRef("TIME_START_HHMM"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("END_DAY_TYPE"), (i+2), bandgvwInfo.getColRef("END_DAY_TYPE"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("TIME_END_HHMM"), (i+2), bandgvwInfo.getColRef("TIME_END_HHMM"), true);
                        bandgvwInfo.setCellDisabled((i+2), bandgvwInfo.getColRef("MEMO"), (i+2), bandgvwInfo.getColRef("MEMO"), true);
                    }
                }
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

    const fn_apprCancel = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        if (gfn_comConfirm("Q0000", "기존 승인된 근태실적을 취소하시겠습니까?")) {
            let grdRows = gvwShift.getCheckedRows(gvwShift.getColRef("CHK_YN"), true);

            if (grdRows.length > 0) {
                for (var i = 0; i < grdRows.length; i++) {
                    let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
                    let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
                    let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                    let DEPT_CODE = gfn_nvl(gvwShift.getRowData(grdRows[i]).DEPT_CODE);
                    let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
                    let EMP_CODE = gfn_nvl(gvwShift.getRowData(grdRows[i]).EMP_CODE);
                    let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN: '',
                        V_P_LANG_ID: '',
                        V_P_COMP_CODE: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                        V_P_YYYYMMDD_FR: YYYYMMDD_FR,
                        V_P_YYYYMMDD_TO: YYYYMMDD_TO,
                        V_P_SITE_CODE: SITE_CODE,
                        V_P_DEPT_CODE: DEPT_CODE,
                        V_P_JOB_GROUP: JOB_GROUP,
                        V_P_EMP_CODE: EMP_CODE,
                        V_P_EMP_STATE: EMP_STATE,
                        V_P_LOGIN_DEPT_CODE: '',
                        V_P_HR_MANAGER_YN: '',
                        V_P_FORMID: "HRT2320",
                        V_P_FORM_ID: p_formId,
                        V_P_MENU_ID: p_menuId,
                        V_P_PROC_ID: '',
                        V_P_USERID: '',
                        V_P_PC: ''
                    };

                    const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2320List.do", {
                        getType: 'json',
                        workType: 'DETAIL',
                        cv_count: '2',
                        params: gfnma_objectToString(paramObj)
                    });

                    const listData = await postJsonPromiseForList;

                    try {
                        if (_.isEqual("S", listData.resultStatus)) {
                            let temp_txn_id = "";

                            listData.cv_2.forEach((item, index) => {
                                temp_txn_id += item.TXN_ID + "|";
                            });

                            if (temp_txn_id.length > 0) {
                                temp_txn_id = temp_txn_id.substring(0, temp_txn_id.length - 1);

                                var paramObj = {
                                    V_P_DEBUG_MODE_YN: '',
                                    V_P_LANG_ID: '',
                                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                                    V_P_TXN_ID: '0',
                                    V_P_SEQ_NO: '0',
                                    V_P_SITE_CODE: '',
                                    V_P_DEPT_CODE: '',
                                    V_P_POSITION_CODE: '',
                                    V_P_WORK_PATTERN_CODE: '',
                                    V_P_SHIFT_CODE: '',
                                    V_P_EMP_CODE: '',
                                    V_P_BASE_YYYYMMDD: '',
                                    V_P_WORK_YYYYMMDD: '',
                                    V_P_ACCT_YYYYMMDD: '',
                                    V_P_HOLIDAY_YN: '',
                                    V_P_HOLIDAY2_YN: '',
                                    V_P_WORK_DAY_TYPE: '',
                                    V_P_TIME_ITEM_CODE: '',
                                    V_P_TIME_ITEM_CODE_ORIG: '',
                                    V_P_START_DAY_TYPE: '',
                                    V_P_TIME_START_HHMM: '',
                                    V_P_END_DAY_TYPE: '',
                                    V_P_TIME_END_HHMM: '',
                                    V_P_CONFIRM_TIME: '',
                                    V_P_CONFIRM_YN: '',
                                    V_P_MEMO: '',
                                    V_P_CAUSE: '',
                                    V_P_STATUS_CODE: '',
                                    V_P_APPROVE_DATE: '',
                                    V_P_SOURCE_TYPE: '',
                                    V_P_SOURCE_CODE: '',
                                    V_P_NIGHT_TIME_ITEM_CODE: '',
                                    V_P_NIGHT_START_DAY_TYPE: '',
                                    V_P_NIGHT_START_HHMM: '',
                                    V_P_NIGHT_END_DAY_TYPE: '',
                                    V_P_NIGHT_END_HHMM: '',
                                    V_P_WORK_DATA_SOURCE: '',
                                    V_P_TXN_ID_D: temp_txn_id,
                                    V_P_VACCINE_WORK_YN: '',
                                    V_P_BREAK_APPLY_YN: '',
                                    V_P_ALTER_WORK_YN: '',
                                    V_P_ALTER_REQ_YN: '',
                                    V_P_SHIFT_WORK_YN: '',
                                    V_P_BREAK_START_DAY_TYPE1: '',
                                    V_P_BREAK_START_HHMM1: '',
                                    V_P_BREAK_END_DAY_TYPE1: '',
                                    V_P_BREAK_END_HHMM1: '',
                                    V_P_DINNER_YN: '',
                                    V_P_FORM_ID: p_formId.toUpperCase(),
                                    V_P_MENU_ID: p_menuId,
                                    V_P_PROC_ID: '',
                                    V_P_USERID: '',
                                    V_P_PC: ''
                                };

                                const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                                    getType: 'json',
                                    workType: 'APPRCANCEL',
                                    cv_count: '0',
                                    params: gfnma_objectToString(paramObj)
                                });

                                const data = await postJsonPromise;

                                if (_.isEqual("S", data.resultStatus)) {
                                    if (data.resultMessage) {
                                        alert(data.resultMessage);
                                    }
                                    fn_search();
                                } else {
                                    alert(data.resultMessage);
                                }
                            }
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
            } else {
                //개별취소처리
                let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
                if (grdRows.length > 0) {
                    let temp_txn_id = "";
                    let IntRowCount = 0;

                    grdRows.forEach((item, index) => {
                        IntRowCount = IntRowCount + 1;
                        temp_txn_id += bandgvwInfo.getCellData(item, bandgvwInfo.getColRef("TXN_ID")) + "|";
                    });

                    if (IntRowCount == 0) {
                        gfn_comAlert("E0000", "승인 취소할 데이타가 없습니다.");
                        return false;
                    } else {
                        temp_txn_id = temp_txn_id.substring(0, temp_txn_id.length - 1);

                        var paramObj = {
                            V_P_DEBUG_MODE_YN: '',
                            V_P_LANG_ID: '',
                            V_P_COMP_CODE: gv_ma_selectedCorpCd,
                            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                            V_P_TXN_ID: '0',
                            V_P_SEQ_NO: '0',
                            V_P_SITE_CODE: '',
                            V_P_DEPT_CODE: '',
                            V_P_POSITION_CODE: '',
                            V_P_WORK_PATTERN_CODE: '',
                            V_P_SHIFT_CODE: '',
                            V_P_EMP_CODE: '',
                            V_P_BASE_YYYYMMDD: '',
                            V_P_WORK_YYYYMMDD: '',
                            V_P_ACCT_YYYYMMDD: '',
                            V_P_HOLIDAY_YN: '',
                            V_P_HOLIDAY2_YN: '',
                            V_P_WORK_DAY_TYPE: '',
                            V_P_TIME_ITEM_CODE: '',
                            V_P_TIME_ITEM_CODE_ORIG: '',
                            V_P_START_DAY_TYPE: '',
                            V_P_TIME_START_HHMM: '',
                            V_P_END_DAY_TYPE: '',
                            V_P_TIME_END_HHMM: '',
                            V_P_CONFIRM_TIME: '',
                            V_P_CONFIRM_YN: '',
                            V_P_MEMO: '',
                            V_P_CAUSE: '',
                            V_P_STATUS_CODE: '',
                            V_P_APPROVE_DATE: '',
                            V_P_SOURCE_TYPE: '',
                            V_P_SOURCE_CODE: '',
                            V_P_NIGHT_TIME_ITEM_CODE: '',
                            V_P_NIGHT_START_DAY_TYPE: '',
                            V_P_NIGHT_START_HHMM: '',
                            V_P_NIGHT_END_DAY_TYPE: '',
                            V_P_NIGHT_END_HHMM: '',
                            V_P_WORK_DATA_SOURCE: '',
                            V_P_TXN_ID_D: temp_txn_id,
                            V_P_VACCINE_WORK_YN: '',
                            V_P_BREAK_APPLY_YN: '',
                            V_P_ALTER_WORK_YN: '',
                            V_P_ALTER_REQ_YN: '',
                            V_P_SHIFT_WORK_YN: '',
                            V_P_BREAK_START_DAY_TYPE1: '',
                            V_P_BREAK_START_HHMM1: '',
                            V_P_BREAK_END_DAY_TYPE1: '',
                            V_P_BREAK_END_HHMM1: '',
                            V_P_DINNER_YN: '',
                            V_P_FORM_ID: p_formId.toUpperCase(),
                            V_P_MENU_ID: p_menuId,
                            V_P_PROC_ID: '',
                            V_P_USERID: '',
                            V_P_PC: ''
                        };

                        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                            getType: 'json',
                            workType: 'APPRCANCEL',
                            cv_count: '0',
                            params: gfnma_objectToString(paramObj)
                        });

                        const data = await postJsonPromise;

                        if (_.isEqual("S", data.resultStatus)) {
                            if (data.resultMessage) {
                                alert(data.resultMessage);
                            }
                            fn_search();
                        } else {
                            alert(data.resultMessage);
                        }
                    }
                }
            }
        }
    }

    const fn_managerAppr = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        if (gfn_comConfirm("Q0000", "근태실적을 승인하시겠습니까?")) {
            let grdRows = gvwShift.getCheckedRows(gvwShift.getColRef("CHK_YN"), true);

            if (grdRows.length > 0) {
                for (var i = 0; i < grdRows.length; i++) {
                    let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
                    let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
                    let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                    let DEPT_CODE = gfn_nvl(gvwShift.getRowData(grdRows[i]).DEPT_CODE);
                    let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
                    let EMP_CODE = gfn_nvl(gvwShift.getRowData(grdRows[i]).EMP_CODE);
                    let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN: '',
                        V_P_LANG_ID: '',
                        V_P_COMP_CODE: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                        V_P_YYYYMMDD_FR: YYYYMMDD_FR,
                        V_P_YYYYMMDD_TO: YYYYMMDD_TO,
                        V_P_SITE_CODE: SITE_CODE,
                        V_P_DEPT_CODE: DEPT_CODE,
                        V_P_JOB_GROUP: JOB_GROUP,
                        V_P_EMP_CODE: EMP_CODE,
                        V_P_EMP_STATE: EMP_STATE,
                        V_P_LOGIN_DEPT_CODE: '',
                        V_P_HR_MANAGER_YN: '',
                        V_P_FORMID: "HRT2320",
                        V_P_FORM_ID: p_formId,
                        V_P_MENU_ID: p_menuId,
                        V_P_PROC_ID: '',
                        V_P_USERID: '',
                        V_P_PC: ''
                    };

                    const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2320List.do", {
                        getType: 'json',
                        workType: 'DETAIL',
                        cv_count: '2',
                        params: gfnma_objectToString(paramObj)
                    });

                    const listData = await postJsonPromiseForList;

                    try {
                        if (_.isEqual("S", listData.resultStatus)) {
                            let temp_txn_id = "";

                            listData.cv_2.forEach((item, index) => {
                                temp_txn_id += item.TXN_ID + "|";
                            });

                            if (temp_txn_id.length > 0) {
                                temp_txn_id = temp_txn_id.substring(0, temp_txn_id.length - 1);

                                var paramObj = {
                                    V_P_DEBUG_MODE_YN: '',
                                    V_P_LANG_ID: '',
                                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                                    V_P_TXN_ID: '0',
                                    V_P_SEQ_NO: '0',
                                    V_P_SITE_CODE: '',
                                    V_P_DEPT_CODE: '',
                                    V_P_POSITION_CODE: '',
                                    V_P_WORK_PATTERN_CODE: '',
                                    V_P_SHIFT_CODE: '',
                                    V_P_EMP_CODE: '',
                                    V_P_BASE_YYYYMMDD: '',
                                    V_P_WORK_YYYYMMDD: '',
                                    V_P_ACCT_YYYYMMDD: '',
                                    V_P_HOLIDAY_YN: '',
                                    V_P_HOLIDAY2_YN: '',
                                    V_P_WORK_DAY_TYPE: '',
                                    V_P_TIME_ITEM_CODE: '',
                                    V_P_TIME_ITEM_CODE_ORIG: '',
                                    V_P_START_DAY_TYPE: '',
                                    V_P_TIME_START_HHMM: '',
                                    V_P_END_DAY_TYPE: '',
                                    V_P_TIME_END_HHMM: '',
                                    V_P_CONFIRM_TIME: '',
                                    V_P_CONFIRM_YN: '',
                                    V_P_MEMO: '',
                                    V_P_CAUSE: '',
                                    V_P_STATUS_CODE: '',
                                    V_P_APPROVE_DATE: '',
                                    V_P_SOURCE_TYPE: '',
                                    V_P_SOURCE_CODE: '',
                                    V_P_NIGHT_TIME_ITEM_CODE: '',
                                    V_P_NIGHT_START_DAY_TYPE: '',
                                    V_P_NIGHT_START_HHMM: '',
                                    V_P_NIGHT_END_DAY_TYPE: '',
                                    V_P_NIGHT_END_HHMM: '',
                                    V_P_WORK_DATA_SOURCE: '',
                                    V_P_TXN_ID_D: temp_txn_id,
                                    V_P_VACCINE_WORK_YN: '',
                                    V_P_BREAK_APPLY_YN: '',
                                    V_P_ALTER_WORK_YN: '',
                                    V_P_ALTER_REQ_YN: '',
                                    V_P_SHIFT_WORK_YN: '',
                                    V_P_BREAK_START_DAY_TYPE1: '',
                                    V_P_BREAK_START_HHMM1: '',
                                    V_P_BREAK_END_DAY_TYPE1: '',
                                    V_P_BREAK_END_HHMM1: '',
                                    V_P_DINNER_YN: '',
                                    V_P_FORM_ID: p_formId.toUpperCase(),
                                    V_P_MENU_ID: p_menuId,
                                    V_P_PROC_ID: '',
                                    V_P_USERID: '',
                                    V_P_PC: ''
                                };

                                const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                                    getType: 'json',
                                    workType: 'MANAGERAPPR',
                                    cv_count: '0',
                                    params: gfnma_objectToString(paramObj)
                                });

                                const data = await postJsonPromise;

                                if (_.isEqual("S", data.resultStatus)) {
                                    if (data.resultMessage) {
                                        alert(data.resultMessage);
                                    }
                                    fn_search();
                                } else {
                                    alert(data.resultMessage);
                                }
                            }
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
            } else {
                //개별취소처리
                let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
                if (grdRows.length > 0) {
                    let temp_txn_id = "";
                    let IntRowCount = 0;

                    grdRows.forEach((item, index) => {
                        IntRowCount = IntRowCount + 1;
                        temp_txn_id += bandgvwInfo.getCellData(item, bandgvwInfo.getColRef("TXN_ID")) + "|";
                    });

                    if (IntRowCount == 0) {
                        gfn_comAlert("E0000", "승인할 데이타가 없습니다.");
                        return false;
                    } else {
                        temp_txn_id = temp_txn_id.substring(0, temp_txn_id.length - 1);

                        var paramObj = {
                            V_P_DEBUG_MODE_YN: '',
                            V_P_LANG_ID: '',
                            V_P_COMP_CODE: gv_ma_selectedCorpCd,
                            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                            V_P_TXN_ID: '0',
                            V_P_SEQ_NO: '0',
                            V_P_SITE_CODE: '',
                            V_P_DEPT_CODE: '',
                            V_P_POSITION_CODE: '',
                            V_P_WORK_PATTERN_CODE: '',
                            V_P_SHIFT_CODE: '',
                            V_P_EMP_CODE: '',
                            V_P_BASE_YYYYMMDD: '',
                            V_P_WORK_YYYYMMDD: '',
                            V_P_ACCT_YYYYMMDD: '',
                            V_P_HOLIDAY_YN: '',
                            V_P_HOLIDAY2_YN: '',
                            V_P_WORK_DAY_TYPE: '',
                            V_P_TIME_ITEM_CODE: '',
                            V_P_TIME_ITEM_CODE_ORIG: '',
                            V_P_START_DAY_TYPE: '',
                            V_P_TIME_START_HHMM: '',
                            V_P_END_DAY_TYPE: '',
                            V_P_TIME_END_HHMM: '',
                            V_P_CONFIRM_TIME: '',
                            V_P_CONFIRM_YN: '',
                            V_P_MEMO: '',
                            V_P_CAUSE: '',
                            V_P_STATUS_CODE: '',
                            V_P_APPROVE_DATE: '',
                            V_P_SOURCE_TYPE: '',
                            V_P_SOURCE_CODE: '',
                            V_P_NIGHT_TIME_ITEM_CODE: '',
                            V_P_NIGHT_START_DAY_TYPE: '',
                            V_P_NIGHT_START_HHMM: '',
                            V_P_NIGHT_END_DAY_TYPE: '',
                            V_P_NIGHT_END_HHMM: '',
                            V_P_WORK_DATA_SOURCE: '',
                            V_P_TXN_ID_D: temp_txn_id,
                            V_P_VACCINE_WORK_YN: '',
                            V_P_BREAK_APPLY_YN: '',
                            V_P_ALTER_WORK_YN: '',
                            V_P_ALTER_REQ_YN: '',
                            V_P_SHIFT_WORK_YN: '',
                            V_P_BREAK_START_DAY_TYPE1: '',
                            V_P_BREAK_START_HHMM1: '',
                            V_P_BREAK_END_DAY_TYPE1: '',
                            V_P_BREAK_END_HHMM1: '',
                            V_P_DINNER_YN: '',
                            V_P_FORM_ID: p_formId.toUpperCase(),
                            V_P_MENU_ID: p_menuId,
                            V_P_PROC_ID: '',
                            V_P_USERID: '',
                            V_P_PC: ''
                        };

                        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                            getType: 'json',
                            workType: 'MANAGERAPPR',
                            cv_count: '0',
                            params: gfnma_objectToString(paramObj)
                        });

                        const data = await postJsonPromise;

                        if (_.isEqual("S", data.resultStatus)) {
                            if (data.resultMessage) {
                                alert(data.resultMessage);
                            }
                            fn_search();
                        } else {
                            alert(data.resultMessage);
                        }
                    }
                }
            }
        }
    }

    const fn_confirm = async function() {
        let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
        let IntRowCount3 = 0;

        if (grdRows.length > 0) {
            grdRows.forEach((item, index) => {
                if (gfn_nvl(bandgvwInfo.getRowData(item).TXN_ID) == "" || parseInt(gfn_nvl(bandgvwInfo.getRowData(item).TXN_ID)) == 0) {
                    IntRowCount3 = IntRowCount3 + 1;
                }
            });

            if (IntRowCount3 != 0) {
                gfn_comAlert("E0000", "저장후 실행하십시요.");
                return;
            }

            let IntRowCount = 0;
            let temp_txn_id = "";

            grdRows.forEach((item, index) => {
                IntRowCount = IntRowCount + 1;
                temp_txn_id += bandgvwInfo.getCellData(item, bandgvwInfo.getColRef("TXN_ID")) + "|";
            });

            if(IntRowCount == 0) {
                gfn_comAlert("E0000", "확정할 데이타가 없습니다.");
                return;
            } else {
                temp_txn_id = temp_txn_id.substring(0, temp_txn_id.length - 1);

                var paramObj = {
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_TXN_ID: '0',
                    V_P_SEQ_NO: '0',
                    V_P_SITE_CODE: '',
                    V_P_DEPT_CODE: '',
                    V_P_POSITION_CODE: '',
                    V_P_WORK_PATTERN_CODE: '',
                    V_P_SHIFT_CODE: '',
                    V_P_EMP_CODE: '',
                    V_P_BASE_YYYYMMDD: '',
                    V_P_WORK_YYYYMMDD: '',
                    V_P_ACCT_YYYYMMDD: '',
                    V_P_HOLIDAY_YN: '',
                    V_P_HOLIDAY2_YN: '',
                    V_P_WORK_DAY_TYPE: '',
                    V_P_TIME_ITEM_CODE: '',
                    V_P_TIME_ITEM_CODE_ORIG: '',
                    V_P_START_DAY_TYPE: '',
                    V_P_TIME_START_HHMM: '',
                    V_P_END_DAY_TYPE: '',
                    V_P_TIME_END_HHMM: '',
                    V_P_CONFIRM_TIME: '',
                    V_P_CONFIRM_YN: '',
                    V_P_MEMO: '',
                    V_P_CAUSE: '',
                    V_P_STATUS_CODE: '',
                    V_P_APPROVE_DATE: '',
                    V_P_SOURCE_TYPE: '',
                    V_P_SOURCE_CODE: '',
                    V_P_NIGHT_TIME_ITEM_CODE: '',
                    V_P_NIGHT_START_DAY_TYPE: '',
                    V_P_NIGHT_START_HHMM: '',
                    V_P_NIGHT_END_DAY_TYPE: '',
                    V_P_NIGHT_END_HHMM: '',
                    V_P_WORK_DATA_SOURCE: '',
                    V_P_TXN_ID_D: temp_txn_id,
                    V_P_VACCINE_WORK_YN: '',
                    V_P_BREAK_APPLY_YN: '',
                    V_P_ALTER_WORK_YN: '',
                    V_P_ALTER_REQ_YN: '',
                    V_P_SHIFT_WORK_YN: '',
                    V_P_BREAK_START_DAY_TYPE1: '',
                    V_P_BREAK_START_HHMM1: '',
                    V_P_BREAK_END_DAY_TYPE1: '',
                    V_P_BREAK_END_HHMM1: '',
                    V_P_DINNER_YN: '',
                    V_P_FORM_ID: p_formId.toUpperCase(),
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                };

                const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                    getType: 'json',
                    workType: 'CONFIRM',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    fn_search();
                } else {
                    alert(data.resultMessage);
                }
            }
        } else {
            gfn_comAlert("E0000", "확정대상을 선택하십시요.");
            return;
        }
    }

    const fn_cancel = async function() {
        if (gfn_comConfirm("Q0000", "기존 확정된 근태실적을 취소하시겠습니까?")) {
            let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
            let temp_txn_id = "";
            let IntRowCount = 0;

            grdRows.forEach((item, index) => {
                IntRowCount = IntRowCount + 1;
                temp_txn_id += bandgvwInfo.getCellData(item, bandgvwInfo.getColRef("TXN_ID")) + "|";
            });

            if(IntRowCount == 0) {
                gfn_comAlert("E0000", "취소할 데이타가 없습니다.");
                return;
            } else {
                temp_txn_id = temp_txn_id.substring(0, temp_txn_id.length - 1);

                var paramObj = {
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_TXN_ID: '0',
                    V_P_SEQ_NO: '0',
                    V_P_SITE_CODE: '',
                    V_P_DEPT_CODE: '',
                    V_P_POSITION_CODE: '',
                    V_P_WORK_PATTERN_CODE: '',
                    V_P_SHIFT_CODE: '',
                    V_P_EMP_CODE: '',
                    V_P_BASE_YYYYMMDD: '',
                    V_P_WORK_YYYYMMDD: '',
                    V_P_ACCT_YYYYMMDD: '',
                    V_P_HOLIDAY_YN: '',
                    V_P_HOLIDAY2_YN: '',
                    V_P_WORK_DAY_TYPE: '',
                    V_P_TIME_ITEM_CODE: '',
                    V_P_TIME_ITEM_CODE_ORIG: '',
                    V_P_START_DAY_TYPE: '',
                    V_P_TIME_START_HHMM: '',
                    V_P_END_DAY_TYPE: '',
                    V_P_TIME_END_HHMM: '',
                    V_P_CONFIRM_TIME: '',
                    V_P_CONFIRM_YN: '',
                    V_P_MEMO: '',
                    V_P_CAUSE: '',
                    V_P_STATUS_CODE: '',
                    V_P_APPROVE_DATE: '',
                    V_P_SOURCE_TYPE: '',
                    V_P_SOURCE_CODE: '',
                    V_P_NIGHT_TIME_ITEM_CODE: '',
                    V_P_NIGHT_START_DAY_TYPE: '',
                    V_P_NIGHT_START_HHMM: '',
                    V_P_NIGHT_END_DAY_TYPE: '',
                    V_P_NIGHT_END_HHMM: '',
                    V_P_WORK_DATA_SOURCE: '',
                    V_P_TXN_ID_D: temp_txn_id,
                    V_P_VACCINE_WORK_YN: '',
                    V_P_BREAK_APPLY_YN: '',
                    V_P_ALTER_WORK_YN: '',
                    V_P_ALTER_REQ_YN: '',
                    V_P_SHIFT_WORK_YN: '',
                    V_P_BREAK_START_DAY_TYPE1: '',
                    V_P_BREAK_START_HHMM1: '',
                    V_P_BREAK_END_DAY_TYPE1: '',
                    V_P_BREAK_END_HHMM1: '',
                    V_P_DINNER_YN: '',
                    V_P_FORM_ID: p_formId.toUpperCase(),
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                };

                const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2310.do", {
                    getType: 'json',
                    workType: 'CANCEL',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    fn_search();
                } else {
                    alert(data.resultMessage);
                }
            }
        }
    }

    const fn_approval = async function() {
        // TODO : 원래 소스에서 기능구현 안되어있음
    }

    const fn_confimHist = async function () {
        // TODO : 원래 소스에서 기능구현 안되어있음
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>