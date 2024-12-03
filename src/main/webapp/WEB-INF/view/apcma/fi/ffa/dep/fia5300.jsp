
<%
/**
 * @Class Name 		: fia5300.jsp
 * @Description 	: 감가상각 조정/확정
 * @author 			:
 * @since 			: 2024.07.09
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
<title>title : 감가상각 조정/확정</title>
<%@ include file="../../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header"
				style="display: flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title">
						▶
						<c:out value='${menuNm}'></c:out>
					</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmptn" name="btnCmptn" uitype="normal"
						text="확정" class="btn btn-sm btn-outline-danger"
						onclick="fn_confirmClick('CONFIRM')"></sbux-button>
					<sbux-button id="btnCmptnRtrcn" name="btnCmptnRtrcn"
						uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger"
						onclick="fn_confirmClick('UNCONFIRM')"></sbux-button>
					<sbux-button id="btnSlipWrt" name="btnSlipWrt" uitype="normal"
						text="전표작성" class="btn btn-sm btn-outline-danger"
						onclick="fn_confirmClick('ACCOUNT')"></sbux-button>
					<sbux-button id="btnSlipRtrcn" name="btnSlipRtrcn" uitype="normal"
						text="전표취소" class="btn btn-sm btn-outline-danger"
						onclick="fn_confirmClick('CANCEL')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div class="box-search-ma">
				<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->

				<table id="searchTable" class="table table-bordered tbl_fixed table-search-ma">
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


							<th scope="row" class="th_bg_search">APC</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle "
										    	type="button"
										    	id="srch-slt-fiOrgCode"
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
							<th scope="row" class="th_bg_search">사업장</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">

									<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										    	type="button"
										    	id="srch-slt-siteCode"
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


						</tr>
						<tr>
							<th scope="row" class="th_bg_search">감가상각년월</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-depreciationYyyymm"
									name="srch-dtp-depreciationYyyymm"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
								</sbux-datepicker>
							</td>
							<td></td>

							<th scope="row" class="th_bg_search">감가상각기준</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-depreciationType" name="srch-slt-depreciationType"
									class="form-control input-sm" uitype="single"
									jsondata-ref="jsonDprcCrtr"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg_search">관리부서</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-deptCode"
										name="srch-inp-deptCode" class="form-control input-sm" group-id="dsps1"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP5"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_mngDeptPopup">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-deptName" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
								</div>
							</td>
						</tr>
						<tr>
							<th scopr="row" class="th_bg_search">자산구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-assetCategoryCode" name="srch-inp-assetCategoryCode" uitype="hidden"></sbux-input>
								<sbux-input id="srch-inp-assetCategoryName" name="srch-inp-assetCategoryName"
									class="form-control input-sm" uitype="search"
									button-back-text="···" button-back-event="fn_astSePopup"></sbux-input>
							</td>
							<td></td>
							<th scopr="row" class="th_bg_search">중분류</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-assetLevel2" name="srch-inp-assetLevel2"
									class="form-control input-sm" uitype="search"
									button-back-text="···" button-back-event="fn_assetLevel2"></sbux-input>
							</td>
							<td></td>
							<th scopr="row" class="th_bg_search">소분류</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-assetLevel3" name="srch-inp-assetLevel3"
									class="form-control input-sm" uitype="search"
									button-back-text="···" button-back-event="fn_assetLevel3"></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg_search">원가중심점</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-costCenterCode"
										name="srch-inp-costCenterCode" class="form-control input-sm" group-id="dsps1"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP6"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_costCenterPopup">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-costCenterName" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
								</div>
							</td>

						</tr>
					</tbody>
				</table>
				</div>

				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>감가상각계산</span></li>

						</ul>

					</div>


					<div id="sb-area-grdDprcRkng" style="height: 258px; width: 100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>감가상각리스트</span></li>

						</ul>

					</div>


					<div id="sb-area-grdDprcList" style="height: 258px; width: 100%"></div>

				</div>

				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>취득가액 내역</span></li>
						</ul>
					</div>
					<div id="sb-area-grdAcqsAmtList" style="height: 258px; width: 100%"></div>
				</div>



			</div>

		</div>


	</section>
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:800px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>


</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	//var gv_ma_selectedCorpCd	= '${loginVO.apcCd}';
	//var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId = '${loginVO.id}';
	//-----------------------------------------------------------

	var jsonRegionCode		= [];	// 지역

	// 신규
	function cfn_add() {

	}

	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?

		}
    }


	// 마스터 그리드 삭제
	function cfn_del() {

	}

	// 초기화
	function cfn_init() {
		SBUxMethod.refreshAll()
	}

	// 조회
	function cfn_search() {
		fn_queryClick();
	}





	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-compCode'], jsonCorp, 'L_HRA014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//사업장
			gfnma_multiSelectInit({
				target			: ['#srch-slt-siteCode']
				,compCode		: gv_ma_selectedCorpCd
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
			//사업단위
			gfnma_setComSelect(['srch-slt-fiOrgCode'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			//감가상각기준
			gfnma_setComSelect(['srch-slt-depreciationType'], jsonDprcCrtr, 'L_FIA018', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//사업장
			gfnma_setComSelect(['srch-slt-siteCode'], jsonSite, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//중분류
			gfnma_setComSelect(['srch-slt-assetLevel3'], jsonAssetLevel2, 'L_FIA005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
			//소분류
			gfnma_setComSelect(['srch-slt-assetLevel3'], jsonAssetLevel3, 'L_FIA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
			//자산구분
			gfnma_setComSelect(['srch-slt-assetCategoryName'], jsonAssetCategory, 'L_FIA001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각방법
			gfnma_setComSelect(['grdDprcList'], jsonDepreciationMethod, 'L_FIA003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각주기
			gfnma_setComSelect(['grdDprcList'], jsonDepreciationPeriod, 'L_FIA004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//코스트센터
			gfnma_setComSelect(['grdDprcList'], jsonCostCenter, 'P_COST_CENTER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),

			//회계단위
			gfnma_multiSelectInit({
				target			: ['#srch-slt-fiOrgCode']
				,compCode		: gv_ma_selectedCorpCd
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
			})
		]);

		let yyyymm = gfnma_date6().substring(0,6);
		SBUxMethod.set("srch-dtp-depreciationYyyymm",yyyymm);
		SBUxMethod.set("srch-slt-depreciationType","2")
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();
    	fn_createGrid2();
    	fn_createGrid3();

    });

    //grid 초기화
    var grdDprcList; 			// 그리드를 담기위한 객체 선언
    var jsonDprcList = []; 	// 그리드의 참조 데이터 주소 선언

    var grdDprcRkng;
    var jsonDprcRkng = [];

    var grdAcqsAmtList;
    var jsonAcqsAmtList = [];


    //json
    var jsonCorp = []; //법인
    var jsonBizUnit = []; //사업단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준
	var jsonDprcCrtr = []; // 감가상각기준
	var jsonSite = []; //사업장
	var jsonAssetCategory = []; //자산구분
	var jsonAssetLevel2 = []; //중분류
	var jsonAssetLevel3 = []; //소분류
	var jsonDepreciationMethod = [];//감가상각방법
	var jsonDepreciationPeriod = [];//감각상각주기
	var jsonCostCenter = [];//원가중심점

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDprcRkng';
	    SBGridProperties.id 				= 'grdDprcRkng';
	    SBGridProperties.jsonref 			= 'jsonDprcRkng';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{
        		caption: ["<input type='checkbox' id='allCheckbox' onchange='fn_checkAllDprcRkng(this);'>"], 			ref: 'checkYn', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
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
            {caption: ["연번"],		ref: 'seq', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업단위"], 	ref: 'fiOrgCode',    	type : 'combo', typeinfo : {ref:'jsonBizUnit', label:'label', value:'value'},disabled:true,  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],  		ref: 'siteCode',    			type : 'combo', typeinfo : {ref:'jsonSite', label:'SITE_NAME', value:'SITE_CODE'},disabled:true,  	width:'100px',  	style:'text-align:left'},
            {caption: ["확정여부"],    	ref: 'confirmFlag', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소스ID"],		ref: 'sourceId',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표ID"], 		ref: 'docName', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["데이터건수"], 		ref: 'recordCount',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["최종실행회수"], 		ref: 'lastRunCount',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["처리자"], 	ref: 'insertUserid', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처리PC"], 		ref: 'insertPc', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'description', 				type:'output',		width:'80px',		style:'text-align:center'},

        ];

        grdDprcRkng = _SBGrid.create(SBGridProperties);
        //grdDprcRkng.bind('click', 'focusedRowChanged2');
    }

    function fn_createGrid2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDprcList';
	    SBGridProperties.id 				= 'grdDprcList';
	    SBGridProperties.jsonref 			= 'jsonDprcList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: [""],			ref: 'checkYn'
        		, type : 'checkbox'
        		,typeinfo: {
					ignoreupdate : true,
					fixedcellcheckbox : {
						usemode : true,
						rowindex : 1,
						deletecaption : false
					},
					checkedvalue : 'Y',
					uncheckedvalue : 'N'
				}, width:'50px'
        		},
            {caption: ["확정"],			ref: 'confirmFlag'
        		, type : 'checkbox'
        		,typeinfo: {
					ignoreupdate : true,
					fixedcellcheckbox : {
						usemode : true,
						rowindex : 1,
						deletecaption : false
					},
					checkedvalue : 'Y',
					uncheckedvalue : 'N'
        		}, width:'50px'
        		},
            {caption: ["사업단위"],  		ref: 'fiOrgCode',    			type : 'combo', typeinfo : {ref:'jsonBizUnit', label:'label', value:'value'}, disabled:true,  	width:'100px',  	style:'text-align:left'},

            {caption: ["사업장"],      		ref: 'siteCode', 		type : 'combo', typeinfo : {ref:'jsonSite', label:'SITE_NAME', value:'SITE_CODE'}, disabled:true,  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산구분"],			ref: 'assetCategory',	type : 'combo', typeinfo : {ref:'jsonAssetCategory', label:'label', value:'value'}, disabled:true,  	width:'100px',  	style:'text-align:left'},
            {caption: ["중분류"], 			ref: 'assetLevel2', 			type : 'combo', typeinfo : {ref:'jsonAssetLevel2', label:'label', value:'value'}, disabled:true,  	width:'100px',  	style:'text-align:left'},
            {caption: ["소분류"], 			ref: 'assetLevel3',  			type : 'combo', typeinfo : {ref:'jsonAssetLevel3', label:'label', value:'value'}, disabled:true,  	width:'100px',  	style:'text-align:left'},
        	{caption: ["자산번호"], 		ref: 'assetNo', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["자산명"], 			ref: 'assetName', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["상각률(1000)"], 	ref: 'depreciationRate', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["취득월"], 			ref: 'acquireYyyymm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["내용연수"], 	ref: 'usefulLife', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["내용연수(월)"], 	ref: 'usefulLifeMm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["상각방법"], 		ref: 'depreciationMethod', 				type : 'combo', typeinfo : {ref:'jsonDepreciationMethod', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
            {caption: ["상각주기"], 		ref: 'depreciationPeriod', 				type : 'combo', typeinfo : {ref:'jsonDepreciationPeriod', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
            {caption: ["확정여부"], 		ref: 'confirmFlag', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["사업장"], 			ref: 'siteCode', 				type : 'combo', typeinfo : {ref:'jsonSite', label:'SITE_NAME', value:'SITE_CODE'},disabled:true,		width:'80px',		style:'text-align:center'},
            {caption: ["자산구분"], 		ref: 'assetCategory', 				type : 'combo', typeinfo : {ref:'jsonAssetCategory', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
            {caption: ["자산번호"], 		ref: 'assetNo', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["자산명"], 			ref: 'assetName', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["취득월"], 			ref: 'acquireYyyymm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["내용연수(월)"], 	ref: 'usefulLifeMm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["기초보조금"], 		ref: 'beginSubsidiesAmount',format : {type:'number', rule:'#,###'}, 				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["당기취득금액"], 	ref: 'inAcquisitionAmount', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["당기취득보조금"], ref: 'inSubsidiesAmount', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["처분취득가액"], 	ref: 'outAcquisitionAmount',format : {type:'number', rule:'#,###'}, 				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["처분보조금"], 		ref: 'outSubsidiesAmount', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["기말취득가액"],	ref: 'endAcquisitionAmount', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["기말보조금"], 		ref: 'endSubsidiesAmount', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["기초상각누계액"], ref: 'beginAccumDepr', 		format : {type:'number', rule:'#,###'},		type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["감가상각비"], 		ref: 'acqDeprAmt', 			format : {type:'number', rule:'#,###'},	type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["처분자산상각비"], ref: 'outAcqDepr', 			format : {type:'number', rule:'#,###'},	type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["기말상각누계액"], ref: 'endAccumDepr', 			format : {type:'number', rule:'#,###'},	type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["기초보조금상각누계액"], ref: 'beginSubsidiesAccDepr', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["보조금상각비"],   ref: 'subsidiesDeprAmt', 		format : {type:'number', rule:'#,###'},		type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["처분자산보조금상각비"], ref: 'outSubsidiesDepr', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["처분자산상각누계액"], ref: 'outAccumDepr', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["처분자산보조금상각누계액"], ref: 'outSubsidiesAccumDepr', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["기말보조금상각누계액"], ref: 'endSubsidesAccumDepr', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
            {caption: ["비고"], 			ref: 'memomemo', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["부서"], 			ref: 'deptName', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["원가중심점"], 		ref: 'costCenterCode', 				type : 'combo', typeinfo : {ref:'jsonCostCenter', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},

        ];

        grdDprcList = _SBGrid.create(SBGridProperties);
        grdDprcList.bind('click', 'focusedRowChanged');
    }

    function fn_createGrid3() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdAcqsAmtList';
	    SBGridProperties.id 				= 'grdAcqsAmtList';
	    SBGridProperties.jsonref 			= 'jsonAcqsAmtList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [

        	{caption: ['구분'], ref: 'txnGroup', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['거래유형'], ref: 'txnType', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['최초취득일'], ref: 'firstAcquireDate', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['취득월'], ref: 'acquireYyyymm', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['처분월'], ref: 'disposalYyyymm', width: '8%', type: 'output' , style:'text-align:center'},
        	{caption: ['중지월'], ref: 'holdingYyyymm', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['증가금액'], ref: 'inAmount', width: '8%', format : {type:'number', rule:'#,###'}, type: 'output', style:'text-align:right'},
        	{caption: ['감소금액'], ref: 'outAmount', width: '8%',format : {type:'number', rule:'#,###'}, type: 'output', style:'text-align:right'},
        	{caption: ['중지금액'], ref: 'holdingAmount', width: '8%', format : {type:'number', rule:'#,###'}, type: 'output', style:'text-align:right'}

        ];

        grdAcqsAmtList = _SBGrid.create(SBGridProperties);
    }

    const fn_queryClick = async function() {
    	fnQRY_P_FIA5300_Q("LIST","");
    	//감가상각 리스트 로우 없을때 초기화
    	if (jsonDprcList.length < 0){
    		grdDprcRkng.rebuild();
    		grdDprcList.rebuild();
    		grdAcqsAmtList.rebuild();
    	}
            /* btnConfirm.Enabled = false;
            btnUnconfirm.Enabled = false;
            btnApply.Enabled = false;
             btnCancel.Enabled = false;*/
   		let depreciationType = SBUxMethod.get("srch-slt-depreciationType");
        if (depreciationType === "1" || depreciationType === "2"){
            fnQRY_P_FIA5300_Q("INFO","");
        }
    	if (grdDprcRkng.getRow() >= 0){
    		focusedRowChanged2()
    	}
	}

    const fn_saveClick = function(){
        if (fnSET_P_FIA5300_S("")){
            queryClick();
        }
    }

    const fn_confirmClick = async function(workType){
    	if (grdDprcList.getRow() < 0)
            return;

        if (grdDprcRkng.getRow() < 0)
            return;


        let bresult = false;

        let intmax_seq = 0;
        let strcomp_code = "";
        let strfi_org_code = "";
        let strsite_code = "";
        let intsource_id = 0;
        let strdescription = "";
        let intprogram_seq = 1;

        let dprcRkngData  = grdDprcRkng.getGridDataAll();
        let compCode = gfnma_multiSelectGet("#srch-slt-compCode");
        dprcRkngData.forEach(row => {
        	if(row.checkYn === "Y"){
        		intmax_seq = intmax_seq + 1;
        		bresult = false;
                strcomp_code = compCode
                strfi_org_code = row.fiOrgCode;
                strsite_code = row.siteCode;
                intsource_id = row.sourceId;
                strdescription = row.description;
                bresult = fnSET_P_FIA5300_S1_TEST(workType, strcomp_code, strfi_org_code, strsite_code, intsource_id, strdescription);
                intprogram_seq = intprogram_seq + 1;
        	}
        })





        /* for (int i = 0; i < gvwInfo.RowCount; i++)
        {
            if (gvwInfo.GetValue(i, "check_yn").ToString() == "Y"){

                if (!bresult)
                    break;
            }
        } */
        if (bresult){
            fn_queryClick();
        }
    }




	//strWorkType : INFO, LOG
    const fnQRY_P_FIA5300_Q = async function(strWorkType,asstNo){
		let rowId = 0;
		if(strWorkType === "DETAIL"){
			if(grdDprcList.getRow() == -1){
				if(grdDprcList.getRows()> 0){
					rowId = 1;
				}
			}else{
				rowId = grdDprcList.getRow();
			};

		}
		 let rowData = grdDprcList.getRowData(rowId);
		 let siteCode = gfnma_multiSelectGet("#srch-slt-siteCode");
    	 var paramObj = {
      			V_P_DEBUG_MODE_YN	: ''
      			,V_P_LANG_ID		: ''
      			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
      			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
      		    ,V_P_FI_ORG_CODE    : ''
     		    ,V_P_DEPRECIATION_YYYYMM : ''
     		    ,V_P_DEPRECIATION_TYPE  : ''
     		    ,V_P_ASSET_CATEGORY   : ''
     		    ,V_P_ASSET_LEVEL2   : ''
     		    ,V_P_ASSET_LEVEL3   : ''
     		    ,V_P_SITE_CODE    : siteCode
     		    ,V_P_DEPT_CODE    : ''
     		    ,V_P_COST_CENTER_CODE  : ''
     		    ,V_P_ASSET_NO    : strWorkType == "DETAIL" ? rowData["assetNo"] : ""
      			,V_P_FORM_ID		: p_formId
      			,V_P_MENU_ID		: p_menuId
      			,V_P_PROC_ID		: ''
      			,V_P_USERID			: ''
      			,V_P_PC				: ''
      	    };

    	 let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_",["compCode1","assetLevel2","assetLevel3","deptName","costCenterCode","costCenterName","deptCode","deptName","assetCategoryName"]);
	 	 if(!postFlag){
	 	    return;
	 	 }

          const postJsonPromise = gfn_postJSON("/fi/fia/selectFia5300.do", {
           	getType				: 'json',
           	workType			:  strWorkType ,
           	cv_count			: '3',
           	params				: gfnma_objectToString(paramObj)
   			});

        	const data = await postJsonPromise;
        	console.log('data:', data);
          // 비즈니스 로직 정보
           try {
	          if (_.isEqual("S", data.resultStatus)) {
	              //gfn_comAlert("I0001");
	        	  //info, log에 따라서 그리드에 데이터 넣어주는듯
	        	   if (strWorkType === "LIST"){
	        		   var msg = convertArrayToCamelCase(data.cv_2)
              		   jsonDprcList = msg;
	        		   grdDprcList.rebuild();
	               }
	               else if (strWorkType === "DETAIL"){
	        		   var msg = convertArrayToCamelCase(data.cv_3)
              		   jsonAcqsAmtList = msg;
	        		   grdAcqsAmtList.rebuild()

	               }else if (strWorkType === "INFO"){

					   var msg = convertArrayToCamelCase(data.cv_1)
              		   jsonDprcRkng = msg;
	        		   grdDprcRkng.rebuild()
	        		   if(msg.length > 0){
	        			   //fnQRY_P_FIA5300_Q("DETAIL")
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
 	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
 	        }
    }


    const focusedRowChanged = function(){
         fnQRY_P_FIA5300_Q("DETAIL");
    }

    const focusedRowChanged2 = function(){
    	let rowData = grdDprcRkng.getRowData(grdDprcRkng.getRow());
    	let rowData2 = grdDprcList.getRowData(grdDprcList.getRow());

    	if (rowData2.confirmFlag === "Y"){  //확정시
            if (rowData.docName === ""){
            	/*  btnConfirm.Enabled = true;
                btnUnconfirm.Enabled = false;
                btnApply.Enabled = false;
                btnCancel.Enabled = false;*/
            }
            else{
            	/*  btnConfirm.Enabled = true;
                btnUnconfirm.Enabled = false;
                btnApply.Enabled = false;
                btnCancel.Enabled = false;*/
            }

        }
        else{
            /*  btnConfirm.Enabled = true;
            btnUnconfirm.Enabled = false;
            btnApply.Enabled = false;
            btnCancel.Enabled = false;*/
        }
        fnQRY_P_FIA5300_Q("DETAIL");
    }

    const fnSET_P_FIA5300_S = async function(){
    	let siteCode = gfnma_multiSelectGet("#srch-slt-siteCode");
    	let dprcData = grdDprcList.getGridDataAll();
    	dprcData.forEach(row => {
    		var paramObj = {
         			V_P_DEBUG_MODE_YN	: ''
         			,V_P_LANG_ID		: ''
         			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
         			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
         			,V_P_TXN_ID         : row.txnId //그리드에 없음 -> 안보이게 ㄲ json에만 넣으면 될듯
         		    ,V_P_DEPRECIATION_YYYYMM  : row.depreciationYyyymm //그리드에 없음
         		    ,V_P_ASSET_NO             : row.assetNo
         		    ,V_P_DEPRECIATION_TYPE     : row.depreciationType //그리드에 없음
         		    ,V_P_DEPRECIATION_METHOD : row.depreciationMethod
         		    ,V_P_DEPRECIATION_PERIOD : row.depreciationPeriod
         		    ,V_P_DEPRECIATION_RATE : row.depreciationRate
         		    ,V_P_BEGIN_ACQUISITION_AMOUNT : row.beginAcquisitionAmount //그리드에 없음
         		    ,V_P_BEGIN_SUBSIDIES_AMOUNT : row.beginSubsidiesAmount
         		    ,V_P_ACQ_DEPR_AMT : row.acqDeprAmt
         		    ,V_P_SUBSIDIES_DEPR_AMT : row.subsidiesDeprAmt
         		    ,V_P_END_ACQUISITION_AMOUNT : row.endAcquisitionAmount
         		    ,V_P_END_SUBSIDIES_AMOUNT : row.endSubsidiesAmount
         		    ,V_P_END_ACCUM_DEPR : row.endAccumDepr
         		    ,V_P_END_SUBSIDES_ACCUM_DEPR : row.endSubsidesAccumDepr
         		    ,V_P_MEMO : row.memomemo
         			,V_P_FORM_ID		: p_formId
         			,V_P_MENU_ID		: p_menuId
         			,V_P_PROC_ID		: ''
         			,V_P_USERID			: ''
         			,V_P_PC				: ''
         	    };
    	})
    	// txn_id는 감가상각리스트에서 우클릭 후 컬럼설정창에서 id  컬럼 누르면 조회된다

         const postJsonPromise = gfn_postJSON("/fi/fia/insertFia5300.do", {
          	getType				: 'json',
          	workType			:  strWorkType,
          	cv_count			: '0',
          	params				: gfnma_objectToString(paramObj)
  			});

       	const data = await postJsonPromise;
       	console.log('data:', data);
         // 비즈니스 로직 정보
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
	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }

    }
	const fnSET_P_FIA5300_S1_TEST = async function(workType, strcomp_code, strfi_org_code, strsite_code, intsource_id, strdescription){
		await fnSET_P_FIA5300_S1(workType, strcomp_code, strfi_org_code, strsite_code, intsource_id, strdescription);
	}
    const fnSET_P_FIA5300_S1 = async function(strWorkType, strcomp_code, strfi_org_code, strsite_code, intsource_id, strdescription){
    	let siteCode = gfnma_multiSelectGet("#srch-slt-siteCode");
    	let depreciationYyyymm = SBUxMethod.get("srch-dtp-depreciationYyyymm");
    	let depreciationType = SBUxMethod.get("srch-slt-depreciationType")
   		var paramObj = {
        			V_P_DEBUG_MODE_YN	: ''
        			,V_P_LANG_ID		: ''
        			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
        			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
        			,V_P_FI_ORG_CODE    : strfi_org_code
        		    ,V_P_SITE_CODE      : strsite_code
        		    ,V_P_DESCRIPTION    : strdescription
        		    ,V_P_DOC_ID         : intsource_id
        		    ,V_P_DEPRECIATION_YYYYMM : depreciationYyyymm
        		    ,V_P_DEPRECIATION_TYPE : depreciationType
        			,V_P_FORM_ID		: p_formId
        			,V_P_MENU_ID		: p_menuId
        			,V_P_PROC_ID		: ''
        			,V_P_USERID			: ''
        			,V_P_PC				: ''
        	    };
    	// txn_id는 감가상각리스트에서 우클릭 후 컬럼설정창에서 id  컬럼 누르면 조회된다
    	let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_",["compCode1","assetLevel2","assetLevel3","deptName","costCenterCode","costCenterName","deptCode","deptName","assetCategoryName"]);
	 	 if(!postFlag){
	 	    return;
	 	 }

         const postJsonPromise = gfn_postJSON("/fi/fia/insertFia5300S1.do", {
          	getType				: 'json',
          	workType			:  strWorkType,
          	cv_count			: '0',
          	params				: gfnma_objectToString(paramObj)
  			});

       	const data = await postJsonPromise;
       	console.log('data:', data);
         // 비즈니스 로직 정보
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
	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }

    }






	const fn_compopup1 = function(list) {

		var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_TXTEMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";

     	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
     	compopup1({
     		compCode				: gv_ma_selectedCorpCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_HRI001'
           	,popupType				: 'A'
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








    /**
     * 공통팝업
     * 관리부서
     */

    var fn_mngDeptPopup = function() {

    	var cdId 		= "srch-inp-deptCode";
        var nmId 		= "srch-inp-deptName";

        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
        var replaceText0 	= "_DEPT_CODE_";
        var replaceText1 	= "_DEPT_NAME_";


    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보 팝업');
    	var addParams = [searchCode|searchName|null];
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
        	,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 				"부서명"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,searchInputTypes		: ["input", 			"input"]
    		,height					: '400px'
   			,tableHeader			: ["부서코드", 	"부서명","부서장","부서장명"]
   			,tableColumnNames		: ["DEPT_CODE",	"DEPT_NAME","DEPT_LEADER","DEPT_LEADER_NAME"]
   			,tableColumnWidths		: ["120px", 	"120px","120px","120px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(cdId, 		data.DEPT_CODE);
				SBUxMethod.set(nmId,		data.DEPT_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}


    /**
     * 공통팝업
     * 코스트센터 (원가중심점)
     */
     //
    var fn_costCenterPopup= function() {

        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-costCenterCode"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-costCenterName"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '코스트센터');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코스트센터코드", 	"코스트센터명"]
   			,tableColumnNames		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-costCenterCode', 		data.COST_CENTER_CODE);
				SBUxMethod.set('srch-inp-costCenterName',		data.COST_CENTER_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}


    // P_ASSET_CATEGORY
    const fn_astSePopup = function(){
    	var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetCategoryCode"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetCategoryName"));
        var replaceText0 	= "_SUB_CODE_";
        var replaceText1 	= "_CODE_NAME_";

        var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산구분');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIA001'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["SUB_CODE", 	"CODE_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["자산구분코드", 	"자산구분명"]
   			,tableColumnNames		: ["SUB_CODE", 	"CODE_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set("srch-inp-assetCategoryCode",        data.SUB_CODE)
				SBUxMethod.set('srch-inp-assetCategoryName',		data.CODE_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }

    //P_ASSET_LEVEL2
    const fn_assetLevel2 = function(){
    	var searchCode 		= "";
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetLevel2"));
        var replaceText0 	= "_ASSET_GROUP_CODE_";
        var replaceText1 	= "_ASSET_GROUP_NAME_";
        var strWhereClause 	= "AND ASSET_GROUP_CODE LIKE '%" + replaceText0 + "%' AND ASSET_GROUP_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '중분류');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIA005'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["중분류코드", 	"중분류명"]
   			,tableColumnNames		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-assetLevel2',		data.ASSET_GROUP_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }

  	//P_ASSET_LEVEL3
    const fn_assetLevel3 = function(){
    	var searchCode 		= "";
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-assetLevel3"));
        var replaceText0 	= "_ASSET_GROUP_CODE_";
        var replaceText1 	= "_ASSET_GROUP_NAME_";
        var strWhereClause 	= "AND ASSET_GROUP_CODE LIKE '%" + replaceText0 + "%' AND ASSET_GROUP_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '소분류');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIA006'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["소분류코드", 	"소분류명"]
   			,tableColumnNames		: ["ASSET_GROUP_CODE", 	"ASSET_GROUP_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-assetLevel3',		data.ASSET_GROUP_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
    }


    /**
     * @name fn_checkAll
     * @description 자산분류리스트 전체 체크/체크해제
     * @param {checkbox} obj
     */
	const fn_checkAllDprcRkng = function(obj) {
    	const data = grdDprcRkng.getGridDataAll();
        const checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<data.length; i++ ){
        	grdDprcRkng.setCellData(i+1, 0, checkedYn, true, false);
        }
    }


     /**
      * @name fn_checkAll
      * @description 자산분류리스트 전체 체크/체크해제
      * @param {checkbox} obj
      */
 	const fn_checkAllDprcList = function(obj) {
     	const data = grdDprcList.getGridDataAll();
         const checkedYn = obj.checked ? "Y" : "N";
         for (var i=0; i<data.length; i++ ){
        	 grdDprcList.setCellData(i+1, 0, checkedYn, true, false);
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