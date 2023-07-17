<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title"> ▶ 생산작업자 등록 (팝업)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnOprtrSech" name="btnOprtrSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectOprtrList()"></sbux-button>
						<sbux-button id="btnOprtrReg" name="btnOprtrReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertOprtrList"></sbux-button>
						<sbux-button id="btnOprtrEnd" name="btnOprtrEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('oprtrMngModal')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=oprtrApcNm name="oprtrApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="oprtrMngGridArea" style="height:250px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var oprtrMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_oprtrMngCreateGrid() {

		SBUxMethod.set("oprtrApcNm", SBUxMethod.get("apcNm"));

		oprtrMngGridData = [];
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'oprtrMngGridArea';
	    SBGridProperties.id = 'oprtrMngDatagrid';
	    SBGridProperties.jsonref = 'oprtrMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["작업자명"], 	ref: 'flnm',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["생년월일"], 	ref: 'brdt',   	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["전화번호"], 	ref: 'telno',   type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["주소"], 		ref: 'addr',    type:'input',  width:'200px',    style:'text-align:center'},
	        {caption: ["입사일자"], 	ref: 'jncmp',   type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
    			typeinfo : {ref:'comboGridBankCdJsData', label:'label', value:'value', displayui : true, unselect: {label : '입력', value: ''}}},
	        {caption: ["계좌번호"], 	ref: 'actno',   type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["예금주명"], 	ref: 'dpstr',   type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"oprtrMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"oprtrMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    window.oprtrMngDatagrid = _SBGrid.create(SBGridProperties);
	    oprtrMngDatagrid.addRow();
	    fn_selectOprtrList();
	}

	async function fn_selectOprtrList(){
		fn_callSelectOprtrList();
	}

	async function fn_callSelectOprtrList(){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newOprtrGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let oprtr = {
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
				newOprtrGridData.push(oprtr);
			});
        	oprtrMngGridData = newOprtrGridData;
        	oprtrMngDatagrid.rebuild();
        	oprtrMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertOprtrList(){
		let gridData = oprtrMngDatagrid.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertListResult = 0;
		let updateListResult = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(oprtrMngDatagrid.getRowData(i).delYn == 'N'){

				if(oprtrMngDatagrid.getRowData(i).cdVlNm == null || oprtrMngDatagrid.getRowData(i).cdVlNm == ""){
					alert("작업자 명은 필수 값 입니다.");
					return;
				}

				if(oprtrMngDatagrid.getRowStatus(i) === 3){
					insertList.push(oprtrMngDatagrid.getRowData(i));
				}
				if(oprtrMngDatagrid.getRowStatus(i) === 2){
					updateList.push(oprtrMngDatagrid.getRowData(i));
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
				insertListResult = await fn_callInsertOprtrList(insertList);
			}
			if(updateList.length > 0){
				updateListResult = await fn_callUpdateOprtrList(updateList);
			}
			if(insertListResult + updateListResult > 0 ){
				fn_callSelectFcltList();
				alert("등록 되었습니다.");
			}
		}
	}

</script>
</html>