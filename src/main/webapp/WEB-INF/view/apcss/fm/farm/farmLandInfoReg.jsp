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
									<sbux-input id="srch-inp-mngmstRegNo" name="srch-inp-mngmstRegNo" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
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
					<div id="sb-area-grdFarmLandInfoReg" style="height:300px; width: 100%;"></div>
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
								<sbux-input id="dtl-input-mngmstRegNo" name="dtl-input-mngmstRegNo" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
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


	var grdFarmLandInfoReg; // 그리드를 담기위한 객체 선언
	var jsonfarmLandInfoReg = []; // 그리드의 참조 데이터 주소 선언

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_farmMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_farmMngCreateGrid = async function() {



		SBUxMethod.set("farm-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdFarmLandInfoReg';
		SBGridProperties.id = 'grdFarmLandInfoReg';
		SBGridProperties.jsonref = 'jsonfarmLandInfoReg';
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
			{caption: ["농업인 번호"], 		ref: 'frmerno',	type:'input',  hidden : false},
			{caption: ["경영체 등록번호"], 	ref: 'mngmstRegNo',	type:'input',	 style:'text-align:center'},
			{caption: ["농지 일련번호"], 	ref: 'frlnSn',	type:'input',	 style:'text-align:center'},
			{caption: ["법정동코드"], 		ref: 'stdgcd',	type:'input',	 style:'text-align:center'},
			{caption: ["농지 본번"], 		ref: 'frlnMno',	type:'input',	 style:'text-align:center'},
			{caption: ["공동 경작 여부"], 	ref: 'cprtnFrlnyn',	type:'input',	 style:'text-align:center'},
			{caption: ["농지 부번"], 		ref: 'frlnSno',	type:'input',	 style:'text-align:center'},
			{caption: ["농지 주소"], 		ref: 'frlnAddr',	type:'input',	 style:'text-align:center'},
			{caption: ["경작 형태"], 		ref: 'frlnType',	type:'input',	 style:'text-align:center'},
			{caption: ["농지 소유자명"], 	ref: 'frlnOwnrNm',	type:'input',	 style:'text-align:center'},
			{caption: ["공부 지목"], 		ref: 'actlLdcg',	type:'input',	 style:'text-align:center'},
			{caption: ["실제 지목"], 		ref: 'poeLdcg',	type:'input',	 style:'text-align:center'},
			{caption: ["공부 농지 면적"], 	ref: 'actlFrlnarea',	type:'input',	 style:'text-align:center'},
			{caption: ["실제 농지 면적"], 	ref: 'poeFrlnarea',	type:'input',	 style:'text-align:center'},
			{caption: ["휴경면적"], 		ref: 'flwArea',	type:'input',	 style:'text-align:center'},
			{caption: ["폐경면적"], 		ref: 'ablFrlnarea',		type:'input',	 style:'text-align:center'},
			{caption: ["품목코드"], 		ref: 'itemCd',	type:'input',	 style:'text-align:center'},
			{caption: ["품목명"], 			ref: 'itemNm',	type:'input',	 style:'text-align:center'},
			{caption: ["노지/시설구분"], 	ref: 'brgrndFcltSeCd',	type:'input',	 style:'text-align:center'},
			{caption: ["재배변적"], 		ref: 'frlnarea',	type:'input',	 style:'text-align:center'},
			{caption: ["대장 구분 코드"], 	ref: 'ldgrSeCd',	type:'input',	 style:'text-align:center'},
			{caption: ["시설일련번호"], 		ref: 'fcltSn',	type:'input',	 style:'text-align:center'},
			{caption: ["시설형태"], 		ref: 'fcltShap',	type:'input',	 style:'text-align:center'},
			{caption: ["시설종류"], 		ref: 'fcltKnd',	type:'input',	 style:'text-align:center'},
			{caption: ["시설면적"], 		ref: 'fcltArea',	type:'input',	 style:'text-align:center'},
			{caption: ["시설설치년도"], 		ref: 'fcltInstallYr',			type:'input',	 style:'text-align:center'},
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

		grdFarmLandInfoReg = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
		grdFarmLandInfoReg.bind('click', 'fn_view');
		grdFarmLandInfoReg.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	/**
	 * 목록 조회
	 */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdFarmLandInfoReg.getPageSize();
		let pageNo = 1;
		//fn_clearForm();
		fn_searchfarmList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdFarmLandInfoReg.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdFarmLandInfoReg.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchfarmList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_searchfarmList = async function(pageSize, pageNo){
		let frmerno = SBUxMethod.get("srch-inp-frmerno");//
		let mngmstRegNo = SBUxMethod.get("srch-inp-mngmstRegNo");//

		let postJsonPromise = gfn_postJSON("/fm/farm/selectFarmLandInfoRegList.do", {
			frmerno : frmerno
			,mngmstRegNo : mngmstRegNo

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
			,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonfarmLandInfoReg.length = 0;
			let totalRecordCount = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let farmLandInfoRegVO = {
						mngmstRegNo 		: item.mngmstRegNo
						,frlnType 			: item.frlnType
						,cprtnFrlnyn 		: item.cprtnFrlnyn
						,frlnarea 			: item.frlnarea
						,brgrndFcltSeCd 	: item.brgrndFcltSeCd
						,fcltKnd 			: item.fcltKnd
						,fcltSn 			: item.fcltSn
						,fcltShap 			: item.fcltShap
						,fcltArea 			: item.fcltArea
						,frlnAddr 			: item.frlnAddr
						,frlnMno 			: item.frlnMno
						,frlnOwnrNm 		: item.frlnOwnrNm
						,frlnSno 			: item.frlnSno
						,frlnSn 			: item.frlnSn
						,frmerno 			: item.frmerno
						,fcltInstallYr 		: item.fcltInstallYr
						,ldgrSeCd 			: item.ldgrSeCd
						,stdgcd 			: item.stdgcd
						,flwArea 			: item.flwArea
						,ablFrlnarea 		: item.ablFrlnarea
						,poeFrlnarea 		: item.poeFrlnarea
						,poeLdcg 			: item.poeLdcg
						,itemCd 			: item.itemCd
						,itemNm 			: item.itemNm
						,actlFrlnarea 		: item.actlFrlnarea
						,actlLdcg 			: item.actlLdcg

						,sysFrstInptDt 			: item.sysFrstInptDt
						,sysFrstInptUserId 		: item.sysFrstInptUserId
						,sysFrstInptPrgrmId 	: item.sysFrstInptPrgrmId
						,sysLastChgDt 			: item.sysLastChgDt
						,sysLastChgUserId 		: item.sysLastChgUserId
						,sysLastChgPrgrmId 		: item.sysLastChgPrgrmId

						,delYn 				: item.delYn
				}
				jsonfarmLandInfoReg.push(farmLandInfoRegVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonfarmLandInfoReg.length > 0) {

				if(grdFarmLandInfoReg.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdFarmLandInfoReg.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdFarmLandInfoReg.rebuild();
				}else{
					grdFarmLandInfoReg.refresh()
				}
			} else {
				grdFarmLandInfoReg.setPageTotalCount(totalRecordCount);
				grdFarmLandInfoReg.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdFarmLandInfoReg.rebuild();

			//비어 있는 마지막 줄 추가용도?
			//grdFarmLandInfoReg.addRow();
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
		let mngmstRegNo = SBUxMethod.get("srch-inp-mngmstRegNo");//

		if (!gfn_isEmpty(frmerno)) {
			alert("농업인 번호를 입력하세요.");
			return;
		}

		if (!gfn_isEmpty(mngmstRegNo)) {
			alert("경영체 등록번호를 입력하세요.");
			return;
		}

		fn_subUpdate(confirm("저장 하시겠습니까?"));

	}

	/*생산농가 상세내역 수정*/
	const fn_subUpdate = async function (isConfirmed){
		console.log("******************fn_subUpdate**********************************");
		if (!isConfirmed) return;

		const postJsonPromise2 = gfn_postJSON("/fm/farm/updateFarmLandInfoReg.do", {
					mngmstRegNo: SBUxMethod.get('dtl-input-mngmstRegNo')
					, frlnType: SBUxMethod.get('dtl-input-frlnType')
					, cprtnFrlnyn: SBUxMethod.get('dtl-input-cprtnFrlnyn')
					, frlnarea: SBUxMethod.get('dtl-input-frlnarea')
					, brgrndFcltSeCd: SBUxMethod.get('dtl-input-brgrndFcltSeCd')
					, fcltKnd: SBUxMethod.get('dtl-input-fcltKnd')
					, fcltSn: SBUxMethod.get('dtl-input-fcltSn')
					, fcltShap: SBUxMethod.get('dtl-input-fcltShap')
					, fcltArea: SBUxMethod.get('dtl-input-fcltArea')
					, frlnAddr: SBUxMethod.get('dtl-input-frlnAddr')
					, frlnMno: SBUxMethod.get('dtl-input-frlnMno')
					, frlnOwnrNm: SBUxMethod.get('dtl-input-frlnOwnrNm')
					, frlnSno: SBUxMethod.get('dtl-input-frlnSno')
					, frlnSn: SBUxMethod.get('dtl-input-frlnSn')
					, frmerno: SBUxMethod.get('dtl-input-frmerno')
					, fcltInstallYr: SBUxMethod.get('dtl-input-fcltInstallYr')
					, ldgrSeCd: SBUxMethod.get('dtl-input-ldgrSeCd')
					, stdgcd: SBUxMethod.get('dtl-input-stdgcd')
					, flwArea: SBUxMethod.get('dtl-input-flwArea')
					, ablFrlnarea: SBUxMethod.get('dtl-input-ablFrlnarea')
					, poeFrlnarea: SBUxMethod.get('dtl-input-poeFrlnarea')
					, poeLdcg: SBUxMethod.get('dtl-input-poeLdcg')
					, itemCd: SBUxMethod.get('dtl-input-itemCd')
					, itemNm: SBUxMethod.get('dtl-input-itemNm')
					, actlFrlnarea: SBUxMethod.get('dtl-input-actlFrlnarea')
					, actlLdcg: SBUxMethod.get('dtl-input-actlLdcg')
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
			if (grid === "grdFarmLandInfoReg") {
				grdFarmLandInfoReg.setCellData(nRow, nCol, "N", true);
				grdFarmLandInfoReg.addRow(true);
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdFarmLandInfoReg") {
				if(grdFarmLandInfoReg.getRowStatus(nRow) == 0 || grdFarmLandInfoReg.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var farmLandInfoRegVO = grdFarmLandInfoReg.getRowData(nRow);
						fn_deleteRsrc(farmLandInfoRegVO);
						grdFarmLandInfoReg.deleteRow(nRow);
					}
				}else{
					grdFarmLandInfoReg.deleteRow(nRow);
				}
			}
		}
	}

	async function fn_deleteRsrc(farmLandInfoRegVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deleteFarmLandInfoReg.do", farmLandInfoRegVO);
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
		var nCol = grdFarmLandInfoReg.getCol();
		//특정 열 부터 이벤트 적용
		if (nCol < 1) {
			return;
		}
		var nRow = grdFarmLandInfoReg.getRow();
		if (nRow < 1) {
			return;
		}

		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdFarmLandInfoReg.getRowData(nRow);
		console.log(rowData);

		SBUxMethod.set("dtl-input-mngmstRegNo", rowData.mngmstRegNo);
		SBUxMethod.set("dtl-input-frlnType", rowData.frlnType);
		SBUxMethod.set("dtl-input-cprtnFrlnyn", rowData.cprtnFrlnyn);
		SBUxMethod.set("dtl-input-frlnarea", rowData.frlnarea);
		SBUxMethod.set("dtl-input-brgrndFcltSeCd", rowData.brgrndFcltSeCd);
		SBUxMethod.set("dtl-input-fcltKnd", rowData.fcltKnd);
		SBUxMethod.set("dtl-input-fcltSn", rowData.fcltSn);
		SBUxMethod.set("dtl-input-fcltShap", rowData.fcltShap);
		SBUxMethod.set("dtl-input-fcltArea", rowData.fcltArea);
		SBUxMethod.set("dtl-input-frlnAddr", rowData.frlnAddr);
		SBUxMethod.set("dtl-input-frlnMno", rowData.frlnMno);
		SBUxMethod.set("dtl-input-frlnOwnrNm", rowData.frlnOwnrNm);
		SBUxMethod.set("dtl-input-frlnSno", rowData.frlnSno);
		SBUxMethod.set("dtl-input-frlnSn", rowData.frlnSn);
		SBUxMethod.set("dtl-input-frmerno", rowData.frmerno);
		SBUxMethod.set("dtl-input-fcltInstallYr", rowData.fcltInstallYr);
		SBUxMethod.set("dtl-input-ldgrSeCd", rowData.ldgrSeCd);
		SBUxMethod.set("dtl-input-stdgcd", rowData.stdgcd);
		SBUxMethod.set("dtl-input-flwArea", rowData.flwArea);
		SBUxMethod.set("dtl-input-ablFrlnarea", rowData.ablFrlnarea);
		SBUxMethod.set("dtl-input-poeFrlnarea", rowData.poeFrlnarea);
		SBUxMethod.set("dtl-input-poeLdcg", rowData.poeLdcg);
		SBUxMethod.set("dtl-input-itemCd", rowData.itemCd);
		SBUxMethod.set("dtl-input-itemNm", rowData.itemNm);
		SBUxMethod.set("dtl-input-actlFrlnarea", rowData.actlFrlnarea);
		SBUxMethod.set("dtl-input-actlLdcg", rowData.actlLdcg);
	}

</script>
</html>