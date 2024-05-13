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
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
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
                    <th scope="row" class="th_bg"><span class="data_required"></span>기준일자</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YMDDATE1"
                                name="SRCH_YMDDATE1"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
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
                    <th scope="row" class="th_bg">기준일자2</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YMDDATE2"
                                name="SRCH_YMDDATE2"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
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
                        <div id="sb-area-gvwInfo" style="height:616px;"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

        fn_createGrid();
        fn_clearForm();
        fn_search();
    });

    function fnSrchChkgubunChange(args){
        if(args.SRCH_CHKGUBUN) {
            $("#srchYmddate2Section").show();
            gvwInfo.setColHidden(7, false, false);
            gvwInfo.setColHidden(5, false, false);
            gvwInfo.setColHidden(4, false, false);
            gvwInfo.setColHidden(3, false, false);
        } else {
            $("#srchYmddate2Section").hide();
            gvwInfo.setColHidden(7, true, false);
            gvwInfo.setColHidden(5, true, false);
            gvwInfo.setColHidden(4, true, false);
            gvwInfo.setColHidden(3, true, false);
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
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.paging = {
            'type' 			: 'page',
            'count' 		: 5,
            'size' 			: 20,
            'sorttype' 		: 'page',
            'showgoalpageui': true
        };
        SBGridProperties.columns = [
            {caption: ["구분"],		ref: 'GUBUN', 			type:'output',  	width:'154px',  	style:'text-align:left'},
            {caption: ["년초"], 		ref: 'CNT',    	        type:'output',  	width:'75px',  	    style:'text-align:left'},
            {caption: ["기준일자"],  ref: 'CNT2',    		type:'output',  	width:'86px',   	style:'text-align:left', hidden: true},
            {caption: ["전주증가"],	ref: 'UP2', 			type:'combo',  		width:'63px',    	style:'text-align:left', hidden: true},
            {caption: ["전주감소"],	ref: 'DOWN2',   		type:'combo',  		width:'57px',   	style:'text-align:left', hidden: true},
            {caption: ["현재"],      ref: 'CNT1', 		    type:'output',  	width:'69px',    	style:'text-align:left'},
            {caption: ["전주계"], 	ref: 'GYE2', 			type:'output',  	width:'77px',    	style:'text-align:left', hidden: true},
            {caption: ["비율"],	    ref: 'PER',	            type:'output',  	width:'58px',   	style:'text-align:left'},
            {caption: ["증가"], 		ref: 'UP',  			type:'output',  	width:'60px',   	style:'text-align:left'},
            {caption: ["감소"], 		ref: 'DOWN', 			type:'output',		width:'67px',		style:'text-align:center'},
            {caption: ["계"], 		ref: 'GYE', 			type:'output',		width:'71px',		style:'text-align:center'},
            {caption: ["비고"], 		ref: 'BIGO', 			type:'output',		width:'160px',		style:'text-align:center'}
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('beforepagechanged', 'fn_pagingHriList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

        // set pagination
        let pageSize = gvwInfo.getPageSize();
        let pageNo = 1;

        gvwInfo.movePaging(pageNo);
    }

    /**
     *
     */
    const fn_pagingHriList = async function() {
        let recordCountPerPage 	= gvwInfo.getPageSize();   			// 몇개의 데이터를 가져올지 설정
        let currentPageNo 		= gvwInfo.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
        var getColRef 			= gvwInfo.getColRef("checked");
        gvwInfo.setFixedcellcheckboxChecked(0, getColRef, false);
        fn_setGvwInfo(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGvwInfo = async function(pageSize, pageNo) {

        gvwInfo.clearStatus();

        let YMDDATE1	= gfnma_nvl(SBUxMethod.get("SRCH_YMDDATE1"));
        let YMDDATE2	= gfnma_nvl(SBUxMethod.get("SRCH_YMDDATE2"));
        let srchChkgubun = SBUxMethod.get('SRCH_CHKGUBUN').SRCH_CHKGUBUN;
        var workType = 'Q';

        if(srchChkgubun) {
            workType = 'QQ';
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: '1000'
            ,V_P_CLIENT_CODE	: ''
            ,V_P_SITE_CODE      : ''
            ,V_P_DATE1      	: YMDDATE1
            ,V_P_DATE2	        : YMDDATE2
            ,V_P_FORM_ID		: ''
            ,V_P_MENU_ID		: ''
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
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonHriList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        GUBUN				: item.GUBUN,
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
                    gvwInfo.setColHidden(7, false, false);
                    gvwInfo.setColHidden(5, false, false);
                    gvwInfo.setColHidden(4, false, false);
                    gvwInfo.setColHidden(3, false, false);
                } else {
                    gvwInfo.setColHidden(7, true, false);
                    gvwInfo.setColHidden(5, true, false);
                    gvwInfo.setColHidden(4, true, false);
                    gvwInfo.setColHidden(3, true, false);
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

    const fn_clearForm = function() {
        SBUxMethod.set("SRCH_YMDDATE1", gfn_dateToYmd(new Date()));
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>