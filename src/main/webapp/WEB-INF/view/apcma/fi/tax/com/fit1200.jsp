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
                    <table id="regTable" class="table table-bordered tbl_fixed">
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
                                <sbux-select id="reg-slt-taxSiteType" uitype="single" jsondata-ref="jsonTaxSiteType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">사업장 코드</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <div style="display: flex; gap: 5px">
                                <sbux-input id="reg-slt-wholePaySiteCode" name="reg-slt-wholePaySiteCode" uitype="text" class="form-control input-sm" wrap-style="flex-basis:30%"></sbux-input>
                                <div style="display: flex;position: relative">
                                    <sbux-input id="reg-slt-wholePaySiteCode1" name="reg-slt-wholePaySiteCode1" uitype="text" class="form-control input-sm"></sbux-input>
                                    <button style="background-image:url('/static/resource/svg/dot.svg');background-repeat: no-repeat; background-position: center;
                                    background-size: contain; position: absolute; right: 1px; top: 1px; bottom: 1px; border: 0; background-color: white;" onclick="fn_openPopup()"></button>
                                </div>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">신고번호</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-slt-wholePaySiteNo" name="reg-slt-wholePaySiteNo" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">손채권세액공제비율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-inp-baddebtsNumerator" name="reg-inp-baddebtsNumerator" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">의제매입세액(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-inp-deemedNumerator" name="reg-inp-deemedNumerator" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">손채권세액공제비율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-inp-baddebtsDenominator" name="reg-inp-baddebtsDenominator" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">의제매입세액(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-inp-deemedDenominator" name="reg-inp-deemedDenominator" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-inp-deemLimitNum" name="reg-inp-deemLimitNum" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="reg-inp-deemLimitDenom" name="reg-inp-deemLimitDenom" uitype="text" class="form-control input-sm"></sbux-input>
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
    <div>
        <sbux-modal id="wholePaySitePopup" name="wholePaySitePopup" uitype="small"
                    header-title="신고사업장정보"
                    body-html-id="body-wholePaySitePopup"
                    style="width: 500px">
        </sbux-modal>
    </div>
    <div id="body-wholePaySitePopup">
        <jsp:include page="../../../com/popup/comPopFit1200.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
    var gv_ma_selectedApcCd	= '${loginVO.apcCd}';
    var gv_ma_selectedClntCd	= '${loginVO.clntCd}';
    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //----------------------------------------------------------
    var jsonCorpNm;
    var jsonTaxSiteType;

    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });
    const fn_init = async function(){
        jsonTaxSiteType = await gfnma_getComSelectList('L_FIT036','','','','COMP_CODE',"COMP_NAME");
        SBUxMethod.refresh('reg-slt-taxSiteType');
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
            ,dropAlign		: '' 	// left, right
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
        fn_search();
    }

    /** 공통버튼 저장 **/
    function cfn_save(){
        fn_save();
    }

    /** 공통버튼 신규 **/
    function cfn_add(){

    }
    /** fit1200_Q_Detail **/
    const fn_search = async function(){
       let V_P_YYYY = gfnma_nvl(SBUxMethod.get("srch-dtp-yyyy"));
       let V_P_SEQ = gfnma_multiSelectGet("#src-btn-currencyCode");

       var paramObj = {
            V_P_WORK_TYPE           :   ""
           ,V_P_DEBUG_MODE_YN       :   ""
           ,V_P_LANG_ID             :   ""
           ,V_P_COMP_CODE           :   gv_ma_selectedApcCd
           ,V_P_CLIENT_CODE         :   gv_ma_selectedClntCd
           ,V_P_YYYY                :   V_P_YYYY
           ,V_P_SEQ                 :   V_P_SEQ
           ,V_P_FORM_ID             :   p_formId
           ,V_P_MENU_ID             :   p_formId
           ,V_P_PROC_ID             :   ""
           ,V_P_USERID              :   p_formId
           ,V_P_PC                  :   ""
       }

        const postJsonPromise = gfn_postJSON("/co/sys/fit/selectFit1200.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

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
    const fn_save = async function(){
       if(!gfn_comConfirm("Q0001","저장")){
           return;
       }

       var paramObj = {
            V_P_DEBUG_MODE_YN              : ''
           ,V_P_LANG_ID                    : ''
           ,V_P_COMP_CODE                  : gv_ma_selectedApcCd
           ,V_P_CLIENT_CODE                : gv_ma_selectedClntCd
           ,V_P_YYYY                       : ''
           ,V_P_SEQ                        : ''
           ,V_P_TAX_SITE_TYPE              : ''
           ,V_P_WHOLE_PAY_SITE_CODE        : ''
           ,V_P_WHOLE_PAY_SITE_NO          : ''
           ,V_P_BADDEBTS_NUMERATOR         : ''
           ,V_P_BADDEBTS_DENOMINATOR       : ''
           ,V_P_DEEMED_NUMERATOR           : ''
           ,V_P_DEEMED_DENOMINATOR         : ''
           ,V_P_DEEM_LIMIT_NUM             : ''
           ,V_P_DEEM_LIMIT_DENOM           : ''
           ,V_P_FORM_ID                    : p_formId
           ,V_P_MENU_ID                    : p_menuId
           ,V_P_PROC_ID                    : ''
           ,V_P_USERID			           : ''
           ,V_P_PC				           : ''
       }
       let postFlag = gfnma_getTableElement("regTable","reg-",paramObj,"V_P_");

       if(!postFlag){
           return;
       }

       const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1200S.do",{
           getType				: 'json',
           cv_count			    : '0',
           workType             : '',
           params				: gfnma_objectToString(paramObj)
       });


    }
    const fn_openPopup = function(){
        SBUxMethod.openModal('wholePaySitePopup');
        popFit1200.fn_init(() => {});
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
