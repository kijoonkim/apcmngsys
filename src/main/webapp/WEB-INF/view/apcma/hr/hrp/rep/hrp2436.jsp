<%
    /**
     * @Class Name        : hrp2436.jsp
     * @Description       : 급여명세서 메일발송 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.08
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.08   	표주완		최초 생성
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
    <title>title : 급여명세서 메일발송</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>

    <title>Calculator</title>
    <link rel="stylesheet" href="/resource/css/ma_custom.css">
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
            <div style="margin-left: auto;">
                <%--<sbux-button id="btnPdf" name="btnPdf" uitype="normal" text="PDF 저장"
                             class="btn btn-sm btn-outline-danger" onclick="fn_dwnPdf"></sbux-button>--%>
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnPrint"></sbux-button>
                <sbux-button id="btnFile" name="btnFile" uitype="normal" text="파일저장"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnFile"></sbux-button>
                <sbux-button id="btnSendEmail" name="btnSendEmail" uitype="normal" text="Email 발송"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnSendEmail"></sbux-button>
                <sbux-button id="btnSendSMS" name="btnSendSMS" uitype="normal" text="SMS 발송"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnSendSMS"></sbux-button>
            </div>
        </div>

        <div class="box-search-ma">
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <table id="dataArea1" class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row" class="th_bg_search">사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>

                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_AREA_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayAreaType"
                        <%--unselected-text="선택"--%>
                                class="form-control input-sm"
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">발송구분</th>
                    <td colspan="4" class="td_input inpt_data_reqed">
                        <sbux-radio id="ALL" name="SENDTYPE" uitype="normal"
                                    text="전체" value="ALL" checked>
                        </sbux-radio>
                        <sbux-radio id="PAY" name="SENDTYPE" uitype="normal"
                                    text="급여명세" value="PAY">
                        </sbux-radio>
                        <sbux-radio id="WORK" name="SENDTYPE" uitype="normal"
                                    text="근태현황" value="WORK">
                        </sbux-radio>
                    </td>
                    <th scope="row" class="th_bg_search">귀속년월</th>
                    <td <%--colspan="2"--%> class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM_FR"
                                name="SRCH_PAY_YYYYMM_FR"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed"
                                style="width: 100%;"
                                required
                                onchange="fn_payDate">
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">지급구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayType"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                                required
                                onchange="fn_payDate">
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">지급일</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                id="SRCH_PAY_DATE"
                                uitype="single"
                                jsondata-ref="jsonPayDate"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                                required
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search" style="display: none">연간누계 출력여부</th>
                    <td colspan="4" class="td_input" style="border-right: hidden; display: none">
                        <sbux-checkbox
                                id="SRCH_MULTI_YN"
                                name="SRCH_MULTI_YN"
                                uitype="normal"
                                text=""
                                true-value="Y"
                                false-value="N"
                        ></sbux-checkbox>
                    </td>
                    <td colspan="5" style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                        <sbux-input
                                uitype="text"
                                id="SRCH_DEPT_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;" data-group="DEPT">
                        <sbux-input
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_DEPT_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td <%--colspan="2"--%> class="td_input" data-group="DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…"
                                uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>

                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-input
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…"
                                uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-checkbox
                                id="CHKMULTI_CS_YN"
                                name="CHKMULTI_CS_YN"
                                uitype="normal"
                                text="복수선택"
                                text-left-padding="5px"
                                text-right-padding="25px"
                                true-value="Y"
                                false-value="N"
                        ></sbux-checkbox>
                    </td>
                    <td class="td_input" style="border-right: hidden; display: none;">
                        <sbux-input
                                uitype="text"
                                id="strCsCodeList"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="4" class="td_input" style="border-right: hidden;">
                        <sbux-button
                                id="btnMultiCs"
                                name="btnMultiCs"
                                uitype="normal"
                                text="복수사원"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_compopup4"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search로">파일암호 적용여부</th>
                    <td colspan="4" class="td_input" style="border-right: hidden;">
                        <sbux-checkbox
                                id="CHKPASSWORD_YN"
                                name="CHKPASSWORD_YN"
                                uitype="normal"
                                text=""
                                text-left-padding="5px"
                                text-right-padding="25px"
                                true-value="Y"
                                false-value="N"
                        ></sbux-checkbox>
                    </td>
                </tr>
                <%-- /************** 숨겨져 있는 컬럼 목록 **************/--%>
                <%--<tr>
                    <td class="td_input" style="display: none;">
                        <sbux-select
                                id="PAY_DATE"
                                uitype="single"
                                jsondata-ref="jsonPayDate"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                        &lt;%&ndash;onchange="fn_payType"&ndash;%&gt;>
                        </sbux-select>
                    </td>
                    <td class="td_input" style="border-right: hidden; display: none;">
                        <sbux-input
                                uitype="text"
                                id="EMAIL_SUBJECT"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden; display: none;">
                        <sbux-input
                                uitype="text"
                                id="EMAIL_BODY"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                </tr>--%>
                </tbody>
            </table>
        </div>

        <%--<div class="row">--%>
        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>급여내역</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-gvwInfo" style="height:280px; width:100%;"></div>
        </div>
        <div style="margin-top:1vh;">
            <sbux-tabs id="idxTab_detail" name="idxTab_detail" uitype="normal"
                       is-scrollable="false"
                       title-target-id-array="mail^sms"
                       title-text-array="메일 정보^SMS 정보">
            </sbux-tabs>
            <div class="tab-content">
                <div id="mail" style="height:20vh;">
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <caption>검색 조건 설정</caption>
                        <colgroup>
                            <col style="width: 3%">
                            <col style="width: 6%">
                            <col style="width: 3%">

                            <col style="width: 3%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">메일제목</th>
                            <td colspan="2" class="td_input" >
                                <sbux-input
                                        uitype="text"
                                        id="EMAIL_SUBJECT"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="3" class="td_input" >
                                <p>※ 저장된 내용이 발송되므로 편집 후 반드시 저장하세요.</p>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">메일내용</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-textarea id="EMAIL_BODY" class="form-control input-sm" uitype="normal" style="width:100%; height: 60px;"></sbux-textarea>
                            </td>
                            <th scope="row" rowspan="2" class="th_bg">급여산정기준</th>
                            <td colspan="2"  rowspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-textarea id="PAY_CALCULATE_MEMO" rows="2" class="form-control" uitype="normal" style="width:100%; height: 120px;"></sbux-textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">공지사항</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-textarea id="NOTICE_MEMO" class="form-control" uitype="normal" style="width:100%; height:60px;"></sbux-textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="sms" style="height:20vh;">
                    <table id="dataArea3" class="table table-bordered tbl_fixed">
                        <caption>검색 조건 설정</caption>
                        <colgroup>
                            <col style="width: 3%">
                            <col style="width: 6%">
                            <col style="width: 3%">

                            <col style="width: 3%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td colspan="3" class="" style="border-right: hidden;">
                                <p style="vertical-align:top">※ 저장된 내용이 발송되므로 편집 후 반드시 저장하세요.</p>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">SMS 전송 내용</th>
                            <td colspan="2"  rowspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-textarea id="SMS_MESSAGE" rows="2" class="form-control" uitype="normal" style="width:100%; height: 100px;"></sbux-textarea>
                            </td>
                            <th scope="row" class="th_bg">SMS 전송 파라미터</th>
                            <td colspan="2"  rowspan="2" class="td_input" style="border-right: hidden;">
                            	<div style="padding-rigth:5rem">
									<p style="vertical-align:top">@NAME&emsp;&emsp;->&emsp;&emsp;이름</p>                            
									<p style="vertical-align:top">@YEAR&emsp;&emsp;->&emsp;&emsp;년도</p>                            
									<p style="vertical-align:top">@MONTH&emsp;->&emsp;&emsp;월</p>                            
									<p style="vertical-align:top">@TYPE&emsp;&emsp;->&emsp;&emsp;급여유형</p>                            
                            	</div>
                            </td>                            
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%--<form id="reportPdfDownload">
            <input type="hidden" name="title" value="">
            <input type="hidden" name="fileName" value="">
            <input type="hidden" name="param" value="">
            <input type="hidden" name="conn" value="">
        </form>--%>
        <div id="div-rpt-clipReportPrint" style="width:1000px;height:80vh;display: none"></div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
    <jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
</div>
<%--<div id="div-rpt-clipReportPrint"></div>--%>

</body>
<script type="text/javascript">
    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    var p_userNm = '${loginVO.name}';
    var p_linkRviewUrl = '${linkRviewUrl}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	    // 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE, 	SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonPayType = []; //지급구분 ( L_HRB008 )SRCH_PAY_TYPE, 	PAY_TYPE
    var jsonPayDate = []; //지급일자 ( L_HRP027 )PAY_DATE
    var jsonPositionCode = []; //직위 ( L_HRI002 )POSITION_CODE
    var jsonPayItemCode = []; //급여항목 ( L_HRP011 )PAY_ITEM_CODE
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )PAY_ITEM_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_TYPE','gvwInfoGrid'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            //gfnma_setComSelect(['PAY_DATE','SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_YMD', 'SLRY_YMD2', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode, 'L_HRP011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),


            //지급구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CD'
                ,colLabel		: 'SITE_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

        ]);
    }
    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CD_";
        var replaceText1 = searchText;
        var replaceText2 = "_DEPT_CD_";
        var replaceText3 = "_DEPT_NM_";
        var replaceText4 = "_EMP_STTS_";
        var strWhereClause = "AND x.EMP_CD LIKE '%" + replaceText0 + "%' AND x.EMP_NM LIKE '%" + replaceText1 + "%' AND x.DEPT_CD LIKE '%"+replaceText2
            + "%' AND x.DEPT_NM LIKE '%" + replaceText3 +  "%' AND x.EMP_STTS LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CD"  , "DEPT_NM", "EMP_CD"   ,"EMP_NM"  ,"EMP_STTS"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CD"  , "EMP_NM"  , "DEPT_NM"   ,"SITE_NM"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });

    }

    /**
     * 복수코드 팝업
     */
    var fn_compopup4 = function() {

        let strCsCodeList = '';

        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){

                if (!_.isEmpty(data)){

                    data.forEach((item, index)=>{
                        strCsCodeList += item +'|'
                    });

                    if (strCsCodeList.length > 0){
                        strCsCodeList = strCsCodeList.slice(0, -1);
                    }

                    SBUxMethod.set("strCsCodeList", strCsCodeList);

                    if (strCsCodeList.replace("|", "") == ""){
                        SBUxMethod.set("CHKMULTI_CS_YN", 'N');
                    }else {
                        SBUxMethod.set("CHKMULTI_CS_YN", 'Y');
                    }
                }

            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }
    /**
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let PAY_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역

        let V_P_WHERE_CLAUSE = "AND SITE_CD IN (SELECT SITE_CD FROM TB_ORG_SITE WHERE CO_CD ='"+gv_ma_selectedCorpCd+ "') AND SLRY_YM = '"
            + PAY_YYYYMM + "' AND SLRY_TYPE = '" + PAY_TYPE + "'AND SLRY_AREA_TYPE ='" + PAY_AREA_TYPE + "'";

        gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', V_P_WHERE_CLAUSE, gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_YMD', 'SLRY_YMD2', 'Y', '');


    }


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('SRCH_PAY_YYYYMM_FR', openDate);
        /*SBUxMethod.set('SRCH_PAY_YYYYMM_FR2', openDate);*/

        fn_createGrid();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
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


    //급여내역 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.frozencols = 11;
        SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.useinitsorting = true;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                count : [9],
                sum : [15,16,17,18]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: false,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송(급여명세)"], ref: 'MAIL_SEND_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송일(급여명세)"], ref: 'MAIL_SEND_TIME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["메일전송(근태현황)"], ref: 'MAIL_SEND_YN1', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송일(근태현황)"], ref: 'MAIL_SEND_TIME1', type: 'output', width: '140px', style: 'text-align:left'},
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption : ["직위"], ref : 'POSITION_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode',  label : 'label', value : 'value'}
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["사내이메일"], ref: 'IN_EMAIL', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['귀속년월'], ref: 'PAY_YYYYMM', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType',  label : 'label', value : 'value'}
            },
            {caption: ['지급일'], ref: 'PAY_DATE', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["지급총액"], ref: 'PAY_TOTAL_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["비과세액"], ref: 'TAX_FREE_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["공제총액"], ref: 'PAY_DEDUCTION_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["실지급액"], ref: 'PAY_NET_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["메일전송결과(급여명세)"], ref: 'MAIL_SEND_MSG', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["메일전송결과(근태현황)"], ref: 'MAIL_SEND_MSG1', type: 'output', width: '140px', style: 'text-align:left'}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
        gvwInfoGrid.bind('keyup', 'fn_keyup');

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let SENDTYPE        = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        let PAY_YYYYMM_FR   = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
        /*  let PAY_YYYYMM_FR2 = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR2")); //귀속년월*/
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let MULTI_YN        = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN); //연간누계 출력여부
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자

        let CODELIST = gfn_nvl(SBUxMethod.get("strCsCodeList")); //사원복수선택

        if (!PAY_YYYYMM_FR) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        /*  if (!PAY_YYYYMM_FR2) {
              gfn_comAlert("W0002", "귀속년월");
              return;
          }*/
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE     : SITE_CODE
            ,V_P_DEPT_CODE     : DEPT_CODE
            ,V_P_EMP_CODE      : EMP_CODE
            ,V_P_PAY_YYYYMM    : PAY_YYYYMM_FR
            ,V_P_PAY_YYYYMM1   : PAY_YYYYMM_FR
            ,V_P_PAY_TYPE      : PAY_TYPE
            ,V_P_PAY_DATE      : PAY_DATE
            ,V_P_EMP_CODE_LIST : CODELIST
            ,V_P_PAY_YYYYMM2   : ''
            ,V_P_PAY_TYPE1     : ''
            ,V_P_PAY_DATE1     : ''
            ,V_P_PAY_AREA_TYPE : PAY_AREA_TYPE
            ,V_P_REPORT_TYPE   : SENDTYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2436List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '15',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN		        : gfn_nvl(item.CHK_YN),
                        MAIL_SEND_YN		: gfn_nvl(item.EML_SEND_YN),
                        MAIL_SEND_TIME		: gfn_nvl(item.EML_SEND_DT),
                        MAIL_SEND_MSG		: gfn_nvl(item.EML_SEND_MSG),
                        MAIL_SEND_YN1		: gfn_nvl(item.EML_SEND_YN1),
                        MAIL_SEND_TIME1		: gfn_nvl(item.EML_SEND_DT1),
                        MAIL_SEND_MSG1		: gfn_nvl(item.EML_SEND_MSG1),
                        SITE_CODE		    : gfn_nvl(item.SITE_CD),
                        DEPT_CODE		    : gfn_nvl(item.DEPT_CD),
                        DEPT_NAME		    : gfn_nvl(item.DEPT_NM),
                        POSITION_CODE		: gfn_nvl(item.JBPS_CD),
                        POSITION_NAME		: gfn_nvl(item.JBPS_NM),
                        EMP_CODE		    : gfn_nvl(item.EMP_CD),
                        EMP_NAME		    : gfn_nvl(item.EMP_NM),
                        IN_EMAIL		    : gfn_nvl(item.CO_EML),
                        PAY_YYYYMM		    : gfn_nvl(item.SLRY_YM),
                        PAY_TYPE		    : gfn_nvl(item.SLRY_TYPE),
                        PAY_DATE		    : gfn_nvl(item.PAY_YMD),
                        PAY_TOTAL_AMT		: gfn_nvl(item.SLRY_TOT_AMT),
                        TAX_FREE_AMT		: gfn_nvl(item.TX_TXFR_AMT),
                        PAY_DEDUCTION_AMT   : gfn_nvl(item.SLRY_DDC_AMT),
                        PAY_NET_AMT		    : gfn_nvl(item.PAY_ACTL_AMT),
                        DEPT_CODE_SEQ		: gfn_nvl(item.DEPT_CODE_SEQ),
                        POSITION_CODE_SEQ   : gfn_nvl(item.POSITION_CODE_SEQ),
                        MOBILE_NUMBER   	: gfn_nvl(item.MOBL_NO)

                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
                }
                //fn_view();


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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {

        let nRow = gvwInfoGrid.getRow();
        let nCol = gvwInfoGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow  < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let SENDTYPE        = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        let PAY_YYYYMM_FR   = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
        /*  let PAY_YYYYMM_FR2 = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR2")); //귀속년월*/
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let MULTI_YN        = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN")); //연간누계 출력여부
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자

        let CODELIST = gfn_nvl(SBUxMethod.get("strCsCodeList")); //사원복수선택

        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedCorpCd
                ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE     : SITE_CODE
                ,V_P_DEPT_CODE     : DEPT_CODE
                ,V_P_EMP_CODE      : rowData.EMP_CODE
                ,V_P_PAY_YYYYMM    : rowData.PAY_YYYYMM
                ,V_P_PAY_YYYYMM1   : rowData.PAY_YYYYMM
                ,V_P_PAY_TYPE      : rowData.PAY_TYPE
                ,V_P_PAY_DATE      : rowData.PAY_DATE
                ,V_P_EMP_CODE_LIST : CODELIST
                ,V_P_PAY_YYYYMM2   : rowData.PAY_YYYYMM
                ,V_P_PAY_TYPE1     : rowData.PAY_TYPE
                ,V_P_PAY_DATE1     : rowData.PAY_DATE
                ,V_P_PAY_AREA_TYPE : PAY_AREA_TYPE
                ,V_P_REPORT_TYPE   : SENDTYPE

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2436List.do", {
                getType				: 'json',
                workType			: 'DETAIL',
                cv_count			: '15',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    data.cv_4.forEach((item, index) => {
                        SBUxMethod.set("EMAIL_SUBJECT"          , 	gfn_nvl(item.EML_SBJT));
                        SBUxMethod.set("EMAIL_BODY"             , 	gfn_nvl(item.EML_MTXT));
                        SBUxMethod.set("SMS_MESSAGE"            , 	gfn_nvl(item.SMS_TTL));
                        SBUxMethod.set("NOTICE_MEMO"            , 	gfn_nvl(item.NTC_MEMO));
                        /*SBUxMethod.set("NOTICE_MEMO2", 	gfn_nvl(item.NOTICE_MEMO2),);*/
                        SBUxMethod.set("PAY_CALCULATE_MEMO"     , 	gfn_nvl(item.PAY_CAL_MEMO));
                    });
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

    //저장
    const fn_save = async function () {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let PAY_YYYYMM_FR = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
            let PAY_TYPE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
            let PAY_DATE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자

            if (!PAY_YYYYMM_FR) {
                gfn_comAlert("W0002", "귀속년월");
                return;
            }
            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!PAY_DATE) {
                gfn_comAlert("W0002", "지급일");
                return;
            }

            let EMAIL_SUBJECT 		= gfn_nvl(SBUxMethod.get("EMAIL_SUBJECT"));
            let EMAIL_BODY 			= gfn_nvl(SBUxMethod.get("EMAIL_BODY"));
            let SMS_MESSAGE 		= gfn_nvl(SBUxMethod.get("SMS_MESSAGE"));
            let PAY_CALCULATE_MEMO  = gfn_nvl(SBUxMethod.get("PAY_CALCULATE_MEMO"));
            let NOTICE_MEMO 		= gfn_nvl(SBUxMethod.get("NOTICE_MEMO"));

            if (!EMAIL_SUBJECT) {
                gfn_comAlert("W0002", "메일제목");
                return;
            }
            if (!EMAIL_BODY) {
                gfn_comAlert("W0002", "메일내용");
                return;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN	    : ''
                ,V_P_LANG_ID		    : ''
                ,V_P_COMP_CODE		    : gv_ma_selectedCorpCd
                ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

                ,V_P_PAY_YYYYMM         : PAY_YYYYMM_FR
                ,V_P_PAY_TYPE           : PAY_TYPE
                ,V_P_PAY_DATE           : PAY_DATE
                ,V_P_EMAIL_SUBJECT      : EMAIL_SUBJECT
                ,V_P_EMAIL_BODY         : EMAIL_BODY
                ,V_P_NOTICE_MEMO        : NOTICE_MEMO
                ,V_P_PAY_CALCULATE_MEMO : PAY_CALCULATE_MEMO
                ,V_P_SMS_MESSAGE		: SMS_MESSAGE

                ,V_P_FORM_ID            : p_formId
                ,V_P_MENU_ID            : p_menuId
                ,V_P_PROC_ID            : ''
                ,V_P_USERID             : ''
                ,V_P_PC                 : ''


            };
            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/insertHrp2436.do", {
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

                    fn_view();

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

    //삭제
    const fn_del = async function () {
        if (gfn_comConfirm("Q0001", "삭제")) {

            let PAY_YYYYMM_FR = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
            let PAY_TYPE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
            let PAY_DATE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자

            if (!PAY_YYYYMM_FR) {
                gfn_comAlert("W0002", "귀속년월");
                return;
            }
            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!PAY_DATE) {
                gfn_comAlert("W0002", "지급일");
                return;
            }

            let EMAIL_SUBJECT 		= gfn_nvl(SBUxMethod.get("EMAIL_SUBJECT"));
            let EMAIL_BODY 			= gfn_nvl(SBUxMethod.get("EMAIL_BODY"));
            let SMS_MESSAGE 		= gfn_nvl(SBUxMethod.get("SMS_MESSAGE"));
            let PAY_CALCULATE_MEMO  = gfn_nvl(SBUxMethod.get("PAY_CALCULATE_MEMO"));
            let NOTICE_MEMO 		= gfn_nvl(SBUxMethod.get("NOTICE_MEMO"));

            if (!EMAIL_SUBJECT) {
                gfn_comAlert("W0002", "메일제목");
                return;
            }
            if (!EMAIL_BODY) {
                gfn_comAlert("W0002", "메일내용");
                return;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN	    : ''
                ,V_P_LANG_ID		    : ''
                ,V_P_COMP_CODE		    : gv_ma_selectedCorpCd
                ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

                ,V_P_PAY_YYYYMM         : PAY_YYYYMM_FR
                ,V_P_PAY_TYPE           : PAY_TYPE
                ,V_P_PAY_DATE           : PAY_DATE
                ,V_P_EMAIL_SUBJECT      : EMAIL_SUBJECT
                ,V_P_EMAIL_BODY         : EMAIL_BODY
                ,V_P_NOTICE_MEMO        : NOTICE_MEMO
                ,V_P_PAY_CALCULATE_MEMO : PAY_CALCULATE_MEMO
                ,V_P_SMS_MESSAGE		: SMS_MESSAGE

                ,V_P_FORM_ID            : p_formId
                ,V_P_MENU_ID            : p_menuId
                ,V_P_PROC_ID            : ''
                ,V_P_USERID             : ''
                ,V_P_PC                 : ''
            };
            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/insertHrp2436.do", {
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
                    }else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    }
                    fn_view();
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
     * 파일저장
     */
    const fn_btnFile = async function(){
        var nRow = gvwInfoGrid.getRow();
        var conn = '';
        var SENDTYPE = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        if (nRow < 1) {
            return;
        }

        let checkDatas = gvwInfoGrid.getCheckedRowData( gvwInfoGrid.getColRef('CHK_YN') );

        if (_.isEmpty(checkDatas)){
            gfn_comAlert("Q0000","파일 저장할 항목을 체크박스 선택하세요.");
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        for (let i = 0; i < checkDatas.length; i++){

            let datas = [];
            datas.push(checkDatas[i]);

            if (SENDTYPE == "ALL") {
                conn = await fn_GetReportData('REPORT5', datas);
                conn = await gfnma_convertDataForReport(conn);
                let psw = conn[5].data.root[0].EMP_CODE;
                await gfn_getReportPdf("급여명세서.pdf", "ma/RPT_HRP2436_Q_ALL.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                    function(){
                        gfn_comConfirm("Q0001", "다운로드");
                    }
                );
            } else if(SENDTYPE == "PAY") {
                conn = await fn_GetReportData('REPORT3', datas);
                conn = await gfnma_convertDataForReport(conn);
                let psw = conn[5].data.root[0].EMP_CODE;

                await gfn_getReportPdf("급여명세서.pdf", "ma/RPT_HRP2436_Q_PAY.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                    function(){
                        gfn_comConfirm("Q0001", "다운로드");
                    }
                );
            } else if(SENDTYPE == "WORK") {
                conn = await fn_GetReportData('REPORT4', datas);
                conn = await gfnma_convertDataForReport(conn);
                let psw = conn[5].data.root[0].EMP_CODE;

                await gfn_getReportPdf("근태현황.pdf", "ma/RPT_HRP2436_Q_WORK.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                    function(){
                        gfn_comConfirm("Q0001", "다운로드");
                    }
                );
            }
        }
    }

    /**
     * Email 발송
     */
    const fn_btnSendEmail = async function () {
    }

    /**
     * SMS 발송
     */
    const fn_btnSendSMS = async function () {
//             /*
        let PAY_YYYYMM_FR = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
        let PAY_TYPE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let checkData 	  = gvwInfoGrid.getCheckedRowData( gvwInfoGrid.getColRef('CHK_YN') );
        let SENDTYPE 	  = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분

        if (!PAY_YYYYMM_FR) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }
        if (_.isEmpty(checkData)) {
            gfn_comAlert("W0001", "SMS 발송할 데이터");
            return;
        }

        let paramObj = {};
        let listData = [];
console.log('checkData ==>', checkData);
        checkData.forEach((item, index) => {

            paramObj = {
                    V_P_DEBUG_MODE_YN 		: '',
                    V_P_LANG_ID 			: '',
                    V_P_COMP_CODE 			: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE 		: gv_ma_selectedClntCd,

                    V_P_SITE_CODE 			: '',
                    V_P_DEPT_CODE 			: '',
                    V_P_EMP_CODE     		: gfn_nvl(item.data.EMP_CODE),
                    V_P_PAY_YYYYMM    		: gfn_nvl(item.data.PAY_YYYYMM),
                    V_P_PAY_YYYYMM1       	: gfn_nvl(item.data.PAY_YYYYMM),
                    V_P_PAY_TYPE        	: gfn_nvl(item.data.PAY_TYPE),
                    V_P_PAY_DATE			: gfn_nvl(item.data.PAY_DATE),
                    V_P_EMP_CODE_LIST 		: gfn_nvl(item.data.EMP_CODE),
                    V_P_PAY_YYYYMM2 		: gfn_nvl(item.data.PAY_YYYYMM),
                    V_P_PAY_TYPE1     		: gfn_nvl(item.data.PAY_TYPE),
                    V_P_PAY_DATE1    		: gfn_nvl(item.data.PAY_DATE),
                    V_P_PAY_AREA_TYPE       : '',
                    V_P_REPORT_TYPE        	: SENDTYPE,

                    V_P_FORM_ID 			: p_formId,
                    V_P_MENU_ID 			: p_menuId,
                    V_P_PROC_ID 			: '',
                    V_P_USERID 				: '',
                    V_P_PC 					: ''
            };
//    	        파라미터 구분자 추가
//    			let objToString = '';
//    	        objToString = '';
//    	    	for (let data in paramObj){
//    	    		objToString += paramObj[data] + '|'
//    	    	}
            const param = {
                cv_count: '0',
                getType: 'json',
                workType: 'N',
                rownum: item.rownum,
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN      : ''
                    ,V_P_LANG_ID           : ''
                    ,V_P_COMP_CODE         : gv_ma_selectedCorpCd
                    ,V_P_CLIENT_CODE       : gv_ma_selectedClntCd

                    ,V_P_RPT_URL 	  			: p_linkRviewUrl						//리포트 링크
                    ,V_P_MOBL_NO 	  			: gfn_nvl(item.data.MOBILE_NUMBER).replace(/-/g,'')		//휴대폰번호
                    ,V_P_LNKG_UNQ_ID   			: gfnma_generateUUID().replace(/-/g,'')	//UUID
                    ,V_P_TASK_ID				: "MA"									//업무아이디 AM, CO, MA 경영은 MA 고정
                    ,V_P_TASK_SE_CD    			: '1'									//업무구분코드 	1:급여, 2용역
                    ,V_P_RPT_DOC_FILE_PATH     	: SENDTYPE == 'ALL' ? 'ma/RPT_HRP2436_Q_ALL.crf' : (SENDTYPE == 'PAY' ? 'ma/RPT_HRP2436_Q_PAY.crf' : 'ma/RPT_HRP2436_Q_WORK.crf') // 보고문서파일경로
                    ,V_P_PRGRM_NM		    	: 'SP_HRP2436_Q'						// 리포트 조회 프로시저 명		
                    ,V_P_PRGRM_URL		      	: '/hr/hrp/rep/selectHrp2436Report.do'	//리포트 조회 URL
                    ,V_P_PRGRM_PRCS_TYPE 		: SENDTYPE == 'ALL' ? 'REPORT5' : (SENDTYPE == 'PAY' ? 'REPORT3' : 'REPORT4') // 프로시저 워크타입
                    ,V_P_PRCS_RSLT_NOCS 		: '15'									//프로시저 커서 카운트
                    ,V_P_PRMTR_DATA				: gfnma_objectToString(paramObj) 		// 리포트 조회 파라미터
                    ,V_P_LNKG_CERT_KEY	 		: gfn_nvl(item.data.EMP_CODE)			// 조회 가능 비밀번호
                    ,V_P_LNKG_OPEN_YMD         	: gfn_addDate(gfnma_date4().replace(/-/g,'') , 30) //조회가능일자 (저장된 날 +30일로 임의로 설정함)
                    ,V_P_LNKG_EXPRY_YN         	: 'N' 									//연결만료여부
                    ,V_P_SYS_FRST_INPT_DT		: gfnma_date4().replace(/-/g,'')		//시스템최초입력일시
                    ,V_P_SYS_FRST_INPT_USER_ID	: p_userId								//시스템최초입력사용자ID
                    ,V_P_SYS_FRST_INPT_PRGRM_ID	: p_formId								//시스템최초입력프로그램ID

                    ,V_P_FORM_ID           : p_formId
                    ,V_P_MENU_ID           : p_menuId
                    ,V_P_PROC_ID           : ''
                    ,V_P_USERID            : p_userId
                    ,V_P_PC                : ''
                }, true)
            };
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/insertHrp2436SMS.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }else {
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
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
//                     */
    }

    /**
     * 출력
     */
    const fn_btnPrint = async function() {
        var nRow = gvwInfoGrid.getRow();
        var conn = '';
        var SENDTYPE = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        if (nRow < 1) {
            return;
        }

        let checkData = gvwInfoGrid.getCheckedRowData( gvwInfoGrid.getColRef('CHK_YN') );
        let rowData = gvwInfoGrid.getRowData(nRow);

        if (SENDTYPE == "ALL") {
            conn = await fn_GetReportData('REPORT5', checkData);
            conn = await gfnma_convertDataForReport(conn);
            gfn_popClipReportPost("", "ma/RPT_HRP2436_Q_ALL.crf", null, conn );
        } else if(SENDTYPE == "PAY") {
            conn = await fn_GetReportData('REPORT3', checkData);
            conn = await gfnma_convertDataForReport(conn);
            gfn_popClipReportPost("급여명세서", "ma/RPT_HRP2436_Q_PAY.crf", null, conn );
        } else if(SENDTYPE == "WORK") {
            conn = await fn_GetReportData('REPORT4', checkData);
            conn = await gfnma_convertDataForReport(conn);
            gfn_popClipReportPost("근태현황", "ma/RPT_HRP2436_Q_WORK.crf", null, conn );
        }
    }

    const fn_GetReportData = async function(workType, checkData) {
        let SENDTYPE = gfn_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        let obj = checkData[0].data;
        let EMP_CODE_LIST 	= '';
        let PAY_YYYYMM2 	= '';
        let PAY_TYPE1 		= '';
        let PAY_DATE 		= '';
        for(var i=0; checkData.length > i; i++){
            EMP_CODE_LIST += checkData[i].data.EMP_CODE + '|';
            PAY_YYYYMM2 += checkData[i].data.PAY_YYYYMM + '|';
            PAY_TYPE1 += checkData[i].data.PAY_TYPE + '|';
            PAY_DATE += checkData[i].data.PAY_DATE + '|';
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN 		: '',
            V_P_LANG_ID 			: '',
            V_P_COMP_CODE 			: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE 		: gv_ma_selectedClntCd,

            V_P_SITE_CODE 			: '',
            V_P_DEPT_CODE 			: '',
            V_P_EMP_CODE     		: gfn_nvl(obj.EMP_CODE),
            V_P_PAY_YYYYMM    		: gfn_nvl(obj.PAY_YYYYMM),
            V_P_PAY_YYYYMM1       	: gfn_nvl(obj.PAY_YYYYMM),
            V_P_PAY_TYPE        	: gfn_nvl(obj.PAY_TYPE),
            V_P_PAY_DATE			: gfn_nvl(obj.PAY_DATE),
            V_P_EMP_CODE_LIST 		: EMP_CODE_LIST.substring(0, EMP_CODE_LIST.length-1),
            V_P_PAY_YYYYMM2 		: PAY_YYYYMM2.substring(0, PAY_YYYYMM2.length-1),
            V_P_PAY_TYPE1     		: PAY_TYPE1.substring(0, PAY_TYPE1.length-1),
            V_P_PAY_DATE1    		: PAY_DATE.substring(0, PAY_DATE.length-1),
            V_P_PAY_AREA_TYPE       : '',
            V_P_REPORT_TYPE        	: SENDTYPE,

            V_P_FORM_ID 			: p_formId,
            V_P_MENU_ID 			: p_menuId,
            V_P_PROC_ID 			: '',
            V_P_USERID 				: '',
            V_P_PC 					: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2436Report.do", {
            getType				: 'json',
            workType			: workType,
            userId				: p_userId,
            cv_count			: '15',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                for(var i=0; data.cv_6.length > i; i++){
                    if(SENDTYPE == 'WORK'){
                        data.cv_6[i].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
                    }else if(SENDTYPE == 'PAY'){
                        data.cv_6[i].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
                        data.cv_6[i].COMP_STAMP = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_6[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
                    }else if(SENDTYPE == 'ALL'){
                        data.cv_6[i].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
                        data.cv_6[i].COMP_STAMP = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_6[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
                    }
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
        return data;
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
