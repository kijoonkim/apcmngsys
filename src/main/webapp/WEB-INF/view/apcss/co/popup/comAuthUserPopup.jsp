<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 권한별 사용자 추가</title>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnChoiceComAuthUser" name="btnChoiceComAuthUser" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popComAuthUser.select"></sbux-button>
						<sbux-button id="btnSearchComAuthUser" name="btnSearchComAuthUser" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popComAuthUser.search"></sbux-button>
						<sbux-button id="btnCloseComAuthUser" name="btnCloseComAuthUser" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popComAuthUser.close"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<sbux-input id="comAuthUser-inp-authrtId" name="comAuthUser-inp-authrtId" uitype="hidden"></sbux-input>
				<sbux-input id="comAuthUser-inp-apcCd" name="comAuthUser-inp-apcCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="comAuthUser-inp-apcNm" name="comAuthUser-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">사용자명</th>
							<th class="td_input">
								<sbux-input id="comAuthUser-inp-userNm" name="comAuthUser-inp-userNm" uitype="text" class="form-control input-sm" onkeyenter="popComAuthUser.search" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">사용자 목록</span>
								<span style="font-size:12px">(조회건수 <span id="comAuthUser-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdComAuthUserPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">


	var grdComAuthUserPop = null;
	var jsonComAuthUserPop = []

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popComAuthUser = {
		modalId: "modal-comAuthUser",
		gridId: 'grdComAuthUserPop',
		jsonId: 'jsonComAuthUserPop',
		areaId: "sb-area-grdComAuthUserPop",
		prvApcCd: "",
		
		objGrid: null,
		gridJson: [],
		
		callbackFnc: function() {},
		init: function(_authrtId, _apcCd, _apcNm, _callbackFnc) {
			
			// set param
			SBUxMethod.set("comAuthUser-inp-authrtId", _authrtId);
			SBUxMethod.set("comAuthUser-inp-apcCd", _apcCd);
			SBUxMethod.set("comAuthUser-inp-apcNm", _apcNm);
			
			if (grdComAuthUserPop === null || this.prvApcCd != _apcCd) {
				this.createGrid();
				this.search();
			} else {
				this.search();
			}
			
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;	
			}
			
			this.prvApcCd = _apcCd;
		},
		close: function(_users) {
			gfn_closeModal(this.modalId, this.callbackFnc, _users);
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
		    SBGridProperties.columns = [
	        	{caption: ["체크박스"], 	ref: 'checked', 	width: '40px', 	type: 'checkbox',	style:'text-align: center',
					typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
		        {caption: ['순번'], 		ref: 'rowSeq', 		width: '50px', 	type: 'output', 	style: 'text-align:right'},
		        {caption: ['사용자ID'], 	ref: 'userId', 		width: '100px', type: 'output'},
		        {caption: ['사용자명'], 	ref: 'userNm', 		width: '100px', type: 'output'},
		        {caption: ['사용자유형'], 	ref: 'userTypeNm',	width: '100px', type: 'output'},
		        {caption: ['APC명'], 	ref: 'apcNm', 		width: '100px', type: 'output'},
		        {caption: ['APC코드'], 	ref: 'apcCd', 		hidden : true},
		        {caption: ['사용자유형'],	ref: 'userType', 	hidden : true}
		    ];

		    grdComAuthUserPop = _SBGrid.create(SBGridProperties);
		    grdComAuthUserPop.bind('dblclick', popComAuthUser.choice);

		    //this.search();
		},
		choice: function() {
			let nRow = grdComAuthUserPop.getRow();
			let rowData = grdComAuthUserPop.getRowData(nRow);
			popComAuthUser.close([rowData]);
		},
		select: function() {
			const users = [];
			const allData = grdComAuthUserPop.getGridDataAll();
			for ( let i=1; i<=allData.length; i++ ) {
				let rowData = grdComAuthUserPop.getRowData(i);				
				if (rowData.checked === 'true') {
					users.push(rowData);
				}
			}
			
			if (users.length == 0) {
				gfn_comAlert("W0004", "선택");	// W0004	{0}한 대상이 없습니다.
				return;
			}
			
			this.close(users);
		},
		search: async function() {
			var getColRef = grdComAuthUserPop.getColRef("checked");
			grdComAuthUserPop.setFixedcellcheckboxChecked(0, getColRef, false);
			
			// set pagination
			grdComAuthUserPop.rebuild();
	        
	    	// grid clear
	    	jsonComAuthUserPop.length = 0;
	    	grdComAuthUserPop.refresh();    	
	    	
	    	this.setGrid();
		},
		setGrid: async function() {
			
			grdComAuthUserPop.clearStatus();
	    	let authrtId = SBUxMethod.get("comAuthUser-inp-authrtId");
	    	let apcCd = SBUxMethod.get("comAuthUser-inp-apcCd");
			let userNm = SBUxMethod.get("comAuthUser-inp-userNm");
			
	        const postJsonPromise = gfn_postJSON("/co/authrt/selectAuthrtTrgtUserList.do", {
	        	authrtId: authrtId,
	        	apcCd: apcCd,
	        	userNm: userNm
			});
	        
	        const data = await postJsonPromise;
	        
			try {
	    		jsonComAuthUserPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const user = {
						rowSeq		: item.rowSeq,
						userId		: item.userId,
						userNm		: item.userNm,
						apcCd		: item.apcCd,
						apcNm		: item.apcNm,
						userType	: item.userType,
						userTypeNm	: item.userTypeNm,
						authrtId	: item.authrtId
					}
					jsonComAuthUserPop.push(user);
				});
    			grdComAuthUserPop.rebuild();
	        	
	        	document.querySelector('#comAuthUser-cnt').innerText = jsonComAuthUserPop.length;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    }
	}
</script>
</html>