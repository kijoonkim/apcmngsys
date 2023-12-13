<%
/**
 * @Class Name : comUiMng.jsp
 * @Description : 화면UI관리 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.05.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
<meta charset="UTF-8">
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 화면관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSave" name="btnSave" uitype="normal"  text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save" disabled></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal"  text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
            <div class="box-body">

				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >시스템구분</th>
							<td colspan="" class="td_input" style="border-right:hidden;" >
								<sbux-select id="srch-slt-sysId" name="srch-slt-sysId" uitype="single"
									jsondata-ref="jsonComSysId"
									unselected-text="선택"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" >화면ID</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-menuId" name="srch-inp-menuId" uitype="text"
									style="width:200px"
									placeholder=""
									class="form-control input-sm"
								></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">화면명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-menuNm" name="srch-inp-menuNm" uitype="text"
									style="width:200px"
									placeholder=""
									class="form-control input-sm"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>화면목록</span></li>
						</ul>
					</div>
				<div id="sb-area-grdMeun" style="height:284px;"></div>
				<br/>
				<div class ="row">
					<div class="col-sm-6">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>화면상세정보</span></li>
							</ul>
						</div>
						<div >
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<tr>
									<th scope="row" class="th_bg">화면ID</th>
									<td class="td_input">
									    <sbux-input id="dtl-inp-menuId" name="dtl-inp-menuId" uitype="text" class="form-control input-sm input-sm-ast" readonly></sbux-input>
									</td>
									<th scope="row" class="th_bg">화면명</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-menuNm" name="dtl-inp-menuNm" uitype="text" class="form-control input-sm"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">화면경로</th>
									<td colspan="3" class="td_input">
										<sbux-input id="dtl-inp-pageUrl" name="dtl-inp-pageUrl" uitype="text" required class="form-control input-sm" ></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">화면유형</th>
									<td class="td_input">
										<sbux-select id="dtl-slt-menuType" name="dtl-slt-menuType" uitype="single"
											jsondata-ref="jsonComMenuType"
											class="form-control input-sm"
											readonly
										></sbux-select>
									</td>
									<th scope="row" class="th_bg">사용여부</th>
									<td class="td_input">
										<sbux-select id="dtl-slt-delYn" name="dtl-slt-delYn" uitype="single"
											jsondata-ref="jsonComUseYn"
											class="form-control input-sm"
										></sbux-select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">최초등록자</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-sysFrstInptUserId" name="dtl-inp-sysFrstInptUserId" uitype="text"  class="form-control input-sm input-sm-ast" readonly></sbux-select>
									</td>
									<th scope="row" class="th_bg">최종변경자</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-sysLastChgUserId" name="dtl-inp-sysLastChgUserId" uitype="text" class="form-control input-sm input-sm-ast" readonly></sbux-select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">최초등록일시</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-sysFrstInptDt" name="dtl-inp-sysFrstInptDt" uitype="text"  class="form-control input-sm input-sm-ast" readonly></sbux-select>
									</td>
									<th scope="row" class="th_bg">최종변경일시</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-sysLastChgDt" name="dtl-inp-sysLastChgDt" uitype="text" class="form-control input-sm input-sm-ast" readonly></sbux-select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">최초등록프로그램</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-sysFrstInptPrgrmId" name="dtl-inp-sysFrstInptPrgrmId" uitype="text"  class="form-control input-sm input-sm-ast" readonly></sbux-select>
									</td>
									<th scope="row" class="th_bg">최종변경프로그램</th>
									<td class="td_input">
										<sbux-input id="dtl-inp-sysLastChgPrgrmId" name="dtl-inp-sysLastChgPrgrmId" uitype="text" class="form-control input-sm input-sm-ast" readonly></sbux-select>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>개체목록</span></li>
							</ul>
							<div class="ad_tbl_toplist">
								<sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-xs btn-outline-danger" onclick="fn_addRow" ></sbux-button>&nbsp;
								<sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-xs btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
							</div>
						</div>
						<div class ="row">
							<div id="sb-area-grdComUi" style="width:100%;height:277px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    //조회조건
    var jsonComSysId = [];
    var jsonComUseYn = [];
    var jsonComMenuType = [];
    var jsonGrdEntyType = [];
    var jsonGrdDelYn = [];

    // only document
    window.addEventListener('DOMContentLoaded', async function(e) {
    	fn_createMenuGrid();
    	fn_createMenuUiGrid();
    	await fn_initSBSelect();
    });


    const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-sysId', 		jsonComSysId, 		'SYS_ID'),		// 검색조건(시스템구분)
			gfn_setComCdSBSelect('dtl-slt-delYn',   	jsonComUseYn , 		'REVERSE_YN'),	// 화면상세(사용유무)
			gfn_setComCdSBSelect('dtl-slt-menuType',  	jsonComMenuType , 	'MENU_TYPE'),	// 화면상세(메뉴유형)
			gfn_setComCdSBSelect('grdComUi',   			jsonGrdDelYn , 		'REVERSE_YN'),	// 개체목록(사용유무)
			gfn_setComCdSBSelect('grdComUi',  			jsonGrdEntyType , 	'ENTY_TYPE')	// 개체목록(유형)
		])
	}


    var jsonMenu = []; // 그리드의 참조 데이터 주소 선언
    const fn_createMenuGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdMeun';
	    SBGridProperties.id = 'grdMenu';
	    SBGridProperties.jsonref = 'jsonMenu';
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
                    return strValue == "N" ? "사용" : "미사용";
                }},
            {caption: ["등록자"],   		ref: 'sysFrstInptUserId',   type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["등록프로그램"], 	ref: 'sysFrstInptPrgrmId', 	type:'output',  hidden: true},
            {caption: ["등록일시"], 		ref: 'sysFrstInptDt', 		type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["최종변경자"],   	ref: 'sysLastChgUserId',   	type:'output',  width:'150px',    style:'text-align:center'},
            {caption: ["최종변경프로그램"], ref: 'sysLastCngPrgrmId', 	type:'output',  hidden: true},
            {caption: ["최종변경일시"], 	ref: 'sysLastChgDt', 		type:'output',  width:'200px',    style:'text-align:center'},
            {caption: ["APC코드"], 			ref: 'apcCd', 				type:'output',  hidden: true}
        ];
        grdMenu = _SBGrid.create(SBGridProperties);
        grdMenu.bind('click', 'fn_view');
    }

    var jsonMenuUi = []; // 그리드의 참조 데이터 주소 선언
    const fn_createMenuUiGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdComUi';
	    SBGridProperties.id = 'grdComUi';
	    SBGridProperties.jsonref = 'jsonMenuUi';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption : ["<input type='checkbox' onchange='fn_checkAll(grdComUi, this);'>"],
                ref: 'checked', type: 'checkbox', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}
            },
            {caption: ["ID"],       ref: 'entyId',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["명칭"],     ref: 'entyNm',   	type:'input',  width:'200px',    style:'text-align:center'},
            {caption: ["유형"],     ref: 'entyType', 	type:'combo',  width:'150px',    style:'text-align:center',
                typeinfo: {ref: 'jsonGrdEntyType', label: 'label', value: 'value', oneclickedit: true, displayui: false, unselect: {label : '선택', value: ''}}
            },
            {caption: ["표시여부"], ref: 'delYn',  		type:'combo',  width:'100px',    style:'text-align:center',
                typeinfo: {ref: 'jsonGrdDelYn', label: 'label', value: 'value', oneclickedit: true, displayui: false, unselect: {label : '선택', value: ''}}
            },
            {caption: ["메뉴ID"],  		ref: 'menuId', 	type:'input', hidden : true},
            {caption: ["추가여부"],  	ref: 'addYn', 	type:'input', hidden : true}


        ];
        grdComUi = _SBGrid.create(SBGridProperties);
    }

    //목록 조회
    const fn_search = function() {
        //시스템구분 확인
        var sysId = SBUxMethod.get("srch-slt-sysId");
        if(gfn_isEmpty(sysId)){
			gfn_comAlert("W0001", "시스템구분");		//	W0002	{0}을/를 선택하세요.
			return;
		}
        fn_setGridMenu();
    }

    const fn_setGridMenu = async function() {

        let sysId = SBUxMethod.get('srch-slt-sysId');
        let menuId = SBUxMethod.get('srch-inp-menuId');
        let menuNm = SBUxMethod.get('srch-inp-menuNm');
        let menuVO = {
        		sysId : sysId,
        		menuId : menuId,
        		menuNm : menuNm
        }
        let postJsonPromise = gfn_postJSON("/co/menu/selectMenuUiList.do", menuVO);
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonMenu.length = 0;
        	data.resultList.forEach((item, index) => {
				let menu = {
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
				jsonMenu.push(menu);
			});
        	grdMenu.rebuild();
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

  	//상세정보 보기
    const fn_view = async function() {
        var nRow = grdMenu.getRow();
        if (nRow < 1) {
            return;
        }
        var rowData = grdMenu.getRowData(nRow);
        SBUxMethod.set("dtl-inp-menuId", rowData.menuId);
        SBUxMethod.set("dtl-inp-menuNm", rowData.menuNm);
        SBUxMethod.set("dtl-slt-menuType", rowData.menuType);
        SBUxMethod.set("dtl-inp-pageUrl", rowData.pageUrl);
        SBUxMethod.set("dtl-inp-delYn", rowData.delYn);
        SBUxMethod.set("dtl-inp-sysFrstInptUserId", rowData.sysFrstInptUserId);
        SBUxMethod.set("dtl-inp-sysFrstInptPrgrmId", rowData.sysFrstInptPrgrmId);
        SBUxMethod.set("dtl-inp-sysFrstInptDt", rowData.sysFrstInptDt);
        SBUxMethod.set("dtl-inp-sysLastChgUserId", rowData.sysLastChgUserId);
        SBUxMethod.set("dtl-inp-sysLastChgPrgrmId", rowData.sysLastChgPrgrmId);
        SBUxMethod.set("dtl-inp-sysLastChgDt", rowData.sysLastChgDt);

        //선택 행 개체목록 조회
        fn_setUiGridData();
      	//버튼 활성화
        SBUxMethod.attr("btnSave", "disabled", false);
        SBUxMethod.attr("btnDelete", "disabled", false);
    }

    const fn_setUiGridData = async function() {

    	var nRow = grdMenu.getRow();
        var rowData = grdMenu.getRowData(nRow);

        let menuId = rowData.menuId
        let postJsonPromise = gfn_postJSON("/co/menu/selectComUiList.do", {menuId : menuId});
        const data = await postJsonPromise;
        try{
        	jsonMenuUi.length = 0;
        	data.resultList.forEach((item, index) => {
				let menuUi = {
						menuId : item.menuId,
						entyId : item.entyId,
						entyNm : item.entyNm,
						entyType : item.entyType,
						delYn : item.delYn,
						addYn : "N"
				}
				jsonMenuUi.push(menuUi);
			});
        	grdComUi.rebuild();

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

    //저장
    const fn_save = async function() {

		let menuNm = SBUxMethod.get("dtl-inp-menuNm");
		let pageUrl = SBUxMethod.get("dtl-inp-pageUrl");
		let delYn = SBUxMethod.get("dtl-slt-delYn");

        if (gfn_isEmpty(menuNm)) {
        	gfn_comAlert("W0002", "화면명");				// W0002   {0}을/를 입력하세요.
            return;
        }
        if (gfn_isEmpty(pageUrl)) {
        	gfn_comAlert("W0002", "화면경로");				// W0002   {0}을/를 입력하세요.
            return;
        }
        if (gfn_isEmpty(delYn)) {
        	gfn_comAlert("W0001", "사용유무");				// W0002   {0}을/를 선택하세요.
            return;
        }

        let grdRows = grdComUi.getCheckedRows(0);
        let menuRowData = grdMenu.getRowData(grdMenu.getRow());

        menuUiList = [];

        for ( let i=0; i<grdRows.length; i++ ){

			const rowData = grdComUi.getRowData(grdRows[i]);
			const rowSts = grdComUi.getRowStatus(grdRows[i]);
			if (gfn_isEmpty(rowData.entyId)){
				gfn_comAlert("W0002", "ID");			//	W0002	{0}을/를 입력하세요.
	            return;
			}
			if (gfn_isEmpty(rowData.entyNm)){
				gfn_comAlert("W0002", "명칭");			//	W0002	{0}을/를 입력하세요.
	            return;
			}
			if (gfn_isEmpty(rowData.entyType)) {
	        	gfn_comAlert("W0001", "유형");			// W0002   {0}을/를 선택하세요.
	            return;
	        }
	        if (gfn_isEmpty(rowData.delYn)) {
	        	gfn_comAlert("W0001", "표시유무");		// W0002   {0}을/를 선택하세요.
	            return;
	        }

			if (rowSts === 3){
				rowData.rowSts = "I";
				menuUiList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				menuUiList.push(rowData);
			} else {
				continue;
			}
		}

        if((!(menuNm === menuRowData.numeNm && pageUrl === menuRowData.pageUrl && delYn === menuRowData.delYn)) && menuUiList.length == 0){
        	gfn_comAlert("W0003", "저장")				//W0003	{0}할 대상이 없습니다.
        	return;
        }

        let updatedCnt = 0;
        let insertedCnt = 0;
        var seveMsg = "저장 하시겠습니까?";
        if(confirm(seveMsg)){

	        if((menuNm === menuRowData.numeNm && pageUrl === menuRowData.pageUrl && delYn === menuRowData.delYn)){
	        	updatedCnt = await fn_updateMenu();
	        }
	        if(menuUiList.length > 0){
	        	insertedCnt = await fn_saveMenuUi(menuUiList);
	        }
        }

        if(updatedCnt + insertedCnt > 0){
        	fn_setGridData();
        	gfn_comAlert("I0001");					// I0001 처리 되었습니다.
        }
    }

    const fn_updateMenu = async function(){
        let menuId = SBUxMethod.get('dtl-inp-menuId');
        let menuNm = SBUxMethod.get("dtl-inp-menuNm");
		let pageUrl = SBUxMethod.get("dtl-inp-pageUrl");
		let delYn = SBUxMethod.get("dtl-slt-delYn");

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

    const fn_saveMenuUi = async function(comUiList){
        let postJsonPromise = gfn_postJSON("/co/menu/multiSaveComUiList.do", comUiList);
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

    //그리드 체크박스 전체 선택
    const fn_checkAll = function(grid, obj)  {
        var gridList = grdComUi.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grdComUi.getColRef("checked");
        for (var i=0; i<gridList.length; i++) {
        	grdComUi.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    }

    //행 추가
    const fn_addRow = function() {
    	grdComUi.addRow(true, ['Y','','','','N',SBUxMethod.get('dtl-inp-menuId'), "Y"]);
    }
    //선택된 행 삭제
    const fn_deleteRow = function() {

    	let grdRows = grdComUi.getCheckedRows(0);
    	let delList = [];

    	for(let i=grdRows.length; i>0; i--){
    		let nRow = grdRows[i-1];
    		let rowData = grdComUi.getRowData(nRow)
    		if(rowData.addYn == "Y"){
    			grdComUi.deleteRow(nRow);
    		}else {
    			delList.push(rowData);
    		}
    	}

        if (grdRows.length < 1) {
        	gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
		if(delList.length > 0){
			var delMsg = "등록 된 행을 삭제 하시겠습니까?";
	        if(confirm(delMsg)){
		        fn_delete(delList);
	        }
		}
    }

  	//선택 삭제
    const fn_delete = async function(comUiList) {

       	const postJsonPromise = gfn_postJSON("/co/menu/deleteComUiList.do", comUiList);
    	const data = await postJsonPromise;

    	try{
       		if(data.deletedCnt > 0){
       			fn_setUiGridData();
       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
       		}else{
       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
       		}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>