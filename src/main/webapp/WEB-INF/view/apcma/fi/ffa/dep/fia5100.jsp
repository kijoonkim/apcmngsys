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
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
            	<div class="box-search-ma">
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<div>
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				</div>
				<!--[APC] END -->

                <table class="table table-bordered tbl_fixed table-search-ma">
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
                            <td colspan="3" class="td_input" style="border-right:hidden;">
									<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle "
										    	type="button"
										    	id="srch-slt-bizUnit"
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
										    	class="btn btn-sm btn-light dropdown-toggle "
										    	type="button"
										    	id="srch-slt-bplc1"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
										    </button>
										    <div class="dropdown-menu bplc" aria-labelledby="srch-slt-bplc1" style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
                            </td>
                            <td></td>


                        </tr>
                        <tr>
                            <th scope="row" class="th_bg_search">중지시작년월</th>
							<td  class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopBgngYmdFrom"
									name="srch-dtp-stopBgngYmdFrom"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode = "month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-stopBgngYmdFrom)"
									group-id="group1"
								></sbux-datepicker>
							</td>
							<td>-</td>
							<td  class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopBgngYmdTo"
									name="srch-dtp-stopBgngYmdTo"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode = "month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-stopBgngYmdTo)"
									group-id="group1"
								></sbux-datepicker>
							</td>
							<td></td>
                            <th scope="row" class="th_bg_search">중지종료년월</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopEndYmdFrom"
									name="srch-dtp-stopEndYmdFrom"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode = "month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-stopEndYmdFrom)"
									group-id="group1"
								></sbux-datepicker>
							</td>
							<td>-</td>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-stopEndYmdTo"
									name="srch-dtp-stopEndYmdTo"
									uitype="popup"
									date-format="yyyy-mm"
									datepicker-mode = "month"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-stopEndYmdTo)"
									group-id="group1"
								></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg_search">회계기준</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select id="srch-slt-acntgCrtr1" name="srch-slt-acntgCrtr1" class="form-control input-sm"  uitype="single" jsondata-ref="jsonAcntgCrtr" group-id="group1"></sbux-select>
                            </td>


                        </tr>
                        <tr>
                        	<th scope="row" class="th_bg_search">담당부서</th>
                             <td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-dspsTab-pic1"
										name="srch-inp-tckgDept1" class="form-control input-sm" group-id="dsps1"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP6"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_tckgDeptPopup('srch-inp-tckgDept2')">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-tckgDept2" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
								</div>
							</td>
                            <td></td>
                            <th scope="row" class="th_bg_search">담당자</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-dspsTab-pic1"
										name="srch-inp-dspsTab-pic1" class="form-control input-sm" group-id="dsps1"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP5"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_picPopup('srch-inp-dspsTab-pic2')">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-dspsTab-pic2" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
								</div>
							</td>
                        </tr>
                    </tbody>
                </table>
                </div>


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
							<!--
							<sbux-button id="btnDisposal" name="btnDisposal" 	uitype="normal" text="처분 전표" class="btn btn-sm btn-outline-danger" onclick="fn_disposal"></sbux-button>
                    		<sbux-button id="btnExpense" name="btnExpense" 	uitype="normal" text="비용 전표" class="btn btn-sm btn-outline-danger" onclick="fn_expense"></sbux-button>
                    		-->
						</div>
					</div>
					<table class="table table-bordered tbl_fixed">
		                    <caption>자산내역</caption>
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
		                            <th scope="row" class="th_bg">중지처리일</th>
		                            <td colspan="3" class="td_input" style="border-right:hidden;">
										<sbux-datepicker
											id="srch-dtp-stopPrcsYmd"
											name="srch-dtp-stopPrcsYmd"
											uitype="popup"
											date-format="yyyy-mm-dd"
											class="form-control input-sm input-sm-ast table-datepicker-ma"
											onchange="fn_dtpChange(srch-dtp-stopPrcsYmd)"
											group-id="group2"
										></sbux-datepicker>
		                            </td>
		                            <td></td>
		                            <th scope="row" class="th_bg">사업장</th>
		                             <td colspan="3" class="td_input" style="border-right:hidden;">
									<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
										    	type="button"
										    	id="srch-slt-bplc2"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
										    </button>
										    <div class="dropdown-menu bplc" aria-labelledby="srch-slt-bplc2" style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>
                            		</td>

		                        </tr>
		                        <tr>
		                            <th scope="row" class="th_bg">자산번호</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
			                            <div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-inp-astNo1"
												name="srch-inp-astNo1" class="form-control input-sm" group-id="dsps1"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP8"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_astPopup()">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-inp-astNo2" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
										</div>
									</td>
		                            <td>
		                            </td>
									<th scope="row" class="th_bg">회계기준</th>
		                            <td  colspan="3" class="td_input" style="border-right:hidden;">
										<sbux-select id="srch-slt-acntgCrtr2" name="srch-slt-acntgCrtr2" class="form-control input-sm inpt_data_reqed"  uitype="single" jsondata-ref="jsonAcntgCrtr" group-id="group2"></sbux-select>
		                            </td>
		                            <td>
		                            </td>
		                            <th scope="row" class="th_bg">취득금액</th>
		                            <td colspan="3" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-acqsAmt" name="srch-inp-acqsAmt" class="form-control input-sm" uitype="text" wrap-style="width:100%" permit-keycodes-set="num" exclude-kr="kr" group-id="group2"></sbux-input>
		                            </td>

		                        </tr>
                    		     <tr>
                    		     	<th scope="row" class="th_bg">중지시작년월</th>
		                            <td colspan="3" class="td_input" style="border-right:hidden;">
										<sbux-datepicker
											id="srch-dtp-stopBgngYmd"
											name="srch-dtp-stopBgngYmd"
											uitype="popup"
											date-format="yyyy-mm"
											datepicker-mode = "month"
											class="form-control input-sm input-sm-ast table-datepicker-ma"
											onchange="fn_dtpChange(srch-dtp-stopBgngYmd)"
											group-id="group2"
										></sbux-datepicker>
		                            </td>
		                            <td style="border-right:hidden;"></td>

		                            <th scope="row" class="th_bg">중지종료년월</th>
		                            <td colspan="3" class="td_input" style="border-right:hidden;">
		                            	<sbux-datepicker
											id="srch-dtp-stopEndYmd"
											name="srch-dtp-stopEndYmd"
											uitype="popup"
											date-format="yyyy-mm"
											datepicker-mode = "month"
											class="form-control input-sm input-sm-ast table-datepicker-ma"
											onchange="fn_dtpChange(srch-dtp-stopEndYmd)"
											group-id="group2"
										></sbux-datepicker>

		                            </td>
		                            <td style="border-right:hidden;"></td>

		                            <th scope="row" class="th_bg">보조금금액</th>
		                            <td colspan="3" class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-asstncAmt" name="srch-inp-asstncAmt" class="form-control input-sm" uitype="text" wrap-style="width:100%" permit-keycodes-set="num" exclude-kr="kr" group-id="group2"></sbux-input>
		                            </td>
                                 </tr>

		                        <tr>
		                            <th scope="row" class="th_bg">담당부서</th>
		                            <td colspan="3" class="td_input" style="border-right: hidden;">
			                            <div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-inp-tckgDept3"
												name="srch-inp-tckgDept3" class="form-control input-sm" group-id="group2"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP10"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_tckgDeptPopup('srch-inp-tckgDept4')">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-inp-tckgDept4" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
										</div>
									</td>
									<td></td>


		                            <th scope="row" class="th_bg">담당자</th>
		                            <td colspan="3" class="td_input" style="border-right: hidden;">
			                            <div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-inp-pic1"
												name="srch-inp-pic1" class="form-control input-sm" group-id="group2"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP9"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_picPopup('srch-inp-pic2')" >
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-inp-pic2" uitype="text" class="form-control input-sm" group-id="dsps1"></sbux-input>
										</div>
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
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역
	var stopPrcsYmdChk = true;
	var deleteButton = true;
	var saveButton = true;

	//조회
	function cfn_search(){
		fnQRY_P_FIA5100_Q();
	}
	//저장
	function cfn_save(){
		saveClick();
	}
	//삭제
	function cfn_del(){
		deleteClick();
	}
	//신규
	function cfn_add(){
		newClick();
	}
	//초기화
	function cfn_init(){
		//SBUxMethod.clearGroupData('group1');
		//SBUxMethod.clearGroupData('group2');
		SBUxMethod.refreshAll()
	}

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-comp'], jsonCorp, 'L_ORG000', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//사업장
			gfnma_multiSelectInit({
				target			: ['#srch-slt-bplc1','#srch-slt-bplc2']
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
			//회계기준
			gfnma_setComSelect(['srch-slt-acntgCrtr1','srch-slt-acntgCrtr2'], jsonAcntgCrtr, 'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//사업단위
			gfnma_setComSelect(['srch-slt-bizUnit'], jsonBizUnit, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),

			//회계단위
			gfnma_multiSelectInit({
				target			: ['#srch-slt-bizUnit']
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


		]);
		//초기값 IFRS
		SBUxMethod.set("srch-slt-acntgCrtr1","2");
		SBUxMethod.set("srch-slt-acntgCrtr2","2");


	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid1();

    	//fn_search();

		//재직상태
		//gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
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

    const queryClick = function()
	{
    	let saveButton = true;
    	//saveButton 확인 필요
        if (saveButton){
            //let dr = SetYesNoMessageBox(GetFormMessage("FIA5100_002")); // 작업중 저장하지 않은 데이터가 존재합니다. 저장하시겠습니까?

            if (!gfn_comConfirm("Q0001", "작업중 저장하지 않은 데이터가 존재합니다. 저장")) {	//	Q0001	{0} 하시겠습니까?
            	if (fnDataValidation("group2")){
            		saveClick();
            	}else{
                	return;
                }
            }
        }

        //let iBeforeFocus = gvwMaster.FocusedRowHandle; gvwMaster의 이전 focusedRow 정보를 저장해두는듯

		fnQRY_P_FIA5100_Q("LIST");

        //if (iBeforeFocus == 0 && gvwMaster.FocusedRowHandle == 0)
        //    fnFocusedRowChanged();

        //if ()
        //    newClick();
        //else
        //    deleteButton = true;
	}




    //paramObj 수정해야함 20240919
    //감가상각 일시중지등록 로직인듯
    //strStauts : N, U
    const fnSET_P_FIA5100_S = async function(strStauts) {
        let bizUnit = gfnma_multiSelectGet("#srch-slt-bizUnit")//회계단위 fi_org_code
        let bplc = gfnma_multiSelectGet("#srch-slt-bplc2")//사업장,site_code
        let acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr");//회계기준, acct_rule_code
        let stopBgngYmd = SBUxMethod.get("srch-dtp-stopBgngYmd"); //중지시작년월
        let stopEndYmd = SBUxMethod.get("srch-dtp-stopEndYmd"); //중지종료년월
        let tckgDept = SBUxMethod.get("srch-inp-tckgDept1"); //담당부서
        let pic = SBUxMethod.get("srch-inp-pic1"); //담당자
        let stopPrcsymd = SBUxMethod.get("srch-dtp-stopPrcsYmd");//중지처리일, holding_Date
        let astNo = SBUxMethod.get("srch-inp-astNo1");//자산번호
        let rmrk = SBUxMethod.get("srch-inp-rmrk");//비고
        let acqsAmt = SBUxMethod.get("srch-inp-acqsAmt");// 취득금액
        let asstncAmt = SBUxMethod.get("srch-inp-asstncAmt");//보조금금액

    	 var paramObj = {
     			V_P_DEBUG_MODE_YN	: ''
     			,V_P_LANG_ID		: ''
     			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
     			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

     		    ,V_P_SITE_CODE      : gfnma_nvl(bplc)
     		    ,V_P_ACCT_RULE_CODE : gfnma_nvl(acntgCrtr)
     		    ,V_P_ASSET_NO       : gfnma_nvl(astNo)
     		    ,V_P_HOLDING_DATE   : gfnma_nvl(stopPrcsymd)
     		    ,V_P_HOLDING_START_YYYYMM : gfnma_nvl(stopBgngYmd)
     		    ,V_P_HOLDING_END_YYYYMM   : gfnma_nvl(stopEndYmd)
     		    ,V_P_MEMO           : gfnma_nvl(rmrk)
     		    ,V_P_DEPT_CODE      : gfnma_nvl(tckgDept)
     		    ,V_P_EMP_CODE       : gfnma_nvl(pic)
     		    ,V_P_ACQUIRE_AMOUNT : gfnma_nvl(acqsAmt)
     		    ,V_P_SUBSIDIES_AMOUNT : gfnma_nvl(asstncAmt)

     			,V_P_FORM_ID		: p_formId
     			,V_P_MENU_ID		: p_menuId
     			,V_P_PROC_ID		: ''
     			,V_P_USERID			: ''
     			,V_P_PC				: ''
     	    };

         const postJsonPromise = gfn_postJSON("/fi/fia/insertFia5100.do", {
          	getType				: 'json',
          	workType			:  strStauts,
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

  	//paramObj 수정해야함 20240919
    //감가상각 일시중지등록 조회
    //strWorkType : LIST
    const fnQRY_P_FIA5100_Q = async function(strWorkType) {

         let corp = gfnma_multiSelectGet("#srch-slt-comp")//법인
         let bizUnit = gfnma_multiSelectGet("#srch-slt-bizUnit")//회계단위 fi_org_code
         let bplc = gfnma_multiSelectGet("#srch-slt-bplc1")//사업장,site_code
         let acntgCrtr = SBUxMethod.get("srch-slt-acntgCrtr");//회계기준, acct_rule_code
         let stopBgngYmdFrom = SBUxMethod.get("srch-dtp-stopBgngYmdFrom"); //중지시작년월From
         let stopBgngYmdTo = SBUxMethod.get("srch-dtp-stopBgngYmdTo"); //중지시작년월To
         let stopEndYmdFrom = SBUxMethod.get("srch-dtp-stopEndYmdFrom"); //중지종료년월From
         let stopEndYmdTo = SBUxMethod.get("srch-dtp-stopEndYmdTo"); //중지종료년월To
         let tckgDept = SBUxMethod.get("srch-inp-tckgDept1"); //담당부서
         let pic = SBUxMethod.get("srch-inp-pic1"); //담당자
         let stopPrcsymd = SBUxMethod.get("srch-dtp-stopPrcsYmd");//중지처리일, holding_Date
         let astNo = SBUxMethod.get("srch-inp-astNo1");//자산번호
    	 var paramObj = {
    	 		V_P_WORK_TYPE : strWorkType
     			,V_P_DEBUG_MODE_YN	: ''
     			,V_P_LANG_ID		: ''
     			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
     			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

     			,V_P_FI_ORG_CODE    : gfnma_nvl(bizUnit)
			    ,V_P_SITE_CODE      : gfnma_nvl(bplc)
			    ,V_P_ACCT_RULE_CODE : gfnma_nvl(acntgCrtr)
			    ,IV_P_HOLDING_START_FROM : gfnma_nvl(stopBgngYmdFrom)
			    ,IV_P_HOLDING_START_TO   : gfnma_nvl(stopBgngYmdTo)
			    ,IV_P_HOLDING_END_FROM   : gfnma_nvl(stopEndYmdFrom)
			    ,IV_P_HOLDING_END_TO     : gfnma_nvl(stopEndYmdTo)
			    ,V_P_DEPT_CODE           : gfnma_nvl(tckgDept)
			    ,V_P_EMP_CODE            : gfnma_nvl(pic)
			    ,V_P_HOLDING_DATE        : gfnma_nvl(stopPrcsymd)
			    ,V_P_ASSET_NO            : gfnma_nvl(astNo)

     			,V_P_FORM_ID		: p_formId
     			,V_P_MENU_ID		: p_menuId
     			,V_P_PROC_ID		: ''
     			,V_P_USERID			: ''
     			,V_P_PC				: ''
     	    };

		 // 결과값 grdMaster에 바인딩해야함 -> 감가상각 일시정지 리스트 그리드
         const postJsonPromise = gfn_postJSON("/fi/fia/selectFia5100.do", {
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
             jsonDprcDtStopList.length = 0;
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
					jsonDprcDtStopList.push(msg);
				});

        	grdDprcDtStopList.rebuild();
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
    	//let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
    	//let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");

    	//if(inptYmdFrom > inptYmdTo){
    	//	gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    	//	SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    	//	SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    	//	return;
    	//}
     }

    /**
     * 공통팝업
     * 담당부서
     */
     //
    var fn_tckgDeptPopup = function(id) {

    	var cdId = "";
    	var nmId = "";

    	if(id === "srch-inp-tckgDept2"){
    		cdId = "srch-inp-tckgDept1";
    		nmId = "srch-inp-tckgDept2";
    	}else if (id === "srch-inp-tckgDept4"){
    		cdId = "srch-inp-tckgDept3";
    		nmId = "srch-inp-tckgDept4";
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
    		//,searchInputTypes		: ["input", 			"input"]
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

    	if(id === "srch-inp-pic2"){
    		cdId = "srch-inp-pic1";
    		nmId = "srch-inp-pic2";
    	}else if (id === "srch-inp-dspsTab-pic2"){
    		cdId = "srch-inp-dspsTab-pic1";
    		nmId = "srch-inp-dspsTab-pic2";
    	}

        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND EMP_CODE LIKE '%" + replaceText0 + "%' AND EMP_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '담당자정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
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

        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-inp-astNo1"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-inp-astNo2"));
        var replaceText0 	= "_ASSET_NO_";
        var replaceText1 	= "_ASSET_NAME_";
        var strWhereClause 	= "AND ASSET_NO LIKE '%" + replaceText0 + "%' AND ASSET_NAME LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LIST'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["번호", 				"명칭"]
   			,searchInputFields		: ["ASSET_NO", 	"ASSET_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["자산번호", 	"자산명"]
   			,tableColumnNames		: ["ASSET_NO",	"ASSET_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-astNo1', 		data.ASSET_NO);
				SBUxMethod.set('srch-inp-astNo2',		data.ASSET_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}

    const fnFocusedRowChanged = function(){
    	// 뭔가 그리드 패널 설정하는거?
    	// grdMaster -> 감가상각일시정지 그리드
    	// panDetail -> 감가상각일시정지 내역 편집
        //SetPanelFromGrid(grdMaster, panDetail);

        //중지처리일 readonly 처리ymdholding_date.Properties.ReadOnly = true;
        SBUxMethod.attr("srch-dtp-stopPrcsYmd","readonly","true");
        stopPrcsYmdChk = true;
        //자산번호 readonly
        //txtasset_no.Properties.ReadOnly = true;
        //txtasset_no.Properties.Popup.BizComponentID = ""; -> 이건 뭔지 모르겠다
        SBUxMethod.attr("srch-inp-astNo1","readonly","true");
        SBUxMethod.attr("srch-inp-astNo2","readonly","true"); // 자산명 readonly
        //txtasset_name.Properties.ReadOnly = true;
        //txtasset_name.Properties.Popup.BizComponentID = "";
    }

	 const newClick = function(){

        //InitControls(panDetail);
		SBUxMethod.refreshGroup("group1");
        //ymdholding_date.Text = CurrentDate("yyyyMMdd"); 중지처리일 오늘날짜로 변경
        let nowDate = new Date();
		let nowYmd = gfn_dateToYmd(nowDate);
		SBUxMethod.set("srch-dtp-stopPrcsYmd",nowYmd);

        //txtasset_no.Focus(); 자산번호 포커스
        SBUxMethod.focus("srch-inp-astNo1");

        //ymdholding_date.Properties.ReadOnly = false;
        SBUxMethod.attr("srch-dtp-stopPrcsYmd","readonly","false");
        stopPrcsYmdChk = false;

        SBUxMethod.attr("srch-inp-astNo1","readonly","false");
        SBUxMethod.attr("srch-inp-astNo2","readonly","false"); // 자산명 readonly
        //txtasset_no.Properties.ReadOnly = false;
        //txtasset_no.Properties.Popup.BizComponentID = "P_FIA001";
        //txtasset_name.Properties.ReadOnly = false;
        //txtasset_name.Properties.Popup.BizComponentID = "P_FIA001";

		//저장, 삭제 버튼 false 처리
        saveButton = false;
        deleteButton = false;
     }

     const saveClick = function(){
     		//panDetail -> 하단 검색조건 validationg check
            if (!fnDataValidation("group2")){

            }
            //    return;

            let strStatus = "";

			//중지처리일 readonly 속성값 따로 저장해두기 stopPrcsYmdChk
            if (!stopPrcsYmdChk)
                strStatus = "N";
            else
                strStatus = "U";

            if (fnSET_P_FIA5100_S(strStatus))
            {
                // 자산번호, 중지처리일 |로 나눠서 strFocus index 찾은 뒤에 포커스
                let astNo = SBUxMethod.get("srch-inp-astNo1");//자산번호
                let stopPrcsymd = SBUxMethod.get("srch-dtp-stopPrcsYmd");

                let strFocus = astNo + "|" + stopPrcsymd;

                queryClick();

                //gvwMaster.FocusedRowHandle = GetGridRowIndex(grdMaster, "focus", strFocus);
            }
 		}

 	const deleteClick = function(){
            //DialogResult dr = SetYesNoMessageBox("[" + txtasset_name.Text + "-" + ymdholding_date.yyyymmdd + "]" + GetFormMessage("FIA5100_001")); // 감가상각 일시중지 내역을 삭제하시겠습니까?

			//Q0001 {0} 하시겠습니까?
            if (gfn_comConfirm("Q0001", "삭제")){
                if (fnSET_P_FIA5100_S("D")){
                    queryClick();
                }
            }
		}

 	const fnDataValidation = function(group){
 		//component_value 값이 undefined or null or "" 인경우 return 되도록
		let data = SBUxMethod.getGroupData(group);
 		let chkValidation = true;
		data.some(x => {
			let chk = x.component_value;
			if(chk === undefined || chk === null || chk === ""){
				chkValidation = false;
				return true;
			}
		})
		return chkValidation;
 	}









</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>