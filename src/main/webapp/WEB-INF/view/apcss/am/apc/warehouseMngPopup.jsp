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
						<span style="font-weight:bold;">APC에서 운영하고 있는 창고를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">창고명은 입고, 선별, 포장 후 재고관리를 위한 위치정보로 사용됩니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchWarehouse" name="btnSearchWarehouse" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectWarehouseList"></sbux-button>
					<sbux-button id="btnSaveWarehouse" name="btnSaveWarehouse" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveWarehouseList"></sbux-button>
					<sbux-button id="btnEndWarehouse" name="btnEndWarehouse" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-warehouse')"></sbux-button>
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
								<sbux-input id=warehouse-inp-apcNm name="warehouse-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
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
					<div id="sb-area-grdWarehouse" style="height:250px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//창고 등록
	var jsonWarehouse = []; // 그리드의 참조 데이터 주소 선언
	async function fn_warehouseMngCreateGrid() {

		SBUxMethod.set("warehouse-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		jsonWarehouse = [];

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWarehouse';
	    SBGridProperties.id = 'grdWarehouse';
	    SBGridProperties.jsonref = 'jsonWarehouse';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["창고 명"], 		ref: 'cdVlNm',   		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'cdVlExpln',   	type:'input',  width:'400px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdWarehouse\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdWarehouse\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["공통ID"], 		ref: 'cdId',   		type:'input',  hidden : true}
	    ];
	    window.grdWarehouse = _SBGrid.create(SBGridProperties);
	    fn_selectWarehouseList();
	}

	async function fn_selectWarehouseList(){
		fn_callSelectWarehouseList();
	}

	async function fn_callSelectWarehouseList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
		let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {apcCd : apcCd, cdId : 'WAREHOUSE_SE_CD'});
	    let data = await postJsonPromise;
	    let newJsonWarehouse = [];
	    try{
	    	data.resultList.forEach((item, index) => {
				let warehouseVO = {
					rowSeq : 	item.rowSeq
				  , cdVl :	 	item.cdVl
				  , cdVlNm : 	item.cdVlNm
				  , cdVlExpln : item.cdVlExpln
				  , delYn : 	item.delYn
				  , apcCd : 	item.apcCd
				  , cdId :		item.cdId
				}
				newJsonWarehouse.push(warehouseVO);
			});
	    	jsonWarehouse = newJsonWarehouse;
	    	grdWarehouse.rebuild();
	    	grdWarehouse.addRow(true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	async function fn_saveWarehouseList(){
		let gridData = grdWarehouse.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdWarehouse.getRowData(i).delYn == 'N'){

				if(grdWarehouse.getRowData(i).cdVlNm == null || grdWarehouse.getRowData(i).cdVlNm == ""){
					alert("창고 명은 필수 값 입니다.");
					return;
				}

				if(grdWarehouse.getRowStatus(i) === 3){
					insertList.push(grdWarehouse.getRowData(i));
				}
				if(grdWarehouse.getRowStatus(i) === 2){
					updateList.push(grdWarehouse.getRowData(i));
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
				fn_callSelectWarehouseList();
				alert("저장 되었습니다.");
			}
		}

	}
</script>
</html>