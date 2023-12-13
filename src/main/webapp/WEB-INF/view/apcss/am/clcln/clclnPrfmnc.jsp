<%
 /**
  * @Class Name : clclnPrfmnc.jsp
  * @Description : 정산실적조회 화면
  * @author SI개발부
  * @since 2023.10.09
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.10.09   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 정산정보조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="초기화"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="조회"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">정산기준</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-clclnCrtrCd"
											name="srch-slt-clclnCrtrCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm input-sm-ast"
											jsondata-ref="jsonComClclnCrtrCd"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-clclnYmdFrom"
									name="srch-dtp-clclnYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-clclnYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-clclnYmdTo"
									name="srch-dtp-clclnYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-clclnYmdTo)"
								></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">확정여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-cfmtnYn"
											name="srch-slt-cfmtnYn"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonComCfmtnYn"
										></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_selectItem"
										></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									uitype="text"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcrCd"
									name="btnSrchPrdcrCD"
									uitype="modal"
									class="btn btn-xs btn-outline-dark"
									text="찾기" target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>정산 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clcln">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnPrfmnc" style="width:100%;height:544px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-prdcr"
	        name="modal-prdcr"
	        uitype="middle"
	        header-title="생산자 선택"
	        body-html-id="body-modal-prdcr"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:1100px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-vrty"
	        name="modal-vrty"
	        uitype="middle"
	        header-title="품종 선택"
	        body-html-id="body-modal-vrtyCrtr"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
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
	var jsonComClclnCrtrCd	= [];	// 정산기준 	clclnCrtr	검색
	var jsonComCfmtnYn		= [];

	/* 생산자 자동완성 */
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];

    /* SBGrid */
	var grdClclnPrfmnc;
    /* SBGrid Data (JSON) */
	var jsonClclnPrfmnc = [];


	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),		// 품목
			gfn_setApcVrtySBSelect('srch-inp-vrtyCd', 		jsonApcVrty, 		gv_selectedApcCd),		// 품종
			gfn_setComCdSBSelect('srch-slt-clclnCrtrCd', 	jsonComClclnCrtrCd, 'CLCLN_CRTR_CD'),		// 정산기준
			gfn_setComCdSBSelect('srch-slt-cfmtnYn', 		jsonComCfmtnYn, 	'CFMTN_YN'),			// 확정유무
		]);
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

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_clearForm();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_dtpChange = function(){
		let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
		let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");
		if(gfn_diffDate(clclnYmdFrom, clclnYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdClclnPrfmnc';
	    SBGridProperties.id = 'grdClclnPrfmnc';
	    SBGridProperties.jsonref = 'jsonClclnPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.paging = lv_paging;
        SBGridProperties.columns = [
			{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                hidden: true
            },
        	{caption: ["정산일자"], ref: 'clclnYmd', type:'output',  width:'120px', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ['생산자'], ref: 'prdcrNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['정산기준'], ref: 'clclnCrtrNm', width: '100px', type : 'output', style: 'text-align:center'},
            {caption: ['입고구분'], ref: 'wrhsSeNm', width: '80px', type : 'output', style: 'text-align:center'},
            {caption: ['상품구분'], ref: 'gdsSeNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품목'], ref: 'itemNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], ref: 'spcfctNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['등급'], ref: 'grdNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ["수량"], ref: 'qntt', type:'output',  width:'80px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["중량"], ref: 'wght', type:'output',  width:'100px',   style:'text-align:right',
            	format : {type:'number', rule:'#,### Kg'}
            },
            {caption: ["계산금액"], ref: 'rkngAmt', type:'output',  width:'100px',   style:'text-align:right',
            	format : {type:'number', rule:'#,### 원'}
            },
            {caption: ["확정금액"], ref: 'cfmtnAmt', type:'output',  width:'100px',   style:'text-align:right',
            	format : {type:'number', rule:'#,### 원'}
            },
            {caption: ['확정여부'], ref: 'cfmtnYnNm', width: '80px', type: 'output', style: 'text-align:center'},
            {caption: [""], ref: '_', type:'output', width:'1px'},
            {caption: ["정산순번"], ref: 'clclnSn', type:'output', hidden: true},
            {caption: ["생산자코드"], ref: 'prdcrCd', type:'output', hidden: true},
            {caption: ["정산기준코드"], ref: 'clclnCrtrCd', type:'output', hidden: true},
            {caption: ["입고구분코드"], ref: 'wrhsSeCd', type:'output', hidden: true},
            {caption: ["상품구분코드"], ref: 'gdsSeCd', type:'output', hidden: true},
            {caption: ["품목코드"], ref: 'itemCd', type:'output', hidden: true},
            {caption: ["품종코드"], ref: 'vrtyCd', type:'output', hidden: true},
            {caption: ["규격코드"], ref: 'spcfctCd', type:'output', hidden: true},
            {caption: ["등급코드"], ref: 'grdCd', type:'output', hidden: true},
        ];

        grdClclnPrfmnc = _SBGrid.create(SBGridProperties);
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
    	grdClclnPrfmnc.exportLocalExcel("정산정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdClclnPrfmnc.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdClclnPrfmnc.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdClclnPrfmnc.setColHidden(grdClclnPrfmnc.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdClclnPrfmnc.getFixedCols(); i < grdClclnPrfmnc.getCols()-1; i++) {
   			grdClclnPrfmnc.setColHidden(i, false);
    	}
   	}

	/**
	 * common button action
	 */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {

		let result = await Promise.all([
			fn_initSBSelect(),
			fn_getPrdcrs()
		]);

		fn_clearForm();
	}

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
	const fn_reset = function() {
		fn_clearForm();
	}

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		// set pagination
    	grdClclnPrfmnc.rebuild();
    	let pageSize = grdClclnPrfmnc.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonClclnPrfmnc.length = 0;
    	grdClclnPrfmnc.clearStatus();
    	fn_setGrdClclnPrfmnc(pageSize, pageNo);
	}

    /**
     * @name fn_setGrdClclnPrfmnc
     * @description 정산내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdClclnPrfmnc = async function(pageSize, pageNo) {

   		let clclnCrtrCd = SBUxMethod.get("srch-slt-clclnCrtrCd");	// 정산기준코드
   		let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");	// 정산일자 from
   		let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");		// 정산일자 to
   		let cfmtnYn = SBUxMethod.get("srch-slt-cfmtnYn");			// 확정여부

  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");			// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");				// 품종

		const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			clclnCrtrCd: clclnCrtrCd,
			clclnYmdFrom: clclnYmdFrom,
			clclnYmdTo: clclnYmdTo,
			cfmtnYn: cfmtnYn,
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

      		jsonClclnPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const clclnPrfmnc = {
          				rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						clclnYmd: item.clclnYmd,
  						clclnSn: item.clclnSn,
  						clclnCrtrCd: item.clclnCrtrCd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						vrtyCd: item.vrtyCd,
  						spcfctCd: item.spcfctCd,
  						wrhsSeCd: item.wrhsSeCd,
  						gdsSeCd: item.gdsSeCd,
  						qntt: item.qntt,
  						wght: item.wght,
  						rkngAmt: item.rkngAmt,
  						cfmtnAmt: item.cfmtnAmt,
  						cfmtnYn: item.cfmtnYn,
  						itemNm: item.itemNm,
  						vrtyNm: item.vrtyNm,
  						spcfctNm: item.spcfctNm,
  						clclnCrtrNm: item.clclnCrtrNm,
  						wrhsSeNm: item.wrhsSeNm,
  						gdsSeNm: item.gdsSeNm,
  						grdNm: item.grdNm,
  						cfmtnYnNm : item.cfmtnYnNm
  				}

          		jsonClclnPrfmnc.push(clclnPrfmnc);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonClclnPrfmnc.length > 0) {
          		if (grdClclnPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdClclnPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdClclnPrfmnc.rebuild();
  				} else {
  					grdClclnPrfmnc.refresh();
  				}
          	} else {
          		grdClclnPrfmnc.setPageTotalCount(totalRecordCount);
          		grdClclnPrfmnc.rebuild();
          	}

          	document.querySelector('#cnt-clcln').innerText = totalRecordCount;

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

 		// 일자
		SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-clclnYmd", gfn_dateToYmd(new Date()));

		// 정산기준
		SBUxMethod.set("srch-slt-clclnCrtrCd", null);
		// 품목
		SBUxMethod.set("srch-slt-itemCd", null);
		// 품종
		SBUxMethod.set("srch-inp-vrtyCd", "");
		SBUxMethod.set("srch-inp-vrtyNm", "");

		// 생산자
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");

		// 확정여부
		SBUxMethod.set("srch-slt-cfmtnYn", null);
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
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
 	 * @name fn_onKeyUpPrdcrNm
 	 * @description 생산자 팝업 호출
 	 */
 	const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
 	}

 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
 			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);	// 대표 품목코드
 			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyCd);	// 대표 품종코드
 			SBUxMethod.set("srch-inp-vrtyNm", prdcr.rprsVrtyNm);	// 대표 품종명
 			SBUxMethod.set("srch-slt-gdsSe", prdcr.gdsSeCd);		// 상품구분
 			SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.trsprtSeCd);	// 입고구분
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
 		}
 	}
 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-inp-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyCd);
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
				}
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
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
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