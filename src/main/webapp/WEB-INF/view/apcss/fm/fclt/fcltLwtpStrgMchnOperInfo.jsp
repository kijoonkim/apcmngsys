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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 저온저장고 운영기간</h3>
			</div>
			<div style="margin-left: auto;">
				<!--
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				 -->
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary"  onclick="fn_save"></sbux-button>
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
			<div><label>저온저장고운영기간 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 9%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg"></th>
						<th class="th_bg">없음</th>
						<th class="th_bg">1</th>
						<th class="th_bg">2</th>
						<th class="th_bg">3</th>
						<th class="th_bg">4</th>
						<th class="th_bg">5</th>
						<th class="th_bg">6</th>
						<th class="th_bg">7</th>
						<th class="th_bg">8</th>
						<th class="th_bg">9</th>
						<th class="th_bg">10</th>
						<th class="th_bg">11</th>
						<th class="th_bg">12</th>
					</tr>
					<tr>
						<th class="th_bg">저온저장고<br>
							비수기간<br>
						</th>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn" name="dtl-input-fcltOperYn" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn1" name="dtl-input-fcltOperYn1" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn2" name="dtl-input-fcltOperYn2" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn3" name="dtl-input-fcltOperYn3" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn4" name="dtl-input-fcltOperYn4" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn5" name="dtl-input-fcltOperYn5" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn6" name="dtl-input-fcltOperYn6" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn7" name="dtl-input-fcltOperYn7" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn8" name="dtl-input-fcltOperYn8" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn9" name="dtl-input-fcltOperYn9" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn10" name="dtl-input-fcltOperYn10" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn11" name="dtl-input-fcltOperYn11" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td class="td_input">
							<p class="ad_input_row">
								<sbux-checkbox id="dtl-input-fcltOperYn12" name="dtl-input-fcltOperYn12" uitype="normal"  true-value = "1" false-value = "0"></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>

					</tr>
					<tr>
						<th class="th_bg">대상연도</th>
						<td class="td_input" colspan="2">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="11" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">apc명</th>
						<td class="td_input" colspan="2">
							<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="11" style="border-left: hidden;"></td>
					</tr>
				</tbody>
			</table>
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
    var grdLtMcOpIfList; // 그리드를 담기위한 객체 선언
    var jsonLtMOpcIfList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdLtMcOpIfList';
	    SBGridProperties.jsonref = 'jsonLtMOpcIfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APC명"],			ref: 'apcNm',           type:'output',  width:'10%',    style:'text-align:center'},
        	{caption: ["없음"],	    	ref: 'fcltOperYn',      type:'output',  width:'8%',    		style:'text-align:center'},
            {caption: ["1월"],	    	ref: 'fcltOperYn1',      type:'output',  width:'8%',    		style:'text-align:center'},
            {caption: ["2월"], 			ref: 'fcltOperYn2',     	type:'output',  width:'8%',    style:'text-align:center'},
            {caption: ["3월"],  			ref: 'fcltOperYn3',    type:'output',  width:'8%',    				style:'text-align:center'},
            {caption: ["4월"],   		ref: 'fcltOperYn4',    type:'output',  width:'8%',    			style:'text-align:center'},
            {caption: ["5월"],			ref: 'fcltOperYn5',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["6월"],			ref: 'fcltOperYn6',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["7월"],			ref: 'fcltOperYn7',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["8월"],			ref: 'fcltOperYn8',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["9월"],			ref: 'fcltOperYn9',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["10월"],			ref: 'fcltOperYn10',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["11월"],			ref: 'fcltOperYn11',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["12월"],			ref: 'fcltOperYn12',           type:'output',  width:'8%',   		style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',           type:'output',  hidden: true},
            {caption: ["대상년도"],		ref: 'trgtYr',          type:'output',  hidden: true},
            {caption: ["등록프로그램"], 	ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], 	ref: 'updProgram',  type:'output',  hidden: true}


        ];

        grdLtMcOpIfList = _SBGrid.create(SBGridProperties);
        grdLtMcOpIfList.bind('click', 'fn_view');
        grdLtMcOpIfList.bind('beforepagechanged', 'fn_pagingLtMOpcIfList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdLtMcOpIfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdLtMcOpIfList.getPageSize());
    	fn_setGrdLtMOpcIfList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingLtMOpcIfList = async function() {
    	console.log("******************fn_pagingLtMOpcIfList**********************************");
    	let recordCountPerPage = grdLtMcOpIfList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdLtMcOpIfList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdLtMOpcIfList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_setGrdLtMOpcIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdLtMOpcIfList**********************************");
    	// form clear
    	fn_clearForm();

		grdLtMcOpIfList.clearStatus();

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
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltLwtpStrgMchnOperInfoList.do", {
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

        	jsonLtMOpcIfList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					trgtYr: item.trgtYr,	 		                   //대상연도
					apcCd: item.apcCd, 	 			                   //apc코드
					apcNm: item.apcNm,      				                   // 순번
					fcltOperYn : item.fcltOperYn,
					fcltOperYn : item.fcltOperYn1,
					fcltOperYn2 : item.fcltOperYn2,
					fcltOperYn3 : item.fcltOperYn3,
					fcltOperYn4 : item.fcltOperYn4,
					fcltOperYn5 : item.fcltOperYn5,
					fcltOperYn6 : item.fcltOperYn6,
					fcltOperYn7 : item.fcltOperYn7,
					fcltOperYn8 : item.fcltOperYn8,
					fcltOperYn9 : item.fcltOperYn9,
					fcltOperYn10 : item.fcltOperYn10,
					fcltOperYn11 : item.fcltOperYn11,
					fcltOperYn12 : item.fcltOperYn12
				}


				jsonLtMOpcIfList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonLtMOpcIfList.length > 0) {

        		if(grdLtMcOpIfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdLtMcOpIfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdLtMcOpIfList.rebuild();
				}else{
					grdLtMcOpIfList.refresh()
				}
        	} else {
        		grdLtMcOpIfList.setPageTotalCount(totalRecordCount);
        		grdLtMcOpIfList.rebuild();
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
    	SBUxMethod.set("dtl-input-fcltOperYn", null);
    	SBUxMethod.set("dtl-input-fcltOperYn1", null);
    	SBUxMethod.set("dtl-input-fcltOperYn2", null);
    	SBUxMethod.set("dtl-input-fcltOperYn3", null);
    	SBUxMethod.set("dtl-input-fcltOperYn4", null);
    	SBUxMethod.set("dtl-input-fcltOperYn5", null);
    	SBUxMethod.set("dtl-input-fcltOperYn6", null);
    	SBUxMethod.set("dtl-input-fcltOperYn7", null);
    	SBUxMethod.set("dtl-input-fcltOperYn8", null);
    	SBUxMethod.set("dtl-input-fcltOperYn9", null);
    	SBUxMethod.set("dtl-input-fcltOperYn10", null);
    	SBUxMethod.set("dtl-input-fcltOperYn11", null);
    	SBUxMethod.set("dtl-input-fcltOperYn12", null);
    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명
    	SBUxMethod.set("dtl-input-fcltOperYn", null);
    	SBUxMethod.set("dtl-input-fcltOperYn1", null);
    	SBUxMethod.set("dtl-input-fcltOperYn2", null);
    	SBUxMethod.set("dtl-input-fcltOperYn3", null);
    	SBUxMethod.set("dtl-input-fcltOperYn4", null);
    	SBUxMethod.set("dtl-input-fcltOperYn5", null);
    	SBUxMethod.set("dtl-input-fcltOperYn6", null);
    	SBUxMethod.set("dtl-input-fcltOperYn7", null);
    	SBUxMethod.set("dtl-input-fcltOperYn8", null);
    	SBUxMethod.set("dtl-input-fcltOperYn9", null);
    	SBUxMethod.set("dtl-input-fcltOperYn10", null);
    	SBUxMethod.set("dtl-input-fcltOperYn11", null);
    	SBUxMethod.set("dtl-input-fcltOperYn12", null);

    }
    //저장







    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		/*
    	if (!SBUxMethod.get("gsb-slt-apcCd")) {
            alert("조회 항목의 APC 코드를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("srch-input-trgtYr")) {
            alert("조회 항목의 대상년도를 선택하세요.");
            return;
        }
		*/

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

    	const postJsonPromise = gfn_postJSON('/fm/fclt/insertFcltLwtpStrgMchnOperInfo.do', {
    	 	trgtYr: SBUxMethod.get('srch-input-trgtYr') , // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
        	apcCd: SBUxMethod.get('gsb-slt-apcCd'), // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
        	fcltOperYn: SBUxMethod.get('dtl-input-fcltOperYn'),
        	fcltOperYn1: SBUxMethod.get('dtl-input-fcltOperYn1'),
        	fcltOperYn2: SBUxMethod.get('dtl-input-fcltOperYn2'),
        	fcltOperYn3: SBUxMethod.get('dtl-input-fcltOperYn3'),
        	fcltOperYn4: SBUxMethod.get('dtl-input-fcltOperYn4'),
        	fcltOperYn5: SBUxMethod.get('dtl-input-fcltOperYn5'),
        	fcltOperYn6: SBUxMethod.get('dtl-input-fcltOperYn6'),
        	fcltOperYn7: SBUxMethod.get('dtl-input-fcltOperYn7'),
        	fcltOperYn8: SBUxMethod.get('dtl-input-fcltOperYn8'),
        	fcltOperYn9: SBUxMethod.get('dtl-input-fcltOperYn9'),
        	fcltOperYn10: SBUxMethod.get('dtl-input-fcltOperYn10'),
        	fcltOperYn11: SBUxMethod.get('dtl-input-fcltOperYn11'),
        	fcltOperYn12: SBUxMethod.get('dtl-input-fcltOperYn12'),
			daddr:1
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltLwtpStrgMchnOperInfo.do", {
		    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
		        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
		        ,	fcltOperYn: $('#dtl-input-fcltOperYn').val()
		        ,	fcltOperYn1: $('#dtl-input-fcltOperYn1').val()
		        ,	fcltOperYn2: $('#dtl-input-fcltOperYn2').val()
		        ,	fcltOperYn3: $('#dtl-input-fcltOperYn3').val()
		        ,	fcltOperYn4: $('#dtl-input-fcltOperYn4').val()
		        ,	fcltOperYn5: $('#dtl-input-fcltOperYn5').val()
		        ,	fcltOperYn6: $('#dtl-input-fcltOperYn6').val()
		        ,	fcltOperYn7: $('#dtl-input-fcltOperYn7').val()
		        ,	fcltOperYn8: $('#dtl-input-fcltOperYn8').val()
		        ,	fcltOperYn9: $('#dtl-input-fcltOperYn9').val()
		        ,	fcltOperYn10: $('#dtl-input-fcltOperYn10').val()
		        ,	fcltOperYn11: $('#dtl-input-fcltOperYn11').val()
		        ,	fcltOperYn12: $('#dtl-input-fcltOperYn12').val()
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
        const rows = grdLtMcOpIfList.getGridDataAll();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltLwtpStrgMchnOperInfo.do", list);

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
    	var nCol = grdLtMcOpIfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdLtMcOpIfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdLtMcOpIfList.getRowData(nRow);


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                     //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                       //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                       //apc코드
    	SBUxMethod.set("dtl-input-fcltOperYn", fn_checkChk(rowData.fcltOperYn));
    	SBUxMethod.set("dtl-input-fcltOperYn1", fn_checkChk(rowData.fcltOperYn));
    	SBUxMethod.set("dtl-input-fcltOperYn2", fn_checkChk(rowData.fcltOperYn2));
    	SBUxMethod.set("dtl-input-fcltOperYn3", fn_checkChk(rowData.fcltOperYn3));
    	SBUxMethod.set("dtl-input-fcltOperYn4", fn_checkChk(rowData.fcltOperYn4));
    	SBUxMethod.set("dtl-input-fcltOperYn5", fn_checkChk(rowData.fcltOperYn5));
    	SBUxMethod.set("dtl-input-fcltOperYn6", fn_checkChk(rowData.fcltOperYn6));
    	SBUxMethod.set("dtl-input-fcltOperYn7", fn_checkChk(rowData.fcltOperYn7));
    	SBUxMethod.set("dtl-input-fcltOperYn8", fn_checkChk(rowData.fcltOperYn8));
    	SBUxMethod.set("dtl-input-fcltOperYn9", fn_checkChk(rowData.fcltOperYn9));
    	SBUxMethod.set("dtl-input-fcltOperYn10", fn_checkChk(rowData.fcltOperYn10));
    	SBUxMethod.set("dtl-input-fcltOperYn11", fn_checkChk(rowData.fcltOperYn11));
    	SBUxMethod.set("dtl-input-fcltOperYn12", fn_checkChk(rowData.fcltOperYn12));
    }

    function fn_checkChk(value){

        if (value === null || value === "0") {
            return "0";
        } else {
            return "1";
        }
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdLtMcOpIfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdLtMcOpIfList.setCellData(i+1, 1, checkedYn, true, false);
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

</script>

</html>