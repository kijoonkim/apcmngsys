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
	                                <div class="sbt-grid">
	                                    <!-- SBGrid를 호출합니다. -->
	                                    <div id="gridArea" style="height:400px; width: 99%;"></div>
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
	});
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
            {caption: ["순번"], 		ref: 'no',  		type:'output',  width:'50px',     style:'text-align:center'},
            {caption: ["사용자 코드"], 	ref: 'userCd',  	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["사용자 명"], 	ref: 'userNm',   	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["직책"], 		ref: 'jbttlNm',   	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["담당업무"], 	ref: 'tkcgTaskNm',  type:'output',  width:'100px',    style:'text-align:center'},
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
</script>
</body>
</html>