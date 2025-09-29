<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정산요청서 미리보기</title>
    <%@ include file="../../../frame/inc/headerScriptPopup.jsp" %>

</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">

        <div class="box-body">
            <div id = "clclnAplyDocArea">

                <table class="table table-bordered tbl_fixed">
                    <caption>법인 정보</caption>
                    <tbody>
                    <tr>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-aplyAtchFileSn" name="clclnDocPop-inp-aplyAtchFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-chkAtchFileSn" name="clclnDocPop-inp-chkAtchFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-excelAtchFileSn" name="clclnDocPop-inp-excelAtchFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-sprtBizYr" name="clclnDocPop-inp-sprtBizYr" class="form-control input-sm" autocomplete="off"></sbux-input>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-sprtBizCd" name="clclnDocPop-inp-sprtBizCd" class="form-control input-sm" autocomplete="off"></sbux-input>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-sprtBizOgnzId" name="clclnDocPop-inp-sprtBizOgnzId" class="form-control input-sm" autocomplete="off"></sbux-input>
                        <th scope="row" class="th_bg">법인명</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-corpNm"
                                    name="clclnDocPop-inp-corpNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">사업자등록번호</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-brno"
                                    name="clclnDocPop-inp-brno"
                                    class="form-control input-sm"
                                    mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">법인등록번호</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-crno"
                                    name="clclnDocPop-inp-crno"
                                    class="form-control input-sm"
                                    mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">회차</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-seq"
                                    name="clclnDocPop-inp-seq"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <br>
                <br>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span style="font-size:14px">▶정산요청서</span>
                        </li>
                    </ul>
                    <div style="margin-left: auto;">
                        <sbux-button
                                id="btnAplyDownloadPop"
                                name="btnAplyDownloadPop"
                                uitype="normal"
                                class="btn btn-sm btn-outline-danger"
                                text="다운로드"
                                onclick="popClclnAplyDocPdfViewer.fn_download(2)"
                        ></sbux-button>

                        <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">

                            <sbux-button
                                    id="btnAplyIdntyPop"
                                    name="btnAplyIdntyPop"
                                    uitype="normal"
                                    text="확인"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="popClclnAplyDocPdfViewer.fn_aprv(2)"
                            ></sbux-button>

                            <sbux-button
                                    id="btnAplyCancelPop"
                                    name="btnAplyCancelPop"
                                    uitype="normal"
                                    text="확인취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="popClclnAplyDocPdfViewer.fn_cancel(2)"
                            ></sbux-button>

                            <sbux-button
                                    id="btnAplyMdfcnDmnd"
                                    name="btnAplyMdfcnDmnd"
                                    uitype="normal"
                                    text="수정요청"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="popClclnAplyDocPdfViewer.fn_mdfcnDmnd(2)"
                            ></sbux-button>
                        </c:if>
                    </div>
                </div>
                <table class="table table-bordered tbl_fixed">
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">파일명</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-aplyFileNm"
                                    name="clclnDocPop-inp-aplyFileNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">등록일</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-aplyRegDay"
                                    name="clclnDocPop-inp-aplyRegDay"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <sbux-input uitype="hidden" id="clclnDocPop-inp-idfr" name="clclnDocPop-inp-idfr" class="form-control input-sm" autocomplete="off" readonly></sbux-input>
                        <th scope="row" class="th_bg">확인여부</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-aplyAprvYn"
                                    name="clclnDocPop-inp-aplyAprvYn"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">확인시간</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnDocPop-inp-aplyIdfrDt"
                                    name="clclnDocPop-inp-aplyIdfrDt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <br>
            <br>

            <%--정산 신청서 미리보기--%>
            <div id = "iframeclclnAplyDocArea"></div>

            <br>
            <br>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span style="font-size:14px">▶체크리스트</span>
                    </li>
                </ul>
                <div style="margin-left: auto;">
                    <sbux-button
                            id="btnChkDownloadPop"
                            name="btnChkDownloadPop"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            text="다운로드"
                            onclick="popClclnAplyDocPdfViewer.fn_download(4)"
                    ></sbux-button>

                    <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">

                        <sbux-button
                                id="btnChkIdntyPop"
                                name="btnChkIdntyPop"
                                uitype="normal"
                                text="확인"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popClclnAplyDocPdfViewer.fn_aprv(4)"
                        ></sbux-button>

                        <sbux-button
                                id="btnChkCancelPop"
                                name="btnChkCancelPop"
                                uitype="normal"
                                text="확인취소"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popClclnAplyDocPdfViewer.fn_cancel(4)"
                        ></sbux-button>

                        <sbux-button
                                id="btnChkMdfcnDmnd"
                                name="btnChkMdfcnDmnd"
                                uitype="normal"
                                text="수정요청"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popClclnAplyDocPdfViewer.fn_mdfcnDmnd(4)"
                        ></sbux-button>
                    </c:if>
                </div>
            </div>

            <table class="table table-bordered tbl_fixed">
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">파일명</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-chkFileNm"
                                name="clclnDocPop-inp-chkFileNm"
                                class="form-control input-sm"
                                readonly
                        ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">등록일</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-chkRegDay"
                                name="clclnDocPop-inp-chkRegDay"
                                class="form-control input-sm"
                                readonly
                        ></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">확인여부</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-chkAprvYn"
                                name="clclnDocPop-inp-chkAprvYn"
                                class="form-control input-sm"
                                readonly
                        ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">확인시간</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-chkIdfrDt"
                                name="clclnDocPop-inp-chkIdfrDt"
                                class="form-control input-sm"
                                autocomplete="off"
                                readonly
                        ></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <%--체크리스트 미리보기--%>
            <div id = "iframeclclnChkListDocArea"></div>

            <br>
            <br>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span style="font-size:14px">▶엑셀 세부내역서</span>
                    </li>
                </ul>
                <div style="margin-left: auto;">
                    <sbux-button
                            id="btnExcelDownloadPop"
                            name="btnExcelDownloadPop"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            text="다운로드"
                            onclick="popClclnAplyDocPdfViewer.fn_download(3)"
                    ></sbux-button>

                    <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">

                        <sbux-button
                                id="btnExcelIdntyPop"
                                name="btnExcelIdntyPop"
                                uitype="normal"
                                text="확인"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popClclnAplyDocPdfViewer.fn_aprv(3)"
                        ></sbux-button>

                        <sbux-button
                                id="btnExcelCancelPop"
                                name="btnExcelCancelPop"
                                uitype="normal"
                                text="확인취소"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popClclnAplyDocPdfViewer.fn_cancel(3)"
                        ></sbux-button>

                        <sbux-button
                                id="btnExcelMdfcnDmnd"
                                name="btnExcelMdfcnDmnd"
                                uitype="normal"
                                text="수정요청"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popClclnAplyDocPdfViewer.fn_mdfcnDmnd(3)"
                        ></sbux-button>
                    </c:if>
                </div>
            </div>
            <table class="table table-bordered tbl_fixed">
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">파일명</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-excelFileNm"
                                name="clclnDocPop-inp-excelFileNm"
                                class="form-control input-sm"
                                readonly
                        ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">등록일</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-excelRegDay"
                                name="clclnDocPop-inp-excelRegDay"
                                class="form-control input-sm"
                                readonly
                        ></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">확인여부</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-excelAprvYn"
                                name="clclnDocPop-inp-excelAprvYn"
                                class="form-control input-sm"
                                readonly
                        ></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">확인시간</th>
                    <td class="td_input">
                        <sbux-input
                                uitype="text"
                                id="clclnDocPop-inp-excelIdfrDt"
                                name="clclnDocPop-inp-excelIdfrDt"
                                class="form-control input-sm"
                                autocomplete="off"
                                readonly
                        ></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    var gridClclnAplyDocPrvw = null;
    var jsonClclnAplyDocPrvw = [];

    const popClclnAplyDocPdfViewer = {
        prgrmId: 'ClclnAplyDocPrvwPopup',
        modalId: 'modal-clclnAplyDocPrvw',
        gridId: 'gridClclnAplyDocPrvw',
        jsonId: 'jsonClclnAplyDocPrvw',
        // areaId: "sb-area-grdBizPlanPdfViewerPop",
        prvApcCd: "",
        objGrid: null,
        gridJson: [],
        clclnAplyDocUserData: null,
        callbackFnc: function() {},
        init: async function(_callbackFnc) {
            let rowData = opener.fn_getClclnAplyRowData();

            this.clclnAplyDocUserData = rowData;

            if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
                this.callbackFnc = _callbackFnc;
            }

            //초기화
            SBUxMethod.set('clclnDocPop-inp-corpNm',null); // 법인명
            SBUxMethod.set('clclnDocPop-inp-brno',null); // 사업자번호
            SBUxMethod.set('clclnDocPop-inp-crno',null); // 법인번호
            SBUxMethod.set('clclnDocPop-inp-seq',null); // 회차

            SBUxMethod.set('clclnDocPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('clclnDocPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('clclnDocPop-inp-sprtBizOgnzId',null); // 지원조직아이디
            SBUxMethod.set('clclnDocPop-inp-aplyDocCd',null); // 지원조직아이디

            if(!gfn_isEmpty(rowData)){
                SBUxMethod.set('clclnDocPop-inp-corpNm',rowData.corpNm); // 법인명
                SBUxMethod.set('clclnDocPop-inp-brno',rowData.brno); // 사업자번호
                SBUxMethod.set('clclnDocPop-inp-crno',rowData.crno); // 법인번호
                SBUxMethod.set('clclnDocPop-inp-seq',rowData.clclnSeq); // 회차
            }
            this.fn_search();
        },
        fn_close: function() {
            gfn_closeModal(this.modalId, this.callbackFnc);
        },
        fn_clearForm: function() {
            $('#iframeclclnAplyDocArea').empty();
            $('#iframeclclnChkListDocArea').empty();

            SBUxMethod.set('clclnDocPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('clclnDocPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('clclnDocPop-inp-sprtBizOgnzId',null); // 지원조직아이디
            SBUxMethod.set('clclnDocPop-inp-seq',null); // 회차

            // 정산요청서
            SBUxMethod.set('clclnDocPop-inp-aplyAtchFileSn',null); // 파일순번
            SBUxMethod.set('clclnDocPop-inp-aplyFileNm',null); // 파일명
            SBUxMethod.set('clclnDocPop-inp-aplyRegDay',null); // 등록일
            SBUxMethod.set('clclnDocPop-inp-aplyAprvYn',null); // 확인여부
            SBUxMethod.set('clclnDocPop-inp-aplyIdfrDt',null); // 확인시간

            // 체크리스트
            SBUxMethod.set('clclnDocPop-inp-chkAtchFileSn',null); // 파일순번
            SBUxMethod.set('clclnDocPop-inp-chkFileNm',null); // 파일명
            SBUxMethod.set('clclnDocPop-inp-chkRegDay',null); // 등록일
            SBUxMethod.set('clclnDocPop-inp-chkAprvYn',null); // 확인여부
            SBUxMethod.set('clclnDocPop-inp-chkIdfrDt',null); // 확인시간

            // 엑셀 세부내역서
            SBUxMethod.set('clclnDocPop-inp-excelAtchFileSn',null); // 파일순번
            SBUxMethod.set('clclnDocPop-inp-excelFileNm',null); // 파일명
            SBUxMethod.set('clclnDocPop-inp-excelRegDay',null); // 등록일
            SBUxMethod.set('clclnDocPop-inp-excelAprvYn',null); // 확인여부
            SBUxMethod.set('clclnDocPop-inp-excelIdfrDt',null); // 확인시간

        },
        fn_search: async function() {
            this.fn_clearForm();

            const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtClclnFilePath.do", {
                //검색 파라미터
                sprtBizYr : this.clclnAplyDocUserData.sprtBizYr
                , sprtBizCd : this.clclnAplyDocUserData.sprtBizCd
                , sprtOgnzId : this.clclnAplyDocUserData.sprtOgnzId
                , clclnSeq : this.clclnAplyDocUserData.clclnSeq
                , docSeq : 2
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    data.resultList.forEach((item, index) => {
                        SBUxMethod.set('clclnDocPop-inp-sprtBizYr',item.sprtBizYr); // 지원사업연도
                        SBUxMethod.set('clclnDocPop-inp-sprtBizCd',item.sprtBizCd); // 지원사업코드
                        SBUxMethod.set('clclnDocPop-inp-sprtBizOgnzId',item.sprtOgnzId); // 지원조직아이디
                        SBUxMethod.set('clclnDocPop-inp-seq',item.clclnSeq); // 회차

                        let $aplyFileArea = $('#iframeclclnAplyDocArea');
                        let $chkFileArea = $('#iframeclclnChkListDocArea');


                        // 정산요청서
                        SBUxMethod.set('clclnDocPop-inp-aplyAtchFileSn',item.aplyAtchFileSn); // 파일순번
                        SBUxMethod.set('clclnDocPop-inp-aplyFileNm',item.aplyLgcFileNm); //파일명
                        SBUxMethod.set('clclnDocPop-inp-aplyRegDay',item.aplyRegDt); // 등록일
                        SBUxMethod.set('clclnDocPop-inp-aplyIdfrDt',item.aplyIdfrDt); // 확인시간
                        if (_.isEqual(item.aplyAprvYn,"Y")){
                            SBUxMethod.set('clclnDocPop-inp-aplyAprvYn', "확인"); // 확인여부
                        } else if (_.isEqual(item.aplyAprvYn, "N")) {
                            SBUxMethod.set('clclnDocPop-inp-aplyAprvYn', "수정요청"); // 확인여부
                        } else if(gfn_isEmpty(item.aplyAprvYn)) {
                            SBUxMethod.set('clclnDocPop-inp-aplyAprvYn', null); // 확인여부
                            SBUxMethod.set('clclnDocPop-inp-aplyIdfrDt',null); // 확인시간
                        }
                        // 체크리스트
                        SBUxMethod.set('clclnDocPop-inp-chkAtchFileSn',item.chkAtchFileSn); // 파일순번
                        SBUxMethod.set('clclnDocPop-inp-chkFileNm',item.chkLgcFileNm); //파일명
                        SBUxMethod.set('clclnDocPop-inp-chkRegDay',item.chkRegDt); // 등록일
                        SBUxMethod.set('clclnDocPop-inp-chkIdfrDt',item.chkIdfrDt); // 확인시간
                        if (_.isEqual(item.chkAprvYn,"Y")){
                            SBUxMethod.set('clclnDocPop-inp-chkAprvYn', "확인"); // 확인여부
                        } else if (_.isEqual(item.chkAprvYn, "N")) {
                            SBUxMethod.set('clclnDocPop-inp-chkAprvYn', "수정요청"); // 확인여부
                        } else if(gfn_isEmpty(item.chkAprvYn)) {
                            SBUxMethod.set('clclnDocPop-inp-chkAprvYn', null); // 확인여부
                            SBUxMethod.set('clclnDocPop-inp-chkIdfrDt',null); // 확인시간
                        }
                        // 엑셀
                        SBUxMethod.set('clclnDocPop-inp-excelAtchFileSn',item.excelAtchFileSn); // 파일순번
                        SBUxMethod.set('clclnDocPop-inp-excelFileNm',item.excelLgcFileNm); //파일명
                        SBUxMethod.set('clclnDocPop-inp-excelRegDay',item.excelRegDt); // 등록일
                        SBUxMethod.set('clclnDocPop-inp-excelIdfrDt',item.excelIdfrDt); // 확인시간
                        if (_.isEqual(item.excelAprvYn,"Y")){
                            SBUxMethod.set('clclnDocPop-inp-excelAprvYn', "확인"); // 확인여부
                        } else if (_.isEqual(item.excelAprvYn, "N")) {
                            SBUxMethod.set('clclnDocPop-inp-excelAprvYn', "수정요청"); // 확인여부
                        } else if (gfn_isEmpty(item.excelAprvYn)) {
                            SBUxMethod.set('clclnDocPop-inp-excelAprvYn', null); // 확인여부
                            SBUxMethod.set('clclnDocPop-inp-excelIdfrDt',null); // 확인시간
                        }

                        if(item.aplyFileExtnNm == '.pdf'){
                            // let newfilePathNm = item.filePathNm.replace(/\\/g, "/");
                            // let filepath = "/pdfPath/" + newfilePathNm + '/' + item.physFileNm + "_" + item.fileExtnNm;
                            let filepath = "/pd/viewSrptClclnAtchFile.do?fileSn=" + item.aplyAtchFileSn;

                            const $iframe = $('<iframe>', {
                                src: filepath,
                                css: {
                                    width: '100%',
                                    height: '600px',
                                    border: '0'
                                }
                            });
                            $aplyFileArea.append($iframe);
                        }

                        if(item.chkFileExtnNm == '.pdf'){
                            // let newfilePathNm = item.filePathNm.replace(/\\/g, "/");
                            // let filepath = "/pdfPath/" + newfilePathNm + '/' + item.physFileNm + "_" + item.fileExtnNm;
                            let filepath = "/pd/viewSrptClclnAtchFile.do?fileSn=" + item.chkAtchFileSn;

                            const $iframe = $('<iframe>', {
                                src: filepath,
                                css: {
                                    width: '100%',
                                    height: '600px',
                                    border: '0'
                                }
                            });
                            $chkFileArea.append($iframe);
                        }
                    });
                }

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
            }
        },
        fn_aprv: async function(docSeq) { // 확인
            this.fn_update("aprv",docSeq,confirm("확인 처리 하시겠습니까?"));
        },
        fn_cancel: async function(docSeq) { // 확인취소
            this.fn_update("cancel",docSeq,confirm("확인취소 처리 하시겠습니까?"));
        },
        fn_mdfcnDmnd: async function(docSeq) { // 수정요청
            this.fn_update("mdfcn",docSeq,confirm("수정요청 처리 하시겠습니까?"));
        },


        fn_update: async function(/*String 업데이트구분*/ updtSeCd , docSeq,/** {boolean} */ isConfirmed ) {

            if (!isConfirmed) return;
            const sprtBizYr = SBUxMethod.get('clclnDocPop-inp-sprtBizYr');
            const sprtBizCd = SBUxMethod.get('clclnDocPop-inp-sprtBizCd');
            const sprtOgnzId = SBUxMethod.get('clclnDocPop-inp-sprtBizOgnzId');
            const clclnSeq = SBUxMethod.get('clclnDocPop-inp-seq')
            let atchFileSn;
            if (docSeq == 2) {
                atchFileSn = SBUxMethod.get('clclnDocPop-inp-aplyAtchFileSn');
            } else if (docSeq == 3) {
                atchFileSn = SBUxMethod.get('clclnDocPop-inp-excelAtchFileSn');
            } else if (docSeq == 4) {
                atchFileSn = SBUxMethod.get('clclnDocPop-inp-chkAtchFileSn');
            }

            let aprvYn;
            if (_.isEqual(updtSeCd,"aprv")) {// 확인
                aprvYn = 'Y';
            } else if (_.isEqual(updtSeCd,"cancel")){ // 확인 취소
                aprvYn = null;
            } else if (_.isEqual(updtSeCd,"mdfcn")){ // 수정 요청
                aprvYn = 'N';
            }


            if (gfn_isEmpty(sprtBizYr)){
                gfn_comAlert("W0005", "지원사업연도"); // W0005 {0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(sprtBizCd)){
                gfn_comAlert("W0005", "지원사업코드"); // W0005 {0}이/가 없습니다.
                return;
            }


            if (gfn_isEmpty(sprtOgnzId)){
                gfn_comAlert("W0005", "지원사업조직아이디"); // W0005 {0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(clclnSeq)){
                gfn_comAlert("W0005", "회차"); // W0005 {0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(atchFileSn)){
                gfn_comAlert("W0005", "첨부파일번호"); // W0005 {0}이/가 없습니다.
                return;
            }

            const postJsonPromise = gfn_postJSON("/pd/sprt/updateSprtClclnAplyDoc.do", {
                sprtBizYr : sprtBizYr
                , sprtBizCd : sprtBizCd
                , sprtOgnzId : sprtOgnzId
                , clclnSeq : clclnSeq
                , docSeq : docSeq
                , atchFileSn : atchFileSn
                , aprvYn : aprvYn
            })
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                    await this.fn_search();
                } else {
                    console.log(data.resultCode,data.resultMessage);
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                }

            } catch(e) {
                // console.log(data.resultMessage);
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                // console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        },
        fn_download: async function(docSeq) {

            let fileSnVal;
            let docNm;
            if (docSeq == 2) {
                docNm = "정산요청서";
                fileSnVal = SBUxMethod.get('clclnDocPop-inp-aplyAtchFileSn');
            } else if (docSeq == 3) {
                docNm = "엑셀 세부내역서"
                fileSnVal = SBUxMethod.get('clclnDocPop-inp-excelAtchFileSn');
            } else if (docSeq == 4) {
                docNm = "증빙서류 체크리스트"
                fileSnVal = SBUxMethod.get('clclnDocPop-inp-chkAtchFileSn');
            }
            if(gfn_isEmpty(fileSnVal)){
                return;
            }

            if (!gfn_comConfirm("Q0001", `${'${docNm}'}파일 다운로드`)) {	//	Q0001	{0} 하시겠습니까?
                return;
            }

            let url = "/pd/downloadSrptClclnAtchFile.do?fileSn=" + fileSnVal;
            window.open(url);
        }
    }

    window.addEventListener('DOMContentLoaded', function(e) {

        popClclnAplyDocPdfViewer.init();

    })
</script>
</html>