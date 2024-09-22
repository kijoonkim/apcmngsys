<%
/**
 * @Class Name : corpApcMng.jsp
 * @Description : 법인별APC관리 화면
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
	<title>title : 법인별 APC관리</title>
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
						id="btnSave" 
						name="btnSave" 
						uitype="normal"  
						text="저장" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_save"
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
								<th scope="row" class="th_bg">법인명</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-untyOgnzNm" 
										name="srch-inp-untyOgnzNm" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
									></sbux-input>
								</td>
								<th scope="row" class="th_bg">법인번호</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-crno" 
										name="srch-inp-crno" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
									></sbux-input>
								</td>
								<th scope="row" class="th_bg">APC명</th>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input
										id="srch-inp-apcNm" 
										name="srch-inp-apcNm" 
										uitype="text"
										placeholder=""
										class="form-control input-sm"
									></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<div class ="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>법인목록</span></li>
							</ul>
						</div>
						<div class ="row">
							<div id="sb-area-grdUntyOgnzTree" style="width:95%;height:596px;"></div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>상세정보</span></li>
							</ul>
						</div>
						<div  class ="row">
							<sbux-input 
								id="dtl-inp-untyOgnzCd" 
								name="dtl-inp-untyOgnzCd" 
								uitype="hidden"
							></sbux-input>
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<thead>
									<tr>
										<th scope="row" class="th_bg">법인명</th>
										<td class="td_input">
											<sbux-input 
												id="dtl-inp-untyOgnzNm" 
												name="dtl-inp-untyOgnzNm" 
												uitype="text" 
												required 
												class="form-control input-sm input-sm-ast" 
											></sbux-input>
										</td>
										<th scope="row" class="th_bg">법인번호</th>
										<td class="td_input">

											<sbux-input 
												id="dtl-inp-crno" 
												name="dtl-inp-crno" 
												uitype="text" 
												required 
												class="form-control input-sm input-sm-ast" 
												readonly 
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
												onChange="fn_onChangeSrchCtpv(this)" 
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
												filter-source-name="dtl-slt-ctpv"
												jsondata-filter="upCdVl"
											></sbux-select>
										</td>
									</tr>
								</thead>
							</table>
							<div class="ad_tbl_top2">
								<ul class="ad_tbl_count">
									<li>
										<span>관리 APC 목록</span>
									</li>
								</ul>
							</div>
							<div class="table-responsive tbl_scroll_sm">
								<div id="sb-area-grdUntyOgnzApc" style="height:282px;"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	
    <!-- APC 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-ognzApc" 
        	name="modal-ognzApc" 
        	uitype="middle" 
        	header-title="관리APC 선택" 
        	body-html-id="body-modal-ognzApc" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-ognzApc">
    	<jsp:include page="../../co/popup/ognzApcPopup.jsp"></jsp:include>
    </div>
	
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
    
    var grdUntyOgnzApc;
    var jsonUntyOgnzApc = [];
    
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

    /**
     * @name fn_init
     * @description 화면로드 시 초기 설정
     * @function
     */
	const fn_init = async function() {
		fn_initSBSelect();
		fn_createGrid();
	}
	
    /**
     * @name fn_initSBSelect
     * @description SBSelect 설정 - 공통코드
     * @function
     */
    const fn_initSBSelect = async function() {

    	let result = await Promise.all([
    			gfn_getComCdDtls("UNTY_OGNZ_TYPE"),
    			gfn_getComCdDtls("UNTY_CTPV"),
    			gfn_getComCdDtls("UNTY_SGG"),
    		]);
    	jsonComUntyOgnzType = result[0];
    	jsonComCtpv = result[1];
    	jsonComSgg = result[2];
    	
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
        fn_createGridUntyOgnzTree();
        fn_createGridUntyOgnzApc();
    }

    
    /**
     * @name fn_createGridUntyOgnzTree
     * @description 그리드 초기화
     * @function
     */
    function fn_createGridUntyOgnzTree() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdUntyOgnzTree';
	    SBGridProperties.id = 'grdUntyOgnzTree';
	    SBGridProperties.jsonref = 'jsonUntyOgnzTree';
        //SBGridProperties.contextmenu = true;
        //SBGridProperties.contextmenulist = objMenuList;
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
        grdUntyOgnzTree.bind('click', fn_view);
    }

    /**
     * @name fn_createGridUntyOgnzApc
     * @description 관리APC 그리드 생성
     * @function
     */
    function fn_createGridUntyOgnzApc() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdUntyOgnzApc';
	    SBGridProperties.id = 'grdUntyOgnzApc';
	    SBGridProperties.jsonref = 'jsonUntyOgnzApc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
	    	{
            	caption: ["처리"],
            	ref: 'delYn',
            	type:'button',
            	width:'50px',
            	style:'text-align:center',
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if (strValue== null || strValue == ""){
            			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
            		} else {
			        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
            		}
		    	}
            },
        	{
            	caption: ['조직명'],
            	ref: 'untyOgnzNm',
            	type: 'output',
                width: '120px',
                style: 'text-align:left',
            },
            {
            	caption: ['APC코드'],
            	ref: 'apcCd',
            	type: 'output',
                width: '80px',
                style: 'text-align:center',
            },
            {
            	caption: ['APC명'],
            	ref: 'apcNm',
            	type: 'output',
                width: '140px',
                style: 'text-align:left',
            },
        	{
	        	caption: ["APC명"],
        		ref: 'apcCd',
        		type:'button',
        		width:'40px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		if (_.isEqual("Y", objRowData.chkVl)) {
	        			return "";
	        		}
	        		if (_.isEqual("N", objRowData.delYn)) {
	        			if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_choiceApc(" + nRow + ")'>🔍</button>";
		            	} else {
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_clearApc(" + nRow + ")'>❌</button>";
						}
	        		}	            	
		    	}
	        },
            {
            	caption: ['승인'],
            	ref: 'aprvYn',
            	type: 'output',
                width: '50px',
                style: 'text-align:center',
            },
            {
            	caption: ['사업자번호'],
            	ref: 'brno',
            	type: 'output',
                width: '180px',
                style: 'text-align:center',
                format : {
                	type:'string',
                	rule:'000-00-00000'
                }
            },
            {
            	caption: ['주소'],
            	ref: 'addr',
            	type: 'output',
                width: '180px',
                style: 'text-align:left',
            },
            {
            	caption: ['시/도'],
            	ref: 'ctpvNm',
            	type: 'output',
                width: '100px',
                style: 'text-align:left',
            },
            {
            	caption: ['시/군/구'],
            	ref: 'sggExpln',
            	type: 'output',
                width: '100px',
                style: 'text-align:left',
            },
            /*
            {
        	    caption: ["시/도"],	
        	    ref: 'ctpv',	
        	    type:'combo',  		
        	    width:'100px', 
        	    style:'text-align:center',
        	    typeinfo : {
        	        ref:'jsonComCtpv', 
        	        label:'cdVlNm', 
        	        value:'cdVl', 
        	        displayui : true
        	    },
        	    userattr: {colNm: "ctpv"},
        	},
        	{
        	    caption: ["시/군/구"],	
        	    ref: 'sgg',	
        	    type:'combo',  		
        	    width:'100px', 
        	    style:'text-align:center',
        	    typeinfo : {
        	        ref:'jsonComSgg', 
        	        label:'cdVlExpln', 
        	        value:'cdVl', 
        	        displayui : true,
        	        userattr: {colNm: "sgg"},
        	    },
        	},
        	*/
            
        ];
        grdUntyOgnzApc = _SBGrid.create(SBGridProperties);
    }
    
    
	/**
     * @name fn_addRow
     * @description APC 행추가
     */
    const fn_addRow = function (nRow) {

        const row = grdUntyOgnzApc.getRowData(nRow, false);
		row.delYn = "N";
		
		const untyOgnzCd = SBUxMethod.get("dtl-inp-untyOgnzCd");
		const untyOgnzNm = SBUxMethod.get("dtl-inp-untyOgnzNm");
		
		row.untyOgnzCd = untyOgnzCd;
		row.untyOgnzId = untyOgnzCd;
		row.untyOgnzNm = untyOgnzNm;
		
		
		grdUntyOgnzApc.addRow(true);

		grdUntyOgnzApc.setCellDisabled(
	    			0, 
	    			0, 
	    			grdUntyOgnzApc.getRows() -1, 
	    			grdUntyOgnzApc.getCols() -1, 
	    			false
    			);
		grdUntyOgnzApc.setCellDisabled(
					grdUntyOgnzApc.getRows() -1, 
	    			0, 
	    			grdUntyOgnzApc.getRows() -1, 
	    			grdUntyOgnzApc.getCols() -1, 
    				true
    			);
        
    };
    
	/**
     * @name fn_delRow
     * @description APC 행삭제
     */
	const fn_delRow = async function(nRow) {
		
		const rowStatus = grdUntyOgnzApc.getRowStatus(nRow);
		
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록된 정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const apc = grdUntyOgnzApc.getRowData(nRow);
			await fn_deleteOgnzApc(apc);

    	} else {
    		grdUntyOgnzApc.deleteRow(nRow);
    	}
	}
	
	/**
     * @name fn_deleteOgnzApc
     * @description APC 삭제 처리
     */	
	const fn_deleteOgnzApc = async function(_apc) {

		try {
    		const postJsonPromise = gfn_postJSON("/co/ognz/deleteOgnzApc.do", _apc);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_setUntyOgnzApc();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
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
    	 
    }


 	/**
     * @name fn_save
     * @description 저장
     */
    const fn_save = async function() {
    	// validate check

		const allData = grdUntyOgnzApc.getGridDataAll();
		const ognzApcList = [];
		
		for (let i=0; i<allData.length; i++) {
			
			const rowData = allData[i];
			
			if (!_.isEqual('N', rowData.delYn)) {
				continue;	
			}
				
			if (gfn_isEmpty(rowData.apcCd)) {
				gfn_comAlert("W0005", "APC정보");		//	W0005	{0}이/가 없습니다.
	            return;
			}
			
			if (gfn_isEmpty(rowData.apcNm)) {
				gfn_comAlert("W0005", "APC정보");		//	W0005	{0}이/가 없습니다.
	            return;
			}
			
			ognzApcList.push(rowData);
		}
		
		if (ognzApcList.length == 0) {
			gfn_comAlert("W0005", "저장할 정보");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "저장")) {
			return;
		}
		
		try {
    		const postJsonPromise = gfn_postJSON("/co/ognz/insertOgnzApcList.do", ognzApcList);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		await fn_setUntyOgnzApc();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }    	
    	
    }

 	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	fn_clearUntyOgnzApc();
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

    	const untyOgnzNm = SBUxMethod.get("srch-inp-untyOgnzNm");
    	const crno = SBUxMethod.get("srch-inp-crno");
    	const apcNm = SBUxMethod.get("srch-inp-apcNm");
    	    	
        const postJsonPromise = gfn_postJSON("/co/ognz/selectUntyOgnzTreeList.do", {
        	crno: crno,
        	untyOgnzNm: untyOgnzNm,
        	apcNm: apcNm,
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
  						untyOgnzCd: item.untyOgnzCd,
  						untyOgnzType: item.untyOgnzType,
  						upUntyOgnzId: item.upUntyOgnzId,
  						upUntyOgnzNm : item.upUntyOgnzNm,
  						untyOgnzId: item.untyOgnzId,
  						untyOgnzCd: item.untyOgnzCd,
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
    
    const fn_clearUntyOgnzApc = function() {
    	jsonUntyOgnzApc.length = 0;
    	grdUntyOgnzApc.refresh();
    }
    
    /**
     * @name fn_setUntyOgnzApc
     * @description 통합조직 관리APC 조회
     */
    const fn_setUntyOgnzApc = async function() {

    	jsonUntyOgnzApc.length = 0;
		
    	const untyOgnzCd = SBUxMethod.get("dtl-inp-untyOgnzCd");
    	
    	if (gfn_isEmpty(untyOgnzCd)) {
    		grdUntyOgnzApc.rebuild();
    		return;
    	}
    	
        const postJsonPromise = gfn_postJSON("/co/ognz/selectUntyOgnzApcList.do", {
        	untyOgnzCd: untyOgnzCd,
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

  	    		jsonUntyOgnzApc.length = 0;
  	        	data.resultList.forEach((item, index) => {
  	        		item.delYn = "N";
  	        		item.chkVl = "Y";
  					jsonUntyOgnzApc.push(item);
  				});
  	        	
  	        	totalRecordCount = jsonUntyOgnzApc.length;
  	        	grdUntyOgnzApc.rebuild();
  	        	//document.querySelector('#listCount').innerText = totalRecordCount;
  	        	
  		        grdUntyOgnzApc.setCellDisabled(
  		        		0, 
  		        		0, 
  		        		grdUntyOgnzApc.getRows() -1, 
  		        		2, 
  		        		true
  	        		);
  		        
  		      	grdUntyOgnzApc.addRow();
  		    	grdUntyOgnzApc.setCellDisabled(
  		    				grdUntyOgnzApc.getRows() -1, 
  			        		0, 
  			        		grdUntyOgnzApc.getRows() -1, 
  			        		grdUntyOgnzApc.getCols() -1, 
  			        		true
  		        		);
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

    	const prvUntyOgnzCd = SBUxMethod.get("dtl-inp-untyOgnzCd");
    	
        const nRow = grdUntyOgnzTree.getRow();
        if (nRow < 1) {
            return;
        }

        const rowData = grdUntyOgnzTree.getRowData(nRow);

        SBUxMethod.set("dtl-inp-untyOgnzCd", rowData.untyOgnzCd);
        SBUxMethod.set("dtl-inp-untyOgnzNm", rowData.untyOgnzNm);
        
        SBUxMethod.set("dtl-slt-ctpv", rowData.ctpv);
        SBUxMethod.refresh("dtl-slt-sgg");
        
        let chkSgg = _.find(jsonComSgg, {cdVl: rowData.sgg});

		if (gfn_isEmpty(chkSgg)) {
			SBUxMethod.set("dtl-slt-sgg", "");
		} else {
			SBUxMethod.set("dtl-slt-sgg", rowData.sgg);
		}
		
		if (!_.isEqual(prvUntyOgnzCd, rowData.untyOgnzCd)) {
			fn_setUntyOgnzApc();
		}
    }

    
	/**
	 * @name fn_setOgnzApc
	 * @description APC 선택 popup callback 처리
	 */
	const fn_setOgnzApc = function(_apcInfo) {
		
		console.log("_apcInfo", _apcInfo);
		
		if (!gfn_isEmpty(_apcInfo)) {
			
			const nRow = grdUntyOgnzApc.getRow();
			const rowData = grdUntyOgnzApc.getRowData(nRow, false);
			rowData.apcCd = _apcInfo.apcCd;
			rowData.apcNm = _apcInfo.apcNm;
			rowData.brno = _apcInfo.brno;
			rowData.addr = _apcInfo.addr;
			rowData.ctpv = _apcInfo.ctpv;
			rowData.sgg = _apcInfo.sgg;
			rowData.ctpvNm = _apcInfo.ctpvNm;
			rowData.sggNm = _apcInfo.sggNm;
			rowData.sggExpln = _apcInfo.sggExpln;
			
			grdUntyOgnzApc.refresh({"focus":false});			
		}
	}
    
    /**
     * @name fn_choiceApc
     * @description APC 선택
     */
	const fn_choiceApc = async function(nRow) {

		SBUxMethod.openModal('modal-ognzApc');
		const rowData = grdUntyOgnzApc.getRowData(nRow);
		
		const initParam = {
				apcCd: rowData.apcCd,
				apcNm: rowData.apcNm
		};
		
		popOgnzApc.init(initParam, fn_setOgnzApc);
	}
    
    /**
     * @name fn_clearApc
     * @description APC 삭제
     */
	const fn_clearApc = async function(nRow) {
    	
		const rowData = grdUntyOgnzApc.getRowData(nRow, false);
		rowData.apcCd = "";
		rowData.apcNm = "";
		rowData.brno = "";
		rowData.addr = "";
		rowData.ctpv = "";
		rowData.sgg = "";
		rowData.ctpvNm = "";
		rowData.sggNm = "";
		rowData.sggExpln = "";
		
		grdUntyOgnzApc.refresh({"focus":false});
	}
    
    
    /**
     * @name fn_clearForm
     * @description 상세정보 초기화
     */
    const fn_clearForm = function() {
        SBUxMethod.set("dtl-inp-untyOgnzCd", "");
        SBUxMethod.set("dtl-inp-untyOgnzNm", "");
        SBUxMethod.set("dtl-slt-ctpv", "");
        SBUxMethod.set("dtl-slt-sgg", "");
    }

	/**
	 * @name fn_onChangeSrchCtpv
	 * @description 시/도선택 변경 event
	 */
    const fn_onChangeSrchCtpv = function(obj) {
    	SBUxMethod.refresh("dtl-slt-sgg");
		SBUxMethod.set("dtl-slt-sgg", ""); 
	}
	
	
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>