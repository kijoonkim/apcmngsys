<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
					<sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="normal" class="btn btn-sm btn-primary" text="원물인식표" ></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_save" text="저장" ></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_delete" text="삭제" ></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-wrhsno" name="srch-inp-wrhsno" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">

						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">입고일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>생산자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td colspan="6"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonApcVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td>&nbsp;</td>

						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-wrhsSeCd"
										name="srch-rdo-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComWrhsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="15" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
<!-- 							<td colspan="4">&nbsp;</td> -->
							<th scope="row" class="th_bg">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-trsprtSeCd"
										name="srch-rdo-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComTrsprtSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>수량/중량</th>
							<td colspan="3" class="td_input"style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-bxQntt"
									name="srch-inp-bxQntt"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeBxQntt(this)"
								/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-wghtAvg"
									name="srch-inp-wghtAvg"
									class="form-control input-sm"
									placeholder="평균"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWghtAvg(this)"
								/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-wrhsWght"
									name="srch-inp-wrhsWght"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="7"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWrhsWght(this)"
								/>
							</td>
							<td colspan="5">
								<sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"/>
							</td>
							<th scope="row" class="th_bg">차량/운임</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vhclno"
									name="srch-inp-vhclno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-vhcl"
									name="srch-btn-vhcl"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceVhcl"
								/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-trsprt"
									name="srch-inp-trsprt"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true }"
									readonly
								/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-trsprtCst"
									name="srch-btn-trsprt"
									class="btn btn-xs btn-outline-dark"
									text="등록" uitype="modal"
									target-id="modal-trsprtCst"
									onclick="fn_choiceTrsprtCst"
								/>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-bxKnd"
									name="srch-slt-bxKnd"
									class="form-control input-sm"
									jsondata-ref="jsonApcBx"
								/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-warehouseSeCd"
									name="srch-slt-warehouseSeCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonComWarehouse"
								/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>등급</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-grdCd"
									name="srch-slt-grdCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonApcGrd"
								/>
							</td>
							<td colspan="9" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="srch-inp-rmrk"
									name="srch-inp-rmrk"
									class="form-control input-sm"
									autocomplete="off"
								/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">팔레트번호</th>
							<td colspan= "6" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-pltno"
									name="srch-inp-pltno"
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
							<span>원물입고 내역</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>

					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger" onclick="fn_uld">올리기</sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-grdRawMtrWrhs" style="height:380px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1000px"></sbux-modal>
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
    <!-- 운임 선택 Modal -->
    <div>
        <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-trsprtCst">
    	<jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">

	const lv_paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };

	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		grdCd		검색
	var jsonApcSpcfct		= [];	// 규격 		spcfcCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonApcBx			= [];	// 팔레트/박스 	검색

	var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
	var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
	var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    /* SBGrid */
	var grdRawMtrWrhs;
    /* SBGrid Data (JSON) */
	var jsonRawMtrWrhs = [];

    /**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			 	gfn_setPltBxSBSelect('srch-slt-bxKnd', 			jsonApcBx, gv_selectedApcCd, 'B'),	// 박스
			 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),		// 품목
			 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd)		// 품종
			]);
	}

    /**
     * @name fn_initSBRadio
     * @description SBRadio JSON 불러오기
     */
    const fn_initSBRadio = async function() {

    	let result = await Promise.all([
	    		gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
	    		gfn_getComCdDtls('GDS_SE_CD'),		// 상품구분
	    		gfn_getComCdDtls('TRSPRT_SE_CD')	// 운송구분
    		]);

    	jsonComWrhsSeCd = gfn_getJsonFilter(result[0], 'cdVl', ["1", "2", "3"]);
		jsonComGdsSeCd = result[1];
		jsonComTrsprtSeCd = result[2];

		SBUxMethod.refresh('srch-rdo-wrhsSeCd');
		SBUxMethod.refresh('srch-rdo-gdsSeCd');
		SBUxMethod.refresh('srch-rdo-trsprtSeCd');
    }


	/**
	 * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		fn_createGrid();

		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio(),
				fn_getPrdcrs()
			]);

		fn_clearForm();
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_createGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = lv_paging;

	    SBGridProperties.columns = [
	        {caption: ["입고번호"],		ref: 'wrhsno',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],	ref: 'pltno',      	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'prdcrNm',     type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',     type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'wrhsSeNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'trsprtSeNm',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'grdNm',      	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'output',  width:'80px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],	ref: 'wrhsWght',    type:'output',  width:'80px',    style:'text-align:right'},
	        {caption: ["박스종류"],		ref: 'bxKndNm',     type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["보관창고"],		ref: 'warehouseSeNm',	type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'wghno',      	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'rmrk',      	type:'output',  width:'200px',    style:'text-align:left'},
	        {caption: ["APC코드"],	ref: 'apcCd',     	type:'output',  hidden: true},
	        {caption: ["생산자코드"],	ref: 'prdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   	type:'output',  hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 	type:'output',  hidden: true},
	        {caption: ["등급코드"],		ref: 'grdCd',   	type:'output',  hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   	type:'output',  hidden: true},
	        {caption: ["보관창고코드"],	ref: 'warehouseSeCd', type:'output',  hidden: true},
	    ];

	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
	    // TODO 바인드 추가 확인할 것
	    grdRawMtrWrhs.bind('click', fn_view);
	}


	/**
	 * common button action
	 */

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = function() {
		fn_clearForm();
	}



     /**
      * @name fn_delete
      * @description 삭제 버튼
      */
	const fn_delete = async function() {
		let wrhsno = SBUxMethod.get("srch-inp-wrhsno");

		if (gfn_isEmpty(wrhsno)) {
			gfn_comAlert("W0004", "선택");		//	W0004	{0}한 대상이 없습니다.
            return;
		}

		const rawMtrWrhs = {
    		apcCd: gv_selectedApcCd,
    		wrhsno: wrhsno
    	}

    	let postUrl = "/am/wrhs/deleteRawMtrWrhs.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_inputClear();
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
 	}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		let wrhsno = SBUxMethod.get("srch-inp-wrhsno");
    	// 항목 set
    	let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
 		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
 		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
 		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분
 		let itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
 		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");		// 생산자
 		let bxQntt = SBUxMethod.get("srch-inp-bxQntt");			// 수량
 		let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");		// 중량
 		let pltno = SBUxMethod.get("srch-inp-pltno");			// 팔레트번호
 		let bxKnd = SBUxMethod.get("srch-slt-bxKnd");			// 박스종류
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
 		let vhclno = SBUxMethod.get("srch-inp-vhclno");			// 차량번호
 		let trsprtCst = SBUxMethod.get("srch-inp-trsprtCst");	// 운임비용
 		let rmrk = SBUxMethod.get("srch-inp-rmrk");				// 비고
 		let grdCd = SBUxMethod.get("srch-slt-grdCd");			// 등급
 		let wghno = SBUxMethod.get("srch-inp-wghno");			// 계량번호

    	// validation check
    	if (gfn_isEmpty(wrhsYmd)) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(wrhsSeCd)) {
    		gfn_comAlert("W0001", "입고구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(gdsSeCd)) {
    		gfn_comAlert("W0001", "상품구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(trsprtSeCd)) {
    		gfn_comAlert("W0001", "운송구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(itemCd)) {
    		gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(vrtyCd)) {
    		gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}
    	if (gfn_isEmpty(bxQntt)) {
    		gfn_comAlert("W0001", "수량");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}
    	if (gfn_isEmpty(wrhsWght)) {
    		gfn_comAlert("W0001", "중량");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	if (gfn_isEmpty(warehouseSeCd)) {
    		gfn_comAlert("W0001", "창고");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(grdCd)) {
    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if (!gfn_comConfirm("Q0001", "저장")) {
    		return;
    	}

    	const rawMtrWrhs = {
    		apcCd: gv_selectedApcCd,
    		wrhsno: wrhsno,
   			wrhsYmd: wrhsYmd,
   			wrhsSeCd: wrhsSeCd,
   			gdsSeCd: gdsSeCd,
   			trsprtSeCd: trsprtSeCd,
   			itemCd: itemCd,
   			vrtyCd: vrtyCd,
   			prdcrCd: prdcrCd,
   			bxQntt: bxQntt,
   			wrhsWght: wrhsWght,
   			pltno: pltno,
   			bxKnd: bxKnd,
   			warehouseSeCd: warehouseSeCd,
   			vhclno: vhclno,
   			trsprtCst: trsprtCst,
   			rmrk: rmrk,
   			grdCd: grdCd,
   			wghno: wghno,
    	}


    	let postUrl = gfn_isEmpty(wrhsno) ? "/am/wrhs/insertRawMtrWrhs.do" : "/am/wrhs/updateRawMtrWrhs.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_inputClear();
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }

	}

    const fn_view = async function() {

		let nRow = grdRawMtrWrhs.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdRawMtrWrhs.getRowData(nRow);

     	// 입고번호
		SBUxMethod.set("lbl-wrhsno", "입고번호 : " + rowData.wrhsno);
		SBUxMethod.set("srch-inp-wrhsno", rowData.wrhsno);

		SBUxMethod.set("srch-dtp-wrhsYmd", rowData.wrhsYmd);	// 입고일자
 		SBUxMethod.set("srch-rdo-wrhsSeCd", rowData.wrhsSeCd);		// 입고구분
 		SBUxMethod.set("srch-rdo-gdsSeCd", rowData.wrhsSeCd);		// 상품구분
 		SBUxMethod.set("srch-rdo-trsprtSeCd", rowData.wrhsSeCd);	// 운송구분

 		SBUxMethod.set("srch-inp-prdcrCd", rowData.prdcrCd);
 		SBUxMethod.set("srch-inp-prdcrNm", rowData.prdcrNm);
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

 		SBUxMethod.set("srch-inp-bxQntt", rowData.bxQntt);			// 수량
 		SBUxMethod.set("srch-inp-wrhsWght", rowData.wrhsWght);		// 중량
 		fn_onChangeWrhsWght();

 		SBUxMethod.set("srch-inp-pltno", rowData.pltno);			// 팔레트번호
 		SBUxMethod.set("srch-slt-bxKnd", rowData.bxKnd);			// 박스종류
 		SBUxMethod.set("srch-slt-warehouseSeCd", rowData.warehouseSeCd);	// 창고
 		SBUxMethod.set("srch-inp-vhclno", rowData.vhclno);			// 차량번호
 		SBUxMethod.set("srch-inp-rmrk", rowData.rmrk);				// 비고

 		SBUxMethod.set("srch-inp-wghno", rowData.wghno);			// 계량번호

 		await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
		SBUxMethod.set("srch-slt-vrtyCd", rowData.vrtyCd);
		await fn_onChangeSrchVrtyCd({value: rowData.vrtyCd});

 		SBUxMethod.set("srch-slt-grdCd", rowData.grdCd);			// 등급
    }

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
        // set pagination
    	grdRawMtrWrhs.rebuild();
    	let pageSize = grdRawMtrWrhs.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrWrhs.length = 0;
    	grdRawMtrWrhs.clearStatus();
    	fn_setGrdRawMtrWrhs(pageSize, pageNo);

		SBUxMethod.set("lbl-wrhsno", "");
		SBUxMethod.set("srch-inp-wrhsno", "");
	}

    /**
     * @name fn_setGrdRawMtrWrhs
     * @description 입고내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdRawMtrWrhs = async function(pageSize, pageNo) {

   		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
  		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
  		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
  		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자

  		let itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmd: wrhsYmd,
			wrhsSeCd: wrhsSeCd,
			gdsSeCd: gdsSeCd,
			trsprtSeCd: trsprtSeCd,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrWrhs.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhs = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						apcNm: item.apcNm,
  						wrhsno: item.wrhsno,
  						wghno: item.wghno,
  						pltno: item.pltno,
  						wrhsYmd: item.wrhsYmd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						vhclno: item.vhclno,
  						bxQntt: item.bxQntt,
  						wrhsWght: item.wrhsWght,
  						bxKnd: item.bxKnd,
  						bxKndNm: item.bxKndNm,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						rmrk: item.rmrk
  				}
  				jsonRawMtrWrhs.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonRawMtrWrhs.length > 0) {
          		if(grdRawMtrWrhs.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdRawMtrWrhs.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdRawMtrWrhs.rebuild();
  				}else{
  					grdRawMtrWrhs.refresh();
  				}
          	} else {
          		grdRawMtrWrhs.setPageTotalCount(totalRecordCount);
          		grdRawMtrWrhs.rebuild();
          	}

          	document.querySelector('#listCount').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

    const fn_inputClear = function() {
  		// 수량
  		SBUxMethod.set("srch-inp-bxQntt", "");
  		// 중량
  		SBUxMethod.set("srch-inp-wrhsWght", "");
  		// 평균
  		SBUxMethod.set("srch-inp-wghtAvg", "");
    }

 	/**
      * @name fn_clearForm
      * @description form 초기화
      * @function
      */
 	const fn_clearForm = function() {

		SBUxMethod.set("lbl-wrhsno", "");
		SBUxMethod.set("srch-inp-wrhsno", "");

 		// 입고일자
 		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));

 		// 입고구분
 		SBUxMethod.set("srch-rdo-wrhsSeCd", "3");
 		// 상품구분
 		SBUxMethod.set("srch-rdo-gdsSeCd", "1");
 		// 운송구분
 		SBUxMethod.set("srch-rdo-trsprtSeCd", "1");

 		// 품목
 		SBUxMethod.set("srch-slt-itemCd", null);
 		// 품종
 		SBUxMethod.set("srch-slt-vrtyCd", null);

 		// 수량
 		SBUxMethod.set("srch-inp-bxQntt", "");
 		// 중량
 		SBUxMethod.set("srch-inp-wrhsWght", "");
 		// 평균
 		SBUxMethod.set("srch-inp-wghtAvg", "");

 		// 팔레트번호
 		SBUxMethod.set("srch-inp-pltno", "");

 		// 박스종류
 		SBUxMethod.set("srch-slt-bxKnd", null);

 		// 창고
 		SBUxMethod.set("srch-slt-warehouseSeCd", null);

 		// 차량번호
 		SBUxMethod.set("srch-inp-vhclno", "");

 		// 운임비용
 		SBUxMethod.set("srch-inp-trsprtCst", "");

 		// 비고
 		SBUxMethod.set("srch-inp-rmrk", "");

 		// 등급
 		SBUxMethod.set("srch-slt-grdCd", null);

 		// 계량번호
 		SBUxMethod.set("srch-inp-wghno", "");

 		// 생산자
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue
 	}




	/** ui event */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		let result = await Promise.all([
			fn_initSBSelect(),
			fn_getPrdcrs()
		]);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd),	// 규격
			gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd),				// 등급
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}

		console.log("prdcr", prdcr);

		if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
			SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
		}
		if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
			SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
		}
		if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
			SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
		}
	}



	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);
		}
	}

	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceTrsprtCst = function() {
		//_trsprtYmd, _vhclno, _callbackFnc
		//
		let ymd = SBUxMethod.get("srch-dtp-wrhsYmd");
		let vhclno = SBUxMethod.get("srch-inp-vhclno");
		popTrsrptCst.init(gv_selectedApcCd, gv_selectedApcNm, ymd, vhclno, fn_setTrsprtCst);
	}

	const fn_setTrsprtCst = function(trsprtCst) {
		if (!gfn_isEmpty(trsprtCst)) {
			//SBUxMethod.set("srch-inp-trsprtCst", trsprtCst.vhclno);
		}
	}



	const fn_onChangeBxQntt = function(obj) {
		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wrhsWght = parseInt(SBUxMethod.get("srch-inp-wrhsWght")) || 0;

		if (bxQntt > 0 && wrhsWght > 0) {
			let wghtAvg = Math.round(wrhsWght / bxQntt);
			SBUxMethod.set("srch-inp-wghtAvg", wghtAvg);
		}
	}

	const fn_onChangeWghtAvg = function(obj) {

		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

		if (bxQntt > 0 && wghtAvg > 0) {
			let wrhsWght = Math.round(bxQntt * wghtAvg);
			SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
		}
	}

	const fn_onChangeWrhsWght = function(obj) {
		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wrhsWght = parseInt(SBUxMethod.get("srch-inp-wrhsWght")) || 0;

		if (bxQntt > 0 && wrhsWght > 0) {
			let wghtAvg = Math.round(wrhsWght / bxQntt);
			SBUxMethod.set("srch-inp-wghtAvg", wghtAvg);
		}
	}

</script>
</html>