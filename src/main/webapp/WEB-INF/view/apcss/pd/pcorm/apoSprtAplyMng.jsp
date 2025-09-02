<%
  /**
   * @Class Name : apoSprtAplyMng.jsp
   * @Description : 산지조직지원신청관리
   * @author SI개발부
   * @since 2025.6.4
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.06.04   유민지	    최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 산지조직지원신청관리</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        table.sub td {
            background-color: #f5fafe;
            color: black;
            height: 24px;
            border: 1px solid #e8f1f9;
            text-align: center;
            padding: 4px;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 산지조직지원신청관리 -->
            </div>
            <div style="margin-left: auto;">
                <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">
                <sbux-button id="btnRawData" name="btnRawData" uitype="normal" text="로우데이터다운" class="btn btn-sm btn-outline-danger" onclick="fn_rawData"></sbux-button>
                <sbux-button id="btnDownloadAll" name="btnDownloadAll" uitype="normal" text="제출서류 일괄 다운로드" class="btn btn-sm btn-outline-danger" onclick="fn_downloadAll"></sbux-button>
                <sbux-button id="btnBizAplyAllAprv" name="btnBizAplyAllAprv" uitype="normal" text="신청서 확인" class="btn btn-sm btn-outline-danger" onclick="fn_bizAplyAllAprv"></sbux-button>
                <sbux-button id="btnBizPlanAllAprv" name="btnBizPlanAllAprv" uitype="normal" text="사업계획서 확인" class="btn btn-sm btn-outline-danger" onclick="fn_bizPlanAllAprv"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
                </c:if>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <table class="table table-bordered tbl_fixed">
                <caption>신청 목록</caption>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">연도</th>
                    <td class="td_input">
                        <sbux-spinner id="dtl-spi-yr" name="dtl-spi-yr" uitype="normal" class="form-control input-sm" step-value="1" wrap-style="width:100%;"></sbux-spinner>
                    </td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-brno" name="dtl-inp-brno" uitype="text" class="form-control input-sm" ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">법인명</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-corpNm" name="dtl-inp-corpNm" uitype="text" class="form-control input-sm" ></sbux-input>
                    </td>
                </tr>
                <c:if test="${loginVO.userType eq '00' || loginVO.userType eq '01'}">
                <tr>
                    <th scope="row" class="th_bg">신청서첨부</th>
                    <td class="td_input">
                        <sbux-select id="dtl-slt-aplyDocAtch" name="dtl-slt-aplyDocAtch" class="form-control input-sm" uitype="single" unselected-text="전체" jsondata-ref="jsonSbmsnYn"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">사업계획서첨부</th>
                    <td class="td_input" style="border-right: hidden">
                        <sbux-select id="dtl-slt-bspnDocAtch" name="dtl-slt-bspnDocAtch" class="form-control input-sm" uitype="single" unselected-text="전체" jsondata-ref="jsonSbmsnYn"></sbux-select>
                    </td>
                    <td colspan="2"></td>
                </tr>
                </c:if>
                </tbody>
            </table>


            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>신청 목록</span>
                        <span style="font-size:12px">(조회건수 <span id="listCountTotal">0</span>건, 선택 목록 개수 <span id="listCountChecked">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div class="ad_tbl_toplist"></div>
            <div id="sb-area-aplyMng" style="height: 300px"></div>

            <table class="sub" style="width: 100%; table-layout: fixed; border-collapse: collapse; font-size: 13px; margin-top: 3px;">
                <colgroup>
                    <col style="width: 3%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 10.3%">
                    <col style="width: 7%">
                    <col style="width: 6.8%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                </colgroup>
                <tr>
                    <td>소계</td>
                    <td colspan="5"></td>
                    <td>제출 : <span id="subBizAplySbmsn">0</span> 개</td>
                    <td>확인 : <span id="subBizAplyAprv">0</span> 개</td>
                    <td></td>

                    <td><span id="subAplyAmtNe">0</span></td>
                    <td><span id="subAplyAmtSlf">0</span></td>
                    <td><span id="subRpnAmtNe">0</span></td>
                    <td><span id="subRpnAmtSlf">0</span></td>

                    <td>제출 : <span id="subBizPlanSbmsn">0</span> 개</td>
                    <td>확인 : <span id="subBizPlanAprv">0</span> 개</td>
                    <td></td>
                </tr>
            </table>

            <div style="height: 10px"></div>

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>제출서류 등록</span></li>
                </ul>
            </div>

            <table class="table table-bordered tbl_fixed">

                <caption>제출서류 등록</caption>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">법인명</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-regCorpNm" name="dtl-inp-regCorpNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-regBrno" name="dtl-inp-regBrno" uitype="text" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">법인등록번호</th>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-crno" name="dtl-inp-crno" uitype="text" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <sbux-input id="dtl-inp-sprtBizYr" name="dtl-inp-sprtBizYr" uitype="hidden"></sbux-input>
                    <sbux-input id="dtl-inp-sprtBizCd" name="dtl-inp-sprtBizCd" uitype="hidden"></sbux-input>
                    <sbux-input id="dtl-inp-sprtBizOgnzId" name="dtl-inp-sprtBizOgnzId" uitype="hidden"></sbux-input>
                </tr>
                </tbody>
            </table>

            <div style="height: 10px"></div>

            <table class="table table-bordered tbl_fixed">
                <caption>제출서류 등록</caption>
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 30%">
                    <col style="width: 10%">
                    <col style="width: 35%">
                    <col style="width: 5%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg text-center">제출서류</th>
                    <th scope="row" class="th_bg text-center">기제출서류</th>
                    <th scope="row" class="th_bg text-center">확인여부</th>
                    <th scope="row" class="th_bg text-center">신규(변경) 제출서류</th>
                    <th scope="row" class="th_bg text-center"></th>
                </tr>
                <tr>
                    <th scope="row" class="th_bg text-center">신청서(pdf/hwp/hwpx)</th>
                    <%--기제출서류--%>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-aplyDocExsDcmnt" name="dtl-inp-aplyDocExsDcmnt" uitype="text" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <%--확인여부--%>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-aplyDocIdntyYnNm" name="dtl-inp-aplyDocIdntyYnNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="dtl-inp-aplyDocIdntyYn" name="dtl-inp-aplyDocIdntyYn" uitype="hidden"></sbux-input>
                    </td>
                    <%--파일선택--%>
                    <td class="td_input" style="border-right: hidden">
                        <input type="file" id="aplyDocFile" accept=".pdf, .hwp, .hwpx">
                    </td>
                    <td class="td_input text-center">
                        <sbux-button id="btnSbmsnAply" name="btnSbmsnAply" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsn('aply')"></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg text-center">사업계획서(pdf/hwp/hwpx)</th>
                    <%--기제출서류--%>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-bspnDocExsDcmnt" name="dtl-inp-bspnDocExsDcmnt" uitype="text" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <%--확인여부--%>
                    <td class="td_input">
                        <sbux-input id="dtl-inp-bizPlanDocIdntyYnNm" name="dtl-inp-bizPlanDocIdntyYnNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="dtl-inp-bizPlanDocIdntyYn" name="dtl-inp-bizPlanDocIdntyYn" uitype="hidden"></sbux-input>
                    </td>
                    <%--파일선택--%>
                    <td class="td_input" style="border-right: hidden">
                        <input type="file" id="bizPlanFile" accept=".pdf, .hwp, .hwpx">
                    </td>
                    <td class="td_input text-center">
                        <sbux-button id="btnSbmsnBizPlan" name="btnSbmsnBizPlan" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsn('bizPlan')"></sbux-button>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
        <div id="sb-area-gridRawData" style="display: none"></div>
    </div>

</section>

</body>
<script type="text/javascript">

    /** 신청 목록 **/
    var gridAplyList;
    var jsonAplyList =[];

    /** 조직구분 **/
    var jsonOgnzSe = [];

    /** 제출 여부 **/
    var jsonSbmsnYn = [
        {value : "Y", text :"제출"},
        {value : "N", text :"미제출"},
        {value : "U", text :"제출(변경)"},
    ];

    /** 조직구분 **/
    var jsonOgnzSe = [
        {value : "1", text :"승인형"},
        {value : "2", text :"육성형"},
    ];

    /** 로우데이터 **/
    var gridRawData;
    var jsonRawData = [];

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_init()
    });

    /**
     * @name fn_initSBSelect
     * @description
     */
    const fn_initSBSelect = async function() {
        // await gfn_setComCdSBSelect('dtl-slt-ognzSe',jsonOgnzSe,'APRV_UPBR_SE_CD'); // 조직구분
    }

    /**
     * @name fn_init
     * @description fn_init
     */
    const fn_init = async function() {
        await fn_initSBSelect();
        fn_createAplyList(); // 신청목록 그리드
        SBUxMethod.set('dtl-spi-yr',gfn_dateToYear(new Date())); // 연도
        fn_search();
        SBUxMethod.attr('btnSbmsnAply','disabled','true');
        SBUxMethod.attr('btnSbmsnBizPlan','disabled','true');
    }

    /**
     * @name fn_createAplyList
     * @description 신청목록 그리드
     */
    const fn_createAplyList = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-aplyMng';
        SBGridProperties.id = 'gridAplyList';
        SBGridProperties.jsonref = 'jsonAplyList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';

        /*SBGridProperties.frozenbottomrows = 1;

        SBGridProperties.total={
           type 		: 'sub',
           position	: 'bottom',
           columns :{
               standard : [0],
               // sum : [9,10,11,12],
               // count : [6,7,13,14],
               custom:[6,7,9,10,11,12,13,14],
               coustomFunc: function(colId,row) {

               }
           },
           subtotalrow :{
               0 : {
                   titlecol 	: 0,
                   titlevalue	: '소계',
                   style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                   stylestartcol	: 0
               }
           },
           datasorting	: true,
           usedecimal : false,
           totalformat : {
               6 : '제출 : #,##0 개',
               7 : '확인 : #,##0 개',
               13 : '제출 : #,##0 개',
               14 : '확인 : #,##0 개'
           }
        };*/

        SBGridProperties.columns = [
            {
                caption : ["<input type='checkbox' onchange='fn_checkAll(gridAplyList, this);'>","<input type='checkbox' onchange='fn_checkAll(gridAplyList, this);'>"],
                ref: 'checkedYn', type: 'checkbox',  width:'3%',
                style: 'text-align:center',
                userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : false, rowindex : 0}}
            },
            // {caption : ['',''],	ref : 'checkedYn',	width : '3%',	style : 'text-align:center',	type : 'checkbox', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false}, ignoreupdate: true, checkedvalue : 'Y', uncheckedvalue : 'N'},userattr : {colNm :"checkedYn"}},
            {caption: ['연도','연도'],			ref: 'yr', 	    width: '5%', type: 'output',style: 'text-align:center'},
            {caption: ['조직구분','조직구분'],			ref: 'aprvNm', 	width: '5%', type: 'combo', 	style: 'text-align:center', typeinfo :{ref:'jsonOgnzSe', label:'text', value :'value'}, disabled: true},
            {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '11%', type: 'output', style: 'text-align:left'},
            {caption: ['사업자번호','사업자번호'], 			ref: 'brno', 	width: '7%', type: 'output', style: 'text-align:center'},
            {caption: ['법인번호','법인번호'], 			ref: 'crno', 	width: '7%', type: 'output',	style: 'text-align:center'},
            {caption: ['신청서','제출여부'], 			ref: 'bizAplySbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['신청서','확인여부'], 			ref: 'bizAplyAprvYnNm', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['신청서','미리보기'], 			ref: 'aplyDocPrvw', 		width: '5%', type: 'button', style: 'text-align:center',typeinfo : {buttonvalue: '팝업 열기', callback: fn_openAplyDocPrvw}},
            {caption: ['신청액 (단위 : 천원)','국비(50)'], 			ref: 'aplyAmtNe', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"aplyAmtNe"}},
            {caption: ['신청액 (단위 : 천원)','자부담(50)'], 			ref: 'aplyAmtSlf', 		width: '8%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
            {caption: ['배정액 (단위 : 천원)','국비(50)'], 			ref: 'rpnAmtNe', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"rpnAmtNe"}},
            {caption: ['배정액 (단위 : 천원)','자부담(50)'], 			ref: 'rpnAmtSlf', 		width: '8%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
            {caption: ['사업계획서','제출여부'], 			ref: 'bizPlanSbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['사업계획서','확인여부'], 			ref: 'bizPlanAprvYnNm', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['사업계획서','미리보기'], 			ref: 'bspnDocPrvw', 		width: '5%', type: 'button', style: 'text-align:center',typeinfo : {buttonvalue: '팝업 열기', callback: fn_openBspnDocPrvw}},
            {caption: ['지원사업연도','지원사업연도'], 			ref: 'sprtBizYr', 		type: 'output', hidden:true},
            {caption: ['지원사업코드','지원사업코드'], 			ref: 'sprtBizCd', 		type: 'output', hidden:true},
            {caption: ['지원조직아이디','지원조직아이디'], 	ref: 'sprtBizOgnzId', 	type: 'output', hidden:true},
        ];
        gridAplyList = _SBGrid.create(SBGridProperties);
        gridAplyList.bind('click','fn_clickAplyGrid');
        gridAplyList.bind('valuechanged','fn_girdValuechanged');
    }

    /**
     * @name fn_search
     * @description 조회
     */
    const fn_search = async function () {
        fn_clear();
        var getColRef = gridAplyList.getColRef("checkedYn");
        gridAplyList.setFixedcellcheckboxChecked(0, getColRef, false);

        const yr = SBUxMethod.get('dtl-spi-yr');
        let brno = SBUxMethod.get('dtl-inp-brno');
        const corpNm = SBUxMethod.get('dtl-inp-corpNm');
        const bizAplySbmsnYn = SBUxMethod.get('dtl-slt-aplyDocAtch');
        const bizPlanSbmsnYn = SBUxMethod.get('dtl-slt-bspnDocAtch');

        <c:if test="${loginVO.userType ne '00' and loginVO.userType ne '01'}">
            brno = "${loginVO.brno}";
        </c:if>

        const postJsonPromise = gfn_postJSON("/pd/pcorm/selectApoSprtAplyList.do", {
            yr : yr,
            brno : brno,
            corpNm : corpNm,
            bizAplySbmsnYn : bizAplySbmsnYn,
            bizPlanSbmsnYn : bizPlanSbmsnYn
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                let totalCount =0;

                jsonAplyList.length = 0;

                <c:if test="${loginVO.userType ne '00' and loginVO.userType ne '01'}">
                if (data.resultList.length == 1) {
                    SBUxMethod.set('dtl-inp-brno',data.resultList[0].brno);
                    SBUxMethod.set('dtl-inp-corpNm',data.resultList[0].corpNm);
                    SBUxMethod.attr('dtl-inp-brno', 'disabled', 'true');
                    SBUxMethod.attr('dtl-inp-corpNm', 'disabled', 'true');
                }
                </c:if>

                data.resultList.forEach(item => {
                    let bizAplySbmsnYn;
                    if (gfn_isEmpty(item.bizAplyAtchflSn) || _.isEqual(item.bizAplyAtchflSn,0)){
                        bizAplySbmsnYn = "미제출";
                    } else if (item.bizAplyAtchflSn > 0 && _.isEqual(item.bizAplyChgYn,"Y")) {
                        bizAplySbmsnYn = "제출(변경)";
                        // } else if (item.bizAplyAtchflSn > 0 || _.isEqual(item.bizAplyChgYn,"N") || gfn_isEmpty(item.bizAplyChgYn)) {
                    } else {
                        bizAplySbmsnYn = "제출";
                    }

                    let bizPlanSbmsnYn;
                    if (gfn_isEmpty(item.bizPlanAtchflSn) || _.isEqual(item.bizPlanAtchflSn,0)){
                        bizPlanSbmsnYn = "미제출";
                    } else if (item.bizPlanAtchflSn > 0 && _.isEqual(item.bizPlanChgYn,"Y")) {
                        bizPlanSbmsnYn = "제출(변경)";
                    } else {
                        bizPlanSbmsnYn = "제출";
                    }

                    // 신청서 확인 여부
                    let bizAplyAprvYnNm;
                    if (gfn_isEmpty(item.bizAplyAtchflSn) || _.isEqual(item.bizAplyAtchflSn,0)) {
                        bizAplyAprvYnNm = null;
                    } else if (item.bizAplyAtchflSn > 0 && gfn_isEmpty(item.bizAplyAprvYn)) {
                        bizAplyAprvYnNm = "미확인";
                    } else if (item.bizAplyAtchflSn > 0 &&_.isEqual(item.bizAplyAprvYn,"Y")) {
                        bizAplyAprvYnNm = "확인";
                    } else if (item.bizAplyAtchflSn > 0 && _.isEqual(item.bizAplyAprvYn,"N")) {
                        bizAplyAprvYnNm = "수정요청";
                    }
                    // 사업계획서 확인 여부
                    let bizPlanAprvYnNm;
                    if (gfn_isEmpty(item.bizPlanAtchflSn) || _.isEqual(item.bizPlanAtchflSn,0)) {
                        bizPlanAprvYnNm = null;
                    } else if (item.bizPlanAtchflSn > 0 && gfn_isEmpty(item.bizPlanAprvYn)) {
                        bizPlanAprvYnNm = "미확인";
                    } else if (item.bizPlanAtchflSn > 0 &&_.isEqual(item.bizPlanAprvYn,"Y")) {
                        bizPlanAprvYnNm = "확인";
                    } else if (item.bizPlanAtchflSn > 0 && _.isEqual(item.bizPlanAprvYn,"N")) {
                        bizPlanAprvYnNm = "수정요청";
                    }

                    const vo = {
                        yr : item.yr,
                        aprvNm : item.aprvNm,
                        aprv : item.aprv,
                        corpNm : item.corpNm,
                        brno : item.brno,
                        crno : item.crno,
                        sprtBizYr : gfn_nvl(item.sprtBizYr,item.yr),
                        sprtBizCd : item.sprtBizCd,
                        sprtBizOgnzId : item.sprtOgnzId,

                        bizAplySbmsnYn : bizAplySbmsnYn, // 신청서 제출여부
                        bizAplyAprvYn : item.bizAplyAprvYn, // 신청서 확인여부
                        bizAplyAprvYnNm : bizAplyAprvYnNm, // 신청서 확인여부명
                        aplyAmtNe : gfn_nvl(item.aplyAmtNe,null),
                        aplyAmtSlf : gfn_nvl(item.aplyAmtSlf,null),
                        rpnAmtNe : gfn_nvl(item.rpnAmtNe,null),
                        rpnAmtSlf : gfn_nvl(item.rpnAmtSlf,null),
                        bizPlanSbmsnYn : bizPlanSbmsnYn, // 사업계획서 제출여부
                        bizPlanAprvYn : item.bizPlanAprvYn, // 사업계획서 확인여부
                        bizPlanAprvYnNm : bizPlanAprvYnNm, // 사업계획서 확인여부

                        aplyRmrk : item.aplyRmrk,
                        stbltYn : item.stbltYn,
                        rsnCd : item.rsnCd,
                        rsnRmrk : item.rsnRmrk,

                        bizAplyAtchFileSn : item.bizAplyAtchflSn,
                        bizAplyFilePathNm : item.bizAplyFilePathNm,
                        bizAplyLgcFileNm : item.bizAplyLgcFileNm,
                        bizAplyPhysFileNm : item.bizAplyPhysFileNm,
                        bizAplyFileExtnNm : item.bizAplyFileExtnNm,

                        bizPlanAtchFileSn : item.bizPlanAtchflSn,
                        bizPlanFilePathNm : item.bizPlanFilePathNm,
                        bizPlanLgcFileNm : item.bizPlanLgcFileNm,
                        bizPlanPhysFileNm : item.bizPlanPhysFileNm,
                        bizPlanFileExtnNm : item.bizPlanFileExtnNm,

                    }
                    jsonAplyList.push(vo);
                });
                // gridAplyList.clearFixedCellChecked(0,0);
                totalCount = data.resultList.length;
                document.querySelector('#listCountTotal').innerText = totalCount;
                document.querySelector('#listCountChecked').innerText = 0;
                gridAplyList.refresh();
                fn_setTotal();

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
     * @name fn_save
     * @description 저장
     */
    const fn_save = async function () {
        const allData = gridAplyList.getGridDataAll();

        let saveList = [];

        for (let i = 0; i < allData.length; i++) {
            if (_.isEqual(gridAplyList.getRowStatus(i + 2), 2) && _.isEqual(allData[i].checkedYn,"Y")) { // 상태가 수정인 경우
                const vo = {
                    yr: allData[i].yr,
                    aprv: allData[i].aprv,
                    sprtBizCd: 'SRPT_001',
                    aplyAmtNe: allData[i].aplyAmtNe,
                    aplyAmtSlf: allData[i].aplyAmtSlf,
                    rpnAmtNe: allData[i].rpnAmtNe,
                    rpnAmtSlf: allData[i].rpnAmtSlf,
                    brno: allData[i].brno,
                    crno: allData[i].crno,
                    delYn : 'N'
                }
                saveList.push(vo);
            }
        }

        if (gfn_isEmpty(saveList)) {
            gfn_comAlert("W0003", "신청 목록 저장"); // W0003 {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "신청 목록 저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/pd/pcorm/updateSprtAplyList.do", saveList);
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
     * @name fn_openAplyDocPrvw
     * @description 신청서 미리보기 팝업
     */
    const fn_openAplyDocPrvw = function(){
        const nRow = gridAplyList.getRow();
        const rowData = gridAplyList.getRowData(nRow);

        if (gfn_isEmpty(rowData)) {
            return;
        }

        const brno = rowData.brno;

        if (gfn_isEmpty(brno)) {
            gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
            return;
        }

        const url = "/pd/popup/aplyDocPrvwPopup.do"
        const title = "신청서 미리보기"

        window.open(url, title, "width=1000px,height=900px");

    }

    // 팝업 fn_getRowData
    function fn_getRowData() {
        const nRow = gridAplyList.getRow();
        const rowData = gridAplyList.getRowData(nRow);

        if (gfn_isEmpty(rowData)) {
            return;
        }
        return rowData;
    }

    /**
     * @name fn_openBspnDocPrvw
     * @description 사업계획서 미리보기 팝업
     */
    const fn_openBspnDocPrvw = function(){

        const nRow = gridAplyList.getRow();
        const rowData = gridAplyList.getRowData(nRow);

        if (gfn_isEmpty(rowData)) {
            return;
        }

        const brno = rowData.brno;

        if (gfn_isEmpty(brno)) {
            gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
            return;
        }

        const url = "/pd/popup/sprtBizPlanPrvwPopup.do"
        const title = "사업계획서 미리보기"

        window.open(url, title, "width=1000px,height=900px");

    }

    /**
     * @name fn_clickAplyGrid
     * @description 그리드 클릭
     */
    const fn_clickAplyGrid = function() {
        fn_clear();

        const row = gridAplyList.getRow();

        const rowData = gridAplyList.getRowData(row);

        if (gfn_isEmpty(rowData)){
            return;
        }

        const corpNm = rowData.corpNm;
        const brno = rowData.brno;
        const crno = rowData.crno;
        const sprtBizYr = rowData.sprtBizYr;
        const sprtBizCd = rowData.sprtBizCd;
        const sprtBizOgnzId = rowData.sprtBizOgnzId;


        // 신청서
        const bizAplyAtchFileSn = rowData.bizAplyAtchFileSn;
        const bizAplyLgcFileNm = rowData.bizAplyLgcFileNm;

        const bizAplyAprvYnNm = rowData.bizAplyAprvYnNm;
        const bizAplyAprvYn = rowData.bizAplyAprvYn;

        //사업계획서
        const bizPlanAtchFileSn = rowData.bizPlanAtchFileSn;
        const bizPlanLgcFileNm = rowData.bizPlanLgcFileNm;

        const bizPlanAprvYnNm = rowData.bizPlanAprvYnNm;
        const bizPlanAprvYn = rowData.bizPlanAprvYn;

        SBUxMethod.set('dtl-inp-regCorpNm',corpNm); // 법인명
        SBUxMethod.set('dtl-inp-regBrno',brno); // 사업자번호
        SBUxMethod.set('dtl-inp-crno',crno); // 법인등록번호
        SBUxMethod.set('dtl-inp-sprtBizYr',sprtBizYr); // 지원사업연도
        SBUxMethod.set('dtl-inp-sprtBizCd',sprtBizCd); // 지원사업코드
        SBUxMethod.set('dtl-inp-sprtBizOgnzId',sprtBizOgnzId); // 지원조직아이디
        SBUxMethod.set('dtl-inp-aplyDocExsDcmnt',bizAplyLgcFileNm); // 신청서 기제출서류
        SBUxMethod.set('dtl-inp-aplyDocIdntyYnNm',bizAplyAprvYnNm); // 신청서 확인여부명
        SBUxMethod.set('dtl-inp-aplyDocIdntyYn',bizAplyAprvYn); // 신청서 확인여부
        SBUxMethod.set('dtl-inp-bspnDocExsDcmnt',bizPlanLgcFileNm); // 사업계획서 기제출서류
        SBUxMethod.set('dtl-inp-bizPlanDocIdntyYnNm',bizPlanAprvYnNm); // 사업계획서 확인여부명
        SBUxMethod.set('dtl-inp-bizPlanDocIdntyYn',bizPlanAprvYn); // 사업계획서 확인여부

        if (!_.isEqual(bizAplyAprvYn,"Y") ) {
            SBUxMethod.attr('btnSbmsnAply','disabled','false');
        } else {
            SBUxMethod.attr('btnSbmsnAply','disabled','true');
        }

        if (!_.isEqual(bizPlanAprvYn,"Y")) {
            SBUxMethod.attr('btnSbmsnBizPlan','disabled','false');
        } else {
            SBUxMethod.attr('btnSbmsnBizPlan','disabled','true');
        }

    }


    /**
     * @name fn_sbmsn
     * @description 제출
     */
    const fn_sbmsn = function(type) {

        const corpNm = SBUxMethod.get('dtl-inp-regCorpNm');
        const brno = SBUxMethod.get('dtl-inp-regBrno');
        const crno = SBUxMethod.get('dtl-inp-crno');
        let sprtBizYr = SBUxMethod.get('dtl-inp-sprtBizYr');
        let sprtBizCd = SBUxMethod.get('dtl-inp-sprtBizCd');
        const sprtBizOgnzId = SBUxMethod.get('dtl-inp-sprtBizOgnzId');

        if (gfn_isEmpty(brno)) {
            gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
            return;
        }

        if (gfn_isEmpty(crno)) {
            gfn_comAlert("W0005", "법인번호"); // W0005 {0}이/가 없습니다.
            return;
        }

        if (gfn_isEmpty(sprtBizCd)) {
            sprtBizCd = 'SRPT_001';
        }

        var formData = new FormData();

        const aplyDocIdntyYn = SBUxMethod.get('dtl-inp-aplyDocIdntyYn'); // 신청서 확인여부
        const bizPlanDocIdntyYn = SBUxMethod.get('dtl-inp-bizPlanDocIdntyYn'); // 사업계획서 확인여부

        const aplyDocFile = $('#aplyDocFile')[0].files; // 신청서
        const bizPlanFile = $('#bizPlanFile')[0].files; // 사업계획서

        // 제출서류 허용 확장자
        // 신청서
        const allowExtnAply = ['pdf', 'hwp' , 'hwpx'];
        // 사업계획서
        const allowExtnPlan = ['pdf', 'hwp' , 'hwpx'];

        switch (type) {
            case "aply":
                if (aplyDocFile.length == 0) {
                    gfn_comAlert("W0005","신청서 제출할 파일"); // W0005  {0}이/가 없습니다.
                    return;
                }
                // 신청서
                if (aplyDocFile.length > 0){
                    for (var i = 0; i < aplyDocFile.length; i++) {
                        const extension = aplyDocFile[i].name.split('.').pop().toLowerCase();
                        if (allowExtnAply.includes(extension)) {
                            formData.append('sprtAplyFiles', aplyDocFile[i]);
                        } else {
                            gfn_comAlert("W0021","신청서 확장자","hwp/hwpx/pdf"); // W0021 {0}은/는 {1}만 가능합니다.
                            return;
                        }
                    }
                }
                break;

            case "bizPlan":
                if (bizPlanFile.length == 0) {
                    gfn_comAlert("W0005","사업계획서 제출할 파일"); // W0005  {0}이/가 없습니다.
                    return;
                }
                // 사업계획서
                if (bizPlanFile.length > 0){
                    for (var i = 0; i < bizPlanFile.length; i++) {
                        const extension = bizPlanFile[i].name.split('.').pop().toLowerCase();
                        if (allowExtnPlan.includes(extension)) {
                            formData.append('sprtBizPlanFiles', bizPlanFile[i]);
                        } else {
                            gfn_comAlert("W0021","사업계획서 확장자","hwp/hwpx/pdf"); // W0021 {0}은/는 {1}만 가능합니다.
                            return;
                        }
                    }
                }
                break;
        }

        formData.append('sprtBizYr',gfn_nvl(sprtBizYr));
        formData.append('sprtBizCd',gfn_nvl(sprtBizCd));
        formData.append('sprtOgnzId',gfn_nvl(sprtBizOgnzId));
        formData.append('brno',gfn_nvl(brno));
        formData.append('crno',gfn_nvl(crno));

       /* const obj = {};
        formData.forEach((value,key) => {
            obj[key] = value;
        });*/

        if (!gfn_comConfirm("Q0001", "제출서류 등록")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        $.ajax({
            type: 'POST',
            url: '/pd/pcorm/sprtBizAplyDocReg.do',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                fn_search();
            },
            error: function (error) {
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        });
    }

    /**
     * @name fn_clear
     * @description 초기화
     */
    const fn_clear = function (){
        SBUxMethod.attr('btnSbmsnAply','disabled','true');
        SBUxMethod.attr('btnSbmsnBizPlan','disabled','true');

        SBUxMethod.set('dtl-inp-regCorpNm',null); // 법인명
        SBUxMethod.set('dtl-inp-regBrno',null); // 사업자번호
        SBUxMethod.set('dtl-inp-crno',null); // 법인등록번호
        SBUxMethod.set('dtl-inp-sprtBizYr',null); // 지원사업연도
        SBUxMethod.set('dtl-inp-sprtBizCd',null); // 지원사업코드
        SBUxMethod.set('dtl-inp-sprtBizOgnzId',null); // 지원조직아이디
        SBUxMethod.set('dtl-inp-aplyDocExsDcmnt',null); // 신청서 기제출서류
        SBUxMethod.set('dtl-inp-aplyDocIdntyYnNm',null); // 신청서 확인여부명
        SBUxMethod.set('dtl-inp-aplyDocIdntyYn',null); // 신청서 확인여부
        SBUxMethod.set('dtl-inp-bspnDocExsDcmnt',null); // 사업계획서 기제출서류
        SBUxMethod.set('dtl-inp-bizPlanDocIdntyYn',null); // 사업계획서 확인여부
        SBUxMethod.set('dtl-inp-bizPlanDocIdntyYnNm',null); // 사업계획서 확인여부명

        document.querySelector('#aplyDocFile').value = null;
        document.querySelector('#bizPlanFile').value = null;
    }

    /**
     * @name fn_girdValuechanged
     * @description 그리드 값 변경
     */
    const fn_girdValuechanged = function(){
        const nRow = gridAplyList.getRow();
        const nCol = gridAplyList.getCol();
        const colNm = gridAplyList.getColUserAttr(nCol).colNm;
        const rowData = gridAplyList.getRowData(nRow, false); // call by refrence

        if (gfn_isEmpty(rowData)) {
            return;
        }
        if (gfn_isEmpty(colNm)) {
            return;
        }

        switch (colNm) {
            case "aplyAmtNe":
                const aplyAmtNe = rowData.aplyAmtNe;
                rowData.aplyAmtSlf = aplyAmtNe;
                rowData.checkedYn = "Y";
                break;
            case "rpnAmtNe" :
                const rpnAmtNe = rowData.rpnAmtNe;
                rowData.rpnAmtSlf = rpnAmtNe;
                rowData.checkedYn = "Y";
                break;
        }
        const allData = gridAplyList.getGridDataAll();
        let checkedCount = 0;

        let subBizAplySbmsn =0; // 신청서 제출
        let subBizAplyAprv = 0; // 신청서 확인
        let subAplyAmtNe = 0; // 신청액 국비
        let subAplyAmtSlf = 0; // 신청액 자부담
        let subRpnAmtNe = 0; // 배정액 국비
        let subRpnAmtSlf = 0; // 배정액 자부담
        let subBizPlanSbmsn = 0; // 사업계획서 제출
        let subBizPlanAprv = 0; // 사업계획서 확인
        for (let i = 0; i <allData.length; i++) {
            if(_.isEqual(allData[i].checkedYn,"Y")) {
                checkedCount++;

                subAplyAmtNe += parseInt(allData[i].aplyAmtNe || 0);
                subAplyAmtSlf += parseInt(allData[i].aplyAmtSlf || 0);
                subRpnAmtNe += parseInt(allData[i].rpnAmtNe || 0);
                subRpnAmtSlf += parseInt(allData[i].rpnAmtSlf || 0);

                if (parseInt(allData[i].bizAplyAtchFileSn) > 0) {
                    subBizAplySbmsn++
                }
                if (_.isEqual(allData[i].bizAplyAprvYn,"Y")) {
                    subBizAplyAprv++
                }
                if (parseInt(allData[i].bizPlanAtchFileSn) > 0) {
                    subBizPlanSbmsn++
                }
                if (_.isEqual(allData[i].bizPlanAprvYn,"Y")) {
                    subBizPlanAprv++
                }

            }
        }

        // 선택 목록 개수
        document.querySelector('#listCountChecked').innerText = checkedCount;

        document.querySelector('#subBizAplySbmsn').innerText = subBizAplySbmsn;
        document.querySelector('#subBizAplyAprv').innerText = subBizAplyAprv;

        document.querySelector('#subAplyAmtNe').innerText = subAplyAmtNe.toLocaleString();
        document.querySelector('#subAplyAmtSlf').innerText = subAplyAmtSlf.toLocaleString();
        document.querySelector('#subRpnAmtNe').innerText = subRpnAmtNe.toLocaleString();
        document.querySelector('#subRpnAmtSlf').innerText = subRpnAmtSlf.toLocaleString();

        document.querySelector('#subBizPlanSbmsn').innerText = subBizPlanSbmsn;
        document.querySelector('#subBizPlanAprv').innerText = subBizPlanAprv;

        gridAplyList.refresh();

        if (checkedCount === 0 ) {
            fn_setTotal();
        }
    }


    /**
     * @name fn_bizAplyAllAprv
     * @description 신청서 일괄확인
     */
    async function fn_bizAplyAllAprv() {

        let checkList =[];
        const gridDataAll = gridAplyList.getGridDataAll();
        for (let i =0; i <gridDataAll.length; i++) {
            if (_.isEqual(gridDataAll[i].checkedYn,"Y") && gridDataAll[i].bizAplyAtchFileSn > 0 && !_.isEqual(gridDataAll[i].bizAplyAprvYn,"Y")){
                const save = {
                    sprtBizYr : gridDataAll[i].sprtBizYr,
                    sprtBizCd : gridDataAll[i].sprtBizCd,
                    sprtOgnzId : gridDataAll[i].sprtBizOgnzId,
                    aplyDocCd : "BIZ_APLY",
                    atchFileSn : gridDataAll[i].bizAplyAtchFileSn,
                }
                checkList.push(save);
            }
        }

        if (gfn_isEmpty(checkList)) {
            gfn_comAlert("W0003", "신청서 확인"); // {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "신청서 확인")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/pd/pcorm/updateSprtBizAplyDocAllAprv.do", checkList);

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
     * @name fn_bizPlanAllAprv
     * @description 사업계획서 일괄확인
     */
    async function fn_bizPlanAllAprv() {

        let checkList =[];
        const gridDataAll = gridAplyList.getGridDataAll();
        for (let i =0; i <gridDataAll.length; i++) {
            if (_.isEqual(gridDataAll[i].checkedYn,"Y") && gridDataAll[i].bizPlanAtchFileSn > 0 && !_.isEqual(gridDataAll[i].bizPlanAprvYn,"Y")){
                const save = {
                    sprtBizYr : gridDataAll[i].sprtBizYr,
                    sprtBizCd : gridDataAll[i].sprtBizCd,
                    sprtOgnzId : gridDataAll[i].sprtBizOgnzId,
                    aplyDocCd : "BIZ_PLAN",
                    atchFileSn : gridDataAll[i].bizPlanAtchFileSn,
                }
                checkList.push(save);
            }
        }

        if (gfn_isEmpty(checkList)) {
            gfn_comAlert("W0003", "사업계획서 확인"); // {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "사업계획서 확인")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/pd/pcorm/updateSprtBizAplyDocAllAprv.do", checkList);

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
     * @name fn_downloadAll
     * @description 제출서류 일괄 다운로드
     */
    function fn_downloadAll() {
        const sprtBizYr = SBUxMethod.get('dtl-spi-yr');
        const sprtBizCd = "SRPT_001";

        var url ="/pd/pcorm/sprtDownloadAll/"+sprtBizYr + "/" + sprtBizCd;
        window.open(url);
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

        const allData = grid.getGridDataAll();
        let checkedCount = 0;
        for (let i = 0; i <allData.length; i++) {
            if(_.isEqual(allData[i].checkedYn,"Y")) {
                checkedCount++;
            }
        }
        document.querySelector('#listCountChecked').innerText = checkedCount;
        grid.refresh();
    }

    const fn_createRawDataGrid = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gridRawData';
        SBGridProperties.id = 'gridRawData';
        SBGridProperties.jsonref = 'jsonRawData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader="seq";

        SBGridProperties.columns = [
            {caption: ['연도'],			ref: 'yr', 	    width: '5%', type: 'output',style: 'text-align:center'},
            {caption: ['조직구분'],			ref: 'aprvNm', 	width: '5%', type: 'combo', 	style: 'text-align:center', typeinfo :{ref:'jsonOgnzSe', label:'text', value :'value'}, disabled: true},
            {caption: ['법인명'], 			ref: 'corpNm', 	width: '11%', type: 'output', style: 'text-align:left'},
            {caption: ['사업자번호'], 			ref: 'brno', 	width: '7%', type: 'output', style: 'text-align:center'},
            {caption: ['법인번호'], 			ref: 'crno', 	width: '7%', type: 'output',	style: 'text-align:center'},
            {caption: ['신청서 제출여부'], 			ref: 'bizAplySbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['신청서 확인여부'], 			ref: 'bizAplyAprvYnNm', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['신청액 국비 (단위 : 천원)'], 			ref: 'aplyAmtNe', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"aplyAmtNe"}},
            {caption: ['신청액 자부담 (단위 : 천원)'], 			ref: 'aplyAmtSlf', 		width: '8%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
            {caption: ['배정액 국비 (단위 : 천원)'], 			ref: 'rpnAmtNe', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"rpnAmtNe"}},
            {caption: ['배정액 자부담 (단위 : 천원)'], 			ref: 'rpnAmtSlf', 		width: '8%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
            {caption: ['사업계획서 제출여부'], 			ref: 'bizPlanSbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['사업계획서 확인여부'], 			ref: 'bizPlanAprvYnNm', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['신청서 제출파일명'], 			ref: 'bizAplyLgcFileNm', 		width: '5%', type: 'output', style: 'text-align:center'},
            {caption: ['사업계획서 제출파일명'], 			ref: 'bizPlanLgcFileNm', 		width: '5%', type: 'output', style: 'text-align:center'},
        ];
        gridRawData = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_rawData
     * @description 로우데이터 다운
     */
    const fn_rawData = async function () {

        if (!gfn_comConfirm("Q0001", "로우데이터 다운")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        // 그리드 그리기 호출
        await fn_createRawDataGrid();
        const yr = SBUxMethod.get('dtl-spi-yr');
        if (gfn_isEmpty(yr)) {
            gfn_comAlert("W0002", "신청년도"); // W0002 {0}을/를 입력하세요.
            return;
        }

        const postJsonPromise = gfn_postJSON("/pd/pcorm/selectSprtBizRawData.do", {
            yr : yr
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonRawData.length = 0;
                data.resultList.forEach(item => {
                    // 조직구분
                    let aprvNm;
                    if (_.isEqual(item.aprv,'1')) {
                        aprvNm = '승인형'
                    } else if(_.isEqual(item.aprv,'2')){
                        aprvNm = '육성형'
                    }

                    let bizAplySbmsnYn;
                    if (gfn_isEmpty(item.bizAplyAtchflSn) || _.isEqual(item.bizAplyAtchflSn,0)){
                        bizAplySbmsnYn = "미제출";
                    } else if (item.bizAplyAtchflSn > 0 && _.isEqual(item.bizAplyChgYn,"Y")) {
                        bizAplySbmsnYn = "제출(변경)";
                        // } else if (item.bizAplyAtchflSn > 0 || _.isEqual(item.bizAplyChgYn,"N") || gfn_isEmpty(item.bizAplyChgYn)) {
                    } else {
                        bizAplySbmsnYn = "제출";
                    }

                    let bizPlanSbmsnYn;
                    if (gfn_isEmpty(item.bizPlanAtchflSn) || _.isEqual(item.bizPlanAtchflSn,0)){
                        bizPlanSbmsnYn = "미제출";
                    } else if (item.bizPlanAtchflSn > 0 && _.isEqual(item.bizPlanChgYn,"Y")) {
                        bizPlanSbmsnYn = "제출(변경)";
                    } else {
                        bizPlanSbmsnYn = "제출";
                    }

                    // 신청서 확인 여부
                    let bizAplyAprvYnNm;
                    if (gfn_isEmpty(item.bizAplyAtchflSn) || _.isEqual(item.bizAplyAtchflSn,0)) {
                        bizAplyAprvYnNm = null;
                    } else if (item.bizAplyAtchflSn > 0 && gfn_isEmpty(item.bizAplyAprvYn)) {
                        bizAplyAprvYnNm = "미확인";
                    } else if (item.bizAplyAtchflSn > 0 &&_.isEqual(item.bizAplyAprvYn,"Y")) {
                        bizAplyAprvYnNm = "확인";
                    } else if (item.bizAplyAtchflSn > 0 && _.isEqual(item.bizAplyAprvYn,"N")) {
                        bizAplyAprvYnNm = "수정요청";
                    }
                    // 사업계획서 확인 여부
                    let bizPlanAprvYnNm;
                    if (gfn_isEmpty(item.bizPlanAtchflSn) || _.isEqual(item.bizPlanAtchflSn,0)) {
                        bizPlanAprvYnNm = null;
                    } else if (item.bizPlanAtchflSn > 0 && gfn_isEmpty(item.bizPlanAprvYn)) {
                        bizPlanAprvYnNm = "미확인";
                    } else if (item.bizPlanAtchflSn > 0 &&_.isEqual(item.bizPlanAprvYn,"Y")) {
                        bizPlanAprvYnNm = "확인";
                    } else if (item.bizPlanAtchflSn > 0 && _.isEqual(item.bizPlanAprvYn,"N")) {
                        bizPlanAprvYnNm = "수정요청";
                    }
                    const rawDataVO = {
                        yr : item.yr,
                        aprvNm : aprvNm,
                        brno : item.brno,
                        crno : item.crno,
                        corpNm : item.corpNm,
                        sprtBizYr : item.sprtBizYr,
                        sprtBizCd : item.sprtBizCd,
                        sprtBizOgnzId : item.sprtOgnzId,

                        bizAplySbmsnYn : bizAplySbmsnYn, // 신청서 제출여부
                        bizAplyAprvYn : item.bizAplyAprvYn, // 신청서 확인여부
                        bizAplyAprvYnNm : bizAplyAprvYnNm, // 신청서 확인여부명
                        aplyAmtNe : gfn_nvl(item.aplyAmtNe,null),
                        aplyAmtSlf : gfn_nvl(item.aplyAmtSlf,null),
                        rpnAmtNe : gfn_nvl(item.rpnAmtNe,null),
                        rpnAmtSlf : gfn_nvl(item.rpnAmtSlf,null),
                        bizPlanSbmsnYn : bizPlanSbmsnYn, // 사업계획서 제출여부
                        bizPlanAprvYn : item.bizPlanAprvYn, // 사업계획서 확인여부
                        bizPlanAprvYnNm : bizPlanAprvYnNm, // 사업계획서 확인여부

                        bizAplyLgcFileNm : item.bizAplyLgcFileNm,
                        bizPlanLgcFileNm : item.bizPlanLgcFileNm,

                    }
                    jsonRawData.push(rawDataVO);
                });

                gridRawData.rebuild();

                await fn_excelDown();

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

    //로우 데이터 엑셀 다운로드
    function fn_excelDown(){
        const currentDate = new Date();

        const year = currentDate.getFullYear().toString().padStart(4, '0');
        const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
        const day = currentDate.getDate().toString().padStart(2, '0');
        let formattedDate = year + month + day;

        let fileName = formattedDate + "_산지조직지원신청관리_로우데이터";

        /*
        datagrid.exportData(param1, param2, param3, param4);
        param1(필수)[string]: 다운 받을 파일 형식
        param2(필수)[string]: 다운 받을 파일 제목
        param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
        → true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
        → false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
        param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
        → arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
        → combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
        → true : label 값으로 저장
        → false : value 값으로 저장
        → sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
         */
        //console.log(hiddenGrd.exportData);
        gridRawData.exportData("xlsx" , fileName , true , true);
    }

    function fn_setTotal() {
        const gridDataAll = gridAplyList.getGridDataAll();
        if (gfn_isEmpty(gridDataAll)) {
            return;
        }

        let subBizAplySbmsn =0; // 신청서 제출
        let subBizAplyAprv = 0; // 신청서 확인
        let subAplyAmtNe = 0; // 신청액 국비
        let subAplyAmtSlf = 0; // 신청액 자부담
        let subRpnAmtNe = 0; // 배정액 국비
        let subRpnAmtSlf = 0; // 배정액 자부담
        let subBizPlanSbmsn = 0; // 사업계획서 제출
        let subBizPlanAprv = 0; // 사업계획서 확인

        for (let i =0 ; i <gridDataAll.length; i++) {
            subAplyAmtNe += parseInt(gridDataAll[i].aplyAmtNe || 0);
            subAplyAmtSlf += parseInt(gridDataAll[i].aplyAmtSlf || 0);
            subRpnAmtNe += parseInt(gridDataAll[i].rpnAmtNe || 0);
            subRpnAmtSlf += parseInt(gridDataAll[i].rpnAmtSlf || 0);

            if (parseInt(gridDataAll[i].bizAplyAtchFileSn) > 0) {
                subBizAplySbmsn++
            }
            if (_.isEqual(gridDataAll[i].bizAplyAprvYn,"Y")) {
                subBizAplyAprv++
            }
            if (parseInt(gridDataAll[i].bizPlanAtchFileSn) > 0) {
                subBizPlanSbmsn++
            }
            if (_.isEqual(gridDataAll[i].bizPlanAprvYn,"Y")) {
                subBizPlanAprv++
            }
        }

        document.querySelector('#subBizAplySbmsn').innerText = subBizAplySbmsn;
        document.querySelector('#subBizAplyAprv').innerText = subBizAplyAprv;

        document.querySelector('#subAplyAmtNe').innerText = subAplyAmtNe.toLocaleString();
        document.querySelector('#subAplyAmtSlf').innerText = subAplyAmtSlf.toLocaleString();
        document.querySelector('#subRpnAmtNe').innerText = subRpnAmtNe.toLocaleString();
        document.querySelector('#subRpnAmtSlf').innerText = subRpnAmtSlf.toLocaleString();

        document.querySelector('#subBizPlanSbmsn').innerText = subBizPlanSbmsn;
        document.querySelector('#subBizPlanAprv').innerText = subBizPlanAprv;
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
