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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 시설현황</h3>
			</div>
			<div style="margin-left: auto;">
				<!--
				<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				 -->
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<!--[APC] START -->
<%-- 					<%@ include file="../../../frame/inc/apcSelect.jsp" %> --%>
				<!--[APC] END -->

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
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>

				<br>
	<div><label>시설현황 상세내역</label></div>
				<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 9%">
					<col style="width: 18%">
					<col style="width: 18%">
					<col style="width: 55%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg">구분</th>
						<th class="th_bg">면적(㎡)</th>
						<th class="th_bg">비고</th>
						<th></th>
					</tr>
					<tr>
						<th class="th_bg">총 건축면적</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltAreaTot" name="dtl-input-fcltAreaTot" uitype="text" class="form-control input-sm" placeholder="5000㎡ " disabled></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrkTot" name="dtl-input-fcltRmrkTot" uitype="text" class="form-control input-sm" placeholder="1개 동"></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>

						<th class="th_bg">집하선별포장장</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea01" name="dtl-input-fcltArea01" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="2,500㎡"></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk01" name="dtl-input-fcltRmrk01" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">세척․가공 등 처리</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea02" name="dtl-input-fcltArea02" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk02" name="dtl-input-fcltRmrk02" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">비상품화시설</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea03" name="dtl-input-fcltArea03" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="300㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk03" name="dtl-input-fcltRmrk03" uitype="text" class="form-control input-sm" placeholder="사무실,회의실,화장실 등" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">폐기물 처리</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea04" name="dtl-input-fcltArea04" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk04" name="dtl-input-fcltRmrk04" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">예냉고</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea05" name="dtl-input-fcltArea05" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="300㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk05" name="dtl-input-fcltRmrk05" uitype="text" class="form-control input-sm" placeholder="3칸×100㎡" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">저온저장</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea06" name="dtl-input-fcltArea06" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="700㎡
							" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk06" name="dtl-input-fcltRmrk06" uitype="text" class="form-control input-sm" placeholder="7칸×100㎡
							" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">CA저장고</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea07" name="dtl-input-fcltArea07" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="300㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk07" name="dtl-input-fcltRmrk07" uitype="text" class="form-control input-sm" placeholder="3칸×100㎡" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">큐어링</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea08" name="dtl-input-fcltArea08" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk08" name="dtl-input-fcltRmrk08" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">일반저장</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea09" name="dtl-input-fcltArea09" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="500㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk09" name="dtl-input-fcltRmrk09" uitype="text" class="form-control input-sm" placeholder="5칸×100㎡" ></sbux-input>
						</td>
						<td></td>
					</tr>

					<tr>
						<th class="th_bg">기타사항</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea10" name="dtl-input-fcltArea10" uitype="text" class="form-control input-sm sum" onkeyup="fn_sumNumbers(this)" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk10" name="dtl-input-fcltRmrk10" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">대상년도</th>
						<td class="td_input">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th class="th_bg">APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="2"></td>
					</tr>
				</tbody>
			</table>

			</div>
			</div>

			<!--[pp] //검색결과 -->
		</div>
	</section>
<%-- 	<!-- 거래처 선택 Modal -->
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
    </div> --%>
    <!-- apc 선택 Modal -->
    <div>
        <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-apcSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
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
/*
    	gfn_setComCdSBSelect(
    			['dtl-input-operOgnzTrmtItemCn', 'dtl-input-operOgnzTrmtItemCn2','dtl-input-operOgnzTrmtItemCn3','dtl-input-operOgnzTrmtItemCn4',
    			 'dtl-input-apcTrmtItemCn', 'dtl-input-apcTrmtItemCn2','dtl-input-apcTrmtItemCn3','dtl-input-apcTrmtItemCn4','dtl-input-operOgnzDeptCd'],
    			jsonApcItem,
			'MSG_KND');
 */
     	//gfn_setApcItemSBSelect('dtl-input-operOgnzTrmtItemCn2', jsonApcItem),	// 품목
    	fn_createGrid();//그리드 생성 설정 함수

    });
    //grid 초기화
    var grdFcltInfoList; // 그리드를 담기위한 객체 선언
    var jsonFcltInfoList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdFcltInfoList';
	    SBGridProperties.jsonref = 'jsonFcltInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APC명"],		ref: 'apcNm',       type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["총 건축면적"],	    ref: 'fcltAreaTot',  type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["집하선포장장"], 		ref: 'fcltArea01',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["세척․가공 등 처리"],  	ref: 'fcltArea02',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["비상품화시설"],   	ref: 'fcltArea03',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["폐기물 처리"],		ref: 'fcltArea04',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["예냉고"],			ref: 'fcltArea05',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["저온저장"],			ref: 'fcltArea06',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["CA저장고"],		ref: 'fcltArea07',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["큐어링"],			ref: 'fcltArea08',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["일반저장"],			ref: 'fcltArea09',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["기타사항"],			ref: 'fcltArea10',   type:'output',  	width:'25%',    style:'text-align:center'},

            {caption: ["총 건축면적 비고"],	    ref: 'fcltRmrkTot',  type:'output', hidden: true},
            {caption: ["집하선포장장 비고"], 		ref: 'fcltRmrk01',   type:'output', hidden: true},
            {caption: ["세척․가공 등 처리 비고"],  	ref: 'fcltRmrk02',   type:'output', hidden: true},
            {caption: ["비상품화시설 비고"],   	ref: 'fcltRmrk03',   type:'output', hidden: true},
            {caption: ["폐기물 처리 비고"],		ref: 'fcltRmrk04',   type:'output', hidden: true},
            {caption: ["예냉고 비고"],			ref: 'fcltRmrk05',   type:'output', hidden: true},
            {caption: ["저온저장 비고"],			ref: 'fcltRmrk06',   type:'output', hidden: true},
            {caption: ["CA저장고 비고"],			ref: 'fcltRmrk07',   type:'output', hidden: true},
            {caption: ["큐어링 비고"],			ref: 'fcltRmrk08',   type:'output', hidden: true},
            {caption: ["일반저장 비고"],			ref: 'fcltRmrk09',   type:'output', hidden: true},
            {caption: ["기타사항 비고"],			ref: 'fcltRmrk10',   type:'output', hidden: true},

            {caption: ["APCCD"],		ref: 'apcCd',       type:'output',  	hidden: true},
            {caption: ["대상연도"],			ref: 'trgtYr',          type:'output',  hidden: true}
        ];

        grdFcltInfoList = _SBGrid.create(SBGridProperties);
        grdFcltInfoList.bind('click', 'fn_view');
        grdFcltInfoList.bind('beforepagechanged', 'fn_pagingFcltInfoList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdFcltInfoList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdFcltInfoList.getPageSize());
    	fn_pagingFcltInfoList(pageSize, pageNo);
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

    const fn_pagingFcltInfoList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingFcltInfoList**********************************");
    	// form clear
    	fn_clearForm();

		grdFcltInfoList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		var chk = {
				trgtYr: trgtYr,
	        	apcCd: apcCd,
	        	// pagination
		  		pagingYn : 'N',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize

		}
		console.log('=============chk==================');
		console.log(chk);

        //비동기 포스트타입 url 데이터연결 페이징처리 글로벌
        //gfn_postJSON 는 ajax고 post통신의 데이터를 json 타입으로 보내는것이다
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltInfoList.do", {
			apcCd: apcCd,
        	trgtYr: trgtYr,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });
		console.log("a11111111111111");
        const data = await postJsonPromise;
		//await 오류시 확인
        console.log("---------------------------")
        console.log(data)
		//예외처리
        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonFcltInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
				trgtYr: item.trgtYr,	 	 //대상연도
				apcCd: item.apcCd, 	 		 //apc코드
				apcNm: item.apcNm,      	 //apc명
				fcltCd: item.fcltCd,     	 //시설 코드
		    	fcltNm: item.fcltNm,          	 //시설 명
		        fcltAreaTot: item.fcltAreaTot,     //시설 면적 총면적
		        fcltRmrkTot: item.fcltRmrkTot,    			 //비고
		        fcltArea01: item.fcltArea01,     //시설 면적 집하선별포장장
		        fcltRmrk01: item.fcltRmrk01,    			 //비고
		        fcltArea02: item.fcltArea02,     //시설 면적 세척,가공 등 처리
		        fcltRmrk02: item.fcltRmrk02,    			 //비고
		        fcltArea03: item.fcltArea03,     //시설 면적 비 상품화시설
		        fcltRmrk03: item.fcltRmrk03,    			 //비고
		        fcltArea04: item.fcltArea04,     //시설 면적 폐기물처리
		        fcltRmrk04: item.fcltRmrk04,    			 //비고
		        fcltArea05: item.fcltArea05,     //시설 면적 예냉고
		        fcltRmrk05: item.fcltRmrk05,    			 //비고
		        fcltArea06: item.fcltArea06,     //시설 면적 저온저장
		        fcltRmrk06: item.fcltRmrk06,    			 //비고
		        fcltArea07: item.fcltArea07,     //시설 면적 CA저장고
		        fcltRmrk07: item.fcltRmrk07,    			 //비고
		        fcltArea08: item.fcltArea08,     //시설 면적 큐어링
		        fcltRmrk08: item.fcltRmrk08,    			 //비고
		        fcltArea09: item.fcltArea09,     //시설 면적 일반저장
		        fcltRmrk09: item.fcltRmrk09,    			 //비고
		        fcltArea10: item.fcltArea10,     //시설 면적 기타사항
		        fcltRmrk10: item.fcltRmrk10,    			 //비고
				}

				jsonFcltInfoList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonFcltInfoList.length > 0) {

        		if(grdFcltInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdFcltInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdFcltInfoList.rebuild();
				}else{
					grdFcltInfoList.refresh()
				}
        	} else {
        		grdFcltInfoList.setPageTotalCount(totalRecordCount);
        		grdFcltInfoList.rebuild();
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


    //신규 작성 dtl 내부의 값을 null로
    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC코드
    	SBUxMethod.set("dtl-input-fcltCd", null);      				 //  시설 코드
    	SBUxMethod.set("dtl-input-fcltNm", null); 				     //  시설 명
        SBUxMethod.set("dtl-input-fcltAreaTot", null);					   //시설 면적 총면적
        SBUxMethod.set("dtl-input-fcltRmrkTot", null);					  			 //비고
        SBUxMethod.set("dtl-input-fcltArea01", null);                 //시설 면적 집하선별포장장
        SBUxMethod.set("dtl-input-fcltRmrk01", null);                			 //비고
        SBUxMethod.set("dtl-input-fcltArea02", null);                   //시설 면적 세척,가공 등 처리
        SBUxMethod.set("dtl-input-fcltRmrk02", null);                      			 //비고
        SBUxMethod.set("dtl-input-fcltArea03", null);                   //시설 면적 비 상품화시설
        SBUxMethod.set("dtl-input-fcltRmrk03", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea04", null);                   //시설 면적 폐기물처리
        SBUxMethod.set("dtl-input-fcltRmrk04", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea05", null);                   //시설 면적 예냉고
        SBUxMethod.set("dtl-input-fcltRmrk05", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea06", null);                   //시설 면적 저온저장
        SBUxMethod.set("dtl-input-fcltRmrk06", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea07", null);                   //시설 면적 CA저장고
        SBUxMethod.set("dtl-input-fcltRmrk07", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea08", null);                   //시설 면적 큐어링
        SBUxMethod.set("dtl-input-fcltRmrk08", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea09", null);                   //시설 면적 일반저장
        SBUxMethod.set("dtl-input-fcltRmrk09", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea10", null);                    //시설 면적 기타사항
        SBUxMethod.set("dtl-input-fcltRmrk10", null);                   			 //비고

    }

     const fn_clearForm = function() {
    	console.log("******************fn_clearForm**********************************");

     	SBUxMethod.set("dtl-input-fcltCd", null);
     	SBUxMethod.set("dtl-input-fcltNm", null);
     	SBUxMethod.set("dtl-input-apcCd", null);
    	SBUxMethod.set("dtl-input-apcNm", null);
        SBUxMethod.set("dtl-input-fcltAreaTot", null);           //시설 면적 총면적
        SBUxMethod.set("dtl-input-fcltRmrkTot", null);          			 //비고
        SBUxMethod.set("dtl-input-fcltArea01", null);        //시설 면적 집하선별포장장
        SBUxMethod.set("dtl-input-fcltRmrk01", null);       			 //비고
        SBUxMethod.set("dtl-input-fcltArea02", null);          //시설 면적 세척,가공 등 처리
        SBUxMethod.set("dtl-input-fcltRmrk02", null);             			 //비고
        SBUxMethod.set("dtl-input-fcltArea03", null);          //시설 면적 비 상품화시설
        SBUxMethod.set("dtl-input-fcltRmrk03", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea04", null);          //시설 면적 폐기물처리
        SBUxMethod.set("dtl-input-fcltRmrk04", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea05", null);          //시설 면적 예냉고
        SBUxMethod.set("dtl-input-fcltRmrk05", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea06", null);          //시설 면적 저온저장
        SBUxMethod.set("dtl-input-fcltRmrk06", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea07", null);          //시설 면적 CA저장고
        SBUxMethod.set("dtl-input-fcltRmrk07", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea08", null);          //시설 면적 큐어링
        SBUxMethod.set("dtl-input-fcltRmrk08", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea09", null);          //시설 면적 일반저장
        SBUxMethod.set("dtl-input-fcltRmrk09", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea10", null);           //시설 면적 기타사항
        SBUxMethod.set("dtl-input-fcltRmrk10", null);          			 //비고

    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		let apcCdUpd = SBUxMethod.get("dtl-input-apcCd");

/*     	if (!SBUxMethod.get("dtl-input-fcltCd")) {
            alert("조회 항목의 시설명을 입력하세요.");
            return;
        }
    	if (!SBUxMethod.get("dtl-input-fcltArea")) {
            alert("총 건축면적을 입력하세요.");
            return;
        }
    	*/
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInfo.do", {
	    	 	trgtYr: SBUxMethod.get("srch-input-trgtYr")  // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
    	    ,	apcCd: SBUxMethod.get("srch-inp-apcCd") // 상단 조회 조건의 APC코드 SBUxMethod.get("srch-inp-apcCd")
    	    ,	apcNm: SBUxMethod.get('dtl-input-apcNm')								//  apc명
            ,	fcltCd: SBUxMethod.get('dtl-input-fcltCd')   	                     //  시설 코드
            ,	fcltNm: SBUxMethod.get('dtl-input-fcltNm')   	                      //  시설 명

            ,	fcltAreaTot: SBUxMethod.get('dtl-input-fcltAreaTot')      	                 //시설 면적 총면적
            ,	fcltRmrkTot: SBUxMethod.get('dtl-input-fcltRmrkTot')      	                 //시설 면적 총면적 비고
            ,	fcltArea01: SBUxMethod.get('dtl-input-fcltArea01')                          //시설 면적 집하선별포장장
            ,	fcltRmrk01: SBUxMethod.get('dtl-input-fcltRmrk01')      	                 //비고
            ,	fcltArea02: SBUxMethod.get('dtl-input-fcltArea02')                      	//시설 면적 세척,가공 등 처리
            ,	fcltRmrk02: SBUxMethod.get('dtl-input-fcltRmrk02')      	                //비고
            ,	fcltArea03: SBUxMethod.get('dtl-input-fcltArea03')                         //시설 면적 비 상품화시설
            ,	fcltRmrk03: SBUxMethod.get('dtl-input-fcltRmrk03')      	                  			 //비고
            ,	fcltArea04: SBUxMethod.get('dtl-input-fcltArea04')                           //시설 면적 폐기물처리
            ,	fcltRmrk04: SBUxMethod.get('dtl-input-fcltRmrk04')      	                  			 //비고
            ,	fcltArea05: SBUxMethod.get('dtl-input-fcltArea05')                           //시설 면적 예냉고
            ,	fcltRmrk05: SBUxMethod.get('dtl-input-fcltRmrk05')      	                  			 //비고
            ,	fcltArea06: SBUxMethod.get('dtl-input-fcltArea06')                           //시설 면적 저온저장
            ,	fcltRmrk06: SBUxMethod.get('dtl-input-fcltRmrk06')      	                  			 //비고
            ,	fcltArea07: SBUxMethod.get('dtl-input-fcltArea07')                           //시설 면적 CA저장고
            ,	fcltRmrk07: SBUxMethod.get('dtl-input-fcltRmrk07')      	                  			 //비고
            ,	fcltArea08: SBUxMethod.get('dtl-input-fcltArea08')                           //시설 면적 큐어링
            ,	fcltRmrk08: SBUxMethod.get('dtl-input-fcltRmrk08')      	                  			 //비고
            ,	fcltArea09: SBUxMethod.get('dtl-input-fcltArea09')                           //시설 면적 일반저장
            ,	fcltRmrk09: SBUxMethod.get('dtl-input-fcltRmrk09')      	                  			 //비고
            ,	fcltArea10: SBUxMethod.get('dtl-input-fcltArea10')                           //시설 면적 기타사항
            ,	fcltRmrk10: SBUxMethod.get('dtl-input-fcltRmrk10')      	                			 //비고
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltInfo.do", {
        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
	        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  apc코드
	        ,	fcltCd: SBUxMethod.get('dtl-input-fcltCd')   	                     //  시설 코드
	        ,	fcltNm: SBUxMethod.get('dtl-input-fcltNm')   	                     //  시설 명
	        ,	fcltAreaTot: SBUxMethod.get('dtl-input-fcltAreaTot')      	             //	시설 면적 총면적
	        ,	fcltRmrkTot: SBUxMethod.get('dtl-input-fcltRmrkTot')      	             //	시설 면적 총면적 비고
	        ,	fcltArea01: SBUxMethod.get('dtl-input-fcltArea01')                      //	시설 면적 집하선별포장장
	        ,	fcltRmrk01: SBUxMethod.get('dtl-input-fcltRmrk01')      	             //	비고
	        ,	fcltArea02: SBUxMethod.get('dtl-input-fcltArea02')                     //	시설 면적 세척,가공 등 처리
	        ,	fcltRmrk02: SBUxMethod.get('dtl-input-fcltRmrk02')      	             //	비고
	        ,	fcltArea03: SBUxMethod.get('dtl-input-fcltArea03')                     //	시설 면적 비 상품화시설
	        ,	fcltRmrk03: SBUxMethod.get('dtl-input-fcltRmrk03')      	             //	비고
	        ,	fcltArea04: SBUxMethod.get('dtl-input-fcltArea04')                     //	시설 면적 폐기물처리
	        ,	fcltRmrk04: SBUxMethod.get('dtl-input-fcltRmrk04')      	             //	비고
	        ,	fcltArea05: SBUxMethod.get('dtl-input-fcltArea05')                     //	시설 면적 예냉고
	        ,	fcltRmrk05: SBUxMethod.get('dtl-input-fcltRmrk05')      	             //	비고
	        ,	fcltArea06: SBUxMethod.get('dtl-input-fcltArea06')                     //	시설 면적 저온저장
	        ,	fcltRmrk06: SBUxMethod.get('dtl-input-fcltRmrk06')      	             //	비고
	        ,	fcltArea07: SBUxMethod.get('dtl-input-fcltArea07')                     //	시설 면적 CA저장고
	        ,	fcltRmrk07: SBUxMethod.get('dtl-input-fcltRmrk07')      	             //	비고
	        ,	fcltArea08: SBUxMethod.get('dtl-input-fcltArea08')                     //	시설 면적 큐어링
	        ,	fcltRmrk08: SBUxMethod.get('dtl-input-fcltRmrk08')      	             //	비고
	        ,	fcltArea09: SBUxMethod.get('dtl-input-fcltArea09')                     //	시설 면적 일반저장
	        ,	fcltRmrk09: SBUxMethod.get('dtl-input-fcltRmrk09')      	             //	비고
	        ,	fcltArea10: SBUxMethod.get('dtl-input-fcltArea10')                   //	시설 면적 기타사항
	        ,	fcltRmrk10: SBUxMethod.get('dtl-input-fcltRmrk10')                   //	비고
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
        const rows = grdFcltInfoList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
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
     	console.log("******************fn_subDelete**********************************");
 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltInfoList.do", list);

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
    	var nCol = grdFcltInfoList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFcltInfoList.getRow();
		if (nRow < 1) {
            return;
		}
		if(nRow == null){
			nRow = 1;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdFcltInfoList.getRowData(nRow);
		//console.log(rowData);

		//"null"로 들어가는 경우 방지
		rowData = fn_emptyString(rowData);

		//console.log(rowData);
		//console.log(rowData.fcltRmrk01);
		//console.log(typeof(rowData.fcltRmrk01));
    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);         //apc코드
    	SBUxMethod.set("dtl-input-fcltCd", rowData.fcltCd);      //apc코드
    	SBUxMethod.set("dtl-input-fcltNm", rowData.fcltNm);     //시설 코드
        SBUxMethod.set("dtl-input-fcltAreaTot", rowData.fcltAreaTot);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrkTot", rowData.fcltRmrkTot);      //비고
        SBUxMethod.set("dtl-input-fcltArea01", rowData.fcltArea01);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk01", rowData.fcltRmrk01);      //비고
        //let cval = SBUxMethod.get('dtl-input-fcltRmrk01')
        //console.log(cval);
        //console.log(typeof(cval));
        SBUxMethod.set("dtl-input-fcltArea02", rowData.fcltArea02);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk02", rowData.fcltRmrk02);      //비고
        SBUxMethod.set("dtl-input-fcltArea03", rowData.fcltArea03);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk03", rowData.fcltRmrk03);      //비고
        SBUxMethod.set("dtl-input-fcltArea04", rowData.fcltArea04);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk04", rowData.fcltRmrk04);      //비고
        SBUxMethod.set("dtl-input-fcltArea05", rowData.fcltArea05);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk05", rowData.fcltRmrk05);      //비고
        SBUxMethod.set("dtl-input-fcltArea06", rowData.fcltArea06);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk06", rowData.fcltRmrk06);      //비고
        SBUxMethod.set("dtl-input-fcltArea07", rowData.fcltArea07);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk07", rowData.fcltRmrk07);      //비고
        SBUxMethod.set("dtl-input-fcltArea08", rowData.fcltArea08);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk08", rowData.fcltRmrk08);      //비고
        SBUxMethod.set("dtl-input-fcltArea09", rowData.fcltArea09);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk09", rowData.fcltRmrk09);      //비고
        SBUxMethod.set("dtl-input-fcltArea10", rowData.fcltArea10);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk10", rowData.fcltRmrk10);      //비고

    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdFcltInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdFcltInfoList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}


	//총면적 합산
	function fn_areaSum(){
		extractNumbers();
		var totVal = 0;
		for (var i = 1; i <= 10; i++) {
			var num = i.toString().padStart(2, '0');
			console.log(num);
			totVal += parseInt(SBUxMethod.get("dtl-input-fcltArea"+num));
		}
		SBUxMethod.set("dtl-input-fcltAreaTot", totVal);
	}

	//면적 합산
	function fn_sumNumbers(e) {
        extractNumbers2(e);

        let sum = 0;

        document.querySelectorAll("input.sum").forEach(e =>{
        	sum += e.value/1;
        });
        console.log(sum.toFixed(1));
        SBUxMethod.set("dtl-input-fcltAreaTot", sum.toFixed(1));
    }

	// 숫자(소숫점 가능)만 입력
	function fn_extractNumbers2(e) {
		let chkVal = $(e).val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
		$(e).val(chkVal);
	}
	// "null" 로 들어가는 경우 방지
	function fn_emptyString(obj) {
		console.log("==========fn_emptyString=============");
	    if (Array.isArray(obj)) {
	        // 배열의 경우
	        for (var i = 0; i < obj.length; i++) {
	        	if (data[i] === "null" || data[i] === null) {
	                obj[i] = "";
	            }
	        }
	    } else if (typeof obj === "object") {
	        // 객체의 경우
	        for (var key in obj) {
	        	if (obj[key] === "null" || obj[key] === null) {
	                obj[key] = "";
	            }
	        }
	    }
	    return obj;
	}


</script>
</html>



