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

<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 상품입고등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->	
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
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
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmd" name=srch-dtp-wrhsYmd uitype="popup" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
						    <td class="td_input" style="border-right:hidden ;">
						    	<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm-ast inpt_data_reqed input-sm" maxlength="33"></sbux-input>
						    </td>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											class="form-control input-sm input-sm-ast"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										/>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="선택"
											uitype="single"
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										/>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>수량/중량</th>
							<td colspan="4" class="td_input"style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qntt" name="srch-inp-qntt" class="form-control input-sm-ast inpt_data_reqed input-sm" maxlength="6" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" onchange="fn_onChangeQnttWght"/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghtAvg" name="srch-inp-wghtAvg" class="form-control input-sm" placeholder="평균" disabled/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wght" name="srch-inp-wght" maxlength="7" class="form-control input-sm-ast inpt_data_reqed input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}" onchange="fn_onChangeQnttWght"/>
							</td>
							<td colspan="3">
								<sbux-label uitype="normal" id="srch-lbl-chc" name="srch-lbl-chc" class="blod" text="Kg"/>
							</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonApcSpcfct"></sbux-select>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-bx" name="srch-slt-bx" class="form-control input-sm" jsondata-ref="jsonComBx"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">창고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="9">&nbsp;</td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" maxlength="333" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품입고내역</span></li>
					</ul>
				</div>
                <div class="sbt-wrap-body">
                    <div class="sbt-grid">
                        <div id="sb-area-grdGdsWrhs" style="height:500px;"></div>
                    </div>
               	</div>
				<!--[pp] //검색결과 -->
				
			</div>
		</div>
	</section>
    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem				= [];	// 품목 			itemCd		검색
	var jsonApcVrty				= [];	// 품종 			vrtyCd		검색
	var jsonApcSpcfct			= [];	// 규격 			spcfcCd		검색
	var jsonComBx				= [];	// 박스 			pltBxCd		검색
	var jsonComWarehouseSeCd	= [];	// 창고 			warehouse	검색

	var jsonComGdsSeCd			= [];	// 상품구분		GDS_SE_CD
	
	var jsonGdsWrhs 			= [];
	
	const fn_initSBRadio = async function() {
		// 검색 radio
    	let result = await Promise.all([
	    		gfn_getComCdDtls('GDS_SE_CD', gv_selectedApcCd)		// 상품구분
    		]);

		jsonComGdsSeCd = result[0];
		SBUxMethod.refresh('srch-rdo-gdsSeCd');
    }
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setPltBxSBSelect('srch-slt-bx', jsonComBx, gv_selectedApcCd, 'B'),										// 박스
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),									// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd)									// 품종
		]);
        //fn_search();
	}
	
	const fn_init = async function() {
		fn_createGdsWrhsGrid();

		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio()
			]);

		fn_reset();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	function fn_createGdsWrhsGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGdsWrhs';
	    SBGridProperties.id = 'grdGdsWrhs';
	    SBGridProperties.jsonref = 'jsonGdsWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
    	SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["입고번호"],	ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["팔레트번호"],	ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["입고일자"],	ref: 'wrhsYmd',     type:'output',  width:'105px',    style:'text-align: center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["상품구분"],	ref: 'gdsSe',      	type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["거래처"],		ref: 'cnptNm',      type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["수량"],		ref: 'qntt',      	type:'output',  width:'105px',    style:'text-align: right',
	        	format : {type:'number', rule:'#,###'}},
	        {caption: ["중량"],		ref: 'wght',      	type:'output',  width:'105px',    style:'text-align: right',
	        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["박스종류"],	ref: 'msgKey',      type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["창고"],		ref: 'warehouse',	type:'output',  width:'105px',    style:'text-align: center'},
	        {caption: ["비고"],		ref: 'rmrk',      	type:'output',  width:'105px'},
	    ];
	    grdGdsWrhs = _SBGrid.create(SBGridProperties);
	    grdGdsWrhs.bind( "afterpagechanged" , "fn_pagingGdsWrhs" );
	}
	
	// 출하실적 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdGdsWrhs.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdGdsWrhs.movePaging(currentPageNo);
    }

	let newJsonGdsWrhs = [];

	// 출하실적 목록 조회 호출
	async function fn_callSelectGdsWrhsList(recordCountPerPage, currentPageNo){
		jsonGdsWrhs = [];
		let apcCd = gv_selectedApcCd;
		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let itemCd = SBUxMethod.get("srch-inp-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let bx = SBUxMethod.get("srch-slt-bx");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		
		if (gfn_isEmpty(spmtYmdFrom)){
			gfn_comAlert("W0002", "출하일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		
		let VO = {apcCd 				: apcCd
						  , wrhsYmd 			: wrhsYmd
						  , gdsSeCd 			: gdsSeCd
						  , cnptNm 				: cnptNm
						  , itemCd 				: itemCd
						  , vrtyCd 				: vrtyCd
						  , spcfctCd 			: spcfctCd
						  , bx 					: bx
						  , warehouseSeCd 		: warehouseSeCd
						  , pagingYn 			: 'Y'
						  , currentPageNo 		: currentPageNo
						  , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncList.do", VO);
        let data = await postJsonPromise;
        newJsonGdsWrhs = [];
        try{
        	data.resultList.forEach((item, index) => {
				let gdsWrhs = {
					wrhsYmd 		: item.wrhsYmd
				  , gdsSe 			: item.gdsSe
				  , itemNm 			: item.itemNm
				  , itemNm 			: item.itemNm
				  , itemNm 			: item.itemNm
				  , itemNm 			: item.itemNm
				  , wrhsYmd 		: item.wrhsYmd
				  , gdsSe 			: item.gdsSe
				  , itemNm 			: item.itemNm
				  , vrtyNm 			: item.vrtyNm
				  , cnptNm 			: item.cnptNm
				  , qntt 			: item.qntt
				  , wght 			: item.wght
				  , bxKnd 			: item.bxKnd
				  , warehouseSe	 	: item.warehouseSe
				  , rmrk			: item.rmrk
				}
				jsonGdsWrhs.push(Object.assign({}, gdsWrhs));
				newJsonGdsWrhs.push(Object.assign({}, gdsWrhs));
			});
        	if(jsonGdsWrhs.length > 0){
				if(grdGdsWrhs.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdGdsWrhs.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdGdsWrhs.rebuild();
				}else{
					grdGdsWrhs.refresh();
				}
			}else{
				grdGdsWrhs.setPageTotalCount(0);
				grdGdsWrhs.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 페이징
    async function fn_pagingGdsWrhs(){
    	let recordCountPerPage = grdGdsWrhs.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdGdsWrhs.getSelectPageIndex();
    	fn_callSelectGdsWrhsList(recordCountPerPage, currentPageNo);
    }
 	
	// 초기화
	const fn_reset = function() {
 		// 입고일자
 		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
 		// 상품구분
 		SBUxMethod.set("srch-rdo-gdsSeCd", "1");
 		// 매입처
 		SBUxMethod.set("srch-inp-cnptNm", null);
 		// 품목
 		SBUxMethod.set("srch-slt-itemCd", null);
 		// 품종
 		SBUxMethod.set("srch-slt-vrtyCd", null);
 		// 수량
 		SBUxMethod.set("srch-inp-qntt", "");
 		// 수량
 		SBUxMethod.set("srch-inp-wghtAvg", "");
 		// 중량
 		SBUxMethod.set("srch-inp-wght", "");
 		// 규격
 		SBUxMethod.set("srch-slt-spcfctCd", null);
 		// 박스종류
 		SBUxMethod.set("srch-slt-bx", null);
 		// 창고
 		SBUxMethod.set("srch-slt-warehouseSeCd", null);
 		// 비고
 		SBUxMethod.set("srch-inp-rmrk", null);

 		fn_onChangeSrchItemCd({value: null});
 	}
	
	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect(),
			fn_initSBRadio()
		]);
		
		fn_reset();
	}

	const fn_onChangeQnttWght = function() {
		let qntt = parseInt(SBUxMethod.get("srch-inp-qntt")) || 0;
		let wght = parseInt(SBUxMethod.get("srch-inp-wght")) || 0;

		if (qntt > 0) {
			let wghtAvg = Math.round(wght/qntt);
			SBUxMethod.set("srch-inp-wghtAvg", wghtAvg);
		} else {
			SBUxMethod.set("srch-inp-wghtAvg", 0);
		}
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),							// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd),					// 규격
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
	
	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
	}
	
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
		}
	}
</script>
</html>