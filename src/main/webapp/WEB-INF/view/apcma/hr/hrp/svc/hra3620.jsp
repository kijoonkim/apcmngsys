<%
    /**
     * @Class Name 		: hra3620.jsp
     * @Description 	: 용역소득 등록 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.11.05
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.11.05   	이경한		최초 생성
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
    <title>title : 용역소득 등록</title>
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
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <table id="srchArea" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 1%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">사업장</th>
                    <td class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">귀속연월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_JOB_YYYYMM_FR"
                                name="SRCH_JOB_YYYYMM_FR"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_JOB_YYYYMM_TO"
                                name="SRCH_JOB_YYYYMM_TO"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <th scope="row" class="th_bg">소득자 성명</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EARNER_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        <sbux-input id="JUMIN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>용역비등록</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right; margin-right: 3px;"></sbux-button>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                        <div id="sb-area-gvwInfo" style="height:605px;"></div>
                    </div>
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
    var p_siteCode = "${loginVO.maSiteCode}";
    //-----------------------------------------------------------

    var jsonWorkGbn = []; // 작업구분
    var jsonWorkPlace = []; // 작업장소
    var jsonWorkName = []; // 작업명
    var jsonWorkDtlName = []; // 작업세부명
    var jsonWorkPlace2 = []; // 작업장소2
    var jsonForeignType = []; // 내외국인구분
    var jsonNationCode = []; // 거주지국
    var jsonWorkRegion = []; // 근무지역

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonServiceFeeList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 작업구분
            gfnma_setComSelect(['gvwInfo'], jsonWorkGbn, 'L_HRA081', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwInfo'], jsonWorkPlace, 'L_HRA083', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업명
            gfnma_setComSelect(['gvwInfo'], jsonWorkName, 'L_HRA082', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업세부명
            gfnma_setComSelect(['gvwInfo'], jsonWorkDtlName, 'L_HRA084', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwInfo'], jsonWorkPlace2, 'L_HRA085', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 내외국민구분
            gfnma_setComSelect(['gvwInfo'], jsonForeignType, 'L_HRA006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 거주지국
            gfnma_setComSelect(['gvwInfo'], jsonNationCode, 'L_COM015', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            // 근무지역
            gfnma_setComSelect(['gvwInfo'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonServiceFeeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["귀속연월"],       ref: 'JOB_YYYYMM', 		type:'inputdate',  	width:'67px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["근무시작일"],       ref: 'WORK_ST_DAT', 		type:'inputdate',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["소득자 성명"],         ref: 'EARNER_NAME',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["소득자 성명"], 						ref: 'EARNER_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findEarnerCode(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근무종료일"],       ref: 'WORK_END_DAT', 		type:'inputdate',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근로일수"],         ref: 'WORK_DAY',    type:'output',  	width:'69px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', emptyvalue:'0'}
            },
            {caption: ["인원수"],         ref: 'WORK_CNT',    type:'output',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', emptyvalue:'0'}
            },
            {caption: ["작업구분"], 		ref: 'WORK_GBN',   	    type:'combo', style:'text-align:left' ,width: '103px',
                typeinfo: {
                    ref			: 'jsonWorkGbn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업장소"], 		ref: 'WORK_PLACE',   	    type:'combo', style:'text-align:left' ,width: '91px',
                typeinfo: {
                    ref			: 'jsonWorkPlace',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업명"], 		ref: 'WORK_NAME',   	    type:'combo', style:'text-align:left' ,width: '138px',
                typeinfo: {
                    ref			: 'jsonWorkName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업세부명"], 		ref: 'WORK_DTL_NAME',   	    type:'combo', style:'text-align:left' ,width: '118px',
                typeinfo: {
                    ref			: 'jsonWorkDtlName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["작업장소2"], 		ref: 'WORK_PLACE2',   	    type:'combo', style:'text-align:left' ,width: '87px',
                typeinfo: {
                    ref			: 'jsonWorkPlace2',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["일당"],         ref: 'DAILY_PAY_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총지급액"],         ref: 'TOT_PAY_AMT',    type:'input',  	width:'103px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로급여"],         ref: 'WORK_PAY_AMT',    type:'input',  	width:'104px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["비과세소득"],         ref: 'NON_TXABLE_AMT',    type:'input',  	width:'110px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["소득공제"],         ref: 'INC_AMT',    type:'input',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로소득"],         ref: 'EARNED_INC_AMT',    type:'input',  	width:'89px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["소득세"],         ref: 'INC_TX_AMT',    type:'input',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["주민세"],         ref: 'LOCAL_TX_AMT',    type:'input',  	width:'101px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["건강보험"],         ref: 'HEALTH_INSURE_AMT',    type:'input',  	width:'112px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["장기요양보험"],         ref: 'LONG_HEALTH_INSURE_AMT',    type:'input',  	width:'105px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["국민연금"],         ref: 'NATIONAL_PENS_AMT',    type:'input',  	width:'100px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["고용보험"],         ref: 'EMPLOY_INSURE_AMT',    type:'input',  	width:'92px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["기타공제"],         ref: 'ETC_DED_AMT',    type:'input',  	width:'99px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총공제액"],         ref: 'TOT_DEDUCT_AMT',    type:'input',  	width:'102px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["차인지급액"],         ref: 'ALLOWANCE_AMT',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["분개장번호"],         ref: 'REMARK',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["비고"],         ref: 'MEMO',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["거주국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'input', style:'text-align:left' ,width: '90px'},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'input', style:'text-align:left' ,width: '200px'},
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        /*gvwInfo.bind('dblclick', 'fn_gvwListDblclick')*/
    }

    const fn_gvwListDblclick = async function() {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();
        var rowStatus = gvwList.getRowStatus(nRow);

        if((rowStatus == 1 || rowStatus == 3) && (nCol != 53 || nCol != 54)) {
            gvwList.editCell();
        }

        if(nCol == 53) {
            fn_findEarnerCode(nRow);
        }

        if(nCol == 54) {
            fn_findEarnerCode(nRow);
        }
    }

    const fn_findEarnerCode = function(row) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '소득자코드 조회');

        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRA060'
            ,popupType				: 'A'
            ,whereClause			: ''
            ,searchCaptions			: ["소득자코드", "소득자명"]
            ,searchInputFields		: ["CS_CODE", "CS_NAME"]
            ,searchInputValues		: ["", ""]
            ,searchInputTypes		: ["input", "input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", ""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명"]
            ,tableColumnNames		: ["CS_CODE", "CS_NAME"]
            ,tableColumnWidths		: ["80px", "160px"]
            ,itemSelectEvent		: function (data){
                gvwList.setCellData(row, gvwList.getColRef("EARNER_CODE"), data.CS_CODE);
                gvwList.setCellData(row, gvwList.getColRef("EARNER_NAME"), data.CS_NAME);
            },
        });

        SBUxMethod.openModal('modal-compopup1');
    }

    // 행 추가
    const fn_addRow = function () {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired("panHeader")) {
            return false;
        }

        let rowVal = gvwInfo.getRow();
        let JOB_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_JOB_YYYYMM_FR"));
        let DECLARATION_YYYYMM = gfn_addMonth(JOB_YYYYMM, 1).substring(0, 6);

        if (rowVal == -1){
            gvwInfo.addRow(true, {
                JOB_YYYYMM : JOB_YYYYMM,
                DECLARATION_YYYYMM : DECLARATION_YYYYMM,
                FOREI_TYPE : "1",
                NATION_CODE : "KR",
                PAY_DATE : gfn_dateToYmd(new Date()),
            });
        }else{
            gvwInfo.insertRow(rowVal, 'below', {
                JOB_YYYYMM : JOB_YYYYMM,
                DECLARATION_YYYYMM : DECLARATION_YYYYMM,
                FOREI_TYPE : "1",
                NATION_CODE : "KR",
                PAY_DATE : gfn_dateToYmd(new Date()),
            });
        }
    }

    // 행 삭제
    const fn_delRow = async function () {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired("panHeader")) {
            return false;
        }

        var nRow 		= gvwInfo.getRow();
        var rowData 	= gvwInfo.getRowData(nRow);

        if (nRow == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwInfo.deleteRow(nRow);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_JOB_YYYYMM : rowData.JOB_YYYYMM,
            V_P_SOCNO : rowData.EARNER_CODE,
            V_P_WORK_ST_DAT : "",
            V_P_EARNER_NAME : "",
            V_P_SITE_CODE : "",
            V_P_PAY_DATE : "",
            V_P_WORK_END_DAT : "",
            V_P_WORK_DAY : "",
            V_P_DECLARATION_YYYYMM : "",
            V_P_BANK_CODE : "",
            V_P_BANK_ACC : "",
            V_P_DAILY_PAY_AMT : "",
            V_P_TOT_PAY_AMT : "",
            V_P_WORK_PAY_AMT : "",
            V_P_NON_TXABLE_AMT : "",
            V_P_INC_AMT : "",
            V_P_EARNED_INC_AMT : "",
            V_P_INC_TX_AMT : "",
            V_P_LOCAL_TX_AMT : "",
            V_P_HEALTH_INSURE_AMT : "",
            V_P_LONG_HEALTH_INSURE_AMT : "",
            V_P_NATIONAL_PENS_AMT : "",
            V_P_EMPLOY_INSURE_AMT : "",
            V_P_ETC_DED_AMT : "",
            V_P_TOT_DEDUCT_AMT : "",
            V_P_ALLOWANCE_AMT : "",
            V_P_MEMO : "",
            V_P_REMARK : "",
            V_P_FOREI_TYPE : "",
            V_P_NATION_CODE : "",
            V_P_TEL : "",
            V_P_ADDRESS : "",
            V_P_WORK_REGION : "",
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3610.do", {
            getType				: 'json',
            workType			: 'D',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                await fn_search();
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

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        await fn_onload();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

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

    // 신규
    function cfn_add() {
        fn_create();
    }

    const fn_onload = async function() {
        SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
        SBUxMethod.set("SRCH_JOB_YYYYMM_FR", gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_JOB_YYYYMM_TO", gfn_dateToYm(new Date()));
    }

    const fn_save = async function () {
        let strStatus = "";
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            if (gfn_nvl(SBUxMethod.get("CHK")) == "")
                strStatus = "N";
            else
                strStatus = "U";
        } else if(enableTab == "tpgNonresident") {
            if (gfn_nvl(SBUxMethod.get("EARNER_CODE1")) == "")
                strStatus = "N";
            else
                strStatus = "U";
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_EARNER_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_CODE")) : gfn_nvl(SBUxMethod.get("EARNER_CODE1")),
            V_P_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_CODE")) : gfn_nvl(SBUxMethod.get("SITE_CODE1")),
            V_P_EARNER_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_NAME1")) : gfn_nvl(SBUxMethod.get("EARNER_NAME3")),
            V_P_SOCNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SOCIAL_NO1")) : gfn_nvl(SBUxMethod.get("SOCIAL_NO3")),
            V_P_BIZ_REGNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BIZ_REGNO1")) : "",
            V_P_COMP_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("COMP_NAME")) : "",
            V_P_NATION_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("NATION_CODE")) : gfn_nvl(SBUxMethod.get("NATION_CODE1")),
            V_P_FOREI_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE1')),
            V_P_RESIDE_TYPE : enableTab == "tpgResident" ? "1" : "2",
            V_P_SITE_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ZIP_CODE")) : "",
            V_P_SITE_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ADDRESS")) : "",
            V_P_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ZIP_CODE")) : "",
            V_P_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ADDRESS")) : gfn_nvl(SBUxMethod.get("ADDRESS1")),
            V_P_INC_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE1')),
            V_P_INC_SEC : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC1')),
            V_P_WORK_REGION : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#WORK_REGION')) : gfn_nvl(gfnma_multiSelectGet('#WORK_REGION1')),
            V_P_BUSINESS_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE1')) : gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE')),
            V_P_BANK_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_CODE")) : gfn_nvl(SBUxMethod.get("BANK_CODE1")),
            V_P_BANK_ACC : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_ACCOUNT")) : gfn_nvl(SBUxMethod.get("BANK_ACCOUNT1")),
            V_P_TEL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TEL")) : gfn_nvl(SBUxMethod.get("TEL1")),
            V_P_BIRTHDAY : enableTab == "tpgResident" ? "" : gfn_nvl(SBUxMethod.get("BIRTHDAY")),
            V_P_MOBILE_PHONE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MOBILE_PHONE")) : "",
            V_P_EMAIL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EMAIL")) : "",
            V_P_PAY_CYCLE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#PAY_CYCLE')) : "",
            V_P_MEMO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MEMO")) : gfn_nvl(SBUxMethod.get("MEMO1")),
            V_P_TAX_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TAX_SITE_CODE1")) : gfn_nvl(SBUxMethod.get("TAX_SITE_CODE2")),
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3610.do", {
            getType				: 'json',
            workType			: strStatus,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(enableTab == "tpgResident") {
                    let strFocus = gfn_nvl(SBUxMethod.get("EARNER_CODE"));
                    if(strStatus == "N") {
                        strFocus = data.v_returnStr;
                        SBUxMethod.set("EARNER_CODE", data.v_returnStr);
                    }

                    await fn_search();

                    gvwResident.clickRow(jsonResidentList.findIndex(item => item.EARNER_CODE == strFocus) + 1)
                } else if(enableTab == "tpgNonresident") {
                    let strFocus = gfn_nvl(SBUxMethod.get("EARNER_CODE1"));
                    if(strStatus == "N") {
                        strFocus = data.v_returnStr;
                        SBUxMethod.set("EARNER_CODE1", data.v_returnStr);
                    }

                    await fn_search();
                    gvwNonresident.clickRow(jsonNonResidentList.findIndex(item => item.EARNER_CODE == strFocus) + 1);
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

    const fn_delete = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));
        let strMessage = "";

        if(enableTab == "tpgResident") {
            strMessage = gfn_nvl(SBUxMethod.get("EARNER_CODE1")) + " 정보를 삭제하시겠습니까?";
        } else if(enableTab == "tpgNonresident") {
            strMessage = gfn_nvl(SBUxMethod.get("EARNER_CODE3")) + " 정보를 삭제하시겠습니까?";
        }

        if (gfn_comConfirm("Q0000", strMessage)) {
            let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                IV_P_EARNER_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_CODE")) : gfn_nvl(SBUxMethod.get("EARNER_CODE1")),
                V_P_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_CODE")) : gfn_nvl(SBUxMethod.get("SITE_CODE1")),
                V_P_EARNER_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_NAME1")) : gfn_nvl(SBUxMethod.get("EARNER_NAME3")),
                V_P_SOCNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SOCIAL_NO1")) : gfn_nvl(SBUxMethod.get("SOCIAL_NO3")),
                V_P_BIZ_REGNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BIZ_REGNO1")) : "",
                V_P_COMP_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("COMP_NAME")) : "",
                V_P_NATION_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("NATION_CODE")) : gfn_nvl(SBUxMethod.get("NATION_CODE1")),
                V_P_FOREI_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE1')),
                V_P_RESIDE_TYPE : enableTab == "tpgResident" ? "1" : "2",
                V_P_SITE_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ZIP_CODE")) : "",
                V_P_SITE_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ADDRESS")) : "",
                V_P_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ZIP_CODE")) : "",
                V_P_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ADDRESS")) : gfn_nvl(SBUxMethod.get("ADDRESS1")),
                V_P_INC_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE1')),
                V_P_INC_SEC : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC1')),
                V_P_WORK_REGION : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#WORK_REGION')) : gfn_nvl(gfnma_multiSelectGet('#WORK_REGION1')),
                V_P_BUSINESS_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE1')) : gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE')),
                V_P_BANK_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_CODE")) : gfn_nvl(SBUxMethod.get("BANK_CODE1")),
                V_P_BANK_ACC : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_ACCOUNT")) : gfn_nvl(SBUxMethod.get("BANK_ACCOUNT1")),
                V_P_TEL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TEL")) : gfn_nvl(SBUxMethod.get("TEL1")),
                V_P_BIRTHDAY : enableTab == "tpgResident" ? "" : gfn_nvl(SBUxMethod.get("BIRTHDAY")),
                V_P_MOBILE_PHONE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MOBILE_PHONE")) : "",
                V_P_EMAIL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EMAIL")) : "",
                V_P_PAY_CYCLE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#PAY_CYCLE')) : "",
                V_P_MEMO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MEMO")) : gfn_nvl(SBUxMethod.get("MEMO1")),
                V_P_TAX_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TAX_SITE_CODE1")) : gfn_nvl(SBUxMethod.get("TAX_SITE_CODE2")),
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3610.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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

    const fn_search = async function () {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired("panHeader")) {
            return false;
        }

        let JOB_YYYYMM_FR = gfn_nvl(SBUxMethod.get("SRCH_JOB_YYYYMM_FR"));
        let JOB_YYYYMM_TO = gfn_nvl(SBUxMethod.get("SRCH_JOB_YYYYMM_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet("SRCH_SITE_CODE"));
        let EARNER_NAME = gfn_nvl(SBUxMethod.get("SRCH_EARNER_NAME"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_JOB_YYYYMM_FR : JOB_YYYYMM_FR,
            V_P_JOB_YYYYMM_TO : JOB_YYYYMM_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_EARNER_NAME : EARNER_NAME,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3620List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonServiceFeeList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        TXN_ID : item.TXN_ID,
                        JOB_YYYYMM : item.JOB_YYYYMM,
                        SOCNO : item.SOCNO,
                        WORK_ST_DAT : item.WORK_ST_DAT,
                        EARNER_CODE : item.EARNER_CODE,
                        EARNER_NAME : item.EARNER_NAME,
                        SITE_CODE : item.SITE_CODE,
                        PAY_DATE : item.PAY_DATE,
                        WORK_END_DAT : item.WORK_END_DAT,
                        WORK_DAY : item.WORK_DAY,
                        WORK_CNT : item.WORK_CNT,
                        WORK_GBN : item.WORK_GBN,
                        WORK_NAME : item.WORK_NAME,
                        WORK_PLACE : item.WORK_PLACE,
                        WORK_DTL_NAME : item.WORK_DTL_NAME,
                        WORK_PLACE2 : item.WORK_PLACE2,
                        BANK_CODE : item.BANK_CODE,
                        BANK_NAME : item.BANK_NAME,
                        BANK_ACC : item.BANK_ACC,
                        DAILY_PAY_AMT : item.DAILY_PAY_AMT,
                        TOT_PAY_AMT : item.TOT_PAY_AMT,
                        WORK_PAY_AMT : item.WORK_PAY_AMT,
                        NON_TXABLE_AMT : item.NON_TXABLE_AMT,
                        INC_AMT : item.INC_AMT,
                        EARNED_INC_AMT : item.EARNED_INC_AMT,
                        INC_TX_AMT : item.INC_TX_AMT,
                        LOCAL_TX_AMT : item.LOCAL_TX_AMT,
                        HEALTH_INSURE_AMT : item.HEALTH_INSURE_AMT,
                        LONG_HEALTH_INSURE_AMT : item.LONG_HEALTH_INSURE_AMT,
                        NATIONAL_PENS_AMT : item.NATIONAL_PENS_AMT,
                        EMPLOY_INSURE_AMT : item.EMPLOY_INSURE_AMT,
                        ETC_DED_AMT : item.ETC_DED_AMT,
                        TOT_DEDUCT_AMT : item.TOT_DEDUCT_AMT,
                        ALLOWANCE_AMT : item.ALLOWANCE_AMT,
                        MEMO : item.MEMO,
                        REMARK : item.REMARK,
                        FOREI_TYPE : item.FOREI_TYPE,
                        NATION_CODE : item.NATION_CODE,
                        TEL : item.TEL,
                        MOBILE_PHONE : item.MOBILE_PHONE,
                        EMAIL : item.EMAIL,
                        ADDRESS : item.ADDRESS,
                        WORK_REGION : item.WORK_REGION,
                    }
                    jsonServiceFeeList.push(msg);
                });
                gvwInfo.rebuild();
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

    const fn_create = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            gfnma_uxDataClear('#panResidentInfo');

            gfnma_multiSelectSet('#FOREIGN_TYPE', 'SUB_CODE', 'CODE_NAME', "1");
            SBUxMethod.attr("EARNER_CODE", "readonly", false);
            $("#SITE_CODE").focus();
        } else if(enableTab == "tpgNonresident") {
            gfnma_uxDataClear('#grpNonresidentInfo');

            gfnma_multiSelectSet('#FOREIGN_TYPE1', 'SUB_CODE', 'CODE_NAME', "1");
            $("#SITE_CODE").focus();
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>