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
						<span style="font-weight:bold;">원물입고 시 차량번호를 관리하는 경우 차량번호를 입력하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold">지역별 운임비용을 관리하는 경우 운임비용 기준정보를 등록하세요.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnWrhsVhclSech" name="btnWrhsVhclSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectWrhsVhclList()"></sbux-button>
					<sbux-button id="btnWrhsVhclReg" name="btnWrhsVhclReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertWrhsVhclList()"></sbux-button>
					<sbux-button id="btnWrhsVhclEnd" name="btnWrhsVhclEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-wrhsVhcl')"></sbux-button>
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
								<sbux-input id=wrhsVhcl-inp-apcNm name="wrhsVhcl-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
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
	        {caption: ["차량번호"], 	ref: 'vhclno',  type:'input',  width:'120px',    style:'text-align:center'},
	        {caption: ["기사명"], 		ref: 'drvrNm',  type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
	        			typeinfo : {ref:'comboGridBankCdJsData', label:'label', value:'value', displayui : true, unselect: {label : '입력', value: ''}}},
	        {caption: ["계좌번호"], 	ref: 'actno',  	type:'input',  width:'180px',    style:'text-align:center'},
	        {caption: ["예금주"], 		ref: 'dpstr',  	type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["비고"], 		ref: 'rmrk',  	type:'input',  width:'280px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
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
		console.log("apcCd", apcCd);
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectWrhsVhclList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        newWrhsVhclGridData = [];
        wrhsVhclMngGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let wrhsVhcl = {
					vhclno 	: item.vhclno
				  , drvrNm 	: item.drvrNm
				  , bankCd 	: item.bankCd
				  , actno 	: item.actno
				  , dpstr 	: item.dpstr
				  , rmrk 	: item.rmrk
				  , delYn 	: item.delYn
				  , apcCd	: item.apcCd
				}
				newWrhsVhclGridData.push(Object.assign({}, wrhsVhcl));
				wrhsVhclMngGridData.push(Object.assign({}, wrhsVhcl));
			});
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
    	rgnTrsprtCstMngGridData = [];
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
            {caption: ["비고"], 			ref: 'rmrk',  			type:'input',  width:'360px',    style:'text-align:center'},
            {caption: ["처리"], 			ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"rgnTrsprtCstMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"rgnTrsprtCstMngDatagrid\", " + nRow + ")'>삭제</button>";
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
        rgnTrsprtCstMngGridData = [];
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
				
				newRgnTrsprtCstGridData.push(Object.assign({}, rgnTrsprtCst));
				rgnTrsprtCstMngGridData.push(Object.assign({}, rgnTrsprtCst));
			});
        	rgnTrsprtCstMngDatagrid.rebuild();
        	rgnTrsprtCstMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertWrhsVhclList(){
		for(var i=0; i<wrhsVhclMngGridData.length; i++){
			if(wrhsVhclMngGridData[i].delYn == "N" && (wrhsVhclMngGridData[i].vhclno == null || wrhsVhclMngGridData[i].vhclno == "")){
				console.log(wrhsVhclMngGridData[i]);
				alert("차량번호는 필수 값 입니다.");
				return
			}
		}
		
		var isEqual1 = await chkEqualObj(wrhsVhclMngGridData, newWrhsVhclGridData);
		var isEqual2 = await chkEqualObj(rgnTrsprtCstMngGridData, newRgnTrsprtCstGridData);
		console.log(isEqual1 && isEqual2);
		if (isEqual1 && isEqual2){
			alert("등록 할 내용이 없습니다.");
			return;
		}

		let regMsg = "등록 하시겠습니까?";
		if(confirm(regMsg)){
			let postJsonPromise1 = gfn_postJSON("/am/cmns/compareWrhsVhclList.do", {origin : newWrhsVhclGridData, modified : wrhsVhclMngGridData});
			let postJsonPromise2 = gfn_postJSON("/am/cmns/compareRgnTrsprtCstList.do", {origin : newRgnTrsprtCstGridData, modified : rgnTrsprtCstMngGridData});

			alert("등록 되었습니다.");
			
			fn_callSelectWrhsVhclList();
			fn_callSelectRgnTrsprtCstList();
		}
	}
	async function fn_deleteWrhsVhclList(wrhsVhclVo){
		let postJsonPromise1 = gfn_postJSON("/am/cmns/deleteWrhsVhclList.do", wrhsVhclVo);
	}
	async function fn_deleteRgnTrsprtCstList(rgnTrsprtCst){
		let postJsonPromise1 = gfn_postJSON("/am/cmns/deleteRgnTrsprtCstList.do", rgnTrsprtCst);
		
	}
</script>
</html>