<%
 /**
  * @Class Name : fcltInstlInfoReg.jsp
  * @Description : 2.시설설치보완 화면
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
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
			</div>
			<div style="margin-left: auto;">
				<!--
				<sbux-button id="btnPop2" name="btnPop2" uitype="modal" target-id="modal-biz" onclick="fn_openMaodalBiz" text="지원사업관리" class="btn btn-sm btn-primary"></sbux-button>
				<sbux-button id="btnPop3" name="btnPop3" uitype="modal" target-id="modal-bizSrch" onclick="fn_openMaodalBizSrch" text="지원사업검색" class="btn btn-sm btn-primary"></sbux-button>
				 -->
				 <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 50px">
						<col style="width: 11%">
						<col style="width: 22%">
					<tbody>
						<tr>
							<th scope="row" style="border-bottom:1px solid white">APC명</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-crtrYr" name="srch-inp-crtrYr" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<!--
							<th scope="row">대상연도</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
									disabled
								></sbux-spinner>
							</td>
							 -->
							 <td></td>
						</tr>
					</tbody>
				</table>
			</div>

			<br>
			<!-- 진척도 추가 -->
			<%@ include file="prgrs/apcPrgrs.jsp" %>

			<div>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶검색리스트</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<!--
						<sbux-button id="btn_dwnld" name="btn_dwnld" uitype="normal" text="양식 다운로드" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld"></sbux-button>
						&nbsp;
						-->
						<sbux-button id="btn_down" name="btn_down" uitype="normal" text="양식 다운로드" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld('Y')"></sbux-button>
						&nbsp;
						<sbux-button id="btn_upload" name="btn_upload" uitype="normal" text="엑셀업로드" class="btn btn-xs btn-outline-danger" onclick="fn_upload"></sbux-button>
						&nbsp;
						<sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-xs btn-outline-danger" onclick="fn_addRow"></sbux-button>
						&nbsp;
						<sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-xs btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
					</div>
				</div>
				<!-- SBGrid를 호출합니다. -->
				<div id="sb-area-grdFcltInstlInfo" style="height:450px; width: 100%;"></div>
			</div>
		</div>
		<!-- 엑셀 업로드 양식 -->
		<div class="exp-div-excel" style="display: none;width: 1000px;">
			<div id="sbexp-area-grdExpUpload" style="height:1px; width: 100%;"></div>
		</div>
	</section>
		<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>

	<!-- 사업리스트 검색 -->
	<div>
		<sbux-modal
			id="modal-bizSrch"
			name="modal-bizSrch"
			uitype="middle"
			header-title="지원사업 목록"
			body-html-id="body-modal-bizSrch"
			footer-is-close-button="false"
			style="width:800px"
		></sbux-modal>
	</div>
	<div id="body-modal-bizSrch">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/bizSrchPopup.jsp"></jsp:include>
	</div>

	<!-- 사업리스트 관리-->
	<div>
		<sbux-modal
			id="modal-biz"
			name="modal-biz"
			uitype="middle"
			header-title="지원사업 목록"
			body-html-id="body-modal-biz"
			footer-is-close-button="false"
			style="width:800px"
		></sbux-modal>
	</div>
	<div id="body-modal-biz">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/bizPopup.jsp"></jsp:include>
	</div>

	<!-- IMPORT 엑셀 등록 Modal -->
	<div>
		<sbux-modal
			id="modal-imp"
			name="modal-imp"
			uitype="middle"
			header-title="지원사업 엑셀 등록(Excel)"
			body-html-id="body-modal-imp"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-imp">
		<jsp:include page="../../fm/popup/importExcelPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		//진척도 갱신을 위해 사용
		SBUxMethod.set("srch-inp-crtrYr", year);//trgtYr -> crtrYr 변경
		/*
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		*/

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let crtrYr = '2024';
		let apcCd = '0861';
		let apcNm = 'test';
		//SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcCd", apcCd);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();
	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_fcltInstlInfoCreateGrid();

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}
		await fn_search();
		//진척도
		await cfn_selectPrgrs();

		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			await SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
		} else {
			await SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
		}
	}

	/* 선택가능한 APC리스트 조회 */
	const fn_selectUserApcList = async function(){

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

		});

		let data = await postJsonPromise;
		try{
			console.log(data);
			let apcListLength = data.resultList.length;
			console.log(apcListLength);
			if(apcListLength == 1){
				SBUxMethod.set("srch-inp-apcCd", data.resultList[0].apcCd);
				SBUxMethod.set("srch-inp-apcNm", data.resultList[0].apcNm);
			}else if (apcListLength > 1){
				//APC선택 팝업 열기
				fn_modalApcSelect();
				SBUxMethod.openModal("modal-apcSelect");
			}


		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	var jsonGrdComBizSprtCd = [];	//지원유형

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('grdFcltInstlInfo', 	jsonGrdComBizSprtCd , 	'BIZ_SPRT_CD'), 	//지원 유형
		]);
	}


	var jsonFcltInstlInfo = []; // 그리드의 참조 데이터 주소 선언
	var grdFcltInstlInfo;


	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};


	function fn_excelDwnld01() {
		grdFcltInstlInfo.exportLocalExcel("시설설치보완", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//농가 리스트
	const fn_fcltInstlInfoCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdFcltInstlInfo';
		SBGridProperties.id = 'grdFcltInstlInfo';
		SBGridProperties.jsonref = 'jsonFcltInstlInfo';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.useMixedWidth = true;
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		//SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["체크박스","체크박스"], 	ref: 'checked', 	width: '40px', type: 'checkbox', style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
			//{caption: ["고유번호","고유번호"],				ref: 'sn',			type:'output',  width:'50px',    style:'text-align:center'
				//,typeinfo : {mask : {alias : 'numeric'}, maxlength : 4}},
			{caption: ["사업연도","사업연도"],			ref: 'bizYr',		type:'input',  width:'80px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric'}, maxlength : 4}},
			{caption: ["지원유형","지원유형"],			ref: 'sprtBiz',		type:'combo',  width:'100px',    style:'text-align:center'
				,typeinfo : {ref:'jsonGrdComBizSprtCd', label:'label', value:'value', displayui : false}},
			//{caption: ["APC지원유형","APC지원유형"],				ref: 'apcBizSprt',		type:'combo',  width:'100px',    style:'text-align:center'
				//,typeinfo : {ref:'jsonGrdComBizSprtCd', label:'label', value:'value', displayui : false}},
			{caption: ["사업명\n(APC 건립지원사업 / 밭작물공동경영체 육성사업 / 과수거점산지유통센터 등)","사업명\n(APC 건립지원사업 / 밭작물공동경영체 육성사업 / 과수거점산지유통센터 등)"],
				ref: 'bizNm',		type:'input',  width:'435px',	style:'text-align:center'},
			{caption: ["투자 사업비(백만원)","계"],			ref: 'tot',			type:'output',  width:'100px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["투자 사업비(백만원)","국고"],		ref: 'ne',			type:'input',  width:'100px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["투자 사업비(백만원)","지자체(시도)"],		ref: 'lcltExpndCtpv',	type:'input',  width:'100px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["투자 사업비(백만원)","지자체(시군구)"],		ref: 'lcltExpndSgg',	type:'input',  width:'100px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["투자 사업비(백만원)","자부담"],		ref: 'slfBrdn',		type:'input',  width:'100px',    style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: [" "," "],	hidden : true ,	ref: 'rmrk',		type:'output',  width:'400px',    style:'text-align:center'},

			{caption: ["seq"],		ref: 'sn',		hidden : true},
			{caption: ["apcCd"],	ref: 'apcCd',	hidden : true},
			{caption: ["행추가여부"],	ref: 'addYn',	hidden : true},
			//{caption: ["사업코드"],		ref: 'bizCd',	hidden : true},
		];

		grdFcltInstlInfo = _SBGrid.create(SBGridProperties);

	}
	/**
     * 목록 조회
     */
	const fn_search = async function() {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}

		let pageSize = grdFcltInstlInfo.getPageSize();
		let pageNo = 1;

		fn_selectFcltInstlInfoList(pageSize, pageNo);
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
	*/
	const fn_selectFcltInstlInfoList = async function(pageSize, pageNo) {
		console.log("******************fn_setGrdFcltInstlInfoList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		//let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltInstlInfoList.do", {
			apcCd: apcCd,
			//crtrYr: crtrYr,

			// pagination
			//pagingYn : 'N',
			//currentPageNo : pageNo,
			//recordCountPerPage : pageSize
		});
		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			jsonFcltInstlInfo.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				//console.log(item);
				let totVal = Number(item.ne) + Number(item.lcltExpndCtpv) + Number(item.lcltExpndSgg) + Number(item.slfBrdn);
				let itemVO = {
						sn				:item.sn
						,bizYr			:item.bizYr
						,apcCd			:item.apcCd
						,apcNm			:item.apcNm
						,sprtBiz		:item.sprtBiz
						,bizNm			:item.bizNm
						//,bizCd			:item.bizCd
						,ne				:item.ne
						,lcltExpndCtpv	:item.lcltExpndCtpv
						,lcltExpndSgg	:item.lcltExpndSgg
						,slfBrdn		:item.slfBrdn
						,addYn			:'N'
						//임시
						,tot : totVal
				}
				jsonFcltInstlInfo.push(itemVO);
			});

			if (jsonFcltInstlInfo.length > 0) {

				if(grdFcltInstlInfo.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdFcltInstlInfo.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdFcltInstlInfo.rebuild();
				}else{
					grdFcltInstlInfo.refresh()
				}
			} else {
				grdFcltInstlInfo.setPageTotalCount(totalRecordCount);
				grdFcltInstlInfo.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//그리드 초기화
	const fn_clearForm = function() {
		jsonFcltInstlInfo.length= 0;
		grdFcltInstlInfo.rebuild();
	}

	//등록
	const fn_save = async function() {
		//console.log("******************fn_save**********************************");

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		/*
		let yearArr = document.querySelectorAll("input[data-year='0']");
		yearArr.forEach(e => {
			if(e.value != "" && e.value.length != 4){
				alert("사업연도는 네자리로 작성해주세요. 예) 2023");
				result++;
				return e.focus();
			}
		});
		*/
		let grdData = grdFcltInstlInfo.getGridDataAll();
		for ( let iRow = 2; iRow <= grdData.length+1; iRow++ ) {
			const rowData = grdFcltInstlInfo.getRowData(iRow);
			//console.log(rowData);
			if (gfn_isEmpty(rowData.bizYr)) {
				gfn_comAlert("W0002", "사업년도");		//	W0002	{0}을/를 입력하세요.
				grdFcltInstlInfo.setRow(iRow);
				//grdFcltInstlInfo.setCol(grdFcltInstlInfo.getColRef("bizYr"));
				return;
			}
			//console.log(rowData.bizYr,rowData.bizYr.length);

			if (rowData.bizYr.length != 4) {
				alert("사업년도 값은 4자리 여야 합니다");		//	W0002	{0}을/를 입력하세요.
				grdFcltInstlInfo.setRow(iRow);
				//grdFcltInstlInfo.setCol(grdFcltInstlInfo.getColRef("bizYr"));
				return;
			}
			if (gfn_isEmpty(rowData.sprtBiz)) {
				gfn_comAlert("W0002", "지원유형");		//	W0002	{0}을/를 입력하세요.
				grdFcltInstlInfo.setRow(iRow);
				//grdFcltInstlInfo.setCol(grdFcltInstlInfo.getColRef("sprtBiz"));
				return;
			}
			if (gfn_isEmpty(rowData.bizNm)) {
				gfn_comAlert("W0002", "사업명");		//	W0002	{0}을/를 입력하세요.
				grdFcltInstlInfo.setRow(iRow);
				//grdFcltInstlInfo.setCol(grdFcltInstlInfo.getColRef("bizNm"));
				return;
			}
		}

		fn_subInsert(confirm("등록 하시겠습니까?") , 'N');
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let gridData = grdFcltInstlInfo.getGridDataAll();
		let saveList = [];

		let apcCd = SBUxMethod.get('srch-inp-apcCd');
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");//진척도 갱신용


		for(var i=2; i< gridData.length+2; i++ ){
			let rowData = grdFcltInstlInfo.getRowData(i);
			let rowSts = grdFcltInstlInfo.getRowStatus(i);

			rowData.apcCd = apcCd;
			rowData.crtrYr = crtrYr;
			rowData.prgrsYn = 'Y';//진척도 갱신 유무
			rowData.tmpChk = tmpChk; //임시저장 체크

			if (rowSts === 1){
				rowData.rowSts = "I";
				saveList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				saveList.push(rowData);
			} else if (rowSts === 3){
				rowData.rowSts = "I";
				saveList.push(rowData);
			} else {
				continue;
			}
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInstlInfoList.do", saveList);

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				fn_search();
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				cfn_allTabPrgrsRefrash();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
	}


	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = async function(apc) {
		fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}

	//지원사업 관리 팝업 버튼
	function fn_openMaodalBiz(){
		popBiz.init();
		SBUxMethod.openModal('modal-biz');
	}

	//지원사업 검색 팝업 버튼
	function fn_openMaodalBizSrch(){
		popBizSrch.init();
		SBUxMethod.openModal('modal-bizSrch');
	}

	function fn_addRow(){
		grdFcltInstlInfo.addRow(true, {addYn:'Y'});
	}
	function fn_deleteRow(){
		let delList = [];
		let delCnt = 0;
		let gridList = grdFcltInstlInfo.getGridDataAll();
		for (let i=gridList.length-1; i>-1; i--) {
			if (gridList[i].checked === "true") {
				if (gridList[i].addYn == 'N') {
					gridList[i].rowNum = i+2;
					delList.push(gridList[i]);
					delCnt++;
				}else{
					grdFcltInstlInfo.deleteRow(i+2);//테이블 해더가 2줄이면 +2
					delCnt++;
				}
			}
		}
		if(delList.length > 0){
			let rowStr = "";
			for (var i = 0; i < delList.length; i++) {
				rowStr += (delList[i].rowNum-1);
				if(delList.length != i+1){
					rowStr += ", ";
				}
			}
			let delMsg = rowStr + " 행은 기존 데이터 입니다. 삭제 하시겠습니까?";
			if(confirm(delMsg)){
				fn_deleteRsrc(delList);
				for (var i = 0; i < delList.length; i++) {
					grdFcltInstlInfo.deleteRow(delList[i].rowNum);
				}
			}
			return;
		}

		if (delCnt < 1) {
			gfn_comAlert("W0003", "삭제");	// W0003	{0}할 대상이 없습니다.
			return;
		}
	}

	async function fn_deleteRsrc(delList){
		//console.log(delList);
		let targetArr = [];

		for (var i = 0; i < delList.length; i++) {
			let valArr = {
					sn : delList[i].sn
					,apcCd : delList[i].apcCd
			}
			targetArr.push(valArr);
		}
		let postJsonPromise = gfn_postJSON("/fm/fclt/deleteFcltInstlInfoList.do", targetArr);
		let data = await postJsonPromise;
		try{
			//console.log(data);
			if (_.isEqual("S", data.resultStatus)) {
				alert("삭제 되었습니다.");
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

	/*	엑셀업로드	*/

	// 엑셀다운로드
	const fn_getExpColumns = function() {
		const _columns = [];
		_columns.push(
				//{caption: ["고유번호\n(중복값불가)","고유번호\n(중복값불가)"],			ref: 'sn',		type:'input',  width:'100px',    style:'text-align:center'
					//,typeinfo : {mask : {alias : 'numeric'}, maxlength : 4}},
				{caption: ["사업연도\n(YYYY\n4자리값으로)","사업연도\n(YYYY\n4자리값으로)"],		ref: 'bizYr',		type:'input',  width:'80px',    style:'text-align:center'
					,typeinfo : {mask : {alias : 'numeric'}, maxlength : 4}},
				{caption: ["지원유형\n(정부사업\n시도사업\n시군사업\n자부담)","지원유형\n(정부사업\n시도사업\n시군사업\n자부담)"],		ref: 'sprtBiz',		type:'combo',  width:'100px',    style:'text-align:center'
					,typeinfo : {ref:'jsonGrdComBizSprtCd', label:'label', value:'value', displayui : false}},
				//{caption: ["APC지원유형","APC지원유형"],				ref: 'apcBizSprt',		type:'combo',  width:'100px',    style:'text-align:center'
					//,typeinfo : {ref:'jsonGrdComBizSprtCd', label:'label', value:'value', displayui : false}},
				{caption: ["사업명\n(APC 건립지원사업 ,\n 밭작물공동경영체 육성사업 ,\n 과수거점산지유통센터 등)","사업명\n(APC 건립지원사업 ,\n 밭작물공동경영체 육성사업 ,\n 과수거점산지유통센터 등)"],	ref: 'bizNm',		type:'input',  width:'435px',    style:'text-align:center'},
				{caption: ["투자 사업비(백만원)","국고"],		ref: 'ne',			type:'input',  width:'120px',    style:'text-align:right'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
				{caption: ["투자 사업비(백만원)","지자체(시도)"],		ref: 'lcltExpndCtpv',	type:'input',  width:'120px',    style:'text-align:right'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
				{caption: ["투자 사업비(백만원)","지자체(시군구)"],		ref: 'lcltExpndSgg',	type:'input',  width:'120px',    style:'text-align:right'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
				{caption: ["투자 사업비(백만원)","자부담"],		ref: 'slfBrdn',		type:'input',  width:'120px',    style:'text-align:right'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		);

		return _columns;
	}

	/**
	 * @name fn_upload
	 * @description 엑셀 업로드 버튼 클릭
	 */
	const fn_upload = async function() {

		let apcCd = SBUxMethod.get("srch-inp-apcCd");

		if (gfn_isEmpty(apcCd)) {
			gfn_comAlert("W0001", "APC");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		popImp.init();

		const impColumns = fn_getExpColumns();
		//await fn_setSltJson();

		var SBGridProperties = {};
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = impColumns;
		SBGridProperties.rowheader="seq";
		SBGridProperties.fixedrowheight=45;
		popImp.importExcel(
				"지원사업 Import",
				SBGridProperties,
				fn_importExcel,
				fn_setDataAfterImport,
				fn_grdImpValueChanged
			);
		/*
		_title,
		_objSBGridProp,
		_saveFnc,
		_mappingFnc,
		_changedFnc,
		_callbackFnc
		*/
	}

	/**
	 * @name fn_importExcel
	 * @description 엑셀 업로드 저장
	 */
	const fn_importExcel = async function(_grdImp) {

		const bizList = [];

		let impData = _grdImp.getGridDataAll();

		console.log(impData);

		if (impData.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
		}

		let iCol = 0;

		//지원사업 리스트 등록할때 필요한 값
		let apcCd = SBUxMethod.get('srch-inp-apcCd');
		let apcNm = SBUxMethod.get('srch-inp-apcNm');

		/*
		let regMsg = "기존데이터를 삭제 처리 하시겠습니까?";
		if(confirm(regMsg)){
			//지원사업 리스트 삭제 처리
			await fn_deleteBizList(apcCd);
		}
		*/

		for ( let iRow = 2; iRow <= impData.length+1; iRow++ ) {
			const rowData = _grdImp.getRowData(iRow);
			console.log(rowData);
			// validation check
			if (gfn_isEmpty(rowData.bizYr)) {
				gfn_comAlert("W0002", "사업년도");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				_grdImp.setCol(_grdImp.getColRef("bizYr"));
				return;
			}
			console.log(rowData.bizYr,rowData.bizYr.length);
			if (rowData.bizYr.length != 4) {
				alert("사업년도 값은 4자리 여야 합니다");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				_grdImp.setCol(_grdImp.getColRef("bizYr"));
				return;
			}
			if (gfn_isEmpty(rowData.sprtBiz)) {
				gfn_comAlert("W0002", "지원유형");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				_grdImp.setCol(_grdImp.getColRef("sprtBiz"));
				return;
			}
			if (gfn_isEmpty(rowData.bizNm)) {
				gfn_comAlert("W0002", "사업명");		//	W0002	{0}을/를 입력하세요.
				_grdImp.setRow(iRow);
				_grdImp.setCol(_grdImp.getColRef("bizNm"));
				return;
			}

			rowData.apcCd = apcCd;
			rowData.apcNm = apcNm;

			rowData.prgrsYn = 'Y';//진척도 갱신 유무

			rowData.rowSts = "I";

			//저장할데이터
			const saveData = {
				//sn				:rowData.sn
				bizYr			:rowData.bizYr
				,apcCd			:rowData.apcCd
				,apcNm			:rowData.apcNm
				,sprtBiz		:rowData.sprtBiz
				,bizNm			:rowData.bizNm
				//,bizCd			:rowData.bizCd
				,ne				:rowData.ne
				,lcltExpndCtpv	:rowData.lcltExpndCtpv
				,lcltExpndSgg	:rowData.lcltExpndSgg
				,slfBrdn		:rowData.slfBrdn
			}

			bizList.push(saveData);
		}

		if (bizList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
		}

		if (!gfn_comConfirm("Q0001", "저장")) {
			return;
		}

		if(confirm("기존 데이터를 삭제 하시곘습니까?\n확인을 누를시 삭제 됩니다\n취소를 누를시 삭제 하지 않고 저장됩니다")){
			let delList = grdFcltInstlInfo.getGridDataAll();
			await fn_deleteRsrc(delList);
		}


		let postUrl = "/fm/fclt/insertFcltInstlInfoList.do";

		const postJsonPromise = await gfn_postJSON(postUrl, bizList);
		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				popImp.close();
				fn_search();
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
			}
		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * @name fn_setDataAfterImport
	 * @description afterimportexcel 이벤트
	 */
	const fn_setDataAfterImport = function(_grdImp) {
		//console.log("fn_setDataAfterImport");
		//console.log(_grdImp);
		let impData = _grdImp.getGridDataAll();

		const today = gfn_dateToYmd(new Date());

		const abnormalList = [];

		let falseCnt = 0;

		for ( let iRow = 1; iRow <= impData.length; iRow++ ) {

			const rowData = _grdImp.getRowData(iRow+1, false);	// deep copy
			console.log(rowData);
			if(typeof rowData == "undefined" || rowData == null || rowData == "" ){
				continue;
			}
			//숫자 4자리 확인
			const regex1 = /^\d{1,4}$/;
			//숫자 18자리 확인
			const regex2 = /^\d{1,18}$/;

			//순번 확인
			/*
			let snVal = rowData.sn;
			if(!gfn_isEmpty(snVal)){
				rowData.sn = fn_findMatchingValue(snVal,regex2);
			}
			*/
			//_grdImp.setCellStyle('background-color', iRow, nCol, iRow, nCol, 'lightpink');
			//_grdImp.getColRef("bizYr")
			//사업년도 확인
			let bizYrVal = rowData.bizYr;
			if(!gfn_isEmpty(bizYrVal)){
				rowData.bizYr = fn_findMatchingValue(bizYrVal,regex2);
			}
			//년도값 길이가 4가 아닌경우 색표기
			if(rowData.bizYr.length != 4){
				let nCol = _grdImp.getColRef("bizYr");
				_grdImp.setCellStyle('background-color', iRow+1, nCol, iRow+1, nCol, 'lightpink');
				falseCnt++;
			}


			//지원 유형 확인
			let sprtBizVal = rowData.sprtBiz;
			if(!gfn_isEmpty(sprtBizVal)){
				let valueArr = jsonGrdComBizSprtCd.filter((item) => item.value == sprtBizVal);
				let textArr = jsonGrdComBizSprtCd.filter((item) => item.text == sprtBizVal);
				//let labelArr = jsonGrdComBizSprtCd.filter((item) => item.label == sprtBizVal);
				if (valueArr.length > 0){

				}else if (textArr.length > 0){
					rowData.sprtBiz = textArr[0].value;
				}else{
					rowData.sprtBiz = null;
				}
			}

			//지원 유형이 비어있는경우 색표기
			if(gfn_isEmpty(rowData.sprtBiz)){
				let nCol = _grdImp.getColRef("sprtBiz");
				_grdImp.setCellStyle('background-color', iRow+1, nCol, iRow+1, nCol, 'lightpink');
				falseCnt++;
			}

			//사업명이 비어있는경우 색표기
			if(gfn_isEmpty(rowData.bizNm)){
				let nCol = _grdImp.getColRef("bizNm");
				_grdImp.setCellStyle('background-color', iRow+1, nCol, iRow+1, nCol, 'lightpink');
				falseCnt++;
			}

			//국고 확인
			let neVal = rowData.ne;
			if(!gfn_isEmpty(neVal)){
				rowData.ne = fn_findMatchingValue(neVal,regex2);
			}

			//지자체(시도) 확인
			let lcltExpndCtpvVal = rowData.lcltExpndCtpv;
			if(!gfn_isEmpty(lcltExpndCtpvVal)){
				rowData.lcltExpndCtpv = fn_findMatchingValue(lcltExpndCtpvVal,regex2);
			}

			//지자체(시군구) 확인
			let lcltExpndSggVal = rowData.lcltExpndSgg;
			if(!gfn_isEmpty(lcltExpndSggVal)){
				rowData.lcltExpndSgg = fn_findMatchingValue(lcltExpndSggVal,regex2);
			}

			//자부담 확인
			let slfBrdnVal = rowData.slfBrdn;
			if(!gfn_isEmpty(slfBrdnVal)){
				rowData.slfBrdn = fn_findMatchingValue(slfBrdnVal,regex2);
			}

			_grdImp.refresh({"combo":true, "focus":false});
		}
		_grdImp.refresh();
	}

	function fn_findMatchingValue(value, regex) {
		// 입력 값이 문자열이 아닌 경우 문자열로 변환
		const strValue = value.toString();

		// 정규 표현식 실행
		const match = strValue.match(regex);
		//console.log(match);

		let resultVal = match ? match[0] : null;

		if(match == null && typeof value == "number"){
			resultVal = Math.floor(value).toString();
		}

		// 일치하는 값이 있으면 반환, 없으면 null 반환
		return resultVal;
	}

	/**
     * @name fn_grdImpValueChanged
     * @description import 변경 event 처리
     * @function
     */
	const fn_grdImpValueChanged = function(_grdImp) {
		//valuechanged 이벤트
		console.log("fn_grdImpValueChanged");
		console.log(_grdImp);
		var nRow = _grdImp.getRow();
		var nCol = _grdImp.getCol();
	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			SBGridProperties.fixedrowheight=30;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			if(jsonExpUpload.length == 0){
				exp.sbGrid.addRow(true);
			}
		});
	}

	/*	엑셀 서식 받기	*/

	var grdExpUpload;			// 엑셀업로드 서식 그리드
	var jsonExpUpload 			= [];	// 엑셀업로드 서식 데이터

	//서식 다운로드
	const fn_dwnld = async function(dataChk){

		if(dataChk == "Y"){
			jsonExpUpload = jsonFcltInstlInfo;
		}

		const expColumns = fn_getExpColumns();
		const expObjList = [

			{
				sbGrid: grdExpUpload,
				parentid: "sbexp-area-grdExpUpload",
				id: "grdExpUpload",
				jsonref: "jsonExpUpload",
				columns: expColumns,
				sheetName: "지원사업 리스트",
				title: "",
				unit: ""
			}

		];

		await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드
		let fileName = "지원사업 리스트 엑셀 업로드 양식.xlsx"

		gfn_exportExcelMulti(fileName, expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		// 엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false,
			bSaveComboLabel: true
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		// 넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
			{"name": "arrSheetData", "value": JSON.stringify(dataList)},
			{"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
			{"name": "arrTitle", "value": JSON.stringify(titleList)},
			{"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}

</script>
</html>