<%
/**
 * @Class Name 		: com3000.jsp
 * @Description 	: 공통코드 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.05.29
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.05.29   	천용진		최초 생성
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
	<title>title : 공통코드 정보</title>
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
	                <table class="table table-bordered tbl_fixed table-search-ma" >
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
	                            <th scope="row" class="th_bg_search" >유형분류</th>
	                            <td colspan="4" class="td_input" >
									<div class="dropdown">
									    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_GROUP_CATEGORY" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									    	<font>선택</font>
									        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									    </button>
									    <div class="dropdown-menu" aria-labelledby="SRCH_GROUP_CATEGORY" style="width:250px;height:150px;padding-top:0px;overflow:auto">
									    </div>
									</div>                              
								</td>
	                            <th scope="row" class="th_bg_search" >그룹코드</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-input id="SRCH_GROUP_CODE" uitype="text" style="width:100" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
<!-- 	                            <th scope="row" class="th_bg_search" >코드그룹명</th> -->
<!-- 	                            <td colspan="4" class="td_input" > -->
<!-- 	                                <sbux-input id="SRCH_GROUP_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input> -->
<!-- 	                            </td> -->
		                        <th scope="row" class="th_bg_search">sbux-datepicker 테스트</th>
	                            <td class="td_input"  style="border-right:hidden;">
	                                <sbux-datepicker id="TEST_DATE" name="TEST_DATE" uitype="popup" datepicker-mode="day" style="height:28px;width:100%;" class="table-datepicker-ma" date-format="yyyy-mm-dd"></sbux-datepicker>
	                            </td>	
	                            <td colspan="3"></td>
		                        <th scope="row" class="th_bg_search">datepicker reqed 테스트</th>
	                            <td class="td_input"  style="border-right:hidden;">
	                                <sbux-datepicker id="TEST_DATE1" name="TEST_DATE1" uitype="popup" datepicker-mode="day" style="height:28px;width:100%;" class="table-datepicker-ma inpt_data_reqed" date-format="yyyy-mm-dd"></sbux-datepicker>
	                            </td>	
	                            <td colspan="3"></td>
	                        </tr>
	                        <tr>
	                        	<th scope="row" class="th_bg_search">라디오버튼 테스트</th>
                                 <td class="td_input " colspan="3">
									<sbux-radio id="BALANCE_SIDE1" name="RDO_BALANCE_SIDE" text="차변" uitype="normal" value="D" class="radio_label" checked></sbux-radio>
									<sbux-radio id="BALANCE_SIDE2" name="RDO_BALANCE_SIDE" text="대변" uitype="normal" value="C" class="radio_label"></sbux-radio>
								</td>	                        
								<td></td>
	                        	<th scope="row" class="th_bg_search">셀렉트 테스트</th>
                                <td class="td_input" colspan="3">
				                    <sbux-select
				                            id="SRCH_PAY_DATE"
				                            uitype="single"
				                            jsondata-ref="selectJsonData"
				                            unselected-text="선택"
				                            class="form-control input-sm"
				                    </sbux-select>                                
								</td>	
								<td></td>                        
	                        	<th scope="row" class="th_bg_search">셀렉트 테스트</th>
                                <td class="td_input" colspan="3">
				                    <sbux-select
				                            id="SRCH_PAY_DATE1"
				                            uitype="single"
				                            jsondata-ref="selectJsonData"
				                            unselected-text="선택"
				                            class="form-control input-sm inpt_data_reqed"
				                            required
				                    </sbux-select>                                
								</td>	
								<td></td>                        
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdCom3000" style="height:616px; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-10">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>그룹코드 내역</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:12%">
                                    <col style="width:13%">
                                    <col style="width:12%">
                                    <col style="width:13%">
                                    <col style="width:12%">
                                    <col style="width:13%">
                                    <col style="width:12%">
                                    <col style="width:13%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg_content">그룹코드</th>
                                    <td class="td_input">
                                        <sbux-input id="GROUP_CODE" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">사용여부</th>
                                    <td class="td_input">
                                        <p class="ad_input_row">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="USE_YN"
                                                    name="USE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="사용"
                                                    true-value="Y" 
                                                    false-value="N"
                                            />
                                        </p>                                    
                                    </td>
                                    <th scope="row" rowspan="3" colspan="" class="th_bg_content" style="text-align: center">적&nbsp;&nbsp;&nbsp;&nbsp;요</th>
                                    <td class="td_input" rowspan="3" colspan="3" >
                                        <sbux-textarea id="DESCR" class="form-control input-sm" uitype="normal" style="width:100%; height:100px;""></sbux-textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">코드그룹명</th>
                                    <td class="td_input" colspan="3">
                                        <sbux-input id="GROUP_NAME" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">코드길이</th>
                                    <td class="td_input">
                                        <sbux-input id="CODE_LENGTH" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">유형분류</th>
		                            <td colspan="" class="td_input" style="border-right:hidden;">
		                                <sbux-select
		                                        id="GROUP_CATEGORY"
		                                        name="GROUP_CATEGORY"
		                                        uitype="single"
		                                        jsondata-ref="jsonGroupCode"
		                                        unselected-text="전체"
		                                        class="form-control input-sm inpt_data_reqed"
		                                ></sbux-select>                            
									</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">여유필드캡션1</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION1" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션6</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION6" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션11</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION11" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션16</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION16" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">여유필드캡션2</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION2" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션7</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION7" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션12</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION12" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션17</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION17" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">여유필드캡션3</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION3" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션8</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION8" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션13</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION13" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션18</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION18" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">여유필드캡션4</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION4" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션9</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION9" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션14</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION14" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션19</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION19" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg_content">여유필드캡션5</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION5" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션10</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION10" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션15</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION15" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg_content">여유필드캡션20</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION20" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li><span>세부코드 정보</span></li>
                            </ul>
                            <div class="ad_tbl_toplist">
	                            <sbux-button
	                                    id="btnDel"
	                                    name="btnDel"
	                                    uitype="normal"
	                                    text="행삭제"
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_delRow"
	                                    style="float: right;"
	                            >
	                            </sbux-button>
	                            <sbux-button
	                                    id="btnAdd"
	                                    name="btnAdd"
	                                    uitype="normal"
	                                    text="행추가"
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_addRow"
	                                    style="float: right;"
	                            ></sbux-button>
	                            <sbux-button
	                                    id="btnCopyClear"
	                                    name="btnCopyClear"
	                                    uitype="normal"
	                                    text="복사모드해제" <%--그리드 복사 불가. 붙여넣기 불가.--%>
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_gridCopyClear"
	                                    style="float: right; display: block"
	                            ></sbux-button>
	                            <sbux-button
	                                    id="btnCopyLine"
	                                    name="btnCopyLine"
	                                    uitype="normal"
	                                    text="행복사모드" <%--행단위로 복사--%>
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_gridCopyLine"
	                                    style="float: right; display: none;"
	                            ></sbux-button>
	                            <sbux-button
	                                    id="btnCopyCell"
	                                    name="btnCopyCell"
	                                    uitype="normal"
	                                    text="셀복사모드" <%--셀단위로 복사--%>
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_gridCopyCell"
	                                    style="float: right; display: none;"
	                            ></sbux-button>
                            </div>
                        </div>
                        <div class="ad_tbl_top2">
	                        <div>
	                            <div id="sb-area-subGrdCom3000" style="height:292px; width:100%; border-left: none !important; border-right: none !important; border-bottom: none !important; border-top: none !important;"></div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="com-popup1" name="com-popup1" uitype="middle" header-title="" body-html-id="body-com-popup1" header-is-close-button="true" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	var editType 		= 'N';
	var mode 			= 'byrows';
	var jsonGroupCode	= [];	// 유형분류
	
	var selectJsonData = [
		{ text : "빨강", value : "red",       style : "color:red;"},
		{ text : "주황", value : "orange",    style : "color:orange;"},
		{ text : "노랑", value : "yellow",    style : "color:yellow;"},
		{ text : "초록", value : "green",     style : "color:green;"},
		{ text : "파랑", value : "blue",      style : "color:blue;"},
		{ text : "남색", value : "navy",      style : "color:navy;"},
		{ text : "보라", value : "purple",    style : "color:purple;"},
		{ text : "금색", value : "gold",      style : "color:gold;"},
		{ text : "은색", value : "silver",    style : "color:silver;"},
		{ text : "검정", value : "black",     style : "color:black;"},
		{ text : "흰색", value : "white"  }
	];
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			
			//유형분류
			gfnma_multiSelectInit({
				target			: ['#SRCH_GROUP_CATEGORY']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM013'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			
			//그룹코드 내역 - 유형분류
			gfnma_setComSelect(['GROUP_CATEGORY'], jsonGroupCode, 'L_COM013', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', async  function(e) {
        let initObject = localStorage.getItem("callMain");
    	await fn_initSBSelect();
    	fn_createGrid();
    	fn_createSubGrid();
        if(!gfn_isEmpty(initObject)){
            initObject = JSON.parse(initObject);
            localStorage.removeItem("callMain");
            await fn_onload(initObject);
        } else {
            await cfn_search();
        }
        
		$('.field-caption').focusout(function() {
			fn_changeFieldCaption();
		})
	    
    });

    window.addEventListener('message', async function(event){
        let obj = event.data;
        if(!gfn_isEmpty(obj)){
            await fn_onload(obj);
        } else {
            await cfn_search();
        }
    });
	// 신규
	function cfn_add() {
		fn_clearForm();
		fn_createSubGrid();
		editType = 'N';
	}
	
	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			fn_saveFieldCaption();
		}
    }
	
	
	// 마스터 그리드 삭제
	function cfn_del() {
		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		fn_search();
		fn_clearForm();
		fn_createGrid();
		fn_createSubGrid();
	}

    const fn_onload = async function (parentParameter) {
        if (parentParameter){
            if (gfn_nvl(parentParameter["GROUP_CODE"]) != "") {
                SBUxMethod.set("SRCH_GROUP_CODE", gfn_nvl(parentParameter["GROUP_CODE"]));
                SBUxMethod.attr('SRCH_GROUP_CODE', 'readonly', 'false');
                fn_search();
            } else {
                SBUxMethod.set("SRCH_GROUP_CODE", "");
                SBUxMethod.attr('SRCH_GROUP_CODE', 'readonly', 'true');
                fn_search();
            }
        }
    }

    //grid 초기화
    var CMNSCDGrid; 			// 그리드를 담기위한 객체 선언
    var jsonCMNSCDList 	= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3000';
	    SBGridProperties.id 				= 'CMNSCDGrid';
	    SBGridProperties.jsonref 			= 'jsonCMNSCDList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["그룹코드"],		ref: 'GROUP_CODE', 		type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["코드그룹명"],		ref: 'GROUP_NAME',    	type:'output',  	width:'150px',  	style:'text-align:left'}
        ];
        CMNSCDGrid	= _SBGrid.create(SBGridProperties);
        CMNSCDGrid.bind('click', 'fn_view');

    }
    
    var CMNSCDSubGrid; 				// 세부코드 정보 그리드를 담기위한 객체 선언
    var jsonCMNSCDSubList 	= []; 	// 세부코드 정보 그리드의 참조 데이터 주소 선언
    
    function fn_createSubGrid() {
        // 세부코드 정보 초기세팅
        var SBSubGridProperties 				= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdCom3000';
        SBSubGridProperties.id 					= 'CMNSCDSubGrid';
        SBSubGridProperties.jsonref 			= 'jsonCMNSCDSubList';
        SBSubGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBSubGridProperties.selectmode 			= 'byrow';
        SBSubGridProperties.explorerbar 		= 'sortmove';
        SBSubGridProperties.rowheader 			= 'seq';
        SBSubGridProperties.rowheadercaption 	= {seq: 'No'};
        SBSubGridProperties.rowheaderwidth 		= {seq: '60'};
        SBSubGridProperties.extendlastcol 		= 'scroll';
        SBSubGridProperties.columns = [
            {caption: ["세부코드"],			ref: 'SUB_CODE', 		type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["코드명"],				ref: 'CODE_NAME',    	type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ['시스템코드'],     	ref: 'SYSTEM_YN',		type :'checkbox',	width : '80px', 	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ["정렬순서"],			ref: 'SORT_SEQ',    	type:'input',  		width:'100px',  	style:'text-align:right'},
            {caption: ['사용여부'],    	 	ref: 'USE_YN',			type :'checkbox' ,	width : '80px', 	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ["여유필드1"],			ref: 'EXTRA_FIELD1',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드2"],			ref: 'EXTRA_FIELD2',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드3"],			ref: 'EXTRA_FIELD3',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드4"],			ref: 'EXTRA_FIELD4',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드5"],			ref: 'EXTRA_FIELD5',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드6"],			ref: 'EXTRA_FIELD6',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드7"],			ref: 'EXTRA_FIELD7',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드8"],			ref: 'EXTRA_FIELD8',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드9"],			ref: 'EXTRA_FIELD9',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드10"],			ref: 'EXTRA_FIELD10',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드11"],			ref: 'EXTRA_FIELD11',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드12"],			ref: 'EXTRA_FIELD12',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드13"],			ref: 'EXTRA_FIELD13',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드14"],			ref: 'EXTRA_FIELD14',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드15"],			ref: 'EXTRA_FIELD15',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드16"],			ref: 'EXTRA_FIELD16',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드17"],			ref: 'EXTRA_FIELD17',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드18"],			ref: 'EXTRA_FIELD18',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드19"],			ref: 'EXTRA_FIELD19',   type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드20"],			ref: 'EXTRA_FIELD20',   type:'input',       width:'100px',  	style:'text-align:left'}
        ];
        CMNSCDSubGrid	= _SBGrid.create(SBSubGridProperties);
    }


    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_GROUP_CATEGORY = gfnma_multiSelectGet('#SRCH_GROUP_CATEGORY');
    	let SRCH_GROUP_CODE		= gfn_nvl(SBUxMethod.get("SRCH_GROUP_CODE"));
    	let SRCH_GROUP_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_GROUP_NAME"));
    	
    	var paramObj = {
	    		
    	   		   V_P_DEBUG_MODE_YN	: ''
    	   		   ,V_P_LANG_ID         : ''    
    	   		   ,V_P_COMP_CODE       : gv_ma_selectedApcCd
    	   		   ,V_P_CLIENT_CODE     : gv_ma_selectedClntCd
    	   		   ,V_P_GROUP_CATEGORY  : SRCH_GROUP_CATEGORY 
    	   		   ,V_P_GROUP_CODE      : SRCH_GROUP_CODE
    	   		   ,V_P_GROUP_NAME		: SRCH_GROUP_NAME          
    	  		   ,V_P_PARAM_INFO		: ''        
    	   		   ,V_P_FORM_ID			: p_formId    
    	   		   ,V_P_MENU_ID			: p_menuId         
    	   		   ,V_P_PROC_ID     	: ''        
    	   		   ,V_P_USERID			: p_userId
    	   		   ,V_P_PC				: '' 
    	   		   
    		    };		
    	        const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3000List.do", {
    	        	getType				: 'json',
    	        	workType			: 'MASTER',
    	        	cv_count			: '4',
    	        	params				: gfnma_objectToString(paramObj)
    			});

    	        const data = await postJsonPromise;
    	        try {
    	  			if (_.isEqual("S", data.resultStatus)) {

    	  	        	/** @type {number} **/
    	  	    		let totalRecordCount = 0;

    	  	    		CMNSCDGrid.length = 0;
    	  	        	data.cv_1.forEach((item, index) => {
    	  					const msg = {
    	  							GROUP_NAME		: item.GROUP_NAME,
    	  							GROUP_CODE		: item.GROUP_CODE
    	  					}
    	  					jsonCMNSCDList.push(msg);
    	  					totalRecordCount ++;
    	  				});

    	  	        	CMNSCDGrid.rebuild();
    	  	        	document.querySelector('#listCount').innerText = totalRecordCount;

                        if(jsonCMNSCDList.length > 0) {
                            CMNSCDGrid.clickRow(1);
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
    * 서브 그리드 조회
     */
    const fn_setCMNSCDSubGrid = async function(GROUP_CODE) {

    	// form clear
    	fn_clearForm();

		CMNSCDSubGrid.clearStatus();

	    var paramObj = {
	    		
   		   V_P_DEBUG_MODE_YN	: ''
   		   ,V_P_LANG_ID         : ''    
   		   ,V_P_COMP_CODE       : gv_ma_selectedApcCd
   		   ,V_P_CLIENT_CODE     : gv_ma_selectedClntCd
   		   ,V_P_GROUP_CATEGORY  : '' 
   		   ,V_P_GROUP_CODE      : GROUP_CODE
   		   ,V_P_GROUP_NAME		: ''          
  		   ,V_P_PARAM_INFO		: ''        
   		   ,V_P_FORM_ID			: p_formId    
   		   ,V_P_MENU_ID			: p_menuId         
   		   ,V_P_PROC_ID     	: ''        
   		   ,V_P_USERID			: p_userId
   		   ,V_P_PC				: '' 
   		   
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3000List.do", {
        	getType				: 'json',
        	workType			: 'DETAIL',
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	let obj = data.cv_3[0];
  	        	let cv_4 = data.cv_4;
  	      		SBUxMethod.set("GROUP_CODE", 			obj.GROUP_CODE);
  	      		SBUxMethod.set("GROUP_NAME", 			obj.GROUP_NAME);
  	      		SBUxMethod.set("CODE_LENGTH", 			obj.CODE_LENGTH);
  	      		SBUxMethod.set("GROUP_CATEGORY", 		obj.GROUP_CATEGORY);
  	      		SBUxMethod.set("FIELD_CAPTION1", 		obj.FIELD_CAPTION1);
  	      		SBUxMethod.set("FIELD_CAPTION2", 		obj.FIELD_CAPTION2);
  	      		SBUxMethod.set("FIELD_CAPTION3", 		obj.FIELD_CAPTION3);
  	      		SBUxMethod.set("FIELD_CAPTION4", 		obj.FIELD_CAPTION4);
  	      		SBUxMethod.set("FIELD_CAPTION5", 		obj.FIELD_CAPTION5);
  	      		SBUxMethod.set("FIELD_CAPTION6", 		obj.FIELD_CAPTION6);
  	      		SBUxMethod.set("FIELD_CAPTION7", 		obj.FIELD_CAPTION7);
  	      		SBUxMethod.set("FIELD_CAPTION8", 		obj.FIELD_CAPTION8);
  	      		SBUxMethod.set("FIELD_CAPTION9", 		obj.FIELD_CAPTION9);
  	      		SBUxMethod.set("FIELD_CAPTION10", 		obj.FIELD_CAPTION10);
  	      		SBUxMethod.set("FIELD_CAPTION11", 		obj.FIELD_CAPTION11);
  	      		SBUxMethod.set("FIELD_CAPTION12", 		obj.FIELD_CAPTION12);
  	      		SBUxMethod.set("FIELD_CAPTION13", 		obj.FIELD_CAPTION13);
  	      		SBUxMethod.set("FIELD_CAPTION14", 		obj.FIELD_CAPTION14);
  	      		SBUxMethod.set("FIELD_CAPTION15", 		obj.FIELD_CAPTION15);
  	      		SBUxMethod.set("FIELD_CAPTION16", 		obj.FIELD_CAPTION16);
  	      		SBUxMethod.set("FIELD_CAPTION17", 		obj.FIELD_CAPTION17);
  	      		SBUxMethod.set("FIELD_CAPTION18", 		obj.FIELD_CAPTION18);
  	      		SBUxMethod.set("FIELD_CAPTION19", 		obj.FIELD_CAPTION19);
  	      		SBUxMethod.set("FIELD_CAPTION20", 		obj.FIELD_CAPTION20);
  	      		SBUxMethod.set("DESCR", 				obj.DESCR);
  	      		if(obj.USE_YN == 'Y'){
  	      			$('#USE_YN').prop('checked', true);
  	      		}else{
  	      			$('#USE_YN').prop('checked', false);
  	      		}
  	      		
  	      		fn_drawCMNSCDSubGrid(mode, obj, cv_4);
  	      		
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
	
    //세부코드 정보
    const fn_drawCMNSCDSubGrid = async function(mode, cv_3, cv_4) {
		let FIELD_CAPTION1    	= gfn_nvl(cv_3.FIELD_CAPTION1)  == "" ? "여유필드1"  : cv_3.FIELD_CAPTION1;
		let FIELD_CAPTION2	    = gfn_nvl(cv_3.FIELD_CAPTION2)  == "" ? "여유필드2"  : cv_3.FIELD_CAPTION2;
		let FIELD_CAPTION3	    = gfn_nvl(cv_3.FIELD_CAPTION3)  == "" ? "여유필드3"  : cv_3.FIELD_CAPTION3;
		let FIELD_CAPTION4	    = gfn_nvl(cv_3.FIELD_CAPTION4)  == "" ? "여유필드4"  : cv_3.FIELD_CAPTION4;
		let FIELD_CAPTION5	    = gfn_nvl(cv_3.FIELD_CAPTION5)  == "" ? "여유필드5"  : cv_3.FIELD_CAPTION5;
		let FIELD_CAPTION6	    = gfn_nvl(cv_3.FIELD_CAPTION6)  == "" ? "여유필드6"  : cv_3.FIELD_CAPTION6;
		let FIELD_CAPTION7	    = gfn_nvl(cv_3.FIELD_CAPTION7)  == "" ? "여유필드7"  : cv_3.FIELD_CAPTION7;
		let FIELD_CAPTION8	    = gfn_nvl(cv_3.FIELD_CAPTION8)  == "" ? "여유필드8"  : cv_3.FIELD_CAPTION8;
		let FIELD_CAPTION9	    = gfn_nvl(cv_3.FIELD_CAPTION9)  == "" ? "여유필드9"  : cv_3.FIELD_CAPTION9;
		let FIELD_CAPTION10	    = gfn_nvl(cv_3.FIELD_CAPTION10) == "" ? "여유필드10" : cv_3.FIELD_CAPTION10;
		let FIELD_CAPTION11		= gfn_nvl(cv_3.FIELD_CAPTION11) == "" ? "여유필드11" : cv_3.FIELD_CAPTION11;
		let FIELD_CAPTION12   	= gfn_nvl(cv_3.FIELD_CAPTION12) == "" ? "여유필드12" : cv_3.FIELD_CAPTION12;
		let FIELD_CAPTION13   	= gfn_nvl(cv_3.FIELD_CAPTION13) == "" ? "여유필드13" : cv_3.FIELD_CAPTION13;
		let FIELD_CAPTION14   	= gfn_nvl(cv_3.FIELD_CAPTION14) == "" ? "여유필드14" : cv_3.FIELD_CAPTION14;
		let FIELD_CAPTION15   	= gfn_nvl(cv_3.FIELD_CAPTION15) == "" ? "여유필드15" : cv_3.FIELD_CAPTION15;
		let FIELD_CAPTION16   	= gfn_nvl(cv_3.FIELD_CAPTION16) == "" ? "여유필드16" : cv_3.FIELD_CAPTION16;
		let FIELD_CAPTION17   	= gfn_nvl(cv_3.FIELD_CAPTION17) == "" ? "여유필드17" : cv_3.FIELD_CAPTION17;
		let FIELD_CAPTION18   	= gfn_nvl(cv_3.FIELD_CAPTION18) == "" ? "여유필드18" : cv_3.FIELD_CAPTION18;
		let FIELD_CAPTION19   	= gfn_nvl(cv_3.FIELD_CAPTION19) == "" ? "여유필드19" : cv_3.FIELD_CAPTION19;
		let FIELD_CAPTION20   	= gfn_nvl(cv_3.FIELD_CAPTION20) == "" ? "여유필드20" : cv_3.FIELD_CAPTION20;
		
        // 세부코드 정보 세팅
        SBSubGridProperties 					= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdCom3000';
        SBSubGridProperties.id 					= 'CMNSCDSubGrid';
        SBSubGridProperties.jsonref 			= 'jsonCMNSCDSubList';
        SBSubGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBSubGridProperties.selectmode 			= mode;
        SBSubGridProperties.explorerbar 		= 'sortmove';
        SBSubGridProperties.rowheader 			= 'seq';
        SBSubGridProperties.rowheadercaption 	= {seq: 'No'};
        SBSubGridProperties.rowheaderwidth 		= {seq: '60'};
        SBSubGridProperties.extendlastcol 		= 'scroll';
        SBSubGridProperties.columns = [
            {caption: ["세부코드"],				ref: 'SUB_CODE', 		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["코드명"],					ref: 'CODE_NAME',    	type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption: ['시스템코드'],     		ref: 'SYSTEM_YN',		type :'checkbox',	width : '80px', typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ["정렬순서"],				ref: 'SORT_SEQ',    	type:'input',  	width:'100px',  	style:'text-align:right'},
            {caption: ['사용여부'],     			ref: 'USE_YN',			type :'checkbox',	width : '80px', typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: [FIELD_CAPTION1],			ref: 'EXTRA_FIELD1',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION2],			ref: 'EXTRA_FIELD2',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION3],			ref: 'EXTRA_FIELD3',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION4],			ref: 'EXTRA_FIELD4',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION5],			ref: 'EXTRA_FIELD5',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION6],			ref: 'EXTRA_FIELD6',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION7],			ref: 'EXTRA_FIELD7',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION8],			ref: 'EXTRA_FIELD8',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION9],			ref: 'EXTRA_FIELD9',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION10],		ref: 'EXTRA_FIELD10',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION11],		ref: 'EXTRA_FIELD11',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION12],		ref: 'EXTRA_FIELD12',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION13],		ref: 'EXTRA_FIELD13',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION14],		ref: 'EXTRA_FIELD14',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION15],		ref: 'EXTRA_FIELD15',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION16],		ref: 'EXTRA_FIELD16',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION17],		ref: 'EXTRA_FIELD17',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION18],		ref: 'EXTRA_FIELD18',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION19],		ref: 'EXTRA_FIELD19',   type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION20],		ref: 'EXTRA_FIELD20',   type:'input',  	width:'100px',  	style:'text-align:left'}
        ];                                                                   

		// 이전에 그렸던 그리드 삭제 후 다시 그리기
        jsonCMNSCDSubList = [];
        CMNSCDSubGrid = _SBGrid.create(SBSubGridProperties);
        
      	cv_4.forEach((item, index) => {
			const msg = {
					SUB_CODE		: item.SUB_CODE,
					CODE_NAME		: item.CODE_NAME,
					SYSTEM_YN		: item.SYSTEM_YN,
					DESCR			: item.DESCR,
					EXTRA_FIELD1	: item.EXTRA_FIELD1,
					EXTRA_FIELD2	: item.EXTRA_FIELD2,
					EXTRA_FIELD3	: item.EXTRA_FIELD3,
					EXTRA_FIELD4	: item.EXTRA_FIELD4,
					EXTRA_FIELD5	: item.EXTRA_FIELD5,
					EXTRA_FIELD6	: item.EXTRA_FIELD6,
					EXTRA_FIELD7	: item.EXTRA_FIELD7,
					EXTRA_FIELD8	: item.EXTRA_FIELD8,
					EXTRA_FIELD9	: item.EXTRA_FIELD9,
					EXTRA_FIELD10	: item.EXTRA_FIELD10,
					EXTRA_FIELD11	: item.EXTRA_FIELD11,
					EXTRA_FIELD12	: item.EXTRA_FIELD12,
					EXTRA_FIELD13	: item.EXTRA_FIELD13,
					EXTRA_FIELD14	: item.EXTRA_FIELD14,
					EXTRA_FIELD15	: item.EXTRA_FIELD15,
					EXTRA_FIELD16	: item.EXTRA_FIELD16,
					EXTRA_FIELD17	: item.EXTRA_FIELD17,
					EXTRA_FIELD18	: item.EXTRA_FIELD18,
					EXTRA_FIELD19	: item.EXTRA_FIELD19,
					EXTRA_FIELD20	: item.EXTRA_FIELD20,
					SORT_SEQ		: item.SORT_SEQ,
					USE_YN			: item.USE_YN,
					GROUP_CODE		: item.GROUP_CODE,
					CLIENT_CODE		: item.CLIENT_CODE,
					COMP_CODE		: item.COMP_CODE
			}
			jsonCMNSCDSubList.push(msg);
		});
		CMNSCDSubGrid.rebuild();
    }
    
    const fn_clearForm = function() {
		
    	//코드목록
    	jsonCMNSCDList = [];
    	//세부코드 정보
    	jsonCMNSCDSubList = [];
    	
    	//그룹코드 내역
    	SBUxMethod.set("GROUP_CODE", 		"");
    	SBUxMethod.set("USE_YN", 			"");
    	SBUxMethod.set("CODE_LENGTH", 		"");
    	SBUxMethod.set("GROUP_CATEGORY", 	"");
        SBUxMethod.set("DESCR", 			"");
        SBUxMethod.set("GROUP_NAME", 		"");
        SBUxMethod.set("FIELD_CAPTION1", 	"");
        SBUxMethod.set("FIELD_CAPTION2", 	"");
        SBUxMethod.set("FIELD_CAPTION3", 	"");
        SBUxMethod.set("FIELD_CAPTION4", 	"");
        SBUxMethod.set("FIELD_CAPTION5", 	"");
        SBUxMethod.set("FIELD_CAPTION6", 	"");
        SBUxMethod.set("FIELD_CAPTION7", 	"");
        SBUxMethod.set("FIELD_CAPTION8", 	"");
        SBUxMethod.set("FIELD_CAPTION9", 	"");
        SBUxMethod.set("FIELD_CAPTION10", 	"");
        SBUxMethod.set("FIELD_CAPTION11", 	"");
        SBUxMethod.set("FIELD_CAPTION12", 	"");
        SBUxMethod.set("FIELD_CAPTION13", 	"");
        SBUxMethod.set("FIELD_CAPTION14", 	"");
        SBUxMethod.set("FIELD_CAPTION15", 	"");
        SBUxMethod.set("FIELD_CAPTION16", 	"");
        SBUxMethod.set("FIELD_CAPTION17", 	"");
        SBUxMethod.set("FIELD_CAPTION18", 	"");
        SBUxMethod.set("FIELD_CAPTION19", 	"");
        SBUxMethod.set("FIELD_CAPTION20", 	"");
    }
    
    // 그리드 삭제
    const fn_delete = async function(){
    	let GROUP_CODE 			= gfn_nvl(SBUxMethod.get("GROUP_CODE"));
    	let USE_YN				= gfn_nvl(SBUxMethod.get("USE_YN"));
    	let DESCR 				= gfn_nvl(SBUxMethod.get("DESCR"));
    	let GROUP_NAME			= gfn_nvl(SBUxMethod.get("GROUP_NAME"));
    	let CODE_LENGTH			= gfn_nvl(SBUxMethod.get("CODE_LENGTH"));
    	let GROUP_CATEGORY 		= gfn_nvl(SBUxMethod.get("GROUP_CATEGORY"));

    	let FIELD_CAPTION1 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION1"));
    	let FIELD_CAPTION2 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION2"));
    	let FIELD_CAPTION3 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION3"));
    	let FIELD_CAPTION4 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION4"));
    	let FIELD_CAPTION5 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION5"));
    	let FIELD_CAPTION6 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION6"));
    	let FIELD_CAPTION7 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION7"));
    	let FIELD_CAPTION8 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION8"));
    	let FIELD_CAPTION9 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION9"));
    	let FIELD_CAPTION10 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION10"));
    	let FIELD_CAPTION11 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION11"));
    	let FIELD_CAPTION12 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION12"));
    	let FIELD_CAPTION13 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION13"));
    	let FIELD_CAPTION14 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION14"));
    	let FIELD_CAPTION15 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION15"));
    	let FIELD_CAPTION16 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION16"));
    	let FIELD_CAPTION17 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION17"));
    	let FIELD_CAPTION18 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION18"));
    	let FIELD_CAPTION19 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION19"));
    	let FIELD_CAPTION20 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION20"));
    	
  	    var paramObj = {
  				V_P_DEBUG_MODE_YN			: ''
  				,V_P_LANG_ID				: ''
				,V_P_COMP_CODE				: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
  				,V_P_GROUP_CODE				: GROUP_CODE
  				,V_P_GROUP_NAME				: GROUP_NAME
  				,V_P_CODE_LENGTH     		: CODE_LENGTH
  				,V_P_GROUP_CATEGORY			: GROUP_CATEGORY
  				,V_P_FIELD_CAPTION1         : FIELD_CAPTION1
  				,V_P_FIELD_CAPTION2         : FIELD_CAPTION2
  				,V_P_FIELD_CAPTION3         : FIELD_CAPTION3
  				,V_P_FIELD_CAPTION4         : FIELD_CAPTION4
  				,V_P_FIELD_CAPTION5			: FIELD_CAPTION5
  				,V_P_FIELD_CAPTION6			: FIELD_CAPTION6
  				,V_P_FIELD_CAPTION7			: FIELD_CAPTION7
  				,V_P_FIELD_CAPTION8			: FIELD_CAPTION8
  				,V_P_FIELD_CAPTION9			: FIELD_CAPTION9
  				,V_P_FIELD_CAPTION10		: FIELD_CAPTION10
  				,V_P_FIELD_CAPTION11		: FIELD_CAPTION11
  				,V_P_FIELD_CAPTION12		: FIELD_CAPTION12
  				,V_P_FIELD_CAPTION13		: FIELD_CAPTION13
  				,V_P_FIELD_CAPTION14		: FIELD_CAPTION14
  				,V_P_FIELD_CAPTION15		: FIELD_CAPTION15
  				,V_P_FIELD_CAPTION16		: FIELD_CAPTION16
  				,V_P_FIELD_CAPTION17		: FIELD_CAPTION17
  				,V_P_FIELD_CAPTION18		: FIELD_CAPTION18
  				,V_P_FIELD_CAPTION19		: FIELD_CAPTION19
  				,V_P_FIELD_CAPTION20		: FIELD_CAPTION19
  				,V_P_DESCR					: DESCR
  				,V_P_USE_YN					: USE_YN.USE_YN
  				,V_P_FORM_ID				: p_formId
  				,V_P_MENU_ID				: p_menuId
  				,V_P_PROC_ID				: ''
  				,V_P_USERID					: p_userId
  				,V_P_PC						: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/co/sys/com/deleteCom3000.do", {
        	getType				: 'json',
        	workType			: 'D',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
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
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    	
    }

    //그룹코드 내역 저장
    const fn_saveFieldCaption = async function() {

    	let GROUP_CODE 			= gfn_nvl(SBUxMethod.get("GROUP_CODE"));
    	let USE_YN				= gfn_nvl(SBUxMethod.get("USE_YN"));
    	let DESCR 				= gfn_nvl(SBUxMethod.get("DESCR"));
    	let GROUP_NAME			= gfn_nvl(SBUxMethod.get("GROUP_NAME"));
    	let CODE_LENGTH			= gfn_nvl(SBUxMethod.get("CODE_LENGTH"));
    	let GROUP_CATEGORY 		= gfn_nvl(SBUxMethod.get("GROUP_CATEGORY"));

    	let FIELD_CAPTION1 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION1"));
    	let FIELD_CAPTION2 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION2"));
    	let FIELD_CAPTION3 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION3"));
    	let FIELD_CAPTION4 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION4"));
    	let FIELD_CAPTION5 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION5"));
    	let FIELD_CAPTION6 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION6"));
    	let FIELD_CAPTION7 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION7"));
    	let FIELD_CAPTION8 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION8"));
    	let FIELD_CAPTION9 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION9"));
    	let FIELD_CAPTION10 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION10"));
    	let FIELD_CAPTION11 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION11"));
    	let FIELD_CAPTION12 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION12"));
    	let FIELD_CAPTION13 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION13"));
    	let FIELD_CAPTION14 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION14"));
    	let FIELD_CAPTION15 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION15"));
    	let FIELD_CAPTION16 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION16"));
    	let FIELD_CAPTION17 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION17"));
    	let FIELD_CAPTION18 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION18"));
    	let FIELD_CAPTION19 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION19"));
    	let FIELD_CAPTION20 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION20"));
    	
    	if(GROUP_CODE == "") {
            gfn_comAlert("W0002", "그룹코드");
            return;
    	}
    	if(GROUP_NAME == "") {
            gfn_comAlert("W0002", "코드그룹명");
            return;
    	}
    	if(CODE_LENGTH == "") {
            gfn_comAlert("W0002", "코드길이");
            return;
    	}
    	if(GROUP_CATEGORY == "") {
            gfn_comAlert("W0002", "유형분류");
            return;
    	}
    	
    	if(editType == "N"){
    		var valUrl = "/co/sys/com/insertCom3000.do";
    	}else{
    		var valUrl = "/co/sys/com/updateCom3000.do";
    	}
    	
  	    var paramObj = {
  				V_P_DEBUG_MODE_YN			: ''
  				,V_P_LANG_ID				: ''
				,V_P_COMP_CODE				: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
  				,V_P_GROUP_CODE				: GROUP_CODE
  				,V_P_GROUP_NAME				: GROUP_NAME
  				,V_P_CODE_LENGTH     		: CODE_LENGTH
  				,V_P_GROUP_CATEGORY			: GROUP_CATEGORY
  				,V_P_FIELD_CAPTION1         : FIELD_CAPTION1
  				,V_P_FIELD_CAPTION2         : FIELD_CAPTION2
  				,V_P_FIELD_CAPTION3         : FIELD_CAPTION3
  				,V_P_FIELD_CAPTION4         : FIELD_CAPTION4
  				,V_P_FIELD_CAPTION5			: FIELD_CAPTION5
  				,V_P_FIELD_CAPTION6			: FIELD_CAPTION6
  				,V_P_FIELD_CAPTION7			: FIELD_CAPTION7
  				,V_P_FIELD_CAPTION8			: FIELD_CAPTION8
  				,V_P_FIELD_CAPTION9			: FIELD_CAPTION9
  				,V_P_FIELD_CAPTION10		: FIELD_CAPTION10
  				,V_P_FIELD_CAPTION11		: FIELD_CAPTION11
  				,V_P_FIELD_CAPTION12		: FIELD_CAPTION12
  				,V_P_FIELD_CAPTION13		: FIELD_CAPTION13
  				,V_P_FIELD_CAPTION14		: FIELD_CAPTION14
  				,V_P_FIELD_CAPTION15		: FIELD_CAPTION15
  				,V_P_FIELD_CAPTION16		: FIELD_CAPTION16
  				,V_P_FIELD_CAPTION17		: FIELD_CAPTION17
  				,V_P_FIELD_CAPTION18		: FIELD_CAPTION18
  				,V_P_FIELD_CAPTION19		: FIELD_CAPTION19
  				,V_P_FIELD_CAPTION20		: FIELD_CAPTION19
  				,V_P_DESCR					: DESCR
  				,V_P_USE_YN					: USE_YN.USE_YN
  				,V_P_FORM_ID				: p_formId
  				,V_P_MENU_ID				: p_menuId
  				,V_P_PROC_ID				: ''
  				,V_P_USERID					: p_userId
  				,V_P_PC						: '' 
	    };		
        const postJsonPromise = gfn_postJSON(valUrl, {
        	getType				: 'json',
        	workType			: editType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
          		gfn_comAlert('I0001');
        		//세부코드 정보  저장
        		let CMNSCDSubGridLength	= CMNSCDSubGrid.getUpdateData(true, 'all').length;
        		let CMNSCDSubGridData 	= CMNSCDSubGrid.getUpdateData(true, 'all');
                if(CMNSCDSubGridLength <= 0){
                	return;
                }
                let listData = [];
                CMNSCDSubGridData.forEach((item, index) => {
                    const param = {
                        cv_count: '0',
                        getType: 'json',
                        rownum: item.rownum,
                        workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                        params: gfnma_objectToString({
  	   	  	    	      V_P_DEBUG_MODE_YN        : ''
    	   	  	    	      ,V_P_LANG_ID             : ''
    	   	  	    	      ,V_P_COMP_CODE           : gv_ma_selectedApcCd
    	   	  	    	      ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
    	   	  	    	      ,V_P_GROUP_CODE          : GROUP_CODE
    	   	  	    	      ,V_P_SUB_CODE            : gfn_nvl(item.data.SUB_CODE)
    	   	  	    	      ,V_P_CODE_NAME           : gfn_nvl(item.data.CODE_NAME)
    	   	  	    	      ,V_P_SYSTEM_YN           : gfn_nvl(item.data.SYSTEM_YN) == 'Y' ? 'Y' : 'N'
    	   	  	    	      ,IV_P_EXTRA_FIELD1       : gfn_nvl(item.data.EXTRA_FIELD1)
    	   	  	    	      ,IV_P_EXTRA_FIELD2       : gfn_nvl(item.data.EXTRA_FIELD2)
    	   	  	    	      ,V_P_EXTRA_FIELD3        : gfn_nvl(item.data.EXTRA_FIELD3)
    	   	  	    	      ,V_P_EXTRA_FIELD4        : gfn_nvl(item.data.EXTRA_FIELD4)
    	   	  	    	      ,V_P_EXTRA_FIELD5        : gfn_nvl(item.data.EXTRA_FIELD5)
    	   	  	    	      ,V_P_EXTRA_FIELD6        : gfn_nvl(item.data.EXTRA_FIELD6)
    	   	  	    	      ,V_P_EXTRA_FIELD7        : gfn_nvl(item.data.EXTRA_FIELD7)
    	   	  	    	      ,V_P_EXTRA_FIELD8        : gfn_nvl(item.data.EXTRA_FIELD8)
    	   	  	    	      ,V_P_EXTRA_FIELD9        : gfn_nvl(item.data.EXTRA_FIELD9)
    	   	  	    	      ,V_P_EXTRA_FIELD10       : gfn_nvl(item.data.EXTRA_FIELD10)
    	   	  	    	      ,V_P_EXTRA_FIELD11       : gfn_nvl(item.data.EXTRA_FIELD11)
    	   	  	    	      ,V_P_EXTRA_FIELD12       : gfn_nvl(item.data.EXTRA_FIELD12)
    	   	  	    	      ,V_P_EXTRA_FIELD13       : gfn_nvl(item.data.EXTRA_FIELD13)
    	   	  	    	      ,V_P_EXTRA_FIELD14       : gfn_nvl(item.data.EXTRA_FIELD14)
    	   	  	    	      ,V_P_EXTRA_FIELD15       : gfn_nvl(item.data.EXTRA_FIELD15)
    	   	  	    	      ,V_P_EXTRA_FIELD16       : gfn_nvl(item.data.EXTRA_FIELD16)
    	   	  	    	      ,V_P_EXTRA_FIELD17       : gfn_nvl(item.data.EXTRA_FIELD17)
    	   	  	    	      ,V_P_EXTRA_FIELD18       : gfn_nvl(item.data.EXTRA_FIELD18)
    	   	  	    	      ,V_P_EXTRA_FIELD19       : gfn_nvl(item.data.EXTRA_FIELD19)
    	   	  	    	      ,V_P_EXTRA_FIELD20       : gfn_nvl(item.data.EXTRA_FIELD20)
    	   	  	    	      ,V_P_SORT_SEQ            : gfn_nvl(item.data.SORT_SEQ)
    	   	  	    	      ,V_P_USE_YN              : gfn_nvl(item.data.USE_YN) == 'Y' ? 'Y' : 'N'
    	   	  	    	      ,V_P_FORM_ID             : p_formId
    	   	  	    	      ,V_P_MENU_ID             : p_menuId
    	   	  	    	      ,V_P_PROC_ID             : ''
    	   	  	    	      ,V_P_USERID              : p_userId
    	   	  	    	      ,V_P_PC                  : ''
                        })
                    }
                    listData.push(param);
                });
                const postJsonPromise = gfn_postJSON("/co/sys/com/updateCom3000_S1.do", {listData: listData});
                const updateData = await postJsonPromise;
                try {
                    if (_.isEqual("S", updateData.resultStatus)) {
                    } else {
                        alert(updateData.resultMessage);
                        return false;
                    }
                } catch (e) {
                    if (!(e instanceof Error)) {
                        e = new Error(e);
                    }
                    console.error("failed", e.message);
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

     // 행 추가
     const fn_addRow = function () {
         let rowVal = CMNSCDSubGrid.getRow();

    	//데이터가 없고 행선택이 없을경우.
         if (rowVal == -1){ 

             CMNSCDSubGrid.addRow(true);
         }else{
             CMNSCDSubGrid.insertRow(rowVal);
         }
     }

     // 행 삭제
     const fn_delRow = async function () {

         let rowVal = CMNSCDSubGrid.getRow();

         if (rowVal == -1) {
             gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
             return;
         } else {
             CMNSCDSubGrid.deleteRow(rowVal);
         }

     }
     /*필드캡션 데이터*/
    const fn_fieldCaption = async function (){
    	let field_data = {
    	    	FIELD_CAPTION1 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION1")),
    	    	FIELD_CAPTION2 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION2")),
    	    	FIELD_CAPTION3 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION3")),
    	    	FIELD_CAPTION4 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION4")),
    	    	FIELD_CAPTION5 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION5")),
    	    	FIELD_CAPTION6 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION6")),
    	    	FIELD_CAPTION7 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION7")),
    	    	FIELD_CAPTION8 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION8")),
    	    	FIELD_CAPTION9 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION9")),
    	    	FIELD_CAPTION10 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION10")),
    	    	FIELD_CAPTION11 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION11")),
    	    	FIELD_CAPTION12 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION12")),
    	    	FIELD_CAPTION13 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION13")),
    	    	FIELD_CAPTION14 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION14")),
    	    	FIELD_CAPTION15 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION15")),
    	    	FIELD_CAPTION16 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION16")),
    	    	FIELD_CAPTION17 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION17")),
    	    	FIELD_CAPTION18 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION18")),
    	    	FIELD_CAPTION19 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION19")),
    	    	FIELD_CAPTION20 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION20"))
    	};
    	return field_data;
    }
     
     /*셀복사 해제 (복사모드해제)*/
    const fn_gridCopyClear = async function (){ 
         $('#btnCopyClear').hide();
         $('#btnCopyLine').show();
         $('#btnCopyCell').hide();
         
        let gridData = CMNSCDSubGrid.getGridDataAll();
		jsonCMNSCDSubList = [];
        mode = 'byrow'; //그리드 프로퍼티스 라인모드
         let fieldData = await fn_fieldCaption(); 
         fn_drawCMNSCDSubGrid(mode, fieldData, gridData);
    }
     /*행 복사 (행복사모드)*/
     const fn_gridCopyLine = async function () { 
         $('#btnCopyClear').hide();
         $('#btnCopyLine').hide();
         $('#btnCopyCell').show();
         let gridData = CMNSCDSubGrid.getGridDataAll();
         jsonCMNSCDSubList = [];
         let fieldData = await fn_fieldCaption(); 

        mode = 'byrows'; //그리드 프로퍼티스 셀모드

         fn_drawCMNSCDSubGrid(mode, fieldData, gridData);

     }
    /*셀 복사 (셀복사모드)*/
    const fn_gridCopyCell = async function () { 
        $('#btnCopyClear').show();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').hide();

        let gridData = CMNSCDSubGrid.getGridDataAll();
        jsonCMNSCDSubList = [];
        let fieldData = await fn_fieldCaption(); 

        mode = 'free'; //그리드 프로퍼티스 클리어모드

    	fn_drawCMNSCDSubGrid(mode,fieldData, gridData);
    }
     
     /*여유필드 캡션1~20 수정 시 그리드에 적용되게 */
     const fn_changeFieldCaption = async function () { 

        let gridData = CMNSCDSubGrid.getGridDataAll();
        jsonCMNSCDSubList = [];
        let fieldData = await fn_fieldCaption(); 
        
        fn_drawCMNSCDSubGrid(mode,fieldData, gridData);
     }
     
    //그룹코드 내역 보기
    function fn_view() {
		editType = 'U';
    	
    	var nCol = CMNSCDGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = CMNSCDGrid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = CMNSCDGrid.getRowData(nRow);
        fn_setCMNSCDSubGrid(rowData.GROUP_CODE);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>