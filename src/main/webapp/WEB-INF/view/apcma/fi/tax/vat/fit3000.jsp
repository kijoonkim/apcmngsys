<%
    /**
     * @Class Name 		: fit3000.jsp
     * @Description 	: 부가세전자신고파일생성 화면
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
    <title>title : 부가세전자신고파일생성</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
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
                        <sbux-datepicker
                        	id="srch-dtp-yyyy" 
                        	name="srch-dtp-yyyy" 
                        	uitype="popup" 
                        	datepicker-mode="year"
                        	date-format="yyyy"
                        	class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                        ></sbux-datepicker>
                    </td>

                    <th scope="row" class="th_bg">신고구분명</th>
                    <td colspan="7" class="td_input" style="border-top: hidden;">
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
                <tr>
                    <th scope="row" class="th_bg">신고사업장</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-input
                        	id="srch-inp-taxSiteName" 
                        	name="srch-inp-taxSiteName" 
                        	uitype="text" 
                        	class="form-control input-sm" 
                        ></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input 
                        	id="srch-inp-bizRegno" 
                        	name="srch-inp-bizRegno" 
                        	uitype="text" 
                        	class="form-control input-sm" 
                        ></sbux-input>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <div style=" height: 80vh; display: flex">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdTaxSite" style="height: 528px; width: 100%"></div>
                </div>
                <div style="flex: 4;display: flex;flex-direction: column; margin-left: 10px;">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎ 전자신고 생성정보</span></li>
                            </ul>
                        </div>
                        <div style="display: flex; gap: 10px">
                            <div style="flex-basis:65%">
                                <table id="headerTable" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width: 15%">
                                        <col style="width: 35%">
                                        <col style="width: 15%">
                                        <col style="width: 30%">
                                        <col style="width: 5%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="th_cs">신고사업장명</th>
                                        <td class="td_input" style="border-right: hidden">
                                            <sbux-input 
                                            	id="dtl-inp-taxSiteName" 
                                            	name="dtl-inp-taxSiteName" 
                                            	uitype="text" 
                                            	class="form-control input-sm" 
                                            	readonly
                                            ></sbux-input>
                                        </td>
                                        <th scope="row" class="th_cs">사업자번호</th>
                                        <td colspan="2" class="td_input">
                                            <sbux-input 
                                            	id="dtl-inp-bizRegno" 
                                            	name="dtl-inp-bizRegno" 
                                            	uitype="text" 
                                            	class="form-control input-sm" 
                                            	readonly
                                            ></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_cs">홈택스ID</th>
                                        <td class="td_input" style="border-right: hidden">
                                            <sbux-input 
                                            	id="dtl-inp-homeTaxId" 
                                            	name="dtl-inp-homeTaxId" 
                                            	uitype="text" 
                                            	class="form-control input-sm" 
                                            	readonly
                                            ></sbux-input>
                                        </td>
                                        <th scope="row" class="th_cs">제출일</th>
                                        <td colspan="2" class="td_input">
                                            <sbux-datepicker
												uitype="popup" 
												id="dtl-dtp-dataHandoutDate" 
												name="dtl-dtp-dataHandoutDate"
												date-format="yyyy-mm-dd" 
												class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
												wrap-style="border:0;padding:0;"
					                            required
											/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_cs">비고</th>
                                        <td colspan="4" class="td_input">
                                            <sbux-input 
                                            	id="dtl-inp-memo" 
                                            	name="dtl-inp-memo" 
                                            	uitype="text" 
                                            	class="form-control input-sm" 
                                            ></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_cs">파일저장경로</th>
                                        <td colspan="3" class="td_input" style="border-right: hidden">
                                            <sbux-input 
                                            	id="dtl-inp-filePath" 
                                            	name="dtl-inp-filePath" 
                                            	uitype="text" 
                                            	class="form-control input-sm"
                                            	readonly
                                            ></sbux-input>
                                        </td>
                                        <td class="td_input" >
                                        	<sbux-button
			                                	id="btn-filePath"
			                                        name="btn-filePath"
			                                        uitype="normal"
			                                        class=""
			                                        text="..."
			                                        onclick="fn_pickFilePath"
			                                        style="width:100%;"
			                                ></sbux-button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <sbux-button
                                	id="btn-makeFile"
                                        name="btn-makeDocFile"
                                        uitype="normal"
                                        style="width: 170px;margin-left: calc(100% - 173px);"
                                        class="btn btn-sm btn-outline-danger"
                                        text="전자신고 파일생성"
                                        onclick="fn_makeDocFile"
                                        
                                ></sbux-button>
                            </div>
                            <div style="display: grid;grid-template-rows: repeat(4, 1fr); grid-template-columns: repeat(2,minmax(100px, 1fr)); grid-auto-flow: column; gap: 5px;">
                                <sbux-button
                                        id="btn-file-taxBillAr"
                                        name="btn-file-taxBillAr"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="매출 세금계산서"
                                        onclick="fn_fileTaxBillAr"
                                ></sbux-button>
                                <sbux-button
                                        id="btn-file-bill"
                                        name="btn-file-bill"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="매출/매입 계산서"
                                        onclick="fn_fileBill"
                                ></sbux-button>
                                <sbux-button
                                        id="btn-file-card"
                                        name="btn-file-card"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="신용카드매출전표등수령명세서"
                                        onclick="fn_fileCard"
                                ></sbux-button>
                                <sbux-button
                                        id="btn-file-export"
                                        name="btn-file-export"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="수출실적명세서"
                                        onclick="fn_fileExport"
                                ></sbux-button>
                                <sbux-button
                                        id="btn-file-taxBillAp"
                                        name="btn-file-taxBillAp"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="매입 세금계산서"
                                        onclick="fn_fileTaxBillAp"
                                ></sbux-button>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎ 첨부 신고서류 리스트</span></li>
                            </ul>
                        </div>
                        <div id="sb-area-grdDoc" style="width: 50%"></div>
                    </div>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎ 전자신고 파일생성 로그</span></li>
                            </ul>
                        </div>
                        <div id="sb-area-grdFileLog" style="width: 100%"></div>
                    </div>
                </div>
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
	
	
	var jsonVatType = [];
	
	
	var grdTaxSite;
	var jsonTaxSite = [];
	
	var jsonSiteInfo = [];
	
	var grdDoc;
	var jsonDoc = [];
	var grdFileLog;
	var jsonFileLog = [];

	
	var jsonVatContents = [];
	var jsonVatRepDetailType = [];
	
	const siteElmts = [
		{"type": "string", "col": "TAX_SITE_NAME", 		"elmt": "dtl-inp-taxSiteName"},
		{"type": "string", "col": "BIZ_REGNO", 			"elmt": "dtl-inp-bizRegno"},
		{"type": "string", "col": "HOME_TAX_ID", 		"elmt": "dtl-inp-homeTaxId"},
		{"type": "string", "col": "DATA_HANDOUT_DATE", 	"elmt": "dtl-dtp-dataHandoutDate"},
		{"type": "string", "col": "MEMO", 				"elmt": "dtl-inp-memo"},
		{"type": "string", "col": "BIZ_REGNO", 			"elmt": "dtl-inp-bizRegno"},
	];

	const fn_setSiteInfo = function(_data) {
		
		if (gfn_isEmpty(_data)) {
			_data = {}
		} else {
			
		}
		
		siteElmts.forEach((el) => {
			
			const elType = el.type;
			if (_.isEqual(elType, "string")) {
				SBUxMethod.set(el.elmt, gfn_nvl(_data[el.col]));
			} else {
				SBUxMethod.set(el.elmt, _data[el.col]);
			}
		});
	}
	
	
	
    window.addEventListener("DOMContentLoaded",function(){

        fn_init();

    });
    
    /**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function() {
    	
        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));
        
        await fn_initSBSelect();
        
        fn_createGridTaxSite();
        fn_createGridDoc();
        fn_createGridFileLog();
    }
    
	/**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
  		
		// 코드정보 설정
		let result = await Promise.all([

	    	gfnma_setComSelect(['_'], jsonVatType, 'L_FIT030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SEQ', 'VAT_TYPE_NAME', 'Y', ''),

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
		
		console.log(jsonVatType);
	}
    
	const fn_setSrchSeq = async function(_seq) {
		
		if (gfn_isEmpty(_seq)) {
			SBUxMethod.set('srch-inp-termFr', '');
			SBUxMethod.set('srch-inp-termTo', '');
		} else {
			const vatType = _.find(jsonVatType, {SEQ: _seq});
			
			if (!gfn_isEmpty(vatType)) {
				SBUxMethod.set('srch-inp-termFr', vatType['STANDARD_TERM_FR']);
				SBUxMethod.set('srch-inp-termTo', vatType['STANDARD_TERM_TO']);
			}
			
			fn_search();	
		}
	} 
	
	/**
     * @name fn_createGridTaxSite
     * @description 신고 사업장 그리드 생성
     * @function
     */
    const fn_createGridTaxSite = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdTaxSite';
        SBGridProperties.id = 'grdTaxSite';
        SBGridProperties.jsonref = 'jsonTaxSite';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption: ['신고사업장명'],               
            	ref: 'TAX_SITE_NAME',        
            	width: '50%',    
            	style: 'text-align:center',    
            	type: 'output'
            },
            {
            	caption: ['사업자번호'],          
            	ref: 'BIZ_REGNO',      
            	width: '50%',   
            	style: 'text-align:center',    
            	type : 'output'
            },
        ];
        
        grdTaxSite = _SBGrid.create(SBGridProperties);
    }
    
    
	/**
     * @name fn_createGridDoc
     * @description 첨부 신고서류 리스트 그리드 생성
     * @function
     */
    const fn_createGridDoc = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDoc';
        SBGridProperties.id = 'grdDoc';
        SBGridProperties.jsonref = 'jsonDoc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption: ['연번'],               
            	ref: 'REPORT_SEQ',        
            	width: '10%',    
            	style: 'text-align:center',    
            	type: 'output'
            },
            {
            	caption: ['부가세 서식명'],          
            	ref: 'VAT_REPORT_NAME',      
            	width: '90%',   
            	style: 'text-align:center',    
            	type: 'output'
            },
        ];
        
        grdDoc = _SBGrid.create(SBGridProperties);
    }
	
	
	/**
     * @name fn_createGridFileLog
     * @description 전자신고 파일생성 로그 그리드 생성
     * @function
     */
    const fn_createGridFileLog = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdFileLog';
        SBGridProperties.id = 'grdFileLog';
        SBGridProperties.jsonref = 'jsonFileLog';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ['연번'],               
            	ref : 'CREATE_SEQ',        
            	width : '60px',    
            	style : 'text-align:right',    
            	type : 'output'
            },
            {
            	caption : ['신고사업장명'],          
            	ref : 'TAX_SITE_NAME',      
            	width : '120px',   
            	style : 'text-align:left',    
            	type : 'output'
            },
            {
            	caption : ['제출일자'],          
            	ref : 'DATA_HANDOUT_DATE',      
            	width : '120px',   
            	style : 'text-align:center',    
            	type : 'output'
            },
            {
            	caption : ['생성자ID'],          
            	ref : 'INSERT_USERID',      
            	width : '100px',   
            	style : 'text-align:center',    
            	type : 'output'
            },
            {
            	caption : ['생성일시'],          
            	ref : 'INSERT_TIME',      
            	width : '140px',   
            	style : 'text-align:center',    
            	type : 'output'
            },
            {
            	caption : ['생성자PC'],          
            	ref : 'INSERT_PC',      
            	width : '100px',   
            	style : 'text-align:center',    
            	type : 'output'
            },
            {
            	caption : ['비고'],          
            	ref : 'MEMO',      
            	width : '200px',   
            	style : 'text-align:center',    
            	type : 'output'
            },
        ];
        
        grdFileLog = _SBGrid.create(SBGridProperties);
    }
	
	
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	
		await fn_setGrdTaxSite();
		
		if (jsonTaxSite.length > 0) {
			grdTaxSite.setRow(1);
			fn_setDetail(jsonTaxSite[0]);	
		} else {
			fn_setDetail(null);
		}
	}
		
	
	/**
     * @name fn_setGrdTaxSite
     * @description 신고사업장 조회
     */
	const fn_setGrdTaxSite = async function() {
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		const taxSiteName = gfn_nvl(SBUxMethod.get('srch-inp-taxSiteName'));
		const bizRegno = gfn_nvl(SBUxMethod.get('srch-inp-bizRegno'));
		
        if (gfn_isEmpty(taxSiteName)) {
            gfn_comAlert("W0002", "신고구분명");
            return;
        }
		
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY 			: yyyy,
                V_P_SEQ				: seq,
                V_P_TAX_SITE_CODE	: '',
                V_P_DATA_HANDOUT_DATE	: '',
                V_P_TAX_SITE_NAME	: taxSiteName,
                V_P_BIZ_REGNO		: bizRegno,
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit3000.do", {
            getType				: 'json',
            workType			: 'SITELIST',
            cv_count			: '7',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonTaxSite.length = 0;

                listData.cv_1.forEach((item, index) => {
                    
                	const obj = {
                    	TAX_SITE_CODE	: item.TAX_SITE_CODE,
                        TAX_SITE_NAME	: item.TAX_SITE_NAME,
                        BIZ_REGNO		: item.BIZ_REGNO
                    }
                	
                    jsonTaxSite.push(obj);
                });
                
                grdTaxSite.rebuild();

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
	
	/**
     * @name fn_setDetail
     * @description 첨부신고문서,  조회
     */
	const fn_setDetail = async function(_site) {
		
		if (gfn_isEmpty(_site)) {
			
			jsonSiteInfo.length = 0;
			fn_setSiteInfo(null);
			
			jsonDoc.length = 0;
			grdDoc.rebuild();
			
			jsonFileLog.length = 0;
			grdFileLog.rebuild();
			
			return;
		}
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY 			: yyyy,
                V_P_SEQ				: seq,
                V_P_TAX_SITE_CODE	: _site.TAX_SITE_CODE,
                V_P_DATA_HANDOUT_DATE	: '',
                V_P_TAX_SITE_NAME	: '',
                V_P_BIZ_REGNO		: '',
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit3000.do", {
            getType				: 'json',
            workType			: 'SITEINFO',
            cv_count			: '7',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_2", listData.cv_2);
            	
            	// cv_2 사업장정보
            	jsonSiteInfo.length = 0;

                listData.cv_2.forEach((item, index) => {
                    
                	const obj = {
               			TAX_SITE_NAME		: item.TAX_SITE_NAME,
               			BIZ_REGNO			: item.BIZ_REGNO,
               			HOME_TAX_ID			: item.HOME_TAX_ID,
               			DATA_HANDOUT_DATE	: item.DATA_HANDOUT_DATE,
               			MEMO				: item.MEMO,
               			BIZ_REGNO			: item.BIZ_REGNO,
               			COMPANY_NUM			: item.COMPANY_NUM,
                    }
                	
                	jsonSiteInfo.push(obj);
                });
                
                if (jsonSiteInfo.length > 0) {
                	fn_setSiteInfo(jsonSiteInfo[0]);
                } else {
                	fn_setSiteInfo(null);
                }
                
                // cv_3 첨부서류
                console.log("listData.cv_3", listData.cv_3);

            	jsonDoc.length = 0;
            	
                listData.cv_3.forEach((item, index) => {
                    
                	const obj = {
               			REPORT_SEQ  	: item.REPORT_SEQ,
               			VAT_REPORT_CODE : item.VAT_REPORT_CODE,
               			VAT_REPORT_NAME : item.VAT_REPORT_NAME,
                    }
                	
                	jsonDoc.push(obj);
                });
                
                grdDoc.rebuild();
                
                // cv_4 파일생성로그
                console.log("listData.cv_4", listData.cv_4);

                jsonFileLog.length = 0;
            	
                listData.cv_4.forEach((item, index) => {
                    
                	const obj = {
               			CREATE_SEQ  		: item.CREATE_SEQ,
               			DATA_HANDOUT_DATE   : item.DATA_HANDOUT_DATE,
               			INSERT_USERID   	: item.INSERT_USERID,
               			INSERT_TIME 		: item.INSERT_TIME,
               			INSERT_PC   		: item.INSERT_PC,
               			MEMO    			: item.MEMO,
               			TAX_SITE_NAME   	: item.TAX_SITE_NAME,
                    }
                	
                	jsonFileLog.push(obj);
                });
                
                grdFileLog.rebuild();

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
	
	/**
     * @name fn_setGrdFileLog
     * @description 첨부신고문서,  조회
     */
	const fn_setGrdFileLog = async function() {
		
		const row = grdTaxSite.getRow();
		
		if (row < 1) {
			return;
		}
		
		const rowData = grdTaxSite.getRowData(row);
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY 			: yyyy,
                V_P_SEQ				: seq,
                V_P_TAX_SITE_CODE	: rowData.TAX_SITE_CODE,
                V_P_DATA_HANDOUT_DATE	: '',
                V_P_TAX_SITE_NAME	: '',
                V_P_BIZ_REGNO		: '',
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit3000.do", {
            getType				: 'json',
            workType			: 'CREATELOG',
            cv_count			: '7',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
                // cv_4 파일생성로그
                console.log("listData.cv_5", listData.cv_5);

                jsonFileLog.length = 0;
            	
                listData.cv_5.forEach((item, index) => {
                    
                	const obj = {
               			CREATE_SEQ  		: item.CREATE_SEQ,
               			DATA_HANDOUT_DATE   : item.DATA_HANDOUT_DATE,
               			INSERT_USERID   	: item.INSERT_USERID,
               			INSERT_TIME 		: item.INSERT_TIME,
               			INSERT_PC   		: item.INSERT_PC,
               			MEMO    			: item.MEMO,
               			TAX_SITE_NAME   	: item.TAX_SITE_NAME,
                    }
                	
                	jsonFileLog.push(obj);
                });
                
                grdFileLog.rebuild();

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
	
	
	let dirHandle = undefined;
	
	const files = [];
	
    const fn_getFiles = async (dirHandle, path = dirHandle.name) => {

    	files.length = 0;
        for await (const entry of dirHandle.values()) {
			
          	if (entry.kind === "file") {
          		files.push({
          			name: entry.name
          		});
          	}
		}
        
        console.log("files", files);
        
	};
	
	
	const fn_showDirPicker = async () => {
		
        try {
        	
            dirHandle = await showDirectoryPicker();
            
            console.log("name", dirHandle.name);
            
            if (!dirHandle) {
            	SBUxMethod.set("dtl-inp-filePath", "");
            	return;
            }
            
            SBUxMethod.set("dtl-inp-filePath", dirHandle.name);
            
            fn_getFiles(dirHandle, undefined);
            
        } catch (e) {
            console.log(e);
        }
    };
    
	const fn_pickFilePath = async function() {
		fn_showDirPicker();
	}
	
	
	// 파일생성
	/**
     * @name fn_fileTaxBillAr
     * @description 매출세금계산서 생성
     */
	const fn_fileTaxBillAr = async function() {
		await fn_fileCreate("FILE_TAX_BILL_AR", "K");
	}
	/**
     * @name fn_fileTaxBillAp
     * @description 매입세금계산서 생성
     */
	const fn_fileTaxBillAp = async function() {
		await fn_fileCreate("FILE_TAX_BILL_AP", "K");
	}
	/**
     * @name fn_fileBill
     * @description 매출/매입세금계산서 생성
     */
	const fn_fileBill = async function() {
		await fn_fileCreate("FILE_BILL", "H");
	}
	/**
     * @name fn_fileCard
     * @description 신용카드매출전표등수령명세서 생성
     */
	const fn_fileCard = async function() {
		await fn_fileCreate("FILE_CARD", "J");
	}	
	/**
     * @name fn_fileExport
     * @description 수출실적명세서 생성
     */
	const fn_fileExport = async function() {
		await fn_fileCreate("FILE_EXPORT", "A");
	}
	/**
     * @name fn_fileCreate
     * @description 명세서 파일 생성
     */
	const fn_fileCreate = async function(_workType, _prefix) {
		
		// 파일경로 선택 확인
		if (!dirHandle) {
			gfn_comAlert("W0005", "파일저장경로");		//	W0005	{0}이/가 없습니다.
 			return;
		}
		
		if (jsonTaxSite.length == 0) {
			gfn_comAlert("W0005", "신고사업장");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		
		if (gfn_isEmpty(yyyy)) {
			gfn_comAlert("W0005", "기준연도");			//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (gfn_isEmpty(seq)) {
			gfn_comAlert("W0001", "신고구분명");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "파일생성")) {	//	Q0001 {1} 하시겠습니까?
     		return;
     	}
		
    	const nowDate = new Date();
		const nowYmd = gfn_dateToYmd(nowDate);
		
		let isSuccess = true;
		
		for ( let i=0; i<jsonTaxSite.length; i++ ) {
			
			const taxSite = jsonTaxSite[i];
			const bizRegno = gfn_nvl(taxSite['BIZ_REGNO']).replace("-", "");
			const dataHandoutDate = SBUxMethod.get("dtl-dtp-dataHandoutDate");
			
			const taxSiteCode = taxSite['TAX_SITE_CODE'];
			
			let filename = "";
			switch (_workType) {
				case "FILE_TAX_BILL_AP": 
					filename = _prefix + bizRegno + "." + "per";
					break;
				case "FILE_TAX_BILL_AR":
					filename = _prefix + bizRegno + "." + "sal";
					break;
				default:
					filename = _prefix + bizRegno.substring(0, 7) + "." + bizRegno.substring(7, 3);
					break;
			}
			
			
			
			try {
				
				isSuccess = await fn_getFileContent(_workType, taxSiteCode);
				
				if (isSuccess && jsonVatContents.length == 0) {
					isSuccess = false;
				}
				
				if (isSuccess) {
					
					let contents = "";
					jsonVatContents.forEach((item) => {
						
						if (!gfn_isEmpty(contents)) {
	                		contents += "\n";
	                	}
						
						contents += item.VAT_CONTENTS;
						
					});
					console.log("contents", contents);
					const checkFile = _.find(files, {name: filename});
					
					let needPushFile = false;
					if (!gfn_isEmpty(checkFile)) {
						if (!gfn_comConfirm("Q0002", "동일파일", "덮어쓰기")) {	//	Q0002 {0}이/가 있습니다. {1} 하시겠습니까?
				     		return;
				     	}
						needPushFile = true;
					}
					
					const fileHandle = await dirHandle.getFileHandle(filename, {create: true});
					console.log("fileHandle", fileHandle);
					const writable = await fileHandle.createWritable();
					await writable.write(contents);
					await writable.close();
					
					if (needPushFile) {
						files.push({name: filename});
					}
				}
				
			} catch (e) {
				isSuccess = false;
			} finally {
				// 생성로그 추가
				const insertLog = fn_insertCreateLog(taxSiteCode, isSuccess);
				if (!insertLog) {
					return;
				}
			}
		}
		
		if (isSuccess) {
			gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		}
		
		// 로그조회
		fn_setGrdFileLog();
		
	}
	
	const fn_getFileContent = async function(_workType, _taxSiteCode) {
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY 			: yyyy,
                V_P_SEQ				: seq,
                V_P_TAX_SITE_CODE	: _taxSiteCode,
                V_P_DATA_HANDOUT_DATE	: '',
                V_P_TAX_SITE_NAME	: '',
                V_P_BIZ_REGNO		: '',
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/tax/vat/selectFit3000.do", {
            getType				: 'json',
            workType			: _workType,
            cv_count			: '7',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        jsonVatContents.length = 0;
    	jsonVatRepDetailType.length = 0;
        
        try {
            if (_.isEqual("S", listData.resultStatus)) {

                listData.cv_6.forEach((item, index) => {
                	jsonVatContents.push({
                		VAT_CONTENTS: item.VAT_CONTENTS
                	});
                });
                
                if (_.isEqual(_workType, "FILE")) {
                	
                	listData.cv_7.forEach((item, index) => {
                		jsonVatRepDetailType.push({
                			VAT_REP_DETAIL_TYPE: item.VAT_REP_DETAIL_TYPE
                    	});
                	});
                }
                
                return true;
                
            } else {
                alert(listData.resultMessage);
                return false;
            }
            
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            
            return false;
        }
	}
	
	/**
     * @name fn_makeDocFile
     * @description 전자신고 파일생성 생성
     */
	const fn_makeDocFile = async function() {
		
		// 파일경로 선택 확인
		if (!dirHandle) {
			gfn_comAlert("W0005", "파일저장경로");		//	W0005	{0}이/가 없습니다.
 			return;
		}
		
		if (jsonTaxSite.length == 0) {
			gfn_comAlert("W0005", "신고사업장");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		
		if (gfn_isEmpty(yyyy)) {
			gfn_comAlert("W0005", "기준연도");			//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (gfn_isEmpty(seq)) {
			gfn_comAlert("W0001", "신고구분명");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "전자신고파일생성")) {	//	Q0001 {1} 하시겠습니까?
     		return;
     	}
		
    	const nowDate = new Date();
		const nowYmd = gfn_dateToYmd(nowDate);
		
		let isSuccess = true;
		
		for ( let i=0; i<jsonTaxSite.length; i++ ) {
			
			const taxSite = jsonTaxSite[i];
			const bizRegno = gfn_nvl(taxSite['BIZ_REGNO']).replace("-", "");
			const dataHandoutDate = SBUxMethod.get("dtl-dtp-dataHandoutDate");
			
			const taxSiteCode = taxSite['TAX_SITE_CODE'];
			
			
			try {
				isSuccess = await fn_getFileContent('FILE', taxSiteCode);
				
				if (isSuccess && (jsonVatContents.length == 0 || jsonVatRepDetailType.length == 0)) {
					isSuccess = false;
				}
				
				if (isSuccess) {
					
					let contents = "";
					jsonVatContents.forEach((item) => {
						
						if (!gfn_isEmpty(contents)) {
	                		contents += "\n";
	                	}
						
						contents += item.VAT_CONTENTS;
						
					});
					
					const vatRepDetailType = jsonVatRepDetailType[0].VAT_REP_DETAIL_TYPE;
					
			    	const nowDate = new Date();
					const nowYmd = gfn_dateToYmd(nowDate);
					
					const filename = _prefix + bizRegno + nowYmd + "." + vatRepDetailType;
					
					const checkFile = _.find(files, {name: filename});
					
					let needPushFile = false;
					if (!gfn_isEmpty(checkFile)) {
						if (!gfn_comConfirm("Q0002", "동일파일", "덮어쓰기")) {	//	Q0002 {0}이/가 있습니다. {1} 하시겠습니까?
				     		return;
				     	}
						needPushFile = true;
					}
					
					const fileHandle = await dirHandle.getFileHandle(filename, {create: true});
					console.log("fileHandle", fileHandle);
					const writable = await fileHandle.createWritable();
					await writable.write(contents);
					await writable.close();
					
					if (needPushFile) {
						files.push({name: filename});
					}
				}	
			} catch (e) {
				isSuccess = false;
			} finally {
				// 생성로그 추가
				const insertLog = fn_insertCreateLog(taxSiteCode, isSuccess);
				if (!insertLog) {
					return;
				}
			}
		}
		
		if (isSuccess) {
			gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		}
		
		// 로그조회
		fn_setGrdFileLog();
	}
	
	const download = function (data) {
	    const blob = new Blob([data], { type: 'text/csv' });
	    const url = URL.createObjectURL(blob)

	    const a = document.createElement('a')
	    a.setAttribute('href', url)
	    a.setAttribute('download', '파일이름.txt');
	    a.click()
	}
	
	const fn_insertCreateLog = async function(_taxSiteCode, _isSuccess) {
		
		const yyyy = gfn_nvl(SBUxMethod.get('srch-dtp-yyyy'));
		const seq = gfn_nvl(gfnma_multiSelectGet("#srch-ddm-seq"));
		const dataHandoutDate = gfn_nvl(SBUxMethod.get("dtl-dtp-dataHandoutDate"));
		const memo = gfn_nvl(SBUxMethod.get('dtl-inp-memo')) + (_isSuccess ? "" : " 생성실패");
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_YYYY 			: yyyy,
                V_P_SEQ				: seq,
                V_P_TAX_SITE_CODE	: _taxSiteCode,
                V_P_DATA_HANDOUT_DATE	: dataHandoutDate,
                V_P_MEMO            : memo,
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID		: '',
                V_P_PC			: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/insertFit3000S.do", {
            getType				: 'json',
            workType			: 'N',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

		const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
				return true;
            } else {
                alert(resoponseData.resultMessage);
                return false;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            
            return false;
        }
	}
	
	
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
