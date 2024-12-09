<%
 /**
  * @Class Name : anlsCrtrMng.jsp
  * @Description : 분석기준관리 화면
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



<c:set var="fixedCellFontSize" value="" />
<c:set var="dataCellFontSize" value="" />

<style>
/*
.sbgrid_common {
	font-size: 20px;
}
*/
.sbgrid-ui-selectmenu-button {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid-ui-selectmenu-text {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid-ui-menu-item {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid-ui-icon sbgrid-ui-icon-triangle-1-s {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>

}
.sbgrid_span {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid_cell {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid_input_text_st {
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid_data_cell_st {
	/*헤더영역이 아닌 행 데이터 셀을 표시하는 <td>들에 적용되는 스타일 CSS 클래스*/
	border-color: #b2bad2;
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid_focus_cell_st {
	/*그리드의 포커스의 셀 영역 스타일*/
	border: 2px solid #0276b5;
	background-color: transparent;
	pointer-events: none;
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
.sbgrid_combo_button_st {
	width: 20px;
	background: url(../img/grid/combobutton.png) 50% 50% no-repeat;
	background-position: center;
	border: 0;
	margin-right: 2px;
	cursor: pointer;
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_input_fixed_col_st {
	/*input의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_input_data_col_st {
	/*input의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_output_fixed_col_st {
	/*output의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_output_data_col_st {
	/*output의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_textarea_fixed_col_st {
	/*textarea의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_textarea_data_col_st {
	/*textarea의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_combo_fixed_col_st {
	/*combo의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_combo_data_col_st {
	/*combo의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_inputcombo_fixed_col_st {
	/*inputcombo의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_inputcombo_data_col_st {
	/*inputcombo의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
	font-size: 8px;
}

.sbgrid_datepicker_fixed_col_st {
	/*datepicker의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_datepicker_data_col_st {
	/*datepicker의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_inputdate_fixed_col_st {
	/*inputdate의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_inputdate_data_col_st {
	/*inputdate의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_checkbox_fixed_col_st {
	/*checkbox의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_checkbox_data_col_st {
	/*checkbox의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_radio_fixed_col_st {
	/*radio의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_radio_data_col_st {
	/*radio의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_inputbutton_fixed_col_st {
	/*inputbutton의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_inputbutton_data_col_st {
	/*inputbutton의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_outputbutton_fixed_col_st {
	/*outputbutton의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_outputbutton_data_col_st {
	/*outputbutton의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_button_fixed_col_st {
	/*button의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_button_data_col_st {
	/*button의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_spinner_fixed_col_st {
	/*spinner의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_spinner_data_col_st {
	/*spinner의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_spinner_fixed_col_st {
	/*spinner의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_spinner_data_col_st {
	/*spinner의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_multiradio_fixed_col_st {
	/*multiradio의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_multiradio_data_col_st {
	/*multiradio의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_image_fixed_col_st {
	/*image의 fixed 영역 스타일 CSS 클래스*/
	<c:if test="${not empty fixedCellFontSize}">
	font-size: <c:out value='${fixedCellFontSize}'></c:out>;
	</c:if>
}

.sbgrid_image_data_col_st {
	/*image의 data 영역 스타일 CSS 클래스*/
	<c:if test="${not empty dataCellFontSize}">
	font-size: <c:out value='${dataCellFontSize}'></c:out>;
	</c:if>
}
</style>
	
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
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-anlsCrtrType"
									name="srch-slt-anlsCrtrType"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonAnlsCrtrType"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"									
									onchange="fn_search"
								/>
							</td>
							<td></td>
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
							<span>분석기준</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-anlsCrtr">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdAnlsCrtr" style="height:208px;"></div>
				</div>

				<br/>

				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>분석기준 상세</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-anlsCrtrDtl">0</span>건)</span>
						</li>
					</ul>
					<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
						<sbux-button
							id="btn-saveDtl"
							name="btn-saveDtl"
							uitype="normal"
							class="btn btn-sm btn-outline-dark"
							onclick="fn_saveDtl"
							text="상세저장"
						></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdAnlsCrtrDtl" style="height:300px;"></div>
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
	const _ANLS_CRTR_TYPE_			= "ANLS_CRTR_TYPE";
	const _ANLS_CRTR_CD_			= "ANLS_CRTR_CD";	
	const _ANLS_CRTR_DTL_TYPE_		= "ANLS_CRTR_DTL_TYPE";
	const _ANLS_CRTR_DTL_CD_		= "ANLS_CRTR_DTL_CD";
	const _CRT_SCHDL_TYPE_			= "CRT_SCHDL_TYPE";
	
	
	// 코드 json
	
	var jsonYn				= [
		{cdVl: "Y", cdVlNm: "사용"},
		{cdVl: "N", cdVlNm: "미사용"},
	];
	
	var jsonAnlsCrtrType	= [];	// 분석기준유형
	var jsonAnlsCrtrCd		= [];	// 분석기준코드
	var jsonAnlsCrtrDtlType = [];	// 분석기준상세유형
	var jsonAnlsCrtrDtlCd	= [];	// 분석기준상세코드
	var jsonCrtSchdlType	= [];	// 생성일정유형
	
	
    /* SBGrid */
	var grdAnlsCrtr;
    var grdAnlsCrtrDtl;

    /* SBGrid Data (JSON) */
	var jsonAnlsCrtr = [];
    var jsonAnlsCrtrDtl = [];

    
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
		
		await fn_search();
	}
	
	const fn_initSBSelect = async function() {
 		// 코드정보 설정
		let result = await Promise.all([
			gfn_getComCdDtls(_ANLS_CRTR_TYPE_),
			gfn_getComCdDtls(_ANLS_CRTR_CD_),
			gfn_getComCdDtls(_ANLS_CRTR_DTL_TYPE_),
			gfn_getComCdDtls(_ANLS_CRTR_DTL_CD_),
			gfn_getComCdDtls(_CRT_SCHDL_TYPE_),
		]);
 		
		jsonAnlsCrtrType 	= result[0];
		jsonAnlsCrtrCd 		= result[1];
		jsonAnlsCrtrDtlType = result[2];
		jsonAnlsCrtrDtlCd 	= result[3];
		jsonCrtSchdlType 	= result[4];
		SBUxMethod.refresh("srch-slt-anlsCrtrType");

	}

	
 	/**
     * @name fn_createGrid
     * @description 분석기준 그리드 생성
     * @function
     */
	const fn_createGrid = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdAnlsCrtr';
		SBGridProperties.id = 'grdAnlsCrtr';
		SBGridProperties.jsonref = 'jsonAnlsCrtr';
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
	            		return "<button type='button' class='sbgrid_common btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='sbgrid_common btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
					}
		    	}
			},
            {
		    	caption: ["분석기준유형"],
		    	ref: 'anlsCrtrType',
		    	type:'combo',
		    	width:'120px',
		    	style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {
            		ref:'jsonAnlsCrtrType',
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
            		ref:'jsonAnlsCrtrCd',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false,
					/*
					filtering: {
	            		usemode: true,
	            		uppercol: 'anlsCrtrType',
	            		attrname: 'cdId',
	            		listall: true
	            	}
            		 */
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
		    	caption: ["자동생성구분"],
		    	ref: 'crtSchdlType',
		    	type:'combo',
		    	width:'120px',
		    	style: 'text-align:center',
            	typeinfo: {
            		ref:'jsonCrtSchdlType',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false
            	}
            },
            {
            	caption: ["자동생성시점"],			
            	ref: 'crtSchdlPt',
            	type: 'input',  
            	width:'120px', 	
            	style: 'text-align:left;',
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
		grdAnlsCrtr = _SBGrid.create(SBGridProperties);
		grdAnlsCrtr.bind('rowchanged', fn_grdAnlsCrtrRowChanged);
		
		const nRow = grdAnlsCrtr.getRows();
		grdAnlsCrtr.addRow(true);
		grdAnlsCrtr.setCellDisabled(
				nRow, 
				0, 
				nRow, 
				grdAnlsCrtr.getCols() - 1, 
				true
			);
	}

	const fn_createGridDtl = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdAnlsCrtrDtl';
		SBGridProperties.id = 'grdAnlsCrtrDtl';
		SBGridProperties.jsonref = 'jsonAnlsCrtrDtl';
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
	            		return "<button type='button' class='sbgrid_common btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='sbgrid_common btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
					}
		    	}
			},
            {
		    	caption: ["분석기준유형"],
		    	ref: 'anlsCrtrTypeNm',
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
            	type: 'output',  
            	width:'140px', 	
            	style: 'text-align:center;',
            	userattr: {colNm: "crtrIndctNm"},
            },

            {
		    	caption: ["상세유형"],
		    	ref: 'dtlType',
		    	type:'combo',
		    	width:'120px',
		    	style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {
            		ref:'jsonAnlsCrtrDtlType',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false
            	}
            },
            {
            	caption: ["상세코드"],			
            	ref: 'dtlCd',  		
            	type: 'combo',  
            	width:'120px', 	
            	style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {
            		ref:'jsonAnlsCrtrDtlCd',
            		label:'cdVlNm',
            		value:'cdVl',
            		displayui : false,

					filtering: {
	            		usemode: true,
	            		uppercol: 'dtlType',
	            		attrname: 'upCdVl',
	            		listall: true
	            	}
            	},
            	userattr: {colNm: "dtlCd"},
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
            	caption: ["상세표시명"],			
            	ref: 'dtlIndctNm',  		
            	type: 'input',  
            	width:'140px', 	
            	style: 'text-align:left;',
            	userattr: {colNm: "dtlIndctNm"},
            },
    	];

		grdAnlsCrtrDtl = _SBGrid.create(SBGridProperties);
	}


	/**
	 * common button action
	 */

    /**
     * @name fn_search
     * @description 조회 버튼
     */
	const fn_search = async function() {
	    
		jsonAnlsCrtrDtl.length = 0;
		grdAnlsCrtrDtl.refresh();
		
		fn_setGrdAnlsCrtr();
	}

	
    /**
     * @name fn_save
     * @description 저장 버튼
     */
 	const fn_save = async function() {
    	await fn_insertAnls();	
    }
     
    /**
     * @name fn_insertAnls
     * @description 저장 버튼
     */
	const fn_insertAnls = async function() {

    	const crtrList = [];
    	
		const allData = grdAnlsCrtr.getGridDataAll();

    	for ( var i=1; i<=allData.length; i++ ){
			const rowData = grdAnlsCrtr.getRowData(i);
			const rowSts = grdAnlsCrtr.getRowStatus(i);
			
			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}
			
			if (gfn_isEmpty(rowData.anlsCrtrType)) {
				gfn_comAlert("W0005", "분석기준유형");		//	W0005	{0}이/가 없습니다.
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
			
			crtrList.push({
				anlsCrtrType: rowData.anlsCrtrType,
				crtrCd: rowData.crtrCd,
				crtrVl: rowData.crtrVl,
				crtrIndctNm: rowData.crtrIndctNm,
				indctSeq: rowData.indctSeq,
				crtrRmrk: rowData.crtrRmrk,
				useYn: rowData.useYn,
				crtSchdlType: rowData.crtSchdlType,
				crtSchdlPt: rowData.crtSchdlPt,
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
			anlsCrtrList: crtrList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/anls/insertAnlsCrtr.do", param);
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
	const fn_deleteAnls = async function(_crtr) {

    	const crtrList = [{
    		anlsCrtrType: _crtr.anlsCrtrType,
			crtrCd: _crtr.crtrCd,
    	}];
    	
		const param = {
			apcCd: gv_selectedApcCd,
			anlsCrtrList: crtrList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/anls/deleteAnlsCrtr.do", param);
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
    	
		const allData = grdAnlsCrtrDtl.getGridDataAll();

    	const crtrRow = grdAnlsCrtr.getRow();
    	const crtrInfo = grdAnlsCrtr.getRowData(crtrRow);
		
    	for ( var i=1; i<=allData.length; i++ ){
    		
			const rowData = grdAnlsCrtrDtl.getRowData(i);
			const rowSts = grdAnlsCrtrDtl.getRowStatus(i);
			
			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}
			
			if (gfn_isEmpty(rowData.anlsCrtrType)) {
				gfn_comAlert("W0005", "정산기준유형");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.crtrCd)) {
				gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.dtlCd)) {
				gfn_comAlert("W0005", "상세코드");		//	W0005	{0}이/가 없습니다.
				return;
			}	

			
			crtrDtlList.push({
				anlsCrtrType: rowData.anlsCrtrType,
				crtrCd: rowData.crtrCd,
				dtlSn: rowData.dtlSn,
				dtlCd: rowData.dtlCd,
				dtlVl: rowData.dtlVl,
				dtlType: rowData.dtlType,
				dtlIndctNm: rowData.dtlIndctNm,
				indctSeq: rowData.indctSeq,
				useYn: rowData.useYn,
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
			
			anlsCrtrType: crtrInfo.anlsCrtrType,
			crtrCd: crtrInfo.crtrCd,
			
			anlsCrtrDtlList: crtrDtlList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/anls/insertAnlsCrtrDtl.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		
        		fn_setGrdAnlsCrtrDtl(crtrInfo);
        		
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
    		anlsCrtrType: _crtrDtl.anlsCrtrType,
    		crtrCd: _crtrDtl.crtrCd,
    		dtlSn: _crtrDtl.dtlSn,
    	}];
    	
		if (crtrDtlList.length == 0) {
			gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		
		const param = {
			apcCd: gv_selectedApcCd,
			anlsCrtrDtlList: crtrDtlList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/anls/deleteAnlsCrtrDtl.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		
        		const crtrRow = grdAnlsCrtr.getRow();
            	const crtrInfo = grdAnlsCrtr.getRowData(crtrRow);
        		
        		fn_setGrdAnlsCrtrDtl(crtrInfo);
        		
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
     * @name fn_setGrdAnlsCrtr
     * @description 분석기준 목록 조회
     * @function
     */
    const fn_setGrdAnlsCrtr = async function() {
    	
    	jsonAnlsCrtr.length = 0;
 		
    	const anlsCrtrType = SBUxMethod.get("srch-slt-anlsCrtrType");
    	const crtrCd = SBUxMethod.get("srch-inp-crtrCd");
    	const crtrIndctNm = SBUxMethod.get("srch-inp-crtrIndctNm");
    	
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/anls/selectAnlsCrtrList.do", {
        		apcCd: gv_selectedApcCd,
        		anlsCrtrType: anlsCrtrType,
        		crtrCd: crtrCd,
        		crtrIndctNm: crtrIndctNm,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		jsonAnlsCrtr.push(item);
				});
  				
  				let totalRecordCount = jsonAnlsCrtr.length;
  				grdAnlsCrtr.rebuild();
  	          	
	        	document.querySelector('#cnt-anlsCrtr').innerText = totalRecordCount;
	        	
	        	grdAnlsCrtr.setCellDisabled(
	        			0, 
	        			0, 
	        			grdAnlsCrtr.getRows() -1, 
	        			2, 
	        			true
	        		);
	        	grdAnlsCrtr.setCellDisabled(
		        		0, 
		        		3, 
		        		grdAnlsCrtr.getRows() -1, 
		        		grdAnlsCrtr.getCols() -1,
		        		false
	        		);
		        
	        	grdAnlsCrtr.addRow();
	        	grdAnlsCrtr.setCellDisabled(
	        			grdAnlsCrtr.getRows() -1, 
			        	0, 
			        	grdAnlsCrtr.getRows() -1, 
			        	grdAnlsCrtr.getCols() -1,
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
     * @name fn_setGrdAnlsCrtrDtl
     * @description 분석기준 상세 목록 조회
     * @function
     */
    const fn_setGrdAnlsCrtrDtl = async function(_crtr) {
    	
    	let needsNewRow = false;
    	
    	jsonAnlsCrtrDtl.length = 0;
 		
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/anls/selectAnlsCrtrDtlList.do", {
        		apcCd: gv_selectedApcCd,
        		anlsCrtrType: _crtr.anlsCrtrType,
        		crtrCd: _crtr.crtrCd,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				/*
  				if (data.resultList.length > 0) {
  					needsNewRow = true;
  				}
  				 */
  				
  				needsNewRow = true;
  				
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		if (!gfn_isEmpty(item.dtlSn)) {
	        			jsonAnlsCrtrDtl.push(item);	
	        		}
				});

  				console.log("jsonAnlsCrtrDtl", jsonAnlsCrtrDtl);
  				
  	          	let totalRecordCount = jsonAnlsCrtrDtl.length;
  	          	grdAnlsCrtrDtl.rebuild();
  	          	
	        	document.querySelector('#cnt-anlsCrtrDtl').innerText = totalRecordCount;
	        	
	        	grdAnlsCrtrDtl.setCellDisabled(
	        			0, 
	        			0, 
	        			grdAnlsCrtrDtl.getRows() -1, 
	        			3, 
	        			true
	        		);
	        	grdAnlsCrtrDtl.setCellDisabled(
		        		0, 
		        		4, 
		        		grdAnlsCrtrDtl.getRows() -1, 
		        		grdAnlsCrtrDtl.getCols() -1,
		        		false
	        		);
		        
	        	if (needsNewRow) {
	        		grdAnlsCrtrDtl.addRow();
	        		grdAnlsCrtrDtl.setCellDisabled(
	        				grdAnlsCrtrDtl.getRows() -1, 
				        	0, 
				        	grdAnlsCrtrDtl.getRows() -1, 
				        	grdAnlsCrtrDtl.getCols() -1,
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
    
    const fn_grdAnlsCrtrRowChanged = function() {
    	
    	const nRow = grdAnlsCrtr.getRow();
    	
    	if (nRow < 1) {
    		return;
    	}
    	
    	const _crtr = grdAnlsCrtr.getRowData(nRow);
    	
    	if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {    		
    		jsonAnlsCrtrDtl.length = 0;
    		grdAnlsCrtrDtl.refresh();
    		document.querySelector('#cnt-anlsCrtrDtl').innerText = 0;
    		return;
    	}
    	
    	fn_setGrdAnlsCrtrDtl(_crtr);
    }
    


	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow) {

		const editableRow = grdAnlsCrtr.getRowData(nRow, false);	// call by reference(deep copy)
		console.log("editableRow", editableRow);
		editableRow.delYn = "N";
		editableRow.useYn = "Y";
		
		grdAnlsCrtr.rebuild();
		grdAnlsCrtr.setCellDisabled(nRow, 2, nRow, grdAnlsCrtr.getCols() - 1, false);
		nRow++;
		grdAnlsCrtr.addRow(true);
		grdAnlsCrtr.setCellDisabled(nRow, 0, nRow, grdAnlsCrtr.getCols() - 1, true);
	}
	 
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(_nRow) {
		
		const rowStatus = grdAnlsCrtr.getRowStatus(_nRow);
			
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록기준", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const _crtr = grdAnlsCrtr.getRowData(_nRow);
			await fn_deleteCrtr(_crtr);

    	} else {
    		grdAnlsCrtr.deleteRow(_nRow);
    	}
	}
	 
	/**
	 * @name fn_addRowDtl
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRowDtl = async function(nRow) {

		const crtrRow = grdAnlsCrtr.getRow();
		
		if (crtrRow < 1) {
			gfn_comAlert("W0001", "정산기준");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
		const _crtr = grdAnlsCrtr.getRowData(crtrRow);
		
		if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {
			gfn_comAlert("W0020", "미등록");		//	W0020	{0} 상태의 {1} 입니다.
			return;
		} 
		 
		const editableRow = grdAnlsCrtrDtl.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.anlsCrtrType = _crtr.anlsCrtrType;
		editableRow.anlsCrtrTypeNm = _crtr.anlsCrtrTypeNm;
		editableRow.crtrCd = _crtr.crtrCd;
		editableRow.crtrIndctNm = _crtr.crtrIndctNm;
		
		editableRow.delYn = "N";
		editableRow.useYn = "Y";
		
		grdAnlsCrtrDtl.rebuild();
		grdAnlsCrtrDtl.setCellDisabled(nRow, 3, nRow, grdAnlsCrtrDtl.getCols() - 1, false);
		
		nRow++;
		grdAnlsCrtrDtl.addRow(true);
		grdAnlsCrtrDtl.setCellDisabled(nRow, 0, nRow, grdAnlsCrtrDtl.getCols() - 1, true);
	}
	 
	/**
	 * @name fn_delRowDtl
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRowDtl = async function(_nRow) {

		const rowData = grdAnlsCrtrDtl.getRowData(_nRow);
		
		if (_.isEqual(rowData['chkVl'], 'Y')) {
			if (!gfn_comConfirm("Q0002", "등록기준상세", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const _crtrDtl = grdAnlsCrtrDtl.getRowData(_nRow);
			await fn_deleteCrtrDtl(_crtrDtl);

    	} else {
    		grdAnlsCrtrDtl.deleteRow(_nRow);
    	}
		 
	}
	 
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>