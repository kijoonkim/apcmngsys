<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ APC정보관리</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" class="btn btn-sm btn-outline-danger" text="등록" onclick="fn_insert"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 31%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_c">APC코드</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcCd" name="srch-inp-apcCd" class="form-control input-sm" placeholder="입력" title="입력하세요." disabled/>
							</td>
							<th class="ta_c">원본 APC명</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-orgnlApcNm" name="srch-slt-orgnlApcNm" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
											
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>사용자 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdApcInfoMng" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createApcInfoMngGrid();
	})
	
// 	var jsonRegSlsPrfmncList = ['test','test','test','test','test']; // 그리드의 참조 데이터 주소 선언
	var jsonApcInfoMngList = [];

	function fn_createApcInfoMngGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcInfoMng';
	    SBGridProperties.id = 'grdApcInfoMng';
	    SBGridProperties.jsonref = 'jsonApcInfoMngList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
        	{caption: ['선택'], ref: 'slt', width: '100px', type: 'checkbox'},
            {caption: ['APC코드'], ref: 'apcCd', width: '100px', type: 'output'},
            {caption: ['원본APC명'], ref: 'orgnlApcNm', width: '100px', type: 'output'},
            {caption: ['시도명'], ref: 'ctpvNm', width: '100px', type : 'output'},
            {caption: ['시군명'], ref: 'sigunNm', width: '100px', type: 'output'},
            {caption: ['주체명'], ref: 'mbNm', width: '100px', type: 'output'},
            {caption: ['원본주소'], ref: 'orgnlAddr', width: '100px', type: 'output'},
            {caption: ['원본전화번호'], ref: 'orgnlTelno', width: '100px', type: 'output'},
            {caption: ['APC명'], ref: 'apcNm', width: '100px', type: 'output'},
            {caption: ['사업자번호'], ref: 'brno', width: '100px', type: 'output'},
            {caption: ['주소'], ref: 'addr', width: '100px', type: 'output'},
            {caption: ['팩스번호'], ref: 'fxno', width: '100px', type: 'output'},
            {caption: ['전화번호'], ref: 'telno', width: '100px', type: 'output'},
            {caption: ['처리'], ref: 'prcs', width: '100px', type : 'button', style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowApcInfo(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowApcInfo(\"DEL\", " + nRow + ")'>삭제</button>";
            	}
            }}
        ];
        grdApcInfoMng = _SBGrid.create(SBGridProperties);
        grdApcInfoMng.addRow(true);
    }
	
	function fn_procRowApcInfo(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdApcInfoMng.setCellData(nRow, nCol, "N", true);
			grdApcInfoMng.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdApcInfoMng.getRowStatus(nRow) == 0 || grdApcInfoMng.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var apcVO = grdApcInfoMng.getRowData(nRow);
        			//fn_deletePrdcr(prdcrVO);
        			grdApcInfoMng.deleteRow(nRow);
        		}
        	}else{
        		grdApcInfoMng.deleteRow(nRow);
        	}
		}
	}
</script>
</html>