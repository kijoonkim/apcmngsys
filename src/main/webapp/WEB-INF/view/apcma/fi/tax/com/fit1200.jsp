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
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
        <div class="box box-solid" style="border-radius: 0">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <!-- content_header start -->
            <table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row">기준연도</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker id="SRCH_YYYY"
                                         name="SRCH_YYYY"
                                         uitype="popup"
                                         datepicker-mode="year"
                                         date-format="yyyy"
                                         class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                         onchange="fn_setMultSelect(SRCH_YYYY)">
                        </sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row">신고구분명</th>
                    <td colspan="3" class="td_input">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SEQ" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SEQ" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
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
                            <col style="width: 10%">
                            <col style="width: 15%">
                            <col style="width: 10%">
                            <col style="width: 10%">
                            <col style="width: 10%">
                            <col style="width: 3%">
                            <col style="width: 10%">
                            <col style="width: 15%">
                            <col style="width: 8%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">사업장 구분</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="TX_SITE_TYPE"
                                             uitype="single"
                                             jsondata-ref="jsonTaxSiteType"
                                             class="form-control input-sm"
                                             jsondata-text="CD_NM"
                                             jsondata-value="SBSD_CD"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">사업장 코드</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="OVS_BPLC_CD" name="OVS_BPLC_CD" uitype="text" class="form-control input-sm inpt_data_reqed" readonly></sbux-input>
                            </td>
                            <td class="td_input">
                                <sbux-input id="OVS_BPLC_NM" name="OVS_BPLC_NM" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input">
                                <sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_openPopup()"></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">신고번호</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="OVS_BPLC_NO" name="OVS_BPLC_NO" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">대손채권세액공제비율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="BADDT_RPMT_NMTR" name="BADDT_RPMT_NMTR" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">의제매입세액(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="DMINPT_NMTR" name="DMINPT_NMTR" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">대손채권세액공제비율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="BADDT_RPMT_DNMNTR" name="BADDT_RPMT_DNMNTR" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">의제매입세액(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="DMINPT_DNMNTR" name="DMINPT_DNMNTR" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="DMINPT_NMTR_LMT" name="DMINPT_NMTR_LMT" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="DMINPT_DNMNTR_LMT" name="DMINPT_DNMNTR_LMT" uitype="text" class="form-control input-sm"></sbux-input>
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
        /** 사업장 구분 **/
        let data = await gfnma_getComList('L_FIT036','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        jsonTaxSiteType = data.cv_1;
        SBUxMethod.refresh('TX_SITE_TYPE');
        SBUxMethod.setValue('TX_SITE_TYPE',gv_ma_selectedCorpCd);
 
        /** 기준연도 **/
        let yyyy = gfn_dateToYear(new Date());
        SBUxMethod.set('SRCH_YYYY',yyyy);
        await fn_setMultSelect(yyyy);
    }
    async function fn_setMultSelect(yyyy){

        await fn_reset();

        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#SRCH_SEQ']
            ,compCode		: gv_ma_selectedCorpCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: "AND A.YR = '" + yyyy + "'"
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: '' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TMPLT_NM'
            ,columns		:[
                {caption: "부가세유형",			ref: 'VAT_TMPLT_NM', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 	ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'OVS_BPLC_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 			ref: 'CFMTN_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 				ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
            ]
            ,callback       : fn_choice
        });

    }
    async function fn_choice(_value){
        await fn_search();
    }
    /** 공통버튼 조회 **/
    function cfn_search(){
        fn_search();
    }
 
    /** 공통버튼 저장 **/
    function cfn_save(){
        fn_save();
    }
 
    /** 공통버튼 초기화 **/
    function cfn_init(){
        gfnma_uxDataClear('#srchArea1');
    }
    /** fit1200_Q_Detail **/
    const fn_search = async function(){
        /** 조회전 reset **/
        await fn_reset();
 
       let V_P_YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
       let V_P_SEQ = gfnma_multiSelectGet("#SRCH_SEQ");
 
       if(gfn_isEmpty(V_P_YYYY)){
           gfn_comAlert("W0005","기준연도");
           return;
       }
       if(gfn_isEmpty(V_P_SEQ)){
           gfn_comAlert("W0005","신고구분명");
           return;
       }

       var paramObj = {
            V_P_DEBUG_MODE_YN       :   ""
           ,V_P_LANG_ID             :   ""
           ,V_P_COMP_CODE           :   gv_ma_selectedCorpCd
           ,V_P_CLIENT_CODE         :   gv_ma_selectedClntCd
           ,V_P_YYYY                :   V_P_YYYY
           ,V_P_SEQ                 :   V_P_SEQ
           ,V_P_FORM_ID             :   p_formId
           ,V_P_MENU_ID             :   p_menuId
           ,V_P_PROC_ID             :   ""
           ,V_P_USERID              :   ""
           ,V_P_PC                  :   ""
       }
 
        const postJsonPromise = gfn_postJSON("/fi/tax/selectFit1200.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
 
        try{
            if (_.isEqual("S", data.resultStatus)) {
                console.log('data ==> ', data);
                if(!gfn_isEmpty(data.cv_1[0])){
                    let detailData = data.cv_1[0]

                    SBUxMethod.set("TX_SITE_TYPE",          gfnma_nvl2(detailData.TX_SITE_TYPE)); // 사업장 구분
                    SBUxMethod.set("OVS_BPLC_CD",           gfnma_nvl2(detailData.OVS_BPLC_CD)); //사업장 코드
                    SBUxMethod.set("OVS_BPLC_NM",           gfnma_nvl2(detailData.TX_SITE_NM)); //사업장 명
                    SBUxMethod.set("OVS_BPLC_NO",           gfnma_nvl2(detailData.OVS_BPLC_NO)); // 신고번호
                    SBUxMethod.set("BADDT_RPMT_NMTR",       gfnma_nvl2(detailData.BADDT_RPMT_NMTR)); // 대손채권세액공제비율(분자)
                    SBUxMethod.set("BADDT_RPMT_DNMNTR",     gfnma_nvl2(detailData.BADDT_RPMT_DNMNTR)); // 대손채권세액공제비율(분모)
                    SBUxMethod.set("DMINPT_NMTR",           gfnma_nvl2(detailData.DMINPT_NMTR)); // 의제매입세액(분자)
                    SBUxMethod.set("DMINPT_DNMNTR",         gfnma_nvl2(detailData.DMINPT_DNMNTR)); // 의제매입세액(분모)
                    SBUxMethod.set("DMINPT_NMTR_LMT",       gfnma_nvl2(detailData.DMINPT_NMTR_LMT)); // 한도율(분자)
                    SBUxMethod.set("DMINPT_DNMNTR_LMT",     gfnma_nvl2(detailData.DMINPT_DNMNTR_LMT)); // 한도율(분모)
                }
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

        let V_P_YYYY = SBUxMethod.get("SRCH_YYYY");
        let V_P_TAX_SITE_TYPE = SBUxMethod.get("TX_SITE_TYPE");
        let V_P_SEQ = gfnma_multiSelectGet("#SRCH_SEQ");

        let V_P_WHOLE_PAY_SITE_CODE = SBUxMethod.get("OVS_BPLC_CD"); //사업장 코드
        let V_P_WHOLE_PAY_SITE_NO = SBUxMethod.get("OVS_BPLC_NO"); //사업장 명
        let V_P_BADDEBTS_NUMERATOR = SBUxMethod.get("BADDT_RPMT_NMTR"); //대손채권세액공제비율(분자)
        let V_P_BADDEBTS_DENOMINATOR = SBUxMethod.get("BADDT_RPMT_DNMNTR"); //대손채권세액공제비율(분모)
        let V_P_DEEMED_NUMERATOR = SBUxMethod.get("DMINPT_NMTR");//의제매입세액(분자)
        let V_P_DEEMED_DENOMINATOR = SBUxMethod.get("DMINPT_DNMNTR"); //의제매입세액(분모)
        let V_P_DEEM_LIMIT_NUM = SBUxMethod.get("DMINPT_NMTR_LMT"); //한도율(분자)
        let V_P_DEEM_LIMIT_DENOM = SBUxMethod.get("DMINPT_DNMNTR_LMT"); //한도율(분모)

        if(!gfn_comConfirm("Q0001","저장")){
            return;
        }
        if(gfn_isEmpty(V_P_SEQ)){
            gfn_comAlert("Q0000", "신고구분명을 선택하십시오.");
            return;ㄹ
        }
        if(gfn_isEmpty(V_P_WHOLE_PAY_SITE_CODE)){
            gfn_comAlert("Q0000", "사업장 코드를 선택하십시오.");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN              : ''
           ,V_P_LANG_ID                    : ''
           ,V_P_COMP_CODE                  : gv_ma_selectedCorpCd
           ,V_P_CLIENT_CODE                : gv_ma_selectedClntCd

           ,V_P_YYYY                       : gfnma_nvl2(V_P_YYYY)
           ,V_P_SEQ                        : gfnma_nvl2(V_P_SEQ)
           ,V_P_TAX_SITE_TYPE              : gfnma_nvl2(V_P_TAX_SITE_TYPE)
           ,V_P_WHOLE_PAY_SITE_CODE        : gfnma_nvl2(V_P_WHOLE_PAY_SITE_CODE)
           ,V_P_WHOLE_PAY_SITE_NO          : gfnma_nvl2(V_P_WHOLE_PAY_SITE_NO)
           ,V_P_BADDEBTS_NUMERATOR         : gfnma_nvl2(V_P_BADDEBTS_NUMERATOR)
           ,V_P_BADDEBTS_DENOMINATOR       : gfnma_nvl2(V_P_BADDEBTS_DENOMINATOR)
           ,V_P_DEEMED_NUMERATOR           : gfnma_nvl2(V_P_DEEMED_NUMERATOR)
           ,V_P_DEEMED_DENOMINATOR         : gfnma_nvl2(V_P_DEEMED_DENOMINATOR)
           ,V_P_DEEM_LIMIT_NUM             : gfnma_nvl2(V_P_DEEM_LIMIT_NUM)
           ,V_P_DEEM_LIMIT_DENOM           : gfnma_nvl2(V_P_DEEM_LIMIT_DENOM)

           ,V_P_FORM_ID                    : p_formId
           ,V_P_MENU_ID                    : p_menuId
           ,V_P_PROC_ID                    : ''
           ,V_P_USERID			           : ''
           ,V_P_PC				           : ''
        }


        const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1200.do",{
           getType				: 'json',
           cv_count			    : '0',
           workType             : 'N',
           params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        try {
            if(data.resultStatus === 'S'){
                gfn_comAlert("Q0000",data.resultMessage);
                await fn_search();
            }else{
                gfn_comAlert("Q0000",data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    const fn_openPopup = function(){
        SBUxMethod.openModal('wholePaySitePopup');
        popFit1200.fn_init(click);
    }
    function click(){
        let gridIdx = grdTaxSite.getRow();
        let rowData = grdTaxSite.getRowData(gridIdx);
        let _siteCode = rowData.TX_SITE_CD;
        let _orgsiteName = rowData.TX_SITE_NM;
 
        SBUxMethod.set("OVS_BPLC_CD",_siteCode);
        SBUxMethod.set("OVS_BPLC_NM",_orgsiteName);
 
        SBUxMethod.closeModal('wholePaySitePopup');
    }
    const fn_reset = async function(){
        gfnma_uxDataClear('#regTable');
        //
        // let yyyy = SBUxMethod.get('SRCH_YYYY');
        // await fn_setMultSelect(yyyy);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
