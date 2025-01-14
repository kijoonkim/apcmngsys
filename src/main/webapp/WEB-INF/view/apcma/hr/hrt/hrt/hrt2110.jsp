<%
    /**
     * @Class Name 		: hrt2110.jsp
     * @Description 	: 근태계획등록(일반) 화면
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
    <title>title : 근태계획등록(일반)</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3>
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="btnResult2" name="btnResult2" uitype="normal" text="결과결재내역" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_result2"></sbux-button>
                    <sbux-button id="btnSummit2" name="btnSummit2" uitype="normal" text="결과결재" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_summit2"></sbux-button>
                    <sbux-button id="btnResult" name="btnResult" uitype="normal" text="신청결재내역" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_result"></sbux-button>
                    <sbux-button id="btnApprove" name="btnApprove" uitype="normal" text="신청결재" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_approve"></sbux-button>
                    <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                    <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
                    <sbux-button id="btnApprCancel" name="btnApprCancel" uitype="normal" text="관리자승인취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_apprCancel"></sbux-button>
                    <sbux-button id="btnManagerAppr" name="btnManagerAppr" uitype="normal" text="관리자승인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_managerAppr"></sbux-button>
                    <sbux-button id="btnList" name="btnList" uitype="normal" text="리스트생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_createList"></sbux-button>
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
                        <th scope="row" class="th_bg_search">직군</th>
                        <td colspan="3" class="td_input">
                            <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                            <sbux-input id="SITE_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                            <sbux-input id="DEPT_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                            <sbux-input id="DEPT_NAME2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                            <sbux-input id="POSITION_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                            <sbux-input id="DUTY_CODE2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                            <sbux-input id="JOB_RANK2" uitype="text" placeholder="" class="form-control input-sm" style="display: none;" readonly></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findEmpCode"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">근태항목</th>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_TIME_ITEM">
                            <sbux-input id="SRCH_TIME_ITEM_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_TIME_ITEM">
                            <sbux-input id="SRCH_TIME_ITEM_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;" data-group="SRCH_TIME_ITEM">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findTimeItemCode"
                            ></sbux-button>
                        </td>
                        <th scope="row" class="th_bg_search">근태일</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="SRCH_START_DATE"
                                    name="SRCH_START_DATE"
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
                                    id="SRCH_END_DATE"
                                    name="SRCH_END_DATE"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                    style="width:100%;"
                                    group-id="panHeader"
                                    required
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">구분</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <sbux-select id="SRCH_TIME_CATEGORY" uitype="single" jsondata-ref="jsonTimeCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg_search">신청상태</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <sbux-select id="SRCH_REQUEST_STATUS_CODE" uitype="single" jsondata-ref="jsonStatusCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg_search">결과상태</th>
                        <td colspan="3" class="td_input" style="border-right:hidden;">
                            <sbux-select id="SRCH_RESULT_STATUS_CODE" uitype="single" jsondata-ref="jsonStatusCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                    <span>근태신청현황</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                            <div style="margin-left: 15%">
                                <span style="background-color: #FFB6C1; width: 70px; height: 25px; margin-left: 10px; float: left; display:grid; align-items:center; text-align: center;">미확정</span>
                                <span style="background-color: #D3D3D3; width: 70px; height: 25px; margin-left: 10px; float: left; display:grid; align-items:center; text-align: center;">미승인</span>
                                <span style="background-color: #ADD8E6; width: 70px; height: 25px; margin-left: 10px; float: left; display:grid; align-items:center; text-align: center;">승인중</span>
                                <span style="background-color: #FF6347; width: 70px; height: 25px; margin-left: 10px; float: left; display:grid; align-items:center; text-align: center;">반려</span>
                            </div>
                            <div style="margin-left: auto;">
                                <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                                <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                                <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-bandgvwInfo" style="height:510px;"></div>
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
    var p_userId = '${loginVO.maUserID}';
    var p_empCode = '${loginVO.maEmpCode}';
    var p_empName = '${loginVO.maEmpName}';
    var p_deptCode = '${loginVO.maDeptCode}';
    var p_deptName = '${loginVO.maDeptName}';
    //-----------------------------------------------------------

    var copyMode            = "clear";
    var bEventEnabled = true;
    var sourceType;

    var jsonSiteCode = []; // 사업장
    var jsonJobGroup = []; // 직군
    var jsonTimeCategory = []; // 구분
    var jsonStatusCode = []; // 상태
    var jsonPositionCode = []; // 직위
    var jsonJobRank = []; // 직급
    var jsonDutyCode = []; // 직책
    var jsonShiftCode = []; // 교대조
    var jsonHolidayYn = []; // 휴일여부
    var jsonWorkDayType = []; // 근무일
    var jsonStartEndDayType = []; // 시작/종료일자유형
    var jsonEmpState = []; // 재직구분

    //grid 초기화
    var bandgvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonTimeShiftApplyList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['bandgvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
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
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 구분
            gfnma_setComSelect(['SRCH_TIME_CATEGORY', 'bandgvwInfo'], jsonTimeCategory, 'L_HRT024_04', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 상태
            gfnma_setComSelect(['SRCH_REQUEST_STATUS_CODE', 'SRCH_RESULT_STATUS_CODE', 'bandgvwInfo'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직위
            gfnma_setComSelect(['bandgvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직급
            gfnma_setComSelect(['bandgvwInfo'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직책
            gfnma_setComSelect(['bandgvwInfo'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 교대조
            gfnma_setComSelect(['bandgvwInfo'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SHWORK_CD', 'SHWORK_TEAM_NM', 'Y', ''),
            // 휴일여부
            gfnma_setComSelect(['bandgvwInfo'], jsonHolidayYn, 'L_HRT015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 근무일
            gfnma_setComSelect(['bandgvwInfo'], jsonWorkDayType, 'L_HRT019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 시작/종료일자유형
            gfnma_setComSelect(['bandgvwInfo'], jsonStartEndDayType, 'L_HRT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['bandgvwInfo'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
        ]);
    }

    function fn_createBandgvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwInfo';
        SBGridProperties.id 				= 'bandgvwInfo';
        SBGridProperties.jsonref 			= 'jsonTimeShiftApplyList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.frozencols = 12;
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
            {caption: ["신청자정보", ""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["신청자정보", "사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '113px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["신청자정보", "상위부서"],         ref: 'PARENT_DEPT_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["신청자정보", "부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청자정보", "부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'103px',  style:'text-align:left'},
            {caption: ["신청자정보", "직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '58px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["신청자정보", "사번"],         ref: 'EMP_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["신청자정보", "이름"],         ref: 'EMP_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["신청자정보", "이름"], 						ref: 'EMP_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findEmpCodeForBandgvwInfo(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["신청자정보", "직책"], 		ref: 'DUTY_CODE',   	    type:'combo', style:'text-align:left' ,width: '63px',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["신청자정보", "직책"], 		ref: 'JOB_RANK',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["주간근무시간", "주간(급여)"],         ref: 'WORK_TIME',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["주간근무시간", "주간(근태)"],         ref: 'WORK_TIME_NET',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["근무조 정보(시작일기준)", "근무패턴"],         ref: 'WORK_PATTERN_CODE',    type:'input',  	width:'98px',  style:'text-align:left'},
            {caption: ["근무조 정보(시작일기준)", "교대조"], 		ref: 'SHIFT_CODE',   	    type:'combo', style:'text-align:left' ,width: '77px',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무조 정보(시작일기준)", "휴일"], 		ref: 'HOLIDAY_YN',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonHolidayYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무조 정보(시작일기준)", "근무일"], 		ref: 'WORK_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonWorkDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["신청기간", "시작일"],       ref: 'TIME_START_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["신청기간", "종료일"],       ref: 'TIME_END_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["신청기간", "일수"],         ref: 'TIME_DAYS',    type:'output',  	width:'77px',  style:'text-align:left'},
            {caption: ["신청기간", "휴일제외일수"],         ref: 'TIME_NET_DAYS',    type:'output',  	width:'79px',  style:'text-align:left'},
            {caption: ["근태항목", "연번"],         ref: 'SEQ',    type:'output',  	width:'51px',  style:'text-align:left'},
            {caption: ["근태항목", "구분"], 		ref: 'TIME_CATEGORY',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTimeCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태항목", "항목코드"],         ref: 'TIME_ITEM_CODE',    type:'output',  	width:'78px',  style:'text-align:left'},
            {caption: ["근태항목", "명칭"],         ref: 'TIME_ITEM_NAME',    type:'output',  	width:'149px',  style:'text-align:left'},
            {caption: ["근태항목", "명칭"], 						ref: 'TIME_ITEM_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findTimeItemCodeForBandgvwInfo(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["시작시각", "구분"], 		ref: 'TIME_START_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작시각", "시각"],        ref: 'TIME_START_HHMM', 		         type:'input',  	width:'60px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["종료시각", "구분"], 		ref: 'TIME_END_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["종료시각", "시각"],        ref: 'TIME_END_HHMM', 		         type:'input',  	width:'60px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["석식시간", "일반직석식?"],        ref: 'DINNER_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["석식시간", "석식시작구분"], 		ref: 'BREAK_START_DAY_TYPE1',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["석식시간", "석식시작시각"],        ref: 'BREAK_START_HHMM1', 		         type:'input',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["석식시간", "석식종료구분"], 		ref: 'BREAK_END_DAY_TYPE1',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["석식시간", "석식종료시각"],        ref: 'BREAK_END_HHMM1', 		         type:'input',  	width:'75px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["내역", "휴게적용여부"],        ref: 'BREAK_APPLY_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["내역", "대체근무여부"],        ref: 'ALTER_WORK_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["내역", "대체근무신청대상"],        ref: 'ALTER_REQ_YN', 		     type:'checkbox',  	width:'96px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["내역", "교대수당대상"],        ref: 'SHIFT_WORK_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["내역", "백신근무"],        ref: 'VACCINE_WORK_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["내역", "시간"],        ref: 'TIME_HOURS', 		         type:'output',  	width:'130px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["내역", "행선지"],         ref: 'DESTINATION',    type:'input',  	width:'98px',  style:'text-align:left'},
            {caption: ["내역", "사유"],         ref: 'CAUSE',    type:'input',  	width:'224px',  style:'text-align:left'},
            {caption: ["내역", "비고"],         ref: 'MEMO',    type:'input',  	width:'200px',  style:'text-align:left'},
            {caption: ["진행상태", "신청일"],         ref: 'REQUEST_DATE',    type:'output',  	width:'81px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["진행상태", "신청상태"], 		ref: 'REQUEST_STATUS_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["진행상태", "신청승인일자"],       ref: 'REQUEST_APPROVE_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["진행상태", "결과상태"],         ref: 'RESULT_STATUS_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["진행상태", "결과승인일자"],       ref: 'RESULT_APPROVE_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["진행상태", "확정여부"],        ref: 'CONFIRM_YN', 		     type:'checkbox',  	width:'68px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["진행상태", "확정일"],       ref: 'TIME_CONFIRM_DATE', 		type:'inputdate',  	width:'94px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["기타정보", "입력원천"],         ref: 'CREATE_TYPE',    type:'output',  	width:'62px',  style:'text-align:left'},
            {caption: ["기타정보", "대체휴가사용여부"],        ref: 'SUBSTITUTE_VACATION_YN', 		     type:'checkbox',  	width:'110px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["기타정보", "휴일근무일"],       ref: 'HOLIDAY_WORK_DATE', 		type:'input',  	width:'90px',  	style:'text-align:left'},
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'output',  	width:'77px',  style:'text-align:left', hidden: true},
            {caption: ["이력순번"],         ref: 'HISTORY_SEQ',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["종료일"],       ref: 'TIME_END_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , hidden: true
            },
            {caption: ["APPR_COUNT1"],         ref: 'APPR_COUNT1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APPR_ID1"],         ref: 'APPR_ID1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청최종승인권자"],         ref: 'FINAL_APPROVER1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청현단계승인권자"],         ref: 'CURRENT_APPROVE_EMP_CODE1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청현단계승인자"],         ref: 'CURRENT_APPROVE_EMP_NAME1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청반려여부"],        ref: 'REQUEST_REJECT_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true, hidden: true},
            {caption: ["신청반려일"],       ref: 'REQUEST_REJECT_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["신청반려사유"],         ref: 'REQUEST_REJECT_REASON',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과승인여부"],        ref: 'RESULT_APPROVE_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true, hidden: true},
            {caption: ["결과반려여부"],        ref: 'RESULT_REJECT_YN', 		     type:'checkbox',  	width:'75px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true, hidden: true},
            {caption: ["결과반려일"],       ref: 'RESULT_REJECT_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["결과반려사유"],         ref: 'RESULT_REJECT_REASON',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과승인count"],         ref: 'APPR_COUNT2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과승인id"],         ref: 'APPR_ID2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청수임자사번"],         ref: 'PROXY_EMP_CODE1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신청수임자명"],         ref: 'PROXY_EMP_NAME1',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과현단계승인권자"],         ref: 'CURRENT_APPROVE_EMP_CODE2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과현단계승인권자명"],         ref: 'CURRENT_APPROVE_EMP_NAME2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과수임자사번"],         ref: 'PROXY_EMP_CODE2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과수임자명"],         ref: 'PROXY_EMP_NAME2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["작성자사용자ID"],         ref: 'INSERT_USERID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["작성자사번"],         ref: 'INSERT_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["결과최종승인자"],         ref: 'FINAL_APPROVER2',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["REFERENCE_TXN_ID"],         ref: 'REFERENCE_TXN_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["교대조(원)"],         ref: 'SHIFT_CODE_ORIG',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},

        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('afterrebuild','fn_bandgvwInfoAfterRebuild');
        bandgvwInfo.bind('afterrefresh','fn_bandgvwInfoAfterRefresh');
        /*bandgvwInfo.bind('dblclick', 'fn_bandgvwInfoDblclick');*/
        bandgvwInfo.bind('valuechanged', 'fn_bandgvwInfoValueChanged');
    }

    const fn_bandgvwInfoAfterRebuild = async function() {
        let bandgvwInfoData = bandgvwInfo.getGridDataAll();

        for(var i = 0; i < bandgvwInfoData.length; i++) {
            let rowData = bandgvwInfo.getRowData(i+2);

            if (rowData.CONFIRM_YN == "N") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FFB6C1');
            } else if (rowData.REQUEST_STATUS_CODE == "1") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#D3D3D3');
            } else if (rowData.REQUEST_STATUS_CODE == "3") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#ADD8E6');
            } else if (rowData.REQUEST_STATUS_CODE == "4") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FF6347');
            }
        }
    }

    const fn_bandgvwInfoAfterRefresh = async function() {
        let bandgvwInfoData = bandgvwInfo.getGridDataAll();

        for(var i = 0; i < bandgvwInfoData.length; i++) {
            let rowData = bandgvwInfo.getRowData(i+2);

            if (rowData.CONFIRM_YN == "N") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FFB6C1');
            } else if (rowData.REQUEST_STATUS_CODE == "1") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#D3D3D3');
            } else if (rowData.REQUEST_STATUS_CODE == "3") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#ADD8E6');
            } else if (rowData.REQUEST_STATUS_CODE == "4") {
                bandgvwInfo.setRowStyle(i+2, 'data', 'background', '#FF6347');
            }
        }
    }

    const fn_bandgvwInfoDblclick = async function() {
        var nRow = bandgvwInfo.getRow();
        var nCol = bandgvwInfo.getCol();

        if(nCol == 6) {
            fn_findEmpCodeForBandgvwInfo(nRow);
        }

        if(nCol == 7) {
            fn_findEmpCodeForBandgvwInfo(nRow);
        }

        if(nCol == 22) {
            fn_findTimeItemCodeForBandgvwInfo(nRow);
        }

        if(nCol == 23) {
            fn_findTimeItemCodeForBandgvwInfo(nRow);
        }
    }

    const fn_bandgvwInfoValueChanged = async function() {
        var nRow = bandgvwInfo.getRow();
        var nCol = bandgvwInfo.getCol();
        var rowData = bandgvwInfo.getRowData(nRow);

        if (nRow < 0)
            return;

        if (bEventEnabled) {
            if ((nCol == bandgvwInfo.getColRef("TIME_START_DATE") || nCol == bandgvwInfo.getColRef("EMP_CODE")) && bEventEnabled ) {
                bEventEnabled = false;
                if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE")) != "" && bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("EMP_CODE")) != "") {
                    let TIME_START_DATE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE")));
                    let TIME_END_DATE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_DATE")));
                    let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                    let DEPT_CODE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("DEPT_CODE")));
                    let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
                    let EMP_CODE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("EMP_CODE")));
                    let TIME_CATEGORY = gfn_nvl(SBUxMethod.get("SRCH_TIME_CATEGORY"));
                    let TIME_ITEM_CODE = gfn_nvl(SBUxMethod.get("SRCH_TIME_ITEM_CODE"));
                    let REQUEST_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_REQUEST_STATUS_CODE"));
                    let RESULT_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_RESULT_STATUS_CODE"));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN	: '',
                        V_P_LANG_ID		: '',
                        V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                        V_P_TIME_START_DATE : TIME_START_DATE,
                        V_P_TIME_END_DATE : TIME_END_DATE,
                        V_P_SITE_CODE : SITE_CODE,
                        V_P_DEPT_CODE : DEPT_CODE,
                        V_P_JOB_GROUP : JOB_GROUP,
                        V_P_EMP_CODE : EMP_CODE,
                        V_P_TIME_CATEGORY : TIME_CATEGORY,
                        V_P_TIME_ITEM_CODE : TIME_ITEM_CODE,
                        V_P_SHIFT_CODE : '',
                        V_P_REQUEST_STATUS_CODE : REQUEST_STATUS_CODE,
                        V_P_RESULT_STATUS_CODE : RESULT_STATUS_CODE,
                        V_P_TXN_ID : 0,
                        V_P_FORM_ID		: p_formId,
                        V_P_MENU_ID		: p_menuId,
                        V_P_PROC_ID		: '',
                        V_P_USERID			: '',
                        V_P_PC				: ''
                    };

                    const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2110List.do", {
                        getType				: 'json',
                        workType			: 'EMP',
                        cv_count			: '2',
                        params				: gfnma_objectToString(paramObj)
                    });

                    const listData = await postJsonPromiseForList;

                    try {
                        if (_.isEqual("S", listData.resultStatus)) {
                            if (listData.cv_1.length == 0) {
                                bEventEnabled = true;
                                return true;
                            }

                            var rs_emp = listData.cv_1[0];
                            if (rs_emp == null || rs_emp.length < 1) {
                                gfn_comAlert("E0000", "해당 직원은 이미 근태신청실적이 존재하거나 근태일정이 등록되어있지 않습니다.");
                                bEventEnabled = true;
                                return;
                            } else {
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TXN_ID"), parseInt(rs_emp["TXN_ID"]));
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("HISTORY_SEQ"), parseInt(rs_emp["HISTORY_SEQ"]));
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("SITE_CODE"), rs_emp["SITE_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("DEPT_CODE"), rs_emp["DEPT_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("DEPT_NAME"), rs_emp["DEPT_NM"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("WORK_PATTERN_CODE"), rs_emp["WORK_PTTRN_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("SHIFT_CODE"), rs_emp["SHWORK_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("WORK_DAY_TYPE"), rs_emp["WORK_DAY_TYPE"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("HOLIDAY_YN"), rs_emp["HLDY_YN"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("POSITION_CODE"), rs_emp["JBPS_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_CATEGORY"), rs_emp["ATDNC_CTGRY"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"), rs_emp["ATDNC_ITEM_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_NAME"), rs_emp["ATDNC_ITEM_NM"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_START_DAY_TYPE"), rs_emp["WRKDY_BGNG_DAY_TYPE"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_START_HHMM"), rs_emp["WRKDY_BGNG_HM"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_DATE"), bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE")).replace("-",""));
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_DAY_TYPE"), rs_emp["ATDNC_END_YMD_TYPE"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_HHMM"), rs_emp["END_TM"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_CONFIRM_DATE"), rs_emp["TM_CFMTN_DT"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("CONFIRM_YN"), rs_emp["CFMTN_YN"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("MEMO"), rs_emp["MEMO"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("DESTINATION"), rs_emp["DEST"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("SEQ"), rs_emp["SEQ"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("REQUEST_STATUS_CODE"), rs_emp["RQST_STTS_CD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("REQUEST_APPROVE_DATE"), rs_emp["RQST_APRV_YMD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("REQUEST_DATE"), rs_emp["RQST_YMD"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("CREATE_TYPE"), rs_emp["WRT_TYPE"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("BREAK_APPLY_YN"), rs_emp["BRTM_APLY_YN"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("ALTER_WORK_YN"), rs_emp["RPLCMT_WORK_YN"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("ALTER_REQ_YN"), rs_emp["RPLCMT_WORK_RQST_YN"]);
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("SHIFT_WORK_YN"), rs_emp["SHWORK_YN"]);
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
            }

            if (nCol == bandgvwInfo.getColRef("TIME_ITEM_CODE") && bEventEnabled) {
                if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_ITEM_CODE")) != "") {
                    if (bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE")) != "" && bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("EMP_CODE")) != "") {
                        let TIME_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_START_DATE"));
                        let TIME_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_END_DATE"));
                        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
                        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
                        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
                        let TIME_CATEGORY = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_CATEGORY")));
                        let TIME_ITEM_CODE = gfn_nvl(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_ITEM_CODE")));
                        let REQUEST_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_REQUEST_STATUS_CODE"));
                        let RESULT_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_RESULT_STATUS_CODE"));

                        var paramObj = {
                            V_P_DEBUG_MODE_YN	: '',
                            V_P_LANG_ID		: '',
                            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                            V_P_TIME_START_DATE : TIME_START_DATE,
                            V_P_TIME_END_DATE : TIME_END_DATE,
                            V_P_SITE_CODE : SITE_CODE,
                            V_P_DEPT_CODE : DEPT_CODE,
                            V_P_JOB_GROUP : JOB_GROUP,
                            V_P_EMP_CODE : EMP_CODE,
                            V_P_TIME_CATEGORY : TIME_CATEGORY,
                            V_P_TIME_ITEM_CODE : TIME_ITEM_CODE,
                            V_P_SHIFT_CODE : '',
                            V_P_REQUEST_STATUS_CODE : REQUEST_STATUS_CODE,
                            V_P_RESULT_STATUS_CODE : RESULT_STATUS_CODE,
                            V_P_TXN_ID : 0,
                            V_P_FORM_ID		: p_formId,
                            V_P_MENU_ID		: p_menuId,
                            V_P_PROC_ID		: '',
                            V_P_USERID			: '',
                            V_P_PC				: ''
                        };

                        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2110List.do", {
                            getType				: 'json',
                            workType			: 'DAY',
                            cv_count			: '2',
                            params				: gfnma_objectToString(paramObj)
                        });

                        const listData = await postJsonPromiseForList;

                        try {
                            if (_.isEqual("S", listData.resultStatus)) {
                                var dtday = listData.cv_2[0];
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("ALTER_WORK_YN"), gfn_nvl(dtday["RPLCMT_WORK_YN"]));
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("ALTER_REQ_YN"), gfn_nvl(dtday["RPLCMT_WORK_RQST_YN"]));
                                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("SHIFT_WORK_YN"), gfn_nvl(dtday["SHWORK_YN"]));

                                if (gfn_nvl(dtday["ATDNC_CTGRY"]) == "5000") {
                                    let timeStartDate = bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE"));
                                    let dt_start = new Date(timeStartDate.substring(0, 4), timeStartDate.substring(4, 6), timeStartDate.substring(6, 8));
                                    let dt_end = new Date(dt_start.getFullYear(), dt_start.getMonth(), (dt_start.getDay() + parseInt(dtday["VCT_DCNT"]) - 1));

                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_DATE"), gfn_dateToYmd(dt_end));
                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_DAYS"), gfn_nvl(dtday["VCT_DCNT"]));
                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_NET_DAYS"), "0");
                                } else if (dtday["WRKDY_BGNG_DAY_TYPE"] != "") {
                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_START_DAY_TYPE"), gfn_nvl(dtday["WRKDY_BGNG_DAY_TYPE"]));
                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_START_HHMM"), gfn_nvl(dtday["WRKDY_BGNG_HM"]));
                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_DAY_TYPE"), gfn_nvl(dtday["ATDNC_END_YMD_TYPE"]));
                                    bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_HHMM"), gfn_nvl(dtday["END_TM"]));
                                } else {
                                    if (nCol == bandgvwInfo.getColRef("TIME_END_DATE") && bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_DATE")) != "") {
                                        if (parseInt(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE")).replace(":", "")) > parseInt(bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_END_DATE")).replace(":", ""))) {
                                            gfn_comAlert("E0000", "근태시작일이 근태종료일이 보다 늦을 수 없습니다.")
                                            bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_END_DATE"), bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE")));;
                                            return;
                                        }

                                        let timeStartDate = bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE"));
                                        let timeEndDate = bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TIME_START_DATE"));

                                        let dt_start = new Date(timeStartDate.substring(0, 4), timeStartDate.substring(4, 6), timeStartDate.substring(6, 8));
                                        let dt_end = new Date(timeEndDate.substring(0, 4), timeEndDate.substring(4, 6), timeEndDate.substring(6, 8));

                                        let diff_day = gfn_diffDate(dt_end, dt_start);

                                        bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_DAYS"), new Date(diff_day).getDay() + 1);
                                        bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_NET_DAYS"), "0");
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
                }
            }
            bEventEnabled = true;
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
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        let TIME_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_START_DATE"));
        let TIME_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_END_DATE"));

        //type B 형 팝업
        var addParams = [TIME_START_DATE, TIME_END_DATE,"'"+ p_userId+"'"];	//bizcompId 의 파라미터에 따라 추가할것

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_EMP_WORK_DATE'
            ,popupType				: 'B'
            ,whereClause			: addParams
            , searchCaptions:    ["부서코드", "부서명", "사원코드", "사원명", "기준일"]
            , searchInputFields: ["DEPT_CD", "DEPT_NM", "EMP_CD"   ,"EMP_NM"  ,"CRTR_YMD"]
            ,searchInputValues		: ["", "", searchCode, searchName, gfn_dateToYmd(new Date())]
            ,searchInputTypes		: ["input", "input", "input", "input", "datepicker"]		//input, datepicker가 있는 경우
            ,height: '400px'
            , tableHeader:       ["사원코드", "사원명", "부서명", "부서명", "입사일", "퇴사일", "직위코드", "직위명", "파트명", "직급"]
            , tableColumnNames:  ["EMP_CD", "EMP_NM", "DEPT_CD", "DEPT_NM", "JNCMP_YMD", "RTRM_YMD", "JBPS_CD", "JBPS_NM", "CSTCT_NM", "JBGD_CD"]
            ,tableColumnWidths		: ["100px", "100px", "80px", "140px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
                SBUxMethod.set('SITE_CODE2', data.SITE_CD);
                SBUxMethod.set('DEPT_CODE2', data.DEPT_CD);
                SBUxMethod.set('DEPT_NAME2', data.DEPT_NM);
                SBUxMethod.set('POSITION_CODE2', data.JBPS_CD);
                SBUxMethod.set('DUTY_CODE2', data.JBTTL_CD);
                SBUxMethod.set('JOB_RANK2', data.JBGD_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'1020px'})
    }

    const fn_findTimeItemCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_TIME_ITEM_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_TIME_ITEM_NAME"));
        var replaceText0 	= "_ATDNC_ITEM_CD_";
        var replaceText1 	= "_ATDNC_ITEM_NM_";
        var strWhereClause 	= "AND ATDNC_ITEM_CD LIKE '%" + replaceText0 + "%' AND ATDNC_ITEM_NM LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '일근태항목');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRT004_06'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", 		"명칭"]
            ,searchInputFields		: ["ATDNC_ITEM_CD", 	"ATDNC_ITEM_NM"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "비고", "분류"]
            ,tableColumnNames		: ["ATDNC_ITEM_CD", "ATDNC_ITEM_NM",  "MEMO", "ATDNC_CTGRY"]
            ,tableColumnWidths		: ["80px", "150px", "200px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_TIME_ITEM_CODE', data.ATDNC_ITEM_CD);
                SBUxMethod.set('SRCH_TIME_ITEM_NAME', data.ATDNC_ITEM_NM);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'650px'});
    }

    const fn_findEmpCodeForBandgvwInfo = function(nRow) {
        var addParams = ["'"+ p_userId+"'"];	//bizcompId 의 파라미터에 따라 추가할것

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_EMP_WORK'
            ,popupType				: 'B'
            ,whereClause			: addParams
            , searchCaptions:    ["부서코드", "부서명", "사원코드", "사원명", "기준일"]
            , searchInputFields: ["DEPT_CD", "DEPT_NM", "EMP_CD"   ,"EMP_NM"  ,"CRTR_YMD"]
            ,searchInputValues		: ["", "", "", "", gfn_dateToYmd(new Date())]
            ,searchInputTypes		: ["input", "input", "input", "input", "datepicker"]		//input, datepicker가 있는 경우
            ,height: '400px'
            , tableHeader:       ["사원코드", "사원명", "부서명", "부서명", "입사일", "퇴사일", "직위코드", "직위명", "파트명", "직급"]
            , tableColumnNames:  ["EMP_CD", "EMP_NM", "DEPT_CD", "DEPT_NM", "JNCMP_YMD", "RTRM_YMD", "JBPS_CD", "JBPS_NM", "CSTCT_NM", "JBGD_CD"]
            ,tableColumnWidths		: ["100px", "100px", "80px", "140px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("DEPT_NAME"), data['DEPT_NM']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("DUTY_CODE"), data['JBTTL_CD']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("JOB_RANK"), data['JBGD_CD']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("EMP_CODE"), data['EMP_CD']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("EMP_NAME"), data['EMP_NM']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("POSITION_CODE"), data['JBPS_CD']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("DEPT_CODE"), data['DEPT_CD']);
            },
        });
        SBUxMethod.openModal('modal-compopup1');
        SBUxMethod.setModalCss('modal-compopup1', {width:'1020px'})
    }

    const fn_findTimeItemCodeForBandgvwInfo = function(nRow) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '일근태항목');
        SBUxMethod.openModal('modal-compopup1');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRT004_06'
            ,popupType				: 'A'
            ,whereClause			: ''
            ,searchCaptions			: ["코드", 		"명칭"]
            ,searchInputFields		: ["ATDNC_ITEM_CD", 	"ATDNC_ITEM_NM"]
            ,searchInputValues		: ["", 			""]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "비고", "분류"]
            ,tableColumnNames		: ["ATDNC_ITEM_CD", "ATDNC_ITEM_NM",  "MEMO", "ATDNC_CTGRY"]
            ,tableColumnWidths		: ["80px", "150px", "200px", "100px"]
            ,itemSelectEvent		: function (data){
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"), data['ATDNC_ITEM_CD']);
                bandgvwInfo.setCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_NAME"), data['ATDNC_ITEM_NM']);
            },
        });

        SBUxMethod.setModalCss('modal-compopup1', {width:'650px'});
    }

    // 행추가
    const fn_addRow = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let rowVal = bandgvwInfo.getRow();

        let TIME_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_START_DATE"));
        let TIME_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_END_DATE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_NAME = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        let SITE_CODE = gfn_nvl(SBUxMethod.get("SITE_CODE2"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("DEPT_CODE2"));
        let DEPT_NAME = gfn_nvl(SBUxMethod.get("DEPT_NAME2"));
        let POSITION_CODE = gfn_nvl(SBUxMethod.get("POSITION_CODE2"));
        let DUTY_CODE = gfn_nvl(SBUxMethod.get("DUTY_CODE2"));
        let JOB_RANK = gfn_nvl(SBUxMethod.get("JOB_RANK2"));

        var data = {
            TIME_START_DATE: TIME_START_DATE,
            TIME_END_DATE: TIME_END_DATE,
            SEQ: 0,
            START_DAY_TYPE: "N0",
            END_DAY_TYPE: "N0",
            CHK_YN : "N",
            DINNER_YN : "N",
            BREAK_APPLY_YN : "N",
            ALTER_WORK_YN : "N",
            ALTER_REQ_YN : "N",
            SHIFT_WORK_YN : "N",
            VACCINE_WORK_YN : "N",
            CONFIRM_YN : "N",
            SUBSTITUTE_VACATION_YN : "N",
            REQUEST_REJECT_YN : "N",
            RESULT_APPROVE_YN : "N",
            RESULT_REJECT_YN : "N"
        };

        if (EMP_CODE != "") {
            data["EMP_CODE"] = EMP_CODE;
            data["EMP_NAME"] = EMP_NAME;
            data["SITE_CODE"] = SITE_CODE;
            data["DEPT_CODE"] = DEPT_CODE;
            data["DEPT_NAME"] = DEPT_NAME;
            data["POSITION_CODE"] = POSITION_CODE;
            data["DUTY_CODE"] = DUTY_CODE;
            data["JOB_RANK"] = JOB_RANK;
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            bandgvwInfo.addRow(true, data);
        }else{
            bandgvwInfo.insertRow(rowVal, 'below', data);
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

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createBandgvwInfoGrid();
        await fn_onload();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 파일첨부
    function cfn_attach() {
        fn_attach();
    }

    // 신규
    function cfn_add() {
        fn_create();
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

    const fn_attach = async function() {
        if (jsonTimeShiftApplyList.length <= 0) {
            return false;
        }

        var nRow = bandgvwInfo.getRow();
        let strFileSourceType = "HRTTIMEDAILYPLAN";
        if (nRow < 0) {
            return;
        }

        let strsource_code = bandgvwInfo.getCellData(nRow,bandgvwInfo.getColRef("TXN_ID"));

        if( gfn_nvl(strFileSourceType) != "" && gfn_nvl(strsource_code) != "" ){
            compopfilemng({
                compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,sourceType		: strFileSourceType
                ,sourceCode		: strsource_code
                ,formID			: p_formId
                ,menuId			: p_menuId
            });
        }
    }

    const fn_create = async function() {
        jsonTimeShiftApplyList.length = 0;
        bandgvwInfo.rebuild();
    }

    const fn_save = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let updatedData = bandgvwInfo.getUpdateData(true, 'all');
        let listData = [];

        updatedData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN           : '',
                    V_P_LANG_ID                 : '',
                    V_P_COMP_CODE               : gfnma_nvl2(gv_ma_selectedCorpCd),
                    V_P_CLIENT_CODE             : gfnma_nvl2(gv_ma_selectedClntCd),

                    V_P_TXN_ID                  : gfnma_nvl2(item.data.TXN_ID) == '' ? 0 : gfnma_nvl2(item.data.TXN_ID),
                    V_P_HISTORY_SEQ             : gfnma_nvl2(item.data.HISTORY_SEQ) == '' ? 0 : gfnma_nvl2(item.data.HISTORY_SEQ),
                    V_P_SITE_CODE               : gfnma_nvl2(item.data.SITE_CODE),
                    V_P_DEPT_CODE               : gfnma_nvl2(item.data.DEPT_CODE),
                    V_P_POSITION_CODE           : gfnma_nvl2(item.data.POSITION_CODE),
                    V_P_WORK_PATTERN_CODE       : gfnma_nvl2(item.data.WORK_PATTERN_CODE),
                    V_P_SHIFT_CODE              : gfnma_nvl2(item.data.SHIFT_CODE),
                    V_P_SHIFT_CODE_ORIG         : gfnma_nvl2(item.data.SHIFT_CODE_ORIG),
                    V_P_EMP_CODE                : gfnma_nvl2(item.data.EMP_CODE),
                    V_P_TIME_ITEM_CODE          : gfnma_nvl2(item.data.TIME_ITEM_CODE),
                    IV_P_TIME_START_DATE        : gfnma_nvl2(item.data.TIME_START_DATE),
                    V_P_TIME_START_DAY_TYPE     : gfnma_nvl2(item.data.TIME_START_DAY_TYPE),
                    V_P_TIME_START_HHMM         : gfnma_nvl2(item.data.TIME_START_HHMM),
                    IV_P_TIME_END_DATE          : gfnma_nvl2(item.data.TIME_END_DATE),
                    V_P_TIME_END_DAY_TYPE       : gfnma_nvl2(item.data.TIME_END_DAY_TYPE),
                    V_P_TIME_END_HHMM           : gfnma_nvl2(item.data.TIME_END_HHMM),
                    V_P_TIME_CONFIRM_DATE       : gfnma_nvl2(item.data.TIME_CONFIRM_DATE),
                    V_P_CONFIRM_YN              : gfnma_nvl2(item.data.CONFIRM_YN),
                    V_P_MEMO                    : gfnma_nvl2(item.data.MEMO),
                    V_P_DESTINATION             : gfnma_nvl2(item.data.DESTINATION),
                    V_P_CAUSE                   : gfnma_nvl2(item.data.CAUSE),
                    V_P_SEQ                     : gfnma_nvl2(item.data.SEQ),
                    V_P_STATUS_CODE             : gfnma_nvl2(item.data.STATUS_CODE),
                    V_P_APPROVE_DATE            : gfnma_nvl2(item.data.APPROVE_DATE),
                    V_P_REQUEST_DATE            : gfnma_nvl2(item.data.REQUEST_DATE),
                    V_P_CREATE_TYPE             : gfnma_nvl2(item.data.CREATE_TYPE),
                    V_P_SUBSTITUTE_VACATION_YN  : gfnma_nvl2(item.data.SUBSTITUTE_VACATION_YN),
                    V_P_TXN_ID_D                : '',
                    V_P_HOLIDAY_WORK_DATE       : gfnma_nvl2(item.data.HOLIDAY_WORK_DATE),
                    V_P_VACCINE_WORK_YN         : gfnma_nvl2(item.data.VACCINE_WORK_YN),
                    V_P_BREAK_APPLY_YN          : gfnma_nvl2(item.data.BREAK_APPLY_YN),
                    V_P_ALTER_WORK_YN           : gfnma_nvl2(item.data.ALTER_WORK_YN),
                    V_P_ALTER_REQ_YN            : gfnma_nvl2(item.data.ALTER_REQ_YN),
                    V_P_SHIFT_WORK_YN           : gfnma_nvl2(item.data.SHIFT_WORK_YN),
                    V_P_BREAK_START_DAY_TYPE1   : gfnma_nvl2(item.data.BREAK_START_DAY_TYPE1),
                    V_P_BREAK_START_HHMM1       : gfnma_nvl2(item.data.BREAK_START_HHMM1),
                    V_P_BREAK_END_DAY_TYPE1     : gfnma_nvl2(item.data.BREAK_END_DAY_TYPE1),
                    V_P_BREAK_END_HHMM1         : gfnma_nvl2(item.data.BREAK_END_HHMM1),
                    V_P_DINNER_YN               : gfnma_nvl2(item.data.DINNER_YN),

                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2110List.do", {listData: listData});

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
    }

    const fn_delete = async function() {
        let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
        if (grdRows.length == 0) {
            return false;
        }

        if(gfn_comConfirm("Q0000", "선택된 사원의 근무신청 내역을 정말 삭제하시겠습니까?")) {
            let IntRowCount = 0;
            let IntRowCount2 = 0;
            let strtxn_id = "";

            grdRows.forEach((item, index) => {
                if (bandgvwInfo.getRowData(item).CONFIRM_YN != "Y") {
                    IntRowCount = IntRowCount + 1;
                    strtxn_id += bandgvwInfo.getRowData(item).TXN_ID + "|";
                } else {
                    if (bandgvwInfo.getRowData(item).REQUEST_STATUS_CODE == "4") {
                        IntRowCount = IntRowCount + 1;
                        strtxn_id += bandgvwInfo.getRowData(item).TXN_ID + "|";
                    } else {
                        IntRowCount2 = IntRowCount2 + 1;
                    }
                }
            });

            if (IntRowCount == 0) {
                gfn_comAlert("E0000", "삭제할 수 있는 근태계획 데이타가 없습니다.");
                return false;
            }

            if (IntRowCount2 > 0) {
                gfn_comAlert("E0000", "근태계획이 확정되어 있어 삭제할 수 없습니다.");
                return false;
            }

            let listData = [];

            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: 0,
                workType: 'DELETE',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_TXN_ID: '',
                    V_P_HISTORY_SEQ: '',
                    V_P_SITE_CODE: '',
                    V_P_DEPT_CODE: '',
                    V_P_POSITION_CODE: '',
                    V_P_WORK_PATTERN_CODE: '',
                    V_P_SHIFT_CODE: '',
                    V_P_SHIFT_CODE_ORIG: '',
                    V_P_EMP_CODE: '',
                    V_P_TIME_ITEM_CODE: '',
                    IV_P_TIME_START_DATE: '',
                    V_P_TIME_START_DAY_TYPE: '',
                    V_P_TIME_START_HHMM: '',
                    IV_P_TIME_END_DATE: '',
                    V_P_TIME_END_DAY_TYPE: '',
                    V_P_TIME_END_HHMM: '',
                    V_P_TIME_CONFIRM_DATE: '',
                    V_P_CONFIRM_YN: '',
                    V_P_MEMO: '',
                    V_P_DESTINATION: '',
                    V_P_CAUSE: '',
                    V_P_SEQ: '',
                    V_P_STATUS_CODE: '',
                    V_P_APPROVE_DATE: '',
                    V_P_REQUEST_DATE: '',
                    V_P_CREATE_TYPE: '',
                    V_P_SUBSTITUTE_VACATION_YN: '',
                    V_P_TXN_ID_D: strtxn_id,
                    V_P_HOLIDAY_WORK_DATE: '',
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
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);

            const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2110List.do", {listData: listData});

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
    }

    const fn_onload = async function () {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        SBUxMethod.set("SRCH_START_DATE",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_END_DATE", gfn_dateToYmd(new Date()));

        await fn_search();
    }

    const fn_search = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let TIME_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_START_DATE"));
        let TIME_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let TIME_CATEGORY = gfn_nvl(SBUxMethod.get("SRCH_TIME_CATEGORY"));
        let TIME_ITEM_CODE = gfn_nvl(SBUxMethod.get("SRCH_TIME_ITEM_CODE"));
        let SHIFT_CODE = gfn_nvl(SBUxMethod.get("SRCH_SHIFT_CODE"));
        let REQUEST_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_REQUEST_STATUS_CODE"));
        let RESULT_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_RESULT_STATUS_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_TIME_START_DATE : TIME_START_DATE,
            V_P_TIME_END_DATE : TIME_END_DATE,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_TIME_CATEGORY : TIME_CATEGORY,
            V_P_TIME_ITEM_CODE : TIME_ITEM_CODE,
            V_P_SHIFT_CODE : '',
            V_P_REQUEST_STATUS_CODE : REQUEST_STATUS_CODE,
            V_P_RESULT_STATUS_CODE : RESULT_STATUS_CODE,
            V_P_TXN_ID : 0,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2110List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {

                jsonTimeShiftApplyList.length = 0;
                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        TXN_ID : item.TRSC_ID,
                        HISTORY_SEQ : item.HSTRY_SEQ,
                        SEQ : item.SEQ,
                        REQUEST_DATE : item.RQST_YMD,
                        SITE_CODE : item.SITE_CD,
                        PARENT_DEPT_CODE : item.PARENT_DEPT_CODE,
                        DEPT_CODE : item.DEPT_CD,
                        PARENT_DEPT_NAME : item.PARENT_DEPT_NAME,
                        DEPT_NAME : item.DEPT_NM,
                        DEPT_CATEGORY : item.DEPT_CTRGY,
                        EMP_CODE : item.EMP_CD,
                        EMP_NAME : item.EMP_NM,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD,
                        JOB_GROUP : item.JOB_GROUP,
                        WORK_PATTERN_CODE : item.WORK_PTTRN_CD,
                        SHIFT_CODE : item.SHWORK_CD,
                        SHIFT_CODE_ORIG : item.SHWORK_CD_ORGNL,
                        HOLIDAY_YN : item.HLDY_YN,
                        WORK_DAY_TYPE : item.WORK_DAY_TYPE,
                        TIME_ITEM_CODE : item.ATDNC_ITEM_CD,
                        TIME_ITEM_NAME : item.ATDNC_ITEM_NM,
                        TIME_CATEGORY : item.ATDNC_CTGRY,
                        TIME_START_DATE : item.WRKDY_BGNG_YMD,
                        TIME_START_DAY_TYPE : item.WRKDY_BGNG_DAY_TYPE,
                        TIME_START_HHMM : item.WRKDY_BGNG_HM,
                        TIME_END_DATE : item.TM_END_YMD,
                        TIME_END_DAY_TYPE : item.ATDNC_END_YMD_TYPE,
                        TIME_END_HHMM : item.END_TM,
                        TIME_DAYS : item.TIME_DAYS,
                        TIME_NET_DAYS : item.TIME_NET_DAYS,
                        TIME_HOURS : item.TIME_HOURS,
                        TIME_CONFIRM_DATE : item.TM_CFMTN_DT,
                        CONFIRM_YN : item.CFMTN_YN,
                        MEMO : item.MEMO,
                        DESTINATION : item.DEST,
                        CAUSE : item.RSN,
                        CREATE_TYPE : item.WRT_TYPE,
                        INSERT_GROUP : item.WRT_GRP,
                        INSERT_GROUP2 : item.INSERT_GROUP2,
                        APPROVE_GROUP : item.APRV_GRP,
                        CURRENT_DUTY_CODE : item.CURRENT_DUTY_CODE,
                        REQUEST_STATUS_CODE : item.RQST_STTS_CD,
                        REQUEST_APPROVE_DATE : item.RQST_APRV_YMD,
                        REQUEST_APPROVE_YN : item.RQST_APRV_STTS,
                        REQUEST_REJECT_YN : item.RQST_RJCT_YN,
                        REQUEST_REJECT_DATE : item.RQST_RJCT_YMD,
                        REQUEST_REJECT_REASON : item.RQST_RJCT_RSN,
                        RESULT_STATUS_CODE : item.RSLT_STTS_CD,
                        RESULT_APPROVE_DATE : item.RSLT_APRV_YMD,
                        RESULT_APPROVE_YN : item.RSLT_APRV_YN,
                        RESULT_REJECT_YN : item.RSLT_RJCT_YN,
                        RESULT_REJECT_DATE : item.RSLT_RJCT_YMD,
                        RESULT_REJECT_REASON : item.RSLT_RJCT_RSN,
                        REQUEST_SOURCE_TYPE : item.REQUEST_SOURCE_TYPE,
                        RESULT_SOURCE_TYPE : item.RESULT_SOURCE_TYPE,
                        APPR_COUNT1 : item.APPR_COUNT1,
                        APPR_ID1 : item.APPR_ID1,
                        APPR_COUNT2 : item.APPR_COUNT2,
                        APPR_ID2 : item.APPR_ID2,
                        FINAL_APPROVER1 : item.FINAL_APPROVER1,
                        FINAL_APPROVER2 : item.FINAL_APPROVER2,
                        INSERT_USERID : item.WRT_USER_ID,
                        INSERT_EMP_CODE : item.INSERT_EMP_CODE,
                        CURRENT_APPROVE_EMP_CODE1 : item.CURRENT_APPROVE_EMP_CODE1,
                        CURRENT_APPROVE_EMP_NAME1 : item.CURRENT_APPROVE_EMP_NAME1,
                        PROXY_EMP_CODE1 : item.PROXY_EMP_CODE1,
                        PROXY_EMP_NAME1 : item.PROXY_EMP_NAME1,
                        CURRENT_APPROVE_EMP_CODE2 : item.CURRENT_APPROVE_EMP_CODE2,
                        CURRENT_APPROVE_EMP_NAME2 : item.CURRENT_APPROVE_EMP_NAME2,
                        PROXY_EMP_CODE2 : item.PROXY_EMP_CODE2,
                        PROXY_EMP_NAME2 : item.PROXY_EMP_NAME2,
                        SUBSTITUTE_VACATION_YN : item.RPLCMT_VCT_YN,
                        REFERENCE_TXN_ID : item.RFRNC_TRSC_ID,
                        HOLIDAY_WORK_DATE : item.HOLIDAY_WORK_DATE,
                        WORK_TIME : item.WORK_TIME,
                        WORK_TIME_NET : item.WORK_TIME_NET,
                        VACCINE_WORK_YN : item.VCNE_WORK_YN,
                        BREAK_APPLY_YN : item.BRTM_APLY_YN,
                        INSERT_USER_NAME : item.INSERT_USER_NAME,
                        LAST_UPDATE_USER_NAME : item.LAST_UPDATE_USER_NAME,
                        CONFIRM_USER_NAME : item.CONFIRM_USER_NAME,
                        LAST_UPDATE_DATE : item.LAST_UPDATE_DATE,
                        ALTER_EMP_CODE : item.RPLCMT_WORK_EMP_CD,
                        ALTER_TIME_ITEM_CODE : item.RPLCMT_WORK_ITEM_CD,
                        ALTER_WORK_YN : item.RPLCMT_WORK_YN,
                        ALTER_REQ_YN : item.RPLCMT_WORK_RQST_YN,
                        SHIFT_WORK_YN : item.SHWORK_YN,
                        BREAK_START_DAY_TYPE1 : item.BRTM_BGNG_DAY_TYPE1,
                        BREAK_START_HHMM1 : item.BRTM_BGNG_TM1,
                        BREAK_END_DAY_TYPE1 : item.BRTM_END_DAY_TYPE1,
                        BREAK_END_HHMM1 : item.BRTM_END_TM1,
                        DINNER_YN : item.DINR_YN
                    }
                    jsonTimeShiftApplyList.push(msg);
                });

                bandgvwInfo.rebuild();

                document.querySelector('#listCount').innerText = jsonTimeShiftApplyList.length;

                let CurRowIndex = 0;

                if (jsonTimeShiftApplyList.length > 0) {
                    $("#btnConfirm").attr("disabled", false);
                    $("#btnCancel").attr("disabled", false);
                    CurRowIndex = 2;
                } else {
                    $("#btnConfirm").attr("disabled", true);
                    $("#btnCancel").attr("disabled", true);
                }

                if (CurRowIndex < 1)
                    return;

                //신청 관련 처리
                var rowData = bandgvwInfo.getRowData(CurRowIndex);

                let strcurrentapprover1 = rowData.CURRENT_APPROVE_EMP_CODE1;
                let strproxyapprover1 = rowData.PROXY_EMP_CODE1;
                let strinsertempcode = rowData.INSERT_EMP_CODE;
                let strstatus_code1 = rowData.REQUEST_STATUS_CODE;
                let intapprcount1 = rowData.APPR_COUNT1;

                if (strstatus_code1 == "1" && strinsertempcode == p_empCode) {
                    $("#btnApprove").attr("disabled", false);
                } else if ((intapprcount1 > 0) && (strstatus_code1 == "3") && (strcurrentapprover1 == p_empCode) && (strcurrentapprover1 != "")) {
                    $("#btnApprove").attr("disabled", false);
                } else if ((intapprcount1 > 0) && (strstatus_code1 == "3") && (strproxyapprover1 == p_empCode) && (strproxyapprover1 != "")) {
                    $("#btnApprove").attr("disabled", false);
                } else {
                    $("#btnApprove").attr("disabled", true);
                }

                //결과 관련 처리
                let strcurrentapprover2 = rowData.CURRENT_APPROVE_EMP_CODE2;
                let strproxyapprover2 = rowData.PROXY_EMP_CODE2;
                let strstatus_code2 = rowData.RESULT_STATUS_CODE;
                let intapprcount2 = rowData.APPR_COUNT2;

                if (strstatus_code1 == "5")  //신청이 승인완료되어야만 결과처리가능
                {
                    if (strstatus_code2 == "1" && strinsertempcode == p_empCode) {
                        $("#btnSummit2").attr("disabled", false);
                    } else if ((intapprcount2 > 0) && (strstatus_code2 == "3") && (strcurrentapprover2 == p_empCode) && (strcurrentapprover2 != "")) {
                        $("#btnSummit2").attr("disabled", false);
                    } else if ((intapprcount2 > 0) && (strstatus_code2 == "3") && (strproxyapprover2 == p_empCode) && (strproxyapprover2 != "")) {
                        $("#btnSummit2").attr("disabled", false);
                    } else {
                        $("#btnSummit2").attr("disabled", true);
                    }
                } else {
                    $("#btnSummit2").attr("disabled", true);
                    $("#btnResult2").attr("disabled", true);
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

    const fn_createList = async function() {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let TIME_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_START_DATE"));
        let TIME_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let TIME_CATEGORY = gfn_nvl(SBUxMethod.get("SRCH_TIME_CATEGORY"));
        let TIME_ITEM_CODE = gfn_nvl(SBUxMethod.get("SRCH_TIME_ITEM_CODE"));
        let SHIFT_CODE = gfn_nvl(SBUxMethod.get("SRCH_SHIFT_CODE"));
        let REQUEST_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_REQUEST_STATUS_CODE"));
        let RESULT_STATUS_CODE = gfn_nvl(SBUxMethod.get("SRCH_RESULT_STATUS_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_TIME_START_DATE : TIME_START_DATE,
            V_P_TIME_END_DATE : TIME_END_DATE,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_TIME_CATEGORY : TIME_CATEGORY,
            V_P_TIME_ITEM_CODE : TIME_ITEM_CODE,
            V_P_SHIFT_CODE : '',
            V_P_REQUEST_STATUS_CODE : REQUEST_STATUS_CODE,
            V_P_RESULT_STATUS_CODE : RESULT_STATUS_CODE,
            V_P_TXN_ID : 0,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2110List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        TXN_ID : item.TRSC_ID,
                        HISTORY_SEQ : item.HSTRY_SEQ,
                        SEQ : item.SEQ,
                        REQUEST_STATUS_CODE : item.RQST_STTS_CD,
                        REQUEST_APPROVE_DATE : item.RQST_APRV_YMD,
                        REQUEST_DATE : item.RQST_YMD,
                        SITE_CODE : item.SITE_CD,
                        DEPT_CODE : item.DEPT_CD,
                        DEPT_NAME : item.DEPT_NM,
                        EMP_CODE : item.EMP_CD,
                        EMP_NAME : item.EMP_NM,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD,
                        JOB_GROUP : item.JOB_GROUP,
                        WORK_PATTERN_CODE : item.WORK_PTTRN_CD,
                        SHIFT_CODE : item.SHWORK_CD,
                        SHIFT_CODE_ORIG : item.SHWORK_CD_ORGNL,
                        HOLIDAY_YN : item.HLDY_YN,
                        WORK_DAY_TYPE : item.WORK_DAY_TYPE,
                        TIME_CATEGORY : item.ATDNC_CTGRY,
                        TIME_ITEM_CODE : item.ATDNC_ITEM_CD,
                        TIME_ITEM_NAME : item.ATDNC_ITEM_NM,
                        TIME_START_DATE : item.WRKDY_BGNG_YMD,
                        TIME_START_DAY_TYPE : item.WRKDY_BGNG_DAY_TYPE,
                        TIME_START_HHMM : item.WRKDY_BGNG_HM,
                        TIME_END_DATE : item.TM_END_YMD,
                        TIME_END_DAY_TYPE : item.ATDNC_END_YMD_TYPE,
                        TIME_END_HHMM : item.END_TM,
                        TIME_CONFIRM_DATE : item.TM_CFMTN_DT,
                        CONFIRM_YN : item.CFMTN_YN,
                        MEMO : item.MEMO,
                        DESTINATION : item.DEST,
                        CAUSE : item.RSN,
                        CREATE_TYPE : item.WRT_TYPE,
                        VACCINE_WORK_YN : item.VCNE_WORK_YN,
                        BREAK_APPLY_YN : item.BRTM_APLY_YN,
                        ALTER_WORK_YN : item.RPLCMT_WORK_YN,
                        ALTER_REQ_YN : item.RPLCMT_WORK_RQST_YN,
                        SHIFT_WORK_YN : item.SHWORK_YN,
                        BREAK_START_DAY_TYPE1 : item.BRTM_BGNG_DAY_TYPE1,
                        BREAK_START_HHMM1 : item.BRTM_BGNG_TM1,
                        BREAK_END_DAY_TYPE1 : item.BRTM_END_DAY_TYPE1,
                        BREAK_END_HHMM1 : item.BRTM_END_TM1,
                        DINNER_YN : item.DINR_YN
                    }
                    jsonTimeShiftApplyList.push(msg);
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

    const fn_managerAppr = async function() {
        let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
        if (grdRows.length == 0) {
            return false;
        }

        if(gfn_comConfirm("Q0000", "선택된 사원의 일근태를 승인하시겠습니까?")) {
            let IntRowCount = 0;
            let IntRowCount2 = 0;
            let strtxn_id = "";

            grdRows.forEach((item, index) => {
                if (bandgvwInfo.getRowData(item).CONFIRM_YN == "Y") {
                    IntRowCount = IntRowCount + 1;
                    strtxn_id += bandgvwInfo.getRowData(item).TXN_ID + "|";
                } else {
                    IntRowCount2 = IntRowCount2 + 1;
                }
            });

            if (IntRowCount == 0) {
                gfn_comAlert("E0000", "승인할 근태계획데이타가 없습니다.");
                return false;
            }

            if (IntRowCount2 > 0) {
                gfn_comAlert("E0000", "미확정된 근태계획 데이타가 존재합니다.");
                return false;
            }

            let listData = [];

            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: 'MANAGERAPPR',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_TXN_ID: '',
                    V_P_HISTORY_SEQ: '',
                    V_P_SITE_CODE: '',
                    V_P_DEPT_CODE: '',
                    V_P_POSITION_CODE: '',
                    V_P_WORK_PATTERN_CODE: '',
                    V_P_SHIFT_CODE: '',
                    V_P_SHIFT_CODE_ORIG: '',
                    V_P_EMP_CODE: '',
                    V_P_TIME_ITEM_CODE: '',
                    IV_P_TIME_START_DATE: '',
                    V_P_TIME_START_DAY_TYPE: '',
                    V_P_TIME_START_HHMM: '',
                    IV_P_TIME_END_DATE: '',
                    V_P_TIME_END_DAY_TYPE: '',
                    V_P_TIME_END_HHMM: '',
                    V_P_TIME_CONFIRM_DATE: '',
                    V_P_CONFIRM_YN: '',
                    V_P_MEMO: '',
                    V_P_DESTINATION: '',
                    V_P_CAUSE: '',
                    V_P_SEQ: '',
                    V_P_STATUS_CODE: '',
                    V_P_APPROVE_DATE: '',
                    V_P_REQUEST_DATE: '',
                    V_P_CREATE_TYPE: '',
                    V_P_SUBSTITUTE_VACATION_YN: '',
                    V_P_TXN_ID_D: strtxn_id,
                    V_P_HOLIDAY_WORK_DATE: '',
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
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);

            const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2110List.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
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
    }

    const fn_apprCancel = async function() {
        let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
        if (grdRows.length == 0) {
            return false;
        }

        if(gfn_comConfirm("Q0000", "선택된 사원의 일근태를 승인취소하시겠습니까?")) {
            let IntRowCount = 0;
            let IntRowCount2 = 0;
            let strtxn_id = "";

            grdRows.forEach((item, index) => {
                if (bandgvwInfo.getRowData(item).CONFIRM_YN == "Y") {
                    IntRowCount = IntRowCount + 1;
                    strtxn_id += bandgvwInfo.getRowData(item).TXN_ID + "|";
                } else {
                    IntRowCount2 = IntRowCount2 + 1;
                }
            });

            if (IntRowCount == 0) {
                gfn_comAlert("E0000", "취소할 근태계획데이타가 없습니다.");
                return false;
            }

            if (IntRowCount2 > 0) {
                gfn_comAlert("E0000", "미확정된 근태계획 데이타가 존재합니다.");
                return false;
            }

            let listData = [];

            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: 'APPRCANCEL',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: '',
                    V_P_LANG_ID: '',
                    V_P_COMP_CODE: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                    V_P_TXN_ID: '',
                    V_P_HISTORY_SEQ: '',
                    V_P_SITE_CODE: '',
                    V_P_DEPT_CODE: '',
                    V_P_POSITION_CODE: '',
                    V_P_WORK_PATTERN_CODE: '',
                    V_P_SHIFT_CODE: '',
                    V_P_SHIFT_CODE_ORIG: '',
                    V_P_EMP_CODE: '',
                    V_P_TIME_ITEM_CODE: '',
                    IV_P_TIME_START_DATE: '',
                    V_P_TIME_START_DAY_TYPE: '',
                    V_P_TIME_START_HHMM: '',
                    IV_P_TIME_END_DATE: '',
                    V_P_TIME_END_DAY_TYPE: '',
                    V_P_TIME_END_HHMM: '',
                    V_P_TIME_CONFIRM_DATE: '',
                    V_P_CONFIRM_YN: '',
                    V_P_MEMO: '',
                    V_P_DESTINATION: '',
                    V_P_CAUSE: '',
                    V_P_SEQ: '',
                    V_P_STATUS_CODE: '',
                    V_P_APPROVE_DATE: '',
                    V_P_REQUEST_DATE: '',
                    V_P_CREATE_TYPE: '',
                    V_P_SUBSTITUTE_VACATION_YN: '',
                    V_P_TXN_ID_D: strtxn_id,
                    V_P_HOLIDAY_WORK_DATE: '',
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
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);

            const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2110List.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
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
    }

    const fn_confirm = async function() {
        let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
        if (grdRows.length == 0) {
            return false;
        }

        let IntRowCount = 0;
        let IntRowCount2 = 0;
        let strtxn_id = "";

        grdRows.forEach((item, index) => {
            if (bandgvwInfo.getRowData(item).CONFIRM_YN != "Y") {
                IntRowCount = IntRowCount + 1;
                strtxn_id += bandgvwInfo.getRowData(item).TXN_ID + "|";
            } else {
                IntRowCount2 = IntRowCount2 + 1;
            }
        });

        if (IntRowCount == 0) {
            gfn_comAlert("E0000", "확정할 데이타가 없습니다.");
            return false;
        }

        if (IntRowCount2 > 0) {
            gfn_comAlert("E0000", "확정된 건이 있습니다.");
            return false;
        }

        let listData = [];

        const param = {
            cv_count: '0',
            getType: 'json',
            rownum: item.rownum,
            workType: 'CONFIRM',
            params: gfnma_objectToString({
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_TXN_ID: '',
                V_P_HISTORY_SEQ: '',
                V_P_SITE_CODE: '',
                V_P_DEPT_CODE: '',
                V_P_POSITION_CODE: '',
                V_P_WORK_PATTERN_CODE: '',
                V_P_SHIFT_CODE: '',
                V_P_SHIFT_CODE_ORIG: '',
                V_P_EMP_CODE: '',
                V_P_TIME_ITEM_CODE: '',
                IV_P_TIME_START_DATE: '',
                V_P_TIME_START_DAY_TYPE: '',
                V_P_TIME_START_HHMM: '',
                IV_P_TIME_END_DATE: '',
                V_P_TIME_END_DAY_TYPE: '',
                V_P_TIME_END_HHMM: '',
                V_P_TIME_CONFIRM_DATE: '',
                V_P_CONFIRM_YN: '',
                V_P_MEMO: '',
                V_P_DESTINATION: '',
                V_P_CAUSE: '',
                V_P_SEQ: '',
                V_P_STATUS_CODE: '',
                V_P_APPROVE_DATE: '',
                V_P_REQUEST_DATE: '',
                V_P_CREATE_TYPE: '',
                V_P_SUBSTITUTE_VACATION_YN: '',
                V_P_TXN_ID_D: strtxn_id,
                V_P_HOLIDAY_WORK_DATE: '',
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
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            })
        }
        listData.push(param);

        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2110List.do", {listData: listData});

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
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

    const fn_cancel = async function() {
        let grdRows = bandgvwInfo.getCheckedRows(bandgvwInfo.getColRef("CHK_YN"), true);
        if (grdRows.length == 0) {
            return false;
        }

        let IntRowCount = 0;
        let IntRowCount2 = 0;
        let strtxn_id = "";

        grdRows.forEach((item, index) => {
            if (bandgvwInfo.getRowData(item).CONFIRM_YN == "Y") {
                IntRowCount = IntRowCount + 1;
                strtxn_id += bandgvwInfo.getRowData(item).TXN_ID + "|";
            } else {
                IntRowCount2 = IntRowCount2 + 1;
            }
        });

        if (IntRowCount == 0) {
            gfn_comAlert("E0000", "취소할 데이타가 없습니다.");
            return false;
        }

        if (IntRowCount2 > 0) {
            gfn_comAlert("E0000", "미확정된 근태계획 데이타가 존재합니다.");
            return false;
        }

        let listData = [];

        const param = {
            cv_count: '0',
            getType: 'json',
            rownum: item.rownum,
            workType: 'CANCEL',
            params: gfnma_objectToString({
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_TXN_ID: '',
                V_P_HISTORY_SEQ: '',
                V_P_SITE_CODE: '',
                V_P_DEPT_CODE: '',
                V_P_POSITION_CODE: '',
                V_P_WORK_PATTERN_CODE: '',
                V_P_SHIFT_CODE: '',
                V_P_SHIFT_CODE_ORIG: '',
                V_P_EMP_CODE: '',
                V_P_TIME_ITEM_CODE: '',
                IV_P_TIME_START_DATE: '',
                V_P_TIME_START_DAY_TYPE: '',
                V_P_TIME_START_HHMM: '',
                IV_P_TIME_END_DATE: '',
                V_P_TIME_END_DAY_TYPE: '',
                V_P_TIME_END_HHMM: '',
                V_P_TIME_CONFIRM_DATE: '',
                V_P_CONFIRM_YN: '',
                V_P_MEMO: '',
                V_P_DESTINATION: '',
                V_P_CAUSE: '',
                V_P_SEQ: '',
                V_P_STATUS_CODE: '',
                V_P_APPROVE_DATE: '',
                V_P_REQUEST_DATE: '',
                V_P_CREATE_TYPE: '',
                V_P_SUBSTITUTE_VACATION_YN: '',
                V_P_TXN_ID_D: strtxn_id,
                V_P_HOLIDAY_WORK_DATE: '',
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
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            })
        }
        listData.push(param);

        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2110List.do", {listData: listData});

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
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

    const fn_approve = async function() {
        var nRow = bandgvwInfo.getRow();

        if (nRow < 2) {
            gfn_comAlert("E0000", "결재신청할 건이 없습니다.");
            return;
        } else {
            if (nRow < 2)
                return;

            if (bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID")) == "") {
                gfn_comAlert("E0000", "결재신청할 건이 없습니다.");
                return;
            }

            let strcurrentapprover1 = bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("CURRENT_APPROVE_EMP_CODE1"));
            let strfinalapprover1 = bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("FINAL_APPROVER1"));
            let intapprcount1 = bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_COUNT1")) == "" ? 0 : parseInt(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_COUNT1")));

            if ((intapprcount1 > 0) && (strcurrentapprover1 != p_empCode) && (strcurrentapprover1 != "")) {
                gfn_comAlert("E0000", "결재권자가 아니므로 결재를 진행할 수 없습니다.");
                return;
            }

            if (bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "1091"|| bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "1092" || bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "1093"
                ||bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "7051"|| bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "7052"|| bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "7053")
            {
                sourceType = "HOLI";
            } else {
                sourceType = "WORKPLAN";
            }

            let apprId = Number(gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_ID1"))));

            compopappvmng({
                workType		: apprId == 0 ? 'TEMPLATE' : 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
                ,compCode		: gv_ma_selectedCorpCd
                ,compCodeNm		: gv_ma_selectedCorpNm
                ,clientCode		: gv_ma_selectedClntCd
                ,apprId			: apprId
                ,sourceNo		: gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID")))
                ,sourceType		: sourceType
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
    }

    const fn_result = async function() {
        var nRow = bandgvwInfo.getRow();

        if (nRow < 2) {
            gfn_comAlert("E0000", "결재조회할 건이 없습니다.");
            return;
        } else {
            var strsourceType = "";

            if (gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID"))) == ""
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_ID1"))) == "0") {
                gfn_comAlert("E0000", "결재조회할 건이 없습니다.");
                return;
            }

            if (gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "1091"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "1092"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "1093"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "7051"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "7052"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "7053") {
                strsourceType = "HOLI";
            } else {
                strsourceType = "WORKPLAN";
            }

            SBUxMethod.attr('modal-compopfim3420', 'header-title', '신청 결재 내역 조회');
            SBUxMethod.openModal('modal-compopfim3420');

            compopfim3420({
                height			: '600px'
                ,param			: {
                    p_appr_id	: gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_ID1")))
                    ,p_doc_id	: gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID")))
                    ,p_doc_type	: strsourceType
                }
            });
        }
    }

    const fn_summit2 = async function() {
        var nRow = bandgvwInfo.getRow();

        if (nRow < 2) {
            gfn_comAlert("E0000", "결재신청할 건이 없습니다.");
            return;
        } else {
            if (nRow < 2)
                return;

            if (bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID")) == "") {
                gfn_comAlert("E0000", "결재신청할 건이 없습니다.");
                return;
            }

            if (bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "1091"
                || bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "1092"
                || bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "1093"
                || bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "7051"
                || bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "7052"
                || bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE")) == "7053") {
                sourceType = "HOLI_RE";
            } else {
                sourceType = "";
            }

            let strcurrentapprover2 = bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("CURRENT_APPROVE_EMP_CODE2"));
            let strfinalapprover2 = bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("FINAL_APPROVER2"));
            let intapprcount2 = bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_COUNT2")) == "" ? 0 : parseInt(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_COUNT2")));

            if ((intapprcount2 > 0) && (strcurrentapprover2 != p_empCode) && (strcurrentapprover2 != "")) {
                gfn_comAlert("E0000", "결재권자가 아니므로 결재를 진행할 수 없습니다.");
                return;
            }

            let apprId = Number(gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_ID2"))));

            compopappvmng({
                workType		: apprId == 0 ? 'TEMPLATE' : 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
                ,compCode		: gv_ma_selectedCorpCd
                ,compCodeNm		: gv_ma_selectedCorpNm
                ,clientCode		: gv_ma_selectedClntCd
                ,apprId			: apprId
                ,sourceNo		: gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID")))
                ,sourceType		: sourceType
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
    }

    const fn_result2 = async function() {
        var nRow = bandgvwInfo.getRow();

        if (nRow < 2) {
            gfn_comAlert("E0000", "결재조회할 건이 없습니다.");
            return;
        } else {
            var strsourceType = "";

            if (gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID"))) == ""
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_ID2"))) == "0") {
                gfn_comAlert("E0000", "결재조회할 건이 없습니다.");
                return;
            }

            if (gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "1091"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "1092"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "1093"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "7051"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "7052"
                || gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TIME_ITEM_CODE"))) == "7053") {
                strsourceType = "HOLI_RE";
            } else {
                strsourceType = "";
            }

            SBUxMethod.attr('modal-compopfim3420', 'header-title', '결과 결재 내역 조회');
            SBUxMethod.openModal('modal-compopfim3420');

            compopfim3420({
                height			: '600px'
                ,param			: {
                    p_appr_id	: gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("APPR_ID2")))
                    ,p_doc_id	: gfn_nvl(bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("TXN_ID")))
                    ,p_doc_type	: strsourceType
                }
            });
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>