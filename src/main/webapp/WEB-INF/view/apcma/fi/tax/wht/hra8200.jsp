<%
/**
 * @Class Name 		: hra8200.jsp
 * @Description 	: 원천세집계표
 * @author 			:
 * @since 			: 2024.07.10
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.10   	장성주		최초 생성
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
	<title>title : 원천세 집계표</title>
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
                    </h3><!-- 원천세집계표 -->
                </div>
                <div style="margin-left: auto;">
                	<sbux-button id="btnTot" name="btnTot" 	uitype="normal" text="집계" class="btn btn-sm btn-outline-danger" onclick="fn_cancelClick"></sbux-button>
                    <sbux-button id="btnCmptn" name="btnCmptn" 	uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="fn_defBtnClick"></sbux-button>
                    <sbux-button id="btnCmptnRtrcn" name="btnCmptn" 	uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" onclick="fn_defCancelClick"></sbux-button>
                </div>
            </div>
            <div class="box-body">
				<div class="box-search-ma">
				<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
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
                            <th scope="row" class="th_bg_search">급여영역</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-payAreaType" name="srch-slt-payAreaType" class="form-control input-sm inpt_data_reqed" uitype="single" jsondata-ref="jsonPayAreaType" unselected-text="선택"></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg_search">제출연월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-submitYyyymmFr"
									name="srch-dtp-submitYyyymmFr"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
								></sbux-datepicker>
							</td>
							<td>-</td>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-submitYyyymmTo"
									name="srch-dtp-submitYyyymmTo"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>

                            <td colspan="1" class="ad_input" style="border-right: hidden;">
                            	<sbux-checkbox uitype="normal" id="srch-chk-originalFlag" name="srch-chk-originalFlag" class="form-control input-sm check" text="원천보기" true-value="Y" false-value="N">
                            </td>

                            <td colspan="3" class="ad_input" style="border-right: hidden;">
                            	<sbux-checkbox uitype="normal" id="srch-chk-allYn" name="srch-chk-allYn" class="form-control input-sm check" text="전체여부" true-value="Y" false-value="N">
                            </td>
                        </tr>
                    </tbody>
                </table>
				</div>

				<div class="row">
					<div class="col-sm-3">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>신고리스트</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdDclrList" style="height:498px;width:100%"></div>
					</div>
					<div class="col-sm-9">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>신고상세정보</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdDclrDtlInfo" style="height:498px;width:100%"></div>
					</div>
				</div>
				</div>
			</div>
    </section>
	<!-- 팝업 Modal -->
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

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역

	var checkboxJsonData = [
		{ text : "원천보기", truevalue : "Y",     falsevalue: "N"},
		{ text : "전체여부", truevalue : "Y",    falsevalue: "N"}
	];


	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-compCode1'], jsonCorp, 'L_HRA014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			// 급여영역
            gfnma_setComSelect(['srch-slt-payAreaType'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),

		]);


		let yyyymm = gfnma_date6().substring(0,6);
    	SBUxMethod.set("srch-dtp-submitYyyymmFr",yyyymm);
    	SBUxMethod.set("srch-dtp-submitYyyymmTo",yyyymm);
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();
    	fn_createGrid2();
    	//fn_search();

    });

    //grid 초기화
    var grdDclrDtlInfo; 			// 그리드를 담기위한 객체 선언
    var jsonDclrDtlInfo = []; 	// 그리드의 참조 데이터 주소 선언

    var grdDclrList;
    var jsonDclrList= [];


    //json
    var jsonCorp = []; //법인
    var jsonBizUnit = []; //사업단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준
	var jsonPayAreaType = []; // 급여영역

	// 신규
	function cfn_add() {

	}

	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			if (fnSET_P_HRA8200_S("U"))
            {
                QueryClick();
            }
		}
    }


	// 마스터 그리드 삭제
	function cfn_del() {
		deleteClick()
	}

	// 조회
	function cfn_search() {
		queryClick();

	}

	// 초기화
	function cfn_init() {
		SBUxMethod.refreshAll()
	}



    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDclrList';
	    SBGridProperties.id 				= 'grdDclrList';
	    SBGridProperties.jsonref 			= 'jsonDclrList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	 {caption: [""],			ref: 'chkYn'
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
 				}
        	},
            {caption: ["귀속연월"],		ref: 'jobYyyymm', 			type:'output',  	width:'100px',  	style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
            {caption: ["지급연월"], 	ref: 'payYyyymm',    	type:'output',  	width:'100px',  	style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
            {caption: ["제출연월"],  		ref: 'submitYyyymm',    			type:'output',  	width:'100px',  	style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}}
        ];

        grdDclrList = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
        grdDclrList.bind('rowchanged','focusedRowChanged');
    }

    function fn_createGrid2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDclrDtlInfo';
	    SBGridProperties.id 				= 'grdDclrDtlInfo';
	    SBGridProperties.jsonref 			= 'jsonDclrDtlInfo';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.total = {
				type: 'grand',
				position: 'bottom',
				columns: {
					standard: [15],
					sum: [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
				},
			grandtotalrow: {
				titlecol: 15,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				16: '#,###',
				17: '#,###',
				16 : '#,###',
				17 : '#,###',
				18 : '#,###',
				19 : '#,###',
				20 : '#,###',
				21 : '#,###',
				22 : '#,###',
				23 : '#,###',
				24 : '#,###',
				25 : '#,###',
				26 : '#,###',
				27 : '#,###',
				28 : '#,###',
				29 : '#,###',
				30 : '#,###',
				31 : '#,###',
				32 : '#,###',
				33 : '#,###',
				34 : '#,###',
				35 : '#,###',
				36 : '#,###'

			}
		};
        SBGridProperties.columns = [
        	{caption: ["확정"], ref: 'defYn', type:'checkbox'
        		,	typeinfo: {
 					ignoreupdate : true,
 					fixedcellcheckbox : {
 						usemode : true,
 						rowindex : 1,
 						deletecaption : false
 					},
 					checkedvalue : 'Y',
 					uncheckedvalue : 'N'
 				},	width:'80px',		style:'text-align:center'},
        	{caption: ["귀속월"], ref: 'jobYyyymm', 				type:'output',		width:'80px',		style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
        	{caption: ["지급월"], ref: 'payYyyymm', 				type:'output',		width:'80px',		style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
        	{caption: ["신고월"], ref: 'submitYyyymm', 				type:'output',		width:'80px',		style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
        	{caption: ["근무지"], ref: 'workRegionName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사번"], ref: 'empCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사원명"], ref: 'empName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["부서"], ref: 'deptName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득구분코드"], ref: 'gubunCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["소득구분명"], ref: 'gubunName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사유코드"], ref: 'reasonCode', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["사유명"], ref: 'reasonName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["전표번호"], ref: 'docName', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["전표적요"], ref: 'docDesc', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["생년월일"], ref: 'socialNumDate', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["지급일"], ref: 'payDate', 				type:'output',		width:'80px',		style:'text-align:center'},
        	{caption: ["원천신고대상"], ref: 'payTotAmt', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["사업소세과세대상"], ref: 'payTotAmt2', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["사업소세비과세"], ref: 'taxFreeAmt', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["급여지급액(세전)"], ref: 'payTotAmt3', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(과)인건비"], ref: 'payTotAmt4', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(과)인정상여"], ref: 'payTotAmt5', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(과)연차수당 "], ref: 'payTotAmt6', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(과)복리급여"], ref: 'payTotAmt7', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(과)휴일교통비"], ref: 'payTotAmt8', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(과)자가운전보조비"], ref: 'payTotAmt9', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(비)보육수당"], ref: 'payTotAmt10', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(비)야간근로수당"], ref: 'payTotAmt11', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(비)자가운전보조비"], ref: 'payTotAmt12', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["(비)식대"], ref: 'payTotAmt13', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["소득세 징수액"], ref: 'whIncomeTax1', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["소득세 환급액"], ref: 'whIncomeTax2', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["소득세 조정액"], ref: 'whIncomeTax3', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["소득세 납부액"], ref: 'whIncomeTax4', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["주민세 징수액"], ref: 'whLocalTax1', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["주민세 환급액"], ref: 'whLocalTax2', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["주민세 조정액"], ref: 'whLocalTax3', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["주민세 납부액"], ref: 'whLocalTax4', format : {type:'number', rule:'#,###'},				type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["총납부액"], ref: 'totTax', 	format : {type:'number', rule:'#,###'},			type:'output',		width:'80px',		style:'text-align:right'},
        	{caption: ["번호"], ref: 'txnId', 				type:'output',		width:'80px',		style:'text-align:center', hidden: true},

        ];

        grdDclrDtlInfo = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }



    const queryClick = async function(){

        //InitControls(grdList);
        //InitControls(grdDetail);

        grdDclrList.rebuild();
		grdDclrDtlInfo.rebuild();


        //int iBefore = gvwList.FocusedRowHandle;
        let iBefore = grdDclrList.getRow();

        await fnQRY_P_HRA8200_Q("LIST");



        //fnQRY_P_HRA8200_Q("DETAIL");



        if (iBefore < 1){
        	//newClick(); 뭐지?
        }

    }



    const focusedRowChanged = async function(){
        await fnQRY_P_HRA8200_Q("DETAIL");
    }

    const fnQRY_P_HRA8200_Q = async function(workType){
    	let nRow = grdDclrList.getRow();
    	let rowData = grdDclrList.getRowData(nRow);
    	let allData = grdDclrList.getGridDataAll();
    	let originalFlag = SBUxMethod.get("srch-chk-originalFlag")['srch-chk-originalFlag'];
    	let allYn = SBUxMethod.get("srch-chk-allYn")['srch-chk-allYn'];
    	
    	var paramObj = {
  			V_P_DEBUG_MODE_YN	: ''
  			,V_P_LANG_ID		: ''
  			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
  			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
  			
  			,V_P_SUBMIT_YYYYMM_FR : ''
  			,V_P_SUBMIT_YYYYMM_TO : ''
  			,V_P_SUBMIT_YYYYMM    : workType == "LIST" ? "" : rowData.submitYyyymm
  			,V_P_JOB_YYYYMM       : workType == "LIST" ? "" : rowData.jobYyyymm
  			,V_P_PAY_YYYYMM       : workType == "LIST" ? "" : rowData.payYyyymm
  			,V_P_PAY_AREA_TYPE    : ''
  			,V_P_ORIGINAL_FLAG    : originalFlag
  			,V_P_CHKALL_YN        : allYn
  			
  			,V_P_FORM_ID		: p_formId
  			,V_P_MENU_ID		: p_menuId
  			,V_P_PROC_ID		: ''
  			,V_P_USERID			: ''
  			,V_P_PC				: ''
  	    };

    	 let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_",["submitYyyymm","jobYyyymm","payYyyymm","originalFlag","chkallYn"]);
	 	 if(!postFlag){
	 	    return;
	 	 }

          const postJsonPromise = gfn_postJSON("/hr/hra/selectHra8200Q.do", {
           	getType				: 'json',
           	workType			:  workType,
           	cv_count			: '2',
           	params				: gfnma_objectToString(paramObj, true)
   			});

        	const data = await postJsonPromise;
        	console.log('data:', data);
          // 비즈니스 로직 정보
			try {
	        	if (_.isEqual("S", data.resultStatus)) {
	            	//gfn_comAlert("I0001");
	        		//info, log에 따라서 그리드에 데이터 넣어주는듯
	        		if (workType === "LIST"){
	        		   jsonDclrList.length = 0;
        			   //var msg = convertArrayToCamelCase(data.cv_1)
        			   data.cv_1.forEach(item=>{
        				   let obj = {
        						   submitYyyymm : item.SBMSN_YM
        						   , jobYyyymm : item.BLN_YM
        						   , payYyyymm : item.SLRY_YM
        						   , chkYn : item.CHK_YN
        						   , defYn1 : item.DEF_YN_1
        						   , defYn2 : item.DEF_YN_2
        				   }
        				   jsonDclrList.push(obj);
        			   })
        			   //jsonDclrList = msg;
	        		   grdDclrList.rebuild();
	                   if(jsonDclrList.length > 0) {
	                	   grdDclrList.clickRow(1);
	                   }
	               }else if (workType === "DETAIL"){
	            	   jsonDclrDtlInfo.length = 0;
      				   //var msg = convertArrayToCamelCase(data.cv_2)
      				   data.cv_2.forEach(item=>{
        				   let obj = {
        						   jobYyyymm : item.BLN_YM
        						   , payYyyymm : item.SLRY_YM
        						   , submitYyyymm : item.SBMSN_YM
        						   , taxSiteCode : item.TX_SITE_CD
        						   , workRegionName : item.WORK_RGN_NM
        						   , empCode : item.EMP_CD
        						   , empName : item.EMP_NM
        						   , deptName : item.DEPT_NM
        						   , gubunCode : item.SE_CD
        						   , gubunName : item.SE_NM
        						   , reasonCode : item.RSN_CD
        						   , reasonCode : item.RSN_CD
        						   , reasonName : item.RSN_NM
        						   , socialNumDate : item.RRNO_BRDT
        						   , payDate : gfnma_date5(item.PAY_YMD)
        						   , docDate : item.SLIP_YMD
        						   , docName : item.SLIP_NM
        						   , docDesc : item.SLIP_DSCTN
        						   , payTotAmt : item.EARN_TOT_AMT
        						   , payTotAmt2 : item.EARN_TOT_AMT2
        						   , taxFreeAmt : item.TX_TXFR_AMT
        						   , payTotAmt3 : item.EARN_TOT_AMT3
        						   , payTotAmt4 : item.EARN_TOT_AMT4
        						   , payTotAmt5 : item.EARN_TOT_AMT5
        						   , payTotAmt6 : item.EARN_TOT_AMT6
        						   , payTotAmt7 : item.EARN_TOT_AMT7
        						   , payTotAmt8 : item.EARN_TOT_AMT8
        						   , payTotAmt9 : item.EARN_TOT_AMT9
        						   , payTotAmt10 : item.TXFR_ALWNC_AMT10
        						   , payTotAmt11 : item.TXFR_ALWNC_AMT11
        						   , payTotAmt12 : item.TXFR_ALWNC_AMT12
        						   , payTotAmt13 : item.TXFR_ALWNC_AMT13
        						   , whIncomeTax1 : item.WTHD_INCTX_AMT
        						   , whIncomeTax2 : item.WTHD_INCTX_RMBR_AMT
        						   , whIncomeTax3 : item.WTHD_INCTX_AJMT_AMT
        						   , whIncomeTax4 : item.WTHD_INCTX_PAY_AMT
        						   , whLocalTax1 : item.WTHD_RSDTX_AMT
        						   , whLocalTax2 : item.WTHD_RSDTX_RMBR_AMT
        						   , whLocalTax3 : item.WTHD_RSDTX_AJMT_AMT
        						   , whLocalTax4 : item.WTHD_RSDTX_PAY_AMT
        						   , totTax : item.TOT_PAY_TXAMT
        						   , costDeptCode : item.CSTCT_CD
        						   , costDeptName : item.CSTCT_NM
							   		, txnId		  : item.TRSC_ID

        				   }
        				   jsonDclrDtlInfo.push(obj);
        			   })
              		   //jsonDclrDtlInfo = msg;
      				   grdDclrDtlInfo.rebuild();

	               }else if (workType === "SUM"){
	            	   jsonDclrDtlInfo.length = 0;
	            	   //var msg = convertArrayToCamelCase(data.cv_2)
	            	   data.cv_２.forEach(item=>{
        				   let obj = {
        						   jobYyyymm : item.BLN_YM
        						   , payYyyymm : item.SLRY_YM
        						   , submitYyyymm : item.SBMSN_YM
        						   , taxSiteCode : item.TX_SITE_CD
        						   , workRegionName : item.WORK_RGN_NM
        						   , empCode : item.EMP_CD
        						   , empName : item.EMP_NM
        						   , deptName : item.DEPT_NM
        						   , gubunCode : item.SE_CD
        						   , gubunName : item.SE_NM
        						   , reasonCode : item.RSN_CD
        						   , reasonCode : item.RSN_CD
        						   , reasonName : item.RSN_NM
        						   , socialNumDate : item.RRNO_BRDT
        						   , payDate : item.PAY_YMD
        						   , docDate : item.SLIP_YMD
        						   , docName : item.SLIP_NM
        						   , docDesc : item.SLIP_DSCTN
        						   , payTotAmt : item.EARN_TOT_AMT
        						   , payTotAmt2 : item.EARN_TOT_AMT2
        						   , taxFreeAmt : item.TX_TXFR_AMT
        						   , payTotAmt3 : item.EARN_TOT_AMT3
        						   , payTotAmt4 : item.EARN_TOT_AMT4
        						   , payTotAmt5 : item.EARN_TOT_AMT5
        						   , payTotAmt6 : item.EARN_TOT_AMT6
        						   , payTotAmt7 : item.EARN_TOT_AMT7
        						   , payTotAmt8 : item.EARN_TOT_AMT8
        						   , payTotAmt9 : item.EARN_TOT_AMT9
        						   , payTotAmt10 : item.TXFR_ALWNC_AMT10
        						   , payTotAmt11 : item.TXFR_ALWNC_AMT11
        						   , payTotAmt12 : item.TXFR_ALWNC_AMT12
        						   , payTotAmt13 : item.TXFR_ALWNC_AMT13
        						   , whIncomeTax1 : item.WTHD_INCTX_AMT
        						   , whIncomeTax2 : item.WTHD_INCTX_RMBR_AMT
        						   , whIncomeTax3 : item.WTHD_INCTX_AJMT_AMT
        						   , whIncomeTax4 : item.WTHD_INCTX_PAY_AMT
        						   , whLocalTax1 : item.WTHD_RSDTX_AMT
        						   , whLocalTax2 : item.WTHD_RSDTX_RMBR_AMT
        						   , whLocalTax3 : item.WTHD_RSDTX_AJMT_AMT
        						   , whLocalTax4 : item.WTHD_RSDTX_PAY_AMT
        						   , totTax : item.TOT_PAY_TXAMT
        						   , costDeptCode : item.CSTCT_CD
        						   , costDeptName : item.CSTCT_NM



        				   }
        				   jsonDclrDtlInfo.push(obj);
        			   })
              		   //jsonDclrDtlInfo = msg;
	                   grdDclrDtlInfo.rebuild();

	               }else if(workType === "DEF"){
	            	   let numCheckCount = 0;

	            	   allData.forEach(item=>{
	            		   if(item.chkYn === "Y"){
	            			   numCheckCount = numCheckCount + 1;
	            			   paramObj["V_P_ORIGINAL_FLAG"] = "";
	            			   paramObj["V_P_CHKALL_YN"] = "";
	            		   }
	            	   })
	            	   if (numCheckCount == 0){
                        //SetMessageBox("처리대상이 없습니다.");
                        return false;
                       }

	            	   const postJsonPromise2 = gfn_postJSON("/hr/hra/selectHra8200Q.do", {
			           	getType				: 'json',
			           	workType			:  workType,
			           	cv_count			: '2',
			           	params				: gfnma_objectToString(paramObj)
			   			});

			        	const data2 = await postJsonPromise;
			        	console.log('data:', data2);
			        	jsonDclrDtlInfo.length = 0;
			        	data2.cv_3.forEach((item, index) => {

	        			   jsonDclrDtlInfo.push(item);
	        		   })
	                   grdDclrDtlInfo.rebuild();

	               }else if(workType === "DEF_CANCEL"){
	            	   let numCheckCount = 0;
	            	   allData.forEach(item=>{
	            		   if(item.chkYn === "Y"){
	            			   numCheckCount = numCheckCount + 1;
	            			   paramObj["V_P_ORIGINAL_FLAG"] = "";
	            			   paramObj["V_P_CHKALL_YN"] = "";
	            		   }
	            	   })
	            	   if (numCheckCount == 0){
	                        //SetMessageBox("처리대상이 없습니다.");
	                        return false;
	                       }

	            	   const postJsonPromise3 = gfn_postJSON("/hr/hra/selectHra8200Q.do", {
				           	getType				: 'json',
				           	workType			:  workType,
				           	cv_count			: '2',
				           	params				: gfnma_objectToString(paramObj)
				   			});

				        	const data3 = await postJsonPromise;
				        	console.log('data:', data3);

		                   data3.cv_3.forEach((item, index) => {
		        			   jsonDclrDtlInfo.push(item);
		        		   })
		                   grdDclrDtlInfo.rebuild();

	               }/*else if(workType === "REPORT"){
	                   //리포트용 데이터 셋 정리 후 리포트 호출?

	               }*/
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


    const fnQRY_P_HRA8200_Q_DEF = async function(workType){
    	//grdDclrDtlInfo
    	let rowData = grdDclrList.getRowData(grdDclrList.getRow());
    	let allData = grdDclrList.getGridDataAll();
    	let originalFlag = SBUxMethod.get("srch-chk-originalFlag")['srch-chk-originalFlag'];
    	let allYn = SBUxMethod.get("srch-chk-allYn")['srch-chk-allYn'];
    	var paramObj = {
      			V_P_DEBUG_MODE_YN	: ''
      			,V_P_LANG_ID		: ''
      			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
      			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
      			,V_P_SUBMIT_YYYYMM_FR : ''
      			,V_P_SUBMIT_YYYYMM_TO : ''
      			,V_P_SUBMIT_YYYYMM    : workType == "LIST" ? "" : rowData.submitYyyymm
      			,V_P_JOB_YYYYMM       : workType == "LIST" ? "" : rowData.jobYyyymm
      			,V_P_PAY_YYYYMM       : workType == "LIST" ? "" : rowData.payYyyymm
      			,V_P_PAY_AREA_TYPE    : ''
      			,V_P_ORIGINAL_FLAG    : originalFlag
      			,V_P_CHKALL_YN        : allYn
      			,V_P_FORM_ID		: p_formId
      			,V_P_MENU_ID		: p_menuId
      			,V_P_PROC_ID		: ''
      			,V_P_USERID			: ''
      			,V_P_PC				: ''
      	    };

    	 let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_",["submitYyyymm","jobYyyymm","payYyyymm","originalFlag","chkallYn"]);
	 	 if(!postFlag){
	 	    return;
	 	 }

        const postJsonPromise = gfn_postJSON("/hr/hra/selectHra8200Q.do", {
           	getType				: 'json',
           	workType			:  workType,
           	cv_count			: '2',
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

    const fnSET_P_HRA8200_S = async function(workType){
    	let siteCode = gfnma_multiSelectGet("#srch-slt-siteCode");
    	let dclrData = grdDclrDtlInfo.getGridDataAll();
    	let paramObjList = [];
    	dclrData.forEach(row => {

    		var paramObj = {
         			V_P_DEBUG_MODE_YN	: ''
         			,V_P_LANG_ID		: ''
         			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
         			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
         			, V_P_JOB_YYYYMM : row.jobYyyymm
         			, V_P_PAY_YYYYMM : row.payYyyymm
         			, V_P_SUBMIT_YYYYMM : row.submitYyyymm
         			, V_P_TAX_SITE_CODE : row.taxSiteCode
         			, V_P_WORK_REGION_NAME : row.workRegionName
         			, V_P_EMP_CODE : row.empCode
         			, V_P_EMP_NAME : row.empName
         			, V_P_DEPT_NAME : row.deptName
         			, V_P_GUBUN_CODE : row.gubunCode
         			, V_P_GUBUN_NAME : row.gubunName
         			, V_P_REASON_CODE : row.reasonCode
         			, V_P_REASON_NAME : row.reasonName
         			, V_P_SOCIAL_NUM_DATE : row.socialNumDate
         			, V_P_PAY_DATE : row.payDate
         			, V_P_DOC_DATE : row.docDate
         			, V_P_DOC_NAME : row.docName
         			, V_P_PAY_TOT_AMT : row.payTotAmt
         			, V_P_PAY_TOT_AMT2 : row.payTotAmt2
         			, V_P_TAX_FREE_AMT : row.taxFreeAmt
         			, V_P_PAY_TOT_AMT3 : row.payTotAmt3
         			, V_P_PAY_TOT_AMT4 : row.payTotAmt4
         			, V_P_PAY_TOT_AMT5 : row.payTotAmt5
         			, V_P_PAY_TOT_AMT6 : row.payTotAmt6
         			, V_P_PAY_TOT_AMT7 : row.payTotAmt7
         			, V_P_PAY_TOT_AMT8 : row.payTotAmt8
         			, V_P_PAY_TOT_AMT9 : row.payTotAmt9
         			, V_P_PAY_TOT_AMT10 : row.payTotAmt10
         			, V_P_PAY_TOT_AMT11 : row.payTotAmt11
         			, V_P_PAY_TOT_AMT12 : row.payTotAmt12
         			, V_P_PAY_TOT_AMT13 : row.payTotAmt13
         			, V_P_WH_INCOME_TAX1 : row.whIncomeTax1
         			, V_P_WH_INCOME_TAX2 : row.whIncomeTax2
         			, V_P_WH_INCOME_TAX3 : row.whIncomeTax3
         			, V_P_WH_INCOME_TAX4 : row.whIncomeTax4
         			, V_P_WH_LOCAL_TAX1 : row.whLocalTax1
         			, V_P_WH_LOCAL_TAX2 : row.whLocalTax2
         			, V_P_WH_LOCAL_TAX3 : row.whLocalTax3
         			, V_P_WH_LOCAL_TAX4 : row.whLocalTax4
         			, V_P_TOT_TAX : row.totTax
         			, V_P_TXN_ID : row.txnId
         			, V_P_DEF_YN : row.defYn
         			,V_P_FORM_ID		: p_formId
         			,V_P_MENU_ID		: p_menuId
         			,V_P_PROC_ID		: ''
         			,V_P_USERID			: ''
         			,V_P_PC				: ''
         	    };
    		//paramObjList.push(paramObj);
    	})
    	// txn_id는 감가상각리스트에서 우클릭 후 컬럼설정창에서 id  컬럼 누르면 조회된다

         const postJsonPromise = gfn_postJSON("/hr/hra/insertHra8200.do", {
          	getType				: 'json',
          	workType			:  strWorkType,
          	cv_count			: '0',
          	params				: gfnma_objectToString(paramObjList)
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

    //집계버튼
    const fn_cancelClick = function (){
        if (fnQRY_P_HRA8200_Q("SUM")){
        	queryClick();
        }
    }

    //확정버튼
    const fn_defBtnClick = async function(){
    	let allData = grdDclrDtlInfo.getGridDataAll();
    	allData.forEach(item => {
    		var paramObj = {
          			V_P_DEBUG_MODE_YN	: ''
          			,V_P_LANG_ID		: ''
          			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
          			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
          			,V_P_SUBMIT_YYYYMM_FR : ''
          			,V_P_SUBMIT_YYYYMM_TO : ''
          			,V_P_SUBMIT_YYYYMM    : item.submitYyyymm
          			,V_P_JOB_YYYYMM       : item.jobYyyymm
          			,V_P_PAY_YYYYMM       : item.payYyyymm
          			,V_P_PAY_AREA_TYPE    : ''
          			,V_P_ORIGINAL_FLAG    : originalFlag
          			,V_P_CHKALL_YN        : allYn
          			,V_P_FORM_ID		: p_formId
          			,V_P_MENU_ID		: p_menuId
          			,V_P_PROC_ID		: ''
          			,V_P_USERID			: ''
          			,V_P_PC				: ''
          	    };
    		fnQRY_P_HRA8200_Q_DEF_TEST(param)
    	})


    }

    const fnQRY_P_HRA8200_Q_DEF_TEST = async function(param){
    	await fnQRY_P_HRA8200_Q_DEF(param);
    }

    //확정취소
    const fn_defCancelClick = async function(){
        await fnQRY_P_HRA8200_Q("DEF_CANCEL");
        queryClick();
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


    // 사용 예시
    try {
      console.log(calculateToDate("202501", 3));  // 출력: "202504"
      console.log(calculateToDate("202501", -3)); // 출력: "202410"
    } catch (error) {
      console.error(error.message);
    }
    

    const fn_clclnListAddRow = function(){
    	grdClclnList.addRow();
    }

    const fn_clclnTrgtAddRow = function(){
    	grdClclnTrgt.addRow();
    }

    const fn_clclnDsctnAddRow = function(){
    	grdClclnDsctn.addRow();
    }

    const fn_clclnListDelRow = function(){
    	grdClclnList.deleteRow(grdClclnList.getRows()-1)
    }

    const fn_clclnTrgtDelRow = function(){
    	grdClclnTrgt.deleteRow(grdClclnTrgt.getRows()-1)
    }

    const fn_clclnDsctnDelRow = function(){
    	grdClclnDsctn.deleteRow(grdClclnDsctn.getRows()-1)
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
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
