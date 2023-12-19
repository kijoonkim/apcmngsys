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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					<sbux-button id="btnSaveFrm" name="btnSaveFrm" uitype="normal" text="연계 등록" class="btn btn-sm btn-outline-danger" onclick="fn_saveFrmerSn"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>

					<tbody>
						<tr>
							<th scope="row">조직명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-ognzNm" name="srch-inp-ognzNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">조직구분명</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-ognzSeNm" name="srch-inp-ognzSeNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">유형명</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-typeNm" name="srch-inp-typeNm" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<td colspan="2" style="border-left: hidden;"></td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdApcIsoHldOgnzInfo" style="height:650px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>


</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		/*
		gfn_setComCdSBSelect(
				'dtl-slt-frstApprv',
				jsonDSFA,
			'IOPD_COFM_CD');

		gfn_setComCdSBSelect(
				'dtl-slt-scndApprv',
				jsonDSSA,
			'IOPD_SED_COFM_CD');

		gfn_setComCdSBSelect(
				'dtl-slt-orgNm',
				jsonDSON,
			'IOPD_CMPTNT_ORG');

		gfn_setComCdSBSelect(
				'dtl-slt-athrt',
				jsonDSA,
			'IOPD_ATHRT'); */

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

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),	// 품종
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,  	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록
		]);

		SBUxMethod.set("dtl-rdo-gdsSeCd", '1');
	}


	//설비 등록
	var jsonapcIsoHldOgnzInfo = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdApcIsoHldOgnzInfo', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
		])

	}


	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcIsoHldOgnzInfo';
	    SBGridProperties.id = 'grdApcIsoHldOgnzInfo';
	    SBGridProperties.jsonref = 'jsonapcIsoHldOgnzInfo';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["조직코드"], 		ref: 'ognzCd',   	type:'input',  width:'15%', hidden : false},
	        {caption: ["조직명"], 	ref: 'ognzNm',   	type:'input',   width:'15%',   style:'text-align:center'},
	        {caption: ["조직구분코드"], 	ref: 'ognzSeCd',   	type:'input',  width:'15%',   style:'text-align:center'},
	        {caption: ["조직구분명"], 	ref: 'ognzSeNm',   	type:'input',   width:'15%',  style:'text-align:center'},
	        {caption: ["사업자번호"], 	ref: 'brno',   	type:'input',   width:'15%',  style:'text-align:center'},
	        {caption: ["유형코드"], 	ref: 'typeCd',   	type:'input',  width:'15%',   style:'text-align:center'},
	        {caption: ["유형명"], 	ref: 'typeNm',   	type:'input',  width:'15%',   style:'text-align:center'},
	        {caption: ["APC보유수"], 	ref: 'apcHldCnt',   	type:'input',   width:'15%',  style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'10%',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdApcIsoHldOgnzInfo\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdApcIsoHldOgnzInfo\", " + nRow + ")'>삭제</button>";
	        	}
	        }}

// 	        {caption: ["통합조직"], 	ref: 'ii',   	type:'output',  width:'80px',    style:'text-align:center'},
// 	        {caption: ["통합조직 코드"], 	ref: 'iiCode',   	type:'input', hidden:true},
	        /*
	        {caption: ["통합조직"], 		ref: 'ii',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	console.log(strValue);
	        	if(strValue== null || strValue == ""){
	        		console.log("통합조직 값없음");
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdApcIsoHldOgnzInfo\", " + nRow + ", " + nCol + ")'></sbux-button>"
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdApcIsoHldOgnzInfo\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		//return " <sbux-button type='button' uitype='modal' target-id='modal-itemSelect'  text='찾기'  onClick='fn_GridPop(\"pop\", \"grdApcIsoHldOgnzInfo\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}else{
	        		console.log("통합조직 값있음");
	        		//return " <button type='button' class='btn btn-xs btn-outline-danger'   onClick='fn_GridPop(\"pop\", \"grdApcIsoHldOgnzInfo\", " + nRow + ", " + nCol + ")'>찾기</button>";
	        		return "<sbux-button type='button' uitype='modal' target-id='modal-itemSelect' class='btn btn-xs btn-outline-danger' text='찾기'  onClick='fn_GridPop(\"pop\", \"grdApcIsoHldOgnzInfo\", " + nRow + ", " + nCol + ")'></sbux-button>";
	        	}
	        }},
	        */
	    ];

	    grdApcIsoHldOgnzInfo = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdApcIsoHldOgnzInfo.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    grdApcIsoHldOgnzInfo.bind('click','gridClick');

	}



	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(){
		let ognzNm = SBUxMethod.get("srch-inp-ognzNm");//
		let ognzSeNm = SBUxMethod.get("srch-inp-ognzSeNm");//
		let typeNm = SBUxMethod.get("srch-inp-typeNm");//
		//let apcCd = SBUxMethod.get("inp-apcCd");
    	//let postJsonPromise = gfn_postJSON("/pd/bsm/selectapcIsoHldOgnzInfo.do", {apcCd : apcCd});
    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectApcIsoHldOgnzInfoList.do", {
    		ognzNm : ognzNm
    		,ognzSeNm : ognzSeNm
    		,typeNm : typeNm
		});
        let data = await postJsonPromise;
        try{
        	jsonapcIsoHldOgnzInfo.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let apcIsoHldOgnzInfoVO = {
					ognzCd : item.ognzCd
				  , ognzNm 		: item.ognzNm
				  , ognzSeCd 	: item.ognzSeCd
				  , ognzSeNm 	: item.ognzSeNm
				  , brno 		: item.brno
				  , typeCd 		: item.typeCd
				  , typeNm 		: item.typeNm
				  , apcHldCnt 	: item.apcHldCnt
				  , delYn 		: item.delYn
				}
				jsonapcIsoHldOgnzInfo.push(apcIsoHldOgnzInfoVO);
			});



        	grdApcIsoHldOgnzInfo.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdApcIsoHldOgnzInfo.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdApcIsoHldOgnzInfo.getGridDataAll();
		let saveList = [];
		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdApcIsoHldOgnzInfo.getRowData(i);
			let rowSts = grdApcIsoHldOgnzInfo.getRowStatus(i);
			let delYn = rowData.delYn;
			console.log("================delYn================"+delYn);
			if(delYn == 'N'){

// 				if (gfn_isEmpty(ognzCd)) {
// 		  			gfn_comAlert("W0002", "조직코드");		//	W0002	{0}을/를 입력하세요.
// 		            return;
// 		  		}

// 				 if (gfn_isEmpty(ognzNm)) {
// 		  			gfn_comAlert("W0001", "조직명");		//	W0001	{0}을/를 선택하세요.
// 		            return;
// 		  		}
				 console.log("rowData==========="+ rowData );
				 console.log("================gridClick================");
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

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveApcIsoHldOgnzInfoList.do", saveList);
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
        if (gubun === "ADD") {
            if (grid === "grdApcIsoHldOgnzInfo") {
            	grdApcIsoHldOgnzInfo.setCellData(nRow, nCol, "N", true);
            	//grdApcIsoHldOgnzInfo.setCellData(nRow, 5, gv_apcCd, true);
            	grdApcIsoHldOgnzInfo.addRow(true);
            }
        }
        else if (gubun === "DEL") {
            if (grid === "grdApcIsoHldOgnzInfo") {
            	if(grdApcIsoHldOgnzInfo.getRowStatus(nRow) == 0 || grdApcIsoHldOgnzInfo.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var apcIsoHldOgnzInfoVO = grdApcIsoHldOgnzInfo.getRowData(nRow);
            			fn_deleteRsrc(apcIsoHldOgnzInfoVO);
            			grdApcIsoHldOgnzInfo.deleteRow(nRow);
            		}
            	}else{
            		grdApcIsoHldOgnzInfo.deleteRow(nRow);
            	}
            }
        }
    }

	async function fn_deleteRsrc(apcIsoHldOgnzInfoVO){
		let postJsonPromise = gfn_postJSON("/pd/bsm/deleteApcIsoHldOgnzInfo.do", apcIsoHldOgnzInfoVO);
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


	//통합조직,출자출하조직 팝업
	const fn_choiceInvstmntSpmt = function() {
		popInvstmntSpmt.init(gv_selectedApcCd, gv_selectedApcNm, fn_setInvstmntSpmt);
	}
	//통합조직 출자출하조직 팝업 콜백함수
	const fn_setInvstmntSpmt = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("srch-inp-apcCd1", rowData.subCode);
			SBUxMethod.set("srch-inp-apcNm1", rowData.subCodeNm);
			SBUxMethod.set("srch-inp-apcCd2", rowData.mainCode);
			SBUxMethod.set("srch-inp-apcNm2", rowData.mainCodeNm);
		}
	}


	// 품목 선택 팝업 호출
	const fn_modalItemSelect = function(sn) {
		console.log("================fn_modalItemSelect================");
		console.log(sn);
		popItemSelect.init(sn,fn_setItem);
	}
	// 품목 선택 팝업 콜백 함수
	const fn_setItem = function(itemVal) {
		console.log("================fn_setItem================");
		console.log(itemVal);
		if (!gfn_isEmpty(itemVal)) {
			SBUxMethod.set('srch-inp-itemCd' + itemVal.sn , itemVal.itemCd);
			SBUxMethod.set('srch-inp-itemNm' + itemVal.sn , itemVal.itemNm);
		}
	}



    function fn_GridPop(gubun, grid, nRow, nCol) {
    	console.log("================fn_GridPop================");
        if (gubun === "pop") {
            if (grid === "grdApcIsoHldOgnzInfo") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdApcIsoHldOgnzInfo.setCellData(nRow, nCol, "N", true);
            }
        }
    }


	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

    //그리드 클릭이벤트
    function gridClick(){
		console.log("================gridClick================");
		//grdApcIsoHldOgnzInfo 그리드 객체
        selGridRow = grdApcIsoHldOgnzInfo.getRow();
        selGridCol = grdApcIsoHldOgnzInfo.getCol();


        let delYnCol = grdApcIsoHldOgnzInfo.getColRef('delYn');
        let delYnValue = grdApcIsoHldOgnzInfo.getCellData(selGridRow,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }


    }

 	// 그리드의 통합조직 선택 팝업 콜백 함수
	const fn_setGridInvstmntSpmt = function(rowData) {
		console.log("================fn_setGridInvstmntSpmt================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow 선택된 행 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let colRefIdx1 = grdApcIsoHldOgnzInfo.getColRef('ii');//ii 통합조직 인덱스
			let colRefIdx2 = grdApcIsoHldOgnzInfo.getColRef('iiCode');//ii 통합조직 코드 인덱스

			//그리드 값 세팅
			grdApcIsoHldOgnzInfo.setCellData(selGridRow,colRefIdx1,rowData.mainCodeNm,true);
			grdApcIsoHldOgnzInfo.setCellData(selGridRow,colRefIdx2,rowData.mainCode,true);
		}
	}

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		console.log("================fn_setGridItem================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdApcIsoHldOgnzInfo.getRefOfCol(selGridCol);

			//구분하기 편하기 위해 ref 값이 cc라면 코드값은 ccCode 로 설정
			let colRefIdx1 = grdApcIsoHldOgnzInfo.getColRef(selRef);//품목명 인덱스
			let colRefIdx2 = grdApcIsoHldOgnzInfo.getColRef(selRef+"Code");//품목코드 인덱스

			//그리드 값 세팅
			grdApcIsoHldOgnzInfo.setCellData(selGridRow,colRefIdx1,rowData.itemNm,true);
			grdApcIsoHldOgnzInfo.setCellData(selGridRow,colRefIdx2,rowData.itemCd,true);
		}
	}











	/* 농업인 일련번호 연계 저장*/
	const fn_saveFrmerSn= async function(){
		let frmerSn = SBUxMethod.get("srch-inp-frmerSn");

		if (gfn_isEmpty(frmerSn)) {
  			gfn_comAlert("W0002", "농업인 번호");		//	W0002	{0}을/를 입력하세요.
            return;
  		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			//let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
			// let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveReleyapcIsoHldOgnzInfoList.do", {
			let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveReleyApcIsoHldOgnzInfoJsoneList.do", {
	    		 frmerSn : frmerSn
	 		});
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







</script>
</html>