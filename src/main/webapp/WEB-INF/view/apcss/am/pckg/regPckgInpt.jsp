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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 포장실적등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" class="btn btn-sm btn-outline-danger" text="등록" onclick="fn_insert"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC 명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromSortYmd" name="srch-dtp-fromSortYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toSortYmd" name="srch-dtp-toSortYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="선택" class="form-control input-sm" jsondata-ref="jsonItem" onchange="fn_selectItem"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" unselected-text="선택" class="form-control input-sm" jsondata-ref="jsonVrty"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" unselected-text="선택" class="form-control input-sm" jsondata-ref="jsonSpcfct"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>선별재고 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgTrDsctn" style="width:100%;height:300px;"></div>
				</div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 1%">
						<col style="width: 6%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">포장일자</th>
				          	<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmd" name="srch-dtp-pckgYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-pckg" name="srch-slt-pckg" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">출하수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtQntt" name="srch-inp-spmtQntt" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;/</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtWght" name="srch-inp-spmtWght" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input">Kg</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장실적 내역</span></li>
					</ul>
				</div>
				<div class="table table-bordered table-hover tbl_col tbl_fixed">
					<div id="sb-area-grdPckgInptDsctn" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
				<!--
					<tr>
						<td>2023-05-01</td>
						<td>&nbsp;</td>
						<td><sbux-select id="dtl-slt-spcfct1" name="dtl-slt-spcfct1" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><sbux-select id="dtl-slt-gdsGrd1" name="dtl-slt-gdsGrd1" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select></td>
						<td><sbux-select id="dtl-slt-strg1" name="dtl-slt-strg1" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select></td>
						<td>&nbsp;</td>
						<td><sbux-button id="btnLblIssu" name="btnLblIssu" uitype="normal" class="btn btn-sm btn-outline-primary" text="발행"></sbux-button></td>
						<td><sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button></td>
					</tr>
					<tr>
						<td>2023-05-01</td>
						<td>&nbsp;</td>
						<td><sbux-select id="dtl-slt-spcfct2" name="dtl-slt-spcfct2" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><sbux-select id="dtl-slt-gdsGrd2" name="dtl-slt-gdsGrd2" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select></td>
						<td><sbux-select id="dtl-slt-strg2" name="dtl-slt-strg2" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><sbux-button id="btnAddPrfmnc" name="btnAddPrfmnc" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가"></sbux-button></td>
					</tr> -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonItem				= [];	// 품목 		itemCd		검색
	var jsonVrty				= [];	// 품종 		vrtyCd		검색
	var jsonSpcfct				= [];	// 규격 		spcfctCd	검색
	var jsonComFclt				= [];	// 설비 		fcltCd		검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonItem, gv_apcCd);		// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonVrty, gv_apcCd);		// 품종
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonVrty, gv_apcCd, itemCd);		// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_apcCd, itemCd);		// 규격
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createPckgTrDsctnGrid();
		fn_createPckgInptDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromSortYmd", year+month+day);
		SBUxMethod.set("srch-dtp-toSortYmd", year+month+day);
		SBUxMethod.set("srch-dtp-pckgYmd", year+month+day);

		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();

	})

// 	var jsonPckgTrDsctnList = ['test','test','test','test','test','test','test','test','test','test','test','test','test','test','test']; // 그리드의 참조 데이터 주소 선언
	var jsonPckgTrDsctnList = [];

	function fn_createPckgTrDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgTrDsctn';
	    SBGridProperties.id = 'grdPckgTrDsctn';
	    SBGridProperties.jsonref = 'jsonPckgTrDsctnList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['선택','선택'], ref: 'slt', width: '100px', type : 'checkbox'},
            {caption: ['선별번호/등급','선별번호/등급'], ref: 'sltNoGrd', width: '100px', type: 'output'},
            {caption: ['생산지시번호','생산지시번호'], ref: 'prdctnCmndno', width: '100px', type: 'output'},
            {caption: ['품종','품종'], ref: 'vrty', width: '100px', type: 'output'},
            {caption: ['규격','규격'], ref: 'spcfct', width: '100px', type: 'output'},
            {caption: ['대표생산자','대표생산자'], ref: 'rprsPrdctr', width: '100px', type: 'output'},
            {caption: ['선별재고','수량'], ref: 'sltStkQty', width: '100px', type: 'output'},
            {caption: ['선별재고','중량'], ref: 'sltStkWght', width: '100px', type: 'output'},
            {caption: ['포장지시','수량'], ref: 'pckgOrdrQty', width: '100px', type: 'output'},
            {caption: ['포장지시','중량'], ref: 'pckgOrdrWght', width: '100px', type: 'output'},
            {caption: ['포장투입','수량'], ref: 'pckgInptQty', width: '100px', type: 'output'},
            {caption: ['포장투입','중량'], ref: 'pckgInptWght', width: '100px', type: 'output'}
        ];
        grdPckgTrDsctn = _SBGrid.create(SBGridProperties);
    }

// 	var jsonPckgInptDsctnList = ['test','test']; // 그리드의 참조 데이터 주소 선언
	var jsonPckgInptDsctnList = [];

	var comboUesYnJsData1 = ['규격']
	var comboUesYnJsData2 = ['상품등급']
	var comboUesYnJsData3 = ['창고']

	function fn_createPckgInptDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInptDsctn';
	    SBGridProperties.id = 'grdPckgInptDsctn';
	    SBGridProperties.jsonref = 'jsonPckgInptDsctnList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['포장일자'], ref: 'pckgYmd', width: '100px', type: 'output'},
            {caption: ['포장기'], ref: 'pckg', width: '100px', type: 'output'},
            {caption: ['규격'], ref: 'spcfctCd', width: '100px', type : 'inputcombo',
            	typeinfo : {ref:'comboUesYnJsData1', label:'label', value:'value', oneclickedit: true, displayui : true}},
            {caption: ['포장수량'], ref: 'pckgQntt', width: '100px', type: 'output'},
            {caption: ['포장중량'], ref: 'pckgWght', width: '100px', type: 'output'},
            {caption: ['상품등급'], ref: 'gdsGrd', width: '100px', type : 'inputcombo',
            	typeinfo : {ref:'comboUesYnJsData2', label:'label', value:'value', oneclickedit: true, displayui : true}},
            {caption: ['창고'], ref: 'warehouseSeCd', width: '100px', type : 'inputcombo',
            	typeinfo : {ref:'comboUesYnJsData3', label:'label', value:'value', oneclickedit: true, displayui : true}},
            {caption: ['비고'], ref: 'rmrk', width: '400px', type: 'output'},
            {caption: ['라벨'], ref: 'lbl', width: '100px', type : 'button', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
//             	if(strValue === "01"){
//         		return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//         		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
        		return "<button type='button' class='btn btn-xs btn-outline-danger'>발행</button>";
//         	}else{
//			        return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//         	}
	    }},
            {caption: ['처리'], ref: 'prcs', width: '100px', type : 'button', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
//             	if(strValue === "01"){
//         		return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//         		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
        		return "<button type='button' class='btn btn-xs btn-outline-danger'>삭제</button>";
//         	}else{
//			        return "<sbux-button type='normal' class='btn btn-xs btn-outline-danger' onClick='fn_updateComUserAprv("+ nRow + ")'>사용승인</button>";
//         	}
	    }}
        ];
        grdPckgInptDsctn = _SBGrid.create(SBGridProperties);
    }
</script>
</html>