<%
 /**
  * @Class Name : clclnCrtrMng.jsp
  * @Description : 정산기준관리 화면
  * @author SI개발부
  * @since 2024.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.08.31   	신정철			최초 생성
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
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btn-reset"
						name="btn-reset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="초기화"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btn-save"
						name="btn-save"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="기준저장"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btn-search"
						name="btn-search"
						uitype="normal"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
							<th scope="row" class="th_bg">
								</span>기준유형
							</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-clclnCrtrType"
									name="srch-slt-clclnCrtrType"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonClclnCrtrType"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"									
									onchange="fn_search"
								/>
							</td>
							<th scope="row" class="th_bg">
								기준코드
							</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-crtrCd"
									name="srch-inp-crtrCd"
									class="form-control input-sm"
									autocomplete="off"
								/>
							</td>
							<th scope="row" class="th_bg">
								기준명
							</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-crtrIndctNm"
									name="srch-inp-crtrIndctNm"
									class="form-control input-sm"
									autocomplete="off"
								/>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>정산기준</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clclnCrtr">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnCrtr" style="height:208px;"></div>
				</div>

				<br/>

				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>정산기준 상세</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clclnCrtrDtl">0</span>건)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist_datepk">
						<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
							<colgroup>
								<col style="width: auto">
								<col style="width: 80px">
							</colgroup>
							<tbody>
								<tr>
									<td style="border-left:hidden"></td>
									<td class="td_input" style="border-right:hidden;">
										<sbux-button
											id="btn-saveDtl"
											name="btn-saveDtl"
											uitype="normal"
											class="btn btn-sm btn-outline-dark"
											onclick="fn_saveDtl"
											text="상세저장"
										></sbux-button>
									</td>
								</tr>
							</tbody>
				 		</table>
						
						
						
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnCrtrDtl" style="height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">

	let crtrType;
	let crtrCd;
	let crtrIndctNm;

	const lv_paging = {
		'type' : 'page',
	  	'count' : 5,
	  	'size' : 50,
	  	'sorttype' : 'page',
	  	'showgoalpageui' : true
    };

	
	// crtrType
	const _CLCLN_CRTR_TYPE_			= "CLCLN_CRTR_TYPE";
	
	const _CLCLN_ARTCL_KND_			= "CLCLN_ARTCL_KND";	
	const _CLCLN_AMT_KND_ 			= "CLCLN_AMT_KND";
	const _CLCLN_UNTPRC_ELMT_ 		= "CLCLN_UNTPRC_ELMT";
	const _CLCLN_UNTPRC_KND_		= "CLCLN_UNTPRC_KND";
	
	
	// 정산상세유형
	const _CLCLN_DTL_TYPE_			= "CLCLN_DTL_TYPE";

	const _CLCLN_DTL_TYPE__NONE_	= "NONE";
	const _CLCLN_DTL_TYPE__SN_		= "SN";
	const _CLCLN_DTL_TYPE__ITEM_CD_	= "ITEM_CD";
	const _CLCLN_DTL_TYPE__VRTY_CD_	= "VRTY_CD";
	const _CLCLN_DTL_TYPE__GRD_CD_	= "GRD_CD";
	const _CLCLN_DTL_TYPE__SEED_CD_	= "SEED_CD";
	
	
	
	
	
	// CLCLN_ARTCL_KND	기준코드
	const _CLCLN_SE_CD_				= "CLCLN_SE_CD";
	const _CLCLN_CLSF_				= "CLCLN_CLSF";
	const _CLCLN_ELMT_				= "CLCLN_ELMT";

	// CLCLN_UNTPRC_KND 기준코드
	const _UNTPRC_KND__SEED_		= "SEED";
	const _UNTPRC_KND__WRHS_GRD_ 	= "WRHS_GRD";
	const _UNTPRC_KND__SORT_GRD_ 	= "SORT_GRD";
	const _UNTPRC_KND__GDS_GRD_ 	= "GDS_GRD";

	// 코드 json
	
	var jsonYn				= [
		{cdVl: "Y", cdVlNm: "사용"},
		{cdVl: "N", cdVlNm: "미사용"},
	];
	
	var jsonClclnCrtrType	= [];	// 정산기준유형
	
	var jsonClclnCrtrCd		= [];	// 정산단가코드
	
	var jsonClclnArtclKnd	= [];	// 정산항목종류
	var jsonClclnAmtKnd		= [];	// 정산금액종류
	var jsonClclnUntprcElmt	= [];	// 정산단가요소
	var jsonClclnUntprcKnd	= [];	// 정산단가종류
	
	var jsonClclnDtlType	= [];	// 정산단가종류

	var jsonWrhsGrd		= [];	// 입고등급 
	var jsonSortGrd		= [];	// 선별등급
	var jsonGdsGrd		= [];	// 상품등급

	var jsonItem		= [];	// 품목
	var jsonVrty		= [];	// 품종
	var jsonSeed		= [];	// 종자
	

	
    /* SBGrid */
	var grdClclnCrtr;
    var grdClclnCrtrDtl;

    /* SBGrid Data (JSON) */
	var jsonClclnCrtr = [];
    var jsonClclnCrtrDtl = [];

    
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})
    
	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		await fn_initSBSelect();
		
		fn_createGrid();
		fn_createGridDtl();
	}
	
	const fn_initSBSelect = async function() {

 		// 코드정보 설정
		let result = await Promise.all([
			gfn_getComCdDtls(_CLCLN_CRTR_TYPE_),
			gfn_getComCdDtls(_CLCLN_ARTCL_KND_),
			gfn_getComCdDtls(_CLCLN_AMT_KND_),
			gfn_getComCdDtls(_CLCLN_UNTPRC_ELMT_),
			gfn_getComCdDtls(_CLCLN_UNTPRC_KND_),
			gfn_getComCdDtls(_CLCLN_DTL_TYPE_),
			gfn_getApcItem(gv_selectedApcCd),
			gfn_getApcVrty(gv_selectedApcCd),
			// 입고등급 가져오기
			//fn_getClclnCrtr(),
			//fn_getClclnCrtrDtl(),
			//fn_getClclnSn(),
		]);
 		
		jsonClclnCrtrType = result[0];
		
		jsonClclnArtclKnd = result[1];
		jsonClclnAmtKnd = result[2];
		jsonClclnUntprcElmt = result[3];
		jsonClclnUntprcKnd = result[4];
		
		jsonClclnDtlType = result[5];
		
		jsonItem = result[6];
		jsonVrty = result[7];

		
		jsonClclnArtclKnd.forEach((item, index) => {
			jsonClclnCrtrCd.push(item);
		});
		jsonClclnAmtKnd.forEach((item, index) => {
			jsonClclnCrtrCd.push(item);
		});
		jsonClclnUntprcElmt.forEach((item, index) => {
			jsonClclnCrtrCd.push(item);
		});
		jsonClclnUntprcKnd.forEach((item, index) => {
			jsonClclnCrtrCd.push(item);
		});
		
		SBUxMethod.refresh("srch-slt-clclnCrtrType");
		
		//fn_setJsonClclnCrtr();
	}

	
 	/**
     * @name fn_createGrid
     * @description 정산단가 그리드 생성
     * @function
     */
	const fn_createGrid = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdClclnCrtr';
		SBGridProperties.id = 'grdClclnCrtr';
		SBGridProperties.jsonref = 'jsonClclnCrtr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.frozencols = 2;
	    SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{
				caption: ["처리"],
        		ref: 'delYn',
        		type:'button',
        		width:'60px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
					}
		    	}
			},
            {
		    	caption: ["정산기준유형"],
		    	ref: 'clclnCrtrType',
		    	type:'combo',
		    	width:'120px',
		    	style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {
            		ref:'jsonClclnCrtrType',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false
            	}
            },
            {
            	caption: ["기준코드"],			
            	ref: 'crtrCd',  		
            	type: 'combo',  
            	width:'120px', 	
            	style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {
            		ref:'jsonClclnCrtrCd',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false,

					filtering: {
	            		usemode: true,
	            		uppercol: 'clclnCrtrType',
	            		attrname: 'cdId',
	            		listall: true
	            	}
            	},
            	userattr: {colNm: "crtrCd"},
            },
            {
            	caption: ["기준표시명"],			
            	ref: 'crtrIndctNm',  		
            	type: 'input',  
            	width:'140px', 	
            	style: 'text-align:center;background-color:#FFF8DC;',
            	userattr: {colNm: "crtrIndctNm"},
            },
            {
            	caption: ["기준값"],			
            	ref: 'crtrVl',  		
            	type: 'input',  
            	width:'120px', 	
            	style: 'text-align:center;',
            	userattr: {colNm: "crtrVl"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###.#'}
            },
            {
		    	caption: ["상세유형"],
		    	ref: 'clclnDtlType',
		    	type:'combo',
		    	width:'120px',
		    	style: 'text-align:center',
            	typeinfo: {
            		ref:'jsonClclnDtlType',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false
            	}
            },
            {
            	caption: ["표시순서"],			
            	ref: 'indctSeq',  		
            	type: 'input',  
            	width:'80px', 	
            	style: 'text-align:right;',
            	userattr: {colNm: "indctSeq"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###'}
            },
            {
		    	caption: ["사용"],
		    	ref: 'useYn',
		    	type:'combo',
		    	width:'50px',
		    	style: 'text-align:center',
            	typeinfo: {
            		ref:'jsonYn',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false
            	}
            },
            {
            	caption: ["기준비고사항"],			
            	ref: 'crtrRmrk',  		
            	type: 'input',  
            	width:'200px', 	
            	style: 'text-align:left;',
            	userattr: {colNm: "crtrRmrk"},
            },
    	];
		grdClclnCrtr = _SBGrid.create(SBGridProperties);
		grdClclnCrtr.bind('rowchanged', fn_grdClclnCrtrRowChanged);
		//grdClclnCrtr.bind('valuechanged' , fn_grdRawMtrInvntrValueChanged);
		//grdClclnCrtr.bind('select' , fn_setValue);
		//grdClclnCrtr.bind('deselect' , fn_delValue);
		
		const nRow = grdClclnCrtr.getRows();
		grdClclnCrtr.addRow(true);
		grdClclnCrtr.setCellDisabled(
				nRow, 
				0, 
				nRow, 
				grdClclnCrtr.getCols() - 1, 
				true
			);
	}

	const fn_createGridDtl = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdClclnCrtrDtl';
		SBGridProperties.id = 'grdClclnCrtrDtl';
		SBGridProperties.jsonref = 'jsonClclnCrtrDtl';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{
				caption: ["처리"],
        		ref: 'delYn',
        		type:'button',
        		width:'60px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
					}
		    	}
			},
            {
		    	caption: ["정산기준유형"],
		    	ref: 'clclnCrtrTypeNm',
		    	type:'output',
		    	style: 'text-align:center',
            },
            {
            	caption: ["기준코드"],			
            	ref: 'crtrCd',  		
            	type: 'output',  
            	width:'120px', 	
            	style: 'text-align:center;',
            	userattr: {colNm: "crtrCd"},
            },
            {
            	caption: ["기준표시명"],			
            	ref: 'crtrIndctNm',  		
            	type: 'input',  
            	width:'140px', 	
            	style: 'text-align:center;',
            	userattr: {colNm: "crtrIndctNm"},
            },
            {
            	caption: ["상세코드"],			
            	ref: 'dtlCd',  		
            	type: 'input',  
            	width:'120px', 	
            	style: 'text-align:center;background-color:#FFF8DC;',
            	userattr: {colNm: "dtlCd"},
            },
            {
            	caption: ["상세표시명"],			
            	ref: 'dtlIndctNm',  		
            	type: 'input',  
            	width:'140px', 	
            	style: 'text-align:center;background-color:#FFF8DC;',
            	userattr: {colNm: "dtlIndctNm"},
            },
            {
            	caption: ["상세값"],			
            	ref: 'dtlVl',  		
            	type: 'input',  
            	width:'120px', 	
            	style: 'text-align:center;',
            	userattr: {colNm: "dtlVl"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###.#'}
            },
            {
            	caption: ["표시순서"],			
            	ref: 'indctSeq',  		
            	type: 'input',  
            	width:'80px', 	
            	style: 'text-align:right;',
            	userattr: {colNm: "indctSeq"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###'}
            },
            {
		    	caption: ["사용"],
		    	ref: 'useYn',
		    	type:'combo',
		    	width:'50px',
		    	style: 'text-align:center',
            	typeinfo: {
            		ref:'jsonYn',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false
            	}
            },
            {
		    	caption: ["상세기준코드"],
		    	ref: 'dtlCrtrCd',
		    	type:'input',
		    	width:'120px',
		    	style: 'text-align:center',
		    	userattr: {colNm: "dtlCrtrCd"},
            },
            {
            	caption: ["연결코드"],			
            	ref: 'dtlLnkgCd',  		
            	type: 'input',  
            	width:'140px', 	
            	style: 'text-align:center;background-color:#FFF8DC;',
            	userattr: {colNm: "dtlLnkgCd"},
            },
    	];

		grdClclnCrtrDtl = _SBGrid.create(SBGridProperties);
		//grdClclnCrtrDtl.bind('valuechanged', fn_grdSortPrfmncValueChanged);

	}


	/**
	 * common button action
	 */

    /**
     * @name fn_search
     * @description 조회 버튼
     */
	const fn_search = async function() {
	    
		jsonClclnCrtrDtl.length = 0;
		grdClclnCrtrDtl.refresh();
		
		fn_setGrdClclnCrtr();
	}

	
    /**
     * @name fn_save
     * @description 저장 버튼
     */
 	const fn_save = async function() {
    	await fn_insertCrtr();	
    }
     
    /**
     * @name fn_insertCrtr
     * @description 저장 버튼
     */
	const fn_insertCrtr = async function() {

    	const crtrList = [];
    	
		const allData = grdClclnCrtr.getGridDataAll();

    	for ( var i=1; i<=allData.length; i++ ){
			const rowData = grdClclnCrtr.getRowData(i);
			const rowSts = grdClclnCrtr.getRowStatus(i);
			
			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}
			
			if (gfn_isEmpty(rowData.clclnCrtrType)) {
				gfn_comAlert("W0005", "정산기준유형");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.crtrCd)) {
				gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.crtrIndctNm)) {
				gfn_comAlert("W0005", "기준표시명");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.clclnDtlType)) {
				gfn_comAlert("W0005", "상세유형");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			crtrList.push({
				clclnCrtrType: rowData.clclnCrtrType,
				crtrCd: rowData.crtrCd,
				crtrVl: rowData.crtrVl,
				crtrIndctNm: rowData.crtrIndctNm,
				indctSeq: rowData.indctSeq,
				clclnDtlType: rowData.clclnDtlType,
				crtrRmrk: rowData.crtrRmrk,
				useYn: rowData.useYn,
			});
    	}
    	
		if (crtrList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		
		const param = {
			apcCd: gv_selectedApcCd,
			clclnCrtrList: crtrList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/insertClclnCrtr.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
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
     * @name fn_deleteCrtr
     * @description 정산기준 삭제
     */
	const fn_deleteCrtr = async function(_crtr) {

    	const crtrList = [{
    		clclnCrtrType: _crtr.clclnCrtrType,
			crtrCd: _crtr.crtrCd,
    	}];
    	
		const param = {
			apcCd: gv_selectedApcCd,
			clclnCrtrList: crtrList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/deleteClclnCrtr.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
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
     * @name fn_saveDtl
     * @description 상세기준 저장 버튼
     */
	const fn_saveDtl = async function() {
    	await fn_insertCrtrDtl();
    }
    
    /**
     * @name fn_insertCrtrDtl
     * @description 상세기준 저장 버튼
     */
	const fn_insertCrtrDtl = async function() {

    	const crtrDtlList = [];
    	
		const allData = grdClclnCrtrDtl.getGridDataAll();

    	const crtrRow = grdClclnCrtr.getRow();
    	const crtrInfo = grdClclnCrtr.getRowData(crtrRow);
		
    	for ( var i=1; i<=allData.length; i++ ){
    		
			const rowData = grdClclnCrtrDtl.getRowData(i);
			const rowSts = grdClclnCrtrDtl.getRowStatus(i);
			
			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}
			
			if (gfn_isEmpty(rowData.clclnCrtrType)) {
				gfn_comAlert("W0005", "정산기준유형");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.crtrCd)) {
				gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.dtlIndctNm)) {
				gfn_comAlert("W0005", "상세표시명");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (!_.isEqual(_CLCLN_DTL_TYPE__SN_, crtrInfo.clclnDtlType)) {
				if (gfn_isEmpty(rowData.dtlCd)) {
					gfn_comAlert("W0005", "상세코드");		//	W0005	{0}이/가 없습니다.
					return;
				}	
			}
			
			crtrDtlList.push({
				clclnCrtrType: rowData.clclnCrtrType,
				crtrCd: rowData.crtrCd,
				dtlSn: rowData.dtlSn,
				dtlCd: rowData.dtlCd,
				dtlVl: rowData.dtlVl,
				dtlIndctNm: rowData.dtlIndctNm,
				indctSeq: rowData.indctSeq,
				useYn: rowData.useYn,
				dtlCrtrCd: rowData.dtlCrtrCd,
				dtlLnkgCd: rowData.dtlLnkgCd,
			});
    	}
    	
		if (crtrDtlList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		
		const param = {
			apcCd: gv_selectedApcCd,
			
			clclnCrtrType: crtrInfo.clclnCrtrType,
			crtrCd: crtrInfo.crtrCd,
			
			clclnCrtrDtlList: crtrDtlList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/insertClclnCrtrDtl.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		
        		fn_setGrdClclnCrtrDtl(crtrInfo);
        		
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
     * @name fn_deleteCrtrDtl
     * @description 상세기준 삭제
     */
	const fn_deleteCrtrDtl = async function(_crtrDtl) {

    	const crtrDtlList = [{
    		clclnCrtrType: _crtrDtl.clclnCrtrType,
    		crtrCd: _crtrDtl.crtrCd,
    		dtlSn: _crtrDtl.dtlSn,
    	}];
    	
		if (crtrDtlList.length == 0) {
			gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		
		const param = {
			apcCd: gv_selectedApcCd,
			clclnCrtrDtlList: crtrDtlList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/deleteClclnCrtrDtl.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		
        		const crtrRow = grdClclnCrtr.getRow();
            	const crtrInfo = grdClclnCrtr.getRowData(crtrRow);
        		
        		fn_setGrdClclnCrtrDtl(crtrInfo);
        		
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
    
	const fn_delete = async function() {

	}
	

    /**
     * @name fn_setGrdClclnCrtr
     * @description 정산기준 목록 조회
     * @function
     */
    const fn_setGrdClclnCrtr = async function() {
    	
    	jsonClclnCrtr.length = 0;
 		
    	const clclnCrtrType = SBUxMethod.get("srch-slt-clclnCrtrType");
    	const crtrCd = SBUxMethod.get("srch-inp-crtrCd");
    	const crtrIndctNm = SBUxMethod.get("srch-inp-crtrIndctNm");
    	
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnCrtrList.do", {
        		apcCd: gv_selectedApcCd,
        		clclnCrtrType: clclnCrtrType,
        		crtrCd: crtrCd,
        		crtrIndctNm: crtrIndctNm,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		jsonClclnCrtr.push(item);
				});
  				
  				let totalRecordCount = jsonClclnCrtr.length;
  	          	grdClclnCrtr.rebuild();
  	          	
	        	document.querySelector('#cnt-clclnCrtr').innerText = totalRecordCount;
	        	
	        	grdClclnCrtr.setCellDisabled(
	        			0, 
	        			0, 
	        			grdClclnCrtr.getRows() -1, 
	        			2, 
	        			true
	        		);
	        	grdClclnCrtr.setCellDisabled(
		        		0, 
		        		3, 
		        		grdClclnCrtr.getRows() -1, 
		        		grdClclnCrtr.getCols() -1,
		        		false
	        		);
		        
	        	grdClclnCrtr.addRow();
	        	grdClclnCrtr.setCellDisabled(
	        			grdClclnCrtr.getRows() -1, 
			        	0, 
			        	grdClclnCrtr.getRows() -1, 
			        	grdClclnCrtr.getCols() -1,
			        	true
		        	);
	        	
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
     * @name fn_setGrdClclnCrtrDtl
     * @description 정산기준 상세 목록 조회
     * @function
     */
    const fn_setGrdClclnCrtrDtl = async function(_crtr) {
    	
    	let needsNewRow = false;
    	
    	jsonClclnCrtrDtl.length = 0;
 		
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnCrtrDtlList.do", {
        		apcCd: gv_selectedApcCd,
        		clclnCrtrType: _crtr.clclnCrtrType,
        		crtrCd: _crtr.crtrCd,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				if (data.resultList.length > 0) {
  					needsNewRow = true;
  				}
  				
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		if (!gfn_isEmpty(item.dtlSn)) {
	        			jsonClclnCrtrDtl.push(item);	
	        		}
				});

  	          	let totalRecordCount = jsonClclnCrtrDtl.length;
  	          	grdClclnCrtrDtl.rebuild();
  	          	
	        	document.querySelector('#cnt-clclnCrtrDtl').innerText = totalRecordCount;
	        	
	        	grdClclnCrtrDtl.setCellDisabled(
	        			0, 
	        			0, 
	        			grdClclnCrtrDtl.getRows() -1, 
	        			3, 
	        			true
	        		);
	        	grdClclnCrtrDtl.setCellDisabled(
		        		0, 
		        		4, 
		        		grdClclnCrtrDtl.getRows() -1, 
		        		grdClclnCrtrDtl.getCols() -1,
		        		false
	        		);
		        
	        	if (needsNewRow) {
	        		grdClclnCrtrDtl.addRow();
		        	grdClclnCrtrDtl.setCellDisabled(
		        			grdClclnCrtrDtl.getRows() -1, 
				        	0, 
				        	grdClclnCrtrDtl.getRows() -1, 
				        	grdClclnCrtrDtl.getCols() -1,
				        	true
			        	);
	        	}
	        	
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
    
    const fn_grdClclnCrtrRowChanged = function() {
    	
    	const nRow = grdClclnCrtr.getRow();
    	
    	if (nRow < 1) {
    		return;
    	}
    	
    	const _crtr = grdClclnCrtr.getRowData(nRow);
    	
    	if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {    		
    		jsonClclnCrtrDtl.length = 0;
    		grdClclnCrtrDtl.refresh();
    		document.querySelector('#cnt-clclnCrtrDtl').innerText = 0;
    		return;
    	}
    	
    	fn_setGrdClclnCrtrDtl(_crtr);    	
    }
    


	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow) {

		const editableRow = grdClclnCrtr.getRowData(nRow, false);	// call by reference(deep copy)
		editableRow.delYn = "N";
		
		grdClclnCrtr.rebuild();
		grdClclnCrtr.setCellDisabled(nRow, 2, nRow, grdClclnCrtr.getCols() - 1, false);
		nRow++;
		grdClclnCrtr.addRow(true);
		grdClclnCrtr.setCellDisabled(nRow, 0, nRow, grdClclnCrtr.getCols() - 1, true);
	}
	 
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(_nRow) {
		
		const rowStatus = grdClclnCrtr.getRowStatus(_nRow);
			
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록기준", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const _crtr = grdClclnCrtr.getRowData(_nRow);
			await fn_deleteCrtr(_crtr);

    	} else {
    		grdClclnCrtr.deleteRow(_nRow);
    	}
	}
	 
	/**
	 * @name fn_addRowDtl
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRowDtl = async function(nRow) {

		const crtrRow = grdClclnCrtr.getRow();
		
		if (crtrRow < 1) {
			gfn_comAlert("W0001", "정산기준");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
		const _crtr = grdClclnCrtr.getRowData(crtrRow);
		
		if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {
			gfn_comAlert("W0020", "미등록");		//	W0020	{0} 상태의 {1} 입니다.
			return;
		} 
		 
		const editableRow = grdClclnCrtrDtl.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.clclnCrtrType = _crtr.clclnCrtrType;
		editableRow.clclnCrtrTypeNm = _crtr.clclnCrtrTypeNm;
		editableRow.crtrCd = _crtr.crtrCd;
		editableRow.crtrIndctNm = _crtr.crtrIndctNm;
		
		editableRow.delYn = "N";
		
		grdClclnCrtrDtl.rebuild();
		grdClclnCrtrDtl.setCellDisabled(nRow, 3, nRow, grdClclnCrtrDtl.getCols() - 1, false);
		
		nRow++;
		grdClclnCrtrDtl.addRow(true);
		grdClclnCrtrDtl.setCellDisabled(nRow, 0, nRow, grdClclnCrtrDtl.getCols() - 1, true);
	}
	 
	/**
	 * @name fn_delRowDtl
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRowDtl = async function(_nRow) {

		const rowStatus = grdClclnCrtrDtl.getRowStatus(_nRow);
			
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록기준상세", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const _crtrDtl = grdClclnCrtrDtl.getRowData(_nRow);
			await fn_deleteCrtrDtl(_crtrDtl);

    	} else {
    		grdClclnCrtrDtl.deleteRow(_nRow);
    	}
		 
	}
	 
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>