<%
    /**
     * @Class Name        : hrb5300.jsp
     * @Description       : 급여체계별 급여항목 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.03
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>E
<html lang="ko">
<head>
    <title>title : 급여체계별 급여항목</title>
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
            <%--<div style="margin-left: auto;">
                &lt;%&ndash; <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                              class="btn btn-sm btn-outline-danger"
                              onclick="fn_create"></sbux-button>&ndash;%&gt;
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                &lt;%&ndash;<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_delete"></sbux-button>&ndash;%&gt;
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_search"></sbux-button>
            </div>--%>
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
            <tbody>
            <tr>
                <th scope="row" class="th_bg">급여체계</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="cbopay_group_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="cbopay_group_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>

                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="cbopay_type" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="cbopay_type" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>

                <th scope="row" class="th_bg">급여항목구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="cbopay_item_category" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="cbopay_item_category" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>

            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>  급여체계별급여항목</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-gvwMaster" style="height:230px; width:100%;"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-9">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>  급여산식설정</span>
                        </li>
                    </ul>
                </div>

            <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
            </sbux-tabs>

            <div class="tab-content">
                <div id="salaryTab" >
                    <div>
                        <div id="sb-area-gvwSalary" style="height:200px; width:100%;"></div>
                    </div>
                </div>
                <div id="workTab" >
                    <div>
                        <div id="sb-area-gvwWork" style="height:200px; width:100%;"></div>
                    </div>
                </div>
                <div id="settingTab" >
                    <div>
                        <div id="sb-area-gvwSetting" style="height:200px; width:100%;"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="ma-calculator">
                <div class="ma-buttons">
                    <%--<button class="ma-btn" onclick="clearDisplay()">C</button>--%>
                    <button class="ma-btn" onclick="appendToDisplay('1')">1</button>
                    <button class="ma-btn" onclick="appendToDisplay('2')">2</button>
                    <button class="ma-btn" onclick="appendToDisplay('3')">3</button>
                    <button class="ma-btn" onclick="appendToDisplay('+')">+</button>
                    <button class="ma-btn" onclick="appendToDisplay('(')">(</button>
                    <button class="ma-btn" onclick="appendToDisplay('4')">4</button>
                    <button class="ma-btn" onclick="appendToDisplay('5')">5</button>
                    <button class="ma-btn" onclick="appendToDisplay('6')">6</button>
                    <button class="ma-btn" onclick="appendToDisplay('-')">-</button>
                    <button class="ma-btn" onclick="appendToDisplay(')')">)</button>
                    <button class="ma-btn" onclick="appendToDisplay('7')">7</button>
                    <button class="ma-btn" onclick="appendToDisplay('8')">8</button>
                    <button class="ma-btn" onclick="appendToDisplay('9')">9</button>
                    <button class="ma-btn" onclick="appendToDisplay('*')">*</button>
                    <button class="ma-btn" onclick="subToDisplay()">←</button>
                    <button class="ma-btn" onclick="appendToDisplay('0')">0</button>
                    <button class="ma-btn" onclick="appendToDisplay('00')">00</button>
                    <button class="ma-btn" onclick="appendToDisplay('.')">.</button>
                    <button class="ma-btn" onclick="appendToDisplay('/')">/</button>
                    <button class="ma-btn" onclick="calculateResult()">AC</button>
                </div>
            </div>
        </div>
    </div>

    <div class="ad_tbl_top">
        <ul class="ad_tbl_count">
            <li>
                <span>  급여산식결과</span>
            </li>
        </ul>
        <div class="ad_tbl_toplist">
            <sbux-button
                    id="btnCheck"
                    name="btnCheck"
                    uitype="normal"
                    text="구문확인"
                    class="btn btn-sm btn-outline-danger"
                    onclick="fn_btnCheck"
                    style="float: right;"
            >
            </sbux-button>
        </div>
    </div>
    <table class="table table-bordered tbl_fixed">
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
        <tbody>
        <tr>
            <th scope="row" class="th_bg">급여(금액)산식</th>
            <td colspan="3" class="td_input" >
                <sbux-textarea id="PAY_FORMULA" name="PAY_FORMULA" uitype="normal" cols="50"></sbux-textarea>
            </td>

            <th scope="row" class="th_bg">시간산식</th>
            <td colspan="3" class="td_input" >
                <sbux-textarea id="QTY_FORMULA" name="QTY_FORMULA" uitype="normal" cols="50"></sbux-textarea>
            </td>

            <th scope="row" class="th_bg">시간단위</th>
            <td colspan="3" class="td_input" >
                <sbux-input uitype="text" id="QTY_UNIT" class="form-control input-sm" cols="50" style="width:25%;"></sbux-input>
            <%--<td style="border-right: hidden;">&nbsp;</td>--%>
            <%--<td style="border-right: hidden;">&nbsp;</td>--%>
            </td>
        </tr>
        <tr>
            <th scope="row" class="th_bg">급여(금액)산식설명</th>
            <td colspan="3" class="td_input" >
                <sbux-textarea id="PAY_FORMULA_DESC" name="PAY_FORMULA_DESC" uitype="normal" cols="50"></sbux-textarea>
            </td>

            <th scope="row" class="th_bg">시간산식설명</th>
            <td colspan="3" class="td_input" >
                <sbux-textarea id="QTY_FORMULA_DESC" name="QTY_FORMULA_DESC" uitype="normal" cols="50"></sbux-textarea>
            </td>

            <td colspan="4" style="border-right: hidden;">&nbsp;</td>
        </tr>
        </tbody>
    </table>
    </div>
</section>
</body>
<script type="text/javascript">


    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwMasterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwSalaryGrid;
    var jsonSalaryList = [];
    var gvwWorkGrid;
    var jsonWorkList = [];
    var gvwSettingGrid;
    var jsonSettingList = [];

    var jsonPayGroupCode = []; //급여체계 ( L_HRI010 )comp_code
    var jsonPayType = []; //지급구분 ( L_HRB008 )comp_code
    var jsonPayItemCategory = []; //급여항목구분 ( L_HRB009 )comp_code
    var jsonPayItemCode = []; //급여항목구분 ( L_HRP004 )comp_code
    var jsonSummaryType = []; //집계방법구분 ( L_HRB011 )summary_type
    var jsonSummaryRelatedCode = []; //집계방법구분 ( L_HRB012 )summary_related_code


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwMasterGrid'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMasterGrid'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwSalaryGrid','gvwMasterGrid'], jsonPayItemCategory, 'L_HRB009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMasterGrid'], jsonPayItemCode, 'L_HRP004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMasterGrid'], jsonSummaryType, 'L_HRB011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMasterGrid'], jsonSummaryRelatedCode, 'L_HRB012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),


            //급여체계
            gfnma_multiSelectInit({
                target			: ['#cbopay_group_code']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI010'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'PAY_GROUP_CODE'
                ,colLabel		: 'PAY_GROUP_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'PAY_GROUP_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'PAY_GROUP_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //지급구분
            gfnma_multiSelectInit({
                target			: ['#cbopay_item_category']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB009'
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
            }),

            //지급구분
            gfnma_multiSelectInit({
                target			: ['#cbopay_type']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB008'
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
            }),


        ]);
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createFormulaGrid();
        fn_createSalaryGrid();
        fn_createWorkGrid();
        fn_createSettingGrid();

        /*fn_search();*/
    }

    // 신규
  /*  function cfn_add() {
        fn_create();
    }*/
    // 저장
    function cfn_save() {
        fn_save();
    }
    // 삭제
    /*function cfn_del() {
        fn_delete();
    }*/

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

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "급여항목",         "targetid" : "salaryTab" , "targetvalue" : "급여항목"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "근태항목",         "targetid" : "workTab" ,     "targetvalue" : "근태항목"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "환경설정항목",      "targetid" : "settingTab" ,     "targetvalue" : "환경설정항목"}
    ];

    //사원 리스트
    function fn_createFormulaGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwMaster';
        SBGridProperties.id = 'gvwMasterGrid';
        SBGridProperties.jsonref = 'jsonMasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["□"], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["급여항목구분"], ref : 'PAY_ITEM_CATEGORY', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCategory', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["급여항목코드"], ref: 'PAY_ITEM_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["급여항목명"], ref: 'PAY_ITEM_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["집계방법구분"], ref : 'SUMMARY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSummaryType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["관련항목"], ref : 'SUMMARY_RELATED_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSummaryRelatedCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["계산순서"], ref: 'CALCULATE_SEQ', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ['시작일자'], 		ref: 'START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false, hidden: true,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['종료일자'], 		ref: 'END_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false, hidden: true,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["비례계수제외여부"], ref: 'PPTLCT_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'
            }},
            {caption: ["지급제외항목"], ref: 'PAY_EXCLUDE_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'
            }},
            {caption: ["소급계산여부"], ref: 'RECALC_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'
            }},
            {caption: ["최대한도 적용"], ref: 'APPLY_MAX_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'
            }},
            {caption: ["최대한도값"], ref: 'APPLY_MAX_AMT', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["최소한도 적용"], ref: 'APPLY_MIN_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'
            }},
            {caption: ["최소한도값"], ref: 'APPLY_MIN_AMT', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["비    고"], ref: 'DESCR', type: 'input', width: '150px', style: 'text-align:left'},
            {caption: ["급여산식"], ref: 'PAY_FORMULA', type: 'output', width: '250px', style: 'text-align:left'},
            {caption: ["급여산식"], ref: 'PAY_FORMULA_TMP', type: 'output', width: '250px', style: 'text-align:left'},
            {caption: ["급여산식설명"], ref: 'PAY_FORMULA_DESC', type: 'output', width: '250px', style: 'text-align:left'},
            {caption: ["변환여부"], ref: 'PARSING_YN', type: 'checkbox', width: '70px', style: 'text-align:center', hidden: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'
                }},
            {caption: ["시간산식"], ref: 'QTY_FORMULA', type: 'input', width: '250px', style: 'text-align:left'},
            {caption: ["QTY_FORMULA_TMP"], ref: 'QTY_FORMULA_TMP', type: 'input', width: '150px', style: 'text-align:left', hidden: true},
            {caption: ["시간산식설명"], ref: 'QTY_FORMULA_DESC', type: 'input', width: '250px', style: 'text-align:left'},
            {caption: ["QTY_UNIT"], ref: 'QTY_UNIT', type: 'output', width: '150px', style: 'text-align:left', hidden: true}
        ];

        gvwMasterGrid = _SBGrid.create(SBGridProperties);
        gvwMasterGrid.bind('click', 'fn_view');
    }



    //급여항목 리스트
    function fn_createSalaryGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwSalary';
        SBGridProperties.id = 'gvwSalaryGrid';
        SBGridProperties.jsonref = 'jsonSalaryList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["급여항목구분"], ref : 'PAY_ITEM_CATEGORY', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCategory', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["급여항목코드"], ref: 'PAY_ITEM_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["항 목 명"], ref: 'PAY_ITEM_NAME', type: 'output', width: '100px', style: 'text-align:left'}
        ];

        gvwSalaryGrid = _SBGrid.create(SBGridProperties);
        gvwSalaryGrid.bind('dblclick', 'fn_salaryView');
    }

    //급여항목 리스트
    function fn_createWorkGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwWork';
        SBGridProperties.id = 'gvwWorkGrid';
        SBGridProperties.jsonref = 'jsonWorkList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["급여항목코드"], ref: 'PAY_ITEM_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["항 목 명"], ref: 'PAY_ITEM_NAME', type: 'output', width: '100px', style: 'text-align:left'}
        ];

        gvwWorkGrid = _SBGrid.create(SBGridProperties);
        gvwWorkGrid.bind('dblclick', 'fn_workView');
    }

    //환경설정항목 리스트
    function fn_createSettingGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwSetting';
        SBGridProperties.id = 'gvwSettingGrid';
        SBGridProperties.jsonref = 'jsonSettingList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["항목코드"], ref: 'ITEM_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["항목명"], ref: 'ITEM_NAME', type: 'output', width: '100px', style: 'text-align:left'}
        ];

        gvwSettingGrid = _SBGrid.create(SBGridProperties);
        gvwSettingGrid.bind('dblclick', 'fn_settingView');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        gvwMasterGrid.clearStatus();

        let PAY_GROUP_CODE = gfnma_multiSelectGet("#cbopay_group_code");
        let PAY_TYPE = gfnma_multiSelectGet("#cbopay_type");
        let PAY_ITEM_CATEGORY = gfnma_multiSelectGet("#cbopay_item_category");


        if (!PAY_GROUP_CODE) {
            gfn_comAlert("W0002", "급여체계");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_GROUP_CODE : PAY_GROUP_CODE
            ,V_P_PAY_TYPE : PAY_TYPE
            ,V_P_PAY_ITEM_CATEGORY : PAY_ITEM_CATEGORY
            ,V_P_PAY_ITEM_CODE : ''

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb5300List.do", {
            getType: 'json',
            workType: 'MASTER',
            cv_count: '5',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonMasterList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN: gfnma_nvl(item.CHK_YN),
                        PAY_ITEM_CATEGORY: gfnma_nvl(item.PAY_ITEM_CATEGORY),
                        PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                        PAY_ITEM_NAME: gfnma_nvl(item.PAY_ITEM_NAME),
                        CALCULATE_SEQ: gfnma_nvl(item.CALCULATE_SEQ),
                        PAY_EXCLUDE_YN: gfnma_nvl(item.PAY_EXCLUDE_YN),
                        SUMMARY_TYPE: gfnma_nvl(item.SUMMARY_TYPE),
                        SUMMARY_RELATED_CODE: gfnma_nvl(item.SUMMARY_RELATED_CODE),
                        APPLY_MAX_YN: gfnma_nvl(item.APPLY_MAX_YN),
                        APPLY_MAX_AMT: gfnma_nvl(item.APPLY_MAX_AMT),
                        APPLY_MIN_YN: gfnma_nvl(item.APPLY_MIN_YN),
                        APPLY_MIN_AMT: gfnma_nvl(item.APPLY_MIN_AMT),
                        DESCR: gfnma_nvl(item.DESCR),
                        PAY_FORMULA: gfnma_nvl(item.PAY_FORMULA),
                        PAY_FORMULA_TMP: gfnma_nvl(item.PAY_FORMULA_TMP),
                        PAY_FORMULA_DESC: gfnma_nvl(item.PAY_FORMULA_DESC),
                        RECALC_YN: gfnma_nvl(item.RECALC_YN),
                        PARSING_YN: gfnma_nvl(item.PARSING_YN),
                        QTY_FORMULA: gfnma_nvl(item.QTY_FORMULA),
                        QTY_FORMULA_TMP: gfnma_nvl(item.QTY_FORMULA_TMP),
                        QTY_FORMULA_DESC: gfnma_nvl(item.QTY_FORMULA_DESC),
                        QTY_UNIT: gfnma_nvl(item.QTY_UNIT),
                        PPTLCT_YN: gfnma_nvl(item.PPTLCT_YN)

                    }
                    jsonMasterList.push(msg);
                    totalRecordCount++;
                });

                gvwMasterGrid.rebuild();
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

        let PAY_GROUP_CODE = gfnma_nvl(SBUxMethod.get("cbopay_group_code"));
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("cbopay_type"));
        let PAY_ITEM_CATEGORY = gfnma_nvl(SBUxMethod.get("cbopay_item_category"));

        let nCol = gvwMasterGrid.getCol();
        let nRow = gvwMasterGrid.getRow();

        if (nRow < 1) {
            nRow = 1; //그리드 로우 첫번째값 셋팅
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            // 집계방법구분이 계산 수식일 경우에만 급여산식 입력 가능함
            if (_.isEqual(rowData.SUMMARY_TYPE, "FORMULA")){

               /* SBUxMethod.attr('',	'disabled', true);*/

                $('.ma-btn').attr('disabled', true);
                $('.ma-btn').css("background-color", "#d9d9d9");
                $('.ma-btn').css("color", "#f2f2f2");

            }else{
                $('.ma-btn').attr('disabled', false);
                $('.ma-btn').css("background-color", "#e0e0e0");
                $('.ma-btn').css("color", "#000000");
            }


            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_PAY_GROUP_CODE: PAY_GROUP_CODE
                , V_P_PAY_TYPE: PAY_TYPE
                , V_P_PAY_ITEM_CATEGORY: PAY_ITEM_CATEGORY
                , V_P_PAY_ITEM_CODE: rowData.PAY_ITEM_CODE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: p_userId
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb5300List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '5',

                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    jsonSalaryList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CATEGORY: gfnma_nvl(item.PAY_ITEM_CATEGORY),
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_ITEM_NAME: gfnma_nvl(item.PAY_ITEM_NAME)
                        }
                        jsonSalaryList.push(msg);
                    });
                    gvwSalaryGrid.rebuild();

                    jsonWorkList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_ITEM_NAME: gfnma_nvl(item.PAY_ITEM_NAME)
                        }
                        jsonWorkList.push(msg);
                    });
                    gvwWorkGrid.rebuild();

                    jsonSettingList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            ITEM_CODE: gfnma_nvl(item.ITEM_CODE),
                            ITEM_NAME: gfnma_nvl(item.ITEM_NAME)
                        }
                        jsonSettingList.push(msg);
                    });
                    gvwSettingGrid.rebuild();

                    data.cv_5.forEach((item, index) => {
                        SBUxMethod.set("PAY_FORMULA", gfnma_nvl(item.PAY_FORMULA));
                        SBUxMethod.set("PAY_FORMULA_DESC", gfnma_nvl(item.PAY_FORMULA_DESC));
                        SBUxMethod.set("QTY_FORMULA", gfnma_nvl(item.QTY_FORMULA));
                        SBUxMethod.set("QTY_FORMULA_DESC", gfnma_nvl(item.QTY_FORMULA_DESC));
                        SBUxMethod.set("QTY_UNIT", gfnma_nvl(item.QTY_UNIT));
                    });

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

    // 급여항목 탭에서만 동작하도록 처리
    async function fn_salaryView() {

        let nRow = gvwMasterGrid.getRow();

        let rowData;
        if (nRow < 1) {
            return;
        }else{
            rowData = gvwMasterGrid.getRowData(nRow);

            if (!_.isEmpty(rowData)){
                if (_.isEqual(rowData.SUMMARY_TYPE, 'FORMULA')){
                    return;
                }
            }
        }

        let sCol = gvwSalaryGrid.getCol();
        let sRow = gvwSalaryGrid.getRow();

        //특정 열 부터 이벤트 적용
        if (sCol < 1) {
            return;
        }
        if (sRow < 1) {
            return;
        }

        let sRowData = gvwSalaryGrid.getRowData(sRow);

        let masterAll = gvwMasterGrid.getGridDataAll();

        let chkVal = 'N';

        masterAll.forEach((item, index) => {

            if (_.isEqual(sRowData.PAY_ITEM_CODE, item.PAY_ITEM_CODE)) {
                if (item.CHK_YN != 'Y') {
                    chkVal = 'Y';
                    gfn_comAlert("Q0000", "사용하지 않는 급여항목은 계산 수식에 추가할 수 없습니다. [HRB5300_002]");
                }
            }

        });

        if (_.isEqual(chkVal, 'Y')){
            return;
        }

        let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
        let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));

        SBUxMethod.set("PAY_FORMULA", 			PAY_FORMULA + '<'+ sRowData.PAY_ITEM_CODE +'>');
        SBUxMethod.set("PAY_FORMULA_DESC", 		PAY_FORMULA_DESC + '<'+ sRowData.PAY_ITEM_NAME +'>');

    }

    async function fn_workView() {

        let nRow = gvwMasterGrid.getRow();

        let rowData;
        if (nRow < 1) {
            return;
        }else{
            rowData = gvwMasterGrid.getRowData(nRow);

            if (!_.isEmpty(rowData)){
                if (_.isEqual(rowData.SUMMARY_TYPE, 'FORMULA')){
                    return;
                }
            }
        }

        let wCol = gvwWorkGrid.getCol();
        let wRow = gvwWorkGrid.getRow();

        //특정 열 부터 이벤트 적용
        if (wCol < 1) {
            return;
        }
        if (wRow < 1) {
            return;
        }

        let wRowData = gvwWorkGrid.getRowData(wRow);

        if (!_.isEmpty(wRowData)) {

            let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
            let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));

            SBUxMethod.set("PAY_FORMULA", PAY_FORMULA + '<' + wRowData.PAY_ITEM_CODE + '>');
            SBUxMethod.set("PAY_FORMULA_DESC", PAY_FORMULA_DESC + '<' + wRowData.PAY_ITEM_NAME + '>');

        }
    }

    async function fn_settingView() {

        let nRow = gvwMasterGrid.getRow();

        let rowData;
        if (nRow < 1) {
            return;
        }else{
            rowData = gvwMasterGrid.getRowData(nRow);

            if (!_.isEmpty(rowData)){
                if (_.isEqual(rowData.SUMMARY_TYPE, 'FORMULA')){
                    return;
                }
            }
        }

        let seCol = gvwSettingGrid.getCol();
        let seRow = gvwSettingGrid.getRow();

        //특정 열 부터 이벤트 적용
        if (seCol < 1) {
            return;
        }
        if (seRow < 1) {
            return;
        }

        let seRowData = gvwSettingGrid.getRowData(seRow);

        if (!_.isEmpty(seRowData)){

            let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
            let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));

            SBUxMethod.set("PAY_FORMULA", 			PAY_FORMULA + '<'+ seRowData.ITEM_CODE +'>');
            SBUxMethod.set("PAY_FORMULA_DESC", 		PAY_FORMULA_DESC + '<'+ seRowData.ITEM_NAME +'>');

        }
    }

    //저장
    const fn_save = async function () {

        let nCol = gvwInfoGrid.getCol();
        let nRow = gvwInfoGrid.getRow();

        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        if (_.isEmpty(rowData)){
            return;
        }

        let PAY_GROUP_CODE = gfnma_multiSelectGet("#cbopay_group_code");
        let PAY_TYPE = gfnma_multiSelectGet("#cbopay_type");
        let PAY_ITEM_CATEGORY = gfnma_multiSelectGet("#cbopay_item_category");

        let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
        let QTY_FORMULA = gfnma_nvl(SBUxMethod.get("QTY_FORMULA"));
        let QTY_UNIT = gfnma_nvl(SBUxMethod.get("QTY_UNIT"));
        let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));
        let QTY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("QTY_FORMULA_DESC"));


        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            var paramObj = {
                V_P_DEBUG_MODE_YN			: ''
                ,V_P_LANG_ID				: ''
                ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                ,V_P_PAY_GROUP_CODE: PAY_GROUP_CODE
                ,V_P_PAY_TYPE: PAY_TYPE
                ,V_P_USE_CHECK_YN: rowData.CHK_YN
                ,V_P_PAY_ITEM_CODE: rowData.PAY_ITEM_CODE
                ,V_P_PAY_FORMULA: PAY_FORMULA
                ,V_P_PAY_FORMULA_DESC: PAY_FORMULA_DESC
                ,V_P_QTY_FORMULA: QTY_FORMULA
                ,V_P_QTY_FORMULA_DESC: QTY_FORMULA_DESC
                ,V_P_QTY_UNIT: QTY_UNIT
                ,V_P_APPLY_MAX_YN: rowData.APPLY_MAX_YN
                ,V_P_APPLY_MAX_AMT: rowData.APPLY_MAX_AMT
                ,V_P_APPLY_MIN_YN: rowData.APPLY_MIN_YN
                ,V_P_APPLY_MIN_AMT: rowData.APPLY_MIN_AMT
                ,V_P_CALCULATE_SEQ: rowData.CALCULATE_SEQ
                ,V_P_PAY_EXCLUDE_YN: rowData.PAY_EXCLUDE_YN
                ,V_P_PPTLCT_YN: rowData.PPTLCT_YN
                ,V_P_CALC_YN: rowData.CALC_YN
                ,V_P_DESCR: rowData.DESCR

                ,V_P_FORM_ID				: p_formId
                ,V_P_MENU_ID				: p_menuId
                ,V_P_PROC_ID				: ''
                ,V_P_USERID					: ''
                ,V_P_PC						: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb5300.do", {
                getType				: 'json',
                workType			: 'N',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if(data.resultMessage){
                        alert(data.resultMessage);
                    }
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

    async function appendToDisplay(data) {

        let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
        let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));

        SBUxMethod.set("PAY_FORMULA", 			PAY_FORMULA + data);
        SBUxMethod.set("PAY_FORMULA_DESC", 		PAY_FORMULA_DESC + data);

    }

    async function calculateResult() {

        SBUxMethod.set("PAY_FORMULA", 			"");
        SBUxMethod.set("PAY_FORMULA_DESC", 		"");
    }

    async function subToDisplay() {

        let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
        let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));

        SBUxMethod.set("PAY_FORMULA", 			PAY_FORMULA.slice(0, -1));
        SBUxMethod.set("PAY_FORMULA_DESC", 		PAY_FORMULA_DESC.slice(0, -1));
    }

    const fn_btnCheck = async function () {

        let PAY_FORMULA = gfnma_nvl(SBUxMethod.get("PAY_FORMULA"));
        let PAY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("PAY_FORMULA_DESC"));

        let QTY_FORMULA = gfnma_nvl(SBUxMethod.get("QTY_FORMULA"));
        let QTY_FORMULA_DESC = gfnma_nvl(SBUxMethod.get("QTY_FORMULA_DESC"));


        if (PAY_FORMULA == '' && PAY_FORMULA_DESC == '') {
            gfn_comAlert("Q0000", "급여산식은 필수항목입니다. [HRB5300_003]");
        }

        let salary = gvwSalaryGrid.getGridDataAll();
        let work = gvwWorkGrid.getGridDataAll();
        let setting = gvwSettingGrid.getGridDataAll();

        salary.forEach((item, index) => {

            let PAY_ITEM_CODE = '/<' + item.PAY_ITEM_CODE + '>/g';
            let PAY_ITEM_NAME = '/<' + item.PAY_ITEM_NAME + '>/g';

            PAY_FORMULA.replace(PAY_ITEM_CODE, '1');
            PAY_FORMULA_DESC.replace(PAY_ITEM_CODE, '1');
            PAY_FORMULA_DESC.replace(PAY_ITEM_NAME, '1');

            QTY_FORMULA.replace(PAY_ITEM_CODE, '1');
            QTY_FORMULA_DESC.replace(PAY_ITEM_CODE, '1');
            QTY_FORMULA_DESC.replace(PAY_ITEM_NAME, '1');

        });

        work.forEach((item, index) => {

            let PAY_ITEM_CODE = '/<' + item.PAY_ITEM_CODE + '>/g';
            let PAY_ITEM_NAME = '/<' + item.PAY_ITEM_NAME + '>/g';

            PAY_FORMULA.replace(PAY_ITEM_CODE, '1');
            PAY_FORMULA_DESC.replace(PAY_ITEM_CODE, '1');
            PAY_FORMULA_DESC.replace(PAY_ITEM_NAME, '1');

            QTY_FORMULA.replace(PAY_ITEM_CODE, '1');
            QTY_FORMULA_DESC.replace(PAY_ITEM_CODE, '1');
            QTY_FORMULA_DESC.replace(PAY_ITEM_NAME, '1');

        });

        setting.forEach((item, index) => {

           /* let ITEM_CODE = '<' + item.ITEM_CODE + '>';
            let ITEM_NAME = '<' + item.ITEM_NAME + '>';*/

            PAY_FORMULA = PAY_FORMULA.replace('<' + item.ITEM_CODE + '>', '1');
            PAY_FORMULA_DESC = PAY_FORMULA_DESC.replace('<' + item.ITEM_CODE + '>', '1');
            PAY_FORMULA_DESC = PAY_FORMULA_DESC.replace('<' + item.ITEM_NAME + '>', '1');

            QTY_FORMULA = QTY_FORMULA.replace('<' + item.ITEM_CODE + '>', '1');
            QTY_FORMULA_DESC = QTY_FORMULA_DESC.replace('<' + item.ITEM_CODE + '>', '1');
            QTY_FORMULA_DESC = QTY_FORMULA_DESC.replace('<' + item.ITEM_NAME + '>', '1');

        });


        var paramObj = {
            PAY_FORMULA: gfnma_nvl(PAY_FORMULA)
          /*  , PAY_FORMULA_DESC: gfnma_nvl(PAY_FORMULA_DESC)*/
            , QTY_FORMULA: gfnma_nvl(QTY_FORMULA)
           /* , QTY_FORMULA_DESC: gfnma_nvl(QTY_FORMULA_DESC)*/

        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/chkHrb5300.do", paramObj);

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
                gfn_comAlert("Q0000", "정상적인 구문입니다.");

            } else {
                gfn_comAlert("W0018","산식");
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
</html>
