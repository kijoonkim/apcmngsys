<%
    /**
     * @Class Name 		: hrt1210.jsp
     * @Description 	: 교대조 정보 화면
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
    <title>title : 교대조 정보</title>
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
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 40%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">교대조</th>
                    <td class="td_input">
                        <sbux-select id="SRCH_SHIFT_CODE" uitype="single" jsondata-ref="jsonShiftCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">교대조명</th>
                    <td class="td_input">
                        <sbux-input id="SRCH_SHIFT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사용여부</th>
                    <td class="td_input">
                        <sbux-select id="SRCH_USE_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>교대조 리스트</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-bandgvwInfo" style="height:300px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>교대조 정보 등록</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btn_copy" name="btn_copy" uitype="normal" text="복사" class="btn btn-sm btn-outline-danger" onclick="fn_copy" ></sbux-button>
                    </div>
                </div>
                <table class="table table-bordered tbl_fixed">
                    <caption>교대조정보</caption>
                    <colgroup>
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                        <col style="width: 3.8%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">교대조코드</th>
                        <td class="td_input"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">교대조명</th>
                        <td colspan="5" class="td_input"></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">사용여부</th>
                        <td class="td_input"></td>
                        <th scope="row" class="th_bg">주5일여부</th>
                        <td colspan="3" class="td_input"></td>
                        <td></td>
                        <th scope="row" class="th_bg">교대유형</th>
                        <td colspan="2" class="td_input"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">근무유형</th>
                        <td colspan="4" class="td_input"></td>
                        <th scope="row" class="th_bg">근무일</th>
                        <td colspan="4" class="td_input"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">바탕색상</th>
                        <td colspan="4" class="td_input"></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">13유휴대상</th>
                        <td colspan="2" class="td_input"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">출퇴근시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td></td>
                        <td></td>
                        <th scope="row" class="th_bg">정상근무시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">연장시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <th scope="row" class="th_bg">야근근무시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">시간외1 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <th scope="row" class="th_bg">시간외2 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">시간외3 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <th scope="row" class="th_bg">시간외4 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게1 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td></td>
                        <th scope="row" class="th_bg">휴게2 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게3 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td></td>
                        <th scope="row" class="th_bg">휴게4 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">휴게5 시간</th>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td>~</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td>:</td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td class="td_input"></td>
                        <td></td>
                        <th rowspan="2" scope="row" class="th_bg">비고</th>
                        <td colspan="11" rowspan="2" class="td_input"></td>
                    </tr>
                    <tr>
                        <td colspan="13"></td>
                        <td></td>
                        <td colspan="11"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
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

    var jsonShiftCode    = []; // 교대조
    var jsonUseYn        = []; // 사용여부
    var jsonWorkDayType  = []; // 근무일
    var jsonWorkTypeCode = []; // 근무유형

    //grid 초기화
    var bandgvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonShiftList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        let rst = await Promise.all([
            // 집계기준
            gfnma_setComSelect(['SRCH_SHIFT_CODE'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
            // 사용여부
            gfnma_setComSelect(['SRCH_USE_YN'], jsonUseYn, 'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무일
            gfnma_setComSelect(['bandgvwInfo'], jsonWorkDayType, 'L_HRT019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무유형
            gfnma_setComSelect(['bandgvwInfo'], jsonWorkTypeCode, 'L_HRT_WORKTYPE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'WORK_TYPE_CODE', 'WORK_TYPE_NAME', 'Y', ''),


        ]);
    }

    function fn_createBandgvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwInfo';
        SBGridProperties.id 				= 'bandgvwInfo';
        SBGridProperties.jsonref 			= 'jsonShiftList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["교대조정보", "교대조코드"], 	        ref: 'SHIFT_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["교대조정보", "교대조명"], 	        ref: 'SHIFT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["교대조정보", "교대조유형"], 	        ref: 'SHIFT_CATEGORY',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "출근구분"], 	        ref: 'WORK_ON_DAY_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "출근시각"], 	        ref: 'WORK_ON_HHMM',    	        type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["출퇴근", "출근시각"], 	        ref: 'WORK_ON_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "출근시각"], 	        ref: 'WORK_ON_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "퇴근구분"], 	        ref: 'WORK_OFF_DAY_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "퇴근시각"], 	        ref: 'WORK_OFF_HHMM',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["출퇴근", "퇴근시각"], 	        ref: 'WORK_OFF_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "퇴근시각"], 	        ref: 'WORK_OFF_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["출퇴근", "총근무시간"], 	        ref: 'WORK_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["근무정보", "사용여부"], 	        ref: 'USE_YN',    	        type:'checkbox',  	width:'60px',  	style:'text-align:left'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 2 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["근무정보", "근무일"], 	        ref: 'WORK_DAY_TYPE',    	        type:'combo',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무정보", "근무유형"], 	        ref: 'WORK_TYPE_CODE',    	        type:'combo',  	width:'82px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무정보", "비고"], 	        ref: 'MEMO',    	        type:'output',  	width:'146px',  	style:'text-align:left'},
            {caption: ["근무정보", "주5일여부"], 	        ref: 'FIVE_WEEK_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["근무정보", "바탕색"], 	        ref: 'BACK_COLOR',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["근무정보", "13유휴대상"], 	        ref: 'PAY_ALLOWANCE_FLAG',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상근태항목"], 	        ref: 'NORMAL_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상시작구분"], 	        ref: 'NORMAL_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상시작시간"], 	        ref: 'NORMAL_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["정상", "정상시작시간"], 	        ref: 'NORMAL_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상시작시간"], 	        ref: 'NORMAL_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상종료구분"], 	        ref: 'NORMAL_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상종료시각"], 	        ref: 'NORMAL_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["정상", "정상종료"], 	        ref: 'NORMAL_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상종료"], 	        ref: 'NORMAL_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상", "정상근무시간"], 	        ref: 'NORMAL_HOURS',    	        type:'output',  	width:'85px',  	style:'text-align:left'},
            {caption: ["연장", "연장근태항목"], 	        ref: 'OVER_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장시작구분"], 	        ref: 'OVER_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장시작시각"], 	        ref: 'OVER_START_HHMM',    	        type:'output',  	width:'78px',  	style:'text-align:left'},
            {caption: ["연장", "연장시작"], 	        ref: 'OVER_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장시작"], 	        ref: 'OVER_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장종료구분"], 	        ref: 'OVER_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장종료시각"], 	        ref: 'OVER_END_HHMM',    	        type:'output',  	width:'78px',  	style:'text-align:left'},
            {caption: ["연장", "연장종료"], 	        ref: 'OVER_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장종료"], 	        ref: 'OVER_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["연장", "연장근무시간"], 	        ref: 'OVER_HOURS',    	        type:'output',  	width:'85px',  	style:'text-align:left'},
            {caption: ["야간", "야간근태항목"], 	        ref: 'NIGHT_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간시작구분"], 	        ref: 'NIGHT_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간시작시각"], 	        ref: 'NIGHT_START_HHMM',    	        type:'output',  	width:'73px',  	style:'text-align:left'},
            {caption: ["야간", "야간시작"], 	        ref: 'NIGHT_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간시작"], 	        ref: 'NIGHT_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간종료구분"], 	        ref: 'NIGHT_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간종료시각"], 	        ref: 'NIGHT_END_HHMM',    	        type:'output',  	width:'74px',  	style:'text-align:left'},
            {caption: ["야간", "야간종료"], 	        ref: 'NIGHT_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간종료"], 	        ref: 'NIGHT_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["야간", "야간근무시간"], 	        ref: 'NIGHT_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시간외1", "시간외1 근태항목"], 	        ref: 'AFTER1_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 시작구분"], 	        ref: 'AFTER1_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 시작시각"], 	        ref: 'AFTER1_START_HHMM',    	        type:'output',  	width:'104px',  	style:'text-align:left'},
            {caption: ["시간외1", "시간외1 시작"], 	        ref: 'AFTER1_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 시작"], 	        ref: 'AFTER1_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 종료구분"], 	        ref: 'AFTER1_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 종료시각"], 	        ref: 'AFTER1_END_HHMM',    	        type:'output',  	width:'107px',  	style:'text-align:left'},
            {caption: ["시간외1", "시간외1 종료"], 	        ref: 'AFTER1_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 종료"], 	        ref: 'AFTER1_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1", "시간외1 근무시간"], 	        ref: 'AFTER1_HOURS',    	        type:'output',  	width:'86px',  	style:'text-align:left'},
            {caption: ["시간외2", "시간외2 근태항목"], 	        ref: 'AFTER2_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 시작구분"], 	        ref: 'AFTER2_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 시작시각"], 	        ref: 'AFTER2_START_HHMM',    	        type:'output',  	width:'107px',  	style:'text-align:left'},
            {caption: ["시간외2", "시간외2 시작"], 	        ref: 'AFTER2_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 시작"], 	        ref: 'AFTER2_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 종료구분"], 	        ref: 'AFTER2_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 종료시각"], 	        ref: 'AFTER2_END_HHMM',    	        type:'output',  	width:'104px',  	style:'text-align:left'},
            {caption: ["시간외2", "시간외2 종료"], 	        ref: 'AFTER2_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 종료"], 	        ref: 'AFTER2_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2", "시간외2 근무시간"], 	        ref: 'AFTER2_HOURS',    	        type:'output',  	width:'86px',  	style:'text-align:left'},
            {caption: ["시간외3", "시간외3 근태항목"], 	        ref: 'AFTER3_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시간외3 시작구분"], 	        ref: 'AFTER3_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시간외3 시작시각"], 	        ref: 'AFTER3_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시간외3", "시간외3 시작"], 	        ref: 'AFTER3_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시간외3 시작"], 	        ref: 'AFTER3_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시간외3 종료구분"], 	        ref: 'AFTER3_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시간외3 종료시작"], 	        ref: 'AFTER3_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시간외3", "시간외3 종료"], 	        ref: 'AFTER3_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시간외3 종료"], 	        ref: 'AFTER3_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외3", "시작외3 근무시간"], 	        ref: 'AFTER3_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시간외4", "시간외4 근태항목"], 	        ref: 'AFTER4_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시간외4 시작구분"], 	        ref: 'AFTER4_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시작외4 시작시각"], 	        ref: 'AFTER4_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시간외4", "시작외4 시작"], 	        ref: 'AFTER4_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시작외4 시작"], 	        ref: 'AFTER4_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시간외4 종료구분"], 	        ref: 'AFTER4_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시간외4 종료시각"], 	        ref: 'AFTER4_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시간외4", "시간외4 종료"], 	        ref: 'AFTER4_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시간외4 종료"], 	        ref: 'AFTER4_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외4", "시간외4 근무시간"], 	        ref: 'AFTER4_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게1", "휴게1 근태항목"], 	        ref: 'BREAK1_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 시작구분"], 	        ref: 'BREAK1_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 시작시각"], 	        ref: 'BREAK1_START_HHMM',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["휴게1", "휴게1 시작"], 	        ref: 'BREAK1_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 시작"], 	        ref: 'BREAK1_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 종료구분"], 	        ref: 'BREAK1_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 종료시각"], 	        ref: 'BREAK1_END_HHMM',    	        type:'output',  	width:'89px',  	style:'text-align:left'},
            {caption: ["휴게1", "휴게1 종료"], 	        ref: 'BREAK1_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 종료"], 	        ref: 'BREAK1_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게1", "휴게1 근무시간"], 	        ref: 'BREAK1_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게2", "휴게2 근태항목"], 	        ref: 'BREAK2_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 시작구분"], 	        ref: 'BREAK2_START_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 시작시각"], 	        ref: 'BREAK2_START_HHMM',    	        type:'output',  	width:'78px',  	style:'text-align:left'},
            {caption: ["휴게2", "휴게2 시작"], 	        ref: 'BREAK2_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 시작"], 	        ref: 'BREAK2_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 종료구분"], 	        ref: 'BREAK2_END_DAY_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 종료시각"], 	        ref: 'BREAK2_END_HHMM',    	        type:'output',  	width:'82px',  	style:'text-align:left'},
            {caption: ["휴게2", "휴게2 종료"], 	        ref: 'BREAK2_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 종료"], 	        ref: 'BREAK2_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게2", "휴게2 근무시간"], 	        ref: 'BREAK2_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게3", "휴게3 근태항목"], 	        ref: 'BREAK3_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 시작구분"], 	        ref: 'BREAK3_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 시작시각"], 	        ref: 'BREAK3_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게3", "휴게3 시작"], 	        ref: 'BREAK3_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 시작"], 	        ref: 'BREAK3_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 종료구분"], 	        ref: 'BREAK3_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 종료시각"], 	        ref: 'BREAK3_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게3", "휴게3 종료"], 	        ref: 'BREAK3_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 종료"], 	        ref: 'BREAK3_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게3", "휴게3 근무시간"], 	        ref: 'BREAK3_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게4", "휴게4 근태항목"], 	        ref: 'BREAK4_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 시작구분"], 	        ref: 'BREAK4_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 시작시각"], 	        ref: 'BREAK4_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게4", "휴게4 시작"], 	        ref: 'BREAK4_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 시작"], 	        ref: 'BREAK4_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 종료구분"], 	        ref: 'BREAK4_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 종료시각"], 	        ref: 'BREAK4_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게4", "휴게4 종료"], 	        ref: 'BREAK4_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 종료"], 	        ref: 'BREAK4_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게4", "휴게4 근무시간"], 	        ref: 'BREAK4_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게5", "휴게5 근태항목"], 	        ref: 'BREAK5_TIME_ITEM_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 시작구분"], 	        ref: 'BREAK5_START_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 시작시각"], 	        ref: 'BREAK5_START_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게5", "휴게5 시작"], 	        ref: 'BREAK5_START_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 시작"], 	        ref: 'BREAK5_START_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 종료구분"], 	        ref: 'BREAK5_END_DAY_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 종료시각"], 	        ref: 'BREAK5_END_HHMM',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴게5", "휴게5 종료"], 	        ref: 'BREAK5_END_HH',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 종료"], 	        ref: 'BREAK5_END_MM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게5", "휴게5 근무시간"], 	        ref: 'BREAK5_HOURS',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["정상휴게적용"], 	        ref: 'NORMAL_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["연장휴게적용"], 	        ref: 'OVER_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["야간휴게적용"], 	        ref: 'NIGHT_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외1 휴게적용"], 	        ref: 'AFTER1_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["시간외2 휴게적용"], 	        ref: 'AFTER2_BREAK_APPLY_YN',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('click', 'fn_view');
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createBandgvwInfoGrid();
        //fn_search();
    });
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
