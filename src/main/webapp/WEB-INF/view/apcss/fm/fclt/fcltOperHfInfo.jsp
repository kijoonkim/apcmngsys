
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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 시설고용인력</h3>
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
			<div><label>시설고용 상세내역</label></div>
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
						<th></th>
						<th class="th_bg">내국인(명)</th>
						<th class="th_bg">외국인(명)</th>
					</tr>
					<tr>
						<th class="td_input">
							정규직
						</th>
						<td class="td_input">
							<sbux-input id="dtl-input-hireNope" name="dtl-input-hireNope" uitype="text" class="form-control input-sm" placeholder="10" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-hireNope3" name="dtl-input-hireNope3" uitype="text" class="form-control input-sm" placeholder="1" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="td_input">
							일용직
						</th>
						<td class="td_input">
							<sbux-input id="dtl-input-hireNope2" name="dtl-input-hireNope2" uitype="text" class="form-control input-sm" placeholder="5" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-hireNope4" name="dtl-input-hireNope4" uitype="text" class="form-control input-sm" placeholder="10" ></sbux-input>
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
						<td style="border-left: hidden;"></td>
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
    var grdHireInfoList; // 그리드를 담기위한 객체 선언
    var jsonHireInfoList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdHireInfoList';
	    SBGridProperties.jsonref = 'jsonHireInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';


	       SBGridProperties.columns = [

		            {caption: ["APC명"],			ref: 'apcNm',       type:'output',  	width:'10%',    style:'text-align:center'},
		            {caption: ["내국인정규직"], 	ref: 'hireNope',   type:'output',  	width:'20%',    style:'text-align:center'},
		            {caption: ["내국인일용직"], 	ref: 'hireNope2',   type:'output',  	width:'20%',    style:'text-align:center'},
		            {caption: ["외국인정규직"],	  	ref: 'hireNope3',    type:'output',  	width:'20%',    style:'text-align:center'},
		            {caption: ["외국인일용직"],	  	ref: 'hireNope4',    type:'output',  	width:'20%',    style:'text-align:center'},
		            {caption: ["APCCD"],		ref: 'apcCd',       type:'output',  	hidden: true},
		            {caption: ["대상연도"],			ref: 'trgtYr',          type:'output',  hidden: true}
	            ];

        grdHireInfoList = _SBGrid.create(SBGridProperties);
        grdHireInfoList.bind('click', 'fn_view');
        grdHireInfoList.bind('beforepagechanged', 'fn_pagingHireInfoList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdHireInfoList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdHireInfoList.getPageSize());
    	fn_setGrdHireInfoList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingHireInfoList = async function() {
    	console.log("******************fn_pagingHireInfoList**********************************");
    	let recordCountPerPage = grdHireInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdHireInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdHireInfoList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_setGrdHireInfoList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdHireInfoList**********************************");
    	// form clear
    	fn_clearForm();

		grdHireInfoList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

        //비동기 포스트타입 url 데이터연결 페이징처리 글로벌
        //gfn_postJSON 는 ajax고 post통신의 데이터를 json 타입으로 보내는것이다
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperHfInfoList.do", {
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

        	jsonHireInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
					trgtYr: item.trgtYr,	 	//대상연도
					apcCd: item.apcCd, 	 		//apc코드
					apcNm: item.apcNm, 	 		//apc명
					hireNope: item.hireNope,        //고용인력(내국인정규직)
					hireNope2: item.hireNope2,        //고용인력(내국인일용직)
					hireNope3: item.hireNope3,        //고용인력(외국인정규직)
					hireNope4: item.hireNope4,        //고용인력(외국인일용직)

				}

				jsonHireInfoList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonHireInfoList.length > 0) {

        		if(grdHireInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdHireInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdHireInfoList.rebuild();
				}else{
					grdHireInfoList.refresh()
				}
        	} else {
        		grdHireInfoList.setPageTotalCount(totalRecordCount);
        		grdHireInfoList.rebuild();
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
    	SBUxMethod.set("dtl-input-hireNope", null);                   //  내국인정규고용
    	SBUxMethod.set("dtl-input-hireNope2", null);                   //  내국인일용고용
    	SBUxMethod.set("dtl-input-hireNope3", null);                   //  외국인정규고용
    	SBUxMethod.set("dtl-input-hireNope4", null);                   //  외국인일용고용


    }
     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명
    	SBUxMethod.set("dtl-input-hireNope", null);                   //  내국인정규고용
    	SBUxMethod.set("dtl-input-hireNope2", null);                   //  내국인일용고용
    	SBUxMethod.set("dtl-input-hireNope3", null);                   //  외국인정규고용
    	SBUxMethod.set("dtl-input-hireNope4", null);                   //  외국인일용고용
    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("dtl-input-apcCd");
		let trgtYr = SBUxMethod.get("dtl-input-trgtYr");

		/*
     	if (!SBUxMethod.get("dtl-input-bizSprtCd")) {
            alert("사업지원코드를 작성해주세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-bizCn")) {
            alert("사업내용을 선택하세요.");
            return;
        } */


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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperHfInfo.do", {
    	 	trgtYr: SBUxMethod.get("srch-input-trgtYr") , // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
        	apcCd: SBUxMethod.get("gsb-slt-apcCd"), // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
        	hireNope: SBUxMethod.get('dtl-input-hireNope'),                          // 고용인수
        	hireNope2: SBUxMethod.get('dtl-input-hireNope2'),                        		 // 고용인수
        	hireNope3: SBUxMethod.get('dtl-input-hireNope3'),                     		 // 고용인수
        	hireNope4: SBUxMethod.get('dtl-input-hireNope4')                     		 // 고용인수
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltOperHfInfo.do", {
    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
        ,	hireNope: SBUxMethod.get('dtl-input-hireNope')                             //  사업내용
        ,	hireNope2: SBUxMethod.get('dtl-input-hireNope2')                       // 사업비코드
        ,	hireNope3: SBUxMethod.get('dtl-input-hireNope3')                     		 //   사업비(국고)
        ,	hireNope4: SBUxMethod.get('dtl-input-hireNope4')                 		 //  사업비2(지자체)
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
        const rows = grdHireInfoList.getGridDataAll();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltOperHfInfoList.do", list);

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
    	var nCol = grdHireInfoList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdHireInfoList.getRow();
		if (nRow < 1) {
            return;
		}

		if(nRow == null){
			nRow = 1;
		}

			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdHireInfoList.getRowData(nRow);
        rowData = fn_emptyString(rowData);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                           //  대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                             //  APC코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                             //  APC명
    	SBUxMethod.set("dtl-input-hireNope", rowData.hireNope);                             //  고용인원수
    	SBUxMethod.set("dtl-input-hireNope2", rowData.hireNope2);                             //  고용인원수
    	SBUxMethod.set("dtl-input-hireNope3", rowData.hireNope3);                             //  고용인원수
    	SBUxMethod.set("dtl-input-hireNope4", rowData.hireNope4);                             //  고용인원수
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdHireInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdHireInfoList.setCellData(i+1, 1, checkedYn, true, false);
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