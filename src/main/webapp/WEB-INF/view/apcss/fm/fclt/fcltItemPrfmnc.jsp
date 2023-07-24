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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 산지유통시설품목처리실적</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
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
					<col style="width: 6%">
					<col style="width: 3%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-warehouse" name="srch-inp-warehouse" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td colspan="5"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>
												<br>
			<div><label>산지유통시설품목처리실적 상세내역</label></div>
			<div style="display: flex;"><label style="font-size: x-small; margin-left: auto;">(단위: 백만원,톤,%)</label></div>
			<br>

			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
					</colgroup>
						<tbody>
							<tr>
								<th>품목명</th>
								<th>APC취급액(A)</th>
								<th>APC취급물량</th>
								<th>APC취급액 중 통합마케팅 출하액(B)</th>
								<th>통합마케팅 출하비율(B/A)</th>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="품목1" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera2" name="srch-inp-oper2" uitype="text" class="form-control input-sm" placeholder="15,800" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera3" name="srch-inp-oper3" uitype="text" class="form-control input-sm" placeholder="2,200" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera4" name="srch-inp-oper4" uitype="text" class="form-control input-sm" placeholder="15,800" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera5" name="srch-inp-oper5" uitype="text" class="form-control input-sm" placeholder="100" ></sbux-input>
								</td>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera6" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="품목2" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera7" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="1,300" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera8" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="306" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera9" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="1,300" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera10" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="100" ></sbux-input>
								</td>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera11" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="품목3" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera12" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera13" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera14" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera15" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera16" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="품목4" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera17" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera18" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera19" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera20" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
								</td>
							</tr>
							<tr>
								<td>
									<sbux-input id="srch-inp-opera21" name="srch-inp-opera6" uitype="text" class="form-control input-sm" placeholder="품목5" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera22" name="srch-inp-opera7" uitype="text" class="form-control input-sm" placeholder="17,100" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera23" name="srch-inp-opera8" uitype="text" class="form-control input-sm" placeholder="2,506" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera24" name="srch-inp-opera9" uitype="text" class="form-control input-sm" placeholder="17,100" ></sbux-input>
								</td>
								<td>
									<sbux-input id="srch-inp-opera25" name="srch-inp-opera10" uitype="text" class="form-control input-sm" placeholder="100" ></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>

					</div>
					<div><label style="font-size: x-small;">* 해당 산지유통시설에서 처리하는 전체 품목의 취급액, 취급물량, 통합마케팅 출하액, 통합마케팅 출하비율을 기재.</label><div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
        <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createspmtDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
	})

	/* const fn_initSBSelect = async function() {

 		gfn_setComCdSBSelect('rdo-wrhsSeCd', jsonRadioWrhsSeCd, 'WRHS_SE_CD');	// 시스템유형

	} */

	function fn_createspmtDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['구분'], 						ref: 'wghno',		width: '17', type: 'output'},
            {caption: ['APC취급액'], 					ref: 'prdcrNm', 	width: '17%', type: 'output'},
            {caption: ['APC취급물량'],					ref: 'itemNm', 		width: '30%', type: 'output'},
            {caption: ['APC통합마케팅 출하액'],			ref: 'itemNm1', 		width: '18%', type: 'output'},
            {caption: ['통합마케팅 출하비율'],			ref: 'itemNm2', 		width: '18%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>