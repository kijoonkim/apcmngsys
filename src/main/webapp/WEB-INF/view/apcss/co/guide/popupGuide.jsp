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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 팝업</h3>
				</div>
				<div style="margin-left: auto;">
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" >품목선택</th>
							<td class="td_input">
								<sbux-input id="item-inp-itemNm" name="item-inp-itemNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchItem" name="btnSrchItem" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-itemCrtr" onclick="fn_modalItem"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >품종선택</th>
							<td class="td_input">
								<sbux-input id="vrty-inp-vrtyNm" name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrtyCrtr" onclick="fn_modalVrty"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >생산자선택</th>
							<td class="td_input">
								<sbux-input id="prdcr-inp-vprdcrNm" name="prdcr-inp-prdcrNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPrdcr" name="btnSrchPrdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >차량선택</th>
							<td class="td_input">
								<sbux-input id="vhcl-inp-vhclNm" name="vhcl-inp-vhclNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
							</td>
							<td></td>
							<th scope="row" >팔레트/박스 선택</th>
							<td class="td_input">
								<sbux-input id="pltBx-inp-pltNm" name="pltBx-inp-pltNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input id="pltBx-inp-bxNm" name="pltBx-inp-bxNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
							</td>
							<th scope="row" >거래처선택</th>
							<td class="td_input">
								<sbux-input id="cnpt-inp-cnptNm" name="cnpt-inp-cnptNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" >원물운임비용등록</th>
							<td class="td_input">
								<sbux-input id="trsprtCst-inp-trsprtCstNm" name="trsprtCst-inp-trsprtCstNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchTrsprtCst" name="btnSrchTrsprtCst" class="btn btn-xs btn-outline-dark" text="입력" uitype="modal" target-id="modal-trsprtCst" onclick="fn_modalTrsprtCst"></sbux-button>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 품목 선택 Modal -->
    <div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="../../am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup.jsp"></jsp:include>
    </div>

    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>

    <!-- 원물운임비용등록 Modal -->
    <div>
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" style="width:1400px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>

<script type="text/javascript">
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</body>
</html>