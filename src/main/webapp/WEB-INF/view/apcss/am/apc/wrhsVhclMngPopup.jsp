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
				<h3 class="box-title"> ▶ 입고차량정보 등록 (팝업)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<button type="button" class="btn btn-sm btn-outline-danger">조회</button>
						<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
						<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 25%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=vhclApcNm name="vhclApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>차량정보</span></li>
						</ul>
					</div>
					<div id="vhclMngGridArea" style="height:150px; width: 100%;"></div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>운송지역별 운임비용 등록</span></li>
						</ul>
					</div>
					<div id="trsprtMngGridArea" style="height:150px; width: 100%;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	//입고차량정보 등록
	var wrhsVhclMngGridData = []; // 그리드의 참조 데이터 주소 선언
	function fn_wrhsVhclMngCreateGrid() {
		vhclMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'wrhsVhclMngGridArea';
	    SBGridProperties.id = 'wrhsVhclMngDatagrid';
	    SBGridProperties.jsonref = 'wrhsVhclMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["차량번호"], 	ref: 'vhclNo',  type:'input',  width:'120px',    style:'text-align:center'},
	        {caption: ["기사명"], 		ref: 'drvrNm',  type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
	        			typeinfo : {ref:'jsonComboGridBankNm', label:'label', value:'value', displayui : true}},
	        {caption: ["계좌번호"], 	ref: 'actno',  	type:'input',  width:'180px',    style:'text-align:center'},
	        {caption: ["예금주"], 		ref: 'dpstr',  	type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',  	type:'input',  width:'200px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"vhclMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"vhclMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }}
	    ];
	    window.wrhsVhclMngDatagrid = _SBGrid.create(SBGridProperties);
	    wrhsVhclMngDatagrid.addRow();
	}

	async function fn_selectWrhsVhclList(){
		fn_callSelectWrhsVhclList();
	}

	async function fn_callSelectWrhsVhclList(){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/apc/selectWrhsVhclList", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newWrhsVhclGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let userList = {
					vhclNo 	: item.vhclNo
				  , drvrNm 	: item.drvrNm
				  , bankCd 	: item.bankCd
				  , actno 	: item.actno
				  , dpstr 	: item.dpstr
				  , rmrk 	: item.rmrk
				  , delYn 	: item.delYn
				}
				newWrhsVhclGridData.push(userList);
			});
        	wrhsVhclMngGridData = newWrhsVhclGridData;
        	wrhsVhclMngDatagrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
</script>
</html>