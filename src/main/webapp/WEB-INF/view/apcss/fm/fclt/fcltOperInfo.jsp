
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title" style="line-height: 30px;"> ▶ 운영자개요</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
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
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-apcCd" name="srch-btn-apcCd" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-trgtYr" name="srch-inp-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td colspan="5"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<br>


			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>
				<br>
					<div><label>운영자개요 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 34%">
					<col style="width: 60%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">
					<col style="width: 0.5%">

				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<th colspan="17">내용</th>
					</tr>
					<tr>
						<th>소유조직</th>
						<td colspan="17">
							<sbux-input id="sdtl-input-psnOgnzNm" name="dtl-input-psnOgnzNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>소유조직 사업자번호</th>
						<td colspan="17">
							<sbux-input id="dtl-input-psnOgnzBrno" name="dtl-input-psnOgnzBrno" uitype="text" class="form-control input-sm" placeholder="소유자가 지자체로 사업자번호 없을 경우 공란" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzNm" name="dtl-input-operOgnzNm" uitype="text" class="form-control input-sm" placeholder="최초 페이 내용 그대로 끌어오기" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직사업자번호</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzBrno" name="dtl-input-operOgnzBrno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 대표자</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzRprsv" name="dtl-input-operOgnzRprsv" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 주소</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzAddr" name="dtl-input-operOgnzAddr" uitype="text" class="form-control input-sm" placeholder="주소 검색하여 작성" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 조직유형</th>
						<td colspan="17">
							<sbux-input id="srch-inp-opera7" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="생산유통통합조직(승인함),생산유통통합조직(육성형),생산유통통합조직(승인형)-출자출하조직, 생산유통통합조직(육성형)-출자출하조직,개별조직" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 취급 대표품목1</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzTrmtItemCn" name="dtl-input-operOgnzTrmtItemCn" uitype="text" class="form-control input-sm" placeholder="운영조직 취급액 중 가장많은 품목 1
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 취급 대표품목2</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzTrmtItemCn2" name="dtl-input-operOgnzTrmtItemCn2" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / 운영조직 취급액 중 가장많은 품목 2
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 취급 대표품목3</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzTrmtItemCn3" name="dtl-input-operOgnzTrmtItemCn3" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / 운영조직 취급액 중 가장많은 품목 3
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>운영조직 취급 기타품목</th>
						<td colspan="17">
							<sbux-input id="dtl-input-operOgnzTrmtItemCn4" name="dtl-input-operOgnzTrmtItemCn4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>APC명</th>
						<td colspan="17">
							<sbux-input id="dtl-select-apcNm" name="dtl-select-apcNm" uitype="text" class="form-control input-sm" placeholder="최초 페이지 내용 그대로 끌어오기
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>APC 사업자번호</th>
						<td colspan="17">
							<sbux-input id="dtl-input-apcBrno" name="dtl-input-apcBrno" uitype="text" class="form-control input-sm" placeholder="사업자번호 없을 경우 공란
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>APC 주소</th>
						<td colspan="17">
							<sbux-input id="dtl-input-apcAddr" name="dtl-input-apcAddr" uitype="text" class="form-control input-sm" placeholder="주소 검색하여 작성
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>APC 처리 대표품목1</th>
						<td colspan="17">
							<sbux-input id="srch-inp-opera15" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="APC 취급액 중 가장많은 품목 1
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>APC 처리 대표품목2</th>
						<td colspan="17">
							<sbux-input id="srch-inp-opera16" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / APC 취급액 중 가장많은 품목 2
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>APC 처리 대표품목3</th>
						<td colspan="17">
							<sbux-input id="srch-inp-opera17" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="“해당없음” 옵션 추가 / APC 취급액 중 가장많은 품목 3
							" ></sbux-input>
						</td>
					</tr>
					<tr style=" border-bottom: solid;">
						<th>APC 처리 기타품목명</th>
						<td colspan="17">
							<sbux-input  id="srch-inp-opera18" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력
							" ></sbux-input>
						</td>
					<tr>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력1
							" ></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-trgtYr" name="srch-inp-trgtYr" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-daddr" name="srch-inp-daddr" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-apcRgnCd" name="srch-inp-apcRgnCd"" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-psnOgnzCd" name="srch-inp-psnOgnzCd"" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-operOgnzCd" name="srch-inp-operOgnzCd" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-operOgnzDeptCd" name="srch-inp-operOgnzDeptCd" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-apcTrmtItemCd" name="srch-inp-apcTrmtItemCd" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-apcTrmtItemCn" name="srch-inp-apcTrmtItemCn" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-delYn" name="srch-inp-delYn" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-sysFrstInptUserId" name="srch-inp-sysFrstInptUserId" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-sysLastChgUserId" name="srch-inp-sysLastChgUserId" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-sysFrstInptDt" name="srch-inp-sysFrstInptDt" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-sysLastChgDt" name="srch-inp-sysLastChgDt"" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="1" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-sysFrstInptPrgrmId" name="srch-inp-sysFrstInptPrgrmId" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
						</td>
						<td colspan="3" style=" border: hidden;">
							<sbux-input  style="border: hidden; input type="hidden" id="srch-inp-sysLastChgPrgrmId" name="srch-inp-sysLastChgPrgrmId" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력2
							"></sbux-input>
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
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>


</body>
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

    //grid 초기화
    var grdFcltOperInfoList; // 그리드를 담기위한 객체 선언
    var jsonFcltOperInfoList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdFcltOperInfoList';
	    SBGridProperties.jsonref = 'jsonFcltOperInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [


            {caption: ["소유조직"],	    ref: 'psnOgnzNm',      type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["대표품목1"], 	ref: 'operOgnzTrmtItemCn1',     	type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["대표품목2"],  	ref: 'operOgnzTrmtItemCn2',    type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["대표품목3"],   ref: 'operOgnzTrmtItemCn3',    type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["기타품목"],	    ref: 'operOgnzTrmtItemCn4',   type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["Apc명"],		ref: 'apcNm',           type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["운영조직대표자"],	ref: 'operOgnzRprsv',   type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["최초등록자ID"],	ref: 'apcCd',           type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'trgtYr',           type:'output',  hidden: true},
            {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}

        ];

        grdFcltOperInfoList = _SBGrid.create(SBGridProperties);
        grdFcltOperInfoList.bind('click', 'fn_view');
        grdFcltOperInfoList.bind('beforepagechanged', 'fn_pagingFcltOperInfoList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdFcltOperInfoList.getPageSize();
    	let pageNo = 1;

    	fn_setGrdFcltOperInfoList(pageSize, pageNo);
    }

    /**
     *
     */
    const fn_pagingFcltOperInfoList = async function() {
    	let recordCountPerPage = grdFcltOperInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdFcltOperInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltOperInfoList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
 	console.log("b222222222222222222");
    const fn_setGrdFcltOperInfoList = async function(pageSize, pageNo) {

    	// form clear
    	fn_clearForm();

		grdFcltOperInfoList.clearStatus();

		let apcCd = SBUxMethod.get("srch-input-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

        const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
        	apcCd: apcCd,
        	trgtYr: trgtYr,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize

        });
		console.log("a11111111111111");
        const data = await postJsonPromise;

        console.log("---------------------------")
        console.log(data)


        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonFcltOperInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const operInfoClctAgreInfo = {
		        	psnOgnzNmItemCn1: item.psnOgnzNm,
		        	operOgnzTrmtItemCn1: item.operOgnzTrmtItemCn1,
		        	operOgnzTrmtItemCn2: item.operOgnzTrmtItemCn2,
		        	operOgnzTrmtItemCn3: item.operOgnzTrmtItemCn3,
		        	operOgnzTrmtItemCn4: item.operOgnzTrmtItemCn4,
					sysFrstInptDt: item.sysFrstInptDt,
					sysFrstInptUserId: item.sysFrstInptUserId,
					sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,
					sysLastChgDt: item.sysLastChgDt,
					sysLastChgUserId: item.sysLastChgUserId,
					sysLastChgPrgrmId: item.sysLastChgPrgrmId
				}
				jsonFcltOperInfoList.push(operInfoClctAgreInfo);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonFcltOperInfoList.length > 0) {

        		if(grdFcltOperInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdFcltOperInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdFcltOperInfoList.rebuild();
				}else{
					grdFcltOperInfoList.refresh()
				}
        	} else {
        		grdFcltOperInfoList.setPageTotalCount(totalRecordCount);
        		grdFcltOperInfoList.rebuild();
        	}

        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		//console.error("failed", e.message);
        }
    }
   	console.log("d4444444444444444444444444444");


    //신규 작성
    function fn_create() {
    	SBUxMethod.set("dtl-input-apcCd", null);
    	SBUxMethod.set("dtl-input-trgtYr", null);
       	SBUxMethod.set("dtl-input-daddr", null);
    	SBUxMethod.set("dtl-input-apcBrno", null);
    	SBUxMethod.set("dtl-input-apcRgnCd", null);
    	SBUxMethod.set("dtl-select-apcNm", null);
        SBUxMethod.set("dtl-input-apcAddr", null);
        SBUxMethod.set("dtl-input-psnOgnzCd", null);
        SBUxMethod.set("dtl-input-psnOgnzNm", null);
        SBUxMethod.set("dtl-input-psnOgnzBrno", null);
        SBUxMethod.set("dtl-input-operOgnzCd", null);
        SBUxMethod.set("dtl-input-operOgnzNm", null);
        SBUxMethod.set("dtl-input-operOgnzBrno", null);
        SBUxMethod.set("dtl-input-operOgnzRprsv", null);
        SBUxMethod.set("dtl-input-operOgnzAddr", null);
        SBUxMethod.set("dtl-input-operOgnzDeptCd", null);
        SBUxMethod.set("dtl-input-operOgnzDeptNm", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCd", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCd", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCn", null);
        SBUxMethod.set("dtl-input-delYn", false);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }
     const fn_clearForm = function() {
     	SBUxMethod.set("dtl-input-apcCd", null);
    	SBUxMethod.set("dtl-input-trgtYr", null);
       	SBUxMethod.set("dtl-input-daddr", null);
    	SBUxMethod.set("dtl-input-apcBrno", null);
    	SBUxMethod.set("dtl-input-apcRgnCd", null);
    	SBUxMethod.set("dtl-select-apcNm", null);
        SBUxMethod.set("dtl-input-apcAddr", null);
        SBUxMethod.set("dtl-input-psnOgnzCd", null);
        SBUxMethod.set("dtl-input-psnOgnzNm", null);
        SBUxMethod.set("dtl-input-psnOgnzBrno", null);
        SBUxMethod.set("dtl-input-operOgnzCd", null);
        SBUxMethod.set("dtl-input-operOgnzNm", null);
        SBUxMethod.set("dtl-input-operOgnzBrno", null);
        SBUxMethod.set("dtl-input-operOgnzRprsv", null);
        SBUxMethod.set("dtl-input-operOgnzAddr", null);
        SBUxMethod.set("dtl-input-operOgnzDeptCd", null);
        SBUxMethod.set("dtl-input-operOgnzDeptNm", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCd", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCd", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCn", null);
        SBUxMethod.set("dtl-input-delYn", null);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);
        SBUxMethod.set("dtl-input-sysLastChgDt", null);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);
    }



    //저장
    const fn_save = async function() {

    	let msgKey = SBUxMethod.get("dtl-input-apcCd");



    	if (!SBUxMethod.get("dtl-input-operOgnzNm")) {
            alert("운영조직명을 입력하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-operOgnzBrno")) {
            alert("운영조직사업자번호를 입력하세요.");
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
    	fn_subInsert(confirm("등록 하시겠습니까?"));

    	if (gfn_isEmpty(apcCd)) {
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperInfo.do", {
        	apcCd: '23',
        	trgtYr: SBUxMethod.get('srch-inp-trgtYr'),
        	daddr: '1',
        	apcBrno: SBUxMethod.get('dtl-input-apcBrno'),
        	apcRgnCd: '2',
        	apcNm: SBUxMethod.get('dtl-select-apcNm'),
        	apcAddr: SBUxMethod.get('dtl-input-apcAddr'),
        	psnOgnzCd: '3',
        	psnOgnzNm: SBUxMethod.get('dtl-input-psnOgnzNm'),
        	psnOgnzBrno: SBUxMethod.get('dtl-input-psnOgnzBrno'),
        	operOgnzCd: '4',
        	operOgnzNm: SBUxMethod.get('dtl-input-operOgnzNm'),
        	operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzBrno'),
        	operOgnzRprsv: SBUxMethod.get('dtl-input-operOgnzRprsv'),
        	operOgnzAddr: SBUxMethod.get('dtl-input-operOgnzAddr'),
        	operOgnzDeptCd: '5',
        	operOgnzDeptNm: SBUxMethod.get('dtl-input-operOgnzDeptNm'),
        	operOgnzTrmtItemCd: SBUxMethod.get('dtl-input-operOgnzTrmtItemCd'),
        	operOgnzTrmtItemCn: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn'),
        	apcTrmtItemCd: SBUxMethod.get('dtl-input-apcTrmtItemCd'),
        	apcTrmtItemCn: '6',
        	delYn: 'N',
        	sysFrstInptUserId: '7',
        	operOgnzPic:'1231',
        	apcTrmtItemCn: SBUxMethod.get('dtl-input-apcTrmtItemCn'),
        	sysLastChgUserId: '8',
        	sysLastChgDt: 'sysdate',
        	sysFrstInptDt: 'sysdate',
        	sysLastInptDt: 'sysdate',
        	sysFrstInptPrgrmId: '9',
        	sysLastChgPrgrmId: '10'
		});
    var postVal = {
    		apcCd: '23',
        	trgtYr: '2023',
        	daddr: '45',
        	delYn: 'Y'
        	/*
        	apcBrno: SBUxMethod.get('dtl-input-apcBrno'),
        	apcRgnCd: SBUxMethod.get('dtl-input-apcRgnCd'),
        	apcNm: SBUxMethod.get('dtl-select-apcNm'),
        	apcAddr: SBUxMethod.get('dtl-input-apcAddr'),
        	psnOgnzCd: SBUxMethod.get('dtl-input-psnOgnzCd'),
        	psnOgnzNm: SBUxMethod.get('dtl-input-psnOgnzNm'),
        	psnOgnzBrno: SBUxMethod.get('dtl-input-psnOgnzBrno'),
        	operOgnzCd: SBUxMethod.get('dtl-input-operOgnzCd'),
        	operOgnzNm: SBUxMethod.get('dtl-input-operOgnzNm'),
        	operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzBrno'),
        	operOgnzRprsv: SBUxMethod.get('dtl-input-operOgnzRprsv'),
        	operOgnzAddr: SBUxMethod.get('dtl-input-operOgnzAddr'),
        	operOgnzDeptCd: SBUxMethod.get('dtl-input-operOgnzDeptCd'),
        	operOgnzDeptNm: SBUxMethod.get('dtl-input-operOgnzDeptNm'),
        	operOgnzTrmtItemCd: SBUxMethod.get('dtl-input-operOgnzTrmtItemCd'),
        	operOgnzTrmtItemCn: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn'),
        	apcTrmtItemCd: SBUxMethod.get('dtl-input-apcTrmtItemCd'),
        	apcTrmtItemCn: SBUxMethod.get('dtl-input-apcTrmtItemCn'),

        	sysFrstInptUserId: SBUxMethod.get('dtl-input-sysFrstInptUserId'),
        	apcTrmtItemCn: SBUxMethod.get('dtl-input-apcTrmtItemCn'),
        	sysLastChgUserId: SBUxMethod.get('dtl-input-sysLastChgUserId'),
        	sysFrstInptDt: SBUxMethod.get('dtl-input-sysFrstInptDt'),
        	sysFrstInptPrgrmId: SBUxMethod.get('dtl-input-sysFrstInptPrgrmId'),
        	sysLastChgPrgrmId: SBUxMethod.get('dtl-input-sysLastChgPrgrmId')
        	*/

    }
	console.log(postVal);
	console.log("----------------------------");
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltOperInfo.do", {
			apcCd: SBUxMethod.get('dtl-input-apcCd'),
        	trgyYr: SBUxMethod.get('dtl-input-trgyYr'),
        	daddr: SBUxMethod.get('dtl-input-daddr'),
        	apcBrno: SBUxMethod.get('dtl-input-apcBrno'),
        	apcRgnCd: SBUxMethod.get('dtl-input-apcRgnCd'),
        	apcNm: SBUxMethod.get('dtl-select-apcNm'),
        	apcAddr: SBUxMethod.get('dtl-input-apcAddr'),
        	psnOgnzCd: SBUxMethod.get('dtl-input-psnOgnzCd'),
        	psnOgnzNm: SBUxMethod.get('dtl-input-psnOgnzNm'),
        	psnOgnzBrno: SBUxMethod.get('dtl-input-psnOgnzBrno'),
        	operOgnzCd: SBUxMethod.get('dtl-input-operOgnzCd'),
        	operOgnzNm: SBUxMethod.get('dtl-input-operOgnzNm'),
        	operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzBrno'),
        	operOgnzRprsv: SBUxMethod.get('dtl-input-operOgnzRprsv'),
        	operOgnzAddr: SBUxMethod.get('dtl-input-operOgnzAddr'),
        	operOgnzDeptCd: SBUxMethod.get('dtl-input-operOgnzDeptCd'),
        	operOgnzDeptNm: SBUxMethod.get('dtl-input-operOgnzDeptNm'),
        	operOgnzTrmtItemCd: SBUxMethod.get('dtl-input-operOgnzTrmtItemCd'),
        	operOgnzTrmtItemCn: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn'),
        	apcTrmtItemCd: SBUxMethod.get('dtl-input-apcTrmtItemCd'),
        	apcTrmtItemCn: SBUxMethod.get('dtl-input-apcTrmtItemCn'),
        	delYn: SBUxMethod.get('dtl-input-delYn'),
        	sysFrstInptUserId: SBUxMethod.get('dtl-input-sysFrstInptUserId'),
        	apcTrmtItemCn: SBUxMethod.get('dtl-input-apcTrmtItemCn'),
        	sysLastChgUserId: SBUxMethod.get('dtl-input-sysLastChgUserId'),
        	sysFrstInptDt: SBUxMethod.get('dtl-input-sysFrstInptDt'),
        	sysLastChgDt: SBUxMethod.get('dtl-input-sysLastChgDt'),
        	sysFrstInptPrgrmId: SBUxMethod.get('dtl-input-sysFrstInptPrgrmId'),
        	sysLastChgPrgrmId: SBUxMethod.get('dtl-input-sysLastChgPrgrmId')
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
        const rows = grdFcltOperInfoList.getGridDataAll();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltOperInfoList.do", list);

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

    	var nCol = grdFcltOperInfoList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFcltOperInfoList.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = grdFcltOperInfoList.getRowData(nRow);


		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);
    	SBUxMethod.set("dtl-input-trgyYr", rowData.trgyYr);
    	SBUxMethod.set("dtl-input-daddr", rowData.daddr);
    	SBUxMethod.set("dtl-input-apcBrno", rowData.apcBrno);
    	SBUxMethod.set("dtl-input-apcRgnCd", rowData.apcRgnCd);
    	SBUxMethod.set("dtl-select-apcNm", rowData.apcNm);
        SBUxMethod.set("dtl-input-apcAddr", rowData.apcAddr);
        SBUxMethod.set("dtl-input-psnOgnzCd", rowData.psnOgnzCd);
        SBUxMethod.set("dtl-input-psnOgnzNm", rowData.psnOgnzNm);
        SBUxMethod.set("dtl-input-psnOgnzBrno", rowData.psnOgnzBrno);
        SBUxMethod.set("dtl-input-operOgnzCd", rowData.operOgnzCd);
        SBUxMethod.set("dtl-input-operOgnzNm", rowData.operOgnzNm);
        SBUxMethod.set("dtl-input-operOgnzBrno", rowData.operOgnzBrno);
        SBUxMethod.set("dtl-input-operOgnzRprsv", rowData.operOgnzRprsv);
        SBUxMethod.set("dtl-input-operOgnzAddr", rowData.operOgnzAddr);
        SBUxMethod.set("dtl-input-operOgnzDeptCd", rowData.operOgnzDeptCd);
        SBUxMethod.set("dtl-input-operOgnzDeptNm", rowData.operOgnzDeptNm);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCd", rowData.operOgnzTrmtItemCd);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", rowData.operOgnzTrmtItemCn);
        SBUxMethod.set("dtl-input-apcTrmtItemCd", rowData.apcTrmtItemCd);
        SBUxMethod.set("dtl-input-apcTrmtItemCn", rowData.apcTrmtItemCn);
        SBUxMethod.set("dtl-input-delYn", false);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdFcltOperInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdFcltOperInfoList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }
</script>
</html>