<%
    /**
     * @Class Name : drctPrchsPrst.jsp
     * @Description : 수매현황 화면
     * @author SI개발부
     * @since 2025.03.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.03.31   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 수매현황</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .c_input{
            width: 100%;
            text-align: right;
            border: 0;
        }
        #totalTable th{
            text-align: center;
        }
    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 수매현황 -->
                <div style="margin-left: auto">
                    <sbux-button
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_search"
                            text="조회"
                    ></sbux-button>
                    <sbux-button
                            id="btnDocRawMtrWgh"
                            name="btnDocRawMtrWgh"
                            uitype="normal"
                            class="btn btn-sm btn-primary"
                            onclick="fn_docRawMtrWgh"
                            text="보고서출력"
                    ></sbux-button>
                    <sbux-button
                            id="test"
                            name="test"
                            uitype="normal"
                            class="btn btn-sm btn-primary"
                            onclick="test"
                            text="test"
                    ></sbux-button>
                </div>
            </div>
            <div class="box-body" style="display: flex; flex-direction: column">
                <table class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 18%">
                        <col style="width: 7%">
                        <col style="width: 18%">
                        <col style="width: 7%">
                        <col style="width: 18%">
                        <col style="width: 7%">
                        <col style="width: 18%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg"><span class="data_required" ></span>입차일</th>
                        <td class="td_input">
                            <div style="display: flex; gap: 3px">
                                <sbux-datepicker
                                        id="srch-dtp-wghYmdFrom"
                                        name="srch-dtp-wghYmdFrom"
                                        uitype="popup"
                                        wrap-style="flex:1;"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                        onchange="fn_dtpChange(srch-dtp-wghYmdFrom)"
                                ></sbux-datepicker>
                                <sbux-datepicker
                                        id="srch-dtp-wghYmdTo"
                                        name="srch-dtp-wghYmdTo"
                                        uitype="popup"
                                        wrap-style="flex:1;"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                        onchange="fn_dtpChange(srch-dtp-wghYmdTo)"
                                ></sbux-datepicker>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">생산자</th>
                        <td class="td_input">
                            <div style="display: flex; gap: 3px">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrNm"
                                        name="srch-inp-prdcrNm"
                                        class="form-control input-sm"
                                        wrap-style="flex:2"
                                        placeholder="초성검색 가능"
                                        autocomplete-ref="jsonPrdcrAutocomplete"
                                        autocomplete-text="name"
                                        autocomplete-height="270px"
                                        oninput="fn_onInputPrdcrNm(event)"
                                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                                ></sbux-input>
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrIdentno"
                                        name="srch-inp-prdcrIdentno"
                                        wrap-style="flex:1"
                                        class="form-control input-sm"
                                        maxlength="2"
                                        autocomplete="off"
                                        onkeyup="fn_noKeyup"
                                        onchange="fn_onChangeSrchPrdcrIdentno(this)"
                                ></sbux-input>
                                <sbux-button
                                        id="btn-srch-prdcr"
                                        name="btn-srch-prdcr"
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-prdcr"
                                        onclick="fn_choicePrdcr"
                                ></sbux-button>
                                <sbux-input
                                        id="srch-inp-prdcrCd"
                                        name="srch-inp-prdcrCd"
                                        uitype="hidden">
                                </sbux-input>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">저장고</th>
                        <td class="td_input">
                            <div style="display: flex; width: 80%">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-warehouseSeCd"
                                        name="srch-slt-warehouseSeCd"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonComWarehouseSeCd"
                                ></sbux-select>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">차량번호</th>
                        <td class="td_input">
                            <div style="display: flex">
                                <sbux-input
                                        uitype="text"
                                        id="srch-inp-vhclno"
                                        name="srch-inp-vhclno"
                                        class="form-control input-sm"
                                        wrap-style="flex:2"
                                ></sbux-input>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">품목/품종</th>
                        <td class="td_input">
                            <div style="display: flex; gap: 3px">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm"
                                        wrap-style="flex:1"
                                        jsondata-ref="jsonApcItem"
                                        onchange="fn_onChangeSrchItemCd(this)">
                                </sbux-select>
                                <sbux-select
                                        id="srch-slt-vrtyCd"
                                        name="srch-slt-vrtyCd"
                                        uitype="single"
                                        jsondata-ref="jsonApcVrty"
                                        jsondata-value="itemVrtyCd"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                        onchange="fn_onChangeSrchVrtyCd(this)"
                                ></sbux-select>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">등급</th>
                        <td class="td_input">
                            <div style="display: flex">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-grdCd"
                                        name="srch-slt-grdCd"
                                        class="form-control input-sm"
                                        wrap-style="flex:1"
                                        jsondata-ref="jsonApcGrd"
                                </sbux-select>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">사업구분</th>
                        <td class="td_input">
                            <div style="display: flex">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-wrhsSeCd"
                                        name="srch-slt-wrhsSeCd"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonComWrhsSeCd"
                                        jsondata-text="cdVlNm"
                                        jsondata-value="cdVl"
                                ></sbux-select>
                            </div>
                        </td>
                        <th scope="row" class="th_bg">회계반영</th>
                        <td class="td_input">
                            <div style="display: flex">

                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table id="totalTable" class="table table-bordered tbl_fixed" style="margin-top: 1vh; margin-bottom: 1vh">
                    <colgroup>
                        <col style="width:6.4%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                        <col style="width:5.2%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th rowspan="3" scope="row" class="th_bg">합계</th>
                        <th rowspan="2" scope="row" class="th_bg">입차수</th>
                        <th rowspan="2" scope="row" class="th_bg">운임비</th>
                        <th rowspan="2" scope="row" class="th_bg">총중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">공차중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">실중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">감량(%)</th>
                        <th rowspan="2" scope="row" class="th_bg">감량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">정산중량(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">가구당중량<br/>(kg)</th>
                        <th rowspan="2" scope="row" class="th_bg">비품비율(%)</th>
                        <th rowspan="2" scope="row" class="th_bg">상품수량</th>
                        <th rowspan="2" scope="row" class="th_bg">상품중량(kg)</th>
                        <th colspan="2" scope="row" class="th_bg">입고수량</th>
                        <th colspan="2" scope="row" class="th_bg">출고수량</th>
                        <th colspan="2" scope="row" class="th_bg">재고수량</th>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">가구</th>
                        <th scope="row" class="th_bg">팔레트</th>
                        <th scope="row" class="th_bg">가구</th>
                        <th scope="row" class="th_bg">팔레트</th>
                        <th scope="row" class="th_bg">가구</th>
                        <th scope="row" class="th_bg">팔레트</th>
                    </tr>
                    <tr>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                        <td class="td_input">
                            <input id="" class="c_input" type="number">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div id="sb-area-drctPrchsPrst" style="flex: 1"></div>
            </div>
        </div>
    </section>
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
<script type="text/javascript">
    const lv_ymd_limit = 365;
    /** drctPrchsPrst **/
    var gridDrctPrchsPrst;
    let jsonDrctPrchsPrst = [];
    var jsonApcItem				= [];	// 품목       itemCd          검색
    var jsonApcVrty				= [];   // 품종       vrtyCd          검색
    var jsonApcGrd				= [];   // 등급       grdCd          검색
    var jsonComWarehouseSeCd	= [];	// 창고 		 warehouseSeCd   검색
    var jsonComWrhsSeCd	        = [];	// 입고구분    gdsSeCd         검색

    var jsonPrdcr				= [];   // 생산자      prdcrCd         검색
    var jsonPrdcrAutocomplete 	= [];
    var jsonComFcltCd 			= [];

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
        SBUxMethod.set("srch-dtp-wghYmdFrom", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("srch-dtp-wghYmdTo", gfn_dateToYmd(new Date()));
    });
    const fn_init = async function(){
        /** SbSelect json **/
        await fn_setSbSelect();
        /** SbGrid create **/
        await fn_createDrctPrchsPrst();

        await fn_getPrdcrs();

        let rst = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd',  jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD',  gv_selectedApcCd),	// 창고
            gfn_setApcItemSBSelect('srch-slt-itemCd',       jsonApcItem,            gv_selectedApcCd),						// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd',       jsonApcVrty,            gv_selectedApcCd),			            // 품종
        ]);

        let result = await Promise.all([
            gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
        ]);



        jsonComWrhsSeCd = gfn_getJsonFilter(result[0], 'cdVl', ["2", "3"]);

        SBUxMethod.refresh('srch-slt-wrhsSeCd');
    }

    let test = function(){
        prdcrFunction.init(gv_selectedApcCd,'srch-inp-prdcrNm','srch-inp-prdcrCd','srch-inp-prdcrIdentno','btn-srch-prdcr');
    }

    const fn_setSbSelect = async function(){}

    const fn_createDrctPrchsPrst = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-drctPrchsPrst';
        SBGridProperties.id = 'gridDrctPrchsPrst';
        SBGridProperties.jsonref = 'jsonDrctPrchsPrst';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.fixedrowheight = '25';
        SBGridProperties.columns = [
            {caption : ['checked','checked'], ref : 'academy', width : '30px', fixedstyle:'height:50px;text-alian:center', style : 'text-align:center', type : 'checkbox', typeinfo : {fixedcellcheckbox:{usemode : true, rowindex: 0},checkedvalue : 'T', uncheckedvalue: 'F'}},
            {caption : ['번호','번호'], ref : 'academy', width : '50px',	style : 'text-align:center', type : 'output'},
            {caption : ['회계반영','회계반영'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입차번호','입차번호'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입차일','입차일'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['참여조직','참여조직'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['거래처명','거래처명'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['재배농가','재배농가'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['차량번호','차량번호'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['운임비','운임비'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['총중량(kg)','총중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['공차중량(kg)','공차중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['실중량(kg)','실중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['감량(%)','감량(%)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['감량(kg)','감량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['정산중량(kg)','정산중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['가구당중량(kg)','가구당중량(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['비품비율(%)','비품비율(%)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['비고','비고'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입고수량','가구'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['입고수량','팔레트'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['출고수량','가구'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['출고수량','팔레트'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['상품','상품'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['사업구분','사업구분'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['등급','등급'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['수량','수량'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['중량<br/>(kg)','중량<br/>(kg)'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['계량대','계량대'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['작업자','작업자'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
            {caption : ['비고','비고'], ref : 'academy', width : '100px',	style : 'text-align:center', type : 'output'},
        ]
        gridDrctPrchsPrst = _SBGrid.create(SBGridProperties);
    }


    /**
     * @name fn_search
     * @description 수매현황 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_search = async function () {

        let wghYmdFrom 		= SBUxMethod.get("srch-dtp-wghYmdFrom");	    // 입차시작일자
        let wghYmdTo 		= SBUxMethod.get("srch-dtp-wghYmdTo");		    // 입차종료일자
        let itemCd 			= SBUxMethod.get("srch-slt-itemCd");		    // 품목
        let vrtyCd 			= SBUxMethod.get("srch-slt-itemCd");		    // 품종
        let grdCd 			= SBUxMethod.get("srch-slt-grdCd");		        // 등급
        let prdcrCd 		= SBUxMethod.get("srch-inp-prdcrCd");		    // 생산자
        let warehouseSeCd   = SBUxMethod.get("srch-slt-warehouseSeCd");		// 저장고
        let vhclno          = SBUxMethod.get("srch-inp-vhclno");		    // 차량번호
        let wrhsSeCd        = SBUxMethod.get("srch-slt-wrhsSeCd");		    // 사업구분


        if (wrhsSpmtType == "RT") {
            url = "/am/wgh/selectWghRcptWrhsList.do"
        }
        if (wrhsSpmtType == "DT") {
            url = "/am/wgh/selectWghRcptSpmtList.do"
        }


        const postJsonPromise = gfn_postJSON("/am/wgh/selectWghRcptWrhsList.do", {
              apcCd			: gv_selectedApcCd
            , wghYmdFrom	: wghYmdFrom
            , wghYmdTo	    : wghYmdTo
            , itemCd 		: itemCd
            , vrtyCd 		: vrtyCd
            , grdCd 		: grdCd
            , prdcrCd 		: prdcrCd
            , warehouseSeCd : warehouseSeCd
            , vhclno 		: vhclno
            , wrhsSeCd 		: wrhsSeCd
        });

        try {

            const data = await postJsonPromise;
            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            /** @type {number} **/
            let totalRecordCount = 0;
            jsonWghPrfmnc.length = 0;
            data.resultList.forEach((item, index) => {
                const wghPrfmnc = item;
                const vrtyArray = item.vrtyNm.split(",");
                const set = new Set(vrtyArray);
                const uniqueArr = [...set];
                const vrtyNm = uniqueArr.join(", ");
                wghPrfmnc.vrtyNm = vrtyNm;
                jsonWghPrfmnc.push(wghPrfmnc);
            });

            if (jsonWghPrfmnc.length == 0) {
                grdWghPrfmnc.refresh();
            } else {
                grdWghPrfmnc.rebuild();
            }
            /** 계량 내역 set **/
            SBUxMethod.set("crtr-ymd",wghYmd);
            $("#cnt-wgh").text(data.resultList.length || 0);

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }


    /**
     * @name fn_dtpChange
     * @description 일자 선택 변경 event
     */
    const fn_dtpChange = function(){
        let wghYmdFrom = SBUxMethod.get("srch-dtp-wghYmdFrom");
        let wghYmdTo = SBUxMethod.get("srch-dtp-wghYmdTo");
        let maxYmd = gfn_addDate(wghYmdFrom,lv_ymd_limit);

        SBUxMethod.setDatepickerMaxDate('srch-dtp-wghYmdTo', maxYmd);

        if(gfn_diffDate(wghYmdFrom, wghYmdTo) < 0){
            gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
            let dt = gfn_addDate(wghYmdFrom,30)
            SBUxMethod.set("srch-dtp-wghYmdFrom", wghYmdFrom);
            SBUxMethod.set("srch-dtp-wghYmdTo", dt);
            return;
        }

        if (maxYmd < wghYmdTo) {
            SBUxMethod.set("srch-dtp-wghYmdTo", maxYmd);
        }
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {

        let itemCd = obj.value;
        const itemInfo = _.find(jsonApcItem, {value: itemCd});

        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd',   jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
            gfn_setApcGdsGrdSBSelect('srch-slt-grdCd',  jsonApcGrd,  gv_selectedApcCd, itemCd, '01')    // 등급
        ]);
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        let itemCd = "";
        const vrtyInfo = _.find(jsonApcVrty, {itemVrtyCd: vrtyCd});

        if (!gfn_isEmpty(vrtyCd)) {
            itemCd = vrtyInfo.mastervalue;
        } else {
            itemCd = SBUxMethod.get("srch-slt-itemCd");
        }

        const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
        if (itemCd != prvItemCd) {
            SBUxMethod.set("srch-slt-itemCd", itemCd);
            await fn_onChangeSrchItemCd({value: itemCd});
            SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
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
        fn_clearPrdcr();
        if(getByteLengthOfString(prdcrNm.target.value) > 100){
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrIdentno", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
            document.getElementById('btnSrchPrdcr').click();
        } else{
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

            fn_setPrdcrForm(prdcr);

        }
    }

    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("dtl-inp-prdcrNm"));
    }
    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback
     */
    const fn_setPrdcr = function(prdcr) {
        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
            SBUxMethod.set("srch-slt-vrtyCd", prdcr.itemVrtyCd);
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

            fn_setPrdcrForm(prdcr);
        }
    }

    /**
     * @name fn_onChangeSrchPrdcrIdentno
     * @description 생산자 식별번호 변경 event
     */
    const fn_onChangeSrchPrdcrIdentno = function(obj) {

        if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
            return;
        }

        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrNm", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

        let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

        if (prdcrIdentno < 1) {
            return;
        }

        const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
        if (gfn_isEmpty(prdcrInfo)) {
            return;
        }

        SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
        SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

        fn_setPrdcrForm(prdcrInfo);

    }

    const fn_setPrdcrForm = async function(prdcr) {

        if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
            await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
            /** sn 순서보장 **/
            jsonApcVrty = jsonApcVrty.sort((a, b) => a.sn - b.sn);
            SBUxMethod.refresh('srch-slt-vrtyCd');
            SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);

        } else {
            if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
                const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
                if (prvItemCd != prdcr.rprsItemCd) {
                    SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                    fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
                }
            }
        }

        if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
        } else {
            SBUxMethod.set("srch-inp-prdcrIdentno", "");
        }
    }

</script>
</html>
