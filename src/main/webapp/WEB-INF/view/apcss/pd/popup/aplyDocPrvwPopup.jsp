<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청서 미리보기</title>
    <%@ include file="../../../frame/inc/headerScriptPopup.jsp" %>

</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">

        <div class="box-body">
            <div id = "bizPlanArea">

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span style="font-size:14px">▶신청서</span>
                        </li>
                    </ul>
                </div>

                <table class="table table-bordered tbl_fixed">
                    <caption>신청서 정보</caption>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">파일명</th>
                        <td class="td_input">
                            <sbux-input uitype="hidden" id="aplyPop-inp-atchFileSn" name="aplyPop-inp-atchFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="aplyPop-inp-sprtBizYr" name="aplyPop-inp-sprtBizYr" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="aplyPop-inp-sprtBizCd" name="aplyPop-inp-sprtBizCd" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="aplyPop-inp-sprtBizOgnzId" name="aplyPop-inp-sprtBizOgnzId" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="aplyPop-inp-aplyDocCd" name="aplyPop-inp-aplyDocCd" class="form-control input-sm" autocomplete="off"></sbux-input>

                            <sbux-input
                                    uitype="text"
                                    id="aplyPop-inp-fileNm"
                                    name="aplyPop-inp-fileNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">등록일</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="aplyPop-inp-regDay"
                                    name="aplyPop-inp-regDay"
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
                                    id="aplyPop-inp-corpNm"
                                    name="aplyPop-inp-corpNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">사업자등록번호</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="aplyPop-inp-brno"
                                    name="aplyPop-inp-brno"
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
                                    id="aplyPop-inp-crno"
                                    name="aplyPop-inp-crno"
                                    class="form-control input-sm"
                                    mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">확인여부</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="aplyPop-inp-stts"
                                    name="aplyPop-inp-stts"
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
                                    id="aplyPop-inp-aprvNm"
                                    name="aplyPop-inp-aprvNm"
                                    class="form-control input-sm"
                                    autocomplete="off"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">확인시간</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="aplyPop-inp-aprvDt"
                                    name="aplyPop-inp-aprvDt"
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
                                onclick="popBizPlanPdfViewer.fn_download()"
                        ></sbux-button>

                        <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">

                        <sbux-button
                                id="btnIdntyPop"
                                name="btnIdntyPop"
                                uitype="normal"
                                text="확인"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popBizPlanPdfViewer.fn_aprv()"
                        ></sbux-button>

                        <sbux-button
                                id="btnCancelPop"
                                name="btnCancelPop"
                                uitype="normal"
                                text="확인취소"
                                class="btn btn-sm btn-outline-danger"
                                onclick="popBizPlanPdfViewer.fn_cancel()"
                        ></sbux-button>

                        </c:if>
                    </div>
                </div>
            </div>
            <br>
            <br>

            <%--신청서 미리보기--%>
            <div id = "iframeAplyDocArea"></div>

        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    var gridAplyDocPrvw = null;
    var jsonAplyDocPrvw = [];

    const popBizPlanPdfViewer = {
        prgrmId: 'aplyDocPrvwPopup',
        modalId: 'modal-aplyDocPrvw',
        gridId: 'gridAplyDocPrvw',
        jsonId: 'jsonAplyDocPrvw',
        // areaId: "sb-area-grdBizPlanPdfViewerPop",
        prvApcCd: "",
        objGrid: null,
        gridJson: [],
        aplyDocUserData: null,
        callbackFnc: function() {},
        init: async function(_callbackFnc) {
            let rowData = opener.fn_getRowData();

            this.aplyDocUserData = rowData;

            if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
                this.callbackFnc = _callbackFnc;
            }

            //초기화
            SBUxMethod.set('aplyPop-inp-corpNm',null); // 법인명
            SBUxMethod.set('aplyPop-inp-brno',null); // 사업자번호
            SBUxMethod.set('aplyPop-inp-crno',null); // 법인번호

            SBUxMethod.set('aplyPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('aplyPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('aplyPop-inp-sprtBizOgnzId',null); // 지원조직아이디
            SBUxMethod.set('aplyPop-inp-aplyDocCd',null); // 지원조직아이디

            if(!gfn_isEmpty(rowData)){
                SBUxMethod.set('aplyPop-inp-corpNm',rowData.corpNm); // 법인명
                SBUxMethod.set('aplyPop-inp-brno',rowData.brno); // 사업자번호
                SBUxMethod.set('aplyPop-inp-crno',rowData.crno); // 법인번호
            }
            this.fn_search();
        },
        fn_close: function() {
            gfn_closeModal(this.modalId, this.callbackFnc);
        },
        fn_clearForm: function() {
            $('#iframeAplyDocArea').empty();
            //신청서
            SBUxMethod.set('aplyPop-inp-fileNm',null); // 파일명
            SBUxMethod.set('aplyPop-inp-atchFileSn',null); // 파일순번
            SBUxMethod.set('aplyPop-inp-regDay',null); // 등록일
            SBUxMethod.set('aplyPop-inp-stts',null); // 확인여부
            SBUxMethod.set('aplyPop-inp-aprvNm',null); // 확인자
            SBUxMethod.set('aplyPop-inp-aprvDt',null); // 확인시간

            SBUxMethod.set('aplyPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('aplyPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('aplyPop-inp-sprtBizOgnzId',null); // 지원조직아이디
            SBUxMethod.set('aplyPop-inp-aplyDocCd',null); // 지원조직아이디
        },
        fn_search: async function(/** {boolean} */ isEditable) {
            this.fn_clearForm();

            const postJsonPromise = gfn_postJSON("/pd/pcorm/selectSprtBizFilePath.do", {
                //검색 파라미터
                brno : this.aplyDocUserData.brno
                , sprtBizYr : this.aplyDocUserData.sprtBizYr
                , sprtBizCd : this.aplyDocUserData.sprtBizCd
                , sprtOgnzId : this.aplyDocUserData.sprtBizOgnzId
                , aplyDocCd : "BIZ_APLY"
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    data.resultList.forEach((item, index) => {

                        if(!gfn_isEmpty(item.filePathNm)){
                            let $fileArea = null;

                            $fileArea = $('#iframeAplyDocArea');
                            SBUxMethod.set('aplyPop-inp-fileNm',item.lgcFileNm); //파일명
                            SBUxMethod.set('aplyPop-inp-regDay',item.lastUldDt); // 등록일
                            if (_.isEqual(item.aprvYn,"Y")){
                                SBUxMethod.set('aplyPop-inp-stts', "확인"); // 확인여부
                                SBUxMethod.set('aplyPop-inp-aprvNm',item.idfr); // 확인자
                                SBUxMethod.set('aplyPop-inp-aprvDt',item.idfrDt); // 확인시간
                            }

                            SBUxMethod.set('aplyPop-inp-atchFileSn',item.atchFileSn); // 파일순번

                            SBUxMethod.set('aplyPop-inp-sprtBizYr',item.sprtBizYr); // 지원사업연도
                            SBUxMethod.set('aplyPop-inp-sprtBizCd',item.sprtBizCd); // 지원사업코드
                            SBUxMethod.set('aplyPop-inp-sprtBizOgnzId',item.sprtOgnzId); // 지원조직아이디
                            SBUxMethod.set('aplyPop-inp-aplyDocCd',item.aplyDocCd); // 지원조직아이디

                            if(item.fileExtnNm == '.pdf'){
                                let newfilePathNm = item.filePathNm.replace(/\\/g, "/");
                                let filepath = "/pdfPath/" + newfilePathNm + '/' + item.physFileNm + "_" + item.fileExtnNm;

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

        fn_update: async function(/*String 업데이트구분*/ updtSeCd , /** {boolean} */ isConfirmed ) {

            if (!isConfirmed) return;

            const sprtBizYr = SBUxMethod.get('aplyPop-inp-sprtBizYr');
            const sprtBizCd = SBUxMethod.get('aplyPop-inp-sprtBizCd');
            const sprtOgnzId = SBUxMethod.get('aplyPop-inp-sprtBizOgnzId');
            const aplyDocCd = SBUxMethod.get('aplyPop-inp-aplyDocCd');
            const atchFileSn = SBUxMethod.get('aplyPop-inp-atchFileSn');

            let aprvYn;
            if (_.isEqual(updtSeCd,"aprv")) {// 확인
                aprvYn = 'Y';
            } else if (_.isEqual(updtSeCd,"cancel")){ // 확인 취소
                aprvYn = null;
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
                console.log(data.resultMessage);
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        },
        fn_download: async function() {
            let fileSnVal;

            fileSnVal = SBUxMethod.get('aplyPop-inp-atchFileSn');

            if(gfn_isEmpty(fileSnVal)){
                return;
            }
            var url = "/pd/pcorm/downloadSprtDoc/"+fileSnVal;
            window.open(url);
        }
    }

    window.addEventListener('DOMContentLoaded', function(e) {

        popBizPlanPdfViewer.init();

    })
</script>
</html>