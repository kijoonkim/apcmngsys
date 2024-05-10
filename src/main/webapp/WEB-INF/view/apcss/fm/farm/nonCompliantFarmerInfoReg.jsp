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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchfarm" name="btnSearchfarm" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSavefarm" name="btnSavefarm" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>

					<tbody>
						<tr>
							<th scope="row">농업인 번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-frmerno" name="srch-inp-frmerno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">경영체 등록번호</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-mngmstRegno" name="srch-inp-mngmstRegno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<td colspan="2" style="border-left: hidden;"></td>
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
					<div id="sb-area-grdNonCompliantFarmerInfoReg" style="height:300px; width: 100%;"></div>
				</div>

				<br>
					<div><label>생산농가 상세내역</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>APC 등록</caption>
					<colgroup>
						<col style="width: 35%">
						<col style="width: 65%">
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<th>내용</th>
						</tr>
						<tr>
							<th>농업인 번호</th>
							<td>
								<sbux-input id="dtl-input-frmerno" name="dtl-input-frmerno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>경영체 등록번호</th>
							<td>
								<sbux-input id="dtl-input-mngmstRegno" name="dtl-input-mngmstRegno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>농지 일련번호</th>
							<td>
								<sbux-input id="dtl-input-frlnSn" name="dtl-input-frlnSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>법정동코드</th>
							<td>
								<sbux-input id="dtl-input-stdgcd" name="dtl-input-stdgcd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>농지 본번</th>
							<td>
								<sbux-input id="dtl-input-frlnMno" name="dtl-input-frlnMno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>공동 경작 여부</th>
							<td>
								<sbux-input id="dtl-input-cprtnFrlnyn" name="dtl-input-cprtnFrlnyn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>농지 부번</th>
							<td>
								<sbux-input id="dtl-input-frlnSno" name="dtl-input-frlnSno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>농지 주소</th>
							<td>
								<sbux-input id="dtl-input-frlnAddr" name="dtl-input-frlnAddr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>경작 형태</th>
							<td>
								<sbux-input id="dtl-input-frlnType" name="dtl-input-frlnType" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>농지 소유자명</th>
							<td>
								<sbux-input id="dtl-input-frlnOwnrNm" name="dtl-input-frlnOwnrNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>공부 지목</th>
							<td>
								<sbux-input id="dtl-input-actlLdcg" name="dtl-input-actlLdcg" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>실제 지목</th>
							<td>
								<sbux-input id="dtl-input-poeLdcg" name="dtl-input-poeLdcg" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>공부 농지 면적</th>
							<td>
								<sbux-input id="dtl-input-actlFrlnarea" name="dtl-input-actlFrlnarea" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>실제 농지 면적</th>
							<td>
								<sbux-input id="dtl-input-poeFrlnarea" name="dtl-input-poeFrlnarea" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>휴경면적</th>
							<td>
								<sbux-input id="dtl-input-flwArea" name="dtl-input-flwArea" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>폐경면적</th>
							<td>
								<sbux-input id="dtl-input-ablFrlnarea" name="dtl-input-ablFrlnarea" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>품목코드</th>
							<td>
								<sbux-input id="dtl-input-itemCd" name="dtl-input-itemCd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>품목명</th>
							<td>
								<sbux-input id="dtl-input-itemNm" name="dtl-input-itemNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>노지/시설구분</th>
							<td>
								<sbux-input id="dtl-input-brgrndFcltSeCd" name="dtl-input-brgrndFcltSeCd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>재배변적</th>
							<td>
								<sbux-input id="dtl-input-frlnarea" name="dtl-input-frlnarea" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>대장 구분 코드</th>
							<td>
								<sbux-input id="dtl-input-ldgrSeCd" name="dtl-input-ldgrSeCd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>시설일련번호</th>
							<td>
								<sbux-input id="dtl-input-fcltSn" name="dtl-input-fcltSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>시설형태</th>
							<td>
								<sbux-input id="dtl-input-fcltShap" name="dtl-input-fcltShap" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>시설종류</th>
							<td>
								<sbux-input id="dtl-input-fcltKnd" name="dtl-input-fcltKnd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>시설면적</th>
							<td>
								<sbux-input id="dtl-input-fcltArea" name="dtl-input-fcltArea" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>시설설치년도</th>
							<td>
								<sbux-input id="dtl-input-fcltInstallYr" name="dtl-input-fcltInstallYr" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

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

	/**
	 * 조회 조건 select combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			//gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
			//gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),	// 품목
			//gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),	// 품종
			//gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,  	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록
		]);

		//SBUxMethod.set("dtl-rdo-gdsSeCd", '1');
	}


	var grdNonCompliantFarmerInfoReg; // 그리드를 담기위한 객체 선언
	var jsonNonCompliantFarmerInfoReg = []; // 그리드의 참조 데이터 주소 선언

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_farmMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_farmMngCreateGrid = async function() {



		SBUxMethod.set("farm-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdNonCompliantFarmerInfoReg';
		SBGridProperties.id = 'grdNonCompliantFarmerInfoReg';
		SBGridProperties.jsonref = 'jsonNonCompliantFarmerInfoReg';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		SBGridProperties.columns = [
			{caption: ["순번"], 			ref: 'sn',				type:'output',	 hidden : false },
			{caption: ["농업인 번호"], 		ref: 'frmerno',			type:'input',	 style:'text-align:center'},
			{caption: ["경영체 등록번호"], 	ref: 'bizYr',			type:'input',	 style:'text-align:center'},
			{caption: ["농지 일련번호"], 	ref: 'bizNm',			type:'input',	 style:'text-align:center'},
			{caption: ["법정동코드"], 		ref: 'vltnCn',			type:'input',	 style:'text-align:center'},
			{caption: ["농지 본번"], 		ref: 'sncnsBgngYr',		type:'input',	 style:'text-align:center'},
			{caption: ["공동 경작 여부"], 	ref: 'sncnsEndYr',		type:'input',	 style:'text-align:center'},
			{caption: ["농지 부번"], 		ref: 'rdmPrgrsCd',		type:'input',	 style:'text-align:center'},
			{caption: ["농지 주소"], 		ref: 'rdmTrgtPrncpl',	type:'input',	 style:'text-align:center'},
			{caption: ["경작 형태"], 		ref: 'rdmTrgtAmt',		type:'input',	 style:'text-align:center'},

			{caption: ["시스템최초입력일시"], 		ref: 'sysFrstInptDt',		type:'input',	 style:'text-align:center'},
			{caption: ["시스템최초입력사용자ID"], 	ref: 'sysFrstInptUserId',	type:'input',	 style:'text-align:center'},
			{caption: ["시스템최초입력프로그램ID"], 	ref: 'sysFrstInptPrgrmId',	type:'input',	 style:'text-align:center'},
			{caption: ["시스템최종변경일시"], 		ref: 'sysLastChgDt',		type:'input',	 style:'text-align:center'},
			{caption: ["시스템최종변경사용자ID"], 	ref: 'sysLastChgUserId',	type:'input',	 style:'text-align:center'},
			{caption: ["시스템최종변경프로그램ID"], 	ref: 'sysLastChgPrgrmId',	type:'input',	 style:'text-align:center'},
			{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				if(strValue== null || strValue == ""){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdInvShipOgnReqMng\", " + nRow + ", " + nCol + ")'>추가</button>";
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdInvShipOgnReqMng\", " + nRow + ")'>삭제</button>";
				}
			}}
		];

		grdNonCompliantFarmerInfoReg = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
		grdNonCompliantFarmerInfoReg.bind('click', 'fn_view');
		grdNonCompliantFarmerInfoReg.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	/**
	 * 목록 조회
	 */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdNonCompliantFarmerInfoReg.getPageSize();
		let pageNo = 1;
		//fn_clearForm();
		fn_searchfarmList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdNonCompliantFarmerInfoReg.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdNonCompliantFarmerInfoReg.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchfarmList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_searchfarmList = async function(pageSize, pageNo){
		let frmerno = SBUxMethod.get("srch-inp-frmerno");//
		let mngmstRegno = SBUxMethod.get("srch-inp-mngmstRegno");//

		let postJsonPromise = gfn_postJSON("/fm/farm/selectNonCompliantFarmerInfoRegList.do", {
			frmerno : frmerno
			,mngmstRegno : mngmstRegno

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
			,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonNonCompliantFarmerInfoReg.length = 0;
			let totalRecordCount = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let NonCompliantFarmerInfoRegVO = {
						frmerno 		: item.frmerno
						,bizYr 			: item.bizYr
						,bizNm 			: item.bizNm
						,vltnCn 		: item.vltnCn
						,sncnsBgngYr 	: item.sncnsBgngYr
						,sncnsEndYr 	: item.sncnsEndYr
						,rdmPrgrsCd 	: item.rdmPrgrsCd
						,rdmTrgtPrncpl 	: item.rdmTrgtPrncpl
						,rdmTrgtAmt 	: item.rdmTrgtAmt

						,sn 			: item.sn

						,sysFrstInptDt 			: item.sysFrstInptDt
						,sysFrstInptUserId 		: item.sysFrstInptUserId
						,sysFrstInptPrgrmId 	: item.sysFrstInptPrgrmId
						,sysLastChgDt 			: item.sysLastChgDt
						,sysLastChgUserId 		: item.sysLastChgUserId
						,sysLastChgPrgrmId 		: item.sysLastChgPrgrmId

						,delYn 				: item.delYn
				}
				jsonNonCompliantFarmerInfoReg.push(NonCompliantFarmerInfoRegVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonNonCompliantFarmerInfoReg.length > 0) {

				if(grdNonCompliantFarmerInfoReg.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdNonCompliantFarmerInfoReg.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdNonCompliantFarmerInfoReg.rebuild();
				}else{
					grdNonCompliantFarmerInfoReg.refresh()
				}
			} else {
				grdNonCompliantFarmerInfoReg.setPageTotalCount(totalRecordCount);
				grdNonCompliantFarmerInfoReg.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdNonCompliantFarmerInfoReg.rebuild();

			//비어 있는 마지막 줄 추가용도?
			//grdNonCompliantFarmerInfoReg.addRow();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//저장
	const fn_saveFmList = async function() {
		console.log("******************fn_save**********************************");

		let frmerno = SBUxMethod.get("srch-inp-frmerno");//
		let mngmstRegno = SBUxMethod.get("srch-inp-mngmstRegno");//

		if (!gfn_isEmpty(frmerno)) {
			alert("농업인 번호를 입력하세요.");
			return;
		}

		if (!gfn_isEmpty(mngmstRegno)) {
			alert("경영체 등록번호를 입력하세요.");
			return;
		}

		fn_subUpdate(confirm("저장 하시겠습니까?"));

	}

	/*생산농가 상세내역 수정*/
	const fn_subUpdate = async function (isConfirmed){
		console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

		const postJsonPromise = gfn_postJSON("/fm/farm/insertNonCompliantFarmerInfoReg.do", {
					frmerno: SBUxMethod.get('dtl-input-frmerno')
					, bizYr: SBUxMethod.get('dtl-input-bizYr')
					, bizNm: SBUxMethod.get('dtl-input-bizNm')
					, vltnCn: SBUxMethod.get('dtl-input-vltnCn')
					, sncnsBgngYr: SBUxMethod.get('dtl-input-sncnsBgngYr')
					, sncnsEndYr: SBUxMethod.get('dtl-input-sncnsEndYr')
					, rdmPrgrsCd: SBUxMethod.get('dtl-input-rdmPrgrsCd')
					, rdmTrgtPrncpl: SBUxMethod.get('dtl-input-rdmTrgtPrncpl')
					, rdmTrgtAmt: SBUxMethod.get('dtl-input-rdmTrgtAmt')
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


	/* Grid Row 추가 및 삭제 기능*/
	function fn_procRow(gubun, grid, nRow, nCol) {
		if (gubun === "ADD") {
			if (grid === "grdNonCompliantFarmerInfoReg") {
				grdNonCompliantFarmerInfoReg.setCellData(nRow, nCol, "N", true);
				grdNonCompliantFarmerInfoReg.addRow(true);
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdNonCompliantFarmerInfoReg") {
				if(grdNonCompliantFarmerInfoReg.getRowStatus(nRow) == 0 || grdNonCompliantFarmerInfoReg.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var NonCompliantFarmerInfoRegVO = grdNonCompliantFarmerInfoReg.getRowData(nRow);
						fn_deleteRsrc(NonCompliantFarmerInfoRegVO);
						grdNonCompliantFarmerInfoReg.deleteRow(nRow);
					}
				}else{
					grdNonCompliantFarmerInfoReg.deleteRow(nRow);
				}
			}
		}
	}

	async function fn_deleteRsrc(NonCompliantFarmerInfoRegVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deleteNonCompliantFarmerInfoReg.do", NonCompliantFarmerInfoRegVO);
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


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

	//상세정보 보기 클릭이벤트
	function fn_view() {
		console.log("******************fn_view**********************************");
		var nCol = grdNonCompliantFarmerInfoReg.getCol();
		//특정 열 부터 이벤트 적용
		if (nCol < 1) {
			return;
		}
		var nRow = grdNonCompliantFarmerInfoReg.getRow();
		if (nRow < 1) {
			return;
		}

		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdNonCompliantFarmerInfoReg.getRowData(nRow);
		console.log(rowData);

		SBUxMethod.set("dtl-input-frmerno", rowData.frmerno);
		SBUxMethod.set("dtl-input-bizYr", rowData.bizYr);
		SBUxMethod.set("dtl-input-bizNm", rowData.bizNm);
		SBUxMethod.set("dtl-input-vltnCn", rowData.vltnCn);
		SBUxMethod.set("dtl-input-sncnsBgngYr", rowData.sncnsBgngYr);
		SBUxMethod.set("dtl-input-sncnsEndYr", rowData.sncnsEndYr);
		SBUxMethod.set("dtl-input-rdmPrgrsCd", rowData.rdmPrgrsCd);
		SBUxMethod.set("dtl-input-rdmTrgtPrncpl", rowData.rdmTrgtPrncpl);
		SBUxMethod.set("dtl-input-rdmTrgtAmt", rowData.rdmTrgtAmt);

	}

</script>
</html>