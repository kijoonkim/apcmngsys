<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectFcltList()"></sbux-button>
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
					<div id="sb-area-grdFclt" style="height:250px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonFclt = []; // 그리드의 참조 데이터 주소 선언
	async function fn_fcltMngCreateGrid() {

		SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		jsonFclt = [];

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdFclt';
	    SBGridProperties.id = 'grdFclt';
	    SBGridProperties.jsonref = 'jsonFclt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["설비 명"], 		ref: 'cdVlNm',   	type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'cdVlExpln',   type:'input',  width:'300px',    style:'text-align:center'},
	        {caption: ["표시순서"], 	ref: 'indctSeq',   	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdFclt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdFclt\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["공통ID"], 		ref: 'cdId',   		type:'input',  hidden : true},
	        {caption: ["설비 코드"], 	ref: 'cdVlCd',   	type:'input',  hidden:true},
	    ];
	    window.grdFclt = _SBGrid.create(SBGridProperties);
	    fn_selectFcltList();
	}

	async function fn_selectFcltList(){
		fn_callSelectFcltList();
	}


	async function fn_callSelectFcltList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {apcCd : apcCd, cdId : 'FCLT_CD'});
        let data = await postJsonPromise;
        let newJsonFclt = [];
        try{
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
				newJsonFclt.push(fcltVO);
			});
        	jsonFclt = newJsonFclt;
        	grdFclt.rebuild();
        	grdFclt.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_saveFcltList(){
		let gridData = grdFclt.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdFclt.getRowData(i).delYn == 'N'){

				if(grdFclt.getRowData(i).cdVlNm == null || grdFclt.getRowData(i).cdVlNm == ""){
					alert("설비 명은 필수 값 입니다.");
					return;
				}

				if(grdFclt.getRowStatus(i) === 3){
					insertList.push(grdFclt.getRowData(i));
				}
				if(grdFclt.getRowStatus(i) === 2){
					updateList.push(grdFclt.getRowData(i));
				}
			}
		}
		if(insertList.length == 0 && updateList.length == 0){
			alert("저장 할 내용이 없습니다.");
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			if(insertList.length > 0){
				insertCnt = await fn_callInsertRsrcList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdateRsrcList(updateList);
			}
			if(insertCnt + updateCnt > 0 ){
				fn_callSelectFcltList();
				alert("저장 되었습니다.");
			}
		}
	}

</script>
</html>