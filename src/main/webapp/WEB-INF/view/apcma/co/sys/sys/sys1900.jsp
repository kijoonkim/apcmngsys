<%
    /**
     * @Class Name        : sys1900.jsp
     * @Description       : 접속이력 조회 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.10.24
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.10.24   	표주완		최초 생성
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
    <title>title : 접속이력 조회 정보</title>
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
                </h3><!-- 접속이력 조회 -->
            </div>
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
                <col style="width: 1%">
                <col style="width: 6%">
                <col style="width: 2%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">조회구분</th>
                <td class="td_input">
                    <sbux-radio id="NOW" name="SRCH_QUERY_TYPE" uitype="normal"
                                text="현재접속자" value="NOW" checked>
                    </sbux-radio>
                    <sbux-radio id="ALL" name="SRCH_QUERY_TYPE" uitype="normal"
                                text="전체" value="ALL">
                    </sbux-radio>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">접속일자</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_LOG_DATE_FR"
                            name="SRCH_LOG_DATE_FR"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast">
                    </sbux-datepicker>
                </td>
                <th>~</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_LOG_DATE_TO"
                            name="SRCH_LOG_DATE_TO"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast">
                    </sbux-datepicker>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">로그유형</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_LOG_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="SRCH_LOG_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">사용자ID</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="SRCH_USER_ID"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>접속이력</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-grwInfo" style="height:800px; width:100%;"></div>
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

    //grid 초기화
    var gvwInfoGrid; 			    // 그리드를 담기위한 객체 선언      ( 접속이력 리스트 )
    var jsonGvwInfoList = []; 	    // 그리드의 참조 데이터 주소 선언   ( 접속이력 리스트 )

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            //gfnma_setComSelect([''], jsonNumberElement1, 'L_SYS002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //로그유형
            gfnma_multiSelectInit({
                target			: ['#SRCH_LOG_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_SYS010'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
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
    }

   /* // 신규
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
    }*/

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
        SBGridProperties.filtering = true;
        SBGridProperties.columns = [
            {caption: ["사용자ID"], ref: 'USER_ID', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["사용자명"], ref: 'USER_NAME', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["화면ID"], ref: 'FORM_ID', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["화면명"], ref: 'FORM_NAME', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["로그인시각"], ref: 'LOGIN_TIME', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["로그아웃시각"], ref: 'LOGOUT_TIME', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["접속IP"], ref: 'LOG_IP', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["접속PC"], ref: 'LOG_PC', type: 'output', width: '150px', style: 'text-align:left'},
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let V_P_NUMBERING_GROUP = gfnma_nvl(SBUxMethod.get("srch-numbering_group"));
        let V_P_NUMBERING_ID = gfnma_nvl(SBUxMethod.get("search_numbering_id"));
        let V_P_NUMBERING_NAME = gfnma_nvl(SBUxMethod.get("search_numbering_name"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_NUMBERING_GROUP: V_P_NUMBERING_GROUP
            , V_P_NUMBERING_ID: V_P_NUMBERING_ID
            , V_P_NUMBERING_NAME: V_P_NUMBERING_NAME

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
                        NUMBERING_ID: item.NUMBERING_ID,
                        NUMBERING_GROUP: item.NUMBERING_GROUP,
                        USE_YN: item.USE_YN,
                        NUMBERING_NAME: item.NUMBERING_NAME,
                        NUMBER_LENGTH: item.NUMBER_LENGTH,
                        DESCR: item.DESCR,
                        AUTO_NUM_YN: item.AUTO_NUM_YN,
                        NUMBER_ELEMENT1: item.NUMBER_ELEMENT1,
                        NUMBER_VALUE1: item.NUMBER_VALUE1,
                        SURFIX_ELEMENT1: item.SURFIX_ELEMENT1,
                        SURFIX_VALUE1: item.SURFIX_VALUE1,
                        NUMBER_ELEMENT2: item.NUMBER_ELEMENT2,
                        NUMBER_VALUE2: item.NUMBER_VALUE2,
                        SURFIX_ELEMENT2: item.SURFIX_ELEMENT2,
                        SURFIX_VALUE2: item.SURFIX_VALUE2,
                        NUMBER_ELEMENT3: item.NUMBER_ELEMENT3,
                        NUMBER_VALUE3: item.NUMBER_VALUE3,
                        SURFIX_ELEMENT3: item.SURFIX_ELEMENT3,
                        SURFIX_VALUE3: item.SURFIX_VALUE3,
                        NUMBER_ELEMENT4: item.NUMBER_ELEMENT4,
                        NUMBER_VALUE4: item.NUMBER_VALUE4,
                        SURFIX_ELEMENT4: item.SURFIX_ELEMENT4,
                        SURFIX_VALUE4: item.SURFIX_VALUE4,
                        NUMBER_ELEMENT5: item.NUMBER_ELEMENT5,
                        NUMBER_VALUE5: item.NUMBER_VALUE5,
                        SURFIX_ELEMENT5: item.SURFIX_ELEMENT5,
                        START_SERNO: item.START_SERNO,
                        UNIQUE_YN: item.UNIQUE_YN,
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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
