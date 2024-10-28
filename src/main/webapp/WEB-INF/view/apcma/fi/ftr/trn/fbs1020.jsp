<%
    /**
     * @Class Name 		: fbs1020.jsp
     * @Description 	: 전문관리 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	이경한		최초 생성
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
    <title>title : 전문관리</title>
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

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="panHeader" class="table table-bordered tbl_fixed">
                <caption>지급프로그램</caption>
                <colgroup>
                    <col style="width: 15%">
                    <col style="width: 15%">
                    <col style="width: 15%">
                    <col style="width: 15%">
                    <col style="width: 15%">
                    <col style="width: 15%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">서비스</th>
                    <td class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FBS_SERVICE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FBS_SERVICE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">거래유형</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_TXN_TYPE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">거래유형명</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_TXN_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>펌뱅킹전문조회</span>
                        </li>
                    </ul>
                    <div style="margin-left: auto;">
                        <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwDetail" style="height:560px;"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwDetail;

    var jsonFirmBankingElecDocuList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // FBS서비스
            gfnma_multiSelectInit({
                target: ['#SRCH_FBS_SERVICE'],
                compCode: gv_ma_selectedApcCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_FBS019',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'SUB_CODE',
                colLabel: 'CODE_NAME',
                columns: [
                    {caption: "코드",	ref: 'SUB_CODE', width: '70px', style: 'text-align:left' },
                    {caption: "명",		ref: 'CODE_NAME', width: '100px',style: 'text-align:left' },
                ]
            }),
        ]);
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonFirmBankingElecDocuList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';

        SBGridProperties.columns = [
            {caption: ["펌뱅킹서비스"],         ref: 'FBS_SERVICE',    type:'input',  	width:'93px',  style:'text-align:left'},
            {caption: ["거래유형"],         ref: 'FBS_TXN_TYPE',    type:'input',  	width:'84px',  style:'text-align:left'},
            {caption: ["거래유형명"],         ref: 'FBS_TXN_NAME',    type:'input',  	width:'117px',  style:'text-align:left'},
            {caption: ["라인번호"],         ref: 'FBS_DATA_NO',    type:'input',  	width:'63px',  style:'text-align:left'},
            {caption: ["전문항목"],         ref: 'DATA_CODE',    type:'input',  	width:'98px',  style:'text-align:left'},
            {caption: ["길이"],         ref: 'DATA_LENGTH',    type:'input',  	width:'64px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number'}
            },
            {caption: ["변환길이"],         ref: 'CONV_LENGTH',    type:'input',  	width:'129px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number'}
            },
            {caption: ["전문코드"],         ref: 'ELE_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["업무코드"],         ref: 'WORK_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["데이터타입"],         ref: 'DATA_TYPE',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["은행필수"],         ref: 'BANK_REQUIRED_YN',    type:'input',  	width:'88px',  style:'text-align:left',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
            },
            {caption: ["고객필수"],         ref: 'CUSTOMER_REQUIRED_YN',    type:'input',  	width:'76px',  style:'text-align:left',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
            },
            {caption: ["적요"],         ref: 'DESCR',    type:'input',  	width:'201px',  style:'text-align:left'},
            {caption: ["옵션"],         ref: 'OPTIONAL_YN',    type:'input',  	width:'69px',  style:'text-align:left',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
            },
            {caption: ["칼럼명"],         ref: 'COLUMN_NAME',    type:'input',  	width:'104px',  style:'text-align:left'},
            {caption: ["초기값"],         ref: 'DEFAULT_VALUE',    type:'input',  	width:'99px',  style:'text-align:left'},
            {caption: ["한글"],         ref: 'HANGUL_YN',    type:'input',  	width:'75px',  style:'text-align:left',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
            },
            {caption: ["채움방향"],         ref: 'PAD_TYPE',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["값채움"],         ref: 'FILL_VALUE',    type:'input',  	width:'75px',  style:'text-align:left'},
            {caption: ["소수점자리"],         ref: 'DECIMAL_POINT',    type:'input',  	width:'75px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number'}
            },
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    // 행 추가
    const fn_addRow = function () {
        gvwDetail.addRow(true, '', true);
    }

    // 행 삭제
    const fn_delRow = async function () {

        let rowVal = gvwDetail.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwDetail.deleteRow(rowVal);
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwDetailGrid();
    });

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_search = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        // 비즈니스 로직 정보
        let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE'));
        let V_P_TXN_TYPE = gfn_nvl(SBUxMethod.get("SRCH_TXN_TYPE"));
        let V_P_TXN_NAME = gfn_nvl(SBUxMethod.get("SRCH_TXN_NAME"));

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FBS_SERVICE : FBS_SERVICE,
            V_P_TXN_TYPE : V_P_TXN_TYPE,
            V_P_TXN_NAME : V_P_TXN_NAME,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trn/selectFbs1020List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonFirmBankingElecDocuList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        SERVICE_TYPE : item.SERVICE_TYPE,
                        FBS_SERVICE : item.FBS_SERVICE,
                        FBS_TXN_TYPE : item.FBS_TXN_TYPE,
                        ELE_CODE : item.ELE_CODE,
                        ELE_NAME : item.ELE_NAME,
                        WORK_CODE : item.WORK_CODE,
                        WORK_NAME : item.WORK_NAME,
                        FBS_TXN_NAME : item.FBS_TXN_NAME,
                        FBS_DATA_NO : item.FBS_DATA_NO,
                        DATA_CODE : item.DATA_CODE,
                        DATA_LENGTH : item.DATA_LENGTH,
                        CONV_LENGTH : item.CONV_LENGTH,
                        DATA_TYPE : item.DATA_TYPE,
                        BANK_REQUIRED_YN : item.BANK_REQUIRED_YN,
                        CUSTOMER_REQUIRED_YN : item.CUSTOMER_REQUIRED_YN,
                        DESCR : item.DESCR,
                        OPTIONAL_YN : item.OPTIONAL_YN,
                        COLUMN_NAME : item.COLUMN_NAME,
                        DEFAULT_VALUE : item.DEFAULT_VALUE,
                        HANGUL_YN : item.HANGUL_YN,
                        PAD_TYPE : item.PAD_TYPE,
                        FILL_VALUE : item.FILL_VALUE,
                        DECIMAL_POINT : item.DECIMAL_POINT,
                        INSERT_USERID : item.INSERT_USERID,
                        INSERT_TIME : item.INSERT_TIME,
                        INSERT_PC : item.INSERT_PC,
                        UPDATE_USERID : item.UPDATE_USERID,
                        UPDATE_TIME : item.UPDATE_TIME,
                        UPDATE_PC : item.UPDATE_PC,
                    }
                    jsonFirmBankingElecDocuList.push(msg);
                });
                gvwDetail.rebuild();
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

    const fn_save = async function () {
        let updatedGvwDetailData = gvwDetail.getUpdateData(true, 'all');
        let listData = [];

        updatedGvwDetailData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID : '',
                    V_P_FBS_TXN_TYPE : gfn_nvl(item.data.FBS_TXN_TYPE),
                    V_P_FBS_DATA_NO : parseInt(gfn_nvl(item.data.FBS_DATA_NO)),
                    V_P_DATA_CODE : gfn_nvl(item.data.DATA_CODE),
                    V_P_DATA_LENGTH : gfn_nvl(item.data.DATA_LENGTH) == "" ? 0 : parseInt(gfn_nvl(item.data.DATA_LENGTH)),
                    V_P_CONV_LENGTH : gfn_nvl(item.data.CONV_LENGTH) == "" ? 0 : parseInt(gfn_nvl(item.data.CONV_LENGTH)),
                    V_P_DATA_TYPE : gfn_nvl(item.data.DATA_TYPE),
                    V_P_BANK_REQUIRED_YN : gfn_nvl(item.data.BANK_REQUIRED_YN),
                    V_P_CUSTOMER_REQUIRED_YN : gfn_nvl(item.data.CUSTOMER_REQUIRED_YN),
                    V_P_DESCR : gfn_nvl(item.data.DESCR),
                    V_P_OPTIONAL_YN : gfn_nvl(item.data.OPTIONAL_YN),
                    V_P_COLUMN_NAME : gfn_nvl(item.data.COLUMN_NAME),
                    V_P_DEFAULT_VALUE : gfn_nvl(item.data.DEFAULT_VALUE),
                    V_P_HANGUL_YN : gfn_nvl(item.data.HANGUL_YN),
                    V_P_PAD_TYPE : gfn_nvl(item.data.PAD_TYPE),
                    V_P_FILL_VALUE : gfn_nvl(item.data.FILL_VALUE),
                    V_P_DECIMAL_POINT : gfn_nvl(item.data.DECIMAL_POINT) == "" ? 0 : parseInt(gfn_nvl(item.data.DECIMAL_POINT)),
                    V_P_FORM_ID              : p_formId,
                    V_P_MENU_ID              : p_menuId,
                    V_P_PROC_ID              : '',
                    V_P_USERID               : p_userId,
                    V_P_PC                   : '',
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/ftr/trn/insertFbs1020List.do", {listData: listData});
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    fn_search();
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>