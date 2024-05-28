<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
    <section class="content container-fluid">
        <div class="box box-solid">
            <!-- HEAD -->
            <div class="box-header" style="display:flex; justify-content: flex-start;" >
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- apc 통합조직 관리 -->
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
                </div>
                <div style="margin-left: auto;">
                    <sbux-button
                            id="btnNew"
                            name="btnNew"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick=""
                            text="신규"
                    ></sbux-button>
                    <sbux-button
                            id="btnDelete"
                            name="btnDelete"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick=""
                            text="삭제"
                    ></sbux-button>
                    <sbux-button
                            id="btnSave"
                            name="btnSave"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick=""
                            text="저장"
                    ></sbux-button>
                    <sbux-button
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick=""
                            text="조회"
                    ></sbux-button>
                </div>
            </div>
            <!-- BODY -->
            <div class="box-body srch-keyup-area">
                <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width: 11%">
                            <col style="width: 22%">
                            <col style="width: 11%">
                            <col style="width: 22%">
                            <col style="width: 11%">
                            <col style="width: 22%">
                        </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">통합조직명</th>
                            <td class="td_input" style="">
                                <sbux-input
                                        uitype="text"
                                        id="통합조직명"
                                        name="통합조직명"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">APC코드</th>
                            <td class="td_input" style="">
                                <sbux-input
                                        uitype="text"
                                        id="APC코드"
                                        name="APC코드"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">APC명</th>
                            <td class="td_input" style="">
                                <sbux-input
                                        uitype="text"
                                        id="APC명"
                                        name="APC명"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <hr/>
                <div style="display: flex; height: 30vh;">
                    <div id="sb-area-untyOrnz" style="flex: 1;">
                    </div>
                    <div style="flex: 1;">
                        <table class="table table-bordered tbl_fixed" style="width: 80%;margin-left: 3vw">
                            <colgroup>
                                <col style="width: 30%">
                                <col style="width: 70%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="th_bg">조직코드</th>
                                    <td class="td_input">
                                        <sbux-input
                                                uitype="text"
                                                id="조직코드"
                                                name="조직코드"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">통합조직명</th>
                                    <td class="td_input">
                                        <sbux-input
                                                uitype="text"
                                                id="통합조직명2"
                                                name="통합조직명2"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">설명</th>
                                    <td class="td_input">
                                        <sbux-input
                                                uitype="text"
                                                id="설명"
                                                name="설명"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <hr/>
                <div id="sb-area-untyOrnzDtl" style="height: 40vh">
                </div>
            </div>
        </div>
    </section>
</body>
<script type="text/javascript">

    //조직코드 공통
    var grdUntyOrnz;
    var jsonUntyOrnz = [];
    //조직코드 상세
    var grdUntyOrnzDtl;
    var jsonUntyOrnzDtl = [{}];

    window.addEventListener('DOMContentLoaded', async function(e) {
            fn_createUntyOrnzDtl();
            fn_createUntyOrnz();
    });

    const fn_createUntyOrnz = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-untyOrnz';
        SBGridProperties.id = 'untyOrnz';
        SBGridProperties.jsonref = 'jsonUntyOrnz';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'none';
        SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            {caption : ["조직코드"], ref: 'cdVl', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["조직명"], ref: 'cdVlNm', type: 'output',  width:'300px', style: 'text-align:center; padding-right:5px;'},
            {caption : ["설명"], ref: 'cdVlNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
        ];
        grdUntyOrnz = _SBGrid.create(SBGridProperties);
    }
    const fn_createUntyOrnzDtl = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-untyOrnzDtl';
        SBGridProperties.id = 'untyOrnzDtl';
        SBGridProperties.jsonref = 'jsonUntyOrnzDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'none';
        SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            {
                caption: ["처리"],
                ref: 'delYn',
                type:'button',
                width:'100px',
                style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (strValue== null || strValue == ""){
                        return "<button style='width:85%' type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
                    } else {
                        return "<button style='width:85%' type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            {caption : ["APC코드"], ref: 'apcCd', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["APC명"], ref: 'apcNm', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["사업자번호"], ref: 'brno', type: 'output',  width:'300px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["전화번호"], ref: 'telno', type: 'output',  width:'150px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["주소"], ref: 'addr', type: 'output',  width:'300px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["시도"], ref: 'sido', type: 'output',  width:'300px', style: 'text-align:center; padding-right:5px; '},
            {caption : ["시군"], ref: 'sigun', type: 'output',  width:'300px', style: 'text-align:center; padding-right:5px;'},
        ];
        grdUntyOrnzDtl = _SBGrid.create(SBGridProperties);
    }
    const fn_addRow = function(nRow){
        const row = grdUntyOrnzDtl.getRowData(nRow, false);
        row.delYn = "N";
        row.apcCd = gv_selectedApcCd;
        grdUntyOrnzDtl.addRow(true);
        grdUntyOrnzDtl.setCellDisabled(
            0,
            0,
            grdUntyOrnzDtl.getRows() -1,
            grdUntyOrnzDtl.getCols() -1,
            false
        );
        grdUntyOrnzDtl.setCellDisabled(
            grdUntyOrnzDtl.getRows() -1,
            0,
            grdUntyOrnzDtl.getRows() -1,
            grdUntyOrnzDtl.getCols() -1,
            true
        );
    }
    const fn_delRow = async function(nRow) {

        const rowStatus = grdUntyOrnzDtl.getRowStatus(nRow);

        if (rowStatus == 0 || rowStatus == 2) {
            if (!gfn_comConfirm("Q0002", "등록된 정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
                return;
            }
            grdUntyOrnzDtl.deleteRow(nRow);
            const trsmMat = grdUntyOrnzDtl.getRowData(nRow);
            /** 바로지울것인지 취합해서 지울것인지 결정해야함. **/
            // await fn_deleteApcLinkTrsmMat(trsmMat);

        } else {
            grdUntyOrnzDtl.deleteRow(nRow);
        }
    }

</script>
</html>
