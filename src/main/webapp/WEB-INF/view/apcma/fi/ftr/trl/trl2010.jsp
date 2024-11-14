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
                    <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="fn_btnConfirm"></sbux-button>
                    <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel"></sbux-button>
                    <sbux-button id="btnInterface" name="btnInterface" uitype="normal" text="자금계획등록" class="btn btn-sm btn-outline-danger" onclick="fn_btnInterface"></sbux-button>
                    <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="자금계획삭제" class="btn btn-sm btn-outline-danger" onclick="fn_btnDelete"></sbux-button>
                </div>
            </div>
            <div class="box-body">

                <div class="box-search-ma">
                    <!--[pp] 검색 -->
                    <!--[APC] START -->
                    <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                    <!--[APC] END -->
                    <table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
                        <caption>검색 조건 설정</caption>
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
                            <th scope="row" class="th_bg_search">년월</th>
                            <td class="td_input">
                                <sbux-datepicker
                                        id="SCH_PERIOD_YYYYMM_P"
                                        uitype="popup"
                                        datepicker-mode="month"
                                        date-format="yyyy-mm"
                                        style="width:100px"
                                        class="table-datepicker-ma inpt_data_reqed">
                                </sbux-datepicker>
                            </td>
                            <td colspan="3" style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg_search">사업단위</th>
                            <td colspan="3" class="td_input">
                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode"
                                             unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg_search">입출금계좌</th>
                            <td class="td_input" data-group="BANK_CS">
                                <sbux-input style="width:100%" id="SCH_OUT_ACCOUNT_NO" uitype="text"
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" data-group="BANK_CS">
                                <sbux-input style="width:100%" id="SCH_OUT_ACCOUNT_NM" uitype="text"
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input" data-group="BANK_CS">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…"
                                        uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup1()"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg_search">금융기관</th>
                            <td class="td_input" data-group="BANK_CODE">
                                <sbux-input style="width:100%" id="SCH_BANK_CODE" uitype="text"
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" data-group="BANK_CODE">
                                <sbux-input style="width:100%" id="SCH_BANK_NAME" uitype="text"
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input" data-group="BANK_CODE">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…"
                                        uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup2('1')"
                                ></sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg_search">차입금거래유형</th>
                            <td colspan="3" class="td_input">
                                <sbux-select id="SCH_TXN_TYPE" uitype="single" jsondata-ref="jsonTxnType"
                                             unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="16" style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>차입금상환계획</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid_top" style="height:280px; width:100%;"></div>
                        </div>
                    </div>
                    <div class="col-sm-6" style="width:100%;padding-top:10px">
					
					    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
		                   title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2"
		                   title-text-array = "자금실적^회계처리"
		                   title-target-value-array="1^2"
		                   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>					
						
						<div class="tab-content" style="height:420px;width:100%;padding-top:0px" >
						
							<div id="SB_TOP_TAB1" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>자금실적</span>
                                            <span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div>
		                            <div id="sb_area_grid1" style="height:360px; width:100%;"></div>
		                        </div>
							</div>
						
							<div id="SB_TOP_TAB2" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>회계처리</span>
                                            <span style="font-size:12px">(조회건수 <span id="listCount3">0</span>건)</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div>
		                            <div id="sb_area_grid2" style="height:360px; width:100%;"></div>
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
	
	var p_ss_languageID	        = '${loginVO.maLanguageID}';
    var p_ss_defaultAcctRule	= '${loginVO.maDefaultAcctRule}';
	//-----------------------------------------------------------

	var p_sel_rowData =  null;

    //var Allcheck1 = "N";
    var p_sel_tab			= 1;
	
    //grid 초기화
    var Trl2010GridTop; 			// 그리드를 담기위한 객체 선언
    var jsonTrl2010Top 	= []; 		// 그리드의 참조 데이터 주소 선언
    
    var Trl2010GridTab1; 			// 그리드를 담기위한 객체 선언
    var jsonTrl2010Tab1	= []; 		// 그리드의 참조 데이터 주소 선언

    var Trl2010GridTab2; 			// 그리드를 담기위한 객체 선언
    var jsonTrl2010Tab2	= []; 		// 그리드의 참조 데이터 주소 선언
    
	var jsonFiOrgCode		= [];	// 사업단위
	var jsonTxnType			= [];	// 차입금거래유형
	var jsonBankCsCode		= [];	// 금융기관
	var jsonPayMethod		= [];	// 지급방법 //L_FIM073_LOAN
	var jsonCostCenterCode	= [];	// 원가중심점 //L_COST_CENTER
	var jsonTxnGroupCode	= [];	// 거래유형 //L_FIM071
	var jsonBankCode	= [];	// 출금은행 //L_BANK_CODE
	var jsonPayerId	= [];	// 거래처 //L_COMP_ID
	var jsonDocType	= [];	// 전표유형 //L_FIM051
	var jsonPayMethodCode	= [];	// 지급방법 //L_FIM081
	var jsonTrPayMethod	= [];	// 지급방식 //L_FIM073
	var jsonStatusCode	= [];	// 상태 //L_FIM074

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE', 'Trl2010GridTop'],		jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 차입금거래유형
            gfnma_setComSelect(['SCH_TXN_TYPE','Trl2010GridTop'], jsonTxnType, 		'L_FIM083', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //금융기관
            gfnma_setComSelect(['Trl2010GridTop'],	jsonBankCsCode,	'L_CS_BANK', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CS_CODE', 'BANK_CS_NAME', 'Y', ''),
            //지급방법
            gfnma_setComSelect(['Trl2010GridTop'],	jsonPayMethod,	'L_FIM073_LOAN', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //원가중심점
            gfnma_setComSelect(['Trl2010GridTop'],	jsonCostCenterCode,	'L_COST_CENTER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //거래유형
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonTxnGroupCode,	'L_FIM071', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //출금은행
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonBankCode,	'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            //거래처
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonPayerId,	'L_COMP_ID', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CS_CODE', 'CS_NAME', 'Y', ''),
            //전표유형
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonDocType,	'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //지급방법
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonPayMethodCode,	'L_FIM081', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //지급방식
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonTrPayMethod,	'L_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            //상태
            gfnma_setComSelect(['Trl2010GridTab1'],	jsonStatusCode,	'L_FIM074', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),


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

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('SCH_PERIOD_YYYYMM_P', openDate);
	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    });

    /**
     * 목록 조회
     */
    function cfn_search() {
        fn_P_TRL2010_Q_LIST('Q', 1);
    }

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
                    sum : [20,21,22,23,24,25,26,27,28,29,30]
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
            {caption : ["거래유형"], ref : 'TXN_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonTxnType',  label : 'label', value : 'value'}/*, disabled: true*/
            },
            {caption : ["금융기관"], ref : 'BANK_CS_CODE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonBankCsCode',  label : 'label', value : 'value'}/*, disabled: true*/
            },
            {caption: ["기간"], 		ref: 'PERIOD_CODE', 		   	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차입금번호"],	ref: 'LOAN_NUM',				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차입금명"],	ref: 'LOAN_NAME',				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ['상환예정일'], ref: 'REPAY_PLAN_DATE', 	    type: 'inputdate', width:'100px',	 style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["순번"],		ref: 'PLAN_SEQ',				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["id"],		ref: 'TXN_ID', 				type:'input',  	width:'80px',	  	style:'text-align:left'},
            {caption: ["확정여부"], 	ref: 'CONFIRM_FLAG', 			type: 'checkbox', 	width:'100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["자금등록여부"], 	ref: 'ACCOUNT_COMPLETE_FLAG', 	type: 'checkbox', 	width:'120px', style: 'text-align:center',
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["통화"],	ref: 'CURRENCY_CODE',  		type:'input',  	width:'250px',  	style:'text-align:right'},


            {caption : ["지급방법"], ref : 'PAY_METHOD', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayMethod',  label : 'label', value : 'value'}/*, disabled: true*/
            },
            {caption: ["자동이체"], 		ref: 'PREAUTH_PAY_YN', 			type: 'checkbox', 	width:'100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["입출금계좌코드"],	ref: 'OUT_DEPOSIT_CODE',	type:'input',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["입출금계좌"],	ref: 'OUT_ACCOUNT_NO',	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],	ref: 'EXCHANGE_RATE',  		type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0.00', emptyvalue:'0'}},
            {caption: ["부서"],	ref: 'DEPT_CODE',	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["원가중심점"], ref : 'COST_CENTER_CODE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonCostCenterCode',  label : 'label', value : 'value'}/*, disabled: true*/
            },
            {caption: ["차입금(원래)"],	ref: 'LOAN_AMT_O',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0,00', emptyvalue:'0'}},
            {caption: ["차입금(환산)"],	ref: 'LOAN_AMT_F',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["상환원금"],	ref: 'REPAY_PLAN_AMT_O',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0,00', emptyvalue:'0'}},
            {caption: ["상환후 잔액"],	ref: 'REMAIN_LOAN_AMT_O',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0,00', emptyvalue:'0'}},
            {caption: ["이자금액"],	ref: 'INTEREST_REPAY_PLAN_AMT_O',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0,00', emptyvalue:'0'}},
            {caption: ["총상환액"],	ref: 'TOTAL_REPAY_PLAN_AMT_O',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0,00', emptyvalue:'0'}},
            {caption: ["상환원금(환산)"],	ref: 'REPAY_PLAN_AMT_F',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["상환원금(환산전)"],	ref: 'REPAY_PLAN_AMT_BEFORE',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0.00', emptyvalue:'0'}},
            {caption: ["상환후잔액(환산)"],	ref: 'REMAIN_LOAN_AMT_F',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["환차손익"],	ref: 'FOREIGN_EXCHANGE_PL',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["이자금액(환산)"],	ref: 'INTEREST_REPAY_PLAN_AMT_F',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["총상환액(환산)"],	ref: 'TOTAL_REPAY_PLAN_AMT_F',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["이자율"],	ref: 'INTEREST_RATE',  type:'input',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0.000', emptyvalue:'0'}},
            {caption: ['시작일'], ref: 'INTEREST_FROM_DATE', 	    type: 'inputdate', width:'200px',	 style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['종료일'], ref: 'INTEREST_TO_DATE', 	    type: 'inputdate', width:'200px',	 style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["회계단위"], ref : 'FI_ORG_CODE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFiOrgCode',  label : 'label', value : 'value'}/*, disabled: true*/, hidden: true
            },
        ];

        Trl2010GridTop = _SBGrid.create(SBGridProperties);
        Trl2010GridTop.bind('click', 'fn_view');
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
            {caption: ["ID"],			ref: 'TREASURY_ID', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자금배치번호"], 	ref: 'TREASURY_BATCH_NO', 	  	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["순번"],				ref: 'TREASURY_LINE_NUM', 	   	type:'output',  	width:'80px',	  	style:'text-align:left'},
            {caption : ["거래유형"], ref : 'TXN_GROUP_CODE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonTxnGroupCode',  label : 'label', value : 'value'}, disabled: true
            },
            {caption : ["출금은행"], ref : 'BANK_CODE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonTxnGroupCode',  label : 'label', value : 'value'}, disabled: true
            },
            {caption: ["출금계좌"],	ref: 'ACCOUNT_NUM',	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["거래처"], ref : 'PAYER_ID', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayerId',  label : 'label', value : 'value'}, disabled: true
            },
            {caption : ["전표유형"], ref : 'DOC_TYPE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayerId',  label : 'label', value : 'value'}, disabled: true
            },
            {caption: ['지급예정일'], ref: 'PLANNED_PAY_DATE', 	    type: 'inputdate', width:'100px',	 style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['지급일'], ref: 'PAY_DATE', 	    type: 'inputdate', width:'100px',	 style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption : ["지급방법"], ref : 'PAY_METHOD', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayMethodCode',  label : 'label', value : 'value'}, disabled: true
            },
            {caption : ["지급방식"], ref : 'TR_PAY_METHOD', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonTrPayMethod',  label : 'label', value : 'value'}, disabled: true
            },
            {caption : ["상태"], ref : 'STATUS_CODE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonStatusCode',  label : 'label', value : 'value'}, disabled: true
            },
            {caption: ["통화"],	ref: 'CURRENCY_CODE', 	   	type:'output',  	width:'80px',	  	style:'text-align:left'},
            {caption: ["환산유형"],	ref: 'EXCHANGE_TYPE', 	   	type:'output',  	width:'80px',	  	style:'text-align:left'},
            {caption: ["환율"],	ref: 'EXCHANGE_RATE',  		type:'output',  	width:'80px',  	style:'text-align:right', format : {type:'number', rule:'#,##0.00', emptyvalue:'0'}},
            {caption: ["통화금액"],	ref: 'ORIGINAL_CR_AMT',  type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["전표금액"],	ref: 'FUNCTIONAL_CR_AMT',  type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
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
        SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [0],
                sum : [10,11,12,13]
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
            {caption: ["전표유형"],			ref: 'DOC_TYPE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표번호"], 		ref: 'DOC_NAME', 			  	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["전표상태"],			ref: 'DOC_STATUS', 			   	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"],				ref: 'ITEM_SEQ',				type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["TYPE"],				ref: 'LINE_TYPE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차/대"],			ref: 'DEBIT_CREDIT',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형"],		ref: 'VAT_NAME',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["계정코드"],			ref: 'ACCOUNT_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"],		ref: 'ACCOUNT_NAME',			type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["차변(원래)"],		ref: 'ORIGINAL_DR_AMT',			type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["대편(원래)"],		ref: 'ORIGINAL_CR_AMT',			type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["차변(환산)"],		ref: 'FUNCTIONAL_DR_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["대변(환산)"],		ref: 'FUNCTIONAL_CR_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            
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


    /**
     * 목록 조회
     */
    const fn_P_TRL2010_Q_LIST = async function (strWorkType, row) {

        let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//사업단위
        let PERIOD_YYYYMM_P = gfn_nvl(SBUxMethod.get("SCH_PERIOD_YYYYMM_P")); 	//년월
        let BANK_CODE 		= gfn_nvl(SBUxMethod.get("SCH_BANK_CODE")); 	//금융기관
        let TXN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_TXN_TYPE")); 	//차입금거래유형


        if (_.isEqual(strWorkType, 'LIST')){
            if (!PERIOD_YYYYMM_P) {
                gfn_comAlert("W0002", "년월");
                return;
            }

        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_FI_ORG_CODE    : FI_ORG_CODE
            ,V_P_PERIOD_CODE    : PERIOD_YYYYMM_P
            ,V_P_BANK_CS_CODE   : BANK_CODE
            ,V_P_LOAN_NUM       : ''
            ,V_P_TXN_TYPE       : TXN_TYPE
            ,V_P_TXN_ID         : 0

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl2010List.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {

            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonTrl2010Top.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN        	        : gfn_nvl(item.CHECK_YN),
                        TXN_ID        	            : gfn_nvl(item.TXN_ID),
                        BANK_CS_CODE                : gfn_nvl(item.BANK_CS_CODE),
                        LOAN_NUM        	        : gfn_nvl(item.LOAN_NUM),
                        LOAN_NAME        	        : gfn_nvl(item.LOAN_NAME),
                        PLAN_SEQ        	        : gfn_nvl(item.PLAN_SEQ),
                        PERIOD_CODE        	        : gfn_nvl(item.PERIOD_CODE),
                        TXN_TYPE        	        : gfn_nvl(item.TXN_TYPE),   //--3:이자상환
                        REPAY_PLAN_DATE             : gfn_nvl(item.REPAY_PLAN_DATE),
                        OUT_DEPOSIT_CODE            : gfn_nvl(item.OUT_DEPOSIT_CODE),
                        OUT_ACCOUNT_NO              : gfn_nvl(item.OUT_ACCOUNT_NO),
                        BANK_CS_CODE                : gfn_nvl(item.BANK_CS_CODE),
                        ACCOUNT_NUM        	        : gfn_nvl(item.ACCOUNT_NUM),
                        CURRENCY_CODE               : gfn_nvl(item.CURRENCY_CODE),
                        EXCHANGE_RATE               : gfn_nvl(item.EXCHANGE_RATE),
                        DEPT_CODE        	        : gfn_nvl(item.DEPT_CODE),
                        COST_CENTER_CODE            : gfn_nvl(item.COST_CENTER_CODE),
                        LOAN_AMT_O        	        : gfn_nvl(item.LOAN_AMT_O),
                        LOAN_AMT_F        	        : gfn_nvl(item.LOAN_AMT_F),
                        REPAY_PLAN_AMT_O        	: gfn_nvl(item.REPAY_PLAN_AMT_O),
                        REMAIN_LOAN_AMT_O        	: gfn_nvl(item.REMAIN_LOAN_AMT_O),
                        REPAY_PLAN_AMT_BEFORE       : gfn_nvl(item.REPAY_PLAN_AMT_BEFORE),
                        FOREIGN_EXCHANGE_PL        	: gfn_nvl(item.FOREIGN_EXCHANGE_PL),
                        INTEREST_DAY        	    : gfn_nvl(item.INTEREST_DAY),
                        INTEREST_REPAY_PLAN_AMT_O   : gfn_nvl(item.INTEREST_REPAY_PLAN_AMT_O),
                        TOTAL_REPAY_PLAN_AMT_O      : gfn_nvl(item.TOTAL_REPAY_PLAN_AMT_O),
                        REPAY_PLAN_AMT_F        	: gfn_nvl(item.REPAY_PLAN_AMT_F),
                        REMAIN_LOAN_AMT_F        	: gfn_nvl(item.REMAIN_LOAN_AMT_F),
                        INTEREST_REPAY_PLAN_AMT_F   : gfn_nvl(item.INTEREST_REPAY_PLAN_AMT_F),
                        TOTAL_REPAY_PLAN_AMT_F      : gfn_nvl(item.TOTAL_REPAY_PLAN_AMT_F),
                        INTEREST_FROM_DATE        	: gfn_nvl(item.INTEREST_FROM_DATE),
                        INTEREST_TO_DATE        	: gfn_nvl(item.INTEREST_TO_DATE),
                        INTEREST_RATE        	    : gfn_nvl(item.INTEREST_RATE),
                        CONFIRM_FLAG        	    : gfn_nvl(item.CONFIRM_FLAG),
                        INTERFACE_FLAG        	    : gfn_nvl(item.INTERFACE_FLAG),
                        COMPLETE_FLAG        	    : gfn_nvl(item.COMPLETE_FLAG),
                        FI_ORG_CODE        	        : gfn_nvl(item.FI_ORG_CODE),
                        ACCOUNT_COMPLETE_FLAG       : gfn_nvl(item.ACCOUNT_COMPLETE_FLAG),
                        PAY_METHOD        	        : gfn_nvl(item.PAY_METHOD),

                    }
                    jsonTrl2010Top.push(msg);
                    totalRecordCount++;
                });

                Trl2010GridTop.rebuild();

                if(jsonTrl2010Top.length > 0) {
                    Trl2010GridTop.clickRow(gfn_nvl(row) == '' ? 1 : row);
                }
                document.querySelector('#listCount').innerText = totalRecordCount;


            } else {
                alert(data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }

    //상세정보 보기
    async function fn_view() {
        var nCol = Trl2010GridTop.getCol();
        var nRow = Trl2010GridTop.getRow();

        if (nCol == -1) {
            return;
        }

        if (nRow == -1) {
            return;
        }

        let gridData = Trl2010GridTop.getRowData(nRow);

        if (_.isEmpty(gridData)){
            return;
        }

        if (_.isEqual(p_sel_tab, 1)){
            fn_P_TRL2010_Q('DETAIL', gridData);
        }else if (_.isEqual(p_sel_tab, 2)){
            fn_P_TRL2010_Q('ACCOUNT', gridData);
        }

    }

    /**
     * 목록 조회
     */
    const fn_P_TRL2010_Q = async function (strWorkType, grdData) {

        let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//사업단위
        let PERIOD_YYYYMM_P = gfn_nvl(SBUxMethod.get("SCH_PERIOD_YYYYMM_P")); 	//년월
        let BANK_CODE 		= gfn_nvl(SBUxMethod.get("SCH_BANK_CODE")); 	//금융기관
        let TXN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_TXN_TYPE")); 	//차입금거래유형

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_FI_ORG_CODE    : FI_ORG_CODE
            ,V_P_PERIOD_CODE    : PERIOD_YYYYMM_P
            ,V_P_BANK_CS_CODE   : gfn_nvl(grdData.BANK_CS_CODE)
            ,V_P_LOAN_NUM       : gfn_nvl(grdData.LOAN_NUM)
            ,V_P_TXN_TYPE       : SCH_TXN_TYPE
            ,V_P_TXN_ID         : gfn_nvl(grdData.TXN_ID)

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl2010List.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {

            if (_.isEqual("S", data.resultStatus)) {

                /*/!** @type {number} **!/
                let totalRecordCount = 0;*/

                if (_.isEqual(strWorkType, 'DETAIL')){

                    /** @type {number} **/
                    let totalRecordCount2 = 0;

                    /**************************** 자금실적 **********************************/
                    jsonTrl2010Tab1.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            TREASURY_ID        	: gfn_nvl(item.TREASURY_ID),
                            TREASURY_BATCH_NO   : gfn_nvl(item.TREASURY_BATCH_NO),  //--배치번호
                            TREASURY_LINE_NUM   : gfn_nvl(item.TREASURY_LINE_NUM),  //--순번
                            TXN_GROUP_CODE      : gfn_nvl(item.TXN_GROUP_CODE),     //--거래유형
                            ACCOUNT_NUM        	: gfn_nvl(item.ACCOUNT_NUM),        //--출금계좌
                            BANK_CODE        	: gfn_nvl(item.BANK_CODE),          //--은행코드
                            PAYER_ID        	: gfn_nvl(item.PAYER_ID),           // --거래처
                            DOC_TYPE        	: gfn_nvl(item.DOC_TYPE),           // --전표유형
                            PLANNED_PAY_DATE    : gfn_nvl(item.PLANNED_PAY_DATE),   // --출금예정일
                            PAY_DATE        	: gfn_nvl(item.PAY_DATE),           //--출금일
                            PAY_METHOD        	: gfn_nvl(item.PAY_METHOD),         //--지급방법
                            TR_PAY_METHOD       : gfn_nvl(item.TR_PAY_METHOD),      //--지급방법
                            CURRENCY_CODE       : gfn_nvl(item.CURRENCY_CODE),      // --통화
                            EXCHANGE_TYPE       : gfn_nvl(item.EXCHANGE_TYPE),      //--환산유형
                            EXCHANGE_RATE       : gfn_nvl(item.EXCHANGE_RATE),      //--환율
                            ORIGINAL_CR_AMT     : gfn_nvl(item.ORIGINAL_CR_AMT),    //---원래금액
                            FUNCTIONAL_CR_AMT   : gfn_nvl(item.FUNCTIONAL_CR_AMT),  //--환산금액

                        }
                        jsonTrl2010Tab1.push(msg);
                        totalRecordCount2++;
                    });

                    Trl2010GridTab1.rebuild();
                    document.querySelector('#listCount2').innerText = totalRecordCount2;

                }else if (_.isEqual(strWorkType, 'ACCOUNT')){

                    /** @type {number} **/
                    let totalRecordCount3 = 0;

                    /**************************** 회계처리 **********************************/
                    jsonTrl2010Tab2.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            KEY_ID        	    : gfn_nvl(item.KEY_ID),
                            ITEM_ID        	    : gfn_nvl(item.ITEM_ID),
                            ITEM_SEQ        	: gfn_nvl(item.ITEM_SEQ),
                            LINE_TYPE        	: gfn_nvl(item.LINE_TYPE),
                            DEBIT_CREDIT        : gfn_nvl(item.DEBIT_CREDIT),
                            VAT_TYPE        	: gfn_nvl(item.VAT_TYPE),
                            VAT_NAME        	: gfn_nvl(item.VAT_NAME),
                            DEPT_CODE        	: gfn_nvl(item.DEPT_CODE),
                            COST_CENTER_CODE    : gfn_nvl(item.COST_CENTER_CODE),
                            PROJECT_CODE        : gfn_nvl(item.PROJECT_CODE),
                            ORIGINAL_CR_AMT     : gfn_nvl(item.ORIGINAL_CR_AMT),
                            ORIGINAL_DR_AMT     : gfn_nvl(item.ORIGINAL_DR_AMT),
                            FUNCTIONAL_CR_AMT   : gfn_nvl(item.FUNCTIONAL_CR_AMT),
                            FUNCTIONAL_DR_AMT   : gfn_nvl(item.FUNCTIONAL_DR_AMT),
                            TXN_QTY        	    : gfn_nvl(item.TXN_QTY),
                            ACCOUNT_CODE        : gfn_nvl(item.ACCOUNT_CODE),
                            ACCOUNT_NAME        : gfn_nvl(item.ACCOUNT_NAME),
                            ACC_ITEM_CODE1      : gfn_nvl(item.ACC_ITEM_CODE1),
                            ACC_ITEM_CODE2      : gfn_nvl(item.ACC_ITEM_CODE2),
                            ACC_ITEM_CODE3      : gfn_nvl(item.ACC_ITEM_CODE3),
                            ACC_ITEM_CODE4      : gfn_nvl(item.ACC_ITEM_CODE4),
                            ACC_ITEM_CODE5      : gfn_nvl(item.ACC_ITEM_CODE5),
                            ACC_ITEM_CODE6      : gfn_nvl(item.ACC_ITEM_CODE6),
                            ACC_ITEM_CODE7      : gfn_nvl(item.ACC_ITEM_CODE7),
                            ACC_ITEM_CODE8      : gfn_nvl(item.ACC_ITEM_CODE8),
                            ACC_ITEM_CODE9      : gfn_nvl(item.ACC_ITEM_CODE9),
                            ACC_ITEM_CODE10     : gfn_nvl(item.ACC_ITEM_CODE10),
                            ACC_ITEM_NAME1      : gfn_nvl(item.ACC_ITEM_NAME1),
                            ACC_ITEM_NAME2      : gfn_nvl(item.ACC_ITEM_NAME2),
                            ACC_ITEM_NAME3      : gfn_nvl(item.ACC_ITEM_NAME3),
                            ACC_ITEM_NAME4      : gfn_nvl(item.ACC_ITEM_NAME4),
                            ACC_ITEM_NAME5      : gfn_nvl(item.ACC_ITEM_NAME5),
                            ACC_ITEM_NAME6      : gfn_nvl(item.ACC_ITEM_NAME6),
                            ACC_ITEM_NAME7      : gfn_nvl(item.ACC_ITEM_NAME7),
                            ACC_ITEM_NAME8      : gfn_nvl(item.ACC_ITEM_NAME8),
                            ACC_ITEM_NAME9      : gfn_nvl(item.ACC_ITEM_NAME9),
                            ACC_ITEM_NAME10     : gfn_nvl(item.ACC_ITEM_NAME10),
                            ACC_ITEM_YN1        : gfn_nvl(item.ACC_ITEM_YN1),   //-- 필수여부
                            ACC_ITEM_YN2        : gfn_nvl(item.ACC_ITEM_YN2),
                            ACC_ITEM_YN3        : gfn_nvl(item.ACC_ITEM_YN3),
                            ACC_ITEM_YN4        : gfn_nvl(item.ACC_ITEM_YN4),
                            ACC_ITEM_YN5        : gfn_nvl(item.ACC_ITEM_YN5),
                            ACC_ITEM_YN6        : gfn_nvl(item.ACC_ITEM_YN6),
                            ACC_ITEM_YN7        : gfn_nvl(item.ACC_ITEM_YN7),
                            ACC_ITEM_YN8        : gfn_nvl(item.ACC_ITEM_YN8),
                            ACC_ITEM_YN9        : gfn_nvl(item.ACC_ITEM_YN9),
                            ACC_ITEM_YN10       : gfn_nvl(item.ACC_ITEM_YN10),
                            DATA_TYPE1        	: gfn_nvl(item.DATA_TYPE1),
                            DATA_TYPE2        	: gfn_nvl(item.DATA_TYPE2),
                            DATA_TYPE3        	: gfn_nvl(item.DATA_TYPE3),
                            DATA_TYPE4        	: gfn_nvl(item.DATA_TYPE4),
                            DATA_TYPE5        	: gfn_nvl(item.DATA_TYPE5),
                            DATA_TYPE6        	: gfn_nvl(item.DATA_TYPE6),
                            DATA_TYPE7        	: gfn_nvl(item.DATA_TYPE7),
                            DATA_TYPE8        	: gfn_nvl(item.DATA_TYPE8),
                            DATA_TYPE9        	: gfn_nvl(item.DATA_TYPE9),
                            DATA_TYPE10        	: gfn_nvl(item.DATA_TYPE10),
                            POPUP_ID1        	: gfn_nvl(item.POPUP_ID1),
                            POPUP_ID2        	: gfn_nvl(item.POPUP_ID2),
                            POPUP_ID3        	: gfn_nvl(item.POPUP_ID3),
                            POPUP_ID4        	: gfn_nvl(item.POPUP_ID4),
                            POPUP_ID5        	: gfn_nvl(item.POPUP_ID5),
                            POPUP_ID6        	: gfn_nvl(item.POPUP_ID6),
                            POPUP_ID7        	: gfn_nvl(item.POPUP_ID7),
                            POPUP_ID8        	: gfn_nvl(item.POPUP_ID8),
                            POPUP_ID9        	: gfn_nvl(item.POPUP_ID9),
                            POPUP_ID10        	: gfn_nvl(item.POPUP_ID10),
                            ACC_CHARACTER       : gfn_nvl(item.ACC_CHARACTER),
                            ACC_ITEM_VALUE1     : gfn_nvl(item.ACC_ITEM_VALUE1),
                            ACC_ITEM_VALUE2     : gfn_nvl(item.ACC_ITEM_VALUE2),
                            ACC_ITEM_VALUE3     : gfn_nvl(item.ACC_ITEM_VALUE3),
                            ACC_ITEM_VALUE4     : gfn_nvl(item.ACC_ITEM_VALUE4),
                            ACC_ITEM_VALUE5     : gfn_nvl(item.ACC_ITEM_VALUE5),
                            ACC_ITEM_VALUE6     : gfn_nvl(item.ACC_ITEM_VALUE6),
                            ACC_ITEM_VALUE7     : gfn_nvl(item.ACC_ITEM_VALUE7),
                            ACC_ITEM_VALUE8     : gfn_nvl(item.ACC_ITEM_VALUE8),
                            ACC_ITEM_VALUE9     : gfn_nvl(item.ACC_ITEM_VALUE9),
                            ACC_ITEM_VALUE10    : gfn_nvl(item.ACC_ITEM_VALUE10),
                            ACC_VALUE_NAME1     : gfn_nvl(item.ACC_VALUE_NAME1),
                            ACC_VALUE_NAME2     : gfn_nvl(item.ACC_VALUE_NAME2),
                            ACC_VALUE_NAME3     : gfn_nvl(item.ACC_VALUE_NAME3),
                            ACC_VALUE_NAME4     : gfn_nvl(item.ACC_VALUE_NAME4),
                            ACC_VALUE_NAME5     : gfn_nvl(item.ACC_VALUE_NAME5),
                            ACC_VALUE_NAME6     : gfn_nvl(item.ACC_VALUE_NAME6),
                            ACC_VALUE_NAME7     : gfn_nvl(item.ACC_VALUE_NAME7),
                            ACC_VALUE_NAME8     : gfn_nvl(item.ACC_VALUE_NAME8),
                            ACC_VALUE_NAME9     : gfn_nvl(item.ACC_VALUE_NAME9),
                            ACC_VALUE_NAME10    : gfn_nvl(item.ACC_VALUE_NAME10),
                            ITEM_CODE        	: gfn_nvl(item.ITEM_CODE),
                            UOM        	        : gfn_nvl(item.UOM),
                            TXN_QTY        	    : gfn_nvl(item.TXN_QTY),
                            DEPT_NAME        	: gfn_nvl(item.DEPT_NAME),
                            DESCRIPTION        	: gfn_nvl(item.DESCRIPTION),
                            INVOICE_ID        	: gfn_nvl(item.INVOICE_ID),
                            FI_ORG_CODE        	: gfn_nvl(item.FI_ORG_CODE),
                            ITEM_DOC_TYPE       : gfn_nvl(item.ITEM_DOC_TYPE),
                            DOC_NAME        	: gfn_nvl(item.DOC_NAME),
                            DOC_TYPE        	: gfn_nvl(item.DOC_TYPE),
                            DOC_STATUS        	: gfn_nvl(item.DOC_STATUS),
                            DOC_ID        	    : gfn_nvl(item.DOC_ID),
                            CURRENCY_CODE       : gfn_nvl(item.CURRENCY_CODE),
                            EXCHANGE_TYPE       : gfn_nvl(item.EXCHANGE_TYPE),
                            EXCHANGE_RATE       : gfn_nvl(item.EXCHANGE_RATE),

                        }
                        jsonTrl2010Tab2.push(msg);
                        totalRecordCount3++;
                    });

                    Trl2010GridTab2.rebuild();
                    document.querySelector('#listCount').innerText = totalRecordCount3;

                }

            } else {
                alert(data.resultMessage);
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
     * 탭클릭
     */
    const fn_tabClick = function(val) {

        p_sel_tab = val;
    }

    /**
     * 확정
     */
    const fn_btnConfirm = async function () {

        var nCol = Trl2010GridTop.getCol();
        var nRow = Trl2010GridTop.getRow();

        if (nCol == -1) {
            return;
        }

        if (nRow == -1) {
            return;
        }

        let gridData = Trl2010GridTop.getRowData(nRow);

        if (_.isEmpty(gridData)){
            return;
        }

        if (fn_P_TRL2010_S1("CONFIRM")) {
            //Allcheck1 = "N";

            fn_search('Q', nRow);

        }
    }

    /**
     * 취소
     */
    const fn_btnCancel = async function () {

        var nCol = Trl2010GridTop.getCol();
        var nRow = Trl2010GridTop.getRow();

        if (nCol == -1) {
            return;
        }

        if (nRow == -1) {
            return;
        }

        let gridData = Trl2010GridTop.getRowData(nRow);

        if (_.isEmpty(gridData)){
            return;
        }

        if (fn_P_TRL2010_S1("UNCONFIRM")) {
            //Allcheck1 = "N";

            fn_search('Q', nRow);

        }

    }

    /**
     * 자금계획등록
     */
    const fn_btnInterface = async function () {

    }

    /**
     * 자금계획삭제
     */
    const fn_btnDelete = async function () {

        var nCol = Trl2010GridTop.getCol();
        var nRow = Trl2010GridTop.getRow();

        if (nCol == -1) {
            return;
        }

        if (nRow == -1) {
            return;
        }

        let gridData = Trl2010GridTop.getRowData(nRow);

        if (_.isEmpty(gridData)){
            return;
        }

        if (fn_P_TRL2010_S1("CANCEL")) {
            //Allcheck1 = "N";

            fn_search('Q', nRow);

        }

    }

    /**
     * 목록 조회
     */
    const fn_P_TRL2010_S1 = async function (strWorkType) {

        let listData = [];
        listData =  await getParamForm(strWorkType);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1100S1.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }

                    return true;

                } else {
                    alert(data.resultMessage);
                    return false;
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamForm = async function (strWorkType) {

        let returnData = [];

        let updatedData = Trl2010GridTop.getGridDataAll();

        updatedData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: strWorkType,
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_ACCT_RULE_CODE            : p_ss_defaultAcctRule
                    ,V_P_PERIOD_CODE               : gfn_nvl(item.PERIOD_CODE)
                    ,V_P_OUT_DEPOSIT_CODE          : gfn_nvl(item.OUT_DEPOSIT_CODE)
                    ,V_P_TXN_TYPE                  : gfn_nvl(item.TXN_TYPE)
                    ,V_P_TXN_ID                    : gfn_nvl(item.TXN_ID)
                    ,V_P_CONFIRM_FLAG              : gfn_nvl(item.CONFIRM_FLAG)
                    ,V_P_EXCHANGE_RATE             : gfn_nvl(item.EXCHANGE_RATE)
                    ,V_P_REPAY_PLAN_AMT_F          : gfn_nvl(item.REPAY_PLAN_AMT_F)
                    ,V_P_REMAIN_LOAN_AMT_F         : gfn_nvl(item.REMAIN_LOAN_AMT_F)
                    ,V_P_INTEREST_REPAY_PLAN_AMT_F : gfn_nvl(item.INTEREST_REPAY_PLAN_AMT_F)
                    ,V_P_REPAY_PLAN_AMT_BEFORE     : gfn_nvl(item.REPAY_PLAN_AMT_BEFORE)
                    ,V_P_FOREIGN_EXCHANGE_PL       : gfn_nvl(item.FOREIGN_EXCHANGE_PL)
                    ,V_P_PAY_METHOD                : gfn_nvl(item.PAY_METHOD)

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''

                })
            }

            returnData.push(param);

        });

        return returnData;
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>