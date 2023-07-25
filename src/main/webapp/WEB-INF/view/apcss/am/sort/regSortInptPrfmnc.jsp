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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 선별실적등록</h3>
			</div>
			<div style="margin-left: auto;">
				<p class="ad_input_row">
					<sbux-checkbox id="check_all" name="check_all" uitype="normal" text="포장실적 자동등록" ></sbux-checkbox>
				</p>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-dark"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-dark"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-dark"></sbux-button>
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
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8"></td>
						</tr>
						<tr>
						<th scope="row">입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmd1" name="srch-dtp-wrhsYmd1" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmd2" name="srch-dtp-wrhsYmd2" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonVrty"></sbux-select>
							</td>
							<td></td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrNm" name="srch-inp-prdcrNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-slt-prdcrNm" name="srch-btn-slt-prdcrNm" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
							<td class="td_input" ></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>원물재고내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-grdInptPremnc" style="height:300px;"></div>
					</div>
					<br />
<!-- 					<div class="ad_section_bottom"></div> -->
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
									<th scope="row">선별일자</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-datepicker id="srch-dtp-inptYmd" name="srch-dtp-inptYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
									</td>
									<td colspan="2"></td>
									<th scope="row">설비</th>
									<td class="td_input" style="border-right: hidden;">
									<sbux-select id="srch-slt-fcltCd" name="srch-slt-fcltCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComFclt"></sbux-select>
									</td>
									<td colspan="2"></td>
									<th scope="row">선별 투입량</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-inp-sortWght" name="srch-inp-sortWght" uitype="text" placeholder="" class="form-control input-sm" disabled>
									</td>
									<td style="border-right: hidden;">
										<label class="bold">Kg</label>
									</td>
								</tr>
							</tbody>
			            </table>
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>선별실적 내역</span></li>
								</ul>
								<div class="ad_tbl_toplist">
									<sbux-button id="btnDown" name="btnDown" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger"></sbux-button>
									<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger"></sbux-button>
								</div>
							</div>
						<div class="table-responsive tbl_scroll_sm">
							<div id="sb-area-grdInptPremnc2" style="height:340px;"></div>
						</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

<script type="text/javascript">
	var jsonItem				= [];	// 품목 		itemCd		검색
	var jsonVrty				= [];	// 품종 		vrtyCd		검색
	var jsonComFclt				= [];	// 설비 		fcltCd		검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-fcltCd', 	jsonComFclt, 'FCLT_CD', gv_apcCd);		// 설비
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonItem, gv_apcCd);		// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonVrty, gv_apcCd);		// 품종
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonVrty, gv_apcCd, itemCd);		// 품종
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createInptPremncGrid1();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd1", year+month+day);
		SBUxMethod.set("srch-dtp-wrhsYmd2", year+month+day);
		SBUxMethod.set("srch-dtp-inptYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
	})

	function fn_createInptPremncGrid1() {
	    var SBGridProperties1 = {};
		    SBGridProperties1.parentid = 'sb-area-grdInptPremnc';
		    SBGridProperties1.id = 'grdComMsgList';
		    SBGridProperties1.jsonref = 'jsonComMsgList';
		    SBGridProperties1.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties1.selectmode = 'byrow';
		    SBGridProperties1.extendlastcol = 'scroll';
		    SBGridProperties1.columns = [
	             {caption: ["입고일자","입고일자"],		ref: 'msgKey',      type:'output',  width:'16%'},
	             {caption: ["팔레트번호","팔레트번호"], 	ref: 'msgCn',     	type:'output',  width:'16%'},
	             {caption: ["지시번호","지시번호"], 	 	ref: 'msgKndNm',    type:'output',  width:'16%'},
	             {caption: ["생산자","생산자"],    		ref: 'rmrk',        type:'output',  width:'16%'},
	             {caption: ["품종","품종"],	    		ref: 'creUserId',   type:'output',  width:'16%'},
	             {caption: ["창고","창고"],	    		ref: 'creDateTime', type:'output',  width:'16%'},
	             {caption: ["원물재고","수량"],  		ref: 'updUserId',   type:'output',  width:'8%'},
	             {caption: ["원물재고","중량"],  		ref: 'updUserId',   type:'output',  width:'8%'},
	             {caption: ["투입지시","수량"],  		ref: 'updDateTime', type:'output',  width:'8%'},
	             {caption: ["투입지시","중량"],  		ref: 'updDateTime', type:'output',  width:'8%'},
	             {caption: ["투입","수량"], 			ref: 'creProgram',  type:'output',  width:'8%'},
	             {caption: ["투입","중량"], 			ref: 'creProgram',  type:'output',  width:'8%'}
	    ];

	    var SBGridProperties2 = {};
		    SBGridProperties2.parentid = 'sb-area-grdInptPremnc2';
		    SBGridProperties2.id = 'grdComMsgList2';
		    SBGridProperties2.jsonref = 'jsonComMsgList2';
		    SBGridProperties2.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties2.selectmode = 'byrow';
		    SBGridProperties2.extendlastcol = 'scroll';
		    SBGridProperties2.columns = [
	             {caption: ["선별일자"],	ref: 'msgKey',      type:'output',  width:'10%'},
	             {caption: ["설비"], 		ref: 'msgCn',     	type:'output',  width:'10%'},
	             {caption: ["규격"], 	 	ref: 'msgKndNm',    type:'output',  width:'10%'},
	             {caption: ["특"],    	ref: 'rmrk',        type:'output',  width:'10%'},
	             {caption: ["상"],	    ref: 'creUserId',   type:'output',  width:'10%'},
	             {caption: ["중"],	    ref: 'creDateTime', type:'output',  width:'10%'},
	             {caption: ["하"],  		ref: 'updUserId',   type:'output',  width:'10%'},
	             {caption: ["합계"], 	 	ref: 'updUserId',   type:'output',  width:'10%'},
	             {caption: ["kg"],  		ref: 'updDateTime', type:'output',  width:'10%'},
	             {caption: ["저장창고"],  	ref: 'updDateTime', type:'output',  width:'10%'},
	             {caption: ["비고"], 		ref: 'creProgram',  type:'output',  width:'10%'},
	             {caption: ["라벨"], 		ref: 'creProgram',  type:'output',  width:'10%'},
	             {caption: ["처리"], 		ref: 'creProgram',  type:'output',  width:'10%'}

	    ];
		grdComMsgList = _SBGrid.create(SBGridProperties1);
	    grdComMsgList2 = _SBGrid.create(SBGridProperties2);
	}
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

</script>
</body>
</html>