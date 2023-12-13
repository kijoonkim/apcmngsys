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
						<sbux-button id="btnChoiceComAuthUser" name="btnChoiceComAuthUser" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popComAuthUser.choice"></sbux-button>
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
		
		objGrid: null,
		gridJson: [],
		
		callbackFnc: function() {},
		init: function(_authrtId, _apcCd, _apcNm, _callbackFnc) {
			
			// set param
			SBUxMethod.set("comAuthUser-inp-authrtId", _authrtId);
			SBUxMethod.set("comAuthUser-inp-apcCd", _apcCd);
			SBUxMethod.set("comAuthUser-inp-apcNm", _apcNm);
			
			if (grdComAuthUserPop === null) {
				this.createGrid();	
			} else {
				this.search();
			}
			
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;	
			}
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
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
	            {caption : ["<input type='checkbox' onchange='popComAuthUser.checkAll(this);'>"],
	                ref: 'checked', type: 'checkbox',   style: 'text-align:center'
	            },
		        {caption: ['순번'], ref: 'rowSeq', width: '50px', type: 'output', style: 'text-align:right'},
		        {caption: ['사용자ID'], ref: 'userId', width: '100px', type: 'output'},
		        {caption: ['사용자명'], ref: 'userNm', width: '100px', type: 'output'},
		        {caption: ['사용자유형'], ref: 'userTypeNm', width: '100px', type: 'output'},
		        {caption: ['APC명'], ref: 'apcNm', width: '100px', type: 'output'},
		        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
		        {caption: ['사용자유형'], ref: 'userType', hidden : true}
		    ];

		    grdComAuthUserPop = _SBGrid.create(SBGridProperties);
		    grdComAuthUserPop.bind('beforepagechanged', 'popComAuthUser.paging');

		    //this.search();
		},
		choice: function() {
			const users = [];
			const allData = grdComAuthUserPop.getGridDataAll();
			for ( let i=1; i<=allData.length; i++ ) {
				let rowData = grdComAuthUserPop.getRowData(i);				
				if (rowData.checked === 'true') {
					users.push({
						userId: rowData.userId,
						userNm: rowData.userNm,
						apcCd: rowData.apcCd,
						apcNm: rowData.apcNm,
						userType: rowData.userType,
						userTypeNm: rowData.userTypeNm,
						authrtId: rowData.authrtId
					});
				}
			}
			
			if (users.length == 0) {
				gfn_comAlert("W0004", "선택");	// W0004	{0}한 대상이 없습니다.
				return;
			}
			
			this.close(users);
		},
		search: async function() {
			// set pagination
			grdComAuthUserPop.rebuild();
	    	let pageSize = grdComAuthUserPop.getPageSize();
	    	let pageNo = 1;
	        
	    	// grid clear
	    	jsonComAuthUserPop.length = 0;
	    	grdComAuthUserPop.refresh();    	
	    	
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
			
			grdComAuthUserPop.clearStatus();
	    	let authrtId = SBUxMethod.get("comAuthUser-inp-authrtId");
	    	let apcCd = SBUxMethod.get("comAuthUser-inp-apcCd");
			let userNm = SBUxMethod.get("comAuthUser-inp-userNm");
			
	        const postJsonPromise = gfn_postJSON("/co/authrt/selectAuthrtTrgtUserList.do", {
	        	authrtId: authrtId,
	        	apcCd: apcCd,
	        	userNm: userNm,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});
	        
	        const data = await postJsonPromise;
	        
			try {
				
	        	/** @type {number} **/
	    		let totalRecordCount = 0;
	        	
	    		jsonComAuthUserPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const user = {
						rowSeq: item.rowSeq,
						userId: item.userId,
						userNm: item.userNm,
						apcCd: item.apcCd,
						apcNm: item.apcNm
					}
					jsonComAuthUserPop.push(user);
					
					if (index === 0) {
						totalRecordCount = item.totalRecordCount;	
					}
				});
	        	
	        	if (jsonComAuthUserPop.length > 0) {
	        		
	        		if(grdComAuthUserPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdComAuthUserPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdComAuthUserPop.rebuild();
					}else{
						grdComAuthUserPop.refresh();
					}
	        	} else {
	        		grdComAuthUserPop.setPageTotalCount(totalRecordCount);
	        		grdComAuthUserPop.rebuild();
	        	}
	        	
	        	document.querySelector('#comAuthUser-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdComAuthUserPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdComAuthUserPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popComAuthUser.setGrid(recordCountPerPage, currentPageNo);
	    },
	    checkAll: function(obj) {
			var gridList = grdComAuthUserPop.getGridDataAll();
	         //var checkedYn = obj.checked ? "Y" : "N";
	        for (var i=0; i<gridList.length; i++ ){
	        	grdComAuthUserPop.setCellData(i+1, 0, obj.checked, true, false);
	    	}
	    }
	}
</script>

</html>