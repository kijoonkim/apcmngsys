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
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
			</div>
			<div style="margin-left: auto;">
				<!--
				<sbux-button id="btnPop2" name="btnPop2" uitype="modal" target-id="modal-biz" onclick="fn_openMaodalBiz" text="지원사업관리" class="btn btn-sm btn-primary"></sbux-button>
				<sbux-button id="btnPop3" name="btnPop3" uitype="modal" target-id="modal-bizSrch" onclick="fn_openMaodalBizSrch" text="지원사업검색" class="btn btn-sm btn-primary"></sbux-button>
				 -->
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
						<sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-xs btn-outline-danger" onclick="fn_addRow"></sbux-button>
						&nbsp;
						<sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-xs btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
					</div>
				</div>
				<!-- SBGrid를 호출합니다. -->
				<div id="sb-area-grdFcltInstlInfo" style="height:450px; width: 100%;"></div>
			</div>
		</div>
	</section>
		<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
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
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		//let date = new Date();
		//let year  = date.getFullYear();
		//SBUxMethod.set("srch-inp-crtrYr", year);//trgtYr -> crtrYr 변경
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let apcCd = '0122';
		let crtrYr = '2023';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();
	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_fcltInstlInfoCreateGrid();
		await fn_selectFcltInstlInfoList();
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

	var jsonGrdComBizSprtCd = [];	//지원유형

	let test = [];

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('grdFcltInstlInfo', 	jsonGrdComBizSprtCd , 	'BIZ_SPRT_CD') 	//지원 유형
			//gfn_setComCdSBSelect('grdFcltInstlInfo', 	test , 	'BIZ_SPRT_CD') 	//지원 유형
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
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		//SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["체크박스","체크박스"], 	ref: 'checked', 	width: '40px', type: 'checkbox', style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
			{caption: ["사업연도","사업연도"],				ref: 'bizYr',		type:'input',  width:'80px',    style:'text-align:center'},
			{caption: ["지원유형","지원유형"],				ref: 'sprtBiz',		type:'combo',  width:'100px',    style:'text-align:center'
				,typeinfo : {ref:'jsonGrdComBizSprtCd', label:'label', value:'value', displayui : false}},
			{caption: ["APC지원유형","APC지원유형"],				ref: 'apcBizSprt',		type:'combo',  width:'100px',    style:'text-align:center'
					,typeinfo : {ref:'jsonGrdComBizSprtCd', label:'label', value:'value', displayui : false}},
			{caption: ["사업명","사업명"],				ref: 'bizNm',		type:'input',  width:'400px',    style:'text-align:center'},
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
			{caption: ["사업코드"],		ref: 'bizCd',	hidden : true},
		];

		grdFcltInstlInfo = _SBGrid.create(SBGridProperties);

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
			//trgtYr: crtrYr,

			// pagination
			pagingYn : 'N',
			currentPageNo : pageNo,
			recordCountPerPage : pageSize
		});
		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			jsonFcltInstlInfo.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				console.log(item);
				let itemVO = {
						sn				:item.sn
						,bizYr			:item.bizYr
						,apcCd			:item.apcCd
						,apcNm			:item.apcNm
						,sprtBiz		:item.sprtBiz
						,bizNm			:item.bizNm
						,bizCd			:item.bizCd
						,ne				:item.ne
						,lcltExpndCtpv	:item.lcltExpndCtpv
						,lcltExpndCtpv	:item.lcltExpndSgg
						,slfBrdn		:item.slfBrdn
						,addYn			:'N'
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



	//등록
	const fn_save = async function() {
		console.log("******************fn_save**********************************");

		let yearArr = document.querySelectorAll("input[data-year='0']");
		yearArr.forEach(e => {
			if(e.value != "" && e.value.length != 4){
				alert("사업연도는 네자리로 작성해주세요. 예) 2023");
				result++;
				return e.focus();
			}
		});
		//alert('준비중');
		fn_subInsert(confirm("등록 하시겠습니까?"));
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let gridData = grdFcltInstlInfo.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdFcltInstlInfo.getRowData(i);
			let rowSts = grdFcltInstlInfo.getRowStatus(i);

			rowData.prgrsYn = 'Y';//진척도 갱신 유무

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
				//fn_search();
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
	const fn_setApc = function(apc) {
		//console.log("======fn_setApc=======");
		//console.log(apc);
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//console.log("======fn_setApc====end===");
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
					gridList[i].rowNum = i+1;
					delList.push(gridList[i]);
					delCnt++;
				}else{
					grdBizPop.deleteRow(i+1);
					delCnt++;
				}
			}
		}
		if(delList.length > 0){
			let rowStr = "";
			for (var i = 0; i < delList.length; i++) {
				rowStr += delList[i].rowNum;
				if(!delList.length == i+1){
					rowStr += ", ";
				}
			}
			let delMsg = rowStr + " 행은 기존 데이터 입니다. 삭제 하시겠습니까?";
			if(confirm(delMsg)){
				fn_deleteRsrc(delList);
				for (var i = 0; i < delList.length; i++) {
					grdBizPop.deleteRow(delList[i].rowNum);
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
		console.log(delList);
		return;
		let postJsonPromise = gfn_postJSON("/pd/bsm/deleteUo.do", delList);
		let data = await postJsonPromise;
		try{
			if(data.result > 0){
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

</script>
</html>