
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	
<style type="text/css">
.ad_tbl_toplist>span {
	font-weight: bold;
	margin-right: 10px;
}
</style>

</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
			
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 경영체정보 -->
				</div>
				<div style="margin-left: auto;">
				
					<sbux-button
						id="btnSync"
						name="btnSync"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_sync"
						text="동기화"
					></sbux-button>
                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							
							
							<th colspan="1" scope="row" class="th_bg">경영체정보</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							
														
							
							
							
						</tr>
					</tbody>
				</table>
				
				<div class="table-responsive tbl_scroll_sm">
				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
				</sbux-tabs>
				
				

				<div class="tab-content">
					<div id="gnrlSttnTab" >
						<div id="sb-area-gnrlSttn" style="height:470px;"></div>
						<div>
							<table class="table table-bordered tbl_fixed">
								<caption>일반현황</caption>
								<colgroup>
									<col style="width:20%">
									<col style="width:30%">
									<col style="width:20%">
									<col style="width:30%">						
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th_bg" >농업인번호</th>
										<td>
											<sbux-label id="idxLabel_norm1" name="idxLabel_norm1" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >경영체 등록번호</th>
										<td>
											<sbux-label id="idxLabel_norm2" name="idxLabel_norm2" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >경영주 법인명</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >주민등록주소</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >실 거주 주소</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >실거주 도로명주소</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >마을명</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >개인법인구분</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >내외국인구분</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >전화번호</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >팩스번호</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >휴대전화번호</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >이메일</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >영농시작일</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >농업시작형태</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >농업종사형태</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >설립년도</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >사업자등록번호</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >대표자명</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >대표자 주소</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >생년월일</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >성별</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									
									
									
								</tbody>
							</table>
						</div>
							
					
					</div>
					<div id="frlnTab" >
						<div id="sb-area-frln" style="height:470px;"></div>
						<div>
							<table class="table table-bordered tbl_fixed">
								<caption>농지</caption>
								<colgroup>
									<col style="width:20%">
									<col style="width:30%">
									<col style="width:20%">
									<col style="width:30%">						
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th_bg" >농업인번호</th>
										<td>
											<sbux-label id="idxLabel_norm1" name="idxLabel_norm1" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >법정동코드</th>
										<td>
											<sbux-label id="idxLabel_norm2" name="idxLabel_norm2" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >농지본번</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >공동경작 여부</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >농지부번</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >농지주소</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >경작형태</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >농지 소유자명</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >공부지목</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >실제지목</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >공부농지면적</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >실제농지면적</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >휴경면적</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >폐경면적</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >품목코드</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >품목명</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >노지/시설구분</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >재배면적</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >대장구분코드</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >시설일련번호</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >시설형태</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >시설종류</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >시설면적</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>
										<th scope="row" class="th_bg" >시설설치년도</th>
										<td>
											<sbux-label id="idxLabel_norm" name="idxLabel_norm" class="form-control input-sm" uitype="normal" text=""></sbux-label>
										</td>	
									</tr>
									
									
									
								</tbody>
							</table>
						</div>
						
					</div>
					<div id="eduFnshTab" >
						<div id="sb-area-eduFnsh" style="height:470px;"></div>
					</div>
					<div id="ecfrdCertTab" >
						<div id="sb-area-ecfrdCert" style="height:470px;"></div>
					</div>
					<div id="rcfvHstryTab" >
						<div id="sb-area-frmerRcfvHstry" style="height:470px;"></div>
						<div id="sb-area-frlnRcfvHstry" style="height:470px;"></div>
						<div id="sb-area-locgovRcfvHstry" style="height:470px;"></div>
					</div>
					<div id="injstcRdmTab" >
						<div id="sb-area-injstcRdm" style="height:470px;"></div>
					</div>
				</div>
					
				</div>
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
	
</body>

<script type="text/javascript">

	
 	
	
	var jsonPrdcrAutocomplete = []; // 생산자

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();

	})

	const fn_init = async function() {
		fn_createGnrlSttn();
		fn_createFrln();
		fn_createEduFnsh();
		fn_createEcfrdCert();
		fn_createFrmerRcfvHstry();
		fn_createFrlnRcfvHstry();
		fn_createLocgovRcfvHstry();
		fn_createInjstcRdm();
		
		//let rst = await Promise.all([
		//]);
		fn_search();
	}


	//그리드 id
	var grdGnrlSttn;
	var grdFrln;
	var grdEduFnsh;
	var grdEcfrdCert;
	var grdFrmerRcfvHstry;
	var grdFrlnRcfvHstry;
	var grdLocgovRcfvHstry;
	var grdInjstcRdm;
	
	//그리드 json
	var jsonGnrlSttn = [];
	var jsonFrln = [];
	var jsonEduFnsh = [];
	var jsonEcfrdCert = [];
	var jsonFrmerRcfvHstry = [];
	var jsonFrlnRcfvHstry = [];
	var jsonLocgovRcfvHstry = [];
	var jsonInjstcRdm = [];
	

	
    var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "일반현황", "targetid" : "gnrlSttnTab", "targetvalue" : "일반현황" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "농지", "targetid" : "frlnTab", "targetvalue" : "농지" },
		{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "교육이수", "targetid" : "eduFnshTab", "targetvalue" : "교육이수" },
		{ "id" : "3", "pid" : "-1", "order" : "4", "text" : "친환경인증", "targetid" : "ecfrdCertTab", "targetvalue" : "친환경인증" },
		{ "id" : "4", "pid" : "-1", "order" : "5", "text" : "수혜이력", "targetid" : "rcfvHstryTab", "targetvalue" : "수혜이력" },
		{ "id" : "5", "pid" : "-1", "order" : "6", "text" : "부정당환수", "targetid" : "injstcRdmTab", "targetvalue" : "부정당환수" }
	];


	const fn_createGnrlSttn= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-gnrlSttn';
	    SBGridProperties.id = 'grdGnrlSttn';
	    SBGridProperties.jsonref = 'jsonGnrlSttn';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["농업인번호"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["경영체 등록번호"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["경영주 법인명"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["마을명"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["실거주 주소"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["휴대전화번호"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["전화번호"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: [""],	ref: '8',     		type:'input',  	hidden: true}

	    ];
        
        
        grdGnrlSttn= _SBGrid.create(SBGridProperties);
        //grdGnrlSttn.bind('click', fnClick)
        grdGnrlSttn.rebuild();
	}
	
	const fn_createFrln= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-frln';
	    SBGridProperties.id = 'grdFrln';
	    SBGridProperties.jsonref = 'jsonFrln';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["농지 일련번호"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["법정동코드"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["본번"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["부번"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["농지주소"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["품목명"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["재배면적"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdFrln= _SBGrid.create(SBGridProperties);
        //grdFrln.bind('click', fnClick)
        grdFrln.rebuild();
	}
	
	const fn_createEduFnsh= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-eduFnsh';
	    SBGridProperties.id = 'grdEduFnsh';
	    SBGridProperties.jsonref = 'jsonEduFnsh';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["교육과정코드"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["성명"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육기관명"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육과정명"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육시작일자"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육종료일자"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["확인여부"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdEduFnsh= _SBGrid.create(SBGridProperties);
        //grdEduFnsh.bind('click', fnClick)
        grdEduFnsh.rebuild();
	}
	
	const fn_createEcfrdCert= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-ecfrdCert';
	    SBGridProperties.id = 'grdEcfrdCert';
	    SBGridProperties.jsonref = 'jsonEcfrdCert';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["인증번호"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증시작일"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증종료일"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증정보상태"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["친환경인증구분명"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["친환경인증그룹구분명"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["단체명"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["농가주명"], ref: '8', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증필지"], ref: '9', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["면적"], ref: '10', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdEcfrdCert= _SBGrid.create(SBGridProperties);
        //grdEcfrdCert.bind('click', fnClick)
        grdEcfrdCert.rebuild();
	}
	
	const fn_createFrmerRcfvHstry= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-frmerRcfvHstry';
	    SBGridProperties.id = 'grdFrmerRcfvHstry';
	    SBGridProperties.jsonref = 'jsonFrmerRcfvHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["사업시작일"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업종료일"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["관할기관"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업코드"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업명"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["수혜자명"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["국고융자"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지방비융자"], ref: '8', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["국고보조금"], ref: '9', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지방비보조금"], ref: '10', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["처리시스템"], ref: '11', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdFrmerRcfvHstry= _SBGrid.create(SBGridProperties);
        //grdFrmerRcfvHstry.bind('click', fnClick)
        grdFrmerRcfvHstry.rebuild();
	}
	
	const fn_createFrlnRcfvHstry= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-frlnRcfvHstry';
	    SBGridProperties.id = 'grdFrlnRcfvHstry';
	    SBGridProperties.jsonref = 'jsonFrlnRcfvHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["PNU코드"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업시작일"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업종료일"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업코드"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업명"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["상태"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["신청인명"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["대장구분"], ref: '8', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["농지주소"], ref: '9', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["법정동코드"], ref: '10', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["본번"], ref: '11', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["부번"], ref: '12', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["신청면적"], ref: '13', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdFrlnRcfvHstry= _SBGrid.create(SBGridProperties);
        //grdFrlnRcfvHstry.bind('click', fnClick)
        grdFrlnRcfvHstry.rebuild();
	}
	
	const fn_createLocgovRcfvHstry= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-locgovRcfvHstry';
	    SBGridProperties.id = 'grdLocgovRcfvHstry';
	    SBGridProperties.jsonref = 'jsonLocgovRcfvHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["사업년도"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["시도명"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["시군구명"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지자체사업코드"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지자체사업명"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["수혜자명"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["국고융자"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지방비융자"], ref: '8', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["국고보조금"], ref: '9', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지방비보조금"], ref: '10', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["처리시스템"], ref: '11', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdLocgovRcfvHstry= _SBGrid.create(SBGridProperties);
        //grdLocgovRcfvHstry.bind('click', fnClick)
        grdLocgovRcfvHstry.rebuild();
	}
	
	const fn_createInjstcRdm= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-injstcRdm';
	    SBGridProperties.id = 'grdInjstcRdm';
	    SBGridProperties.jsonref = 'jsonInjstcRdm';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["사업년도"], ref: '1', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업명"], ref: '2', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["위반내용"], ref: '3', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["제재 시작년도"], ref: '4', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["제재 종료년도"], ref: '5', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["환수진행코드"], ref: '6', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["환수대상원금"], ref: '7', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["환수대상금액"], ref: '8', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdInjstcRdm= _SBGrid.create(SBGridProperties);
        //grdInjstcRdm.bind('click', fnClick)
        grdInjstcRdm.rebuild();
	}
	
	
	
	function fnClick(){
		this.inputmode = 'none';
	}


	// 배출구별 집계
	const fn_setExhstDsctnTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let sortFclt = SBUxMethod.get("srch-slt-sortFclt");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		const param = {
			apcCd: gv_selectedApcCd 
			, prdcrCd : prdcrCd
			, inptYmdFrom : inptYmdFrom
			, inptYmdTo  : inptYmdTo
			, sortFclt : sortFclt
			, prdcrCd : prdcrCd
			, itemCd : itemCd
		}
		jsonExhstDsctn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectExhstDsctn.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        let sumTot1 = {exhst1 : 0,exhst2 : 0, exhst3 : 0,exhst4 : 0,exhst5 : 0,exhst6 : 0,exhst7 : 0,exhst8 : 0,exhst9 : 0,exhst10 : 0,exhst11 : 0,exhst12 : 0,exhst13 : 0,exhst14 : 0,exhst15 : 0,exhst16 : 0,exhst17 : 0,exhst18 : 0,exhst19 : 0,exhst20 : 0,exhst21 : 0,exhst22 : 0,exhst23 : 0};
	        let sumTot2 = {exhst1 : 0,exhst2 : 0, exhst3 : 0,exhst4 : 0,exhst5 : 0,exhst6 : 0,exhst7 : 0,exhst8 : 0,exhst9 : 0,exhst10 : 0,exhst11 : 0,exhst12 : 0,exhst13 : 0,exhst14 : 0,exhst15 : 0,exhst16 : 0,exhst17 : 0,exhst18 : 0,exhst19 : 0,exhst20 : 0,exhst21 : 0,exhst22 : 0,exhst23 : 0};
	        data.resultList.forEach((item, index) => {
	        	const exhstDsctnQnttTot = {
	        			grd     : item.GRD
	        			,sortFclt : item.FCLT_NM
	        			,sortInfo : item.PRDCR_NM
	        			,grd      : "수량"
	        				,exhst1 : item.QNTT_1
	        				,exhst2 : item.QNTT_2
	        				,exhst3 : item.QNTT_3
	        				,exhst4 : item.QNTT_4
	        				,exhst5 : item.QNTT_5
	        				,exhst6 : item.QNTT_6
	        				,exhst7 : item.QNTT_7
	        				,exhst8 : item.QNTT_8
	        				,exhst9 : item.QNTT_9
	        				,exhst10 : item.QNTT_10
	        				,exhst11 : item.QNTT_11
	        				,exhst12 : item.QNTT_12
	        				,exhst13 : item.QNTT_13
	        				,exhst14 : item.QNTT_14
	        				,exhst15 : item.QNTT_15
	        				,exhst16 : item.QNTT_16
	        				,exhst17 : item.QNTT_17
	        				,exhst18 : item.QNTT_18
	        				,exhst19 : item.QNTT_19
	        				,exhst20 : item.QNTT_20
	        				,exhst21 : item.QNTT_21
	        				,exhst22 : item.QNTT_22
                            ,exhst23 : item.QNTT_23
                            ,exhst24 : item.QNTT_24
                            ,exhst25 : item.QNTT_25
                            ,exhst26 : item.QNTT_26
                            ,exhst27 : item.QNTT_27
                            ,exhst28 : item.QNTT_28
                            ,exhst29 : item.QNTT_29
                            ,exhst30 : item.QNTT_30
    						,sbTot        : item.SORT_QNTT

	        	};
				const exhstDsctnWghtTot = 		{
        			sortFclt : item.FCLT_NM
        			,sortInfo : item.INPT_YMD
        			,grd      : "중량"
        				,exhst1 : item.WGHT_1
        				,exhst2 : item.WGHT_2
        				,exhst3 : item.WGHT_3
        				,exhst4 : item.WGHT_4
        				,exhst5 : item.WGHT_5
        				,exhst6 : item.WGHT_6
        				,exhst7 : item.WGHT_7
        				,exhst8 : item.WGHT_8
        				,exhst9 : item.WGHT_9
        				,exhst10 : item.WGHT_10
        				,exhst11 : item.WGHT_11
        				,exhst12 : item.WGHT_12
        				,exhst13 : item.WGHT_13
        				,exhst14 : item.WGHT_14
        				,exhst15 : item.WGHT_15
        				,exhst16 : item.WGHT_16
        				,exhst17 : item.WGHT_17
        				,exhst18 : item.WGHT_18
        				,exhst19 : item.WGHT_19
        				,exhst20 : item.WGHT_20
        				,exhst21 : item.WGHT_21
        				,exhst22 : item.WGHT_22
                        ,exhst23 : item.WGHT_23
                        ,exhst24 : item.WGHT_24
                        ,exhst25 : item.WGHT_25
                        ,exhst26 : item.WGHT_26
                        ,exhst27 : item.WGHT_27
                        ,exhst28 : item.WGHT_28
                        ,exhst29 : item.WGHT_29
                        ,exhst30 : item.WGHT_30
					,sbTot        : item.SORT_WGHT
        		}
	        	jsonExhstDsctn.push(exhstDsctnQnttTot);
	        	jsonExhstDsctn.push(exhstDsctnWghtTot);	    
	        	sumTot1 = sumValues(sumTot1,exhstDsctnQnttTot);	        	
        		sumTot2 = sumValues(sumTot2,exhstDsctnWghtTot);
        		
	        });	      
	         
	        sumTot1["sortFclt"] = "합계"; sumTot1["grd"] = "수량"; sumTot1["sortInfo"] = "합계";
	        sumTot2["sortFclt"] = "합계"; sumTot2["grd"] = "중량"; sumTot2["sortInfo"] = "합계";
            sumTot1["sbTot"] = sumTot1.exhst1+    sumTot1.exhst2+    sumTot1.exhst3+    sumTot1.exhst4+    sumTot1.exhst5+    sumTot1.exhst6+    sumTot1.exhst7+    sumTot1.exhst8+    sumTot1.exhst9+    sumTot1.exhst10+    sumTot1.exhst11+    sumTot1.exhst12+    sumTot1.exhst13+    sumTot1.exhst14+    sumTot1.exhst15+    sumTot1.exhst16+    sumTot1.exhst17+    sumTot1.exhst18+    sumTot1.exhst19+    sumTot1.exhst20+    sumTot1.exhst21+    sumTot1.exhst22+    sumTot1.exhst23 + sumTot1.exhst24 + sumTot1.exhst25 + sumTot1.exhst26 + sumTot1.exhst27 + sumTot1.exhst28 + sumTot1.exhst29 + sumTot1.exhst30; 
            sumTot2["sbTot"] = sumTot2.exhst1+    sumTot2.exhst2+    sumTot2.exhst3+    sumTot2.exhst4+    sumTot2.exhst5+    sumTot2.exhst6+    sumTot2.exhst7+    sumTot2.exhst8+    sumTot2.exhst9+    sumTot2.exhst10+    sumTot2.exhst11+    sumTot2.exhst12+    sumTot2.exhst13+    sumTot2.exhst14+    sumTot2.exhst15+    sumTot2.exhst16+    sumTot2.exhst17+    sumTot2.exhst18+    sumTot2.exhst19+    sumTot2.exhst20+    sumTot2.exhst21+    sumTot2.exhst22+    sumTot2.exhst23 + sumTot2.exhst24 + sumTot2.exhst25 + sumTot2.exhst26 + sumTot2.exhst27 + sumTot2.exhst28 + sumTot2.exhst29 + sumTot2.exhst30;

	        jsonExhstDsctn.push(sumTot1);
	        jsonExhstDsctn.push(sumTot2);
	        const allData = grdExhstDsctn.getGridDataAll();
			

	        grdExhstDsctn.refresh();
	        

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	function sumValues(obj1,obj2){
		const result = {};
		for(const key in obj1){
			if(obj1.hasOwnProperty(key)){
				const val1 = obj1[key];
				const val2 = obj2[key] || 0;
				result[key] = val1 + val2 
			}
		}
		return result;
	}
	// 등급별 집계
	const fn_setGrdDsctnTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd,
			prdcrCd : prdcrCd,
			itemCd : itemCd
		}
		jsonGrdDsctn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectGrdDsctn.do",
						param,
						null,
						false
					);
			let sumTot1 = {grd1 : 0,grd2 : 0, grd3 : 0,grd4 : 0,grd5 : 0,grd6 : 0,grd7 : 0,grd8 : 0,grd9 : 0};
 	        let sumTot2 = {grd1 : 0,grd2 : 0, grd3 : 0,grd4 : 0,grd5 : 0,grd6 : 0,grd7 : 0,grd8 : 0,grd9 : 0};
	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const grdDsctnQnttTot = {
	 	        			sortFclt : item.FCLT_NM
                            ,sortInfo : item.PRDCR_NM
	 	        			,grd      : "수량"
	         				,grd1 : item.QNTT_1
	         				,grd2 : item.QNTT_2
	         				,grd3 : item.QNTT_3
	         				,grd4 : item.QNTT_4
	         				,grd5 : item.QNTT_5
	         				,grd6 : item.QNTT_6
	         				,grd7 : item.QNTT_7
	         				,grd8 : item.QNTT_8
	         				,grd9 : item.QNTT_9	         				
	         				,sbTot        : item.SORT_QNTT

	 	        	};
	 				const grdDsctnWghtTot = 		{
                         sortFclt : item.FCLT_NM
                        ,sortInfo : item.INPT_YMD
	         			,grd      : "중량"
	         				,grd1 : item.WGHT_1
	         				,grd2 : item.WGHT_2
	         				,grd3 : item.WGHT_3
	         				,grd4 : item.WGHT_4
	         				,grd5 : item.WGHT_5
	         				,grd6 : item.WGHT_6
	         				,grd7 : item.WGHT_7
	         				,grd8 : item.WGHT_8
	         				,grd9 : item.WGHT_9	         				
	         				,sbTot        : item.SORT_WGHT
	         		};
	 	        	jsonGrdDsctn.push(grdDsctnQnttTot);
	 	        	jsonGrdDsctn.push(grdDsctnWghtTot);	    
	 	        	sumTot1 = sumValues(sumTot1,grdDsctnQnttTot);	        	
	         		sumTot2 = sumValues(sumTot2,grdDsctnWghtTot);
	         		
	 	        });	      
	 	         
	 	        sumTot1["sortFclt"] = "합계"; sumTot1["grd"] = "수량"; sumTot1["sortInfo"] = "합계";
	 	        sumTot2["sortFclt"] = "합계"; sumTot2["grd"] = "중량"; sumTot2["sortInfo"] = "합계";
	 	        sumTot1["sbTot"] = sumTot1.grd1 + sumTot1.grd2 + sumTot1.grd3 + sumTot1.grd4 + sumTot1.grd5 + sumTot1.grd6 + sumTot1.grd7 + sumTot1.grd8 + sumTot1.grd9;  
	 	        sumTot2["sbTot"] = sumTot2.grd1 + sumTot2.grd2 + sumTot2.grd3 + sumTot2.grd4 + sumTot2.grd5 + sumTot2.grd6 + sumTot2.grd7 + sumTot2.grd8 + sumTot2.grd9;

	 	        jsonGrdDsctn.push(sumTot1);
	 	        jsonGrdDsctn.push(sumTot2);


	        const allData = grdGrdDsctn.getGridDataAll();


	        grdGrdDsctn.refresh();
	        

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	const fn_search = async function () {
        
	}

	const fn_dtpChange = function(){
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

     // 엑셀 다운로드
     function fn_excelDwnld() {
    	 grdExhstDsctn.exportLocalExcel("배출구별집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }

     /**
  	* @name fn_onInputPrdcrNm
  	* @description 생산자명 입력 시 event : autocomplete
  	*/
  	const fn_onInputPrdcrNm = function(prdcrNm){
  		fn_clearPrdcr();
  		if(getByteLengthOfString(prdcrNm.target.value) > 100){
  			SBUxMethod.set("srch-inp-prdcrNm", "");
  			return;
  		}
  		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
      	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
      }

  	/**
  	 * @name fn_clearPrdcr
  	 * @description 생산자 폼 clear
  	 */
  	const fn_clearPrdcr = function() {
  		SBUxMethod.set("srch-inp-prdcrCd", "");
  		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
  	}

 	/**
 	 * @name fn_onSelectPrdcrNm
 	 * @description 생산자 autocomplete 선택 callback
 	 */
 	 function fn_onSelectPrdcrNm(value, label, item) {
 		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
 		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
 			document.getElementById('btn-srch-prdcr').click();
 		}
 		else{
 			SBUxMethod.set("srch-inp-prdcrCd", value);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}

     const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
 	}

 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}
 	
    const fn_setExhstDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd 
            , grdSeCd : '02'
            , itemCd : itemCd
        }
        jsonExhstColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                        "/am/sort/selectExhstDsctnCol.do",
                        param,
                        null,
                        false
                    );
            
            
            const data = await postJsonPromise;
            jsonExhstColumnData = data.resultList;
            await fn_createExhstDsctn();

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
             //gfn_comAlert("E0001");    //    E0001    오류가 발생하였습니다.
        }
        
    }
    
    const fn_setGrdDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd 
            , grdSeCd : '03'
            , itemCd : itemCd
        }
        jsonGrdColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                        "/am/sort/selectExhstDsctnCol.do",
                        param,
                        null,
                        false
                    );
            
            
            const data = await postJsonPromise;
            jsonGrdColumnData = data.resultList;
            await fn_createGrdDsctn();

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
             //gfn_comAlert("E0001");    //    E0001    오류가 발생하였습니다.
        }
        
    }
     
 	
 	/**
	 * @name fn_docSort
	 * @description 선별확인서 발행
	 */
	const fn_docSort = async function() {
		const sortnoSnList = [];
		const sortnoList = [];
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'ST_DOC');
		const allData = grdExhstDsctn.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoSnList.push(item.sortno + item.sortSn);
				sortnoList.push(item.sortno);
    		}
		});

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const sortnoSn = sortnoSnList.join("','");
 		const sortno = sortnoList.join("','");
 		gfn_popClipReport("선별확인서", rptUrl, {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 		//gfn_popClipReport("선별확인서", "am/sortIdntyDoc.crf", {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 	}
 	
	

     
     


</script>
</html>