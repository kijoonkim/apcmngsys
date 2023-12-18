<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 생산작업자 등록</title>
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
					<sbux-button id="btnSearchOprtr" name="btnSearchOprtr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchOprtr"></sbux-button>
					<sbux-button id="btnInsertOprtr" name="btnInsertOprtr" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveOprtr"></sbux-button>
					<sbux-button id="btnEndOprtr" name="btnEndOprtr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-oprtr')"></sbux-button>
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
		jsonOprtr = [];
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOprtr';
	    SBGridProperties.id = 'grdOprtr';
	    SBGridProperties.jsonref = 'jsonOprtr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListOprtr;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdOprtr\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdOprtr\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["작업자명"], 	ref: 'flnm',  	type:'input',  width:'100px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {mask : {alias : 'k'}, maxlength : 33}},
	        {caption: ["생년월일"], 	ref: 'brdt',   	type:'input',  width:'100px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 10}), typeinfo : {maxlength : 10}, format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}},
	        {caption: ["전화번호"], 	ref: 'telno',   type:'input',  width:'120px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 11}), typeinfo : {maxlength : 11}, format : {type:'custom', callback : fnNewCallNumber}},
	        {caption: ["주소"], 		ref: 'addr',    type:'input',  width:'320px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 200}), typeinfo : {maxlength : 66}},
	        {caption: ["입사일자"], 	ref: 'jncmp', 	type : 'datepicker', width:'100px',style:'text-align:center', typeinfo: {dateformat: 'yyyy-mm-dd'}, format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}     },
	        /* {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'100px',    style:'text-align:center',
    			typeinfo : {ref:'comboGridBankCdJsData', displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["계좌번호"], 	ref: 'actno',   type:'input',  width:'130px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 256}), typeinfo : {mask : {alias : '#-', repeat: '*'}, maxlength : 256}},
	        {caption: ["예금주명"], 	ref: 'dpstr',   type:'input',  width:'90px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {maxlength : 6}}, */
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'output',  hidden : true}
	    ];
	    grdOprtr = _SBGrid.create(SBGridProperties);
	    fn_searchOprtr();
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListOprtr = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldOprtr,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldOprtr() {
    	grdOprtr.exportLocalExcel("생산작업자 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	const fn_searchOprtr = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        jsonOprtr.length = 0;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
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

  					jsonOprtr.push(oprtrVO);
  				});
  	        	grdOprtr.rebuild();
  	        	grdOprtr.addRow(true);
  	        	grdOprtr.setCellDisabled(grdOprtr.getRows() -1, 0, grdOprtr.getRows() -1, grdOprtr.getCols() -1, true);

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_saveOprtr = async function(){
		let gridData = grdOprtr.getGridDataAll();
		let saveList = [];
		for(var i=1; i<=gridData.length; i++ ){

			let flnm = grdOprtr.getRowData(i).flnm;
			let brdt = grdOprtr.getRowData(i).brdt;
			let delYn = grdOprtr.getRowData(i).delYn;
			if(delYn == 'N'){
				if(gfn_isEmpty(flnm)){
					gfn_comAlert("W0002", "작업자명");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				if(gfn_isEmpty(brdt)){
					gfn_comAlert("W0002", "생년월일");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				let rowData = grdOprtr.getRowData(i);
				let rowSts = grdOprtr.getRowStatus(i);
				if(grdOprtr.getRowStatus(i) === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				}
				if(grdOprtr.getRowStatus(i) === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				}
			}
		}

		if(gfn_comConfirm("Q0001", "저장")){
			if(!(gfn_isEmpty(saveList))){
				for(let i=0;i<saveList.length;i++){
					let newInsertTelno = saveList[i].telno.split("");
					if(newInsertTelno < 8){
						saveList[i].telno = "";
					}
				}
			}

			let postJsonPromise = gfn_postJSON("/am/cmns/multiSaveOprtrList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchOprtr();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch(e) {
	        	console.error("failed", e.message);
	        }
		}
	}

	const fn_deleteOprtr = async function(oprtrVO){

		let postJsonPromise = gfn_postJSON("/am/cmns/deleteOprtr.do", oprtrVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
        		fn_searchOprtr();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }
	}

	const fnNewCallNumber = function(strValue) {
		if(!(gfn_isEmpty(strValue))){
			let newCallNumber = strValue.split("");
			if(newCallNumber.length==11){
				newCallNumber = strValue.slice(0,3) + "-" + strValue.slice(3,7) + "-" + strValue.slice(7,11);
			}else if(newCallNumber.length==10){
				newCallNumber = strValue.slice(0,3) + "-" + strValue.slice(3,6) + "-" + strValue.slice(6,10);
			}else if(newCallNumber.length==9){
				newCallNumber = strValue.slice(0,2) + "-" + strValue.slice(2,5) + "-" + strValue.slice(5,9);
			}else if(newCallNumber.length==8){
				newCallNumber = strValue.slice(0,4) + "-" + strValue.slice(4,8);
			}else{
				return;
			}
			return newCallNumber;
		}else{
			return;
		}
	}
</script>
</html>