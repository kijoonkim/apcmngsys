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
					<div id="sb-area-grdFarmerEducationInfoReg" style="height:300px; width: 100%;"></div>
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
							<th>교육과정코드</th>
							<td>
								<sbux-input id="dtl-input-crclmCd" name="dtl-input-crclmCd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td>
								<sbux-input id="dtl-input-flNm" name="dtl-input-flNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>교육기관명</th>
							<td>
								<sbux-input id="dtl-input-ednstNm" name="dtl-input-ednstNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>교육과정명</th>
							<td>
								<sbux-input id="dtl-input-crclmNm" name="dtl-input-crclmNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>교육시작일자</th>
							<td>
								<sbux-input id="dtl-input-eduBgngYmd" name="dtl-input-eduBgngYmd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>교육종료일자</th>
							<td>
								<sbux-input id="dtl-input-eduEndYmd" name="dtl-input-eduEndYmd" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
						<tr>
							<th>확인여부</th>
							<td>
								<sbux-input id="dtl-input-idntyYn" name="dtl-input-idntyYn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
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


	var grdFarmerEducationInfoReg; // 그리드를 담기위한 객체 선언
	var jsonFarmerEducationInfoReg = []; // 그리드의 참조 데이터 주소 선언

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_farmMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_farmMngCreateGrid = async function() {



		SBUxMethod.set("farm-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdFarmerEducationInfoReg';
		SBGridProperties.id = 'grdFarmerEducationInfoReg';
		SBGridProperties.jsonref = 'jsonFarmerEducationInfoReg';
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
			{caption: ["sn"], 			ref: 'sn',				type:'input',  hidden : true},
			{caption: ["농업인 번호"], 		ref: 'frmerno',			type:'input',	 style:'text-align:center'},
			{caption: ["사업 시작일"], 		ref: 'bizBgngYmd',		type:'input',	 style:'text-align:center'},
			{caption: ["사업 종료일"], 		ref: 'bizEndYmd',		type:'input',	 style:'text-align:center'},
			{caption: ["관할기관"], 		ref: 'cmptncInst',		type:'input',	 style:'text-align:center'},
			{caption: ["사업 코드"], 		ref: 'bizCd',			type:'input',	 style:'text-align:center'},
			{caption: ["사업 명"], 		ref: 'bizNm',			type:'input',	 style:'text-align:center'},
			{caption: ["수혜자 명"], 		ref: 'rcfvrsNm',		type:'input',	 style:'text-align:center'},
			{caption: ["국고 융자"], 		ref: 'govFnncng',		type:'input',	 style:'text-align:center'},
			{caption: ["지방비 융자"], 		ref: 'lcLtExpndFnncng',	type:'input',	 style:'text-align:center'},
			{caption: ["국고 보조금"], 		ref: 'govSbsds',		type:'input',	 style:'text-align:center'},
			{caption: ["지방비 보조금"], 	ref: 'lcltExpndSbsds',	type:'input',	 style:'text-align:center'},
			{caption: ["처리 시스템"], 		ref: 'prcsSys',			type:'input',	 style:'text-align:center'},

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

		grdFarmerEducationInfoReg = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
		grdFarmerEducationInfoReg.bind('click', 'fn_view');
		grdFarmerEducationInfoReg.bind('beforepagechanged', 'fn_pagingBbsList');
	}

	/**
	 * 목록 조회
	 */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdFarmerEducationInfoReg.getPageSize();
		let pageNo = 1;
		//fn_clearForm();
		fn_searchfarmList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdFarmerEducationInfoReg.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdFarmerEducationInfoReg.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchfarmList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_searchfarmList = async function(pageSize, pageNo){
		let frmerno = SBUxMethod.get("srch-inp-frmerno");//
		let mngmstRegno = SBUxMethod.get("srch-inp-mngmstRegno");//

		let postJsonPromise = gfn_postJSON("/fm/farm/selectFarmerEducationInfoRegList.do", {
			frmerno : frmerno
			,mngmstRegno : mngmstRegno

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
			,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonFarmerEducationInfoReg.length = 0;
			let totalRecordCount = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let farmLandInfoRegVO = {
						frmerno 			: item.frmerno
						,bizBgngYmd 		: item.bizBgngYmd
						,bizEndYmd 			: item.bizEndYmd
						,cmptncInst 		: item.cmptncInst
						,bizCd 				: item.bizCd
						,bizNm 				: item.bizNm
						,rcfvrsNm 			: item.rcfvrsNm
						,govFnncng 			: item.govFnncng
						,lcLtExpndFnncng 	: item.lcLtExpndFnncng
						,govSbsds 			: item.govSbsds
						,lcltExpndSbsds 	: item.lcltExpndSbsds
						,prcsSys 			: item.prcsSys
						,sn 				: item.sn

						,sysFrstInptDt 			: item.sysFrstInptDt
						,sysFrstInptUserId 		: item.sysFrstInptUserId
						,sysFrstInptPrgrmId 	: item.sysFrstInptPrgrmId
						,sysLastChgDt 			: item.sysLastChgDt
						,sysLastChgUserId 		: item.sysLastChgUserId
						,sysLastChgPrgrmId 		: item.sysLastChgPrgrmId

						,delYn 				: item.delYn
				}
				jsonFarmerEducationInfoReg.push(farmLandInfoRegVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonFarmerEducationInfoReg.length > 0) {

				if(grdFarmerEducationInfoReg.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdFarmerEducationInfoReg.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdFarmerEducationInfoReg.rebuild();
				}else{
					grdFarmerEducationInfoReg.refresh()
				}
			} else {
				grdFarmerEducationInfoReg.setPageTotalCount(totalRecordCount);
				grdFarmerEducationInfoReg.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdFarmerEducationInfoReg.rebuild();

			//비어 있는 마지막 줄 추가용도?
			//grdFarmerEducationInfoReg.addRow();
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

		const postJsonPromise = gfn_postJSON("/fm/farm/insertFarmerEducationInfoReg.do", {
					frmerno: SBUxMethod.get('dtl-input-frmerno')
					, bizBgngYmd: SBUxMethod.get('dtl-input-bizBgngYmd')
					, bizEndYmd: SBUxMethod.get('dtl-input-bizEndYmd')
					, cmptncInst: SBUxMethod.get('dtl-input-cmptncInst')
					, bizCd: SBUxMethod.get('dtl-input-bizCd')
					, bizNm: SBUxMethod.get('dtl-input-bizNm')
					, rcfvrsNm: SBUxMethod.get('dtl-input-rcfvrsNm')
					, govFnncng: SBUxMethod.get('dtl-input-govFnncng')
					, lcLtExpndFnncng: SBUxMethod.get('dtl-input-lcLtExpndFnncng')
					, govSbsds: SBUxMethod.get('dtl-input-govSbsds')
					, lcltExpndSbsds: SBUxMethod.get('dtl-input-lcltExpndSbsds')
					, prcsSys: SBUxMethod.get('dtl-input-idntyYn')

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
			if (grid === "grdFarmerEducationInfoReg") {
				grdFarmerEducationInfoReg.setCellData(nRow, nCol, "N", true);
				grdFarmerEducationInfoReg.addRow(true);
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdFarmerEducationInfoReg") {
				if(grdFarmerEducationInfoReg.getRowStatus(nRow) == 0 || grdFarmerEducationInfoReg.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var farmLandInfoRegVO = grdFarmerEducationInfoReg.getRowData(nRow);
						fn_deleteRsrc(farmLandInfoRegVO);
						grdFarmerEducationInfoReg.deleteRow(nRow);
					}
				}else{
					grdFarmerEducationInfoReg.deleteRow(nRow);
				}
			}
		}
	}

	async function fn_deleteRsrc(farmLandInfoRegVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deleteFarmerEducationInfoReg.do", farmLandInfoRegVO);
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
		var nCol = grdFarmerEducationInfoReg.getCol();
		//특정 열 부터 이벤트 적용
		if (nCol < 1) {
			return;
		}
		var nRow = grdFarmerEducationInfoReg.getRow();
		if (nRow < 1) {
			return;
		}

		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdFarmerEducationInfoReg.getRowData(nRow);
		console.log(rowData);

		SBUxMethod.set("dtl-input-frmerno", rowData.frmerno);
		SBUxMethod.set("dtl-input-mngmstRegno", rowData.mngmstRegno);
		SBUxMethod.set("dtl-input-crclmCd", rowData.crclmCd);
		SBUxMethod.set("dtl-input-flNm", rowData.flNm);
		SBUxMethod.set("dtl-input-ednstNm", rowData.ednstNm);
		SBUxMethod.set("dtl-input-crclmNm", rowData.crclmNm);
		SBUxMethod.set("dtl-input-eduBgngYmd", rowData.eduBgngYmd);
		SBUxMethod.set("dtl-input-eduEndYmd", rowData.eduEndYmd);
		SBUxMethod.set("dtl-input-idntyYn", rowData.idntyYn);

	}

</script>
</html>