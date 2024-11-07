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
                            date-format="yyyy-mm-dd"
                            class="form-control input-sm input-sm-ast">
                    </sbux-datepicker>
                </td>
                <th>~</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_LOG_DATE_TO"
                            name="SRCH_LOG_DATE_TO"
                            uitype="popup"
                            date-format="yyyy-mm-dd"
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
            </tr>
            <tr>
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

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('SRCH_LOG_DATE_FR', openDate);
        SBUxMethod.set('SRCH_LOG_DATE_TO', openDate);

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
        //SBGridProperties.filtering = true;
        SBGridProperties.columns = [
            {caption: ["사용자ID"], ref: 'USER_ID', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사용자명"], ref: 'USER_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["화면ID"], ref: 'FORM_ID', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["화면명"], ref: 'FORM_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["로그인시각"], ref: 'LOGIN_TIME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["로그아웃시각"], ref: 'LOGOUT_TIME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["접속IP"], ref: 'LOG_IP', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["접속PC"], ref: 'LOG_PC', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let QUERY_TYPE      = gfn_nvl(SBUxMethod.get("SRCH_QUERY_TYPE")); //조회구분
        let LOG_DATE_FR     = gfn_nvl(SBUxMethod.get("SRCH_LOG_DATE_FR")); //접속일자 (시작)
        let LOG_DATE_TO     = gfn_nvl(SBUxMethod.get("SRCH_LOG_DATE_TO")); //접속일자 (종료)
        let LOG_TYPE        = gfnma_multiSelectGet('#SRCH_LOG_TYPE'); //로그유형
        let USER_ID         = gfn_nvl(SBUxMethod.get("SRCH_USER_ID")); //사용자ID

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_LOG_DATE_FR     : LOG_DATE_FR
            ,V_P_LOG_DATE_TO     : LOG_DATE_TO
            ,V_P_LOG_TYPE        : LOG_TYPE
            ,V_P_USERID_P        : USER_ID

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/sys/selectSys1900List.do", {
            getType: 'json',
            workType: QUERY_TYPE,
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                if (_.isEmpty(data.cv_1) == false){
                    jsonGvwInfoList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            KEY_FIELD           : gfn_nvl(item.KEY_FIELD),
                            PARENT_KEY_FIELD    : gfn_nvl(item.PARENT_KEY_FIELD),
                            USER_ID             : gfn_nvl(item.USER_ID),
                            USER_NAME           : gfn_nvl(item.USER_NAME),
                            LOG_TYPE            : gfn_nvl(item.LOG_TYPE),
                            MEMO                : gfn_nvl(item.MEMO),
                            LOGIN_TIME          : gfn_nvl(item.LOGIN_TIME),
                            LOGOUT_TIME         : gfn_nvl(item.LOGOUT_TIME),
                            FORM_ID             : gfn_nvl(item.FORM_ID),
                            FORM_NAME           : gfn_nvl(item.FORM_NAME),
                            LOG_DATE            : gfn_nvl(item.LOG_DATE),
                            LOG_IP              : gfn_nvl(item.LOG_IP),
                            LOG_PC              : gfn_nvl(item.LOG_PC),
                            COMP_CODE           : gfn_nvl(item.COMP_CODE),
                            CLIENT_CODE         : gfn_nvl(item.CLIENT_CODE),
                        }
                        jsonGvwInfoList.push(msg);
                        totalRecordCount++;
                    });

                    gvwInfoGrid.rebuild();
                    document.querySelector('#listCount').innerText = totalRecordCount;
                }

                if (_.isEmpty(data.cv_2) == false){
                    jsonGvwInfoList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            KEY_FIELD           : gfn_nvl(item.KEY_FIELD),
                            PARENT_KEY_FIELD    : gfn_nvl(item.PARENT_KEY_FIELD),
                            USER_ID             : gfn_nvl(item.USER_ID),
                            USER_NAME           : gfn_nvl(item.USER_NAME),
                            LOG_TYPE            : gfn_nvl(item.LOG_TYPE),
                            MEMO                : gfn_nvl(item.MEMO),
                            LOGIN_TIME          : gfn_nvl(item.LOGIN_TIME),
                            LOGOUT_TIME         : gfn_nvl(item.LOGOUT_TIME),
                            FORM_ID             : gfn_nvl(item.FORM_ID),
                            FORM_NAME           : gfn_nvl(item.FORM_NAME),
                            LOG_DATE            : gfn_nvl(item.LOG_DATE),
                            LOG_IP              : gfn_nvl(item.LOG_IP),
                            LOG_PC              : gfn_nvl(item.LOG_PC),
                            COMP_CODE           : gfn_nvl(item.COMP_CODE),
                            CLIENT_CODE         : gfn_nvl(item.CLIENT_CODE),
                        }
                        jsonGvwInfoList.push(msg);
                        totalRecordCount++;
                    });

                    gvwInfoGrid.rebuild();
                    document.querySelector('#listCount').innerText = totalRecordCount;
                }

                /*if(jsonGvwInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
                }*/

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
