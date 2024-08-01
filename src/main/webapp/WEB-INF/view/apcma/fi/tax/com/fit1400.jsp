<%
    /**
     * @Class Name 		: fit1400.jsp
     * @Description 	: 부가가치세 기준정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.28
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.28   	이경한		최초 생성
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
    <title>title : 부가가치세 기준정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
                        <sbux-select readonly id="srch-slt-corpNm" name="srch-slt-corpNm" uitype="single" jsondata-ref="jsonCorpNm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">기준년도</th>
                    <td class="td_input" style="border-right: hidden;">
<%--                        <sbux-select id="기준연도" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year" date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed">
                        </sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">신고구분명</th>
                    <td class="td_input" style="border-right: hidden;">
<%--                        <sbux-select id="신고구분명" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
    <div class="dropdown">
        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <font>선택</font>
            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
        </button>
        <div class="dropdown-menu" aria-labelledby="CURRENCY_CODE" style="width:750px;height:150px;padding-top:0px;overflow:auto">
        </div>
    </div>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <!-- content_header end -->
            <!-- content_body start -->
            <div style="display: flex; flex-direction: column; height: 80vh">
                <div style="flex: 1;">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 신고 기준정보 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-stdInfoList"></div>
                </div>
                <div style="flex: 1;">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 신고 기준정보 편집</span></li>
                        </ul>
                    </div>
                    <div>
                        <table class="table table-bordered tbl_fixed">
                            <caption>검색 조건 설정</caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 9%">
                                <col style="width: 3%">
                                <col style="width: 10%">
                                <col style="width: 9%">
                                <col style="width: 3%">
                                <col style="width: 10%">
                                <col style="width: 9%">
                                <col style="width: 3%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg"><span></span>기준연도</th> <!--class="data_required" 필수 표기 -->
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-datepicker id="reg-dtp-yyyy" name="reg-dtp-yyyy" uitype="popup" datepicker-mode="year" date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed">
                                    </sbux-datepicker>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>부가세기간구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-cbotaxTerm" name="reg-slt-cbotaxTerm" uitype="single" jsondata-ref="jsonCbotaxTerm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>신고구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-cbotaxRepDtlType" name="reg-slt-cbotaxRepDtlType" uitype="single" jsondata-ref="jsonCbotaxRepDtlType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>부가세 서식명</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input id="reg-inp-vatTypeNm" name="reg-inp-vatTypeNm" uitype="text"></sbux-input>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>신고기준월</th>
                                <td class="td_input" style="border-right: hidden" colspan="2">
                                    <div style="display: flex; gap: 10px">
                                        <sbux-datepicker id="reg-dtp-stdMoFrom" name="reg-dtp-stdMoFrom" uitype="popup" datepicker-mode="month" date-format="yyyy-mm"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed">
                                        </sbux-datepicker>
                                        <sbux-datepicker id="reg-dtp-stdMoTo" name="reg-dtp-stdMoTo" uitype="popup" datepicker-mode="month" date-format="yyyy-mm"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed">
                                        </sbux-datepicker>
                                    </div>
                                </td>

                                <th scope="row" class="th_bg"><span ></span>신고일</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-datepicker id="reg-dtp-rptDt" name="reg-dtp-rptDt" uitype="popup" class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed">
                                    </sbux-datepicker>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>조기환급 신고여부</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-checkbox id="reg-chk-rfYn" name="reg-chk-rfYn" uitype="normal" text="조기환급신고">
                                    </sbux-checkbox>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>환급구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-cboRfType" name="reg-slt-cboRfType" uitype="single" jsondata-ref="jsonCboRfType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>조기환급취소여부</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-checkbox id="reg-chk-rfCxlYn" name="reg-chk-rfCxlYn" uitype="normal" text="조기환급취소여부">
                                    </sbux-checkbox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>총괄(단위과세)번호</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input id="reg-inp-payOrgNo" name="reg-inp-payOrgNo" uitype="text"></sbux-input>
                                </td>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>비고</th>
                                <td class="td_input" colspan="8">
                                    <sbux-textarea id="reg-txa-rmrk" name="reg-txa-rmrk"  uitype="normal" rows="2" wrap-style="width:100%">
                                    </sbux-textarea>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="flex: 1;">
                    <div style="display: flex;justify-content: space-between;">
                        <div style="width: 35%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>◎ 신고사업장 정보 리스트</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-신고사업장"></div>
                        </div>
                        <div style="width: 50%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>◎ 부가세 부속서류 첨부 리스트</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-부가세"></div>
                        </div>

                    </div>
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
    //-----------------------------------------------------------
    /** 부가세기간 구분 **/
    var jsonCbotaxTerm = [];
    /** 신고 구분 **/
    var jsonCbotaxRepDtlType = [];
    /** 환급 구분 **/
    var jsonCboRfType = [];


    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
       fn_create부가세();
       fn_create기준정보();
       fn_create신고사업장();

       fn_init();
    });

    const fn_init = async function(){
        /** 법인 select **/
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','','','','COMP_CODE',"COMP_NAME");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedApcCd);

        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));

        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#CURRENCY_CODE']
            ,compCode		: gv_ma_selectedApcCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: ''
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'right' 	// left, right
            ,colValue		: 'CURRENCY_CODE'
            ,colLabel		: 'CURRENCY_NAME'
            ,columns		:[
                {caption: "부가세유형",		ref: 'VAT_TYPE_NAME', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_MONTH_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_MONTH_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 		ref: 'ENT',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'PAY_ORGSITE_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 		ref: 'DEL_YN',    		width:'150px',  	style:'text-align:left'}
            ]
        })

        /** 등록조건_부가세기준정보 select **/
        jsonCbotaxTerm = await gfnma_getComSelectList('L_FIT002','',gv_ma_selectedApcCd,gv_ma_selectedClntCd,'SUB_CODE',"CODE_NAME");
        SBUxMethod.refresh("reg-slt-cbotaxTerm");

        /** 등록조건_신고구분 select **/
        jsonCbotaxRepDtlType = await gfnma_getComSelectList('L_FIT035','',gv_ma_selectedApcCd,gv_ma_selectedClntCd,'SUB_CODE',"CODE_NAME");
        SBUxMethod.refresh("reg-slt-cbotaxRepDtlType");

        /** 등록조건_환급구분 select **/
        jsonCboRfType = await gfnma_getComSelectList('L_FIT023','',gv_ma_selectedApcCd,gv_ma_selectedClntCd,'SUB_CODE',"CODE_NAME");
        SBUxMethod.refresh("reg-slt-cboRfType");





    }
    /** 기준정보 리스트 **/
    let stdInfoList;
    var jsonstdInfoList = [];

    /** 신고사업장 리스트**/
    let 신고사업장;
    let 부가세;


    var jsonCorpNm =[];

    /** 기준정보 GRID **/
    function fn_create기준정보(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-stdInfoList';
        SBGridProperties.id = 'stdInfoList';
        SBGridProperties.jsonref = 'json기준정보';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['기준연도'], 			ref: 'brndNm', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세기간구분'], 			ref: 'cnptNm', 		width: '7%',	type: 'inputcombo',	style:'text-align: center'},
            {caption: ['신고구분'],				ref: 'itemNm', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세 서식명'],				ref: 'vrtyNm', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고기준시작월'], 				ref: 'spcfctNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고기준종료월'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고사업장수'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고일'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['비고'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['총괄납부(단위과세)관리번호'], 				ref: 'gdsGrdNm', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['조기환급신고여부'], 				ref: 'gdsGrdNm', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급구분'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급취소여부'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
        ]
        stdInfoList = _SBGrid.create(SBGridProperties);
    }

    /** 신고사업장 정보 GRID **/
    function fn_create신고사업장(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-신고사업장';
        SBGridProperties.id = '신고사업장';
        SBGridProperties.jsonref = 'json신고사업장';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['신고사업장명'], 			ref: 'brndNm', 		width: '50%',	type: 'output',	style:'text-align: center'},
            {caption: ['사업자번호'], 			ref: 'cnptNm', 		width: '30%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고여부'],				ref: 'vrtyNm', 		width: '20%',	type: 'output',	style:'text-align: center'},
        ]
        신고사업장 = _SBGrid.create(SBGridProperties);
    }

    /** 신고사업장 정보 GRID **/
    function fn_create부가세(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-부가세';
        SBGridProperties.id = '부가세';
        SBGridProperties.jsonref = 'json부가세';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['순번'], 			ref: 'brndNm', 		width: '20%',	type: 'output',	style:'text-align: center'},
            {caption: ['서식명'], 			ref: 'cnptNm', 		width: '50%',	type: 'output',	style:'text-align: center'},
            {caption: ['작성대상'],				ref: 'vrtyNm', 		width: '30%',	type: 'output',	style:'text-align: center'},
        ]
        부가세 = _SBGrid.create(SBGridProperties);
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
