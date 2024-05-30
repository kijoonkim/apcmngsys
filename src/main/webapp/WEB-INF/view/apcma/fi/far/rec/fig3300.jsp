<%
/**
 * @Class Name 		: com3100.jsp
 * @Description 	: 전자세금계산서 관리(매출) 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.05.22
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.05.22   	장성주		최초 생성
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
	<title>title : 전자세금계산서 관리(매출)</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 전자세금계산서 관리(매출) -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="btnCreate" name="btnCreate" 	uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
                    <sbux-button id="btnSave" 	name="btnSave" 		uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
                    <!-- 
                    <sbux-button id="btnDelete" name="btnDelete" 	uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                     -->
                    <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
                </div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
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
                            <th scope="row" class="th_bg">조회구분</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="rdo-RidGubun1" name="rdo-RidGubun" uitype="normal" value="1" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="rdo-RidGubun1">전체</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-RidGubun2" name="rdo-RidGubun" uitype="normal" value="2" class="radio_label"></sbux-radio>
									<label class="radio_label" for="rdo-RidGubun2">세금계산서</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-RidGubun3" name="rdo-RidGubun" uitype="normal" value="3" class="radio_label"></sbux-radio>
									<label class="radio_label" for="rdo-RidGubun3">계산서</label>
								</p>
                            </td>
                            
                            <th scope="row" class="th_bg">년월</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-datepicker id="srch_riod_yyyymm_p" name="picker_popup" uitype="popup" datepicker-mode="month" date-format="yyyy-mm"></sbux-datepicker>                            
                            </td>
                            
                            <th scope="row" class="th_bg">작성일자</th>
                            <td colspan="3" class="td_input" >
								<sbux-datepicker id="srch_ymddate" name="picker_range" uitype="range" style="width:120px"></sbux-datepicker>                            
                            </td>
                            
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">상호</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <sbux-input id="srch_txtcs_name" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            
                            <th scope="row" class="th_bg">담당자</th>
                            <td class="td_input" style="border-right:hidden;">
   								<sbux-input
									uitype="text"
									id="SRCH_TXTEMP_NAME"
									class="form-control input-sm"									
   								></sbux-input>
   								<sbux-input
									uitype="hidden"
									id="SRCH_TXTEMP_CODE"
									class="form-control input-sm"									
   								></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" >
								<sbux-button
									id="SRCH_EMP_BTN"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-compopup1"
								></sbux-button>
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
                
				<!-- 1번째 그리드-->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>조회결과</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<span style="padding-right:10px;">제외사유</span>
						<sbux-button
									id="btnUld"
									name="btnUld"
									uitype="normal"
									text="제외처리 취소"
									class="btn btn-sm btn-outline-danger"
									onclick="fn_uld"
									style="float: right;"
								></sbux-button>
						<sbux-button
									id="btnDelPrdcrList"
									name="btnDelPrdcrList"
									uitype="normal"
									text="제외처리"
									class="btn btn-sm btn-outline-danger"
									onclick="fn_delPrdcrList"
									style="float: right;"
						>
						</sbux-button>
                        <sbux-input id="srch_txtcs_name" uitype="text" style="width:200px;float:right;" placeholder="" class="form-control input-sm" ></sbux-input>
                        <sbux-select id="REGION_CODE" uitype="single" jsondata-ref="jsonRegionCode" style="width:200px;float:right;" unselected-text="선택" class="form-control input-sm" ></sbux-select>
					</div>
				</div>
				
				<div>
					<div id="sb-area-grdComMsg" style="height:258px;width:100%"></div>
				</div>
				
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>품묵</span>
						</li>
					</ul>
				</div>
				                
				<div>
					<div id="sb-area-grdComItem" style="height:258px;width:100%"></div>
				</div>
				
            </div>
        </div>
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:800px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	//-----------------------------------------------------------

	var editType			= "N";
	
	var jsonRegionCode		= [];	// 지역
	var jsonCurrenvyCode	= [];	// 통화
	var jsonUserYnCode		= [
		{value: 'Y', label: '사용', text: '사용'},
		{value: 'N', label: '불가',	text: '불가'}
	];	// 지역
	
	var jsonEmpStateCode	= [];	//재직상태
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid();
    	//fn_search();
    	
		//재직상태
		gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
			function(list){
				$('#SRCH_EMP_BTN').click(function(){
					fn_compopup1(list);
				});
			}
		)
    });

    //grid 초기화
    var NationInGrid; 			// 그리드를 담기위한 객체 선언
    var jsonNationList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdComMsg';
	    SBGridProperties.id 				= 'NationInGrid';
	    SBGridProperties.jsonref 			= 'jsonNationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["국가코드"],			ref: 'NATION_CODE', 			type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["국가약어"], 		ref: 'NATION_CODE_ABBR',    	type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["국가약식명"],  		ref: 'NATION_NAME',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["국가정식명"],      	ref: 'NATION_FULL_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["국가정식명(한글)"],	ref: 'NATION_FULL_NAME_CHN',	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["지역"],				ref: 'REGION_CODE', 			type:'combo',  		width:'100px',  	style:'text-align:left', disabled: true,
            	typeinfo: {
					ref			: 'jsonRegionCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["통화"],				ref: 'CURRENCY_CODE',   		type:'combo',  		width:'100px',  	style:'text-align:left', disabled: true,
            	typeinfo: {
					ref			: 'jsonCurrenvyCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["비고"], 			ref: 'MEMO', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정렬순서"], 		ref: 'SORT_SEQ',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["사용여부"], 		ref: 'USE_YN', 				type:'output',		width:'80px',		style:'text-align:center'}
        ];

        NationInGrid = _SBGrid.create(SBGridProperties);
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = NationInGrid.getPageSize();
    	let pageNo = 1;
    	
    	NationInGrid.movePaging(pageNo);
    }

	const fn_compopup1 = function(list) {
		
		var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_TXTEMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";
     	
     	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
     	compopup1.init({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_HRI001'
     		,whereClause			: strWhereClause
   			,searchCaptions			: ["부서",		"사원", 		"재직상태"]
   			,searchInputFields		: ["DEPT_NAME",	"EMP_NAME", 	"EMP_STATE"]
   			,searchInputValues		: ["", 			searchText,		""]
     	
   			,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 			"",				list]				//select 경우
     	
     		,height					: '400px'
   			,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
   			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
   			,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
 			,itemSelectEvent		: function (data){
 				console.log('callback data:', data);
 				SBUxMethod.set('SRCH_TXTEMP_NAME', data.EMP_NAME);
 				SBUxMethod.set('SRCH_TXTEMP_CODE', data.EMP_CODE);
 			},
     	});    
   	}
     
    //선택 삭제
    function fn_delete() {

        //fn_subDelete(gfn_comConfirm("Q0001", "삭제"), list);
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){
    	 
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>