<%
    /**
     * @Class Name 		: hri5100.jsp
     * @Description 	: 인원현황 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.05.13
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.13   	이경한		최초 생성
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
    <title>title : 인원현황</title>
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
                </h3>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table id="srchArea" class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row" class="th_bg_search"><span class="data_required"></span>기준일자</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YMDDATE1"
                                name="SRCH_YMDDATE1"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                required
                        />
                    </td>
                    <td colspan="20" class="td_input" style="border-right: hidden;">
                        <p class="ad_input_row">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="SRCH_CHKGUBUN"
                                    name="SRCH_CHKGUBUN"
                                    uitype="normal"
                                    class="form-control input-sm check"
                                    text="조회구분"
                                    onchange="fnSrchChkgubunChange(SRCH_CHKGUBUN)"
                            />
                        </p>
                    </td>
                </tr>
                <tr id="srchYmddate2Section" style="display: none;">
                    <th scope="row" class="th_bg_search">기준일자2</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YMDDATE2"
                                name="SRCH_YMDDATE2"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                onchange="fn_valueChangeForYmddate2(this)"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>부서별 직원명부</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwInfo" style="height:550px;"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
    });

    function fnSrchChkgubunChange(args){
        if(args.SRCH_CHKGUBUN) {
            $("#srchYmddate2Section").show();
            gvwInfo.setColHidden(6, false, false);
            gvwInfo.setColHidden(4, false, false);
            gvwInfo.setColHidden(3, false, false);
            gvwInfo.setColHidden(2, false, false);
        } else {
            $("#srchYmddate2Section").hide();
            gvwInfo.setColHidden(6, true, false);
            gvwInfo.setColHidden(4, true, false);
            gvwInfo.setColHidden(3, true, false);
            gvwInfo.setColHidden(2, true, false);
        }
    }

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var jsonHriList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonHriList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting 	= true;
        SBGridProperties.columns = [
            {caption: ["구분"],		ref: 'GUBUN', 			type:'output',  	width:'154px',  	style:'text-align:left'},
            {caption: ["년초"], 		ref: 'CNT',    	        type:'output',  	width:'75px',  	    style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20}},
            {caption: ["기준일자"],  ref: 'CNT2',    		type:'output',  	width:'86px',   	style:'text-align:right', hidden: true},
            {caption: ["전주증가"],	ref: 'UP2', 			type:'output',  	width:'63px',    	style:'text-align:right', hidden: true},
            {caption: ["전주감소"],	ref: 'DOWN2',   		type:'output',  	width:'57px',   	style:'text-align:right', hidden: true},
            {caption: ["현재"],      ref: 'CNT1', 		    type:'output',  	width:'69px',    	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20}},
            {caption: ["전주계"], 	ref: 'GYE2', 			type:'output',  	width:'77px',    	style:'text-align:right', hidden: true},
            {caption: ["비율"],	    ref: 'PER',	            type:'output',  	width:'58px',   	style:'text-align:right'},
            {caption: ["증가"], 		ref: 'UP',  			type:'output',  	width:'60px',   	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20}},
            {caption: ["감소"], 		ref: 'DOWN', 			type:'output',		width:'67px',		style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20}},
            {caption: ["계"], 		ref: 'GYE', 			type:'output',		width:'71px',		style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20}},
            {caption: ["비고"], 		ref: 'BIGO', 			type:'output',		width:'160px',		style:'text-align:center'}
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
        gvwInfo.clearStatus();

        let YMDDATE1	= gfn_nvl(SBUxMethod.get("SRCH_YMDDATE1"));
        let YMDDATE2	= gfn_nvl(SBUxMethod.get("SRCH_YMDDATE2"));
        let srchChkgubun = SBUxMethod.get('SRCH_CHKGUBUN').SRCH_CHKGUBUN;
        var workType = 'Q';

        if(srchChkgubun) {
            workType = 'QQ';
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_SITE_CODE      : ''
            ,V_P_DATE1      	: YMDDATE1
            ,V_P_DATE2	        : YMDDATE2
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri5100List.do", {
            getType				: 'json',
            workType			: workType,
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonHriList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        GUBUN				: item.SE_CD,
                        CNT		            : item.CNT,
                        CNT2				: item.CNT2,
                        CNT1	           	: item.CNT1,
                        PER	                : item.PER,
                        UP2		    		: item.UP2,
                        DOWN2	    		: item.DOWN2,
                        GYE2				: item.GYE2,
                        UP			    	: item.UP,
                        DOWN 				: item.DOWN,
                        GYE                 : item.GYE,
                        BIGO                : item.BIGO
                    }
                    jsonHriList.push(msg);
                });

                gvwInfo.rebuild();

                if(srchChkgubun) {
                    gvwInfo.setColHidden(6, false, false);
                    gvwInfo.setColHidden(4, false, false);
                    gvwInfo.setColHidden(3, false, false);
                    gvwInfo.setColHidden(2, false, false);
                } else {
                    gvwInfo.setColHidden(6, true, false);
                    gvwInfo.setColHidden(4, true, false);
                    gvwInfo.setColHidden(3, true, false);
                    gvwInfo.setColHidden(2, true, false);
                }

                if (gfn_nvl(SBUxMethod.get("SRCH_YMDDATE2")) != "") {
                    gvwInfo.setCaption("구분^년초^기준일자("+gfn_nvl(SBUxMethod.get("SRCH_YMDDATE2"))+")^전주증가^전주감소^현재^전주계^비율^증가^감소^계^비고")
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

    const fn_valueChangeForYmddate2 = async function(data) {
        let date1 = gfn_nvl(SBUxMethod.get("SRCH_YMDDATE1"));
        let date2 = gfn_nvl(SBUxMethod.get("SRCH_YMDDATE2"));

        if (parseInt(date2) >= parseInt(date1)) {
            gfn_comAlert("E0000", "기준일자2가 기준일자보다 늦을수 없습니다.");
        }

        if (date2 != "") {
            gvwInfo.setCaption("구분^년초^기준일자("+date2+")^전주증가^전주감소^현재^전주계^비율^증가^감소^계^비고")
        }
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>