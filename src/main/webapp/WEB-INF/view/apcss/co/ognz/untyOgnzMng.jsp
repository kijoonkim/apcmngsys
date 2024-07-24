<%
/**
 * @Class Name : untyOgnzMng.jsp
 * @Description : 통합권한관리 화면
 * @author SI개발부
 * @since 2024.07.22
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	 ----------	 ---------------------------
 * @ 2024.07.22  신정철			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 통합권한관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 메뉴관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="btnCreate" 
						name="btnCreate" 
						uitype="normal"  
						text="신규" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_create"
					></sbux-button>
					<sbux-button 
						id="btnSave" 
						name="btnSave" 
						uitype="normal"  
						text="저장" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_save"
					></sbux-button>
					<sbux-button 
						id="btnDelete" 
						name="btnDelete" 
						uitype="normal"  
						text="삭제"  
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
					></sbux-button>
					<sbux-button 
						id="btnSearch" 
						name="btnSearch" 
						uitype="normal"  
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
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
							<col style="width: 3%">
							<col style="width: 6%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_bg">통합조직유형</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-select
										unselected-text="전체"
										uitype="single"
										id="srch-slt-untyOgnzType"
										name="srch-slt-untyOgnzType"
										class="form-control input-sm"
										jsondata-ref="jsonComUntyOgnzType"
										jsondata-value="cdVl"
										jsondata-text="cdVlNm"
										onchange=""
									/>
								</td>
								<th scope="row" class="th_bg">통합조직명</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-untyOgnzNm" 
										name="srch-inp-untyOgnzNm" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
									></sbux-input>
								</td>
								<td colspan="4"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<div class ="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>통합조직목록</span></li>
							</ul>
						</div>
						<div class ="row">
							<div id="sb-area-grdUntyOgnzTree" style="width:95%;height:596px;"></div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>통합조직상세정보</span></li>
							</ul>
						</div>
						<div  class ="row">
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<thead>
									<tr>
										<th scope="row" class="th_bg">통합조직유형</th>
										<td class="td_input">
											<sbux-select
												id="dtl-slt-untyOgnzType" 
												name="dtl-slt-untyOgnzType" 
												uitype="single" 
												jsondata-ref="jsonComUntyOgnzType"
												jsondata-value="cdVl"
												jsondata-text="cdVlNm"
												onChange="" 
												unselected-text="선택" 
												class="form-control input-sm"
											></sbux-select>
										</td>
										<th scope="row" class="th_bg">상위통합조직</th>
										<td class="td_input">
											<sbux-input 
												id="dtl-inp-upUntyOgnzNm" 
												name="dtl-inp-upUntyOgnzNm" 
												uitype="text" 
												class="" 
												readonly
											></sbux-input>
											<sbux-input 
												id="dtl-inp-upUntyOgnzId" 
												name="dtl-inp-upUntyOgnzId" 
												uitype="hidden"
											></sbux-input>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">통합조직ID</th>
										<td class="td_input">
											<sbux-input 
												id="dtl-inp-untyOgnzId" 
												name="dtl-inp-untyOgnzId" 
												uitype="text" 
												required 
												class="form-control input-sm input-sm-ast" 
												readonly 
											></sbux-input>
										</td>
										<th scope="row" class="th_bg">통합조직명</th>
										<td class="td_input">
											<sbux-input 
												id="dtl-inp-untyOgnzNm" 
												name="dtl-inp-untyOgnzNm" 
												uitype="text" 
												required 
												class="form-control input-sm input-sm-ast" 
											></sbux-input>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">연계코드</th>
										<td class="td_input">
										    <sbux-input 
												id="dtl-inp-untyOgnzLinkCd" 
												name="dtl-inp-untyOgnzLinkCd" 
												uitype="text"
												class="form-control input-sm input-sm-ast" 
											></sbux-input>
										</td>
										<th scope="row" class="th_bg">표시순서</th>
										<td class="td_input">
											<sbux-input
												id="dtl-inp-indctSeq" 
												name="dtl-inp-indctSeq" 
												uitype="text" 
												class="form-control input-sm"
											></sbux-input>
										</td>
									</tr>
									
									<tr>
										<th scope="row" class="th_bg">시/도</th>
										<td class="td_input">
											<sbux-select
												id="dtl-slt-ctpv" 
												name="dtl-slt-ctpv" 
												uitype="single" 
												jsondata-ref="jsonComCtpv" 
												jsondata-value="cdVl"
												jsondata-text="cdVlNm"
												onChange="" 
												unselected-text="선택" 
												class="form-control input-sm"
											></sbux-select>
										</td>
										<th scope="row" class="th_bg">시/군/구</th>
										<td class="td_input">
											<sbux-select
												id="dtl-slt-sgg" 
												name="dtl-slt-sgg" 
												uitype="single" 
												jsondata-ref="jsonComSgg" 
												jsondata-value="cdVl"
												jsondata-text="cdVlNm"
												onChange="" 
												unselected-text="선택" 
												class="form-control input-sm"
											></sbux-select>
										</td>
									</tr>
									
									<tr>
										<td colspan="12">
											<sbux-input
												id="srch-inp-temp" 
												name="srch-inp-temp" 
												uitype="text"
												placeholder=""
												class="form-control input-sm"
												readonly
											></sbux-input>
										</td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		
	}
	async function cfn_add() {
		fn_create();
	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}

	var jsonComUntyOgnzType 	= [];	// 통합조직유형
    var jsonComCtpv 			= [];	// 시/도
    var jsonComSgg 				= [];	// 시/군/구

	// 통합조직 트리 목록
    var grdUntyOgnzTree;
    var jsonUntyOgnzTree = [];
    
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

    /**
     * @name fn_init
     * @description 화면로드 시 초기 설정
     * @function
     */
	const fn_init = function() {
		fn_createGrid();
		fn_initSBSelect();
	}
	
    /**
     * @name fn_initSBSelect
     * @description SBSelect 설정 - 공통코드
     * @function
     */
    const fn_initSBSelect = async function() {

    	jsonComUntyOgnzType = await gfn_getComCdDtls("UNTY_OGNZ_TYPE");
    	jsonComCtpv = await gfn_getComCdDtls("CTPV");
    	jsonComSgg = await gfn_getComCdDtls("SGG");
    	
    	SBUxMethod.refresh("srch-slt-untyOgnzType");
    	SBUxMethod.refresh("dtl-slt-untyOgnzType");
    	SBUxMethod.refresh("dtl-slt-ctpv");
    	SBUxMethod.refresh("dtl-slt-sgg");
    }


    /**
     * @name fn_createGrid
     * @description 그리드 초기화
     * @function
     */
    function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdUntyOgnzTree';
	    SBGridProperties.id = 'grdUntyOgnzTree';
	    SBGridProperties.jsonref = 'jsonUntyOgnzTree';
        SBGridProperties.contextmenu = true;
        SBGridProperties.contextmenulist = objMenuList;
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.tree = {
            col: 0,
            levelref: 'level',
            open: true,
            lock: true,
            checkbox: false,
            checkboxexceptionlevel: [0],
            openlevel: 0,
            checkboxchildrencheck: false,
            iconclickeventignore: true
        };
        SBGridProperties.columns = [
            {caption: ['통합조직목록'], ref: 'untyOgnzNm', width: '100%', type: 'output'}
        ];
        grdUntyOgnzTree = _SBGrid.create(SBGridProperties);
        grdUntyOgnzTree.bind('click', 'fn_view');
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    var objMenuList = {
        "Add": {
            "name": "통합조직 추가",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "a",			//단축키
            "callback": fn_ctxtAddRow,	//콜백함수명
            "callbackparam": ['grdUntyOgnzTree', true]// 콜백함수 파라미터 전달
        },
        "Delete": {
            "name": "통합조직삭제",
            "accesskey": "d",
            "callback": fn_ctxtDelRow
        }
    };

	/**
     * @name fn_ctxtAddRow
     * @description 메뉴추가 (CTXT)
     */
    function fn_ctxtAddRow(arg1, arg2, arg3) {
        /* 두번째 파라미터 부터 callbackparam 속성으로 설정한 값을 반환할 수 있습니다. */
        var nRow = grdUntyOgnzTree.getRow();
        fn_create(nRow);
    };

	/**
     * @name fn_ctxtDelRow
     * @description 메뉴삭제 (CTXT)
     */
    function fn_ctxtDelRow() {
    	fn_delete();
    };

    /**
     * @name fn_create
     * @description 신규 작성
     * @param {number} nRow	행번호
     */
    function fn_create(nRow) {

		if (gfn_isEmpty(nRow)) {
			nRow = grdUntyOgnzTree.getRow();
		}

		let upUntyOgnzId = "";
		let upUntyOgnzNm = "";
		
		if (nRow > 0) {
			const rowData = grdUntyOgnzTree.getRowData(nRow);
			upUntyOgnzId = rowData.untyOgnzId;
			upUntyOgnzNm = rowData.untyOgnzNm;
		}
		
        SBUxMethod.set("dtl-inp-upUntyOgnzId", upUntyOgnzId);
        SBUxMethod.set("dtl-inp-upUntyOgnzNm", upUntyOgnzNm);
        
        SBUxMethod.set("dtl-inp-untyOgnzId", "");
        SBUxMethod.attr("dtl-inp-untyOgnzId", "readonly");

        SBUxMethod.set("dtl-slt-untyOgnzType", "");
        SBUxMethod.set("dtl-inp-untyOgnzLinkCd", "");
        SBUxMethod.set("dtl-inp-indctSeq", "");
        SBUxMethod.set("dtl-slt-ctpv", "");
        SBUxMethod.set("dtl-slt-sgg", "");
        
        SBUxMethod.set("srch-inp-temp", "신규작성");
    }


 	/**
     * @name fn_save
     * @description 저장
     */
    function fn_save() {
    	// validate check

    	const untyOgnzType = SBUxMethod.get("dtl-slt-untyOgnzType");
    	const untyOgnzId = SBUxMethod.get("dtl-inp-untyOgnzId");
    	const untyOgnzNm = SBUxMethod.get("dtl-inp-untyOgnzNm");
    	
    	if (gfn_isEmpty(untyOgnzType)) {
    		gfn_comAlert("W0005","통합조직유형");
    		return;
    	}
    	
    	if (gfn_isEmpty(untyOgnzNm)) {
    		gfn_comAlert("W0005","통합조직명");
    		return;
    	}
    	
        if (gfn_isEmpty(untyOgnzId)) {	//신규
            if (gfn_comConfirm("Q0001", "등록")) {
				fn_insert();
			}
        } else {
        	if(gfn_comConfirm("Q0001", "변경")) {
        		fn_update();
        	}
        }
    }

 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	fn_setUntyOgnzTree();
    }

    /**
     * @name fn_setUntyOgnzTree
     * @description 통합조직트리 조회
     */
    const fn_setUntyOgnzTree = async function() {

    	// form clear
    	fn_clearForm();

    	grdUntyOgnzTree.clearStatus();

    	const untyOgnzType = SBUxMethod.get("srch-slt-untyOgnzType");
    	const untyOgnzNm = SBUxMethod.get("srch-inp-untyOgnzNm");
    	    	
        const postJsonPromise = gfn_postJSON("/co/ognz/selectUntyOgnzTreeList.do", {
        	untyOgnzType: untyOgnzType,
        	untyOgnzNm: untyOgnzNm,
        	// pagination
	  		pagingYn : 'N',
			currentPageNo : 0,
 		  	recordCountPerPage : 0
		});

        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonUntyOgnzTree.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					const untyOgnz = {
  						level: item.untyOgnzLvl,
  						untyOgnzType: item.untyOgnzType,
  						upUntyOgnzId: item.upUntyOgnzId,
  						upUntyOgnzNm : item.upUntyOgnzNm,
  						untyOgnzId: item.untyOgnzId,
  						untyOgnzNm : item.untyOgnzNm,
  						untyOgnzLinkCd : item.untyOgnzLinkCd,
  						ctpv : item.ctpv,
  						sgg : item.sgg,
  						indctSeq : item.indctSeq
  					}
  					jsonUntyOgnzTree.push(untyOgnz);

  					totalRecordCount = jsonUntyOgnzTree.length;
  				});

  	        	grdUntyOgnzTree.rebuild();
  	        	//document.querySelector('#listCount').innerText = totalRecordCount;

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

    /**
     * @name fn_insert
     * @description 통합조직 등록
     * @param {boolean} isConfirmed
     */
    const fn_insert = async function(isConfirmed) {

		const untyOgnzType = SBUxMethod.get("dtl-slt-untyOgnzType");
		const upUntyOgnzId = gfn_nvl(SBUxMethod.get("dtl-inp-upUntyOgnzId"));
		const untyOgnzNm = SBUxMethod.get("dtl-inp-untyOgnzNm");
		const untyOgnzLinkCd = gfn_nvl(SBUxMethod.get("dtl-inp-untyOgnzLinkCd"));
		const indctSeq = gfn_nvl(SBUxMethod.get("dtl-inp-indctSeq"));
		const ctpv = SBUxMethod.get("dtl-slt-ctpv");
		const sgg = SBUxMethod.get("dtl-slt-sgg");

    	const postJsonPromise = gfn_postJSON("/co/ognz/insertUntyOgnz.do", {
    		untyOgnzType: untyOgnzType,
    		upUntyOgnzId: upUntyOgnzId,
    		untyOgnzNm: untyOgnzNm,
    		untyOgnzLinkCd: untyOgnzLinkCd,
    		indctSeq: indctSeq,
    		ctpv: ctpv,
    		sgg: sgg,
		});

		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		//gfn_comAlert("E0001");
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_update
     * @description 통합조직 변경
     * @param {boolean} isConfirmed
     */
	const fn_update = async function(isConfirmed) {

 		const untyOgnzType = SBUxMethod.get("dtl-slt-untyOgnzType");
		const upUntyOgnzId = gfn_nvl(SBUxMethod.get("dtl-inp-upUntyOgnzId"));
		const untyOgnzId = SBUxMethod.get("dtl-inp-untyOgnzId");
		const untyOgnzNm = SBUxMethod.get("dtl-inp-untyOgnzNm");
		const untyOgnzLinkCd = gfn_nvl(SBUxMethod.get("dtl-inp-untyOgnzLinkCd"));
		const indctSeq = gfn_nvl(SBUxMethod.get("dtl-inp-indctSeq"));
		const ctpv = SBUxMethod.get("dtl-slt-ctpv");
		const sgg = SBUxMethod.get("dtl-slt-sgg");

    	const postJsonPromise = gfn_postJSON("/co/ognz/updateUntyOgnz.do", {
    		untyOgnzType: untyOgnzType,
    		upUntyOgnzId: upUntyOgnzId,
    		untyOgnzId: untyOgnzId,
    		untyOgnzNm: untyOgnzNm,
    		untyOgnzLinkCd: untyOgnzLinkCd,
    		indctSeq: indctSeq,
    		ctpv: ctpv,
    		sgg: sgg,
		});

		const data = await postJsonPromise;

	    try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	    		fn_search();
	    	} else {
	    		//gfn_comAlert("E0001");
	    		gfn_comAlert(data.resultCode, data.resultMessage);
	    	}
	    } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	    }

    }


    /**
     * @name fn_delete
     * @description 통합조직 삭제
     * @param {boolean} isConfirmed
     */
   	const fn_delete = async function() {

		const untyOgnzId = SBUxMethod.get('dtl-inp-untyOgnzId');
		
		if (gfn_isEmpty(untyOgnzId)) {
            gfn_comAlert("W0001", "통합조직");	//	W0001	{0}을/를 선택하세요.
            return;
        }
		
		if (!gfn_comConfirm("Q0001", "삭제")) {//	Q0001	{0} 하시겠습니까?
			return;	
		}
		
		const postJsonPromise = gfn_postJSON("/co/ognz/updateUntyOgnz.do", {
			untyOgnzId: untyOgnzId
		});

		const data = await postJsonPromise;

	    try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	    		fn_search();
	    	} else {
	    		//gfn_comAlert("E0001");
	    		gfn_comAlert(data.resultCode, data.resultMessage);
	    	}
	    } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	    }
    }


    /**
     * @name fn_view
     * @description 선택 통합조직 상세정보 표시
     */
    const fn_view = function () {

        const nRow = grdUntyOgnzTree.getRow();
        if (nRow < 1) {
            return;
        }

        const rowData = grdUntyOgnzTree.getRowData(nRow);

        SBUxMethod.set("dtl-slt-untyOgnzType", rowData.untyOgnzType);
        SBUxMethod.set("dtl-inp-upUntyOgnzId", gfn_nvl(rowData.upUntyOgnzId));
        SBUxMethod.set("dtl-inp-upUntyOgnzNm", gfn_nvl(rowData.upUntyOgnzNm));
        SBUxMethod.set("dtl-inp-untyOgnzId", rowData.untyOgnzId);
        SBUxMethod.set("dtl-inp-untyOgnzNm", rowData.untyOgnzNm);
        SBUxMethod.set("dtl-inp-untyOgnzLinkCd", gfn_nvl(rowData.untyOgnzLinkCd));
        SBUxMethod.set("dtl-inp-indctSeq", gfn_nvl(rowData.indctSeq));
        SBUxMethod.set("dtl-slt-ctpv", rowData.ctpv);
        SBUxMethod.set("dtl-slt-sgg", rowData.sgg);
        
    }

    /**
     * @name fn_clearForm
     * @description 상세정보 초기화
     */
    const fn_clearForm = function() {
        SBUxMethod.set("dtl-inp-upUntyOgnzId", "");
        SBUxMethod.set("dtl-inp-upUntyOgnzNm", "");
        SBUxMethod.set("dtl-slt-untyOgnzType", "");
        SBUxMethod.set("dtl-inp-untyOgnzId", "");
        SBUxMethod.set("dtl-inp-untyOgnzNm", "");
        SBUxMethod.set("dtl-inp-untyOgnzLinkCd", "");
        SBUxMethod.set("dtl-inp-indctSeq", "");
        SBUxMethod.set("dtl-slt-ctpv", "");
        SBUxMethod.set("dtl-slt-sgg", "");
        SBUxMethod.set("srch-inp-temp", "");
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>