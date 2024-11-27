<%
    /**
     * @Class Name 		: hrt2516.jsp
     * @Description 	: 월근태집계(기술) 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.10.29
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.10.29   	이경한		최초 생성
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
    <title>title : 월근태집계(기술)</title>
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
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="월근태내역 집계 취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnSummary" name="btnSummary" uitype="normal" text="근태집계" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_summary"></sbux-button>
                <sbux-button id="btnCheck" name="btnCheck" uitype="normal" text="체크리스트조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_check"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_PAY_AREA_TYPE" uitype="single" jsondata-ref="jsonPayAreaType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">귀속년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMM"
                                name="SRCH_YYYYMM"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                style="width:100%;"
                                onchange="fn_valueChangeForYyyymm(this)"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td colspan="3"></td>
                    <th scope="row" class="th_bg_search">근태일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_WORK_START_DAY"
                                name="SRCH_WORK_START_DAY"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_WORK_END_DAY"
                                name="SRCH_WORK_END_DAY"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                        />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">급여체계</th>
                    <td colspan="3" class="td_input">
                      <sbux-select id="SRCH_PAY_GROUP_CODE" uitype="single" jsondata-ref="jsonPayGroupCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
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
                    <th scope="row" class="th_bg_search">직종</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                  <th scope="row" class="th_bg_search">비고</th>
                  <td colspan="9" class="td_input">
                    <sbux-input id="SRCH_MEMO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                  </td>
                  <td></td>
                  <td colspan="10" class="td_input">
                    <sbux-checkbox
                            uitype="normal"
                            id="SRCH_MONTH_TYPE_YN"
                            name="SRCH_MONTH_TYPE_YN"
                            uitype="normal"
                            class="form-control input-sm"
                            text="소급계산"
                            true-value="Y" false-value="N"
                    />
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
                                <span>집계이력</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwStatus" style="height:580px;"></div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>월근태마감체크리스트</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwCheck" style="height:580px;"></div>
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
    var jsonPayAreaType = []; // 급여영역
    var jsonPayGroupCode = []; // 급여체계
    var jsonJobGroup = []; // 직군
    var jsonTimeSummaryActionType = []; // 처리구분
    var jsonTimeItemCode = []; // 근태항목
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책
    var jsonJobRank = []; // 직급
    var jsonEmpState = []; // 재직구분

    //grid 초기화
    var gvwStatus; 			// 그리드를 담기위한 객체 선언
    var gvwCheck;

    var jsonHistoryList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonCheckList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['gvwCheck'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
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
            // 급여영역
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 급여체계
            gfnma_setComSelect(['SRCH_PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP', 'gvwCheck'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 처리구분
            gfnma_setComSelect(['gvwStatus'], jsonTimeSummaryActionType, 'L_HRT008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 처리구분
            gfnma_setComSelect(['gvwCheck'], jsonTimeItemCode, 'L_HRT004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwCheck'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwCheck'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['gvwCheck'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect([''], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwStatusGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwStatus';
        SBGridProperties.id 				= 'gvwStatus';
        SBGridProperties.jsonref 			= 'jsonHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["차수"],         ref: 'SEQ',    type:'output',  	width:'40px',  style:'text-align:left'},
            {caption: ["처리구분"], 		ref: 'TIME_SUMMARY_ACTION_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTimeSummaryActionType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["생성자"],         ref: 'INSERT_USERID',    type:'output',  	width:'100px',  style:'text-align:left'},/*
            {caption: ["생성일시"],         ref: 'INSERT_TIME',    type:'output',  	width:'130px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd HH:mm:ss'},
                format : {type:'date', rule:'yyyy-mm-dd HH:mm:ss', origin:'MM/DD/YY  HH:mm:ss '}
                , disabled: true
            },
            {caption: ["종료일시"],         ref: 'ACTION_END_TIME',    type:'output',  	width:'75px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd HH:mm:ss'},
                format : {type:'date', rule:'yyyy-mm-dd HH:mm:ss', origin:'MM/DD/YY  HH:mm:ss '}
                , disabled: true
            },*/
            {caption: ["생성일시"],         ref: 'INSERT_TIME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["종료일시"],         ref: 'ACTION_END_TIME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["생성PC"],         ref: 'INSERT_PC',    type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["집계조건"],       ref: 'TOT_COND', 		type:'output',  	width:'450px',  	style:'text-align:left'},
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'200px',  style:'text-align:right'},
        ];

        gvwStatus = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwCheckGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwCheck';
        SBGridProperties.id 				= 'gvwCheck';
        SBGridProperties.jsonref 			= 'jsonCheckList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["선택여부"],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'69px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["순번"],         ref: 'TXN_ID',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["일자"],         ref: 'YYYYMMDD',    type:'output',  	width:'89px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'128px',  style:'text-align:right'},
            {caption: ["부서"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["사원명"],         ref: 'EMP_NAME',    type:'output',  	width:'120px',  style:'text-align:right'},
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'82px',  style:'text-align:right'},
            {caption: ["근태항목"], 		ref: 'TIME_ITEM_CODE',   	    type:'combo', style:'text-align:left' ,width: '110px',
                typeinfo: {
                    ref			: 'jsonTimeItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["직종"], 		ref: 'JOB_GROUP',   	    type:'combo', style:'text-align:left' ,width: '96px',
                typeinfo: {
                    ref			: 'jsonJobGroup',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["법인"],         ref: 'COMP_CODE',    type:'output',  	width:'100px',  style:'text-align:right'},
            {caption: ["체크유형"],         ref: 'CHECK_TYPE',    type:'output',  	width:'110px',  style:'text-align:right'},
            {caption: ["설정가이드"],         ref: 'SETUP_GUIDE',    type:'output',  	width:'445px',  style:'text-align:right'},
            {caption: ["직종"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
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
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'200px',  style:'text-align:right'},
        ];

        gvwCheck = _SBGrid.create(SBGridProperties);
    }

    const fn_findDeptCode = function() {
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

    const fn_valueChangeForYyyymm = async function(data) {
        if(gfn_nvl(data) == "") return;

        await fnQRY_P_HRT2510_Q("DATE");

        await fn_search();
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwStatusGrid();
        fn_createGvwCheckGrid();
        await fn_onload();
    });

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_YYYYMM", gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_MONTH_TYPE_YN", "N");
        SBUxMethod.set("SRCH_PAY_AREA_TYPE", "2");
        SBUxMethod.set("SRCH_JOB_GROUP", "3");
        // 근태기간 조회
        await fnQRY_P_HRT2510_Q("DATE");

        await fn_search();
    }

    const fnQRY_P_HRT2510_Q = async function (strWorkType) {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_YYYYMM"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let YYYYMMDD_FR = strWorkType == "CHECK" ? gfn_nvl(SBUxMethod.get("SRCH_WORK_START_DAY")) : "";
        let YYYYMMDD_TO = strWorkType == "CHECK" ? gfn_nvl(SBUxMethod.get("SRCH_WORK_END_DAY")): "";

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2510List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (strWorkType == "HISTORY") {
                    jsonHistoryList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            SEQ : item.SEQ,
                            TIME_SUMMARY_ACTION_TYPE : item.TIME_SUMMARY_ACTION_TYPE,
                            INSERT_USERID : item.INSERT_USERID,
                            INSERT_TIME : item.INSERT_TIME,
                            ACTION_END_TIME : item.ACTION_END_TIME,
                            INSERT_PC : item.INSERT_PC,
                            TOT_COND : item.TOT_COND,
                            MEMO : item.MEMO,
                        }
                        jsonHistoryList.push(msg);
                    });
                    gvwStatus.rebuild();
                    document.querySelector('#listCount').innerText = jsonHistoryList.length;

                    if(jsonHistoryList.length > 0) {
                        gvwStatus.clickRow(1);
                    }
                } else if (strWorkType == "DATE") {
                    if (data.cv_2.length != 0) {
                        SBUxMethod.set("SRCH_WORK_START_DAY", data.cv_2[0]["WORK_START_DAY"]);
                        SBUxMethod.set("SRCH_WORK_END_DAY", data.cv_2[0]["WORK_END_DAY"]);
                    }
                } else if (strWorkType == "CHECK") {
                    jsonCheckList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            CHK_YN : item.CHK_YN,
                            TXN_ID : item.TXN_ID,
                            YYYYMMDD : item.YYYYMMDD,
                            EMP_CODE : item.EMP_CODE,
                            EMP_NAME : item.EMP_NAME,
                            SITE_CODE : item.SITE_CODE,
                            DEPT_CODE : item.DEPT_CODE,
                            DEPT_NAME : item.DEPT_NAME,
                            POSITION_CODE : item.POSITION_CODE,
                            DUTY_CODE : item.DUTY_CODE,
                            JOB_RANK : item.JOB_RANK,
                            JOB_FAMILY : item.JOB_FAMILY,
                            WORK_PATTERN_CODE : item.WORK_PATTERN_CODE,
                            SHIFT_CODE : item.SHIFT_CODE,
                            TIME_ITEM_CODE : item.TIME_ITEM_CODE,
                            JOB_GROUP : item.JOB_GROUP,
                            CHECK_TYPE : item.CHECK_TYPE,
                            SETUP_GUIDE : item.SETUP_GUIDE,
                            SORT_SEQ : item.SORT_SEQ,
                        }
                        jsonCheckList.push(msg);
                    });
                    gvwCheck.rebuild();
                }

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

    const fnSET_P_HRT2510_S5_BAT = async function (strWorkType) {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_YYYYMM"));
        let WORK_START_DAY = gfn_nvl(SBUxMethod.get("SRCH_WORK_START_DAY"));
        let WORK_END_DAY = gfn_nvl(SBUxMethod.get("SRCH_WORK_END_DAY"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let PAY_AREA_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));
        let PAY_GROUP_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAY_GROUP_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let MONTH_TYPE_YN = gfn_nvl(SBUxMethod.get("SRCH_MONTH_TYPE_YN").SRCH_MONTH_TYPE_YN);
        let MEMO = gfn_nvl(SBUxMethod.get("SRCH_MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_WORK_START_DAY : WORK_START_DAY,
            V_P_WORK_END_DAY : WORK_END_DAY,
            V_P_SITE_CODE : SITE_CODE,
            V_P_PAY_AREA_TYPE : PAY_AREA_TYPE,
            V_P_PAY_GROUP_CODE : PAY_GROUP_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_MONTH_TYPE_YN : MONTH_TYPE_YN,
            V_P_MEMO : MEMO,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/insertHrt2510ForBat.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
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
        await fnQRY_P_HRT2510_Q("HISTORY"); // 집계현황 조회
    }

    const fn_cancel = async function() {
        if (await fnSET_P_HRT2510_S5_BAT("CANCEL")) {
            await fn_search();
        }
    }

    const fn_summary = async function() {
        if (await fnSET_P_HRT2510_S5_BAT("SUMMARY")) {
            await fn_search();
        }
    }

    const fn_check = async function() {
        await fnQRY_P_HRT2510_Q("CHECK"); // 집계현황 조회
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>