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
	<title>title : 매각/폐기내역 등록 </title>
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
                    </h3><!-- 매각/폐기내역 등록  -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="btnCreateAccount" name="btnCreateAccount" 	uitype="normal" text="전표생성" class="btn btn-sm btn-outline-danger" onclick="fn_createAccount"></sbux-button>
                    <sbux-button id="btnCancelAccount" name="btnCancelAccount" 	uitype="normal" text="전표취소" class="btn btn-sm btn-outline-danger" onclick="fn_cancelAccount"></sbux-button>
                    <sbux-button id="btnDisposalSearch" name="btnDisposalSearch" 	uitype="normal" text="처분 전표 조회" class="btn btn-sm btn-outline-danger" onclick="fn_disposalSearch"></sbux-button>
                    <sbux-button id="btnExpenseSearch" name="btnExpenseSearch" 	uitype="normal" text="비용 전표 조회" class="btn btn-sm btn-outline-danger" onclick="fn_expenseSearch"></sbux-button>
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
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-select id="srch-slt-corp" name="srch-slt-corp" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
								</p>
                            </td>

                            <th scope="row" class="th_bg">회계단위</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-select id="srch-slt-acntgUnit" name="srch-slt-acntgUnit" class="form-control input-sm" uitype="single" jsondata-ref="jsonAcntgUnit"></sbux-select>
								</p>
                            </td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-select id="srch-slt-bplc" name="srch-slt-bplc" class="form-control input-sm" uitype="single" jsondata-ref="jsonBplc"></sbux-select>
								</p>
                            </td>


                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">처분일</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-dspsYmdFrom"
									name="srch-dtp-dspsYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"

								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-dspsYmdTo"
									name="srch-dtp-dspsYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</td>
                            <th scope="row" class="th_bg">처분유형</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-select id="srch-slt-dspsType" name="srch-slt-dspsType" class="form-control input-sm" uitype="single" jsondata-ref="jsonDspsUnit"></sbux-select>
								</p>
                            </td>
                            <th scope="row" class="th_bg">회계기준</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-select id="srch-slt-acntgCrtr" name="srch-slt-acntgCrtr" uitype="single" jsondata-ref="jsonAcntgCrtr"></sbux-select>
								</p>
                            </td>
                        </tr>
                        <tr>
                        	<th scope="row" class="th_bg">거래처</th>
                            <td colspan="1" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-input uitype="text" id="srch-inp-cnpt" name="srch-inp-cnpt" class="form-control input-sm"></sbux-input>
								</p>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                            	<p class="ad_input_row">
									<sbux-input id="srch-inp-cnptPopup" name="srch-inp-cnptPopup" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_cnptPopup"></sbux-input>
								</p>
                            </td>

                           	<th scope="row" class="th_bg">담당부서</th>
                            <td colspan="1" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-input uitype="text" id="srch-inp-tkcgDept" name="srch-inp-tkcgDept" class="form-control input-sm"></sbux-input>
								</p>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                            	<p class="ad_input_row">
									<sbux-input id="srch-inp-tkcgDeptPopup" name="srch-inp-tkcgDeptPopup" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_tkcgDeptPopup"></sbux-input>
								</p>
                            </td>

                            <th scope="row" class="th_bg">담당자</th>
                            <td colspan="1" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-input uitype="text" id="srch-inp-pic" name="srch-inp-pic" class="form-control input-sm"></sbux-input>
								</p>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                            	<p class="ad_input_row">
									<sbux-input id="srch-inp-picPopup" name="srch-inp-picPopup" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_picPopup"></sbux-input>
								</p>
                            </td>
                        </tr>
                    </tbody>
                </table>


				<div class="row">
					<div class="ad_tbl_top">
						<div class="ad_tbl_count">
							<li>
								<span>자산처분 리스</span>
							</li>
						</div>
					</div>


					<div id="sb-area-grdAstDsps" style="height:258px;width:100%"></div>

				</div>
				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
				</sbux-tabs>

				<div class="tab-content">
					<div id="astTab" >
						<table class="table table-bordered tbl_fixed">
		                    <caption>자산내역</caption>
		                    <colgroup>
		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th scope="row" class="th_bg">처분번호</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dspsNo" name="srch-inp-astTab-dspsNo" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">회계기준</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-acntgCrtr" name="srch-inp-astTab-acntgCrtr" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <th scope="row" class="th_bg">취득가액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-acqsAmt1" name="srch-inp-astTab-acqsAmt1" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">상각누계액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dprcAtAmt" name="srch-inp-astTab-dprcAtAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">취득가액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-acqsAmt2" name="srch-inp-astTab-acqsAmt2" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">기초취득가액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-bssAcqsAmt" name="srch-inp-astTab-bssAcqsAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th scope="row" class="th_bg">처분유형</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dspsType" name="srch-inp-astTab-dspsType" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">처분일</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dspsYmd" name="srch-inp-astTab-dspsYmd" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <th scope="row" class="th_bg">국고보조금</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-ntAsstncAmt1" name="srch-inp-astTab-ntAsstncAmt1" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">보조금상각누계액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-asstncDprcAtAmt" name="srch-inp-astTab-asstncDprcAtAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">국고보조금</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-NtAsstncAmt2" name="srch-inp-astTab-NtAsstncAmt2" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">기초국고보조금</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-bssNtAsstncAmt" name="srch-inp-astTab-bssNtAsstncAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                        </tr>
                    		     <tr>
		                            <th scope="row" class="th_bg">자산</th>
		                            <td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-ast" name="srch-inp-astTab-ast" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-astBtn" name="srch-inp-astTab-astBtn" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_astBtnPopup"></sbux-input>
		                            </td>


		                            <th scope="row" class="th_bg">감가상각비</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dprcAmt" name="srch-inp-astTab-dprcAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <th scope="row" class="th_bg">장부가액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-abAmt" name="srch-inp-astTab-abAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">감가상각누계액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dprcAtAmt2" name="srch-inp-astTab-dprcAtAmt2" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">처분비율</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dspsRt" name="srch-inp-astTab-dspsRt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                        </tr>

		                        <tr>
		                            <th scope="row" class="th_bg">사업장</th>
		                            <td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-ast" name="srch-inp-astTab-ast" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">당초처분번호</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dprcAmt" name="srch-inp-astTab-dprcAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <th scope="row" class="th_bg">국고보조금상각</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-abAmt" name="srch-inp-astTab-abAmt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-astTab-abAmt" name="srch-inp-astTab-abAmt" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>

		                            <th scope="row" class="th_bg">보조금상각누계</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dprcAtAmt2" name="srch-inp-astTab-dprcAtAmt2" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>

		                            <th scope="row" class="th_bg">처분금액</th>
		                            <td  class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-dspsRt" name="srch-inp-astTab-dspsRt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                        </tr>
		                        <tr>
		                        	<th scope="row" class="th_bg">비고</th>
		                            <td colspan="6" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-rmrk" name="srch-inp-astTab-rmrk" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event="fn_astBtnPopup" wrap-style="width:100%"></sbux-input>
		                            </td>
		                            <td colspan="1" class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-astTab-rmrk2" name="srch-inp-astTab-dspsRt" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                        </tr>
		                        <tr>
		                        	<th scope="row" class="th_bg">처분 ▶ 소스ID</th>
		                            <td class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-dspsSourceId" name="srch-inp-astTab-rmrk" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
		                            <th scope="row" class="th_bg">전표명</th>
		                            <td colspan="4"class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-slipNm1" name="srch-inp-astTab-slipNm" class="form-control input-sm" uitype="text" wrap-style="width:100%"></sbux-input>
		                            </td>
		                            <th scope="row" class="th_bg">작성자</th>
		                            <td class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-wrtr1" name="srch-inp-astTab-wrtr" class="form-control input-sm" uitype="text"></sbux-input>
		                            </td>

		                        </tr>
                 		         <tr>
		                        	<th scope="row" class="th_bg">비용 ▶ 소스ID</th>
		                            <td class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-cstSourceId" name="srch-inp-astTab-rmrk" class="form-control input-sm" uitype="text" ></sbux-input>
		                            </td>
		                            <th scope="row" class="th_bg">전표명</th>
		                            <td colspan="4"class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-slipNm2" name="srch-inp-astTab-slipNm" class="form-control input-sm" uitype="text" wrap-style="width:100%"></sbux-input>
		                            </td>
		                            <th scope="row" class="th_bg">작성자</th>
		                            <td class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-astTab-wrtr2" name="srch-inp-astTab-wrtr" class="form-control input-sm" uitype="text"></sbux-input>
		                            </td>

		                        </tr>

		                    </tbody>
		                </table>
					</div>
					<div id="dspsTab" >
						<table class="table table-bordered tbl_fixed">
		                    <caption>처분내역</caption>
		                    <colgroup>
		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                        <col style="width: 8%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                        <col style="width: 6%">
		                        <col style="width: 2%">

		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                        <col style="width: 8%">
		                    </colgroup>
		                    <tbody>
		                    	<tr>
		                        	<th scope="row" class="th_bg">거래처</th>
		                        	<td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt1" name="srch-inp-dspsTab-cnpt1" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-dspsTab-cnpt2" name="srch-inp-dspsTab-cnpt2" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
		                            </td>

		                            <th scope="row" class="th_bg">통화</th>
		                            	<td>
		                            		<sbux-select id="srch-slt-dspsTab-currency" name="srch-slt-dspsTab-currency" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
		                            	</td>


		                            <th scope="row" class="th_bg">신고사업장</th>
		                            	<td colspan="2">
		                            		<sbux-select id="srch-slt-dspsTab-currency1" name="srch-slt-dspsTab-currency1" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
		                            	</td>

		                            <th scope="row" class="th_bg">장부가액</th>
		                            	<td>
		                            		<sbux-input id="srch-inp-dspsTab-currency2" name="srch-inp-dspsTab-currency2" class="form-control input-sm" uitype="text" ></sbux-input>
		                            	</td>
		                        </tr>

		                        <tr>
                   		         <tr>
		                        	<th scope="row" class="th_bg">담당부서</th>
		                        	<td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt3" name="srch-inp-dspsTab-cnpt1" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-dspsTab-cnpt4" name="srch-inp-dspsTab-cnpt2" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
		                            </td>

		                            <th scope="row" class="th_bg">환율</th>
		                            	<td>
		                            		<sbux-select id="srch-slt-dspsTab-cnpt5" name="srch-slt-dspsTab-currency" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
		                            	</td>


		                            <th scope="row" class="th_bg">부가세유형</th>
		                            	<td>
		                            		<sbux-select id="srch-slt-dspsTab-cnpt6" name="srch-slt-dspsTab-currency1" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
		                            	</td>
		                            	<td>
		                            		<sbux-input id="srch-inp-dspsTab-cnpt7" name="srch-inp-dspsTab-cnpt7" class="form-control input-sm" uitype="text" ></sbux-input>
		                            	</td>

		                            <th scope="row" class="th_bg">처분손익</th>
		                            	<td>
		                            		<sbux-input id="srch-inp-dspsTab-cnpt8" name="srch-inp-dspsTab-cnpt8" class="form-control input-sm" uitype="text" ></sbux-input>
		                            	</td>
		                        </tr>
		                        </tr>
		                        	<th scope="row" class="th_bg">담당자</th>
		                        	<td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt9" name="srch-inp-dspsTab-cnpt9" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-dspsTab-cnpt10" name="srch-inp-dspsTab-cnpt10" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
		                            </td>

		                            <th scope="row" class="th_bg">매각금액</th>
		                            	<td>
		                            		<sbux-select id="srch-slt-dspsTab-cnpt11" name="srch-slt-dspsTab-cnpt11" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
		                            	</td>


		                            <th scope="row" class="th_bg">부가세</th>
		                            	<td colspan="2">
		                            		<sbux-select id="srch-slt-dspsTab-cnpt12" name="srch-slt-dspsTab-cnpt12" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
		                            	</td>

		                            <th scope="row" class="th_bg">처분수량</th>
		                            	<td>
		                            		<sbux-input id="srch-inp-dspsTab-cnpt13" name="srch-inp-dspsTab-cnpt13" class="form-control input-sm" uitype="text" ></sbux-input>
		                            	</td>

		                        </tr>

		                        <tr>
		                        	<th scope="row" class="th_bg">코스트센터</th>
		                        	<td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt14" name="srch-inp-dspsTab-cnpt14" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
											<sbux-input id="srch-inp-dspsTab-cnpt15" name="srch-inp-dspsTab-cnpt15" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
		                            </td>

		                        	<th scope="row" class="th_bg">환산금액</th>
		                        	<td>
		                            		<sbux-input id="srch-inp-dspsTab-cnpt16" name="srch-inp-dspsTab-cnpt16" class="form-control input-sm" uitype="text" ></sbux-input>
	                            	</td>
		                        	<th scope="row" class="th_bg">금액합계</th>
		                        	<td>
		                            		<sbux-input id="srch-inp-dspsTab-cnpt17" name="srch-inp-dspsTab-cnpt17" class="form-control input-sm" uitype="text" ></sbux-input>
	                            	</td>
		                        </tr>

		                        <tr>
		                        	<th scope="row" class="th_bg">비용거래처</th>
	                        		<td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt18" name="srch-inp-dspsTab-cnpt18" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-dspsTab-cnpt19" name="srch-inp-dspsTab-cnpt19" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
		                            </td>

		                        	<th scope="row" class="th_bg">통화</th>
		                        	<td>
	                            		<sbux-select id="srch-slt-dspsTab-cnpt20" name="srch-slt-dspsTab-cnpt20" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
	                            	</td>
		                        	<th scope="row" class="th_bg">비용부가세유형</th>
		                        	<td>
	                            		<sbux-select id="srch-slt-dspsTab-cnpt21" name="srch-slt-dspsTab-cnpt21" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
	                            	</td>
	                            	<td>
	                            		<sbux-input id="srch-inp-dspsTab-cnpt22" name="srch-inp-dspsTab-cnpt22" class="form-control input-sm" uitype="text" ></sbux-input>
	                            	</td>
		                        </tr>

		                        <tr>
		                        	<th scope="row" class="th_bg">처분비용계정</th>
		                        	<td class="td_input" style="border-right:hidden;">
										<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt23" name="srch-inp-dspsTab-cnpt23" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
		                            </td>
		                            <td colspan="2" class="td_input" style="border-right:hidden;">
										<sbux-input id="srch-inp-dspsTab-cnpt24" name="srch-inp-dspsTab-cnpt24" class="form-control input-sm" uitype="search" button-back-text="···" button-back-event=""></sbux-input>
		                            </td>
		                        	<th scope="row" class="th_bg">환율</th>
		                        	<td>
	                            		<sbux-select id="srch-slt-dspsTab-cnpt25" name="srch-slt-dspsTab-cnpt25" class="form-control input-sm" uitype="single" jsondata-ref="jsonCorp"></sbux-select>
	                            	</td>
		                        	<th scope="row" class="th_bg">처분비용</th>
		                        	<td colspan ="2" >
			                        	<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt26" name="srch-inp-dspsTab-cnpt26" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
									</td>
		                        	<th scope="row" class="th_bg">처분비용부가세</th>
		                        	<td>
			                        	<p class="ad_input_row">
											<sbux-input id="srch-inp-dspsTab-cnpt27" name="srch-inp-dspsTab-cnpt27" class="form-control input-sm" uitype="text" ></sbux-input>
										</p>
									</td>
		                        </tr>

		                    </tbody>
	                    </table>

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

	// ${comMenuVO.menuId}

	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	//-----------------------------------------------------------

	var editType			= "N";

	var jsonRegionCode		= [];	// 지역

	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "자산내역", "targetid" : "astTab", "targetvalue" : "자산내역" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "처분내역", "targetid" : "dspsTab", "targetvalue" : "처분내역" },
	];


	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		]);
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	//fn_initSBSelect();
    	fn_createGrid();
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
    var grdAstDsps; 			// 그리드를 담기위한 객체 선언
    var jsonAstDsps = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdAstDsps';
	    SBGridProperties.id 				= 'grdAstDsps';
	    SBGridProperties.jsonref 			= 'jsonAstDsps';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["처분일"],			ref: '1', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["처분유형"], 		ref: '2',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처"],  		ref: '3',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세율"],      	ref: '4', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["매각금액"],	ref: '5',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환산금액"], 			ref: '6', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세"], 		ref: '7',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["금액합계"], 		ref: '8', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["취득가액"], 		ref: '9', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["국고보조금"], 		ref: '10', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["감가상각비"], 		ref: '11', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["국고보조금상각비"], 		ref: '12', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["감가상각누계액"], 		ref: '13', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["국고보조금상각누계액"], 		ref: '14', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["장부가액"], 		ref: '15', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["매각(폐기)손익"], 		ref: '16', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["통화"], 		ref: '17', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["환율"], 		ref: '18', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: '19', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처분비용"], 		ref: '20', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처분비용부가세"], 		ref: '21', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용거래처"], 		ref: '22', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용거래처명"], 		ref: '23', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세유형"], 		ref: '24', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세비율"], 		ref: '25', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세계정"], 		ref: '26', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용통화"], 		ref: '27', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용환율"], 		ref: '28', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["회계기준"], 		ref: '29', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["회계단위"], 		ref: '30', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처분수량"], 		ref: '31', 				type:'output',		width:'80px',		style:'text-align:center'},
        ];

        grdAstDsps = _SBGrid.create(SBGridProperties);
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


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>