<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증빙서류 미리보기</title>
    <%@ include file="../../../frame/inc/headerScriptPopup.jsp" %>

</head>
<style>
    .tableWrap{background:var(--card);border:1px solid var(--line);border-radius:16px;padding:12px}
    .tableScroll{overflow:auto}
    .tbl_doc{width:100%;border-collapse:separate;border-spacing:0;min-width:1100px}
    .thd_doc th{position:sticky;top:0;background:#e6e6fa;border-bottom:1px solid var(--line);padding:10px 12px;text-align:left;color:#0f172a;font-size:12px}
    .tbd_doc td{border-bottom:1px solid var(--line);vertical-align:top !important;padding:10px 12px}
    .tbd_doc tr:hover{background:#f5f5f5}
    .pickCell{width:68px;text-align:center}
    .evGroup{display:grid;gap:8px}
    .evItem{border:1px dashed #263455;border-radius:10px;padding:8px;background:#f5f5f5}
    .evHead{display:flex;align-items:center;gap:8px;margin-bottom:6px}
    .evName{font-size:13px;color:#0f172a}
    .files{display:flex;flex-wrap:wrap;gap:6px;margin-top:6px}
    .chip{border:1px solid #314064;border-radius:8px;padding:3px 8px;font-size:12px;color:#4169e1}
</style>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">

        <div class="box-body">
            <div id = "clclnPrufDocArea">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span style="font-size:14px">▶증빙서류</span>
                        </li>
                    </ul>
                </div>

                <table class="table table-bordered tbl_fixed">
                    <caption>증빙서류 정보</caption>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">법인명</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnPrufPop-inp-corpNm"
                                    name="clclnPrufPop-inp-corpNm"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">사업자등록번호</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnPrufPop-inp-brno"
                                    name="clclnPrufPop-inp-brno"
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
                                    id="clclnPrufPop-inp-crno"
                                    name="clclnPrufPop-inp-crno"
                                    class="form-control input-sm"
                                    mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
                                    readonly
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">회차</th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="clclnPrufPop-inp-clclnSeq"
                                    name="clclnPrufPop-inp-clclnSeq"
                                    class="form-control input-sm"
                                    readonly
                            ></sbux-input>
                            <sbux-input uitype="hidden" id="clclnPrufPop-inp-atchFileSn" name="clclnPrufPop-inp-atchFileSn" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="clclnPrufPop-inp-sprtBizYr" name="clclnPrufPop-inp-sprtBizYr" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="clclnPrufPop-inp-sprtBizCd" name="clclnPrufPop-inp-sprtBizCd" class="form-control input-sm" autocomplete="off"></sbux-input>
                            <sbux-input uitype="hidden" id="clclnPrufPop-inp-sprtBizOgnzId" name="clclnPrufPop-inp-sprtBizOgnzId" class="form-control input-sm" autocomplete="off"></sbux-input>
                        </td>
                    </tr>
               
                    </tbody>
                </table>
              <%--  <div class="box-header" style="display:flex; justify-content: flex-start;" >
                    <div style="margin-left: auto;">
                        <sbux-button
                                id="btnDownloadPop"
                                name="btnDownloadPop"
                                uitype="normal"
                                class="btn btn-sm btn-outline-danger"
                                text="다운로드"
                                onclick="popClclnPrufDocViewer.fn_download()"
                        ></sbux-button>
                    </div>
                </div>--%>
            </div>
            <br>
            <br>
                <div id="prufDoc" style="display: none">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>제출된 증빙서류 목록</span></li>
                        </ul>
                    </div>
                    <div class="clclnPruf-wrap">
                        <div class="prufTableWrap">
                            <div class="prufTableScroll">
                                <table class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width: 5%">
                                        <col style="width: 10%">
                                        <col style="width: 15%">
                                        <col style="width: 35%">
                                        <col style="width: 35%">
                                    </colgroup>
                                    <tr>
                                        <th scope="col" class="th_bg text-center">No.</th>
                                        <th scope="col" class="th_bg text-center">주요항목</th>
                                        <th scope="col" class="th_bg text-center">세부항목</th>
                                        <th scope="col" class="th_bg text-center">공통증빙</th>
                                        <th scope="col" class="th_bg text-center">세부증빙</th>
                                    </tr>
                                    <tbody id="pruf-tbody"></tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%--증빙서류 미리보기--%>
            <div id = "iframeclclnPrufDocArea"></div>

        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    var jsonClclnPrufDocPrvw = [];

    const popClclnPrufDocViewer = {
        prgrmId: 'clclnPrufDocPrvwPopup',
        modalId: 'modal-clclnPrufDocPrvw',
        jsonId: 'jsonClclnPrufDocPrvw',
        objGrid: null,
        gridJson: [],
        clclnPrufDocUserData: null,
        callbackFnc: function() {},
        init: async function(_callbackFnc) {
            const rowData = opener.fn_getClclnAplyRowData();
            this.jsonCmnsPrufCd = opener.fn_getJsonCmnsPrufCd();
            this.jsonDtlPrufCd = opener.fn_getJsonDtlPrufCd();
            this.clclnPrufDocUserData = rowData;

            if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
                this.callbackFnc = _callbackFnc;
            }

            //초기화
            SBUxMethod.set('clclnPrufPop-inp-corpNm',null); // 법인명
            SBUxMethod.set('clclnPrufPop-inp-brno',null); // 사업자번호
            SBUxMethod.set('clclnPrufPop-inp-crno',null); // 법인번호
            SBUxMethod.set('clclnPrufPop-inp-clclnSeq',null); // 회차

            SBUxMethod.set('clclnPrufPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('clclnPrufPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('clclnPrufPop-inp-sprtBizOgnzId',null); // 지원조직아이디

            if(!gfn_isEmpty(rowData)){
                SBUxMethod.set('clclnPrufPop-inp-corpNm',rowData.corpNm); // 법인명
                SBUxMethod.set('clclnPrufPop-inp-brno',rowData.brno); // 사업자번호
                SBUxMethod.set('clclnPrufPop-inp-crno',rowData.crno); // 법인번호
                SBUxMethod.set('clclnPrufPop-inp-clclnSeq',rowData.clclnSeq); // 법인번호
            }
            this.fn_search();
        },
        fn_close: function() {
            gfn_closeModal(this.modalId, this.callbackFnc);
        },
        fn_clearForm: function() {
            $('#iframeclclnPrufDocArea').empty();
            SBUxMethod.set('clclnPrufPop-inp-atchFileSn',null); // 파일순번
            SBUxMethod.set('clclnPrufPop-inp-sprtBizYr',null); // 지원사업연도
            SBUxMethod.set('clclnPrufPop-inp-sprtBizCd',null); // 지원사업코드
            SBUxMethod.set('clclnPrufPop-inp-sprtBizOgnzId',null); // 지원조직아이디
        },
        fn_search: async function(/** {boolean} */ isEditable) {
            this.fn_clearForm();

            const postJsonPromise = gfn_postJSON("/pd/sprt/selectClclnPrufList.do",{
                sprtBizYr : this.clclnPrufDocUserData.sprtBizYr
                , sprtBizCd : this.clclnPrufDocUserData.sprtBizCd
                , sprtOgnzId : this.clclnPrufDocUserData.sprtOgnzId
                , clclnSeq : this.clclnPrufDocUserData.clclnSeq
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    const prufObj = {
                        sprtBizYr: data.resultList[0].sprtBizYr,
                        sprtBizCd: data.resultList[0].sprtBizCd,
                        sprtOgnzId: data.resultList[0].sprtOgnzId,
                        clclnSeq: data.resultList[0].clclnSeq,
                        clclnDInfoList: []
                    }
                    // 요청순서별로
                    const dmndMap = {};
                    data.resultList.forEach(item => {
                        const dmndSeq = item.dmndSeq; // 요청순서
                        const dmndArtclKnd = item.dmndArtclKnd; // 주요항목코드
                        const dmndArtclKndNm = item.dmndArtclKndNm; // 주요항목명
                        const dmndArtclCd = item.dmndArtclCd; // 세부항목코드
                        const dmndArtclCdNm = item.dmndArtclCdNm; // 세부항목명
                        const dmndAmt = item.dmndAmt;
                        const dmndCn = item.dmndCn;
                        const dmndRmrk = item.dmndRmrk;
                        const docKnd = item.docKnd; // 문서종류(공통/세부)

                        if (!dmndMap[dmndSeq]) {
                            dmndMap[dmndSeq] = {
                                dmndSeq : dmndSeq,
                                dmndArtclKnd : dmndArtclKnd,
                                dmndArtclKndNm : dmndArtclKndNm,
                                dmndArtclCd : dmndArtclCd,
                                dmndArtclCdNm : dmndArtclCdNm,
                                dmndAmt : dmndAmt,
                                dmndCn : dmndCn,
                                dmndRmrk : dmndRmrk,
                                clclnBscFileInfoList: [],
                                clclnDtlFileInfoList: []
                            };
                        }

                        if (docKnd === "PRUF_BSC") { // 곻통증빙
                            dmndMap[dmndSeq].clclnBscFileInfoList.push({
                                docKnd : item.docKnd,
                                docNm : item.docNm,
                                lgcFileNm : item.lgcFileNm,
                                docCd : item.docCd,
                                atchFileSn : item.atchFileSn,
                                docSeq : item.docSeq
                            });
                        } else { // 세부증빙
                            dmndMap[dmndSeq].clclnDtlFileInfoList.push({
                                docKnd : item.docKnd,
                                docNm : item.docNm,
                                lgcFileNm : item.lgcFileNm,
                                docCd : item.docCd,
                                atchFileSn : item.atchFileSn,
                                docSeq : item.docSeq
                            });
                        }
                    });

                    prufObj.clclnDInfoList = Object.values(dmndMap);
                    this.fn_createDocRow(prufObj)

                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
            }
        },
        fn_createDocRow : function(_prufObj) {
            const div = document.getElementById('prufDoc');
            div.style.display = "block";

            // 초기화
            const tbody = document.getElementById('pruf-tbody');
            for (let i = tbody.children.length - 1; i >= 0; i--) {
                tbody.removeChild(tbody.children[i]);
            }

            objPrufDoc.maxSeq = -1;
            const rows = _prufObj.clclnDInfoList || [];
            if (!Array.isArray(rows) || rows.length === 0) return;
            
            rows.forEach(row => {
                objPrufDoc.maxSeq++;
                const seq = objPrufDoc.maxSeq;

                // tr 생성
                const tr = document.createElement('tr');
                tr.id = objPrufDoc.prefix + 'tr' + seq;
                tr.setAttribute('data-seq', seq);
                
                const sbuxList = [];

                objPrufDoc.initList.forEach(item => {
                    const td = document.createElement('td');
                    td.style.verticalAlign = 'top';

                    const id = objPrufDoc.prefix + item.id + seq;
                    const el = document.createElement(item.type); // sbux-input / sbux-textarea / div / label
                    el.setAttribute('id', id);
                    el.setAttribute('name', id);


                    // 공통 attributes
                    const attrs = item.attributes || {};
                    Object.keys(attrs).forEach(k => el.setAttribute(k, attrs[k]));

                    if (item.isSBUx) {
                        sbuxList.push(id);
                    } else {
                        const c = item.contents || {};
                        if (c.textContent) el.textContent = c.textContent;
                        if (Array.isArray(c.classList)) c.classList.forEach(cls => el.classList.add(cls));
                    }

                    td.appendChild(el);
                    tr.appendChild(td);
                });
                // tbody에 append
                tbody.appendChild(tr);
                // sbux render
                sbuxList.forEach(id => SBUxMethod.render("#" + id));

                const idDmndSeq = objPrufDoc.prefix + 'inp-dmndSeq' + seq;
                const idMajorNm   = objPrufDoc.prefix + 'inp-majorArticleNm' + seq;
                const idArticleNm = objPrufDoc.prefix + 'inp-articleNm' + seq;
                document.getElementById(idDmndSeq).innerText = row.dmndSeq;
                SBUxMethod.set(idMajorNm,row.dmndArtclKndNm);
                SBUxMethod.set(idArticleNm,row.dmndArtclCdNm);

                // 공통/세부 컨테이너
                const idBscDiv = objPrufDoc.prefix + 'div-prufDocBsc' + seq;
                const idDtlDiv = objPrufDoc.prefix + 'div-prufDoc'    + seq;
                const bscWrap  = document.getElementById(idBscDiv);
                const dtlWrap  = document.getElementById(idDtlDiv);

                /** 공통증빙 **/
                const requiredBsc = this.jsonCmnsPrufCd || [];
                // 기존 파일을 코드별로 매핑
                const bscMap = {};
                (row.clclnBscFileInfoList || []).forEach(f => {
                    (bscMap[f.docCd] ||= []).push(f);
                });

                requiredBsc.forEach(def => {
                    const box = document.createElement('div');
                    box.className = 'evItem';

                    // 기존 파일칩
                    const exist = document.createElement('div');
                    this.fn_renderExistingChips(exist, bscMap[def.value] || [], def.text, row.dmndSeq);
                    box.appendChild(exist);


                    bscWrap.appendChild(box);
                });

                /** 세부증빙 **/
                const requiredDtl = (this.jsonDtlPrufCd || []).filter(function(d){ return d.artclCd === row.dmndArtclCd; });
                const dtlMap = {};
                (row.clclnDtlFileInfoList || []).forEach(function(f){
                    if (!dtlMap[f.docCd]) dtlMap[f.docCd] = [];
                    dtlMap[f.docCd].push(f);
                });

                requiredDtl.forEach(def => {
                    const box = document.createElement('div');
                    box.className = 'evItem';

                    // 기존 파일칩
                    const exist = document.createElement('div');
                    this.fn_renderExistingChips(exist, dtlMap[def.value] || [], def.text, row.dmndSeq);
                    box.appendChild(exist);

                    dtlWrap.appendChild(box);
                });
            })
        },
        fn_renderExistingChips: function(container, files, titleText, dmndSeq) {
        container.innerHTML = '';

        // 증빙head
        const head = document.createElement('div');
        head.className = 'evHead';

        const nm = document.createElement('div');
        nm.className = 'evName';
        nm.textContent = titleText;

        head.appendChild(nm);
        container.appendChild(head);

        // 파일 목록
        const box = document.createElement('div');
        box.className = 'files';


        files.forEach(file => {
            const item  = document.createElement('div');
            item.className = 'chip'; // 칩 스타일 재활용

            // 파일명
            const label = document.createElement('span');
            const name  = file.lgcFileNm;
            label.textContent = name;


            // 클릭 이벤트 추가
            label.style.cursor = "pointer"; // 손가락 커서
            label.addEventListener("click", () => {
                this.fn_clickDoc(file);  // 공용 함수 호출
            });

            // 다운로드 버튼
            const btn = document.createElement('button');
            btn.type = 'button';
            btn.className = 'btn btn-xs btn-outline-primary btnClass';
            btn.textContent = '다운로드';

            btn.addEventListener("click", () => {
                this.fn_downloadDoc(file);
            });

            item.appendChild(label);
            item.appendChild(document.createTextNode(' ')); // 간격
            item.appendChild(btn);
            box.appendChild(item);
        });


        container.appendChild(box);
    },
        
    fn_downloadDoc: async function(_file) {
        const atchFileSn = _file.atchFileSn;
        if (gfn_isEmpty(atchFileSn)) {
            return;
        }

        let url = "/pd/downloadSrptClclnPrufAtchFile.do?fileSn=" + atchFileSn;
        window.open(url);
    },

    fn_clickDoc: async function(_file) {
        const $fileArea = $('#iframeclclnPrufDocArea');
        const lgcFileNm = _file.lgcFileNm;
        const extension = lgcFileNm.substring(lgcFileNm.lastIndexOf('.')).toLowerCase();
        const atchFileSn = _file.atchFileSn;
        if (gfn_isEmpty(atchFileSn)) {
            return;
        }

        const imgExtension = ['.gif','.jpg','.jpeg','.png'];

        let filepath = "/pd/viewSrptClclnPrufAtchFile.do?fileSn=" + atchFileSn;
        $fileArea.empty();

        if (_.isEqual(extension,'.pdf')) {

            const $iframe = $('<iframe>', {
                src: filepath,
                css: {
                    width: '100%',
                    height: '600px',
                    border: '0'
                }
            });
            $fileArea.append($iframe);
        } else if (imgExtension.includes(extension)) {
            const $title = $('<div>', {
                text: '증빙서류 미리보기',
                css: {
                    fontSize: '14px',
                    marginBottom: '8px',
                    marginRight: '3px',
                    fontWeight: '600',
                    color: '#3c6dbc'
                }
            });
            $fileArea.append($title);

            const $img = $('<img>', {
                id: 'prufPreviewImg',
                src: filepath,
                alt: lgcFileNm,
                css: {
                    display: 'block',
                    maxWidth: '100%',
                    maxHeight: '600px',
                    width: 'auto',
                    height: 'auto',
                    margin: '0 auto',
                    objectFit: 'contain',
                    border: 0
                }
            });
            $fileArea.append($img);

        } // pdf,이미지 이외

        },
    }

    const objPrufDoc = {
        maxSeq : -1,
        prefix : "tbl-doc-",
        getInitCol: function(_knd) {
            let col = -1;
            switch (_knd) {
                case "DMND_SEQ":	// 요청순서
                    col = 0;
                    break;
                case "MAJOR_ARTICLE":	// 주요항목
                    col = 1;
                    break;
                case "ARTICLE":			// 세부항목
                    col = 2;
                    break;
                case "PRUF_DOC_BSC":	// 공통증빙
                    col = 3;
                    break;
                case "PRUF_DOC":		// 증빙서류
                    col = 4;
                    break;
            }
            return col;
        },
        initList : [
            // 요청순서
            {
                isSBUx: true,
                elementKey: "dmndSeq",
                type: "sbux-label",
                id: "inp-dmndSeq",
                attributes: {
                    "uitype":"normal",
                },
                contents: {
                }
            },
            // 1 행 : 주요항목
            {
                isSBUx: true,
                elementKey: "dmndArtclKndNm",
                type: "sbux-input",
                id: "inp-majorArticleNm",
                attributes: {
                    "uitype": "text",
                    "class": "form-control input-sm input-sm-ast",
                    "readonly" : "true"
                },
                exAttributes: {

                },
                exEvents: [],
            },
            // 2 행 : 세부항목
            {
                isSBUx: true,
                elementKey: "dmndArtclNm",
                type: "sbux-input",
                id: "inp-articleNm",
                attributes: {
                    "uitype": "text",
                    "class": "form-control input-sm input-sm-ast",
                    "readonly" : "true"
                },
                exAttributes: {
                },
                exEvents: [],
            },
            // 5 행 : 공통증빙
            {
                isSBUx: false,
                elementKey: "pfudDocBsc",
                type: "div",
                id: 'div-prufDocBsc',
                attributes: {
                },
                contents: {
                    "classList": ["evGroup"]
                }
            },
            // 6행 : 증빙서류
            {
                isSBUx: false,
                elementKey: "pfudDoc",
                type: "div",
                id: 'div-prufDoc',
                attributes: {
                },
                contents: {
                    "classList": ["evGroup"]
                }
            },
        ],
    }

    window.addEventListener('DOMContentLoaded', function(e) {

        popClclnPrufDocViewer.init();

    })
</script>
</html>