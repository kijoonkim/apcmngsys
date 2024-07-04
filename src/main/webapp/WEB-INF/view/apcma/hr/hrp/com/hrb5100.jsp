<%
    /**
     * @Class Name 		: hrb5100.jsp
     * @Description 	: 급여체계 등록 화면
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
    <title>title : 급여체계 등록</title>
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
        </div>
        <div class="box-body">
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <div class="row">
                <div class="col-sm-3">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>급여체계</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwMaster" style="height:605px;"></div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>급여체계기본정보</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">급여체계코드</th>
                                    <td class="td_input">
                                        <sbux-input id="PAY_GROUP_CODE" class="form-control input-sm data_required" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">호봉유형</th>
                                    <td class="td_input">
                                        <sbux-select id="HOBONG_TYPE" uitype="single" jsondata-ref="jsonHobongType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">지급여부</th>
                                    <td class="td_input">
                                        <sbux-checkbox uitype="normal" id="PAY_YN" name="PAY_YN" class="form-control input-sm check" text="지급" true-value="Y" false-value="N"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">급여체계명</th>
                                    <td colspan="5" class="td_input">
                                        <sbux-input id="PAY_GROUP_NAME" class="form-control input-sm data_required" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">급여영역</th>
                                    <td class="td_input">
                                        <sbux-select id="PAY_AREA_TYPE" uitype="single" jsondata-ref="jsonPayAreaType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직군(급여총괄표)</th>
                                    <td class="td_input">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_TOTAL_TBALE_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="PAY_TOTAL_TBALE_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">메모</th>
                                    <td colspan="5" class="td_input">
                                        <sbux-textarea id="DESCR" rows="3" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">정렬순서</th>
                                    <td class="td_input">
                                        <sbux-input id="SORT_SEQ" class="form-control input-sm data_required" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">사용여부</th>
                                    <td class="td_input">
                                        <sbux-checkbox uitype="normal" id="USE_YN" name="USE_YN" class="form-control input-sm check" text="사용" true-value="Y" false-value="N"/>
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                            </table>
                        </div>

                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>사업장별급여/근태기간정보</span>
                                </li>
                            </ul>
                            <div style="margin-left: auto;">
                                <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-bandgvwDetail" style="height:390px;"></div>
                        </div>
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

    var jsonHobongType = []; // 호봉유형
    var jsonPayAreaType = []; // 급여영역
    var jsonPayType = []; // 지급구분
    var jsonPayDayMonthType = []; // 급여월구분
    var jsonPayDayDd = []; // 급여월

    //grid 초기화
    var gvwMaster; 			// 그리드를 담기위한 객체 선언
    var bandgvwDetail;

    var jsonPayGroupList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonPayBySiteList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 호봉유형
            gfnma_setComSelect(['HOBONG_TYPE'], jsonHobongType, 'L_HRB028', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 급여영역
            gfnma_setComSelect(['PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군(급여총괄표)
            gfnma_multiSelectInit({
                target			: ['#PAY_TOTAL_TBALE_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRP035'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                    {caption: "EXTRA_FIELD1", 		ref: 'EXTRA_FIELD1',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 급여영역
            gfnma_setComSelect(['bandgvwDetail'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 급여월구분
            gfnma_setComSelect(['bandgvwDetail'], jsonPayDayMonthType, 'L_HRB016', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 급여일
            gfnma_setComSelect(['bandgvwDetail'], jsonPayDayDd, 'L_HRB005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    function fn_createGvwMasterGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwMaster';
        SBGridProperties.id 				= 'gvwMaster';
        SBGridProperties.jsonref 			= 'jsonPayGroupList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["급여체계코드"],         ref: 'PAY_GROUP_CODE',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["급여체계명"],         ref: 'PAY_GROUP_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["사용"],			    ref: 'USE_YN', 			        type:'checkbox',  	width:'50px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
        ];

        gvwMaster = _SBGrid.create(SBGridProperties);
        gvwMaster.bind('click', 'fn_view');
    }

    function fn_createBandgvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwDetail';
        SBGridProperties.id 				= 'bandgvwDetail';
        SBGridProperties.jsonref 			= 'jsonPayBySiteList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["항목", "지급구분"], 		ref: 'PAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '97px',
                typeinfo: {
                    ref			: 'jsonPayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["급여일", "시작월"],       ref: 'PERIOD_FR', 		type:'datepicker',  	width:'89px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
                , disabled: true
                , hidden: true
            },
            {caption: ["급여일", "종료월"],       ref: 'PERIOD_TO', 		type:'datepicker',  	width:'89px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
                , disabled: true
                , hidden: true
            },
            {caption: ["급여일", "급여월구분"], 		ref: 'PAY_DAY_MONTH_TYPE',   	    type:'combo', style:'text-align:left' ,width: '97px',
                typeinfo: {
                    ref			: 'jsonPayDayMonthType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["급여일", " 급여일"], 		ref: 'PAY_DAY_DD',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonPayDayDd',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["급여산정기준", "급여시작월구분"], 		ref: 'PAY_START_MONTH_TYPE',   	    type:'combo', style:'text-align:left' ,width: '141px',
                typeinfo: {
                    ref			: 'jsonPayDayMonthType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["급여산정기준", "급여시작일"], 		ref: 'PAY_START_DAY_DD',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonPayDayDd',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["급여산정기준", "급여종료월구분"], 		ref: 'PAY_END_MONTH_TYPE',   	    type:'combo', style:'text-align:left' ,width: '141px',
                typeinfo: {
                    ref			: 'jsonPayDayMonthType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["급여산정기준", "급여종료일"], 		ref: 'PAY_END_DAY_DD',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonPayDayDd',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태산정기준", "근태시작월구분"], 		ref: 'WORK_START_MONTH_TYPE',   	    type:'combo', style:'text-align:left' ,width: '141px',
                typeinfo: {
                    ref			: 'jsonPayDayMonthType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태산정기준", "근태시작일"], 		ref: 'WORK_START_DAY_DD',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonPayDayDd',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태산정기준", "근태종료월구분"], 		ref: 'WORK_END_MONTH_TYPE',   	    type:'combo', style:'text-align:left' ,width: '141px',
                typeinfo: {
                    ref			: 'jsonPayDayMonthType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태산정기준", "근태종료일"], 		ref: 'WORK_END_DAY_DD',   	    type:'combo', style:'text-align:left' ,width: '98px',
                typeinfo: {
                    ref			: 'jsonPayDayDd',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["기타", "비례계수"],         ref: 'PAY_PROPORTION_COEF',    type:'input',  	width:'90px',  style:'text-align:right', typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00'}},
            {caption: ["기타", "메모"],         ref: 'MEMO',    type:'input',  	width:'241px',  style:'text-align:left'},
            {caption: ["기타", "사용"],			    ref: 'USE_YN', 			        type:'checkbox',  	width:'63px',  	style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
        ];

        bandgvwDetail = _SBGrid.create(SBGridProperties);
    }

    const fn_view = async function () {
        var nRow = gvwMaster.getRow();
        var rowData = gvwMaster.getRowData(nRow);

        if(gfn_nvl(rowData) == "") return;

        let PAY_GROUP_CODE = gfn_nvl(rowData.PAY_GROUP_CODE)

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_GROUP_CODE : PAY_GROUP_CODE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb5100List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {

                var infoData = data.cv_2[0];

                SBUxMethod.set("PAY_GROUP_CODE", gfn_nvl(infoData.PAY_GROUP_CODE));
                SBUxMethod.set("PAY_GROUP_NAME", gfn_nvl(infoData.PAY_GROUP_NAME));
                SBUxMethod.set("DESCR", gfn_nvl(infoData.DESCR));
                SBUxMethod.set("SORT_SEQ", gfn_nvl(infoData.SORT_SEQ));
                SBUxMethod.set("USE_YN", gfn_nvl(infoData.USE_YN));
                SBUxMethod.set("HOBONG_TYPE", gfn_nvl(infoData.HOBONG_TYPE));
                SBUxMethod.set("PAY_YN", gfn_nvl(infoData.PAY_YN));
                SBUxMethod.set("PAY_AREA_TYPE", gfn_nvl(infoData.PAY_AREA_TYPE));
                gfnma_multiSelectSet('#PAY_TOTAL_TBALE_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.PAY_TOTAL_TBALE_TYPE));

                jsonPayBySiteList.length = 0;
                data.cv_3.forEach((item, index) => {
                    const msg = {
                        PAY_TYPE : item.PAY_TYPE,
                        PAY_DAY_MONTH_TYPE : item.PAY_DAY_MONTH_TYPE,
                        PAY_DAY_DD : item.PAY_DAY_DD,
                        PAY_START_MONTH_TYPE : item.PAY_START_MONTH_TYPE,
                        PAY_START_DAY_DD : item.PAY_START_DAY_DD,
                        PAY_END_MONTH_TYPE : item.PAY_END_MONTH_TYPE,
                        PAY_END_DAY_DD : item.PAY_END_DAY_DD,
                        WORK_START_MONTH_TYPE : item.WORK_START_MONTH_TYPE,
                        WORK_START_DAY_DD : item.WORK_START_DAY_DD,
                        WORK_END_MONTH_TYPE : item.WORK_END_MONTH_TYPE,
                        WORK_END_DAY_DD : item.WORK_END_DAY_DD,
                        MEMO : item.MEMO,
                        PAY_PROPORTION_COEF : item.PAY_PROPORTION_COEF,
                        USE_YN : item.USE_YN,

                    }
                    jsonPayBySiteList.push(msg);
                });
                bandgvwDetail.rebuild();
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
        fn_createGvwMasterGrid();
        fn_createBandgvwDetailGrid();
        fn_search();
    });

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

    const fn_save = async function () {}

    const fn_delete = async function () {}

    const fn_search = async function () {
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_GROUP_CODE : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb5100List.do", {
            getType				: 'json',
            workType			: 'MASTER',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonPayGroupList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_GROUP_CODE : item.PAY_GROUP_CODE,
                        PAY_GROUP_NAME : item.PAY_GROUP_NAME,
                        USE_YN : item.USE_YN,
                        PAY_AREA_TYPE : item.PAY_AREA_TYPE,
                        PAY_TOTAL_TBALE_TYPE : item.PAY_TOTAL_TBALE_TYPE,
                    }
                    jsonPayGroupList.push(msg);
                });
                gvwMaster.rebuild();

                if(jsonPayGroupList.length > 0) {
                    gvwMaster.clickRow(1);
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>