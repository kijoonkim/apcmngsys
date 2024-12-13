<%
    /**
     * @Class Name : regRawMtrWghWrhs.jsp
     * @Description : 원물계량 입고등록 화면
     * @author SI개발부
     * @since 2024.10.29
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.10.29   	손민성			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 원물계량등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        .th_bg{
            font-size: 25px;
            text-align: left;
        }
        .td_add{
            text-align: center;
            font-weight: bold;
            font-size: 20px;
        }
        .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd .sbux-tabs-content{
            padding: 16px 0px !important;
        }
        #tab_spmtPrfmncReg, #tab_spmtPrfmnc{
            border: 0 !important;
        }
        .btn{
            padding: 2px 20px !important;
        }
        #searchTable th{
            text-align: center;
            font-weight: bold;
        }
        #searchTable  tr:hover{
            background-color : #FFF8DC;
            cursor: pointer;
        }
        #searchTable  tr.active  td{
            color:white;
            background-color :rgb(35,83,119);
        }
        .inpt-mbl {
        //padding: 8px;
            height: 50px;
            font-size: 28px;
            line-height: 1.5;
            color: #555;
            width: 100%;
        }
        select.form-control{
            font-size: 25px !important;
            background-size: 55px 60px !important;
        }
        li.sbux-ui-menu-item{
            font-size: x-large;
        }
    </style>
</head>
<body>
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="padding: 5px 15px 0px;display:flex; gap :10px;flex-direction: column; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 -->
                    <sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
                    </sbux-label>
                </div>

            </div>
            <div class="box-body" style="padding: 0px 15px 15px !important;">
                <div style="margin-right: auto;position: absolute;left: 33vw;z-index: 9997;">
                    <sbux-button disabled id="" name="btnCmndDocspmt" style="padding: 7px 15px !important;" uitype="normal" class="btn btn-lg btn-primary" onclick="fn_docRawMtrWrhs" text="확인서 발행" ></sbux-button>
                    <sbux-button id="btnReset" name="btnReset" uitype="normal" style="padding: 7px 15px !important;" class="btn btn-lg btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
                    <sbux-button id="btnSave" name="btnSave" uitype="normal" style="padding: 7px 15px !important;" class="btn btn-lg btn-outline-danger" onclick="fn_save" text="저장" ></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" style="padding: 7px 15px !important;" class="btn btn-lg btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
                </div>
                <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                           title-target-id-array="tab_spmtPrfmncReg^tab_spmtPrfmnc"
                           title-text-array="입고등록^입고내역" onclick="fn_changeTab()"
                           title-style-array="{margin-right: 5px;width: 10vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 10vw;
                 text-align: center;font-weight: bold;border-radius:0}">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="tab_spmtPrfmncReg" style="height: 500px">
                        <table id="regTable" class="table table-bordered tbl_fixed" style="width: 100%">
                            <colgroup>
                                <col style="width: 20%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 20%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">
                                    입고일자
                                </th>
                                <td class="td_input" colspan="5">
                                    <sbux-datepicker uitype="popup" id="reg-dtp-wghYmd" name="reg-dtp-wghYmd" class="form-control pull-right inpt_data_reqed inpt-mbl"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">품목</th>
                                <td class="td_input" colspan="2">
                                    <div>
                                        <sbux-select
                                                unselected-text="전체"
                                                uitype="single"
                                                id="reg-slt-itemCd"
                                                name="reg-slt-itemCd"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                style="width: 80%"
                                                onchange="fn_onChangeSrchItemCd(reg-slt-itemCd)"
                                                jsondata-ref="jsonApcItem">
                                        </sbux-select>
                                    </div>
                                </td>
                                <th scope="row" class="th_bg">품종</th>
                                <td class="td_input" colspan="2">
                                    <div>
                                        <sbux-select
	                                        unselected-text="전체"
	                                        uitype="single"
	                                        id="reg-slt-vrtyCd"
	                                        name="reg-slt-vrtyCd"
	                                        class="form-control inpt_data_reqed inpt-mbl"
                                            style="width: 80%"
	                                        onchange="fn_onChangeSrchVrtyCd(this)"
	                                        jsondata-ref="jsonApcVrty"
	                                        jsondata-value="itemVrtyCd"
                                        ></sbux-select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">농가</th>
                                <td class="td_input" colspan="5">
                                    <div style="display: flex; gap: 5px">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-prdcrIdentno"
                                                name="reg-inp-prdcrIdentno"
                                                class="form-control inpt-mbl"
                                                style="background-color:rgb(255, 248, 220); text-align: center"
                                                wrap-style="flex-basis:10%;"
                                                maxlength="2"
                                                autocomplete="off"
                                                onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-prdcrNm"
                                                name="reg-inp-prdcrNm"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                placeholder="초성검색 가능"
                                                wrap-style="flex-basis:50%"
                                                autocomplete-ref="jsonPrdcrAutocomplete"
                                                autocomplete-text="name"
                                                autocomplete-height="270px"
                                                oninput="fn_onInputPrdcrNm(event)"
                                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="hidden"
                                                id="reg-inp-prdcrCd"
                                                name="reg-inp-prdcrCd"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                disabled
                                        ></sbux-input>
                                        <sbux-button
                                                id="reg-btn-prdcrCd"
                                                name="reg-btn-prdcrCd"
                                                class="btn btn-outline-dark"
                                                style="padding: 0px 40px; font-size: 20px;"
                                                text="찾기" uitype="modal"
                                                target-id="modal-prdcr"
                                                onclick="fn_choicePrdcr"
                                        ></sbux-button>
                                        <sbux-input
                                                uitype="text"
                                                id="wghno"
                                                name="wghno"
                                                style="display: none"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="text"
                                                id="itemCd"
                                                name="itemCd"
                                                style="display: none"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="text"
                                                id="wrhsYmd"
                                                name="wrhsYmd"
                                                style="display: none"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="text"
                                                id="prdcrCd"
                                                name="prdcrCd"
                                                style="display: none"
                                        ></sbux-input>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">산지</th>
                                <td class="td_input" colspan="5" >
                                    <div style="display: flex;gap: 5px">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-plorNm"
                                                name="reg-inp-plorNm"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                wrap-style="flex-basis:40%;"
                                                autocomplete="off"
                                                onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                        ></sbux-input>
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-plorCd"
                                                name="reg-inp-plorCd"
                                                style="display: none"
                                        ></sbux-input>
                                        <sbux-button
                                                id="btn-plorCd"
                                                name="btn-plorCd"
                                                class="btn btn-outline-dark"
                                                style="padding: 0px 40px; font-size: 20px;"
                                                text="찾기" uitype="normal"
                                                onclick="fn_grdComCd"
                                        ></sbux-button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">차량번호</th>
                                <td class="td_input" colspan="5">
                                    <div style="display: flex">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-vhclno"
                                                name="reg-inp-vhclno"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                autocomplete="off"
                                                onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                        ></sbux-input>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">총중량(Kg)</th>
                                <td class="td_input" colspan="5">
                                    <div style="display: flex">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-wholWght"
                                                name="reg-inp-wholWght"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                autocomplete="off"
                                                onchange="fn_calcInput()"
                                        ></sbux-input>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">공차중량(Kg)</th>
                                <td class="td_input" colspan="5">
                                    <div style="display: flex">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-emptVhclWght"
                                            name="reg-inp-emptVhclWght"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                            onchange="fn_calcInput()"
                                    ></sbux-input>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">실중량(Kg)</th>
                                <td class="td_input" colspan="5">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-wrhsWght"
                                                name="reg-inp-wrhsWght"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                style="background-color: yellow !important; border-radius: 0"
                                                tooltip="실중량 = 총중량 - 공차중량 - (콘티수 * 콘티중량) - (파렛트수 * 파렛트중량)"
                                                autocomplete="off"
                                                readonly
                                        ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" >콘티수(개)</th>
                                <td class="td_input" colspan="2">
                                        <sbux-input
                                                uitype="text"
                                                id="reg-inp-bxQntt"
                                                name="reg-inp-bxQntt"
                                                style="width: 85%"
                                                class="form-control inpt_data_reqed inpt-mbl"
                                                autocomplete="off"
                                                onchange="fn_calcInput()"
                                        ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">콘티 중량(Kg)</th>
                                <td class="td_input" colspan="2">
                                    <sbux-input
                                            uitype="text"
                                            id="boxWght"
                                            name="boxWght"
                                            style="width: 85%"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">상품등급</th>
                                <th scope="row" class="th_bg" style="text-align: center">정품</th>
                                <td class="td_input">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-grdQntt1"
                                            name="reg-inp-grdQntt1"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg" style="text-align: center;">비품</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-grdQntt2"
                                            name="reg-inp-grdQntt2"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">파렛트수(개)</th>
                                <td class="td_input" colspan="2">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-pltQntt"
                                            name="reg-inp-pltQntt"
                                            style="width: 85%"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                            onchange="fn_calcInput()"
                                    ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">파렛트 중량(Kg)</th>
                                <td class="td_input" colspan="2">
                                    <sbux-input
                                            uitype="text"
                                            id="pltWght"
                                            name="pltWght"
                                            style="width: 85%"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                            init="20kg"
                                            disabled
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">실중량(Kg)/콘티</th>
                                <td class="td_input" colspan="5">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-avgWght"
                                            name="reg-inp-avgWght"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            style="background-color: yellow !important; border-radius: 0"
                                            autocomplete="off"
                                            readonly
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">비고</th>
                                <td class="td_input" colspan="5">
                                    <sbux-input
                                            uitype="text"
                                            id="reg-inp-rmrk"
                                            name="reg-inp-rmrk"
                                            class="form-control inpt_data_reqed inpt-mbl"
                                            autocomplete="off"
                                    ></sbux-input>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="tab_spmtPrfmnc" >
                        <div style="height: 600px">
                        <table class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 100%">
                            <colgroup>
                                <col style="width: 30%">
                                <col style="width: 70%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">
                                    입고일자
                                </th>
                                <td class="td_input">
                                    <sbux-datepicker
                                            uitype="popup"
                                            id="srch-dtp-wghYmd"
                                            name="srch-dtp-wghYmd"
                                            class="form-control pull-right inpt_data_reqed inpt-mbl"
                                    ></sbux-datepicker>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="searchTable"class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 100%">
                            <colgroup>
                                <col style="width: 17.5%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 17.5%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">입고일자</th>
                                <th scope="row" class="th_bg">품목</th>
                                <th scope="row" class="th_bg">농가</th>
                                <th scope="row" class="th_bg">차량번호</th>
                                <th scope="row" class="th_bg">총중량</th>
                                <th scope="row" class="th_bg">상세</th>
                            </tr>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 산지 선택 Modal -->
    <div>
        <sbux-modal id="modal-comCd" name="modal-comCd" uitype="middle" header-title="공통코드조회" body-html-id="body-modal-comCd" footer-is-close-button="false" header-is-close-button="false" style="width:900px"></sbux-modal>
    </div>
    <div id="body-modal-comCd">
        <jsp:include page="../../am/popup/comCdPopup.jsp"></jsp:include>
    </div>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
        <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
    var jsonApcItem			= [];	// 품목 		itemCd		검색
    var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
    var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
    var jsonComWarehouse	= [];	// 창고 		warehouse	검색
    var jsonApcBx			= [];	// 팔레트/박스 	검색
    var jsonSpcfctCd        = [];   // 규격
    var jsonJobClsf         = [];   // 검수자

    var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
    var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
    var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

    /* 생산자 자동완성 */
    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

    /* SBGrid */
    var grdRawMtrWrhs;
    /* SBGrid Data (JSON) */
    var jsonRawMtrWrhs = [];

    /*최근조회 데이터List*/
    var RawMtrWrhsLatestInfoList = [];
    var PrdcrLatestInfo = [];
    var rawMtrWrhs = [];

    /** save Json **/
    var jsonSave = [];

    /** 입고내역에 전달할 조회 json **/
    var jsonSearchData = [];


    window.addEventListener('DOMContentLoaded', function(e) {
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });

        fn_init();
        // stdGrdSelect.init();
    });
    const fn_init = async function() {
        SBUxMethod.set("srch-dtp-wghYmd", gfn_dateToYmd(new Date()));
        SBUxMethod.set("reg-dtp-wghYmd", gfn_dateToYmd(new Date()));
        await gfn_setApcItemSBSelect('reg-slt-itemCd',jsonApcItem, gv_selectedApcCd);		// 품목
        await gfn_setApcVrtySBSelect('reg-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);			// 품종
        await fn_getPrdcrs();
    }
    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
    }
    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function(prdcr) {
        SBUxMethod.set("reg-inp-wrhsno", "");
        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("reg-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("reg-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.set("reg-inp-prdcrIdentno", prdcr.prdcrIdentno);
            SBUxMethod.set("reg-inp-plorNm",prdcr.plorNm);
            SBUxMethod.set("reg-inp-plorCd",prdcr.plorCd);
            SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
        }
    }
    const fn_onChangeSrchItemCd = async function (obj) {
        let result = await Promise.all([
            gfn_setApcVrtySBSelect('reg-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, obj),			// 품종
            gfn_getStdGrdDtls(gv_selectedApcCd, "01", obj)
        ]);
        jsonApcGrd = result[1];
    }

    /**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		const prvItemCd = SBUxMethod.get("reg-slt-itemCd");
		if (!gfn_isEmpty(vrtyCd)) {
			SBUxMethod.set("reg-slt-itemCd", itemCd);
			SBUxMethod.set("reg-slt-vrtyCd", vrtyCd);

			let result = await Promise.all([
	            gfn_getStdGrdDtls(gv_selectedApcCd, "01", itemCd)
	        ]);
	        jsonApcGrd = result[0];
		}
	}
    const fn_onChangeSrchPrdcrIdentno = function(obj) {

        if (gfn_isEmpty(SBUxMethod.get("reg-inp-prdcrIdentno"))) {
            return;
        }

        SBUxMethod.set("reg-inp-prdcrCd", "");
        SBUxMethod.set("reg-inp-prdcrNm", "");
        SBUxMethod.attr("reg-inp-prdcrNm", "style", "");	//skyblue

        let prdcrIdentno = parseInt(SBUxMethod.get("reg-inp-prdcrIdentno")) || 0;

        if (prdcrIdentno < 1) {
            return;
        }

        const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
        if (gfn_isEmpty(prdcrInfo)) {
            return;
        }

        SBUxMethod.set("reg-inp-prdcrCd", prdcrInfo.prdcrCd);
        SBUxMethod.set("reg-inp-prdcrNm", prdcrInfo.prdcrNm);
        SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
    }

    /**
     * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm) {
        fn_clearPrdcr();
        if (getByteLengthOfString(prdcrNm.target.value) > 100) {
            SBUxMethod.set("reg-inp-prdcrNm", "");
            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('reg-inp-prdcrNm', true);
    }
    const fn_clearPrdcr = function() {
        SBUxMethod.set("reg-inp-prdcrCd", "");
        SBUxMethod.set("reg-inp-prdcrIdentno", "");
        SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:''");
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
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
            document.getElementById('reg-btn-prdcrCd').click();
        } else{
            SBUxMethod.set("reg-inp-prdcrCd", value);
            SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            SBUxMethod.set("reg-inp-prdcrIdentno",prdcr.prdcrIdentno);
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
        }
    }


    /**
     * @name fn_docRawMtrWrhs
     * @description 확인서 발행
     */
    const fn_docRawMtrWrhs = async function() {
        let wghno = SBUxMethod.get("wghno");
        let itemCd = SBUxMethod.get("itemCd");
        let wrhsYmd = SBUxMethod.get("wrhsYmd");
        let prdcrCd = SBUxMethod.get("prdcrCd");
        if (gfn_isEmpty(wghno)) {
            gfn_comAlert("W0001","발행대상");
            return;
        }

		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'RT_DOC');

 		gfn_popClipReport("원물입고일지", rptUrl, {apcCd: gv_selectedApcCd,wghno : wghno, itemCd:itemCd, wrhsYmd : wrhsYmd, prdcrCd : prdcrCd});

    }
    /**
     * @name fn_calcInput
     * @description 모든 수치 데이터 일괄 처리
     */
    const fn_calcInput = function() {
        /** 총중량 **/
        let wholWght = SBUxMethod.get("reg-inp-wholWght") || 0;

        /** 공차중량 **/
        let emptVhclWght = SBUxMethod.get("reg-inp-emptVhclWght") || 0;

        /** 콘티수 **/
        let bxQntt = SBUxMethod.get("reg-inp-bxQntt") || 0;

        /** 콘티중량 **/
        let boxWght = SBUxMethod.get("boxWght") || 0;

        /** 파렛트수 **/
        let pltQntt = SBUxMethod.get("reg-inp-pltQntt") || 0;

        /** 퍄렛트 중량 **/
        let pltWght = SBUxMethod.get("pltWght") || 0;

        /** 실중량 계산 **/
        let total = (parseFloat(wholWght) - parseFloat(emptVhclWght) - (parseFloat(pltQntt) * parseFloat(pltWght)) - (parseFloat(bxQntt) * parseFloat(boxWght))).toFixed(2);
        SBUxMethod.set("reg-inp-wrhsWght",String(total));

        if(total < 0){
            gfn_comAlert("W0023","실중량","0");
        }

        if (!gfn_isEmpty(bxQntt) && !gfn_isEmpty(total) && bxQntt > 0 && total > 0) {
        	let avg = (total / parseFloat(bxQntt)).toFixed(2);
        	SBUxMethod.set("reg-inp-avgWght",String(avg));
        }

    }
    const fn_save = async function() {
        let elements = Array.from(document.querySelectorAll("[id^='reg-']"));
        saveList = [];
        let tableData = gfn_getTableElement("regTable","reg-",["grdQntt2","rmrk"]);

        if (!tableData) {
        	return;
        }

        let vrtyCd = tableData.vrtyCd;

        if (!gfn_isEmpty(vrtyCd)) {
        	tableData.vrtyCd = vrtyCd.substr(4,8);
        }

        let obj = {...tableData};
        if (tableData.grdQntt2 && tableData.grdQntt2 > 0){
            /** 비품 존재 > row add **/
            /** 등급 설정 **/
            jsonApcGrd.forEach (function(item){
                obj.grdCd = item.grdCd;
                /** 공통정보 주입 **/
                obj.apcCd = gv_selectedApcCd;
                obj.rowSts = 'I';
                obj.groupId = 1;
                obj.delYn = 'N';
                obj.wrhsSpmtType = "RT";
                obj.grdCd1 = '';
                obj.grdCd2 = '';
                if(item.grdCd === '01'){
                    obj.bxQntt = obj.grdQntt1;
                    obj.dtlWrhsWght = (parseFloat(obj.grdQntt1) * parseFloat(obj.avgWght)).toFixed(2);
                }else{
                    obj.bxQntt = obj.grdQntt2;
                    obj.dtlWrhsWght = (parseFloat(obj.grdQntt2) * parseFloat(obj.avgWght)).toFixed(2);
                }
                saveList.push({...obj});
            });
        } else {
            obj.grdCd = "01"
            obj.apcCd = gv_selectedApcCd;
            obj.rowSts = 'I';
            obj.groupId = 1;
            obj.delYn = 'N';
            obj.wrhsSpmtType = "RT";
            obj.grdCd1 = '';
            obj.grdCd2 = '';
            obj.bxQntt = obj.grdQntt1;
            obj.dtlWrhsWght = (parseFloat(obj.grdQntt1) * parseFloat(obj.avgWght)).toFixed(2);
            saveList.push({...obj});
        }

        console.log("saveList", saveList)

        if (gfn_comConfirm("Q0001", "저장")) {
            const postJsonPromise = gfn_postJSON("/am/wgh/multiWghPrfmncList.do", saveList);
            const data = await postJsonPromise;
            if(data.resultStatus === 'S'){
                gfn_comAlert("I0001");
                SBUxMethod.attr("btnSave","disabled","true");
            }
        }
    }
    const fn_reset = async function() {
        SBUxMethod.attr("btnSave","disabled","false");
        SBUxMethod.attr("btnCmndDocspmt","disabled","true");
        let elements = Array.from(document.querySelectorAll("[id^='reg-']"));
        elements.forEach(function(item) {
           SBUxMethod.set(item.id,'');
        });
        SBUxMethod.set("boxWght",'');
        SBUxMethod.set("pltWght",'');
        await SBUxMethod.set("reg-dtp-wghYmd", gfn_dateToYmd(new Date()));
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });

        $("#searchTable > tbody tr").slice(1).remove();
    }
    const fn_search = async function() {
        jsonSearchData.length = 0;

        let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");
        const postJsonPromise = gfn_postJSON("/am/wgh/selectMultiWghPrfmncList.do", {apcCd:gv_selectedApcCd,wghYmd:wghYmd});
        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            data.resultList.forEach(function(item,idx){
                 let camel = Object.keys(item).reduce((acc,key) => {
                    acc[gfn_snakeToCamel(key)] = item[key];
                    return acc;
                },{});
                 jsonSearchData.push(camel);
            });
            SBUxMethod.selectTab('tab_norm', 'tab_spmtPrfmnc');
            fn_setSearchTable();
        }
    }
    const fn_setSearchTable = function() {
        $("#searchTable > tbody tr").slice(1).remove();
        jsonSearchData.forEach(function(item,idx){
          let el = `
        <tr>
            <td class="td_add">${'${item.wrhsYmd}'}</td>
            <td class="td_add">${'${item.itemNm}'}</td>
            <td class="td_add">${'${item.prdcrNm}'}</td>
            <td class="td_add">${'${item.vhclno}'}</td>
            <td class="td_add">${'${item.wholWght}'}</td>
            <td><button class="btn btn-lg btn-primary" style="min-width:100% !important" onclick="fn_searchDetail(this)">조회</button></td>
        </tr>
        `;
        $("#searchTable > tbody").append(el);
        });

    }
    const fn_searchDetail = async function(_el) {
        let idx = $(_el).closest("tr").index()-1;
        let selectJson = jsonSearchData[idx];

        /** 저장했던 값 다시 입력 **/
        SBUxMethod.set("reg-slt-itemCd",selectJson.itemCd);
        SBUxMethod.set("reg-slt-vrtyCd",selectJson.itemCd + selectJson.vrtyCd);
        SBUxMethod.set("reg-inp-prdcrCd",selectJson.prdcrCd);
        SBUxMethod.set("reg-inp-prdcrNm",selectJson.prdcrNm);
        SBUxMethod.set("reg-inp-prdcrIdentno",selectJson.prdcrIdentno);
        SBUxMethod.set("reg-inp-plorNm",selectJson.plorNm);
        SBUxMethod.set("reg-inp-plorCd",selectJson.plorCd);
        SBUxMethod.set("reg-inp-vhclno",selectJson.vhclno);
        SBUxMethod.set("reg-inp-wholWght",selectJson.wholWght);
        SBUxMethod.set("reg-inp-emptVhclWght",selectJson.emptVhclWght);
        SBUxMethod.set("reg-inp-wrhsWght",selectJson.wrhsWght);
        SBUxMethod.set("reg-inp-pltQntt",selectJson.pltQntt);
        SBUxMethod.set("reg-inp-rmrk",selectJson.rmrk);

        SBUxMethod.set("wghno",selectJson.wghno);
        SBUxMethod.set("itemCd",selectJson.itemCd);
        SBUxMethod.set("prdcrCd",selectJson.prdcrCd);
        SBUxMethod.set("wrhsYmd",selectJson.wrhsYmd);

        /** 비품이 있을경우 대비 **/
        let qntt = selectJson.bxQntt.split(',');
        SBUxMethod.set("reg-inp-grdQntt1",qntt[0]);
        SBUxMethod.set("reg-inp-grdQntt2",qntt[1]);
        SBUxMethod.set("reg-inp-bxQntt",(parseInt(qntt[0]) + (parseInt(qntt[1])|| 0)));

        let wrhsWght = selectJson.wrhsWght;
        let bxQntt =  SBUxMethod.get("reg-inp-bxQntt");

        let ctWght = (parseFloat(selectJson.wholWght) - parseFloat(selectJson.emptVhclWght) - (parseFloat(selectJson.pltQntt) * 20) - parseFloat(selectJson.wrhsWght)) / (parseFloat(qntt[0]) + parseFloat(qntt[1]));

        SBUxMethod.set("boxWght", ctWght.toFixed(1));

        SBUxMethod.set("reg-inp-avgWght", (parseFloat(wrhsWght) / parseFloat(bxQntt)).toFixed(2));
        /** 콘티중량 역연산 해야할듯? **/
        SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");
        SBUxMethod.attr("btnCmndDocspmt", "disabled", "false");

        SBUxMethod.selectTab('tab_norm', 'tab_spmtPrfmncReg');
    }

    /**
     * @name fn_modalComCd
     * @description 산지코드선택팝업 호출
     */
    const fn_grdComCd = function() {
        let plorCd = SBUxMethod.get("reg-inp-plorNm");
        let cdVlNm = '산지명';
        let cdVl = 'STD_PLOR_CD';

        SBUxMethod.openModal('modal-comCd');
        popComCd.init(gv_selectedApcCd, gv_selectedApcNm, plorCd,cdVl,cdVlNm, fn_setComNm);
    }

    /**
     * @name fn_setFlnm
     * @description 산지코드선택 callback
     */
    const fn_setComNm = function(comNm) {
        SBUxMethod.set("reg-inp-plorNm",comNm.comNm);
        SBUxMethod.set("reg-inp-plorCd",comNm.comCd);
    }




</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
