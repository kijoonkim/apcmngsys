<%
/**
 * @Class Name : dvlpPrgrsMng.jsp
 * @Description : 프로그램개발진척관리 화면
 * @author SI개발부
 * @since 2023.12.12
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.12.12 김현호		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 프로그램개발진척관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnExcel" name="btnExcel" uitype="normal" text="Excel" class="btn btn-sm btn-outline-danger" onclick="dvlpPrgs.exportExcel"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="dvlpPrgs.searchAll"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="dvlpPrgs.save"></sbux-button>
				</div>
			</div>

			<div class="box-body">

				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

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
							<th scope="row" class="th_bg" >기준일자</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-datepicker id="srch-dtp-dvlpPlanYmd" name="srch-dtp-dvlpPlanYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >상태</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-select id="srch-slt-stts" name="srch-slt-stts" uitype="single" jsondata-ref="jsonComStts" unselected-text="전체" class="form-control input-sm"></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">분류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-clsf" name="srch-slt-clsf" uitype="single" jsondata-ref="jsonComClsf" unselected-text="전체" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">프로그램명</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-prgrmNm" name="srch-inp-prgrmNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">담당자</th>
							<td  class="td_input" style="border-right:hidden;">
								<sbux-select id="srch-slt-pic" name="srch-slt-pic" uitype="single" jsondata-ref="jsonComPic" unselected-text="전체" class="form-control input-sm"></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<br>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdDvlpPrgrs" style="width:100%;height:450px;"></div>
				</div>
				<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdDfct" style="width:100%;height:125px;"></div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 출하매출단가 등록 Modal -->
    <div>
        <sbux-modal id="modal-dfctMng" name="modal-dfctMng" uitype="middle" header-title="검토요청관리" body-html-id="body-modal-dfctMng" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-dfctMng">
    	<jsp:include page="../pms/dfctPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonDvplPrgrs 		= []; 	// 그리드
	var jsonComStts			= [];	// 상태 		stts	검색
	var jsonComClsf			= [];	// 분류 		clsf	검색
	var jsonComPic			= [];	// 담당자 		pic		검색
	var jsonGrdStts			= [];	// 상태 		stts	그리드
	var jsonGrdClsf			= [];	// 분류 		clsf	그리드
	var jsonGrdPic			= [];	// 담당자 		pic		그리드
	var grdDvlpPrgs = null;
	var grdDfct = null;

	window.addEventListener('DOMContentLoaded', function(e) {
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-dvlpPlanYmd", year+month+day);

		dvlpPrgs.init();
	})


	const dvlpPrgs = {

		gridId: 'grdDvlpPrgs',
		jsonId: 'jsonDvlpPrgs',
		areaId: "sb-area-grdDvlpPrgrs",
		gridIdDfct: 'grdDfct',
		jsonIdDfct: 'jsonDfct',
		areaIdDfct: "sb-area-grdDfct",
		init: async function() {

			if (grdDvlpPrgs === null) {
				let rst = await Promise.all([
					gfn_setComCdSBSelect('srch-slt-stts', 	jsonComStts, 'DFCT_STTS'),	// 상태(검색)
					gfn_setComCdSBSelect('srch-slt-clsf', 	jsonComClsf, 'DFCT_CLSF'),	// 분류(검색)
					gfn_setComCdSBSelect('srch-slt-pic', 	jsonComPic, 'PIC'),			// 담당자(검색)
					gfn_setComCdGridSelect('grdDvlpPrgs', 	jsonGrdStts, "DFCT_STTS", "0000"),	// 상태(그리드)
					gfn_setComCdGridSelect('grdDvlpPrgs', 	jsonGrdClsf, "DFCT_CLSF", "0000"),	// 분류(그리드)
					gfn_setComCdGridSelect('grdDvlpPrgs', 	jsonGrdPic, "PIC", "0000")			// 담당자(그리드)
				]);
				this.createGrid();
				this.createGridDfct();
				this.search();
				this.searchDfct();
			} else {
				this.search();
				this.searchDfct();
			}
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;
		    SBGridProperties.id = this.gridId;
		    SBGridProperties.jsonref = this.jsonId;
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.clickeventarea = {fixed: true, empty: false};
		    SBGridProperties.columns = [
		    	{caption: ["상태"], 		ref: 'stts',   			type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdStts', label:'label', value:'value', displayui : false}},
		    	{caption: ["분류"], 		ref: 'clsf',   			type:'combo',  width:'100px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdClsf', label:'label', value:'value', displayui : false}},
		        {caption: ['완료구분'], 	ref: 'dvlpStts', 		width: '80px', type: 'output', style:'text-align:center'},
		        {caption: ['프로그램명'], 	ref: 'prgrmNm', 		width: '300px', type: 'output', style:'text-align:left'},
		        {caption: ['개발계획'], 	ref: 'dvlpPlanYmd', 	width: '100px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}, style:'text-align:center'},
		        {caption: ['개발완료'], 	ref: 'dvlpCmptnYmd', 	width: '100px',	type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}, style:'text-align:center'},
		        {caption: ['테스트계획'], 	ref: 'testPlanYmd', 	width: '100px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}, style:'text-align:center'},
		        {caption: ['테스트완료'], 	ref: 'testCmptnYmd', 	width: '100px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}, style:'text-align:center'},
		        {caption: ['담당자'], 		ref: 'pic', 			width: '100px', type: 'output', style:'text-align:center'},
		        {caption: ['검토요청'], 	ref: 'dfctCnt', 		width: '100px', type: 'output', style:'color:red; text-align:center',  format : {type:'number', rule:'#,###'}},
		        {caption: ['조치완료'], 	ref: 'actnCnt', 		width: '100px', type: 'output', style:'text-align:center', format : {type:'number', rule:'#,###'}},
		        {caption: ['최종변경일시'], ref: 'sysLastChgDt', 	width: '120px', type: 'output', style:'text-align:center'},
		        {caption: ['비고'], 		ref: 'rmrk', 			width: '150px', type: 'input', style:'text-align:center'},
		        {caption: ['프로그램ID'], 	ref: 'prgrmId', 	hidden : true}
		    ];

		    grdDvlpPrgs = _SBGrid.create(SBGridProperties);
		    grdDvlpPrgs.bind('click','fn_modalClick');
		},
		exportExcel: function() {
			/*
			datagrid.exportData(param1, param2, param3, param4);
			param1(필수)[string]: 다운 받을 파일 형식
			param2(필수)[string]: 다운 받을 파일 제목
			param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
			→ true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
			→ false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
			param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
			→ arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
			→ combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
			→ true : label 값으로 저장
			→ false : value 값으로 저장
			→ sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
			 */
			grdDvlpPrgs.exportData(
						"xlsx",
						"프로그램개발진척관리",
						true,
						true
					);

		},
		save: async function() {
			let allData = grdDvlpPrgs.getGridDataAll();
			const updateList = [];
			let updateCnt = 0;


			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdDvlpPrgs.getRowData(i);
				const rowSts = grdDvlpPrgs.getRowStatus(i);
				if (rowSts === 2){
					updateList.push(rowData);
				} else {
					continue;
				}
			}

			if (updateList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}
			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/co/pms/updateDvlpPrgrsMngList.do", updateList);

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.searchAll();
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }

		},
		search: async function() {
			// set pagination
			grdDvlpPrgs.rebuild();

	    	// grid clear
	    	jsonDvlpPrgs.length = 0;
	    	grdDvlpPrgs.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {

	    	let dvlpPlanYmd = SBUxMethod.get("srch-dtp-dvlpPlanYmd");
	    	let stts = SBUxMethod.get("srch-slt-stts");
	    	let clsf = SBUxMethod.get("srch-slt-clsf");
	    	let prgrmNm = SBUxMethod.get("srch-inp-prgrmNm");
	    	let pic = SBUxMethod.get("srch-slt-pic");

	        const postJsonPromise = gfn_postJSON("/co/pms/selectDvlpPrgrsMngList.do", {
	        	dvlpPlanYmd	: dvlpPlanYmd,
	        	stts		: stts,
	        	clsf		: clsf,
	        	prgrmNm		: prgrmNm,
	        	pic			: pic,
			});

	        const data = await postJsonPromise;

			try {

	    		jsonDvlpPrgs.length = 0;
	        	data.resultList.forEach((item, index) => {
					const dvlpPrgs = {
						stts			: item.stts,
						clsf			: item.clsf,
						prgrmNm			: item.prgrmNm,
						prgrmId			: item.prgrmId,
						dvlpPlanYmd		: item.dvlpPlanYmd,
						dvlpCmptnYmd	: item.dvlpCmptnYmd,
						testPlanYmd		: item.testPlanYmd,
						testCmptnYmd	: item.testCmptnYmd,
						pic				: item.pic,
						dfctCnt			: item.dfctCnt,
						actnCnt			: item.actnCnt,
						sysLastChgDt	: item.sysLastChgDt,
					    rmrk 			: item.rmrk,
					    dvlpStts 		: item.dvlpStts
					}
					jsonDvlpPrgs.push(dvlpPrgs);

				});

        		grdDvlpPrgs.rebuild();

	        	grdDvlpPrgs.setCellDisabled(0, 0, grdDvlpPrgs.getRows() - 1, 1, true);

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    createGridDfct: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaIdDfct;
		    SBGridProperties.id = this.gridIdDfct;
		    SBGridProperties.jsonref = this.jsonIdDfct;
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'free';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.clickeventarea = {fixed: true, empty: false};
		    SBGridProperties.columns = [
		    	{caption: [''], 			ref: 'gb', 		width: '130px', type: 'output', style:'text-align:center'},
		    	{caption: ['전체'], 		ref: 'tot', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['개발대상'], 	ref: 'cnt1', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['개발완료'], 	ref: 'cnt2', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['개발지연'], 	ref: 'cnt3', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['개발진도'], 	ref: 'per1', 	width: '130px',	type: 'output', style:'text-align:center;background:#FFF8DC;'},
		        {caption: ['시험대상'], 	ref: 'cnt4', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['시험완료'], 	ref: 'cnt5', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['시험지연'], 	ref: 'cnt6', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['시험진도'], 	ref: 'per2', 	width: '130px', type: 'output', style:'text-align:center;background:#FFF8DC;'},
		        {caption: ['검토요청'], 	ref: 'cnt7', 	width: '130px', type: 'output', style:'text-align:center'},
		        {caption: ['조치완료'], 	ref: 'cnt8', 	width: '130px', type: 'output', style:'text-align:center'},
		    ];

		    grdDfct = _SBGrid.create(SBGridProperties);
		},
		searchDfct: async function() {
			// set pagination
			grdDfct.rebuild();

	    	// grid clear
	    	jsonDfct.length = 0;
	    	grdDfct.refresh();
	    	this.setGridDfct();
		},
		setGridDfct: async function() {

	    	let dvlpPlanYmd = SBUxMethod.get("srch-dtp-dvlpPlanYmd");

	        const postJsonPromise = gfn_postJSON("/co/pms/selectDfct.do", {
	        	dvlpPlanYmd	: dvlpPlanYmd
			});

	        const data = await postJsonPromise;

			try {
	    		jsonDfct.length = 0;
	        	data.resultList.forEach((item, index) => {
					const dfct = {
						gb			: item.gb,
						cnt1		: item.cnt1,
						cnt2		: item.cnt2,
						cnt3		: item.cnt3,
						per1		: item.per1,
						cnt4		: item.cnt4,
						cnt5		: item.cnt5,
						cnt6		: item.cnt6,
						per2		: item.per2,
						cnt7		: item.cnt7,
						cnt8		: item.cnt8,
						tot			: item.tot
					}
					jsonDfct.push(dfct);
				});
        		grdDfct.rebuild();
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    searchAll: async function() {
	    	this.search();
	    	this.searchDfct();
	    }

	}

	function fn_modalClick(){
		var nRow = grdDvlpPrgs.getRow();
		var nCol = grdDvlpPrgs.getCol();
		var rowData = grdDvlpPrgs.getRowData(nRow);

		if(nCol == 9 && nRow != 0){
			SBUxMethod.openModal('modal-dfctMng');
			SBUxMethod.set("dtl-inp-prgrmNm", rowData.prgrmNm);
			SBUxMethod.set("dtl-inp-prgrmId", rowData.prgrmId);
			SBUxMethod.set("dtl-inp-pic", rowData.pic);
			dfctPopup.init(rowData);
		}
	}

</script>
</html>