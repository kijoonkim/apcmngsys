<%
/**
 * @Class Name 		: org2100.jsp
 * @Description 	: 조직개편등록
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.22
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.20   	천용진		최초 생성
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
	<title>title : 조직개편등록</title>
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
	                <table class="table table-bordered tbl_fixed table-search-ma">
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
	                            <th scope="row" class="th_bg_search">현재일자</th>
	                            <td class="td_input"  style="border-right:hidden;">
	                                <sbux-datepicker id="SRCH_TODAY_DATE" name="SRCH_TODAY_DATE" uitype="popup" date-format="yyyy-mm-dd" style="height: 3.6vh;width: 100%;" readonly class="table-datepicker-ma"></sbux-datepicker>
	                            </td>
	                            <td colspan="3"></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>    
                <div class="row">
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 조직도</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdOrg2100" style="height:75vh;width:100%;"></div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>조직도 변경</span>
                                </li>
                            </ul>
	                        <div class="ad_tbl_toplist">
	                        	<sbux-button id="btnCancelOrg" name="btnCancelOrg" uitype="normal" text="조직도 변경 취소" class="btn btn-sm btn-outline-danger" onclick="fn_save('CANCEL')" style="float: right; margin-right:1rem;""></sbux-button>
	                        	<sbux-button id="btnAddOrg" name="btnAddOrg" uitype="normal" text="조직도 변경 적용" class="btn btn-sm btn-outline-danger" onclick="fn_save('APPLY')" style="float: right; margin-right:1rem;"></sbux-button>
	                        </div>
                        </div>
		                <table class="table table-bordered tbl_fixed">
		                    <caption>검색 조건 설정</caption>
		                    <colgroup>
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 15%">
								<col style="width: 45%">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th scope="row" class="th_bg">변경번호</th>
		                            <td class="td_input"  style="border-right:hidden;">
										<sbux-input uitype="text" id="CHANGE_DATE_KEY" class="form-control input-sm" readonly></sbux-input>	
		                            </td>
		                            <td class="td_input"  style="border-right:hidden;">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_changeDateKey" ></sbux-button>
		                            </td>
		                            <th scope="row" class="th_bg">변경일자</th>
		                            <td class="td_input"  style="border-right:hidden;" colspan="2">
                                		<sbux-datepicker id="CHANGE_DATE" name="CHANGE_DATE" uitype="popup" date-format="yyyy-mm-dd" style="height: 3.6vh;width: 120px;" readonly class="inpt_data_reqed" onchange="fn_search('CHANGE')" group-id="panAppoint" required></sbux-datepicker>
		                            </td>		                            
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">메모</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="5">
										<sbux-input uitype="text" id="MEMO1" class="form-control input-sm" style="width:100%" onchange="fn_search('CHANGE')"></sbux-input>		                            
		                            </td>		                        
		                        </tr>
		                    </tbody>
		                </table> 
	                    <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>조직도 편집</span>
                                </li>
                            </ul>
	                        <div class="ad_tbl_toplist">
	                        	<sbux-button id="btnDelRow" name="btnDelRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow" style="float: right; margin-right:1rem;""></sbux-button>
	                        	<sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right; margin-right:1rem;"></sbux-button>
	                        	<sbux-button id="btnSave"   name="btnSave"   uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_btnSave"	 style="float: right; margin-right:1rem;"></sbux-button>
	                        </div>                        
                        </div>
		                <div class="col-sm-5">
	                        <div>
	                            <div id="sb-area-subGrdOrg2100" style="height:62vh;width:100%;"></div>
	                        </div>
		                </div>
		                <div class="col-sm-7">
			                <table class="table table-bordered tbl_fixed">
			                    <caption>검색 조건 설정</caption>
			                    <colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 30%">
									<col style="width: 10%">
			                    </colgroup>
			                    <tbody>
			                        <tr>
			                            <th scope="row" class="th_bg">사업장</th>
			                            <td class="td_input"  style="border-right:hidden;" colspan="3">
											<div class="dropdown">
											    <button
											    	style="width:160px;text-align:left" 
											    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
											    	type="button" 
											    	id="SITE_CODE1" 
											    	data-toggle="dropdown" 
											    	aria-haspopup="true" 
											    	aria-expanded="false"
											    	group-id="panAppoint" required>
											    	<font>선택</font>
											        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											    </button>
											    <div class="dropdown-menu" aria-labelledby=SITE_CODE1 style="width:250px;height:150px;padding-top:0px;overflow:auto">
											    </div>
											</div>  
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">부서코드</th>
			                            <td class="td_input"style="border-right:hidden;" colspan="3">
			                            	<sbux-input uitype="text" id="DEPT_CODE" class="form-control input-sm inpt_data_reqed" readonly group-id="panAppoint" required></sbux-input>		
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">부서명</th>
			                            <td class="td_input" style="border-right:hidden;" colspan="3">
			                            	<sbux-input uitype="text" id="DEPT_NAME" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required></sbux-input>		
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">약칭</th>
			                            <td class="td_input" style="border-right:hidden;" colspan="3">
			                            	<sbux-input uitype="text" id="DEPT_ABBR_NAME" class="form-control input-sm" ></sbux-input>		
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">부서명(영문)</th>
			                            <td class="td_input"  style="border-right:hidden;" colspan="3">
			                            	<sbux-input uitype="text" id="DEPT_NAME_ENG" class="form-control input-sm" ></sbux-input>		
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">부서명(한문)</th>
			                            <td class="td_input"  style="border-right:hidden;" colspan="3">
			                            	<sbux-input uitype="text" id="DEPT_NAME_FOR" class="form-control input-sm" ></sbux-input>	
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">상위부서</th>
			                            <td class="td_input"  style="border-right:hidden;">
											<sbux-input uitype="text" id="PARENT_DEPT" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input"  style="border-right:hidden;">
											<sbux-input uitype="text" id="PARENT_DEPT_NAME" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input">
											<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupParentDept" ></sbux-button>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">부서장</th>
			                            <td class="td_input"  style="border-right:hidden;">
											<sbux-input uitype="text" id="DEPT_LEADER" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input"  style="border-right:hidden;">
											<sbux-input uitype="text" id="DEPT_LEADER_NAME" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input">
											<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupDeptLeader" ></sbux-button>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">부서구분</th>
			                            <td class="td_input"  style="border-right:hidden;">
											<div class="dropdown">
											    <button 
											    	style="width:160px;text-align:left" 
											    	class="btn btn-sm btn-light dropdown-toggle" 
											    	type="button" 
											    	id="DEPT_CATEGORY" 
											    	data-toggle="dropdown" 
											    	aria-haspopup="true" 
											    	aria-expanded="false">
											    	<font>선택</font>
											        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											    </button>
											    <div class="dropdown-menu" aria-labelledby=DEPT_CATEGORY style="width:250px;height:150px;padding-top:0px;overflow:auto">
											    </div>
											</div>  
										</td>
			                            <td class="td_input"  style="border-right:hidden;" colspan="2">
											<div class="dropdown">
											    <button 
											    	style="width:160px;text-align:left" 
											    	class="btn btn-sm btn-light dropdown-toggle" 
											    	type="button" 
											    	id="DEPT_GUBUN" 
											    	data-toggle="dropdown" 
											    	aria-haspopup="true" 
											    	aria-expanded="false">
											    	<font>선택</font>
											        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											    </button>
											    <div class="dropdown-menu" aria-labelledby=DEPT_GUBUN style="width:250px;height:150px;padding-top:0px;overflow:auto">
											    </div>
											</div>  
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">인건비분류</th>
			                            <td class="td_input"  style="border-right:hidden;" colspan="3">
											<div class="dropdown">
											    <button 
											    	style="width:160px;text-align:left" 
											    	class="btn btn-sm btn-light dropdown-toggle" 
											    	type="button" 
											    	id="LABOR_COST_GROUP" 
											    	data-toggle="dropdown" 
											    	aria-haspopup="true" 
											    	aria-expanded="false">
											    	<font>선택</font>
											        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											    </button>
											    <div class="dropdown-menu" aria-labelledby=LABOR_COST_GROUP style="width:250px;height:150px;padding-top:0px;overflow:auto">
											    </div>
											</div>  
			                            </td>
			                        </tr>
			                        <tr>
			                            <td class="td_input" colspan="4" style="border-right:hidden; width:100%;">
			                            	<div style="display: flex; gap: 10px;">
		                            			<sbux-checkbox id="SALES_DEPT_YN" 		uitype="normal" text="영업부서" 	true-value="Y" false-value="N" style="margin: 5px;"></sbux-checkbox>
		                            			<sbux-checkbox id="MARKETING_DEPT_YN"	uitype="normal" text="마케팅부서"	true-value="Y" false-value="N" style="margin: 5px;"></sbux-checkbox>
		                            			<sbux-checkbox id="PRODUCTION_DEPT_YN"	uitype="normal" text="생산팀" 	true-value="Y" false-value="N" style="margin: 5px;"></sbux-checkbox>
		                            			<sbux-checkbox id="FINANCE_DEPT_YN" 	uitype="normal" text="회계부서" 	true-value="Y" false-value="N" style="margin: 5px;"></sbux-checkbox>
			                            	</div>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">원가조직</th>
			                            <td class="td_input"  style="border-right:hidden;">
											<sbux-input uitype="text" id="CC_CODE"class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input"  style="border-right:hidden;">
											<sbux-input uitype="text" id="CC_NAME" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input">
											<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupCcCode" ></sbux-button>
			                            </td>
			                        </tr>
			                   
			                        <tr>
			                            <th scope="row" class="th_bg">우편번호</th>
			                            <td class="td_input"  style="border-right:hidden;" colspan="2">
											<sbux-input uitype="text" id="ZIP_CODE" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                            <td class="td_input">
											<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup" text="…" class="btn btn-xs btn-outline-dark"></sbux-button>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">주소</th>
			                            <td class="td_input" style="border-right:hidden;" colspan="3">
											<sbux-input uitype="text" id="ADDRESS" class="form-control input-sm" ></sbux-input>			                            
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">정원</th>
			                            <td class="td_input" style="border-right:hidden;" colspan="3">
											<sbux-input uitype="text" id="FIXED_NUMBER" class="form-control input-sm" value="0"></sbux-input>			                            
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">비고</th>
			                            <td class="td_input" style="border-right:hidden;" colspan="3">
											<sbux-textarea uitype="normal" id="MEMO" class="form-control input-sm"></sbux-textarea>			                            
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">정렬순서</th>
			                            <td class="td_input" style="border-right:hidden;" colspan="3">
											<sbux-input uitype="text" id="SORT_SEQ" class="form-control input-sm inpt_data_reqed" value="0" required></sbux-input>			                            
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row" class="th_bg">사용여부</th>
			                            <td class="td_input"  style="border-right:hidden;">
	                            			<sbux-checkbox id="USE_YN" uitype="normal" text="사용" 	true-value="Y" false-value="N" ></sbux-checkbox>
			                            </td>
			                            <td class="td_input" colspan="2">
			                            </td>
			                        </tr>
			                    </tbody>
			                </table>
		                </div>
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
	var jsonEmpState = []; // 재직구분
	const fn_initSBSelect = async function() {
	    
	    let rst = await Promise.all([
		    SBUxMethod.set("SRCH_TODAY_DATE", gfn_dateToYmd(new Date())),
		    //재직구분
		    gfnma_setComSelect([''], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	        //사업장
	        gfnma_multiSelectInit({
	            target: ['#SITE_CODE1'],
	            compCode: gv_ma_selectedCorpCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_ORG001',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'down', // up, down
	            dropAlign: 'left', // left, right
	            colValue: 'SITE_CD',
	            colLabel: 'SITE_NM',
	            columns: [
	            	{ caption: "사업장코드", 	ref: 'SITE_CD', width: '100px', style: 'text-align:left' },
	                { caption: "사업장명",	ref: 'SITE_NM', width: '150px', style: 'text-align:left' }
	            ]
	        }),
		    
	        //부서구분_1
	        gfnma_multiSelectInit({
	            target: ['#DEPT_CATEGORY'],
	            compCode: gv_ma_selectedCorpCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_ORG010',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'down', // up, down
	            dropAlign: 'left', // left, right
	            colValue: 'SBSD_CD',
	            colLabel: 'CD_NM',
	            columns: [
	            	{ caption: "코드", 	ref: 'SBSD_CD', width: '100px', style: 'text-align:left' },
	                { caption: "부서구분",	ref: 'CD_NM', width: '150px', style: 'text-align:left' }
	            ]
	        }),
		    
	        //부서구분_2
	        gfnma_multiSelectInit({
	            target: ['#DEPT_GUBUN'],
	            compCode: gv_ma_selectedCorpCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_ORG012',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'down', // up, down
	            dropAlign: 'right', // left, right
	            colValue: 'SBSD_CD',
	            colLabel: 'CD_NM',
	            columns: [
	            	{ caption: "코드", 	ref: 'SBSD_CD', width: '100px', style: 'text-align:left' },
	                { caption: "부서구분",	ref: 'CD_NM', width: '150px', style: 'text-align:left' }
	            ]
	        }),
		    
	        //인건비분류
	        gfnma_multiSelectInit({
	            target: ['#LABOR_COST_GROUP'],
	            compCode: gv_ma_selectedCorpCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_HRI007',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'down', // up, down
	            dropAlign: 'right', // left, right
	            colValue: 'SBSD_CD',
	            colLabel: 'CD_NM',
	            columns: [
	            	{ caption: "인건비분류코드", 	ref: 'SBSD_CD', width: '100px', style: 'text-align:left' },
	                { caption: "인건비분류",	ref: 'CD_NM', width: '150px', style: 'text-align:left' }
	            ]
	        }),
	    ]);
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
	    $('#CHANGE_DATE').change(async function(){
	    	await fn_search('CHANGE');
	    });
	    fn_initSBSelect();
	    fn_createGrid();
	    fn_createSubGrid();
	    cfn_search();
	});

	// 신규
	function cfn_add() {
	    fn_clearFormNew();
	    SBUxMethod.attr('DEPT_CODE', 'readonly', 'false');
	    SBUxMethod.attr('btnAddOrg', 'disabled', 'true');
	    SBUxMethod.attr('btnAddRow', 'disabled', 'true');
	    SBUxMethod.attr('btnDelRow', 'disabled', 'true');
	}

	// 저장
	function cfn_save() {
	    if (gfn_comConfirm("Q0001", "저장")) { //{0} 하시겠습니까?
	        fn_save();
	    }
	}

	// 마스터 그리드 삭제
	function cfn_del() {
	    fn_delete();
	}

	// 조회
	function cfn_search() {
	    fn_search('TODAY');
	}

	var masterTreeGrid; 			// 그리드를 담기위한 객체 선언
	var jsonMasterTreeList = []; 	// 그리드의 참조 데이터 주소 선언
	var subTreeGrid; 				// 그리드를 담기위한 객체 선언
	var jsonSubTreeList = []; 		// 그리드의 참조 데이터 주소 선언

	function fn_createGrid() {
	    //코드목록 
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOrg2100';
	    SBGridProperties.id = 'masterTreeGrid';
	    SBGridProperties.jsonref = 'jsonMasterTreeList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.rowheadercaption = {seq: 'No'};
	    SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.tree = {
	        col: 1,
	        levelref: "LVL",
	        open: true,
	        lock: true
	    };
	    SBGridProperties.columns = [{
	            caption: ["부서명"],
	            ref: 'DEPT_NAME',
	            type: 'output',
	            width: '220px',
	            style: 'text-align:left'
	        },
	        {
	            caption: ["부서코드"],
	            ref: 'DEPT_CODE',
	            type: 'output',
	            width: '100px',
	            style: 'text-align:left'
	        },
	        {
	            caption: ["사업장"],
	            ref: 'SITE_NAME',
	            type: 'output',
	            width: '150px',
	            style: 'text-align:left'
	        },
	    ];
	    masterTreeGrid = _SBGrid.create(SBGridProperties);
	}
	
	const fn_createSubGrid = async function(){
	    //조직도 편집  
	    var SBSubGridProperties = {};
	    SBSubGridProperties.parentid = 'sb-area-subGrdOrg2100';
	    SBSubGridProperties.id = '';
	    SBSubGridProperties.jsonref = 'jsonSubTreeList';
	    SBSubGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBSubGridProperties.selectmode = 'byrow';
	    SBSubGridProperties.explorerbar = 'sortmove';
	    SBSubGridProperties.rowheader = 'seq';
	    SBSubGridProperties.extendlastcol = 'scroll';
	    SBSubGridProperties.tree = {
	        col: 1,
	        levelref: "LVL",
	        open: true,
	        lock: true
	    };
	    SBSubGridProperties.columns = [{
	            caption: ["부서명"],
	            ref: 'DEPT_NAME',
	            type: 'output',
	            width: '220px',
	            style: 'text-align:left'
	        },
	        {
	            caption: ["부서코드"],
	            ref: 'DEPT_CODE',
	            type: 'output',
	            width: '100px',
	            style: 'text-align:left'
	        },
	        {
	            caption: ["사업장"],
	            ref: 'SITE_NAME',
	            type: 'output',
	            width: '150px',
	            style: 'text-align:left'
	        },
	    ];
	    subTreeGrid = _SBGrid.create(SBSubGridProperties);
	    subTreeGrid.bind('click', 'fn_viewSubTable');
	    subTreeGrid.bind('keyup', 'fn_keyup');
	}

	const fn_keyup = async function(event){
		if(event.keyCode == 38 || event.keyCode == 40 ){
			await fn_viewSubTable();
		}
	}
	
    /**
    * 코드목록 조회
    */
    const fn_search = async function(workType) {

       // 코드목록 그리드 초기화
       fn_clearForm();
       
       let DATE = '';
       if (workType == 'TODAY'){
    	   DATE =  gfn_nvl(SBUxMethod.get("SRCH_TODAY_DATE"));
       } else {
	       DATE =  gfn_nvl(SBUxMethod.get("CHANGE_DATE"));
       }
       var paramObj = {
    	   V_P_DEBUG_MODE_YN		: '',
    	   V_P_LANG_ID				: '',
    	   V_P_COMP_CODE			: gv_ma_selectedCorpCd,
    	   V_P_CLIENT_CODE			: gv_ma_selectedClntCd,
    	   V_P_TODAY_DATE			: DATE,
    	   V_P_FORM_ID				: p_formId,
    	   V_P_MENU_ID				: p_menuId,
    	   V_P_PROC_ID				: '',
    	   V_P_USERID				: p_userId,
    	   V_P_PC					: ''
       };
       const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg2100.do", {
    	   getType: 'json',
    	   workType: workType,
    	   cv_count: '2',
    	   params: gfnma_objectToString(paramObj)
       });
       const data = await postJsonPromise;
       try {
    	   if (_.isEqual("S", data.resultStatus)) {
				if(workType == 'TODAY'){
					/** @type {number} **/
					let totalRecordCount = 0;
					
					masterTreeGrid.length = 0;
					data.cv_1.forEach((item, index) => {
						const msg = {
							LVL					: gfn_nvl(item.LVL),
							NODESTATUS			: gfn_nvl(item.NODESTATUS),
							DEPT_CODE			: gfn_nvl(item.DEPT_CD),
							DEPT_NAME			: gfn_nvl(item.DEPT_NM),
							DEPT_NAME_ENG		: gfn_nvl(item.DEPT_NM_ENG),
							DEPT_NAME_FOR		: gfn_nvl(item.DEPT_NM_KOR),
							DEPT_ABBR_NAME		: gfn_nvl(item.DEPT_ABBR_NM),
							SITE_CODE			: gfn_nvl(item.SITE_CD),
							SITE_NAME			: gfn_nvl(item.SITE_NM),
							PARENT_DEPT			: gfn_nvl(item.PRNT_DEPT),
							PARENT_DEPT_NAME	: gfn_nvl(item.PARENT_DEPT_NAME),
							DEPT_LEADER			: gfn_nvl(item.DEPT_TMLDR),
							DEPT_LEADER_NAME	: gfn_nvl(item.DEPT_LEADER_NAME),
							SALES_DEPT_YN		: gfn_nvl(item.SALS_DEPT_YN),
							MARKETING_DEPT_YN	: gfn_nvl(item.MRKTNG_DEPT_YN),
							PRODUCTION_DEPT_YN	: gfn_nvl(item.PRDCTN_DEPT_YN),
							FINANCE_DEPT_YN		: gfn_nvl(item.FA_DEPT_YN),
							MEMO				: gfn_nvl(item.MEMO),
							HEADER_DESCR		: gfn_nvl(item.HEADER_DESCR),
							KEYID				: gfn_nvl(item.KEY_ID),
							PARENTKEYID			: gfn_nvl(item.UP_KEY_ID),
							CLIENT_CODE			: gfn_nvl(item.CLNT_CD),
							COMP_CODE			: gfn_nvl(item.CO_CD)
					 	}
						jsonMasterTreeList.push(msg);
						totalRecordCount++;
					});
					masterTreeGrid.rebuild();
					document.querySelector('#listCount').innerText = totalRecordCount;
					
				}else if(workType == 'CHANGE'){
					if(data.cv_2.length > 0){
						SBUxMethod.set("MEMO1", gfn_nvl(data.cv_2[0].HEADER_DESCR) );
						if(data.cv_2[0].TEMP == 'Y'){
							SBUxMethod.set("CHANGE_DATE_KEY", gfn_nvl(SBUxMethod.get("CHANGE_DATE")) );
						}else{
							SBUxMethod.set("CHANGE_DATE_KEY", "" );
						}
					}
					data.cv_2.forEach((item, index) => {
		    			   const msg = {
		    				   TEMP					: gfn_nvl(item.TEMP),
		    				   LVL					: gfn_nvl(item.LVL),
		    				   DEPT_CODE			: gfn_nvl(item.DEPT_CD),
		    				   DEPT_NAME			: gfn_nvl(item.DEPT_NM),
		    				   DEPT_NAME_ENG		: gfn_nvl(item.DEPT_NM_ENG),
		    				   DEPT_NAME_FOR		: gfn_nvl(item.DEPT_NM_KOR),
		    				   DEPT_ABBR_NAME		: gfn_nvl(item.DEPT_ABBR_NM),
		    				   SITE_CODE			: gfn_nvl(item.SITE_CD),
		    				   SITE_NAME			: gfn_nvl(item.SITE_NM),
		    				   PARENT_DEPT			: gfn_nvl(item.PRNT_DEPT),
		    				   PARENT_DEPT_NAME		: gfn_nvl(item.PARENT_DEPT_NAME),
		    				   DEPT_LEADER			: gfn_nvl(item.DEPT_TMLDR),
		    				   DEPT_LEADER_NAME		: gfn_nvl(item.DEPT_LEADER_NAME),
		    				   DEPT_CATEGORY		: gfn_nvl(item.DEPT_CTRGY),
		    				   DEPT_GUBUN			: gfn_nvl(item.DEPT_GUBUN),
		    				   LABOR_COST_GROUP		: gfn_nvl(item.LBRCO_GROUP),
		    				   SALES_DEPT_YN		: gfn_nvl(item.SALS_DEPT_YN),
		    				   MARKETING_DEPT_YN	: gfn_nvl(item.MRKTNG_DEPT_YN),
		    				   PRODUCTION_DEPT_YN	: gfn_nvl(item.PRDCTN_DEPT_YN),
		    				   FINANCE_DEPT_YN		: gfn_nvl(item.FA_DEPT_YN),
		    				   CC_CODE				: gfn_nvl(item.CSTCT_CD),
		    				   CC_NAME				: gfn_nvl(item.CSTCT_NM),
		    				   ZIP_CODE				: gfn_nvl(item.ZIP_CD),
		    				   ADDRESS				: gfn_nvl(item.ADDR),
		    				   FIXED_NUMBER			: gfn_nvl(item.PSCP_NO),
		    				   MEMO					: gfn_nvl(item.MEMO),
		    				   SORT_SEQ				: gfn_nvl(item.SORT_SEQ),
		    				   USE_YN				: gfn_nvl(item.USE_YN),
		    				   HEADER_DESCR			: gfn_nvl(item.HEADER_DESCR),
		    				   KEYID				: gfn_nvl(item.KEY_ID),
		    				   PARENTKEYID			: gfn_nvl(item.UP_KEY_ID),
		    				   CLIENT_CODE			: gfn_nvl(item.CLNT_CD),
		    				   COMP_CODE			: gfn_nvl(item.CO_CD)
		    			   }
		    			   jsonSubTreeList.push(msg);
		    		   });
	            	subTreeGrid.rebuild();
                    if(jsonSubTreeList.length > 0) {
                    	subTreeGrid.clickRow(1);
                    }
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

    const fn_viewSubTable = async function() {
    	
    	await fn_clearSubTable();
        var nRow = subTreeGrid.getRow();
		if(nRow == -1){
			return;
		}
        var rowData = subTreeGrid.getRowData(nRow);
    	SBUxMethod.set('DEPT_CODE', 		  gfn_nvl(rowData.DEPT_CODE ));
    	SBUxMethod.set('DEPT_NAME', 		  gfn_nvl(rowData.DEPT_NAME ));
    	SBUxMethod.set('DEPT_ABBR_NAME', 	  gfn_nvl(rowData.DEPT_ABBR_NAME ));
    	SBUxMethod.set('DEPT_NAME_ENG', 	  gfn_nvl(rowData.DEPT_NAME_ENG ));
    	SBUxMethod.set('DEPT_NAME_FOR', 	  gfn_nvl(rowData.DEPT_NAME_FOR ));
    	SBUxMethod.set('PARENT_DEPT', 		  gfn_nvl(rowData.PARENT_DEPT ));
    	SBUxMethod.set('PARENT_DEPT_NAME',    gfn_nvl(rowData.PARENT_DEPT_NAME ));
    	SBUxMethod.set('DEPT_LEADER', 		  gfn_nvl(rowData.DEPT_LEADER ));
    	SBUxMethod.set('DEPT_LEADER_NAME', 	  gfn_nvl(rowData.DEPT_LEADER_NAME ));
    	SBUxMethod.set('CC_CODE', 			  gfn_nvl(rowData.CC_CODE ));
    	SBUxMethod.set('CC_NAME', 			  gfn_nvl(rowData.CC_NAME ));
    	SBUxMethod.set('ZIP_CODE', 			  gfn_nvl(rowData.ZIP_CODE ));
    	SBUxMethod.set('ADDRESS', 			  gfn_nvl(rowData.ADDRESS ));
    	SBUxMethod.set('FIXED_NUMBER', 		  gfn_nvl(rowData.FIXED_NUMBER ));
    	SBUxMethod.set('MEMO', 				  gfn_nvl(rowData.MEMO));
    	SBUxMethod.set('SORT_SEQ', 			  gfn_nvl(rowData.SORT_SEQ));
    	SBUxMethod.set('USE_YN', 			  gfn_nvl(rowData.USE_YN));
    	SBUxMethod.set('SALES_DEPT_YN', 	  gfn_nvl(rowData.SALES_DEPT_YN));
    	SBUxMethod.set('MARKETING_DEPT_YN',   gfn_nvl(rowData.MARKETING_DEPT_YN));
    	SBUxMethod.set('PRODUCTION_DEPT_YN',  gfn_nvl(rowData.PRODUCTION_DEPT_YN));
    	SBUxMethod.set('FINANCE_DEPT_YN', 	  gfn_nvl(rowData.FINANCE_DEPT_YN));	
    	SBUxMethod.attr('DEPT_CODE', 'readonly', 'true');
    	gfnma_multiSelectSet('#SITE_CODE1', 		'SITE_CD', 'SITE_NM', gfn_nvl(rowData.SITE_CODE));
    	gfnma_multiSelectSet('#DEPT_CATEGORY', 		'SBSD_CD', 'CD_NM',  gfn_nvl(rowData.DEPT_CATEGORY));
    	gfnma_multiSelectSet('#DEPT_GUBUN', 		'SBSD_CD', 'CD_NM',  gfn_nvl(rowData.DEPT_GUBUN));
    	gfnma_multiSelectSet('#LABOR_COST_GROUP', 	'SBSD_CD', 'CD_NM',  gfn_nvl(rowData.LABOR_COST_GROUP));
    }
    
    const fn_clearSubTable = async function() {
    	jsonSubTreeList = [];
    	SBUxMethod.set('DEPT_CODE', 		"");
    	SBUxMethod.set('DEPT_NAME', 		"");
    	SBUxMethod.set('DEPT_ABBR_NAME', 	"");
    	SBUxMethod.set('DEPT_NAME_ENG', 	"");
    	SBUxMethod.set('DEPT_NAME_FOR', 	"");
    	SBUxMethod.set('PARENT_DEPT', 		"");
    	SBUxMethod.set('PARENT_DEPT_NAME', 	"");
    	SBUxMethod.set('DEPT_LEADER', 		"");
    	SBUxMethod.set('DEPT_LEADER_NAME', 	"");
    	SBUxMethod.set('CC_CODE', 			"");
    	SBUxMethod.set('CC_NAME', 			"");
    	SBUxMethod.set('ZIP_CODE', 			"");
    	SBUxMethod.set('ADDRESS', 			"");
    	SBUxMethod.set('FIXED_NUMBER', 		"");
    	SBUxMethod.set('MEMO', 				"");
    	SBUxMethod.set('SORT_SEQ', 			"");
    	SBUxMethod.set('USE_YN', 			"N");
    	SBUxMethod.set('SALES_DEPT_YN', 	"N");
    	SBUxMethod.set('MARKETING_DEPT_YN', "N");
    	SBUxMethod.set('PRODUCTION_DEPT_YN',"N");
    	SBUxMethod.set('FINANCE_DEPT_YN', 	"N");
    	gfnma_multiSelectSet('#SITE_CODE1', 		'', '', "");
    	gfnma_multiSelectSet('#DEPT_CATEGORY', 		'', '', "");
    	gfnma_multiSelectSet('#DEPT_GUBUN', 		'', '', "");
    	gfnma_multiSelectSet('#LABOR_COST_GROUP', 	'', '', "");
    }
    
    /**
     * @name fn_clearForm
     * @description 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearForm = function() {
        //코드목록 
        jsonMasterTreeList 	= [];
        jsonSubTreeList 	= [];
        // 회계관리
        SBUxMethod.set("SITE_CODE1",			"");
        SBUxMethod.set("DEPT_CODE",				"");
        SBUxMethod.set("DEPT_NAME",				"");
        SBUxMethod.set("DEPT_ABBR_NAME", 		"");
        SBUxMethod.set("DEPT_NAME_ENG", 		"");
        SBUxMethod.set("DEPT_NAME_FOR",			"");
        SBUxMethod.set("PARENT_DEPT", 			"");
        SBUxMethod.set("PARENT_DEPT_NAME", 		"");
        SBUxMethod.set("DEPT_LEADER", 			"");
        SBUxMethod.set("DEPT_LEADER_NAME", 		"");
        SBUxMethod.set("DEPT_CATEGORY", 		"");
        SBUxMethod.set("DEPT_GUBUN", 			"");
        SBUxMethod.set("LABOR_COST_GROUP", 		"");
        SBUxMethod.set("SALES_DEPT_YN", 		"N");
        SBUxMethod.set("MARKETING_DEPT_YN", 	"N");
        SBUxMethod.set("PRODUCTION_DEPT_YN", 	"N");
        SBUxMethod.set("FINANCE_DEPT_YN", 		"N");
        
        SBUxMethod.set("CC_CODE", 				"");
        SBUxMethod.set("CC_NAME", 				"");
        SBUxMethod.set("ZIP_CODE", 				"");
        SBUxMethod.set("ADDRESS", 				"");
        SBUxMethod.set("FIXED_NUMBER", 			"");
        SBUxMethod.set("MEMO", 					"");
        SBUxMethod.set("SORT_SEQ", 				"");
        SBUxMethod.set("USE_YN", 				"N");
    }
    /**
     * @name fn_clearForm
     * @description 신규버튼 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearFormNew = function() {
    	
    	//조직도 변경
        SBUxMethod.set("CHANGE_DATE_KEY",		"");
        SBUxMethod.set("CHANGE_DATE",			"");
        SBUxMethod.attr('CHANGE_DATE', 'readonly', 'false');	        
        SBUxMethod.set("MEMO1",					"");
    	
        //코드목록 
        jsonSubTreeList = [];
        subTreeGrid.rebuild();
        
        SBUxMethod.set("SITE_CODE1",			"");
        SBUxMethod.set("DEPT_CODE",				"");
        SBUxMethod.set("DEPT_NAME",				"");
        SBUxMethod.set("DEPT_ABBR_NAME", 		"");
        SBUxMethod.set("DEPT_NAME_ENG", 		"");
        SBUxMethod.set("DEPT_NAME_FOR",			"");
        SBUxMethod.set("PARENT_DEPT", 			"");
        SBUxMethod.set("PARENT_DEPT_NAME", 		"");
        SBUxMethod.set("DEPT_LEADER", 			"");
        SBUxMethod.set("DEPT_LEADER_NAME", 		"");
        SBUxMethod.set("DEPT_CATEGORY", 		"");
        SBUxMethod.set("DEPT_GUBUN", 			"");
        SBUxMethod.set("LABOR_COST_GROUP", 		"");
        SBUxMethod.set("SALES_DEPT_YN", 		"N");
        SBUxMethod.set("MARKETING_DEPT_YN", 	"N");
        SBUxMethod.set("PRODUCTION_DEPT_YN", 	"N");
        SBUxMethod.set("FINANCE_DEPT_YN", 		"N");
        
        SBUxMethod.set("CC_CODE", 				"");
        SBUxMethod.set("CC_NAME", 				"");
        SBUxMethod.set("ZIP_CODE", 				"");
        SBUxMethod.set("ADDRESS", 				"");
        SBUxMethod.set("FIXED_NUMBER", 			"");
        SBUxMethod.set("MEMO", 					"");
        SBUxMethod.set("SORT_SEQ", 				"");
        SBUxMethod.set("USE_YN", 				"N");
    }

    //그룹코드 내역 저장
    const fn_save = async function(workType) {
    	workType = gfn_nvl(workType);
        
        if (!SBUxMethod.validateRequired({group_id:'panAppoint'}) || !validateRequired("panAppoint")) {
            return false;
        }
        
        var paramObj = {
       		   V_P_DEBUG_MODE_YN        : ""
   			  ,V_P_LANG_ID              : ""
   			  ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
   			  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   			  ,V_P_CHANGE_DATE          : gfn_nvl(SBUxMethod.get("CHANGE_DATE"))
   			  ,V_P_MEMO                 : gfn_nvl(SBUxMethod.get("MEMO1")) 
   			  ,V_P_FORM_ID              : p_formId
   			  ,V_P_MENU_ID              : p_menuId
   			  ,V_P_PROC_ID              : ""
   			  ,V_P_USERID               : p_userId
   			  ,V_P_PC                   : ""
        };
        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg2100.do", {
            getType: 'json',
            workType: workType,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(workType == ''){
                	return data;
                }else{
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
	                cfn_search();
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
    //그룹코드 내역 저장
    const fn_save_s1 = async function(workType) {
    	
    	let SITE_CODE = gfnma_multiSelectGet("#SITE_CODE1");
    	let DEPT_CODE = gfn_nvl(SBUxMethod.get("DEPT_CODE"));
    	let PARENT_DEPT = gfn_nvl(SBUxMethod.get("PARENT_DEPT"));
    	let DEPT_NAME = gfn_nvl(SBUxMethod.get("DEPT_NAME"));
    	let SORT_SEQ  = gfn_nvl(SBUxMethod.get("SORT_SEQ"));
    	let CHANGE_DATE  = gfn_nvl(SBUxMethod.get("CHANGE_DATE"))
    	
    	if(SITE_CODE == ''){
    		gfn_comAlert("W0002", "사업장"); 
    		return;
    	}
    	if(DEPT_CODE == ''){
    		gfn_comAlert("W0002", "부서코드"); 
    		return;
    	}
    	if(DEPT_NAME == ''){
    		gfn_comAlert("W0002", "부서명"); 
    		return;
    	}
    	if(SORT_SEQ == ''){
    		gfn_comAlert("W0002", "정렬순서"); 
    		return;
    	}
    	if(CHANGE_DATE == ''){
    		gfn_comAlert("W0002", "변경일자"); 
    		return;
    	}
    	
        if ( gfn_nvl($('#DEPT_CODE').attr('readonly')) == 'readonly' && gfn_nvl(workType) == ""){
        	workType = 'U';
        } else if( gfn_nvl($('#DEPT_CODE').attr('readonly')) == "" && gfn_nvl(workType) == ""){
        	workType = 'N';
        }
        
        let subTreeGridData =  subTreeGrid.getGridDataAll();
       	if(DEPT_CODE == PARENT_DEPT){
       		gfn_comAlert('E0000', '부서코드와 상위부서 코드가 동일합니다.');
       		return;
       	}
        var paramObj = {
       		   V_P_DEBUG_MODE_YN       : ""
   			  ,V_P_LANG_ID             : ""
   			  ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
   			  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
   			  ,V_P_CHANGE_DATE         : gfn_nvl(SBUxMethod.get("CHANGE_DATE"))
   			  ,V_P_DEPT_CODE           : DEPT_CODE
   			  ,V_P_DEPT_NAME           : DEPT_NAME
   			  ,V_P_DEPT_NAME_ENG       : gfn_nvl(SBUxMethod.get("DEPT_NAME_ENG"))
   			  ,V_P_DEPT_NAME_FOR       : gfn_nvl(SBUxMethod.get("DEPT_NAME_FOR"))
   			  ,V_P_DEPT_ABBR_NAME      : gfn_nvl(SBUxMethod.get("DEPT_ABBR_NAME"))
   			  ,V_P_SITE_CODE           : SITE_CODE
   			  ,V_P_PARENT_DEPT         : PARENT_DEPT
   			  ,V_P_DEPT_LEADER         : gfn_nvl(SBUxMethod.get("DEPT_LEADER"))
   			  ,V_P_DEPT_CATEGORY       : gfnma_multiSelectGet("#DEPT_CATEGORY")  
   			  ,V_P_LABOR_COST_GROUP    : gfnma_multiSelectGet("#LABOR_COST_GROUP")  
   			  ,V_P_SALES_DEPT_YN       : gfn_nvl(SBUxMethod.get("SALES_DEPT_YN").SALES_DEPT_YN)
   			  ,V_P_MARKETING_DEPT_YN   : gfn_nvl(SBUxMethod.get("MARKETING_DEPT_YN").MARKETING_DEPT_YN)
   			  ,V_P_PRODUCTION_DEPT_YN  : gfn_nvl(SBUxMethod.get("PRODUCTION_DEPT_YN").PRODUCTION_DEPT_YN)
   			  ,V_P_FINANCE_DEPT_YN     : gfn_nvl(SBUxMethod.get("FINANCE_DEPT_YN").FINANCE_DEPT_YN)
   			  ,V_P_CC_CODE             : gfn_nvl(SBUxMethod.get("CC_CODE"))
   			  ,V_P_ZIP_CODE            : gfn_nvl(SBUxMethod.get("ZIP_CODE"))
   			  ,V_P_ADDRESS             : gfn_nvl(SBUxMethod.get("ADDRESS"))
   			  ,V_P_FIXED_NUMBER        : gfn_nvl(SBUxMethod.get("FIXED_NUMBER"))
   			  ,V_P_MEMO                : gfn_nvl(SBUxMethod.get("MEMO"))
   			  ,V_P_SORT_SEQ            : SORT_SEQ
   			  ,V_P_USE_YN              : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
   			  ,V_P_FORM_ID             : p_formId
   			  ,V_P_MENU_ID             : p_menuId
   			  ,V_P_PROC_ID             : ""
   			  ,V_P_USERID              : p_userId
   			  ,V_P_PC                  : ""
        };
        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg2100_S1.do", {
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
                fn_search('CHANGE');
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

    const fn_btnSave = async function(){
    	
    	await fn_save('');
    	await fn_save_s1();
    	
	    SBUxMethod.attr('btnAddOrg', 'disabled', 'false');
	    SBUxMethod.attr('btnAddRow', 'disabled', 'false');
	    SBUxMethod.attr('btnDelRow', 'disabled', 'false');
    }
    
    const fn_changeDateKey = async function() {
    	let strwhereClause = "AND CO_CD LIKE '%" +gv_ma_selectedCorpCd + "%'"
    	SBUxMethod.attr('modal-compopup1', 'header-title', '조직도변경번호 팝업');
    	await compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG007'
        	,popupType				: 'A'
    		,whereClause			: strwhereClause
   			,searchCaptions			: ["변경번호", 		"비고"]
   			,searchInputFields		: ["CHG_YMD", 	"MEMO"]
   			,searchInputValues		: ['', 				'']
    		,height					: '400px'
   			,tableHeader			: ["변경번호", 		"적용여부",	"비고"]
   			,tableColumnNames		: ["CHG_YMD",	"APLY_YN", "MEMO"]
   			,tableColumnWidths		: ["80px", 			"80px", 	"200px"]
			,itemSelectEvent		: async function (data){
				SBUxMethod.set('CHANGE_DATE_KEY', 	data.CHG_YMD);
				SBUxMethod.set('CHANGE_DATE', 		data.CHG_YMD);
				SBUxMethod.set('MEMO1',				data.MEMO);
				if(gfn_nvl(data.CHG_YMD) != ""){
					await fn_search('CHANGE');
				    SBUxMethod.attr('btnAddOrg', 'disabled', 'false');
				    SBUxMethod.attr('btnAddRow', 'disabled', 'false');
				    SBUxMethod.attr('btnDelRow', 'disabled', 'false');
				}
				SBUxMethod.attr('CHANGE_DATE', 'readonly', 'true');
			}
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
  	}
    const fn_compopupParentDept = function() {
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보 팝업');
    	let searchDeptCode 		= gfn_nvl(SBUxMethod.get("PARENT_DEPT"));
    	let searchDeptName 		= gfn_nvl(SBUxMethod.get("PARENT_DEPT_NAME"));
    	let CHANGE_DATE 		= gfn_nvl(SBUxMethod.get("CHANGE_DATE"));
    	let addParams = [ "'" + CHANGE_DATE + "'"];
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG002'
            ,popupType				: 'B'
            ,whereClause			: addParams
            ,searchCaptions			: ["부서코드", 		"부서명"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM"]
            ,searchInputValues		: [searchDeptCode, 	searchDeptName]
            ,searchInputTypes		: ["input", 		"input"]	//input, datepicker가 있는 경우
            ,height					: '400px'
   			,tableHeader			: ["부서코드", "부서명", "사업장코드", "사업장명"]
   			,tableColumnNames		: ["DEPT_CD",	"DEPT_NM", "SITE_CD", "SITE_NM"]
   			,tableColumnWidths		: ["120px", "120px", "120px", "120px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('PARENT_DEPT',		data.DEPT_CD);
                SBUxMethod.set('PARENT_DEPT_NAME', 	data.DEPT_NM);
            },
        });
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}
	    
    const fn_compopupDeptLeader = function() {
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 정보 팝업');
    	
    	var searchText = '';
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
        	,popupType				: 'A'
    		,whereClause			: ""
   			,searchCaptions			: ["부서코드", "부서명", "사업장코드", "사업장명", "재직상태"]
   			,searchInputFields		: ["DEPT_CD",	"DEPT_NM", "SITE_CD", "SITE_NM", "EMP_STTS"]
   			,searchInputValues		: ['', '', '', '', '']
			,searchInputTypes		: ["input", "input","input","input", "select"]			//input, select가 있는 경우
			,searchInputTypeValues	: ["", "", "", "", jsonEmpState]				//select 경우
    		,height					: '400px'
   			,tableHeader			: ["사번", "이름", "부서", "사업장", "재직구분"]
   			,tableColumnNames		: ["EMP_CD", 	"EMP_NM", "DEPT_NM", "SITE_NM", "EMP_STATE_NAME"]
   			,tableColumnWidths		: ["120px", "120px", 	"120px", "120px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('DEPT_LEADER', 		data.EMP_CD);
				SBUxMethod.set('DEPT_LEADER_NAME', 	data.EMP_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}
	    
    const fn_compopupCcCode = function() {
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG010'
        	,popupType				: 'A'
    		,whereClause			: ""
   			,searchCaptions			: ["원가조직코드","원가조직명"]
   			,searchInputFields		: ["CSTCT_CD",	"CSTCT_NM"]
   			,searchInputValues		: ['', 			'']
    		,height					: '400px'
   			,tableHeader			: ["원가조직코드",	"원가조직명"]
   			,tableColumnNames		: ["CSTCT_CD",	"CSTCT_NM"]
   			,tableColumnWidths		: ["100px",		"100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('CC_CODE', 	data.CSTCT_CD);
				SBUxMethod.set('CC_NAME', 	data.CSTCT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}
	    
    const fn_addRow = async function(){
    	await fn_clearSubTable();
    	SBUxMethod.set('USE_YN', "Y");
    	SBUxMethod.attr('DEPT_CODE', 'readonly', 'false');
    }
    
    const fn_delRow = async function(){
    	const nRow = subTreeGrid.getRow();
    	const rowVal = subTreeGrid.getGridDataAll();
    	const selectRowVal = subTreeGrid.getRowData(nRow);
    	
    	for(var i=0; rowVal.length > i; i++){
    		if( selectRowVal.DEPT_CODE == rowVal[i].PARENT_DEPT){
    			gfn_comAlert("Q0000", "하위부서가 존재합니다. 하위부서를 먼저 삭제하고 상위부서를 삭제해주세요."); // {0}
    			return;
    		}
    	}
        if (nRow == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
	    	await fn_save_s1("D");
        }
    }
	    
	/* 주소 팝업 */
	//팝업 실행
	var fn_goPopup = function(){
		w = 520;
		h = 620;
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;

		settings = "height=" + h
				   + ",width=" + w
				   + ",top=" + TopPosition
				   + ",left=" + LeftPosition
				   + ",scrollbars=yes, resizable=yes";
		window.open( "/fm/popup/jusoPopup.do", "zipCodeSearchWin", settings );

	}
	/* 주소 팝업 */
	//팝업 콜백
	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
		/*
			roadFullAddr 전체 도로명주소
			roadAddrPart1 도로명주소(참고항목 제외)
			roadAddrPart2 도로명주소 참고항목
			addrDetail 상세주소
			engAddr 도로명 주소 영문
			jibunAddr 지번 정보
			zipNo 우편번호
		*/
		if(addrDetail.length>30){
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		SBUxMethod.set("ZIP_CODE", zipNo);//우편번호
		SBUxMethod.set("ADDRESS", roadFullAddr );// 도로명주소
	}
	    
	    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>