<%
    /**
     * @Class Name : rawMtrWrhsRegMbl.jsp
     * @Description : 생산작업 간편등록화면(신선미세상)
     * @author SI개발부
     * @since 2024.10.30
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.10.30   	손민성	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>생산작업 간편등록(신선미세상)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        .th-mbl {
            text-align: right;
            font-weight: bold;
            font-size: 28px;
        }

        .inpt-mbl {
            height: 50px;
            font-size: 28px;
            line-height: 1.5;
            color: #555;
            width: 100%;
        }

        .btn-mbl {
            height: 50px;
            font-size: 24px;
        }

        #latestInfo > table > thead > tr > th {
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            color: #333;
            font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
            border-spacing: 0;
            border-collapse: collapse;
            box-sizing: border-box;
            border-color: #E8F1F9 !important;
            border-bottom: 1px solid #FFFFFF !important;
            word-wrap: break-word;
            background-color: #E8F1F9;
            text-align: center;
            font-weight: bold;
            font-size: 28px;
            padding: 8px;
            line-height: 1.42857143;
            border: 1px solid #DDD;
            border-top: 1px solid #F4F4F4;
            vertical-align: middle;
        }

        #latestInfoBody > tr > td {
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            color: #333;
            font-weight: 400;
            font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
            border-spacing: 0;
            border-collapse: collapse;
            box-sizing: border-box;
            margin: 0;
            font-size: 28px;
            text-align: center;
            word-wrap: break-word;
            border-color: #e8f1f9 !important;
            padding: 3px !important;
            line-height: 1.42857143;
            border: 1px solid #f4f4f4;
            vertical-align: middle;
            border-right: hidden;
        }
    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별 간편등록(만인산) -->
                </div>
            </div>

            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div style="margin-right: auto;">
                    <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_reset"
                        text="초기화"
                    ></sbux-button>
                    <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_save"
                        text="저장"
                    ></sbux-button>
                    <sbux-button
                        id="btnClose"
                        name="btnClose"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_close"
                        text="종료"
                    ></sbux-button>
                </div>
            </div>

            <div class="box-body">
                <table id="saveTable" class="table table-bordered tbl_fixed tbl_mbl">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>작업일자</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    id="srch-dtp-jobYmd"
                                    name="srch-dtp-jobYmd"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="sbux-pik-group-apc input-sm-ast inpt_data_reqed inpt-mbl"
                                    onchange="fn_dtpChange"
                                    style="width: 100%;"
                                ></sbux-datepicker>
                            </td>
                            <td colspan="5" style="border-left: hidden;">&nbsp;</td>
                        </tr>

                        <tr>
                            <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>지시번호</th>
                            <td colspan="4" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                    id="srch-inp-cmndno"
                                    name="srch-inp-cmndno"
                                    uitype="text"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    autocomplete="off"
                                    onblur="fn_cmndnoBlur"
                                    onclick="fn_cmndnoClick"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-button
                                    id="btn-srch-cmndno"
                                    name="btn-srch-cmndno"
                                    class="btn btn-xs btn-outline-dark btn-mbl"
                                    text="조회"
                                    uitype="normal"
                                    onclick="fn_search"
                                ></sbux-button>
                            </td>
                            <td colspan="3" style="border-left: hidden;">&nbsp;</td>
                        </tr>

                        <tr>
                            <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>작업라인</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    uitype="single"
                                    id="srch-slt-jobLine"
                                    name="srch-slt-jobLine"
                                    unselected-text="선택"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonComJobLine"
                                ></sbux-select>
                            </td>
                            <td class="td_input th-mbl" style="border-right: hidden;">P/T</td>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                    uitype="text"
                                    id="srch-inp-pltno"
                                    name="srch-inp-pltno"
                                    class="inpt-mbl"
                                    autocomplete="off"
                                    onblur="fn_pltnoBlur"
                                    onclick="fn_pltnoClick"
                                ></sbux-input>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div id="latestInfo" style="padding-top: 10px;">
                    <table class="table table-bordered tbl_fixed tbl_mbl">
                        <colgroup>
                            <col style="width: 9%;">
                            <col style="width: 15%;">
                            <col style="width: 20%;">
                            <col style="width: 10%;">
                            <col style="width: 10%;">
                            <col style="width: 10%;">
                            <col style="width: 20%;">
                            <col style="width: 6%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>작업순서</th>
                                <th>거래처</th>
                                <th>상품명</th>
                                <th>원물품종</th>
                                <th>단위</th>
                                <th>지시수량</th>
                                <th>작업수량</th>
                                <th>잔량</th>
                            </tr>
                        </thead>
                        <tbody id="latestInfoBody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</body>
<script type="text/javascript">
    var jsonComJobLine = [];    // 작업라인
    var jsonSave = [];    // 조회 내역

    window.addEventListener('DOMContentLoaded', function(e) {
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });

        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });

        fn_init();
    });

    /**
     * @name fn_init
     * @description 초기 화면 설정
     */
    const fn_init = async function() {
        SBUxMethod.set("srch-dtp-jobYmd", gfn_dateToYmd(new Date()));

        let result = await Promise.all([
            fn_initSBSelect()
        ]);
    }

    /**
     * @name fn_initSBSelect
     * @description 초기 데이터 조회
     */
    const fn_initSBSelect = async function() {
        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-jobLine', jsonComJobLine, 'SORT_FCLT_CD', gv_selectedApcCd)    // 작업라인
        ]);
    }

    /**
     * @name fn_reset
     * @description 초기화 버튼 클릭 시 event
     */
    const fn_reset = function() {
        fn_clearForm();
    }

    /**
     * @name fn_save
     * @description 저장 버튼 클릭 시 event
     */
    const fn_save = async function() {
    }

    /**
     * @name fn_close
     * @description 종료 버튼 클릭 시 event
     */
    const fn_close = function() {
        parent.gfn_tabClose("TAB_AM_003_029");
    }

    /**
     * @name fn_search
     * @description 조회 버튼 클릭 시 event
     */
    const fn_search = async function() {
        let cmndno = SBUxMethod.get("srch-inp-cmndno");

        if(gfn_isEmpty(cmndno)) {
            gfn_comAlert("W0005", "지시번호");    // W0005    {0}이/가 없습니다.
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            sortCmndno: cmndno
        }

        $("#latestInfoBody").empty();
        jsonSave.length = 0;

        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });

        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectSortCmndList.do", param, null, false);
            const data = await postJsonPromise;

            if(data.resultList.length > 0) {
                SBUxMethod.set("srch-slt-jobLine", data.resultList[0].fcltCd);
            }

            data.resultList.forEach(function(item) {
                fn_setSaveTable(item);
            });
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }

            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_dtpChange
     * @description 일자 변경 시 event
     */
    const fn_dtpChange = async function() {

    }

    /**
     * @name fn_cmndnoBlur
     * @description 지시번호 블러 시 event
     */
    const fn_cmndnoBlur = function () {
        let value = SBUxMethod.get("srch-inp-cmndno");

        if(gfn_isEmpty(value)) {
            return;
        }

        if(value.length <= 3) {
            let cmndno = 'SO' + gfn_dateToYmd(new Date());

            // SO202501010001
            if(value < 10) {
                cmndno = cmndno + "000" + value;
            } else if(value < 100) {
                cmndno = cmndno + "00" + value;
            } else if(value < 1000) {
                cmndno = cmndno + "0" + value;
            } else {
                cmndno = cmndno + value;
            }

            SBUxMethod.set('srch-inp-cmndno', cmndno);
        }
    }

    /**
     * @name fn_cmndnoClick
     * @description 지시번호 클릭 시 event
     */
    const fn_cmndnoClick = function () {
        let value = SBUxMethod.get("srch-inp-cmndno");

        if(!gfn_isEmpty(value)) {
            let _date = gfn_dateToYmd(new Date());

            if(_date == value.substr(2, 8)) {
                SBUxMethod.set('srch-inp-cmndno', "")
            }
        }
    }

    /**
     * @name fn_pltnoBlur
     * @description 팔레트번호 블러 시 event
     */
    const fn_pltnoBlur = function () {
        let value = SBUxMethod.get("srch-inp-pltno");

        if(gfn_isEmpty(value)) {
            return;
        }

        if(value.length <= 3) {
            let pltno = 'RT' + gfn_dateToYmd(new Date());

            // RT202501010001
            if(value < 10) {
                pltno = pltno + "000" + value;
            } else if(value < 100) {
                pltno = pltno + "00" + value;
            } else if(value < 1000) {
                pltno = pltno + "0" + value;
            } else {
                pltno = pltno + value;
            }

            SBUxMethod.set('srch-inp-pltno', pltno);
        }
    }

    /**
     * @name fn_pltnoClick
     * @description 팔레트번호 클릭 시 event
     */
    const fn_pltnoClick = function () {
        let value = SBUxMethod.get("srch-inp-pltno");

        if(!gfn_isEmpty(value)) {
            let _date = gfn_dateToYmd(new Date());

            if(_date == value.substr(2, 8)) {
                SBUxMethod.set('srch-inp-pltno', "")
            }
        }
    }

    /**
     * @name fn_clearForm
     * @description form 초기화
     */
    const fn_clearForm = function() {
        SBUxMethod.set("srch-dtp-jobYmd", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-inp-cmndno", '');
        SBUxMethod.refresh("srch-slt-jobLine");
        SBUxMethod.set("srch-inp-pltno", '');

        $("#latestInfoBody").empty();
        jsonSave.length = 0;

        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });

        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });
    }

    /**
     * @name fn_setSaveTable
     * @description jsonSave를 테이블에 append
     */
    const fn_setSaveTable = async function(item) {
        if(item.sortCmndno) {
            addRow(item);

            return;
        }

        function addRow(item) {
            let jobQntt = gfn_isEmpty(item.prfmncQntt) ? 0 : item.prfmncQntt;
            const cmndQntt = item.cmndQntt;
            let rmndrQntt = cmndQntt - jobQntt;

            let el = `
                <tr onclick="selectLatestInfo(this)">
                    <td>${'${item.sortCmndSn}'}</td>
                    <td>${'${gfn_isEmpty(item.lgszMrktNm) ? "" : item.lgszMrktNm}'}</td>
                    <td style="text-align: left;">${'${gfn_isEmpty(item.mrktGdsNm) ? "" : item.mrktGdsNm}'}</td>
                    <td>${'${gfn_isEmpty(item.vrtyNm) ? "" : item.vrtyNm}'}</td>
                    <td>${'${gfn_isEmpty(item.bxKndNm) ? "" : item.bxKndNm}'}</td>
                    <td id="cmndQntt">${'${cmndQntt}'}</td>
                    <td style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                        <input type="button" value="-" onclick="fn_minus(this, event)" id="btnMinus" class="btn-primary btn btn-mbl" style="width: 50px; visibility: ${'${jobQntt === 0 ? "hidden" : "visible"}'};">
                        <span id="jobQntt">${'${jobQntt}'}</span>
                        <input type="button" value="+" onclick="fn_plus(this, event)" id="btnPlus" class="btn-primary btn btn-mbl" style="width: 50px; visibility: ${'${jobQntt === cmndQntt ? "hidden" : "visible"}'};">
                    </td>
                    <td id="rmndrQntt">${'${rmndrQntt === 0 ? "완료" : rmndrQntt}'}</td>
                    <td id="sortCmndno" style="display: none;">${'${item.sortCmndno}'}</td>
                </tr>
            `;

            $("#latestInfoBody").append(el);
            jsonSave.push(item);
        }
    }

    /**
     * @name selectLatestInfo
     * @description 하위 테이블 클릭시 상단으로 셋팅
     */
    const selectLatestInfo = async function(element) {
        let idx = $(element).index();
        let jsonData = jsonSave[idx];

        SBUxMethod.set("srch-dtp-jobYmd", jsonData.sortCmndYmd);
        SBUxMethod.set("srch-slt-jobLine", jsonData.fcltCd);
        SBUxMethod.set("srch-inp-pltno", jsonData.pltno);
    }

    /**
     * @name fn_minus
     * @description 하위 테이블 작업수량 [-] 버튼 클릭 시 event
     */
    const fn_minus = async function(_el, event) {
        event.stopPropagation();

        const row = $(_el).closest('tr');
        updateQntt(row, -1);
    }

    /**
     * @name fn_plus
     * @description 하위 테이블 작업수량 [+] 버튼 클릭 시 event
     */
    const fn_plus = async function(_el, event) {
        event.stopPropagation();

        const row = $(_el).closest('tr');
        updateQntt(row, 1);
    }

    /**
     * @name updateQntt
     * @description 수량 계산
     */
    function updateQntt(row, change) {
        const $row = $(row);
        const $cmndQntt = $row.find('#cmndQntt');
        const $jobQntt = $row.find('#jobQntt');
        const $rmndrQntt = $row.find('#rmndrQntt');
        const $btnMinus = $row.find('#btnMinus');
        const $btnPlus = $row.find('#btnPlus');
        const $sortCmndno = $row.find('#sortCmndno');

        let count = parseInt($jobQntt.text());
        const maxQntt = parseInt($cmndQntt.text());

        let newQntt = count + change;
        newQntt = Math.max(0, Math.min(maxQntt, newQntt));

        if(newQntt !== count) {
            const rmndrQntt = maxQntt - newQntt;

            $jobQntt.text(newQntt);

            $rmndrQntt.text(rmndrQntt === 0 ? '완료' : rmndrQntt);

            if(newQntt === 0) {
                $btnMinus.css('visibility', 'hidden');
            } else {
                $btnMinus.css('visibility', 'visible');
            }

            if(newQntt === maxQntt) {
                $btnPlus.css('visibility', 'hidden');
            } else {
                $btnPlus.css('visibility', 'visible');
            }
        }

        if(sortCmndno) {
            const sltSortCmndVO = jsonSave.find(item => item.sortCmndno == $sortCmndno.text());

            if(sltSortCmndVO) {
                sltSortCmndVO.prfmncQntt = newQntt;
                sltSortCmndVO.prfmncWght = newQntt * (sltSortCmndVO.cmndWght / sltSortCmndVO.cmndQntt);
            }
        }
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
