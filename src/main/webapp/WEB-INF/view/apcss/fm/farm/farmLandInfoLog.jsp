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
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
					<div id="sb-area-grdfarmLandInfoLog" style="height:600px; width: 100%;"></div>
				</div>
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

	var grdfarmLandInfoLog; // 그리드를 담기위한 객체 선언
	var jsonfarmLandInfoLog = []; // 그리드의 참조 데이터 주소 선언

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdfarmLandInfoLog';
		SBGridProperties.id = 'grdfarmLandInfoLog';
		SBGridProperties.jsonref = 'jsonfarmLandInfoLog';
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
			{caption: ["순번"], 			ref: 'sn',   	type:'output',  hidden : false },
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

		];

		grdfarmLandInfoLog = _SBGrid.create(SBGridProperties);
		grdfarmLandInfoLog.bind('beforepagechanged', 'fn_pagingBbsList');

	}

	/**
	 * 목록 조회
	 */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdfarmLandInfoLog.getPageSize();
		let pageNo = 1;
		//fn_clearForm();
		fn_searchFcltList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdfarmLandInfoLog.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdfarmLandInfoLog.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchFcltList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(pageSize, pageNo){
		let frmerno = SBUxMethod.get("srch-inp-frmerno");//
		let mngmstRegNo = SBUxMethod.get("srch-inp-mngmstRegNo");//

		let postJsonPromise = gfn_postJSON("/fm/farm/selectFarmLandInfoLogList.do", {
			frmerno : frmerno
			,mngmstRegNo : mngmstRegNo

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
			,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonfarmLandInfoLog.length = 0;
			let totalRecordCount = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let farmLandInfoLogVO = {
					sn 					: item.sn
					,mngmstRegNo 		: item.mngmstRegNo
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
				jsonfarmLandInfoLog.push(farmLandInfoLogVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonfarmLandInfoLog.length > 0) {

				if(grdfarmLandInfoLog.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdfarmLandInfoLog.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdfarmLandInfoLog.rebuild();
				}else{
					grdfarmLandInfoLog.refresh()
				}
			} else {
				grdfarmLandInfoLog.setPageTotalCount(totalRecordCount);
				grdfarmLandInfoLog.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdfarmLandInfoLog.rebuild();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

</script>
</html>