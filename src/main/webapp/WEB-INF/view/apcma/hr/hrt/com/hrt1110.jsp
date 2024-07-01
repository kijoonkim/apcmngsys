<%
    /**
     * @Class Name 		: hrt1110.jsp
     * @Description 	: 근태집계 정보 화면
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
    <title>title : 근태집계 정보</title>
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
                    <col style="width: 60%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">근태집계코드</th>
                    <td class="td_input">
                        <sbux-input id="SRCH_TIME_SUMMARY_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">근태집계명</th>
                    <td class="td_input">
                        <sbux-input id="SRCH_TIME_SUMMARY_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>근태집계 정보</span>
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
                    <div id="sb-area-gvwInfo" style="height:616px;"></div>
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

    var jsonSummaryRule    = []; // 집계기준


    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonDayList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonNeglectOfDutyInfoList = [];

    const fn_initSBSelect = async function() {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        let rst = await Promise.all([
            // 집계기준
            gfnma_setComSelect(['gvwInfo'], jsonSummaryRule, 'L_HRT017', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    // 그리드 생성
    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonNeglectOfDutyInfoList';
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
            {caption: ["근태집계코드"], 		ref: 'TIME_SUMMARY_CODE',   	    type:'input', style:'text-align:left' ,width: '100px'},
            {caption: ["근태집계명"],         ref: 'TIME_SUMMARY_NAME',    type:'input',  	width:'150px',  style:'text-align:left'},
            {caption: ["근태집계필드명"], 	        ref: 'TIME_FIELD_NAME',    	    type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption: ["근태집계적용명"],       ref: 'TIME_SUMMARY_APPLY_NAME', 		type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption: ["집계기준"],       ref: 'SUMMARY_RULE', 		type:'combo',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryRule',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시간집계"],       ref: 'SUMMARY_TIME_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["횟수집계"],       ref: 'SUMMARY_COUNT_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["급여대장출력"],       ref: 'PRINT_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["월근태조회여부"],       ref: 'VIEW_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["월근태정렬순서"],       ref: 'SORT_SEQ', 		type:'input',  	width:'80px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
            {caption: ["일근태조회여부"],       ref: 'DAILY_VIEW_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["일근태정렬순서"],       ref: 'DAILY_SORT_SEQ', 		type:'input',  	width:'101px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["일근태집계"],       ref: 'DAILY_TXN_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["사용"],       ref: 'USE_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["비고"],       ref: 'MEMO', 		type:'input',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwInfoGrid();
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

    const fn_search = async function () {
        let TIME_SUMMARY_CODE = gfnma_nvl(SBUxMethod.get("SRCH_TIME_SUMMARY_CODE"));
        let TIME_SUMMARY_NAME = gfnma_nvl(SBUxMethod.get("SRCH_TIME_SUMMARY_NAME"));

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_TIME_SUMMARY_CODE : TIME_SUMMARY_CODE,
            V_P_TIME_SUMMARY_NAME : TIME_SUMMARY_NAME,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt1110List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonNeglectOfDutyInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        TIME_SUMMARY_CODE : item.TIME_SUMMARY_CODE,
                        TIME_SUMMARY_NAME : item.TIME_SUMMARY_NAME,
                        TIME_FIELD_NAME : item.TIME_FIELD_NAME,
                        SUMMARY_TIME_YN : item.SUMMARY_TIME_YN,
                        SUMMARY_COUNT_YN : item.SUMMARY_COUNT_YN,
                        PRINT_YN : item.PRINT_YN,
                        SORT_SEQ : item.SORT_SEQ,
                        MEMO : item.MEMO,
                        USE_YN : item.USE_YN,
                        DAILY_TXN_YN : item.DAILY_TXN_YN,
                        TIME_SUMMARY_APPLY_NAME : item.TIME_SUMMARY_APPLY_NAME,
                        SUMMARY_RULE : item.SUMMARY_RULE,
                        VIEW_YN : item.VIEW_YN,
                        DAILY_SORT_SEQ : item.DAILY_SORT_SEQ,
                        DAILY_VIEW_YN : item.DAILY_VIEW_YN,
                        CLIENT_CODE : item.CLIENT_CODE,
                        COMP_CODE : item.COMP_CODE
                    }
                    jsonNeglectOfDutyInfoList.push(msg);
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

    const fn_save = async function () {
        let updatedData = gvwInfo.getUpdateData(true, 'all');
        let listData = [];

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
                    V_P_TIME_SUMMARY_CODE: item.data.TIME_SUMMARY_CODE,
                    V_P_TIME_SUMMARY_NAME: item.data.TIME_SUMMARY_NAME,
                    V_P_TIME_SUMMARY_APPLY_NAME: item.data.TIME_SUMMARY_APPLY_NAME,
                    V_P_TIME_FIELD_NAME: item.data.TIME_FIELD_NAME,
                    V_P_SUMMARY_TIME_YN: item.data.SUMMARY_TIME_YN,
                    V_P_SUMMARY_COUNT_YN: item.data.SUMMARY_COUNT_YN,
                    V_P_PRINT_YN: item.data.PRINT_YN,
                    V_P_SORT_SEQ: item.data.SORT_SEQ,
                    V_P_DAILY_TXN_YN: item.data.DAILY_TXN_YN,
                    V_P_USE_YN: item.data.USE_YN,
                    V_P_SUMMARY_RULE: item.data.SUMMARY_RULE,
                    V_P_MEMO: item.data.MEMO,
                    V_P_VIEW_YN: item.data.VIEW_YN,
                    V_P_DAILY_SORT_SEQ: item.data.DAILY_SORT_SEQ,
                    V_P_DAILY_VIEW_YN: item.data.DAILY_VIEW_YN,
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
            const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1110List.do", {listData: listData});

            const data = await postJsonPromise;
            console.log('data:', data);
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>