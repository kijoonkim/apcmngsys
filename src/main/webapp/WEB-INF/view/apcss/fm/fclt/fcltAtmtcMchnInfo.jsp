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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 스마트자동화</h3>
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
				<div><label>스마트자동화 상세내역</label></div>
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 50%">
							<col style="width: 50%">
						</colgroup>
						<tbody>
							<tr>
								<th>설비</th>
								<th>해당 설비 설치 여부</th>
							</tr>
							<tr>
								<td>규격</td>
								<td>
									<sbux-input id="dtl-input-specs" name="dtl-input-specs" uitype="text" class="form-control input-sm" placeholder="예시) 2대x1조 32등급" ></sbux-input>
								</td>
							</tr>
							<tr>
								<td>디팔렛타이저</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn" name="dtl-input-fcltHldYn"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동덤핑기</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn2" name="dtl-input-fcltHldYn2"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>전자식 중량 선별기</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn3" name="dtl-input-fcltHldYn3"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>비파괴 당도 선별기</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn4" name="dtl-input-fcltHldYn4"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>등급별 원물 자동 이송 장치</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn5" name="dtl-input-fcltHldYn5"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>공박스(망․톤백 등) 자동 배출 장치</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn6" name="dtl-input-fcltHldYn6"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동 박스(망․톤백 등) 포장기</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn7" name="dtl-input-fcltHldYn7"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동 소포장기</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn8" name="dtl-input-fcltHldYn8"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동랩핑기</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn9" name="dtl-input-fcltHldYn9"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>자동 중량체크기(포장 시)</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn10" name="dtl-input-fcltHldYn10"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>팔렛타이저(로봇팔 등)</td>
								<td class="td_input">
									<sbux-select id="dtl-input-fcltHldYn11" name="dtl-input-fcltHldYn11"
											uitype="single"
											filtering="true"
											jsondata-ref="selectYnData"
											unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
							</tr>
							<tr>
								<td>기타 가공설비</td>
								<td>
									<sbux-input id="dtl-input-otherFclt" name="dtl-input-otherFclt" uitype="text" class="form-control input-sm" placeholder="예시)착즙기, 커팅기 등" ></sbux-input>
								</td>
							</tr>
							<tr>
								<th class="th_bg">대상연도</th>
								<td class="td_input" colspan="1">
									<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td style="border-left: hidden;"></td>
							</tr>
							<tr>
								<th class="th_bg">apc명</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
									<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td style="border-left: hidden;">
								</td>
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
    var grdAtMcIfList; // 그리드를 담기위한 객체 선언
    var jsonAtMcIfList = []; // 그리드의 참조 데이터 주소 선언

	var selectYnData = [
		{'text': 'Y','label': 'Y', 'value': '1'},
		{'text': 'N','label': 'N', 'value': '2'}
	]
	var comboYnData = [
		{'label': 'Y', 'value': '1'},
		{'label': 'N', 'value': '2'}
	]


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdAtMcIfList';
	    SBGridProperties.jsonref = 'jsonAtMcIfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

            {caption: ["APC명"],			ref: 'apcNm',       		type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["규격"], 			ref: 'specs',   		type:'output',  	width:'8%',    style:'text-align:center'},
            {caption: ["티팔렛타이져"], 	ref: 'fcltHldYn',   		type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["자동덤핑기"],  	ref: 'fcltHldYn2',  			type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["전자식 중량 선별기"],  	ref: 'fcltHldYn3',  			type:'combo',  	width:'9%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["비파괴 당도 선별기"],  	ref: 'fcltHldYn4',  			type:'combo',  	width:'9%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["등급별 원물 자동 이송장치"],  	ref: 'fcltHldYn5',  			type:'combo',  	width:'9%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["공박스 자동 배출 장치"],  	ref: 'fcltHldYn6',  			type:'combo',  	width:'9%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["자동박스 포장기"],  	ref: 'fcltHldYn7',  			type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["자동 소포장기"],  	ref: 'fcltHldYn8',  			type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["자동랩핑기"],  	ref: 'fcltHldYn9',  			type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["자동중량체크기"],  	ref: 'fcltHldYn10',  			type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["팔렛타이져"],  	ref: 'fcltHldYn11',  			type:'combo',  	width:'8%',    style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["기타 가공설비"],  	ref: 'OTHER_FCLT',  			type:'output',  	width:'8%',    style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',       		type:'output',  	hidden: true},
            {caption: ["대상연도"],			ref: 'trgtYr',          	type:'output',  hidden: true}

        ];
        grdAtMcIfList = _SBGrid.create(SBGridProperties);
        grdAtMcIfList.bind('click', 'fn_view');
        grdAtMcIfList.bind('beforepagechanged', 'fn_pagingAtMcIfList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdAtMcIfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdAtMcIfList.getPageSize());
    	fn_pagingAtMcIfList(pageSize, pageNo);
    }


    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_pagingAtMcIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingAtMcIfList**********************************");
    	// form clear
    	fn_clearForm();

		grdAtMcIfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltAtmtcMchnInfoList.do", {
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

        	jsonAtMcIfList.length = 0;
        	//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
        		data.resultList.forEach((item, index) => {
    				const msg = {
    					trgtYr: item.trgtYr,						 	    //대상연도
    					apcCd: item.apcCd, 	 		 						//apc코드
    					apcNm: item.apcNm, 	 		 						//apc명
    					specs: item.specs,
    		    		fcltHldYn   : item.fcltHldYn,
    		    		fcltHldYn2  : item.fcltHldYn2,
    		    		fcltHldYn3  : item.fcltHldYn3,
    		    		fcltHldYn4  : item.fcltHldYn4,
    		    		fcltHldYn5  : item.fcltHldYn5,
    		    		fcltHldYn6  : item.fcltHldYn6,
    		    		fcltHldYn7  : item.fcltHldYn7,
    		    		fcltHldYn8  : item.fcltHldYn8,
    		    		fcltHldYn9  : item.fcltHldYn9,
    		    		fcltHldYn10 : item.fcltHldYn10,
    		    		fcltHldYn11 : item.fcltHldYn11,
    		    		otherFclt   : item.otherFclt
    				}

    				jsonAtMcIfList.push(msg);

    				if (index === 0) {
    					totalRecordCount = item.totalRecordCount;
    				}
    			});
        	}


        	if (jsonAtMcIfList.length > 0) {

        		if(grdAtMcIfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdAtMcIfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdAtMcIfList.rebuild();
				}else{
					grdAtMcIfList.refresh()
				}
        	} else {
        		grdAtMcIfList.setPageTotalCount(totalRecordCount);
        		grdAtMcIfList.rebuild();
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
		SBUxMethod.set("dtl-input-specs", null);
        SBUxMethod.set("dtl-input-fcltHldYn", null);
        SBUxMethod.set("dtl-input-fcltHldYn2", null);
        SBUxMethod.set("dtl-input-fcltHldYn3", null);
        SBUxMethod.set("dtl-input-fcltHldYn4", null);
        SBUxMethod.set("dtl-input-fcltHldYn5", null);
        SBUxMethod.set("dtl-input-fcltHldYn6", null);
        SBUxMethod.set("dtl-input-fcltHldYn7", null);
        SBUxMethod.set("dtl-input-fcltHldYn8", null);
        SBUxMethod.set("dtl-input-fcltHldYn9", null);
        SBUxMethod.set("dtl-input-fcltHldYn10", null);
        SBUxMethod.set("dtl-input-fcltHldYn11", null);
        SBUxMethod.set("dtl-input-otherFclt", null);

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명
		SBUxMethod.set("dtl-input-specs", null);
        SBUxMethod.set("dtl-input-fcltHldYn", null);
        SBUxMethod.set("dtl-input-fcltHldYn2", null);
        SBUxMethod.set("dtl-input-fcltHldYn3", null);
        SBUxMethod.set("dtl-input-fcltHldYn4", null);
        SBUxMethod.set("dtl-input-fcltHldYn5", null);
        SBUxMethod.set("dtl-input-fcltHldYn6", null);
        SBUxMethod.set("dtl-input-fcltHldYn7", null);
        SBUxMethod.set("dtl-input-fcltHldYn8", null);
        SBUxMethod.set("dtl-input-fcltHldYn9", null);
        SBUxMethod.set("dtl-input-fcltHldYn10", null);
        SBUxMethod.set("dtl-input-fcltHldYn11", null);
        SBUxMethod.set("dtl-input-otherFclt", null);

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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltAtmtcMchnInfo.do", {
    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
            ,	apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
            ,	specs: SBUxMethod.get('dtl-input-specs')
            ,	fcltHldYn: SBUxMethod.get('dtl-input-fcltHldYn')
			,	fcltHldYn2: SBUxMethod.get('dtl-input-fcltHldYn2')
			,	fcltHldYn3: SBUxMethod.get('dtl-input-fcltHldYn3')
			,	fcltHldYn4: SBUxMethod.get('dtl-input-fcltHldYn4')
			,	fcltHldYn5: SBUxMethod.get('dtl-input-fcltHldYn5')
			,	fcltHldYn6: SBUxMethod.get('dtl-input-fcltHldYn6')
			,	fcltHldYn7: SBUxMethod.get('dtl-input-fcltHldYn7')
			,	fcltHldYn8: SBUxMethod.get('dtl-input-fcltHldYn8')
			,	fcltHldYn9: SBUxMethod.get('dtl-input-fcltHldYn9')
			,	fcltHldYn10: SBUxMethod.get('dtl-input-fcltHldYn10')
			,	fcltHldYn11: SBUxMethod.get('dtl-input-fcltHldYn11')
			,	otherFclt: SBUxMethod.get('dtl-input-otherFclt')
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltAtmtcMchnInfo.do", {
	    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
	            ,	apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
	            ,	specs: SBUxMethod.get('dtl-input-specs')
	            ,	fcltHldYn: SBUxMethod.get('dtl-input-fcltHldYn')
				,	fcltHldYn2: SBUxMethod.get('dtl-input-fcltHldYn2')
				,	fcltHldYn3: SBUxMethod.get('dtl-input-fcltHldYn3')
				,	fcltHldYn4: SBUxMethod.get('dtl-input-fcltHldYn4')
				,	fcltHldYn5: SBUxMethod.get('dtl-input-fcltHldYn5')
				,	fcltHldYn6: SBUxMethod.get('dtl-input-fcltHldYn6')
				,	fcltHldYn7: SBUxMethod.get('dtl-input-fcltHldYn7')
				,	fcltHldYn8: SBUxMethod.get('dtl-input-fcltHldYn8')
				,	fcltHldYn9: SBUxMethod.get('dtl-input-fcltHldYn9')
				,	fcltHldYn10: SBUxMethod.get('dtl-input-fcltHldYn10')
				,	fcltHldYn11: SBUxMethod.get('dtl-input-fcltHldYn11')
				,	otherFclt: SBUxMethod.get('dtl-input-otherFclt')
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
        const rows = grdAtMcIfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
        */

		//console.log(grdAtMcIfList.getSelectedRows());
		const rows = grdAtMcIfList.getSelectedRows();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltAtmtcMchnInfo.do", {
    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')
            ,	apcCd: SBUxMethod.get('dtl-input-apcCd')
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
    	var nCol = grdAtMcIfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdAtMcIfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdAtMcIfList.getRowData(nRow);
        rowData = fn_emptyString(rowData);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
    	SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);
    	SBUxMethod.set("dtl-input-specs", rowData.specs);
    	SBUxMethod.set("dtl-input-fcltHldYn", rowData.fcltHldYn);
    	SBUxMethod.set("dtl-input-fcltHldYn2", rowData.fcltHldYn2);
    	SBUxMethod.set("dtl-input-fcltHldYn3", rowData.fcltHldYn3);
    	SBUxMethod.set("dtl-input-fcltHldYn4", rowData.fcltHldYn4);
    	SBUxMethod.set("dtl-input-fcltHldYn5", rowData.fcltHldYn5);
    	SBUxMethod.set("dtl-input-fcltHldYn6", rowData.fcltHldYn6);
    	SBUxMethod.set("dtl-input-fcltHldYn7", rowData.fcltHldYn7);
    	SBUxMethod.set("dtl-input-fcltHldYn8", rowData.fcltHldYn8);
    	SBUxMethod.set("dtl-input-fcltHldYn9", rowData.fcltHldYn9);
    	SBUxMethod.set("dtl-input-fcltHldYn10", rowData.fcltHldYn10);
    	SBUxMethod.set("dtl-input-fcltHldYn11", rowData.fcltHldYn11);
    	SBUxMethod.set("dtl-input-otherFclt", rowData.otherFclt);
    }



    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdAtMcIfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdAtMcIfList.setCellData(i+1, 1, checkedYn, true, false);
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
