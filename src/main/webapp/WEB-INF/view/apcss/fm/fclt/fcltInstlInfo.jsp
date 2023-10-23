
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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 시설 설치보완</h3>
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
			<!--[APC] START -->
<%-- 					<%@ include file="../../../frame/inc/apcSelect.jsp" %> --%>
				<!--[APC] END -->

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
					<div><label>운영자개요 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 15%">
					<col style="width: 30%">
					<col style="width: 55%">

				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg">구분</th>
						<th class="th_bg" colspan="1">내용</th>
						<th colspan="1"></th>
					</tr>
					<tr>
						<th class="th_bg">사업 연도</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-bizYr" name="dtl-input-bizYr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input" colspan="1" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">사업지원코드</th>
						<td colspan="1" class="td_input">
							<sbux-input id="dtl-input-bizSprtCd" name="dtl-input-bizSprtCd" uitype="text" class="form-control input-sm" placeholder="소유자가 지자체로 사업자번호 없을 경우 공란" ></sbux-input>
						</td>
						<td colspan="1" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th  class="th_bg">사업내용</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-bizCn" name="dtl-input-bizCn" uitype="text" class="form-control input-sm" placeholder="최초 페이 내용 그대로 끌어오기" ></sbux-input>
						</td>
						<td class="td_input" colspan="1" style="border-left: hidden;"></td>
					</tr>
					<!--
					<tr>
						<th  class="th_bg">사업비코드</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-bizAmtCd" name="dtl-input-bizAmtCd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input" colspan="1" style="border-left: hidden;"></td>
					</tr>
					 -->
					<tr>
						<th  class="th_bg">사업비1(국고)</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-bizAmt" name="dtl-input-bizAmt" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input" colspan="1" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th  class="th_bg">사업비2(지자체)</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-bizAmt2" name="dtl-input-bizAmt2" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input" colspan="1" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th  class="th_bg">사업비3(자부담)</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-bizAmt3" name="dtl-input-bizAmt3" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td class="td_input" colspan="1" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">대상연도</th>
						<td class="td_input" colspan="1">
							<sbux-input id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="1" style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th class="th_bg">APC 명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="dtl-input-apcCd" name="dtl-input-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-sn" name="dtl-input-sn" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="1" style="border-left: hidden;"></td>
					</tr>

				</tbody>
			</table>

			</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
<%-- 	<!-- 거래처 선택 Modal -->
    <div>
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
    </div>
 --%>
 	<!-- apc 선택 Modal -->
    <div>
        <sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-apcSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	//var jsonApcItem			= [];	// 품목 		itemCd		검색
	//var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	//var comboBizSprtCd			= [];	// 지원유형 		bizSprtCd		검색
	var comboBizSprtCdData = [
		{'label': '정부사업', 'value': '1'},
		{'label': '시도사업', 'value': '2'},
		{'label': '시군사업', 'value': '3'},
		{'label': '자부담', 'value': '4'}
	]
	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
		/*
    	gfn_setComCdSBSelect(
    			['dtl-input-operOgnzTrmtItemCn', 'dtl-input-operOgnzTrmtItemCn2','dtl-input-operOgnzTrmtItemCn3','dtl-input-operOgnzTrmtItemCn4',
    			 'dtl-input-apcTrmtItemCn', 'dtl-input-apcTrmtItemCn2','dtl-input-apcTrmtItemCn3','dtl-input-apcTrmtItemCn4','dtl-input-operOgnzDeptCd'
    			],
    			jsonApcItem,
			'MSG_KND');
		*/
     	//gfn_setApcItemSBSelect('dtl-input-operOgnzTrmtItemCn2', jsonApcItem),	// 품목
    	fn_createGrid();//그리드 생성 설정 함수
		//fn_initSBSelect();

    });
	/*
    const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdGridSelect("grdFcltInstlInfoList", comboBizSprtCd, "BIZ_SPRT_CD",'0000')
		]);
	}
	*/
    //grid 초기화
    var grdFcltInstlInfoList; // 그리드를 담기위한 객체 선언
    var jsonFcltInstlInfoList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdFcltInstlInfoList';
	    SBGridProperties.jsonref = 'jsonFcltInstlInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
            {caption: ["APCNM"],				ref: 'apcNm',       type:'output',  width:'10%',    style:'text-align:center'},
            {caption: ["사업연도","사업연도"],	    	ref: 'bizYr',      type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["지원유형","지원유형"], 		ref: 'bizSprtCd',   type:'combo',  width:'14%',    style:'text-align:center' ,
            	typeinfo : {ref:'comboBizSprtCdData', label:'label', value:'value' ,displayui : true}},
            {caption: ["사업내용","사업내용"],  		ref: 'bizCn',       type:'output',      style:'text-align:center'},
            {caption: ["투자 사업비(백만원)","계"],   	ref: 'bizAmt4',     type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["투자 사업비(백만원)","국고"],   	ref: 'bizAmt',     type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["투자 사업비(백만원)","지자체"],   ref: 'bizAmt2',     type:'output',  width:'14%',    style:'text-align:center'},
            {caption: ["투자 사업비(백만원)","자부담"],   ref: 'bizAmt3',     type:'output',  width:'15%',    style:'text-align:center'},
            {caption: ["APCCD"],				ref: 'apcCd',       type:'output',  hidden: true},
            {caption: ["대상년도"],					ref: 'trgtYr',      type:'output',  hidden: true},
            {caption: ["순번"],					ref: 'sn',      	type:'output',  hidden: true},
            {caption: ["등록프로그램"], 				ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"],		 		ref: 'updProgram',  type:'output',  hidden: true}

        ];

        grdFcltInstlInfoList = _SBGrid.create(SBGridProperties);
        grdFcltInstlInfoList.bind('click', 'fn_view');
        grdFcltInstlInfoList.bind('beforepagechanged', 'fn_pagingFcltInstlInfoList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdFcltInstlInfoList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdFcltInstlInfoList.getPageSize());
    	fn_setGrdFcltInstlInfoList(pageSize, pageNo);
    }
    /**
     *
     */
    const fn_pagingFcltInstlInfoList = async function() {
    	console.log("******************fn_pagingFcltInstlInfoList**********************************");
    	let recordCountPerPage = grdFcltInstlInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdFcltInstlInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltInstlInfoList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdFcltInstlInfoList = async function(pageSize, pageNo) {
    	 console.log("******************fn_setGrdFcltInstlInfoList**********************************");
    	// form clear
    	fn_clearForm();

		grdFcltInstlInfoList.clearStatus();

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");


		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltInstlInfoList.do", {
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

        	jsonFcltInstlInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
				trgtYr: item.trgtYr,	 	//대상연도
				apcCd: item.apcCd, 	 		//apc코드
				sn: item.sn, 	 		//apc코드
				bizYr: item.bizYr,                    	//사업연도
				bizSprtCd: item.bizSprtCd,             //사업지원코드
				bizCn: item.bizCn,                    //사업내용
				bizAmtCd: item.bizAmtCd,        //사업비코드
				bizAmt: item.bizAmt,        //사업비(국고)
				bizAmt2: item.bizAmt2,        //사업비2(지자체)
				bizAmt3: item.bizAmt3,        //사업비3(자부담)
				bizAmt4: item.bizAmt4,        //사업비3(계)
				apcNm: item.apcNm,                  		  		//APC명
				}

				jsonFcltInstlInfoList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonFcltInstlInfoList.length > 0) {

        		if(grdFcltInstlInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdFcltInstlInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdFcltInstlInfoList.rebuild();
				}else{
					grdFcltInstlInfoList.refresh()
				}
        	} else {
        		grdFcltInstlInfoList.setPageTotalCount(totalRecordCount);
        		grdFcltInstlInfoList.rebuild();
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
    	SBUxMethod.set("dtl-input-bizYr", null);                     //  사업연도
    	SBUxMethod.set("dtl-input-bizSprtCd", null);                   //  사업지원코드
    	SBUxMethod.set("dtl-input-bizCn", null);                  //  사업내용
        SBUxMethod.set("dtl-input-bizAmt", null);                   // 사업비(국고)
        SBUxMethod.set("dtl-input-bizAmt2", null);                 // 사업비2(지자체)
        SBUxMethod.set("dtl-input-bizAmt3", null);               //  사업비3(자부담)

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
        SBUxMethod.set("dtl-input-bizSprtCd", null);				//사업지원코드
        SBUxMethod.set("dtl-input-bizCn", null);					//사업내용
        SBUxMethod.set("dtl-input-bizAmt", null);					//사업비(국고)
        SBUxMethod.set("dtl-input-bizAmt2", null);					//사업비2(지자체)
        SBUxMethod.set("dtl-input-bizAmt3", null);    				//사업비3(자부담)
    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		let apcCdUpd = SBUxMethod.get("dtl-input-apcCd");


    	if (!SBUxMethod.get("dtl-input-bizSprtCd")) {
            alert("사업지원코드를 작성해주세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-bizCn")) {
            alert("사업내용을 선택하세요.");
            return;
        }


    	if (gfn_isEmpty(apcCdUpd)) {
    		if (!SBUxMethod.get("srch-input-trgtYr")) {
                alert("대상년도를 선택하세요.");
                return;
            }
     		if (!SBUxMethod.get("srch-inp-apcCd")) {
                alert("APC명을 선택하세요.");
                return;
            }
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInstlInfo.do", {
    	 	trgtYr: SBUxMethod.get("srch-input-trgtYr") , // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
        	apcCd: SBUxMethod.get("srch-inp-apcCd"), // 상단 조회 조건의 APC코드 SBUxMethod.get("srch-inp-apcCd")
        	bizYr: SBUxMethod.get('dtl-input-bizYr'),                             	 // 사업연도
        	bizSprtCd: SBUxMethod.get('dtl-input-bizSprtCd'),                        // 사업지원코드
        	bizCn:  SBUxMethod.get('dtl-input-bizCn'),               				 // 사업내용
        	bizAmt: SBUxMethod.get('dtl-input-bizAmt'),                        		 // 사업비(국고)
        	bizAmt2: SBUxMethod.get('dtl-input-bizAmt2'),                     		 // 사업비2(지자체)
        	bizAmt3: SBUxMethod.get('dtl-input-bizAmt3'),                     		 // 사업비3(자부담)
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltInstlInfo.do", {
    	 	trgtYr: SBUxMethod.get('dtl-input-trgtYr')                           //  대상연도
        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')                             //  APC코드
        ,	sn: SBUxMethod.get('dtl-input-sn')                             		//  순서
        ,	bizYr: SBUxMethod.get('dtl-input-bizYr')                         	 //  사업연도
        ,	bizSprtCd: SBUxMethod.get('dtl-input-bizSprtCd')                  	 //  사업지원코드
        ,	bizCn: SBUxMethod.get('dtl-input-bizCn')                             //  사업내용
        ,	bizAmt: SBUxMethod.get('dtl-input-bizAmt')                     		 //   사업비(국고)
        ,	bizAmt2: SBUxMethod.get('dtl-input-bizAmt2')                 		 //  사업비2(지자체)
        ,	bizAmt3: SBUxMethod.get('dtl-input-bizAmt3')                 		 //  사업비3(자부담)
        ,	bizAmt4: SBUxMethod.get('dtl-input-bizAmt4')                 		 //  사업비4(계)
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
        const rows = grdFcltInstlInfoList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({trgtYr: row.trgtYr , apcCd: row.apcCd , sn: row.sn});
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltInstlInfoList.do", list);

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
    	var nCol = grdFcltInstlInfoList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFcltInstlInfoList.getRow();
		if (nRow < 1) {
            return;
		}

		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdFcltInstlInfoList.getRowData(nRow);
        rowData = fn_emptyString(rowData);

    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);                           //  대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);                             //  APC코드
		SBUxMethod.set("dtl-input-sn", rowData.sn);                             	  //  sn 순서
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm);                             //  APC명
    	SBUxMethod.set("dtl-input-bizYr", rowData.bizYr);                        	  //  사업연도
    	SBUxMethod.set("dtl-input-bizSprtCd", rowData.bizSprtCd);                     //  사업지원코드
    	SBUxMethod.set("dtl-input-bizCn", rowData.bizCn);                             //  사업내용
        SBUxMethod.set("dtl-input-bizAmt", rowData.bizAmt);                     	  //  사업비(국고)
        SBUxMethod.set("dtl-input-bizAmt2", rowData.bizAmt2);                 		  //  사업비2(지자체)
        SBUxMethod.set("dtl-input-bizAmt3", rowData.bizAmt3);                 		  //  사업비3(자부담)
        SBUxMethod.set("dtl-input-bizAmt4", rowData.bizAmt4);                 		  //  사업비4(계)
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdFcltInstlInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdFcltInstlInfoList.setCellData(i+1, 1, checkedYn, true, false);
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