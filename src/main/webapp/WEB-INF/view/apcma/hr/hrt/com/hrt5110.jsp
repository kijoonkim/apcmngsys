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
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="생성취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="연차생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_create"></sbux-button>
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
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonSrchJobGroup" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">연차유형</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_PAID_VACATION_TYPE" uitype="single" jsondata-ref="jsonPaidVacationType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
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
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
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
    var jsonEmpState = []; // 재직상태
    var jsonSrchJobGroup = []; // 직종
    var jsonPaidVacationType = []; // 연차유형
    var jsonSpecialPeriod = []; // 특별휴가기간
    var jsonYn = []; // 차년도존재여부

    //grid 초기화
    var gvwStatus; 			// 그리드를 담기위한 객체 선언

    var jsonStatusList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_YYYY", gfn_dateToYear(new Date()));
        SBUxMethod.set("SRCH_BASE_DATE", gfn_dateToYmd(new Date(new Date().getFullYear(),0,1)));

        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 재직상태
            gfnma_setComSelect(['SRCH_EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonSrchJobGroup, 'L_HRI047_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 연차유형
            gfnma_setComSelect(['SRCH_PAID_VACATION_TYPE', 'gvwStatus'], jsonPaidVacationType, 'L_HRT004_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            // 특별휴가기간
            gfnma_setComSelect(['SRCH_SPECIAL_PERIOD', 'gvwStatus'], jsonSpecialPeriod, 'L_HRT026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차년도존재여부
            gfnma_setComSelect(['SRCH_EXIST_NEXT_YYYY'], jsonYn, 'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    var fn_findDeptCode = function() {
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
        var searchText = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CODE";
        var replaceText1 = "_EMP_NAME";
        var replaceText2 = "_DEPT_CODE";
        var replaceText3 = "_DEPT_NAME";
        var replaceText4 = "_EMP_STATE";
        var strWhereClause = "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.DEPT_NAME LIKE '%" + replaceText1 + "%' AND X.DEPT_CODE ="+replaceText2
            + "%' AND X.DEPT_NAME LIKE '%" + replaceText3 + "%' AND X.EMP_STATE ="+replaceText4;

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , searchText ,""             ,""         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
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

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_search = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let PAID_VACATION_TYPE	    = gfnma_nvl(SBUxMethod.get("SRCH_PAID_VACATION_TYPE"));
        let YYYY	    = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));

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
        console.log('data:', listData);

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                let returnData = listData.cv_1[0];
                SBUxMethod.set("SRCH_BASE_DATE" , gfn_nvl(returnData.BASE_DATE));
                SBUxMethod.set("SRCH_YYYY" , gfn_nvl(returnData.YYYY));
                SBUxMethod.set("SRCH_EXIST_NEXT_YYYY" , gfn_nvl(returnData.EXIST_NEXT_YYYY));
                SBUxMethod.set("SRCH_SITE_CODE" , gfn_nvl(returnData.SITE_CODE));
                SBUxMethod.set("SRCH_PAID_VACATION_TYPE" , gfn_nvl(returnData.PAID_ANNUAL_TYPE));
                SBUxMethod.set("SRCH_SPECIAL_PERIOD" , gfn_nvl(returnData.SPECIAL_PERIOD));
                SBUxMethod.set("SRCH_JOB_GROUP" , gfn_nvl(returnData.JOB_GROUP));

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
        console.log('data:', historyData);
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
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let PAID_VACATION_TYPE	    = gfnma_nvl(SBUxMethod.get("SRCH_PAID_VACATION_TYPE"));
        let YYYY	    = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("SRCH_MEMO"));

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
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("연차가 생성되었습니다.");
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

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwShiftGrid();
        fn_search();
    });

    const fn_unconfirm = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let PAID_VACATION_TYPE	    = gfnma_nvl(SBUxMethod.get("SRCH_PAID_VACATION_TYPE"));
        let YYYY	    = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("SRCH_MEMO"));

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
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("확정취소처리되었습니다.");
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
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let PAID_VACATION_TYPE	    = gfnma_nvl(SBUxMethod.get("SRCH_PAID_VACATION_TYPE"));
        let YYYY	    = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("SRCH_MEMO"));

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
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("확정처리되었습니다.");
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
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let PAID_VACATION_TYPE	    = gfnma_nvl(SBUxMethod.get("SRCH_PAID_VACATION_TYPE"));
        let YYYY	    = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("SRCH_MEMO"));

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
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("연차가 생성취소되었습니다.");
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
        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let PAID_VACATION_TYPE	    = gfnma_nvl(SBUxMethod.get("SRCH_PAID_VACATION_TYPE"));
        let YYYY	    = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        let BASE_DATE	    = gfnma_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let SPECIAL_PERIOD	    = gfnma_nvl(SBUxMethod.get("SRCH_SPECIAL_PERIOD"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP_NAME"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("SRCH_MEMO"));

        if (PAID_VACATION_TYPE == "4050" && SPECIAL_PERIOD == "") {
            gfn_comAlert("특별연차대상기간 선택후 실행하십시요");
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
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("연차가 생성되었습니다.");
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