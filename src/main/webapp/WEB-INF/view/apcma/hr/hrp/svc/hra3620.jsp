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
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <script src="/js/exceljs.min.js"></script>
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
                    <th scope="row" class="th_bg_search">사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">귀속연월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_JOB_YYYYMM_FR"
                                name="SRCH_JOB_YYYYMM_FR"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
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
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">소득자 성명</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EARNER_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        <sbux-input id="JUMIN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>용역비등록</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btnUploadExcel" name="btnUploadExcel" uitype="normal" text="엑셀업로드" class="btn btn-sm btn-outline-danger" onclick="$('#excelFile').click()" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnDownloadExcelForm" name="btnDownloadExcelForm" uitype="normal" text="엑셀 서식 다운로드" class="btn btn-sm btn-outline-danger" onclick="fn_downloadExcelForm" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnDownloadExcel" name="btnDownloadExcel" uitype="normal" text="엑셀 다운로드" class="btn btn-sm btn-outline-danger" onclick="fn_downloadExcel" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger"  style="float: right; margin-right: 3px;" onclick="fn_cancel"></sbux-button>
                            <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger"  style="float: right; margin-right: 3px;" onclick="fn_confirm"></sbux-button>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                        <div id="sb-area-gvwInfo" style="height:580px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="file" name="file" id="excelFile" accept=".xls,.xlsx" style="display: none;">
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
    var jsonEarnerCode = []; // 소득자코드

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonServiceFeeList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CD'
                ,colLabel		: 'SITE_NM'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 작업구분
            gfnma_setComSelect(['gvwInfo'], jsonWorkGbn, 'L_HRA081', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwInfo'], jsonWorkPlace, 'L_HRA083', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업명
            gfnma_setComSelect(['gvwInfo'], jsonWorkName, 'L_HRA082', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업세부명
            gfnma_setComSelect(['gvwInfo'], jsonWorkDtlName, 'L_HRA084', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwInfo'], jsonWorkPlace2, 'L_HRA085', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 내외국민구분
            gfnma_setComSelect(['gvwInfo'], jsonForeignType, 'L_HRA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 거주지국
            gfnma_setComSelect(['gvwInfo'], jsonNationCode, 'L_COM015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'NTN_CD', 'NTN_NM', 'Y', ''),
            // 근무지역
            gfnma_setComSelect(['gvwInfo'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 소득자코드
            gfnma_setComSelect([''], jsonEarnerCode, 'P_HRA021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'EARNR_CD', 'EARNR_NM', 'Y', ''),
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
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting	= true;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["확정여부"], 		ref: 'CONFIRM_YN',   	    type:'checkbox', style:'text-align:center' ,width: '60px'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["주민등록번호"],         ref: 'SOCNO',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["사업장코드"],         ref: 'SITE_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["은행코드"],         ref: 'BANK_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["계좌번호"],         ref: 'BANK_ACC',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'input', style:'text-align:left' ,width: '90px', hidden: true},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'input', style:'text-align:left' ,width: '200px', hidden: true},
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["거주국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , hidden: true
            },
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["소득자 성명"],         ref: 'EARNER_NAME',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["소득자 성명"], 						ref: 'EARNER_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findEarnerCode(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["귀속연월"],       ref: 'JOB_YYYYMM', 		type:'inputdate',  	width:'67px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm', calendartype: 'yearmonth'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["근무시작일"],       ref: 'WORK_ST_DAT', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근무종료일"],       ref: 'WORK_END_DAT', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근로일수"],         ref: 'WORK_DAY',    type:'output',  	width:'69px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', emptyvalue:'0'}
            },
            {caption: ["인원수"],         ref: 'WORK_CNT',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["일당"],         ref: 'DAILY_PAY_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["조정금액"],         ref: 'ADJUSTMENT_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["유류금액"],         ref: 'FUAL_AMT',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["기타비용"],         ref: 'ETC_COST',    type:'input',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 금액"],         ref: 'TOT_AMOUNT',    type:'output',  	width:'60px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
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
            {caption: ["지급일자"],       ref: 'PAY_DATE', 		type:'inputdate',  	width:'85px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["비과세소득"],         ref: 'NON_TXABLE_AMT',    type:'input',  	width:'110px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로소득공제"],         ref: 'INC_AMT',    type:'input',  	width:'97px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["근로소득금액"],         ref: 'EARNED_INC_AMT',    type:'output',  	width:'89px',  style:'text-align:right',
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
            {caption: ["총 공제액"],         ref: 'TOT_DEDUCT_AMT',    type:'output',  	width:'102px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["총 지급액"],         ref: 'TOT_PAY_AMT',    type:'output',  	width:'103px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["분개장번호"],         ref: 'REMARK',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["비고"],         ref: 'MEMO',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('valuechanged','fn_gvwInfoValueChanged');
        /*gvwInfo.bind('dblclick', 'fn_gvwListDblclick')*/
    }

    const fn_gvwInfoValueChanged = async function() {
        var nRow = gvwInfo.getRow();
        var nCol = gvwInfo.getCol();
        var rowData = gvwInfo.getRowData(nRow);

        if (nCol == gvwInfo.getColRef('WORK_ST_DAT') || nCol == gvwInfo.getColRef('WORK_END_DAT')) {
            if (rowData.WORK_ST_DAT == "" || rowData.WORK_END_DAT == "") return;

            let istart_date = new Date(rowData.WORK_ST_DAT.substring(0, 4) + "-" + rowData.WORK_ST_DAT.substring(4, 6) + "-" + rowData.WORK_ST_DAT.substring(6, 8));
            let iend_date = new Date(rowData.WORK_END_DAT.substring(0, 4) + "-" + rowData.WORK_END_DAT.substring(4, 6) + "-" + rowData.WORK_END_DAT.substring(6, 8));

            if (istart_date > iend_date) {
                gfn_comAlert("W0008",  "근무종료일", "근무시작일");
                gvwInfo.setCellData(nRow, gvwInfo.getColRef('WORK_END_DAT'), gfn_dateToYmd(istart_date));
                gvwInfo.setCellData(nRow, gvwInfo.getColRef('WORK_DAY'), 1);
            } else {
                gvwInfo.setCellData(nRow, gvwInfo.getColRef('WORK_DAY'), Math.trunc(Math.abs((iend_date.getTime() - istart_date.getTime()) / (1000 * 60 * 60 * 24)) + 1));
            }
        }
        
    	//총 금액
        var TOT_AMOUNT = Number((Number(rowData.WORK_DAY) * Number(rowData.WORK_CNT) * Number(rowData.DAILY_PAY_AMT)) + Number(rowData.ADJUSTMENT_AMT) + Number(rowData.FUAL_AMT) + Number(rowData.ETC_COST));
        //근로소득금액
        var EARNED_INC_AMT = Number(TOT_AMOUNT - Number(rowData.NON_TXABLE_AMT) - Number(rowData.INC_AMT));
        //총 공제액
        var TOT_DEDUCT_AMT = Number(Number(rowData.INC_TX_AMT) + Number(rowData.LOCAL_TX_AMT) + Number(rowData.HEALTH_INSURE_AMT)
        + Number(rowData.LONG_HEALTH_INSURE_AMT) + Number(rowData.NATIONAL_PENS_AMT) + Number(rowData.EMPLOY_INSURE_AMT) + Number(rowData.ETC_DED_AMT));
        //총 지급액
        var TOT_PAY_AMT = Number(Number(TOT_AMOUNT) - Number(TOT_DEDUCT_AMT));
        gvwInfo.setCellData(nRow, gvwInfo.getColRef('TOT_AMOUNT'), TOT_AMOUNT);
        gvwInfo.setCellData(nRow, gvwInfo.getColRef('EARNED_INC_AMT'), EARNED_INC_AMT);
        gvwInfo.setCellData(nRow, gvwInfo.getColRef('TOT_DEDUCT_AMT'), TOT_DEDUCT_AMT);
        gvwInfo.setCellData(nRow, gvwInfo.getColRef('TOT_PAY_AMT'), TOT_PAY_AMT);
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
    	
    	let rowData = gvwInfo.getRowData(row);
    	
        var searchCode 		= gfn_nvl( rowData.EARNER_CODE);
        var searchName 		= gfn_nvl( rowData.EARNER_NAME);
        var replaceText0 	= "_EARNR_CD_";
        var replaceText1 	= "_EARNR_NM_";
        var strWhereClause 	= "AND A.EARNR_CD LIKE '%" + replaceText0 + "%' AND A.EARNR_NM LIKE '%"  + replaceText1 +  "%' " ;
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '소득자코드 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRA021'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["소득자코드", "소득자명"]
            ,searchInputFields		: ["EARNR_CD", "EARNR_NM"]
            ,searchInputValues		: [searchCode, searchName]
            ,searchInputTypes		: ["input", "input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", ""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["소득자코드", "소득자명"]
            ,tableColumnNames		: ["EARNR_CD", "EARNR_NM"]
            ,tableColumnWidths		: ["80px", "160px"]
            ,itemSelectEvent		: function (data){
                gvwInfo.setCellData(row, gvwInfo.getColRef("SOCNO"), data.RGDT_NO);
                gvwInfo.setCellData(row, gvwInfo.getColRef("SITE_CODE"), data.SITE_CD);
                gvwInfo.setCellData(row, gvwInfo.getColRef("BANK_CODE"), data.BANK_CD);
                gvwInfo.setCellData(row, gvwInfo.getColRef("BANK_ACC"), data.BACNT_NO);
                gvwInfo.setCellData(row, gvwInfo.getColRef("EARNER_CODE"), data.EARNR_CD);
                gvwInfo.setCellData(row, gvwInfo.getColRef("EARNER_NAME"), data.EARNR_NM);
                gvwInfo.setCellData(row, gvwInfo.getColRef("TEL"), data.TELNO);
                gvwInfo.setCellData(row, gvwInfo.getColRef("ADDRESS"), data.ADDR);
                gvwInfo.setCellData(row, gvwInfo.getColRef("FOREI_TYPE"), data.FRGNR_YN);
                gvwInfo.setCellData(row, gvwInfo.getColRef("NATION_CODE"), data.HBTN_NTN_CD);
                gvwInfo.setCellData(row, gvwInfo.getColRef("WORK_REGION"), data.WORK_RGN_CD);
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
        let gridlength = gvwInfo.getGridDataAll().length+1;

        if (rowVal == -1){
            gvwInfo.addRow(true, {
                TXN_ID : 0,
                JOB_YYYYMM : JOB_YYYYMM,
                DECLARATION_YYYYMM : DECLARATION_YYYYMM,
                FOREI_TYPE : "1",
                NATION_CODE : "KR",
                PAY_DATE : gfn_dateToYmd(new Date()),
            });
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("EARNER_CODE"), gridlength, gvwInfo.getColRef("EARNER_CODE"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("EARNER_NAME"), gridlength, gvwInfo.getColRef("EARNER_NAME"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("EARNER_BTN"), gridlength, gvwInfo.getColRef("EARNER_BTN"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("WORK_ST_DAT"), gridlength, gvwInfo.getColRef("WORK_ST_DAT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("WORK_END_DAT"), gridlength, gvwInfo.getColRef("WORK_END_DAT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("WORK_CNT"), gridlength, gvwInfo.getColRef("WORK_CNT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("DAILY_PAY_AMT"), gridlength, gvwInfo.getColRef("DAILY_PAY_AMT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("WORK_GBN"), gridlength, gvwInfo.getColRef("WORK_GBN"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("WORK_PLACE"), gridlength, gvwInfo.getColRef("WORK_PLACE"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("WORK_NAME"), gridlength, gvwInfo.getColRef("WORK_NAME"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', gridlength, gvwInfo.getColRef("PAY_DATE"), gridlength, gvwInfo.getColRef("PAY_DATE"), "#FFF8DC");
        }else{
            gvwInfo.insertRow(rowVal, 'below', {
                TXN_ID : 0,
                JOB_YYYYMM : JOB_YYYYMM,
                DECLARATION_YYYYMM : DECLARATION_YYYYMM,
                FOREI_TYPE : "1",
                NATION_CODE : "KR",
                PAY_DATE : gfn_dateToYmd(new Date()),
            });
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("EARNER_CODE"), rowVal+1, gvwInfo.getColRef("EARNER_CODE"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("EARNER_NAME"), rowVal+1, gvwInfo.getColRef("EARNER_NAME"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("EARNER_BTN"), rowVal+1, gvwInfo.getColRef("EARNER_BTN"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("WORK_ST_DAT"), rowVal+1, gvwInfo.getColRef("WORK_ST_DAT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("WORK_END_DAT"), rowVal+1, gvwInfo.getColRef("WORK_END_DAT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("WORK_CNT"), rowVal+1, gvwInfo.getColRef("WORK_CNT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("DAILY_PAY_AMT"), rowVal+1, gvwInfo.getColRef("DAILY_PAY_AMT"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("WORK_GBN"), rowVal+1, gvwInfo.getColRef("WORK_GBN"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("WORK_PLACE"), rowVal+1, gvwInfo.getColRef("WORK_PLACE"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("WORK_NAME"), rowVal+1, gvwInfo.getColRef("WORK_NAME"), "#FFF8DC");
            gvwInfo.setCellStyle('background-color', rowVal+1, gvwInfo.getColRef("PAY_DATE"), rowVal+1, gvwInfo.getColRef("PAY_DATE"), "#FFF8DC");
        }
    }

    // 행 삭제
    const fn_delRow = async function () {
        let rowVal = gvwInfo.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwInfo.deleteRow(rowVal);
        }
    }

    const applyValidations = (sheet, validations) => {
        validations.forEach(validation => {
            const [startCell, endCell] = validation.ref.split(':');
            const startRow = parseInt(startCell.match(/\d+/)[0]);
            const endRow = parseInt(endCell.match(/\d+/)[0]);
            const column = startCell.replace(/\d+/g, ''); // 열 추출

            for (let row = startRow; row <= endRow; row++) {
                const cell = column + row;

                let formulae;
                if (Array.isArray(validation.formulae)) {
                    formulae = validation.formulae; // 배열 그대로 사용
                } else if (typeof validation.formulae === 'string') {
                    formulae = [validation.formulae.replace(/[A-Z]+\d+/g, cell)]; // 문자열 처리
                } else {
                    formulae = []; // 기본값 처리
                }

                sheet.getCell(cell).dataValidation = {
                    type: validation.type,
                    formulae: formulae,
                    allowBlank: validation.allowBlank || false,
                    showInputMessage: validation.promptTitle ? true : false,
                    promptTitle: validation.promptTitle || '',
                    prompt: validation.prompt || '',
                    showErrorMessage: validation.errorTitle ? true : false,
                    errorTitle: validation.errorTitle || '',
                    error: validation.error || '',
                };

                if (validation.numFmt) {
                    const [startCol] = validation.ref.split(':');
                    const column = startCol.replace(/\d+/g, ''); // 열 이름 추출
                    sheet.getColumn(column).numFmt = validation.numFmt;
                }
            }
        });
    };

    const fn_downloadExcelForm = async function () {
        // ExcelJS 인스턴스 생성
        const workbook = new ExcelJS.Workbook();
        const sheet = workbook.addWorksheet('용역비등록');

        // 데이터 추가
        sheet.addRow([
            "소득자코드", "소득자 성명", "귀속연월", "근무시작일", "근무종료일", "인원수"
            , "일당", "조정금액", "유류금액", "기타비용", "작업구분", "작업장소"
            , "작업명", "작업세부명", "작업장소2", "지급일자", "비과세소득", "근로소득공제"
            , "소득세", "주민세", "건강보험", "장기요양보험", "국민연금", "고용보험"
            , "기타공제", "분개장번호", "비고" // 헤더
        ]);

        const validations = [{
            ref: 'A2:A1000', // 검사 범위
            type: 'textLength',
            operator: 'between',
            formulae: [1, 10],
            allowBlank: false,
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '문자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '문자만 입력 가능 합니다.',
            numFmt: '@'
        }, {
            ref: 'B2:B1000', // 검사 범위
            type: 'textLength',
            operator: 'between',
            formulae: [1, 100],
            allowBlank: false,
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '문자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '문자만 입력 가능 합니다.',
            numFmt: '@'
        }, {
            ref: 'C2:C1000', // 검사 범위
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(C2&"-01")),LEN(C2)=7)', // YYYY-MM 형식 검사
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '날짜는 YYYY-MM 형식으로 입력하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '날짜는 YYYY-MM 형식으로 입력해야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'D2:D1000', // 검사 범위
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(D2)),LEN(D2)=10)', // 날짜 형식 검사
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '날짜는 YYYY-MM-DD 형식으로 입력하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '날짜는 YYYY-MM-DD 형식으로 입력해야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'E2:E1000', // 검사 범위
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(E2)),LEN(E2)=10)', // 날짜 형식 검사
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '날짜는 YYYY-MM-DD 형식으로 입력하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '날짜는 YYYY-MM-DD 형식으로 입력해야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'F2:F1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'G2:G1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'H2:H1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'I2:I1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'J2:J1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'K2:K1000', // 작업구분
            type: 'list',
            formulae: '"'+jsonWorkGbn.map(item => item.CD_NM).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'L2:L1000', // 작업장소
            type: 'list',
            formulae: '"'+jsonWorkPlace.map(item => item.CD_NM).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'M2:M1000', // 작업명
            type: 'list',
            formulae: '"'+jsonWorkName.map(item => item.CD_NM).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'N2:N1000', // 작업세부명
            type: 'list',
            formulae: '"'+jsonWorkDtlName.map(item => item.CD_NM).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'O2:O1000', // 작업장소2
            type: 'list',
            formulae: '"'+jsonWorkPlace2.map(item => item.CD_NM).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'P2:P1000', // 검사 범위
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(P2)),LEN(P2)=10)', // 날짜 형식 검사
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '날짜는 YYYY-MM-DD 형식으로 입력하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '날짜는 YYYY-MM-DD 형식으로 입력해야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'Q2:Q1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'R2:R1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'S2:S1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'T2:T1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'U2:U1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'V2:V1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'W2:W1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'X2:X1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'Y2:Y1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'Z2:Z1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'AA2:AA1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: [-99999999999999.99999, 99999999999999.99999],
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }];

        // 유효성 검사 적용
        applyValidations(sheet, validations);

        // Excel 파일 생성
        workbook.xlsx.writeBuffer().then(buffer => {
            const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = '용역비등록.xlsx';
            a.click();
            URL.revokeObjectURL(url);
        });
    }

    const fn_downloadExcel = async function () {
        gvwInfo.exportLocalExcel("용역비등록내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        await fn_onload();

        document.getElementById('excelFile').addEventListener('change', function(event) {
            if(!window.FileReader) return;

            var reader = new FileReader();

            reader.addEventListener(
                "load",
                () => {
                    let workBook = XLSX.read(reader.result, { type: 'binary' });

                    workBook.SheetNames.forEach(function (sheetName) {
                        let list = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName], {range: 1, header: [
                                "EARNER_CODE",
                                "EARNER_NAME",
                                "JOB_YYYYMM",
                                "WORK_ST_DAT",
                                "WORK_END_DAT",
                                "WORK_CNT",
                                "DAILY_PAY_AMT",
                                "ADJUSTMENT_AMT",
                                "FUAL_AMT",
                                "ETC_COST",
                                "WORK_GBN",
                                "WORK_PLACE",
                                "WORK_NAME",
                                "WORK_DTL_NAME",
                                "WORK_PLACE2",
                                "PAY_DATE",
                                "NON_TXABLE_AMT",
                                "INC_AMT",
                                "EARNED_INC_AMT",
                                "INC_TX_AMT",
                                "LOCAL_TX_AMT",
                                "HEALTH_INSURE_AMT",
                                "LONG_HEALTH_INSURE_AMT",
                                "NATIONAL_PENS_AMT",
                                "EMPLOY_INSURE_AMT",
                                "ETC_DED_AMT",
                                "REMARK",
                                "MEMO",
                            ]});

                        list.forEach((item, index) => {
                            item.WORK_GBN = jsonWorkGbn.length > 0 && jsonWorkGbn.filter(data => data["CD_NM"] == item.WORK_GBN).length > 0 ? jsonWorkGbn.filter(data => data["CD_NM"] == item.WORK_GBN)[0]["SBSD_CD"] : '';
                            item.WORK_PLACE = jsonWorkPlace.length > 0 && jsonWorkPlace.filter(data => data["CD_NM"] == item.WORK_PLACE).length > 0 ? jsonWorkPlace.filter(data => data["CD_NM"] == item.WORK_PLACE)[0]["SBSD_CD"] : '';
                            item.WORK_NAME = jsonWorkName.length > 0 && jsonWorkName.filter(data => data["CD_NM"] == item.WORK_NAME).length > 0 ? jsonWorkName.filter(data => data["CD_NM"] == item.WORK_NAME)[0]["SBSD_CD"] : '';
                            item.WORK_DTL_NAME = jsonWorkDtlName.length > 0 && jsonWorkDtlName.filter(data => data["CD_NM"] == item.WORK_DTL_NAME).length > 0 ? jsonWorkDtlName.filter(data => data["CD_NM"] == item.WORK_DTL_NAME)[0]["SBSD_CD"] : '';
                            item.WORK_PLACE2 = jsonWorkPlace2.length > 0 && jsonWorkPlace2.filter(data => data["CD_NM"] == item.WORK_PLACE2).length > 0 ? jsonWorkPlace2.filter(data => data["CD_NM"] == item.WORK_PLACE2)[0]["SBSD_CD"] : '';

                            item.WORK_CNT = gfn_nvl(item.WORK_CNT, 0);
                            item.DAILY_PAY_AMT = gfn_nvl(item.DAILY_PAY_AMT, 0);
                            item.ADJUSTMENT_AMT = gfn_nvl(item.ADJUSTMENT_AMT, 0);
                            item.FUAL_AMT = gfn_nvl(item.FUAL_AMT, 0);
                            item.ETC_COST = gfn_nvl(item.ETC_COST, 0);
                            item.NON_TXABLE_AMT = gfn_nvl(item.NON_TXABLE_AMT, 0);
                            item.INC_AMT = gfn_nvl(item.INC_AMT, 0);
                            item.INC_TX_AMT = gfn_nvl(item.INC_TX_AMT, 0);
                            item.LOCAL_TX_AMT = gfn_nvl(item.LOCAL_TX_AMT, 0);
                            item.HEALTH_INSURE_AMT = gfn_nvl(item.HEALTH_INSURE_AMT, 0);
                            item.LONG_HEALTH_INSURE_AMT = gfn_nvl(item.LONG_HEALTH_INSURE_AMT, 0);
                            item.NATIONAL_PENS_AMT = gfn_nvl(item.NATIONAL_PENS_AMT, 0);
                            item.EMPLOY_INSURE_AMT = gfn_nvl(item.EMPLOY_INSURE_AMT, 0);
                            item.ETC_DED_AMT = gfn_nvl(item.ETC_DED_AMT, 0);

                        	//총 금액
                            item.TOT_AMOUNT = Number(( Number(item.WORK_DAY) * Number(item.WORK_CNT) * Number(item.DAILY_PAY_AMT)) + Number(item.ADJUSTMENT_AMT) + Number(item.FUAL_AMT) + Number(item.ETC_COST));
                            //근로소득금액
                            item.EARNED_INC_AMT = Number(item.TOT_AMOUNT - Number(item.NON_TXABLE_AMT) - Number(item.INC_AMT));
                            //총 공제액
                            item.TOT_DEDUCT_AMT = Number(Number(item.INC_TX_AMT) + Number(item.LOCAL_TX_AMT) + Number(item.HEALTH_INSURE_AMT)
                            + Number(item.LONG_HEALTH_INSURE_AMT) + Number(item.NATIONAL_PENS_AMT) + Number(item.EMPLOY_INSURE_AMT) + Number(item.ETC_DED_AMT));
                            //총 지급액
                            item.TOT_PAY_AMT = Number( Number(item.TOT_AMOUNT) - Number(item.TOT_DEDUCT_AMT));

                            let istart_date = new Date(item.WORK_ST_DAT);
                            let iend_date = new Date(item.WORK_END_DAT);
                            item.WORK_DAY = Math.trunc(Math.abs((iend_date.getTime() - istart_date.getTime()) / (1000 * 60 * 60 * 24)) + 1);

                            item.JOB_YYYYMM = item.JOB_YYYYMM.replace(/-/g, "");
                            item.WORK_ST_DAT = item.WORK_ST_DAT.replace(/-/g, "");
                            item.WORK_END_DAT = item.WORK_END_DAT.replace(/-/g, "");
                            item.PAY_DATE = item.PAY_DATE.replace(/-/g, "");

                            item.SOCNO = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["RGDT_NO"] : '';
                            item.SITE_CODE = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["SITE_CD"] : '';
                            item.BANK_CODE = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["BANK_CD"] : '';
                            item.BANK_ACC = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["BACNT_NO"] : '';
                            item.EARNER_NAME = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["EARNR_NM"] : '';
                            item.TEL = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["TELNO"] : '';
                            item.ADDRESS = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["ADDR"] : '';
                            item.FOREI_TYPE = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["FRGNR_YN"] : '';
                            item.NATION_CODE = jsonEarnerCode.length > 0 ? jsonEarnerCode.filter(data => data["EARNR_CD"] == item.EARNER_CODE)[0]["HBTN_NTN_CD"] : '';
                            item.TXN_ID = 0;

                            console.log(item);
                            gvwInfo.addRow(true, item);
                        });


                        document.getElementById('excelFile').value = '';
                    })
                },
                false,
            );

            reader.readAsBinaryString(event.target.files[0]);
        });
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_onload = async function() {
        SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
        SBUxMethod.set("SRCH_JOB_YYYYMM_FR", gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_JOB_YYYYMM_TO", gfn_dateToYm(new Date()));
    }

    const fn_save = async function () {
        let updatedData = gvwInfo.getUpdateData(true, 'all');
        let returnData = [];
        updatedData.forEach((item, index) => {
            const param = {
                cv_count : '0',
                getType : 'json',
                workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID, 0),
                    V_P_JOB_YYYYMM : gfn_nvl(item.data.JOB_YYYYMM),
                    V_P_EARNER_CODE : gfn_nvl(item.data.EARNER_CODE),
                    V_P_SITE_CODE : gfn_nvl(item.data.SITE_CODE),
                    V_P_PAY_DATE : gfn_nvl(item.data.PAY_DATE),
                    V_P_WORK_END_DAT : gfn_nvl(item.data.WORK_END_DAT),
                    V_P_WORK_ST_DAT : gfn_nvl(item.data.WORK_ST_DAT),
                    V_P_WORK_DAY : gfn_nvl(item.data.WORK_DAY),
                    V_P_WORK_CNT : gfn_nvl(item.data.WORK_CNT, 0),
                    V_P_WORK_GBN : gfn_nvl(item.data.WORK_GBN),
                    V_P_WORK_PLACE : gfn_nvl(item.data.WORK_PLACE),
                    V_P_WORK_NAME : gfn_nvl(item.data.WORK_NAME),
                    V_P_WORK_DTL_NAME : gfn_nvl(item.data.WORK_DTL_NAME),
                    V_P_WORK_PLACE2 : gfn_nvl(item.data.WORK_PLACE2),
                    V_P_DAILY_PAY_AMT : gfn_nvl(item.data.DAILY_PAY_AMT, 0),
                    V_P_TOT_PAY_AMT : gfn_nvl(item.data.TOT_PAY_AMT, 0),
                    V_P_NON_TXABLE_AMT : gfn_nvl(item.data.NON_TXABLE_AMT, 0),
                    V_P_INC_AMT : gfn_nvl(item.data.INC_AMT, 0),
                    V_P_EARNED_INC_AMT : gfn_nvl(item.data.EARNED_INC_AMT, 0),
                    V_P_INC_TX_AMT : gfn_nvl(item.data.INC_TX_AMT, 0),
                    V_P_LOCAL_TX_AMT : gfn_nvl(item.data.LOCAL_TX_AMT, 0),
                    V_P_HEALTH_INSURE_AMT : gfn_nvl(item.data.HEALTH_INSURE_AMT, 0),
                    V_P_LONG_HEALTH_INSURE_AMT : gfn_nvl(item.data.LONG_HEALTH_INSURE_AMT, 0),
                    V_P_NATIONAL_PENS_AMT : gfn_nvl(item.data.NATIONAL_PENS_AMT, 0),
                    V_P_EMPLOY_INSURE_AMT : gfn_nvl(item.data.EMPLOY_INSURE_AMT, 0),
                    V_P_ETC_DED_AMT : gfn_nvl(item.data.ETC_DED_AMT, 0),
                    V_P_TOT_DEDUCT_AMT : gfn_nvl(item.data.TOT_DEDUCT_AMT, 0),
                    V_P_MEMO : gfn_nvl(item.data.MEMO),
                    V_P_REMARK : gfn_nvl(item.data.REMARK),
                    V_P_WORK_REGION : gfn_nvl(item.data.WORK_REGION),
                    V_P_CONFIRM_YN : '',
                    V_P_ADJUSTMENT_AMT : gfn_nvl(item.data.ADJUSTMENT_AMT, 0),
                    V_P_FUAL_AMT : gfn_nvl(item.data.FUAL_AMT, 0),
                    V_P_ETC_COST : gfn_nvl(item.data.ETC_COST, 0),
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });

        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3620List.do", {listData: returnData});
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
        } else {
            await fn_search();
        }
    }

    const fn_confirm = async function () {
        let gvwInfoCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHK_YN"), true);
        let returnData = [];

        if(gvwInfoCheckedList.length == 0) {
            return;
        }

        gvwInfoCheckedList.forEach((item, index) => {
            let data = gvwInfo.getRowData(item);
            const param = {
                cv_count : '0',
                getType : 'json',
                workType : 'CONFIRM',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_TXN_ID : gfn_nvl(data.TXN_ID, 0),
                    V_P_JOB_YYYYMM : gfn_nvl(data.JOB_YYYYMM),
                    V_P_EARNER_CODE : gfn_nvl(data.EARNER_CODE),
                    V_P_SITE_CODE : '',
                    V_P_PAY_DATE : '',
                    V_P_WORK_END_DAT : '',
                    V_P_WORK_ST_DAT : gfn_nvl(data.WORK_ST_DAT),
                    V_P_WORK_DAY : '',
                    V_P_WORK_CNT : '',
                    V_P_WORK_GBN : '',
                    V_P_WORK_PLACE : '',
                    V_P_WORK_NAME : '',
                    V_P_WORK_DTL_NAME : '',
                    V_P_WORK_PLACE2 : '',
                    V_P_DAILY_PAY_AMT : '',
                    V_P_TOT_PAY_AMT : '',
                    V_P_NON_TXABLE_AMT : '',
                    V_P_INC_AMT : '',
                    V_P_EARNED_INC_AMT : '',
                    V_P_INC_TX_AMT : '',
                    V_P_LOCAL_TX_AMT : '',
                    V_P_HEALTH_INSURE_AMT : '',
                    V_P_LONG_HEALTH_INSURE_AMT : '',
                    V_P_NATIONAL_PENS_AMT : '',
                    V_P_EMPLOY_INSURE_AMT : '',
                    V_P_ETC_DED_AMT : '',
                    V_P_TOT_DEDUCT_AMT : '',
                    V_P_MEMO : '',
                    V_P_REMARK : '',
                    V_P_WORK_REGION : '',
                    V_P_CONFIRM_YN : '',
                    V_P_ADJUSTMENT_AMT : '',
                    V_P_FUAL_AMT : '',
                    V_P_ETC_COST : '',
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });

        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3620List.do", {listData: returnData});
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
        } else {
            await fn_search();
        }
    }

    const fn_cancel = async function () {
        let gvwInfoCheckedList = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHK_YN"), true);
        let returnData = [];

        if(gvwInfoCheckedList.length == 0) {
            return;
        }

        gvwInfoCheckedList.forEach((item, index) => {
            let data = gvwInfo.getRowData(item);
            const param = {
                cv_count : '0',
                getType : 'json',
                workType : 'CONFIRM_CANCLE',
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_TXN_ID : gfn_nvl(data.TXN_ID, 0),
                    V_P_JOB_YYYYMM : gfn_nvl(data.JOB_YYYYMM),
                    V_P_EARNER_CODE : gfn_nvl(data.EARNER_CODE),
                    V_P_SITE_CODE : '',
                    V_P_PAY_DATE : '',
                    V_P_WORK_END_DAT : '',
                    V_P_WORK_ST_DAT : gfn_nvl(data.WORK_ST_DAT),
                    V_P_WORK_DAY : '',
                    V_P_WORK_CNT : '',
                    V_P_WORK_GBN : '',
                    V_P_WORK_PLACE : '',
                    V_P_WORK_NAME : '',
                    V_P_WORK_DTL_NAME : '',
                    V_P_WORK_PLACE2 : '',
                    V_P_DAILY_PAY_AMT : '',
                    V_P_TOT_PAY_AMT : '',
                    V_P_NON_TXABLE_AMT : '',
                    V_P_INC_AMT : '',
                    V_P_EARNED_INC_AMT : '',
                    V_P_INC_TX_AMT : '',
                    V_P_LOCAL_TX_AMT : '',
                    V_P_HEALTH_INSURE_AMT : '',
                    V_P_LONG_HEALTH_INSURE_AMT : '',
                    V_P_NATIONAL_PENS_AMT : '',
                    V_P_EMPLOY_INSURE_AMT : '',
                    V_P_ETC_DED_AMT : '',
                    V_P_TOT_DEDUCT_AMT : '',
                    V_P_MEMO : '',
                    V_P_REMARK : '',
                    V_P_WORK_REGION : '',
                    V_P_CONFIRM_YN : '',
                    V_P_ADJUSTMENT_AMT : '',
                    V_P_FUAL_AMT : '',
                    V_P_ETC_COST : '',
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnData.push(param);
        });

        if(returnData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3620List.do", {listData: returnData});
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
        } else {
            await fn_search();
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
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
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
                        TXN_ID : gfn_nvl(item.TRSC_ID, 0),
                        JOB_YYYYMM : gfn_nvl(item.BLN_YM),
                        SOCNO : gfn_nvl(item.RGDT_NO),
                        WORK_ST_DAT : gfn_nvl(item.WRKDY_BGNG_YMD),
                        EARNER_CODE : gfn_nvl(item.EARNR_CD),
                        EARNER_NAME : gfn_nvl(item.EARNR_NM),
                        SITE_CODE : gfn_nvl(item.SITE_CD),
                        PAY_DATE : gfn_nvl(item.PAY_YMD),
                        WORK_END_DAT : gfn_nvl(item.WORK_END_YMD),
                        WORK_DAY : gfn_nvl(item.WORK_DCNT, 0),
                        WORK_CNT : gfn_nvl(item.WORK_NOPE, 0),
                        WORK_GBN : gfn_nvl(item.JOB_SE),
                        WORK_NAME : gfn_nvl(item.JOB_NM),
                        WORK_PLACE : gfn_nvl(item.JOB_PLC),
                        WORK_DTL_NAME : gfn_nvl(item.JOB_DTL_NM),
                        WORK_PLACE2 : gfn_nvl(item.JOB_PLC2),
                        BANK_CODE : gfn_nvl(item.BANK_CD),
                        BANK_NAME : gfn_nvl(item.BANK_NM),
                        BANK_ACC : gfn_nvl(item.BACNT_NO),
                        DAILY_PAY_AMT : gfn_nvl(item.DAY_PAY_AMT, 0),
                        TOT_PAY_AMT : gfn_nvl(item.PAY_AMT_SUM, 0),
                        NON_TXABLE_AMT : gfn_nvl(item.TXFR_INCM_AMT, 0),
                        INC_AMT : gfn_nvl(item.EARN_DDC_AMT, 0),
                        EARNED_INC_AMT : gfn_nvl(item.ERICM_AMT, 0),
                        INC_TX_AMT : gfn_nvl(item.INCTX_AMT, 0),
                        LOCAL_TX_AMT : gfn_nvl(item.RSDTX_AMT, 0),
                        HEALTH_INSURE_AMT : gfn_nvl(item.HLTH_INSRNC_AMT, 0),
                        LONG_HEALTH_INSURE_AMT : gfn_nvl(item.LTRM_RCPR_INSRNC_AMT, 0),
                        NATIONAL_PENS_AMT : gfn_nvl(item.NPN_AMT, 0),
                        EMPLOY_INSURE_AMT : gfn_nvl(item.EPIS_AMT, 0),
                        ETC_DED_AMT : gfn_nvl(item.ETC_DDC_AMT, 0),
                        TOT_DEDUCT_AMT : gfn_nvl(item.DDC_AMT_SUM, 0),
                        MEMO : gfn_nvl(item.MEMO),
                        REMARK : gfn_nvl(item.RMRK),
                        FOREI_TYPE : gfn_nvl(item.FRGNR_YN),
                        NATION_CODE : gfn_nvl(item.HBTN_NTN_CD),
                        TEL : gfn_nvl(item.TELNO),
                        MOBILE_PHONE : gfn_nvl(item.MOBL_NO),
                        EMAIL : gfn_nvl(item.EML),
                        ADDRESS : gfn_nvl(item.ADDR),
                        WORK_REGION : gfn_nvl(item.WORK_RGN_CD),
                        CONFIRM_YN : gfn_nvl(item.CFMTN_YN),
                        ADJUSTMENT_AMT : gfn_nvl(item.AJMT_AMT, 0),
                        FUAL_AMT : gfn_nvl(item.OL_AMT, 0),
                        ETC_COST : gfn_nvl(item.ETC_CST, 0),
                        TOT_AMOUNT : gfn_nvl(item.TOT_AMT, 0)
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>