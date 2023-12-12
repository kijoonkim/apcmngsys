<%
 /**
  * @Class Name : fcltUnityMngInfo.jsp
  * @Description : 통합관리시스템활용 화면
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
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 통합관리시스템활용 -->
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
			<div><label>통합관리시스템활용 상세내역</label></div>
			<div><label style="font-size: x-small;">- 활용하신다면 어떤 작업단계까지 활용하고 계십니까? 해당하는 곳에 체크해 주십시오</label></div>


			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 14%">
						<col style="width: 15%">
						<col style="width: 15%">
					</colgroup>
						<tbody>
							<tr>
								<th>생산정보</th>
								<th>입고정보</th>
								<th>선별정보</th>
								<th>저장정보</th>
								<th>포장정보</th>
								<th>출고정보</th>
								<th>정산정보</th>
							</tr>
							<tr>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera1" name="srch-inp-opera1" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera2" name="srch-inp-opera2" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera3" name="srch-inp-opera3" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera4" name="srch-inp-opera4" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera5" name="srch-inp-opera5" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera6" name="srch-inp-opera6" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="srch-inp-opera7" name="srch-inp-opera7" uitype="normal"  true-value = "1" false-value = "0" ></sbux-checkbox>
										<label class="check_label" for="check_default" ></label>
									</p>
								</td>
							</tr>
							<tr>
								<th class="th_bg">대상연도</th>
								<td class="td_input" colspan="1">
									<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td colspan="5" style="border-left: hidden;"></td>
							</tr>
							<tr>
								<th class="th_bg">apc명</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
									<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
								</td>
								<td colspan="5" style="border-left: hidden;"></td>
							</tr>
						</tbody>
					</table>
					</div>
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
    var grdUniMnIfList; // 그리드를 담기위한 객체 선언
    var jsonUniMnIfList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdUniMnIfList';
	    SBGridProperties.jsonref = 'jsonUniMnIfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

            {caption: ["APC명"],		ref: 'apcNm',       		type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["생산정보"], 	ref: 'fcltSysHldYn',   		type:'output',  	width:'14%',    style:'text-align:center'},
            {caption: ["입고정보"],  	ref: 'fcltSysHldYn2',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["선별정보"],  	ref: 'fcltSysHldYn3',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["저장정보"],  	ref: 'fcltSysHldYn4',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["포장정보"],  	ref: 'fcltSysHldYn5',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["출고정보"],  	ref: 'fcltSysHldYn6',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["정산정보"],  	ref: 'fcltSysHldYn7',  			type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["APCCD"],	ref: 'apcCd',       		type:'output',  hidden: true},
            {caption: ["대상연도"],	ref: 'trgtYr',          	type:'output',  hidden: true}

        ];
        grdUniMnIfList = _SBGrid.create(SBGridProperties);
        grdUniMnIfList.bind('click', 'fn_view');
        grdUniMnIfList.bind('beforepagechanged', 'fn_pagingUniMnIfList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdUniMnIfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdUniMnIfList.getPageSize());
    	fn_pagingUniMnIfList(pageSize, pageNo);
    }


    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_pagingUniMnIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingUniMnIfList**********************************");
    	// form clear
    	fn_clearForm();

		grdUniMnIfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltUnityMngInfoList.do", {
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

        	jsonUniMnIfList.length = 0;
        	//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
        		data.resultList.forEach((item, index) => {
    				const msg = {
    					trgtYr: item.trgtYr,						 	    //대상연도
    					apcCd: item.apcCd, 	 		 						//apc코드
    					apcNm: item.apcNm, 	 		 						//apc명
    					fcltSysHldYn: item.fcltSysHldYn,
    					fcltSysHldYn2: item.fcltSysHldYn2,
    					fcltSysHldYn3: item.fcltSysHldYn3,
    					fcltSysHldYn4: item.fcltSysHldYn4,
    					fcltSysHldYn5: item.fcltSysHldYn5,
    					fcltSysHldYn6: item.fcltSysHldYn6,
    					fcltSysHldYn7: item.fcltSysHldYn7,
    				}

    				jsonUniMnIfList.push(msg);

    				if (index === 0) {
    					totalRecordCount = item.totalRecordCount;
    				}
    			});
        	}


        	if (jsonUniMnIfList.length > 0) {

        		if(grdUniMnIfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdUniMnIfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdUniMnIfList.rebuild();
				}else{
					grdUniMnIfList.refresh()
				}
        	} else {
        		grdUniMnIfList.setPageTotalCount(totalRecordCount);
        		grdUniMnIfList.rebuild();
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
		SBUxMethod.set("srch-inp-opera", null);
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
    		SBUxMethod.set("srch-inp-opera", null);
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltUnityMngInfo.do", {
    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
    		,apcCd: SBUxMethod.get('dtl-input-apcCd')
    		,fcltSysHldYn: $('#srch-inp-opera').val()
    		,fcltSysHldYn2: $('#srch-inp-opera2').val()
    		,fcltSysHldYn3: $('#srch-inp-opera3').val()
    		,fcltSysHldYn4: $('#srch-inp-opera4').val()
    		,fcltSysHldYn5: $('#srch-inp-opera5').val()
    		,fcltSysHldYn6: $('#srch-inp-opera6').val()
    		,fcltSysHldYn7: $('#srch-inp-opera7').val()
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltUnityMngInfo.do", {
        		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
        		,apcCd: SBUxMethod.get('dtl-input-apcCd')
        		,fcltSysHldYn: $('#srch-inp-opera').val()
        		,fcltSysHldYn2: $('#srch-inp-opera2').val()
        		,fcltSysHldYn3: $('#srch-inp-opera3').val()
        		,fcltSysHldYn4: $('#srch-inp-opera4').val()
        		,fcltSysHldYn5: $('#srch-inp-opera5').val()
        		,fcltSysHldYn6: $('#srch-inp-opera6').val()
        		,fcltSysHldYn7: $('#srch-inp-opera7').val()

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
        const rows = grdUniMnIfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
        */

      //console.log(grdUniMnIfList.getSelectedRows());
		const rows = grdUniMnIfList.getSelectedRows();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltUnityMngInfo.do", {
    		trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
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
    	var nCol = grdUniMnIfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdUniMnIfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdUniMnIfList.getRowData(nRow);


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);         //apc명

    	SBUxMethod.set("srch-inp-opera", null);
    	SBUxMethod.set("srch-inp-opera2", null);
    	SBUxMethod.set("srch-inp-opera3", null);
    	SBUxMethod.set("srch-inp-opera4", null);
    	SBUxMethod.set("srch-inp-opera5", null);
    	SBUxMethod.set("srch-inp-opera6", null);
    	SBUxMethod.set("srch-inp-opera7", null);

    	SBUxMethod.set("srch-inp-opera", fn_checkChk(rowData.fcltSysHldYn));
    	SBUxMethod.set("srch-inp-opera2", fn_checkChk(rowData.fcltSysHldYn2));
    	SBUxMethod.set("srch-inp-opera3", fn_checkChk(rowData.fcltSysHldYn3));
    	SBUxMethod.set("srch-inp-opera4", fn_checkChk(rowData.fcltSysHldYn4));
    	SBUxMethod.set("srch-inp-opera5", fn_checkChk(rowData.fcltSysHldYn5));
    	SBUxMethod.set("srch-inp-opera6", fn_checkChk(rowData.fcltSysHldYn6));
    	SBUxMethod.set("srch-inp-opera7", fn_checkChk(rowData.fcltSysHldYn7));
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
        var gridList = grdUniMnIfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdUniMnIfList.setCellData(i+1, 1, checkedYn, true, false);
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