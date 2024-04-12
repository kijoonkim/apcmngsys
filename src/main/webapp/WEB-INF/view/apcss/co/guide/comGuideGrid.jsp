<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <div class="sbt-A-wrap">
        <div class="main">
            <!--main content-->
            <div class="content">
                <div class="sbt-con-wrap">
                    <div class="sbt-grid-wrap">
                        <div class="sbt-wrap-header">
                            <span>icon</span>
                            <h3>Ex) Grid</h3>
                        </div>
                        <!--SBGrid 영역-->
	                    <div class="sbt-con-wrap">
	                        <div class="sbt-grid-wrap">
	                            <div class="sbt-wrap-body">
		                            <sbux-button
										id="btnCheckValue"
										name="btnCheckValue"
										uitype="normal"
										text="선택된 데이터"
										class="btn btn-sm btn-outline-danger"
										onclick="fn_checkValuePrint"
										style="float: right; margin: 0 15px 3px 0;"
									></sbux-button>
	                                <div class="sbt-grid">
	                                    <!-- SBGrid를 호출합니다. -->
	                                    <div id="gridArea" style="height:400px; width: 99%;"></div>
	                                </div>
	                                <ul class="ad_tbl_count">
										<li>
											<span style="margin-left: 30px;">실제 사용 예제 그리드</span>
										</li>
									</ul>
	                                <div class="sbt-grid">
	                                    <!-- SBGrid를 호출합니다. -->
<!-- 	                                <div id="gridArea" style="height:400px; width: 99%;"></div> -->
										<div id="exParentId" style="height:400px; width: 99%; margin-top:30px;"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">

	//only document
	window.addEventListener('DOMContentLoaded', function(e) {
	    fn_createGrid();
	    fn_createExGrid();
	});
	// 예제 그리드 json 데이터
	var jsonExGridData = [];
	
	var jsonComboType1 = [
				{'text': '정보지원시스템', 'value': 'AM'},
				{'text': '생산관리', 'value': 'FM'},
				{'text': '시스템관리', 'value': 'CO'}
	]
	var jsonComboType2 = [
		{'text': '알림톡', 'value': 'AM_001_001', 'mastervalue' : 'AM'},
		{'text': '생산정보 관리', 'value': 'AM_001_002', 'mastervalue' : 'AM'},
		{'text': '약정서 관리', 'value': 'AM_001_003', 'mastervalue' : 'AM'},
		{'text': '메뉴관리', 'value': 'CO_001', 'mastervalue' : 'CO'},
		{'text': '화면관리', 'value': 'CO_002', 'mastervalue' : 'CO'},
		{'text': '권한관리', 'value': 'CO_003', 'mastervalue' : 'CO'},
		{'text': '권한그룹관리', 'value': 'CO_003_001', 'mastervalue' : 'CO'}
	];
	var jsonRadioData = [
		{'text': '정보지원시스템', 'value': 'AM'},
		{'text': '생산관리', 'value': 'FM'},
		{'text': '시스템관리', 'value': 'CO'}
	]
	var jsonCheckboxData = [
		{'text': '정보지원시스템', 'value': 'AM'},
		{'text': '생산관리', 'value': 'FM'},
		{'text': '시스템관리', 'value': 'CO', 'checked': "checked"}
	]

	var combofilteringData = [
		{'label': 'Y', 'value': 'Y'},
		{'label': 'N', 'value': 'N'}
	]

	// Grid Data
    var gridData = [
    	{'no': '1', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '2', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '3', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '4', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '5', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '6', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '7', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '8', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '9', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '10', 'userCd':'0001', 'userNm':'홍길동', 'jbttlNm':'대리', 'tkcgTaskNm':'개발', 'chrgdCertYn':'N', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'},
    	{'no': '11', 'userCd':'0002', 'userNm':'김말순', 'jbttlNm':'사원', 'tkcgTaskNm':'개발', 'chrgdCertYn':'Y', 'lckYn':'N', 'useYn':'Y', 'rmrk':'비고'}

    ]; // 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {

    	let SBGridProperties = {};								// Grid 설정 객체
	    SBGridProperties.parentid = 'gridArea';					// Grid 표현할 영역
	    SBGridProperties.id = 'datagrid';						// Grid ID
	    SBGridProperties.jsonref = 'gridData';					// Grid 객체 Data
        SBGridProperties.emptyrecords = '데이터가 없습니다.'; 	// 결과값이 없을 경우 보여지는 문구
        SBGridProperties.selectmode = 'byrow';					// Grid 선택 단위 btrow : 행 , free : 셀
	    SBGridProperties.extendlastcol = 'scroll';				// Grid 남는 넓이 우측 확장 기능
	    SBGridProperties.allowcopy = true;						// Grid 복사 기능
	    SBGridProperties.explorerbar = 'sortmove';				// sort기능 여부
	    SBGridProperties.oneclickedit = true;					// Grid 원클릭 수정 defult: false
	    // * 필수 * type = page : DB페이징 의 경우 , all : front페이징의 경우(데미터 전체 호출 후 페이징처리 - 데이터가 많을 경우 비추천) 기본 -> page
	    // * 필수 * count = 페이징 영역내 버튼 갯수
	    // * 필수 * size = Grid 화면 내 표시할 행의 갯수
	    // sorttype = 헤더 클릭 정렬 시 기준 page : 현재 화면 기준으로 정렬 , all : 전체 데이터 기준으로 정렬
	    // showgalpageui = 페이징 이동 UI 설정 (default : false)
	    SBGridProperties.paging = {
	    		  'type' : 'all',
	    		  'count' : 5,
	    		  'size' : 15,
	    		  'sorttype' : 'all',
	    		  'showgoalpageui' : true
   		};
        SBGridProperties.columns = [
			{caption: ["체크박스"], 	ref: 'checkedYn', 		type: 'checkbox', 	width: '50px',	  style:'text-align: center',
    				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["순번"], 		ref: 'no',  		type:'input',  width:'50px',     style:'text-align:center'},
            {caption: ["사용자 코드"], 	ref: 'userCd',  	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["사용자 명"], 	ref: 'userNm',   	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["직책"], 		ref: 'jbttlNm',   	type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["담당업무"], 	ref: 'tkcgTaskNm',  type:'input',  width:'100px',    style:'text-align:center'},
            {caption: ["inputButton"], 	ref: 'test',  type:'inputbutton',  width:'100px',    style:'text-align:center'},
            {caption: ["권한"], 		ref: 'chrgdCertYn', type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue === "N"){
            		return "<button type='button' onClick='fn_chrgdCert(\"APPOROVAL\", " + nRow + ", " + nCol + ")'>사용승인</button>";
            	}else{
			        return "<button type='button' onClick='fn_chrgdCert(\"CANCEL\", " + nRow + ", " + nCol + ")'>승인취소</button>";
            	}
		    }},
            {caption: ["비밀번호"], 	ref: 'lckYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	return "<button type='button' onClick='fn_pwReSet(" + nRow + ", " + nCol +")'>초기화</button>";
            }},
            {caption: ["사용유무"], 	ref: 'useYn',   	type:'combo',   width:'100px',    style:'text-align:center',
    			typeinfo : {ref:'combofilteringData', label:'label', value:'value', displayui : true}},
            {caption: ["비고"], 		ref: 'rmrk',   	type:'output',  width:'150px',    style:'text-align:center'},
    		{caption: ["적용기준일자"], ref: 'aplcnCrtrYmd', 	type : 'datepicker', typeinfo: {dateformat: 'YYYY-MM-DD'}, format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYY-MM-DD'},  width:'200px',    style:'text-align:center'},
        ];
        window.datagrid = _SBGrid.create(SBGridProperties);
        datagrid.bind( "beforepagechanged" , "fn_Paging" );
        datagrid.bind('valuechanged', fn_grdCheckValueChanged);
    }

    function fn_chrgdCert(gubun, nRow, nCol){
    	if(gubun === 'APPOROVAL'){
    		datagrid.setCellData(nRow, nCol, "Y", true);
    	}else if(gubun === 'CANCEL'){
    		datagrid.setCellData(nRow, nCol, "N", true);
    	}
    }

    function fn_pwReSet(nRow, nCol){
		var row = datagrid.getRowData(nRow);
		gfn_comAlert("E0000", row.userNm + "님의 비밀번호가 초기화 되었습니다.");
    }

    function fn_Paging(){
		var nLimitCount = datagrid.getPageSize(); // 몇개의 데이터를 가져올지 설정
		var nIndexStart = (datagrid.getSelectPageIndex() - 1) * nLimitCount; // 몇번째 인덱스 부터 데이터를 가져올지 설정
		var objData = {
			"firstIndexSB" : nIndexStart,
			"limitCountSB" : nLimitCount
		}
		$.ajax({
			url : "",
			type : "POST",
			data : objData,
			dataType : 'json',
			async : false, // async 는 반드시 false로 사용해 주셔야 합니다.
			success : function(result) {
				var resultData = JSON.parse(result.reponseData); // server측에서 넘어온 페이징된 조회결과목록
				gridData = resultData;
				if (datagrid.getPageTotalCount() != result.totalCnt) { // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					datagrid.setPageTotalCount(result.totalCnt); // 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					datagrid.rebuild(); // 페이지 load 이후 조회하는 형태로 처음 데이터 바인딩시 반드시 rebuild해줘야 합니다.
				} else
					datagrid.refresh()
			},
			error : function(req, stat, error) {
				console.log(error);
			}
		});
	}
    
    // 데이터 변경시 자동 체크
	const fn_grdCheckValueChanged = function(){

		let nRow = datagrid.getRow();
		let nCol = datagrid.getCol();
		let no = datagrid.getColRef("no");
		let userCd = datagrid.getColRef("userCd");
		let userNm = datagrid.getColRef("userNm");
		let jbttlNm = datagrid.getColRef("jbttlNm");
		let tkcgTaskNm = datagrid.getColRef("tkcgTaskNm");
		let test = datagrid.getColRef("test");
		let checkedYnCol = datagrid.getColRef("checkedYn");
		
		datagrid.setCellData(nRow, checkedYnCol, "Y");
	}
    
    
    function fn_createExGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'exParentId';
	    SBGridProperties.id = 'exGridId';
	    SBGridProperties.jsonref = 'jsonExGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.filtering = true;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 100,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["입고번호","입고번호"],		ref: 'wrhsno',      type:'output', hidden: true},
            {caption: ["팔레트번호","팔레트번호"],    ref: 'pltno',      type:'output',  width:'105px',    style:'text-align:center',  filtering : {usemode : false}},
            {caption: ["입고일자","입고일자"],        ref: 'wrhsYmd',      type:'output',  width:'90px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  filtering : {usemode : false}},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      type:'output',  width:'110px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["상품","상품"],				ref: 'gdsSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["입고","입고"],				ref: 'wrhsSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["운송","운송"],				ref: 'trsprtSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["입고","수량"],				ref: 'wrhsQntt',      	type:'output',  width:'85px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'},  filtering : {usemode : false}
	        },
	        {caption: ["입고","중량 (Kg)"],		ref: 'wrhsWght',      	type:'output',  width:'85px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'},  filtering : {usemode : false}
	        },
	        {caption: ["투입","수량"],				ref: 'inptQntt',      	type:'output',  width:'85px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'},  filtering : {usemode : false}
	        },
	        {caption: ["투입","중량 (Kg)"],		ref: 'inptWght',      	type:'output',  width:'85px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'},  filtering : {usemode : false}
	        },
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'85px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'},  filtering : {usemode : false}
        	},
	        {caption: ["현 재고","중량 (Kg)"],		ref: 'invntrWght',      type:'output',  width:'85px',    style:'text-align:right',
	        	format : {type:'number', rule:'#,###'},  filtering : {usemode : false}
	        },
	        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'200px', style:'text-align:center',  filtering : {usemode : false}},
	    ];

	    exGridId = _SBGrid.create(SBGridProperties);
	    exGridId.bind( "beforepagechanged" , "fn_pagingGrd" );

	    fn_pagingGrd();
	}
	
	 // 공통코드 페이징
    const fn_pagingGrd = async function(){
    	let pageSize = exGridId.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = exGridId.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

    	fn_callSelectGrid1List(pageSize, pageNo);
    }
	 
	const fn_callSelectGrid1List = async function(pageSize, pageNo) {

		const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			  apcCd					: gv_selectedApcCd
          	// pagination
  	  		, pagingYn 				: 'Y'
  	  		, currentPageNo 		: pageNo
  	  		, recordCountPerPage 	: pageSize

  		});

        let data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonExGridData.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const exSearchData = {
  	       				wrhsno			: item.wrhsno
  	       			  , pltno			: item.pltno
  	       			  , wrhsYmd			: item.wrhsYmd
  	       			  , prdcrNm			: item.prdcrNm
  	       			  , itemNm			: item.itemNm
  	       			  , vrtyNm			: item.vrtyNm
  	       			  , gdsSeNm			: item.gdsSeNm
  	       			  , wrhsSeNm		: item.wrhsSeNm
  	       			  , trsprtSeNm		: item.trsprtSeNm
  	       			  , warehouseSeNm	: item.warehouseSeNm
  	       			  , bxknd			: item.bxknd
  	       			  , grdNm			: item.grdNm
  	       			  , wrhsQntt		: item.wrhsQntt
  	       			  , wrhsWght		: item.wrhsWght
  	       			  , inptQntt		: item.inptQntt
  	       			  , inptWght		: item.inptWght
  	       			  , invntrQntt		: item.invntrQntt
  	       			  , invntrWght		: item.invntrWght
  	       			  , rmrk			: item.rmrk
  	  				}
  	          		jsonExGridData.push(exSearchData);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});
  	          	
  	          	if (jsonExGridData.length > 0) {
  	          		if(exGridId.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			exGridId.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			exGridId.rebuild();
  	  				}else{
  	  					exGridId.refresh();
  	  				}

  	          	} else {
  	          		exGridId.setPageTotalCount(totalRecordCount);
  	          		exGridId.rebuild();
  	          	}

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

          } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
          }

    }
	
	// 선택된 데이터 버튼 클릭시 선택한 행 출력 함수
	function fn_checkValuePrint(){
		let grdRows = datagrid.getCheckedRows(0);
		
		alert('선택된 행은 ' + grdRows + '행 입니다.');
		
	}
</script>
</body>
</html>