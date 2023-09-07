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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 시설현황</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
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
					<col style="width: 15%">
					<col style="width: 63%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg" scope="row">대상연도</th>
						<td class="td_input"   style="border-right: hidden;">
							<sbux-input id="srch-input-trgtYr" name="srch-input-trgtYr" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>


							<th scope="row" style="border-bottom:1px solid white " class="th_bg" >APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<script type="text/javascript">
								<c:choose>
									<c:when test="${comApcList != null}">
									var cjsonApcList = ${comApcList};
									</c:when>
									<c:otherwise>
									var cjsonApcList = {};
									</c:otherwise>
								</c:choose>
								<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
									gv_selectedApcCd = null;
									gv_selectedApcNm = null;
								</c:if>
									/**
									 * @name
									 * @description
									 * @function
									 * @param {string} _apcCd
									 */
									const cfn_onChangeApc = function(obj) {
										gv_selectedApcCd = obj.value;

										const apcInfo = gfn_getJsonFilter(cjsonApcList, 'apcCd', gv_selectedApcCd);
										apcInfo.forEach( (apc) => {
											gv_selectedApcNm = apc.apcNm;
											return false;
										});

										if (typeof fn_onChangeApc === "function") {
											fn_onChangeApc();
										}

									}

								</script>
								<c:choose>
									<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
										<sbux-select
											id="gsb-slt-apcCd"
											name="gsb-slt-apcCd"
											uitype="single"
											jsondata-ref="cjsonApcList"
											unselected-text="전체"
											class="form-control input-sm"
											onchange="cfn_onChangeApc(this)"
											style="max-width:150px;"
										></sbux-select>
									</c:when>
									<c:otherwise>
										<sbux-input id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="text"  class="form-control input-sm" disabled >${loginVO.apcNm}</sbux-input>
									</c:otherwise>
								</c:choose>
							</td>
							<td></td>
					</tr>
				</tbody>
			</table>
			<br>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>

				<br>
	<div><label>시설현황 상세내역</label></div>
				<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 9%">
					<col style="width: 18%">
					<col style="width: 18%">
					<col style="width: 55%">
				</colgroup>
				<tbody>
					<tr>
						<th class="th_bg">구분</th>
						<th class="th_bg">면적(㎡)</th>
						<th class="th_bg">비고</th>
						<th></th>
					</tr>
					<tr>
						<th class="th_bg">총 건축면적</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea0" name="dtl-input-fcltArea0" uitype="text" class="form-control input-sm" placeholder="5000㎡ " disabled></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk0" name="dtl-input-fcltRmrk0" uitype="text" class="form-control input-sm" placeholder="1개 동"  disabled></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>

						<th class="th_bg">집하선별포장장</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea" name="dtl-input-fcltArea" uitype="text" class="form-control input-sm" placeholder="2,500㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk" name="dtl-input-fcltRmrk" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">세척․가공 등 처리</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea2" name="dtl-input-fcltArea2" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk2" name="dtl-input-fcltRmrk2" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">비상품화시설</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea3" name="dtl-input-fcltArea3" uitype="text" class="form-control input-sm" placeholder="300㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk3" name="dtl-input-fcltRmrk3" uitype="text" class="form-control input-sm" placeholder="사무실,회의실,화장실 등" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">폐기물 처리</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea4" name="dtl-input-fcltArea4" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk4" name="dtl-input-fcltRmrk4" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">예냉고</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea5" name="dtl-input-fcltArea5" uitype="text" class="form-control input-sm" placeholder="300㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk5" name="dtl-input-fcltRmrk5" uitype="text" class="form-control input-sm" placeholder="3칸×100㎡" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">저온저장</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea6" name="dtl-input-fcltArea6" uitype="text" class="form-control input-sm" placeholder="700㎡
							" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk6" name="dtl-input-fcltRmrk6" uitype="text" class="form-control input-sm" placeholder="7칸×100㎡
							" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">CA저장고</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea7" name="dtl-input-fcltArea7" uitype="text" class="form-control input-sm" placeholder="300㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk7" name="dtl-input-fcltRmrk7" uitype="text" class="form-control input-sm" placeholder="3칸×100㎡" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">큐어링</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea8" name="dtl-input-fcltArea8" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk8" name="dtl-input-fcltRmrk8" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">일반저장</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea9" name="dtl-input-fcltArea9" uitype="text" class="form-control input-sm" placeholder="500㎡" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk9" name="dtl-input-fcltRmrk9" uitype="text" class="form-control input-sm" placeholder="5칸×100㎡" ></sbux-input>
						</td>
						<td></td>
					</tr>

					<tr>
						<th class="th_bg">기타사항</th>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltArea10" name="dtl-input-fcltArea10" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td class="td_input">
							<sbux-input id="dtl-input-fcltRmrk10" name="dtl-input-fcltRmrk10" uitype="text" class="form-control input-sm" placeholder="-" ></sbux-input>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="th_bg">대상년도</th>
						<td class="td_input">
							<sbux-input  id="dtl-input-trgtYr" name="dtl-input-trgtYr" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th class="th_bg">APC명</th>
						<td class="td_input">
							<script type="text/javascript">
								<c:choose>
									<c:when test="${comApcList != null}">
									var cjsonApcList = ${comApcList};
									</c:when>
									<c:otherwise>
									var cjsonApcList = {};
									</c:otherwise>
								</c:choose>
								<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
									gv_selectedApcCd = null;
									gv_selectedApcNm = null;
								</c:if>
									/**
									 * @name
									 * @description
									 * @function
									 * @param {string} _apcCd
									 */
									const cfn_onChangeApc = function(obj) {
										gv_selectedApcCd = obj.value;

										const apcInfo = gfn_getJsonFilter(cjsonApcList, 'apcCd', gv_selectedApcCd);
										apcInfo.forEach( (apc) => {
											gv_selectedApcNm = apc.apcNm;
											return false;
										});

										if (typeof fn_onChangeApc === "function") {
											fn_onChangeApc();
										}

									}

								</script>
								<c:choose>
									<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
										<sbux-select
											id="dtl-input-apcCd"
											name="dtl-input-apcCd"
											uitype="single"
											jsondata-ref="cjsonApcList"
											unselected-text="선택"
											class="form-control input-sm"
											onchange="cfn_onChangeApc(this)"
											style="max-width:150px;"
										></sbux-select>
									</c:when>
									<c:otherwise>
										<sbux-input id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="text"  class="form-control input-sm" disabled >${loginVO.apcNm}</sbux-input>
									</c:otherwise>
								</c:choose>
						</td>
						<td colspan="2"></td>
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
    </div> --%>
</body>
<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	let date = new Date();
	let year  = date.getFullYear();
    //화면 초기 로딩
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
/*
    	gfn_setComCdSBSelect(
    			['dtl-input-operOgnzTrmtItemCn', 'dtl-input-operOgnzTrmtItemCn2','dtl-input-operOgnzTrmtItemCn3','dtl-input-operOgnzTrmtItemCn4',
    			 'dtl-input-apcTrmtItemCn', 'dtl-input-apcTrmtItemCn2','dtl-input-apcTrmtItemCn3','dtl-input-apcTrmtItemCn4','dtl-input-operOgnzDeptCd'],
    			jsonApcItem,
			'MSG_KND');
 */
     	//gfn_setApcItemSBSelect('dtl-input-operOgnzTrmtItemCn2', jsonApcItem),	// 품목
    	fn_createGrid();//그리드 생성 설정 함수

    });
    //grid 초기화
    var grdFcltInfoList; // 그리드를 담기위한 객체 선언
    var jsonFcltInfoList = []; // 그리드의 참조 데이터 주소 선언


    //그리드 생성 설정
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdFcltInfoList';
	    SBGridProperties.jsonref = 'jsonFcltInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [

            {caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["총건축면적"],	    ref: 'fcltArea0',    type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["집하선포장장"], 		ref: 'fcltArea',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["비상품화시설"],  		ref: 'fcltArea3',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["예냉고"],   		ref: 'fcltArea5',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["저온저장"],			ref: 'fcltArea6',   type:'output',  	width:'25%',    style:'text-align:center'},
            {caption: ["APCCD"],		ref: 'apcCd',       type:'output',  	hidden: false},
            {caption: ["대상연도"],			ref: 'trgtYr',          type:'output',  hidden: false},
            {caption: ["최초등록자ID"],		ref: 'creUserId',  		type:'output',  hidden: true},
            {caption: ["최초등록일시"],		ref: 'creDateTime',		type:'output',  hidden: true},
            {caption: ["최종변경자ID"],		ref: 'updUserId',   	type:'output',  hidden: true},
            {caption: ["최종변경일시"], 		ref: 'updDateTime', 		type:'output',  hidden: true},
            {caption: ["등록프로그램"], 		ref: 'creProgram',  		type:'output',  hidden: true},
            {caption: ["변경프로그램"], 		ref: 'updProgram',  		type:'output',  hidden: true}

        ];

        grdFcltInfoList = _SBGrid.create(SBGridProperties);
        grdFcltInfoList.bind('click', 'fn_view');
        grdFcltInfoList.bind('beforepagechanged', 'fn_pagingFcltInfoList');
    }
    /**
     * 목록 조회
     */
    const fn_search = async function() {
     	console.log("******************fn_search**********************************");
    	// set pagination
    	let pageSize = grdFcltInfoList.getPageSize(); //페이지 사이즈를 가져오는 함수
    	let pageNo = 1;
    	console.log("******************pageNo**********************************"+pageNo);
    	console.log("******************pageNo**********************************"+pageSize);
    	console.log("******************pageNo**********************************"+grdFcltInfoList.getPageSize());
    	fn_pagingFcltInfoList(pageSize, pageNo);
    }
    /**
     *
     */
     const fn_pagingFcltOperInfoList = async function() {
     	console.log("******************fn_pagingFcltOperInfoList**********************************");
     	let recordCountPerPage = grdFcltOperInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
     	let currentPageNo = grdFcltOperInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
     	fn_setGrdFcltOperInfoList(recordCountPerPage, currentPageNo);
     }
    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */

    const fn_pagingFcltInfoList = async function(pageSize, pageNo) {
    	 console.log("******************fn_pagingFcltInfoList**********************************");
    	// form clear
    	fn_clearForm();

		grdFcltInfoList.clearStatus();

		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
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
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltInfoList.do", {
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

        	jsonFcltInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
				trgtYr: item.trgtYr,	 	 //대상연도
				apcCd: item.apcCd, 	 		 //apc코드
		     	fcltCd: item.fcltCd,     	 //apc코드
		    	fcltNm: item.fcltNm,     	 //시설 코드
		    	apcNm: item.apcNm,         	 //시설 명
		        fcltArea0: item.fcltArea0,     //시설 면적 총면적
		        fcltRmrk0: item.fcltRmrk0,    			 //비고
		        fcltArea: item.fcltArea,     //시설 면적 집하선별포장장
		        fcltRmrk: item.fcltRmrk,    			 //비고
		        fcltArea2: item.fcltArea2,     //시설 면적 세척,가공 등 처리
		        fcltRmrk2: item.fcltRmrk2,    			 //비고
		        fcltArea3: item.fcltArea3,     //시설 면적 비 상품화시설
		        fcltRmrk3: item.fcltRmrk3,    			 //비고
		        fcltArea4: item.fcltArea4,     //시설 면적 폐기물처리
		        fcltRmrk4: item.fcltRmrk4,    			 //비고
		        fcltArea5: item.fcltArea5,     //시설 면적 예냉고
		        fcltRmrk5: item.fcltRmrk5,    			 //비고
		        fcltArea6: item.fcltArea6,     //시설 면적 저온저장
		        fcltRmrk6: item.fcltRmrk6,    			 //비고
		        fcltArea7: item.fcltArea7,     //시설 면적 CA저장고
		        fcltRmrk7: item.fcltRmrk7,    			 //비고
		        fcltArea8: item.fcltArea8,     //시설 면적 큐어링
		        fcltRmrk8: item.fcltRmrk8,    			 //비고
		        fcltArea9: item.fcltArea9,     //시설 면적 일반저장
		        fcltRmrk9: item.fcltRmrk9,    			 //비고
		        fcltArea10: item.fcltArea10,     //시설 면적 기타사항
		        fcltRmrk10: item.fcltRmrk10,    			 //비고
				delYn: item.delYn,                  				//삭제유무
	            sysFrstInptDt: item.sysFrstInptDt,       			//시스템최초입력일시
		        sysFrstInptUserId: item.sysFrstInptUserId,   	   //시스템최초입력사용자id
		        sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,     	//시스템최초입력프로그램id
		        sysLastChgDt: item.sysLastChgDt,    				//시스템최종변경일시
		        sysLastChgUserId: item.sysLastChgUserId,  			//시스템최종변경사용자id
		        sysLastChgPrgrmId: item.sysLastChgPrgrmId   		//시스템최종변경프로그램id
				}

				jsonFcltInfoList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonFcltInfoList.length > 0) {

        		if(grdFcltInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdFcltInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdFcltInfoList.rebuild();
				}else{
					grdFcltInfoList.refresh()
				}
        	} else {
        		grdFcltInfoList.setPageTotalCount(totalRecordCount);
        		grdFcltInfoList.rebuild();
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
    	SBUxMethod.set("dtl-input-trgtYr", null);                    //  대상연도
		SBUxMethod.set("dtl-input-apcCd", null);                     //  APC코드
    	SBUxMethod.set("dtl-input-fcltCd", null);      				 //  시설 코드
    	SBUxMethod.set("dtl-input-fcltNm", null); 				     //  시설 명
        SBUxMethod.set("dtl-input-fcltArea", null);					   //시설 면적 총면적
        SBUxMethod.set("dtl-input-fcltRmrk", null);					  			 //비고
        SBUxMethod.set("dtl-input-fcltArea0", null);                 //시설 면적 집하선별포장장
        SBUxMethod.set("dtl-input-fcltRmrk0", null);                			 //비고
        SBUxMethod.set("dtl-input-fcltArea2", null);                   //시설 면적 세척,가공 등 처리
        SBUxMethod.set("dtl-input-rmr2k", null);                      			 //비고
        SBUxMethod.set("dtl-input-fcltArea3", null);                   //시설 면적 비 상품화시설
        SBUxMethod.set("dtl-input-fcltRmrk3", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea4", null);                   //시설 면적 폐기물처리
        SBUxMethod.set("dtl-input-fcltRmrk4", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea5", null);                   //시설 면적 예냉고
        SBUxMethod.set("dtl-input-fcltRmrk5", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea6", null);                   //시설 면적 저온저장
        SBUxMethod.set("dtl-input-fcltRmrk6", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea7", null);                   //시설 면적 CA저장고
        SBUxMethod.set("dtl-input-fcltRmrk7", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea8", null);                   //시설 면적 큐어링
        SBUxMethod.set("dtl-input-fcltRmrk8", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea9", null);                   //시설 면적 일반저장
        SBUxMethod.set("dtl-input-fcltRmrk9", null);                  			 //비고
        SBUxMethod.set("dtl-input-fcltArea10", null);                    //시설 면적 기타사항
        SBUxMethod.set("dtl-input-fcltRmrk10", null);                   			 //비고
    	SBUxMethod.set("dtl-input-delYn", null);                  	 //  삭제유무
    	SBUxMethod.set("dtl-input-sysFrstInptDt", null);       		 //	 시스템최초입력일시
    	SBUxMethod.set("dtl-input-sysFrstInptUserId", null);      	 //  시스템최초입력사용자id
    	SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", null);     	 //  시스템최초입력프로그램id
    	SBUxMethod.set("dtl-input-sysLastChgDt", null);      		 //  시스템최종변경일시
    	SBUxMethod.set("dtl-input-sysLastChgUserId", null);   	 	 //  시스템최종변경사용자id
    	SBUxMethod.set("dtl-input-sysLastChgPrgrmId", null);  	 	 //  시스템최종변경프로그램id

    }

     const fn_clearForm = function() {
    	 console.log("******************fn_clearForm**********************************");
     	SBUxMethod.set("dtl-input-fcltCd", null);
     	SBUxMethod.set("dtl-input-fcltNm", null);
    	SBUxMethod.set("dtl-input-apcNm", null);
        SBUxMethod.set("dtl-input-fcltArea", null);           //시설 면적 총면적
        SBUxMethod.set("dtl-input-fcltRmrk", null);          			 //비고
        SBUxMethod.set("dtl-input-fcltArea0", null);        //시설 면적 집하선별포장장
        SBUxMethod.set("dtl-input-fcltRmrk0", null);       			 //비고
        SBUxMethod.set("dtl-input-fcltArea2", null);          //시설 면적 세척,가공 등 처리
        SBUxMethod.set("dtl-input-rmrk2", null);             			 //비고
        SBUxMethod.set("dtl-input-fcltArea3", null);          //시설 면적 비 상품화시설
        SBUxMethod.set("dtl-input-fcltRmrk3", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea4", null);          //시설 면적 폐기물처리
        SBUxMethod.set("dtl-input-fcltRmrk4", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea5", null);          //시설 면적 예냉고
        SBUxMethod.set("dtl-input-fcltRmrk5", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea6", null);          //시설 면적 저온저장
        SBUxMethod.set("dtl-input-fcltRmrk6", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea7", null);          //시설 면적 CA저장고
        SBUxMethod.set("dtl-input-fcltRmrk7", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea8", null);          //시설 면적 큐어링
        SBUxMethod.set("dtl-input-fcltRmrk8", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea9", null);          //시설 면적 일반저장
        SBUxMethod.set("dtl-input-fcltRmrk9", null);         			 //비고
        SBUxMethod.set("dtl-input-fcltArea10", null);           //시설 면적 기타사항
        SBUxMethod.set("dtl-input-fcltRmrk10", null);          			 //비고
    }
    //저장
    const fn_save = async function() {
    	console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
		let trgtYr = SBUxMethod.get("srch-input-trgtYr");
		let apcCdUpd = SBUxMethod.get("dtl-input-apcCd");

/*     	if (!SBUxMethod.get("dtl-input-fcltCd")) {
            alert("조회 항목의 시설명을 입력하세요.");
            return;
        }
    	if (!SBUxMethod.get("dtl-input-fcltArea")) {
            alert("총 건축면적을 입력하세요.");
            return;
        }
    	*/
		if (gfn_isEmpty(apcCdUpd)) {
    		if (!SBUxMethod.get("srch-input-trgtYr")) {
                alert("대상년도를 선택하세요.");
                return;
            }
     		if (!SBUxMethod.get("gsb-slt-apcCd")) {
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

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInfo.do", {
	    	 	trgtYr: SBUxMethod.get("srch-input-trgtYr")  // 상단 조회 조건의 대상연도 SBUxMethod.get("srch-input-trgtYr")
    	    ,	apcCd: SBUxMethod.get("gsb-slt-apcCd") // 상단 조회 조건의 APC코드 SBUxMethod.get("gsb-slt-apcCd")
            ,	fcltCd: SBUxMethod.get('dtl-input-fcltCd')   	                     //  apc코드
            ,	fcltNm: SBUxMethod.get('dtl-input-fcltNm')   	                     //  시설 코드
            ,	apcNm: SBUxMethod.get('dtl-input-apcNm')    	                     //  시설 명
            ,	fcltRmrk0: SBUxMethod.get('dtl-input-fcltRmrk0')      	                 //시설 면적 총면적
            ,	fcltArea: SBUxMethod.get('dtl-input-fcltArea')                          //시설 면적 집하선별포장장
            ,	fcltRmrk: SBUxMethod.get('dtl-input-fcltRmrk')      	                 //비고
            ,	fcltArea2: SBUxMethod.get('dtl-input-fcltArea2')                      	//시설 면적 세척,가공 등 처리
            ,	fcltRmrk2: SBUxMethod.get('dtl-input-fcltRmrk2')      	                //비고
            ,	fcltArea3: SBUxMethod.get('dtl-input-fcltArea3')                         //시설 면적 비 상품화시설
            ,	fcltRmrk3: SBUxMethod.get('dtl-input-fcltRmrk3')      	                  			 //비고
            ,	fcltArea4: SBUxMethod.get('dtl-input-fcltArea4')                           //시설 면적 폐기물처리
            ,	fcltRmrk4: SBUxMethod.get('dtl-input-fcltRmrk4')      	                  			 //비고
            ,	fcltArea5: SBUxMethod.get('dtl-input-fcltArea5')                           //시설 면적 예냉고
            ,	fcltRmrk5: SBUxMethod.get('dtl-input-fcltRmrk5')      	                  			 //비고
            ,	fcltArea6: SBUxMethod.get('dtl-input-fcltArea6')                           //시설 면적 저온저장
            ,	fcltRmrk6: SBUxMethod.get('dtl-input-fcltRmrk6')      	                  			 //비고
            ,	fcltArea7: SBUxMethod.get('dtl-input-fcltArea7')                           //시설 면적 CA저장고
            ,	fcltRmrk7: SBUxMethod.get('dtl-input-fcltRmrk7')      	                  			 //비고
            ,	fcltArea8: SBUxMethod.get('dtl-input-fcltArea8')                           //시설 면적 큐어링
            ,	fcltRmrk8: SBUxMethod.get('dtl-input-fcltRmrk8')      	                  			 //비고
            ,	fcltArea9: SBUxMethod.get('dtl-input-fcltArea9')                           //시설 면적 일반저장
            ,	fcltRmrk9: SBUxMethod.get('dtl-input-fcltRmrk9')      	                  			 //비고
            ,	fcltArea10: SBUxMethod.get('dtl-input-fcltArea10')                           //시설 면적 기타사항
            ,	fcltRmrk10: SBUxMethod.get('dtl-input-fcltRmrk10')      	                			 //비고
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

		var updateValue = {
				trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
		        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  apc코드
		        ,	fcltCd: SBUxMethod.get('dtl-input-fcltCd')   	                     //  시설 코드
		        ,	fcltNm: SBUxMethod.get('dtl-input-fcltNm')   	                     //  시설 명
		        ,	fcltRmrk0: SBUxMethod.get('dtl-input-fcltRmrk0')      	             //	시설 면적 총면적
		        ,	fcltArea1: SBUxMethod.get('dtl-input-fcltArea0')                      //	시설 면적 집하선별포장장
		        ,	fcltArea1: SBUxMethod.get('dtl-input-fcltArea')                      //	시설 면적 집하선별포장장
		        ,	fcltRmrk1: SBUxMethod.get('dtl-input-fcltRmrk')      	             //	비고
		        ,	fcltArea2: SBUxMethod.get('dtl-input-fcltArea2')                     //	시설 면적 세척,가공 등 처리
		        ,	fcltRmrk2: SBUxMethod.get('dtl-input-fcltRmrk2')      	             //	비고
		        ,	fcltArea3: SBUxMethod.get('dtl-input-fcltArea3')                     //	시설 면적 비 상품화시설
		        ,	fcltRmrk3: SBUxMethod.get('dtl-input-fcltRmrk3')      	             //	비고
		        ,	fcltArea4: SBUxMethod.get('dtl-input-fcltArea4')                     //	시설 면적 폐기물처리
		        ,	fcltRmrk4: SBUxMethod.get('dtl-input-fcltRmrk4')      	             //	비고
		        ,	fcltArea5: SBUxMethod.get('dtl-input-fcltArea5')                     //	시설 면적 예냉고
		        ,	fcltRmrk5: SBUxMethod.get('dtl-input-fcltRmrk5')      	             //	비고
		        ,	fcltArea6: SBUxMethod.get('dtl-input-fcltArea6')                     //	시설 면적 저온저장
		        ,	fcltRmrk6: SBUxMethod.get('dtl-input-fcltRmrk6')      	             //	비고
		        ,	fcltArea7: SBUxMethod.get('dtl-input-fcltArea7')                     //	시설 면적 CA저장고
		        ,	fcltRmrk7: SBUxMethod.get('dtl-input-fcltRmrk7')      	             //	비고
		        ,	fcltArea8: SBUxMethod.get('dtl-input-fcltArea8')                     //	시설 면적 큐어링
		        ,	fcltRmrk8: SBUxMethod.get('dtl-input-fcltRmrk8')      	             //	비고
		        ,	fcltArea9: SBUxMethod.get('dtl-input-fcltArea9')                     //	시설 면적 일반저장
		        ,	fcltRmrk9: SBUxMethod.get('dtl-input-fcltRmrk9')      	             //	비고
		        ,	fcltArea10: SBUxMethod.get('dtl-input-fcltArea10')                   //	시설 면적 기타사항
		        ,	fcltRmrk10: SBUxMethod.get('dtl-input-fcltRmrk10')                   //	비고
		        ,	delYn: SBUxMethod.get('dtl-input-delYn')                  			 //	 삭제유무
		        ,	sysFrstInptDt: SBUxMethod.get('dtl-input-sysFrstInptDt')      	  	 //	 시스템최초입력일시
		        ,	sysFrstInptUserId: SBUxMethod.get('dtl-input-sysFrstInptUserId')     //	 시스템최초입력사용자id
		        ,	sysFrstInptPrgrmId: SBUxMethod.get('dtl-input-sysFrstInptPrgrmId')   //	 시스템최초입력프로그램id
		        ,	sysLastChgDt: SBUxMethod.get('dtl-input-sysLastChgDt')     		 	 //	 시스템최종변경일시
		        ,	sysLastChgUserId: SBUxMethod.get('dtl-input-sysLastChgUserId')  	 //	 시스템최종변경사용자id
		        ,	sysLastChgPrgrmId: SBUxMethod.get('dtl-input-sysLastChgPrgrmId')   	 //	 시스템최종변경프로그램id

		}

		console.log("========updateValue============");
		console.log(updateValue);

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltInfo.do", {
        	trgtYr: SBUxMethod.get('dtl-input-trgtYr')   	                     //  대상연도
        ,	apcCd: SBUxMethod.get('dtl-input-apcCd')     	                     //  apc코드
        ,	fcltCd: SBUxMethod.get('dtl-input-fcltCd')   	                     //  시설 코드
        ,	fcltNm: SBUxMethod.get('dtl-input-fcltNm')   	                     //  시설 명
        ,	fcltRmrk0: SBUxMethod.get('dtl-input-fcltRmrk0')      	             //	시설 면적 총면적
        ,	fcltArea1: SBUxMethod.get('dtl-input-fcltArea')                      //	시설 면적 집하선별포장장
        ,	fcltRmrk1: SBUxMethod.get('dtl-input-fcltRmrk')      	             //	비고
        ,	fcltArea2: SBUxMethod.get('dtl-input-fcltArea2')                     //	시설 면적 세척,가공 등 처리
        ,	fcltRmrk2: SBUxMethod.get('dtl-input-fcltRmrk2')      	             //	비고
        ,	fcltArea3: SBUxMethod.get('dtl-input-fcltArea3')                     //	시설 면적 비 상품화시설
        ,	fcltRmrk3: SBUxMethod.get('dtl-input-fcltRmrk3')      	             //	비고
        ,	fcltArea4: SBUxMethod.get('dtl-input-fcltArea4')                     //	시설 면적 폐기물처리
        ,	fcltRmrk4: SBUxMethod.get('dtl-input-fcltRmrk4')      	             //	비고
        ,	fcltArea5: SBUxMethod.get('dtl-input-fcltArea5')                     //	시설 면적 예냉고
        ,	fcltRmrk5: SBUxMethod.get('dtl-input-fcltRmrk5')      	             //	비고
        ,	fcltArea6: SBUxMethod.get('dtl-input-fcltArea6')                     //	시설 면적 저온저장
        ,	fcltRmrk6: SBUxMethod.get('dtl-input-fcltRmrk6')      	             //	비고
        ,	fcltArea7: SBUxMethod.get('dtl-input-fcltArea7')                     //	시설 면적 CA저장고
        ,	fcltRmrk7: SBUxMethod.get('dtl-input-fcltRmrk7')      	             //	비고
        ,	fcltArea8: SBUxMethod.get('dtl-input-fcltArea8')                     //	시설 면적 큐어링
        ,	fcltRmrk8: SBUxMethod.get('dtl-input-fcltRmrk8')      	             //	비고
        ,	fcltArea9: SBUxMethod.get('dtl-input-fcltArea9')                     //	시설 면적 일반저장
        ,	fcltRmrk9: SBUxMethod.get('dtl-input-fcltRmrk9')      	             //	비고
        ,	fcltArea10: SBUxMethod.get('dtl-input-fcltArea10')                   //	시설 면적 기타사항
        ,	fcltRmrk10: SBUxMethod.get('dtl-input-fcltRmrk10')                   //	비고
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
        const rows = grdFcltInfoList.getGridDataAll();
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

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltInfoList.do", list);

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
    	var nCol = grdFcltInfoList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFcltInfoList.getRow();
		if (nRow < 1) {
            return;
		}
		if(nRow == null){
			nRow = 1;
		}
			//서치폼에서 클릭시 디테일폼에 데이터출력
        let rowData = grdFcltInfoList.getRowData(nRow);


    	SBUxMethod.set("dtl-input-trgtYr", rowData.trgtYr);       //대상연도
		SBUxMethod.set("dtl-input-apcCd", rowData.apcCd);         //apc코드
    	SBUxMethod.set("dtl-input-fcltCd", rowData.fcltCd);      //apc코드
    	SBUxMethod.set("dtl-input-fcltNm", rowData.fcltNm);     //시설 코드
        SBUxMethod.set("dtl-input-fcltArea0", rowData.fcltArea0);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk0", rowData.fcltRmrk0);      //비고
        SBUxMethod.set("dtl-input-fcltArea", rowData.fcltArea);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk", rowData.fcltRmrk);      //비고
        SBUxMethod.set("dtl-input-fcltArea2", rowData.fcltArea2);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk2", rowData.fcltRmrk2);      //비고
        SBUxMethod.set("dtl-input-fcltArea3", rowData.fcltArea3);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk3", rowData.fcltRmrk3);      //비고
        SBUxMethod.set("dtl-input-fcltArea4", rowData.fcltArea4);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk4", rowData.fcltRmrk4);      //비고
        SBUxMethod.set("dtl-input-fcltArea5", rowData.fcltArea5);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk5", rowData.fcltRmrk5);      //비고
        SBUxMethod.set("dtl-input-fcltArea6", rowData.fcltArea6);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk6", rowData.fcltRmrk6);      //비고
        SBUxMethod.set("dtl-input-fcltArea7", rowData.fcltArea7);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk7", rowData.fcltRmrk7);      //비고
        SBUxMethod.set("dtl-input-fcltArea8", rowData.fcltArea8);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk8", rowData.fcltRmrk8);      //비고
        SBUxMethod.set("dtl-input-fcltArea9", rowData.fcltArea9);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk9", rowData.fcltRmrk9);      //비고
        SBUxMethod.set("dtl-input-fcltArea10", rowData.fcltArea10);    //시설 면적
        SBUxMethod.set("dtl-input-fcltRmrk10", rowData.fcltRmrk10);      //비고

    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
    	console.log("******************fn_checkAll**********************************");
        var gridList = grdFcltInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdFcltInfoList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }

	</script>
</html>



