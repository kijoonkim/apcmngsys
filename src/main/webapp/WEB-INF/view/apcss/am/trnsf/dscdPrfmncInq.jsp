<%
    /**
     * @Class Name : rtnPrfmncInqGds.jsp
     * @Description : 반품 실적 조회(상품) 화면
     * @author SI개발부
     * @since 2024.12.19
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2024.12.19     손민성       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 반품 실적 조회(상품)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 폐기 실적 조회 -->
                </div>
                <%--/** 상단 버튼 **/--%>
                <div style="margin-left: auto;">
                    <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
                    ></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <table class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 6%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">폐기일자</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                                <div style="display: flex;justify-content: center;align-items: center">
                                    <sbux-datepicker
                                        uitype="popup"
                                        id="srch-dtp-wrhsYmdFrom"
                                        name="srch-dtp-wrhsYmdFrom"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    ></sbux-datepicker>
                                    <div style="width: 2vw;text-align: center">~</div>
                                    <sbux-datepicker
                                        uitype="popup"
                                        id="srch-dtp-wrhsYmdTo"
                                        name="srch-dtp-wrhsYmdTo"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    ></sbux-datepicker>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">품목/품종</th>
                            <td class="td_input" colspan="4" style="border-top: hidden;border-right: hidden">
                                <div style="display: flex; gap: 5px">
                                    <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm input-sm-ast"
                                        jsondata-ref="jsonApcItem"
                                        onchange="fn_onChangeSrchItemCd(this)"
                                    ></sbux-select>
                                    <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-vrtyCd"
                                        name="srch-slt-vrtyCd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        jsondata-ref="jsonApcVrty"
                                        jsondata-value="itemVrtyCd"
                                        onchange="fn_onChangeSrchVrtyCd(this)"
                                    ></sbux-select>
                                </div>
                            </td>
                            <td colspan="4" style="border-top: hidden"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">생산자</th>
                            <td class="td_input" colspan="3" style="border-right: hidden">
                                <div style="display: flex">
                                    <sbux-input
                                        id="srch-inp-prdcrCd"
                                        name="srch-inp-prdcrCd"
                                        uitype="hidden"
                                    ></sbux-input>
                                    <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrNm"
                                        name="srch-inp-prdcrNm"
                                        class="form-control input-sm"
                                        wrap-style="margin-right: 10px"
                                        placeholder="초성검색 가능"
                                        autocomplete-ref="jsonPrdcrAutocomplete"
                                        autocomplete-text="name"
                                        autocomplete-height="270px"
                                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                                        oninput="fn_onInputPrdcrNm(event)"
                                    ></sbux-input>
                                    <sbux-button
                                        id="btnSrchPrdcr"
                                        name="btnSrchPrdcr"
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기"
                                        uitype="modal"
                                        target-id="modal-prdcr"
                                        onclick="fn_choicePrdcr"
                                    ></sbux-button>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">상세구분</th>
                            <td class="td_input" colspan="4" style="border-right: hidden">
                                <sbux-select
                                    unselected-text="선택"
                                    uitype="single"
                                    id="srch-slt-warehouseSeCd"
                                    name="srch-slt-warehouseSeCd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    style="width: 80%"
                                    jsondata-ref="jsonComWarehouse"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">조회구분</th>
                            <td class="td_input" colspan="3">
                                <sbux-select
                                    unselected-text="선택"
                                    uitype="single"
                                    id="srch-slt-inqType"
                                    name="srch-slt-inqType"
                                    style="width: 80%"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    jsondata-ref="jsonComWarehouse"
                                ></sbux-select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="display: flex; flex-direction: column; gap: 10px">
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>폐기 실적 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-rtnCrtr"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
            id="modal-prdcr"
            name="modal-prdcr"
            uitype="middle"
            header-title="생산자 선택"
            body-html-id="body-modal-prdcr"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
        <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="application/javascript">
    /** grid 변수 셋팅 **/
    var jsonRtnCrtr = [];
    var jsonApcItem			= [];	// 품목 		itemCd		    검색
    var jsonApcVrty			= [];	// 품종 		vrtyCd		    검색

    let gridRtnCrtr;

    /** 생산자 관련 변수 **/
    var jsonDataPrdcr = [];
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];
    var autoCompleteDataJson = [];

    window.addEventListener("DOMContentLoaded", function() {
        SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateToYmd(new Date()));

        fn_init();
    });

    const fn_init = async function() {
        let rst = await Promise.all([
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_apcCd),	// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_apcCd)	// 품종
        ])

        await fn_create_rtnCrtr();
    }

    const fn_create_rtnCrtr = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rtnCrtr';
        SBGridProperties.id = 'gridRtnCrtr';
        SBGridProperties.jsonref = 'jsonRtnCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {
                caption: [""],
                ref: 'fcltCd',
                type: 'output',
                width: '5%',
                style: 'text-align: center;'
            },
            {
                caption: ["품목"],
                ref: 'wghYmd',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["품종"],
                ref: 'wghFcltCd',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["생산자"],
                ref: 'wghno',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["상세구분"],
                ref: 'wghno',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["폐기번호"],
                ref: 'vhclno',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["수량"],
                ref: 'vhclno',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["중량"],
                ref: 'vhclno',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["상세코드"],
                ref: 'vhclno',
                type: 'output',
                width: '8%',
                style: 'text-align: center;'
            },
            {
                caption: ["폐기사유"],
                ref: 'vhclno',
                type: 'output',
                width: '31%',
                style: 'text-align: center;'
            }
        ]
        gridRtnCrtr = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        const itemInfo = _.find(jsonApcItem, {
            value: itemCd
        });

        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)
        ]);
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;

        if(gfn_isEmpty(vrtyCd)) {
            return;
        }

        const itemCd = vrtyCd.substring(0,4);
        SBUxMethod.set("srch-slt-itemCd", itemCd);
        await fn_onChangeSrchItemCd({
            value: itemCd
        });
        SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
    }

    /* 생산자 팝업 호출 필수 function  */
    /* Start */
    /**
     * @name fn_getPrdcrs
     * @description 생산자 리스트 호출
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
        console.log(jsonPrdcr);
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 팝업 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 callback
     */
    const fn_setPrdcr = function(prdcr) {
        if(!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");

            fn_setPrdcrForm(prdcr);
        }
    }

    const fn_setPrdcrForm = async function(prdcr) {
        if(!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
            SBUxMethod.set("srch-inp-vrtyNm", prdcr.rprsVrtyNm);
            SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyCd);
            SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
            await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, prdcr.rprsItemCd) // 규격
            if(checkSection == 1) {
                SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');
            } else {
                SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false');
            }
        } else {
            if(!gfn_isEmpty(prdcr.rprsItemCd)) { // 대표품목
                const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
                if(prvItemCd != prdcr.rprsItemCd) {
                    SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                    fn_selectItem();
                }
            }
        }

        if(!gfn_isEmpty(prdcr.wrhsSeCd)) { // 입고구분
            SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.wrhsSeCd);
        }

        if(!gfn_isEmpty(prdcr.gdsSeCd)) { // 상품구분
            SBUxMethod.set("srch-slt-gdsSeCd", prdcr.gdsSeCd);
        }
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function (s, b, i, c) {
        for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
        return b;
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){
        console.log("생산자명: ", prdcrNm);
        fn_clearPrdcr();
        if(getByteLengthOfString(prdcrNm.target.value) > 100) {
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        console.log("jsonPrdcr: ", jsonPrdcr);
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: ''");
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1) {
            document.getElementById('btnSrchPrdcr').click();
        } else {
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: aquamarine"); // skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

            fn_setPrdcrForm(prdcr);
        }
    }
    /* End */
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>