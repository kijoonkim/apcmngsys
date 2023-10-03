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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 상품화설비현황</h3>
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
				<div><label>상품화설비현황 상세내역</label></div>
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
						<th class="th_bg">선별기</th>
						<th class="th_bg">보유현황</th>
						<th class="th_bg">규격</th>
						<th class="th_bg">당도기</th>
						<th class="th_bg">색택선별(O/X)</th>
						<th class="th_bg">형상선별</th>
						<th class="th_bg">가공설비</th>
					</tr>
					<tr>
						<th class="th_bg">품목1</th>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn11" name="dtl-input-sortMchnHldYn11" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnSpcfct1" name="dtl-input-sortMchnSpcfct1" uitype="text" class="form-control input-sm" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn12" name="dtl-input-sortMchnHldYn12" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn13" name="dtl-input-sortMchnHldYn13" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn14" name="dtl-input-sortMchnHldYn14" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn15" name="dtl-input-sortMchnHldYn15" uitype="text" class="form-control input-sm" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">품목2</th>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn21" name="dtl-input-sortMchnHldYn21" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnSpcfct2" name="dtl-input-sortMchnSpcfct2" uitype="text" class="form-control input-sm" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn22" name="dtl-input-sortMchnHldYn22" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn23" name="dtl-input-sortMchnHldYn23" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn24" name="dtl-input-sortMchnHldYn24" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn25" name="dtl-input-sortMchnHldYn25" uitype="text" class="form-control input-sm" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">품목3</th>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn31" name="dtl-input-sortMchnHldYn31" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnSpcfct3" name="dtl-input-sortMchnSpcfct3" uitype="text" class="form-control input-sm" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn32" name="dtl-input-sortMchnHldYn32" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn33" name="dtl-input-sortMchnHldYn33" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn34" name="dtl-input-sortMchnHldYn34" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn35" name="dtl-input-sortMchnHldYn35" uitype="text" class="form-control input-sm" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">기타</th>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn41" name="dtl-input-sortMchnHldYn41" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnSpcfct4" name="dtl-input-sortMchnSpcfct4" uitype="text" class="form-control input-sm" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn42" name="dtl-input-sortMchnHldYn42" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn43" name="dtl-input-sortMchnHldYn43" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn44" name="dtl-input-sortMchnHldYn44" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-sortMchnHldYn45" name="dtl-input-sortMchnHldYn45" uitype="text" class="form-control input-sm" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th class="th_bg">대상연도</th>
						<td class="td_input">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="5">
						</td>
					</tr>
					<tr>
						<th class="th_bg">apc명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="5">
						</td>
					</tr>

				</tbody>
			</table>
			</div>
			<div><label>* 해당 APC에서 소유하고 있는 품목별 선별기 모두 기재</label></div>
		</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
<%--     <div>
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

	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
    	fn_createGrid();//그리드 생성 설정 함수

    });

    //grid 초기화
    var grdGdsMcList; // 그리드를 담기위한 객체 선언
    var jsonGdsMcList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdGdsMcList';
	    SBGridProperties.jsonref = 'jsonGdsMcList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'sn'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["선별기 보유여부"],  	ref: 'sortMchnHldYn',     		type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["선별기규격"],	    ref: 'sortMchnSpcfct',    		type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["당도기"],			ref: 'itemCd',            		type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["형상선별"],   		ref: 'itemCd2', 			    type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["가공설비"], 		ref: 'itemCd3',  			   	type:'output',  width:'23%',    style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',            		type:'output',  hidden: false},
            {caption: ["대상연도"],			ref: 'trgtYr',      		    type:'output',  hidden:false},
            {caption: ["등록프로그램"], 		ref: 'creProgram',  			type:'output',  hidden: true},
            {caption: ["변경프로그램"], 		ref: 'updProgram',  			type:'output',  hidden: true}

        ];

        grdGdsMcList = _SBGrid.create(SBGridProperties);
        grdGdsMcList.bind('click', 'fn_view');
        grdGdsMcList.bind('beforepagechanged', 'fn_pagingGdsMcList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdGdsMcList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdGdsMcList.getPageSize());
    	fn_setGrdGdsMcList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingGdsMcList = async function() {
    	console.log("******************fn_pagingGdsMcList**********************************");
    	let recordCountPerPage = grdGdsMcList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdGdsMcList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdGdsMcList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_setGrdGdsMcList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdGdsMcList**********************************");
    	// form clear
    	fn_clearForm();

		grdGdsMcList.clearStatus();

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
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltGdsMchnInfoList.do", {
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

        	jsonGdsMcList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
			  trgtYr: item.trgtYr	 	//대상연도
		   	, apcCd: item.apcCd  //APC
		   	, sn: item.sn  //순번
			, sortMchnCd: item.sortMchnCd //선별기 코드
			, sortMchnItemCd: item.sortMchnItemCd //품목코드
			, sortMchnSpcfct: item.sortMchnSpcfct  //선별기 규격
			, sortMchnHldYn: item.sortMchnHldYn  //선별기 보유 유무
			, rmrk: item.rmrk  //비고

				}

				jsonGdsMcList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonGdsMcList.length > 0) {

        		if(grdGdsMcList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdGdsMcList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdGdsMcList.rebuild();
				}else{
					grdGdsMcList.refresh()
				}
        	} else {
        		grdGdsMcList.setPageTotalCount(totalRecordCount);
        		grdGdsMcList.rebuild();
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
   	    SBUxMethod.set("dtl-input-trgtYr", null);  //대상연도
   	    SBUxMethod.set("dtl-input-apcCd", null);  //APC
   	    SBUxMethod.set("dtl-input-sn", null);  //순번
	    SBUxMethod.set("dtl-input-sortMchnCd", null);  //선별기 코드
	    SBUxMethod.set("dtl-input-sortMchnItemCd", null); //품목코드
	    SBUxMethod.set("dtl-input-sortMchnSpcfct", null);  //선별기 규격
	    SBUxMethod.set("dtl-input-sortMchnHldYn", null);  //선별기 보유 유무
	    SBUxMethod.set("dtl-input-rmrk", null);  //비고
        SBUxMethod.set("dtl-input-delYn", null);                  			 //	 삭제유무
        SBUxMethod.set("dtl-input-sysFrstInptDt", null);      	  	 //	 시스템최초입력일시
        SBUxMethod.set("dtl-input-sysFrstInptUserId", null);     //	 시스템최초입력사용자id
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);   //	 시스템최초입력프로그램id
        SBUxMethod.set("dtl-input-sysLastChgDt", null);     		 	 //	 시스템최종변경일시
        SBUxMethod.set("dtl-input-sysLastChgUserId", null);  	 //	 시스템최종변경사용자id
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);   	 //	 시스템최종변경프로그램id


    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
   	    SBUxMethod.set("dtl-input-sn", null);  //순번
	    SBUxMethod.set("dtl-input-sortMchnCd", null);  //선별기 코드
	    SBUxMethod.set("dtl-input-sortMchnItemCd", null); //품목코드
	    SBUxMethod.set("dtl-input-sortMchnSpcfct", null);  //선별기 규격
	    SBUxMethod.set("dtl-input-sortMchnHldYn", null);  //선별기 보유 유무
	    SBUxMethod.set("dtl-input-rmrk", null);  //비고

     }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");

    	if (!SBUxMethod.get("srch-inp-apcCd")) {
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltGdsMchnInfo.do", {
    			trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
            ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
       	    ,	sn: SBUxMethod.get('dtl-input-sn')  //순번
    	    ,	sortMchnCd: SBUxMethod.get('dtl-input-sortMchnCd')  //선별기 코드
    	    , 	sortMchnItemCd: SBUxMethod.get('dtl-input-sortMchnItemCd') //품목코드
    	    , 	sortMchnSpcfct1: SBUxMethod.get('dtl-input-sortMchnSpcfct')  //선별기 규격
    	    ,	sortMchnHldYn: SBUxMethod.get('dtl-input-sortMchnHldYn')  //선별기 보유 유무
    	    ,	rmrk: SBUxMethod.get('dtl-input-rmrk')  //비고
			,	daddr:1

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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltGdsMchnInfo.do", {
    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
   	    ,	sn: SBUxMethod.get('dtl-input-sn')  //순번
	    ,	sortMchnCd: SBUxMethod.get('dtl-input-sortMchnCd')  //선별기 코드
	    , 	sortMchnItemCd: SBUxMethod.get('dtl-input-sortMchnItemCd') //품목코드
	    , 	sortMchnSpcfct1: SBUxMethod.get('dtl-input-sortMchnSpcfct')  //선별기 규격
	    ,	sortMchnHldYn: SBUxMethod.get('dtl-input-sortMchnHldYn')  //선별기 보유 유무
	    ,	rmrk: SBUxMethod.get('dtl-input-rmrk')  //비고
        ,	delYn: SBUxMethod.get('dtl-input-delYn')                  			 //	 삭제유무
        ,	sysFrstInptDt: SBUxMethod.get('dtl-input-sysFrstInptDt')      	  	 //	 시스템최초입력일시
        ,	sysFrstInptUserId: SBUxMethod.get('dtl-input-sysFrstInptUserId')     //	 시스템최초입력사용자id
        ,	sysFrstInptPrgrmId: SBUxMethod.get('dtl-input-sysFrstInptPrgrmId')   //	 시스템최초입력프로그램id
        ,	sysLastChgDt: SBUxMethod.get('dtl-input-sysLastChgDt')     		 	 //	 시스템최종변경일시
        ,	sysLastChgUserId: SBUxMethod.get('dtl-input-sysLastChgUserId')  	 //	 시스템최종변경사용자id
        ,	sysLastChgPrgrmId: SBUxMethod.get('dtl-input-sysLastChgPrgrmId')   	 //	 시스템최종변경프로그램id
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
        const rows = grdGdsMcList.getGridDataAll();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltGdsMchnInfoList.do", list);

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
    	var nCol = grdGdsMcList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdGdsMcList.getRow();
		if (nRow < 1) {
            return;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdGdsMcList.getRowData(nRow);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                 //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                   //apc코드
    	SBUxMethod.set("dtl-input-sn", rowData.sn);                         //순번
    	SBUxMethod.set("dtl-input-sortMchnCd", rowData.sortMchnCd);         //선별기 코드
    	SBUxMethod.set("dtl-input-sortMchnItemCd", rowData.sortMchnItemCd); //품목코드
    	SBUxMethod.set("dtl-input-sortMchnSpcfct", rowData.sortMchnSpcfct1); //선별기 규격
        SBUxMethod.set("dtl-input-sortMchnHldYn", rowData.sortMchnHldYn);   //선별기 보유 유무
        SBUxMethod.set("dtl-input-rmrk", rowData.rmrk);                     //비고
    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdGdsMcList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdGdsMcList.setCellData(i+1, 1, checkedYn, true, false);
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
</script>
</html>


