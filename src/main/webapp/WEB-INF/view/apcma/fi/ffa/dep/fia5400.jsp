<%
/**
 * @Class Name 		: fia4300.jsp
 * @Description 	: 매각/폐기내역 등록
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
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<div style="display:none">
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				</div>
				<!--[APC] END -->
			<div>
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
                            <th scope="row" class="th_bg">법인</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-corp" name="srch-slt-corp" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp" group-id="search1" ></sbux-select>
                            </td>
                            <td></td>

                            <th scope="row" class="th_bg">회계단위</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-acntgCrtr" name="srch-slt-acntgCrtr" class="form-control input-sm" uitype="single" jsondata-ref="jsonAcntgUnit" group-id="search1"></sbux-select>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">

									<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										    	type="button"
										    	id="srch-slt-bplc"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
										    </button>
										    <div class="dropdown-menu bplc" aria-labelledby="srch-slt-bplc" style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
                            </td>
                            <td></td>

                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">기간</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-ymdFrom"
									name="srch-dtp-ymdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-ymdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-ymdTo"
									name="srch-dtp-ymdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-ymdTo)"
								></sbux-datepicker>
							</td>
                            <th scope="row" class="th_bg">감가상각기준</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-dprcCrtr" name="srch-slt-dprcCrtr" class="form-control input-sm" uitype="single" jsondata-ref="jsonDprcCrtr"></sbux-select>
                            </td>

                        </tr>

                    </tbody>
                </table>
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

	// 조회
	function cfn_search() {
		fn_search();

	}

	// ${comMenuVO.menuId}

	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역

	// common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
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
			gfnma_setComSelect(['srch-slt-corp'], jsonCorp, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

			gfnma_multiSelectInit({
				target			: ['#srch-slt-bplc']
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
			gfnma_setComSelect(['srch-slt-dprcCrtr'], jsonDprcCrtr, 'L_FIA018', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			gfnma_setComSelect(['srch-slt-acntgCrtr'], jsonAcntgCrtr, 'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '')



		]);
		SBUxMethod.set("srch-dtp-ymdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-ymdTo", gfn_dateLastYmd(new Date()));

		fn_createGrid1();
    	fn_createGrid2();
    	fn_createGrid3();
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();

    	//fn_search();
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
            {caption: ["수량"],			ref: 'qntt', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["기초금액"], 		ref: 'bssAmt',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["증가금액"],  			ref: 'incrsAmt',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["감소금액"],  			ref: 'dcrsAmt',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["기말금액"],  			ref: 'endAmt',    			type:'output',  	width:'100px',  	style:'text-align:left'}
        ];

        grdTotDprc = _SBGrid.create(SBGridProperties);

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
        	{caption: ['자산번호'], ref: 'astNo', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['자산명'], ref: 'astNm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['사업단위'], ref: 'bizUnit', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['사업장'], ref: 'bplc', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['상각구분'], ref: 'dprcSe', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['중분류'], ref: 'mclsf', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['소분류'], ref: 'sclsf', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['자산계정'], ref: 'astAcnt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['감가상각방법'], ref: 'dprcMthd', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['내용연수'], ref: 'useLif', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['부서코드'], ref: 'deptCd', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['부서명'], ref: 'deptNm', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['원가중심점'], ref: 'cstCntr', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['취득일'], ref: 'acqsDay', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['최초취득가액'], ref: 'frstAcqsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기초취득가액'], ref: 'bssAcqsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기초보조금상각누계액'], ref: 'bssAsstncDprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['당기취득금액'], ref: 'crntAcqsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['당기취득보조금'], ref: 'crntAcqsAsstncAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['처분유형'], ref: 'dspsType', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['처분일'], ref: 'dspsYmd', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['처분금액'], ref: 'dspsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['처분보조금'], ref: 'dspsAsstncAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기말취득가액'], ref: 'yrEndAcqsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기말보조금상각누계액'], ref: 'yrEndAsstncAmtDprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기초감가상각누계액'], ref: 'bssdprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기초보조금상각누계액'], ref: 'bssAsstncDprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기초장부가액'], ref: 'bssAbAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['수량'], ref: 'qntt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['01월상각비'], ref: 'mmDprc01', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['02월상각비'], ref: 'mmDprc02', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['03월상각비'], ref: 'mmDprc03', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['04월상각비'], ref: 'mmDprc04', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['05월상각비'], ref: 'mmDprc05', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['06월상각비'], ref: 'mmDprc06', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['07월상각비'], ref: 'mmDprc07', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['08월상각비'], ref: 'mmDprc08', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['09월상각비'], ref: 'mmDprc09', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['10월상각비'], ref: 'mmDprc10', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['11월상각비'], ref: 'mmDprc11', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['12월상각비'], ref: 'mmDprc12', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['감가상각비'], ref: 'dprcAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['보조금상각비'], ref: 'asstncAmtDprcRt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['감가상각누계액'], ref: 'dprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['국고보조금상각누계액'], ref: 'ntAsstncAmtDprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기말상각누계액'], ref: 'yrEndDprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기말보조금상각누계액'], ref: 'yrEndAsstncAmtDprcAtAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ['기말장부가액'], ref: 'endAbAmt', 				type:'output',		width:'80px',		style:'text-align:center'}


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
            {caption: ["수량"],			ref: 'qntt', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["감가상각비"], 		ref: 'dprcAmt',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["보조금상각비"],  			ref: 'asstncAmtDprc',    			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        grdMmDprc = _SBGrid.create(SBGridProperties);

    }


    /**
     * 목록 조회
     */
    const fn_search = async function() {
    	fn_fia4300Q("");
    }

    // fnQRY_P_FIA4300_Q
    //workType = DISP / LIST /SAVE /DETAIL
    const fn_fia4300Q = async function(workType){

    	var corp = gfnma_nvl(SBUxMethod.get("srch-slt-corp")); //법인 cbocomp_code1
    	var acntgUnit = gfnma_nvl(SBUxMethod.get("srch-slt-bizUnit")); // 회계단위 cbofi_org_code1
    	var acntgCrtr = gfnma_nvl(SBUxMethod.get("srch-slt-acntgCrtr")); // 회계기준 cboacct_rule_code_p
    	var intlDspsNo = gfnma_nvl(SBUxMethod.get("srch-inp-astTab-intlDspsNo")); //자산내역 : 당초처분번호  txtoriginal_asset_disp_no
    	var dspsNo = gfnma_nvl(SBUxMethod.get("srch-inp-astTab-dspsNo"));  // 자산내역 : 처분번호 txtasset_disposal_no
    	var dspsYmdFrom = gfnma_nvl(SBUxMethod.get("srch-dtp-dspsYmdFrom")); //처분일 from ymddisposal_date_fr
    	var dspsYmdTo = gfnma_nvl(SBUxMethod.get("srch-dtp-dspsYmdTo")); //처분일 to ymddisposal_date_to
    	var tkcgdept = gfnma_nvl(SBUxMethod.get("srch-inp-tkcgDept")); // 담당부서 txtdept_code1
    	var pic = gfnma_nvl(SBUxMethod.get("srch-inp-pic")); // 담당자 txtemp_code1
    	var cnpt = gfnma_nvl(SBUxMethod.get("srch-inp-cnpt")); //거래처 txtcs_code1
    	var astno = gfnma_nvl(SBUxMethod.get("srch-inp-astTab-ast"));//자산내역 자산 txtasset_no
        var dspsType1 = gfnma_nvl(SBUxMethod.get("srch-inp-astTab-dspsType"));//cbodisposal_type 자산내역 처분유형
    	var dspsType2 = gfnma_nvl(SBUxMethod.get("srch-slt-dspsType"));//cbodisposal_type1 검색조건 처분유형
		var bplc = gfnma_nvl(SBUxMethod.get("srch-slt-bplc"));//cbosite_code1 검색조건 사업장

		if(workType === "LIST" || workType === "SAVE" || workType === "DISP" ){
    		if(!SBUxMethod.validateRequired({group_id: 'search1'})){
    			return false;
    		}
    	}else if (workType === "DETAIL"){
    		if(!SBUxMethod.validateRequired({group_id: 'ast1'})){
    			return false;
    		}
    	}

		var paramObj = {
			    V_P_DEBUG_MODE_YN         : 'N'
			    ,V_P_LANG_ID : 'KOR '
			    ,V_P_COMP_CODE  : corp     // 법인
			    ,V_P_CLIENT_CODE : ''
		  	    ,V_P_FI_ORG_CODE : acntgUnit
			    ,V_P_ACCT_RULE_CODE : acntgCrtr
			    ,V_P_ASSET_DISPOSAL_NO : workType == "DISP" ? intlDspsNo : dspsNo
			    ,V_P_DISPOSAL_SEQ : 0
			    ,V_P_SITE_CODE : bplc
			    ,V_P_DISPOSAL_TYPE : workType == "INFO" ?  dspsType1 : dspsType2
			    ,V_P_DISPOSAL_DATE_FROM : dspsYmdFrom
			    ,V_P_DISPOSAL_DATE_TO     : dspsYmdTo
			    ,V_P_DEPT_CODE  : tkcgdept
			    ,V_P_EMP_CODE  :  pic
			    ,V_P_CS_CODE   : cnpt
			    ,V_P_ASSET_NO : astno
			    ,V_P_FORM_ID   : p_formId
			    ,V_P_MENU_ID   : p_menuId
			    ,V_P_PROC_ID   : ''
			    ,V_P_USERID     : ''
			    ,V_P_PC           : ''
		    };


        const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300Q.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  				jsonAstDsps.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						NATION_CODE				: item.NATION_CODE,
  						NATION_CODE_ABBR		: item.NATION_CODE_ABBR,
  						NATION_NAME				: item.NATION_NAME,
  						NATION_FULL_NAME		: item.NATION_FULL_NAME,
  						NATION_FULL_NAME_CHN	: item.NATION_FULL_NAME_CHN,
  						REGION_CODE				: item.REGION_CODE,
  						CURRENCY_CODE			: item.CURRENCY_CODE,
  						MEMO					: item.MEMO,
  						SORT_SEQ				: item.SORT_SEQ,
  						USE_YN 					: item.USE_YN
  					}
  					jsonAstDsps.push(msg);
  				});

  	        	grdAstDsps.rebuild();

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

    const fn_fia4300Q1 = async function(workType,strSearchType){

    	var dspsYmd = SBUxMethod.get("srch-dtp-astTab-dspsYmd");

    	var dspsRt = SBUxMethod.get("srch-inp-astTab-dspsRt");
    	var dspsAmt =  SBUxMethod.get("srch-inp-astTab-dspsAmt");
    	var acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr"); //회계기준
    	var corp = SBUxMethod.get("srch-slt-corp"); //법인 cbocomp_code1
    	var bssAcqsAmt = SBUxMethod.get("srch-inp-astTab-bssAcqsAmt");
    	var astNo = SBUxMethod.get("srch-inp-astTab-ast"); // 자산번호


    	var paramObj = {
    			V_P_WORK_TYPE : workType
			    ,V_P_DEBUG_MODE_YN         : 'N'
			    ,V_P_LANG_ID : 'KOR '
			    ,V_P_COMP_CODE  : corp     // 법인
			    ,V_P_CLIENT_CODE : ''
			    ,V_P_ACCT_RULE_CODE : acntgCrtr
			    ,V_P_ASSET_NO : astNo
	    		,V_P_DISPOSAL_DATE  :   dspsYmd
    		    ,V_P_ACQUISITION_AMOUNT       : dspsAmt
    		    ,V_P_BEGIN_ACQUISITION_AMOUNT : bssAcqsAmt
    		    ,IV_P_OUT_ACQUISITION_RATE    : strSearchType == "RATE" ?  dspsRt : 0
    		    ,V_P_OUT_ACQUISITION_AMOUNT  : strSearchType == "RATE" ? dspsAmt : dspsAmt
			    ,V_P_FORM_ID   : p_formId
			    ,V_P_MENU_ID   : p_menuId
			    ,V_P_PROC_ID   : ''
			    ,V_P_USERID     : ''
			    ,V_P_PC           : ''
		    };


        const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300Q1.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;

	        try {
	  			if (_.isEqual("S", data.resultStatus)) {

	  				jsonAstDsps.length = 0;
	  	        	data.cv_1.forEach((item, index) => {
	  					const msg = {
	  						NATION_CODE				: item.NATION_CODE,
	  						NATION_CODE_ABBR		: item.NATION_CODE_ABBR,
	  						NATION_NAME				: item.NATION_NAME,
	  						NATION_FULL_NAME		: item.NATION_FULL_NAME,
	  						NATION_FULL_NAME_CHN	: item.NATION_FULL_NAME_CHN,
	  						REGION_CODE				: item.REGION_CODE,
	  						CURRENCY_CODE			: item.CURRENCY_CODE,
	  						MEMO					: item.MEMO,
	  						SORT_SEQ				: item.SORT_SEQ,
	  						USE_YN 					: item.USE_YN
	  					}
	  					jsonAstDsps.push(msg);
	  				});

	  	        	grdAstDsps.rebuild();

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
     * 비용전표조회
     */
		const fn_expenseSearch = async function() {


    	var sourceId = SBUxMethod.get("srch-inp-astTab-dspsSourceId");
    	var disposalType = SBUxMethod.get("srch-slt-dspsType");

    	if(disposalType === "DISUSE"){
    		return;
    	}

    	//  처분 ▶ 소스 ID 없을 경우 return
		if(sourceId === ""){
			return;
		}

		var paramObj = {
				V_P_DEBUG_MODE_YN	: ''
				,V_P_LANG_ID		: ''
				,V_P_COMP_CODE		: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
				,V_P_NATION_CODE	: NATION_CODE
				,V_P_NATION_NAME	: NATION_NAME
				,V_P_FORM_ID		: p_formId
				,V_P_MENU_ID		: p_menuId
				,V_P_PROC_ID		: ''
				,V_P_USERID			: ''
				,V_P_PC				: ''
		    };




        const postJsonPromise = gfn_postJSON("/co/sys/org/selectCom3100List.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	jsonNationList.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						NATION_CODE				: item.NATION_CODE,
  						NATION_CODE_ABBR		: item.NATION_CODE_ABBR,
  						NATION_NAME				: item.NATION_NAME,
  						NATION_FULL_NAME		: item.NATION_FULL_NAME,
  						NATION_FULL_NAME_CHN	: item.NATION_FULL_NAME_CHN,
  						REGION_CODE				: item.REGION_CODE,
  						CURRENCY_CODE			: item.CURRENCY_CODE,
  						MEMO					: item.MEMO,
  						SORT_SEQ				: item.SORT_SEQ,
  						USE_YN 					: item.USE_YN
  					}
  					jsonNationList.push(msg);
  				});

        		NationInGrid.rebuild();

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
     * 전표 생성
     */
    const fn_createAccount = async function() {

    	//  그리드에 선택된 행 없을 시 return
		//if(grdAstDsps.getRow() == -1){
		//	return;
		//}


		if(fn_setFia4300S2("ACCOUNT")){
			if(fn_setFia4300S2("ACCOUNT2")){
				//var strKey = grdAstDsps.getRowData(1).astDspsNo // 자산처분번호를 가지고 로우 찾아서 포커스 ㄱㄱ
				//var rowIndex = grdAstDsps.getRow();
				fn_queryClick();

				//grdAstDsps.setRow(rowIndex);
			}
		}


    }

	const fn_queryClick = async function(){
		// saveButton은 처분일자가 닫히면서 true로 바뀜...?
		if(saveButton){

		}
		//fnQRY_P_FIA4300_Q1
	}

	const fn_setFia4300S1 = async function(workType) {
    	var rowNo    = grdAstDsps.getRow();
    	var rowData = grdAstDsps.getRowData(rowNo);

    	var dspsNo = SBUxMethod.get("srch-inp-astTab-dspsNo");// 처분번호
    	var acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr"); //회계기준
		var rmrk = SBUxMethod.get("srch-inp-astTab-rmrk1"); //비고
		var astNm = SBUxMethod.get("srch-inp-astTab-astBtn"); //자산명
		var astQntt = SBUxMethod.get("srch-inp-dspsTab-dspsQntt"); //처분수량
		var paramObj = {
    		    V_P_WORK_TYPE         : workType
    		    ,V_P_DEBUG_MODE_YN  : 'N'
    		    ,V_P_LANG_ID            :     'KOR'
    		    ,V_P_COMP_CODE       :     gv_ma_selectedApcCd
    		    ,V_P_CLIENT_CODE     :     gv_ma_selectedClntCd
    		    ,V_P_ASSET_DISPOSAL_NO       : dspsNo
    		    ,V_P_DISPOSAL_SEQ             : ''
    		    ,V_P_ASSET_NAME               : astNm
    		    ,V_P_ASSET_SPEC               : ''
    		    ,V_P_ASSET_QTY                : astQntt
    		    ,V_P_UNIT_CODE                : ''
    		    ,V_P_ACQUISITION_AMOUNT       : ''
    		    ,V_P_GOVERNMENT_SUBSIDIES    : ''
    		    ,V_P_ACCUMULATED_DEPRECIATION : ''
    		    ,V_P_BOOK_VALUE               : rowData.abAmt
    		    ,V_P_MEMO                     : rowData.rmrk
    		    ,V_P_FORM_ID      : p_formId
    		    ,V_P_MENU_ID     :  p_menuId
    		    ,V_P_PROC_ID     :   ''
    		    ,V_P_USERID       :   p_userId
    		    ,V_P_PC             :   ''
    	}

    	 const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300S2.do", {
         	getType				: 'json',
         	workType			: workType,
         	cv_count			: '1',
         	params				: gfnma_objectToString(paramObj)
 		});

    	const data = await postJsonPromise;
    	try{

    	}catch{
    		 if (!(e instanceof Error)) {
                 e = new Error(e);
             }
             console.error("failed", e.message);
             gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}

    	return data;

    }


    const fn_setFia4300S2 = async function(workType) {
    	var rowNo    = grdAstDsps.getRow();
    	var rowData = grdAstDsps.getRowData(rowNo);

    	var dspsNo = SBUxMethod.get("srch-inp-astTab-dspsNo");// 처분번호
    	var acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr"); //회계기준

    	var paramObj = {
    		    V_P_WORK_TYPE         : workType
    		    ,V_P_DEBUG_MODE_YN  : 'N'
    		    ,V_P_LANG_ID            :     'KOR'
    		    ,V_P_COMP_CODE       :     gv_ma_selectedApcCd
    		    ,V_P_CLIENT_CODE     :     gv_ma_selectedClntCd
    		   ,V_P_ACCT_RULE_CODE :	acntgCrtr
    		   ,V_P_ASSET_DISPOSAL_NO : rowData.astDspsNo
    		   ,V_P_ASSET_NO          :   rowData.astNo
    		   ,V_P_DISPOSAL_TYPE     : rowData.dspsType
    		   ,V_P_DISPOSAL_DATE     : rowData.dspsYmd
    		    ,V_P_FORM_ID      : p_formId
    		    ,V_P_MENU_ID     :  p_menuId
    		    ,V_P_PROC_ID     :   ''
    		    ,V_P_USERID       :   p_userId
    		    ,V_P_PC             :   ''
    	}

    	 const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300S2.do", {
         	getType				: 'json',
         	workType			: workType,
         	cv_count			: '1',
         	params				: gfnma_objectToString(paramObj)
 		});

    	const data = await postJsonPromise;
    	try{

    	}catch{
    		 if (!(e instanceof Error)) {
                 e = new Error(e);
             }
             console.error("failed", e.message);
             gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}

    	return data;

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
    	let inptYmdFrom = SBUxMethod.get("srch-dtp-dspsYmdFrom");
    	let inptYmdTo = SBUxMethod.get("srch-dtp-dspsYmdTo");

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
    	var acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr");// 회계기준
    	var strWrkType = "";
    	if( ast != ""){
    		strWrkType = "ASSET";

    		if(acntgCrtr === "2"){
    			strWrkType += "_IFRS";
    		}
    		fn_setFia4300Q1(strWrkType,"");
    	}
    	saveButton = true;
    	var acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr");// 회계기준
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
    		compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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