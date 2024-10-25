<%
/**
 * @Class Name 		: trl1010.jsp
 * @Description 	: 차입금거래전표생성 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.10.17
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.10.17   	장성주		최초 생성
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
	<title>title : 차입금거래전표생성</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 차입금거래전표생성 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table id="srchArea1" class="table table-bordered tbl_fixed">
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
                            <th scope="row" class="th_bg">사업단위</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">입출금계좌</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_OUT_ACCOUNT_NO" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1()"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_OUT_ACCOUNT_NM" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        
                            <th scope="row" class="th_bg">년월</th>
                            <td colspan="3" class="td_input" >
								<sbux-datepicker
								        id="FM_PERIOD_YYYYMM_P"
								        uitype="popup"
								        datepicker-mode="month"
								        date-format="yyyy-mm"
								        style="width:100px"
								        class="form-control input-sm input-sm-ast inpt_data_reqed" >
								</sbux-datepicker>                            
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">금융기관</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_BANK_CODE" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup2('1')"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_BANK_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        
                            <th scope="row" class="th_bg">차입금거래유형</th>
                            <td colspan="3" class="td_input" >
					            <sbux-select id="FM_TXN_TYPE" uitype="single" jsondata-ref="jsonTxnType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg"></th>
                            <td colspan="3" class="td_input" >
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="row">
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>차입금상환계획</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid_top" style="height:180px; width:100%;"></div>
                        </div>
                    </div>
                
                    <div class="col-sm-6" style="width:100%;padding-top:10px">
					
					    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
		                   title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2"
		                   title-text-array = "자금실적^회계처리"
		                   title-target-value-array="1^2"
		                   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>					
						
						<div class="tab-content" style="height:320px;width:100%;padding-top:0px" >
						
							<div id="SB_TOP_TAB1" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>자금실적</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div>
		                            <div id="sb_area_grid1" style="height:260px; width:100%;"></div>
		                        </div>
							</div>
						
							<div id="SB_TOP_TAB2" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>회계처리</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div>
		                            <div id="sb_area_grid2" style="height:260px; width:100%;"></div>
		                        </div>
							</div>
							
						</div>					
						
					</div>
        		
        		</div>
        	</div>	
        </div>
        			
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup3">
    	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_languageID	= '${loginVO.maLanguageID}';
	//-----------------------------------------------------------

	var p_sel_rowData =  null;
	
    //grid 초기화
    var Trl2010GridTop; 			// 그리드를 담기위한 객체 선언
    var jsonTrl2010Top 	= []; 		// 그리드의 참조 데이터 주소 선언
    
    var Trl2010GridTab1; 			// 그리드를 담기위한 객체 선언
    var jsonTrl2010Tab1	= []; 		// 그리드의 참조 데이터 주소 선언
    
	var jsonFiOrgCode		= [];	// 사업단위
	var jsonTxnType			= [];	// 차입금거래유형
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],		jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 차입금거래유형
            gfnma_setComSelect(['FM_TXN_TYPE'],			jsonTxnType, 		'L_FIM083', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state('L');
  		
		fn_createTrl2010GridTop();
		fn_createTrl2010GridTab1();
		fn_createTrl2010GridTab2();
		//cfn_search();
	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    });

    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    
// 		SBUxMethod.attr('FM_VAT_TYPE_CODE', 	'readonly', true);
    	
//     	if(type=='L'){
// 			$('#main-btn-new', parent.document).attr('disabled', true);
// 			$('#main-btn-save', parent.document).attr('disabled', true);
// 			$('#main-btn-del', 	parent.document).attr('disabled', true);
// 			//fn_fmDisabled(true);
//     	} else if(type=='N'){
//     		SBUxMethod.attr('SCH_DEPRECIATION_METHOD2', 		'readonly', false);
//     		$('#main-btn-save', parent.document).attr('disabled', false);
//     		$('#main-btn-del', 	parent.document).attr('disabled', false);
// 			//fn_fmDisabled(false);
//     	}
    }    
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
 		fn_state('L');
    	//fn_setTrl2010GridTop('LIST');
    }
    
    function fn_createTrl2010GridTop() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_top';
	    SBGridProperties.id 				= 'Trl2010GridTop';
	    SBGridProperties.jsonref 			= 'jsonTrl2010Top';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozencols 		= 12;
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [21,23,24,25,26,27,29,30]
                },
                grandtotalrow : {
                    titlecol 		: 20,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["거래유형"],			ref: 'TXN_TYPE', 				type:'output',  	width:'80px',	  	style:'text-align:left'},
            {caption: ["금융기관"], 		ref: 'BANK_CS_CODE',  		  	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["기간"], 			ref: 'PERIOD_CODE', 		   	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차입금번호"],		ref: 'LOAN_NUM',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차입금명"],			ref: 'LOAN_NAME',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["상환예정일"],		ref: 'REPAY_PLAN_DATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"],				ref: 'PLAN_SEQ',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["id"],				ref: 'TXN_ID',					type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["확정여부"], 		ref: 'CONFIRM_FLAG', 			type: 'checkbox', 	width:'100px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["자금등록여부"], 	ref: 'ACCOUNT_COMPLETE_FLAG', 	type: 'checkbox', 	width:'120px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            
            {caption: ["통화"],				ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급방법"],			ref: 'PAY_METHOD',				type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["자동이체"], 		ref: 'PREAUTH_PAY_YN', 			type: 'checkbox', 	width:'100px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            
            {caption: ["입출금계좌"],		ref: 'OUT_ACCOUNT_NO',			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["환율"],				ref: 'EXCHANGE_RATE',			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["부서"],				ref: 'DEPT_CODE',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원가중심점"],		ref: 'COST_CENTER_CODE',		type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["차입금(원래)"],		ref: 'LOAN_AMT_O',					type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["차입금(환산)"],		ref: 'LOAN_AMT_F',					type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상환원금(환산)"],	ref: 'REPAY_PLAN_AMT_F',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상환후잔액(환산)"],	ref: 'REMAIN_LOAN_AMT_F',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["이자금액(환산)"],	ref: 'INTEREST_REPAY_PLAN_AMT_F',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["총상환액(환산)"],	ref: 'TOTAL_REPAY_PLAN_AMT_F',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["환차손익"],			ref: 'FOREIGN_EXCHANGE_PL',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상환원금(환산전)"],	ref: 'REPAY_PLAN_AMT_BEFORE',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상환원금"],			ref: 'REPAY_PLAN_AMT_O',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상환후 잔액"],		ref: 'REMAIN_LOAN_AMT_O',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["이자금액"],			ref: 'INTEREST_REPAY_PLAN_AMT_O',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["총상환액"],			ref: 'TOTAL_REPAY_PLAN_AMT_O',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},

            {caption: ["이자율"],			ref: 'INTEREST_RATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["시작일"],			ref: 'INTEREST_FROM_DATE',		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["종료일"],			ref: 'INTEREST_TO_DATE',		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Trl2010GridTop = _SBGrid.create(SBGridProperties);
        //Trl2010GridTop.bind('click', 			'fn_viewTrl2010GridTopEvent');
    }
    
    function fn_createTrl2010GridTab1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Trl2010GridTab1';
	    SBGridProperties.jsonref 			= 'jsonTrl2010Tab1';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["id"],				ref: 'TREASURY_ID', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자금배치번호"], 	ref: 'TREASURY_BATCH_NO', 	  	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["순번"],				ref: 'TREASURY_LINE_NUM', 	   	type:'output',  	width:'80px',	  	style:'text-align:left'},
            {caption: ["지급일"],			ref: 'PAY_DATE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급예정일"],		ref: 'PLANNED_PAY_DATE',		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래유형"],			ref: 'TXN_GROUP_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처"],			ref: 'PAYER_ID',				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["전표유형"],			ref: 'DOC_TYPE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["출금은행"],			ref: 'BANK_CODE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["출금계좌"],			ref: 'ACCOUNT_NUM',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["지급방법"],			ref: 'PAY_METHOD',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급방식"],			ref: 'TR_PAY_METHOD',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["상태"],				ref: 'STATUS_CODE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환산유형"],			ref: 'EXCHANGE_TYPE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],				ref: 'EXCHANGE_RATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["통화금액"],			ref: 'ORIGINAL_CR_AMT',			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"],			ref: 'FUNCTIONAL_CR_AMT',		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고"],				ref: 'ETC',						type:'output',  	width:'300px',  	style:'text-align:left'},
        ];

        Trl2010GridTab1 = _SBGrid.create(SBGridProperties);
        //Trl2010GridTab1.bind('click', 			'fn_viewTrl2010GridTab1Event');
    }
    
    function fn_createTrl2010GridTab2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid2';
	    SBGridProperties.id 				= 'Trl2010GridTab2';
	    SBGridProperties.jsonref 			= 'jsonTrl2010Tab2';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표유형"],			ref: 'DOC_TYPE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표번호"], 		ref: 'DOC_NAME', 			  	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["전표상태"],			ref: 'DOC_STATUS', 			   	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"],				ref: 'ITEM_SEQ',				type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["TYPE"],				ref: 'LINE_TYPE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차/대"],			ref: 'DEBIT_CREDIT',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형"],		ref: 'VAT_NAME',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["계정코드"],			ref: 'ACCOUNT_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"],		ref: 'ACCOUNT_NAME',			type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["차변(원래)"],		ref: 'ORIGINAL_DR_AMT',			type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대편(원래)"],		ref: 'ORIGINAL_CR_AMT',			type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["차변(환산)"],		ref: 'FUNCTIONAL_DR_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(환산)"],		ref: 'FUNCTIONAL_CR_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["원가중심점"],		ref: 'COST_CENTER_CODE',		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["부서"],				ref: 'DEPT_NAME',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["환율유형"],			ref: 'EXCHANGE_TYPE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],				ref: 'EXCHANGE_RATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Trl2010GridTab2 = _SBGrid.create(SBGridProperties);
        //Trl2010GridTab2.bind('click', 			'fn_viewTrl2010GridTab2Event');
    }
    
    /**
     * 입출금계좌 
     */
     function fn_compopup1() {
    	
         var searchCode 		= gfnma_nvl(SBUxMethod.get("SCH_OUT_ACCOUNT_NO"));
         var searchName 		= gfnma_nvl(SBUxMethod.get("SCH_OUT_ACCOUNT_NM"));
         
         var replaceText0 		= "_DEPOSIT_CODE_";
         var replaceText1 		= "_DEPOSIT_NAME_";
         var strWhereClause 	= "AND DEPOSIT_CODE LIKE '%" + replaceText0 + "%' AND DEPOSIT_NAME LIKE '%" + replaceText1 + "%'";

         SBUxMethod.attr('modal-compopup1', 'header-title', '계좌정보(예적금원장) 정보');
         SBUxMethod.openModal('modal-compopup1');
         compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_DEPOSIT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["예적금코드", 	"계좌번호" ]
            ,searchInputFields		: ["DEPOSIT_CODE", 	"DEPOSIT_NAME"]
         	,searchInputValues		: [searchCode, 		searchName]
         	,width					: '700px'
         	,height					: '500px'
            ,tableHeader			: ["예적금코드", 	"예적금명", 	"계좌번호", "계좌유형", "금융기관코드", "금융기관명", "수금자금수지", "수금계정", "수금계정명", "수수료계정", "수수료계정명", "통화코드", "은행코드"]
            ,tableColumnNames		: ["DEPOSIT_CODE" , "DEPOSIT_NAME", "ACCOUNT_NUM", "DEPOSIT_TYPE", "BANK_CS_CODE", "BANK_CS_NAME", "RECEIPT_TR_TYPE", "RECEIPT_ACCOUNT", "RECEIPT_ACCOUNT_NAME", "FEE_ACCOUNT", "FEE_ACCOUNT_NAME", "CURRENCY_CODE", "BANK_CODE"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"140px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                 console.log('callback data:', data);
                 SBUxMethod.set('SCH_OUT_ACCOUNT_NO', data.DEPOSIT_CODE);
                 SBUxMethod.set('SCH_OUT_ACCOUNT_NM', data.ACCOUNT_NUM);
            },
         });
     }  
    
     /**
      * 금융기관 
      */
     function fn_compopup2(type) {
     	
         var searchText1 	= '';
         var searchText2 	= '';
         if(type=='1'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_BANK_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_BANK_NAME"));
         } else if(type=='2'){
         }        
         
         var replaceText0 		= "_CS_CODE_";
         var replaceText1 		= "_CS_NAME_";
         var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.CS_NAME LIKE '%" + replaceText1 + "%' ";
     	
     	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_CS_BANK'
         	,popupType				: 'A'
     		,whereClause			: strWhereClause
   			,searchCaptions			: ["거래처코드", 	"거래처명칭"]
   			,searchInputFields		: ["CS_CODE", 		"CS_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
     		,width					: '700px'
     		,height					: '400px'
   			,tableHeader			: ["거래처코드",	"거래처명",		"은행코드",		"은행명",		"사업자번호",		"주소"]
   			,tableColumnNames		: ["CS_CODE", 	 	"CS_NAME",		"BANK_CODE",	"BANK_NAME",	"BIZ_REGNO",		"ADDRESS"]
   			,tableColumnWidths		: ["100px", 		 "250px",		"100px",		"100px",		"150px",			"300px"]
 			,itemSelectEvent		: function (data){
 		        if(type=='1'){
 					SBUxMethod.set('SCH_BANK_CODE', 	data.CS_CODE);
 					SBUxMethod.set('SCH_BANK_NAME', 	data.CS_NAME);
 		        } else if(type=='2'){
 		        }
 			},
     	});
     }         
    
     
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>