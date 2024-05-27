<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : <font>경영체정보 선택</font></title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">경영체 정보 정보를 선택합니다.</span>
					</p>
					<p>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btn-sch-compopup1" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="compopup1.search"></sbux-button>
					<sbux-button id="btn-end-compopup1" 	uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="compopup1.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-compopup1" uitype="hidden"></sbux-input>
				
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 15%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">농업인 번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-frmerSn" name="srch-inp-frmerSn" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">경영체 등록번호</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-mngmstRegno" name="srch-inp-mngmstRegno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				
					<div>
						<div id="sb-area-frmerInfo" style="height:300px; width: 100%;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
		
	</section>
</body>
<script >

	/* grid 내 select json */
	var grdFrmerInfo 	= null;
	var jsonFrmerInfo 	= [];
	var excelYn 		= "N";
	var editMode		= false;

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const compopup1 = {
		init : function(obj){
			var _title			= obj.title
			var _bizcompId		= obj.bizcompId;
			var _whereClause	= obj.whereClause;
					
    		var paramObj = { 
    			V_P_DEBUG_MODE_YN	: ''
    			,V_P_LANG_ID		: ''
    			,V_P_COMP_CODE		: gv_ma_selectedApcCd
    			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
    			,V_P_BIZCOMP_ID		: _bizcompId
    			,V_P_WHERE_CLAUSE	: _whereClause
    			,V_P_FORM_ID		: ''
    			,V_P_MENU_ID		: ''
    			,V_P_PROC_ID		: ''
    			,V_P_USERID			: ''
    			,V_P_PC				: ''
		    };
    	    const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
	        	getType				: 'json',
	        	workType			: 'LIST',
	        	cv_count			: '1',
	        	params				: gfnma_objectToString(paramObj)
			});
	        const data = await postJsonPromise;
	
	    	console.log('popup select data:', data);
	
		}	
	}
</script>
</html>