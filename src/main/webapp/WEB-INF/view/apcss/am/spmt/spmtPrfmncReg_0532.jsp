<%
    /**
     * @Class Name : spmtPrfmncReg_0532.jsp
     * @Description : 출하실적등록(지우)
     * @author SI개발부
     * @since 2025.4.28
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.04.28   	유민지			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하실적등록(지우)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        #gsb-slt-apcCd {
            max-width: 100% !important;
        }

        .ad_tbl_top2 div span {
            margin-right: 3px;
            font-weight: 600;
            color: #3c6dbc;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적등록 -->
                <sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text=""></sbux-label>
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-outline-danger btn-mbl"
                        onclick="fn_search"
                        text="조회"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-outline-danger btn-mbl"
                        onclick="fn_save"
                        text="저장"
                ></sbux-button>
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-outline-danger btn-mbl"
                        onclick=""
                        text="종료"
                ></sbux-button>
            </div>

        </div>
        <div class="box-body">
            <!--[APC] START -->
            <!--[APC] END -->
            <!--[pp] 검색 -->

            <table class="table table-bordered tbl_fixed" >
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 20%">
                    <col style="width: 5%">
                    <col style="width: 10%">
                    <col style="width: 20%">
                    <col style="width: 5%">
                    <col style="width: 10%">
                    <col style="width: 20%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required"></span>APC</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div style="display: flex;">
                            <%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>출고일자</th>
                    <td class="td_input"style="border-right: hidden;">
                        <sbux-datepicker
                                id="dtl-dtp-spmtYmd"
                                name="dtl-dtp-spmtYmd"
                                wrap-style="width:100%"
                                date-format="yyyy-mm-dd"
                                style="width:100%;"
                                class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
                        ></sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg"></span>거래처</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select
                                id="dtl-slt-cnpt"
                                name="dtl-slt-cnpt"
                                wrap-style="width:100%"
                                style="width:100%;"
                                unselected-text="선택"
                                jsondata-ref="jsonApcCnpt"
                                uitype="single"
                                class="form-control input-sm"
                        ></sbux-select>
                    </td>

                </tr>
                </tbody>
            </table>

            <div class="ad_tbl_top2" style="display: flex; justify-content: flex-end; gap: 3px">
                <div style="align-content: center">
                            <span>출고수량 합계</span>
                            <span>(
                            <sbux-label
                                    id="sum-spmtQntt"
                                    name="sum-spmtQntt"
                                    uitype="normal"
                                    text="0"
                                    class="bold"
                                    mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' }"
                            ></sbux-label> )
                        </span>
                </div>

                <div style="align-content: center">
                            <span>판매금액 합계</span>
                            <span>(
                            <sbux-label
                                    id="sum-ntslAmt"
                                    name="sum-ntslAmt"
                                    uitype="normal"
                                    text="0"
                                    class="bold"
                                    mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' }"
                            ></sbux-label> 원)
                        </span>

                </div>

            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-spmtPrfmncReg" style="height:500px;"></div>
            </div>

        </div>
    </div>

</section>
<script type="text/javascript">

    /** 거래처 **/
    var jsonApcCnpt = [];
    /** 출하포장단위 **/
    var jsonSpmtPckgUnit = [];
    /** 창고 **/
    var jsonComWarehouse = [];

    /** 출고실적 그리드 **/
    var gridSpmtPrfmncReg;
    var jsonSpmtPrfmncReg = [];

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_init();
        fn_search();
    });

    /**
     * @name fn_init
     * @description form init
     */
    const fn_init = async function() {
        SBUxMethod.set("dtl-dtp-spmtYmd", gfn_dateToYmd(new Date()));
        await fn_initSBSelect();
        fn_createSpmtPrfmncRegGrid();
    }

    /**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
    const fn_initSBSelect = async function() {
        // 검색 SB select
        let result = await Promise.all([
            gfn_setCpntRgnSBSelect('dtl-slt-cnpt', jsonApcCnpt, gv_selectedApcCd),       // 거래처
        ]);
        jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd); // 출하포장단위
        jsonComWarehouse = await gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd); // 창고
    }

    /**
     * @name fn_createSpmtPrfmncRegGrid
     * @description 출고실적등록 그리드
     */
    const fn_createSpmtPrfmncRegGrid = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-spmtPrfmncReg';
        SBGridProperties.id = 'gridSpmtPrfmncReg';
        SBGridProperties.jsonref = 'jsonSpmtPrfmncReg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
         /*   {caption: ["처리"], 		ref: 'apcCd',   	type:'button', width:'5%',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
                    if(strValue== null || strValue == ""){
                        // return "<button type='button' class='btn btn-xs btn-outline-danger' data-id='gridSpmtPrfmncReg' onClick=\"gfn_gridRowPlusMinus(event, 'ADD', " + nRow + ")\">추가</button>";
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    }else{
                        return "<button type='button' class='btn btn-xs btn-outline-danger' data-id='gridSpmtPrfmncReg' data-del-fn='fn_deleteSpmtPrfmnc' onClick=\"gfn_gridRowPlusMinus(event, 'DEL', " + nRow + ")\">삭제</button>";
                    }
                }},*/
           {caption: ["처리"],	ref: 'delYn',		type:'output',  width:'5%', style: 'text-align:center;',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
            }},
            {caption: ["출고일자"],	ref: 'spmtYmd',	type:'output', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, width:'7.9%', style: 'text-align:center;'},
            {caption: ["거래처"],	ref: 'cnptCd',	type:'combo',  typeinfo : {ref:'jsonApcCnpt', label:'label', value:'value', oneclickedit: true}, width:'7.9%', style: 'text-align:center;background-color: #FFF8DC;'},
            {caption: ["상품규격"],	ref: 'spmtPckgUnitCd',	type:'combo', typeinfo :{ref :'jsonSpmtPckgUnit',label: 'spmtPckgUnitNm',value:'spmtPckgUnitCd'}, width:'7.9%', style: 'text-align:center;background-color: #FFF8DC;',userattr:{colNm :'gdsSpcfct'}},
            {caption: ["품목"],	ref: 'itemNm',	type:'output',  width:'7.9%', style: 'text-align:center;'},
            {caption: ["품종"],	ref: 'vrtyNm',	type:'output',  width:'7.9%', style: 'text-align:center;'},
            {caption: ["규격"],	ref: 'spcfctNm',	type:'output',  width:'7.9%', style: 'text-align:center;'},
            {caption: ["기준중량(Kg)"],	ref: 'crtrWght',	type:'output', format : {type:'number', rule:'#,##0.##'}, width:'7.9%', style: 'text-align:center;'},
            {caption: ["실중량(Kg)"],	ref: 'actlWght',	type:'input', format : {type:'number', rule:'#,##0.##'},typeinfo :{mask : {alias :'numeric'}}, width:'7.9%', style: 'text-align:center;background-color: #FFF8DC;'},
            {caption: ["출고수량"],	ref: 'spmtQntt',	type:'input', format : {type:'number', rule:'#,###'},typeinfo :{mask : {alias :'numeric'}}, width:'7.9%', style: 'text-align:center;background-color: #FFF8DC;',userattr:{colNm :'spmtQntt'}},
            {caption: ["판매금액"],	ref: 'ntslAmt',	type:'input', format : {type:'number', rule:'#,###'},typeinfo :{mask : {alias :'numeric'}}, width:'7.9%', style: 'text-align:center;background-color: #FFF8DC;',userattr:{colNm :'ntslAmt'}},
            {caption: ["창고"],	ref: 'warehouseSeCd',	type:'combo', typeinfo : {ref :'jsonComWarehouse',value:'cdVl',label:'cdVlNm'}, width:'7.9%', style: 'text-align:center;background-color: #FFF8DC;'},
            {caption: ["납기일자"],	ref: 'dudtYmd',	type:'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, width:'8%', style: 'text-align:center;background-color: #FFF8DC;'},
            {caption: ["품목코드"],	ref: 'itemCd',	type:'output', hidden : true },
            {caption: ["품종코드"],	ref: 'vrtyCd',	type:'output', hidden : true },
            {caption: ["규격코드"],	ref: 'spcfctCd',type:'output', hidden : true },
        ];
        gridSpmtPrfmncReg =  _SBGrid.create(SBGridProperties);
        gridSpmtPrfmncReg.bind("valuechanged","fn_gridSpmtValueChanged");
    }


    /**
     * @name fn_search
     * @description 조회
     */
    const fn_search = async function() {
        const spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");
        const cnptCd = SBUxMethod.get("dtl-slt-cnpt");

        if (gfn_isEmpty(spmtYmd)) {
            gfn_comAlert("W0001", "출고일자");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncReg.do", {
            apcCd: gv_selectedApcCd,
            spmtYmd : spmtYmd,
            cnptCd : cnptCd
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                console.log("조회결과",data.resultList);
                jsonSpmtPrfmncReg.length = 0;
                data.resultList.forEach(item =>{
                   const spmt = {
                       apcCd : item.apCd,
                       spmtYmd : item.spmtYmd,
                       cnptCd : item.cnptCd,
                       spmtPckgUnitCd : item.spmtPckgUnitCd,
                       itemNm : item.itemNm,
                       vrtyNm : item.vrtyNm,
                       spcfctNm : item.spcfctNm,
                       crtrWght : item.spcfctWght,
                       spmtQntt : item.spmtQntt,
                       ntslAmt : item.ntslAmt,
                       itemCd : item.itemCd,
                       vrtyCd : item.vrtyCd,
                       spcfctCd : item.spcfctCd,
                       delYn : 'N',
                       dudtYmd : item.dudtYmd
                   }
                   jsonSpmtPrfmncReg.push(spmt);
                });
                gridSpmtPrfmncReg.addRow();
                gridSpmtPrfmncReg.setCellDisabled(gridSpmtPrfmncReg.getRows() -1, 0, gridSpmtPrfmncReg.getRows() -1, gridSpmtPrfmncReg.getCols() -1, true);
                gridSpmtPrfmncReg.refresh();
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

    /**
     * @name fn_addRow
     * @description 행추가
     */
    const fn_addRow = function(nRow){
        const spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");

        if (gfn_isEmpty(spmtYmd)) {
            gfn_comAlert("W0001", "출고일자");		//	//	W0002	{0}을/를 입력하세요.
            return;
        }

        const rowData = gridSpmtPrfmncReg.getRowData(nRow, false);
        rowData.spmtYmd = spmtYmd;
        // rowData.apcCd = "N";
        rowData.gubun = "insert";
        rowData.delYn = "N"
        gridSpmtPrfmncReg.rebuild();

        gridSpmtPrfmncReg.addRow(true);
        gridSpmtPrfmncReg.setCellDisabled(nRow , 0, nRow , gridSpmtPrfmncReg.getCols(), false);
        gridSpmtPrfmncReg.setRowStatus(nRow,1);

        /** 마지막행 disabled **/
        gridSpmtPrfmncReg.setCellDisabled(gridSpmtPrfmncReg.getRows() -1, 0, gridSpmtPrfmncReg.getRows() -1, gridSpmtPrfmncReg.getCols() -1, true);
    }


    const fn_delRow = function(nRow) {
        let rowIndex = gridSpmtPrfmncReg.getRow();
        let status = gridSpmtPrfmncReg.getRowStatus(rowIndex);
        if(status === 0){
            fn_deleteSpmtPrfmnc(rowIndex);
        }else{
            gridSpmtPrfmncReg.deleteRow(nRow);
        }
    }

    /*const fn_deleteSpmtPrfmnc = async function(rowIndex) {
        const rowData = gridSpmtPrfmncReg.getRowData(rowIndex);

        if(!gfn_comConfirm("Q0001", "출하취소")) {    // 출하취소 하시겠습니까?
            return;
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/wgh/deleteSpmtPrfmncList.do", );
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");					// I0001 처리 되었습니다.
                await fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }*/

    /**
     * @name fn_gridSpmtValueChanged
     * @description 그리드 값 변경
     */
    function fn_gridSpmtValueChanged(){
        const nRow = gridSpmtPrfmncReg.getRow();
        const nCol = gridSpmtPrfmncReg.getCol();
        const userAttr = gridSpmtPrfmncReg.getColUserAttr(nCol);
        const rowData = gridSpmtPrfmncReg.getRowData(nRow,false); //call by refrence
        const getGridAllData = gridSpmtPrfmncReg.getGridDataAll();

        if (gfn_isEmpty(userAttr)) return;

        switch (userAttr.colNm) {
            case "gdsSpcfct" :

                const spmtPckgUnitCd = rowData.spmtPckgUnitCd;
                jsonSpmtPckgUnit.forEach(item => {
                    if (_.isEqual(spmtPckgUnitCd,item.spmtPckgUnitCd)) {
                        rowData.itemCd = item.itemCd;
                        rowData.vrtyCd = item.vrtyCd;
                        rowData.spcfctCd = item.spcfctCd;
                        rowData.itemNm = item.itemNm;
                        rowData.vrtyNm = item.vrtyNm;
                        rowData.spcfctNm = item.spcfctNm;
                        rowData.crtrWght = item.spcfctWght;
                    }
                });
                gridSpmtPrfmncReg.refresh({'focus':false});

                break;
            case "spmtQntt" :
                let totalQntt = 0;
                getGridAllData.forEach(item => {
                    totalQntt += Number(item.spmtQntt);
                });
                SBUxMethod.set('sum-spmtQntt',totalQntt);
                break;
            case "ntslAmt" :
                let totalAmt = 0;
                getGridAllData.forEach(item => {
                    totalAmt +=Number(item.ntslAmt);
                })
                SBUxMethod.set('sum-ntslAmt',totalAmt);
                break;
        }



    }

    /**
     * @name fn_save
     * @description 저장
     */
    const fn_save = async function () {
        const allSpmtData = gridSpmtPrfmncReg.getGridDataAll();
        const saveList = [];
        for (let i =0; i < allSpmtData.length -1; i++) {
            const nowData = allSpmtData[i];
            const cnptCd = nowData.cnptCd;
            const spmtPckgUnitCd = nowData.spmtPckgUnitCd;
            const actlWght = nowData.actlWght;
            const spmtQntt = nowData.spmtQntt;
            const ntslAmt = nowData.ntslAmt;
            const warehouseSeCd = nowData.warehouseSeCd;
            const dudtYmd = nowData.dudtYmd;

            if (gfn_isEmpty(cnptCd)) {
                gfn_comAlert("W0005", "거래처");
                return;
            }
            if (gfn_isEmpty(spmtPckgUnitCd)) {
                gfn_comAlert("W0005", "상품규격");
                return;
            }
            if (gfn_isEmpty(actlWght)) {
                gfn_comAlert("W0005", "실중량");
                return;
            }
            if (gfn_isEmpty(spmtQntt)) {
                gfn_comAlert("W0005", "출고수량");
                return;
            }
            if (gfn_isEmpty(ntslAmt)) {
                gfn_comAlert("W0005", "판매금액");
                return;
            }
            if (gfn_isEmpty(warehouseSeCd)) {
                gfn_comAlert("W0005", "창고");
                return;
            }
            if (gfn_isEmpty(dudtYmd)) {
                gfn_comAlert("W0005", "납기일자");
                return;
            }

            const item = {
                apcCd: gv_selectedApcCd,
                spmtYmd: nowData.spmtYmd,
                cnptCd: nowData.cnptCd,
                spmtPckgUnitCd: nowData.spmtPckgUnitCd,
                itemCd: nowData.itemCd,
                vrtyCd: nowData.vrtyCd,
                spcfctCd: nowData.spcfctCd,
                spcfctWght: nowData.crtrWght,
                spmtQntt: nowData.spmtQntt,
                warehouseSeCd: nowData.warehouseSeCd,
                dudtYmd: nowData.dudtYmd,
                ntslAmt: nowData.ntslAmt,
                gdsGrd: "X0",
            };

            let found = false;

            for (let j = 0; j < saveList.length; j++) {
                const group = saveList[j];
                if (group.apcCd === item.apcCd && group.cnptCd === item.cnptCd && group.spmtYmd === item.spmtYmd) {
                    group.spmtPrfmncList.push(item);
                    found = true;
                    break;
                }
            }

            if (!found) {
                saveList.push({
                    apcCd: item.apcCd,
                    cnptCd: item.cnptCd,
                    spmtYmd: item.spmtYmd,
                    spmtFrcdPrcsYn : "Y",
                    spmtPrfmncList: [item]
                });
            }

        }

        if (saveList.length == 0) {
            gfn_comAlert("W0005", "저장대상");		//	W0005	{0}이/가 없습니다.
            return;
        }

        console.log("저장리스트",saveList);

        if (!gfn_comConfirm("Q0001", "출하실적 저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        // return;

        try {
            const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmnWithList.do",saveList);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }
        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
