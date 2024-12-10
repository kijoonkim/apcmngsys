<%
/**
 * @Class Name 		: Org1000.jsp
 * @Description 	: 법인정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.23
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.23   	천용진		최초 생성
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
	<title>법인정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3>
                </div>
                <div style="margin-left: auto;">
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
	                            <th scope="row" class="th_bg_search">법인코드</th>
	                            <td colspan="3" class="td_input"  style="border-right:hidden;">
	                            	<sbux-input uitype="text" id="SRCH_COMP_CODE_P" class="form-control input-sm"></sbux-input>	
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">법인명</th>
	                            <td colspan="3" class="td_input"  style="border-right:hidden;">
	                            	<sbux-input uitype="text" id="SRCH_COMP_NAME_P" class="form-control input-sm"></sbux-input>	
	                            </td>
	                            <td></td>
	                            
	                        </tr>
	                    </tbody>
	                </table>
	            </div>    
                <div class="row">
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 법인 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdOrg1000" style="height:600px; width:100%;"></div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>법인 정보</span>
                                </li>
                            </ul>
	                        <div class="ad_tbl_toplist">
	                        	<sbux-button id="btnChangeCompStamp" name="btnChangeCompStamp" uitype="normal" text="직인 추가" class="btn btn-sm btn-outline-danger"  style="float: right; margin-right:1rem;"></sbux-button>
	                        	<sbux-button id="btnChangeCompLogo" name="btnChangeCompLogo" uitype="normal" text="법인 로고 추가" class="btn btn-sm btn-outline-danger"  style="float: right; margin-right:1rem;""></sbux-button>
	                        </div>                            
                        </div>
		                <table class="table table-bordered tbl_fixed">
		                    <caption>검색 조건 설정</caption>
		                    <colgroup>
								<col style="width: 15%">
								<col style="width: 25%">
								<col style="width: 10%">
								<col style="width: 15%">
								<col style="width: 35%">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th scope="row" class="th_bg">법인코드</th>
		                            <td class="td_input"  style="border-right:hidden;">
										<sbux-input uitype="text" id="COMP_CODE" class="form-control input-sm inpt_data_reqed"></sbux-input>	
		                            </td>
		                            <td class="td_input"  style="border-right:hidden;">
		                            </td>
		                            <th scope="row" class="th_bg" colspan="2" style="text-align:left !important">법인 로고</th>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">법인명</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
										<sbux-input uitype="text" id="COMP_NAME" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>
<!-- 										<sbux-input id="COMP_NAME" name="COMP_NAME" model-name="COMP_NAME" uitype="text"  -->
<!-- 											grid-id="masterGrid"  -->
<!-- 											class="form-control input-sm inpt_data_reqed" -->
<!-- 											grid-direction="both" -->
<!-- 											grid-event="valuechanged"> -->
<!-- 										</sbux-input> -->
		                            </td>
		                            <td id="COMP_LOGO_AREA" class="td_input"  style="border-right:hidden;width:100%;" colspan="2" rowspan="3">
                                        <img id="COMP_LOGO" style="width: 410px; height: 105px;object-fit: contain;">
                                        <input type="file" name="COMP_LOGO_FILE" id="COMP_LOGO_FILE" accept="image/*" style="display: none;">		                            
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">법인명(한글)</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
										<sbux-input uitype="text" id="COMP_NAME_CHN" class="form-control input-sm" style="width:100%"></sbux-input>		                            
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">법인영문명</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
										<sbux-input uitype="text" id="COMP_NAME_ENG" class="form-control input-sm inpt_data_reqed" style="width:100%"></sbux-input>		                            
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">법인등록번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<sbux-input uitype="text" id="COMP_REGNO" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		                            
		                            </td>	                        
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                            </td>
		                            <th scope="row" class="th_bg" colspan="2" style="text-align:left !important">직인</th>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">법인설립일</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-datepicker id="ESTABLISH_DATE" name="ESTABLISH_DATE" uitype="popup" datepicker-mode="day" style="height: 3.5vh;width:100%;" class="table-datepicker-ma inpt_data_reqed" date-format="yyyy-mm-dd"></sbux-datepicker>
		                            </td>	                        
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                            </td>
		                            <td id="COMP_STAMP_AREA" class="td_input"  style="border-right:hidden;width:100%;" colspan="2" rowspan="3">
                                        <img id="COMP_STAMP" style="width: 410px; height: 105px;object-fit: contain;">
                                        <input type="file" name="COMP_STAMP_FILE" id="COMP_STAMP_FILE" accept="image/*" style="display: none;">		                            
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">법인대표</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="CEO_NAME" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		
		                            </td>		                        
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">우편번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="ZIP_CODE" class="form-control input-sm inpt_data_reqed inpt_data_reqed" style="width:100%"></sbux-input>		
		                            </td>		                        
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">주소</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="4">
		                                <sbux-input uitype="text" id="ADDRESS" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">영문주소</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="4">
		                                <sbux-input uitype="text" id="ADDRESS_ENG" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">전화번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
		                                <sbux-input uitype="text" id="TEL" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">팩스번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="FAX" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">홈페이지주소</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="4">
		                                <sbux-input uitype="text" id="WEB_URL" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">보통주 수</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
		                                <sbux-input uitype="text" id="STOCK_COUNT" class="form-control input-sm" style="width:100%" value=0></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">보통주 금액</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="STOCK_AMOUNT" class="form-control input-sm" style="width:100%" value=0></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">우선주1 수량</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
		                                <sbux-input uitype="text" id="PRE_STOCK_COUNT1" class="form-control input-sm" style="width:100%" value=0></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">우선주1 금액</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="PRE_STOCK_AMOUNT1" class="form-control input-sm" style="width:100%" value=0></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">우선주2 수량</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
		                                <sbux-input uitype="text" id="PRE_STOCK_COUNT2" class="form-control input-sm" style="width:100%" value=0></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">우선주2 금액</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="PRE_STOCK_AMOUNT2" class="form-control input-sm" style="width:100%" value=0></sbux-input>		
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">기준통화</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										    	type="button"
										    	id="CURRENCY_CODE"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false"
										    	required>
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CURRENCY_CODE style="width:350px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
		                            </td>
			                        <th scope="row" class="th_bg">국가</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										    	type="button"
										    	id="NATION_CODE"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=NATION_CODE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
		                            </td>   
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">회기시작월일</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
		                                <sbux-input uitype="text" id="FISCAL_START_MMDD" class="form-control input-sm inpt_data_reqed" style="width:50%"></sbux-input>
		                            </td>
			                        <th scope="row" class="th_bg">회기종료월일</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="FISCAL_END_MMDD" class="form-control input-sm inpt_data_reqed" style="width:50%"></sbux-input>
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">회계기준</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										    	type="button"
										    	id="ACCT_RULE_CODE"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=ACCT_RULE_CODE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>		                            
									</td>
			                        <th scope="row" class="th_bg">법인코드약칭</th> 
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="COMP_CODE_ABBR" class="form-control input-sm inpt_data_reqed" style="width:100%"></sbux-input>
		                            </td>
		                        </tr>
		                    </tbody>
		                </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-compopup1" 
        	name="modal-compopup1" 
        	uitype="middle" 
        	header-title="" 
        	body-html-id="body-com-popup1" 
        	header-is-close-button="true" footer-is-close-button="false" style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<script type="text/javascript">
	
	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	const fn_initSBSelect = async function() {
// 	    let 
	    let rst = await Promise.all([
	        //기준 통화
	        gfnma_multiSelectInit({
	            target			: ['#CURRENCY_CODE'],
	            compCode		: gv_ma_selectedCorpCd,
	            clientCode		: gv_ma_selectedClntCd,
	            bizcompId		: 'L_COM001',
	            whereClause		: '',
	            formId			: p_formId,
	            menuId			: p_menuId,
	            selectValue		: '',
	            dropType		: 'up', // up, down
	            dropAlign		: 'left', // left, right
	            colValue		: 'CURRENCY_CODE',
	            colLabel		: 'CURRENCY_NAME',
	            columns: [
	            	{ caption: "통화코드", 	ref: 'CURRENCY_CODE', 	width: '100px', style: 'text-align:left' },
	            	{ caption: "통화명", 		ref: 'CURRENCY_NAME', 	width: '150px', style: 'text-align:left' },
	                { caption: "비고",		ref: 'DESCIPTION',	 	width: '200px', style: 'text-align:left' }
	            ]
	        }),
	        //국가
	        gfnma_multiSelectInit({
	            target			: ['#NATION_CODE'],
	            compCode		: gv_ma_selectedCorpCd,
	            clientCode		: gv_ma_selectedClntCd,
	            bizcompId		: 'L_COM015',
	            whereClause		: '',
	            formId			: p_formId,
	            menuId			: p_menuId,
	            selectValue		: '',
	            dropType		: 'up', // up, down
	            dropAlign		: 'left', // left, right
	            colValue		: 'NATION_CODE',
	            colLabel		: 'NATION_NAME',
	            columns: [
	            	{ caption: "국가코드", 	ref: 'NATION_CODE', 	width: '100px', style: 'text-align:left' },
	                { caption: "국가명",		ref: 'NATION_NAME',	 	width: '150px', style: 'text-align:left' }
	            ]
	        }),
	        //회계기준
	        gfnma_multiSelectInit({
	            target			: ['#ACCT_RULE_CODE'],
	            compCode		: gv_ma_selectedCorpCd,
	            clientCode		: gv_ma_selectedClntCd,
	            bizcompId		: 'L_FIM054',
	            whereClause		: '',
	            formId			: p_formId,
	            menuId			: p_menuId,
	            selectValue		: '',
	            dropType		: 'up', // up, down
	            dropAlign		: 'left', // left, right
	            colValue		: 'SUB_CODE',
	            colLabel		: 'CODE_NAME',
	            columns: [
	            	{ caption: "코드", 		ref: 'SUB_CODE', 	width: '100px', style: 'text-align:left' },
	                { caption: "회계기준",	ref: 'CODE_NAME',	width: '150px', style: 'text-align:left' }
	            ]
	        }),
	    ]);
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		console.log('gv_selectedUserType ==>', gv_selectedUserType);
        document.getElementById('btnChangeCompLogo').addEventListener('click', function() {
        	let COMP_CODE = gfn_nvl(SBUxMethod.get("COMP_CODE"));
    		if(COMP_CODE == ''){
    			gfn_comAlert("W0005", "선택한 법인");
    			return;
    		}
    		if(gfn_comConfirm("Q0001", "법인 로고를 수정")){ //{0} 하시겠습니까?
	            document.getElementById('COMP_LOGO_FILE').click();
    		}
        });

        document.getElementById('btnChangeCompStamp').addEventListener('click', function() {
        	let COMP_CODE = gfn_nvl(SBUxMethod.get("COMP_CODE"));
    		if(COMP_CODE == ''){ 
    			gfn_comAlert("W0005", "선택한 법인");
    			return;
    		}
    		if(gfn_comConfirm("Q0001", "직인을 수정")){ //{0} 하시겠습니까?
	            document.getElementById('COMP_STAMP_FILE').click();
    		}
        });
        document.getElementById('COMP_LOGO_FILE').addEventListener('change', function(event) {
            const file = event.target.files[0];
            let COMP_CODE = gfn_nvl(SBUxMethod.get("COMP_CODE"));
            COMP_CODE = COMP_CODE + "_LOGO";
            if(COMP_CODE != "") {
                fn_imgUpload(COMP_CODE, file, "3");
            }
        });
        document.getElementById('COMP_STAMP_FILE').addEventListener('change', function(event) {
            const file = event.target.files[0];
            let COMP_CODE = gfn_nvl(SBUxMethod.get("COMP_CODE"));
            COMP_CODE = COMP_CODE + "_STAMP"
            if(COMP_CODE != "") {
                fn_imgUpload(COMP_CODE, file, "4");
            }
        });
	    fn_initSBSelect();
	    fn_createGrid();
	    cfn_search();
	});

	// 신규
	function cfn_add() {
		fn_clearSubTable();
		fn_setCompData();
	}

	// 저장
	function cfn_save() {
		fn_save();
	}

	// 마스터 그리드 삭제
	function cfn_del() {
	}

	// 조회
	function cfn_search() {
	    fn_search();
	    fn_searchSubTable();
	}

	var masterGrid; 			// 그리드를 담기위한 객체 선언
	var jsonMasterList = []; 	// 그리드의 참조 데이터 주소 선언
	function fn_createGrid() {
	    //법인 리스트 
	    var SBGridProperties = {};
	    SBGridProperties.parentid 		= 'sb-area-grdOrg1000';
	    SBGridProperties.id 			= 'masterGrid';
	    SBGridProperties.jsonref 		= 'jsonMasterList';
	    SBGridProperties.emptyrecords 	= '데이터가 없습니다.';
	    SBGridProperties.selectmode 	= 'byrow';
	    SBGridProperties.explorerbar 	= 'sortmove';
	    SBGridProperties.useinitsorting = true;	    
	    SBGridProperties.rowheader 		= 'seq';
	    SBGridProperties.rowheadercaption = {seq: 'No'};
	    SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	    	{ caption: ["법인코드"],	ref: 'COMP_CODE', type: 'output', width: '220px', style: 'text-align:left' },
	    	{ caption: ["법인명"], 	ref: 'COMP_NAME', type: 'output', width: '220px', style: 'text-align:left' },
	    ];
	    masterGrid = _SBGrid.create(SBGridProperties);
	    masterGrid.bind('click', 'fn_searchSubTable');
	    masterGrid.bind('keyup', 'fn_keyup');
	    masterGrid.bind("valuechanged", "fnChange");
	}
	function fnChange(){
	}

	const fn_keyup = async function(event){
		if(event.keyCode == 38 || event.keyCode == 40 ){
			await fn_searchSubTable();
		}
	}
	/*
	*신규 버튼 기본 법인정보 추가
	*/
	const fn_setCompData = async function() {
		SBUxMethod.attr('COMP_CODE', 'readonly', true);
    	let comp_data = await fn_compData();
    	SBUxMethod.set("COMP_CODE", gfn_nvl(comp_data.COMP_CODE));
    	SBUxMethod.set("COMP_NAME", gfn_nvl(comp_data.COMP_NAME));
    	SBUxMethod.set("COMP_REGNO", gfn_nvl(comp_data.COMP_REGNO));
    	$('#btnChangeCompStamp').find('.sbux-btn-txt').text('직인 추가'); 
    	$('#btnChangeCompLogo').find('.sbux-btn-txt').text('법인 로고 추가');
	}
	
    /**
    * 법인 리스트 조회
    */
    const fn_compData = async function() {
       let COMP_CODE_P	    = gfn_nvl(SBUxMethod.get("SRCH_COMP_CODE_P"));
       let COMP_NAME_P	    = gfn_nvl(SBUxMethod.get("SRCH_COMP_NAME_P"));
       var paramObj = {
    		   V_P_DEBUG_MODE_YN        : ""
			  ,V_P_LANG_ID              : ""
			  ,V_P_COMP_CODE            : ''
			  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
			  ,V_P_COMP_CODE_P          : ''
			  ,V_P_COMP_NAME            : ''
			  ,V_P_FORM_ID              : p_formId
			  ,V_P_MENU_ID              : p_menuId
			  ,V_P_PROC_ID              : ""
			  ,V_P_USERID               : p_userId
			  ,V_P_PC                   : ""
       };
       const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1000.do", {
    	   getType	: 'json',
    	   workType	: 'IMPORT',
    	   cv_count	: '1',
    	   params	: gfnma_objectToString(paramObj)
       });
       const data = await postJsonPromise;
       try {
    	   if (_.isEqual("S", data.resultStatus)) {
                
    	    } else {
    		    alert(data.resultMessage);
    	    }

        } catch (e) {
    	   if (!(e instanceof Error)) {
    		   e = new Error(e);
    	   }
    	   console.error("failed", e.message);
    	   gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
    	}
        return data.cv_1[0];
    }
	
    /**
    * 법인 리스트 조회
    */
    const fn_search = async function() {
       // 법인 리스트 그리드 초기화
       fn_clearForm();
       let COMP_CODE_P	    = gfn_nvl(SBUxMethod.get("SRCH_COMP_CODE_P"));
       let COMP_NAME_P	    = gfn_nvl(SBUxMethod.get("SRCH_COMP_NAME_P"));
       var paramObj = {
    		   V_P_DEBUG_MODE_YN        : ""
			  ,V_P_LANG_ID              : ""
			  ,V_P_COMP_CODE            : COMP_CODE_P
			  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
			  ,V_P_COMP_CODE_P          : COMP_CODE_P
			  ,V_P_COMP_NAME            : COMP_NAME_P
			  ,V_P_FORM_ID              : p_formId
			  ,V_P_MENU_ID              : p_menuId
			  ,V_P_PROC_ID              : ""
			  ,V_P_USERID               : p_userId
			  ,V_P_PC                   : ""
       };
       const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1000.do", {
    	   getType	: 'json',
    	   workType	: 'INFO',
    	   cv_count	: '1',
    	   params	: gfnma_objectToString(paramObj)
       });
       const data = await postJsonPromise;
       try {
    	   if (_.isEqual("S", data.resultStatus)) {
				/** @type {number} **/
				let totalRecordCount = 0;
				masterGrid.length = 0;
				
				//전체 관리지라면 법인정보 전부 다 보이게
				if(gv_selectedUserType == '00'){
					data.cv_1.forEach((item, index) => {
						const msg = {
								COMP_CODE			: gfn_nvl(item.COMP_CODE),
								COMP_NAME			: gfn_nvl(item.COMP_NAME),
								CLIENT_CODE			: gfn_nvl(item.CLIENT_CODE)
					 	}
						jsonMasterList.push(msg);
						totalRecordCount++;
					});
				//전체 관리지가 아니라면 본인이 속한 법인정보만 보이게
				}else{
					data.cv_1.forEach((item, index) => {
						if(gv_ma_selectedCorpCd == item.COMP_CODE){
							const msg = {
									COMP_CODE			: gfn_nvl(item.COMP_CODE),
									COMP_NAME			: gfn_nvl(item.COMP_NAME),
									CLIENT_CODE			: gfn_nvl(item.CLIENT_CODE)
						 	}
							jsonMasterList.push(msg);
							totalRecordCount++;
						}
					});
				}
				
				masterGrid.rebuild();
				document.querySelector('#listCount').innerText = totalRecordCount;
                if(jsonMasterList.length > 0) {
                	masterGrid.clickRow(1);
                }
                
    	    } else {
    		    alert(data.resultMessage);
    	    }

        } catch (e) {
    	   if (!(e instanceof Error)) {
    		   e = new Error(e);
    	   }
    	   console.error("failed", e.message);
    	   gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
    	}
    }
    
    /**
     * 초기화
     */
    function cfn_init() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    const fn_searchSubTable = async function() {
    	
       // 법인정보 테이블 초기화
       
	   const nRow = masterGrid.getRow();
	   if(nRow == -1){
		   return;
	   }
	   const selectRowVal = masterGrid.getRowData(nRow);
	   
       await fn_clearSubTable();
       
       var paramObj = {
    		   V_P_DEBUG_MODE_YN        : ""
			  ,V_P_LANG_ID              : ""
			  ,V_P_COMP_CODE            : gfn_nvl(selectRowVal.COMP_CODE)
			  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
			  ,V_P_COMP_CODE_P          : gfn_nvl(selectRowVal.COMP_CODE)
			  ,V_P_COMP_NAME            : gfn_nvl(selectRowVal.COMP_NAME)
			  ,V_P_FORM_ID              : p_formId
			  ,V_P_MENU_ID              : p_menuId
			  ,V_P_PROC_ID              : ""
			  ,V_P_USERID               : p_userId
			  ,V_P_PC                   : ""
       };
       const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1000.do", {
    	   getType: 'json',
    	   workType: 'DETAIL1',
    	   cv_count: '1',
    	   params: gfnma_objectToString(paramObj)
       });
       const data = await postJsonPromise;
       try {
    	   if (_.isEqual("S", data.resultStatus)) {
// 				await fn_setAcctRuleCode( gfn_nvl(data.cv_1[0].COMP_CODE) );
				await fn_setSubTable( data.cv_1[0] );
    	    } else {
    		    alert(data.resultMessage);
    	    }

        } catch (e) {
    	   if (!(e instanceof Error)) {
    		   e = new Error(e);
    	   }
    	   console.error("failed", e.message);
    	   gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
    	}
    }

//     const fn_setAcctRuleCode = async function(compCode){
//     	if(compCode == ''){
//     		return;
//     	}
//         gfnma_multiSelectInit({
//             target			: ['#ACCT_RULE_CODE'],
//             compCode		: compCode,
//             clientCode		: gv_ma_selectedClntCd,
//             bizcompId		: 'L_FIM054',
//             whereClause		: '',
//             formId			: p_formId,
//             menuId			: p_menuId,
//             selectValue		: '',
//             dropType		: 'up', // up, down
//             dropAlign		: 'left', // left, right
//             colValue		: 'SUB_CODE',
//             colLabel		: 'CODE_NAME',
//             columns: [
//             	{ caption: "코드", 		ref: 'SUB_CODE', 	width: '100px', style: 'text-align:left' },
//                 { caption: "회계기준",	ref: 'CODE_NAME',	width: '150px', style: 'text-align:left' }
//             ]
//         })
//     }

    const fn_setSubTable = async function(obj){
    	if(!obj){
    		return;
    	}
    	SBUxMethod.set('COMP_CODE', 		gfn_nvl(obj.COMP_CODE) );
    	SBUxMethod.set('COMP_NAME', 		gfn_nvl(obj.COMP_NAME) );
    	SBUxMethod.set('COMP_NAME_CHN', 	gfn_nvl(obj.COMP_NAME_CHN) );
    	SBUxMethod.set('COMP_NAME_ENG', 	gfn_nvl(obj.COMP_NAME_ENG) );
    	SBUxMethod.set('COMP_REGNO', 		gfn_nvl(obj.COMP_REGNO) );
    	SBUxMethod.set('ESTABLISH_DATE', 	gfn_nvl(obj.ESTABLISH_DATE) );
    	SBUxMethod.set('CEO_NAME', 			gfn_nvl(obj.CEO_NAME) );
    	SBUxMethod.set('ZIP_CODE', 			gfn_nvl(obj.ZIP_CODE) );
    	SBUxMethod.set('ESTABLISH_DATE', 	gfn_nvl(obj.ESTABLISH_DATE) );
    	SBUxMethod.set('ADDRESS', 			gfn_nvl(obj.ADDRESS) );
    	SBUxMethod.set('ADDRESS_ENG', 		gfn_nvl(obj.ADDRESS_ENG) );
    	SBUxMethod.set('TEL', 				gfn_nvl(obj.TEL) );
    	SBUxMethod.set('FAX', 				gfn_nvl(obj.FAX) );
    	SBUxMethod.set('WEB_URL', 			gfn_nvl(obj.WEB_URL) );
    	SBUxMethod.set('STOCK_COUNT', 		gfn_nvl(addComma(obj.STOCK_COUNT)));
    	SBUxMethod.set('STOCK_AMOUNT', 		gfn_nvl(addComma(obj.STOCK_AMOUNT)));
    	SBUxMethod.set('PRE_STOCK_COUNT1', 	gfn_nvl(addComma(obj.PRE_STOCK_COUNT1)));
    	SBUxMethod.set('PRE_STOCK_AMOUNT1', gfn_nvl(addComma(obj.PRE_STOCK_AMOUNT1)));
    	SBUxMethod.set('PRE_STOCK_COUNT2', 	gfn_nvl(addComma(obj.PRE_STOCK_COUNT2)));
    	SBUxMethod.set('PRE_STOCK_AMOUNT2',	gfn_nvl(addComma(obj.PRE_STOCK_AMOUNT2)));
    	SBUxMethod.set('COMP_NAME_CHN', 	gfn_nvl(obj.COMP_NAME_CHN) );
    	SBUxMethod.set('COMP_CODE_ABBR', 	gfn_nvl(obj.COMP_CODE_ABBR) );
    	SBUxMethod.set('CLIENT_CODE', 		gfn_nvl(obj.CLIENT_CODE) );
    	SBUxMethod.set('FISCAL_START_MMDD', gfn_nvl(obj.FISCAL_START_MMDD) );
    	SBUxMethod.set('FISCAL_END_MMDD',   gfn_nvl(obj.FISCAL_END_MMDD) );
    	
    	gfnma_multiSelectSet('#CURRENCY_CODE', 		'CURRENCY_CODE', 'CURRENCY_NAME', 	gfn_nvl(obj.CURRENCY_CODE));
    	gfnma_multiSelectSet('#NATION_CODE', 		'NATION_CODE', 'NATION_NAME', 		gfn_nvl(obj.NATION_CODE));
        setTimeout(function () {
	    	gfnma_multiSelectSet('#ACCT_RULE_CODE', 	'SUB_CODE', 'CODE_NAME', 			gfn_nvl(obj.ACCT_RULE_CODE));
        }, 200); 	
    	
    	if(gfn_nvl(obj.LOGO_FILE_NAME) != ''){
            $("#COMP_LOGO").attr("src", "/com/getFileImage.do?fkey="+ obj.LOGO_FILE_NAME +"&comp_code="+gfn_nvl(obj.COMP_CODE)+"&client_code=" + gv_ma_selectedClntCd );
    	}
    	if(gfn_nvl(obj.STAMP_FILE_NAME) != ''){
            $("#COMP_STAMP").attr("src", "/com/getFileImage.do?fkey="+ obj.STAMP_FILE_NAME +"&comp_code="+gfn_nvl(obj.COMP_CODE)+"&client_code=" + gv_ma_selectedClntCd );
    	}
    	$('#btnChangeCompStamp').find('.sbux-btn-txt').text('직인 변경'); 
    	$('#btnChangeCompLogo').find('.sbux-btn-txt').text('법인 로고 변경');
    	SBUxMethod.attr('COMP_CODE', 'readonly', true);
    }
    
    const fn_clearSubTable = async function() {
    	SBUxMethod.set('COMP_CODE', 		"");
    	SBUxMethod.set('COMP_NAME', 		"");
    	SBUxMethod.set('COMP_NAME_CHN', 	"");
    	SBUxMethod.set('COMP_NAME_ENG', 	"");
    	SBUxMethod.set('COMP_REGNO', 		"");
    	SBUxMethod.set('ESTABLISH_DATE', 	"");
    	SBUxMethod.set('COMP_LOGO', 		"");
    	SBUxMethod.set('COMP_STAMP', 		"");
    	SBUxMethod.set('CEO_NAME', 			"");
    	SBUxMethod.set('ZIP_CODE', 			"");
    	SBUxMethod.set('ADDRESS', 			"");
    	SBUxMethod.set('ADDRESS_ENG', 		"");
    	SBUxMethod.set('TEL', 				"");
    	SBUxMethod.set('ESTABLISH_DATE', 	"");
    	SBUxMethod.set('FAX', 				"");
    	SBUxMethod.set('WEB_URL', 			"");
    	SBUxMethod.set('STOCK_COUNT', 		"0");
    	SBUxMethod.set('STOCK_AMOUNT', 		"0");
    	SBUxMethod.set('PRE_STOCK_COUNT1', 	"0");
    	SBUxMethod.set('PRE_STOCK_AMOUNT1', "0");
    	SBUxMethod.set('PRE_STOCK_COUNT2', 	"0");
    	SBUxMethod.set('PRE_STOCK_AMOUNT2',	"0");
    	SBUxMethod.set('FISCAL_START_MMDD', "");
    	SBUxMethod.set('FISCAL_END_MMDD', 	"");
    	SBUxMethod.set('COMP_NAME_CHN', 	"");
    	SBUxMethod.set('COMP_CODE_ABBR', 	"");
    	SBUxMethod.set('CLIENT_CODE', 		"");
    	SBUxMethod.set('ACCT_RULE_CODE', 	"");
 
    	gfnma_multiSelectSet('#CURRENCY_CODE', 	'CURRENCY_CODE', 'CURRENCY_NAME', 	"");
    	gfnma_multiSelectSet('#NATION_CODE', 	'NATION_CODE', 'NATION_NAME', 		"");
    	gfnma_multiSelectSet('#ACCT_RULE_CODE', 'SUB_CODE', 'CODE_NAME', 			"");
        $("#COMP_LOGO").attr("src", "" );
        $("#COMP_STAMP").attr("src", "" );
    }
    
	    /**
	     * @name fn_clearForm
	     * @description 그리드 및 화면 초기화
	     * @param 
	     */
	    const fn_clearForm = function() {
	        //법인 리스트 
	        jsonMasterList 	= [];
	    }

	    //그룹코드 내역 저장
	    const fn_save = async function() {
			let workType = 'N';
			const txt = $('#btnChangeCompStamp').find('.sbux-btn-txt').text();
	    	if(txt == '직인 변경'){
	    		workType = 'U';
	    	}
	        if (gfn_nvl(SBUxMethod.get("COMP_CODE")) == "") {
	            gfn_comAlert("W0002", "법인코드");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("COMP_CODE")).length != 4) {
	            gfn_comAlert("E0000", "법인코드는 4자리로 설정해야합니다.");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("COMP_NAME")) == "") {
	            gfn_comAlert("W0002", "법인명");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("COMP_NAME_ENG")) == "") {
	            gfn_comAlert("W0002", "법인영문명");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("COMP_REGNO")) == "") {
	            gfn_comAlert("W0002", "법인등록번호");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("ESTABLISH_DATE")) == "") {
	            gfn_comAlert("W0002", "법인설립일");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("CEO_NAME")) == "") {
	            gfn_comAlert("W0002", "법인대표");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("ZIP_CODE")) == "") {
	            gfn_comAlert("W0002", "우편번호");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("ADDRESS")) == "") {
	            gfn_comAlert("W0002", "주소");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("TEL")) == "") {
	            gfn_comAlert("W0002", "전화번호");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("FISCAL_START_MMDD")) == "") {
	            gfn_comAlert("W0002", "회기시작월일");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("FISCAL_END_MMDD")) == "") {
	            gfn_comAlert("W0002", "회기종료월일");
	            return;
	        }
	        if (gfn_nvl(SBUxMethod.get("COMP_CODE_ABBR")) == "") {
	            gfn_comAlert("W0002", "법인코드약칭");
	            return;
	        }
	        if (gfnma_multiSelectGet("#CURRENCY_CODE") == "") {
	            gfn_comAlert("W0002", "기준통화");
	            return;
	        }
	        if (gfnma_multiSelectGet("#NATION_CODE") == "") {
	            gfn_comAlert("W0002", "국가");
	            return;
	        }
	        if (gfnma_multiSelectGet("#ACCT_RULE_CODE") == "") {
	            gfn_comAlert("W0002", "회계기준");
	            return;
	        }
	        var paramObj = {
        		   V_P_DEBUG_MODE_YN        : ''
       			  ,V_P_LANG_ID              : ''
       			  ,V_P_COMP_CODE            : gfn_nvl(SBUxMethod.get("COMP_CODE"))
       			  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
       			  ,V_P_COMP_CODE_P          : gfn_nvl(SBUxMethod.get("COMP_CODE"))
       			  ,V_P_COMP_NAME            : gfn_nvl(SBUxMethod.get("COMP_NAME"))
       			  ,V_P_COMP_NAME_CHN        : gfn_nvl(SBUxMethod.get("COMP_NAME_CHN"))
       			  ,V_P_COMP_NAME_ENG        : gfn_nvl(SBUxMethod.get("COMP_NAME_ENG"))
       			  ,V_P_COMP_REGNO           : gfn_nvl(SBUxMethod.get("COMP_REGNO"))
       			  ,V_P_ESTABLISH_DATE       : gfn_nvl(SBUxMethod.get("ESTABLISH_DATE"))
       			  ,V_P_COMP_LOGO            : ''
       			  ,V_P_COMP_STAMP           : ''
       			  ,V_P_CEO_NAME             : gfn_nvl(SBUxMethod.get("CEO_NAME"))
       			  ,V_P_ZIP_CODE             : gfn_nvl(SBUxMethod.get("ZIP_CODE"))
       			  ,V_P_ADDRESS              : gfn_nvl(SBUxMethod.get("ADDRESS"))
       			  ,V_P_ADDRESS_ENG          : gfn_nvl(SBUxMethod.get("ADDRESS_ENG")).replace(/,/gi, '')
       			  ,V_P_TEL                  : gfn_nvl(SBUxMethod.get("TEL"))
       			  ,V_P_FAX                  : gfn_nvl(SBUxMethod.get("FAX"))
       			  ,V_P_WEB_URL              : gfn_nvl(SBUxMethod.get("WEB_URL"))
       			  ,V_P_STOCK_COUNT          : removeComma(gfn_nvl(SBUxMethod.get("STOCK_COUNT")) )
       			  ,V_P_STOCK_AMOUNT         : removeComma(gfn_nvl(SBUxMethod.get("STOCK_AMOUNT")))
       			  ,V_P_PRE_STOCK_COUNT1     : removeComma(gfn_nvl(SBUxMethod.get("PRE_STOCK_COUNT1")))
       			  ,V_P_PRE_STOCK_AMOUNT1    : removeComma(gfn_nvl(SBUxMethod.get("PRE_STOCK_AMOUNT1")))
       			  ,V_P_PRE_STOCK_COUNT2     : removeComma(gfn_nvl(SBUxMethod.get("PRE_STOCK_COUNT2")))
       			  ,V_P_PRE_STOCK_AMOUNT2    : removeComma(gfn_nvl(SBUxMethod.get("PRE_STOCK_AMOUNT2")))
       			  ,V_P_FISCAL_START_MMDD    : gfn_nvl(SBUxMethod.get("FISCAL_START_MMDD"))
       			  ,V_P_FISCAL_END_MMDD      : gfn_nvl(SBUxMethod.get("FISCAL_END_MMDD"))
       			  ,V_P_CURRENCY_CODE        : gfnma_multiSelectGet("#CURRENCY_CODE")
       			  ,V_P_ACCT_RULE_CODE       : gfnma_multiSelectGet("#ACCT_RULE_CODE")
       			  ,V_P_COMP_CODE_ABBR       : gfn_nvl(SBUxMethod.get("COMP_CODE_ABBR"))
       			  ,V_P_NATION_CODE          : gfnma_multiSelectGet("#NATION_CODE") 
       			  ,V_P_FORM_ID              : p_formId
       			  ,V_P_MENU_ID              : p_menuId
       			  ,V_P_PROC_ID              : ''
       			  ,V_P_USERID               : p_userId
       			  ,V_P_PC                   : ''
	        };
	        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg1000.do", {
	            getType: 'json',
	            workType: workType,
	            cv_count: '0',
	            params: gfnma_objectToString(paramObj)
	        });
	        const data = await postJsonPromise;
	        try {
	            if (_.isEqual("S", data.resultStatus)) {
	                if (data.resultMessage) {
	                    alert(data.resultMessage);
	                }
	                cfn_search();
	            } else {
	                alert(data.resultMessage);
	            }
	        } catch (e) {
	            if (!(e instanceof Error)) {
	                e = new Error(e);
	            }
	            console.error("failed", e.message);
	            gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	        }
	    }
	    
	    
	    const fn_changeCompLogo = async function() {
	    	let COMP_CODE = gfn_nvl(SBUxMethod.get("COMP_CODE"))
	    	if(COMP_CODE != ''){
		    	$('#COMP_LOGO_FILE').trigger('change');
	    	}
	    }
	    
	    const fn_changeCompStamp = async function() {
	    	let COMP_CODE = gfn_nvl(SBUxMethod.get("COMP_CODE"))
	    	if(COMP_CODE != ''){
		    	$('#COMP_STAMP_FILE').trigger('change');
	    	}
	    }
	    
	    const fn_imgUpload = async function(key, file, type) {
	        var paramData 	= new FormData();
	        var COMP_CODE 	= SBUxMethod.get("COMP_CODE");
	        
	        paramData.append("files", 			file);
	        paramData.append("type", 			type);			// 1:사진 , 2:싸인
	        paramData.append("empCode", 		key);		// 키값 여기서는 법인정보 -> 법인코드를 이용
	        paramData.append("comp_code", 		COMP_CODE);		// 법인 번호
	        paramData.append("client_code", 	gv_ma_selectedClntCd);
	        paramData.append("formID", 			p_formId);
	        paramData.append("menuId", 			p_menuId);

	        const postJsonPromise = gfn_postFormData("/com/hrImageUpload.do", paramData);
	        const data = await postJsonPromise;
	        try {
	            if (_.isEqual("S", data.resultStatus)) {
	                if(type == "3") {
	                    $("#COMP_LOGO").attr("src", "/com/getFileImage.do?fkey="+data.imgKey+"&comp_code="+COMP_CODE+"&client_code=" + gv_ma_selectedClntCd );
	                } else if(type == "4") {
	                    $("#COMP_STAMP").attr("src", "/com/getFileImage.do?fkey="+data.imgKey+"&comp_code="+COMP_CODE+"&client_code=" + gv_ma_selectedClntCd );
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
	    
	    function addComma(val){
	    	if(gfn_isEmpty(val) || val.toString().length < 3){
	    		return val.toString();
	    	}
	    	let str = val.toString();
	    	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    }
	    
	    function removeComma(val){
	    	if( gfn_isEmpty(val) || val.toString().length < 3){
	    		return '0';
	    	}
	    	let str = val.toString();
	    	return str.replace(/,/gi, '');
	    }
	    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>