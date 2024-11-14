<%
    /**
     * @Class Name 		: fit1300.jsp
     * @Description 	: 부가세요약 화면
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
    <title>title : 부가세요약</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
        input[type="number"] {
            border: hidden;
            box-sizing: border-box;
            text-align: right;
            width: 100%;
        }
        #dtlTable tr:nth-child(-n+4) td{
            padding: 0px 5px!important;
        }
        #dtlTable tr:not(:nth-child(-n+4)) td{
            padding: 0!important;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
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
                    <th scope="row" class="th_bg">기준연도</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year"
                                         date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                        >
                        </sbux-datepicker>
                    </td>

                    <th scope="row" class="th_bg">신고구분명</th>
                    <td colspan="7" class="td_input" style="border-right: hidden;">
                        <div style="display: flex;gap: 5px">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm"></sbux-input>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>◎ 부가세 집계</span></li>
                </ul>
            </div>
            <table id="dtlTable"class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 12%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                <tr>
                    <td rowspan="4" class="td_input">
                        사업장명
                    </td>
                    <td rowspan="4">
                        총건수
                    </td>
                    <td rowspan="4">
                        총공급가액
                    </td>
                    <td rowspan="4">
                        총세액
                    </td>
                    <td rowspan="4">
                        납부세액<br>(환급세액)
                    </td>
                    <td rowspan="4">
                        부가세신고<br>서확정여부
                    </td>
                    <td colspan="6">
                        부가가치세 부속서류 첨부여부
                    </td>
                </tr>
                <tr>
                    <td>매출세금계산서</td>
                    <td>매출계산서</td>
                    <td>영세율첨부</td>
                    <td>신용카드매출</td>
                    <td>수출실적명세</td>
                    <td>내국신용장</td>
                </tr>
                <tr>
                    <td>매입세금계산서</td>
                    <td>매입계산서</td>
                    <td>의제매입명세</td>
                    <td>건물등감가상각</td>
                    <td>불공제매입명세</td>
                    <td>신용카드수령</td>
                </tr>
                <tr>
                    <td>영세율매출명세</td>
                    <td>대손세액공제</td>
                    <td>사업장별납부</td>
                    <td>단위과세사업장</td>
                    <td>과표및세액경정</td>
                    <td>과표및수정</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
<script type="text/javascript">
    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var jsonCorpNm = [];
    var jsonGrdList = [];
    var jsonGrdDivision = [];
    var jsonGrdCalc = [];
    var jsonGrdReCalc = [];

    var grdListGrid;
    var grdDivision;
    var grdCalc;
    var grdReCalc;

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();

        window.parent.document.getElementById("main-btn-save").style.display = "none";
    });

    const fn_init = async function(){
        /** 법인 select **/
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','','','','COMP_CODE',"COMP_NAME");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedCorpCd);
        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));

        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#src-btn-currencyCode']
            ,compCode		: gv_ma_selectedCorpCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: ''
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'right' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TYPE_NAME'
            ,columns		:[
                {caption: "부가세유형",		ref: 'VAT_TYPE_NAME', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 		ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'WHOLE_PAY_SITE_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 		ref: 'CONFIRM_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 		ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
            ]
            ,callback       : fn_choice
        })
    }
    async function fn_choice(_value){
        let tr = $('#src-btn-currencyCode').siblings().find('tr.clickable-row.active');
        if (tr.length) {
            let termFr = tr.find('td[cu-code="STANDARD_TERM_FR"]');
            if (termFr.length) {
                SBUxMethod.set("srch-dtp-ymdstandardTermFr", termFr.text());
                SBUxMethod.set('srch-dtp-yyyy',termFr.text().split('-')[0]);
            }

            let termTo = tr.find('td[cu-code="STANDARD_TERM_TO"]');
            if (termTo.length) {
                SBUxMethod.set('srch-dtp-ymdstandardTermTo', termTo.text());
            }
        }
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_YYYY               : ''
            ,V_P_SEQ                : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
        paramObj.V_P_SEQ = _value;

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit1300.do", {
            getType				: 'json',
            cv_count			: '1',
            workType            : 'DETAIL',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log(data,"디테일");
        if(data.resultStatus === 'S'){
            data.cv_1.forEach(function(item){
                let el = `
              <tr style="text-align:center">
                <td rowspan="3">${'${item.TAX_SITE_NAME}'}</td>
                <td rowspan="3">${'${item.TOTAL_CNT}'}</td>
                <td rowspan="3">${'${item.TOTAL_SUPPLY_AMT.toLocaleString()}'}</td>
                <td rowspan="3">${'${item.TOTAL_VAT_AMT.toLocaleString()}'}</td>
                <td rowspan="3">${'${item.PAY_VAT_AMT.toLocaleString()}'}</td>
                <td rowspan="3">${'${item.REPORT_CONFIRM_YN}'}</td>
                <td>${'${item.AR_TAX_BILL_YN}'}</td>
                <td>${'${item.AR_BILL_YN}'}</td>
                <td>${'${item.AR_ZERO_TAX_YN}'}</td>
                <td>${'${item.AR_CARD_YN}'}</td>
                <td>${'${item.AR_EXPORT_YN}'}</td>
                <td>${'${item.AR_CREDIT_YN}'}</td>
              </tr>
              <tr style="text-align:center">
                <td>${'${item.AP_TAX_BILL_YN}'}</td>
                <td>${'${item.AP_BILL_YN}'}</td>
                <td>${'${item.AP_DEEMED_YN}'}</td>
                <td>${'${item.AP_ASSET_YN}'}</td>
                <td>${'${item.AP_NONDED_YN}'}</td>
                <td>${'${item.AP_CARD_YN}'}</td>
              </tr>
              <tr style="text-align:center">
                <td>${'${item.AR_ZERO_SALES_YN}'}</td>
                <td>${'${item.BADDEBT_YN}'}</td>
                <td>${'${item.TAXSITE_BASE_YN}'}</td>
                <td>${'${item.TAX_UNIT_YN}'}</td>
                <td>${'${item.SUPPLEMENT_YN}'}</td>
                <td>${'${item.AMENDED_YN}'}</td>
              </tr>
              `;
                $("#dtlTable tbody").append(el);
            })
        }
    }
    const fn_addRow = async function(_id){
        window[_id].addRow(true,[0,0,0,0,0,0,0]);
    }
    const fn_removeRow = async function(_id){
        let idx = window[_id].getRow(true);
        if(idx === -1){
            return;
        }
        window[_id].deleteRow(idx);
    }
    async function fn_setSiteCode(){
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_YYYY               : ''
            ,V_P_SEQ                : ''
            ,V_P_TAX_SITE_CODE      : ''
            ,V_P_TAX_SITE_NAME      : ''
            ,V_P_BIZ_REGNO          : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
        paramObj.V_P_SEQ = gfnma_multiSelectGet('#src-btn-currencyCode');
        paramObj.V_P_TAX_SITE_CODE = jsonGrdList[grdListGrid.getRow()-1].TAX_SITE_CODE;

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFIt1300.do", {
            getType				: 'json',
            cv_count			: '13',
            workType            : 'Q',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        if(data.resultStatus === 'S'){
            let resultObj = data.cv_1[0];
            for(let key in resultObj){
                let elId = "#" + gfnma_snakeToCamel(key);
                $(elId).val(parseInt(resultObj[key]));
            }
        }
    }
    /** 공통버튼 **/
    function cfn_search() {
        fn_search();
    }
    const fn_search = async function(){
        let _value = gfnma_multiSelectGet('#src-btn-currencyCode');
        if(gfn_isEmpty(_value)){
            gfn_comAlert("W0002", "신고구분명");
            return;
        }
        await fn_choice(_value);
    }
</script>
