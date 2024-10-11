<%
    /**
     * @Class Name        : hrb5600.jsp
     * @Description       : 수당기준 등록 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.10
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.10   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 수당기준 등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>

    <title>Calculator</title>
    <link rel="stylesheet" href="/resource/css/ma_custom.css">
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

        <!--[pp] 검색 -->
        <!--[APC] START -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">
            </colgroup>
            <tr>
                <th scope="row" class="th_bg">기준일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-apply_date"
                            name="srch-apply_date"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast inpt_data_reqed">
                    </sbux-datepicker>
                </td>
                <td colspan="10" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">급여항목</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-pay_item_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-pay_item_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-pay_type"
                            name="srch-pay_type"
                            class="form-control input-sm"
                            jsondata-ref="jsonPayType"
                    />
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>급여항목</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwList" style="height:800px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>수당적용기준편집</span></li>
                    </ul>
                </div>

                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">
                            <col style="width:5%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:2%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:3%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">급여항목</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="PAY_ITEM_CODE"
                                        name="PAY_ITEM_CODE"
                                        class="form-control input-sm inpt_data_reqed"
                                        jsondata-ref="jsonPayItemCode2"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">지급구분</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="PAY_TYPE"
                                        name="PAY_TYPE"
                                        class="form-control input-sm inpt_data_reqed"
                                        jsondata-ref="jsonPayType"
                                />
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="ALL_YN"
                                        name="ALL_YN"
                                        uitype="normal"
                                        text="전체적용"
                                        text-left-padding="5px"
                                        text-right-padding="25px"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">적용기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="APPLY_START_DATE"
                                        name="APPLY_START_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed">
                                </sbux-datepicker>

                            </td>
                            <th>~</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="APPLY_END_DATE"
                                        name="APPLY_END_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed">
                                </sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">적용기준1</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="PAY_ITEM_RANGE_TYPE1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div id="ITEM_CHANGE_1" class="dropdown-menu input_change" aria-labelledby="PAY_ITEM_RANGE_TYPE1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>

                            <th scope="row" class="th_bg">적용기준2</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_ITEM_RANGE_TYPE2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div id="ITEM_CHANGE_2" class="dropdown-menu input_change" aria-labelledby="PAY_ITEM_RANGE_TYPE2" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="9" class="td_input" >
                                <sbux-textarea id="MEMO" name="MEMO" uitype="normal" cols="100"></sbux-textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>적용기준 상세</span></li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button
                                id="btnDel"
                                name="btnDel"
                                uitype="normal"
                                text="행삭제"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_delRow"
                                style="float: right;"
                        >
                        </sbux-button>
                        <sbux-button
                                id="btnAdd"
                                name="btnAdd"
                                uitype="normal"
                                text="행추가"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_addRow"
                                style="float: right;"
                        ></sbux-button>
                    </div>
                </div>
                <div>
                    <div id="sb-area-gvwBandgvwDetailList" style="height:283px; width:100%;"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType			= 'N';

    var CHk_PAY_ITEM_RANGE_TYPE1 = '';
    var CHk_PAY_ITEM_RANGE_TYPE2 = '';

    //grid 초기화
    var gvwListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonGvwList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwBandgvwDetailGrid;
    var jsonBandgvwDetailList = [];

    var jsonPayType = []; //지급구분 ( L_HRB008 )srch-pay_type, PAY_TYPE
    var jsonPayItemCode1 = []; //급여항목 ( L_HRP004 )srch-pay_item_code
    var jsonPayItemCode2 = []; //급여항목 ( L_HRP004_B )PAY_ITEM_CODE
    var jsonPayItemRangeType = []; //적용기준1, 적용기준2 ( L_HRB026 )pay_item_range_type1, pay_item_range_type2


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfnma_setComSelect(['srch-pay_type','PAY_TYPE'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_ITEM_CODE'], jsonPayItemCode2, 'L_HRP004_B', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonPayItemCode1, 'L_HRP004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            /*gfnma_setComSelect([''], jsonPayItemCode1, 'L_HRP004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemRangeType, 'L_HRB026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
*/
            //급여항목
            gfnma_multiSelectInit({
                target			: ['#srch-pay_item_code']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRP004'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'PAY_ITEM_CODE'
                ,colLabel		: 'PAY_ITEM_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'PAY_ITEM_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'PAY_ITEM_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //급여항목
            gfnma_multiSelectInit({
                target			: ['#PAY_ITEM_RANGE_TYPE1','#PAY_ITEM_RANGE_TYPE2']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB026'
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
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            })

        ]);
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('srch-apply_date', openDate);

        fn_createGrid();
        fn_createBandgvwDetailGrid();

        fn_search();
    }

    //급여항목
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonGvwList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode1', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["keyfield"], ref: 'KEYFIELD', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["적용기준1"], ref: 'PAY_ITEM_RANGE_TYPE1', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["적용기준2"], ref: 'PAY_ITEM_RANGE_TYPE2', type: 'output', width: '200px', style: 'text-align:left', hidden: true}

        ];

        gvwListGrid = _SBGrid.create(SBGridProperties);
        gvwListGrid.bind('click', 'fn_view');
    }

    //적용기준 상세
    function fn_createBandgvwDetailGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwBandgvwDetailList';
        SBGridProperties.id = 'gvwBandgvwDetailGrid';
        SBGridProperties.jsonref = 'jsonBandgvwDetailList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["직급명","적용코드1"], ref: 'PAY_ITEM_RANGE_CODE1', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["직급명","적용코드명1"], ref: 'PAY_ITEM_RANGE_NAME1', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["명","적용코드2"], ref: 'PAY_ITEM_RANGE_CODE2', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["명","적용코드명2"], ref: 'PAY_ITEM_RANGE_NAME2', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["적용금액","적용금액"], ref: 'PAY_ITEM_RANGE_AMT', type: 'input', width: '200px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["적용금액","비고"], ref: 'MEMO', type: 'input', width: '200px', style: 'text-align:left'}
        ];

        gvwBandgvwDetailGrid = _SBGrid.create(SBGridProperties);
    }

    // 행 추가
    const fn_addRow = function () {
        let rowVal = gvwBandgvwDetailGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwBandgvwDetailGrid.addRow(true);
        }else{
            gvwBandgvwDetailGrid.insertRow(rowVal);
        }
        //grdFimList.refresh();
    }

    // 행삭제
    const fn_delRow = async function () {

        let rowVal = gvwBandgvwDetailGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwBandgvwDetailGrid.deleteRow(rowVal);
        }
    }

    // 신규
    function cfn_add() {
        fn_add();
    }
    // 저장
    function cfn_save() {
        fn_save();
    }
    // 삭제
    function cfn_del() {
        fn_del();
    }

    // 조회
    function cfn_search() {

        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let APPLY_DATE = gfnma_nvl(SBUxMethod.get("srch-apply_date")); //기준일
        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("srch-pay_item_code")); //급여항목
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_APPLY_DATE          : APPLY_DATE
            ,V_P_PAY_ITEM_CODE       : PAY_ITEM_CODE
            ,V_P_PAY_TYPE            : PAY_TYPE
            ,V_P_APPLY_START_DATE    : ''
            ,V_P_PAY_ITEM_RANGE_TYPE1: ''
            ,V_P_PAY_ITEM_RANGE_TYPE2: ''

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp5600List.do", {
            getType: 'json',
            workType: 'MASTER',
            cv_count: '4',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                        PAY_TYPE: gfnma_nvl(item.PAY_TYPE),
                        APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                        PAY_ITEM_RANGE_TYPE1: gfnma_nvl(item.PAY_ITEM_RANGE_TYPE1),
                        PAY_ITEM_RANGE_TYPE2: gfnma_nvl(item.PAY_ITEM_RANGE_TYPE2),
                        KEYFIELD: gfnma_nvl(item.KEYFIELD)

                    }
                    jsonGvwList.push(msg);
                    totalRecordCount++;
                });

                gvwListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                fn_view();


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

    //상세정보 보기
    async function fn_view() {

        editType = 'U';

        let APPLY_DATE = gfnma_nvl(SBUxMethod.get("srch-apply_date")); //기준일
        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("srch-pay_item_code")); //급여항목
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분

        let nRow = gvwListGrid.getRow();

        if (nRow < 1){
            nRow = 1;
        }

        let rowData = gvwListGrid.getRowData(nRow);


        if (!_.isEmpty(rowData)) {
            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_APPLY_DATE: APPLY_DATE
                , V_P_PAY_ITEM_CODE: rowData.PAY_ITEM_CODE
                , V_P_PAY_TYPE: rowData.PAY_TYPE
                , V_P_APPLY_START_DATE: rowData.APPLY_START_DATE
                , V_P_PAY_ITEM_RANGE_TYPE1: rowData.PAY_ITEM_RANGE_TYPE1
                , V_P_PAY_ITEM_RANGE_TYPE2: rowData.PAY_ITEM_RANGE_TYPE2

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            console.log('------paramObj------', paramObj);

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp5600List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '4',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;


            console.log('------data------', data);

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    data.cv_2.forEach((item, index) => {

                        SBUxMethod.set("PAY_ITEM_CODE", gfnma_nvl(item.PAY_ITEM_CODE));
                        SBUxMethod.set("PAY_TYPE", gfnma_nvl(item.PAY_TYPE));
                        SBUxMethod.set("ALL_YN", gfnma_nvl(item.ALL_YN));
                        SBUxMethod.set("APPLY_START_DATE", gfnma_nvl(item.APPLY_START_DATE));
                        SBUxMethod.set("APPLY_END_DATE", gfnma_nvl(item.APPLY_END_DATE));
                       /* SBUxMethod.set("PAY_ITEM_RANGE_TYPE1", gfnma_nvl(item.PAY_ITEM_RANGE_TYPE1));
                        SBUxMethod.set("PAY_ITEM_RANGE_TYPE2", gfnma_nvl(item.PAY_ITEM_RANGE_TYPE2));*/
                        SBUxMethod.set("MEMO", gfnma_nvl(item.MEMO));

                        gfnma_multiSelectSet('#PAY_ITEM_RANGE_TYPE1', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.PAY_ITEM_RANGE_TYPE1));
                        gfnma_multiSelectSet('#PAY_ITEM_RANGE_TYPE2', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.PAY_ITEM_RANGE_TYPE2));

                    });


                    jsonBandgvwDetailList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_RANGE_CODE1: gfnma_nvl(item.PAY_ITEM_RANGE_CODE1),
                            PAY_ITEM_RANGE_NAME1: gfnma_nvl(item.PAY_ITEM_RANGE_NAME1),
                            PAY_ITEM_RANGE_CODE2: gfnma_nvl(item.PAY_ITEM_RANGE_CODE2),
                            PAY_ITEM_RANGE_NAME2: gfnma_nvl(item.PAY_ITEM_RANGE_NAME2),
                            PAY_ITEM_RANGE_AMT: gfnma_nvl(item.PAY_ITEM_RANGE_AMT),
                            MEMO: gfnma_nvl(item.MEMO)

                        }
                        jsonBandgvwDetailList.push(msg);
                    });

                    gvwBandgvwDetailGrid.rebuild();

                    fn_settings('true');


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

    //저장
    const fn_item = async function () {

        let APPLY_DATE = gfnma_nvl(SBUxMethod.get("srch-apply_date")); //기준일
        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("srch-pay_item_code")); //급여항목
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분

        let APPLY_START_DATE 			= gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));

        let PAY_ITEM_RANGE_TYPE1 = gfnma_nvl(CHk_PAY_ITEM_RANGE_TYPE1);
        let PAY_ITEM_RANGE_TYPE2 = gfnma_nvl(CHk_PAY_ITEM_RANGE_TYPE2);


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_APPLY_DATE: APPLY_DATE
            , V_P_PAY_ITEM_CODE: PAY_ITEM_CODE
            , V_P_PAY_TYPE: PAY_TYPE
            , V_P_APPLY_START_DATE: APPLY_START_DATE
            , V_P_PAY_ITEM_RANGE_TYPE1: PAY_ITEM_RANGE_TYPE1
            , V_P_PAY_ITEM_RANGE_TYPE2: PAY_ITEM_RANGE_TYPE2

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp5600List.do", {
            getType: 'json',
            workType: 'ITEM',
            cv_count: '4',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                jsonBandgvwDetailList.length = 0;
                data.cv_4.forEach((item, index) => {
                    const msg = {
                        PAY_ITEM_RANGE_CODE1: gfnma_nvl(item.PAY_ITEM_RANGE_CODE1),
                        PAY_ITEM_RANGE_NAME1: gfnma_nvl(item.PAY_ITEM_RANGE_NAME1),
                        PAY_ITEM_RANGE_CODE2: gfnma_nvl(item.PAY_ITEM_RANGE_CODE2),
                        PAY_ITEM_RANGE_NAME2: gfnma_nvl(item.PAY_ITEM_RANGE_NAME2),
                        PAY_ITEM_RANGE_AMT: gfnma_nvl(item.PAY_ITEM_RANGE_AMT),
                        MEMO: gfnma_nvl(item.MEMO)

                    }
                    jsonBandgvwDetailList.push(msg);
                });

                gvwBandgvwDetailGrid.rebuild();

                /*fn_settings();*/


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

    //신규 작성
    function fn_add() {

        editType = 'N';

        var CHk_PAY_ITEM_RANGE_TYPE1 = '';
        var CHk_PAY_ITEM_RANGE_TYPE2 = '';

        SBUxMethod.set("PAY_ITEM_CODE", 			"");
        SBUxMethod.set("PAY_TYPE", 			"");
        SBUxMethod.set("ALL_YN", 			"N");

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set("APPLY_START_DATE", 			openDate);
        SBUxMethod.set("APPLY_END_DATE", 			"99991231");
        /*SBUxMethod.attr('APPLY_END_DATE','readonly',true);*/

        gfnma_multiSelectSet('#PAY_ITEM_RANGE_TYPE1', '', '', '');
        gfnma_multiSelectSet('#PAY_ITEM_RANGE_TYPE2', '', '', '');

        //fn_settings('false');

        SBUxMethod.attr('PAY_ITEM_CODE','readonly',false);
        SBUxMethod.attr('PAY_TYPE','readonly',false);
        SBUxMethod.attr('APPLY_START_DATE','readonly',false);
        /*SBUxMethod.attr('APPLY_END_DATE','readonly',true);*/
        $('#PAY_ITEM_RANGE_TYPE1').attr('disabled',false);
        $('#PAY_ITEM_RANGE_TYPE2').attr('disabled',false);


        gvwBandgvwDetailGrid.clearStatus();
        jsonBandgvwDetailList.length = 0;
        gvwBandgvwDetailGrid.rebuild();

    }

    //저장
    function fn_settings(type) {

        SBUxMethod.attr('PAY_ITEM_CODE','readonly',type);
        SBUxMethod.attr('PAY_TYPE','readonly',type);
        SBUxMethod.attr('APPLY_START_DATE','readonly',type);
        SBUxMethod.attr('APPLY_END_DATE','readonly',type);
        $('#PAY_ITEM_RANGE_TYPE1').attr('disabled',type);
        $('#PAY_ITEM_RANGE_TYPE2').attr('disabled',type);
        /*SBUxMethod.attr('PAY_ITEM_RANGE_TYPE1','disabled',true);*/
        /*SBUxMethod.attr('PAY_ITEM_RANGE_TYPE2','disabled',true);*/


    }

    //저장
    const fn_save = async function () {

        let PAY_ITEM_CODE 			= gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));
        let PAY_TYPE 			    = gfnma_nvl(SBUxMethod.get("PAY_TYPE"));
        let ALL_YN 			        = gfnma_nvl(SBUxMethod.get("ALL_YN").ALL_YN);
        let APPLY_START_DATE 		= gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));
        let APPLY_END_DATE 			= gfnma_nvl(SBUxMethod.get("APPLY_END_DATE"));
        let PAY_ITEM_RANGE_TYPE1	= gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE1');
        let PAY_ITEM_RANGE_TYPE2	= gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE2');
        let MEMO 			        = gfnma_nvl(SBUxMethod.get("MEMO"));


        if (Number(APPLY_START_DATE) >= Number(APPLY_END_DATE)){
            gfn_comAlert("Q0000", "적용종료일을 적용 시작일 이후로 입력하십시오.");
            //SetMessageBox(GetFormMessage("HRB5600_003")); // 적용종료일을 적용 시작일 이후로 입력하십시오.
            return;
        }


        if (!PAY_ITEM_CODE) {
            gfn_comAlert("W0002", "급여항목");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!APPLY_START_DATE) {
            gfn_comAlert("W0002", "적용기간");
            return;
        }
        if (!APPLY_END_DATE) {
            gfn_comAlert("W0002", "적용기간");
            return;
        }
        if (!PAY_ITEM_RANGE_TYPE1) {
            gfn_comAlert("W0002", "적용기준1");
            return;
        }
        /*if (!PAY_ITEM_RANGE_TYPE2) {
            gfn_comAlert("W0002", "적용기준2");
            return;
        }*/


        var paramObj = {
            V_P_DEBUG_MODE_YN			: ''
            ,V_P_LANG_ID				: ''
            ,V_P_COMP_CODE				: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

            ,V_P_PAY_ITEM_CODE        : PAY_ITEM_CODE
            ,V_P_PAY_TYPE             : PAY_TYPE
            ,V_P_APPLY_START_DATE     : APPLY_START_DATE
            ,V_P_APPLY_END_DATE       : APPLY_END_DATE
            ,V_P_PAY_ITEM_RANGE_TYPE1 : PAY_ITEM_RANGE_TYPE1
            ,V_P_PAY_ITEM_RANGE_TYPE2 : PAY_ITEM_RANGE_TYPE2
            ,V_P_ALL_YN               : ALL_YN == '' ? 'N' : ALL_YN
            ,V_P_MEMO                 : MEMO

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''


        };

        console.log('---------paramObj-----------',  paramObj);

        if (_.isEqual(editType, "N")){
            // 수정 저장
            if (gfn_comConfirm("Q0001", "신규 등록")) {
                const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp5600.do", {
                    getType: 'json',
                    workType: 'N',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }

                        fn_saveS1();

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
        }else if (_.isEqual(editType, "U")){
            // 수정 저장
            if (gfn_comConfirm("Q0001", "수정 저장")) {
                const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp5600.do", {
                    getType: 'json',
                    workType: 'U',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });
                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }

                        fn_saveS1();

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

    //저장
    const fn_saveS1 = async function () {

        let listData = [];
        listData =  await getParamForm();

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp5600S1.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        fn_search();
                    }else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
                    }


                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }


    const getParamForm = async function () {

        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("PAY_TYPE"));
        let APPLY_START_DATE = gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));


        let updatedData;
        let returnData = [];


        updatedData = gvwBandgvwDetailGrid.getUpdateData(true, 'all');

        updatedData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    , V_P_PAY_ITEM_CODE: PAY_ITEM_CODE
                    , V_P_PAY_TYPE: PAY_TYPE
                    , V_P_APPLY_START_DATE: APPLY_START_DATE
                    , V_P_PAY_ITEM_RANGE_CODE1: item.data.PAY_ITEM_RANGE_CODE1
                    , V_P_PAY_ITEM_RANGE_CODE2: item.data.PAY_ITEM_RANGE_CODE2
                    , V_P_PAY_ITEM_RANGE_AMT: gfnma_nvl(item.data.PAY_ITEM_RANGE_AMT) == '' ? 0 : item.data.PAY_ITEM_RANGE_AMT
                    , V_P_MEMO: item.data.MEMO

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''

                })
            }

            returnData.push(param);

        });
        return returnData;
    }

    $(function () {

        // 변경을 감지할 노드 선택
        const targetNode = document.getElementById("PAY_ITEM_RANGE_TYPE1");

        const targetNode2 = document.getElementById("PAY_ITEM_RANGE_TYPE2");

        // 감지 옵션 (감지할 변경)
        const config = { attributes: true, childList: true, subtree: true };

        // 변경 감지 시 실행할 콜백 함수
        const callback = (mutationList, observer) => {
           /* console.log("----mutationList--- : ", mutationList);
            for (const mutation of mutationList) {
                if (mutation.type === "childList") {
                    console.log("자식 노드가 추가되거나 제거됐습니다.");
                } else if (mutation.type === "attributes") {
                    console.log(`${mutation.attributeName} 특성이 변경됐습니다.`);
                }
            }*/
            let type1Chk = gfnma_nvl($('#PAY_ITEM_RANGE_TYPE1').attr('disabled'));
            let PAY_ITEM_RANGE_TYPE1 = gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE1');

            if (_.isEmpty(type1Chk)){
                if (!_.isEmpty(PAY_ITEM_RANGE_TYPE1)) {
                    if (!_.isEqual(CHk_PAY_ITEM_RANGE_TYPE1, PAY_ITEM_RANGE_TYPE1)) {
                        console.log('CHk_PAY_ITEM_RANGE_TYPE1 : ',CHk_PAY_ITEM_RANGE_TYPE1);
                        console.log('PAY_ITEM_RANGE_TYPE1 : ',PAY_ITEM_RANGE_TYPE1);
                        CHk_PAY_ITEM_RANGE_TYPE1 = PAY_ITEM_RANGE_TYPE1;
                        fn_item();
                    }
                }else{
                    CHk_PAY_ITEM_RANGE_TYPE1 = '';
                    fn_item();
                }
            }

            let type2Chk = gfnma_nvl($('#PAY_ITEM_RANGE_TYPE2').attr('disabled'));
            let PAY_ITEM_RANGE_TYPE2 = gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE2');
            if (_.isEmpty(type2Chk)){
                if (!_.isEmpty(PAY_ITEM_RANGE_TYPE2)) {
                    if (!_.isEqual(CHk_PAY_ITEM_RANGE_TYPE2, PAY_ITEM_RANGE_TYPE2)) {
                        console.log('CHk_PAY_ITEM_RANGE_TYPE2 : ',CHk_PAY_ITEM_RANGE_TYPE2);
                        console.log('PAY_ITEM_RANGE_TYPE2 : ',PAY_ITEM_RANGE_TYPE2);
                        CHk_PAY_ITEM_RANGE_TYPE2 = PAY_ITEM_RANGE_TYPE2;
                        fn_item();
                    }
                }else{
                    CHk_PAY_ITEM_RANGE_TYPE2 = '';
                    fn_item();
                }
            }
        };

        // 콜백 함수에 연결된 감지기 인스턴스 생성
        const observer = new MutationObserver(callback);

        // 설정한 변경의 감지 시작
        observer.observe(targetNode, config);
        observer.observe(targetNode2, config);

        /*// 이후 감지 중단 가능
        observer.disconnect();*/

        /*$("#PAY_ITEM_RANGE_TYPE1").on("DOMSubtreeModified",function(e){

            let PAY_ITEM_RANGE_TYPE1 = gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE1');

            console.log('--PAY_ITEM_RANGE_TYPE1--',PAY_ITEM_RANGE_TYPE1);
            console.log('--e--',e);

            if (!_.isEmpty(PAY_ITEM_RANGE_TYPE1)) {
                if (!_.isEqual(CHk_PAY_ITEM_RANGE_TYPE1, PAY_ITEM_RANGE_TYPE1)) {
                    CHk_PAY_ITEM_RANGE_TYPE1 = PAY_ITEM_RANGE_TYPE1
                    fn_item();
                }
            }
        });*/

       /* $("#ITEM_CHANGE_2").on("DOMSubtreeModified",function(e){

            let PAY_ITEM_RANGE_TYPE2 = gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE2');

            console.log('--PAY_ITEM_RANGE_TYPE2--',PAY_ITEM_RANGE_TYPE2);

            if (!_.isEmpty(PAY_ITEM_RANGE_TYPE2)) {
                if (!_.isEqual(CHk_PAY_ITEM_RANGE_TYPE2, PAY_ITEM_RANGE_TYPE2)) {
                    CHk_PAY_ITEM_RANGE_TYPE2 = PAY_ITEM_RANGE_TYPE2
                    fn_item();
                }
            }
        });*/

    });

    //삭제
    const fn_del = async function () {

        if (gfn_comConfirm("Q0001", "삭제")) {

            let PAY_ITEM_CODE 			= gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));
            let PAY_TYPE 			    = gfnma_nvl(SBUxMethod.get("PAY_TYPE"));
            let ALL_YN 			        = gfnma_nvl(SBUxMethod.get("ALL_YN").ALL_YN);
            let APPLY_START_DATE 		= gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));
            let APPLY_END_DATE 			= gfnma_nvl(SBUxMethod.get("APPLY_END_DATE"));
            let PAY_ITEM_RANGE_TYPE1	= gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE1');
            let PAY_ITEM_RANGE_TYPE2	= gfnma_multiSelectGet('#PAY_ITEM_RANGE_TYPE2');
            let MEMO 			        = gfnma_nvl(SBUxMethod.get("MEMO"));


            if (Number(APPLY_START_DATE) >= Number(APPLY_END_DATE)){
                gfn_comAlert("Q0000", "적용종료일을 적용 시작일 이후로 입력하십시오.");
                //SetMessageBox(GetFormMessage("HRB5600_003")); // 적용종료일을 적용 시작일 이후로 입력하십시오.
                return;
            }


            if (!PAY_ITEM_CODE) {
                gfn_comAlert("W0002", "급여항목");
                return;
            }
            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!APPLY_START_DATE) {
                gfn_comAlert("W0002", "적용기간");
                return;
            }
            if (!APPLY_END_DATE) {
                gfn_comAlert("W0002", "적용기간");
                return;
            }
            if (!PAY_ITEM_RANGE_TYPE1) {
                gfn_comAlert("W0002", "적용기준1");
                return;
            }
            /*if (!PAY_ITEM_RANGE_TYPE2) {
                gfn_comAlert("W0002", "적용기준2");
                return;
            }*/


            var paramObj = {
                V_P_DEBUG_MODE_YN			: ''
                ,V_P_LANG_ID				: ''
                ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                ,V_P_PAY_ITEM_CODE        : PAY_ITEM_CODE
                ,V_P_PAY_TYPE             : PAY_TYPE
                ,V_P_APPLY_START_DATE     : APPLY_START_DATE
                ,V_P_APPLY_END_DATE       : APPLY_END_DATE
                ,V_P_PAY_ITEM_RANGE_TYPE1 : PAY_ITEM_RANGE_TYPE1
                ,V_P_PAY_ITEM_RANGE_TYPE2 : PAY_ITEM_RANGE_TYPE2
                ,V_P_ALL_YN               : ALL_YN == '' ? 'N' : ALL_YN
                ,V_P_MEMO                 : MEMO

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''


            };

            console.log('---------paramObj-----------',  paramObj);
            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp5600.do", {
                getType: 'json',
                workType: 'D',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        fn_search();
                    }else{
                        await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
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
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
