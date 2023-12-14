<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 설비 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">APC에서 운영하고 있는 선별기와 포장기를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">설비가 없는 APC는 설비명을 "수작업" 으로 등록해야합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchFcltList"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFcltList"></sbux-button>
					<sbux-button id="btnEndFclt" name="btnEndFclt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-fclt')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 200px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=fclt-inp-apcNm name="fclt-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdFclt" style="height:258px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonFclt = []; // 그리드의 참조 데이터 주소 선언
	var jsonComFcltGubun = [];

	const fn_initSBSelectFclt = async function() {

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdFclt', 		jsonComFcltGubun, 	'FCLT_GUBUN') 		// 설비구분
		])

	}
	const fn_fcltMngCreateGrid = async function() {

		SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdFclt';
	    SBGridProperties.id = 'grdFclt';
	    SBGridProperties.jsonref = 'jsonFclt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdFclt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdFclt\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	    	{caption: ["설비구분"], 	ref: 'cdId',   	type:'combo',  width:'100px',    style:'text-align:center;',
				typeinfo : {ref:'jsonComFcltGubun', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["설비 명"], 	ref: 'cdVlNm',   type:'input',  width:'250px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
	        {caption: ["비고"], 		ref: 'cdVlExpln',   type:'input',  width:'200px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000}), typeinfo : {maxlength : 333}},
	        {caption: ["표시순서"], 	ref: 'indctSeq',   	type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}, maxlength : 10}},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["설비 코드"], 		ref: 'cdVlCd',   	type:'input',  hidden:true},
	    ];
	    grdFclt = _SBGrid.create(SBGridProperties);
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		grdFclt.refresh({"combo":true});

	}

	const fn_searchFcltList = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/co/cd/selectFcltList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        try{
        	jsonFclt.length = 0;
        	data.resultList.forEach((item, index) => {
				let fcltVO = {
					rowSeq 		: item.rowSeq
				  , cdVl 		: item.cdVl
				  , cdVlNm 		: item.cdVlNm
				  , cdVlExpln 	: item.cdVlExpln
				  , indctSeq 	: item.indctSeq
				  , delYn 		: item.delYn
				  , apcCd 		: item.apcCd
				  , cdId 		: item.cdId
				}
				jsonFclt.push(fcltVO);
			});
        	grdFclt.rebuild();
        	grdFclt.addRow();
        	grdFclt.setCellDisabled(grdFclt.getRows() -1, 0, grdFclt.getRows() -1, grdFclt.getCols() -1, true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}




	const fn_saveFcltList = async function(){


		let gridData = grdFclt.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdFclt.getRowData(i);
			let rowSts = grdFclt.getRowStatus(i);
			let fcltNm = rowData.cdVlNm;
			let fcltGubun = rowData.cdId;
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if (gfn_isEmpty(fcltNm)) {
		  			gfn_comAlert("W0002", "설비명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}

				if (gfn_isEmpty(fcltGubun)) {
		  			gfn_comAlert("W0001", "설비구분");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}

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

		if(gfn_comConfirm("Q0001", "저장")){

			let postJsonPromise = gfn_postJSON("/co/cd/multiSaveComCdDtlList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchFcltList();
	        	} else {
	        		gfn_comAlert("E0001");
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