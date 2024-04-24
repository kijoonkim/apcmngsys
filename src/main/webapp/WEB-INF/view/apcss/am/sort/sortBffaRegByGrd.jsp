<%
    /**
     * @Class Name : sortBffaRegByGrd.jsp
     * @Description : 참외 육안선별 화면
     * @author SI개발부
     * @since 2024.04.22
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.04.22    손민성			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <head>
        <title>title : 참외 육안선별 목록</title>
        <%@ include file="../../../frame/inc/headerMeta.jsp" %>
        <%@ include file="../../../frame/inc/headerScript.jsp" %>
        <%@ include file="../../../frame/inc/clipreport.jsp" %>
    </head>
</head>
<body>
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 참외 육안선별 목록 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnDocSort"
                        name="btnDocSort"
                        uitype="normal"
                        text="초기화"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btnLblSort"
                        name="btnLblSort"
                        uitype="normal"
                        text="저장"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_lblSort"
                ></sbux-button>
                <sbux-button
                        id="btnDelete"
                        name="btnDelete"
                        uitype="normal"
                        text="삭제"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_delete"
                ></sbux-button>
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        text="조회"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_search"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
                    <td class="td_input" style="border-right: hidden;border-top: hidden">
                        <sbux-datepicker
                                id="srch-dtp-inptYmdFrom"
                                name="srch-dtp-inptYmdFrom"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
                                onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
                        ></sbux-datepicker>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="srch-dtp-inptYmdTo"
                                name="srch-dtp-inptYmdTo"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
                                onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
                        ></sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>선별기</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select
                                id="srch-slt-fcltCd"
                                name="srch-slt-fcltCd"
                                uitype="single"
                                class="form-control input-sm"
                                unselected-text="전체"
                                jsondata-ref="jsonComFcltCd"
                        ></sbux-select>
                    </td>
                    <td colspan="6" style="border-top: hidden"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required"></span>생산자</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrNm"
                                name="srch-inp-prdcrNm"
                                class="form-control input-sm"
                                placeholder="초성검색 가능"
                                autocomplete-ref="jsonPrdcrAutocomplete"
                                autocomplete-text="name"
                                oninput="fn_onInputPrdcrNm(event)"
                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-button
                                id="btn-srch-prdcr"
                                name="btn-srch-prdcr"
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-prdcr"
                                onclick="fn_choicePrdcr"
                        ></sbux-button>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>품목</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select
                                id="srch-slt-itemCd"
                                name="srch-slt-itemCd"
                                uitype="single"
                                class="form-control input-sm"
                                unselected-text="전체"
                                jsondata-ref="jsonApcItem"
                                onchange="fn_selectBffaGrdType"
                        ></sbux-select>
                    </td>
                    <td colspan="6"></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div style="display: flex;flex-direction: row-reverse;padding: 0px 15px; align-items: center">
            <sbux-button
                    id="btn-reg-bffa"
                    name="btn-reg-bffa"
                    class="btn btn-sm btn-success"
                    text="신규등록" uitype="modal"
                    onclick="fn_reg_bffa"
            ></sbux-button>
        </div>
        <div id="sb-area-grdSortBffa" style="height: 60vh; padding: 10px 15px"></div>
    </div>
</section>
<div>
    <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
<div>
    <sbux-modal id="modal-regSort" name="modal-regSort" uitype="middle" header-title="참외 육안선별 등록" body-html-id="body-modal-regSort" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-regSort">
    <jsp:include page="../../am/popup/regSortBffa.jsp"></jsp:include>
</div>
</body>
<script>

    /** select 변수 **/
    var jsonComFcltCd = [];
    var jsonApcItem = [];

    /** GRID **/
    var grdSortBffa;

    /** 육안선별 코드 변수 **/
    var BffaGrdType = [];

    window.addEventListener('DOMContentLoaded',function () {
        fn_init();
    });

    const fn_init = async function(){
        let now = new Date();

        let firstYmd = gfn_dateToYm(now);
        let lastYmd = gfn_dateToYmd(now);

        SBUxMethod.set("srch-dtp-inptYmdFrom", firstYmd);
        SBUxMethod.set("srch-dtp-inptYmdTo", lastYmd);

        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-fcltCd', jsonComFcltCd,'SORT_FCLT_CD', gv_selectedApcCd),// 선별기
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd)// 품목
        ]);
        await fn_createGrid();
        await fn_setGrid();
        if(jsonApcItem.length == 1){
            SBUxMethod.set('srch-slt-itemCd',jsonApcItem[0].cmnsCd);
            await fn_selectBffaGrdType();
        }

    }
    /** 모달관련 함수 **/
    /** 생산자 선택 팝업함수 **/
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    const fn_setResearch = function(){
        fn_search();
    }

    /** 육안선별 등록 팝업함수 **/
    const fn_reg_bffa = function(){
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0005", "품목");
            return
        }
        popBffa.init(gv_apcCd,gv_selectedApcNm,itemCd,BffaGrdType,fn_search);
        SBUxMethod.openModal('modal-regSort');
    }

    const fn_setPrdcr = function(prdcr) {
        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
        }
    }

    const fn_createGrid = function(){
        let SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortBffa';
        SBGridProperties.id = 'grdSortBffa';
        SBGridProperties.jsonref = 'jsonSortBffa';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["선택","선택"],ref : 'wrhsno',	width : '50px',	style : 'text-align:center',	type : 'checkbox', typeinfo : {checkedvalue : 'T', uncheckedvalue : 'F'}},
            {caption: ["선별일자","선별일자"],ref: 'wrhsYmd',type:'output', width:'90px',  style:'text-align:center'},
            {caption: ["생산자","생산자"],ref: 'prdcrNm',type:'output', width:'90px',  style:'text-align:center'},
            {caption: ["선별기","선별기"],ref: 'fcltNm',type:'output', width:'65px',  style:'text-align:center'},
            {caption: ["박스수량","박스수량"],ref: 'wrhsQntt',type:'output', width:'90px',  style:'text-align:center'},
            {caption: ["총 입고중량","총 입고중량"],ref: 'wholWght',type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["육안선별 중량","합계"],ref: 'icptWght',type:'output', width:'120px',  style:'text-align:center'},
            {caption: ["실 입고중량","실 입고중량"],ref: 'wrhsWght',type:'input', width:'120px',  style:'text-align:center'},
            {caption: ["비고","비고"],ref: 'rmrk',type:'input', width:'100%',  style:'text-align:center'},

            {hidden : true, ref: 'apcCd'},
            {hidden : true, ref: 'bffaWrhsno'},
        ]
        if(!gfn_isEmpty(BffaGrdType)){
            let addBffaGrdType = [];
            BffaGrdType.forEach(function(item){
                addBffaGrdType.push(
                    {caption: ["육안선별 중량",item.cdVlNm],ref: 'grdType' + [...item.cdVl].pop() + 'Wght',type:'output', width:'120px',  style:'text-align:center'},
                );
            });
            let originColumns = SBGridProperties.columns;
                originColumns.splice(6,0,...addBffaGrdType);
            SBGridProperties.columns = originColumns;
        }
        grdSortBffa = _SBGrid.create(SBGridProperties);
        grdSortBffa.rebuild();
    }
    /** 품목 선택시 육안선별 종류 SELECT **/
    const fn_selectBffaGrdType = async function(){
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        if(!gfn_isEmpty(itemCd)){
            try{
               let postJsonPromise = gfn_postJSON('/am/cmns/apcBffaType',{
                    apcCd:gv_apcCd,
                    itemCd:itemCd
                });
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {
                    BffaGrdType = data.resultList;
                }
                await fn_createGrid();
            }catch (e){
                console.log(e);
            }
        }
    }
    const fn_setGrid = async function() {

    }
    /** 육안선별 목록 조회 **/
    const fn_search = async function(){
        jsonSortBffa.length = 0;

        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        let postJsonPromise = gfn_postJSON("/am/sort/selectSortBffa.do",
            {
                apcCd : gv_apcCd,
                inptYmdFrom : inptYmdFrom,
                inptYmdTo : inptYmdTo,
                prdcrCd : prdcrCd,
                fcltCd : fcltCd,
                itemCd : itemCd
            });
            const data  = await postJsonPromise;

            try{
                if(_.isEqual("S",data.resultStatus)){
                    data.resultList.forEach(function(item){
                        let bffaObj =
                            {
                                apcCd     : item.apcCd,
                                bffaWrhsno: item.bffaWrhsno,
                                wrhsYmd   : item.wrhsYmd,
                                prdcrNm   : item.prdcrNm,
                                fcltNm    : item.fcltNm,
                                wrhsQntt  : item.wrhsQntt,
                                wholWght  : item.wholWght,
                                icptWght  : item.icptWght,
                                grdType1Wght : item.grdType1Wght,
                                grdType2Wght : item.grdType2Wght,
                                grdType3Wght : item.grdType3Wght,
                                wrhsWght  : item.wrhsWght,
                                rmrk      : item.rmrk
                            }
                        jsonSortBffa.push(bffaObj);
                    });
                    grdSortBffa.rebuild();
                }
            }catch (e){

            }
    }
    /** 초기화 버튼 **/
    const fn_reset = function(){
        SBUxMethod.set('srch-inp-prdcrNm',"");//생산자명
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:initial");//생산자명배경
        SBUxMethod.set('srch-reg-prdcrCd',""); //생산자코드
        SBUxMethod.set('srch-slt-fcltCd',"");//선별기코드
        SBUxMethod.set('srch-slt-itemCd',"");//품목코드
    }
    /** 삭제 버튼 **/
    const fn_delete = async function(){
        let arr = grdSortBffa.getCheckedRowData(0);
        let delList = arr.map(item => item.data);

        if(!gfn_comConfirm('Q0001',"삭제")){
            return;
        };

        if(!gfn_isEmpty(delList)){
            try{
                let postJsonPromise = gfn_postJSON('/am/sort/deleteSortBffa.do',delList);
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0002",data.deletedCnt +"건","삭제");
                    fn_search();
                }
            }catch (e){
                console.log(e);
            }
        }
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
