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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 유통조직처리실적</h3>
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
		<br>
		<br>
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

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:150px;"></div>
				</div>
				<br>
			<div><label>유통조직처리실적 상세 내역</label></div>
			<div><label style="font-size: x-small;">- APC 운영자인 산지유통조직의 원예농산물 총취급액을 기재(APC에서 처리한 원예농산물 취급액 + APC에서 처리하지 않은 원예농산물 취급액)</label></div>


			<div>
				<table class="table table-bordered table-hover tbl_col tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 12%">
						<col style="width: 12%">
						<col style="width: 12%">
						<col style="width: 12%">
						<col style="width: 12%">
						<col style="width: 12%">
					</colgroup>
						<thead>
							<tr>
								<th rowspan="2">구분</th>
								<th rowspan="2">총취급액</th>
								<th colspan="3">일반취급</th>
								<th colspan="3">조직화취급</th>
							</tr>
							<tr>
								<th>계</th>
								<th>단순수탁</th>
								<th>단순매취</th>
								<th>계</th>
								<th>공선수탁</th>
								<th>계약매취</th>
							</tr>
							<tr>
								<td>금액(백만원)</td>
								<td><sbux-input id="srch-inp-opera1" name="srch-inp-opera1" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly ></sbux-input></td>
								<td><sbux-input id="srch-inp-opera2" name="srch-inp-opera2" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input></td>
								<td><sbux-input id="srch-inp-opera3" name="srch-inp-opera3" uitype="text" class="form-control input-sm" placeholder="(백만원)" onkeyup="sum('srch-inp-opera3',1)"></sbux-input></td>
								<td><sbux-input id="srch-inp-opera4" name="srch-inp-opera4" uitype="text" class="form-control input-sm" placeholder="(백만원)" onkeyup="sum('srch-inp-opera4',1)"></sbux-input></td>
								<td><sbux-input id="srch-inp-opera5" name="srch-inp-opera5" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input></td>
								<td><sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="(백만원)" onkeyup="sum('srch-inp-opera6',2)"></sbux-input></td>
								<td><sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="(백만원)" onkeyup="sum('srch-inp-opera7',2)"></sbux-input></td>
							</tr>
							<tr>
								<th class="th_bg">대상연도</th>
								<td class="td_input" colspan="1">
									<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td colspan="6" style="border-left: hidden;"></td>
							</tr>
							<tr>
								<th class="th_bg">apc명</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
									<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td colspan="6"  style="border-left: hidden;"></td>
							</tr>
						</thead>
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
    var grdOgPcList; // 그리드를 담기위한 객체 선언
    var jsonOgPcList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdOgPcList';
	    SBGridProperties.jsonref = 'jsonOgPcList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APC명"],			ref: 'apcNm',       		type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["총취급액","총취급액"],  	ref: 'fcltOgnzTrmtAmtTot',  			type:'output',  width:'14%',    style:'text-align:center',calc : 'fn_Calctot'},
            {caption: ["일반취급","계"],  		ref: 'fcltOgnzTrmtAmtSum1',  			type:'output',  width:'14%',    style:'text-align:center',calc : 'fn_CalcSum1'},
            {caption: ["일반취급","단순수탁"],  	ref: 'fcltOgnzTrmtAmt',  			type:'output',  width:'14%',    style:'text-align:center' },
            {caption: ["일반취급","단순매취"],  	ref: 'fcltOgnzTrmt2Amt',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["조직화취급","계"],  		ref: 'fcltOgnzTrmtAmtSum2',  			type:'output',  width:'14%',    style:'text-align:center' ,calc : 'fn_CalcSum2'},
            {caption: ["조직화취급","단순수탁"],  	ref: 'fcltOgnzTrmt3Amt',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["조직화취급","단순매취"],  	ref: 'fcltOgnzTrmt4Amt',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',       		type:'output',  hidden: true},
            {caption: ["대상연도"],		ref: 'trgtYr',          	type:'output',  hidden: true},
            {caption: ["등록프로그램"], 		ref: 'creProgram',  		type:'output',  hidden: true},
            {caption: ["변경프로그램"], 		ref: 'updProgram',  		type:'output',  hidden: true}

        ];
        grdOgPcList = _SBGrid.create(SBGridProperties);
        grdOgPcList.bind('click', 'fn_view');
        grdOgPcList.bind('beforepagechanged', 'fn_pagingOgPcList');
    }



    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdOgPcList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdOgPcList.getPageSize());
    	fn_pagingOgPcList(pageSize, pageNo);
    }


    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_pagingOgPcList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingOgPcList**********************************");
    	// form clear
    	fn_clearForm();

		grdOgPcList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOgnzPrcsPrfmncList.do", {
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

        	jsonOgPcList.length = 0;
        	//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
        		data.resultList.forEach((item, index) => {
    				const msg = {
    					trgtYr: item.trgtYr,						 	    //대상연도
    					apcCd: item.apcCd, 	 		 						//apc코드
    					apcNm: item.apcNm, 	 		 						//apc명
    					fcltOgnzTrmtAmt: item.fcltOgnzTrmtAmt,
    					fcltOgnzTrmt2Amt: item.fcltOgnzTrmt2Amt,
    					fcltOgnzTrmt3Amt: item.fcltOgnzTrmt3Amt,
    					fcltOgnzTrmt4Amt: item.fcltOgnzTrmt4Amt
    				}

    				jsonOgPcList.push(msg);

    				if (index === 0) {
    					totalRecordCount = item.totalRecordCount;
    				}
    			});
        	}


        	if (jsonOgPcList.length > 0) {

        		if(grdOgPcList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdOgPcList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdOgPcList.rebuild();
				}else{
					grdOgPcList.refresh()
				}
        	} else {
        		grdOgPcList.setPageTotalCount(totalRecordCount);
        		grdOgPcList.rebuild();
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOgnzPrcsPrfmnc.do", {
    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
	        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')   	                     //  apcCode
	        ,	fcltOgnzTrmtAmt: SBUxMethod.get('srch-inp-opera3')
	        ,	fcltOgnzTrmt2Amt: SBUxMethod.get('srch-inp-opera4')
	        ,	fcltOgnzTrmt3Amt: SBUxMethod.get('srch-inp-opera6')
	        ,	fcltOgnzTrmt4Amt: SBUxMethod.get('srch-inp-opera7')
		});

    	/*
        fcltOgnzClsfCd     // 시설 조직 분류 코드
        fcltOgnzTrmtCd     //  시설 조직 취급 코드
        fcltOgnzTrmtAmt    //  시설 조직 취급금액
     */




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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltOgnzPrcsPrfmnc.do", {
		        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
		        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')   	                     //  apcCode
		        ,	fcltOgnzTrmtAmt: SBUxMethod.get('srch-inp-opera3')
		        ,	fcltOgnzTrmt2Amt: SBUxMethod.get('srch-inp-opera4')
		        ,	fcltOgnzTrmt3Amt: SBUxMethod.get('srch-inp-opera6')
		        ,	fcltOgnzTrmt4Amt: SBUxMethod.get('srch-inp-opera7')

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
        const rows = grdOgPcList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
		*/

      //console.log(grdOgPcList.getSelectedRows());
		const rows = grdOgPcList.getSelectedRows();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltOgnzPrcsPrfmnc.do", {
        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
	        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')   	                     //  apcCode
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
    	var nCol = grdOgPcList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdOgPcList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdOgPcList.getRowData(nRow);


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);         //apc명

		SBUxMethod.set("srch-inp-opera1", null);
    	SBUxMethod.set("srch-inp-opera2", null);
    	SBUxMethod.set("srch-inp-opera3", null);
    	SBUxMethod.set("srch-inp-opera4", null);
    	SBUxMethod.set("srch-inp-opera5", null);
    	SBUxMethod.set("srch-inp-opera6", null);
    	SBUxMethod.set("srch-inp-opera7", null);

    	SBUxMethod.set("srch-inp-opera3", rowData.fcltOgnzTrmtAmt);
    	SBUxMethod.set("srch-inp-opera4", rowData.fcltOgnzTrmt2Amt);
    	SBUxMethod.set("srch-inp-opera6", rowData.fcltOgnzTrmt3Amt);
    	SBUxMethod.set("srch-inp-opera7", rowData.fcltOgnzTrmt4Amt);

    	sum('srch-inp-opera3',1);
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdOgPcList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdOgPcList.setCellData(i+1, 1, checkedYn, true, false);
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


	//국고 지자체 자부담 합계
    function sum(name, idx){
    	extractNumbers2(name);

    	if(idx == 1 ){
    		let sum1 = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'))
    		let sum2 = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'))
    		console.log("sum1 = "+sum1+" sum2 = "+sum2);
    		SBUxMethod.set('srch-inp-opera1',sum1+sum2);
    		SBUxMethod.set('srch-inp-opera2',sum1);
    	}else if (idx == 2){
    		let sum1 = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera3'))+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera4'))
    		let sum2 = convertToNumberOrZero(SBUxMethod.get('srch-inp-opera6'))+ convertToNumberOrZero(SBUxMethod.get('srch-inp-opera7'))
    		console.log("sum1 = "+sum1+" sum2 = "+sum2);
    		SBUxMethod.set('srch-inp-opera1',sum1+sum2);
    		SBUxMethod.set('srch-inp-opera5',sum2);
    	}
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

	function fn_CalcSum1(objGrid, nRow, nCol) {
	    let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmtAmt')));
	    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt2Amt')));
	    let sum1 = value1 + value2;
	    return sum1.toString();
	}
	function fn_CalcSum2(objGrid, nRow, nCol) {
	    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt3Amt')));
	    let value4 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt4Amt')));
	    let sum2 = value3 + value4;
	    return sum2.toString();
	}
	function fn_Calctot(objGrid, nRow, nCol) {
	    let value1 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmtAmt')));
	    let value2 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt2Amt')));
	    let value3 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt3Amt')));
	    let value4 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('fcltOgnzTrmt4Amt')));
	    let sum1 = value1 + value2;
	    let sum2 = value3 + value4;
	    let tot = sum1 + sum2;
	    return tot.toString();
	}

</script>
</html>