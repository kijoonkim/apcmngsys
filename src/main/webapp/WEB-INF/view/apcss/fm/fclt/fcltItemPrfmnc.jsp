<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 산지유통시설품목처리실적</h3>
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
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:150px;"></div>
				</div>
												<br>
			<div><label>산지유통시설품목처리실적 상세내역</label></div>
			<div style="display: flex;"><label style="font-size: x-small; margin-left: auto;">(단위: 백만원,톤,%)</label></div>
			<br>

			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
					</colgroup>
						<tbody>
							<tr>
								<th>품목명</th>
								<th>APC취급액(A)</th>
								<th>APC취급물량</th>
								<th>APC취급액 중<br>통합마케팅 출하액(B)</th>
								<th>통합마케팅<br>출하비율(B/A*100)</th>
							</tr>
							<tr>
								<td>품목1</td>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera1',1,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera2',2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera3',3,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<td>품목2</td>
								<td>
									<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera5',1,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera6',2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera7',3,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<td>품목3</td>
								<td>
									<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera9',1,3)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera10',2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera11" name="srch-inp-opera11" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera11',3,3)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera12" name="srch-inp-opera12" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<td>기타</td>
								<td>
									<sbux-input id="srch-inp-opera13" name="srch-inp-opera13" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera13',1,4)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera14" name="srch-inp-opera14" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera14',2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera15" name="srch-inp-opera15" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera15',3,4)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera16" name="srch-inp-opera16" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<td>합계</td>
								<td>
									<sbux-input id="srch-inp-opera17" name="srch-inp-opera17" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera18" name="srch-inp-opera18" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera19" name="srch-inp-opera19" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera20" name="srch-inp-opera20" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div><label style="font-size: x-small;">* 해당 산지유통시설에서 처리하는 전체 품목의 취급액, 취급물량, 통합마케팅 출하액, 통합마케팅 출하비율을 기재.</label><div>
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
</body>
<script type="text/javascript">

	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
    	fn_createGrid();//그리드 생성 설정 함수

    });

    //grid 초기화
    var grdItmPrfList; // 그리드를 담기위한 객체 선언
    var jsonItmPrfList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdItmPrfList';
	    SBGridProperties.jsonref = 'jsonItmPrfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

        	{caption: ["APC명","APC명"],		ref: 'apcNm',       		type:'output',  	width:'10%',    style:'text-align:center'},

        	{caption: ["품목1","APC취급액(A)"],  	ref: 'fcltItemTrmtAmt',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목1","APC취급물량"],  	ref: 'fcltItemTrmtVlm',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목1","APC취급액중 통함바케팅 출하액(B)"],  	ref: 'fcltItemSpmtAmt',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목1","통합마케팅출하비용(B/A)"],  	ref: 'fcltItemSpmtRt',  			type:'output',  	width:'5%',    style:'text-align:center' ,calc : 'fn_fcltItemSpmtRtCal' },

            {caption: ["품목2","APC취급액(A)"],  	ref: 'fcltItemTrmtAmt2',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목2","APC취급물량"],  	ref: 'fcltItemTrmtVlm2',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목2","APC취급액중 통함바케팅 출하액(B)"],  	ref: 'fcltItemSpmtAmt2',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목2","통합마케팅출하비용(B/A)"],  	ref: 'fcltItemSpmtRt2',  			type:'output',  	width:'5%',    style:'text-align:center' ,calc : 'fn_fcltItemSpmtRtCal'},

            {caption: ["품목3","APC취급액(A)"],  	ref: 'fcltItemTrmtAmt3',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목3","APC취급물량"],  	ref: 'fcltItemTrmtVlm3',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목3","APC취급액중 통함바케팅 출하액(B)"],  	ref: 'fcltItemSpmtAmt3',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["품목3","통합마케팅출하비용(B/A)"],  	ref: 'fcltItemSpmtRt3',  			type:'output',  	width:'5%',    style:'text-align:center' ,calc : 'fn_fcltItemSpmtRtCal'},

            {caption: ["기타품목","APC취급액(A)"],  	ref: 'fcltItemTrmtAmt4',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["기타품목","APC취급물량"],  	ref: 'fcltItemTrmtVlm4',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["기타품목","APC취급액중 통함바케팅 출하액(B)"],  	ref: 'fcltItemSpmtAmt4',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["기타품목","통합마케팅출하비용(B/A)"],  	ref: 'fcltItemSpmtRt4',  			type:'output',  	width:'5%',    style:'text-align:center' ,calc : 'fn_fcltItemSpmtRtCal'},

            {caption: ["기타품목","APC취급액(A)"],  	ref: 'fcltItemTrmtAmt5',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["기타품목","APC취급물량"],  	ref: 'fcltItemTrmtVlm5',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["기타품목","APC취급액중 통함바케팅 출하액(B)"],  	ref: 'fcltItemSpmtAmt5',  			type:'output',  	width:'5%',    style:'text-align:center'},
            {caption: ["기타품목","통합마케팅출하비용(B/A)"],  	ref: 'fcltItemSpmtRt5',  			type:'output',  	width:'5%',    style:'text-align:center' ,calc : 'fn_fcltItemSpmtRtCal'},

            {caption: ["APCCD"],		ref: 'apcCd',       		type:'output',  	hidden: true},
            {caption: ["대상연도"],			ref: 'trgtYr',          	type:'output',  hidden: true}

        ];
        grdItmPrfList = _SBGrid.create(SBGridProperties);
        grdItmPrfList.bind('click', 'fn_view');
        grdItmPrfList.bind('beforepagechanged', 'fn_pagingItmPrfList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdItmPrfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdItmPrfList.getPageSize());
    	fn_pagingItmPrfList(pageSize, pageNo);
    }
    /**
     *
     */

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_pagingItmPrfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingItmPrfList**********************************");
    	// form clear
    	fn_clearForm();

		grdItmPrfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

        //비동기 포스트타입 url 데이터연결 페이징처리 글로벌
        //gfn_postJSON 는 ajax고 post통신의 데이터를 json 타입으로 보내는것이다
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltItemPrfmncList.do", {
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

        	jsonItmPrfList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					trgtYr: item.trgtYr,						 	    //대상연도
					apcCd: item.apcCd, 	 		 						//apc코드
					apcNm: item.apcNm, 	 		 						//apc명
					fcltItemSpmtAmt: item.fcltItemSpmtAmt,
					fcltItemSpmtAmt2: item.fcltItemSpmtAmt2,
					fcltItemSpmtAmt3: item.fcltItemSpmtAmt3,
					fcltItemSpmtAmt4: item.fcltItemSpmtAmt4,
					fcltItemSpmtAmt5: item.fcltItemSpmtAmt5,

					fcltItemTrmtVlm: item.fcltItemTrmtVlm,
					fcltItemTrmtVlm2: item.fcltItemTrmtVlm2,
					fcltItemTrmtVlm3: item.fcltItemTrmtVlm3,
					fcltItemTrmtVlm4: item.fcltItemTrmtVlm4,
					fcltItemTrmtVlm5: item.fcltItemTrmtVlm5,

					fcltItemMrktAmt: item.fcltItemMrktAmt,
					fcltItemMrktAmt2: item.fcltItemMrktAmt2,
					fcltItemMrktAmt3: item.fcltItemMrktAmt3,
					fcltItemMrktAmt4: item.fcltItemMrktAmt4,
					fcltItemMrktAmt5: item.fcltItemMrktAmt5
				}

				jsonItmPrfList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}

			});
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonItmPrfList.length > 0) {

        		if(grdItmPrfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdItmPrfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdItmPrfList.rebuild();
				}else{
					grdItmPrfList.refresh()
				}
        	} else {
        		grdItmPrfList.setPageTotalCount(totalRecordCount);
        		grdItmPrfList.rebuild();
        	}

        	document.querySelector('#listCount').innerText = totalRecordCount;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		//console.error("failed", e.message);
        }
    }

    //신규 작성 dtl 내부의 값을 null로
    function fn_create() {
    	console.log("******************fn_create**********************************");
    	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명

        SBUxMethod.set("srch-inp-opera1", null);
        SBUxMethod.set("srch-inp-opera2", null);
        SBUxMethod.set("srch-inp-opera3", null);
        SBUxMethod.set("srch-inp-opera4", null);
        SBUxMethod.set("srch-inp-opera5", null);
        SBUxMethod.set("srch-inp-opera6", null);
        SBUxMethod.set("srch-inp-opera7", null);
        SBUxMethod.set("srch-inp-opera8", null);
        SBUxMethod.set("srch-inp-opera9", null);
        SBUxMethod.set("srch-inp-opera10", null);

        SBUxMethod.set("srch-inp-opera11", null);
        SBUxMethod.set("srch-inp-opera12", null);
        SBUxMethod.set("srch-inp-opera13", null);
        SBUxMethod.set("srch-inp-opera14", null);
        SBUxMethod.set("srch-inp-opera15", null);
        SBUxMethod.set("srch-inp-opera16", null);
        SBUxMethod.set("srch-inp-opera17", null);
        SBUxMethod.set("srch-inp-opera18", null);
        SBUxMethod.set("srch-inp-opera19", null);
        SBUxMethod.set("srch-inp-opera20", null);

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명

        SBUxMethod.set("srch-inp-opera1", null);
        SBUxMethod.set("srch-inp-opera2", null);
        SBUxMethod.set("srch-inp-opera3", null);
        SBUxMethod.set("srch-inp-opera4", null);
        SBUxMethod.set("srch-inp-opera5", null);
        SBUxMethod.set("srch-inp-opera6", null);
        SBUxMethod.set("srch-inp-opera7", null);
        SBUxMethod.set("srch-inp-opera8", null);
        SBUxMethod.set("srch-inp-opera9", null);
        SBUxMethod.set("srch-inp-opera10", null);

        SBUxMethod.set("srch-inp-opera11", null);
        SBUxMethod.set("srch-inp-opera12", null);
        SBUxMethod.set("srch-inp-opera13", null);
        SBUxMethod.set("srch-inp-opera14", null);
        SBUxMethod.set("srch-inp-opera15", null);
        SBUxMethod.set("srch-inp-opera16", null);
        SBUxMethod.set("srch-inp-opera17", null);
        SBUxMethod.set("srch-inp-opera18", null);
        SBUxMethod.set("srch-inp-opera19", null);
        SBUxMethod.set("srch-inp-opera20", null);

    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

    	if (!SBUxMethod.get("gsb-slt-apcCd")) {
            alert("조회 항목의 APC 코드를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("srch-input-trgtYr")) {
            alert("조회 항목의 대상년도를 선택하세요.");
            return;
        }



    	if (gfn_isEmpty(trgtYr)) {
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltItemPrfmnc.do", {
        		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
            	,apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
				,fcltItemSpmtAmt : SBUxMethod.get('srch-inp-opera1')
				,fcltItemSpmtAmt2 : SBUxMethod.get('srch-inp-opera5')
				,fcltItemSpmtAmt3 : SBUxMethod.get('srch-inp-opera9')
				,fcltItemSpmtAmt4 : SBUxMethod.get('srch-inp-opera13')
				,fcltItemSpmtAmt5 : SBUxMethod.get('srch-inp-opera17')

				,fcltItemTrmtVlm : SBUxMethod.get('srch-inp-opera2')
				,fcltItemTrmtVlm2 : SBUxMethod.get('srch-inp-opera6')
				,fcltItemTrmtVlm3 : SBUxMethod.get('srch-inp-opera10')
				,fcltItemTrmtVlm4 : SBUxMethod.get('srch-inp-opera14')
				,fcltItemTrmtVlm5 : SBUxMethod.get('srch-inp-opera18')

				,fcltItemMrktAmt : SBUxMethod.get('srch-inp-opera3')
				,fcltItemMrktAmt2 : SBUxMethod.get('srch-inp-opera7')
				,fcltItemMrktAmt3 : SBUxMethod.get('srch-inp-opera11')
				,fcltItemMrktAmt4 : SBUxMethod.get('srch-inp-opera15')
				,fcltItemMrktAmt5 : SBUxMethod.get('srch-inp-opera19')
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
    	 console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltItemPrfmnc.do", {
	    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
	        	,apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
				,fcltItemSpmtAmt : SBUxMethod.get('srch-inp-opera1')
				,fcltItemSpmtAmt2 : SBUxMethod.get('srch-inp-opera5')
				,fcltItemSpmtAmt3 : SBUxMethod.get('srch-inp-opera9')
				,fcltItemSpmtAmt4 : SBUxMethod.get('srch-inp-opera13')
				,fcltItemSpmtAmt5 : SBUxMethod.get('srch-inp-opera17')

				,fcltItemTrmtVlm : SBUxMethod.get('srch-inp-opera2')
				,fcltItemTrmtVlm2 : SBUxMethod.get('srch-inp-opera6')
				,fcltItemTrmtVlm3 : SBUxMethod.get('srch-inp-opera10')
				,fcltItemTrmtVlm4 : SBUxMethod.get('srch-inp-opera14')
				,fcltItemTrmtVlm5 : SBUxMethod.get('srch-inp-opera18')

				,fcltItemMrktAmt : SBUxMethod.get('srch-inp-opera3')
				,fcltItemMrktAmt2 : SBUxMethod.get('srch-inp-opera7')
				,fcltItemMrktAmt3 : SBUxMethod.get('srch-inp-opera11')
				,fcltItemMrktAmt4 : SBUxMethod.get('srch-inp-opera15')
				,fcltItemMrktAmt5 : SBUxMethod.get('srch-inp-opera19')
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
        const rows = grdItmPrfList.getGridDataAll();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltItemPrfmnc.do", list);

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
    	var nCol = grdItmPrfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdItmPrfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdItmPrfList.getRowData(nRow);


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드

        SBUxMethod.set("srch-inp-opera1", rowData.fcltItemSpmtAmt);
        SBUxMethod.set("srch-inp-opera5", rowData.fcltItemSpmtAmt2);
        SBUxMethod.set("srch-inp-opera9", rowData.fcltItemSpmtAmt3);
        SBUxMethod.set("srch-inp-opera13", rowData.fcltItemSpmtAmt4);
        SBUxMethod.set("srch-inp-opera17", rowData.fcltItemSpmtAmt5);

        SBUxMethod.set("srch-inp-opera2", rowData.fcltItemTrmtVlm);
        SBUxMethod.set("srch-inp-opera6", rowData.fcltItemTrmtVlm2);
        SBUxMethod.set("srch-inp-opera10", rowData.fcltItemTrmtVlm3);
        SBUxMethod.set("srch-inp-opera14", rowData.fcltItemTrmtVlm4);
        SBUxMethod.set("srch-inp-opera18", rowData.fcltItemTrmtVlm5);

        SBUxMethod.set("srch-inp-opera3", rowData.fcltItemMrktAmt);
        SBUxMethod.set("srch-inp-opera7", rowData.fcltItemMrktAmt2);
        SBUxMethod.set("srch-inp-opera11", rowData.fcltItemMrktAmt3);
        SBUxMethod.set("srch-inp-opera15", rowData.fcltItemMrktAmt4);
        SBUxMethod.set("srch-inp-opera19", rowData.fcltItemMrktAmt5);

        sum('srch-inp-opera1',1,1);
        sum('srch-inp-opera5',1,2);
        sum('srch-inp-opera9',1,3);
        sum('srch-inp-opera13',1,4);
        sum('srch-inp-opera17',1,5);

        sum('srch-inp-opera2',2);
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdItmPrfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdItmPrfList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }


	//국고 지자체 자부담 합계
    function sum(name, idx , idx2){
    	//console.log("=========sum==========");
    	extractNumbers2(name);

    	if(idx == 1 ){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera1'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera5'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera9'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera13'));
    		SBUxMethod.set('srch-inp-opera17',sum);
    		cal(idx2);
    	}else if (idx == 2){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera2'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera10'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera14'));
			SBUxMethod.set('srch-inp-opera18',sum);
    	}else if (idx ==3){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera11'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera15'));
			SBUxMethod.set('srch-inp-opera19',sum);
			cal(idx2);
    	}
    }

	//통합마케팅 출하비율 계산
    function cal(idx2) {
		//console.log("=========cal==========");
    	if(idx2 == 1){
    		let calVal = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3')) / convertToNumberOrZero(SBUxMethod.get('srch-inp-opera1')) * 100;
    		SBUxMethod.set('srch-inp-opera4',calVal.toFixed(2));
    	}else if(idx2 == 2){
    		let calVal = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7')) / convertToNumberOrZero(SBUxMethod.get('srch-inp-opera5')) * 100;
    		SBUxMethod.set('srch-inp-opera8',calVal.toFixed(2));
    	}else if(idx2 == 3){
    		let calVal = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera11')) / convertToNumberOrZero(SBUxMethod.get('srch-inp-opera9')) * 100;
    		SBUxMethod.set('srch-inp-opera12',calVal.toFixed(2));
    	}else if(idx2 == 4){
    		let calVal = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera15')) / convertToNumberOrZero(SBUxMethod.get('srch-inp-opera13')) * 100;
    		SBUxMethod.set('srch-inp-opera16',calVal.toFixed(2));
    	}
    	let calVal2 = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera17')) / convertToNumberOrZero(SBUxMethod.get('srch-inp-opera19')) * 100;
    	SBUxMethod.set('srch-inp-opera20',calVal2.toFixed(2));
    }

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}

    // 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
			SBUxMethod.set(input,inputValue.replace(/\D/g, ""));
		}
	}

	//값이 없는 경우 0 있는 경우 숫자로 반환
	function convertToNumberOrZero(value) {
	  // 값이 없는 경우 0으로 설정
	  if (value === undefined || value === null) {
	    return 0;
	  }

	  // 값이 있는 경우 숫자로 변환하고 반환
	  const numericValue = Number(value);
	  if (isNaN(numericValue)) {
	    return 0; // 변환 실패 시 0 반환
	  } else {
	    return numericValue;
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

	function fn_fcltItemSpmtRtCal(objGrid, nRow, nCol){

		if (nCol == objGrid.getColRef('fcltItemSpmtRt')){
			let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemSpmtAmt')));
		    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemTrmtVlm')));
		    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemMrktAmt')));
		    let sum1 = value1 + value2 + value3;
		    return sum1.toString();
		}

		if (nCol == objGrid.getColRef('fcltItemSpmtRt2')){
			let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemSpmtAmt2')));
		    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemTrmtVlm2')));
		    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemMrktAmt2')));
		    let sum1 = value1 + value2 + value3;
		    return sum1.toString();
		}

		if (nCol == objGrid.getColRef('fcltItemSpmtRt3')){
			let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemSpmtAmt3')));
		    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemTrmtVlm3')));
		    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemMrktAmt3')));
		    let sum1 = value1 + value2 + value3;
		    return sum1.toString();
		}

		if (nCol == objGrid.getColRef('fcltItemSpmtRt4')){
			let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemSpmtAmt4')));
		    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemTrmtVlm4')));
		    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemMrktAmt4')));
		    let sum1 = value1 + value2 + value3;
		    return sum1.toString();
		}

		if (nCol == objGrid.getColRef('fcltItemSpmtRt5')){
			let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemSpmtAmt5')));
		    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemTrmtVlm5')));
		    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltItemMrktAmt5')));
		    let sum1 = value1 + value2 + value3;
		    return sum1.toString();
		}
	}

</script>

</html>