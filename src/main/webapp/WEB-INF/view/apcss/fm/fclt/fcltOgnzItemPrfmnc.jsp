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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 유통조직품목처리실적</h3>
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
			<div><label>유통조직품목처리실적 상세내역 </label></div>
			<div><label style="font-size: x-small;">- 유통조직 총취급액과 합계가 동일하게 작성</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 24%">
						<col style="width: 38%">
						<col style="width: 38%">
					</colgroup>
						<tbody>
							<tr>
								<th>구분</th>
								<th>취급액(백만원)</th>
								<th>취급물량(톤)</th>
							</tr>
							<tr>
								<td>품목1</td>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera1',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera2',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>품목2</td>
								<td>
									<sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera3',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera4',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>품목3</td>
								<td>
									<sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera5',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera6',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>기타</td>
								<td>
									<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum('srch-inp-opera7',1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum('srch-inp-opera8',2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<td>합계</td>
								<td>
									<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="상기수치합계" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="상기수치합계" readonly></sbux-input>
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
    var grdOgItmPrfList; // 그리드를 담기위한 객체 선언
    var jsonOgItmPrfList = []; // 그리드의 참조 데이터 주소 선언

   	/*
    sn      //     순번
    fcltOgnzTrmtAmt      //     시설 조직 취급금액
    fcltOgnzTrmtVlm      //     시설 조직 취급물량
*/

    //그리드 생성 설정
    function fn_createGrid() {
     	console.log("******************fn_createGrid**********************************");
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdOgItmPrfList';
	    SBGridProperties.jsonref = 'jsonOgItmPrfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APC명"],			ref: 'apcNm',            		type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["품목1","취급액(백만원)"],	ref: 'fcltOgnzTrmtAmt',    		type:'output',  width:'25%',    style:'text-align:center'},
            {caption: ["품목1","취급물량(톤)"],		ref: 'fcltOgnzTrmtVlm',       type:'output',  width:'25%',    style:'text-align:center'},

            {caption: ["품목2","취급액(백만원)"],	ref: 'fcltOgnzTrmtAmt2',    		type:'output',  width:'25%',    style:'text-align:center'},
            {caption: ["품목2","취급물량(톤)"],		ref: 'fcltOgnzTrmtVlm2',       type:'output',  width:'25%',    style:'text-align:center'},

            {caption: ["품목3","취급액(백만원)"],	ref: 'fcltOgnzTrmtAmt3',    		type:'output',  width:'25%',    style:'text-align:center'},
            {caption: ["품목3","취급물량(톤)"],		ref: 'fcltOgnzTrmtVlm3',       type:'output',  width:'25%',    style:'text-align:center'},

            {caption: ["기타품목","취급액(백만원)"],	ref: 'fcltOgnzTrmtAmt4',    		type:'output',  width:'25%',    style:'text-align:center'},
            {caption: ["기타품목","취급물량(톤)"],		ref: 'fcltOgnzTrmtVlm4',       type:'output',  width:'25%',    style:'text-align:center'},

            {caption: ["APCCD"],		ref: 'apcCd',            		type:'output',  hidden: true},
            {caption: ["대상연도"],		ref: 'trgtYr',      		    type:'output',  hidden: true}

        ];
        grdOgItmPrfList = _SBGrid.create(SBGridProperties);
        grdOgItmPrfList.bind('click', 'fn_view');
        grdOgItmPrfList.bind('beforepagechanged', 'fn_pagingOgItmPrfList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdOgItmPrfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	fn_setGrdOgItmPrfList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingOgItmPrfList = async function() {
    	console.log("******************fn_pagingOgItmPrfList**********************************");
    	let recordCountPerPage = grdOgItmPrfList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdOgItmPrfList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdOgItmPrfList(recordCountPerPage, currentPageNo);
    }


    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdOgItmPrfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdOgItmPrfList**********************************");
    	// form clear
    	fn_clearForm();

		grdOgItmPrfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOgnzItemPrfmncList.do", {
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

        	jsonOgItmPrfList.length = 0;
        	//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
        		data.resultList.forEach((item, index) => {
    				const msg = {
    					  trgtYr: item.trgtYr	 	//대상연도
    				   	, apcCd: item.apcCd  //APC
    				   	, apcNm: item.apcNm  //APC

    					, fcltOgnzTrmtAmt: item.fcltOgnzTrmtAmt
    					, fcltOgnzTrmtAmt2: item.fcltOgnzTrmtAmt2
    					, fcltOgnzTrmtAmt3: item.fcltOgnzTrmtAmt3
    					, fcltOgnzTrmtAmt4: item.fcltOgnzTrmtAmt4

    					, fcltOgnzTrmtVlm: item.fcltOgnzTrmtVlm
    					, fcltOgnzTrmtVlm2: item.fcltOgnzTrmtVlm2
    					, fcltOgnzTrmtVlm3: item.fcltOgnzTrmtVlm3
    					, fcltOgnzTrmtVlm4: item.fcltOgnzTrmtVlm4
    				}

    				jsonOgItmPrfList.push(msg);

    				if (index === 0) {
    					totalRecordCount = item.totalRecordCount;
    				}
    			});
        	}


        	if (jsonOgItmPrfList.length > 0) {

        		if(grdOgItmPrfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdOgItmPrfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdOgItmPrfList.rebuild();
				}else{
					grdOgItmPrfList.refresh()
				}
        	} else {
        		grdOgItmPrfList.setPageTotalCount(totalRecordCount);
        		grdOgItmPrfList.rebuild();
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
   	    SBUxMethod.set("dtl-input-trgtYr", null);  //대상연도
   	    SBUxMethod.set("dtl-input-apcCd", null);  //APC
   	 	SBUxMethod.set("dtl-input-apcNm", null);  //APC

    	SBUxMethod.set("srch-inp-opera1", null);
    	SBUxMethod.set("srch-inp-opera2", null);
    	SBUxMethod.set("srch-inp-opera3", null);
    	SBUxMethod.set("srch-inp-opera4", null);
    	SBUxMethod.set("srch-inp-opera5", null);
    	SBUxMethod.set("srch-inp-opera6", null);
    	SBUxMethod.set("srch-inp-opera7", null);
    	SBUxMethod.set("srch-inp-opera8", null);

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
    	    SBUxMethod.set("dtl-input-trgtYr", null);  //대상연도
       	    SBUxMethod.set("dtl-input-apcCd", null);  //APC
       	 	SBUxMethod.set("dtl-input-apcNm", null);  //APC

        	SBUxMethod.set("srch-inp-opera1", null);
        	SBUxMethod.set("srch-inp-opera2", null);
        	SBUxMethod.set("srch-inp-opera3", null);
        	SBUxMethod.set("srch-inp-opera4", null);
        	SBUxMethod.set("srch-inp-opera5", null);
        	SBUxMethod.set("srch-inp-opera6", null);
        	SBUxMethod.set("srch-inp-opera7", null);
        	SBUxMethod.set("srch-inp-opera8", null);
     }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("dtl-input-trgtYr");
		let trgtYr = SBUxMethod.get("dtl-input-apcCd");

    	if (!SBUxMethod.get("dtl-input-trgtYr")) {
            alert("조회 항목의 APC 코드를 선택하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-apcCd")) {
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOgnzItemPrfmnc.do", {
   			trgtYr: SBUxMethod.get('dtl-input-trgtYr')                 			//대상연도
	        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')               			    //apc코드

	        ,	fcltOgnzTrmtAmt: SBUxMethod.get('srch-inp-opera1')
	        ,	fcltOgnzTrmtAmt2: SBUxMethod.get('srch-inp-opera3')
	        ,	fcltOgnzTrmtAmt3: SBUxMethod.get('srch-inp-opera5')
	        ,	fcltOgnzTrmtAmt4: SBUxMethod.get('srch-inp-opera7')

	        ,	fcltOgnzTrmtVlm: SBUxMethod.get('srch-inp-opera2')
	        ,	fcltOgnzTrmtVlm2: SBUxMethod.get('srch-inp-opera4')
	        ,	fcltOgnzTrmtVlm3: SBUxMethod.get('srch-inp-opera6')
	        ,	fcltOgnzTrmtVlm4: SBUxMethod.get('srch-inp-opera8')

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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltOgnzItemPrfmnc.do", {
		   			trgtYr: SBUxMethod.get('dtl-input-trgtYr')                 			//대상연도
		        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')               			    //apc코드

		        ,	fcltOgnzTrmtAmt: SBUxMethod.get('srch-inp-opera1')
		        ,	fcltOgnzTrmtAmt2: SBUxMethod.get('srch-inp-opera3')
		        ,	fcltOgnzTrmtAmt3: SBUxMethod.get('srch-inp-opera5')
		        ,	fcltOgnzTrmtAmt4: SBUxMethod.get('srch-inp-opera7')

		        ,	fcltOgnzTrmtVlm: SBUxMethod.get('srch-inp-opera2')
		        ,	fcltOgnzTrmtVlm2: SBUxMethod.get('srch-inp-opera4')
		        ,	fcltOgnzTrmtVlm3: SBUxMethod.get('srch-inp-opera6')
		        ,	fcltOgnzTrmtVlm4: SBUxMethod.get('srch-inp-opera8')
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
        const rows = grdOgItmPrfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
        */

      //console.log(grdOgItmPrfList.getSelectedRows());
		const rows = grdOgItmPrfList.getSelectedRows();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltOgnzItemPrfmnc.do", {
   			trgtYr: SBUxMethod.get('dtl-input-trgtYr')                 			//대상연도
	        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')               			    //apc코드
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
    	var nCol = grdOgItmPrfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdOgItmPrfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdOgItmPrfList.getRowData(nRow);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                 //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                   //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                   //apc코드

    	SBUxMethod.set("srch-inp-opera1", rowData.fcltOgnzTrmtAmt);
    	SBUxMethod.set("srch-inp-opera3", rowData.fcltOgnzTrmtAmt2);
    	SBUxMethod.set("srch-inp-opera5", rowData.fcltOgnzTrmtAmt3);
    	SBUxMethod.set("srch-inp-opera7", rowData.fcltOgnzTrmtAmt4);

    	SBUxMethod.set("srch-inp-opera2", rowData.fcltOgnzTrmtVlm);
    	SBUxMethod.set("srch-inp-opera4", rowData.fcltOgnzTrmtVlm2);
    	SBUxMethod.set("srch-inp-opera6", rowData.fcltOgnzTrmtVlm3);
    	SBUxMethod.set("srch-inp-opera8", rowData.fcltOgnzTrmtVlm4);

    	sum('srch-inp-opera1',1);
    	sum('srch-inp-opera2',2);
    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdOgItmPrfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdOgItmPrfList.setCellData(i+1, 1, checkedYn, true, false);
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

	function fn_CalcSum1(objGrid, nRow, nCol) {
	    let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmtAmt')));
	    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt2Amt')));
	    let sum1 = value1 + value2;
	    return sum1.toString();
	}

	//국고 지자체 자부담 합계
    function sum(name, idx){
    	extractNumbers2(name);

    	if(idx == 1 ){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera1'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera5'))
    					+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'));
    		SBUxMethod.set('srch-inp-opera9',sum);
    	}else if (idx == 2){
    		let sum = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera2'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))
						+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera8'));
			SBUxMethod.set('srch-inp-opera10',sum);
    	}
    }

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
    // 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
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
</script>
</html>