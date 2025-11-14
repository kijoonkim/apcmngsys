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
                <sbux-button id="btnLastSbmsn" name="btnLastSbmsn" uitype="normal" text="최종제출" class="btn btn-sm btn-outline-danger" onclick="fn_prgrsSttsAprv('SBMT')"></sbux-button>
                <sbux-button id="btnLastSbmsnCancel" name="btnLastSbmsnCancel" uitype="normal" text="최종제출 취소" class="btn btn-sm btn-outline-danger" onclick="fn_prgrsSttsCancel('SBMT')"></sbux-button>
                <sbux-button id="btnApoDdlnAprv" name="btnApoDdlnAprv" uitype="normal" text="마감" class="btn btn-sm btn-outline-danger" onclick="fn_prgrsSttsAprv('DDLN')"></sbux-button>
                <sbux-button id="btnApoDdlnCancel" name="btnApoDdlnCancel" uitype="normal" text="마감취소" class="btn btn-sm btn-outline-danger" onclick="fn_prgrsSttsCancel('DDLN')"></sbux-button>
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
                        <sbux-select id="dtl-slt-apoSe" name="dtl-slt-apoSe" class="form-control input-sm" uitype="single" unselected-text="전체" jsondata-ref="jsonApoSe"></sbux-select>
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
    var jsonApoSe = [
        {value : '1', text : '통합조직'},
        {value : '2', text : '출자출하조직'}
    ];

    /** Yn **/
    var jsonYn = [
        {value : 'Y', text :'Y'},
        {value : 'N', text :'N'}
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
        SBGridProperties.jsonref = 'jsonPrgrs';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = 'seq';
        SBGridProperties.rowheaderwidth = {seq : '30'};

        SBGridProperties.columns = [
            {
                caption : ["<input type='checkbox' onchange='fn_checkAll(gridPrgrs, this);'>"],
                ref: 'checkedYn', type: 'checkbox',  width:'3%',
                style: 'text-align:center',
                userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : false, rowindex : 0}}
            },
            {caption: ['등록연도'],			ref: 'crtrYr', 	    width: '5%', type: 'output',style: 'text-align:center'},
            {caption: ['법인명'], 			ref: 'corpNm', 	width: '11%', type: 'output', style: 'text-align:center'},
            {caption: ['구분'], 			ref: 'apoSeNm', 		width: '6%', type: 'output', style: 'text-align:center'},
            {caption: ['통합조직명'], 			ref: 'uoCorpNm', 		width: '12%', type: 'output', style: 'text-align:center'},
            {caption: ['최종제출'], 			ref: 'lastSbmsnYn', 		width: '4%', type: 'output', style: 'text-align:center'},
            {caption: ['법인체마감'], 			ref: 'corpDdlnYn', 		width: '4%', type: 'output', style: 'text-align:center'},
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

    /**
     * @name fn_search
     * @description 진척도 조회
     */
    const fn_search = async function () {
        const crtrYr = SBUxMethod.get('dtl-slt-regYr'); // 등록연도
        const apoSe = SBUxMethod.get('dtl-slt-apoSe'); // 조직구분
        const corpDdlnYn = SBUxMethod.get('dtl-slt-corpDdln'); // 법인체마감
        const corpNm = SBUxMethod.get('dtl-inp-corpNm'); // 법인명
        const brno = SBUxMethod.get('dtl-inp-brno'); // 사업자번호
        const lastSbmsnYn = SBUxMethod.get('dtl-slt-lastSbmsn'); // 최종제출

        jsonPrgrs.length = 0;

        const postJsonPromise = gfn_postJSON("/pd/aom/selectPruoPrgrsList.do", {
            crtrYr : crtrYr,
            corpNm : corpNm,
            brno : brno,
            apoSe : apoSe,
            corpDdlnYn : corpDdlnYn,
            lastSbmsnYn : lastSbmsnYn,
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultList.length > 0) {
                    data.resultList.forEach(item => {
                        const vo = {
                           crtrYr : item.crtrYr
                           , corpNm : item.corpNm
                           , apoSeNm : item.apoSeNm
                           , apoCd : item.apoCd
                           , apoSe : item.apoSe
                           , lastSbmsnYn : item.lastSbmsnYn
                           , corpDdlnYn : item.corpDdlnYn
                           , uoBrno : item.uoBrno
                           , uoCorpNm : item.uoCorpNm
                           , prgrs1: fn_prgrsChange(item.prgrs1)
                           , prgrs2: fn_prgrsChange(item.prgrs2)
                           , prgrs3: fn_prgrsChange(item.prgrs3)
                           , prgrs4: fn_prgrsChange(item.prgrs4)
                           , prgrs5: fn_prgrsChange(item.prgrs5)
                           , prgrs6: fn_prgrsChange(item.prgrs6)
                           , prgrs7: fn_prgrsChange(item.prgrs7)
                           , prgrs8: fn_prgrsChange(item.prgrs8)
                           , prgrs9: fn_prgrsChange(item.prgrs9)
                           , prgrs10: fn_prgrsChange(item.prgrs10)
                        }
                        jsonPrgrs.push(vo);
                    });
                }
                gridPrgrs.refresh();
                // 조회건수
                document.querySelector('#prgrsList').innerText = data.resultList.length;

            } else {
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }

    /**
     * @name fn_prgrsChange
     * @description 진행상태 모양 변경
     */
    function fn_prgrsChange (value) {
        if (value == 'Y') {
            return '◯';
        } else if (value == 'T') {
            return '△';
        } else {
            return 'X'
        }
    }

    /**
     * @name fn_prgrsSttsAprv
     * @description 최종제출, 마감 처리
     */
    const fn_prgrsSttsAprv = async function (sttsCd) {

        let sttsNm;
        let corpDdlnSeCd;
        if (gfn_isEmpty(sttsCd)) {
            gfn_comAlert("W0005", "진행상태 코드"); // W0005 {0}이/가 없습니다.
            return;
        }
        if (sttsCd == 'SBMT') {
            sttsNm = "최종제출";
        } else if (sttsCd == 'DDLN') {
            sttsNm = "마감";
            corpDdlnSeCd = 'Y'
        }

        const allData = gridPrgrs.getGridDataAll();
        const checkedDataList = [];
        for (let i = 0; i < allData.length; i++) {
            if (_.isEqual(allData[i].checkedYn, "Y")) {
                checkedDataList.push({
                    crtrYr : allData[i].crtrYr,
                    apoCd : allData[i].apoCd,
                    prgrsStpCd : sttsCd,
                    corpDdlnSeCd :corpDdlnSeCd
                });
            }
        }

        if (gfn_isEmpty(checkedDataList)) {
            gfn_comAlert("W0003", sttsNm); // W0003 {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", sttsNm)) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/pd/aom/insertPruoPrgrsApoList.do", checkedDataList);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                await fn_search();
            } else {
                // gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                gfn_comAlert(data.resultCode, data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_prgrsSttsCancel = async function (sttsCd) {
        let sttsNm;
        if (gfn_isEmpty(sttsCd)) {
            gfn_comAlert("W0005", "진행상태 코드"); // W0005 {0}이/가 없습니다.
            return;
        }
        if (sttsCd == 'SBMT') {
            sttsNm = "최종제출 취소";
        } else if (sttsCd == 'DDLN') {
            sttsNm = "마감 취소";
        }

        const allData = gridPrgrs.getGridDataAll();
        const checkedCancelList = [];
        for (let i = 0; i < allData.length; i++) {
            if (_.isEqual(allData[i].checkedYn, "Y")) {
                checkedCancelList.push({
                    crtrYr: allData[i].crtrYr,
                    apoCd: allData[i].apoCd,
                    prgrsStpCd: sttsCd
                });
            }
        }

        if (gfn_isEmpty(checkedCancelList)) {
            gfn_comAlert("W0003", sttsNm); // W0003 {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", sttsNm)) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/pd/aom/updatePruoPrgrsApoCnclList.do", checkedCancelList);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                await fn_search();
            } else {
                // gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                gfn_comAlert(data.resultCode, data.resultMessage);
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
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>