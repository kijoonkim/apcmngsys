
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
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[APC] START -->
<%-- 					<%@ include file="../../../frame/inc/apcSelect.jsp" %> --%>
				<!--[APC]  END -->

			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 6%">
					<col style="width: 10%">
					<col style="width: 6%">
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 58%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" scope="row">대상연도</th>
						<td class="td_input"   style="border-right: hidden;">
							<sbux-input id="srch-input-trgtYr" name="srch-input-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td style="border-right:hidden;">
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:150px;"></div>
				</div>
				<br>
					<div><label>운영자개요 상세내역</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>APC 등록</caption>
					<colgroup>
						<col style="width: 35%">
						<col style="width: 65%">
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<th>내용</th>
						</tr>
						<tr>
							<th>소유조직명</th>
							<td>
								<sbux-input id="dtl-input-psnOgnzNm" name="dtl-input-psnOgnzNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>소유조직 사업자번호</th>
							<td>
								<sbux-input id="dtl-input-psnOgnzBrno" name="dtl-input-psnOgnzBrno" uitype="text"
								onblur="extractNumbers2('dtl-input-psnOgnzBrno')" onkeyup="extractNumbers2('dtl-input-psnOgnzBrno')" maxlength="10"
								class="form-control input-sm"  placeholder="소유자가 지자체로 사업자번호 없을 경우 공란" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직명</th>
							<td>
								<sbux-input id="dtl-input-operOgnzNm" name="dtl-input-operOgnzNm" uitype="text" class="form-control input-sm" placeholder="최초 페이 내용 그대로 끌어오기" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 사업자번호</th>
							<td>
								<sbux-input id="dtl-input-operOgnzBrno" name="dtl-input-operOgnzBrno" uitype="text"
								onblur="extractNumbers2('dtl-input-operOgnzBrno')" onkeyup="extractNumbers2('dtl-input-operOgnzBrno')" maxlength="10"
								class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 대표자</th>
							<td>
								<sbux-input id="dtl-input-operOgnzPic" name="dtl-input-operOgnzPic" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 주소(시도)</th>
							<td>
								<sbux-input id="dtl-input-operOgnzAddr1" name="dtl-input-operOgnzAddr1" uitype="text" class="form-control input-sm" placeholder="주소 작성" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 주소(시군구)</th>
							<td>
								<sbux-input id="dtl-input-operOgnzAddr2" name="dtl-input-operOgnzAddr2" uitype="text" class="form-control input-sm" placeholder="주소 작성" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 조직유형</th>
							<td>
								<sbux-input id="dtl-input-operOgnzDeptCd" name="dtl-input-operOgnzDeptCd" uitype="text" class="form-control input-sm" placeholder="생산유통통합조직(승인함),생산유통통합조직(육성형),생산유통통합조직(승인형)-출자출하조직, 생산유통통합조직(육성형)-출자출하조직,개별조직" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목1</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-operOgnzTrmtItemCn_Cd" name="dtl-input-operOgnzTrmtItemCn_Cd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-operOgnzTrmtItemCn" name="dtl-input-operOgnzTrmtItemCn" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item1" name="srch-btn-item1" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(1)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-operOgnzTrmtItemCn2_Cd" name="dtl-input-operOgnzTrmtItemCn2_Cd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-operOgnzTrmtItemCn2" name="dtl-input-operOgnzTrmtItemCn2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item2" name="srch-btn-item2" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(2)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-operOgnzTrmtItemCn3_Cd" name="dtl-input-operOgnzTrmtItemCn3_Cd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-operOgnzTrmtItemCn3" name="dtl-input-operOgnzTrmtItemCn3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item3" name="srch-btn-item3" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(3)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>운영조직 취급 기타품목</th>
							<td>
								<sbux-input id="dtl-input-operOgnzTrmtItemCn4" name="dtl-input-operOgnzTrmtItemCn4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>대상연도</th>
							<td>
								<sbux-input id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC명</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-cnpt1" name="srch-btn-cnpt1" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect1" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 사업자번호</th>
							<td>
								<sbux-input id="dtl-input-apcBrno" name="dtl-input-apcBrno" uitype="text"
								onblur="extractNumbers2('dtl-input-psnOgnzBrno')" onkeyup="extractNumbers2('dtl-input-psnOgnzBrno')" maxlength="10"
								class="form-control input-sm" placeholder="사업자번호 없을 경우 공란" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>APC 주소</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-apcZipCode" name="dtl-input-apcZipCode" uitype="text" class="form-control input-sm" placeholder="apc우편번호" readonly></sbux-input><br>
									<sbux-input id="dtl-input-apcAddr" name="dtl-input-apcAddr" uitype="text" class="form-control input-sm" placeholder="apc주소" readonly></sbux-input><br>
									<sbux-input id="dtl-input-apcDtlAddr" name="dtl-input-apcDtlAddr" uitype="text" class="form-control input-sm" placeholder="apc상세주소" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목1</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-apcTrmtItemCn_Cd" name="dtl-input-apcTrmtItemCn_Cd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-apcTrmtItemCn" name="dtl-input-apcTrmtItemCn" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item4" name="srch-btn-item4" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(4)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목2</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-apcTrmtItemCn2_Cd" name="dtl-input-apcTrmtItemCn2_Cd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-apcTrmtItemCn2" name="dtl-input-apcTrmtItemCn2" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item5" name="srch-btn-item5" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(5)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 처리 대표품목3</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="col-md-3">
									<sbux-input id="dtl-input-apcTrmtItemCn3_Cd" name="dtl-input-apcTrmtItemCn3_Cd" uitype="hidden" class="form-control input-sm" placeholder="" readonly></sbux-input>
									<sbux-input id="dtl-input-apcTrmtItemCn3" name="dtl-input-apcTrmtItemCn3" uitype="text" class="form-control input-sm" placeholder="" readonly></sbux-input>
								</div>
								<div class="col-md-1">
									<sbux-button id="srch-btn-item6" name="srch-btn-item6" uitype="modal" target-id="modal-itemSelect" onclick="fn_modalItemSelect(6)" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</div>
							</td>
						</tr>
						<tr>
							<th>APC 처리 기타품목명</th>
							<td>
								<sbux-input id="dtl-input-apcTrmtItemCn4" name="dtl-input-apcTrmtItemCn4" uitype="text" class="form-control input-sm" placeholder="“해당없음” 혹은 추가하기 버튼 누르고 수기입력
								" ></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div>
				<input type="text" class="input_05mg" title="우편번호" id="zipCode1" name="zipCode1" value="" readonly />
		                        <input type="hidden" class="input_05mg" title="우편번호뒷자리" id="zipCode2" name="zipCode2" value="" readonly />
								<input type="hidden" name="zip"/>
		                        <input type="hidden" id="zipCodeType" name="zipCodeType" value="" />
		                        <!--
		                        <a href="#" onclick="goPopup();" title="우편번호 조회"><img src="/images/members/btn/btn_zipcode.gif" alt="우편번호 검색" title="우편번호 검색" class="pd_top5" /></a><br />
		                         -->
		                        <sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="goPopup" text="주소찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
		                        <input type="text" id="address" class="input_02mg" title="주소" name="addr" /><br />
		                        <input type="text" id="detailAddress" class="input_02mg" title="상세주소" name="dtlAddr" />
			</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- apc 선택 Modal -->
    <div>
        <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-apcSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
    </div>
    <!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemSelect" name="modal-itemSelect" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemSelect" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/ItemSelectPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);

    	gfn_setComCdSBSelect(
    			['dtl-input-operOgnzTrmtItemCn', 'dtl-input-operOgnzTrmtItemCn2','dtl-input-operOgnzTrmtItemCn3','dtl-input-operOgnzTrmtItemCn4',
    			 'dtl-input-apcTrmtItemCn', 'dtl-input-apcTrmtItemCn2','dtl-input-apcTrmtItemCn3','dtl-input-apcTrmtItemCn4','dtl-input-operOgnzDeptCd'
    			],
    			jsonApcItem,
			'MSG_KND');

     	//gfn_setApcItemSBSelect('dtl-input-operOgnzTrmtItemCn2', jsonApcItem),	// 품목
    	fn_createGrid();//그리드 생성 설정 함수

    });

    //grid 초기화
    var grdFcltOperInfoList; // 그리드를 담기위한 객체 선언
    var jsonFcltOperInfoList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
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
            {caption: ["APC","APC명"],			ref: 'apcNm',           type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["","소유조직"],	    	ref: 'psnOgnzNm',      type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["","소유조직 사업자번호"],   		ref: 'psnOgnzBrno',    type:'output',  hidden: true},
            {caption: ["운영조직","운영조직명"],		ref: 'operOgnzNm',   	type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["운영조직","대표품목1"], 		ref: 'operOgnzTrmtItemCn',     	type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["운영조직","대표품목2"],  		ref: 'operOgnzTrmtItemCn2',    type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["운영조직","대표품목3"],   		ref: 'operOgnzTrmtItemCn3',    type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["운영조직","기타품목"],   		ref: 'operOgnzTrmtItemCn3',    type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["운영조직","사업자번호"],   		ref: 'operOgnzBrno',    type:'output',  hidden: true},
            {caption: ["운영조직","주소(시도)"],   		ref: 'operOgnzAddr1',    type:'output',  hidden: true},
            {caption: ["운영조직","주소(시군구)"],   		ref: 'operOgnzAddr2',    type:'output',  hidden: true},
            {caption: ["운영조직","조직유형"],   		ref: 'operOgnzDeptCd',    type:'output',  hidden: true},
            {caption: ["APC","대표품목1"],	ref: 'apcTrmtItemCn',   type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["APC","대표품목2"],	ref: 'apcTrmtItemCn2',   type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["APC","대표품목3"],	ref: 'apcTrmtItemCn3',   type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["APC","기타품목"],	ref: 'apcTrmtItemCn3',   type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["APC","주소"],	ref: 'apcAddr',   type:'output',  hidden: true},
            {caption: ["APC","사업자번호"],	ref: 'apcBrno',   type:'output',  hidden: true},
            {caption: ["APC CD"],		ref: 'apcCd',           type:'output',  hidden: true},
            {caption: ["대상년도"],			ref: 'trgtYr',          type:'output',  hidden: true}

        ];

        grdFcltOperInfoList = _SBGrid.create(SBGridProperties);
        grdFcltOperInfoList.bind('click', 'fn_view');
        grdFcltOperInfoList.bind('beforepagechanged', 'fn_pagingFcltOperInfoList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdFcltOperInfoList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdFcltOperInfoList.getPageSize());
    	fn_setGrdFcltOperInfoList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingFcltOperInfoList = async function() {
    	console.log("******************fn_pagingFcltOperInfoList**********************************");
    	let recordCountPerPage = grdFcltOperInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdFcltOperInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltOperInfoList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_setGrdFcltOperInfoList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdFcltOperInfoList**********************************");
    	// form clear
    	fn_clearForm();

		grdFcltOperInfoList.clearStatus();
		grdFcltOperInfoList.refresh();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoList.do", {
			apcCd: apcCd,
        	trgtYr: trgtYr,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });

        const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	console.log(data);
        	jsonFcltOperInfoList.length = 0;

        	//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
	        	data.resultList.forEach((item, index) => {
					const msg = {
					trgtYr: item.trgtYr,	 	//대상연도
					apcCd: item.apcCd, 	 		//apc코드
					psnOgnzNm: item.psnOgnzNm,                      	//소유조직
					psnOgnzBrno: item.psnOgnzBrno,                    	//소유조직 사업자번호
					perOgnzNm: item.perOgnzNm,                  	  	//운영조직
					operOgnzBrno: item.operOgnzBrno,                    //운영조직 사업자번호
					operOgnzTrmtItemCn: item.operOgnzTrmtItemCn,        //운영조직 취급 대표품목1
					operOgnzTrmtItemCn2: item.operOgnzTrmtItemCn2,      //운영조직 취급 대표품목2
					operOgnzTrmtItemCn3: item.operOgnzTrmtItemCn3,      //운영조직 취급 대표품목3
					operOgnzTrmtItemCn4: item.operOgnzTrmtItemCn4,      //운영조직 취급 기타품목
					operOgnzNm: item.operOgnzNm,
					operOgnzPic: item.operOgnzPic,
					apcNm: item.apcNm,                  		  		//APC명
					apcAddr : item.apcAddr,
					apcBrno: item.apcBrno,                 		  		//APC 사업자번호
					operOgnzAddr1 : item.operOgnzAddr1, 				//주소(시도)
					operOgnzAddr2 : item.operOgnzAddr2, 				//주소(시군구)
					operOgnzDeptCd: item.operOgnzDeptCd,
					apcTrmtItemCn: item.apcTrmtItemCn,                  //APC 처리 대표품목1
					apcTrmtItemCn2: item.apcTrmtItemCn2,                //APC 처리 대표품목2
					apcTrmtItemCn3: item.apcTrmtItemCn3,                //APC 처리 대표품목3
					apcTrmtItemCn4: item.apcTrmtItemCn4                 //APC 처리 기타품목명
					}

					jsonFcltOperInfoList.push(msg);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});
        	}
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
        	console.log("error");
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		//console.error("failed", e.message);
        }
    }
   	console.log("d4444444444444444444444444444");


    //신규 작성 dtl 내부의 값을 null로
    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
    	SBUxMethod.set("dtl-input-operOgnzAddr1", null);             //  도로명 주소(시도)
    	SBUxMethod.set("dtl-input-operOgnzAddr2", null);           //  도로명 주소(시군구)
    	SBUxMethod.set("dtl-input-apcBrno", null);                   //  APC사업자등록번호
    	SBUxMethod.set("dtl-input-apcRgnCd", null);                  //  APC지역코드
    	SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명
        SBUxMethod.set("dtl-input-apcAddr", null);                   //  APC 주소
        SBUxMethod.set("dtl-input-psnOgnzNm", null);                 //  소유조직 명
        SBUxMethod.set("dtl-input-psnOgnzBrno", null);               //  소유조직 사업자등록번호
        SBUxMethod.set("dtl-input-operOgnzCd", null);                //  운영조직 코드
        SBUxMethod.set("dtl-input-operOgnzNm", null);                //  운영조직 명
        SBUxMethod.set("dtl-input-operOgnzBrno", null);              //  운영조직 사업자등록번호
        SBUxMethod.set("dtl-input-operOgnzDeptCd", null);            //  운영조직 부서 코드
        SBUxMethod.set("dtl-input-operOgnzDeptNm", null);            //  운영조직 부서명
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn_Cd", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn2_Cd", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn3_Cd", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn4_Cd", null);
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", null);   	 //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn2", null);   	 //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn3", null);   	 //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn4", null);   	 //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn_Cd", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCn2_Cd", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCn3_Cd", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCn4_Cd", null);
        SBUxMethod.set("dtl-input-apcTrmtItemCn2", null);  			 //  APC 취급 품목내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn3", null);  			 //  APC 취급 품목내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn4", null);  			 //  APC 취급 품목내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn", null);  			 //  APC 취급 품목내용
        SBUxMethod.set("dtl-input-operOgnzPic", null);  			 //  APC 취급 품목내용
    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
         SBUxMethod.set("dtl-input-trgtYr", "");                    //  대상연도
         SBUxMethod.set("dtl-input-apcCd", "");                     //  APC코드
         SBUxMethod.set("dtl-input-operOgnzAddr1", "");
         SBUxMethod.set("dtl-input-operOgnzAddr2", "");
         SBUxMethod.set("dtl-input-apcBrno", "");
         SBUxMethod.set("dtl-input-apcRgnCd", "");
         SBUxMethod.set("dtl-input-apcNm", "");
         SBUxMethod.set("dtl-input-apcAddr", "");
         SBUxMethod.set("dtl-input-psnOgnzCd", "");
         SBUxMethod.set("dtl-input-psnOgnzNm", "");
         SBUxMethod.set("dtl-input-psnOgnzBrno", "");
         SBUxMethod.set("dtl-input-operOgnzCd", "");
         SBUxMethod.set("dtl-input-operOgnzNm", "");
         SBUxMethod.set("dtl-input-operOgnzDeptCd", "");
         SBUxMethod.set("dtl-input-operOgnzBrno", "");
         SBUxMethod.set("dtl-input-operOgnzRprsv", "");
         SBUxMethod.set("dtl-input-operOgnzAddr", "");
         SBUxMethod.set("dtl-input-operOgnzDeptCd", "");
         SBUxMethod.set("dtl-input-operOgnzDeptNm", "");
         SBUxMethod.set("dtl-input-operOgnzPic", "");  			 //  APC 취급 품목내용
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn_Cd", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn2_Cd", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn3_Cd", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn4_Cd", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn2", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn3", "");
         SBUxMethod.set("dtl-input-operOgnzTrmtItemCn4", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn_Cd", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn2_Cd", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn3_Cd", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn4_Cd", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn2", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn3", "");
         SBUxMethod.set("dtl-input-apcTrmtItemCn4", "");
    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		let apcCdUpd = SBUxMethod.get("dtl-input-apcCd");


    	if (!SBUxMethod.get("dtl-input-operOgnzBrno")) {
            alert("운영조직사업자번호를 입력하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-operOgnzNm")) {
            alert("운영조직명을 입력하세요.");
            return;
        }


    	if (gfn_isEmpty(apcCdUpd)) {
    		if (!SBUxMethod.get("srch-input-trgtYr")) {
                alert("대상년도를 선택하세요.");
                return;
            }
     		if (!SBUxMethod.get("srch-inp-apcCd")) {
                alert("APC명을 선택하세요.");
                return;
            }
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     * 신규 등록
     */
    const fn_subInsert = async function (isConfirmed){
    	 console.log("******************fn_subInsert**********************************");
    	 if (!isConfirmed) return;

   	 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperInfo.do", {
   	 	trgtYr: SBUxMethod.get("dtl-input-trgtYr") , // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
      	apcCd: SBUxMethod.get("dtl-input-apcCd"), // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
      	psnOgnzNm : SBUxMethod.get("dtl-input-psnOgnzNm") , //소유조직명
      	psnOgnzBrno : SBUxMethod.get("dtl-input-psnOgnzBrno") , //소유조직 사업자번호
      	operOgnzNm : SBUxMethod.get("dtl-input-operOgnzNm") , //운영조직명
      	operOgnzBrno : SBUxMethod.get("dtl-input-operOgnzBrno") , //운영조직 사업자번호
      	operOgnzPic : SBUxMethod.get("dtl-input-operOgnzPic") , //운영조직 대표자
      	operOgnzAddr1 : SBUxMethod.get("dtl-input-operOgnzAddr1") ,	//운영조직 주소(시도)
      	//operOgnzAddr2 : SBUxMethod.get("dtl-input-opera6") ,	//운영조직 주소(시군구)
      	operOgnzDeptCd : SBUxMethod.get("dtl-input-operOgnzDeptCd") , //운영조직 조직유형
      	operOgnzTrmtItemCn : SBUxMethod.get("dtl-input-operOgnzTrmtItemCn") , //운영조직 취급 대표품목1
      	operOgnzTrmtItemCn2 : SBUxMethod.get("dtl-input-operOgnzTrmtItemCn2") , //운영조직 취급 대표품목2
      	operOgnzTrmtItemCn3 : SBUxMethod.get("dtl-input-operOgnzTrmtItemCn3") , //운영조직 취급 대표품목3
      	operOgnzTrmtItemCn4 : SBUxMethod.get("dtl-input-operOgnzTrmtItemCn4") , //운영조직 취급 기타품목
      	apcBrno : SBUxMethod.get("dtl-input-apcBrno") ,  //APC 사업자번호
      	apcAddr : SBUxMethod.get("dtl-input-apcAddr") ,	//APC 주소
      	apcTrmtItemCn : SBUxMethod.get("dtl-input-apcTrmtItemCn") , // APC 처리 대표품목1
      	apcTrmtItemCn2 : SBUxMethod.get("dtl-input-apcTrmtItemCn2") , // APC 처리 대표품목2
      	apcTrmtItemCn3 : SBUxMethod.get("dtl-input-apcTrmtItemCn3") , // APC 처리 대표품목3
      	apcTrmtItemCn4 : SBUxMethod.get("dtl-input-apcTrmtItemCn4")  //  APC 처리 기타품목
		});

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
    	 console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltOperInfo.do", {
    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
        ,	operOgnzAddr1: SBUxMethod.get('dtl-input-operOgnzAddr1')             //  도로명 주소(시도)
        //,	operOgnzAddr2: SBUxMethod.get('dtl-input-operOgnzAddr2')             //  도로명 주소(시군구)
        ,	apcBrno: SBUxMethod.get('dtl-input-apcBrno')                         //  APC사업자등록번호
        ,	apcRgnCd: SBUxMethod.get('dtl-input-apcRgnCd')                  	 //  APC지역코드
        ,	apcNm: SBUxMethod.get('dtl-input-apcNm')                             //  APC명
        ,	apcAddr: SBUxMethod.get('dtl-input-apcAddr')                         //  APC 주소
        ,	psnOgnzNm: SBUxMethod.get('dtl-input-psnOgnzNm')                     //  소유조직 명
        ,	psnOgnzBrno: SBUxMethod.get('dtl-input-psnOgnzBrno')                 //  소유조직 사업자등록번호
        ,	operOgnzCd: SBUxMethod.get('dtl-input-operOgnzCd')                 	 //  운영조직 코드
        ,	operOgnzNm: SBUxMethod.get('dtl-input-operOgnzNm')                   //  운영조직 명
        ,	operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzBrno')               //  운영조직 사업자등록번호
        ,	operOgnzDeptCd: SBUxMethod.get('dtl-input-operOgnzDeptCd')           //  운영조직 부서 코드
        ,	operOgnzDeptNm: SBUxMethod.get('dtl-input-operOgnzDeptNm')          //  운영조직 부서명
        ,  	operOgnzPic: SBUxMethod.get('dtl-input-operOgnzPic')                     //  대표자
        ,	operOgnzTrmtItemCn: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn')   //  운영조직 취급 품목 내용
        ,	operOgnzTrmtItemCn2: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn2')   //  운영조직 취급 품목 내용
        ,	operOgnzTrmtItemCn3: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn3')   //  운영조직 취급 품목 내용
        ,	operOgnzTrmtItemCn4: SBUxMethod.get('dtl-input-operOgnzTrmtItemCn4')   //  운영조직 취급 품목 내용
        ,	apcTrmtItemCn: SBUxMethod.get('dtl-input-apcTrmtItemCn')	         //  APC 취급 품목 내용
        ,	apcTrmtItemCn2: SBUxMethod.get('dtl-input-apcTrmtItemCn2')	         //  APC 취급 품목 내용
        ,	apcTrmtItemCn3: SBUxMethod.get('dtl-input-apcTrmtItemCn3')	         //  APC 취급 품목 내용
        ,	apcTrmtItemCn4: SBUxMethod.get('dtl-input-apcTrmtItemCn4')	         //  APC 취급 품목 내용
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
    	console.log("******************fn_delete**********************************");
    	/**
         * @type {any[]}
         */
        let list = [];

        /**
         * @type {any[]}
         */
        /*
        const rows = grdFcltOperInfoList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
        */

        console.log(grdFcltOperInfoList.getSelectedRows());
		const rows = grdFcltOperInfoList.getSelectedRows();
        if (rows.length == 0) {
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
     	console.log("******************fn_subDelete**********************************");
 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltOperInfo.do", {
    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
            ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
        		});

         const data = await postJsonPromise;
		//예외처리
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

    //상세정보 보기 클릭이벤트
    function fn_view() {
    	console.log("******************fn_view**********************************");
    	var nCol = grdFcltOperInfoList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFcltOperInfoList.getRow();
		if (nRow < 1) {
            return;
		}

		if(nRow == null){
			nRow = 1;
		}

			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdFcltOperInfoList.getRowData(nRow);
		console.log(rowData);
		console.log(rowData.operOgnzTrmtItemCn);
		console.log(gfn_isEmpty(rowData.operOgnzTrmtItemCn));
		console.log(rowData.operOgnzTrmtItemCn2);
		console.log(gfn_isEmpty(rowData.operOgnzTrmtItemCn2));

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                           //  대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                             //  APC코드
    	SBUxMethod.set("dtl-input-operOgnzAddr1", rowData.operOgnzAddr1);             //  도로명 주소(시도)
    	SBUxMethod.set("dtl-input-operOgnzAddr2", rowData.operOgnzAddr2);             //  도로명 주소(시군구)
    	SBUxMethod.set("dtl-input-apcBrno", rowData.apcBrno);                         //  APC사업자등록번호
    	SBUxMethod.set("dtl-input-apcRgnCd", rowData.apcRgnCd);                       //  APC지역코드
    	SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                             //  APC명
        SBUxMethod.set("dtl-input-apcAddr", rowData.apcAddr);                         //  APC 주소
        SBUxMethod.set("dtl-input-psnOgnzNm", rowData.psnOgnzNm);                     //  소유조직 명
        SBUxMethod.set("dtl-input-operOgnzPic", rowData.operOgnzPic);                     //  대표자
        SBUxMethod.set("dtl-input-psnOgnzBrno", rowData.psnOgnzBrno);                 //  소유조직 사업자등록번호
        SBUxMethod.set("dtl-input-operOgnzCd", rowData.operOgnzCd);                   //  운영조직 코드
        SBUxMethod.set("dtl-input-operOgnzNm", rowData.operOgnzNm);                   //  운영조직 명
        SBUxMethod.set("dtl-input-operOgnzBrno", rowData.operOgnzBrno);               //  운영조직 사업자등록번호
        SBUxMethod.set("dtl-input-operOgnzDeptCd", rowData.operOgnzDeptCd);           //  운영조직 부서 코드
        SBUxMethod.set("dtl-input-operOgnzDeptNm", rowData.operOgnzDeptNm);           //  운영조직 부서명
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn", rowData.operOgnzTrmtItemCn === null ? "" : rowData.operOgnzTrmtItemCn);   //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn2", rowData.operOgnzTrmtItemCn2 === null ? "" : rowData.operOgnzTrmtItemCn2);   //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn3", rowData.operOgnzTrmtItemCn3 === null ? "" : rowData.operOgnzTrmtItemCn3);   //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-operOgnzTrmtItemCn4", rowData.operOgnzTrmtItemCn4 === null ? "" : rowData.operOgnzTrmtItemCn4);   //  운영조직 취급 품목 내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn", rowData.apcTrmtItemCn === null ? "" : rowData.apcTrmtItemCn);             //  APC 취급 품목 내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn2", rowData.apcTrmtItemCn2 === null ? "" : rowData.apcTrmtItemCn2);            //  APC 취급 품목 내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn3", rowData.apcTrmtItemCn3 === null ? "" : rowData.apcTrmtItemCn3);             //  APC 취급 품목 내용
        SBUxMethod.set("dtl-input-apcTrmtItemCn4", rowData.apcTrmtItemCn4 === null ? "" : rowData.apcTrmtItemCn4);             //  APC 취급 품목 내용
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdFcltOperInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdFcltOperInfoList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

 	//srch-apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	//srch-apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}
	//dtl-apc 선택 팝업 호출
	const fn_modalApcSelect1 = function() {
		popApcSelect.init(fn_setApc1);
	}
	//dtl-apc 선택 팝업 콜백 함수
	const fn_setApc1 = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('dtl-input-apcCd', apc.apcCd);
			SBUxMethod.set('dtl-input-apcNm', apc.apcNm);
		}
	}

	// 품목 선택 팝업 호출
	const fn_modalItemSelect = function(sn) {
		popItemSelect.init(sn,fn_setItem);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		if (!gfn_isEmpty(itemVal)) {
			SBUxMethod.set('srch-inp-itemCd' + itemVal.sn , itemVal.itemCd);
			SBUxMethod.set('srch-inp-itemNm' + itemVal.sn , itemVal.itemNm);
		}
	}

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}


	//팝업 실행
	var fn_goPopup = function(){
//	 	var pop = window.open("/member/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes");
		w = 520;
		h = 620;
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;

		settings = "height=" + h
				   + ",width=" + w
				   + ",top=" + TopPosition
				   + ",left=" + LeftPosition
				   + ",scrollbars=yes, resizable=yes";
		//window.open( "/zipCode/zipCode.jsp", "zipCodeSearchWin", settings );
		window.open( "/fm/popup/jusoPopup.do", "zipCodeSearchWin", settings );
		//window.open( "/zip/searchRoad.action", "zipCodeSearchWin", settings );

	}
	//팝업 콜백
	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
		/*
			roadFullAddr 전체 도로명주소
			roadAddrPart1 도로명주소(참고항목 제외)
			roadAddrPart2 도로명주소 참고항목
			addrDetail 상세주소
			engAddr 도로명 주소 영문
			jibunAddr 지번 정보
			zipNo 우편번호
		*/
		if(addrDetail.length>30){
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		SBUxMethod.set("dtl-input-apcZipCode", zipNo);//우편번호
		SBUxMethod.set("dtl-input-apcAddr", roadAddrPart1);//주소
		SBUxMethod.set("dtl-input-apcDtlAddr", addrDetail);//상세주소
		//console.log(roadFullAddr+" , "+roadAddrPart1+" , "+addrDetail+" , "+roadAddrPart2+" , "+engAddr+" , "+jibunAddr+" , "+zipNo);
		//alert("성공");
	}
</script>
</html>
