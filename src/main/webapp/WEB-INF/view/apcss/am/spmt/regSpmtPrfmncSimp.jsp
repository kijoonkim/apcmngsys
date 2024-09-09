<%
    /**
     * @Class Name : regSpmtPrfmncMbl.jsp
     * @Description : 출하실적등록 모바일 화면
     * @author SI개발부
     * @since 2024.4.18
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.4.18   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하실적 간편등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        .th-mbl {
            text-align: right;
            font-weight: bold;
            font-size: 28px;
        }
        .inpt-mbl{
            height: 50px;
            font-size: 28px;
            line-height: 1.5;
            color: #555;
            width: 100%;
        }
        input[type="radio"]{
            display: none;
        }
        .grdLable{
            border: 1px solid black;
            flex-basis: 10%;
            font-size: 28px;
            text-align: center;
            height: 50px;
            line-height: 1.7;
            cursor: pointer;
        }
        .hidden-radio:checked + .grdLable{
            background: #fcc000;
        }
        .radio-label{
            font-weight: bold;
        }
        .btn_cnt{
            width: 50px;
            border-radius: 0;
            height: 100%;
            border: 0;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            background: #8faadc;
        }
        #inpt-table tbody td {
            font-size: 23px;
            text-align: center;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section style="overflow: hidden">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
            <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적 간편등록  -->
        </div>
        <div style="margin-left: auto;padding-top: 0px;display: flex;justify-content: flex-start;" class="box-header">
            <div style="margin-right: auto;">
                <sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal"   text="송품장목록" class="btn btn-primary btn-mbl" onclick="fn_selectSpmtList"></sbux-button>
                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-mbl btn-outline-danger" onclick="fn_reset"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-mbl btn-outline-danger" onclick="fn_save"></sbux-button>
                <sbux-button id="btnClose" name="btnClose" uitype="normal" text="송품장발행" class="btn btn-primary btn-mbl" onclick="fn_docSpmt()"></sbux-button>
                <%--                <sbux-button id="fullScreen" name="fullScreen" uitype="normal" text="전체화면" class="btn btn-sm btn-primary btn-mbl" onclick="fn_fullScreen"></sbux-button>--%>
                <div style="float:right;margin-left:10px;">
                    <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                        <input style="width:20px;height:20px;" type="checkbox" id="srch-chk-autoPrint" name="srch-chk-autoPrint" checked>
                        <label for="srch-chk-autoPrint"style="font-size: 3vh">자동출력</label>
                        <input style="width:20px;height:20px;" type="checkbox" id="srch-chk-exePrint" name="srch-chk-exePrint" >
                        <label for="srch-chk-exePrint"style="font-size: 3vh">미리보기</label>
                    </p>
                </div>
            </div>
        </div>
        <div class="box-body">
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 80%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg th-mbl">
                            <span class="data_required"></span>출고일자
                        </th>
                        <td class="td_input" style="border: 1px solid black">
                            <div style="display: flex;">
                                <sbux-datepicker id="dtl-dtp-spmtYmd" name="dtl-dtp-spmtYmd"
                                                 uitype="popup" date-format="yyyy-mm-dd"
                                                 class="pull-right sbux-pik-group-apc inpt-mbl inpt_data_reqed input-sm-ast"
                                                 onchange="fn_dtpChange(dtl-dtp-spmtYmd)"
                                                 wrap-style="flex-basis:30%">
                                </sbux-datepicker>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg th-mbl">
                            <span class="data_required"></span>거래처
                        </th>
                        <td class="td_input">
                            <div style="display:flex; gap: 5px">
                                <sbux-select
                                        id="srch-slt-cnptCd"
                                        name="srch-slt-cnptCd"
                                        uitype="single"
                                        jsondata-ref="jsonComCnpt"
                                        unselected-text="선택"
                                        class="input-sm-ast inpt_data_reqed inpt-mbl"
                                        onchange="fn_onChangeSrchItemCd(this)"
                                        wrap-style="flex-basis:40%"
                                ></sbux-select>
                                <p class="ad_input_row chk-mbl" style="vertical-align:middle;line-height: 1.6">
                                    <input
                                            style="width:20px;height:20px;"
                                            type="checkbox"
                                            id="srch-chk-cnptCd"
                                            name="srch-chk-cnptCd"
                                            checked
                                    />
                                    <label for="srch-chk-cnptCd" style="font-size: 25px">고정</label>
                                </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg th-mbl">
                            <span class="data_required"></span>품목/품종
                        </th>
                        <td  class="td_input">
                            <div style="display:flex; gap: 5px">
                                    <sbux-select
                                            id="srch-slt-itemCd"
                                            name="srch-slt-itemCd"
                                            uitype="single"
                                            jsondata-ref="jsonComItem"
                                            unselected-text="전체"
                                            class="input-sm-ast inpt_data_reqed inpt-mbl"
                                            onchange="fn_onChangeSrchItemCd(this)"
                                            wrap-style="flex-basis:40%"
                                    ></sbux-select>
                                    <sbux-select
                                            id="srch-slt-vrtyCd"
                                            name="srch-slt-vrtyCd"
                                            uitype="single"
                                            jsondata-ref="jsonComVrty"
                                            jsondata-value="vrtyCd"
                                            unselected-text="선택"
                                            class="input-sm-ast inpt_data_reqed inpt-mbl"
                                            wrap-style="flex-basis:40%"
                                    ></sbux-select>
                                    <p class="ad_input_row chk-mbl" style="vertical-align:middle;line-height: 1.6">
                                        <input
                                                style="width:20px;height:20px;"
                                                type="checkbox"
                                                id="srch-chk-fxngItem"
                                                name="srch-chk-fxngItem"
                                                checked
                                        />
                                        <label for="srch-chk-fxngItem" style="font-size: 25px">고정</label>
                                    </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg th-mbl">
                            <span class="data_required"></span>규격
                        </th>
                        <td class="td_input">
                            <div style="display:flex">
                                <sbux-select
                                        id="srch-slt-spcfctCd"
                                        name="srch-slt-spcfctCd"
                                        uitype="single"
                                        jsondata-ref="jsonComSpcfctCd"
                                        unselected-text="전체"
                                        class="input-sm-ast inpt_data_reqed inpt-mbl"
                                        jsondata-text="spcfctNm"
                                        jsondata-value="spcfctCd"
                                        wrap-style="flex-basis:40%"
                                ></sbux-select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg th-mbl">
                            <span class="data_required"></span>등급
                        </th>
                        <td class="td_input" style="border: 1px solid black">
                            <div style="display:flex; align-items: center; gap: 10px">
                                <input id="grd1" type="radio" name="grd" class="hidden-radio" grdCd="01"/>
                                <label class="grdLable" for="grd1">
                                    <span class="radio-label">특상</span>
                                </label>
                                <input id="grd2" type="radio" name="grd" class="hidden-radio" grdCd="02"/>
                                <label class="grdLable" for="grd2">
                                    <span class="radio-label">특</span>
                                </label>
                                <input id="grd3" type="radio" name="grd" class="hidden-radio" grdCd="03"/>
                                <label class="grdLable" for="grd3">
                                    <span class="radio-label">보통</span>
                                </label>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg th-mbl">
                            <span class="data_required"></span>수량
                        </th>
                        <td style="border: 1px solid black" class="td_input">
                            <div id="cntWrap" style="display: flex; gap: 10px;">
                                <div id="btn_wrap" style="display: flex; gap:10px">
                                    <button class="btn_cnt" value="1" onclick="fn_addCnt(this.value)">1</button>
                                    <button class="btn_cnt" value="5" onclick="fn_addCnt(this.value)">5</button>
                                    <button class="btn_cnt" value="10" onclick="fn_addCnt(this.value)">10</button>
                                    <button class="btn_cnt" value="50" onclick="fn_addCnt(this.value)">50</button>
                                </div>
                                <div style="flex-basis: 10%">
                                    <sbux-input id="btn_total" name="btn_total" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" style="height:50px; font-size: 28px; text-align:center;background-color: #FFF8DC;"></sbux-input>
                                </div>
                                <div><sbux-button id="cntReset" name="cntReset" uitype="normal" text="초기화" class="btn btn-mbl btn-outline-danger" style="font-size: 23px;"onclick="fn_cntReset"></sbux-button></div>
                                <div><sbux-button id="cntInpt" name="cntInpt" uitype="normal" text="확인" class="btn btn-primary btn-mbl" style="font-size: 23px;"onclick="fn_cntInpt"></sbux-button></div>
                                <div><p class="ad_input_row chk-mbl" style="vertical-align:middle;line-height: 1.6">
                                    <input
                                            style="width:20px;height:20px;"
                                            type="checkbox"
                                            id="srch-chk-totalCnt"
                                            name="srch-chk-totalCnt"
                                    />
                                    <label for="srch-chk-totalCnt" style="font-size: 25px">고정</label>
                                </p></div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table id="inpt-table" class="table table-bordered tbl_fixed" style="margin-top: 15px">
                <colgroup>
                    <col style="width: 5%">
                    <col style="width: 20%">
                    <col style="width: 25%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <thead>
                    <td class="th_bg th-mbl" style="text-align: center">처리</td>
                    <td class="th_bg th-mbl" style="text-align: center">품목</td>
                    <td class="th_bg th-mbl" style="text-align: center">품종</td>
                    <td class="th_bg th-mbl" style="text-align: center">규격</td>
                    <td class="th_bg th-mbl" style="text-align: center">특상</td>
                    <td class="th_bg th-mbl" style="text-align: center">특</td>
                    <td class="th_bg th-mbl" style="text-align: center">상</td>
                    <td class="th_bg th-mbl" style="text-align: center">계</td>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    var inptJson = [];

    /** sbSelect **/
    var jsonComItem = [];
    var jsonComVrty = [];
    var jsonComCnpt = [];
    var jsonComSpcfctCd = [];


    window.addEventListener('DOMContentLoaded', function(e) {
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
            //sbux-pik-icon
        });
        fn_initSBSelect();
        SBUxMethod.set("dtl-dtp-spmtYmd",gfn_dateToYmd(new Date()));
    });

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfn_setApcItemSBSelect('srch-slt-itemCd',jsonComItem,gv_selectedApcCd),		// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd',jsonComVrty,gv_selectedApcCd),		// 품종
            gfn_setCpntRgnSBSelect('srch-slt-cnptCd',jsonComCnpt,gv_selectedApcCd)      // 거래처
            ]);
    }

    const fn_addCnt = function(_cnt){
        let prvCnt = SBUxMethod.get('btn_total') || 0;
        prvCnt += parseInt(_cnt);
        SBUxMethod.set('btn_total',prvCnt);
    }
    const fn_cntReset = function(){
        SBUxMethod.set('btn_total',"");
    }
    const fn_onChangeSrchItemCd = async function(_el){
        let itemCd = SBUxMethod.get(_el.id);
        jsonComSpcfctCd = await gfn_getApcSpcfcts(gv_selectedApcCd,itemCd);
        SBUxMethod.refresh("srch-slt-spcfctCd");

    }
    /** 수량 입력 **/
    const fn_cntInpt = async function(){
        /** validation **/
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let itemNm = SBUxMethod.getText("srch-slt-itemCd");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
        let vrtyNm = SBUxMethod.getText("srch-slt-vrtyCd");
        let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
        let spcfctNm = SBUxMethod.getText("srch-slt-spcfctCd");
        let grd = $('input[name="grd"]:checked').attr("grdCd");
        let cnt = SBUxMethod.get('btn_total');
        let spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");

        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0005","품종");
            return;
        }
        if(gfn_isEmpty(vrtyCd)){
            gfn_comAlert("W0005","품목");
            return;
        }
        if(gfn_isEmpty(spcfctCd)){
            gfn_comAlert("W0005","규격");
            return;
        }
        if(gfn_isEmpty(grd)){
            gfn_comAlert("W0005","등급");
            return;
        }
        if(gfn_isEmpty(cnt)){
            gfn_comAlert("W0005","수량");
            return;
        }

        /** json에 담고 **/
        let foundEl = inptJson.find(el => {
            return el.itemCd === itemCd && el.vrtyCd === vrtyCd && el.spcfctCd === spcfctCd;
        });
        if(foundEl){
            if(foundEl.hasOwnProperty(grd)){
                foundEl[grd] += parseInt(cnt);
            }else{
                foundEl[grd] = parseInt(cnt);
            }
        }else{
            inptJson.push({
                apcCd : gv_selectedApcCd,
                itemCd : itemCd,
                itemNm : itemNm,
                vrtyCd : vrtyCd,
                vrtyNm : vrtyNm,
                spcfctCd : spcfctCd,
                spcfctNm : spcfctNm,
                [grd] : parseInt(cnt),
                spmtYmd : spmtYmd
            });
        }
        console.log(inptJson,'inptJson');
        await fn_getTableRow();

        if(!document.querySelector("#srch-chk-totalCnt").checked){
            fn_cntReset();
        }
    }

    const fn_getTableRow = function(){
        $("#inpt-table tbody").empty();
        inptJson.forEach(function(item,idx){
            $("#inpt-table tbody").append(`
            <tr>
                <td><button data-idx="${'${idx}'}" class="btn btn-mbl btn-primary sbux-btn sbux-comp-root sbux-exist sbux-uuid-cntInpt">삭제</button></td>
                <td>${'${item.itemNm}'}</td>
                <td>${'${item.vrtyNm}'}</td>
                <td>${'${item.spcfctNm}'}</td>
                <td>${'${item["01"] || 0}'}</td>
                <td>${'${item["02"] || 0}'}</td>
                <td>${'${item["03"] || 0}'}</td>
                <td>${'${(item["01"] || 0) + (item["02"] || 0) + (item["03"] || 0)}'}</td>
            </tr>
            `);
        });

        const actionElements = document.querySelectorAll('[data-idx]');
        actionElements.forEach(el => {
           $(el).on("click",fn_removeRow.bind(this));
        });
    }

    const fn_removeRow = function(_el){
        let idx = $(_el.target).data('idx');
        inptJson.splice(idx, 1);
        fn_getTableRow();
    }

    const fn_save = async function(){
        console.log(inptJson);
        if(inptJson.length <= 0){
            gfn_comAlert("W0005","등록 대상");
            return;
        }
        try{
            let postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncList.do",inptJson);
            let data = await postJsonPromise;
            console.log(data);

        }catch (e){
            console.error(e);
        }
    }



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
