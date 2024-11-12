<%
    /**
     * @Class Name 		: hrt1310.jsp
     * @Description 	: 근무패턴별 캘린더 화면
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
    <title>title : 근무패턴별 캘린더</title>
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
                <sbux-button id="btnPatternInput" name="btnPatternInput" uitype="normal" text="패턴 등록" class="btn btn-sm btn-outline-danger" onclick="fn_patternInput" ></sbux-button>
                <sbux-button id="btnInitCreate" name="btnInitCreate" uitype="normal" text="초기 생성" class="btn btn-sm btn-outline-danger" onclick="fn_initCreate" ></sbux-button>
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
                    <col style="width: 1%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">조회기간</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMMDD_FR"
                                name="SRCH_YYYYMMDD_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
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
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <th scope="row" class="th_bg">근무패턴</th>
                    <td class="td_input">
                        <%--<sbux-select id="SRCH_WORK_PATTERN_CODE" uitype="single" jsondata-ref="jsonWorkPatternCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_WORK_PATTERN_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_WORK_PATTERN_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="col-sm-10">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>근무패턴</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-bandgvwInfo" style="height:450px;"></div>
                    </div>
                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>근무패턴 설정 체크리스트</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwCheck" style="height:300px;"></div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>교대조 및 휴일</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwColor" style="height:450px;"></div>
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

    var jsonWorkPatternCode = []; // 근무패턴
    var colorList = {};

    //grid 초기화
    var bandgvwInfo; 			// 그리드를 담기위한 객체 선언
    var gvwColor;
    var gvwCheck;

    var jsonPatternList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonPatternListOrigin = [];
    var jsonColorList = [];
    var jsonCheckList = [];


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 근무패턴
            gfnma_setComSelect(['bandgvwInfo'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_WORK_PATTERN_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
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
                    {caption: "근무패턴", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
        ]);
    }

    function fn_createBandgvwInfoGrid(columnList) {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwInfo';
        SBGridProperties.id 				= 'bandgvwInfo';
        SBGridProperties.jsonref 			= 'jsonPatternList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
        SBGridProperties.pastemode = 'mutiple';
        SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.selectcellfocus = true;
        SBGridProperties.updatepastestatus = true;
        SBGridProperties.extendlastcol 		= 'scroll';

        if(columnList != null && columnList.length > 1) {
            SBGridProperties.columns = columnList;
        } else {
            SBGridProperties.columns = [
                {caption: ["근무패턴"], ref: 'WORK_PATTERN_CODE', type: 'combo', style: 'text-align:left', width: '140px',
                    typeinfo: {ref: 'jsonWorkPatternCode', label: 'label', value: 'value', itemcount: 10}
                    , disabled: true}
                ];
        }

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('afterrefresh','fn_bandgvwInfoAfterRefresh');
        bandgvwInfo.bind('afterpaste','fn_bandgvwInfoValueChanged');
        bandgvwInfo.bind('valuechanged','fn_bandgvwInfoValueChanged');
    }

    function fn_createGvwColorGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwColor';
        SBGridProperties.id 				= 'gvwColor';
        SBGridProperties.jsonref 			= 'jsonColorList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["색상"],        ref: 'COLOR_CODE', 		         type:'output',  	width:'90px',  	style:'text-align:left'},
            {caption: ["교대조및휴일"],        ref: 'SHIFT_NAME', 		         type:'output',  	width:'90px',  	style:'text-align:left'},
            {caption: ["SHIFT_CODE"], 		ref: 'SHIFT_CODE',   	    type:'output', style:'text-align:left' ,width: '140px', hidden: true},
        ];

        gvwColor = _SBGrid.create(SBGridProperties);
        gvwColor.bind('afterrebuild','fn_gvwColorAfterRebuild');
    }

    function fn_createGvwCheckGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwCheck';
        SBGridProperties.id 				= 'gvwCheck';
        SBGridProperties.jsonref 			= 'jsonCheckList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["근무패턴코드"], 		ref: 'WORK_PATTERN_CODE',   	    type:'output', style:'text-align:left' ,width: '110px'},
            {caption: ["근무패턴명"],        ref: 'WORK_PATTERN_NAME', 		         type:'output',  	width:'156px',  	style:'text-align:left'},
            {caption: ["체크유형"],       ref: 'CHECK_TYPE', 		type:'output',  	width:'110px',  	style:'text-align:left'},
            {caption: ["일자"],        ref: 'YYYYMMDD', 		         type:'inputdate',  	width:'101px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["휴일여부"],         ref: 'HOLIDAY_YN',    type:'checkbox',  	width:'63px', style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 2 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["설정가이드"],       ref: 'SETUP_GUIDE', 		type:'output',  	width:'445px',  	style:'text-align:left'},
            {caption: ["법인"], 	        ref: 'comp_code',    	    type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
        ];

        gvwCheck = _SBGrid.create(SBGridProperties);
    }

    const fn_bandgvwInfoAfterRefresh = async function() {
        let bandgvwInfoData = bandgvwInfo.getGridDataAll();

        for(var i = 0; i < bandgvwInfoData.length; i++) {
            if(Object.keys(bandgvwInfoData[i]).length > 1) {
                for(var key in bandgvwInfoData[i]) {
                    if(/D(\d{8})/.test(key)) {
                        bandgvwInfo.setCellStyle('color',
                            0, bandgvwInfo.getColRef(key),
                            1, bandgvwInfo.getColRef(key), '#0e3979');
                        bandgvwInfo.setCellStyle('background-color',
                            i+4, bandgvwInfo.getColRef(key),
                            i+4, bandgvwInfo.getColRef(key), colorList[bandgvwInfoData[i][key]]);
                    }
                }
            }
        }

    }

    const fn_bandgvwInfoValueChanged = async function() {
        var nRow = bandgvwInfo.getRow();
        var nCol = bandgvwInfo.getCol();

        if(colorList[bandgvwInfo.getCellData(nRow,nCol)]) {
            bandgvwInfo.setCellStyle('background-color',
                nRow, nCol,
                nRow, nCol, colorList[bandgvwInfo.getCellData(nRow, nCol)]);

            let index = jsonPatternListOrigin.findIndex((value) => (value['YYYYMMDD'] == bandgvwInfo.getRefOfCol(nCol).replace("D", "") && value['WORK_PATTERN_CODE'] == bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("WORK_PATTERN_CODE"))));

            if(index != -1) {
                jsonPatternListOrigin[index]['WORK_TYPE'] = "U";
                jsonPatternListOrigin[index]['SHIFT_CODE'] = bandgvwInfo.getCellData(nRow, nCol);
            } else {
                jsonPatternListOrigin.push({WORK_TYPE: "N", SHIFT_CODE: bandgvwInfo.getCellData(nRow, nCol), WORK_PATTERN_CODE: bandgvwInfo.getCellData(nRow, bandgvwInfo.getColRef("WORK_PATTERN_CODE")), YYYYMMDD: bandgvwInfo.getRefOfCol(nCol).replace("D", "")})
            }
        } else {
            bandgvwInfo.removeCellStyle(nRow, nCol);
        }
    }

    const fn_gvwColorAfterRebuild = async function() {
        let gvwColorData = gvwColor.getGridDataAll();

        for(var i = 0; i < gvwColorData.length; i++) {
            let rowData = gvwColor.getRowData(i+1);
            gvwColor.setCellStyle('background-color', i+1, 0, i+1, 0, rowData.COLOR_CODE);
            gvwColor.setCellData(i+1, 0, '');
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

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_save = async function() {
        let updatedData = jsonPatternListOrigin.filter((value) => value['WORK_TYPE'] != "Q");
        let WORK_TYPE_D = "";
        let YYYYMMDD_D = "";
        let WORK_PATTERN_CODE_D = "";
        let SHIFT_CODE_D = "";;

        updatedData.forEach((item, index) => {
            if(colorList[item.SHIFT_CODE]) {
                WORK_TYPE_D += item.WORK_TYPE + "|";
                YYYYMMDD_D += item.YYYYMMDD + "|";
                WORK_PATTERN_CODE_D += item.WORK_PATTERN_CODE + "|";
                SHIFT_CODE_D += item.SHIFT_CODE + "|";
            }
        });

        if (WORK_TYPE_D.length > 0){
            WORK_TYPE_D = WORK_TYPE_D.substring(0, WORK_TYPE_D.length - 1);
            YYYYMMDD_D = YYYYMMDD_D.substring(0, YYYYMMDD_D.length - 1);
            WORK_PATTERN_CODE_D = WORK_PATTERN_CODE_D.substring(0, WORK_PATTERN_CODE_D.length - 1);
            SHIFT_CODE_D = SHIFT_CODE_D.substring(0, SHIFT_CODE_D.length - 1);
        }

        if(WORK_TYPE_D.length > 0) {
            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_WORK_TYPE_D: WORK_TYPE_D,
                V_P_YYYYMMDD_D: YYYYMMDD_D,
                V_P_WORK_PATTERN_CODE_D: WORK_PATTERN_CODE_D,
                V_P_SHIFT_CODE_D: SHIFT_CODE_D,
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            }

            const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1310.do", {
                getType: 'json',
                workType: 'N',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });
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

    const fn_initCreate = async function() {
        let YYYYMMDD_FR	    = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO	    = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let WORK_PATTERN_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_WORK_PATTERN_CODE'));

        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_WORK_PATTERN_CODE: WORK_PATTERN_CODE,
            V_P_YYYYMMDD_FR: YYYYMMDD_FR,
            V_P_YYYYMMDD_TO: YYYYMMDD_TO,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        }

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1310Init.do", {
            getType: 'json',
            workType: 'CREATE',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
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

    const fn_patternInput = async function() {
        var param = {
            GROUP_CODE : "HRT020",
            target : "MA_A00_010_020_080"
        };

        let json = JSON.stringify(param);
        window.parent.cfn_openTabSearch(json);
    }

    const fn_makeDynamicColumn = async function(list) {
        let columnList =
        [
            {caption: ["근무패턴", "근무패턴", "근무패턴", "근무패턴"], ref: 'WORK_PATTERN_CODE', type: 'combo', style: 'text-align:left', width: '140px',
                typeinfo: {ref: 'jsonWorkPatternCode', label: 'label', value: 'value', itemcount: 10}
                , disabled: true}
        ];

        list.forEach((item, index) => {
            const msg = {
                caption: [
                    (item.YYYYMMDD.substring(0, 4) + "년 " + item.YYYYMMDD.substring(4, 6) + "월"),
                    item.WEEK_SEQ + " ",
                    item.YYYYMMDD.substring(6, 8),
                    item.WEEK_DAY_NAME
                ],
                ref: "D"+ item.YYYYMMDD,
                type: 'input',
                style: 'text-align:center;',
                width: '25px',
                }

            if(item.HOLIDAY_YN == "Y") {
                msg['fixedstyle'] = 'color: red;';
            }

            columnList.push(msg);
        });

        return columnList;
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_YYYYMMDD_FR", gfn_dateToYmd(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_TO", gfn_dateLastYmd(new Date(new Date().getFullYear(), new Date().getMonth()+2, 1)));

        await fn_search();
    }

    const fn_search = async function() {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        let YYYYMMDD_FR	    = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO	    = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let WORK_PATTERN_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_WORK_PATTERN_CODE'));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_WORK_PATTERN_CODE : WORK_PATTERN_CODE,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/com/selectHrt1310List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const postJsonPromiseForCheck = gfn_postJSON("/hr/hrt/com/selectHrt1310List.do", {
            getType				: 'json',
            workType			: 'CHECK',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                _SBGrid.destroy('bandgvwInfo');
                fn_createBandgvwInfoGrid(await fn_makeDynamicColumn(listData.cv_1));

                jsonPatternList.length = 0;
                jsonPatternListOrigin.length = 0;
                jsonPatternList = listData.cv_2;
                jsonPatternListOrigin = listData.cv_3;

                jsonColorList.length = 0;
                listData.cv_4.forEach((item, index) => {
                    const msg = {
                        COLOR_CODE : item.COLOR_CODE,
                        SHIFT_CODE : item.SHIFT_CODE,
                        SHIFT_NAME : item.SHIFT_NAME
                    }

                    colorList[item.SHIFT_CODE] = item.COLOR_CODE;

                    jsonColorList.push(msg);
                });

                bandgvwInfo.refresh();
                gvwColor.rebuild();
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

        const checkData = await postJsonPromiseForCheck;

        try {
            if (_.isEqual("S", checkData.resultStatus)) {

                jsonCheckList.length = 0;
                checkData.cv_5.forEach((item, index) => {
                    const msg = {
                        WORK_PATTERN_CODE : item.WORK_PATTERN_CODE,
                        WORK_PATTERN_NAME : item.WORK_PATTERN_NAME,
                        YYYYMMDD : item.YYYYMMDD,
                        HOLIDAY_YN : item.HOLIDAY_YN,
                        COMP_CODE : item.COMP_CODE,
                        CHECK_TYPE : item.CHECK_TYPE,
                        SETUP_GUIDE : item.SETUP_GUIDE
                    }
                    jsonCheckList.push(msg);
                });

                gvwCheck.rebuild();
            } else {
                alert(checkData.resultMessage);
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
        fn_createBandgvwInfoGrid();
        fn_createGvwColorGrid();
        fn_createGvwCheckGrid();
        await fn_onload();
    });
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>