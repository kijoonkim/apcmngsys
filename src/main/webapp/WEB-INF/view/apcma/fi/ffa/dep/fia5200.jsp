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
    	let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
    	let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");

    	if(inptYmdFrom > inptYmdTo){
    		gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    		return;
    	}
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




</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>