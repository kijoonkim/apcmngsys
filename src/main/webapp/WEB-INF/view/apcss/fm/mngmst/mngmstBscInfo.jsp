<%
 /**
  * @Class Name : mngmstBscInfo.jsp
  * @Description : 경영체정보 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호		최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 경영체정보 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 5%">
					<col style="width: 6%">
					<col style="width: 5%">
					<col style="width: 6%">
					<col style="width: 5%">
					<col style="width: 6%">
					<col style="width: 6%">
					<col style="width: 3%">
					<col style="width: 3%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" scope="row" style="border-bottom:1px solid white " >시도</th>
						<td class="td_input"class="td_input" style="border-right:hidden;">
							<sbux-select class="form-control input-sm" id="srch-slt-test1 name="srch-slt-sysId" uitype="single" jsondata-ref="jsonComSysId" unselected-text="선택"></sbux-select>
						</td>

						<th class="th_bg" scope="row" style="border-bottom:1px solid white " >품목</th>
						<td class="td_input"class="td_input"  style="border-right: hidden;">
							<sbux-select class="form-control input-sm" id="srch-slt-test3" name="srch-slt-sysId" uitype="single" jsondata-ref="jsonComSysId" unselected-text="선택"></sbux-select>
						</td>
						<th class="th_bg" style="border-bottom:1px solid white " >읍면동</th>
						<td class="td_input"style="border-right:hidden;">
							<sbux-select class="form-control input-sm" id="srch-slt-test2" name="srch-slt-sysId" uitype="single" jsondata-ref="jsonComSysId" unselected-text="선택"></sbux-select>
						</td>
						<td class="td_input"colspan="3"></td>
					</tr>
					<tr>
						<th class="th_bg" scope="row" style="border-bottom:1px solid white " >고유번호</th>
						<td class="td_input"colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
						</td>

						<th class="th_bg" scope="row" style="border-bottom:1px solid white " >사업자명(업체명)</th>
						<td class="td_input"colspan="2" class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-warehouse" name="srch-inp-warehouse" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td class="td_input"colspan="2"></td>
					</tr>
					<tr>
						<th class="th_bg" scope="row" style="border-bottom:1px solid white " >등록일</th>
						<td class="td_input"class="td_input" style="border-right:hidden;">
							<sbux-datepicker id="dtp-test1" name="dtp-test1" uitype="popup" class="form-control input-sm"></sbux-datepicker>
						</td>

						<th class="th_bg" scope="row" style="border-bottom:1px solid white " >등록구분</th>
						<td class="td_input"class="td_input"  style="border-right: hidden;">
							<sbux-select class="form-control input-sm" id="srch-slt-test4" name="srch-slt-sysId" uitype="single" jsondata-ref="jsonComSysId" unselected-text="선택"></sbux-select>
						</td>
						<th class="th_bg" style="border-bottom:1px solid white " >주소구분</th>
						<td class="td_input"style="border-right:hidden;" colspan="3">
							<p class="ad_input_row">
								<sbux-radio id="rdo-test_1" name="rdo-wrhsSeCd" uitype="normal" class="radio_label" value="1"></sbux-radio>
								<sbux-label class="radio_label" for-id="rdo-wrhsSeCd_1" text="주민등록주소"></sbux-label>
							</p>
							<p class="ad_input_row">
								<sbux-radio id="rdo-test_2" name="rdo-wrhsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
								<sbux-label class="radio_label" for-id="rdo-wrhsSeCd_2" text="주민등록주소"></sbux-label>
							</p>								<p class="ad_input_row">
								<sbux-radio id="rdo-test_3" name="rdo-wrhsSeCd" uitype="normal" class="radio_label" value="3" checked></sbux-radio>
								<sbux-label class="radio_label" for-id="rdo-wrhsSeCd_3" text="사업장소재지"></sbux-label>
							</p>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>
					<br>
				<div><label>경영체 정보 상세</label></div>

			<div>
				<table class="table table-bordered table-hover tbl_col tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 9%">
					<col style="width: 12%">
					<col style="width: 18%">
					<col style="width: 18%">
					<col style="width: 20%">
					<col style="width: 20%">
					<col style="width: 16%">
					<col style="width: 3%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" colspan="2">성명</th>
						<td class="td_input"colspan="1" style="border-right: hidden;">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input"colspan="5"></td>
					</tr>
					<tr>
						<th class="th_bg" rowspan="2" style="border: 1px solid #ffffff; border: solid;  !important;">연락처</th>
						<th class="th_bg">전화번호</th>
						<td class="td_input" style="border-right: hidden;" colspan="1">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input"colspan="5"></td>
					</tr>
					<tr>
						<th class="th_bg">휴대폰번호</th>
						<td class="td_input"colspan="1"  style="border-right: hidden;">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input"colspan="6"></td>
					</tr>
					<tr>
						<th class="th_bg" rowspan="3">주민등록주소</th>
						<th class="th_bg">도로명</th>
						<td class="td_input"colspan="1"  style="border-right: hidden;">
							<div style="display: flex;">
								<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								<sbux-button id="btn-srch-addr" name="btn-srch-addr" uitype="normal" text="주소검색" class="btn btn-xs btn-outline-danger"></sbux-button>
							</div>
						</td>
						<td class="td_input"colspan="1" style="border-right: hidden;">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input"colspan="4">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>

					<tr>
						<th class="th_bg">법정동</th>
						<td class="td_input"style="border-right: hidden;">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input"colspan="5" style="border-right: hidden;">
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>

					<tr>
						<th class="th_bg">관할읍면동</th>
						<td class="td_input"style="border-right: hidden;">
							<sbux-select id="dtl-slt-grdCd" name="dtl-slt-grdCd" uitype="single" jsondata-ref="jsonApcGrd" unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td class="td_input"colspan="5"></td>
					</tr>
					<tr>
						<th class="th_bg" rowspan="3">영농이력</th>

						<th class="th_bg">농업시작형태</th>
						<td class="td_input"colspan="1" style="border-right: hidden;">
                            <sbux-radio id="radioName1" name="radioName1" uitype="normal"  jsondata-ref="jsonRadioData" text-right-padding="10px"></sbux-radio>
						</td>
						<td class="td_input"colspan="5"></td>
					</tr>
					<tr>
						<th class="th_bg">농업종사형태</th>
						<td class="td_input"colspan="1" style="border-right: hidden;">
	                        <sbux-radio id="radioName2" name="radioName2" uitype="normal"  jsondata-ref="jsonRadioData1" text-right-padding="10px"></sbux-radio>
						</td>
						<td class="td_input"colspan="5"></td>
					</tr>
					<tr>
						<th class="th_bg">농업시작연도</th>
						<td class="td_input"colspan="1" style="border-right: hidden;">
							<div style="display: flex;">
								<sbux-input id="srch-inp-opera6" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="주소 검색하여 작성" ></sbux-input>
								<label style="line-height: 2.5em">&nbsp; 년</label>
							</div>
						</td>
						<td class="td_input"colspan="5"></td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			</div>
			<div style="display:flex; justify-content: flex-start;">
				<div><label>⊙경영주 외 농업인</label></div>
				<div style="margin-left: auto;"><sbux-button id="btn-dtl-farmer" name="btn-dtl-farmer" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button></div>
			</div>

			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<colgroup>
					</colgroup>
					<thead>
						<tr>
							<th class="th_bg">삭제/복원</th>
							<th class="th_bg">번호</th>
							<th class="th_bg">성명</th>
							<th class="th_bg">생년월일</th>
							<th class="th_bg">경영주와의 관계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<sbux-button id="btn-srch-addr2" name="btn-srch-addr2" uitype="normal" text="삭제" class="btn btn-xs btn-outline-danger"></sbux-button>
							</td>
							<td>1</td>
							<td>홍길동</td>
							<td>880850</td>
							<td>
                                <sbux-select id="comBoType1" name="comBoType1" uitype="single" jsondata-ref="jsonComboType1" onChange="selectChange(comBoType)"
                                        			 unselected-text="선택" style="width:100%"></sbux-select>
							</td>
						</tr>
						<tr>
							<td>
								<sbux-button id="btn-srch-addr3" name="btn-srch-addr3" uitype="normal" text="삭제" class="btn btn-xs btn-outline-danger"></sbux-button>
							</td>
							<td>2</td>
							<td>김태동</td>
							<td>710202</td>
							<td>
								<sbux-select id="comBoType2" name="comBoType2" uitype="single" jsondata-ref="jsonComboType2" onChange="selectChange(comBoType)"
                                        			 unselected-text="선택" style="width:100%"></sbux-select>
							</td>
						</tr>

					</tbody>
				</table>

			</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
        <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<!--<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>-->
    </div>
</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_createGrid();

    	gfn_setComCdSBSelect(
    			['srch-select-msgKnd', 'dtl-select-msgKnd'],
    			jsonComMsgKnd,
			'MSG_KND');
    });

	var jsonRadioData = [
		{'text': '전 생에 농업에 종사', 'value': 'AM'},
		{'text': '다른 산업에서 전환', 'value': 'AM'},
	]
	var jsonRadioData1 = [
		{'text': '전업', 'value': 'AM'},
		{'text': '겸업', 'value': 'AM'},
	]

	var jsonComboType1 = [
		{'text': '고용인', 'value': 'AM'},
]
	var jsonComboType2 = [
		{'text': '고용인', 'value': 'APM'},
]

    //grid 초기화
    var grdComMsgList; // 그리드를 담기위한 객체 선언
    var jsonComMsgList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdComMsgList';
	    SBGridProperties.jsonref = 'jsonComMsgList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["성명"],	ref: 'msgKey',      type:'output',  width:'30%',    style:'text-align:center'},
            {caption: ["농업종사형태"], 	ref: 'msgCn',     	type:'output',  width:'50%',    style:'text-align:left'},
            {caption: ["농업시작년도"],  	ref: 'msgKndNm',    type:'output',  width:'20%',    style:'text-align:center'},
            {caption: ["비고"],      	ref: 'rmrk',        type:'output',  hidden: true},
            {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"], ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}
        ];

        grdComMsgList = _SBGrid.create(SBGridProperties);
        grdComMsgList.bind('click', 'fn_view');
        grdComMsgList.bind('beforepagechanged', 'fn_pagingComMsgList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdComMsgList.getPageSize();
    	let pageNo = 1;

    	fn_setGrdComMsgList(pageSize, pageNo);
    }

    /**
     *
     */
    const fn_pagingComMsgList = async function() {
    	let recordCountPerPage = grdComMsgList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdComMsgList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdComMsgList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdComMsgList = async function(pageSize, pageNo) {

    	// form clear
    	fn_clearForm();

		grdComMsgList.clearStatus();

		let msgKnd = SBUxMethod.get("srch-select-msgKnd");
		let msgKey = SBUxMethod.get("srch-input-msgKey");
		let msgCn = SBUxMethod.get("srch-input-msgCn");

        const postJsonPromise = gfn_postJSON("/fm/mngmst/selectMngmstBscInfoList.do", {
        	msgKnd: msgKnd,
        	msgKey: msgKey,
        	msgCn: msgCn,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
		});

        const data = await postJsonPromise;

        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonComMsgList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					msgKey: item.msgKey,
					msgCn: item.msgCn,
					msgKnd: item.msgKnd,
					msgKndNm: item.msgKndNm,
					rmrk: item.rmrk,
					sysFrstInptDt: item.sysFrstInptDt,
					sysFrstInptUserId: item.sysFrstInptUserId,
					sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,
					sysLastChgDt: item.sysLastChgDt,
					sysLastChgUserId: item.sysLastChgUserId,
					sysLastChgPrgrmId: item.sysLastChgPrgrmId
				}
				jsonComMsgList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonComMsgList.length > 0) {

        		if(grdComMsgList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdComMsgList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdComMsgList.rebuild();
				}else{
					grdComMsgList.refresh()
				}
        	} else {
        		grdComMsgList.setPageTotalCount(totalRecordCount);
        		grdComMsgList.rebuild();
        	}

        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }


    //신규 작성
    function fn_create() {
    	SBUxMethod.set("dtl-input-orgnMsgKey", null);
    	SBUxMethod.set("dtl-select-msgKnd", null);
        SBUxMethod.set("dtl-input-msgKey", null);
        SBUxMethod.attr("dtl-input-msgKey", "readonly", false);
        SBUxMethod.set("dtl-input-msgCn", null);
        SBUxMethod.set("dtl-input-rmrk", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("dtl-input-orgnMsgKey", null);
    	SBUxMethod.set("dtl-select-msgKnd", null);
        SBUxMethod.set("dtl-input-msgKey", null);
        SBUxMethod.attr("dtl-input-msgKey", "readonly", true);
        SBUxMethod.set("dtl-input-msgCn", null);
        SBUxMethod.set("dtl-input-rmrk", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }

    //저장
    const fn_save = async function() {

    	let msgKey = SBUxMethod.get("dtl-input-orgnMsgKey");

    	if (!SBUxMethod.get("dtl-select-msgKnd")) {
            alert("메시지종류를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-msgKey")) {
            alert("메시지Key를 입력하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-msgCn")) {
            alert("메시지내용을 입력하세요.");
            return;
        }

    	/*
        SBUxMethod.set("dtl-input-orgnMsgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgKnd", rowData.msgKnd);
        SBUxMethod.set("dtl-input-msgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgCn", rowData.msgCn);
        SBUxMethod.set("dtl-input-rmrk", rowData.rmrk);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
    	 */
    	if (gfn_isEmpty(msgKey)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (isConfirmed){

    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/mngmst/insertMngmstBscInfo.do", {
			msgKey: SBUxMethod.get('dtl-input-msgKey'),
			msgKnd: SBUxMethod.get('dtl-select-msgKnd'),
			msgCn: SBUxMethod.get('dtl-input-msgCn'),
			rmrk: SBUxMethod.get('dtl-input-rmrk')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }

        // 결과 확인 후 재조회
        console.log("insert result", data);
    }

	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){

		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/mngmst/updateMngmstBscInfo.do", {
			msgKey: SBUxMethod.get('dtl-input-orgnMsgKey'),
			msgKnd: SBUxMethod.get('dtl-select-msgKnd'),
			msgCn: SBUxMethod.get('dtl-input-msgCn'),
			rmrk: SBUxMethod.get('dtl-input-rmrk')
		});

        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }

        // 결과 확인 후 재조회
        console.log("update result", data);
    }


    //선택 삭제
    function fn_delete() {

    	/**
         * @type {any[]}
         */
        let list = [];

        /**
         * @type {any[]}
         */
        const rows = grdComMsgList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({msgKey: row.msgKey});
        	}
        });

        if (list.length == 0) {
        	alert("삭제할 대상이 없습니다.");
        	return;
        }

        fn_subDelete(confirm("삭제 하시겠습니까?"), list);

        /*
        for ( let i = 0; i < gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].msgKey);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg;
        if (delList.length == 1) {
            delMsg = delList[0];
        }
        else {
            delMsg = delList.length + "건";
        }
        delMsg += "을 삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delKey=" + delList.join(",");
            console.log("data ::::: " + params);
        }
        */
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){

 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/mngmst/deleteMngmstBscInfoList.do", list);

         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
         		alert("처리 되었습니다.");
         		fn_search();
         	} else {
         		alert(data.resultMessage);
         	}
         } catch(e) {
         }

         // 결과 확인 후 재조회
         console.log("update result", data);
    }

    //상세정보 보기
    function fn_view() {

    	var nCol = grdComMsgList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdComMsgList.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = grdComMsgList.getRowData(nRow);

        SBUxMethod.set("dtl-input-orgnMsgKey", rowData.msgKey);
        SBUxMethod.set("dtl-select-msgKnd", rowData.msgKnd);
        SBUxMethod.set("dtl-input-msgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgCn", rowData.msgCn);
        SBUxMethod.set("dtl-input-rmrk", rowData.rmrk);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdComMsgList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdComMsgList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

</script>

</html>