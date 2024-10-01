<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
	<section id="compopcom3430">
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
											id="SRCH_CS_GROUP1" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=SRCH_CS_GROUP1 style="width:600px;height:250px;padding-top:0px;overflow:auto">
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
					<div id="compopcom3430Grid" name="compopcom3430Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script >

//grid Mast 초기화
var com3430Grid; 			// 그리드를 담기위한 객체 선언
var jsonCom3430 			= []; // 그리드의 참조 데이터 주소 선언
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
function compopcom3430(options) {
	
	// id 선언
	var modalId  	= '#compopcom3430';
	var modalDivId 	= 'modal-compopcom3430';
	
	var settings = {
		height					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
	console.log('settings:', settings);

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
	    SBGridProperties.parentid 			= 'compopcom3430Grid';
	    SBGridProperties.id 				= 'com3430Grid';
	    SBGridProperties.jsonref 			= 'jsonCom3430';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrows';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["변경일자"], 			ref: 'CHANGE_TIME',    			type:'output',  	width:'150px',  		style:'text-align:left'},
            {caption: ["변경자ID"], 			ref: 'UPDATE_USERID',    			type:'output',  	width:'150px',  		style:'text-align:left'},
            {caption: ["거래처코드"], 		ref: 'CS_CODE',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["거래처명"], 			ref: 'CS_NAME',    			type:'output',  	width:'150px',  		style:'text-align:left'},
            {caption: ["거래처정식명"], 		ref: 'CS_FULLNAME',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["거래처약칭"], 		ref: 'CS_ABBR_NAME',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption: ["영문명"], 			ref: 'CS_NAME_ENG',    			type:'output',  	width:'100px',  		style:'text-align:left'},
            {caption : ["거래처유형"], 		ref: 'CS_GROUP', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonCsGroup',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["은행코드"],    		ref: 'BANK_NO', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["거래처명"],    		ref: 'CS_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ['해외거래처여부'],		ref: 'FOREIGN_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },            
            {caption: ["국가코드"],  			ref: 'NATION_CODE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지역"],  			ref: 'REGION_CODE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업자번호"],  		ref: 'BIZ_REGNO', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["과세유형"], 			ref: 'TAX_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonTaxType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["기업규모"], 			ref: 'COM_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonComType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["법인구분"], 			ref: 'BIZ_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonBizType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["법인등록번호"],  		ref: 'COMP_REGNO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["대표자명"],  			ref: 'CHIEF_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['주민기재분여부'],		ref: 'RESIDENT_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption: ["업태"],  			ref: 'BIZ_CATEGORY', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["업종명"],  			ref: 'BIZ_ITEMS', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['매입처여부'],		ref: 'PURCHASE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ['매출처여부'],		ref: 'SALE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ['운송사여부'],		ref: 'TRANSPORT_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption: ["통화코드"],  			ref: 'CURRENCY_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["종사업장번호"],  		ref: 'SUB_NO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
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
            {caption: ["우편번호"],  			ref: 'ZIP_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["주소"],  			ref: 'ADDRESS', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전화번호"],  			ref: 'TEL', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["팩스"],  			ref: 'FAX', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["이메일"],  			ref: 'EMAIL_ID', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["홈페이지주소"],  		ref: 'WEB_URL', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['시작일자'],			ref: 'START_DATE',	width : '120px',	style : 'text-align:center',	type : 'datepicker',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}},
            {caption: ['종료일'],				ref: 'END_DATE',	width : '120px',	style : 'text-align:center',	type : 'datepicker',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}},
            {caption: ["비고"],  			ref: 'MEMO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['지급보류여부'],		ref: 'DEFER_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },          
            {caption : ["지급보류사유"], 		ref: 'DEFER_REASON', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonDeferReason',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["채무계정코드"],  		ref: 'AP_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["채무계정코드외화"],  	ref: 'AP_ACC_CODE_FOREIGN', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["채권계정코드"],  		ref: 'AR_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["채권계정코드외화"],  	ref: 'AR_ACC_CODE_FOREIGN', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사용자코드"],  		ref: 'EMP_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['거래중지여부'],		ref: 'TXN_STOP_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ["거래중지사유"], 		ref: 'TXN_STOP_REASON', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonTxnStopReason',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption: ["선수금계정"],  		ref: 'advance_acc_code', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['부도거래처여부'],		ref: 'BANKRUPTCY_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption: ["선급금계정"],  		ref: 'PREPAY_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["선수금계정"],  		ref: 'ADVANCE_ACC_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["구매인도조건"], 		ref: 'PUR_HANDOV_CNDT_CD', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonPurHandovCndtCd',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["지급기준코드"], 		ref: 'PAY_DATE_RULE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonPayDateRule',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["판매인도조건"], 		ref: 'DELIVERY_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonDeliveryType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["수금조건"], 			ref: 'RECEIPT_DATE_RULE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonReceiptDateRule',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["출하조건"], 			ref: 'SHIPPING_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonShippingType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption: ["채무정산계정"],  		ref: 'AP_CLR_ACC', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["고객사그룹"],  		ref: 'CUSTOMER_CATEGORY', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["언어"],  			ref: 'LANGUAGE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["과세코드"],  			ref: 'TAX_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['제조사여부'],		ref: 'MAKER_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['가망고객여부'],		ref: 'EXPECTED_CUSTOMER_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['원천세대상여부'],		ref: 'WITHHOLD_TAX_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ["원천세납부세무서"], 	ref: 'WITHHOLD_TAX_OFFICE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonWithholdaTaxOffice',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }, 
            {caption : ["원천세납부구청"], 	ref: 'WITHHOLD_TAX_OFFICE2', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonWithholdaTaxOffice',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }, 
            {caption : ["원천세코드"], 		ref: 'WITHHOLD_TAX_TYPE', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonWithholdaTaxType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }, 
            {caption : ['구매_정발행여부'],		ref: 'TAX_SEND',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['회사기준대상여부'],		ref: 'INTERNAL_PAY_RULE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption : ['판매_역발행여부'],		ref: 'SALES_TAX_SEND',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },    
            {caption: ["CHECK한도(%)"], 			ref: 'RCPT_CHK_RANGE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['철스크랩여부'],			ref: 'STEEL_SCRAP_PAY_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            }
        ];
        com3430Grid	= _SBGrid.create(SBGridProperties);
    }	
    fn_createGrid();	
    //거래처유형
	gfnma_multiSelectInit({
		target			: ['#SRCH_CS_GROUP1']
		,compCode		: gv_ma_selectedApcCd
		,clientCode		: gv_ma_selectedClntCd
		,bizcompId		: 'L_COM011'
		,whereClause	: ''
		,formId			: p_formId
		,menuId			: p_menuId
		,selectValue	: ''
		,dropType		: 'down' 	// up, down
		,dropAlign		: 'left' 	// left, right
		,colValue		: 'SUB_CODE'
		,colLabel		: 'CODE_NAME'
		,columns		:[
            {caption: "거래처유형코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
            {caption: "거래처유형명", 			ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'},
            {caption: "해외여부",				ref: 'EXTRA_FIELD2', 		width:'150px',  	style:'text-align:left'},
            {caption: "사업자등록번호필수",		ref: 'EXTRA_FIELD3',    	width:'150px',  	style:'text-align:left'},
		]
	});
    gfnma_setComSelect(['com3430Grid','CS_GROUP'], 				jsonCsGroup, 'L_COM011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','TAX_TYPE'], 				jsonTaxType, 'L_COM029', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','COM_TYPE'], 				jsonComType, 'L_COM030', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','BIZ_TYPE'], 				jsonBizType, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','DEFER_REASON'], 			jsonDeferReason, 'L_COM042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','TXN_STOP_REASON'], 		jsonTxnStopReason, 'L_COM048', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','PUR_HANDOV_CNDT_CD'],	jsonPurHandovCndtCd, 'L_COM038_1', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','PAY_DATE_RULE'], 		jsonPayDateRule, 'L_COM011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','DELIVERY_TYPE'], 		jsonDeliveryType, 'L_COM038_1', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','RECEIPT_DATE_RULE'], 	jsonReceiptDateRule, 'L_COM039_1', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','SHIPPING_TYPE'], 		jsonShippingType, 'L_COM039_1', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','WITHHOLD_TAX_OFFICE'], 	jsonWithholdaTaxOffice, 'L_CS_GOVERNMENT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CS_CODE', 'CS_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','WITHHOLD_TAX_OFFICE2'], 	jsonWithholdaTaxOffice2, 'L_CS_GOVERNMENT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CS_CODE', 'CS_NAME', 'Y', '');
    gfnma_setComSelect(['com3430Grid','WITHHOLD_TAX_TYPE'], 	jsonWithholdaTaxType, 'L_WITHHOLD_TAX_TYPE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_TYPE_CODE', 'TAX_TYPE_NAME', 'Y', '');
    
	function fn_clearCom3430() {
		jsonCom3430 = [];
		com3430Grid.rebuild();
	}
    const fn_setCom3430Grid = async function() {
		
    	fn_clearCom3430();
    	
    	let SRCH_CS_GROUP 	= gfnma_multiSelectGet("#SRCH_CS_GROUP1");
    	let SRCH_CS_CODE 	= gfnma_nvl(SBUxMethod.get("SRCH_CS_CODE"));
    	let SRCH_CS_NAME 	= gfnma_nvl(SBUxMethod.get("SRCH_CS_NAME"));
    	
	    var paramObj = {
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
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

        const postJsonPromise = gfn_postJSON("/com/com3430List.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('fn_setCom3430Grid data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonCom3430.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  							CHANGE_TIME					: gfnma_nvl(item.CHANGE_TIME),			
  							UPDATE_USERID				: gfnma_nvl(item.UPDATE_USERID),			
  							CS_CODE						: gfnma_nvl(item.CS_CODE),			
  							CS_NAME						: gfnma_nvl(item.CS_NAME),
  							CS_FULLNAME					: gfnma_nvl(item.CS_FULLNAME),
  							CS_ABBR_NAME				: gfnma_nvl(item.CS_ABBR_NAME),			
  							CS_NAME_ENG					: gfnma_nvl(item.CS_NAME_ENG),		
  							CS_GROUP					: gfnma_nvl(item.CS_GROUP),
  							BANK_NO						: gfnma_nvl(item.BANK_NO),
  							CS_NAME						: gfnma_nvl(item.CS_NAME),
  							FOREIGN_YN					: gfnma_nvl(item.FOREIGN_YN),
  							NATION_CODE					: gfnma_nvl(item.NATION_CODE),
  							REGION_CODE					: gfnma_nvl(item.REGION_CODE),
  							BIZ_REGNO					: gfnma_nvl(item.BIZ_REGNO),
  							TAX_TYPE					: gfnma_nvl(item.TAX_TYPE),
  							COM_TYPE					: gfnma_nvl(item.COM_TYPE),
  							BIZ_TYPE					: gfnma_nvl(item.BIZ_TYPE),
  							COMP_REGNO					: gfnma_nvl(item.COMP_REGNO),
  							CHIEF_NAME					: gfnma_nvl(item.CHIEF_NAME),
  							RESIDENT_YN					: gfnma_nvl(item.RESIDENT_YN),
  							BIZ_CATEGORY				: gfnma_nvl(item.BIZ_CATEGORY),
  							BIZ_ITEMS					: gfnma_nvl(item.BIZ_ITEMS),
  							PURCHASE_YN					: gfnma_nvl(item.PURCHASE_YN),
  							SALE_YN						: gfnma_nvl(item.SALE_YN),
  							TRANSPORT_YN				: gfnma_nvl(item.TRANSPORT_YN),
  							CURRENCY_CODE				: gfnma_nvl(item.CURRENCY_CODE),
  							SUB_NO						: gfnma_nvl(item.SUB_NO),
  							USE_YN						: gfnma_nvl(item.USE_YN),
  							LIQUOR_YN					: gfnma_nvl(item.LIQUOR_YN),
  							ZIP_CODE					: gfnma_nvl(item.ZIP_CODE),
  							ADDRESS						: gfnma_nvl(item.ADDRESS),
  							TEL							: gfnma_nvl(item.TEL),
  							FAX							: gfnma_nvl(item.FAX),
  							EMAIL_ID					: gfnma_nvl(item.EMAIL_ID),
  							WEB_URL						: gfnma_nvl(item.WEB_URL),
  							START_DATE					: gfnma_nvl(item.START_DATE),
  							END_DATE					: gfnma_nvl(item.END_DATE),
  							MEMO						: gfnma_nvl(item.MEMO),
  							DEFER_YN					: gfnma_nvl(item.DEFER_YN),
  							DEFER_REASON				: gfnma_nvl(item.DEFER_REASON),
  							AP_ACC_CODE					: gfnma_nvl(item.AP_ACC_CODE),
  							AP_ACC_CODE_FOREIGN			: gfnma_nvl(item.AP_ACC_CODE_FOREIGN),
  							AR_ACC_CODE					: gfnma_nvl(item.AR_ACC_CODE),
  							AR_ACC_CODE_FOREIGN			: gfnma_nvl(item.AR_ACC_CODE_FOREIGN),
  							EMP_CODE					: gfnma_nvl(item.EMP_CODE),
  							TXN_STOP_YN					: gfnma_nvl(item.TXN_STOP_YN),
  							TXN_STOP_REASON				: gfnma_nvl(item.TXN_STOP_REASON),
  							advance_acc_code			: gfnma_nvl(item.advance_acc_code),
  							BANKRUPTCY_YN				: gfnma_nvl(item.BANKRUPTCY_YN),
  							PREPAY_ACC_CODE				: gfnma_nvl(item.PREPAY_ACC_CODE),
  							ADVANCE_ACC_CODE			: gfnma_nvl(item.ADVANCE_ACC_CODE),
  							PUR_HANDOV_CNDT_CD			: gfnma_nvl(item.PUR_HANDOV_CNDT_CD),
  							PAY_DATE_RULE				: gfnma_nvl(item.PAY_DATE_RULE),
  							DELIVERY_TYPE				: gfnma_nvl(item.DELIVERY_TYPE),
  							RECEIPT_DATE_RULE			: gfnma_nvl(item.RECEIPT_DATE_RULE),
  							SHIPPING_TYPE				: gfnma_nvl(item.SHIPPING_TYPE),
  							AP_CLR_ACC					: gfnma_nvl(item.AP_CLR_ACC),
  							CUSTOMER_CATEGORY			: gfnma_nvl(item.CUSTOMER_CATEGORY),
  							LANGUAGE					: gfnma_nvl(item.LANGUAGE),
  							TAX_CODE					: gfnma_nvl(item.TAX_CODE),
  							MAKER_YN					: gfnma_nvl(item.MAKER_YN),
  							EXPECTED_CUSTOMER_YN		: gfnma_nvl(item.EXPECTED_CUSTOMER_YN),
  							WITHHOLD_TAX_YN				: gfnma_nvl(item.WITHHOLD_TAX_YN),
  							WITHHOLD_TAX_OFFICE			: gfnma_nvl(item.WITHHOLD_TAX_OFFICE),
  							WITHHOLD_TAX_OFFICE2		: gfnma_nvl(item.WITHHOLD_TAX_OFFICE2),
  							WITHHOLD_TAX_TYPE			: gfnma_nvl(item.WITHHOLD_TAX_TYPE),
  							TAX_SEND					: gfnma_nvl(item.TAX_SEND),
  							INTERNAL_PAY_RULE_YN		: gfnma_nvl(item.INTERNAL_PAY_RULE_YN),
  							SALES_TAX_SEND				: gfnma_nvl(item.SALES_TAX_SEND),
  							RCPT_CHK_RANGE				: gfnma_nvl(item.RCPT_CHK_RANGE),
  							STEEL_SCRAP_PAY_YN			: gfnma_nvl(item.STEEL_SCRAP_PAY_YN)
  					}
  					jsonCom3430.push(msg);
  					totalRecordCount ++;
  				});
        		com3430Grid.rebuild();
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
	fn_setCom3430Grid();
    
	$(modalId).find('.cu-btn-search').off('click');
	$(modalId).find('.cu-btn-search').click(function(){
		fn_setCom3430Grid();
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