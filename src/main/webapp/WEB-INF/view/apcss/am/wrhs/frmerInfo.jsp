
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
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 영농관리 -->
				</div>
				<div style="margin-left: auto;">
                    <sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
					></sbux-button>
                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
    								autocomplete-height="270px"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th class="ta_r th_bg">품목</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">
					<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
					</sbux-tabs>
					<div class="tab-content">
						<div id="frmerInfoTab" >
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>농가 기본정보</span>
									</li>
								</ul>
							</div>
							<div>
								<table class="table table-bordered tbl_fixed">
									<caption>일반현황</caption>
									<colgroup>
										<col style="width:20%">
										<col style="width:15%">
										<col style="width:15%">
										<col style="width:20%">
										<col style="width:30%">
									</colgroup>
									<tbody>
										<tr>
											<th class="ta_r th_bg">농가명</th>
											<td class="td_input" style="border-right: hidden;">
												<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
												<sbux-input
													uitype="text"
													id="dtl-inp-prdcrNm"
													name="dtl-inp-prdcrNm"
													class="form-control input-sm"
													placeholder="초성검색 가능"
													autocomplete-ref="jsonPrdcrAutocompleteDtl"
													autocomplete-text="name"
				    								oninput="fn_onInputPrdcrNmDtl(event)"
				    								autocomplete-select-callback="fn_onSelectPrdcrNmDtl"
				    								autocomplete-height="270px"

				   								></sbux-input>
											</td>
											<td class="td_input" style="border-right: hidden;">
												<sbux-button
													id="btnDtlPrdcr"
													name="btnDtlPrdcr"
													class="btn btn-xs btn-outline-dark"
													text="찾기"
													uitype="modal"
													target-id="modal-prdcr"
													onclick="fn_choicePrdcrDtl"
												></sbux-button>
											</td>
											<th scope="row" class="th_bg" >농가번호</th>
											<td>
												<sbux-input id="dtl-inp-frmerno" name="dtl-inp-frmerno" class="form-control input-sm" uitype="text" readonly></sbux-input>
												<sbux-input id="dtl-inp-prdcrLinkCd" name="dtl-inp-prdcrLinkCd" class="form-control input-sm" uitype="hidden"></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg" >연락처</th>
											<td colspan="2">
												<sbux-input
													id="dtl-inp-frmhsTelno"
													name="dtl-inp-frmhsTelno"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'mask': '999-9999-9999', 'clearIncomplete': true, 'autoUnmask': true }"
												></sbux-input>
											</td>
											<th scope="row" class="th_bg" >지역</th>
											<td>
												<sbux-select
													id="dtl-slt-ctpv"
													name="dtl-slt-frmhsCtpv"
													uitype="single"
													jsondata-ref="jsonCtpv"
													unselected-text="선택"
													class="form-control input-sm"
												></sbux-select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg" >상세주소</th>
											<td colspan="2">
												<sbux-input id="dtl-inp-frmhsAddr" name="dtl-inp-frmhsAddr" class="form-control input-sm" uitype="text" ></sbux-input>
											</td>
											<th scope="row" class="th_bg" >계약면적(평)</th>
											<td>
												<sbux-input
													id="dtl-inp-plntngArea"
													name="dtl-inp-plntngArea"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg" >계약면적(m2)</th>
											<td colspan="2">
												<sbux-input
													id="dtl-inp-squareFootage"
													name="dtl-inp-squareFootage"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
													readonly
												></sbux-input>
											</td>
											<th scope="row" class="th_bg" >정식면적(평)</th>
											<td>
												<sbux-input
													id="dtl-inp-crtrArea"
													name="dtl-inp-crtrArea"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												></sbux-input>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_bg" >수매량(망)</th>
											<td colspan="2">
												<sbux-input
													id="dtl-inp-prchsQntt"
													name="dtl-inp-prchsQntt"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												></sbux-input>
											</td>
											<th scope="row" class="th_bg" >수매금액(원)</th>
											<td>
												<sbux-input
													id="dtl-inp-prchsAmt"
													name="dtl-inp-prchsAmt"
													class="form-control input-sm"
													uitype="text"
													mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												></sbux-input>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>재배 기본정보</span>
									</li>
								</ul>
							</div>
							<div id="sb-area-cltvtnBscInfo" style="height:90px;"></div>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li>
										<span>재배 이력</span>
									</li>
								</ul>
							</div>
							<div id="sb-area-cltvtnHstry" style="height:114px;"></div>
						</div>
						<div id="frmhsQltTab" >
							<div id="sb-area-cltvtnFrmhsQlt" style="height:500px;"></div>
						</div>
						<div id="frmhsExpctWrhsTab" >
							<div id="sb-area-frmhsExpctWrhs" style="height:500px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
	<div>
		<sbux-modal
			id="modal-framldMap"
			name="modal-framldMap"
			uitype="middle"
			header-title="팜맵 데이터"
			body-html-id="body-modal-framldMap"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1100px"
		></sbux-modal>
	</div>
	<!-- 팜맵 팝업 Modal -->
	<div id="body-modal-framldMap">
		<jsp:include page="../popup/framldMapPopup.jsp"/>
	</div>
	<div>
		<sbux-modal
			id="modal-image"
			name="modal-image"
			uitype="middle"
			header-title="사진"
			body-html-id="body-modal-image"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1100px"
		></sbux-modal>
	</div>
	<div id="body-modal-image">
    	<jsp:include page="../../am/popup/imagePopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">


	var jsonPrdcr					= [];
	var jsonPrdcrDtl				= [];
	var jsonPrdcrAutocomplete 		= [];
	var jsonPrdcrAutocompleteDtl 	= [];
	var jsonApcItem					= [];
	var jsonCtpv					= [];
	var jsonGrdPrdcr				= [];
	var jsonGrdSdngStts				= [];
	var jsonGrdPlntngStts			= [];
	var jsonGrdMeshSe				= [];
	var jsonGrdHdofcExtrnlSe		= [];
	var jsonGrdExtrnlWarehouseSe	= [];
	var jsonGrdLastStrgSe			= [];
	var jsonGrdPrchsCmptnYn			= [];

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();

	})

	const fn_init = async function() {

    	fn_getPrdcrs();
    	fn_createCltvtnBscInfo();
    	fn_createCltvtnHstry();
    	fn_createCltvtnFrmhsQlt();
    	fn_frmhsExpctWrhs();

		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 				gv_selectedApcCd),		// 품목
			gfn_setComCdSBSelect('dtl-slt-frmhsCtpv', 	jsonCtpv,  					'CTPV'),				// 지역
			gfn_setPrdcrSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdPrdcr, 				gv_selectedApcCd),		// Grid 생산자
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdSdngStts,  			'SDNG_STTS_CD'),		// 파종상태
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdPlntngStts, 			'PLNTNG_STTS_CD'),		// 정식상태
			gfn_setComCdSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdMeshSe, 				'MESH_SE_CD'),			// 망사구분
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdHdofcExtrnlSe, 		'HDOFC_EXTRNL_SE_CD'),	// 본사/외부구분코드
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdExtrnlWarehouseSe, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 외부창고코드
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdLastStrgSe, 			'LAST_STRG_SE_CD'),		// 최종저장구분
			gfn_setComCdSBSelect('grdFrmhsExpctWrhs', 	jsonGrdPrchsCmptnYn, 		'CLCTM_YN'),			// 수매완료여부
    	])

    	grdFrmhsExpctWrhs.refresh({"combo":true})

    	if (jsonApcItem.length == 1) {
    		let itemCd = jsonApcItem[0].itemCd;
    		SBUxMethod.set("srch-slt-itemCd", itemCd);
    	}

	}

	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "영농일지", 	"targetid" : "frmerInfoTab", 		"targetvalue" : "영농일지" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "재배농가품질", "targetid" : "frmhsQltTab", 		"targetvalue" : "재배농가품질" },
		{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "농가예상입고", "targetid" : "frmhsExpctWrhsTab", 	"targetvalue" : "농가예상입고" }
	];

	var grdCltvtnBscInfo;
	var grdCltvtnHstry;
	var grdCltvtnFrmhsQlt;
	var grdFrmhsExpctWrhs;
	var jsonCltvtnBscInfo 	= [];
	var jsonCltvtnHstry 	= [];
	var jsonCltvtnFrmhsQlt 	= [];
	var jsonFrmhsExpctWrhs 	= [];


	const fn_createCltvtnBscInfo = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnBscInfo";
	    SBGridProperties.id = "grdCltvtnBscInfo";
	    SBGridProperties.jsonref = "jsonCltvtnBscInfo";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
		    {caption : ['품종(캔)', 	"뉴마르스"], 	ref: 'sdQntt1', 	type: 'input', 	width: '100px', style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"카타마루"], 	ref: 'sdQntt2', 	type: 'input', 	width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"홈스타"], 		ref: 'sdQntt3', 	type: 'input', 	width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"페가수스"], 	ref: 'sdQntt4', 	type: 'input', 	width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', 	"찬스볼"], 		ref: 'sdQntt5', 	type: 'input', 	width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['밑비료', 		"밑비료"], 		ref: 'lwptFrtlzr', 		type: 'input', 	width: '100px', style: 'text-align:center'},
		    {caption : ['파종일자', 	"파종일자"], 	ref: 'sdngYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center',
		    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['정식일자', 	"정식일자"], 	ref: 'clclnYmd', 		type : 'datepicker', 	width: '100px', style:'text-align:center',
			    format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['추비일자', 	"1차"], 		ref: 'cmptYmdCycl1', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['추비일자', 	"2차"], 		ref: 'cmptYmdCycl2', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['저장결과<br>(부패율)', "저장결과<br>(부패율)"], 	ref: 'strgRslt', 	type: 'input', 	width: '80px', style:'text-align: right',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###.###'}},
        	{caption : ['비고', '비고'], 			ref: 'rmrk', 			type: 'input', 	width: '200px', style: 'text-align:center'},
	    ];
	    grdCltvtnBscInfo = _SBGrid.create(SBGridProperties);
	}

	const fn_createCltvtnHstry = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnHstry";
	    SBGridProperties.id = "grdCltvtnHstry";
	    SBGridProperties.jsonref = "jsonCltvtnHstry";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [

	    	{caption : ["처리"], 	ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowHstry(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowHstry(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	    	{caption : ['위치'], 	ref: 'frlnAddr', 	type: 'output', 	width: '300px', style: 'text-align:center'},
	    	{caption : ['법정동'], 	ref: 'stdgCd', 		type: 'output', 	width: '80px', style: 'text-align:center'},
	    	{caption : ['본번'], 	ref: 'frlnMno', 	type: 'output', 	width: '80px', style: 'text-align:center'},
	    	{caption : ['부번'], 	ref: 'frlnSno', 	type: 'output', 	width: '80px', style: 'text-align:center'},
        	{caption : ['지도'], 	ref: 'map', 		type: 'button', 	width: '60px', style: 'text-align:center',
        		typeinfo : {buttonvalue: '보기', buttonclass:'btn btn-xs btn-outline-danger'}},
        	{caption : ['내용'], 	ref: 'cn', 			type: 'input', 		width: '300px', style: 'text-align:center'},
        	{caption : ['사진'], 	ref: 'atchflNo',	type: 'button', 	width: '60px', style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if (strValue== null || strValue == "") {
			        return "";
	        	} else {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_imagePop("+ nRow +")'>지도</button>";
	        	}
        	}},
        	{caption : ['사진첨부'], ref: 'cltvtnHstryNo',	type: 'button', 	width: '60px', style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if (strValue== null || strValue == "") {
	        		return "";
	        	} else {
	        		let rowData = grdCltvtnHstry.getRowData(nRow);
	        		let atchflNo = rowData.atchflNo;
	        		if (!gfn_isEmpty(atchflNo)) {
	        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_fileUpload("+ nRow +")'>변경</button>"
		        		+ "<input type='file' id='inp-file-" + nRow + "' style='display:none' onchange='fn_fileSelect(event)' accept='.jpg, .jpeg, .png'></input>";
	        		} else {
	        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_fileUpload("+ nRow +")'>등록</button>"
		        		+ "<input type='file' id='inp-file-" + nRow + "' style='display:none' onchange='fn_fileSelect(event)' accept='.jpg, .jpeg, .png'></input>";
	        		}
	        	}
        	}},
        	{caption : ['사진명'], 		ref: 'fileName', 	type: 'input', hidden : true, 	width: '100px', style: 'text-align:left'},
        	{caption : ['쓰기여부'], 	ref: 'inputFlag', 	type: 'input', hidden : true, 	width: '100px', style: 'text-align:left'},
        	{caption : ['비고'], 		ref: 'rmrk', 		type: 'input', 		width: '200px', style: 'text-align:center'},
	    ];
	    grdCltvtnHstry = _SBGrid.create(SBGridProperties);
	    grdCltvtnHstry.bind('click', 'fn_setFrlnInput');
	}

	const fn_createCltvtnFrmhsQlt = function () {
		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-cltvtnFrmhsQlt";
	    SBGridProperties.id = "grdCltvtnFrmhsQlt";
	    SBGridProperties.jsonref = "jsonCltvtnFrmhsQlt";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [

	    	{caption : ["처리", "처리"], 	ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowQlt(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowQlt(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ['농가명', 	'농가명'], 		ref: 'prdcrCd', 	type: 'inputcombo', 	width: '200px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdPrdcr', 		label:'label', value:'value', itemcount: 10}},
		    {caption : ['지역', 	'지역'], 		ref: 'frmhsCtpvNm', type: 'output', 	width: '100px', style: 'text-align:center'},
		    {caption : ['상세주소', '상세주소'], 	ref: 'frmhsAddr', 	type: 'output', 	width: '300px', style: 'text-align:center'},
		    {caption : ['연락처', 	'연락처'], 		ref: 'frmhsTelno', 	type: 'output', 	width: '100px', style: 'text-align:center',
		    	format : {type:'string', rule:'000-0000-0000'}},
		    {caption : ['품종(캔)', '뉴마르스'], 	ref: 'sdQntt1', 	type: 'input', 		width: '80px', 	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '카타마루'], 	ref: 'sdQntt2', 	type: 'input', 		width: '80px',  style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '홈스타'], 		ref: 'sdQntt3', 	type: 'input', 		width: '80px',  style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '페가수스'], 	ref: 'sdQntt4', 	type: 'input', 		width: '80px',  style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['품종(캔)', '찬스볼'], 		ref: 'sdQntt5', 	type: 'input', 		width: '80px',  style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['필지(평)', '계약'], 		ref: 'ctrtPrcl', 	type: 'input', 		width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['필지(평)', '정식'], 		ref: 'plntngPrcl', 	type: 'input', 		width: '100px', style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		    {caption : ['파종', 	'일자'], 		ref: 'sdngYmd', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
		    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['파종', 	'상태'], 		ref: 'sdngSttsCd', 	type: 'combo', 	width: '100px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdSdngStts', 	label:'label', value:'value', itemcount: 10}},
		    {caption : ['정식', 	'일자'], 		ref: 'plntngYmd', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
			    format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['정식', 	'상태'], 		ref: 'plntngSttsCd', 	type: 'combo', 	width: '100px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdPlntngStts', label:'label', value:'value', itemcount: 10}},
			{caption : ['추비일자', '1차'], 		ref: 'cmptYmdCycl1', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
		    {caption : ['추비일자', '2차'], 		ref: 'cmptYmdCycl2', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
			{caption : ['예상망', 	'예상망'], 		ref: 'expctNet', 	type: 'input', 		width: '100px', style:'text-align: right',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['품질평가', '품질평가'], 	ref: 'qltEvl', 		type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['작년<br>평균망', '작년<br>평균망'], ref: 'lastYrEvl', 	type: 'input', 	width: '100px', style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['변동갭', '변동갭'], 		ref: 'flctnDfrnc', 	type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['무선별', '무선별'], 		ref: 'emptSort', 	type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['망사구분', '망사구분'], 	ref: 'meshSeCd', 	type: 'combo', 	width: '100px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdMeshSe', 	label:'label', value:'value', itemcount: 10}},
			{caption : ['저장구분 예상망', '단가 C'], 	ref: 'strm', 	type: 'input', 		width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['저장구분 예상망', '중기 B'], 	ref: 'tmidlTerm', 	type: 'input', 	width: '80px', style:'text-align: right',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['저장구분 예상망', '장기 A'], 	ref: 'ltrm', 	type: 'input', 		width: '80px', style:'text-align: right',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['저장구분 예상망', '차이'], 	ref: 'dfrnc', 	type: 'input', 		width: '80px', style:'text-align: right',
	            typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['토양 및 퇴비', '토양'], 	ref: 'soil', 		type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['토양 및 퇴비', '퇴비'], 	ref: 'cmpt', 		type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['토양 및 퇴비', '기타'], 	ref: 'etc', 		type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['병충해', 	'노균병'], 		ref: 'pestYn1', 	type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['병충해', 	'균핵병'], 		ref: 'pestYn2', 	type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['병충해', 	'습해'], 		ref: 'pestYn3', 	type: 'input', 		width: '100px', style: 'text-align:center'},
			{caption : ['담당자', 	'담당자'], 		ref: 'pic', 		type: 'input', 		width: '100px', style: 'text-align:center'},
        	{caption : ['생육 특이사항', '생육 특이사항'], 	ref: 'grdpExcptnMttr', 	type: 'input', 	width: '200px', style: 'text-align:center'},
        	{caption : ['저장 특이사항', '저장 특이사항'], 	ref: 'strgExcptnMttr', 	type: 'input', 	width: '200px', style: 'text-align:center'},
	    ];
	    grdCltvtnFrmhsQlt = _SBGrid.create(SBGridProperties);
	    grdCltvtnFrmhsQlt.bind('valuechanged', 'fn_grdValueChanged');
	}

	const fn_frmhsExpctWrhs = function () {

		var SBGridProperties = {};
	    SBGridProperties.parentid = "sb-area-frmhsExpctWrhs";
	    SBGridProperties.id = "grdFrmhsExpctWrhs";
	    SBGridProperties.jsonref = "jsonFrmhsExpctWrhs";
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.scrollbubbling = false;

	    const columns = [
	    	{caption : ['처리'], 			ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowExpct(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowExpct(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ['농가명'], 			ref: 'prdcrCd', 	type: 'inputcombo', 	width: '200px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdPrdcr', 	label:'label', value:'value', itemcount: 10}},
		    {caption : ['지역'], 			ref: 'frmhsCtpvNm', type: 'output', 	width: '100px', style: 'text-align:center'},
		    {caption : ['상세주소'], 		ref: 'frmhsAddr', 	type: 'output', 	width: '300px', style: 'text-align:center'},
		    {caption : ['연락처'], 			ref: 'frmhsTelno', 	type: 'output', 	width: '100px', style: 'text-align:center',
		    	format : {type:'string', rule:'000-0000-0000'}},
		    {caption : ['본사/외부구분'], 	ref: 'hdofcExtrnlSeCd', 	type: 'combo', 	width: '120px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdHdofcExtrnlSe', 	label:'label', value:'value', itemcount: 10}},
		    {caption : ['외부창고명'], 		ref: 'extrnlWarehouseSeCd', type: 'combo', 	width: '120px', style: 'text-align:center', sortable: false,
				typeinfo: {ref:'jsonGrdExtrnlWarehouseSe', 	label:'label', value:'value', itemcount: 10}},
			{caption : ['수확일자'], 		ref: 'hrvstYmd', 	type: 'input', 		width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['정식면적(평)'], 	ref: 'plntngArea', 	type: 'output', 	width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['예상량(망)'], 		ref: 'expctNet', 	type: 'input', 		width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['일자합계'], 		ref: 'tot', 		type: 'input', 		width: '80px', style:'text-align: right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
			{caption : ['기준연월'], 		ref: 'crtrYm', 	type : 'datepicker', 	width: '100px', style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, typeinfo : {calendartype: 'yearmonth', gotoCurrentClick: true, clearbutton: true}},
	    ];
	    for (var i=1; i<=31; i++) {

	    	let caption = i+"";
	    	let ref = "ymd"+i+"Qntt";
			columns.push(
					{caption : [caption], 		ref: ref, 		type: 'input', 		width: '40px', style:'text-align: right',
						typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
					)
	    }

	    columns.push(
	    		{caption : ['최종저장구분'], 	ref: 'lastStrgSeCd', type: 'combo', 	width: '120px', style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonGrdLastStrgSe', 	label:'label', value:'value', itemcount: 10}},
				{caption : ['담당자'], 			ref: 'pic', type: 'input', 	width: '100px', style: 'text-align:center'},
				{caption : ['예상량대비'], 	ref: 'expctVlmVrss', 	type: 'input', 	width: '80px', style:'text-align: right',
					typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
				{caption : ['수매완료여부'], 	ref: 'prchsCmptnYn', type: 'combo', 	width: '120px', style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonGrdPrchsCmptnYn', 	label:'label', value:'value', itemcount: 10}},
				{caption : ['비고'], 			ref: 'rmrk', type: 'input', 	width: '300px', style: 'text-align:center'},
	    		)

	    SBGridProperties.columns = columns;
	    grdFrmhsExpctWrhs = _SBGrid.create(SBGridProperties);
	    grdFrmhsExpctWrhs.bind('valuechanged', 'fn_grdValueChanged');

	}

	/**
     * @name fn_setFrlnInput
     * @description 재배이력 지도(보기) 이벤트 팜맵 팝업 연결
     */
	const fn_setFrlnInput = function(){
		const item = grdCltvtnHstry.getRowData(grdCltvtnHstry.getRow());

     	let col = grdCltvtnHstry.getCol();

		var mapCol = grdCltvtnHstry.getColRef("map");
		if(mapCol === col){
			frmidMapPopup(item);
		}

	}

	const frmidMapPopup = async function(item){
		SBUxMethod.openModal('modal-framldMap');
		popFramldMap.init(gv_selectedApcCd, item.stdgCd, item.frlnMno, item.frlnSno);
	}

	const fn_imagePop = function (nRow) {

		let rowData = grdCltvtnHstry.getRowData(nRow);
		let atchflNo = rowData.atchflNo;
		let prntsTblNo = rowData.cltvtnHstryNo;

		SBUxMethod.openModal('modal-image');
		popImage.init(atchflNo, prntsTblNo, '01');

	}

	const fn_fileSelect = function (event) {

		// event.target을 사용하여 파일 선택 input 요소를 참조합니다.
	    const input = event.target;
		const fileId = input.id;

	    // 선택된 파일들이 저장된 FileList 객체를 가져옵니다.
	    const files = input.files;

	    // 선택된 파일의 수를 확인합니다.
	    if (files.length > 0) {
	        // 첫 번째 파일을 가져옵니다.
	        const file = files[0];

	        console.log('File name:', file.name);
	        console.log('fileId:', fileId);
	        console.log('File size:', file.size);
	        console.log('File type:', file.type);
	        console.log('Last modified:', file.lastModifiedDate);

	        if (!gfn_isEmpty(fileId)) {

	        	const maxSize = 8 * 1024 * 1024;  // 8MB in bytes

	        	if (file.size > maxSize) {

	        		input.value = '';
		        	rgfn_comAlert("E0000", "파일의 크기가 큽니다." ) // E0000 {0}
		        	return;
		        } else {

		        	// 문자열에서 마지막 하이픈의 위치를 찾습니다
		        	const lastHyphenIndex = fileId.lastIndexOf('-');

		        	// 하이픈 뒤의 부분을 가져오고, 숫자를 추출합니다
		        	const lastNumber = parseInt(fileId.substring(lastHyphenIndex + 1));

		        	let fileNameCol = grdCltvtnHstry.getColRef("fileName");

		        	grdCltvtnHstry.setCellData(lastNumber, fileNameCol, file.name, true);
		        	grdCltvtnHstry.setRowStatus(lastNumber, "update", true);
		        }


	        }


	    } else {
	        console.log('No file selected.');
	    }

	}

	const fn_fileUpload = function (nRow) {

		let fileId = 'inp-file-' + nRow;
    	let key = '#' + fileId; // fileId를 선택자로 변환 (템플릿 리터럴 사용 안 함)
        if ($(key).length) {  	// 요소 존재 여부 확인
            $(key).click();  	// 'file-2' 버튼 클릭 이벤트 트리거
        } else {
            console.log(key + ' 요소가 존재하지 않습니다.');
        }
	}


	/**
     * @name fn_grdValueChanged
     * @description 그리드 combo change 이벤트
     * @param {String}
     * @return (String)
     */
	const fn_grdValueChanged = function () {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "frmhsQltTab") {
			let nRow = grdCltvtnFrmhsQlt.getRow();
			let nCol = grdCltvtnFrmhsQlt.getCol();
			let prdcrCol = grdCltvtnFrmhsQlt.getColRef("prdcrCd");
			let frmhsAddrCol = grdCltvtnFrmhsQlt.getColRef("frmhsAddr");
			let frmhsTelnoCol = grdCltvtnFrmhsQlt.getColRef("frmhsTelno");
			let frmhsCtpvNmCol = grdCltvtnFrmhsQlt.getColRef("frmhsCtpvNm");

			if (nCol == prdcrCol) {
				let rowData = grdCltvtnFrmhsQlt.getRowData(nRow);
				let prdcrCd = rowData.prdcrCd;
				let prdcrInfo = _.find(jsonGrdPrdcr, {value: prdcrCd});

				grdCltvtnFrmhsQlt.setCellData(nRow, frmhsAddrCol, prdcrInfo.frmhsAddr);
				grdCltvtnFrmhsQlt.setCellData(nRow, frmhsTelnoCol, prdcrInfo.frmhsTelno);
				grdCltvtnFrmhsQlt.setCellData(nRow, frmhsCtpvNmCol, prdcrInfo.frmhsCtpvNm);
			}
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			let nRow = grdFrmhsExpctWrhs.getRow();
			let nCol = grdFrmhsExpctWrhs.getCol();
			let prdcrCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
			let crtrYmCol = grdFrmhsExpctWrhs.getColRef("crtrYm");
			let frmhsAddrCol = grdFrmhsExpctWrhs.getColRef("frmhsAddr");
			let frmhsTelnoCol = grdFrmhsExpctWrhs.getColRef("frmhsTelno");
			let frmhsCtpvNmCol = grdFrmhsExpctWrhs.getColRef("frmhsCtpvNm");

			if (nCol == prdcrCol) {
				let rowData = grdFrmhsExpctWrhs.getRowData(nRow);
				let prdcrCd = rowData.prdcrCd;
				let crtrYm = rowData.crtrYm;

				if (!gfn_isEmpty(crtrYm)) {
					let grdData = grdFrmhsExpctWrhs.getGridDataAll();
					for (var i=1; i<=grdData.length; i++) {

						if (i == nRow) {
							continue;
						}

						let grdRowData = grdFrmhsExpctWrhs.getRowData(i);
						let grdCryrYm  = grdRowData.crtrYm;
						let grdPrdcrCd  = grdRowData.prdcrCd;

						if (prdcrCd == grdPrdcrCd && crtrYm == grdCryrYm) {
							grdFrmhsExpctWrhs.setCellData(nRow, prdcrCol, "");
							gfn_comAlert("W0009", "해당 농가에" + crtrYm) // W0009 {0}이/가 있습니다.
							return;
						}
					}
				}

				let prdcrInfo = _.find(jsonGrdPrdcr, {value: prdcrCd});

				grdFrmhsExpctWrhs.setCellData(nRow, frmhsAddrCol, prdcrInfo.frmhsAddr);
				grdFrmhsExpctWrhs.setCellData(nRow, frmhsTelnoCol, prdcrInfo.frmhsTelno);
				grdFrmhsExpctWrhs.setCellData(nRow, frmhsCtpvNmCol, prdcrInfo.frmhsCtpvNm);

			}

			if (nCol == crtrYmCol) {
				let rowData = grdFrmhsExpctWrhs.getRowData(nRow);
				let prdcrCd = rowData.prdcrCd;
				let crtrYm = rowData.crtrYm;

				if (!gfn_isEmpty(prdcrCd)) {
					let grdData = grdFrmhsExpctWrhs.getGridDataAll();
					for (var i=1; i<=grdData.length; i++) {

						if (i == nRow) {
							continue;
						}

						let grdRowData = grdFrmhsExpctWrhs.getRowData(i);
						let grdCryrYm  = grdRowData.crtrYm;
						let grdPrdcrCd  = grdRowData.prdcrCd;

						if (prdcrCd == grdPrdcrCd && crtrYm == grdCryrYm) {
							grdFrmhsExpctWrhs.setCellData(nRow, crtrYmCol, "");
							gfn_comAlert("W0009", "해당 농가에" + crtrYm) // W0009 {0}이/가 있습니다.
							return;
						}
					}

				}

				let lastDay = parseInt(fn_getLastDayOfMonth(crtrYm)) + 1 ;
				if (32 != lastDay) {

					let firstCol = grdFrmhsExpctWrhs.getColRef("ymd1Qntt");
					let lastCol = grdFrmhsExpctWrhs.getColRef("ymd31Qntt");

					grdFrmhsExpctWrhs.setCellDisabled(nRow, firstCol, nRow, lastCol, false);

					for (var i=lastDay; i<=31; i++) {
						let colKey =  "ymd"+i+"Qntt";
						let col = grdFrmhsExpctWrhs.getColRef(colKey);
						grdFrmhsExpctWrhs.setCellDisabled(nRow, col, nRow, col, true);
					}
				} else {

					let firstCol = grdFrmhsExpctWrhs.getColRef("ymd1Qntt");
					let lastCol = grdFrmhsExpctWrhs.getColRef("ymd31Qntt");

					grdFrmhsExpctWrhs.setCellDisabled(nRow, firstCol, nRow, lastCol, false);
				}
			}
		}
	}

	/**
     * @name fn_getLastDayOfMonth
     * @description 연월에 해당 되는 마지막 날 구하기
     * @param {String} yyyymm
     * @return (String) mm
     */
	const fn_getLastDayOfMonth = function (yyyymm) {

	    // 년도와 월 추출
	    var year = parseInt(yyyymm.substring(0, 4), 10);
	    var month = parseInt(yyyymm.substring(4, 6), 10);

	    // Date 객체 생성하여 해당 월의 다음 달의 첫 날을 구함
	    var nextMonthFirstDay = new Date(year, month, 1);

	    // 이전 월의 마지막 날을 구하기 위해 하루 전으로 설정
	    nextMonthFirstDay.setDate(nextMonthFirstDay.getDate() - 1);

	    // 이전 월의 마지막 날짜 반환
	    return nextMonthFirstDay.getDate();
	}

	const fn_search = async function () {

		let prdcrCdDtl = SBUxMethod.get("dtl-inp-prdcrCd");

		if (!gfn_isEmpty(prdcrCdDtl)) {
			await fn_setClvtnBsclnfo(prdcrCdDtl);
			await fn_setClvtnHstyr(prdcrCdDtl);
		}

		fn_setCltvtnFrmhsQlt();
		fn_setFrmhsExpctWrhs();
	}

	/**
     * @name fn_setClvtnBsclnfo
     * @description 재배 기본정보 조회
     * @param {String} prdcrCdDtl
     */
	const fn_setClvtnBsclnfo = async function(prdcrCdDtl) {

		const param = {
			apcCd: gv_selectedApcCd,
			prdcrCd: prdcrCdDtl,
		}
		jsonCltvtnBscInfo.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectCltvtnBscInfoList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {

	        	const cltvtnBscInfoVO = {
	        			apcCd 			: item.apcCd
	        		  , prdcrCd 		: item.prdcrCd
	        		  , cltvtnBscInfoNo : item.cltvtnBscInfoNo
	        		  , sdCd1 			: item.sdCd1
	        		  , sdCd2 			: item.sdCd2
	        		  , sdCd3 			: item.sdCd3
	        		  , sdCd4 			: item.sdCd4
	        		  , sdCd5 			: item.sdCd5
	        		  , sdQntt1 		: item.sdQntt1
	        		  , sdQntt2 		: item.sdQntt2
	        		  , sdQntt3 		: item.sdQntt3
	        		  , sdQntt4 		: item.sdQntt4
	        		  , sdQntt5 		: item.sdQntt5
	        		  , lwptFrtlzr 		: item.lwptFrtlzr
	        		  , sdngYmd 		: item.sdngYmd
	        		  , clclnYmd 		: item.clclnYmd
	        		  , cmptYmdCycl1 	: item.cmptYmdCycl1
	        		  , cmptYmdCycl2 	: item.cmptYmdCycl2
	        		  , strgRslt 		: item.strgRslt
	        		  , rmrk 			: item.rmrk
	        	}
	        	jsonCltvtnBscInfo.push(cltvtnBscInfoVO);
	        });

	        grdCltvtnBscInfo.rebuild();
	        if (jsonCltvtnBscInfo.length == 0) {
	        	grdCltvtnBscInfo.addRow();
	        }

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

     /**
      * @name fn_setClvtnHstyr
      * @description 재배이력 목록 조회
      * @param {String} prdcrCdDtl
      */
	const fn_setClvtnHstyr = async function(prdcrCdDtl) {
		let prdcrLinkCd = SBUxMethod.get("dtl-inp-prdcrLinkCd");
		const param = {
			apcCd		: gv_selectedApcCd
		  , prdcrCd		: prdcrCdDtl
		  , mngmstRegno : prdcrLinkCd
		}
		jsonCltvtnHstry.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectCltvtnHstryList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {

	        	const cltvtnHstryVO = {
	        			apcCd 			: item.apcCd
	        		  , prdcrCd 		: item.prdcrCd
	        		  , mngmstRegno		: item.mngmstRegno
	        		  , farmLandSn		: item.farmLandSn
	        		  , frlnAddr		: item.frlnAddr
	        		  , stdgCd			: item.stdgCd
	        		  , frlnMno			: item.frlnMno
	        		  , frlnSno			: item.frlnSno
	        		  , cn				: item.cn
	        		  , cltvtnHstryNo	: item.cltvtnHstryNo
	        		  , rmrk 			: item.rmrk
	        		  , delYn			: item.delYn
	        		  , atchflNo		: item.atchflNo
	        		  , filePath		: item.filePath
	        	}

	        	if (!gfn_isEmpty(item.cltvtnHstryNo)) {
	        		cltvtnHstryVO.inputFlag = true;
	        	} else {
	        		cltvtnHstryVO.inputFlag = false;
	        	}
	        	jsonCltvtnHstry.push(cltvtnHstryVO);
	        });

	        grdCltvtnHstry.rebuild();

	        fn_grdCltvtnHstryDisabled();


		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	const fn_grdCltvtnHstryDisabled = function () {
		let grdData = grdCltvtnHstry.getGridDataAll();


        for (var i=0; i<grdData.length; i++) {

        	let rowData = grdCltvtnHstry.getRowData(i+1);

        	let inputFlag = rowData.inputFlag;

        	if (inputFlag) {
        		grdCltvtnHstry.setCellDisabled(i+1, 0, i+1, grdCltvtnHstry.getCols() -1, false);
        	} else {
        		grdCltvtnHstry.setCellDisabled(i+1, 0, i+1, grdCltvtnHstry.getCols() -1, true);
        	}

        }
	}

      /**
       * @name fn_setClvtnHstyr
       * @description 재배이력 목록 조회
       * @param {String} prdcrCdDtl
       */
 	const fn_setCltvtnFrmhsQlt = async function() {
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");

 		const param = {
 			apcCd		: gv_selectedApcCd
 		  , prdcrCd		: prdcrCd
 		  , itemCd 		: itemCd
 		}
 		jsonCltvtnFrmhsQlt.length = 0;
 		try {
 			const postJsonPromise = gfn_postJSON(
 						"/am/wrhs/selectCltvtnFrmhsQltList.do",
 						param,
 						null,
 						false
 					);
 	        const data = await postJsonPromise;
 	        data.resultList.forEach((item, index) => {

 	        	const cltvtnFrmhsQltVO = {
 	        			apcCd 			: item.apcCd
 	        		  , prdcrCd 		: item.prdcrCd
 	        		  , prdcrNm			: item.prdcrNm
 	        		  , frmhsCtpv       : item.frmhsCtpv
 	        		  , frmhsCtpvNm     : item.frmhsCtpvNm
 	        		  , frmhsAddr       : item.frmhsAddr
 	        		  , frmhsTelno      : item.frmhsTelno
 	        		  , cltvtnFrmhsQltNo   : item.cltvtnFrmhsQltNo
 	        		  , sdQntt1         : item.sdQntt1
 	        		  , sdQntt2         : item.sdQntt2
 	        		  , sdQntt3         : item.sdQntt3
 	        		  , sdQntt4         : item.sdQntt4
 	        		  , sdQntt5         : item.sdQntt5
 	        		  , ctrtPrcl        : item.ctrtPrcl
 	        		  , plntngPrcl      : item.plntngPrcl
 	        		  , sdngYmd         : item.sdngYmd
 	        		  , sdngSttsCd      : item.sdngSttsCd
 	        		  , plntngYmd       : item.plntngYmd
 	        		  , plntngSttsCd    : item.plntngSttsCd
 	        		  , cmptYmdCycl1    : item.cmptYmdCycl1
 	        		  , cmptYmdCycl2    : item.cmptYmdCycl2
 	        		  , expctNet        : item.expctNet
 	        		  , qltEvl          : item.qltEvl
 	        		  , lastYrEvl       : item.lastYrEvl
 	        		  , flctnDfrnc      : item.flctnDfrnc
 	        		  , emptSort        : item.emptSort
 	        		  , meshSeCd        : item.meshSeCd
 	        		  , strm            : item.strm
 	        		  , tmidlTerm       : item.tmidlTerm
 	        		  , ltrm            : item.ltrm
 	        		  , dfrnc           : item.dfrnc
 	        		  , soil            : item.soil
 	        		  , cmpt            : item.cmpt
 	        		  , etc             : item.etc
 	        		  , pestCd1         : item.pestCd1
 	        		  , pestCd2         : item.pestCd2
 	        		  , pestCd3         : item.pestCd3
 	        		  , pestYn1         : item.pestYn1
 	        		  , pestYn2         : item.pestYn2
 	        		  , pestYn3         : item.pestYn3
 	        		  , pic             : item.pic
 	        		  , grdpExcptnMttr  : item.grdpExcptnMttr
 	        		  , strgExcptnMttr  : item.strgExcptnMttr
 	        		  , delYn			: item.delYn
 	        	}
 	        	jsonCltvtnFrmhsQlt.push(cltvtnFrmhsQltVO);
 	        });

 	        grdCltvtnFrmhsQlt.rebuild();

			grdCltvtnFrmhsQlt.addRow(true);

			grdCltvtnFrmhsQlt.setCellDisabled(0, 0, grdCltvtnFrmhsQlt.getRows() -1, grdCltvtnFrmhsQlt.getCols() -1, false);
			grdCltvtnFrmhsQlt.setCellDisabled(grdCltvtnFrmhsQlt.getRows() -1, 0, grdCltvtnFrmhsQlt.getRows() -1, grdCltvtnFrmhsQlt.getCols() -1, true);

			grdCltvtnFrmhsQlt.setCellDisabled(0, 0, grdCltvtnFrmhsQlt.getRows() -1, 1, true);

 		} catch (e) {
 			if (!(e instanceof Error)) {
 				e = new Error(e);
 			}
 			console.error("failed", e.message);
 		}
 	}

    const fn_setFrmhsExpctWrhs = async function () {
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");

 		const param = {
 			apcCd		: gv_selectedApcCd
 		  , prdcrCd		: prdcrCd
 		  , itemCd 		: itemCd
 		}
 		jsonFrmhsExpctWrhs.length = 0;
 		try {
 			const postJsonPromise = gfn_postJSON(
 						"/am/wrhs/selectFrmhsExpctWrhsList.do",
 						param,
 						null,
 						false
 					);
 	        const data = await postJsonPromise;
 	        data.resultList.forEach((item, index) => {

 	        	jsonFrmhsExpctWrhs.push(item);
 	        });

			grdFrmhsExpctWrhs.rebuild();

 	      	grdFrmhsExpctWrhs.addRow(true);

 	      	grdFrmhsExpctWrhs.setCellDisabled(0, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, false);
 	      	grdFrmhsExpctWrhs.setCellDisabled(grdFrmhsExpctWrhs.getRows() -1, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, true);

 	      	let prdcrCdCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
			let crtrYmCol = grdFrmhsExpctWrhs.getColRef("crtrYm");

 	      	grdFrmhsExpctWrhs.setCellDisabled(0, prdcrCdCol, grdFrmhsExpctWrhs.getRows() -1, prdcrCdCol, true);
 	      	grdFrmhsExpctWrhs.setCellDisabled(0, crtrYmCol, grdFrmhsExpctWrhs.getRows() -1, crtrYmCol, true);

 	      	fn_ymdCellDisabled();

 		} catch (e) {
 			if (!(e instanceof Error)) {
 				e = new Error(e);
 			}
 			console.error("failed", e.message);
 		}
    }

    const fn_ymdCellDisabled = function () {
    	let grdData = grdFrmhsExpctWrhs.getGridDataAll();

      	for (var i=1; i<=grdData.length; i++) {

      		let rowData = grdFrmhsExpctWrhs.getRowData(i);

      		let crtrYm = rowData.crtrYm;

      		if (!gfn_isEmpty(crtrYm)) {
      			let lastDay = parseInt(fn_getLastDayOfMonth(crtrYm)) + 1 ;

				if (32 != lastDay) {

					for (var j=lastDay; j<=31; j++) {
						let colKey =  "ymd"+j+"Qntt";
						let col = grdFrmhsExpctWrhs.getColRef(colKey);
						grdFrmhsExpctWrhs.setCellDisabled(j, col, j, col, true);
					}
				}
      		}
      	}
    }

    const fn_procRowHstry = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		let rowData = grdCltvtnHstry.getRowData(nRow);
    		jsonCltvtnHstry.splice(nRow, 0, rowData);
    		grdCltvtnHstry.setCellData(nRow, nCol, "N", true);
    		grdCltvtnHstry.setCellData(nRow, grdCltvtnHstry.getColRef("inputFlag"), true, true);

    		grdCltvtnHstry.refresh();

    		fn_grdCltvtnHstryDisabled();

    	} else if (gubun == "DEL") {

    		let rowData = grdCltvtnHstry.getRowData(nRow);
    		let cltvtnHstryNo = rowData.cltvtnHstryNo;

    		if (gfn_isEmpty(cltvtnHstryNo)) {
    			grdCltvtnHstry.deleteRow(nRow);
    		} else {
    			if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			fn_del(rowData, nRow);
        		}
    		}
    	}
    }

    const fn_procRowExpct = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		grdFrmhsExpctWrhs.setCellData(nRow, nCol, "N", true);
    		grdFrmhsExpctWrhs.addRow(true);

    		grdFrmhsExpctWrhs.setCellDisabled(0, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, false);
    		grdFrmhsExpctWrhs.setCellDisabled(grdFrmhsExpctWrhs.getRows() -1, 0, grdFrmhsExpctWrhs.getRows() -1, grdFrmhsExpctWrhs.getCols() -1, true);
    		let grdData = grdFrmhsExpctWrhs.getGridDataAll();
    		for (var i=0; i<grdData.length; i++) {

    			let rowData = grdData[i];
    			let frmhsExpctWrhsNo = rowData.frmhsExpctWrhsNo;

    			if (!gfn_isEmpty(frmhsExpctWrhsNo)) {

    				let prdcrCdCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
    				let crtrYmCol = grdFrmhsExpctWrhs.getColRef("crtrYm");

    				grdFrmhsExpctWrhs.setCellDisabled(0+1, prdcrCdCol, i+1, prdcrCdCol, true);
    				grdFrmhsExpctWrhs.setCellDisabled(0+1, crtrYmCol, i+1, crtrYmCol, true);

    				fn_ymdCellDisabled();
    			}
    		}

    	} else if (gubun == "DEL") {

    		if (grdFrmhsExpctWrhs.getRowStatus(nRow) == 0 || grdFrmhsExpctWrhs.getRowStatus(nRow) == 2){
        		if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			var frmhsExpctWrhsVO = grdFrmhsExpctWrhs.getRowData(nRow);
        			fn_del(frmhsExpctWrhsVO, nRow);
        		}
        	} else{
        		grdFrmhsExpctWrhs.deleteRow(nRow);
        	}

    	}
    }

    const fn_procRowQlt = function (gubun, nRow, nCol) {

    	if (gubun == "ADD") {
    		grdCltvtnFrmhsQlt.setCellData(nRow, nCol, "N", true);
    		grdCltvtnFrmhsQlt.addRow(true);

    		grdCltvtnFrmhsQlt.setCellDisabled(0, 0, grdCltvtnFrmhsQlt.getRows() -1, grdCltvtnFrmhsQlt.getCols() -1, false);
    		grdCltvtnFrmhsQlt.setCellDisabled(grdCltvtnFrmhsQlt.getRows() -1, 0, grdCltvtnFrmhsQlt.getRows() -1, grdCltvtnFrmhsQlt.getCols() -1, true);

    		let grdData = grdCltvtnFrmhsQlt.getGridDataAll();
    		for (var i=0; i<grdData.length; i++) {

    			let rowData = grdData[i];
    			let cltvtnFrmhsQltNo = rowData.cltvtnFrmhsQltNo;

    			if (!gfn_isEmpty(cltvtnFrmhsQltNo)) {
    				let prdcrCdCol = grdFrmhsExpctWrhs.getColRef("prdcrCd");
    				grdCltvtnFrmhsQlt.setCellDisabled(0+2, prdcrCdCol, i+2, prdcrCdCol, true);
    			}
    		}

    	} else if (gubun == "DEL") {

    		if(grdCltvtnFrmhsQlt.getRowStatus(nRow) == 0 || grdCltvtnFrmhsQlt.getRowStatus(nRow) == 2){
        		if(gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			var cltvtnFrmhsQltVO = grdCltvtnFrmhsQlt.getRowData(nRow);
        			fn_del(cltvtnFrmhsQltVO, nRow);
        		}
        	}else{
        		grdCltvtnFrmhsQlt.deleteRow(nRow);
        	}

    	}

    }


	const fn_save = async function () {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "frmerInfoTab") {
			fn_saveFrmerInfo();
		}

		if (choiceTab == "frmhsQltTab") {
			fn_saveFrmhsQlt();
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			fn_saveFrmhsExpctWrhs();
		}
	}

	const fn_saveFrmerInfo = async function () {

		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");
		let prdcr = _.find(jsonPrdcrDtl, {prdcrCd: prdcrCd});
		let prdcrChgYn = false;

		let prdcrVO = null;
		let cltvtnBscInfoVO = null;

		let frmhsAddr = SBUxMethod.get("dtl-inp-frmhsAddr");
		let frmhsCtpv = SBUxMethod.get("dtl-slt-frmhsCtpv");
		let frmhsTelno = SBUxMethod.get("dtl-inp-frmhsTelno");
		let plntngArea = SBUxMethod.get("dtl-inp-plntngArea");
		let prchsQntt = SBUxMethod.get("dtl-inp-prchsQntt");
		let prchsAmt = SBUxMethod.get("dtl-inp-prchsAmt");
		let crtrArea = SBUxMethod.get("dtl-inp-crtrArea");
		let prdcrLinkCd = SBUxMethod.get("dtl-inp-prdcrLinkCd");

		if (prdcr.frmhsAddr 	!= 	frmhsAddr 	||
			prdcr.frmhsCtpv 	!=  frmhsCtpv	||
			prdcr.frmhsTelno 	!=  frmhsTelno	||
			prdcr.plntngArea 	!=  plntngArea	||
			prdcr.prchsQntt 	!=  prchsQntt	||
			prdcr.prchsAmt 		!=  prchsAmt	||
			prdcr.crtrArea 		!=  crtrArea
		   ) {

				prdcr.frmhsAddr 	= frmhsAddr;
				prdcr.frmhsCtpv 	= frmhsCtpv;
				prdcr.frmhsTelno 	= frmhsTelno;
				prdcr.plntngArea 	= plntngArea;
				prdcr.prchsQntt 	= prchsQntt;
				prdcr.prchsAmt 		= prchsAmt;
				prdcr.crtrArea		= crtrArea;
				prdcr.apcCd			= gv_selectedApcCd;
				prdcrVO = prdcr;
			}
		let cltvtnListVO = null;

		if (prdcrVO != null) {
			cltvtnListVO = {'prdcrVO' : prdcrVO};
			prdcrChgYn = true;
		}

		let rowSts = grdCltvtnBscInfo.getRowStatus(2);
		if (rowSts == 2 || rowSts == 3) {
			cltvtnBscInfoVO = grdCltvtnBscInfo.getRowData(2);
			if (gfn_isEmpty(cltvtnBscInfoVO.cltvtnBscInfoNo)) {
				cltvtnBscInfoVO.apcCd  = gv_selectedApcCd;
				cltvtnBscInfoVO.prdcrCd = prdcrCd;
				cltvtnBscInfoVO.rowSts = "I";
			} else {
				cltvtnBscInfoVO.rowSts = "U";
			}
		}


		if (cltvtnBscInfoVO != null) {

			if (cltvtnListVO == null) {
				cltvtnListVO = {'cltvtnBscInfoVO' : cltvtnBscInfoVO}
			} else {
				cltvtnListVO.cltvtnBscInfoVO = cltvtnBscInfoVO;
			}

		}


		let grdData = grdCltvtnHstry.getGridDataAll();

		let cltvtnHstryList = [];

		for (var i=0; i<grdData.length; i++) {

			let rowData = grdCltvtnHstry.getRowData(i+1);

			let rowSts = grdCltvtnHstry.getRowStatus(i+1);
			let fileName = rowData.fileName;
			let cltvtnHstryNo = rowData.cltvtnHstryNo;

			if (gfn_isEmpty(cltvtnHstryNo)) {

				if (rowSts === 3 || rowSts === 2) {
					rowData.rowSts = "I";
					rowData.apcCd = gv_selectedApcCd;
					rowData.prdcrCd = prdcrCd;
					rowData.mngmstRegno = prdcrLinkCd;
					cltvtnHstryList.push(rowData);
				} else {
					continue;
				}

			} else {
				if (rowSts === 2){
					rowData.rowSts = "U";

					if (!gfn_isEmpty(fileName)) {
						let fileId = 'inp-file-' + (i+1);
				    	let fileInput = document.getElementById(fileId);
						let file = fileInput.files[0];
						const base64File = await fileToBase64(file);

						const comAtchflVO = {
								prntsTblNo		: cltvtnHstryNo
							  , prntsTblSeCd	: '01'
							  , atchflOrgnNm	: file.name
							  , atchflSz		: file.size
							  , atchflExtnType	: file.type
							  , base64File		: base64File
						};

				    	rowData.comAtchflVO = comAtchflVO;
					}
					cltvtnHstryList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (cltvtnHstryList.length != 0) {
			if (cltvtnListVO == null) {
				cltvtnListVO = {'cltvtnHstryList' : cltvtnHstryList}
			} else {
				cltvtnListVO.cltvtnHstryList = cltvtnHstryList;
			}
		}

		if (cltvtnListVO == null) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
			return;
		}

		const postJsonPromise = gfn_postJSON("/am/wrhs/multiFrmerInfoList.do", cltvtnListVO);
    	const data = await postJsonPromise;
    	if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
    		try{
        		if (_.isEqual("S", data.resultStatus)) {
        			fn_search();
           			gfn_comAlert("I0001");					// I0001 처리 되었습니다.

           			if (prdcrChgYn) {
           				// 생산자 정보 업데이트
           				await gfn_setPrdcrSBSelect('grdCltvtnFrmhsQlt', 	jsonGrdPrdcr, 				gv_selectedApcCd)		// Grid 생산자
           				prdcrChgYn = false;
           			}
            	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
            } catch (e) {
        		if (!(e instanceof Error)) {
        			e = new Error(e);
        		}
        		console.error("failed", e.message);
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    		}
    	}
	}

	 const fileToBase64 = (file) => new Promise((resolve, reject) => {
	        const reader = new FileReader();
	        reader.onload = () => resolve(reader.result.split(',')[1]);  // Base64 문자열만 추출
	        reader.onerror = reject;
	        reader.readAsDataURL(file);
	    });


	const fn_del = async function (deleteVO, nRow) {

		let choiceTab = SBUxMethod.get("idxTab_norm");

		if (choiceTab == "frmerInfoTab") {
			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteCltvtnHstry.do", deleteVO);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			grdCltvtnHstry.deleteRow(nRow);
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

		if (choiceTab == "frmhsQltTab") {

			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteCltvtnFrmhsQlt.do", deleteVO);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			grdCltvtnFrmhsQlt.deleteRow(nRow);
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

		if (choiceTab == "frmhsExpctWrhsTab") {
			const postJsonPromise = gfn_postJSON("/am/wrhs/deleteFrmhsExpctWrhs.do", deleteVO);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			grdFrmhsExpctWrhs.deleteRow(nRow);
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}
	}


	const fn_saveFrmhsQlt = async function () {

		let grdData = grdCltvtnFrmhsQlt.getGridDataAll();

		let cltvtnFrmhsQltList = [];

		for (var i=0; i<grdData.length; i++) {
			let rowData = grdCltvtnFrmhsQlt.getRowData(i+2);
			let rowSts = grdCltvtnFrmhsQlt.getRowStatus(i+2);
			let delYn = rowData.delYn;
			if (!gfn_isEmpty(delYn)) {

				let prdcrCd = rowData.prdcrCd;

				if (gfn_isEmpty(prdcrCd)) {
		  			gfn_comAlert("W0001", "농가명");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}

				if (rowSts === 3){
					rowData.rowSts = "I";
					rowData.apcCd = gv_selectedApcCd;
					cltvtnFrmhsQltList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					cltvtnFrmhsQltList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (cltvtnFrmhsQltList.length == 0) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
			return;
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wrhs/multiCltvtnFrmhsQltList.do", cltvtnFrmhsQltList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
		    		fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}

	}

	const fn_saveFrmhsExpctWrhs = async function () {

		let grdData = grdFrmhsExpctWrhs.getGridDataAll();

		let frmhsExpctWrhsList = [];

		for (var i=0; i<grdData.length; i++) {
			let rowData = grdFrmhsExpctWrhs.getRowData(i+1);
			let rowSts = grdFrmhsExpctWrhs.getRowStatus(i+1);
			let delYn = rowData.delYn;
			if (!gfn_isEmpty(delYn)) {

				let prdcrCd = rowData.prdcrCd;

				if (gfn_isEmpty(prdcrCd)) {
		  			gfn_comAlert("W0001", "농가명");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}

				if (rowSts === 3){
					rowData.rowSts = "I";
					rowData.apcCd = gv_selectedApcCd;

					let frmhsExpctWrhsDtlList = [];

					for (var j=1; j<=31; j++) {

						let ymdKey = "ymd" + j + "Qntt";

						let qntt = rowData[ymdKey];


						if (!gfn_isEmpty(qntt) && qntt > 0) {

							let frmhsExpctWrhsDtl = {
								apcCd 		: gv_selectedApcCd
							  , prdcrCd 	: rowData.prdcrCd
							  , crtrYm 		: rowData.crtrYm
							  , ymd			: j
							  , qntt		: qntt
							}

							frmhsExpctWrhsDtlList.push(frmhsExpctWrhsDtl);
						}
					}

					if (frmhsExpctWrhsDtlList.length > 0) {
						rowData.frmhsExpctWrhsDtlList = frmhsExpctWrhsDtlList;
					}

					frmhsExpctWrhsList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";

					let frmhsExpctWrhsDtlList = [];

					for (var j=1; j<=31; j++) {

						let ymdKey = "ymd" + j + "Qntt";

						let qntt = rowData[ymdKey];

						if (!gfn_isEmpty(qntt) && qntt > 0) {

							let frmhsExpctWrhsDtl = {
								apcCd 				: gv_selectedApcCd
							  , prdcrCd 			: rowData.prdcrCd
							  , frmhsExpctWrhsNo 	: rowData.frmhsExpctWrhsNo
							  , crtrYm 				: rowData.crtrYm
							  , ymd					: j
							  , qntt				: qntt
							}

							frmhsExpctWrhsDtlList.push(frmhsExpctWrhsDtl);
						}
					}

					if (frmhsExpctWrhsDtlList.length > 0) {
						rowData.frmhsExpctWrhsDtlList = frmhsExpctWrhsDtlList;
					}

					frmhsExpctWrhsList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (frmhsExpctWrhsList.length == 0) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
			return;
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wrhs/multiFrmhsExpctWrhsList.do", frmhsExpctWrhsList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
		    		fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}


	}


    /* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	 const fn_getPrdcrs = async function() {
			jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd);
			jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
			jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd);
			jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
		}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){

		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {

		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

    /**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {
		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr)
		}
	}



	const fn_setPrdcrForm = async function(prdcr) {
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}


	/*
	* 상세 정보 생산자 팝업 관련 function
	* Start
	*/
	/**
	 * @name fn_onInputPrdcrDtlNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNmDtl = function(prdcrNm){
		fn_clearPrdcrDtl();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("dtl-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocompleteDtl = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrDtlNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNmDtl(value, label, item) {

		SBUxMethod.set("dtl-inp-prdcrCd", value);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcrDtl, {prdcrCd: value});
		fn_setPrdcrFormDtl(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcrDtl
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcrDtl = function() {
 		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-frmerno", "");
		SBUxMethod.set("dtl-inp-prdcrLinkCd", "");
		SBUxMethod.set("dtl-inp-frmhsTelno", "");
		SBUxMethod.set("dtl-slt-frmhsCtpv", "");
		SBUxMethod.set("dtl-inp-frmhsAddr", "");
		SBUxMethod.set("dtl-inp-crtrArea", "");
		SBUxMethod.set("dtl-inp-plntngArea", "");
		SBUxMethod.set("dtl-inp-prchsQntt", "");
		SBUxMethod.set("dtl-inp-prchsAmt", "");
		SBUxMethod.set("dtl-inp-squareFootage", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcrDtl
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcrDtl = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcrDtl, SBUxMethod.get("dtl-inp-prdcrNm"));
	}

    /**
	 * @name fn_setPrdcrDtl
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcrDtl = function(jsonPrdcrDtl) {

		if (!gfn_isEmpty(jsonPrdcrDtl)) {

			SBUxMethod.set("dtl-inp-prdcrNm", jsonPrdcrDtl.prdcrNm);
			SBUxMethod.set("dtl-inp-prdcrCd", jsonPrdcrDtl.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrLinkCd", jsonPrdcrDtl.prdcrLinkCd);
			SBUxMethod.set("dtl-inp-frmhsTelno", jsonPrdcrDtl.frmhsTelno);
			SBUxMethod.set("dtl-slt-frmhsCtpv", jsonPrdcrDtl.frmhsCtpv);
			SBUxMethod.set("dtl-inp-frmhsAddr", jsonPrdcrDtl.frmhsAddr);
			SBUxMethod.set("dtl-inp-crtrArea", jsonPrdcrDtl.crtrArea);
			SBUxMethod.set("dtl-inp-plntngArea", jsonPrdcrDtl.plntngArea);
			SBUxMethod.set("dtl-inp-prchsQntt", jsonPrdcrDtl.prchsQntt);
			SBUxMethod.set("dtl-inp-prchsAmt", jsonPrdcrDtl.prchsAmt);
			SBUxMethod.set("dtl-inp-frmerno", jsonPrdcrDtl.frmerno);

			if (!gfn_isEmpty(jsonPrdcrDtl.crtrArea)) {
				SBUxMethod.set("dtl-inp-squareFootage", Math.round(parseInt(jsonPrdcrDtl.crtrArea) * 3.3));
			} else {
				SBUxMethod.set("dtl-inp-squareFootage", "");
			}
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}

		if (!gfn_isEmpty(jsonPrdcrDtl.frmerno)) {

		}
	}

	const fn_setPrdcrFormDtl = async function(prdcrDtl) {

		if (!gfn_isEmpty(prdcrDtl)) {

			SBUxMethod.set("dtl-inp-frmhsTelno", prdcrDtl.frmhsTelno);
			SBUxMethod.set("dtl-inp-prdcrLinkCd", prdcrDtl.prdcrLinkCd);
			SBUxMethod.set("dtl-slt-frmhsCtpv", prdcrDtl.frmhsCtpv);
			SBUxMethod.set("dtl-inp-frmhsAddr", prdcrDtl.frmhsAddr);
			SBUxMethod.set("dtl-inp-crtrArea", prdcrDtl.crtrArea);
			SBUxMethod.set("dtl-inp-plntngArea", prdcrDtl.plntngArea);
			SBUxMethod.set("dtl-inp-prchsQntt", prdcrDtl.prchsQntt);
			SBUxMethod.set("dtl-inp-prchsAmt", prdcrDtl.prchsAmt);
			SBUxMethod.set("dtl-inp-frmerno", prdcrDtl.frmerno);
			if (!gfn_isEmpty(prdcrDtl.crtrArea)) {
				SBUxMethod.set("dtl-inp-squareFootage", Math.round(parseInt(prdcrDtl.crtrArea) * 3.3));
			} else {
				SBUxMethod.set("dtl-inp-squareFootage", "");
			}
		} else {
			SBUxMethod.set("dtl-inp-frmerno", "");
			SBUxMethod.set("dtl-inp-prdcrLinkCd", "");
			SBUxMethod.set("dtl-inp-frmhsTelno", "");
			SBUxMethod.set("dtl-slt-frmhsCtpv", "");
			SBUxMethod.set("dtl-inp-frmhsAddr", "");
			SBUxMethod.set("dtl-inp-crtrArea", "");
			SBUxMethod.set("dtl-inp-plntngArea", "");
			SBUxMethod.set("dtl-inp-prchsQntt", "");
			SBUxMethod.set("dtl-inp-prchsAmt", "");
			SBUxMethod.set("dtl-inp-squareFootage", "");
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
		}
	}

	/*
	* 상세 정보 생산자 팝업 관련 function
	* End
	*/


</script>
</html>