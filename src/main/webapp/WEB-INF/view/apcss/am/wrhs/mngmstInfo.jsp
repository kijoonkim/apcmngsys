
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
							
							
							<th colspan="1" scope="row" class="th_bg"><span class="data_required" ></span>경영체정보</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-frmerSn"
									name="srch-inp-frmerSn"
									class="form-control input-sm"
									
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-frmer"
									onclick="fn_choiceFrmer"
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
											<sbux-input id="inp-gnrl-frmerNo" name="inp-gnrl-frmerNo" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >경영체 등록번호</th>
										<td>
											<sbux-input id="inp-gnrl-mngmstRegNo" name="inp-gnrl-mngmstRegNo" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >경영주 법인명</th>
										<td>
											<sbux-input id="inp-gnrl-admstOwnrCorpNm" name="inp-gnrl-admstOwnrCorpNm" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >주민등록주소</th>
										<td>
											<sbux-input id="inp-gnrl-admstOwnrRgdtAddr" name="inp-gnrl-admstOwnrRgdtAddr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >실 거주 주소</th>
										<td>
											<sbux-input id="inp-gnrl-admstOwnrActlHbtnAddr" name="inp-gnrl-admstOwnrActlHbtnAddr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >실거주 도로명주소</th>
										<td>
											<sbux-input id="inp-gnrl-admstOwnrDaddr" name="inp-gnrl-admstOwnrDaddr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >마을명</th>
										<td>
											<sbux-input id="inp-gnrl-vlgNm" name="inp-gnrl-vlgNm" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >개인법인구분</th>
										<td>
											<sbux-input id="inp-gnrl-prsnaCorpSeCd" name="inp-gnrl-prsnaCorpSeCd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >내외국인구분</th>
										<td>
											<sbux-input id="inp-gnrl-ctznFngnrSeCd" name="inp-gnrl-ctznFngnrSeCd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >전화번호</th>
										<td>
											<sbux-input id="inp-gnrl-telno" name="inp-gnrl-telno" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >팩스번호</th>
										<td>
											<sbux-input id="inp-gnrl-fxno" name="inp-gnrl-fxno" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >휴대전화번호</th>
										<td>
											<sbux-input id="inp-gnrl-mblTelno" name="inp-gnrl-mblTelno" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >이메일</th>
										<td>
											<sbux-input id="inp-gnrl-emlAddr" name="inp-gnrl-emlAddr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >영농시작일</th>
										<td>
											<sbux-input id="inp-gnrl-agrcBgngYmd" name="inp-gnrl-agrcBgngYmd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >농업시작형태</th>
										<td>
											<sbux-input id="inp-gnrl-frmngBgngShap" name="inp-gnrl-frmngBgngShap" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >농업종사형태</th>
										<td>
											<sbux-input id="inp-gnrl-frmngEnggShap" name="inp-gnrl-frmngEnggShap" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >설립년도</th>
										<td>
											<sbux-input id="inp-gnrl-fndnYr" name="inp-gnrl-fndnYr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >사업자등록번호</th>
										<td>
											<sbux-input id="inp-gnrl-brno" name="inp-gnrl-brno" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >대표자명</th>
										<td>
											<sbux-input id="inp-gnrl-rprsvNm" name="inp-gnrl-rprsvNm" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >대표자 주소</th>
										<td>
											<sbux-input id="inp-gnrl-rprsvAddr" name="inp-gnrl-rprsvAddr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >생년월일</th>
										<td>
											<sbux-input id="inp-gnrl-brdt" name="inp-gnrl-brdt" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >성별</th>
										<td>
											<sbux-input id="inp-gnrl-sxdc" name="inp-gnrl-sxdc" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									
									
									
								</tbody>
							</table>
						</div>
							
					
					</div>
					<div id="frlnTab" >
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
											<sbux-input id="inp-frln-frmerNo" name="inp-frln-frmerNo" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >법정동코드</th>
										<td>
											<sbux-input id="inp-frln-stdgCd" name="inp-frln-stdgCd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >농지본번</th>
										<td>
											<sbux-input id="inp-frln-frlnMno" name="inp-frln-frlnMno" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >공동경작 여부</th>
										<td>
											<sbux-input id="inp-frln-cprtnFrlnYn" name="inp-frln-cprtnFrlnYn" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >농지부번</th>
										<td>
											<sbux-input id="inp-frln-frlnSno" name="inp-frln-frlnSno" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >농지주소</th>
										<td>
											<sbux-input id="inp-frln-frlnAddr" name="inp-frln-frlnAddr" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >경작형태</th>
										<td>
											<sbux-input id="inp-frln-frlnType" name="inp-frln-frlnType" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >농지 소유자명</th>
										<td>
											<sbux-input id="inp-frln-frlnOwnrNm" name="inp-frln-frlnOwnrNm" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >공부지목</th>
										<td>
											<sbux-input id="inp-frln-actlLdcg" name="inp-frln-actlLdcg" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >실제지목</th>
										<td>
											<sbux-input id="inp-frln-poeLdcg" name="inp-frln-poeLdcg" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >공부농지면적</th>
										<td>
											<sbux-input id="inp-frln-actlFrlnArea" name="inp-frln-actlFrlnArea" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >실제농지면적</th>
										<td>
											<sbux-input id="inp-frln-poeFrlnArea" name="inp-frln-poeFrlnArea" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >휴경면적</th>
										<td>
											<sbux-input id="inp-frln-flwArea" name="inp-frln-flwArea" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >폐경면적</th>
										<td>
											<sbux-input id="inp-frln-ablFrlnArea" name="inp-frln-ablFrlnArea" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >품목코드</th>
										<td>
											<sbux-input id="inp-frln-itemCd" name="inp-frln-itemCd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >품목명</th>
										<td>
											<sbux-input id="inp-frln-itemNm" name="inp-frln-itemNm" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >노지/시설구분</th>
										<td>
											<sbux-input id="inp-frln-brgrndFcltSeCd" name="inp-frln-brgrndFcltSeCd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >재배면적</th>
										<td>
											<sbux-input id="inp-frln-frlnArea" name="inp-frln-frlnArea" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >대장구분코드</th>
										<td>
											<sbux-input id="inp-frln-ldgrSeCd" name="inp-frln-ldgrSeCd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >시설일련번호</th>
										<td>
											<sbux-input id="inp-frln-fcltSn" name="inp-frln-fcltSn" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >시설형태</th>
										<td>
											<sbux-input id="inp-frln-fcltShap" name="inp-frln-fcltShap" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >시설종류</th>
										<td>
											<sbux-input id="inp-frln-fcltKnd" name="inp-frln-fcltKnd" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>	
									</tr>
									<tr>
										<th scope="row" class="th_bg" >시설면적</th>
										<td>
											<sbux-input id="inp-frln-fcltArea" name="inp-frln-fcltArea" class="form-control input-sm" uitype="text" readonly></sbux-input>
										</td>
										<th scope="row" class="th_bg" >시설설치년도</th>
										<td>
											<sbux-input id="inp-frln-fcltInstlYr" name="inp-frln-fcltInstlYr" class="form-control input-sm" uitype="text" readonly></sbux-input>
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
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>농업인 수혜이력</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-frmerRcfvHstry" style="height:470px;"></div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>농지 수혜이력</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-frlnRcfvHstry" style="height:470px;"></div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>지자체 수혜이력</span>
								</li>
							</ul>
						</div>
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
        <sbux-modal id="modal-frmer" name="modal-frmer" uitype="middle" header-title="경영체 선택" body-html-id="body-modal-frmer" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-frmer">
    	<jsp:include page="../../am/popup/farmerInfoPopup.jsp"></jsp:include>
    </div>
	
</body>

<script type="text/javascript">

	
 	
	
	var jsonPrdcrAutocomplete = []; // 생산자
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();

	})

	const fn_init = async function() {
		//fn_createGnrlSttn();
		//fn_createFrln();
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


	
	

  //교육이수 그리드 생성
	const fn_createEduFnsh= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-eduFnsh';
	    SBGridProperties.id = 'grdEduFnsh';
	    SBGridProperties.jsonref = 'jsonEduFnsh';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListEdu;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["교육과정코드"], ref: 'crclmCd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["성명"], ref: 'flNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육기관명"], ref: 'ednstNm', type: 'input',  width:'250px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육과정명"], ref: 'crclmNm', type: 'input',  width:'300px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육시작일자"], ref: 'eduBgngYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["교육종료일자"], ref: 'eduEndYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["확인여부"], ref: 'idntyYn', type: 'input',  width:'50px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdEduFnsh= _SBGrid.create(SBGridProperties);
        //grdEduFnsh.bind('click', fnClick)
        grdEduFnsh.rebuild();
	}
	//친환경인증 그리드 생성
	const fn_createEcfrdCert= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-ecfrdCert';
	    SBGridProperties.id = 'grdEcfrdCert';
	    SBGridProperties.jsonref = 'jsonEcfrdCert';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListEcfrd;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["인증번호"], ref: 'certNo', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증시작일"], ref: 'certBgngYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증종료일"], ref: 'certEndYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증정보상태"], ref: 'certStts', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["친환경인증구분명"], ref: 'ecfrdCertSeNm', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["친환경인증그룹구분명"], ref: 'ecfrdCertGroupSeNm', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["단체명"], ref: 'grpNm', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["농가주명"], ref: 'ownrNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["인증필지"], ref: 'certAddr', type: 'input',  width:'300px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["면적"], ref: 'sfc', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdEcfrdCert= _SBGrid.create(SBGridProperties);
        //grdEcfrdCert.bind('click', fnClick)
        grdEcfrdCert.rebuild();
	}
	
	//농업인수혜이력 그리드 생성
	const fn_createFrmerRcfvHstry= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-frmerRcfvHstry';
	    SBGridProperties.id = 'grdFrmerRcfvHstry';
	    SBGridProperties.jsonref = 'jsonFrmerRcfvHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListFrmerRcfv;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["사업시작일"], ref: 'bizBgngYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업종료일"], ref: 'bizEndYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["관할기관"], ref: 'cmptncInst', type: 'input',  width:'200px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업코드"], ref: 'bizCd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업명"], ref: 'bizNm', type: 'input',  width:'200px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["수혜자명"], ref: 'rcfvrsNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["국고융자"], ref: 'govFnncng', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["지방비융자"], ref: 'lcLtExpndFnncng', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' ,format : {type:'number', rule:'#,###'}, disabled:true  },
	    	{caption : ["국고보조금"], ref: 'govSbsds', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["지방비보조금"], ref: 'lcltExpndSbsds', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["처리시스템"], ref: 'prcsSys', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdFrmerRcfvHstry= _SBGrid.create(SBGridProperties);
        //grdFrmerRcfvHstry.bind('click', fnClick)
        grdFrmerRcfvHstry.rebuild();
	}
	
	//농지수혜이력 그리드 생성
	const fn_createFrlnRcfvHstry= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-frlnRcfvHstry';
	    SBGridProperties.id = 'grdFrlnRcfvHstry';
	    SBGridProperties.jsonref = 'jsonFrlnRcfvHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListFrlnRcfv;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["PNU코드"], ref: 'pnuCd', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업시작일"], ref: 'bizBgngYmd', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업종료일"], ref: 'bizEndYmd', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업코드"], ref: 'bizCd', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업명"], ref: 'bizNm', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["상태"], ref: 'stts', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["신청인명"], ref: 'aplcntNm', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["대장구분"], ref: 'ldgrSe', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["농지주소"], ref: 'frlnAddr', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["법정동코드"], ref: 'stdgCd', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["본번"], ref: 'mno', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["부번"], ref: 'sno', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["신청면적"], ref: 'aplySfc', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdFrlnRcfvHstry= _SBGrid.create(SBGridProperties);
        //grdFrlnRcfvHstry.bind('click', fnClick)
        grdFrlnRcfvHstry.rebuild();
	}
	
	//지자체수혜이력 그리드 생성
	const fn_createLocgovRcfvHstry= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-locgovRcfvHstry';
	    SBGridProperties.id = 'grdLocgovRcfvHstry';
	    SBGridProperties.jsonref = 'jsonLocgovRcfvHstry';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListLocgov;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["사업년도"], ref: '1', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["시도명"], ref: '2', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["시군구명"], ref: '3', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지자체사업코드"], ref: '4', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["지자체사업명"], ref: '5', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["수혜자명"], ref: '6', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["국고융자"], ref: '7', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["지방비융자"], ref: '8', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["국고보조금"], ref: '9', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["지방비보조금"], ref: '10', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["처리시스템"], ref: '11', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdLocgovRcfvHstry= _SBGrid.create(SBGridProperties);
        //grdLocgovRcfvHstry.bind('click', fnClick)
        grdLocgovRcfvHstry.rebuild();
	}
	
	//부정당환수 그리드 생성
	const fn_createInjstcRdm= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-injstcRdm';
	    SBGridProperties.id = 'grdInjstcRdm';
	    SBGridProperties.jsonref = 'jsonInjstcRdm';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListInjstc;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		//SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["사업년도"], ref: 'bizYr', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["사업명"], ref: 'bizNm', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["위반내용"], ref: 'vltnCn', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["제재 시작년도"], ref: 'sncnsBgngYr', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["제재 종료년도"], ref: 'sncnsEndYr', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["환수진행코드"], ref: 'rdmPrgrsCd', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["환수대상원금"], ref: 'rdmTrgtPrncpl', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	{caption : ["환수대상금액"], ref: 'rdmTrgtAmt', type: 'input',  width:'150px', style: 'text-align:center; padding-right:5px;',format : {type:'number', rule:'#,###'} , disabled:true  },
	    	
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        
        
        grdInjstcRdm= _SBGrid.create(SBGridProperties);
        //grdInjstcRdm.bind('click', fnClick)
        grdInjstcRdm.rebuild();
	}
	
	
	
	function fnClick(){
		this.inputmode = 'none';
	}
	
	function fnGnrlSttnClick(){
		var nRow = grdGnrlSttn.getRow();
		var rowData = grdGnrlSttn.getRowData(nRow);
	}
	
	function fnFrlnClick(){
		var nRow = grdFrln.getRow();
		var rowData = grdFrln.getRowData(nRow);
	}


	
	

	// 일반현황 조회
	const fn_setGnrlSttn = async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerSn : frmerSn			
		}
		//jsonGrdDsctn.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmerInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	
	 	        	SBUxMethod.set("inp-gnrl-frmerNo",item.frmerSn);
	 	        	SBUxMethod.set("inp-gnrl-mngmstRegNo",item.bzobRgno);
	 	        	SBUxMethod.set("inp-gnrl-admstOwnrCorpNm",item.bzmCorpNm);
	 	        	SBUxMethod.set("inp-gnrl-admstOwnrRgdtAddr",item.addr);
	 	        	SBUxMethod.set("inp-gnrl-admstOwnrActlHbtnAddr",item.rrsdAddr);
	 	        	SBUxMethod.set("inp-gnrl-admstOwnrDaddr",item.rdnmAddr);
	 	        	SBUxMethod.set("inp-gnrl-vlgNm",item.twNm);
	 	        	SBUxMethod.set("inp-gnrl-prsnaCorpSeCd",item.perCorpDvcdNm);
	 	        	SBUxMethod.set("inp-gnrl-ctznFngnrSeCd",item.nafoDvcdNm);
	 	        	SBUxMethod.set("inp-gnrl-telno",item.telno);
	 	        	SBUxMethod.set("inp-gnrl-fxno",item.faxTelno);
	 	        	SBUxMethod.set("inp-gnrl-mblTelno",item.mblTelno);
	 	        	SBUxMethod.set("inp-gnrl-emlAddr",item.emailAddr);
	 	        	SBUxMethod.set("inp-gnrl-agrcBgngYmd",item.famgStrYmd);
	 	        	SBUxMethod.set("inp-gnrl-frmngBgngShap",item.farmngBeginStleCdNm);
	 	        	SBUxMethod.set("inp-gnrl-frmngEnggShap",item.farmngEngageStleCdNm);
	 	        	SBUxMethod.set("inp-gnrl-brno",item.bzmRgno);
	 	        	SBUxMethod.set("inp-gnrl-rprsvNm",item.reprNm);
	 	        	SBUxMethod.set("inp-gnrl-rprsvAddr",item.reprAddr);
	 	        	SBUxMethod.set("inp-gnrl-brdt",item.brthdy);
	 	        	SBUxMethod.set("inp-gnrl-sxdc",item.sexdstn);
	 	        	SBUxMethod.set("inp-gnrl-fndnYr",item.fndtYr);
	 	        	
	 	        	
	 	        });
	        


	        //grdGnrlSttn.refresh();
	        

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}
	
	// 농지 조회
	const fn_setFrln = async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerno : frmerSn			
		}
		//jsonFrln.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmLandInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	
	 	        	SBUxMethod.set("inp-frln-frmerNo",item.frmerno);
	 	        	SBUxMethod.set("inp-frln-stdgCd",item.stdgcd);
	 	        	SBUxMethod.set("inp-frln-frlnMno",item.frlnMno);
	 	        	SBUxMethod.set("inp-frln-frlnSno",item.frlnSno);
	 	        	SBUxMethod.set("inp-frln-frlnAddr",item.frlnAddr);
	 	        	SBUxMethod.set("inp-frln-frlnType",item.frlnType);
	 	        	SBUxMethod.set("inp-frln-frlnOwnrNm",item.frlnOwnrNm);
	 	        	SBUxMethod.set("inp-frln-actlLdcg",item.actlLdcg);
	 	        	SBUxMethod.set("inp-frln-poeLdcg",item.poeLdcg);
	 	        	SBUxMethod.set("inp-frln-actlFrlnArea",item.actlFrlnarea);
	 	        	SBUxMethod.set("inp-frln-poeFrlnArea",item.poeFrlnarea);
	 	        	SBUxMethod.set("inp-frln-flwArea",item.flwArea);
	 	        	SBUxMethod.set("inp-frln-ablFrlnArea",item.ablFrlnarea);
	 	        	SBUxMethod.set("inp-frln-itemCd",item.itemCd);
	 	        	SBUxMethod.set("inp-frln-itemNm",item.itemNm);
	 	        	SBUxMethod.set("inp-frln-brgrndFcltSeCd",item.brgrndFcltSeCd);
	 	        	SBUxMethod.set("inp-frln-frlnArea",item.frlnarea);
	 	        	SBUxMethod.set("inp-frln-ldgrSeCd",item.ldgrSeCd);
	 	        	SBUxMethod.set("inp-frln-fcltSn",item.fcltSn);
	 	        	SBUxMethod.set("inp-frln-fcltShap",item.fcltShap);
	 	        	SBUxMethod.set("inp-frln-fcltKnd",item.fcltKnd);
	 	        	SBUxMethod.set("inp-frln-fcltArea",item.fcltArea);
	 	        	SBUxMethod.set("inp-frln-fcltInstlYr",item.fcltInstallYr);
	 	        	SBUxMethod.set("inp-frln-cprtnFrlnYn",item.cprtnFrlnyn);
	 	        	
	 	        	
	 	        	
	 	        	
	 	        	
	 	        });
	        


	        
	        

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}
	
	// 교육 조회
	const fn_setEdu = async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerno : frmerSn			
		}
		//jsonFrln.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmerEducationInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const param = {
	 	        			frmerno : item.frmerno,
	 	        			mngmstRegno : item.mngmstRegno,
	 	        			crclmCd : item.crclmCd,
	 	        			flNm : item.flNm,
	 	        			ednstNm : item.ednstNm,
	 	        			crclmNm : item.crclmNm,
	 	        			eduBgngYmd : item.eduBgngYmd,
	 	        			eduEndYmd : item.eduEndYmd,
	 	        			idntyYn : item.idntyYn
	 	        	}
	 	        	jsonEduFnsh.push(param);
	 	        });
	 	       grdEduFnsh.refresh();

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}
	
	// 친환경인증 조회
	const fn_setEcfrdCert = async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerno : frmerSn			
		}
		jsonEcfrdCert.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmerSnCertificationInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const param = {
	 	        			certNo : item.certNo,
	 	        			certBgngYmd : item.certBgngYmd,
	 	        			certEndYmd : item.certEndYmd,
	 	        			certStts : item.certStts,
	 	        			ecfrdCertSeNm : item.ecfrdCertSeNm,
	 	        			ecfrdCertGroupSeNm : item.ecfrdCertGroupSeNm,
	 	        			grpNm : item.grpNm,
	 	        			ownrNm : item.ownrNm,
	 	        			certAddr : item.certAddr,
	 	        			sfc : item.sfc
	 	       		}
	 	        	jsonEcfrdCert.push(param);
	 	        });
	        grdEcfrdCert.refresh();


	        
	        

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}
	
	// 농업인수혜 조회
	const fn_setFrmerRcfvHstry = async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerno : frmerSn			
		}
		jsonFrmerRcfvHstry.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmerGrantsInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const param = {
	 	        			frmerno : item.frmerno,
	 	        			bizBgngYmd : item.bizBgngYmd,
	 	        			bizEndYmd : item.bizEndYmd,
	 	        			cmptncInst : item.cmptncInst,
	 	        			bizCd : item.bizCd,
	 	        			bizNm : item.bizNm,
	 	        			rcfvrsNm : item.rcfvrsNm,
	 	        			govFnncng : item.govFnncng,
	 	        			lcLtExpndFnncng : item.lcLtExpndFnncng,
	 	        			govSbsds : item.govSbsds,
	 	        			lcltExpndSbsds : item.lcltExpndSbsds,
	 	        			prcsSys : item.prcsSys
	 	       		}
	 	        	jsonFrmerRcfvHstry.push(param);
	 	        });
	 	       grdFrmerRcfvHstry.refresh();

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}
	
	// 농지수혜 조회
	const fn_setFrlnRcfvHstry= async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerno : frmerSn			
		}
		jsonFrlnRcfvHstry.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmLandGrantsInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const param = {
	 	        			frmerno : item.frmerno,
	 	        			pnuCd   : item.pnuCd,
	 	        			bizBgngYmd : item.bizBgngYmd,
	 	        			bizEndYmd : item.bizEndYmd,
	 	        			bizCd : item.bizCd,
	 	        			bizNm : item.bizNm,
	 	        			stts  : item.stts,
	 	        			aplcntNm  : item.aplcntNm,
	 	        			ldgrSe : item.ldgrSe,
	 	        			frlnAddr : item.frlnAddr,
	 	        			stdgCd : item.stdgCd,
	 	        			mno : item.mno,
	 	        			sno : item.sno,
	 	        			aplySfc : item.aplySfc
	 	       		}
	 	        	jsonFrlnRcfvHstry.push(param);
	 	        });
	 	       grdFrlnRcfvHstry.refresh();

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}
	
	// 부정당 조회
	const fn_setInjstcRdm = async function() {
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		
		const param = {
			frmerno : frmerSn			
		}
		jsonInjstcRdm.length = 0;
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/fm/farm/selectFarmLandGrantsInfoList.do",
						param,
						null,
						false
					);

	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const param = {
	 	        			frmerno : item.frmerno ,
	 	        			bizYr     : item.bizYr ,
	 	        			bizNm     : item.bizNm ,
	 	        			vltnCn     : item.bltnCn ,
	 	        			sncnsBgngYr     : item.sncnsBgngYr ,
	 	        			rdmPrgrsCd       : item.rdmPrgrsCd ,
	 	        			rdmTrgtPrncpl       : item.rdmTrgtPrncpl ,
	 	        			rdmTrgtAmt       : item.rdmTrgtAmt
	 	       		}
	 	        	jsonInjstcRdm.push(param);
	 	        });
	 	       grdInjstcRdm.refresh();

			} catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
			}
				console.error("failed", e.message);
	 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		
	}


	const fn_search = async function () {
		var frmerSn = SBUxMethod.get("srch-inp-frmerSn");
		if(frmerSn === undefined){
			
		}else{
			fn_setGnrlSttn();	
			fn_setFrln();
			fn_setEdu();
			fn_setEcfrdCert();
			fn_setFrmerRcfvHstry();
			fn_setFrlnRcfvHstry();
			fn_setInjstcRdm();
		}
		
	}

	
	

     
     const fn_choiceFrmer = function() {
 		popFrmerInfo.init(gv_selectedApcCd, gv_selectedApcNm, fn_setFrmer, SBUxMethod.get("srch-inp-frmerSn"));
 	}

 	const fn_setFrmer = function(frmer) {
 		if (!gfn_isEmpty(frmer)) {
 			SBUxMethod.set("srch-inp-frmerSn", frmer.frmerSn);
 			//SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}
 	

    
    
    
    const objMenuListEdu = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnldEdu,			//콜백함수명
	        }
	    };
    
    const objMenuListEcfrd = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnldEcfrd,			//콜백함수명
	        }
	    };
    
    const objMenuListFrmerRcfv = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnldFrmerRcfv,			//콜백함수명
	        }
	    };
    
    const objMenuListFrlnRcfv = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnldFrlnRcfv,			//콜백함수명
	        }
	    };
    
    const objMenuListLocgov = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnldLocgov,			//콜백함수명
	        }
	    };
    
    const objMenuListInjstc = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnldInjstc,			//콜백함수명
	        }
	    };
    
    // 엑셀 다운로드
	/**
     * @name fn_excelDwnld
     * @description 엑셀 다운로드
     */

    function fn_excelDwnldEdu() {
    	grdEduFnsh.exportLocalExcel("교육이수 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
    
    function fn_excelDwnldEcfrd() {
    	grdEcfrdCert.exportLocalExcel("친환경인증 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
    
    function fn_excelDwnldFrmerRcfv() {
    	grdFrmerRcfv.exportLocalExcel("농업인수혜이력 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
    
    function fn_excelDwnldFrlnRcfv() {
    	grdFrlnRcfvHstry.exportLocalExcel("농지수혜이력 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
    
    function fn_excelDwnldLocgov() {
    	grdLocgovRcfvHstry.exportLocalExcel("지자체수혜이력 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
    
    function fn_excelDwnldInjstc() {
    	grdInjstcRdm.exportLocalExcel("부정당환수금 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
    
     
 	

 	
	

     
     


</script>
</html>