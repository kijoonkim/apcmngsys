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
                	<sbux-button id="btnDprcRkng" name="btnDprcRkng" 	uitype="normal" text="감가상각계산" class="btn btn-sm btn-outline-danger" onclick="fn_btnDprcrkng"></sbux-button>
                    <sbux-button id="btnDprcRtrcn" name="btnDprcRtrcn" 	uitype="normal" text="감가상각취소" class="btn btn-sm btn-outline-danger" onclick="fn_btnDprcRtrcn"></sbux-button>
                </div>
            </div>
            <div class="box-body">


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
									<sbux-select id="srch-slt-corp" name="srch-slt-corp" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
                            </td>
                            <td></td>

                            <th scope="row" class="th_bg">사업단위</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-bizUnit" name="srch-slt-bizUnit" class="form-control input-sm" uitype="single" jsondata-ref="jsonBizUnit"></sbux-select>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-bplc" name="srch-slt-bplc" class="form-control input-sm" uitype="single" jsondata-ref="jsonBplc"></sbux-select>
                            </td>
                            <td></td>


                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">감가상각년월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-dprcYm"
									name="srch-dtp-dprcYm"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-clclnYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">

							</td>
                            <th scope="row" class="th_bg">감가상각기준</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-dprcCrtr" name="srch-slt-dprcCrtr" class="form-control input-sm" uitype="single" jsondata-ref="jsonDprcCrtr"></sbux-select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>

                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="7" class="td_input" style="border-right:hidden;">
									<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm"></sbux-input>
                            </td>

                        </tr>
                    </tbody>
                </table>


				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>자산분류리스트</span>
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

	// ${comMenuVO.menuId}

	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역




	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-corp'], jsonCorp, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//사업장
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
			//사업단위
			gfnma_setComSelect(['srch-slt-bizUnit'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			//감가상각기준
			gfnma_setComSelect(['srch-slt-dprcCrtr'], jsonDprcCrtr, 'L_FIA018', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);

		SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateLastYmd(new Date()));
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
        		caption: [""], 			ref: 'checkedYn', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
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
            {caption: ["연번"],		ref: 'clclnNo', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업단위"], 	ref: 'bizUnit',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],  		ref: 'bplc',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["확정여부"],    	ref: 'cmptnYn', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표ID"],		ref: 'slipId',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["데이터건수"], 		ref: 'dataNocs', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["최종실행회수"], 		ref: 'lastExcnNmtm',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["처리자"], 	ref: 'prcsPrsn', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처리PC"], 		ref: 'prcsPc', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk', 				type:'output',		width:'80px',		style:'text-align:center'},

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
            {caption: ["연번"],			ref: 'sn', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업단위"],  	ref: 'bizUnit',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],      	ref: 'biz', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["처리자"],			ref: 'astNo',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["시작시간"], 			ref: 'astNm', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["종료시간"], 		ref: 'clclnAmt',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["수행시간(초)"], 		ref: 'acqsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처리PC"], 		ref: 'lgcClclnAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
        ];

        grdDprcHstry = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }




    const fn_queryClick = async function() {
    {
        //if (!ValidateControls(panHeader))
        //    return;

        fnQRY_P_FIA5200_Q("INFO");
		fnQRY_P_FIA5200_Q("LOG");
	}

    //strWorkType : INFO, LOG
    const fnQRY_P_FIA5200_Q = async function(strWorkType){
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

          const postJsonPromise = gfn_postJSON("/fi/fia/insertFia5100.do", {
           	getType				: 'json',
           	workType			:  strWorkType,
           	cv_count			: '1',
           	params				: gfnma_objectToString(paramObj)
   			});

        	const data = await postJsonPromise;
          // 비즈니스 로직 정보
           try {
			   //info, log에 따라서 그리드에 데이터 넣어주는듯
        	   if (strWorkType == "LOG"){
                   //CommonProcessQuery(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo(), grdLog);
               }
               else if (strWorkType == "INFO"){
                   //CommonProcessQuery(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo(), grdInfo);
               }

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
	// 감가상각계산클릭
    const fn_calculationClick = async function() {

		 //자산분류리스 그리드에 행 없으면 return
    	 //if (gvwInfo.FocusedRowHandle < 0)
         //    return;


         let bresult = false;

         let intmax_seq = 0;
         let strsite_code = "";

         //자산분류리스의 체크열값이 Y인 경우 intmax_seq + 1
         for (int i = 0; i < gvwInfo.RowCount; i++){

             if (gvwInfo.GetValue(i, "check_yn").ToString() == "Y"){
                 intmax_seq = intmax_seq + 1;
             }

         }
		 // 자산분류리스 체크열 값이 y인 경우 site_code 값에 따라 fnSET_P_FIA5200_S(조회,회계기준과 지역코드를 기준으로 조회)
		 // cbodepreciation_type : 감가상각기준
         let intprogram_seq = 1;
         for (int i = 0; i < gvwInfo.RowCount; i++){
             if (gvwInfo.GetValue(i, "check_yn").ToString() == "Y"){
                 bresult = false;
                 strsite_code = gvwInfo.GetValue(i, "site_code").ToString();
                 if (cbodepreciation_type.EditValue.ToString() == "1"){
                     bresult = fnSET_P_FIA5200_S("GAAP", strsite_code);
                 }
                 else if (cbodepreciation_type.EditValue.ToString() == "2"){
                     bresult = fnSET_P_FIA5200_S("IFRS", strsite_code);
                 }
                 else if (cbodepreciation_type.EditValue.ToString() == "3"){
                     bresult = fnSET_P_FIA5200_S("TAX", strsite_code);
                 }
                 else{
                     SetMessageBox(GetFormMessage("FIA5200_002")); //감가상각기준을 선택하여주시기 바랍니다.
                     return;
                 }
                 intprogram_seq = intprogram_seq + 1;
                 if (!bresult)
                     break;
             }

         }
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
        for (int i = 0; i < gvwInfo.RowCount; i++){

            if (gvwInfo.GetValue(i, "check_yn").ToString() == "Y"){
                intmax_seq = intmax_seq + 1;
            }
        }

        let intprogram_seq = 1;
        for (int i = 0; i < gvwInfo.RowCount; i++){
            if (gvwInfo.GetValue(i, "check_yn").ToString() == "Y"){
                bresult = false;
                strsite_code = gvwInfo.GetValue(i, "site_code").ToString();
                bresult = fnSET_P_FIA5200_S("CANCEL", strsite_code);
                intprogram_seq = intprogram_seq + 1;
                if (!bresult)
                    break;
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





    const fn_dtpChange = async function(){
    	let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
    	let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");

    	if(inptYmdFrom > inptYmdTo){
    		gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    		return;
    	}
     }







</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>