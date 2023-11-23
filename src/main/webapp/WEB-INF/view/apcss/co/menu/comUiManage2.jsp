<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="/resource/css/template_com.css" rel="stylesheet" type="text/css">
    <script>
        var SBUxConfig = {
            Path: '/resource/sbux/',
            SBGrid: {
                Version2_5: true
            },
            SBChart: {
                Version2_0: true
            }
        }
    </script>
    <script src="/resource/sbux/SBUx.js"></script>
    <script src="/resource/script/common.js"></script>
    <!------------------ 컴포넌트 테마 CSS ------------------>
	<link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>
	<link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">

	<link href="/resource/css/sbgrid_custom.css" rel="stylesheet" type="text/css">
    <!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 시작-->
    <!-- favicon -->
	<link rel="apple-touch-icon" href="/resource/images/favicon.png">
	<link rel="shortcut icon" href="/resource/images/favicon.ico">
	<!-- //favicon -->

	<!-- [pp] icon -->
	<link rel="stylesheet" href="/resource/src/font-awesome/css/font-awesome.min.css">
	<!-- [pp] font-awesome 파이어폭스 미출력 에러 대응 -->
	<link rel="stylesheet" href="/resource/css/font-awesome/4.7.0/css/font-awesome.css">
	<!-- [pp] //font-awesome 파이어폭스 미출력 에러 대응 -->
	<link rel="stylesheet" href="/resource/src/remixicon/fonts/remixicon.css">
	<!-- [pp] //icon -->

	<!-- css -->
	<link rel="stylesheet" href="/resource/src/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-adminLTE/css/_all-skins.min.css">
	<link rel="stylesheet" href="/resource/src/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="/resource/src/dataTables/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="/resource/src/dataTables/css/select.dataTables.min.css">
	<link rel="stylesheet" href="/resource/src/mCustomScrollbar/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="/resource/src/select2/css/select2.css">
	<link rel="stylesheet" href="/resource/src/apexchart/css/apexcharts.css">
	<link rel="stylesheet" href="/resource/css/dl_global.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_common.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_custom.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_table.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_ui.css">
	<link rel="stylesheet" href="/resource/css/admin/dl_popup.css">
	<!-- //css -->

	<!-- js -->
	<script src="/resource/src/jquery/js/jquery-3.5.1.min.js"></script>
	<script src="/resource/src/jquery/js/jquery.mousewheel.min.js"></script>
	<script src="/resource/src/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resource/src/bootstrap-adminLTE/js/adminlte.js"></script>
	<script src="/resource/src/bootstrap-adminLTE/js/demo.js"></script>
	<script src="/resource/src/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<script src="/resource/src/dataTables/js/jquery.dataTables.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.bootstrap.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.buttons.min.js"></script>
	<script src="/resource/src/dataTables/js/dataTables.select.min.js"></script>
	<script src="/resource/src/dataTables/js/jszip.min.js"></script>
	<script src="/resource/src/dataTables/js/pdfmake.min.js"></script>
	<script src="/resource/src/mCustomScrollbar/js/jquery.mCustomScrollbar.min.js"></script>
	<script src="/resource/src/select2/js/select2.min.js"></script>
	<script src="/resource/src/apexchart/js/apexcharts.js"></script>
	<script src="/resource/js/admin/pp_ui.js"></script>

</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<h3 class="box-title"> ▶ 화면관리</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-primary" text="저장" onclick="fn_save" disabled></sbux-button>
                        <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete" disabled></sbux-button>
                        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search" ></sbux-button>
					</div>
				</div>
			</div>
			<div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 10%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 4%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r">시스템구분</th>
							<th class="ta_r" colspan="2">
								<sbux-select id="srchComboSysId" name="srchComboSysId" uitype="single" jsondata-ref="jsonSearchComboSysId" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</th>
							<th class="ta_r">화면ID</th>
							<th class="ta_r" colspan="1">
								<sbux-input id="srchMenuId" name="srchMenuId" uitype="text"  class="form-control fl_fluid" placeholder="화면ID 입력"></sbux-input>
							</th>
							<th class="ta_r">화면명</th>
							<th class="ta_r" colspan="2">
								<sbux-input id="srchMenuNm" name="srchMenuNm" uitype="text" class="form-control fl_fluid"  placeholder="화면명 입력"></sbux-input>
							</th>
							<th></th>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>화면목록</span></li>
					</ul>
				</div>
				<div id="menuGridArea" style="height:250px; width: 100%"></div>
				<br>
				<br>
				<div style="flex-direction: row; display: flex;">
					<div>
					<b>화면상세정보</b>
					<div class="ad_tbl_top">
						<div class="ad_tbl_toplist" >
							<br>
						</div>
					</div>
					<table class="table table-bordered table-hover tbl_col tbl_fixed" style="width: 95%;">
						<colgroup>
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 25%">
						</colgroup>
						<thead>
							<tr>
								<th>화면ID</th>
                                <td>
                                    <sbux-input id="menuId" name="menuId" uitype="text" style="width:100%" readonly></sbux-input>
                                </td>
                                <th>화면명</th>
                                <td>
                                    <sbux-input id="menuNm" name="menuNm" uitype="text" style="width:100%" ></sbux-input>
                                </td>
							</tr>
							<tr>
							<th>화면경로</th>
							    <td colspan="3">
							        <sbux-input id="pageUrl" name="pageUrl" uitype="text" style="width:100%" ></sbux-input>
							    </td>
							</tr>
							<tr>
							    <th>화면유형</th>
							    <td>
							        <sbux-input id="menuTypeNm" name="menuTypeNm" uitype="text" style="width:100%" readonly></sbux-input>
							    </td>
							    <th>사용여부</th>
							    <td>
							        <sbux-select id="delYn" name="delYn"  uitype="single" jsondata-ref="jsonViewComboUseYn" unselected-text="선택">
							        </sbux-select>
							    </td>
							</tr>
							<tr>
							    <th>최초등록자</th>
							    <td>
							        <sbux-input id="sysFrstInptUserId" name="sysFrstInptUserId" uitype="text" style="width:100%" readonly></sbux-input>
							    </td>
							    <th>최종변경자</th>
							    <td>
							        <sbux-input id="sysLastChgUserId" name="sysLastChgUserId" uitype="text" style="width:100%" readonly></sbux-input>
							    </td>
							</tr>
							<tr>
							    <th>최초등록일시</th>
							    <td>
							        <sbux-input id="sysFrstInptDt" name="sysFrstInptDt" uitype="text" style="width:100%" readonly ></sbux-input>
							    </td>
							    <th>최종변경일시</th>
							    <td>
							        <sbux-input id="sysLastChgDt" name="sysLastChgDt" uitype="text" style="width:100%" readonly></sbux-input>
							    </td>
							</tr>
							<tr>
							    <th>최초등록프로그램</th>
							    <td>
							        <sbux-input id="sysFrstInptPrgrmId" name="sysFrstInptPrgrmId" uitype="text" style="width:100%" readonly></sbux-input>
							    </td>
							    <th>최종변경프로그램</th>
							    <td>
							        <sbux-input id="sysLastChgPrgrmId" name="sysLastChgPrgrmId" uitype="text" style="width:100%" readonly></sbux-input>
							    </td>
</tr>
						</thead>
					</table>

					</div>
					<div>
						<b>개체목록</b>
						<div class="ad_tbl_top">
							<div class="ad_tbl_toplist" >
								<button type="button" class="btn btn-sm btn-outline-danger" >행추가</button>
								<button type="button" class="btn btn-sm btn-outline-danger" >행삭제</button>
							</div>
						</div>
						<table class="table table-bordered table-hover tbl_col tbl_fixed">
							<colgroup>
								<col style="width: 3%">
								<col style="width: 23%">
								<col style="width: 27%">
								<col style="width: 22%">
								<col style="width: 10%">
								<col style="width: 15%">
							</colgroup>
							<thead>
								<tr>
									<th>
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1" >
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</th>
									<th>id</th>
									<th>명칭</th>
									<th>유형</th>
									<th>센터</th>
									<th>표시여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1" >
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</td>
									<td>btnSearch</td>
									<td>조회</td>
									<td>
										<select class="form-control input-sm">
											<option>버튼</option>
										</select>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1" >
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</td>
									<td>grpInsert</td>
									<td>등록GROUP</td>
									<td>
										<select class="form-control input-sm">
											<option>그룹</option>
										</select>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p class="ad_input_row">
											<input type="checkbox" class="check" id="check1" >
											<label class="check_label ta_i" for="check1">선택</label>
										</p>
									</td>
									<td>idbGrpid</td>
									<td>그룹id</td>
									<td>
										<select class="form-control input-sm">
											<option>유효성</option>
										</select>
									</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_createMenuGrid();
    	fn_createMenuUiGrid();
    });
    //조회조건
    var jsonSearchComboSysId = [];
    var jsonViewComboUseYn = [];
    gfn_setComCdSelect('srchComboSysId', jsonSearchComboSysId ,	'SYS_ID', '0000');		// 검색 조건(시스템구분)
    gfn_setComCdSelect('useYn', 		 jsonViewComboUseYn , 	'USE_YN', '0000');		// 화면 상세(사용유무)
    //gfn_setComCdSelectGrid('useYn', 		 delYnComboData , 		'USE_YN', '0000');	// 그리드 (표시유무)
    //gfn_setComCdSelectGrid('delYn', 		 delYnComboData , 		'USE_YN', '0000');	// 그리드 (표시유무)
    //gfn_setComCdSelectGrid('entyType', 		 entyTypeComboData , 		'ENTY_TYPE', '0000');	// 그리드 (표시유무)


    //선택 삭제
    function fn_delete() {
        var delList = new Array();
        var gridList = datagrid.getGridDataAll();
        for (var i=0; i<gridList.length; i++) {
            if (gridList[i].checked === "Y") {
                delList.push(gridList[i].pageId);
            }
        }
        if (delList.length == 0) {
            alert("삭제 할 대상이 없습니다.");
            return;
        }
        var delMsg = "삭제 하시겠습니까?";
        if (confirm(delMsg)) {
            var params = "delId=" + delList.join(",");
        }
    }
    //저장
    async function fn_save() {

        if (!SBUxMethod.get("menuNm")) {
            alert("화면명를 입력하세요.");
            return;
        }
        if (!SBUxMethod.get("pageUrl")) {
            alert("화면경로를 입력하세요.");
            return;
        }
        if (!SBUxMethod.get("delYn")) {
            alert("사용유무를 선택해주세요.");
            return;
        }
        let updateResult = 0;
        let insertResult = 0;
        var rowData = menuDatagrid.getRowData(menuDatagrid.getRow());

        insertComUiList = [];

        let gridList = uiDataGrid.getGridDataAll();
        for(var i=0; i < gridList.length; i++){
        	if(gridList[i].checked === 'Y'){
        		insertComUiList.push(gridList[i]);
        	}
        }

        if((!(SBUxMethod.get("munuNm") === rowData.numeNm && SBUxMethod.get("pageUrl") === rowData.pageUrl && SBUxMethod.get("delYn") === rowData.delYn)) || insertComUiList.length == 0){
        	alert("변경 된 내용이 없습니다.");
        	return;
        }
        var seveMsg = "저장 하시겠습니까?";
        if(confirm(seveMsg)){

	        if(!(SBUxMethod.get("munuNm") === rowData.numeNm && SBUxMethod.get("pageUrl") === rowData.pageUrl && SBUxMethod.get("delYn") === rowData.delYn)){
	        	updateResult = fn_callUpdateMenu();
	        }
	        if(insertComUiList.length > 0){
	        	insertResult = fn_callInsertComUi(insertComUiList);
	        }
        }

        if(updateResult + insertResult > 0){
        	fn_setGridData();
        	alert("저장 되었습니다.");
        }
    }

    async function fn_callUpdateMenu(){
        let menuId = SBUxMethod.get('menuId');
        let menuNm = SBUxMethod.get('menuNm');
        let pageUrl = SBUxMethod.get('pageUrl');
        let useYn = SBUxMethod.get('delYn');
        let delYn;
        if(useYn == "Y"){
        	delYn == 'N';
        }else if(useYn == 'N'){
        	delYn == 'Y'
        }
        let menuVO = {
        		menuId : menuId,
        		menuNm : menuNm,
        		pageUrl : pageUrl,
        		delYn : delYn
        }
        let postJsonPromise = gfn_postJSON("/co/menu/updateMenu.do", menuVO);
        let data = await postJsonPromise;
        try{
        	return data.result;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    async function fn_callInsertComUi(comUiList){
        let postJsonPromise = gfn_postJSON("/co/menu/insertComUiList.do", comUiList);
        let data = await postJsonPromise;
        try{
        	return data.result;

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    //목록 조회
    function fn_search() {
        //시스템구분 확인
        var srchComboSysId = SBUxMethod.get("srchComboSysId");
        if (!srchComboSysId) {
            alert("시스템구분을 선택하세요.");
            return;
        }
        //
        fn_setGridData("init");
    }
    //상세정보 보기
    function fn_view(args) {
        var nCol = menuDatagrid.getCol();
        if (args == undefined) {
            //특정 열 부터 이벤트 적용
            if (nCol < 2) {
                return;
            }
        }
        var nRow = menuDatagrid.getRow();
        if (nRow < 1) {
            return;
        }
        SBUxMethod.set("gubun", "M");
        var rowData = menuDatagrid.getRowData(nRow);
        SBUxMethod.set("menuId", rowData.menuId);
        SBUxMethod.set("menuNm", rowData.menuNm);
        SBUxMethod.set("menuTypeNm", rowData.menuTypeNm);
        SBUxMethod.set("pageUrl", rowData.pageUrl);
        SBUxMethod.set("type", rowData.type);
        SBUxMethod.set("delYn", rowData.delYn);
        SBUxMethod.set("sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
        SBUxMethod.set("sysLastChgDt", rowData.sysLastChgDt);

        //선택 행 개체목록 조회
        fn_setUiGridData();
      	//버튼 활성화
        SBUxMethod.attr("btnSave", "disabled", false);
        SBUxMethod.attr("btnDelete", "disabled", false);
    }
    //그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checked");
        for (var i=0; i<gridList.length; i++) {
            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    }

    var menuGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createMenuGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'menuGridArea';
	    SBGridProperties.id = 'menuDatagrid';
	    SBGridProperties.jsonref = 'menuGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["NO"],   		ref: 'rowSeq',      		type:'output',  width:'50px',    style:'text-align:center'},
            {caption: ["화면ID"],   	ref: 'menuId',      		type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["화면명"],   	ref: 'menuNm',      		type:'output',  width:'200px',    style:'text-align:left'},
            {caption: ["화면유형"], 	ref: 'menuType',    		type:'output',  hidden: true},
            {caption: ["화면유형"], 	ref: 'menuTypeNm',    		type:'output',  width:'100PX',    style:'text-align:center'},
            {caption: ["화면경로"], 	ref: 'pageUrl',     		type:'output',  width:'250px',    style:'text-align:left'},
            {caption: ["사용여부"], 	ref: 'delYn',       		type:'output',  width:'100px',    style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue == "Y" ? "사용" : "미사용";
                }
            },
            {caption: ["등록자"],   		ref: 'sysFrstInptUserId',   type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["등록프로그램"], 	ref: 'sysFrstInptPrgrmId', 	type:'output',  hidden: true},
            {caption: ["등록일시"], 		ref: 'sysFrstInptDt', 		type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["최종변경자"],   	ref: 'sysLastChgUserId',   	type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["최종변경프로그램"], ref: 'sysLastCngPrgrmId', 	type:'output',  hidden: true},
            {caption: ["최종변경일시"], 	ref: 'sysLastChgDt', 		type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["APC코드"], 			ref: 'apcCd', 				type:'output',  hidden: true}
        ];
        menuDatagrid = _SBGrid.create(SBGridProperties);
        menuDatagrid.bind('click', 'fn_view');
    }

    async function fn_setGridData(args) {
        let sysId = SBUxMethod.get('srchComboSysId');
        let menuId = SBUxMethod.get('srchMenuId');
        let menuNm = SBUxMethod.get('srchMenuNm');
        let menuVO = {
        		sysId : sysId,
        		menuId : menuId,
        		menuNm : menuNm
        }
        let postJsonPromise = gfn_postJSON("/co/menu/selectMenuUiList.do", menuVO);
        let data = await postJsonPromise;
		let newMenuGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let menuList = {
						rowSeq : item.rowSeq,
						menuId : item.menuId,
						menuNm : item.menuNm,
						menuType : item.menuType,
						menuTypeNm : item.menuTypeNm,
						pageUrl : item.pageUrl,
						delYn : item.delYn,
						sysFrstInptUserId : item.sysFrstInptUserId,
						sysFrstInptDt : item.sysFrstInptDt,
						sysFrstInptPrgrmId : item.sysFrstInptPrgrmId,
						sysLastChgUserId : item.sysLastChgUserId,
						sysLastChgPrgrmId : item.sysLastChgPrgrmId,
						sysLastChgDt : item.sysLastChgDt,
						apcCd : item.apcCd
				}
				newMenuGridData.push(menuList);
			});
        	menuGridData = newMenuGridData;
        	menuDatagrid.rebuild();

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    //grid2 초기화
    var uiGridData = []; // 그리드의 참조 데이터 주소 선언
    function fn_createMenuUiGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'uiGridArea';
	    SBGridProperties.id = 'uiDataGrid';
	    SBGridProperties.jsonref = 'uiGridData';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(datagrid2, this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["id"],       ref: 'entyId',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["명칭"],     ref: 'entyNm',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["유형"],     ref: 'entyType', 	type:'combo',  width:'150px',    style:'text-align:center',
                typeinfo: {ref: 'entyTypeComboData', label: 'label', value: 'value', oneclickedit: true, displayui: true, unselect: {label : '선택', value: ''}}
            },
            {caption: ["표시여부"], ref: 'delYn',  		type:'combo',  width:'100px',    style:'text-align:center',
                typeinfo: {ref: 'delYnComboData', label: 'label', value: 'value', oneclickedit: true, displayui: true, unselect: {label : '선택', value: ''}}
            },
            {caption: ["메뉴ID"],  		ref: 'menuId', 	type:'input', hidden : true},
            {caption: ["행추가여부"],  	ref: 'addYn', 	type:'input', hidden : true}


        ];
        uiDataGrid = _SBGrid.create(SBGridProperties);
    }
    //
    var entyTypeComboData = [
        {label: 'BUTTON', value: '01'},
        {label: 'COMPONENT', value: '02'},
        {label: 'GRID', value: '03'}
    ];

    var delYnComboData = [
    	{label:'사용', value : 'N' },
    	{label:'미사용', value : 'Y' }
    ];
    //
    async function fn_setUiGridData() {

    	var nRow = menuDatagrid.getRow();
        if (nRow < 1) {
            return;
        }
        var rowData = menuDatagrid.getRowData(nRow);

        let menuId = rowData.menuId
        let postJsonPromise = gfn_postJSON("/co/menu/selectUiList.do", {menuId : menuId});
        let data = await postJsonPromise;
		let newUiGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let uiList = {
						menuId : item.menuId,
						entyId : item.entyId,
						entyNm : item.entyNm,
						entyType : item.entyType,
						delYn : item.delYn,
						addYn : 'N'
				}
				newUiGridData.push(uiList);
			});
        	uiGridData = newUiGridData;
        	uiDataGrid.rebuild();

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        //버튼 활성화
        SBUxMethod.attr("btnAdd", "disabled", false);
        SBUxMethod.attr("btnDel", "disabled", false);
    }
    //행 추가
    function fn_addRow() {
    	uiDataGrid.addRow(true, ['Y','','','','Y',SBUxMethod.get('menuId'),'Y']);
    }
    //선택된 행 삭제
    function fn_deleteRow() {
        var gridList = uiDataGrid.getGridDataAll();
        for (var i=gridList.length-1; i>-1; i--) {
            if (gridList[i].checked === "Y") {
            	uiDataGrid.deleteRow(i+1);
            }
        }
        if (delList.length < 1) {
            alert("선택하세요.");
            return;
        }
    }
</script>
</body>
</html>