<%
    /**
     * @Class Name 		: fit2420.jsp
     * @Description 	: 사업장별부가세납부세액명세서
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.10.16
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	이경한		최초 생성
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
    <title>Title</title><title>title : 신용카드수령명세서(매입)</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        #Sales > table > tbody > tr > td{
            text-align: center;
            border: 1px solid #e8f1f9 !important;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        table[id="panRightHeader"] td, table[id="panRightMiddle"] td{
            text-align: center;
            border: solid 1px blue;
            padding: 5px;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid" style="border-radius: 0">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
	            <!--[APC] START -->
	            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	            <!--[APC] END -->
	            <!-- content_header start -->
	            <table id="srchTable" class="table table-bordered tbl_fixed table-search-ma">
	                <colgroup>
	                    <col style="width: 8%">
	                    <col style="width: 7%">
	                    <col style="width: 1%">
	                    <col style="width: 7%">
	                    <col style="width: 2%">
	 
	                    <col style="width: 8%">
	                    <col style="width: 7%">
	                    <col style="width: 1%">
	                    <col style="width: 7%">
	                    <col style="width: 2%">
	 
	                    <col style="width: 8%">
	                    <col style="width: 7%">
	                    <col style="width: 1%">
	                    <col style="width: 7%">
	                    <col style="width: 2%">
	 
	                    <col style="width: 8%">
	                    <col style="width: 7%">
	                    <col style="width: 1%">
	                    <col style="width: 7%">
	                    <col style="width: 2%">
	                </colgroup>
	                <tbody>
	                <tr>
	                    <th scope="row" >기준연도</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
	                        <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year"
	                                         date-format="yyyy" class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
	                                         onchange="fn_setMultSelect(srch-dtp-yyyy)">
	                        </sbux-datepicker>
	                    </td>
	                    <td></td>
	                    <th scope="row" >신고구분명</th>
	                    <td colspan="8" class="td_input" style="border-right: hidden;">
	                        <div style="display: flex;gap: 5px">
	                            <div class="dropdown">
	                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                    <font>선택</font>
	                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                </button>
	                                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:250px;padding-top:0px;overflow:auto">
	                                </div>
	                            </div>
	                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
	                            <p style="text-align: center;line-height: 30px">~</p>
	                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
	                        </div>
	                    </td>
	                    <td></td>
	                    <th scope="row" >총괄납부관리번호</th>
	                    <td colspan="3" class="td_input" style="border-top: hidden" >
	                        <sbux-input id="srch-inp-wholePaySiteNo" name="srch-inp-wholePaySiteNo" uitype="text" class="form-control input-sm"></sbux-input>
	                    </td>
	                    <td></td>
	                </tr>
	                </tbody>
	            </table>
            </div>
			<div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>◎ 사업장별 부가가치세과세표준 및 납부(환급)세액 신고명세서</span>
<!--                             <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span> -->
                        </li>
                    </ul>
                </div>			
				<div>
					<div id="sb-area-grdListGrid" style="height:60vh; width:100%;"></div>
				</div>
				<div>
					<div id="sb-area-grdSubListGrid" style="width: 100%; height: 20vh"></div>
				</div>            
			</div> 
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var jsonGrdList = [];
    var grdListGrid;
    var jsonSubGrdList = [];
    var grdSubListGrid;
 
    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_createSubGrid();
        fn_init();
    });
 
    const fn_init = async function() {
        /** 법인 select **/
        jsonReasonCodeData = await gfnma_getComList('L_FIT025', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CO_CD', "CORP_NM");
        jsonReasonCode = jsonReasonCodeData.cv_1;
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm', gv_ma_selectedCorpCd);
        /** 제출사유 **/
        SBUxMethod.refresh('SBMSN_RSN_CD');
        /** 기준연도 **/
        let yyyy = gfn_dateToYear(new Date());
        SBUxMethod.set('srch-dtp-yyyy', yyyy);

        /** 신고구분명 select **/
        await fn_setMultSelect(yyyy);
    }
    async function fn_setMultSelect(yyyy){
        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#src-btn-currencyCode']
            ,compCode		: gv_ma_selectedCorpCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: 'AND A.YR = ' + "'" + yyyy + "'"
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: '' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TMPLT_NM'
            ,columns		:[
                {caption: "부가세유형",		ref: 'VAT_TMPLT_NM', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 		ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'OVS_BPLC_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 		ref: 'CFMTN_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 		ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
            ]
            ,callback       : fn_choice
        });
    }
    async function fn_choice(_value) {
        /** reset **/
        jsonSubGrdList.length = 0;
        jsonGrdList.length = 0;
        grdListGrid.rebuild();
        grdSubListGrid.rebuild();
 
        let tr = $('#src-btn-currencyCode').siblings().find('tr.clickable-row.active');
        if (tr.length) {
            let termFr = tr.find('td[cu-code="STANDARD_TERM_FR"]');
            if (termFr.length) {
                SBUxMethod.set("srch-dtp-ymdstandardTermFr", termFr.text());
                SBUxMethod.set('srch-dtp-yyyy', termFr.text().split('-')[0]);
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
 
        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['wholePaySiteNo']);
        paramObj.V_P_SEQ = _value;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2420.do", {
            getType				: 'json',
            cv_count		    : '5',
            workType            : 'DETAIL',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        try{
            if(data.resultStatus === 'S') {
            	data.cv_2.forEach((item, index) => {
    	    		const cursorData = {
   	    				TX_SITE_CD				: gfnma_nvl2(item.TX_SITE_CD),
   	    				TX_SITE_NM				: gfnma_nvl2(item.TX_SITE_NM),
   	    				ADDR					: gfnma_nvl2(item.ADDR),
   	    				INR_DLNG_CNYN_AMT		: gfnma_nvl2(item.INR_DLNG_CNYN_AMT),
   	    				INR_DLNG_SHPGOT_AMT		: gfnma_nvl2(item.INR_DLNG_SHPGOT_AMT),
   	    				BRNO					: gfnma_nvl2(item.BRNO),
   	    				AR_CATEGORY				: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AR_CATEGORY) : gfnma_nvl2(item.LINE2_AR_CATEGORY) ,
   	    				AR_STD_SUPPLY_AMT		: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AR_STD_SUPPLY_AMT) : gfnma_nvl2(item.LINE2_AR_STD_SUPPLY_AMT) ,
   	    				AR_TAX_RATE				: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AR_TAX_RATE) : gfnma_nvl2(item.LINE2_AR_TAX_RATE) ,
   	    				AR_VAT_AMT				: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AR_VAT_AMT) : gfnma_nvl2(item.LINE2_AR_VAT_AMT) ,
   	    				AP_CATEGORY				: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AP_CATEGORY) : gfnma_nvl2(item.LINE2_AP_CATEGORY) ,
   	    				AP_STD_SUPPLY_AMT		: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AP_STD_SUPPLY_AMT) : gfnma_nvl2(item.LINE1_AP_STD_SUPPLY_AMT) ,
   	    				AP_TAX_RATE				: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AP_TAX_RATE) : gfnma_nvl2(item.LINE2_AP_TAX_RATE) ,
   	    				AP_VAT_AMT				: index % 2 == 0 ? gfnma_nvl2(item.LINE1_AP_VAT_AMT) : gfnma_nvl2(item.LINE2_AP_VAT_AMT) ,
   	    				TAX_VAT_AMT2			: gfnma_nvl2(item.ADTN_VAT_AMT2),
   	    				ETC_VAT_AMT2			: gfnma_nvl2(item.RDCTN_ETC_DDC_TXAMT2),
   	    				SUM_TOTAL				: gfnma_nvl2(item.SUM_TXAMT)
    	    		}
    	    		jsonGrdList.push(cursorData);
    	    	});
            	console.log(" jsonGrdList ", jsonGrdList);
            	jsonSubGrdList = gfn_cloneJson(jsonGrdList);
            	grdListGrid.rebuild();
            	grdSubListGrid.rebuild();
            }
        } catch (e) {
        	if (!(e instanceof Error)) {
        		e = new Error(e);
        	}
        	console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
       	}

    }
 
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdListGrid';
        SBGridProperties.id = 'grdListGrid';
        SBGridProperties.jsonref = 'jsonGrdList';
        SBGridProperties.selectmode = 'free';        
        SBGridProperties.mergecells = 'bycol';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['사업장','신고사업장명'],		ref : 'TX_SITE_NM',        	width : '100px',    style : 'text-align:center',    type : 'output'},
            {caption : ['사업장','사업장등록번호'],		ref : 'BRNO',      			width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','구분'],			ref : 'AR_CATEGORY',     	width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','과세표준'],        ref : 'AR_STD_SUPPLY_AMT',  width : '120px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['매출세액','세율'],          	ref : 'AR_TAX_RATE',      	width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','세액'],          	ref : 'AR_VAT_AMT',      	width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['매입세액','구분'],          	ref : 'AP_CATEGORY',      	width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매입세액','과세표준'],        ref : 'AP_STD_SUPPLY_AMT',  width : '100px',  style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['매입세액','세율'],          	ref : 'AP_TAX_RATE',      	width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매입세액','세액'],          	ref : 'AP_VAT_AMT',      	width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['가산세','가산세'],          	ref : 'TAX_VAT_AMT2',      	width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['공제세액','공제세액'],        ref : 'ETC_VAT_AMT2',      	width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['납부세액','납부세액'],        ref : 'SUM_TOTAL',      	width : '150px',  style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['내부거래(판매목적)','반출액'], ref : 'gird1',      			width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['내부거래(판매목적)','반입액'], ref : 'gird2',      			width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : ['신고사업장코드'],				ref : 'TX_SITE_CD',         width : '100px',    style : 'text-align:center',    type : 'output', hidden : true},
        ];
        grdListGrid = _SBGrid.create(SBGridProperties);
    }
 
    const fn_createSubGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSubListGrid';
        SBGridProperties.id = 'grdSubListGrid';
        SBGridProperties.jsonref = 'jsonSubGrdList';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.mergecells = 'bycol';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.fixedrowheight = '0';
        SBGridProperties.columns = [
            {caption : [''], ref : 'gird1',        width : '100px',    style : 'text-align:center',    type : 'output'},
            {caption : [''], ref : 'gird1',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : [''], ref : 'gird1',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : [''], ref : 'AR_STD_SUPPLY_AMT',      width : '120px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'AR_TAX_RATE',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : [''], ref : 'AR_VAT_AMT',      width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'AP_CATEGORY',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : [''], ref : 'AP_STD_SUPPLY_AMT',      width : '100px',  style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'AP_TAX_RATE',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : [''], ref : 'AP_VAT_AMT',      width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'TAX_VAT_AMT2',      width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'ETC_VAT_AMT2',      width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'SUM_TOTAL',      width : '150px',  style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'gird1',      width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'gird1',      width : '100px',   style : 'text-align:right',    type : 'output', format : {type:'number', rule:'#,###'}},
            {caption : [''], ref : 'gird1',        width : '100px',    style : 'text-align:center',    type : 'output', hidden : true},
        ];
        grdSubListGrid = _SBGrid.create(SBGridProperties);
    }
 
    /** 공통버튼 **/
    function cfn_init(){
        fn_reset();
    }
    function fn_reset(){
        jsonGrdList.length = 0;
        grdListGrid.rebuild();
 
        gfnma_multiSelectSet('#src-btn-currencyCode','', '', '');
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
    }
    async function cfn_search() {
        let _value = gfnma_multiSelectGet('#src-btn-currencyCode');
        if(gfn_isEmpty(_value)){
            gfn_comAlert("W0002", "신고구분명");
            return;
        }
        await fn_choice(_value);
    }
    async function fn_setSiteCode() {
        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_YYYY: ''
            , V_P_SEQ: ''
            , V_P_TAX_SITE_CODE: ''
            , V_P_TAX_SITE_NAME: ''
            , V_P_BIZ_REGNO: ''
            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        }
        let postFlag = gfnma_getTableElement("srchTable", "srch-", paramObj, "V_P_", ['taxSiteName', 'bizRegno']);
        paramObj.V_P_SEQ = gfnma_multiSelectGet('#src-btn-currencyCode');
        paramObj.V_P_TAX_SITE_CODE = jsonGrdList[grdListGrid.getRow() - 1].TX_SITE_CD;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2330.do", {
            getType: 'json',
            cv_count: '5',
            workType: 'DETAIL',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
