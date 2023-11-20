<%
/**
 * @Class Name : invntrTrnsf.jsp
 * @Description : 재고이송조회 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.10.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 재고이송조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
				</div>
			</div>

			<div class="box-body">
			<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
			<!--[APC] END -->
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
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
							<th scope="row" class="th_bg">이송일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-trnsfYmdFrom" name="srch-dtp-trnsfYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-trnsfYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-trnsfYmdTo" name="srch-dtp-trnsfYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-trnsfYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">이송APC</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-trnsfApcCd"
									name="srch-slt-trnsfApcCd"
									class="form-control input-sm"
									jsondata-ref="jsonTrnsfApcCd"
								></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonComItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									uitype="text"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
								<sbux-input
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
									uitype="hidden"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button
									id="btnSrchVrty"
									name="btnSrchVrty"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vrty"
									onclick="fn_modalVrty"/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								/>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-warehouseSe"
									name="srch-slt-warehouseSe"
									class="form-control input-sm"
									jsondata-ref="jsonComWarehouse"
								/>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-gdsSe"
									name="srch-slt-gdsSe"
									class="form-control input-sm"
									jsondata-ref="jsonComGdsSeCd"
								/>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-wrhsSeCd"
									name="srch-slt-wrhsSeCd"
									class="form-control input-sm"
									jsondata-ref="jsonComWrhsSeCd"
								/>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">재고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-invntrSeCd"
									name="srch-slt-invntrSeCd"
									class="form-control input-sm"
									jsondata-ref="jsonComInvntrSeCd"
									onchange="fn_invvntrSeCdChg"
								/>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>이송 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdInvntrTrnsf" style="width:100%;height:508px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComItem			= [];	// 품목 		itemCd			검색
	var jsonComSpcfct		= [];	// 규격 		spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComWrhsSeCd		= [];	// 창고 		warehouseSeCd	검색
	var jsonComGdsSeCd		= [];	// 상품구분 	gdsSeCd			검색
	var jsonComWrhsSeCd		= [];	// 입고구분 	wrhsSeCd		검색
	var jsonComInvntrSeCd	= [];	// 재고구분	invntrSeCd		검색
	var jsonTrnsfApcCd		= [];	// 이송APC  	trnsfApcCd		검색

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createInvntrTrnsfGrid();

		SBUxMethod.set("srch-dtp-trnsfYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-trnsfYmdTo", gfn_dateToYmd(new Date()));

		fn_search();
	});

	const fn_dtpChange = function(){
		let trnsfYmdFrom = SBUxMethod.get("srch-dtp-trnsfYmdFrom");
		let trnsfYmdTo = SBUxMethod.get("srch-dtp-trnsfYmdTo");
		if(gfn_diffDate(trnsfYmdFrom, trnsfYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-trnsfYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-trnsfYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}


	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcInfoSBSelect('srch-slt-trnsfApcCd', 	jsonTrnsfApcCd, 	gv_selectedApcCd),						// 이송APC
			gfn_setComCdSBSelect('srch-slt-warehouseSe', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setComCdSBSelect('srch-slt-gdsSe', 			jsonComGdsSeCd, 	'GDS_SE_CD', 	gv_selectedApcCd),		// 상품구분
		 	gfn_setComCdSBSelect('srch-slt-invntrSeCd', 	jsonComInvntrSeCd, 	'INVNTR_SE_CD')							// 재고구분
		])

	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, "");
		} else {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	gv_selectedApcCd, itemCd);				// 규격
		}
	}

	const fn_invvntrSeCdChg = function(){
		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");

		if(invntrSeCd == 1){
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		}else{
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}
	}

	function fn_createInvntrTrnsfGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvntrTrnsf';
	    SBGridProperties.id = 'grdInvntrTrnsf'; //grdInvntrTrnsf
	    SBGridProperties.jsonref = 'jsonInvntrTrnsf'; //jsonInvntrTrnsf
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
        	{caption : ["선택", "선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['이송APC','이송APC'], 			ref: 'trnsfApcNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['이송일자','이송일자'], 			ref: 'trnsfYmd', 	width: '110px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['재고구분','재고구분'], 			ref: 'invntrSeNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['입고번호','입고번호'], 			ref: 'wrhsno', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['입고일자','입고일자'], 			ref: 'wrhsYmd', 	width: '110px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['등급','등급'], 					ref: 'grdNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['생산자','생산자'], 				ref: 'prdcrNm',	 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['품목','품목'], 					ref: 'itemNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['품종','품종'], 					ref: 'vrtyNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['규격','규격'], 					ref: 'spcfctNm', 	width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['상품구분','상품구분'], 			ref: 'gdsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['입고구분','입고구분'], 			ref: 'wrhsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['운송구분','운송구분'], 			ref: 'trsprtSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['창고','창고'], 					ref: 'warehouseSeNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['이송','수량'], 					ref: 'trnsfQntt', 	width: '60px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['이송','중량'], 					ref: 'trnsfWght', 	width: '80px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['확정여부','확정여부'], 			ref: 'cfmtnNm', 	width: '100px', type: 'output', style: 'text-align:center'}
        ];
        grdInvntrTrnsf = _SBGrid.create(SBGridProperties);

    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdInvntrTrnsf.exportLocalExcel("재고이송", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdInvntrTrnsf.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdInvntrTrnsf.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdInvntrTrnsf.setColHidden(grdInvntrTrnsf.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdInvntrTrnsf.getFixedCols(); i < grdInvntrTrnsf.getCols()-1; i++) {
   			grdInvntrTrnsf.setColHidden(i, false);
    	}
   	}

	//조회
    const fn_search = async function() {
    	grdInvntrTrnsf.rebuild();
    	let pageSize = grdInvntrTrnsf.getPageSize();
    	let pageNo = 1;

    	fn_callSelectGridList(pageSize, pageNo);
	}

	const fn_callSelectGridList = async function(pageSize, pageNo) {

		let trnsfYmdFrom	= SBUxMethod.get("srch-dtp-trnsfYmdFrom");
		let trnsfYmdTo 		= SBUxMethod.get("srch-dtp-trnsfYmdTo");
		let trnsfApcCd 		= SBUxMethod.get("srch-slt-trnsfApcCd");

		let itemCd			= SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd			= SBUxMethod.get("srch-inp-vrtyCd");
		let spcfctCd		= SBUxMethod.get("srch-slt-spcfctCd");
		let warehouseSeCd	= SBUxMethod.get("srch-slt-warehouseSe");
		let gdsSeCd			= SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd		= SBUxMethod.get("srch-slt-wrhsSeCd");
		let invntrSeCd		= SBUxMethod.get("srch-slt-invntrSeCd");
		console.log("vrtyCd", vrtyCd);

		const postJsonPromise = gfn_postJSON("/am/trnsf/selectTrnsfInvntrList.do", {
			  apcCd			: gv_selectedApcCd
			, trnsfYmdFrom	: trnsfYmdFrom
			, trnsfYmdTo	: trnsfYmdTo
			, trnsfApcCd	: trnsfApcCd
			, itemCd		: itemCd
			, vrtyCd		: vrtyCd
			, spcfctCd		: spcfctCd
			, warehouseSeCd	: warehouseSeCd
			, gdsSeCd		: gdsSeCd
			, wrhsSeCd		: wrhsSeCd
			, invntrSeCd	: invntrSeCd
          	// pagination
  	  		, pagingYn : 'Y'
  			, currentPageNo : pageNo
   		  	, recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonInvntrTrnsf.length = 0;
          	data.resultList.forEach((item, index) => {
          		let wrhsno ="";
          		if(item.invntrSeCd == "1"){
          			wrhsno = item.wrhsno
          		}
          		if(item.invntrSeCd == "2"){
          			wrhsno = item.sortno
          		}
          		if(item.invntrSeCd == "3"){
          			wrhsno = item.pckgno
          		}
          		const invntrTrnsf = {
          			  apcCd				: item.apcCd
          			, wrhsno			: wrhsno
          			, sortno			: item.sortno
          			, sortSn			: item.sortSn
          			, pckgno			: item.pckgno
          			, pckgSn			: item.pckgSn
          			, trnsfYmd			: item.trnsfYmd
          			, trnsfSn			: item.trnsfSn
          			, wrhsYmd			: item.wrhsYmd
          			, grdCd				: item.grdCd
          			, grdNm				: item.grdNm
          			, itemNm			: item.itemNm
          			, itemCd			: item.itemCd
          			, vrtyNm			: item.vrtyNm
          			, vrtyCd			: item.vrtyCd
          			, spcfctCd			: item.spcfctCd
          			, spcfctNm			: item.spcfctNm
          			, prdcrCd			: item.prdcrCd
          			, prdcrNm			: item.prdcrNm
          			, gdsSeNm			: item.gdsSeNm
          			, gdsSeCd			: item.gdsSeCd
          			, wrhsSeNm			: item.wrhsSeNm
          			, wrhsSeCd			: item.wrhsSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, invntrSeCd		: item.invntrSeCd
          			, invntrSeNm		: item.invntrSeNm
          			, trsprtSeCd		: item.trsprtSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, warehouseSeNm		: item.warehouseSeNm
          			, warehouseSeCd		: item.warehouseSeCd
          			, trnsfQntt			: item.trnsfQntt
          			, trnsfWght			: item.trnsfWght
          			, trnsfApcNm		: item.trnsfApcNm
          			, trnsfApcCd		: item.trnsfApcCd
          			, cfmtnNm			: item.cfmtnNm
          			, cfmtnCd			: item.cfmtnCd
  				}
  				jsonInvntrTrnsf.push(invntrTrnsf);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	if (jsonInvntrTrnsf.length > 0) {
          		if(grdInvntrTrnsf.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdInvntrTrnsf.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdInvntrTrnsf.rebuild();
  				}else{
  					grdInvntrTrnsf.refresh();
  				}
          	} else {
          		grdInvntrTrnsf.setPageTotalCount(totalRecordCount);
          		grdInvntrTrnsf.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }

	const fn_del = async function(){
		let grdRows = grdInvntrTrnsf.getCheckedRows(0);
    	let deleteList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdInvntrTrnsf.getRowData(nRow);
    		let cfmtnYn	= rowData.cfmtnYn;

			if(cfmtnYn == "Y"){
				gfn_comAlert("W0010", "이송확정", "이송실적")	// W0010 이미 {0}된 {1} 입니다.
				return;
			}

    		deleteList.push(rowData);

    	}

    	console.log("deleteList",deleteList)

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/trnsf/deleteTrnsfInvntrList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}
	


	// 품종 선택 팝업 호출
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}

 	$(function(){
 		$(".glyphicon").on("click", function(){
 			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
 		})
 	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>