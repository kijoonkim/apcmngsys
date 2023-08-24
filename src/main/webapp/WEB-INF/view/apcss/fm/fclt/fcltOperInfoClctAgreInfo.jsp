
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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 개인정보이용동의</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-input-outordrInq" name="btn-srch-input-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
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
					<col style="width: 15%">
					<col style="width: 63%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">대상연도</th>
						<td "td_input"  style="border-right: hidden;">
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


			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>
				<br>
					<div><label>운영자개요 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 7%">
					<col style="width: 28%">
					<col style="width: 65%">
				</colgroup>
				<tbody>
					<tr>
						<th>운영조직명</th>
						<td>
							<sbux-input id="dtl-input-operOgnzNm" name="dtl-input-operOgnzNm" uitype="text" class="form-control input-sm" placeholder="검색/ 신규 조직인 경우 수기입력" ></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th>운영조직사업자번호</th>
						<td>
							<sbux-input id="dtl-input-operOgnzBrno" name="dtl-input-operOgnzBrno" uitype="text" class="form-control input-sm" placeholder=""></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th>APC 보유여부</th>
						<td style="border-left: hidden;">
							<sbux-input id="dtl-input-apcHldYn" name="dtl-input-apcHldYn" uitype="text" class="form-control input-sm" placeholder="보유 / 미보유 -임대운영의 경우 보유로 체크" ></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>

					</tr>
					<tr>
						<th>APC 명</th>
						<td>
							<sbux-input id="dtl-input-apcNm" name="dtl-input-apcNm" uitype="text" class="form-control input-sm" placeholder="수기입력" ></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th>담당자</th>
						<td>
							<sbux-input id="dtl-input-operOgnzPic" name="dtl-input-operOgnzPic" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th>담당자 직위 </th>
						<td>
							<sbux-input id="dtl-input-operOgnzJbps" name="dtl-input-operOgnzJbps" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th>담당자 연락처 </th>
						<td>
							<sbux-input id="dtl-input-operOgnzTelno" name="dtl-input-operOgnzTelno" uitype="text" class="form-control input-sm" placeholder="010-0000-0000" ></sbux-input>
						</td>
						<td style="border-left: hidden;"></td>
					</tr>
					<tr>
						<th>담당자 이메일</th>
						<td>
							<sbux-input id="dtl-input-operOgnzEml" name="dtl-input-operOgnzEml" uitype="text" class="form-control input-sm" placeholder="000000@naver.com" ></sbux-input>
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
	<!-- 거래처 선택 Modal -->
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


</body>
<script type="text/javascript">

	// ${comMenuVO.menuId}

	// 공통코드 JSON
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	let date = new Date();
	let year  = date.getFullYear();
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	SBUxMethod.set("srch-input-trgtYr", year);
    	fn_createGrid();

    	gfn_setComCdSBSelect(
    			['dtl-select-msgKnd', 'dtl-select-msgKnd'],
    			jsonComMsgKnd,
			'MSG_KND');
    });

    //grid 초기화
    var grdFcltOperInfoClctAgreInfoList; // 그리드를 담기위한 객체 선언
    var jsonFcltOperInfoClctAgreInfoList = []; // 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdFcltOperInfoClctAgreInfoList';
	    SBGridProperties.jsonref = 'jsonFcltOperInfoClctAgreInfoList';
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
            {caption: ["운영조직명"], 	ref: 'operOgnzNm',     	type:'output',  width:'26%',    style:'text-align:center'},
            {caption: ["운영조직담당자"],  	ref: 'operOgnzPic',    type:'output',  width:'26%',    style:'text-align:center'},
            {caption: ["운영조직직위"],   ref: 'operOgnzJbps',    type:'output',  width:'26%',    style:'text-align:center'},
            {caption: ["운영조직 이메일"],	    ref: 'operOgnzEml',   type:'output',  width:'26%',    style:'text-align:center'},
            {caption: ["최초등록자ID"],	ref: 'apcCd',           type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'trgtYr',           type:'output',  hidden: true},
            {caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
            {caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
            {caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
            {caption: ["최종변경일시"],  ref: 'updDateTime', type:'output',  hidden: true},
            {caption: ["등록프로그램"],  ref: 'creProgram',  type:'output',  hidden: true},
            {caption: ["변경프로그램"],  ref: 'updProgram',  type:'output',  hidden: true}

        ];

        grdFcltOperInfoClctAgreInfoList = _SBGrid.create(SBGridProperties);
        grdFcltOperInfoClctAgreInfoList.bind('click', 'fn_view');
        grdFcltOperInfoClctAgreInfoList.bind('beforepagechanged', 'fn_pagingFcltOperInfoClctAgreInfoList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdFcltOperInfoClctAgreInfoList.getPageSize();
    	let pageNo = 1;

    	fn_setGrdFcltOperInfoClctAgreInfoList(pageSize, pageNo);
    }

    /**
     *
     */
    const fn_pagingFcltOperInfoClctAgreInfoList = async function() {
    	let recordCountPerPage = grdFcltOperInfoClctAgreInfoList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdFcltOperInfoClctAgreInfoList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltOperInfoClctAgreInfoList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
     // select 그리드 조회 생ㅅ
    const fn_setGrdFcltOperInfoClctAgreInfoList = async function(pageSize, pageNo) {

    	// form clear
    	fn_clearForm();

		grdFcltOperInfoClctAgreInfoList.clearStatus();

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

        const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOperInfoClctAgreInfoList.do", {
        	trgtYr: trgtYr,
        	apcCd: apcCd,
        	// pagination
	  		pagingYn : 'Y',
			currentPageNo : pageNo,
 		  	recordCountPerPage : pageSize
        });
		console.log("a11111111111111");
        const data = await postJsonPromise;

        console.log("---------------------------")
        console.log(data);
        console.log(data.resultList);



        try {

        	/** @type {number} **/
    		let totalRecordCount = 0;

        	jsonFcltOperInfoClctAgreInfoList.length = 0;
        	data.resultList.forEach((item, index) => {
				const msg = {
			         trgtYr: item.trgtYr,	 	//대상연도
			         apcCd: item.apcCd, 	 	//apc코드
			         operOgnzCd: item.operOgnzCd,  	//운영조직 코드
			         operOgnzNm: item.operOgnzNm, 	 //운영조직 명
			         operOgnzBrno: item.operOgnzBrno,  	//운영조직 사업자등록번호
			         apcHldYn: item.apcHldYn, 	 //apc보유여부
			         operOgnzPic: item.operOgnzPic, 	 //담당자
			         operOgnzJbps: item.operOgnzJbps,  	//담당자 직위
			         operOgnzTelno: item.operOgnzTelno, 	 //담당자 연락처
			         operOgnzEml: item.operOgnzEml,  	//담당자 이메일
			         prsnaDataAgrdYn: item.prsnaDataAgrdYn,  	//동의여부
			         delYn: item.delYn,                  //삭제유무
			         sysFrstInptDt: item.sysFrstInptDt,       //시스템최초입력일시
			         sysFrstInptUserId: item.sysFrstInptUserId,      //시스템최초입력사용자id
			         sysFrstInptPrgrmId: item.sysFrstInptPrgrmId,     	//시스템최초입력프로그램id
			         sysLastChgDt: item.sysLastChgDt,    		  //시스템최종변경일시
			         sysLastChgUserId: item.sysLastChgUserId,  	//시스템최종변경사용자id
			         sysLastChgPrgrmId: item.sysLastChgPrgrmId   //시스템최종변경프로그램id
				}

				jsonFcltOperInfoClctAgreInfoList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	console.log("c33333333333333333333");
        	console.log("totalRecordCount", totalRecordCount);

        	if (jsonFcltOperInfoClctAgreInfoList.length > 0) {

        		if(grdFcltOperInfoClctAgreInfoList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdFcltOperInfoClctAgreInfoList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdFcltOperInfoClctAgreInfoList.rebuild();
				}else{
					grdFcltOperInfoClctAgreInfoList.refresh()
				}
        	} else {
        		grdFcltOperInfoClctAgreInfoList.setPageTotalCount(totalRecordCount);
        		grdFcltOperInfoClctAgreInfoList.rebuild();
        	}

        	//document.querySelector('#listCount').innerText = totalRecordCount;
        	console.log(grdFcltOperInfoClctAgreInfoList);
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }


    //신규 작성
    function fn_create() {
    	SBUxMethod.set("srch-input-trgtYr",null); 	 	//대상연도
    	SBUxMethod.set("gsb-slt-apcCd",null); 	 	//apc코드
    	SBUxMethod.set("dtl-input-operOgnzCd",null);  	//운영조직 코드
    	SBUxMethod.set("dtl-input-operOgnzNm",null); 	 //운영조직 명
    	SBUxMethod.set("dtl-input-operOgnzBrno",null);  	//운영조직 사업자등록번호
    	SBUxMethod.set("dtl-input-apcHldYn",null); 	 //apc보유여부
    	SBUxMethod.set("dtl-input-operOgnzPic",null); 	 //담당자
    	SBUxMethod.set("dtl-input-operOgnzJbps",null);  	//담당자 직위
    	SBUxMethod.set("dtl-input-operOgnzTelno",null); 	 //담당자 연락처
    	SBUxMethod.set("dtl-input-operOgnzEml",null);  	//담당자 이메일
    	SBUxMethod.set("dtl-input-prsnaDataAgrdYn",null);  	//동의여부
    	SBUxMethod.set("dtl-input-delYn",null);                  //삭제유무
    	SBUxMethod.set("dtl-input-sysFrstInptDt",null);       //시스템최초입력일시
    	SBUxMethod.set("dtl-input-sysFrstInptUserId",null);      //시스템최초입력사용자id
    	SBUxMethod.set("dtl-input-sysFrstInptPrgrmId",null);     	//시스템최초입력프로그램id
    	SBUxMethod.set("dtl-input-sysLastChgDt",null);      //시스템최종변경일시
    	SBUxMethod.set("dtl-input-sysLastChgUserId",null);   //시스템최종변경사용자id
    	SBUxMethod.set("dtl-input-sysLastChgPrgrmId",null);   //시스템최종변경프로그램id
    }
     const fn_clearForm = function() {                       //그리드 목록을 초기화
       	//SBUxMethod.set("srch-input-trgtYr",null); 	 	//대상연도
		//SBUxMethod.set("gsb-slt-apcCd",null); 	 	//apc코드
		SBUxMethod.set("dtl-input-operOgnzCd",null);  	//운영조직 코드
		SBUxMethod.set("dtl-input-operOgnzNm",null); 	 //운영조직 명
		SBUxMethod.set("dtl-input-operOgnzBrno",null);  	//운영조직 사업자등록번호
		SBUxMethod.set("dtl-input-apcHldYn",null); 	 //apc보유여부
		SBUxMethod.set("dtl-input-operOgnzPic",null); 	 //담당자
		SBUxMethod.set("dtl-input-operOgnzJbps",null);  	//담당자 직위
		SBUxMethod.set("dtl-input-operOgnzTelno",null); 	 //담당자 연락처
       	SBUxMethod.set("dtl-input-operOgnzEml",null);  	//담당자 이메일
       	SBUxMethod.set("dtl-input-prsnaDataAgrdYn",null);  	//동의여부
       	SBUxMethod.set("dtl-input-delYn",null);                  //삭제유무
       	SBUxMethod.set("dtl-input-sysFrstInptDt",null);       //시스템최초입력일시
       	SBUxMethod.set("dtl-input-sysFrstInptUserId",null);      //시스템최초입력사용자id
       	SBUxMethod.set("dtl-input-sysFrstInptPrgrmId",null);     	//시스템최초입력프로그램id
       	SBUxMethod.set("dtl-input-sysLastChgDt",null);      //시스템최종변경일시
       	SBUxMethod.set("dtl-input-sysLastChgUserId",null);   //시스템최종변경사용자id
       	SBUxMethod.set("dtl-input-sysLastChgPrgrmId",null);   //시스템최종변경프로그램id
    }
    //저장
    const fn_save = async function() {

    	let apcCd = SBUxMethod.get("gsb-slt-apcCd");
    	let trgtYr = SBUxMethod.get("srch-input-trgtYr");

    	if (!SBUxMethod.get("gsb-slt-apcCd")) {
            alert("APC명을 선택하세요.");
            return;
        }
    	if (!SBUxMethod.get("srch-input-trgtYr")) {
            alert("대상년도를 입력하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-operOgnzNm")) {
            alert("운영조직명을 입력하세요.");
            return;
        }

    	if (!SBUxMethod.get("dtl-input-operOgnzPic")) {
            alert("운영조직 담당자명을 입력하세요.");
            return;
        }

    	/*
        SBUxMethod.set("dtl-input-orgnMsgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgKnd", rowData.msgKnd);
        SBUxMethod.set("dtl-input-msgKey", rowData.msgKey);
        SBUxMethod.set("dtl-input-msgCn", rowData.msgCn);
        SBUxMethod.set("dtl-input-rmrk", rowData.rmrk);
        SBUxMethod.set("dtl-input-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-input-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-input-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-input-sysLastChgDt", rowData.sysLastChgDt);
        SBUxMethod.set("dtl-input-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-input-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
    	 */

     	if (gfn_isEmpty(apcCd)) {
    		// 신규 등록
			fn_subInsert(confirm("등록 하시겠습니까?"));
    	} else {
    		// 변경 저장
    		fn_subUpdate(confirm("저장 하시겠습니까?"));
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (isConfirmed){

    	 if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOperInfoClctAgreInfo.do", {
    				trgtYr: SBUxMethod.get('srch-input-trgtYr'), 	 	//대상연도
					apcCd: SBUxMethod.get('gsb-slt-apcCd'), 	 	//apc코드
					operOgnzCd: SBUxMethod.get('dtl-input-operOgnzCd'),  	//운영조직 코드
					operOgnzNm: SBUxMethod.get('dtl-input-operOgnzNm'), 	 //운영조직 명
					operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzBrno'),  	//운영조직 사업자등록번호
					apcHldYn: SBUxMethod.get('dtl-input-apcHldYn'), 	 //apc보유여부
					operOgnzPic: SBUxMethod.get('dtl-input-operOgnzPic'), 	 //담당자
					operOgnzJbps: SBUxMethod.get('dtl-input-operOgnzJbps'),  	//담당자 직위
					operOgnzTelno: SBUxMethod.get('dtl-input-operOgnzTelno'), 	 //담당자 연락처
		        	operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzEml'),  	//담당자 이메일
		        	prsnaDataAgrdYn: SBUxMethod.get('dtl-input-prsnaDataAgrdYn')  	//동의여부
    	});


    var postVal = {
    				trgtYr: SBUxMethod.get('srch-input-trgtYr'), 	 	//대상연도
      				apcCd: SBUxMethod.get('gsb-slt-apcCd'), 	 	//apc코드
      				operOgnzCd: SBUxMethod.get('dtl-input-operOgnzCd'),  	//운영조직 코드
      				operOgnzNm: SBUxMethod.get('dtl-input-operOgnzNm'), 	 //운영조직 명
      				operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzBrno'),  	//운영조직 사업자등록번호
      				apcHldYn: SBUxMethod.get('dtl-input-apcHldYn'), 	 //apc보유여부
      				operOgnzPic: SBUxMethod.get('dtl-input-operOgnzPic'), 	 //담당자
      				operOgnzJbps: SBUxMethod.get('dtl-input-operOgnzJbps'),  	//담당자 직위
      				operOgnzTelno: SBUxMethod.get('dtl-input-operOgnzTelno'), 	 //담당자 연락처
      		       	operOgnzBrno: SBUxMethod.get('dtl-input-operOgnzEml'),  	//담당자 이메일
      		       	prsnaDataAgrdYn: SBUxMethod.get('dtl-input-prsnaDataAgrdYn')  	//동의여부
    }
	console.log(postVal);
	console.log("----------------------------");
        const data = await postJsonPromise;
	console.log(data);
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("처리 되었습니다.");
        		fn_search();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        	console.log(e);
        }

        // 결과 확인 후 재조회
        console.log("insert result", data);
    }

	/**
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (isConfirmed){

		if (!isConfirmed) return;

    	const postJsonPromise = gfn_postJSON("/fm/fclt/updateFcltOperInfoClctAgreInfo.do", {
        	trgyYr: SBUxMethod.get				('srch-input-trgtYr'), 	 	//대상연도
			apcCd: SBUxMethod.get				('gsb-slt-apcCd'), 	 	//apc코드
			operOgnzCd: SBUxMethod.get			('dtl-input-operOgnzCd'),  	//운영조직 코드
			operOgnzNm: SBUxMethod.get			('dtl-input-operOgnzNm'), 	 //운영조직 명
			operOgnzBrno: SBUxMethod.get		('dtl-input-operOgnzBrno'),  	//운영조직 사업자등록번호
			apcHldYn: SBUxMethod.get			('dtl-input-apcHldYn'), 	 //apc보유여부
			operOgnzPic: SBUxMethod.get			('dtl-input-operOgnzPic'), 	 //담당자
			operOgnzJbps: SBUxMethod.get		('dtl-input-operOgnzJbps'),  	//담당자 직위
			operOgnzTelno: SBUxMethod.get		('dtl-input-operOgnzTelno'), 	 //담당자 연락처
        	operOgnzBrno: SBUxMethod.get		('dtl-input-operOgnzEml'),  	//담당자 이메일
        	prsnaDataAgrdYn: SBUxMethod.get		('dtl-input-prsnaDataAgrdYn'),  	//동의여부
        	delYn: SBUxMethod.get				('dtl-input- delYn'),                  //삭제유무
        	sysFrstInptDt: SBUxMethod.get		('dtl-input- sysFrstInptDt'),       //시스템최초입력일시
        	sysFrstInptUserId: SBUxMethod.get	('dtl-input- sysFrstInptUserId'),      //시스템최초입력사용자id
        	sysFrstInptPrgrmId: SBUxMethod.get	('dtl-input- sysFrstInptPrgrmId'),     	//시스템최초입력프로그램id
        	sysLastChgDt: SBUxMethod.get		('dtl-input- sysLastChgDt'),      //시스템최종변경일시
        	sysLastChgUserId: SBUxMethod.get	('dtl-input- sysLastChgUserId'),   //시스템최종변경사용자id
        	sysLastChgPrgrmId: SBUxMethod.get	('dtl-input- sysLastChgPrgrmId')   //시스템최종변경프로그램id
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

    	/**
         * @type {any[]}
         */
        let list = [];

        /**
         * @type {any[]}
         */
        const rows = grdFcltOperInfoClctAgreInfoList.getGridDataAll();
        rows.forEach((row) => {
        	if (_.isEqual("Y", row.checked)) {
        		list.push({operOgnzBrno: row.operOgnzBrno});
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

 		if (!isConfirmed) return;

     	const postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltOperInfoClctAgreInfoList.do", list);

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

    //상세정보 보기 클릭 이벤트
    function fn_view() {
		console.log('====click event fn_view====');
    	var nCol = grdFcltOperInfoClctAgreInfoList.getCol();
    	console.log("nCol = "+ nCol);
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = grdFcltOperInfoClctAgreInfoList.getRow();
        console.log("nRow = "+ nRow);
		if (nRow < 1) {
            return;
		}
//클릭시 상세내역에 데이터입력
        let rowData = grdFcltOperInfoClctAgreInfoList.getRowData(nRow);
        console.log('rowData');
		console.log(rowData);

		SBUxMethod.set("dtl-input-operOgnzNm", rowData.operOgnzNm); //운영조직명
		SBUxMethod.set("dtl-input-operOgnzBrno", rowData.operOgnzBrno); //운영조직사업자번호
		SBUxMethod.set("dtl-input-apcHldYn", rowData.apcHldYn); //apc보유여부
		SBUxMethod.set("dtl-input-apcNm", rowData.apcNm); //apc명
		SBUxMethod.set("dtl-input-operOgnzPic", rowData.operOgnzPic); //담당자
		SBUxMethod.set("dtl-input-operOgnzJbps", rowData.operOgnzJbps); //담당자직위
		SBUxMethod.set("dtl-input-operOgnzTelno", rowData.operOgnzTelno); //담당자연락처
		SBUxMethod.set("dtl-input-operOgnzEml", rowData.operOgnzEml); //담당자이메일

    }


    //그리드 체크박스 전체 선택
    function fn_checkAll(obj){
        var gridList = grdFcltOperInfoClctAgreInfoList.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        for (var i=0; i<gridList.length; i++ ){
        	grdFcltOperInfoClctAgreInfoList.setCellData(i+1, 1, checkedYn, true, false);
        }
    }
</script>
</html>