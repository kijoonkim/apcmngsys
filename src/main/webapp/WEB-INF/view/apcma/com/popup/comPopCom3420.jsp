<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
	<section id="compopcom3420">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
<%-- 				<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %> --%>
				<div>
					<div id="divBtn" style="display:inline;margin-bottom:5px;">
						<sbux-button uitype="normal" text="조회" class="btn btn-sm btn-outline-danger cu-btn-search" style="float: right;margin-right:1rem;" ></sbux-button>
					</div>				
					<table class="table table-bordered tbl_row tbl_fixed">
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
								<th scope="row" class="th_bg">거래처유형</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle" 
											type="button"
											id="SRCH_CS_GROUP" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=SRCH_CS_GROUP style="width:600px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>   	
								</td>
								<td style="border-right: hidden;">&nbsp;</td>
								<th scope="row" class="th_bg">거래처코드</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="SRCH_CS_CODE" class="form-control input-sm" ></sbux-input>
								</td>					
								<td style="border-right: hidden;">&nbsp;</td>			
								<th scope="row" class="th_bg">거래처명</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="SRCH_CS_NAME" class="form-control input-sm" ></sbux-input>
								</td>	
								<td style="border-right: hidden;">&nbsp;</td>							
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
			<div class="box-body">
				<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					<div id="compopcom3420Grid" name="compopcom3420Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script >
 
//grid Mast 초기화
var com3420Grid; 			// 그리드를 담기위한 객체 선언
var jsonCom3420 			= []; // 그리드의 참조 데이터 주소 선언
var jsonCsGroup 			= [];
var jsonTaxType 			= [];
var jsonComType 			= [];
var jsonBizType 			= [];
var jsonDeferReason 		= [];
var jsonTxnStopReason 		= [];
var jsonPurHandovCndtCd 	= [];
var jsonPayDateRule 		= [];
var jsonDeliveryType 		= [];
var jsonReceiptDateRule 	= [];
var jsonShippingType 		= [];
var jsonWithholdaTaxOffice 	= [];
var jsonWithholdaTaxOffice2	= [];
var jsonWithholdaTaxType	= [];
 
/**
 * @description 복수코드
 */
function compopcom3420(options) {
	
	// id 선언
	var modalId  	= '#compopcom3420';
	var modalDivId 	= 'modal-compopcom3420';
	
	var settings = {
		height					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
 
	//css
	$('#' + modalDivId).find('.sbux-mol-hd-close').css({'font-size':'30px','margin-top':'-20px'});
	if(settings.width){
	 	$(modalId).closest('.sbux-mol-md-dlg').css('width', settings.width);
	}
	if(settings.height){
	 	$(modalId).find('.cu-table-div').css('height', settings.height);
	}	
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopcom3420Grid';
	    SBGridProperties.id 				= 'com3420Grid';
	    SBGridProperties.jsonref 			= 'jsonCom3420';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrows';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["거래처코드"], 					ref: 'CS_CODE',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["거래처명"], 					ref: 'CS_NAME',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["거래처정식명"], 					ref: 'CS_FULLNAME',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["거래처약칭"], 					ref: 'CS_ABBR_NAME',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["영문명"], 					ref: 'CS_NAME_ENG',    			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption : ["거래처유형"], 				ref: 'CS_GROUP', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonCsGroup',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["은행코드"],    				ref: 'BANK_NO', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["거래처명"],    				ref: 'CS_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ['해외거래처여부'],			ref: 'FOREIGN_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },            
            {caption: ["국가코드"],  				ref: 'NATION_CODE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지역"],  				ref: 'REGION_CODE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업자번호"],  				ref: 'BIZ_REGNO', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["과세유형"], 				ref: 'TAX_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonTaxType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["기업규모"], 				ref: 'COM_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonComType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["법인구분"], 				ref: 'BIZ_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonBizType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["법인등록번호"],  					ref: 'COMP_REGNO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["대표자명"],  					ref: 'CHIEF_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['주민기재분여부'],			ref: 'RESIDENT_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption: ["업태"],  					ref: 'BIZ_CATEGORY', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["업종명"],  					ref: 'BIZ_ITEMS', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['매입처여부'],			ref: 'PURCHASE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ['매출처여부'],			ref: 'SALE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ['운송사여부'],			ref: 'TRANSPORT_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption: ["통화코드"],  					ref: 'CURRENCY_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["종사업장번호"],  					ref: 'SUB_NO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['사용여부'],			ref: 'USE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ['주류여부'],			ref: 'LIQUOR_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption: ["우편번호"],  					ref: 'ZIP_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["주소"],  					ref: 'ADDRESS', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전화번호"],  					ref: 'TEL', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["팩스"],  					ref: 'FAX', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["이메일"],  					ref: 'EMAIL_ID', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["홈페이지주소"],  				ref: 'WEB_URL', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['시작일자'],				ref : 'START_DATE',	width : '120px',	style : 'text-align:center',	type : 'datepicker',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}},
            {caption: ['종료일'],			ref : 'END_DATE',	width : '120px',	style : 'text-align:center',	type : 'datepicker',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}},
            {caption: ["비고"],  					ref: 'MEMO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['지급보류여부'],			ref: 'DEFER_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ["지급보류사유"], 				ref: 'DEFER_REASON', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonDeferReason',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["채무계정코드"],  					ref: 'AP_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["채무계정코드외화"],  					ref: 'AP_ACC_CODE_FOREIGN', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["채권계정코드"],  					ref: 'AR_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["채권계정코드외화"],  					ref: 'AR_ACC_CODE_FOREIGN', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사용자코드"],  					ref: 'EMP_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['거래중지여부'],			ref: 'TXN_STOP_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ["거래중지사유"], 				ref: 'TXN_STOP_REASON', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonTxnStopReason',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption: ["선수금계정"],  					ref: 'advance_acc_code', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['부도거래처여부'],			ref: 'BANKRUPTCY_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption: ["선급금계정"],  					ref: 'PREPAY_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["선수금계정"],  					ref: 'ADVANCE_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["구매인도조건"], 				ref: 'PUR_HANDOV_CNDT_CD', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonPurHandovCndtCd',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["지급기일조건"], 				ref: 'PAY_DATE_RULE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonPayDateRule',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["판매인도조건"], 				ref: 'DELIVERY_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonDeliveryType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["수금기일조건"], 				ref: 'RECEIPT_DATE_RULE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonReceiptDateRule',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["출하조건"], 				ref: 'SHIPPING_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonShippingType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption: ["채무정산계정"],  					ref: 'AP_CLR_ACC', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["고객사그룹"],  					ref: 'CUSTOMER_CATEGORY', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["언어"],  					ref: 'LANGUAGE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["과세코드"],  					ref: 'TAX_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['제조사여부'],			ref: 'MAKER_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['가망고객여부'],			ref: 'EXPECTED_CUSTOMER_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['원천세대상여부'],			ref: 'WITHHOLD_TAX_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ["원천세납부세무서"], 				ref: 'WITHHOLD_TAX_OFFICE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonWithholdaTaxOffice',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }, 
            {caption : ["원천세납부구청"], 				ref: 'WITHHOLD_TAX_OFFICE2', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonWithholdaTaxOffice',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }, 
            {caption : ["원천세코드"], 				ref: 'WITHHOLD_TAX_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonWithholdaTaxType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }, 
            {caption : ['구매_정발행여부'],			ref: 'TAX_SEND',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['회사기준대상여부'],			ref: 'INTERNAL_PAY_RULE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['판매_역발행여부'],			ref: 'SALES_TAX_SEND',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption: ["CHECK한도(%)"],  					ref: 'RCPT_CHK_RANGE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['철스크랩여부'],			ref: 'STEEL_SCRAP_PAY_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['외주사여부'],			ref: 'OSP_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption: ["대표거래처코드"],  					ref: 'REF_CS_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["SAP공급사코드"],  					ref: 'SAP_VENDOR_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["SAP고객사코드"],  					ref: 'SAP_CUSTOMER_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'}
        ];
        com3420Grid	= _SBGrid.create(SBGridProperties);
    }	
    fn_createGrid();	
    //거래처유형
	gfnma_multiSelectInit({
		target			: ['#SRCH_CS_GROUP']
		,compCode		: gv_ma_selectedCorpCd
		,clientCode		: gv_ma_selectedClntCd
		,bizcompId		: 'L_COM011'
		,whereClause	: ''
		,formId			: p_formId
		,menuId			: p_menuId
		,selectValue	: ''
		,dropType		: 'down' 	// up, down
		,dropAlign		: 'left' 	// left, right
		,colValue		: 'SBSD_CD'
		,colLabel		: 'CD_NM'
		,columns		:[
            {caption: "거래처유형코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
            {caption: "거래처유형명", 			ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'},
            {caption: "해외여부",				ref: 'EXTRA_COL2', 		width:'150px',  	style:'text-align:left'},
            {caption: "사업자등록번호필수",		ref: 'EXTRA_COL3',    	width:'150px',  	style:'text-align:left'},
		]
	});
    gfnma_setComSelect(['com3420Grid','CS_GROUP'], jsonCsGroup, 'L_COM011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','TAX_TYPE'], jsonTaxType, 'L_COM029', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','COM_TYPE'], jsonComType, 'L_COM030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','BIZ_TYPE'], jsonBizType, 'L_HRA014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','DEFER_REASON'], jsonDeferReason, 'L_COM042', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','TXN_STOP_REASON'], jsonTxnStopReason, 'L_COM048', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','PUR_HANDOV_CNDT_CD'], jsonPurHandovCndtCd, 'L_COM038_1', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','PAY_DATE_RULE'], jsonPayDateRule, 'L_COM011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','DELIVERY_TYPE'], jsonDeliveryType, 'L_COM038_1', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','RECEIPT_DATE_RULE'], jsonReceiptDateRule, 'L_COM039_1', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','SHIPPING_TYPE'], jsonShippingType, 'L_COM039_1', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','WITHHOLD_TAX_OFFICE'], jsonWithholdaTaxOffice, 'L_CS_GOVERNMENT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CNPT_CD', 'CNPT_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','WITHHOLD_TAX_OFFICE2'], jsonWithholdaTaxOffice2, 'L_CS_GOVERNMENT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CNPT_CD', 'CNPT_NM', 'Y', '');
    gfnma_setComSelect(['com3420Grid','WITHHOLD_TAX_TYPE'], jsonWithholdaTaxType, 'L_WITHHOLD_TAX_TYPE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TX_TYPE_CD', 'TX_TYPE_NM', 'Y', '');
    
	function fn_clearCom3420() {
		jsonCom3420 = [];
		com3420Grid.rebuild();
	}
    const fn_setCom3420Grid = async function() {
		
    	fn_clearCom3420();
    	
    	let SRCH_CS_GROUP 	= gfnma_multiSelectGet("#SRCH_CS_GROUP");
    	let SRCH_CS_CODE 	= gfnma_nvl(SBUxMethod.get("SRCH_CS_CODE"));
    	let SRCH_CS_NAME 	= gfnma_nvl(SBUxMethod.get("SRCH_CS_NAME"));
    	
	    var paramObj = {
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			,V_P_CS_CODE			: SRCH_CS_CODE
			,V_P_CS_NAME			: SRCH_CS_NAME
			,V_P_CS_GROUP			: SRCH_CS_GROUP
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/com/com3420List.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});
 
        const data = await postJsonPromise;
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
 
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;
 
  	        	jsonCom3420.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  							CS_CODE			: gfnma_nvl(item.CNPT_CD),			
  							CS_NAME				: gfnma_nvl(item.CNPT_NM),
  							CS_FULLNAME				: gfnma_nvl(item.CNPT_FLNM),
  							CS_ABBR_NAME			: gfnma_nvl(item.CNPT_NM_ABBR),			
  							CS_NAME_ENG			: gfnma_nvl(item.CNPT_NM_ENG),		
  							CS_GROUP	: gfnma_nvl(item.CNPT_GROUP),
  							BANK_NO	: gfnma_nvl(item.BANK_CD),
  							CS_NAME	: gfnma_nvl(item.CNPT_NM),
  							FOREIGN_YN	: gfnma_nvl(item.FRCNY_YN),
  							NATION_CODE	: gfnma_nvl(item.NTN_CD),
  							REGION_CODE	: gfnma_nvl(item.RGN_CD),
  							BIZ_REGNO	: gfnma_nvl(item.BRNO),
  							TAX_TYPE	: gfnma_nvl(item.TX_TYPE),
  							COM_TYPE	: gfnma_nvl(item.CO_TYPE),
  							BIZ_TYPE	: gfnma_nvl(item.CORP_TYPE),
  							COMP_REGNO	: gfnma_nvl(item.CORP_REGNO),
  							CHIEF_NAME	: gfnma_nvl(item.CEO_NM),
  							RESIDENT_YN	: gfnma_nvl(item.INHTNT_DLNG_YN),
  							BIZ_CATEGORY	: gfnma_nvl(item.BZSTAT),
  							BIZ_ITEMS	: gfnma_nvl(item.TPBIZ),
  							PURCHASE_YN	: gfnma_nvl(item.PCPL_YN),
  							SALE_YN	: gfnma_nvl(item.SLS_CNPT_YN),
  							TRANSPORT_YN	: gfnma_nvl(item.TRSPRT_CNPT_YN),
  							CURRENCY_CODE	: gfnma_nvl(item.CRN_CD),
  							SUB_NO	: gfnma_nvl(item.SBSD_BPLC_NO),
  							USE_YN	: gfnma_nvl(item.USE_YN),
  							LIQUOR_YN	: gfnma_nvl(item.LIQR_YN),
  							ZIP_CODE	: gfnma_nvl(item.ZIP_CD),
  							ADDRESS	: gfnma_nvl(item.ADDR),
  							TEL	: gfnma_nvl(item.TELNO),
  							FAX	: gfnma_nvl(item.FX_NO),
  							EMAIL_ID	: gfnma_nvl(item.EML_ID),
  							WEB_URL	: gfnma_nvl(item.HMPG_URL),
  							START_DATE	: gfnma_nvl(item.BGNG_YMD),
  							END_DATE	: gfnma_nvl(item.END_DT),
  							MEMO	: gfnma_nvl(item.MEMO),
  							DEFER_YN	: gfnma_nvl(item.PAY_HLDOF_YN),
  							DEFER_REASON	: gfnma_nvl(item.DFRMNT_RSN),
  							AP_ACC_CODE	: gfnma_nvl(item.APS_ACNT_CD),
  							AP_ACC_CODE_FOREIGN	: gfnma_nvl(item.APS_ACNT_CD_FRCNCY),
  							AR_ACC_CODE	: gfnma_nvl(item.AR_ACNT_CD),
  							AR_ACC_CODE_FOREIGN	: gfnma_nvl(item.AR_ACNT_CD_FRCNCY),
  							EMP_CODE	: gfnma_nvl(item.EMP_CD),
  							TXN_STOP_YN	: gfnma_nvl(item.TRSC_HLT_YN),
  							TXN_STOP_REASON	: gfnma_nvl(item.TRSC_HLT_RSN),
  							advance_acc_code	: gfnma_nvl(item.advance_acc_code),
  							BANKRUPTCY_YN	: gfnma_nvl(item.BNKRP_CNPT_YN),
  							PREPAY_ACC_CODE	: gfnma_nvl(item.PRPY_ACNT_CD),
  							ADVANCE_ACC_CODE	: gfnma_nvl(item.ADPYR_ACNTL_CD),
  							PUR_HANDOV_CNDT_CD	: gfnma_nvl(item.PORDR_DLVRTRM_CD),
  							PAY_DATE_RULE	: gfnma_nvl(item.PAY_CNDTN),
  							DELIVERY_TYPE	: gfnma_nvl(item.DLVRTRM),
  							RECEIPT_DATE_RULE	: gfnma_nvl(item.RCPT_YMD_RULE),
  							SHIPPING_TYPE	: gfnma_nvl(item.SHPG_TYPE),
  							AP_CLR_ACC	: gfnma_nvl(item.APS_CLCLN_ACNT),
  							CUSTOMER_CATEGORY	: gfnma_nvl(item.CUST_CTRGY),
  							LANGUAGE	: gfnma_nvl(item.LANG_ID),
  							TAX_CODE	: gfnma_nvl(item.TX_CD),
  							MAKER_YN	: gfnma_nvl(item.MKR_YN),
  							EXPECTED_CUSTOMER_YN	: gfnma_nvl(item.PRNMNT_CUST_YN),
  							WITHHOLD_TAX_YN	: gfnma_nvl(item.WTHD_TX_YN),
  							WITHHOLD_TAX_OFFICE	: gfnma_nvl(item.WTHD_TXOFC),
  							WITHHOLD_TAX_OFFICE2	: gfnma_nvl(item.WTHD_TXOFC2),
  							WITHHOLD_TAX_TYPE	: gfnma_nvl(item.WTHD_TX_TYPE),
  							TAX_SEND	: gfnma_nvl(item.TX_SEND),
  							INTERNAL_PAY_RULE_YN	: gfnma_nvl(item.INR_PAY_RULE_YN),
  							SALES_TAX_SEND	: gfnma_nvl(item.SLS_TXIV_TRSM),
  							RCPT_CHK_RANGE	: gfnma_nvl(item.RCPT_CHCK_LIM),
  							STEEL_SCRAP_PAY_YN	: gfnma_nvl(item.SCRAP_DLNG_YN),
  							OSP_YN	: gfnma_nvl(item.OTSRC_CO_YN),
  							REF_CS_CODE	: gfnma_nvl(item.RFRNC_CNPT_CD),
  							SAP_VENDOR_CODE	: gfnma_nvl(item.ERP_CNPT_CD2),
  							SAP_CUSTOMER_CODE	: gfnma_nvl(item.ERP_CNPT_CD)
  					}
  					jsonCom3420.push(msg);
  					totalRecordCount ++;
  				});
        		com3420Grid.rebuild();
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
	fn_setCom3420Grid();
    
	$(modalId).find('.cu-btn-search').off('click');
	$(modalId).find('.cu-btn-search').click(function(){
		fn_setCom3420Grid();
	});	
	
	//close event
	$(modalId).find('.cu-btn-cancel').off('click');
	$(modalId).find('.cu-btn-cancel').click(function(){
 		if(settings.cancelEvent){
 			settings.cancelEvent();
 		}
	 	SBUxMethod.closeModal(modalDivId);
	});	
	
}
 
</script>
</html>
