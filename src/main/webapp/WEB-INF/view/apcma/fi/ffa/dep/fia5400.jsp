<%
/**
 * @Class Name 		: fia5400.jsp
 * @Description 	: 감가상각 내역
 * @author 			:
 * @since 			: 2024.06.28
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.28   	장성주		최초 생성
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
	<title>title : 감가상각 내역 </title>
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
                    </h3><!-- 감가상각 내역  -->
                </div>

            </div>
            <div class="box-body">
            	<div class="box-search-ma">
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<div>
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				</div>
				<!--[APC] END -->

                <table id="searchTable" class=""table table-bordered tbl_fixed table-search-ma"">
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
                            <th scope="row" class="th_bg">법인</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
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

                            <th scope="row" class="th_bg">회계단위</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
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
                            <th scope="row" class="th_bg">사업장</th>
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
                            <th scope="row" class="th_bg">기간</th>
							<td  class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-periodFr"
									name="srch-dtp-periodFr"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-periodFr)"
								></sbux-datepicker>
							</td>
							<td>-</td>
							<td  class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-periodTo"
									name="srch-dtp-periodTo"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-periodTo)"
								></sbux-datepicker>
							</td>
							<td></td>
                            <th scope="row" class="th_bg">감가상각기준</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-depreciationType" name="srch-slt-depreciationType" class="form-control input-sm" uitype="single" jsondata-ref="jsonDprcCrtr"></sbux-select>
                            </td>

                        </tr>

                    </tbody>
                </table>
                </div>
			</div>


				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
				</sbux-tabs>

				<div class="tab-content">
					<div id="totDprcPivotTab" >
						<div id="sb-area-grdTotDprc" style="height:500px;width:100%"></div>
					</div>
					<div id="totDtlDprcTab" >
						<div id="sb-area-grdTotDtlDprc" style="height:500px;width:100%"></div>
					</div>
					<div id="mmDprcTab" >
						<div id="sb-area-grdMmDprc" style="height:500px;width:100%"></div>
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





	var editType			= "N";

	var jsonRegionCode		= [];	// 지역

	//var gv_ma_selectedCorpCd	= '${loginVO.apcCd}';
    //var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
 // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------
	var saveButton = true;

	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "총괄 감가상각비 피벗", "targetid" : "totDprcPivotTab", "targetvalue" : "총괄 감가상각비 피벗" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "총괄 명세 감가상각비 내역", "targetid" : "totDtlDprcTab", "targetvalue" : "총괄 명세 감가상각비 내역" },
		{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "월별 감가상각비 내역", "targetid" : "mmDprcTab", "targetvalue" : "월별 감가상각비 내역" }
	];



	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//gfnma_setComSelect(['srch-slt-compCode1'], jsonCorp, 'L_HRA014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//회계단위
			gfnma_setComSelect(['srch-slt-fiOrgCode'], jsonAcntgUnit, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
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
			//감가상각기준
			gfnma_setComSelect(['srch-slt-depreciationType'], jsonDprcCrtr, 'L_FIA018', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//중분류
			gfnma_setComSelect(['grdTotDtlDprc'], jsonAssetLevel2, 'L_FIA005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
			//소분류
			gfnma_setComSelect(['grdTotDtlDprc'], jsonAssetLevel3, 'L_FIA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
			//사업단위
			gfnma_setComSelect(['grdTotDtlDprc'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			//사업장
			gfnma_setComSelect(['grdTotDtlDprc'], jsonSiteCd, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
			//감가상각방법
			gfnma_setComSelect(['grdTotDtlDprc'], jsonDepreciationMethod, 'L_FIA003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

			//코스트센터
			gfnma_setComSelect(['grdTotDtlDprc'], jsonCostCenter, 'P_COST_CENTER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
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
			}),
			//법인
			gfnma_multiSelectInit({
				target			: ['#srch-slt-compCode1']
				,compCode		: gv_ma_selectedCorpCd
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
			})

		]);
		SBUxMethod.set("srch-dtp-ymdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-ymdTo", gfn_dateLastYmd(new Date()));

		fn_createGrid1();
    	fn_createGrid2();
    	fn_createGrid3();


    	let yyyymm = gfnma_date6().substring(0,6);
    	let yyyy = yyyymm.substring(0,4);
    	//let mm = yyyymm.substring(4,6);
    	SBUxMethod.set("srch-dtp-periodFr",yyyy + "01");
    	SBUxMethod.set("srch-dtp-periodTo",yyyymm);
    	//초기값 IFRS
		SBUxMethod.set("srch-slt-depreciationType","2")

	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();

    });

    //grid 초기화
    //총괄감가상각피벗
    var grdTotDprc;
    var jsonTotDprc = [];
    //총괄명세감가상각내역
    var grdTotDtlDprc;
    var jsonTotDtlDprc = [];
    //월별감가상각비내역
    var grdMmDprc;
    var jsonMmDprc = [];

    //json
    var jsonCorp = []; //법인
	var jsonAcntgUnit = []; //회계단위
	var jsonBplc = []; // 사업장
	var jsonAcntgCrtr = []; // 회계기준
	var jsonDprcCrtr = []; //감가상각기준
	var jsonSiteCd = []; //사업장
	var jsonBizUnit = []; //사업단위
	var jsonAssetLevel2 = [];//중분류
	var jsonAssetLevel3 = [];//소분류
	var jsonDepreciationMethod = [];//감가상각방법
	var jsonCostCenter = [];//코스트센터

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTotDprc';
	    SBGridProperties.id 				= 'grdTotDprc';
	    SBGridProperties.jsonref 			= 'jsonTotDprc';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: ['자산구분'], ref: 'ASSET_CATEGORY', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['감소금액'], ref: 'OUT_ACQUISITION_AMOUNT', format : {type:'number', rule:'#,###'}, width: '8%', type: 'output', style:'text-align:right'},
        	{caption: ['상각구분'], ref: 'DEPRECIATION_TYPE', width: '8%', type : 'combo', typeinfo : {ref:'jsonDprcCrtr', label:'label', value:'value'},disabled:true, style:'text-align:center'},
        	{caption: ['내용연수'], ref: 'USEFUL_LIFE', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['사업장'], ref: 'SITE_CODE', width: '8%', type : 'combo', typeinfo : {ref:'jsonSiteCd', label:'label', value:'value'},disabled:true, style:'text-align:center'},
        	{caption: ['상각구분'], ref: 'DEPRECIATION_YYYYMM', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['자산계정'], ref: 'ASSET_ACCOUNT', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['자산수량'], ref: 'ASSET_QTY', format : {type:'number', rule:'#,###'}, width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['회계단위'], ref: 'FI_ORG_CODE', width: '8%', type : 'combo', typeinfo : {ref:'jsonAcntgUnit', label:'label', value:'value'},disabled:true, style:'text-align:center'},
        	{caption: ['기초취득가액'], ref: 'BEGIN_ACQUISITION_AMOUNT', format : {type:'number', rule:'#,###'}, width: '8%', type: 'output', style:'text-align:right'},
        	{caption: ['당기취득금액'], ref: 'IN_ACQUISITION_AMOUNT', format : {type:'number', rule:'#,###'}, width: '8%', type: 'output', style:'text-align:right'},
        	{caption: ['구분'], ref: 'GUBUN', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['기말취득가액'], ref: 'END_ACQUISITION_AMOUNT', format : {type:'number', rule:'#,###'}, width: '8%', type: 'output', style:'text-align:right'},


        ];

        grdTotDprc = _SBGrid.create(SBGridProperties);
        //기간별 취득금액, 감가상각비, 순장부가액 (수량,기초금액,증가금액,감소금액기말금액)
        // 상각구분, 자산구분, 내용연수, 계정에 따라 정렬

    }

    function fn_createGrid2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTotDtlDprc';
	    SBGridProperties.id 				= 'grdTotDtlDprc';
	    SBGridProperties.jsonref 			= 'jsonTotDtlDprc';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: ['자산번호'], ref: 'ASSET_NO', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['자산명'], ref: 'ASSET_NAME', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['사업단위'], ref: 'FI_ORG_CODE', 				type : 'combo', typeinfo : {ref:'jsonBizUnit', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center' },
        	{caption: ['사업장'], ref: 'SITE_CODE', 				type : 'combo', typeinfo : {ref:'jsonSiteCd', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
        	{caption: ['상각구분'], ref: 'DEPRECIATION_TYPE', 				type : 'combo', typeinfo : {ref:'jsonDprcCrtr', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
        	{caption: ['중분류'], ref: 'ASSET_LEVEL2', 				type : 'combo', typeinfo : {ref:'jsonAssetLevel2', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
        	{caption: ['소분류'], ref: 'ASSET_LEVEL3', 				type : 'combo', typeinfo : {ref:'jsonAssetLevel3', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
        	{caption: ['자산계정'], ref: 'ASSET_ACCOUNT', 				type : 'output', 		width:'80px',		style:'text-align:center'},
        	{caption: ['감가상각방법'], ref: 'DEPRECIATION_METHOD', 				type : 'combo', typeinfo : {ref:'jsonDepreciationMethod', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
        	{caption: ['내용연수'], ref: 'DEPRECIATION_PERIOD', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['부서코드'], ref: 'DEPT_CODE', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['부서명'], ref: 'DEPT_NAME', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['원가중심점'], ref: 'COST_CENTER_CODE', 				type : 'combo', typeinfo : {ref:'jsonCostCenter', label:'label', value:'value'},disabled:true,		width:'80px',		style:'text-align:center'},
        	{caption: ['취득일'], ref: 'ACQUIRE_DATE', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['최초취득가액'], ref: 'ORIGINAL_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기초취득가액'], ref: 'BEGIN_ACQUISTION_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기초보조금상각누계액'], ref: 'BEGIN_SUBSIDIES_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['당기취득금액'], ref: 'IN_ACQUISITION_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['당기취득보조금'], ref: 'IN_SUBSIDIES_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['처분유형'], ref: 'DISPOSAL_TYPE', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['처분일'], ref: 'DISPOSAL_DATE', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['처분금액'], ref: 'OUT_ACQUISITION_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['처분보조금'], ref: 'OUT_SUBSIDIES_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기말취득가액'], ref: 'END_ACQUISITION_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기말보조금'], ref: 'END_SUBSIDIES_AMOUNT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기초보조금상각누계액'], ref: 'BEGIN_SUBSIDIES_ACC_DEPR', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기초장부가액'], ref: 'BEGIN_NET_BALANCE', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['수량'], ref: 'ASSET_QTY', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['01월상각비'], ref: 'ACQ_DEPR_AMT_01', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['02월상각비'], ref: 'ACQ_DEPR_AMT_02', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['03월상각비'], ref: 'ACQ_DEPR_AMT_03', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['04월상각비'], ref: 'ACQ_DEPR_AMT_04', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['05월상각비'], ref: 'ACQ_DEPR_AMT_05', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['06월상각비'], ref: 'ACQ_DEPR_AMT_06', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['07월상각비'], ref: 'ACQ_DEPR_AMT_07', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['08월상각비'], ref: 'ACQ_DEPR_AMT_08', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['09월상각비'], ref: 'ACQ_DEPR_AMT_09', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['10월상각비'], ref: 'ACQ_DEPR_AMT_10', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['11월상각비'], ref: 'ACQ_DEPR_AMT_11', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['12월상각비'], ref: 'ACQ_DEPR_AMT_12', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['감가상각비'], ref: 'ACQ_DEPR_AMT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['보조금상각비'], ref: 'SUBSIDIES_DEPR_AMT', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['감가상각누계액'], ref: 'OUT_ACCUM_DEPR', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['국고보조금상각누계액'], ref: 'OUT_SUBSIDIES_ACCUM_DEPR', 				type:'output',format : {type:'number', rule:'#,###'}	,	width:'80px',		style:'text-align:right'},
        	{caption: ['기말상각누계액'], ref: 'END_ACCUM_DEPR', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기말보조금상각누계액'], ref: 'END_SUBSIDES_ACCUM_DEPR', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'},
        	{caption: ['기말장부가액'], ref: 'END_NET_BALANCE', 				type:'output', format : {type:'number', rule:'#,###'},		width:'80px',		style:'text-align:right'}


        ];

        grdTotDtlDprc = _SBGrid.create(SBGridProperties);

    }

    function fn_createGrid3() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdMmDprc';
	    SBGridProperties.id 				= 'grdMmDprc';
	    SBGridProperties.jsonref 			= 'jsonMmDprc';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: ['감가상각비'], ref: 'ACQ_DEPR_AMT', width: '8%', type: 'output', format : {type:'number', rule:'#,###'}, style:'text-align:right'},
        	{caption: ['자산계정'], ref: 'ASSET_ACCOUNT', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['자산구분'], ref: 'ASSET_CATEGORY', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['중분류'], ref: 'ASSET_LEVEL2', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['소분류'], ref: 'ASSET_LEVEL3', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['자산명'], ref: 'ASSET_NAME', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['자산번호'], ref: 'ASSET_NO', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['자산수량'], ref: 'ASSET_QTY', width: '8%', type: 'output', format : {type:'number', rule:'#,###'}, style:'text-align:center'},
        	{caption: ['상각구분'], ref: 'DEPRECIATION_TYPE', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['상각구분연월'], ref: 'DEPRECIATION_YYYYMM', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['회계단위'], ref: 'FI_ORG_CODE', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['사업장'], ref: 'SITE_CODE', width: '8%', type: 'output', style:'text-align:center'},
        	{caption: ['보조금상각비'], ref: 'SUBSIDIES_DEPR_AMT', width: '8%', type: 'output', format : {type:'number', rule:'#,###'}, style:'text-align:right'}

        ];

        grdMmDprc = _SBGrid.create(SBGridProperties);

    }




    // fnQRY_P_FIA5400_Q

    const fn_fia5400Q = async function(workType){


    	 let siteCode = gfnma_multiSelectGet('#srch-slt-siteCode') //사업장

		var paramObj = {
			    V_P_DEBUG_MODE_YN : ''
			    ,V_P_LANG_ID : ''
			    ,V_P_COMP_CODE  : gv_ma_selectedCorpCd
			    ,V_P_CLIENT_CODE : gv_ma_selectedClntCd
		  	    ,V_P_FI_ORG_CODE : ''
		  	    ,V_P_SITE_CODE   : siteCode
		  	    ,V_P_PERIOD_FR   : ''
		  	    ,V_P_PERIOD_TO   : ''
		  	    ,V_P_DEPRECIATION_TYPE : ''
			    ,V_P_FORM_ID   : p_formId
			    ,V_P_MENU_ID   : p_menuId
			    ,V_P_PROC_ID   : ''
			    ,V_P_USERID     : ''
			    ,V_P_PC           : ''
		    };

		let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_","");
		if(!postFlag){
	        return;
	    }
        const postJsonPromise = gfn_postJSON("/fi/fia/selectFia5400Q.do", {
        	getType				: 'json',
        	workType			: workType,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  				jsonTotDprc.length = 0;

  	        		var msg;
  	        		if(workType === "Q0"){
  	        			data.cv_1.forEach((item, index) => {
	  	        			msg = {
  	  							ASSET_CATEGORY : item.ASSET_CATEGORY
  	  							, OUT_ACQUISITION_AMOUNT : item.OUT_ACQUISITION_AMOUNT
  	  							, DEPRECIATION_TYPE : item.DEPRECIATION_TYPE
  	  							, USEFUL_LIFE : item.USEFUL_LIFE
  	  							, SITE_CODE : item.SITE_CODE
  	  							, DEPRECIATION_YYYYMM : item.DEPRECIATION_YYYYMM
  	  							, ASSET_ACCOUNT : item.ASSET_ACCOUNT
  	  							, ASSET_QTY : item.ASSET_QTY
  	  							, FI_ORG_CODE : item.FI_ORG_CODE
  	  							, BEGIN_ACQUISITION_AMOUNT : item.BEGIN_ACQUISITION_AMOUNT
  	  							, IN_ACQUISITION_AMOUNT : item.IN_ACQUISITION_AMOUNT
  	  							, GUBUN : item.GUBUN
  	  							, END_ACQUISITION_AMOUNT : item.END_ACQUISITION_AMOUNT
	  	  					}

  	        				jsonTotDprc.push(msg);
  	    				});
  	        			grdTotDprc.rebuild();
  	        		}else if(workType === "Q1"){
  	        			data.cv_2.forEach((item, index) => {
  	  	        			msg = {
  	  	        				ACQ_DEPR_AMT : item.ACQ_DEPR_AMT
	  	  	        			, ACQ_DEPR_AMT_01 : item.ACQ_DEPR_AMT_01
	  	  	        			, ACQ_DEPR_AMT_02 : item.ACQ_DEPR_AMT_02
	  	  	        			, ACQ_DEPR_AMT_03 : item.ACQ_DEPR_AMT_03
	  	  	        			, ACQ_DEPR_AMT_04 : item.ACQ_DEPR_AMT_04
	  	  	        			, ACQ_DEPR_AMT_05 : item.ACQ_DEPR_AMT_05
	  	  	        			, ACQ_DEPR_AMT_06 : item.ACQ_DEPR_AMT_06
	  	  	        			, ACQ_DEPR_AMT_07 : item.ACQ_DEPR_AMT_07
	  	  	        			, ACQ_DEPR_AMT_08 : item.ACQ_DEPR_AMT_08
	  	  	        			, ACQ_DEPR_AMT_09 : item.ACQ_DEPR_AMT_09
	  	  	        			, ACQ_DEPR_AMT_10 : item.ACQ_DEPR_AMT_10
	  	  	        			, ACQ_DEPR_AMT_11 : item.ACQ_DEPR_AMT_11
	  	  	        			, ACQ_DEPR_AMT_12 : item.ACQ_DEPR_AMT_12
	  	  	        			, ACQUIRE_DATE : item.ACQUIRE_DATE
	  	  	        			, ASSET_ACCOUNT : item.ASSET_ACCOUNT
	  	  	        			, ASSET_CATEGORY : item.ASSET_CATEGORY
	  	  	        			, ASSET_LEVEL2 : item.ASSET_LEVEL2
	  	  	        			, ASSET_LEVEL3 : item.ASSET_LEVEL3
	  	  	        			, ASSET_NAME : item.ASSET_NAME
	  	  	        			, ASSET_NO : item.ASSET_NO
	  	  	        			, ASSET_QTY : item.ASSET_QTY
	  	  	        			, BEGIN_ACCUM_DEPR : item.BEGIN_ACCUM_DEPR
	  	  	        			, BEGIN_ACQUISITION_AMOUNT : item.BEGIN_ACQUISITION_AMOUNT
	  	  	        			, BEGIN_NET_BALANCE : item.BEGIN_NET_BALANCE
	  	  	        			, BEGIN_SUBSIDIES_ACC_DEPR : item.BEGIN_SUBSIDIES_ACC_DEPR
	  	  	        			, BEGIN_SUBSIDIES_AMOUNT : item.BEGIN_SUBSIDIES_AMOUNT
	  	  	        			, BOOK_VALUE : item.BOOK_VALUE
	  	  	        			, COST_CENTER_CODE : item.COST_CENTER_CODE
	  	  	        			, DEPRECIATION_METHOD : item.DEPRECIATION_METHOD
	  	  	        			, DEPRECIATION_PERIOD : item.DEPRECIATION_PERIOD
	  	  	        			, DEPRECIATION_TYPE : item.DEPRECIATION_TYPE
	  	  	        			, DEPT_CODE : item.DEPT_CODE
	  	  	        			, DEPT_NAME : item.DEPT_NAME
	  	  	        			, DISPOSAL_DATE : item.DISPOSAL_DATE
	  	  	        			, DISPOSAL_TYPE : item.DISPOSAL_TYPE
	  	  	        			, END_ACCUM_DEPR : item.END_ACCUM_DEPR
	  	  	        			, END_ACQUISITION_AMOUNT : item.END_ACQUISITION_AMOUNT
	  	  	        			, END_NET_BALANCE : item.END_NET_BALANCE
	  	  	        			, END_SUBSIDES_ACCUM_DEPR : item.END_SUBSIDES_ACCUM_DEPR
	  	  	        			, END_SUBSIDIES_AMOUNT : item.END_SUBSIDIES_AMOUNT
	  	  	        			, FI_ORG_CODE : item.FI_ORG_CODE
	  	  	        			, IN_ACQUISITION_AMOUNT : item.IN_ACQUISITION_AMOUNT
	  	  	        			, IN_SUBSIDIES_AMOUNT : item.IN_SUBSIDIES_AMOUNT
	  	  	        			, ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT
	  	  	        			, OUT_ACCUM_DEPR : item.OUT_ACCUM_DEPR
	  	  	        			, OUT_ACQUISITION_AMOUNT : item.OUT_ACQUISITION_AMOUNT
	  	  	        			, OUT_SUBSIDIES_ACCUM_DEPR : item.OUT_SUBSIDIES_ACCUM_DEPR
	  	  	        			, OUT_SUBSIDIES_AMOUNT : item.OUT_SUBSIDIES_AMOUNT
	  	  	        			, PROJECT_NAME : item.PROJECT_NAME
	  	  	        			, SITE_CODE : item.SITE_CODE
	  	  	        			, SUBSIDIES_DEPR_AMT : item.SUBSIDIES_DEPR_AMT
  	  	  					}

  	  	        			jsonTotDtlDprc.push(msg);
	  	    			});
  	  	        			grdTotDtlDprc.rebuild();
  	        		}else if(workType === "Q2"){
  	        			data.cv_3.forEach((item, index) => {
  	  	        			msg = {
 	  	        			ACQ_DEPR_AMT : item.ACQ_DEPR_AMT
  	  	        			, ASSET_ACCOUNT : item.ASSET_ACCOUNT
  	  	        			, ASSET_CATEGORY : item.ASSET_CATEGORY
  	  	        			, ASSET_LEVEL2 : item.ASSET_LEVEL2
  	  	        			, ASSET_LEVEL3 : item.ASSET_LEVEL3
  	  	        			, ASSET_NAME : item.ASSET_NAME
  	  	        			, ASSET_NO : item.ASSET_NO
  	  	        			, ASSET_QTY : item.ASSET_QTY
  	  	        			, DEPRECIATION_TYPE : item.DEPRECIATION_TYPE
  	  	        			, DEPRECIATION_YYYYMM : item.DEPRECIATION_YYYYMM
  	  	        			, FI_ORG_CODE : item.FI_ORG_CODE
  	  	        			, SITE_CODE : item.SITE_CODE
  	  	        			, SUBSIDIES_DEPR_AMT : item.SUBSIDIES_DEPR_AMT
  	  	  					}

  	  	        			jsonMmDprc.push(msg);
  	  	    			});
  	  	        			grdMmDprc.rebuild();
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






	const fn_queryClick = async function(){
		//탭 확인해서 쿼리 ㄱㄱ
		let tabInfo = SBUxMethod.get("idxTab_norm");

		 if(tabInfo === "totDprcPivotTab"){
			 fn_fia5400Q("Q0");
		 }
         else if(tabInfo == "totDtlDprcTab"){
        	 fn_fia5400Q("Q1");
         }
         else if(tabInfo == "mmDprcTab"){
        	 fn_fia5400Q("Q2");
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

    const fn_dtpChange = async function(){

    	//if(inptYmdFrom > inptYmdTo){
    	//	gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    	//	SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    	//	SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    	//	return;
    	//}

     }

    const fn_dspsChange = async function(){

    }

    const fn_dspsCloseAfter = async function(){
    	var ast = SBUxMethod.get("srch-inp-astTab-ast"); //자산내역 자산 ->
    	var acntgCrtr = SBUxMethod.get("srch-slt-fiOrgCode");// 회계기준
    	var strWrkType = "";
    	if( ast != ""){
    		strWrkType = "ASSET";

    		if(acntgCrtr === "2"){
    			strWrkType += "_IFRS";
    		}
    		fn_setFia4300Q1(strWrkType,"");
    	}
    	saveButton = true;
    	var acntgCrtr = SBUxMethod.get("srch-slt-fiOrgCode");// 회계기준
    	var strWrkType = "";
    	if( ast != ""){
    		strWrkType = "ASSET";

    		if(acntgCrtr === "2"){
    			strWrkType += "_IFRS";
    		}
    		fn_setFia4300Q1(strWrkType,"");
    	}
    	saveButton = true;

    }

    const fn_dspsNoChange = async function(){
    	var dspsNo = SBUxMethod.get("srch-inp-astTab-dspsNo"); //처분번호
    	var astNo = SBUxMethod.get("srch-inp-astTab-ast"); // 자산번호
    	if( dspsNo === "" & astNo != ""){
    		fn_fia4300Q("ASSETLIST");
    	}
    }

    /**
     * 공통팝업
     * 거래처코드
     */
     //
    var fn_cnptPopup = function(id) {

    	var cdId = "";
    	var nmId = "";

    	if(id === "srch-inp-cnptPopup"){
    		cdId = "srch-inp-cnpt";
    		nmId = "srch-inp-cnptPopup";
    	}else if (id === "srch-inp-dspsTab-cnpt2"){
    		cdId = "srch-inp-dspsTab-cnpt1";
    		nmId = "srch-inp-dspsTab-cnpt2";
    	}

        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM008'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CS_CODE", 	"CS_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["거래처코드", 	"거래처명"]
   			,tableColumnNames		: ["CS_CODE",	"CS_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(cdId, 		data.CS_CODE);
				SBUxMethod.set(nmId,		data.CS_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}

    /**
     * 공통팝업
     * 담당부서
     */
     //
    var fn_tkcgDeptPopup = function(id) {

    	var cdId = "";
    	var nmId = "";

    	if(id === "srch-inp-tkcgDeptPopup"){
    		cdId = "srch-inp-tkcgDept";
    		nmId = "srch-inp-tkcgDeptPopup";
    	}else if (id === "srch-inp-dspsTab-tkcgDept2"){
    		cdId = "srch-inp-dspsTab-tkcgDept1";
    		nmId = "srch-inp-dspsTab-tkcgDept2";
    	}

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
     * 담당자
     */
     //
    var fn_picPopup= function(id) {

    	var cdId = "";
    	var nmId = "";

    	if(id === "srch-inp-picPopup"){
    		cdId = "srch-inp-pic";
    		nmId = "srch-inp-picPopup";
    	}else if (id === "srch-inp-dspsTab-pic2"){
    		cdId = "srch-inp-dspsTab-pic1";
    		nmId = "srch-inp-dspsTab-pic2";
    	}

        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '담당자정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["담당자코드", 	"담당자명"]
   			,tableColumnNames		: ["EMP_CODE",	"EMP_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(cdId, 		data.EMP_CODE);
				SBUxMethod.set(nmId,		data.EMP_NAME);
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

        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-astTab-ast"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-astTab-astBtn"));
        var replaceText0 	= "_ASSET_NO_";
        var replaceText1 	= "_ASSET_NAME_";
        var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LIST'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["번호", 				"명칭"]
   			,searchInputFields		: ["ASSET_NO", 	"ASSET_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["자산번호", 	"자산명"]
   			,tableColumnNames		: ["ASSET_NO",	"ASSET_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-astTab-ast', 		data.ASSET_NO);
				SBUxMethod.set('srch-inp-astTab-astBtn',		data.ASSET_NAME);
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

        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-dspsTab-costCenter1"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-dspsTab-costCenter2"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '코스트센터');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코스트센터코드", 	"코스트센터명"]
   			,tableColumnNames		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-dspsTab-costCenter1', 		data.COST_CENTER_CODE);
				SBUxMethod.set('srch-inp-dspsTab-costCenter2',		data.COST_CENTER_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}

    /**
     * 공통팝업
     * 비용거래처
     */
     //
    var fn_cstCnptPopup= function() {

        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-dspsTab-cstCnpt1"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-dspsTab-cstCnpt2"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '비용거래처');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CS_PURCHASE'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CS_CODE", 	"CS_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["비용거래처코드", 	"비용거래처명"]
   			,tableColumnNames		: ["CS_CODE", 	"CS_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-dspsTab-cstCnpt1', 		data.CS_CODE);
				SBUxMethod.set('srch-inp-dspsTab-cstCnpt2',		data.CS_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}

    /**
     * 공통팝업
     * 처분비용계정
     */
     //
    var fn_dspsCstCnptPopup= function() {

        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-dspsTab-dspCstAcnt1"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-dspsTab-dspCstAcnt2"));
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND x.CS_CODE LIKE '%" + searchCode + "%' AND x.CS_NAME LIKE '%" + searchName + "%'";
        //var strWhereClause 	= "AND x.CS_CODE LIKE '%" + replaceText0 + "%' AND x.CS_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '처분비용계정');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["처분계정코드", 	"처분계정명"]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-dspsTab-dspCstAcnt1', 		data.ACCOUNT_CODE);
				SBUxMethod.set('srch-inp-dspsTab-dspCstAcnt2',		data.ACCOUNT_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>