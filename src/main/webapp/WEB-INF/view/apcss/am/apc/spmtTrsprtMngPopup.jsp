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
				<h3 class="box-title"> ▶ 출하운송회사 등록 (팝업)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSpmtTrsprtSach" name="btnSpmtTrsprtSach" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSpmtTrsprtList()"></sbux-button>
						<sbux-button id="btnSpmtTrsprtReg" name="btnSpmtTrsprtReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertSpmtTrsprtList"></sbux-button>
						<sbux-button id="btnSpmtTrsprtEnd" name="btnSpmtTrsprtEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('spmtTrsprtMngModal')"></sbux-button>
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
								<sbux-input id=spmtTrsprtApcNm name="spmtTrsprtApcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>운송회사 목록</span></li>
							</ul>
						</div>
						<div id="spmtTrsprtMngGridArea" style="height:300px;"></div>
					</div>
				</div>
			</div>
		<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	//출하운송회사 등록
	var spmtTrsprtMngGridData = []; // 그리드의 참조 데이터 주소 선언
	function fn_spmtTrsprtMngCreateGrid() {


		spmtTrsprtMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'spmtTrsprtMngGridArea';
	    SBGridProperties.id = 'spmtTrsprtMngDatagrid';
	    SBGridProperties.jsonref = 'spmtTrsprtMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"], 			ref: 'trsprtCoCd',  type:'output',  width:'80px',     style:'text-align:center'},
	        {caption: ["운송회사명"], 		ref: 'trsprtCoNm',  type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["전화번호"], 		ref: 'telno',  		type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["팩스번호"], 		ref: 'fxno',  		type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',  		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["처리"], 			ref: 'delYn',   	type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"spmtTrsprtMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"spmtTrsprtMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }}
	    ];
	    window.spmtTrsprtMngDatagrid = _SBGrid.create(SBGridProperties);
	    spmtTrsprtMngDatagrid.addRow();
	}

	async function fn_selectSpmtTrsprtList(){
		fn_callSelectSpmtTrsprtList();
	}

	async function fn_callSelectSpmtTrsprtList(){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtTrsprtList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newSpmtTrsprtGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let spmtTrsprt = {
					trsprtCoCd 	: item.trsprtCoCd
				  , trsprtCoNm 	: item.trsprtCoNm
				  , telno 		: item.telno
				  , fxno 		: item.fxno
				  , rmrk 		: item.rmrk
				  , delYn 		: item.delYn
				  , apcCd		: item.apcCd
				}
				newSpmtTrsprtGridData.push(spmtTrsprt);
			});
        	spmtTrsprtMngGridData = newWrhsVhclGridData;
        	spmtTrsprtMngDatagrid.rebuild();
        	spmtTrsprtMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
</script>
</html>