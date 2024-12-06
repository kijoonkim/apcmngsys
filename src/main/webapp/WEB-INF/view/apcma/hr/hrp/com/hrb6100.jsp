<%
    /**
     * @Class Name 		: hrb6100.jsp
     * @Description 	: 비과세 및 감면 소득 코드 정보 화면
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
    <title>title : 비과세 및 감면 소득 코드 정보</title>
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
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>기준년도</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
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
                                    <span>기본정보</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:1%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:31%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">기준년도</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="YYYY"
                                                name="YYYY"
                                                date-format="yyyy"
                                                datepicker-mode="year"
                                                class="form-control pull-right input-sm-ast inpt_data_reqed input-sm table-datepicker-ma"
                                                onchange="fn_srchYyyy(SRCH_YYYY)"
                                                group-id="panInfo"
                                                required
                                        />
                                    </td>
                                    <td colspan="4"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">적용기간</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPLY_START_DATE"
                                                name="APPLY_START_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                group-id="panInfo"
                                                required
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <span> ~ </span>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPLY_END_DATE"
                                                name="APPLY_END_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                group-id="panInfo"
                                                required
                                        />
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
                                    <td colspan="5" class="td_input">
                                        <sbux-textarea id="MEMO" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>비과세 및 감면 소득 코드 정보</span>
                                </li>
                            </ul>
                            <div style="margin-left: auto;">
                                <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-gvwDetail" style="height:460px;"></div>
                        </div>
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
    var editType			= "N";

    var jsonReceiptCode = []; // 영수증기재란
    var jsonTaxFreeLimitPeriod = []; // 비과세한도기준

    //grid 초기화
    var gvwMaster; 			// 그리드를 담기위한 객체 선언
    var gvwDetail;

    var jsonBaseYearList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonTaxFreeList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 급여일
            gfnma_setComSelect(['gvwDetail'], jsonReceiptCode, 'L_HRB006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 비과세한도기준
            gfnma_setComSelect(['gvwDetail'], jsonTaxFreeLimitPeriod, 'L_HRB007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwMasterGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwMaster';
        SBGridProperties.id 				= 'gvwMaster';
        SBGridProperties.jsonref 			= 'jsonBaseYearList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["기준년도"],         ref: 'YYYY',    type:'inputdate',  	width:'70px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy'},
                format : {type:'date', rule:'yyyy', origin:'YYYY'}
                , disabled: true
            },
            {caption: ["적용시작일"],         ref: 'APPLY_START_DATE',    type:'inputdate',  	width:'90px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["적용종료일"],         ref: 'APPLY_END_DATE',    type:'inputdate',  	width:'90px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["메모"],         ref: 'MEMO',    type:'output',  	width:'100px',  style:'text-align:left'}
        ];

        gvwMaster = _SBGrid.create(SBGridProperties);
        gvwMaster.bind('click', 'fn_view');
        gvwMaster.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonTaxFreeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["비과세코드"],         ref: 'TAX_FREE_CODE',    type:'input',  	width:'90px',  style:'text-align:left'},
            {caption: ["비과세약칭"],         ref: 'TAX_FREE_NAME',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["영수증기재란"], 		ref: 'RECEIPT_CODE',   	    type:'combo', style:'text-align:left' ,width: '90px',
                typeinfo: {
                    ref			: 'jsonReceiptCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비과세항목"],         ref: 'TAX_FREE_DESCR',    type:'input',  	width:'300px',  style:'text-align:left'},
            {caption: ["영수증작성"],			    ref: 'RECEIPT_YN', 			        type:'checkbox',  	width:'80px',  	style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["비과세한도기준"], 		ref: 'TAX_FREE_LIMIT_PERIOD',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonTaxFreeLimitPeriod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비과세한도액"],         ref: 'TAX_FREE_LIMIT_AMT',    type:'input',  	width:'100px',  style:'text-align:right', typeinfo : {mask : {alias : 'numeric'}, maxlength : 19}, format : {type:'number', rule:'#,###', emptyvalue:'0'}}
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function () {
        editType = "U";
        SBUxMethod.attr("YYYY", "readonly", true);
        var nRow = gvwMaster.getRow();
        if(nRow < 1) return;
        var rowData = gvwMaster.getRowData(nRow);

        if(gfn_nvl(rowData) == "") return;

        let YYYY = gfn_nvl(rowData.YYYY);

        SBUxMethod.set("YYYY", gfn_nvl(rowData.YYYY));
        SBUxMethod.set("APPLY_START_DATE", gfn_nvl(rowData.APPLY_START_DATE));
        SBUxMethod.set("APPLY_END_DATE", gfn_nvl(rowData.APPLY_END_DATE));
        SBUxMethod.set("MEMO", gfn_nvl(rowData.MEMO));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb6100List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonTaxFreeList.length = 0;
                data.cv_2.forEach((item, index) => {
                    const msg = {
                        TAX_FREE_CODE : item.TAX_FREE_CODE,
                        TAX_FREE_NAME : item.TAX_FREE_NAME,
                        RECEIPT_CODE : item.RECEIPT_CODE,
                        TAX_FREE_DESCR : item.TAX_FREE_DESCR,
                        RECEIPT_YN : item.RECEIPT_YN,
                        TAX_FREE_LIMIT_PERIOD : item.TAX_FREE_LIMIT_PERIOD,
                        TAX_FREE_LIMIT_AMT : item.TAX_FREE_LIMIT_AMT,
                    }
                    jsonTaxFreeList.push(msg);
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

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwDetail.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwDetail.addRow(true, {RECEIPT_YN: "Y"});
        }else{
            gvwDetail.insertRow(rowVal, 'below', {RECEIPT_YN: "Y"});
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwDetail.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwDetail.deleteRow(rowVal);
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwMasterGrid();
        fn_createGvwDetailGrid();
        await fn_search();
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

    const fn_save = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panInfo"})) {
            return false;
        }

        let YYYY = gfn_nvl(SBUxMethod.get("YYYY"));
        let APPLY_START_DATE = gfn_nvl(SBUxMethod.get("APPLY_START_DATE"));
        let APPLY_END_DATE = gfn_nvl(SBUxMethod.get("APPLY_END_DATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_APPLY_START_DATE : APPLY_START_DATE,
            V_P_APPLY_END_DATE : APPLY_END_DATE,
            V_P_MEMO : MEMO,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6100.do", {
            getType				: 'json',
            workType			: editType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                let updatedData = gvwDetail.getUpdateData(true, 'all');
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
                            V_P_YYYY : YYYY,
                            V_P_TAX_FREE_CODE : item.data.TAX_FREE_CODE,
                            V_P_TAX_FREE_NAME : item.data.TAX_FREE_NAME,
                            V_P_RECEIPT_CODE : item.data.RECEIPT_CODE,
                            V_P_TAX_FREE_DESCR : item.data.TAX_FREE_DESCR,
                            V_P_RECEIPT_YN : item.data.RECEIPT_YN,
                            V_P_TAX_FREE_LIMIT_PERIOD : item.data.TAX_FREE_LIMIT_PERIOD,
                            V_P_TAX_FREE_LIMIT_AMT : item.data.TAX_FREE_LIMIT_AMT,
                            V_P_FORM_ID : p_formId,
                            V_P_MENU_ID : p_menuId,
                            V_P_PROC_ID : '',
                            V_P_USERID : '',
                            V_P_PC : ''
                        })
                    }
                    returnData.push(param);
                });

                if(returnData.length > 0) {
                    const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6100List.do", {listData: returnData});
                    const data = await postJsonPromise;

                    try {
                        if (_.isEqual("S", data.resultStatus)) {
                            gfn_comAlert("I0001");
                            fn_search(gvwMaster.getLastFocusRow());
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
                    fn_search(gvwMaster.getLastFocusRow());
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

    const fn_delete = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panInfo"})) {
            return false;
        }

        let YYYY = gfn_nvl(SBUxMethod.get("YYYY"));
        let APPLY_START_DATE = gfn_nvl(SBUxMethod.get("APPLY_START_DATE"));
        let APPLY_END_DATE = gfn_nvl(SBUxMethod.get("APPLY_END_DATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));

        if(YYYY == "") return;

        if(gfn_comConfirm("Q0000", "["+YYYY+"] 정보를 삭제하시겠습니까?")) {


            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_YYYY : YYYY,
                V_P_APPLY_START_DATE : APPLY_START_DATE,
                V_P_APPLY_END_DATE : APPLY_END_DATE,
                V_P_MEMO : MEMO,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6100.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

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

    const fn_search = async function (rowNum) {
        editType = "N";
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb6100List.do", {
            getType				: 'json',
            workType			: 'MASTER',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonBaseYearList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        YYYY : item.YYYY,
                        APPLY_START_DATE : item.APPLY_START_DATE,
                        APPLY_END_DATE : item.APPLY_END_DATE,
                        MEMO : item.MEMO
                    }
                    jsonBaseYearList.push(msg);
                });
                gvwMaster.rebuild();

                document.querySelector('#listCount').innerText = jsonBaseYearList.length;

                if(jsonBaseYearList.length > 0) {
                    if(rowNum) {
                        gvwMaster.clickRow(rowNum);
                    } else {
                        gvwMaster.clickRow(jsonBaseYearList.length);
                    }
                } else {
                    fn_create();
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

    const fn_create = async function () {
        editType = "N";
        SBUxMethod.attr("YYYY", "readonly", false);
        SBUxMethod.set("YYYY", "");
        SBUxMethod.set("APPLY_START_DATE", "");
        SBUxMethod.set("APPLY_END_DATE", "");
        SBUxMethod.set("MEMO", "");
        jsonTaxFreeList.length = 0;
        gvwDetail.rebuild();
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>