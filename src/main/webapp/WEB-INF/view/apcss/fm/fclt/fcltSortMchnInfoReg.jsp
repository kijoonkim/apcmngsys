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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 선별기운영</h3>
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
				<div><label>선별기현황 상세내역</label></div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:0px;"></div>
				</div>
			<br>
							<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 16%">
					<col style="width: 16%">
					<col style="width: 17%">
					<col style="width: 17%">
					<col style="width: 17%">
					<col style="width: 17%">
				</colgroup>
				<tbody>
					<tr>
						<th>선별기</th>
						<th>보유현황</th>
						<th>처리능력(톤)</th>
						<th>처리물량(톤)</th>
						<th>연간가동시간(시간)</th>
						<th>평균가동일수<br>
							*연간가동시간/4시간<br>
						</th>
					</tr>
					<tr>
						<th>품목1</th>
						<td>
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="35  1일(8h)처리능력" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="2,200 연간처리실적" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="440" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera5" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="110" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>품목2</th>
						<td>
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera5" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>품목3</th>
						<td>
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera5" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>기타</th>
						<td>
							<sbux-input id="srch-inp-opera1" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="(o/x)" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera2" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera3" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera4" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
						<td>
							<sbux-input id="srch-inp-opera5" name="srch-inp-oper1" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
						</td>
					</tr>

				</tbody>
			</table>
			</div>
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
            {caption: ['품목'], 						ref: 'wghno',		width: '16', type: 'output'},
            {caption: ['보유현황'], 						ref: 'prdcrNm', 	width: '16%', type: 'output'},
            {caption: ['처리능력'],						ref: 'itemNm', 		width: '16%', type: 'output'},
            {caption: ['처리물량'],						ref: 'itemNm1', 		width: '16%', type: 'output'},
            {caption: ['연간가동시간'],						ref: 'itemNm2', 		width: '16%', type: 'output'},
            {caption: ['평균가동시간'],						ref: 'itemNm3', 		width: '20%', type: 'output'},
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>