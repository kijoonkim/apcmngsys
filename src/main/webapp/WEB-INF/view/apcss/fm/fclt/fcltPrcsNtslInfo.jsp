<%
 /**
  * @Class Name : fcltPrcsNtslInfo.jsp
  * @Description : 산지유통판매처 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 산지유통판매처 -->
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
			<div><label>산지유통판매처 상세내역</label></div>
			<div>
				<label style="font-size: x-small; font-weight: bold;">◦ (산지유통시설 처리상품 주요 판매처) </label>
				<label style="font-size: x-small;">출자·출하조직은 생산유통통합조직 통해서 판매한 실적 및 직접 판매한 실적을 합산하여 기재. 기타항목은 다른 유통조직에 판매한 금액</label>
			</div>
			<div style="display: flex; font-size: x-small;"><label style="margin-left:auto; ">(금액: 백만원)</label></div>
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
								<th>대형유통업체(백화점 포함)</th>
								<th>식자재업체<br>
								(학교급식, 가공업체 포함)<br>
								</th>
								<th>도매시장<br>(공판장 포함)</th>
								<th>소매업체 직판</th>
								<th>수출</th>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera1')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera1')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera2')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera2')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera3')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera3')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera4')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera4')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera5')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera5')"></sbux-input>
								</td>
							</tr>
							<tr>
								<th>홈쇼핑(TV매체)</th>
								<th>온라인B2B</th>
								<th>온라인(B2C)</th>
								<th>기타</th>
								<th>계</th>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera6')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera6')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera7')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera7')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera8')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera8')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text"
									onblur="fn_extractNumbers2('srch-inp-opera9')"
									class="form-control input-sm" placeholder="단위: 백만원" onkeyup="fn_sum('srch-inp-opera9')"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<th class="th_bg">대상연도</th>
								<td class="td_input" colspan="1">
									<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td colspan="4" style="border-left: hidden;"></td>
							</tr>
							<tr>
								<th class="th_bg">apc명</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
									<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td colspan="4"  style="border-left: hidden;"></td>
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

        	{caption: ["APC명"],					ref: 'apcNm',       				type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["대형유통업체(백화점포함)"], 		ref: 'fcltNtslCd',   		type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["식자제업체(학교급식, 가공업체)"],  	ref: 'fcltNtslCd2',  		type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["도매시장(공판장포함)"],  			ref: 'fcltNtslCd3',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["소매업체 직판"],  				ref: 'fcltNtslCd4',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["수출"],  						ref: 'fcltNtslCd5',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["홈쇼핑(TV매체)"],  			ref: 'fcltNtslCd6',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["온라인(B2B)"],  				ref: 'fcltNtslCd7',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["온라인(B2C)"],  				ref: 'fcltNtslCd8',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["기타"],  						ref: 'fcltNtslCd9',  			type:'output',  	width:'10%',    style:'text-align:center'},
            {caption: ["계"],  						ref: 'fcltNtslCd10',  			type:'output',  	width:'10%',    style:'text-align:center' , calc : 'fn_fcltNtslCdSum'},
            {caption: ["APCCD"],					ref: 'apcCd',       				type:'output',  	hidden: false},
            {caption: ["대상연도"],					ref: 'trgtYr',          			type:'output',  	hidden: false}

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

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsNtslInfoList.do", {
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
    		//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
        		data.resultList.forEach((item, index) => {
    				const msg = {
    					trgtYr: item.trgtYr,						 	    //대상연도
    					apcCd: item.apcCd, 	 		 						//apc코드
    					apcNm: item.apcNm, 	 		 						//apc명
    					fcltNtslCd: item.fcltNtslCd,
    					fcltNtslCd2: item.fcltNtslCd2,
    					fcltNtslCd3: item.fcltNtslCd3,
    					fcltNtslCd4: item.fcltNtslCd4,
    					fcltNtslCd5: item.fcltNtslCd5,
    					fcltNtslCd6: item.fcltNtslCd6,
    					fcltNtslCd7: item.fcltNtslCd7,
    					fcltNtslCd8: item.fcltNtslCd8,
    					fcltNtslCd9: item.fcltNtslCd9
    				}



    				jsonItmPrfList.push(msg);

    				if (index === 0) {
    					totalRecordCount = item.totalRecordCount;
    				}

    			});
        	}


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
    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("dtl-input-apcCd");
		let trgtYr = SBUxMethod.get("dtl-input-trgtYr");

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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltPrcsNtslInfo.do", {
        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
            ,apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
            ,fcltNtslCd : SBUxMethod.get('srch-inp-opera1')
    		,fcltNtslCd2 : SBUxMethod.get('srch-inp-opera2')
    		,fcltNtslCd3 : SBUxMethod.get('srch-inp-opera3')
    		,fcltNtslCd4 : SBUxMethod.get('srch-inp-opera4')
    		,fcltNtslCd5 : SBUxMethod.get('srch-inp-opera5')
    		,fcltNtslCd6 : SBUxMethod.get('srch-inp-opera6')
    		,fcltNtslCd7 : SBUxMethod.get('srch-inp-opera7')
    		,fcltNtslCd8 : SBUxMethod.get('srch-inp-opera8')
    		,fcltNtslCd9 : SBUxMethod.get('srch-inp-opera9')
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltPrcsNtslInfo.do", {
	        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
	            ,apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
	            ,fcltNtslCd : SBUxMethod.get('srch-inp-opera1')
	    		,fcltNtslCd2 : SBUxMethod.get('srch-inp-opera2')
	    		,fcltNtslCd3 : SBUxMethod.get('srch-inp-opera3')
	    		,fcltNtslCd4 : SBUxMethod.get('srch-inp-opera4')
	    		,fcltNtslCd5 : SBUxMethod.get('srch-inp-opera5')
	    		,fcltNtslCd6 : SBUxMethod.get('srch-inp-opera6')
	    		,fcltNtslCd7 : SBUxMethod.get('srch-inp-opera7')
	    		,fcltNtslCd8 : SBUxMethod.get('srch-inp-opera8')
	    		,fcltNtslCd9 : SBUxMethod.get('srch-inp-opera9')
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
        const rows = grdItmPrfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
        */

      //console.log(grdItmPrfList.getSelectedRows());
		const rows = grdItmPrfList.getSelectedRows();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltPrcsNtslInfo.do", {
        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')
            ,apcCd: SBUxMethod.get('dtl-input-apcCd')
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


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       				  //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         				  //apc코드
    	SBUxMethod.set("dtl-input-sn", rowData.sn);     		 				  //순번
    	SBUxMethod.set("dtl-input-fcltStrCd", rowData.fcltStrCd);     	  //시설 판매처 코드
    	SBUxMethod.set("dtl-input-fcltNtslCd", rowData.fcltNtslCd);     //시설 판매금액

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                     //  APC명
        SBUxMethod.set("srch-inp-opera1", rowData.fcltNtslCd);
        SBUxMethod.set("srch-inp-opera2", rowData.fcltNtslCd2);
        SBUxMethod.set("srch-inp-opera3", rowData.fcltNtslCd3);
        SBUxMethod.set("srch-inp-opera4", rowData.fcltNtslCd4);
        SBUxMethod.set("srch-inp-opera5", rowData.fcltNtslCd5);
        SBUxMethod.set("srch-inp-opera6", rowData.fcltNtslCd6);
        SBUxMethod.set("srch-inp-opera7", rowData.fcltNtslCd7);
        SBUxMethod.set("srch-inp-opera8", rowData.fcltNtslCd8);
        SBUxMethod.set("srch-inp-opera9", rowData.fcltNtslCd9);

        fn_sum('srch-inp-opera1');
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
    function fn_sum(name){
    	fn_extractNumbers2(name);

    	let sum = fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera1'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera2'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera5'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera8'))
    				+ fn_convertToNumberOrZero(SBUxMethod.get('srch-inp-opera9'));
    	SBUxMethod.set('srch-inp-opera10',sum.toFixed(2));
    }

	// 숫자(소숫점 가능)만 입력
	function fn_extractNumbers2(input) {
		console.log("===========================fn_extractNumbers=============");
		console.log(input);
		let inputValue = SBUxMethod.get(input);
		console.log(inputValue);
		console.log(inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		if(inputValue != null || inputValue != ""){
			console.log(true);
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
			//SBUxMethod.set('srch-inp-opera1','1111111111');
		}
	}
    // 숫자만 입력
	function fn_extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/\D/g, ""));
		}
	}

	//값이 없는 경우 0 있는 경우 숫자로 반환
	function fn_convertToNumberOrZero(value) {
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

	function fn_fcltNtslCdSum(objGrid, nRow, nCol){
		let valArr = [
			Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd2')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd3')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd4')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd5')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd6')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd7')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd8')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd9')))
			,Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltNtslCd10')))
		];
		let sum = 0;
	    for (var i = 0; i < valArr.length; i++) {
	    	console.log(valArr[i]);
			sum += valArr[i];
		}
	    return sum.toString();
	}

</script>

</html>