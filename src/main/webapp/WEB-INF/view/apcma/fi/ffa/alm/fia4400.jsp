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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 자산정산내역 </title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 자산정산내역 -->
                </div>
                <div style="margin-left: auto;">
                	<sbux-button id="btnDspsSlip" name="btnDspsSlip" 	uitype="normal" text="처분 전표 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dspsSlipSearch"></sbux-button>
                    <sbux-button id="btnSlipCreate" name="btnSlipCreate" 	uitype="normal" text="전표생성" class="btn btn-sm btn-outline-danger" onclick="fn_slipCreate"></sbux-button>
                    <sbux-button id="btnSlipCancle" name="btnSlipCancle" 	uitype="normal" text="전표취소" class="btn btn-sm btn-outline-danger" onclick="fn_slipCancel"></sbux-button>
                </div>
            </div>
            <div class="box-body">
            	<!--[pp] 검색 -->
				<!--[APC] START -->
				<div style="display:none">
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				</div>
				<!--[APC] END -->


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
                            <th scope="row" class="th_bg">정산일자</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-clclnYmdFrom"
									name="srch-dtp-clclnYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-clclnYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-clclnYmdTo"
									name="srch-dtp-clclnYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-clclnYmdTo)"
								></sbux-datepicker>
							</td>
                            <th scope="row" class="th_bg">취득구분</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
							<div class="dropdown">
								    <button
								    	style="width:160px;text-align:left"
								    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
								    	type="button"
								    	id="srch-slt-acqsSe"
								    	data-toggle="dropdown"
								    	aria-haspopup="true"
								    	aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
								    </button>
									    <div class="dropdown-menu acqsSe" aria-labelledby="srch-slt-acqsSe" style="width:250px;height:150px;padding-top:0px;overflow:auto">
									    </div>
									</div>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg">프로젝트</th>
                            <td colspan="1" class="td_input" style="border-right:hidden;">
									<sbux-input uitype="text" id="srch-inp-biz" name="srch-inp-biz" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-bizPopup" name="srch-inp-bizPopup" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_bizPopup"></sbux-input>
                            </td>
                        </tr>
                        <tr>

                            <th scope="row" class="th_bg">정산번호</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-input uitype="text" id="srch-inp-clclnNo" name="srch-inp-clclnNo" class="form-control input-sm"></sbux-input>
                            </td>
                            <td></td>

                            <th scope="row" class="th_bg">회계기준</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-acntgCrtr" name="srch-slt-acntgCrtr" class="form-control input-sm" uitype="single" jsondata-ref="jsonAcntgCrtr"></sbux-select>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>


				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>자산정산리스트</span>
							</li>

						</ul>
						<div style="margin-left:auto;margin-top: 5px;">
								<sbux-button id="btnClclnListAddRow" name="btnClclnListAddRow" 	uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_clclnListAddRow"></sbux-button>
								<sbux-button id="btnClclnListDelRow" name="btnClclnListDelRow" 	uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_clclnListDelRow"></sbux-button>
						</div>
					</div>


					<div id="sb-area-grdClclnList" style="height:258px;width:100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>자산정산대상</span>
							</li>

						</ul>
						<div style="margin-left:auto;margin-top: 5px;">
								<sbux-button id="btnClclnTrgtAddRow" name="btnClclnTrgtAddRow" 	uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_clclnTrgtAddRow"></sbux-button>
								<sbux-button id="btnClclnTrgtDelRow" name="btnClclnTrgtDelRow" 	uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_clclnTrgtDelRow"></sbux-button>
						</div>
					</div>


					<div id="sb-area-grdClclnTrgt" style="height:258px;width:100%"></div>

				</div>
				<div class="row">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>본자산정산내역</span>
							</li>
						</ul>
						<div style="margin-left:auto;margin-top: 5px;">
								<sbux-button id="btnClclnDsctnAddRow" name="btnClclnDsctnAddRow" 	uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_clclnDsctnAddRow"></sbux-button>
								<sbux-button id="btnClclnDsctnDelRow" name="btnClclnDsctnDelRow" 	uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_clclnDsctnDelRow"></sbux-button>
						</div>
					</div>


					<div id="sb-area-grdClclnDsctn" style="height:258px;width:100%"></div>

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

	// ${comMenuVO.menuId}

	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId = '${loginVO.id}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역


    /** 공통 버튼 **/
    function cfn_search(){
        fn_search();
    }
    function cfn_save(){
    }

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfnma_setComSelect(['srch-slt-corp'], jsonCorp, 'L_HRA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			gfnma_setComSelect(['srch-slt-bizUnit'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			gfnma_setComSelect(['srch-slt-acntgCrtr'], jsonAcntgCrtr, 'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//gfnma_setComSelect(['gvwItemGrid'], jsonBiz, 'P_COM028', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PROJECT_CODE', 'PROJECT_NAME', 'Y', ''),
			gfnma_setComSelect(['srch-slt-acqsSe'], jsonAcqsSe, 'L_FIA007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
			gfnma_multiSelectInit({
				target			: ['#srch-slt-acqsSe']
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
		]);

		SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateLastYmd(new Date()));
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();
    	fn_createGrid2();
    	fn_createGrid3();
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

    function fn_createGrid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdClclnList';
	    SBGridProperties.id 				= 'grdClclnList';
	    SBGridProperties.jsonref 			= 'jsonClclnList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
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
            {caption: ["정산번호"],		ref: 'clclnNo', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정산일자"], 	ref: 'clclnYmd',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],  		ref: 'bplc',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득구분"],    	ref: 'acqs', 		type:'combo',  	width:'100px', style:'text-align:left', typeinfo : {ref:'jsonAcqsSe', label:'label', value:'value'}  },
            {caption: ["회계기준"],		ref: 'acntgCrtr',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"], 		ref: 'currency', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"], 		ref: 'exchRt',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["정산총액"], 	ref: 'clclnGramt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["전표명"], 		ref: 'slipNm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["전표상태"], 	ref: 'slipStts', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["생성자"], 		ref: 'crtPrsn', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["생성일시"], 	ref: 'crtDt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["생성PC"], 		ref: 'crtPc', 				type:'output',		width:'80px',		style:'text-align:center'}

        ];

        grdClclnList = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
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
        SBGridProperties.columns = [
            {caption: ["정산번호"],			ref: 'clclnNo', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 			ref: 'sn',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트코드"],  	ref: 'bizCd',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트"],      	ref: 'biz', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산번호"],			ref: 'astNo',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산명"], 			ref: 'astNm', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정산금액"], 		ref: 'clclnAmt',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["취득금액"], 		ref: 'acqsAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["기정산금액"], 		ref: 'lgcClclnAmt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["잔액"], 			ref: 'blnc', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 			ref: 'rmrk', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["대체수량"], 		ref: 'rplcQntt', 				type:'output',		width:'80px',		style:'text-align:center'}
        ];

        grdClclnTrgt = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
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
        SBGridProperties.columns = [
            {caption: ["정산번호"],			ref: 'clclnNo', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 		ref: 'sn',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산구분"],  		ref: 'astSe',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["중분류"],      	ref: 'mcslf', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소분류"],	ref: 'sclsf',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부서"], 			ref: 'dept', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["코스트센터"], 		ref: 'cstCntr',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["계정명"], 		ref: 'acntNm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["금액"], 		ref: 'amt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["프로젝트코드"], 		ref: 'bizCd', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["프로젝트명"], 		ref: 'bizNm', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["대체수량"], 		ref: 'rplcQntt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'rmrk', 				type:'output',		width:'80px',		style:'text-align:center'},

        ];

        grdClclnDsctn = _SBGrid.create(SBGridProperties);
        //NationInGrid.bind('click', 'fn_view');
    }

    /**
     * 처분 전표 조회
     */
    const fn_dspsSlipSearch = async function() {
    	var check1 = grdClclnList.getRow();
		var slipNo = grdClclnList.getRowData(check1)["slipNo"];
		//자산정산리스트 행 선택 안되있을 때 return
    	if(check1 == -1){
    		return
    	}
		// 전표번호 0일때 return
    	if(slipNo == 0){
			return
    	}

    	fn_setDspsSlip(slipNo);
    }

    /**
     * 목록 가져오기
     */
    const fn_setDspsSlip = async function(slipNo) {

    	grdClclnList.clearStatus();
    	fn_queryClick();

    }

    const fn_slipCreate = async function() {
    	var check1 = grdClclnList.getRow();
		//var slipNo = grdClclnList.getRowData(check1)["slipNo"];

		//자산정산리스트 행 선택 안되있을 때 return
    	if(check1 == -1){
    		return
    	}

        if (fnSET_P_FIA4400_S2("ACCOUNT")){
             var strtxn_id = grdClclnList.getRowData(check1)["txn_id"]; // strtxn_id 현재 행의 txn_id값
             fn_queryClick();
             grdClclnList.setRow(check1) // GetGridRowIndex(grdList, "txn_id", strtxn_id);  //쿼리 클릭 후 그리드에서 txn_id 행을 찾아서 이동
         }
    }

    const fnSET_P_FIA4400_S2 = async function(strWorkType){

            let strtxn_id = "";
            let strtxn_date = "";
            let strcip_no= "";

            for (var i = 0; i < grdClclnList.getRows; i++){
                if (grdClclnList.getRowData(i)["check_yn"] === "Y"){
                    if (!strtxn_id.Equals("")) {
                    strtxn_id += "|";
                    strtxn_date += "|";
                    strcip_no += "|";
                }

                    strtxn_id += grdClclnList.getRowData(i)["txn_id"];
                    strtxn_date += grdClclnList.getRowData(i)["transfer_date"];
                    strcip_no += grdClclnList.getRowData(i)["cip_transfer_no"];
                }
            }

            if (strtxn_id.Equals("")){
            	gfn_comAlert("W0005", "선택된 전표");		//	W0005	{0}이/가 없습니다.
                return false;
            }

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

            const postJsonPromise = gfn_postJSON("/co/sys/org/insertFia4400Account.do", {
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

    const fnQRY_P_FIA4400_Q = async function(strWorkType){
		// 검색조건
		/*
    	if (!ValidateControls(panHeader)){
    		return;
    	}
		*/



		 let acntgCrtr = SBUxMethod.get('srch-slt-acntgCrtr'); //회계기준
		 let bizUnit = SBUxMethod.get('srch-slt-bizUnit'); //(회계)사업단위
		 let bplc = gfnma_multiSelectGet('#srch-slt-bplc') //사업장
		 let clclnYmdFrom = SBUxMethod.get('srch-dtp-clclnYmdFrom');// 정산일자 from
		 let clclnYmdTo = SBUxMethod.get('srch-dtp-clclnYmdTo'); //정산일자to
		 let acqsSe = gfnma_multiSelectGet('#srch-slt-acqsSe') //취득구분
		 let bizCd = SBUxMethod.get('srch-inp-biz'); //프로젝트코드
		 let bizNm = SBUxMethod.get('srch-inp-bizPopup'); // 프로젝트명
		 let clclnNo = SBUxMethod.get('srch-inp-clclnNo'); //정산번호
		  var paramObj = {
				    V_P_WORK_TYPE       : strWorkType
        			,V_P_DEBUG_MODE_YN	: ''
        			,V_P_LANG_ID		: ''
        			,V_P_COMP_CODE		: gv_ma_selectedApcCd
        			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
        			,V_P_FI_ORG_CODE		: acntgCrtr
        			,V_P_ACCT_RULE_CODE	: bizUnit
        			,V_P_SITE_CODE		: bplc
        			,V_P_START_DATE		: clclnYmdFrom
        			,V_P_END_DATE		: clclnYmdTo
    			    ,V_P_CIP_TRANSFER_NO : clclnNo // strWorkType.Equals("Q") ? txtcip_transfer_no.Text : gvwList.GetValue("cip_transfer_no") == null ? "" : gvwList.GetValue("cip_transfer_no").ToString(),
    			    ,V_P_ACQUIRE_TYPE    : acqsSe
    			    ,V_P_PROJECT_CODE    : bizCd // strWorkType.Equals("Q") ? txtproject_code.Text : gvwList.GetValue("project_code") == null ? "" : gvwList.GetValue("project_code").ToString()
    			    ,V_P_PROJECT_NAME    : bizNm
        			,V_P_FORM_ID		: p_formId
        			,V_P_MENU_ID		: p_menuId
        			,V_P_PROC_ID		: ''
        			,V_P_USERID			: ''
        			,V_P_PC				: ''
        	    };
		  	const postJsonPromise = gfn_postJSON("/co/sys/org/selectFia4400Q.do", {
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

         fnQRY_P_FIA4400_Q("Q"); //자산정산내역 조회

         if (iBeforeFocus == 0 && grdClclnList.getRow() == -1)
             fn_focusedRowChanged();

         if (grdClclnList.getRow() == -1)
             fn_newClick();
    }
    //grdItem(본자산정산내역), grdDetail(자산정산대상) 초기화 하기
    const fn_newClick = function(){

    }

    const fn_focusedRowChanged = function(){
    	for(var i = 0; i < grdClclnList.getRows(); i++)
        {
            if (grdClclnList.getRowStatus(i) == 1)
                return;
        }

        fnQRY_P_FIA4400_Q("DETAIL");
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
        else
        {
            grdClclnList.setColDisabled(colId,true); // 그리드 edit true
            SBUxMethod.attr('btnClclnListAddRow', 'disabled', 'true') // 추가버튼
            SBUxMethod.attr('btnClclnListDelRow', 'disabled', 'true') //삭제버튼

            if (grdClclnList.getRowData(grdClclnList.getRow())["doc_id"] === 0){
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

    var fn_bizPopup = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
        SBUxMethod.openModal('modal-compopup1');

        var strWhereClause 	= "AND FI_ORG_CODE = '" + gfn_nvl(gfnma_multiSelectGet("#srch-inp-biz")) + "'" ;

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM028'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
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
                SBUxMethod.set("srch-inp-biz", 		data.PROJECT_CODE);
				SBUxMethod.set("srch-inp-bizPopup",		data.PROJECT_NAME);
            },
        });
    }



    const fn_clclnListAddRow = function(){

    	fnQRY_P_FIA4400_Q("NUM");
    	let clclnNo = SBUxMethod.get('srch-inp-clclnNo'); //정산번호
    	let bplc = gfnma_multiSelectGet('#srch-slt-bplc') //사업장
    	let acqsSe = gfnma_multiSelectGet('#srch-slt-acqsSe') //취득구분
    	let bizUnit = SBUxMethod.get('srch-slt-bizUnit'); //(회계)사업단위


    	let obj = {
    		clclnNo : clclnNo
    		, bplc : bplc
    		, crtDt : gfnma_date6()
    		, currency : ''//세션에 있는 정보가 있는듯
    		, exchRt	   : 1
    		//, 문서상태 : 0
    		, acqs : "CIP"
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