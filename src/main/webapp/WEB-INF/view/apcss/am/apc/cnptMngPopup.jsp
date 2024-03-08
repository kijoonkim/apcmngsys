<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 거래처/발주수신 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">상품 출하 시 관리하고 있는 거래처 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">대형마트 발주서 접수관리는 발주정보를 자동으로 수집하기 위한 입력정보 입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCnptSech" name="btnCnptSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchCnptLgszMrkt()"></sbux-button>
					<sbux-button id="btnCnptReg" name="btnCnptReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveCnpt"></sbux-button>
					<sbux-button id="btnCnptEnd" name="btnCnptEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-cnpt')"></sbux-button>
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
								<sbux-input id=cnpt-inp-apcNm name="cnpt-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
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
							<li><span>거래처 정보</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-grdCnpt" style="height:150px; width: 100%;"></div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>대형마트 발주서 접수관리</span></li>
							</ul>
						</div>
						<div id="sb-area-grdLgszMrkt" style="height:220px; width: 100%;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	
	var grdCnpt;
	var jsonCnpt = []; // 그리드의 참조 데이터 주소 선언
	var jsonWhlsMrktCorp = [];
	
    const fn_cnptMngCreateGrid = async function() {
    	SBUxMethod.set("cnpt-inp-apcNm", SBUxMethod.get("inp-apcNm"));
    	cnptMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdCnpt';
	    SBGridProperties.id = 'grdCnpt';
	    SBGridProperties.jsonref = 'jsonCnpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListCnptMng;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {
            	caption: ["처리"], 		
            	ref: 'delYn',   	
            	type:'button', 
            	width:'60px',    
            	style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if (strValue== null || strValue == ""){
            			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdCnpt\", " + nRow + ", " + nCol + ")'>추가</button>";
            		} else {
			        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdCnpt\", " + nRow + ")'>삭제</button>";
            		}
		    	}
            },
            {caption: ["코드"], 		ref: 'cnptCd',  	type:'output', width:'80px',     style:'text-align:center',  hidden : true},
            {caption: ["거래처명"], 	ref: 'cnptNm',  	type:'input',  width:'125px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
            {
            	caption: ["유형"], 		
            	ref: 'cnptType',   	
            	type:'combo',  
            	width:'125px',    
            	style:'text-align:center',
				typeinfo : {
					ref:'comboGridCnptTypeJsData', 
					label:'label', 
					value:'value', 
					displayui : false, 
					itemcount: 10
				}
            },
            {caption: ["사업자번호"], 	ref: 'brno',  		type:'input',  width:'135px',    style:'text-align:center', typeinfo : {mask : {alias : '#-', repeat: '*'}, maxlength : 20}, validate : gfn_chkByte.bind({byteLimit: 20})},
			{caption: ["외부연계코드"], 	ref: 'extrnlLnkgCd',  		type:'input',  width:'135px',    style:'text-align:center'},
            {caption: ["담당자"], 		ref: 'picNm',  		type:'input',  width:'90px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {mask : {alias : 'k'}, maxlength : 20}},
            {caption: ["전화번호"], 	ref: 'telno',  		type:'input',  width:'120px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {maxlength : 11}, format : {type:'custom', callback : fn_newCnptMngTelno}},
            {caption: ["이메일"], 		ref: 'eml',  		type:'input',  width:'140px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 320}), typeinfo : {maxlength : 320}, format : {type:'custom', callback : fn_checkCnptMngEml}},
            {caption: ["업태"], 		ref: 'bzstat',  	type:'input',  width:'140px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 300}), typeinfo : {maxlength : 300}},
            {caption: ["종목"], 		ref: 'cls',  		type:'input',  width:'140px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 300}), typeinfo : {maxlength : 300}},
            {
            	caption: ["도매시장법인"], 		
            	ref: 'whlslMrktCorpCd',   	
            	type:'combo',  
            	width:'150px',    
            	style:'text-align:center',
				typeinfo : {
					ref:'jsonWhlsMrktCorp', 
					label: 'cdVlNm',
					value: 'cdVl', 
					unselect: {label: '', value: ''},
					displayui : false, 
					itemcount: 10,
					filtering: {
	            		usemode: true, 
	            		uppercol: 'cnptType', 
	            		attrname: 'cdChrVl',
	            		listall: false
	            	}
				},
            },
            {caption: ["비고"], 		ref: 'rmrk',  		type:'input',  width:'120px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000}), typeinfo : {maxlength : 1000}},
            {caption: ["APC코드"], 		ref: 'apcCd',  		type:'output', hidden : true},
        ];
        
        jsonWhlsMrktCorp = await gfn_getComCdDtls('WHLSL_MRKT_CORP_CD');	// 창고 
        /*
        jsonWhlsMrktCorp.forEach((item) => {
        	item.value = "10";
        });
         */
        
        grdCnpt = _SBGrid.create(SBGridProperties);
        fn_selectCnptList();
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListCnptMng = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldCnptMng,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldCnptMng() {
    	grdCnpt.exportLocalExcel("거래처 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    const fn_searchCnptLgszMrkt = async function(){

    	let rst = await Promise.all([
    		fn_selectCnptList(),
    		fn_selectLgszMrktList(),
    	])
	}

	const fn_selectCnptList = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
	    jsonCnpt.length = 0;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let cnpt = {
  						cnptCd: item.cnptCd,
  					  	cnptNm: item.cnptNm,
  					  	cnptType: item.cnptType,
  					  	brno: item.brno,
  					  	picNm: item.picNm,
  					  	telno: item.telno,
  					  	rmrk: item.rmrk,
  					  	delYn: item.delYn,
  					  	apcCd: item.apcCd,
  					  	eml: item.eml,
  					  	bzstat: item.bzstat,
  					  	cls: item.cls,
  					  	whlslMrktCorpCd: item.whlslMrktCorpCd,
  					}
  					jsonCnpt.push(cnpt);
  				});
  	        	grdCnpt.rebuild();
  	        	grdCnpt.addRow();
  	        	grdCnpt.setCellDisabled(grdCnpt.getRows() -1, 0, grdCnpt.getRows() -1, grdCnpt.getCols() -1, true);

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

	const fn_saveCnpt = async function(){
		let gridCnptData = grdCnpt.getGridDataAll();
		let gridLgszMrktData = grdLgszMrkt.getGridDataAll();

		let saveCnptList = [];
		let saveLgszMrktList = [];

		for(var i=1; i<=gridCnptData.length; i++ ){
			let rowData = grdCnpt.getRowData(i);
			let rowSts = grdCnpt.getRowStatus(i);
			let delYn = rowData.delYn;
			let cnptNm = rowData.cnptNm;
			let cnptType = rowData.cnptType;

			if(delYn == 'N'){
				if (gfn_isEmpty(cnptNm)) {
		  			gfn_comAlert("W0002", "거래처명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (gfn_isEmpty(cnptType)) {
		  			gfn_comAlert("W0002", "유형");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				
				if (!_.isEqual(cnptType, "10")) {
					rowData.whlslMrktCorpCd = "";
				}
				
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveCnptList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveCnptList.push(rowData);
				} else {
					continue;
				}
			}
		}

		for(var i=1; i<=gridLgszMrktData.length; i++ ){
			let rowData = grdLgszMrkt.getRowData(i);
			let rowSts = grdLgszMrkt.getRowStatus(i);
			let delYn = rowData.delYn;

			if (rowSts === 2){
				rowData.rowSts = "U";
				saveLgszMrktList.push(rowData);
			} else {
				continue;
			}
		}
		if(saveCnptList.length == 0 && saveLgszMrktList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let saveVOList = [
			{
				cnptList 		: saveCnptList
			  , lgszMrkttList 	: saveLgszMrktList
			}
		]

		if(gfn_comConfirm("Q0001", "저장")){

			let postJsonPromise = gfn_postJSON("/am/cmns/multiCnptLgszMrktList.do", saveVOList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchCnptLgszMrkt();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch(e) {
	        	console.error("failed", e.message);
	        }
		}

	}

	const fn_deleteCnpt = async function(cnpt, nRow){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteCnpt.do", cnpt);
		let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		grdCnpt.deleteRow(nRow);
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }
	}

	var grdLgszMrkt;
    var jsonLgszMrkt =[];
    const fn_lgszMrktMngCreateGrid = async function() {
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdLgszMrkt';
	    SBGridProperties.id = 'grdLgszMrkt';
	    SBGridProperties.jsonref = 'jsonLgszMrkt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {caption: ["대형마트 코드"], 		ref: 'lgszMrktCd',  	type:'output',  width:'100px',     style:'text-align:center'},
            {caption: ["대형마트 명"], 		ref: 'lgszMrktNm',  	type:'input',  width:'100px',     style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
            {caption: ["발주정보 URL"], 	ref: 'outordrInfoUrl',  	type:'input',  width:'300px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 2000}), typeinfo : {maxlength : 2000}},
            {caption: ["사용자ID"], 		ref: 'userId',  	type:'input',  width:'100px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 200}), typeinfo : {maxlength : 40}},
            {
            	caption: ["패스워드"],
            	ref: 'pswdDisp',
            	type:'input',
            	width:'120px',
            	style:'text-align:center',
            	userattr: {colNm: "pswd"},
            	validate : gfn_chkByte.bind({byteLimit: 40}),
            	typeinfo : {maxlength : 256}
            },
            {caption: ["사용유무"], 		ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
            {caption: ["최종처리일시"], 	ref: 'lastPrcsDt',  	type:'output',  width:'280px',    style:'text-align:center'},
            {
            	caption: ["패스워드"],
            	ref: 'pswd',
            	type:'output',
            	width:'120px',
            	style:'text-align:center',
            	hidden: true
            },

        ];
        grdLgszMrkt = _SBGrid.create(SBGridProperties);
        grdLgszMrkt.bind('valuechanged', fn_grdLgszMrktValueChanged);
        fn_selectLgszMrktList();
    }

	const fn_selectLgszMrktList = async function(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectLgszMrktList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        jsonLgszMrkt.length = 0;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let LgszMrkt = {
  						  apcCd 				: item.apcCd
  						, lgszMrktCd 			: item.lgszMrktCd
  						, lgszMrktNm 			: item.lgszMrktNm
  						, outordrInfoUrl 		: item.outordrInfoUrl
  						, userId 				: item.userId
  						, pswd 					: ""
  						, pswdDisp				: "********"
  						, useYn 				: item.useYn
  						, lastPrcsDt 			: item.lastPrcsDt
  					}
  					jsonLgszMrkt.push(LgszMrkt);
  				});
  	        	grdLgszMrkt.rebuild();

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
	const fn_newCnptMngTelno = function(strValue) {
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
		return;
	}

	const fn_checkCnptMngEml = function(strValue) {
		if(!(gfn_isEmpty(strValue))){
			if(fn_checkCnptMngEmlReturn(strValue)){
				return strValue;
			}
		}else{
			return;
		}
		return;
	}

	const fn_checkCnptMngEmlReturn = function(eml) {
		let checkEml = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return checkEml.test(eml);
	}

 	/**
     * @name fn_grdLgszMrktValueChanged
     * @description 대형마켓정보 변경 event 처리
     * @function
     */
	const fn_grdLgszMrktValueChanged = function() {
		var nRow = grdLgszMrkt.getRow();
		var nCol = grdLgszMrkt.getCol();

		const usrAttr = grdLgszMrkt.getColUserAttr(nCol);

		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdLgszMrkt.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {
				case "pswd":	// 패스워드
					rowData.pswd = rowData.pswdDisp;
					break;
				default:
					return;
			}
		}
	}


</script>
</html>