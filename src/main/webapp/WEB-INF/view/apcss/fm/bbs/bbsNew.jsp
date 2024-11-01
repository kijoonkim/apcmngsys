<%
/**
 * @Class Name : bbs.jsp
 * @Description : 업무게시판 화면
 * @author SI개발부
 * @since 2023.12.12
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2024.10.29 ljw			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>

	<link href="/resource/sbux/assets/js/sbgrid/2_5/SBGrid/css/SBGrid_Simple.css" rel="stylesheet" type="text/css">
	<link href="/resource/sbux/assets/js/sbgrid/2_5/SBGrid/css/SBGrid_Simple_Default.css" rel="stylesheet" type="text/css">
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="sbt-A-wrap">
		<div class="box box-solid">
			<!--main content-->
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 공지사항 -->
				</div>
				<div style="margin-left: auto;">
					<div class="sbt-search-button" style="text-align:right;">
						<sbux-button id="btn_create" name="btn_create" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>
						<sbux-button id="btn_search" name="btn_search" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
						<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
					</div>
				</div>
			</div>
			<!--조회 영역-->
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<colgroup>
						<col style="width:10%">
						<col style="width:40%">
						<col style="width:10%">
						<col style="width:40%">
					</colgroup>
					<tr>
						<!--
						<th scope="row" class="th_bg">구분</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select class="form-control input-sm" id="srch-select-bbsSeCd" name="srch-select-bbsSeCd" uitype="single"
								jsondata-ref="jsonComBbsSeCd"
								unselected-text="전체"
								style="width:120px;"
							></sbux-select>
						</td>
						-->
						<th scope="row" class="th_bg">작성자</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-input class="form-control input-sm" id="srch-input-bbsUserNm" name="srch-input-bbsUserNm" uitype="text"
								style="width:400px"
								placeholder=""
							></sbux-input>
						</td>
						<th scope="row" class="th_bg">제목</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-input class="form-control input-sm" id="srch-input-bbsTitle" name="srch-input-bbsTitle" uitype="text"
								style="width:400px"
								placeholder=""
							></sbux-input>
						</td>
					</tr>
				</table>

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">게시판목록</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="sbt-wrap-body" >
					<div class="sbt-grid" >
						<!-- SBGrid를 호출합니다. -->
						<div id="sb-area-grdBbs" style="height:584px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- 게시글 팝업 Modal -->
	<div>
		<sbux-modal id="modal-bbsDtl" name="modal-bbsDtl" uitype="middle" header-title="공지사항" body-html-id="body-modal-bbsDtl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-bbsDtl">
		<jsp:include page="/WEB-INF/view/apcss/fm/bbs/popup/bbsDtl.jsp"></jsp:include>
	</div>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	//엔터 조회
	function fn_selectEnterKey() {
		if(window.event.keyCode == 13) {
			fn_search();
		}
	}

	// 공통코드 JSON
	//var jsonComBbsSeCd = [];	// srch.select.comMsgKnd

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			//gfn_setComCdSBSelect('srch-select-bbsSeCd', 	jsonComBbsSeCd, 	'BBS_SE_CD'), 	//게시글 구분
		]);
	}

	/* 초기세팅 */
	const fn_init = async function() {
		//await fn_initSBSelect();
		await fn_createGrid();
		await fn_search();
	}

	//grid 초기화
	var grdBbsList; // 그리드를 담기위한 객체 선언
	var jsonBbsList = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdBbs';
		SBGridProperties.id = 'grdBbsList';
		SBGridProperties.jsonref = 'jsonBbsList';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		//SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.rowheader = 'seq';
		SBGridProperties.rowheadercaption = {seq: 'No'};
		SBGridProperties.rowheaderwidth = {seq: '30'};
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
		SBGridProperties.columns = [
			{caption: ["유형"],  	ref: 'bbsSeCdNm',    type:'output',  width:'10%',    style:'text-align:center'},
			{caption: ["제목"], 	ref: 'bbsTitle',     	type:'output',  width:'60%',    style:'text-align:left'},
			{caption: ["내용"],	ref: 'bbsSbjt',        type:'output',  hidden: true},
			{caption: ["작성자"],	ref: 'sysFrstInptUserIdNm',   type:'output' ,width:'10%'  , style:'text-align:center'},
			{caption: ["작성일"],	ref: 'sysFrstInptDtYmd',   type:'output' ,width:'20%'  , style:'text-align:center'},
			{caption: ["번호"], 		ref: 'bbsNo',  		type:'output',  hidden: true},
			{caption: ["번호"], 		ref: 'bbsNo',  		type:'output',  hidden: true},
			{caption: ["최초등록자ID"],	ref: 'creUserId',   type:'output',  hidden: true},
			{caption: ["최초등록일시"],	ref: 'creDateTime', type:'output',  hidden: true},
			{caption: ["최종변경자ID"],	ref: 'updUserId',   type:'output',  hidden: true},
			{caption: ["최종변경일시"],	ref: 'updDateTime', type:'output',  hidden: true},
			{caption: ["등록프로그램"],	ref: 'creProgram',  type:'output',  hidden: true},
			{caption: ["변경프로그램"],	ref: 'updProgram',  type:'output',  hidden: true},
			{caption: ["첨부파일 수"],	ref: 'attCnt',		type:'output',  hidden: true}
		];

		grdBbsList = _SBGrid.create(SBGridProperties);
		grdBbsList.bind('click', 'fn_view');
		grdBbsList.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	//그리드 클릭이벤트
	function fn_view(){
		//grdBbsList 그리드 객체
		let nRow = grdBbsList.getRow();
		let nCol = grdBbsList.getCol();

		if(nRow > 0){
			fn_openMaodalBbsDtl(nRow);
		}
	}

	const fn_create = function() {
		popBbsDtl.init(fn_bbsDtlCallback , '1' , null);
		SBUxMethod.openModal('modal-bbsDtl');
	}

	//게시글 팝업 오픈
	function fn_openMaodalBbsDtl(nRow){
		let rowData = grdBbsList.getRowData(nRow);
		let bbsNo = rowData.bbsNo;
		if(gfn_isEmpty(rowData.bbsNo)){
			return;
		}
		let prvtPstYn = rowData.prvtPstYn;
		if(gv_userType == "00" || gv_userType == "01" || gv_userType == "02"){
			prvtPstYn = 'N';
		}
		//비공게 게시물
		if(prvtPstYn == 'Y'){
			return;
		}
		//_callbackFnc , _bbsSeCd , _bbsNo
		//공통코드 BBS_SE_CD 확인
		popBbsDtl.init(fn_bbsDtlCallback , '1' , bbsNo);
		SBUxMethod.openModal('modal-bbsDtl');
	}

	//게시글 팝업 콜백
	const fn_bbsDtlCallback = function(_refresh) {
		//게시글 재조회
		if(_refresh == "refresh"){
			fn_search();
		}
	}

	/**
     * 목록 조회
     */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdBbsList.getPageSize();
		let pageNo = 1;
		fn_setGrdBbsList(pageSize, pageNo);
	}

	/**
     *
     */
	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdBbsList.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdBbsList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_setGrdBbsList(recordCountPerPage, currentPageNo);
	}

	const fn_report = async function() {
		let bbsSeCd = SBUxMethod.get("srch-select-bbsSeCd");
		let bbsTitle = SBUxMethod.get("srch-input-bbsTitle");
		gfn_popClipReport("공지사항리스트", "pd/bbsDoc.crf", {
			bbsSeCd 	: gfn_nvl(bbsSeCd)
			, bbsTitle 	: gfn_nvl(bbsTitle)
		});
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdBbsList = async function(pageSize, pageNo) {
		// form clear
		//fn_clearForm();

		grdBbsList.clearStatus();

		//let bbsSeCd = SBUxMethod.get("srch-select-bbsSeCd");
		let bbsTitle = SBUxMethod.get("srch-input-bbsTitle");
		let bbsUserNm = SBUxMethod.get("srch-input-bbsUserNm");

		const postJsonPromise = gfn_postJSON("/fm/bbs/selectBbsList.do", {
			bbsSeCd: '1',//공지사항
			bbsTtl: bbsTitle,
			bbsUserNm: bbsUserNm,

			// pagination
			pagingYn : 'Y',
			currentPageNo : pageNo,
 			recordCountPerPage : pageSize
		});

		const data = await postJsonPromise;

		try {

			/** @type {number} **/
			let totalRecordCount = 0;

			jsonBbsList.length = 0;
			data.resultList.forEach((item, index) => {
				const msg = {
					bbsNo: item.bbsNo,
					bbsTitle: 				item.bbsTtl,
					bbsSeCd:				item.bbsSeCd,
					bbsSeCdNm:				item.bbsSeCdNm,
					bbsSbjt: 				item.bbsSbjt,
					attCnt : 				item.attCnt,
					prvtPstYn:				item.prvtPstYn,

					sysFrstInptDt:			item.sysFrstInptDt,
					sysFrstInptDtYmd:		item.sysFrstInptDtYmd,
					sysFrstInptUserId:		item.sysFrstInptUserId,
					sysFrstInptUserIdNm:	item.sysFrstInptUserIdNm,
					sysFrstInptPrgrmId:		item.sysFrstInptPrgrmId,
					sysLastChgDt:			item.sysLastChgDt,
					sysLastChgUserId:		item.sysLastChgUserId,
					sysLastChgUserIdNm:		item.sysLastChgUserIdNm,
					sysLastChgPrgrmId:		item.sysLastChgPrgrmId
				}
				jsonBbsList.push(msg);

				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonBbsList.length > 0) {
				if(grdBbsList.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdBbsList.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdBbsList.rebuild();
				}else{
					grdBbsList.refresh()
				}
			} else {
				grdBbsList.setPageTotalCount(totalRecordCount);
				grdBbsList.rebuild();
			}

			document.querySelector('#listCount').innerText = totalRecordCount;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

</script>
</body>
</html>