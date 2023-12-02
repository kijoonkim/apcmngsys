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
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<!-- 생산자조직현황 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >등록년도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-year"
									name="srch-input-year"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg" >APC(또는 산지유통시설) 지원형태</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-cmptnInst"
									name="srch-input-cmptnInst"
									uitype="single"
									jsondata-ref="jsonDSON"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th colspan="2" scope="row" class="th_bg" >법인구분</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-ctpv"
									name="srch-input-ctpv"
									uitype="single"
									jsondata-ref="jsonDSFA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">통합조직여부</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-corpSeCd"
									name="srch-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">품목광역조직여부</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select
									id="srch-input-corpDtlSeCd"
									name="srch-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th colspan="2" scope="row" class="th_bg">등록대상구분</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-ii"
									name="srch-input-ii"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-jj"
									name="srch-input-jj"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">APC(또는 산지유통시설) 보유조직</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-brno"
									name="srch-input-brno"
									uitype="single"
									jsondata-ref="jsonDSA"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input">
							</td>
							<th colspan="2" scope="row" class="th_bg">법인명</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
						</tr>
						<tr>
							<th scope="row" class="th_bg">관할기관</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-jj"
									name="srch-input-jj"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">시도</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-jj"
									name="srch-input-jj"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
							<th colspan="2" scope="row" class="th_bg">실적입력완료여부</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-jj"
									name="srch-input-jj"
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<!-- 통합조직 리스트 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>

				<!-- 농가리스트 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:350px; width: 100%;"></div>
				</div>

				<table class="table table-bordered tbl_fixed">
					<caption>생산자조직</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">품목</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">취급유형</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<!-- 농가 조직원 리스트 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:350px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})


	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();
		//grdPrdcrOgnCurntMng02.addRow();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["등록년도"], 		ref: 'year',   	type:'output',  width:'220px',    style:'text-align:center'},
	    	{caption: ["법인구분"], 		ref: 'corpSeCd',   type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["시도"], 			ref: 'ctpv',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'220px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'bb',   	type:'output',  width:'220px',    style:'text-align:center'}
	    ];

	    grdPrdcrOgnCurntMng = _SBGrid.create(SBGridProperties);
	    /*
	    let rst = await Promise.all([
	    	//fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		*/
		//grdPrdcrOgnCurntMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	   	grdPrdcrOgnCurntMng.bind('click','fn_view');

	}

	var jsonPrdcrOgnCurntMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng01;

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["번호"], 			ref: 'aa',   	type:'output',  width:'120px',    style:'text-align:center'},
	    	{caption: ["조직원명"], 		ref: 'bb',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["재배지 주소"], 	ref: 'cc',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["품종"], 			ref: 'dd',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["재배면적(㎡)"], 	ref: 'ee',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["(평년)생산량(톤)"], ref: 'ff',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["가입일"], 		ref: 'gg',  	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["탈퇴일"], 		ref: 'hh',  	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["삭제여부"], 		ref: 'delYn',		hidden : true},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
	        	}
	        }},

	        {caption: ["상세내역"], 	ref: 'aa',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'bb',   			hidden : true}
	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);

	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02;

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid02 = async function() {

		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["번호"], 			ref: 'aa',   	type:'output',  width:'120px',    style:'text-align:center'},
	    	{caption: ["조직원명"], 		ref: 'bb',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["재배지 주소"], 	ref: 'cc',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["품종"], 			ref: 'dd',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["재배면적(㎡)"], 	ref: 'ee',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["(평년)생산량(톤)"], ref: 'ff',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["가입일"], 		ref: 'gg',  	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["탈퇴일"], 		ref: 'hh',  	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'input',  width:'220px',    style:'text-align:center'},
	        {caption: ["삭제여부"], 		ref: 'delYn',		hidden : true},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
	        	}
	        }},

	        {caption: ["상세내역"], 	ref: 'aa',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'bb',   			hidden : true}
	    ];

	    grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);

	}

	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		//let year = SBUxMethod.get("srch-input-year");//

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		//cmptnInst : cmptnInst
    		//,ctpv : ctpv
		});

        let data = await postJsonPromise ;
        try{
        	jsonPrdcrOgnCurntMng.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						corpSeCd: item.corpSeCd
						,apoCd: item.apoCd
						,ctpv: item.ctpv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,brno: item.brno
				}
				jsonPrdcrOgnCurntMng.push(PrdcrOgnCurntMngVO);
			});

        	grdPrdcrOgnCurntMng.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	//grdPrdcrOgnCurntMng.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	//다중 세이브
	const fn_listSave = async function(){


		let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng02.getRowStatus(i);
			//let fcltNm = rowData.cdVlNm;

			//if(delYn == 'N'){
			if(true){

				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pom/multiSaveComCdDtlList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchFcltList();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }

		}
	}

	/* Grid Row 추가 및 삭제 기능*/
    function fn_procRow(gubun, grid, nRow, nCol) {
    	console.log(gubun);
		console.log(grid);
		console.log(nRow);
		console.log(nCol);
        if (gubun === "ADD") {
            if (grid === "grdPrdcrOgnCurntMng02") {
            	grdPrdcrOgnCurntMng02.setCellData(nRow, nCol, "N", true);
            	//grdPrdcrCrclOgnReqClsMng.setCellData(nRow, 5, gv_apcCd, true);
            	grdPrdcrOgnCurntMng02.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdPrdcrOgnCurntMng02") {
            	if(grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng02.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			grdPrdcrOgnCurntMng02.deleteRow(nRow);
            		}
            	}else{
            		grdPrdcrOgnCurntMng02.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(PrdcrOgnCurntMngVO){
		let postJsonPromise = gfn_postJSON("/pd/pom/deletePrdcrOgnCurntMng.do", PrdcrOgnCurntMngVO);
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

	//통합조직 리스트 그리드 클릭시 출자출하조직 리스트 조회 이벤트
	const fn_view = async function(){
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrOgnCurntMng02.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdPrdcrOgnCurntMng02.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//해당 로우 데이터로 출자출하조직 리스트 조회
        let rowData = grdPrdcrOgnCurntMng02.getRowData(nRow);
		console.log(rowData);

		let uoBrno = rowData.brno
		let apoCd = rowData.apoCd

		let postJsonPromise01 = gfn_postJSON("/pd/pom/selectPrdcrOgnCurntMngList.do", {
			uoBrno : uoBrno
    		,apoCd : apoCd

		});
        let data = await postJsonPromise01;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						apoCd: item.apoCd
						,corpNm: item.corpNm
						,rprsvFlnm: item.rprsvFlnm
						,brno: item.brno
						,rprsvTelno: item.rprsvTelno
						,corpDtlSeCd: item.corpDtlSeCd
						,invstNope: item.invstNope
						,invstExpndFrmerNope: item.invstExpndFrmerNope

						,crno: item.crno
						,corpSeCd: item.corpSeCd
						,corpFndnDay: item.corpFndnDay
						,invstAmt: item.invstAmt
						,frmerInvstAmt: item.frmerInvstAmt
						,prdcrGrpInvstAmt: item.prdcrGrpInvstAmt
						,locgovInvstAmt: item.locgovInvstAmt
						,etcAmt: item.etcAmt
						,rprsvFlnm: item.rprsvFlnm
						,rprsvTelno: item.rprsvTelno
						,fxno: item.fxno
				}
				grdPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO);
			});

        	grdPrdcrOgnCurntMng02.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdPrdcrOgnCurntMng02.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
    }

</script>
</html>
