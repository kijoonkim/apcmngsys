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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 저온저장고운영</h3>
			</div>
			<div style="margin-left: auto;">
				<!--
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
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
			<div><label>저온저장고운영 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 20%">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 16%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg"></th>
						<th class="th_bg">보유현황</th>
						<th class="th_bg">저장능력(톤)<br>
							최대저장<br>
						</th>
						<th class="th_bg">단기저장실적(톤)<br>
							단순출하대기<br>
						</th>
						<th class="th_bg">
							장기저장실적(톤)<br>
							1개월이상<br>
						</th>
						<th class="th_bg">
							저장가동률(%)<br>
							단기+장기실적능력<br>
						</th>
					</tr>
					<tr>
						<td style="text-align: center;"><p>저온저장고</p></td>
						<td class="td_input">
							<sbux-select id="dtl-input-fcltHldYn" name="dtl-input-fcltHldYn"
								uitype="single"
								filtering="true"
								jsondata-ref="selectYnData"
								unselected-text="선택" class="form-control input-sm"></sbux-select>
						</td>
						<td class="td_input"><sbux-input id="dtl-input-storCap" name="dtl-input-storCap" uitype="text" class="form-control input-sm" placeholder="1,000" ></sbux-input></td>
						<td class="td_input"><sbux-input id="dtl-input-stStorPerfm" name="dtl-input-stStorPerfm" uitype="text" class="form-control input-sm" placeholder="100" ></sbux-input></td>
						<td class="td_input"><sbux-input id="dtl-input-ltStorPerfm" name="dtl-input-ltStorPerfm" uitype="text" class="form-control input-sm" placeholder="2,000" ></sbux-input></td>
						<td class="td_input"><sbux-input id="dtl-input-storOpRate" name="dtl-input-storOpRate" uitype="text" class="form-control input-sm" placeholder="210" ></sbux-input></td>

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
						<td colspan="4">
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
    var grdLtMcIfList; // 그리드를 담기위한 객체 선언
    var jsonLtMcIfList = []; // 그리드의 참조 데이터 주소 선언

	var selectYnData = [
		{'text': 'Y','label': 'Y', 'value': '1'},
		{'text': 'N','label': 'N', 'value': '0'}
	]
	var comboYnData = [
		{'label': 'Y', 'value': '1'},
		{'label': 'N', 'value': '0'}
	]

    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdLtMcIfList';
	    SBGridProperties.jsonref = 'jsonLtMcIfList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
			/*
            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            */
            {caption: ["APC명"],		ref: 'apcNm',           type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["보유현황"],	    	ref: 'fcltHldYn',      type:'combo',  width:'23%',    			style:'text-align:center'
            	,typeinfo : {ref:'comboYnData', label:'label', value:'value' ,displayui : true}, disabled: true},
            {caption: ["저장능력(톤)"],  			ref: 'storCap',    type:'output',  width:'23%',    			style:'text-align:center'},
            {caption: ["단기저장실적(톤)"],   		ref: 'stStorPerfm',    type:'output',  width:'23%',    			style:'text-align:center'},
            {caption: ["장기저장실적(톤)"],			ref: 'ltStorPerfm',    type:'output',  width:'23%',   		style:'text-align:center'},
            {caption: ["저장가동률(%)"],			ref: 'storOpRate',    type:'output',  width:'23%',   		style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',           type:'output',  hidden: true},
            {caption: ["대상년도"],		ref: 'trgtYr',          type:'output',  hidden: true},
            {caption: ["등록프로그램"], ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"], ref: 'updProgram',  type:'output',  hidden: true}

        ];

        grdLtMcIfList = _SBGrid.create(SBGridProperties);
        grdLtMcIfList.bind('click', 'fn_view');
        grdLtMcIfList.bind('beforepagechanged', 'fn_pagingLtMcIfList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdLtMcIfList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdLtMcIfList.getPageSize());
    	fn_setGrdLtMcIfList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingLtMcIfList = async function() {
    	console.log("******************fn_pagingLtMcIfList**********************************");
    	let recordCountPerPage = grdLtMcIfList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdLtMcIfList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdLtMcIfList(recordCountPerPage, currentPageNo);
    }


    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdLtMcIfList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdLtMcIfList**********************************");
    	// form clear
    	fn_clearForm();

		grdLtMcIfList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltLwtpStrgMchnInfoList.do", {
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

        	jsonLtMcIfList.length = 0;
        	//"Index 0 out of bounds for length 0"
        	//data.resultCode = E0000
        	//data.resultStatus E , S
        	if(data.resultCode != "E0000"){
        		data.resultList.forEach((item, index) => {
    				const msg = {
    					trgtYr: item.trgtYr,	 		                   //대상연도
    					apcCd: item.apcCd, 	 			                   //apc코드
    					apcNm: item.apcNm, 	 			                   //apc명
    					fcltHldYn : item.fcltHldYn,                        //보유현황
    					storCap : item.storCap,                        	   //저장능력
    					stStorPerfm : item.stStorPerfm,                    //단기저장실적
    					ltStorPerfm : item.ltStorPerfm,     			   //장기저장실적
    					storOpRate : item.storOpRate,     			       //저장가동률
    				}

    				jsonLtMcIfList.push(msg);

    				if (index === 0) {
    					totalRecordCount = item.totalRecordCount;
    				}
    			});
        	}


        	if (jsonLtMcIfList.length > 0) {

        		if(grdLtMcIfList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdLtMcIfList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdLtMcIfList.rebuild();
				}else{
					grdLtMcIfList.refresh()
				}
        	} else {
        		grdLtMcIfList.setPageTotalCount(totalRecordCount);
        		grdLtMcIfList.rebuild();
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
    	SBUxMethod.set("dtl-input-fcltHldYn", null);                     //  보유현황
    	SBUxMethod.set("dtl-input-storCap", null);                     // 저장능력
    	SBUxMethod.set("dtl-input-stStorPerfm", null);                     //  단기저장실적
    	SBUxMethod.set("dtl-input-ltStorPerfm", null);                     //  장기저장실적
    	SBUxMethod.set("dtl-input-storOpRate", null);                     // 저장가동률

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
		SBUxMethod.set("dtl-input-apcNm", null);                     //  APC명
    	SBUxMethod.set("dtl-input-fcltHldYn", null);                     //  보유현황
    	SBUxMethod.set("dtl-input-storCap", null);                     // 저장능력
    	SBUxMethod.set("dtl-input-stStorPerfm", null);                     //  단기저장실적
    	SBUxMethod.set("dtl-input-ltStorPerfm", null);                     //  장기저장실적
    	SBUxMethod.set("dtl-input-storOpRate", null);                     // 저장가동률

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

    	const postJsonPromise = gfn_postJSON('/fm/fclt/insertFcltLwtpStrgMchnInfo.do', {
    	 	trgtYr: SBUxMethod.get('srch-input-trgtYr') , // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
        	apcCd: SBUxMethod.get('gsb-slt-apcCd'), // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
        	fcltHldYn: SBUxMethod.get('dtl-input-fcltHldYn'),                           	   // 보유현황
        	storCap: SBUxMethod.get('dtl-input-storCap'),                        //저장능력
        	stStorPerfm:  SBUxMethod.get('dtl-input-stStorPerfm'),           	   //단기저장실적
        	ltStorPerfm: SBUxMethod.get('dtl-input-ltStorPerfm'),                //장기저장실적
        	storOpRate: SBUxMethod.get('dtl-input-storOpRate')                //저장가동률
		});


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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltLwtpStrgMchnInfo.do", {
	    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
		        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
		        ,	fcltHldYn: SBUxMethod.get('dtl-input-fcltHldYn')                          		 //  보유현황
		        ,	storCap: SBUxMethod.get('dtl-input-storCap')                           //  저장능력
		        ,	stStorPerfm: SBUxMethod.get('dtl-input-stStorPerfm')                  	 //  단기저장실적
		        ,	ltStorPerfm: SBUxMethod.get('dtl-input-ltStorPerfm')                   // 장기저장실적
		        ,	storOpRate: SBUxMethod.get('dtl-input-storOpRate')                   //  저장가동률
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
        const rows = grdLtMcIfList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd});
        	}
        });
        */

      //console.log(grdLtMcIfList.getSelectedRows());
		const rows = grdLtMcIfList.getSelectedRows();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltLwtpStrgMchnInfo.do", {
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
    	var nCol = grdLtMcIfList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdLtMcIfList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdLtMcIfList.getRowData(nRow);
        rowData = fn_emptyString(rowData);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                     //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                       //apc코드
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                       //apc명
    	SBUxMethod.set("dtl-input-fcltHldYn", rowData.fcltHldYn);               //순번
    	SBUxMethod.set("dtl-input-storCap", rowData.storCap);                  	//설비 코드
    	SBUxMethod.set("dtl-input-stStorPerfm", rowData.stStorPerfm);           //설비 보유 유무
        SBUxMethod.set("dtl-input-ltStorPerfm", rowData.ltStorPerfm);           //설비 처리 코드
        SBUxMethod.set("dtl-input-storOpRate", rowData.storOpRate);             //설비 처리 시간
    }





    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdLtMcIfList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdLtMcIfList.setCellData(i+1, 1, checkedYn, true, false);
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