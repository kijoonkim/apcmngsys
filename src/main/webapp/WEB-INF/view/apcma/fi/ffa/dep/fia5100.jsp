<%
/**
 * @Class Name 		: fia5100.jsp
 * @Description 	: 감가상각 일시중지등록
 * @author 			:
 * @since 			: 2024.07.03
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
	<title>title : 감가상각 일시중지등록 </title>
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
                    </h3><!-- 감가상각 일시중지등록-->
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
									<sbux-select id="srch-slt-bplc2" name="srch-slt-bplc2" class="form-control input-sm" uitype="single" jsondata-ref="jsonBplc"></sbux-select>
                            </td>
                            <td></td>


                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">중지시작년월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopBgngYmdFrom"
									name="srch-dtp-stopBgngYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-stopBgngYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopBgngYmdTo"
									name="srch-dtp-stopBgngYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-stopBgngYmdTo)"
								></sbux-datepicker>
							</td>
                            <th scope="row" class="th_bg">중지종료년월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopEndYmdFrom"
									name="srch-dtp-stopEndYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-stopEndYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopEndYmdTo"
									name="srch-dtp-stopEndYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-stopEndYmdTo)"
								></sbux-datepicker>
							</td>
							<th scope="row" class="th_bg">회계기준</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-acntgCrtrTest" name="srch-slt-acntgCrtr1" class="form-control input-sm"  uitype="single" jsondata-ref="jsonAcntgCrtr"></sbux-select>
                            </td>

                        </tr>
                        <tr>
                        	<th scope="row" class="th_bg">담당부서</th>
                        	<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-dspsTab-tckgDept1" name="srch-inp-dspsTab-tckgDept1" class="form-control input-sm" uitype="text" ></sbux-input>
                            </td>
                            <td  class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-dspsTab-tckgDept2" name="srch-inp-dspsTab-tckgDept2" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">담당자</th>
                        	<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-dspsTab-pic1" name="srch-inp-dspsTab-pic1" class="form-control input-sm" uitype="text" ></sbux-input>
                            </td>
                            <td  class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-dspsTab-pic2" name="srch-inp-dspsTab-pic2" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
                            </td>
                        </tr>
                    </tbody>
                </table>


				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>감가상각 일시정지 리스트</span>
							</li>
						</ul>
					</div>


					<div id="sb-area-grdDprcDtStopList" style="height:258px;width:100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>감가상각 일시정지 내역 편집</span>
							</li>
						</ul>
						<div style="margin-left: auto;">
							<sbux-button id="btnDisposal" name="btnDisposal" 	uitype="normal" text="처분 전표" class="btn btn-sm btn-outline-danger" onclick="fn_disposal"></sbux-button>
                    		<sbux-button id="btnExpense" name="btnExpense" 	uitype="normal" text="비용 전표" class="btn btn-sm btn-outline-danger" onclick="fn_expense"></sbux-button>
						</div>
					</div>
					<table class="table table-bordered tbl_fixed">
		                    <caption>자산내역</caption>
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
		                            <th scope="row" class="th_bg">중지처리일</th>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-datepicker
											id="srch-dtp-stopPrcsYmd"
											name="srch-dtp-stopPrcsYmd"
											uitype="popup"
											date-format="yyyy-mm-dd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											onchange="fn_dtpChange(srch-dtp-stopPrcsYmd)"
										></sbux-datepicker>
		                            </td>
		                            <td></td>
		                            <th scope="row" class="th_bg">사업장</th>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-select id="srch-slt-bplc1" name="srch-slt-bplc1" class="form-control input-sm"  uitype="single" jsondata-ref="jsonBplc"></sbux-select>
		                            </td>

		                        </tr>
		                        <tr>
		                            <th scope="row" class="th_bg">자산번호</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-astNo1" name="srch-inp-astNo1" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
		                            <td class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-astNo2" name="srch-inp-astNo2" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
		                            <td>
		                            </td>
									<th scope="row" class="th_bg">회계기준</th>
		                            <td  colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-select id="srch-slt-acntgCrtr2" name="srch-slt-acntgCrtrTest" class="form-control input-sm"  uitype="single" jsondata-ref="jsonAcntgCrtr"></sbux-select>
		                            </td>
		                            <td>
		                            </td>
		                            <th scope="row" class="th_bg">취득금액</th>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-acqsAmt" name="srch-inp-acqsAmt" class="form-control input-sm" uitype="text" wrap-style="width:100%"></sbux-input>
		                            </td>
		                        </tr>
                    		     <tr>
                    		     	<th scope="row" class="th_bg">중지시작년월</th>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-datepicker
											id="srch-dtp-stopBgngYmd"
											name="srch-dtp-stopBgngYmd"
											uitype="popup"
											date-format="yyyy-mm-dd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											onchange="fn_dtpChange(srch-dtp-stopBgngYmd)"
										></sbux-datepicker>
		                            </td>
		                            <td style="border-right:hidden;"></td>

		                            <th scope="row" class="th_bg">중지종료년월</th>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
		                            	<sbux-datepicker
											id="srch-dtp-stopEndYmd"
											name="srch-dtp-stopEndYmd"
											uitype="popup"
											date-format="yyyy-mm-dd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											onchange="fn_dtpChange(srch-dtp-stopEndYmd)"
										></sbux-datepicker>

		                            </td>
		                            <td style="border-right:hidden;"></td>

		                            <th scope="row" class="th_bg">보조금금액</th>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-asstncAmt" name="srch-inp-asstncAmt" class="form-control input-sm" uitype="text" wrap-style="width:100%"></sbux-input>
		                            </td>
                                 </tr>

		                        <tr>
		                            <th scope="row" class="th_bg">담당부서</th>
									<td  class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-tkcgDept1" name="srch-inp-tkcgDept1" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
		                            <td class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-tkcgDept2" name="srch-inp-tkcgDept2" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
									<td></td>

		                            <th scope="row" class="th_bg">담당자</th>
		                            <td  class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-pic1" name="srch-inp-pic1" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_astBtnPopup" wrap-style="width:100%"></sbux-input>
		                            </td>
		                            <td  class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-pic2" name="srch-inp-pic2" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
		                            <td></td>
		                        </tr>
		                        <tr>
		                        	<th scope="row" class="th_bg">비고</th>
		                            <td colspan="9" style="border-right:hidden;">
											<sbux-textarea id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm" uitype="normal" rows="3"></sbux-textarea>
		                            </td>

		                        </tr>
		                    </tbody>
		                </table>

				</div>



				</div>

			</div>


    </section>



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
		]);


	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();

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
    var grdDprcDtStopList; 			// 그리드를 담기위한 객체 선언
    var jsonDprcDtStopList= []; 	// 그리드의 참조 데이터 주소 선언



    //json
    var jsonCorp = []; //법인
    var jsonBizUnit = []; //사업단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdDprcDtStopList';
	    SBGridProperties.id 				= 'grdDprcDtStopList';
	    SBGridProperties.jsonref 			= 'jsonDprcDtStopList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["중지처리일"],		ref: 'clclnNo', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업단위"], 	ref: 'clclnYmd',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],  		ref: 'bplc',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산번호"],    	ref: 'acps', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산명"],		ref: 'acntgCrtr',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["담당부서"], 		ref: 'currency', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["담당자"], 		ref: 'exchngRt',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["중지시작년월"], 	ref: 'clclnGramt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["중지종료년월"], 		ref: 'rmrk', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["취득금액"], 		ref: 'slipNm', 				type:'output',		width:'80px',		style:'text-align:center'}
        ];

        grdDprcDtStopList = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }



    /**
     * 목록 조회
     */
    const fn_search = async function() {
    	fn_setNationInGrid();
    }

    /**
     * 목록 가져오기
     */
    const fn_setNationInGrid = async function() {

		NationInGrid.clearStatus();

		let NATION_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_NATION_CODE"));
		let NATION_NAME	= gfnma_nvl(SBUxMethod.get("SRCH_NATION_NAME"));

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

	const fn_compopup1 = function(list) {

		var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_TXTEMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";

     	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
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
    	//let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
    	//let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");

    	//if(inptYmdFrom > inptYmdTo){
    	//	gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    	//	SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    	//	SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    	//	return;
    	//}
     }







</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>