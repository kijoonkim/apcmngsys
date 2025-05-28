<%
    /**
     * @Class Name : apcCmsuRegMng.jsp
     * @Description : APC전수조사 등록 관리
     * @author SI개발부
     * @since 2025.5.19
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.05.20   유민지	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : APC전수조사 등록 관리</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- APC전수조사 등록 관리 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSaveExmnYrMng" name="btnSaveExmnYrMng" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveExmnYrMng"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>조사연도 관리</span></li>
                </ul>
            </div>
            <div class="ad_tbl_toplist"></div>
            <div id="sb-area-exmnYrMng"></div>

            <div style="height: 10px"></div>

            <div style="display: flex ; flex-direction : row; gap : 10px";>
                <div style = "flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>운영자 정보</span></li>
                            <li><span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span></li>
                        </ul>

                        <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                            <sbux-button id="btnSearchOperPrsnInfo" name="btnSearchOperPrsnInfo" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectOperPrsnList"></sbux-button>
                        </div>
                    </div>

                    <div class="ad_tbl_toplist"></div>
                    <div id="sb-area-operPrsnInfo" style="height: 400px"></div>
                </div>

                <div style = "flex :1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>운영자정보 상세</span></li>
                        </ul>

                        <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                            <sbux-button id="btnSaveOperPrsnInfoDtl" name="btnSaveOperPrsnInfoDtl" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveOperPrsnInfoDtl"></sbux-button>
                        </div>
                    </div>
                    <div class="ad_tbl_toplist"></div>

                    <table class="table table-bordered tbl_fixed">
                        <caption>운영자정보 상세</caption>
                        <tbody>
                            <tr>
                                <th scope="row" class="th_bg"></span>기준연도</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-crtrYr" name="dtl-inp-crtrYr" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>APC코드</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-apcCd" name="dtl-inp-apcCd" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"></span>APC명</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-apcNm" name="dtl-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>APC사업자번호</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-apcBrno" name="dtl-inp-apcBrno" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row" class="th_bg"></span>시도</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-ctpvNm" name="dtl-inp-ctpvNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>시군</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-sigunNm" name="dtl-inp-sigunNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"></span>APC 주소</th>
                                <td class="td_input" colspan="3">
                                    <sbux-input id="dtl-inp-apcLoctn" name="dtl-inp-apcLoctn" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row" class="th_bg"></span>운영조직명</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-operOgnzNm" name="dtl-inp-operOgnzNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>운영조직사업자번호</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-operOgnzBrno" name="dtl-inp-operOgnzBrno" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"></span>운영조직 주소</th>
                                <td class="td_input" colspan="3">
                                    <sbux-input id="dtl-inp-loctn" name="dtl-inp-loctn" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row" class="th_bg"></span>대표자</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-rprsv" name="dtl-inp-rprsv" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>소유자</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-ownr" name="dtl-inp-ownr" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"></span>전년도 조직유형</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-pyOgnzTypeNm" name="dtl-inp-pyOgnzTypeNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>조직유형</th>
                                <td class="td_input">
                                    <sbux-select id="dtl-slt-ognzTypeCd" name="dtl-slt-ognzTypeCd" uitype="single" class="form-control input-sm" jsondata-ref="jsonOgnzType" unselected-text="선택"></sbux-select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"></span>전년도 유형</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-pyTypeNm" name="dtl-inp-pyTypeNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>유형</th>
                                <td class="td_input">
                                    <sbux-select id="dtl-slt-typeCd" name="dtl-slt-typeCd" uitype="single" class="form-control input-sm" jsondata-ref="jsonType" unselected-text="선택"></sbux-select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"></span>전년도 주체</th>
                                <td class="td_input">
                                    <sbux-input id="dtl-inp-pyMb" name="dtl-inp-pyMb" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg"></span>주체</th>
                                <td class="td_input">
                                    <sbux-select id="dtl-slt-mb" name="dtl-slt-mb" uitype="single" class="form-control input-sm" jsondata-ref="jsonMb" unselected-text="선택" jsondata-value="label"></sbux-select>
                                </td>
                            </tr>

                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

</section>

</body>
<script type="text/javascript">

    /** 조사연도 관리 **/
    var jsonExmnYrMng = [];
    var gridExmnYrMng;

    /** 조사연도 관리 상세 **/
    var jsonExmnYrMngDtl = [];
    var gridExmnYrMngDtl;

    /** 운영자정보 **/
    var jsonOperPrsnInfo = [];
    var gridOperPrsnInfo;

    // 마감상태코드
    var jsonddlnSttsCd = [];

    // 완료여부
    var jsonCmptnYn = [
        {value : "Y", label :"완료"},
        {value : "N", label :"미완료"},
    ];

    // 조직유형
    var jsonOgnzType = [];

    // 유형
    var jsonType = [];

    // 주체
    var jsonMb = [];


    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_init();
        fn_search();
    });

    /**
     * @name fn_initSBSelect
     * @description
     */
    const fn_initSBSelect = async function() {
        jsonddlnSttsCd = await gfn_getComCdDtls('DDLN_STTS_CD');
        await gfn_setComCdSBSelect('dtl-slt-ognzTypeCd',jsonOgnzType,'OGNZ_TYPE_CD');
        await gfn_setComCdSBSelect('dtl-slt-typeCd',jsonType,'TYPE_CD');
        await gfn_setComCdSBSelect('dtl-slt-pyOgnzTypeCd',jsonOgnzType,'OGNZ_TYPE_CD');
        await gfn_setComCdSBSelect('dtl-slt-mb',jsonMb,'MB_CD');
    }


    /**
     * @name fn_init
     * @description fn_init
     */
    const fn_init = async function() {
        await fn_initSBSelect();
        fn_createExmnYrMng(); // 조사연도관리 그리드
        fn_createOperPrsnInfo(); // 운영자정보 그리드
    }

    /**
     * @name fn_createExmnYrMng
     * @description 조사연도관리 그리드
     */
    const fn_createExmnYrMng = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-exmnYrMng';
        SBGridProperties.id = 'gridExmnYrMng';
        SBGridProperties.jsonref = 'jsonExmnYrMng';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.rowheader = 'select';
        SBGridProperties.rowheaderwidth = {select : '5'};

        SBGridProperties.columns = [
            {caption: ['기준연도'],			ref: 'crtrYr', 	    width: '16%', type: 'output',style: 'text-align:center'},
            {caption: ['표시명'],			ref: 'indctNm', 	width: '16%', type: 'input', 	style: 'text-align:center'},
            {caption: ['완료여부'], 			ref: 'cmptnYn', 	width: '17%', type: 'combo', typeinfo:{ref:'jsonCmptnYn',value :'value', label: 'label'},  style: 'text-align:center'},
            {caption: ['마감상태'], 			ref: 'ddlnSttsCd', 	width: '17%', type: 'combo', typeinfo :{ref:'jsonddlnSttsCd',value:'cdVl',label:'cdVlNm'}, 	style: 'text-align:center'},
            {caption: ['시작일자'], 			ref: 'bgngYmd', 	width: '17%', type: 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},	style: 'text-align:center'},
            {caption: ['종료일자'], 			ref: 'endYmd', 		width: '17%', type: 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},	style: 'text-align:center'},
        ];
        gridExmnYrMng = _SBGrid.create(SBGridProperties);
        gridExmnYrMng.bind('click','fn_clickGridExmnYrMng');
    }

    /**
     * @name fn_createOperPrsnInfo
     * @description 운영자정보 그리드
     */
    const fn_createOperPrsnInfo = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-operPrsnInfo';
        SBGridProperties.id = 'gridOperPrsnInfo';
        SBGridProperties.jsonref = 'jsonOperPrsnInfo';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = 'select';
        SBGridProperties.rowheaderwidth = {select : '5'};
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting = true;

        SBGridProperties.columns = [
            {caption: ['기준연도'],		ref: 'crtrYr', 	    width: '9%', type: 'output',style: 'text-align:center'},
            {caption: ['APC코드'],		ref: 'apcCd', 	width: '9%', type: 'output', 	style: 'text-align:center'},
            {caption: ['APC명'], 		ref: 'apcNm', 	width: '18%', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['시도'], 			ref: 'ctpvNm', 	width: '9%', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['시군'], 			ref: 'sigunNm', 	width: '9%', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['소재지'], 		ref: 'loctn', 	width: '19%', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['조직유형'], 		ref: 'ognzType', 	width: '9%', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['유형'], 			ref: 'typeNm', 		width: '9%', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['주체'], 		    ref: 'mb', 	    width: '9%', type: 'output', 	style: 'text-align:center'},
            {caption: ['시도코드'], 		ref: 'ctpvCd', 	 	type: 'output', 	style: 'text-align:center', hidden :true},
            {caption: ['시군코드'], 		ref: 'sigunCd', 	type: 'output', 	style: 'text-align:center',hidden: true},
            {caption: ['유형코드'], 		ref: 'typeCd', 		type: 'output', 	style: 'text-align:center', hidden: true},
            {caption: ['조직유형코드'], 		ref: 'ognzTypeCd',  	type: 'output', 	style: 'text-align:center',hidden: true},
        ];
        gridOperPrsnInfo = _SBGrid.create(SBGridProperties);
        gridOperPrsnInfo.bind('click','fn_clickOperPrsnInfo');
    }

    /**
     * @name fn_search
     * @description 조회
     */
    const fn_search = async function () {
        const postJsonPromise = gfn_postJSON("/fm/fclt/selectApcSurveyMasterList.do", {});
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                // 초기화
                fn_clear();

                jsonExmnYrMng.length = 0;
                gridExmnYrMng.refresh();

                data.resultList.forEach(item => {
                   const vo = {
                       crtrYr : item.crtrYr,
                       indctNm : item.indctNm,
                       cmptnYn : item.cmptnYn,
                       ddlnSttsNm : item.ddlnSttsNm,
                       bgngYmd : item.bgngYmd,
                       endYmd : item.endYmd,
                       delYn : item.delYn,
                       ddlnSttsCd : item.ddlnSttsCd,
                   }
                   jsonExmnYrMng.push(vo);
                });

                // 조사연도 관리 그리드 높이 지정
                const height = 32 + jsonExmnYrMng.length * 25;
                $('#sb-area-exmnYrMng').css('height',height + 'px');
                gridExmnYrMng.resize();
                gridExmnYrMng.refresh();

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
     * @name fn_clickGridExmnYrMng
     * @description 조사연도관리 그리드 클릭 이벤트
     */
    const fn_clickGridExmnYrMng = function (){
        const nRow = gridExmnYrMng.getRow();
        const rowData = gridExmnYrMng.getRowData(nRow);
        if(gfn_isEmpty(rowData)) {
            return;
        }
        // 초기화
        fn_clear();

    }

    /**
     * @name fn_selectOperPrsnList
     * @description 운영자정보 조회
     */
    async function fn_selectOperPrsnList() {

        jsonOperPrsnInfo.length = 0;
        gridOperPrsnInfo.refresh();

        const nRow = gridExmnYrMng.getRow();
        const rowData = gridExmnYrMng.getRowData(nRow);
        if (gfn_isEmpty(rowData)) {
            return;
        }
        const crtrYr = rowData.crtrYr;

        if (gfn_isEmpty(crtrYr)) {
            gfn_comAlert("W0001","조사연도"); // W0001 {0}을/를 선택하세요.
            return;
        }
        const py = crtrYr -1 ; // 전년도

        const postJsonPromise = gfn_postJSON("/fm/fclt/selectOperPrsnInfoList.do", {
            crtrYr: crtrYr,
            py : py
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                let totalRecordCount = 0;
                jsonOperPrsnInfo.length = 0;

                data.resultList.forEach(item => {
                    const vo = {
                        crtrYr: item.crtrYr,
                        apcCd: item.apcCd,
                        apcNm: item.apcNm,
                        apcBrno: item.apcBrno,
                        operOgnzCd: item.operOgnzCd,
                        operOgnzNm: item.operOgnzNm,
                        operOgnzBrno: item.operOgnzBrno,
                        ctpvCd: item.ctpvCd,
                        ctpvNm: item.ctpvNm,
                        sigunCd: item.sigunCd,
                        sigunNm: item.sigunNm,
                        mb: item.mb,
                        ognzTypeCd: item.ognzTypeCd,
                        ognzType: item.ognzType,
                        typeCd: item.typeCd,
                        typeNm: item.typeNm,
                        ownr: item.ownr,
                        loctn: item.loctn,
                        rprsv: item.rprsv,
                        pic: item.pic,

                        apcBmno: item.apcBmno,
                        operOgnzBmno: item.operOgnzBmno,
                        operOgnzCrno: item.operOgnzCrno,
                        apcCrno: item.apcCrno,
                        operOgnzRoadNmCd: item.operOgnzRoadNmCd,
                        apcRoadNmCd: item.apcRoadNmCd,
                        operOgnzAdmCd: item.operOgnzAdmCd,
                        apcAdmCd: item.apcAdmCd,
                        operOgnzZip: item.operOgnzZip,
                        apcZip: item.apcZip,
                        operOgnzSlno: item.operOgnzSlno,
                        apcSlno: item.apcSlno,
                        apcLoctn: item.apcLoctn,
                        loctnDtl: item.loctnDtl,
                        apcLoctnDtl: item.apcLoctnDtl,

                        pyMb : item.pyMb,
                        pyOgnzTypeCd : item.pyOgnzTypeCd,
                        pyOgnzTypeNm : item.pyOgnzTypeNm,
                        pyTypeCd : item.pyTypeCd,
                        pyTypeNm : item.pyTypeNm
                    }
                    jsonOperPrsnInfo.push(vo);
                });
                gridOperPrsnInfo.refresh();

                // 조회건수
                totalRecordCount = jsonOperPrsnInfo.length;
                document.querySelector('#listCount').innerText = totalRecordCount;

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
     * @name fn_saveExmnYrMng
     * @description 조사연도 관리 저장
     */
    const fn_saveExmnYrMng = async function () {
        const allData = gridExmnYrMng.getGridDataAll();

        const saveParam = [];
        // 저장
        for (let i =0 ;i <allData.length; i++) {
            if (_.isEqual(gridExmnYrMng.getRowStatus(i+1),2)) { // 상태가 수정인 경우
                const vo = {
                    crtrYr : allData[i].crtrYr,
                    indctNm : allData[i].indctNm,
                    cmptnYn : allData[i].cmptnYn,
                    ddlnSttsCd : allData[i].ddlnSttsCd,
                    bgngYmd : allData[i].bgngYmd,
                    endYmd : allData[i].endYmd,
                    status : gridExmnYrMng.getRowStatus(i+1)
                }
                saveParam.push(vo);
            }
        }

        if (gfn_isEmpty(saveParam)) {
            gfn_comAlert("W0003", "조사연도 관리 저장"); // W0003 {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "조사연도 관리 저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/fm/fclt/updateApcCmsuMst.do", saveParam);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.

                fn_search();

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
     * @name fn_clickOperPrsnInfo
     * @description 운영자 정보 클릭 이벤트
     */
    const fn_clickOperPrsnInfo = function(rowIndex) {
        // 운영자 정보 상세 초기화
        fn_clearOperPrsnInfo();


        let row;
        if (rowIndex != null && typeof rowIndex === "number") {
            row = rowIndex;
        } else {
            row = gridOperPrsnInfo.getRow();
        }

        const rowData = gridOperPrsnInfo.getRowData(row);
        if (gfn_isEmpty(rowData)) {
            return;
        }

        SBUxMethod.set('dtl-inp-crtrYr',rowData.crtrYr); // 기준연도
        SBUxMethod.set('dtl-inp-apcCd',rowData.apcCd);  // apc코드
        SBUxMethod.set('dtl-inp-apcNm',rowData.apcNm); // apc명
        SBUxMethod.set('dtl-inp-apcBrno',rowData.apcBrno); // apc 사업자번호
        SBUxMethod.set('dtl-inp-apcLoctn',rowData.apcLoctn + " " + gfn_nvl(rowData.apcLoctnDtl)); // apc 사업자번호
        SBUxMethod.set('dtl-inp-ctpvNm',rowData.ctpvNm); // 시도
        SBUxMethod.set('dtl-inp-sigunNm',rowData.sigunNm); //시군
        SBUxMethod.set('dtl-inp-loctn',rowData.loctn + " " + gfn_nvl(rowData.loctnDtl)); // 운영조직주소
        SBUxMethod.set('dtl-inp-operOgnzCd',rowData.operOgnzCd); // 운영조직코드
        SBUxMethod.set('dtl-inp-operOgnzNm',rowData.operOgnzNm); // 운영조직명
        SBUxMethod.set('dtl-inp-operOgnzBrno',rowData.operOgnzBrno); // 운영조직사업자번호
        SBUxMethod.set('dtl-inp-ownr',rowData.ownr); // 소유자
        SBUxMethod.set('dtl-inp-rprsv',rowData.rprsv); // 대표자

        SBUxMethod.set('dtl-inp-pyOgnzTypeNm',rowData.pyOgnzTypeNm); // 전년도 조직유형코드명
        SBUxMethod.set('dtl-inp-pyTypeNm',rowData.pyTypeNm); //전년도 유형코드명
        SBUxMethod.set('dtl-inp-pyMb',rowData.pyMb); // 전년도 주체

        SBUxMethod.set('dtl-slt-ognzTypeCd',rowData.ognzTypeCd); // 조직유형코드
        SBUxMethod.set('dtl-slt-typeCd',rowData.typeCd); // 유형코드
        SBUxMethod.set('dtl-slt-mb',rowData.mb); // 주체
    }

    /**
     * @name fn_saveOperPrsnInfoDtl
     * @description 운영자정보 상세 저장
     */
    const fn_saveOperPrsnInfoDtl = async function(){
        const crtrYr = SBUxMethod.get('dtl-inp-crtrYr'); // 기준연도
        const apcCd = SBUxMethod.get('dtl-inp-apcCd'); // apc코드
        const ognzTypeCd = SBUxMethod.get('dtl-slt-ognzTypeCd'); // 조직유형
        const typeCd = SBUxMethod.get('dtl-slt-typeCd'); // 유형
        let mb = SBUxMethod.getText('dtl-slt-mb'); // 주체

        if (_.isEqual(mb,"선택")) {
            mb = null;
        }

        const saveParam = {
            crtrYr : crtrYr,
            apcCd : apcCd,
            mb : mb,
            ognzTypeCd : ognzTypeCd,
            typeCd : typeCd
        }

        if (gfn_isEmpty(crtrYr)) {
            gfn_comAlert("W0005", "기준연도"); // W0005 {0}이/가 없습니다.
            return;
        }

        if (gfn_isEmpty(apcCd)) {
            gfn_comAlert("W0005", "APC코드"); // W0005 {0}이/가 없습니다.
            return;
        }

        if (gfn_isEmpty(saveParam)) {
            gfn_comAlert("W0003", "운영자정보 저장"); // W0003 {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "운영자정보 저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/fm/fclt/updateOperPrsnInfo.do", saveParam);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.

                const rowIndex = gridOperPrsnInfo.getRow();

                // 운영자정보 조회
                await fn_selectOperPrsnList();

                fn_clickOperPrsnInfo(rowIndex);

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
     * @name fn_clear
     * @description 초기화
     */
    const fn_clear = function() {
        // 운영자 정보
        jsonOperPrsnInfo.length = 0;
        gridOperPrsnInfo.refresh();
        document.querySelector('#listCount').innerText = 0;

        // 운영자정보 상세 초기화
        fn_clearOperPrsnInfo();
    }

    /**
     * @name fn_clearOperPrsnInfo
     * @description 운영자정보 상세 초기화
     */
    const fn_clearOperPrsnInfo = function(){
        SBUxMethod.set('dtl-inp-crtrYr',""); // 기준연도
        SBUxMethod.set('dtl-inp-apcCd',"");  // apc코드
        SBUxMethod.set('dtl-inp-apcNm',""); // apc명
        SBUxMethod.set('dtl-inp-apcBrno',""); // apc 사업자번호
        SBUxMethod.set('dtl-inp-apcLoctn',""); // apc 사업자번호
        SBUxMethod.set('dtl-inp-ctpvNm',""); // 시도
        SBUxMethod.set('dtl-inp-sigunNm',""); //시군
        SBUxMethod.set('dtl-inp-loctn',""); // 운영조직주소
        SBUxMethod.set('dtl-inp-operOgnzCd',""); // 운영조직코드
        SBUxMethod.set('dtl-inp-operOgnzNm',""); // 운영조직명
        SBUxMethod.set('dtl-inp-operOgnzBrno',""); // 운영조직사업자번호
        SBUxMethod.set('dtl-inp-ownr',""); // 소유자
        SBUxMethod.set('dtl-inp-rprsv',""); // 대표자

        SBUxMethod.set('dtl-inp-pyOgnzTypeNm',""); // 전년도 조직유형코드명
        SBUxMethod.set('dtl-inp-pyTypeNm',""); //전년도 유형코드명
        SBUxMethod.set('dtl-inp-pyMb',""); // 전년도 주체

        SBUxMethod.set('dtl-slt-ognzTypeCd',""); // 조직유형코드
        SBUxMethod.set('dtl-slt-typeCd',""); // 유형코드
        SBUxMethod.set('dtl-slt-mb',""); // 주체
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>