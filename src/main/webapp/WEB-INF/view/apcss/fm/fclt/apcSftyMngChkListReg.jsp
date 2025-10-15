<%
    /**
     * @Class Name : apcSftyMngChkListReg.jsp
     * @Description : 6. APC 안전관리 자가진단 체크리스트
     * @author SI개발부
     * @since 2025.10.04
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.10.04   	유민지		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid" style="height: 100vh">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- APC안전관리 자가진단 체크리스트 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
                <sbux-button id="btnTmprStrg" name="btnTmprStrg" uitype="normal" text="임시저장" class="btn btn-sm btn-outline-danger" onclick="fn_tmprStrg"></sbux-button>
                <sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <div>
                <table class="table table-bordered tbl_row tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <col style="width: 11%">
                    <col style="width: 22%">
                    <col style="width: 50px">
                    <col style="width: 11%">
                    <col style="width: 22%">
                    <col style="width: 187px">
                    <col style="width: 100px">
                    <tbody>
                    <tr>
                        <th scope="row" style="border-bottom:1px solid white " >APC명</th>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
                            <sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
                        </td>
                        <td>
                            <sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
                        </td>
                        <th scope="row">조사연도</th>
                        <td class="td_input"  style="border-right: hidden;">
                            <sbux-select
                                    id="srch-slt-crtrYr"
                                    name= "srch-slt-crtrYr"
                                    uitype="single"
                                    jsondata-ref="jsonCrtrYr"
                                    class="form-control input-sm"
                                    onchange="fn_changeCrtrYr"
                            ></sbux-select>
                        </td>
                        <td colspan="2"></td>
                        <sbux-input id="srch-inp-srvyNo" name="srch-inp-srvyNo" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
                    </tr>
                    </tbody>
                </table>
            </div>

            <br>
            <%-- 진척도 --%>
            <%@ include file="prgrs/apcPrgrs.jsp" %>
            <br>

            <div>
                <div id="srvyCn"></div>
                <%--<div id="srvyWrtGdCn"></div>--%>
                <br>
                본 체크리스트는 APC의 안전보건 및 소방 관련 현황을 점검하거나 단속하기 위한 목적이 아니며, 사업장 스스로 최소한의 안전관리 상태를 확인하고 관련 제도를 안내해 드리고자 하는 홍보 및 계도 목적으로 시행되는 것입니다.
                <br><br>
                질문은 APC가 갖추어야 할 기본적인 내용으로 구성되어 있으며, 간단히 O/X로 답변하실 수 있습니다. 따라서 부담 없이 편안한 마음으로 현재 사업장의 상황에 맞게 답변해 주시면 감사하겠습니다.
                <br><br>
                체크리스트 항목과 관련하여 더 상세하고 전문적인 내용(예: 위험성 평가 방법, 소방시설 점검 기준 등)에 대한 문의는 고용노동부, 안전보건공단, 관할 소방서 등 전문 기관을 통해 정확한 안내를 받으시길 권장합니다.
                <br><br>
                아울러, APC 안전보건 관리에 참고하실 수 있도록 본 체크리스트 하단에 관련 홍보자료 및 매뉴얼을 첨부하였으니  업무에 적극 활용하시기 바랍니다.
            </div>

            <div style="height: 10px"></div>

            <div>
                <label style="font-weight: bold;" id="srvyNm"></label>
            </div>

            <table class="table table-bordered tbl_row tbl_fixed" id="srvyTable">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 30%">
                    <col style="width: 50%">
                    <col style="width: 20%">
                </colgroup>
                <tr>
                    <th style="text-align: center">주요내용</th>
                    <th style="text-align: center">문항</th>
                    <th style="text-align: center">답변</th>
                </tr>
                <tbody id="srvyTbody"></tbody>
            </table>


        </div>
    </div>
    </div>
</section>
<div>
    <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
</div>
<div id="body-modal-apcSelect">
    <jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">
    // 기준연도
    var jsonCrtrYr = [];

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    /* 초기세팅 */
    const fn_init = async function() {
        await fn_initSBSelect();
        await fn_selectSrvyMst(); // 설문조사 마스터 조회
        await fn_selectSrvyDtl(); // 설문조사 상세 조회

        await fn_selectUserApcList(); //선택가능한 APC리스트 조회

        if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
            return;
        }

        await fn_search(); // 조회

        //진척도
        await cfn_selectPrgrs();
    }

    const fn_initSBSelect = async function() {
        await gfn_getApcSurveyCrtrYr('srch-slt-crtrYr',jsonCrtrYr); // 연도
        fn_changeCrtrYr();
    }

    /* 선택가능한 APC리스트 조회 */
    const fn_selectUserApcList = async function(){

        let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

        });

        let data = await postJsonPromise;
        try{
            let apcListLength = data.resultList.length;
            if(apcListLength == 1){
                SBUxMethod.set("srch-inp-apcCd", data.resultList[0].apcCd);
                SBUxMethod.set("srch-inp-apcNm", data.resultList[0].apcNm);
            }else if (apcListLength > 1){
                //APC선택 팝업 열기
                fn_modalApcSelect();
                SBUxMethod.openModal("modal-apcSelect");
            }
        }catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    // apc 선택 팝업 호출
    const fn_modalApcSelect = function() {
        popApcSelect.init(fn_setApc);
    }

    // apc 선택 팝업 콜백 함수
    const fn_setApc = async function(apc) {
        if (!gfn_isEmpty(apc)) {
            SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
            SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
        }
        //진척도 갱신
        await cfn_selectPrgrs();
        await fn_search();
    }

    //최종제출 여부 체크
    function fn_prgrsLastChk() {
        //최종제출 여부
        let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
        if(prgrsLast  == 'Y'){
            SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
            SBUxMethod.attr("btnTmprStrg",'disabled','true'); // 임시저장버튼 비활성화

        } else {
            SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
            SBUxMethod.attr("btnTmprStrg",'disabled','false'); // 임시저장버튼 활성화
        }
    }

    /** 설문조사 마스터 조회 **/
    const fn_selectSrvyMst = async function () {
        const srvyNo = SBUxMethod.get('srch-inp-srvyNo');

        const postJsonPromise = gfn_postJSON("/fm/fclt/selectSrvyMst.do", {
            srvyNo : srvyNo
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                document.querySelector('#srvyNm').innerText = "○" + data.resultMap.srvyNm;
                document.querySelector('#srvyCn').innerText = data.resultMap.srvyCn;
                // document.querySelector('#srvyWrtGdCn').innerText = data.resultMap.srvyWrtGdCn;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /** 설문조사 상세 조회 **/
    const fn_selectSrvyDtl = async function () {
        const srvyNo = SBUxMethod.get('srch-inp-srvyNo');

        const postJsonPromise = gfn_postJSON("/fm/fclt/selectSrvyDtl.do", {
            srvyNo : srvyNo
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** 설문조사 테이블 만들기  **/
                const tbody = document.getElementById('srvyTbody');
                tbody.innerHTML = ""; // 초기화

                data.resultList.forEach(item => {
                    const tr = document.createElement("tr");

                    // 주요내용
                    const tdExpln = document.createElement("th");
                    tdExpln.textContent = item.srvyExpln || "";
                    tr.appendChild(tdExpln);

                    // 문항
                    const tdQitemCn = document.createElement("td");
                    tdQitemCn.textContent = item.srvyQitemCn || "";
                    tr.appendChild(tdQitemCn);

                    // 답변
                    const tdAns = document.createElement("td");
                    tdAns.setAttribute("class","td_input");

                    const qItemNo = item.srvyQitemNo;
                    const name = "srvy-qItem" + qItemNo;

                    if (String(qItemNo) === "1") {
                        const input = document.createElement("sbux-datepicker");
                        input.setAttribute("id", "srvy-qItemNo" + qItemNo);
                        input.setAttribute("name", name);
                        input.setAttribute("uitype", "popup");
                        input.setAttribute("datepicker-mode", "year");
                        input.setAttribute("class", "form-control input-sm sbux-pik-group-apc input-sm-ast");

                        tdAns.appendChild(input);
                    } else {
                        const radioY = document.createElement("sbux-radio");
                        radioY.setAttribute("id", "rdo-Y-qItemNo" + qItemNo);
                        radioY.setAttribute("name", name);
                        radioY.setAttribute("uitype", "normal");
                        radioY.setAttribute("value", "Y");
                        radioY.setAttribute("class", "radio_label");
                        radioY.setAttribute("text", "o");
                        radioY.setAttribute("text-right-padding", "10px");

                        const radioN = document.createElement("sbux-radio");
                        radioN.setAttribute("id", "rdo-N-qItemNo" + qItemNo);
                        radioN.setAttribute("name", name);
                        radioN.setAttribute("uitype", "normal");
                        radioN.setAttribute("value", "N");
                        radioN.setAttribute("class", "radio_label");
                        radioN.setAttribute("text", "x");

                        tdAns.appendChild(radioY);
                        tdAns.appendChild(radioN);
                    }

                    tr.appendChild(tdAns);

                    tbody.appendChild(tr);
                });
                SBUxMethod.render();



            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /** 초기화 **/
    const fn_clearForm = function() {
        const tbody = document.getElementById('srvyTbody');
        const trs = tbody.querySelectorAll("tr");
        trs.forEach(tr => {
            const tdInput = tr.querySelector(".td_input");
            if (tdInput) {
                const input = tdInput.querySelector("input");
                const name = input.name;

                if (name) {
                    SBUxMethod.set(name,"");
                }
            }
        });
    }

    /** 조회 **/
    const fn_search = async function() {
        const apcCd = SBUxMethod.get('srch-inp-apcCd');
        if (gfn_isEmpty(apcCd)) {
            gfn_comAlert("W0001","APC"); // W0001 {0}을/를 선택하세요.
            return;
        }

        fn_clearForm();

        //진척도
        await cfn_selectPrgrs();

        const crtrYr = SBUxMethod.get('srch-slt-crtrYr');
        if (!_.isEqual(crtrYr,'2025')) {
            SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
            SBUxMethod.attr("btnTmprStrg",'disabled','true'); // 임시저장버튼 비활성화
        }

        // 조회
        await fn_selectSrvyApcRstlDtl();
    }

    /** 설문조사 조회 **/
    const fn_selectSrvyApcRstlDtl = async function () {
        const crtrYr = SBUxMethod.get('srch-slt-crtrYr');
        const apcCd = SBUxMethod.get('srch-inp-apcCd');
        const srvyNo = SBUxMethod.get('srch-inp-srvyNo');

        if (gfn_isEmpty(crtrYr)) {
            return;
        }

        if (gfn_isEmpty(srvyNo)) {
            return;
        }

        const postJsonPromise = gfn_postJSON("/fm/fclt/selectSrvyApcRsltDtl.do", {
            srvyNo: srvyNo,
            apcCd : apcCd
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus) && !gfn_isEmpty(data.resultList)) {
                const tbody = document.getElementById('srvyTbody');
                const trs = tbody.querySelectorAll("tr");
                trs.forEach((tr,idx) => {
                    const tdInput = tr.querySelector(".td_input");
                    if (tdInput) {
                        const input = tdInput.querySelector("input");
                        const name = input.name;

                        if (name) {
                            const ansCn = data.resultList[idx].ansCn;
                            SBUxMethod.set(name, ansCn);
                        }
                    }
                });

            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /** 임시저장 **/
    const fn_tmprStrg = async function () {
        const apcCd = SBUxMethod.get('srch-inp-apcCd');
        const crtrYr = SBUxMethod.get('srch-slt-crtrYr');

        if (gfn_isEmpty(apcCd)) {
            gfn_comAlert("W0001", "APC"); // W0001 {0}을/를 선택하세요.
            return;
        }

        if (gfn_isEmpty(crtrYr)) {
            gfn_comAlert("W0001", "조사연도"); // W0001 {0}을/를 선택하세요.
            return;
        }

        const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);
        if (!canInsert) {
            return;
        }

        if (!gfn_comConfirm("Q0001", "임시저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        await fn_saveApcSrvy('Y'); // 설문조사 저장
    }

    /** 저장 **/
    const fn_save = async function () {
        const apcCd = SBUxMethod.get('srch-inp-apcCd');
        const crtrYr = SBUxMethod.get('srch-slt-crtrYr');

        if (gfn_isEmpty(apcCd)) {
            gfn_comAlert("W0001", "APC"); // W0001 {0}을/를 선택하세요.
            return;
        }

        if (gfn_isEmpty(crtrYr)) {
            gfn_comAlert("W0001", "조사연도"); // W0001 {0}을/를 선택하세요.
            return;
        }

        const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);
        if (!canInsert) {
            return;
        }

        const tbody = document.getElementById('srvyTbody');
        const tbodyLength = tbody.rows.length;

        for (let i = 0; i < tbodyLength; i++) {

            const qitemNo = i + 1;
            const ansCn = SBUxMethod.get('srvy-qItem' + String(qitemNo));
            const tr = tbody.rows[i];
            const th = tr.querySelector('th');
            const thText = th.innerText;

            if (gfn_isEmpty(ansCn)) {
                gfn_comAlert('W0002', `${'${thText}'}의 답변`); // W0002 {0}을/를 입력하세요.
                return;
            };

            if (qitemNo === 1 && ansCn.length < 4) {
                gfn_comAlert('W0002', `${'${thText}'}의 답변 4자리`); // W0002 {0}을/를 입력하세요.
                return;
            }
        }

        if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        await fn_saveApcSrvy('N');
    }

    /** 설문조사 저장 **/
    const fn_saveApcSrvy = async function (tmpChk) {
        const apcCd = SBUxMethod.get('srch-inp-apcCd');
        const crtrYr = SBUxMethod.get('srch-slt-crtrYr');
        const srvyNo = SBUxMethod.get('srch-inp-srvyNo');

        const saveObj = {
            apcCd: apcCd
            , crtrYr : crtrYr
            , srvyNo: srvyNo
            , srvyApcRsltDtlList: []
            , prgrsYn : 'Y' //진척도 갱신 여부
            , tmprStrgYn : tmpChk //임시저장 여부
        };

        const tbody = document.getElementById('srvyTbody');
        const tbodyLength = tbody.rows.length;

        let ansCnt = 0; // 답변여부 확인용

        for (let i = 0; i < tbodyLength; i++) {
            const qitemNo = i + 1;
            const ansCn = SBUxMethod.get('srvy-qItem' + String(qitemNo));

            if (!gfn_isEmpty(ansCn)) ansCnt++;

            saveObj.srvyApcRsltDtlList.push({
                srvyQitemNo: qitemNo,
                ansCn: ansCn
            });
        }

        let ansYn;
        if (_.isEqual(tmpChk,'Y')) {
            ansYn = 'N'; // 임시저장
        } else if (_.isEqual(tmpChk,'N') && tbodyLength == ansCnt) {
            ansYn = 'Y'; // 모두 답변 완료
        } else {
            ansYn = 'N'; // 일부만 작성
        }

        saveObj.ansYn = ansYn;

        const postJsonPromise = gfn_postJSON("/fm/fclt/saveApcCmsuSrvy.do", saveObj);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                await cfn_allTabPrgrsRefrash();
                await fn_search();
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

    /** 조사연도 변경 **/
    const fn_changeCrtrYr = function (){
        const crtrYr = SBUxMethod.get('srch-slt-crtrYr');

        if (_.isEqual(crtrYr,'2025')) {
            SBUxMethod.set('srch-inp-srvyNo','2025000001');
        } else {
            SBUxMethod.set('srch-inp-srvyNo','');
        }
    }


</script>
</html>