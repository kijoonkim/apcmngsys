<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocRawMtrWgh" name="btnDocRawMtrWgh" uitype="normal" text="계량확인서" class="btn btn-sm btn-primary"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 2%">
						<col style="width: 7%">
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="border-bottom:1px solid white " class="th_bg" >APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
	<script type="text/javascript">
	<c:choose>
		<c:when test="${comApcList != null}">
		var cjsonApcList = ${comApcList};
		</c:when>
		<c:otherwise>
		var cjsonApcList = {};
		</c:otherwise>
	</c:choose>
	<c:if test="${loginVO != null && loginVO.apcAdminType != null}">
		gv_selectedApcCd = null;
	</c:if>
		/**
		 * @name
		 * @description
		 * @function
		 * @param {string} _apcCd
		 */
		const cfn_onChangeApc = function(obj) {
			gv_selectedApcCd = obj.value;
		}
		 
	</script>
	<c:choose>
		<c:when test="${loginVO != null && loginVO.apcAdminType != null}">
			<sbux-select id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="single" jsondata-ref="cjsonApcList" unselected-text="전체" class="form-control input-sm" onchange="cfn_onChangeApc(this)" ></sbux-select>
		</c:when>
		<c:otherwise>
			<sbux-select id="gsb-slt-apcCd" name="gsb-slt-apcCd" uitype="single" jsondata-ref="cjsonApcList" class="form-control input-sm" readonly></sbux-select>
		</c:otherwise>
	</c:choose>
							</td>
							<td colspan="8"></td>
						</tr>
				</table>
				
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 2%">
						<col style="width: 7%">
						<col style="width: 5%">
						<col style="width: 7%">
						<col style="width: 7%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >계량일자</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-datepicker id="dtl-dtp-wrhsYmd" name="dtl-dtp-wrhsYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg" >생산자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-prdcrNm" 
									name="dtl-inp-prdcrNm" 
									class="form-control input-sm"
									placeholder="초성검색 기능입니다." 
									autocomplete-ref="jsonPrdcrAutocomplete" 
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(dtl-inp-prdcrNm)"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPrdcr" name="btnSrchPrdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
								<sbux-select id="dtl-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row">입고구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_1" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="1"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_1" text="일반매입"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_2" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_2" text="공선"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_3" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="3" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_3" text="매취"></sbux-label>
								</p>
							</td>
							<th scope="row">상품구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_1" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_1" text="일반"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_2" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_2" text="GAP"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_3" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_3" text="무농약"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-gdsSeCd_4" name="dtl-rdo-gdsSeCd" uitype="normal" class="radio_label" value="4"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-gdsSeCd_4" text="유기농"></sbux-label>
								</p>
							</td>
							<th scope="row">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_1" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_1" text="자가"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_2" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_2" text="용역"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_3" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_3" text="기타"></sbux-label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">전체중량 Kg</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-input 
									uitype="text" 
									id="dtl-inp-wholWght" 
									name="dtl-inp-wholWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">공차중량 Kg</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-emptVhclWght" 
									name="dtl-inp-emptVhclWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">감량 %</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-rdctRt" name="dtl-inp-rdctRt" 
									class="form-control input-sm"
									mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': false }"
								></sbux-input>
							</td>
							<td style="border-right: hidden;">
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">감량 Kg</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-rdcdWght" 
									name="dtl-inp-rdcdWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">실중량 Kg</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-actlWght" 
									name="dtl-inp-actlWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="dtl-inp-vhclno" name="dtl-inp-vhclno" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-button id="btnSrchVhclno" name="btnSrchVhclno" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">팔레트 Kg</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-pltWght" 
									name="dtl-inp-pltWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="입력" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
								</td>
							<td></td>
							<th scope="row">박스 Kg</th>
							<td class="td_input" >
								<sbux-input 
									uitype="text" 
									id="dtl-inp-bxWght" 
									name="dtl-inp-bxWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">입고중량 Kg</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-bxWght" 
									name="dtl-inp-bxWght" 
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
								></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row">보관창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row">등급</th>
							<td class="td_input" >
								<sbux-select id="dtl-slt-grdCd" name="dtl-slt-grdCd" uitype="single" jsondata-ref="jsonApcGrd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input uitype="text" id="dtl-inp-rmrk" name="dtl-inp-rmrk" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>원물계량 내역</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>						
					</ul>
					
				 	<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger" onclick="fn_uld">올리기</sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:400px;"></div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
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

</body>
<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 팔레트/박스 	warehouse	검색
	var autoCompleteDataJson = [];
	
    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];
    
    
    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회
    
    /* SBGrid Data (JSON) */
    var jsonWghPrfmnc = [];
    
    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {

		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
			
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_reset();
		fn_createWghPrfmncGrid();
		//SBUxMethod.set("dtl-inp-apcNm", gv_apcNm);
		fn_initSBSelect();
		jsonPrdcr = gfn_getPrdcrs(gv_selectedApcCd);
	})

	const fn_createWghPrfmncGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
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
        	{caption: ["No."], ref: 'rowSeq', type:'output',  width:'60px', style:'text-align:right'},
        	{caption: ['계량번호'], ref: 'wghno', width: '100px', type: 'output'},
            {caption: ['생산자'], ref: 'prdcrNm', width: '100px', type: 'output'},
            {caption: ['품목'], ref: 'itemNm', width: '60px', type: 'output'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output'},
            {caption: ['상품구분'], ref: 'gdsSeNm', width: '60px', type: 'output'},
            {caption: ['입고구분'], ref: 'wrhsSeNm', width: '60px', type: 'output'},
            {caption: ['운송구분'], ref: 'trsprtSeNm', width: '60px', type: 'output'},
            {caption: ['전체중량'], ref: 'wholWght', width: '100px', type: 'output'},
            {caption: ['공차중량'], ref: 'emptVhclWght', width: '100px', type: 'output'},
            {caption: ['감량%'], ref: 'rdcdRt', width: '100px', type: 'output'},
            {caption: ['감량Kg'], ref: 'rdcdWght', width: '100px', type: 'output'},
            {caption: ['실중량'], ref: 'actlWght', width: '100px', type: 'output'},
            {caption: ['팔레트중량'], ref: 'pltWght', width: '100px', type: 'output'},
            {caption: ['박스중량'], ref: 'bxWght', width: '100px', type: 'output'},
            {caption: ['정산중량'], ref: 'clclnWght', width: '100px', type: 'output'},
            {caption: ['등급'], ref: 'grdNm', width: '60px', type: 'output'},
            {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'output'},
            {caption: ['보관창고'], ref: 'warehouseSeNm', width: '60px', type: 'output'},
            {caption: ['비고'], ref: 'rmrk', width: '100px', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	/** common button action */
	
	
	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
	}
	
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
        
        // set pagination
    	grdWghPrfmnc.rebuild();
    	let pageSize = grdWghPrfmnc.getPageSize();
    	let pageNo = 1;
        
    	// grid clear
    	jsonWghPrfmnc.length = 0;
    	grdWghPrfmnc.clearStatus();
    	fn_setGrdWghPrfmnc(pageSize, pageNo);
	}
	
	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

		// 계량일자
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2);
		let day = ('0' + today.getDate()).slice(-2);
		let ymd = year + month + day;
		
		SBUxMethod.set("dtl-dtp-wrhsYmd", ymd);
		
		// 생산자
		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.set("dtl-inp-prdcrNm", null);
		
		// 품목
		SBUxMethod.set("dtl-slt-itemCd", null);
		// 품종
		SBUxMethod.set("dtl-slt-vrtyCd", null);
		// 입고구분
		SBUxMethod.set("dtl-rdo-wrhsSeCd", "3");
		// 상품구분
		SBUxMethod.set("dtl-rdo-gdsSeCd", "1");
		// 운송구분
		SBUxMethod.set("dtl-rdo-trsprtSeCd", "1");
		
		// 전체중량
		SBUxMethod.set("dtl-inp-wholWght", null);
		// 공차중량
		SBUxMethod.set("dtl-inp-emptVhclWght", null);
		// 감량 (%)
		SBUxMethod.set("dtl-inp-rdctRt", null);
		// 감량kg
		SBUxMethod.set("dtl-inp-rdcdWght", null);
		// 실중량
		SBUxMethod.set("dtl-inp-actlWght", null);
		// 차량번호
		SBUxMethod.set("dtl-inp-vhclno", null);
	}
	
    /**
     * @name fn_setGrdComAuth
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function(pageSize, pageNo) {

  		let apcCd = SBUxMethod.get("gsb-slt-apcCd");
  		let wrhsYmd = SBUxMethod.get("dtl-dtp-wrhsYmd");	// 계량일자
  		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("dtl-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");	// 품종
  		let wrhsSeCd = SBUxMethod.get("dtl-rdo-wrhsSeCd");	// 입고구분
  		let gdsSeCd = SBUxMethod.get("dtl-rdo-gdsSeCd");	// 상품구분
  		let trsprtSeCd = SBUxMethod.get("dtl-rdo-trsprtSeCd");	// 운송구분
  		
		const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncList.do", {
			apcCd: apcCd,
			wrhsYmd: wrhsYmd,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			wrhsSeCd: wrhsSeCd,
			gdsSeCd: gdsSeCd,
			trsprtSeCd: trsprtSeCd,
			
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
          
        const data = await postJsonPromise;
          
  		try {
          	
          	/** @type {number} **/
      		let totalRecordCount = 0;
      		
      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghYmd: item.wghYmd,
  						vhclno: item.vhclno,
  						prdcrCd: item.prdcrCd,
  						wholWght: item.wholWght,
  						emptVhclWght: item.emptVhclWght,
  						rdcdRt: item.rdcdRt,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxWght: item.bxWght,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);
  				
  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;	
  				}
  			});
          	
          	if (jsonWghPrfmnc.length > 0) {
          		if(grdWghPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdWghPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdWghPrfmnc.rebuild();
  				}else{
  					grdWghPrfmnc.refresh();
  				}
          	} else {
          		grdWghPrfmnc.setPageTotalCount(totalRecordCount);
          		grdWghPrfmnc.rebuild();
          	}
          	
          	document.querySelector('#listCount').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}
	 
	
	/** ui event */
	
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;	//SBUxMethod.get("srch-slt-itemCd");		
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
			gfn_setApcGrdsSBSelect('dtl-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급	
		]);
	}
	
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		console.log(prdcrNm);
		console.log("jsonPrdcr", jsonPrdcr);
		console.log(111);
		jsonPrdcrAutocomplete = gfn_getFrst(prdcrNm, jsonPrdcr, jsonPrdcrAutocomplete);
		console.log(222);
		console.log(jsonPrdcrAutocomplete);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }
	
	
</script>
</html>