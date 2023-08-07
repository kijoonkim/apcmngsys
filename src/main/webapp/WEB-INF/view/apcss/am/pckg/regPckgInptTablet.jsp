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
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ 포장투입등록 (테블릿)</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_insert"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
					<sbux-button id="btnEnd" name="btnEnd" uitype="normal" class="btn btn-sm btn-outline-danger" text="종료"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 8%">
						<col style="width: 8%">
						<col style="width: 4%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">포장기</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pckg" name="srch-slt-pckg" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox id="srch-chk-pckg" name="srch-chk-pckg" uitype="normal" class="check"></sbux-checkbox>
									<sbux-label id="srch-lbl-pckg" name="srch-lbl-pckg" uitype="normal" text="고정" for-id="srch-chk-pckg" class="check_label"></sbux-label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">선별번호/등급</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortnoGrd" name="srch-inp-sortnoGrd" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchSortnoGrd" name="btnSrchSortnoGrd" uitype="normal" class="btn btn-xs btn-outline-dark" text=" 조회 " onclick="fn_search"></sbux-button>
						  	</td>
				        </tr>
						<tr>
							<th scope="row" class="th_bg">생산지시번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdctnCmndno" name="srch-inp-prdctnCmndno" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPrdctnCmndno" name="btnSrchPrdctnCmndno" uitype="normal" class="btn btn-xs btn-outline-dark" text="조회" onclick="fn_search"></sbux-button>
						    </td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">투입일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-inptYmd" name="srch-dtp-inptYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">투입수량/중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-inptQntt" name="srch-inp-inptQntt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-inptWght" name="srch-inp-inptWght" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-inptQnttWght" name="srch-lbl-inptQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">선별수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortQntt" name="srch-inp-sortQntt" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-sortWght" name="srch-inp-sortWght" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="srch-lbl-sortQnttWght" name="srch-lbl-sortQnttWght" uitype="normal" text="Kg" class="bold"></sbux-label>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">규격명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
							<sbux-input id="srch-inp-spcfctNm" name="srch-inp-spcfctNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장투입 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgInptTablet" class="table table-bordered table-hover tbl_col tbl_fixed" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createPckgInptTabletGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-inptYmd", year+month+day);
	})

	function fn_createPckgInptTabletGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInptTablet';
	    SBGridProperties.id = 'grdPckgInptTablet';
	    SBGridProperties.jsonref = 'jsonPckgInptTablet';
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
            {caption: ['투입일자'], ref: 'inptYmd', width: '100px', type: 'output'},
            {caption: ['포장기명'], ref: 'pckgNm', width: '100px', type: 'output'},
            {caption: ['선별번호/등급'], ref: 'sortnoGrd', width: '100px', type: 'output'},
            {caption: ['생산지시번호'], ref: 'prdctnCmndno', width: '100px', type: 'output'},
            {caption: ['품목'], ref: 'itemCd', width: '100px', type: 'output'},
            {caption: ['품종'], ref: 'vrtyCd', width: '100px', type: 'output'},
            {caption: ['투입수량'], ref: 'inptQntt', width: '100px', type: 'output'},
            {caption: ['투입중량'], ref: 'inptWght', width: '100px', type: 'output'},
            {caption: ['규격명'], ref: 'spcfctNm', width: '100px', type: 'output'},
            {caption: ['비고'], ref: 'rmrk', width: '100px', type: 'output'}
        ];
        grdPckgInptTablet = _SBGrid.create(SBGridProperties);
    }
</script>
</html>