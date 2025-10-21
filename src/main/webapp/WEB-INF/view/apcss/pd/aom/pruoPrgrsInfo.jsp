<%
    /**
     * @Class Name : pruoPrgrsInfo.jsp
     * @Description : 생산유통통합조직 진척도 확인
     * @author SI개발부
     * @since 2025.09.29
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.09.29   유민지	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 진척도 확인</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<style>
    .btnClass {
        vertical-align: middle;
        line-height: normal;
        padding-top: 2px;
    }

    .btnClass:hover {
        background-color: #0d6efd;
        color: white;
    }
</style>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 진척도 확인 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <table class="table table-bordered tbl_fixed">
                <caption>진척도 확인 조회 조건</caption>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">등록연도</th>
                    <td class="td_input">
                        <sbux-select id="dtl-slt-regYr" name="dtl-slt-regYr" class="form-control input-sm" uitype="single" jsondata-ref="jsonRegYr"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">조직구분</th>
                    <td class="td_input">
                        <sbux-select id="dtl-slt-ognzSe" name="dtl-slt-ognzSe" class="form-control input-sm" uitype="single" unselected-text="전체" jsondata-ref="jsonOgnzSe"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">법인체마감</th>
                    <td class="td_input">
                        <sbux-select id="dtl-slt-corpDdln" name="dtl-slt-corpDdln" class="form-control input-sm" uitype="single" unselected-text="전체" jsondata-ref="jsonYn" ></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">법인명</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-corpNm" name="dtl-inp-corpNm" uitype="text" class="form-control input-sm" ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-brno" name="dtl-inp-brno" uitype="text" class="form-control input-sm" ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">최종제출</th>
                    <td class="td_input">
                        <sbux-select id="dtl-slt-lastSbmsn" name="dtl-slt-lastSbmsn" class="form-control input-sm" uitype="single" unselected-text="전체" jsondata-ref="jsonYn"></sbux-select>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>진척도</span>
                        <span style="font-size:12px">(조회건수 <span id="prgrsList">0</span>건 )</span>
                    </li>
                </ul>
                <span>◯ : 저장, △ : 임시저장, X : 미입력</span>
            </div>
            <div class="ad_tbl_toplist"></div>
            <div id="sb-area-prgrs" style="height: 500px"></div>
        </div>
    </div>

</section>
</body>
<script type="text/javascript">

    /** 진척도 **/
    var jsonPrgrs = [];
    var gridPrgrs;

    /** 등록연도 **/
    var jsonRegYr = [];

    /** 조직구분 **/
    var jsonOgnzSe = [
        {value : 'uo', text : '통합조직'},
        {value : 'iso', text : '출자출하조직'}
    ];

    /** Yn **/
    var jsonYn = [
        {value : 'Y', text :'Y'},
        {value : 'N', text :'N'}
    ]

    /** 진척도샘플데이터 **/
    var jsonSampleData = [
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "가교버섯영농조합법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "N",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "X"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "강원감자농협조합공동사업법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "Y",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "△", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "X",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "강원연합사업단",
            "ognzSe": "통합조직",
            "lastSbmsn": "N",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "X"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "거창한거창조합공동사업법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "Y",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "△", "prgrs9": "◯", "prgrs10": "△"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "경기과일농협조합공동사업법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "N",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "경주시농협원예조합공동사업법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "Y",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "고령군농협조합공동사업법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "N",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "고창군농협조합공동사업법인 원예사업부",
            "ognzSe": "통합조직",
            "lastSbmsn": "Y",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "X"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "공주시농협조합공동사업법인",
            "ognzSe": "통합조직",
            "lastSbmsn": "N",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "송현농업회사법인 유한회사",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "N",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "△", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "(주)농업회사법인 지인",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "Y",
            "corpDdln": "Y",
            "prgrs1": "X", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "가람영농조합법인",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "Y",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "가산농협",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "N",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "△", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "X"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "가야농업협동조합",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "Y",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "X"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "감곡농협",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "N",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "감문농업협동조합",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "N",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "강경농업협동조합",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "Y",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "강동농협",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "Y",
            "corpDdln": "N",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "△", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "◯"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "강릉농업협동조합",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "N",
            "corpDdln": "Y",
            "prgrs1": "X", "prgrs2": "◯", "prgrs3": "◯", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "X"
        },
        {
            "checkedYn": 'N',
            "regYr": '2025',
            "corpNm": "거창농업협동조합",
            "ognzSe": "출자출하조직",
            "lastSbmsn": "Y",
            "corpDdln": "Y",
            "prgrs1": "◯", "prgrs2": "◯", "prgrs3": "△", "prgrs4": "◯", "prgrs5": "◯",
            "prgrs6": "◯", "prgrs7": "◯", "prgrs8": "◯", "prgrs9": "◯", "prgrs10": "△"
        }
    ]

    const initIndtfNo = "2025";

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_setInitPage("dtl-slt-regYr", initIndtfNo); // 등록연도 조회
        await fn_init()
    });

    /**
     * @name fn_init
     * @description fn_init
     */
    const fn_init = async function() {
        fn_createPrgrsGrid(); // 진척도 그리드
    }


    const fn_setInitPage = async function(_targetId, _initIndtfNo) {

        jsonRegYr.length = 0;
        const pruoMst = await gfn_getPruoRegMst();
        if (Array.isArray(pruoMst)) {
            pruoMst.forEach((item) => {
                jsonRegYr.push({
                    'text': item.indctNm,
                    'label': item.indctNm,
                    'value': item.crtrYr
                });
            });
            SBUxMethod.refresh(_targetId);
        }
        SBUxMethod.set(_targetId, _initIndtfNo);
    }

    /**
     * @name fn_createPrgrsGrid
     * @description 진척도 그리드
     */
    const fn_createPrgrsGrid = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-prgrs';
        SBGridProperties.id = 'gridPrgrs';
        SBGridProperties.jsonref = 'jsonSampleData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = 'seq';
        SBGridProperties.rowheaderwidth = {seq : '30'};

        SBGridProperties.columns = [
            {
                caption : ["<input type='checkbox' onchange='fn_checkAll(gridPrgrs, this);'>"],
                ref: 'checkedYn', type: 'checkbox',  width:'4%',
                style: 'text-align:center',
                userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : false, rowindex : 0}}
            },
            {caption: ['등록연도'],			ref: 'regYr', 	    width: '6%', type: 'output',style: 'text-align:center'},
            {caption: ['법인명'], 			ref: 'corpNm', 	width: '15%', type: 'output', style: 'text-align:center'},
            {caption: ['구분'], 			ref: 'ognzSe', 		width: '10%', type: 'output', style: 'text-align:center'},
            {caption: ['최종제출'], 			ref: 'lastSbmsn', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['법인체마감'], 			ref: 'corpDdln', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['1'], 			ref: 'prgrs1', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['2'], 			ref: 'prgrs2', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['3'], 			ref: 'prgrs3', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['4'], 			ref: 'prgrs4', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['5'], 			ref: 'prgrs5', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['6'], 			ref: 'prgrs6', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['7'], 			ref: 'prgrs7', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['8'], 			ref: 'prgrs8', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['9'], 			ref: 'prgrs9', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['10'], 			ref: 'prgrs10', 	width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['출력'], 			ref: 'otpt', 	width: '5%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '출력', callback: function(){fn_otptPrgrs()}}},
        ];
        gridPrgrs = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_checkAll
     * @description 그리드 체크박스 전체 선택
     */
    const fn_checkAll = function (grid, obj) {

        const checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        const getColRef = grid.getColRef("checkedYn");
        for (var i=0; i<grid.getGridDataAll().length; i++ ){
            grid.setCellData(i+2, getColRef, checkedYn, true, false);
        }

        grid.refresh();
    }

    /**
     * @name fn_otptPrgrs
     * @description 진척도 출력
     */
    const fn_otptPrgrs = function() {
        console.log("출력");
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>