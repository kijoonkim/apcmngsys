<%
    /**
     * @Class Name 		: fim3510.jsp
     * @Description 	: 부가세정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	신정철		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 부가세정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        #Sales > table > tbody > tr > td,#Purchase > table > tbody > tr > td{
            text-align: center;
            border: 1px solid #e8f1f9 !important;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .box.box-solid{
            border-radius: 0 !important;
            height: 100%;
        }
        input[type="number"] {
            border: hidden;
            box-sizing: border-box;
            text-align: right;
            width: 100%;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section style="height: 100vh">
    <div class="box box-solid">
        <div class="box-header">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="srchTable" class="table table-bordered tbl_fixed">
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
                    <th scope="row" class="th_bg">부가세코드</th>
                    <td colspan="3" style="border-right: hidden" class="td_input">
                        <sbux-input id="srch-dtp-vatCode" name="srch-dtp-vatCode" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="8" style="border-top: hidden"></td>
                </tr>
                </tbody>
            </table>
            <div class="ad_tbl_top" style="margin-top: 10px">
                <ul class="ad_tbl_count">
                    <li><span>◎ 부가세 정보</span></li>
                </ul>
                <sbux-button id="btn_selectMode" name="btn_selectMode" uitype="normal" text="복사해제모드"
                             onclick="fn_addRow('grdReCalc')">
                </sbux-button>
                <sbux-button id="btn_add_grdCalc" name="btn_add_grdCalc" uitype="normal" text="행 추가"
                             image-src="/static/resource/svg/grdPlus.svg"
                             image-style="width:3rem;height:20px"
                             image-placement="front"
                             onclick="fn_addRow('grdReCalc')">
                </sbux-button>
                <sbux-button id="btn_remove_grdCalc" name="btn_remove_grdCalc" uitype="normal" text="행 삭제"
                             image-src="/static/resource/svg/grdMinus.svg"
                             image-style="width:3rem;height:20px"
                             image-placement="front"
                             onclick="fn_removeRow('grdReCalc')">
                </sbux-button>
            </div>
            <div id="sb-area-grd" style="width: 100%; height: 550px"></div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var grdGridInfo;
    var jsonGrdInfo = [];

    /** grid combo json **/
    var jsonVatName = [];


    window.addEventListener("DOMContentLoaded",function(){
       fn_createGrid();
       fn_createSelectJson();
    });

    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grd';
        SBGridProperties.id = 'grdGridInfo';
        SBGridProperties.jsonref = 'jsonGrdInfo';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['부가세코드'], ref : 'VAT_CODE',width : '100px', style : 'text-align:center',    type : 'output'},
            {caption : ['부가세코드명'], ref : 'VAT_NAME', width : '100px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'], ref : 'VAT_TYPE_CODE', width : '100px',style : 'text-align:center', type : 'combo', typeinfo : {ref:'jsonVatName', label:'VAT_TYPE_NAME', value:'VAT_TYPE_CODE', oneclickedit: true}},
            {caption : ['부가세율(%)'], ref : 'VAT_RATE', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['상한비율(%)'], ref : 'LIMIT_PLUS_RATE', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['하한비율(%)'], ref : 'LIMIT_MINUS_RATE', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['불공제 여부'], ref : 'NONDED_YN', width : '100px',style : 'text-align:center',    type : 'checkbox',typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption : ['계정코드'], ref : 'ACCOUNT_CODE', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['계정과목명'], ref : 'ACCOUNT_NAME', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['사용여부'], ref : 'USE_YN', width : '100px',style : 'text-align:center', type : 'checkbox',typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption : ['적용기간(시작일)'], ref : 'START_DATE', width : '100px',style : 'text-align:center', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'}},
            {caption : ['적용기간(종료일)'], ref : 'END_DATE', width : '100px',style : 'text-align:center', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'}},
            {caption : ['메모'], ref : 'MEMO', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['정렬순서'], ref : 'SORT_SEQ', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['생성자'], ref : 'INSERT_USERID', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['생성시각'], ref : 'INSERT_TIME', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['생성PC'], ref : 'INSERT_PC', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['최종작성자ID'], ref : 'UPDATE_USERID', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['최종수정일'], ref : 'UPDATE_TIME', width : '100px',style : 'text-align:center',    type : 'output'},
            {caption : ['최종작성자PC'], ref : 'UPDATE_PC', width : '100px',style : 'text-align:center',    type : 'output'},
        ];
        grdGridInfo = _SBGrid.create(SBGridProperties);
    }

    const fn_createSelectJson = async function(){
        jsonVatNameData = await gfnma_getComList('L_FIT020','','','','COMP_CODE',"COMP_NAME");
        if(jsonVatNameData.resultStatus === 'S'){
            jsonVatName = jsonVatNameData.cv_1;
        }
        console.log(jsonVatName);
    }

    function cfn_search(){
        fn_search();
    }
    const fn_search = async function(){
        console.log('hh');
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_VAT_CODE           : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFim3510.do", {
            getType				: 'json',
            cv_count			: '1',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log(data);
        if(data.resultStatus === 'S'){
           jsonGrdInfo = data.cv_1;
           grdGridInfo.rebuild();
        }
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
