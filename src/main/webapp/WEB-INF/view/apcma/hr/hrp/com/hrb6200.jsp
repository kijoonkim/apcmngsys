<%
    /**
     * @Class Name        : hrp6200.jsp
     * @Description       : 간이세액조건표 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.13
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.13   	표주완		최초 생성
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
    <title>title : 간이세액조건표</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>

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
                </h3><!-- 간이세액조건표 -->
            </div>
        </div>
        <div class="box-search-ma">
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        </div>

    <div class="row">
        <div class="col-sm-4">
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>기준년도</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-gvwMaster" style="height:530px; width:100%;"></div>
            </div>
        </div>

        <div class="col-sm-8">
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>간이세율표 정보</span>
                    </li>
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
                        <th scope="row" class="th_bg">기준년도</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="YYYY"
                                    name="YYYY"
                                    uitype="popup"
                                    datepicker-mode="year"
                                    date-format="yyyy"
                                    class="table-datepicker-ma"
                                    readonly>
                            </sbux-datepicker>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">적용기간</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="APPLY_START_DATE"
                                    name="APPLY_START_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma">
                            </sbux-datepicker>
                        </td>
                        <th>~</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="APPLY_END_DATE"
                                    name="APPLY_END_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma">
                            </sbux-datepicker>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">비고</th>
                        <td colspan="6" class="td_input" >
                            <sbux-textarea id="MEMO" name="MEMO" uitype="normal" cols="100"></sbux-textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="bandgvwDetailTab" >
                        <div class="ad_tbl_toplist">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>간이세율표 정보</span>
                                    <%--<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>--%>
                                </li>
                            </ul>
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
                            <sbux-button
                                    id="btnCopyClear"
                                    name="btnCopyClear"
                                    uitype="normal"
                                    text="복사모드해제" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyClear"
                                    style="float: right; display: block"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCopyLine"
                                    name="btnCopyLine"
                                    uitype="normal"
                                    text="행복사모드" <%--행단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyLine"
                                    style="float: right; display: none;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCopyCell"
                                    name="btnCopyCell"
                                    uitype="normal"
                                    text="셀복사모드" <%--셀단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyCell"
                                    style="float: right; display: none;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-bandgvwDetail" style="height:390px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="gvwItemTab" >
                        <div class="ad_tbl_toplist">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>1000만원 초과</span>
                                    <%--<span style="font-size:12px">(조회건수 <span id="listCount3">0</span>건)</span>--%>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDelItem"
                                    name="btnDelItem"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRowItem"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAddItem"
                                    name="btnAddItem"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRowItem"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCopyClearItem"
                                    name="btnCopyClearItem"
                                    uitype="normal"
                                    text="복사모드해제" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyClearItem"
                                    style="float: right; display: block"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCopyLineItem"
                                    name="btnCopyLineItem"
                                    uitype="normal"
                                    text="행복사모드" <%--행단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyLineItem"
                                    style="float: right; display: none;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCopyCellItem"
                                    name="btnCopyCellItem"
                                    uitype="normal"
                                    text="셀복사모드" <%--셀단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyCellItem"
                                    style="float: right; display: none;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-gvwItem" style="height:390px; width:100%;"></div>
                        </div>
                    </div>
                </div>
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

    //grid 초기화
    var gvwMasterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList = []; 	// 그리드의 참조 데이터 주소 선언
    var grdDetail;
    var jsonDetailList = [];
    var grdItemList;
    var jsonItemList = [];

    var jsonPayType = [];


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([


        ]);
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createDetailGrid('clear');
        fn_createItemGrid('clear');

        fn_search();

    }

    // 신규
    function cfn_add() {
        fn_add();
    }
    // 저장
    async function cfn_save() {
        let nRow = gvwMasterGrid.getRow();

        if (fn_save()){

            await fn_saveS1();
            await fn_saveS2();
        }

        fn_search(nRow);
    }
    // 삭제
    function cfn_del() {
        if(gfn_comConfirm("Q0001", "삭제")) { //{0} 하시겠습니까?
            fn_delete();
        }
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

    //기준년도
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwMaster';
        SBGridProperties.id = 'gvwMasterGrid';
        SBGridProperties.jsonref = 'jsonMasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ['기준년도'], ref: 'YYYY', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}, disabled: true},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["메모"], ref: 'MEMO', type: 'output', width: '200px', style: 'text-align:left', disabled: true}

        ];

        gvwMasterGrid = _SBGrid.create(SBGridProperties);
        gvwMasterGrid.bind('click', 'fn_view');
        gvwMasterGrid.bind('keyup', 'fn_keyup');
    }

    //1000만원이하
    const fn_createDetailGrid = function(chMode, rowData) {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-bandgvwDetail';
        SBGridProperties.id = 'grdDetail';
        SBGridProperties.jsonref = 'jsonDetailList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (chMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(chMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if(chMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["월급여액","월급여액이상"], ref: 'PAY_AMT_FR', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["월급여액","월급여액미만"], ref: 'PAY_AMT_TO', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","1"], ref: 'SUPPORTEE1', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","2"], ref: 'SUPPORTEE2', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","3"], ref: 'SUPPORTEE3', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","3(다자녀)"], ref: 'SUPPORTEE3_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","4"], ref: 'SUPPORTEE4', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","4(다자녀)"], ref: 'SUPPORTEE4_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","5"], ref: 'SUPPORTEE5', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","5(다자녀)"], ref: 'SUPPORTEE5_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","6"], ref: 'SUPPORTEE6', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","6(다자녀)"], ref: 'SUPPORTEE6_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","7"], ref: 'SUPPORTEE7', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","7(다자녀)"], ref: 'SUPPORTEE7_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","8"], ref: 'SUPPORTEE8', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","8(다자녀)"], ref: 'SUPPORTEE8_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","9"], ref: 'SUPPORTEE9', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","9(다자녀)"], ref: 'SUPPORTEE9_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","10"], ref: 'SUPPORTEE10', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","10(다자녀)"], ref: 'SUPPORTEE10_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","11"], ref: 'SUPPORTEE11', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["공제대상 가족의 수","11(다자녀)"], ref: 'SUPPORTEE11_CHILDREN', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["기간","시작일"], ref: 'APPLY_START_DATE', 	width:'200px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["기간","종료일"], ref: 'APPLY_END_DATE', 	width:'200px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}}
        ];

        grdDetail = _SBGrid.create(SBGridProperties);


        grdDetail.bind('valuechanged','gridValueChanged');

    }


    const fn_createItemGrid = function(chMode, rowData) {

        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwItem';
        SBGridProperties.id = 'grdItemList';
        SBGridProperties.jsonref = 'jsonItemList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (chMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(chMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if(chMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["이상"], ref: 'PAY_AMT_FR', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ["미만"], ref: 'PAY_AMT_TO', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ["세율"], ref: 'TAX_RATE', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ["누적공제"], ref: 'CUMULATIVE_TAX_DED_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ["세율2"], ref: 'TAX_RATE2', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'200px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'200px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}}

        ];

        grdItemList = _SBGrid.create(SBGridProperties);

        if (rowData != null){
            grdItemList.push(rowData);
        }

    }


    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "1000만원이하", "targetid" : "bandgvwDetailTab" , "targetvalue" : "1000만원이하"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "1000만원초과", "targetid" : "gvwItemTab" ,     "targetvalue" : "1000만원초과"}
    ];


    // 행 추가
    const fn_addRow = function () {
        let rowVal = grdDetail.getRow();

        const msg = {
            PAY_AMT_FR                : 0,
            PAY_AMT_TO                : 0,
            SUPPORTEE1                : 0,
            SUPPORTEE2                : 0,
            SUPPORTEE3                : 0,
            SUPPORTEE3_CHILDREN       : 0,
            SUPPORTEE4                : 0,
            SUPPORTEE4_CHILDREN       : 0,
            SUPPORTEE5                : 0,
            SUPPORTEE5_CHILDREN       : 0,
            SUPPORTEE6                : 0,
            SUPPORTEE6_CHILDREN       : 0,
            SUPPORTEE7                : 0,
            SUPPORTEE7_CHILDREN       : 0,
            SUPPORTEE8                : 0,
            SUPPORTEE8_CHILDREN       : 0,
            SUPPORTEE9                : 0,
            SUPPORTEE9_CHILDREN       : 0,
            SUPPORTEE10               : 0,
            SUPPORTEE10_CHILDREN      : 0,
            SUPPORTEE11               : 0,
            SUPPORTEE11_CHILDREN      : 0,
            APPLY_START_DATE          : '',
            APPLY_END_DATE            : '',

            status: 'i'
        }

        if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.

            grdDetail.addRow(true, msg);
            //grdDetail.addRow(true/*, ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '']*/);


        } else {

            grdDetail.insertRow(rowVal, 'below', msg);
            //grdDetail.insertRow(rowVal/*, 'above', ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '']*/);

        }
    }

    // 행삭제
    const fn_delRow = async function () {

        let rowVal = grdDetail.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {

            grdDetail.deleteRow(rowVal);

        }
    }

    const fn_gridCopyClear = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btnCopyClear').hide();
        $('#btnCopyLine').show();
        $('#btnCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = grdDetail.getGridDataAll();
        _SBGrid.destroy('grdDetail');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createDetailGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btnCopyClear').hide();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').show();

        let datas = grdDetail.getGridDataAll();
        _SBGrid.destroy('grdDetail');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createDetailGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btnCopyClear').show();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').hide();

        let datas = grdDetail.getGridDataAll();
        _SBGrid.destroy('grdDetail');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createDetailGrid(clear, datas);
    }

    // 행 추가
    const fn_addRowItem = function() {

        let rowVal = grdItemList.getRow();

        const msg = {
            PAY_AMT_FR                : 0,
            PAY_AMT_TO                : 0,
            TAX_RATE                  : 0,
            CUMULATIVE_TAX_DED_AMT    : 0,
            TAX_RATE2                 : 0,
            APPLY_START_DATE          : '',
            APPLY_END_DATE            : '',

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            grdItemList.addRow(true, msg);
            //grdItemList.addRow(true/*, ['0','0','0','0','0','','']*/);

        }else{

            grdItemList.insertRow(rowVal, 'below', msg);
            //grdItemList.insertRow(rowVal/*, 'above',['0','0','0','0','0','','']*/);
        }
    }

    // 행삭제
    const fn_delRowItem = async function () {

        let rowVal = grdItemList.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {

            grdItemList.deleteRow(rowVal);

        }
    }

    const fn_gridCopyClearItem = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btnCopyClearItem').hide();
        $('#btnCopyLineItem').show();
        $('#btnCopyCellItem').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = grdItemList.getGridDataAll();
        _SBGrid.destroy('grdItemList');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createItemGrid(line, datas);


    }
    const fn_gridCopyLineItem = function () { /*행복사 (행복사모드)*/
        $('#btnCopyClearItem').hide();
        $('#btnCopyLineItem').hide();
        $('#btnCopyCellItem').show();

        let datas = grdItemList.getGridDataAll();
        _SBGrid.destroy('grdItemList');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createItemGrid(cell, datas);

    }
    const fn_gridCopyCellItem = function () { /*셀복사 (셀복사모드)*/
        $('#btnCopyClearItem').show();
        $('#btnCopyLineItem').hide();
        $('#btnCopyCellItem').hide();

        let datas = grdItemList.getGridDataAll();
        _SBGrid.destroy('grdItemList');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createItemGrid(clear, datas);
    }


    //조회
    async function fn_search(nRow) {

        let YYYY = gfn_nvl(SBUxMethod.get("YYYY"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YYYY : YYYY

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };


        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb6200List.do", {
            getType				: 'json',
            workType			: 'MASTER',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonMasterList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        YYYY                : gfn_nvl(item.YYYY),
                        APPLY_START_DATE    : gfn_nvl(item.APPLY_START_DATE),
                        APPLY_END_DATE      : gfn_nvl(item.APPLY_END_DATE),
                        MEMO                : gfn_nvl(item.MEMO)
                    }
                    jsonMasterList.push(msg);
                    totalRecordCount ++;
                });

                gvwMasterGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonMasterList.length > 0) {
                    gvwMasterGrid.clickRow(gfn_nvl(nRow) == '' ? 1 : nRow);
                }

                //fn_view();

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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {

        editType    = 'U';

        let nRow = gvwMasterGrid.getRow();
        let nCol = gvwMasterGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow == -1) {
            return;
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            SBUxMethod.set("YYYY"               , gfn_nvl(rowData.YYYY));
            SBUxMethod.set("APPLY_START_DATE"   , gfn_nvl(rowData.APPLY_START_DATE));
            SBUxMethod.set("APPLY_END_DATE"     , gfn_nvl(rowData.APPLY_END_DATE));
            SBUxMethod.set("MEMO"               , gfn_nvl(rowData.MEMO));

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedCorpCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_YYYY  : gfn_nvl(rowData.YYYY)

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''

                , V_P_USERID: ''
                , V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb6200List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '3',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {


                    /** @type {number} **/
                    //let totalRecordCount2 = 0;

                    jsonDetailList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            PAY_AMT_FR          : gfn_nvl(item.PAY_AMT_FR),
                            PAY_AMT_TO          : gfn_nvl(item.PAY_AMT_TO),
                            SUPPORTEE1          : gfn_nvl(item.SUPPORTEE1),
                            SUPPORTEE2          : gfn_nvl(item.SUPPORTEE2),
                            SUPPORTEE3          : gfn_nvl(item.SUPPORTEE3),
                            SUPPORTEE3_CHILDREN : gfn_nvl(item.SUPPORTEE3_CHILDREN),
                            SUPPORTEE4          : gfn_nvl(item.SUPPORTEE4),
                            SUPPORTEE4_CHILDREN : gfn_nvl(item.SUPPORTEE4_CHILDREN),
                            SUPPORTEE5          : gfn_nvl(item.SUPPORTEE5),
                            SUPPORTEE5_CHILDREN : gfn_nvl(item.SUPPORTEE5_CHILDREN),
                            SUPPORTEE6          : gfn_nvl(item.SUPPORTEE6),
                            SUPPORTEE6_CHILDREN : gfn_nvl(item.SUPPORTEE6_CHILDREN),
                            SUPPORTEE7          : gfn_nvl(item.SUPPORTEE7),
                            SUPPORTEE7_CHILDREN : gfn_nvl(item.SUPPORTEE7_CHILDREN),
                            SUPPORTEE8          : gfn_nvl(item.SUPPORTEE8),
                            SUPPORTEE8_CHILDREN : gfn_nvl(item.SUPPORTEE8_CHILDREN),
                            SUPPORTEE9          : gfn_nvl(item.SUPPORTEE9),
                            SUPPORTEE9_CHILDREN : gfn_nvl(item.SUPPORTEE9_CHILDREN),
                            SUPPORTEE10         : gfn_nvl(item.SUPPORTEE10),
                            SUPPORTEE10_CHILDREN: gfn_nvl(item.SUPPORTEE10_CHILDREN),
                            SUPPORTEE11         : gfn_nvl(item.SUPPORTEE11),
                            SUPPORTEE11_CHILDREN: gfn_nvl(item.SUPPORTEE11_CHILDREN),
                            APPLY_START_DATE    : gfn_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE      : gfn_nvl(item.APPLY_END_DATE)
                        }
                        jsonDetailList.push(msg);
                        //totalRecordCount2++;
                    });

                    grdDetail.rebuild();
                    //document.querySelector('#listCount2').innerText = totalRecordCount2;



                    /** @type {number} **/
                    //let totalRecordCount3 = 0;

                    jsonItemList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_AMT_FR              : gfn_nvl(item.PAY_AMT_FR),
                            PAY_AMT_TO              : gfn_nvl(item.PAY_AMT_TO),
                            TAX_RATE                : gfn_nvl(item.TAX_RATE),
                            TAX_RATE2               : gfn_nvl(item.TAX_RATE2),
                            CUMULATIVE_TAX_DED_AMT  : gfn_nvl(item.CUMULATIVE_TAX_DED_AMT),
                            APPLY_START_DATE        : gfn_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE          : gfn_nvl(item.APPLY_END_DATE)
                        }
                        jsonItemList.push(msg);
                        //totalRecordCount3++;
                    });

                    grdItemList.rebuild();
                    //document.querySelector('#listCount3').innerText = totalRecordCount3;


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

    //신규 작성
    function fn_add() {

        editType    = 'N';

        SBUxMethod.attr('YYYY'           ,	'readonly', false);

        SBUxMethod.set("YYYY"            , 			"");
        SBUxMethod.set("APPLY_START_DATE", 			"");
        SBUxMethod.set("APPLY_END_DATE"  , 			"");
        SBUxMethod.set("MEMO"            , 			"");


        jsonDetailList.length = 0;
        grdDetail.rebuild();

        jsonItemList.length = 0;
        grdItemList.rebuild();
    }

    //저장
    const fn_save = async function () {

        let YYYY                = gfn_nvl(SBUxMethod.get("YYYY"));
        let APPLY_START_DATE    = gfn_nvl(SBUxMethod.get("APPLY_START_DATE"));
        let APPLY_END_DATE      = gfn_nvl(SBUxMethod.get("APPLY_END_DATE"));
        let MEMO                = gfn_nvl(SBUxMethod.get("MEMO"));

        if (!YYYY) {
            gfn_comAlert("W0002", "기준년도");
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

        var paramObj = {
            V_P_DEBUG_MODE_YN			: ''
            ,V_P_LANG_ID				: ''
            ,V_P_COMP_CODE				: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

            ,V_P_YYYY                : YYYY
            ,V_P_APPLY_START_DATE    : APPLY_START_DATE
            ,V_P_APPLY_END_DATE      : APPLY_END_DATE
            ,V_P_MEMO                : MEMO

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''


        };

        if (_.isEqual(editType, "N")){
            // 수정 저장
            if (gfn_comConfirm("Q0001", "신규 등록")) {
                const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6200.do", {
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
                        //await fn_saveS1();
                        //await fn_saveS2();
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
                }
            }
        }else if (_.isEqual(editType, "U")){
            // 수정 저장
            if (gfn_comConfirm("Q0001", "수정 저장")) {
                const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6200.do", {
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

                        return true;
                        //fn_saveS1();


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
                }
            }
        }
    }

    //저장 Detail

    const fn_saveS1 = async function () {

        let updatedData = grdDetail.getUpdateData(true, 'all');

       /* if (_.isEmpty(updatedData)){
            fn_saveS2();
            return;
        }*/

        let listData = [];
        listData =  await getParamFormS1(updatedData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6200S1.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        /*fn_search();*/
                    }

                    //fn_saveS2();
                    return true;

                } else {
                    alert(data.resultMessage);
                    return false;
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamFormS1 = async function (updatedData) {

        let YYYY = gfn_nvl(SBUxMethod.get("YYYY"));

        let returnData = [];

        if (!_.isEmpty(updatedData)) {
            updatedData.forEach((item, index) => {

                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedCorpCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        , V_P_YYYY                  : YYYY
                        , V_P_PAY_AMT_FR            : item.data.PAY_AMT_FR
                        , V_P_PAY_AMT_TO            : item.data.PAY_AMT_TO
                        , V_P_SUPPORTEE1            : item.data.SUPPORTEE1
                        , V_P_SUPPORTEE2            : item.data.SUPPORTEE2
                        , V_P_SUPPORTEE3            : item.data.SUPPORTEE3
                        , V_P_SUPPORTEE3_CHILDREN   : item.data.SUPPORTEE3_CHILDREN
                        , V_P_SUPPORTEE4            : item.data.SUPPORTEE4
                        , V_P_SUPPORTEE4_CHILDREN   : item.data.SUPPORTEE4_CHILDREN
                        , V_P_SUPPORTEE5            : item.data.SUPPORTEE5
                        , V_P_SUPPORTEE5_CHILDREN   : item.data.SUPPORTEE5_CHILDREN
                        , V_P_SUPPORTEE6            : item.data.SUPPORTEE6
                        , V_P_SUPPORTEE6_CHILDREN   : item.data.SUPPORTEE6_CHILDREN
                        , V_P_SUPPORTEE7            : item.data.SUPPORTEE7
                        , V_P_SUPPORTEE7_CHILDREN   : item.data.SUPPORTEE7_CHILDREN
                        , V_P_SUPPORTEE8            : item.data.SUPPORTEE8
                        , V_P_SUPPORTEE8_CHILDREN   : item.data.SUPPORTEE8_CHILDREN
                        , V_P_SUPPORTEE9            : item.data.SUPPORTEE9
                        , V_P_SUPPORTEE9_CHILDREN   : item.data.SUPPORTEE9_CHILDREN
                        , V_P_SUPPORTEE10           : item.data.SUPPORTEE10
                        , V_P_SUPPORTEE10_CHILDREN  : item.data.SUPPORTEE10_CHILDREN
                        , V_P_SUPPORTEE11           : item.data.SUPPORTEE11
                        , V_P_SUPPORTEE11_CHILDREN  : item.data.SUPPORTEE11_CHILDREN
                        , V_P_APPLY_START_DATE      : item.data.APPLY_START_DATE
                        , V_P_APPLY_END_DATE        : item.data.APPLY_END_DATE

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }

                returnData.push(param);

            });
        }

        return returnData;
    }

    //저장 Item
    const fn_saveS2 = async function () {

        let updatedData = grdItemList.getUpdateData(true, 'all');

        if (_.isEmpty(updatedData)){
            fn_search();
            return;
        }

        let listData = [];
        listData =  await getParamFormS2(updatedData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6200S2.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }/*else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
                    }*/
                    return true;

                } else {
                    alert(data.resultMessage);
                    return false;
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamFormS2 = async function (updatedData) {

        let YYYY = gfn_nvl(SBUxMethod.get("YYYY"));

        let returnData = [];

        if (!_.isEmpty(updatedData)) {
            updatedData.forEach((item, index) => {

                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedCorpCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        ,V_P_YYYY                   : YYYY
                        ,V_P_PAY_AMT_FR             : item.data.PAY_AMT_FR
                        ,V_P_PAY_AMT_TO             : item.data.PAY_AMT_TO
                        ,V_P_TAX_RATE               : item.data.TAX_RATE
                        ,V_P_CUMULATIVE_TAX_DED_AMT : item.data.CUMULATIVE_TAX_DED_AMT
                        ,V_P_TAX_RATE2              : item.data.TAX_RATE2
                        ,V_P_APPLY_START_DATE       : item.data.APPLY_START_DATE
                        ,V_P_APPLY_END_DATE         : item.data.APPLY_END_DATE

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }
                returnData.push(param);

            });
        }

        return returnData;
    }


    //삭제
    const fn_delete = async function () {

        let YYYY = gfn_nvl(SBUxMethod.get("YYYY"));
        let APPLY_START_DATE = gfn_nvl(SBUxMethod.get("APPLY_START_DATE"));
        let APPLY_END_DATE = gfn_nvl(SBUxMethod.get("APPLY_END_DATE"));
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));

        if (!YYYY) {
            gfn_comAlert("W0002", "기준년도");
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

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_YYYY: YYYY
            , V_P_APPLY_START_DATE: APPLY_START_DATE
            , V_P_APPLY_END_DATE: APPLY_END_DATE
            , V_P_MEMO: MEMO

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''


        };
        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb6200.do", {
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
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }

    //상세정보 보기
    async function gridValueChanged() {

        var nRow = grdDetail.getRow();
        var nCol = grdDetail.getCol();

        if (nCol == 0){

            //3 == 신규  2 == 수정 4 == 삭제 0 == 변경x
            let rowStatus = grdDetail.getRowStatus(nRow);

            if (_.isEqual(rowStatus, 3)){
                return;
            }else{
                var cellData = grdDetail.getPrevCellDataInfo();

                grdDetail.setCellData(nRow, nCol, cellData, true);
            }

        }else if (nCol == 1){

            //3 == 신규  2 == 수정 4 == 삭제 0 == 변경x
            let rowStatus = grdDetail.getRowStatus(nRow);

            if (_.isEqual(rowStatus, 3)){
                return;
            }else{
                var cellData = grdDetail.getPrevCellDataInfo();

                grdDetail.setCellData(nRow, nCol, cellData, true);
            }

        }

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

