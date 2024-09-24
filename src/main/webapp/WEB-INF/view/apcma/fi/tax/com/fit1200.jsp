<%
    /**
     * @Class Name 		: fit1200.jsp
     * @Description 	: 부가가치세 환경설정 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.03   	이경한		최초 생성
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
    <title>title : 부가가치세 환경설정</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">

    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <!-- content_header start -->
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">법인</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="srch-slt-corpNm" uitype="single" jsondata-ref="jsonCorpNm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td style="border-right: hidden"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">기준연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year" date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed">
                        </sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">신고구분명</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <!-- content_header end -->
            <!-- content_body start -->
            <div style="display: flex; flex-direction: column; height: 80vh">
                <div style="flex: 1; margin-top: 2vh">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>신고사업장정보</span></li>
                        </ul>
                    </div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 10%">
                            <col style="width: 8%">
                            <col style="width: 15%">
                            <col style="width: 10%">
                            <col style="width: 8%">
                            <col style="width: 15%">
                            <col style="width: 10%">
                            <col style="width: 8%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">사업장 구분</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">사업장 코드</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="기준연도" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">신고번호</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="신고구분명" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">손채권세액공제비율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">의제매입세액(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">손채권세액공제비율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">의제매입세액(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- content_body end -->

        </div>
    </div>
</section>


</body>
<script type="text/javascript">
    var gv_ma_selectedApcCd	= '${loginVO.apcCd}';
    var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //----------------------------------------------------------
    var jsonCorpNm;

    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });
    const fn_init = async function(){
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','','','','COMP_CODE',"COMP_NAME");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedApcCd);

        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));

        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#src-btn-currencyCode']
            ,compCode		: gv_ma_selectedApcCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: ''
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'right' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TYPE_NAME'
            ,columns		:[
                {caption: "부가세유형",		ref: 'VAT_TYPE_NAME', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 		ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'WHOLE_PAY_SITE_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 		ref: 'CONFIRM_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 		ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
            ]
        });

    }

    /** 공통버튼 조회 **/
    function cfn_search(){
        fn_searchFit1200Q();
    }

    /** 공통버튼 저장 **/
    function cfn_save(){
    }

    /** 공통버튼 신규 **/
    function cfn_add(){

    }
    /** fit1200_Q_Detail **/
    const fn_searchFit1200Q = async function(){
       let V_P_YYYY = gfnma_nvl(SBUxMethod.get("srch-dtp-yyyy"));
       let V_P_SEQ = gfnma_multiSelectGet("#src-btn-currencyCode");
       console.log(V_P_YYYY);
       console.log(V_P_SEQ);

       var paramObj = {
            V_P_WORK_TYPE           :   "DETAIL"
           ,V_P_DEBUG_MODE_YN       :   ""
           ,V_P_LANG_ID             :   ""
           ,V_P_COMP_CODE           :   gv_ma_selectedApcCd
           ,V_P_CLIENT_CODE         :   gv_ma_selectedClntCd
           ,V_P_YYYY                :   V_P_YYYY
           ,V_P_SEQ                 :   V_P_SEQ
           ,V_P_USER_ID             :   ""
           ,V_P_FORM_ID             :   p_formId
           ,V_P_MENU_ID             :   p_formId
           ,V_P_PROC_ID             :   ""
           ,V_P_USERID              :   p_formId
           ,V_P_PC                  :   ""
       }

        const postJsonPromise = gfn_postJSON("/co/sys/fit/selectFit1200.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        console.log(data,"data");
        return;
        try{
            if (_.isEqual("S", data.resultStatus)) {
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
