<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title : 생산자 선택</title>
    <style>
        .table>tbody>tr>th{
            padding: 8px;
            line-height: 1.42857143;
            border-top: 1px solid #ddd;
        }
        .table>tbody>tr>th>td{
            line-height: 1.42857143;
            border-top: 1px solid #ddd;
        }
        #bfaa_reg_table > thead > tr >td,
        #bfaa_reg_table > tbody > tr:nth-child(1) > td:nth-child(1),
        #bfaa_reg_table > tbody > tr:nth-child(4) > td:nth-child(1),
        #bfaa_reg_table > tbody > tr:nth-child(5) > td:nth-child(1){
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            color: #333;
            font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
            border-spacing: 0;
            border-collapse: collapse;
            box-sizing: border-box;
            margin: 0;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
            border-color: #e8f1f9 !important;
            border-bottom: 1px solid #ffffff !important;
            word-wrap: break-word;
            border: 1px solid #f4f4f4;
            background-color: #e8f1f9;
            vertical-align: middle;
            padding: 8px;
            line-height: 1.42857143;
            border-top: 1px solid #ddd;
        }


    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <p>
                    <span style="font-weight:bold;">참외 육안선별 내역을 등록합니다.</span>
                </p>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnResetBffa" name="btnResetBffa" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="popBffa.reset"></sbux-button>
                <sbux-button id="btnSaveBffa" name="btnSaveBffa" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popBffa.save"></sbux-button>
                <sbux-button id="btnCloseBffa" name="btnCloseBffa" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popBffa.close"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <sbux-input id="srch-reg-prdcrCd" name="srch-reg-prdcrCd" uitype="hidden"></sbux-input>
            <table id="search_table" class="table table-bordered tbl_row tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                    <col style="width: 25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">APC명</th>
                    <td class="td_input" style="border-right: hidden;border-top: hidden">
                        <sbux-input id="prdcr-inp-apcNm" name="prdcr-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
                    <td class="td_input" style="border-right: hidden;border-top: hidden">
                        <sbux-datepicker
                                id="srch-dtp-inptYmd"
                                name="srch-dtp-inptYmd"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
                                onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
                        ></sbux-datepicker>
                    </td>
                </tr>
                <tr>
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
                    <th scope="row" class="th_bg">품목</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex;">
                            <sbux-select
                                    id="srch-reg-itemCd"
                                    name="srch-reg-itemCd"
                                    uitype="single"
                                    class="form-control input-sm"
                                    wrap-style="flex:1;margin-right:5px"
                                    unselected-text="전체"
                                    jsondata-ref="jsonRegApcItem"
                            ></sbux-select>
                            <sbux-select
                                    id="srch-reg-vrtyCd"
                                    name="srch-reg-vrtyCd"
                                    uitype="single"
                                    class="form-control input-sm"
                                    wrap-style="flex:1"
                                    unselected-text="전체"
                                    jsondata-ref="jsonRegApcVrty"
                                    onchange="fn_selectBffaType(this)"
                            ></sbux-select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required"></span>생산자</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex">
                        <sbux-input
                                uitype="text"
                                id="srch-reg-prdcrNm"
                                name="srch-reg-prdcrNm"
                                class="form-control input-sm"
                                wrap-style="flex:2 0 40%;margin-right:5px"
                                placeholder="초성검색 가능"
                                autocomplete-ref="jsonPrdcrAutocomplete"
                                autocomplete-text="name"
                                oninput="fn_onInputPrdcrNm(event)"
                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                        ></sbux-input>
                        <sbux-button
                                id="btn-reg-srch-prdcr"
                                name="btn-reg-srch-prdcr"
                                class="btn btn-xs btn-outline-dark"
                                wrap-style="flex:1 0 10%;"
                                text="찾기" uitype="modal"
                                target-id="modal-prdcr"
                                onclick="fn_choiceRegPrdcr"
                        ></sbux-button>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">박스 수량</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex">
                            <sbux-input
                                    uitype="text"
                                    id="srch-reg-wrhsQntt"
                                    name="srch-reg-wrhsQntt"
                                    class="form-control input-sm"
                                    wrap-style="flex:1"
                            ></sbux-input>
                            <span style="flex: 1;font-weight: bold;padding: 5px;text-align: left">EA</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">입고총중량</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex">
                        <sbux-input
                                uitype="text"
                                id="srch-reg-wholWght"
                                name="srch-reg-wholWght"
                                class="form-control input-sm"
                                wrap-style="flex:1"
                                oninput="fn_onInputWholWght(event)"
                        ></sbux-input>
                        <span style="flex: 1;font-weight: bold;padding: 5px;text-align: left">KG</span>
                        </div>
                    </td>
                    <th scope="row" class="th_bg" id="icptWght">열과,혼합+폐기+기타 중량</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex">
                            <sbux-input
                                    uitype="text"
                                    id="srch-reg-icptWght"
                                    name="srch-reg-icptWght"
                                    class="form-control input-sm"
                                    wrap-style="flex:1"
                                    readonly
                            ></sbux-input>
                            <span style="flex: 1;font-weight: bold;padding: 5px">KG</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">박스 수량</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-wrhsQntt"
                                    name="srch-inp-wrhsQntt"
                                    class="form-control input-sm"
                                    wrap-style="flex:1"
                            ></sbux-input>
                            <span style="flex: 1;font-weight: bold;padding: 5px">EA</span>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">입고 중량</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-wrhsWght"
                                    name="srch-inp-wrhsWght"
                                    class="form-control input-sm"
                                    wrap-style="flex:1"
                            ></sbux-input>
                            <span style="flex: 1;font-weight: bold;padding: 5px">KG</span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <table id="bfaa_reg_table" class="table table-bordered tbl_row tbl_fixed" style="margin-top: 10px;border: 1px solid black">
                <colgroup>
                    <col style="width:10%">
                    <col style="width:90%">
                </colgroup>
                <thead>
                    <tr>
                        <td>선별 항목</td>
                        <td>선별내역</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    /** select JSON**/
    var jsonRegApcItem = [];
    var jsonRegApcVrty = [];

    /** 육안선별 판단 종류(checkbox) 변수 **/
    var jsonChkGrdTypeList = [];
    var jsonChkGrdType =
        {
            cdVlNm : "",
            indctSeq :
                {
                    key : "",
                    value :
                        {
                            grdKnd : []
                        }
                }
        };
    /** CHK JSON **/
    var jsonCheckBox = [];
    var globalVal = [];

    /** 동적 SB 요소 템플릿 **/
    var sbTemplate = function(_id,_text,_flag){
        if(_flag){
            return `<tr>
                        <th scope="row" class="th_bg">`+ _text +` 중량</th>
                        <td class="td_input" style="border-right: hidden;">
                            <div style="display: flex">
                                <sbux-input
                                        uitype="text"
                                        id="`+ _id +`"
                                        name="`+ _id + `"
                                        class="form-control input-sm"
                                        wrap-style="flex:1"
                                        onchange="fn_changeWght(event)"
                                ></sbux-input>
                                <span style="flex: 1;font-weight: bold;padding: 5px">KG</span>
                            </div>
                        </td>
                    </tr>`
        }else{
            return `<th scope="row" class="th_bg">` + _text + ` 중량</th>
                        <td class="td_input" style="border-right: hidden;">
                            <div style="display: flex">
                                <sbux-input
                                        uitype="text"
                                        id="`+ _id +`"
                                        name="`+ _id + `"
                                        class="form-control input-sm"
                                        wrap-style="flex:1"
                                        onchange="fn_changeWght(event)"
                                ></sbux-input>
                                <span style="flex: 1;font-weight: bold;padding: 5px">KG</span>
                            </div>
                        </td>`
        }

    };



    const popBffa = {
        prgrmId : 'regSortBffa',
        modalId : 'modal-regSort',
        callbackFnc : function(){},
        init: async function(_apcCd, _apcNm, _itemCd, _jsonChkGrdType, _callbackFnc){
            /** 전체 초기화 **/
            await popBffa.reset();

            let result = await Promise.all([
                gfn_setApcItemSBSelect('srch-reg-itemCd',jsonRegApcItem,_apcCd),// 품목
                gfn_setApcVrtySBSelect('srch-reg-vrtyCd',jsonRegApcVrty,_apcCd),// 품종
                popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm,fn_setRegPrdcr, SBUxMethod.get("srch-reg-inp-prdcrNm")),
            ]);
            SBUxMethod.set("prdcr-inp-apcNm",_apcNm);
            SBUxMethod.set("srch-reg-itemCd",_itemCd);
            SBUxMethod.attr("srch-reg-itemCd",'readonly',true);
            SBUxMethod.set('srch-dtp-inptYmd',gfn_dateToYmd(new Date()));
            jsonChkGrdTypeList.length = 0;
            /** 품목에대한 품종 셋팅 **/
            fn_onChangeSrchItemCd(_itemCd);

            /** 품목에대한 육안선별 타입 셋팅 **/
            await fn_selectBffaType(_itemCd);

            let icptWghtNm = "";
            let max = _jsonChkGrdType.length;
            /** sb 동적 추가 전 삭제 **/
            $('#search_table tbody tr:nth-child(n+5)').empty();

            if(!gfn_isEmpty(_jsonChkGrdType)){
            _jsonChkGrdType.forEach(function(item,idx){

                /** 선별목록명 **/
                icptWghtNm += item.cdVlNm
                if(idx != (max-1)){
                    icptWghtNm += "+";
                }else{
                    icptWghtNm += " 중량";
                }

                /** 조건 SB 생성 **/
                let id = 'grdType' + [...item.cdVl].pop() + 'Wght'
                let text = item.cdVlNm;

                if(idx % 2 == 0 || idx == 0){
                    $("#search_table > tbody").append(sbTemplate(id,text,true));
                }else{
                    $("#search_table > tbody > tr:last-child").append(sbTemplate(id,text,false));
                }
            });
            }else{
                icptWghtNm = "부적합 중량";
            }
            $("#icptWght").text(icptWghtNm);
            SBUxMethod.render();

            /** 선별내역 항목 테이블 생성 **/
            fn_setBffaTable();

        },
        close: function(){
            if(editMode){
                //TODO: 컨펌
            }
            SBUxMethod.closeModal(this.modalId);

            gfn_closeModal(this.modalId, this.callbackFnc, _prdcr); //모달 닫을때 콜백에 인자전하는거 3번쨰인자
        },
        save : async function(){
            let prdcrCd = SBUxMethod.get('srch-reg-prdcrCd'); //생산자코드
            let prdcrNm = SBUxMethod.get('srch-reg-prdcrNm'); //생산자명
            let wrhsYmd = SBUxMethod.get('srch-dtp-inptYmd'); //날짜
            let fcltCd = SBUxMethod.get('srch-slt-fcltCd'); //선별기코드
            let fcltNm = SBUxMethod.getText('srch-slt-fcltCd'); //선별기코드
            let itemCd = SBUxMethod.get('srch-reg-itemCd'); //품목코드
            let wrhsQntt = SBUxMethod.get('srch-reg-wrhsQntt'); //박스수량
            let wholWght = SBUxMethod.get('srch-reg-wholWght'); //총중량
            let grdType1Wght = SBUxMethod.get('grdType1Wght'); //1번 type 중량
            let grdType2Wght = SBUxMethod.get('grdType2Wght'); //2번 type 중량
            let grdType3Wght = SBUxMethod.get('grdType3Wght'); //3번 type 중량
            let grdType4Wght = SBUxMethod.get('grdType4Wght'); //4번 type 중량
            let grdType5Wght = SBUxMethod.get('grdType5Wght'); //5번 type 중량
            /**  실 입고 중량 연산 **/
            let total = (grdType1Wght !== undefined && grdType1Wght !== null ? parseInt(grdType1Wght) : 0)
                +(grdType2Wght !== undefined && grdType2Wght !== null ? parseInt(grdType2Wght) : 0)
                +(grdType3Wght !== undefined && grdType3Wght !== null ? parseInt(grdType3Wght) : 0)
                +(grdType4Wght !== undefined && grdType4Wght !== null ? parseInt(grdType4Wght) : 0)
                +(grdType5Wght !== undefined && grdType5Wght !== null ? parseInt(grdType5Wght) : 0)
            let wrhsWght = wholWght - total;

            if(gfn_isEmpty(prdcrCd) || gfn_isEmpty(prdcrNm)){
                gfn_comAlert("W0005", "생산자");
                return
            }
            if(gfn_isEmpty(wrhsYmd)){
                gfn_comAlert("W0005", "선별일자");
            }
            if(gfn_isEmpty(fcltCd)){
                gfn_comAlert("W0005", "선별기");
            }
            if(!gfn_comConfirm('Q0001',"저장")){
                return;
            };

            //TODO : TB_BFFA_WRHS_STD_GRD INSERT 필요하고 VO에 CHECK된 value 어떻게 넘길것인가에대하여..

            globalVal.forEach(function(id){
                console.log(SBUxMethod.getCheckbox(id, {trueValueOnly:true, ignoreDisabledValue:false}));
            });

            try{
                let postJsonPromise = gfn_postJSON('/am/sort/insertSortBffa.do',{
                    apcCd:gv_apcCd,
                    prdcrCd : prdcrCd,
                    prdcrNm : prdcrNm,
                    wrhsYmd : wrhsYmd,
                    fcltCd : fcltCd,
                    fcltNm : fcltNm,
                    itemCd : itemCd,
                    wrhsQntt : wrhsQntt,
                    wholWght : wholWght,
                    wrhsWght : wrhsWght,
                    grdType1Wght : grdType1Wght,
                    grdType2Wght : grdType2Wght,
                    grdType3Wght : grdType3Wght,
                    grdType4Wght : grdType4Wght,
                    grdType5Wght : grdType5Wght,
                    sysFrstInptDt : gfn_dateToYmd(new Date()),
                    sysLastChgDt : gfn_dateToYmd(new Date())
                });
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    popBffa.reset();
                }
                await fn_createGrid();
            }catch (e){
                console.log(e);
            }
        },
        reset : function(){
            SBUxMethod.set('srch-reg-prdcrCd',""); //생산자코드
            SBUxMethod.set('srch-reg-prdcrNm',""); //생산자명
            SBUxMethod.attr("srch-reg-prdcrNm", "style", "background-color:initial"); //생산자명 색상
            SBUxMethod.set('srch-reg-prdcrCd',""); //생산자코드
            SBUxMethod.set('srch-reg-icptWght',""); //부적합 총량
            SBUxMethod.set('srch-slt-fcltCd',""); //선별기코드
            SBUxMethod.set('srch-reg-itemCd',""); //품목코드
            SBUxMethod.set('srch-reg-wrhsQntt',""); //박스수량
            SBUxMethod.set('srch-reg-wholWght',""); //총중량
            SBUxMethod.set('srch-reg-vrtyCd',""); //총중량
            SBUxMethod.set('grdType1Wght',""); //1번 type 중량
            SBUxMethod.set('grdType2Wght',""); //2번 type 중량
            SBUxMethod.set('grdType3Wght',""); //3번 type 중량
            SBUxMethod.set('grdType4Wght',""); //4번 type 중량
            SBUxMethod.set('grdType5Wght',""); //5번 type 중량

            globalVal.forEach(function(item){
            SBUxMethod.refresh(item);
            });
           
        }
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 생산자 선택시 callBack
     */
    const fn_setRegPrdcr = function(prdcr) {
        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-reg-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-reg-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.attr("srch-reg-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            SBUxMethod.set("srch-inp-prdcrCd", '');
            SBUxMethod.set("srch-inp-prdcrNm", '');
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:none");
        }
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(_itemCd) {
        gfn_setApcVrtySBSelect('srch-reg-vrtyCd', jsonRegApcVrty, gv_selectedApcCd, _itemCd);
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 육안선별등록 선별구분 get 함수
     */
    const fn_selectBffaType = async function(_itemCd){
        if(!gfn_isEmpty(_itemCd)){
            try{
                let postJsonPromise = gfn_postJSON('/am/cmns/apcBffaTypeList',{
                    apcCd:gv_apcCd,
                    itemCd:_itemCd
                });
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {

                    let obj = gfn_cloneJson(jsonChkGrdType);
                    let map = new Map();
                    data.resultList.forEach((item,idx) => {
                        if(gfn_isEmpty(obj.cdVlNm)){ /** 최초진입 **/
                            obj.cdVlNm = item.cdVlNm;
                            obj.indctSeq.key = item.cdVl;
                            obj.indctSeq.value.grdKnd.push(
                                {
                                    value : item.grdKnd,
                                    grdKndNm : item.grdKndNm,
                                }
                            );
                            map.set(item.grdCd,item.grdNm);
                        }else if(obj.cdVlNm == item.cdVlNm){ /** 1분류 일치 **/
                            let flag = obj.indctSeq.value.grdKnd.some(obj => obj.value == item.grdKnd);
                            if(flag){
                                map.set(item.grdCd,item.grdNm);
                            }else{
                                let index = obj.indctSeq.value.grdKnd.length-1;
                                if(!(index < 0)) {
                                    obj.indctSeq.value.grdKnd[index].grdNm = [...map];
                                    map.clear();
                                }
                                obj.indctSeq.value.grdKnd.push(
                                    {
                                        value : item.grdKnd,
                                        grdKndNm : item.grdKndNm,
                                    }
                                );
                                map.set(item.grdCd,item.grdNm);
                            }
                        }else{ /** 1분류 불일치 **/
                            let index = obj.indctSeq.value.grdKnd.length-1;
                            if(!(index < 0)) {
                                obj.indctSeq.value.grdKnd[index].grdNm = [...map];
                            }
                            jsonChkGrdTypeList.push(obj);
                            obj = gfn_cloneJson(jsonChkGrdType);
                            obj.cdVlNm = item.cdVlNm;
                            obj.indctSeq.key = item.cdVl;
                            obj.indctSeq.value.grdKnd.push(
                                {
                                    value : item.grdKnd,
                                    grdKndNm : item.grdKndNm,
                                }
                            );
                            map.clear();
                            map.set(item.grdCd,item.grdNm);
                        }
                    });
                }
                await fn_createGrid();
            }catch (e){
                console.log(e);
            }
        }
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 모달 관련 함수 event
     */
    const fn_choiceRegPrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm,null, SBUxMethod.get("srch-reg-prdcrNm"));
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 선별내역별 TABLE 셋팅
     */
    const fn_setBffaTable = function() {
        /** 선별 테이블 초기화 **/
        globalVal.length = 0;
        $("#bfaa_reg_table > tbody").empty();


        let tableEl = $("#bfaa_reg_table > tbody");
        jsonChkGrdTypeList.forEach(function(item,idx) {
            /** checkBox Json **/
            let checkObj = [];
            const chkId = "checkBox_" + item.indctSeq.key;
            item.indctSeq.value.grdKnd.forEach(function (item) {
                let elId = chkId + item.value;
                checkObj.push(
                    item.grdNm.map(function (innerArray) {
                        return {
                            text: innerArray[1],
                            truevalue: innerArray[0],
                            style : "flex:1"
                        };
                    })
                );
                globalVal.push(elId);
                window[elId] = [...checkObj];
                checkObj.length = 0;
            });
            jsonCheckBox.push(checkObj);

            let count = item.indctSeq.value.grdKnd.length;
            /** 2뎁스 종류가 여러개 **/
            if(count > 1){
                for(let i = 0 ; i < count; i++){
                    tableEl.append(`<tr></tr>`);
                    if(i == 0){
                        tableEl.children().eq(i).append(
                            `<td style="text-align: center" rowspan="`+count+`">`+item.cdVlNm+`</td>`
                           +`<td><div style="margin-bottom: 10px">`+ item.indctSeq.value.grdKnd[i].grdKndNm +`</div>`
                           +`<div id="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`" style="display:flex">
                                <sbux-checkbox
                                    id="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`"
                                    name="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`"
                                    jsondata-ref="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`.0"
                                    uitype="normal">
                                </sbux-checkbox>
                            </div>
                            </td>`
                        )
                    }else{
                        tableEl.children().eq(i).append(
                             `<td><div style="margin-bottom: 10px">`+ item.indctSeq.value.grdKnd[i].grdKndNm +`</div>`
                            +`<div>
                                <sbux-checkbox
                                    id="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`"
                                    name="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`"
                                    jsondata-ref="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[i].value+`.0"
                                    uitype="normal">
                                </sbux-checkbox>
                            </div>
                            </td>`
                        )
                    }
                }
            /** 단일일때 1-2 **/
            }else{
                tableEl.append(
                    `<tr>`
                      +`<td>`+item.cdVlNm+`</td>`
                      +`<td><div style="margin-bottom: 10px">`+ item.indctSeq.value.grdKnd[0].grdKndNm +`</div>`
                      +`<div>
                            <sbux-checkbox
                                id="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[0].value+`"
                                name="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[0].value+`"
                                jsondata-ref="checkBox_`+item.indctSeq.key+item.indctSeq.value.grdKnd[0].value+`.0"
                                uitype="normal">
                            </sbux-checkbox>
                        </div>
                        </td>`+
                    `</tr>`
                )
            }
        });
        tableEl.append(
            `<tr><td>기타</td><td><sbux-input id="checkBox_000305" name="checkBox_000305" uitype="text"></sbux-input></td></tr>`
        );

        SBUxMethod.render();
        /** 추후에 저장할때 동적으로 생성된 CheckBox ID 수집 @globalVal **/
        globalVal.push('checkBox_000305');
    }
    const fn_changeWght = function(){
        let grdType1Wght = SBUxMethod.get('grdType1Wght'); //1번 type 중량
        let grdType2Wght = SBUxMethod.get('grdType2Wght'); //2번 type 중량
        let grdType3Wght = SBUxMethod.get('grdType3Wght'); //3번 type 중량
        let grdType4Wght = SBUxMethod.get('grdType4Wght'); //4번 type 중량
        let grdType5Wght = SBUxMethod.get('grdType5Wght'); //5번 type 중량
        let total = (grdType1Wght !== undefined && grdType1Wght !== null ? parseInt(grdType1Wght) : parseInt(0))
                   +(grdType2Wght !== undefined && grdType2Wght !== null ? parseInt(grdType2Wght) : parseInt(0))
                   +(grdType3Wght !== undefined && grdType3Wght !== null ? parseInt(grdType3Wght) : parseInt(0))
                   +(grdType4Wght !== undefined && grdType4Wght !== null ? parseInt(grdType4Wght) : parseInt(0))
                   +(grdType5Wght !== undefined && grdType5Wght !== null ? parseInt(grdType5Wght) : parseInt(0))
            SBUxMethod.set('srch-inp-icptWght',total);
    }

</script>
</html>
