<%
/**
 * @Class Name 		: fia5200.jsp
 * @Description 	: 감가상각계산
 * @author 			:
 * @since 			: 2024.07.04
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 감가상각계산 </title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 자산정산내역 -->
                </div>
                <div style="margin-left: auto;">
                	<sbux-button id="btnDprcRkng" name="btnDprcRkng" 	uitype="normal" text="감가상각계산" class="btn btn-sm btn-outline-danger" onclick="fn_calculationClick"></sbux-button>
                    <sbux-button id="btnDprcRtrcn" name="btnDprcRtrcn" 	uitype="normal" text="감가상각취소" class="btn btn-sm btn-outline-danger" onclick="fn_calculationCancleClick"></sbux-button>
                </div>
            </div>
            <div class="box-body">


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
                            <td colspan="2" class="td_input" style="border-right:hidden;">
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
                            <td colspan="2" class="td_input" style="border-right:hidden;">
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
                            <td colspan="2" class="td_input" style="border-right:hidden;">

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
                            <th scope="row" class="th_bg">감가상각년월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-depreciationYyyymm"
									name="srch-dtp-depreciationYyyymm"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode="month"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									group-id="search1"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">

							</td>
                            <th scope="row" class="th_bg">감가상각기준</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-depreciationType" name="srch-slt-depreciationType" class="form-control input-sm" uitype="single" jsondata-ref="jsonDprcCrtr" group-id="search1" ></sbux-select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>

                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="7" class="td_input" style="border-right:hidden;">
								<sbux-input uitype="text" id="srch-inp-memomemo" name="srch-inp-memomemo" class="form-control input-sm"></sbux-input>
                            </td>

                        </tr>
                    </tbody>
                </table>


				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>실행내역</span>
							</li>

						</ul>

					</div>


					<div id="sb-area-grdAstClsfList" style="height:258px;width:100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>감가상각로그</span>
							</li>

						</ul>

					</div>


					<div id="sb-area-grdDprcHstry" style="height:258px;width:100%"></div>

				</div>



				</div>

			</div>


    </section>

	<!-- 팝업 Modal -->


</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	var gv_ma_selectedApcCd	= '${loginVO.apcCd}';
	var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId = '${loginVO.id}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역
	var jsonDprcCrtr = [];//감가상각기준
	var jsonCorp = []; //법인
	var jsonBizUnit = []; //사업단위
	var jsonBplc = [];//사업장

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
		fn_queryClick();
	}



	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-compCode1'], jsonCorp, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
			//회계단위
			gfnma_multiSelectInit({
				target			: ['#srch-slt-fiOrgCode']
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
			gfnma_setComSelect(['srch-slt-bplc'], jsonBplc, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
			//사업단위
			gfnma_setComSelect(['srch-slt-fiOrgCode'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			//감가상각기준
			gfnma_setComSelect(['srch-slt-depreciationType'], jsonDprcCrtr, 'L_FIA018', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);

		SBUxMethod.set("srch-slt-depreciationType","2");

		let yyyymm = gfnma_date6().substring(0,6);
		SBUxMethod.set("srch-dtp-depreciationYyyymm",yyyymm);
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();
    	fn_createGrid2();
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
    var grdDprcHstry; 			// 그리드를 담기위한 객체 선언
    var jsonDprcHstry = []; 	// 그리드의 참조 데이터 주소 선언

    var grdAstClsfList;
    var jsonAstClsfList = [];


    //json
    var jsonCorp = []; //법인
    var jsonBizUnit = []; //사업단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdAstClsfList';
	    SBGridProperties.id 				= 'grdAstClsfList';
	    SBGridProperties.jsonref 			= 'jsonAstClsfList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{
        		caption: ["<input type='checkbox' id='allCheckbox' onchange='fn_checkAll(this);'>"], 			ref: 'checkYn', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
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
            {caption: ["사업단위"], 	ref: 'fiOrgCode',    	type : 'combo', typeinfo : {ref:'jsonBizUnit', label:'label', value:'value', oneclickedit: true},  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],  		ref: 'siteCode',    			type : 'combo', typeinfo : {ref:'jsonBplc', label:'label', value:'value', oneclickedit: true},  	width:'100px',  	style:'text-align:left'},
            {caption: ["확정여부"],    	ref: 'confirmFlag', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표ID"],		ref: 'docId',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["데이터건수"], 		ref: 'recordCount', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["최종실행회수"], 		ref: 'lastRunCount',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["처리자"], 	ref: 'insertUserId', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처리PC"], 		ref: 'insertPc', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'memo', 				type:'output',		width:'80px',		style:'text-align:center'},

        ];

        grdAstClsfList = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }

    function fn_createGrid2() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDprcHstry';
	    SBGridProperties.id 				= 'grdDprcHstry';
	    SBGridProperties.jsonref 			= 'jsonDprcHstry';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["연번"],			ref: 'runCount', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업단위"],  	ref: 'fiOrgCode',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],      	ref: 'siteCode', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["처리자"],			ref: 'insertUserid',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["시작시간"], 			ref: 'actionStartTime', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["종료시간"], 		ref: 'actionEndTime',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["수행시간(초)"], 		ref: 'actionRunTime', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처리PC"], 		ref: 'insertPc', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'memo', 				type:'output',		width:'80px',		style:'text-align:center'},
        ];

        grdDprcHstry = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }




    const fn_queryClick = async function() {
        //if (!ValidateControls(panHeader))
        //    return;
    	if(!SBUxMethod.validateRequired({group_id: 'search1'})){
			return false;
		}
    	let siteCode = gfnma_multiSelectGet("#srch-slt-siteCode");
    	if(siteCode === ""){
    		return false;
    	}

        await fnQRY_P_FIA5200_Q("INFO");
		await fnQRY_P_FIA5200_Q("LOG");
	}

    //strWorkType : INFO, LOG
    const fnQRY_P_FIA5200_Q = async function(strWorkType){

    	 var paramObj = {
      			V_P_DEBUG_MODE_YN	: ''
      			,V_P_LANG_ID		: ''
      			,V_P_COMP_CODE		: gv_ma_selectedApcCd
      			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
      		    ,V_P_FI_ORG_CODE    : ''
      		    ,V_P_DEPRECIATION_YYYYMM : ''
      		    ,V_P_DEPRECIATION_TYPE   : ''
      		    ,V_P_SITE_CODE           : ''
      			,V_P_FORM_ID		: p_formId
      			,V_P_MENU_ID		: p_menuId
      			,V_P_PROC_ID		: ''
      			,V_P_USERID			: ''
      			,V_P_PC				: ''
      	    };

    	 let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_","memomemo");
	 	 if(!postFlag){
	 	    return;
	 	 }

          const postJsonPromise = gfn_postJSON("/fi/fia/selectFia5200.do", {
           	getType				: 'json',
           	workType			:  strWorkType,
           	cv_count			: '1',
           	params				: gfnma_objectToString(paramObj)
   			});

        	const data = await postJsonPromise;
        	console.log('data:', data);
          // 비즈니스 로직 정보
           try {


	          if (_.isEqual("S", data.resultStatus)) {
	              //gfn_comAlert("I0001");
	        	  //info, log에 따라서 그리드에 데이터 넣어주는듯
	        	   if (strWorkType == "LOG"){
	        		   //grdDprcHstry
        			   var msg = convertArrayToCamelCase(data.cv_1)
        			   jsonDprcHstry = msg;
        			   grdDprcHstry.rebuild();
	               }
	               else if (strWorkType == "INFO"){
	            	   //grdAstClsfList
	            	   var msg = convertArrayToCamelCase(data.cv_1)
        			   jsonAstClsfList = msg;
        			   grdAstClsfList.rebuild();
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
	// 감가상각계산클릭
    const fn_calculationClick = async function() {

		 //자산분류리스 그리드에 행 없으면 return
    	 //if (gvwInfo.FocusedRowHandle < 0)
         //    return;


         let bresult = false;

         let intmax_seq = 0;
         let intprogram_seq = 1;
         let strsite_code = "";
		 let depreciationType = SBUxMethod.get("srch-slt-depreciationType");

         let data = grdAstClsfList.getGridDataAll();

      // 자산분류리스 체크열 값이 y인 경우 site_code 값에 따라 fnSET_P_FIA5200_S(조회,회계기준과 지역코드를 기준으로 조회)
		 // cbodepreciation_type : 감가상각기준
         data.forEach(item => {
        	 if(item.checkYn === "Y"){
        			//자산분류리스의 체크열값이 Y인 경우 intmax_seq + 1
     			intmax_seq = intmax_seq + 1;
     			bresult = false;
     			strsite_code = item.siteCode;
     			if(depreciationType === "1"){
     				bresult = fnSET_P_FIA5200_S("GAAP", strsite_code);
     			}else if(depreciationType === "2"){
     				bresult = fnSET_P_FIA5200_S("IFRS", strsite_code);
     			}else if(depreciationType === "3"){
     				bresult = fnSET_P_FIA5200_S("TAX", strsite_code);
     			}else{
     				gfn_comAlert("I0001"); //감가상각기준을 선택하여주시기 바랍니다.
     			}
     			intprogram_seq = intprogram_seq + 1;
     			if (!bresult){
     				//break;
     			}

        	 }
         })



         if (bresult){
             fn_queryClick();
         }
  	}

 	// 감가상각계산취소 클릭
    const fn_calculationCancleClick = async function() {


    	//자산분류리스 그리드에 행 없으면 return
    	//if (gvwInfo.FocusedRowHandle < 0)
        //    return;


        let bresult = false;

        let intmax_seq = 0;
        let strsite_code = "";

        let data = grdAstClsfList.getGridDataAll();
        let intprogram_seq = 1;

        //data.forEach(item => {
        for (const item of data){
	       	 if(item.checkYn === "Y"){
	       			//자산분류리스의 체크열값이 Y인 경우 intmax_seq + 1
	    			intmax_seq = intmax_seq + 1;
	    			bresult = false;
	    			strsite_code = item.siteCode;
	   				bresult = await fnSET_P_FIA5200_S("CANCEL", strsite_code);
	    			intprogram_seq = intprogram_seq + 1;
	    			if (!bresult){
	    				//break;
	    			}

	       	 }
        }

        if (bresult){
        	fn_queryClick();
        }
  	}

	//조회
	// srrWorkType : GAAP, IFRS, TAX, CANCLE
    const fnSET_P_FIA5200_S = async function(strWorkType,strSiteCodeP){
    	 var paramObj = {
      			V_P_DEBUG_MODE_YN	: ''
      			,V_P_LANG_ID		: ''
      			,V_P_COMP_CODE		: gv_ma_selectedApcCd
      			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
      			,V_P_DEPRECIATION_YYYYMM : ''
      			,V_P_DEPRECIATION_TYPE   : ''
      			,V_P_SITE_CODE           : ''
      			,V_P_MEMO                : ''
      			,V_P_FORM_ID		: p_formId
      			,V_P_MENU_ID		: p_menuId
      			,V_P_PROC_ID		: ''
      			,V_P_USERID			: ''
      			,V_P_PC				: ''
      	    };

    	 let postFlag = gfnma_getTableElement("searchTable","srch-",paramObj,"V_P_",["memomemo"]);
 		 if(!postFlag){
 	        return;
 	     }

          const postJsonPromise = gfn_postJSON("/fi/fia/insertFia5200.do", {
           	getType				: 'json',
           	workType			:  strWorkType,
           	cv_count			: '0',
           	params				: gfnma_objectToString(paramObj)
   			});

          const data = await postJsonPromise;
          // 비즈니스 로직 정보
           try {
          if (_.isEqual("S", data.resultStatus)) {
              gfn_comAlert("I0001");
              //fn_search();
              return true;
          } else {
              alert(data.resultMessage);
			  return false;
          }

 	        } catch (e) {
 	            if (!(e instanceof Error)) {
 	                e = new Error(e);
 	            }
 	            console.error("failed", e.message);
 	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
 	        }
    }

  	//조회? 확인 후 다시 정리
	// srrWorkType : LOG,INFO
    const fnSET_P_FIA5200_Q = async function(strWorkType){
    	 var paramObj = {
      			V_P_DEBUG_MODE_YN	: ''
      			,V_P_LANG_ID		: ''
      			,V_P_COMP_CODE		: gv_ma_selectedApcCd
      			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
      			,V_P_ACCT_RULE_CODE	: NATION_CODE
      			,V_P_TXN_ID_D       : strtxn_id
      			,V_P_CIP_TRANSFER_NO_D : strcip_no
      			,V_P_TXN_DATE_D	    : strtxn_date
      			,V_P_FORM_ID		: p_formId
      			,V_P_MENU_ID		: p_menuId
      			,V_P_PROC_ID		: ''
      			,V_P_USERID			: ''
      			,V_P_PC				: ''
      	    };

          const postJsonPromise = gfn_postJSON("/fi/fia/searchFia5200.do", {
           	getType				: 'json',
           	workType			:  strWorkType,
           	cv_count			: '1',
           	params				: gfnma_objectToString(paramObj)
   			});

        	const data = await postJsonPromise;
          // 비즈니스 로직 정보
           try {
          if (_.isEqual("S", data.resultStatus)) {
              gfn_comAlert("I0001");
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

    /**
     * @name fn_checkAll
     * @description 자산분류리스트 전체 체크/체크해제
     * @param {checkbox} obj
     */
	const fn_checkAll = function(obj) {
    	const data = grdAstClsfList.getGridDataAll();
        const checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<data.length; i++ ){
        	grdAstClsfList.setCellData(i+1, 0, checkedYn, true, false);
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
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>