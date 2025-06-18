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

            <div style="height: 10px"></div>

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>제출서류 등록</span></li>
                </ul>
                <div style="margin-left: auto;">
                    <sbux-button id="btnSbmsn" name="btnSbmsn" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsn"></sbux-button>
                </div>
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
                    <col style="width: 40%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg text-center">제출서류</th>
                    <th scope="row" class="th_bg text-center">기제출서류</th>
                    <th scope="row" class="th_bg text-center">확인여부</th>
                    <th scope="row" class="th_bg text-center">신규(변경) 제출서류</th>
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
                    <td class="td_input">
                        <input type="file" id="aplyDocFile" accept=".pdf, .hwp, .hwpx">
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
                    <td class="td_input">
                        <input type="file" id="bizPlanFile" accept=".pdf, .hwp, .hwpx">
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>

</section>
<%-- 신청서 미리보기 Modal--%>
<div>
    <sbux-modal id="modal-aplyDocPrvw" name="modal-aplyDocPrvw" uitype="middle" header-title="신청서 미리보기" body-html-id="body-modal-aplyDocPrvw" footer-is-close-button="false" style="width:1000px; z-index: 10000;"></sbux-modal>
</div>
<div id="body-modal-aplyDocPrvw">
<%--    <jsp:include page="/WEB-INF/view/apcss/pd/popup/aplyDocPrvwPopup.jsp"></jsp:include>--%>
</div>

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
        SBUxMethod.attr('btnSbmsn','disabled','true');
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
        gridAplyList.bind('valuechanged','fn_girdValuechanged')
    }

    /**
     * @name fn_search
     * @description 조회
     */
    const fn_search = async function () {
        fn_clear();

        const yr = SBUxMethod.get('dtl-spi-yr');
        const brno = SBUxMethod.get('dtl-inp-brno');
        const corpNm = SBUxMethod.get('dtl-inp-corpNm');
        const bizAplySbmsnYn = SBUxMethod.get('dtl-slt-aplyDocAtch');
        const bizPlanSbmsnYn = SBUxMethod.get('dtl-slt-bspnDocAtch');

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
                gridAplyList.clearFixedCellChecked(0,0);
                totalCount = data.resultList.length;
                document.querySelector('#listCountTotal').innerText = totalCount;
                gridAplyList.refresh();

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
        SBUxMethod.attr('btnSbmsn','disabled','false');

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

    }


    /**
     * @name fn_sbmsn
     * @description 제출
     */
    const fn_sbmsn = function() {
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

        //새로운 파일이 둘다 없으면
        if(bizPlanFile.length == 0 && aplyDocFile.length == 0){
            gfn_comAlert("W0005","제출할 파일"); // W0005  {0}이/가 없습니다.
            return;
        }

        // 제출서류 허용 확장자
        // 신청서
        const allowExtnAply = ['pdf', 'hwp' , 'hwpx'];
        // 사업계획서
        const allowExtnPlan = ['pdf', 'hwp' , 'hwpx'];

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

        formData.append('sprtBizYr',gfn_nvl(sprtBizYr));
        formData.append('sprtBizCd',gfn_nvl(sprtBizCd));
        formData.append('sprtOgnzId',gfn_nvl(sprtBizOgnzId));
        formData.append('brno',gfn_nvl(brno));
        formData.append('crno',gfn_nvl(crno));

        /*const obj = {};
        formData.forEach((value,key) => {
            obj[key] = value;
        });
        console.log(obj);*/

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
        SBUxMethod.attr('btnSbmsn','disabled','true');

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
        for (let i = 0; i <allData.length; i++) {
            if(_.isEqual(allData[i].checkedYn,"Y")) {
                checkedCount++;
            }
        }
        document.querySelector('#listCountChecked').innerText = checkedCount;
        gridAplyList.refresh();
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

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
