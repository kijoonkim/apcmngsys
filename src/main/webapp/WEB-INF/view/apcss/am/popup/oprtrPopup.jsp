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
						<span style="font-weight:bold;">생산작업자 정보를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">차후 작업자별 작업시간을 관리하기 위한 기초 정보입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchOprtr" name="btnSearchOprtr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popOprtr.search"></sbux-button>
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
						<col style="width: 200px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=oprtr-inp-apcNm name="oprtr-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th scope="row">작업자명</th>
							<th>
								<sbux-input id=oprtr-inp-flnm name="oprtr-inp-flnm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
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
					<div id="sb-area-grdOprtr" style="height:250px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	//설비 등록
	var jsonOprtrPop = []; // 그리드의 참조 데이터 주소 선언
	
	const popOprtr = {
		modalId: 'modal-oprtr',
		gridId: 'grdOprtrPop',
		jsonId: 'jsonOprtrPop',
		areaId: "sb-area-grdOprtr",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _oprtr, _callbackChoiceFnc) {
			this.prvApcCd = _apcCd;
			SBUxMethod.set("oprtr-inp-apcNm", _apcNm);
			SBUxMethod.set("oprtr-inp-flnm", _oprtr);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			this.createGrid();
			this.search();
		},
		close: function(_oprtr) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _oprtr);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		        {caption: ["작업자명"], 	ref: 'flnm',  	type: 'output',  width:'90px',	style:'text-align:center',
		        	typeinfo : {mask : {alias : 'k'}}},
		        {caption: ["생년월일"], 	ref: 'brdt',   	type: 'output',  width:'90px',	style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}},
		        {caption: ["전화번호"], 	ref: 'telno',   type: 'output',  width:'100px',	style:'text-align:center',
		        	typeinfo : {mask: {alias : '999-9999-9999'}}, format : {type:'custom', callback : fnCustomOprtr}},
		        {caption: ["주소"], 		ref: 'addr',    type: 'output',  width:'170px',	style:'text-align:center'},
		        {caption: ["입사일자"], 	ref: 'jncmp', 	type: 'output',  width:'90px',	style:'text-align:center',
			        typeinfo: {dateformat: 'yy-mm-dd'}, format : {type:'date', rule:'yy-mm-dd', origin:'YYYYMMDD'}},
		        {caption: ["은행"], 		ref: 'bankCd',  type: 'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["계좌번호"], 	ref: 'actno',   type: 'output',  width:'130px',	style:'text-align:center',
	    			typeinfo : {mask : {alias : '#-', repeat: '*'}}},
		        {caption: ["예금주명"], 	ref: 'dpstr',   type: 'output',  width:'90px',	style:'text-align:center'}
		    ];
		    grdOprtrPop = _SBGrid.create(SBGridProperties);
		    grdOprtrPop.bind('dblclick', popOprtr.choice);
		},
		choice: function() {
			let nRow = grdOprtrPop.getRow();
			let rowData = grdOprtrPop.getRowData(nRow);
			popOprtr.close(rowData);
		},
		search: async function() {
			let apcCd = this.prvApcCd;

			grdOprtrPop.rebuild();
	    	let pageSize = grdOprtrPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonOprtrPop.length = 0;
	    	grdOprtrPop.refresh();
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
			jsonOprtrPop = [];

			let apcCd = this.prvApcCd;
			let flnm = SBUxMethod.get("oprtr-inp-flnm");
	    	let postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrList.do", {apcCd : apcCd, flnm : flnm});
	        let data = await postJsonPromise;
	        try{
	    		let totalRecordCount = 0;
	    		
	    		jsonOprtrPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					let oprtrVO = {
						flnm 	: 	item.flnm
					  , brdt 	:	item.brdt
					  , telno 	: 	item.telno
					  , addr 	: 	item.addr
					  , jncmp 	: 	item.jncmp
					  , bankCd 	: 	item.bankCd
					  , actno 	: 	item.actno
					  , dpstr 	: 	item.dpstr
					}
					jsonOprtrPop.push(oprtrVO);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

		    	if (jsonOprtrPop.length > 0) {
	        		if(grdOprtrPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdOprtrPop.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdOprtrPop.rebuild();
					}else{
						grdOprtrPop.refresh();
					}
	        	} else {
	        		grdOprtrPop.setPageTotalCount(totalRecordCount);
	        		grdOprtrPop.rebuild();
	        	}
	        }catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
		}
	}

	const fnCustomOprtr = function(strValue) {
        return strValue.slice(0,3) + "-" + strValue.slice(3,7) + "-" + strValue.slice(7,11)
    }
</script>
</html>