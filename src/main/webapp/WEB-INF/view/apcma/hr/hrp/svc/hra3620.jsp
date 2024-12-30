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
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
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
                            <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow" style="float: right; margin-right: 3px;"></sbux-button>
                            <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right; margin-right: 3px;"></sbux-button>
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
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 작업구분
            gfnma_setComSelect(['gvwInfo'], jsonWorkGbn, 'L_HRA081', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwInfo'], jsonWorkPlace, 'L_HRA083', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업명
            gfnma_setComSelect(['gvwInfo'], jsonWorkName, 'L_HRA082', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업세부명
            gfnma_setComSelect(['gvwInfo'], jsonWorkDtlName, 'L_HRA084', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 작업장소
            gfnma_setComSelect(['gvwInfo'], jsonWorkPlace2, 'L_HRA085', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 내외국민구분
            gfnma_setComSelect(['gvwInfo'], jsonForeignType, 'L_HRA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 거주지국
            gfnma_setComSelect(['gvwInfo'], jsonNationCode, 'L_COM015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            // 근무지역
            gfnma_setComSelect(['gvwInfo'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
            compCode				: gv_ma_selectedCorpCd
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

        let rowVal = gvwInfo.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwInfo.deleteRow(rowVal);
        }
    }

    const ensureRowsExist = (sheet, startRow, endRow) => {
        for (let rowNumber = startRow; rowNumber <= endRow; rowNumber++) {
            if (!sheet.getRow(rowNumber)) {
                sheet.addRow(rowNumber);
            }
        }
    };

    const applyValidations = (sheet, validations) => {
        validations.forEach(validation => {
            const [startCell, endCell] = validation.ref.split(':');
            const startRow = parseInt(startCell.match(/\d+/)[0]);
            const endRow = parseInt(endCell.match(/\d+/)[0]);
            const column = startCell.replace(/\d+/g, ''); // 열 추출

            //ensureRowsExist(sheet, startRow, endRow);

            sheet.getColumn(column).numFmt = validation.numFmt;
            for (let row = startRow; row <= endRow; row++) {
                const cell = column + row;

                sheet.getCell(cell).dataValidation = {
                    type: validation.type,
                    formulae: [validation.formulae.replace(/[A-Z]+\d+/g, cell)] || '',
                    allowBlank: validation.allowBlank || false,
                    showInputMessage: validation.promptTitle ? true : false,
                    promptTitle: validation.promptTitle || '',
                    prompt: validation.prompt || '',
                    showErrorMessage: validation.errorTitle ? true : false,
                    errorTitle: validation.errorTitle || '',
                    error: validation.error || '',
                };
            }
        });
    };

    const fn_downloadExcelForm = async function () {
        // ExcelJS 인스턴스 생성
        const workbook = new ExcelJS.Workbook();
        const sheet = workbook.addWorksheet('용역비등록');

        // 데이터 추가
        sheet.addRow([
            "귀속연월", "근무시작일", "소득자코드", "소득자", "지급일자", "근무종료일", "근로일수"
                , "인원수", "작업구분", "작업장소", "작업명", "작업세부명", "작업장소2", "일당"
                , "총지급액", "근로급여", "비과세소득", "소득공제", "근로소득", "소득세", "주민세"
                , "건강보험", "장기요양보험", "국민연금", "고용보험", "기타공제", "총공제액"
                , "차인지급액", "분개장번호", "비고", "내··외국인구분", "거주국", "전화번호"
                , "주소", "근무지역" // 헤더
        ]);

        const validations = [{
            ref: 'A2:A1000', // 검사 범위
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(A2&"-01")),LEN(A2)=7)', // YYYY-MM 형식 검사
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '날짜는 YYYY-MM 형식으로 입력하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '날짜는 YYYY-MM 형식으로 입력해야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'B2:B1000', // 검사 범위
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(B2)),LEN(B2)=10)', // 날짜 형식 검사
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
            type: 'custom', // 사용자 지정 수식
            formulae: '=AND(ISNUMBER(DATEVALUE(F2)),LEN(F2)=10)', // 날짜 형식 검사
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '날짜는 YYYY-MM-DD 형식으로 입력하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '날짜는 YYYY-MM-DD 형식으로 입력해야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'G2:G1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: '0',
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
            formulae: '0',
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'I2:I1000', // 작업구분
            type: 'list',
            formulae: '"'+jsonWorkGbn.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'J2:J1000', // 작업장소
            type: 'list',
            formulae: '"'+jsonWorkPlace.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'K2:K1000', // 작업명
            type: 'list',
            formulae: '"'+jsonWorkName.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'L2:L1000', // 작업세부명
            type: 'list',
            formulae: '"'+jsonWorkDtlName.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'M2:M1000', // 작업장소2
            type: 'list',
            formulae: '"'+jsonWorkPlace2.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'N2:N1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: '0',
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'O2:O1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: '0',
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'P2:P1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: '0',
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'Q2:Q1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
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
            formulae: '0',
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'AB2:AB1000', // 검사 범위
            type: 'whole',
            operator: 'greaterThanOrEqual',
            formulae: '0',
            showInputMessage: true,
            promptTitle: '입력 안내',
            prompt: '숫자를 입력하세요.',
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '숫자만 입력 가능 합니다.',
            numFmt: '0'
        }, {
            ref: 'AE2:AE1000', // 내·외국인구분
            type: 'list',
            formulae: '"'+jsonForeignType.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'AF2:AF1000', // 거주국
            type: 'list',
            formulae: '"'+jsonNationCode.map(item => item.NATION_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
        }, {
            ref: 'AI2:AI1000', // 근무지역
            type: 'list',
            formulae: '"'+jsonWorkRegion.map(item => item.CODE_NAME).join(',')+'"', // 드롭다운 값 설정
            promptTitle: '입력 안내',
            prompt: '목록에서 선택하세요.', // 입력 안내 메시지
            showErrorMessage: true,
            errorTitle: '잘못된 형식',
            error: '목록에서 선택하여야 합니다.', // 오류 메시지
            numFmt: '@'
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

        //gvwInfo.exportData('xlsx', '용역비등록', true, {arrRemoveCols: ['EARNER_BTN'], sheetName: '용역비등록'});
    }

    const fn_uploadExcel = async function () {
        const workbook = XLSX.read(arrayBuffer, {
            type: 'array',
            //cellText: true, // 셀 데이터를 텍스트로 강제 처리
            cellDates: true, // 날짜 데이터를 텍스트로 유지
            raw: false, // 숫자도 텍스트로 변환
            dateNF: 'yyyy-mm-dd' // 날짜 형식을 명시적으로 설정
        });
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
                                "JOB_YYYYMM",
                                "WORK_ST_DAT",
                                "EARNER_CODE",
                                "EARNER_NAME",
                                "PAY_DATE",
                                "WORK_END_DAT",
                                "WORK_DAY",
                                "WORK_CNT",
                                "WORK_GBN",
                                "WORK_PLACE",
                                "WORK_NAME",
                                "WORK_DTL_NAME",
                                "WORK_PLACE2",
                                "DAILY_PAY_AMT",
                                "TOT_PAY_AMT",
                                "WORK_PAY_AMT",
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
                                "TOT_DEDUCT_AMT",
                                "ALLOWANCE_AMT",
                                "REMARK",
                                "MEMO",
                                "FOREI_TYPE",
                                "NATION_CODE",
                                "TEL",
                                "ADDRESS",
                                "WORK_REGION",
                            ]});

                        list.forEach((item, index) => {
                            item.WORK_GBN = jsonWorkGbn.length > 0 ? jsonWorkGbn.filter(data => data["CODE_NAME"] == item.WORK_GBN)[0]["SUB_CODE"] : '';
                            item.WORK_PLACE = jsonWorkPlace.length > 0 ? jsonWorkPlace.filter(data => data["CODE_NAME"] == item.WORK_PLACE)[0]["SUB_CODE"] : '';
                            item.WORK_NAME = jsonWorkName.length > 0 ? jsonWorkName.filter(data => data["CODE_NAME"] == item.WORK_NAME)[0]["SUB_CODE"] : '';
                            item.WORK_DTL_NAME = jsonWorkDtlName.length > 0 ? jsonWorkDtlName.filter(data => data["CODE_NAME"] == item.WORK_DTL_NAME)[0]["SUB_CODE"] : '';
                            item.WORK_PLACE2 = jsonWorkPlace2.length > 0 ? jsonWorkPlace2.filter(data => data["CODE_NAME"] == item.WORK_PLACE2)[0]["SUB_CODE"] : '';
                            item.FOREI_TYPE = jsonForeignType.length > 0 ? jsonForeignType.filter(data => data["CODE_NAME"] == item.FOREI_TYPE)[0]["SUB_CODE"] : '';
                            item.NATION_CODE = jsonNationCode.length > 0 ? jsonNationCode.filter(data => data["NATION_NAME"] == item.NATION_CODE)[0]["NATION_CODE"] : '';
                            item.WORK_REGION = jsonWorkRegion.length > 0 ? jsonWorkRegion.filter(data => data["CODE_NAME"] == item.WORK_REGION)[0]["SUB_CODE"] : '';

                            gvwInfo.addRow(true, item);
                        });

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
                    V_P_JOB_YYYYMM : item.JOB_YYYYMM,
                    V_P_SOCNO : item.SOCNO,
                    V_P_WORK_ST_DAT : item.WORK_ST_DAT,
                    V_P_EARNER_NAME : item.EARNER_NAME,
                    V_P_SITE_CODE : item.SITE_CODE,
                    V_P_PAY_DATE : item.PAY_DATE,
                    V_P_WORK_END_DAT : item.WORK_END_DAT,
                    V_P_WORK_DAY : item.WORK_DAY,
                    V_P_DECLARATION_YYYYMM : item.DECLARATION_YYYYMM,
                    V_P_BANK_CODE : item.BANK_CODE,
                    V_P_BANK_ACC : item.BANK_ACC,
                    V_P_DAILY_PAY_AMT : item.DAILY_PAY_AMT,
                    V_P_TOT_PAY_AMT : item.TOT_PAY_AMT,
                    V_P_WORK_PAY_AMT : item.WORK_PAY_AMT,
                    V_P_NON_TXABLE_AMT : item.NON_TXABLE_AMT,
                    V_P_INC_AMT : item.INC_AMT,
                    V_P_EARNED_INC_AMT : item.EARNED_INC_AMT,
                    V_P_INC_TX_AMT : item.INC_TX_AMT,
                    V_P_LOCAL_TX_AMT : item.LOCAL_TX_AMT,
                    V_P_HEALTH_INSURE_AMT : item.HEALTH_INSURE_AMT,
                    V_P_LONG_HEALTH_INSURE_AMT : item.LONG_HEALTH_INSURE_AMT,
                    V_P_NATIONAL_PENS_AMT : item.NATIONAL_PENS_AMT,
                    V_P_EMPLOY_INSURE_AMT : item.EMPLOY_INSURE_AMT,
                    V_P_ETC_DED_AMT : item.ETC_DED_AMT,
                    V_P_TOT_DEDUCT_AMT : item.TOT_DEDUCT_AMT,
                    V_P_ALLOWANCE_AMT : item.ALLOWANCE_AMT,
                    V_P_MEMO : item.MEMO,
                    V_P_REMARK : item.REMARK,
                    V_P_FOREI_TYPE : item.FOREI_TYPE,
                    V_P_NATION_CODE : item.NATION_CODE,
                    V_P_TEL : item.TEL,
                    V_P_ADDRESS : item.ADDRESS,
                    V_P_WORK_REGION : item.WORK_REGION,
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>