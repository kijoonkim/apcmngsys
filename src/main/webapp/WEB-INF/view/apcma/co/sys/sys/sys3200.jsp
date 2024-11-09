<%
    /**
     * @Class Name        : sys3200.jsp
     * @Description       : 관리번호 채번 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.14
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.14   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 관리번호 채번 정보</title>
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
                </h3><!-- 국가정보 -->
            </div>
           <%-- <div style="margin-left: auto;">
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger"
                             onclick="fn_create"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" 	uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"
                             onclick="fn_delete"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"
                             onclick="fn_search"></sbux-button>
            </div>--%>
        </div>

        <!--[pp] 검색 -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
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
                <th scope="row" class="th_bg">채번그룹</th>
               <%-- <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="SRCH_NUMBERING_GROUP"
                            name="SRCH_NUMBERING_GROUP"
                            class="form-control input-sm"
                            jsondata-ref="jsonNumberingGroup"
                    />
                </td>--%>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_NUMBERING_GROUP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="SRCH_NUMBERING_GROUP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">채번 ID</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="SRCH_NUMBERING_ID" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">채번명</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="SRCH_NUMBERING_NAME" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>채번리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-grwInfo" style="height:800px; width:100%;"></div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>기본정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">채번 ID</th>
                            <td class="td_input">
                                <sbux-input id="NUMBERING_ID" class="form-control input-sm inpt_data_reqed" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">채번그룹</th>
                            <%--<td class="td_input">
                                <sbux-select
                                        id="NUMBERING_GROUP"
                                        name="NUMBERING_GROUP"
                                        uitype="single"
                                        jsondata-ref="jsonNumberingGroup"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>--%>
                            <td class="td_input" style="border-right: hidden;">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="NUMBERING_GROUP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="NUMBERING_GROUP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">사용여부</th>
                            <td class="td_input">
                                <sbux-checkbox id="USE_YN" name="USE_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채 번 명</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="NUMBERING_NAME" class="form-control input-sm inpt_data_reqed" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">채번길이</th>
                            <td class="td_input">
                                <sbux-input
                                        id="NUMBER_LENGTH"
                                        name="NUMBER_LENGTH"
                                        uitype="text"
                                        class="form-control input-sm inpt_data_reqed"
                                        mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
                                        maxlength="10"
                                        style="width:100%"
                                ></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="DESCR" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">자동채번여부</th>
                            <td class="td_input">
                                <sbux-checkbox id="AUTO_NUM_YN" name="AUTO_NUM_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>채번 구성 정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:8%">
                            <col style="width:4%">
                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:8%">
                            <col style="width:4%">
                            <col style="width:6%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">채번요소1</th>
                            <td class="td_input">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="NUMBER_ELEMENT1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="NUMBER_ELEMENT1" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">채번요소값1</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE1" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소1</th>
                            <td class="td_input">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SURFIX_ELEMENT1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SURFIX_ELEMENT1" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">접미요소값1</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE1" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소2</th>
                            <td class="td_input">
                               <%-- <sbux-select
                                        id="NUMBER_ELEMENT2"
                                        name="NUMBER_ELEMENT2"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement2"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="NUMBER_ELEMENT2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="NUMBER_ELEMENT2" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">채번요소값2</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE2" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소2</th>
                            <td class="td_input">
                                <%--<sbux-input id="SURFIX_ELEMENT2" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SURFIX_ELEMENT2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SURFIX_ELEMENT2" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">접미요소값2</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE2" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소3</th>
                            <td class="td_input">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="NUMBER_ELEMENT3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="NUMBER_ELEMENT3" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">채번요소값3</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE3" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소3</th>
                            <td class="td_input">
                                <%--<sbux-input id="SURFIX_ELEMENT3" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SURFIX_ELEMENT3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SURFIX_ELEMENT3" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">접미요소값3</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE3" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소4</th>
                            <td class="td_input">
                                <%--<sbux-select
                                        id="NUMBER_ELEMENT4"
                                        name="NUMBER_ELEMENT4"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement4"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="NUMBER_ELEMENT4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="NUMBER_ELEMENT4" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">채번요소값4</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE4" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소4</th>
                            <td class="td_input">
                               <%-- <sbux-input id="SURFIX_ELEMENT4" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SURFIX_ELEMENT4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SURFIX_ELEMENT4" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">접미요소값4</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE4" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소5</th>
                            <td class="td_input">
                               <%-- <sbux-select
                                        id="NUMBER_ELEMENT5"
                                        name="NUMBER_ELEMENT5"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement5"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="NUMBER_ELEMENT5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="NUMBER_ELEMENT5" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">채번요소값5</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE5" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소5</th>
                            <td class="td_input">
                               <%-- <sbux-input id="SURFIX_ELEMENT5" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>--%>
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SURFIX_ELEMENT5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SURFIX_ELEMENT5" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">접미요소값5</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE5" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">시작채번연번</th>
                            <td class="td_input">
                                <sbux-input id="START_SERNO" class="form-control input-sm inpt_data_reqed" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">고유일련번호</th>
                            <td class="td_input">
                                <sbux-checkbox id="UNIQUE_YN" name="UNIQUE_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>채번 샘플 보기</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:30%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">
                                <sbux-button id="btnSearchNumSP" name="btnSearchNumSP" uitype="normal" text="채번 샘플 보기"
                                             class="btn btn-sm btn-outline-danger"
                                             onclick="fn_SearchNumSP"></sbux-button>
                            </th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_SAMPLE" class="form-control input-sm" uitype="text" required
                                            style="width:100%" ></sbux-input>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>채번 이력</span></li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button
                                id="btnDel"
                                name="btnDel"
                                uitype="normal"
                                text="행삭제"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_delRow"
                                style="float: right;"
                        >
                        </sbux-button>
                        <sbux-button
                                id="btnAdd"
                                name="btnAdd"
                                uitype="normal"
                                text="행추가"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_addRow"
                                style="float: right;"
                        ></sbux-button>
                    </div>
                    <div>
                        <div id="sb-area-gvwHistory" style="height:283px; width:100%;"></div>
                    </div>
                </div>
                <%--<div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwHistory" style="height:283px; width:100%;"></div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType = "N"; //신규, 수정 구분 ( N : 신규 , E : 수정 )

    var jsonNumberingGroup = []; //채번그룹 ( L_SYS001 )
    var jsonNumberElement1 = []; //채번요소1 ( L_SYS002 )number_element1


    //grid 초기화
    var gvwInfoGrid; 			    // 그리드를 담기위한 객체 선언      ( 채번리스트 )
    var jsonGvwInfoList = []; 	    // 그리드의 참조 데이터 주소 선언   ( 채번리스트 )
    var gvwHistoryGrid;	            // 그리드를 담기위한 객체 선언      ( 채번이력 )
    var jsonGvwHistoryList = []; 	// 그리드의 참조 데이터 주소 선언   ( 채번이력 )

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
           /* gfnma_setComSelect(['NUMBER_ELEMENT3'], jsonNumberElement1, 'L_SYS002', '', '', 'sub_code', 'code_name', 'Y', ''),*/
            //gfnma_setComSelect(['SRCH_NUMBERING_GROUP'], jsonNumberingGroup, 'L_SYS001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonNumberElement1, 'L_SYS002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //급여체계
            gfnma_multiSelectInit({
                target			: ['#SRCH_NUMBERING_GROUP','#NUMBERING_GROUP']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_SYS001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            gfnma_multiSelectInit({
                target			: ['#NUMBER_ELEMENT1','#NUMBER_ELEMENT2','#NUMBER_ELEMENT3','#NUMBER_ELEMENT4','#NUMBER_ELEMENT5'
                    ,'#SURFIX_ELEMENT1' ,'#SURFIX_ELEMENT2','#SURFIX_ELEMENT3','#SURFIX_ELEMENT4','#SURFIX_ELEMENT5']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_SYS002'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'}
                ]
            })
        ]);
    }


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();

        fn_init();
    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createHistoryGrid();
        fn_search();
    }

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

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.explorerbar = 'sortmove';*/
        /* SBGridProperties.rowheader = 'seq';*/
        /*SBGridProperties.rowheadercaption = {seq: 'No'};*/
        /*SBGridProperties.rowheaderwidth = {seq: '60'};*/
        SBGridProperties.extendlastcol = 'scroll';
        //SBGridProperties.filtering = true;
        SBGridProperties.columns = [
            {caption: ["채번 ID"], ref: 'NUMBERING_ID', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["채 번 명"], ref: 'NUMBERING_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사용여부"], ref: 'USE_YN', type: 'checkbox', width: '100px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["고유일련번호"], ref: 'UNIQUE_YN', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["자동채번여부"], ref: 'AUTO_NUM_YN', type: 'checkbox', width: '100px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["채번길이"], ref: 'NUMBER_LENGTH', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["채번요소1"], ref : 'NUMBER_ELEMENT1', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["채번요소값1"], ref: 'NUMBER_VALUE1', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["접미요소1"], ref : 'SURFIX_ELEMENT1', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["접미요소값1"], ref: 'SURFIX_VALUE1', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["채번요소2"], ref : 'NUMBER_ELEMENT2', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["채번요소값2"], ref: 'NUMBER_VALUE2', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["접미요소2"], ref : 'SURFIX_ELEMENT2', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["접미요소값2"], ref: 'SURFIX_VALUE2', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["채번요소3"], ref : 'NUMBER_ELEMENT3', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["채번요소값3"], ref: 'NUMBER_VALUE3', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["접미요소3"], ref : 'SURFIX_ELEMENT3', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["접미요소값3"], ref: 'SURFIX_VALUE3', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["채번요소4"], ref : 'NUMBER_ELEMENT4', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["채번요소값4"], ref: 'NUMBER_VALUE4', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["접미요소4"], ref : 'SURFIX_ELEMENT4', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["접미요소값4"], ref: 'SURFIX_VALUE4', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["채번요소5"], ref : 'NUMBER_ELEMENT5', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["채번요소값5"], ref: 'NUMBER_VALUE5', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption : ["접미요소5"], ref : 'SURFIX_ELEMENT5', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonNumberElement1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["접미요소값5"], ref: 'SURFIX_VALUE5', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption: ["시작채번연번"], ref: 'START_SERNO', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption: ["고유일련번호"], ref: 'UNIQUE_YN', type: 'checkbox', width: '100px', style: 'text-align:center', hidden: true,
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },

            {caption: ["채번 샘플"], ref: 'NUMBER_SAMPLE', type: 'output', width: '150px', style: 'text-align:left', hidden: true},
            {caption: ["채번그룹"], ref: 'NUMBERING_GROUP', type: 'output', width: '150px', style: 'text-align:left', hidden: true},


        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
        /* gvwInfoGrid.bind('beforepagechanged', 'fn_pagingComMsgList');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        // form clear
        fn_clearForm();
        gvwInfoGrid.clearStatus();

        let V_P_NUMBERING_GROUP     = gfn_nvl(SBUxMethod.get("SRCH_NUMBERING_GROUP"));
        let V_P_NUMBERING_ID        = gfn_nvl(SBUxMethod.get("SRCH_NUMBERING_ID"));
        let V_P_NUMBERING_NAME      = gfn_nvl(SBUxMethod.get("SRCH_NUMBERING_NAME"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_NUMBERING_GROUP   : V_P_NUMBERING_GROUP
            , V_P_NUMBERING_ID      : V_P_NUMBERING_ID
            , V_P_NUMBERING_NAME    : V_P_NUMBERING_NAME

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: p_userId
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/sys/selectSys3200List.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        NUMBERING_ID        : gfn_nvl(item.NUMBERING_ID),
                        NUMBERING_GROUP     : gfn_nvl(item.NUMBERING_GROUP),
                        USE_YN              : gfn_nvl(item.USE_YN),
                        NUMBERING_NAME      : gfn_nvl(item.NUMBERING_NAME),
                        NUMBER_LENGTH       : gfn_nvl(item.NUMBER_LENGTH),
                        DESCR               : gfn_nvl(item.DESCR),
                        AUTO_NUM_YN         : gfn_nvl(item.AUTO_NUM_YN),
                        NUMBER_ELEMENT1     : gfn_nvl(item.NUMBER_ELEMENT1),
                        NUMBER_VALUE1       : gfn_nvl(item.NUMBER_VALUE1),
                        SURFIX_ELEMENT1     : gfn_nvl(item.SURFIX_ELEMENT1),
                        SURFIX_VALUE1       : gfn_nvl(item.SURFIX_VALUE1),
                        NUMBER_ELEMENT2     : gfn_nvl(item.NUMBER_ELEMENT2),
                        NUMBER_VALUE2       : gfn_nvl(item.NUMBER_VALUE2),
                        SURFIX_ELEMENT2     : gfn_nvl(item.SURFIX_ELEMENT2),
                        SURFIX_VALUE2       : gfn_nvl(item.SURFIX_VALUE2),
                        NUMBER_ELEMENT3     : gfn_nvl(item.NUMBER_ELEMENT3),
                        NUMBER_VALUE3       : gfn_nvl(item.NUMBER_VALUE3),
                        SURFIX_ELEMENT3     : gfn_nvl(item.SURFIX_ELEMENT3),
                        SURFIX_VALUE3       : gfn_nvl(item.SURFIX_VALUE3),
                        NUMBER_ELEMENT4     : gfn_nvl(item.NUMBER_ELEMENT4),
                        NUMBER_VALUE4       : gfn_nvl(item.NUMBER_VALUE4),
                        SURFIX_ELEMENT4     : gfn_nvl(item.SURFIX_ELEMENT4),
                        SURFIX_VALUE4       : gfn_nvl(item.SURFIX_VALUE4),
                        NUMBER_ELEMENT5     : gfn_nvl(item.NUMBER_ELEMENT5),
                        NUMBER_VALUE5       : gfn_nvl(item.NUMBER_VALUE5),
                        SURFIX_ELEMENT5     : gfn_nvl(item.SURFIX_ELEMENT5),
                        START_SERNO         : gfn_nvl(item.START_SERNO),
                        UNIQUE_YN           : gfn_nvl(item.UNIQUE_YN),
                        /* NUMBER_SAMPLE: item.NUMBER_SAMPLE*/
                    }
                    jsonGvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonGvwInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
                }

                //fn_setData();


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

    const fn_setData = function () {

        editType = "E";

        let nRow = gvwInfoGrid.getRows();
        let nCol = gvwInfoGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        if (_.isEmpty(rowData) == false) {

            SBUxMethod.set("NUMBERING_ID"   , rowData.NUMBERING_ID);
            SBUxMethod.set("NUMBERING_GROUP", rowData.NUMBERING_GROUP);
            SBUxMethod.set("USE_YN"         , rowData.USE_YN);
            SBUxMethod.set("NUMBERING_NAME" , rowData.NUMBERING_NAME);
            SBUxMethod.set("NUMBER_LENGTH"  , rowData.NUMBER_LENGTH);
            SBUxMethod.set("DESCR"          , rowData.DESCR);
            SBUxMethod.set("AUTO_NUM_YN"    , rowData.AUTO_NUM_YN);


            /*SBUxMethod.set("NUMBER_ELEMENT1", rowData.NUMBER_ELEMENT1);*/
            gfnma_multiSelectSet('#NUMBER_ELEMENT1', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT1);
            SBUxMethod.set("NUMBER_VALUE1", rowData.NUMBER_VALUE1);
            gfnma_multiSelectSet('#SURFIX_ELEMENT1', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT1);
            SBUxMethod.set("SURFIX_VALUE1", rowData.SURFIX_VALUE1);

            gfnma_multiSelectSet('#NUMBER_ELEMENT2', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT2);
            SBUxMethod.set("NUMBER_VALUE2", rowData.NUMBER_VALUE2);
            gfnma_multiSelectSet('#SURFIX_ELEMENT2', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT2);
            SBUxMethod.set("SURFIX_VALUE2", rowData.SURFIX_VALUE2);

            gfnma_multiSelectSet('#NUMBER_ELEMENT3', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT3);
            SBUxMethod.set("NUMBER_VALUE3", rowData.NUMBER_VALUE3);
            gfnma_multiSelectSet('#SURFIX_ELEMENT3', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT3);
            SBUxMethod.set("SURFIX_VALUE3", rowData.SURFIX_VALUE3);

            gfnma_multiSelectSet('#NUMBER_ELEMENT4', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT4);
            SBUxMethod.set("NUMBER_VALUE4", rowData.NUMBER_VALUE4);
            gfnma_multiSelectSet('#SURFIX_ELEMENT4', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT4);
            SBUxMethod.set("SURFIX_VALUE4", rowData.SURFIX_VALUE4);

            gfnma_multiSelectSet('#NUMBER_ELEMENT5', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT5);
            SBUxMethod.set("NUMBER_VALUE5", rowData.NUMBER_VALUE5);
            gfnma_multiSelectSet('#SURFIX_ELEMENT5', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT5);
            SBUxMethod.set("SURFIX_VALUE5", rowData.SURFIX_VALUE5);

            SBUxMethod.set("START_SERNO", rowData.START_SERNO);
            SBUxMethod.set("UNIQUE_YN", rowData.UNIQUE_YN);

            SBUxMethod.set("NUMBER_SAMPLE", rowData.NUMBER_SAMPLE);

            fn_searchHistory(rowData);
        }
    }


    const fn_clearForm = function () {
        SBUxMethod.set("NUMBERING_ID"   , "");
        SBUxMethod.set("NUMBERING_GROUP", "");
        SBUxMethod.set("USE_YN"         , "");
        SBUxMethod.set("NUMBERING_NAME" , "");
        SBUxMethod.set("NUMBER_LENGTH"  , 20);
        SBUxMethod.set("DESCR"          , "");
        SBUxMethod.set("AUTO_NUM_YN"    , "");


        gfnma_multiSelectSet('#NUMBER_ELEMENT1', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("NUMBER_VALUE1", "");
        gfnma_multiSelectSet('#SURFIX_ELEMENT1', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("SURFIX_VALUE1", "");

        gfnma_multiSelectSet('#NUMBER_ELEMENT2', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("NUMBER_VALUE2", "");
        gfnma_multiSelectSet('#SURFIX_ELEMENT2', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("SURFIX_VALUE2", "");

        gfnma_multiSelectSet('#NUMBER_ELEMENT3', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("NUMBER_VALUE3", "");
        gfnma_multiSelectSet('#SURFIX_ELEMENT3', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("SURFIX_VALUE3", "");

        gfnma_multiSelectSet('#NUMBER_ELEMENT4', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("NUMBER_VALUE4", "");
        gfnma_multiSelectSet('#SURFIX_ELEMENT4', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("SURFIX_VALUE4", "");

        gfnma_multiSelectSet('#NUMBER_ELEMENT5', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("NUMBER_VALUE5", "");
        gfnma_multiSelectSet('#SURFIX_ELEMENT5', 'SUB_CODE', 'CODE_NAME', '');
        SBUxMethod.set("SURFIX_VALUE5", "");

        SBUxMethod.set("START_SERNO", 1);
        SBUxMethod.set("UNIQUE_YN", "");

        SBUxMethod.set("NUMBER_SAMPLE", "");

        /* gvwHistoryGrid.clearStatus();*/

    }

    /**
     * 목록 조회 (히스토리)
     */
    const fn_searchHistory = async function (rowData) {

        if (!_.isEmpty(rowData)) {

            gvwHistoryGrid.clearStatus();

           /* let V_P_NUMBERING_ID = rowData;*/

            var paramHisObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_NUMBERING_GROUP   : rowData.NUMBERING_GROUP
                , V_P_NUMBERING_ID      : rowData.NUMBERING_ID
                , V_P_NUMBERING_NAME    : rowData.NUMBERING_NAME

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/co/sys/sys/selectSys3200List.do", {
                getType: 'json',
                workType: 'HISTORY',
                cv_count: '2',
                params: gfnma_objectToString(paramHisObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    /** @type {number} **/
                    let totalRecordCount = 0;

                    jsonGvwHistoryList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const hisMsg = {
                            NUMBER_PREFIX   : item.NUMBER_PREFIX,
                            LAST_SERNO      : item.LAST_SERNO
                        }
                        jsonGvwHistoryList.push(hisMsg);
                        totalRecordCount++;
                    });

                    gvwHistoryGrid.rebuild();
                    //document.querySelector('#listCount').innerText = totalRecordCount;

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

    }


    function fn_createHistoryGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwHistory';
        SBGridProperties.id = 'gvwHistoryGrid';
        SBGridProperties.jsonref = 'jsonGvwHistoryList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        /*SBHistoryGridProperties.explorerbar = 'sortmove';*/
        /* SBGridProperties.rowheader = 'seq';*/
        /*SBGridProperties.rowheadercaption = {seq: 'No'};*/
        /*SBGridProperties.rowheaderwidth = {seq: '60'};*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["채번 정보"], ref: 'NUMBER_PREFIX', type: 'input', width: '300px', style: 'text-align:left'},
            {caption: ["마지막 채번 번호"], ref: 'LAST_SERNO', type: 'input', width: '300px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  /*format : {type:'number', rule:'#,###'}*/},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left', disabled: true}//스타일상 빈값

        ];

        gvwHistoryGrid = _SBGrid.create(SBGridProperties);
        //gvwHistoryGrid.bind('click', 'fn_view');
        /* gvwInfoGrid.bind('beforepagechanged', 'fn_pagingComMsgList');*/
    }

    //상세정보 보기
    function fn_view() {
        editType = "E";

        let nCol = gvwInfoGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol == -1) {
            return;
        }
        let nRow = gvwInfoGrid.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        SBUxMethod.set("NUMBERING_ID"   , rowData.NUMBERING_ID);
        SBUxMethod.set("NUMBERING_GROUP", rowData.NUMBERING_GROUP);
        SBUxMethod.set("USE_YN"         , rowData.USE_YN);
        SBUxMethod.set("NUMBERING_NAME" , rowData.NUMBERING_NAME);
        SBUxMethod.set("NUMBER_LENGTH"  , rowData.NUMBER_LENGTH);
        SBUxMethod.set("DESCR"          , rowData.DESCR);
        SBUxMethod.set("AUTO_NUM_YN"    , rowData.AUTO_NUM_YN);


        gfnma_multiSelectSet('#NUMBER_ELEMENT1', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT1);
        SBUxMethod.set("NUMBER_VALUE1", rowData.NUMBER_VALUE1);
        gfnma_multiSelectSet('#SURFIX_ELEMENT1', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT1);
        SBUxMethod.set("SURFIX_VALUE1", rowData.SURFIX_VALUE1);

        gfnma_multiSelectSet('#NUMBER_ELEMENT2', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT2);
        SBUxMethod.set("NUMBER_VALUE2", rowData.NUMBER_VALUE2);
        gfnma_multiSelectSet('#SURFIX_ELEMENT2', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT2);
        SBUxMethod.set("SURFIX_VALUE2", rowData.SURFIX_VALUE2);

        gfnma_multiSelectSet('#NUMBER_ELEMENT3', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT3);
        SBUxMethod.set("NUMBER_VALUE3", rowData.NUMBER_VALUE3);
        gfnma_multiSelectSet('#SURFIX_ELEMENT3', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT3);
        SBUxMethod.set("SURFIX_VALUE3", rowData.SURFIX_VALUE3);

        gfnma_multiSelectSet('#NUMBER_ELEMENT4', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT4);
        SBUxMethod.set("NUMBER_VALUE4", rowData.NUMBER_VALUE4);
        gfnma_multiSelectSet('#SURFIX_ELEMENT4', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT4);
        SBUxMethod.set("SURFIX_VALUE4", rowData.SURFIX_VALUE4);

        gfnma_multiSelectSet('#NUMBER_ELEMENT5', 'SUB_CODE', 'CODE_NAME', rowData.NUMBER_ELEMENT5);
        SBUxMethod.set("NUMBER_VALUE5", rowData.NUMBER_VALUE5);
        gfnma_multiSelectSet('#SURFIX_ELEMENT5', 'SUB_CODE', 'CODE_NAME', rowData.SURFIX_ELEMENT5);
        SBUxMethod.set("SURFIX_VALUE5", rowData.SURFIX_VALUE5);

        SBUxMethod.set("START_SERNO", rowData.START_SERNO);
        SBUxMethod.set("UNIQUE_YN", rowData.UNIQUE_YN);

        /* SBUxMethod.set("NUMBER_SAMPLE", rowData.NUMBER_SAMPLE );*/

        if (rowData != null) {
            fn_searchHistory(rowData);
        }


    }

    // 행 추가
    const fn_addRow = function () {
        let rowVal = gvwHistoryGrid.getRow();

        if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.

            gvwHistoryGrid.addRow(true);
        } else {
            gvwHistoryGrid.insertRow(rowVal);
        }
        //grdFimList.refresh();
    }


    // 행삭제
    const fn_delRow = async function () {

        let rowVal = gvwHistoryGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwHistoryGrid.deleteRow(rowVal);
        }

    }

    //신규 작성
    function fn_create() {

        editType = "N";

        fn_clearForm();

    }

    //저장
    const fn_save = async function () {

        let NUMBERING_ID    = gfn_nvl(SBUxMethod.get("NUMBERING_ID"));
        let NUMBERING_GROUP = gfn_nvl(SBUxMethod.get("NUMBERING_GROUP"));
        let USE_YN          = gfn_nvl(SBUxMethod.get("USE_YN"));
        let NUMBERING_NAME  = gfn_nvl(SBUxMethod.get("NUMBERING_NAME"));
        let NUMBER_LENGTH   = gfn_nvl(SBUxMethod.get("NUMBER_LENGTH"));
        let DESCR           = gfn_nvl(SBUxMethod.get("DESCR"));
        let AUTO_NUM_YN     = gfn_nvl(SBUxMethod.get("AUTO_NUM_YN"));

        let NUMBER_ELEMENT1 = gfnma_multiSelectGet('#NUMBER_ELEMENT1');
        let NUMBER_VALUE1   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE1"));
        let SURFIX_ELEMENT1 = gfnma_multiSelectGet('#SURFIX_ELEMENT1');
        let SURFIX_VALUE1   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE1"));

        let NUMBER_ELEMENT2 = gfnma_multiSelectGet('#NUMBER_ELEMENT2');
        let NUMBER_VALUE2   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE2"));
        let SURFIX_ELEMENT2 = gfnma_multiSelectGet('#SURFIX_ELEMENT2');
        let SURFIX_VALUE2   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE2"));

        let NUMBER_ELEMENT3 = gfnma_multiSelectGet('#NUMBER_ELEMENT3');
        let NUMBER_VALUE3   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE3"));
        let SURFIX_ELEMENT3 = gfnma_multiSelectGet('#SURFIX_ELEMENT3');
        let SURFIX_VALUE3   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE3"));

        let NUMBER_ELEMENT4 = gfnma_multiSelectGet('#NUMBER_ELEMENT4');
        let NUMBER_VALUE4   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE4"));
        let SURFIX_ELEMENT4 = gfnma_multiSelectGet('#SURFIX_ELEMENT4');
        let SURFIX_VALUE4   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE4"));

        let NUMBER_ELEMENT5 = gfnma_multiSelectGet('#NUMBER_ELEMENT5');
        let NUMBER_VALUE5   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE5"));
        let SURFIX_ELEMENT5 = gfnma_multiSelectGet('#SURFIX_ELEMENT5');
        let SURFIX_VALUE5   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE5"));

        let START_SERNO     = gfn_nvl(SBUxMethod.get("START_SERNO"));
        let UNIQUE_YN       = gfn_nvl(SBUxMethod.get("UNIQUE_YN"));

        let NUMBER_SAMPLE = gfn_nvl(SBUxMethod.get("NUMBER_SAMPLE"));


        if (!NUMBERING_ID) {
            gfn_comAlert("W0002", "채번 ID");
            return;
        }
        if (!NUMBERING_NAME) {
            gfn_comAlert("W0002", "채번명");
            return;
        }

        if (editType == "N") {
            // 신규 등록
            if (gfn_comConfirm("Q0001", "신규 등록")) {
                var obj = {
                    NUMBERING_ID        : NUMBERING_ID
                    , NUMBERING_NAME    : NUMBERING_NAME
                    , NUMBERING_GROUP   : NUMBERING_GROUP
                    , NUMBER_LENGTH     : NUMBER_LENGTH
                    , DESCR             : DESCR
                    , NUMBER_ELEMENT1   : NUMBER_ELEMENT1
                    , NUMBER_VALUE1     : NUMBER_VALUE1
                    , NUMBER_ELEMENT2   : NUMBER_ELEMENT2
                    , NUMBER_VALUE2     : NUMBER_VALUE2
                    , NUMBER_ELEMENT3   : NUMBER_ELEMENT3
                    , NUMBER_VALUE3     : NUMBER_VALUE3
                    , NUMBER_ELEMENT4   : NUMBER_ELEMENT4
                    , NUMBER_VALUE4     : NUMBER_VALUE4
                    , NUMBER_ELEMENT5   : NUMBER_ELEMENT5
                    , NUMBER_VALUE5     : NUMBER_VALUE5
                    , SURFIX_ELEMENT1   : SURFIX_ELEMENT1
                    , SURFIX_VALUE1     : SURFIX_VALUE1
                    , SURFIX_ELEMENT2   : SURFIX_ELEMENT2
                    , SURFIX_VALUE2     : SURFIX_VALUE2
                    , SURFIX_ELEMENT3   : SURFIX_ELEMENT3
                    , SURFIX_VALUE3     : SURFIX_VALUE3
                    , SURFIX_ELEMENT4   : SURFIX_ELEMENT4
                    , SURFIX_VALUE4     : SURFIX_VALUE4
                    , SURFIX_ELEMENT5   : SURFIX_ELEMENT5
                    , SURFIX_VALUE5     : SURFIX_VALUE5
                    , START_SERNO       : START_SERNO
                    , USE_YN            : USE_YN.USE_YN
                    , UNIQUE_YN         : UNIQUE_YN.UNIQUE_YN
                    , AUTO_NUM_YN       : AUTO_NUM_YN.AUTO_NUM_YN

                }
                fn_subInsert(obj);
            }
        } else if (editType == "E") {
            // 수정 저장
            if (gfn_comConfirm("Q0001", "수정 저장")) {
                var obj = {
                    NUMBERING_ID        : NUMBERING_ID
                    , NUMBERING_NAME    : NUMBERING_NAME
                    , NUMBERING_GROUP   : NUMBERING_GROUP
                    , NUMBER_LENGTH     : NUMBER_LENGTH
                    , DESCR             : DESCR
                    , NUMBER_ELEMENT1   : NUMBER_ELEMENT1
                    , NUMBER_VALUE1     : NUMBER_VALUE1
                    , NUMBER_ELEMENT2   : NUMBER_ELEMENT2
                    , NUMBER_VALUE2     : NUMBER_VALUE2
                    , NUMBER_ELEMENT3   : NUMBER_ELEMENT3
                    , NUMBER_VALUE3     : NUMBER_VALUE3
                    , NUMBER_ELEMENT4   : NUMBER_ELEMENT4
                    , NUMBER_VALUE4     : NUMBER_VALUE4
                    , NUMBER_ELEMENT5   : NUMBER_ELEMENT5
                    , NUMBER_VALUE5     : NUMBER_VALUE5
                    , SURFIX_ELEMENT1   : SURFIX_ELEMENT1
                    , SURFIX_VALUE1     : SURFIX_VALUE1
                    , SURFIX_ELEMENT2   : SURFIX_ELEMENT2
                    , SURFIX_VALUE2     : SURFIX_VALUE2
                    , SURFIX_ELEMENT3   : SURFIX_ELEMENT3
                    , SURFIX_VALUE3     : SURFIX_VALUE3
                    , SURFIX_ELEMENT4   : SURFIX_ELEMENT4
                    , SURFIX_VALUE4     : SURFIX_VALUE4
                    , SURFIX_ELEMENT5   : SURFIX_ELEMENT5
                    , SURFIX_VALUE5     : SURFIX_VALUE5
                    , START_SERNO       : START_SERNO
                    , USE_YN            : USE_YN.USE_YN
                    , UNIQUE_YN         : UNIQUE_YN.UNIQUE_YN
                    , AUTO_NUM_YN       : AUTO_NUM_YN.AUTO_NUM_YN
                    //, NUMBER_SAMPLE: NUMBER_SAMPLE
                }

                fn_subUpdate(obj);
            }
        }

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (obj) {

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_NUMBERING_ID      : obj.NUMBERING_ID
            , V_P_NUMBERING_NAME    : obj.NUMBERING_NAME
            , V_P_NUMBERING_GROUP   : obj.NUMBERING_GROUP
            , V_P_NUMBER_LENGTH     : obj.NUMBER_LENGTH
            , V_P_DESCR             : obj.DESCR
            , V_P_NUMBER_ELEMENT1   : obj.NUMBER_ELEMENT1
            , V_P_NUMBER_VALUE1     : obj.NUMBER_VALUE1
            , V_P_NUMBER_ELEMENT2   : obj.NUMBER_ELEMENT2
            , V_P_NUMBER_VALUE2     : obj.NUMBER_VALUE2
            , V_P_NUMBER_ELEMENT3   : obj.NUMBER_ELEMENT3
            , V_P_NUMBER_VALUE3     : obj.NUMBER_VALUE3
            , V_P_NUMBER_ELEMENT4   : obj.NUMBER_ELEMENT4
            , V_P_NUMBER_VALUE4     : obj.NUMBER_VALUE4
            , V_P_NUMBER_ELEMENT5   : obj.NUMBER_ELEMENT5
            , V_P_NUMBER_VALUE5     : obj.NUMBER_VALUE5
            , V_P_SURFIX_ELEMENT1   : obj.SURFIX_ELEMENT1
            , V_P_SURFIX_VALUE1     : obj.SURFIX_VALUE1
            , V_P_SURFIX_ELEMENT2   : obj.SURFIX_ELEMENT2
            , V_P_SURFIX_VALUE2     : obj.SURFIX_VALUE2
            , V_P_SURFIX_ELEMENT3   : obj.SURFIX_ELEMENT3
            , V_P_SURFIX_VALUE3     : obj.SURFIX_VALUE3
            , V_P_SURFIX_ELEMENT4   : obj.SURFIX_ELEMENT4
            , V_P_SURFIX_VALUE4     : obj.SURFIX_VALUE4
            , V_P_SURFIX_ELEMENT5   : obj.SURFIX_ELEMENT5
            , V_P_SURFIX_VALUE5     : obj.SURFIX_VALUE5
            , V_P_START_SERNO       : obj.START_SERNO
            , V_P_USE_YN            : obj.USE_YN
            , V_P_UNIQUE_YN         : obj.UNIQUE_YN
            , V_P_AUTO_NUM_YN       : obj.AUTO_NUM_YN

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/sys/insertSys3200.do", {
            getType: 'json',
            workType: 'N',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
                fn_saveHis(obj.NUMBERING_ID); //채번이력 저장
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

    const getParamForm = async function(numberId, updatedData){

        let returnData = [];

        updatedData.forEach((item, index) => {

            const param = {

                cv_count : '0',
                getType : 'json',
                workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    ,V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_NUMBERING_ID   : numberId
                    ,V_P_NUMBER_PREFIX  : item.data.NUMBER_PREFIX
                    ,V_P_LAST_SERNO     : item.data.LAST_SERNO

                    ,V_P_FORM_ID: p_formId
                    ,V_P_MENU_ID: p_menuId
                    ,V_P_PROC_ID: ''
                    ,V_P_USERID: ''
                    ,V_P_PC: ''
                })
            }
            returnData.push(param);

        });

        return  returnData;

    }

    //저장 ( 채번이력 )
    const fn_saveHis = async function (numberId) {

        let updatedData = gvwHistoryGrid.getUpdateData(true, 'all');

        if(updatedData.length <= 0){
            return;
        }
        listData = [];
        listData =  await getParamForm(numberId, updatedData)

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/co/sys/sys/insertSys3200His.do",  {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }else{
                        gfn_comAlert("I0001");
                        fn_search();
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
    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subUpdate = async function (obj) {

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_NUMBERING_ID      : obj.NUMBERING_ID
            , V_P_NUMBERING_NAME    : obj.NUMBERING_NAME
            , V_P_NUMBERING_GROUP   : obj.NUMBERING_GROUP
            , V_P_NUMBER_LENGTH     : obj.NUMBER_LENGTH
            , V_P_DESCR             : obj.DESCR
            , V_P_NUMBER_ELEMENT1   : obj.NUMBER_ELEMENT1
            , V_P_NUMBER_VALUE1     : obj.NUMBER_VALUE1
            , V_P_NUMBER_ELEMENT2   : obj.NUMBER_ELEMENT2
            , V_P_NUMBER_VALUE2     : obj.NUMBER_VALUE2
            , V_P_NUMBER_ELEMENT3   : obj.NUMBER_ELEMENT3
            , V_P_NUMBER_VALUE3     : obj.NUMBER_VALUE3
            , V_P_NUMBER_ELEMENT4   : obj.NUMBER_ELEMENT4
            , V_P_NUMBER_VALUE4     : obj.NUMBER_VALUE4
            , V_P_NUMBER_ELEMENT5   : obj.NUMBER_ELEMENT5
            , V_P_NUMBER_VALUE5     : obj.NUMBER_VALUE5
            , V_P_SURFIX_ELEMENT1   : obj.SURFIX_ELEMENT1
            , V_P_SURFIX_VALUE1     : obj.SURFIX_VALUE1
            , V_P_SURFIX_ELEMENT2   : obj.SURFIX_ELEMENT2
            , V_P_SURFIX_VALUE2     : obj.SURFIX_VALUE2
            , V_P_SURFIX_ELEMENT3   : obj.SURFIX_ELEMENT3
            , V_P_SURFIX_VALUE3     : obj.SURFIX_VALUE3
            , V_P_SURFIX_ELEMENT4   : obj.SURFIX_ELEMENT4
            , V_P_SURFIX_VALUE4     : obj.SURFIX_VALUE4
            , V_P_SURFIX_ELEMENT5   : obj.SURFIX_ELEMENT5
            , V_P_SURFIX_VALUE5     : obj.SURFIX_VALUE5
            , V_P_START_SERNO       : obj.START_SERNO
            , V_P_USE_YN            : obj.USE_YN
            , V_P_UNIQUE_YN         : obj.UNIQUE_YN
            , V_P_AUTO_NUM_YN       : obj.AUTO_NUM_YN

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };



        const postJsonPromise = gfn_postJSON("/co/sys/sys/insertSys3200.do", {
            getType: 'json',
            workType: 'U',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
                fn_saveHis(obj.NUMBERING_ID); //채번이력 저장
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

    //삭제
    const fn_delete = async function () {

        let NUMBERING_ID    = gfn_nvl(SBUxMethod.get("NUMBERING_ID"));
        let NUMBERING_GROUP = gfn_nvl(SBUxMethod.get("NUMBERING_GROUP"));
        let USE_YN          = gfn_nvl(SBUxMethod.get("USE_YN"));
        let NUMBERING_NAME  = gfn_nvl(SBUxMethod.get("NUMBERING_NAME"));
        let NUMBER_LENGTH   = gfn_nvl(SBUxMethod.get("NUMBER_LENGTH"));
        let DESCR           = gfn_nvl(SBUxMethod.get("DESCR"));
        let AUTO_NUM_YN     = gfn_nvl(SBUxMethod.get("AUTO_NUM_YN"));

        let NUMBER_ELEMENT1 = gfnma_multiSelectGet('#NUMBER_ELEMENT1');
        let NUMBER_VALUE1   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE1"));
        let SURFIX_ELEMENT1 = gfnma_multiSelectGet('#SURFIX_ELEMENT1');
        let SURFIX_VALUE1   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE1"));
        let NUMBER_ELEMENT2 = gfnma_multiSelectGet('#NUMBER_ELEMENT2');
        let NUMBER_VALUE2   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE2"));
        let SURFIX_ELEMENT2 = gfnma_multiSelectGet('#SURFIX_ELEMENT2');
        let SURFIX_VALUE2   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE2"));
        let NUMBER_ELEMENT3 = gfnma_multiSelectGet('#NUMBER_ELEMENT3');
        let NUMBER_VALUE3   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE3"));
        let SURFIX_ELEMENT3 = gfnma_multiSelectGet('#SURFIX_ELEMENT3');
        let SURFIX_VALUE3   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE3"));
        let NUMBER_ELEMENT4 = gfnma_multiSelectGet('#NUMBER_ELEMENT4');
        let NUMBER_VALUE4   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE4"));
        let SURFIX_ELEMENT4 = gfnma_multiSelectGet('#SURFIX_ELEMENT4');
        let SURFIX_VALUE4   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE4"));
        let NUMBER_ELEMENT5 = gfnma_multiSelectGet('#NUMBER_ELEMENT5');
        let NUMBER_VALUE5   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE5"));
        let SURFIX_ELEMENT5 = gfnma_multiSelectGet('#SURFIX_ELEMENT5');
        let SURFIX_VALUE5   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE5"));

        let START_SERNO     = gfn_nvl(SBUxMethod.get("START_SERNO"));
        let UNIQUE_YN       = gfn_nvl(SBUxMethod.get("UNIQUE_YN"));

        let NUMBER_SAMPLE = gfn_nvl(SBUxMethod.get("NUMBER_SAMPLE"));

        if (gfn_comConfirm("Q0001", "삭제")) {
            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_NUMBERING_ID      : NUMBERING_ID
                , V_P_NUMBERING_NAME    : NUMBERING_NAME
                , V_P_NUMBERING_GROUP   : NUMBERING_GROUP
                , V_P_NUMBER_LENGTH     : NUMBER_LENGTH
                , V_P_DESCR             : DESCR
                , V_P_NUMBER_ELEMENT1   : NUMBER_ELEMENT1
                , V_P_NUMBER_VALUE1     : NUMBER_VALUE1
                , V_P_NUMBER_ELEMENT2   : NUMBER_ELEMENT2
                , V_P_NUMBER_VALUE2     : NUMBER_VALUE2
                , V_P_NUMBER_ELEMENT3   : NUMBER_ELEMENT3
                , V_P_NUMBER_VALUE3     : NUMBER_VALUE3
                , V_P_NUMBER_ELEMENT4   : NUMBER_ELEMENT4
                , V_P_NUMBER_VALUE4     : NUMBER_VALUE4
                , V_P_NUMBER_ELEMENT5   : NUMBER_ELEMENT5
                , V_P_NUMBER_VALUE5     : NUMBER_VALUE5
                , V_P_SURFIX_ELEMENT1   : SURFIX_ELEMENT1
                , V_P_SURFIX_VALUE1     : SURFIX_VALUE1
                , V_P_SURFIX_ELEMENT2   : SURFIX_ELEMENT2
                , V_P_SURFIX_VALUE2     : SURFIX_VALUE2
                , V_P_SURFIX_ELEMENT3   : SURFIX_ELEMENT3
                , V_P_SURFIX_VALUE3     : SURFIX_VALUE3
                , V_P_SURFIX_ELEMENT4   : SURFIX_ELEMENT4
                , V_P_SURFIX_VALUE4     : SURFIX_VALUE4
                , V_P_SURFIX_ELEMENT5   : SURFIX_ELEMENT5
                , V_P_SURFIX_VALUE5     : SURFIX_VALUE5
                , V_P_START_SERNO       : START_SERNO
                , V_P_USE_YN            : USE_YN.USE_YN
                , V_P_UNIQUE_YN         : UNIQUE_YN.UNIQUE_YN
                , V_P_AUTO_NUM_YN       : AUTO_NUM_YN.AUTO_NUM_YN

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/co/sys/sys/insertSys3200.do", {
                getType: 'json',
                workType: 'D',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    fn_search();
                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }

    }

    //샘플채번 등록
    const fn_SearchNumSP = async function () {

        let NUMBERING_ID        = gfn_nvl(SBUxMethod.get("NUMBERING_ID"));
        let NUMBERING_GROUP     = gfn_nvl(SBUxMethod.get("NUMBERING_GROUP"));
        let USE_YN              = gfn_nvl(SBUxMethod.get("USE_YN"));
        let NUMBERING_NAME      = gfn_nvl(SBUxMethod.get("NUMBERING_NAME"));
        let NUMBER_LENGTH       = gfn_nvl(SBUxMethod.get("NUMBER_LENGTH"));
        let DESCR               = gfn_nvl(SBUxMethod.get("DESCR"));
        let AUTO_NUM_YN         = gfn_nvl(SBUxMethod.get("AUTO_NUM_YN"));

        let NUMBER_ELEMENT1 = gfnma_multiSelectGet('#NUMBER_ELEMENT1');
        let NUMBER_VALUE1   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE1"));
        let SURFIX_ELEMENT1 = gfnma_multiSelectGet('#SURFIX_ELEMENT1');
        let SURFIX_VALUE1   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE1"));
        let NUMBER_ELEMENT2 = gfnma_multiSelectGet('#NUMBER_ELEMENT2');
        let NUMBER_VALUE2   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE2"));
        let SURFIX_ELEMENT2 = gfnma_multiSelectGet('#SURFIX_ELEMENT2');
        let SURFIX_VALUE2   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE2"));
        let NUMBER_ELEMENT3 = gfnma_multiSelectGet('#NUMBER_ELEMENT3');
        let NUMBER_VALUE3   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE3"));
        let SURFIX_ELEMENT3 = gfnma_multiSelectGet('#SURFIX_ELEMENT3');
        let SURFIX_VALUE3   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE3"));
        let NUMBER_ELEMENT4 = gfnma_multiSelectGet('#NUMBER_ELEMENT4');
        let NUMBER_VALUE4   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE4"));
        let SURFIX_ELEMENT4 = gfnma_multiSelectGet('#SURFIX_ELEMENT4');
        let SURFIX_VALUE4   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE4"));
        let NUMBER_ELEMENT5 = gfnma_multiSelectGet('#NUMBER_ELEMENT5');
        let NUMBER_VALUE5   = gfn_nvl(SBUxMethod.get("NUMBER_VALUE5"));
        let SURFIX_ELEMENT5 = gfnma_multiSelectGet('#SURFIX_ELEMENT5');
        let SURFIX_VALUE5   = gfn_nvl(SBUxMethod.get("SURFIX_VALUE5"));

        let START_SERNO     = gfn_nvl(SBUxMethod.get("START_SERNO"));
        let UNIQUE_YN       = gfn_nvl(SBUxMethod.get("UNIQUE_YN"));


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_NUMBERING_ID      : NUMBERING_ID
            , V_P_NUMBERING_NAME    : NUMBERING_NAME
            , V_P_NUMBERING_GROUP   : NUMBERING_GROUP
            , V_P_NUMBER_LENGTH     : NUMBER_LENGTH
            , V_P_DESCR             : DESCR
            , V_P_NUMBER_ELEMENT1   : NUMBER_ELEMENT1
            , V_P_NUMBER_VALUE1     : NUMBER_VALUE1
            , V_P_NUMBER_ELEMENT2   : NUMBER_ELEMENT2
            , V_P_NUMBER_VALUE2     : NUMBER_VALUE2
            , V_P_NUMBER_ELEMENT3   : NUMBER_ELEMENT3
            , V_P_NUMBER_VALUE3     : NUMBER_VALUE3
            , V_P_NUMBER_ELEMENT4   : NUMBER_ELEMENT4
            , V_P_NUMBER_VALUE4     : NUMBER_VALUE4
            , V_P_NUMBER_ELEMENT5   : NUMBER_ELEMENT5
            , V_P_NUMBER_VALUE5     : NUMBER_VALUE5
            , V_P_SURFIX_ELEMENT1   : SURFIX_ELEMENT1
            , V_P_SURFIX_VALUE1     : SURFIX_VALUE1
            , V_P_SURFIX_ELEMENT2   : SURFIX_ELEMENT2
            , V_P_SURFIX_VALUE2     : SURFIX_VALUE2
            , V_P_SURFIX_ELEMENT3   : SURFIX_ELEMENT3
            , V_P_SURFIX_VALUE3     : SURFIX_VALUE3
            , V_P_SURFIX_ELEMENT4   : SURFIX_ELEMENT4
            , V_P_SURFIX_VALUE4     : SURFIX_VALUE4
            , V_P_SURFIX_ELEMENT5   : SURFIX_ELEMENT5
            , V_P_SURFIX_VALUE5     : SURFIX_VALUE5
            , V_P_START_SERNO       : START_SERNO
            , V_P_USE_YN            : USE_YN.USE_YN
            , V_P_UNIQUE_YN         : UNIQUE_YN.UNIQUE_YN
            , V_P_AUTO_NUM_YN       : AUTO_NUM_YN.AUTO_NUM_YN

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };


        const postJsonPromise = gfn_postJSON("/co/sys/sys/insertSys3200Sample.do", {
            getType: 'json',
            workType: 'VIEWSAMPLE',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }

                SBUxMethod.set("NUMBER_SAMPLE", gfn_nvl(data.v_returnStr));


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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
