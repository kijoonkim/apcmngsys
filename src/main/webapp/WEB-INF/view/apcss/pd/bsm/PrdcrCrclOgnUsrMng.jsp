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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
						<!--
						<sbux-button id="btnUpdatePwFclt" name="btnUpdatePwFclt" uitype="normal" text="비밀번호 초기화(통합조직/출자출하조직 전체)" class="btn btn-sm btn-outline-danger" onclick="fn_updatePwFmList"></sbux-button>
						 -->
						<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
						<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
						<sbux-button id="btnDeleteFclt" name="btnDeleteFclt" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
						<sbux-button id="test" name="test" uitype="normal" text="사용자 변경" class="btn btn-sm btn-outline-danger" onclick="fn_userChange"></sbux-button>
					</c:if>
					<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
						<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					</c:if>
						<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-aa" name="dtl-inp-aa" uitype="hidden"></sbux-input>
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >관할기관</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-cmptncInst"
									name="srch-input-cmptncInst"
									uitype="single"
									jsondata-ref="jsonComcmptncInst"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >1차승인여부</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-userStts"
									name="srch-input-userStts"
									uitype="single"
									jsondata-ref="jsonComUserStts"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">2차승인여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-cmptncInstAprvSe"
									name="srch-input-cmptncInstAprvSe"
									uitype="single"
									jsondata-ref="jsoncmptncInstAprvSe"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">권한</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-userType"
									name="srch-input-userType"
									uitype="single"
									jsondata-ref="jsonComUserType"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">아이디</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-input
									uitype="text"
									id="srch-input-userId"
									name="srch-input-userId"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">이름</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-userNm"
									name="srch-input-userNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="3" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-brno"
									name="srch-input-brno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">법인명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-coNm"
									name="srch-input-coNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="7"></td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶사용자 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrCrclOgnUsrMng" style="height:350px; width: 100%;"></div>
				</div>
			</c:if><!-- 관리자 인경우 그리드 표시 -->
				<br>
				<table class="table table-bordered tbl_fixed">
					<caption>사용자관리 수정 화면</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 7%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >아이디</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="dtl-input-userId"
									name="dtl-input-userId"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td style="border-right: hidden;">
							<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
								<sbux-button
									id="dtl-btn-pwd"
									name="dtl-btn-pwd"
									uitype="normal"
									onclick="fn_updatePwd"
									text="비밀번호초기화"
									style="font-size: x-small;"
									class="btn btn-xs btn-outline-dark"
								></sbux-button>
							</c:if>
							</td>
							<td style="border-right: hidden;"></td>
						<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
							<th scope="row" class="th_bg" >이름</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-userNm"
									name="dtl-input-userNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" ></td>
						</c:if>
						<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
							<td colspan="6" class="td_input" style="border-right: hidden;" ></td>
						</c:if>
							<th scope="row" class="th_bg">관할기관</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-input-cmptncInst"
									name="dtl-input-cmptncInst"
									uitype="single"
									jsondata-ref="jsonComcmptncInst"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
									readonly
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" >
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>권한</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="dtl-input-userType"
									name="dtl-input-userType"
									uitype="single"
									jsondata-ref="jsonComUserDtlType"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
									readonly
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>사업자번호</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999', 'autoUnmask': true }"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>법인명</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-coNm"
									name="dtl-input-coNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
					<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
						<tr>
							<th scope="row" class="th_bg">전화번호</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-input-telno"
									name="dtl-input-telno"
									class="form-control input-sm"
									mask = "{'alias' : '999-9999-9999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">핸드폰번호</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="dtl-input-mblTelno"
									name="dtl-input-mblTelno"
									class="form-control input-sm"
									mask = "{'alias' : '999-9999-9999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td style="border-right: hidden;"></td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">1차승인여부</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-input-userStts"
									name="dtl-input-userStts"
									uitype="single"
									jsondata-ref="jsonComUserStts"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">1차승인일자</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-userAprvYmd"
									name="dtl-input-userAprvYmd"
									class="form-control input-sm"
									autocomplete="off"
									date-format="yyyy/mm/dd"
									readonly
								></sbux-input>
								 -->
								<sbux-datepicker
									uitype="popup"
									id="dtl-input-userAprvYmd"
									name="dtl-input-userAprvYmd"
									class="input-sm"
									autocomplete="off"
									readonly
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
						</tr><tr>
							<th scope="row" class="th_bg">2차승인여부</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-input-cmptncInstAprvSe"
									name="dtl-input-cmptncInstAprvSe"
									uitype="single"
									jsondata-ref="jsoncmptncInstAprvSe"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
									readonly
								></sbux-select>
								*1차승인여부가 '승인' 상태여야 2차승인여부 변경이 가능합니다.
							</td>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">2차승인일자</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<!--
								<sbux-input
									uitype="text"
									id="dtl-input-cmptncInstAprvYmd"
									name="dtl-input-cmptncInstAprvYmd"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
								 -->
								<sbux-datepicker
									uitype="popup"
									id="dtl-input-cmptncInstAprvYmd"
									name="dtl-input-cmptncInstAprvYmd"
									class="input-sm"
									autocomplete="off"
									readonly
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
						</tr>
						<tr>
							<td colspan="15" class="td_input">
								<br>
								<p style="color:red;">회원가입시 통합조직 or 출자출하조직으로 가입했을떄만 사용가능</p>
								<br>
								<sbux-button
									id="dtl-btn-changeUserType21"
									name="dtl-btn-changeUserType21"
									uitype="normal"
									onclick="fn_changeUserType(21)"
									text="통합조직으로 권한 변경"
									style="font-size: x-small;"
									class="btn btn-xs btn-outline-dark"
								></sbux-button>
								<sbux-button
									id="dtl-btn-changeUserType22"
									name="dtl-btn-changeUserType22"
									uitype="normal"
									onclick="fn_changeUserType(22)"
									text="출자출하조직으로 권한 변경"
									style="font-size: x-small;"
									class="btn btn-xs btn-outline-dark"
								></sbux-button>
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</section>

    <!-- 통합조직,출자출하조직 선택 Modal -->
    <!-- 2023 09 22 ljw 통합조직 출자출하조직 리스트 팝업 생성 -->
    <div>
        <sbux-modal
        	id="modal-invstmntSpmt"
        	name="modal-invstmntSpmt"
        	uitype="middle"
        	header-title="통합조직,출자출하조직 선택"
        	body-html-id="body-modal-invstmntSpmt"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-invstmntSpmt">
<%--     	<jsp:include page="../popup/InvstmntSpmtPopup.jsp"></jsp:include> --%>
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/InvstmntSpmtPopup.jsp"></jsp:include>
    </div>


    <!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemSelect" name="modal-itemSelect" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemSelect" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemSelect">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/ItemSelectPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

		//추후 사용자로 접속시 권한,1차승인,2차승인 수정 불가 처리
		/*
		SBUxMethod.attr("dtl-input-userType", "readonly", "true");//권한
		SBUxMethod.attr("dtl-input-userStts", "readonly", "true");//1차승인
		SBUxMethod.attr("dtl-input-cmptncInstAprvSe", "readonly", "true");//2차승인
		*/
		const elements = document.querySelectorAll(".srch-keyup-area");

		for (let i = 0; i < elements.length; i++) {
		  	const el = elements.item(i);
		  	el.addEventListener("keyup", (event) => {
		  		if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
		  			fn_search();
		  		}
		  		//key	Enter
		  		//keyCode
		  	});
		}
	})


	//승인여부
	var jsoncmptncInstAprvSe = [
		{'text': '승인','label': '승인', 'value': 'Y'},
		{'text': '미승인','label': '미승인', 'value': 'N'}
	];

	var jsonComcmptncInst = [];//관할기관
	var jsonComUserType = [];//권한
	var jsonComUserDtlType = [];//권한
	var jsonComUserGrdType = [];//권한
	var jsonComUserStts = [];//1차승인

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-input-userType', 	jsonComUserType, 		'USER_TYPE'),	// 권한
			gfn_setComCdSBSelect('grdPrdcrCrclOgnUsrMng', 	jsonComUserGrdType, 	'USER_TYPE'),	// 권한
			gfn_setComCdSBSelect('dtl-input-userType', 		jsonComUserDtlType, 	'USER_TYPE_1'),	// 권한

			gfn_setComCdSBSelect('srch-input-userStts', 	jsonComUserStts, 	'USER_STTS'),	// 1차승인
			gfn_setComCdSBSelect('dtl-input-userStts', 		jsonComUserStts, 	'USER_STTS'),	// 1차승인
		 	gfn_setComCdSBSelect('srch-input-cmptncInst', 	jsonComcmptncInst, 	'CMPTNC_INST'), //관할기관
		 	gfn_setComCdSBSelect('dtl-input-cmptncInst', 	jsonComcmptncInst, 	'CMPTNC_INST'), //관할기관
		]);
	}


	//설비 등록
	var jsonPrdcrCrclOgnUsrMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrCrclOgnUsrMng;


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		await fn_initSBSelect();
		await fn_search();
		//SBUxMethod.attr("dtl-input-userType", "readonly", "false");//권한
		//SBUxMethod.attr("dtl-input-coNm", "readonly", "false");//법인명
		//SBUxMethod.attr("dtl-input-cmptncInst", "readonly", "false");//관할기관
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		await fn_initSBSelect();
		await fn_dtlSearch();
	</c:if>
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrCrclOgnUsrMng';
	    SBGridProperties.id = 'grdPrdcrCrclOgnUsrMng';
	    SBGridProperties.jsonref = 'jsonPrdcrCrclOgnUsrMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.allowcopy = true;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
	    SBGridProperties.columns = [
	    	{caption: ["아이디"], 	ref: 'userId',   	type:'output',  width:'200px',    style:'text-align:center'},
	    	//{caption: ["이름"], 		ref: 'userNm',   	type:'output',  width:'200px',    style:'text-align:center'},
	    	{caption: ["법인명"], 	ref: 'coNm',   	type:'output',  width:'200px',    style:'text-align:center'},
	    	{caption: ["관할기관"], 	ref: 'cmptncInst',   	type:'combo',  width:'200px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComcmptncInst', label:'label', value:'value', displayui : false}},
	    	{caption: ["1차승인"], 	ref: 'userStts',   	type:'combo',  width:'200px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComUserStts', label:'label', value:'value', displayui : false}},
	    	{caption: ["2차승인"], 	ref: 'cmptncInstAprvSe',   	type:'combo',  width:'200px',    style:'text-align:center', disabled:true
			    ,typeinfo : {ref:'jsoncmptncInstAprvSe', label:'label', value:'value', displayui : false}},
	    	{caption: ["권한"], 		ref: 'userType',   	type:'combo',  width:'200px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComUserGrdType', label:'label', value:'value', displayui : false}},
	    	{caption: ["사업자번호"], 	ref: 'brno',   	type:'output',  width:'200px',    style:'text-align:center'},
	    	{caption: ["비고"], 		ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'},

	    	{caption: ["전화번호"], 	ref: 'telno',   			hidden : true},
	    	{caption: ["이름"], 		ref: 'userNm',   			hidden : true},
	    	{caption: ["핸드폰번호"], 	ref: 'mblTelno',   			hidden : true},
	    	{caption: ["2차승인일"], 	ref: 'cmptncInstAprvYmd',   hidden : false},
	    	{caption: ["1차승인일"], 	ref: 'userAprvYmd',   		hidden : false}
	    ];

	    grdPrdcrCrclOgnUsrMng = _SBGrid.create(SBGridProperties);

	    grdPrdcrCrclOgnUsrMng.bind('click','fn_view');
	    grdPrdcrCrclOgnUsrMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	/**
     * 목록 조회
     */
    const fn_search = async function() {
    	// set pagination
    	let pageSize = grdPrdcrCrclOgnUsrMng.getPageSize();
    	let pageNo = 1;
    	fn_clearForm();
    	fn_setGrdFcltList(pageSize, pageNo);
    }

	const fn_pagingBbsList = async function() {
    	let recordCountPerPage = grdPrdcrCrclOgnUsrMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPrdcrCrclOgnUsrMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltList(recordCountPerPage, currentPageNo);
    }
	
	//출력
	const fn_report = async function() {
		let cmptncInst = SBUxMethod.get("srch-input-cmptncInst");//관할기관
		let userStts = SBUxMethod.get("srch-input-userStts");//1차승인여부
		let cmptncInstAprvSe = SBUxMethod.get("srch-input-cmptncInstAprvSe");//2차승인여부
		let userType = SBUxMethod.get("srch-input-userType");//권한
		let userId = SBUxMethod.get("srch-input-userId");//아이디
		let userNm = SBUxMethod.get("srch-input-userNm");//이름
		let brno = SBUxMethod.get("srch-input-brno");//사업자번호
		let coNm = SBUxMethod.get("srch-input-coNm");//법인명


		gfn_popClipReport("사용자 리스트", "pd/userListDoc.crf", {cmptncInst : cmptncInst, userStts : userStts, cmptncInstAprvSe : cmptncInstAprvSe,
										userType : userType, userId : userId, userNm : userNm, brno : brno, coNm : coNm});
	}
	
	/* Grid Row 조회 기능*/
	//const fn_searchFcltList = async function(){
	const fn_setGrdFcltList = async function(pageSize, pageNo){

		let cmptncInst = SBUxMethod.get("srch-input-cmptncInst");//관할기관
		let userStts = SBUxMethod.get("srch-input-userStts");//1차승인여부
		let cmptncInstAprvSe = SBUxMethod.get("srch-input-cmptncInstAprvSe");//2차승인여부
		let userType = SBUxMethod.get("srch-input-userType");//권한
		let userId = SBUxMethod.get("srch-input-userId");//아이디
		let userNm = SBUxMethod.get("srch-input-userNm");//이름
		let brno = SBUxMethod.get("srch-input-brno");//사업자번호
		let coNm = SBUxMethod.get("srch-input-coNm");//법인명

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnUsrMngList.do", {
    		cmptncInst : cmptncInst
    		,userStts : userStts
    		,cmptncInstAprvSe : cmptncInstAprvSe
    		,userType : userType
    		,userId : userId
    		,userNm : userNm
    		,brno : brno
    		,coNm : coNm

    		//페이징
    		,pagingYn : 'Y'
    		,currentPageNo : pageNo
     		,recordCountPerPage : pageSize
		});
        let data = await postJsonPromise;
        try{
        	jsonPrdcrCrclOgnUsrMng.length = 0;
        	let totalRecordCount = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		//console.log(item.cmptncInst);
				let PrdcrCrclOgnUsrMngVO = {
					userId 		: item.userId
				  , userNm 		: item.userNm
				  , userType 	: item.userType
				  , userStts 	: item.userStts
				  , userAprvYmd : item.userAprvYmd
				  , telno 		: item.telno
				  , brno 		: item.brno
				  , mblTelno 	: item.mblTelno
				  , coNm 		: item.coNm
				  , cmptncInstAprvSe 	: item.cmptncInstAprvSe
				  , cmptncInstAprvYmd : item.cmptncInstAprvYmd

				  , cmptncInst 	: item.cmptncInst
				}
				jsonPrdcrCrclOgnUsrMng.push(PrdcrCrclOgnUsrMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonPrdcrCrclOgnUsrMng.length > 0) {

        		if(grdPrdcrCrclOgnUsrMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdPrdcrCrclOgnUsrMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdPrdcrCrclOgnUsrMng.rebuild();
				}else{
					grdPrdcrCrclOgnUsrMng.refresh()
				}
        	} else {
        		grdPrdcrCrclOgnUsrMng.setPageTotalCount(totalRecordCount);
        		grdPrdcrCrclOgnUsrMng.rebuild();
        	}
        	document.querySelector('#listCount').innerText = totalRecordCount;

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	//관리자가 아닌 경우 조회
	const fn_dtlSearch = async function(){
		let userId = '${loginVO.userId}';//아이디

		if(gfn_isEmpty(userId)) return;

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectPrdcrCrclOgnUsrMngList.do", {
			userId : userId
		});
        let data = await postJsonPromise;
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				SBUxMethod.set("dtl-input-userId", item.userId);  //  아이디
				SBUxMethod.set("dtl-input-userNm", item.userNm);  //  이름
				SBUxMethod.set("dtl-input-userType", item.userType);  //  권한
				SBUxMethod.set("dtl-input-userStts", item.userStts);  //  1차승인
				SBUxMethod.set("dtl-input-telno", item.telno);  //  전화번호
				SBUxMethod.set("dtl-input-brno", item.brno);  //  사업자번호
				SBUxMethod.set("dtl-input-mblTelno", item.mblTelno);  //  휴대폰번호
				SBUxMethod.set("dtl-input-cmptncInstAprvYmd", item.cmptncInstAprvYmd);  //  관할기관승인일
				SBUxMethod.set("dtl-input-userAprvYmd", item.userAprvYmd);  //  사용자승인일
				SBUxMethod.set("dtl-input-coNm", item.coNm);  //  법인명
				SBUxMethod.set("dtl-input-cmptncInstAprvSe", item.cmptncInstAprvSe);  //  2차승인
				SBUxMethod.set("dtl-input-cmptncInst", item.cmptncInst);  //  관할기관
				if(item.userStts == '01'){
					SBUxMethod.attr("dtl-input-cmptncInstAprvSe", "readonly", "false");
				}else{
					SBUxMethod.attr("dtl-input-cmptncInstAprvSe", "readonly", "true");
				}
			});

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_clearForm = function() {

		SBUxMethod.set("dtl-input-userId",null);
		SBUxMethod.set("dtl-input-userNm",null);
		SBUxMethod.set("dtl-input-userType",null);
		SBUxMethod.set("dtl-input-userStts",null);
		SBUxMethod.set("dtl-input-telno",null);
		SBUxMethod.set("dtl-input-brno",null);
		SBUxMethod.set("dtl-input-mblTelno",null);
		SBUxMethod.set("dtl-input-cmptncInstAprvYmd",null);
		SBUxMethod.set("dtl-input-coNm",null);
		SBUxMethod.set("dtl-input-cmptncInstAprvSe",null);
		SBUxMethod.set("dtl-input-userAprvYmd",null);
		SBUxMethod.set("dtl-input-cmptncInst",null);
		SBUxMethod.attr("dtl-input-cmptncInstAprvSe", "readonly", "true");
	}



	//포털에서 가입하고 넘어오기에 update 만 필요함
	//저장
	const fn_saveFmList = async function (){
		console.log("******************fn_saveFmList**********************************");

		if(!fn_checkRequiredInput()){
			return;
		}


		if (!confirm("저장 하시겠습니까?")) return;

		const postJsonPromise = gfn_postJSON("/pd/bsm/updatePrdcrCrclOgnUsrMng.do", {
			 userId : SBUxMethod.get("dtl-input-userId")//아이디
			,userType : SBUxMethod.get("dtl-input-userType")//권한
			,brno : SBUxMethod.get("dtl-input-brno")//사업자번호
			,coNm : SBUxMethod.get("dtl-input-coNm")//법인명
			,telno : SBUxMethod.get("dtl-input-telno")//전화번호
			,mblTelno : SBUxMethod.get("dtl-input-mblTelno")//휴대폰번호
			,cmptncInst : SBUxMethod.get("dtl-input-cmptncInst")//관할기관
			,userStts : SBUxMethod.get("dtl-input-userStts")//1차승인
			,cmptncInstAprvSe : SBUxMethod.get("dtl-input-cmptncInstAprvSe")//2차승인
			//,cmptncInstAprvYmd : SBUxMethod.get("dtl-input-cmptncInstAprvYmd")//2차승인일
			//,userAprvYmd : SBUxMethod.get("dtl-input-userAprvYmd")//사용자승인일
		});

		const data = await postJsonPromise;
		console.log("update result", data);

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				fn_search();
			</c:if>
			<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
				fn_dtlSearch();
			</c:if>
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {

		}
  	}

	//레드닷 처리한 필수값들 확인
	function fn_checkRequiredInput(){
		console.log("============fn_checkRequiredInput==============");

		//관할기관 필수로 할필요 없음
		/*
		let cmptncInst = SBUxMethod.get("dtl-input-cmptncInst");
		if(gfn_isEmpty(cmptncInst)){
			gfn_comAlert("W0002", "관할기관");
			return false;
		}
		*/
    	let userType = SBUxMethod.get("dtl-input-userType");
		if(gfn_isEmpty(userType)){
			gfn_comAlert("W0002", "권한");
			return false;
		}
		let brno = SBUxMethod.get("dtl-input-brno");
		if(gfn_isEmpty(brno)){
			gfn_comAlert("W0002", "사업자번호");
			return false;
		}
		let coNm = SBUxMethod.get("dtl-input-coNm");
		if(gfn_isEmpty(coNm)){
			gfn_comAlert("W0002", "법인명");
			return false;
		}
    	return true;
    }



	//상세정보 보기 클릭이벤트
	function fn_view() {
		console.log("******************fn_view**********************************");
		var nCol = grdPrdcrCrclOgnUsrMng.getCol();
		//특정 열 부터 이벤트 적용
		if (nCol < 0) {
			return;
		}
		var nRow = grdPrdcrCrclOgnUsrMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdPrdcrCrclOgnUsrMng.getRowData(nRow);
		//console.log(rowData.userStts);
		SBUxMethod.set("dtl-input-userId", gfn_nvl(rowData.userId));  //  아이디
		SBUxMethod.set("dtl-input-userNm", gfn_nvl(rowData.userNm));  //  이름
		SBUxMethod.set("dtl-input-userType", gfn_nvl(rowData.userType));  //  권한
		SBUxMethod.set("dtl-input-userStts", gfn_nvl(rowData.userStts));  //  1차승인
		SBUxMethod.set("dtl-input-telno", gfn_nvl(rowData.telno));  //  전화번호
		SBUxMethod.set("dtl-input-brno", gfn_nvl(rowData.brno));  //  사업자번호
		SBUxMethod.set("dtl-input-mblTelno", gfn_nvl(rowData.mblTelno));  //  휴대폰번호
		SBUxMethod.set("dtl-input-cmptncInstAprvYmd", gfn_nvl(rowData.cmptncInstAprvYmd));  //  관할기관승인일
		SBUxMethod.set("dtl-input-userAprvYmd", gfn_nvl(rowData.userAprvYmd));  //  사용자승인일
		SBUxMethod.set("dtl-input-coNm", gfn_nvl(rowData.coNm));  //  법인명
		if(rowData.userStts == '01'){
			SBUxMethod.set("dtl-input-cmptncInstAprvSe", gfn_nvl(rowData.cmptncInstAprvSe));  //  2차승인
			SBUxMethod.attr("dtl-input-cmptncInstAprvSe", "readonly", "false");
		}else{
			SBUxMethod.attr("dtl-input-cmptncInstAprvSe", "readonly", "true");
		}
		SBUxMethod.set("dtl-input-cmptncInst", gfn_nvl(rowData.cmptncInst));  //  관할기관
	}

	 /*
	  * 비밀번호 초기화 업데이트
	  * 2023-11-03
	  * ysh
	  */
	async function fn_updatePwd(){
		console.log("========fn_updatePwd================");
		var userId = SBUxMethod.get("dtl-input-userId");
		if(gfn_isEmpty(userId)) return;

		if (!confirm("비밀번호 초기화 하시겠습니까?\n초기화시 아이디로 비밀번호가 변경됩니다.")) return;

		let postJsonPromise = gfn_postJSON("/co/user/updComUserPwd.do", {
			userId : userId
		});
        let data = await postJsonPromise;
        try{
        	if(data.updatedCnt > 0){
        		alert("비밀번호가 초기화 되었습니다.");
        	}else{
        		alert("비밀번호 초기화 오류가 발생 되었습니다.");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	 /*
	  * 비밀번호 통합조직, 출자출하조직, 전체 초기화 업데이트
	  * 2023-11-03
	  * ysh
	  */
	async function fn_updatePwFmList(){
		console.log("========fn_updatePwd================");
		var userId = SBUxMethod.get("dtl-input-userId");
		var userIdTest = "all";
		//if(gfn_isEmpty(userId)) return;

		if (!confirm("전체 사용자의 비밀번호를 초기화 하시겠습니까?")) return;

		let postJsonPromise = gfn_postJSON("/pd/user/updAllComUserPwd.do", {
			userIdTest : userIdTest
		});
       let data = await postJsonPromise;
       try{
       	if(data.updatedCnt > 0){
       		alert("전체 사용자("+data.updatedCnt+"건)의 비밀번호가 초기화 되었습니다.");
       	}else{
       		alert("비밀번호 초기화 오류가 발생 되었습니다.");
       	}
       } catch (e) {
   		if (!(e instanceof Error)) {
   			e = new Error(e);
   		}
   		console.error("failed", e.message);
       	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	async function fn_delete(){
		let userId = SBUxMethod.get("dtl-input-userId");
		if(gfn_isEmpty(userId)) return;

		if (!confirm("선택된 유저를 삭제 하시겠습니까?")) return;

		let postJsonPromise = gfn_postJSON("/pd/bsm/deleteUser.do", {
			userId : userId
		});
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        		fn_search();
        	}else{
        		alert("삭제 도중 오류가 발생 되었습니다.");
        	}
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}

	async function fn_userChange(){
		let userId = SBUxMethod.get("dtl-input-userId");
		//아이디 필수
		if(gfn_isEmpty(userId)) return;
		let brno = SBUxMethod.get("dtl-input-brno");
		let userType = SBUxMethod.get("dtl-input-userType");
		//통합,출자출하 조직만 가능하게 설정
		if(userType != '21' && userType != '22'){
			alert('통합조직 or 출자출하조직인 경우만 가능합니다');
			return;
		}
		if (!confirm("선택된 유저로 접속하시겠습니까?")) return;

		let postJsonPromise = gfn_postJSON("/userChange.do", {
			userId : userId
			,brno : brno
			,userType : userType
		});
        let data = await postJsonPromise;

        try{
        	console.log(data);
        	//iframe 부모요소에 접근해야 전체 새로고침 가능
        	window.parent.document.location.reload();
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}
	//통합조직 출자출하조직으로 권한 변경
	async function fn_changeUserType(_userType){
		//아이디 필수
		let userId = SBUxMethod.get("dtl-input-userId");
		if(gfn_isEmpty(userId)) return;

		let brno = SBUxMethod.get("dtl-input-brno");
		let userType = SBUxMethod.get("dtl-input-userType");

		if ( !(userType == '21' || userType == '22') ) {
			alert('통합조직 또는 출자출하조직 권한 인 경우만 가능합니다');
			return false;
		}

		let authrtId;
		let apoSe;

		if(_userType == '21'){
			userType = _userType;
			authrtId = '0000_996';
			apoSe = '1'
		}else if (_userType == '22') {
			userType = _userType;
			authrtId = '0000_997';
			apoSe = '2'
		}else{
			return false;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/changeUserType.do", {
			userId : userId
			,brno : brno
			,userType : userType
			,authrtId : authrtId
			,apoSe : apoSe
		});
        let data = await postJsonPromise;

        try{
        	console.log(data);
        	fn_search();
        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

</script>
</html>
