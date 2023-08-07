<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="dvlpPrgs.search"></sbux-button>
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
							<td colspan="" class="td_input" style="border-right:hidden;" >
								<sbux-datepicker id="srch-dtp-dvlpPlanYmd" name="srch-dtp-dvlpPlanYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >상태</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-select id="srch-slt-stts" name="srch-slt-stts" uitype="single" jsondata-ref="jsonComStts" unselected-text="전체" class="form-control input-sm"  ></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">분류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-clsf" name="srch-slt-clsf" uitype="single" jsondata-ref="jsonComClsf" unselected-text="전체" class="form-control input-sm"  ></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">프로그램명</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-prgrmNm" name="srch-inp-prgrmNm" uitype="text"></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">담당자</th>
							<td  class="td_input" style="border-right:hidden;">
								<sbux-select id="srch-slt-pic" name="srch-slt-pic" uitype="single" jsondata-ref="jsonComPic" unselected-text="전체" class="form-control input-sm" ></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<br>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdDvlpPrgrs" style="width:100%;height:550px;"></div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 출하매출단가 등록 Modal -->
    <div>
        <sbux-modal id="modal-dfctMng" name="modal-dfctMng" uitype="middle" header-title="출하 매출단가 등록" body-html-id="body-modal-dfctMng" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
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

	window.addEventListener('DOMContentLoaded', function(e) {
		dvlpPrgs.init();
	})


	const dvlpPrgs = {

		gridId: 'grdDvlpPrgs',
		jsonId: 'jsonDvlpPrgs',
		areaId: "sb-area-grdDvlpPrgrs",
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
				this.search();
			} else {
				this.search();
			}
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 1000,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		    	{caption: ["상태"], 		ref: 'stts',   			type:'combo',  width:'120px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdStts', label:'label', value:'value', displayui : false}},
		    	{caption: ["분류"], 		ref: 'clsf',   			type:'combo',  width:'120px',    style:'text-align:center',
					typeinfo : {ref:'jsonGrdClsf', label:'label', value:'value', displayui : false}},
		        {caption: ['완료구분'], 	ref: 'dvlpStts', 		width: '80px', type: 'output', style:'text-align:center'},
		        {caption: ['프로그램명'], 	ref: 'prgrmNm', 		width: '300px', type: 'output', style:'text-align:center'},
		        {caption: ['개발계획'], 	ref: 'dvlpPlanYmd', 	width: '150px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  style:'text-align:center'},
		        {caption: ['개발완료'], 	ref: 'dvlpCmptnYmd', 	width: '150px',	type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  style:'text-align:center'},
		        {caption: ['테스트계획'], 	ref: 'testPlanYmd', 	width: '150px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  style:'text-align:center'},
		        {caption: ['테스트완료'], 	ref: 'testCmptnYmd', 	width: '150px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  style:'text-align:center'},
		        {caption: ['담당자'], 		ref: 'pic', 			width: '100px', type: 'output', style:'text-align:center'},
		        {caption: ['결함'], 		ref: 'dfctCnt', 		width: '100px', type: 'output', style:'text-align:center;', format : {type:'number', rule:'#,###'}},
		        {caption: ['완료'], 		ref: 'actnCnt', 		width: '100px', type: 'output', style:'text-align:center', format : {type:'number', rule:'#,###'}},
		        {caption: ['최종변경일시'], ref: 'sysLastChgDt', 	width: '120px', type: 'output', style:'text-align:center'},
		        {caption: ['프로그램ID'], 	ref: 'prgrmId', 	hidden : true}
		    ];

		    grdDvlpPrgs = _SBGrid.create(SBGridProperties);
		    grdDvlpPrgs.bind('click','fn_modalClick');
		    grdDvlpPrgs.bind('beforepagechanged', 'fn_paging');
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
	        		this.search();
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	        }

		},
		search: async function() {
			// set pagination
			grdDvlpPrgs.rebuild();
	    	let pageSize = grdDvlpPrgs.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonDvlpPrgs.length = 0;
	    	grdDvlpPrgs.refresh();
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {

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
	        	// pagination
		  		pagingYn 	: 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

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

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonDvlpPrgs.length > 0) {
	        		if(grdDvlpPrgs.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdDvlpPrgs.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdDvlpPrgs.rebuild();
					}else{
						grdDvlpPrgs.refresh();
					}
	        	} else {
	        		grdDvlpPrgs.setPageTotalCount(totalRecordCount);
	        		grdDvlpPrgs.rebuild();
	        	}

	        	grdDvlpPrgs.setCellDisabled(0, 0, grdDvlpPrgs.getRows() - 1, 1, true);
	        	grdDvlpPrgs.setCellStyle('color', 1, 9, grdDvlpPrgs.getRows() - 1, 9, 'red');

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let pageSize = grdDvlpPrgs.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let pageNo = grdDvlpPrgs.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
			this.setGrid(pageSize, pageNo);
	    }

	}

	function fn_modalClick(){
		var nRow = grdDvlpPrgs.getRow();
		var nCol = grdDvlpPrgs.getCol();
		var rowData = grdDvlpPrgs.getRowData(nRow);

		if(nCol == 9){
			SBUxMethod.openModal('modal-dfctMng');
			SBUxMethod.set("dtl-inp-prgrmNm", rowData.prgrmNm);
			SBUxMethod.set("dtl-inp-prgrmId", rowData.prgrmId);
			SBUxMethod.set("dtl-inp-pic", rowData.pic);
			dfctPopup.init(rowData);
		}
	}

	function fn_paging(){
		dvlpPrgs.paging();
	}

</script>
</html>