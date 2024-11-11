
<%
/**
 * @Class Name 		: fia4400.jsp
 * @Description 	: 자산정산내역
 * @author 			:
 * @since 			: 2024.07.02
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.02   	장성주		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>title : 자산정산내역</title>
<%@ include file="../../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../../frame/inc/headerScript.jsp"%>
<%@ include file="../../../../frame/inc/headerScriptMa.jsp"%>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header"
				style="display: flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title">
						▶
						<c:out value='${menuNm}'></c:out>
					</h3>
					<!-- 자산정산내역 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDspsSlip" name="btnDspsSlip" uitype="normal"
						text="전표조회" class="btn btn-sm btn-outline-danger"
						onclick="btnDocQClick"></sbux-button>
					<sbux-button id="btnSlipCreate" name="btnSlipCreate"
						uitype="normal" text="전표생성" class="btn btn-sm btn-outline-danger"
						onclick="btnCreateClick"></sbux-button>
					<sbux-button id="btnSlipCancle" name="btnSlipCancle"
						uitype="normal" text="전표취소" class="btn btn-sm btn-outline-danger"
						onclick="btnCancelClick"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<div style="display: none">
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp"%>
				</div>
				<!--[APC] END -->


				<table id="searchTable" class="table table-bordered tbl_fixed">
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
							<th scope="row" class="th_bg">법인</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle "
										    	type="button"
										    	id="srch-slt-compCode1"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
										    </button>
										    <div class="dropdown-menu bplc" aria-labelledby="srch-slt-siteCode" style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
							</td>
							<td></td>

							<th scope="row" class="th_bg">사업단위</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle "
										    	type="button"
										    	id="srch-slt-fiOrgCode1"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
										    </button>
										    <div class="dropdown-menu bplc" aria-labelledby="srch-slt-fiOrgCode" style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">사업장</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dropdown">
									<button style="width: 160px; text-align: left"
										class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										type="button" id="srch-slt-siteCode" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<font>선택</font> <i style="padding-left: 10px"
											class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu bplc"
										aria-labelledby="srch-slt-siteCode"
										style="width: 250px; height: 150px; padding-top: 0px; overflow: auto">
									</div>
								</div>
							</td>
							<td></td>


						</tr>
						<tr>
							<th scope="row" class="th_bg">정산일자</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-startDate"
									name="srch-dtp-startDate" uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-startDate)"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-endDate" name="srch-dtp-endDate"
									uitype="popup" date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-endDate)"></sbux-datepicker>
							</td>
							<th scope="row" class="th_bg">취득구분</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="dropdown">
									<button style="width: 160px; text-align: left"
										class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										type="button" id="srch-slt-acquireType" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<font>선택</font> <i style="padding-left: 10px"
											class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu acqsSe"
										aria-labelledby="srch-slt-acquireType"
										style="width: 250px; height: 150px; padding-top: 0px; overflow: auto">
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">프로젝트</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-projectCode"
									name="srch-inp-projectCode" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-projectName"
									name="srch-inp-projectName" class="form-control input-sm"
									uitype="search" button-back-text="···"
									button-back-event="fn_bizPopup"></sbux-input>
							</td>
						</tr>
						<tr>

							<th scope="row" class="th_bg">정산번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-cipTransferNo"
									name="srch-inp-cipTransferNo" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>

							<th scope="row" class="th_bg">회계기준</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-acctRuleCode"
									name="srch-slt-acctRuleCode" class="form-control input-sm"
									uitype="single" jsondata-ref="jsonAcntgCrtr"></sbux-select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>


				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>자산정산리스트</span></li>

						</ul>
						<div style="margin-left: auto; margin-top: 5px;">
							<sbux-button id="btnClclnListAddRow" name="btnClclnListAddRow"
								uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger"
								onclick="fn_clclnListAddRow"></sbux-button>
							<sbux-button id="btnClclnListDelRow" name="btnClclnListDelRow"
								uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
								onclick="fn_clclnListDelRow"></sbux-button>
						</div>
					</div>


					<div id="sb-area-grdClclnList" style="height: 258px; width: 100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>자산정산대상</span></li>

						</ul>
						<div style="margin-left: auto; margin-top: 5px;">
							<sbux-button id="btnClclnTrgtAddRow" name="btnClclnTrgtAddRow"
								uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger"
								onclick="fn_clclnTrgtAddRow"></sbux-button>
							<sbux-button id="btnClclnTrgtDelRow" name="btnClclnTrgtDelRow"
								uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
								onclick="fn_clclnTrgtDelRow"></sbux-button>
						</div>
					</div>


					<div id="sb-area-grdClclnTrgt" style="height: 258px; width: 100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>본자산정산내역</span></li>
						</ul>
						<div style="margin-left: auto; margin-top: 5px;">
							<sbux-button id="btnClclnDsctnAddRow" name="btnClclnDsctnAddRow"
								uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger"
								onclick="fn_clclnDsctnAddRow"></sbux-button>
							<sbux-button id="btnClclnDsctnDelRow" name="btnClclnDsctnDelRow"
								uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
								onclick="fn_clclnDsctnDelRow"></sbux-button>
						</div>
					</div>


					<div id="sb-area-grdClclnDsctn" style="height: 258px; width: 100%"></div>

				</div>


			</div>

		</div>


	</section>

	<!-- 팝업 Modal -->
	<div>
		<sbux-modal style="width:800px" id="modal-compopup1"
			name="modal-compopup1" uitype="middle" header-title=""
			body-html-id="body-modal-compopup1" header-is-close-button="true"
			footer-is-close-button="false"></sbux-modal>
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
	var p_userId = '${loginVO.id}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역
	let newCipTransferNo = "";

    /** 공통 버튼 **/
    function cfn_search(){
    	fn_queryClick();
    }
    function cfn_save(){
    	fn_saveClick();
    }

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-compCode1'], jsonCorp, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//사업단위
			gfnma_setComSelect(['srch-slt-orgCode1'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			//회계기준
			gfnma_setComSelect(['srch-slt-acctRuleCode'], jsonAcntgCrtr, 'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//gfnma_setComSelect(['gvwItemGrid'], jsonBiz, 'P_COM028', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PROJECT_CODE', 'PROJECT_NAME', 'Y', ''),

			gfnma_setComSelect(['srch-slt-acquireType'], jsonAcqsSe, 'L_FIA007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

			gfnma_setComSelect(['srch-slt-siteCode'], jsonSiteCd, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
			//전표상태
			gfnma_setComSelect(['srch-slt-docStatus'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),

			//자산구분
			gfnma_setComSelect(['grdClclnDsctn'], jsonAssetCategory, 'L_FIA001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'SUB_NAME', 'Y', ''),

			//중분류
			gfnma_setComSelect(['grdClclnDsctn'], jsonAssetLevel2, 'L_FIA005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
			//소분류
			gfnma_setComSelect(['grdClclnDsctn'], jsonAssetLevel3, 'L_FIA006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
			//코스트센터
			gfnma_setComSelect(['grdClclnDsctn'], jsonCostCenter, 'P_COST_CENTER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),

			//
			gfnma_setComSelect(['grdClclnDsctn'], jsonDept, 'P_HRI001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),

			//사업장
			gfnma_multiSelectInit({
				target			: ['#srch-slt-siteCode']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SITE_CODE'
				,colLabel		: 'SITE_NAME'
				,columns		:[
		            {caption: "사업장코드",	ref: 'SITE_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			gfnma_multiSelectInit({
				target			: ['#srch-slt-acquireType']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIA007'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//법인
			gfnma_multiSelectInit({
				target			: ['#srch-slt-compCode1']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG000'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'COMP_CODE'
				,colLabel		: 'COMP_NAME'
				,columns		:[
		            {caption: "법인코드",	ref: 'COMP_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "법인명", 		ref: 'COMP_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//회계단위
			gfnma_multiSelectInit({
				target			: ['#srch-slt-fiOrgCode1']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM022'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'FI_ORG_CODE'
				,colLabel		: 'FI_ORG_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'FI_ORG_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
		]);

		SBUxMethod.set("srch-dtp-startDate", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-endDate", gfn_dateLastYmd(new Date()));

		//초기값 IFRS
		SBUxMethod.set("srch-slt-acctRuleCode","2");
		grdClclnList.rebuild();
    	grdClclnTrgt.rebuild();
    	grdClclnDsctn.rebuild();


	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_createGrid1();
    	fn_createGrid2();
    	fn_createGrid3();
    	fn_initSBSelect();
    	//fn_search();

		//재직상태
		//gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
		//	function(list){
		//		$('#SRCH_EMP_BTN').click(function(){
		//			fn_compopup1(list);
		//		});
		//	}
		//)
    });



    //grid 초기화
    var grdClclnList; 			// 그리드를 담기위한 객체 선언
    var jsonClclnList = []; 	// 그리드의 참조 데이터 주소 선언

    var grdClclnTrgt;
    var jsonClclnTrgt = [];

    var grdClclnDsctn;
    var jsonClclnDsctn = [];

    //json
    var jsonCorp = []; //법인
    var jsonBizUnit = []; //사업단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준
	var jsonBiz  = []; // 프로젝트
	var jsonAcqsSe = []; //취득구분
	var jsonSiteCd = []; // 사업장
	var jsonDocStatus = []; //전표상태
	var jsonAssetCategory = []; //자산구분
	var jsonAssetLevel2 = []; //중분류
	var jsonAssetLevel3 = []; //소분류
	var jsonCostCenter = []; //코스트센터
	var jsonDept = []; //부서

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdClclnList';
	    SBGridProperties.id 				= 'grdClclnList';
	    SBGridProperties.jsonref 			= 'jsonClclnList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
        	{
        		caption: [""], 			ref: 'chk', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
					typeinfo: {
						ignoreupdate : true,
						fixedcellcheckbox : {
							usemode : true,
							rowindex : 1,
							deletecaption : false
						},
						checkedvalue : 'Y',
						uncheckedvalue : 'N'
					}
        	},
            {caption: ["정산번호"],		ref: 'cipTransferNo', 			type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정산일자"], 	ref: 'transferDate',    	type:'datepicker', typeinfo : {oneclickedit: true},  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],  		ref: 'siteCode',    			type : 'combo', typeinfo : {ref:'jsonSiteCd', label:'label', value:'value', oneclickedit: true} ,  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득구분"],    	ref: 'acquireType', 		type:'combo',  	width:'100px', style:'text-align:left', typeinfo : {ref:'jsonAcqsSe', label:'label', value:'value'}  },
            {caption: ["회계기준"],		ref: 'acctRuleCode',	type : 'combo', typeinfo : {ref:'jsonAcntgCrtr', label:'label', value:'value', oneclickedit: true} ,  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"], 		ref: 'currencyCode', 				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"], 		ref: 'exchangeRate',  			type:'input',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["정산총액"], 	ref: 'totalTransferAmount', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'memo', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["전표명"], 		ref: 'docName', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["전표상태"], 	ref: 'docStatus', 				type : 'combo', typeinfo : {ref:'jsonDocStatus', label:'CODE_NAME', value:'SUB_CODE', oneclickedit: true},		width:'80px',		style:'text-align:center'},
            {caption: ["생성자"], 		ref: 'insertUserName', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["생성일시"], 	ref: 'insertTime', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["생성PC"], 		ref: 'insertPc', 				type:'input',		width:'80px',		style:'text-align:center'}

        ];

        grdClclnList = _SBGrid.create(SBGridProperties);
        grdClclnList.bind('click','fn_focusedRowChanged');

    }

    function fn_createGrid2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdClclnTrgt';
	    SBGridProperties.id 				= 'grdClclnTrgt';
	    SBGridProperties.jsonref 			= 'jsonClclnTrgt';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ["정산번호"],			ref: 'cipTransferNo', 			type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 			ref: 'transferSeq',    	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트코드"],  	ref: 'projectCode',     type : 'inputbutton', typeinfo : {callback: fn_bizPopupGrd},  	width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트"],      	ref: 'projectName', 		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산번호"],			ref: 'assetNo',			type:'inputbutton', typeinfo : {callback: fn_astPopup} ,	width:'100px',  	style:'text-align:left'},
            {caption: ["자산명"], 			ref: 'assetName', 				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정산금액"], 		ref: 'transferAmount',  			type:'input',  	width:'100px', format : {type:'number', rule:'#,###'}, 	style:'text-align:left'},
        	{caption: ["취득금액"], 		ref: 'assetAmount', 				type:'input',		width:'80px', format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["기정산금액"], 		ref: 'transferAmount2', 				type:'input',		width:'80px', format : {type:'number', rule:'#,###'},	style:'text-align:center'},
            {caption: ["잔액"], 			ref: 'netAmount', 				type:'input',		width:'80px',	format : {type:'number', rule:'#,###'},	style:'text-align:center'},
            {caption: ["비고"], 			ref: 'memo', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["대체수량"], 		ref: 'transferQty', 				type:'input',		width:'80px',		style:'text-align:center'}
        ];

        grdClclnTrgt = _SBGrid.create(SBGridProperties);
    }

    function fn_createGrid3() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdClclnDsctn';
	    SBGridProperties.id 				= 'grdClclnDsctn';
	    SBGridProperties.jsonref 			= 'jsonClclnDsctn';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ["정산번호"],			ref: 'cipTransferNo', 			type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 		ref: 'transferSeq',    	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산구분"],  		ref: 'assetCategory',   type:'inputbutton', typeinfo : {callback:fn_astSePopup} ,  	width:'100px',  	style:'text-align:left'},
            {caption: ["중분류"],      	ref: 'assetLevel2Name', 		type:'inputbutton', typeinfo : {callback:fn_assetLevel2},  	width:'100px',  	style:'text-align:left'},
            {caption: ["소분류"],	ref: 'assetLevel3Name',	type:'inputbutton', typeinfo : {callback:fn_assetLevel3},  	width:'100px',  	style:'text-align:left'},
            {caption: ["부서"], 			ref: 'deptName', 				type:'inputbutton',typeinfo : {callback:fn_compopupDept} , 	width:'100px',  	style:'text-align:left'},
            {caption: ["코스트센터"], 		ref: 'costCenterName',  			type:'inputbutton', typeinfo : {callback:fn_compopupCostCenter}, width:'100px',  	style:'text-align:left'},
        	{caption: ["계정명"], 		ref: 'accountName', 				type:'inputbutton', typeinfo : {callback: fn_accountPopup},		width:'80px',		style:'text-align:center'},
            {caption: ["금액"], 		ref: 'transferAmount', 				type:'input',		width:'80px', format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["프로젝트코드"], 		ref: 'projectCode', 				type:'inputbutton', typeinfo : {callback: fn_bizPopupGrd},		width:'80px',		style:'text-align:center'},
            {caption: ["프로젝트명"], 		ref: 'projectName', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["대체수량"], 		ref: 'transferQty', 				type:'input',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'memo', 				type:'input',		width:'80px',		style:'text-align:center'},

        ];

        grdClclnDsctn = _SBGrid.create(SBGridProperties);

    }

    /**
     * 처분 전표 조회
     */
    const btnDocQClick = async function() {

    	var check1 = grdClclnList.getRow();
		var docId = grdClclnList.getRowData(check1)["docId"];
		//자산정산리스트 행 선택 안되있을 때 return
    	if(check1 == -1){
    		return
    	}
		// 전표번호 0일때 return
    	if(docId == 0){
			return
    	}







		let data ={WORK_TYPE : 'VIEW', DOC_ID : docId};
		/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
		data.target = 'MA_A20_030_020_150' //FIG2210_99
		let json = JSON.stringify(data);
		/** main에 선언되어있는 fn **/
		window.parent.cfn_openTabSearch(json);

    	//fn_setDspsSlip(slipNo);
    }

    /**
     * 목록 가져오기
     */
    const fn_setDspsSlip = async function(slipNo) {

    	grdClclnList.clearStatus();
    	fn_queryClick();

    }

    const btnCreateClick = async function() {
    	var check1 = grdClclnList.getRow();
		//var slipNo = grdClclnList.getRowData(check1)["slipNo"];

		//자산정산리스트 행 선택 안되있을 때 return
    	if(check1 == -1){
    		return
    	}

        if (fnSET_P_FIA4400_S2("ACCOUNT")){
             //var strtxn_id = grdClclnList.getRowData(check1)["txnId"]; // strtxn_id 현재 행의 txn_id값
             fn_queryClick();
             //grdClclnList.setRow(check1) // GetGridRowIndex(grdList, "txn_id", strtxn_id);  //쿼리 클릭 후 그리드에서 txn_id 행을 찾아서 이동
         }
    }

    const btnCancelClick = async function(){
    	var check1 = grdClclnList.getRow();

        if (check1 < 0)
            return;

        if (fnSET_P_FIA4400_S2("CANCEL"))
        {
        	//var strtxn_id = grdClclnList.getRowData(check1)["txnId"]; // strtxn_id 현재 행의 txn_id값

            //SetMessageBox("정상적으로 취소 되었습니다.");

        	fn_queryClick();

            //gvwList.FocusedRowHandle = GetGridRowIndex(grdList, "txn_id", strtxn_id);
        }

    }

    const fn_saveClick = async function(){

    	let rowId = grdClclnList.getRow();
    	// 자산정산리스 에 행이 없을때
    	if ( rowId < 0){
    		return;
    	}


        let strwork_type = "U";

        let allData = grdClclnList.getGridDataAll();

        allData.forEach((item,index) => {
        	let status = grdClclnList.getRowStatus(index+1).toString();
        	if(status === "3"){
        		strwork_type = "N";
        	}
        })
		let test = await fnSET_P_FIA4400_S(strwork_type);
        if (test){
            //fnSET_P_FIA4400_S 마지막에 txn_id 셋팅한거 포커스 두는 로직 사용안함
        	//let strtxn_id = grdClclnList.GetValue("txn_id").ToString();

            fn_queryClick();

            //gvwList.FocusedRowHandle = GetGridRowIndex(grdList, "txn_id", strtxn_id);
        }
    }

    const fnSET_P_FIA4400_S = async function(strWorkType){
        try
        {
            // 비즈니스 로직 정보

            //DataTable dtSource = BindingData(grdList, true, false);
            let dtSource = grdClclnList.getGridDataAll();
            let dtSource1 = grdClclnTrgt.getGridDataAll();
            let dtSource2 = grdClclnDsctn.getGridDataAll();
            if (dtSource === null){
            	return false;
            }

            if (dtSource1 === null){
            	return false;
            }



            let stracct_rule_code = "";
            let strtxn_id = "";
            let strcip_transfer_no = "";
            let strsite_code = "";
            let stracquire_type = "";
            let strtransfer_date = "";
            let strproject_code = "";
            let strcurrency_code = "";
            let strexchange_rate = "";
            let strtotal_transfer_amount = "";
            let strbook_transfer_amount = "";
            let strmemo = "";
            let strinterface_flag = "";

            let book_transfer_amount = "0";
            let interface_flag = "";


            if (strWorkType == "N"){
            	dtSource.forEach((item,index) => {
					console.log(index);
                	let status = grdClclnList.getRowStatus(index+1).toString();
                	if(status === "3"){
                		if (strcip_transfer_no != ""){
                            stracct_rule_code += "|";
                            strtxn_id += "|";
                            strcip_transfer_no += "|";
                            strsite_code += "|";
                            stracquire_type += "|";
                            strtransfer_date += "|";
                            strproject_code += "|";
                            strcurrency_code += "|";
                            strexchange_rate += "|";
                            strtotal_transfer_amount += "|";
                            strbook_transfer_amount += "|";
                            strmemo += "|";
                            strinterface_flag += "|";
                        }

                        stracct_rule_code += item["acctRuleCode"];
                        strtxn_id += item["txnId"]; //없음
                        //strtxn_id += index+1;
                        strcip_transfer_no += item["cipTransferNo"];
                        strsite_code += item["siteCode"];
                        stracquire_type += item["acquireType"];
                        strtransfer_date += item["transferDate"];
                        //strproject_code += item["projectCode"]; //없음
                        strproject_code += '2336002';
                        strcurrency_code += item["currencyCode"];
                        strexchange_rate += item["exchangeRate"];
                        strtotal_transfer_amount += item["totalTransferAmount"];
                        strbook_transfer_amount += book_transfer_amount;
                        strmemo += item["memo"];
                        strinterface_flag += interface_flag;
                	}
                })


            }
            else{//다시
            	let test = grdClclnList.getRowData(grdClclnList.getRow());
            	stracct_rule_code = test["acctRuleCode"];
                strtxn_id = test["txnId"];
                //strtxn_id = index+1;
                strcip_transfer_no = test["cipTransferNo"];
                strsite_code = test["siteCode"]
                stracquire_type = test["acquireType"];
                strtransfer_date = test["transferDate"];
                strproject_code = test["projectCode"]
                //strproject_code += '2336002';
                strcurrency_code = test["currencyCode"];
                strexchange_rate = test["exchangeRate"];
                strtotal_transfer_amount = test["totalTransferAmount"];
                strbook_transfer_amount = 0;
                strmemo = test["memo"];
                strinterface_flag = "";

            }




            let strcip_transfer_no1 = "";
            let strtransfer_seq1 = "";
            let strasset_category = "";
            let strasset_level2 = "";
            let strasset_level3 = "";
            let strdept_code = "";
            let strcost_center_code = "";
            let straccount_code = "";
            let strtransfer_amount1 = "";
            let strproject_code1 = "";
            let strtransfer_qty1 = "";
            let strmemo1 = "";



			dtSource2.forEach((item,index)=>{
				if (strtransfer_seq1 != ""){
                    strcip_transfer_no1 += "|";
                    strtransfer_seq1 += "|";
                    strasset_category += "|";
                    strasset_level2 += "|";
                    strasset_level3 += "|";
                    strdept_code += "|";
                    strcost_center_code += "|";
                    straccount_code += "|";
                    strtransfer_amount1 += "|";
                    strproject_code1 += "|";
                    strtransfer_qty1 += "|";
                    strmemo1 += "|";
                }

                strcip_transfer_no1 += item["cipTransferNo"];
                strtransfer_seq1 += item["transferSeq"];
                strasset_category += item["assetCategory"];
                strasset_level2 += item["assetLevel2"];
                strasset_level3 += item["assetLevel3"];
                strdept_code += item["deptCode"];
                strcost_center_code += item["costCenterCode"];
                straccount_code += item["accountCode"];
                strtransfer_amount1 += item["transferAmount"];
                strproject_code1 += item["projectCode"];
                strtransfer_qty1 += item["transferQty"];
                strmemo1 += item["memo"];

			})


            let strcip_transfer_no2 = "";
			let strtransfer_seq2 = "";
            let strasset_no = "";
            let strtransfer_amount2 = "";
            let strbook_amt = "";
            let strmemo2 = "";
            let strproject_code2 = "";
            let strtransfer_qty  = "";

            dtSource1.forEach((item,index)=>{
            	if (strtransfer_seq2 != ""){
                    strcip_transfer_no2 += "|";
                    strtransfer_seq2 += "|";
                    strasset_no += "|";
                    strtransfer_amount2 += "|";
                    strbook_amt += "|";
                    strmemo2 += "|";
                    strproject_code2 += "|";
                    strtransfer_qty += "|";

                }

                strcip_transfer_no2 += item["cipTransferNo"];
                strtransfer_seq2 += item["transferSeq"];
                strasset_no += item["assetNo"];
                strtransfer_amount2 += item["transferAmount"];
                strbook_amt += item["bookAmt"]; //장부가액 셋팅 어떻게하는지...?
                strmemo2 += item["memo"];
                strproject_code2 += item["projectCode"];
                strtransfer_qty += item["transferQty"];
            })

          //본자산정산내역 금액  != 자산정산 대상 금액 total 값이 다를 경우
            let coltransfer_amount = dtSource1.reduce((acc, obj) => acc + (obj[key] || 0), 0); //자산정산대상
			let coltransfer_amount1 = dtSource2.reduce((acc, obj) => acc + (obj[key] || 0), 0);//본자산정산내역

            if (coltransfer_amount != coltransfer_amount1){
            	gfn_comAlert("I0001");//"금액 합계가 일치 하지 않습니다."
                return false;
            }

			let dtData = {
					V_P_DEBUG_MODE_YN : ''
						,V_P_LANG_ID : ''
						,V_P_COMP_CODE : ''
						,V_P_CLIENT_CODE : ''

						,V_P_ACCT_RULE_CODE : gfnma_nvl(stracct_rule_code)
						,V_P_TXN_ID : gfnma_nvl(strtxn_id)
						,V_P_CIP_TRANSFER_NO : gfnma_nvl(strcip_transfer_no)
						,V_P_SITE_CODE : gfnma_nvl(strsite_code)
						,V_P_ACQUIRE_TYPE : gfnma_nvl(stracquire_type)
						,V_P_TRANSFER_DATE : gfnma_nvl(strtransfer_date)
						,V_P_PROJECT_CODE : gfnma_nvl(strproject_code)
						,V_P_CURRENCY_CODE : gfnma_nvl(strcurrency_code)
						,V_P_EXCHANGE_RATE : gfnma_nvl(strexchange_rate)
						,V_P_TOTAL_TRANSFER_AMOUNT : gfnma_nvl(strtotal_transfer_amount)
						,V_P_BOOK_TRANSFER_AMOUNT : gfnma_nvl(strbook_transfer_amount)
						,V_P_MEMO : gfnma_nvl(strmemo)
						,V_P_INTERFACE_FLAG : gfnma_nvl(strinterface_flag)

						,V_P_CIP_TRANSFER_NO1 : gfnma_nvl(strcip_transfer_no1)
						,V_P_TRANSFER_SEQ1 : gfnma_nvl(strtransfer_seq1)
						,V_P_ASSET_CATEGORY : gfnma_nvl(strasset_category)
						,V_P_ASSET_LEVEL2 : gfnma_nvl(strasset_level2)
						,V_P_ASSET_LEVEL3 : gfnma_nvl(strasset_level3)
						,V_P_DEPT_CODE : gfnma_nvl(strdept_code)
						,V_P_COST_CENTER_CODE : gfnma_nvl(strcost_center_code)
						,V_P_ACCOUNT_CODE : gfnma_nvl(straccount_code)
						,V_P_TRANSFER_AMOUNT1 : gfnma_nvl(strtransfer_amount1)
						,V_P_PROJECT_CODE_D1 : gfnma_nvl(strproject_code1)
						,V_P_TRANSFER_QTY1 : gfnma_nvl(strtransfer_qty1)
						,V_P_MEMO1 : gfnma_nvl(strmemo1)

						,V_P_CIP_TRANSFER_NO2 : gfnma_nvl(strcip_transfer_no2)
						,V_P_TRANSFER_SEQ2 : gfnma_nvl(strtransfer_seq2)
						,V_P_ASSET_NO : gfnma_nvl(strasset_no)
						,V_P_TRANSFER_AMOUNT2 : gfnma_nvl(strtransfer_amount2)
						,V_P_BOOK_AMT : gfnma_nvl(strbook_amt)
						,V_P_MEMO2 : gfnma_nvl(strmemo2)
						,V_P_PROJECT_CODE_D2 : gfnma_nvl(strproject_code2)
						,V_P_TRANSFER_QTY2 : gfnma_nvl(strtransfer_qty)

						,V_P_FORM_ID : ''
						,V_P_MENU_ID : ''
						,V_P_PROC_ID : ''
						,V_P_USERID : ''
						,V_P_PC : ''
			};


			const postJsonPromise = gfn_postJSON("/fi/fia/insertFia4400S.do", {
		        getType				: 'json',
		        cv_count			: '0',
		        workType            : status,
		        params				: dtData
		    });
		    const data = await postJsonPromise;

		    if(data.resultStatus === "S"){
		        gfn_comAlert("Q0000",data.resultMessage);
		        //await fn_search();
		    }



            //ResultSet rs = CommonCallExecute(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo());

            let bResult = false;

            if (data != null && ! data.resultStatus === "P" && !data.resultStatus === "E"){
                if(strWorkType.Equals("N")){
                	//N일 경우 첫번째 그리드에 row 셋팅...?
                	//gvwList.SetValue("txn_id", rs.ReturnString);
                }
                bResult = true;
            }
            else{
                bResult = false;
            }
            return bResult;
        }
        catch (e){
        	if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            //gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            return false;
        }
    }



    const fnSET_P_FIA4400_S2 = async function(strWorkType){

            let strtxn_id = "";
            let strtxn_date = "";
            let strcip_no= "";


          	let allData = grdClclnList.getGridDataAll();
          	allData.forEach(item => {
          		if(item.chk === "Y"){
          			if (strtxn_id !== "") {
                          strtxn_id += "|";
                          strtxn_date += "|";
                          strcip_no += "|";
          			}
          			strtxn_id += item["txnId"];
                      strtxn_date += item["transferDate"];
                      strcip_no += item["cipTransferNo"];
          		}
          	})



            if (strtxn_id === ""){
            	gfn_comAlert("W0005", "선택된 전표");		//	W0005	{0}이/가 없습니다.
                return false;
            }

            var paramObj = {
        			V_P_DEBUG_MODE_YN	: ''
        			,V_P_LANG_ID		: ''
        			,V_P_COMP_CODE		: gv_ma_selectedApcCd
        			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
        			,V_P_ACCT_RULE_CODE	: "2"
        			,V_TXN_ID_D       : strtxn_id
        			,V_CIP_TRANSFER_NO_D : strcip_no
        			,V_TXN_DATE_D	    : strtxn_date
        			,V_P_FORM_ID		: p_formId
        			,V_P_MENU_ID		: p_menuId
        			,V_P_PROC_ID		: ''
        			,V_P_USERID			: ''
        			,V_P_PC				: ''
        	    };

            const postJsonPromise = gfn_postJSON("/fi/fia/insertFia4400S2.do", {
             	getType				: 'json',
             	workType			:  strWorkType,
             	cv_count			: '1',
             	params				: gfnma_objectToString(paramObj)
     			});

          	const data = await postJsonPromise;
            // 비즈니스 로직 정보
             try {
            if (_.isEqual("S", data.resultStatus)) {
                //gfn_comAlert("I0001");
                //fn_search();
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

    const fnQRY_P_FIA4400_Q = async function(strWorkType){
		// 검색조건
		/*
    	if (!ValidateControls(panHeader)){
    		return;
    	}
		*/
		let rowId = grdClclnList.getRow();
		if(rowId === -1){
			if(grdClclnList.getRows() > 0){
				rowId = 1;
			}
		}
		let rowData = grdClclnList.getRowData(rowId);


		 let acntgCrtr = SBUxMethod.get('srch-slt-acctRuleCode'); //회계기준
		 let bizUnit = gfnma_multiSelectGet('#srch-slt-orgCode1'); //(회계)사업단위
		 let clclnYmdFrom = SBUxMethod.get('srch-dtp-startDate');// 정산일자 from
		 let clclnYmdTo = SBUxMethod.get('srch-dtp-endDate'); //정산일자to
		 let bizCd = SBUxMethod.get('srch-inp-projectCode'); //프로젝트코드
		 let bizNm = SBUxMethod.get('srch-inp-projectName'); // 프로젝트명
		 let clclnNo = SBUxMethod.get('srch-inp-cipTransferNo'); //정산번호
		 let acqsSe = gfnma_multiSelectGet('#srch-slt-acquireType') //취득구분
		 let bplc = gfnma_multiSelectGet('#srch-slt-siteCode') //사업장
		  var paramObj = {
        			V_P_DEBUG_MODE_YN	: ''
        			,V_P_LANG_ID		: ''
        			,V_P_COMP_CODE		: gv_ma_selectedApcCd
        			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
        			,V_P_FI_ORG_CODE		: gfnma_nvl(bizUnit)
        			,V_P_ACCT_RULE_CODE	: gfnma_nvl(acntgCrtr)
        			,V_P_SITE_CODE		: gfnma_nvl(bplc)
        			,V_P_START_DATE		: gfnma_nvl(clclnYmdFrom)
        			,V_P_END_DATE		: gfnma_nvl(clclnYmdTo)
    			    ,V_P_CIP_TRANSFER_NO : gfnma_nvl(clclnNo)
    			    ,V_P_ACQUIRE_TYPE    : gfnma_nvl(acqsSe)
    			    ,V_P_PROJECT_CODE    : gfnma_nvl(bizCd)
    			    ,V_P_PROJECT_NAME    : gfnma_nvl(bizNm)
        			,V_P_FORM_ID		: p_formId
        			,V_P_MENU_ID		: p_menuId
        			,V_P_PROC_ID		: ''
        			,V_P_USERID			: ''
        			,V_P_PC				: ''
        	    };
		  	//grdClclnList(자산정산리스트)의 cip_transfer_no, project_code가 null 여부를 확인하여 값 할당
		    //paramObj.V_P_CIP_TRANSFER_NO = ;
		    //paramObj.V_P_PROJECT_CODE = ;
		    let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_",["projectCode","projectName","cipTransferNo"]);
		    paramObj["V_P_ACQUIRE_TYPE"] = acqsSe;
		    paramObj["V_P_SITE_CODE"] = bplc;
		    if(strWorkType === "DETAIL"){
		    	paramObj["V_P_CIP_TRANSFER_NO"] = rowData.cipTransferNo;
		    }

		  	const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4400Q.do", {
             	getType				: 'json',
             	workType			:  strWorkType,
             	cv_count			: '5',
             	params				: gfnma_objectToString(paramObj)
     			});

          	const data = await postJsonPromise;

            // 비즈니스 로직 정보
            try {

            if (_.isEqual("S", data.resultStatus)) {
            	if(strWorkType === "Q"){
            		jsonClclnList.length = 0;
                	jsonClclnTrgt.length = 0;
                	jsonClclnDsctn.length = 0;
            		var msg = convertArrayToCamelCase(data.cv_2)
     			    jsonClclnList = msg;
            		grdClclnList.rebuild();


            	}else if(strWorkType === "DETAIL"){
            		var msg = convertArrayToCamelCase(data.cv_4)
            		var msg2 = convertArrayToCamelCase(data.cv_3)
            		jsonClclnTrgt = msg
            		jsonClclnDsctn = msg2
            		grdClclnTrgt.rebuild();
            		grdClclnDsctn.rebuild();

            	}else if(strWorkType === "PROJECT"){
            		var msg = convertArrayToCamelCase(data.cv_5)
     			    jsonClclnDsctn = msg
            		grdClclnDsctn.rebuild();

            	}else if(strWorkType === "NUM"){
            		newCipTransferNo = data.cv_1["CIP_TRANSFER_NO"];

            	}
                //fn_search();
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
		    /*
            if(strWorkType.Equals("Q"))
			    CommonProcessQuery(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo(), grdList);
            else if (strWorkType.Equals("DETAIL"))
                CommonProcessQuery(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo(), grdItem,grdDetail);
            else if (strWorkType.Equals("PROJECT"))
                CommonProcessQuery(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo(), grdDetail);
            else if (strWorkType.Equals("NUM"))
            {
                ResultSet rs = CommonCallQuery(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo());
                //MessageBox.Show("rs.ResultString ===> " + rs.ResultDataSet.Tables[0].Rows[0]["cip_transfer_no"].ToString());

                newCipTransferNo = rs.ResultDataSet.Tables[0].Rows[0]["cip_transfer_no"].ToString();
            }
		    */

	}


    const fn_queryClick = async function(){
    	var iBeforeFocus = grdClclnList.getRow();

         await fnQRY_P_FIA4400_Q("Q"); //자산정산내역 조회

         //if (iBeforeFocus == 0 && grdClclnList.getRow() == -1)
         fn_focusedRowChanged();

         if (grdClclnList.getRow() == -1){
        	//fn_newClick();
         }

    }
    //grdItem(본자산정산내역), grdDetail(자산정산대상) 초기화 하기
    const fn_newClick = function(){
    	grdClclnTrgt.refresh();
    	grdClclnDsctn.refresh();
    }

    const fn_focusedRowChanged = async function(){
    	/* for(var i = 0; i < grdClclnList.getRows(); i++)
        {
            if (grdClclnList.getRowStatus(i) == 1)
                return;
        } */

        await fnQRY_P_FIA4400_Q("DETAIL");
        let colId = grdClclnList.getColOfID('chk');
        if (grdClclnList.getRowStatus(grdClclnList.getRow()) == 1 ) // 포커스 되어있는 행의 로우 상태가 추가 상태이면
        {

        	grdClclnList.setColDisabled(colId,false); // 그리드 edit true
            SBUxMethod.attr('btnClclnListAddRow', 'disabled', 'false') // 추가버튼
            SBUxMethod.attr('btnClclnListDelRow', 'disabled', 'false') //삭제버튼

            SBUxMethod.attr('btnDspsSlip', 'disabled', 'true') //처분전표조회
            SBUxMethod.attr('btnSlipCreate', 'disabled', 'true') //전표생성
            SBUxMethod.attr('btnSlipCancle', 'disabled', 'true')//전표취소
        }
        else if (grdClclnList.getRowStatus(grdClclnList.getRow()) == 2 ) // 포커스 되어있는 행의 로우 상태가 수정 상태이면
        {
            grdClclnList.setColDisabled(colId,true); // 그리드 edit true
            SBUxMethod.attr('btnClclnListAddRow', 'disabled', 'true') // 추가버튼
            SBUxMethod.attr('btnClclnListDelRow', 'disabled', 'true') //삭제버튼

            if (grdClclnList.getRowData(grdClclnList.getRow())["docId"] === 0){
                SBUxMethod.attr('btnDspsSlip', 'disabled', 'true') //처분전표조회
                SBUxMethod.attr('btnSlipCreate', 'disabled', 'false') //전표생성
                SBUxMethod.attr('btnSlipCancle', 'disabled', 'true')//전표취소
            }
            else{
                SBUxMethod.attr('btnDspsSlip', 'disabled', 'false') //처분전표조회 disable true
                SBUxMethod.attr('btnSlipCreate', 'disabled', 'true') //전표생성 disable true
                SBUxMethod.attr('btnSlipCancle', 'disabled', 'false')//전표취소 disable true
            }

        }
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


    const fn_bizPopupGrd = function(){
    	let lastFocusGrid = _SBGrid.getLastFocusGrid();
		if(lastFocusGrid ==="grdClclnTrgt"){
			fn_bizPopup("grdClclnTrgt");
		}else if(lastFocusGrid ==="grdClclnDsctn"){
			fn_bizPopup("grdClclnDsctn");
		}


    }

    var fn_bizPopup = function(chk) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
        SBUxMethod.openModal('modal-compopup1');
		//let projectCode = gfnma_nvl(SBUxMethod.get("srch-inp-projectCode"));
		let fiOrgCode = gfnma_multiSelectGet('#srch-slt-orgCode1');//사업단위
        var strWhereClause 	= "AND FI_ORG_CODE = '" + fiOrgCode + "'" ;

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM028'
            ,popupType				: 'A'
            ,whereClause			: ""
            ,searchCaptions			: ["프로젝트코드",		"프로젝트명"]
            ,searchInputFields		: ["PROJECT_CODE",	"PROJECT_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["프로젝트코드", "프로젝트명"]
            ,tableColumnNames		: ["PROJECT_CODE", "PROJECT_NAME"]
            ,tableColumnWidths		: ["150px", "250px"]
            ,itemSelectEvent		: function (data){
            	if(chk === "grdClclnTrgt"){
            		var rowIdx = grdClclnTrgt.getRow();
            		var rowData = grdClclnTrgt.getRowData(rowIdx);
            		rowData["projectCode"] = data.PROJECT_CODE;
            		rowData["projectName"] = data.PROJECT_NAME;
            		grdClclnTrgt.setRowData(rowIdx,rowData,true);
            	}else if(chk === "grdClclnDsctn"){
            		var rowIdx = grdClclnDsctn.getRow();
            		var rowData = grdClclnDsctn.getRowData(rowIdx);
            		rowData["projectCode"] = data.PROJECT_CODE;
            		rowData["projectName"] = data.PROJECT_NAME;
            		grdClclnDsctn.setRowData(rowIdx,rowData,true);

            	}else{
            		SBUxMethod.set("srch-inp-projectCode", 		data.PROJECT_CODE);
    				SBUxMethod.set("srch-inp-projectName",		data.PROJECT_NAME);
            	}

            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }

  //P_ASSET_LEVEL2
    const fn_assetLevel2 = function(){
    	var searchCode 		= "";
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetLevel2"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '중분류');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIA005'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["중분류코드", 	"중분류명"]
   			,tableColumnNames		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){

				var rowIdx = grdClclnDsctn.getRow();
        		var rowData = grdClclnDsctn.getRowData(rowIdx);
        		rowData["assetLevel2"] = data.ASSET_GROUP_CODE;
        		rowData["assetLevel2Name"] = data.ASSET_GROUP_NAME;
        		grdClclnDsctn.setRowData(rowIdx,rowData,true);

			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }

  	//P_ASSET_LEVEL3
    const fn_assetLevel3 = function(){
    	var searchCode 		= "";
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetLevel3"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '소분류');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIA006'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["소분류코드", 	"소분류명"]
   			,tableColumnNames		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				var rowIdx = grdClclnDsctn.getRow();
        		var rowData = grdClclnDsctn.getRowData(rowIdx);
        		rowData["assetLevel3"] = data.ASSET_GROUP_CODE;
        		rowData["assetLevel3Name"] = data.ASSET_GROUP_NAME;
        		grdClclnDsctn.setRowData(rowIdx,rowData,true);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }
    // P_ASSET_CATEGORY
    const fn_astSePopup = function(){
    	var searchCode 		= "";
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetCategoryName"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산구분');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIA001'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["SUB_CODE", 	"CODE_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["자산구분코드", 	"자산구분명"]
   			,tableColumnNames		: ["SUB_CODE", 	"CODE_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				var rowIdx = grdClclnDsctn.getRow();
        		var rowData = grdClclnDsctn.getRowData(rowIdx);
        		rowData["assetCategory"] = data.CODE_NAME;
        		rowData["assetCategoryCode"] = data.SUB_CODE;
        		grdClclnDsctn.setRowData(rowIdx,rowData,true);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }

    /**
     * 공통팝업
     * 자산
     */
     //
    var fn_astPopup= function() {
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산정보');

        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LIST'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["번호", 				"명칭"]
   			,searchInputFields		: ["ASSET_NO", 	"ASSET_NAME"]
   			,searchInputValues		: ["", 			""]
    		,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
        	,searchInputTypeValues	: ["", 			""]				//select 경우
    		,height					: '400px'
   			,tableHeader			: ["자산번호", 	"자산명"]
   			,tableColumnNames		: ["ASSET_NO",	"ASSET_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				var rowIdx = grdClclnTrgt.getRow();
        		var rowData = grdClclnTrgt.getRowData(rowIdx);
        		rowData["assetNo"] = data.ASSET_NO;
        		rowData["assetName"] = data.ASSET_NAME;
        		grdClclnTrgt.setRowData(rowIdx,rowData,true);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}

    /**
     * 공통팝업
     * 부서
     */
    var fn_compopupDept = function() {

        var searchText1 	= gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("DEPT_NAME"));
        var searchText3 	= gfnma_date4();

    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
        SBUxMethod.openModal('modal-compopup1');

    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
       		,popupType				: 'B'
    		,whereClause			: ''
       		,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: [searchText1, 	searchText2,	searchText3]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["DEPT_CODE", 	"DEPT_NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				var rowIdx = grdClclnDsctn.getRow();
        		var rowData = grdClclnDsctn.getRowData(rowIdx);
        		rowData["deptCode"] = data.DEPT_CODE;
        		rowData["deptName"] = data.DEPT_NAME;
        		grdClclnDsctn.setRowData(rowIdx,rowData,true);
			},
    	});
  	}

    var fn_accountPopup = function() {
        SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        var addParams = ['NULL'];
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIM045'
            ,popupType				: 'B'
            ,whereClause			: addParams
            ,searchCaptions			: ["코드", 		"코드명"]
            ,searchInputFields		: ["V_P_ACCOUNT_CODE", 	"V_P_ACCOUNT_NAME"]
            ,searchInputValues		: ["", 				searchText]
            ,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
            ,height					: '400px'
            ,tableHeader			: ["계정코드",		"계정명", 		"계정명(한글)"]
            ,tableColumnNames		: ["ACCOUNT_CODE",	"ACCOUNT_NAME", 	"ACCOUNT_NAME_CHN"]
            ,tableColumnWidths		: ["100px", 		"100px", 		"200px"]
            ,itemSelectEvent		: function (data){
            	var rowIdx = grdClclnDsctn.getRow();
        		var rowData = grdClclnDsctn.getRowData(rowIdx);
        		rowData["accountCode"] = data.ACCOUNT_CODE;
        		rowData["accountName"] = data.ACCOUNT_NAME;
        		grdClclnDsctn.setRowData(rowIdx,rowData,true);
            },
        });
    }

    /**
     * 공통팝업
     * 대체거래처
     */
    var fn_compopupCostCenter = function() {

        var searchText1 	= gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '코스트센터 정보');
    	SBUxMethod.openModal('modal-compopup1');

    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: ["", 		""]
    		,width					: '600px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["80px", 			 "80px"]
			,itemSelectEvent		: function (data){
				var rowIdx = grdClclnDsctn.getRow();
        		var rowData = grdClclnDsctn.getRowData(rowIdx);
        		rowData["costCenterCode"] = data.COST_CENTER_CODE;
        		rowData["costCenterName"] = data.COST_CENTER_NAME;
        		grdClclnDsctn.setRowData(rowIdx,rowData,true);
			},
    	});
  	}



    const fn_clclnListAddRow = async function(){

    	await fnQRY_P_FIA4400_Q("NUM");
    	let clclnNo = SBUxMethod.get('srch-inp-cipTransferNo'); //정산번호
    	let bplc = gfnma_multiSelectGet('#srch-slt-siteCode') //사업장
    	let acqsSe = gfnma_multiSelectGet('#srch-slt-acquireType') //취득구분
    	let bizUnit = SBUxMethod.get('srch-slt-orgCode1'); //(회계)사업단위


    	let obj = {
    		cipTransferNo : newCipTransferNo
    		, clclnNo : clclnNo
    		, siteCode : bplc
    		, transferDate : gfnma_date6()
    		, currencyCode : ''//세션에 있는 정보가 있는듯
    		, exchangeRate	   : 1
    		, docState : "0"//, 문서상태 : 0
    		, acquireType : "CIP"
    	}
		if(bizUnit !== ""){
    		obj["bizUnit"] = bizUnit;
    	}
    	grdClclnList.addRow(true, obj);


    }

    const fn_clclnTrgtAddRow = function(){
    	grdClclnTrgt.addRow();
    }

    const fn_clclnDsctnAddRow = function(){
    	grdClclnDsctn.addRow();
    }

    const fn_clclnListDelRow = function(){
    	// row상태를 확인한 뒤 추가된 행인 경우 바로 삭제하고 아닌 경우는 DeleteClick
    	let rowStatus = grdClclnList.getRowStatus(grdClclnList.getRow())
    	if(rowStatus === "3"){
    		grdClclnList.deleteRow(grdClclnList.getRows()-1)
    	}else{
    		deleteClick();
    	}

    }

    const fn_clclnTrgtDelRow = function(){
   		grdClclnTrgt.deleteRow(grdClclnTrgt.getRows()-1)
    }

    const fn_clclnDsctnDelRow = function(){
    	grdClclnDsctn.deleteRow(grdClclnDsctn.getRows()-1);
    }

    const deleteClick = function(){
        if (grdClclnList.getRow() < 0){
        	return;
        }

        let rowStauts = grdClclnList.getRowStatus(grdClclnList.getRow())

        if (rowStauts === "3"){
        	grdClclnList.deleteRow(grdClclnList.getRows()-1)
        }else{
            //DialogResult dial = SetYesNoMessageBox("해당 건을 삭제 하시겠습니까?");
			//confirm 확인 후 Y일 경우
            if(gfn_comConfirm("Q0001", "삭제")){
                if (fnSET_P_FIA4400_S("D")){
                	fn_queryClick();
                }
            }

        }
	}

    /** camelCase FN **/
    function toCamelCase(snakeStr) {
        return snakeStr.toLowerCase().replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
    }

    function convertArrayToCamelCase(array) {
        return array.map(obj => {
            return Object.keys(obj).reduce((acc, key) => {
                const camelKey = toCamelCase(key);
                acc[camelKey] = obj[key];
                return acc;
            }, {});
        });
    }




</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp"%>
</html>