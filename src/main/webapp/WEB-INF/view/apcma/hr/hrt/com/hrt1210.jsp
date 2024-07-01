<%
    /**
     * @Class Name 		: hrt1210.jsp
     * @Description 	: 교대조 정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	이경한		최초 생성
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
    <title>title : 교대조 정보</title>
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
                </h3>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 40%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">교대조</th>
                    <td class="td_input">
                        <%--<sbux-select id="SRCH_SHIFT_CODE" uitype="single" jsondata-ref="jsonShiftCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SHIFT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SHIFT_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">교대조명</th>
                    <td class="td_input">
                        <sbux-input id="SRCH_SHIFT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사용여부</th>
                    <td class="td_input">
                        <sbux-select id="SRCH_USE_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>교대조 리스트</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-bandgvwInfo" style="height:300px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>교대조 정보 등록</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btn_copy" name="btn_copy" uitype="normal" text="복사" class="btn btn-sm btn-outline-danger" onclick="fn_copy" ></sbux-button>
                    </div>
                </div>
                <table class="table table-bordered tbl_fixed">
                    <caption>교대조정보</caption>
                    <colgroup>
                        <col style="width: 5%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 5%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 5%">
                        <col style="width: 3.3%">
                        <col style="width: 5%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 5%">
                        <col style="width: 3.3%">
                        <col style="width: 5%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                        <col style="width: 3.3%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">교대조코드</th>
                        <td colspan="3" class="td_input">
                            <sbux-input id="SHIFT_CODE" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">교대조명</th>
                        <td colspan="5" class="td_input">
                            <sbux-input id="SHIFT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                        </td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">사용여부</th>
                        <td class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="USE_YN"
                                    name="USE_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text=""
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <th scope="row" class="th_bg">주5일여부</th>
                        <td colspan="3" class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="FIVE_WEEK_YN"
                                    name="FIVE_WEEK_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text=""
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg">교대유형</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="SHIFT_CATEGORY" uitype="single" jsondata-ref="jsonShiftCategory" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">근무유형</th>
                        <td colspan="4" class="td_input">
                            <sbux-select id="WORK_TYPE_CODE" uitype="single" jsondata-ref="jsonWorkTypeCode" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">근무일</th>
                        <td colspan="4" class="td_input">
                            <sbux-select id="WORK_DAY_TYPE" uitype="single" jsondata-ref="jsonWorkDayType" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">바탕색상</th>
                        <td colspan="4" class="td_input">
                            <sbux-select id="BACK_COLOR" uitype="single" jsondata-ref="jsonBackColor" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">13유휴대상</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="PAY_ALLOWANCE_FLAG" uitype="single" jsondata-ref="jsonPayAllowanceFlag" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">출퇴근시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="WORK_ON_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="WORK_ON_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="WORK_ON_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="WORK_OFF_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="WORK_OFF_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="WORK_OFF_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="WORK_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">정상근무시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="NORMAL_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NORMAL_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="NORMAL_BREAK_APPLY_YN"
                                    name="NORMAL_BREAK_APPLY_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text="휴게적용"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">연장시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="OVER_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="OVER_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="OVER_BREAK_APPLY_YN"
                                    name="OVER_BREAK_APPLY_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text="휴게적용"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">야근근무시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="NIGHT_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="NIGHT_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="NIGHT_BREAK_APPLY_YN"
                                    name="NIGHT_BREAK_APPLY_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text="휴게적용"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">시간외1 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="AFTER1_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER1_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="AFTER1_BREAK_APPLY_YN"
                                    name="AFTER1_BREAK_APPLY_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text="휴게적용"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">시간외2 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="AFTER2_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER2_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td class="td_input">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="AFTER2_BREAK_APPLY_YN"
                                    name="AFTER2_BREAK_APPLY_YN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text="휴게적용"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">시간외3 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="AFTER3_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER3_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">시간외4 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="AFTER4_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="AFTER4_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게1 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="BREAK1_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK1_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게2 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="BREAK2_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK2_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게3 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="BREAK3_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK3_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게4 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="BREAK4_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK4_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게5 시간</th>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_START_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_START_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_START_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_END_DAY_TYPE" uitype="single" jsondata-ref="jsonDayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_END_HH" uitype="single" jsondata-ref="jsonHh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td>:</td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_END_MM" uitype="single" jsondata-ref="jsonMm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-input id="BREAK5_HOURS" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                        </td>
                        <td colspan="2" class="td_input">
                            <sbux-select id="BREAK5_TIME_ITEM_CODE" uitype="single" jsondata-ref="jsonTimeItemCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">비고</th>
                        <td colspan="20" class="td_input">
                            <sbux-textarea id="MEMO" rows="2" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
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
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var editType			= "N";

    var jsonShiftCode    = []; // 교대조
    var jsonUseYn        = []; // 사용여부
    var jsonWorkDayType  = []; // 근무일
    var jsonWorkTypeCode = []; // 근무유형
    var jsonShiftCategory = []; // 교대유형
    var jsonBackColor     = []; // 바탕색상
    var jsonPayAllowanceFlag = []; // 13유휴대상
    var jsonDayType = []; // 근무구분
    var jsonHh = []; // 근태시간
    var jsonMm = []; // 근태분
    var jsonTimeItemCode = []; // 근태항목

    //grid 초기화
    var bandgvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonShiftList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        $("#btn_copy").attr("disabled", true);
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        let rst = await Promise.all([
            // 집계기준
            /*gfnma_setComSelect(['SRCH_SHIFT_CODE'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#SRCH_SHIFT_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRT_SHIFTCODE'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SHIFT_CODE'
                ,colLabel		: 'SHIFT_NAME'
                ,columns		:[
                    {caption: "교대조코드",		ref: 'SHIFT_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "교대조명", 		ref: 'SHIFT_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 사용여부
            gfnma_setComSelect(['SRCH_USE_YN'], jsonUseYn, 'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무일
            gfnma_setComSelect(['bandgvwInfo', 'WORK_DAY_TYPE'], jsonWorkDayType, 'L_HRT019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무유형
            gfnma_setComSelect(['bandgvwInfo', 'WORK_TYPE_CODE'], jsonWorkTypeCode, 'L_HRT_WORKTYPE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'WORK_TYPE_CODE', 'WORK_TYPE_NAME', 'Y', ''),
            // 교대유형
            gfnma_setComSelect(['SHIFT_CATEGORY'], jsonShiftCategory, 'L_HRT034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 바탕색상
            gfnma_setComSelect(['BACK_COLOR'], jsonBackColor, 'L_COLOR', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COLOR_CODE', 'COLOR_NAME', 'Y', ''),
            // 13유휴대상
            gfnma_setComSelect(['PAY_ALLOWANCE_FLAG'], jsonPayAllowanceFlag, 'L_HRT052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무구분
            gfnma_setComSelect(['WORK_ON_DAY_TYPE', 'WORK_OFF_DAY_TYPE'
                , 'NORMAL_START_DAY_TYPE', 'NORMAL_END_DAY_TYPE'
                , 'OVER_START_DAY_TYPE', 'OVER_END_DAY_TYPE'
                , 'NIGHT_START_DAY_TYPE', 'NIGHT_END_DAY_TYPE'
                , 'AFTER1_START_DAY_TYPE', 'AFTER1_END_DAY_TYPE'
                , 'AFTER2_START_DAY_TYPE', 'AFTER2_END_DAY_TYPE'
                , 'AFTER3_START_DAY_TYPE', 'AFTER3_END_DAY_TYPE'
                , 'AFTER4_START_DAY_TYPE', 'AFTER4_END_DAY_TYPE'
                , 'BREAK1_START_DAY_TYPE', 'BREAK1_END_DAY_TYPE'
                , 'BREAK2_START_DAY_TYPE', 'BREAK2_END_DAY_TYPE'
                , 'BREAK3_START_DAY_TYPE', 'BREAK3_END_DAY_TYPE'
                , 'BREAK4_START_DAY_TYPE', 'BREAK4_END_DAY_TYPE'
                , 'BREAK5_START_DAY_TYPE', 'BREAK5_END_DAY_TYPE']
                , jsonDayType, 'L_HRT011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태시간
            gfnma_setComSelect(['WORK_ON_HH', 'WORK_OFF_HH'
                , 'NORMAL_START_HH', 'NORMAL_END_HH'
                , 'OVER_START_HH', 'OVER_END_HH'
                , 'NIGHT_START_HH', 'NIGHT_END_HH'
                , 'AFTER1_START_HH', 'AFTER1_END_HH'
                , 'AFTER2_START_HH', 'AFTER2_END_HH'
                , 'AFTER3_START_HH', 'AFTER3_END_HH'
                , 'AFTER4_START_HH', 'AFTER4_END_HH'
                , 'BREAK1_START_HH', 'BREAK1_END_HH'
                , 'BREAK2_START_HH', 'BREAK2_END_HH'
                , 'BREAK3_START_HH', 'BREAK3_END_HH'
                , 'BREAK4_START_HH', 'BREAK4_END_HH'
                , 'BREAK5_START_HH', 'BREAK5_END_HH']
                , jsonHh, 'L_HRT009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태분
            gfnma_setComSelect(['WORK_ON_MM', 'WORK_OFF_MM'
                , 'NORMAL_START_MM', 'NORMAL_END_MM'
                , 'OVER_START_MM', 'OVER_END_MM'
                , 'NIGHT_START_MM', 'NIGHT_END_MM'
                , 'AFTER1_START_MM', 'AFTER1_END_MM'
                , 'AFTER2_START_MM', 'AFTER2_END_MM'
                , 'AFTER3_START_MM', 'AFTER3_END_MM'
                , 'AFTER4_START_MM', 'AFTER4_END_MM'
                , 'BREAK1_START_MM', 'BREAK1_END_MM'
                , 'BREAK2_START_MM', 'BREAK2_END_MM'
                , 'BREAK3_START_MM', 'BREAK3_END_MM'
                , 'BREAK4_START_MM', 'BREAK4_END_MM'
                , 'BREAK5_START_MM', 'BREAK5_END_MM']
                , jsonMm, 'L_HRT010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태항목
            gfnma_setComSelect(['NORMAL_TIME_ITEM_CODE'
                , 'OVER_TIME_ITEM_CODE', 'NIGHT_TIME_ITEM_CODE'
                , 'AFTER1_TIME_ITEM_CODE', 'AFTER2_TIME_ITEM_CODE'
                , 'AFTER3_TIME_ITEM_CODE', 'AFTER4_TIME_ITEM_CODE'
                , 'BREAK1_TIME_ITEM_CODE', 'BREAK2_TIME_ITEM_CODE'
                , 'BREAK3_TIME_ITEM_CODE', 'BREAK4_TIME_ITEM_CODE'
                , 'BREAK5_TIME_ITEM_CODE']
                , jsonTimeItemCode, 'L_HRT004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
        ]);
    }

    function fn_createBandgvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwInfo';
        SBGridProperties.id 				= 'bandgvwInfo';
        SBGridProperties.jsonref 			= 'jsonShiftList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["교대조정보", "교대조코드"], 	        ref: 'SHIFT_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["교대조정보", "교대조명"], 	        ref: 'SHIFT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["교대조정보", "교대조유형"], 	        ref: 'SHIFT_CATEGORY',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "출근구분"], 	        ref: 'WORK_ON_DAY_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
            {caption: ["출퇴근", "출근시각"], 	        ref: 'WORK_ON_HHMM',    	        type:'output',  	width:'70px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["출퇴근", "출근시각"], 	        ref: 'WORK_ON_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["출퇴근", "출근시각"], 	        ref: 'WORK_ON_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["출퇴근", "퇴근구분"], 	        ref: 'WORK_OFF_DAY_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
            {caption: ["출퇴근", "퇴근시각"], 	        ref: 'WORK_OFF_HHMM',    	        type:'output',  	width:'80px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["출퇴근", "퇴근시각"], 	        ref: 'WORK_OFF_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["출퇴근", "퇴근시각"], 	        ref: 'WORK_OFF_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["출퇴근", "총근무시간"], 	        ref: 'WORK_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["근무정보", "사용여부"], 	        ref: 'USE_YN',    	        type:'checkbox',  	width:'60px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 2 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["근무정보", "근무일"], 	        ref: 'WORK_DAY_TYPE',    	        type:'combo',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["근무정보", "근무유형"], 	        ref: 'WORK_TYPE_CODE',    	        type:'combo',  	width:'82px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["근무정보", "비고"], 	        ref: 'MEMO',    	        type:'output',  	width:'146px',  	style:'text-align:left'},
            {caption: ["근무정보", "주5일여부"], 	        ref: 'FIVE_WEEK_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["근무정보", "바탕색"], 	        ref: 'BACK_COLOR',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["근무정보", "13유휴대상"], 	        ref: 'PAY_ALLOWANCE_FLAG',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상근태항목"], 	        ref: 'NORMAL_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상시작구분"], 	        ref: 'NORMAL_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상시작시간"], 	        ref: 'NORMAL_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["정상", "정상시작시간"], 	        ref: 'NORMAL_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상시작시간"], 	        ref: 'NORMAL_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상종료구분"], 	        ref: 'NORMAL_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상종료시각"], 	        ref: 'NORMAL_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["정상", "정상종료"], 	        ref: 'NORMAL_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상종료"], 	        ref: 'NORMAL_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["정상", "정상근무시간"], 	        ref: 'NORMAL_HOURS',    	        type:'output',  	width:'85px',  	style:'text-align:center'},
            {caption: ["연장", "연장근태항목"], 	        ref: 'OVER_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장시작구분"], 	        ref: 'OVER_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장시작시각"], 	        ref: 'OVER_START_HHMM',    	        type:'output',  	width:'78px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["연장", "연장시작"], 	        ref: 'OVER_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장시작"], 	        ref: 'OVER_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장종료구분"], 	        ref: 'OVER_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장종료시각"], 	        ref: 'OVER_END_HHMM',    	        type:'output',  	width:'78px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["연장", "연장종료"], 	        ref: 'OVER_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장종료"], 	        ref: 'OVER_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["연장", "연장근무시간"], 	        ref: 'OVER_HOURS',    	        type:'output',  	width:'85px',  	style:'text-align:center'},
            {caption: ["야간", "야간근태항목"], 	        ref: 'NIGHT_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간시작구분"], 	        ref: 'NIGHT_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간시작시각"], 	        ref: 'NIGHT_START_HHMM',    	        type:'output',  	width:'73px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["야간", "야간시작"], 	        ref: 'NIGHT_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간시작"], 	        ref: 'NIGHT_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간종료구분"], 	        ref: 'NIGHT_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간종료시각"], 	        ref: 'NIGHT_END_HHMM',    	        type:'output',  	width:'74px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["야간", "야간종료"], 	        ref: 'NIGHT_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간종료"], 	        ref: 'NIGHT_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["야간", "야간근무시간"], 	        ref: 'NIGHT_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["시간외1", "시간외1 근태항목"], 	        ref: 'AFTER1_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 시작구분"], 	        ref: 'AFTER1_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 시작시각"], 	        ref: 'AFTER1_START_HHMM',    	        type:'output',  	width:'104px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외1", "시간외1 시작"], 	        ref: 'AFTER1_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 시작"], 	        ref: 'AFTER1_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 종료구분"], 	        ref: 'AFTER1_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 종료시각"], 	        ref: 'AFTER1_END_HHMM',    	        type:'output',  	width:'107px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외1", "시간외1 종료"], 	        ref: 'AFTER1_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 종료"], 	        ref: 'AFTER1_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1", "시간외1 근무시간"], 	        ref: 'AFTER1_HOURS',    	        type:'output',  	width:'86px',  	style:'text-align:center'},
            {caption: ["시간외2", "시간외2 근태항목"], 	        ref: 'AFTER2_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 시작구분"], 	        ref: 'AFTER2_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 시작시각"], 	        ref: 'AFTER2_START_HHMM',    	        type:'output',  	width:'107px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외2", "시간외2 시작"], 	        ref: 'AFTER2_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 시작"], 	        ref: 'AFTER2_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 종료구분"], 	        ref: 'AFTER2_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 종료시각"], 	        ref: 'AFTER2_END_HHMM',    	        type:'output',  	width:'104px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외2", "시간외2 종료"], 	        ref: 'AFTER2_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 종료"], 	        ref: 'AFTER2_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2", "시간외2 근무시간"], 	        ref: 'AFTER2_HOURS',    	        type:'output',  	width:'86px',  	style:'text-align:center'},
            {caption: ["시간외3", "시간외3 근태항목"], 	        ref: 'AFTER3_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시간외3 시작구분"], 	        ref: 'AFTER3_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시간외3 시작시각"], 	        ref: 'AFTER3_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외3", "시간외3 시작"], 	        ref: 'AFTER3_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시간외3 시작"], 	        ref: 'AFTER3_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시간외3 종료구분"], 	        ref: 'AFTER3_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시간외3 종료시작"], 	        ref: 'AFTER3_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외3", "시간외3 종료"], 	        ref: 'AFTER3_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시간외3 종료"], 	        ref: 'AFTER3_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외3", "시작외3 근무시간"], 	        ref: 'AFTER3_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["시간외4", "시간외4 근태항목"], 	        ref: 'AFTER4_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시간외4 시작구분"], 	        ref: 'AFTER4_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시작외4 시작시각"], 	        ref: 'AFTER4_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외4", "시작외4 시작"], 	        ref: 'AFTER4_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시작외4 시작"], 	        ref: 'AFTER4_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시간외4 종료구분"], 	        ref: 'AFTER4_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시간외4 종료시각"], 	        ref: 'AFTER4_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["시간외4", "시간외4 종료"], 	        ref: 'AFTER4_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시간외4 종료"], 	        ref: 'AFTER4_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외4", "시간외4 근무시간"], 	        ref: 'AFTER4_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["휴게1", "휴게1 근태항목"], 	        ref: 'BREAK1_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 시작구분"], 	        ref: 'BREAK1_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 시작시각"], 	        ref: 'BREAK1_START_HHMM',    	        type:'output',  	width:'80px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게1", "휴게1 시작"], 	        ref: 'BREAK1_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 시작"], 	        ref: 'BREAK1_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 종료구분"], 	        ref: 'BREAK1_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 종료시각"], 	        ref: 'BREAK1_END_HHMM',    	        type:'output',  	width:'89px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게1", "휴게1 종료"], 	        ref: 'BREAK1_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 종료"], 	        ref: 'BREAK1_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게1", "휴게1 근무시간"], 	        ref: 'BREAK1_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["휴게2", "휴게2 근태항목"], 	        ref: 'BREAK2_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 시작구분"], 	        ref: 'BREAK2_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 시작시각"], 	        ref: 'BREAK2_START_HHMM',    	        type:'output',  	width:'78px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게2", "휴게2 시작"], 	        ref: 'BREAK2_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 시작"], 	        ref: 'BREAK2_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 종료구분"], 	        ref: 'BREAK2_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 종료시각"], 	        ref: 'BREAK2_END_HHMM',    	        type:'output',  	width:'82px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게2", "휴게2 종료"], 	        ref: 'BREAK2_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 종료"], 	        ref: 'BREAK2_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게2", "휴게2 근무시간"], 	        ref: 'BREAK2_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["휴게3", "휴게3 근태항목"], 	        ref: 'BREAK3_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 시작구분"], 	        ref: 'BREAK3_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 시작시각"], 	        ref: 'BREAK3_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게3", "휴게3 시작"], 	        ref: 'BREAK3_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 시작"], 	        ref: 'BREAK3_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 종료구분"], 	        ref: 'BREAK3_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 종료시각"], 	        ref: 'BREAK3_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게3", "휴게3 종료"], 	        ref: 'BREAK3_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 종료"], 	        ref: 'BREAK3_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게3", "휴게3 근무시간"], 	        ref: 'BREAK3_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["휴게4", "휴게4 근태항목"], 	        ref: 'BREAK4_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 시작구분"], 	        ref: 'BREAK4_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 시작시각"], 	        ref: 'BREAK4_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게4", "휴게4 시작"], 	        ref: 'BREAK4_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 시작"], 	        ref: 'BREAK4_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 종료구분"], 	        ref: 'BREAK4_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 종료시각"], 	        ref: 'BREAK4_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게4", "휴게4 종료"], 	        ref: 'BREAK4_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 종료"], 	        ref: 'BREAK4_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게4", "휴게4 근무시간"], 	        ref: 'BREAK4_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["휴게5", "휴게5 근태항목"], 	        ref: 'BREAK5_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 시작구분"], 	        ref: 'BREAK5_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 시작시각"], 	        ref: 'BREAK5_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게5", "휴게5 시작"], 	        ref: 'BREAK5_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 시작"], 	        ref: 'BREAK5_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 종료구분"], 	        ref: 'BREAK5_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 종료시각"], 	        ref: 'BREAK5_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:center', format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}},
            {caption: ["휴게5", "휴게5 종료"], 	        ref: 'BREAK5_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 종료"], 	        ref: 'BREAK5_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:center', hidden: true},
            {caption: ["휴게5", "휴게5 근무시간"], 	        ref: 'BREAK5_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:center'},
            {caption: ["정상휴게적용"], 	        ref: 'NORMAL_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
            {caption: ["연장휴게적용"], 	        ref: 'OVER_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
            {caption: ["야간휴게적용"], 	        ref: 'NIGHT_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외1 휴게적용"], 	        ref: 'AFTER1_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
            {caption: ["시간외2 휴게적용"], 	        ref: 'AFTER2_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:center', hidden: true},
        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('click', 'fn_view');
        bandgvwInfo.bind('afterrebuild','fn_afterRebuild');
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createBandgvwInfoGrid();
        fn_search();
    });

    // 신규
    function cfn_add() {
        fn_create();
    }
    // 저장
    function cfn_save() {
        fn_save();
    }
    // 삭제
    function cfn_del() {
        fn_delete();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_create = async function() {
        editType = "N";
        $("#btn_copy").attr("disabled", true);
        SBUxMethod.attr("SHIFT_CODE", "readonly", false);

        SBUxMethod.set("SHIFT_CODE", '');
        SBUxMethod.set("SHIFT_NAME", '');
        SBUxMethod.set("USE_YN", 'Y');
        SBUxMethod.set("FIVE_WEEK_YN", 'N');
        SBUxMethod.set("SHIFT_CATEGORY", '');
        SBUxMethod.set("WORK_TYPE_CODE", '');
        SBUxMethod.set("WORK_DAY_TYPE", '');
        SBUxMethod.set("BACK_COLOR", '');
        SBUxMethod.set("PAY_ALLOWANCE_FLAG", '');
        SBUxMethod.set("WORK_ON_DAY_TYPE", '');
        SBUxMethod.set("WORK_ON_HH", '');
        SBUxMethod.set("WORK_ON_MM", '');
        SBUxMethod.set("WORK_OFF_DAY_TYPE", '');
        SBUxMethod.set("WORK_OFF_HH", '');
        SBUxMethod.set("WORK_OFF_MM", '');
        SBUxMethod.set("WORK_HOURS", '');
        SBUxMethod.set("NORMAL_START_DAY_TYPE", '');
        SBUxMethod.set("NORMAL_START_HH", '');
        SBUxMethod.set("NORMAL_START_MM", '');
        SBUxMethod.set("NORMAL_END_DAY_TYPE", '');
        SBUxMethod.set("NORMAL_END_HH", '');
        SBUxMethod.set("NORMAL_END_MM", '');
        SBUxMethod.set("NORMAL_HOURS", '');
        SBUxMethod.set("NORMAL_TIME_ITEM_CODE", '');
        SBUxMethod.set("NORMAL_BREAK_APPLY_YN", 'Y');
        SBUxMethod.set("OVER_START_DAY_TYPE", '');
        SBUxMethod.set("OVER_START_HH", '');
        SBUxMethod.set("OVER_START_MM", '');
        SBUxMethod.set("OVER_END_DAY_TYPE", '');
        SBUxMethod.set("OVER_END_HH", '');
        SBUxMethod.set("OVER_END_MM", '');
        SBUxMethod.set("OVER_HOURS", '');
        SBUxMethod.set("OVER_TIME_ITEM_CODE", '');
        SBUxMethod.set("OVER_BREAK_APPLY_YN", 'Y');
        SBUxMethod.set("NIGHT_START_DAY_TYPE", '');
        SBUxMethod.set("NIGHT_START_HH", '');
        SBUxMethod.set("NIGHT_START_MM", '');
        SBUxMethod.set("NIGHT_END_DAY_TYPE", '');
        SBUxMethod.set("NIGHT_END_HH", '');
        SBUxMethod.set("NIGHT_END_MM", '');
        SBUxMethod.set("NIGHT_HOURS", '');
        SBUxMethod.set("NIGHT_TIME_ITEM_CODE", '');
        SBUxMethod.set("NIGHT_BREAK_APPLY_YN", 'Y');
        SBUxMethod.set("AFTER1_START_DAY_TYPE", '');
        SBUxMethod.set("AFTER1_START_HH", '');
        SBUxMethod.set("AFTER1_START_MM", '');
        SBUxMethod.set("AFTER1_END_DAY_TYPE", '');
        SBUxMethod.set("AFTER1_END_HH", '');
        SBUxMethod.set("AFTER1_END_MM", '');
        SBUxMethod.set("AFTER1_HOURS", '');
        SBUxMethod.set("AFTER1_TIME_ITEM_CODE", '');
        SBUxMethod.set("AFTER1_BREAK_APPLY_YN", 'Y');
        SBUxMethod.set("AFTER2_START_DAY_TYPE", '');
        SBUxMethod.set("AFTER2_START_HH", '');
        SBUxMethod.set("AFTER2_START_MM", '');
        SBUxMethod.set("AFTER2_END_DAY_TYPE", '');
        SBUxMethod.set("AFTER2_END_HH", '');
        SBUxMethod.set("AFTER2_END_MM", '');
        SBUxMethod.set("AFTER2_HOURS", '');
        SBUxMethod.set("AFTER2_TIME_ITEM_CODE", '');
        SBUxMethod.set("AFTER2_BREAK_APPLY_YN", 'N');
        SBUxMethod.set("AFTER3_START_DAY_TYPE", '');
        SBUxMethod.set("AFTER3_START_HH", '');
        SBUxMethod.set("AFTER3_START_MM", '');
        SBUxMethod.set("AFTER3_END_DAY_TYPE", '');
        SBUxMethod.set("AFTER3_END_HH", '');
        SBUxMethod.set("AFTER3_END_MM", '');
        SBUxMethod.set("AFTER3_HOURS", '');
        SBUxMethod.set("AFTER3_TIME_ITEM_CODE", '');
        SBUxMethod.set("AFTER4_START_DAY_TYPE", '');
        SBUxMethod.set("AFTER4_START_HH", '');
        SBUxMethod.set("AFTER4_START_MM", '');
        SBUxMethod.set("AFTER4_END_DAY_TYPE", '');
        SBUxMethod.set("AFTER4_END_HH", '');
        SBUxMethod.set("AFTER4_END_MM", '');
        SBUxMethod.set("AFTER4_HOURS", '');
        SBUxMethod.set("AFTER4_TIME_ITEM_CODE", '');
        SBUxMethod.set("BREAK1_START_DAY_TYPE", '');
        SBUxMethod.set("BREAK1_START_HH", '');
        SBUxMethod.set("BREAK1_START_MM", '');
        SBUxMethod.set("BREAK1_END_DAY_TYPE", '');
        SBUxMethod.set("BREAK1_END_HH", '');
        SBUxMethod.set("BREAK1_END_MM", '');
        SBUxMethod.set("BREAK1_HOURS", '');
        SBUxMethod.set("BREAK1_TIME_ITEM_CODE", '');
        SBUxMethod.set("BREAK2_START_DAY_TYPE", '');
        SBUxMethod.set("BREAK2_START_HH", '');
        SBUxMethod.set("BREAK2_START_MM", '');
        SBUxMethod.set("BREAK2_END_DAY_TYPE", '');
        SBUxMethod.set("BREAK2_END_HH", '');
        SBUxMethod.set("BREAK2_END_MM", '');
        SBUxMethod.set("BREAK2_HOURS", '');
        SBUxMethod.set("BREAK2_TIME_ITEM_CODE", '');
        SBUxMethod.set("BREAK3_START_DAY_TYPE", '');
        SBUxMethod.set("BREAK3_START_HH", '');
        SBUxMethod.set("BREAK3_START_MM", '');
        SBUxMethod.set("BREAK3_END_DAY_TYPE", '');
        SBUxMethod.set("BREAK3_END_HH", '');
        SBUxMethod.set("BREAK3_END_MM", '');
        SBUxMethod.set("BREAK3_HOURS", '');
        SBUxMethod.set("BREAK3_TIME_ITEM_CODE", '');
        SBUxMethod.set("BREAK4_START_DAY_TYPE", '');
        SBUxMethod.set("BREAK4_START_HH", '');
        SBUxMethod.set("BREAK4_START_MM", '');
        SBUxMethod.set("BREAK4_END_DAY_TYPE", '');
        SBUxMethod.set("BREAK4_END_HH", '');
        SBUxMethod.set("BREAK4_END_MM", '');
        SBUxMethod.set("BREAK4_HOURS", '');
        SBUxMethod.set("BREAK4_TIME_ITEM_CODE", '');
        SBUxMethod.set("BREAK5_START_DAY_TYPE", '');
        SBUxMethod.set("BREAK5_START_HH", '');
        SBUxMethod.set("BREAK5_START_MM", '');
        SBUxMethod.set("BREAK5_END_DAY_TYPE", '');
        SBUxMethod.set("BREAK5_END_HH", '');
        SBUxMethod.set("BREAK5_END_MM", '');
        SBUxMethod.set("BREAK5_HOURS", '');
        SBUxMethod.set("BREAK5_TIME_ITEM_CODE", '');
        SBUxMethod.set("MEMO", '');
    }

    const fn_save = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let SHIFT_CODE = gfnma_nvl(SBUxMethod.get("SHIFT_CODE"));
        let SHIFT_NAME = gfnma_nvl(SBUxMethod.get("SHIFT_NAME"));
        let USE_YN = gfnma_nvl(SBUxMethod.get("USE_YN"));
        let FIVE_WEEK_YN = gfnma_nvl(SBUxMethod.get("FIVE_WEEK_YN"));
        let SHIFT_CATEGORY = gfnma_nvl(SBUxMethod.get("SHIFT_CATEGORY"));
        let WORK_TYPE_CODE = gfnma_nvl(SBUxMethod.get("WORK_TYPE_CODE"));
        let WORK_DAY_TYPE = gfnma_nvl(SBUxMethod.get("WORK_DAY_TYPE"));
        let BACK_COLOR = gfnma_nvl(SBUxMethod.get("BACK_COLOR"));
        let PAY_ALLOWANCE_FLAG = gfnma_nvl(SBUxMethod.get("PAY_ALLOWANCE_FLAG"));
        let WORK_ON_DAY_TYPE = gfnma_nvl(SBUxMethod.get("WORK_ON_DAY_TYPE"));
        let WORK_ON_HHMM = gfnma_nvl(SBUxMethod.get("WORK_ON_HH")) + gfnma_nvl(SBUxMethod.get("WORK_ON_MM"));
        let WORK_OFF_DAY_TYPE = gfnma_nvl(SBUxMethod.get("WORK_OFF_DAY_TYPE"));
        let WORK_OFF_HHMM = gfnma_nvl(SBUxMethod.get("WORK_OFF_HH")) + gfnma_nvl(SBUxMethod.get("WORK_OFF_MM"));
        let NORMAL_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("NORMAL_START_DAY_TYPE"));
        let NORMAL_START_HHMM = gfnma_nvl(SBUxMethod.get("NORMAL_START_HH")) + gfnma_nvl(SBUxMethod.get("NORMAL_START_MM"));
        let NORMAL_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("NORMAL_END_DAY_TYPE"));
        let NORMAL_END_HHMM = gfnma_nvl(SBUxMethod.get("NORMAL_END_HH")) + gfnma_nvl(SBUxMethod.get("NORMAL_END_MM"));
        let NORMAL_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("NORMAL_TIME_ITEM_CODE"));
        let NORMAL_BREAK_APPLY_YN = gfnma_nvl(SBUxMethod.get("NORMAL_BREAK_APPLY_YN"));
        let OVER_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("OVER_START_DAY_TYPE"));
        let OVER_START_HHMM = gfnma_nvl(SBUxMethod.get("OVER_START_HH")) + gfnma_nvl(SBUxMethod.get("OVER_START_MM"));
        let OVER_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("OVER_END_DAY_TYPE"));
        let OVER_END_HHMM = gfnma_nvl(SBUxMethod.get("OVER_END_HH")) + gfnma_nvl(SBUxMethod.get("OVER_END_MM"));
        let OVER_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("OVER_TIME_ITEM_CODE"));
        let OVER_BREAK_APPLY_YN = gfnma_nvl(SBUxMethod.get("OVER_BREAK_APPLY_YN"));
        let NIGHT_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("NIGHT_START_DAY_TYPE"));
        let NIGHT_START_HHMM = gfnma_nvl(SBUxMethod.get("NIGHT_START_HH")) + gfnma_nvl(SBUxMethod.get("NIGHT_START_MM"));
        let NIGHT_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("NIGHT_END_DAY_TYPE"));
        let NIGHT_END_HHMM = gfnma_nvl(SBUxMethod.get("NIGHT_END_HH")) + gfnma_nvl(SBUxMethod.get("NIGHT_END_MM"));
        let NIGHT_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("NIGHT_TIME_ITEM_CODE"));
        let NIGHT_BREAK_APPLY_YN = gfnma_nvl(SBUxMethod.get("NIGHT_BREAK_APPLY_YN"));
        let AFTER1_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER1_START_DAY_TYPE"));
        let AFTER1_START_HHMM = gfnma_nvl(SBUxMethod.get("AFTER1_START_HH")) + gfnma_nvl(SBUxMethod.get("AFTER1_START_MM"));
        let AFTER1_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER1_END_DAY_TYPE"));
        let AFTER1_END_HHMM = gfnma_nvl(SBUxMethod.get("AFTER1_END_HH")) + gfnma_nvl(SBUxMethod.get("AFTER1_END_MM"));
        let AFTER1_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("AFTER1_TIME_ITEM_CODE"));
        let AFTER1_BREAK_APPLY_YN = gfnma_nvl(SBUxMethod.get("AFTER1_BREAK_APPLY_YN"));
        let AFTER2_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER2_START_DAY_TYPE"));
        let AFTER2_START_HHMM = gfnma_nvl(SBUxMethod.get("AFTER2_START_HH")) + gfnma_nvl(SBUxMethod.get("AFTER2_START_MM"));
        let AFTER2_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER2_END_DAY_TYPE"));
        let AFTER2_END_HHMM = gfnma_nvl(SBUxMethod.get("AFTER2_END_HH")) + gfnma_nvl(SBUxMethod.get("AFTER2_END_MM"));
        let AFTER2_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("AFTER2_TIME_ITEM_CODE"));
        let AFTER2_BREAK_APPLY_YN = gfnma_nvl(SBUxMethod.get("AFTER2_BREAK_APPLY_YN"));
        let AFTER3_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER3_START_DAY_TYPE"));
        let AFTER3_START_HHMM = gfnma_nvl(SBUxMethod.get("AFTER3_START_HH")) + gfnma_nvl(SBUxMethod.get("AFTER3_START_MM"));
        let AFTER3_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER3_END_DAY_TYPE"));
        let AFTER3_END_HHMM = gfnma_nvl(SBUxMethod.get("AFTER3_END_HH")) + gfnma_nvl(SBUxMethod.get("AFTER3_END_MM"));
        let AFTER3_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("AFTER3_TIME_ITEM_CODE"));
        let AFTER4_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER4_START_DAY_TYPE"));
        let AFTER4_START_HHMM = gfnma_nvl(SBUxMethod.get("AFTER4_START_HH")) + gfnma_nvl(SBUxMethod.get("AFTER4_START_MM"));
        let AFTER4_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("AFTER4_END_DAY_TYPE"));
        let AFTER4_END_HHMM = gfnma_nvl(SBUxMethod.get("AFTER4_END_HH")) + gfnma_nvl(SBUxMethod.get("AFTER4_END_MM"));
        let AFTER4_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("AFTER4_TIME_ITEM_CODE"));
        let BREAK1_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK1_START_DAY_TYPE"));
        let BREAK1_START_HHMM = gfnma_nvl(SBUxMethod.get("BREAK1_START_HH")) + gfnma_nvl(SBUxMethod.get("BREAK1_START_MM"));
        let BREAK1_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK1_END_DAY_TYPE"));
        let BREAK1_END_HHMM = gfnma_nvl(SBUxMethod.get("BREAK1_END_HH")) + gfnma_nvl(SBUxMethod.get("BREAK1_END_MM"));
        let BREAK1_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("BREAK1_TIME_ITEM_CODE"));
        let BREAK2_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK2_START_DAY_TYPE"));
        let BREAK2_START_HHMM = gfnma_nvl(SBUxMethod.get("BREAK2_START_HH")) + gfnma_nvl(SBUxMethod.get("BREAK2_START_MM"));
        let BREAK2_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK2_END_DAY_TYPE"));
        let BREAK2_END_HHMM = gfnma_nvl(SBUxMethod.get("BREAK2_END_HH")) + gfnma_nvl(SBUxMethod.get("BREAK2_END_MM"));
        let BREAK2_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("BREAK2_TIME_ITEM_CODE"));
        let BREAK3_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK3_START_DAY_TYPE"));
        let BREAK3_START_HHMM = gfnma_nvl(SBUxMethod.get("BREAK3_START_HH")) + gfnma_nvl(SBUxMethod.get("BREAK3_START_MM"));
        let BREAK3_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK3_END_DAY_TYPE"));
        let BREAK3_END_HHMM = gfnma_nvl(SBUxMethod.get("BREAK3_END_HH")) + gfnma_nvl(SBUxMethod.get("BREAK3_END_MM"));
        let BREAK3_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("BREAK3_TIME_ITEM_CODE"));
        let BREAK4_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK4_START_DAY_TYPE"));
        let BREAK4_START_HHMM = gfnma_nvl(SBUxMethod.get("BREAK4_START_HH")) + gfnma_nvl(SBUxMethod.get("BREAK4_START_MM"));
        let BREAK4_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK4_END_DAY_TYPE"));
        let BREAK4_END_HHMM = gfnma_nvl(SBUxMethod.get("BREAK4_END_HH")) + gfnma_nvl(SBUxMethod.get("BREAK4_END_MM"));
        let BREAK4_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("BREAK4_TIME_ITEM_CODE"));
        let BREAK5_START_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK5_START_DAY_TYPE"));
        let BREAK5_START_HHMM = gfnma_nvl(SBUxMethod.get("BREAK5_START_HH")) + gfnma_nvl(SBUxMethod.get("BREAK5_START_MM"));
        let BREAK5_END_DAY_TYPE = gfnma_nvl(SBUxMethod.get("BREAK5_END_DAY_TYPE"));
        let BREAK5_END_HHMM = gfnma_nvl(SBUxMethod.get("BREAK5_END_HH")) + gfnma_nvl(SBUxMethod.get("BREAK5_END_MM"));
        let BREAK5_TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("BREAK5_TIME_ITEM_CODE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("MEMO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_SHIFT_CODE : SHIFT_CODE,
            V_P_SHIFT_NAME : SHIFT_NAME,
            V_P_WORK_ON_DAY_TYPE : WORK_ON_DAY_TYPE,
            V_P_WORK_ON_HHMM : WORK_ON_HHMM,
            V_P_WORK_OFF_DAY_TYPE : WORK_OFF_DAY_TYPE,
            V_P_WORK_OFF_HHMM : WORK_OFF_HHMM,
            V_P_NORMAL_TIME_ITEM_CODE : NORMAL_TIME_ITEM_CODE,
            V_P_NORMAL_START_DAY_TYPE : NORMAL_START_DAY_TYPE,
            V_P_NORMAL_START_HHMM : NORMAL_START_HHMM,
            V_P_NORMAL_END_DAY_TYPE : NORMAL_END_DAY_TYPE,
            V_P_NORMAL_END_HHMM : NORMAL_END_HHMM,
            V_P_OVER_TIME_ITEM_CODE : OVER_TIME_ITEM_CODE,
            V_P_OVER_START_DAY_TYPE : OVER_START_DAY_TYPE,
            V_P_OVER_START_HHMM : OVER_START_HHMM,
            V_P_OVER_END_DAY_TYPE : OVER_END_DAY_TYPE,
            V_P_OVER_END_HHMM : OVER_END_HHMM,
            V_P_NIGHT_TIME_ITEM_CODE : NIGHT_TIME_ITEM_CODE,
            V_P_NIGHT_START_DAY_TYPE : NIGHT_START_DAY_TYPE,
            V_P_NIGHT_START_HHMM : NIGHT_START_HHMM,
            V_P_NIGHT_END_DAY_TYPE : NIGHT_END_DAY_TYPE,
            V_P_NIGHT_END_HHMM : NIGHT_END_HHMM,
            V_P_AFTER1_TIME_ITEM_CODE : AFTER1_TIME_ITEM_CODE,
            V_P_AFTER1_START_DAY_TYPE : AFTER1_START_DAY_TYPE,
            V_P_AFTER1_START_HHMM : AFTER1_START_HHMM,
            V_P_AFTER1_END_DAY_TYPE : AFTER1_END_DAY_TYPE,
            V_P_AFTER1_END_HHMM : AFTER1_END_HHMM,
            V_P_AFTER2_TIME_ITEM_CODE : AFTER2_TIME_ITEM_CODE,
            V_P_AFTER2_START_DAY_TYPE : AFTER2_START_DAY_TYPE,
            V_P_AFTER2_START_HHMM : AFTER2_START_HHMM,
            V_P_AFTER2_END_DAY_TYPE : AFTER2_END_DAY_TYPE,
            V_P_AFTER2_END_HHMM : AFTER2_END_HHMM,
            V_P_AFTER3_TIME_ITEM_CODE : AFTER3_TIME_ITEM_CODE,
            V_P_AFTER3_START_DAY_TYPE : AFTER3_START_DAY_TYPE,
            V_P_AFTER3_START_HHMM : AFTER3_START_HHMM,
            V_P_AFTER3_END_DAY_TYPE : AFTER3_END_DAY_TYPE,
            V_P_AFTER3_END_HHMM : AFTER3_END_HHMM,
            V_P_AFTER4_TIME_ITEM_CODE : AFTER4_TIME_ITEM_CODE,
            V_P_AFTER4_START_DAY_TYPE : AFTER4_START_DAY_TYPE,
            V_P_AFTER4_START_HHMM : AFTER4_START_HHMM,
            V_P_AFTER4_END_DAY_TYPE : AFTER4_END_DAY_TYPE,
            V_P_AFTER4_END_HHMM : AFTER4_END_HHMM,
            V_P_BREAK1_TIME_ITEM_CODE : BREAK1_TIME_ITEM_CODE,
            V_P_BREAK1_START_DAY_TYPE : BREAK1_START_DAY_TYPE,
            V_P_BREAK1_START_HHMM : BREAK1_START_HHMM,
            V_P_BREAK1_END_DAY_TYPE : BREAK1_END_DAY_TYPE,
            V_P_BREAK1_END_HHMM : BREAK1_END_HHMM,
            V_P_BREAK2_TIME_ITEM_CODE : BREAK2_TIME_ITEM_CODE,
            V_P_BREAK2_START_DAY_TYPE : BREAK2_START_DAY_TYPE,
            V_P_BREAK2_START_HHMM : BREAK2_START_HHMM,
            V_P_BREAK2_END_DAY_TYPE : BREAK2_END_DAY_TYPE,
            V_P_BREAK2_END_HHMM : BREAK2_END_HHMM,
            V_P_BREAK3_TIME_ITEM_CODE : BREAK3_TIME_ITEM_CODE,
            V_P_BREAK3_START_DAY_TYPE : BREAK3_START_DAY_TYPE,
            V_P_BREAK3_START_HHMM : BREAK3_START_HHMM,
            V_P_BREAK3_END_DAY_TYPE : BREAK3_END_DAY_TYPE,
            V_P_BREAK3_END_HHMM : BREAK3_END_HHMM,
            V_P_BREAK4_TIME_ITEM_CODE : BREAK4_TIME_ITEM_CODE,
            V_P_BREAK4_START_DAY_TYPE : BREAK4_START_DAY_TYPE,
            V_P_BREAK4_START_HHMM : BREAK4_START_HHMM,
            V_P_BREAK4_END_DAY_TYPE : BREAK4_END_DAY_TYPE,
            V_P_BREAK4_END_HHMM : BREAK4_END_HHMM,
            V_P_BREAK5_TIME_ITEM_CODE : BREAK5_TIME_ITEM_CODE,
            V_P_BREAK5_START_DAY_TYPE : BREAK5_START_DAY_TYPE,
            V_P_BREAK5_START_HHMM : BREAK5_START_HHMM,
            V_P_BREAK5_END_DAY_TYPE : BREAK5_END_DAY_TYPE,
            V_P_BREAK5_END_HHMM : BREAK5_END_HHMM,
            V_P_NORMAL_BREAK_APPLY_YN : NORMAL_BREAK_APPLY_YN.NORMAL_BREAK_APPLY_YN,
            V_P_OVER_BREAK_APPLY_YN : OVER_BREAK_APPLY_YN.OVER_BREAK_APPLY_YN,
            V_P_NIGHT_BREAK_APPLY_YN : NIGHT_BREAK_APPLY_YN.NIGHT_BREAK_APPLY_YN,
            V_P_AFTER1_BREAK_APPLY_YN : AFTER1_BREAK_APPLY_YN.AFTER1_BREAK_APPLY_YN,
            V_P_AFTER2_BREAK_APPLY_YN : AFTER2_BREAK_APPLY_YN.AFTER2_BREAK_APPLY_YN,
            V_P_MEMO : MEMO,
            V_P_USE_YN : USE_YN.USE_YN,
            V_P_FIVE_WEEK_YN : FIVE_WEEK_YN.FIVE_WEEK_YN,
            V_P_BACK_COLOR : BACK_COLOR,
            V_P_WORK_TYPE_CODE : WORK_TYPE_CODE,
            V_P_WORK_DAY_TYPE : WORK_DAY_TYPE,
            V_P_SHIFT_CATEGORY : SHIFT_CATEGORY,
            V_P_PAY_ALLOWANCE_FLAG : PAY_ALLOWANCE_FLAG,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        }

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1210.do", {
            getType				: 'json',
            workType			: editType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                fn_search();
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

    const fn_delete = async function() {
        if(gfn_comConfirm("Q0001", "근무조를 삭제")) {
            editType = "D";
            fn_save();
        }
    }

    const fn_search = async function() {
        editType = "N";
        SBUxMethod.attr('EMP_CODE', 'readonly', 'true');
        let SHIFT_CODE	    = gfnma_nvl(gfnma_multiSelectGet('#SRCH_SHIFT_CODE'));
        let SHIFT_NAME	    = gfnma_nvl(SBUxMethod.get("SRCH_SHIFT_NAME"));
        let USE_YN	    = gfnma_nvl(SBUxMethod.get("USE_YN"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_SHIFT_CODE : SHIFT_CODE,
            V_P_SHIFT_NAME : SHIFT_NAME,
            V_P_USE_YN : USE_YN.USE_YN,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt1210List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                jsonShiftList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        SHIFT_CODE : item.SHIFT_CODE,
                        SHIFT_NAME : item.SHIFT_NAME,
                        WORK_ON_DAY_TYPE : item.WORK_ON_DAY_TYPE,
                        WORK_ON_HHMM : item.WORK_ON_HHMM,
                        WORK_ON_HH : item.WORK_ON_HH,
                        WORK_ON_MM : item.WORK_ON_MM,
                        WORK_OFF_DAY_TYPE : item.WORK_OFF_DAY_TYPE,
                        WORK_OFF_HHMM : item.WORK_OFF_HHMM,
                        WORK_OFF_HH : item.WORK_OFF_HH,
                        WORK_OFF_MM : item.WORK_OFF_MM,
                        WORK_HOURS : item.WORK_HOURS,
                        NORMAL_TIME_ITEM_CODE : item.NORMAL_TIME_ITEM_CODE,
                        NORMAL_START_DAY_TYPE : item.NORMAL_START_DAY_TYPE,
                        NORMAL_START_HHMM : item.NORMAL_START_HHMM,
                        NORMAL_START_HH : item.NORMAL_START_HH,
                        NORMAL_START_MM : item.NORMAL_START_MM,
                        NORMAL_END_DAY_TYPE : item.NORMAL_END_DAY_TYPE,
                        NORMAL_END_HHMM : item.NORMAL_END_HHMM,
                        NORMAL_END_HH : item.NORMAL_END_HH,
                        NORMAL_END_MM : item.NORMAL_END_MM,
                        NORMAL_HOURS : item.NORMAL_HOURS,
                        OVER_TIME_ITEM_CODE : item.OVER_TIME_ITEM_CODE,
                        OVER_START_DAY_TYPE : item.OVER_START_DAY_TYPE,
                        OVER_START_HHMM : item.OVER_START_HHMM,
                        OVER_START_HH : item.OVER_START_HH,
                        OVER_START_MM : item.OVER_START_MM,
                        OVER_END_DAY_TYPE : item.OVER_END_DAY_TYPE,
                        OVER_END_HHMM : item.OVER_END_HHMM,
                        OVER_END_HH : item.OVER_END_HH,
                        OVER_END_MM : item.OVER_END_MM,
                        OVER_HOURS : item.OVER_HOURS,
                        NIGHT_TIME_ITEM_CODE : item.NIGHT_TIME_ITEM_CODE,
                        NIGHT_START_DAY_TYPE : item.NIGHT_START_DAY_TYPE,
                        NIGHT_START_HHMM : item.NIGHT_START_HHMM,
                        NIGHT_START_HH : item.NIGHT_START_HH,
                        NIGHT_START_MM : item.NIGHT_START_MM,
                        NIGHT_END_DAY_TYPE : item.NIGHT_END_DAY_TYPE,
                        NIGHT_END_HHMM : item.NIGHT_END_HHMM,
                        NIGHT_END_HH : item.NIGHT_END_HH,
                        NIGHT_END_MM : item.NIGHT_END_MM,
                        NIGHT_HOURS : item.NIGHT_HOURS,
                        AFTER1_TIME_ITEM_CODE : item.AFTER1_TIME_ITEM_CODE,
                        AFTER1_START_DAY_TYPE : item.AFTER1_START_DAY_TYPE,
                        AFTER1_START_HHMM : item.AFTER1_START_HHMM,
                        AFTER1_START_HH : item.AFTER1_START_HH,
                        AFTER1_START_MM : item.AFTER1_START_MM,
                        AFTER1_END_DAY_TYPE : item.AFTER1_END_DAY_TYPE,
                        AFTER1_END_HHMM : item.AFTER1_END_HHMM,
                        AFTER1_END_HH : item.AFTER1_END_HH,
                        AFTER1_END_MM : item.AFTER1_END_MM,
                        AFTER1_HOURS : item.AFTER1_HOURS,
                        AFTER2_TIME_ITEM_CODE : item.AFTER2_TIME_ITEM_CODE,
                        AFTER2_START_DAY_TYPE : item.AFTER2_START_DAY_TYPE,
                        AFTER2_START_HHMM : item.AFTER2_START_HHMM,
                        AFTER2_START_HH : item.AFTER2_START_HH,
                        AFTER2_START_MM : item.AFTER2_START_MM,
                        AFTER2_END_DAY_TYPE : item.AFTER2_END_DAY_TYPE,
                        AFTER2_END_HHMM : item.AFTER2_END_HHMM,
                        AFTER2_END_HH : item.AFTER2_END_HH,
                        AFTER2_END_MM : item.AFTER2_END_MM,
                        AFTER2_HOURS : item.AFTER2_HOURS,
                        AFTER3_TIME_ITEM_CODE : item.AFTER3_TIME_ITEM_CODE,
                        AFTER3_START_DAY_TYPE : item.AFTER3_START_DAY_TYPE,
                        AFTER3_START_HHMM : item.AFTER3_START_HHMM,
                        AFTER3_START_HH : item.AFTER3_START_HH,
                        AFTER3_START_MM : item.AFTER3_START_MM,
                        AFTER3_END_DAY_TYPE : item.AFTER3_END_DAY_TYPE,
                        AFTER3_END_HHMM : item.AFTER3_END_HHMM,
                        AFTER3_END_HH : item.AFTER3_END_HH,
                        AFTER3_END_MM : item.AFTER3_END_MM,
                        AFTER3_HOURS : item.AFTER3_HOURS,
                        AFTER4_TIME_ITEM_CODE : item.AFTER4_TIME_ITEM_CODE,
                        AFTER4_START_DAY_TYPE : item.AFTER4_START_DAY_TYPE,
                        AFTER4_START_HHMM : item.AFTER4_START_HHMM,
                        AFTER4_START_HH : item.AFTER4_START_HH,
                        AFTER4_START_MM : item.AFTER4_START_MM,
                        AFTER4_END_DAY_TYPE : item.AFTER4_END_DAY_TYPE,
                        AFTER4_END_HHMM : item.AFTER4_END_HHMM,
                        AFTER4_END_HH : item.AFTER4_END_HH,
                        AFTER4_END_MM : item.AFTER4_END_MM,
                        AFTER4_HOURS : item.AFTER4_HOURS,
                        BREAK1_TIME_ITEM_CODE : item.BREAK1_TIME_ITEM_CODE,
                        BREAK1_START_DAY_TYPE : item.BREAK1_START_DAY_TYPE,
                        BREAK1_START_HHMM : item.BREAK1_START_HHMM,
                        BREAK1_START_HH : item.BREAK1_START_HH,
                        BREAK1_START_MM : item.BREAK1_START_MM,
                        BREAK1_END_DAY_TYPE : item.BREAK1_END_DAY_TYPE,
                        BREAK1_END_HHMM : item.BREAK1_END_HHMM,
                        BREAK1_END_HH : item.BREAK1_END_HH,
                        BREAK1_END_MM : item.BREAK1_END_MM,
                        BREAK1_HOURS : item.BREAK1_HOURS,
                        BREAK2_TIME_ITEM_CODE : item.BREAK2_TIME_ITEM_CODE,
                        BREAK2_START_DAY_TYPE : item.BREAK2_START_DAY_TYPE,
                        BREAK2_START_HHMM : item.BREAK2_START_HHMM,
                        BREAK2_START_HH : item.BREAK2_START_HH,
                        BREAK2_START_MM : item.BREAK2_START_MM,
                        BREAK2_END_DAY_TYPE : item.BREAK2_END_DAY_TYPE,
                        BREAK2_END_HHMM : item.BREAK2_END_HHMM,
                        BREAK2_END_HH : item.BREAK2_END_HH,
                        BREAK2_END_MM : item.BREAK2_END_MM,
                        BREAK2_HOURS : item.BREAK2_HOURS,
                        BREAK3_TIME_ITEM_CODE : item.BREAK3_TIME_ITEM_CODE,
                        BREAK3_START_DAY_TYPE : item.BREAK3_START_DAY_TYPE,
                        BREAK3_START_HHMM : item.BREAK3_START_HHMM,
                        BREAK3_START_HH : item.BREAK3_START_HH,
                        BREAK3_START_MM : item.BREAK3_START_MM,
                        BREAK3_END_DAY_TYPE : item.BREAK3_END_DAY_TYPE,
                        BREAK3_END_HHMM : item.BREAK3_END_HHMM,
                        BREAK3_END_HH : item.BREAK3_END_HH,
                        BREAK3_END_MM : item.BREAK3_END_MM,
                        BREAK3_HOURS : item.BREAK3_HOURS,
                        BREAK4_TIME_ITEM_CODE : item.BREAK4_TIME_ITEM_CODE,
                        BREAK4_START_DAY_TYPE : item.BREAK4_START_DAY_TYPE,
                        BREAK4_START_HHMM : item.BREAK4_START_HHMM,
                        BREAK4_START_HH : item.BREAK4_START_HH,
                        BREAK4_START_MM : item.BREAK4_START_MM,
                        BREAK4_END_DAY_TYPE : item.BREAK4_END_DAY_TYPE,
                        BREAK4_END_HHMM : item.BREAK4_END_HHMM,
                        BREAK4_END_HH : item.BREAK4_END_HH,
                        BREAK4_END_MM : item.BREAK4_END_MM,
                        BREAK4_HOURS : item.BREAK4_HOURS,
                        BREAK5_TIME_ITEM_CODE : item.BREAK5_TIME_ITEM_CODE,
                        BREAK5_START_DAY_TYPE : item.BREAK5_START_DAY_TYPE,
                        BREAK5_START_HHMM : item.BREAK5_START_HHMM,
                        BREAK5_START_HH : item.BREAK5_START_HH,
                        BREAK5_START_MM : item.BREAK5_START_MM,
                        BREAK5_END_DAY_TYPE : item.BREAK5_END_DAY_TYPE,
                        BREAK5_END_HHMM : item.BREAK5_END_HHMM,
                        BREAK5_END_HH : item.BREAK5_END_HH,
                        BREAK5_END_MM : item.BREAK5_END_MM,
                        BREAK5_HOURS : item.BREAK5_HOURS,
                        NORMAL_BREAK_APPLY_YN : item.NORMAL_BREAK_APPLY_YN,
                        OVER_BREAK_APPLY_YN : item.OVER_BREAK_APPLY_YN,
                        NIGHT_BREAK_APPLY_YN : item.NIGHT_BREAK_APPLY_YN,
                        AFTER1_BREAK_APPLY_YN : item.AFTER1_BREAK_APPLY_YN,
                        AFTER2_BREAK_APPLY_YN : item.AFTER2_BREAK_APPLY_YN,
                        MEMO : item.MEMO,
                        USE_YN : item.USE_YN,
                        FIVE_WEEK_YN : item.FIVE_WEEK_YN,
                        BACK_COLOR : item.BACK_COLOR,
                        WORK_TYPE_CODE : item.WORK_TYPE_CODE,
                        WORK_DAY_TYPE : item.WORK_DAY_TYPE,
                        SHIFT_CATEGORY : item.SHIFT_CATEGORY,
                        PAY_ALLOWANCE_FLAG : item.PAY_ALLOWANCE_FLAG
                    }
                    jsonShiftList.push(msg);
                });

                bandgvwInfo.rebuild();
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

    const fn_copy = async function() {
        editType = "N";
        SBUxMethod.attr("SHIFT_CODE", "readonly", false);
    }

    const fn_view = async function() {
        editType = "U";
        $("#btn_copy").attr("disabled", false);
        SBUxMethod.attr("SHIFT_CODE", "readonly", true);

        var nCol = bandgvwInfo.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = bandgvwInfo.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = bandgvwInfo.getRowData(nRow);

        SBUxMethod.set("SHIFT_CODE", rowData.SHIFT_CODE);
        SBUxMethod.set("SHIFT_NAME", rowData.SHIFT_NAME);
        SBUxMethod.set("USE_YN", rowData.USE_YN);
        SBUxMethod.set("FIVE_WEEK_YN", rowData.FIVE_WEEK_YN);
        SBUxMethod.set("SHIFT_CATEGORY", rowData.SHIFT_CATEGORY);
        SBUxMethod.set("WORK_TYPE_CODE", rowData.WORK_TYPE_CODE);
        SBUxMethod.set("WORK_DAY_TYPE", rowData.WORK_DAY_TYPE);
        SBUxMethod.set("BACK_COLOR", rowData.BACK_COLOR);
        SBUxMethod.set("PAY_ALLOWANCE_FLAG", rowData.PAY_ALLOWANCE_FLAG);
        SBUxMethod.set("WORK_ON_DAY_TYPE", rowData.WORK_ON_DAY_TYPE);
        SBUxMethod.set("WORK_ON_HH", rowData.WORK_ON_HH);
        SBUxMethod.set("WORK_ON_MM", rowData.WORK_ON_MM);
        SBUxMethod.set("WORK_OFF_DAY_TYPE", rowData.WORK_OFF_DAY_TYPE);
        SBUxMethod.set("WORK_OFF_HH", rowData.WORK_OFF_HH);
        SBUxMethod.set("WORK_OFF_MM", rowData.WORK_OFF_MM);
        SBUxMethod.set("WORK_HOURS", rowData.WORK_HOURS);
        SBUxMethod.set("NORMAL_START_DAY_TYPE", rowData.NORMAL_START_DAY_TYPE);
        SBUxMethod.set("NORMAL_START_HH", rowData.NORMAL_START_HH);
        SBUxMethod.set("NORMAL_START_MM", rowData.NORMAL_START_MM);
        SBUxMethod.set("NORMAL_END_DAY_TYPE", rowData.NORMAL_END_DAY_TYPE);
        SBUxMethod.set("NORMAL_END_HH", rowData.NORMAL_END_HH);
        SBUxMethod.set("NORMAL_END_MM", rowData.NORMAL_END_MM);
        SBUxMethod.set("NORMAL_HOURS", rowData.NORMAL_HOURS);
        SBUxMethod.set("NORMAL_TIME_ITEM_CODE", rowData.NORMAL_TIME_ITEM_CODE);
        SBUxMethod.set("NORMAL_BREAK_APPLY_YN", rowData.NORMAL_BREAK_APPLY_YN);
        SBUxMethod.set("OVER_START_DAY_TYPE", rowData.OVER_START_DAY_TYPE);
        SBUxMethod.set("OVER_START_HH", rowData.OVER_START_HH);
        SBUxMethod.set("OVER_START_MM", rowData.OVER_START_MM);
        SBUxMethod.set("OVER_END_DAY_TYPE", rowData.OVER_END_DAY_TYPE);
        SBUxMethod.set("OVER_END_HH", rowData.OVER_END_HH);
        SBUxMethod.set("OVER_END_MM", rowData.OVER_END_MM);
        SBUxMethod.set("OVER_HOURS", rowData.OVER_HOURS);
        SBUxMethod.set("OVER_TIME_ITEM_CODE", rowData.OVER_TIME_ITEM_CODE);
        SBUxMethod.set("OVER_BREAK_APPLY_YN", rowData.OVER_BREAK_APPLY_YN);
        SBUxMethod.set("NIGHT_START_DAY_TYPE", rowData.NIGHT_START_DAY_TYPE);
        SBUxMethod.set("NIGHT_START_HH", rowData.NIGHT_START_HH);
        SBUxMethod.set("NIGHT_START_MM", rowData.NIGHT_START_MM);
        SBUxMethod.set("NIGHT_END_DAY_TYPE", rowData.NIGHT_END_DAY_TYPE);
        SBUxMethod.set("NIGHT_END_HH", rowData.NIGHT_END_HH);
        SBUxMethod.set("NIGHT_END_MM", rowData.NIGHT_END_MM);
        SBUxMethod.set("NIGHT_HOURS", rowData.NIGHT_HOURS);
        SBUxMethod.set("NIGHT_TIME_ITEM_CODE", rowData.NIGHT_TIME_ITEM_CODE);
        SBUxMethod.set("NIGHT_BREAK_APPLY_YN", rowData.NIGHT_BREAK_APPLY_YN);
        SBUxMethod.set("AFTER1_START_DAY_TYPE", rowData.AFTER1_START_DAY_TYPE);
        SBUxMethod.set("AFTER1_START_HH", rowData.AFTER1_START_HH);
        SBUxMethod.set("AFTER1_START_MM", rowData.AFTER1_START_MM);
        SBUxMethod.set("AFTER1_END_DAY_TYPE", rowData.AFTER1_END_DAY_TYPE);
        SBUxMethod.set("AFTER1_END_HH", rowData.AFTER1_END_HH);
        SBUxMethod.set("AFTER1_END_MM", rowData.AFTER1_END_MM);
        SBUxMethod.set("AFTER1_HOURS", rowData.AFTER1_HOURS);
        SBUxMethod.set("AFTER1_TIME_ITEM_CODE", rowData.AFTER1_TIME_ITEM_CODE);
        SBUxMethod.set("AFTER1_BREAK_APPLY_YN", rowData.AFTER1_BREAK_APPLY_YN);
        SBUxMethod.set("AFTER2_START_DAY_TYPE", rowData.AFTER2_START_DAY_TYPE);
        SBUxMethod.set("AFTER2_START_HH", rowData.AFTER2_START_HH);
        SBUxMethod.set("AFTER2_START_MM", rowData.AFTER2_START_MM);
        SBUxMethod.set("AFTER2_END_DAY_TYPE", rowData.AFTER2_END_DAY_TYPE);
        SBUxMethod.set("AFTER2_END_HH", rowData.AFTER2_END_HH);
        SBUxMethod.set("AFTER2_END_MM", rowData.AFTER2_END_MM);
        SBUxMethod.set("AFTER2_HOURS", rowData.AFTER2_HOURS);
        SBUxMethod.set("AFTER2_TIME_ITEM_CODE", rowData.AFTER2_TIME_ITEM_CODE);
        SBUxMethod.set("AFTER2_BREAK_APPLY_YN", rowData.AFTER2_BREAK_APPLY_YN);
        SBUxMethod.set("AFTER3_START_DAY_TYPE", rowData.AFTER3_START_DAY_TYPE);
        SBUxMethod.set("AFTER3_START_HH", rowData.AFTER3_START_HH);
        SBUxMethod.set("AFTER3_START_MM", rowData.AFTER3_START_MM);
        SBUxMethod.set("AFTER3_END_DAY_TYPE", rowData.AFTER3_END_DAY_TYPE);
        SBUxMethod.set("AFTER3_END_HH", rowData.AFTER3_END_HH);
        SBUxMethod.set("AFTER3_END_MM", rowData.AFTER3_END_MM);
        SBUxMethod.set("AFTER3_HOURS", rowData.AFTER3_HOURS);
        SBUxMethod.set("AFTER3_TIME_ITEM_CODE", rowData.AFTER3_TIME_ITEM_CODE);
        SBUxMethod.set("AFTER4_START_DAY_TYPE", rowData.AFTER4_START_DAY_TYPE);
        SBUxMethod.set("AFTER4_START_HH", rowData.AFTER4_START_HH);
        SBUxMethod.set("AFTER4_START_MM", rowData.AFTER4_START_MM);
        SBUxMethod.set("AFTER4_END_DAY_TYPE", rowData.AFTER4_END_DAY_TYPE);
        SBUxMethod.set("AFTER4_END_HH", rowData.AFTER4_END_HH);
        SBUxMethod.set("AFTER4_END_MM", rowData.AFTER4_END_MM);
        SBUxMethod.set("AFTER4_HOURS", rowData.AFTER4_HOURS);
        SBUxMethod.set("AFTER4_TIME_ITEM_CODE", rowData.AFTER4_TIME_ITEM_CODE);
        SBUxMethod.set("BREAK1_START_DAY_TYPE", rowData.BREAK1_START_DAY_TYPE);
        SBUxMethod.set("BREAK1_START_HH", rowData.BREAK1_START_HH);
        SBUxMethod.set("BREAK1_START_MM", rowData.BREAK1_START_MM);
        SBUxMethod.set("BREAK1_END_DAY_TYPE", rowData.BREAK1_END_DAY_TYPE);
        SBUxMethod.set("BREAK1_END_HH", rowData.BREAK1_END_HH);
        SBUxMethod.set("BREAK1_END_MM", rowData.BREAK1_END_MM);
        SBUxMethod.set("BREAK1_HOURS", rowData.BREAK1_HOURS);
        SBUxMethod.set("BREAK1_TIME_ITEM_CODE", rowData.BREAK1_TIME_ITEM_CODE);
        SBUxMethod.set("BREAK2_START_DAY_TYPE", rowData.BREAK2_START_DAY_TYPE);
        SBUxMethod.set("BREAK2_START_HH", rowData.BREAK2_START_HH);
        SBUxMethod.set("BREAK2_START_MM", rowData.BREAK2_START_MM);
        SBUxMethod.set("BREAK2_END_DAY_TYPE", rowData.BREAK2_END_DAY_TYPE);
        SBUxMethod.set("BREAK2_END_HH", rowData.BREAK2_END_HH);
        SBUxMethod.set("BREAK2_END_MM", rowData.BREAK2_END_MM);
        SBUxMethod.set("BREAK2_HOURS", rowData.BREAK2_HOURS);
        SBUxMethod.set("BREAK2_TIME_ITEM_CODE", rowData.BREAK2_TIME_ITEM_CODE);
        SBUxMethod.set("BREAK3_START_DAY_TYPE", rowData.BREAK3_START_DAY_TYPE);
        SBUxMethod.set("BREAK3_START_HH", rowData.BREAK3_START_HH);
        SBUxMethod.set("BREAK3_START_MM", rowData.BREAK3_START_MM);
        SBUxMethod.set("BREAK3_END_DAY_TYPE", rowData.BREAK3_END_DAY_TYPE);
        SBUxMethod.set("BREAK3_END_HH", rowData.BREAK3_END_HH);
        SBUxMethod.set("BREAK3_END_MM", rowData.BREAK3_END_MM);
        SBUxMethod.set("BREAK3_HOURS", rowData.BREAK3_HOURS);
        SBUxMethod.set("BREAK3_TIME_ITEM_CODE", rowData.BREAK3_TIME_ITEM_CODE);
        SBUxMethod.set("BREAK4_START_DAY_TYPE", rowData.BREAK4_START_DAY_TYPE);
        SBUxMethod.set("BREAK4_START_HH", rowData.BREAK4_START_HH);
        SBUxMethod.set("BREAK4_START_MM", rowData.BREAK4_START_MM);
        SBUxMethod.set("BREAK4_END_DAY_TYPE", rowData.BREAK4_END_DAY_TYPE);
        SBUxMethod.set("BREAK4_END_HH", rowData.BREAK4_END_HH);
        SBUxMethod.set("BREAK4_END_MM", rowData.BREAK4_END_MM);
        SBUxMethod.set("BREAK4_HOURS", rowData.BREAK4_HOURS);
        SBUxMethod.set("BREAK4_TIME_ITEM_CODE", rowData.BREAK4_TIME_ITEM_CODE);
        SBUxMethod.set("BREAK5_START_DAY_TYPE", rowData.BREAK5_START_DAY_TYPE);
        SBUxMethod.set("BREAK5_START_HH", rowData.BREAK5_START_HH);
        SBUxMethod.set("BREAK5_START_MM", rowData.BREAK5_START_MM);
        SBUxMethod.set("BREAK5_END_DAY_TYPE", rowData.BREAK5_END_DAY_TYPE);
        SBUxMethod.set("BREAK5_END_HH", rowData.BREAK5_END_HH);
        SBUxMethod.set("BREAK5_END_MM", rowData.BREAK5_END_MM);
        SBUxMethod.set("BREAK5_HOURS", rowData.BREAK5_HOURS);
        SBUxMethod.set("BREAK5_TIME_ITEM_CODE", rowData.BREAK5_TIME_ITEM_CODE);
        SBUxMethod.set("MEMO", rowData.MEMO);
    }

    const fn_afterRebuild = async function() {
        let bandgvwInfoData = bandgvwInfo.getGridDataAll();

        for(var i = 0; i < bandgvwInfoData.length; i++) {
            let rowData = bandgvwInfo.getRowData(i+2);
            bandgvwInfo.setCellStyle('background-color', i+2, 0, i+2, 0, rowData.BACK_COLOR);
        }
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
