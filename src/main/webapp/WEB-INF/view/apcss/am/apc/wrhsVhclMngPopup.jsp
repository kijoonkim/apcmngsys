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
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnWrhsVhclSech" name="btnWrhsVhclSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectWrhsVhclList()"></sbux-button>
						<sbux-button id="btnWrhsVhclReg" name="btnWrhsVhclReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertWrhsVhclList()"></sbux-button>
						<sbux-button id="btnWrhsVhclEnd" name="btnWrhsVhclEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('wrhsVhclMngModal')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=wrhsVhcl-inp-apcNm name="wrhsVhcl-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
							</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
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
					<div id="wrhsVhclMngGridArea" style="height:150px; width: 100%;"></div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>운송지역별 운임비용 등록</span></li>
						</ul>
					</div>
					<div id="rgnTrsprtCstMngGridArea" style="height:150px; width: 100%;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	//입고차량정보 등록
	var wrhsVhclMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_wrhsVhclMngCreateGrid() {
		SBUxMethod.set("wrhsVhcl-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		wrhsVhclMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'wrhsVhclMngGridArea';
	    SBGridProperties.id = 'wrhsVhclMngDatagrid';
	    SBGridProperties.jsonref = 'wrhsVhclMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["차량번호"], 	ref: 'vhclNo',  type:'input',  width:'120px',    style:'text-align:center'},
	        {caption: ["기사명"], 		ref: 'drvrNm',  type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
	        			typeinfo : {ref:'comboGridBankCdJsData', label:'label', value:'value', displayui : true, unselect: {label : '입력', value: ''}}},
	        {caption: ["계좌번호"], 	ref: 'actno',  	type:'input',  width:'180px',    style:'text-align:center'},
	        {caption: ["예금주"], 		ref: 'dpstr',  	type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',  	type:'input',  width:'200px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"wrhsVhclMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"wrhsVhclMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    window.wrhsVhclMngDatagrid = _SBGrid.create(SBGridProperties);
	    fn_selectWrhsVhclList();

	}

	async function fn_selectWrhsVhclList(){
		fn_callSelectWrhsVhclList();
	}

	var newWrhsVhclGridData = [];
	async function fn_callSelectWrhsVhclList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectWrhsVhclList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        newWrhsVhclGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let wrhsVhcl = {
					vhclNo 	: item.vhclNo
				  , drvrNm 	: item.drvrNm
				  , bankCd 	: item.bankCd
				  , actno 	: item.actno
				  , dpstr 	: item.dpstr
				  , rmrk 	: item.rmrk
				  , delYn 	: item.delYn
				  , apcCd	: item.apcCd
				}
				newWrhsVhclGridData.push(wrhsVhcl);
			});
        	wrhsVhclMngGridData = newWrhsVhclGridData.slice();
        	wrhsVhclMngDatagrid.rebuild();
        	wrhsVhclMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 운송지역별 운임비용 등록
    var rgnTrsprtCstMngGridData = []; // 그리드의 참조 데이터 주소 선언
    async function fn_rgnTrsprtCstMngCreateGrid() {
    	trsprtMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'rgnTrsprtCstMngGridArea';
	    SBGridProperties.id = 'rgnTrsprtCstMngDatagrid';
	    SBGridProperties.jsonref = 'rgnTrsprtCstMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption: ["코드"], 			ref: 'trsprtRgnCd',  	type:'input',  width:'100px',     style:'text-align:center'},
            {caption: ["운송지역"], 		ref: 'trsprtRgnNm',  	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["운송비용(원)"], 	ref: 'trsprtCst',  		type:'input',  width:'200px',    style:'text-align:right', format : {type:'number', rule:'#,### 원'} },
            {caption: ["비고"], 			ref: 'rmrk',  			type:'input',  width:'300px',    style:'text-align:center'},
            {caption: ["처리"], 			ref: 'delYn',   		type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"rgnTrsprtCstMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"rgnTrsprtCstMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }},
		    {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
        ];
        window.rgnTrsprtCstMngDatagrid = _SBGrid.create(SBGridProperties);
        fn_selectRgnTrsprtCstList();
    }

    async function fn_selectRgnTrsprtCstList(){
		fn_callSelectRgnTrsprtCstList();
	}

    var newRgnTrsprtCstGridData = [];
	async function fn_callSelectRgnTrsprtCstList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectRgnTrsprtCstList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        newRgnTrsprtCstGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let rgnTrsprtCst = {
				    trsprtRgnCd 	: item.trsprtRgnCd
				  , trsprtRgnNm 	: item.trsprtRgnNm
				  , trsprtCst 		: item.trsprtCst
				  , rmrk 			: item.rmrk
				  , delYn 			: item.delYn
				  , apcCd			: item.apcCd
				}
				newRgnTrsprtCstGridData.push(rgnTrsprtCst);
			});
        	rgnTrsprtCstMngGridData = newRgnTrsprtCstGridData.slice();
        	rgnTrsprtCstMngDatagrid.rebuild();
        	rgnTrsprtCstMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	
	async function fn_procRow(type, id, i){
		if(id == "wrhsVhclMngDatagrid"){
			if (type == "ADD"){
				wrhsVhclMngGridData[i-1].delYn = "N";
				wrhsVhclMngDatagrid.addRow();
			}
			else{
				wrhsVhclMngDatagrid.deleteRow(i);
			}
		}
		else{
			if (type == "ADD"){
				rgnTrsprtCstMngGridData[i-1].delYn = "N";
				rgnTrsprtCstMngDatagrid.addRow();
			}
			else{
				rgnTrsprtCstMngDatagrid.deleteRow(i);
			}
		}
	}

	async function fn_insertWrhsVhclList(){
		for(var i=0; i<wrhsVhclMngGridData.length; i++){
			if(wrhsVhclMngGridData[i].delYn == "N" && (wrhsVhclMngGridData[i].vhclNo == null || wrhsVhclMngGridData[i].vhclNo == "")){
				alert("차량번호는 필수 값 입니다.");
				return
			}
		}
		
		var isEqual1 = await chkEqualObj(wrhsVhclMngGridData, newWrhsVhclGridData);
		console.log(isEqual1);
		if (isEqual1){
			alert("등록 할 내용이 없습니다.");
			return;
		}
	

		let regMsg = "등록 하시겠습니까?";
		if(confirm(regMsg)){
			alert("등록 되었습니다.");
		}
	}
	
	async function chkEqualObj(obj1, obj2){
		console.log("obj1", obj1);
		console.log("obj2", obj2);
		
		var obj1Len = obj1.filter(e => e["delYn"] == "N").length;
		var obj2Len = obj2.filter(e => e["delYn"] == "N").length;
		
		if (obj1Len != obj2Len)
			return false;

		var obj1keys = Object.keys(obj1[0]);
		obj1keys.sort();
		var obj2keys = Object.keys(obj2[0]);
		obj2keys.sort();

		if (JSON.stringify(obj1keys) != JSON.stringify(obj2keys))
			return false;
		
		for(var i=0; i<obj1Len; i++){
			for(var j=0; j<obj1keys.length; j++){
				if(obj1[i][obj1keys[j]] != obj2[i][obj1keys[j]])
					return false;
			}
		}
		return true;
	}

</script>
</html>