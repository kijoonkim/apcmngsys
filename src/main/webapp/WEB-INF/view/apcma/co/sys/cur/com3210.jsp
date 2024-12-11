<%
    /**
     * @Class Name        : com3210.jsp
     * @Description    	  : 환율정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.13
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.13   	표주완		최초 생성
     * @ 2024.07.13   	천용진		기능 추가
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
    <title>title : 환율정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
		.table-search-ma > tbody > tr > th {
 			padding-top : 3px; 
 			padding-bottom : 3px; 
 			padding-left : 0px;
		}
		.table-search-ma > tbody > tr > td {
 			padding-top : 3px; 
 			padding-bottom : 3px; 
 			padding-left : 0px;
		}
    </style>
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

            <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal" is-scrollable="false" title-target-id-array="TAB_DAILY^TAB_AVERAGE^TAB_MONTH" title-text-array="일별환율^평균환율^기간별환율">
            </sbux-tabs>
            <div class="tab-content">
                <div id="TAB_DAILY">
                    <!--[pp] 검색 -->
                    <div style="display:flex;justify-content: flex-end;margin-bottom:1rem;padding-top:0px;">
                        <sbux-button 
                        	id="btn_mailingList" 
                        	name="btn_mailingList" 
                        	target-id="modal-comPopCom5500"
                        	uitype="modal" 
                        	text="메일링 리스트" 
                        	class="btn btn-sm btn-outline-danger" 
                        	onclick="fn_mailingList" 
                        	style="margin-right: 1rem;">
                        	</sbux-button>
                        <sbux-button id="btn_currencyData" name="btn_currencyData" uitype="normal" text="환율(외부) 가져오기" class="btn btn-sm btn-outline-danger" onclick="fn_currencyData"></sbux-button>
<!--                         <sbux-button id="btn_fbsExchangeRate" name="btn_fbsExchangeRate" uitype="normal" text="환율요청" class="btn btn-sm btn-outline-danger" onclick="fn_fbsExchangeRate"></sbux-button> -->
                    </div>
                    <div class="box-search-ma">
	                    <!--[APC] START -->
	                    <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	                    <!--[APC] END -->
	                    <table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
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
	                                <th scope="row" class="th_bg_search">통화</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                    <div class="dropdown">
	                                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" uitype="normal" id="SRCH_CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <font>선택</font>
	                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                        </button>
	                                        <div class="dropdown-menu" aria-labelledby=SRCH_CURRENCY_CODE style="width:270px;height:300px;padding-top:0px;overflow:auto">
	                                        </div>
	                                    </div>
	                                </td>
	                                <td></td>
	                                
	                                <th scope="row" class="th_bg_search">고시회차</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                	<sbux-input id="SRCH_EXCHANGE_SEQ_P" class="form-control input-sm" uitype="text" value="1" style="width:100%"></sbux-input>
	                                </td>
	                                <td></td>
	                                
	                                <th scope="row" class="th_bg_search">기준일자</th>
	                                <td class="td_output" style="border-right: hidden;">
                                        <sbux-datepicker id="SRCH_BASE_DATE_FR" name="SRCH_BASE_DATE_FR" class="table-datepicker-ma" uitype="popup" date-format="yyyy-mm-dd" style="height: 3.6vh;width: 100%;"></sbux-datepicker>
	                                </td>
	                                <td>~</td>
	                                <td class="td_output" style="border-right: hidden;">
	                                    <sbux-datepicker id="SRCH_BASE_DATE_TO" name="SRCH_BASE_DATE_TO" class="table-datepicker-ma" uitype="popup" date-format="yyyy-mm-dd" style="height: 3.6vh;width: 100%;"></sbux-datepicker>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row" class="th_bg_search">서비스</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                    <div class="dropdown">
	                                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" uitype="normal" id="SRCH_FBS_SERVICE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <font>선택</font>
	                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                        </button>
	                                        <div class="dropdown-menu" aria-labelledby=SRCH_FBS_SERVICE style="width:170px;height:300px;padding-top:0px;overflow:auto">
	                                        </div>
	                                    </div>                                
	                                </td>
	                                <td></td>
	                                <th scope="row" class="th_bg_search">FBS대상</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                    <div class="dropdown">
	                                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" uitype="normal" id="SRCH_FBS_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <font>선택</font>
	                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                        </button>
	                                        <div class="dropdown-menu" aria-labelledby=SRCH_FBS_YN style="width:170px;padding-top:0px;overflow:auto">
	                                        </div>
	                                    </div>   
	                                </td>
	                                <td></td>
	                                <th scope="row" class="th_bg_search">사용여부</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                    <div class="dropdown">
	                                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" uitype="normal" id="SRCH_USE_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <font>선택</font>
	                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                        </button>
	                                        <div class="dropdown-menu" aria-labelledby=SRCH_USE_YN style="width:170px;padding-top:0px;overflow:auto">
	                                        </div>
	                                    </div>                                  
	                                </td>
	                                <td></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>◎ 환율 리스트</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow" style="float: right;">
                            </sbux-button>
                            <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                            <%--그리드 복사 불가. 붙여넣기 불가.--%>
                            <sbux-button id="btnCopyClear" name="btnCopyClear" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_gridCopyClear" style="float: right;"></sbux-button>
                            <%--행단위로 복사--%> 
                            <sbux-button id="btnCopyLine" name="btnCopyLine" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_gridCopyLine" style="float: right; display: none;"></sbux-button>
                            <%--셀단위로 복사--%>
                            <sbux-button id="btnCopyCell" name="btnCopyCell" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_gridCopyCell" style="float: right; display: none;"></sbux-button>
                            </sbux-button>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-dailyDayGrid" style="height:55vh; width:100%;"></div>
                    </div>
                </div>
                
                <div id="TAB_AVERAGE">
                	<div class="box-search-ma">
	                    <table id="srchArea2" class="table table-bordered tbl_fixed table-search-ma">
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
	                                <th scope="row" class="th_bg_search">기준일자</th>
	                                <td class="td_output" style="border-right: hidden;">
                                        <sbux-datepicker id="SRCH_BASE_DATE2" name="SRCH_BASE_DATE2" class="table-datepicker-ma"  uitype="popup" date-format="yyyy-mm-dd" style="height: 3.6vh;width: 100%;">
                                        </sbux-datepicker>
	                                </td>
	                                <td colspan="3"></td>
	                                <th scope="row" class="th_bg_search">통화</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                    <div class="dropdown">
	                                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" uitype="normal" id="SRCH_CURRENCY_CODE2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <font>선택</font>
	                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                        </button>
	                                        <div class="dropdown-menu" aria-labelledby=SRCH_CURRENCY_CODE2 style="width:270px;height:300px;padding-top:0px;overflow:auto">
	                                        </div>
	                                    </div>
	                                </td>
	                                <td></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>    
                    <div class="col-sm-4 tab-content">
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 계정 리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-grdAverageInfo" style="height:67vh;"></div>
                        </div>
                    </div>
                    <div class="col-sm-8 tab-content" style="max-height:77vh">
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>평균환율조회</span>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-grdAverageAvg" style="height:30vh;"></div>
                        </div>
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>평균환율세부내역</span>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-grdAverageDetail" style="height:35vh;"></div>
                        </div>
                    </div>
                </div>

                <div id="TAB_MONTH">
                	<div class="box-search-ma">
	                    <table id="srchArea3" class="table table-bordered tbl_fixed table-search-ma">
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
	                                <th scope="row" class="th_bg_search">기준월</th>
	                                <td class="td_output" style="border-right: hidden;">
                                        <sbux-datepicker id="SRCH_BASE_DATE_FR1" name="SRCH_BASE_DATE_FR1" class="table-datepicker-ma" uitype="popup" date-format="yyyy-mm" datepicker-mode="month" style="height: 3.6vh;width: 100%;"></sbux-datepicker>
	                                </td>
	                                <td>~</td>
	                                <td class="td_output" style="border-right: hidden;">
                                        <sbux-datepicker id="SRCH_BASE_DATE_TO1" name="SRCH_BASE_DATE_TO1" class="table-datepicker-ma" uitype="popup" date-format="yyyy-mm" datepicker-mode="month" style="height: 3.6vh;width: 100%;"></sbux-datepicker>
	                                </td>
	                                <td></td>
	                                <th scope="row" class="th_bg_search">통화</th>
	                                <td colspan="3" class="td_output" style="border-right: hidden;">
	                                    <div class="dropdown">
	                                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" uitype="normal" id="SRCH_CURRENCY_CODE3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <font>선택</font>
	                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
	                                        </button>
	                                        <div class="dropdown-menu" aria-labelledby=SRCH_CURRENCY_CODE3 style="width:270px;height:300px;padding-top:0px;overflow:auto">
	                                        </div>
	                                    </div>
	                                </td>       
	                                <td></td>
	                            </tr>
	                        </tbody>
	                    </table>        
	                </div>                
                    <div class="col-sm-3 tab-content" >
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 통화유형 리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-grdMonthType" style="height:67vh;"></div>
                        </div>
                    </div>
                    <div class="col-sm-9 tab-content">
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>기간별환율등록</span>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-grdMonthMonth" style="height:67vh;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-compopup1" 
        	name="modal-compopup1" 
        	uitype="middle" 
        	header-title="" 
        	body-html-id="body-com-popup1" 
        	header-is-close-button="true" footer-is-close-button="false" style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
    <div>
        <sbux-modal
        	id="modal-comPopCom5500" 
        	name="modal-comPopCom5500" 
        	uitype="middle" 
        	header-title="" 
        	body-html-id="body-com-popCom5500" 
        	header-is-close-button="true" 
        	footer-is-close-button="true" 
        	style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popCom5500">
    	<jsp:include page="../../../com/popup/comPopCom5500.jsp"></jsp:include>
    </div>
        
</body>
<script type="text/javascript">
    // ${comMenuVO.menuId}

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_createGrid();
        fn_init();
        gfnma_multiSelectSet('#SRCH_FBS_YN', 'SUB_CODE', 'CODE_NAME', 'Y');
        fn_search('TAB_DAILY');
    });
	// 신규
	function cfn_add() {
	}
	
	/**
	 * 초기화
	 */
	function cfn_init() {
		gfnma_uxDataClear('#srchArea1');
		gfnma_uxDataClear('#srchArea2');
		gfnma_uxDataClear('#srchArea3');
	}

	
	// 그룹코드 내역, 세부코드 정보 저장
	function cfn_save() {
		var tabId = $('#idxTab_norm_ul').find('.active').attr('data-sbux-id');
		if(tabId == 'TAB_DAILY'){
			fn_saveTabDaily();
		}else if(tabId == 'TAB_MONTH'){
			fn_saveTabMonth();
		}
		
	}
	
	//기간별환율 탭 저장
    const fn_saveTabMonth = async function () {
        let updatedMonthData = monthMonthGrid.getUpdateData(true, 'all');
        let listData = [];
        updatedMonthData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN        : ''
               		,V_P_LANG_ID              : ''
               		,V_P_COMP_CODE            : gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
               		,V_P_PERIOD               : gfn_nvl(item.data.BASE_MONTH)
               		,V_P_EX_RATE_DIV          : gfn_nvl(item.data.EX_RATE_DIV)
               		,V_P_CURRENCY_CODE        : gfn_nvl(item.data.CURRENCY_CODE)
               		,V_P_EX_RATE              : gfn_nvl(item.data.EX_RATE)
               		,V_P_REMARK               : gfn_nvl(item.data.REMARK)
               		,V_P_FORM_ID              : p_formId
               		,V_P_MENU_ID              : p_menuId
               		,V_P_PROC_ID              : ''
               		,V_P_USERID               : p_userId
               		,V_P_PC                   : ''
                })
            }
            listData.push(param);
        });
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/co/sys/cur/insertCom3210_S2.do", {listData: listData});
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    fn_search('TAB_MONTH');
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
	
    //일별환율 탭 저장
    const fn_saveTabDaily = async function () {
        let updatedDayData = dailyDayGrid.getUpdateData(true, 'all');
        let listData = [];
		for(var i=0; updatedDayData.length > i; i++){
			if(updatedDayData[i].data.EXCHANGE_SEQ == '' && updatedDayData[i].status != 'd'){
				gfn_comAlert("W0002", "추가한 행의 고시회차"); 
				return;
			}
		}
		updatedDayData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
            	    V_P_DEBUG_MODE_YN        : ""
           		   ,V_P_LANG_ID              : ""
           		   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
           		   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
           		   ,V_P_BASE_CURRENCY        : gfn_nvl(item.data.BASE_CURRENCY)
           		   ,V_P_BASE_DATE            : gfn_nvl(item.data.BASE_DATE.replace(/-/g, ""))
           		   ,V_P_CURRENCY_CODE        : gfn_nvl(item.data.CURRENCY_CODE)
           		   ,V_P_EXCHANGE_SEQ         : gfn_nvl(item.data.EXCHANGE_SEQ)
           		   ,V_P_RCV_EX_RATE          : gfn_nvl(item.data.RCV_EX_RATE)
           		   ,V_P_SND_EX_RATE          : gfn_nvl(item.data.SND_EX_RATE)
           		   ,V_P_SLE_EX_RATE          : gfn_nvl(item.data.SLE_EX_RATE)
           		   ,V_P_BUY_EX_RATE          : gfn_nvl(item.data.BUY_EX_RATE)
           		   ,V_P_TC_SLE_EX_RATE       : gfn_nvl(item.data.TT_SLE_EX_RATE)
           		   ,V_P_SLE_BSE_EX_RATE      : gfn_nvl(item.data.SLE_BSE_EX_RATE)
           		   ,V_P_USA_EX_RATE          : gfn_nvl(item.data.USA_EX_RATE)
           		   ,V_P_AVG_EX_RATE          : gfn_nvl(item.data.AVG_EX_RATE)
           		   ,V_P_USER_EXCHANGE_RATE1  : gfn_nvl(item.data.USER_EXCHANGE_RATE1)
           		   ,V_P_USER_EXCHANGE_RATE2  : gfn_nvl(item.data.USER_EXCHANGE_RATE2)
           		   ,V_P_USER_EXCHANGE_RATE3  : gfn_nvl(item.data.USER_EXCHANGE_RATE3)
           		   ,V_P_TT_BUY_EX_RATE       : gfn_nvl(item.data.TT_BUY_EX_RATE)
           		   ,V_P_TT_SLE_EX_RATE       : gfn_nvl(item.data.TT_SLE_EX_RATE)
           		   ,V_P_TT_BUY_PRM_EX_RATE   : gfn_nvl(item.data.TT_BUY_PRM_EX_RATE)
           		   ,V_P_TT_SLE_PRM_EX_RATE   : gfn_nvl(item.data.TT_SLE_PRM_EX_RATE)
           		   ,V_P_LIBOR_M1_EX_RATE     : gfn_nvl(item.data.LIBOR_M1_EX_RATE)
           		   ,V_P_LIBOR_M3_EX_RATE     : gfn_nvl(item.data.LIBOR_M3_EX_RATE)
           		   ,V_P_LIBOR_Y1_EX_RATE     : gfn_nvl(item.data.LIBOR_Y1_EX_RATE)
           		   ,V_P_EX_COM_Y1_EX_RATE    : gfn_nvl(item.data.EX_COM_Y1_EX_RATE)
           		   ,V_P_EX_COM_M1_EX_RATE    : gfn_nvl(item.data.EX_COM_M1_EX_RATE)
           		   ,V_P_EX_COM_M3_EX_RATE    : gfn_nvl(item.data.EX_COM_M3_EX_RATE)
           		   ,V_P_REMARK               : gfn_nvl(item.data.REMARK)
           		   ,V_P_FORM_ID              : p_formId
           		   ,V_P_MENU_ID              : p_menuId
           		   ,V_P_PROC_ID              : ""
           		   ,V_P_USERID               : p_userId
           		   ,V_P_PC                   : ""
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/co/sys/cur/insertCom3210_S1.do", {listData: listData});
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    fn_search('TAB_DAILY');
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
	
	
	
	// 마스터 그리드 삭제
	function cfn_del() {
// 		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		var tabId = $('#idxTab_norm_ul').find('.active').attr('data-sbux-id');
		console.log('tabId ==>', tabId);
		if(tabId == 'TAB_DAILY'){
			fn_search('TAB_DAILY');
		}else if(tabId == 'TAB_AVERAGE'){
			fn_search('TAB_AVERAGE');
		}else if(tabId == 'TAB_MONTH'){
			fn_search('TAB_MONTH');
		}
	}
	
 	/**
 	 * @name fn_search
      * @description 탭에 따라 프로시저 호출하여 그리드 그리기
      * @function
 	 * @param {string} tabId
 	 */     
    const fn_search = async function(tabId) {
    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_CURRENCY_CODE		= '';
    	let SRCH_FBS_SERVICE		= '';
    	let SRCH_FBS_YN				= '';
    	let SRCH_USE_YN				= '';
    	let SRCH_BASE_DATE_FR		= '';
    	let SRCH_BASE_DATE_TO		= '';
    	let SRCH_EXCHANGE_SEQ_P		= '';
    	let workType 				= '';
    	
    	if(tabId == 'TAB_DAILY'){
        	SRCH_CURRENCY_CODE		= gfnma_multiSelectGet('#SRCH_CURRENCY_CODE');
        	SRCH_FBS_SERVICE		= gfnma_multiSelectGet('#SRCH_FBS_SERVICE');
        	SRCH_FBS_YN				= gfnma_multiSelectGet('#SRCH_FBS_YN');
        	SRCH_USE_YN				= gfnma_multiSelectGet('#SRCH_USE_YN');
        	SRCH_BASE_DATE_FR		= gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE_FR"));
        	SRCH_BASE_DATE_TO		= gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE_TO"));
        	SRCH_EXCHANGE_SEQ_P		= gfn_nvl($('#SRCH_EXCHANGE_SEQ_P').val());
        	workType 				= 'DAY';
    	}else if(tabId == 'TAB_AVERAGE'){
        	SRCH_CURRENCY_CODE		= gfnma_multiSelectGet('#SRCH_CURRENCY_CODE2');
        	SRCH_BASE_DATE_FR		= gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE2"));
        	SRCH_BASE_DATE_TO		= gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE2"));
        	workType 				= 'AVERAGE';
    	}else if(tabId == 'TAB_MONTH'){
        	SRCH_CURRENCY_CODE		= gfnma_multiSelectGet('#SRCH_CURRENCY_CODE3');
        	workType 				= 'CURRENCY';
    	}
    	
    	var paramObj = {
	    	    V_P_DEBUG_MODE_YN        : ''
	    	   ,V_P_LANG_ID              : ''
	    	   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
	    	   ,V_P_BASE_DATE_FR         : SRCH_BASE_DATE_FR
	    	   ,V_P_BASE_DATE_TO         : SRCH_BASE_DATE_TO
	    	   ,V_P_CURRENCY_CODE        : SRCH_CURRENCY_CODE
	    	   ,V_P_EXCHANGE_SEQ         : SRCH_EXCHANGE_SEQ_P
	    	   ,V_P_ACCOUNT_CODE         : ''
	    	   ,V_P_FBS_YN               : SRCH_FBS_YN
	    	   ,V_P_USE_YN               : SRCH_USE_YN
	    	   ,V_P_FORM_ID              : p_formId
	    	   ,V_P_MENU_ID              : p_menuId
	    	   ,V_P_PROC_ID              : ''
	    	   ,V_P_USERID               : p_userId
	    	   ,V_P_PC                   : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/cur/selectCom3210.do", {
			getType				: 'json',
			workType			: workType,
			cv_count			: '4',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		
	    	   	/** @type {number} **/
	    		dailyDayGrid.length 		= 0;
	    	   	/** @type {number} **/
	    		let totalRecordCount 	= 0;
	    	   	
	    	   	if(workType == 'DAY'){
		    	   	/** @type {string} **/
		    		let IMG 				= '';
		    	   	data.cv_1.forEach((item, index) => {
		    	   		if(item.DATA_TYPE2 == 'Y'){
		    	        	IMG = '/static/images/ma/check.png';
		    	        }else{
		    	        	IMG = '/static/images/ma/cancel.png';
		    	        }
		    	   		
			    		const msg = {
			    				IMG						: IMG,
			    				BASE_DATE				: item.BASE_DATE.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
			    				CURRENCY_CODE			: item.CURRENCY_CODE,
			    				BASE_CURRENCY			: item.BASE_CURRENCY,
			    				EXCHANGE_BASE_SCALE		: item.EXCHANGE_BASE_SCALE,
			    				RCV_EX_RATE				: item.RCV_EX_RATE,
			    				SND_EX_RATE				: item.SND_EX_RATE,
			    				SLE_EX_RATE				: item.SLE_EX_RATE,
			    				BUY_EX_RATE				: item.BUY_EX_RATE,
			    				TC_SLE_EX_RATE			: item.TC_SLE_EX_RATE,
			    				SLE_BSE_EX_RATE			: item.SLE_BSE_EX_RATE,
			    				USA_EX_RATE				: item.USA_EX_RATE,
			    				AVG_EX_RATE				: item.AVG_EX_RATE,
			    				USER_EXCHANGE_RATE1		: item.USER_EXCHANGE_RATE1,
			    				USER_EXCHANGE_RATE2		: item.USER_EXCHANGE_RATE2,
			    				USER_EXCHANGE_RATE3		: item.USER_EXCHANGE_RATE3,
			    				TT_BUY_EX_RATE			: item.TT_BUY_EX_RATE,
			    				TT_SLE_EX_RATE			: item.TT_SLE_EX_RATE,
			    				TT_BUY_PRM_EX_RATE		: item.TT_BUY_PRM_EX_RATE,
			    				TT_SLE_PRM_EX_RATE		: item.TT_SLE_PRM_EX_RATE,
			    				LIBOR_M1_EX_RATE		: item.LIBOR_M1_EX_RATE,
			    				LIBOR_M3_EX_RATE		: item.LIBOR_M3_EX_RATE,
			    				LIBOR_Y1_EX_RATE		: item.LIBOR_Y1_EX_RATE,
			    				EX_COM_Y1_EX_RATE		: item.EX_COM_Y1_EX_RATE,
			    				EX_COM_M1_EX_RATE		: item.EX_COM_M1_EX_RATE,
			    				EX_COM_M3_EX_RATE		: item.EX_COM_M3_EX_RATE,
			    				DATA_TYPE				: item.DATA_TYPE,
			    				DATA_TYPE2				: item.DATA_TYPE2,
			    				FBS_YN					: item.FBS_YN,
			    				FBS_SERVICE				: item.FBS_SERVICE,
			    				EXCHANGE_SEQ			: item.EXCHANGE_SEQ,
			    				REMARK					: item.REMARK
			    		}
			    		jsonDailyDayList.push(msg);
			    		totalRecordCount ++;
			    	});
		    	   	dailyDayGrid.rebuild();
		    	   	document.querySelector('#listCount').innerText = totalRecordCount;
		    	//평균환율 - 계정리스트
	    	   	}else if(workType == "AVERAGE"){   
		    	   	data.cv_1.forEach((item, index) => {
			    		const msg = {
			    				CURRENCY_CODE			: item.CURRENCY_CODE,
			    				CURRENCY_NAME			: item.CURRENCY_NAME,
			    				BASE_SCALE				: item.BASE_SCALE,
			    				ACCOUNT_CODE			: item.ACCOUNT_CODE,
			    				ACCOUNT_NAME			: item.ACCOUNT_NAME,
			    		}
			    		jsonAverageInfoList.push(msg);
			    	});
					averageInfoGrid.rebuild();
	    	   	//통화유형 그리드
	    	   	}else if(workType == "CURRENCY"){
		    	   	data.cv_2.forEach((item, index) => {
			    		const msg = {
			    				CODE_NAME			: item.CODE_NAME,
			    				SUB_CODE			: item.SUB_CODE,
			    				EXTRA_FIELD			: item.EXTRA_FIELD
			    		}
			    		jsonMonthTypeList.push(msg);
			    	});
		    	   	monthTypeGrid.rebuild();
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
 	 
     //그룹코드 내역 보기
     const fn_viewAverage = async function() {
    	
     	var nCol = averageInfoGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = averageInfoGrid.getRow();
		if (nRow < 1) {
			return;
		}

        let rowData = averageInfoGrid.getRowData(nRow);
     	
     	fn_clearForm();
     	averageAbgGrid.clearStatus();
     	averageDetailGrid.clearStatus();
 		
    	var paramObj = {
	    	    V_P_DEBUG_MODE_YN        : ''
	    	   ,V_P_LANG_ID              : ''
	    	   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
	    	   ,V_P_BASE_DATE_FR         : gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE2"))
	    	   ,V_P_BASE_DATE_TO         : gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE2"))
	    	   ,V_P_CURRENCY_CODE        : rowData.CURRENCY_CODE
	    	   ,V_P_EXCHANGE_SEQ         : ''
	    	   ,V_P_ACCOUNT_CODE         : rowData.ACCOUNT_CODE
	    	   ,V_P_FBS_YN               : ''
	    	   ,V_P_USE_YN               : ''
	    	   ,V_P_FORM_ID              : p_formId
	    	   ,V_P_MENU_ID              : p_menuId
	    	   ,V_P_PROC_ID              : ''
	    	   ,V_P_USERID               : p_userId
	    	   ,V_P_PC                   : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/cur/selectCom3210.do", {
			getType				: 'json',
			workType			: 'AVGDETAIL',
			cv_count			: '4',
			params				: gfnma_objectToString(paramObj)
		});

         const avgData = await postJsonPromise;
         try {
   			if (_.isEqual("S", avgData.resultStatus)) {
   	      		
         	} else {
           		alert(avgData.resultMessage);
         	}

         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }
     }
 	 
     //그룹코드 내역 보기
     const fn_viewMonth = async function() {
     
     	var nCol = monthTypeGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = monthTypeGrid.getRow();
 		if (nRow < 1) {
             return;
 		}

        let rowData = monthTypeGrid.getRowData(nRow);
     	fn_clearForm();
     	monthMonthGrid.clearStatus();
 		
 	    var paramObj = {
	    	    V_P_DEBUG_MODE_YN        : ''
 	    	   ,V_P_LANG_ID              : ''
 	    	   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
 	    	   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
 	    	   ,V_P_BASE_DATE_FR         : gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE_FR1"))
 	    	   ,V_P_BASE_DATE_TO         : gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE_TO1"))
 	    	   ,V_P_CURRENCY_CODE        : rowData.sub_code
 	    	   ,V_P_EXCHANGE_SEQ         : ''
 	    	   ,V_P_ACCOUNT_CODE         : ''
 	    	   ,V_P_FBS_YN               : ''
 	    	   ,V_P_USE_YN               : ''
 	    	   ,V_P_FORM_ID              : p_formId
 	    	   ,V_P_MENU_ID              : p_menuId
 	    	   ,V_P_PROC_ID              : ''
 	    	   ,V_P_USERID               : p_userId
 	    	   ,V_P_PC                   : ''
    		   
 	    };		

         const postJsonPromise = gfn_postJSON("/co/sys/cur/selectCom3210.do", {
         	getType				: 'json',
         	workType			: 'MONTH',
         	cv_count			: '4',
         	params				: gfnma_objectToString(paramObj)
 		});

         const monthData = await postJsonPromise;
         try {
   			if (_.isEqual("S", monthData.resultStatus)) {
   				monthData.cv_3.forEach((item, index) => {
		    		const msg = {
		    				BASE_CURRENCY	: item.BASE_CURRENCY,
		    				BASE_MONTH		: item.BASE_MONTH,
		    				CURRENCY_CODE	: item.CURRENCY_CODE,
		    				EX_RATE_DIV		: item.EX_RATE_DIV,
		    				EX_RATE			: item.EX_RATE,
		    				REMARK			: item.REMARK
		    		}
		    		jsonMonthMonthList.push(msg);
		    	});
   				monthMonthGrid.rebuild();
         	} else {
           		alert(monthData.resultMessage);
         	}

         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }
    }
    var jsonBaseCurrency = []; //기준통화 [ L_COM001 ]
    var jsonCurrencyCode = []; //통화 	 [ L_COM001 ]
    
    const fn_init = async function() {
    	
    	$('#idxTab_norm_ul').click(function(){
    		var tabId = $('#idxTab_norm_ul').find('.active').attr('data-sbux-id');
    		fn_search(tabId);
    	});
    	
        let rst = await Promise.all([
            SBUxMethod.set("SRCH_BASE_DATE_FR", 	gfn_dateToYmd(new Date())),
            SBUxMethod.set("SRCH_BASE_DATE_TO", 	gfn_dateToYmd(new Date())),
            SBUxMethod.set("SRCH_BASE_DATE2", 		gfn_dateToYmd(new Date())),
            SBUxMethod.set("SRCH_BASE_DATE2", 		gfn_dateToYmd(new Date())),
            SBUxMethod.set("SRCH_BASE_DATE_FR1", 	gfn_dateToYm(new Date())),
            SBUxMethod.set("SRCH_BASE_DATE_TO1", 	gfn_dateToYm(new Date())),
            
            //기준통화
            gfnma_setComSelect(['dailyDayGrid','BASE_CURRENCY'], jsonBaseCurrency, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            //통화
            gfnma_setComSelect(['dailyDayGrid','CURRENCY_CODE'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            //통화
            gfnma_setComSelect(['monthMonthGrid','BASE_CURRENCY'], jsonBaseCurrency, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            //통화
            gfnma_setComSelect(['monthMonthGrid','CURRENCY_CODE'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            //일별 환율탭 -  통화
            gfnma_multiSelectInit({
                target: ['#SRCH_CURRENCY_CODE'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_COM001',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'CURRENCY_CODE',
                colLabel: 'CURRENCY_NAME',
                columns: [
                	{caption: "통화코드",	ref: 'CURRENCY_CODE', width: '70px', style: 'text-align:left' },
                    {caption: "통화명",	ref: 'CURRENCY_NAME', width: '100px',style: 'text-align:left' },
                    {caption: "비고",	ref: 'DESCIPTION',    width: '100px',style: 'text-align:left' },
                ]
            }),
            //평균환율탭 -  서비스
            gfnma_multiSelectInit({
                target: ['#SRCH_FBS_SERVICE'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_FBS019',
                whereClause: "AND COMP_CODE = '" + gv_ma_selectedCorpCd + "'",
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
            //평균환율탭 -  FBS대상
            gfnma_multiSelectInit({
                target: ['#SRCH_FBS_YN'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_COM036',
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
                    {caption: "명칭",	ref: 'CODE_NAME', width: '100px',style: 'text-align:left' },                	
                ]
            }),          
            //평균환율탭 -  사용여부
            gfnma_multiSelectInit({
                target: ['#SRCH_USE_YN'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_COM036',
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
                    {caption: "명칭",	ref: 'CODE_NAME', width: '100px',style: 'text-align:left' },
                ]
            }),            
            //평균환율탭 -  통화
            gfnma_multiSelectInit({
                target: ['#SRCH_CURRENCY_CODE2'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_COM001',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'CURRENCY_CODE',
                colLabel: 'CURRENCY_NAME',
                columns: [
                	{caption: "통화코드",	ref: 'CURRENCY_CODE', width: '70px', style: 'text-align:left' },
                    {caption: "통화명",	ref: 'CURRENCY_NAME', width: '100px',style: 'text-align:left' },
                    {caption: "비고",	ref: 'DESCIPTION',    width: '100px',style: 'text-align:left' },
                ]
            }),
            //기간별환율탭 -  통화
            gfnma_multiSelectInit({
                target: ['#SRCH_CURRENCY_CODE3'],
                compCode: gv_ma_selectedCorpCd,
                clientCode: gv_ma_selectedClntCd,
                bizcompId: 'L_COM001',
                whereClause: '',
                formId: p_formId,
                menuId: p_menuId,
                selectValue: '',
                dropType: 'down', // up, down
                dropAlign: 'left', // left, right
                colValue: 'CURRENCY_CODE',
                colLabel: 'CURRENCY_NAME',
                columns: [
                	{caption: "통화코드",	ref: 'CURRENCY_CODE', width: '70px', style: 'text-align:left' },
                    {caption: "통화명",	ref: 'CURRENCY_NAME', width: '100px',style: 'text-align:left' },
                    {caption: "비고",	ref: 'DESCIPTION',    width: '100px',style: 'text-align:left' },
                ]
            }),
        ]);
        
    }
    
	//일별환율 - 환율정보 그리드
    var dailyDayGrid;
    var jsonDailyDayList = [];
	//평균환율 - 계정 리스트 그리드
    var averageInfoGrid;
    var jsonAverageInfoList = [];
	//평균환율 - 평균환율조회 그리드
    var averageAvgGrid;
    var jsonAverageAvgList = [];
	//평균환율 - 평균환율세부내역 그리드
    var averageDetailGrid;
    var jsonAverageDetailList = [];
	//기간별환율 - 통화유형 그리드
    var monthTypeGrid;
    var jsonMonthTypeList = [];
	//기간별환율 - 기간별환율등록 그리드
    var monthMonthGrid;
    var jsonMonthMonthList = [];

    function fn_createGrid() {
    	//일별환율탭 - 환율 정보
        var SBGridProperties = {};
        SBGridProperties.parentid 			= 'sb-area-dailyDayGrid';
        SBGridProperties.id 				= 'dailyDayGrid';
        SBGridProperties.jsonref 			= 'jsonDailyDayList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.oneclickedit  		= true;
        SBGridProperties.allowcopy 			= false; //복사
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= { seq: 'No' };
        SBGridProperties.rowheaderwidth 	= { seq: '60' };
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : [''], ref : 'IMG', width : '40px',	style : 'text-align:center',	type : 'image', 
            	typeinfo : {
            		imagewidth : '20'
            	}
            },
            {caption : ["기준통화"], ref : 'BASE_CURRENCY', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonBaseCurrency',
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ['기준일자'],	ref : 'BASE_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd'}},
            {caption: ["고시회차"], 	ref: 'EXCHANGE_SEQ', type: 'input', width: '100px', style: 'text-align:right'},
            {caption : ["통화"], 	ref : 'CURRENCY_CODE', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonBaseCurrency',
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["비고"], 				ref: 'REMARK', 				type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["환산기준"], 			ref: 'EXCHANGE_BASE_SCALE', type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["매매기준율"], 		ref: 'SLE_BSE_EX_RATE', 	type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["송금받을때"], 		ref: 'RCV_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["송금보낼때"], 		ref: 'SND_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["현찰팔때"], 			ref: 'SLE_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["현찰살때"], 			ref: 'BUY_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["T/C매도율"], 			ref: 'TC_SLE_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["대미환산율"], 		ref: 'USA_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 매입율"], 		ref: 'TT_BUY_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 매도율"], 		ref: 'TT_SLE_EX_RATE', 		type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 우대매입율"],	ref: 'TT_BUY_PRM_EX_RATE', 	type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 우대매도율"],	ref: 'TT_SLE_PRM_EX_RATE', 	type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["LIBOR 1개월"], 		ref: 'LIBOR_M1_EX_RATE', 	type: 'input', width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["LIBOR 3개월"], 		ref: 'LIBOR_M3_EX_RATE', 	type: 'input', width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["LIBOR 1년"], 		ref: 'LIBOR_Y1_EX_RATE', 	type: 'input', width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["환가료 1년"], 		ref: 'EX_COM_Y1_EX_RATE', 	type: 'input', width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["환가료 1개월"], 		ref: 'EX_COM_M1_EX_RATE', 	type: 'input', width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["환가료 3개월"],		ref: 'EX_COM_M3_EX_RATE', 	type: 'input', width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["사용자 환율1"], 		ref: 'USER_EXCHANGE_RATE1', type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["사용자 환율2"], 		ref: 'USER_EXCHANGE_RATE2', type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["사용자 환율3"], 		ref: 'USER_EXCHANGE_RATE3', type: 'input', width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["데이타구분"], 		ref: 'DATA_TYPE', 			type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["펌뱅킹서비스"],		ref: 'FBS_SERVICE', 		type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["은행코드"], 			ref: 'BANK_CODE', 			type: 'input', width: '100px', style: 'text-align:left'}
        ];
        dailyDayGrid = _SBGrid.create(SBGridProperties);
        dailyDayGrid.bind('click', 'fndailyDayGridData');
        
      	//평균환율탭 - 계정 리스트
        var SBGridPropertiesAverageInfo = {};
        SBGridPropertiesAverageInfo.parentid 			= 'sb-area-grdAverageInfo';
        SBGridPropertiesAverageInfo.id 					= 'averageInfoGrid';
        SBGridPropertiesAverageInfo.jsonref 			= 'jsonAverageInfoList';
        SBGridPropertiesAverageInfo.emptyrecords 		= '데이터가 없습니다.';
        SBGridPropertiesAverageInfo.selectmode 			= 'byrow';
        SBGridPropertiesAverageInfo.allowcopy 			= true; //복사
        SBGridPropertiesAverageInfo.allowpaste 			= true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridPropertiesAverageInfo.explorerbar 		= 'sortmove';
        SBGridPropertiesAverageInfo.rowheader 			= 'seq';
        SBGridPropertiesAverageInfo.rowheadercaption 	= { seq: 'No' };
        SBGridPropertiesAverageInfo.rowheaderwidth 		= { seq: '60' };
        SBGridPropertiesAverageInfo.extendlastcol 		= 'scroll';
        SBGridPropertiesAverageInfo.columns = [
            {caption: ["통화코드"], 		ref: 'SUB_CODE', 		type: 'output', width: '80px', style: 'text-align:left'},
            {caption: ["통화"], 			ref: 'CODE_NAME', 		type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정코드"], 		ref: 'ACCOUNT_CODE', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정명"], 		ref: 'ACCOUNT_NAME', 	type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["환율환산단위"], 	ref: 'BASE_SCALE', 		type: 'output', width: '100px', style: 'text-align:left'},
        ];
        averageInfoGrid = _SBGrid.create(SBGridPropertiesAverageInfo);
        averageInfoGrid.bind('click', 'fn_viewAverage');
        
      	//평균환율탭 - 평균환율조회
        var SBGridPropertiesAverageAvg = {};
        SBGridPropertiesAverageAvg.parentid 		= 'sb-area-grdAverageAvg';
        SBGridPropertiesAverageAvg.id 				= 'averageAvgGrid';
        SBGridPropertiesAverageAvg.jsonref 			= 'jsonAverageAvgList';
        SBGridPropertiesAverageAvg.emptyrecords 	= '데이터가 없습니다.';
        SBGridPropertiesAverageAvg.selectmode 		= 'byrow';
        SBGridPropertiesAverageAvg.allowcopy 		= true; //복사
        SBGridPropertiesAverageAvg.allowpaste 		= true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridPropertiesAverageAvg.explorerbar 		= 'sortmove';
        SBGridPropertiesAverageAvg.rowheader 		= 'seq';
        SBGridPropertiesAverageAvg.rowheadercaption = { seq: 'No' };
        SBGridPropertiesAverageAvg.rowheaderwidth 	= { seq: '60' };
        SBGridPropertiesAverageAvg.extendlastcol 	= 'scroll';
        SBGridPropertiesAverageAvg.columns = [
            {caption: ["기준일"], 		ref: 'BASE_DATE', 		type: 'output', width: '80px', style: 'text-align:left'},
            {caption: ["통화"], 			ref: 'CURRENCY_CODE', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정과목코드"], 	ref: 'ACCOUNT_CODE', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정과목명"], 	ref: 'ACCOUNT_NAME', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["평균환율"], 		ref: 'AVG_RATE', 		type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["총외화금액"], 	ref: 'ORIGINAL_AMT',	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["총원화금액"], 	ref: 'FUNCTIONAL_AMT', 	type: 'output', width: '100px', style: 'text-align:left'},
        ];
        averageAvgGrid = _SBGrid.create(SBGridPropertiesAverageAvg);
        
      	//평균환율탭 - 평균환율세부내역
        var SBGridPropertiesAverageDetail = {};
        SBGridPropertiesAverageDetail.parentid 			= 'sb-area-grdAverageDetail';
        SBGridPropertiesAverageDetail.id 				= 'averageDetailGrid';
        SBGridPropertiesAverageDetail.jsonref 			= 'jsonAverageDetailList';
        SBGridPropertiesAverageDetail.emptyrecords 		= '데이터가 없습니다.';
        SBGridPropertiesAverageDetail.selectmode 		= 'byrow';
        SBGridPropertiesAverageDetail.allowcopy 		= true; //복사
        SBGridPropertiesAverageDetail.allowpaste 		= true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridPropertiesAverageDetail.explorerbar 		= 'sortmove';
        SBGridPropertiesAverageDetail.rowheader 		= 'seq';
        SBGridPropertiesAverageDetail.rowheadercaption 	= { seq: 'No' };
        SBGridPropertiesAverageDetail.rowheaderwidth 	= { seq: '60' };
        SBGridPropertiesAverageDetail.extendlastcol 	= 'scroll';
        SBGridPropertiesAverageDetail.columns = [
            {caption: ["전표일자"], 		ref: 'DOC_DATE', 		type: 'output', width: '80px', 	style: 'text-align:left'},
            {caption: ["통화"], 			ref: 'CURRENCY_CODE', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["전표번호"], 		ref: 'DOC_NAME', 		type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["라인순번"], 		ref: 'item_seq', 		type: 'output', width: '80px', 	style: 'text-align:left'},
            {caption: ["계정과목코드"], 	ref: 'account_code', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정과목명"], 	ref: 'account_name',	type: 'output', width: '240px', style: 'text-align:left'},
            {caption: ["평균환율"], 		ref: 'avg_rate', 		type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["외화금액"], 		ref: 'original_amt', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["원화금액"], 		ref: 'functional_amt', 	type: 'output', width: '100px', style: 'text-align:left'},
        ];
        averageDetailGrid = _SBGrid.create(SBGridPropertiesAverageDetail);
        
      	//기간별환율 탭 - 통화유형
        var SBGridPropertiesMonthType = {};
        SBGridPropertiesMonthType.parentid 			= 'sb-area-grdMonthType';
        SBGridPropertiesMonthType.id 				= 'monthTypeGrid';
        SBGridPropertiesMonthType.jsonref 			= 'jsonMonthTypeList';
        SBGridPropertiesMonthType.emptyrecords 		= '데이터가 없습니다.';
        SBGridPropertiesMonthType.selectmode 		= 'byrow';
        SBGridPropertiesMonthType.useinitsorting 	= true;
        SBGridPropertiesMonthType.allowcopy 		= true; //복사
        SBGridPropertiesMonthType.allowpaste 		= true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridPropertiesMonthType.explorerbar 		= 'sortmove';
        SBGridPropertiesMonthType.rowheader 		= 'seq';
        SBGridPropertiesMonthType.rowheadercaption 	= { seq: 'No' };
        SBGridPropertiesMonthType.rowheaderwidth 	= { seq: '60' };
        SBGridPropertiesMonthType.extendlastcol 	= 'scroll';
        SBGridPropertiesMonthType.columns = [
            {caption: ["통화코드"], 		ref: 'SUB_CODE', 		type: 'output', width: '80px', style: 'text-align:left'},
            {caption: ["통화"], 			ref: 'CODE_NAME', 		type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["환율환산단위"], 	ref: 'EXTRA_FIELD', 	type: 'output', width: '100px', style: 'text-align:left'},
        ];
        monthTypeGrid = _SBGrid.create(SBGridPropertiesMonthType);
        monthTypeGrid.bind('click', 'fn_viewMonth');
        
      	//기간별환율 탭 - 기간별환율등록
        var SBGridPropertiesMonthMonth = {};
        SBGridPropertiesMonthMonth.parentid 		= 'sb-area-grdMonthMonth';
        SBGridPropertiesMonthMonth.id 				= 'monthMonthGrid';
        SBGridPropertiesMonthMonth.jsonref 			= 'jsonMonthMonthList';
        SBGridPropertiesMonthMonth.emptyrecords 	= '데이터가 없습니다.';
        SBGridPropertiesMonthMonth.selectmode 		= 'byrow';
        SBGridPropertiesMonthMonth.allowcopy 		= true; //복사
        SBGridPropertiesMonthMonth.allowpaste 		= true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridPropertiesMonthMonth.explorerbar 		= 'sortmove';
        SBGridPropertiesMonthMonth.rowheader 		= 'seq';
        SBGridPropertiesMonthMonth.rowheadercaption = { seq: 'No' };
        SBGridPropertiesMonthMonth.rowheaderwidth 	= { seq: '60' };
        SBGridPropertiesMonthMonth.extendlastcol 	= 'scroll';
        SBGridPropertiesMonthMonth.columns = [
            {caption: ["기준통화"], 		ref: 'BASE_CURRENCY', 	type: 'output', width: '80px', style: 'text-align:left'},
            {caption: ["기준월"], 		ref: 'BASE_MONTH', 		type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["통화"], 			ref: 'CURRENCY_CODE', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["환율구분"], 		ref: 'EX_RATE_DIV', 	type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["환율"], 			ref: 'EX_RATE', 		type: 'output', width: '100px', style: 'text-align:right'},
            {caption: ["비고"], 			ref: 'REMARK', 			type: 'output', width: '100px', style: 'text-align:left'},
        ];
        monthMonthGrid = _SBGrid.create(SBGridPropertiesMonthMonth);
    }

	/**
	 * @name fn_clearForm
	 * @DESCRIPTION 그리드 및 화면 초기화
	 * @param
	 */
	const fn_clearForm = function(){
	
		//일별환율 - 환율정보 그리드
	    jsonDailyDayList 		= [];
		//평균환율 - 계정 리스트 그리드
	    jsonAverageInfoList 	= [];
		//평균환율 - 평균환율조회 그리드
	    jsonAverageAvgList 		= [];
		//평균환율 - 평균환율세부내역 그리드
	    jsonAverageDetailList 	= [];
		//기간별환율 - 통화유형 그리드
	    jsonMonthTypeList 		= [];
		//기간별환율 - 기간별환율등록 그리드
	    jsonMonthMonthList 		= [];
	
	}

	let gridMode = 'byrow';
    const fn_gridCopyClear = function() {
        $('#btnCopyClear').hide();
        $('#btnCopyLine').show();
        $('#btnCopyCell').hide();

        let data = dailyDayGrid.getGridDataAll();
        jsonDailyDayList = [];
		gridMode = 'byrow'; //행 단위 단일  선택
		fn_drawdailyDayGrid(gridMode, data, true);
    }
    /*행 복사 (행복사모드)*/
    const fn_gridCopyLine = function() {
        $('#btnCopyClear').hide();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').show();

        let data = dailyDayGrid.getGridDataAll();
        jsonDailyDayList = [];
		gridMode = 'byrows'; //행 단위 단일  선택
		fn_drawdailyDayGrid(gridMode, data, true);
    }
    /*셀 복사 (셀복사모드)*/
    const fn_gridCopyCell = function() {
        $('#btnCopyClear').show();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').hide();

        let data = dailyDayGrid.getGridDataAll();
        jsonDailyDayList = [];
		gridMode = 'free'; //행 단위 단일  선택
		fn_drawdailyDayGrid(gridMode, data, true);
    }
    
    // 행 추가
    const fn_addRow = function() {
    	
    	let data = dailyDayGrid.getGridDataAll();
        let rowVal = dailyDayGrid.getRow();
    	jsonDailyDayList = [];
        fn_drawdailyDayGrid(gridMode, data, true, 'input');
        //데이터가 없고 행선택이 없을경우.
        if (rowVal == -1) {
            dailyDayGrid.addRow
            	(true,
        			{
					IMG:"/static/images/ma/cancel.png"
					,BASE_CURRENCY:""
					,BASE_DATE:""
					,EXCHANGE_SEQ:""
					,CURRENCY_CODE:""
					,REMARK:""
					,EXCHANGE_BASE_SCALE: "1"
					,SLE_BSE_EX_RATE:"0"
					,RCV_EX_RATE:"0"
					,SND_EX_RATE:"0"
					,SLE_EX_RATE:"0"
					,BUY_EX_RATE:"0"
					,TC_SLE_EX_RATE:"0"
					,USA_EX_RATE: "0"
					,TT_BUY_EX_RATE:"0"
					,TT_SLE_EX_RATE:"0"
					,TT_BUY_PRM_EX_RATE:"0"
					,TT_SLE_PRM_EX_RATE:"0"
					,LIBOR_M1_EX_RATE:"0"
	  				,LIBOR_M3_EX_RATE:"0"
	  				,LIBOR_Y1_EX_RATE:"0"
	  				,EX_COM_Y1_EX_RATE:"0"
	  				,EX_COM_M1_EX_RATE:"0"
	  				,EX_COM_M3_EX_RATE:"0"
	  				,USER_EXCHANGE_RATE1:"0"
	  				,USER_EXCHANGE_RATE2:"0"
	  				,USER_EXCHANGE_RATE3:"0"
					,DATA_TYPE:""
					,DATA_TYPE2:"N"
					,FBS_SERVICE:''
					,BANK_CODE:""
					,AVG_EX_RATE:"0"
					,FBS_YN:"Y"
					}
		        );
        } else {
        	dailyDayGrid.insertRow
        		(rowVal, 
        		'below', 
       			{
       				IMG:"/static/images/ma/cancel.png"
       				,BASE_CURRENCY:""
       				,BASE_DATE:""
     				,EXCHANGE_SEQ:""
      				,CURRENCY_CODE:""
   					,REMARK:""
  					,EXCHANGE_BASE_SCALE: "1"
					,SLE_BSE_EX_RATE:"0"
					,RCV_EX_RATE:"0"
       				,SND_EX_RATE:"0"
      				,SLE_EX_RATE:"0"
       				,BUY_EX_RATE:"0"
      				,TC_SLE_EX_RATE:"0"
  					,USA_EX_RATE: "0"
 					,TT_BUY_EX_RATE:"0"
					,TT_SLE_EX_RATE:"0"
					,TT_BUY_PRM_EX_RATE:"0"
					,TT_SLE_PRM_EX_RATE:"0"
       				,LIBOR_M1_EX_RATE:"0"
         			,LIBOR_M3_EX_RATE:"0"
         			,LIBOR_Y1_EX_RATE:"0"
         			,EX_COM_Y1_EX_RATE:"0"
         			,EX_COM_M1_EX_RATE:"0"
         			,EX_COM_M3_EX_RATE:"0"
         			,USER_EXCHANGE_RATE1:"0"
         			,USER_EXCHANGE_RATE2:"0"
         			,USER_EXCHANGE_RATE3:"0"
       				,DATA_TYPE:""
       				,DATA_TYPE2:"N"
       				,FBS_SERVICE:''
 					,BANK_CODE:""
       				,AVG_EX_RATE:"0"
       				,FBS_YN:"Y"
				}
       		);
        }
    }

    // 행삭제
    const fn_delRow = async function() {
        let rowVal = dailyDayGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
            dailyDayGrid.deleteRow(rowVal);
        }
    }
    
    function fn_drawdailyDayGrid(mod, data, copymod, editType){
    	if (gfn_nvl(editType) == ''){
    		editType = 'output'
    	}
    	//일별환율탭 - 환율 정보
        var SBGridProperties = {};
        SBGridProperties.parentid 			= 'sb-area-dailyDayGrid';
        SBGridProperties.id 				= 'dailyDayGrid';
        SBGridProperties.jsonref 			= 'jsonDailyDayList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= mod;
        SBGridProperties.allowcopy 			= copymod; //복사
        SBGridProperties.allowpaste 		= true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= { seq: 'No' };
        SBGridProperties.rowheaderwidth 	= { seq: '60' };
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : [''], ref : 'IMG', width : '40px',	style : 'text-align:center',	type : 'image', 
            	typeinfo : {
            		imagewidth : '20'
            	}
            },
            {caption : ["기준통화"], ref : 'BASE_CURRENCY', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonBaseCurrency',
                    displayui : copymod,
                    oneclickedit : copymod,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ['기준일자'],	ref : 'BASE_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd'}},
            {caption: ["고시회차"], 	ref: 'EXCHANGE_SEQ', type: editType, width: '100px', style: 'text-align:right'},
            {caption : ["통화"], 	ref : 'CURRENCY_CODE', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonBaseCurrency',
                    displayui : copymod,
                    oneclickedit : copymod,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["비고"], 				ref: 'REMARK', 				type: editType, width: '120px', style: 'text-align:left'},
            {caption: ["환산기준"], 			ref: 'EXCHANGE_BASE_SCALE', type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["매매기준율"], 		ref: 'SLE_BSE_EX_RATE', 	type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["송금받을때"], 		ref: 'RCV_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["송금보낼때"], 		ref: 'SND_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["현찰팔때"], 			ref: 'SLE_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["현찰살때"], 			ref: 'BUY_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["T/C매도율"], 			ref: 'TC_SLE_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["대미환산율"], 		ref: 'USA_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 매입율"], 		ref: 'TT_BUY_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 매도율"], 		ref: 'TT_SLE_EX_RATE', 		type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 우대매입율"],	ref: 'TT_BUY_PRM_EX_RATE', 	type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["전신환 우대매도율"],	ref: 'TT_SLE_PRM_EX_RATE', 	type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["LIBOR 1개월"], 		ref: 'LIBOR_M1_EX_RATE', 	type: editType, width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["LIBOR 3개월"], 		ref: 'LIBOR_M3_EX_RATE', 	type: editType, width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["LIBOR 1년"], 		ref: 'LIBOR_Y1_EX_RATE', 	type: editType, width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["환가료 1년"], 		ref: 'EX_COM_Y1_EX_RATE', 	type: editType, width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["환가료 1개월"], 		ref: 'EX_COM_M1_EX_RATE', 	type: editType, width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["환가료 3개월"],		ref: 'EX_COM_M3_EX_RATE', 	type: editType, width: '120px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.0000000'}	
            },
            {caption: ["사용자 환율1"], 		ref: 'USER_EXCHANGE_RATE1', type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["사용자 환율2"], 		ref: 'USER_EXCHANGE_RATE2', type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}
            },
            {caption: ["사용자 환율3"], 		ref: 'USER_EXCHANGE_RATE3', type: editType, width: '100px', style: 'text-align:right',
            	format : {type:'number', rule:'#,##0.00'}	
            },
            {caption: ["데이타구분"], 		ref: 'DATA_TYPE', 			type: editType, width: '100px', style: 'text-align:left'},
            {caption: ["펌뱅킹서비스"],		ref: 'FBS_SERVICE', 		type: editType, width: '100px', style: 'text-align:left'},
            {caption: ["은행코드"], 			ref: 'BANK_CODE', 			type: editType, width: '100px', style: 'text-align:left'}
        ];
        _SBGrid.destroy('dailyDayGrid');
        dailyDayGrid = _SBGrid.create(SBGridProperties);
        dailyDayGrid.bind('click', 'fndailyDayGridData');
        
        data.forEach((item, index) => {
    		const msg = {
    				IMG						: item.IMG,
    				BASE_DATE				: item.BASE_DATE.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
    				CURRENCY_CODE			: item.CURRENCY_CODE,
    				BASE_CURRENCY			: item.BASE_CURRENCY,
    				EXCHANGE_BASE_SCALE		: item.EXCHANGE_BASE_SCALE,
    				RCV_EX_RATE				: item.RCV_EX_RATE,
    				SND_EX_RATE				: item.SND_EX_RATE,
    				SLE_EX_RATE				: item.SLE_EX_RATE,
    				BUY_EX_RATE				: item.BUY_EX_RATE,
    				TC_SLE_EX_RATE			: item.TC_SLE_EX_RATE,
    				SLE_BSE_EX_RATE			: item.SLE_BSE_EX_RATE,
    				USA_EX_RATE				: item.USA_EX_RATE,
    				AVG_EX_RATE				: item.AVG_EX_RATE,
    				USER_EXCHANGE_RATE1		: item.USER_EXCHANGE_RATE1,
    				USER_EXCHANGE_RATE2		: item.USER_EXCHANGE_RATE2,
    				USER_EXCHANGE_RATE3		: item.USER_EXCHANGE_RATE3,
    				TT_BUY_EX_RATE			: item.TT_BUY_EX_RATE,
    				TT_SLE_EX_RATE			: item.TT_SLE_EX_RATE,
    				TT_BUY_PRM_EX_RATE		: item.TT_BUY_PRM_EX_RATE,
    				TT_SLE_PRM_EX_RATE		: item.TT_SLE_PRM_EX_RATE,
    				LIBOR_M1_EX_RATE		: item.LIBOR_M1_EX_RATE,
    				LIBOR_M3_EX_RATE		: item.LIBOR_M3_EX_RATE,
    				LIBOR_Y1_EX_RATE		: item.LIBOR_Y1_EX_RATE,
    				EX_COM_Y1_EX_RATE		: item.EX_COM_Y1_EX_RATE,
    				EX_COM_M1_EX_RATE		: item.EX_COM_M1_EX_RATE,
    				EX_COM_M3_EX_RATE		: item.EX_COM_M3_EX_RATE,
    				DATA_TYPE				: item.DATA_TYPE,
    				DATA_TYPE2				: item.DATA_TYPE2,
    				FBS_YN					: item.FBS_YN,
    				FBS_SERVICE				: item.FBS_SERVICE,
    				EXCHANGE_SEQ			: item.EXCHANGE_SEQ,
    				REMARK					: item.REMARK
    		}
			jsonDailyDayList.push(msg);
		});
        dailyDayGrid.rebuild();
        
    }
    
    var fn_mailingList = function() {
    	SBUxMethod.attr('modal-comPopCom5500', 'header-title', '메일링 리스트');
    	com5500Popup({
    		contact_group			: 'EXCHANGE_RATE'
    		,comp_code				: gv_ma_selectedCorpCd
    		,client_code			: gv_ma_selectedClntCd
    	});
    }

    const fn_currencyData = async function(){
		/*
			1. api 호출하여 데이터 가져오기
			2. 가져온 데이터와 그리드 비교하여 저장
			3. 저장한 데이터 3210Q 프로시저로 그리드 그리기
		*/
		var listData 	= [];
		var data 		= [
			{
			    "CUR_UNIT": "USD",
			    "YY_EFEE_R": "4.42000",
			    "MM_EFEE_R": "3.19000",
			    "TTB": "556.24",
			    "TTS": "525.44",
			    "KFTC_DEAL_BAS_R": "540.84"
			}
			,{
			    "CUR_UNIT": "JPY",
			    "YY_EFEE_R": "0",
			    "MM_EFEE_R": "0",
			    "TTB": "613.96",
			    "TTS": "613.96",
			    "KFTC_DEAL_BAS_R": "613.96"
			}
			,{
			    "CUR_UNIT": "EUR",
			    "YY_EFEE_R": "1.5",
			    "MM_EFEE_R": "2.5",
			    "TTB": "1500.15",
			    "TTS": "1500.15",
			    "KFTC_DEAL_BAS_R": "1500.15"
			}
    	]
    	var dayGridData = dailyDayGrid.getGridDataAll();
		for(var i=0; dayGridData.length > i; i ++){
			for(var j=0; data.length > j; j++){
				if(dayGridData[i].CURRENCY_CODE == data[j].CUR_UNIT && dayGridData[i].BASE_DATE.replaceAll('-','') == gfn_dateToYmd(new Date()) ){
		            const param = {
		                    cv_count: '0',
		                    getType: 'json',
		                    rownum: i+1,
		                    workType: 'U',
		                    params: gfnma_objectToString({
		                    	    V_P_DEBUG_MODE_YN        : ""
	                    		   ,V_P_LANG_ID              : ""
	                    		   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
	                    		   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
	                    		   ,V_P_BASE_CURRENCY        : gfn_nvl(dayGridData[i].BASE_CURRENCY)
	                    		   ,V_P_BASE_DATE            : gfn_nvl(dayGridData[i].BASE_DATE).replaceAll('-','')
	                    		   ,V_P_CURRENCY_CODE        : gfn_nvl(data[j].CUR_UNIT)
	                    		   ,V_P_EXCHANGE_SEQ         : gfn_nvl(dayGridData[i].EXCHANGE_SEQ) == "" ? $('#SRCH_EXCHANGE_SEQ_P').val() : gfn_nvl(dayGridData[i].EXCHANGE_SEQ)
	                    		   ,V_P_RCV_EX_RATE          : gfn_nvl(dayGridData[i].RCV_EX_RATE)
	                    		   ,V_P_SND_EX_RATE          : gfn_nvl(dayGridData[i].SND_EX_RATE)
	                    		   ,V_P_SLE_EX_RATE          : gfn_nvl(dayGridData[i].SLE_EX_RATE)
	                    		   ,V_P_BUY_EX_RATE          : gfn_nvl(dayGridData[i].BUY_EX_RATE)
	                    		   ,V_P_TC_SLE_EX_RATE       : gfn_nvl(dayGridData[i].TT_SLE_EX_RATE)
	                    		   ,V_P_SLE_BSE_EX_RATE      : gfn_nvl(data[j].KFTC_DEAL_BAS_R.replace(/,/g, "&&&"))
	                    		   ,V_P_USA_EX_RATE          : gfn_nvl(dayGridData[i].USA_EX_RATE)
	                    		   ,V_P_AVG_EX_RATE          : gfn_nvl(dayGridData[i].AVG_EX_RATE)
	                    		   ,V_P_USER_EXCHANGE_RATE1  : gfn_nvl(dayGridData[i].USER_EXCHANGE_RATE1)
	                    		   ,V_P_USER_EXCHANGE_RATE2  : gfn_nvl(dayGridData[i].USER_EXCHANGE_RATE2)
	                    		   ,V_P_USER_EXCHANGE_RATE3  : gfn_nvl(dayGridData[i].USER_EXCHANGE_RATE3)
	                    		   ,V_P_TT_BUY_EX_RATE       : gfn_nvl(data[j].TTB.replace(/,/g, "&&&"))
	                    		   ,V_P_TT_SLE_EX_RATE       : gfn_nvl(data[j].TTS.replace(/,/g, "&&&"))
	                    		   ,V_P_TT_BUY_PRM_EX_RATE   : gfn_nvl(dayGridData[i].TT_BUY_PRM_EX_RATE)
	                    		   ,V_P_TT_SLE_PRM_EX_RATE   : gfn_nvl(dayGridData[i].TT_SLE_PRM_EX_RATE)
	                    		   ,V_P_LIBOR_M1_EX_RATE     : gfn_nvl(dayGridData[i].LIBOR_M1_EX_RATE)
	                    		   ,V_P_LIBOR_M3_EX_RATE     : gfn_nvl(dayGridData[i].LIBOR_M3_EX_RATE)
	                    		   ,V_P_LIBOR_Y1_EX_RATE     : gfn_nvl(dayGridData[i].LIBOR_Y1_EX_RATE)
	                    		   ,V_P_EX_COM_Y1_EX_RATE    : gfn_nvl(data[j].YY_EFEE_R.replace(/,/g, "&&&"))
	                    		   ,V_P_EX_COM_M1_EX_RATE    : gfn_nvl(data[j].MM_EFEE_R.replace(/,/g, "&&&"))
	                    		   ,V_P_EX_COM_M3_EX_RATE    : gfn_nvl(dayGridData[i].EX_COM_M3_EX_RATE)
	                    		   ,V_P_REMARK               : gfn_nvl(dayGridData[i].REMARK)
	                    		   ,V_P_FORM_ID              : p_formId
	                    		   ,V_P_MENU_ID              : p_menuId
	                    		   ,V_P_PROC_ID              : ""
	                    		   ,V_P_USERID               : p_userId
	                    		   ,V_P_PC                   : ""
	                    })
	                }
				listData.push(param);
				}
			}
		}
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/co/sys/cur/insertCom3210_S1.do", {listData: listData});
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    fn_search('TAB_DAILY');
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
    
    const fndailyDayGridData = async function(){
    	var nCol = dailyDayGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = dailyDayGrid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = dailyDayGrid.getRowData(nRow);
    }
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>

</html>