<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교부신청서 미리보기</title>
    <%@ include file="../../../frame/inc/headerScriptPopup.jsp" %>

</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">

        <div class="box-body">
            <div id = "dtbnAplyDocArea">

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span style="font-size:14px">▶교부신청서</span>
                        </li>
                    </ul>
                </div>

                <table class="table table-bordered tbl_fixed">
                    <caption>교부신청서 정보</caption>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">파일명</th>
                        <td class="td_input">
                            <sbux-input uitype="hidden" id="dtbnDocPop-inp-atchFileSn" name="dtbnDocPop-inp-atchFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="dtbnDocPop-inp-sprtBizYr" name="dtbnDocPop-inp-sprtBizYr" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="dtbnDocPop-inp-sprtBizCd" name="dtbnDocPop-inp-sprtBizCd" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="dtbnDocPop-inp-sprtBizOgnzId" name="dtbnDocPop-inp-sprtBizOgnzId" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="dtbnDocPop-inp-aplyDocCd" name="dtbnDocPop-inp-aplyDocCd" class="form-control input-sm" autocomplete="off"></sbux-input>

                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-fileNm"
                                    name="dtbnDocPop-inp-fileNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">등록일</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-regDay"
                                    name="dtbnDocPop-inp-regDay"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">법인명</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-corpNm"
                                    name="dtbnDocPop-inp-corpNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">사업자등록번호</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-brno"
                                    name="dtbnDocPop-inp-brno"
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
                                    id="dtbnDocPop-inp-crno"
                                    name="dtbnDocPop-inp-crno"
                                    class="form-control input-sm"
                                    mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">확인여부</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-aprvYn"
                                    name="dtbnDocPop-inp-aprvYn"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">확인자</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-idfr"
                                    name="dtbnDocPop-inp-idfr"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">확인시간</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="dtbnDocPop-inp-idfrDt"
                                    name="dtbnDocPop-inp-idfrDt"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    readonly
                            ></sbux-input>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="box-header" style="display:flex; justify-content: flex-start;" >
                    <div style="margin-left: auto;">
                        <sbux-button
                                id="btnDownloadPop"
                                name="btnDownloadPop"
                                uitype="normal"
                                class="btn btn-sm btn-outline-danger"
                                text="다운로드"
                                onclick="popDtbnAplyDocPdfViewer.fn_download()"
                        ></sbux-button>

                        <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">

                            <sbux-button
                                    id="btnIdntyPop"
                                    name="btnIdntyPop"
                                    uitype="normal"
                                    text="확인"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="popDtbnAplyDocPdfViewer.fn_aprv()"
                            ></sbux-button>

                            <sbux-button
                                    id="btnCancelPop"
                                    name="btnCancelPop"
                                    uitype="normal"
                                    text="확인취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="popDtbnAplyDocPdfViewer.fn_cancel()"
                            ></sbux-button>

                            <sbux-button
                                    id="btnMdfcnDmnd"
                                    name="btnMdfcnDmnd"
                                    uitype="normal"
                                    text="수정요청"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="popDtbnAplyDocPdfViewer.fn_mdfcnDmnd()"
                            ></sbux-button>

                        </c:if>
                    </div>
                </div>
            </div>
            <br>
            <br>

            <%--신청서 미리보기--%>
            <div id = "iframeDtbnAplyDocArea"></div>

        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    var gridDtbnAplyDocPrvw = null;
    var jsonDtbnAplyDocPrvw = [];

    const popDtbnAplyDocPdfViewer = {
        prgrmId: 'dtbnAplyDocPrvwPopup',
        modalId: 'modal-dtbnAplyDocPrvw',
        gridId: 'gridDtbnAplyDocPrvw',
        jsonId: 'jsonDtbnAplyDocPrvw',
        // areaId: "sb-area-grdBizPlanPdfViewerPop",
        prvApcCd: "",
        objGrid: null,
        gridJson: [],
        dtbnAplyDocUserData: null,
        callbackFnc: function() {},
        init: async function(_callbackFnc) {
            let rowData = opener.fn_getDtbnMngRowData();

            this.dtbnAplyDocUserData = rowData;

            if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
                this.callbackFnc = _callbackFnc;
            }

            //초기화
            SBUxMethod.set('dtbnDocPop-inp-corpNm',null); // 법인명
            SBUxMethod.set('dtbnDocPop-inp-brno',null); // 사업자번호
            SBUxMethod.set('dtbnDocPop-inp-crno',null); // 법인번호

            SBUxMethod.set('dtbnDocPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('dtbnDocPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('dtbnDocPop-inp-sprtBizOgnzId',null); // 지원조직아이디
            SBUxMethod.set('dtbnDocPop-inp-aplyDocCd',null); // 지원조직아이디

            if(!gfn_isEmpty(rowData)){
                SBUxMethod.set('dtbnDocPop-inp-corpNm',rowData.corpNm); // 법인명
                SBUxMethod.set('dtbnDocPop-inp-brno',rowData.brno); // 사업자번호
                SBUxMethod.set('dtbnDocPop-inp-crno',rowData.crno); // 법인번호
            }
            this.fn_search();
        },
        fn_close: function() {
            gfn_closeModal(this.modalId, this.callbackFnc);
        },
        fn_clearForm: function() {
            $('#iframeDtbnAplyDocArea').empty();
            SBUxMethod.set('dtbnDocPop-inp-fileNm',null); // 파일명
            SBUxMethod.set('dtbnDocPop-inp-atchFileSn',null); // 파일순번
            SBUxMethod.set('dtbnDocPop-inp-regDay',null); // 등록일
            SBUxMethod.set('dtbnDocPop-inp-aprvYn',null); // 확인여부
            SBUxMethod.set('dtbnDocPop-inp-idfr',null); // 확인자
            SBUxMethod.set('dtbnDocPop-inp-idfrDt',null); // 확인시간

            SBUxMethod.set('dtbnDocPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('dtbnDocPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('dtbnDocPop-inp-sprtBizOgnzId',null); // 지원조직아이디
            SBUxMethod.set('dtbnDocPop-inp-aplyDocCd',null); // 지원조직아이디
        },
        fn_search: async function(/** {boolean} */ isEditable) {
            this.fn_clearForm();

            const postJsonPromise = gfn_postJSON("/pd/pcorm/selectSprtBizFilePath.do", {
                //검색 파라미터
                sprtBizYr : this.dtbnAplyDocUserData.yr
                , sprtBizCd : this.dtbnAplyDocUserData.sprtBizCd
                , sprtOgnzId : this.dtbnAplyDocUserData.sprtOgnzId
                , aplyDocCd : this.dtbnAplyDocUserData.aplyDocCd
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    data.resultList.forEach((item, index) => {

                        if(!gfn_isEmpty(item.filePathNm)){
                            let $fileArea = null;

                            $fileArea = $('#iframeDtbnAplyDocArea');
                            SBUxMethod.set('dtbnDocPop-inp-fileNm',item.lgcFileNm); //파일명
                            SBUxMethod.set('dtbnDocPop-inp-regDay',item.regDt); // 등록일
                            if (_.isEqual(item.aprvYn,"Y")){
                                SBUxMethod.set('dtbnDocPop-inp-aprvYn', "확인"); // 확인여부
                                SBUxMethod.set('dtbnDocPop-inp-idfr',item.idfr); // 확인자
                                SBUxMethod.set('dtbnDocPop-inp-idfrDt',item.idfrDt); // 확인시간
                            } else if (_.isEqual(item.aprvYn, "N")) {
                                SBUxMethod.set('dtbnDocPop-inp-aprvYn', "수정요청"); // 확인여부
                                SBUxMethod.set('dtbnDocPop-inp-idfr',item.idfr); // 확인자
                                SBUxMethod.set('dtbnDocPop-inp-idfrDt',item.idfrDt); // 확인시간
                            }

                            SBUxMethod.set('dtbnDocPop-inp-atchFileSn',item.atchFileSn); // 파일순번

                            SBUxMethod.set('dtbnDocPop-inp-sprtBizYr',item.sprtBizYr); // 지원사업연도
                            SBUxMethod.set('dtbnDocPop-inp-sprtBizCd',item.sprtBizCd); // 지원사업코드
                            SBUxMethod.set('dtbnDocPop-inp-sprtBizOgnzId',item.sprtOgnzId); // 지원조직아이디
                            SBUxMethod.set('dtbnDocPop-inp-aplyDocCd',item.aplyDocCd); // 지원조직아이디

                            if(item.fileExtnNm == '.pdf'){
                                let newfilePathNm = item.filePathNm.replace(/\\/g, "/");
                                // let filepath = "/pdfPath/" + newfilePathNm + '/' + item.physFileNm + "_" + item.fileExtnNm;
                                let filepath = "/pd/viewSrptAtchFile.do?fileSn=" + item.atchFileSn;

                                const $iframe = $('<iframe>', {
                                    src: filepath,
                                    css: {
                                        width: '100%',
                                        height: '600px',
                                        border: '0'
                                    }
                                });
                                $fileArea.append($iframe);
                            }
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
        fn_aprv: async function() { // 확인
            this.fn_update("aprv",confirm("확인 처리 하시겠습니까?"));
        },
        fn_cancel: async function() { // 확인취소
            this.fn_update("cancel",confirm("확인취소 처리 하시겠습니까?"));
        },
        fn_mdfcnDmnd: async function() { // 수정요청
            this.fn_update("mdfcn",confirm("수정요청 처리 하시겠습니까?"));
        },


        fn_update: async function(/*String 업데이트구분*/ updtSeCd , /** {boolean} */ isConfirmed ) {

            if (!isConfirmed) return;

            const sprtBizYr = SBUxMethod.get('dtbnDocPop-inp-sprtBizYr');
            const sprtBizCd = SBUxMethod.get('dtbnDocPop-inp-sprtBizCd');
            const sprtOgnzId = SBUxMethod.get('dtbnDocPop-inp-sprtBizOgnzId');
            const aplyDocCd = SBUxMethod.get('dtbnDocPop-inp-aplyDocCd');
            const atchFileSn = SBUxMethod.get('dtbnDocPop-inp-atchFileSn');

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

            if (gfn_isEmpty(aplyDocCd)){
                gfn_comAlert("W0005", "신청문서코드"); // W0005 {0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(atchFileSn)){
                gfn_comAlert("W0005", "첨부파일번호"); // W0005 {0}이/가 없습니다.
                return;
            }


            const postJsonPromise = gfn_postJSON("/pd/pcorm/updateSprtBizAplyDoc.do", {
                sprtBizYr : sprtBizYr
                , sprtBizCd : sprtBizCd
                , sprtOgnzId : sprtOgnzId
                , aplyDocCd : aplyDocCd
                , atchFileSn : atchFileSn
                , aprvYn : aprvYn
            })
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                    this.fn_search();
                } else {
                    // console.log(data.resultMessage);
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                }

            } catch(e) {
                // console.log(data.resultMessage);
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        },
        fn_download: async function() {

            let fileSnVal = SBUxMethod.get('dtbnDocPop-inp-atchFileSn');
            if(gfn_isEmpty(fileSnVal)){
                return;
            }
            // var url = "/pd/pcorm/downloadSprtDoc/"+fileSnVal;
            let url = "/pd/downloadSrptAtchFile.do?fileSn=" + fileSnVal;
            window.open(url);
        }
    }

    window.addEventListener('DOMContentLoaded', function(e) {

        popDtbnAplyDocPdfViewer.init();

    })
</script>
</html>