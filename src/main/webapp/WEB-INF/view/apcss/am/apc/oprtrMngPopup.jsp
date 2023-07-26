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
						<span style="font-weight:bold;">선별작업 또는 포장작업 시 작업하는 작업자 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">차후 작업자별 작업시간을 관리하기 위한 기초 정보입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchOprtr" name="btnSearchOprtr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectOprtrList"></sbux-button>
					<sbux-button id="btnInsertOprtr" name="btnInsertOprtr" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertOprtrList"></sbux-button>
					<sbux-button id="btnEndOprtr" name="btnEndOprtr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-oprtr')"></sbux-button>
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
						<col style="width: 100px">
						<col style="width: 200px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=oprtr-inp-apcNm name="oprtr-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdOprtr" style="height:250px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonOprtr = []; // 그리드의 참조 데이터 주소 선언
	async function fn_oprtrMngCreateGrid() {

		SBUxMethod.set("oprtr-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		oprtrMngGridData = [];
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOprtr';
	    SBGridProperties.id = 'grdOprtr';
	    SBGridProperties.jsonref = 'jsonOprtr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["작업자명"], 	ref: 'flnm',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["생년월일"], 	ref: 'brdt',   	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["전화번호"], 	ref: 'telno',   type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["주소"], 		ref: 'addr',    type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["입사일자"], 	ref: 'jncmp',   type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
    			typeinfo : {ref:'comboGridBankCdJsData', label:'label', value:'value', displayui : true, unselect: {label : '입력', value: ''}}},
	        {caption: ["계좌번호"], 	ref: 'actno',   type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["예금주명"], 	ref: 'dpstr',   type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdOprtr\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdOprtr\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    window.grdOprtr = _SBGrid.create(SBGridProperties);
	    grdOprtr.addRow();
	    fn_selectOprtrList();
	}

	async function fn_selectOprtrList(){
		fn_callSelectOprtrList();
	}

	async function fn_callSelectOprtrList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newJsonOprtr = [];
        try{
        	data.resultList.forEach((item, index) => {
				let oprtrVO = {
					flnm : 		item.flnm
				  , brdt :	 	item.brdt
				  , telno : 	item.telno
				  , addr : 		item.addr
				  , jncmp : 	item.jncmp
				  , bankCd : 	item.bankCd
				  , actno : 	item.actno
				  , dpstr : 	item.dpstr
				  , delYn : 	item.delYn
				  , apcCd : 	item.apcCd
				}
				newJsonOprtr.push(oprtrVO);
			});
        	jsonOprtr = newJsonOprtr;
        	grdOprtr.rebuild();
        	grdOprtr.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertOprtrList(){
		let gridData = grdOprtr.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdOprtr.getRowData(i).delYn == 'N'){

				if(grdOprtr.getRowData(i).flnm == null || grdOprtr.getRowData(i).flnm == ""){
					alert("작업자 명은 필수 값 입니다.");
					return;
				}

				if(grdOprtr.getRowStatus(i) === 3){
					insertList.push(grdOprtr.getRowData(i));
				}
				if(grdOprtr.getRowStatus(i) === 2){
					updateList.push(grdOprtr.getRowData(i));
				}
			}
		}
		if(insertList.length == 0 && updateList.length == 0){
			alert("등록 할 내용이 없습니다.");
			return;
		}
		let regMsg = "등록 하시겠습니까?";
		if(confirm(regMsg)){

			if(insertList.length > 0){
				insertCnt = await fn_callInsertOprtrList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdateOprtrList(updateList);
			}
			if(insertListResult + updateListResult > 0 ){
				fn_callSelectFcltList();
				alert("등록 되었습니다.");
			}
		}
	}

</script>
</html>