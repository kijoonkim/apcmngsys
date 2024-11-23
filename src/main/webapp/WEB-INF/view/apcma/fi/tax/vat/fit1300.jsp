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
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>

	<style>
		#dtlTable th {
			text-align: center;
			color: #0e3979;
			background-color: #ceebff;
			border-width: 0px 1px 1px 0px;
			border-style: solid;
			border-color: #e8f1f9
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
        	<div class="box-search-ma">
	            <!--[APC] START -->
	            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	            <!--[APC] END -->
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
	                    <th scope="row" class="th_bg_search">기준연도</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
	                        <sbux-datepicker
	                        	id="srch-dtp-yyyy" 
	                        	name="srch-dtp-yyyy" 
	                        	uitype="popup" 
	                        	datepicker-mode="year"
	                        	date-format="yyyy"
	                        	class="table-datepicker-ma inpt_data_reqed"
	                        ></sbux-datepicker>
	                    </td>
						<td></td>
	                    <th scope="row" class="th_bg_search">신고구분명</th>
	                    <td colspan="14" class="td_input" style="border-top: hidden;">
	                        <div style="display: flex;gap: 5px">
	                            <div class="dropdown">
	                                <button 
	                                	style="width:200px;text-align:left" 
	                                	class="btn btn-sm btn-light dropdown-toggle" 
	                                	type="button" 
	                                	id="srch-ddm-seq" 
	                                	data-toggle="dropdown" 
	                                	aria-haspopup="true" 
	                                	aria-expanded="false"
	                                >
	                                    <font>선택</font>
	                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                </button>
	                                <div 
	                                	class="dropdown-menu" 
	                                	aria-labelledby="srch-ddm-seq" 
	                                	style="width:750px;height:150px;padding-top:0px;overflow:auto"
	                                ></div>
	                            </div>
	                            <sbux-input
	                            	readonly 
	                            	id="srch-inp-termFr"
	                            	name="srch-inp-termFr"
	                            	uitype="text" 
	                            	class="form-control input-sm"
	                            ></sbux-input>
	                            <p style="text-align: center;line-height: 30px">~</p>
	                            <sbux-input
	                            	readonly 
	                            	id="srch-inp-termTo" 
	                            	name="srch-inp-termTo" 
	                            	uitype="text" 
	                            	class="form-control input-sm"
	                            ></sbux-input>
	                        </div>
	                    </td>
	                </tr>
	                </tbody>
	            </table>
	        </div>
	        <div class="row" style="min-height: 600px;">
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
	                <thead>
		                <tr>
		                    <th rowspan="4" class="">
		                        사업장명
		                    </th>
		                    <th rowspan="4" class="">
		                        총건수
		                    </th>
		                    <th rowspan="4" class="">
		                        총공급가액
		                    </th>
		                    <th rowspan="4" class="">
		                        총세액
		                    </th>
		                    <th rowspan="4" class="">
		                        납부세액<br>(환급세액)
		                    </th>
		                    <th rowspan="4" class="">
		                        부가세신고<br>서확정여부
		                    </th>
		                    <th colspan="6" class="">
		                        부가가치세 부속서류 첨부여부
		                    </th>
		                </tr>
		                <tr>
		                    <th>매출세금계산서</th>
		                    <th>매출계산서</th>
		                    <th>영세율첨부</th>
		                    <th>신용카드매출</th>
		                    <th>수출실적명세</th>
		                    <th>내국신용장</th>
		                </tr>
		                <tr>
		                    <th>매입세금계산서</th>
		                    <th>매입계산서</th>
		                    <th>의제매입명세</th>
		                    <th>건물등감가상각</th>
		                    <th>불공제매입명세</th>
		                    <th>신용카드수령</th>
		                </tr>
		                <tr>
		                    <th>영세율매출명세</th>
		                    <th>대손세액공제</th>
		                    <th>사업장별납부</th>
		                    <th>단위과세사업장</th>
		                    <th>과표및세액경정</th>
		                    <th>과표및수정</th>
		                </tr>
	                </thead>
	                <tbody></tbody>
	            </table>
	   		</div>
		</div>
	</div>
</section>
</body>

<script type="text/javascript">

	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	//-----------------------------------------------------------
	
	
	//초기화
	function cfn_init() {
		fn_init();
	}
	
	// 신규
	function cfn_add() {
	    fn_create();
	}
	
	// 저장
	function cfn_save() {
	    fn_save();
	}
	
	// 삭제
	function cfn_del() {
		fn_delete();
	}
	
	// 조회
	function cfn_search() {
	    fn_search();
	}

	var jsonVatDclr = [];
	var jsonSmmry = [];
	
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

    /**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function() {
    	
        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy', gfn_dateToYear(new Date()));
        
        await fn_initSBSelect();

		jsonSmmry.length = 0;
		fn_setVatTable();

    }
    
	/**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
		
		// 코드정보 설정
		let result = await Promise.all([

	    	gfnma_setComSelect(['_'], jsonVatDclr, 'L_FIT030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SEQ', 'VAT_TYPE_NAME', 'Y', ''),

			/** 신고구분명 select **/
			gfnma_multiSelectInit({
		            target			: ['#srch-ddm-seq']
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
		                {caption: "부가세유형",			ref: 'VAT_TYPE_NAME', 		width:'180px',  	style:'text-align:left'},
		                {caption: "신고기준시작월", 	ref: 'STANDARD_TERM_FR',    width:'150px',  	style:'text-align:left'},
		                {caption: "신고기준종료월", 	ref: 'STANDARD_TERM_TO',    width:'150px',  	style:'text-align:left'},
		                {caption: "총괄납부사업장번호", ref: 'UNIT_NO',    			width:'180px',  	style:'text-align:left'},
		                {caption: "단위과세번호", 		ref: 'WHOLE_PAY_SITE_NO',   width:'150px',  	style:'text-align:left'},
		                {caption: "확정여부", 			ref: 'CONFIRM_YN',    		width:'150px',  	style:'text-align:left'},
		                {caption: "SEQ", 				ref: 'SEQ',    				width:'150px',  	style:'text-align:left;display:none',}
		            ]
		            ,callback       : function(_seq) {
		            	fn_setSrchSeq(_seq);
		            }
		        })			
			
			]);

	}
    
	
	const fn_setSrchSeq = async function(_seq) {
		
		if (gfn_isEmpty(_seq)) {
			SBUxMethod.set('srch-inp-termFr', '');
			SBUxMethod.set('srch-inp-termTo', '');
		} else {
			const vatType = _.find(jsonVatDclr, {SEQ: _seq});
			
			if (!gfn_isEmpty(vatType)) {
				SBUxMethod.set('srch-inp-termFr', vatType['STANDARD_TERM_FR']);
				SBUxMethod.set('srch-inp-termTo', vatType['STANDARD_TERM_TO']);
			}
			
			fn_search();	
		}
	}
	
	
	/**
     * @name fn_search
     * @description 조회
     */
	const fn_search = async function() {
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		
        if (gfn_isEmpty(seq)){
            gfn_comAlert("W0002", "신고구분명");
            return;
        }
        
        jsonSmmry.length = 0;
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY 			: yyyy,
                V_P_SEQ				: seq,
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit1300.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });
        
        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonSmmry.length = 0;
                listData.cv_1.forEach((item, index) => {
                    
                	const obj = {
               			TAX_SITE_CODE: item.TAX_SITE_CODE,
               			TAX_SITE_NAME: item.TAX_SITE_NAME,
               			BIZ_REGNO: item.BIZ_REGNO,
               			TOTAL_CNT: item.TOTAL_CNT,
               			TOTAL_SUPPLY_AMT: item.TOTAL_SUPPLY_AMT,
               			TOTAL_VAT_AMT: item.TOTAL_VAT_AMT,
               			AR_SUM_AMT: item.AR_SUM_AMT,
               			PAY_VAT_AMT: item.PAY_VAT_AMT,
               			REPORT_CONFIRM_YN: item.REPORT_CONFIRM_YN,
               			AR_TAX_BILL_YN: item.AR_TAX_BILL_YN,
               			AR_BILL_YN: item.AR_BILL_YN,
               			AR_ZERO_TAX_YN: item.AR_ZERO_TAX_YN,
               			AR_CARD_YN: item.AR_CARD_YN,
               			AR_EXPORT_YN: item.AR_EXPORT_YN,
               			AR_CREDIT_YN: item.AR_CREDIT_YN,
               			AP_TAX_BILL_YN: item.AP_TAX_BILL_YN,
               			AP_BILL_YN: item.AP_BILL_YN,
               			AP_DEEMED_YN: item.AP_DEEMED_YN,
               			AP_ASSET_YN: item.AP_ASSET_YN,
               			AP_NONDED_YN: item.AP_NONDED_YN,
               			AP_CARD_YN: item.AP_CARD_YN,
               			AR_ZERO_SALES_YN: item.AR_ZERO_SALES_YN,
               			BADDEBT_YN: item.BADDEBT_YN,
               			TAXSITE_BASE_YN: item.TAXSITE_BASE_YN,
               			TAX_UNIT_YN: item.TAX_UNIT_YN,
               			SUPPLEMENT_YN: item.SUPPLEMENT_YN,
               			AMENDED_YN: item.AMENDED_YN,
                    }
                	
                	jsonSmmry.push(obj);
                });
                
                fn_setVatTable();
                
            } else {
                alert(listData.resultMessage);
            }
            
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}
	
	const fn_setVatTable = function() {
		
		let tbody = document.querySelector("#dtlTable tbody");

		tbody.remove();

		/*
		while (tbody.firstChild) {
			console.log("tbody.firstChild", tbody.firstChild);
			console.log("tbody.lastChild", tbody.firstChild);
			let removed = tbody.removeChild(tbody.firstChild);
			
			console.log("removed", removed);
		}
		 */
		/*
		jsonSmmry.length = 0;
		
		jsonSmmry.push({
			TAX_SITE_CODE: "111",
			TAX_SITE_NAME: "그린에어주식회사",
			BIZ_REGNO: "",
			TOTAL_CNT: 529,
			TOTAL_SUPPLY_AMT: 111,
			TOTAL_VAT_AMT: 222,
			AR_SUM_AMT: 333,
			PAY_VAT_AMT: 444,
			REPORT_CONFIRM_YN: "Y",
			AR_TAX_BILL_YN: "O",
			AR_BILL_YN: "X",
			AR_ZERO_TAX_YN: "X",
			AR_CARD_YN: "O",
			AR_EXPORT_YN: "",
			AR_CREDIT_YN: "",
			AP_TAX_BILL_YN: "",
			AP_BILL_YN: "",
			AP_DEEMED_YN: "",
			AP_ASSET_YN: "",
			AP_NONDED_YN: "",
			AP_CARD_YN: "",
			AR_ZERO_SALES_YN: "",
			BADDEBT_YN: "",
			TAXSITE_BASE_YN: "",
			TAX_UNIT_YN: "",
			SUPPLEMENT_YN: "",
			AMENDED_YN: "",
		});
		*/
		const dtlTable = document.querySelector("#dtlTable");
		
		tbody = document.createElement("tbody");
		
		jsonSmmry.forEach(function(item){
			
			let tr = document.createElement("tr");
			tr.style.textAlign = "center";
			
			let td = document.createElement("td");
			td.rowSpan = 3;
			td.innerText = item.TAX_SITE_NAME;
			tr.appendChild(td);
			
			td = document.createElement("td");
			td.rowSpan = 3;
			td.innerText = item.TOTAL_CNT;
			tr.appendChild(td);
			
			td = document.createElement("td");
			td.rowSpan = 3;
			td.innerText = item.TOTAL_SUPPLY_AMT.toLocaleString();
			tr.appendChild(td);
			
			td = document.createElement("td");
			td.rowSpan = 3;
			td.innerText = item.TOTAL_VAT_AMT.toLocaleString();
			tr.appendChild(td);
			
			td = document.createElement("td");
			td.rowSpan = 3;
			td.innerText = item.PAY_VAT_AMT.toLocaleString();
			tr.appendChild(td);
			
			td = document.createElement("td");
			td.rowSpan = 3;
			td.innerText = item.REPORT_CONFIRM_YN;
			tr.appendChild(td);
			
			td = document.createElement("td");
			td.innerText = item.AR_TAX_BILL_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AR_BILL_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AR_ZERO_TAX_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AR_CARD_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AR_EXPORT_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AR_CREDIT_YN;
			tr.appendChild(td);
			
			tbody.appendChild(tr);

			tr = document.createElement("tr");
			tr.style.textAlign = "center";
			td = document.createElement("td");
			td.innerText = item.AP_TAX_BILL_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AP_BILL_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AP_DEEMED_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AP_ASSET_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AP_NONDED_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AP_CARD_YN;
			tr.appendChild(td);
			
			tbody.appendChild(tr);
			
			tr = document.createElement("tr");
			tr.style.textAlign = "center";
			td = document.createElement("td");
			td.innerText = item.AR_ZERO_SALES_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.BADDEBT_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.TAXSITE_BASE_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.TAX_UNIT_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.SUPPLEMENT_YN;
			tr.appendChild(td);
			td = document.createElement("td");
			td.innerText = item.AMENDED_YN;
			tr.appendChild(td);

			tbody.appendChild(tr);
			
			/*
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
			//tbody.appendChild(el);
          */
		});
		
		dtlTable.appendChild(tbody);
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

    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>